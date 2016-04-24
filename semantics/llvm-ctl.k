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

    rule 
        <k> getNextBlock(entryBlock) => valValue(block(Name, B, K)) ...</k>
        <visitedBlocks> S:Set (.Set => SetItem(Name)) </visitedBlocks>
        <currModule> ModName:SymbolicValueRef </currModule>
        <funModuleName> ModName </funModuleName>
        <currFunction> FunName:SymbolicValueRef </currFunction>
        <functionName> FunName:SymbolicValueRef </functionName>
        <basicBlocks>... Name:SymbolicValueRef |-> (setBlock(A:K) ~> B:KItem ~> K:K) ...</basicBlocks>
        <initialBasicBlock> Name </initialBasicBlock>

    rule getNextBlock(block(_:K, ret(_:K, _:K), _:K)) => valValue(exitBlock)

    rule getNextBlock(block(Name:K, _:K, A:KItem ~> K:K)) => valValue(block(Name, A, K))
         requires K =/=K .K

    rule 
        <k> getNextBlock(block(Name:K, conditional(Op:K,
                  Br1:SymbolicValueRef, Br2:SymbolicValueRef), _:K))
                           => valValue(block(Br1,.K,M[Br1])),valValue(block(Br2,.K,M[Br2])) ...</k>
        <visitedBlocks> S:Set (.Set => SetItem(Br1) SetItem(Br2)) </visitedBlocks>
        <currModule> ModName:SymbolicValueRef </currModule>
        <funModuleName> ModName </funModuleName>
        <currFunction> FunName:SymbolicValueRef </currFunction>
        <functionName> FunName:SymbolicValueRef </functionName>
        <basicBlocks> M:Map </basicBlocks>
        requires Br1 in keys(M) andBool Br2 in keys(M)
                 andBool notBool (Br1 in S) andBool notBool (Br2 in S)

    rule 
        <k> getNextBlock(block(Name:K, conditional(Op:K,
                  Br1:SymbolicValueRef, Br2:SymbolicValueRef), _:K))
                           => valValue(block(Br1,.K,M[Br1])) ...</k>
        <visitedBlocks> S:Set (.Set => SetItem(Br1)) </visitedBlocks>
        <currModule> ModName:SymbolicValueRef </currModule>
        <funModuleName> ModName </funModuleName>
        <currFunction> FunName:SymbolicValueRef </currFunction>
        <functionName> FunName:SymbolicValueRef </functionName>
        <basicBlocks> M:Map </basicBlocks>
        requires Br1 in keys(M)
                 andBool notBool (Br1 in S) andBool (Br2 in S)

    rule 
        <k> getNextBlock(block(Name:K, conditional(Op:K,
                  Br1:SymbolicValueRef, Br2:SymbolicValueRef), _:K))
                           => valValue(block(Br2,.K,M[Br2])) ...</k>
        <visitedBlocks> S:Set (.Set => SetItem(Br2)) </visitedBlocks>
        <currModule> ModName:SymbolicValueRef </currModule>
        <funModuleName> ModName </funModuleName>
        <currFunction> FunName:SymbolicValueRef </currFunction>
        <functionName> FunName:SymbolicValueRef </functionName>
        <basicBlocks> M:Map </basicBlocks>
        requires  Br2 in keys(M)
                 andBool (Br1 in S) andBool notBool (Br2 in S)


    rule block(A:K, .K, setBlock(A:K) ~> C:KItem ~> K:K) => block(A, C, K) [anywhere]

    syntax EquationLabel ::= "normal" | "otherwise"
    syntax Equation ::= theEq(K, ElemList, EquationLabel)
    syntax EquationList ::= List{Equation, ""}

    syntax InstLevel ::= Id "(" Id ")" "<=>" EquationList   [onlyLabel, klabel('theEquation)]

    syntax TheAtomic ::= theAtomic(Id, EquationList)
                   | Id "(" Id ")"    [onlyLabel, klabel('ruleName)]

    syntax KItem ::= interpretAtomic(K, K) [strict(2)]// theAtomic, block
    syntax KItem ::= getOtherwise(EquationList)  [function]
                   | searchList(EquationList, K)
    rule getOtherwise(.EquationList) => false
    rule getOtherwise(theEq(A:K, B:K, otherwise) Es:EquationList)
                     => theEq(A, B, otherwise)
    rule getOtherwise(theEq(A:K, B:K, normal) Es:EquationList)
                     => getOtherwise(Es)
    
    syntax Map ::= match(K, K) [function]
                 | match(KList, KList) [function]
    syntax ElemList ::= subst(Map, ElemList)
    syntax KItem ::= searchList(EquationList, K, Equation)

    rule match(L:KLabel(KL:KList), L':KLabel(KL':KList)) => match(KL, KL')
    rule match(.KList, .KList) => .Map
    rule match(A:K,, KL:KList, B:K ,,KL':KList) => (A |-> B) match(KL, KL')

    rule subst(M:Map, val(K:K) Es:ElemList) => .ElemList
    rule subst(M:Map, val(K:K) Es:ElemList) => val(M[K]) subst(Map, Es)
         requires K in keys(M)
    rule subst(M:Map, val(K:K) Es:ElemList) => false
         requires notBool (K in keys(M))
    
    rule <base> interpretAtomic('ruleName(A:Id,, B:Id), block(Name:K, K:K, KL:K))
                                => searchList(Es, K:K, getOtherwise(Es))
             ~> interpretAtomic('ruleName(A:Id,, B:Id), getNextBlock(block(Name:K, K:K, KL:K))) ...</base>
        <equations>... A |-> theAtomic(S:Id, Es:EquationList) ...</equations>

    rule <base> interpretAtomic('ruleName(A:Id,, B:Id), exitBlock) ~> K:K
                                => false </base>

    rule <until> interpretAtomic('ruleName(A:Id,, B:Id), block(Name:K, K:K, KL:K))
                                => searchList(Es, K:K, getOtherwise(Es))
             ~> interpretAtomic('ruleName(A:Id,, B:Id), getNextBlock(block(Name:K, K:K, KL:K))) ...</until>
        <equations>... A |-> theAtomic(S:Id, Es:EquationList) ...</equations>

    rule <until> interpretAtomic('ruleName(A:Id,, B:Id), exitBlock) ~> K:K
                                => false </until>

    rule <base> E:ElemList => .K ...</base><until> false => .K ...</until>
    rule <until> E:ElemList => .K ...</until>
         <boolResult> _:K => E <boolResult>

    rule searchList(.EquationList, K:K, F:K) => subst(match(F, K), R)
    rule searchList(theEq(K':K, R:K, normal) Es:EquationList, K:K, F:K)
               => subst(match(K', K), R)
         requires getKLabel(K') ==K getKLabel(K)
    rule searchList(theEq(K':K, R:K, normal) Es:EquationList, K:K, F:K)
           => searchList(Es:EquationList, K:K, F:K)
         requires getKLabel(K') =/=K getKLabel(K)

    syntax PathQuant    ::= "A" | "E"
    syntax PathPred     ::= "(" PathPred ")"    [bracket]
                          | TheAtomic
                          | "not" PathPred
                          > PathPred "or" PathPred
                          > PathPred "and" PathPred
                          | PathQuant "->" PathPred                                   /* `next` */
                          | PathQuant "--" PathPred "->" PathPred                     /* `until` */
                          | PathPred "<-" PathQuant                                   /* `pred` */
                          | PathPred "<-" PathPred "--" PathQuant                  /* `since` */

    rule <k> A -- 'ruleName(A:Id,, B:Id) -> 'ruleName(C:Id,, D:Id) ...</k>
         ( .Bag => <base> interpretAtomic('ruleName(A:Id,, B:Id), getNextBlock(entryBlock))  </base>
                   <until> interpretAtomic('ruleName(C:Id,, D:Id), getNextBlock(entryBlock))  </until>
                   <visitedBlocks> .Set </visitedBlocks>)

    syntax Ids ::= List{Id, ","}

    syntax PatternLevel ::= Id "(" Ids ")" "<=>" PathPred   [onlyLabel, klabel('thePattern)]

    syntax KItem ::= substInBlock(K, K)

    syntax TheRewrite ::= theRewrite(K, K, PathPred)   [strict(3)]
                        | TheRewrite ";" TheRewrite
                        | TheRewrite "*"

    rule theRewrite(LK, RK, .ElemList) => .K
    rule theRewrite(LK, RK, valValue(K:K), Es:ElemList)
              => substInBlock(K, subst(match(LK, K), RK)) ~> theRewrite(LK, RK, Es)

    rule A:TheRewrite ; B:TheRewrite => A ~> Ba



endmodule
