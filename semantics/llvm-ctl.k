// Copyright (c) 2013-2015 Liyi. All Rights Reserved.
requires "llvm-syntax.k"
requires "llvm-abstractsyntax.k"
requires "llvm-settings.k"
requires "llvm-helpers.k"
requires "llvm-standard-library-syntax.k"
requires "llvm-syscalls-syntax.k"
requires "llvm-configuration.k"
requires "llvm-preprocessing.k"
requires "llvm-normalizing.k"
requires "llvm-declarations.k"
requires "ctl-semantics.k"

module LLVM-CTL
    imports LLVM-SYNTAX
    imports LLVM-ABSTRACTSYNTAX
    imports LLVM-SETTINGS
    imports LLVM-HELPERS
    imports LLVM-STANDARD-LIBRARY-SYNTAX
    imports LLVM-SYSCALLS-SYNTAX
    imports LLVM-CONFIGURATION
    imports LLVM-PREPROCESSING
    imports LLVM-NORMALIZING
    imports LLVM-DECLARATIONS
    imports CTL-SEMANTICS

    /* CTL* models */
    /*-------------*/

    /* TODO: Perhaps we have a `Model` configuration which must have some
     * ability to query for `succ(NodeLabel)` and `pred(NodeLabel)` from. Then
     * someone must just specify how the `Model` configuration is structured.
     */

    /* a CTL* model defines the NodeLabels and succ/pred functions */

    syntax TypeName ::= "var" | "int"
    syntax Bool ::= hasType(K, TypeName)    [function]
    rule hasType(I:Int, int) => true
    rule hasType(V:SymbolicValueRef, var) => true
    rule hasType(A:K, B:TypeName) => false

    syntax KResult ::= block(K, K, K)//current name, inst, next insts, remains
                   | "entryBlock"
                   | "exitBlock"
    syntax ElemList ::= getNextBlock(KItem)
                      | findNextBlock(K, K, K)
                      | findNextBlockInBr(K, Set, ElemList)

    syntax KItem ::= nextBlock(K, K)    [function]//name, insts.
    rule nextBlock(A:K, setBlock(B:K) ~> Init:KItem ~> K:K)
               => block(A, Init, K)
    rule nextBlock(A:K, .K)
               => block(A, .K, .K)


    rule 
        <k> getNextBlock(entryBlock) => valValue(nextBlock(Name, K)) ...</k>
        <visitedBlocks> S:Set (.Set => SetItem(Name)) </visitedBlocks>
        <currModule> ModName:SymbolicValueRef </currModule>
        <funModuleName> ModName </funModuleName>
        <currFunction> FunName:SymbolicValueRef </currFunction>
        <functionName> FunName:SymbolicValueRef </functionName>
        <basicBlocks>... Name:SymbolicValueRef |->
                       blockContent(K:K, _:Set, _:Set, _:Set, _:Set, _:Set) ...</basicBlocks>
        <initialBasicBlock> Name </initialBasicBlock>

    rule getNextBlock(block(A:K, Old:K, New:KItem ~> K:K)) => findNextBlock(A, New, K) 

    rule findNextBlock(_:K, ret(_:K, _:K), .K) => valValue(exitBlock)
    rule findNextBlock(_:K, unreachable, .K) => valValue(exitBlock)

    rule findNextBlock(Name:K, A:KItem, K:K) => valValue(block(Name, A, K))
         requires K =/=K .K

    rule 
        <k> findNextBlock(Name:SymbolicValueRef, A:K, _:K)
                           => findNextBlockInBr(.K, Out, .ElemList) ...</k>
        <visitedBlocks> S:Set </visitedBlocks>
        <currModule> ModName:SymbolicValueRef </currModule>
        <funModuleName> ModName </funModuleName>
        <currFunction> FunName:SymbolicValueRef </currFunction>
        <functionName> FunName:SymbolicValueRef </functionName>
        <basicBlocks>... Name |-> blockContent(_:K, Out:Set, _:Set, _:Set, _:Set, _:Set) ...</basicBlocks>
        requires A =/=K .K andBool getKLabel(A) =/=KLabel 'ret
                 andBool getKLabel(A) =/=KLabel 'unreachable

    rule findNextBlockInBr(.K, .Set, E:ElemList) => E
    rule findNextBlockInBr(.K, SetItem(A:K) S:Set, E:ElemList)
                => findNextBlockInBr(A, S, E)

    rule 
        <k> findNextBlockInBr(Name:SymbolicValueRef, S:Set, E:ElemList)
                     => findNextBlockInBr(.K, S, valValue(nextBlock(Name, K)), E) ...</k>
        <visitedBlocks> S:Set (.Set => SetItem(Name)) </visitedBlocks>
        <currModule> ModName:SymbolicValueRef </currModule>
        <funModuleName> ModName </funModuleName>
        <currFunction> FunName:SymbolicValueRef </currFunction>
        <functionName> FunName:SymbolicValueRef </functionName>
        <basicBlocks>... Name |->
                    blockContent(K:K, _:Set, _:Set, _:Set, _:Set, _:Set) ...</basicBlocks>
        requires notBool (Name in S)

    rule 
        <k> findNextBlockInBr(Name:SymbolicValueRef, S:Set, E:ElemList)
              => findNextBlockInBr(.K, S, E) ...</k>
        <visitedBlocks> S:Set </visitedBlocks>
        <currModule> ModName:SymbolicValueRef </currModule>
        <funModuleName> ModName </funModuleName>
        <currFunction> FunName:SymbolicValueRef </currFunction>
        <functionName> FunName:SymbolicValueRef </functionName>
        <basicBlocks> M:Map </basicBlocks>
        requires notBool (Name in keys(M)) orBool Name in S


endmodule
