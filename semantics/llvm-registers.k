// Copyright (c) 2013-2015 K Team. All Rights Reserved.
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

    rule [assign-register]:
        <k> assign(X:SymbolicValueRef, V:KResult) => . ...</k>
        <registers> M:Map => M[X <- V] </registers>

    // TODO using constructors in the AST instead of matching on a string
    rule [lookup-register]:
        <k> name(S:String) => searchElemInMap(M,.K,name(S)) ...</k>
        <registers> M:Map </registers>
        when substrString(S, 0, 1) ==String "%"
           andBool searchElemInMap(M,.K,name(S)) =/=K none

    rule [lookup-global-register]:
        <k> name(S:String) => searchElemInMap(M,.K,name(S)) ...</k>
        <globalRegisters> M:Map </globalRegisters>
        when substrString(S, 0, 1) ==String "@"
           andBool searchElemInMap(M,.K,name(S)) =/=K none

endmodule
