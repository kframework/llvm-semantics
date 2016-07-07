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

    syntax KItem ::= typeCheckOp(K, K, K) //block name, var name, op
                   | typeCheckIntOp(K, K, K, ElemList)    [strict(3)]
                   | typeCheckCastOp(K, K, K, K, K, K)    [strict(4, 6)]//block, variable, operator, T1, V, T2
                   | typeCheckIntArgs(K, K, ElemList)
                   | typeCheckIntArg(K, K, K)//block, t, var
                   | typeCheckIntArg(K, K, K, K)
                   | typeCheckInGepList(K, K, ElemList) //reference type, current type, index list
                   | typeCheckInGepListStruct(K, K, ElemList, K)//reference type, current type, index_list, structural_list
                   | typeCheckIntArg(K, K, K, K, K, K)    [strict(5)]
                   | typeCheckGepOp(K, K, K, K, K, ElemList)  [strict(3,4,6)]//block, var, t, t*, v, (t,v)lists
                   | typeCheckAllocaOp(K, K, K, K, K, K)  [strict(3,4)]//block,var, t, int-t, v, align
                   | typeCheckStore(K, K, K, K, K, K, K)  [strict(2,4)]//block, t, v, pt, v, align, atomic
                   | typeCheckLoad(K, K, K, K, K, K, K)  [strict(3,4)]//block, var, t, pt, v, align, atomic
                   | typeCheckIntArgList(K, ElemList)        [strict(2)]
                   | typeCheckGepArgList(K, ElemList)        [strict(2)]
                   | typeCheckArgList(K, ElemList)        [strict(2)]
                   | TypeMatchFunctions(K, ElemList, ElemList)  [strict(2,3)]
                   | typeCheckBr(K, K, K, K, K)    [strict(2)]//block, t, ...
                   | typeCheckCmp(K, K, K, K, K)    [strict(3)]//block, var, type, v1, v2
                   | typeCheckFCmp(K, K, K, K, K)    [strict(3)]//block, var, type, v1, v2
                   | typeCheckPhi(K, K, K, ElemList, ElemList, Set)  [strict(3)]//block, var, type, value-list, label-list
                   | typeCheckRet(K, K, K)           [strict(2)]//block, t, v
                   | typeCheckCall(K, K, K, K, ElemList, ElemList) [strict(3, 5)]//block, var, t, name, argt, argv.
                   | typeCheckSwitch(K, ElemList, ElemList)//block, argv, argl.
                   | typeCheckIndirectBr(K, K, K, ElemList)//block, argv, argl.
                   | typeCheckSelect(K, K, K, K, K, K, K, K)    [strict(3,5,7)]//block,name type, value, firstT, firstV, secondT, secondV

    syntax ElemList ::= getValueOfPhi(PHIList) [function]
                   | getLabelOfPhi(PHIList) [function]
                   | getAllTypes(K)   [function]
                   | getValueOfSwitch(JumpTable) [function]
    syntax KItem ::= getVar(K)    [function]
                   | getGepType(K, ElemList)         [function]
                   | getGepInType(K, ElemList, K)         [function]
                   | getGepTypeInStruct(K, K)           [function]
                   | gepTypeBag(K)
    syntax KItem ::= evalToInt(K) [function]
    syntax ElemList ::= evalToIntInList(ElemList)  [function]

    rule evalToInt(I:Int) => I
    rule evalToInt(vector(Es:ElemList)) => vector(evalToIntInList(Es))
    rule evalToInt(A:K) => A [owise]

    rule evalToIntInList(.ElemList) => .ElemList
    rule evalToIntInList(val(operand(T:K, B:K)),
             Es:ElemList) => valValue(evalToInt(B)), evalToIntInList(Es)

    rule getValueOfSwitch(.JumpTable) => .ElemList
    rule getValueOfSwitch(T:IntType V:ConstValueRef, La:LabelValue Ju:JumpTable)
           => val(typeOperand(T, V)),getValueOfSwitch(Ju)

    rule getAllTypes(.ParamList) => .ElemList
    rule getAllTypes(T:Type _:ParamAttrs _:ValueRef, Pl:ParamList)
                   => val(T), getAllTypes(Pl)
    rule getAllTypes(.ElemList) => .ElemList
    rule getAllTypes(val(arg(A:K, B:K, C:K)), Pl:ElemList)
                   => val(B), getAllTypes(Pl)

    rule getValueOfPhi([ V:ValueRef , L:ValueRef ]) => val(addNameToString(V)),.ElemList
    rule getValueOfPhi([ V:ValueRef , L:ValueRef ], Pl:PHIList)
                                         => val(addNameToString(V)),getValueOfPhi(Pl)
    rule getLabelOfPhi([ V:ValueRef , L:ValueRef ]) => val(addNameToString(L)),.ElemList
    rule getLabelOfPhi([ V:ValueRef , L:ValueRef ], Pl:PHIList)
                                         => val(addNameToString(L)),getLabelOfPhi(Pl)

    rule getVar(assign(A:K, B:K)) => A
    rule getVar(K:K) => .K [owise]

    rule getGepType(T:KResult, .ElemList) => T
    rule getGepType(gepTypeBag(T:KResult), .ElemList) => T
    rule getGepType(gepTypeBag(T:KResult), val(A:K),Es:ElemList) => getGepType(T, Es)
    rule getGepType(arrayTypeValue(T1:K, T2:K), val(A:K),Es:ElemList)
               => getGepType(T1, Es)
    rule getGepType(vectorTypeValue(T1:K, T2:K), val(A:K),Es:ElemList)
               => getGepType(T1, Es)
    rule getGepType(structTypeValue(T1:K), val(typeOperand(A:K, B:K)),Es:ElemList)
               => getGepInType(structTypeValue(T1:K), Es, evalToInt(B))
    rule getGepType(K:K, Es:ElemList) => K [owise]


    rule getGepInType(structTypeValue(T1:K), Es:ElemList, I:Int)
               => getGepType(getGepTypeInStruct(T1, I), Es)
    rule getGepInType(structTypeValue(T1:K), Es:ElemList,
               vector(valValue(I:Int), Es':ElemList))
               => getGepType(getGepTypeInStruct(T1, I), Es)
    rule getGepInType(structTypeValue(T1:K), Es:ElemList, A:K) => badType

    rule getGepTypeInStruct(T1:KResult, T2:TypeList, 0) => T1
    rule getGepTypeInStruct(T1:KResult, T2:TypeList, I:Int)
               => getGepTypeInStruct(T2, I -Int 1)
         requires I >Int 0
    rule getGepTypeInStruct(T:K, I:Int) => badType [owise]

    //maybe a bug for LLVM, LLVM actually allows that a variable to be used then assign
    //br might have the problem to jump to two basic blocks by a phi functions

    rule typeCheckOp(Name:SymbolicValueRef,X:SymbolicValueRef, IntOp:IntConstructors
                             Onw:OptNW Ty:Type V1:ValueRef,
                             V2:ValueRef Ins:InstructionMetadatas)
           => typeCheckIntOp(Name:SymbolicValueRef, X, Ty,
                           val(addNameToString(V1)), val(addNameToString(V2)))
    rule typeCheckOp(Name:SymbolicValueRef, X:SymbolicValueRef, L:LogicalOps Ty:Type V1:ValueRef,
                  V2:ValueRef Ins:InstructionMetadatas)
           => typeCheckIntOp(Name:SymbolicValueRef, X, Ty,
                           val(addNameToString(V1)), val(addNameToString(V2)))
    rule typeCheckOp(Name:SymbolicValueRef, X:SymbolicValueRef, trunc Ty1:Type V:ValueRef
                                            to Ty2:Type Ins:InstructionMetadatas)
           => typeCheckCastOp(Name:SymbolicValueRef, X, trunc,  Ty1, addNameToString(V), Ty2)
    rule typeCheckOp(Name:SymbolicValueRef, X:SymbolicValueRef, zext Ty1:Type V:ValueRef
                                            to Ty2:Type Ins:InstructionMetadatas)
           => typeCheckCastOp(Name:SymbolicValueRef, X, zext,  Ty1, addNameToString(V), Ty2)
    rule typeCheckOp(Name:SymbolicValueRef, X:SymbolicValueRef, sext Ty1:Type V:ValueRef
                                            to Ty2:Type Ins:InstructionMetadatas)
           => typeCheckCastOp(Name:SymbolicValueRef, X, sext,  Ty1, addNameToString(V), Ty2)

    rule typeCheckOp(Name:SymbolicValueRef, X:SymbolicValueRef,
                 getelementptr Oib:OptInBounds Ty:Type , Ty1:Type V1:ValueRef,
                                    Itr:ReturnedVal Ins:InstructionMetadatas)
           => typeCheckGepOp(Name:SymbolicValueRef, X, Ty, Ty1,
                                  addNameToString(V1), formTypeCheckList(Itr))

    rule <k> typeCheckOp(Name:SymbolicValueRef, X:SymbolicValueRef,
                 getelementptr Oib:OptInBounds Ty:Type ,
                    .ReturnedVal Ins:InstructionMetadatas)
                 ~> K:K => .K </k>
         <output>... .List => ListItem("error: no reference target pointer for getelementptr") </output>

    rule typeCheckOp(Name:SymbolicValueRef, X:SymbolicValueRef,
                         alloca Oil:OptInalloca Ty:Type Ins:InstructionMetadatas)
           => typeCheckAllocaOp(Name:SymbolicValueRef, X,Ty, undef, undef, 1)
    rule typeCheckOp(Name:SymbolicValueRef, X:SymbolicValueRef,
                            alloca Oil:OptInalloca
                                   Ty:Type, align A:UnsignedInt Ins:InstructionMetadatas)
           => typeCheckAllocaOp(Name:SymbolicValueRef,
                               X,Ty,undef,undef, String2Int(#tokenToString(A)))
    rule typeCheckOp(Name:SymbolicValueRef, X:SymbolicValueRef,
                        alloca Oil:OptInalloca Ty:Type,
                           It:IntType V:ValueRef Ins:InstructionMetadatas)
           => typeCheckAllocaOp(Name:SymbolicValueRef, X,Ty,It, addNameToString(V), 1)
    rule typeCheckOp(Name:SymbolicValueRef, X:SymbolicValueRef,
               alloca Oil:OptInalloca Ty:Type, It:IntType V:ValueRef,
                                   align A:UnsignedInt Ins:InstructionMetadatas)
           => typeCheckAllocaOp(Name:SymbolicValueRef, X, Ty, It,
                               addNameToString(V), String2Int(#tokenToString(A)))
    rule typeCheckOp(Name:SymbolicValueRef, K:K, store Ovl:OptVolatile
                  Ty1:Type V1:ValueRef, Ty2:Type V2:ValueRef, align I:UnsignedInt
                    Inm:InstructionMetadatas)
           => typeCheckStore(Name:SymbolicValueRef, Ty1:Type,
                addNameToString(V1), Ty2:Type, addNameToString(V2), String2Int(#tokenToString(I)), .K)
    rule typeCheckOp(Name:SymbolicValueRef, K:K, store Ovl:OptVolatile
                  Ty1:Type V1:ValueRef, Ty2:Type V2:ValueRef
                    Inm:InstructionMetadatas)
           => typeCheckStore(Name:SymbolicValueRef, Ty1:Type,
                      addNameToString(V1), Ty2:Type, addNameToString(V2), 1, .K)
    rule typeCheckOp(Name:SymbolicValueRef, K:K, store Oac:Atomic
                                                    Ovl:OptVolatile Ty1:Type V1:ValueRef,
                 Ty2:Type V2:ValueRef _:OptSingleThread _:Ordering,
                                          align I:UnsignedInt Ins:InstructionMetadatas)
           => typeCheckStore(Name:SymbolicValueRef, Ty1:Type,
                   addNameToString(V1), Ty2:Type, addNameToString(V2), String2Int(#tokenToString(I)), Oac)
    rule typeCheckOp(Name:SymbolicValueRef,
              X:SymbolicValueRef, load Ovl:OptVolatile
                  Ty1:Type, Ty2:Type V2:ValueRef, align I:UnsignedInt
                    Inm:InstructionMetadatas)
           => typeCheckLoad(Name:SymbolicValueRef, X, Ty1:Type,
                                Ty2:Type, addNameToString(V2), String2Int(#tokenToString(I)), .K)
    rule typeCheckOp(Name:SymbolicValueRef, X:SymbolicValueRef, load Ovl:OptVolatile
                  Ty1:Type, Ty2:Type V2:ValueRef
                    Inm:InstructionMetadatas)
           => typeCheckLoad(Name:SymbolicValueRef, X,
                                         Ty1:Type, Ty2:Type, addNameToString(V2), 1, .K)
    rule typeCheckOp(Name:SymbolicValueRef, X:SymbolicValueRef,
                                         load Oac:Atomic Ovl:OptVolatile Ty1:Type,
                 Ty2:Type V2:ValueRef _:OptSingleThread _:Ordering,
                                               align I:UnsignedInt Ins:InstructionMetadatas)
           => typeCheckLoad(Name:SymbolicValueRef, X, Ty1:Type,
                                       Ty2:Type, addNameToString(V2), String2Int(#tokenToString(I)), Oac)
    rule typeCheckOp(Name:SymbolicValueRef, K:K, br label La:ValueRef Meta:InstructionMetadatas)
           => typeCheckBr(Name:SymbolicValueRef, undef, undef, addNameToString(La), undef)
    rule typeCheckOp(Name:SymbolicValueRef, K:K, br It:IntType Va:ValueRef ,
                   label La1:ValueRef , label La2:ValueRef
                                  Meta:InstructionMetadatas)
           => typeCheckBr(Name:SymbolicValueRef, It, Va, addNameToString(La1), addNameToString(La2))
    rule typeCheckOp(Name:SymbolicValueRef, X:SymbolicValueRef, icmp Op:IPredicate
                   Ty:Type V1:ValueRef , V2:ValueRef Ins:InstructionMetadatas)
         => typeCheckCmp(Name:SymbolicValueRef, X, Ty,
                   addNameToString(V1), addNameToString(V2))
    rule typeCheckOp(Name:SymbolicValueRef, X:SymbolicValueRef, fcmp Op:FPredicate
                   Ty:Type V1:ValueRef , V2:ValueRef Ins:InstructionMetadatas)
         => typeCheckFCmp(Name:SymbolicValueRef, X, Ty,
                  addNameToString(V1), addNameToString(V2))
    rule typeCheckOp(Name:SymbolicValueRef, X:SymbolicValueRef,
                                     phi Ty:Type Pl:PHIList Ins:InstructionMetadatas)
         => typeCheckPhi(Name:SymbolicValueRef, X, Ty, getValueOfPhi(Pl), getLabelOfPhi(Pl), .Set)
    rule typeCheckOp(Name:SymbolicValueRef, K:K,
                                     ret T:NonVoidType V:ValueRef I:InstructionMetadatas)
         => typeCheckRet(Name:SymbolicValueRef, T, addNameToString(V))
    rule typeCheckOp(Name:SymbolicValueRef, K:K,
                                     Ca:OptTailCall
                        Ocv:OptCallingConv Rat:RetAttrs Ty1:Type
                     V1:ValueRef (Pl:ParamList) Fat:FuncAttrs
                       Meta:InstructionMetadatas)
         => typeCheckCall(Name:SymbolicValueRef, K, Ty1,
                    addNameToString(V1), getAllTypes(Pl), formTypeCheckList(Pl))
    rule typeCheckOp(Name:SymbolicValueRef, K:K,
                                       switch It:IntType Va:ValueRef ,
                                       label La:ValueRef [ Ju:JumpTable ]
                                  Meta:InstructionMetadatas)
         => typeCheckSwitch(Name:SymbolicValueRef, (val(typeOperand(It,
                            addNameToString(Va))),getValueOfSwitch(Ju)),
                                (val(addNameToString(La)),getOutEdges(Ju)))

    rule typeCheckOp(Name:SymbolicValueRef, X:SymbolicValueRef,
                                       select Ty1:Type V1:ValueRef,
                                  Ty2:Type V2:ValueRef, Ty3:Type V3:ValueRef
                                  Meta:InstructionMetadatas)
         => typeCheckSelect(Name:SymbolicValueRef, X, Ty1,
                  addNameToString(V1), Ty2, addNameToString(V2), Ty3, addNameToString(V3))

    rule typeCheckOp(Name:SymbolicValueRef, K:K,
                                       indirectbr Ty:Type Va:ValueRef ,
                                       [ Las:LabelValues ]
                                  Meta:InstructionMetadatas)
         => typeCheckIndirectBr(Name:SymbolicValueRef, Ty, addNameToString(Va),
                                getOutEdges(Las))


    //deal with indirectBr
    rule typeCheckIndirectBr(Name:SymbolicValueRef, T:K, V:K, .ElemList)
          => typeCheckIntArg(Name, T, V)
    rule <k>typeCheckIndirectBr(Name:SymbolicValueRef, T:K, V:K,
                  val(A:SymbolicValueRef), E2:ElemList)
                     => typeCheckIndirectBr(Name:SymbolicValueRef,
                   T:K, V:K, E2:ElemList) ...</k>
         <currModule> ModName:SymbolicValueRef </currModule>
         <funModuleName> ModName </funModuleName>
         <currFunction> FunName:SymbolicValueRef </currFunction>
         <functionName> FunName </functionName>
         <varTypes>... A |-> label ...</varTypes>

    rule <k> typeCheckIndirectBr(Name:SymbolicValueRef, T:K, V:K,
                  val(A:SymbolicValueRef), E2:ElemList)
                     => typeCheckIndirectBr(Name:SymbolicValueRef,
                   T:K, V:K, E2:ElemList) ...</k>
         <currModule> ModName:SymbolicValueRef </currModule>
         <funModuleName> ModName </funModuleName>
         <currFunction> FunName:SymbolicValueRef </currFunction>
         <functionName> FunName </functionName>
         <varTypes> M:Map </varTypes>
         <basicBlocks>... Name
             |-> blockContent(_:K, _:Set, _:Set, _:Set, _:Set,
                     Use:Set (.Set => SetItem(operand(label, A)))) ...</basicBlocks>
         requires notBool A in keys(M)

    rule <k> typeCheckIndirectBr(Name:SymbolicValueRef, Ty:K, Va:K,
                  val(name(localVar, S:String)), E2:ElemList)
                 ~> K:K => .K </k>
         <output>... .List => ListItem("error: '%"
                   +String S +String "' is not a basic block") </output>
         <currModule> ModName:SymbolicValueRef </currModule>
         <funModuleName> ModName </funModuleName>
         <currFunction> FunName:SymbolicValueRef </currFunction>
         <functionName> FunName </functionName>
         <varTypes>... name(localVar, S:String) |-> T:K ...</varTypes>
         requires T =/=K label

    //deal with Select
    rule typeCheckSelect(N:SymbolicValueRef, X:SymbolicValueRef,
                    integerType(1), V1:K, T1:KResult, V2:K, T1:KResult, V3:K)
            => typeCheckIntArg(N, integerType(1), V1:K)
               ~> typeCheckIntArg(N, T1, V2)
               ~> typeCheckIntArg(N, T1, V3)
               ~> assignType(N, X, integerType(1))
     rule typeCheckSelect(Name:SymbolicValueRef, X:SymbolicValueRef,
                  vectorTypeValue(integerType(1), N:Int), V1:K,
                 vectorTypeValue(T1:KResult, N:Int), V2:K, vectorTypeValue(T1:KResult, N:Int), V3:K)
            => typeCheckIntArg(Name, vectorTypeValue(integerType(1), N:Int), V1:K)
               ~> typeCheckIntArg(Name, vectorTypeValue(T1:KResult, N:Int), V2)
               ~> typeCheckIntArg(Name, vectorTypeValue(T1:KResult, N:Int), V3)
               ~> assignType(Name, X, vectorTypeValue(integerType(1), N:Int))
    rule <k> typeCheckSelect(Name:SymbolicValueRef, X:SymbolicValueRef,
                   integerType(A:Int), V1:K, T1:KResult, V2:K, T1:KResult, V3:K)
                 ~> K:K => .K </k>
         <output>... .List => ListItem("error: select condition must be i1 or <n x i1>") </output>
         requires A =/=K 1
    rule <k> typeCheckSelect(Name:SymbolicValueRef, X:SymbolicValueRef,
                           vectorTypeValue(integerType(A:Int), N:Int)
                   , V1:K, T1:KResult, V2:K, T1:KResult, V3:K)
                 ~> K:K => .K </k>
         <output>... .List => ListItem("error: vector select condition element type must be i1") </output>
         requires A =/=K 1
    rule <k> typeCheckSelect(Name:SymbolicValueRef, X:SymbolicValueRef,
                T:KResult, V1:K, T1:KResult, V2:K, T2:KResult, V3:K)
                 ~> K:K => .K </k>
         <output>... .List => ListItem("error: both values to select must have same type") </output>
         requires T1 =/=K T2
    rule <k> typeCheckSelect(Name:SymbolicValueRef, X:SymbolicValueRef,
                  vectorTypeValue(integerType(1), N1:Int), V1:K,
                 vectorTypeValue(T1:KResult, N:Int), V2:K, vectorTypeValue(T1:KResult, N:Int), V3:K)
                 ~> K:K => .K </k>
         <output>... .List => ListItem("error: vector select requires selected vectors to have the same vector length as select condition") </output>
         requires N1 =/=K N
    rule <k> typeCheckSelect(Name:SymbolicValueRef, X:SymbolicValueRef,
                 T:KResult, V1:K, T1:KResult, V2:K, T1:KResult, V3:K)
                 ~> K:K => .K </k>
         <output>... .List => ListItem("error: select condition must be i1 or <n x i1>") </output>
         requires getKLabel(T) =/=KLabel 'integerType andBool getKLabel(T) =/=KLabel 'vectorTypeValue



    //deal with switchs
    rule typeCheckSwitch(N:SymbolicValueRef, E1:ElemList, .ElemList)
          => typeCheckIntArgList(N, E1)
    rule <k> typeCheckSwitch(Name:SymbolicValueRef,
                   E1:ElemList, val(A:SymbolicValueRef), E2:ElemList)
                     => typeCheckSwitch(Name:SymbolicValueRef,
                   E1:ElemList, E2:ElemList) ...</k>
         <currModule> ModName:SymbolicValueRef </currModule>
         <funModuleName> ModName </funModuleName>
         <currFunction> FunName:SymbolicValueRef </currFunction>
         <functionName> FunName </functionName>
         <varTypes>... A |-> label ...</varTypes>

    rule <k> typeCheckSwitch(Name:SymbolicValueRef,
                   E1:ElemList, val(A:SymbolicValueRef), E2:ElemList)
                     => typeCheckSwitch(Name:SymbolicValueRef,
                   E1:ElemList, E2:ElemList) ...</k>
         <currModule> ModName:SymbolicValueRef </currModule>
         <funModuleName> ModName </funModuleName>
         <currFunction> FunName:SymbolicValueRef </currFunction>
         <functionName> FunName </functionName>
         <varTypes> M:Map </varTypes>
         <basicBlocks>... Name
             |-> blockContent(_:K, _:Set, _:Set, _:Set, _:Set,
                     Use:Set (.Set => SetItem(operand(label, A)))) ...</basicBlocks>
         requires notBool A in keys(M)

    rule <k> typeCheckSwitch(Name:SymbolicValueRef,
                   E1:ElemList, val(name(localVar, S:String)), E2:ElemList)
                 ~> K:K => .K </k>
         <output>... .List => ListItem("error: '%"
                   +String S +String "' is not a basic block") </output>
         <currModule> ModName:SymbolicValueRef </currModule>
         <funModuleName> ModName </funModuleName>
         <currFunction> FunName:SymbolicValueRef </currFunction>
         <functionName> FunName </functionName>
         <varTypes>... name(localVar, S:String) |-> T:K ...</varTypes>
         requires T =/=K label



    rule TypeMatchFunctions(A:K, .ElemList, .ElemList) => .K
    rule TypeMatchFunctions(A:K, valValue(T:KResult), E:ElemList, valValue(T:KResult), E':ElemList)
             => TypeMatchFunctions(A, E, E')
    rule <k> TypeMatchFunctions(name(globalVar, S:String),
                               valValue(T:KResult), E:ElemList, valValue(T':KResult), E':ElemList)
          ~> K:K => .K </k>
         <output>... .List => ListItem("error: invalid forward reference to function '@"
                                   +String S +String"' with wrong type!") </output>
    rule <k> TypeMatchFunctions(name(globalVar, S:String),
                     valValue(T:KResult), E:ElemList, .ElemList) ~> K:K => .K </k>
         <output>... .List => ListItem("error: invalid forward reference to function '@"
                                   +String S +String"' with wrong type!") </output>
    rule <k> TypeMatchFunctions(name(globalVar, S:String),
              .ElemList, valValue(T':KResult), E':ElemList) ~> K:K => .K </k>
         <output>... .List => ListItem("error: invalid forward reference to function '@"
                                   +String S +String"' with wrong type!") </output>

    //deal with calls
    rule <k> typeCheckCall(Name:SymbolicValueRef, .K, void, V1:SymbolicValueRef, Ts:ElemList, Tv:ElemList)
        => TypeMatchFunctions(V1, Ts, getAllTypes(Ts')) ~> typeCheckArgList(Name, Tv) ...</k>
        <currModule> ModName:SymbolicValueRef </currModule>
        <funModuleName> ModName </funModuleName>
        <formalParameters> arguments(Ts':ElemList) </formalParameters>
        <functionName> V1 </functionName>

    rule <k> typeCheckCall(Name:SymbolicValueRef,
                   A:SymbolicValueRef, T:KResult, V1:SymbolicValueRef, Ts:ElemList, Tv:ElemList)
        => TypeMatchFunctions(V1, Ts, getAllTypes(Ts')) ~> typeCheckArgList(Name, Tv)
           ~> assignType(Name, A, T) ...</k>
        <currModule> ModName:SymbolicValueRef </currModule>
        <funModuleName> ModName </funModuleName>
        <formalParameters> arguments(Ts':ElemList) </formalParameters>
        <functionName> V1 </functionName>

    //deal with ret
    rule typeCheckRet(N:SymbolicValueRef, T:KResult, V:K) => typeCheckIntArg(N, T, V)

    //deal with phi of type check
    //there is a big bug in the implementaton of phi function
    //TODO: from LLVM documentation, it is legal to associate two label values together.
    //so we can branch to a label value with two different blocks. 
    //hence, this is a undefined behavior for what it will goto in this case.
    //clang doesnt this behavior
    rule (.K => typeCheckIntArg(Name, T, V))
            ~> typeCheckPhi(Name:SymbolicValueRef, X:SymbolicValueRef, T:KResult,
                  (val(V:ConstValueRef), E1:ElemList => E1), _:ElemList, _:Set)

    rule <k> typeCheckPhi(Name:SymbolicValueRef, X:SymbolicValueRef, T:KResult,
                  (val(name(localVar, S:String)), E1:ElemList => E1), _:ElemList, _:Set) ...</k>
         <currModule> ModName:SymbolicValueRef </currModule>
         <funModuleName> ModName </funModuleName>
         <currFunction> FunName:SymbolicValueRef </currFunction>
         <functionName> FunName </functionName>
         <varTypes>... name(localVar, S:String) |-> T ...</varTypes>
         <basicBlocks>... Name
             |-> blockContent(_:K, _:Set, _:Set, Def:Set, _:Set, _:Set) ...</basicBlocks>
         requires operand(T, name(localVar, S:String)) in Def

    rule <k> typeCheckPhi(Name:SymbolicValueRef, X:SymbolicValueRef, T:KResult,
                  (val(name(localVar, S:String)), E1:ElemList => E1), _:ElemList, _:Set) ...</k>
         <currModule> ModName:SymbolicValueRef </currModule>
         <funModuleName> ModName </funModuleName>
         <currFunction> FunName:SymbolicValueRef </currFunction>
         <functionName> FunName </functionName>
         <varTypes> M:Map </varTypes>
         <basicBlocks>... Name
             |-> blockContent(_:K, _:Set, _:Set, Def:Set,
                  UsePhi:Set (.Set => SetItem(operand(T, name(localVar, S:String)))), _:Set) ...</basicBlocks>
         requires notBool operand(T, name(localVar, S:String)) in Def

    rule <k> typeCheckPhi(Name:SymbolicValueRef, X:SymbolicValueRef,
             T:KResult, val(name(localVar, S:String)), E1:ElemList, E2:ElemList, _:Set)
             ~> K:K => .K </k>
         <currModule> ModName:SymbolicValueRef </currModule>
         <funModuleName> ModName </funModuleName>
         <currFunction> FunName:SymbolicValueRef </currFunction>
         <functionName> FunName </functionName>
         <output>... .List => ListItem("error: constant expression type mismatch") </output>
         <varTypes>... name(localVar, S:String) |-> T' ...</varTypes>
         requires T' =/=K T

    rule <k> typeCheckPhi(Name:SymbolicValueRef, X:SymbolicValueRef,
             T:KResult, .ElemList, .ElemList, InSet:Set) => assignType(Name, X, T) ...</k>
         <matchPhisWithInEdges>... (.List => ListItem(phiEdges(Name, InSet))) </matchPhisWithInEdges>

    rule <k> typeCheckPhi(Name:SymbolicValueRef, X:SymbolicValueRef,
              T:KResult, E1:ElemList, val(name(localVar, S:String)), L:ElemList, InSet:Set)
                => typeCheckPhi(Name, X, T, E1, L, SetItem(name(localVar, S:String)) InSet:Set) ...</k>
         <currModule> ModName:SymbolicValueRef </currModule>
         <funModuleName> ModName </funModuleName>
         <currFunction> FunName:SymbolicValueRef </currFunction>
         <functionName> FunName </functionName>
         <varTypes> M:Map </varTypes>
         <basicBlocks>... Name
             |-> blockContent(_:K, _:Set, _:Set, _:Set, _:Set,
                     Use:Set (.Set
                  => SetItem(operand(label, name(localVar, S:String))))) ...</basicBlocks>
         requires notBool name(localVar, S:String) in keys(M)
                  andBool notBool name(localVar, S:String) in InSet

    rule <k> typeCheckPhi(Name:SymbolicValueRef, X:SymbolicValueRef,
              T:KResult, E1:ElemList, val(Y:SymbolicValueRef), L:ElemList, InSet:Set)
                => typeCheckPhi(Name, X, T, E1, L, SetItem(Y) InSet:Set) ...</k>
         <currModule> ModName:SymbolicValueRef </currModule>
         <funModuleName> ModName </funModuleName>
         <currFunction> FunName:SymbolicValueRef </currFunction>
         <functionName> FunName </functionName>
         <varTypes>... Y |-> label ...</varTypes>
         requires notBool Y in InSet

    rule <k> typeCheckPhi(Name:SymbolicValueRef, name(localVar, S:String),
              T:KResult, E1:ElemList, val(Y:SymbolicValueRef), L:ElemList, InSet:Set) ~> K:K
                => .K </k>
         <output>... .List 
                => ListItem("error: not a well form program because defining a edge twice in a phi function '%"
                      +String S +String "'") </output>
         requires Y in InSet

    rule <k> typeCheckPhi(Name:SymbolicValueRef, X:SymbolicValueRef, T:KResult, E1:ElemList
               , val(name(localVar, S:String)), L:ElemList, InSet:Set) ~> K:K
                => .K </k>
         <output>... .List => ListItem("error: '%"
                   +String S +String "' is not a basic block") </output>
         <currModule> ModName:SymbolicValueRef </currModule>
         <funModuleName> ModName </funModuleName>
         <currFunction> FunName:SymbolicValueRef </currFunction>
         <functionName> FunName </functionName>
         <varTypes>... name(localVar, S:String) |-> T' ...</varTypes>
         requires T' =/=K label

    rule <k> typeCheckPhi(Name:SymbolicValueRef, X:SymbolicValueRef,
             T:KResult, E1:ElemList, val(name(A:K, S:String)), L:ElemList, InSet:Set) ~> K:K
                => .K </k>
         <output>... .List => ListItem("error: use of undefined value '%"
                               +String S +String "'") </output>
         requires A =/=K localVar

    rule <k> typeCheckPhi(Name:SymbolicValueRef,
               X:SymbolicValueRef, T:KResult, E1:ElemList
               , val(K:K), L:ElemList, InSet:Set) ~> K':K => .K </k>
         <output>... .List => ListItem("error: '" +String #tokenToString(K)
                               +String "' is not a basic block") </output>
         requires getKLabel(K) =/=KLabel 'name

    //deal with fcmp
    rule typeCheckFCmp(Name:SymbolicValueRef,
              X:SymbolicValueRef, T:KResult, V1:K, V2:K)
               => typeCheckIntArg(Name, T, V1) ~> typeCheckIntArg(Name, T, V2)
                   ~> assignType(Name, X, integerType(1))
         requires (T ==K float orBool T ==K double
                  orBool T ==K ppc_fp128 orBool T ==K half
                  orBool T ==K fp128 orBool T ==K x86_fp80)

    rule typeCheckFCmp(Name:SymbolicValueRef, X:SymbolicValueRef,
                     vectorTypeValue(T:KResult, I:Int), V1:K, V2:K)
               => typeCheckIntArg(Name:SymbolicValueRef,
                              vectorTypeValue(T:KResult, I:Int), V1)
                     ~> typeCheckIntArg(Name:SymbolicValueRef,
                            vectorTypeValue(T:KResult, I:Int), V2)
                     ~> assignType(Name, X, vectorTypeValue(integerType(1), I:Int))
         requires (T ==K float orBool T ==K double
                  orBool T ==K ppc_fp128 orBool T ==K half
                  orBool T ==K fp128 orBool T ==K x86_fp80)

    rule <k> typeCheckFCmp(Name:SymbolicValueRef, X:K,
                 T:KResult, V1:K, V2:K) ~> K:K => .K </k>
         <output>... .List => ListItem("error: fcmp requires floating point operands") </output>
         requires T =/=K float andBool T =/=K double
                  andBool T =/=K ppc_fp128 andBool T =/=K half
                  andBool T =/=K fp128 andBool T =/=K x86_fp80

    rule <k> typeCheckFCmp(Name:SymbolicValueRef, X:K,
                 vectorTypeValue(T:K, I:Int), V1:K, V2:K) ~> K:K => .K </k>
         <output>... .List => ListItem("error: fcmp requires floating point operands") </output>
         requires T =/=K float andBool T =/=K double
                  andBool T =/=K ppc_fp128 andBool T =/=K half
                  andBool T =/=K fp128 andBool T =/=K x86_fp80


    //deal with icmp
    rule typeCheckCmp(Name:SymbolicValueRef, X:SymbolicValueRef,
               T:KResult, V1:K, V2:K)
               => typeCheckIntArg(Name, T, V1) ~> typeCheckIntArg(Name, T, V2)
                  ~> assignType(Name, X, integerType(1))
         requires (getKLabel(T) ==KLabel 'integerType
               orBool getKLabel(T) ==KLabel 'pointerTypeValue)
         
    rule typeCheckCmp(Name:SymbolicValueRef, X:SymbolicValueRef,
                     vectorTypeValue(integerType(N:Int), I:Int), V1:K, V2:K)
               => typeCheckIntArg(Name:SymbolicValueRef,
                                  vectorTypeValue(integerType(N:Int), I:Int), V1)
                     ~> typeCheckIntArg(Name:SymbolicValueRef,
                                    vectorTypeValue(integerType(N:Int), I:Int), V2)
                     ~> assignType(Name, X, vectorTypeValue(integerType(1), I:Int))

    rule <k> typeCheckCmp(Name:SymbolicValueRef, X,
              T:KResult, V1:K, V2:K) ~> K:K  => .K </k>
         <output>... .List => ListItem("error: icmp requires integer operands") </output>
         requires getKLabel(T) =/=KLabel 'integerType
               andBool getKLabel(T) =/=KLabel 'pointerTypeValue
               andBool getKLabel(T) =/=KLabel 'vectorTypeValue

    rule <k> typeCheckCmp(Name:SymbolicValueRef, X,
             vectorTypeValue(T:K, I:Int), V1:K, V2:K) ~> K:K => .K </k>
         <output>... .List => ListItem("error: icmp requires integer operands") </output>
         requires getKLabel(T) =/=KLabel 'integerType

    //deal with brs
    rule <k> typeCheckBr(Name:SymbolicValueRef, undef,
                   _:K, A:SymbolicValueRef, _:K) => .K ...</k>
         <currModule> ModName:SymbolicValueRef </currModule>
         <funModuleName> ModName </funModuleName>
         <currFunction> FunName:SymbolicValueRef </currFunction>
         <functionName> FunName </functionName>
         <varTypes>... A |-> label ...</varTypes>

    rule <k> typeCheckBr(Name:SymbolicValueRef, undef,
                    _:K, A:SymbolicValueRef, _:K) => .K ...</k>
         <currModule> ModName:SymbolicValueRef </currModule>
         <funModuleName> ModName </funModuleName>
         <currFunction> FunName:SymbolicValueRef </currFunction>
         <functionName> FunName </functionName>
         <varTypes> M:Map </varTypes>
         <basicBlocks>... Name
             |-> blockContent(_:K, _:Set, _:Set, _:Set, _:Set,
                     Use:Set (.Set => SetItem(operand(label, A)))) ...</basicBlocks>
         requires notBool A in keys(M)

    rule <k> typeCheckBr(Name:SymbolicValueRef, undef,
                  _:K, name(localVar, S:String), _:K) ~> K:K => .K </k>
         <output>... .List => ListItem("error: '%"
                   +String S +String "' is not a basic block") </output>
         <currModule> ModName:SymbolicValueRef </currModule>
         <funModuleName> ModName </funModuleName>
         <currFunction> FunName:SymbolicValueRef </currFunction>
         <functionName> FunName </functionName>
         <varTypes>... name(localVar, S:String) |-> T:K ...</varTypes>
         requires T =/=K label

    rule <k> typeCheckBr(Name:SymbolicValueRef,
             integerType(1), A:K, L1:SymbolicValueRef, L2:SymbolicValueRef)
                 => typeCheckIntArg(Name, integerType(1), A) ...</k>
         <currModule> ModName:SymbolicValueRef </currModule>
         <funModuleName> ModName </funModuleName>
         <currFunction> FunName:SymbolicValueRef </currFunction>
         <functionName> FunName </functionName>
         <varTypes> M:Map </varTypes>
         <basicBlocks>... Name
             |-> blockContent(_:K, _:Set, _:Set, _:Set, _:Set,
                     Use:Set (.Set => SetItem(operand(label, L1))
                              SetItem(operand(label, L2)))) ...</basicBlocks>
         requires (notBool L1 in keys(M)) andBool (notBool L2 in keys(M))

    rule <k> typeCheckBr(Name:SymbolicValueRef,
             integerType(1), A:K, L1:SymbolicValueRef, L2:SymbolicValueRef)
                 => typeCheckIntArg(Name, integerType(1), A) ...</k>
         <currModule> ModName:SymbolicValueRef </currModule>
         <funModuleName> ModName </funModuleName>
         <currFunction> FunName:SymbolicValueRef </currFunction>
         <functionName> FunName </functionName>
         <varTypes> M:Map </varTypes>
         <basicBlocks>... Name
             |-> blockContent(_:K, _:Set, _:Set, _:Set, _:Set,
                     Use:Set (.Set => SetItem(operand(label, L1)))) ...</basicBlocks>
         requires L2 in keys(M) andBool (notBool L1 in keys(M))
                  andBool M[L2] ==K label

    rule <k> typeCheckBr(Name:SymbolicValueRef,
             integerType(1), A:K, L1:SymbolicValueRef, L2:SymbolicValueRef)
                 => typeCheckIntArg(Name, integerType(1), A) ...</k>
         <currModule> ModName:SymbolicValueRef </currModule>
         <funModuleName> ModName </funModuleName>
         <currFunction> FunName:SymbolicValueRef </currFunction>
         <functionName> FunName </functionName>
         <varTypes> M:Map </varTypes>
         <basicBlocks>... Name
             |-> blockContent(_:K, _:Set, _:Set, _:Set, _:Set,
                     Use:Set (.Set => SetItem(operand(label, L2)))) ...</basicBlocks>
         requires L1 in keys(M) andBool (notBool L2 in keys(M))
                  andBool M[L1] ==K label

    rule <k> typeCheckBr(Name:SymbolicValueRef,
             integerType(1), A:K, L1:SymbolicValueRef, L2:SymbolicValueRef)
                 => typeCheckIntArg(Name, integerType(1), A) ...</k>
         <currModule> ModName:SymbolicValueRef </currModule>
         <funModuleName> ModName </funModuleName>
         <currFunction> FunName:SymbolicValueRef </currFunction>
         <functionName> FunName </functionName>
         <varTypes> M:Map </varTypes>
         requires L1 in keys(M) andBool L2 in keys(M)
                  andBool M[L1] ==K label andBool M[L2] ==K label

    rule <k> typeCheckBr(Name:SymbolicValueRef,
            integerType(N:Int), A:K, L1:K, L2:K) ~> K:K => .K </k>
         <output>... .List => ListItem("error: branch condition must have 'i1' type") </output>
         requires N =/=Int 1

    rule <k> typeCheckBr(Name:SymbolicValueRef, integerType(1),
             A:K, name(localVar, S:String), _:K) ~> K:K => .K </k>
         <output>... .List => ListItem("error: '%"
                   +String S +String "' is not a basic block") </output>
         <currModule> ModName:SymbolicValueRef </currModule>
         <funModuleName> ModName </funModuleName>
         <currFunction> FunName:SymbolicValueRef </currFunction>
         <functionName> FunName </functionName>
          <varTypes>... name(localVar, S:String) |-> T:K ...</varTypes>
         requires T =/=K label

    rule <k> typeCheckBr(Name:SymbolicValueRef,
                    integerType(1), A:K, _:K, name(localVar, S:String)) ~> K:K
                 => .K </k>
         <output>... .List => ListItem("error: '%"
                   +String S +String "' is not a basic block") </output>
         <currModule> ModName:SymbolicValueRef </currModule>
         <funModuleName> ModName </funModuleName>
         <currFunction> FunName:SymbolicValueRef </currFunction>
         <functionName> FunName </functionName>
          <varTypes>... name(localVar, S:String) |-> T:K ...</varTypes>
         requires T =/=K label

    //deal with type of load
    rule typeCheckLoad(Name:SymbolicValueRef, X:SymbolicValueRef, T:KResult,
                     pointerTypeValue(T:KResult, A:K), V2:K, Align:Int, At:K)
              => typeCheckIntArg(Name, pointerTypeValue(T:KResult, A:K), V2)
                 ~> assignType(Name, X, T)
         requires isPowOfTwo(Align, 1) andBool At =/=K atomic

    rule typeCheckLoad(Name:SymbolicValueRef, X:SymbolicValueRef, integerType(N:Int),
                     pointerTypeValue(integerType(N:Int), A:K), V2:K, Align:Int, atomic)
              => typeCheckIntArg(Name,pointerTypeValue(integerType(N:Int), A:K), V2)
                 ~> assignType(Name, X, integerType(N:Int))
         requires isPowOfTwo(Align, 1) andBool N >=Int 8

    rule <k> typeCheckLoad(Name:SymbolicValueRef, X:K, T:KResult,
                     pointerTypeValue(T:KResult, A:K), V2:K, Align:Int, atomic) ~> K:K => .K </k>
         <output>... .List => ListItem("error: atomic store must have integer type that greater than 8 bits.") </output>
         requires getKLabel(T) =/=KLabel 'integerType

    rule <k> typeCheckLoad(Name:SymbolicValueRef, X:K, integerType(N:Int),
                     pointerTypeValue(integerType(N:Int), A:K), V2:K, Align:Int, atomic) ~> K:K => .K </k>
         <output>... .List => ListItem("error: atomic store must have integer type that greater than 8 bits.") </output>
         requires N <Int 8

    rule <k> typeCheckLoad(Name:SymbolicValueRef, X:K, T:KResult,
                     pointerTypeValue(T':KResult, A:K), V2:K, Align:Int, At:K) ~> K:K => .K </k>
         <output>... .List => ListItem("error: stored value and pointer type do not match") </output>
         requires T =/=K T'

    rule <k> typeCheckLoad(Name:SymbolicValueRef, X:K, T:KResult,
                     T':KResult, V2:K, Align:Int, At:K) ~> K:K => .K </k>
         <output>... .List => ListItem("error: store operand must be a pointer") </output>
         requires getKLabel(T') =/=KLabel 'pointerTypeValue

    rule <k> typeCheckLoad(Name:SymbolicValueRef, X:K, T:KResult, T':KResult, V:K, Align:Int, At:K)
             ~> K:K => .K </k>
         <output>... .List => ListItem("error: alignment is not a power of two") </output>
         requires notBool isPowOfTwo(Align, 1)


    //deal with type of store
    rule typeCheckStore(Name:SymbolicValueRef, T:KResult, V1:K,
                     pointerTypeValue(T:KResult, A:K), V2:K, Align:Int, At:K)
              => typeCheckIntArg(Name:SymbolicValueRef, T, V1)
                 ~> typeCheckIntArg(Name:SymbolicValueRef, pointerTypeValue(T:KResult, A:K), V2)
         requires isPowOfTwo(Align, 1) andBool At =/=K atomic

    rule typeCheckStore(Name:SymbolicValueRef, integerType(N:Int), V1:K,
                     pointerTypeValue(integerType(N:Int), A:K), V2:K, Align:Int, atomic)
              => typeCheckIntArg(Name:SymbolicValueRef, integerType(N:Int), V1)
                    ~> typeCheckIntArg(Name:SymbolicValueRef, pointerTypeValue(integerType(N:Int), A:K), V2)
         requires isPowOfTwo(Align, 1) andBool N >=Int 8

    rule <k> typeCheckStore(Name:SymbolicValueRef, T:KResult, V1:K,
                     pointerTypeValue(T:KResult, A:K), V2:K, Align:Int, atomic) ~> K:K => .K </k>
         <output>... .List => ListItem("error: atomic store must have integer type that greater than 8 bits.") </output>
         requires getKLabel(T) =/=KLabel 'integerType

    rule <k> typeCheckStore(Name:SymbolicValueRef, integerType(N:Int), V1:K,
                     pointerTypeValue(integerType(N:Int), A:K), V2:K, Align:Int, atomic) ~> K:K => .K </k>
         <output>... .List => ListItem("error: atomic store must have integer type that greater than 8 bits.") </output>
         requires N <Int 8

    rule <k> typeCheckStore(Name:SymbolicValueRef, T:KResult, V1:K,
                     pointerTypeValue(T':KResult, A:K), V2:K, Align:Int, At:K) ~> K:K => .K </k>
         <output>... .List => ListItem("error: stored value and pointer type do not match") </output>
         requires T =/=K T'

    rule <k> typeCheckStore(Name:SymbolicValueRef, T:KResult, V1:K,
                     T':KResult, V2:K, Align:Int, At:K) ~> K:K => .K </k>
         <output>... .List => ListItem("error: store operand must be a pointer") </output>
         requires getKLabel(T') =/=KLabel 'pointerTypeValue

    rule <k> typeCheckStore(Name:SymbolicValueRef, X:SymbolicValueRef, T:KResult, T':KResult, V:K,
             Align:Int, At:K) ~> K:K => .K </k>
         <output>... .List => ListItem("error: alignment is not a power of two") </output>
         requires notBool isPowOfTwo(Align, 1)


    //deal with type of alloca
    rule typeCheckAllocaOp(Name:SymbolicValueRef, X:SymbolicValueRef,
                 T:KResult, integerType(I:Int), V:K, Align:Int)
              => typeCheckIntArg(Name:SymbolicValueRef, integerType(I:Int), V)
                     ~> assignType(Name, X, pointerTypeValue(T, 'addrEmpty(.KList)))
         requires isPowOfTwo(Align, 1)

    rule typeCheckAllocaOp(Name:SymbolicValueRef, X:SymbolicValueRef,
                 T:KResult, undef, V:K, Align:Int)
              => assignType(Name, X, pointerTypeValue(T, 'addrEmpty(.KList)))
         requires isPowOfTwo(Align, 1)

    rule <k> typeCheckAllocaOp(Name:SymbolicValueRef, X:SymbolicValueRef,
                T:KResult, T':KResult, V:K, Align:Int) ~> K:K => .K </k>
         <output>... .List => ListItem("error: element count must have integer type") </output>
         requires getKLabel(T') =/=KLabel 'integerType andBool T'=/=K undef

    rule <k> typeCheckAllocaOp(Name:SymbolicValueRef, X:SymbolicValueRef,
                T:KResult, T':KResult, V:K, Align:Int) ~> K:K => .K </k>
         <output>... .List => ListItem("error: alignment is not a power of two") </output>
         requires notBool isPowOfTwo(Align, 1)

    //type check the gep int list coordinated with the type
    rule typeCheckInGepList(T:KResult, T:KResult, .ElemList) => .K
    rule typeCheckInGepList(T:KResult, gepTypeBag(T:KResult), .ElemList) => .K

    rule typeCheckInGepList(RT:KResult, gepTypeBag(T:KResult), valValue(A:K),Es:ElemList)
           => typeCheckInGepList(RT:KResult, T, Es)
    rule typeCheckInGepList(RT:KResult, arrayTypeValue(T1:K, T2:K), valValue(A:K),Es:ElemList)
               => typeCheckInGepList(RT:KResult, T1, Es)
    rule typeCheckInGepList(RT:KResult, vectorTypeValue(T1:K, T2:K), valValue(A:K),Es:ElemList)
               => typeCheckInGepList(RT:KResult, T1, Es)
    rule typeCheckInGepList(RT:KResult, structTypeValue(T1:K),
                valValue(typeOperandResult(A:K, B:K)),Es:ElemList)
               => typeCheckInGepListStruct(RT:KResult,
                        structTypeValue(T1:K), Es:ElemList, evalToInt(B))

    rule <k> typeCheckInGepList(RT:KResult, T:KResult, .ElemList) ~> K:K 
               => .K </k>
         <output>... .List => ListItem("error: invalid getelementptr indices on vector type") </output>
         requires T =/=K RT

    rule <k> typeCheckInGepList(RT:KResult, gepTypeBag(T:KResult), .ElemList) ~> K:K 
               => .K </k>
         <output>... .List => ListItem("error: invalid getelementptr indices on vector type") </output>
         requires T =/=K RT

    rule <k> typeCheckInGepList(RT:KResult, T:K, valValue(A:K),Es:ElemList) ~> K:K 
               => .K </k>
         <output>... .List => ListItem("error: invalid getelementptr indices") </output>
         requires getKLabel(T) =/=KLabel 'vectorTypeValue andBool
                  getKLabel(T) =/=KLabel 'arrayTypeValue andBool
                  getKLabel(T) =/=KLabel 'structTypeValue

    rule typeCheckInGepListStruct(RT:KResult, structTypeValue(T1:K), Es:ElemList, I:Int)
                 => typeCheckInGepList(RT:KResult, getGepTypeInStruct(T1, I), Es)
         requires getGepTypeInStruct(T1, I) =/=K badType

    rule typeCheckInGepListStruct(RT:KResult, structTypeValue(T1:K),
          Es:ElemList, vector(.ElemList)) => .K

    rule typeCheckInGepListStruct(RT:KResult, structTypeValue(T1:K), Es:ElemList,
            vector(valValue(I:Int), Es':ElemList))
                 => typeCheckInGepList(RT:KResult, getGepTypeInStruct(T1, I), Es)
                    ~> typeCheckInGepListStruct(RT:KResult,
                                   structTypeValue(T1:K), Es, vector(Es'))
         requires getGepTypeInStruct(T1, I) =/=K badType

    rule <k> typeCheckInGepListStruct(RT:KResult, structTypeValue(T1:K), Es, I:Int)
              ~> K:K => .K </k>
         <output>... .List => ListItem("error: invalid getelementptr indices") </output>
         requires getGepTypeInStruct(T1, I) ==K badType

    rule <k> typeCheckInGepListStruct(RT:KResult, structTypeValue(T1:K), Es:ElemList,
            vector(valValue(I:Int), Es':ElemList)) ~> K:K
                 => .K </k>
         <output>... .List => ListItem("error: invalid getelementptr indices") </output>
         requires getGepTypeInStruct(T1, I) ==K badType

    rule <k> typeCheckInGepListStruct(RT:KResult, structTypeValue(T1:K), Es:ElemList, I:K)
             ~> K:K => .K </k>
         <output>... .List => ListItem("error: invalid getelementptr indices") </output>
         requires notBool isAInt(I) andBool getKLabel(I) =/=KLabel 'vector

    rule <k> typeCheckInGepListStruct(RT:KResult, structTypeValue(T1:K), Es:ElemList,
             vector(valValue(I:K), Es':ElemList)) ~> K:K => .K </k>
         <output>... .List => ListItem("error: invalid getelementptr indices") </output>
         requires notBool isAInt(I)


    //TODO: deal with other constant expr cases
    rule typeCheckGepOp(Name:SymbolicValueRef, X:SymbolicValueRef,
                                T:KResult, pointerTypeValue(T, A:K), V:K, L:ElemList)
              => typeCheckIntArg(Name, pointerTypeValue(T, A), V)
                  ~> typeCheckGepArgList(Name, L)
                  ~> typeCheckInGepList(getGepType(gepTypeBag(T), L), gepTypeBag(T), L)
                  ~> assignType(Name, X, pointerTypeValue(getGepType(gepTypeBag(T), L), A))
         requires notBool hasVectorInList(L)

    rule typeCheckGepOp(Name:SymbolicValueRef, X:SymbolicValueRef,
                                T:KResult, pointerTypeValue(T, A:K), V:K, L:ElemList)
              => typeCheckIntArg(Name, pointerTypeValue(T, A), V)
                  ~> typeCheckGepArgList(Name, L)
                  ~> typeCheckInGepList(getGepType(gepTypeBag(T), L), gepTypeBag(T), L)
                  ~> assignType(Name, X, vectorTypeValue(pointerTypeValue(
                                 getGepType(gepTypeBag(T), L), A), getVectorNum(L)))
         requires hasVectorInList(L) andBool getVectorNum(L) =/=K badType

    rule typeCheckGepOp(Name:SymbolicValueRef, X:SymbolicValueRef, T:KResult,
                 vectorTypeValue(pointerTypeValue(T, A:K), N:K), V:K, L:ElemList)
              => typeCheckIntArg(Name,
                       vectorTypeValue(pointerTypeValue(T, A:K), N:K), V)
                  ~> typeCheckGepArgList(Name, L)
                  ~> typeCheckInGepList(getGepType(gepTypeBag(T), L), gepTypeBag(T), L)
                  ~> assignType(Name, X, vectorTypeValue(
                               pointerTypeValue(getGepType(gepTypeBag(T), L), A), N))

    rule <k> typeCheckGepOp(Name:SymbolicValueRef,
                    X:SymbolicValueRef, T:KResult, pointerTypeValue(T':KResult, A:K), V:K, L:ElemList)
             ~> K:K => .K </k>
         <output>... .List => ListItem("error: explicit pointee type doesn't match operand's pointee type") </output>
         requires T =/=K T'

    rule <k> typeCheckGepOp(Name:SymbolicValueRef,
                    X:SymbolicValueRef, T:KResult, vectorTypeValue(pointerTypeValue(T':KResult, A:K), N:K), V:K, L:ElemList)
             ~> K:K => .K </k>
         <output>... .List => ListItem("error: explicit pointee type doesn't match operand's pointee type") </output>
         requires T =/=K T'

    rule <k> typeCheckGepOp(Name:SymbolicValueRef, X:SymbolicValueRef, T:KResult, T':KResult, V:K, L:ElemList)
             ~> K:K => .K </k>
         <output>... .List => ListItem("error: base of getelementptr must be a pointer or vector of pointers") </output>
         requires getKLabel(T') =/=KLabel 'pointerTypeValue andBool getKLabel(T') =/=KLabel 'vectorTypeValue

    rule <k> typeCheckGepOp(Name:SymbolicValueRef, X:SymbolicValueRef, T:KResult, vectorTypeValue(T', N:K), V:K, L:ElemList)
             ~> K:K => .K </k>
         <output>... .List => ListItem("error: base of getelementptr must be a pointer or vector of pointers") </output>
         requires getKLabel(T') =/=KLabel 'pointerTypeValue


    rule typeCheckArgList(Name:SymbolicValueRef, .ElemList) => .K
    rule typeCheckArgList(Name:SymbolicValueRef,
                         valValue(typeOperandResult(T:KResult, V:K)),Vs:ElemList)
                    => typeCheckIntArg(Name:SymbolicValueRef, T, V)
                                ~> typeCheckArgList(Name:SymbolicValueRef, Vs)

    rule typeCheckIntArgList(Name:SymbolicValueRef, .ElemList) => .K
    rule typeCheckIntArgList(Name:SymbolicValueRef,
                         valValue(typeOperandResult(T:KResult, V:K)),Vs:ElemList)
                    => typeCheckIntArg(Name:SymbolicValueRef, T, V)
                                ~> typeCheckIntArgList(Name:SymbolicValueRef, Vs)
         requires getKLabel(T) ==KLabel 'integerType

    rule <k> typeCheckIntArgList(Name:SymbolicValueRef, valValue(typeOperandResult(T:K, V:K)),Vs:ElemList)
             ~> K:K => .K </k>
         <output>... .List => ListItem("error: integer constant must have integer type") </output>
         requires getKLabel(T) =/=KLabel 'integerType

    rule typeCheckGepArgList(Name:SymbolicValueRef, .ElemList) => .K
    rule typeCheckGepArgList(Name:SymbolicValueRef,
                         valValue(typeOperandResult(T:KResult, V:K)),Vs:ElemList)
                    => typeCheckIntArg(Name:SymbolicValueRef, T, V)
                                ~> typeCheckGepArgList(Name:SymbolicValueRef, Vs)
         requires getKLabel(T) ==KLabel 'integerType

    rule typeCheckGepArgList(Name:SymbolicValueRef,
                         valValue(typeOperandResult(
                          vectorTypeValue(integerType(I:K), N:K), V:K)),Vs:ElemList)
                    => typeCheckIntArg(Name:SymbolicValueRef,
                             vectorTypeValue(integerType(I:K), N:K), V)
                                ~> typeCheckGepArgList(Name:SymbolicValueRef, Vs)

    rule <k> typeCheckGepArgList(Name:SymbolicValueRef, valValue(typeOperandResult(T:K, V:K)),Vs:ElemList)
             ~> K:K => .K </k>
         <output>... .List => ListItem("error: gep index must be either integer type or vector of integer type") </output>
         requires getKLabel(T) =/=KLabel 'integerType
                  andBool getKLabel(T) =/=KLabel 'vectorTypeValue

    rule <k> typeCheckGepArgList(Name:SymbolicValueRef, valValue(typeOperandResult(vectorTypeValue(T:KResult, N:K), V:K)),Vs:ElemList)
             ~> K:K => .K </k>
         <output>... .List => ListItem("error: gep index must be either integer type or vector of integer type") </output>
         requires getKLabel(T) =/=KLabel 'integerType

    rule typeCheckCastOp(Name:SymbolicValueRef,
                 X:SymbolicValueRef, Op:K, integerType(N:Int), V:K, integerType(N':Int))
              => typeCheckIntArg(Name, integerType(N), V) ~> assignType(Name, X, integerType(N'))
         requires N <Int N' andBool Op =/=K trunc

    rule <k> typeCheckCastOp(Name:SymbolicValueRef, X:SymbolicValueRef,
             Op:K, integerType(N:Int), V:K, integerType(N':Int))
             ~> K => .K </k>
         <output>... .List => ListItem("error: invalid cast opcode for cast from 'i"
                             +String Int2String(N) +String "' to 'i"
                             +String Int2String(N') +String "'") </output>
         requires N >=Int N' andBool Op =/=K trunc

    rule typeCheckCastOp(Name:SymbolicValueRef, X:SymbolicValueRef, Op:K,
               vectorTypeValue(integerType(N:Int), I:Int), V:K,
               vectorTypeValue(integerType(N':Int), I:Int))
              => typeCheckIntArg(Name, vectorTypeValue(integerType(N:Int), I:Int), V)
                 ~> assignType(Name, X, vectorTypeValue(integerType(N'), I:Int))
         requires N <Int N' andBool Op =/=K trunc

    rule <k> typeCheckCastOp(Name:SymbolicValueRef, X:SymbolicValueRef, Op:K,
               vectorTypeValue(integerType(N:Int), I:Int), V:K,
               vectorTypeValue(integerType(N':Int), I':Int)) ~> K:K
              => .K </k>
         <output>... .List => ListItem("error: invalid cast opcode for cast from '<"
                             +String Int2String(I) +String " x "
                             +String Int2String(N) +String ">' to '<"
                             +String Int2String(I') +String " x "
                             +String Int2String(N') +String ">'") </output>
         requires (N >=Int N' orBool I =/=Int I') andBool Op =/=K trunc


    rule typeCheckCastOp(Name:SymbolicValueRef,
                     X:SymbolicValueRef, trunc, integerType(N:Int), V:K, integerType(N':Int))
              => typeCheckIntArg(Name, integerType(N), V) 
                   ~> assignType(Name, X, integerType(N'))
         requires N >Int N'

    rule <k> typeCheckCastOp(Name:SymbolicValueRef,
                     X:SymbolicValueRef, trunc, integerType(N:Int), V:K, integerType(N':Int))
             ~> K => .K </k>
         <output>... .List => ListItem("error: invalid cast opcode for cast from 'i"
                             +String Int2String(N) +String "' to 'i"
                             +String Int2String(N') +String "'") </output>
         requires N <=Int N'

    rule typeCheckCastOp(Name:SymbolicValueRef, X:SymbolicValueRef, trunc,
               vectorTypeValue(integerType(N:Int), I:Int), V:K,
               vectorTypeValue(integerType(N':Int), I:Int))
              => typeCheckIntArg(Name, vectorTypeValue(integerType(N:Int), I:Int), V)
                  ~> assignType(Name, X, vectorTypeValue(integerType(N'), I:Int))
         requires N >Int N'

    rule <k> typeCheckCastOp(Name:SymbolicValueRef, X:SymbolicValueRef, trunc,
               vectorTypeValue(integerType(N:Int), I:Int), V:K,
               vectorTypeValue(integerType(N':Int), I':Int)) ~> K:K
              => .K </k>
         <output>... .List => ListItem("error: invalid cast opcode for cast from '<"
                             +String Int2String(I) +String " x "
                             +String Int2String(N) +String ">' to '<"
                             +String Int2String(I') +String " x "
                             +String Int2String(N') +String ">'") </output>
         requires N <=Int N' orBool I =/=Int I'

    rule <k> typeCheckCastOp(Name:SymbolicValueRef, X:SymbolicValueRef,
            Op:K, vectorTypeValue(Ty:KResult, I:Int), V:K, vectorTypeValue(Ty':KResult, I':Int))  ~> K
              => .K </k>
         <output>... .List => ListItem("error: invalid operand type for instruction") </output>
         requires getKLabel(Ty) =/=KLabel 'integerType orBool getKLabel(Ty') =/=KLabel 'integerType

    rule <k> typeCheckCastOp(Name:SymbolicValueRef, X:SymbolicValueRef, Op:K, T:K, V:K, T':K) ~> K
              => .K </k>
         <output>... .List => ListItem("error: instruction requires integer or integer vector operands") </output>
         requires (getKLabel(T) =/=KLabel 'integerType
                    andBool getKLabel(T) =/=KLabel 'vectorTypeValue)
                    orBool (getKLabel(T') =/=KLabel 'integerType
                    andBool getKLabel(T') =/=KLabel 'vectorTypeValue)


    rule typeCheckIntOp(Name:SymbolicValueRef, X:SymbolicValueRef, integerType(N:Int), L:ElemList)
              => typeCheckIntArgs(Name:SymbolicValueRef, integerType(N), L)
                 ~> assignType(Name, X, integerType(N:Int))

    rule typeCheckIntOp(Name:SymbolicValueRef, X:SymbolicValueRef,
               vectorTypeValue(integerType(N:Int), I:Int), L:ElemList)
              => typeCheckIntArgs(Name:SymbolicValueRef, vectorTypeValue(integerType(N:Int), I:Int), L)
                 ~> assignType(Name, X, vectorTypeValue(integerType(N:Int), I:Int))

    rule <k> typeCheckIntOp(Name:SymbolicValueRef, X:SymbolicValueRef,
               vectorTypeValue(Ty:KResult, I:Int), L:ElemList) ~> K
              => .K </k>
         <output>... .List => ListItem("error: invalid operand type for instruction") </output>
         requires getKLabel(Ty) =/=KLabel 'integerType

    rule <k> typeCheckIntOp(Name:SymbolicValueRef, X:SymbolicValueRef, Ty:KResult, L:ElemList) ~> K
              => .K </k>
         <output>... .List => ListItem("error: instruction requires integer or integer vector operands") </output>
         requires getKLabel(Ty) =/=KLabel 'integerType
                    andBool getKLabel(Ty) =/=KLabel 'vectorTypeValue

    //finally, assign the type of a variable.
    rule <k> assignType(Name:SymbolicValueRef, X:SymbolicValueRef, T:K) => .K ...</k>
         <currModule> ModName:SymbolicValueRef </currModule>
         <funModuleName> ModName </funModuleName>
         <currFunction> FunName:SymbolicValueRef </currFunction>
         <functionName> FunName </functionName>
          <varTypes> _:Map (.Map => X |-> T) </varTypes>
         <basicBlocks>... Name
             |-> blockContent(_:K, _:Set, _:Set, Def:Set (.Set => SetItem(operand(T, X))), _:Set, _:Set) ...</basicBlocks>

    rule typeCheckIntArgs(Name:SymbolicValueRef, T:Type, .ElemList) => .K
    rule typeCheckIntArgs(Name:SymbolicValueRef, T:Type, val(V:K),Vs:ElemList)
                    => typeCheckIntArg(Name:SymbolicValueRef, T, V)
                          ~> typeCheckIntArgs(Name:SymbolicValueRef, T, Vs)

    rule typeCheckIntArg(Name:SymbolicValueRef, T:K, undef) => .K
    rule typeCheckIntArg(Name:SymbolicValueRef,
                            pointerTypeValue(T:K, A:K), zeroinitializer) => .K
    rule typeCheckIntArg(Name:SymbolicValueRef, integerType(N:Int), I:Int) => .K
    rule typeCheckIntArg(Name:SymbolicValueRef, integerType(1), B:Bool) => .K

    rule <k> typeCheckIntArg(Name:SymbolicValueRef, T:K, X:SymbolicValueRef) => .K ...</k>
         <currModule> ModName:SymbolicValueRef </currModule>
         <funModuleName> ModName </funModuleName>
         <currFunction> FunName:SymbolicValueRef </currFunction>
         <functionName> FunName </functionName>
         <varTypes>... addNameToString(X) |-> T:K ...</varTypes>
         <basicBlocks>... Name |-> blockContent(_:K, _:Set, _:Set,
               Def:Set, _:Set, _:Set) ...</basicBlocks>
         requires operand(T, addNameToString(X)) in Def

    rule <k> typeCheckIntArg(Name:SymbolicValueRef, T:K, X:SymbolicValueRef) => .K ...</k>
         <currModule> ModName:SymbolicValueRef </currModule>
         <funModuleName> ModName </funModuleName>
         <currFunction> FunName:SymbolicValueRef </currFunction>
         <functionName> FunName </functionName>
         <basicBlocks>... Name |-> blockContent(_:K, _:Set, _:Set,
               Def:Set, _:Set, Use:Set  (.Set => SetItem(operand(T, addNameToString(X))))) ...</basicBlocks>
         requires notBool operand(T, addNameToString(X)) in Def

    rule <k> typeCheckIntArg(Name:SymbolicValueRef, T:K, X:SymbolicValueRef) ~> K:K => .K </k>
         <currModule> ModName:SymbolicValueRef </currModule>
         <funModuleName> ModName </funModuleName>
         <currFunction> FunName:SymbolicValueRef </currFunction>
         <functionName> FunName </functionName>
         <varTypes>... addNameToString(X) |-> T':K ...</varTypes>
         <output>... .List => ListItem("error: constant expression type mismatch") </output>
         requires T =/=K T'

    rule typeCheckIntArg(Name:SymbolicValueRef,
                 vectorTypeValue(integerType(N:Int), I:Int), vector(val(operand(T':Type, V:ValueRef)), R:ElemList))
         => typeCheckIntArg(Name:SymbolicValueRef, integerType(N:Int), I, vector(R), T', V)
         requires I >Int 0 andBool N >Int 0

    //define type checking rules for vector types in integer opeartors.
    rule typeCheckIntArg(Name:SymbolicValueRef,
                             T:K, 0, vector(.ElemList)) => .K
    rule typeCheckIntArg(Name:SymbolicValueRef,
                     T:K, I:Int, vector(val(operand(T':Type, V:ValueRef)), R:ElemList))
         => typeCheckIntArg(Name:SymbolicValueRef, T, I, vector(R), T', V)
         requires I >Int 0

    rule typeCheckIntArg(Name:SymbolicValueRef, integerType(N:Int),
                                            N':Int, A:K, T:KResult, I':Int)
         => typeCheckIntArg(Name:SymbolicValueRef, integerType(N:Int), N' -Int 1, A:K)
    rule typeCheckIntArg(Name:SymbolicValueRef, integerType(1),
                                          I:Int, A:K, integerType(1), B:Bool)
         => typeCheckIntArg(Name:SymbolicValueRef, integerType(1), I -Int 1, A)

    rule <k> typeCheckIntArg(Name:SymbolicValueRef,
                integerType(N:Int), N':Int, A:K, T:KResult, X:SymbolicValueRef)
         => typeCheckIntArg(Name:SymbolicValueRef,
                                        integerType(N), N' -Int 1, A) ...</k>
         <currModule> ModName:SymbolicValueRef </currModule>
         <funModuleName> ModName </funModuleName>
         <currFunction> FunName:SymbolicValueRef </currFunction>
         <functionName> FunName </functionName>
         <varTypes>... addNameToString(X) |-> T ...</varTypes>
         <basicBlocks>... Name |-> blockContent(_:K, _:Set, _:Set,
               Def:Set, _:Set, _:Set) ...</basicBlocks>
         requires operand(T, addNameToString(X)) in Def

    rule <k> typeCheckIntArg(Name:SymbolicValueRef,
                integerType(N:Int), N':Int, A:K, T:KResult, X:SymbolicValueRef)
         => typeCheckIntArg(Name:SymbolicValueRef,
                                        integerType(N), N' -Int 1, A) ...</k>
         <currModule> ModName:SymbolicValueRef </currModule>
         <funModuleName> ModName </funModuleName>
         <currFunction> FunName:SymbolicValueRef </currFunction>
         <functionName> FunName </functionName>
         <varTypes> M:Map </varTypes>
         <basicBlocks>... Name |-> blockContent(_:K, _:Set, _:Set,
               _:Set, _:Set, Use:Set  (.Set => SetItem(operand(T, addNameToString(X))))) ...</basicBlocks>
         requires notBool addNameToString(X) in keys(M)

    rule <k> typeCheckIntArg(Name:SymbolicValueRef,
                integerType(N:Int), N':Int, A:K, T:KResult, X:SymbolicValueRef)
             ~> K:K => .K </k>
         <currModule> ModName:SymbolicValueRef </currModule>
         <funModuleName> ModName </funModuleName>
         <currFunction> FunName:SymbolicValueRef </currFunction>
         <functionName> FunName </functionName>
         <varTypes>... addNameToString(X) |-> T':K ...</varTypes>
         <output>... .List => ListItem("error: constant expression type mismatch") </output>
         requires T =/=K T'

    //define illform situations for type checking of integer operators.
    rule <k> typeCheckIntArg(Name:SymbolicValueRef,
                    integerType(N:Int), N':Int, A:K, T:KResult, K:K) ~> K'
                      => .K </k>
         <output>... .List => ListItem("error: constant expression type mismatch") </output>
         requires (notBool isTheInt(K)) andBool (notBool isTheBool(K))
                   andBool (notBool isTheLocalName(K))

    rule <k> typeCheckIntArg(Name:SymbolicValueRef, integerType(N:Int),
                  I:Int, A:K, integerType(N':Int), B:Bool) ~> K
                   => .K </k>
         <output>... .List => ListItem("error: constant expression type mismatch") </output>
         requires N =/=Int 1 orBool N' =/=Int 1

    rule <k> typeCheckIntArg(Name:SymbolicValueRef, T:K, I:Int, vector(.ElemList)) ~> K => .K </k>
         <output>... .List => ListItem("error: constant expression type mismatch") </output>
         requires I >Int 0
    rule <k> typeCheckIntArg(Name:SymbolicValueRef,
                         T:K, 0, vector(R:ElemList)) ~> K => .K </k>
         <output>... .List => ListItem("error: constant expression type mismatch") </output>
         requires R =/=K .ReturnedVal

    rule <k> typeCheckIntArg(Name:SymbolicValueRef,
                       vectorTypeValue(T:K, I:Int), vector(R:ElemList)) ~> K
         => .K </k>
         <output>... .List => ListItem("error: instruction requires integer or integer vector operands") </output>
         requires getKLabel(T) =/=KLabel 'integerType
    rule <k> typeCheckIntArg(Name:SymbolicValueRef,
                 vectorTypeValue(integerType(N:Int), 0), vector(R:ElemList)) ~> K
                   => .K </k>
         <output>... .List => ListItem("error: zero element vector is illegal") </output>
    rule <k> typeCheckIntArg(Name:SymbolicValueRef,
                 vectorTypeValue(integerType(N:Int), I:Int), vector(R:ElemList)) ~> K
                  => .K </k>
         <output>... .List => ListItem("error: expected number in address space") </output>
         requires I <Int 0
    rule <k> typeCheckIntArg(Name:SymbolicValueRef,
              vectorTypeValue(integerType(N:Int), I:Int), vector(R:ElemList)) ~> K
              => .K </k>
         <output>... .List => ListItem("error: constant vector must not be empty") </output>
         requires I >Int 0
    rule <k> typeCheckIntArg(Name:SymbolicValueRef,
                                     Ty:K, I:Int) ~> K => .K </k>
         <output>... .List => ListItem("error: integer constant must have integer type") </output>
         requires getKLabel(Ty) =/=KLabel 'integerType
    rule <k> typeCheckIntArg(Name:SymbolicValueRef,
                                     Ty:K, B:Bool) ~> K => .K </k>
         <output>... .List => ListItem("error: constant expression type mismatch") </output>
         requires getKLabel(Ty) =/=KLabel 'integerType
    rule <k> typeCheckIntArg(Name:SymbolicValueRef,
                           integerType(N:Int), B:Bool) ~> K => .K </k>
         <output>... .List => ListItem("error: constant expression type mismatch") </output>
         requires N =/=K 1
    rule <k> typeCheckIntArg(Name:SymbolicValueRef,
                                        T:K, X:LocalName) ~> K => .K </k>
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
    rule icmp Op T:Type V:ValueRef , V':ValueRef I:InstructionMetadatas
           => theDefinition(INotEq(T, V, V'),I)
*/
    rule instValToKItem(icmp Op:IPredicate Ty:Type V1:ValueRef , V2:ValueRef Ins:InstructionMetadatas)
           => instruction(iCmp(Op, Ty
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

    rule instValToKItem(select Ty1:Type V1:ValueRef, Ty2:Type V2:ValueRef, Ty3:Type V3:ValueRef
                        Ins:InstructionMetadatas)
           => instruction(select(addNameToString(Ty1)
                                 ,addNameToString(V1)
                                 ,operand(addNameToString(Ty2),addNameToString(V2))
                                 ,operand(addNameToString(Ty3),addNameToString(V3)))
                          ,.Set
                          ,insMetas(formElemList(Ins)))

    rule instValToKItem(va_arg Ty1:Type V1:ValueRef, Ty2:Type Ins:InstructionMetadatas)
           => instruction(theVAArg(addNameToString(Ty2)
                                   ,operand(addNameToString(Ty1),addNameToString(V1)))
                          ,.Set
                          ,insMetas(formElemList(Ins)))

    rule instValToKItem(getelementptr Oib:OptInBounds Ty:Type , Ty1:Type V1:ValueRef,
                                    Itr:ReturnedVal Ins:InstructionMetadatas)
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
                     V1:ValueRef (Pl:ParamList) Fat:FuncAttrs Ins:InstructionMetadatas)
           => instruction(call(addNameToString(Ty1),callee(addNameToString(V1),
                               arguments(formElemList(Pl))))
                          ,formSet(Ocv) formSet(Rat) formSet(Fat)
                          ,insMetas(formElemList(Ins)))
    //do the same above for OptTailCall ::= tail call
    rule instValToKItem(tail call Ocv:OptCallingConv Rat:RetAttrs Ty1:Type
                     V1:ValueRef (Pl:ParamList) Fat:FuncAttrs Ins:InstructionMetadatas)
           => instruction(tailCall(addNameToString(Ty1),callee(addNameToString(V1),
                                   arguments(formElemList(Pl:ParamList))))
                          ,formSet(Ocv) formSet(Rat) formSet(Fat)
                          ,insMetas(formElemList(Ins)))

    rule instValToKItem(alloca Oil:OptInalloca All:AllocMetadata Ins:InstructionMetadatas)
           => instruction(dealWithAllocaElem(All),formSet(Oil),insMetas(formElemList(Ins)))


    rule instValToKItem(load Oac:Atomic Ovl:OptVolatile T:Type, Ty:Type V:ValueRef
                                 Ost:OptSingleThread Ord:Ordering,
                                                  Oal:Align Ins:InstructionMetadatas)
           => instruction(load(addNameToString(Ty)
                               ,addNameToString(V))
                          ,formSet(Oac) formSet(Ovl)
                           formSet(Ost:OptSingleThread Ord:Ordering) formSet(Oal)
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

    //set out edges for a block
    rule setOutEdge(N:K, .ElemList) => .K
    rule <k> setOutEdge(N:K, val(V:SymbolicValueRef),El:ElemList)
                => setOutEdge(N, El) ...</k>
        <currModule> ModName:SymbolicValueRef </currModule>
        <funModuleName> ModName </funModuleName>
        <currFunction> FunName:SymbolicValueRef </currFunction>
        <functionName> FunName </functionName>
         <basicBlocks>... N |-> 
                blockContent(_:K, Out:Set (.Set => SetItem(V)), _:Set, _:Set, _:Set, _:Set) ...</basicBlocks>

    //set inedges
    rule setInEdges(.Set) => .K
    rule setInEdges(SetItem(K:K) S:Set) => setInEdgesForNode(K) ~> setInEdges(S)

    //set inedges for each node
    rule <k> setInEdgesForNode(A:K) => setInEdgesForNode(A, .K, Out) ...</k>
        <currModule> ModName:SymbolicValueRef </currModule>
        <funModuleName> ModName </funModuleName>
        <currFunction> FunName:SymbolicValueRef </currFunction>
        <functionName> FunName </functionName>
         <basicBlocks>... A |-> 
                blockContent(_:K, Out:Set, _:Set, _:Set, _:Set, _:Set) ...</basicBlocks>

    rule setInEdgesForNode(A:K, .K, .Set) => .K
    rule setInEdgesForNode(A:K, .K, SetItem(B:K) S:Set) => setInEdgesForNode(A, B, S)
    rule <k> setInEdgesForNode(A:K,B:K, S:Set) => setInEdgesForNode(A, .K, S) ...</k>
        <currModule> ModName:SymbolicValueRef </currModule>
        <funModuleName> ModName </funModuleName>
        <currFunction> FunName:SymbolicValueRef </currFunction>
        <functionName> FunName </functionName>
         <basicBlocks>... B |-> 
              blockContent(_:K, _:Set, In:Set (.Set => SetItem(A)), _:Set, _:Set, _:Set) ...</basicBlocks>

    //helper function for checkUseVars
    syntax Set ::= getOperandSetOfLabels(Set)    [function]
    rule getOperandSetOfLabels(.Set) => .Set
    rule getOperandSetOfLabels(SetItem(A:K) S:Set)
             => SetItem(operand(label, A)) getOperandSetOfLabels(S)


    //check all the function vars have a father along any path
    rule <k> checkUseVars(E:KResult) => checkUseVars(values(M),
                          .K, formArgSet(E), getOperandSetOfLabels(keys(M))) ...</k>
         <currModule> ModName:SymbolicValueRef </currModule>
         <funModuleName> ModName </funModuleName>
         <currFunction> FunName:SymbolicValueRef </currFunction>
         <functionName> FunName </functionName>
         <basicBlocks> M:Map </basicBlocks>

    rule checkUseVars(L:List, K:K, S1:Set, S2:Set) => checkUseVars(L, K, S1 S2)

    rule <k> checkUseVarWait => .K ...</k>
         <checkAllUses> .Bag </checkAllUses>
            <checkExistUses>
               B:Bag => .Bag
            </checkExistUses>

    rule checkUseVars(.List, .K, _:Set) => checkUseVarWait
    rule checkUseVars(ListItem(A:K) L:List, .K, S:Set) => checkUseVars(L, A, S)

    rule checkUseVars(L:List,
                   blockContent(K:K, Out:Set, In:Set, Def:Set, _:Set, Use:Set), S:Set)
         => checkUseVars(L, .K, S)
         requires Use -Set S <=Set .Set

    rule <k> checkUseVars(L:List,
                  blockContent(K:K, Out:Set, In:Set, Def:Set, UsePhi:Set, Use:Set), S:Set)
         => checkUseVars(L, .K, S) ...</k>
         (.Bag => <checkUsesInBlock>...
                    <allCurrentJob> checkUseVars(In, Use -Set S, S) </allCurrentJob>
                ...</checkUsesInBlock>)
         requires notBool (Use -Set S <=Set .Set)


    rule <allCurrentJob> checkUseVarInBlock(A:K, Use:Set, S:Set) </allCurrentJob>
         <currModule> ModName:SymbolicValueRef </currModule>
         <checkUseResult> false => true </checkUseResult>
         <funModuleName> ModName </funModuleName>
         <currFunction> FunName:SymbolicValueRef </currFunction>
         <functionName> FunName </functionName>
         <basicBlocks>... A |-> 
              blockContent(_:K, _:Set, _:Set, Def:Set, _:Set, _:Set) ...</basicBlocks>
         requires Use <=Set Def

    rule <checkAllUses>
          (B:Bag <checkUsesInBlock>...
          <allCheckedBlocks> S:Set </allCheckedBlocks>
          <allCurrentJob> checkUseVarInBlock(A:K, Use:Set, Labels:Set) </allCurrentJob>
         <checkUseResult> false </checkUseResult>
         ...</checkUsesInBlock> => .Bag)
         </checkAllUses>
         <k> K:K => .K </k>
         <output>... .List => ListItem("error: the function is not well-formed") </output>
         <currModule> ModName:SymbolicValueRef </currModule>
         <funModuleName> ModName </funModuleName>
         <currFunction> FunName:SymbolicValueRef </currFunction>
         <functionName> FunName </functionName>
         <basicBlocks>... A |-> 
              blockContent(_:K, _:Set, S':Set, Def:Set, _:Set, _:Set) ...</basicBlocks>
         requires (notBool (Use <=Set Def)) andBool S' <=Set S


    rule <allCheckedBlocks> S:Set </allCheckedBlocks>
          <allCurrentJob> checkUseVarInBlock(A:K, Use:Set, Labels:Set)
                     => checkUseVars(In -Set S, Use -Set Def, Labels) </allCurrentJob>
         <currModule> ModName:SymbolicValueRef </currModule>
         <checkUseResult> false </checkUseResult>
         <funModuleName> ModName </funModuleName>
         <currFunction> FunName:SymbolicValueRef </currFunction>
         <functionName> FunName </functionName>
         <basicBlocks>... A |-> 
              blockContent(_:K, _:Set, In:Set, Def:Set, _:Set, _:Set) ...</basicBlocks>
         requires notBool (Use <=Set Def) andBool notBool (In <=Set S)

    rule <checkUsesInBlock>...
              <allCurrentJob> checkUseVars(.Set, Use:Set, Labels:Set) </allCurrentJob>
         ...</checkUsesInBlock>
         => .Bag

    rule <checkUsesInBlock>...
            <checkUseResult> false </checkUseResult>
                <allCheckedBlocks> S:Set </allCheckedBlocks>
                <allCurrentJob> checkUseVars(SetItem(A:K) S':Set, Use:Set, Labels:Set)
                            => checkUseVars(S', Use:Set, Labels:Set) </allCurrentJob>
         ...</checkUsesInBlock>
         (.Bag => <checkUsesInBlock>...
                    <checkUseResult> false </checkUseResult>
                         <allCheckedBlocks> S:Set SetItem(A) </allCheckedBlocks>
                         <allCurrentJob> checkUseVarInBlock(A, Use, Labels) </allCurrentJob>
                  ...</checkUsesInBlock>)

    //check all the phi function vars have a father

    rule <k> checkUseVarInPhi(E:KResult)
                 => checkUseVarInPhi(values(M), .K, formArgSet(E)) ...</k>
         <currModule> ModName:SymbolicValueRef </currModule>
         <funModuleName> ModName </funModuleName>
         <currFunction> FunName:SymbolicValueRef </currFunction>
         <functionName> FunName </functionName>
         <basicBlocks> M:Map </basicBlocks>

    rule checkUseVarInPhi(.List, .K, _:Set) => checkUseVarWait
    rule checkUseVarInPhi(ListItem(A:K) S:List, .K, Arg:Set) => checkUseVarInPhi(S, A, Arg)
    rule checkUseVarInPhi(S:List,
                              blockContent(K:K, Out:Set, In:Set, Def:Set, UsePhi:Set, _:Set), Arg:Set)
         => checkUseVarInPhi(S, .K, Arg)
         requires UsePhi -Set Arg <=Set .Set

    rule <k> checkUseVarInPhi(S:List,
                     blockContent(K:K, Out:Set, In:Set, Def:Set, UsePhi:Set, Use:Set), Arg:Set)
         => checkUseVarInPhi(S, .K, Arg) ...</k>
         <checkUseCount> I:Int </checkUseCount>
         (.Bag => <checkUsesInBlock>...
                    <allCurrentJob> checkUseVarInPhi(.K, In, UsePhi -Set Arg) </allCurrentJob>
                    <allUseNum> I </allUseNum>
                ...</checkUsesInBlock>)
         requires notBool (UsePhi -Set Arg <=Set .Set)


    rule <checkUsesInBlock>...
           <checkUseResult> true </checkUseResult>
         ...</checkUsesInBlock>
         => .Bag

    rule <allCurrentJob> checkUseVarInPhi(.K, SetItem(A:K) S':Set, UsePhi:Set)
                  => checkUseVarInPhi(A, S':Set, UsePhi:Set) </allCurrentJob>

    rule <allCurrentJob> checkUseVarInPhi(A:K, S':Set, UsePhi:Set)
                  => true </allCurrentJob>
          <checkUseResult> false => true </checkUseResult>
         <currModule> ModName:SymbolicValueRef </currModule>
         <funModuleName> ModName </funModuleName>
         <currFunction> FunName:SymbolicValueRef </currFunction>
         <functionName> FunName </functionName>
         <basicBlocks>... A |-> 
              blockContent(_:K, _:Set, _:Set, Def:Set, _:Set, _:Set) ...</basicBlocks>
         requires UsePhi <=Set Def

    rule <allCurrentJob> checkUseVarInPhi(A:K, S':Set, UsePhi:Set)
               => checkUseVarInPhi(.K, S' (In -Set (S SetItem(A))), UsePhi -Set Def) </allCurrentJob>
         <allCheckedBlocks> S:Set (.Set => SetItem(A)) </allCheckedBlocks>
         <currModule> ModName:SymbolicValueRef </currModule>
         <funModuleName> ModName </funModuleName>
         <currFunction> FunName:SymbolicValueRef </currFunction>
         <functionName> FunName </functionName>
         <basicBlocks>... A |-> 
              blockContent(_:K, _:Set, In:Set, Def:Set, _:Set, _:Set) ...</basicBlocks>
         requires notBool (UsePhi <=Set Def) andBool A =/=K .K


    //ensure the static single assignment property in a function.
    //and normalize the llvm operators to abstract syntax.

    syntax KItem ::= checkSingleAssignment(K)
                   | checkSingleAssignmentInBlock(SymbolicValueRef, K, K, Bool) //name, tocheck, stores, is-phi-allow

    //in the checkSingleAssignment and checkSingleAssignmentInBlock
    //to add addNameToString to every positioins where show Type and ValueRef
    //for example the third rule

    //form a basicBlock finally.
    rule <k> checkSingleAssignmentInBlock(N:SymbolicValueRef, .K, K:K, _:Bool)
             => .K ...</k>
        <currModule> ModName:SymbolicValueRef </currModule>
        <funModuleName> ModName </funModuleName>
        <currFunction> FunName:SymbolicValueRef </currFunction>
        <functionName> FunName </functionName>
         <basicBlocks>... N |-> blockContent((_:K => setBlock(N)
                   ~> K), _:Set, _:Set, _:Set, _:Set, _:Set) ...</basicBlocks>

    //have dealt with all instruction list.
    rule checkSingleAssignmentInBlock(N:SymbolicValueRef, .InstructionList
                               BB:K, K:K, B:Bool)
         => checkSingleAssignmentInBlock(N, BB, K, B)

    //deal with termination instructions.
    rule checkSingleAssignmentInBlock(N:SymbolicValueRef, ret Nt:NonVoidType
                                  Va:ValueRef Meta:InstructionMetadatas, K:K, _:Bool)
         => typeCheckOp(N:SymbolicValueRef, .K, ret Nt:NonVoidType
                                  Va:ValueRef Meta:InstructionMetadatas)
             ~> checkSingleAssignmentInBlock(N, .K, K
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
         => typeCheckOp(N, .K, br label La:ValueRef
                                  Meta:InstructionMetadatas)
             ~> setOutEdge(N, getOutEdges(La))
              ~> checkSingleAssignmentInBlock(N, .K, K
                   ~> instruction(unconditional(addNameToString(La))
                                  ,.Set
                                  ,insMetas(formElemList(Meta))), false)

    rule checkSingleAssignmentInBlock(N:SymbolicValueRef, br It:IntType Va:ValueRef ,
                                       label La1:ValueRef , label La2:ValueRef
                                  Meta:InstructionMetadatas, K:K, _:Bool)
         => typeCheckOp(N, .K, br It:IntType Va:ValueRef ,
                                       label La1:ValueRef , label La2:ValueRef
                                  Meta:InstructionMetadatas)
             ~> setOutEdge(N, getOutEdges(La1)) ~> setOutEdge(N, getOutEdges(La2))
             ~> checkSingleAssignmentInBlock(N, .K, K
               ~> instruction(conditional(operand(addNameToString(It),addNameToString(Va))
                                        ,addNameToString(La1)
                                        ,addNameToString(La2))
                                    ,.Set, insMetas(formElemList(Meta))), false)

    rule checkSingleAssignmentInBlock(N:SymbolicValueRef, resume Ty:Type Va:ValueRef
                                    Meta:InstructionMetadatas, K:K, _:Bool)
         => typeCheckOp(N, .K, resume Ty:Type Va:ValueRef
                                    Meta:InstructionMetadatas)
             ~> checkSingleAssignmentInBlock(N, .K, K
             ~> instruction(resume(operand(addNameToString(Ty)
                                   ,addNameToString(Va)))
                            ,.Set, insMetas(formElemList(Meta))), false)
    rule checkSingleAssignmentInBlock(N:SymbolicValueRef, indirectbr Ty:Type Va:ValueRef ,
                                       [ Las:LabelValues ]
                                  Meta:InstructionMetadatas, K:K, _:Bool)
         => typeCheckOp(N, .K, indirectbr Ty:Type Va:ValueRef ,
                                       [ Las:LabelValues ]
                                  Meta:InstructionMetadatas)
             ~> setOutEdge(N, getOutEdges(Las))
             ~> checkSingleAssignmentInBlock(N, .K, K
                ~> instruction(indirectbr(operand(addNameToString(Ty)
                                          ,addNameToString(Va))
                                          ,formElemList(Las))
                               ,.Set, insMetas(formElemList(Meta))), false)
    rule checkSingleAssignmentInBlock(N:SymbolicValueRef, switch It:IntType Va:ValueRef ,
                                       label La:ValueRef [ Ju:JumpTable ]
                                  Meta:InstructionMetadatas, K:K, _:Bool)
         => typeCheckOp(N, .K, switch It:IntType Va:ValueRef ,
                                       label La:ValueRef [ Ju:JumpTable ]
                                  Meta:InstructionMetadatas)
             ~> setOutEdge(N, val(addNameToString(La)))
                 ~> setOutEdge(N, getOutEdges(Ju))
             ~> checkSingleAssignmentInBlock(N, .K, K
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
                                       to La1:LabelValue unwind La2:LabelValue 
                                  Meta:InstructionMetadatas, K:K, _:Bool)
         => typeCheckOp(N, name(localVar, Int2String(I)), invoke Opc:OptCallingConv Re:RetAttrs
                                       Ty:Type Va:ValueRef (Pa:ParamList) Fu:FuncAttrs
                                       to La1:LabelValue unwind La2:LabelValue 
                                  Meta:InstructionMetadatas)
             ~> checkSingleAssignmentInBlock(N, .K, K 
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
        <varTypes> M:Map </varTypes>
        <localFunVarCounter> I:Int => I +Int 1 </localFunVarCounter>
        requires notBool name(localVar, Int2String(I)) in keys(M)

    rule <k> checkSingleAssignmentInBlock(N:SymbolicValueRef,Var:LocalVar
                                       = invoke Opc:OptCallingConv Re:RetAttrs
                                       Ty:Type Va:ValueRef (Pa:ParamList) Fu:FuncAttrs
                                       to La1:LabelValue unwind La2:LabelValue 
                                  Meta:InstructionMetadatas, K:K, _:Bool)
         => typeCheckOp(N, name(localVar, substrString(#tokenToString(Var),1
               ,lengthString(#tokenToString(Var)))), invoke Opc:OptCallingConv Re:RetAttrs
                                       Ty:Type Va:ValueRef (Pa:ParamList) Fu:FuncAttrs
                                       to La1:LabelValue unwind La2:LabelValue 
                                  Meta:InstructionMetadatas)
             ~> checkSingleAssignmentInBlock(N, .K, K 
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
        <varTypes> M:Map </varTypes>
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
         => typeCheckOp(N, name(localVar, substrString(#tokenToString(Var),1
                          ,lengthString(#tokenToString(Var)))), invoke Opc:OptCallingConv Re:RetAttrs
                                       Ty:Type Va:ValueRef (Pa:ParamList) Fu:FuncAttrs
                                       to La1:LabelValue unwind La2:LabelValue 
                                  Meta:InstructionMetadatas)
             ~> checkSingleAssignmentInBlock(N, .K, K 
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
        <varTypes> M:Map </varTypes>
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
         => typeCheckOp(N, name(localVar, Int2String(I)), In)
             ~> checkSingleAssignmentInBlock(N, Ins BB, K
                      ~> assign(name(localVar, Int2String(I)),instValToKItem(In)), false)
         ...</k>
         <currModule> ModName:SymbolicValueRef </currModule>
         <funModuleName> ModName </funModuleName>
         <currFunction> FunName:SymbolicValueRef </currFunction>
         <functionName> FunName </functionName>
         <varTypes> M:Map </varTypes>
         <localFunVarCounter> I:Int => I +Int 1 </localFunVarCounter>
         requires getKLabel(In) =/=KLabel 'phiFun andBool getKLabel(In) =/=KLabel 'functionCall

    rule checkSingleAssignmentInBlock(N:SymbolicValueRef, Ca:OptTailCall
                        Ocv:OptCallingConv Rat:RetAttrs void
                     V1:ValueRef (Pl:ParamList) Fat:FuncAttrs
                       Meta:InstructionMetadatas Ins:InstructionList
                               BB:BBTerminatorInstruction, K:K, _:Bool)
         => typeCheckOp(N, .K, Ca:OptTailCall
                        Ocv:OptCallingConv Rat:RetAttrs void
                     V1:ValueRef (Pl:ParamList) Fat:FuncAttrs
                       Meta:InstructionMetadatas)
             ~> checkSingleAssignmentInBlock(N, Ins BB, K
                      ~> instValToKItem(Ca:OptTailCall
                        Ocv:OptCallingConv Rat:RetAttrs void
                     V1:ValueRef (Pl:ParamList) Fat:FuncAttrs
                       Meta:InstructionMetadatas), false)

    rule <k>checkSingleAssignmentInBlock(N:SymbolicValueRef, Ca:OptTailCall
                        Ocv:OptCallingConv Rat:RetAttrs Ty1:NonVoidType
                     V1:ValueRef (Pl:ParamList) Fat:FuncAttrs
                       Meta:InstructionMetadatas Ins:InstructionList
                               BB:BBTerminatorInstruction, K:K, _:Bool)
         => typeCheckOp(N, name(localVar, Int2String(I)), Ca:OptTailCall
                        Ocv:OptCallingConv Rat:RetAttrs Ty1:NonVoidType
                     V1:ValueRef (Pl:ParamList) Fat:FuncAttrs
                       Meta:InstructionMetadatas)
             ~> checkSingleAssignmentInBlock(N, Ins BB, K
                      ~> assign(name(localVar, Int2String(I)),
                      instValToKItem(Ca:OptTailCall
                        Ocv:OptCallingConv Rat:RetAttrs Ty1:NonVoidType
                     V1:ValueRef (Pl:ParamList) Fat:FuncAttrs
                       Meta:InstructionMetadatas)), false)
         ...</k>
         <currModule> ModName:SymbolicValueRef </currModule>
         <funModuleName> ModName </funModuleName>
         <currFunction> FunName:SymbolicValueRef </currFunction>
         <functionName> FunName </functionName>
         <varTypes> M:Map </varTypes>
         <localFunVarCounter> I:Int => I +Int 1 </localFunVarCounter>

    rule <k> checkSingleAssignmentInBlock(N:SymbolicValueRef,
               phi Ty:Type Pl:PHIList InstM:InstructionMetadatas Ins:InstructionList
                               BB:BBTerminatorInstruction, K:K, true)
         => typeCheckOp(N, name(localVar, Int2String(I)),
                      phi Ty:Type Pl:PHIList InstM:InstructionMetadatas)
             ~> checkSingleAssignmentInBlock(N, Ins BB,
                K ~> assign(name(localVar, Int2String(I)),
                            instValToKItem(phi Ty:Type Pl:PHIList InstM:InstructionMetadatas)), true)
         ...</k>
         <currModule> ModName:SymbolicValueRef </currModule>
         <funModuleName> ModName </funModuleName>
         <currFunction> FunName:SymbolicValueRef </currFunction>
         <functionName> FunName </functionName>
         <varTypes> M:Map </varTypes>
         <localFunVarCounter> I:Int => I +Int 1 </localFunVarCounter>


    rule <k> checkSingleAssignmentInBlock(N:SymbolicValueRef,
               phi Ty:Type Pl:PHIList InstM:InstructionMetadatas Ins:InstructionList
                               BB:BBTerminatorInstruction, K:K, false) ~> K:K => .K </k>
          <output>... .List =>
            ListItem("error: non-phi instructions between the start of a basic block and the PHI instructions") </output>

    rule <k> checkSingleAssignmentInBlock(N:SymbolicValueRef, Var:LocalVar = In:InstVal
               Ins:InstructionList BB:BBTerminatorInstruction, K:K, _:Bool)
         => typeCheckOp(N, name(localVar, substrString(#tokenToString(Var),1
                          ,lengthString(#tokenToString(Var)))), In)
             ~> checkSingleAssignmentInBlock(N, Ins BB, K
                      ~> assign(name(localVar, substrString(#tokenToString(Var),1
                          ,lengthString(#tokenToString(Var)))),instValToKItem(In)), false)
         ...</k>
         <currModule> ModName:SymbolicValueRef </currModule>
         <funModuleName> ModName </funModuleName>
         <currFunction> FunName:SymbolicValueRef </currFunction>
         <functionName> FunName </functionName>
         <varTypes> M:Map </varTypes>
         requires notBool (name(localVar, substrString(#tokenToString(Var),1
                          ,lengthString(#tokenToString(Var))))
                                in keys(M)) andBool getKLabel(In) =/=KLabel 'phiFun
                  andBool getKLabel(In) =/=KLabel 'functionCall


    rule <k> checkSingleAssignmentInBlock(N:SymbolicValueRef, Var:LocalVar = Ca:OptTailCall
                        Ocv:OptCallingConv Rat:RetAttrs void
                     V1:ValueRef (Pl:ParamList) Fat:FuncAttrs
                       Meta:InstructionMetadatas
               Ins:InstructionList BB:BBTerminatorInstruction, _:K, _:Bool) ~> K:K
         => .K </k>
         <output>... .List => ListItem("error: instructions returning void cannot have a name") </output>

    rule <k> checkSingleAssignmentInBlock(N:SymbolicValueRef, Var:LocalVar = Ca:OptTailCall
                        Ocv:OptCallingConv Rat:RetAttrs Ty1:NonVoidType
                     V1:ValueRef (Pl:ParamList) Fat:FuncAttrs
                       Meta:InstructionMetadatas
               Ins:InstructionList BB:BBTerminatorInstruction, K:K, _:Bool)
         => typeCheckOp(N, name(localVar, substrString(#tokenToString(Var),1
                          ,lengthString(#tokenToString(Var)))), Ca:OptTailCall
                        Ocv:OptCallingConv Rat:RetAttrs Ty1:NonVoidType
                     V1:ValueRef (Pl:ParamList) Fat:FuncAttrs
                       Meta:InstructionMetadatas)
             ~> checkSingleAssignmentInBlock(N, Ins BB, K
                      ~> assign(name(localVar, substrString(#tokenToString(Var),1
                          ,lengthString(#tokenToString(Var)))),
                          instValToKItem(Ca:OptTailCall
                        Ocv:OptCallingConv Rat:RetAttrs Ty1:NonVoidType
                     V1:ValueRef (Pl:ParamList) Fat:FuncAttrs
                       Meta:InstructionMetadatas)), false)
         ...</k>
         <currModule> ModName:SymbolicValueRef </currModule>
         <funModuleName> ModName </funModuleName>
         <currFunction> FunName:SymbolicValueRef </currFunction>
         <functionName> FunName </functionName>
         <varTypes> M:Map </varTypes>
         requires notBool (name(localVar, substrString(#tokenToString(Var),1
                          ,lengthString(#tokenToString(Var)))) in keys(M))


    rule <k> checkSingleAssignmentInBlock(N:SymbolicValueRef, Var:LocalVar =
               phi Ty:Type Pl:PHIList InstM:InstructionMetadatas
               Ins:InstructionList BB:BBTerminatorInstruction, K:K, true)
         => typeCheckOp(N, name(localVar, substrString(#tokenToString(Var),1
                          ,lengthString(#tokenToString(Var)))),
                             phi Ty:Type Pl:PHIList InstM:InstructionMetadatas)
             ~> checkSingleAssignmentInBlock(N, Ins BB, K
                      ~> assign(name(localVar, substrString(#tokenToString(Var),1
                          ,lengthString(#tokenToString(Var)))),
                instValToKItem(phi Ty:Type Pl:PHIList InstM:InstructionMetadatas)), true)
         ...</k>
         <currModule> ModName:SymbolicValueRef </currModule>
         <funModuleName> ModName </funModuleName>
         <currFunction> FunName:SymbolicValueRef </currFunction>
         <functionName> FunName </functionName>
         <varTypes> M:Map </varTypes>
         requires notBool (name(localVar, substrString(#tokenToString(Var),1
                          ,lengthString(#tokenToString(Var)))) in keys(M))

    rule <k> checkSingleAssignmentInBlock(N:SymbolicValueRef, Var:LocalVar =
               phi Ty:Type Pl:PHIList InstM:InstructionMetadatas
               Ins:InstructionList BB:BBTerminatorInstruction, _:K, false) ~> K':K
         => .K </k>
          <output>... .List =>
             ListItem("error: non-phi instructions between the start of a basic block and the PHI instructions") </output>

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
         => typeCheckOp(N, name(localVar, substrString(#tokenToString(Var),1
                          ,lengthString(#tokenToString(Var)))), In)
             ~> checkSingleAssignmentInBlock(N, Ins BB, K
                      ~> assign(name(localVar, substrString(#tokenToString(Var),1
                          ,lengthString(#tokenToString(Var)))),instValToKItem(In)), false)
         ...</k>
         <currModule> ModName:SymbolicValueRef </currModule>
         <funModuleName> ModName </funModuleName>
         <currFunction> FunName:SymbolicValueRef </currFunction>
         <functionName> FunName </functionName>
         <varTypes> M:Map </varTypes>
         <localFunVarCounter> I:Int => I +Int 1 </localFunVarCounter>
         requires notBool (name(localVar, substrString(#tokenToString(Var),1
                          ,lengthString(#tokenToString(Var)))) in keys(M))
                         andBool getKLabel(In) =/=KLabel 'phiFun
              andBool getKLabel(In) =/=KLabel 'functionCall
              andBool String2Int(substrString(#tokenToString(Var),1
               ,lengthString(#tokenToString(Var)))) ==Int I

    rule <k> checkSingleAssignmentInBlock(N:SymbolicValueRef,
                      Var:LocalValID = Ca:OptTailCall
                        Ocv:OptCallingConv Rat:RetAttrs void
                     V1:ValueRef (Pl:ParamList) Fat:FuncAttrs
                       Meta:InstructionMetadatas
               Ins:InstructionList BB:BBTerminatorInstruction, K:K, _:Bool) ~> K:K
         =>  .K </k>
         <output>... .List => ListItem("error: instructions returning void cannot have a name") </output>


    rule <k>checkSingleAssignmentInBlock(N:SymbolicValueRef,
                      Var:LocalValID = Ca:OptTailCall
                        Ocv:OptCallingConv Rat:RetAttrs Ty1:NonVoidType
                     V1:ValueRef (Pl:ParamList) Fat:FuncAttrs
                       Meta:InstructionMetadatas
               Ins:InstructionList BB:BBTerminatorInstruction, K:K, _:Bool)
         => typeCheckOp(N, name(localVar, substrString(#tokenToString(Var),1
                          ,lengthString(#tokenToString(Var)))), Ca:OptTailCall
                        Ocv:OptCallingConv Rat:RetAttrs Ty1:NonVoidType
                     V1:ValueRef (Pl:ParamList) Fat:FuncAttrs
                       Meta:InstructionMetadatas)
             ~> checkSingleAssignmentInBlock(N, Ins BB, K
                      ~> assign(name(localVar, substrString(#tokenToString(Var),1
                          ,lengthString(#tokenToString(Var)))),
                      instValToKItem(Ca:OptTailCall
                        Ocv:OptCallingConv Rat:RetAttrs Ty1:NonVoidType
                     V1:ValueRef (Pl:ParamList) Fat:FuncAttrs
                       Meta:InstructionMetadatas)), false)
         ...</k>
         <currModule> ModName:SymbolicValueRef </currModule>
         <funModuleName> ModName </funModuleName>
         <currFunction> FunName:SymbolicValueRef </currFunction>
         <functionName> FunName </functionName>
         <varTypes> M:Map </varTypes>
         <localFunVarCounter> I:Int => I +Int 1 </localFunVarCounter>
         requires notBool (name(localVar, substrString(#tokenToString(Var),1
                          ,lengthString(#tokenToString(Var)))) in keys(M))
              andBool String2Int(substrString(#tokenToString(Var),1
               ,lengthString(#tokenToString(Var)))) ==Int I


    rule <k> checkSingleAssignmentInBlock(N:SymbolicValueRef, Var:LocalValID =
               phi Ty:Type Pl:PHIList InstM:InstructionMetadatas
               Ins:InstructionList BB:BBTerminatorInstruction, K:K, true)
         => typeCheckOp(N, name(localVar, substrString(#tokenToString(Var),1
                          ,lengthString(#tokenToString(Var)))),
                          phi Ty:Type Pl:PHIList InstM:InstructionMetadatas)
             ~> checkSingleAssignmentInBlock(N, Ins BB, K
                      ~> assign(name(localVar, substrString(#tokenToString(Var),1
                          ,lengthString(#tokenToString(Var)))),
                instValToKItem(phi Ty:Type Pl:PHIList InstM:InstructionMetadatas)), true)
         ...</k>
         <currModule> ModName:SymbolicValueRef </currModule>
         <funModuleName> ModName </funModuleName>
         <currFunction> FunName:SymbolicValueRef </currFunction>
         <functionName> FunName </functionName>
         <localFunVarCounter> I:Int => I +Int 1 </localFunVarCounter>
         <varTypes> M:Map </varTypes>
         requires notBool (name(localVar, substrString(#tokenToString(Var),1
                          ,lengthString(#tokenToString(Var)))) in keys(M))
               andBool String2Int(substrString(#tokenToString(Var),1
               ,lengthString(#tokenToString(Var)))) ==Int I


    rule <k> checkSingleAssignmentInBlock(N:SymbolicValueRef, Var:LocalValID =
               phi Ty:Type Pl:PHIList InstM:InstructionMetadatas
               Ins:InstructionList BB:BBTerminatorInstruction, K:K, false) ~> K:K
         => .K </k>
          <output>... .List =>
           ListItem("error: non-phi instructions between the start of a basic block and the PHI instructions") </output>

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
         => typeCheckOp(N, .K, store Ovl:OptVolatile
                  Ty1:Type V1:ValueRef, Ty2:Type V2:ValueRef, Al:Align
                    Inm:InstructionMetadatas)
             ~> checkSingleAssignmentInBlock(N, Ins BB, K
                      ~> instruction(store(addNameToString(Ty1)
                                           ,addNameToString(V1)
                                           ,operand(addNameToString(Ty2),addNameToString(V2)))
                                     ,formSet(Ovl) formSet(Al)
                                     ,insMetas(formElemList(Inm))), false)

    rule checkSingleAssignmentInBlock(N:SymbolicValueRef, store Ovl:OptVolatile
                  Ty1:Type V1:ValueRef, Ty2:Type V2:ValueRef
                    Inm:InstructionMetadatas Ins:InstructionList BB:BBTerminatorInstruction, K:K, _:Bool)
         => typeCheckOp(N, .K, store Ovl:OptVolatile
                         Ty1:Type V1:ValueRef, Ty2:Type V2:ValueRef
                          Inm:InstructionMetadatas)
             ~> checkSingleAssignmentInBlock(N, Ins BB, K
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
                                            Ty2:Type V2:ValueRef Ost:OptSingleThread Ord:Ordering, Al:Align
                                            Ins:InstructionMetadatas Ili:InstructionList
                                            BB:BBTerminatorInstruction, K:K, _:Bool)
          => typeCheckOp(N, .K, store Oac:Atomic Ovl:OptVolatile Ty1:Type V1:ValueRef ,
                                            Ty2:Type V2:ValueRef Ost:OptSingleThread Ord:Ordering, Al:Align
                                            Ins:InstructionMetadatas)
             ~> checkSingleAssignmentInBlock(N, Ili BB, K
                       ~> instruction(store(addNameToString(Ty1)
                                           ,addNameToString(V1)
                                           ,operand(addNameToString(Ty2),addNameToString(V2)))
                                      ,formSet(Oac) formSet(Ovl) formSet(Ost Ord) formSet(Al)
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
          => typeCheckOp(N, .K, fence Ost:OptSingleThread Ord:Ordering 
                                            Ins:InstructionMetadatas)
               ~> checkSingleAssignmentInBlock(N, Ili BB, K
                       ~> instruction(fence(ord)
                                      , formSet(Ost)
                                      , insMetas(formElemList(Ins))), false)


    rule <k> checkingPhisInEdges ...</k>
         <matchPhisWithInEdges> ListItem(phiEdges(A:K, S:Set)) => .List ...</matchPhisWithInEdges>
        <currModule> ModName:SymbolicValueRef </currModule>
        <funModuleName> ModName </funModuleName>
         <basicBlocks>... A |->
                 blockContent(_:K, _:Set, In:Set, _:Set, _:Set, _:Set) ...</basicBlocks>
        <currFunction> FunName:SymbolicValueRef </currFunction>
        <functionName> FunName </functionName>
        requires S <=Set In andBool In <=Set S

    rule <k> checkingPhisInEdges ~> K:K => .K </k>
         <output>... .List => ListItem("bad number of edges of a phi function.") </output>
         <matchPhisWithInEdges> ListItem(phiEdges(A:K, S:Set)) ...</matchPhisWithInEdges>
        <currModule> ModName:SymbolicValueRef </currModule>
        <funModuleName> ModName </funModuleName>
         <basicBlocks>... A |->
                 blockContent(_:K, _:Set, In:Set, _:Set, _:Set, _:Set) ...</basicBlocks>
        <currFunction> FunName:SymbolicValueRef </currFunction>
        <functionName> FunName </functionName>
        requires (notBool S <=Set In) orBool (notBool In <=Set S)

    rule <k> checkingPhisInEdges => .K ...</k>
         <matchPhisWithInEdges> .List </matchPhisWithInEdges>


    rule setArgsToBlockEnv(N:SymbolicValueRef, .ElemList) => .K
    rule <k> setArgsToBlockEnv(N:SymbolicValueRef,
                valValue(typeOperandResult(T:K, V:SymbolicValueRef)), E:ElemList)
             => setArgsToBlockEnv(N:SymbolicValueRef, E:ElemList) ...</k>
        <currModule> ModName:SymbolicValueRef </currModule>
        <funModuleName> ModName </funModuleName>
        <currFunction> FunName:SymbolicValueRef </currFunction>
        <functionName> FunName </functionName>
         <basicBlocks>... N |->
                 blockContent(_:K, _:Set, _:Set, Def:Set
                    (.Set => SetItem(operand(T, V))), _:Set, _:Set) ...</basicBlocks>
         <varTypes> M:Map (.Map => V |-> T) </varTypes>
        requires notBool V in keys(M) andBool notBool operand(T, V) in Def

    rule <k> setArgsToBlockEnv(N:SymbolicValueRef,
                valValue(typeOperandResult(T:K, V:SymbolicValueRef)), E:ElemList)
             => setArgsToBlockEnv(N:SymbolicValueRef, E:ElemList) ...</k>
        <currModule> ModName:SymbolicValueRef </currModule>
        <funModuleName> ModName </funModuleName>
        <currFunction> FunName:SymbolicValueRef </currFunction>
        <functionName> FunName </functionName>
         <basicBlocks>... N |->
                 blockContent(_:K, _:Set, _:Set, Def:Set
                    (.Set => SetItem(operand(T, V))), _:Set, _:Set) ...</basicBlocks>
         <varTypes> M:Map </varTypes>
        requires V in keys(M) andBool notBool operand(T, V) in Def

    rule <k> setArgsToBlockEnv(N:SymbolicValueRef,
                valValue(typeOperandResult(T:K, V:K)), E:ElemList) ~> K:K
             => .K </k>
        <currModule> ModName:SymbolicValueRef </currModule>
        <funModuleName> ModName </funModuleName>
        <currFunction> FunName:SymbolicValueRef </currFunction>
        <functionName> FunName </functionName>
         <output>... .List => ListItem("error: define argument '" +String
                         #tokenToString(V) +String "' twices in the function header") </output>
         <basicBlocks>... N |->
                 blockContent(_:K, _:Set, _:Set, Def:Set, _:Set, _:Set) ...</basicBlocks>
        requires operand(T, V) in Def


    //define checkSingleAssignment
    //bugs and ambiguity in the LLVM document about the numbered label value
    rule <k> checkSingleAssignment(.K)
               => setInEdges(keys(M)) ~> checkingPhisInEdges
                  ~> checkUseVarInPhi(getArgsInFunction(E))
                    ~> checkUseVars(getArgsInFunction(E)) ...</k>
        <currModule> ModName:SymbolicValueRef </currModule>
        <funModuleName> ModName </funModuleName>
         <basicBlocks> M:Map </basicBlocks>
        <currFunction> FunName:SymbolicValueRef </currFunction>
        <functionName> FunName </functionName>
        <formalParameters> arguments(E:ElemList) </formalParameters>

    rule <k> checkSingleAssignment(L:LabelStringConstant Ins:InstructionList
                                BB:BBTerminatorInstruction BBL:BasicBlockList)
         => setArgsToBlockEnv(addNameToString(L), getArgsInFunction(Args))
              ~> checkSingleAssignmentInBlock(addNameToString(L),Ins BB, .K, true)
           ~> checkSingleAssignment(BBL) ...</k>
        <currModule> ModName:SymbolicValueRef </currModule>
        <funModuleName> ModName </funModuleName>
         <basicBlocks> M':Map (.Map  => addNameToString(L)
              |-> blockContent(.K, .Set, .Set, SetItem(operand(label, addNameToString(L))), .Set, .Set)) </basicBlocks>
        <currFunction> FunName:SymbolicValueRef </currFunction>
        <functionName> FunName </functionName>
        <formalParameters> arguments(Args:ElemList) </formalParameters>
         <varTypes> M:Map (.Map =>  addNameToString(L) |-> label) </varTypes>
         requires notBool addNameToString(L) in keys(M)
                  andBool notBool isIntString(substrString(#tokenToString(L), 0
                                        , lengthString(#tokenToString(L)) -Int 1))

    rule <k> checkSingleAssignment(L:LabelStringConstant Ins:InstructionList
                                BB:BBTerminatorInstruction BBL:BasicBlockList) ~> K:K
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
                                BB:BBTerminatorInstruction BBL:BasicBlockList)
         => setArgsToBlockEnv(addNameToString(L), getArgsInFunction(Args))
              ~> checkSingleAssignmentInBlock(addNameToString(L),Ins BB, .K, true)
           ~> checkSingleAssignment(BBL) ...</k>
        <currModule> ModName:SymbolicValueRef </currModule>
        <funModuleName> ModName </funModuleName>
        <currFunction> FunName:SymbolicValueRef </currFunction>
        <functionName> FunName </functionName>
        <formalParameters> arguments(Args:ElemList) </formalParameters>
         <localFunVarCounter> I:Int => I +Int 1 </localFunVarCounter>
         <basicBlocks> M':Map (.Map  => addNameToString(L)
                         |-> blockContent(.K, .Set, .Set,
                            SetItem(operand(label, addNameToString(L))), .Set, .Set)) </basicBlocks>
         <varTypes> M:Map (.Map => addNameToString(L) |-> label) </varTypes>
         requires notBool addNameToString(L) in keys(M)
                  andBool isIntString(substrString(#tokenToString(L), 0
                                        , lengthString(#tokenToString(L)) -Int 1))
                  andBool  String2Int(substrString(#tokenToString(L),0
                                   ,lengthString(#tokenToString(L)) -Int 1)) ==Int I


    rule <k> checkSingleAssignment(L:LabelStringConstant Ins:InstructionList
                                BB:BBTerminatorInstruction BBL:BasicBlockList)
                   ~> K':K => .K </k>
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
                                BB:BBTerminatorInstruction)
           => setArgsToBlockEnv(addNameToString(L), getArgsInFunction(Args))
              ~> checkSingleAssignmentInBlock(addNameToString(L),Ins BB, .K, true)
                 ~> checkSingleAssignment(.K) ...</k>
        <currModule> ModName:SymbolicValueRef </currModule>
        <funModuleName> ModName </funModuleName>
        <currFunction> FunName:SymbolicValueRef </currFunction>
        <functionName> FunName </functionName>
        <formalParameters> arguments(Args:ElemList) </formalParameters>
         <basicBlocks> M':Map (.Map  => addNameToString(L)
                         |-> blockContent(.K, .Set, .Set,
                          SetItem(operand(label, addNameToString(L))), .Set, .Set)) </basicBlocks>
         <varTypes> M:Map ( .Map => addNameToString(L) |-> label) </varTypes>
         requires notBool addNameToString(L) in keys(M)
                  andBool notBool isIntString(substrString(#tokenToString(L), 0
                                        , lengthString(#tokenToString(L)) -Int 1))


    rule <k> checkSingleAssignment(L:LabelStringConstant Ins:InstructionList
                                BB:BBTerminatorInstruction)
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
                                BB:BBTerminatorInstruction)
           => setArgsToBlockEnv(addNameToString(L), getArgsInFunction(Args))
              ~> checkSingleAssignmentInBlock(addNameToString(L),Ins BB, .K, true)
                  ~> checkSingleAssignment(.K) ...</k>
        <currModule> ModName:SymbolicValueRef </currModule>
        <funModuleName> ModName </funModuleName>
        <formalParameters> arguments(Args:ElemList) </formalParameters>
        <currFunction> FunName:SymbolicValueRef </currFunction>
        <functionName> FunName </functionName>
         <basicBlocks> M':Map (.Map  => addNameToString(L)
                         |-> blockContent(.K, .Set, .Set,
                             SetItem(operand(label, addNameToString(L))), .Set, .Set)) </basicBlocks>
         <localFunVarCounter> I:Int => I +Int 1 </localFunVarCounter>
         <varTypes> M:Map ( .Map => addNameToString(L) |-> label) </varTypes>
         requires isIntString(substrString(#tokenToString(L), 0
                                        , lengthString(#tokenToString(L)) -Int 1))
                  andBool  String2Int(substrString(#tokenToString(L),0
                                   ,lengthString(#tokenToString(L)) -Int 1)) ==Int I
                  andBool notBool addNameToString(L) in keys(M)

    rule <k> checkSingleAssignment(L:LabelStringConstant Ins:InstructionList
                                BB:BBTerminatorInstruction)
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
                                BB:BBTerminatorInstruction BBL:BasicBlockList)
         => setArgsToBlockEnv(name(localVar, Int2String(I)), getArgsInFunction(Args))
              ~> checkSingleAssignmentInBlock(name(localVar, Int2String(I)), Ins BB, .K, true)
           ~> checkSingleAssignment(BBL)
         ...</k>
        <currModule> ModName:SymbolicValueRef </currModule>
        <funModuleName> ModName </funModuleName>
        <formalParameters> arguments(Args:ElemList) </formalParameters>
        <currFunction> FunName:SymbolicValueRef </currFunction>
        <functionName> FunName </functionName>
         <basicBlocks> M':Map (.Map  => name(localVar, Int2String(I))
                  |-> blockContent(.K, .Set, .Set,
                        SetItem(operand(label, name(localVar, Int2String(I)))), .Set, .Set)) </basicBlocks>
         <varTypes> M:Map (.Map => name(localVar, Int2String(I))  |-> label) </varTypes>
        <localFunVarCounter> I:Int => I +Int 1 </localFunVarCounter>
        requires notBool name(localVar, Int2String(I)) in keys(M)

    rule <k>checkSingleAssignment(Ins:InstructionList
                                BB:BBTerminatorInstruction BBL:BasicBlockList)
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
                                BB:BBTerminatorInstruction)
         => setArgsToBlockEnv(name(localVar, Int2String(I)), getArgsInFunction(Args))
              ~> checkSingleAssignmentInBlock(name(localVar, Int2String(I)), Ins BB, .K, true)
              ~> checkSingleAssignment(.K)
         ...</k>
        <currModule> ModName:SymbolicValueRef </currModule>
        <funModuleName> ModName </funModuleName>
        <currFunction> FunName:SymbolicValueRef </currFunction>
        <functionName> FunName </functionName>
        <formalParameters> arguments(Args:ElemList) </formalParameters>
         <basicBlocks> M':Map (.Map  => name(localVar, Int2String(I))
                |-> blockContent(.K, .Set, .Set,
                    SetItem(operand(label, name(localVar, Int2String(I)))), .Set, .Set)) </basicBlocks>
         <varTypes> M:Map (.Map => name(localVar, Int2String(I)) |-> label) </varTypes>
        <localFunVarCounter> I:Int => I +Int 1 </localFunVarCounter>
        requires notBool name(localVar, Int2String(I)) in keys(M)

    rule <k> checkSingleAssignment(Ins:InstructionList
                                BB:BBTerminatorInstruction)
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
