// Copyright (c) 2013-2015 K Team. All Rights Reserved.
requires "llvm-syntax.k"
requires "llvm-abstractsyntax.k"
requires "llvm-settings.k"
requires "llvm-helpers.k"
requires "llvm-standard-library-syntax.k"
requires "llvm-syscalls-syntax.k"
requires "llvm-configuration.k"
requires "llvm-preprocessing.k"

module LLVM-NORMALIZING
    imports LLVM-SYNTAX
    imports LLVM-ABSTRACTSYNTAX
    imports LLVM-SETTINGS
    imports LLVM-HELPERS
    imports LLVM-STANDARD-LIBRARY-SYNTAX
    imports LLVM-SYSCALLS-SYNTAX
    imports LLVM-CONFIGURATION
    imports LLVM-PREPROCESSING


    rule <k> badType ~> K => .K </k>
         <output>... .List => ListItem("error: expected type") </output>

    syntax KItem ::= typeCheckOp(K, K)
                   | typeCheckBasicBlock(K, K)  //abstract, concrete
                   | typeCheckIntOp(K, K, ElemList)    [strict(2)]
                   | typeCheckCastOp(K, K, K, K, K)    [strict(3, 5)]//variable, operator, T1, V, T2
                   | typeCheckIntArgs(K, ElemList)
                   | typeCheckIntArg(K, K)
                   | typeCheckIntArg(K, K, K, K, K)    [strict(4)]
                   | typeCheckGepOp(K, K, K, K, ElemList)  [strict(2,3,5)]//var, t, t*, v, (t,v)lists
                   | typeCheckAllocaOp(K, K, K, K, K)  [strict(2,3)]//var, t, int-t, v, align
                   | typeCheckStore(K, K, K, K, K, K)  [strict(1,3)]//t, v, pt, v, align, atomic
                   | typeCheckLoad(K, K, K, K, K, K)  [strict(2,3)]//var, t, pt, v, align, atomic
                   | typeCheckIntArg(K, K, K)
                   | typeCheckIntArgList(ElemList)
                   | typeCheckBr(K, K, K, K)    [strict(1)]
                   | typeCheckCmp(K, K, K, K)    [strict(2)]//var, type, v1, v2
                   | typeCheckFCmp(K, K, K, K)    [strict(2)]//var, type, v1, v2
                   | typeCheckPhi(K, K, ElemList, ElemList)  [strict(2)]//var, type, value-list, label-list


    syntax KItem ::= getValueOfPhi(PHIList) [function]
                   | getLabelOfPhi(PHIList) [function]
                   | getVar(K)    [function]

    rule getValueOfPhi([ V:ValueRef , L:ValueRef ]) => val(V)
    rule getValueOfPhi([ V:ValueRef , L:ValueRef ], Pl:PHIList)
                                         => val(V),getValueOfPhi(Pl)
    rule getLabelOfPhi([ V:ValueRef , L:ValueRef ]) => val(addNameToString(L))
    rule getLabelOfPhi([ V:ValueRef , L:ValueRef ], Pl:PHIList)
                                         => val(addNameToString(L)),getValueOfPhi(Pl)

    rule getVar(assign(A:K, B:K)) => A
    rule getVar(K:K) => .K [owise]

    //maybe a bug for LLVM, LLVM actually allows that a variable to be used then assign
    rule typeCheckBasicBlock(B:KItem ~> K:K, .InstructionList R:BBTerminatorInstruction)
         => typeCheckOp(getVar(B), R)
    rule typeCheckBasicBlock(B:KItem ~> K:K, A:Instruction
                                  L:InstructionList R:BBTerminatorInstruction)
         => typeCheckOp(getVar(B), A) ~> typeCheckBasicBlock(K, L R)

    rule typeCheckOp(X:SymbolicValueRef, IntOp:IntConstructors
                             Onw:OptNW Ty:Type V1:ValueRef,
                             V2:ValueRef Ins:InstructionMetadatas)
           => typeCheckIntOp(X, Ty, val(V1), val(V2))
    rule typeCheckOp(X:SymbolicValueRef, L:LogicalOps Ty:Type V1:ValueRef,
                  V2:ValueRef Ins:InstructionMetadatas)
           => typeCheckIntOp(X, Ty, val(V1), val(V2))
    rule typeCheckOp(X:SymbolicValueRef, trunc Ty1:Type V:ValueRef
                                            to Ty2:Type Ins:InstructionMetadatas)
           => typeCheckCastOp(X, trunc,  Ty1, V, Ty2)
    rule typeCheckOp(X:SymbolicValueRef, zext Ty1:Type V:ValueRef
                                            to Ty2:Type Ins:InstructionMetadatas)
           => typeCheckCastOp(X, zext,  Ty1, V, Ty2)
    rule typeCheckOp(X:SymbolicValueRef, sext Ty1:Type V:ValueRef
                                            to Ty2:Type Ins:InstructionMetadatas)
           => typeCheckCastOp(X, sext,  Ty1, V, Ty2)

    rule typeCheckOp(X:SymbolicValueRef, getelementptr Oib:OptInBounds Ty:Type , Ty1:Type V1:ValueRef
                                    Itr:IntResolveVals Ins:InstructionMetadatas)
           => typeCheckGepOp(X, Ty, Ty1, V1, formTypeCheckList(Itr))

    rule typeCheckOp(X:SymbolicValueRef, alloca Oil:OptInalloca Ty:Type Ins:InstructionMetadatas)
           => typeCheckAllocaOp(X,Ty, undef, undef, 1)
    rule typeCheckOp(X:SymbolicValueRef, alloca Oil:OptInalloca
                                          Ty:Type, align A:UnsignedInt Ins:InstructionMetadatas)
           => typeCheckAllocaOp(X,Ty,undef,undef, String2Int(#tokenToString(A)))
    rule typeCheckOp(X:SymbolicValueRef, alloca Oil:OptInalloca Ty:Type,
                                        It:IntType V:ValueRef Ins:InstructionMetadatas)
           => typeCheckAllocaOp(X,Ty,It,V, 1)
    rule typeCheckOp(X:SymbolicValueRef, alloca Oil:OptInalloca Ty:Type,
                       It:IntType V:ValueRef, align A:UnsignedInt Ins:InstructionMetadatas)
           => typeCheckAllocaOp(X,Ty,It,V, String2Int(#tokenToString(A)))
    rule typeCheckOp(K:K, store Ovl:OptVolatile
                  Ty1:Type V1:ValueRef, Ty2:Type V2:ValueRef, align I:UnsignedInt
                    Inm:InstructionMetadatas)
           => typeCheckStore(Ty1:Type, V1:ValueRef, Ty2:Type, V2:ValueRef, String2Int(#tokenToString(I)), .K)
    rule typeCheckOp(K:K, store Ovl:OptVolatile
                  Ty1:Type V1:ValueRef, Ty2:Type V2:ValueRef
                    Inm:InstructionMetadatas)
           => typeCheckStore(Ty1:Type, V1:ValueRef, Ty2:Type, V2:ValueRef, 1, .K)
    rule typeCheckOp(K:K, store Oac:Atomic Ovl:OptVolatile Ty1:Type V1:ValueRef,
                 Ty2:Type V2:ValueRef Osc:OptScopeOrder, align I:UnsignedInt Ins:InstructionMetadatas)
           => typeCheckStore(Ty1:Type, V1:ValueRef, Ty2:Type, V2:ValueRef, String2Int(#tokenToString(I)), Oac)
    rule typeCheckOp(X:SymbolicValueRef, load Ovl:OptVolatile
                  Ty1:Type, Ty2:Type V2:ValueRef, align I:UnsignedInt
                    Inm:InstructionMetadatas)
           => typeCheckLoad(X, Ty1:Type, Ty2:Type, V2:ValueRef, String2Int(#tokenToString(I)), .K)
    rule typeCheckOp(X:SymbolicValueRef, load Ovl:OptVolatile
                  Ty1:Type, Ty2:Type V2:ValueRef
                    Inm:InstructionMetadatas)
           => typeCheckLoad(X, Ty1:Type, Ty2:Type, V2:ValueRef, 1, .K)
    rule typeCheckOp(X:SymbolicValueRef, load Oac:Atomic Ovl:OptVolatile Ty1:Type,
                 Ty2:Type V2:ValueRef Osc:OptScopeOrder, align I:UnsignedInt Ins:InstructionMetadatas)
           => typeCheckLoad(X, Ty1:Type, Ty2:Type, V2:ValueRef, String2Int(#tokenToString(I)), Oac)
    rule typeCheckOp(K:K, br label La:ValueRef Meta:InstructionMetadatas)
           => typeCheckBr(undef, undef, addNameToString(La), undef)
    rule typeCheckOp(K:K, br It:IntType Va:ValueRef ,
                   label La1:ValueRef , label La2:ValueRef
                                  Meta:InstructionMetadatas)
           => typeCheckBr(K, It, addNameToString(La1), addNameToString(La2))
    rule typeCheckOp(X:SymbolicValueRef, icmp Op:IPredicate
                   Ty:Type V1:ValueRef , V2:ValueRef Ins:InstructionMetadatas)
         => typeCheckCmp(X, Ty, V1, V2)
    rule typeCheckOp(X:SymbolicValueRef, fcmp Op:FPredicate
                   Ty:Type V1:ValueRef , V2:ValueRef Ins:InstructionMetadatas)
         => typeCheckFCmp(X, Ty, V1, V2)
    rule typeCheckOp(X:SymbolicValueRef, phi Ty:Type Pl:PHIList Ins:InstructionMetadatas)
         => typeCheckPhi(X, Ty, getValueOfPhi(Pl), getLabelOfPhi(Pl))


    //deal with phi of type check
    //there is a big bug in the implementaton of phi function

    rule typeCheckPhi(X:SymbolicValueRef, T:KResult, val(A:K), E1:ElemList, E2:ElemList)
                => typeCheckIntArgs(T, E1)
                  ~> typeCheckPhi(X:SymbolicValueRef,
                                T:KResult, E1:ElemList, E2:ElemList)
         requires getKLabel(A) =/=KLabel 'name

    rule <k> typeCheckPhi(X:SymbolicValueRef, T:KResult,
                          val(name(localVar, S:String)), E1:ElemList, .ElemList)
                => .K ...</k>
         <currModule> ModName:SymbolicValueRef </currModule>
         <funModuleName> ModName </funModuleName>
         <currFunction> FunName:SymbolicValueRef </currFunction>
         <functionName> FunName </functionName>
         <varTypes>... name(localVar, S:String) |-> (T' => T) ...</varTypes>
         requires T' ==K undef orBool T' ==K T

    rule <k> typeCheckPhi(X:SymbolicValueRef, T:KResult,
                          val(name(localVar, S:String)), E1:ElemList, .ElemList)
             ~> K:K => .K </k>
         <currModule> ModName:SymbolicValueRef </currModule>
         <funModuleName> ModName </funModuleName>
         <currFunction> FunName:SymbolicValueRef </currFunction>
         <functionName> FunName </functionName>
         <output>... .List => ListItem("error: constant expression type mismatch") </output>
         <varTypes>... name(localVar, S:String) |-> T' ...</varTypes>
         requires T' =/=K undef andBool T' =/=K T

    rule <k> typeCheckPhi(X:SymbolicValueRef, T:KResult, .ElemList, .ElemList)
                => .K ...</k>
         <currModule> ModName:SymbolicValueRef </currModule>
         <funModuleName> ModName </funModuleName>
         <currFunction> FunName:SymbolicValueRef </currFunction>
         <functionName> FunName </functionName>
         <varTypes>... X |-> (T' => T) ...</varTypes>
         requires T' ==K undef orBool T' ==K T

    rule <k> typeCheckPhi(X:SymbolicValueRef, T:KResult, E1:ElemList, E2:ElemList)
             ~> K:K => .K </k>
         <currModule> ModName:SymbolicValueRef </currModule>
         <funModuleName> ModName </funModuleName>
         <currFunction> FunName:SymbolicValueRef </currFunction>
         <functionName> FunName </functionName>
         <output>... .List => ListItem("error: constant expression type mismatch") </output>
         <varTypes>... X |-> T' ...</varTypes>
         requires T' =/=K undef andBool T' =/=K T


    rule <k> typeCheckPhi(X:SymbolicValueRef, T:KResult, E1:ElemList
                         , val(name(localVar, S:String)), L:ElemList)
                => typeCheckPhi(X, T, E1, L) ...</k>
         <currModule> ModName:SymbolicValueRef </currModule>
         <funModuleName> ModName </funModuleName>
         <currFunction> FunName:SymbolicValueRef </currFunction>
         <functionName> FunName </functionName>
         <varTypes>... name(localVar, S:String) |-> label ...</varTypes>

    rule <k> typeCheckPhi(X:SymbolicValueRef, T:KResult, E1:ElemList
               , val(name(localVar, S:String)), L:ElemList) ~> K:K
                => .K </k>
         <output>... .List => ListItem("error: use of undefined value '%"
                               +String S +String "'") </output>
         <currModule> ModName:SymbolicValueRef </currModule>
         <funModuleName> ModName </funModuleName>
         <currFunction> FunName:SymbolicValueRef </currFunction>
         <functionName> FunName </functionName>
         <varTypes> M:Map </varTypes>
         requires notBool name(localVar, S:String) in keys(M)

    rule <k> typeCheckPhi(X:SymbolicValueRef, T:KResult, E1:ElemList
               , val(name(A:K, S:String)), L:ElemList) ~> K:K
                => .K </k>
         <output>... .List => ListItem("error: use of undefined value '%"
                               +String S +String "'") </output>
         requires A =/=K localVar

    rule <k> typeCheckPhi(X:SymbolicValueRef, T:KResult, E1:ElemList
               , val(K:K), L:ElemList) ~> K:K
                => .K </k>
         <output>... .List => ListItem("error: '" +String #tokenToString(K)
                               +String "' is not a basic block") </output>
         requires getKLabel(K) =/=KLabel 'name

    //deal with fcmp
    rule <k> typeCheckFCmp(X:SymbolicValueRef, T:KResult, V1:K, V2:K)
               => typeCheckIntArg(T, V1) ~> typeCheckIntArg(T, V2)
         ...</k>
         <currModule> ModName:SymbolicValueRef </currModule>
         <funModuleName> ModName </funModuleName>
         <currFunction> FunName:SymbolicValueRef </currFunction>
         <functionName> FunName </functionName>
         <varTypes>... X |-> (T' => T) ...</varTypes>
         requires (T ==K float orBool T ==K double
                  orBool T ==K ppc_fp128 orBool T ==K half
                  orBool T ==K fp128 orBool T ==K x86_fp80)
                  andBool (T' ==K undef orBool T' ==K T)

    rule <k> typeCheckFCmp(X:SymbolicValueRef, vectorTypeValue(T:KResult, I:Int), V1:K, V2:K)
               => typeCheckIntArg(vectorTypeValue(T:KResult, I:Int), V1)
                     ~> typeCheckIntArg(vectorTypeValue(T:KResult, I:Int), V2)
         ...</k>
         <currModule> ModName:SymbolicValueRef </currModule>
         <funModuleName> ModName </funModuleName>
         <currFunction> FunName:SymbolicValueRef </currFunction>
         <functionName> FunName </functionName>
         <varTypes>... X |-> (T' => vectorTypeValue(T:KResult, I:Int)) ...</varTypes>
         requires (T ==K float orBool T ==K double
                  orBool T ==K ppc_fp128 orBool T ==K half
                  orBool T ==K fp128 orBool T ==K x86_fp80)
                  andBool (T' ==K undef orBool T' ==K vectorTypeValue(T:KResult, I:Int))

    rule <k> typeCheckFCmp(X:SymbolicValueRef, T:KResult, V1:K, V2:K) ~> K:K
               => .K </k>
         <currModule> ModName:SymbolicValueRef </currModule>
         <funModuleName> ModName </funModuleName>
         <currFunction> FunName:SymbolicValueRef </currFunction>
         <functionName> FunName </functionName>
         <varTypes>... X |-> T' ...</varTypes>
         <output>... .List => ListItem("error: constant expression type mismatch") </output>
         requires (T' =/=K undef andBool T' =/=K T)

    rule <k> typeCheckFCmp(X, T:KResult, V1:K, V2:K) ~> K:K
               => .K </k>
         <output>... .List => ListItem("error: fcmp requires floating point operands") </output>
         requires T =/=K float andBool T =/=K double
                  andBool T =/=K ppc_fp128 andBool T =/=K half
                  andBool T =/=K fp128 andBool T =/=K x86_fp80

    rule <k> typeCheckFCmp(X, vectorTypeValue(T:K, I:Int), V1:K, V2:K) ~> K:K
               => .K </k>
         <output>... .List => ListItem("error: fcmp requires floating point operands") </output>
         requires T =/=K float andBool T =/=K double
                  andBool T =/=K ppc_fp128 andBool T =/=K half
                  andBool T =/=K fp128 andBool T =/=K x86_fp80


    //deal with icmp
    rule <k> typeCheckCmp(X:SymbolicValueRef, T:KResult, V1:K, V2:K)
               => typeCheckIntArg(T, V1) ~> typeCheckIntArg(T, V2)
         ...</k>
         <currModule> ModName:SymbolicValueRef </currModule>
         <funModuleName> ModName </funModuleName>
         <currFunction> FunName:SymbolicValueRef </currFunction>
         <functionName> FunName </functionName>
         <varTypes>... X |-> (T' => T) ...</varTypes>
         requires (getKLabel(T) ==KLabel 'integerType
               orBool getKLabel(T) ==KLabel 'pointerTypeValue)
               andBool ( T' ==K undef orBool T' ==K T)
         
    rule <k> typeCheckCmp(X:SymbolicValueRef,
                     vectorTypeValue(integerType(N:Int), I:Int), V1:K, V2:K)
               => typeCheckIntArg(vectorTypeValue(integerType(N:Int), I:Int), V1)
                     ~> typeCheckIntArg(vectorTypeValue(integerType(N:Int), I:Int), V2)
         ...</k>
         <currModule> ModName:SymbolicValueRef </currModule>
         <funModuleName> ModName </funModuleName>
         <currFunction> FunName:SymbolicValueRef </currFunction>
         <functionName> FunName </functionName>
         <varTypes>... X |-> (T' => vectorTypeValue(integerType(N:Int), I:Int)) ...</varTypes>
         requires ( T' ==K undef orBool T' ==K vectorTypeValue(integerType(N:Int), I:Int))

    rule <k> typeCheckCmp(X:SymbolicValueRef, T:KResult, V1:K, V2:K) ~> K:K
               => .K </k>
         <currModule> ModName:SymbolicValueRef </currModule>
         <funModuleName> ModName </funModuleName>
         <currFunction> FunName:SymbolicValueRef </currFunction>
         <functionName> FunName </functionName>
         <varTypes>... X |-> T' ...</varTypes>
         <output>... .List => ListItem("error: constant expression type mismatch") </output>
         requires (T' =/=K undef andBool T' =/=K T)

    rule <k> typeCheckCmp(X, T:KResult, V1:K, V2:K) ~> K:K
               => .K </k>
         <output>... .List => ListItem("error: icmp requires integer operands") </output>
         requires getKLabel(T) =/=KLabel 'integerType
               andBool getKLabel(T) =/=KLabel 'pointerTypeValue
               andBool getKLabel(T) =/=KLabel 'vectorTypeValue

    rule <k> typeCheckCmp(X, vectorTypeValue(T:K, I:Int), V1:K, V2:K) ~> K:K
               => .K </k>
         <output>... .List => ListItem("error: icmp requires integer operands") </output>
         requires getKLabel(T) =/=KLabel 'integerType

    //deal with brs
    rule <k> typeCheckBr(undef, _:K, A:K, _:K) => .K ...</k>
         <currModule> ModName:SymbolicValueRef </currModule>
         <funModuleName> ModName </funModuleName>
         <currFunction> FunName:SymbolicValueRef </currFunction>
         <functionName> FunName </functionName>
         <basicBlocks>... A |-> _:K ...</basicBlocks>

    rule <k> typeCheckBr(undef, _:K, name(localVar, S:String), _:K) ~> K:K => .K </k>
         <output>... .List => ListItem("error: use of undefined value '%"
                               +String S +String "'") </output>
         <currModule> ModName:SymbolicValueRef </currModule>
         <funModuleName> ModName </funModuleName>
         <currFunction> FunName:SymbolicValueRef </currFunction>
         <functionName> FunName </functionName>
         <basicBlocks> M:Map </basicBlocks>
         requires notBool name(localVar, S:String) in keys(M)

    rule <k> typeCheckBr(integerType(1), A:K, L1:K, L2:K)
                 => typeCheckIntArg(integerType(1), A) ...</k>
         <currModule> ModName:SymbolicValueRef </currModule>
         <funModuleName> ModName </funModuleName>
         <currFunction> FunName:SymbolicValueRef </currFunction>
         <functionName> FunName </functionName>
         <basicBlocks> M:Map </basicBlocks>
         requires L1 in keys(M) andBool L2 in keys(M)

    rule <k> typeCheckBr(integerType(N:Int), A:K, L1:K, L2:K) ~> K:K
                 => .K </k>
         <output>... .List => ListItem("error: branch condition must have 'i1' type") </output>
         requires N =/=Int 1

    rule <k> typeCheckBr(integerType(1), A:K, name(localVar, S:String), _:K) ~> K:K
                 => .K </k>
         <output>... .List => ListItem("error: use of undefined value '%"
                               +String S +String "'") </output>
         <currModule> ModName:SymbolicValueRef </currModule>
         <funModuleName> ModName </funModuleName>
         <currFunction> FunName:SymbolicValueRef </currFunction>
         <functionName> FunName </functionName>
         <basicBlocks> M:Map </basicBlocks>
         requires notBool (name(localVar, S:String) in keys(M))

    rule <k> typeCheckBr(integerType(1), A:K, _:K, name(localVar, S:String)) ~> K:K
                 => .K </k>
         <output>... .List => ListItem("error: use of undefined value '%"
                               +String S +String "'") </output>
         <currModule> ModName:SymbolicValueRef </currModule>
         <funModuleName> ModName </funModuleName>
         <currFunction> FunName:SymbolicValueRef </currFunction>
         <functionName> FunName </functionName>
         <basicBlocks> M:Map </basicBlocks>
         requires notBool (name(localVar, S:String) in keys(M))

    //deal with type of load
    rule <k> typeCheckLoad(X:SymbolicValueRef, T:KResult,
                     pointerTypeValue(T:KResult, A:K), V2:K, Align:Int, At:K)
              => typeCheckIntArg(pointerTypeValue(T:KResult, A:K), V2)
         ...</k>
         <currModule> ModName:SymbolicValueRef </currModule>
         <funModuleName> ModName </funModuleName>
         <currFunction> FunName:SymbolicValueRef </currFunction>
         <functionName> FunName </functionName>
         <varTypes>... X |-> (T' => T) ...</varTypes>
         requires isPowOfTwo(Align, 1) andBool At =/=K atomic
                  andBool (T' ==K undef orBool T' ==K T)



    rule <k> typeCheckLoad(X:SymbolicValueRef, integerType(N:Int),
                     pointerTypeValue(integerType(N:Int), A:K), V2:K, Align:Int, atomic)
              => typeCheckIntArg(pointerTypeValue(integerType(N:Int), A:K), V2)
         ...</k>
         <currModule> ModName:SymbolicValueRef </currModule>
         <funModuleName> ModName </funModuleName>
         <currFunction> FunName:SymbolicValueRef </currFunction>
         <functionName> FunName </functionName>
         <varTypes>... X |-> (T' => integerType(N:Int)) ...</varTypes>
         requires isPowOfTwo(Align, 1) andBool N >=Int 8
                  andBool (T' ==K undef orBool T' ==K T)

    rule <k> typeCheckLoad(X:SymbolicValueRef, T:KResult,
                     pointerTypeValue(T:KResult, A:K), V2:K, Align:Int, At:K)
              ~> K:K => .K </k>
         <currModule> ModName:SymbolicValueRef </currModule>
         <funModuleName> ModName </funModuleName>
         <currFunction> FunName:SymbolicValueRef </currFunction>
         <functionName> FunName </functionName>
         <varTypes>... X |-> T' ...</varTypes>
         <output>... .List => ListItem("error: constant expression type mismatch") </output>
         requires T' =/=K undef andBool T' =/=K T

    rule <k> typeCheckLoad(X:K, T:KResult,
                     pointerTypeValue(T:KResult, A:K), V2:K, Align:Int, atomic) ~> K:K => .K </k>
         <output>... .List => ListItem("error: atomic store must have integer type that greater than 8 bits.") </output>
         requires getKLabel(T) =/=KLabel 'integerType

    rule <k> typeCheckLoad(X:K, integerType(N:Int),
                     pointerTypeValue(integerType(N:Int), A:K), V2:K, Align:Int, atomic) ~> K:K => .K </k>
         <output>... .List => ListItem("error: atomic store must have integer type that greater than 8 bits.") </output>
         requires N <Int 8

    rule <k> typeCheckLoad(X:K, T:KResult,
                     pointerTypeValue(T':KResult, A:K), V2:K, Align:Int, At:K) ~> K:K => .K </k>
         <output>... .List => ListItem("error: stored value and pointer type do not match") </output>
         requires T =/=K T'

    rule <k> typeCheckLoad(X:K, T:KResult,
                     T':KResult, V2:K, Align:Int, At:K) ~> K:K => .K </k>
         <output>... .List => ListItem("error: store operand must be a pointer") </output>
         requires getKLabel(T') =/=KLabel 'pointerTypeValue

    rule <k> typeCheckLoad(X:K, T:KResult, T':KResult, V:K, Align:Int, At:K)
             ~> K:K => .K </k>
         <output>... .List => ListItem("error: alignment is not a power of two") </output>
         requires notBool isPowOfTwo(Align, 1)


    //deal with type of store
    rule typeCheckStore(T:KResult, V1:K,
                     pointerTypeValue(T:KResult, A:K), V2:K, Align:Int, At:K)
              => typeCheckIntArg(T, V1) ~> typeCheckIntArg(pointerTypeValue(T:KResult, A:K), V2)
         requires isPowOfTwo(Align, 1) andBool At =/=K atomic

    rule typeCheckStore(integerType(N:Int), V1:K,
                     pointerTypeValue(integerType(N:Int), A:K), V2:K, Align:Int, atomic)
              => typeCheckIntArg(integerType(N:Int), V1)
                    ~> typeCheckIntArg(pointerTypeValue(integerType(N:Int), A:K), V2)
         requires isPowOfTwo(Align, 1) andBool N >=Int 8

    rule <k> typeCheckStore(T:KResult, V1:K,
                     pointerTypeValue(T:KResult, A:K), V2:K, Align:Int, atomic) ~> K:K => .K </k>
         <output>... .List => ListItem("error: atomic store must have integer type that greater than 8 bits.") </output>
         requires getKLabel(T) =/=KLabel 'integerType

    rule <k> typeCheckStore(integerType(N:Int), V1:K,
                     pointerTypeValue(integerType(N:Int), A:K), V2:K, Align:Int, atomic) ~> K:K => .K </k>
         <output>... .List => ListItem("error: atomic store must have integer type that greater than 8 bits.") </output>
         requires N <Int 8

    rule <k> typeCheckStore(T:KResult, V1:K,
                     pointerTypeValue(T':KResult, A:K), V2:K, Align:Int, At:K) ~> K:K => .K </k>
         <output>... .List => ListItem("error: stored value and pointer type do not match") </output>
         requires T =/=K T'

    rule <k> typeCheckStore(T:KResult, V1:K,
                     T':KResult, V2:K, Align:Int, At:K) ~> K:K => .K </k>
         <output>... .List => ListItem("error: store operand must be a pointer") </output>
         requires getKLabel(T') =/=KLabel 'pointerTypeValue

    rule <k> typeCheckStore(X:SymbolicValueRef, T:KResult, T':KResult, V:K,
             Align:Int, At:K) ~> K:K => .K </k>
         <output>... .List => ListItem("error: alignment is not a power of two") </output>
         requires notBool isPowOfTwo(Align, 1)


    //deal with type of alloca
    rule <k> typeCheckAllocaOp(X:SymbolicValueRef, T:KResult, integerType(I:Int), V:K, Align:Int)
              => typeCheckIntArg(integerType(I:Int), V) ...</k>
         <currModule> ModName:SymbolicValueRef </currModule>
         <funModuleName> ModName </funModuleName>
         <currFunction> FunName:SymbolicValueRef </currFunction>
         <functionName> FunName </functionName>
         <varTypes> _:Map (.Map => X |-> pointerTypeValue(T, 'addrEmpty(.KList))) </varTypes>
         requires isPowOfTwo(Align, 1)

    rule <k> typeCheckAllocaOp(X:SymbolicValueRef, T:KResult, T':KResult, V:K, Align:Int)
             ~> K:K => .K </k>
         <output>... .List => ListItem("error: element count must have integer type") </output>
         requires getKLabel(T') =/=KLabel 'integerType

    rule <k> typeCheckAllocaOp(X:SymbolicValueRef, T:KResult, T':KResult, V:K, Align:Int)
             ~> K:K => .K </k>
         <output>... .List => ListItem("error: alignment is not a power of two") </output>
         requires notBool isPowOfTwo(Align, 1)


    //TODO: deal with other constant expr cases
    rule <k> typeCheckGepOp(X:SymbolicValueRef, T:KResult, pointerTypeValue(T, A:K), V:K, L:ElemList)
              => typeCheckIntArg(pointerTypeValue(T, A), V) ~> typeCheckIntArgList(L) ...</k>
         <currModule> ModName:SymbolicValueRef </currModule>
         <funModuleName> ModName </funModuleName>
         <currFunction> FunName:SymbolicValueRef </currFunction>
         <functionName> FunName </functionName>
         <varTypes> _:Map (.Map => X |-> pointerTypeValue(T, A)) </varTypes>

    rule <k> typeCheckGepOp(X:SymbolicValueRef, T:KResult, pointerTypeValue(T', A:K), V:K, L:ElemList)
             ~> K:K => .K </k>
         <output>... .List => ListItem("error: explicit pointee type doesn't match operand's pointee type") </output>
         requires T =/=K T'

    rule <k> typeCheckGepOp(X:SymbolicValueRef, T:KResult, T', V:K, L:ElemList)
             ~> K:K => .K </k>
         <output>... .List => ListItem("error: base of getelementptr must be a pointer") </output>
         requires getKLabel(T') =/=KLabel 'pointerTypeValue


    rule typeCheckIntArgList(.ElemList) => .K
    rule typeCheckIntArgList(valValue(typeOperandResult(T:K, V:K)),Vs:ElemList)
                    => typeCheckIntArg(T, V) ~> typeCheckIntArgList(Vs)
         requires getKLabel(T) ==KLabel 'integerType
    rule <k> typeCheckIntArgList(valValue(typeOperandResult(T:K, V:K)),Vs:ElemList)
             ~> K:K => .K </k>
         <output>... .List => ListItem("error: integer constant must have integer type") </output>
         requires getKLabel(T) =/=KLabel 'integerType

    rule <k> typeCheckCastOp(X:SymbolicValueRef, Op:K, integerType(N:Int), V:K, integerType(N':Int))
              => typeCheckIntArg(integerType(N), V) ...</k>
         <currModule> ModName:SymbolicValueRef </currModule>
         <funModuleName> ModName </funModuleName>
         <currFunction> FunName:SymbolicValueRef </currFunction>
         <functionName> FunName </functionName>
         <varTypes> _:Map (.Map => X |-> integerType(N')) </varTypes>
         requires N <Int N' andBool Op =/=K trunc

    rule <k> typeCheckCastOp(X:SymbolicValueRef, Op:K, integerType(N:Int), V:K, integerType(N':Int))
             ~> K => .K </k>
         <output>... .List => ListItem("error: invalid cast opcode for cast from 'i"
                             +String Int2String(N) +String "' to 'i"
                             +String Int2String(N') +String "'") </output>
         requires N >=Int N' andBool Op =/=K trunc

    rule <k> typeCheckCastOp(X:SymbolicValueRef, Op:K,
               vectorTypeValue(integerType(N:Int), I:Int), V:K,
               vectorTypeValue(integerType(N':Int), I:Int))
              => typeCheckIntArg(vectorTypeValue(integerType(N:Int), I:Int), V) ...</k>
         <currModule> ModName:SymbolicValueRef </currModule>
         <funModuleName> ModName </funModuleName>
         <currFunction> FunName:SymbolicValueRef </currFunction>
         <functionName> FunName </functionName>
          <varTypes> _:Map (.Map => X |-> vectorTypeValue(integerType(N'), I:Int)) </varTypes>
         requires N <Int N' andBool Op =/=K trunc

    rule <k> typeCheckCastOp(X:SymbolicValueRef, Op:K,
               vectorTypeValue(integerType(N:Int), I:Int), V:K,
               vectorTypeValue(integerType(N':Int), I':Int)) ~> K:K
              => .K </k>
         <output>... .List => ListItem("error: invalid cast opcode for cast from '<"
                             +String Int2String(I) +String " x "
                             +String Int2String(N) +String ">' to '<"
                             +String Int2String(I') +String " x "
                             +String Int2String(N') +String ">'") </output>
         requires (N >=Int N' orBool I =/=Int I') andBool Op =/=K trunc


    rule <k> typeCheckCastOp(X:SymbolicValueRef, trunc, integerType(N:Int), V:K, integerType(N':Int))
              => typeCheckIntArg(integerType(N), V) ...</k>
         <currModule> ModName:SymbolicValueRef </currModule>
         <funModuleName> ModName </funModuleName>
         <currFunction> FunName:SymbolicValueRef </currFunction>
         <functionName> FunName </functionName>
         <varTypes> _:Map (.Map => X |-> integerType(N')) </varTypes>
         requires N >Int N'

    rule <k> typeCheckCastOp(X:SymbolicValueRef, trunc, integerType(N:Int), V:K, integerType(N':Int))
             ~> K => .K </k>
         <output>... .List => ListItem("error: invalid cast opcode for cast from 'i"
                             +String Int2String(N) +String "' to 'i"
                             +String Int2String(N') +String "'") </output>
         requires N <=Int N'

    rule <k> typeCheckCastOp(X:SymbolicValueRef, trunc,
               vectorTypeValue(integerType(N:Int), I:Int), V:K,
               vectorTypeValue(integerType(N':Int), I:Int))
              => typeCheckIntArg(vectorTypeValue(integerType(N:Int), I:Int), V) ...</k>
         <currModule> ModName:SymbolicValueRef </currModule>
         <funModuleName> ModName </funModuleName>
         <currFunction> FunName:SymbolicValueRef </currFunction>
         <functionName> FunName </functionName>
          <varTypes> _:Map (.Map => X |-> vectorTypeValue(integerType(N'), I:Int)) </varTypes>
         requires N >Int N'

    rule <k> typeCheckCastOp(X:SymbolicValueRef, trunc,
               vectorTypeValue(integerType(N:Int), I:Int), V:K,
               vectorTypeValue(integerType(N':Int), I':Int)) ~> K:K
              => .K </k>
         <output>... .List => ListItem("error: invalid cast opcode for cast from '<"
                             +String Int2String(I) +String " x "
                             +String Int2String(N) +String ">' to '<"
                             +String Int2String(I') +String " x "
                             +String Int2String(N') +String ">'") </output>
         requires N <=Int N' orBool I =/=Int I'

    rule <k> typeCheckCastOp(X:SymbolicValueRef, Op:K, vectorTypeValue(Ty:KResult, I:Int),
              V:K, vectorTypeValue(Ty':KResult, I':Int))  ~> K
              => .K </k>
         <output>... .List => ListItem("error: invalid operand type for instruction") </output>
         requires getKLabel(Ty) =/=KLabel 'integerType orBool getKLabel(Ty') =/=KLabel 'integerType

    rule <k> typeCheckCastOp(X:SymbolicValueRef, Op:K, T:K, V:K, T':K) ~> K
              => .K </k>
         <output>... .List => ListItem("error: instruction requires integer or integer vector operands") </output>
         requires (getKLabel(T) =/=KLabel 'integerType
                    andBool getKLabel(T) =/=KLabel 'vectorTypeValue)
                    orBool (getKLabel(T') =/=KLabel 'integerType
                    andBool getKLabel(T') =/=KLabel 'vectorTypeValue)


    rule <k> typeCheckIntOp(X:SymbolicValueRef, integerType(N:Int), L:ElemList)
              => typeCheckIntArgs(integerType(N), L) ...</k>
         <currModule> ModName:SymbolicValueRef </currModule>
         <funModuleName> ModName </funModuleName>
         <currFunction> FunName:SymbolicValueRef </currFunction>
         <functionName> FunName </functionName>
         <varTypes> _:Map (.Map => X |-> integerType(N)) </varTypes>

    rule <k> typeCheckIntOp(X:SymbolicValueRef,
               vectorTypeValue(integerType(N:Int), I:Int), L:ElemList)
              => typeCheckIntArgs(vectorTypeValue(integerType(N:Int), I:Int), L) ...</k>
         <currModule> ModName:SymbolicValueRef </currModule>
         <funModuleName> ModName </funModuleName>
         <currFunction> FunName:SymbolicValueRef </currFunction>
         <functionName> FunName </functionName>
          <varTypes> _:Map (.Map => X |-> vectorTypeValue(integerType(N:Int), I:Int)) </varTypes>

    rule <k> typeCheckIntOp(X:SymbolicValueRef,
               vectorTypeValue(Ty:KResult, I:Int), L:ElemList) ~> K
              => .K </k>
         <output>... .List => ListItem("error: invalid operand type for instruction") </output>
         requires getKLabel(Ty) =/=KLabel 'integerType

    rule <k> typeCheckIntOp(X:SymbolicValueRef, Ty:KResult, L:ElemList) ~> K
              => .K </k>
         <output>... .List => ListItem("error: instruction requires integer or integer vector operands") </output>
         requires getKLabel(Ty) =/=KLabel 'integerType
                    andBool getKLabel(Ty) =/=KLabel 'vectorTypeValue

    rule typeCheckIntArgs(T:Type, .ElemList) => .K
    rule typeCheckIntArgs(T:Type, val(V:K),Vs:ElemList)
                    => typeCheckIntArg(T, V) ~> typeCheckIntArgs(T, Vs)

    rule typeCheckIntArg(T:K, undef) => .K
    rule typeCheckIntArg(pointerTypeValue(T:K, A:K), zeroinitializer) => .K
    rule typeCheckIntArg(integerType(N:Int), I:Int) => .K
    rule typeCheckIntArg(integerType(1), B:Bool) => .K
    rule <k> typeCheckIntArg(T:K, X:LocalName) => .K ...</k>
         <currModule> ModName:SymbolicValueRef </currModule>
         <funModuleName> ModName </funModuleName>
         <currFunction> FunName:SymbolicValueRef </currFunction>
         <functionName> FunName </functionName>
         <varTypes>... addNameToString(X) |-> T:K ...</varTypes>

    rule typeCheckIntArg(vectorTypeValue(integerType(N:Int), I:Int), < T':Type V:ValueRef, R:ReturnedVal >)
         => typeCheckIntArg(integerType(N:Int), I, < R >, T', V)
         requires I >Int 0 andBool N >Int 0

    //define type checking rules for vector types in integer opeartors.
    rule typeCheckIntArg(T:K, 0, < .ReturnedVal >) => .K
    rule typeCheckIntArg(T:K, I:Int, < T':Type V:ValueRef, R:ReturnedVal >)
         => typeCheckIntArg(T, I, < R >, T', V)
         requires I >Int 0

    rule typeCheckIntArg(integerType(N:Int), N':Int, A:K, T:KResult, I':Int)
         => typeCheckIntArg(integerType(N:Int), N' -Int 1, A:K)
    rule typeCheckIntArg(integerType(1), I:Int, A:K, integerType(1), B:Bool)
         => typeCheckIntArg(integerType(1), I -Int 1, A)
    rule <k> typeCheckIntArg(integerType(N:Int), N':Int, A:K, T:KResult, X:LocalName)
         => typeCheckIntArg(integerType(N), N' -Int 1, A) ...</k>
         <currModule> ModName:SymbolicValueRef </currModule>
         <funModuleName> ModName </funModuleName>
         <currFunction> FunName:SymbolicValueRef </currFunction>
         <functionName> FunName </functionName>
         <varTypes>... addNameToString(X) |-> T ...</varTypes>

    //define illform situations for type checking of integer operators.
    rule <k> typeCheckIntArg(integerType(N:Int), N':Int, A:K, T:KResult, K:K) ~> K'
         => .K </k>
         <output>... .List => ListItem("error: constant expression type mismatch") </output>
         requires (notBool isTheInt(K)) andBool (notBool isTheBool(K))
                   andBool (notBool isTheLocalName(K))

    rule <k> typeCheckIntArg(integerType(N:Int), I:Int, A:K, integerType(N':Int), B:Bool) ~> K
             => .K </k>
         <output>... .List => ListItem("error: constant expression type mismatch") </output>
         requires N =/=Int 1 orBool N' =/=Int 1

    rule <k> typeCheckIntArg(T:K, I:Int, < .ReturnedVal >) ~> K => .K </k>
         <output>... .List => ListItem("error: constant expression type mismatch") </output>
         requires I >Int 0
    rule <k> typeCheckIntArg(T:K, 0, < R:ReturnedVal >) ~> K => .K </k>
         <output>... .List => ListItem("error: constant expression type mismatch") </output>
         requires R =/=K .ReturnedVal

    rule <k> typeCheckIntArg(vectorTypeValue(T:K, I:Int), < R:ReturnedVal >) ~> K
         => .K </k>
         <output>... .List => ListItem("error: instruction requires integer or integer vector operands") </output>
         requires getKLabel(T) =/=KLabel 'integerType
    rule <k> typeCheckIntArg(vectorTypeValue(integerType(N:Int), 0), < R:ReturnedVal >) ~> K
         => .K </k>
         <output>... .List => ListItem("error: zero element vector is illegal") </output>
    rule <k> typeCheckIntArg(vectorTypeValue(integerType(N:Int), I:Int), < R:ReturnedVal >) ~> K
         => .K </k>
         <output>... .List => ListItem("error: expected number in address space") </output>
         requires I <Int 0
    rule <k> typeCheckIntArg(vectorTypeValue(integerType(N:Int), I:Int), < .ReturnedVal >) ~> K
         => .K </k>
         <output>... .List => ListItem("error: constant vector must not be empty") </output>
         requires I >Int 0
    rule <k> typeCheckIntArg(Ty:K, I:Int) ~> K => .K </k>
         <output>... .List => ListItem("error: integer constant must have integer type") </output>
         requires getKLabel(Ty) =/=KLabel 'integerType
    rule <k> typeCheckIntArg(Ty:K, B:Bool) ~> K => .K </k>
         <output>... .List => ListItem("error: constant expression type mismatch") </output>
         requires getKLabel(Ty) =/=KLabel 'integerType
    rule <k> typeCheckIntArg(integerType(N:Int), B:Bool) ~> K => .K </k>
         <output>... .List => ListItem("error: constant expression type mismatch") </output>
         requires N =/=K 1
    rule <k> typeCheckIntArg(T:K, X:LocalName) ~> K => .K </k>
         <output>... .List => ListItem("error: "+String "'" +String
                              #tokenToString(X) +String " defined with type '"
                             +String #tokenToString(T') +String "'") </output>
         <varTypes>... addNameToString(X) |-> T':K ...</varTypes>
         requires T =/=K T'


    syntax KItem ::= instValToKItem(InstVal) [function]

    //here
    //do the same for all IntConstructors  "add" | "sub" | "mul" | "shl"
    //add addNameToString to every position where it has type and ValueRef
    //for example theAdd
    rule instValToKItem(add Onw:OptNW Ty:Type V1:ValueRef , V2:ValueRef Ins:InstructionMetadatas)
           => instruction(theAdd(addNameToString(Ty)
                                 ,addNameToString(V1)
                                 ,addNameToString(V2))
                          ,formSet(Onw)
                          ,insMetas(formElemList(Ins)))
    rule instValToKItem(sub Onw:OptNW Ty:Type V1:ValueRef , V2:ValueRef Ins:InstructionMetadatas)
           => instruction(theSub(addNameToString(Ty)
                                 ,addNameToString(V1)
                                 ,addNameToString(V2))
                          ,formSet(Onw)
                          ,insMetas(formElemList(Ins)))
    rule instValToKItem(mul Onw:OptNW Ty:Type V1:ValueRef , V2:ValueRef Ins:InstructionMetadatas)
           => instruction(theMul(addNameToString(Ty)
                                 ,addNameToString(V1)
                                 ,addNameToString(V2))
                          ,formSet(Onw)
                          ,insMetas(formElemList(Ins)))
    rule instValToKItem(shl Onw:OptNW Ty:Type V1:ValueRef , V2:ValueRef Ins:InstructionMetadatas)
           => instruction(theShl(addNameToString(Ty)
                                 ,addNameToString(V1)
                                 ,addNameToString(V2))
                          ,formSet(Onw)
                          ,insMetas(formElemList(Ins)))
    //do the same for all DivConstructors ::= "udiv" | "sdiv" | "lshr" | "ashr"
    //done
    rule instValToKItem(udiv Opx:OptExact Ty:Type V1:ValueRef , V2:ValueRef Ins:InstructionMetadatas)
           => instruction(theUDiv(addNameToString(Ty)
                                  ,addNameToString(V1)
                                  ,addNameToString(V2))
                          ,formSet(Opx)
                          ,insMetas(formElemList(Ins)))
    rule instValToKItem(sdiv Opx:OptExact Ty:Type V1:ValueRef , V2:ValueRef Ins:InstructionMetadatas)
           => instruction(theSDiv(addNameToString(Ty)
                                  ,addNameToString(V1)
                                  ,addNameToString(V2))
                          ,formSet(Opx)
                          ,insMetas(formElemList(Ins)))
    rule instValToKItem(lshr Opx:OptExact Ty:Type V1:ValueRef , V2:ValueRef Ins:InstructionMetadatas)
           => instruction(theLShr(addNameToString(Ty)
                                  ,addNameToString(V1)
                                  ,addNameToString(V2))
                          ,formSet(Opx)
                          ,insMetas(formElemList(Ins)))
    rule instValToKItem(ashr Opx:OptExact Ty:Type V1:ValueRef , V2:ValueRef Ins:InstructionMetadatas)
           => instruction(theAShr(addNameToString(Ty)
                                  ,addNameToString(V1)
                                  ,addNameToString(V2))
                          ,formSet(Opx)
                          ,insMetas(formElemList(Ins)))
    //do the same for all FloatOps ::= "fadd" | "fsub" | "fmul" | "fdiv" | "frem"
    //done
    rule instValToKItem(fadd Fmf:FastMathFlags Ty:Type V1:ValueRef , V2:ValueRef Ins:InstructionMetadatas)
           => instruction(theFAdd(addNameToString(Ty)
                                  ,addNameToString(V1)
                                  ,addNameToString(V2))
                          ,formSet(Fmf)
                          ,insMetas(formElemList(Ins)))
    rule instValToKItem(fsub Fmf:FastMathFlags Ty:Type V1:ValueRef , V2:ValueRef Ins:InstructionMetadatas)
           => instruction(theFSub(addNameToString(Ty)
                                  ,addNameToString(V1)
                                  ,addNameToString(V2))
                          ,formSet(Fmf)
                          ,insMetas(formElemList(Ins)))
    rule instValToKItem(fmul Fmf:FastMathFlags Ty:Type V1:ValueRef , V2:ValueRef Ins:InstructionMetadatas)
           => instruction(theFMul(addNameToString(Ty)
                                  ,addNameToString(V1)
                                  ,addNameToString(V2))
                          ,formSet(Fmf)
                          ,insMetas(formElemList(Ins)))
    rule instValToKItem(fdiv Fmf:FastMathFlags Ty:Type V1:ValueRef , V2:ValueRef Ins:InstructionMetadatas)
           => instruction(theFDiv(addNameToString(Ty)
                                  ,addNameToString(V1)
                                  ,addNameToString(V2))
                          ,formSet(Fmf)
                          ,insMetas(formElemList(Ins)))
    rule instValToKItem(frem Fmf:FastMathFlags Ty:Type V1:ValueRef , V2:ValueRef Ins:InstructionMetadatas)
           => instruction(theFRem(addNameToString(Ty)
                                  ,addNameToString(V1)
                                  ,addNameToString(V2))
                          ,formSet(Fmf)
                          ,insMetas(formElemList(Ins)))
    rule instValToKItem(urem Ty:Type V1:ValueRef , V2:ValueRef Ins:InstructionMetadatas)
           => instruction(theURem(addNameToString(Ty)
                                  ,addNameToString(V1)
                                  ,addNameToString(V2))
                          ,.Set
                          ,insMetas(formElemList(Ins)))
    rule instValToKItem(srem Ty:Type V1:ValueRef , V2:ValueRef Ins:InstructionMetadatas)
           => instruction(theSRem(addNameToString(Ty)
                                  ,addNameToString(V1)
                                  ,addNameToString(V2))
                          ,.Set
                          ,insMetas(formElemList(Ins)))
    //do the same for LogicalOps ::= "and" | "or" | "xor"
    //done
    rule instValToKItem(and Ty:Type V1:ValueRef , V2:ValueRef Ins:InstructionMetadatas)
           => instruction(theAnd(addNameToString(Ty)
                                 ,addNameToString(V1)
                                 ,addNameToString(V2))
                          ,.Set
                          ,insMetas(formElemList(Ins)))
    rule instValToKItem(or Ty:Type V1:ValueRef , V2:ValueRef Ins:InstructionMetadatas)
           => instruction(theOr(addNameToString(Ty)
                                ,addNameToString(V1)
                                ,addNameToString(V2))
                          ,.Set
                          ,insMetas(formElemList(Ins)))
    rule instValToKItem(xor Ty:Type V1:ValueRef , V2:ValueRef Ins:InstructionMetadatas)
           => instruction(theXor(addNameToString(Ty)
                                 ,addNameToString(V1)
                                 ,addNameToString(V2))
                          ,.Set
                          ,insMetas(formElemList(Ins)))

/*    
    rule icmp ne T:Type V:ValueRef , V':ValueRef I:InstructionMetadatas
           => theDefinition(INotEq(T, V, V'),I)
*/
    rule instValToKItem(icmp ne Ty:Type V1:ValueRef , V2:ValueRef Ins:InstructionMetadatas)
           => instruction(iNotEq(addNameToString(Ty)
                                 ,addNameToString(V1)
                                 ,addNameToString(V2))
                          ,.Set
                          ,insMetas(formElemList(Ins)))
/*
    rule icmp eq T:Type V:ValueRef , V':ValueRef I:InstructionMetadatas
        => theDefinition(IEq(T, V, V'),I)
*/
    rule instValToKItem(icmp eq Ty:Type V1:ValueRef , V2:ValueRef Ins:InstructionMetadatas)
           => instruction(iEq(addNameToString(Ty)
                              ,addNameToString(V1)
                              ,addNameToString(V2))
                          ,.Set
                          ,insMetas(formElemList(Ins)))
/*
   rule icmp ugt T:Type V:ValueRef , V':ValueRef I:InstructionMetadatas
         => theDefinition(UGT(T, V, V'),I)
*/
    rule instValToKItem(icmp ugt Ty:Type V1:ValueRef , V2:ValueRef Ins:InstructionMetadatas)
           => instruction(uGT(addNameToString(Ty)
                              ,addNameToString(V1)
                              ,addNameToString(V2))
                          ,.Set
                          ,insMetas(formElemList(Ins)))
/*
    rule icmp uge T:Type V:ValueRef , V':ValueRef I:InstructionMetadatas
         => theDefinition(UGE(T, V, V'),I)
*/
    rule instValToKItem(icmp uge Ty:Type V1:ValueRef , V2:ValueRef Ins:InstructionMetadatas)
           => instruction(uGE(addNameToString(Ty)
                              ,addNameToString(V1)
                              ,addNameToString(V2))
                          ,.Set
                          ,insMetas(formElemList(Ins)))
/*
    rule icmp ult T:Type V:ValueRef , V':ValueRef I:InstructionMetadatas
         => theDefinition(ULT(T, V, V'),I)
*/
    rule instValToKItem(icmp ult Ty:Type V1:ValueRef , V2:ValueRef Ins:InstructionMetadatas)
           => instruction(uLT(addNameToString(Ty)
                              ,addNameToString(V1)
                              ,addNameToString(V2))
                          ,.Set
                          ,insMetas(formElemList(Ins)))
/*
    rule icmp ule T:Type V:ValueRef , V':ValueRef I:InstructionMetadatas
         => theDefinition(ULE(T, V, V'),I)
*/
    rule instValToKItem(icmp ule Ty:Type V1:ValueRef , V2:ValueRef Ins:InstructionMetadatas)
           => instruction(uLE(addNameToString(Ty)
                              ,addNameToString(V1)
                              ,addNameToString(V2))
                          ,.Set
                          ,insMetas(formElemList(Ins)))
/*
    rule icmp sgt T:Type V:ValueRef , V':ValueRef I:InstructionMetadatas
         => theDefinition(SGT(T, V, V'),I)
*/
    rule instValToKItem(icmp sgt Ty:Type V1:ValueRef , V2:ValueRef Ins:InstructionMetadatas)
           => instruction(sGT(addNameToString(Ty)
                              ,addNameToString(V1)
                              ,addNameToString(V2))
                          ,.Set
                          ,insMetas(formElemList(Ins)))
/*
    rule icmp sge T:Type V:ValueRef , V':ValueRef I:InstructionMetadatas
         => theDefinition(SGE(T, V, V'),I)
*/
    rule instValToKItem(icmp sge Ty:Type V1:ValueRef , V2:ValueRef Ins:InstructionMetadatas)
           => instruction(sGE(addNameToString(Ty)
                              ,addNameToString(V1)
                              ,addNameToString(V2))
                          ,.Set
                          ,insMetas(formElemList(Ins)))
/*
    rule icmp slt T:Type V:ValueRef , V':ValueRef I:InstructionMetadatas
         => theDefinition(SLT(T, V, V'),I)
*/
    rule instValToKItem(icmp slt Ty:Type V1:ValueRef , V2:ValueRef Ins:InstructionMetadatas)
           => instruction(sLT(addNameToString(Ty)
                              ,addNameToString(V1)
                              ,addNameToString(V2))
                          ,.Set
                          ,insMetas(formElemList(Ins)))
/*
    rule icmp sle T:Type V:ValueRef , V':ValueRef I:InstructionMetadatas
         => theDefinition(SLE(T, V, V'),I)
*/
    rule instValToKItem(icmp sle Ty:Type V1:ValueRef , V2:ValueRef Ins:InstructionMetadatas)
           => instruction(sLE(addNameToString(Ty)
                              ,addNameToString(V1)
                              ,addNameToString(V2))
                          ,.Set
                          ,insMetas(formElemList(Ins)))
/*
    rule fcmp false _:Type _:ValueRef , _:ValueRef I:InstructionMetadatas
         => theDefinition(0,I)
*/
    rule instValToKItem(fcmp false Ty:Type V1:ValueRef , V2:ValueRef Ins:InstructionMetadatas)
           => instruction(0,.Set,insMetas(formElemList(Ins)))
/*
    rule fcmp true _:Type _:ValueRef , _:ValueRef I:InstructionMetadatas
         => theDefinition(1,I)
*/
    rule instValToKItem(fcmp true Ty:Type V1:ValueRef , V2:ValueRef Ins:InstructionMetadatas)
           => instruction(1,.Set,insMetas(formElemList(Ins)))
/*
    rule fcmp oeq T:Type V:ValueRef , V':ValueRef I:InstructionMetadatas
         => theDefinition(OEQ(T, V, V'),I)
*/
    rule instValToKItem(fcmp oeq Ty:Type V1:ValueRef , V2:ValueRef Ins:InstructionMetadatas)
           => instruction(oEQ(addNameToString(Ty)
                              ,addNameToString(V1)
                              ,addNameToString(V2))
                          ,.Set
                          ,insMetas(formElemList(Ins)))
/*
    rule fcmp ogt T:Type V:ValueRef , V':ValueRef I:InstructionMetadatas
         => theDefinition(OGT(T, V, V'),I)
*/
    rule instValToKItem(fcmp ogt Ty:Type V1:ValueRef , V2:ValueRef Ins:InstructionMetadatas)
           => instruction(oGT(addNameToString(Ty)
                              ,addNameToString(V1)
                              ,addNameToString(V2))
                          ,.Set
                          ,insMetas(formElemList(Ins)))
/*
    rule fcmp oge T:Type V:ValueRef , V':ValueRef I:InstructionMetadatas
         => theDefinition(OGE(T, V, V'),I)
*/
    rule instValToKItem(fcmp oge Ty:Type V1:ValueRef , V2:ValueRef Ins:InstructionMetadatas)
           => instruction(oGE(addNameToString(Ty)
                              ,addNameToString(V1)
                              ,addNameToString(V2))
                          ,.Set
                          ,insMetas(formElemList(Ins)))
/*
    rule fcmp olt T:Type V:ValueRef , V':ValueRef I:InstructionMetadatas
         => theDefinition(OLT(T, V, V'),I)
*/
    rule instValToKItem(fcmp olt Ty:Type V1:ValueRef , V2:ValueRef Ins:InstructionMetadatas)
           => instruction(oLT(addNameToString(Ty)
                              ,addNameToString(V1)
                              ,addNameToString(V2))
                          ,.Set
                          ,insMetas(formElemList(Ins)))
/*
    rule fcmp ole T:Type V:ValueRef , V':ValueRef I:InstructionMetadatas
         => theDefinition(OLE(T, V, V'),I)
*/
    rule instValToKItem(fcmp ole Ty:Type V1:ValueRef , V2:ValueRef Ins:InstructionMetadatas)
           => instruction(oLE(addNameToString(Ty)
                              ,addNameToString(V1)
                              ,addNameToString(V2))
                          ,.Set
                          ,insMetas(formElemList(Ins)))
/*
    rule fcmp one T:Type V:ValueRef , V':ValueRef I:InstructionMetadatas
         => theDefinition(ONE(T, V, V'),I)
*/
    rule instValToKItem(fcmp one Ty:Type V1:ValueRef , V2:ValueRef Ins:InstructionMetadatas)
           => instruction(oNE(addNameToString(Ty)
                              ,addNameToString(V1)
                              ,addNameToString(V2))
                          ,.Set
                          ,insMetas(formElemList(Ins)))
/*
    rule fcmp ord T:Type V:ValueRef , V':ValueRef I:InstructionMetadatas
         => theDefinition(ORD(T, V, V'),I)
*/
    rule instValToKItem(fcmp ord Ty:Type V1:ValueRef , V2:ValueRef Ins:InstructionMetadatas)
           => instruction(oRD(addNameToString(Ty)
                              ,addNameToString(V1)
                              ,addNameToString(V2))
                          ,.Set
                          ,insMetas(formElemList(Ins)))
/*
    rule fcmp ugt T:Type V:ValueRef , V':ValueRef I:InstructionMetadatas
         => theDefinition(UGT(T, V, V'),I)
*/
    rule instValToKItem(fcmp ugt Ty:Type V1:ValueRef , V2:ValueRef Ins:InstructionMetadatas)
           => instruction(uGT(addNameToString(Ty)
                              ,addNameToString(V1)
                              ,addNameToString(V2))
                          ,.Set
                          ,insMetas(formElemList(Ins)))
/*
    rule fcmp uge T:Type V:ValueRef , V':ValueRef I:InstructionMetadatas
         => theDefinition(UGE(T, V, V'),I)
*/
    rule instValToKItem(fcmp uge Ty:Type V1:ValueRef , V2:ValueRef Ins:InstructionMetadatas)
           => instruction(uGE(addNameToString(Ty)
                              ,addNameToString(V1)
                              ,addNameToString(V2))
                          ,.Set
                          ,insMetas(formElemList(Ins)))
/*
    rule fcmp ult T:Type V:ValueRef , V':ValueRef I:InstructionMetadatas
         => theDefinition(ULT(T, V, V'),I)
*/
    rule instValToKItem(fcmp ult Ty:Type V1:ValueRef , V2:ValueRef Ins:InstructionMetadatas)
           => instruction(uLT(addNameToString(Ty)
                              ,addNameToString(V1)
                              ,addNameToString(V2))
                          ,.Set
                          ,insMetas(formElemList(Ins)))
/*
    rule fcmp ule T:Type V:ValueRef , V':ValueRef I:InstructionMetadatas
         => theDefinition(ULE(T, V, V'),I)
*/
    rule instValToKItem(fcmp ule Ty:Type V1:ValueRef , V2:ValueRef Ins:InstructionMetadatas)
           => instruction(uLE(addNameToString(Ty)
                              ,addNameToString(V1)
                              ,addNameToString(V2))
                          ,.Set
                          ,insMetas(formElemList(Ins)))
/*
    rule fcmp une T:Type V:ValueRef , V':ValueRef I:InstructionMetadatas
         => theDefinition(UNE(T, V, V'),I)
*/
    rule instValToKItem(fcmp une Ty:Type V1:ValueRef , V2:ValueRef Ins:InstructionMetadatas)
           => instruction(uNE(addNameToString(Ty)
                              ,addNameToString(V1)
                              ,addNameToString(V2))
                          ,.Set
                          ,insMetas(formElemList(Ins)))
/*
    rule fcmp uno T:Type V:ValueRef , V':ValueRef I:InstructionMetadatas
         => theDefinition(UNO(T, V, V'),I)
*/
    rule instValToKItem(fcmp uno Ty:Type V1:ValueRef , V2:ValueRef Ins:InstructionMetadatas)
           => instruction(uNO(addNameToString(Ty)
                              ,addNameToString(V1)
                              ,addNameToString(V2))
                          ,.Set
                          ,insMetas(formElemList(Ins)))
/*
    rule fcmp ueq T:Type V:ValueRef , V':ValueRef I:InstructionMetadatas
         => theDefinition(UEQ(T, V, V'),I)
*/
    rule instValToKItem(fcmp ueq Ty:Type V1:ValueRef , V2:ValueRef Ins:InstructionMetadatas)
           => instruction(uEQ(addNameToString(Ty)
                              ,addNameToString(V1)
                              ,addNameToString(V2))
                          ,.Set
                          ,insMetas(formElemList(Ins)))

    //do the same for all the rules: CastOps ::= "trunc" | "zext" | "sext" | "fptrunc"
                     //| "fpext" | "bitcast" | "uitofp" | "sitofp"
                     //| "fptoui" | "fptosi" | "inttoptr"
                     //| "addrspacecast" | "ptrtoint"

    rule instValToKItem(trunc Ty1:Type V:ValueRef to Ty2:Type Ins:InstructionMetadatas)
           => instruction(theTrunc(addNameToString(Ty1)
                                   ,addNameToString(V)
                                   ,addNameToString(Ty2))
                          ,.Set
                          ,insMetas(formElemList(Ins)))
     rule instValToKItem(sext Ty1:Type V:ValueRef to Ty2:Type Ins:InstructionMetadatas)
           => instruction(theSExt(addNameToString(Ty1)
                                  ,addNameToString(V)
                                  ,addNameToString(Ty2))
                          ,.Set
                          ,insMetas(formElemList(Ins)))
     rule instValToKItem(zext Ty1:Type V:ValueRef to Ty2:Type Ins:InstructionMetadatas)
           => instruction(theZExt(addNameToString(Ty1)
                                  ,addNameToString(V)
                                  ,addNameToString(Ty2))
                          ,.Set
                          ,insMetas(formElemList(Ins)))
     rule instValToKItem(bitcast Ty1:Type V:ValueRef to Ty2:Type Ins:InstructionMetadatas)
           => instruction(theBitCast(addNameToString(Ty1)
                                     ,addNameToString(V)
                                     ,addNameToString(Ty2))
                          ,.Set
                          ,insMetas(formElemList(Ins)))
     rule instValToKItem(inttoptr Ty1:Type V:ValueRef to Ty2:Type Ins:InstructionMetadatas)
           => instruction(theIntToPtr(addNameToString(Ty1)
                                      ,addNameToString(V)
                                      ,addNameToString(Ty2))
                          ,.Set
                          ,insMetas(formElemList(Ins)))
     rule instValToKItem(ptrtoint Ty1:Type V:ValueRef to Ty2:Type Ins:InstructionMetadatas)
           => instruction(thePtrToInt(addNameToString(Ty1)
                                      ,addNameToString(V)
                                      ,addNameToString(Ty2))
                          ,.Set
                          ,insMetas(formElemList(Ins)))
     rule instValToKItem(fptosi Ty1:Type V:ValueRef to Ty2:Type Ins:InstructionMetadatas)
           => instruction(theFpToSI(addNameToString(Ty1)
                                    ,addNameToString(V)
                                    ,addNameToString(Ty2))
                          ,.Set
                          ,insMetas(formElemList(Ins)))
     rule instValToKItem(fptoui Ty1:Type V:ValueRef to Ty2:Type Ins:InstructionMetadatas)
           => instruction(theFpToUI(addNameToString(Ty1)
                                    ,addNameToString(V)
                                    ,addNameToString(Ty2))
                          ,.Set
                          ,insMetas(formElemList(Ins)))
     rule instValToKItem(fptrunc Ty1:Type V:ValueRef to Ty2:Type Ins:InstructionMetadatas)
           => instruction(theFPTrunc(addNameToString(Ty1)
                                     ,addNameToString(V)
                                     ,addNameToString(Ty2))
                          ,.Set
                          ,insMetas(formElemList(Ins)))
     rule instValToKItem(fpext Ty1:Type V:ValueRef to Ty2:Type Ins:InstructionMetadatas)
           => instruction(theFPExt(addNameToString(Ty1)
                                   ,addNameToString(V)
                                   ,addNameToString(Ty2))
                          ,.Set
                          ,insMetas(formElemList(Ins)))
     rule instValToKItem(sitofp Ty1:Type V:ValueRef to Ty2:Type Ins:InstructionMetadatas)
           => instruction(theSIToFP(addNameToString(Ty1)
                                    ,addNameToString(V)
                                    ,addNameToString(Ty2))
                          ,.Set
                          ,insMetas(formElemList(Ins)))
     rule instValToKItem(uitofp Ty1:Type V:ValueRef to Ty2:Type Ins:InstructionMetadatas)
           => instruction(theUIToFP(addNameToString(Ty1)
                                    ,addNameToString(V)
                                    ,addNameToString(Ty2))
                          ,.Set
                          ,insMetas(formElemList(Ins)))
     rule instValToKItem(addrspacecast Ty1:Type V:ValueRef to Ty2:Type Ins:InstructionMetadatas)
           => instruction(theAddrspacecast(addNameToString(Ty1)
                                           ,addNameToString(V)
                                           ,addNameToString(Ty2))
                          ,.Set
                          ,insMetas(formElemList(Ins)))

    rule instValToKItem(select Ty1:Type V1:ValueRef, Ty2:Type V2:ValueRef, Ty3:Type V3:ValueRef)
           => instruction(select(addNameToString(Ty1)
                                 ,addNameToString(V1)
                                 ,operand(addNameToString(Ty2),addNameToString(V2))
                                 ,operand(addNameToString(Ty3),addNameToString(V3)))
                          ,.Set
                          ,insMetas(.ElemList))

    rule instValToKItem(va_arg Ty1:Type V1:ValueRef, Ty2:Type Ins:InstructionMetadatas)
           => instruction(theVAArg(addNameToString(Ty2)
                                   ,operand(addNameToString(Ty1),addNameToString(V1)))
                          ,.Set
                          ,insMetas(formElemList(Ins)))

    rule instValToKItem(getelementptr Oib:OptInBounds Ty:Type , Ty1:Type V1:ValueRef
                                    Itr:IntResolveVals Ins:InstructionMetadatas)
           => instruction(getElementPtr(addNameToString(Ty1)
                                        ,addNameToString(V1)
                                        ,formElemList(Itr))
                          ,formSet(Oib)
                          ,insMetas(formElemList(Ins)))

    rule instValToKItem(extractelement Ty1:Type V1:ValueRef,
                                    Ty2:Type V2:ValueRef Ins:InstructionMetadatas)
           => instruction(extractElement(operand(addNameToString(Ty1),addNameToString(V1))
                                         ,operand(addNameToString(Ty2),addNameToString(V2)))
                          ,.Set
                          ,insMetas(formElemList(Ins)))

    rule instValToKItem(insertelement Ty1:Type V1:ValueRef, Ty2:Type V2:ValueRef,
                              Ty3:Type V3:ValueRef Ins:InstructionMetadatas)
           => instruction(insertElement(operand(addNameToString(Ty1),addNameToString(V1))
                                        ,operand(addNameToString(Ty2),addNameToString(V2))
                                        ,operand(addNameToString(Ty3),addNameToString(V3)))
                          ,.Set
                          ,insMetas(formElemList(Ins)))

    rule instValToKItem(shufflevector Ty1:Type V1:ValueRef, Ty2:Type V2:ValueRef,
                              Ty3:Type V3:ValueRef Ins:InstructionMetadatas)
           => instruction(shuffleVector(operand(addNameToString(Ty1),addNameToString(V1))
                                        ,operand(addNameToString(Ty2),addNameToString(V2))
                                        ,operand(addNameToString(Ty3),addNameToString(V3)))
                          ,.Set
                          ,insMetas(formElemList(Ins)))

    rule instValToKItem(phi Ty1:Type Pl:PHIList Ins:InstructionMetadatas)
           => instruction(phi(addNameToString(Ty1)
                              ,formElemList(Pl))
                          ,.Set
                          ,insMetas(formElemList(Ins)))

    rule instValToKItem(landingpad Ty1:Type personality Ty2:Type V2:ValueRef
                         Oc:OptCleanup Lpfs:LandingpadFactors Ins:InstructionMetadatas)
           => instruction(landingPad(addNameToString(Ty1)
                                     ,operand(addNameToString(Ty2),addNameToString(V2))
                                     ,formElemList(Lpfs))
                          ,formSet(Oc)
                          ,insMetas(formElemList(Ins)))
    //optTailCall ::= call
    rule instValToKItem(call Ocv:OptCallingConv Rat:RetAttrs Ty1:Type
                     V1:ValueRef (ParamList) Fat:FuncAttrs Ins:InstructionMetadatas)
           => instruction(call(addNameToString(Ty1),callee(addNameToString(V1),
                               arguments(formElemList(ParamList))))
                          ,formSet(Ocv) formSet(Rat) formSet(Fat)
                          ,insMetas(formElemList(Ins)))
    //do the same above for OptTailCall ::= tail call
    rule instValToKItem(tail call Ocv:OptCallingConv Rat:RetAttrs Ty1:Type
                     V1:ValueRef (ParamList) Fat:FuncAttrs Ins:InstructionMetadatas)
           => instruction(tailCall(addNameToString(Ty1),callee(addNameToString(V1),
                                   arguments(formElemList(ParamList))))
                          ,formSet(Ocv) formSet(Rat) formSet(Fat)
                          ,insMetas(formElemList(Ins)))

    rule instValToKItem(alloca Oil:OptInalloca All:AllocMetadata Ins:InstructionMetadatas)
           => instruction(dealWithAllocaElem(All),formSet(Oil),insMetas(formElemList(Ins)))


    rule instValToKItem(load Oac:Atomic Ovl:OptVolatile T:Type, Ty:Type V:ValueRef
                                 Oso:OptScopeOrder,  Oal:Align Ins:InstructionMetadatas)
           => instruction(load(addNameToString(Ty)
                               ,addNameToString(V))
                          ,formSet(Oac) formSet(Ovl) formSet(Oso) formSet(Oal)
                          ,insMetas(formElemList(Ins)))
    //do the same above for "load" OptAtomic OptVolatile ResolvedVal OptScopeOrder "," OptAlign InstructionMetadatas
    rule instValToKItem(load Ovl:OptVolatile T:Type, Ty:Type V:ValueRef ,Oal:Align Ins:InstructionMetadatas)
           => instruction(load(addNameToString(Ty)
                               ,addNameToString(V))
                          ,formSet(Ovl) formSet(Oal)
                          ,insMetas(formElemList(Ins)))
     
    rule instValToKItem(load Ovl:OptVolatile T:Type, Ty:Type V:ValueRef Ins:InstructionMetadatas)
           => instruction(load(addNameToString(Ty)
                               ,addNameToString(V))
                          ,formSet(Ovl)
                          ,insMetas(formElemList(Ins)))

    //try to do the following:
/* 
"extractvalue" ResolvedVal ConstantIndexList InstructionMetadatas
*/
    rule instValToKItem(extractvalue Ty1:Type V1:ValueRef Cil:ConstantIndexList Ins:InstructionMetadatas)
           => instruction(extractValue(operand(addNameToString(Ty1)
                               ,addNameToString(V1))
                                       ,formElemList(Cil))
                          ,.Set
                          ,insMetas(formElemList(Ins)))

/*
"cmpxchg" OptVolatile ResolvedVal "," ResolvedVal "," ResolvedVal OptSingleThread OrderingList InstructionMetadatas
*/
    rule instValToKItem(cmpxchg Ovl:OptVolatile Ty1:Type V1:ValueRef,
                       Ty2:Type V2:ValueRef, Ty3:Type V3:ValueRef
                       Ost:OptSingleThread Oli:OrderingList Ins:InstructionMetadatas)
           => instruction(cmpxChg(operand(addNameToString(Ty1),addNameToString(V1))
                                  ,operand(addNameToString(Ty2),addNameToString(V2))
                                  ,operand(addNameToString(Ty3),addNameToString(V3)))
                          ,formSet(Ovl) formSet(Ost) formSet(Oli)
                          ,insMetas(formElemList(Ins)))
/*
‘atomicrmw‘ instruction is used to atomically modify memory.
"atomicrmw" OptVolatile BinOpsForAtomicrmw ResolvedVal "," ResolvedVal OptSingleThread Ordering InstructionMetadatas
*/
    rule instValToKItem(atomicrmw Ovl:OptVolatile Bof:BinOpsForAtomicrmw Ty1:Type V1:ValueRef,
                   Ty2:Type V2:ValueRef Ost:OptSingleThread Ord:Ordering Ins:InstructionMetadatas)
          => instruction(atomicRmw(Bof
                                   ,operand(addNameToString(Ty1),addNameToString(V1))
                                   ,operand(addNameToString(Ty2),addNameToString(V2)))
                         ,formSet(Ovl) formSet(Ost) formSet(Ord)
                         ,insMetas(formElemList(Ins)))
/*
"insertvalue" ResolvedVal "," ResolvedVal ConstantIndexList InstructionMetadatas
*/
   rule instValToKItem(insertvalue Ty1:Type V1:ValueRef, Ty2:Type V2:ValueRef
                                Cil:ConstantIndexList Ins:InstructionMetadatas)
          => instruction(insertValue(operand(addNameToString(Ty1),addNameToString(V1))
                                     ,operand(addNameToString(Ty2),addNameToString(V2))
                                     ,formElemList(Cil))
                         ,.Set
                         ,insMetas(formElemList(Ins)))

    //ensure the static single assignment property in a function.
    //and normalize the llvm operators to abstract syntax.

    syntax KItem ::= checkSingleAssignment(K, K)
                   | checkSingleAssignmentInBlock(SymbolicValueRef, K, K, Bool) //name, tocheck, stores, is-phi-allow

    //in the checkSingleAssignment and checkSingleAssignmentInBlock
    //to add addNameToString to every positioins where show Type and ValueRef
    //for example the third rule

    //form a basicBlock finally.
    rule checkSingleAssignmentInBlock(N:SymbolicValueRef, .K, K:K, _:Bool)
         ~> checkSingleAssignment(K1:K, K2:K)
         => checkSingleAssignment(K1, K2 ~> basicBlock(N,K))

    //have dealt with all instruction list.
    rule checkSingleAssignmentInBlock(N:SymbolicValueRef, .InstructionList
                               BB:K, K:K, B:Bool)
         => checkSingleAssignmentInBlock(N, BB, K, B)

    //deal with termination instructions.
    rule checkSingleAssignmentInBlock(N:SymbolicValueRef, ret Nt:NonVoidType
                                  Va:ValueRef Meta:InstructionMetadatas, K:K, _:Bool)
         => checkSingleAssignmentInBlock(N, .K, K
                         ~> instruction(ret(addNameToString(Nt),addNameToString(Va))
                                        ,.Set
                                        ,insMetas(formElemList(Meta))), false)
    rule checkSingleAssignmentInBlock(N:SymbolicValueRef, ret Nt:VoidType
                                  Meta:InstructionMetadatas, K:K, _:Bool)
         => checkSingleAssignmentInBlock(N, .K, K
                         ~> instruction(ret(addNameToString(Nt),undef)
                                        ,.Set
                                        ,insMetas(formElemList(Meta))), false)

    rule checkSingleAssignmentInBlock(N:SymbolicValueRef, br label La:ValueRef
                                  Meta:InstructionMetadatas, K:K, _:Bool)
         => checkSingleAssignmentInBlock(N, .K, K
                   ~> instruction(unconditional(addNameToString(La))
                                  ,.Set
                                  ,insMetas(formElemList(Meta))), false)
    rule checkSingleAssignmentInBlock(N:SymbolicValueRef, br It:IntType Va:ValueRef ,
                                       label La1:ValueRef , label La2:ValueRef
                                  Meta:InstructionMetadatas, K:K, _:Bool)
         => checkSingleAssignmentInBlock(N, .K, K
               ~> instruction(conditional(operand(addNameToString(It),addNameToString(Va))
                                        ,addNameToString(La1)
                                        ,addNameToString(La2))
                                    ,.Set, insMetas(formElemList(Meta))), false)

    rule checkSingleAssignmentInBlock(N:SymbolicValueRef, resume Ty:Type Va:ValueRef
                                    Meta:InstructionMetadatas, K:K, _:Bool)
         => checkSingleAssignmentInBlock(N, .K, K
             ~> instruction(resume(operand(addNameToString(Ty)
                                   ,addNameToString(Va)))
                            ,.Set, insMetas(formElemList(Meta))), false)
    rule checkSingleAssignmentInBlock(N:SymbolicValueRef, indirectbr Ty:Type Va:ValueRef ,
                                       [ Las:LabelValues ]
                                  Meta:InstructionMetadatas, K:K, _:Bool)
         => checkSingleAssignmentInBlock(N, .K, K
                ~> instruction(indirectbr(operand(addNameToString(Ty)
                                          ,addNameToString(Va))
                                          ,formElemList(Las))
                               ,.Set, insMetas(formElemList(Meta))), false)
    rule checkSingleAssignmentInBlock(N:SymbolicValueRef, switch It:IntType Va:ValueRef ,
                                       label La:ValueRef [ Ju:JumpTable ]
                                  Meta:InstructionMetadatas, K:K, _:Bool)
         => checkSingleAssignmentInBlock(N, .K, K
                  ~> instruction(switch(addNameToString(It)
                                        ,addNameToString(Va)
                                        ,addNameToString(La)
                                        ,formCases(Ju))
                                 ,.Set, insMetas(formElemList(Meta))), false)
    rule checkSingleAssignmentInBlock(N:SymbolicValueRef, unreachable
                                  Meta:InstructionMetadatas, K:K, _:Bool)
         => checkSingleAssignmentInBlock(N, .K, K
                       ~> instruction(unreachable,.Set,insMetas(formElemList(Meta))), false)

    rule <k>checkSingleAssignmentInBlock(N:SymbolicValueRef, invoke Opc:OptCallingConv Re:RetAttrs
                                       Ty:Type Va:ValueRef (Pa:ParamList) Fu:FuncAttrs
                                       to label La1:ValueRef unwind label La2:ValueRef 
                                  Meta:InstructionMetadatas, K:K, _:Bool)
         => checkSingleAssignmentInBlock(N, .K, K 
                ~> assign(name(localVar, Int2String(I))
                          ,instruction(invoke(operand(addNameToString(Ty),addNameToString(Va))
                                              ,formElemList(Pa)
                                              ,addNameToString(La1)
                                              ,addNameToString(La2))
                                       ,formSet(Opc) formSet(Re) formSet(Fu)
                                       ,insMetas(formElemList(Meta)))), false)
         ...</k>
        <currModule> ModName:SymbolicValueRef </currModule>
        <funModuleName> ModName </funModuleName>
        <currFunction> FunName:SymbolicValueRef </currFunction>
        <functionName> FunName </functionName>
        <varTypes> M:Map (.Map => name(localVar, Int2String(I)) |-> undef) </varTypes>
        <localFunVarCounter> I:Int => I +Int 1 </localFunVarCounter>
        requires notBool name(localVar, Int2String(I)) in keys(M)

    rule <k> checkSingleAssignmentInBlock(N:SymbolicValueRef,Var:LocalVar
                                       = invoke Opc:OptCallingConv Re:RetAttrs
                                       Ty:Type Va:ValueRef (Pa:ParamList) Fu:FuncAttrs
                                       to La1:LabelValue unwind La2:LabelValue 
                                  Meta:InstructionMetadatas, K:K, _:Bool)
         => checkSingleAssignmentInBlock(N, .K, K 
                ~> assign(name(localVar, substrString(#tokenToString(Var),1
               ,lengthString(#tokenToString(Var))))
                          ,instruction(invoke(operand(addNameToString(Ty),addNameToString(Va))
                                              ,formElemList(Pa)
                                              ,La1
                                              ,La2)
                                       ,formSet(Opc) formSet(Re) formSet(Fu)
                                       ,insMetas(formElemList(Meta)))), false)
        </k>
        <currModule> ModName:SymbolicValueRef </currModule>
        <funModuleName> ModName </funModuleName>
        <currFunction> FunName:SymbolicValueRef </currFunction>
        <functionName> FunName </functionName>
        <varTypes> M:Map (.Map => name(localVar, substrString(#tokenToString(Var),1
                          ,lengthString(#tokenToString(Var)))) |-> undef) </varTypes>
        <localFunVarCounter> I:Int => I +Int 1 </localFunVarCounter>
        requires notBool name(localVar, substrString(#tokenToString(Var),1
               ,lengthString(#tokenToString(Var)))) in keys(M)

    rule <k> checkSingleAssignmentInBlock(N:SymbolicValueRef,Var:LocalVar
                                       = invoke Opc:OptCallingConv Re:RetAttrs
                                       Ty:Type Va:ValueRef (Pa:ParamList) Fu:FuncAttrs
                                       to La1:LabelValue unwind La2:LabelValue 
                                  Meta:InstructionMetadatas, K:K, _:Bool) ~> K':K
         => .K
         </k>
         <currModule> ModName:SymbolicValueRef </currModule>
         <funModuleName> ModName </funModuleName>
         <currFunction> FunName:SymbolicValueRef </currFunction>
         <functionName> FunName </functionName>
        <varTypes> M:Map </varTypes>
         <output>... .List => ListItem(" multiple definition of local value named '"
                   +String substrString(#tokenToString(Var),1
               ,lengthString(#tokenToString(Var))) +String "'") </output>
        requires name(localVar, substrString(#tokenToString(Var),1
               ,lengthString(#tokenToString(Var)))) in keys(M)

    rule <k> checkSingleAssignmentInBlock(N:SymbolicValueRef,Var:LocalValID
                                       = invoke Opc:OptCallingConv Re:RetAttrs
                                       Ty:Type Va:ValueRef (Pa:ParamList) Fu:FuncAttrs
                                       to La1:LabelValue unwind La2:LabelValue 
                                  Meta:InstructionMetadatas, K:K, _:Bool) ~> K':K
         => .K
         </k>
         <currModule> ModName:SymbolicValueRef </currModule>
         <funModuleName> ModName </funModuleName>
         <currFunction> FunName:SymbolicValueRef </currFunction>
         <functionName> FunName </functionName>
        <varTypes> M:Map </varTypes>
         <output>... .List => ListItem(" multiple definition of local value named '"
                   +String substrString(#tokenToString(Var),1
               ,lengthString(#tokenToString(Var))) +String "'") </output>
        requires name(localVar, substrString(#tokenToString(Var),1
                          ,lengthString(#tokenToString(Var)))) in keys(M)

    rule <k>checkSingleAssignmentInBlock(N:SymbolicValueRef,Var:LocalValID
                                       = invoke Opc:OptCallingConv Re:RetAttrs
                                       Ty:Type Va:ValueRef (Pa:ParamList) Fu:FuncAttrs
                                       to La1:LabelValue unwind La2:LabelValue 
                                  Meta:InstructionMetadatas, K:K, _:Bool)
         => checkSingleAssignmentInBlock(N, .K, K 
                ~> assign(name(localVar, substrString(#tokenToString(Var),1
                          ,lengthString(#tokenToString(Var))))
                          ,instruction(invoke(operand(addNameToString(Ty),addNameToString(Va))
                                              ,formElemList(Pa)
                                              ,La1
                                              ,La2)
                                       ,formSet(Opc) formSet(Re) formSet(Fu)
                                       ,insMetas(formElemList(Meta)))), false)
         ...</k>
         <currModule> ModName:SymbolicValueRef </currModule>
         <funModuleName> ModName </funModuleName>
         <currFunction> FunName:SymbolicValueRef </currFunction>
         <functionName> FunName </functionName>
        <varTypes> M:Map (.Map => name(localVar, substrString(#tokenToString(Var),1
                          ,lengthString(#tokenToString(Var)))) |-> undef) </varTypes>
         <localFunVarCounter> I:Int => I +Int 1 </localFunVarCounter>
          requires String2Int(substrString(#tokenToString(Var),1
               ,lengthString(#tokenToString(Var)))) ==Int I

    rule <k> checkSingleAssignmentInBlock(N:SymbolicValueRef,Var:LocalValID
                                       = invoke Opc:OptCallingConv Re:RetAttrs
                                       Ty:Type Va:ValueRef (Pa:ParamList) Fu:FuncAttrs
                                       to La1:LabelValue unwind La2:LabelValue 
                                  Meta:InstructionMetadatas, K:K, _:Bool) ~> K':K
            => .K </k>
         <currModule> ModName:SymbolicValueRef </currModule>
         <funModuleName> ModName </funModuleName>
         <currFunction> FunName:SymbolicValueRef </currFunction>
         <functionName> FunName </functionName>
         <localFunVarCounter> I:Int </localFunVarCounter>
         <output>... .List => ListItem("error: variable expected to be numbered " +String Int2String(I)) </output>
          when String2Int(substrString(#tokenToString(Var),1
               ,lengthString(#tokenToString(Var)))) =/=Int I


    rule <k>checkSingleAssignmentInBlock(N:SymbolicValueRef, In:InstVal Ins:InstructionList
                               BB:BBTerminatorInstruction, K:K, _:Bool)
         => checkSingleAssignmentInBlock(N, Ins BB, K
                      ~> assign(name(localVar, Int2String(I)),instValToKItem(In)), false)
         ...</k>
         <currModule> ModName:SymbolicValueRef </currModule>
         <funModuleName> ModName </funModuleName>
         <currFunction> FunName:SymbolicValueRef </currFunction>
         <functionName> FunName </functionName>
         <varTypes> M:Map (.Map => name(localVar, Int2String(I)) |-> undef) </varTypes>
         <localFunVarCounter> I:Int => I +Int 1 </localFunVarCounter>
         requires getKLabel(In) =/=KLabel 'phiFun

    rule <k> checkSingleAssignmentInBlock(N:SymbolicValueRef,
               phi Ty:Type Pl:PHIList InstM:InstructionMetadatas Ins:InstructionList
                               BB:BBTerminatorInstruction, K:K, true)
         => checkSingleAssignmentInBlock(N, Ins BB,
                K ~> assign(name(localVar, Int2String(I)),
                            instValToKItem(phi Ty:Type Pl:PHIList InstM:InstructionMetadatas)), true)
         ...</k>
         <currModule> ModName:SymbolicValueRef </currModule>
         <funModuleName> ModName </funModuleName>
         <currFunction> FunName:SymbolicValueRef </currFunction>
         <functionName> FunName </functionName>
         <varTypes> M:Map (.Map => name(localVar, Int2String(I)) |-> undef) </varTypes>
         <localFunVarCounter> I:Int => I +Int 1 </localFunVarCounter>

    rule <k> checkSingleAssignmentInBlock(N:SymbolicValueRef,
               phi Ty:Type Pl:PHIList InstM:InstructionMetadatas Ins:InstructionList
                               BB:BBTerminatorInstruction, K:K, false) ~> K:K => .K </k>
          <output>... .List => ListItem("error: non-phi instructions between the start of a basic block and the PHI instructions") </output>

    rule <k> checkSingleAssignmentInBlock(N:SymbolicValueRef, Var:LocalVar = In:InstVal
               Ins:InstructionList BB:BBTerminatorInstruction, K:K, _:Bool)
         => checkSingleAssignmentInBlock(N, Ins BB, K
                      ~> assign(name(localVar, substrString(#tokenToString(Var),1
                          ,lengthString(#tokenToString(Var)))),instValToKItem(In)), true)
         ...</k>
         <currModule> ModName:SymbolicValueRef </currModule>
         <funModuleName> ModName </funModuleName>
         <currFunction> FunName:SymbolicValueRef </currFunction>
         <functionName> FunName </functionName>
         <varTypes> M:Map (.Map => name(localVar, substrString(#tokenToString(Var),1
                          ,lengthString(#tokenToString(Var)))) |-> undef) </varTypes>
         requires notBool (Var in keys(M)) andBool getKLabel(In) =/=KLabel 'phiFun

    rule <k> checkSingleAssignmentInBlock(N:SymbolicValueRef, Var:LocalVar =
               phi Ty:Type Pl:PHIList InstM:InstructionMetadatas
               Ins:InstructionList BB:BBTerminatorInstruction, K:K, true)
         => checkSingleAssignmentInBlock(N, Ins BB, K
                      ~> assign(name(localVar, substrString(#tokenToString(Var),1
                          ,lengthString(#tokenToString(Var)))),
                instValToKItem(phi Ty:Type Pl:PHIList InstM:InstructionMetadatas)), true)
         ...</k>
         <currModule> ModName:SymbolicValueRef </currModule>
         <funModuleName> ModName </funModuleName>
         <currFunction> FunName:SymbolicValueRef </currFunction>
         <functionName> FunName </functionName>
         <varTypes> M:Map (.Map => name(localVar, substrString(#tokenToString(Var),1
                          ,lengthString(#tokenToString(Var)))) |-> undef) </varTypes>
         requires notBool (Var in keys(M))

    rule <k> checkSingleAssignmentInBlock(N:SymbolicValueRef, Var:LocalVar =
               phi Ty:Type Pl:PHIList InstM:InstructionMetadatas
               Ins:InstructionList BB:BBTerminatorInstruction, K:K, false) ~> K:K
         => .K </k>
          <output>... .List => ListItem("error: non-phi instructions between the start of a basic block and the PHI instructions") </output>

    rule <k> checkSingleAssignmentInBlock(N:SymbolicValueRef, Var:LocalVar = In:InstVal
               Ins:InstructionList BB:BBTerminatorInstruction, K:K, _:Bool) ~> K':K
         => .K </k>
         <currModule> ModName:SymbolicValueRef </currModule>
         <funModuleName> ModName </funModuleName>
         <currFunction> FunName:SymbolicValueRef </currFunction>
         <functionName> FunName </functionName>
         <varTypes> M:Map </varTypes>
         <output>... .List => ListItem(" multiple definition of local value named '"
                   +String substrString(#tokenToString(Var),1
               ,lengthString(#tokenToString(Var))) +String "'") </output>
         when (Var in keys(M))


    rule <k>checkSingleAssignmentInBlock(N:SymbolicValueRef, Var:LocalValID = In:InstVal
               Ins:InstructionList BB:BBTerminatorInstruction, K:K, _:Bool)
         => checkSingleAssignmentInBlock(N, Ins BB, K
                      ~> assign(name(localVar, substrString(#tokenToString(Var),1
                          ,lengthString(#tokenToString(Var)))),instValToKItem(In)), false)
         ...</k>
         <currModule> ModName:SymbolicValueRef </currModule>
         <funModuleName> ModName </funModuleName>
         <currFunction> FunName:SymbolicValueRef </currFunction>
         <functionName> FunName </functionName>
         <varTypes> M:Map (.Map => name(localVar, substrString(#tokenToString(Var),1
                          ,lengthString(#tokenToString(Var)))) |-> undef) </varTypes>
         <localFunVarCounter> I:Int => I +Int 1 </localFunVarCounter>
         requires notBool (Var in keys(M)) andBool getKLabel(In) =/=KLabel 'phiFun
              andBool String2Int(substrString(#tokenToString(Var),1
               ,lengthString(#tokenToString(Var)))) ==Int I


    rule <k> checkSingleAssignmentInBlock(N:SymbolicValueRef, Var:LocalValID =
               phi Ty:Type Pl:PHIList InstM:InstructionMetadatas
               Ins:InstructionList BB:BBTerminatorInstruction, K:K, true)
         => checkSingleAssignmentInBlock(N, Ins BB, K
                      ~> assign(name(localVar, substrString(#tokenToString(Var),1
                          ,lengthString(#tokenToString(Var)))),
                instValToKItem(phi Ty:Type Pl:PHIList InstM:InstructionMetadatas)), true)
         ...</k>
         <currModule> ModName:SymbolicValueRef </currModule>
         <funModuleName> ModName </funModuleName>
         <currFunction> FunName:SymbolicValueRef </currFunction>
         <functionName> FunName </functionName>
         <localFunVarCounter> I:Int => I +Int 1 </localFunVarCounter>
         <varTypes> M:Map (.Map => name(localVar, substrString(#tokenToString(Var),1
                          ,lengthString(#tokenToString(Var)))) |-> undef) </varTypes>
         requires notBool (Var in keys(M)) andBool String2Int(substrString(#tokenToString(Var),1
               ,lengthString(#tokenToString(Var)))) ==Int I

    rule <k> checkSingleAssignmentInBlock(N:SymbolicValueRef, Var:LocalValID =
               phi Ty:Type Pl:PHIList InstM:InstructionMetadatas
               Ins:InstructionList BB:BBTerminatorInstruction, K:K, false) ~> K:K
         => .K </k>
          <output>... .List => ListItem("error: non-phi instructions between the start of a basic block and the PHI instructions") </output>

    rule <k>checkSingleAssignmentInBlock(N:SymbolicValueRef, Var:LocalValID = In:InstVal
               Ins:InstructionList BB:BBTerminatorInstruction, K:K, _:Bool) ~> K':K
         => .K </k>
         <currModule> ModName:SymbolicValueRef </currModule>
         <funModuleName> ModName </funModuleName>
         <currFunction> FunName:SymbolicValueRef </currFunction>
         <functionName> FunName </functionName>
         <localFunVarCounter> I:Int </localFunVarCounter>
         <output>... .List => ListItem("error: variable expected to be numbered "
                                         +String Int2String(I)) </output>
          when String2Int(substrString(#tokenToString(Var),1
               ,lengthString(#tokenToString(Var)))) =/=Int I


    rule checkSingleAssignmentInBlock(N:SymbolicValueRef, store Ovl:OptVolatile
                  Ty1:Type V1:ValueRef, Ty2:Type V2:ValueRef, Al:Align
                    Inm:InstructionMetadatas Ins:InstructionList BB:BBTerminatorInstruction, K:K, _:Bool)
         => checkSingleAssignmentInBlock(N, Ins BB, K
                      ~> instruction(store(addNameToString(Ty1)
                                           ,addNameToString(V1)
                                           ,operand(addNameToString(Ty2),addNameToString(V2)))
                                     ,formSet(Ovl) formSet(Al)
                                     ,insMetas(formElemList(Inm))), false)

    rule checkSingleAssignmentInBlock(N:SymbolicValueRef, store Ovl:OptVolatile
                  Ty1:Type V1:ValueRef, Ty2:Type V2:ValueRef
                    Inm:InstructionMetadatas Ins:InstructionList BB:BBTerminatorInstruction, K:K, _:Bool)
         => checkSingleAssignmentInBlock(N, Ins BB, K
                      ~> instruction(store(addNameToString(Ty1)
                                           ,addNameToString(V1)
                                           ,operand(addNameToString(Ty2),addNameToString(V2)))
                                     ,formSet(Ovl)
                                     ,insMetas(formElemList(Inm))), false)
/*
do the same for another store operation:
"store" OptAtomic OptVolatile ResolvedVal "," ResolvedVal OptScopeOrder InstructionMetadatas
*/
    rule checkSingleAssignmentInBlock(N:SymbolicValueRef
                                      , store Oac:Atomic Ovl:OptVolatile Ty1:Type V1:ValueRef ,
                                            Ty2:Type V2:ValueRef Osc:OptScopeOrder, Al:Align
                                            Ins:InstructionMetadatas Ili:InstructionList
                                            BB:BBTerminatorInstruction, K:K, _:Bool)
          => checkSingleAssignmentInBlock(N, Ili BB, K
                       ~> instruction(store(addNameToString(Ty1)
                                           ,addNameToString(V1)
                                           ,operand(addNameToString(Ty2),addNameToString(V2)))
                                      ,formSet(Oac) formSet(Ovl) formSet(Osc) formSet(Al)
                                      ,insMetas(formElemList(Ins))), false)
/*
create an abstract for fence and do the same for fence operation.
"fence" OptSingleThread Ordering InstructionMetadatas
*/
    rule checkSingleAssignmentInBlock(N:SymbolicValueRef
                                      , fence Ost:OptSingleThread Ord:Ordering 
                                            Ins:InstructionMetadatas Ili:InstructionList
                                            BB:BBTerminatorInstruction
                                      , K:K, _:Bool)
          => checkSingleAssignmentInBlock(N, Ili BB, K
                       ~> instruction(fence(ord)
                                      , formSet(Ost)
                                      , insMetas(formElemList(Ins))), false)


    //define checkSingleAssignment
    //bugs and ambiguity in the LLVM document about the numbered label value
    rule checkSingleAssignment(.K, K:K) => funBegin(K)

    rule <k> checkSingleAssignment(L:LabelStringConstant Ins:InstructionList
                                BB:BBTerminatorInstruction BBL:BasicBlockList, K:K)
         => checkSingleAssignmentInBlock(addNameToString(L),Ins BB, .K, true)
           ~> checkSingleAssignment(BBL, K) ...</k>
        <currModule> ModName:SymbolicValueRef </currModule>
        <funModuleName> ModName </funModuleName>
         <concreteSyntax>... (.K
               => basicBlock(addNameToString(L), Ins BB)) </concreteSyntax>
        <currFunction> FunName:SymbolicValueRef </currFunction>
        <functionName> FunName </functionName>
         <varTypes> M:Map (.Map =>  addNameToString(L) |-> label) </varTypes>
         requires notBool addNameToString(L) in keys(M)
                  andBool notBool isIntString(substrString(#tokenToString(L), 0
                                        , lengthString(#tokenToString(L)) -Int 1))

    rule <k> checkSingleAssignment(L:LabelStringConstant Ins:InstructionList
                                BB:BBTerminatorInstruction BBL:BasicBlockList, K:K) ~> K:K
         => .K </k>
         <output>... .List => ListItem("multiple definition of local value named '"
                            +String substrString(#tokenToString(L),0
                          ,lengthString(#tokenToString(L)) -Int 1) +String "'") </output>
        <currModule> ModName:SymbolicValueRef </currModule>
        <funModuleName> ModName </funModuleName>
        <currFunction> FunName:SymbolicValueRef </currFunction>
        <functionName> FunName </functionName>
         <varTypes>... addNameToString(L) |-> Ty:K ...</varTypes>


    rule <k> checkSingleAssignment(L:LabelStringConstant Ins:InstructionList
                                BB:BBTerminatorInstruction BBL:BasicBlockList, K:K)
         => checkSingleAssignmentInBlock(addNameToString(L),Ins BB, .K, true)
           ~> checkSingleAssignment(BBL, K) ...</k>
        <currModule> ModName:SymbolicValueRef </currModule>
        <funModuleName> ModName </funModuleName>
        <currFunction> FunName:SymbolicValueRef </currFunction>
        <functionName> FunName </functionName>
         <concreteSyntax>... (.K
               => basicBlock(addNameToString(L), Ins BB)) </concreteSyntax>
         <localFunVarCounter> I:Int => I +Int 1 </localFunVarCounter>
         <varTypes> M:Map (.Map => addNameToString(L) |-> label) </varTypes>
         requires notBool addNameToString(L) in keys(M)
                  andBool isIntString(substrString(#tokenToString(L), 0
                                        , lengthString(#tokenToString(L)) -Int 1))
                  andBool  String2Int(substrString(#tokenToString(L),0
                                   ,lengthString(#tokenToString(L)) -Int 1)) ==Int I


    rule <k> checkSingleAssignment(L:LabelStringConstant Ins:InstructionList
                                BB:BBTerminatorInstruction BBL:BasicBlockList, K:K)
                   ~> K:K => .K </k>
        <currModule> ModName:SymbolicValueRef </currModule>
        <funModuleName> ModName </funModuleName>
        <currFunction> FunName:SymbolicValueRef </currFunction>
        <functionName> FunName </functionName>
         <localFunVarCounter> I:Int </localFunVarCounter>
         <output>... .List => ListItem("error: variable expected to be numbered "
                                         +String Int2String(I)) </output>
         requires String2Int(substrString(#tokenToString(L),0
                        ,lengthString(#tokenToString(L)) -Int 1)) =/=Int I


    rule <k> checkSingleAssignment(L:LabelStringConstant Ins:InstructionList
                                BB:BBTerminatorInstruction, K:K)
           => checkSingleAssignmentInBlock(addNameToString(L),Ins BB, .K, true)
                 ~> checkSingleAssignment(.K, K) ...</k>
        <currModule> ModName:SymbolicValueRef </currModule>
        <funModuleName> ModName </funModuleName>
        <currFunction> FunName:SymbolicValueRef </currFunction>
        <functionName> FunName </functionName>
         <concreteSyntax>... (.K
               => basicBlock(addNameToString(L), Ins BB)) </concreteSyntax>
         <varTypes> M:Map ( .Map => addNameToString(L) |-> label) </varTypes>
         requires notBool addNameToString(L) in keys(M)
                  andBool notBool isIntString(substrString(#tokenToString(L), 0
                                        , lengthString(#tokenToString(L)) -Int 1))


    rule <k> checkSingleAssignment(L:LabelStringConstant Ins:InstructionList
                                BB:BBTerminatorInstruction, K:K)
              ~> K:K => .K </k>
        <currModule> ModName:SymbolicValueRef </currModule>
        <funModuleName> ModName </funModuleName>
        <currFunction> FunName:SymbolicValueRef </currFunction>
        <functionName> FunName </functionName>
         <varTypes> M:Map </varTypes>
         <output>... .List => ListItem("multiple definition of local value named '"
                            +String substrString(#tokenToString(L),0
                          ,lengthString(#tokenToString(L)) -Int 1) +String "'") </output>
         requires addNameToString(L) in keys(M)


    rule <k> checkSingleAssignment(L:LabelStringConstant Ins:InstructionList
                                BB:BBTerminatorInstruction, K:K)
           => checkSingleAssignmentInBlock(addNameToString(L),Ins BB, .K, true)
                  ~> checkSingleAssignment(.K, K) ...</k>
        <currModule> ModName:SymbolicValueRef </currModule>
        <funModuleName> ModName </funModuleName>
        <currFunction> FunName:SymbolicValueRef </currFunction>
        <functionName> FunName </functionName>
         <concreteSyntax>... (.K
               => basicBlock(addNameToString(L), Ins BB)) </concreteSyntax>
         <localFunVarCounter> I:Int => I +Int 1 </localFunVarCounter>
         <varTypes> M:Map ( .Map => addNameToString(L) |-> label) </varTypes>
         requires isIntString(substrString(#tokenToString(L), 0
                                        , lengthString(#tokenToString(L)) -Int 1))
                  andBool  String2Int(substrString(#tokenToString(L),0
                                   ,lengthString(#tokenToString(L)) -Int 1)) ==Int I
                  andBool notBool addNameToString(L) in keys(M)

    rule <k> checkSingleAssignment(L:LabelStringConstant Ins:InstructionList
                                BB:BBTerminatorInstruction, K:K)
             ~> K:K => .K </k>
        <currModule> ModName:SymbolicValueRef </currModule>
        <funModuleName> ModName </funModuleName>
        <currFunction> FunName:SymbolicValueRef </currFunction>
        <functionName> FunName </functionName>
         <localFunVarCounter> I:Int </localFunVarCounter>
         <output>... .List => ListItem("error: variable expected to be numbered "
                                         +String Int2String(I)) </output>
         requires String2Int(substrString(#tokenToString(L),0
                        ,lengthString(#tokenToString(L)) -Int 1)) =/=Int I


    rule <k>checkSingleAssignment(Ins:InstructionList
                                BB:BBTerminatorInstruction BBL:BasicBlockList, K:K)
         => checkSingleAssignmentInBlock(name(localVar, Int2String(I)), Ins BB, .K, true)
           ~> checkSingleAssignment(BBL, K)
         ...</k>
        <currModule> ModName:SymbolicValueRef </currModule>
        <funModuleName> ModName </funModuleName>
        <currFunction> FunName:SymbolicValueRef </currFunction>
        <functionName> FunName </functionName>
         <concreteSyntax>... (.K
               => basicBlock(name(localVar, Int2String(I)), Ins BB)) </concreteSyntax>
         <varTypes> M:Map (.Map => name(localVar, Int2String(I))  |-> label) </varTypes>
        <localFunVarCounter> I:Int => I +Int 1 </localFunVarCounter>
        requires notBool name(localVar, Int2String(I)) in keys(M)

    rule <k>checkSingleAssignment(Ins:InstructionList
                                BB:BBTerminatorInstruction BBL:BasicBlockList, K:K)
             ~> K:K => .K </k>
        <currModule> ModName:SymbolicValueRef </currModule>
        <funModuleName> ModName </funModuleName>
        <currFunction> FunName:SymbolicValueRef </currFunction>
        <functionName> FunName </functionName>
         <varTypes>... name(localVar, Int2String(I)) |-> Ty:K ...</varTypes>
        <localFunVarCounter> I:Int => I +Int 1 </localFunVarCounter>
         <output>... .List => ListItem("multiple definition of local value named '"
                            +String Int2String(I) +String "'") </output>


    rule <k> checkSingleAssignment(Ins:InstructionList
                                BB:BBTerminatorInstruction, K:K)
         => checkSingleAssignmentInBlock(name(localVar, Int2String(I)), Ins BB, .K, true)
              ~> checkSingleAssignment(.K , K)
         ...</k>
        <currModule> ModName:SymbolicValueRef </currModule>
        <funModuleName> ModName </funModuleName>
        <currFunction> FunName:SymbolicValueRef </currFunction>
        <functionName> FunName </functionName>
         <concreteSyntax>... (.K
               => basicBlock(name(localVar, Int2String(I)), Ins BB)) </concreteSyntax>
         <varTypes> M:Map (.Map => name(localVar, Int2String(I)) |-> label) </varTypes>
        <localFunVarCounter> I:Int => I +Int 1 </localFunVarCounter>
        requires notBool name(localVar, Int2String(I)) in keys(M)

    rule <k> checkSingleAssignment(Ins:InstructionList
                                BB:BBTerminatorInstruction, K:K)
             ~> K:K => .K </k>
        <currModule> ModName:SymbolicValueRef </currModule>
        <funModuleName> ModName </funModuleName>
        <currFunction> FunName:SymbolicValueRef </currFunction>
        <functionName> FunName </functionName>
         <varTypes>... name(localVar, Int2String(I)) |-> Ty:K ...</varTypes>
        <localFunVarCounter> I:Int => I +Int 1 </localFunVarCounter>
         <output>... .List => ListItem("multiple definition of local value named '"
                            +String Int2String(I) +String "'") </output>


endmodule
