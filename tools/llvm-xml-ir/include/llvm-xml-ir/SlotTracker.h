//===----------------------------------------------------------------------===//
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//


/*
 * Derived from lib/VMCore/AsmWriter.cpp
 */

#ifndef LLVM_XML_IR_SLOT_TRACKER_H_
#define LLVM_XML_IR_SLOT_TRACKER_H_

#include <llvm/ADT/DenseMap.h>

namespace llvm {
class Value;
class Module;
class Function;
class GlobalValue;
class MDNode;
}

/// This class provides computation of slot numbers for LLVM Assembly writing.
///
class SlotTracker {
public:
  /// ValueMap - A mapping of Values to slot numbers.
        typedef llvm::DenseMap<const llvm::Value*, unsigned> ValueMap;

private:
        /// TheModule - The module for which we are holding slot numbers.
        const llvm::Module* TheModule;

        /// TheFunction - The function for which we are holding slot numbers.
        const llvm::Function* TheFunction;
        bool FunctionProcessed;

        /// mMap - The slot map for the module level data.
        ValueMap mMap;
        unsigned mNext;

        /// fMap - The slot map for the function level data.
        ValueMap fMap;
        unsigned fNext;

        /// mdnMap - Map for MDNodes.
        llvm::DenseMap<const llvm::MDNode*, unsigned> mdnMap;
        unsigned mdnNext;
public:
        /// Construct from a module
        explicit SlotTracker(const llvm::Module *M);
        /// Construct from a function, starting out in incorp state.
        explicit SlotTracker(const llvm::Function *F);

        /// Return the slot number of the specified value in it's type
        /// plane.  If something is not in the SlotTracker, return -1.
        int getLocalSlot(const llvm::Value *V);
        int getGlobalSlot(const llvm::GlobalValue *V);
        int getMetadataSlot(const llvm::MDNode *N);

        /// If you'd like to deal with a function instead of just a module, use
        /// this method to get its data into the SlotTracker.
        void incorporateFunction(const llvm::Function *F) {
                TheFunction = F;
                FunctionProcessed = false;
        }

        /// After calling incorporateFunction, use this method to remove the
        /// most recently incorporated function from the SlotTracker. This
        /// will reset the state of the machine back to just the module contents.
        void purgeFunction();

        /// MDNode map iterators.
        typedef llvm::DenseMap<const llvm::MDNode*, unsigned>::iterator mdn_iterator;
        mdn_iterator mdn_begin() { return mdnMap.begin(); }
        mdn_iterator mdn_end() { return mdnMap.end(); }
        unsigned mdn_size() const { return mdnMap.size(); }
        bool mdn_empty() const { return mdnMap.empty(); }
        
        /// This function does the actual initialization.
        inline void initialize();

        // Implementation Details
private:
        /// CreateModuleSlot - Insert the specified GlobalValue* into the slot table.
        void CreateModuleSlot(const llvm::GlobalValue *V);

        /// CreateMetadataSlot - Insert the specified MDNode* into the slot table.
        void CreateMetadataSlot(const llvm::MDNode *N);

        /// CreateFunctionSlot - Insert the specified Value* into the slot table.
        void CreateFunctionSlot(const llvm::Value *V);

        /// Add all of the module level global variables (and their initializers)
        /// and function declarations, but not the contents of those functions.
        void processModule();

        /// Add all of the functions arguments, basic blocks, and instructions.
        void processFunction();
        
  SlotTracker(const SlotTracker &);  // DO NOT IMPLEMENT
  void operator=(const SlotTracker &);  // DO NOT IMPLEMENT
};

SlotTracker *createSlotTracker(const llvm::Value *V);

#endif
