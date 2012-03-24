//===----------------------------------------------------------------------===//
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//


#include "llvm-dis-xml/AsmXMLWriter.h"

#include <llvm/LLVMContext.h>
#include <llvm/Module.h>
#include <llvm/PassManager.h>
#include <llvm/Analysis/Verifier.h>
#include <llvm/ADT/OwningPtr.h>
#include <llvm/Bitcode/ReaderWriter.h>
#include <llvm/Support/IRReader.h>
#include <llvm/Support/CommandLine.h>
#include <llvm/Support/ManagedStatic.h>
#include <llvm/Support/MemoryBuffer.h>
#include <llvm/Support/PrettyStackTrace.h>
#include <llvm/Support/Signals.h>
#include <llvm/Support/ToolOutputFile.h>
#include <llvm/Support/system_error.h>

using namespace llvm;

static cl::opt<std::string>
InputFilename(cl::Positional, cl::desc("<input bytecode>"), cl::init("-"));

static cl::opt<std::string>
OutputFilename("o", cl::desc("Output filename"), cl::value_desc("filename"));

int main(int argc, char * argv[]) {
        sys::PrintStackTraceOnErrorSignal();
        PrettyStackTraceProgram X(argc, argv);
        cl::ParseCommandLineOptions(argc, argv, "LLVM Disassembler in XML format\n");

        llvm_shutdown_obj Y;  // Call llvm_shutdown() on exit.

        SMDiagnostic Err;
        std::auto_ptr<Module> M;

        M.reset(ParseIRFile(InputFilename, Err, getGlobalContext()));
        if (M.get() == 0) {
                Err.Print(argv[0], errs());
                return 1;
        }

        OwningPtr<tool_output_file> Out;
        std::string ErrorInfo;
        Out.reset(new tool_output_file(OutputFilename.c_str(), ErrorInfo,
                                       raw_fd_ostream::F_Binary));
        if (!ErrorInfo.empty()) {
                errs() << ErrorInfo << '\n';
                return 1;
        }

        PassManager Passes;
        Passes.add(createVerifierPass());
        Passes.add(new AsmXMLWriterPass(Out->os()));
        Passes.run(*M.get());

        Out->keep();
        return 0;
}
