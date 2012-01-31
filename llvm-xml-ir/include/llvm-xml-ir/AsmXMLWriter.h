//===----------------------------------------------------------------------===//
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//


#ifndef ASM_XML_WRITER_PASS_H_
#define ASM_XML_WRITER_PASS_H_

#include <llvm/PassManager.h>
#include <llvm/ADT/OwningPtr.h>

namespace llvm {
class raw_ostream;
}

class AsmXMLWriterPass : public llvm::ModulePass {
public:
        static char ID;
        AsmXMLWriterPass(llvm::raw_ostream & o);
        virtual bool runOnModule(llvm::Module &M);
private:
        llvm::raw_ostream & m_out;
};

#endif
