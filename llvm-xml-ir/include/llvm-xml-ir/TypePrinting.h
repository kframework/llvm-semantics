//===----------------------------------------------------------------------===//
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//


#ifndef LLVM_XML_IR_TYPE_PRINTING_H_
#define LLVM_XML_IR_TYPE_PRINTING_H_

#include <llvm/ADT/DenseMap.h>
#include <vector>

namespace llvm {
class Module;
class raw_ostream;
class StructType;
class Type;
}

class XMLIROStream;
class TypePrinting {
 public:
  TypePrinting() {}
  void incorporateTypes(const llvm::Module &M);
  void print(llvm::Type *Ty, llvm::raw_ostream &OS);
  void printStructBody(llvm::StructType *Ty, llvm::raw_ostream &OS);
  void printTypeIdentities(XMLIROStream & Out);

 private:
  TypePrinting(const TypePrinting &);   // DO NOT IMPLEMENT
  void operator=(const TypePrinting&);  // DO NOT IMPLEMENT

  /// NamedTypes - The named types that are used by the current module.
  std::vector<llvm::StructType*> NamedTypes;

  /// NumberedTypes - The numbered types, along with their value.
  llvm::DenseMap<llvm::StructType*, unsigned> NumberedTypes;

};

#endif
