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
         requires notBool isReadVal(V)

    rule <k> assign(X:SymbolicValueRef, loadVal(Type:K))
           => dynNoResult(undef) ...</k>
        <cpu> dynInstHold(B:Int , In:Int, Label:K) </cpu>
        <readBack> readMap(RM:Map) => readMap(RM[varInstance(B, In)
                      <- readBackHold(X, loadHold(Type, .List),.K, .K)]) </readBack>
        [structural]

    rule <k> assign(X:SymbolicValueRef, vaArgOp(Loc:K, T2:K))
           => dynNoResult(undef) ...</k>
        <cpu> dynInstHold(B:Int , In:Int, Label:K) </cpu>
        <readBack> readMap(RM:Map) => readMap(RM[varInstance(B, In)
                      <- readBackHold(X, loadHold(getInnerType(vaArgType), .List), .K,
                       vaWaitRead(T2) ~> vaWaitWrite(Loc))]) </readBack>
        [structural]

    rule noAssign(V:KResult) => dynNoResult(V)

    rule [argument-bind-register]:
        <k> stacticAssign(X:SymbolicValueRef, V:KResult) => .K ...</k>
        <registers> M:Map => M[X <- V] </registers>


    // TODO using constructors in the AST instead of matching on a string
    rule [lookup-register]:
        <k> name(localVar, S:String) => V ...</k>
        <registers>... name(localVar, S:String) |-> V:K ...</registers>

    rule [lookup-global-register]:
        <k> name(globalVar, S:String) => V ...</k>
        <globalRegisters>... name(globalVar, S:String) |-> V:K ...</globalRegisters>

endmodule
