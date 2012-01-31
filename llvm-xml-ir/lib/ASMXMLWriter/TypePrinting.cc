//===----------------------------------------------------------------------===//
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//


#include "llvm-xml-ir/TypePrinting.h"
#include "llvm-xml-ir/XMLIROStream.h"
#include "llvm-xml-ir/OperandWriter.h"

#include <llvm/Support/raw_ostream.h>
#include <llvm/Type.h>
#include <llvm/DerivedTypes.h>
#include <llvm/Module.h>

using namespace llvm;

void TypePrinting::print(Type *Ty, raw_ostream &OS) {
  switch (Ty->getTypeID()) {
    case Type::VoidTyID:
      OS << "<VoidType/>";
      break;
    case Type::FloatTyID:
      OS << "<FloatType/>";
      break;
    case Type::DoubleTyID:
      OS << "<DoubleType/>";
      break;
    case Type::X86_FP80TyID:
      OS << "<X86FP80Type/>";
      break;
    case Type::FP128TyID:
      OS << "<FP128Type/>";
      break;
    case Type::PPC_FP128TyID:
      OS << "<PPCFP128Type/>";
      break;
    case Type::LabelTyID:
      OS << "<LabelType/>";
      break;
    case Type::MetadataTyID:
      OS << "<MetaDataType/>";
      break;
    case Type::X86_MMXTyID:
      OS << "<X86MMXType/>";
      break;
    case Type::IntegerTyID:
      OS << "<IntegerType><Width>" << cast<IntegerType>(Ty)->getBitWidth() 
         << "</Width></IntegerType>";
      break;

    case Type::StructTyID:
      assert (0 && "unimplemented");
#if 0
 {
      StructType *STy = cast<StructType>(Ty);
      if (STy->isLiteral())
        return printStructBody(STy, OS);

      if (!STy->getName().empty())
        return PrintLLVMName(OS, STy->getName(), LocalPrefix);

      DenseMap<StructType*, unsigned>::iterator I = NumberedTypes.find(STy);
      if (I != NumberedTypes.end())
        OS << '%' << I->second;
      else  // Not enumerated, print the hex address.
        OS << "%\"type 0x" << STy << '\"';
    }
#endif
      return;

    case Type::FunctionTyID: {
      FunctionType *FTy = cast<FunctionType>(Ty);
      OS << "<FunctionType vararg=\""
          << FTy->isVarArg() << "\">";
      OS << "<RetType>";
      print(FTy->getReturnType(), OS);
      OS << "</RetType>\n";
      for (FunctionType::param_iterator I = FTy->param_begin(),
               E = FTy->param_end(); I != E; ++I) {
        OS << "<Type>";
        print(*I, OS);
        OS << "</Type>";
      }
      OS << "</FunctionType>\n";
    }
      return;

    case Type::VectorTyID:
      assert (0 && "unimplemented");
      /* Not implemented yet */
      return;

    case Type::PointerTyID: {
      PointerType *PTy = cast<PointerType>(Ty);
      OS << "<PointerType>";
      print(PTy->getElementType(), OS);
      OS << "</PointerType>\n";
      return;
    }
    case Type::ArrayTyID: {
      OS << "<ArrayType>";
      ArrayType *ATy = cast<ArrayType>(Ty);
      print(ATy->getElementType(), OS);
      OS << "</ArrayType>\n";
      return;
    }
      
    default:
      OS << "<unrecognized-type/>";
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

  for (unsigned i = 0, e = NamedTypes.size(); i != e; ++i) {
    Out << "<Typedef>";
    PrintLLVMName(Out, NamedTypes[i]->getName(), LocalPrefix);
    // Make sure we print out at least one level of the type structure, so
    // that we do not get %FILE = type %FILE
    printStructBody(NamedTypes[i], Out);
    Out << "</Typedef>\n";
  }
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

void TypePrinting::printStructBody(StructType *STy, raw_ostream &OS) {

  if (STy->isOpaque()) {
    OS << "<Opaque/>\n";
    return;
  }

  if (STy->isPacked())
    OS << "<Packed/>\n";

  for (StructType::element_iterator I = STy->element_begin(), E = STy->element_end(); I != E; ++I) {
    OS << "<Type>";
    print(*I, OS);
    OS << "</Type>\n";
  }
}
