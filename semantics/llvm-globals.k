// Copyright (c) 2013-2015 K Team. All Rights Reserved.
requires "llvm-syntax.k"
requires "llvm-abstractsyntax.k"
requires "llvm-settings.k"
requires "llvm-helpers.k"
requires "llvm-standard-library-syntax.k"
requires "llvm-syscalls-syntax.k"
requires "llvm-configuration.k"

module LLVM-GLOBALS
    imports LLVM-SYNTAX
    imports LLVM-ABSTRACTSYNTAX
    imports LLVM-SETTINGS
    imports LLVM-HELPERS
    imports LLVM-STANDARD-LIBRARY-SYNTAX
    imports LLVM-SYSCALLS-SYNTAX
    imports LLVM-CONFIGURATION

    syntax KItem ::= preInit(K, K, K) [strict(2)]

    //for the pointer type of global variable.
    rule
        <k> globalVariable(X:SymbolicValueRef, modifiers(L:ElemList), pointerType(TyK:K,Ad:K), Init:K)
            => preInit(X, alloca(TyK:K, 1, 'alignEmpty(.KList)), initializer(TyK,Init))
        ...</k>
        <currentModifiers> _ => L </currentModifiers>

    //for the array type of global variable.
    rule
        <k> globalVariable(X:SymbolicValueRef, modifiers(L:ElemList)
                , arrayTypeValue(TyK:KResult,Size:Int), Init:K)
            => preInit(X, alloca(TyK, Size, 'alignEmpty(.KList)), initializer(TyK,Init))
        ...</k>
        <currentModifiers> _ => L </currentModifiers>

    //for the struct type of global variable.
    rule
        <k> globalVariable(X:SymbolicValueRef, modifiers(L:ElemList)
                , structTypeValue(TyK:KResult), Init:K)
            => preInit(X, alloca(TyK, 1, 'alignEmpty(.KList)), initializer(TyK,Init))
        ...</k>
        <currentModifiers> _ => L </currentModifiers>

    //for the function type of global variable - an error.
    rule
        <k> globalVariable(X:SymbolicValueRef, modifiers(L:ElemList)
                , functionTypeValue(TyK:K, K':K), Init:K) ~> K
            => .K
        </k>
        <output>... .List => ListItem("error: invalid type for global variable") </output>

    rule
        <k> preInit(X:SymbolicValueRef, Loc:Loc, initializer(TK:K, K:K)) => .K ...</k>
        <savedGlobals>... .K => store(TK:K, K:K, Loc) </savedGlobals>
        <globalRegisters> M:Map => M[X <- Loc] </globalRegisters>

    rule <k> initGlobals => K:K ...</k>
        <savedGlobals> K:K => .K </savedGlobals>

endmodule
