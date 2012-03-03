//===----------------------------------------------------------------------===//
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//


#include "llvm-xml-ir/TypePrinting.h"
#include "llvm-xml-ir/XMLIROStream.h"
#include "llvm-xml-ir/OperandWriter.h"
#include "llvm-xml-ir/RawWriter.h"

#include <llvm/Support/raw_ostream.h>
#include <llvm/Type.h>
#include <llvm/DerivedTypes.h>
#include <llvm/Module.h>

using namespace llvm;

void TypePrinting::print(Type *Ty, XMLIROStream &Out) {
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
        assert (0 && "unimplemented");

      if (!STy->getName().empty()) {
        Out << "<NamedType>";
        PrintLLVMName(Out, STy->getName(), LocalPrefix);
        Out << "</NamedType>";
        break;
      }

      assert (0 && "unimplemented");
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
        return PrintLLVMName(OS, STy->getName(), LocalPrefix);

      DenseMap<StructType*, unsigned>::iterator I = NumberedTypes.find(STy);
      if (I != NumberedTypes.end())
        Out << '%' << I->second;
      else  // Not enumerated, print the hex address.
        Out << "%\"type 0x" << STy << '\"';
    }
#endif
      return;

    case Type::FunctionTyID: {
      FunctionType *FTy = cast<FunctionType>(Ty);
      Out << "<FunctionType vararg=\""
          << FTy->isVarArg() << "\">";
      Out << "<RetType>";
      print(FTy->getReturnType(), Out);
      Out << "</RetType>\n";
      for (FunctionType::param_iterator I = FTy->param_begin(),
               E = FTy->param_end(); I != E; ++I) {
        Out << "<Type>";
        print(*I, Out);
        Out << "</Type>";
      }
      Out << "</FunctionType>\n";
    }
      return;

    case Type::VectorTyID:
      assert (0 && "unimplemented");
      /* Not implemented yet */
      return;

    case Type::PointerTyID: {
      PointerType *PTy = cast<PointerType>(Ty);
      Out << "<PointerType>";
      print(PTy->getElementType(), Out);
      Out << "</PointerType>\n";
      return;
    }
    case Type::ArrayTyID: {
      Out << "<ArrayType>";
      ArrayType *ATy = cast<ArrayType>(Ty);
      print(ATy->getElementType(), Out);
      Out << "</ArrayType>\n";
      return;
    }

    default:
      Out << "<unrecognized-type/>";
      return;
  }
}

void TypePrinting::printTypeIdentities(XMLIROStream & Out) {
  if (NumberedTypes.empty() &&
      NamedTypes.empty())
    return;

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
    Out << '%' << i << " = type ";

    // Make sure we print out at least one level of the type structure, so
    // that we do not get %2 = type %2
    printStructBody(NT[i], Out);
    Out << '\n';
  }

  Out << "<Typedefs><List>\n";
  for (unsigned i = 0, e = NamedTypes.size(); i != e; ++i) {
    Out << "<Typedef>";
    PrintLLVMName(Out, NamedTypes[i]->getName(), LocalPrefix);
    // Make sure we print out at least one level of the type structure, so
    // that we do not get %FILE = type %FILE
    printStructBody(NamedTypes[i], Out);
    Out << "</Typedef>\n";
  }
  Out << "</List></Typedefs>";
}

void TypePrinting::incorporateTypes(const Module &M) {
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

void TypePrinting::printStructBody(StructType *STy, XMLIROStream &Out) {
  if (STy->isOpaque()) {
    Out << "<Opaque/>\n";
    return;
  }

  if (STy->isPacked())
    Out << "<Packed/>\n";

  Out << "<StructType><Fields><List>\n";
  for (StructType::element_iterator I = STy->element_begin(), E = STy->element_end(); I != E; ++I) {
    Out << "<Type>";
    print(*I, Out);
    Out << "</Type>\n";
  }
  Out << "</List></Fields></StructType>";
}
