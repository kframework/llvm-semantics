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
                   | typeCheckFloatOp(K, K, K, K, K, K, Set, InstructionMetadatas)    
                                 [strict(4)]//block name, var name, op, ty, v1, v2, attributes, instmeta
                   | typeCheckExtractValue(K, K, K, K, List, InstructionMetadatas)
                                [strict(3)]//block, variable, t1, v1, idendis, ins
                   | typeCheckExtractValueAux(K, K, K, K, K, List, List, InstructionMetadatas)
                           //block, variable, t1, temp ty1, v1, idendis, temp index, ins
                   | typeCheckInsertValueAux(K, K, K, K, K, K, K, List, List, InstructionMetadatas)
                              //block, variable, t1,temp ty1, v1,t2,v2, idendis, temp index, ins
                   | typeCheckInsertValue(K, K, K, K, K, K, List, InstructionMetadatas)
                                [strict(3,5)]//block, variable, t1, v1, idendis, ins
                   | typeCheckElemExtract(K, K, K, K, K, K, InstructionMetadatas)
                                [strict(3, 5)]//block, variable, t1, v1, t2, v2, ins
                   | typeCheckInsertElem(K, K, K, K, K, K, K, K, InstructionMetadatas)
                                [strict(3, 5, 7)]//block, variable, t1, v1, t2, v2, t3,v3, ins
                   | checkShuffleIndex(Int, K, K, K) [strict(2)]
                               //max index, cur type, cur int, elems
                   | typeCheckShuffle(K, K, K, K, K, K, K, K, InstructionMetadatas)
                                [strict(3, 5, 7)]//block, variable, t1, v1, t2, v2,t3,v3, ins
                   | typeCheckCastOp(K, K, K, K, K, K, InstructionMetadatas)
                                [strict(4, 6)]//block, variable, operator, T1, V, T2
                   | typeCheckArgList(K, ElemList)        [strict(2)]
                   | typeCheckArgWithMMX(K, K, K) // block, t, arg
                   | typeCheckMMXExpr(K, K) // t, arg
                   | typeCheckSingleArg(K, K, K) //block t, arg
                   | typeCheckIntArgs(K, K, ElemList)
                   | typeCheckFloatArgs(K, K, ElemList)
                   | typeCheckPointerArgs(K, K, ElemList)
                   | typeCheckVectorArgs(K, K, ElemList) //block, t, integer, terms
                   | preTypeCheckPointerExpr(K, K)
                   | typeCheckPointerExpr(K, K)
                   | typeCheckConstExpr(K, K)   [strict(1)]//type var
                   | typeCheckConstExprs(K, ElemList)   [strict(2)]//type, oprends
                   | typeMatch(K, K)            [strict] //type, type
                   | typeCheckExpr(K, K)//t, v
                   | preTypeCheckFloatExpr(K, K)//type, var
                   | typeCheckFloatExpr(K, K) //type, var
                   | preTypeCheckIntExpr(K, K)//type, var
                   | typeCheckIntExpr(K, K) //type, var
                   | typeCheckArrayExpr(K, Int, K) //type, n, var
                   | typeCheckArrayExpr(K, Int, K, K, K) [strict(3)]
                                                //t, integer, type, value, terms
                   | preTypeCheckStructExpr(K, K) //type, var
                   | typeCheckStructExpr(K, K, K) //temp t, type, var
                   | typeCheckStructExprAux(K, K, K) [strict(2)]//type, var
                   | preTypeCheckArrayExpr(K, Int, K) //type, n, var
                   | typeCheckArrayAux(K, K) //t, terms
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
                   //| typeCheckIntArgList(K, ElemList)        [strict(2)]
                   | TypeMatchFunctions(K, ElemList, ElemList)  [strict(2,3)]
                   | typeCheckBr(K, K, K, K, K, InstructionMetadatas)    [strict(2)]//block, t, ..., instmeta
                   | typeCheckICmp(K, K, K, K, K, K, InstructionMetadatas)
                              [strict(4)]//block, var, op, type, v1, v2, instmeta
                   | typeCheckFCmp(K, K, K, K, K, K, Set, InstructionMetadatas)
                              [strict(4)]//block, var, op, type, v1, v2, mods, instmeta
                   | typeCheckPhi(K, K, K, ElemList, ElemList, Set, ElemList, InstructionMetadatas)
                              [strict(3)]//block, var, type, value-list, label-list, phi-list, instmeta
                   | typeCheckRet(K, K, K, InstructionMetadatas)           [strict(2)]//block, t, v, Meta
                   | typeCheckCall(K, K, K, K, K, ElemList, ElemList, ParamList, Set, InstructionMetadatas)
                               [strict(4, 6, 7)]//block, var, op, t, name, argt, argv, args, mods, instmeta
                   | typeCheckSwitch(K, K, K, K, ElemList, List, Set, InstructionMetadatas)
                                          [strict(2, 5)]
                                   //block, type, v, default, argv, argl, stroed argl, val_set, instmeta
                   | typeCheckIndirectBr(K, K, K, ElemList, List, InstructionMetadatas)
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

    rule typeCheckOp(Name:SymbolicValueRef, X:SymbolicValueRef,
                      Op:FloatOps F:FastMathFlags
                 Ty:Type V1:ValueRef, V2:ValueRef Ins:InstructionMetadatas)
           => typeCheckFloatOp(Name:SymbolicValueRef, X, Op, Ty,
                           addNameToString(V1), addNameToString(V2), formSet(F), Ins)

    rule typeCheckOp(Name:SymbolicValueRef, X:SymbolicValueRef, extractelement
                 Ty1:Type V1:ValueRef, Ty2:Type V2:ValueRef Ins:InstructionMetadatas)
           => typeCheckElemExtract(Name:SymbolicValueRef, X, Ty1,
                           addNameToString(V1), Ty2, addNameToString(V2), Ins)

    rule typeCheckOp(Name:SymbolicValueRef, X:SymbolicValueRef, insertelement
                 Ty1:Type V1:ValueRef, Ty2:Type V2:ValueRef,
                     Ty3:Type V3:ValueRef Ins:InstructionMetadatas)
           => typeCheckInsertElem(Name:SymbolicValueRef, X, Ty1,
                           addNameToString(V1), Ty2, addNameToString(V2),
                             Ty3, addNameToString(V3), Ins)
    rule typeCheckOp(Name:SymbolicValueRef, X:SymbolicValueRef, shufflevector
                 Ty1:Type V1:ValueRef, Ty2:Type V2:ValueRef,
                     Ty3:Type V3:ValueRef Ins:InstructionMetadatas)
           => typeCheckShuffle(Name:SymbolicValueRef, X, Ty1,
                           addNameToString(V1), Ty2, addNameToString(V2),
                             Ty3, addNameToString(V3), Ins)

    rule typeCheckOp(Name:SymbolicValueRef, X:SymbolicValueRef, extractvalue
             Ty1:Type V1:ValueRef Cs:ConstantIndexList Ins:InstructionMetadatas)
           => typeCheckExtractValue(Name:SymbolicValueRef, X, Ty1,
                           addNameToString(V1), elemListToList(formElemList(Cs)), Ins)
    rule typeCheckOp(Name:SymbolicValueRef, X:SymbolicValueRef, insertvalue
                 Ty1:Type V1:ValueRef, Ty2:Type V2:ValueRef
                 Cs:ConstantIndexList Ins:InstructionMetadatas)
           => typeCheckInsertValue(Name:SymbolicValueRef, X, Ty1,
                           addNameToString(V1), Ty2,
                     addNameToString(V2), elemListToList(formElemList(Cs)), Ins)
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
             Fs:FastMathFlags Ty:Type V1:ValueRef , V2:ValueRef Ins:InstructionMetadatas)
         => typeCheckFCmp(Name:SymbolicValueRef, X, Op, Ty,
                  addNameToString(V1), addNameToString(V2), formSet(Fs), Ins)
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
         => typeCheckSwitch(Name:SymbolicValueRef, It, addNameToString(Va), addNameToString(La),
                                formTypeCaseSwitch(Ju), .List, .Set, Meta)

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
                        addNameToString(Va), getOutEdges(Las), .List, Meta)

    //type check insert value
    rule typeCheckInsertValue(Name:K, X:K, T:KResult, V1:K, T2:KResult, V2:K, L:List, Meta:K)
          => typeCheckInsertValueAux(Name, X, T, T, V1, T2, V2, L, L, Meta)

    rule typeCheckInsertValueAux(Name:SymbolicValueRef, X:SymbolicValueRef,
           T:K, arrayTypeValue(T1:K, I:Int), V1:K, T2:K, V2:K,
                     L1:List, ListItem(N:Int) L2:List, Meta:K)
            => typeCheckInsertValueAux(Name, X, T, T1, V1, T2, V2, L1, L2, Meta)
         requires N <Int I

    rule <k> typeCheckInsertValueAux(Name:SymbolicValueRef, X:SymbolicValueRef,
           T:K, T1:KResult, V1:K, T2:K, V2:K,
                     L1:List, ListItem(N:Int) L2:List, Meta:K) ~> K:K => .K </k>
         <output>... .List
             => ListItem("error: insert value is inserting to a place whose type cannot be extracted by the insertvalue op.") </output>
             requires notBool isArrayType(T1) andBool notBool isStructType(T1)


    rule <k> typeCheckInsertValueAux(Name:SymbolicValueRef, X:SymbolicValueRef,
           T:K, arrayTypeValue(T1:K, I:Int), V1:K, T2:K, V2:K,
                     L1:List, ListItem(N:Int) L2:List, Meta:K) ~> K:K => .K </k>
         <output>... .List
             => ListItem("error: insert value index out of range of an array type range.") </output>
             requires N >=Int I

    rule typeCheckInsertValueAux(Name:SymbolicValueRef, X:SymbolicValueRef,
           T:K, structTypeValue(Ts:K), V1:K, T2:K, V2:K,
                     L1:List, ListItem(N:Int) L2:List, Meta:K)
            => typeCheckInsertValueAux(Name, X, T,
                  getGepTypeInStruct(Ts, N), V1, T2, V2, L1, L2, Meta)
         requires getGepTypeInStruct(Ts, N) =/=K badType

    rule typeCheckInsertValueAux(Name:SymbolicValueRef, X:SymbolicValueRef,
           T:K, packedStructTypeValue(Ts:K), V1:K, T2:K, V2:K,
                     L1:List, ListItem(N:Int) L2:List, Meta:K)
            => typeCheckInsertValueAux(Name, X, T,
                          getGepTypeInStruct(Ts, N), V1, T2, V2, L1, L2, Meta)
         requires getGepTypeInStruct(Ts, N) =/=K badType

    rule <k> typeCheckInsertValueAux(Name:SymbolicValueRef, X:SymbolicValueRef,
                    T:K, structTypeValue(Ts:K), V1:K, T2:K, V2:K,
                     L1:List, ListItem(N:Int) L2:List, Meta:K) ~> K:K => .K </k>
         <output>... .List
             => ListItem("error: insert value index out of range of a struct type range.") </output>
         requires getGepTypeInStruct(Ts, N) ==K badType

    rule <k> typeCheckInsertValueAux(Name:SymbolicValueRef, X:SymbolicValueRef,
                    T:K, packedStructTypeValue(Ts:K), V1:K, T2:K, V2:K,
                     L1:List, ListItem(N:Int) L2:List, Meta:K) ~> K:K => .K </k>
         <output>... .List
             => ListItem("error: insert value index out of range of a packed struct type range.") </output>
         requires getGepTypeInStruct(Ts, N) ==K badType

    rule <k> typeCheckInsertValueAux(Name:SymbolicValueRef, X:SymbolicValueRef,
           T:KResult, T1:KResult, V1:K, T1, V2:K, L:List, .List, Meta:K)
           => typeCheckSingleArg(Name:SymbolicValueRef,
                               T, formalizeAllFloats(T, V1))
             ~> (typeCheckSingleArg(Name:SymbolicValueRef,
                               T1, formalizeAllFloats(T1, V2))
             ~> (assignUses(Name, TheCount, T1, val(V2),.ElemList)
                  ~> (assignUses(Name, TheCount, T, val(V1),.ElemList)
               ~> assignType(Name, TheCount, X, T))))  ...</k>
        <instructionCounter> TheCount:Int => TheCount +Int 1 </instructionCounter>
        <tempBlockMap> Now:Map => Now (TheCount |->
              instNumInfo(TheCount, assign(X,instruction(insertValue(T,
                    operand(T, formalizeAllFloats(T, V1)),
                operand(T1, formalizeAllFloats(T1, V2)), L), .Set,
                     insMetas(formElemList(Meta)))), normalInst)) </tempBlockMap> 
         requires isArrayType(T) orBool isStructType(T1)

    rule <k> typeCheckInsertValueAux(Name:SymbolicValueRef, X:SymbolicValueRef,
           T:KResult, T1:KResult, V1:K, T2:KResult, V2:K, L:List, .List, Meta:K)
                 ~> K:K => .K </k>
         <output>... .List => ListItem("error: insert value that does not match with the type of the original input element type.") </output>
         requires T1 =/=K T2

    //type check extract value
    rule typeCheckExtractValue(Name:K, X:K, T:KResult, V1:K, L:List, Meta:K)
          => typeCheckExtractValueAux(Name, X, T, T, V1, L, L, Meta)

    rule typeCheckExtractValueAux(Name:SymbolicValueRef, X:SymbolicValueRef,
           T:K, arrayTypeValue(T1:K, I:Int), V1:K,
                     L1:List, ListItem(N:Int) L2:List, Meta:K)
            => typeCheckExtractValueAux(Name, X, T, T1, V1, L1, L2, Meta)
         requires N <Int I

    rule <k> typeCheckExtractValueAux(Name:SymbolicValueRef, X:SymbolicValueRef,
           T:K, T1:KResult, V1:K,
                     L1:List, ListItem(N:K) L2:List, Meta:K) ~> K:K => .K </k>
         <output>... .List
           => ListItem("error: extract value is extracting invalid types to extract.") </output>
         requires notBool isArrayType(T1) andBool notBool isStructType(T1)

    rule <k> typeCheckExtractValueAux(Name:SymbolicValueRef, X:SymbolicValueRef,
           T:K, arrayTypeValue(T1:K, I:Int), V1:K,
                     L1:List, ListItem(N:Int) L2:List, Meta:K) ~> K:K => .K </k>
         <output>... .List
           => ListItem("error: extract value index out of range of an array type range.") </output>
         requires N >=Int I

    rule typeCheckExtractValueAux(Name:SymbolicValueRef, X:SymbolicValueRef,
           T:K, structTypeValue(Ts:K), V1:K,
                     L1:List, ListItem(N:Int) L2:List, Meta:K)
            => typeCheckExtractValueAux(Name, X, T,
                          getGepTypeInStruct(Ts, N), V1, L1, L2, Meta)
         requires getGepTypeInStruct(Ts, N) =/=K badType

    rule typeCheckExtractValueAux(Name:SymbolicValueRef, X:SymbolicValueRef,
           T:K, packedStructTypeValue(Ts:K), V1:K,
                     L1:List, ListItem(N:Int) L2:List, Meta:K)
            => typeCheckExtractValueAux(Name, X, T,
                          getGepTypeInStruct(Ts, N), V1, L1, L2, Meta)
         requires getGepTypeInStruct(Ts, N) =/=K badType

    rule <k> typeCheckExtractValueAux(Name:SymbolicValueRef, X:SymbolicValueRef,
                    T:K, structTypeValue(Ts:K), V1:K,
                     L1:List, ListItem(N:Int) L2:List, Meta:K) ~> K:K => .K </k>
         <output>... .List
             => ListItem("error: extract value index out of range of a struct type range.") </output>
         requires getGepTypeInStruct(Ts, N) ==K badType

    rule <k> typeCheckExtractValueAux(Name:SymbolicValueRef, X:SymbolicValueRef,
                    T:K, packedStructTypeValue(Ts:K), V1:K,
                     L1:List, ListItem(N:Int) L2:List, Meta:K) ~> K:K => .K </k>
         <output>... .List
             => ListItem("error: extract value index out of range of a packed struct type range.") </output>
         requires getGepTypeInStruct(Ts, N) ==K badType

    rule <k> typeCheckExtractValueAux(Name:SymbolicValueRef, X:SymbolicValueRef,
           T:KResult, T1:KResult, V1:K, L:List, .List, Meta:K)
           => typeCheckSingleArg(Name:SymbolicValueRef,
                               T, formalizeAllFloats(T, V1))
             ~> (assignUses(Name, TheCount, T, val(V1),.ElemList)
               ~> assignType(Name, TheCount, X, T1))  ...</k>
        <instructionCounter> TheCount:Int => TheCount +Int 1 </instructionCounter>
        <tempBlockMap> Now:Map => Now (TheCount |->
              instNumInfo(TheCount, assign(X,instruction(extractValue(
                    operand(T, formalizeAllFloats(T, V1)), L), .Set,
                     insMetas(formElemList(Meta)))), normalInst)) </tempBlockMap> 
         requires isArrayType(T) orBool isStructType(T1)

    //type check shuffle vector function
    rule checkShuffleIndex(N:Int, skipValue, skipValue, zeroinitializer) => .K
    rule checkShuffleIndex(N:Int, skipValue, skipValue, undef) => .K
    rule checkShuffleIndex(N:Int, skipValue, skipValue, vector(.ElemList)) => .K
    rule checkShuffleIndex(N:Int, skipValue, skipValue,
              vector(val(operand(T:K, V:K)), Es:ElemList))
             => checkShuffleIndex(N, T, getConstIntShuffle(V, 32), vector(Es))
    rule checkShuffleIndex(N:Int, integerType(32), intLoc(A:Int,
                       B:K, C:K, D:K, E:K), Vc:K)
             => checkShuffleIndex(N, integerType(32), A, Vc)
    rule checkShuffleIndex(N:Int, integerType(32), V:Int, Vc:K)
             => checkShuffleIndex(N, skipValue, skipValue, Vc)
         requires V <Int N andBool V >=Int 0
    rule checkShuffleIndex(N:Int, integerType(32), undef, Vc:K)
             => checkShuffleIndex(N, skipValue, skipValue, Vc)

    rule <k> checkShuffleIndex(N:Int, T:KResult, V:K, Vc:K)
              ~> K:K => .K </k>
         <output>... .List => ListItem("error: shuffle vector op index is not a valid 32 bit int type.") </output>
         requires T =/=K skipValue andBool T =/=K integerType(32)

    rule <k> checkShuffleIndex(N:Int, T:K, V:Int, Vc:K)
              ~> K:K => .K </k>
         <output>... .List => ListItem("error: shuffle vector op index out of range of the input.") </output>
         requires V >=Int N andBool V <Int 0

    rule <k> checkShuffleIndex(N:Int, T:K, badValue, Vc:K)
              ~> K:K => .K </k>
         <output>... .List => ListItem("error: shuffle vector op index is not a valid constant int.") </output>

    rule <k> typeCheckShuffle(Name:SymbolicValueRef,
                  X:K, vectorTypeValue(T:KResult, I:Int), V1:K,
                 vectorTypeValue(T:KResult, I:Int), V2:K,
               vectorTypeValue(integerType(32), I':Int), V3:K, Meta:K)
              => checkShuffleIndex( 2 *Int I, skipValue, skipValue, V3)
                ~> (exprType(typeCheckVectorArgs(Name:SymbolicValueRef,
                 vectorTypeValue(T:KResult, I:Int), val(formalizeFloats(
                          vectorTypeValue(T:KResult, I:Int), V1)),
                  val(formalizeFloats(
                          vectorTypeValue(T:KResult, I:Int), V2)),.ElemList))
                ~> (exprType(typeCheckVectorArgs(Name:SymbolicValueRef,
                  vectorTypeValue(integerType(32), I':Int), val(V3),.ElemList))
                 ~> (assignUsesInCall(Name, TheCount,
                      (valValue(typedArg(.Set,vectorTypeValue(T:KResult, I:Int),
                          formalizeFloats(vectorTypeValue(T:KResult, I:Int), V1))),
                     valValue(typedArg(.Set,vectorTypeValue(T:KResult, I:Int),
                          formalizeFloats(vectorTypeValue(T:KResult, I:Int), V2)))
                        ,valValue(typedArg(.Set,
                       vectorTypeValue(integerType(32), I':Int), V3)),.ElemList))
                 ~> assignType(Name, TheCount, X, vectorTypeValue(T:KResult, I':Int))))) ...</k>
        <instructionCounter> TheCount:Int => TheCount +Int 1 </instructionCounter>
        <tempBlockMap> Now:Map => Now (TheCount |->
              instNumInfo(TheCount, assign(X,instruction(shuffleVector(
                    vectorTypeValue(T:KResult, I:Int), formalizeFloats(
                          vectorTypeValue(T:KResult, I:Int), V1),
              formalizeFloats(vectorTypeValue(T:KResult, I:Int), V2),
             vectorTypeValue(integerType(32), I':Int), V3), .Set,
                     insMetas(formElemList(Meta)))), normalInst)) </tempBlockMap> 

    rule <k> typeCheckShuffle(Name:K, X:K, T:KResult,
                            V1:K, T2:KResult, V2:K, T3:KResult, V3:K, Meta:K) ~> K:K => .K </k>
         <output>... .List => ListItem("error: shuffle vector op must have first/second/third element being vector type.") </output>
         requires notBool isVectorType(T) orBool notBool isVectorType(T2) orBool notBool isVectorType(T3)

    rule <k> typeCheckShuffle(Name:K, X:K, T:KResult,
                V1:K, T':KResult, V2:K, T3:K, V3:K, Meta:K) ~> K:K => .K </k>
         <output>... .List => ListItem("error: shuffle vector op must have first and second vector types be the same.") </output>
         requires T =/=K T'

    rule <k> typeCheckShuffle(Name:K, X:K, T1:K, V1:K, T2:K, V2:K, 
               vectorTypeValue(A:KResult, I:Int), V3:K, Meta:K) ~> K:K => .K </k>
         <output>... .List => ListItem("error: shuffle vector op must have third element being i32 integer type.") </output>
         requires A =/=K integerType(32)

    //type check insertelement functions
    rule <k> typeCheckInsertElem(Name:SymbolicValueRef,
                  X:K, vectorTypeValue(T:KResult, I:Int), V1:K,
                 T:KResult, V2:K, integerType(N:Int), V3:K, Meta:K)
              => exprType(typeCheckVectorArgs(Name:SymbolicValueRef,
                 vectorTypeValue(T:KResult, I:Int), val(formalizeFloats(
                          vectorTypeValue(T:KResult, I:Int), V1)),.ElemList))
                ~> (typeCheckSingleArg(Name:SymbolicValueRef,
                               T, formalizeFloat(T, V2))
                 ~> (exprType(typeCheckIntArgs(Name:SymbolicValueRef,
                     integerType(N), val(V3),.ElemList))
                 ~> (assignUsesInCall(Name, TheCount,
                      (valValue(typedArg(.Set,vectorTypeValue(T:KResult, I:Int),
                          formalizeFloats(
                          vectorTypeValue(T:KResult, I:Int), V1))),
                     valValue(typedArg(.Set, T, formalizeFloat(T, V2)))
                        ,valValue(typedArg(.Set, integerType(N), V3)),.ElemList))
                 ~> assignType(Name, TheCount, X, vectorTypeValue(T:KResult, I:Int))))) ...</k>
        <instructionCounter> TheCount:Int => TheCount +Int 1 </instructionCounter>
        <tempBlockMap> Now:Map => Now (TheCount |->
              instNumInfo(TheCount, assign(X,instruction(insertElem(
                    vectorTypeValue(T:KResult, I:Int), formalizeFloats(
                          vectorTypeValue(T:KResult, I:Int), V1),
              T,  formalizeFloat(T, V2), integerType(N), V3), .Set,
                     insMetas(formElemList(Meta)))), normalInst)) </tempBlockMap> 

    rule <k> typeCheckInsertElem(Name:K, X:K, T:KResult,
                            V1:K, T2:K, V2:K, T3:K, V3:K, Meta:K) ~> K:K => .K </k>
         <output>... .List
           => ListItem("error: insert element op must have first element being vector type.") </output>
         requires notBool isVectorType(T)

    rule <k> typeCheckInsertElem(Name:K, X:K, vectorTypeValue(T:KResult, I:Int),
                V1:K, T':KResult, V2:K, T3:K, V3:K, Meta:K) ~> K:K => .K </k>
         <output>... .List
           => ListItem("error: insert element op must have first vector element type be the type of the second argument.") </output>
         requires T =/=K T'

    rule <k> typeCheckInsertElem(Name:K, X:K, T1:K, V1:K,
                T2:K, V2:K, T3:KResult, V3:K, Meta:K) ~> K:K => .K </k>
         <output>... .List
           => ListItem("error: insert element op must have third element being integer type.") </output>
         requires notBool isIntegerType(T3)

    //type check elementextract function
    rule <k> typeCheckElemExtract(Name:SymbolicValueRef,
                  X:K, vectorTypeValue(T:KResult, I:Int),
                        V1:K, integerType(N:Int), V2:K, Meta:K)
              => exprType(typeCheckVectorArgs(Name:SymbolicValueRef,
                 vectorTypeValue(T:KResult, I:Int), val(formalizeFloats(
                          vectorTypeValue(T:KResult, I:Int), V1)),.ElemList))
                 ~> (exprType(typeCheckIntArgs(Name:SymbolicValueRef,
                     integerType(N), val(V2),.ElemList))
                 ~> (assignUsesInCall(Name, TheCount,
                      (valValue(typedArg(.Set,vectorTypeValue(T:KResult, I:Int),
                          formalizeFloats(
                          vectorTypeValue(T:KResult, I:Int), V1)))
                        ,valValue(typedArg(.Set, integerType(N), V2)),.ElemList))
                 ~> assignType(Name, TheCount, X, T))) ...</k>
        <instructionCounter> TheCount:Int => TheCount +Int 1 </instructionCounter>
        <tempBlockMap> Now:Map => Now (TheCount |->
              instNumInfo(TheCount, assign(X,instruction(elemExtract(
                    vectorTypeValue(T:KResult, I:Int), formalizeFloats(
                          vectorTypeValue(T:KResult, I:Int), V1), integerType(N), V2), .Set,
                     insMetas(formElemList(Meta)))), normalInst)) </tempBlockMap> 

    rule <k> typeCheckElemExtract(Name:K, X:K, T:KResult, V1:K, T2:K, V2:K, Meta:K)
           ~> K:K => .K </k>
         <output>... .List
           => ListItem("error: element extract op must have first element being vector type.") </output>
         requires notBool isVectorType(T)

    rule <k> typeCheckElemExtract(Name:K, X:K, T:K, V1:K, T2:KResult, V2:K, Meta:K)
           ~> K:K => .K </k>
         <output>... .List
           => ListItem("error: element extract op must have second element being integer type.") </output>
         requires notBool isIntegerType(T)

    //type check the gep int list coordinated with the type
    rule singleGepTypeCheck(Name:K, Count:Int, X:K, Ad:Int, T:KResult)
          => assignType(Name, Count, X, pointerTypeValue(T, Ad))

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

    rule vectorGepTypeCheck(Name:K, Count:Int, X:K,
                              As:Int, T:K, Res:List, ListItem(Es:ElemList) L:List)
            => typeCheckInGepList(Name, gepTypeBag(T), Es)
                  ~> vectorGepTypeCheck(Name, Count, X, As, T, Res, L)
    rule T:KResult ~> vectorGepTypeCheck(Name:K,
                      Count:Int, X, As:Int, T':K, Res:List, L:List)
            => vectorGepTypeCheck(Name, Count, X, As, T', Res ListItem(T), L)

    rule vectorGepTypeCheck(Name:K,
                Count:Int, X:K,  Ad:Int, T:K, Res:List, .List)
           => assignType(Name, Count, X, vectorTypeValue(
                     pointerTypeValue(T, Ad), size(Res)))
         requires isAllSameType(Res)

    rule <k> vectorGepTypeCheck(Name:K,
          Count:Int, X:K,  Ad:Int, T:K, Res:List, .List) ~> K:K => .K </k>
         <output>... .List =>
            ListItem("error: vector type sub indices do not match with each other.") </output>
         requires notBool isAllSameType(Res)

    //TODO: deal with other constant expr cases
    rule <k> typeCheckGepOp(Name:SymbolicValueRef, X:SymbolicValueRef,
                                T:KResult, pointerTypeValue(T, A:K), V:K,
                                  L:KResult, Mods:Set, Meta:InstructionMetadatas)
              => typeCheckSingleArg(Name, pointerTypeValue(T, A), V)
                  ~> (singleGepTypeCheck(Name, TheCount, X, A,
                           typeCheckInGepList(Name, gepTypeBag(T), L))
                 ~> assignUsesInCall(Name, TheCount, valValue((typedArg(.Set,
                               pointerTypeValue(T, A:K), V:K))),toArgList(L)))
         ...</k>
        <instructionCounter> TheCount:Int => TheCount +Int 1 </instructionCounter>
        <tempBlockMap> Now:Map => Now (TheCount |->
              instNumInfo(TheCount, assign(X, instruction(getElementPtr(
                       pointerTypeValue(T, A:K), V, toGepOperand(L)), Mods getInrange(L)
                          , insMetas(formElemList(Meta)))), normalInst)) </tempBlockMap>
         requires notBool hasVectorInList(L)

    rule <k> typeCheckGepOp(Name:SymbolicValueRef, X:SymbolicValueRef,
                                T:KResult, pointerTypeValue(T, A:K),
                        V:K, L:KResult, Mods:Set, Meta:InstructionMetadatas)
              => typeCheckSingleArg(Name, pointerTypeValue(T, A), V)
             ~> (vectorGepTypeCheck(Name, TheCount,X,A, T, .List,
                 divideElemList(fulfillVector(L, getVectorNum(L)), .List))
                 ~> assignUsesInCall(Name, TheCount, valValue((typedArg(.Set,
            pointerTypeValue(T, A:K), V:K))),toArgList(L))) ...</k>
        <instructionCounter> TheCount:Int => TheCount +Int 1 </instructionCounter>
        <tempBlockMap> Now:Map => Now (TheCount |->
              instNumInfo(TheCount, assign(X, instruction(getElementPtr(
             vectorTypeValue(pointerTypeValue(T, A:K), getVectorNum(L)),
                vector(copyOfElemList(pointerTypeValue(T, A:K),V,getVectorNum(L))),
            toGepOperand(fulfillVector(L, getVectorNum(L)))),
        Mods getInrange(L), insMetas(formElemList(Meta)))), normalInst)) </tempBlockMap>
         requires hasVectorInList(L) andBool getVectorNum(L) =/=K badType
                  andBool isSameVectorNum(L, getVectorNum(L))
               andBool allSameStructVectorNum(gepTypeBag(T),
                                 fulfillVector(L, getVectorNum(L)))

    rule <k> typeCheckGepOp(Name:SymbolicValueRef, X:SymbolicValueRef,
                                T:KResult, pointerTypeValue(T, A:K),
            V:K, L:KResult, Mods:Set, Meta:InstructionMetadatas) ~> K:K </k>
         <output>... .List =>
            ListItem("error: vector type in getelementptr has no unique vector number.") </output>
         requires hasVectorInList(L) andBool notBool isSameVectorNum(L, getVectorNum(L))

    rule <k> typeCheckGepOp(Name:SymbolicValueRef, X:SymbolicValueRef,
                                T:KResult, pointerTypeValue(T, A:K),
            V:K, L:KResult, Mods:Set, Meta:InstructionMetadatas) ~> K:K </k>
         <output>... .List =>
            ListItem("error: there is a vector position in getelementptr that is struct type position but has no same numbers in all positions.") </output>
         requires hasVectorInList(L) andBool notBool notBool isSameVectorNum(L, getVectorNum(L))
               andBool notBool allSameStructVectorNum(gepTypeBag(T),
                                 fulfillVector(L, getVectorNum(L)))

    rule <k> typeCheckGepOp(Name:SymbolicValueRef, X:SymbolicValueRef, T:KResult,
                 vectorTypeValue(pointerTypeValue(T, A:K), N:Int),
                 V:K, L:KResult, Mods:Set, Meta:InstructionMetadatas)
              => typeCheckSingleArg(Name,
                       vectorTypeValue(pointerTypeValue(T, A:K), N), V)
              ~> (vectorGepTypeCheck(Name, TheCount, X, A, T, .List,
                 divideElemList(fulfillVector(L, N), .List))
                 ~> assignUsesInCall(Name, TheCount, valValue((typedArg(.Set,
            vectorTypeValue(pointerTypeValue(T, A:K), N), V:K))),toArgList(L))) ...</k>
        <instructionCounter> TheCount:Int => TheCount +Int 1 </instructionCounter>
        <tempBlockMap> Now:Map => Now (TheCount |->
              instNumInfo(TheCount, assign(X, instruction(getElementPtr(
      vectorTypeValue(pointerTypeValue(T, A:K), N), V, toGepOperand(fulfillVector(L, N))),
        Mods getInrange(L), insMetas(formElemList(Meta)))), normalInst)) </tempBlockMap>
        requires isSameVectorNum(L, N)
               andBool allSameStructVectorNum(gepTypeBag(T), fulfillVector(L, N))

    rule <k> typeCheckGepOp(Name:SymbolicValueRef, X:SymbolicValueRef, T:KResult,
                 vectorTypeValue(pointerTypeValue(T, A:K), N:Int),
                 V:K, L:KResult, Mods:Set, Meta:InstructionMetadatas) ~> K:K
               => .K </k>
         <output>... .List =>
            ListItem("error: vector type in getelementptr has no unique vector number.") </output>
        requires notBool isSameVectorNum(L, N)

    rule <k> typeCheckGepOp(Name:SymbolicValueRef, X:SymbolicValueRef, T:KResult,
                 vectorTypeValue(pointerTypeValue(T, A:K), N:Int),
                 V:K, L:KResult, Mods:Set, Meta:InstructionMetadatas) ~> K:K
               => .K </k>
         <output>... .List =>
            ListItem("error: there is a vector position in getelementptr that is struct type position but has no same numbers in all positions.") </output>
        requires isSameVectorNum(L, N)
               andBool notBool allSameStructVectorNum(gepTypeBag(T), fulfillVector(L, N))

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
                  alloca(T,preAlloca(integerType(I:Int), V), Ad, Align, false),
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
        <tempLabelUses> TL:Set (.Set => SetItem(name(localVar, S:String))) </tempLabelUses>
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

    //type check switch
    rule <k> typeCheckSwitch(Name:SymbolicValueRef, It:KResult, V:K, L:K,
                .ElemList, Rs:List, So:Set, Meta:InstructionMetadatas)
                => exprType(typeCheckIntArgs(Name, It, val(V),.ElemList))
                ~> (checkUseVarInside(Name, label, L)
                 ~> (assignUses(Name, TheCount, label, (val(L),.ElemList))
                   ~> assignUses(Name, TheCount, It, (val(V),.ElemList)))) ...</k>
         <currModule> ModName:SymbolicValueRef </currModule>
        <instructionCounter> TheCount:Int => TheCount +Int 1 </instructionCounter>
        <tempLabelUses> TL:Set (.Set => SetItem(L)) </tempLabelUses>
         <funModuleName> ModName </funModuleName>
         <currFunction> FunName:SymbolicValueRef </currFunction>
         <functionName> FunName </functionName>
        <tempBlockMap> Now:Map => Now (TheCount |->
             instNumInfo(TheCount, noAssign(instruction(
               switch(It, V, L, Rs),.Set
                   ,insMetas(formElemList(Meta)))), terminators)) </tempBlockMap>
         requires isLocalVariable(L)

    rule <k> typeCheckSwitch(Name:SymbolicValueRef, It:KResult, V:K, L:K, .ElemList, 
                  Rs:List, So:Set, Meta:InstructionMetadatas) ~> K:K => .K </k>
         <output>... .List => ListItem("error: default destination in switch must be a valid label.") </output>
         requires notBool isLocalVariable(L)

    rule <k> (.K => (checkUseVarInside(Name, label, L1)
                 ~> assignUses(Name, TheCount, label, (val(L1),.ElemList)))) ~> 
               (typeCheckSwitch(Name:SymbolicValueRef, It:KResult, V:K, L:K,
                valValue(typedCase(integerType(N:Int), I:Int, L1:K)),Es:ElemList, 
                   Rs:List, So:Set, Meta:InstructionMetadatas)
               => typeCheckSwitch(Name, It, V, L, Es, Rs ListItem(typedCase(integerType(N:Int),
                     normalizingInt(integerType(N:Int), I:Int), L1:K)),
                    So SetItem(normalizingInt(integerType(N:Int), I:Int)), Meta)) ...</k>
         <currModule> ModName:SymbolicValueRef </currModule>
        <instructionCounter> TheCount:Int </instructionCounter>
        <tempLabelUses> TL:Set (.Set => SetItem(L1)) </tempLabelUses>
         requires isLocalVariable(L1) andBool
                 notBool normalizingInt(integerType(N:Int), I:Int) in So

    rule <k> typeCheckSwitch(Name:SymbolicValueRef, It:KResult, V:K, L:K,
                valValue(typedCase(integerType(N:Int), I:Int, L1:K)),Es:ElemList, 
                  (Rs:List), So:Set, Meta:InstructionMetadatas) ~> K:K => .K </k>
         <output>... .List => ListItem("error: destination value in jump table must be a valid label.") </output>
         requires notBool isLocalVariable(L1)

    rule <k> typeCheckSwitch(Name:SymbolicValueRef, It:KResult, V:K, L:K,
                valValue(typedCase(integerType(N:Int), I:Int, L1:K)),Es:ElemList, 
                  (Rs:List), So:Set, Meta:InstructionMetadatas) ~> K:K => .K </k>
         <output>... .List => ListItem("error: switch branching comparison value must be distinct.") </output>
         requires normalizingInt(integerType(N:Int), I:Int) in So

    rule <k> typeCheckSwitch(Name:SymbolicValueRef, It:KResult, V:K, L:K,
                valValue(badValue),Es:ElemList, 
                  Rs:List, So:Set, Meta:InstructionMetadatas) ~> K:K => .K </k>
         <output>... .List => ListItem("error: comparison value in jump table must be a valid integer type.") </output>


    rule <k> typeCheckSwitch(Name:SymbolicValueRef, It:KResult, V:K, L:K,
                valValue(typedCase(integerType(N:Int), badValue, L1:K)),Es:ElemList, 
                  Rs:List,So:Set, Meta:InstructionMetadatas) ~> K:K => .K </k>
         <output>... .List => ListItem("error: comparison value in jump table must be a valid int constant.") </output>

    //type check indirectbr
    rule <k> typeCheckIndirectBr(Name:SymbolicValueRef,
                    pointerTypeValue(T:K, Ad:Int), V:K, .ElemList,
                                      Es:List, Meta:InstructionMetadatas)
          => exprType(typeCheckPointerArgs(Name:SymbolicValueRef,
                       pointerTypeValue(T:K, Ad:Int), val(V),.ElemList))
                 ~> assignUses(Name, TheCount, pointerTypeValue(
                                         T:K, Ad:Int), (val(V),.ElemList)) ...</k>
        <instructionCounter> TheCount:Int => TheCount +Int 1 </instructionCounter>
        <tempBlockMap> Now:Map => Now (TheCount |->
             instNumInfo(TheCount, noAssign(instruction(indirectbr(
                              operand(pointerTypeValue(T:K, Ad:Int), V), Es),.Set
                                  ,insMetas(formElemList(Meta)))), terminators)) </tempBlockMap>

    rule <k> typeCheckIndirectBr(Name:SymbolicValueRef,
                    T:KResult, V:K, .ElemList,
                        Es:List, Meta:InstructionMetadatas) ~> K:K => .K </k>
         <output>... .List => ListItem("indirectbr must have a pointer type blockaddress.") </output>
         requires notBool isPointerType(T)

    rule <k>typeCheckIndirectBr(Name:SymbolicValueRef, T:K, V:K,
                  val(A:SymbolicValueRef), E2:ElemList,
                  Es:List, Meta:InstructionMetadatas)
                     => assignUses(Name, TheCount, label, (val(A),.ElemList))
                         ~> typeCheckIndirectBr(Name:SymbolicValueRef,
                           T:K, V:K, E2:ElemList, Es ListItem(A), Meta) ...</k>
        <instructionCounter> TheCount:Int </instructionCounter>
        <tempLabelUses> TL:Set (.Set => SetItem(A)) </tempLabelUses>
        requires isLocalVariable(A)

    rule <k> typeCheckIndirectBr(Name:SymbolicValueRef, Ty:K, Va:K,
                  val(A:SymbolicValueRef), E2:ElemList,
                           Es:List, Meta:InstructionMetadatas)
                 ~> K:K => .K </k>
         <output>... .List => ListItem("a label in indirectbr is not a valid basic block.") </output>
         requires notBool isLocalVariable(A)

    //type check braching ops.
    rule <k> typeCheckBr(Name:SymbolicValueRef, undef,
                   _:K, A:SymbolicValueRef, _:K, Meta:InstructionMetadatas)
              => checkUseVarInside(Name, label, A)
                 ~> assignUses(Name, TheCount,
                       label, (val(A),.ElemList)) ...</k>
         <currModule> ModName:SymbolicValueRef </currModule>
        <instructionCounter> TheCount:Int => TheCount +Int 1 </instructionCounter>
        <tempLabelUses> TL:Set (.Set => SetItem(A)) </tempLabelUses>
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
        <tempLabelUses> TL:Set (.Set => SetItem(L1) SetItem(L2)) </tempLabelUses>
         <funModuleName> ModName </funModuleName>
         <currFunction> FunName:SymbolicValueRef </currFunction>
         <functionName> FunName </functionName>
        <instructionCounter> TheCount:Int => TheCount +Int 1 </instructionCounter>
        <tempBlockMap> Now:Map => Now (TheCount |->
             instNumInfo(TheCount, noAssign(instruction(
                 conditional(operand(integerType(1),A), L1, L2),.Set,
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

    //type checking sitofp/uitofp
    rule <k> typeCheckCastOp(Name:SymbolicValueRef,
                     X:SymbolicValueRef, Op:K, integerType(N:Int),
                  V:K, T:FPType, Meta:InstructionMetadatas)
              => exprType(typeCheckIntArgs(Name:SymbolicValueRef,
                     integerType(N:Int), val(V),.ElemList))
                 ~> assignUses(Name, TheCount,
                       integerType(N:Int), (val(V),.ElemList))
                 ~> assignType(Name, TheCount, X, T) ...</k>
        <instructionCounter> TheCount:Int => TheCount +Int 1 </instructionCounter>
        <tempBlockMap> Now:Map => Now (TheCount |->
             instNumInfo(TheCount, assign(X,instruction(getKLabelFromOp(Op)(
                  integerType(N:Int),, V,, T), .Set,
                     insMetas(formElemList(Meta)))), normalInst)) </tempBlockMap>
         requires (Op ==K uitofp orBool Op ==K sitofp)

    rule <k> typeCheckCastOp(Name:SymbolicValueRef, X:SymbolicValueRef, Op:K,
                  vectorTypeValue(integerType(N:Int), I:Int),
                  V:K, vectorTypeValue(T:FPType, I:Int),
                 Meta:InstructionMetadatas)
              => exprType(typeCheckVectorArgs(Name:SymbolicValueRef,
                  vectorTypeValue(integerType(N:Int), I:Int),
                             val(V),.ElemList))
                ~> assignUses(Name, TheCount,
                       vectorTypeValue(integerType(N:Int), I:Int),
                              (val(V),.ElemList))
                 ~> assignType(Name, TheCount, X,
                      vectorTypeValue(T, I:Int)) ...</k>
        <instructionCounter> TheCount:Int => TheCount +Int 1 </instructionCounter>
        <tempBlockMap> Now:Map => Now (TheCount |->
             instNumInfo(TheCount, assign(X,instruction(getKLabelFromOp(Op)(
         vectorTypeValue(integerType(N:Int), I:Int),, V,,
               vectorTypeValue(T, I:Int)), .Set,
                     insMetas(formElemList(Meta)))), normalInst)) </tempBlockMap>
         requires Op ==K uitofp orBool Op ==K sitofp

    rule <k> typeCheckCastOp(Name:SymbolicValueRef,
                     X:SymbolicValueRef, Op:K, Ty:KResult,
                  V:K, Ty':KResult, Meta:InstructionMetadatas)
               ~> K:K => .K </k>
         <output>... .List
                       => ListItem("Int to float ops must have source/target types being either int/float types or vector of int/float types") </output>
         requires (Op ==K uitofp orBool Op ==K sitofp) andBool
           notBool (isIntegerType(Ty) andBool isFloatType(Ty'))
          andBool notBool (isVectorType(Ty) andBool isVectorType(Ty'))

    rule <k> typeCheckCastOp(Name:SymbolicValueRef, X:SymbolicValueRef, Op:K,
                  vectorTypeValue(Ty:K, I':Int),
                  V:K, vectorTypeValue(Ty':K, I:Int),
                 Meta:InstructionMetadatas)
               ~> K:K => .K </k>
         <output>... .List => ListItem("Int to float vector ops must have inner types being int/float types.") </output>
         requires (Op ==K uitofp orBool Op ==K sitofp) andBool 
           notBool (isIntegerType(Ty) andBool isFloatType(Ty'))

    rule <k> typeCheckCastOp(Name:SymbolicValueRef, X:SymbolicValueRef, Op:K,
                  vectorTypeValue(Ty:K, I':Int),
                  V:K, vectorTypeValue(Ty':K, I:Int),
                 Meta:InstructionMetadatas)
               ~> K:K => .K </k>
         <output>... .List
                       => ListItem("Int to float vector ops must have target/source vector types having the same argument number.") </output>
         requires (Op ==K uitofp orBool Op ==K sitofp) andBool isIntegerType(Ty)
                    andBool isFloatType(Ty') andBool I =/=Int I'

    //type checking fptosi and fptoui
    rule <k> typeCheckCastOp(Name:SymbolicValueRef,
                     X:SymbolicValueRef, Op:K, T1:FPType,
                  V:K, integerType(N:Int), Meta:InstructionMetadatas)
              => exprType(typeCheckFloatArgs(Name:SymbolicValueRef,
                     T1, val(formalizeFloat(T1,V)),.ElemList))
                 ~> assignUses(Name, TheCount,
                       T1, (val(formalizeFloat(T1,V)),.ElemList))
                 ~> assignType(Name, TheCount, X, integerType(N:Int)) ...</k>
        <instructionCounter> TheCount:Int => TheCount +Int 1 </instructionCounter>
        <tempBlockMap> Now:Map => Now (TheCount |->
             instNumInfo(TheCount, assign(X,instruction(getKLabelFromOp(Op)(
                 T1,, formalizeFloat(T1,V),, integerType(N:Int)), .Set,
                     insMetas(formElemList(Meta)))), normalInst)) </tempBlockMap>
         requires (Op ==K fptoui orBool Op ==K fptosi)

    rule <k> typeCheckCastOp(Name:SymbolicValueRef, X:SymbolicValueRef, Op:K,
                  vectorTypeValue(T1:FPType, I:Int),
                  V:K, vectorTypeValue(integerType(N:Int), I:Int),
                 Meta:InstructionMetadatas)
              => exprType(typeCheckVectorArgs(Name:SymbolicValueRef,
                  vectorTypeValue(T1, I:Int),
                             val(formalizeFloats(
                   vectorTypeValue(T1, I),V)),.ElemList))
                ~> assignUses(Name, TheCount,
                       vectorTypeValue(T1, I:Int),
                  (val(formalizeFloats(vectorTypeValue(T1, I),V)),.ElemList))
                 ~> assignType(Name, TheCount, X,
                      vectorTypeValue(integerType(N:Int), I:Int)) ...</k>
        <instructionCounter> TheCount:Int => TheCount +Int 1 </instructionCounter>
        <tempBlockMap> Now:Map => Now (TheCount |->
             instNumInfo(TheCount, assign(X,instruction(getKLabelFromOp(Op)(
         vectorTypeValue(T1, I:Int),,
            formalizeFloats(vectorTypeValue(T1, I),V),,
               vectorTypeValue(integerType(N:Int), I:Int)), .Set,
                     insMetas(formElemList(Meta)))), normalInst)) </tempBlockMap>
         requires Op ==K fptoui orBool Op ==K fptosi

    rule <k> typeCheckCastOp(Name:SymbolicValueRef,
                     X:SymbolicValueRef, Op:K, Ty:KResult,
                  V:K, Ty':KResult, Meta:InstructionMetadatas)
               ~> K:K => .K </k>
         <output>... .List
                       => ListItem("Float to int ops must have source/target types being either float/int types or vector of float/int types") </output>
         requires (Op ==K fptoui orBool Op ==K fptosi) andBool
           notBool (isFloatType(Ty) andBool isIntegerType(Ty'))
          andBool notBool (isVectorType(Ty) andBool isVectorType(Ty'))

    rule <k> typeCheckCastOp(Name:SymbolicValueRef, X:SymbolicValueRef, Op:K,
                  vectorTypeValue(Ty:K, I':Int),
                  V:K, vectorTypeValue(Ty':K, I:Int),
                 Meta:InstructionMetadatas)
               ~> K:K => .K </k>
         <output>... .List
                       => ListItem("Float to int vector ops must have inner types being float/int types.") </output>
         requires (Op ==K fptoui orBool Op ==K fptosi) andBool 
           notBool (isFloatType(Ty) andBool isIntegerType(Ty'))

    rule <k> typeCheckCastOp(Name:SymbolicValueRef, X:SymbolicValueRef, Op:K,
                  vectorTypeValue(Ty:K, I':Int),
                  V:K, vectorTypeValue(Ty':K, I:Int),
                 Meta:InstructionMetadatas)
               ~> K:K => .K </k>
         <output>... .List
                       => ListItem("Float to int vector ops must have target/source vector types having the same argument number.") </output>
         requires (Op ==K fptoui orBool Op ==K fptosi) andBool isFloatType(Ty)
                    andBool isIntegerType(Ty') andBool I =/=Int I'


    //type check float casting
    rule <k> typeCheckCastOp(Name:SymbolicValueRef,
                     X:SymbolicValueRef, Op:K, T1:FPType,
                  V:K, T2:FPType, Meta:InstructionMetadatas)
              => exprType(typeCheckFloatArgs(Name:SymbolicValueRef,
                     T1, val(formalizeFloat(T1,V)),.ElemList))
                 ~> assignUses(Name, TheCount,
                       T1, (val(formalizeFloat(T1,V)),.ElemList))
                 ~> assignType(Name, TheCount, X, T2) ...</k>
        <instructionCounter> TheCount:Int => TheCount +Int 1 </instructionCounter>
        <tempBlockMap> Now:Map => Now (TheCount |->
             instNumInfo(TheCount, assign(X,instruction(getKLabelFromOp(Op)(
                 T1,, formalizeFloat(T1,V),, T2), .Set,
                     insMetas(formElemList(Meta)))), normalInst)) </tempBlockMap>
         requires compareCastFloatTypes(Op, T1, T2) andBool
                 (Op ==K fptrunc orBool Op ==K fpext)

    rule <k> typeCheckCastOp(Name:SymbolicValueRef, X:SymbolicValueRef, Op:K,
                  vectorTypeValue(T1:FPType, I:Int),
                  V:K, vectorTypeValue(T2:FPType, I:Int),
                 Meta:InstructionMetadatas)
              => exprType(typeCheckVectorArgs(Name:SymbolicValueRef,
                  vectorTypeValue(T1, I:Int),
                             val(formalizeFloats(
                   vectorTypeValue(T1, I),V)),.ElemList))
                ~> assignUses(Name, TheCount,
                       vectorTypeValue(T1, I:Int),
                  (val(formalizeFloats(vectorTypeValue(T1, I),V)),.ElemList))
                 ~> assignType(Name, TheCount, X,
                      vectorTypeValue(T2, I:Int)) ...</k>
        <instructionCounter> TheCount:Int => TheCount +Int 1 </instructionCounter>
        <tempBlockMap> Now:Map => Now (TheCount |->
             instNumInfo(TheCount, assign(X,instruction(getKLabelFromOp(Op)(
         vectorTypeValue(T1, I:Int),,
            formalizeFloats(vectorTypeValue(T1, I),V),,
               vectorTypeValue(T2, I:Int)), .Set,
                     insMetas(formElemList(Meta)))), normalInst)) </tempBlockMap>
         requires compareCastFloatTypes(Op, T1, T2)
                   andBool (Op ==K fptrunc orBool Op ==K fpext)

    rule <k> typeCheckCastOp(Name:SymbolicValueRef,
                     X:SymbolicValueRef, Op:K, Ty:KResult,
                  V:K, Ty':KResult, Meta:InstructionMetadatas)
               ~> K:K => .K </k>
         <output>... .List
                       => ListItem("Float cast ops must have source/target types being either float types or vector of float types") </output>
         requires (Op ==K fptrunc orBool Op ==K fpext) andBool
           notBool (isFloatType(Ty) andBool isFloatType(Ty'))
          andBool notBool (isVectorType(Ty) andBool isVectorType(Ty'))

    rule <k> typeCheckCastOp(Name:SymbolicValueRef, X:SymbolicValueRef, Op:K,
                  vectorTypeValue(Ty:K, I':Int),
                  V:K, vectorTypeValue(Ty':K, I:Int),
                 Meta:InstructionMetadatas)
               ~> K:K => .K </k>
         <output>... .List
                       => ListItem("Float cast vector ops must have inner types being float types.") </output>
         requires (Op ==K fptrunc orBool Op ==K fpext) andBool 
           notBool (isFloatType(Ty) andBool isFloatType(Ty'))

    rule <k> typeCheckCastOp(Name:SymbolicValueRef, X:SymbolicValueRef, Op:K,
                  vectorTypeValue(Ty:K, I':Int),
                  V:K, vectorTypeValue(Ty':K, I:Int),
                 Meta:InstructionMetadatas)
               ~> K:K => .K </k>
         <output>... .List
                       => ListItem("Float cast vector ops must have target/source vector types having the same argument number.") </output>
         requires (Op ==K fptrunc orBool Op ==K fpext) andBool isFloatType(Ty)
                    andBool isFloatType(Ty') andBool I =/=Int I'

    rule <k> typeCheckCastOp(Name:SymbolicValueRef,
                     X:SymbolicValueRef, Op:K, Ty1:FPType,
                  V:K, Ty2:FPType, Meta:InstructionMetadatas)
               ~> K:K => .K </k>
         <output>... .List
                       => ListItem("Float cast op error: casting target type is either larger in fptrunc or smaller in fpext") </output>
         requires notBool compareCastFloatTypes(Op, Ty1, Ty2)
             andBool (Op ==K fptrunc orBool Op ==K fpext)

    rule <k> typeCheckCastOp(Name:SymbolicValueRef, X:SymbolicValueRef, Op:K,
                  vectorTypeValue(Ty1:FPType, I:Int),
                  V:K, vectorTypeValue(Ty2:FPType, I:Int),
                 Meta:InstructionMetadatas)
               ~> K:K => .K </k>
         <output>... .List
                       => ListItem("Float vector cast op error: casting target type is either larger in fptrunc or smaller in fpext") </output>
         requires notBool compareCastFloatTypes(Op, Ty1, Ty2)
                andBool (Op ==K fptrunc orBool Op ==K fpext)

    //type check int casting ops
    rule <k> typeCheckCastOp(Name:SymbolicValueRef,
                     X:SymbolicValueRef, Op:K, integerType(N:Int),
                  V:K, integerType(N':Int), Meta:InstructionMetadatas)
              => exprType(typeCheckIntArgs(Name:SymbolicValueRef,
                     integerType(N), val(V),.ElemList))
                 ~> assignUses(Name, TheCount,
                       integerType(N:Int), (val(V),.ElemList))
                 ~> assignType(Name, TheCount, X, integerType(N')) ...</k>
        <instructionCounter> TheCount:Int => TheCount +Int 1 </instructionCounter>
        <tempBlockMap> Now:Map => Now (TheCount |->
             instNumInfo(TheCount, assign(X,instruction(getKLabelFromOp(Op)(
                 integerType(N:Int),, V,, integerType(N':Int)), .Set,
                     insMetas(formElemList(Meta)))), normalInst)) </tempBlockMap>
         requires compareCastIntNums(Op, N, N') andBool isIntCastOp(Op)

    rule <k> typeCheckCastOp(Name:SymbolicValueRef, X:SymbolicValueRef, Op:K,
                  vectorTypeValue(integerType(N:Int), I:Int),
                  V:K, vectorTypeValue(integerType(N':Int), I:Int),
                 Meta:InstructionMetadatas)
              => exprType(typeCheckVectorArgs(Name:SymbolicValueRef,
                  vectorTypeValue(integerType(N:Int), I:Int),
                             val(V),.ElemList))
                ~> assignUses(Name, TheCount,
                       vectorTypeValue(integerType(N:Int), I:Int),
                  (val(V),.ElemList))
                 ~> assignType(Name, TheCount, X,
                      vectorTypeValue(integerType(N':Int), I:Int)) ...</k>
        <instructionCounter> TheCount:Int => TheCount +Int 1 </instructionCounter>
        <tempBlockMap> Now:Map => Now (TheCount |->
             instNumInfo(TheCount, assign(X,instruction(getKLabelFromOp(Op)(
         vectorTypeValue(integerType(N:Int), I:Int),,
            V,, vectorTypeValue(integerType(N':Int), I:Int)), .Set,
                     insMetas(formElemList(Meta)))), normalInst)) </tempBlockMap>
         requires compareCastIntNums(Op, N, N') andBool isIntCastOp(Op)

    rule <k> typeCheckCastOp(Name:SymbolicValueRef,
                     X:SymbolicValueRef, Op:K, Ty:KResult,
                  V:K, Ty':KResult, Meta:InstructionMetadatas)
               ~> K:K => .K </k>
         <output>... .List
                       => ListItem("Int cast ops must have source/target types being either int types or vector of int types") </output>
         requires isIntCastOp(Op) andBool
           notBool (isIntegerType(Ty) andBool isIntegerType(Ty'))
          andBool notBool (isVectorType(Ty) andBool isVectorType(Ty'))

    rule <k> typeCheckCastOp(Name:SymbolicValueRef, X:SymbolicValueRef, Op:K,
                  vectorTypeValue(Ty:K, I':Int),
                  V:K, vectorTypeValue(Ty':K, I:Int),
                 Meta:InstructionMetadatas)
               ~> K:K => .K </k>
         <output>... .List
                       => ListItem("Int cast vector ops must have inner types being int types.") </output>
         requires isIntCastOp(Op) andBool 
           notBool (isIntegerType(Ty) andBool isIntegerType(Ty'))

    rule <k> typeCheckCastOp(Name:SymbolicValueRef, X:SymbolicValueRef, Op:K,
                  vectorTypeValue(Ty:K, I':Int),
                  V:K, vectorTypeValue(Ty':K, I:Int),
                 Meta:InstructionMetadatas)
               ~> K:K => .K </k>
         <output>... .List
                       => ListItem("Int cast vector ops must have target/source vector types having the same argument number.") </output>
         requires isIntCastOp(Op) andBool isIntegerType(Ty)
                    andBool isIntegerType(Ty') andBool I =/=Int I'

    rule <k> typeCheckCastOp(Name:SymbolicValueRef,
                     X:SymbolicValueRef, Op:K, integerType(N:Int),
                  V:K, integerType(N':Int), Meta:InstructionMetadatas)
               ~> K:K => .K </k>
         <output>... .List
                       => ListItem("Int cast op error: casting target type is either larger in trunc or smaller in sext/zext") </output>
         requires notBool compareCastIntNums(Op, N, N') andBool isIntCastOp(Op)

    rule <k> typeCheckCastOp(Name:SymbolicValueRef, X:SymbolicValueRef, Op:K,
                  vectorTypeValue(integerType(N:Int), I:Int),
                  V:K, vectorTypeValue(integerType(N':Int), I:Int),
                 Meta:InstructionMetadatas)
               ~> K:K => .K </k>
         <output>... .List
                       => ListItem("Int cast op error: casting target type is either larger in trunc or smaller in sext/zext") </output>
         requires notBool compareCastIntNums(Op, N, N') andBool isIntCastOp(Op)

    //type check addrspacecast
    rule <k> typeCheckCastOp(Name:SymbolicValueRef,
                     X:SymbolicValueRef, addrspacecast, pointerTypeValue(T:K, Ad:Int),
                  V:K, pointerTypeValue(T':K, Ad':Int), Meta:InstructionMetadatas)
              => exprType(typeCheckPointerArgs(Name:SymbolicValueRef,
                     pointerTypeValue(T:K, Ad:Int), val(V),.ElemList))
                 ~> assignUses(Name, TheCount,
                       pointerTypeValue(T:K, Ad:Int), (val(V),.ElemList))
                 ~> assignType(Name, TheCount, X, pointerTypeValue(T':K, Ad':Int)) ...</k>
        <instructionCounter> TheCount:Int => TheCount +Int 1 </instructionCounter>
        <tempBlockMap> Now:Map => Now (TheCount |->
             instNumInfo(TheCount, assign(X,instruction(theAddrSpaceCast(
                pointerTypeValue(T:K, Ad:Int), V, pointerTypeValue(T':K, Ad':Int)), .Set,
                     insMetas(formElemList(Meta)))), normalInst)) </tempBlockMap>
         requires Ad =/=Int Ad'

    rule <k> typeCheckCastOp(Name:SymbolicValueRef, X:SymbolicValueRef, addrspacecast,
                  vectorTypeValue(pointerTypeValue(T:K, Ad:Int), I:Int),
                  V:K, vectorTypeValue(pointerTypeValue(T':K, Ad':Int), I:Int),
                 Meta:InstructionMetadatas)
              => exprType(typeCheckVectorArgs(Name:SymbolicValueRef,
              vectorTypeValue(pointerTypeValue(T:K, Ad:Int), I:Int),
                             val(V),.ElemList))
                ~> assignUses(Name, TheCount,
                 vectorTypeValue(pointerTypeValue(T:K, Ad:Int), I:Int),
                  (val(V),.ElemList))
                 ~> assignType(Name, TheCount, X,
           vectorTypeValue(pointerTypeValue(T':K, Ad':Int), I:Int)) ...</k>
        <instructionCounter> TheCount:Int => TheCount +Int 1 </instructionCounter>
        <tempBlockMap> Now:Map => Now (TheCount |->
             instNumInfo(TheCount, assign(X,instruction(theAddrSpaceCast(
         vectorTypeValue(pointerTypeValue(T:K, Ad:Int), I:Int),
            V, vectorTypeValue(pointerTypeValue(T':K, Ad':Int), I:Int)), .Set,
                     insMetas(formElemList(Meta)))), normalInst)) </tempBlockMap>
         requires Ad =/=Int Ad'

    rule <k> typeCheckCastOp(Name:SymbolicValueRef,
                     X:SymbolicValueRef, addrspacecast, Ty:KResult,
                  V:K, Ty':KResult, Meta:InstructionMetadatas)
               ~> K:K => .K </k>
         <output>... .List
                       => ListItem("addspacecast ops must have source/target types being either pionter types or vector of pionter types") </output>
         requires notBool (isPointerType(Ty) andBool isPointerType(Ty'))
          andBool notBool (isVectorType(Ty) andBool isVectorType(Ty'))

    rule <k> typeCheckCastOp(Name:SymbolicValueRef, X:SymbolicValueRef, addrspacecast,
                  vectorTypeValue(Ty:K, I':Int),
                  V:K, vectorTypeValue(Ty':K, I:Int),
                 Meta:InstructionMetadatas)
               ~> K:K => .K </k>
         <output>... .List
                       => ListItem("addspacecast vector ops must have target/source vector types vector of pointer types.") </output>
         requires  notBool isPointerType(Ty) orBool notBool isPointerType(Ty')

    rule <k> typeCheckCastOp(Name:SymbolicValueRef, X:SymbolicValueRef, addrspacecast,
                  vectorTypeValue(Ty:K, I':Int),
                  V:K, vectorTypeValue(Ty':K, I:Int),
                 Meta:InstructionMetadatas)
               ~> K:K => .K </k>
         <output>... .List
                       => ListItem("addspacecast vector ops must have target/source vector types having the same argument number.") </output>
         requires  isPointerType(Ty)
                    andBool isPointerType(Ty') andBool I =/=Int I'

    rule <k> typeCheckCastOp(Name:SymbolicValueRef,
                     X:SymbolicValueRef, addrspacecast, pointerTypeValue(T:K, Ad:Int),
                  V:K, pointerTypeValue(T':K, Ad:Int), Meta:InstructionMetadatas)
               ~> K:K => .K </k>
         <output>... .List
                       => ListItem("addspacecast ops must have target/source vector types having different address spaces.") </output>

    rule <k> typeCheckCastOp(Name:SymbolicValueRef, X:SymbolicValueRef, addrspacecast,
                  vectorTypeValue(pointerTypeValue(T:K, Ad:Int), I:Int),
                  V:K, vectorTypeValue(pointerTypeValue(T':K, Ad:Int), I:Int),
                 Meta:InstructionMetadatas)
               ~> K:K => .K </k>
         <output>... .List
                       => ListItem("addspacecast vector ops must have target/source vector types having different address spaces.") </output>

    //type check pointer to int
    rule <k> typeCheckCastOp(Name:SymbolicValueRef,
                     X:SymbolicValueRef, ptrtoint, pointerTypeValue(T:K, Ad:Int),
                  V:K, integerType(N:Int), Meta:InstructionMetadatas)
              => exprType(typeCheckPointerArgs(Name:SymbolicValueRef,
                     pointerTypeValue(T:K, Ad:Int), val(V),.ElemList))
                 ~> assignUses(Name, TheCount,
                       pointerTypeValue(T:K, Ad:Int), (val(V),.ElemList))
                 ~> assignType(Name, TheCount, X, integerType(N:Int)) ...</k>
        <instructionCounter> TheCount:Int => TheCount +Int 1 </instructionCounter>
        <tempBlockMap> Now:Map => Now (TheCount |->
             instNumInfo(TheCount, assign(X,instruction(thePtrToInt(
                pointerTypeValue(T:K, Ad:Int), V, integerType(N:Int)), .Set,
                     insMetas(formElemList(Meta)))), normalInst)) </tempBlockMap>

    rule <k> typeCheckCastOp(Name:SymbolicValueRef, X:SymbolicValueRef, ptrtoint,
                  vectorTypeValue(pointerTypeValue(T:K, Ad:Int), I:Int),
                  V:K, vectorTypeValue(integerType(N:Int), I:Int),
                 Meta:InstructionMetadatas)
              => exprType(typeCheckVectorArgs(Name:SymbolicValueRef,
              vectorTypeValue(pointerTypeValue(T:K, Ad:Int), I:Int),
                             val(V),.ElemList))
                ~> assignUses(Name, TheCount,
                 vectorTypeValue(pointerTypeValue(T:K, Ad:Int), I:Int),
                  (val(V),.ElemList))
                 ~> assignType(Name, TheCount, X,
                     vectorTypeValue(integerType(N:Int), I:Int)) ...</k>
        <instructionCounter> TheCount:Int => TheCount +Int 1 </instructionCounter>
        <tempBlockMap> Now:Map => Now (TheCount |->
             instNumInfo(TheCount, assign(X,instruction(thePtrToInt(
         vectorTypeValue(pointerTypeValue(T:K, Ad:Int), I:Int),
            V, vectorTypeValue(integerType(N:Int), I:Int)), .Set,
                     insMetas(formElemList(Meta)))), normalInst)) </tempBlockMap>

    rule <k> typeCheckCastOp(Name:SymbolicValueRef,
                     X:SymbolicValueRef, ptrtoint, Ty:KResult,
                  V:K, Ty':KResult, Meta:InstructionMetadatas)
               ~> K:K => .K </k>
         <output>... .List
                       => ListItem("ptrtoint ops must have source/target types being either pointer type/int types or vector of pointer type/int types.") </output>
         requires notBool (isPointerType(Ty) andBool isIntegerType(Ty'))
          andBool notBool (isVectorType(Ty) andBool isVectorType(Ty'))

    rule <k> typeCheckCastOp(Name:SymbolicValueRef, X:SymbolicValueRef, ptrtoint,
                  vectorTypeValue(Ty:K, I':Int),
                  V:K, vectorTypeValue(Ty':K, I:Int),
                 Meta:InstructionMetadatas)
               ~> K:K => .K </k>
         <output>... .List
                       => ListItem("ptrtoint vector ops must have source/target types being vector of pointer type/int types.") </output>
         requires  notBool isPointerType(Ty) orBool notBool isIntegerType(Ty')

    rule <k> typeCheckCastOp(Name:SymbolicValueRef, X:SymbolicValueRef, ptrtoint,
                  vectorTypeValue(Ty:K, I':Int),
                  V:K, vectorTypeValue(Ty':K, I:Int),
                 Meta:InstructionMetadatas)
               ~> K:K => .K </k>
         <output>... .List
                       => ListItem("ptrtoint vector ops must must have target/source vector types having the same argument number.") </output>
         requires  isPointerType(Ty)
                    andBool isIntegerType(Ty') andBool I =/=Int I'

    //type check int to pointer
    rule <k> typeCheckCastOp(Name:SymbolicValueRef,
                     X:SymbolicValueRef, inttoptr, integerType(N:Int),
                  V:K, pointerTypeValue(T:K, Ad:Int), Meta:InstructionMetadatas)
              => exprType(typeCheckIntArgs(Name:SymbolicValueRef,
                     integerType(N:Int), val(V),.ElemList))
                 ~> assignUses(Name, TheCount,
                       integerType(N:Int), (val(V),.ElemList))
                 ~> assignType(Name, TheCount, X, pointerTypeValue(T:K, Ad:Int)) ...</k>
        <instructionCounter> TheCount:Int => TheCount +Int 1 </instructionCounter>
        <tempBlockMap> Now:Map => Now (TheCount |->
             instNumInfo(TheCount, assign(X,instruction(theIntToPtr(
                integerType(N:Int), V, pointerTypeValue(T:K, Ad:Int)), .Set,
                     insMetas(formElemList(Meta)))), normalInst)) </tempBlockMap>

    rule <k> typeCheckCastOp(Name:SymbolicValueRef, X:SymbolicValueRef, inttoptr,
                  vectorTypeValue(integerType(N:Int), I:Int),
                  V:K, vectorTypeValue(pointerTypeValue(T:K, Ad:Int), I:Int),
                 Meta:InstructionMetadatas)
              => exprType(typeCheckVectorArgs(Name:SymbolicValueRef,
                   vectorTypeValue(integerType(N:Int), I:Int),
                             val(V),.ElemList))
                ~> assignUses(Name, TheCount,
                      vectorTypeValue(integerType(N:Int), I:Int),
                  (val(V),.ElemList))
                 ~> assignType(Name, TheCount, X,
                 vectorTypeValue(pointerTypeValue(T:K, Ad:Int), I:Int)) ...</k>
        <instructionCounter> TheCount:Int => TheCount +Int 1 </instructionCounter>
        <tempBlockMap> Now:Map => Now (TheCount |->
             instNumInfo(TheCount, assign(X,instruction(theIntToPtr(
             vectorTypeValue(integerType(N:Int), I:Int),
            V, vectorTypeValue(pointerTypeValue(T:K, Ad:Int), I:Int)), .Set,
                     insMetas(formElemList(Meta)))), normalInst)) </tempBlockMap>

    rule <k> typeCheckCastOp(Name:SymbolicValueRef,
                     X:SymbolicValueRef, inttoptr, Ty:KResult,
                  V:K, Ty':KResult, Meta:InstructionMetadatas)
               ~> K:K => .K </k>
         <output>... .List
                       => ListItem("inttoptr ops must have source/target types being either int type/pointer types or vector of int type/pointer types.") </output>
         requires notBool (isIntegerType(Ty) andBool isPointerType(Ty'))
          andBool notBool (isVectorType(Ty) andBool isVectorType(Ty'))

    rule <k> typeCheckCastOp(Name:SymbolicValueRef, X:SymbolicValueRef, inttoptr,
                  vectorTypeValue(Ty:K, I':Int),
                  V:K, vectorTypeValue(Ty':K, I:Int),
                 Meta:InstructionMetadatas)
               ~> K:K => .K </k>
         <output>... .List
                       => ListItem("inttoptr vector ops must have source/target types being vector of int type/pointer types.") </output>
         requires  notBool isIntegerType(Ty) orBool notBool isPointerType(Ty')

    rule <k> typeCheckCastOp(Name:SymbolicValueRef, X:SymbolicValueRef, inttoptr,
                  vectorTypeValue(Ty:K, I':Int),
                  V:K, vectorTypeValue(Ty':K, I:Int),
                 Meta:InstructionMetadatas)
               ~> K:K => .K </k>
         <output>... .List
                       => ListItem("inttoptr vector ops must must have target/source vector types having the same argument number.") </output>
         requires  isIntegerType(Ty)
                    andBool isPointerType(Ty') andBool I =/=Int I'

    //type checking bitcast
    rule <k> typeCheckCastOp(Name:SymbolicValueRef, X:SymbolicValueRef, bitcast,
                  T1:KResult, V:K, T2:KResult, Meta:InstructionMetadatas)
              => typeCheckArgWithMMX(Name, T1, V)
                ~> assignUses(Name, TheCount, T1,
                  (val(V),.ElemList))
                 ~> assignType(Name, TheCount, X, T2) ...</k>
        <instructionCounter> TheCount:Int => TheCount +Int 1 </instructionCounter>
        <tempBlockMap> Now:Map => Now (TheCount |->
             instNumInfo(TheCount, assign(X,instruction(theBitCast(
             T1, V, T2), .Set, insMetas(formElemList(Meta)))), normalInst)) </tempBlockMap>
        requires isValidBitCastType(T1) andBool isValidBitCastType(T2)
                 andBool notBool hasInValidMMXType(T1)
                   andBool notBool hasInValidMMXType(T2)
                 andBool sizeofInBits(T1) ==K sizeofInBits(T2)
                 andBool notBool hasPointerType(T1)
                 andBool notBool hasPointerType(T2)

    rule <k> typeCheckCastOp(Name:SymbolicValueRef, X:SymbolicValueRef, bitcast,
                  pointerTypeValue(T1:KResult, Ad:Int), V:K,
       pointerTypeValue(T2:KResult, Ad:Int), Meta:InstructionMetadatas)
              => typeCheckArgWithMMX(Name, pointerTypeValue(T1:KResult, Ad:Int), V)
                ~> assignUses(Name, TheCount, pointerTypeValue(T1:KResult, Ad:Int),
                  (val(V),.ElemList))
         ~> assignType(Name, TheCount, X, pointerTypeValue(T2:KResult, Ad:Int)) ...</k>
        <instructionCounter> TheCount:Int => TheCount +Int 1 </instructionCounter>
        <tempBlockMap> Now:Map => Now (TheCount |->
             instNumInfo(TheCount, assign(X,instruction(theBitCast(
             pointerTypeValue(T1:KResult, Ad:Int), V,
                   pointerTypeValue(T2:KResult, Ad:Int)),
                .Set, insMetas(formElemList(Meta)))), normalInst)) </tempBlockMap>
        requires notBool hasInValidMMXType(T1)
                   andBool notBool hasInValidMMXType(T2)

    rule <k> typeCheckCastOp(Name:SymbolicValueRef, X:SymbolicValueRef, bitcast,
                  T1:KResult, V:K, T2:KResult, Meta:InstructionMetadatas) ~> K:K 
              =>  .K </k>
         <output>... .List => ListItem("bitcast conversion only allow to convert non-aggregate first class types and no label/metadata/token types.") </output>
        requires notBool isValidBitCastType(T1) orBool notBool isValidBitCastType(T2)

    rule <k> typeCheckCastOp(Name:SymbolicValueRef, X:SymbolicValueRef, bitcast,
                  T1:KResult, V:K, T2:KResult, Meta:InstructionMetadatas) ~> K:K 
              =>  .K </k>
         <output>... .List => ListItem("bitcast conversion must have types with same bits.") </output>
        requires isValidBitCastType(T1) andBool isValidBitCastType(T2)
                 andBool sizeofInBits(T1) =/=K sizeofInBits(T2)

    rule <k> typeCheckCastOp(Name:SymbolicValueRef, X:SymbolicValueRef, bitcast,
                  pointerTypeValue(T1:KResult, Ad:Int), V:K,
       pointerTypeValue(T2:KResult, Ad':Int), Meta:InstructionMetadatas) ~> K:K
              => .K </k>
         <output>... .List => ListItem("bitcast pointer conversion must have same addrspaces.") </output>
        requires notBool hasInValidMMXType(T1)
                   andBool notBool hasInValidMMXType(T2)
                  andBool Ad =/=K Ad'

    rule <k> typeCheckCastOp(Name:SymbolicValueRef, X:SymbolicValueRef, bitcast,
                  pointerTypeValue(T1:KResult, Ad:Int), V:K,
                 T2:KResult, Meta:InstructionMetadatas) ~> K:K => .K </k>
         <output>... .List
            => ListItem("bitcast pointer conversion must be converted to a pointer type.") </output>
        requires  notBool isPointerType(T2)

    rule <k> typeCheckCastOp(Name:SymbolicValueRef, X:SymbolicValueRef, bitcast,
                  T1:KResult, V:K, pointerTypeValue(T2:KResult, Ad:Int),
            Meta:InstructionMetadatas) ~> K:K => .K </k>
         <output>... .List
            => ListItem("bitcast pointer conversion must be converted to a pointer type.") </output>
        requires  notBool isPointerType(T1)

    rule <k> typeCheckCastOp(Name:SymbolicValueRef, X:SymbolicValueRef, bitcast,
                  T1:KResult, V:K, T2:KResult, Meta:InstructionMetadatas) ~> K:K
              => .K </k>
         <output>... .List => ListItem("error: bitcast pointer conversion having i86 mmx types that are in vectors or arrays.") </output>
        requires hasInValidMMXType(T1) orBool hasInValidMMXType(T2)

    rule <k> typeCheckCastOp(Name:SymbolicValueRef, X:SymbolicValueRef, bitcast,
                  vectorTypeValue(pointerTypeValue(T1:KResult, Ad:Int), I:Int), V:K,
            vectorTypeValue(pointerTypeValue(T2:KResult, Ad:Int),
                  I:Int), Meta:InstructionMetadatas)
              => typeCheckArgWithMMX(Name, vectorTypeValue(
                            pointerTypeValue(T1:KResult, Ad:Int), I:Int), V)
                ~> assignUses(Name, TheCount, vectorTypeValue(
                       pointerTypeValue(T1:KResult, Ad:Int), I:Int),
                  (val(V),.ElemList))
         ~> assignType(Name, TheCount, X, vectorTypeValue(
                 pointerTypeValue(T2:KResult, Ad:Int), I:Int)) ...</k>
        <instructionCounter> TheCount:Int => TheCount +Int 1 </instructionCounter>
        <tempBlockMap> Now:Map => Now (TheCount |->
             instNumInfo(TheCount, assign(X,instruction(theBitCast(
             vectorTypeValue(pointerTypeValue(T1:KResult, Ad:Int), I:Int), V,
                   vectorTypeValue(pointerTypeValue(T2:KResult, Ad:Int), I:Int)),
                .Set, insMetas(formElemList(Meta)))), normalInst)) </tempBlockMap>
        requires notBool hasInValidMMXType(T1)
                   andBool notBool hasInValidMMXType(T2)

    rule <k> typeCheckCastOp(Name:SymbolicValueRef, X:SymbolicValueRef, bitcast,
                  vectorTypeValue(pointerTypeValue(T1:KResult, Ad:Int), I:Int), V:K,
            vectorTypeValue(pointerTypeValue(T2:KResult, Ad':Int),
                  I:Int), Meta:InstructionMetadatas) ~> K:K => .K </k>
         <output>... .List => ListItem("bitcast vector pointer conversion must have same addrspaces.") </output>
             requires Ad =/=K Ad'

    rule <k> typeCheckCastOp(Name:SymbolicValueRef, X:SymbolicValueRef, bitcast,
                  vectorTypeValue(pointerTypeValue(T1:KResult, Ad:Int), I:Int), V:K,
            vectorTypeValue(pointerTypeValue(T2:KResult, Ad':Int),
                  I':Int), Meta:InstructionMetadatas) ~> K:K => .K </k>
         <output>... .List => ListItem("bitcast vector pointer conversion must have same number of pointers.") </output>
             requires I =/=K I'

    rule <k> typeCheckCastOp(Name:SymbolicValueRef, X:SymbolicValueRef, bitcast,
                  vectorTypeValue(pointerTypeValue(T1:KResult, Ad:Int), I:Int), V:K,
            vectorTypeValue(T2:K, I':Int), Meta:InstructionMetadatas) ~> K:K => .K </k>
         <output>... .List => ListItem("bitcast vector pointer conversion must have target type of vector of pointers.") </output>
             requires notBool isPointerType(T2)

    rule <k> typeCheckCastOp(Name:SymbolicValueRef, X:SymbolicValueRef, bitcast,
                  pointerTypeValue(T1:KResult, I:Int), V:K,
            vectorTypeValue(pointerTypeValue(T2:KResult, Ad:Int), I:Int), Meta:InstructionMetadatas) ~> K:K => .K </k>
         <output>... .List => ListItem("bitcast vector pointer conversion must have source type of vector of pointers.") </output>
             requires notBool isPointerType(T1)

    rule <k> typeCheckCastOp(Name:SymbolicValueRef, X:SymbolicValueRef, bitcast,
                  vectorTypeValue(pointerTypeValue(T1:KResult, Ad:Int), I:Int), V:K,
              T2:KResult, Meta:InstructionMetadatas) ~> K:K => .K </k>
         <output>... .List => ListItem("bitcast vector pointer conversion must have target type of vector of pointers.") </output>
             requires isValidBitCastType(T2)
                  andBool (notBool isVectorType(T2) orBool notBool hasPointerType(T2))

    rule <k> typeCheckCastOp(Name:SymbolicValueRef, X:SymbolicValueRef, bitcast,
                  T1:KResult, V:K,
            vectorTypeValue(pointerTypeValue(T2:KResult, Ad:Int), I:Int), Meta:InstructionMetadatas) ~> K:K => .K </k>
         <output>... .List => ListItem("bitcast vector pointer conversion must have source type of vector of pointers.") </output>
             requires isValidBitCastType(T1)
                  andBool (notBool isVectorType(T1) orBool notBool hasPointerType(T1))

    //type checking fcmp ops
    //deal with fcmp
    rule <k> typeCheckFCmp(Name:SymbolicValueRef,X:SymbolicValueRef,
              Op:K, T:FPType, V1:K, V2:K, Mods:Set, Meta:InstructionMetadatas)
               => exprType(typeCheckFloatArgs(Name:SymbolicValueRef,
                     T, val(formalizeFloat(T,V1)),val(formalizeFloat(T,V2)),.ElemList))
                    ~> assignUses(Name, TheCount,
                       T, (val(formalizeFloat(T,V1)),val(formalizeFloat(T,V2)),.ElemList))
                   ~> assignType(Name, TheCount, X, integerType(1)) ...</k>
        <instructionCounter> TheCount:Int => TheCount +Int 1 </instructionCounter>
        <tempBlockMap> Now:Map => Now (TheCount |->
              instNumInfo(TheCount, assign(X,instruction(fCmp(Op,
                     T, formalizeFloat(T,V1), formalizeFloat(T,V2)), Mods,
                     insMetas(formElemList(Meta)))), normalInst)) </tempBlockMap>

    rule <k> typeCheckFCmp(Name:SymbolicValueRef, X:SymbolicValueRef, Op:K,
              vectorTypeValue(T:FPType, I:Int), V1:K, V2:K, Mods:Set, Meta:InstructionMetadatas)
               => exprType(typeCheckVectorArgs(Name:SymbolicValueRef,
                  vectorTypeValue(T, I:Int), val(formalizeFloats(
                   vectorTypeValue(T, I:Int),V1)),val(formalizeFloats(
                   vectorTypeValue(T, I:Int),V2)),.ElemList))
                ~> (assignUses(Name, TheCount, vectorTypeValue(T, I:Int),
                  (val(formalizeFloats(
                   vectorTypeValue(T, I:Int),V1)),val(formalizeFloats(
                   vectorTypeValue(T, I:Int),V2)),.ElemList))
                     ~> assignType(Name, TheCount, X, vectorTypeValue(integerType(1), I:Int))) ...</k>
        <instructionCounter> TheCount:Int => TheCount +Int 1 </instructionCounter>
        <tempBlockMap> Now:Map => Now (TheCount |->
              instNumInfo(TheCount, assign(X,instruction(fCmp(Op,
                  vectorTypeValue(T, I:Int), formalizeFloats(
                   vectorTypeValue(T, I:Int),V1), formalizeFloats(
                   vectorTypeValue(T, I:Int),V2)), Mods,
                     insMetas(formElemList(Meta)))), normalInst)) </tempBlockMap>

    rule <k> typeCheckFCmp(Name:SymbolicValueRef, X:K, Op:K,
                 T:KResult, V1:K, V2:K, _:Set, _:InstructionMetadatas)
              ~> K:K => .K </k>
         <output>... .List => ListItem("error: fcmp requires floating point operands") </output>
         requires notBool isFloatType(T) andBool notBool isVectorType(T)

    rule <k> typeCheckFCmp(Name:SymbolicValueRef, X:K, Op:K,
                 vectorTypeValue(T:K, I:Int), V1:K, V2:K, _:Set, _:InstructionMetadatas)
              ~> K:K => .K </k>
         <output>... .List => ListItem("error: fcmp vector requires floating point operands") </output>
         requires notBool isFloatType(T)

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
    rule <k> typeCheckFloatOp(Name:SymbolicValueRef, X:SymbolicValueRef, Op:K,
                 T:FPType, V1:K, V2:K, S:Set, Meta:InstructionMetadatas)
              => exprType(typeCheckFloatArgs(Name:SymbolicValueRef,
                     T, val(formalizeFloat(T,V1)),val(formalizeFloat(T,V2)),.ElemList))
                 ~> assignUses(Name, TheCount,
                       T, (val(formalizeFloat(T,V1)),
                                 val(formalizeFloat(T,V2)),.ElemList))
                 ~> assignType(Name, TheCount, X, T) ...</k>
        <instructionCounter> TheCount:Int => TheCount +Int 1 </instructionCounter>
        <tempBlockMap> Now:Map => Now (TheCount |->
              instNumInfo(TheCount, assign(X,instruction(getKLabelFromOp(Op)(
                       T,, formalizeFloat(T,V1),, formalizeFloat(T,V2)), S,
                     insMetas(formElemList(Meta)))), normalInst)) </tempBlockMap>
            
    rule <k> typeCheckFloatOp(Name:SymbolicValueRef, X:SymbolicValueRef, Op:K,
               vectorTypeValue(T:FPType, I:Int),
                          V1:K, V2:K, S:Set, Meta:InstructionMetadatas)
              => exprType(typeCheckVectorArgs(Name:SymbolicValueRef,
                  vectorTypeValue(T, I:Int), val(formalizeFloats(
                vectorTypeValue(T:FPType, I:Int),V1)),
                 val(formalizeFloats(vectorTypeValue(T:FPType, I:Int),V2)),.ElemList))
                ~> assignUses(Name, TheCount, vectorTypeValue(T, I:Int),
                  (val(formalizeFloats(vectorTypeValue(T:FPType, I:Int),V1)),
                 val(formalizeFloats(vectorTypeValue(T:FPType, I:Int),V2)),.ElemList))
                 ~> assignType(Name, TheCount, X, vectorTypeValue(T, I:Int)) ...</k>
        <instructionCounter> TheCount:Int => TheCount +Int 1 </instructionCounter>
        <tempBlockMap> Now:Map => Now (TheCount |->
              instNumInfo(TheCount, assign(X,instruction(getKLabelFromOp(Op)(
           vectorTypeValue(T, I:Int),, formalizeFloats(
                   vectorTypeValue(T:FPType, I:Int),V1),,
                   formalizeFloats(vectorTypeValue(T:FPType, I:Int),V2)), S,
                     insMetas(formElemList(Meta)))),
                 normalInst)) </tempBlockMap>
          requires I >Int 0

    rule <k> typeCheckFloatOp(Name:SymbolicValueRef, X:SymbolicValueRef, Op:K,
               vectorTypeValue(Ty:KResult, I:Int),
               V1:K, V2:K, S:Set, Meta:InstructionMetadatas) ~> K
              => .K </k>
         <output>... .List => ListItem("error: invalid operand float type for instruction") </output>
         requires notBool isFloatType(Ty)

    rule <k> typeCheckFloatOp(Name:SymbolicValueRef, X:SymbolicValueRef, Op:K,
               vectorTypeValue(Ty:KResult, I:Int),
               V1:K, V2:K, S:Set, Meta:InstructionMetadatas) ~> K
              => .K </k>
         <output>... .List => ListItem("error: invalid vector number for float instruction") </output>
         requires I <=Int 0

    rule <k> typeCheckFloatOp(Name:SymbolicValueRef, X:SymbolicValueRef, Op:K,
                    Ty:KResult, V1:K, V2:K, S:Set, Meta:InstructionMetadatas) ~> K
              => .K </k>
         <output>... .List => ListItem("error: instruction requires float or float vector operands") </output>
         requires notBool isVectorType(Ty) andBool notBool isFloatType(Ty)

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
         <globalTypes>... name(globalVar, X:K) |->
                           flagType(L:Set, T) ...</globalTypes>
    rule <k> typeCheckConstExpr(T:K, name(globalVar, X:K)) ~> K:K => .K </k>
         <globalTypes>... name(globalVar, X:K) |->
                           flagType(L:Set, T':K) ...</globalTypes>
         <output>... .List => ListItem("error: const expression type failed.") </output>
         requires T =/=K T'
    rule typeCheckConstExpr(T:KResult, undef) => T
    rule typeCheckConstExpr(T:KResult, zeroinitializer) => T
    rule typeCheckConstExpr(integerType(N:Int), A:KResult)
               => typeCheckIntExpr(integerType(N:Int), A)
    rule typeCheckConstExpr(pointerTypeValue(T:KResult, Ad:KResult), A:KResult)
               => typeCheckPointerExpr(pointerTypeValue(T, Ad), A)

    /*rule typeCheckConstExpr(T:K, constCastAST(Op:K, T1:K, V1:K, T2:K))
          => typeMatch(T, T2) ~> typeCheckConstExpr(T1, V1)
       not very correct
    */
    rule typeCheckConstExpr(vectorTypeValue(T:K, I:Int), vector(Es:ElemList))
          => typeCheckVectorArg(
                    vectorTypeValue(T:K, I:Int), I, vector(Es:ElemList))

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

    rule <k> typeCheckConstExpr(pointerTypeValue(integerType(8), 0),
              blockAddAST(name(globalVar, X:String), name(localVar, Y:String)))
          => pointerTypeValue(integerType(8), 0) ...</k>
        <tempBlockAddrChecks> S:Set (.Set => SetItem(blockAddVal(
               name(globalVar, X:String),name(localVar, Y:String)))) </tempBlockAddrChecks>

    rule <k> typeCheckConstExpr(T:KResult,
              blockAddAST(X:K, Y:K))
          => pointerTypeValue(integerType(8), 0) ...</k>
         <output>... .List => ListItem("error: block address type must be i8*.") </output>
          requires T ==K pointerTypeValue(integerType(8), 0)

    rule <k> typeCheckConstExpr(T:KResult,
              blockAddAST(X:K, Y:K))
          => pointerTypeValue(integerType(8), 0) ...</k>
         <output>... .List => ListItem("error: block address must be a funtion name and a block name.") </output>
          requires notBool isGlobalVariable(X) orBool notBool isLocalVariable(Y)

    //type check elements of const exprs
    rule typeCheckConstExprs(T:K, .ElemList) => T
    rule typeCheckConstExprs(T:KResult, (valValue(typeOperandResult(T, A:K)), Es:ElemList))
          => exprType(typeCheckConstExpr(T, A))
                     ~> typeCheckConstExprs(T, Es)
    rule <k> typeCheckConstExprs(T:K, (valValue(typeOperandResult(T':KResult, A:K)), Es:ElemList))
              ~> K:K => .K </k>
         <output>... .List => ListItem("error: constant expression type mismatch") </output>
         requires T =/=K T'

    //type check an arg without speicfying types that is in bitcast,load/store
    rule typeCheckArgWithMMX(Name:SymbolicValueRef, x86_mmx, V:K)
            => exprType(typeCheckMMXExpr(x86_mmx, V)) ~> 
                 checkUseVarInside(Name, x86_mmx, V:K)
    rule typeCheckArgWithMMX(Name:SymbolicValueRef, T:K, V:K)
            => typeCheckSingleArg(Name, T, V)
         requires T =/=K x86_mmx

    rule typeCheckMMXExpr(x86_mmx, X:K) => x86_mmx
         requires isLocalVariable(X)
    rule <k> typeCheckMMXExpr(x86_mmx, X:K) ~> K:K 
            => .K </k>
         <output>... .List => ListItem("error: wrong var/constants of x86 mmx type.") </output>
         requires notBool isLocalVariable(X)

    //type check an arg without specifying the type
    rule typeCheckSingleArg(Name:SymbolicValueRef, T:FPType, V:K)
          => exprType(preTypeCheckFloatExpr(T, V))
                   ~> checkUseVarInside(Name, T, V)
    rule typeCheckSingleArg(Name:SymbolicValueRef,
                             arrayTypeValue(T:K, I:Int), V:K)
          => exprType(preTypeCheckArrayExpr(
                          arrayTypeValue(T:K, I:Int), I, V))
                   ~> checkUseVarInside(Name,
                            arrayTypeValue(T:K, I:Int), V)
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

    //type check single struct argument
    rule preTypeCheckStructExpr(T:K, X:SymbolicValueRef) => T
         requires isLocalVariable(X)
             andBool notBool hasInValidMMXType(T)
    rule preTypeCheckStructExpr(T:K, X:K)
           => typeCheckStructExpr(T, T, X)
         requires notBool isLocalVariable(X)
             andBool notBool hasInValidMMXType(T)

    rule <k> preTypeCheckStructExpr(T:K, X:K) ~> K:K => .K </k>
         <output>... .List => ListItem("error: array of x86 mmx type is invalid") </output>
         requires hasInValidMMXType(T)

    rule typeCheckStructExpr(T:KResult, T':KResult, undef) => T
    rule typeCheckStructExpr(T:KResult, T':KResult, zeroinitializer) => T
    rule typeCheckStructExpr(T:KResult, T':KResult, X:SymbolicValueRef) => T
         requires notBool isLocalVariable(X)

    rule <k> typeCheckStructExpr(T:KResult, T':KResult, X:SymbolicValueRef)
                  ~> K:K => .K </k>
         <output>... .List => ListItem("error: struct type position must either be a local variable or a constant expression without local variables.") </output>
         requires isLocalVariable(X)

    rule typeCheckStructExpr(T:KResult, T':KResult, A:ConstExpr)
         => constExprType(typeCheckConstExpr(T, A:ConstExpr))
           ~> typeCheckStructExpr(T:KResult, T', emptyHOLE)
    rule T:KResult ~>
            typeCheckStructExpr(T:KResult, T', emptyHOLE) => T

    rule typeCheckStructExpr(T:KResult, structTypeValue(.TypeList),
                   constantStruct(.ElemList)) => T
    rule typeCheckStructExpr(T:KResult, packedStructTypeValue(.TypeList),
                   packedStruct(.ElemList)) => T

    rule <k> typeCheckStructExpr(T:KResult, structTypeValue(Ts:TypeList),
                   constantStruct(.ElemList)) ~> K:K => .K </k>
         <output>... .List => ListItem("error: a defined struct element type has no corresponding struct element value associated.") </output>
         requires lengthOfTypeList(Ts) >Int 0
    rule <k> typeCheckStructExpr(T:KResult, structTypeValue(.TypeList),
                   constantStruct(Es:ElemList)) ~> K:K => .K </k>
         <output>... .List => ListItem("error: a defined struct element value has no corresponding struct element type associated.") </output>
         requires lengthOfList(Es) >Int 0
    rule <k> typeCheckStructExpr(T:KResult, packedStructTypeValue(Ts:TypeList),
                   packedStruct(.ElemList)) ~> K:K => .K </k>
         <output>... .List => ListItem("error: a defined packed struct element type has no corresponding packed struct element value associated.") </output>
         requires lengthOfTypeList(Ts) >Int 0
    rule <k> typeCheckStructExpr(T:KResult, packedStructTypeValue(.TypeList),
                   packedStruct(Es:ElemList)) ~> K:K => .K </k>
         <output>... .List => ListItem("error: a defined packed struct element value has no corresponding packed struct element type associated.") </output>
         requires lengthOfList(Es) >Int 0

    rule typeCheckStructExpr(T1:KResult, structTypeValue(T:KResult, Ts:TypeList),
                 constantStruct(val(operand(T':K, V:K)), Es:ElemList))
         => exprType(typeCheckStructExprAux(T, T', V))
                 ~> typeCheckStructExpr(T1, structTypeValue(Ts),  constantStruct(Es))

    rule typeCheckStructExpr(T1:KResult, packedStructTypeValue(T:KResult, Ts:TypeList),
                 packedStruct(val(operand(T':K, V:K)), Es:ElemList))
         => exprType(typeCheckStructExprAux(T, T', V))
                 ~> typeCheckStructExpr(T1, packedStructTypeValue(Ts),  packedStruct(Es))

    rule typeCheckStructExprAux(integerType(N:Int), integerType(N), V:K)
              => typeCheckIntExpr(integerType(N), V)
    rule typeCheckStructExprAux(T:FPType, T, V:K) => typeCheckFloatExpr(T, V)
    rule typeCheckStructExprAux(pointerTypeValue(T:KResult, Ad:Int),
              pointerTypeValue(T:KResult, Ad:Int), V:K)
              => typeCheckPointerExpr(pointerTypeValue(T:KResult, Ad:Int), V)
    rule typeCheckStructExprAux(arrayTypeValue(T:KResult, I:Int),
              arrayTypeValue(T:KResult, I:Int), V:K)
              => typeCheckArrayExpr(arrayTypeValue(T:KResult, I:Int), I, V)
    rule typeCheckStructExprAux(vectorTypeValue(T:KResult, I:Int),
              vectorTypeValue(T:KResult, I:Int), V:K)
              => typeCheckVectorArg(vectorTypeValue(T:KResult, I:Int), I, V)
    rule typeCheckStructExprAux(structTypeValue(Ts:TypeList),
              structTypeValue(Ts:TypeList), V:K)
              => typeCheckStructExpr(structTypeValue(Ts:TypeList),
                                       structTypeValue(Ts:TypeList), V)
    rule typeCheckStructExprAux(packedStructTypeValue(Ts:TypeList),
              packedStructTypeValue(Ts:TypeList), V:K)
              => typeCheckStructExpr(packedStructTypeValue(Ts:TypeList),
                                packedStructTypeValue(Ts:TypeList), V)

    rule <k> typeCheckStructExprAux(T:KResult, T':KResult, V:K) ~> K:K => .K </k>
         <output>... .List => ListItem("error: value type declaration is different from the struct type definition.") </output>
         requires T =/=K T'

    //type check single array argument
    rule preTypeCheckArrayExpr(T:K, I:Int, X:SymbolicValueRef) => T
         requires isLocalVariable(X) andBool I >=Int 0
             andBool notBool hasInValidMMXType(T)
    rule preTypeCheckArrayExpr(T:K, I:Int, X:K)
           => typeCheckArrayExpr(T, I, X)
         requires notBool isLocalVariable(X) andBool I >=Int 0
             andBool notBool hasInValidMMXType(T)

    rule <k> preTypeCheckArrayExpr(T:K, I:K, X:K) ~> K:K => .K </k>
         <output>... .List => ListItem("error: array of x86 mmx type is invalid") </output>
         requires I >=Int 0 andBool hasInValidMMXType(T)

    rule <k> preTypeCheckArrayExpr(T:K, I:K, X:K) ~> K:K => .K </k>
         <output>... .List => ListItem("error: invalid array number for instruction") </output>
         requires I <Int 0

    rule typeCheckArrayExpr(T:KResult, I:Int, undef) => T
    rule typeCheckArrayExpr(T:KResult, I:Int, zeroinitializer) => T
    rule typeCheckArrayExpr(T:KResult, I:Int, X:SymbolicValueRef) => T
         requires notBool isLocalVariable(X)
    rule <k> typeCheckArrayExpr(T:KResult, I:Int, X:SymbolicValueRef)
                  ~> K:K => .K </k>
         <output>... .List => ListItem("error: array type position must either be a local variable or a constant expression without local variables.") </output>
         requires isLocalVariable(X)

    rule typeCheckArrayExpr(T:KResult, I:Int, A:ConstExpr)
         => constExprType(typeCheckConstExpr(T, A:ConstExpr))
           ~> typeCheckArrayExpr(T:KResult, I:Int, emptyHOLE)
    rule T:KResult ~>
            typeCheckArrayExpr(T:KResult, I:Int, emptyHOLE) => T

    rule typeCheckArrayExpr(T:KResult, 0, array(.ElemList)) => T
    rule typeCheckArrayExpr(arrayTypeValue(T:KResult, I:Int), N:Int,
                 array(val(operand(T':K, V:K)), R:ElemList))
         => typeCheckArrayExpr(arrayTypeValue(T:KResult, I:Int), N:Int,
                 T':K, V, array(R:ElemList))
         requires N >Int 0
    rule typeCheckArrayExpr(arrayTypeValue(T:KResult, I:Int),
                         N:Int, T:KResult, V:K, Vs:K)
         => typeCheckArrayAux(T, V) 
              ~> typeCheckArrayExpr(
                   arrayTypeValue(T:KResult, I:Int), N -Int 1, Vs)

    rule <k> typeCheckArrayExpr(arrayTypeValue(T:KResult, I:Int),
                          N:Int, T':KResult, V:K, Vs:K) ~> K:K
                => .K </k>
         <output>... .List => ListItem("error: array element type mismatch.") </output>
         requires T =/=K T'
    rule <k> typeCheckArrayExpr(T:K, 0, array(R:ElemList)) ~> K => .K </k>
         <output>... .List => ListItem("error: array index and element number mismatch.") </output>
         requires R =/=K .ElemList
    rule <k> typeCheckArrayExpr(T:K, I:Int, array(.ElemList)) ~> K => .K </k>
         <output>... .List => ListItem("error: array index and element number mismatch.") </output>
         requires I >Int 0

    rule typeCheckArrayAux(integerType(N:Int), V:K)
             => exprType(typeCheckIntExpr(integerType(N:Int), V:K))
    rule typeCheckArrayAux(pointerTypeValue(T:KResult, Ad:KResult), V:K)
             => exprType(typeCheckPointerExpr(
                          pointerTypeValue(T:KResult, Ad:KResult), V:K))
    rule typeCheckArrayAux(arrayTypeValue(T:KResult, N:Int), V:K)
             => exprType(typeCheckArrayExpr(
                          arrayTypeValue(T:KResult, N), N, V:K))
    rule typeCheckArrayAux(vectorTypeValue(T:KResult, N:Int), V:K)
             => exprType(typeCheckVectorArg(
                          vectorTypeValue(T:KResult, N),N, V:K))
    rule typeCheckArrayAux(structTypeValue(Ts:TypeList), V:K)
             => exprType(typeCheckStructExpr(structTypeValue(Ts:TypeList),
                              structTypeValue(Ts:TypeList), V:K))
    rule typeCheckArrayAux(packedStructTypeValue(Ts:TypeList), V:K)
             => exprType(typeCheckStructExpr(packedStructTypeValue(Ts:TypeList),
                              packedStructTypeValue(Ts:TypeList), V:K))

    //start type checking vector arguments
    rule typeCheckVectorArgs(Name:SymbolicValueRef,
           vectorTypeValue(T:K, I:Int), .ElemList) => vectorTypeValue(T:K, I:Int)
         requires I >Int 0

    rule <k> typeCheckVectorArgs(Name:SymbolicValueRef,
           vectorTypeValue(T:K, 0), Es:ElemList) ~> K:K => .K </k>
         <output>... .List => ListItem("error: invalid vector number for instruction") </output>

    rule typeCheckVectorArgs(Name:SymbolicValueRef,
           vectorTypeValue(T:K, I:Int), val(V:K),Es:ElemList)
         => exprType(preTypeCheckVectorArg(vectorTypeValue(T:K, I:Int), I, V))
             ~> checkUseVarInside(Name, vectorTypeValue(T:K, I:Int), V)
             ~> typeCheckVectorArgs(Name, vectorTypeValue(T:K, I:Int), Es)
         requires I >Int 0

    //type check single vector argument
    rule preTypeCheckVectorArg(T:K, I:Int, X:SymbolicValueRef) => T
         requires isLocalVariable(X) andBool I >Int 0
             andBool notBool hasInValidMMXType(vectorTypeValue(T, I))
    rule preTypeCheckVectorArg(T:K, I:Int, X:K)
           => typeCheckVectorArg(T, I, X)
         requires notBool isLocalVariable(X) andBool I >Int 0
             andBool notBool hasInValidMMXType(vectorTypeValue(T, I))

    rule <k> preTypeCheckVectorArg(T:K, I:K, X:K) ~> K:K => .K </k>
         <output>... .List => ListItem("error: vector of x86 mmx type is invalid") </output>
         requires I >Int 0 andBool hasInValidMMXType(vectorTypeValue(T, I))

    rule typeCheckVectorArg(T:KResult, I:Int, undef) => T
    rule typeCheckVectorArg(T:KResult, I:Int, zeroinitializer) => T
    rule typeCheckVectorArg(T:KResult, I:Int, X:SymbolicValueRef) => T
         requires notBool isLocalVariable(X)
    rule <k> typeCheckVectorArg(T:KResult, I:Int, X:SymbolicValueRef)
                  ~> K:K => .K </k>
         <output>... .List => ListItem("error: vector type position must either be a local variable or a constant expression without local variables.") </output>
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

    rule typeCheckVectorAux(T:FPType, V:K)
             => exprType(typeCheckFloatExpr(T, V:K))
    rule typeCheckVectorAux(integerType(N:Int), V:K)
             => exprType(typeCheckIntExpr(integerType(N:Int), V:K))
    rule typeCheckVectorAux(pointerTypeValue(T:KResult, Ad:KResult), V:K)
             => exprType(typeCheckPointerExpr(
                          pointerTypeValue(T:KResult, Ad:KResult), V:K))

    //start type checking float arguments
    rule typeCheckFloatArgs(Name:SymbolicValueRef, T:TypeResult, .ElemList) => T
    rule typeCheckFloatArgs(Name:SymbolicValueRef, T:TypeResult,
         val(V:K), Vs:ElemList)
           => exprType(preTypeCheckFloatExpr(T, V))
                   ~> checkUseVarInside(Name, T, V)
                   ~> typeCheckFloatArgs(Name:SymbolicValueRef, T, Vs)

     //type checking each float argument
    rule preTypeCheckFloatExpr(T:K, V:SymbolicValueRef) => T
         requires isLocalVariable(V)
    rule preTypeCheckFloatExpr(T:K, V:K) => typeCheckFloatExpr(T, V)
         requires notBool isLocalVariable(V)

    rule typeCheckFloatExpr(T:FPType, A:ConstExpr) => typeCheckConstExpr(T, A)
    rule typeCheckFloatExpr(T:FPType, undef) => T
    rule typeCheckFloatExpr(T:FPType, zeroinitializer) => T
    rule typeCheckFloatExpr(T:FPType, float(A:Int, B:Int, L:List)) => T
    rule typeCheckFloatExpr(T:FPType, nan) => T
    rule typeCheckFloatExpr(T:FPType, posZero) => T
    rule typeCheckFloatExpr(T:FPType, negZero) => T
    rule typeCheckFloatExpr(T:FPType, posInf) => T
    rule typeCheckFloatExpr(T:FPType, negInf) => T

    rule <k> typeCheckFloatExpr(T:FPType, X:SymbolicValueRef) ~> K => .K </k>
         <output>... .List => ListItem("error: float type position must either be a local variable or a constant expression without local variables.") </output>
         requires isLocalVariable(X)

    rule <k> typeCheckFloatExpr(T:FPType, badValue) ~> K:K => .K </k>
         <output>... .List => ListItem("error: float value cannot fit in the float type.") </output>

    rule <k> typeCheckFloatExpr(Ty:FPType, F:K) ~> K => .K </k>
         <output>... .List => ListItem("error: float constant must have float type") </output>
         requires notBool isValidFloatExpr(F)

    rule <k> typeCheckFloatExpr(Ty:K, A:K) ~> K => .K </k>
         <output>... .List => ListItem("error: float constant expression type mismatch") </output>
         requires notBool isFloatType(Ty)

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
    rule typeCheckExpr(arrayTypeValue(A:K, I:Int), V:K)
          => preTypeCheckArrayExpr(arrayTypeValue(A:K, I:Int), I, V:K)

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

    rule <k> typeCheckIntExpr(T:KResult, A:HexConstant) ~> K:K => .K </k>
         <output>... .List => ListItem("error: hexadecimal notations are only supported for floating point values.") </output>

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

    //check if all labels used in insts are valid basic block
    rule <k> checkLabelUses => .K ...</k>
         <tempLabelUses> Ts:Set </tempLabelUses>
         <currModule> ModName:SymbolicValueRef </currModule>
         <funModuleName> ModName </funModuleName>
         <currFunction> FunName:SymbolicValueRef </currFunction>
         <functionName> FunName </functionName>
         <basicBlocks> M:Map </basicBlocks>
         requires Ts <=Set keys(M)

    rule <k> checkLabelUses ~> K:K </k>
         <tempLabelUses> Ts:Set </tempLabelUses>
         <output>... .List => ListItem("A label name used in br, phi, switch or indirectbr ops are not valid basic block names in the function.") </output>
         <currModule> ModName:SymbolicValueRef </currModule>
         <funModuleName> ModName </funModuleName>
         <currFunction> FunName:SymbolicValueRef </currFunction>
         <functionName> FunName </functionName>
         <basicBlocks> M:Map </basicBlocks>
         requires notBool (Ts <=Set keys(M))

    //check if a block address is valid
    rule <k> checkBlockAddress(.K) => .K ...</k>
         <tempBlockAddrChecks> .Set </tempBlockAddrChecks>

    rule <k> checkBlockAddress(.K) => checkBlockAddress(A) ...</k>
         <tempBlockAddrChecks> (SetItem(A:K) S:Set) => S -Set SetItem(A:K) </tempBlockAddrChecks>

    rule <k> checkBlockAddress(blockAddVal(FunName:K, B:K))
                 => checkBlockAddress(.K) ...</k>
         <currModule> ModName:SymbolicValueRef </currModule>
         <funModuleName> ModName </funModuleName>
         <functionName> FunName </functionName>
         <basicBlocks> M:Map </basicBlocks>
         <initialBasicBlock> B' </initialBasicBlock>
         requires B in keys(M) andBool B' =/=K B

    rule <k> checkBlockAddress(blockAddVal(FunName:K, B:K)) ~> K:K => .K </k>
         <currModule> ModName:SymbolicValueRef </currModule>
         <funModuleName> ModName </funModuleName>
         <functionName> FunName </functionName>
         <basicBlocks> M:Map </basicBlocks>
         <output>... .List => ListItem("Block name of a blockaddress is not a valid one.") </output>
         requires notBool B in keys(M)

    rule <k> checkBlockAddress(blockAddVal(FunName:K, B:K)) ~> K:K => .K </k>
         <currModule> ModName:SymbolicValueRef </currModule>
         <funModuleName> ModName </funModuleName>
         <functionName> FunName </functionName>
         <initialBasicBlock> B </initialBasicBlock>
         <output>... .List => ListItem("Block name of a blockaddress cannot be the entry block.") </output>

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
                    ~> (checkUseVars
                     ~> (checkLabelUses
                     ~> checkBlockAddress(.K))))))) ...</k>
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
