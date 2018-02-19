// 
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


    //helper processes for type check
    rule assignUses(Name:K, X:K, Ty:K, .ElemList) => .K
    rule <k> assignUses(Name:K, Count:Int, Ty:K, val(V1:K),E:ElemList)
           => assignUses(Name:K, Count:Int, Ty:K, E:ElemList) ...</k>
         <tempUses> Uses:Set (.Set => SetItem(varOp(Name, Count, Ty, V1))) </tempUses>
         requires isLocalVariable(V1)
    rule assignUses(Name:K, Count:Int, Ty:K, val(V1:K),E:ElemList)
           => assignUses(Name:K, Count:Int, Ty:K, E:ElemList)
         requires notBool isLocalVariable(V1)

    rule assignUsesInCall(Name:K, X:K, .ElemList) => .K
    rule <k> assignUsesInCall(Name:K, Count:Int,
              valValue(typedArg(S:Set, T:KResult, V1:K)),E:ElemList)
           => assignUsesInCall(Name:K, Count:Int, E:ElemList) ...</k>
         <tempUses> Uses:Set (.Set => SetItem(varOp(Name, Count, T, V1))) </tempUses>
         requires isLocalVariable(V1)
    rule assignUsesInCall(Name:K, Count:Int,
               valValue(typedArg(S:Set, T:KResult, V1:K)),E:ElemList)
           => assignUsesInCall(Name:K, Count:Int, E:ElemList)
         requires notBool isLocalVariable(V1)

    rule constExprType(A:KResult) => A
    rule exprType(K:KResult) => .K

    rule <k> badType ~> K => .K </k>
         <output>... .List => ListItem("error: expected type") </output>

    //type check functions
    syntax KItem ::= typeCheckOp(K, K, K) //block name, var name, op
                   | typeCheckIntOp(K, K, K, K, K, K, Set, InstructionMetadatas)    
                                 [strict(4)]//block name, var name, op, ty, v1, v2, attributes, instmeta
                   | typeCheckCastOp(K, K, K, K, K, K, InstructionMetadatas)
                                [strict(4, 6)]//block, variable, operator, T1, V, T2
                   | typeCheckArgList(K, ElemList)        [strict(2)]
                   | typeCheckSingleArg(K, K, K) //block t, arg
                   | typeCheckIntArgs(K, K, ElemList)
                   | typeCheckPointerArgs(K, K, ElemList)
                   | typeCheckVectorArgs(K, K, ElemList) //block, t, integer, terms
                   | preTypeCheckPointerExpr(K, K)
                   | typeCheckPointerExpr(K, K)
                   | typeCheckConstExpr(K, K)   [strict(1)]//type var
                   | typeCheckConstExprs(K, ElemList)   [strict(2)]//type, oprends
                   | typeMatch(K, K)            [strict] //type, type
                   | typeCheckExpr(K, K)//t, v
                   | preTypeCheckIntExpr(K, K)//type, var
                   | typeCheckIntExpr(K, K) //type, var
                   | typeCheckIntArg(K, K, K)//block, t, var
                   | preTypeCheckVectorArg(K, Int, K) //t, integer, terms
                   | typeCheckVectorArg(K, Int, K) //t, integer, terms
                   | typeCheckVectorArg(K, Int, K, K, K)  [strict(3)]
                                                //t, integer, type, value, terms
                   | typeCheckVectorAux(K, K) //t, terms
                   | typeCheckInGepList(K, K, ElemList)
                            //block, assign, addspace, current type, index list
                   | typeCheckInGepListAux(K, K, K, ElemList)
                            //block, assign, addspace, current type, value, index list
                   | typeCheckInGepListStruct(K, K, K, ElemList)
                            //block, assign, addspace, current type, value, index list
                   | typeCheckIntArg(K, K, K, K, K, K)    [strict(5)]
                   | typeCheckGepOp(K, K, K, K, K, ElemList, Set, InstructionMetadatas)
                             [strict(3,4,6)]//block, var, t, t*, v, (t,v)lists, mods, instmeta
                   | typeCheckAllocaOp(K, K, K, Int, K, K, K, Set, InstructionMetadatas)
                             [strict(3,5)]//block,var, t, addrspace, int-t, v, align
                   | typeCheckStore(K, K, K, K, K, K, Set, InstructionMetadatas)
                             [strict(2,4)]//block, t, v, pt, v, align, mods, instmeta
                   | typeCheckLoad(K, K, K, K, K, K, K, Set, InstructionMetadatas)
                             [strict(3,4)]//block, var, t, pt, v, align, atomic, mods, instmeta
                   | typeCheckIntArgList(K, ElemList)        [strict(2)]
                   | typeCheckGepArgList(K, ElemList)        [strict(2)]
                   | typeCheckGepArgListInNum(K, ElemList) //int number of vector, list of indexes
                   | TypeMatchFunctions(K, ElemList, ElemList)  [strict(2,3)]
                   | typeCheckBr(K, K, K, K, K, InstructionMetadatas)    [strict(2)]//block, t, ..., instmeta
                   | typeCheckICmp(K, K, K, K, K, K, InstructionMetadatas)
                              [strict(4)]//block, var, op, type, v1, v2, instmeta
                   | typeCheckFCmp(K, K, K, K, K, K, InstructionMetadatas)
                              [strict(4)]//block, var, op, type, v1, v2, instmeta
                   | typeCheckPhi(K, K, K, ElemList, ElemList, Set, ElemList, InstructionMetadatas)
                              [strict(3)]//block, var, type, value-list, label-list, phi-list, instmeta
                   | typeCheckRet(K, K, K, InstructionMetadatas)           [strict(2)]//block, t, v, Meta
                   | typeCheckCall(K, K, K, K, K, ElemList, ElemList, ParamList, Set, InstructionMetadatas)
                               [strict(4, 6, 7)]//block, var, op, t, name, argt, argv, args, mods, instmeta
                   | typeCheckSwitch(K, ElemList, ElemList, ElemList, InstructionMetadatas)
                                          [strict(2)]//block, argv, argl, stroed argl, instmeta
                   | typeCheckIndirectBr(K, K, K, ElemList, ElemList, InstructionMetadatas)
                                          [strict(2)]//block, type, argv, argl, instmeta
                   | typeCheckSelect(K, K, K, K, K, K, K, K, InstructionMetadatas)
                              [strict(3,5,7)]
                        //block,name type, value, firstT, firstV, secondT, secondV, instmeta
                   | typeCheckResume(K, K, K, InstructionMetadatas)    [strict(2)]
                             //block, type, value, instmeta


    //type check distribution function
    rule typeCheckOp(Name:SymbolicValueRef,X:SymbolicValueRef, IntOp:IntConstructors
                             Onw:OptNW Ty:Type V1:ValueRef,
                             V2:ValueRef Ins:InstructionMetadatas)
           => typeCheckIntOp(Name:SymbolicValueRef, X, IntOp, Ty,
                           addNameToString(V1), addNameToString(V2), formSet(Onw), Ins)
    rule typeCheckOp(Name:SymbolicValueRef,X:SymbolicValueRef, IntOp:DivConstructors
                             Onw:OptExact Ty:Type V1:ValueRef,
                             V2:ValueRef Ins:InstructionMetadatas)
           => typeCheckIntOp(Name:SymbolicValueRef, X, IntOp, Ty,
                           addNameToString(V1), addNameToString(V2), formSet(Onw), Ins)
    rule typeCheckOp(Name:SymbolicValueRef, X:SymbolicValueRef, L:ArithmeticOps Ty:Type V1:ValueRef,
                  V2:ValueRef Ins:InstructionMetadatas)
           => typeCheckIntOp(Name:SymbolicValueRef, X, L, Ty,
                           addNameToString(V1), addNameToString(V2), .Set, Ins)
    rule typeCheckOp(Name:SymbolicValueRef, X:SymbolicValueRef, L:LogicalOps Ty:Type V1:ValueRef,
                  V2:ValueRef Ins:InstructionMetadatas)
           => typeCheckIntOp(Name:SymbolicValueRef, X, L, Ty,
                           addNameToString(V1), addNameToString(V2), .Set, Ins)

    rule typeCheckOp(Name:SymbolicValueRef, X:SymbolicValueRef, Op:CastOps Ty1:Type V:ValueRef
                                            to Ty2:Type Ins:InstructionMetadatas)
           => typeCheckCastOp(Name:SymbolicValueRef, X, Op,
                                          Ty1, addNameToString(V), Ty2, Ins)

    rule typeCheckOp(Name:SymbolicValueRef, X:SymbolicValueRef,
                 getelementptr Oib:OptInBounds Ty:Type,
       'inRangeEmpty(.KList) Ty1:Type V1:ValueRef,
                                    Itr:ReturnedValGep Ins:InstructionMetadatas)
           => typeCheckGepOp(Name:SymbolicValueRef, X, Ty, Ty1,
                        addNameToString(V1), formTypeCheckList(Itr), formSet(Oib), Ins)

    rule <k> typeCheckOp(Name:SymbolicValueRef, X:SymbolicValueRef,
                 getelementptr Oib:OptInBounds Ty:Type, inrange Ty1:Type V1:ValueRef,
                                    Itr:ReturnedValGep Ins:InstructionMetadatas)
                 ~> K:K => .K </k>
         <output>... .List => ListItem("error: inrange flag is in the wrong place in getelementptr.") </output>

    rule <k> typeCheckOp(Name:SymbolicValueRef, X:SymbolicValueRef,
                 getelementptr Oib:OptInBounds Ty:Type ,
                    .ReturnedValGep Ins:InstructionMetadatas)
                 ~> K:K => .K </k>
         <output>... .List => ListItem("error: no reference target pointer for getelementptr.") </output>

    rule typeCheckOp(Name:SymbolicValueRef, X:SymbolicValueRef,
                         alloca Oil:OptInalloca Ty:Type
                           Oad:OptAddrSpace Ins:InstructionMetadatas)
           => typeCheckAllocaOp(Name:SymbolicValueRef, X,Ty, dealWithAddrSpace(Oad),
                                    integerType(32), 1, 1, formSet(Oil), Ins)
    rule typeCheckOp(Name:SymbolicValueRef, X:SymbolicValueRef,
                            alloca Oil:OptInalloca Ty:Type,
               align A:UnsignedInt Oad:OptAddrSpace Ins:InstructionMetadatas)
           => typeCheckAllocaOp(Name:SymbolicValueRef,
                               X,Ty, dealWithAddrSpace(Oad), integerType(32), 1,
                      adjustAlign(String2Int(#tokenToString(A))), formSet(Oil), Ins)
    rule typeCheckOp(Name:SymbolicValueRef, X:SymbolicValueRef,
                        alloca Oil:OptInalloca Ty:Type,
                           It:IntType V:ValueRef Oad:OptAddrSpace Ins:InstructionMetadatas)
           => typeCheckAllocaOp(Name:SymbolicValueRef, X,Ty,
               dealWithAddrSpace(Oad),It,
                          addNameToString(V), 1, formSet(Oil), Ins)
    rule typeCheckOp(Name:SymbolicValueRef, X:SymbolicValueRef,
               alloca Oil:OptInalloca Ty:Type, It:IntType V:ValueRef,
                                   align A:UnsignedInt Oad:OptAddrSpace Ins:InstructionMetadatas)
           => typeCheckAllocaOp(Name:SymbolicValueRef, X, Ty,dealWithAddrSpace(Oad), It,
            addNameToString(V), adjustAlign(String2Int(#tokenToString(A))), formSet(Oil), Ins)

    rule typeCheckOp(Name:SymbolicValueRef, K:K, store Ovl:OptVolatile
                  Ty1:Type V1:ValueRef, Ty2:Type V2:ValueRef, align I:UnsignedInt
                    Inm:InstructionMetadatas)
           => typeCheckStore(Name:SymbolicValueRef, Ty1:Type,
                addNameToString(V1), Ty2:Type, addNameToString(V2),
                    adjustAlign(String2Int(#tokenToString(I))), formSet(Ovl), Inm)
    rule typeCheckOp(Name:SymbolicValueRef, K:K, store Ovl:OptVolatile
                  Ty1:Type V1:ValueRef, Ty2:Type V2:ValueRef
                    Inm:InstructionMetadatas)
           => typeCheckStore(Name:SymbolicValueRef, Ty1:Type,
                      addNameToString(V1), Ty2:Type, addNameToString(V2), 1, formSet(Ovl), Inm)
    rule typeCheckOp(Name:SymbolicValueRef, K:K, store Oac:Atomic
                                                    Ovl:OptVolatile Ty1:Type V1:ValueRef,
                 Ty2:Type V2:ValueRef Ost:OptSingleThread Ord:Ordering,
                                          align I:UnsignedInt Ins:InstructionMetadatas)
           => typeCheckStore(Name:SymbolicValueRef, Ty1:Type,
                   addNameToString(V1), Ty2:Type, addNameToString(V2),
              adjustAlign(String2Int(#tokenToString(I))), formSet(Oac)
                          formSet(Ovl) formSet(Ost) formSet(Ord), Ins)

    rule typeCheckOp(Name:SymbolicValueRef,
              X:SymbolicValueRef, load Ovl:OptVolatile
                  Ty1:Type, Ty2:Type V2:ValueRef, align I:UnsignedInt
                    Inm:InstructionMetadatas)
           => typeCheckLoad(Name:SymbolicValueRef, X, Ty1:Type,
                                Ty2:Type, addNameToString(V2),
                  adjustAlign(String2Int(#tokenToString(I))), .K, formSet(Ovl), Inm)
    rule typeCheckOp(Name:SymbolicValueRef, X:SymbolicValueRef, load Ovl:OptVolatile
                  Ty1:Type, Ty2:Type V2:ValueRef
                    Inm:InstructionMetadatas)
           => typeCheckLoad(Name:SymbolicValueRef, X,
                           Ty1:Type, Ty2:Type, addNameToString(V2), 1, .K, formSet(Ovl), Inm)
    rule typeCheckOp(Name:SymbolicValueRef, X:SymbolicValueRef,
                                         load Oac:Atomic Ovl:OptVolatile Ty1:Type,
                 Ty2:Type V2:ValueRef Ost:OptSingleThread Ord:Ordering,
                                       align I:UnsignedInt Ins:InstructionMetadatas)
           => typeCheckLoad(Name:SymbolicValueRef, X, Ty1:Type,
                        Ty2:Type, addNameToString(V2),
                     adjustAlign(String2Int(#tokenToString(I))), Oac,
                       formSet(Oac) formSet(Ovl)
                           formSet(Ost:OptSingleThread) formSet(Ord:Ordering), Ins)
/*
    rule <k> typeCheckOp(Name:SymbolicValueRef, K:K, resume Ty:Type Va:ValueRef
                                    Meta:InstructionMetadatas)
           => typeCheckResume(Name:SymbolicValueRef, addNameToString(Ty), addNameToString(Va)) ...</k>
            <tempBlockInst> Now:K => Now ~> instruction(resume(operand(addNameToString(Ty)
                                   ,addNameToString(Va)))
                            ,.Set, insMetas(formElemList(Meta))) </tempBlockInst>
*/

    rule typeCheckOp(Name:SymbolicValueRef, K:K, br label La:ValueRef Meta:InstructionMetadatas)
           => typeCheckBr(Name:SymbolicValueRef, undef, undef, addNameToString(La), undef, Meta)


    rule typeCheckOp(Name:SymbolicValueRef, K:K, br It:IntType Va:ValueRef ,
                   label La1:ValueRef , label La2:ValueRef
                                  Meta:InstructionMetadatas)
           => typeCheckBr(Name:SymbolicValueRef, It,
               addNameToString(Va), addNameToString(La1), addNameToString(La2), Meta)

    rule typeCheckOp(Name:SymbolicValueRef, X:SymbolicValueRef, icmp Op:IPredicate
                   Ty:Type V1:ValueRef , V2:ValueRef Ins:InstructionMetadatas)
         => typeCheckICmp(Name:SymbolicValueRef, X, Op, Ty,
                   addNameToString(V1), addNameToString(V2), Ins)

    rule typeCheckOp(Name:SymbolicValueRef, X:SymbolicValueRef, fcmp Op:FPredicate
                   Ty:Type V1:ValueRef , V2:ValueRef Ins:InstructionMetadatas)
         => typeCheckFCmp(Name:SymbolicValueRef, X, Op, Ty,
                  addNameToString(V1), addNameToString(V2), Ins)
    rule typeCheckOp(Name:SymbolicValueRef, X:SymbolicValueRef,
                                     phi Ty:Type Pl:PHIList Ins:InstructionMetadatas)
         => typeCheckPhi(Name:SymbolicValueRef, X,
               Ty, getValueOfPhi(Pl), getLabelOfPhi(Pl), .Set, formElemList(Pl), Ins)

    rule typeCheckOp(Name:SymbolicValueRef, K:K,
                                     ret T:NonVoidType V:ValueRef I:InstructionMetadatas)
         => typeCheckRet(Name:SymbolicValueRef, T, addNameToString(V), I)
    rule typeCheckOp(Name:SymbolicValueRef, K:K,
                                     ret T:VoidType I:InstructionMetadatas)
         => typeCheckRet(Name:SymbolicValueRef, T, undef, I)

    rule typeCheckOp(Name:SymbolicValueRef, K:K,
                                     Ca:OptTailCall
                        Ocv:OptCallingConv Rat:RetAttrs Ty1:Type
                     V1:ValueRef (Pl:ParamList) Fat:FuncAttrs
                       Meta:InstructionMetadatas)
         => typeCheckCall(Name:SymbolicValueRef, K, Ca, Ty1,
                    addNameToString(V1), getAllTypes(Pl), formTypeCheckList(Pl),
                    Pl, formSet(Ocv) formSet(Rat) formSet(Fat), Meta)

    rule typeCheckOp(Name:SymbolicValueRef, K:K,
                                       switch It:IntType Va:ValueRef ,
                                       label La:ValueRef [ Ju:JumpTable ]
                                  Meta:InstructionMetadatas)
         => typeCheckSwitch(Name:SymbolicValueRef, (val(typeOperand(It,
                            addNameToString(Va))),getValueOfSwitch(Ju)),
                                (val(addNameToString(La)),getOutEdges(Ju)), .ElemList, Meta)

    rule typeCheckOp(Name:SymbolicValueRef, X:SymbolicValueRef,
                                       select Ty1:Type V1:ValueRef,
                                  Ty2:Type V2:ValueRef, Ty3:Type V3:ValueRef
                                  Meta:InstructionMetadatas)
         => typeCheckSelect(Name:SymbolicValueRef, X, Ty1,
                  addNameToString(V1), Ty2, addNameToString(V2), Ty3, addNameToString(V3), Meta)

    rule typeCheckOp(Name:SymbolicValueRef, K:K,
                                       indirectbr Ty:Type Va:ValueRef ,
                                       [ Las:LabelValues ]
                                  Meta:InstructionMetadatas)
         => typeCheckIndirectBr(Name:SymbolicValueRef, Ty,
                        addNameToString(Va), getOutEdges(Las), .ElemList, Meta)

    //type check the gep int list coordinated with the type
    rule singleGepTypeCheck(Name:K, X:K, Count, Ad:Int, T:KResult)
          => assignType(Name, X, Count, pointerTypeValue(T, Ad))

    rule typeCheckInGepList(Name:K, T:KResult, .ElemList) => T
    rule <k> typeCheckInGepList(Name:K, gepTypeBag(T:KResult), .ElemList)
           ~> K:K => .K </k>
         <output>... .List
           => ListItem("error: getelementptr op must have at least one index.") </output>
    rule <k> typeCheckInGepList(Name:K,  gepTypeBag(T:KResult), valValue(Q:K), Es:ElemList)
           ~> K:K => .K </k>
         <output>... .List
             => ListItem("error: cannot calculate on the index type in the getelmentptr op.") </output>
         requires notBool isAggregateType(T)
    rule <k> typeCheckInGepList(Name:K,  T:KResult,
           valValue(typeOperandGepVal(In:K, T':KResult, V:K)), Es:ElemList) ~> K:K
             => .K  </k>
         <output>... .List => ListItem("error: index must have integer type.") </output>
         requires isAggregateType(T) andBool notBool isIntegerType(T')

    rule typeCheckInGepList(Name:K,  gepTypeBag(T:KResult),
            valValue(typeOperandGepVal(.K, integerType(N:Int), V:K)), Es:ElemList)
          => exprType(typeCheckIntArgs(Name,
                     integerType(N), val(V),.ElemList))
                 ~> typeCheckInGepList(Name:K, T, Es)
    rule typeCheckInGepList(Name:K,  gepTypeBag(T:KResult),
            valValue(typeOperandGepVal(inrange, integerType(N:Int), V:K)), Es:ElemList)
          => exprType(typeCheckIntArgs(Name,
                     integerType(N), val(V),.ElemList))
                 ~> typeCheckInGepListAux(Name:K, T, getConstIntValue(V, N), Es)

    rule typeCheckInGepList(Name:K,
                 arrayTypeValue(T:KResult, I:Int),
                   valValue(typeOperandGepVal(.K, integerType(N:Int), V:K)), Es:ElemList)
             => exprType(typeCheckIntArgs(Name,
                     integerType(N), val(V),.ElemList))
                 ~> typeCheckInGepList(Name, T, Es)
    rule typeCheckInGepList(Name:K,
                 vectorTypeValue(T:KResult, I:Int),
                   valValue(typeOperandGepVal(.K, integerType(N:Int), V:K)), Es:ElemList)
             => exprType(typeCheckIntArgs(Name,
                     integerType(N), val(V),.ElemList))
                 ~> typeCheckInGepList(Name, T, Es)

    rule typeCheckInGepList(Name:K,
                 arrayTypeValue(T:KResult, I:Int), valValue(
              typeOperandGepVal(inrange, integerType(N:Int), V:K)), Es:ElemList)
             => exprType(typeCheckIntArgs(Name,
                     integerType(N), val(V),.ElemList))
                 ~> typeCheckInGepListAux(Name, T, getConstIntValue(V, N), Es)
    rule typeCheckInGepList(Name:K,
                 vectorTypeValue(T:KResult, I:Int), valValue(
           typeOperandGepVal(inrange, integerType(N:Int), V:K)), Es:ElemList)
             => exprType(typeCheckIntArgs(Name,
                     integerType(N), val(V),.ElemList))
                 ~> typeCheckInGepListAux(Name, T, getConstIntValue(V, N), Es)

    rule typeCheckInGepListAux(Name:K, gepTypeBag(T:KResult),
            V:Int, Es:ElemList) => typeCheckInGepList(Name, T, Es)
    rule typeCheckInGepListAux(Name:K, arrayTypeValue(T:KResult, I:Int),
            V:Int, Es:ElemList) => typeCheckInGepList(Name, T, Es)
         requires V >=Int 0 andBool V <Int I
    rule typeCheckInGepListAux(Name:K, vectorTypeValue(T:KResult, I:Int),
            V:Int, Es:ElemList) => typeCheckInGepList(Name, T, Es)
         requires V >=Int 0 andBool V <Int I

    rule <k> typeCheckInGepListAux(Name:K, T:KResult,
            badValue, Es:ElemList) ~> K:K => .K </k>
          <output>... .List =>
              ListItem("error: getelementptr inrange type index must be constant.") </output>
    rule <k> typeCheckInGepListAux(Name:K, arrayTypeValue(T:KResult, I:Int),
            V:Int, Es:ElemList) ~> K:K => .K </k>
          <output>... .List => ListItem("error: getelementptr inrange type index must be in the range of the array type.") </output>
            requires V <Int 0 andBool V >=Int I
    rule <k> typeCheckInGepListAux(Name:K, vectorTypeValue(T:KResult, I:Int),
            V:Int, Es:ElemList) ~> K:K => .K </k>
          <output>... .List => ListItem("error: getelementptr inrange type index must be in the range of the vector type.") </output>
            requires V <Int 0 andBool V >=Int I


    rule <k> typeCheckInGepList(Name:K, T:KResult,
                   valValue(typeOperandGepVal(In:K, integerType(N:Int), V:K)), Es:ElemList)
              ~> K:K => .K </k>
         <output>... .List =>
           ListItem("error: getelementptr structure type index must have i32 type.") </output>
         requires N =/=Int 32 andBool isStructType(T)

    rule typeCheckInGepList(Name:K,
                 structTypeValue(Ts:KResult),
                   valValue(typeOperandGepVal(In:K, integerType(32), V:K)), Es:ElemList)
             => exprType(typeCheckIntArgs(Name,
                     integerType(32), val(V),.ElemList))
                 ~> typeCheckInGepListStruct(Name, Ts,
                                     getConstIntValue(V, 32), Es)
    rule typeCheckInGepList(Name:K,
                 packedStructTypeValue(Ts:KResult),
                   valValue(typeOperandGepVal(In:K, integerType(32), V:K)), Es:ElemList)
             => exprType(typeCheckIntArgs(Name,
                     integerType(32), val(V),.ElemList))
                 ~> typeCheckInGepListStruct(Name, Ts,
                                     getConstIntValue(V, 32), Es)

    rule <k> typeCheckInGepListStruct(Name:K, T:KResult,
            badValue, Es:ElemList) ~> K:K => .K </k>
          <output>... .List =>
              ListItem("error: getelementptr structure type index must be constant.") </output>

    rule typeCheckInGepListStruct(Name:K, Ts:KResult, V:Int, Es:ElemList)
            => typeCheckInGepList(Name, getGepTypeInStruct(Ts, V), Es)
         requires getGepTypeInStruct(Ts, V) =/=K badType

    rule <k> typeCheckInGepListStruct(Name:K, Ts:KResult,
              V:Int, Es:ElemList) ~> K:K => .K </k>
          <output>... .List =>
              ListItem("error: getelementptr structure type index out of range.") </output>
         requires getGepTypeInStruct(Ts, V) ==K badType

    rule vectorGepTypeCheck(Name:K, X:K, Count:Int,
                              As:Int, T:K, Res:List, ListItem(Es:ElemList) L:List)
            => typeCheckInGepList(Name, gepTypeBag(T), Es)
                  ~> vectorGepTypeCheck(Name, X, Count, As, T, Res, L)
    rule T:KResult ~> vectorGepTypeCheck(Name:K,
                         X:K, Count:Int, As:Int, T':K, Res:List, L:List)
            => vectorGepTypeCheck(Name, X, Count, As, T', Res ListItem(T), L)

    rule vectorGepTypeCheck(Name:K,
                         X:K, Count:Int, Ad:Int, T:K, Res:List, .List)
           => assignType(Name, X, Count, vectorTypeValue(
                     pointerTypeValue(T, Ad), size(Res)))
         requires isAllSameType(Res)

    rule <k> vectorGepTypeCheck(Name:K,
          X:K, Count:Int, Ad:Int, T:K, Res:List, .List) ~> K:K => .K </k>
         <output>... .List =>
            ListItem("error: vector type sub indices do not match with each other.") </output>
         requires notBool isAllSameType(Res)

    //TODO: deal with other constant expr cases
    rule <k> typeCheckGepOp(Name:SymbolicValueRef, X:SymbolicValueRef,
                                T:KResult, pointerTypeValue(T, A:K), V:K,
                                  L:KResult, Mods:Set, Meta:InstructionMetadatas)
              => typeCheckSingleArg(Name, pointerTypeValue(T, A), V)
                  ~> (singleGepTypeCheck(Name, X, TheCount,A,
                           typeCheckInGepList(Name, gepTypeBag(T), L))
                 ~> assignUsesInCall(Name, X, valValue((typedArg(.Set,
                               pointerTypeValue(T, A:K), V:K))),toArgList(L)))
         ...</k>
        <instructionCounter> TheCount:Int => TheCount +Int 1 </instructionCounter>
        <tempBlockMap> Now:Map => Now (TheCount |->
              instNumInfo(TheCount, assign(X, instruction(getElementPtr(
                       pointerTypeValue(T, A:K), V, L), Mods getInrange(L)
                          , insMetas(formElemList(Meta)))), normalInst)) </tempBlockMap>
         requires notBool hasVectorInList(L)

    rule <k> typeCheckGepOp(Name:SymbolicValueRef, X:SymbolicValueRef,
                                T:KResult, pointerTypeValue(T, A:K),
                        V:K, L:KResult, Mods:Set, Meta:InstructionMetadatas)
              => typeCheckSingleArg(Name, pointerTypeValue(T, A), V)
             ~> (vectorGepTypeCheck(Name, X, TheCount,A, T, .List,
                 divideElemList(fulfillVector(L, getVectorNum(L)), .List))
                 ~> assignUsesInCall(Name, X, valValue((typedArg(.Set,
            pointerTypeValue(T, A:K), V:K))),toArgList(L))) ...</k>
        <instructionCounter> TheCount:Int => TheCount +Int 1 </instructionCounter>
        <tempBlockMap> Now:Map => Now (TheCount |->
              instNumInfo(TheCount, assign(X, instruction(getElementPtr(
             vectorTypeValue(pointerTypeValue(T, A:K), getVectorNum(L)),
                vector(copyOfElemList(pointerTypeValue(T, A:K),V,getVectorNum(L))),
            fulfillVector(L, getVectorNum(L))),
        Mods getInrange(L), insMetas(formElemList(Meta)))), normalInst)) </tempBlockMap>
         requires hasVectorInList(L) andBool getVectorNum(L) =/=K badType
                  andBool isSameVectorNum(L, getVectorNum(L))

    rule <k> typeCheckGepOp(Name:SymbolicValueRef, X:SymbolicValueRef,
                                T:KResult, pointerTypeValue(T, A:K),
            V:K, L:KResult, Mods:Set, Meta:InstructionMetadatas) ~> K:K </k>
         <output>... .List =>
            ListItem("error: vector type in getelementptr has no unique vector number.") </output>
         requires hasVectorInList(L) andBool notBool isSameVectorNum(L, getVectorNum(L))

    rule <k> typeCheckGepOp(Name:SymbolicValueRef, X:SymbolicValueRef, T:KResult,
                 vectorTypeValue(pointerTypeValue(T, A:K), N:Int),
                 V:K, L:KResult, Mods:Set, Meta:InstructionMetadatas)
              => typeCheckSingleArg(Name,
                       vectorTypeValue(pointerTypeValue(T, A:K), N), V)
              ~> (vectorGepTypeCheck(Name, X, TheCount,A, T, .List,
                 divideElemList(fulfillVector(L, N), .List))
                 ~> assignUsesInCall(Name, X, valValue((typedArg(.Set,
            vectorTypeValue(pointerTypeValue(T, A:K), N), V:K))),toArgList(L))) ...</k>
        <instructionCounter> TheCount:Int => TheCount +Int 1 </instructionCounter>
        <tempBlockMap> Now:Map => Now (TheCount |->
              instNumInfo(TheCount, assign(X, instruction(getElementPtr(
             vectorTypeValue(pointerTypeValue(T, A:K), N), V, fulfillVector(L, N)),
        Mods getInrange(L), insMetas(formElemList(Meta)))), normalInst)) </tempBlockMap>
        requires isSameVectorNum(L, N)

    rule <k> typeCheckGepOp(Name:SymbolicValueRef,
                    X:SymbolicValueRef, T:KResult, pointerTypeValue(T':KResult, A:K),
                      V:K, L:ElemList, _:Set, _:InstructionMetadatas)
             ~> K:K => .K </k>
         <output>... .List
            => ListItem("error: explicit pointee type doesn't match operand's pointee type") </output>
         requires T =/=K T'

    rule <k> typeCheckGepOp(Name:SymbolicValueRef,
                    X:SymbolicValueRef, T:KResult, vectorTypeValue(pointerTypeValue(T':KResult, A:K), N:K),
                    V:K, L:ElemList, _:Set, _:InstructionMetadatas)
             ~> K:K => .K </k>
         <output>... .List
           => ListItem("error: explicit pointee type doesn't match operand's pointee type") </output>
         requires T =/=K T'

    rule <k> typeCheckGepOp(Name:SymbolicValueRef, X:SymbolicValueRef, T:KResult,
                                    T':KResult, V:K, L:ElemList, _:Set, _:InstructionMetadatas)
             ~> K:K => .K </k>
         <output>... .List => ListItem("error: base of getelementptr must be a pointer or vector of pointers") </output>
         requires notBool isPointerType(T') andBool notBool isVectorType(T')

    rule <k> typeCheckGepOp(Name:SymbolicValueRef, X:SymbolicValueRef, T:KResult,
                           vectorTypeValue(T', N:K), V:K, L:ElemList, _:Set, _:InstructionMetadatas)
             ~> K:K => .K </k>
         <output>... .List => ListItem("error: base of getelementptr must be a pointer or vector of pointers") </output>
         requires notBool isPointerType(T')

    //deal with Select
    rule <k> typeCheckSelect(N:SymbolicValueRef, X:SymbolicValueRef,
                    integerType(1), V1:K, T1:KResult, V2:K,
                    T1:KResult, V3:K, Meta:InstructionMetadatas)
            => exprType(typeCheckIntArgs(N, integerType(1), val(V1:K),.ElemList))
               ~> (typeCheckSingleArg(N, T1, V2)
               ~> (typeCheckSingleArg(N, T1, V3)
               ~> (assignUses(N, TheCount, integerType(1), val(V1),.ElemList)
               ~> (assignUses(N, TheCount, T1, val(V2),val(V3),.ElemList)
               ~> assignType(N, TheCount, X, T1))))) ...</k>
        <instructionCounter> TheCount:Int => TheCount +Int 1 </instructionCounter>
        <tempBlockMap> Now:Map => Now (TheCount |->
              instNumInfo(TheCount, assign(X, instruction(select(integerType(1)
                                 ,V1 ,operand(T1,V2)
                                     ,operand(T1,V3))
              ,.Set ,insMetas(formElemList(Meta)))), normalInst)) </tempBlockMap>

     rule <k> typeCheckSelect(Name:SymbolicValueRef, X:SymbolicValueRef,
                  vectorTypeValue(integerType(1), N:Int), V1:K,
                 vectorTypeValue(T1:KResult, N:Int), V2:K,
                 vectorTypeValue(T1:KResult, N:Int), V3:K, Meta:InstructionMetadatas)
            => exprType(typeCheckVectorArgs(Name, vectorTypeValue(
                               integerType(1), N:Int), (val(V1:K),.ElemList)))
               ~> (exprType(typeCheckVectorArgs(Name, vectorTypeValue(
                                T1:KResult, N:Int), (val(V2),val(V3),.ElemList)))
               ~> (assignUses(Name, TheCount, vectorTypeValue(
                              integerType(1), N:Int), val(V1),.ElemList)
               ~> (assignUses(Name, TheCount, vectorTypeValue(
                           T1:KResult, N:Int), val(V2),val(V3),.ElemList)
               ~> assignType(Name, TheCount, X, vectorTypeValue(
                           T1:KResult, N:Int))))) ...</k>
        <instructionCounter> TheCount:Int => TheCount +Int 1 </instructionCounter>
        <tempBlockMap> Now:Map => Now (TheCount |->
              instNumInfo(TheCount,
                      assign(X, instruction(select(vectorTypeValue(integerType(1), N:Int)
                                 ,V1 ,operand(vectorTypeValue(T1:KResult, N:Int), V2)
                    ,operand(vectorTypeValue(T1:KResult, N:Int), V3))
                  ,.Set ,insMetas(formElemList(Meta)))), normalInst)) </tempBlockMap>

    rule <k> typeCheckSelect(Name:SymbolicValueRef, X:SymbolicValueRef,
                   integerType(A:Int), V1:K, T1:KResult, V2:K,
                   T1:KResult, V3:K, _:InstructionMetadatas)
                 ~> K:K => .K </k>
         <output>... .List => ListItem("error: select condition must be i1 or <n x i1>") </output>
         requires A =/=K 1

    rule <k> typeCheckSelect(Name:SymbolicValueRef, X:SymbolicValueRef,
                           vectorTypeValue(integerType(A:Int), N:Int)
                   , V1:K, T1:KResult, V2:K, T1:KResult, V3:K, _:InstructionMetadatas)
                 ~> K:K => .K </k>
         <output>... .List => ListItem("error: vector select condition element type must be i1") </output>
         requires A =/=K 1

    rule <k> typeCheckSelect(Name:SymbolicValueRef, X:SymbolicValueRef,
                T:KResult, V1:K, T1:KResult, V2:K, T2:KResult, V3:K, _:InstructionMetadatas)
                 ~> K:K => .K </k>
         <output>... .List => ListItem("error: both values to select must have same type") </output>
         requires T1 =/=K T2

    rule <k> typeCheckSelect(Name:SymbolicValueRef, X:SymbolicValueRef,
                  vectorTypeValue(integerType(1), N1:Int), V1:K,
                 vectorTypeValue(T1:KResult, N:Int), V2:K,
                 vectorTypeValue(T2:KResult, N':Int), V3:K, _:InstructionMetadatas)
                 ~> K:K => .K </k>
         <output>... .List => ListItem("error: vector select requires selected vectors to have the same vector length as select condition") </output>
         requires N1 =/=K N orBool N =/=K N'

    rule <k> typeCheckSelect(Name:SymbolicValueRef, X:SymbolicValueRef,
                 T:KResult, V1:K, T1:KResult, V2:K,
                 T1:KResult, V3:K, _:InstructionMetadatas)
                 ~> K:K => .K </k>
         <output>... .List => ListItem("error: select condition must be i1 or <n x i1>") </output>
         requires getKLabel(T) =/=KLabel 'integerType andBool getKLabel(T) =/=KLabel 'vectorTypeValue

    //deal with type of alloca
    rule <k> typeCheckAllocaOp(Name:SymbolicValueRef, X:SymbolicValueRef,
                 T:KResult, Ad:Int, integerType(I:Int), V:K, Align:Int,
                 Mods:Set, Meta:InstructionMetadatas)
              => exprType(typeCheckIntArgs(Name:SymbolicValueRef,
                     integerType(I:Int), val(V),.ElemList))
                 ~> assignUses(Name, TheCount,
                       integerType(I:Int), (val(V),.ElemList))
                     ~> assignType(Name,TheCount, X, pointerTypeValue(T, Ad))
         ...</k>
         <instructionCounter> TheCount:Int => TheCount +Int 1 </instructionCounter>
        <tempBlockMap> Now:Map => Now (TheCount |->
              instNumInfo(TheCount, assign(X, instruction(
                  alloca(T,preAlloca(integerType(I:Int), V), Align, false),
                       Mods, insMetas(formElemList(Meta)))), allocaInst)) </tempBlockMap>
         requires isValidAlign(Align)

    rule <k> typeCheckAllocaOp(Name:SymbolicValueRef, X:SymbolicValueRef,
                T:KResult,Ad:Int, T':KResult, V:K, Align:Int, _:Set,
                _:InstructionMetadatas) ~> K:K => .K </k>
         <output>... .List => ListItem("error: element count must have integer type") </output>
         requires getKLabel(T') =/=KLabel 'integerType

    rule <k> typeCheckAllocaOp(Name:SymbolicValueRef, X:SymbolicValueRef,
                T:KResult,Ad:Int, T':KResult, V:K, Align:Int, _:Set,
                _:InstructionMetadatas) ~> K:K => .K </k>
         <output>... .List => ListItem("error: alignment is not a power of two") </output>
         requires notBool isValidAlign(Align)

    //deal with type of load
    rule <k> typeCheckLoad(Name:SymbolicValueRef, X:SymbolicValueRef, T:KResult,
                     pointerTypeValue(T:KResult, A:K), V2:K,
                            Align:Int, At:K, Mods:Set, Meta:InstructionMetadatas)
              => typeCheckSingleArg(Name, pointerTypeValue(T:KResult, A:K), V2)
                 ~> (assignUses(Name, TheCount,
                      pointerTypeValue(T:KResult, A:K), (val(V2),.ElemList))
                 ~> assignType(Name,TheCount, X, T)) ...</k>
        <instructionCounter> TheCount:Int => TheCount +Int 1 </instructionCounter>
        <tempBlockMap> Now:Map => Now (TheCount |->
              instNumInfo(TheCount,assign(X,
                   instruction(load(pointerTypeValue(T:KResult, A:K),
           V2, Align), Mods, insMetas(formElemList(Meta)))),loadInst)) </tempBlockMap>
         requires isValidAlign(Align) andBool At =/=K atomic

    rule <k> typeCheckLoad(Name:SymbolicValueRef, X:SymbolicValueRef, integerType(N:Int),
                     pointerTypeValue(integerType(N:Int), A:K), V2:K,
                           Align:Int, atomic, Mods:Set, Meta:InstructionMetadatas)
              => typeCheckSingleArg(Name,
                         pointerTypeValue(integerType(N:Int), A:K), V2)
                 ~> (assignUses(Name, TheCount,
                      pointerTypeValue(integerType(N:Int), A:K), (val(V2),.ElemList))
                 ~> assignType(Name,TheCount, X, integerType(N:Int))) ...</k>
        <instructionCounter> TheCount:Int => TheCount +Int 1 </instructionCounter>
        <tempBlockMap> Now:Map => Now (TheCount |->
              instNumInfo(TheCount,assign(X, instruction(
                 load(pointerTypeValue(integerType(N:Int), A:K),
                   V2, Align) ,Mods ,insMetas(formElemList(Meta)))),loadInst)) </tempBlockMap>
         requires isValidAlign(Align) andBool isPowOfTwo(N, 8)
                  andBool notBool release in Mods
                  andBool notBool acq_rel in Mods
                  andBool Align >=Int sizeof(integerType(N:Int))

    rule <k> typeCheckLoad(Name:SymbolicValueRef, X:SymbolicValueRef, T:KResult,
                     pointerTypeValue(T:KResult, A:K), V2:K,
                           Align:Int, atomic, Mods:Set, Meta:InstructionMetadatas)
              => typeCheckSingleArg(Name,
                         pointerTypeValue(T:KResult, A:K), V2)
                 ~> (assignUses(Name, TheCount,
                      pointerTypeValue(T:KResult, A:K), (val(V2),.ElemList))
                 ~> assignType(Name,TheCount, X, T)) ...</k>
        <instructionCounter> TheCount:Int => TheCount +Int 1 </instructionCounter>
        <tempBlockMap> Now:Map => Now (TheCount |->
              instNumInfo(TheCount,assign(X,
                  instruction(load(pointerTypeValue(T:KResult, A:K),
               V2, Align) ,Mods ,insMetas(formElemList(Meta)))),loadInst)) </tempBlockMap>
         requires isValidAlign(Align) andBool (isFloatType(T) orBool isPointerType(T))
                  andBool notBool release in Mods
                  andBool notBool acq_rel in Mods
                  andBool Align >=Int sizeof(T)

    rule <k> typeCheckLoad(Name:SymbolicValueRef, X:K, T:KResult,
                     pointerTypeValue(T:KResult, A:K), V2:K,
                     Align:Int, atomic, _:Set, _:InstructionMetadatas) ~> K:K => .K </k>
         <output>... .List => ListItem("error: atomic load must have simple type either int, float or pointer.") </output>
         requires notBool isIntegerType(T) andBool notBool isFloatType(T)
                  andBool notBool isPointerType(T)

    rule <k> typeCheckLoad(Name:SymbolicValueRef, X:K, integerType(N:Int),
                     pointerTypeValue(integerType(N:Int), A:K), V2:K,
                      Align:Int, atomic, _:Set, _:InstructionMetadatas) ~> K:K => .K </k>
         <output>... .List => ListItem("error: atomic load must have integer type that greater than 8 bits and is power of two.") </output>
         requires notBool isPowOfTwo(N, 8)

    rule <k> typeCheckLoad(Name:SymbolicValueRef, X:K, integerType(N:Int),
                     pointerTypeValue(integerType(N:Int), A:K), V2:K,
                      Align:Int, atomic, Mods:Set, _:InstructionMetadatas) ~> K:K => .K </k>
         <output>... .List => ListItem("error: atomic load cannot use Release ordering.") </output>
         requires release in Mods orBool acq_rel in Mods

    rule <k> typeCheckLoad(Name:SymbolicValueRef, X:K, T,
                     pointerTypeValue(T:K, A:K), V2:K,
                      Align:Int, atomic, Mods:Set, _:InstructionMetadatas) ~> K:K => .K </k>
         <output>... .List => ListItem("error: atomic load must have aligment greater than the byte size of the pointee type.") </output>
         requires Align <Int sizeof(T)

    rule <k> typeCheckLoad(Name:SymbolicValueRef, X:K, T:KResult,
                     pointerTypeValue(T':KResult, A:K), V2:K,
                     Align:Int, At:K, _:Set, _:InstructionMetadatas) ~> K:K => .K </k>
         <output>... .List => ListItem("error: stored value and pointer type do not match") </output>
         requires T =/=K T'

    rule <k> typeCheckLoad(Name:SymbolicValueRef, X:K, T:KResult,
                     T':KResult, V2:K, Align:Int,
                     At:K, _:Set, _:InstructionMetadatas) ~> K:K => .K </k>
         <output>... .List => ListItem("error: store operand must be a pointer") </output>
         requires isPointerType(T')

    rule <k> typeCheckLoad(Name:SymbolicValueRef, X:K, T:KResult, T':KResult,
                             V:K, Align:Int, At:K, _:Set, _:InstructionMetadatas)
             ~> K:K => .K </k>
         <output>... .List => ListItem("error: alignment is not a power of two") </output>
         requires notBool isValidAlign(Align)

    //deal with type of store
    rule <k> typeCheckStore(Name:SymbolicValueRef, T:KResult, V1:K,
                     pointerTypeValue(T:KResult, A:K), V2:K, Align:Int,
                     Mods:Set, Meta:InstructionMetadatas)
              => typeCheckSingleArg(Name:SymbolicValueRef, T, V1)
                 ~> (typeCheckSingleArg(Name:SymbolicValueRef,
                             pointerTypeValue(T:KResult, A:K), V2)
                 ~> (assignUses(Name, TheCount, T, (val(V1),.ElemList))
                 ~> assignUses(Name, TheCount, pointerTypeValue(T:KResult, A:K),
                           (val(V2),.ElemList))))
         ...</k>
        <instructionCounter> TheCount:Int => TheCount +Int 1 </instructionCounter>
        <tempBlockMap> Now:Map => Now (TheCount |->
              instNumInfo(TheCount, noAssign(
                  instruction(store(T, V1 ,pointerTypeValue(T:KResult, A:K), V2, Align),
                       Mods, insMetas(formElemList(Meta)))),storeInst)) </tempBlockMap>
         requires isValidAlign(Align) andBool notBool (atomic in Mods)

    rule <k> typeCheckStore(Name:SymbolicValueRef, T:KResult, V1:K,
                     pointerTypeValue(T:KResult, A:K), V2:K,
                          Align:Int, Mods:Set, Meta:InstructionMetadatas)
              => typeCheckSingleArg(Name:SymbolicValueRef, T, V1)
                 ~> (typeCheckSingleArg(Name:SymbolicValueRef,
                             pointerTypeValue(T:KResult, A:K), V2)
                 ~> (assignUses(Name, TheCount, T, (val(V1),.ElemList))
                 ~> assignUses(Name, TheCount, pointerTypeValue(T:KResult, A:K),
                           (val(V2),.ElemList))))
         ...</k>
        <instructionCounter> TheCount:Int => TheCount +Int 1 </instructionCounter>
        <tempBlockMap> Now:Map => Now (TheCount |->
              instNumInfo(TheCount, noAssign(instruction(store(T:KResult, V1,
                      pointerTypeValue(T:KResult, A:K), V2, Align),
                       Mods, insMetas(formElemList(Meta)))),
                 storeInst)) </tempBlockMap>
         requires isValidAlign(Align) andBool (isFloatType(T) orBool isPointerType(T))
                  andBool notBool acquire in Mods
                  andBool notBool acq_rel in Mods andBool (atomic in Mods)
                  andBool Align >=Int sizeof(T)

    rule <k> typeCheckStore(Name:SymbolicValueRef, integerType(N:Int), V1:K,
                     pointerTypeValue(integerType(N:Int), A:K), V2:K,
                          Align:Int, Mods:Set, Meta:InstructionMetadatas)
              => typeCheckSingleArg(Name:SymbolicValueRef, integerType(N:Int), V1)
                 ~> (typeCheckSingleArg(Name:SymbolicValueRef,
                             pointerTypeValue(integerType(N:Int), A:K), V2)
                 ~> (assignUses(Name, TheCount, integerType(N:Int), (val(V1),.ElemList))
                 ~> assignUses(Name, TheCount, pointerTypeValue(integerType(N:Int), A:K),
                           (val(V2),.ElemList))))
         ...</k>
        <instructionCounter> TheCount:Int => TheCount +Int 1 </instructionCounter>
        <tempBlockMap> Now:Map => Now (TheCount |->
              instNumInfo(TheCount, noAssign(instruction(store(integerType(N:Int), V1,
                    pointerTypeValue(integerType(N:Int), A:K), V2, Align),
                       Mods, insMetas(formElemList(Meta)))),
                 storeInst)) </tempBlockMap>
         requires isValidAlign(Align) andBool isPowOfTwo(N, 8)
                  andBool notBool acquire in Mods
                  andBool notBool acq_rel in Mods andBool (atomic in Mods)
                  andBool Align >=Int sizeof(integerType(N:Int))

    rule <k> typeCheckStore(Name:SymbolicValueRef, T:KResult, V1:K,
                     pointerTypeValue(T:KResult, A:K), V2:K, Align:Int,
                 Mods:Set, _:InstructionMetadatas) ~> K:K => .K </k>
         <output>... .List => ListItem("error: atomic store must have simple type that greater than 8 bits.") </output>
         requires notBool isIntegerType(T) andBool notBool isFloatType(T)
                  andBool notBool isPointerType(T) andBool atomic in Mods

    rule <k> typeCheckStore(Name:SymbolicValueRef, integerType(N:Int), V1:K,
                     pointerTypeValue(integerType(N:Int), A:K), V2:K, Align:Int,
                     Mods:Set, _:InstructionMetadatas) ~> K:K => .K </k>
         <output>... .List => ListItem("error: integer atomic store must have integer type that greater than 8 bits and power of two.") </output>
         requires notBool isPowOfTwo(N, 8) andBool atomic in Mods

    rule <k> typeCheckStore(Name:SymbolicValueRef, T:KResult, V1:K,
                     pointerTypeValue(T:KResult, A:K), V2:K, Align:Int,
                     Mods:Set, _:InstructionMetadatas) ~> K:K => .K </k>
         <output>... .List => ListItem("error: atomic store cannot use Acquire ordering.") </output>
         requires (acquire in Mods orBool acq_rel in Mods) andBool atomic in Mods

    rule <k> typeCheckStore(Name:SymbolicValueRef, T:KResult, V1:K,
                     pointerTypeValue(T':KResult, A:K), V2:K, Align:Int,
                    _:Set, _:InstructionMetadatas) ~> K:K => .K </k>
         <output>... .List => ListItem("error: stored value and pointer type do not match") </output>
         requires T =/=K T'

    rule <k> typeCheckStore(Name:SymbolicValueRef, T:KResult, V1:K,
             T':KResult, V2:K, Align:Int, _:Set, _:InstructionMetadatas) ~> K:K => .K </k>
         <output>... .List => ListItem("error: store operand must be a pointer") </output>
         requires getKLabel(T') =/=KLabel 'pointerTypeValue

    rule <k> typeCheckStore(Name:SymbolicValueRef, X:SymbolicValueRef, T:KResult, T':KResult, V:K,
             Align:Int, _:Set, _:InstructionMetadatas) ~> K:K => .K </k>
         <output>... .List => ListItem("error: alignment is not a valid number.") </output>
         requires notBool isValidAlign(Align)

    rule <k> typeCheckStore(Name:SymbolicValueRef, X:SymbolicValueRef, T:KResult, T':KResult, V:K,
             Align:Int, Mods:Set, _:InstructionMetadatas) ~> K:K => .K </k>
         <output>... .List => ListItem("error: alignment must greater than the size of pointee if the store is an atomic store.") </output>
         requires isValidAlign(Align) andBool atomic in Mods
                  andBool Align <Int sizeof(T)

    //deal with phi of type check
    //there is a big bug in the implementaton of phi function
    //TODO: from LLVM documentation, it is legal to associate two label values together.
    //so we can branch to a label value with two different blocks. 
    //hence, this is a undefined behavior for what it will goto in this case.
    //clang doesnt this behavior

    rule <k> (.K => exprType(typeCheckExpr(T, V))
               ~> assignUses(Name, TheCount, T, (val(V),.ElemList)))
             ~> typeCheckPhi(Name:SymbolicValueRef, X:SymbolicValueRef, T:KResult,
                  (val(V:K), E1:ElemList => E1),
                     _:ElemList, _:Set, _:ElemList, _:InstructionMetadatas)
            ...</k>
        <instructionCounter> TheCount:Int </instructionCounter>

    rule <k> typeCheckPhi(Name:SymbolicValueRef, X:SymbolicValueRef,
              T:KResult, E1:ElemList, val(name(localVar, S:String)),
                     L:ElemList, InSet:Set, Es:ElemList, Meta:InstructionMetadatas)
             => checkUseVarInside(Name, label, name(localVar, S:String))
               ~> assignUses(Name, TheCount, label,
                      (val(name(localVar, S:String)),.ElemList))
            ~> typeCheckPhi(Name:SymbolicValueRef, X:SymbolicValueRef,
              T:KResult, E1:ElemList, L, SetItem(name(localVar, S:String))
                       InSet:Set, Es:ElemList, Meta:InstructionMetadatas)
         ...</k>
        <instructionCounter> TheCount:Int </instructionCounter>
        requires notBool name(localVar, S:String) in InSet

    rule <k> typeCheckPhi(Name:SymbolicValueRef, X:SymbolicValueRef,
             T:KResult, .ElemList, .ElemList, InSet:Set,
             Es:ElemList, Meta:InstructionMetadatas)
                    => assignType(Name, TheCount, X, T) ...</k>
         <matchPhisWithInEdges>... (.List => ListItem(phiEdges(Name, InSet))) </matchPhisWithInEdges>
        <instructionCounter> TheCount:Int => TheCount +Int 1 </instructionCounter>
        <tempBlockMap> Now:Map => Now (TheCount |->
              instNumInfo(TheCount, assign(X, instruction(phi(T, Es),.Set
                          ,insMetas(formElemList(Meta)))), phiInst)) </tempBlockMap>

    rule <k> typeCheckPhi(Name:SymbolicValueRef, name(localVar, S:String),
              T:KResult, E1:ElemList, val(Y:SymbolicValueRef),
                L:ElemList, InSet:Set, _:ElemList, _:InstructionMetadatas) ~> K:K
                => .K </k>
         <output>... .List 
                => ListItem("error: not a well form program because defining a edge twice in a phi function '%"
                      +String S +String "'") </output>
         requires Y in InSet

    rule <k> typeCheckPhi(Name:SymbolicValueRef, X:SymbolicValueRef,
             T:KResult, E1:ElemList, val(name(A:K, S:String)),
             L:ElemList, InSet:Set, _:ElemList, _:InstructionMetadatas) ~> K:K
                => .K </k>
         <output>... .List => ListItem("error: use of undefined value '%"
                               +String S +String "'") </output>
         requires A =/=K localVar

    rule <k> typeCheckPhi(Name:SymbolicValueRef,
               X:SymbolicValueRef, T:KResult, E1:ElemList
               , val(K:K), L:ElemList,
             InSet:Set, _:ElemList, _:InstructionMetadatas) ~> K':K => .K </k>
         <output>... .List => ListItem("error: '" +String #tokenToString(K)
                               +String "' is not a basic block") </output>
         requires getKLabel(K) =/=KLabel 'name

    //type check braching ops.
    rule <k> typeCheckBr(Name:SymbolicValueRef, undef,
                   _:K, A:SymbolicValueRef, _:K, Meta:InstructionMetadatas)
              => checkUseVarInside(Name, label, A)
                 ~> assignUses(Name, TheCount,
                       label, (val(A),.ElemList)) ...</k>
         <currModule> ModName:SymbolicValueRef </currModule>
        <instructionCounter> TheCount:Int => TheCount +Int 1 </instructionCounter>
         <funModuleName> ModName </funModuleName>
         <currFunction> FunName:SymbolicValueRef </currFunction>
         <functionName> FunName </functionName>
        <tempBlockMap> Now:Map => Now (TheCount |->
             instNumInfo(TheCount, noAssign(instruction(unconditional(A),.Set
                                  ,insMetas(formElemList(Meta)))), terminators)) </tempBlockMap>
         requires isLocalVariable(A)

    rule <k> typeCheckBr(Name:SymbolicValueRef, undef,
                   _:K, A:K, _:K, Meta:InstructionMetadatas) ~> K:K => .K </k>
         <output>... .List => ListItem("error: branching label must be a basic block name.") </output>
         requires notBool isLocalVariable(A)

    rule <k> typeCheckBr(Name:SymbolicValueRef, integerType(1),
                   _:K, A:K, B:K, Meta:InstructionMetadatas) ~> K:K => .K </k>
         <output>... .List => ListItem("error: branching label must be a basic block name.") </output>
         requires (notBool isLocalVariable(A)) orBool (notBool isLocalVariable(B))

    rule <k> typeCheckBr(Name:SymbolicValueRef,
             integerType(1), A:K, L1:SymbolicValueRef,
                     L2:SymbolicValueRef, Meta:InstructionMetadatas)
                 => exprType(typeCheckIntArgs(Name, integerType(1), val(A),.ElemList))
                   ~> (checkUseVarInside(Name, label, L1)
                    ~> (checkUseVarInside(Name, label, L2)
                    ~> (assignUses(Name, TheCount,
                       integerType(1), (val(A),.ElemList))
                    ~> assignUses(Name, TheCount,
                       label, (val(L1),val(L2),.ElemList))))) ...</k>
         <currModule> ModName:SymbolicValueRef </currModule>
         <funModuleName> ModName </funModuleName>
         <currFunction> FunName:SymbolicValueRef </currFunction>
         <functionName> FunName </functionName>
        <instructionCounter> TheCount:Int => TheCount +Int 1 </instructionCounter>
        <tempBlockMap> Now:Map => Now (TheCount |->
             instNumInfo(TheCount, noAssign(instruction(conditional(operand(integerType(1),A), L1, L2),.Set,
                             insMetas(formElemList(Meta)))), terminators)) </tempBlockMap>
         requires (isLocalVariable(L1)) andBool (isLocalVariable(L2))

    rule <k> typeCheckBr(Name:SymbolicValueRef,
            integerType(N:Int), A:K, L1:K, L2:K, _:InstructionMetadatas) ~> K:K => .K </k>
         <output>... .List => ListItem("error: branch condition must have 'i1' type") </output>
         requires N =/=Int 1

    rule <k> typeCheckBr(Name:SymbolicValueRef,
            T:K, A:K, L1:K, L2:K, _:InstructionMetadatas) ~> K:K => .K </k>
         <output>... .List => ListItem("error: branch condition must have 'i1' type") </output>
         requires T =/=K undef andBool getKLabel(T) =/=KLabel 'integerType

    //deal with calls
    rule typeCheckArgList(Name:SymbolicValueRef, .ElemList) => .K
    rule typeCheckArgList(Name:SymbolicValueRef,
                         valValue(typeOperandResult(T:KResult, V:K)),Vs:ElemList)
                    => typeCheckSingleArg(Name:SymbolicValueRef, T, V)
                                ~> typeCheckArgList(Name:SymbolicValueRef, Vs)

    rule TypeMatchFunctions(A:K, .ElemList, .ElemList) => .K
    rule TypeMatchFunctions(A:K, valValue(T:KResult), E:ElemList, valValue(T:KResult), E':ElemList)
             => TypeMatchFunctions(A, E, E')
    rule <k> TypeMatchFunctions(name(globalVar, S:String),
                               valValue(T:KResult), E:ElemList, valValue(T':KResult), E':ElemList)
          ~> K:K => .K </k>
         <output>... .List => ListItem("error: invalid forward reference to function '@"
                                   +String S +String"' with wrong type!") </output>
         requires T =/=K T'
    rule <k> TypeMatchFunctions(name(globalVar, S:String),
                     valValue(T:KResult), E:ElemList, .ElemList) ~> K:K => .K </k>
         <output>... .List => ListItem("error: invalid forward reference to function '@"
                                   +String S +String"' with wrong type!") </output>
    rule <k> TypeMatchFunctions(name(globalVar, S:String),
              .ElemList, valValue(T':KResult), E':ElemList) ~> K:K => .K </k>
         <output>... .List => ListItem("error: invalid forward reference to function '@"
                                   +String S +String"' with wrong type!") </output>

    rule <k> typeCheckCall(Name:SymbolicValueRef, .K, Ca:OptTailCall, void,
             V1:SymbolicValueRef, Ts:KResult, Tv:KResult,
             Arg:ParamList, Mods:Set, Meta:InstructionMetadatas)
        => TypeMatchFunctions(V1, Ts, getAllTypes(Ts'))
              ~> typeCheckArgList(Name, Tv)
              ~> assignUsesInCall(Name, TheCount, formArgList(Tv,Arg)) ...</k>
        <currModule> ModName:SymbolicValueRef </currModule>
        <funModuleName> ModName </funModuleName>
        <formalParameters> arguments(Ts':ElemList) </formalParameters>
        <functionName> V1 </functionName>
        <instructionCounter> TheCount:Int => TheCount +Int 1 </instructionCounter>
        <tempBlockMap> Now:Map => Now (TheCount |->
             instNumInfo(TheCount, noAssign(instruction(getKLabelFromOp(Ca)(void,, callee(V1,
                           arguments(formArgList(Tv,Arg)))),
              Mods, insMetas(formElemList(Meta)))), callInst)) </tempBlockMap>

    rule <k> typeCheckCall(Name:SymbolicValueRef, A:SymbolicValueRef, Ca:OptTailCall,
             T:TypeResult, V1:SymbolicValueRef, Ts:KResult, Tv:KResult,
             Arg:ParamList, Mods:Set, Meta:InstructionMetadatas)
        => TypeMatchFunctions(V1, Ts, getAllTypes(Ts')) ~> typeCheckArgList(Name, Tv)
           ~> assignUsesInCall(Name, TheCount, formArgList(Tv,Arg))
           ~> assignType(Name, TheCount, A, T) ...</k>
        <currModule> ModName:SymbolicValueRef </currModule>
        <funModuleName> ModName </funModuleName>
        <formalParameters> arguments(Ts':ElemList) </formalParameters>
        <functionName> V1 </functionName>
        <instructionCounter> TheCount:Int => TheCount +Int 1 </instructionCounter>
        <tempBlockMap> Now:Map => Now (TheCount |->
             instNumInfo(TheCount, assign(A, instruction(getKLabelFromOp(Ca)(T,,
                           callee(V1, arguments(formArgList(Tv,Arg))))
                          ,Mods, insMetas(formElemList(Meta)))), callInst)) </tempBlockMap>

    rule <k> typeCheckCall(Name:SymbolicValueRef, A:SymbolicValueRef, Ca:OptTailCall, void,
             V1:SymbolicValueRef, Ts:KResult, Tv:KResult,
             Arg:ParamList, Mods:Set, Meta:InstructionMetadatas) ~> K:K </k>
         <output>... .List => ListItem("error: void call instruction must not have return variable.") </output>

    //deal with cast operators
/*
   <result> = trunc <ty> <value> to <ty2>             ; yields ty2
    LLVM documentation mistake. trunc is not just working on values.
*/

    rule <k> typeCheckCastOp(Name:SymbolicValueRef,
                     X:SymbolicValueRef, trunc, integerType(N:Int),
                  V:K, integerType(N':Int), Meta:InstructionMetadatas)
              => typeCheckIntArg(Name, integerType(N), V)
                 ~> assignUses(Name, TheCount,
                       integerType(N:Int), (val(V),.ElemList))
                   ~> assignType(Name, TheCount, X, integerType(N')) ...</k>
        <instructionCounter> TheCount:Int => TheCount +Int 1 </instructionCounter>
        <tempBlockMap> Now:Map => Now (TheCount |->
             instNumInfo(TheCount, assign(X,instruction(getKLabelFromOp(trunc)(
                 integerType(N:Int),, V,, integerType(N':Int)), .Set,
                     insMetas(formElemList(Meta)))), normalInst)) </tempBlockMap>
         requires N >Int N'

/*
    rule <k> typeCheckCastOp(Name:SymbolicValueRef, X:SymbolicValueRef, trunc,
               vectorTypeValue(integerType(N:Int), I:Int), V:K,
               vectorTypeValue(integerType(N':Int), I:Int), Meta:InstructionMetadatas)
              => typeCheckIntArg(Name, vectorTypeValue(integerType(N:Int), I:Int), V)
                  ~> assignType(Name, X, vectorTypeValue(integerType(N'), I:Int))
         ...</k>
        <instructionCounter> TheCount:Int => TheCount +Int 1 </instructionCounter>
         <tempBlockInst> Now:List => Now ListItem(TheCount) </tempBlockInst>
         <instNumToBlock> InstMap:Map => InstMap[TheCount <- Name]  </instNumToBlock>
         <defToInstNum> DefMap:Map => DefMap[X <- TheCount] </defToInstNum>
         <instNumInfo> InfoMap:Map => InfoMap[TheCount
                  <- instNumInfo(assign(X,instruction(getKLabelFromOp(trunc)(
                 vectorTypeValue(integerType(N:Int), I:Int),,
                 V,, vectorTypeValue(integerType(N':Int), I:Int)),
                 .Set, insMetas(formElemList(Meta)))), X,
                    .K, .K, .K, getAllLocalVar(V),
                 normalInst)]  </instNumInfo>
         requires N >Int N'

    rule <k> typeCheckCastOp(Name:SymbolicValueRef,
                     X:SymbolicValueRef, trunc, integerType(N:Int),
                  V:K, integerType(N':Int), Meta:K) ~> K:K
              => .K </k>
         <output>... .List => ListItem("error: invalid cast opcode for cast from 'i"
                             +String Int2String(N) +String "' to 'i"
                             +String Int2String(N') +String "'") </output>
         requires N <=Int N'

    rule <k> typeCheckCastOp(Name:SymbolicValueRef, X:SymbolicValueRef, trunc,
               vectorTypeValue(integerType(N:Int), I:Int), V:K,
               vectorTypeValue(integerType(N':Int), I':Int),
               _:K) ~> K:K => .K </k>
         <output>... .List => ListItem("error: invalid cast opcode for cast from '<"
                             +String Int2String(I) +String " x "
                             +String Int2String(N) +String ">' to '<"
                             +String Int2String(I') +String " x "
                             +String Int2String(N') +String ">'") </output>
         requires N <=Int N' orBool I =/=Int I'


    rule <k> typeCheckCastOp(Name:SymbolicValueRef,
                 X:SymbolicValueRef, Op:K, integerType(N:Int),
                    V:K, integerType(N':Int), Meta:InstructionMetadatas)
              => typeCheckIntArg(Name, integerType(N), V)
                 ~> assignType(Name, X, integerType(N'))
         ...</k>
        <instructionCounter> TheCount:Int => TheCount +Int 1 </instructionCounter>
         <tempBlockInst> Now:List => Now ListItem(TheCount) </tempBlockInst>
         <instNumToBlock> InstMap:Map => InstMap[TheCount <- Name]  </instNumToBlock>
         <defToInstNum> DefMap:Map => DefMap[X <- TheCount] </defToInstNum>
         <instNumInfo> InfoMap:Map => InfoMap[TheCount
                  <- instNumInfo(assign(X,instruction(getKLabelFromOp(Op)(
                 integerType(N:Int),, V,, integerType(N':Int)), .Set,
                     insMetas(formElemList(Meta)))), X,
                    .K, .K, .K, getAllLocalVar(V),
                 normalInst)]  </instNumInfo>
         requires N <Int N' andBool Op =/=K trunc

    rule <k> typeCheckCastOp(Name:SymbolicValueRef, X:SymbolicValueRef,
             Op:K, integerType(N:Int), V:K,
             integerType(N':Int), _:InstructionMetadatas)
             ~> K => .K </k>
         <output>... .List => ListItem("error: invalid cast opcode for cast from 'i"
                             +String Int2String(N) +String "' to 'i"
                             +String Int2String(N') +String "'") </output>
         requires N >=Int N' andBool Op =/=K trunc

    rule <k>typeCheckCastOp(Name:SymbolicValueRef, X:SymbolicValueRef, Op:K,
               vectorTypeValue(integerType(N:Int), I:Int), V:K,
               vectorTypeValue(integerType(N':Int), I:Int), Meta:InstructionMetadatas)
              => typeCheckIntArg(Name, vectorTypeValue(integerType(N:Int), I:Int), V)
                 ~> assignType(Name, X, vectorTypeValue(integerType(N'), I:Int))
         ...</k>
        <instructionCounter> TheCount:Int => TheCount +Int 1 </instructionCounter>
         <tempBlockInst> Now:List => Now ListItem(TheCount) </tempBlockInst>
         <instNumToBlock> InstMap:Map => InstMap[TheCount <- Name]  </instNumToBlock>
         <defToInstNum> DefMap:Map => DefMap[X <- TheCount] </defToInstNum>
         <instNumInfo> InfoMap:Map => InfoMap[TheCount
                  <- instNumInfo(assign(X,instruction(getKLabelFromOp(Op)(
                 vectorTypeValue(integerType(N:Int), I:Int),,
                 V,, vectorTypeValue(integerType(N':Int), I:Int)),
                 .Set, insMetas(formElemList(Meta)))), X,
                    .K, .K, .K, getAllLocalVar(V),
                 normalInst)]  </instNumInfo>
         requires N <Int N' andBool Op =/=K trunc

    rule <k> typeCheckCastOp(Name:SymbolicValueRef, X:SymbolicValueRef, Op:K,
               vectorTypeValue(integerType(N:Int), I:Int), V:K,
               vectorTypeValue(integerType(N':Int), I':Int),
                _:InstructionMetadatas) ~> K:K
              => .K </k>
         <output>... .List => ListItem("error: invalid cast opcode for cast from '<"
                             +String Int2String(I) +String " x "
                             +String Int2String(N) +String ">' to '<"
                             +String Int2String(I') +String " x "
                             +String Int2String(N') +String ">'") </output>
         requires (N >=Int N' orBool I =/=Int I') andBool Op =/=K trunc


    rule <k> typeCheckCastOp(Name:SymbolicValueRef,
                     X:SymbolicValueRef, trunc, integerType(N:Int),
                   V:K, integerType(N':Int), _:InstructionMetadatas)
             ~> K => .K </k>
         <output>... .List => ListItem("error: invalid cast opcode for cast from 'i"
                             +String Int2String(N) +String "' to 'i"
                             +String Int2String(N') +String "'") </output>
         requires N <=Int N'

    rule <k> typeCheckCastOp(Name:SymbolicValueRef, X:SymbolicValueRef, trunc,
               vectorTypeValue(integerType(N:Int), I:Int), V:K,
               vectorTypeValue(integerType(N':Int), I:Int), Meta:InstructionMetadatas)
              => typeCheckIntArg(Name, vectorTypeValue(integerType(N:Int), I:Int), V)
                  ~> assignType(Name, X, vectorTypeValue(integerType(N'), I:Int))
         ...</k>
        <instructionCounter> TheCount:Int => TheCount +Int 1 </instructionCounter>
         <tempBlockInst> Now:List => Now ListItem(TheCount) </tempBlockInst>
         <instNumToBlock> InstMap:Map => InstMap[TheCount <- Name]  </instNumToBlock>
         <defToInstNum> DefMap:Map => DefMap[X <- TheCount] </defToInstNum>
         <instNumInfo> InfoMap:Map => InfoMap[TheCount
                  <- instNumInfo(assign(X,instruction(getKLabelFromOp(trunc)(
                 vectorTypeValue(integerType(N:Int), I:Int),,
                 V,, vectorTypeValue(integerType(N':Int), I:Int)),
                 .Set, insMetas(formElemList(Meta)))), X,
                    .K, .K, .K, getAllLocalVar(V),
                 normalInst)]  </instNumInfo>
         requires N >Int N'

    rule <k> typeCheckCastOp(Name:SymbolicValueRef, X:SymbolicValueRef, trunc,
               vectorTypeValue(integerType(N:Int), I:Int), V:K,
               vectorTypeValue(integerType(N':Int), I':Int),
               _:InstructionMetadatas) ~> K:K
              => .K </k>
         <output>... .List => ListItem("error: invalid cast opcode for cast from '<"
                             +String Int2String(I) +String " x "
                             +String Int2String(N) +String ">' to '<"
                             +String Int2String(I') +String " x "
                             +String Int2String(N') +String ">'") </output>
         requires N <=Int N' orBool I =/=Int I'

    rule <k> typeCheckCastOp(Name:SymbolicValueRef, X:SymbolicValueRef,
            Op:K, vectorTypeValue(Ty:KResult, I:Int), V:K,
            vectorTypeValue(Ty':KResult, I':Int), _:InstructionMetadatas) ~> K
              => .K </k>
         <output>... .List => ListItem("error: invalid operand type for instruction") </output>
         requires getKLabel(Ty) =/=KLabel 'integerType orBool getKLabel(Ty') =/=KLabel 'integerType

    rule <k> typeCheckCastOp(Name:SymbolicValueRef, X:SymbolicValueRef,
             Op:K, T:K, V:K, T':K, _:InstructionMetadatas) ~> K
              => .K </k>
         <output>... .List => ListItem("error: instruction requires integer or integer vector operands") </output>
         requires (getKLabel(T) =/=KLabel 'integerType
                    andBool getKLabel(T) =/=KLabel 'vectorTypeValue)
                    orBool (getKLabel(T') =/=KLabel 'integerType
                    andBool getKLabel(T') =/=KLabel 'vectorTypeValue)
*/

    //type checking icmp ops
    rule <k> typeCheckICmp(Name:SymbolicValueRef, X:SymbolicValueRef, Op:IPredicate,
               integerType(N:Int), V1:K, V2:K, Meta:InstructionMetadatas)
               => exprType(typeCheckIntArgs(Name:SymbolicValueRef,
                     integerType(N), val(V1),val(V2),.ElemList))
                 ~> assignUses(Name, TheCount,
                       integerType(N:Int), (val(V1),val(V2),.ElemList))
                  ~> assignType(Name, TheCount, X, integerType(1)) ...</k>
        <instructionCounter> TheCount:Int => TheCount +Int 1 </instructionCounter>
        <tempBlockMap> Now:Map => Now (TheCount |->
              instNumInfo(TheCount, assign(X,instruction(iCmp(Op,
                     integerType(N:Int), V1, V2), .Set,
                     insMetas(formElemList(Meta)))), normalInst)) </tempBlockMap>

    rule <k> typeCheckICmp(Name:SymbolicValueRef, X:SymbolicValueRef, Op:IPredicate,
               pointerTypeValue(T:KResult, Ad:KResult), V1:K, V2:K, Meta:InstructionMetadatas)
               => exprType(typeCheckPointerArgs(Name:SymbolicValueRef,
            pointerTypeValue(T, Ad), val(V1),val(V2),.ElemList))
                 ~> assignUses(Name, TheCount,
                   pointerTypeValue(T, Ad), (val(V1),val(V2),.ElemList))
                  ~> assignType(Name, TheCount, X, integerType(1)) ...</k>
        <instructionCounter> TheCount:Int => TheCount +Int 1 </instructionCounter>
        <tempBlockMap> Now:Map => Now (TheCount |->
              instNumInfo(TheCount, assign(X,instruction(iCmp(Op,
                pointerTypeValue(T, Ad), V1, V2), .Set,
                     insMetas(formElemList(Meta)))), normalInst)) </tempBlockMap>

    rule <k> typeCheckICmp(Name:SymbolicValueRef, X:SymbolicValueRef, Op:IPredicate,
                     vectorTypeValue(T:KResult, I:Int),
                     V1:K, V2:K, Meta:InstructionMetadatas)
               => exprType(typeCheckVectorArgs(Name:SymbolicValueRef,
                  vectorTypeValue(T, I:Int), val(V1),val(V2),.ElemList))
                ~> assignUses(Name, TheCount, vectorTypeValue(T, I:Int),
                  (val(V1),val(V2),.ElemList))
                     ~> assignType(Name, TheCount, X,
          vectorTypeValue(integerType(1), I:Int)) ...</k>
        <instructionCounter> TheCount:Int => TheCount +Int 1 </instructionCounter>
        <tempBlockMap> Now:Map => Now (TheCount |->
              instNumInfo(TheCount, assign(X,instruction(iCmp(Op,
                  vectorTypeValue(T, I:Int), V1, V2), .Set,
                     insMetas(formElemList(Meta)))), normalInst)) </tempBlockMap>
          requires I >Int 0 andBool (getKLabel(T) ==KLabel 'integerType
               orBool getKLabel(T) ==KLabel 'pointerTypeValue)

    rule <k> typeCheckICmp(Name:SymbolicValueRef, X, Op:K,
              T:KResult, V1:K, V2:K, _:InstructionMetadatas) ~> K:K  => .K </k>
         <output>... .List => ListItem("error: icmp requires integer/pointer/int vector operands") </output>
         requires getKLabel(T) =/=KLabel 'integerType
               andBool getKLabel(T) =/=KLabel 'pointerTypeValue
               andBool getKLabel(T) =/=KLabel 'vectorTypeValue

    rule <k> typeCheckICmp(Name:SymbolicValueRef, X, Op:K,
             vectorTypeValue(T:K, I:Int), V1:K, V2:K,
             _:InstructionMetadatas) ~> K:K => .K </k>
         <output>... .List => ListItem("error: icmp vector requires integer operands") </output>
         requires getKLabel(T) =/=KLabel 'integerType
                andBool getKLabel(T) =/=KLabel 'pointerTypeValue

    rule <k> typeCheckICmp(Name:SymbolicValueRef, X:SymbolicValueRef, Op:K,
               vectorTypeValue(Ty:KResult, I:Int),
               V1:K, V2:K, S:Set, Meta:InstructionMetadatas) ~> K
              => .K </k>
         <output>... .List => ListItem("error: invalid vector number for instruction") </output>
         requires I <=Int 0

    //type checking and instruction AST from with integer ops and logical ops.
    rule <k> typeCheckIntOp(Name:SymbolicValueRef, X:SymbolicValueRef, Op:K,
                 integerType(N:Int), V1:K, V2:K, S:Set, Meta:InstructionMetadatas)
              => exprType(typeCheckIntArgs(Name:SymbolicValueRef,
                     integerType(N), val(V1),val(V2),.ElemList))
                 ~> assignUses(Name, TheCount,
                       integerType(N:Int), (val(V1),val(V2),.ElemList))
                 ~> assignType(Name, TheCount, X, integerType(N:Int)) ...</k>
        <instructionCounter> TheCount:Int => TheCount +Int 1 </instructionCounter>
        <tempBlockMap> Now:Map => Now (TheCount |->
              instNumInfo(TheCount, assign(X,instruction(getKLabelFromOp(Op)(
                       integerType(N:Int),, V1,, V2), S,
                     insMetas(formElemList(Meta)))), normalInst)) </tempBlockMap>

    rule <k> typeCheckIntOp(Name:SymbolicValueRef, X:SymbolicValueRef, Op:K,
               vectorTypeValue(integerType(N:Int), I:Int),
                          V1:K, V2:K, S:Set, Meta:InstructionMetadatas)
              => exprType(typeCheckVectorArgs(Name:SymbolicValueRef,
                  vectorTypeValue(integerType(N:Int), I:Int),
                             val(V1),val(V2),.ElemList))
                ~> assignUses(Name, TheCount,
                       vectorTypeValue(integerType(N:Int), I:Int),
                  (val(V1),val(V2),.ElemList))
                 ~> assignType(Name, TheCount, X,
                      vectorTypeValue(integerType(N:Int), I:Int)) ...</k>
        <instructionCounter> TheCount:Int => TheCount +Int 1 </instructionCounter>
        <tempBlockMap> Now:Map => Now (TheCount |->
              instNumInfo(TheCount, assign(X,instruction(getKLabelFromOp(Op)(
                   vectorTypeValue(integerType(N:Int), I:Int),, V1,, V2), S,
                     insMetas(formElemList(Meta)))),
                 normalInst)) </tempBlockMap>
          requires I >Int 0

    rule <k> typeCheckIntOp(Name:SymbolicValueRef, X:SymbolicValueRef, Op:K,
               vectorTypeValue(Ty:KResult, I:Int),
               V1:K, V2:K, S:Set, Meta:InstructionMetadatas) ~> K
              => .K </k>
         <output>... .List => ListItem("error: invalid operand type for instruction") </output>
         requires getKLabel(Ty) =/=KLabel 'integerType

    rule <k> typeCheckIntOp(Name:SymbolicValueRef, X:SymbolicValueRef, Op:K,
               vectorTypeValue(Ty:KResult, I:Int),
               V1:K, V2:K, S:Set, Meta:InstructionMetadatas) ~> K
              => .K </k>
         <output>... .List => ListItem("error: invalid vector number for instruction") </output>
         requires I <=Int 0

    rule <k> typeCheckIntOp(Name:SymbolicValueRef, X:SymbolicValueRef, Op:K,
                    Ty:KResult, V1:K, V2:K, S:Set, Meta:InstructionMetadatas) ~> K
              => .K </k>
         <output>... .List => ListItem("error: instruction requires integer or integer vector operands") </output>
         requires getKLabel(Ty) =/=KLabel 'integerType
                    andBool getKLabel(Ty) =/=KLabel 'vectorTypeValue

    //finally, assign the type of a variable.
    rule <k> assignType(Name:SymbolicValueRef,TheCount:Int,
                 X:SymbolicValueRef, T:K) => .K ...</k>
         <currModule> ModName:SymbolicValueRef </currModule>
         <funModuleName> ModName </funModuleName>
         <currFunction> FunName:SymbolicValueRef </currFunction>
         <functionName> FunName </functionName>
          <varTypes> _:Map (.Map => X |-> T) </varTypes>
         <basicBlocks>... Name
             |-> blockContent(_:Map, _:Bool, _:Set, _:Set, _:Set, _:Set,
           Def:Set (.Set => SetItem(varOp(Name, TheCount, T, X))),
          _:Set, _:Set) ...</basicBlocks>

    //type checking const expr
    rule <k> typeCheckConstExpr(T:K, name(localVar, X:K)) ~> K:K => .K </k>
         <output>... .List => ListItem("error: invalid use of function-local name.") </output>

    rule <k> typeCheckConstExpr(T:K, name(globalVar, X:K)) => T ...</k>
         <globalRegisters>... name(globalVar, X:K) |-> value(T:K, V:K) ...</globalRegisters>
    rule <k> typeCheckConstExpr(T:K, name(globalVar, X:K)) ~> K:K => .K </k>
         <globalRegisters>... name(globalVar, X:K) |-> value(T':K, V:K) ...</globalRegisters>
         <output>... .List => ListItem("error: const expression type failed.") </output>
         requires T =/=K T'
    rule typeCheckConstExpr(T:KResult, undef) => .K
    rule typeCheckConstExpr(T:KResult, zeroinitializer) => .K
    rule typeCheckConstExpr(integerType(N:Int), A:KResult)
               => exprType(typeCheckIntExpr(integerType(N:Int), A))
    rule typeCheckConstExpr(pointerTypeValue(T:KResult, Ad:KResult), A:KResult)
               => exprType(typeCheckPointerExpr(pointerTypeValue(T, Ad), A))

    /*rule typeCheckConstExpr(T:K, constCastAST(Op:K, T1:K, V1:K, T2:K))
          => typeMatch(T, T2) ~> typeCheckConstExpr(T1, V1)
       not very correct
    */
    rule typeCheckConstExpr(vectorTypeValue(T:K, I:Int), vector(Es:ElemList))
          => exprType(typeCheckVectorArg(
                    vectorTypeValue(T:K, I:Int), I, vector(Es:ElemList)))

    rule typeCheckConstExpr(integerType(N:Int), constBinAST(Op:BinaryIntOps,
                                T1:K, V1:K, T2:K, V2:K))
          => typeCheckConstExprs(integerType(N:Int),
               (val(typeOperand(T1,V1)),val(typeOperand(T2,V2)),.ElemList))
    rule typeCheckConstExpr(vectorTypeValue(integerType(N:Int), I:Int),
              constBinAST(Op:BinaryIntOps, T1:K, V1:K, T2:K, V2:K))
          => typeCheckConstExprs(vectorTypeValue(integerType(N:Int), I:Int),
               (val(typeOperand(T1,V1)),val(typeOperand(T2,V2)),.ElemList))

    rule typeCheckConstExpr(integerType(N:Int), constLogicAST(Op:BinaryIntOps,
                                T1:K, V1:K, T2:K, V2:K))
          => typeCheckConstExprs(integerType(N:Int),
               (val(typeOperand(T1,V1)),val(typeOperand(T2,V2)),.ElemList))
    rule typeCheckConstExpr(vectorTypeValue(integerType(N:Int), I:Int),
              constLogicAST(Op:BinaryIntOps, T1:K, V1:K, T2:K, V2:K))
          => typeCheckConstExprs(vectorTypeValue(integerType(N:Int), I:Int),
               (val(typeOperand(T1,V1)),val(typeOperand(T2,V2)),.ElemList))

    rule typeCheckConstExpr(T:FPType, constBinAST(Op:FloatOps Fl:FastMathFlags,
                                T1:K, V1:K, T2:K, V2:K))
          => typeCheckConstExprs(T,
               (val(typeOperand(T1,V1)),val(typeOperand(T2,V2)),.ElemList))
    rule typeCheckConstExpr(vectorTypeValue(T:FPType, I:Int),
              constBinAST(Op:FloatOps Fl:FastMathFlags, T1:K, V1:K, T2:K, V2:K))
          => typeCheckConstExprs(vectorTypeValue(T:FPType, I:Int),
               (val(typeOperand(T1,V1)),val(typeOperand(T2,V2)),.ElemList))

    //type check elements of const exprs
    rule typeCheckConstExprs(T:K, .ElemList) => .K
    rule typeCheckConstExprs(T:KResult, (typeOperandResult(T, A:K), Es:ElemList))
          => typeCheckConstExpr(T, A)
                     ~> typeCheckConstExprs(T, Es)
    rule <k> typeCheckConstExprs(T:K, (typeOperandResult(T':KResult, A:K), Es:ElemList))
              ~> K:K => .K </k>
         <output>... .List => ListItem("error: constant expression type mismatch") </output>
         requires T =/=K T'

    //type check an arg without specifying the type
    rule typeCheckSingleArg(Name:SymbolicValueRef,
                   pointerTypeValue(T:KResult, Ad:KResult), V:K)
          => exprType(preTypeCheckPointerExpr(
              pointerTypeValue(T:KResult, Ad:KResult), V:K))
             ~> checkUseVarInside(Name, pointerTypeValue(
                                 T:KResult, Ad:KResult), V:K)
    rule typeCheckSingleArg(Name:SymbolicValueRef,
                  vectorTypeValue(T:K, I:Int), V:K)
         => exprType(typeCheckVectorArg(vectorTypeValue(T:K, I:Int), I, V))
             ~> checkUseVarInside(Name, vectorTypeValue(T:K, I:Int), V)
    rule typeCheckSingleArg(Name:SymbolicValueRef,
                  integerType(N:Int), V:K)
         => exprType(preTypeCheckIntExpr(integerType(N:Int), V))
             ~> checkUseVarInside(Name, integerType(N:Int), V)
    rule <k> typeCheckSingleArg(Name:SymbolicValueRef,
             O:OpaqueType ,V:K) ~> K:K => .K </k>
         <output>... .List => ListItem("error: the arg type cannot be opaque structural type.") </output>

    //start type checking vector arguments
    rule typeCheckVectorArgs(Name:SymbolicValueRef,
           vectorTypeValue(T:K, I:Int), .ElemList) => vectorTypeValue(T:K, I:Int)
    rule typeCheckVectorArgs(Name:SymbolicValueRef,
           vectorTypeValue(T:K, I:Int), val(V:K),Es:ElemList)
         => exprType(preTypeCheckVectorArg(vectorTypeValue(T:K, I:Int), I, V))
             ~> checkUseVarInside(Name, vectorTypeValue(T:K, I:Int), V)
             ~> typeCheckVectorArgs(Name, vectorTypeValue(T:K, I:Int), Es)

    //type check single vector argument
    rule preTypeCheckVectorArg(T:K, I:Int, X:SymbolicValueRef) => T
         requires isLocalVariable(X) andBool I >Int 0
    rule preTypeCheckVectorArg(T:K, I:Int, X:K)
           => typeCheckVectorArg(T, I, X)
         requires notBool isLocalVariable(X) andBool I >Int 0

    rule <k> preTypeCheckVectorArg(T:K, 0, X:K) ~> K:K => .K </k>
         <output>... .List => ListItem("error: invalid vector number for instruction") </output>

    rule typeCheckVectorArg(T:KResult, I:Int, undef) => T
    rule typeCheckVectorArg(T:KResult, I:Int, zeroinitializer) => T
    rule typeCheckVectorArg(T:KResult, I:Int, X:SymbolicValueRef) => T
         requires notBool isLocalVariable(X)
    rule <k> typeCheckVectorArg(T:KResult, I:Int, X:SymbolicValueRef)
                  ~> K:K => .K </k>
         <output>... .List => ListItem("error: pointer type position must either be a local variable or a constant expression without local variables.") </output>
         requires isLocalVariable(X)

    rule typeCheckVectorArg(T:KResult, I:Int, A:ConstExpr)
         => constExprType(typeCheckConstExpr(T, A:ConstExpr))
           ~> typeCheckVectorArg(T:KResult, I:Int, emptyHOLE)
    rule T:KResult ~>
            typeCheckVectorArg(T:KResult, I:Int, emptyHOLE) => T

    rule typeCheckVectorArg(T:KResult, 0, vector(.ElemList)) => T
    rule typeCheckVectorArg(vectorTypeValue(T:KResult, I:Int), N:Int,
                 vector(val(operand(T':K, V:ValueRef)), R:ElemList))
         => typeCheckVectorArg(vectorTypeValue(T:KResult, I:Int), N:Int,
                 T':K, V:ValueRef, vector(R:ElemList))
         requires N >Int 0
    rule typeCheckVectorArg(vectorTypeValue(T:KResult, I:Int),
                         N:Int, T:KResult, V:K, Vs:K)
         => typeCheckVectorAux(T, V) 
              ~> typeCheckVectorArg(
                   vectorTypeValue(T:KResult, I:Int), N -Int 1, Vs)

    rule <k> typeCheckVectorArg(vectorTypeValue(T:KResult, I:Int),
                          N:Int, T':KResult, V:K, Vs:K) ~> K:K
                => .K </k>
         <output>... .List => ListItem("error: vector element type mismatch") </output>
         requires T =/=K T'
    rule <k> typeCheckVectorArg(T:K, 0, vector(R:ElemList)) ~> K => .K </k>
         <output>... .List => ListItem("error: constant expression type mismatch") </output>
         requires R =/=K .ElemList
    rule <k> typeCheckVectorArg(T:K, I:Int, vector(.ElemList)) ~> K => .K </k>
         <output>... .List => ListItem("error: constant expression type mismatch") </output>
         requires I >Int 0

    rule typeCheckVectorAux(integerType(N:Int), V:K)
             => exprType(typeCheckIntExpr(integerType(N:Int), V:K))
    rule typeCheckVectorAux(pointerTypeValue(T:KResult, Ad:KResult), V:K)
             => exprType(typeCheckPointerExpr(
                          pointerTypeValue(T:KResult, Ad:KResult), V:K))

    //start type checking integer arguments
    rule typeCheckIntArgs(Name:SymbolicValueRef, T:TypeResult, .ElemList) => T
    rule typeCheckIntArgs(Name:SymbolicValueRef, T:TypeResult, val(V:K),Vs:ElemList)
                    => exprType(preTypeCheckIntExpr(T, V))
                          ~> checkUseVarInside(Name, T, V)
                           ~> typeCheckIntArgs(Name:SymbolicValueRef, T, Vs)

    //start type checking pointer arguments
    rule typeCheckPointerArgs(Name:SymbolicValueRef, T:TypeResult, .ElemList) => T
    rule typeCheckPointerArgs(Name:SymbolicValueRef,
                           T:TypeResult, val(V:K),Vs:ElemList)
                    => exprType(preTypeCheckPointerExpr(T, V))
                          ~> checkUseVarInside(Name, T, V)
                           ~> typeCheckPointerArgs(Name:SymbolicValueRef, T, Vs)

    //type check general expression
    rule typeCheckExpr(pointerTypeValue(T:KResult, Ad:KResult), V:K)
          => preTypeCheckPointerExpr(pointerTypeValue(T:KResult, Ad:KResult), V:K)
    rule typeCheckExpr(vectorTypeValue(T:KResult, I:Int), V:K)
          => preTypeCheckVectorArg(vectorTypeValue(T:KResult, I:Int), I, V:K)
    rule typeCheckExpr(integerType(N:Int), V:K)
          => preTypeCheckIntExpr(integerType(N:Int), V:K)

    //type checking each pointer argument
    rule preTypeCheckPointerExpr(T:K, V:SymbolicValueRef) => T
         requires isLocalVariable(V)
    rule preTypeCheckPointerExpr(T:K, V:K) => typeCheckPointerExpr(T, V)
         requires notBool isLocalVariable(V)

    rule typeCheckPointerExpr(
                      pointerTypeValue(T:KResult, Ad:KResult), undef)
                   => pointerTypeValue(T:KResult, Ad:KResult)
    rule typeCheckPointerExpr(
                pointerTypeValue(T:KResult, Ad:KResult), zeroinitializer)
                   => pointerTypeValue(T:KResult, Ad:KResult)
    rule typeCheckPointerExpr(
           pointerTypeValue(T:KResult, Ad:KResult), X:SymbolicValueRef)
                     => pointerTypeValue(T:KResult, Ad:KResult)
         requires notBool isLocalVariable(X)
    rule <k> typeCheckPointerExpr(Ty:K, X:SymbolicValueRef) ~> K => .K </k>
         <output>... .List => ListItem("error: pointer type position must either be a local variable or a constant expression without local variables.") </output>
         requires isLocalVariable(X)

    rule typeCheckPointerExpr(
              pointerTypeValue(T:KResult, Ad:KResult), A:ConstExpr)
         => constExprType(typeCheckConstExpr(
               pointerTypeValue(T:KResult, Ad:KResult), A:ConstExpr))
           ~> typeCheckPointerExpr(
                   pointerTypeValue(T:KResult, Ad:KResult), emptyHOLE)
    rule T:KResult ~> typeCheckPointerExpr(T, emptyHOLE) => T

    rule <k> typeCheckPointerExpr(Ty:K, I:Int) ~> K => .K </k>
         <output>... .List => ListItem("error: integer constant must have integer type") </output>
    rule <k> typeCheckPointerExpr(Ty:K, B:Bool) ~> K => .K </k>
         <output>... .List => ListItem("error: constant expression type mismatch") </output>
    rule <k> typeCheckPointerExpr(Ty:K, F:FpVal) ~> K => .K </k>
         <output>... .List => ListItem("error: constant expression type mismatch") </output>

    //type check each integer argument
    rule preTypeCheckIntExpr(T:KResult, A:K) => T
         requires isLocalVariable(A)
    rule preTypeCheckIntExpr(T:KResult, A:K)
                 => typeCheckIntExpr(T, A)
         requires notBool isLocalVariable(A)

    rule typeCheckIntExpr(T:KResult, A:ConstExpr)
         => constExprType(typeCheckConstExpr(T, A:ConstExpr))
           ~> typeCheckIntExpr(T:KResult, emptyHOLE)
    rule T:KResult ~>
            typeCheckIntExpr(T:KResult, emptyHOLE) => T

    //type check interger expressions
    rule typeCheckIntExpr(T:KResult, undef) => T
    rule typeCheckIntExpr(T:KResult, zeroinitializer) => T
    rule typeCheckIntExpr(integerType(N:Int), I:Int) => integerType(N:Int)
    rule typeCheckIntExpr(integerType(1), B:Bool) => integerType(1)
    rule typeCheckIntExpr(T:KResult, X:SymbolicValueRef) => T
         requires notBool isLocalVariable(X)

    rule <k> typeCheckIntExpr(T:KResult, X:SymbolicValueRef) ~> K => .K </k>
         <output>... .List => ListItem("error: int type position must either be a local variable or a constant expression without local variables.") </output>
         requires isLocalVariable(X)

    rule <k> typeCheckIntExpr(Ty:K, F:FpVal) ~> K => .K </k>
         <output>... .List => ListItem("error: float constant must have float type") </output>
    rule <k> typeCheckIntExpr(Ty:K, I:Int) ~> K => .K </k>
         <output>... .List => ListItem("error: integer constant must have integer type") </output>
         requires getKLabel(Ty) =/=KLabel 'integerType
    rule <k> typeCheckIntExpr(Ty:K, B:Bool) ~> K => .K </k>
         <output>... .List => ListItem("error: constant expression type mismatch") </output>
         requires getKLabel(Ty) =/=KLabel 'integerType
    rule <k> typeCheckIntExpr(integerType(N:Int), B:Bool) ~> K => .K </k>
         <output>... .List => ListItem("error: constant expression type mismatch") </output>
         requires N =/=K 1

    //type check int variables and the uses of the variables
    rule checkUseVarInside(Name:SymbolicValueRef, T:K, X:K) => .K
         requires notBool isLocalVariable(X)

    rule <k> checkUseVarInside(Name:SymbolicValueRef, T:K, X:SymbolicValueRef) => .K ...</k>
         <currModule> ModName:SymbolicValueRef </currModule>
         <funModuleName> ModName </funModuleName>
         <currFunction> FunName:SymbolicValueRef </currFunction>
         <functionName> FunName </functionName>
         <varTypes>... addNameToString(X) |-> T:K ...</varTypes>
         <basicBlocks>... Name |-> blockContent(_:Map, _:Bool, _:Set, _:Set,
               _:Set, _:Set, Defs:Set, _:Set, _:Set) ...</basicBlocks>
         requires isInDefs(addNameToString(X),.K,Defs)

    rule <k> checkUseVarInside(Name:SymbolicValueRef, T:K, X:SymbolicValueRef) => .K ...</k>
         <currModule> ModName:SymbolicValueRef </currModule>
         <funModuleName> ModName </funModuleName>
         <currFunction> FunName:SymbolicValueRef </currFunction>
         <functionName> FunName </functionName>
         <basicBlocks>... Name |-> blockContent(_:Map, _:Bool, _:Set, _:Set,
               _:Set, _:Set, Defs:Set, _:Set,
              Uses:Set  (.Set => SetItem(operand(T, addNameToString(X))))) ...</basicBlocks>
         requires notBool isInDefs(addNameToString(X),.K, Defs)

    rule <k> checkUseVarInside(Name:SymbolicValueRef,
                                        T:K, X:SymbolicValueRef) ~> K => .K </k>
         <output>... .List => ListItem("error: "+String "'" +String
                              #tokenToString(X) +String " defined with type '"
                             +String #tokenToString(T') +String "'") </output>
         <currModule> ModName:SymbolicValueRef </currModule>
         <funModuleName> ModName </funModuleName>
         <currFunction> FunName:SymbolicValueRef </currFunction>
         <functionName> FunName </functionName>
         <varTypes>... addNameToString(X) |-> T':K ...</varTypes>
         requires T =/=K T'

    //deal with ret, first deal with integer variable only
    rule <k> typeCheckRet(N:SymbolicValueRef, T:KResult, V:K
                    , Meta:InstructionMetadatas)
          => exprType(typeCheckIntArgs(N, T, val(V),.ElemList))
               ~> assignUses(N, TheCount, T, (val(V),.ElemList)) ...</k>
        <instructionCounter> TheCount:Int => TheCount +Int 1 </instructionCounter>
        <tempBlockMap> Now:Map => Now (TheCount |->
              instNumInfo(TheCount, noAssign(instruction(ret(T,V) ,.Set
                                        ,insMetas(formElemList(Meta)))), returnInst)) </tempBlockMap>

    //set out edges for a block
    rule setOutEdge(N:K, .ElemList) => .K
    rule <k> setOutEdge(N:K, val(V:SymbolicValueRef),El:ElemList)
                => setOutEdge(N, El) ...</k>
        <currModule> ModName:SymbolicValueRef </currModule>
        <funModuleName> ModName </funModuleName>
        <currFunction> FunName:SymbolicValueRef </currFunction>
        <functionName> FunName </functionName>
        <basicBlocks>... N |-> 
                blockContent(_:Map, _:Bool, Out:Set (.Set => SetItem(V)), _:Set,
                                      _:Set, _:Set, _:Set, _:Set, _:Set) ...</basicBlocks>

    //set loop flag for each block
    rule <k> setLoopFlag => setLoopFlag(.K, .K, M, M) ...</k>
         <currModule> ModName:SymbolicValueRef </currModule>
         <funModuleName> ModName </funModuleName>
         <currFunction> FunName:SymbolicValueRef </currFunction>
         <functionName> FunName </functionName>
         <basicBlocks> M:Map </basicBlocks>

    rule setLoopFlag(.K, .K, .Map, M:Map) => .K
    rule setLoopFlag(.K, .K, (A:K |-> V:K) M1:Map, M:Map)
              => setLoopFlag(A, V, M1, M)
    rule setLoopFlag(A:SymbolicValueRef, V:KItem, M1:Map, M:Map)
               => setLoopFlag(.K, .K, M1, M)
         requires notBool hasLasso(SetItem(A), V, M)
    rule <k> setLoopFlag(A:SymbolicValueRef, V:KItem, M1:Map, M:Map)
               => setLoopFlag(.K, .K, M1, M) ...</k>
         <currModule> ModName:SymbolicValueRef </currModule>
         <funModuleName> ModName </funModuleName>
         <currFunction> FunName:SymbolicValueRef </currFunction>
         <functionName> FunName </functionName>
         <initialBasicBlock> InitName:SymbolicValueRef </initialBasicBlock>
         <basicBlocks>... A |-> 
               blockContent(_:Map, F:Bool => true, _:Set, _:Set,
                            _:Set, _:Set, _:Set, _:Set, _:Set) ...</basicBlocks>
         requires hasLasso(SetItem(A), V, M)

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
                blockContent(_:Map, _:Bool, Out:Set, _:Set,
                            _:Set, _:Set, _:Set, _:Set, _:Set) ...</basicBlocks>

    rule setInEdgesForNode(A:K, .K, .Set) => .K
    rule setInEdgesForNode(A:K, .K, SetItem(B:K) S:Set) => setInEdgesForNode(A, B, S)
    rule <k> setInEdgesForNode(A:K,B:K, S:Set) => setInEdgesForNode(A, .K, S) ...</k>
        <currModule> ModName:SymbolicValueRef </currModule>
        <funModuleName> ModName </funModuleName>
        <currFunction> FunName:SymbolicValueRef </currFunction>
        <functionName> FunName </functionName>
         <basicBlocks>... B |-> 
              blockContent(_:Map, _:Bool, _:Set, In:Set (.Set => SetItem(A)),
                                        _:Set, _:Set, _:Set, _:Set, _:Set) ...</basicBlocks>

    //set up all def/use for each block. 
    rule calDefUse(.K, .Set, S2:Set) => .K
    rule calDefUse(.K, SetItem(A:K) S1:Set, S2:Set) => calDefUse(A, S1, S2)
    rule <k> calDefUse(A:KItem, S1:Set, S2:Set)
            => calDefUse(A, OutDef, OutUse, Out, .K, S1, S2) ...</k>
        <currModule> ModName:SymbolicValueRef </currModule>
        <funModuleName> ModName </funModuleName>
        <currFunction> FunName:SymbolicValueRef </currFunction>
        <functionName> FunName </functionName>
         <basicBlocks>... A |-> 
              blockContent(_:Map, _:Bool, Out:Set, _:Set, _:Set,
           _:Set, OutDef:Set, OutUse:Set, _:Set) ...</basicBlocks>

    rule calDefUse(A:K, Def, Use, .Set, .K, S1:Set, S2:Set)
          => calDefUse(.K, S1:Set, SetItem(A) S2:Set)
    rule calDefUse(A:KItem, Def, Use, SetItem(B:K) Nexts, .K, S1:Set, S2:Set)
              => calDefUse(A:KItem, Def, Use, Nexts, B, S1:Set, S2:Set)
    rule <k> calDefUse(A:KItem,Def, Use, Nexts, B:KItem, S1:Set, S2:Set)
              => calDefUse(A:KItem,Def, Use, Nexts, .K, S1, S2) ...</k>
        <currModule> ModName:SymbolicValueRef </currModule>
        <funModuleName> ModName </funModuleName>
        <currFunction> FunName:SymbolicValueRef </currFunction>
        <functionName> FunName </functionName>
         <basicBlocks>... B |-> 
              blockContent(_:Map, _:Bool, _:Set, _:Set,
                                        InDef:Set, InUse:Set, _:Set, _:Set, _:Set) ...</basicBlocks>
        requires B in S2 andBool Def <=Set InDef andBool Use <=Set InUse

    rule <k> calDefUse(A:KItem, Def, Use, Nexts, B:KItem, S1:Set, S2:Set)
              => calDefUse(A:KItem, Def, Use, Nexts, .K, SetItem(B) S1:Set, S2:Set) ...</k>
        <currModule> ModName:SymbolicValueRef </currModule>
        <funModuleName> ModName </funModuleName>
        <currFunction> FunName:SymbolicValueRef </currFunction>
        <functionName> FunName </functionName>
         <basicBlocks>... B |-> 
              blockContent(_:Map, _:Bool, _:Set, _:Set, (InDef:Set => InDef Def),
                (InUse:Set => InUse Use), (OutDef:Set => OutDef Def), (OutUse:Set => OutUse Use), _:Set)
         ...</basicBlocks>
         requires notBool (B in S2)
             orBool (B in S2 andBool ((notBool Def <=Set InDef) orBool (notBool Use <=Set InUse)))

    //in the checkSingleAssignment and checkSingleAssignmentInBlock
    //to add addNameToString to every positioins where show Type and ValueRef
    //for example the third rule
    //also type check each instruction and rewrite each instruction in AST form
    syntax KItem ::= checkSingleAssignment(K)
                   | checkSingleAssignmentInBlock(SymbolicValueRef, K, Bool) //name, tocheck, stores, is-phi-allow

    //form a basicBlock finally.
    rule <k> checkSingleAssignmentInBlock(N:SymbolicValueRef, .K, _:Bool)
             => .K ...</k>
        <currModule> ModName:SymbolicValueRef </currModule>
        <funModuleName> ModName </funModuleName>
        <currFunction> FunName:SymbolicValueRef </currFunction>
        <functionName> FunName </functionName>
        <tempBlockMap> K:Map => .Map </tempBlockMap>
        <tempUses> Uses => .Set </tempUses>
        <basicBlocks>... N |-> blockContent((_:Map => K), _:Bool,
                       _:Set, _:Set, _:Set, _:Set,
                 _:Set, OutUses => OutUses Uses, _:Set) ...</basicBlocks>

    //have dealt with all instruction list.
    rule checkSingleAssignmentInBlock(N:SymbolicValueRef, .InstructionList
                               BB:K, B:Bool)
         => checkSingleAssignmentInBlock(N, BB, B)

    //deal with termination instructions.
    rule checkSingleAssignmentInBlock(N:SymbolicValueRef, ret Nt:NonVoidType
                                  Va:ValueRef Meta:InstructionMetadatas, _:Bool)
         => typeCheckOp(N:SymbolicValueRef, .K, ret Nt:NonVoidType
                                  Va:ValueRef Meta:InstructionMetadatas)
             ~> checkSingleAssignmentInBlock(N, .K, false)

    rule checkSingleAssignmentInBlock(N:SymbolicValueRef, ret Nt:VoidType
                                  Meta:InstructionMetadatas, _:Bool)
         => checkSingleAssignmentInBlock(N, .K, false)


    rule checkSingleAssignmentInBlock(N:SymbolicValueRef, br label La:ValueRef
                                  Meta:InstructionMetadatas, _:Bool)
         => typeCheckOp(N, .K, br label La:ValueRef
                                  Meta:InstructionMetadatas)
             ~> setOutEdge(N, getOutEdges(La))
              ~> checkSingleAssignmentInBlock(N, .K, false)

    rule checkSingleAssignmentInBlock(N:SymbolicValueRef, br It:IntType Va:ValueRef ,
                                       label La1:ValueRef , label La2:ValueRef
                                  Meta:InstructionMetadatas, _:Bool)
         => typeCheckOp(N, .K, br It:IntType Va:ValueRef ,
                                       label La1:ValueRef , label La2:ValueRef
                                  Meta:InstructionMetadatas)
             ~> (setOutEdge(N, getOutEdges(La1))
               ~> (setOutEdge(N, getOutEdges(La2))
             ~> checkSingleAssignmentInBlock(N, .K, false)))

    rule checkSingleAssignmentInBlock(N:SymbolicValueRef, resume Ty:Type Va:ValueRef
                                    Meta:InstructionMetadatas, _:Bool)
         => typeCheckOp(N, .K, resume Ty:Type Va:ValueRef
                                    Meta:InstructionMetadatas)
             ~> checkSingleAssignmentInBlock(N, .K, false)

    rule checkSingleAssignmentInBlock(N:SymbolicValueRef, indirectbr Ty:Type Va:ValueRef ,
                                       [ Las:LabelValues ]
                                  Meta:InstructionMetadatas, _:Bool)
         => typeCheckOp(N, .K, indirectbr Ty:Type Va:ValueRef ,
                                       [ Las:LabelValues ]
                                  Meta:InstructionMetadatas)
             ~> setOutEdge(N, getOutEdges(Las))
             ~> checkSingleAssignmentInBlock(N, .K, false)

    rule checkSingleAssignmentInBlock(N:SymbolicValueRef, switch It:IntType Va:ValueRef ,
                                       label La:ValueRef [ Ju:JumpTable ]
                                  Meta:InstructionMetadatas, _:Bool)
         => typeCheckOp(N, .K, switch It:IntType Va:ValueRef ,
                                       label La:ValueRef [ Ju:JumpTable ]
                                  Meta:InstructionMetadatas)
             ~> (setOutEdge(N, val(addNameToString(La)))
                 ~> (setOutEdge(N, getOutEdges(Ju))
             ~> checkSingleAssignmentInBlock(N, .K, false)))

    rule <k> checkSingleAssignmentInBlock(N:SymbolicValueRef, unreachable
                                  Meta:InstructionMetadatas, _:Bool)
         => checkSingleAssignmentInBlock(N, .K, false) ...</k>
        <instructionCounter> TheCount:Int => TheCount +Int 1 </instructionCounter>
         <tempBlockMap> Now:Map => Now (TheCount |-> 
           instNumInfo(TheCount, noAssign(instruction(unreachable,.Set,
                  insMetas(formElemList(Meta)))), returnInst)) </tempBlockMap>

    rule <k>checkSingleAssignmentInBlock(N:SymbolicValueRef, invoke Opc:OptCallingConv Re:RetAttrs
                                       Ty:Type Va:ValueRef (Pa:ParamList) Fu:FuncAttrs
                                       to La1:LabelValue unwind La2:LabelValue 
                                  Meta:InstructionMetadatas, _:Bool)
         => typeCheckOp(N, name(localVar, Int2String(I)), invoke Opc:OptCallingConv Re:RetAttrs
                                       Ty:Type Va:ValueRef (Pa:ParamList) Fu:FuncAttrs
                                       to La1:LabelValue unwind La2:LabelValue 
                                  Meta:InstructionMetadatas)
             ~> checkSingleAssignmentInBlock(N, .K, false) ...</k>
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
                                  Meta:InstructionMetadatas, _:Bool)
         => typeCheckOp(N, name(localVar, substrString(#tokenToString(Var),1
               ,lengthString(#tokenToString(Var)))), invoke Opc:OptCallingConv Re:RetAttrs
                                       Ty:Type Va:ValueRef (Pa:ParamList) Fu:FuncAttrs
                                       to La1:LabelValue unwind La2:LabelValue 
                                  Meta:InstructionMetadatas)
             ~> checkSingleAssignmentInBlock(N, .K, false)
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
                                  Meta:InstructionMetadatas, _:Bool) ~> K':K
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
                                  Meta:InstructionMetadatas, _:Bool) ~> K':K
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
                                  Meta:InstructionMetadatas, _:Bool)
         => typeCheckOp(N, name(localVar, substrString(#tokenToString(Var),1
                          ,lengthString(#tokenToString(Var)))), invoke Opc:OptCallingConv Re:RetAttrs
                                       Ty:Type Va:ValueRef (Pa:ParamList) Fu:FuncAttrs
                                       to La1:LabelValue unwind La2:LabelValue 
                                  Meta:InstructionMetadatas)
             ~> checkSingleAssignmentInBlock(N, .K, false)
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
                                  Meta:InstructionMetadatas, _:Bool) ~> K':K
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
                               BB:BBTerminatorInstruction, _:Bool)
         => typeCheckOp(N, name(localVar, Int2String(I)), In)
             ~> checkSingleAssignmentInBlock(N, Ins BB, false)
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
                               BB:BBTerminatorInstruction, _:Bool)
         => typeCheckOp(N, .K, Ca:OptTailCall
                        Ocv:OptCallingConv Rat:RetAttrs void
                     V1:ValueRef (Pl:ParamList) Fat:FuncAttrs
                       Meta:InstructionMetadatas)
             ~> checkSingleAssignmentInBlock(N, Ins BB, false)

    rule <k>checkSingleAssignmentInBlock(N:SymbolicValueRef, Ca:OptTailCall
                        Ocv:OptCallingConv Rat:RetAttrs Ty1:NonVoidType
                     V1:ValueRef (Pl:ParamList) Fat:FuncAttrs
                       Meta:InstructionMetadatas Ins:InstructionList
                               BB:BBTerminatorInstruction, _:Bool)
         => typeCheckOp(N, name(localVar, Int2String(I)), Ca:OptTailCall
                        Ocv:OptCallingConv Rat:RetAttrs Ty1:NonVoidType
                     V1:ValueRef (Pl:ParamList) Fat:FuncAttrs
                       Meta:InstructionMetadatas)
             ~> checkSingleAssignmentInBlock(N, Ins BB, false)
         ...</k>
         <currModule> ModName:SymbolicValueRef </currModule>
         <funModuleName> ModName </funModuleName>
         <currFunction> FunName:SymbolicValueRef </currFunction>
         <functionName> FunName </functionName>
         <varTypes> M:Map </varTypes>
         <localFunVarCounter> I:Int => I +Int 1 </localFunVarCounter>

    rule <k> checkSingleAssignmentInBlock(N:SymbolicValueRef,
               phi Ty:Type Pl:PHIList InstM:InstructionMetadatas Ins:InstructionList
                               BB:BBTerminatorInstruction, true)
         => typeCheckOp(N, name(localVar, Int2String(I)),
                      phi Ty:Type Pl:PHIList InstM:InstructionMetadatas)
             ~> checkSingleAssignmentInBlock(N, Ins BB, true)
         ...</k>
         <currModule> ModName:SymbolicValueRef </currModule>
         <funModuleName> ModName </funModuleName>
         <currFunction> FunName:SymbolicValueRef </currFunction>
         <functionName> FunName </functionName>
         <varTypes> M:Map </varTypes>
         <localFunVarCounter> I:Int => I +Int 1 </localFunVarCounter>

    rule <k> checkSingleAssignmentInBlock(N:SymbolicValueRef,
               phi Ty:Type Pl:PHIList InstM:InstructionMetadatas Ins:InstructionList
                               BB:BBTerminatorInstruction, false) ~> K:K => .K </k>
          <output>... .List =>
            ListItem("error: non-phi instructions between the start of a basic block and the PHI instructions") </output>

    rule <k> checkSingleAssignmentInBlock(N:SymbolicValueRef, Var:LocalVar = In:InstVal
               Ins:InstructionList BB:BBTerminatorInstruction, _:Bool)
         => typeCheckOp(N, name(localVar, substrString(#tokenToString(Var),1
                          ,lengthString(#tokenToString(Var)))), In)
             ~> checkSingleAssignmentInBlock(N, Ins BB, false)
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
               Ins:InstructionList BB:BBTerminatorInstruction, _:Bool) ~> K:K
         => .K </k>
         <output>... .List => ListItem("error: instructions returning void cannot have a name") </output>

    rule <k> checkSingleAssignmentInBlock(N:SymbolicValueRef, Var:LocalVar = Ca:OptTailCall
                        Ocv:OptCallingConv Rat:RetAttrs Ty1:NonVoidType
                     V1:ValueRef (Pl:ParamList) Fat:FuncAttrs
                       Meta:InstructionMetadatas
               Ins:InstructionList BB:BBTerminatorInstruction, _:Bool)
         => typeCheckOp(N, name(localVar, substrString(#tokenToString(Var),1
                          ,lengthString(#tokenToString(Var)))), Ca:OptTailCall
                        Ocv:OptCallingConv Rat:RetAttrs Ty1:NonVoidType
                     V1:ValueRef (Pl:ParamList) Fat:FuncAttrs
                       Meta:InstructionMetadatas)
             ~> checkSingleAssignmentInBlock(N, Ins BB, false)
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
               Ins:InstructionList BB:BBTerminatorInstruction, true)
         => typeCheckOp(N, name(localVar, substrString(#tokenToString(Var),1
                          ,lengthString(#tokenToString(Var)))),
                             phi Ty:Type Pl:PHIList InstM:InstructionMetadatas)
             ~> checkSingleAssignmentInBlock(N, Ins BB, true)
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
               Ins:InstructionList BB:BBTerminatorInstruction, false) ~> K':K
         => .K </k>
          <output>... .List =>
             ListItem("error: non-phi instructions between the start of a basic block and the PHI instructions") </output>

    rule <k> checkSingleAssignmentInBlock(N:SymbolicValueRef, Var:LocalVar = In:InstVal
               Ins:InstructionList BB:BBTerminatorInstruction, _:Bool) ~> K':K
         => .K </k>
         <currModule> ModName:SymbolicValueRef </currModule>
         <funModuleName> ModName </funModuleName>
         <currFunction> FunName:SymbolicValueRef </currFunction>
         <functionName> FunName </functionName>
         <varTypes> M:Map </varTypes>
         <output>... .List => ListItem(" multiple definition of local value named '"
                   +String substrString(#tokenToString(Var),1
               ,lengthString(#tokenToString(Var))) +String "'") </output>
         requires (name(localVar, substrString(#tokenToString(Var),1
                          ,lengthString(#tokenToString(Var)))) in keys(M))

    rule <k>checkSingleAssignmentInBlock(N:SymbolicValueRef, Var:LocalValID = In:InstVal
               Ins:InstructionList BB:BBTerminatorInstruction, _:Bool)
         => typeCheckOp(N, name(localVar, substrString(#tokenToString(Var),1
                          ,lengthString(#tokenToString(Var)))), In)
             ~> checkSingleAssignmentInBlock(N, Ins BB, false)
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
               Ins:InstructionList BB:BBTerminatorInstruction, _:Bool) ~> K:K
         =>  .K </k>
         <output>... .List => ListItem("error: instructions returning void cannot have a name") </output>

    rule <k>checkSingleAssignmentInBlock(N:SymbolicValueRef,
                      Var:LocalValID = Ca:OptTailCall
                        Ocv:OptCallingConv Rat:RetAttrs Ty1:NonVoidType
                     V1:ValueRef (Pl:ParamList) Fat:FuncAttrs
                       Meta:InstructionMetadatas
               Ins:InstructionList BB:BBTerminatorInstruction, _:Bool)
         => typeCheckOp(N, name(localVar, substrString(#tokenToString(Var),1
                          ,lengthString(#tokenToString(Var)))), Ca:OptTailCall
                        Ocv:OptCallingConv Rat:RetAttrs Ty1:NonVoidType
                     V1:ValueRef (Pl:ParamList) Fat:FuncAttrs
                       Meta:InstructionMetadatas)
             ~> checkSingleAssignmentInBlock(N, Ins BB, false)
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
               Ins:InstructionList BB:BBTerminatorInstruction, true)
         => typeCheckOp(N, name(localVar, substrString(#tokenToString(Var),1
                          ,lengthString(#tokenToString(Var)))),
                          phi Ty:Type Pl:PHIList InstM:InstructionMetadatas)
             ~> checkSingleAssignmentInBlock(N, Ins BB, true)
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
               Ins:InstructionList BB:BBTerminatorInstruction, false) ~> K:K
         => .K </k>
          <output>... .List =>
           ListItem("error: non-phi instructions between the start of a basic block and the PHI instructions") </output>

    rule <k>checkSingleAssignmentInBlock(N:SymbolicValueRef, Var:LocalValID = In:InstVal
               Ins:InstructionList BB:BBTerminatorInstruction, _:Bool) ~> K':K
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
                    Inm:InstructionMetadatas Ins:InstructionList BB:BBTerminatorInstruction, _:Bool)
         => typeCheckOp(N, .K, store Ovl:OptVolatile
                  Ty1:Type V1:ValueRef, Ty2:Type V2:ValueRef, Al:Align
                    Inm:InstructionMetadatas)
             ~> checkSingleAssignmentInBlock(N, Ins BB, false)

    rule checkSingleAssignmentInBlock(N:SymbolicValueRef, store Ovl:OptVolatile
                  Ty1:Type V1:ValueRef, Ty2:Type V2:ValueRef
                    Inm:InstructionMetadatas Ins:InstructionList BB:BBTerminatorInstruction, _:Bool)
         => typeCheckOp(N, .K, store Ovl:OptVolatile
                         Ty1:Type V1:ValueRef, Ty2:Type V2:ValueRef
                          Inm:InstructionMetadatas)
             ~> checkSingleAssignmentInBlock(N, Ins BB, false)
/*
do the same for another store operation:
"store" OptAtomic OptVolatile ResolvedVal "," ResolvedVal OptScopeOrder InstructionMetadatas
*/
    rule checkSingleAssignmentInBlock(N:SymbolicValueRef
                                      , store Oac:Atomic Ovl:OptVolatile Ty1:Type V1:ValueRef ,
                                            Ty2:Type V2:ValueRef Ost:OptSingleThread Ord:Ordering, Al:Align
                                            Ins:InstructionMetadatas Ili:InstructionList
                                            BB:BBTerminatorInstruction, _:Bool)
          => typeCheckOp(N, .K, store Oac:Atomic Ovl:OptVolatile Ty1:Type V1:ValueRef ,
                                            Ty2:Type V2:ValueRef Ost:OptSingleThread Ord:Ordering, Al:Align
                                            Ins:InstructionMetadatas)
             ~> checkSingleAssignmentInBlock(N, Ili BB, false)
/*
create an abstract for fence and do the same for fence operation.
"fence" OptSingleThread Ordering InstructionMetadatas
*/
    rule checkSingleAssignmentInBlock(N:SymbolicValueRef
                                      , fence Ost:OptSingleThread Ord:Ordering 
                                            Ins:InstructionMetadatas Ili:InstructionList
                                            BB:BBTerminatorInstruction
                                      , _:Bool)
          => typeCheckOp(N, .K, fence Ost:OptSingleThread Ord:Ordering 
                                            Ins:InstructionMetadatas)
               ~> checkSingleAssignmentInBlock(N, Ili BB, false)


    //get all input vars and put them into the var type map for the function
    //we also need to set the vars to the outgoing def and incomming def set for every block
    //instruction number -1 means that these vars are defined before every instruction
    rule setArgsToBlockEnv(N:SymbolicValueRef, .ElemList) => .K
    rule <k> setArgsToBlockEnv(N:SymbolicValueRef,
                valValue(typeOperandResult(T:K, V:SymbolicValueRef)), E:ElemList)
             => setArgsToBlockEnv(N:SymbolicValueRef, E:ElemList) ...</k>
        <currModule> ModName:SymbolicValueRef </currModule>
        <funModuleName> ModName </funModuleName>
        <currFunction> FunName:SymbolicValueRef </currFunction>
        <functionName> FunName </functionName>
         <basicBlocks>... N |->
                 blockContent(_:Map, _:Bool, _:Set, _:Set, Def:Set
                    (.Set => SetItem(varOp(N,-1,T, V))), _:Set,
             Def':Set (.Set => SetItem(varOp(N,-1,T, V))), _:Set, _:Set) ...</basicBlocks>
         <varTypes> M:Map (.Map => V |-> T) </varTypes>
        requires notBool V in keys(M) andBool notBool varOp(N, 0, T, V) in Def

    rule <k> setArgsToBlockEnv(N:SymbolicValueRef,
                valValue(typeOperandResult(T:K, V:SymbolicValueRef)), E:ElemList) ~> K:K
             => .K </k>
        <currModule> ModName:SymbolicValueRef </currModule>
        <funModuleName> ModName </funModuleName>
        <currFunction> FunName:SymbolicValueRef </currFunction>
        <functionName> FunName </functionName>
        <output>... .List => ListItem("error: define argument '" +String
                       #tokenToString(V) +String "' twices in the function header") </output>
        <varTypes> M:Map </varTypes>
        requires V in keys(M)

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
                 blockContent(_:Map, _:Bool, _:Set, _:Set,
                               Def:Set, _:Set, _:Set, _:Set, _:Set) ...</basicBlocks>
        requires varOp(N, 0, T, V) in Def

    //for each pair of phi edge, check if the outgoing defs have the value of the edge
    rule <k> checkingPhisInEdges ...</k>
         <matchPhisWithInEdges> ListItem(phiEdges(A:K, S:Set)) => .List ...</matchPhisWithInEdges>
        <currModule> ModName:SymbolicValueRef </currModule>
        <funModuleName> ModName </funModuleName>
         <basicBlocks>... A |->
                 blockContent(_:Map, _:Bool, _:Set, In:Set,
                             _:Set, _:Set, _:Set, _:Set, _:Set) ...</basicBlocks>
        <currFunction> FunName:SymbolicValueRef </currFunction>
        <functionName> FunName </functionName>
        requires S <=Set In andBool In <=Set S

    rule <k> checkingPhisInEdges ~> K:K => .K </k>
         <output>... .List => ListItem("bad number of edges of a phi function.") </output>
         <matchPhisWithInEdges> ListItem(phiEdges(A:K, S:Set)) ...</matchPhisWithInEdges>
        <currModule> ModName:SymbolicValueRef </currModule>
        <funModuleName> ModName </funModuleName>
         <basicBlocks>... A |->
                 blockContent(_:Map, _:Bool, _:Set, In:Set, 
                           _:Set, _:Set, _:Set, _:Set, _:Set) ...</basicBlocks>
        <currFunction> FunName:SymbolicValueRef </currFunction>
        <functionName> FunName </functionName>
        requires (notBool S <=Set In) orBool (notBool In <=Set S)

    rule <k> checkingPhisInEdges => .K ...</k>
         <matchPhisWithInEdges> .List </matchPhisWithInEdges>

    //set label names as variables for all blocks
    rule <k> setLabelVars => setLabelVarsAux(makeLabelToVars(keys(M),
                       .Set), M, .K, .K, .Map) ...</k>
        <currModule> ModName:SymbolicValueRef </currModule>
        <funModuleName> ModName </funModuleName>
        <currFunction> FunName:SymbolicValueRef </currFunction>
        <functionName> FunName </functionName>
         <basicBlocks> M:Map </basicBlocks>

    rule <k> setLabelVars(M':Map) => .K ...</k>
        <currModule> ModName:SymbolicValueRef </currModule>
        <funModuleName> ModName </funModuleName>
        <currFunction> FunName:SymbolicValueRef </currFunction>
        <functionName> FunName </functionName>
         <basicBlocks> M:Map => M' </basicBlocks>

    //check the unchecked uses indeed have fathers.
    rule <k> checkUseVars => checkUseVars(.K, M) ...</k>
        <currModule> ModName:SymbolicValueRef </currModule>
        <funModuleName> ModName </funModuleName>
        <currFunction> FunName:SymbolicValueRef </currFunction>
        <functionName> FunName </functionName>
         <basicBlocks> M:Map </basicBlocks>

    rule checkUseVars(.K, .Map) => .K
    rule checkUseVars(.K, (A:K |-> B:K) M:Map)
            => checkUseVars(B, M)
    rule checkUseVars(blockContent(Is:Map,
              Fl:Bool, Out:Set, In:Set, InDef:Set,
            InUse:Set, OutDef:Set, OutUse:Set, TheUse:Set), M:Map)
            => checkUseVarsAux(.K, In, TheUse) ~> checkUseVars(.K, M)

    rule checkUseVarsAux(.K, In:Set, .Set) => .K
    rule checkUseVarsAux(.K, In:Set, SetItem(A:K) S:Set)
            => checkUseVarsAux(A, In, S)
    rule <k> checkUseVarsAux(A:KItem, In:Set, S:Set)
                => checkUseVarsAux(.K, In:Set, S) ...</k>
         <currModule> ModName:SymbolicValueRef </currModule>
         <funModuleName> ModName </funModuleName>
         <currFunction> FunName:SymbolicValueRef </currFunction>
         <functionName> FunName </functionName>
         <basicBlocks> M:Map </basicBlocks>
         requires allHaveDef(A, .K, .K, In, M)

    rule <k> checkUseVarsAux(A:KItem, In:Set, S:Set)
                ~> K:K => .K </k>
         <output>... .List => ListItem("Some used variables have not defined dominantly.") </output>
         <currModule> ModName:SymbolicValueRef </currModule>
         <funModuleName> ModName </funModuleName>
         <currFunction> FunName:SymbolicValueRef </currFunction>
         <functionName> FunName </functionName>
         <basicBlocks> M:Map </basicBlocks>
         requires notBool allHaveDef(A, .K, .K, In, M)

    //check the unchecked uses of phi function and phi functions should always be the first of a block
    rule <k> checkUseVarInPhi => checkUseVarInPhi(1, .Map,
                                   .K, getAllInsts(values(M))) ...</k>
        <currModule> ModName:SymbolicValueRef </currModule>
        <funModuleName> ModName </funModuleName>
        <currFunction> FunName:SymbolicValueRef </currFunction>
        <functionName> FunName </functionName>
         <basicBlocks> M:Map </basicBlocks>

    rule checkUseVarInPhi(N:Int, .Map, .K, .List) => .K
    rule checkUseVarInPhi(N:Int, .Map, .K, ListItem(instMap(M:Map)) L:List)
              => checkUseVarInPhi(1, M, .K, L)
    rule checkUseVarInPhi(N:Int, (N |-> A:K) M:Map,.K, L:List)
        => checkUseVarInPhi(N:Int, M:Map, A, L:List)
    rule checkUseVarInPhi(N:Int, M:Map, instNumInfo(N, assign(Var:K,
          instruction(phi(T:K, El:ElemList),Ats:Set,Meta:K)), phiInst), L:List)
        => checkUseVarInPhiAux(T, El) ~> checkUseVarInPhi(N +Int 1, M, .K, L:List)
    rule checkUseVarInPhi(N:Int, M:Map, instNumInfo(N, In:K, La:K), L:List)
        => checkFirstInPhi(N +Int 1, M, .K, L:List)
         requires La =/=K phiInst

    rule checkFirstInPhi(N:Int, .Map, .K, .List) => .K
    rule checkFirstInPhi(N:Int, .Map, .K, ListItem(instMap(M:Map)) L:List)
              => checkUseVarInPhi(1, M, .K, L)
    rule checkFirstInPhi(N:Int, (N |-> A:K) M:Map, .K, L:List)
         => checkFirstInPhi(N, M, A, L)
    rule checkFirstInPhi(N:Int, M:Map, instNumInfo(N, In:K, La:K), L:List)
         => checkFirstInPhi(N +Int 1, M, .K, L:List)
         requires La =/=K phiInst
    rule <k> checkFirstInPhi(N:Int, M:Map, instNumInfo(N, In:K, phiInst), L:List)
                ~> K:K => .K </k>
         <output>... .List => ListItem("Having phi function not in the first place of a block.") </output>


    rule checkUseVarInPhiAux(T:K, .ElemList) => .K
    rule checkUseVarInPhiAux(T:KResult, val(edge(V:K, L:SymbolicValueRef)),El:ElemList)
            => checkUseVarInPhiAux(T, El)
         requires notBool isLocalVariable(V)
    rule <k> checkUseVarInPhiAux(T:KResult, val(edge(V:K, L:SymbolicValueRef)),El:ElemList)
            => checkUseVarInPhiAux(T, El) ...</k> 
        <currModule> ModName:SymbolicValueRef </currModule>
        <funModuleName> ModName </funModuleName>
        <currFunction> FunName:SymbolicValueRef </currFunction>
        <functionName> FunName </functionName>
        <varTypes>... V |-> T ...</varTypes>
        <basicBlocks>... L |-> blockContent(_:Map, _:Bool, _:Set, _:Set, _:Set, _:Set,
                        OutDef:Set, _:Set, _:Set) ...</basicBlocks>
         requires isLocalVariable(V) andBool isInDefs(V, .K, OutDef)

     rule <k> checkUseVarInPhiAux(T:KResult, val(edge(V:K, L:SymbolicValueRef)),El:ElemList)
            ~> K:K => .K </k> 
         <output>... .List => ListItem("phi function has a variable that does not match type.") </output>
        <currModule> ModName:SymbolicValueRef </currModule>
        <funModuleName> ModName </funModuleName>
        <currFunction> FunName:SymbolicValueRef </currFunction>
        <functionName> FunName </functionName>
        <varTypes>... V |-> T':K ...</varTypes>
         requires isLocalVariable(V) andBool T =/=K T'

     rule <k> checkUseVarInPhiAux(T:K, val(edge(V:K, L:SymbolicValueRef)),El:ElemList)
            ~> K:K => .K </k> 
         <output>... .List => ListItem("phi function has a undefined variable.") </output>
        <currModule> ModName:SymbolicValueRef </currModule>
        <funModuleName> ModName </funModuleName>
        <currFunction> FunName:SymbolicValueRef </currFunction>
        <functionName> FunName </functionName>
        <basicBlocks>... L |-> blockContent(_:Map, _:Bool, _:Set, _:Set, _:Set, _:Set,
                        OutDef:Set, _:Set, _:Set) ...</basicBlocks>
         requires isLocalVariable(V) andBool notBool isInDefs(V, .K, OutDef)

    //define checkSingleAssignment
    //bugs and ambiguity in the LLVM document about the numbered label value
    rule <k> checkSingleAssignment(.K)
               => setInEdges(keys(M))
                  ~> (setLoopFlag
                  ~> (setLabelVars
                  ~> calDefUse(.K, SetItem(InitName), .Set)
                  //~> setBlockPaths(.K, keys(M))
                  //~> setBlockInDefs(.K, keys(M))
                  //~> setBlockInUses(.K, keys(M))
                  //~> setBlockDependencies(.K, keys(M))
                  ~> (checkingPhisInEdges
                  ~> (checkUseVarInPhi
                    ~> checkUseVars)))) ...</k>
        <currModule> ModName:SymbolicValueRef </currModule>
        <funModuleName> ModName </funModuleName>
        <initialBasicBlock> InitName:SymbolicValueRef </initialBasicBlock>
         <basicBlocks> M:Map </basicBlocks>
        <currFunction> FunName:SymbolicValueRef </currFunction>
        <functionName> FunName </functionName>
        <formalParameters> arguments(E:ElemList) </formalParameters>


    //case 1: if the block comes with a label
    //the label is an english name instead of a number
    rule <k> checkSingleAssignment(L:LabelStringConstant Ins:InstructionList
                                BB:BBTerminatorInstruction BBL:BasicBlockList)
         => setArgsToBlockEnv(addNameToString(L), getArgsInFunction(Args))
              ~> checkSingleAssignmentInBlock(addNameToString(L),Ins BB, true)
           ~> checkSingleAssignment(BBL) ...</k>
        <instructionCounter> Num:Int => 1 </instructionCounter>
        <currModule> ModName:SymbolicValueRef </currModule>
        <funModuleName> ModName </funModuleName>
         <basicBlocks> M':Map (.Map  => addNameToString(L)
              |-> blockContent(.Map, false, .Set, .Set,
                  SetItem(varOp(addNameToString(L),0,label, addNameToString(L))),
               .Set, SetItem(varOp(addNameToString(L),0,label, addNameToString(L))), .Set, .Set)) </basicBlocks>
        <currFunction> FunName:SymbolicValueRef </currFunction>
        <functionName> FunName </functionName>
        <formalParameters> arguments(Args:ElemList) </formalParameters>
         <varTypes> M:Map (.Map =>  addNameToString(L) |-> label) </varTypes>
         requires notBool addNameToString(L) in keys(M)
                  andBool notBool isIntString(substrString(#tokenToString(L), 0
                                        , lengthString(#tokenToString(L)) -Int 1))

    //case 2: if the block name has been defined once.
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

    //case 3, if the block name is a num, then the integer number must be in order
    rule <k> checkSingleAssignment(L:LabelStringConstant Ins:InstructionList
                                BB:BBTerminatorInstruction BBL:BasicBlockList)
         => setArgsToBlockEnv(addNameToString(L), getArgsInFunction(Args))
              ~> checkSingleAssignmentInBlock(addNameToString(L),Ins BB, true)
           ~> checkSingleAssignment(BBL) ...</k>
        <instructionCounter> Num:Int => 1 </instructionCounter>
        <currModule> ModName:SymbolicValueRef </currModule>
        <funModuleName> ModName </funModuleName>
        <currFunction> FunName:SymbolicValueRef </currFunction>
        <functionName> FunName </functionName>
        <formalParameters> arguments(Args:ElemList) </formalParameters>
         <localFunVarCounter> I:Int => I +Int 1 </localFunVarCounter>
         <basicBlocks> M':Map (.Map  => addNameToString(L)
                         |-> blockContent(.Map, false, .Set, .Set,
                      SetItem(varOp(addNameToString(L),0,label, addNameToString(L))),
            .Set, SetItem(varOp(addNameToString(L),0,label, addNameToString(L))), .Set, .Set)) </basicBlocks>
         <varTypes> M:Map (.Map => addNameToString(L) |-> label) </varTypes>
         requires notBool addNameToString(L) in keys(M)
                  andBool isIntString(substrString(#tokenToString(L), 0
                                        , lengthString(#tokenToString(L)) -Int 1))
                  andBool  String2Int(substrString(#tokenToString(L),0
                                   ,lengthString(#tokenToString(L)) -Int 1)) ==Int I

    //case 4: if the label number is not in order with the var number in the fun
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
         requires isIntString(substrString(#tokenToString(L), 0
                                        , lengthString(#tokenToString(L)) -Int 1))
                 andBool String2Int(substrString(#tokenToString(L),0
                        ,lengthString(#tokenToString(L)) -Int 1)) =/=Int I

    //case 5: same as case 1, but the block is the final one in a function
    rule <k> checkSingleAssignment(L:LabelStringConstant Ins:InstructionList
                                BB:BBTerminatorInstruction)
           => setArgsToBlockEnv(addNameToString(L), getArgsInFunction(Args))
              ~> checkSingleAssignmentInBlock(addNameToString(L),Ins BB, true)
                 ~> checkSingleAssignment(.K) ...</k>
        <instructionCounter> Num:Int => 1 </instructionCounter>
        <currModule> ModName:SymbolicValueRef </currModule>
        <funModuleName> ModName </funModuleName>
        <currFunction> FunName:SymbolicValueRef </currFunction>
        <functionName> FunName </functionName>
        <formalParameters> arguments(Args:ElemList) </formalParameters>
         <basicBlocks> M':Map (.Map  => addNameToString(L)
              |-> blockContent(.Map, false, .Set, .Set,
                  SetItem(varOp(addNameToString(L),0,label, addNameToString(L))),
               .Set, SetItem(varOp(addNameToString(L),0,label, addNameToString(L))), .Set, .Set)) </basicBlocks>
         <varTypes> M:Map ( .Map => addNameToString(L) |-> label) </varTypes>
         requires notBool addNameToString(L) in keys(M)
                  andBool notBool isIntString(substrString(#tokenToString(L), 0
                                        , lengthString(#tokenToString(L)) -Int 1))

    //case 6: same as case 2 failure, but the block is the final one
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

    //case 7: same as case 3, but the block is the final one
    rule <k> checkSingleAssignment(L:LabelStringConstant Ins:InstructionList
                                BB:BBTerminatorInstruction)
           => setArgsToBlockEnv(addNameToString(L), getArgsInFunction(Args))
              ~> checkSingleAssignmentInBlock(addNameToString(L),Ins BB, true)
                  ~> checkSingleAssignment(.K) ...</k>
        <instructionCounter> Num:Int => 1 </instructionCounter>
        <currModule> ModName:SymbolicValueRef </currModule>
        <funModuleName> ModName </funModuleName>
        <formalParameters> arguments(Args:ElemList) </formalParameters>
        <currFunction> FunName:SymbolicValueRef </currFunction>
        <functionName> FunName </functionName>
         <basicBlocks> M':Map (.Map  => addNameToString(L)
                         |-> blockContent(.Map, false, .Set, .Set,
                      SetItem(varOp(addNameToString(L),0,label, addNameToString(L))),
            .Set, SetItem(varOp(addNameToString(L),0,label, addNameToString(L))), .Set, .Set)) </basicBlocks>
         <localFunVarCounter> I:Int => I +Int 1 </localFunVarCounter>
         <varTypes> M:Map ( .Map => addNameToString(L) |-> label) </varTypes>
         requires isIntString(substrString(#tokenToString(L), 0
                                        , lengthString(#tokenToString(L)) -Int 1))
                  andBool  String2Int(substrString(#tokenToString(L),0
                                   ,lengthString(#tokenToString(L)) -Int 1)) ==Int I
                  andBool notBool addNameToString(L) in keys(M)

    //case 8: same as the case 4 failure, but the block is the final one.
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
         requires isIntString(substrString(#tokenToString(L), 0
                                        , lengthString(#tokenToString(L)) -Int 1))
                  andBool String2Int(substrString(#tokenToString(L),0
                        ,lengthString(#tokenToString(L)) -Int 1)) =/=Int I

    //case 9: no specified block name, need to create one
    rule <k>checkSingleAssignment(Ins:InstructionList
                                BB:BBTerminatorInstruction BBL:BasicBlockList)
         => setArgsToBlockEnv(name(localVar, Int2String(I)), getArgsInFunction(Args))
              ~> checkSingleAssignmentInBlock(name(localVar, Int2String(I)), Ins BB, true)
           ~> checkSingleAssignment(BBL)
         ...</k>
        <instructionCounter> Num:Int => 1 </instructionCounter>
        <currModule> ModName:SymbolicValueRef </currModule>
        <funModuleName> ModName </funModuleName>
        <formalParameters> arguments(Args:ElemList) </formalParameters>
        <currFunction> FunName:SymbolicValueRef </currFunction>
        <functionName> FunName </functionName>
        <basicBlocks> M':Map (.Map  => name(localVar, Int2String(I))
                         |-> blockContent(.Map, false, .Set, .Set,
                      SetItem(varOp(name(localVar, Int2String(I)),0,label,
                             name(localVar, Int2String(I)))),
            .Set, SetItem(varOp(name(localVar, Int2String(I)),
                    0,label, name(localVar, Int2String(I)))), .Set, .Set)) </basicBlocks>
         <varTypes> M:Map (.Map => name(localVar, Int2String(I))  |-> label) </varTypes>
        <localFunVarCounter> I:Int => I +Int 1 </localFunVarCounter>
        requires notBool name(localVar, Int2String(I)) in keys(M)

    //case 10: generated var has been defined. 
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

    //case 11: same as case 9, but block is the final one
    rule <k> checkSingleAssignment(Ins:InstructionList
                                BB:BBTerminatorInstruction)
         => setArgsToBlockEnv(name(localVar, Int2String(I)), getArgsInFunction(Args))
              ~> checkSingleAssignmentInBlock(name(localVar, Int2String(I)), Ins BB, true)
              ~> checkSingleAssignment(.K)
         ...</k>
        <instructionCounter> Num:Int => 1 </instructionCounter>
        <currModule> ModName:SymbolicValueRef </currModule>
        <funModuleName> ModName </funModuleName>
        <currFunction> FunName:SymbolicValueRef </currFunction>
        <functionName> FunName </functionName>
        <formalParameters> arguments(Args:ElemList) </formalParameters>
        <basicBlocks> M':Map (.Map  => name(localVar, Int2String(I))
                         |-> blockContent(.Map, false, .Set, .Set,
                      SetItem(varOp(name(localVar, Int2String(I)),0,label,
                             name(localVar, Int2String(I)))),
            .Set, SetItem(varOp(name(localVar, Int2String(I)),
                    0,label, name(localVar, Int2String(I)))), .Set, .Set)) </basicBlocks>
         <varTypes> M:Map (.Map => name(localVar, Int2String(I)) |-> label) </varTypes>
        <localFunVarCounter> I:Int => I +Int 1 </localFunVarCounter>
        requires notBool name(localVar, Int2String(I)) in keys(M)

    //case 12: same as case 10, but block is the final one
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
