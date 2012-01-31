//===----------------------------------------------------------------------===//
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//


#ifndef LLVM_XML_IR_OPERAND_WRITER_H_
#define LLVM_XML_IR_OPERAND_WRITER_H_

#include <llvm/ADT/StringRef.h>
namespace llvm {
class raw_ostream;
class Value;
class Module;
class Constant;
}

class SlotTracker;
class TypePrinting;

enum PrefixType {
  GlobalPrefix,
  LabelPrefix,
  LocalPrefix,
  NoPrefix
};

const char *getPredicateText(unsigned predicate);

void PrintLLVMName(llvm::raw_ostream &OS, llvm::StringRef Name, PrefixType Prefix);

/// PrintLLVMName - Turn the specified name into an 'LLVM name', which is either
/// prefixed with % (if the string only contains simple characters) or is
/// surrounded with ""'s (if it has special chars in it).  Print it out.
void PrintLLVMName(llvm::raw_ostream &OS, const llvm::Value *V);

void PrintLLVMName(llvm::raw_ostream &Out, const llvm::Value *V,
                   TypePrinting *TypePrinter,
                   SlotTracker *Machine,
                   const llvm::Module *Context);

// PrintEscapedString - Print each character of the specified string, escaping
// it if it is not printable or if it is an escape char.
void PrintEscapedString(llvm::StringRef Name, llvm::raw_ostream &Out);

/// WriteAsOperand - Write the name of the specified value out to the specified
/// ostream.  This can be useful when you just want to print int %reg126, not
/// the whole instruction that generated it.
///
void WriteAsOperandInternal(llvm::raw_ostream &Out, const llvm::Value *V,
                                   TypePrinting *TypePrinter,
                                   SlotTracker *Machine,
                                   const llvm::Module *Context);

void WriteConstantInternal(llvm::raw_ostream &Out, const llvm::Constant *CV,
                                  TypePrinting &TypePrinter,
                                  SlotTracker *Machine,
                                  const llvm::Module *Context);

std::string CDATA(llvm::StringRef data);

#endif
