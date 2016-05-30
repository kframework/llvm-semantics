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
        <basicBlocks>... name(Label:K, S:String)
                             |-> blockContent(B:K, _:Set, _:Set, _:Set, _:Set, _:Set) ...</basicBlocks>

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
        switch(_, I:Int, Label:K, .ElemList)
            => unconditional(Label:K)

    rule [switch-hit]:
        switch(Type:KResult, I:Int, _, valValue(caseValue(I':Int, Label:K)), L:ElemList)
            => unconditional(Label:K)
        when I ==Int deNormalizingInt(Type, normalizingInt(Type, I))

    rule [switch-miss]:
        switch(Type:KResult, I:Int, La:K,
                valValue(caseValue(I':Int, Label:K)), L:ElemList)
          => switch(Type:KResult, I:Int, La:K, L:ElemList)
        when I =/=Int deNormalizingInt(Type, normalizingInt(Type, I))

    rule [indirect-hit]:
        indirectbr(blockValue(A:SymbolicValueRef), val(A), Es:ElemList)
          => unconditional(A)
    rule [indirect-traverse]:
        indirectbr(blockValue(A:SymbolicValueRef), val(B), Es:ElemList)
          => indirectbr(blockValue(A:SymbolicValueRef), Es)
        requires A =/=K B
    rule [indirect-failed-A]:
        <k> indirectbr(blockValue(A:SymbolicValueRef), .ElemList) ~> K:K
          => .K </k>
        <output>... .List => ListItem("error: undefined bahavior due to no such label in the label list of a indirectbr") </output>
    rule [indirect-failed-B]:
        <k> indirectbr(A:K, Es:ElemList) ~> K:K
          => .K </k>
        <output>... .List => ListItem("error: indirectbr address must be derived from a blockaddress constant") </output>
        requires getKLabel(A) =/=KLabel 'blockValue

endmodule
