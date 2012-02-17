//===----------------------------------------------------------------------===//
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//


#include "llvm-xml-ir/OperandWriter.h"
#include "llvm-xml-ir/TypePrinting.h"
#include "llvm-xml-ir/SlotTracker.h"
#include "llvm-xml-ir/RawWriter.h"

#include <llvm/Constants.h>
#include <llvm/DerivedTypes.h>
#include <llvm/GlobalValue.h>
#include <llvm/ADT/SmallString.h>
#include <llvm/ADT/StringExtras.h>
#include <llvm/Support/raw_ostream.h>
#include <llvm/Support/ErrorHandling.h>
#include <llvm/Instructions.h>

#include <sstream>

using namespace llvm;

class XMLTagOutputHelper {
 public:
  XMLTagOutputHelper(const char *, XMLIROStream&);
  ~XMLTagOutputHelper();
 private:
  const char * m_tagName;
  XMLIROStream & m_out;
};

/// PrintLLVMName - Turn the specified name into an 'LLVM name', which is either
/// prefixed with % (if the string only contains simple characters) or is
/// surrounded with ""'s (if it has special chars in it).  Print it out.
void PrintLLVMName(XMLIROStream & Out, StringRef Name, PrefixType Prefix) {
  assert(!Name.empty() && "Cannot get empty name!");
  Out << "<Name>";

  std::string name;
  switch (Prefix) {
  default: llvm_unreachable("Bad prefix!");
  case NoPrefix:     break;
  case GlobalPrefix: name += "@"; break;
  case LabelPrefix:  break;
  case LocalPrefix:  name += "%"; break;
  }
  name += Name.str();

  RawWriter::write(name, Out);
  Out << "</Name>\n";
}

/// PrintLLVMName - Turn the specified name into an 'LLVM name', which is either
/// prefixed with % (if the string only contains simple characters) or is
/// surrounded with ""'s (if it has special chars in it).  Print it out.
void PrintLLVMName(XMLIROStream &Out, const Value *V) {
  PrintLLVMName(Out, V->getName(),
                isa<GlobalValue>(V) ? GlobalPrefix : LocalPrefix);
}

void PrintLLVMName(XMLIROStream &Out, const Value *V,
                   TypePrinting *TypePrinter,
                   SlotTracker *Machine,
                   const Module *Context) {
  WriteAsOperandInternal(Out, V, TypePrinter, Machine, Context);
}

void WriteConstantInternal(XMLIROStream &Out, const Constant *CV,
                           TypePrinting &TypePrinter,
                           SlotTracker *Machine,
                           const Module *Context) {
  if (const ConstantInt *CI = dyn_cast<ConstantInt>(CV)) {
    if (CI->getType()->isIntegerTy(1)) {
      Out << (CI->getZExtValue() ? "true" : "false");
      return;
    }
    std::string ival = CI->getValue().toString(10, true);
    RawWriter::writeRawInt(ival, Out);
    return;
  }

  if (const ConstantFP *CFP = dyn_cast<ConstantFP>(CV)) {
    if (&CFP->getValueAPF().getSemantics() == &APFloat::IEEEdouble ||
        &CFP->getValueAPF().getSemantics() == &APFloat::IEEEsingle) {
      // We would like to output the FP constant value in exponential notation,
      // but we cannot do this if doing so will lose precision.  Check here to
      // make sure that we only output it in exponential format if we can parse
      // the value back and get the same value.
      //
      bool ignored;
      bool isDouble = &CFP->getValueAPF().getSemantics()==&APFloat::IEEEdouble;
      double Val = isDouble ? CFP->getValueAPF().convertToDouble() :
                              CFP->getValueAPF().convertToFloat();
      SmallString<128> StrVal;
      raw_svector_ostream(StrVal) << Val;

      // Check to make sure that the stringized number is not some string like
      // "Inf" or NaN, that atof will accept, but the lexer will not.  Check
      // that the string matches the "[-+]?[0-9]" regex.
      //
      if ((StrVal[0] >= '0' && StrVal[0] <= '9') ||
          ((StrVal[0] == '-' || StrVal[0] == '+') &&
           (StrVal[1] >= '0' && StrVal[1] <= '9'))) {
        // Reparse stringized version!
        if (atof(StrVal.c_str()) == Val) {
          Out << StrVal.str();
          return;
        }
      }
      // Otherwise we could not reparse it to exactly the same value, so we must
      // output the string in hexadecimal format!  Note that loading and storing
      // floating point types changes the bits of NaNs on some hosts, notably
      // x86, so we must not use these types.
      assert(sizeof(double) == sizeof(uint64_t) &&
             "assuming that double is 64 bits!");
      char Buffer[40];
      APFloat apf = CFP->getValueAPF();
      // Floats are represented in ASCII IR as double, convert.
      if (!isDouble)
        apf.convert(APFloat::IEEEdouble, APFloat::rmNearestTiesToEven,
                          &ignored);
      Out << "0x" <<
              utohex_buffer(uint64_t(apf.bitcastToAPInt().getZExtValue()),
                            Buffer+40);
      return;
    }

    // Some form of long double.  These appear as a magic letter identifying
    // the type, then a fixed number of hex digits.
    Out << "0x";
    if (&CFP->getValueAPF().getSemantics() == &APFloat::x87DoubleExtended) {
      Out << 'K';
      // api needed to prevent premature destruction
      APInt api = CFP->getValueAPF().bitcastToAPInt();
      const uint64_t* p = api.getRawData();
      uint64_t word = p[1];
      int shiftcount=12;
      int width = api.getBitWidth();
      for (int j=0; j<width; j+=4, shiftcount-=4) {
        unsigned int nibble = (word>>shiftcount) & 15;
        if (nibble < 10)
          Out << (unsigned char)(nibble + '0');
        else
          Out << (unsigned char)(nibble - 10 + 'A');
        if (shiftcount == 0 && j+4 < width) {
          word = *p;
          shiftcount = 64;
          if (width-j-4 < 64)
            shiftcount = width-j-4;
        }
      }
      return;
    } else if (&CFP->getValueAPF().getSemantics() == &APFloat::IEEEquad)
      Out << 'L';
    else if (&CFP->getValueAPF().getSemantics() == &APFloat::PPCDoubleDouble)
      Out << 'M';
    else
      llvm_unreachable("Unsupported floating point type");
    // api needed to prevent premature destruction
    APInt api = CFP->getValueAPF().bitcastToAPInt();
    const uint64_t* p = api.getRawData();
    uint64_t word = *p;
    int shiftcount=60;
    int width = api.getBitWidth();
    for (int j=0; j<width; j+=4, shiftcount-=4) {
      unsigned int nibble = (word>>shiftcount) & 15;
      if (nibble < 10)
        Out << (unsigned char)(nibble + '0');
      else
        Out << (unsigned char)(nibble - 10 + 'A');
      if (shiftcount == 0 && j+4 < width) {
        word = *(++p);
        shiftcount = 64;
        if (width-j-4 < 64)
          shiftcount = width-j-4;
      }
    }
    return;
  }

  if (isa<ConstantAggregateZero>(CV)) {
    Out << "<Zeroinitializer/>";
    return;
  }

#if 0
  if (const BlockAddress *BA = dyn_cast<BlockAddress>(CV)) {
    Out << "blockaddress(";
    WriteAsOperandInternal(Out, BA->getFunction(), &TypePrinter, Machine,
                           Context);
    Out << ", ";
    WriteAsOperandInternal(Out, BA->getBasicBlock(), &TypePrinter, Machine,
                           Context);
    Out << ")";
    return;
  }

#endif

  if (const ConstantArray *CA = dyn_cast<ConstantArray>(CV)) {
    // As a special case, print the array as a string if it is an array of
    // i8 with ConstantInt values.
    //
    if (CA->isString()) {
      Out << "<ConstantString>";
      //PrintEscapedString(CA->getAsString(), Out);
      RawWriter::write(CA->getAsString(), Out);
      Out << "</ConstantString>";
    } else {                // Cannot output in string format...
      Out << "<ConstantArray>";
      Type *ETy = CA->getType()->getElementType();
      Out << "<ElementType>";
      TypePrinter.print(ETy, Out);
      Out << "</ElementType>\n";

      for (unsigned i = 0, e = CA->getNumOperands(); i != e; ++i) {
        WriteAsOperandInternal(Out, CA->getOperand(i), &TypePrinter, Machine,
                                 Context);
      }
      Out << "</ConstantArray>\n";
    }
    return;
  }

#if 0
  if (const ConstantStruct *CS = dyn_cast<ConstantStruct>(CV)) {
    if (CS->getType()->isPacked())
      Out << '<';
    Out << '{';
    unsigned N = CS->getNumOperands();
    if (N) {
      Out << ' ';
      TypePrinter.print(CS->getOperand(0)->getType(), Out);
      Out << ' ';

      WriteAsOperandInternal(Out, CS->getOperand(0), &TypePrinter, Machine,
                             Context);

      for (unsigned i = 1; i < N; i++) {
        Out << ", ";
        TypePrinter.print(CS->getOperand(i)->getType(), Out);
        Out << ' ';

        WriteAsOperandInternal(Out, CS->getOperand(i), &TypePrinter, Machine,
                               Context);
      }
      Out << ' ';
    }

    Out << '}';
    if (CS->getType()->isPacked())
      Out << '>';
    return;
  }

  if (const ConstantVector *CP = dyn_cast<ConstantVector>(CV)) {
    Type *ETy = CP->getType()->getElementType();
    assert(CP->getNumOperands() > 0 &&
           "Number of operands for a PackedConst must be > 0");
    Out << '<';
    TypePrinter.print(ETy, Out);
    Out << ' ';
    WriteAsOperandInternal(Out, CP->getOperand(0), &TypePrinter, Machine,
                           Context);
    for (unsigned i = 1, e = CP->getNumOperands(); i != e; ++i) {
      Out << ", ";
      TypePrinter.print(ETy, Out);
      Out << ' ';
      WriteAsOperandInternal(Out, CP->getOperand(i), &TypePrinter, Machine,
                             Context);
    }
    Out << '>';
    return;
  }
#endif

  if (isa<ConstantPointerNull>(CV)) {
    Out << "<Null/>";
    return;
  }

  if (isa<UndefValue>(CV)) {
    Out << "<Undef/>";
    return;
  }

  if (const ConstantExpr *CE = dyn_cast<ConstantExpr>(CV)) {
    Out << "<ConstantExpr>";
    // David TODO: this doesn't seem very nice:
    Out << "<Opcode>";
    RawWriter::write(CE->getOpcodeName(), Out);
    Out << "</Opcode>";

#if 0
    WriteOptimizationInfo(Out, CE);
#endif
    if (CE->isCompare())
      Out << "<Predicate>" << getPredicateText(CE->getPredicate()) << "</Predicate>";

    for (User::const_op_iterator OI=CE->op_begin(); OI != CE->op_end(); ++OI) {
      Out << "<Operand>";
      Out << "<Type>";
      TypePrinter.print((*OI)->getType(), Out);
      Out << "</Type>";
      WriteAsOperandInternal(Out, *OI, &TypePrinter, Machine, Context);
      Out << "</Operand>\n";
    }

    if (CE->hasIndices()) {
      ArrayRef<unsigned> Indices = CE->getIndices();
      for (unsigned i = 0, e = Indices.size(); i != e; ++i) {
        Out << "<Index>" << Indices[i] << "</Index>\n";
      }
    }

    if (CE->isCast()) {
      Out << "<Type>";
      TypePrinter.print(CE->getType(), Out);
      Out << "</Type>\n";
    }
          
    Out << "</ConstantExpr>";
    return;
  }

  assert (0 && "<placeholder or erroneous Constant>");
}

/// WriteAsOperand - Write the name of the specified value out to the specified
/// ostream.  This can be useful when you just want to print int %reg126, not
/// the whole instruction that generated it.
///
void WriteAsOperandInternal(XMLIROStream &Out, const Value *V,
                                   TypePrinting *TypePrinter,
                                   SlotTracker *Machine,
                                   const Module *Context) {

  XMLTagOutputHelper vhelper("Value", Out);

  if (V->hasName()) {
    PrintLLVMName(Out, V);
    return;
  }

  const Constant *CV = dyn_cast<Constant>(V);
  if (CV && !isa<GlobalValue>(CV)) {
    assert(TypePrinter && "Constants require TypePrinting!");
    WriteConstantInternal(Out, CV, *TypePrinter, Machine, Context);
    return;
  }

  XMLTagOutputHelper helper("Name", Out);

#if 0
  if (const InlineAsm *IA = dyn_cast<InlineAsm>(V)) {
    Out << "asm ";
    if (IA->hasSideEffects())
      Out << "sideeffect ";
    if (IA->isAlignStack())
      Out << "alignstack ";
    Out << '"';
    PrintEscapedString(IA->getAsmString(), Out);
    Out << "\", \"";
    PrintEscapedString(IA->getConstraintString(), Out);
    Out << '"';
    return;
  }

  if (const MDNode *N = dyn_cast<MDNode>(V)) {
    if (N->isFunctionLocal()) {
      // Print metadata inline, not via slot reference number.
      WriteMDNodeBodyInternal(Out, N, TypePrinter, Machine, Context);
      return;
    }

    if (!Machine) {
      if (N->isFunctionLocal())
        Machine = new SlotTracker(N->getFunction());
      else
        Machine = new SlotTracker(Context);
    }
    int Slot = Machine->getMetadataSlot(N);
    if (Slot == -1)
      Out << "<badref>";
    else
      Out << '!' << Slot;
    return;
  }

  if (const MDString *MDS = dyn_cast<MDString>(V)) {
    Out << "!\"";
    PrintEscapedString(MDS->getString(), Out);
    Out << '"';
    return;
  }

#endif

  if (V->getValueID() == Value::PseudoSourceValueVal ||
      V->getValueID() == Value::FixedStackPseudoSourceValueVal) {
    V->print(Out);
    return;
  }

  char Prefix = '%';
  int Slot;
  // If we have a SlotTracker, use it.
  if (Machine) {
    if (const GlobalValue *GV = dyn_cast<GlobalValue>(V)) {
      Slot = Machine->getGlobalSlot(GV);
      Prefix = '@';
    } else {
      Slot = Machine->getLocalSlot(V);

      // If the local value didn't succeed, then we may be referring to a value
      // from a different function.  Translate it, as this can happen when using
      // address of blocks.
      if (Slot == -1)
        if ((Machine = createSlotTracker(V))) {
          Slot = Machine->getLocalSlot(V);
          delete Machine;
        }
    }
  } else if ((Machine = createSlotTracker(V))) {
    // Otherwise, create one to get the # and then destroy it.
    if (const GlobalValue *GV = dyn_cast<GlobalValue>(V)) {
      Slot = Machine->getGlobalSlot(GV);
      Prefix = '@';
    } else {
      Slot = Machine->getLocalSlot(V);
    }
    delete Machine;
    Machine = 0;
  } else {
    Slot = -1;
  }

  std::stringstream Name;
  Name << Prefix << Slot;

  if (Slot != -1)
    RawWriter::write(Name.str(), Out);
  else
    Out << "<badref>";
}

const char *getPredicateText(unsigned predicate) {
  const char * pred = "unknown";
  switch (predicate) {
  case FCmpInst::FCMP_FALSE: pred = "false"; break;
  case FCmpInst::FCMP_OEQ:   pred = "oeq"; break;
  case FCmpInst::FCMP_OGT:   pred = "ogt"; break;
  case FCmpInst::FCMP_OGE:   pred = "oge"; break;
  case FCmpInst::FCMP_OLT:   pred = "olt"; break;
  case FCmpInst::FCMP_OLE:   pred = "ole"; break;
  case FCmpInst::FCMP_ONE:   pred = "one"; break;
  case FCmpInst::FCMP_ORD:   pred = "ord"; break;
  case FCmpInst::FCMP_UNO:   pred = "uno"; break;
  case FCmpInst::FCMP_UEQ:   pred = "ueq"; break;
  case FCmpInst::FCMP_UGT:   pred = "ugt"; break;
  case FCmpInst::FCMP_UGE:   pred = "uge"; break;
  case FCmpInst::FCMP_ULT:   pred = "ult"; break;
  case FCmpInst::FCMP_ULE:   pred = "ule"; break;
  case FCmpInst::FCMP_UNE:   pred = "une"; break;
  case FCmpInst::FCMP_TRUE:  pred = "true"; break;
  case ICmpInst::ICMP_EQ:    pred = "eq"; break;
  case ICmpInst::ICMP_NE:    pred = "ne"; break;
  case ICmpInst::ICMP_SGT:   pred = "sgt"; break;
  case ICmpInst::ICMP_SGE:   pred = "sge"; break;
  case ICmpInst::ICMP_SLT:   pred = "slt"; break;
  case ICmpInst::ICMP_SLE:   pred = "sle"; break;
  case ICmpInst::ICMP_UGT:   pred = "ugt"; break;
  case ICmpInst::ICMP_UGE:   pred = "uge"; break;
  case ICmpInst::ICMP_ULT:   pred = "ult"; break;
  case ICmpInst::ICMP_ULE:   pred = "ule"; break;
  }
  return pred;
}

XMLTagOutputHelper::XMLTagOutputHelper(const char * name, XMLIROStream & Out)
    : m_tagName(name)
    , m_out(Out)
{
  Out << "<" << m_tagName << ">";
}

XMLTagOutputHelper::~XMLTagOutputHelper() {
  m_out << "</" << m_tagName << ">\n";
}

