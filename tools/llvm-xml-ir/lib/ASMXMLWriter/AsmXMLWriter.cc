//===----------------------------------------------------------------------===//
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//


/*
 * Printing LLVM module into XML
 *
 * Derived from lib/VMCore/AsmWriter.cpp
 */

#include "llvm-xml-ir/XMLIROStream.h"
#include "llvm-xml-ir/SlotTracker.h"
#include "llvm-xml-ir/AsmXMLWriter.h"
#include "llvm-xml-ir/RawWriter.h"

#include <llvm/Constants.h>
#include <llvm/Function.h>
#include <llvm/Instructions.h>
#include <llvm/Module.h>
#include <llvm/Support/CFG.h>
#include <llvm/Support/InstVisitor.h>
#include <llvm/ADT/StringExtras.h>
#include <llvm/ADT/SmallString.h>
#include <sstream>

// things we added
#include <llvm/Operator.h>
#include <llvm/Support/Casting.h>

namespace llvm {

// We operate on opaque instruction classes, so forward declare all instruction
// types now...
//
#define HANDLE_INST(NUM, OPCODE, CLASS)   class CLASS;
#include "llvm-xml-ir/Operator.def"
}

using namespace llvm;

#if 0
template <class T>
struct InstructionTrait {
  static void printTrait(XMLIROStream &, const T &) {}
};

template<>
struct InstructionTrait<LoadInst> {
  static void printTrait(XMLIROStream & Out, const LoadInst & LI) {
    printAlignment(Out, LI);
  }
};
#endif

class AsmXMLWriter {
 public:
  void visit(const Module &);
  AsmXMLWriter(raw_ostream &, const Module *);

 private:
  // Generic visit method - Allow visitation to all instructions in a range
  template<class Iterator>
  void visit(Iterator Start, Iterator End) {
    while (Start != End)
      visit(*Start++);
  }

  void visit(const GlobalVariable &);
  void visit(const Function &);
  void visit(const BasicBlock &);
  void visit(const Argument &);
  void visit(const Instruction &);

  // unimplemented instructions
  void visitIndirectBr(const IndirectBrInst &)         { assert (0 && "visitIndirectBr Unimplemented"); }
  void visitInvoke(const InvokeInst &)                 { assert (0 && "visitInvoke Unimplemented"); }
  void visitUnwind(const UnwindInst &)                 { assert (0 && "visitUnwind Unimplemented"); }
  void visitResume(const ResumeInst &)                 { assert (0 && "visitResume Unimplemented"); }
  void visitFence(const FenceInst &)                   { assert (0 && "visitFence Unimplemented"); }
  void visitAtomicCmpXchg(const AtomicCmpXchgInst &)   { assert (0 && "visitAtomicCmpXchg Unimplemented"); }
  void visitAtomicRMW(const AtomicRMWInst &)           { assert (0 && "visitAtomicRMW Unimplemented"); }
  void visitExtractElement(const ExtractElementInst &) { assert (0 && "visitExtractElement Unimplemented"); }
  void visitInsertElement(const InsertElementInst &)   { assert (0 && "visitInsertElement Unimplemented"); }
  void visitShuffleVector(const ShuffleVectorInst &)   { assert (0 && "visitShuffleVector Unimplemented"); }
  void visitExtractValue(const ExtractValueInst &)     { assert (0 && "visitExtractValue Unimplemented"); }
  void visitInsertValue(const InsertValueInst &)       { assert (0 && "visitInsertValue Unimplemented"); }
  void visitLandingPad(const LandingPadInst &)         { assert (0 && "visitLandingPad Unimplemented"); }
  void visitVAArg(const VAArgInst &)                   { assert (0 && "visitVAArg Unimplemented"); }
  void visitUserOp1(const Instruction &)               { assert (0 && "visitUserOp1 Unimplemented"); }
  void visitUserOp2(const Instruction &)               { assert (0 && "visitUserOp2 Unimplemented"); }

  // instructions with special cases
  void visitRet(const ReturnInst &);
  void visitBr(const BranchInst &);
  void visitSwitch(const SwitchInst &);
  void visitAlloca(const AllocaInst &);
  void visitLoad(const LoadInst &);
  void visitStore(const StoreInst &);
  void visitGetElementPtr(const GEPOperator &);
  void visitPHI(const PHINode &);
  void visitCall(const CallInst &);

  // instructions implemented using printOperatorBody
  void visitAdd      (const Operator &I) { printOperatorBody(I); }
  void visitFAdd     (const Operator &I) { printOperatorBody(I); }
  void visitSub      (const Operator &I) { printOperatorBody(I); }
  void visitFSub     (const Operator &I) { printOperatorBody(I); }
  void visitMul      (const Operator &I) { printOperatorBody(I); }
  void visitFMul     (const Operator &I) { printOperatorBody(I); }
  void visitUDiv     (const Operator &I) { printOperatorBody(I); }
  void visitSDiv     (const Operator &I) { printOperatorBody(I); }
  void visitFDiv     (const Operator &I) { printOperatorBody(I); }
  void visitURem     (const Operator &I) { printOperatorBody(I); }
  void visitSRem     (const Operator &I) { printOperatorBody(I); }
  void visitFRem     (const Operator &I) { printOperatorBody(I); }
  void visitShl      (const Operator &I) { printOperatorBody(I); }
  void visitLShr     (const Operator &I) { printOperatorBody(I); }
  void visitAShr     (const Operator &I) { printOperatorBody(I); }
  void visitAnd      (const Operator &I) { printOperatorBody(I); }
  void visitOr       (const Operator &I) { printOperatorBody(I); }
  void visitXor      (const Operator &I) { printOperatorBody(I); }
  void visitTrunc    (const Operator &I) { printOperatorBody(I); }
  void visitZExt     (const Operator &I) { printOperatorBody(I); }
  void visitSExt     (const Operator &I) { printOperatorBody(I); }
  void visitFPToUI   (const Operator &I) { printOperatorBody(I); }
  void visitFPToSI   (const Operator &I) { printOperatorBody(I); }
  void visitUIToFP   (const Operator &I) { printOperatorBody(I); }
  void visitSIToFP   (const Operator &I) { printOperatorBody(I); }
  void visitFPTrunc  (const Operator &I) { printOperatorBody(I); }
  void visitFPExt    (const Operator &I) { printOperatorBody(I); }
  void visitPtrToInt (const Operator &I) { printOperatorBody(I); }
  void visitIntToPtr (const Operator &I) { printOperatorBody(I); }
  void visitBitCast  (const Operator &I) { printOperatorBody(I); }

  // same as above, but don't print the type
  void visitUnreachable(const Operator &I) { printOperatorBody(I, false); }
  void visitSelect(const Operator &I)      { printOperatorBody(I, false); }

  // comparisons
  void visitICmp(const Operator &I) { printCmpBody(I); }
  void visitFCmp(const Operator &I) { printCmpBody(I); }


  // printing methods

  // Print an operator. This method calls the visitOPCODE methods.
  void printOperator(const Operator &);

  // Print operator bodies
  void printOperatorBody(const Operator &, bool includeType = true);
  void printCmpBody(const Operator &);

  void printOperand(const Value *, bool includeType = true);
  template <class Iterator>
  void printOperandList(Iterator, Iterator);

  void printModifiers(const Operator &);
  template<class T>
  void printAlignment(const T &);

  enum PrefixType {
    GlobalPrefix,
    LabelPrefix,
    LocalPrefix,
    NoPrefix
  };

  /// printLLVMName - Turn the specified name into an 'LLVM name', which is either
  /// prefixed with % (if the string only contains simple characters) or is
  /// surrounded with ""'s (if it has special chars in it).  Print it out.
  void printLLVMName(StringRef, PrefixType);
  void printLLVMName(const Value *);
  void printLLVMName(const Value *, const Module *);

  void printValue(const Value *, const Module *);
  void printConstant(const Constant *, const Module *);

  void printType(Type *);
  void printStructBody(StructType *);
  void printTypeIdentities();

  // misc methods
  void incorporateTypes(const Module &);

  const char *getPredicateText(unsigned);

  /// NamedTypes - The named types that are used by the current module.
  std::vector<StructType*> NamedTypes;

  /// NumberedTypes - The numbered types, along with their value.
  DenseMap<StructType*, unsigned> NumberedTypes;

  XMLIROStream Out;
  const Module *TheModule;
  SlotTracker *Machine;
};

char AsmXMLWriterPass::ID = 0;

AsmXMLWriterPass::AsmXMLWriterPass(raw_ostream &o)
    : ModulePass(ID)
    , m_out(o)
{}

bool AsmXMLWriterPass::runOnModule(Module &M) {
  AsmXMLWriter writer(m_out, &M);
  writer.visit(M);
  return false;
}

AsmXMLWriter::AsmXMLWriter(raw_ostream & o, const Module *M)
    : Out(o)
    , TheModule(M)
    , Machine(new SlotTracker(M))
{}

void AsmXMLWriter::visit(const Module &M) {
  Out << "<?xml version=\"1.0\"?>\n";

  Out << "<Module>\n";

  Out << "<ModuleID>";
  if (!M.getModuleIdentifier().empty()) {
    RawWriter::write(M.getModuleIdentifier(), Out);
  } else {
    RawWriter::write("#NoModuleId", Out);
    // TODO maybe generate unique id, or something else.  going to be problematic if we have multiple nonamed modules
  }
  Out << "</ModuleID>\n";

  Out << "<TargetLayout>";
  if (!M.getDataLayout().empty()) {
    RawWriter::write(M.getDataLayout(), Out);
  } else {
    RawWriter::write("", Out);
  }
  Out << "</TargetLayout>\n";

  Out << "<TargetTriple>";
  if (!M.getTargetTriple().empty()) {
    RawWriter::write(M.getTargetTriple(), Out);
  } else {
    RawWriter::write("", Out);
  }
  Out << "</TargetTriple>\n";

  incorporateTypes(M);
  printTypeIdentities();

  // Output all globals.
  Out << "<GlobalVariables><List>\n";
  visit(M.global_begin(), M.global_end());
  Out << "</List></GlobalVariables>\n";

  // Output all of the functions.
  Out << "<Functions><List>\n";
  visit(M.begin(), M.end());
  Out << "</List></Functions>\n";

  Out << "</Module>\n";
}

void AsmXMLWriter::visit(const Function &F) {
  if (F.isDeclaration()) {
    Out << "<FunctionDecl>";
  } else {
    Out << "<FunctionDef>";
  }

#if 0
  PrintLinkage(F.getLinkage(), Out);
  PrintVisibility(F.getVisibility(), Out);
#endif

  Out << "<ReturnType>";
  printType(F.getReturnType());
  Out << "</ReturnType>\n";
  printValue(&F, F.getParent());

  FunctionType *FT = F.getFunctionType();
  Out << "<Arguments><List>\n";
  visit(F.arg_begin(), F.arg_end());
  if (FT->isVarArg())
    Out << "<Vararg/>\n";
  Out << "</List></Arguments>\n";

  if (!F.isDeclaration()) {
    Out << "<Body><List>";
    // visit the list of basic blocks
    visit(F.begin(), F.end());
    Out << "</List></Body>";
  }

  if (F.isDeclaration()) {
    Out << "</FunctionDecl>\n";
  } else {
    Out << "</FunctionDef>\n";
  }
}

void AsmXMLWriter::visit(const GlobalVariable &GV) {
  Out << "<GlobalVariable>";
  printLLVMName(&GV, GV.getParent());

  Out << "<Modifiers><List>";

#if 0
  if (GV->isThreadLocal()) Out << "thread_local ";
  if (unsigned AddressSpace = GV->getType()->getAddressSpace())
    Out << "addrspace(" << AddressSpace << ") ";
  if (GV->hasUnnamedAddr()) Out << "unnamed_addr ";

  if (GV->hasSection()) {
    Out << ", section \"";
    PrintEscapedString(GV->getSection(), Out);
    Out << '"';
  }
  if (GV->getAlignment())
    Out << ", align " << GV->getAlignment();
#endif

  if (GV.isConstant())
    Out << "<Constant/>\n";

  Out << "</List></Modifiers>\n";

  printType(GV.getType());

  Out << "<Initializer>";
  if (GV.hasInitializer()) {
    printOperand(GV.getInitializer(), true);
  }
  Out << "</Initializer>\n";

  Out << "</GlobalVariable>\n";
}

void AsmXMLWriter::visit(const Argument &Arg) {
  Out << "<Arg>";
  printType(Arg.getType());

  // Output name, if available...
  if (!Arg.getParent()->isDeclaration() && Arg.hasName()) {
    printLLVMName(&Arg);
  } else {
    Out << "<NoName/>\n";
  }

  Out << "</Arg>";
}

void AsmXMLWriter::visit(const BasicBlock &BB) {
  BasicBlock *BBp = const_cast<BasicBlock*>(&BB);
  Out << "<BasicBlock>";

  // ensure all basic blocks have a name
  if (!BB.hasName())
    BBp->setName(Twine("default"));
  printLLVMName(&BB);

  Out << "<Instructions><List>\n";
  visit(BB.begin(), BB.end());
  Out << "</List></Instructions>\n";
  Out << "</BasicBlock>\n";
}

void AsmXMLWriter::visit(const Instruction &I) {
  if (!I.getType()->isVoidTy()) {
    Out << "<Assign>\n";
    printLLVMName(&I, I.getParent()->getParent()->getParent());
  }
  Out << "<Instruction>\n";
  printOperator(cast<Operator>(I));
  Out << "</Instruction>\n";
  if (!I.getType()->isVoidTy()) {
    Out << "</Assign>\n";
  }
}

void AsmXMLWriter::visitBr(const BranchInst &BI) {
  if (BI.isConditional()) {
    Out << "<Conditional>";
  } else {
    Out << "<Unconditional>";
  }

  // TODO excluding types for both branches
  printOperand(BI.getOperand(0), false);
  if (BI.isConditional()) {
    printOperand(BI.getOperand(2), false);
    printOperand(BI.getOperand(1), false);
    Out << "</Conditional>";
  } else {
    Out << "</Unconditional>";
  }
}

void AsmXMLWriter::visitAlloca(const AllocaInst &AI) {
  printType(AI.getType()->getElementType());
  Out << "<Operand>";
  printOperand(AI.getArraySize(), true);
  Out << "</Operand>";
}

void AsmXMLWriter::visitCall(const CallInst &CI) {
  printType(CI.getType());

  Out << "<Callee>";
  printValue(CI.getCalledValue(), CI.getParent()->getParent()->getParent());

  Out << "<Arguments><List>";
  printOperandList(CI.op_begin(), CI.op_begin() + CI.getNumArgOperands());
  Out << "</List></Arguments>\n";
  Out << "</Callee>\n";
}

void AsmXMLWriter::visitStore(const StoreInst &SI) {
  printType(SI.getValueOperand()->getType());
  printOperandList(SI.op_begin(), SI.op_end());
}

void AsmXMLWriter::visitLoad(const LoadInst &LI) {
  printType(LI.getPointerOperand()->getType());
  printOperandList(LI.op_begin(), LI.op_end());
}

void AsmXMLWriter::visitRet(const ReturnInst &I) {
  // TypePrinter.print(SI.getPointerOperand()->getType(), Out);
  // printOperandList(SI.op_begin(), SI.op_end());
  Out << "<Operand>";
  printOperand(I.getReturnValue(), true);
  Out << "</Operand>";
}

void AsmXMLWriter::visitGetElementPtr(const GEPOperator &I) {
  printType(I.getPointerOperandType());
  Out << "<Operand>";
  printOperand(I.getPointerOperand(), true);
  Out << "</Operand>\n";
  Out << "<List>\n";
  printOperandList(I.idx_begin(), I.idx_end());
  Out << "</List>\n";
}

void AsmXMLWriter::visitPHI(const PHINode &PN) {
  printType(PN.getType());

  Out << "<List>";
  for (unsigned op = 0, Eop = PN.getNumIncomingValues(); op < Eop; ++op) {
    Out << "<Edge>";
    printOperand(PN.getIncomingValue(op), false);
    printOperand(PN.getIncomingBlock(op), false);
    Out << "</Edge>\n";
  }
  Out << "</List>";
}

void AsmXMLWriter::visitSwitch(const SwitchInst &SI) {
  // Special case switch instruction to get formatting nice and correct.
  printType(SI.getCondition()->getType());
  //Out << "<Condition>";
  Out << "<Operand>";
  printOperand(SI.getCondition(), true);
  Out << "</Operand>\n";
  //Out << "</Condition>\n";
  //Out << "<DefaultDest>";
  // Out << "<Operand>";
  printOperand(SI.getDefaultDest(), false);
  // Out << "</Operand>\n";
  //Out << "</DefaultDest>\n";
  Out << "<Arguments><List>\n";
  unsigned NumCases = SI.getNumCases();
  for (unsigned i = 1; i < NumCases; ++i) {
    Out << "<Case>";
    // Out << "<Value>";
    Out << "<Operand>";
    printOperand(SI.getCaseValue(i), true);
    Out << "</Operand>\n";
    // Out << "</Value>\n";
    // Out << "<Successor>";
    // Out << "<Operand>";
    printOperand(SI.getSuccessor(i), false);
    // Out << "</Operand>\n";
    // Out << "</Successor>\n";
    Out << "</Case>\n";
  }
  Out << "</List></Arguments>\n";
}

void AsmXMLWriter::printOperator(const Operator &I) {
  switch (I.getOpcode()) {
    default: llvm_unreachable("Unknown instruction type encountered!");
    // Build the switch statement using the Instruction.def file...
#define HANDLE_INST(NUM, OPCODE, CLASS)         \
    case Instruction::OPCODE: \
      Out << "<Modifiers><List>\n"; \
      printModifiers(I); \
      Out << "</List></Modifiers>\n"; \
      Out << "<" #OPCODE ">"; \
      visit##OPCODE(cast<const CLASS>(I)); \
      Out << "</" #OPCODE ">\n"; \
      break ;
#include "llvm-xml-ir/Operator.def"
  }
}

void AsmXMLWriter::printOperatorBody(const Operator &I, bool includeType) {
  if (includeType) {
    printType(I.getType());
  }
  printOperandList(I.op_begin(), I.op_end());
}

void AsmXMLWriter::printCmpBody(const Operator &I) {
  unsigned predicate = 0;
  if (const CmpInst *CI = dyn_cast<CmpInst>(&I)) {
    predicate = CI->getPredicate();
  } else if (const ConstantExpr *CE = dyn_cast<ConstantExpr>(&I)) {
    predicate = CE->getPredicate();
  }
  Out << "<Predicate>" ;
  RawWriter::write(getPredicateText(predicate), Out);
  Out << "</Predicate>";
  printType(I.getOperand(0)->getType());
  printOperandList(I.op_begin(), I.op_end());
}

void AsmXMLWriter::printOperand(const Value *Operand, bool includeType) {
  if (Operand == 0) {
    Out << "<VoidType/>";
    Out << "<VoidValue/>";
    return;
  }

  if (includeType) {
    printType(Operand->getType());
  }

  printValue(Operand, TheModule);
}

template <class Iterator>
void AsmXMLWriter::printOperandList(Iterator Start, Iterator End) {
  while (Start != End) {
    Out << "<Operand>";
    printOperand(*Start++, true);
    Out << "</Operand>\n";
  }
}

void AsmXMLWriter::printModifiers(const Operator &I) {
  if (const OverflowingBinaryOperator *OBI = dyn_cast<OverflowingBinaryOperator>(&I)) {
    if (OBI->hasNoSignedWrap())
      Out << "<NoSignedWrap/>\n";
    if (OBI->hasNoUnsignedWrap())
      Out << "<NoUnsignedWrap/>\n";
  }

  if (const StoreInst *SI = dyn_cast<StoreInst>(&I)) {
    printAlignment(*SI);
  }

  if (const LoadInst *LI = dyn_cast<LoadInst>(&I)) {
    printAlignment(*LI);
  }

  if (const AllocaInst *AI = dyn_cast<AllocaInst>(&I)) {
    printAlignment(*AI);
  }
}

template <class T>
void AsmXMLWriter::printAlignment(const T &I) {
  if (I.getAlignment()) {
    Out << "<Alignment>";
    RawWriter::write(I.getAlignment(), Out);
    Out << "</Alignment>\n";
  }
}

/// printLLVMName - Turn the specified name into an 'LLVM name', which is either
/// prefixed with % (if the string only contains simple characters) or is
/// surrounded with ""'s (if it has special chars in it).  Print it out.
void AsmXMLWriter::printLLVMName(StringRef Name, PrefixType Prefix) {
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

/// printLLVMName - Turn the specified name into an 'LLVM name', which is either
/// prefixed with % (if the string only contains simple characters) or is
/// surrounded with ""'s (if it has special chars in it).  Print it out.
void AsmXMLWriter::printLLVMName(const Value *V) {
  printLLVMName(V->getName(),
                isa<GlobalValue>(V) ? GlobalPrefix : LocalPrefix);
}

void AsmXMLWriter::printLLVMName(const Value *V, const Module *Context) {
  printValue(V, Context);
}

void AsmXMLWriter::printConstant(const Constant *CV, const Module *Context) {
  if (const ConstantInt *CI = dyn_cast<ConstantInt>(CV)) {
    // if (CI->getType()->isIntegerTy(1)) {
      // Out << (CI->getZExtValue() ? "true" : "false");
      // return;
    // }
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

  if (const BlockAddress *BA = dyn_cast<BlockAddress>(CV)) {
    assert (0 && "Not handling BlockAddress");
    
    // Out << "blockaddress(";
    // printValue(Out, BA->getFunction(), &TypePrinter, Machine,
                           // Context);
    // Out << ", ";
    // printValue(Out, BA->getBasicBlock(), &TypePrinter, Machine,
                           // Context);
    // Out << ")";
    // return;
  }

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
      // Out << "<ElementType>";
      printType(ETy);
      // Out << "</ElementType>\n";
      Out << "<Arguments><List>\n";
      for (unsigned i = 0, e = CA->getNumOperands(); i != e; ++i) {
        printValue(CA->getOperand(i), Context);
      }
      Out << "</List></Arguments>\n";
      Out << "</ConstantArray>\n";
    }
    return;
  }


  if (const ConstantStruct *CS = dyn_cast<ConstantStruct>(CV)) {
    // assert (0 && "Not handling ConstantStruct");
    
    Out << "<ConstantStruct>\n";
     
    Out << "<Modifiers><List>\n";
    if (CS->getType()->isPacked()) {
      Out << "<Packed/>";
    }
    Out << "</List></Modifiers>\n";
    Out << "<Arguments><List>";
    unsigned N = CS->getNumOperands();
    for (unsigned i = 0; i < N; i++) {
      Out << "<Operand>";
      printOperand(CS->getOperand(i), true);
      // TypePrinter.print(CS->getOperand(i)->getType(), Out);
      // printValue(Out, CS->getOperand(i), &TypePrinter, Machine, Context);
      Out << "</Operand>";
    }
    Out << "</List></Arguments>";
    Out << "</ConstantStruct>\n";
    return;
  }

  if (const ConstantVector *CP = dyn_cast<ConstantVector>(CV)) {
    assert (0 && "Not handling ConstantVector");
    
    // Type *ETy = CP->getType()->getElementType();
    // assert(CP->getNumOperands() > 0 &&
           // "Number of operands for a PackedConst must be > 0");
    // Out << '<';
    // TypePrinter.print(ETy, Out);
    // Out << ' ';
    // printValue(Out, CP->getOperand(0), &TypePrinter, Machine,
                           // Context);
    // for (unsigned i = 1, e = CP->getNumOperands(); i != e; ++i) {
      // Out << ", ";
      // TypePrinter.print(ETy, Out);
      // Out << ' ';
      // printValue(Out, CP->getOperand(i), &TypePrinter, Machine,
                             // Context);
    // }
    // Out << '>';
    // return;
  }

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
    printOperator(cast<Operator>(*CE));
    Out << "</ConstantExpr>";
    return;
  }

  assert (0 && "<placeholder or erroneous Constant>");
}

class XMLTagOutputHelper {
 public:
  XMLTagOutputHelper(const char *, XMLIROStream&);
  ~XMLTagOutputHelper();
 private:
  const char * m_tagName;
  XMLIROStream & m_out;
};

XMLTagOutputHelper::XMLTagOutputHelper(const char *name, XMLIROStream &Out)
    : m_tagName(name)
    , m_out(Out)
{
  Out << "<" << m_tagName << ">";
}

XMLTagOutputHelper::~XMLTagOutputHelper() {
  m_out << "</" << m_tagName << ">\n";
}

void AsmXMLWriter::printValue(const Value *V, const Module *Context) {

  XMLTagOutputHelper vhelper("Value", Out);

  if (V->hasName()) {
    printLLVMName(V);
    return;
  }

  const Constant *CV = dyn_cast<Constant>(V);
  if (CV && !isa<GlobalValue>(CV)) {
    //assert(TypePrinter && "Constants require TypePrinting!");
    printConstant(CV, Context);
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
          Machine = 0;
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

void AsmXMLWriter::printType(Type *Ty) {
  switch (Ty->getTypeID()) {
    case Type::VoidTyID:
      Out << "<VoidType/>";
      break;
    case Type::FloatTyID:
      Out << "<FloatType/>";
      break;
    case Type::DoubleTyID:
      Out << "<DoubleType/>";
      break;
    case Type::X86_FP80TyID:
      Out << "<X86FP80Type/>";
      break;
    case Type::FP128TyID:
      Out << "<FP128Type/>";
      break;
    case Type::PPC_FP128TyID:
      Out << "<PPCFP128Type/>";
      break;
    case Type::LabelTyID:
      Out << "<LabelType/>";
      break;
    case Type::MetadataTyID:
      Out << "<MetaDataType/>";
      break;
    case Type::X86_MMXTyID:
      Out << "<X86MMXType/>";
      break;
    case Type::IntegerTyID:
      Out << "<IntegerType><Width>";
      RawWriter::write(cast<IntegerType>(Ty)->getBitWidth(), Out);
      Out << "</Width></IntegerType>";
      break;

    case Type::StructTyID: {
      StructType *STy = cast<StructType>(Ty);
      if (STy->isLiteral())
        assert (0 && "struct literal typeID unimplemented");

      if (!STy->getName().empty()) {
        Out << "<NamedType>";
        printLLVMName(STy->getName(), LocalPrefix);
        Out << "</NamedType>";
        break;
      }

      assert (0 && "misc. structTyID unimplemented");
      //DenseMap<StructType*, unsigned>::iterator I = NumberedTypes.find(STy);
      //if (I != NumberedTypes.end())
      //  Out << '%' << I->second;
      //else  // Not enumerated, print the hex address.
      //  Out << "%\"type 0x" << STy << '\"';
    }
      //assert (0 && "unimplemented");
#if 0
 {
      StructType *STy = cast<StructType>(Ty);
      if (STy->isLiteral())
        return printStructBody(STy, Out);

      if (!STy->getName().empty())
        return printLLVMName(OS, STy->getName(), LocalPrefix);

      DenseMap<StructType*, unsigned>::iterator I = NumberedTypes.find(STy);
      if (I != NumberedTypes.end())
        Out << '%' << I->second;
      else  // Not enumerated, print the hex address.
        Out << "%\"type 0x" << STy << '\"';
 }
#endif

    case Type::FunctionTyID: {
      FunctionType *FTy = cast<FunctionType>(Ty);
      Out << "<FunctionType vararg=\""
          << FTy->isVarArg() << "\">";
      Out << "<ReturnType>";
      printType(FTy->getReturnType());
      Out << "</ReturnType>\n";
      Out << "<Types><List>\n";
      for (FunctionType::param_iterator I = FTy->param_begin(), E = FTy->param_end(); I != E; ++I) {
        printType(*I);
      }
      if (FTy->isVarArg()) {
        Out << "<VarargType/>\n";
      }
      Out << "</List></Types>\n";
      Out << "</FunctionType>\n";
      break;
    }

    case Type::VectorTyID:
      assert (0 && "Vector TypeId unimplemented");
      /* Not implemented yet */
      break;

    case Type::PointerTyID: {
      PointerType *PTy = cast<PointerType>(Ty);
      Out << "<PointerType>";
      printType(PTy->getElementType());
      Out << "</PointerType>\n";
      break;
    }

    case Type::ArrayTyID: {
      Out << "<ArrayType>";
      ArrayType *ATy = cast<ArrayType>(Ty);
      printType(ATy->getElementType());
      RawWriter::write(ATy->getNumElements(), Out);
      Out << "</ArrayType>\n";
      break;
    }

    default:
      Out << "<unrecognized-type/>";
      break;
  }
}
void AsmXMLWriter::printStructBody(StructType *STy) {
  if (STy->isOpaque()) {
    Out << "<Opaque/>\n";
    return;
  }

  Out << "<Modifiers><List>\n";
  if (STy->isPacked()) {
    Out << "<Packed/>\n";
  }
  Out << "</List></Modifiers>\n";
  
  Out << "<StructType><Fields><List>\n";
  for (StructType::element_iterator I = STy->element_begin(), E = STy->element_end(); I != E; ++I) {
    printType(*I);
  }
  Out << "</List></Fields></StructType>";
}

void AsmXMLWriter::printTypeIdentities() {
  Out << '\n';

  // We know all the numbers that each type is used and we know that it is a
  // dense assignment.  Convert the map to an index table.
  std::vector<StructType*> NT(NumberedTypes.size());
  for (DenseMap<StructType*, unsigned>::iterator I =
       NumberedTypes.begin(), E = NumberedTypes.end();
       I != E; ++I) {
    assert(I->second < NumberedTypes.size() && "Didn't get a dense numbering?");
    NT[I->second] = I->first;
  }

  // Emit all numbered types.
  for (unsigned i = 0, e = NT.size(); i != e; ++i) {
    assert(0 && "Didn't expect numbered types\n");
    // Out << '%' << i << " = type ";

    // // Make sure we print out at least one level of the type structure, so
    // // that we do not get %2 = type %2
    // printStructBody(NT[i]);
    // Out << '\n';
  }

  Out << "<Typedefs><List>\n";
  for (unsigned i = 0, e = NamedTypes.size(); i != e; ++i) {
    Out << "<Typedef>";
    printLLVMName(NamedTypes[i]->getName(), LocalPrefix);
    // Make sure we print out at least one level of the type structure, so
    // that we do not get %FILE = type %FILE
    printStructBody(NamedTypes[i]);
    Out << "</Typedef>\n";
  }
  Out << "</List></Typedefs>";
}

void AsmXMLWriter::incorporateTypes(const Module &M) {
  M.findUsedStructTypes(NamedTypes);

  // The list of struct types we got back includes all the struct types, split
  // the unnamed ones out to a numbering and remove the anonymous structs.
  unsigned NextNumber = 0;

  std::vector<StructType*>::iterator NextToUse = NamedTypes.begin(), I, E;
  for (I = NamedTypes.begin(), E = NamedTypes.end(); I != E; ++I) {
    StructType *STy = *I;

    // Ignore anonymous types.
    if (STy->isLiteral())
      continue;

    if (STy->getName().empty())
      NumberedTypes[STy] = NextNumber++;
    else
      *NextToUse++ = STy;
  }

  NamedTypes.erase(NextToUse, NamedTypes.end());
}

const char *AsmXMLWriter::getPredicateText(unsigned predicate) {
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

ModulePass * createAsmXMLWriterPass(raw_ostream &o) {
  return new AsmXMLWriterPass(o);
}
