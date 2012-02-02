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

class XMLIROStream;
class SlotTracker;
class TypePrinting;

enum PrefixType {
  GlobalPrefix,
  LabelPrefix,
  LocalPrefix,
  NoPrefix
};

const char *getPredicateText(unsigned);

void PrintLLVMName(XMLIROStream &, llvm::StringRef, PrefixType);

/// PrintLLVMName - Turn the specified name into an 'LLVM name', which is either
/// prefixed with % (if the string only contains simple characters) or is
/// surrounded with ""'s (if it has special chars in it).  Print it out.
void PrintLLVMName(XMLIROStream &, const llvm::Value *);

void PrintLLVMName(XMLIROStream &, const llvm::Value *,
                   TypePrinting *,
                   SlotTracker *,
                   const llvm::Module *);

// PrintEscapedString - Print each character of the specified string, escaping
// it if it is not printable or if it is an escape char.
void PrintEscapedString(llvm::StringRef, XMLIROStream &);

/// WriteAsOperand - Write the name of the specified value out to the specified
/// ostream.  This can be useful when you just want to print int %reg126, not
/// the whole instruction that generated it.
///
void WriteAsOperandInternal(XMLIROStream &, const llvm::Value *,
                                   TypePrinting *,
                                   SlotTracker *,
                                   const llvm::Module *);

void WriteConstantInternal(XMLIROStream &, const llvm::Constant *,
                                  TypePrinting &,
                                  SlotTracker *,
                                  const llvm::Module *);

#endif
