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


    rule <k> badType ~> K => .K </k>
         <output>... .List => ListItem("error: expected type") </output>

    syntax KItem ::= typeCheckOp(K, K, K) //block name, var name, op
                   | typeCheckIntOp(K, K, K, K, K, K, Set, InstructionMetadatas)    
                                 [strict(4)]//block name, var name, op, ty, v1, v2, attributes, instmeta
                   | typeCheckCastOp(K, K, K, K, K, K, InstructionMetadatas)
                                [strict(4, 6)]//block, variable, operator, T1, V, T2
                   | typeCheckIntArgs(K, K, ElemList)
                   | typeCheckIntArg(K, K, K)//block, t, var
                   | typeCheckIntArg(K, K, K, K)
                   | typeCheckInGepList(K, K, ElemList) //reference type, current type, index list
                   | typeCheckInGepListStruct(K, K, ElemList, K)//reference type, current type, index_list, structural_list
                   | typeCheckIntArg(K, K, K, K, K, K)    [strict(5)]
                   | typeCheckGepOp(K, K, K, K, K, ElemList, Set, InstructionMetadatas)
                             [strict(3,4,6)]//block, var, t, t*, v, (t,v)lists, mods, instmeta
                   | typeCheckAllocaOp(K, K, K, K, K, K, Set, InstructionMetadatas)
                             [strict(3,4)]//block,var, t, int-t, v, align
                   | typeCheckStore(K, K, K, K, K, K, K, Set, InstructionMetadatas)
                             [strict(2,4)]//block, t, v, pt, v, align, atomic, mods, instmeta
                   | typeCheckLoad(K, K, K, K, K, K, K, Set, InstructionMetadatas)
                             [strict(3,4)]//block, var, t, pt, v, align, atomic, mods, instmeta
                   | typeCheckIntArgList(K, ElemList)        [strict(2)]
                   | typeCheckGepArgList(K, ElemList)        [strict(2)]
                   | typeCheckGepArgListInNum(K, ElemList) //int number of vector, list of indexes
                   | typeCheckArgList(K, ElemList)        [strict(2)]
                   | TypeMatchFunctions(K, ElemList, ElemList)  [strict(2,3)]
                   | typeCheckBr(K, K, K, K, K, InstructionMetadatas)    [strict(2)]//block, t, ..., instmeta
                   | typeCheckCmp(K, K, K, K, K, K, InstructionMetadatas)
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
                              [strict(3,5,7)]//block,name type, value, firstT, firstV, secondT, secondV, instmeta
                   | typeCheckResume(K, K, K, InstructionMetadatas)    [strict(2)] //block, type, value, instmeta

/*
uninplemented
, K 
                ~> assign(name(localVar, Int2String(I))
                          ,instruction(invoke(operand(addNameToString(Ty),addNameToString(Va))
                                              ,formElemList(Pa)
                                              ,addNameToString(La1)
                                              ,addNameToString(La2))
                                       ,formSet(Opc) formSet(Re) formSet(Fu)
                                       ,insMetas(formElemList(Meta))))


, K 
                ~> assign(name(localVar, substrString(#tokenToString(Var),1
               ,lengthString(#tokenToString(Var))))
                          ,instruction(invoke(operand(addNameToString(Ty),addNameToString(Va))
                                              ,formElemList(Pa)
                                              ,La1
                                              ,La2)
                                       ,formSet(Opc) formSet(Re) formSet(Fu)
                                       ,insMetas(formElemList(Meta))))


K 
                ~> assign(name(localVar, substrString(#tokenToString(Var),1
                          ,lengthString(#tokenToString(Var))))
                          ,instruction(invoke(operand(addNameToString(Ty),addNameToString(Va))
                                              ,formElemList(Pa)
                                              ,La1
                                              ,La2)
                                       ,formSet(Opc) formSet(Re) formSet(Fu)
                                       ,insMetas(formElemList(Meta)))),

 K
                      ~> assign(name(localVar, Int2String(I)),instValToKItem(In))

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

 K
                       ~> instruction(fence(ord)
                                      , formSet(Ost)
                                      , insMetas(formElemList(Ins)))

*/

    syntax ElemList ::= getValueOfPhi(PHIList) [function]
                   | getLabelOfPhi(PHIList) [function]
                   | getAllTypes(K)   [function]
                   | getValueOfSwitch(JumpTable) [function]
    syntax KItem ::= getVar(K)    [function]
                   | getGepType(K, ElemList)         [function]
                   | getGepInType(K, ElemList, K)         [function]
                   | getGepTypeInStruct(K, K)           [function]

    rule getValueOfSwitch(.JumpTable) => .ElemList
    rule getValueOfSwitch(T:IntType V:ConstValueRef, La:LabelValue Ju:JumpTable)
           => val(typeOperand(T, addNameToString(V))),getValueOfSwitch(Ju)

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

    rule getGepType(gepTypeBag(T:KResult), valValue(A:K),Es:ElemList) => getGepType(T, Es)
    rule getGepType(arrayTypeValue(T1:K, T2:K), valValue(A:K),Es:ElemList)
               => getGepType(T1, Es)
    rule getGepType(vectorTypeValue(T1:K, T2:K), valValue(A:K),Es:ElemList)
               => getGepType(T1, Es)
    rule getGepType(structTypeValue(T1:K),
                valValue(typeOperandResult(A:K, B:K)),Es:ElemList)
               => getGepInType(structTypeValue(T1:K), Es, evalToInt(B))

    rule getGepType(K:K, Es:ElemList) => badType [owise]


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

    //do the same for all IntConstructors  "add" | "sub" | "mul" | "shl"
    //add addNameToString to every position where it has type and ValueRef
    //for example theAdd
    //do the same for LogicalOps ::= "and" | "or" | "xor"

    rule typeCheckOp(Name:SymbolicValueRef,X:SymbolicValueRef, IntOp:IntConstructors
                             Onw:OptNW Ty:Type V1:ValueRef,
                             V2:ValueRef Ins:InstructionMetadatas)
           => typeCheckIntOp(Name:SymbolicValueRef, X, IntOp, Ty,
                           addNameToString(V1), addNameToString(V2), formSet(Onw), Ins)

    rule typeCheckOp(Name:SymbolicValueRef, X:SymbolicValueRef, L:LogicalOps Ty:Type V1:ValueRef,
                  V2:ValueRef Ins:InstructionMetadatas)
           => typeCheckIntOp(Name:SymbolicValueRef, X, L, Ty,
                           addNameToString(V1), addNameToString(V2), .Set, Ins)

    rule typeCheckOp(Name:SymbolicValueRef, X:SymbolicValueRef, trunc Ty1:Type V:ValueRef
                                            to Ty2:Type Ins:InstructionMetadatas)
           => typeCheckCastOp(Name:SymbolicValueRef, X, trunc,
                                          Ty1, addNameToString(V), Ty2, Ins)
    rule typeCheckOp(Name:SymbolicValueRef, X:SymbolicValueRef, zext Ty1:Type V:ValueRef
                                            to Ty2:Type Ins:InstructionMetadatas)
           => typeCheckCastOp(Name:SymbolicValueRef, X, zext,
                                          Ty1, addNameToString(V), Ty2, Ins)
    rule typeCheckOp(Name:SymbolicValueRef, X:SymbolicValueRef, sext Ty1:Type V:ValueRef
                                            to Ty2:Type Ins:InstructionMetadatas)
           => typeCheckCastOp(Name:SymbolicValueRef, X, sext,
                                          Ty1, addNameToString(V), Ty2, Ins)

    rule typeCheckOp(Name:SymbolicValueRef, X:SymbolicValueRef,
                 getelementptr Oib:OptInBounds Ty:Type , Ty1:Type V1:ValueRef,
                                    Itr:ReturnedVal Ins:InstructionMetadatas)
           => typeCheckGepOp(Name:SymbolicValueRef, X, Ty, Ty1,
                        addNameToString(V1), formTypeCheckList(Itr), formSet(Oib), Ins)

    rule <k> typeCheckOp(Name:SymbolicValueRef, X:SymbolicValueRef,
                 getelementptr Oib:OptInBounds Ty:Type ,
                    .ReturnedVal Ins:InstructionMetadatas)
                 ~> K:K => .K </k>
         <output>... .List => ListItem("error: no reference target pointer for getelementptr") </output>

    rule typeCheckOp(Name:SymbolicValueRef, X:SymbolicValueRef,
                         alloca Oil:OptInalloca Ty:Type Ins:InstructionMetadatas)
           => typeCheckAllocaOp(Name:SymbolicValueRef, X,Ty,
                                    undef, undef, 1, formSet(Oil), Ins)
    rule typeCheckOp(Name:SymbolicValueRef, X:SymbolicValueRef,
                            alloca Oil:OptInalloca
                                   Ty:Type, align A:UnsignedInt Ins:InstructionMetadatas)
           => typeCheckAllocaOp(Name:SymbolicValueRef,
                               X,Ty,undef,undef,
                                     String2Int(#tokenToString(A)), formSet(Oil), Ins)
    rule typeCheckOp(Name:SymbolicValueRef, X:SymbolicValueRef,
                        alloca Oil:OptInalloca Ty:Type,
                           It:IntType V:ValueRef Ins:InstructionMetadatas)
           => typeCheckAllocaOp(Name:SymbolicValueRef, X,Ty,It,
                                          addNameToString(V), 1, formSet(Oil), Ins)
    rule typeCheckOp(Name:SymbolicValueRef, X:SymbolicValueRef,
               alloca Oil:OptInalloca Ty:Type, It:IntType V:ValueRef,
                                   align A:UnsignedInt Ins:InstructionMetadatas)
           => typeCheckAllocaOp(Name:SymbolicValueRef, X, Ty, It,
                addNameToString(V), String2Int(#tokenToString(A)), formSet(Oil), Ins)

    rule typeCheckOp(Name:SymbolicValueRef, K:K, store Ovl:OptVolatile
                  Ty1:Type V1:ValueRef, Ty2:Type V2:ValueRef, align I:UnsignedInt
                    Inm:InstructionMetadatas)
           => typeCheckStore(Name:SymbolicValueRef, Ty1:Type,
                addNameToString(V1), Ty2:Type, addNameToString(V2),
                    String2Int(#tokenToString(I)), .K, formSet(Ovl) formSet(align I), Inm)
    rule typeCheckOp(Name:SymbolicValueRef, K:K, store Ovl:OptVolatile
                  Ty1:Type V1:ValueRef, Ty2:Type V2:ValueRef
                    Inm:InstructionMetadatas)
           => typeCheckStore(Name:SymbolicValueRef, Ty1:Type,
                      addNameToString(V1), Ty2:Type, addNameToString(V2), 1, .K, formSet(Ovl), Inm)
    rule typeCheckOp(Name:SymbolicValueRef, K:K, store Oac:Atomic
                                                    Ovl:OptVolatile Ty1:Type V1:ValueRef,
                 Ty2:Type V2:ValueRef Ost:OptSingleThread Ord:Ordering,
                                          align I:UnsignedInt Ins:InstructionMetadatas)
           => typeCheckStore(Name:SymbolicValueRef, Ty1:Type,
                   addNameToString(V1), Ty2:Type, addNameToString(V2),
              String2Int(#tokenToString(I)), Oac, formSet(Oac) formSet(Ovl) formSet(Ost Ord) formSet(align I), Ins)

    rule typeCheckOp(Name:SymbolicValueRef,
              X:SymbolicValueRef, load Ovl:OptVolatile
                  Ty1:Type, Ty2:Type V2:ValueRef, align I:UnsignedInt
                    Inm:InstructionMetadatas)
           => typeCheckLoad(Name:SymbolicValueRef, X, Ty1:Type,
                                Ty2:Type, addNameToString(V2), String2Int(#tokenToString(I)), .K,
                           formSet(Ovl) formSet(align I) ,Inm)
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
                                       Ty2:Type, addNameToString(V2), String2Int(#tokenToString(I)), Oac,
                           formSet(Oac) formSet(Ovl)
                           formSet(Ost:OptSingleThread Ord:Ordering) formSet(align I), Ins)

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
         => typeCheckCmp(Name:SymbolicValueRef, X, Op, Ty,
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

    //deal with indirectBr
    rule <k> typeCheckIndirectBr(Name:SymbolicValueRef, T:KResult, V:K, .ElemList,
                                      Es:ElemList, Meta:InstructionMetadatas)
          => typeCheckIntArg(Name, T, V) ...</k>
        <instructionCounter> TheCount:Int => TheCount +Int 1 </instructionCounter>
         <tempBlockInst> Now:List => Now ListItem(TheCount) </tempBlockInst>
         <instNumToBlock> InstMap:Map => InstMap[TheCount <- Name]  </instNumToBlock>
         <instNumInfo> InfoMap:Map => InfoMap[TheCount
                 <- instNumInfo(seqPoint(TheCount, instruction(indirectbr(operand(T, V),Es)
               ,.Set,insMetas(formElemList(Meta)))),
                .K, .K, .K, .K, getAllLocalVar(V) elemListToSet(Es), terminators)]  </instNumInfo>

    rule <k>typeCheckIndirectBr(Name:SymbolicValueRef, T:K, V:K,
                  val(A:SymbolicValueRef), E2:ElemList,
                  Es:ElemList, Meta:InstructionMetadatas)
                     => typeCheckIndirectBr(Name:SymbolicValueRef,
                           T:K, V:K, E2:ElemList,
                           addElemToEnd(val(A:SymbolicValueRef), Es), Meta) ...</k>
         <currModule> ModName:SymbolicValueRef </currModule>
         <funModuleName> ModName </funModuleName>
         <currFunction> FunName:SymbolicValueRef </currFunction>
         <functionName> FunName </functionName>
         <varTypes>... A |-> label ...</varTypes>

    rule <k> typeCheckIndirectBr(Name:SymbolicValueRef, T:K, V:K,
                  val(A:SymbolicValueRef), E2:ElemList,
                          Es:ElemList, Meta:InstructionMetadatas)
                     => typeCheckIndirectBr(Name:SymbolicValueRef,
                        T:K, V:K, E2:ElemList,
                        addElemToEnd(val(A:SymbolicValueRef), Es), Meta) ...</k>
         <currModule> ModName:SymbolicValueRef </currModule>
         <funModuleName> ModName </funModuleName>
         <currFunction> FunName:SymbolicValueRef </currFunction>
         <functionName> FunName </functionName>
         <varTypes> M:Map </varTypes>
         <basicBlocks>... Name
             |-> blockContent(_:List, _:Set, _:Set, _:Set, _:Set, _:Set,
                     Use:Set (.Set => SetItem(operand(label, A))), _:Set) ...</basicBlocks>
         requires notBool A in keys(M)

    rule <k> typeCheckIndirectBr(Name:SymbolicValueRef, Ty:K, Va:K,
                  val(name(localVar, S:String)), E2:ElemList,
                           Es:ElemList, Meta:InstructionMetadatas)
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
    rule <k> typeCheckSelect(N:SymbolicValueRef, X:SymbolicValueRef,
                    integerType(1), V1:K, T1:KResult, V2:K,
                    T1:KResult, V3:K, Meta:InstructionMetadatas)
            => typeCheckIntArg(N, integerType(1), V1:K)
               ~> typeCheckIntArg(N, T1, V2)
               ~> typeCheckIntArg(N, T1, V3)
               ~> assignType(N, X, integerType(1)) ...</k>
        <instructionCounter> TheCount:Int => TheCount +Int 1 </instructionCounter>
         <tempBlockInst> Now:List => Now ListItem(TheCount) </tempBlockInst>
         <instNumToBlock> InstMap:Map => InstMap[TheCount <- N]  </instNumToBlock>
         <instNumInfo> InfoMap:Map => InfoMap[TheCount
                             <- instNumInfo(seqPoint(TheCount, Now
               ~> assign(X, instruction(select(integerType(1)
                                 ,V1 ,operand(T1,V2)
                                     ,operand(T1,V3))
              ,.Set ,insMetas(formElemList(Meta))))), X, .K, .K, .K,
          getAllLocalVar(V1) getAllLocalVar(V2) getAllLocalVar(V3), normalInst)]  </instNumInfo>

     rule <k> typeCheckSelect(Name:SymbolicValueRef, X:SymbolicValueRef,
                  vectorTypeValue(integerType(1), N:Int), V1:K,
                 vectorTypeValue(T1:KResult, N:Int), V2:K,
                 vectorTypeValue(T1:KResult, N:Int), V3:K, Meta:InstructionMetadatas)
            => typeCheckIntArg(Name, vectorTypeValue(integerType(1), N:Int), V1:K)
               ~> typeCheckIntArg(Name, vectorTypeValue(T1:KResult, N:Int), V2)
               ~> typeCheckIntArg(Name, vectorTypeValue(T1:KResult, N:Int), V3)
               ~> assignType(Name, X, vectorTypeValue(integerType(1), N:Int)) ...</k>
        <instructionCounter> TheCount:Int => TheCount +Int 1 </instructionCounter>
         <tempBlockInst> Now:List => Now ListItem(TheCount) </tempBlockInst>
         <instNumToBlock> InstMap:Map => InstMap[TheCount <- Name]  </instNumToBlock>
         <instNumInfo> InfoMap:Map => InfoMap[TheCount
                             <- instNumInfo(seqPoint(TheCount,
                      assign(X, instruction(select(vectorTypeValue(integerType(1), N:Int)
                                 ,V1 ,operand(vectorTypeValue(T1:KResult, N:Int), V2)
                    ,operand(vectorTypeValue(T1:KResult, N:Int), V3))
                  ,.Set ,insMetas(formElemList(Meta))))), X, .K, .K, .K,
           getAllLocalVar(V1) getAllLocalVar(V2) getAllLocalVar(V3), normalInst)]  </instNumInfo>


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
                 vectorTypeValue(T1:KResult, N:Int), V3:K, _:InstructionMetadatas)
                 ~> K:K => .K </k>
         <output>... .List => ListItem("error: vector select requires selected vectors to have the same vector length as select condition") </output>
         requires N1 =/=K N
    rule <k> typeCheckSelect(Name:SymbolicValueRef, X:SymbolicValueRef,
                 T:KResult, V1:K, T1:KResult, V2:K,
                 T1:KResult, V3:K, _:InstructionMetadatas)
                 ~> K:K => .K </k>
         <output>... .List => ListItem("error: select condition must be i1 or <n x i1>") </output>
         requires getKLabel(T) =/=KLabel 'integerType andBool getKLabel(T) =/=KLabel 'vectorTypeValue


    //deal with switchs
    rule <k> 'typeCheckSwitch(N:SymbolicValueRef,,
                         valValue(typeOperandResult(It:KResult,Va:K)),E1:KResult
                        ,, .ElemList,,
                        val(La:K), Es:ElemList ,, Meta:InstructionMetadatas)
          => typeCheckIntArgList(N, E1) ...</k>
        <instructionCounter> TheCount:Int => TheCount +Int 1 </instructionCounter>
         <tempBlockInst> Now:List => Now ListItem(TheCount) </tempBlockInst>
         <instNumToBlock> InstMap:Map => InstMap[TheCount <- N]  </instNumToBlock>
         <instNumInfo> InfoMap:Map => InfoMap[TheCount
                             <- instNumInfo(seqPoint(TheCount,
                    instruction(switch(addNameToString(It), addNameToString(Va)
                                        ,addNameToString(La)
                                 ,formCasesInList(E1, Es))
                                ,.Set, insMetas(formElemList(Meta)))), .K, .K, .K, .K,
       getAllLocalVar(Va) getAllLocalVar(vector(E1)), terminators)]  </instNumInfo>


    rule <k> 'typeCheckSwitch(Name:SymbolicValueRef,,
                   E1:ElemList,,
                   val(A:SymbolicValueRef), E2:ElemList,,
                   Es:ElemList,, Meta:InstructionMetadatas)
                     => 'typeCheckSwitch(Name:SymbolicValueRef,,
                   E1:ElemList,, E2:ElemList,, addElemToEnd(val(A), Es),, Meta) ...</k>
         <currModule> ModName:SymbolicValueRef </currModule>
         <funModuleName> ModName </funModuleName>
         <currFunction> FunName:SymbolicValueRef </currFunction>
         <functionName> FunName </functionName>
         <varTypes>... A |-> label ...</varTypes>

    rule <k> 'typeCheckSwitch(Name:SymbolicValueRef,,
                   E1:ElemList,,
                   val(A:SymbolicValueRef), E2:ElemList,,
                   Es:ElemList,, Meta:InstructionMetadatas)
                     => 'typeCheckSwitch(Name:SymbolicValueRef,,
                   E1:ElemList,, E2:ElemList,,
                   addElemToEnd(val(A), Es),, Meta) ...</k>
         <currModule> ModName:SymbolicValueRef </currModule>
         <funModuleName> ModName </funModuleName>
         <currFunction> FunName:SymbolicValueRef </currFunction>
         <functionName> FunName </functionName>
         <varTypes> M:Map </varTypes>
         <basicBlocks>... Name
             |-> blockContent(_:List, _:Set, _:Set, _:Set, _:Set, _:Set,
                     Use:Set (.Set => SetItem(operand(label, A))), _:Set) ...</basicBlocks>
         requires notBool A in keys(M)

    rule <k> 'typeCheckSwitch(Name:SymbolicValueRef,,
                   E1:ElemList,,
                   val(name(localVar, S:String)), E2:ElemList,,
                   Es:ElemList,, Meta:InstructionMetadatas)
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
    rule <k> typeCheckCall(Name:SymbolicValueRef, .K, Ca:OptTailCall, void,
             V1:SymbolicValueRef, Ts:KResult, Tv:KResult,
             Arg:ParamList, Mods:Set, Meta:InstructionMetadatas)
        => TypeMatchFunctions(V1, Ts, getAllTypes(Ts')) ~> typeCheckArgList(Name, Tv) ...</k>
        <currModule> ModName:SymbolicValueRef </currModule>
        <funModuleName> ModName </funModuleName>
        <formalParameters> arguments(Ts':ElemList) </formalParameters>
        <functionName> V1 </functionName>
        <instructionCounter> TheCount:Int => TheCount +Int 1 </instructionCounter>
         <tempBlockInst> Now:List => Now ListItem(TheCount) </tempBlockInst>
         <instNumToBlock> InstMap:Map => InstMap[TheCount <- Name]  </instNumToBlock>
         <instNumInfo> InfoMap:Map => InfoMap[TheCount
                  <- instNumInfo(seqPoint(TheCount,
                        instruction(getKLabelFromOp(Ca)(void,, callee(V1,
                           arguments(formArgList(Tv,Arg))))
                          ,Mods, insMetas(formElemList(Meta)))), .K,
                .K, .K, .K, getAllLocalVars(Tv), callInst)]  </instNumInfo>



    rule <k> typeCheckCall(Name:SymbolicValueRef, A:SymbolicValueRef, Ca:OptTailCall,
             T:KResult, V1:SymbolicValueRef, Ts:KResult, Tv:KResult,
             Arg:ParamList, Mods:Set, Meta:InstructionMetadatas)
        => TypeMatchFunctions(V1, Ts, getAllTypes(Ts')) ~> typeCheckArgList(Name, Tv)
           ~> assignType(Name, A, T) ...</k>
        <currModule> ModName:SymbolicValueRef </currModule>
        <funModuleName> ModName </funModuleName>
        <formalParameters> arguments(Ts':ElemList) </formalParameters>
        <functionName> V1 </functionName>
        <instructionCounter> TheCount:Int => TheCount +Int 1 </instructionCounter>
         <tempBlockInst> Now:List => Now ListItem(TheCount) </tempBlockInst>
         <instNumToBlock> InstMap:Map => InstMap[TheCount <- Name]  </instNumToBlock>
         <instNumInfo> InfoMap:Map => InfoMap[TheCount
                  <- instNumInfo(seqPoint(TheCount,
                     assign(A, instruction(getKLabelFromOp(Ca)(T,,
                           callee(V1, arguments(formArgList(Tv,Arg))))
                          ,Mods, insMetas(formElemList(Meta))))),
                   A, .K, .K, .K, getAllLocalVars(Tv), callInst)]  </instNumInfo>

    //deal with ret
    rule <k> typeCheckRet(N:SymbolicValueRef, T:KResult, V:K
                    , Meta:InstructionMetadatas) => typeCheckIntArg(N, T, V) ...</k>
        <instructionCounter> TheCount:Int => TheCount +Int 1 </instructionCounter>
         <tempBlockInst> Now:List => Now ListItem(TheCount) </tempBlockInst>
         <instNumToBlock> InstMap:Map => InstMap[TheCount <- N]  </instNumToBlock>
         <instNumInfo> InfoMap:Map => InfoMap[TheCount
                  <- instNumInfo(seqPoint(TheCount, instruction(ret(T,V)
                                        ,.Set
                                        ,insMetas(formElemList(Meta)))), .K,
                    .K, .K, .K, getAllLocalVar(V), returnInst)]  </instNumInfo>

    //deal with phi of type check
    //there is a big bug in the implementaton of phi function
    //TODO: from LLVM documentation, it is legal to associate two label values together.
    //so we can branch to a label value with two different blocks. 
    //hence, this is a undefined behavior for what it will goto in this case.
    //clang doesnt this behavior
    rule (.K => typeCheckIntArg(Name, T, V))
            ~> typeCheckPhi(Name:SymbolicValueRef, X:SymbolicValueRef, T:KResult,
                  (val(V:ConstValueRef), E1:ElemList => E1),
                     _:ElemList, _:Set, _:ElemList, _:InstructionMetadatas)

    rule <k> typeCheckPhi(Name:SymbolicValueRef, X:SymbolicValueRef, T:KResult,
                  (val(name(localVar, S:String)), E1:ElemList => E1),
                   _:ElemList, _:Set, _:ElemList, _:InstructionMetadatas) ...</k>
         <currModule> ModName:SymbolicValueRef </currModule>
         <funModuleName> ModName </funModuleName>
         <currFunction> FunName:SymbolicValueRef </currFunction>
         <functionName> FunName </functionName>
         <varTypes>... name(localVar, S:String) |-> T ...</varTypes>
         <basicBlocks>... Name
             |-> blockContent(_:List, _:Set, _:Set, Def:Set, _:Set, _:Set, _:Set, _:Set) ...</basicBlocks>
         requires operand(T, name(localVar, S:String)) in Def

    rule <k> typeCheckPhi(Name:SymbolicValueRef, X:SymbolicValueRef, T:KResult,
                  (val(name(localVar, S:String)), E1:ElemList => E1),
                  _:ElemList, _:Set, _:ElemList, _:InstructionMetadatas) ...</k>
         <currModule> ModName:SymbolicValueRef </currModule>
         <funModuleName> ModName </funModuleName>
         <currFunction> FunName:SymbolicValueRef </currFunction>
         <functionName> FunName </functionName>
         <varTypes> M:Map </varTypes>
         <basicBlocks>... Name
             |-> blockContent(_:List, _:Set, _:Set, Def:Set, _:Set,
                  UsePhi:Set (.Set => SetItem(operand(T, name(localVar, S:String)))), _:Set, _:Set) ...</basicBlocks>
         requires notBool operand(T, name(localVar, S:String)) in Def

    rule <k> typeCheckPhi(Name:SymbolicValueRef, X:SymbolicValueRef,
             T:KResult, val(name(localVar, S:String)), E1:ElemList,
                    E2:ElemList, _:Set, _:ElemList, _:InstructionMetadatas)
             ~> K:K => .K </k>
         <currModule> ModName:SymbolicValueRef </currModule>
         <funModuleName> ModName </funModuleName>
         <currFunction> FunName:SymbolicValueRef </currFunction>
         <functionName> FunName </functionName>
         <output>... .List => ListItem("error: constant expression type mismatch") </output>
         <varTypes>... name(localVar, S:String) |-> T' ...</varTypes>
         requires T' =/=K T

    rule <k> typeCheckPhi(Name:SymbolicValueRef, X:SymbolicValueRef,
             T:KResult, .ElemList, .ElemList, InSet:Set,
             Es:ElemList, Meta:InstructionMetadatas) => assignType(Name, X, T) ...</k>
         <matchPhisWithInEdges>... (.List => ListItem(phiEdges(Name, InSet))) </matchPhisWithInEdges>
        <instructionCounter> TheCount:Int => TheCount +Int 1 </instructionCounter>
         <tempBlockInst> Now:List => Now ListItem(TheCount) </tempBlockInst>
         <instNumToBlock> InstMap:Map => InstMap[TheCount <- Name]  </instNumToBlock>
         <instNumInfo> InfoMap:Map => InfoMap[TheCount
                  <- instNumInfo(seqPoint(TheCount,
                  assign(X, instruction(phi(T, Es),.Set
                          ,insMetas(formElemList(Meta))))),
                        X, .K, .K, .K, getAllLocalVars(Es), normalInst)]  </instNumInfo>


    rule <k> typeCheckPhi(Name:SymbolicValueRef, X:SymbolicValueRef,
              T:KResult, E1:ElemList, val(name(localVar, S:String)),
                     L:ElemList, InSet:Set, Es:ElemList, Meta:InstructionMetadatas)
                => typeCheckPhi(Name, X, T, E1, L,
                   SetItem(name(localVar, S:String)) InSet:Set,
                       Es:ElemList, Meta:InstructionMetadatas) ...</k>
         <currModule> ModName:SymbolicValueRef </currModule>
         <funModuleName> ModName </funModuleName>
         <currFunction> FunName:SymbolicValueRef </currFunction>
         <functionName> FunName </functionName>
         <varTypes> M:Map </varTypes>
         <basicBlocks>... Name
             |-> blockContent(_:List, _:Set, _:Set, _:Set, _:Set, _:Set,
                     Use:Set (.Set
                  => SetItem(operand(label, name(localVar, S:String)))), _:Set) ...</basicBlocks>
         requires notBool name(localVar, S:String) in keys(M)
                  andBool notBool name(localVar, S:String) in InSet

    rule <k> typeCheckPhi(Name:SymbolicValueRef, X:SymbolicValueRef,
              T:KResult, E1:ElemList, val(Y:SymbolicValueRef),
                  L:ElemList, InSet:Set, Es:ElemList, Meta:InstructionMetadatas)
                => typeCheckPhi(Name, X, T, E1, L, SetItem(Y) InSet:Set,
                            Es:ElemList, Meta:InstructionMetadatas) ...</k>
         <currModule> ModName:SymbolicValueRef </currModule>
         <funModuleName> ModName </funModuleName>
         <currFunction> FunName:SymbolicValueRef </currFunction>
         <functionName> FunName </functionName>
         <varTypes>... Y |-> label ...</varTypes>
         requires notBool Y in InSet

    rule <k> typeCheckPhi(Name:SymbolicValueRef, name(localVar, S:String),
              T:KResult, E1:ElemList, val(Y:SymbolicValueRef),
                L:ElemList, InSet:Set, _:ElemList, _:InstructionMetadatas) ~> K:K
                => .K </k>
         <output>... .List 
                => ListItem("error: not a well form program because defining a edge twice in a phi function '%"
                      +String S +String "'") </output>
         requires Y in InSet

    rule <k> typeCheckPhi(Name:SymbolicValueRef, X:SymbolicValueRef, T:KResult, E1:ElemList
               , val(name(localVar, S:String)), L:ElemList,
              InSet:Set, _:ElemList, _:InstructionMetadatas) ~> K:K
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

    //deal with fcmp
    rule <k> typeCheckFCmp(Name:SymbolicValueRef,X:SymbolicValueRef,
              Op:Bool, T:KResult, V1:K, V2:K, Meta:InstructionMetadatas)
               => typeCheckIntArg(Name, T, V1) ~> typeCheckIntArg(Name, T, V2)
                   ~> assignType(Name, X, integerType(1)) ...</k>
        <instructionCounter> TheCount:Int => TheCount +Int 1 </instructionCounter>
         <instNumToBlock> InstMap:Map => InstMap[TheCount <- Name]  </instNumToBlock>
         <instNumInfo> InfoMap:Map => InfoMap[TheCount
                  <- instNumInfo(seqPoint(TheCount,
                assign(X,instruction(#if Op ==K true #then 1 #else 0 #fi, .Set,
                     insMetas(formElemList(Meta))))),
             X, .K, .K, .K, getAllLocalVar(V1) getAllLocalVar(V2), normalInst)]  </instNumInfo>
         <tempBlockInst> Now:List => Now ListItem(TheCount) </tempBlockInst>
         requires (T ==K float orBool T ==K double
                  orBool T ==K ppc_fp128 orBool T ==K half
                  orBool T ==K fp128 orBool T ==K x86_fp80)

    rule <k> typeCheckFCmp(Name:SymbolicValueRef, X:SymbolicValueRef, Op:Bool,
              vectorTypeValue(T:KResult, I:Int), V1:K, V2:K, Meta:InstructionMetadatas)
               => typeCheckIntArg(Name:SymbolicValueRef,
                              vectorTypeValue(T:KResult, I:Int), V1)
                     ~> typeCheckIntArg(Name:SymbolicValueRef,
                            vectorTypeValue(T:KResult, I:Int), V2)
                     ~> assignType(Name, X, vectorTypeValue(integerType(1), I:Int)) ...</k>
        <instructionCounter> TheCount:Int => TheCount +Int 1 </instructionCounter>
         <instNumToBlock> InstMap:Map => InstMap[TheCount <- Name]  </instNumToBlock>
         <instNumInfo> InfoMap:Map => InfoMap[TheCount
                  <- instNumInfo(seqPoint(TheCount,
                assign(X,instruction(#if Op ==K true #then 1 #else 0 #fi, .Set,
                     insMetas(formElemList(Meta))))),
               X, .K, .K, .K, getAllLocalVar(V1) getAllLocalVar(V2), normalInst)]  </instNumInfo>
         <tempBlockInst> Now:List => Now ListItem(TheCount) </tempBlockInst>
         requires (T ==K float orBool T ==K double
                  orBool T ==K ppc_fp128 orBool T ==K half
                  orBool T ==K fp128 orBool T ==K x86_fp80)

    rule <k> typeCheckFCmp(Name:SymbolicValueRef,X:SymbolicValueRef,
             Op:FPredicate, T:KResult, V1:K, V2:K, Meta:InstructionMetadatas)
               => typeCheckIntArg(Name, T, V1) ~> typeCheckIntArg(Name, T, V2)
                   ~> assignType(Name, X, integerType(1)) ...</k>
        <instructionCounter> TheCount:Int => TheCount +Int 1 </instructionCounter>
         <instNumToBlock> InstMap:Map => InstMap[TheCount <- Name]  </instNumToBlock>
         <instNumInfo> InfoMap:Map => InfoMap[TheCount
                  <- instNumInfo(seqPoint(TheCount, assign(X,
            instruction(getKLabelFromOp(Op)(T,, addNameToString(V1)
                              ,, addNameToString(V2)) ,.Set
                          ,insMetas(formElemList(Meta))))),
               X, .K, .K, .K, getAllLocalVar(V1) getAllLocalVar(V2), normalInst)]  </instNumInfo>
         <tempBlockInst> Now:List => Now ListItem(TheCount) </tempBlockInst>
         requires Op =/=K true andBool Op =/=K false
                  andBool (T ==K float orBool T ==K double
                  orBool T ==K ppc_fp128 orBool T ==K half
                  orBool T ==K fp128 orBool T ==K x86_fp80)

    rule <k> typeCheckFCmp(Name:SymbolicValueRef, X:SymbolicValueRef, Op:FPredicate,
             vectorTypeValue(T:KResult, I:Int), V1:K, V2:K, Meta:InstructionMetadatas)
               => typeCheckIntArg(Name:SymbolicValueRef,
                              vectorTypeValue(T:KResult, I:Int), V1)
                     ~> typeCheckIntArg(Name:SymbolicValueRef,
                            vectorTypeValue(T:KResult, I:Int), V2)
                     ~> assignType(Name, X, vectorTypeValue(integerType(1), I:Int)) ...</k>
        <instructionCounter> TheCount:Int => TheCount +Int 1 </instructionCounter>
         <instNumToBlock> InstMap:Map => InstMap[TheCount <- Name]  </instNumToBlock>
         <instNumInfo> InfoMap:Map => InfoMap[TheCount
                  <- instNumInfo(seqPoint(TheCount, assign(X, instruction(
                         getKLabelFromOp(Op)(
                            vectorTypeValue(T:KResult, I:Int)
                              ,, addNameToString(V1)
                              ,, addNameToString(V2)),.Set
                          ,insMetas(formElemList(Meta))))),
                   X, .K, .K, .K, getAllLocalVar(V1) getAllLocalVar(V2), normalInst)]  </instNumInfo>
         <tempBlockInst> Now:List => Now ListItem(TheCount) </tempBlockInst>
         requires Op =/=K true andBool Op =/=K false
                  andBool (T ==K float orBool T ==K double
                  orBool T ==K ppc_fp128 orBool T ==K half
                  orBool T ==K fp128 orBool T ==K x86_fp80)

    rule <k> typeCheckFCmp(Name:SymbolicValueRef, X:K, Op:K,
                 T:KResult, V1:K, V2:K, _:InstructionMetadatas)
              ~> K:K => .K </k>
         <output>... .List => ListItem("error: fcmp requires floating point operands") </output>
         requires T =/=K float andBool T =/=K double
                  andBool T =/=K ppc_fp128 andBool T =/=K half
                  andBool T =/=K fp128 andBool T =/=K x86_fp80

    rule <k> typeCheckFCmp(Name:SymbolicValueRef, X:K, Op:K,
                 vectorTypeValue(T:K, I:Int), V1:K, V2:K, _:InstructionMetadatas)
              ~> K:K => .K </k>
         <output>... .List => ListItem("error: fcmp requires floating point operands") </output>
         requires T =/=K float andBool T =/=K double
                  andBool T =/=K ppc_fp128 andBool T =/=K half
                  andBool T =/=K fp128 andBool T =/=K x86_fp80

    //deal with icmp
    rule <k> typeCheckCmp(Name:SymbolicValueRef, X:SymbolicValueRef, Op:IPredicate,
               T:KResult, V1:K, V2:K, Meta:InstructionMetadatas)
               => typeCheckIntArg(Name, T, V1) ~> typeCheckIntArg(Name, T, V2)
                  ~> assignType(Name, X, integerType(1)) ...</k>
        <instructionCounter> TheCount:Int => TheCount +Int 1 </instructionCounter>
         <instNumToBlock> InstMap:Map => InstMap[TheCount <- Name]  </instNumToBlock>
         <instNumInfo> InfoMap:Map => InfoMap[TheCount
                  <- instNumInfo(seqPoint(TheCount, assign(X,instruction(iCmp(Op, T, V1, V2), .Set,
                     insMetas(formElemList(Meta))))),
              X, .K, .K, .K, getAllLocalVar(V1) getAllLocalVar(V2), normalInst)]  </instNumInfo>
         <tempBlockInst> Now:List => Now ListItem(TheCount) </tempBlockInst>
         requires (getKLabel(T) ==KLabel 'integerType
               orBool getKLabel(T) ==KLabel 'pointerTypeValue)
         
    rule <k> typeCheckCmp(Name:SymbolicValueRef, X:SymbolicValueRef, Op:IPredicate,
                     vectorTypeValue(integerType(N:Int), I:Int),
                     V1:K, V2:K, Meta:InstructionMetadatas)
               => typeCheckIntArg(Name:SymbolicValueRef,
                                  vectorTypeValue(integerType(N:Int), I:Int), V1)
                     ~> typeCheckIntArg(Name:SymbolicValueRef,
                                    vectorTypeValue(integerType(N:Int), I:Int), V2)
                     ~> assignType(Name, X, vectorTypeValue(integerType(1), I:Int))
         ...</k>
        <instructionCounter> TheCount:Int => TheCount +Int 1 </instructionCounter>
         <instNumToBlock> InstMap:Map => InstMap[TheCount <- Name]  </instNumToBlock>
         <instNumInfo> InfoMap:Map => InfoMap[TheCount
                  <- instNumInfo(seqPoint(TheCount, assign(X,instruction(iCmp(Op,
                  vectorTypeValue(integerType(N:Int),
                  I:Int), V1, V2), .Set,
                     insMetas(formElemList(Meta))))),
             X, .K, .K, .K, getAllLocalVar(V1) getAllLocalVar(V2), normalInst)]  </instNumInfo>
         <tempBlockInst> Now:List => Now ListItem(TheCount) </tempBlockInst>

    rule <k> typeCheckCmp(Name:SymbolicValueRef, X, Op:K,
              T:KResult, V1:K, V2:K, _:InstructionMetadatas) ~> K:K  => .K </k>
         <output>... .List => ListItem("error: icmp requires integer operands") </output>
         requires getKLabel(T) =/=KLabel 'integerType
               andBool getKLabel(T) =/=KLabel 'pointerTypeValue
               andBool getKLabel(T) =/=KLabel 'vectorTypeValue

    rule <k> typeCheckCmp(Name:SymbolicValueRef, X, Op:K,
             vectorTypeValue(T:K, I:Int), V1:K, V2:K,
             _:InstructionMetadatas) ~> K:K => .K </k>
         <output>... .List => ListItem("error: icmp requires integer operands") </output>
         requires getKLabel(T) =/=KLabel 'integerType

    //deal with brs
    rule <k> typeCheckBr(Name:SymbolicValueRef, undef,
                   _:K, A:SymbolicValueRef, _:K, Meta:InstructionMetadatas) => .K ...</k>
         <currModule> ModName:SymbolicValueRef </currModule>
        <instructionCounter> TheCount:Int => TheCount +Int 1 </instructionCounter>
         <instNumToBlock> InstMap:Map => InstMap[TheCount <- Name]  </instNumToBlock>
         <instNumInfo> InfoMap:Map => InfoMap[TheCount
                  <- instNumInfo(seqPoint(TheCount, instruction(unconditional(A),.Set
                                  ,insMetas(formElemList(Meta)))), .K,
                    .K, .K, .K, .Set, terminators)]  </instNumInfo>
         <tempBlockInst> Now:List => Now ListItem(TheCount) </tempBlockInst>
         <funModuleName> ModName </funModuleName>
         <currFunction> FunName:SymbolicValueRef </currFunction>
         <functionName> FunName </functionName>
         <varTypes>... A |-> label ...</varTypes>

    rule <k> typeCheckBr(Name:SymbolicValueRef, undef,
                    _:K, A:SymbolicValueRef, _:K, Meta:InstructionMetadatas) => .K ...</k>
         <currModule> ModName:SymbolicValueRef </currModule>
        <instructionCounter> TheCount:Int => TheCount +Int 1 </instructionCounter>
         <tempBlockInst> Now:List => Now ListItem(TheCount) </tempBlockInst>
         <instNumToBlock> InstMap:Map => InstMap[TheCount <- Name]  </instNumToBlock>
         <instNumInfo> InfoMap:Map => InfoMap[TheCount
                  <- instNumInfo(seqPoint(TheCount, instruction(unconditional(A),.Set
                                  ,insMetas(formElemList(Meta)))), .K,
                    .K, .K, .K, .Set, terminators)]  </instNumInfo>
         <funModuleName> ModName </funModuleName>
         <currFunction> FunName:SymbolicValueRef </currFunction>
         <functionName> FunName </functionName>
         <varTypes> M:Map </varTypes>
         <basicBlocks>... Name
             |-> blockContent(_:List, _:Set, _:Set, _:Set, _:Set, _:Set,
                     Use:Set (.Set => SetItem(operand(label, A))), _:Set) ...</basicBlocks>
         requires notBool A in keys(M)

    rule <k> typeCheckBr(Name:SymbolicValueRef, undef,
                  _:K, name(localVar, S:String), _:K,
                        Meta:InstructionMetadatas) ~> K:K => .K </k>
         <output>... .List => ListItem("error: '%"
                   +String S +String "' is not a basic block") </output>
         <currModule> ModName:SymbolicValueRef </currModule>
         <funModuleName> ModName </funModuleName>
         <currFunction> FunName:SymbolicValueRef </currFunction>
         <functionName> FunName </functionName>
         <varTypes>... name(localVar, S:String) |-> T:K ...</varTypes>
         requires T =/=K label

    rule <k> typeCheckBr(Name:SymbolicValueRef,
             integerType(1), A:K, L1:SymbolicValueRef,
                     L2:SymbolicValueRef, Meta:InstructionMetadatas)
                 => typeCheckIntArg(Name, integerType(1), A) ...</k>
         <currModule> ModName:SymbolicValueRef </currModule>
        <instructionCounter> TheCount:Int => TheCount +Int 1 </instructionCounter>
         <tempBlockInst> Now:List => Now ListItem(TheCount) </tempBlockInst>
         <instNumToBlock> InstMap:Map => InstMap[TheCount <- Name]  </instNumToBlock>
         <instNumInfo> InfoMap:Map => InfoMap[TheCount
                  <- instNumInfo(seqPoint(TheCount,
                instruction(conditional(operand(integerType(1),A), L1, L2),.Set,
                             insMetas(formElemList(Meta)))), .K,
                    .K, .K, .K, getAllLocalVar(A), terminators)]  </instNumInfo>
         <funModuleName> ModName </funModuleName>
         <currFunction> FunName:SymbolicValueRef </currFunction>
         <functionName> FunName </functionName>
         <varTypes> M:Map </varTypes>
         <basicBlocks>... Name
             |-> blockContent(_:List, _:Set, _:Set, _:Set, _:Set, _:Set,
                     Use:Set (.Set => SetItem(operand(label, L1))
                              SetItem(operand(label, L2))), _:Set) ...</basicBlocks>
         requires (notBool L1 in keys(M)) andBool (notBool L2 in keys(M))

    rule <k> typeCheckBr(Name:SymbolicValueRef,
             integerType(1), A:K, L1:SymbolicValueRef,
                       L2:SymbolicValueRef, Meta:InstructionMetadatas)
                 => typeCheckIntArg(Name, integerType(1), A) ...</k>
         <currModule> ModName:SymbolicValueRef </currModule>
        <instructionCounter> TheCount:Int => TheCount +Int 1 </instructionCounter>
         <tempBlockInst> Now:List => Now ListItem(TheCount) </tempBlockInst>
         <instNumToBlock> InstMap:Map => InstMap[TheCount <- Name]  </instNumToBlock>
         <instNumInfo> InfoMap:Map => InfoMap[TheCount
                  <- instNumInfo(seqPoint(TheCount, 
                  instruction(conditional(operand(integerType(1),A)
                             ,L1,L2),.Set,
                             insMetas(formElemList(Meta)))), .K,
                    .K, .K, .K, getAllLocalVar(A), terminators)]  </instNumInfo>
         <funModuleName> ModName </funModuleName>
         <currFunction> FunName:SymbolicValueRef </currFunction>
         <functionName> FunName </functionName>
         <varTypes> M:Map </varTypes>
         <basicBlocks>... Name
             |-> blockContent(_:List, _:Set, _:Set, _:Set, _:Set, _:Set,
                     Use:Set (.Set => SetItem(operand(label, L1))), _:Set) ...</basicBlocks>
         requires L2 in keys(M) andBool (notBool L1 in keys(M))
                  andBool M[L2] ==K label

    rule <k> typeCheckBr(Name:SymbolicValueRef,
             integerType(1), A:K, L1:SymbolicValueRef,
                   L2:SymbolicValueRef, Meta:InstructionMetadatas)
                 => typeCheckIntArg(Name, integerType(1), A) ...</k>
         <currModule> ModName:SymbolicValueRef </currModule>
        <instructionCounter> TheCount:Int => TheCount +Int 1 </instructionCounter>
         <tempBlockInst> Now:List => Now ListItem(TheCount) </tempBlockInst>
         <instNumToBlock> InstMap:Map => InstMap[TheCount <- Name]  </instNumToBlock>
         <instNumInfo> InfoMap:Map => InfoMap[TheCount
                  <- instNumInfo(seqPoint(TheCount,
                  instruction(conditional(operand(integerType(1),A)
                             ,L1,L2),.Set,
                             insMetas(formElemList(Meta)))), .K,
                    .K, .K, .K, getAllLocalVar(A), terminators)]  </instNumInfo>
         <funModuleName> ModName </funModuleName>
         <currFunction> FunName:SymbolicValueRef </currFunction>
         <functionName> FunName </functionName>
         <varTypes> M:Map </varTypes>
         <basicBlocks>... Name
             |-> blockContent(_:List, _:Set, _:Set, _:Set, _:Set, _:Set,
                     Use:Set (.Set => SetItem(operand(label, L2))), _:Set) ...</basicBlocks>
         requires L1 in keys(M) andBool (notBool L2 in keys(M))
                  andBool M[L1] ==K label

    rule <k> typeCheckBr(Name:SymbolicValueRef,
             integerType(1), A:K, L1:SymbolicValueRef,
                L2:SymbolicValueRef, Meta:InstructionMetadatas)
                 => typeCheckIntArg(Name, integerType(1), A) ...</k>
        <instructionCounter> TheCount:Int => TheCount +Int 1 </instructionCounter>
         <tempBlockInst> Now:List => Now ListItem(TheCount) </tempBlockInst>
         <instNumToBlock> InstMap:Map => InstMap[TheCount <- Name]  </instNumToBlock>
         <instNumInfo> InfoMap:Map => InfoMap[TheCount
                  <- instNumInfo(seqPoint(TheCount,
           instruction(conditional(operand(integerType(1),A), L1, L2),.Set,
                             insMetas(formElemList(Meta)))), .K,
                    .K, .K, .K, getAllLocalVar(A), terminators)]  </instNumInfo>
         <currModule> ModName:SymbolicValueRef </currModule>
         <funModuleName> ModName </funModuleName>
         <currFunction> FunName:SymbolicValueRef </currFunction>
         <functionName> FunName </functionName>
         <varTypes> M:Map </varTypes>
         requires L1 in keys(M) andBool L2 in keys(M)
                  andBool M[L1] ==K label andBool M[L2] ==K label

    rule <k> typeCheckBr(Name:SymbolicValueRef,
            integerType(N:Int), A:K, L1:K, L2:K, _:InstructionMetadatas) ~> K:K => .K </k>
         <output>... .List => ListItem("error: branch condition must have 'i1' type") </output>
         requires N =/=Int 1

    rule <k> typeCheckBr(Name:SymbolicValueRef, integerType(1),
             A:K, name(localVar, S:String), _:K, _:InstructionMetadatas) ~> K:K => .K </k>
         <output>... .List => ListItem("error: '%"
                   +String S +String "' is not a basic block") </output>
         <currModule> ModName:SymbolicValueRef </currModule>
         <funModuleName> ModName </funModuleName>
         <currFunction> FunName:SymbolicValueRef </currFunction>
         <functionName> FunName </functionName>
          <varTypes>... name(localVar, S:String) |-> T:K ...</varTypes>
         requires T =/=K label

    rule <k> typeCheckBr(Name:SymbolicValueRef,
                    integerType(1), A:K, _:K,
              name(localVar, S:String), _:InstructionMetadatas) ~> K:K
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
    rule <k> typeCheckLoad(Name:SymbolicValueRef, X:SymbolicValueRef, T:KResult,
                     pointerTypeValue(T:KResult, A:K), V2:K,
                            Align:Int, At:K, Mods:Set, Meta:InstructionMetadatas)
              => typeCheckIntArg(Name, pointerTypeValue(T:KResult, A:K), V2)
                 ~> assignType(Name, X, T) ...</k>
        <instructionCounter> TheCount:Int => TheCount +Int 1 </instructionCounter>
         <tempBlockInst> Now:List => Now ListItem(TheCount) </tempBlockInst>
         <instNumToBlock> InstMap:Map => InstMap[TheCount <- Name]  </instNumToBlock>
         <instNumInfo> InfoMap:Map => InfoMap[TheCount
                  <- instNumInfo(seqPoint(TheCount,
                       assign(X, instruction(load(pointerTypeValue(T:KResult, A:K),
                   V2) ,Mods ,insMetas(formElemList(Meta))))),
                    X, .K, .K, usedLoc(V2),
                 getAllLocalVar(V2) SetItem(usedLoc(V2)), loadInst)]  </instNumInfo>
         requires isValidAlign(Align) andBool At =/=K atomic

    rule <k> typeCheckLoad(Name:SymbolicValueRef, X:SymbolicValueRef, integerType(N:Int),
                     pointerTypeValue(integerType(N:Int), A:K), V2:K,
                           Align:Int, atomic, Mods:Set, Meta:InstructionMetadatas)
              => typeCheckIntArg(Name,pointerTypeValue(integerType(N:Int), A:K), V2)
                 ~> assignType(Name, X, integerType(N:Int)) ...</k>
        <instructionCounter> TheCount:Int => TheCount +Int 1 </instructionCounter>
         <tempBlockInst> Now:List => Now ListItem(TheCount) </tempBlockInst>
         <instNumToBlock> InstMap:Map => InstMap[TheCount <- Name]  </instNumToBlock>
         <instNumInfo> InfoMap:Map => InfoMap[TheCount
                  <- instNumInfo(seqPoint(TheCount,
              assign(X, instruction(load(pointerTypeValue(integerType(N:Int), A:K),
                   V2) ,Mods ,insMetas(formElemList(Meta))))),
                    X, .K, .K, usedLoc(V2),
                 getAllLocalVar(V2) SetItem(usedLoc(V2)), loadInst)]  </instNumInfo>
         requires isValidAlign(Align) andBool N >=Int 8
                  andBool notBool release in Mods
                  andBool notBool acq_rel in Mods

    rule <k> typeCheckLoad(Name:SymbolicValueRef, X:SymbolicValueRef, T:KResult,
                     pointerTypeValue(T:KResult, A:K), V2:K,
                           Align:Int, atomic, Mods:Set, Meta:InstructionMetadatas)
              => typeCheckIntArg(Name,pointerTypeValue(T:KResult, A:K), V2)
                 ~> assignType(Name, X, T:KResult) ...</k>
        <instructionCounter> TheCount:Int => TheCount +Int 1 </instructionCounter>
         <tempBlockInst> Now:List => Now ListItem(TheCount) </tempBlockInst>
         <instNumToBlock> InstMap:Map => InstMap[TheCount <- Name]  </instNumToBlock>
         <instNumInfo> InfoMap:Map => InfoMap[TheCount
                  <- instNumInfo(seqPoint(TheCount,
                  assign(X, instruction(load(pointerTypeValue(T:KResult, A:K),
                   V2) ,Mods ,insMetas(formElemList(Meta))))),
                    X, .K, .K, usedLoc(V2),
                 getAllLocalVar(V2) SetItem(usedLoc(V2)), loadInst)]  </instNumInfo>
         requires isValidAlign(Align) andBool (isFloatType(T) orBool isPointerType(T))
                  andBool notBool release in Mods
                  andBool notBool acq_rel in Mods

    rule <k> typeCheckLoad(Name:SymbolicValueRef, X:K, T:KResult,
                     pointerTypeValue(T:KResult, A:K), V2:K,
                     Align:Int, atomic, _:Set, _:InstructionMetadatas) ~> K:K => .K </k>
         <output>... .List => ListItem("error: atomic load must have simple type that greater than 8 bits.") </output>
         requires notBool isIntegerType(T) andBool notBool isFloatType(T)
                  andBool notBool isPointerType(T)

    rule <k> typeCheckLoad(Name:SymbolicValueRef, X:K, integerType(N:Int),
                     pointerTypeValue(integerType(N:Int), A:K), V2:K,
                      Align:Int, atomic, _:Set, _:InstructionMetadatas) ~> K:K => .K </k>
         <output>... .List => ListItem("error: atomic load must have integer type that greater than 8 bits.") </output>
         requires N <Int 8

    rule <k> typeCheckLoad(Name:SymbolicValueRef, X:K, integerType(N:Int),
                     pointerTypeValue(integerType(N:Int), A:K), V2:K,
                      Align:Int, atomic, Mods:Set, _:InstructionMetadatas) ~> K:K => .K </k>
         <output>... .List => ListItem("error: atomic load cannot use Release ordering.") </output>
         requires release in Mods orBool acq_rel in Mods

    rule <k> typeCheckLoad(Name:SymbolicValueRef, X:K, T:KResult,
                     pointerTypeValue(T':KResult, A:K), V2:K,
                     Align:Int, At:K, _:Set, _:InstructionMetadatas) ~> K:K => .K </k>
         <output>... .List => ListItem("error: stored value and pointer type do not match") </output>
         requires T =/=K T'

    rule <k> typeCheckLoad(Name:SymbolicValueRef, X:K, T:KResult,
                     T':KResult, V2:K, Align:Int,
                     At:K, _:Set, _:InstructionMetadatas) ~> K:K => .K </k>
         <output>... .List => ListItem("error: store operand must be a pointer") </output>
         requires getKLabel(T') =/=KLabel 'pointerTypeValue

    rule <k> typeCheckLoad(Name:SymbolicValueRef, X:K, T:KResult, T':KResult,
                             V:K, Align:Int, At:K, _:Set, _:InstructionMetadatas)
             ~> K:K => .K </k>
         <output>... .List => ListItem("error: alignment is not a power of two") </output>
         requires notBool isValidAlign(Align)

    //deal with type of store
    rule <k> typeCheckStore(Name:SymbolicValueRef, T:KResult, V1:K,
                     pointerTypeValue(T:KResult, A:K), V2:K, Align:Int,
                                      At:K, Mods:Set, Meta:InstructionMetadatas)
              => typeCheckIntArg(Name:SymbolicValueRef, T, V1)
                 ~> typeCheckIntArg(Name:SymbolicValueRef, pointerTypeValue(T:KResult, A:K), V2)
         ...</k>
        <instructionCounter> TheCount:Int => TheCount +Int 1 </instructionCounter>
         <tempBlockInst> Now:List => Now ListItem(TheCount) </tempBlockInst>
         <instNumToBlock> InstMap:Map => InstMap[TheCount <- Name]  </instNumToBlock>
         <instNumInfo> InfoMap:Map => InfoMap[TheCount
                  <- instNumInfo(seqPoint(TheCount,
                  instruction(store(T, V1 ,operand(pointerTypeValue(T:KResult, A:K), V2)),
                       Mods, insMetas(formElemList(Meta)))), .K,
                    .K, usedLoc(V2),.K,
                 getAllLocalVar(V1) getAllLocalVar(V2) SetItem(usedLoc(V2)),
                                                         storeInst)]  </instNumInfo>
         requires isPowOfTwo(Align, 1) andBool At =/=K atomic

    rule <k> typeCheckStore(Name:SymbolicValueRef, T:KResult, V1:K,
                     pointerTypeValue(T:KResult, A:K), V2:K,
                          Align:Int, atomic, Mods:Set, Meta:InstructionMetadatas)
              => typeCheckIntArg(Name:SymbolicValueRef, T:KResult, V1)
                    ~> typeCheckIntArg(Name:SymbolicValueRef, pointerTypeValue(T:KResult, A:K), V2)
         ...</k>
        <instructionCounter> TheCount:Int => TheCount +Int 1 </instructionCounter>
         <tempBlockInst> Now:List => Now ListItem(TheCount) </tempBlockInst>
         <instNumToBlock> InstMap:Map => InstMap[TheCount <- Name]  </instNumToBlock>
         <instNumInfo> InfoMap:Map => InfoMap[TheCount
                  <- instNumInfo(seqPoint(TheCount, instruction(store(T:KResult, V1,
                      operand(pointerTypeValue(T:KResult, A:K), V2)),
                       Mods, insMetas(formElemList(Meta)))), .K,
                    .K, usedLoc(V2),.K,
                 getAllLocalVar(V1) getAllLocalVar(V2) SetItem(usedLoc(V2)),
                 storeInst)]  </instNumInfo>
         requires isValidAlign(Align) andBool (isFloatType(T) orBool isPointerType(T))
                  andBool notBool acquire in Mods
                  andBool notBool acq_rel in Mods

    rule <k> typeCheckStore(Name:SymbolicValueRef, integerType(N:Int), V1:K,
                     pointerTypeValue(integerType(N:Int), A:K), V2:K,
                          Align:Int, atomic, Mods:Set, Meta:InstructionMetadatas)
              => typeCheckIntArg(Name:SymbolicValueRef, integerType(N:Int), V1)
                    ~> typeCheckIntArg(Name:SymbolicValueRef, pointerTypeValue(integerType(N:Int), A:K), V2)
         ...</k>
        <instructionCounter> TheCount:Int => TheCount +Int 1 </instructionCounter>
         <tempBlockInst> Now:List => Now ListItem(TheCount) </tempBlockInst>
         <instNumToBlock> InstMap:Map => InstMap[TheCount <- Name]  </instNumToBlock>
         <instNumInfo> InfoMap:Map => InfoMap[TheCount
                  <- instNumInfo(seqPoint(TheCount, instruction(store(integerType(N:Int), V1,
                      operand(pointerTypeValue(integerType(N:Int), A:K), V2)),
                       Mods, insMetas(formElemList(Meta)))), .K,
                    .K, usedLoc(V2),.K,
                 getAllLocalVar(V1) getAllLocalVar(V2) SetItem(usedLoc(V2)),
                 storeInst)]  </instNumInfo>
         requires isPowOfTwo(Align, 1) andBool N >=Int 8
                  andBool notBool acquire in Mods
                  andBool notBool acq_rel in Mods

    rule <k> typeCheckStore(Name:SymbolicValueRef, T:KResult, V1:K,
                     pointerTypeValue(T:KResult, A:K), V2:K, Align:Int,
                               atomic, _:Set, _:InstructionMetadatas) ~> K:K => .K </k>
         <output>... .List => ListItem("error: atomic store must have simple type that greater than 8 bits.") </output>
         requires notBool isIntegerType(T) andBool notBool isFloatType(T)
                  andBool notBool isPointerType(T)

    rule <k> typeCheckStore(Name:SymbolicValueRef, integerType(N:Int), V1:K,
                     pointerTypeValue(integerType(N:Int), A:K), V2:K, Align:Int,
                                 atomic, _:Set, _:InstructionMetadatas) ~> K:K => .K </k>
         <output>... .List => ListItem("error: atomic store must have integer type that greater than 8 bits.") </output>
         requires N <Int 8

    rule <k> typeCheckStore(Name:SymbolicValueRef, integerType(N:Int), V1:K,
                     pointerTypeValue(integerType(N:Int), A:K), V2:K, Align:Int,
                                 atomic, Mods:Set, _:InstructionMetadatas) ~> K:K => .K </k>
         <output>... .List => ListItem("error: atomic store cannot use Acquire ordering.") </output>
         requires acquire in Mods orBool acq_rel in Mods

    rule <k> typeCheckStore(Name:SymbolicValueRef, T:KResult, V1:K,
                     pointerTypeValue(T':KResult, A:K), V2:K, Align:Int,
                               At:K, _:Set, _:InstructionMetadatas) ~> K:K => .K </k>
         <output>... .List => ListItem("error: stored value and pointer type do not match") </output>
         requires T =/=K T'

    rule <k> typeCheckStore(Name:SymbolicValueRef, T:KResult, V1:K,
             T':KResult, V2:K, Align:Int, At:K, _:Set, _:InstructionMetadatas) ~> K:K => .K </k>
         <output>... .List => ListItem("error: store operand must be a pointer") </output>
         requires getKLabel(T') =/=KLabel 'pointerTypeValue

    rule <k> typeCheckStore(Name:SymbolicValueRef, X:SymbolicValueRef, T:KResult, T':KResult, V:K,
             Align:Int, At:K, _:Set, _:InstructionMetadatas) ~> K:K => .K </k>
         <output>... .List => ListItem("error: alignment is not a power of two") </output>
         requires notBool isPowOfTwo(Align, 1)

    //deal with type of alloca
    rule <k> typeCheckAllocaOp(Name:SymbolicValueRef, X:SymbolicValueRef,
                 T:KResult, integerType(I:Int), V:K, Align:Int,
                 Mods:Set, Meta:InstructionMetadatas)
              => typeCheckIntArg(Name:SymbolicValueRef, integerType(I:Int), V)
                     ~> assignType(Name, X, pointerTypeValue(T, 'addrEmpty(.KList)))
         ...</k>
         <instructionCounter> TheCount:Int => TheCount +Int 1 </instructionCounter>
         <tempBlockInst> Now:List => Now ListItem(TheCount) </tempBlockInst>
         <instNumToBlock> InstMap:Map => InstMap[TheCount <- Name]  </instNumToBlock>
         <instNumInfo> InfoMap:Map => InfoMap[TheCount
                  <- instNumInfo(seqPoint(TheCount,
               assign(X, instruction(alloca(T,preAlloca(integerType(I:Int), V), Align),
                       Mods, insMetas(formElemList(Meta))))), X,
                    usedLoc(X), .K, .K, .Set,
                 allocaInst)]  </instNumInfo>
         requires isValidAlign(Align)

    rule <k> typeCheckAllocaOp(Name:SymbolicValueRef, X:SymbolicValueRef,
                 T:KResult, undef, V:K, Align:Int,
                 Mods:Set, Meta:InstructionMetadatas)
              => assignType(Name, X, pointerTypeValue(T, 'addrEmpty(.KList)))
         ...</k>
         <instructionCounter> TheCount:Int => TheCount +Int 1 </instructionCounter>
         <tempBlockInst> Now:List => Now ListItem(TheCount) </tempBlockInst>
         <instNumToBlock> InstMap:Map => InstMap[TheCount <- Name]  </instNumToBlock>
         <instNumInfo> InfoMap:Map => InfoMap[TheCount
                  <- instNumInfo(seqPoint(TheCount, assign(X, instruction(alloca(T,1, Align),
                       Mods, insMetas(formElemList(Meta))))), X,
                    usedLoc(X), .K, .K, .Set,
                 allocaInst)]  </instNumInfo>
         requires isValidAlign(Align)

    rule <k> typeCheckAllocaOp(Name:SymbolicValueRef, X:SymbolicValueRef,
                T:KResult, T':KResult, V:K, Align:Int, _:Set,
                _:InstructionMetadatas) ~> K:K => .K </k>
         <output>... .List => ListItem("error: element count must have integer type") </output>
         requires getKLabel(T') =/=KLabel 'integerType andBool T'=/=K undef

    rule <k> typeCheckAllocaOp(Name:SymbolicValueRef, X:SymbolicValueRef,
                T:KResult, T':KResult, V:K, Align:Int, _:Set,
                _:InstructionMetadatas) ~> K:K => .K </k>
         <output>... .List => ListItem("error: alignment is not a power of two") </output>
         requires notBool isValidAlign(Align)

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
    rule <k> typeCheckGepOp(Name:SymbolicValueRef, X:SymbolicValueRef,
                                T:KResult, pointerTypeValue(T, A:K), V:K,
                                  L:KResult, Mods:Set, Meta:InstructionMetadatas)
              => typeCheckIntArg(Name, pointerTypeValue(T, A), V)
                  ~> typeCheckGepArgList(Name, L)
                  ~> typeCheckInGepList(getGepType(gepTypeBag(T), L), gepTypeBag(T), L)
                  ~> assignType(Name, X, pointerTypeValue(getGepType(gepTypeBag(T), L), A))
         ...</k>
        <instructionCounter> TheCount:Int => TheCount +Int 1 </instructionCounter>
         <tempBlockInst> Now:List => Now ListItem(TheCount) </tempBlockInst>
         <instNumToBlock> InstMap:Map => InstMap[TheCount <- Name]  </instNumToBlock>
         <instNumInfo> InfoMap:Map => InfoMap[TheCount
                  <- instNumInfo(seqPoint(TheCount, assign(X, instruction(getElementPtr(
                       pointerTypeValue(T, A:K), V, formOperandList(L)), Mods
                          , insMetas(formElemList(Meta))))), X,
                    .K, .K, .K, getAllLocalVar(V) getAllLocalVar(vector(L)),
                 normalInst)]  </instNumInfo>
         requires notBool hasVectorInList(L)

    rule <k> typeCheckGepOp(Name:SymbolicValueRef, X:SymbolicValueRef,
                                T:KResult, pointerTypeValue(T, A:K),
                        V:K, L:KResult, Mods:Set, Meta:InstructionMetadatas)
              => typeCheckIntArg(Name, pointerTypeValue(T, A), V)
                  ~> typeCheckGepArgList(Name, L)
                  ~> typeCheckGepArgListInNum(getVectorNum(L), L)
                  ~> typeCheckInGepList(getGepType(gepTypeBag(T), L), gepTypeBag(T), L)
                  ~> assignType(Name, X, vectorTypeValue(pointerTypeValue(
                                 getGepType(gepTypeBag(T), L), A), getVectorNum(L)))
         ...</k>
        <instructionCounter> TheCount:Int => TheCount +Int 1 </instructionCounter>
         <tempBlockInst> Now:List => Now ListItem(TheCount) </tempBlockInst>
         <instNumToBlock> InstMap:Map => InstMap[TheCount <- Name]  </instNumToBlock>
         <instNumInfo> InfoMap:Map => InfoMap[TheCount
                  <- instNumInfo(seqPoint(TheCount,
                          assign(X, instruction(getElementPtr(vectorTypeValue(
                            pointerTypeValue(T, A:K), getVectorNum(L)),
                            V, fulfillVector(formOperandList(L), getVectorNum(L))), Mods
                          ,insMetas(formElemList(Meta))))), X,
                    .K, .K, .K, getAllLocalVar(V) getAllLocalVar(vector(L)),
                 normalInst)]  </instNumInfo>
         requires hasVectorInList(L) andBool getVectorNum(L) =/=K badType

    rule <k> typeCheckGepOp(Name:SymbolicValueRef, X:SymbolicValueRef, T:KResult,
                 vectorTypeValue(pointerTypeValue(T, A:K), N:K),
                 V:K, L:KResult, Mods:Set, Meta:InstructionMetadatas)
              => typeCheckIntArg(Name,
                       vectorTypeValue(pointerTypeValue(T, A:K), N:K), V)
                  ~> typeCheckGepArgList(Name, L)
                  ~> typeCheckGepArgListInNum(evalToInt(N), L)
                  ~> typeCheckInGepList(getGepType(gepTypeBag(T), L), gepTypeBag(T), L)
                  ~> assignType(Name, X, vectorTypeValue(
                               pointerTypeValue(getGepType(gepTypeBag(T), L), A), N))
          ...</k>
        <instructionCounter> TheCount:Int => TheCount +Int 1 </instructionCounter>
         <tempBlockInst> Now:List => Now ListItem(TheCount) </tempBlockInst>
         <instNumToBlock> InstMap:Map => InstMap[TheCount <- Name]  </instNumToBlock>
         <instNumInfo> InfoMap:Map => InfoMap[TheCount
                  <- instNumInfo(seqPoint(TheCount,
                         assign(X, instruction(getElementPtr(vectorTypeValue(
                            pointerTypeValue(T, A:K), N:K),
                            V, fulfillVector(formOperandList(L), getVectorNum(L))), Mods
                          ,insMetas(formElemList(Meta))))), X,
                    .K, .K, .K, getAllLocalVar(V) getAllLocalVar(vector(L)),
                 normalInst)]  </instNumInfo>

    rule <k> typeCheckGepOp(Name:SymbolicValueRef,
                    X:SymbolicValueRef, T:KResult, pointerTypeValue(T':KResult, A:K),
                      V:K, L:ElemList, _:Set, _:InstructionMetadatas)
             ~> K:K => .K </k>
         <output>... .List => ListItem("error: explicit pointee type doesn't match operand's pointee type") </output>
         requires T =/=K T'

    rule <k> typeCheckGepOp(Name:SymbolicValueRef,
                    X:SymbolicValueRef, T:KResult, vectorTypeValue(pointerTypeValue(T':KResult, A:K), N:K),
                    V:K, L:ElemList, _:Set, _:InstructionMetadatas)
             ~> K:K => .K </k>
         <output>... .List => ListItem("error: explicit pointee type doesn't match operand's pointee type") </output>
         requires T =/=K T'

    rule <k> typeCheckGepOp(Name:SymbolicValueRef, X:SymbolicValueRef, T:KResult,
                                    T':KResult, V:K, L:ElemList, _:Set, _:InstructionMetadatas)
             ~> K:K => .K </k>
         <output>... .List => ListItem("error: base of getelementptr must be a pointer or vector of pointers") </output>
         requires getKLabel(T') =/=KLabel 'pointerTypeValue andBool getKLabel(T') =/=KLabel 'vectorTypeValue

    rule <k> typeCheckGepOp(Name:SymbolicValueRef, X:SymbolicValueRef, T:KResult,
                           vectorTypeValue(T', N:K), V:K, L:ElemList, _:Set, _:InstructionMetadatas)
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

    //check all the incides of vectors have some amount of arguements
    rule typeCheckGepArgListInNum(I:Int, .ElemList) => .K
    rule typeCheckGepArgListInNum(I:Int,
                valValue(typeOperandResult(T:KResult, V:K)),Vs:ElemList)
                  => typeCheckGepArgListInNum(I, Vs)
         requires getKLabel(T) ==KLabel 'pointerTypeValue
    rule typeCheckGepArgListInNum(Num:Int,
                         valValue(typeOperandResult(
                          vectorTypeValue(integerType(I:K), N:K), V:K)),Vs:ElemList)
                  => typeCheckGepArgListInNum(Num, Vs)
         requires Num ==K evalToInt(N)
    rule <k> typeCheckGepArgListInNum(Num:Int,
                         valValue(typeOperandResult(
                          vectorTypeValue(integerType(I:K), N:K), V:K)),Vs:ElemList) ~> K:K => .K </k>
         <output>... .List => ListItem("error: getelementptr vector index has a wrong number of elements") </output>
         requires Num =/=K evalToInt(N)

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

    //deal with cast operators

/*

    rule instValToKItem(trunc Ty1:Type V:ValueRef to Ty2:Type Ins:InstructionMetadatas)
           => instruction(theTrunc(addNameToString(Ty1)
                                   ,addNameToString(V)
                                   ,addNameToString(Ty2))
                          ,.Set
                          ,insMetas(formElemList(Ins)))
*/
    rule <k> typeCheckCastOp(Name:SymbolicValueRef,
                 X:SymbolicValueRef, Op:K, integerType(N:Int),
                    V:K, integerType(N':Int), Meta:InstructionMetadatas)
              => typeCheckIntArg(Name, integerType(N), V)
                 ~> assignType(Name, X, integerType(N'))
         ...</k>
        <instructionCounter> TheCount:Int => TheCount +Int 1 </instructionCounter>
         <tempBlockInst> Now:List => Now ListItem(TheCount) </tempBlockInst>
         <instNumToBlock> InstMap:Map => InstMap[TheCount <- Name]  </instNumToBlock>
         <instNumInfo> InfoMap:Map => InfoMap[TheCount
                  <- instNumInfo(seqPoint(TheCount,
                       assign(X,instruction(getKLabelFromOp(Op)(
                 integerType(N:Int),, V,, integerType(N':Int)), .Set,
                     insMetas(formElemList(Meta))))), X,
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
         <instNumInfo> InfoMap:Map => InfoMap[TheCount
                  <- instNumInfo(seqPoint(TheCount,
                        assign(X,instruction(getKLabelFromOp(Op)(
                 vectorTypeValue(integerType(N:Int), I:Int),,
                 V,, vectorTypeValue(integerType(N':Int), I:Int)),
                 .Set, insMetas(formElemList(Meta))))), X,
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
                  V:K, integerType(N':Int), Meta:InstructionMetadatas)
              => typeCheckIntArg(Name, integerType(N), V)
                   ~> assignType(Name, X, integerType(N')) ...</k>
        <instructionCounter> TheCount:Int => TheCount +Int 1 </instructionCounter>
         <tempBlockInst> Now:List => Now ListItem(TheCount) </tempBlockInst>
         <instNumToBlock> InstMap:Map => InstMap[TheCount <- Name]  </instNumToBlock>
         <instNumInfo> InfoMap:Map => InfoMap[TheCount
                  <- instNumInfo(seqPoint(TheCount,
                         assign(X,instruction(getKLabelFromOp(trunc)(
                 integerType(N:Int),, V,, integerType(N':Int)), .Set,
                     insMetas(formElemList(Meta))))), X,
                    .K, .K, .K, getAllLocalVar(V),
                 normalInst)]  </instNumInfo>
         requires N >Int N'

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
         <instNumInfo> InfoMap:Map => InfoMap[TheCount
                  <- instNumInfo(seqPoint(TheCount,
                  assign(X,instruction(getKLabelFromOp(trunc)(
                 vectorTypeValue(integerType(N:Int), I:Int),,
                 V,, vectorTypeValue(integerType(N':Int), I:Int)),
                 .Set, insMetas(formElemList(Meta))))), X,
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


    //deal with integer ops and logical ops.
    rule <k> typeCheckIntOp(Name:SymbolicValueRef, X:SymbolicValueRef, Op:K,
                 integerType(N:Int), V1:K, V2:K, S:Set, Meta:InstructionMetadatas)
              => typeCheckIntArgs(Name:SymbolicValueRef,
                     integerType(N), val(V1),val(V2),.ElemList)
                 ~> assignType(Name, X, integerType(N:Int)) ...</k>
        <instructionCounter> TheCount:Int => TheCount +Int 1 </instructionCounter>
         <tempBlockInst> Now:List => Now ListItem(TheCount) </tempBlockInst>
         <instNumToBlock> InstMap:Map => InstMap[TheCount <- Name]  </instNumToBlock>
         <instNumInfo> InfoMap:Map => InfoMap[TheCount
                  <- instNumInfo(seqPoint(TheCount,
                        assign(X,instruction(getKLabelFromOp(Op)(
                       integerType(N:Int),, V1,, V2), S,
                     insMetas(formElemList(Meta))))), X,
                    .K, .K, .K, getAllLocalVar(V1) getAllLocalVar(V2),
                 normalInst)]  </instNumInfo>

    rule <k> typeCheckIntOp(Name:SymbolicValueRef, X:SymbolicValueRef, Op:K,
               vectorTypeValue(integerType(N:Int), I:Int),
                          V1:K, V2:K, S:Set, Meta:InstructionMetadatas)
              => typeCheckIntArgs(Name:SymbolicValueRef,
                  vectorTypeValue(integerType(N:Int), I:Int), val(V1),val(V2),.ElemList)
                 ~> assignType(Name, X, vectorTypeValue(integerType(N:Int), I:Int)) ...</k>
        <instructionCounter> TheCount:Int => TheCount +Int 1 </instructionCounter>
         <tempBlockInst> Now:List => Now ListItem(TheCount) </tempBlockInst>
         <instNumToBlock> InstMap:Map => InstMap[TheCount <- Name]  </instNumToBlock>
         <instNumInfo> InfoMap:Map => InfoMap[TheCount
                  <- instNumInfo(seqPoint(TheCount,
                          assign(X,instruction(getKLabelFromOp(Op)(
                   vectorTypeValue(integerType(N:Int), I:Int),, V1,, V2), S,
                     insMetas(formElemList(Meta))))), X,
                    .K, .K, .K, getAllLocalVar(V1) getAllLocalVar(V2),
                 normalInst)]  </instNumInfo>

    rule <k> typeCheckIntOp(Name:SymbolicValueRef, X:SymbolicValueRef, Op:K,
               vectorTypeValue(Ty:KResult, I:Int),
               V1:K, V2:K, S:Set, Meta:InstructionMetadatas) ~> K
              => .K </k>
         <output>... .List => ListItem("error: invalid operand type for instruction") </output>
         requires getKLabel(Ty) =/=KLabel 'integerType

    rule <k> typeCheckIntOp(Name:SymbolicValueRef, X:SymbolicValueRef, Op:K,
                    Ty:KResult, V1:K, V2:K, S:Set, Meta:InstructionMetadatas) ~> K
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
             |-> blockContent(_:List, _:Set, _:Set
                       , Def:Set (.Set => SetItem(operand(T, X))), _:Set, _:Set, _:Set, _:Set) ...</basicBlocks>

    rule typeCheckIntArgs(Name:SymbolicValueRef, T:Type, .ElemList) => .K
    rule typeCheckIntArgs(Name:SymbolicValueRef, T:Type, val(V:K),Vs:ElemList)
                    => typeCheckIntArg(Name:SymbolicValueRef, T, V)
                          ~> typeCheckIntArgs(Name:SymbolicValueRef, T, Vs)

    rule typeCheckIntArg(Name:SymbolicValueRef, T:KResult, undef) => .K
    rule typeCheckIntArg(Name:SymbolicValueRef,
                            T:KResult, zeroinitializer) => .K
    rule typeCheckIntArg(Name:SymbolicValueRef, integerType(N:Int), I:Int) => .K
    rule typeCheckIntArg(Name:SymbolicValueRef, integerType(1), B:Bool) => .K

    rule <k> typeCheckIntArg(Name:SymbolicValueRef, T:K, X:SymbolicValueRef) => .K ...</k>
         <currModule> ModName:SymbolicValueRef </currModule>
         <funModuleName> ModName </funModuleName>
         <currFunction> FunName:SymbolicValueRef </currFunction>
         <functionName> FunName </functionName>
         <varTypes>... addNameToString(X) |-> T:K ...</varTypes>
         <basicBlocks>... Name |-> blockContent(_:List, _:Set, _:Set,
               Def:Set, _:Set, _:Set, _:Set, _:Set) ...</basicBlocks>
         requires operand(T, addNameToString(X)) in Def

    rule <k> typeCheckIntArg(Name:SymbolicValueRef, T:K, X:SymbolicValueRef) => .K ...</k>
         <currModule> ModName:SymbolicValueRef </currModule>
         <funModuleName> ModName </funModuleName>
         <currFunction> FunName:SymbolicValueRef </currFunction>
         <functionName> FunName </functionName>
         <basicBlocks>... Name |-> blockContent(_:List, _:Set, _:Set,
               Def:Set, _:Set, _:Set, Use:Set  (.Set => SetItem(operand(T, addNameToString(X)))), _:Set) ...</basicBlocks>
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
         <basicBlocks>... Name |-> blockContent(_:List, _:Set, _:Set,
               Def:Set, _:Set, _:Set, _:Set, _:Set) ...</basicBlocks>
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
         <basicBlocks>... Name |-> blockContent(_:List, _:Set, _:Set, _:Set,
               _:Set, _:Set, Use:Set  (.Set => SetItem(operand(T, addNameToString(X)))), _:Set) ...</basicBlocks>
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



    //set out edges for a block
    rule setOutEdge(N:K, .ElemList) => .K
    rule <k> setOutEdge(N:K, val(V:SymbolicValueRef),El:ElemList)
                => setOutEdge(N, El) ...</k>
        <currModule> ModName:SymbolicValueRef </currModule>
        <funModuleName> ModName </funModuleName>
        <currFunction> FunName:SymbolicValueRef </currFunction>
        <functionName> FunName </functionName>
         <basicBlocks>... N |-> 
                blockContent(_:List, Out:Set (.Set => SetItem(V)), _:Set,
                                      _:Set, _:Set, _:Set, _:Set, _:Set) ...</basicBlocks>

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
                blockContent(_:List, Out:Set, _:Set,
                            _:Set, _:Set, _:Set, _:Set, _:Set) ...</basicBlocks>

    rule setInEdgesForNode(A:K, .K, .Set) => .K
    rule setInEdgesForNode(A:K, .K, SetItem(B:K) S:Set) => setInEdgesForNode(A, B, S)
    rule <k> setInEdgesForNode(A:K,B:K, S:Set) => setInEdgesForNode(A, .K, S) ...</k>
        <currModule> ModName:SymbolicValueRef </currModule>
        <funModuleName> ModName </funModuleName>
        <currFunction> FunName:SymbolicValueRef </currFunction>
        <functionName> FunName </functionName>
         <basicBlocks>... B |-> 
              blockContent(_:List, _:Set, In:Set (.Set => SetItem(A)),
                                        _:Set, _:Set, _:Set, _:Set, _:Set) ...</basicBlocks>

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
                   blockContent(K:List, Out:Set, In:Set,
                            Def:Set, _:Set, _:Set, Use:Set, _:Set), S:Set, _:Set)
         => checkUseVars(L, .K, S)
         requires Use -Set S <=Set .Set

    rule <k> checkUseVars(L:List,
                  blockContent(K:List, Out:Set, In:Set, Def:Set,
                                        InDef:Set, UsePhi:Set, Use:Set, InTheUse:Set), S:Set, InUse:Set)
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
              blockContent(_:List, _:Set, _:Set, Def:Set,
                                  _:Set, _:Set, _:Set, _:Set) ...</basicBlocks>
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
              blockContent(_:List, _:Set, S':Set, Def:Set, _:Set,
                                          _:Set, _:Set, _:Set) ...</basicBlocks>
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
              blockContent(_:List, _:Set, In:Set,
                                     Def:Set, _:Set, _:Set, _:Set, _:Set) ...</basicBlocks>
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
                              blockContent(K:K, Out:Set, In:Set,
                                        Def:Set, _:Set, UsePhi:Set, _:Set, _:Set), Arg:Set)
         => checkUseVarInPhi(S, .K, Arg)
         requires UsePhi -Set Arg <=Set .Set

    rule <k> checkUseVarInPhi(S:List,
                     blockContent(K:K, Out:Set, In:Set,
                                      Def:Set, _:Set, UsePhi:Set, Use:Set, InUse:Set), Arg:Set)
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
              blockContent(_:List, _:Set, _:Set,
                                     Def:Set, _:Set, _:Set, _:Set, _:Set) ...</basicBlocks>
         requires UsePhi <=Set Def

    rule <allCurrentJob> checkUseVarInPhi(A:K, S':Set, UsePhi:Set)
               => checkUseVarInPhi(.K, S' (In -Set (S SetItem(A))), UsePhi -Set Def) </allCurrentJob>
         <allCheckedBlocks> S:Set (.Set => SetItem(A)) </allCheckedBlocks>
         <currModule> ModName:SymbolicValueRef </currModule>
         <funModuleName> ModName </funModuleName>
         <currFunction> FunName:SymbolicValueRef </currFunction>
         <functionName> FunName </functionName>
         <basicBlocks>... A |-> 
              blockContent(_:List, _:Set, In:Set,
                         Def:Set, _:Set, _:Set, _:Set, _:Set) ...</basicBlocks>
         requires notBool (UsePhi <=Set Def) andBool A =/=K .K


    //ensure the static single assignment property in a function.
    //and normalize the llvm operators to abstract syntax.

    syntax KItem ::= checkSingleAssignment(K)
                   | checkSingleAssignmentInBlock(SymbolicValueRef, K, Bool) //name, tocheck, stores, is-phi-allow

    //in the checkSingleAssignment and checkSingleAssignmentInBlock
    //to add addNameToString to every positioins where show Type and ValueRef
    //for example the third rule

    //form a basicBlock finally.
    rule <k> checkSingleAssignmentInBlock(N:SymbolicValueRef, .K, _:Bool)
             => .K ...</k>
        <currModule> ModName:SymbolicValueRef </currModule>
        <funModuleName> ModName </funModuleName>
        <currFunction> FunName:SymbolicValueRef </currFunction>
        <functionName> FunName </functionName>
        <tempBlockInst> K:List => .List </tempBlockInst>
        <basicBlocks>... N |-> blockContent((_:List => K),
                       _:Set, _:Set, _:Set, _:Set, _:Set, _:Set, _:Set) ...</basicBlocks>

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
             ~> setOutEdge(N, getOutEdges(La1)) ~> setOutEdge(N, getOutEdges(La2))
             ~> checkSingleAssignmentInBlock(N, .K, false)

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
             ~> setOutEdge(N, val(addNameToString(La)))
                 ~> setOutEdge(N, getOutEdges(Ju))
             ~> checkSingleAssignmentInBlock(N, .K, false)

    rule <k> checkSingleAssignmentInBlock(N:SymbolicValueRef, unreachable
                                  Meta:InstructionMetadatas, _:Bool)
         => checkSingleAssignmentInBlock(N, .K, false) ...</k>
        <instructionCounter> TheCount:Int => TheCount +Int 1 </instructionCounter>
         <tempBlockInst> Now:List => Now ListItem(TheCount) </tempBlockInst>
         <instNumToBlock> InstMap:Map => InstMap[TheCount <- N]  </instNumToBlock>
         <instNumInfo> InfoMap:Map => InfoMap[TheCount
                  <- instNumInfo(seqPoint(TheCount,
                instruction(unreachable,.Set,insMetas(formElemList(Meta)))), .K,
                    .K, .K, .K, .Set,
                 terminators)]  </instNumInfo>

    rule <k>checkSingleAssignmentInBlock(N:SymbolicValueRef, invoke Opc:OptCallingConv Re:RetAttrs
                                       Ty:Type Va:ValueRef (Pa:ParamList) Fu:FuncAttrs
                                       to La1:LabelValue unwind La2:LabelValue 
                                  Meta:InstructionMetadatas, _:Bool)
         => typeCheckOp(N, name(localVar, Int2String(I)), invoke Opc:OptCallingConv Re:RetAttrs
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
         when (Var in keys(M))

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

    rule <k> checkingPhisInEdges ...</k>
         <matchPhisWithInEdges> ListItem(phiEdges(A:K, S:Set)) => .List ...</matchPhisWithInEdges>
        <currModule> ModName:SymbolicValueRef </currModule>
        <funModuleName> ModName </funModuleName>
         <basicBlocks>... A |->
                 blockContent(_:List, _:Set, In:Set,
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
                 blockContent(_:List, _:Set, In:Set, 
                           _:Set, _:Set, _:Set, _:Set, _:Set) ...</basicBlocks>
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
                 blockContent(_:List, _:Set, _:Set, Def:Set
                    (.Set => SetItem(operand(T, V))), _:Set, _:Set, _:Set, _:Set) ...</basicBlocks>
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
                 blockContent(_:List, _:Set, _:Set, Def:Set
                    (.Set => SetItem(operand(T, V))), _:Set, _:Set, _:Set, _:Set) ...</basicBlocks>
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
                 blockContent(_:List, _:Set, _:Set,
                               Def:Set, _:Set, _:Set, _:Set, _:Set) ...</basicBlocks>
        requires operand(T, V) in Def

    //define the incomming defs for each basic block.
    rule setBlockInDefs(.K, .Set) => .K
    rule setBlockInDefs(.K, SetItem(Name:K) S:Set)
              => setBlockInDefs(Name, S)

    rule <k> setBlockInDefs(Name:KItem, S:Set) 
              => setBlockInDef(Name, L) ~> setBlockInDefs(emptyHOLE, S)...</k>
         <currModule> ModName:SymbolicValueRef </currModule>
         <funModuleName> ModName </funModuleName>
         <blockPathMap>... Name |-> blockPath(L:List) ...</blockPathMap>
         <currFunction> FunName:SymbolicValueRef </currFunction>
         <functionName> FunName </functionName>
         requires Name =/=K emptyHOLE

    rule setBlockInDef(Name, .List) ~> setBlockInDefs(emptyHOLE, S)
            => setBlockInDefs(.K, S)
    rule setBlockInDef(Name, ListItem(blockPath(.List)) L:List)
              => setBlockInDef(Name, L)
    rule <k> setBlockInDef(Name, ListItem(blockPath
                     ((ListItem(A:KItem) => .List) Path:List)) L:List) ...</k>
         <currModule> ModName:SymbolicValueRef </currModule>
         <funModuleName> ModName </funModuleName>
         <basicBlocks>... A |->
                 blockContent(_:List, _:Set, _:Set, Def:Set
                           , (InDef:Set => Def InDef), _:Set, _:Set, _:Set) ...</basicBlocks>
         <currFunction> FunName:SymbolicValueRef </currFunction>
         <functionName> FunName </functionName>

    //define the incomming uses for each basic block.
    rule setBlockInUses(.K, .Set) => .K
    rule setBlockInUses(.K, SetItem(Name:K) S:Set)
              => setBlockInUses(Name, S)

    rule <k> setBlockInUses(Name:KItem, S:Set) 
              => setBlockInUse(Name, L) ~> setBlockInUses(emptyHOLE, S)...</k>
         <currModule> ModName:SymbolicValueRef </currModule>
         <funModuleName> ModName </funModuleName>
         <blockPathMap>... Name |-> blockPath(L:List) ...</blockPathMap>
         <currFunction> FunName:SymbolicValueRef </currFunction>
         <functionName> FunName </functionName>
         requires Name =/=K emptyHOLE

    rule setBlockInUse(Name, .List) ~> setBlockInUses(emptyHOLE, S)
            => setBlockInUses(.K, S)
    rule setBlockInUse(Name, ListItem(blockPath(.List)) L:List)
              => setBlockInUse(Name, L)
    rule <k> setBlockInUse(Name, ListItem(blockPath
                     ((ListItem(A:KItem) => .List) Path:List)) L:List) ...</k>
         <currModule> ModName:SymbolicValueRef </currModule>
         <funModuleName> ModName </funModuleName>
         <basicBlocks>... A |->
                 blockContent(_:List, _:Set, _:Set, _:Set
                           , _:Set, PhiUse:Set, Use:Set,
                             (InUse:Set => InUse PhiUse Use)) ...</basicBlocks>
         <currFunction> FunName:SymbolicValueRef </currFunction>
         <functionName> FunName </functionName>

    //define a relation to create block paths map to get max reachable path for each block
    rule setBlockPaths(.K, .Set) => .K
    rule setBlockPaths(.K, SetItem(Name:K) S:Set) => setBlockPaths(Name, S)
    rule <k> setBlockPaths(Name:KItem, S:Set)
             => setBlockPath(Name, Name, Out, .Set,
                     ListItem(blockPath(ListItem(Name))), .List, .List, .Set)
                                 ~> setBlockPaths(emptyHOLE, S) ...</k>
         <currModule> ModName:SymbolicValueRef </currModule>
         <funModuleName> ModName </funModuleName>
         <basicBlocks>... Name |->
              blockContent(_:List, Out:Set, _:Set,
                            _:Set, _:Set, _:Set, _:Set, _:Set) </basicBlocks>
         <currFunction> FunName:SymbolicValueRef </currFunction>
         <functionName> FunName </functionName>
         requires Name =/=K emptyHOLE

    rule <k> setBlockPath(Name:K, V:KItem, .Set, .Set, L':List, LStore:List,
                     L:List, Visited:Set)
                 ~> setBlockPaths(emptyHOLE, S:Set)
                               => setBlockPaths(.K, S) ...</k>
         <currModule> ModName:SymbolicValueRef </currModule>
         <funModuleName> ModName </funModuleName>
         <blockPathMap> M:Map => M[Name <- blockPath(L)] </blockPathMap>
         <currFunction> FunName:SymbolicValueRef </currFunction>
         <functionName> FunName </functionName>
         requires V =/=K emptyHOLE andBool size(L) =/=K 0

    rule <k> setBlockPath(Name:K, V:KItem, .Set, .Set, L':List, LStore:List,
                     .List, Visited:Set)
                 ~> setBlockPaths(emptyHOLE, S:Set)
                               => setBlockPaths(.K, S) ...</k>
         <currModule> ModName:SymbolicValueRef </currModule>
         <funModuleName> ModName </funModuleName>
         <blockPathMap> M:Map => M[Name <- blockPath(LStore)] </blockPathMap>
         <currFunction> FunName:SymbolicValueRef </currFunction>
         <functionName> FunName </functionName>
         requires V =/=K emptyHOLE

    rule <k> setBlockPath(Name:KItem, V:KItem, .Set,
                     SetItem(A:KItem) Vs:Set, OldL:List, L':List, L:List, Visited:Set)
            => setBlockPath(V, A, Out, .Set, L':List, .List, .List, .Set)
               ~> setBlockPath(Name, emptyHOLE, .Set, Vs,OldL, L', L, SetItem(A) Visited)
         ...</k>
         <currModule> ModName:SymbolicValueRef </currModule>
         <funModuleName> ModName </funModuleName>
         <basicBlocks>... V |->
              blockContent(_:List, Out:Set, _:Set,
                                _:Set, _:Set, _:Set, _:Set, _:Set) </basicBlocks>
         <currFunction> FunName:SymbolicValueRef </currFunction>
         <functionName> FunName </functionName>
         requires V =/=K emptyHOLE

    rule <k> setBlockPath(V:KItem, A:KItem, .Set, .Set, OldL:List, L':List, L:List, Visited:Set)
               ~> setBlockPath(Name, emptyHOLE, .Set, Vs:Set,OldL':List, TemL:List, L1:List, Visited':Set)
            => setBlockPath(Name, V, .Set, Vs,OldL', TemL:List, mergeList(L, L1), Visited')
         ...</k>
         <currModule> ModName:SymbolicValueRef </currModule>
         <funModuleName> ModName </funModuleName>
         <basicBlocks>... V |->
              blockContent(_:List, Out:Set, _:Set,
                                   _:Set, _:Set, _:Set, _:Set, _:Set) </basicBlocks>
         <currFunction> FunName:SymbolicValueRef </currFunction>
         <functionName> FunName </functionName>
         requires A =/=K emptyHOLE andBool notBool size(L) =/=K 0

    rule <k> setBlockPath(V:KItem, A:KItem, .Set, .Set, OldL:List, L':List, .List, Visited:Set)
               ~> setBlockPath(Name, emptyHOLE, .Set, Vs:Set,OldL':List, TemL:List, L1:List, Visited':Set)
            => setBlockPath(Name, V, .Set, Vs,OldL', TemL:List, mergeList(L', L1), Visited')
         ...</k>
         <currModule> ModName:SymbolicValueRef </currModule>
         <funModuleName> ModName </funModuleName>
         <basicBlocks>... V |->
              blockContent(_:List, Out:Set, _:Set,
                                    _:Set, _:Set, _:Set, _:Set, _:Set) </basicBlocks>
         <currFunction> FunName:SymbolicValueRef </currFunction>
         <functionName> FunName </functionName>
         requires A =/=K emptyHOLE

    rule setBlockPath(Name:KItem, V:KItem, SetItem(A:K) Ms:Set,
                                   Vs, L:List, L1:List, LStore:List, Visited:Set)
            => setBlockPath(Name, V, Ms, Vs SetItem(A),
                            L, mergeList(addElemToList(A, L), L1), LStore, Visited)
          requires V =/=K emptyHOLE

    //define checkSingleAssignment
    //bugs and ambiguity in the LLVM document about the numbered label value
    rule <k> checkSingleAssignment(.K)
               => setInEdges(keys(M))
                  ~> setBlockPaths(.K, keys(M))
                  ~> setBlockInDefs(.K, keys(M))
                  ~> setBlockInUses(.K, keys(M))
                  ~> checkingPhisInEdges
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
              ~> checkSingleAssignmentInBlock(addNameToString(L),Ins BB, true)
           ~> checkSingleAssignment(BBL) ...</k>
        <currModule> ModName:SymbolicValueRef </currModule>
        <funModuleName> ModName </funModuleName>
         <basicBlocks> M':Map (.Map  => addNameToString(L)
              |-> blockContent(.List, .Set, .Set,
                  SetItem(operand(label, addNameToString(L))), .Set, .Set, .Set, .Set)) </basicBlocks>
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
              ~> checkSingleAssignmentInBlock(addNameToString(L),Ins BB, true)
           ~> checkSingleAssignment(BBL) ...</k>
        <currModule> ModName:SymbolicValueRef </currModule>
        <funModuleName> ModName </funModuleName>
        <currFunction> FunName:SymbolicValueRef </currFunction>
        <functionName> FunName </functionName>
        <formalParameters> arguments(Args:ElemList) </formalParameters>
         <localFunVarCounter> I:Int => I +Int 1 </localFunVarCounter>
         <basicBlocks> M':Map (.Map  => addNameToString(L)
                         |-> blockContent(.List, .Set, .Set,
                      SetItem(operand(label, addNameToString(L))), .Set, .Set, .Set, .Set)) </basicBlocks>
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
              ~> checkSingleAssignmentInBlock(addNameToString(L),Ins BB, true)
                 ~> checkSingleAssignment(.K) ...</k>
        <currModule> ModName:SymbolicValueRef </currModule>
        <funModuleName> ModName </funModuleName>
        <currFunction> FunName:SymbolicValueRef </currFunction>
        <functionName> FunName </functionName>
        <formalParameters> arguments(Args:ElemList) </formalParameters>
         <basicBlocks> M':Map (.Map  => addNameToString(L)
                         |-> blockContent(.List, .Set, .Set,
               SetItem(operand(label, addNameToString(L))), .Set, .Set, .Set, .Set)) </basicBlocks>
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
              ~> checkSingleAssignmentInBlock(addNameToString(L),Ins BB, true)
                  ~> checkSingleAssignment(.K) ...</k>
        <currModule> ModName:SymbolicValueRef </currModule>
        <funModuleName> ModName </funModuleName>
        <formalParameters> arguments(Args:ElemList) </formalParameters>
        <currFunction> FunName:SymbolicValueRef </currFunction>
        <functionName> FunName </functionName>
         <basicBlocks> M':Map (.Map  => addNameToString(L)
                         |-> blockContent(.List, .Set, .Set,
                        SetItem(operand(label, addNameToString(L))), .Set, .Set, .Set, .Set)) </basicBlocks>
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
              ~> checkSingleAssignmentInBlock(name(localVar, Int2String(I)), Ins BB, true)
           ~> checkSingleAssignment(BBL)
         ...</k>
        <currModule> ModName:SymbolicValueRef </currModule>
        <funModuleName> ModName </funModuleName>
        <formalParameters> arguments(Args:ElemList) </formalParameters>
        <currFunction> FunName:SymbolicValueRef </currFunction>
        <functionName> FunName </functionName>
         <basicBlocks> M':Map (.Map  => name(localVar, Int2String(I))
                  |-> blockContent(.List, .Set, .Set,
                  SetItem(operand(label, name(localVar, Int2String(I)))),.Set, .Set, .Set, .Set)) </basicBlocks>
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
              ~> checkSingleAssignmentInBlock(name(localVar, Int2String(I)), Ins BB, true)
              ~> checkSingleAssignment(.K)
         ...</k>
        <currModule> ModName:SymbolicValueRef </currModule>
        <funModuleName> ModName </funModuleName>
        <currFunction> FunName:SymbolicValueRef </currFunction>
        <functionName> FunName </functionName>
        <formalParameters> arguments(Args:ElemList) </formalParameters>
         <basicBlocks> M':Map (.Map  => name(localVar, Int2String(I))
                |-> blockContent(.List, .Set, .Set,
                SetItem(operand(label, name(localVar, Int2String(I)))), .Set, .Set, .Set, .Set)) </basicBlocks>
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
