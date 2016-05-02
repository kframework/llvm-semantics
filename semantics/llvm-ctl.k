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

    syntax KResult ::= block(K, K, K, Set, Set)//current name, num, inst content, prev inst, next insts, 
    syntax KItem ::= labelInst(K, K)
                   | labelAllBlocks(Map)
                   | labelInst(K, K, K)//name, insts, first
                   | labelInstNextBlock(K, Set)
                   | firstLast(K, K)//first inst num, last inst num
                   | labelInsts(K, Map)
                   | getContent(K) [function]
                   | "fillFirstLasts"
                   | fillFirstLasts(Map)
                   | fillFirstLast(K, K)
                   | fillFirst(K, Set, K)
                   | fillLast(K, Set, K)

    rule getContent(blockContent(C:K, _:Set, _:Set, _:Set, _:Set, _:Set)) => C
    rule getContent(K:K) => K [owise]

    rule <k> gotoMain => labelInst(B, C) ~> labelAllBlocks(M') ~> fillFirstLasts ...</k>
         <currFunction> _:K => name(globalVar, "main") </currFunction>
         <visitedBlocks> S:Set => SetItem(B) </visitedBlocks>
         <labelInsts> M:Map => .Map </labelInsts>
         <currModule> ModName:SymbolicValueRef </currModule>
         <funModuleName> ModName:SymbolicValueRef </funModuleName>
         <functionName> name(globalVar, "main") </functionName>
         <initialBasicBlock> B:SymbolicValueRef </initialBasicBlock>
         <basicBlocks> M':Map (B |-> blockContent(C:K, _:Set, _:Set, _:Set, _:Set, _:Set)) </basicBlocks>

    rule labelAllBlocks((Name:K |-> B:K) M:Map)
          => labelInst(Name, getContent(B)) ~> labelAllBlocks(M)
    rule labelAllBlocks(.Map) => .K

    rule <k> labelInst(Name:K,  setBlock(K:K) ~> A:KItem ~> .K)
            => .K ...</k>
         <firstLastInst> M':Map => M'[Name <- firstLast(I, I)] </firstLastInst>
         <labelInsts> M:Map => M[I <- block(Name, I, A, .Set, .Set)] </labelInsts>
         <instNum> I => I +Int 1 </instNum>

    rule <k> labelInst(Name:K,  setBlock(K:K) ~> A:KItem ~> K:K)
            => labelInst(Name, K, I) ...</k>
         <labelInsts> M:Map => M[I <- block(Name, I, A, .Set, SetItem(I +Int 1))] </labelInsts>
         <instNum> I => I +Int 1 </instNum>
         requires K =/=K .K

    rule <k> labelInst(Name:K,  A:KItem ~> K:K, Prev:K)
            => labelInst(Name, K, Prev) ...</k>
         <labelInsts> M:Map => M[I <- block(Name, I, A, SetItem(I -Int 1), SetItem(I +Int 1))] </labelInsts>
         <instNum> I => I +Int 1 </instNum>
         requires K =/=K .K

    rule <k> labelInst(Name:K,  A:KItem, Prev:K)
            => .K ...</k>
         <firstLastInst> M':Map => M'[Name <- firstLast(Prev, I)] </firstLastInst>
         <labelInsts> M:Map => M[I <- block(Name, I, A, SetItem(I -Int 1), .Set)] </labelInsts>
         <instNum> I => I +Int 1 </instNum>


    rule <k> fillFirstLasts => fillFirstLasts(M) ...</k>
         <firstLastInst> M:Map </firstLastInst>

    rule fillFirstLasts(.Map) => .K
    rule fillFirstLasts((Name:K |-> C:K) M:Map) => fillFirstLast(Name, C) ~> fillFirstLasts(M)

    rule <k> fillFirstLast(Name:K, firstLast(First:K, Last:K))
             => fillFirst(First, In, .K) ~> fillLast(Last, Out, .K) ...</k>
         <currModule> ModName:SymbolicValueRef </currModule>
         <funModuleName> ModName:SymbolicValueRef </funModuleName>
        <currFunction> FunName:SymbolicValueRef </currFunction>
        <functionName> FunName:SymbolicValueRef </functionName>
        <basicBlocks>... Name:K |->
                       blockContent(_:K, Out:Set, In:Set, _:Set, _:Set, _:Set) ...</basicBlocks>

    rule fillFirst(First:K, .Set, .K) => .K
    rule fillFirst(First:K, SetItem(A:K) S:Set, .K) => fillFirst(First, S, A)

    rule <k> fillFirst(First:K, S:Set, A:K) => fillFirst(First, S, .K) ...</k>
         <firstLastInst>... A |-> firstLast(Start:K, Final:K) ...</firstLastInst>
         <labelInsts>... First:K |-> block(_:K, _:K, _:K, FirstSet:Set (.Set => SetItem(Final)), _:Set) ...</labelInsts>

    rule fillLast(Last:K, .Set, .K) => .K
    rule fillLast(Last:K, SetItem(A:K) S:Set, .K) => fillLast(Last, S, A)

    rule <k> fillLast(Last:K, S:Set, A:K) => fillLast(Last, S, .K) ...</k>
         <firstLastInst>... A |-> firstLast(Start:K, Final:K) ...</firstLastInst>
         <labelInsts>... Last:K |-> block(_:K, _:K, _:K, _:Set, LastSet:Set (.Set => SetItem(Start))) ...</labelInsts>
/*
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
*/

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
                          | "not" PathPred                 [onlyLabel, klabel('notPath), strict]
                          > PathPred "or" PathPred         [onlyLabel, klabel('orPath), strict]
                          > PathPred "and" PathPred        [onlyLabel, klabel('andPath), strict]
                          | "E->" PathPred                 [onlyLabel, klabel('existNext), strict]                        /* `next` */
                          | "--E" PathPred "->" PathPred   [onlyLabel, klabel('existuntil), strict]              /* `until` */
                          | PathPred "<-E"                 [onlyLabel, klabel('existPred), strict]                        /* `pred` */
                          | PathPred "<-" PathPred "E--"   [onlyLabel, klabel('existSince), strict]              /* `since` */
                          | "A->" PathPred                 [onlyLabel, klabel('allNext), strict]                        /* `next` */
                          | "--A" PathPred "->" PathPred   [onlyLabel, klabel('allUntil), strict]              /* `until` */
                          | PathPred "<-A"                 [onlyLabel, klabel('allPred), strict]                        /* `pred` */
                          | PathPred "<-" PathPred "A--"   [onlyLabel, klabel('allSince), strict]              /* `since` */

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
