//
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

module LLVM-GLOBALS
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

    //for the pointer type of global variable.

    rule <k> globalVariable(X:SymbolicValueRef, L:Set,
                      Ty:KResult, Init:K, Ad:Int, Al:Int) => .K ...</k>
         <globalRegisters> M:Map => M[X <- globalValue(
                L, pointerTypeValue(Ty, Ad), emptyHOLE, Init)] </globalRegisters> 
         <tempGlobalVars> TL:List (.List => ListItem(postInit(L,
                                    Ty, X, Init, Ad, Al))) </tempGlobalVars>
         requires isUnnamed(L) andBool notBool X in keys(M)

    rule <k> globalVariable(X:SymbolicValueRef, L:Set,
                      Ty:KResult, Init:K, Ad:Int, Al:Int) ~> K:K => .K </k>
         <globalRegisters> M:Map </globalRegisters> 
         <output>... .List => ListItem("error: redefinition of the global variable") </output>
         requires X in keys(M)

    rule <k> globalVariable(X:SymbolicValueRef, L:Set,
                      Ty:KResult, Init:K, Ad:Int, Al:Int) =>
              preInit(L, Ty, X, alloca(Ty, sizeof(Ty), Al, true), Init, Ad, Al) ...</k>
         <globalRegisters> M:Map </globalRegisters> 
         requires notBool isUnnamed(L) andBool isThreadLocal(L)
                andBool constant in L andBool notBool X in keys(M)

    rule <k> globalVariable(X:SymbolicValueRef, L:Set,
                      Ty:KResult, Init:K, Ad:Int, Al:Int) =>
              preInit(L, Ty, X, alloca(Ty, sizeof(Ty), Al, false), Init, Ad, Al) ...</k>
         <globalRegisters> M:Map </globalRegisters> 
         requires notBool isUnnamed(L) andBool isThreadLocal(L)
                andBool notBool (constant in L) andBool notBool X in keys(M)

    rule <k> globalVariable(X:SymbolicValueRef, L:Set,
                      Ty:KResult, Init:K, Ad:Int, Al:Int) =>
              preInit(L, Ty, X, globalAlloca(Ty, sizeof(Ty), Al, true), Init, Ad, Al) ...</k>
         <globalRegisters> M:Map </globalRegisters> 
         requires notBool isUnnamed(L) andBool notBool isThreadLocal(L)
                andBool constant in L andBool notBool X in keys(M)

    rule <k> globalVariable(X:SymbolicValueRef, L:Set,
                      Ty:KResult, Init:K, Ad:Int, Al:Int) =>
              preInit(L, Ty, X, globalAlloca(Ty, sizeof(Ty), Al, false), Init, Ad, Al) ...</k>
         <globalRegisters> M:Map </globalRegisters> 
         requires notBool isUnnamed(L) andBool notBool isThreadLocal(L)
                andBool notBool (constant in L) andBool notBool X in keys(M)

    rule <k> preInit(L:Set, Ty:KResult, X:SymbolicValueRef,
                      Loc:Loc, Init:K, Ad:Int, Al:Int) => .K ...</k>
        <savedGlobals>... .K => (exprType(typeCheckExpr(Ty, Init))
                   ~> store(Ty, Init,
                       pointerTypeValue(Ty, Ad), Loc, Al)) </savedGlobals>
         <globalRegisters> M:Map => M[X <- globalValue(
                  L, pointerTypeValue(Ty, Ad), Loc, Init)] </globalRegisters>
         requires notBool isExternal(L)

    rule <k> preInit(L:Set, Ty:KResult, X:SymbolicValueRef,
                      Loc:Loc, Init:K, Ad:Int, Al:Int) => .K ...</k>
        <savedGlobals>... .K => store(Ty, guessExternal,
                             pointerTypeValue(Ty, Ad), Loc, Al) </savedGlobals>
        <globalRegisters> M:Map => M[X <- globalValue(
                  L, pointerTypeValue(Ty, Ad), Loc, guessExternal)] </globalRegisters>
         requires isExternal(L)

/*
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
*/

    rule noUnnamedResult(postInit(L:Set, Ty:K, X:K,
               Init:K, Ad:Int, Al:Int))
           => preInit(L, Ty, X, alloca(Ty, sizeof(Ty), Al, true), Init, Ad, Al)
         requires isThreadLocal(L) andBool constant in L

    rule noUnnamedResult(postInit(L:Set, Ty:K, X:K,
               Init:K, Ad:Int, Al:Int))
           => preInit(L, Ty, X, alloca(Ty, sizeof(Ty), Al, false), Init, Ad, Al)
         requires isThreadLocal(L) andBool notBool constant in L

    rule noUnnamedResult(postInit(L:Set, Ty:K, X:K,
               Init:K, Ad:Int, Al:Int))
           => preInit(L, Ty, X, globalAlloca(Ty, sizeof(Ty), Al, true), Init, Ad, Al)
         requires notBool isThreadLocal(L) andBool constant in L

    rule noUnnamedResult(postInit(L:Set, Ty:K, X:K,
               Init:K, Ad:Int, Al:Int))
           => preInit(L, Ty, X, globalAlloca(Ty, sizeof(Ty), Al, false), Init, Ad, Al)
         requires notBool isThreadLocal(L) andBool notBool constant in L

    rule <k> dealWithUnnamed(.List) => K ...</k>
         <savedGlobals> K:K => .K </savedGlobals>

    rule <k> resultGlobalMap(M:Map) => .K ...</k>
         <globalRegisters> M':Map => M </globalRegisters>

    rule <k> (.K => mergeUnnamedToMap(postInit(L:Set, Ty:K, X:K,
               Init:K, Ad:Int, Al:Int), .K, .K, M, .Map))
               ~> dealWithUnnamed((ListItem(postInit(L:Set,
                                    Ty:K, X:K, Init:K, Ad:Int, Al:Int))
                              => .List) L':List) ...</k>
         <globalRegisters> M:Map (X |-> C:K) </globalRegisters>

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
                                         val(name(globalVar, "vprintf")),.ElemList)
                  ~> dealWithUnnamed(TL) ...</k>
        <tempGlobalVars> TL:List => .List </tempGlobalVars>

    rule initBuiltins(.ElemList) => .K
    rule <k> initBuiltins(val(X:SymbolicValueRef), Ls:ElemList => Ls) ...</k>
         <globalRegisters> M:Map => M[X <- funptr(X)] </globalRegisters>


endmodule
