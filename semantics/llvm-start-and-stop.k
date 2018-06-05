//
requires "llvm-syntax.k"
requires "llvm-abstractsyntax.k"
requires "llvm-settings.k"
requires "llvm-helpers.k"
requires "llvm-standard-library-syntax.k"
requires "llvm-syscalls-syntax.k"
requires "llvm-configuration.k"

module LLVM-START-AND-STOP
    imports LLVM-SYNTAX
    imports LLVM-ABSTRACTSYNTAX
    imports LLVM-SETTINGS
    imports LLVM-HELPERS
    imports LLVM-CONFIGURATION
    imports LLVM-STANDARD-LIBRARY-SYNTAX
    imports LLVM-SYSCALLS-SYNTAX

    rule
        <k> callMain
            => call(i(32), callee(name(globalVar, "__libc_start_main_0"),
                arguments(
                    val(name(globalVar, "main")), // address of main
                    (val(0), // argc
                    (val(alloca(i(8), 8, 0, 0, false)), // argv
                    (val('nullOfConstValueRef(.KList)), // init
                    (val('nullOfConstValueRef(.KList)), // fini
                    val('nullOfConstValueRef(.KList))// ldso_fini
                )))))
            ))
        </k>
        <threadId> Tid:Int </threadId>
        <threadStatus> M:Map => M[Tid <-
                   pthreadGlobal(true, PTHREAD_RUNNING, .K)] </threadStatus>
        <currModule> ModName:SymbolicValueRef </currModule>
        <funModuleName> ModName </funModuleName>
        <functionName> name(globalVar, "main") </functionName>
        <formalParameters> arguments(L:ElemList) </formalParameters>
        when lengthOfList(L) ==Int 0

    // TODO need to initialize argc and argv properly
    // TODO need to make nicer

    rule
        <k> callMain
            => call(i(32), callee(name(globalVar, "__libc_start_main_2"),
                arguments((
                    val(name(globalVar, "main")), // address of main
                    val(0), // argc
                    val(alloca(i(8), 8, 0, 0, false)),
                    val('nullOfConstValueRef(.KList)), // init
                    val('nullOfConstValueRef(.KList)), // fini
                    val('nullOfConstValueRef(.KList)) // ldso_fini
                ))
            ))
        </k>
        <threadId> Tid:Int </threadId>
        <threadStatus> M:Map => M[Tid <-
                   pthreadGlobal(true, PTHREAD_RUNNING, .K)] </threadStatus>
        <currModule> ModName:SymbolicValueRef </currModule>
        <funModuleName> ModName </funModuleName>
        <functionName> name(globalVar, "main") </functionName>
        <formalParameters> arguments(L:ElemList) </formalParameters>
        when lengthOfList(L) ==Int 2

    rule [terminate-exit]:
        <T>...
            <k> I:KResult => call(void, callee(name(globalVar, "exit"), arguments(val(I)))) </k>
        ...</T>

    // TODO it's not clear whether this belongs here or in SYSCALLS-IMPL
    //output buffer need to in a final state.
    rule
        <T>...
            <k> 'sys-exit-group(I:Int,, _) ...</k>
            <output> .List </output>
        ...</T>
        =>
        <result>...
            <returnValue> I remInt 256 </returnValue>
        ...</result>

endmodule
