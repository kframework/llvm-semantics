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
#include "llvm-xml-ir/TypePrinting.h"
#include "llvm-xml-ir/OperandWriter.h"
#include "llvm-xml-ir/AsmXMLWriter.h"
#include "llvm-xml-ir/RawWriter.h"

#include <llvm/Constants.h>
#include <llvm/Function.h>
#include <llvm/Instructions.h>
#include <llvm/Module.h>
#include <llvm/Support/CFG.h>
#include <llvm/Support/InstVisitor.h>
#include <llvm/ADT/StringExtras.h>

namespace llvm {

// We operate on opaque instruction classes, so forward declare all instruction
// types now...
//
#define HANDLE_INST(NUM, OPCODE, CLASS)   class CLASS;
#include "llvm/Instruction.def"
}

using namespace llvm;

template<class T>
void printAlignment(XMLIROStream & Out, const T& I);

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

class AsmXMLWriter {
 public:
  void visit(const Module &M);
  AsmXMLWriter(raw_ostream & o, const Module * M);

 private:
  // Generic visit method - Allow visitation to all instructions in a range
  template<class Iterator>
  void visit(Iterator Start, Iterator End) {
    while (Start != End)
      visit(*Start++);
  }

  template <class Iterator>
  void printOperandList(Iterator Start, Iterator End);

  void visit(const GlobalVariable &GV);
  void visit(const Function &F);
  void visit(const BasicBlock & BB);
  void visit(const Argument &);
  void visit(const Instruction & I);

  void visitRet(const ReturnInst &I) { visitInstruction(I); }
  void visitBr(const BranchInst &);
  void visitSwitch(const SwitchInst &);
  void visitIndirectBr(const IndirectBrInst &) { assert (0 && "Unimplemented"); }
  void visitInvoke(const InvokeInst &) { assert (0 && "Unimplemented"); }
  void visitUnwind(const UnwindInst &) { assert (0 && "Unimplemented"); }
  void visitResume(const ResumeInst &) { assert (0 && "Unimplemented"); }
  void visitUnreachable(const UnreachableInst &) { assert (0 && "Unimplemented"); }
  void visitAdd(const BinaryOperator &I)  { visitInstruction(I); }
  void visitFAdd(const BinaryOperator &I) { visitInstruction(I); }
  void visitSub(const BinaryOperator &I)  { visitInstruction(I); }
  void visitFSub(const BinaryOperator &I) { visitInstruction(I); }
  void visitMul(const BinaryOperator &I)  { visitInstruction(I); }
  void visitFMul(const BinaryOperator &I) { visitInstruction(I); }
  void visitUDiv(const BinaryOperator &I) { visitInstruction(I); }
  void visitSDiv(const BinaryOperator &I) { visitInstruction(I); }
  void visitFDiv(const BinaryOperator &I) { visitInstruction(I); }
  void visitURem(const BinaryOperator &I) { visitInstruction(I); }
  void visitSRem(const BinaryOperator &I) { visitInstruction(I); }
  void visitFRem(const BinaryOperator &I) { visitInstruction(I); }
  void visitShl(const BinaryOperator &I)  { visitInstruction(I); }
  void visitLShr(const BinaryOperator &I) { visitInstruction(I); }
  void visitAShr(const BinaryOperator &I) { visitInstruction(I); }
  void visitAnd(const BinaryOperator &I)  { visitInstruction(I); }
  void visitOr(const BinaryOperator &I)   { visitInstruction(I); }
  void visitXor(const BinaryOperator &I)  { visitInstruction(I); }
  void visitAlloca(const AllocaInst &);
  void visitLoad(const LoadInst &I)       { visitInstruction(I); }
  void visitStore(const StoreInst &I);
  void visitGetElementPtr(const GetElementPtrInst &I) { visitInstruction(I); }
  void visitFence(const FenceInst &) { assert (0 && "Unimplemented"); }
  void visitAtomicCmpXchg(const AtomicCmpXchgInst &) { assert (0 && "Unimplemented"); }
  void visitAtomicRMW(const AtomicRMWInst &) { assert (0 && "Unimplemented"); }
  void visitTrunc(const TruncInst &I)       { visitCastInst(I); }
  void visitZExt(const ZExtInst &I)         { visitCastInst(I); }
  void visitSExt(const SExtInst &I)         { visitCastInst(I); }
  void visitFPToUI(const FPToUIInst &I)     { visitCastInst(I); }
  void visitFPToSI(const FPToSIInst &I)     { visitCastInst(I); }
  void visitUIToFP(const UIToFPInst &I)     { visitCastInst(I); }
  void visitSIToFP(const SIToFPInst &I)     { visitCastInst(I); }
  void visitFPTrunc(const FPTruncInst &I)   { visitCastInst(I); }
  void visitFPExt(const FPExtInst &I)       { visitCastInst(I); }
  void visitPtrToInt(const PtrToIntInst &I) { visitCastInst(I); }
  void visitIntToPtr(const IntToPtrInst &I) { visitCastInst(I); }
  void visitBitCast(const BitCastInst &I)   { visitCastInst(I); }
  void visitICmp(const ICmpInst &I)          { visitCmpInst(I); }
  void visitFCmp(const FCmpInst &I)          { visitCmpInst(I); }
  void visitPHI(const PHINode &);
  void visitCall(const CallInst &);
  void visitSelect(const SelectInst &I)       { visitInstruction(I); }
  void visitUserOp1(const Instruction &) {}
  void visitUserOp2(const Instruction &) {}
  void visitVAArg(const VAArgInst &) { assert (0 && "Unimplemented"); }
  void visitExtractElement(const ExtractElementInst &) { assert (0 && "Unimplemented"); }
  void visitInsertElement(const InsertElementInst &) { assert (0 && "Unimplemented"); }
  void visitShuffleVector(const ShuffleVectorInst &) { assert (0 && "Unimplemented"); }
  void visitExtractValue(const ExtractValueInst &);
  void visitInsertValue(const InsertValueInst &) { assert (0 && "Unimplemented"); }
  void visitLandingPad(const LandingPadInst &) { assert (0 && "Unimplemented"); }

  template<class T>
  void visitInstruction(const T& I);

  void visitCastInst(const CastInst &I);
  void visitCmpInst(const CmpInst &I);
  void printInstruction(const Instruction *I);
  void writeOperand(const Value *Operand, bool PrintType);

  XMLIROStream Out;
  TypePrinting TypePrinter;
  const Module *TheModule;
  SlotTracker Machine;
};

char AsmXMLWriterPass::ID = 0;

AsmXMLWriterPass::AsmXMLWriterPass(raw_ostream & o)
    : ModulePass(ID)
    , m_out(o)
{}

bool AsmXMLWriterPass::runOnModule(Module &M) {
  AsmXMLWriter writer(m_out, &M);
  writer.visit(M);
  return false;
}

AsmXMLWriter::AsmXMLWriter(raw_ostream & o, const Module * M)
    : Out(o)
    , TheModule(M)
    , Machine(M)
{}

void AsmXMLWriter::visit(const Module & M) {
  Out << "<?xml version=\"1.0\"?>\n";

  Out << "<Module>\n";

  if (!M.getModuleIdentifier().empty()) {
    Out << "<ModuleID>";
    RawWriter::write(M.getModuleIdentifier(), Out);
    Out << "</ModuleID>\n";
  }
        
  if (!M.getDataLayout().empty()) {
    Out << "<TargetLayout>";
    RawWriter::write(M.getDataLayout(), Out);
    Out << "</TargetLayout>\n";
  }

  if (!M.getTargetTriple().empty()) {
    Out << "<TargetTriple>";
    RawWriter::write(M.getTargetTriple(), Out);
    Out << "</TargetTriple>\n";
  }

  TypePrinter.incorporateTypes(M);
  TypePrinter.printTypeIdentities(Out);

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

void AsmXMLWriter::visit(const Function & F) {
  Out << "<Function>";

#if 0
  PrintLinkage(F.getLinkage(), Out);
  PrintVisibility(F.getVisibility(), Out);
#endif

  Out << "<RetType>";
  TypePrinter.print(F.getReturnType(), Out);
  Out << "</RetType>\n";
  WriteAsOperandInternal(Out, &F, &TypePrinter, &Machine, F.getParent());

  FunctionType *FT = F.getFunctionType();
  Out << "<Arguments><List>\n";
  if (FT->isVarArg())
    Out << "<Vararg/>\n";

  visit(F.arg_begin(), F.arg_end());
  Out << "</List></Arguments>\n";

// David TODO: This is a hackish way to make sure Function has a consistent
// arity. We probably need a better way to distinguish between functions and
// declarations.
//  if (!F.isDeclaration()) {
    Out << "<Body><List>";
    visit(F.begin(), F.end());
    Out << "</List></Body>";
//  }

  Out << "</Function>\n";
}

void AsmXMLWriter::visit(const GlobalVariable & GV) {
  Out << "<GlobalVariable>";
  PrintLLVMName(Out, &GV, &TypePrinter, &Machine, GV.getParent());

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

  Out << "<Type>";
  TypePrinter.print(GV.getType(), Out);
  Out << "</Type>\n";

  if (GV.hasInitializer()) {
    Out << "<Initializer>";
    writeOperand(GV.getInitializer(), false);
    Out << "</Initializer>\n";
  }

  Out << "</GlobalVariable>\n";
}

void AsmXMLWriter::visit(const Argument & Arg) {
  Out << "<Arg><Type>";
  // Output type...
  TypePrinter.print(Arg.getType(), Out);
  Out << "</Type>\n";

  // Output name, if available...
  if (!Arg.getParent()->isDeclaration() && Arg.hasName())
    PrintLLVMName(Out, &Arg);
        
  Out << "</Arg>";
}

void AsmXMLWriter::visit(const BasicBlock &BB) {
  Out << "<BasicBlock>";
  if (BB.hasName())
    PrintLLVMName(Out, &BB);

  Out << "<Instructions><List>\n";
  visit(BB.begin(), BB.end());
  Out << "</List></Instructions>\n";
  Out << "</BasicBlock>\n";
}

void AsmXMLWriter::visit(const Instruction &I) {
  switch (I.getOpcode()) {
    default: llvm_unreachable("Unknown instruction type encountered!");
      // Build the switch statement using the Instruction.def file...
#define HANDLE_INST(NUM, OPCODE, CLASS)         \
      case Instruction::OPCODE: \
        if (!I.getType()->isVoidTy()) { \
          Out << "<Assign>\n"; \
          PrintLLVMName(Out, &I, &TypePrinter, &Machine, I.getParent()->getParent()->getParent()); \
        } \
        Out << "<" #OPCODE ">"; \
        visit##OPCODE(static_cast<const CLASS&>(I)); \
        Out << "</" #OPCODE ">\n"; \
        if (!I.getType()->isVoidTy()) { \
          Out << "</Assign>\n"; \
        } \
        break ;
#include "llvm/Instruction.def"
  }
}

void AsmXMLWriter::visitBr(const BranchInst & BI) {
  if (BI.isConditional()) {
    Out << "<Condition>";
    writeOperand(BI.getCondition(), false);
    Out << "</Condition>";
  }
  printOperandList(BI.op_begin(), BI.op_end());
}

void AsmXMLWriter::visitAlloca(const AllocaInst & AI) {
  Out << "<Type>";
  TypePrinter.print(AI.getType()->getElementType(), Out);
  Out << "</Type>";
  printAlignment(Out, AI);
}

void AsmXMLWriter::visitCall(const CallInst & CI) {
  Out << "<Type>";
  TypePrinter.print(CI.getType(), Out);
  Out << "</Type>\n";

  WriteAsOperandInternal(Out, CI.getCalledValue(), &TypePrinter, &Machine, CI.getParent()->getParent()->getParent());

  printOperandList(CI.op_begin(), CI.op_begin() + CI.getNumArgOperands());
}

void AsmXMLWriter::writeOperand(const Value *Operand, bool PrintType) {
  if (Operand == 0) {
    Out << "<null operand!>";
    return;
  }
  if (PrintType) {
    Out << "<Type>";
    TypePrinter.print(Operand->getType(), Out);
    Out << "</Type>\n";
  }
  
  WriteAsOperandInternal(Out, Operand, &TypePrinter, &Machine, TheModule);
}

template <class T>
void AsmXMLWriter::visitInstruction(const T& I) {
  InstructionTrait<T>::printTrait(Out, I);
  printOperandList(I.op_begin(), I.op_end());
}

void AsmXMLWriter::visitStore(const StoreInst& SI) {
  printAlignment(Out, SI);
  printOperandList(SI.op_begin(), SI.op_end());
}

void AsmXMLWriter::visitCastInst(const CastInst & I) {
  Out << "<Type>";
  TypePrinter.print(I.getType(), Out);
  Out << "</Type>\n";
  printOperandList(I.op_begin(), I.op_end());
}

void AsmXMLWriter::visitCmpInst(const CmpInst & CI) {
  Out << "<Predicate>" << getPredicateText(CI.getPredicate())
      << "</Predicate>";
  printOperandList(CI.op_begin(), CI.op_end());
}

void AsmXMLWriter::visitPHI(const PHINode & PN) {
  TypePrinter.print(PN.getType(), Out);

  for (unsigned op = 0, Eop = PN.getNumIncomingValues(); op < Eop; ++op) {
    Out << "<Edge>";
    writeOperand(PN.getIncomingValue(op), false);
    writeOperand(PN.getIncomingBlock(op), false);
    Out << "</Edge>\n";
  }
}

void AsmXMLWriter::visitSwitch(const SwitchInst & SI) {
  // Special case switch instruction to get formatting nice and correct.
  Out << "<Condition>";
  writeOperand(SI.getCondition(), true);
  Out << "</Condition>\n";
  Out << "<DefaultDest>";
  writeOperand(SI.getDefaultDest(), true);
  Out << "</DefaultDest>\n";
  unsigned NumCases = SI.getNumCases();
  for (unsigned i = 1; i < NumCases; ++i) {
    Out << "<Case>";
    Out << "<Value>";
    writeOperand(SI.getCaseValue(i), true);
    Out << "</Value>\n";
    Out << "<Successor>";
    writeOperand(SI.getSuccessor(i), true);
    Out << "</Successor>\n";
    Out << "</Case>\n";
  }
}

void AsmXMLWriter::visitExtractValue(const ExtractValueInst & EVI) {
  writeOperand(EVI.getOperand(0), true);
  for (const unsigned *i = EVI.idx_begin(), *e = EVI.idx_end(); i != e; ++i)
    Out << ", " << *i;
}

template <class T>
void printAlignment(XMLIROStream & Out, const T & I) {
  if (I.getAlignment()) {
    Out << "<Alignment>";
    RawWriter::write(I.getAlignment(), Out);
    Out << "</Alignment>\n";
  }
}

template <class Iterator>
void AsmXMLWriter::printOperandList(Iterator Start, Iterator End) {
  while (Start != End) {
    Out << "<Operand>";
    writeOperand(*Start++, true);
    Out << "</Operand>\n";
  }
}


ModulePass * createAsmXMLWriterPass(raw_ostream & o) {
  return new AsmXMLWriterPass(o);
}
