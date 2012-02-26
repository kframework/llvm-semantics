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

// things we added
#include <llvm/Operator.h>
#include <llvm/Support/Casting.h>

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
  void printModifiers(const Instruction &I);

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
  void visitAdd(const BinaryOperator &I)  { visitBinaryOperator(I); }
  void visitFAdd(const BinaryOperator &I) { visitBinaryOperator(I); }
  void visitSub(const BinaryOperator &I)  { visitBinaryOperator(I); }
  void visitFSub(const BinaryOperator &I) { visitBinaryOperator(I); }
  void visitMul(const BinaryOperator &I)  { visitBinaryOperator(I); }
  void visitFMul(const BinaryOperator &I) { visitBinaryOperator(I); }
  void visitUDiv(const BinaryOperator &I) { visitBinaryOperator(I); }
  void visitSDiv(const BinaryOperator &I) { visitBinaryOperator(I); }
  void visitFDiv(const BinaryOperator &I) { visitBinaryOperator(I); }
  void visitURem(const BinaryOperator &I) { visitBinaryOperator(I); }
  void visitSRem(const BinaryOperator &I) { visitBinaryOperator(I); }
  void visitFRem(const BinaryOperator &I) { visitBinaryOperator(I); }
  void visitShl(const BinaryOperator &I)  { visitBinaryOperator(I); }
  void visitLShr(const BinaryOperator &I) { visitBinaryOperator(I); }
  void visitAShr(const BinaryOperator &I) { visitBinaryOperator(I); }
  void visitAnd(const BinaryOperator &I)  { visitBinaryOperator(I); }
  void visitOr(const BinaryOperator &I)   { visitBinaryOperator(I); }
  void visitXor(const BinaryOperator &I)  { visitBinaryOperator(I); }
  void visitAlloca(const AllocaInst &);
  void visitLoad(const LoadInst &I);//       { visitInstruction(I); }
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

  void visitBinaryOperator(const BinaryOperator &I);
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
  BasicBlock *BBp = const_cast<BasicBlock*>(&BB);
  Out << "<BasicBlock>";

  if (!BB.hasName())
    BBp->setName(Twine("default"));
  PrintLLVMName(Out, &BB);

  Out << "<Instructions><List>\n";
  visit(BB.begin(), BB.end());
  Out << "</List></Instructions>\n";
  Out << "</BasicBlock>\n";
}

void AsmXMLWriter::printModifiers(const Instruction &I) {

  if (const OverflowingBinaryOperator *OBI = dyn_cast<OverflowingBinaryOperator>(&I)) {
    if (OBI->hasNoSignedWrap())
      Out << "<NoSignedWrap/>\n";
    if (OBI->hasNoUnsignedWrap())
      Out << "<NoUnsignedWrap/>\n";
  }

  if (const StoreInst *SI = dyn_cast<StoreInst>(&I)) {
    printAlignment(Out, *SI);
  }

  if (const LoadInst *LI = dyn_cast<LoadInst>(&I)) {
    printAlignment(Out, *LI);
  }

  if (const AllocaInst *AI = dyn_cast<AllocaInst>(&I)) {
    printAlignment(Out, *AI);
  }

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
        Out << "<Instruction>\n"; \
        Out << "<Modifiers><List>\n"; \
        printModifiers(I); \
        Out << "</List></Modifiers>\n"; \
        Out << "<" #OPCODE ">"; \
        visit##OPCODE(static_cast<const CLASS&>(I)); \
        Out << "</" #OPCODE ">\n"; \
        Out << "</Instruction>\n"; \
        if (!I.getType()->isVoidTy()) { \
          Out << "</Assign>\n"; \
        } \
        break ;
#include "llvm/Instruction.def"
  }
}

void AsmXMLWriter::visitBr(const BranchInst & BI) {
  if (BI.isConditional()) {
    Out << "<Conditional>";
  } else {
	Out << "<Unconditional>";
  }

  // TODO excluding types for both branches
  writeOperand(BI.getOperand(0), false);
  if (BI.isConditional()) {
    writeOperand(BI.getOperand(2), false);
    writeOperand(BI.getOperand(1), false);
	Out << "</Conditional>";
  } else {
    Out << "</Unconditional>";
  }
}

void AsmXMLWriter::visitAlloca(const AllocaInst & AI) {
  Out << "<Type>";
  TypePrinter.print(AI.getType()->getElementType(), Out);
  Out << "</Type>";
  Out << "<Operand>";
  writeOperand(AI.getArraySize(), true);
  Out << "</Operand>";
}

void AsmXMLWriter::visitCall(const CallInst & CI) {
  Out << "<Type>";
  TypePrinter.print(CI.getType(), Out);
  Out << "</Type>\n";

  Out << "<Callee>";
  WriteAsOperandInternal(Out, CI.getCalledValue(), &TypePrinter, &Machine, CI.getParent()->getParent()->getParent());

  Out << "<Arguments><List>";
  printOperandList(CI.op_begin(), CI.op_begin() + CI.getNumArgOperands());
  Out << "</List></Arguments>\n";
  Out << "</Callee>\n";
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

void AsmXMLWriter::visitBinaryOperator(const BinaryOperator &I) {
  Out << "<Type>";
  TypePrinter.print(I.getType(), Out);
  Out << "</Type>\n";
  visitInstruction(I);
}

template <class T>
void AsmXMLWriter::visitInstruction(const T& I) {
//  InstructionTrait<T>::printTrait(Out, I);
  printOperandList(I.op_begin(), I.op_end());
}

void AsmXMLWriter::visitStore(const StoreInst& SI) {
  Out << "<Type>";
  TypePrinter.print(SI.getValueOperand()->getType(), Out);
  Out << "</Type>\n";
  printOperandList(SI.op_begin(), SI.op_end());
}
void AsmXMLWriter::visitLoad(const LoadInst& SI) {
  Out << "<Type>";
  TypePrinter.print(SI.getPointerOperand()->getType(), Out);
  Out << "</Type>\n";
  printOperandList(SI.op_begin(), SI.op_end());
}

void AsmXMLWriter::visitCastInst(const CastInst & I) {
  Out << "<Type>";
  TypePrinter.print(I.getType(), Out);
  Out << "</Type>\n";
  printOperandList(I.op_begin(), I.op_end());
}

void AsmXMLWriter::visitCmpInst(const CmpInst & CI) {
	Out << "<Predicate>" ;
	RawWriter::write(getPredicateText(CI.getPredicate()), Out);
	Out << "</Predicate>";
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
//  if (std::distance(Start, End) <= 1) {
//    writeOperand(*Start++, true);
//    return;
//  }
  while (Start != End) {
    Out << "<Operand>";
    writeOperand(*Start++, true);
    Out << "</Operand>\n";
  }
}


ModulePass * createAsmXMLWriterPass(raw_ostream & o) {
  return new AsmXMLWriterPass(o);
}
