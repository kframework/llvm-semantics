// 
requires "llvm-syntax.k"
requires "llvm-abstractsyntax.k"
requires "llvm-settings.k"
requires "llvm-helpers.k"
requires "llvm-standard-library-syntax.k"
requires "llvm-syscalls-syntax.k"
requires "llvm-configuration.k"

module LLVM-REGISTERS
    imports LLVM-SYNTAX
    imports LLVM-ABSTRACTSYNTAX
    imports LLVM-SETTINGS
    imports LLVM-HELPERS
    imports LLVM-STANDARD-LIBRARY-SYNTAX
    imports LLVM-SYSCALLS-SYNTAX
    imports LLVM-CONFIGURATION

    rule assign(X:SymbolicValueRef, V:KResult) => dynResult(X, V)
    rule noAssign(V:KResult) => dynNoResult(V)

/*
    rule [assign-register]:
        <k> assign(X:SymbolicValueRef, V:KResult)
                    => dynResult(X, V) ...</k>
        <currBlock> basicBlockNum(N:Int, B:K) </currBlock>
        <registers> M:Map => M[varInstance(N, X) <- V] </registers>
*/

    // TODO using constructors in the AST instead of matching on a string
    rule [lookup-register]:
        <k> name(localVar, S:String) => V ...</k>
        <currBlock> basicBlockNum(N:Int, B:K) </currBlock>
        <registers>... varInstance(N, name(localVar, S:String)) |-> V:K ...</registers>

    rule [lookup-global-register]:
        <k> name(globalVar, S:String) => V ...</k>
        <globalRegisters>... name(globalVar, S:String) |-> V:K ...</globalRegisters>

endmodule
