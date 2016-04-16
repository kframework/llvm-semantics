// Copyright (c) 2013-2015 K Team. All Rights Reserved.
requires "llvm-syntax.k"
requires "llvm-abstractsyntax.k"
requires "llvm-settings.k"
requires "llvm-helpers.k"
requires "llvm-standard-library-syntax.k"
requires "llvm-syscalls-syntax.k"
requires "llvm-configuration.k"

module LLVM-BRANCHING
    imports LLVM-SYNTAX
    imports LLVM-ABSTRACTSYNTAX
    imports LLVM-SETTINGS
    imports LLVM-HELPERS
    imports LLVM-STANDARD-LIBRARY-SYNTAX
    imports LLVM-SYSCALLS-SYNTAX
    imports LLVM-CONFIGURATION

    rule
        <k> unconditional(name(Label:K, S:String)) => B </k>
        <currModule> ModName:SymbolicValueRef </currModule>
        <funModuleName> ModName </funModuleName>
        <currFunction> FunName:SymbolicValueRef </currFunction>
        <functionName> FunName </functionName>
        <basicBlocks>... name(Label:K, S:String) |-> B:K ...</basicBlocks>

    rule
        <k> conditional(I:Int, Label:K, _)
            => unconditional(Label:K)
        </k>
        when normalizingInt(integerType(1), I) ==Int 1
    rule
        <k> conditional(I:Int, _, Label:K)
            => unconditional(Label:K)
        </k>
        when normalizingInt(integerType(1), I) ==Int 0

    // TODO put static switch information into a map like with phi nodes
    // TODO semantic design pattern: list traversal -> statically storing info and using simple rules later
    rule [switch-default]:
        <k> switch(_, I:Int, Label:K, listK(.List))
            => unconditional(Label:K)
        </k>
    rule [switch-hit]:
        <k> switch(Type:KResult, I:Int, _, listK(ListItem(caseValue(I':Int, Label:K)) L:List))
            => unconditional(Label:K)
        </k>
        when unsigned(Type, I) ==Int unsigned(Type, I')
    rule [switch-miss]:
        <k> switch(
                Type:KResult,
                I:Int,
                _,
                listK(ListItem(caseValue(I':Int, Label:K)) L:List
                     => L)
            )
        </k>
        when unsigned(Type, I) =/=Int unsigned(Type, I')

endmodule
