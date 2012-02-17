//===----------------------------------------------------------------------===//
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//


#include "llvm-xml-ir/SlotTracker.h"

#include <llvm/Module.h>
#include <llvm/Function.h>
#include <llvm/DerivedTypes.h>
#include <llvm/Instructions.h>

#if 0
#define ST_DEBUG(X) dbgs() << X
#else
#define ST_DEBUG(X)
#endif

using namespace llvm;

// Module level constructor. Causes the contents of the Module (sans functions)
// to be added to the slot table.
SlotTracker::SlotTracker(const Module *M)
  : TheModule(M), TheFunction(0), FunctionProcessed(false),
    mNext(0), fNext(0),  mdnNext(0) {
}

// Function level constructor. Causes the contents of the Module and the one
// function provided to be added to the slot table.
SlotTracker::SlotTracker(const Function *F)
  : TheModule(F ? F->getParent() : 0), TheFunction(F), FunctionProcessed(false),
    mNext(0), fNext(0), mdnNext(0) {
}

inline void SlotTracker::initialize() {
  if (TheModule) {
    processModule();
    TheModule = 0; ///< Prevent re-processing next time we're called.
  }

  if (TheFunction && !FunctionProcessed)
    processFunction();
}

// Iterate through all the global variables, functions, and global
// variable initializers and create slots for them.
void SlotTracker::processModule() {
  ST_DEBUG("begin processModule!\n");

  // Add all of the unnamed global variables to the value table.
  for (Module::const_global_iterator I = TheModule->global_begin(),
         E = TheModule->global_end(); I != E; ++I) {
    if (!I->hasName())
      CreateModuleSlot(I);
  }

  // Add metadata used by named metadata.
  for (Module::const_named_metadata_iterator
         I = TheModule->named_metadata_begin(),
         E = TheModule->named_metadata_end(); I != E; ++I) {
    const NamedMDNode *NMD = I;
    for (unsigned i = 0, e = NMD->getNumOperands(); i != e; ++i)
      CreateMetadataSlot(NMD->getOperand(i));
  }

  // Add all the unnamed functions to the table.
  for (Module::const_iterator I = TheModule->begin(), E = TheModule->end();
       I != E; ++I)
    if (!I->hasName())
      CreateModuleSlot(I);

  ST_DEBUG("end processModule!\n");
}

// Process the arguments, basic blocks, and instructions  of a function.
void SlotTracker::processFunction() {
  ST_DEBUG("begin processFunction!\n");
  fNext = 0;

  // Add all the function arguments with no names.
  for(Function::const_arg_iterator AI = TheFunction->arg_begin(),
      AE = TheFunction->arg_end(); AI != AE; ++AI)
    if (!AI->hasName())
      CreateFunctionSlot(AI);

  ST_DEBUG("Inserting Instructions:\n");

  SmallVector<std::pair<unsigned, MDNode*>, 4> MDForInst;

  // Add all of the basic blocks and instructions with no names.
  for (Function::const_iterator BB = TheFunction->begin(),
       E = TheFunction->end(); BB != E; ++BB) {
    if (!BB->hasName())
      CreateFunctionSlot(BB);

    for (BasicBlock::const_iterator I = BB->begin(), E = BB->end(); I != E;
         ++I) {
      if (!I->getType()->isVoidTy() && !I->hasName())
        CreateFunctionSlot(I);

      // Intrinsics can directly use metadata.  We allow direct calls to any
      // llvm.foo function here, because the target may not be linked into the
      // optimizer.
      if (const CallInst *CI = dyn_cast<CallInst>(I)) {
        if (Function *F = CI->getCalledFunction())
          if (F->getName().startswith("llvm."))
            for (unsigned i = 0, e = I->getNumOperands(); i != e; ++i)
              if (MDNode *N = dyn_cast_or_null<MDNode>(I->getOperand(i)))
                CreateMetadataSlot(N);
      }

      // Process metadata attached with this instruction.
      I->getAllMetadata(MDForInst);
      for (unsigned i = 0, e = MDForInst.size(); i != e; ++i)
        CreateMetadataSlot(MDForInst[i].second);
      MDForInst.clear();
    }
  }

  FunctionProcessed = true;

  ST_DEBUG("end processFunction!\n");
}

/// Clean up after incorporating a function. This is the only way to get out of
/// the function incorporation state that affects get*Slot/Create*Slot. Function
/// incorporation state is indicated by TheFunction != 0.
void SlotTracker::purgeFunction() {
  ST_DEBUG("begin purgeFunction!\n");
  fMap.clear(); // Simply discard the function level map
  TheFunction = 0;
  FunctionProcessed = false;
  ST_DEBUG("end purgeFunction!\n");
}

/// getGlobalSlot - Get the slot number of a global value.
int SlotTracker::getGlobalSlot(const GlobalValue *V) {
  // Check for uninitialized state and do lazy initialization.
  initialize();

  // Find the value in the module map
  ValueMap::iterator MI = mMap.find(V);
  return MI == mMap.end() ? -1 : (int)MI->second;
}

/// getMetadataSlot - Get the slot number of a MDNode.
int SlotTracker::getMetadataSlot(const MDNode *N) {
  // Check for uninitialized state and do lazy initialization.
  initialize();

  // Find the MDNode in the module map
  mdn_iterator MI = mdnMap.find(N);
  return MI == mdnMap.end() ? -1 : (int)MI->second;
}


/// getLocalSlot - Get the slot number for a value that is local to a function.
int SlotTracker::getLocalSlot(const Value *V) {
  assert(!isa<Constant>(V) && "Can't get a constant or global slot with this!");

  // Check for uninitialized state and do lazy initialization.
  initialize();

  ValueMap::iterator FI = fMap.find(V);
  return FI == fMap.end() ? -1 : (int)FI->second;
}


/// CreateModuleSlot - Insert the specified GlobalValue* into the slot table.
void SlotTracker::CreateModuleSlot(const GlobalValue *V) {
  assert(V && "Can't insert a null Value into SlotTracker!");
  assert(!V->getType()->isVoidTy() && "Doesn't need a slot!");
  assert(!V->hasName() && "Doesn't need a slot!");

  unsigned DestSlot = mNext++;
  mMap[V] = DestSlot;

  ST_DEBUG("  Inserting value [" << V->getType() << "] = " << V << " slot=" <<
           DestSlot << " [");
  // G = Global, F = Function, A = Alias, o = other
  ST_DEBUG((isa<GlobalVariable>(V) ? 'G' :
            (isa<Function>(V) ? 'F' :
             (isa<GlobalAlias>(V) ? 'A' : 'o'))) << "]\n");
}

/// CreateSlot - Create a new slot for the specified value if it has no name.
void SlotTracker::CreateFunctionSlot(const Value *V) {
  assert(!V->getType()->isVoidTy() && !V->hasName() && "Doesn't need a slot!");

  unsigned DestSlot = fNext++;
  fMap[V] = DestSlot;

  // G = Global, F = Function, o = other
  ST_DEBUG("  Inserting value [" << V->getType() << "] = " << V << " slot=" <<
           DestSlot << " [o]\n");
}

/// CreateModuleSlot - Insert the specified MDNode* into the slot table.
void SlotTracker::CreateMetadataSlot(const MDNode *N) {
  assert(N && "Can't insert a null Value into SlotTracker!");

  // Don't insert if N is a function-local metadata, these are always printed
  // inline.
  if (!N->isFunctionLocal()) {
    mdn_iterator I = mdnMap.find(N);
    if (I != mdnMap.end())
      return;

    unsigned DestSlot = mdnNext++;
    mdnMap[N] = DestSlot;
  }

  // Recursively add any MDNodes referenced by operands.
  for (unsigned i = 0, e = N->getNumOperands(); i != e; ++i)
    if (const MDNode *Op = dyn_cast_or_null<MDNode>(N->getOperand(i)))
      CreateMetadataSlot(Op);
}

SlotTracker *createSlotTracker(const Value *V) {
  if (const Argument *FA = dyn_cast<Argument>(V))
    return new SlotTracker(FA->getParent());

  if (const Instruction *I = dyn_cast<Instruction>(V))
    if (I->getParent())
      return new SlotTracker(I->getParent()->getParent());

  if (const BasicBlock *BB = dyn_cast<BasicBlock>(V))
    return new SlotTracker(BB->getParent());

  if (const GlobalVariable *GV = dyn_cast<GlobalVariable>(V))
    return new SlotTracker(GV->getParent());

  if (const GlobalAlias *GA = dyn_cast<GlobalAlias>(V))
    return new SlotTracker(GA->getParent());

  if (const Function *Func = dyn_cast<Function>(V))
    return new SlotTracker(Func);

  if (const MDNode *MD = dyn_cast<MDNode>(V)) {
    if (!MD->isFunctionLocal())
      return new SlotTracker(MD->getFunction());

    return new SlotTracker((Function *)0);
  }

  return 0;
}
