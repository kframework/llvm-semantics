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
        <k> globalVariable(X:SymbolicValueRef, L:Set, Ty:SimpleTypeResult, Init:KResult)
            => preInit(X, globalAlloca(Ty, 1, getAlign(L, .K))
                                 , initializer(Ty ,Init))
        ...</k>
        <currentModifiers> _ => L </currentModifiers>

    //for the array type of global variable.
    rule
        <k> globalVariable(X:SymbolicValueRef, L:Set
                , arrayTypeValue(TyK:KResult,Size:Int), Init:K)
            => preInit(X, alloca(TyK, Size, getAlign(L, .K))
                                  , initializer(arrayTypeValue(TyK,Size),Init))
        ...</k>
        <currentModifiers> _ => L </currentModifiers>

    //for the struct type of global variable.
    rule
        <k> globalVariable(X:SymbolicValueRef, L:Set
                , structTypeValue(TyK:KResult), Init:K)
            => preInit(X, alloca(TyK, 1, getAlign(L, .K))
                                  , initializer(structTypeValue(TyK),Init))
        ...</k>
        <currentModifiers> _ => L </currentModifiers>

    //for the function type of global variable - an error.
    rule
        <k> globalVariable(X:SymbolicValueRef, L:Set
                , functionTypeValue(TyK:K, K':K), Init:K) ~> K
            => .K
        </k>
        <output>... .List => ListItem("error: invalid type for global variable") </output>

    rule
        <k> preInit(X:SymbolicValueRef, Loc:Loc, initializer(TK:K, K:K)) => .K ...</k>
        <savedGlobals>... .K => store(TK:K, K:K, Loc) </savedGlobals>
        <globalRegisters> M:Map
                   => M[X <- value(pointerTypeValue(TK, 'addrEmpty(.KList)),Loc)] </globalRegisters>

    rule <k> initGlobals => initBuiltins(val(name(globalVar, "__libc_start_main_0")),
                                         val(name(globalVar, "__libc_start_main_2")),
                                         val(name(globalVar, "exit")),
                                         val(name(globalVar, "llvm.memcpy.")),
                                         val(name(globalVar, "llvm.memset.")),
                                         val(name(globalVar, "llvm.lifetime.start")),
                                         val(name(globalVar, "llvm.lifetime.end")),
                                         val(name(globalVar, "llvm.va_start")),
                                         val(name(globalVar, "llvm.va_copy")),
                                         val(name(globalVar, "llvm.va_end")),
                                         val(name(globalVar, "__syscall")),
                                         val(name(globalVar, "vprintf")),.ElemList) ~> K:K ...</k>
        <savedGlobals> K:K => .K </savedGlobals>

    rule initBuiltins(.ElemList) => .K
    rule <k> initBuiltins(val(X:SymbolicValueRef), Ls:ElemList => Ls) ...</k>
         <globalRegisters> M:Map => M[X <- funptr(X)] </globalRegisters>


endmodule
