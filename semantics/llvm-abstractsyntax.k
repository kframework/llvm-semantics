//
requires "llvm-syntax.k"

module LLVM-ABSTRACTSYNTAX
    imports LLVM-SYNTAX

    syntax KResult ::= Int | String //| Floating
                      | Loc
                      //| listK(List)    [latex({#1})]//bytes
                      | region(List, Int)  //nextlevel, number of nextlevel
                      | VoidType
                      | vectorValue(ElemList)
                      | arrayValue(ElemList)
                      | addrSpaceResult(Int)
                      | blockAddVal(K, K)

    syntax SimpleTypeResult ::= IntTypeCore
                              | pointerTypeValue(K, K) //type, address space
                              | FPType
                              | X86Type
                              | LabelType
                              | OpaqueType
    syntax AggregatedTypeResult ::= structTypeValue(K)
                                  | packedStructTypeValue(K)
                                  | arrayTypeValue(K, K)  // inner type, length
                                  | functionTypeValue(K, K)  // return type, argument types
                                  | vectorTypeValue(K, K)//inner type, length
    syntax TypeResult ::= AggregatedTypeResult | SimpleTypeResult
    syntax NonVoidType ::= TypeResult

    //syntax TypeResult ::= memTypeNum(K, Int) //mem_type, number
    //syntax TypeResult ::= memTypeValue(K, K) //inrange? type
    syntax Type ::= TypeResult
    syntax Type ::= "badType"
    syntax KResult ::= "badValue"
    syntax KResult ::= "skipValue"
    syntax KItem ::= "none"
    syntax KResult ::= "vaListType"
    rule 'vaArgs(.KList) => vaListType

    syntax KItem ::= vaListCal(K, K, K) [strict]//type, loc, value
    syntax KResult ::= TypeResult
    syntax KResult ::= value(K, K) //type, value
    syntax KResult ::= flagType(K, K) //flags, type
    syntax Element ::= val(K) [strict]
    syntax ElementResult ::= valValue(K)
    syntax Element ::= ElementResult
    syntax KResult ::= ElementResult
    rule val(K:KResult) => valValue(K) [structural]

    syntax KItem ::= "emptyHOLE"
    syntax KItem ::= instNumInfo(Int, K, K)
                      //Inst num, stmt, inst type
    

    syntax KItem ::= "terminators" | "loadInst" | "storeInst"
                    | "fenceInst" | "readWriteInst"
                    | "callInst" | "normalInst" | "returnInst"
                    | "allocaInst" | "phiInst" | "vaInst"
    syntax KItem ::= usedLoc(K) //location of a variable.

    syntax KItem ::= seqPoint(Int, Int, K)
                        //block_id, static id, inst
    syntax KItem ::= basicBlockNum(Int, K)
    syntax KItem ::= guessBlockPath(List)

    //syntax KItem ::= ElemList
    syntax ElemList ::= List{Element,","} [strict]
    syntax Int ::= lengthOfList(ElemList) [function]

    rule lengthOfList(.ElemList) => 0
    rule lengthOfList(val(K:K),L:ElemList) => 1 +Int lengthOfList(L)
    rule lengthOfList(valValue(K:K),L:ElemList) => 1 +Int lengthOfList(L)

    syntax Int ::= lengthOfTypeList(TypeList) [function]
    rule lengthOfTypeList(.TypeList) => 0
    rule lengthOfTypeList(T:Type, Ts:TypeList) => 1 +Int lengthOfTypeList(Ts)

    syntax KItem ::= elemListToK(ElemList) [function]

    rule elemListToK(.ElemList) => .K
    rule elemListToK(val(K:K), L:ElemList) => K ~> elemListToK(L)
    rule elemListToK(valValue(K:K), L:ElemList) => K ~> elemListToK(L)

    syntax KItem ::= instructionListToK(InstructionList) [function]

    rule instructionListToK(.InstructionList) => .K
    rule instructionListToK(K:Instruction L:Instruction)
                             => K ~> instructionListToK(L)

    syntax List ::= elemListToList(ElemList) [function]

    rule elemListToList(.ElemList) => .List
    rule elemListToList(valValue(K:K), L:ElemList) => ListItem(K) elemListToList(L)
    rule elemListToList(val(K:K), L:ElemList) => ListItem(K) elemListToList(L)

    //parsing string in LLVM to byte list
    syntax KItem ::= doubleList(RetAttrs, FuncAttrs)

    syntax List ::= stringToCharList(String, Int) [function]
    rule stringToCharList(S:String, N:Int) => .List
         requires N ==Int lengthString(S)
    rule stringToCharList(S:String, N:Int)
              => ListItem(ordChar(substrString(S, N, N +Int 1))) stringToCharList(S, N +Int 1)
         requires N <Int lengthString(S)

    syntax Bool ::= isValidCharHex(Int) [function]
    rule isValidCharHex(A:Int) => true
         requires (A >=Int 48 andBool A <=Int 57)
             orBool (A >=Int 97 andBool A <=Int 102)
             orBool (A >=Int 65 andBool A <=Int 70)
    rule isValidCharHex(A:Int) => false [owise]

    syntax Int ::= hexCharToInt(Int) [function]
    rule hexCharToInt(A:Int) => A -Int 48
          requires (A >=Int 48 andBool A <=Int 57)
    rule hexCharToInt(A:Int) => 10
          requires A ==K 97 orBool A ==K 65
    rule hexCharToInt(A:Int) => 11
          requires A ==K 98 orBool A ==K 66
    rule hexCharToInt(A:Int) => 12
          requires A ==K 99 orBool A ==K 67
    rule hexCharToInt(A:Int) => 13
          requires A ==K 100 orBool A ==K 68
    rule hexCharToInt(A:Int) => 14
          requires A ==K 101 orBool A ==K 69
    rule hexCharToInt(A:Int) => 15
          requires A ==K 102 orBool A ==K 70

    syntax Int ::= makeLowerCase(Int) [function]
    rule makeLowerCase(A:Int) => A +Int 32
         requires (A >=Int 65 andBool A <=Int 90)
    rule makeLowerCase(A:Int) => A [owise]

    syntax KItem ::= findSlashList(List)  [function]
    rule findSlashList(.List) => badValue
    rule findSlashList(ListItem(92) L:List) => charListResult(ListItem(92), L)
    rule findSlashList(ListItem(110) L:List) => charListResult(ListItem(10), L)
    rule findSlashList(ListItem(34) L:List) => charListResult(ListItem(34), L)
    rule findSlashList(ListItem(116) L:List) => charListResult(ListItem(9), L)
    rule findSlashList(ListItem(114) L:List) => charListResult(ListItem(13), L)
    rule findSlashList(ListItem(A:Int) ListItem(B:Int) L:List)
                  => charListResult(ListItem(hexCharToInt(A) *Int 16 +Int hexCharToInt(B)), L)
         requires isValidCharHex(A) andBool isValidCharHex(B)
    rule findSlashList(L:List) => badValue [owise]

    syntax List ::= charListFilter(List)  [function]
                  | charListFilterAux(K)  [function]
    rule charListFilter(.List) => .List
    rule charListFilter(ListItem(X:Int) L:List)
           => ListItem(X) charListFilter(L)
         requires X =/=Int 92
    rule charListFilter(ListItem(92) L:List)
          => charListFilterAux(findSlashList(L))
    rule charListFilterAux(badValue) => ListItem(badValue)
    rule charListFilterAux(charListResult(L:List, L':List))
                => L charListFilter(L')

    syntax ElemList ::= parseCharListToOperands(List) [function]
    rule parseCharListToOperands(.List) => .ElemList
    rule parseCharListToOperands(ListItem(A:Int) L:List)
          => val(operand(integerType(8), A)), parseCharListToOperands(L)

    syntax ElemList ::= parseStringToList(StringName) [function]
    rule parseStringToList(X:StringName) => 
              parseCharListToOperands(charListFilter(stringToCharList(
              substrString(#tokenToString(X), 1, lengthString(#tokenToString(X)) -Int 1),0)))

    //parse concrete var to AST var
    syntax KItem ::= addNameToString(K) [function]

    rule addNameToString(Var:LocalName) => name(localVar, substrString(#tokenToString(Var),1
                          ,lengthString(#tokenToString(Var))))
    rule addNameToString(Var:GlobalName) => name(globalVar, substrString(#tokenToString(Var),1
                          ,lengthString(#tokenToString(Var))))
    rule addNameToString(Var:LabelStringConstant) => name(localVar, substrString(#tokenToString(Var),0
                          ,lengthString(#tokenToString(Var)) -Int 1))
    rule addNameToString(< R:ReturnedVal >) => vector(formElemList(R))
    rule addNameToString([ R:ReturnedVal ]) => array(formElemList(R))
    rule addNameToString({ R:ReturnedVal }) => constantStruct(formElemList(R))
    rule addNameToString(< { R:ReturnedVal } >) => packedStruct(formElemList(R))
    rule addNameToString('constCast(C:CastOps,, T1:Type V:ValueRef,, T2:Type))
            => constCastAST(C, T1, addNameToString(V), T2)
    rule addNameToString('constBin(C:BinaryOps,,
                      T1:Type V1:ValueRef,, T2:Type V2:ValueRef))
            => constBinAST(C, T1, addNameToString(V1), T2, addNameToString(V2))
    rule addNameToString('constLogic(C:LogicalOps,,
                      T1:Type V1:ValueRef,, T2:Type V2:ValueRef))
            => constLogicAST(C, T1, addNameToString(V1), T2, addNameToString(V2))
    rule addNameToString('constBlock(V1:ValueRef,, V2:ValueRef))
            => blockAddAST(addNameToString(V1), addNameToString(V2))
    rule addNameToString('constIcmp(C:IPredicate,,
                      T1:Type V1:ValueRef,, T2:Type V2:ValueRef))
            => constIcmpAST(C, T1, addNameToString(V1), T2, addNameToString(V2))
    rule addNameToString('constFcmp(C:FPredicate,,
                      T1:Type V1:ValueRef,, T2:Type V2:ValueRef))
            => constFcmpAST(C, T1, addNameToString(V1), T2, addNameToString(V2))
    rule addNameToString('constExtract(T1:Type V1:ValueRef,, C:ConstantIndexList))
            => constExValueAST(T1, addNameToString(V1), formElemList(C))
    rule addNameToString('constInsert(T1:Type V1:ValueRef,,
                           T2:Type V2:ValueRef,, C:ConstantIndexList))
            => constInValueAST(T1, addNameToString(V1),
                                   T2, addNameToString(V2), formElemList(C))
    rule addNameToString('constShuffle(T1:Type V1:ValueRef,,
                           T2:Type V2:ValueRef,, T3:Type V3:ValueRef))
            => constSuffleAST(T1, addNameToString(V1),
                        T2, addNameToString(V2), T3, addNameToString(V3))
    rule addNameToString('constGep(F:OptInBounds,, T:Type,, R:ReturnedVal))
            => constGepAST(F, T, formElemList(R))
    rule addNameToString('constSelect(Op:Select,, T1:Type V1:ValueRef,,
                           T2:Type V2:ValueRef,, T3:Type V3:ValueRef))
            => constSelectAST(T1, addNameToString(V1),
                        T2, addNameToString(V2), T3, addNameToString(V3))
    rule addNameToString('constExElem(T1:Type V1:ValueRef,, T2:Type V2:ValueRef))
            => constExElemAST(T1, addNameToString(V1), T2, addNameToString(V2))
    rule addNameToString('constInsertElem(T1:Type V1:ValueRef,,
                           T2:Type V2:ValueRef,, T3:Type V3:ValueRef))
            => constInElemAST(T1, addNameToString(V1),
                        T2, addNameToString(V2), T3, addNameToString(V3))
    rule addNameToString(c S:StringName) => array(parseStringToList(S))
    rule addNameToString(K:K) => K [owise]

    syntax ElemList ::= getAllTypes(K)   [function]
    rule getAllTypes(.ParamList) => .ElemList
    rule getAllTypes(T:Type _:ParamAttrs _:ValueRef, Pl:ParamList)
                   => val(T), getAllTypes(Pl)
    rule getAllTypes(.ElemList) => .ElemList
    rule getAllTypes(valValue(typedArg(A:Set, B:K, C:K)), Pl:ElemList)
                   => valValue(B), getAllTypes(Pl)
    rule getAllTypes(valValue(vaListType), Pl:ElemList)
                   => valValue(vaListType), getAllTypes(Pl)

    //useful function to turn a kitem into an elemList
    //here: add addNameToString to every position where it has type or valueref
    syntax TypeList ::= formTypeList(ElemList) [function]
    rule formTypeList(.ElemList) => .TypeList
    rule formTypeList(valValue(A:TypeResult), Es:ElemList)
            => A, formTypeList(Es)

    syntax ElemList ::= formElemList(K) [function]

    rule formElemList('.InstructionMetadatas(.KList)) => .ElemList
    rule formElemList(, Mv:MetadataVar Mi:MetadataValueInt Ins:InstructionMetadatas)
              => val(Mv Mi),formElemList(Ins)
    rule formElemList(, Mv:MetadataVar ! { In:MetadataValues } Ins:InstructionMetadatas)
              => val(Mv ! { In }),formElemList(Ins)
    rule formElemList(.LabelValues) => .ElemList
    rule formElemList(label Va:ValueRef, Ls:LabelValues)
                    => val(addNameToString(Va)),formElemList(Ls)
    rule formElemList(doubleList(.RetAttrs,.FuncAttrs)) => .ElemList
    rule formElemList(doubleList(.RetAttrs,F:FuncAttr Fs:FuncAttrs))
            => val(F),formElemList(doubleList(.RetAttrs,Fs))
    rule formElemList(doubleList(R:RetAttr Rs:RetAttrs,Fs:FuncAttrs))
            => val(R),formElemList(doubleList(Rs,Fs))
    rule formElemList(.ParamList) => .ElemList
    rule formElemList(Ty:Type Pa:ParamAttrs Va:ValueRef, Pl:ParamList)
            => val(arg(formSet(Pa),
                     addNameToString(Ty),addNameToString(Va))),formElemList(Pl)
    rule formElemList(.ParamAttrs) => .ElemList
    rule formElemList(Pa:ParamAttr Ps:ParamAttrs) => val(Pa),formElemList(Ps)
    rule formElemList(A:Align) => val(A)
    rule formElemList(nsw) => val(nsw)
    rule formElemList(nuw) => val(nuw)
    rule formElemList(nsw nuw) => val(nsw),val(nuw)
    rule formElemList(nuw nsw) => val(nsw),val(nuw)
    rule formElemList('nwEmpty(.KList)) => .ElemList
    rule formElemList(.FastMathFlags) => .ElemList
    //here | Done
    //do the same as fast for "nnan" | "ninf" | "nsz" | "arcp"
    rule formElemList(fast Fl:FastMathFlags) => val(fast),formElemList(Fl)
    rule formElemList(nnan Fl:FastMathFlags) => val(nnan),formElemList(Fl)
    rule formElemList(ninf Fl:FastMathFlags) => val(ninf),formElemList(Fl)
    rule formElemList(nsz Fl:FastMathFlags) => val(nsz),formElemList(Fl)
    rule formElemList(arcp Fl:FastMathFlags) => val(arcp),formElemList(Fl)

    rule formElemList(inbounds) => val(inbounds)
    rule formElemList('inBoundsEmpty(.KList)) => .ElemList
    rule formElemList('.IntResolveVals(.KList)) => .ElemList
    rule formElemList(, It:IntType V:ValueRef Ins:IntResolveVals)
            => val(operand(It,addNameToString(V))),formElemList(Ins)
    rule formElemList([ V1:ValueRef , V2:ValueRef ])
            => val(edge(addNameToString(V1),addNameToString(V2)))
    rule formElemList([ V1:ValueRef , V2:ValueRef ] , Pl:PHIList)
            => val(edge(addNameToString(V1),addNameToString(V2))),formElemList(Pl)
    rule formElemList(cleanup) => val(typeOperand(void, cleanup))
    rule formElemList(C:ClauseLabel T:Type V:ValueRef)
                  => val(typeOperand(T, clause(C,addNameToString(V))))
    rule formElemList(.LandingpadFactors) => .ElemList
    rule formElemList(Lpf:LandingpadFactor Lpfs:LandingpadFactors)
                   => val(Lpf),formElemList(Lpfs)
    rule formElemList('callingConvEmpty(.KList)) => .ElemList
    rule formElemList(Ocv:OptCallingConv) => val(Ocv)
            when Ocv =/=K 'callingConvEmpty(.KList)
    rule formElemList(.RetAttrs) => .ElemList
    rule formElemList(A:RetAttr As:RetAttrs) => val(A),formElemList(As)
    rule formElemList(.FuncAttrs) => .ElemList
    rule formElemList(A:FuncAttr As:FuncAttrs) => val(A),formElemList(As)
    rule formElemList('atomicEmpty(.KList)) => .ElemList
    rule formElemList(atomic) => val(atomic)
    rule formElemList('volatileEmpty(.KList)) => .ElemList
    rule formElemList(volatile) => val(volatile)
    rule formElemList('weakEmpty(.KList)) => .ElemList
    rule formElemList('weakMemory(.KList)) => val('weakMemory(.KList))
    rule formElemList('scopeorderEmpty(.KList)) => .ElemList
    rule formElemList('singlethreadEmpty(.KList)) => .ElemList
    rule formElemList(syncscope(" S:SyncScopeKey "))
                       => val(S),.ElemList
    rule formElemList(, N:UnsignedInt)
              => val(String2Int(#tokenToString(N))),.ElemList
    rule formElemList(, N:UnsignedInt Cil:ConstantIndexList)
           => val(String2Int(#tokenToString(N))),formElemList(Cil)
    rule formElemList(X:Ordering) => val(X),.ElemList
    rule formElemList('argListUnit(.KList)) => .ElemList
    rule formElemList('vaArgs(.KList)) => val('vaArgs(.KList)),.ElemList
    rule formElemList(Ty:Type Pa:ParamAttrs)
             => val(arg(formSet(Pa),addNameToString(Ty),.K))
    rule formElemList('argTypeThree(Ty:Type,, Pa:ParamAttrs,, Na:LocalVar))
             => val(arg(formSet(Pa),addNameToString(Ty)
                                                        ,addNameToString(Na)))
    rule formElemList(Ty:Type Pa:ParamAttrs, Al:ArgList)
             => val(arg(formSet(Pa),addNameToString(Ty),.K)),formElemList(Al)
    rule formElemList('argTypeThree(Ty:Type,, Pa:ParamAttrs,, Na:LocalVar), Al:ArgList)
             => val(arg(formSet(Pa),addNameToString(Ty)
                                           ,addNameToString(Na))),formElemList(Al)
    rule formElemList(.ReturnedVal) => .ElemList
    rule formElemList(T:Type V:ValueRef , R:ReturnedVal)
                            => val(operand(T, addNameToString(V))),formElemList(R)
    rule formElemList(K:K) => K [owise]

    syntax Set ::= formSet(K) [function]
    rule formSet('nwEmpty(.KList)) => .Set
    rule formSet(nuw nsw) => SetItem(nuw) SetItem(nsw)
    rule formSet(nsw nuw) => SetItem(nuw) SetItem(nsw)
    rule formSet(nuw) => SetItem(nuw)
    rule formSet(nsw) => SetItem(nsw)
    rule formSet(A:NonExternalLinkage) => SetItem(A)
         requires A =/=K 'nonExternalLinkageEmpty(.KList)
    rule formSet('nonExternalLinkageEmpty(.KList)) => .Set
    rule formSet(A:GlobalType) => SetItem(A)
    rule formSet(, section S:StringName , C:Comdat , A:Align)
                                          => SetItem(section S) SetItem(C) SetItem(A)
    rule formSet(, section S:StringName , C:Comdat) => SetItem(section S) SetItem(C)
    rule formSet(, A:Align , section S:StringName) => SetItem(section S) SetItem(A)
    rule formSet(, section S:StringName , A:Align) => SetItem(section S) SetItem(A)
    rule formSet(, C:Comdat , A:Align) => SetItem(C) SetItem(A)
    rule formSet(, C:Comdat) => SetItem(C)
    rule formSet(, A:Align) => SetItem(A)
    rule formSet(, section S:StringName) => SetItem(section S)
    rule formSet('sectionComdatAndAlignEmpty(.KList)) => .Set
    rule formSet(section S:StringName) => SetItem(section S)
    rule formSet('sectionEmpty(.KList)) => .Set
    rule formSet(externally_initialized) => SetItem(externally_initialized)
    rule formSet('externallyInitEmpty(.KList)) => .Set
    rule formSet(unnamed_addr) => SetItem(unnamed_addr)
    rule formSet('unnamedEmpty(.KList)) => .Set
    rule formSet(prefix T:Type V:ValueRef) => SetItem(prefix T V)
    rule formSet('prefixEmpty(.KList)) => .Set
    rule formSet(prologue T:Type V:ValueRef) => SetItem(prologue T V)
    rule formSet('prologueEmpty(.KList)) => .Set
    rule formSet(E:OptAddrSpace) => SetItem(E)
         requires E =/=K 'addrEmpty(.KList)
    rule formSet('addrEmpty(.KList)) => .Set
    rule formSet(E:OptThreadLocal) => SetItem(E)
         requires E =/=K 'threadLocalEmpty(.KList)
    rule formSet('threadLocalEmpty(.KList)) => .Set
    rule formSet(E:OptDllStorageClass) => SetItem(E)
         requires E =/=K 'dllStorageEmpty(.KList)
    rule formSet('dllStorageEmpty(.KList)) => .Set
    rule formSet(E:OptVisibilityStyle) => SetItem(E)
         requires E =/=K 'visibilityEmpty(.KList)
    rule formSet('visibilityEmpty(.KList)) => .Set
    rule formSet(E:ExternalLinkage) => SetItem(E)
    rule formSet('exactEmpty(.KList)) => .Set
    rule formSet(exact) => SetItem(exact)
    rule formSet('inallocaOfAlloca(.KList)) => SetItem('inallocaOfAlloca(.KList))
    rule formSet('inallocaEmpty(.KList)) => .Set
    rule formSet('atomicEmpty(.KList)) => .Set
    rule formSet(atomic) => SetItem(atomic)
    rule formSet(A:Align) => SetItem(A)
    rule formSet('alignEmpty(.KList)) => .Set
    rule formSet(C:Comdat) => SetItem(C)
    rule formSet('comdatEmpty(.KList)) => .Set
    rule formSet(gc S:StringName) => SetItem(gc S)
    rule formSet('gcEmpty(.KList)) => .Set
    rule formSet('volatileEmpty(.KList)) => .Set
    rule formSet(volatile) => SetItem(volatile)
    rule formSet('scopeorderEmpty(.KList)) => .Set
    rule formSet('singlethreadEmpty(.KList)) => .Set
    rule formSet(syncscope(" S:SyncScopeKey ")) => SetItem(S)
    rule formSet('weakEmpty(.KList)) => .Set
    rule formSet('weakMemory(.KList)) => SetItem('weakMemory(.KList))
    rule formSet(S:Ordering) => SetItem(S)
    rule formSet(.FastMathFlags) => .Set
    rule formSet(F:FastMathFlag Fl:FastMathFlags) => SetItem(F) formSet(Fl)
    rule formSet(inbounds) => SetItem(inbounds)
    rule formSet('inBoundsEmpty(.KList)) => .Set
    rule formSet(cleanup) => SetItem(cleanup)
    rule formSet('cleanupEmpty(.KList)) => .Set
    rule formSet('callingConvEmpty(.KList)) => .Set
    rule formSet(X:OptCallingConv) => SetItem(X)
         requires X =/=K 'callingConvEmpty(.KList)
    rule formSet(R:RetAttr Rs:RetAttrs) => SetItem(R) formSet(Rs)
    rule formSet(.RetAttrs) => .Set
    rule formSet(R:FuncAttr Rs:FuncAttrs) => SetItem(R) formSet(Rs)
    rule formSet(.FuncAttrs) => .Set
    rule formSet(R:ParamAttr Rs:ParamAttrs) => SetItem(R) formSet(Rs)
    rule formSet(.ParamAttrs) => .Set
    rule formSet(K:K) => SetItem(K) [owise]

    syntax ElemList ::= formElemListInGep(ReturnedVal) [function]
    rule formElemListInGep(.ReturnedVal) => .ElemList
    rule formElemListInGep(T:Type V:ValueRef, R:ReturnedVal)
            => val(typeOperand(T, addNameToString(V))), formElemListInGep(R)


    syntax ElemList ::= formTypeCheckList(K)   [function]
    rule formTypeCheckList('.ReturnedValGep(.KList)) => .ElemList
    rule formTypeCheckList('inRangeEmpty(.KList)
                         It:Type V:ValueRef , Ins:ReturnedValGep)
            => val(typeOperandGep(.K, It,addNameToString(V))),formTypeCheckList(Ins)
    rule formTypeCheckList(inrange It:Type V:ValueRef , Ins:ReturnedValGep)
         => val(typeOperandGep(inrange, It,addNameToString(V))),formTypeCheckList(Ins)
    rule formTypeCheckList('.ReturnedVal(.KList)) => .ElemList
    rule formTypeCheckList(It:Type V:ValueRef , Ins:ReturnedVal)
            => val(typeOperand(It,addNameToString(V))),formTypeCheckList(Ins)
    rule formTypeCheckList(.ParamList) => .ElemList
    rule formTypeCheckList(T:Type _:ParamAttrs V:ValueRef, Pl:ParamList)
            => val(typeOperand(T,addNameToString(V))),formTypeCheckList(Pl)
    rule formTypeCheckList(K:K) => K [owise]

    syntax ElemList ::= combineElemList(ElemList, ElemList) [function]

    rule combineElemList(.ElemList,Bs:ElemList) => Bs
    rule combineElemList((A:Element,As:ElemList),Bs:ElemList) => A,combineElemList(As,Bs)

    syntax ElemList ::= mergeVectorList(K, K) [function]
    rule mergeVectorList(vector(E1:ElemList), vector(E2:ElemList)) => combineElemList(E1,E2)
    rule mergeVectorList(A:K, B:K) => .ElemList [owise]

    syntax ElemList ::= addElemToEnd(Element, ElemList)   [function]
    rule addElemToEnd(E:Element, .ElemList) => E,.ElemList
    rule addElemToEnd(E:Element, E':Element,Es:ElemList) => E',addElemToEnd(E,Es)

    syntax Int ::= dealWithAddrSpace(K) [function]
    rule dealWithAddrSpace('addrEmpty(.KList)) => 0
    rule dealWithAddrSpace(addrspace(X:UnsignedInt))
          => String2Int(#tokenToString(X))

    syntax NonVoidType ::= arrayType(K, K) [strict] // inner type, length
                         | vectorType(K, K) [strict(1)]//inner type, length
                         | functionTypeEval(K, K) [strict]
                         //| structType(K) [strict]
                         //| namedType(K)
                         //| functionType(K, K) [strict] // return type, argument types

    syntax IntTypeCore ::= integerType(K)
    syntax IntType ::= IntTypeCore

/*
    syntax TypeList ::= argListToTypeList(ArgList) [function]

    rule argListToTypeList('argListUnit(.KList)) => .TypeList

    rule argListToTypeList('argTypeTwo(T:Type,, Pas:ParamAttrs))
                            => T
    rule argListToTypeList('argTypeThree(T:Type,, Pas:ParamAttrs,, L:LocalVar))
                            => T
    rule argListToTypeList('argTypeTwo(T:Type,, Pas:ParamAttrs), As:ArgList)
                            => T,argListToTypeList(As)
    rule argListToTypeList('argTypeThree(T:Type,, Pas:ParamAttrs,, L:LocalVar), As:ArgList)
                            => T,argListToTypeList(As)
*/

    rule addrspace(I:UnsignedInt) => addrSpaceResult(String2Int(#tokenToString(I)))
    rule 'addrEmpty(.KList) => addrSpaceResult(0)
    rule arrayType(K1:KResult, K2:KResult) => arrayTypeValue(K1, K2) [structural]
    rule 'structType(K1:KResult) => structTypeValue(K1) [structural]
    rule 'packedStructType(K1:KResult) => packedStructTypeValue(K1) [structural]
    rule 'functionType(K1:K,, K2:ArgList) => functionTypeEval(K1, formElemList(K2))
                                                        [structural]
    rule functionTypeEval(K1:KResult, K2:KResult)
                     => functionTypeValue(K1, getAllTypes(K2)) [structural]
    rule 'pointerType(K1:KResult,, A:OptAddrSpace)
                     => pointerTypeValue(K1, dealWithAddrSpace(A)) [structural]

    //uniform the types.
    rule [ I:UnsignedInt x T:Type ] => arrayType(T,
                                    String2Int(#tokenToString(I)))         [anywhere]
    rule < I:UnsignedInt x T:Type > => vectorType(T,
                                    String2Int(#tokenToString(I)))         [anywhere]
    rule vectorType(K:KResult, I:Int) => vectorTypeValue(K, I)
    //rule 'argTypeTwo(T:Type ,, Pas:ParamAttrs,, )
    //rule T:Type A:OptAddrSpace *
     //        => pointerType(T, dealWithAddrSpace(A)) [structural]
    //rule { Ts:TypeList } => structType(Ts) [macro]
    //rule < { Ts:TypeList } > => structType(Ts) [macro]

    //change IntType from LLVM syntax to K rule syntax

    rule I:IntTypePre => integerType(String2Int(substrString(#tokenToString(I),
                        1, lengthString(#tokenToString(I)))))
         requires String2Int(substrString(#tokenToString(I),
                        1, lengthString(#tokenToString(I)))) >Int 0
               andBool String2Int(substrString(#tokenToString(I),
                        1, lengthString(#tokenToString(I)))) <Int (2 ^Int 23)

    rule I:IntTypePre => badType
         requires String2Int(substrString(#tokenToString(I),
                        1, lengthString(#tokenToString(I)))) <=Int 0
               orBool String2Int(substrString(#tokenToString(I),
                        1, lengthString(#tokenToString(I)))) >=Int (2 ^Int 23)

    syntax Loc ::= loc(K, K, K, K, K, K)
             //base, type, range, rangetype, blockaddr?, inrange?
    //syntax Loc ::= stackLoc(K, K, K, K) 
             // TODO [semantic] base, type, range, inrange?
    syntax Loc ::= aLoc(K, K, K) //base, type, rangeType
    syntax Loc ::= intLoc(K, K, K,K, K) //base(int), type, range, rangetype, blockaddr?
    syntax Loc ::= floatLoc(K, K, K,K, K) //base(float), type, range, rangetype, blockaddr?
    syntax KItem ::= funptr(K)//name
    //syntax KItem ::= funCountLabel(Int, K)//position, ptr
    syntax ValueRef ::= Loc
    syntax KItem ::= dealWithUnnamed(List)
    syntax KItem ::= mapEntry(K, K) //key, value
    syntax KItem ::= vector(ElemList)           [strict]
    rule vector(E:KResult) => vectorValue(E)

/*
    syntax List ::= list(KList) [function]

    rule list(.KList) => .List
    rule list(A:K,, KL:KList) => ListItem(A) list(KL)
*/
    syntax Int ::= ptrByte(K, K) // address, byteNumber; part of a pointer, as a byte
    syntax KItem ::= floatByte(K, K, K) // float, type, byte number
    //rule isNat(ptrByte(_, _)) => true
    //rule isNat(floatByte(_, _, _)) => true

    syntax KResult ::= Undef
    syntax KResult ::= "poisonVal"
    syntax KItem ::= "debug" // TODO [semantic]
    syntax KItem ::= "callMain" // TODO [semantic]
    syntax KItem ::= "initGlobals" // TODO [semantic]
    syntax KItem ::= initGlobalTypes(ElemList) [strict] // TODO [semantic]
    syntax KItem ::= "initDef"
    syntax KItem ::= initBuiltins(ElemList) [strict]
    syntax ElemList ::= "vararg"

    //LLVM builtin values
    syntax FpValResult ::= "nan"
    syntax FpValResult ::= "posZero"
    syntax FpValResult ::= "negZero"
    syntax FpValResult ::= "posInf"
    syntax FpValResult ::= "negInf"
    syntax KResult ::= Zeroinitializer
    syntax KResult ::= blockValue(K)

    syntax KResult ::= intByte(List)
    syntax KItem ::= countByteResult(List, List)
    syntax KItem ::= splitListResult(List, List)

    //syntax KItem ::= blockExecutionAux(K) 
    syntax KItem ::= blockExecution(K, List)//prev block with num, inst list
    syntax KItem ::= "blockHOLE"
    syntax KItem ::= findNewSpec(K)
    //syntax KItem ::= setExecutionInst(Int, Set, K, K)
                //new block, not good specs, NewEx, NewQueue

    //parsing string in LLVM to byte list in K
    syntax KItem ::= charListResult(List, List)

    //don't know how to deal with
    syntax KItem ::= moduleAsm(K) // now let's to be K first, maybe String
    syntax KItem ::= metaConst(K, MetadataValues) //Distinct_or_not, IndexList
    syntax KItem ::= metaVar(MetadataVar, MetadataInts) //Name, MetaList
    syntax KItem ::= funBegin(K)// use to initialize the initial block name.

    syntax FpValResult ::= float(Int, Int, List)
    syntax FpVal ::= FpValResult
    syntax KResult ::= FpValResult
    syntax KItem ::= preFloat(Int, List, List, Int)
                   | secFloat(Int, List, List)
    syntax KItem ::= holdDigits(Int, List)

    syntax KItem ::= constantString(String)
    syntax KItem ::= array(ElemList) [strict] // element type, arguments
    rule array(Es:KResult) => arrayValue(Es) [structural]

    syntax KItem ::= constantArray(K, K) [strict] // element type, arguments

    syntax KItem ::= "clearVoid"
    syntax KItem ::= clearLocalMemory(K, Set)
    syntax KItem ::= "clearResume"
    syntax KResult ::= resumeVal(K)
    syntax KItem ::= "invokeNoRet"
    syntax KItem ::= "invokeRet"

    syntax KResult ::= Cleanup
    syntax KItem ::= landingpad(K, List) //type caluses
    syntax KItem ::= invoke(K, K, K, K, K)  [strict(2)]
           //type, callee, normal, exception, flag on return or not
    syntax KItem ::= invokeBr(K, K) //normal, exception
    syntax KItem ::= initializer(K, K) // type, value
    syntax KItem ::= globalVariable(K, Set, K, K, Int, Int) [strict(3,4)]
              // Value/Name, Modifiers, Type, Initializer, address space, align
    syntax KItem ::= preInit(Set, K, K, K, K, Int, Int) [strict(4)]
               //modifiers, type, var, location, init, address space, align
    syntax KItem ::= postInit(Set, K, K, K, Int, Int) [strict(4)]
    syntax KItem ::= postInitAux(Set, List, K, K, K, Int, Int)
    syntax KItem ::= postInitNext(Set, K, List, K, K, K, Int, Int)
               //modifiers, list of equal content fileds, type, var, init, align  
    syntax KItem ::= globalValue(Set, K, K)
               //modifiers, type, location, content value
    syntax KItem ::= modifiers(Set)
    syntax KItem ::= insMetas(ElemList)
    syntax KItem ::= inAlloca(K)
    syntax KItem ::= alloca(K, K, Int,Int, Bool) [strict(1,2)]
                    // Type, NumElements,addrspace,align, isConstant?
    syntax KItem ::= globalAlloca(K, K, Int,Int, Bool)
                           // Type, NumElements,addrspace,align, isConstant?
    syntax KItem ::= preAlloca(K, K) [strict(2)] // IntType, NumElements
    syntax KItem ::= load(K, K, Int) [strict(1,2)]//type value, align
    syntax KResult ::= loadVal(K)//type
    syntax KItem ::= loadHold(K, List)//type, List
    syntax KItem ::= assignUses(K, K, K, ElemList)//blockname, inst num, type, list of names
    syntax KItem ::= assignUsesInCall(K, K, ElemList)  [strict(3)]//blockname, inst num, args
    syntax KItem ::= varOp(K, K, K, K)//block num, instruction num, type, name
    syntax KItem ::= setLabelVars(Map)
    syntax KItem ::= "setLabelVars"
    syntax KItem ::= memId(Int, Int, Int)//tid, block id, inst id
    syntax KItem ::= storeOperand(Int, K, K)//tid, type, value
    syntax KItem ::= operand(K, K) [strict] // Type, Value
    syntax KItem ::= gepOperand(K, K, K) [strict(3)]
                          //inrange?, Type, Value
    syntax KResult ::= gepOperandResult(K, K) //inrange, value
    syntax KItem ::= singleGepTypeCheck(K, Int, K, Int, K, K, Set, K) [strict(5)]
              //block, assign,count, add space, type, arg-type, flags, meta
    syntax KItem ::= vectorGepTypeCheck(K ,Int, K, Int, K, Int, List, List, K, List, Set, K)
              //block, count, assign, add space, type, vector-num
              //types, stores, ret-arg, store-args, flags, meta 

    syntax KItem ::= clause(K, K) //caluse label, value
    syntax KItem ::= typeOperand(K, K)  [strict(1)] //type, value
    syntax KItem ::= typeOperandGep(K, K, K)  [strict(2)] //inrange, type, value
    syntax KResult ::= typeOperandGepVal(K, K, K) //inrange type, value
    syntax KResult ::= typeOperandResult(K, K)
    rule typeOperandGep(A:K, T:KResult, K:K) => typeOperandGepVal(A, T, K) [structural]
    rule typeOperand(T:KResult, K:K) => typeOperandResult(T, K)     [structural]
    syntax KItem ::= setArgsToBlockEnv(K, ElemList)  [strict(2)]//block name, typeoperand

    //syntax KItem ::= setSpecChoice(Int, Int, K, K, K)
               //Old, New, choice map, toEx inst, queue inst
    syntax KItem ::= memProto(Int, K, Map) //inst-id, mem-op, next mem map
    syntax KItem ::= runBlock(Int, K, K, List, Set, Set) 
                      //block id, block name, father block id (int or none), 
                      //mem list, def var set, children ids
    syntax KItem ::= allowChoice(Map) //used for specChoice cell
    syntax KItem ::= holdChoice(Map) //used for specChoice cell
    syntax KItem ::= newSpecMap(Map, Set)
                    //used for calculating new specChoice after br
    syntax KItem ::= nextSpecs(Set) //used for map element of specChoice
    syntax KItem ::= splitQueue(List, List, List) //used for instQueue cell
                                     //availables, Pre, remains
    syntax KItem ::= readMap(Map)
    syntax KItem ::= readMapAux(K, K, Map) //(block, inst), (var, V), map 
    syntax KItem ::= instList(List) //used for instQueue cell
    syntax KItem ::= memList(List, List, List, List, List)
            //used for toCommit cell: available to commit, available to commit
            //already wire, avialable to wire, not available
    syntax KItem ::= pairResult(K, K)
    syntax KItem ::= pairResultList(K, List)
    syntax KItem ::= dynInstInfo(Int, Int, K, K)
                      //block num, inst num, inst, inst type
    syntax KItem ::= dynInstHold(Int, Int, K) //block, inst num, inst type
    syntax KItem ::= singleMem(Int, Int, Int, K, K) //block, inst num, stack/heap, inst
    syntax KItem ::= toRead(K, K) //var or loc, ordering
    syntax KItem ::= toWrite(K, K) //var or loc, ordering
    syntax KItem ::= toReadWrite(Set, List) //var or locs, ordering
    syntax KItem ::= toClose(Int) //loc-base
    
    syntax KResult ::= atomicrmwWait(K, K,K, K) //type,op, value, write-loc
    syntax KResult ::= cmpxchgWait(K, K, K, K) //t, compare result, value, write-loc
    syntax KItem ::= "vaWait"
    syntax KItem ::= vaWaitRead(K) //type
    syntax KItem ::= "waitWrite"
    syntax KItem ::= vaWaitWrite(K) //loc
    syntax KResult ::= vaArgOp(K, K) //loc, read-type

    syntax KItem ::= writeAByte(K, K, K, Int, Int, Int, Int)
                   //type value, original value, base, offset, size, addrspace
    syntax KItem ::= readAByte(K, Int, Int, Int, Int)
                   //type, base, input offset, offset, size, addrspace
    syntax KItem ::= readPiece(Int, K)
           //store the byte when load an item
    syntax KItem ::= atomicWrite(K, K, K, Int, Int, Int, K)
                      //type, value, original base, size, addrspace, ordering
    syntax KItem ::= atomicRead(K, Int, Int, Int, K)
                      //type,base, size, addspace ordering
    syntax KItem ::= runDynInst(K) [strict]
    syntax KResult ::= dynResult(K, K)
    syntax KResult ::= dynNoResult(K)
    syntax KItem ::= waitForBranch(K)
    //syntax KItem ::= exprType(K) [strict]
    syntax KItem ::= constIntBinType(K, K, ElemList)   [strict(3)]//type, op, args
    syntax KItem ::= exprGepArgType(K, K) [strict(2)] //inrange, arg-type
    syntax KItem ::= exprSelectType(Int, K, ElemList, K) [strict(3)]
    syntax KItem ::= exprVaArgType(Int, K, K, K, K) [strict(3)]
              //count, var, arg-ty, ty2, meta
    syntax KItem ::= exprAllocaType(Int, K, K, ElemList, Int, Int, Set, K) [strict(4)]
           //count, var, type, arg-type, addspace, align, flags, meta
    syntax KItem ::= exprLoadType(Int, K, K, Int, Set, K) [strict(3)]
           //count, var, arg-ty, align, flags, Meta
    syntax KItem ::= exprCmpxchgType(Int, K, ElemList, ElemList, K,K, Set, K) [strict(3,4)]
           //count, var, type, arg-type, order1, order2, flags, meta
    syntax KItem ::= exprAtomicrmwType(Int, K,K, ElemList, ElemList, K, Set, K) [strict(4,5)]
           //count, var, op, type, arg-type, order, flags, meta

    syntax KItem ::= exprStoreType(Int, ElemList, Int, Set, K) [strict(2)]
           //count, arg-types, align, flags, meta
    syntax KItem ::= exprPhiType(K, K) [strict(1)]
             //arg-type, label
    syntax KItem ::= exprSwitchType(Int, ElemList, K, List, K) [strict(2)]
    syntax KItem ::= exprIndirctBrType(Int, ElemList, List, K) [strict(2)]
    syntax KItem ::= exprBrType(Int, ElemList, K, K, K) [strict(2)]
    syntax KItem ::= exprShuffleType(Int, K, ElemList, K) [strict(3)]
    syntax KItem ::= exprElemExtractType(Int, K, ElemList, K) [strict(3)]
    syntax KItem ::= exprInsertElemType(Int, K, ElemList, K) [strict(3)]
    syntax KItem ::= exprExtractValueType(Int, K, K, List, K) [strict(3)]
              //count, var, arg-tys, index, meta
    syntax KItem ::= exprInsertValueType(Int, K, ElemList, List, K) [strict(3)]
              //count, var, arg-tys, index, meta
    syntax KItem ::= exprInvokeType(Int, K, K, K, K, K, ElemList, ParamList, Set, K)
                         [strict(7)] 
                  //count, var, ret-ty, name, label1, label2, arg-tys, flags, meta
    syntax KItem ::= exprCallType(Int, K, K, K, K, ElemList, ParamList, Set, K)
                         [strict(6)] 
                  //count, var, op, ret-ty, name, arg-tys, flags, meta
    syntax KItem ::= exprResumeType(Int, K, K) [strict(2)]
    syntax KItem ::= exprRetType(Int, K, K) [strict(2)]
    syntax KItem ::= exprLandingpadType(K, K) [strict(2)]
    syntax KItem ::= exprBinOpType(Int,K, K, ElemList, Set, K) [strict(4)]
                 //count, var, op, typechecking, flags, meta
    syntax KItem ::= exprIcmpOpType(Int,K, K, ElemList, K) [strict(4)]
                 //count, var, op, typechecking, meta
    syntax KItem ::= exprFcmpOpType(Int,K, K, ElemList, Set, K) [strict(4)]
                 //count, var, op, typechecking, flags, meta
    syntax KItem ::= exprCastOpType(Int,K, K, K, K, K) [strict(4)]
                 //count, var, op, typechecking, meta

    syntax KItem ::= constExprType(K, K) [strict(2)] 
    syntax KItem ::= prePutInMemoryOrder(Int, Int, Int, K, K)
    syntax KItem ::= putInMemoryOrder(Int, Int, Int, K, K)
    syntax KItem ::= constExpr(K) [strict]
    syntax KResult ::= constExprVal(K) [strict]
    syntax KItem ::= memChunck(Int, Int, Int, K, K, Bool, Set, Map)
              //baseptr, size, align, type, range(heap, static, stack)
              //initial?, set of sub-base, sub-chunck
              //if a struct have two field, the base of the second field
              //== base of first + size of first + align of second.
    //instructions
    syntax KItem ::= "guessExternal"
    syntax KItem ::= preStaticStore(K, K, K, K, Int) [strict(2)]
    syntax KItem ::= staticStore(K, K, K, K, Int) [strict(2)]
                        // Type, Value, deType, Destination, aligns
    syntax KItem ::= store(K, K, K, K, Int) [strict(1,2,3,4)]
                        // Type, Value, deType, Destination, align
    syntax KItem ::= fence(K)
    syntax KItem ::= "acquireFence" | "releaseFence"
                   | "readRWFence" | "writeRWFence" | "readWriteFence" | "seqFence"
                   | "readSeqFence" | "writeSeqFence"
    syntax KItem ::= ret(K, K) [strict]//type value,
    syntax KItem ::= assign(K, K) [strict(2)] // Name, Instruction
    syntax KItem ::= stacticAssign(K, K) // Name, Instruction
    syntax KItem ::= noAssign(K) [strict] // Name, Instruction
    syntax KItem ::= instruction(K, Set, K) 
    syntax KItem ::= instMap(Map)
        //body, modifiers, instructionMetadatas
    syntax KItem ::= selectSpec(K, K, Set)
        //previous block, next blocks, remain choices
    //syntax KItem ::= selectResult(K, K, List)
          //cur block, next block name, list

    syntax KItem ::= "unreachable"
    syntax KItem ::= resume(K, K)  [strict(2)]//operand
    syntax KItem ::= indirectbr(K, List)   [strict(1)]//operand, list of labels
    syntax KItem ::= unconditional(K)//label
    syntax KItem ::= conditional(K, K, K) [strict(1)]//operand, label1, label2
    syntax KItem ::= switch(K, K, K, List) [strict(2)] // type, condition, default dest, list of cases
    syntax KItem ::= switchAux(K, K, List) //val, default, list of cases
    //syntax Case ::= case(K, K) // const, successor
    syntax KItem ::= typeCase(K, K, K)  [strict(1)]//ty, const, label
    syntax KResult ::= typedCase(K, K, K)//ty, const, label
    //syntax CaseResult ::= caseValue(K, K)
    //syntax KResult ::= CaseResult
    //syntax Case ::= CaseResult
    //syntax Cases ::= List{Case,","} [strict,klabel('caseCon)]
    //syntax KItem ::= Cases
    //rule case(K:KResult, K') => caseValue(K, K') [structural]

    syntax KItem ::= arguments(ElemList) [strict]
    syntax KItem ::= arg(Set, K, K) [strict(2)]// Modifiers, Type, Value/Name
    syntax KResult ::= typedArg(Set, K, K)
    rule arg(S:Set, T:KResult, A:K) => typedArg(S, T, A)

    //vector ops
    syntax KItem ::= elemExtract(K, K, K, K) [strict(2, 4)]
    syntax KItem ::= elemExtractAux(ElemList, K) //v1,v2
    syntax KItem ::= insertElem(K, K, K, K, K, K) [strict(2, 4, 6)]
                   //vectort, vector, elementt, element, intt, int
    syntax KItem ::= insertElemAux(K)
    syntax KItem ::= shuffleVector(K, K, K, K, K) [strict(2,3,5)]

    //@ Conversion Operations
    syntax KItem ::= theTrunc(K, K, K) [strict(2)] // type, op, totype
    syntax KItem ::= theSExt(K, K, K) [strict(2)] // type, op, totype
    syntax KItem ::= theZExt(K, K, K) [strict(2)] // oldtype, op, totype
    syntax KItem ::= theBitCast(K, K, K) [strict(2)] // type, op, totype
    syntax KItem ::= theIntToPtr(K, K, K) [strict(2)] // type, op, totype
    syntax KItem ::= theIntToPtrAux(K, K) // op, totype
    syntax KItem ::= thePtrToInt(K, K, K) [strict(2)] // type, op, totype
    syntax KItem ::= thePtrToIntAux(K, K) //op totype
    syntax KItem ::= theFpToSI(K, K, K) [strict(2)] // type, op, totype
    syntax KItem ::= theFpToSIAux(K) //v
    syntax KItem ::= theFpToUI(K, K, K) [strict(2)] // type, op, totype
    syntax KItem ::= theFpToUIAux(K) //v
    syntax KItem ::= theFPTrunc(K, K, K) [strict(2)] // type, op, totype
    syntax KItem ::= theFPTruncAux(K)
    syntax KItem ::= theFPExt(K, K, K) [strict(2)] // type, op, totype
    syntax KItem ::= theSIToFP(K, K, K) [strict(2)] // type, op, totype
    syntax KItem ::= theSIToFPAux(K) //v
    syntax KItem ::= theUIToFP(K, K, K) [strict(2)] // type, op, totype
    syntax KItem ::= theUIToFPAux(K) //v
    syntax KItem ::= theAddrSpaceCast(K, K, K) [strict(2)]//type, op, totype

    syntax KItem ::= constantStruct(ElemList) [strict] //arguments
    syntax KResult ::= constStructVal(ElemList) //arguments
    rule constantStruct(A:KResult) => constStructVal(A)
    syntax KItem ::= packedStruct(ElemList) [strict] //arguments
    syntax KResult ::= packedStructVal(ElemList) //arguments
    rule packedStruct(A:KResult) => packedStructVal(A)

    syntax KItem ::= theVAArg(K, K, K) [strict(2)]
                 // point_type, va_list, result_type
    //syntax KItem ::= values(K) [function]
    //rule values(K:K) => K
    //syntax KItem ::= findPhi(K, ElemList) //block num, edge list
    //syntax KItem ::= findPhiAux(K, ElemList) //block, edge list
    syntax KItem ::= phi(K, ElemList) [strict(1)] // type, edge list
    syntax KItem ::= edge(K, K) // used by PHI
    syntax KItem ::= phiResult(Int, K) //father-block-id, var/value
    syntax KItem ::= select(K, K, K, K) [strict] //ty, condition, true val, false val
    syntax KItem ::= tailCall(K, K)
    rule tailCall(K:K, E:K) => call(K,E) [structural] //first assume that call and tailcall are the same.    

    syntax KItem ::= call(K, K) [strict] // Type, Callee
    syntax KItem ::= callee(K, K) [strict] // Value/Name, Arguments
    syntax KResult ::= calleeValue(K, K)
    rule callee(K:KResult, K':KResult) => calleeValue(K, K') [structural]

    syntax KItem ::= getElementPtr(K, K, ElemList) [strict(2,3)]// type, loc, indecies
                   | gepTypeBag(K)          [strict]
                   | getElementPtrAux(K, K, Int, Int, K, K, K, ElemList)
                      //type, Range, base, addrspace, blockAddr?, inrange?, stack/heap, indices
                   | getElementPtrBound(K, K, Int, Int, K, K, K, ElemList)
                      //type, Range, base, addrspace, blockAddr?, inrange?, stack/heap, indices
                   | getElementPtrCal(K, K, Int, Int, K, K, K, Int, ElemList)
                      //type, Range, base, addrspace, blockAddr?, inrange?, stack/heap, Index, indices
                   | "badRange"

    syntax KItem ::= extractElement(K, K) [strict]
    syntax KItem ::= insertElement(K, K, K) [strict]
    syntax KItem ::= shuffleVector(K, K, K) [strict]

    syntax KItem ::= extractValue(K, List) [strict(1)]
    syntax KItem ::= cmpxchg(K, K, K, K, K) [strict(1,2,3)]
                 //(addty, addv), (compare-ty,value), new-ty-value,
                 // success ordering, failure ordering 
    syntax KItem ::= atomicrmw(K, K, K, K) [strict(2,3)]
            //op, addr-ty-v, write-ty-v, ordering
    syntax KItem ::= insertValue(K, K, K, List) [strict(2,3)]
                      //type, v1, v2, indexs

    syntax KItem ::= aliases(ElemList)
    syntax KItem ::= alias(Set, K, K) [strict(3)]//modifiers, Name, Aliasee
    syntax KItem ::= theModule(K, K, K, K, K, K, K, K)
                    //Id, TargetLayout, TargetTriple, MetaVars,Typedefs,GlobalVars,Aliases,Functions 
    syntax KItem ::= basicBlock(K, K) // Name, Instructions
    syntax KItem ::= blockContent(Map, Bool, Set, Set, Set, Set, Set, Set, Set)
                                   //instructions map from number (0...) to line of code
                                   //flag indicating that if the block will lead to a loop.
                                   //,outgoing edges, incoming edges, all incoming defs,
                                   //all incomming uses, all outgoing defs, all outgoing uses.
                                   //use vars that have not been defined in current block
    syntax KItem ::= setOutEdge(K, ElemList) //name, outEdges
    syntax KItem ::= "setLoopFlag"
    syntax KItem ::= setLoopFlag(K, K, Map, Map)
    syntax KItem ::= setInEdges(Set)
    syntax KItem ::= setInEdgesForNode(K)
    syntax KItem ::= setInEdgesForNode(K, K, Set)
    syntax KItem ::= setInitBlock(K)
    syntax KItem ::= startInitBlock(K)
    syntax KItem ::= calDefUse(K, Set, Set)
                   //new blocks, visited blocks
    syntax KItem ::= calDefUse(K, Set, Set, Set, K, Set, Set)
                   //cur block, defs, uses, nexts,next block, new blocks, visited blocks
    syntax KItem ::= phiEdges(K, Set)//block
    syntax KItem ::= "checkingPhisInEdges"
    syntax KItem ::= "checkUseVars"
    syntax KItem ::= "checkLabelUses"
    syntax KItem ::= checkBlockAddress(K)
    syntax KItem ::= "checkLandingpad"
    syntax KItem ::= "checkLandingDomResumes"
    syntax KItem ::= "landingpadBadState"
    syntax KItem ::= "performNextChecks"
    syntax KItem ::= checkAllExpBlocksHavingLandingpad(K, Set)
    syntax KItem ::= checkAllExpInFromInvoke(K, Set)
    syntax KItem ::= checkAllExpInFromInvokeAux(K, K, Set)
    syntax KItem ::= checkAllExpInFromInvokeCheck(K, K, Int, Map)
    syntax KItem ::= checkNoNormalBlocksHavingLandingpad(K, Set)
    syntax KItem ::= checkLandingDomResume(K, K, Set) //type, block, b-set
    syntax KItem ::= checkLandingDomResumeAux(K, Set, Set)
                  //type, in-set, b-set
    syntax KItem ::= checkLandingDomResumeAuxA(K, Set, Set)
    syntax KItem ::= checkUseVars(K, Map)
    syntax KItem ::= checkUseVarsAux(K, Set, Set)
    //syntax KItem ::= checkUseVars(ElemList) [strict]
    //syntax KItmm ::= checkUseVars(List, K, Set, Set)
    //syntax KItem ::= checkUseVars(List, K, Set)
    //syntax KItem ::= checkUseVars(Set, Set, Set)
    syntax KItem ::= checkUseVarInside(K, K, K)
    syntax KItem ::= checkUseVarInBlock(K, Set, Set)
    syntax KItem ::= "checkUseVarInPhi"
    syntax KItem ::= checkUseVarInPhiAux(K, ElemList)
    syntax KItem ::= checkUseVarInPhi(Int, Map, K, List)
               //inst num, inst map, single inst, List of inst maps
    syntax KItem ::= checkFirstInPhi(Int, Map, K, List)
               //inst num, inst map, single inst, List of inst maps
    //syntax KItem ::= checkUseVarInPhi(Set, Set)
    //syntax KItem ::= checkUseVarInPhi(K, Set, Set)
    //syntax KItem ::= toCheckUsePhiVarInBlock(K, Set)

    syntax KItem ::= setBlockPaths(K, Set) //block, store set
    syntax KItem ::= setBlockInDefs(K, Set)//block, store block set
    syntax KItem ::= setBlockInDef(K, List)//block, path
    syntax KItem ::= setBlockInUses(K, Set)//block, store block set
    syntax KItem ::= setBlockInUse(K, List)//block, path
    syntax KItem ::= setBlockPath(K, K, Set, Set, List, List, List, Set)
           //top, cur, touch set, visiting node, visiting set, store paths, caled paths, paths, visited set
           //block names, name, checked blocks, outblock, outs, inblock, ins
    syntax KItem ::= blockPath(List)
    syntax KItem ::= linked(Set) //strong connected components
    syntax KItem ::= dependent(K, K)//dependency relation
    syntax KItem ::= setBlockDependency(K, List)//block, inst_list, def_set, use_set
    syntax KItem ::= setBlockDependencies(K, Set)//block store set
    syntax KItem ::= setBlockDepend(K, K, K, K, Set, List, List, Set, Set)
                     //block, inst, Def Set, insttype, use Set,  InstList, PathList, InstSet, BlockSet

    syntax KItem ::= "checkUseVarWait"
    syntax KItem ::= functionDef(Set, K, K, ElemList, K)  [strict(2,4)] // Attributes, RetType, Value/Name, Arguments, Body
    syntax KItem ::= functionDecl(Set, K, K, ElemList)  [strict(2,4)] // Attributes,Type, Value/Name, Arguments
    syntax KItem ::= typedef(K, K)    [strict(2)]// name, type TODO: modifiers
    syntax KItem ::= fields(ElemList) [strict]
    syntax KItem ::= types(ElemList)  [strict]
    syntax KItem ::= setBlock(K)
    syntax KItem ::= body(ElemList)

    syntax KItem ::= assignType(K, Int, K, K) //block, inst num, var, t

    syntax SymbolicValueRef ::= name(K, String)   [klabel('name)]//label, name
    syntax KItem ::= varInstance(K, K)//block, inst / var, loadhold
    syntax KItem ::= readBackHold(K, K, K) //var, loadhold, following action
    syntax KItem ::= "globalVar" | "localVar"
    syntax KItem ::= "either" | "heap" | "stack" | GlobalType

    syntax KItem ::= theDefinition(K,K) [strict]
    syntax KItem ::= iCmp(K, K, K, K)      [strict(3,4)]//op, type, left, right
    syntax KItem ::= fCmp(K, K, K, K)      [strict(3,4)]//op, type, left, right

    //@ Binary Operations
    syntax KItem ::= flagStage(K, K) //op, int value
    syntax KResult ::= intValue(K, K) //int type, int value, flags
    syntax KItem ::= theAdd(K, K, K) [strict] // Type, Left op, Right op, flags
    syntax KItem ::= theSub(K, K, K) [strict] // Type, Left op, Right op
    syntax KItem ::= theMul(K, K, K) [strict] // Type, Left op, Right op
    syntax KItem ::= theUDiv(K, K, K) [strict] // Type, Left op, Right op
    syntax KItem ::= theSDiv(K, K, K) [strict] // Type, Left op, Right op
    syntax KItem ::= theURem(K, K, K) [strict] // Type, Left op, Right op
    syntax KItem ::= theSRem(K, K, K) [strict] // Type, Left op, Right op

    //@ Floating-point Binary Operations
    //strict on all the arguments for theFSub, theFMul, theFDiv, the FRem
    syntax KItem ::= theFAdd(K, K, K) [strict(2,3)] // Type, Left op, Right op
    syntax KItem ::= theFSub(K, K, K) [strict(2,3)] // Type, Left op, Right op
    syntax KItem ::= theFMul(K, K, K) [strict(2,3)] // Type, Left op, Right op
    syntax KItem ::= theFDiv(K, K, K) [strict(2,3)] // Type, Left op, Right op
    syntax KItem ::= theFRem(K, K, K) [strict(2,3)] // Type, Left op, Right op

    //@ Bitwise Binary Operations
    // strict on all the arguments for theShl, theLShr,theAShr, theOr, theXor
    syntax KItem ::= theShl(K, K, K) [strict] // Type, Left op, Right op
    syntax KItem ::= theLShr(K, K, K) [strict] // Type, Left op, Right op
    syntax KItem ::= theAShr(K, K, K) [strict] // Type, Left op, Right op
    syntax KItem ::= theOr(K, K, K) [strict] // Type, Left op, Right op
    syntax KItem ::= theAnd(K, K, K) [strict] // Type, Left op, Right op
    syntax KItem ::= theXor(K, K, K) [strict] // Type, Left op, Right op

    //const exprs
    syntax ConstExpr ::= constCastAST(K, K, K, K) [strict(2,3,4)]
                             //op, type, val, type
                   | constBinAST(K, K, K, K, K)
                             //op, type, val, type, val
                   | constLogicAST(K, K, K, K, K)
                             //op, type, val, type, val
                   | blockAddAST(K, K) //val, val
                   | constIcmpAST(K, K, K, K, K) [strict(2,3,4,5)]
                             //op, type, val, type, val
                   | constFcmpAST(K, K, K, K, K) [strict(2,3,4,5)]
                             //op, type, val, type, val
                   | constExValueAST(K, K, ElemList) [strict(1,2)]
                             //type, val, index list
                   | constInValueAST(K, K, K, K, ElemList) [strict(1,2,3,4)]
                             //type, val, type, val, index list
                   | constSuffleAST(K, K, K, K, K, K) [strict]
                             //type, val, type, val, type, val
                   | constGepAST(K, K, ElemList) [strict(2,3)]
                             //op, ty, ty-val list
                   | constSelectAST(K, K, K, K, K, K) [strict]
                             //type, val, type, val, type, val
                   | constExElemAST(K, K, K, K) [strict]
                             //type, val, type, val
                   | constInElemAST(K, K, K, K, K, K) [strict]
                             //type, val, type, val, type, val

endmodule
