// Copyright (c) 2013-2015 Liyi. All Rights Reserved.
requires "llvm-syntax.k"
requires "llvm-abstractsyntax.k"
requires "llvm-settings.k"
requires "llvm-helpers.k"
requires "llvm-standard-library-syntax.k"
requires "llvm-syscalls-syntax.k"
requires "llvm-configuration.k"
requires "llvm-clean-tree.k"
requires "llvm-globals.k"
requires "llvm-registers.k"
requires "llvm-branching.k"
requires "llvm-phi.k"
requires "llvm-selection.k"
requires "llvm-start-and-stop.k"
requires "llvm-preprocessing.k"
requires "llvm-normalizing.k"
requires "llvm-declarations.k"
requires "llvm-call-ret.k"
requires "llvm-variadics.k"
requires "llvm-semantics.k"
//requires "ctl-semantics.k"

module LLVM-CONNECTION
    imports LLVM-SEMANTICS

    //imports CTL-SEMANTICS

    /* CTL* models */
    /*-------------*/

    /* TODO: Perhaps we have a `Model` configuration which must have some
     * ability to query for `succ(NodeLabel)` and `pred(NodeLabel)` from. Then
     * someone must just specify how the `Model` configuration is structured.
     */

    /* a CTL* model defines the NodeLabels and succ/pred functions */
/*
    syntax TypeName ::= "var" | "int"
    syntax Bool ::= hasType(K, TypeName)    [function]
    rule hasType(I:Int, int) => true
    rule hasType(V:SymbolicValueRef, var) => true
    rule hasType(A:K, B:TypeName) => false
*/

    rule <k> gotoMain => .K </k>
         <currFunction> _:K => name(globalVar, "main") </currFunction>

    syntax KResult ::= block(K, K, K, K)//current name, inst, prev inst, next insts, remains
                   | "entryBlock"
                   | exitBlock(K, K) //name, prev inst
    syntax ElemList ::= getNextBlock(KItem)
                      | findNextBlock(K, K, K, K) //name, prev, cur, next
                      | findNextBlockInBr(K, Set, ElemList)
                      | getPrevBlock(KItem)
                      | findPrevBlock(K, K, K, K)
                      | findPrevBlockInBr(K, Set, ElemList)

    syntax KItem ::= nextBlock(K, K)    [function]//name, insts.
                   | prevBlock(K, K)
    rule nextBlock(A:K, setBlock(B:K) ~> Init:KItem ~> K:K)
               => block(A, .K, Init, K)
    rule nextBlock(A:K, setBlock(B:K))
               => block(A, .K, .K, .K)
    rule nextBlock(A:K, .K)
               => block(A, .K, .K, .K)
    rule prevBlock(Name:K, .K) => block(Name, .K, .K, .K)
    rule prevBlock(Name:K, A:K ~> B:KItem) => block(Name, A, B, .K)

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

    rule getPrevBlock(exitBlock(Name:K, K:K)) => valValue(prevBlock(Name, K))
    rule getPrevBlock(entryBlock) => .ElemList
    rule getNextBlock(exitBlock(Name:K, K:K)) => .ElemList

    rule getPrevBlock(block(A:K, Prev:K, Old:K, K:K))
                  => findPrevBlock(A, Prev, Old, K)
    rule getNextBlock(block(A:K, Prev:K, Old:K, K:K))
                  => findNextBlock(A, Prev, Old, K) 

    rule findPrevBlock(Name:K, Prev:K ~> Old:KItem, A:KItem, K:K)
                     => valValue(block(Name, Prev, Old, A ~> K))

    rule findNextBlock(Name:K, Prev:K, ret(A:K, B:K), .K)
                                => valValue(exitBlock(Name, Prev ~> ret(A, B)))
    rule findNextBlock(Name:K, Prev:K, unreachable, .K)
                           => valValue(exitBlock(Name, Prev ~> unreachable))

    rule findNextBlock(Name:K, Prev:K, A:KItem, K:K) => valValue(block(Name, Prev, A, K))
         requires K =/=K .K


    rule 
        <k> findPrevBlock(Name:SymbolicValueRef, .K, A:K, Old:K)
                           => findPrevBlockInBr(.K, In, .ElemList) ...</k>
        <visitedBlocks> S:Set </visitedBlocks>
        <currModule> ModName:SymbolicValueRef </currModule>
        <funModuleName> ModName </funModuleName>
        <currFunction> FunName:SymbolicValueRef </currFunction>
        <functionName> FunName:SymbolicValueRef </functionName>
        <basicBlocks>... Name |-> blockContent(_:K, _:Set, In:Set, _:Set, _:Set, _:Set) ...</basicBlocks>
        requires A =/=K .K

    rule 
        <k> findNextBlock(Name:SymbolicValueRef, Prev:K, A:K, .K)
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

    rule findPrevBlockInBr(.K, .Set, E:ElemList) => E
    rule findPrevBlockInBr(.K, SetItem(A:K) S:Set, E:ElemList)
                => findPrevBlockInBr(A, S, E)

    rule 
        <k> findPrevBlockInBr(Name:SymbolicValueRef, S:Set, E:ElemList)
                     => findPrevBlockInBr(.K, S, valValue(prevBlock(Name, K)), E) ...</k>
        <visitedBlocks> S:Set (.Set => SetItem(Name)) </visitedBlocks>
        <currModule> ModName:SymbolicValueRef </currModule>
        <funModuleName> ModName </funModuleName>
        <currFunction> FunName:SymbolicValueRef </currFunction>
        <functionName> FunName:SymbolicValueRef </functionName>
        <basicBlocks>... Name |->
                    blockContent(K:K, _:Set, _:Set, _:Set, _:Set, _:Set) ...</basicBlocks>
        requires notBool (Name in S)

    rule 
        <k> findPrevBlockInBr(Name:SymbolicValueRef, S:Set, E:ElemList)
              => findPrevBlockInBr(.K, S, E) ...</k>
        <visitedBlocks> S:Set </visitedBlocks>
        <currModule> ModName:SymbolicValueRef </currModule>
        <funModuleName> ModName </funModuleName>
        <currFunction> FunName:SymbolicValueRef </currFunction>
        <functionName> FunName:SymbolicValueRef </functionName>
        <basicBlocks> M:Map </basicBlocks>
        requires notBool (Name in keys(M)) orBool Name in S

endmodule

module LLVM-CTL-SYNTAX
    imports LLVM-SEMANTICS

    syntax EquationLabel ::= "normal" | "otherwise"
    syntax Equation ::= theEq(K, ElemList, EquationLabel)
    syntax EquationList ::= List{Equation, ""}

    syntax InstLevel ::= Id "(" Id ")" "<=>" EquationList   [onlyLabel, klabel('theEquation)]

    syntax TheAtomic ::= Id "(" Id ")"                      [onlyLabel, klabel('ruleName)]
/*
    syntax PathQuant    ::= "A" [onlyLabel, klabel('allPath)]
                          | "E" [onlyLabel, klabel('existPath)]
*/
    syntax PathPred     ::=  "(" PathPred ")"    [bracket]
                          | TheAtomic
                          | "not" PathPred                 [onlyLabel, klabel('notPath)]
                          > PathPred "or" PathPred         [onlyLabel, klabel('orPath)]
                          > PathPred "and" PathPred        [onlyLabel, klabel('andPath)]
                          | "E->" PathPred                 [onlyLabel, klabel('existNext)]                        /* `next` */
                          | "--E" PathPred "->" PathPred   [onlyLabel, klabel('existuntil)]              /* `until` */
                          | PathPred "<-E"                 [onlyLabel, klabel('existPred)]                        /* `pred` */
                          | PathPred "<-" PathPred "E--"   [onlyLabel, klabel('existSince)]              /* `since` */
                          | "A->" PathPred                 [onlyLabel, klabel('allNext)]                        /* `next` */
                          | "--A" PathPred "->" PathPred   [onlyLabel, klabel('allUntil)]              /* `until` */
                          | PathPred "<-A"                 [onlyLabel, klabel('allPred)]                        /* `pred` */
                          | PathPred "<-" PathPred "A--"   [onlyLabel, klabel('allSince)]              /* `since` */

    syntax KItem ::= KItem ";" KItem               [left, klabel('addNode)]
                   | KItem "[" KItem "/" KItem "]" [klabel('replaceNode)]
                   | ".Node"                       [klabel('deleteNode)]

    syntax TheRewrite ::= theRewrite(K, K, PathPred)   [strict(3)]
                        | TheRewrite ";" TheRewrite    [left, klabel('compose)]
                        | TheRewrite "*"


endmodule

module LLVM-CTL
    imports LLVM-CTL-SYNTAX
    imports LLVM-SEMANTICS
    imports LLVM-CONNECTION
/*
    rule uses(a) <=> theEq(theAdd(T, hasType(a, var), hasType(b, var))
                                    ,valValue(a),valValue(b),normal)
            theEq(theSub(T, hasType(a, var), hasType(b, var)),valValue(a),valValue(b),normal)
            theEq(A,false,otherwise)

    rule usesTerm(c, t) <=> c = t <-A not c = t'-- uses c

    rule theRewrite(I, I[t/c], usesTerm c (hasType(t, int)))
*/


endmodule
