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

    syntax TypeName ::= "var" | "const"

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


    syntax Set ::= "setOfLabels" [function]

    syntax KItem ::= label(KLabel)

    rule setOfLabels => SetItem(label('poisonVal)) SetItem(label('undef)) SetItem(label('vararg))
                        SetItem(label('theAdd)) SetItem(label('theSub)) SetItem(label('theMul))
                        SetItem(label('assign)) SetItem(label('instruction)) SetItem(label('store))
                        SetItem(label('fence)) SetItem(label('ret)) SetItem(label('invoke))
                        SetItem(label('alloca)) SetItem(label('switch)) SetItem(label('conditional))
                        SetItem(label('theTrunc)) SetItem(label('load))

    syntax ElemList ::= getAllInstsWithLabel(K)    [function]

    syntax KItem ::= tupleResult(K, K) // inst label, inst subst
    syntax KResult ::= validSubst(ElemList) //set of tupleResult
    syntax KItem ::= subMap(Map) | "bottom" | "top"
    syntax KItem ::= substSet(Set)
    syntax Bool ::= isLabelInElemList(K, ElemList)    [function]

    rule isLabelInElemList(L:K, .ElemList) => false
    rule isLabelInElemList(L:K, val(L:K), Es:ElemList) => true
    rule isLabelInElemList(L:K, val(L':K), Es:ElemList)
                                  => isLabelInElemList(L, Es)
               requires L =/=K L'

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

    //syntax EquationLabel ::= "normal" | "otherwise"
    syntax Pattern ::= theEq(K)
    syntax PatternList ::= List{Pattern, ""}

    syntax Ids ::= List{Id,","}

    syntax InstLevel ::= Id "(" Ids ")" "<=>" PatternList   [onlyLabel, klabel('thePattern)]

    syntax TheAtomic ::= Id "(" Ids ")"                      [onlyLabel, klabel('ruleName)]
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

    syntax KItem ::= KItem ":" KItem [onlyLabel, klabel('hasType)]

endmodule

module LLVM-CTL
    imports LLVM-CTL-SYNTAX
    imports LLVM-SEMANTICS
    imports LLVM-CONNECTION

    syntax KItem ::= interpret(K, K) //terms, rules
                   | interpret(KList, KList)

    syntax Int ::= size(KList) [function]

    rule size(.KList) => 0
    rule size(_:K,, Kl:KList) => 1 +Int size(Kl)


    rule interpret(.KList, .KList) => .K
    rule interpret(A:K,, Kl:KList, B:K,, Kl':KList) => interpret(A, B) ~> interpret(Kl, Kl')

    rule interpret(A:KLabel(Kl:KList), A:KLabel(Kl':KList)) => interpret(Kl, Kl')
         requires size(Kl) ==Int size(Kl')

    rule interpret(A:KLabel(Kl:KList), B:KLabel(Kl':KList)) => false
         requires size(Kl) =/=Int size(Kl') orBool A =/=KLabel B

    rule <k> interpret(A:KLabel(.KList), E:Id) </k>
         <substs> M:Map => M[E <- A(.KList)] </substs>

    
    syntax ElemList ::= constructComp(ElemList, ElemList)   [function]
                      | constructExNext(ElemList, Map)      [function]
                      | constructAllNext(ElemList, Map)     [function]
                      | constructOr(ElemList, ElemList)     [function]
                      | constructAnd(ElemList, ElemList)    [function]
                      | getRidBottom(ElemList)              [function]
                      | mergeOrInst(K, ElemList)            [function]
                      | mergeAndInst(K, ElemList)           [function]
                      | mergeExNext(Set, K)                 [function]
                      | mergeAllNext(Set, K)                [function]

    syntax KItem ::= mergeMapInOr(Map, K, K, Map)           [function]
                   | mergeMapInAnd(Map, K, K, Map)          [function]

    rule getRidBottom(.ElemList) => .ElemList
    rule getRidBottom(val(tupleResult(L:K, bottom)), Es:ElemList) => getRidBottom(Es)
    rule getRidBottom(val(tupleResult(L:K, Subst:K)), Es:ElemList) 
            => val(tupleResult(L:K, Subst:K)),getRidBottom(Es)
         requires Subst =/=K bottom

    rule <k> 'notPath(validSubst(Es:ElemList))
                   => validSubst(getRidBottom(constructComp(getAllInstsWithLabel(Prog), Es))) ...</k>
         <llvmProg> Prog:K </llvmProg>

    rule constructComp(.ElemList, Es:ElemList) => .ElemList
    rule constructComp((val(tupleResult(L:A, Subst:K)), Es:ElemList), Es':ElemList)
               => constructComp(Es, Es')
               requires isLabelInElemList(L, Es')
    rule constructComp((val(tupleResult(L:A, Subst:K)), Es:ElemList), Es':ElemList)
               => val(tupleResult(L, top)), constructComp(Es, Es')
               requires notBool isLabelInElemList(L, Es')


    rule 'orPath(validSubst(Es:ElemList), validSubst(Es':ElemList))
                   => validSubst(getRidBottom(constructOr(Es, Es')))

    rule constructOr(Es:ElemList, .ElemList) => Es
    rule constructOr(Es, val(A:K),Es':ElemList) => constructOr(mergeOrInst(A, Es), Es')

    rule mergeOrInst(A:K, .ElemList) => val(A),.ElemList
    rule mergeOrInst(tupleResult(L:K, Subst:K), val(tupleResult(L':K, Subst':K)),Es:ElemList)
          => val(tupleResult(L':K, Subst':K)),mergeOrInst(tupleResult(L:K, Subst:K), Es)
           requires L =/=K L'
    rule mergeOrInst(tupleResult(L:K, top), val(tupleResult(L:K, Subst':K)),Es:ElemList)
          => val(tupleResult(L:K, Subst':K)),Es
    rule mergeOrInst(tupleResult(L:K, Subst:K), val(tupleResult(L:K, top)),Es:ElemList)
          => val(tupleResult(L:K, Subst)),Es
    rule mergeOrInst(tupleResult(L:K, subMap(M:Map)), val(tupleResult(L:K, subMap(M':Map))),Es:ElemList)
          => val(tupleResult(L:K, mergeMapInOr(M, .K, .K, M'))),Es

    rule mergeMapInOr(M:Map, .K, .K, .Map) => subMap(M)
    rule mergeMapInOr(M:Map, .K, .K, (Key:K |-> V:K) M':Map) => mergeMapInOr(M, Key, V, M')
    rule mergeMapInOr(M:Map A |-> substSet(S':Set), A:K, substSet(S:Set), M':Map)
                   => mergeMapInOr(M A |-> substSet(S S'), .K, .K, M')
    rule mergeMapInOr(M:Map, A:K, substSet(S:Set), M':Map)
                   => mergeMapInOr(M[A <- substSet(S)], .K, .K, M')
          requires notBool A in keys(M)


    rule 'andPath(validSubst(Es:ElemList), validSubst(Es':ElemList))
                   => validSubst(getRidBottom(constructAnd(Es, Es')))

    rule constructAnd(Es:ElemList, .ElemList) => Es
    rule constructAnd(Es, val(A:K),Es':ElemList) => constructAnd(mergeAndInst(A, Es), Es')

    rule mergeAndInst(A:K, .ElemList) => val(A),.ElemList
    rule mergeAndInst(tupleResult(L:K, Subst:K), val(tupleResult(L':K, Subst':K)),Es:ElemList)
          => val(tupleResult(L':K, Subst':K)),mergeAndInst(tupleResult(L:K, Subst:K), Es)
           requires L =/=K L'
    rule mergeAndInst(tupleResult(L:K, top), val(tupleResult(L:K, Subst':K)),Es:ElemList)
          => val(tupleResult(L:K, Subst':K)),Es
    rule mergeAndInst(tupleResult(L:K, Subst:K), val(tupleResult(L:K, top)),Es:ElemList)
          => val(tupleResult(L:K, Subst)),Es
    rule mergeAndInst(tupleResult(L:K, subMap(M:Map)), val(tupleResult(L:K, subMap(M':Map))),Es:ElemList)
          => val(tupleResult(L:K, mergeMapInAnd(M, .K, .K, M'))),Es

    rule mergeMapInAnd(M:Map, .K, .K, .Map) => subMap(M)
    rule mergeMapInAnd(M:Map, .K, .K, (Key:K |-> V:K) M':Map) => mergeMapInAnd(M, Key, V, M')
    rule mergeMapInAnd(M:Map A |-> substSet(S':Set), A:K, substSet(S:Set), M':Map)
                   => mergeMapInAnd(M A |-> substSet(intersectSet(S, S')), .K, .K, M')
         requires (notBool intersectSet(S, S') <=Set .Set)
    rule mergeMapInAnd(M:Map, A:K, substSet(S:Set), M':Map)
                   => mergeMapInAnd(M[A <- substSet(S)], .K, .K, M')
          requires notBool A in keys(M)
    rule mergeMapInAnd(M:Map A |-> substSet(S':Set), A:K, substSet(S:Set), M':Map)
                   => bottom
         requires intersectSet(S, S') <=Set .Set

    rule <k> 'existNext(validSubst(Es:ElemList))
                   => validSubst(getRidBottom(constructExNext(Es, M))) ...</k>
         <llvmProg> Prog:K </llvmProg>
         <labelInsts> M:Map </labelInsts>

    rule constructExNext(.ElemList, M:Map) => .ElemList
    rule constructExNext((val(tupleResult(L:A, Subst:K)), Es:ElemList), M:Map (L |-> block(A:K, B:K, C:K, Prev:Set, Next:Set)))
               => combineElemList(mergeExNext(Prev, .K), constructExNext(Es, M:Map (L |-> block(A:K, B:K, C:K, Prev:Set, Next:Set))))
    
    rule mergeExNext(.Set, .K) => .ElemList
    rule mergeExNext(SetItem(L:K) S:Set, .K) => mergeExNext(S, L)
    rule mergeExNext(S:Set, L:KItem) => val(tupleResult(L, top)),mergeExNext(S, .K)


    rule <k> 'allNext(validSubst(Es:ElemList))
                   => validSubst(getRidBottom(constructExNext(Es, M))) ...</k>
         <llvmProg> Prog:K </llvmProg>
         <labelInsts> M:Map </labelInsts>

    rule constructExNext(.ElemList, M:Map) => .ElemList
    rule constructExNext((val(tupleResult(L:A, Subst:K)), Es:ElemList), M:Map (L |-> block(A:K, B:K, C:K, Prev:Set, Next:Set)))
               => combineElemList(mergeExNext(Prev, .K), constructExNext(Es, M:Map (L |-> block(A:K, B:K, C:K, Prev:Set, Next:Set))))
    
    rule mergeExNext(.Set, .K) => .ElemList
    rule mergeExNext(SetItem(L:K) S:Set, .K) => mergeExNext(S, L)
    rule mergeExNext(S:Set, L:KItem) => val(tupleResult(L, top)),mergeExNext(S, .K)



    //rule constructComp(.Set, .K, Keys:Set) => .Set
    //rule constructComp(SetItem(A:K) S:Set, .K, Keys:Set) => constructComp(S, A, Keys)
    //rule constructComp(S:Set, tupleResult(K, Map), Keys - )

    //rule 'notPath(validSubst(S:Set)) => 

/*
    rule uses(a) <=> theEq(theAdd(T, hasType(a, var), hasType(b, var))
                                    ,valValue(a),valValue(b),normal)
            theEq(theSub(T, hasType(a, var), hasType(b, var)),valValue(a),valValue(b),normal)
            theEq(A,false,otherwise)

    rule usesTerm(c, t) <=> c = t <-A not c = t'-- uses c

    rule theRewrite(I, I[t/c], usesTerm c (hasType(t, int)))
*/


endmodule
