//
requires "llvm-syntax.k"
requires "llvm-abstractsyntax.k"
requires "llvm-settings.k"

module LLVM-HELPERS
    imports LLVM-SYNTAX
    imports LLVM-ABSTRACTSYNTAX
    imports LLVM-SETTINGS

    //deal with zeroinitializer
    syntax KItem ::= dealWithZero(K, K) [function] //t,v
    rule dealWithZero(T:K, zeroinitializer)
              => dealWithZeroInitializer(T)
    rule dealWithZero(T:K, A:K) => A [owise]

    syntax KItem ::= dealWithUndef(K) [function]//t, v
                   | undefVectorAux(K, K, K)  [function]
                   | undefArrayAux(K, K, K)   [function]
                   | dealWithUndefAux(TypeList) [function]
    
    rule dealWithUndef(vectorTypeValue(T:K, N:Int))
            => vectorValue(undefVectorAux(T:K, N:Int, .ElemList))
    rule dealWithUndef(A:K) => undef
         requires notBool isArrayType(A) andBool notBool isVectorType(A)
             andBool notBool isStructType(A)
    rule dealWithUndef(arrayTypeValue(T:K, N:Int))
           => arrayValue(undefVectorAux(T, N, .ElemList))
    rule dealWithUndef(structTypeValue(Ts:K))
           => constStructVal(dealWithUndefAux(Ts))
    rule dealWithUndef(packedStructTypeValue(Ts:K))
           => packedStructVal(dealWithUndefAux(Ts))

    rule undefVectorAux(T, N:Int, Es:ElemList) => Es
         requires N ==Int 0
    rule undefVectorAux(T, N:Int, Es:ElemList)
               => undefVectorAux(T, N -Int 1, valValue(dealWithUndef(T)),Es)
         requires N >Int 0
    rule undefArrayAux(T, N:Int, Es:ElemList) => Es
         requires N ==Int 0
    rule undefArrayAux(T, N:Int, Es:ElemList)
               => undefArrayAux(T, N -Int 1, valValue(dealWithUndef(T)),Es)
         requires N >Int 0

    rule dealWithUndefAux(.TypeList) => .ElemList
    rule dealWithUndefAux(T:K, Ts:TypeList)
            => valValue(dealWithUndef(T)), dealWithUndefAux(Ts)

    syntax KItem ::= dealWithZeroInitializer(K) [function]//t, v
                   | zeroVectorAux(K, K, K)  [function]
                   | zeroArrayAux(K, K, K)   [function]
                   | dealWithZeroInitializerAux(TypeList) [function]
    rule dealWithZeroInitializer(vectorTypeValue(T:K, N:Int))
            => vectorValue(zeroVectorAux(T:K, N:Int, .ElemList))
    rule dealWithZeroInitializer(integerType(N:Int)) => 0
    rule dealWithZeroInitializer(A:K) => posZero
         requires isFloatType(A)
    rule dealWithZeroInitializer(pointerTypeValue(X:K, Y:K))
               => loc(nullMemoryLoc, void,
                          value(nullMemoryLoc,nullMemoryLoc),heap, none, none)
    rule dealWithZeroInitializer(arrayTypeValue(T:K, N:Int))
           => arrayValue(zeroArrayAux(T, N, .ElemList))
    rule dealWithZeroInitializer(structTypeValue(Ts:K))
           => constStructVal(dealWithZeroInitializerAux(Ts))
    rule dealWithZeroInitializer(packedStructTypeValue(Ts:K))
           => packedStructVal(dealWithZeroInitializerAux(Ts))

    rule dealWithZeroInitializerAux(.TypeList) => .ElemList
    rule dealWithZeroInitializerAux(T:K, Ts:TypeList)
            => valValue(dealWithZeroInitializer(T)), dealWithZeroInitializerAux(Ts)

    rule zeroVectorAux(T, N:Int, Es:ElemList) => Es
         requires N ==Int 0
    rule zeroVectorAux(T, N:Int, Es:ElemList)
               => zeroVectorAux(T, N -Int 1, valValue(dealWithZeroInitializer(T)),Es)
         requires N >Int 0
    rule zeroArrayAux(T, N:Int, Es:ElemList) => Es
         requires N ==Int 0
    rule zeroArrayAux(T, N:Int, Es:ElemList)
               => zeroArrayAux(T, N -Int 1, valValue(dealWithZeroInitializer(T)),Es)
         requires N >Int 0

    //helper functions for type checking phi functions, switches and gep
    syntax ElemList ::= getValueOfPhi(PHIList) [function]
                   | getLabelOfPhi(PHIList) [function]
                   | formTypeCaseSwitch(JumpTable) [function]
    syntax KItem ::= getVar(K)    [function]
                   | getGepTypeInStruct(K, Int)           [function]

    syntax Set ::= getInrange(K) [function]
    rule getInrange(.ElemList) => .Set
    rule getInrange(valValue(typeOperandGepVal(inrange, T:K, V:K)), Es:ElemList)
              => SetItem(inrange)
    rule getInrange(valValue(typeOperandGepVal(.K, T:K, V:K)), Es:ElemList)
              => getInrange(Es)

    //use for undef in getelementptr
    syntax KItem ::= toInrangeFlag(Set) [function]
    rule toInrangeFlag(.Set) => none
    rule toInrangeFlag(SetItem(inrange)) => badRange

    syntax KItem ::= mergeInrangeFlags(K,K) [function]
    rule mergeInrangeFlags(A:K, B:K) => badRange
         requires A ==K badRange orBool B ==K badRange
    rule mergeInrangeFlags(A:K, B:K) => inrange
         requires A =/=K badRange andBool B =/=K badRange
            andBool (A ==K inrange orBool B ==K inrange)
    rule mergeInrangeFlags(none, none) => none

    //gepOperand to gepOperandResult
    rule gepOperand(A:K, T:KResult, V:Int)
              => gepOperandResult(A, deNormalizingInt(
                   T, normalizingInt(T, V)))
         requires isIntegerType(T)

    //a function to calculate a constant integer value by input constant expr
    syntax KItem ::= getConstIntValue(K, Int) [function]
    rule getConstIntValue(A:Int, N:Int) => deNormalizingInt(
                   integerType(N), normalizingInt(integerType(N), A))
    rule getConstIntValue(intLoc(A:Int, B:K, C:K, D:K, E:K), N:Int)
           => intLoc(deNormalizingInt(
                   integerType(N), normalizingInt(integerType(N), A)), B, C, D, E)
    rule getConstIntValue(constBinAST(Op:BinaryIntOps, T1:K, V1:K, T2:K, V2:K), N:Int)
          => getConstIntValue(constBinAST(getMainOp(Op), T1, V1, T2, V2), N)
    rule getConstIntValue(constBinAST('add(.KList), T1:K, V1:K, T2:K, V2:K), N:Int)
           => deNormalizingInt(integerType(N), normalizingInt(integerType(N), 
                  getConstIntValue(V1, N) +Int getConstIntValue(V2, N)))
    rule getConstIntValue(constBinAST('sub(.KList), T1:K, V1:K, T2:K, V2:K), N:Int)
           => deNormalizingInt(integerType(N), normalizingInt(integerType(N),
                      getConstIntValue(V1, N) -Int getConstIntValue(V2, N)))
    rule getConstIntValue(A:K, N:Int) => badValue [owise]

    syntax KItem ::= getConstIntShuffle(K, Int) [function]
    rule getConstIntShuffle(undef, N:Int) => undef
    rule getConstIntShuffle(A:K, N:Int) => getConstIntValue(A, N) [owise]


    //for type check swtich
    rule typeCase(integerType(N:Int), A:K, L:K)
            => typedCase(integerType(N:Int), getConstIntValue(A, N), L)
    rule typeCase(T:KResult, A:K, L:K) => badValue
         requires notBool isIntegerType(T)

    syntax Bool ::= isAggregateType(K) [function]
    rule isAggregateType(structTypeValue(A:K)) => true
    rule isAggregateType(packedStructTypeValue(A:K)) => true
    rule isAggregateType(arrayTypeValue(A:K, B:K)) => true
    rule isAggregateType(vectorTypeValue(A:K, B:K)) => true
    rule isAggregateType(A:K) => false [owise]

    rule formTypeCaseSwitch(.JumpTable) => .ElemList
    rule formTypeCaseSwitch(T:IntType V:ConstValueRef, label La:ValueRef Ju:JumpTable)
           => val(typeCase(T, addNameToString(V), addNameToString(La))),formTypeCaseSwitch(Ju)

    rule getValueOfPhi([ V:ValueRef , L:ValueRef ]) => val(addNameToString(V)),.ElemList
    rule getValueOfPhi([ V:ValueRef , L:ValueRef ], Pl:PHIList)
                                         => val(addNameToString(V)),getValueOfPhi(Pl)
    rule getLabelOfPhi([ V:ValueRef , L:ValueRef ]) => val(addNameToString(L)),.ElemList
    rule getLabelOfPhi([ V:ValueRef , L:ValueRef ], Pl:PHIList)
                                         => val(addNameToString(L)),getLabelOfPhi(Pl)

    rule getVar(assign(A:K, B:K)) => A
    rule getVar(K:K) => .K [owise]

    rule getGepTypeInStruct(T1:KResult, T2:TypeList, 0) => T1
    rule getGepTypeInStruct(T1:KResult, T2:TypeList, I:Int)
               => getGepTypeInStruct(T2, I -Int 1)
         requires I >Int 0
    rule getGepTypeInStruct(T:K, I:Int) => badType [owise]

    //use in the gep calcuation 
    syntax Int ::= calGepInStruct(Int, TypeList, Int) [function]
    rule calGepInStruct(New:Int, T:KResult, T2:TypeList, 0) => New
    rule calGepInStruct(New:Int, T:KResult, T2:TypeList, N:Int)
           => calGepInStruct(New +Int sizeof(T), T2, N -Int 1)
         requires N >Int 0 andBool structAlign dividesInt New 
    rule calGepInStruct(New:Int, T:KResult, T2:TypeList, N:Int)
           => calGepInStruct((New /Int structAlign) *Int structAlign
                  +Int structAlign +Int sizeof(T), T2, N -Int 1)
         requires N >Int 0 andBool notBool (structAlign dividesInt New)
    rule calGepInStruct(New:Int, T:K, N:Int) => badValue [owise]

    syntax Int ::= calGepInPackedStruct(Int, TypeList, Int) [function]
    rule calGepInPackedStruct(New:Int, T:KResult, T2:TypeList, 0) => New
    rule calGepInPackedStruct(New:Int, T:KResult, T2:TypeList, N:Int)
           => calGepInPackedStruct(New +Int sizeof(T), T2, N -Int 1)
         requires N >Int 0
    rule calGepInPackedStruct(New:Int, T:K, N:Int) => badValue [owise]

    syntax KItem ::= searchElemInMap(Map,K,K) [function]

    rule searchElemInMap(.Map,.K, _:K) => none
    rule searchElemInMap(M:Map, .K, Key':K)
         => searchElemInMap(M, choice(M), Key')
         when size(M) =/=Int 0
    rule searchElemInMap(M:Map,Key:K,Key:K)
         => M[Key]
    rule searchElemInMap(M:Map,Key:K,Key':K)
         => searchElemInMap(removeAll(M,SetItem(Key)),.K,Key')
         when Key =/=K Key' andBool Key =/=K .K

    syntax Bool ::= typeMatchInDefs(K,K,K,Set) //type, var name, varop, Set of varops
    rule typeMatchInDefs(T:K, V:K, varOp(B:K, N:K, T, V), S:Set) => true
    rule typeMatchInDefs(T:K, V:K, varOp(B:K, N:K, T', V'), S:Set)
         => typeMatchInDefs(T:K, V:K, .K, S:Set)
         requires T =/=K T' andBool V =/=K V'
    rule typeMatchInDefs(T:K, V:K, .K, SetItem(X:K) S:Set)
         => typeMatchInDefs(T:K, V:K, X, S:Set)
    rule typeMatchInDefs(T:K, V:K, .K, .Set) => false

    syntax Bool ::= isInDefs(K,K,Set) [function]//var name, varop, Set of varops
    rule isInDefs(V:K, varOp(B:K, N:K, T:K, V:K), S:Set) => true
    rule isInDefs(V:K, varOp(B:K, N:K, T':K, V':K), S:Set)
         => isInDefs(V:K, .K, S:Set)
         requires V =/=K V'
    rule isInDefs(V:K, .K, SetItem(X:K) S:Set)
         => isInDefs(V:K, X, S:Set)
    rule isInDefs(V:K, .K, .Set) => false

    syntax Bool ::= isInDefsWithType(K, K, Set) [function]
                 //operand, varop, set
    rule isInDefsWithType(A:K, .K, .Set) => false
    rule isInDefsWithType(A:K, .K, SetItem(X:K) S:Set)
              => isInDefsWithType(A, X, S)
    rule isInDefsWithType(operand(T:K, V:K),
            varOp(B:K, N:K, T:K, V:K), S:Set)
            => true
    rule isInDefsWithType(operand(T:K, V:K),
            varOp(B:K, N:K, T':K, V':K), S:Set)
            => isInDefsWithType(operand(T, V), .K, S)
         requires T =/=K T' orBool V =/=K V'

    syntax Bool ::= isHexDigit(String) [function]
    rule isHexDigit(A:String) =>
          ((ordChar(A) >=Int ordChar("0"))
           andBool (ordChar(A) <=Int ordChar("9")))
             orBool ((ordChar(A) >=Int ordChar("A"))
                     andBool (ordChar(A) <=Int ordChar("F")))
         requires lengthString(A) ==Int 1
    rule isHexDigit(A:String) => false [owise]

    syntax Bool ::= isDecDigit(String)  [function]
    rule isDecDigit(A:String) => ((ordChar(A) >=Int ordChar("0"))
           andBool (ordChar(A) <=Int ordChar("9")))
         requires lengthString(A) ==Int 1
    rule isDecDigit(A:String) => false [owise]

    syntax Bool ::= isIntString(String) [function]
                  | isAInt(K)           [function]
    rule isIntString(A) => false
         requires lengthString(A) ==Int 0
    rule isIntString(A) => true
         requires lengthString(A) ==Int 1
                  andBool ((ordChar(A) >=Int ordChar("0"))
                  andBool (ordChar(A) <=Int ordChar("9")))
    rule isIntString(A) => false
         requires lengthString(A) >=Int 1
                  andBool ((ordChar(substrString(A, 0, 1))
                                                 <Int ordChar("0"))
                  orBool (ordChar(substrString(A, 0, 1))
                                                >Int ordChar("9")))
    rule isIntString(A) => isIntString(substrString(A,
                                          1, lengthString(A)))
         requires lengthString(A) >Int 1
                  andBool ((ordChar(substrString(A, 0, 1))
                                                 >=Int ordChar("0"))
                  andBool (ordChar(substrString(A, 0, 1))
                                                <=Int ordChar("9")))

    rule isAInt(I:Int) => true
    rule isAInt(K:K) => false [owise]

    syntax List ::= formInstList(Int, K, Map) [function]
    rule formInstList(N, .K, .Map) => .List
    rule formInstList(N, .K, (N:K |-> V:K) M:Map)
         => formInstList(N, V, M)
    rule formInstList(N:Int, instNumInfo(Num:K, In:K, T:K), M:Map)
        => ListItem(instNumInfo(Num, In, T)) formInstList(N +Int 1, .K, M)

    //get all mem ops, partial function
    syntax KItem ::= findFatherMemProto(K, K, Map) [function]
    rule findFatherMemProto(none, .K, M:Map) => none
    rule findFatherMemProto(A:Int, .K, M:Map) => none
         requires notBool A in keys(M)
    rule findFatherMemProto(A:Int, .K, (A |-> B:K) M:Map)
              => findFatherMemProto(A, B, M)
    rule findFatherMemProto(A:Int, runBlock(C:Int, N:K, F:K,
           .List, S1:Set, S2:Set), M:Map)
          => findFatherMemProto(F, .K, M)
    rule findFatherMemProto(A:Int, runBlock(C:Int, N:K, F:K,
           L:List ListItem(memProto(Inst:Int, Op:K, OM:Map, Fl:K)), S1:Set, S2:Set), M:Map)
              => pairResult(A, Op)

    //get mem op from a list of ops
    syntax KItem ::= toMemElem(K, Loc) [function]
    rule toMemElem(instNumInfo(TheCount:Int, noAssign(
                  instruction(store(T1:K, V1:K,T2:K, V2:K, Align:K),
                       Mods:Set, Meta:K)),storeInst), Va:Loc)
            => pairResult(TheCount, toWrite(V2, none))
         requires getOrdering(.K, Mods) ==K .K
    rule toMemElem(instNumInfo(TheCount:Int, noAssign(
                  instruction(store(T1:K, V1:K,T2:K, V2:K, Align:K),
                       Mods:Set, Meta:K)),storeInst), Va:Loc)
               => pairResult(TheCount, toWrite(V2, getOrdering(.K, Mods)))
         requires getOrdering(.K, Mods) =/=K .K
    rule toMemElem(instNumInfo(TheCount:Int,assign(X:K,
                   instruction(load(T:K, V:K, Align:Int),
                  Mods:Set, Meta:K)),loadInst), Va:Loc)
           => pairResult(TheCount, toRead(V, none))
         requires getOrdering(.K, Mods) ==K .K
    rule toMemElem(instNumInfo(TheCount:Int,assign(X:K,
                   instruction(load(T:K, V:K, Align:Int),
                  Mods:Set, Meta:K)),loadInst), Va:Loc)
               => pairResult(TheCount, toRead(V, getOrdering(.K, Mods)))
         requires getOrdering(.K, Mods) =/=K .K
    rule toMemElem(instNumInfo(TheCount:Int, noAssign(
                  instruction(fence(Od:K), Mods, Meta:K)),fenceInst), Va:Loc)
             => pairResult(TheCount, fence(Od))
    rule toMemElem(instNumInfo(TheCount:Int, assign(X:K,
                  instruction(theVAArg(T1:K, V:K,T2:K)
                   ,Mods:Set, Meta)),readWriteInst), Va:Loc)
          => pairResult(TheCount, toReadWrite(SetItem(V) SetItem(Va), .List))
    rule toMemElem(instNumInfo(TheCount:Int, assign(X:K,
                  instruction(cmpxchg(operand(T1:K, V1:K), TV2:K, TV3:K, Or1:K, Or2:K)
                   ,Mods:Set, Meta)),readWriteInst), Va:Loc)
          => pairResult(TheCount, toReadWrite(SetItem(V1), ListItem(Or1) ListItem(Or2)))
    rule toMemElem(instNumInfo(TheCount:Int, assign(X:K,
                  instruction(atomicrmw(B:K, operand(T1:K, V1:K), TV2:K, Or:K)
                   ,Mods:Set, Meta)),readWriteInst), Va:Loc)
          => pairResult(TheCount, toReadWrite(SetItem(V1), ListItem(Or)))
    rule toMemElem(A:K, Va:Loc) => none [owise]

    syntax KItem ::= getMemOps(Int, List, K, List, K, K, Loc) [function]
            //blockid,finish, cur, toGet, pre-op

    rule getMemOps(Bn:Int, L:List, .K, .List, Pre:K, Re:K, Loc:Loc)
                => pairResultList(pairResult(Bn, Re), L)
         requires Re =/=K .K
    rule getMemOps(Bn:Int, L:List, .K, .List, Pre:K, .K, Loc:Loc) => pairResultList(none, L)
    rule getMemOps(Bn:Int, L:List, .K, ListItem(Op:K) S:List, Pre:K, Re:K, Loc:Loc)
          => getMemOps(Bn:Int, L, toMemElem(Op, Loc), S, Pre, Re, Loc:Loc)
    rule getMemOps(Bn:Int, L:List, none, S:List, Pre:K, Re:K, Loc:Loc)
              => getMemOps(Bn:Int, L, .K, S, Pre, Re, Loc:Loc)
    rule getMemOps(Bn:Int, L:List, pairResult(
                      Count:Int, toRead(V:K, Od:K)), S:List, Pre:K, Re:K, Loc:Loc)
         => getMemOps(Bn:Int, L ListItem(memProto(
           Count, toRead(V:K, Od:K), .Map, false)), .K, S, Pre, Re, Loc:Loc)
    rule getMemOps(Bn:Int, L:List,
                       pairResult(Count:Int, fence(release)), S:List, Pre:K, Re:K, Loc:Loc)
         => getMemOps(Bn:Int, L ListItem(memProto(
              Count, fence(release), .Map, true)), .K, S, Pre, Re, Loc:Loc)
    //when fence is an acquire, then it is safe, and we must look at the next one
    //deal with cases when a read or a read write following by a fence
    rule getMemOps(Bn:Int, L:List ListItem(
                    memProto(Count:Int, toRead(V:K, Od:K), SM:Map, Fl:K)),
              pairResult(Count':Int, fence(acquire)), S:List, Pre:K, Re:K, Loc:Loc)
             => getMemOps(Bn:Int, L ListItem(memProto(Count, toRead(V, Od), SM, Fl:K))
            ListItem(memProto(Count', acquireFence, .Map, true)), .K, S, Pre, Re, Loc:Loc)
         requires Od ==K unordered orBool Od ==K monotonic
                     orBool Od ==K release
    rule getMemOps(Bn:Int, L:List ListItem(
                   memProto(Count:Int, toRead(V:K, Od:K), SM:Map, Fl:K)),
             pairResult(Count':Int, fence(acquire)), S:List, Pre:K, Re:K, Loc:Loc)
                 => getMemOps(Bn:Int, L ListItem(memProto(Count, toRead(V:K, Od:K), SM, Fl:K))
                 ListItem(memProto(Count', fence(acquire), .Map, true)), .K, S, Pre, Re, Loc:Loc)
         requires Od =/=K unordered andBool Od =/=K monotonic
                     andBool Od =/=K release
    rule getMemOps(Bn:Int, L:List ListItem(memProto(Count:Int,
                toReadWrite(V:Set, ListItem(Od:K) OL:List), SM:Map, Fl:K)),
           pairResult(Count':Int, fence(acquire)), S:List, Pre:K, Re:K, Loc:Loc)
                 => getMemOps(Bn:Int, L ListItem(memProto(Count:Int,
                toReadWrite(V:Set, ListItem(Od:K) OL:List), SM:Map, Fl:K))
               ListItem(memProto(Count', acquireFence, .Map, true)), .K, S, Pre, Re, Loc:Loc)
         requires Od ==K unordered orBool Od ==K monotonic
                     orBool Od ==K release
    rule getMemOps(Bn:Int, L:List ListItem(
                     memProto(Count:Int, toReadWrite(V:Set, .List), SM:Map, Fl:K)),
             pairResult(Count':Int, fence(acquire)), S:List, Pre:K, Re:K, Loc:Loc)
                 => getMemOps(Bn:Int, L ListItem(memProto(Count:Int,
                          toReadWrite(V:Set, .List), SM:Map, Fl:K))
             ListItem(memProto(Count', fence(acquire),.Map, true)), .K, S, Pre, Re, Loc:Loc)
    rule getMemOps(Bn:Int, L:List ListItem(
                     memProto(Count:Int, toReadWrite(V:Set,
                        ListItem(Od:K) OL:List), SM:Map, Fl:K)),
             pairResult(Count':Int, fence(acquire)), S:List, Pre:K, Re:K, Loc:Loc)
                 => getMemOps(Bn:Int, L ListItem(memProto(Count:Int,
                   toReadWrite(V:Set, ListItem(Od:K) OL:List), SM:Map, Fl:K))
             ListItem(memProto(Count', fence(acquire),.Map, true)), .K, S, Pre, Re, Loc:Loc)
         requires Od =/=K unordered andBool Od =/=K monotonic
                     andBool Od =/=K release

    //if the fence op is the first in the block
    rule getMemOps(Bn:Int, .List, pairResult(
                Count:Int, fence(acquire)), S:List, toRead(V:K, Od:K), Re:K, Loc:Loc)
                 => getMemOps(Bn:Int, ListItem(memProto(Count, acquireFence, .Map, true)),
                        .K, S, toRead(V:K, Od:K), Re, Loc:Loc)
         requires Od ==K unordered orBool Od ==K monotonic
                     orBool Od ==K release
    rule getMemOps(Bn:Int, .List, pairResult(
               Count:Int, fence(acquire)), S:List, toRead(V:K, Od:K), Re:K, Loc:Loc)
                 => getMemOps(Bn:Int, ListItem(memProto(Count, fence(acquire),.Map, true)),
                        .K, S, toRead(V:K, Od:K), Re, Loc:Loc)
         requires Od =/=K unordered andBool Od =/=K monotonic
                     andBool Od =/=K release
    rule getMemOps(Bn:Int, .List, pairResult(
                Count:Int, fence(acquire)), S:List,
                  toReadWrite(V:Set, ListItem(Od:K) OL:List), Re:K, Loc:Loc)
                 => getMemOps(Bn:Int, ListItem(memProto(Count, acquireFence, .Map, true)),
                        .K, S, toReadWrite(V:Set, ListItem(Od:K) OL:List), Re, Loc:Loc)
         requires Od ==K unordered orBool Od ==K monotonic
                     orBool Od ==K release
    rule getMemOps(Bn:Int, .List, pairResult(
               Count:Int, fence(acquire)), S:List,
                 toReadWrite(V:Set, .List), Re:K, Loc:Loc)
                 => getMemOps(Bn:Int, ListItem(memProto(Count, fence(acquire),.Map, true)),
                        .K, S, toReadWrite(V:Set, .List), Re, Loc:Loc)
    rule getMemOps(Bn:Int, .List, pairResult(
               Count:Int, fence(acquire)), S:List,
                 toReadWrite(V:Set, ListItem(Od:K) OL:List), Re:K, Loc:Loc)
                 => getMemOps(Bn:Int, ListItem(memProto(Count, fence(acquire),.Map, true)),
                        .K, S, toReadWrite(V:Set, ListItem(Od:K) OL:List), Re, Loc:Loc)
         requires Od =/=K unordered andBool Od =/=K monotonic
                     andBool Od =/=K release

    //deal with case when fence is a acq_rel
    rule getMemOps(Bn:Int, L:List ListItem(memProto(
                        Count:Int, toRead(V:K, Od:K), SM:Map, Fl:K)),
              pairResult(Count':Int, fence(acq_rel)), S:List, Pre:K, Re:K, Loc:Loc)
             => getMemOps(Bn:Int, L ListItem(memProto(Count, toRead(V, Od), SM, Fl:K))
              ListItem(memProto(Count', readRWFence, .Map, true)), .K, S, Pre, Re, Loc:Loc)
         requires Od ==K unordered orBool Od ==K monotonic
                     orBool Od ==K release
    rule getMemOps(Bn:Int, L:List ListItem(
                   memProto(Count:Int, toRead(V:K, Od:K), SM:Map, Fl:K)),
             pairResult(Count':Int, fence(acq_rel)), S:List, Pre:K, Re:K, Loc:Loc)
                 => getMemOps(Bn:Int, L ListItem(memProto(Count, toRead(V:K, Od:K), SM, Fl:K))
                 ListItem(memProto(Count', fence(acq_rel), .Map, true)), .K, S, Pre, Re, Loc:Loc)
         requires Od =/=K unordered andBool Od =/=K monotonic
                     andBool Od =/=K release
    rule getMemOps(Bn:Int, L:List ListItem(memProto(Count:Int,
            toReadWrite(V:Set, ListItem(Od:K) OL:List), SM:Map, Fl:K)),
           pairResult(Count':Int, fence(acq_rel)), S:List, Pre:K, Re:K, Loc:Loc)
                 => getMemOps(Bn:Int, L ListItem(memProto(Count:Int,
                    toReadWrite(V:Set, ListItem(Od:K) OL:List), SM:Map, Fl:K))
               ListItem(memProto(Count', readRWFence, .Map, true)), .K, S, Pre, Re, Loc:Loc)
         requires Od ==K unordered orBool Od ==K monotonic
                     orBool Od ==K release
    rule getMemOps(Bn:Int, L:List ListItem(memProto(Count:Int,
                       toReadWrite(V:Set, .List), SM:Map, Fl:K)),
             pairResult(Count':Int, fence(acq_rel)), S:List, Pre:K, Re:K, Loc:Loc)
                 => getMemOps(Bn:Int, L ListItem(memProto(Count:Int,
                             toReadWrite(V:Set, .List), SM:Map, Fl:K))
             ListItem(memProto(Count', fence(acq_rel),.Map, true)), .K, S, Pre, Re, Loc:Loc)
    rule getMemOps(Bn:Int, L:List ListItem(memProto(Count:Int,
                       toReadWrite(V:Set, ListItem(Od:K) OL:List), SM:Map, Fl:K)),
             pairResult(Count':Int, fence(acq_rel)), S:List, Pre:K, Re:K, Loc:Loc)
                 => getMemOps(Bn:Int, L ListItem(memProto(Count:Int,
                             toReadWrite(V:Set, ListItem(Od:K) OL:List), SM:Map, Fl:K))
             ListItem(memProto(Count', fence(acq_rel),.Map, true)), .K, S, Pre, Re, Loc:Loc)
         requires Od =/=K unordered andBool Od =/=K monotonic
                     andBool Od =/=K release

    //if the acq_rel fence op is the first in the block
    rule getMemOps(Bn:Int, .List, pairResult(
                Count:Int, fence(acq_rel)), S:List, toRead(V:K, Od:K), Re:K, Loc:Loc)
                 => getMemOps(Bn:Int, ListItem(memProto(Count, readRWFence, .Map, true)),
                        .K, S, toRead(V:K, Od:K), Re, Loc:Loc)
         requires Od ==K unordered orBool Od ==K monotonic
                     orBool Od ==K release
    rule getMemOps(Bn:Int, .List, pairResult(
               Count:Int, fence(acq_rel)), S:List, toRead(V:K, Od:K), Re:K, Loc:Loc)
                 => getMemOps(Bn:Int, ListItem(memProto(Count, fence(acq_rel),.Map, true)),
                        .K, S, toRead(V:K, Od:K), Re, Loc:Loc)
         requires Od =/=K unordered andBool Od =/=K monotonic
                     andBool Od =/=K release
    rule getMemOps(Bn:Int, .List, pairResult(
                Count:Int, fence(acq_rel)), S:List,
                       toReadWrite(V:Set, ListItem(Od:K) OL:List), Re:K, Loc:Loc)
                 => getMemOps(Bn:Int, ListItem(memProto(Count, readRWFence, .Map, true)),
                        .K, S, toReadWrite(V:Set, ListItem(Od:K) OL:List), Re, Loc:Loc)
         requires Od ==K unordered orBool Od ==K monotonic
                     orBool Od ==K release
    rule getMemOps(Bn:Int, .List, pairResult(
               Count:Int, fence(acq_rel)), S:List,
                      toReadWrite(V:Set, .List), Re:K, Loc:Loc)
                 => getMemOps(Bn:Int, ListItem(memProto(Count, fence(acq_rel),.Map, true)),
                        .K, S, toReadWrite(V:Set, .List), Re, Loc:Loc)
    rule getMemOps(Bn:Int, .List, pairResult(
               Count:Int, fence(acq_rel)), S:List,
                      toReadWrite(V:Set, ListItem(Od:K) OL:List), Re:K, Loc:Loc)
                 => getMemOps(Bn:Int, ListItem(memProto(Count, fence(acq_rel),.Map, true)),
                        .K, S, toReadWrite(V:Set,
                               ListItem(Od:K) OL:List), Re, Loc:Loc)
         requires Od =/=K unordered andBool Od =/=K monotonic
                     andBool Od =/=K release

    //deal with case when fence is a seq
    rule getMemOps(Bn:Int, L:List ListItem(memProto(
                  Count:Int, toRead(V:K, Od:K), SM:Map, Fl:K)),
              pairResult(Count':Int, fence(seq_cst)), S:List, Pre:K, Re:K, Loc:Loc)
             => getMemOps(Bn:Int, L ListItem(memProto(Count, toRead(V, Od), SM, Fl:K))
         ListItem(memProto(Count', readSeqFence, .Map, false)), .K, S, Pre, Re, Loc:Loc)
         requires Od ==K unordered orBool Od ==K monotonic
                     orBool Od ==K release
    rule getMemOps(Bn:Int, L:List ListItem(
                   memProto(Count:Int, toRead(V:K, Od:K), SM:Map, Fl:K)),
             pairResult(Count':Int, fence(seq_cst)), S:List, Pre:K, Re:K, Loc:Loc)
                 => getMemOps(Bn:Int, L ListItem(memProto(Count, toRead(V:K, Od:K), SM, Fl:K))
          ListItem(memProto(Count', fence(seq_cst), .Map, false)), .K, S, Pre, Re, Loc:Loc)
         requires Od =/=K unordered andBool Od =/=K monotonic
                     andBool Od =/=K release
    rule getMemOps(Bn:Int, L:List ListItem(memProto(Count:Int, toReadWrite(V:Set,
                                  ListItem(Od:K) OL:List), SM:Map, Fl:K)),
           pairResult(Count':Int, fence(seq_cst)), S:List, Pre:K, Re:K, Loc:Loc)
                 => getMemOps(Bn:Int, L ListItem(
                  memProto(Count:Int, toReadWrite(V:Set,
                                ListItem(Od:K) OL:List), SM:Map, Fl:K))
               ListItem(memProto(Count', readSeqFence, .Map, false)), .K, S, Pre, Re, Loc:Loc)
         requires Od ==K unordered orBool Od ==K monotonic
                     orBool Od ==K release
    rule getMemOps(Bn:Int, L:List ListItem(
                     memProto(Count:Int, toReadWrite(V:Set, .List), SM:Map, Fl:K)),
             pairResult(Count':Int, fence(seq_cst)), S:List, Pre:K, Re:K, Loc:Loc)
                 => getMemOps(Bn:Int, L ListItem(memProto(Count:Int,
                          toReadWrite(V:Set, .List), SM:Map, Fl:K))
             ListItem(memProto(Count', fence(seq_cst),.Map, false)), .K, S, Pre, Re, Loc:Loc)
    rule getMemOps(Bn:Int, L:List ListItem(
                     memProto(Count:Int, toReadWrite(
                             V:Set, ListItem(Od:K) OL:List), SM:Map, Fl:K)),
             pairResult(Count':Int, fence(seq_cst)), S:List, Pre:K, Re:K, Loc:Loc)
                 => getMemOps(Bn:Int, L ListItem(memProto(Count:Int,
                          toReadWrite(V:Set, ListItem(Od:K) OL:List), SM:Map, Fl:K))
             ListItem(memProto(Count', fence(seq_cst),.Map, false)), .K, S, Pre, Re, Loc:Loc)
         requires Od =/=K unordered andBool Od =/=K monotonic
                     andBool Od =/=K release

    //if the seq_cst fence op is the first in the block
    rule getMemOps(Bn:Int, .List, pairResult(
                Count:Int, fence(seq_cst)), S:List, toRead(V:K, Od:K), Re:K, Loc:Loc)
                 => getMemOps(Bn:Int, ListItem(memProto(Count, readSeqFence, .Map, false)),
                        .K, S, toRead(V:K, Od:K), Re, Loc:Loc)
         requires Od ==K unordered orBool Od ==K monotonic
                     orBool Od ==K release
    rule getMemOps(Bn:Int, .List, pairResult(
               Count:Int, fence(seq_cst)), S:List, toRead(V:K, Od:K), Re:K, Loc:Loc)
                 => getMemOps(Bn:Int, ListItem(memProto(Count, fence(seq_cst),.Map, false)),
                        .K, S, toRead(V:K, Od:K), Re, Loc:Loc)
         requires Od =/=K unordered andBool Od =/=K monotonic
                     andBool Od =/=K release
    rule getMemOps(Bn:Int, .List, pairResult(
                Count:Int, fence(seq_cst)), S:List,
                        toReadWrite(V:Set, ListItem(Od:K) OL:List), Re:K, Loc:Loc)
                 => getMemOps(Bn:Int, ListItem(memProto(Count, readSeqFence, .Map, false)),
                        .K, S, toReadWrite(V:Set, ListItem(Od:K) OL:List), Re, Loc:Loc)
         requires Od ==K unordered orBool Od ==K monotonic
                     orBool Od ==K release
    rule getMemOps(Bn:Int, .List, pairResult(
               Count:Int, fence(seq_cst)), S:List,
                        toReadWrite(V:Set, .List), Re:K, Loc:Loc)
                 => getMemOps(Bn:Int, ListItem(memProto(Count, fence(seq_cst),.Map, false)),
                        .K, S, toReadWrite(V:Set, .List), Re, Loc:Loc)
    rule getMemOps(Bn:Int, .List, pairResult(
               Count:Int, fence(seq_cst)), S:List,
                        toReadWrite(V:Set, ListItem(Od:K) OL:List), Re:K, Loc:Loc)
                 => getMemOps(Bn:Int, ListItem(memProto(Count, fence(seq_cst),.Map, false)),
                        .K, S, toReadWrite(V:Set, ListItem(Od:K) OL:List), Re, Loc:Loc)
         requires Od =/=K unordered andBool Od =/=K monotonic
                     andBool Od =/=K release

    //if there is a store op
    rule getMemOps(Bn:Int, L:List ListItem(memProto(Count:Int, fence(release), SM:Map, Fl:K)),
              pairResult(Count':Int, toWrite(V:K, Od:K)), S:List, Pre:K, Re:K, Loc:Loc)
             => getMemOps(Bn:Int, L ListItem(memProto(Count, releaseFence, SM, Fl:K))
        ListItem(memProto(Count', toWrite(V:K, Od:K), .Map, false)), .K, S, Pre, Re, Loc:Loc)
         requires Od ==K unordered orBool Od ==K monotonic
                     orBool Od ==K acquire
    rule getMemOps(Bn:Int, L:List ListItem(memProto(Count:Int, fence(release), SM:Map, Fl:K)),
              pairResult(Count':Int, toWrite(V:K, Od:K)), S:List, Pre:K, Re:K, Loc:Loc)
                 => getMemOps(Bn:Int, L ListItem(memProto(Count, fence(release), SM, Fl:K))
         ListItem(memProto(Count', toWrite(V:K, Od:K), .Map, false)), .K, S, Pre, Re, Loc:Loc)
         requires Od =/=K unordered andBool Od =/=K monotonic
                     andBool Od =/=K acquire
    rule getMemOps(Bn:Int, L:List ListItem(memProto(Count:Int, fence(release), SM:Map, Fl:K)),
           pairResult(Count':Int, toReadWrite(V:Set,
                         ListItem(Od:K) OL:List)), S:List, Pre:K, Re:K, Loc:Loc)
                 => getMemOps(Bn:Int, L ListItem(memProto(Count:Int, releaseFence, SM:Map, Fl:K))
        ListItem(memProto(Count', toReadWrite(V:Set,
                     ListItem(Od:K) OL:List), .Map, false)), .K, S, Pre, Re, Loc:Loc)
         requires Od ==K unordered orBool Od ==K monotonic
                     orBool Od ==K acquire
    rule getMemOps(Bn:Int, L:List ListItem(memProto(Count:Int, fence(release), SM:Map, Fl:K)),
             pairResult(Count':Int, toReadWrite(V:Set,
                         .List)), S:List, Pre:K, Re:K, Loc:Loc)
                 => getMemOps(Bn:Int, L ListItem(
                            memProto(Count:Int, fence(release), SM:Map, Fl:K))
      ListItem(memProto(Count', toReadWrite(V:Set,
                      .List),.Map, false)), .K, S, Pre, Re, Loc:Loc)
    rule getMemOps(Bn:Int, L:List ListItem(memProto(Count:Int, fence(release), SM:Map, Fl:K)),
             pairResult(Count':Int, toReadWrite(V:Set,
                        ListItem(Od:K) OL:List)), S:List, Pre:K, Re:K, Loc:Loc)
                 => getMemOps(Bn:Int, L ListItem(
                            memProto(Count:Int, fence(release), SM:Map, Fl:K))
      ListItem(memProto(Count', toReadWrite(V:Set,
                      ListItem(Od:K) OL:List),.Map, false)), .K, S, Pre, Re, Loc:Loc)
         requires Od =/=K unordered andBool Od =/=K monotonic
                     andBool Od =/=K acquire
    //if the store op is the first in the block
    rule getMemOps(Bn:Int, .List, pairResult( Count:Int, toWrite(V:K, Od:K)),
                S:List, fence(release), Re:K, Loc:Loc)
                 => getMemOps(Bn:Int, ListItem(memProto(Count, toWrite(V:K, Od:K), .Map, false)),
                        .K, S, fence(release), releaseFence, Loc:Loc)
         requires Od ==K unordered orBool Od ==K monotonic
                     orBool Od ==K release
    rule getMemOps(Bn:Int, .List, pairResult(Count:Int, toWrite(V:K, Od:K)),
             S:List, fence(release), Re:K, Loc:Loc)
                 => getMemOps(Bn:Int, ListItem(memProto(Count, toWrite(V:K, Od:K),.Map, false)),
                        .K, S, fence(release), Re, Loc:Loc)
         requires Od =/=K unordered andBool Od =/=K monotonic
                     andBool Od =/=K release
    rule getMemOps(Bn:Int, .List, pairResult(Count:Int,
                         toReadWrite(V:Set, ListItem(Od:K) OL:List)),
                   S:List, fence(release), Re:K, Loc:Loc)
                 => getMemOps(Bn:Int, ListItem(memProto(Count,
                             toReadWrite(V:Set, ListItem(Od:K) OL:List), .Map, false)),
                        .K, S, fence(release), releaseFence, Loc:Loc)
         requires Od ==K unordered orBool Od ==K monotonic
                     orBool Od ==K release
    rule getMemOps(Bn:Int, .List, pairResult(Count:Int,
                  toReadWrite(V:Set, .List)),
                 S:List, fence(release), Re:K, Loc:Loc)
                 => getMemOps(Bn:Int, ListItem(memProto(Count,
                             toReadWrite(V:Set, .List),.Map, false)),
                        .K, S, fence(release), Re, Loc:Loc)
    rule getMemOps(Bn:Int, .List, pairResult(Count:Int,
                  toReadWrite(V:Set, ListItem(Od:K) OL:List)),
                 S:List, fence(release), Re:K, Loc:Loc)
                 => getMemOps(Bn:Int, ListItem(memProto(Count,
                             toReadWrite(V:Set, ListItem(Od:K) OL:List),.Map, false)),
                        .K, S, fence(release), Re, Loc:Loc)
         requires Od =/=K unordered andBool Od =/=K monotonic
                     andBool Od =/=K release

   //deal with case when fence is a acq_rel in the store op
    rule getMemOps(Bn:Int, L:List ListItem(memProto(Count:Int, fence(acq_rel), SM:Map, Fl:K)),
              pairResult(Count':Int, toWrite(V:K, Od:K)), S:List, Pre:K, Re:K, Loc:Loc)
             => getMemOps(Bn:Int, L ListItem(memProto(Count, writeRWFence, SM, Fl:K))
     ListItem(memProto(Count', toWrite(V:K, Od:K), .Map, false)), .K, S, Pre, Re, Loc:Loc)
         requires Od ==K unordered orBool Od ==K monotonic
                     orBool Od ==K acquire
    rule getMemOps(Bn:Int, L:List ListItem(memProto(Count:Int, fence(acq_rel), SM:Map, Fl:K)),
              pairResult(Count':Int, toWrite(V:K, Od:K)), S:List, Pre:K, Re:K, Loc:Loc)
                 => getMemOps(Bn:Int, L ListItem(memProto(Count, fence(acq_rel), SM, Fl:K))
          ListItem(memProto(Count', toWrite(V:K, Od:K), .Map, false)), .K, S, Pre, Re, Loc:Loc)
         requires Od =/=K unordered andBool Od =/=K monotonic
                     andBool Od =/=K acquire
    rule getMemOps(Bn:Int, L:List ListItem(memProto(Count:Int, fence(acq_rel), SM:Map, Fl:K)),
           pairResult(Count':Int, toReadWrite(V:Set,
                          ListItem(Od:K) OL:List)), S:List, Pre:K, Re:K, Loc:Loc)
                 => getMemOps(Bn:Int, L ListItem(memProto(Count:Int, writeRWFence, SM:Map, Fl:K))
               ListItem(memProto(Count', toReadWrite(V:Set,
                         ListItem(Od:K) OL:List), .Map, false)), .K, S, Pre, Re, Loc:Loc)
         requires Od ==K unordered orBool Od ==K monotonic
                     orBool Od ==K acquire
    rule getMemOps(Bn:Int, L:List ListItem(memProto(Count:Int, fence(acq_rel), SM:Map, Fl:K)),
             pairResult(Count':Int, toReadWrite(V:Set, .List)), S:List, Pre:K, Re:K, Loc:Loc)
                 => getMemOps(Bn:Int, L ListItem(
                            memProto(Count:Int, fence(acq_rel), SM:Map, Fl:K))
             ListItem(memProto(Count',
                  toReadWrite(V:Set, .List),.Map, false)), .K, S, Pre, Re, Loc:Loc)
    rule getMemOps(Bn:Int, L:List ListItem(memProto(Count:Int, fence(acq_rel), SM:Map, Fl:K)),
             pairResult(Count':Int, toReadWrite(V:Set,
                     ListItem(Od:K) OL:List)), S:List, Pre:K, Re:K, Loc:Loc)
                 => getMemOps(Bn:Int, L ListItem(
                            memProto(Count:Int, fence(acq_rel), SM:Map, Fl:K))
             ListItem(memProto(Count', toReadWrite(V:Set,
               ListItem(Od:K) OL:List),.Map, false)), .K, S, Pre, Re, Loc:Loc)
         requires Od =/=K unordered andBool Od =/=K monotonic
                     andBool Od =/=K acquire
    //if the store op is the first in the block of a acq_rel fence
    rule getMemOps(Bn:Int, .List, pairResult( Count:Int, toWrite(V:K, Od:K)),
                S:List, fence(acq_rel), Re:K, Loc:Loc)
                 => getMemOps(Bn:Int, ListItem(memProto(Count, toWrite(V:K, Od:K), .Map, false)),
                        .K, S, fence(acq_rel), writeRWFence, Loc:Loc)
         requires Od ==K unordered orBool Od ==K monotonic
                     orBool Od ==K release
    rule getMemOps(Bn:Int, .List, pairResult(Count:Int, toWrite(V:K, Od:K)),
             S:List, fence(acq_rel), Re:K, Loc:Loc)
                 => getMemOps(Bn:Int, ListItem(memProto(Count, toWrite(V:K, Od:K),.Map, false)),
                        .K, S, fence(acq_rel), Re, Loc:Loc)
         requires Od =/=K unordered andBool Od =/=K monotonic
                     andBool Od =/=K release
    rule getMemOps(Bn:Int, .List, pairResult(Count:Int,
                     toReadWrite(V:Set, ListItem(Od:K) OL:List)),
                   S:List, fence(acq_rel), Re:K, Loc:Loc)
                 => getMemOps(Bn:Int, ListItem(memProto(Count,
                        toReadWrite(V:Set, ListItem(Od:K) OL:List), .Map, false)),
                        .K, S, fence(acq_rel), writeRWFence, Loc:Loc)
         requires Od ==K unordered orBool Od ==K monotonic
                     orBool Od ==K release
    rule getMemOps(Bn:Int, .List, pairResult(Count:Int,
                   toReadWrite(V:Set, .List)),
                 S:List, fence(acq_rel), Re:K, Loc:Loc)
                 => getMemOps(Bn:Int, ListItem(memProto(Count,
                      toReadWrite(V:Set, .List),.Map, false)),
                        .K, S, fence(acq_rel), Re, Loc:Loc)
    rule getMemOps(Bn:Int, .List, pairResult(Count:Int,
                   toReadWrite(V:Set, ListItem(Od:K) OL:List)),
                 S:List, fence(acq_rel), Re:K, Loc:Loc)
                 => getMemOps(Bn:Int, ListItem(memProto(Count,
                      toReadWrite(V:Set, ListItem(Od:K) OL:List),.Map, false)),
                        .K, S, fence(acq_rel), Re, Loc:Loc)
         requires Od =/=K unordered andBool Od =/=K monotonic
                     andBool Od =/=K release

    //deal with case when fence is a seq_cst in the store op
    rule getMemOps(Bn:Int, L:List ListItem(memProto(Count:Int, fence(seq_cst), SM:Map, Fl:K)),
              pairResult(Count':Int, toWrite(V:K, Od:K)), S:List, Pre:K, Re:K, Loc:Loc)
             => getMemOps(Bn:Int, L ListItem(memProto(Count, writeSeqFence, SM, Fl:K))
         ListItem(memProto(Count', toWrite(V:K, Od:K), .Map, false)), .K, S, Pre, Re, Loc:Loc)
         requires Od ==K unordered orBool Od ==K monotonic
                     orBool Od ==K acquire
    rule getMemOps(Bn:Int, L:List ListItem(memProto(Count:Int, fence(seq_cst), SM:Map, Fl:K)),
              pairResult(Count':Int, toWrite(V:K, Od:K)), S:List, Pre:K, Re:K, Loc:Loc)
                 => getMemOps(Bn:Int, L ListItem(memProto(Count, fence(seq_cst), SM, Fl:K))
        ListItem(memProto(Count', toWrite(V:K, Od:K), .Map, false)), .K, S, Pre, Re, Loc:Loc)
         requires Od =/=K unordered andBool Od =/=K monotonic
                     andBool Od =/=K acquire
    rule getMemOps(Bn:Int, L:List ListItem(memProto(Count:Int, fence(seq_cst), SM:Map, Fl:K)),
           pairResult(Count':Int, toReadWrite(V:Set,
                    ListItem(Od:K) OL:List)), S:List, Pre:K, Re:K, Loc:Loc)
                 => getMemOps(Bn:Int, L ListItem(memProto(Count:Int, writeSeqFence, SM:Map, Fl:K))
               ListItem(memProto(Count', toReadWrite(V:Set,
                     ListItem(Od:K) OL:List), .Map, false)), .K, S, Pre, Re, Loc:Loc)
         requires Od ==K unordered orBool Od ==K monotonic
                     orBool Od ==K acquire
    rule getMemOps(Bn:Int, L:List ListItem(memProto(Count:Int, fence(seq_cst), SM:Map, Fl:K)),
             pairResult(Count':Int, toReadWrite(V:Set,
                          .List)), S:List, Pre:K, Re:K, Loc:Loc)
                 => getMemOps(Bn:Int, L ListItem(
                            memProto(Count:Int, fence(seq_cst), SM:Map, Fl:K))
             ListItem(memProto(Count', toReadWrite(V:Set,
                         .List),.Map, false)), .K, S, Pre, Re, Loc:Loc)
    rule getMemOps(Bn:Int, L:List ListItem(memProto(Count:Int, fence(seq_cst), SM:Map, Fl:K)),
             pairResult(Count':Int, toReadWrite(V:Set,
                          ListItem(Od:K) OL:List)), S:List, Pre:K, Re:K, Loc:Loc)
                 => getMemOps(Bn:Int, L ListItem(
                            memProto(Count:Int, fence(seq_cst), SM:Map, Fl:K))
             ListItem(memProto(Count', toReadWrite(V:Set,
                         ListItem(Od:K) OL:List),.Map, false)), .K, S, Pre, Re, Loc:Loc)
         requires Od =/=K unordered andBool Od =/=K monotonic
                     andBool Od =/=K acquire
    //if the store op is the first in the block of a seq_cst fence
    rule getMemOps(Bn:Int, .List, pairResult( Count:Int, toWrite(V:K, Od:K)),
                S:List, fence(seq_cst), Re:K, Loc:Loc)
                 => getMemOps(Bn:Int, ListItem(memProto(Count, toWrite(V:K, Od:K), .Map, false)),
                        .K, S, fence(seq_cst), writeSeqFence, Loc:Loc)
         requires Od ==K unordered orBool Od ==K monotonic
                     orBool Od ==K release
    rule getMemOps(Bn:Int, .List, pairResult(Count:Int, toWrite(V:K, Od:K)),
             S:List, fence(seq_cst), Re:K, Loc:Loc)
                 => getMemOps(Bn:Int, ListItem(memProto(Count, toWrite(V:K, Od:K),.Map, false)),
                        .K, S, fence(seq_cst), Re, Loc:Loc)
         requires Od =/=K unordered andBool Od =/=K monotonic
                     andBool Od =/=K release
    rule getMemOps(Bn:Int, .List, pairResult(Count:Int,
                    toReadWrite(V:Set, ListItem(Od:K) OL:List)),
                   S:List, fence(seq_cst), Re:K, Loc:Loc)
                 => getMemOps(Bn:Int, ListItem(memProto(Count,
                        toReadWrite(V:Set, ListItem(Od:K) OL:List), .Map, false)),
                        .K, S, fence(seq_cst), writeSeqFence, Loc:Loc)
         requires Od ==K unordered orBool Od ==K monotonic
                     orBool Od ==K release
    rule getMemOps(Bn:Int, .List, pairResult(Count:Int,
                  toReadWrite(V:Set, .List)),
                 S:List, fence(seq_cst), Re:K, Loc:Loc)
                 => getMemOps(Bn:Int, ListItem(memProto(Count,
                       toReadWrite(V:Set, .List),.Map, false)),
                        .K, S, fence(seq_cst), Re, Loc:Loc)
    rule getMemOps(Bn:Int, .List, pairResult(Count:Int,
                  toReadWrite(V:Set, ListItem(Od:K) OL:List)),
                 S:List, fence(seq_cst), Re:K, Loc:Loc)
                 => getMemOps(Bn:Int, ListItem(memProto(Count,
                       toReadWrite(V:Set, ListItem(Od:K) OL:List),.Map, false)),
                        .K, S, fence(seq_cst), Re, Loc:Loc)
         requires Od =/=K unordered andBool Od =/=K monotonic
                     andBool Od =/=K release

    //deal with case when fence is a readRWFence
    // (a acq_rel fence that has previously been detected with a pre-load op) in the store op
    rule getMemOps(Bn:Int, L:List ListItem(memProto(Count:Int, readRWFence, SM:Map, Fl:K)),
              pairResult(Count':Int, toWrite(V:K, Od:K)), S:List, Pre:K, Re:K, Loc:Loc)
             => getMemOps(Bn:Int, L ListItem(memProto(Count, readWriteFence, SM, Fl:K))
          ListItem(memProto(Count', toWrite(V:K, Od:K), .Map, false)), .K, S, Pre, Re, Loc:Loc)
         requires Od ==K unordered orBool Od ==K monotonic
                     orBool Od ==K acquire
    rule getMemOps(Bn:Int, L:List ListItem(memProto(Count:Int, readRWFence, SM:Map, Fl:K)),
              pairResult(Count':Int, toWrite(V:K, Od:K)), S:List, Pre:K, Re:K, Loc:Loc)
                 => getMemOps(Bn:Int, L ListItem(memProto(Count, readRWFence, SM, Fl:K))
      ListItem(memProto(Count', toWrite(V:K, Od:K), .Map, false)), .K, S, Pre, Re, Loc:Loc)
         requires Od =/=K unordered andBool Od =/=K monotonic
                     andBool Od =/=K acquire
    rule getMemOps(Bn:Int, L:List ListItem(memProto(Count:Int, readRWFence, SM:Map, Fl:K)),
           pairResult(Count':Int, toReadWrite(V:Set,
                    ListItem(Od:K) OL:List)), S:List, Pre:K, Re:K, Loc:Loc)
                 => getMemOps(Bn:Int, L ListItem(memProto(Count:Int, readWriteFence, SM:Map, Fl:K))
        ListItem(memProto(Count', toReadWrite(V:Set,
                     ListItem(Od:K) OL:List), .Map, false)), .K, S, Pre, Re, Loc:Loc)
         requires Od ==K unordered orBool Od ==K monotonic
                     orBool Od ==K acquire
    rule getMemOps(Bn:Int, L:List ListItem(memProto(Count:Int, readRWFence, SM:Map, Fl:K)),
             pairResult(Count':Int, toReadWrite(V:Set,
                        .List)), S:List, Pre:K, Re:K, Loc:Loc)
                 => getMemOps(Bn:Int, L ListItem(
                            memProto(Count:Int, readRWFence, SM:Map, Fl:K))
      ListItem(memProto(Count', toReadWrite(V:Set,
                   .List),.Map, false)), .K, S, Pre, Re, Loc:Loc)
    rule getMemOps(Bn:Int, L:List ListItem(memProto(Count:Int, readRWFence, SM:Map, Fl:K)),
             pairResult(Count':Int, toReadWrite(V:Set,
                        ListItem(Od:K) OL:List)), S:List, Pre:K, Re:K, Loc:Loc)
                 => getMemOps(Bn:Int, L ListItem(
                            memProto(Count:Int, readRWFence, SM:Map, Fl:K))
      ListItem(memProto(Count', toReadWrite(V:Set,
                   ListItem(Od:K) OL:List),.Map, false)), .K, S, Pre, Re, Loc:Loc)
         requires Od =/=K unordered andBool Od =/=K monotonic
                     andBool Od =/=K acquire
    //if the store op is the first in the block of a readRWFence
    // (a acq_rel fence that has previously been detected with a pre-load op) 
    rule getMemOps(Bn:Int, .List, pairResult( Count:Int, toWrite(V:K, Od:K)),
                S:List, readRWFence, Re:K, Loc:Loc)
                 => getMemOps(Bn:Int, ListItem(memProto(Count, toWrite(V:K, Od:K), .Map, false)),
                        .K, S, readRWFence, readWriteFence, Loc:Loc)
         requires Od ==K unordered orBool Od ==K monotonic
                     orBool Od ==K release
    rule getMemOps(Bn:Int, .List, pairResult(Count:Int, toWrite(V:K, Od:K)),
             S:List, readRWFence, Re:K, Loc:Loc)
                 => getMemOps(Bn:Int, ListItem(memProto(Count, toWrite(V:K, Od:K),.Map, false)),
                        .K, S, readRWFence, Re, Loc:Loc)
         requires Od =/=K unordered andBool Od =/=K monotonic
                     andBool Od =/=K release
    rule getMemOps(Bn:Int, .List, pairResult(Count:Int,
                   toReadWrite(V:Set, ListItem(Od:K) OL:List)),
                   S:List, readRWFence, Re:K, Loc:Loc)
                 => getMemOps(Bn:Int, ListItem(memProto(Count,
                   toReadWrite(V:Set,ListItem(Od:K) OL:List), .Map, false)),
                        .K, S, readRWFence, readWriteFence, Loc:Loc)
         requires Od ==K unordered orBool Od ==K monotonic
                     orBool Od ==K release
    rule getMemOps(Bn:Int, .List, pairResult(Count:Int,
                      toReadWrite(V:Set, .List)),
                 S:List, readRWFence, Re:K, Loc:Loc)
                 => getMemOps(Bn:Int, ListItem(memProto(Count,
                      toReadWrite(V:Set, .List),.Map, false)),
                        .K, S, readRWFence, Re, Loc:Loc)

    rule getMemOps(Bn:Int, .List, pairResult(Count:Int,
                      toReadWrite(V:Set, ListItem(Od:K) OL:List)),
                 S:List, readRWFence, Re:K, Loc:Loc)
                 => getMemOps(Bn:Int, ListItem(memProto(Count,
                      toReadWrite(V:Set, ListItem(Od:K) OL:List),.Map, false)),
                        .K, S, readRWFence, Re, Loc:Loc)
         requires Od =/=K unordered andBool Od =/=K monotonic
                     andBool Od =/=K release
    //deal with case when fence is a readSeqFence
    // (a seq_cst fence that has previously been detected with a pre-load op) in the store op
    rule getMemOps(Bn:Int, L:List ListItem(memProto(Count:Int, readSeqFence, SM:Map, Fl:K)),
              pairResult(Count':Int, toWrite(V:K, Od:K)), S:List, Pre:K, Re:K, Loc:Loc)
             => getMemOps(Bn:Int, L ListItem(memProto(Count, seqFence, SM, Fl:K))
                         ListItem(memProto(Count',
                 toWrite(V:K, Od:K), .Map, false)), .K, S, Pre, Re, Loc:Loc)
         requires Od ==K unordered orBool Od ==K monotonic
                     orBool Od ==K acquire
    rule getMemOps(Bn:Int, L:List ListItem(memProto(Count:Int, readSeqFence, SM:Map, Fl:K)),
              pairResult(Count':Int, toWrite(V:K, Od:K)), S:List, Pre:K, Re:K, Loc:Loc)
                 => getMemOps(Bn:Int, L ListItem(memProto(Count, readSeqFence, SM, Fl:K))
                 ListItem(memProto(Count',
                 toWrite(V:K, Od:K), .Map, false)), .K, S, Pre, Re, Loc:Loc)
         requires Od =/=K unordered andBool Od =/=K monotonic
                     andBool Od =/=K acquire
    rule getMemOps(Bn:Int, L:List ListItem(memProto(Count:Int, readSeqFence, SM:Map, Fl:K)),
           pairResult(Count':Int, toReadWrite(V:Set,
                   ListItem(Od:K) OL:List)), S:List, Pre:K, Re:K, Loc:Loc)
                 => getMemOps(Bn:Int, L ListItem(memProto(Count:Int, seqFence, SM:Map, Fl:K))
               ListItem(memProto(Count', toReadWrite(V:Set,
                   ListItem(Od:K) OL:List), .Map, false)), .K, S, Pre, Re, Loc:Loc)
         requires Od ==K unordered orBool Od ==K monotonic
                     orBool Od ==K acquire
    rule getMemOps(Bn:Int, L:List ListItem(memProto(Count:Int, readSeqFence, SM:Map, Fl:K)),
             pairResult(Count':Int,
              toReadWrite(V:Set, .List)), S:List, Pre:K, Re:K, Loc:Loc)
                 => getMemOps(Bn:Int, L ListItem(
                            memProto(Count:Int, readSeqFence, SM:Map, Fl:K))
             ListItem(memProto(Count', 
               toReadWrite(V:Set, .List),.Map, false)), .K, S, Pre, Re, Loc:Loc)
    rule getMemOps(Bn:Int, L:List ListItem(memProto(Count:Int, readSeqFence, SM:Map, Fl:K)),
             pairResult(Count':Int,
              toReadWrite(V:Set, ListItem(Od:K) OL:List)), S:List, Pre:K, Re:K, Loc:Loc)
                 => getMemOps(Bn:Int, L ListItem(
                            memProto(Count:Int, readSeqFence, SM:Map, Fl:K))
             ListItem(memProto(Count', 
               toReadWrite(V:Set, ListItem(Od:K) OL:List),.Map, false)), .K, S, Pre, Re, Loc:Loc)
         requires Od =/=K unordered andBool Od =/=K monotonic
                     andBool Od =/=K acquire
    //if the store op is the first in the block of a readSeqFence
    // (a seq_cst fence that has previously been detected with a pre-load op) 
    rule getMemOps(Bn:Int, .List, pairResult( Count:Int, toWrite(V:K, Od:K)),
                S:List, readSeqFence, Re:K, Loc:Loc)
                 => getMemOps(Bn:Int, ListItem(memProto(Count, toWrite(V:K, Od:K), .Map, false)),
                        .K, S, readSeqFence, seqFence, Loc:Loc)
         requires Od ==K unordered orBool Od ==K monotonic
                     orBool Od ==K release
    rule getMemOps(Bn:Int, .List, pairResult(Count:Int, toWrite(V:K, Od:K)),
             S:List, readSeqFence, Re:K, Loc:Loc)
                 => getMemOps(Bn:Int, ListItem(memProto(Count, toWrite(V:K, Od:K),.Map, false)),
                        .K, S, readSeqFence, Re, Loc:Loc)
         requires Od =/=K unordered andBool Od =/=K monotonic
                     andBool Od =/=K release
    rule getMemOps(Bn:Int, .List, pairResult(Count:Int,
                     toReadWrite(V:Set, ListItem(Od:K) OL:List)),
                   S:List, readSeqFence, Re:K, Loc:Loc)
                 => getMemOps(Bn:Int, ListItem(memProto(Count,
                    toReadWrite(V:Set, ListItem(Od:K) OL:List), .Map, false)),
                        .K, S, readSeqFence, seqFence, Loc:Loc)
         requires Od ==K unordered orBool Od ==K monotonic
                     orBool Od ==K release
    rule getMemOps(Bn:Int, .List, pairResult(Count:Int,
                   toReadWrite(V:Set, .List)),
                 S:List, readSeqFence, Re:K, Loc:Loc)
                 => getMemOps(Bn:Int, ListItem(memProto(Count,
                            toReadWrite(V:Set, .List),.Map, false)),
                        .K, S, readSeqFence, Re, Loc:Loc)
    rule getMemOps(Bn:Int, .List, pairResult(Count:Int,
                   toReadWrite(V:Set, ListItem(Od:K) OL:List)),
                 S:List, readSeqFence, Re:K, Loc:Loc)
                 => getMemOps(Bn:Int, ListItem(memProto(Count,
                            toReadWrite(V:Set, ListItem(Od:K) OL:List),.Map, false)),
                        .K, S, readSeqFence, Re, Loc:Loc)
         requires Od =/=K unordered andBool Od =/=K monotonic
                     andBool Od =/=K release
    rule getMemOps(Bn:Int, L:List,
                  pairResult(Count:Int, Op:K), S:List, Pre:K, Re:K, Loc:Loc)
           => getMemOps(Bn, L ListItem(memProto(Count, Op,.Map, false)),
                   .K, S, Pre, Re, Loc:Loc) [owise]
    //end of getMemOps

    syntax List ::= formMemList(Int, List, Loc) [function]
                  | formMemListAux(K) [function]

    syntax Map ::= formMemListWithMem(Int, K, Int, List, Loc,Set, Map) [function]
                    //block-id,block-name, father, inst-list, va-arg-loc,
                    //Set of vars, previous-map
                  | formMemListWithMemAux(Int, K, Int, List, Loc, Set, Map, K) [function]
                  | formMemListWithMemAux1(Int, K, Int, Set, Map, K, K) [function]

    rule formMemListWithMem(Bn:Int, Name:K, Fa:Int, Insts:List, Va:Loc, S:Set, M:Map)
          => formMemListWithMemAux(Bn, Name, Fa, Insts, Va, S, M,
                     findFatherMemProto(Fa, .K, M))
    rule formMemListWithMemAux(Bn:Int, Name:K, Fa:Int, Insts:List,
           Va:Loc, S:Set, M:Map, pairResult(F:K, Op:K))
         => formMemListWithMemAux1(Bn, Name, Fa, S, M, F,
                getMemOps(Bn, .List, .K, Insts, Op, .K, Va))
    rule formMemListWithMemAux(Bn:Int, Name:K, Fa:Int, Insts:List,
           Va:Loc, S:Set, M:Map, none)
         => formMemListWithMemAux1(Bn, Name, Fa, S, M, none,
                getMemOps(Bn, .List, .K, Insts, none, .K, Va))
    rule formMemListWithMemAux1(Bn:Int, Name:K, Fa:Int, S:Set, M:Map, F:K,
              pairResult(none, L:List))
          => M[Bn <- runBlock(Bn, Name, Fa,L, S, .Set)]
    rule formMemListWithMemAux1(Bn:Int, Name:K, Fa:Int, S:Set, M:Map, F:Int,
              pairResult(pairResult(Bn':Int, Op:K) , L:List))
          => addNextBlockMemOp(M, Bn', Bn, Op)[Bn <- runBlock(Bn, Name, Fa,L, S, .Set)]

    rule formMemList(Bn:Int, Insts:List, Loc:Loc)
          => formMemListAux(getMemOps(Bn, .List, .K, Insts, none, .K, Loc))
    rule formMemListAux(pairResultList(A:K, R:List)) => R

    //dealing with branching jumping and the re-arrange of memlist in toCommit cell
    syntax KItem ::= divideParList(Int, List) [function]
                   | divideParListAux(Int, List, K) [function]
    rule divideParList(A:Int, L:List)
                => divideParListAux(A, L, pairList(.List, .List))
    rule divideParListAux(A:Int, .List, B:K) => B
    rule divideParListAux(A:Int, ListItem(singleMem(TID:Int, Bn:Int,
                     In:Int, Ran:K, Op:K)) L:List, pairList(Good:List, Bad:List))
              => divideParListAux(A, L, pairList(Good ListItem(singleMem(TID:Int, Bn:Int,
                     In:Int, Ran:K, Op:K)), Bad))
         requires Bn <=Int A
        rule divideParListAux(A:Int, ListItem(singleMem(TID:Int, Bn:Int,
                     In:Int, Ran:K, Op:K)) L:List, pairList(Good:List, Bad:List))
              => divideParListAux(A, L, pairList(Good, Bad ListItem(singleMem(TID:Int, Bn:Int,
                     In:Int, Ran:K, Op:K))))
         requires Bn >Int A

    syntax KItem ::= dealWithToCommit(K, Set, K, K, List, List)  [function]
                   //br-count, good-keys, avail-point, avail-set, 
                  //divided-par-avail-list-checked, divided par-avail-list-unchecked.
                  //checked-not-ava, unchecked-not-ava
    rule dealWithToCommit(A:K, Good:Set, pairList(To1:List, St1:List),
                 pairList(To2:List, St2:List), Ch:List, Not:List)
            => memList(A, Good listToSet(To1 To2), St1, St2, Ch, Not)

    syntax ElemList ::= StringToList(String) [function]
    rule StringToList("") => .ElemList
    rule
        StringToList(S:String)
            => valValue(ordChar(substrString(S:String, 0, 1))),
                StringToList(substrString(S:String, 1, lengthString(S:String)))
        requires S =/=String "" andBool ordChar(substrString(S, 0, 1)) =/=Int 92
    rule
        StringToList(S:String)
            => valValue(ordChar(substrString(S:String, 0, 1))),
                StringToList(substrString(S:String, 2, lengthString(S:String)))
        requires S =/=String "" andBool ordChar(substrString(S, 0, 1)) ==Int 92
             andBool lengthString(S:String) >Int 1
             andBool ordChar(substrString(S, 1, 2)) ==Int 92

    rule
        StringToList(S:String)
            => valValue(String2Int(substrString(S, 1, 2))
                        *Int 16 +Int String2Int(substrString(S, 2, 3))),
                StringToList(substrString(S:String, 3, lengthString(S:String)))
        requires S =/=String "" andBool ordChar(substrString(S, 0, 1)) ==Int 92
             andBool lengthString(S:String) >Int 2
             andBool isHexDigit(substrString(S, 1, 2))
             andBool isHexDigit(substrString(S, 2, 3))

    syntax Set ::= makeLabelToVars(Set, Set) [function]
    rule makeLabelToVars(.Set, S:Set) => S
    rule makeLabelToVars(SetItem(A:K) S1:Set, S2:Set)
                 => makeLabelToVars(S1, SetItem(varOp(A, 0, label, A)) S2)

    syntax KItem ::= setLabelVarsAux(Set, Map, K, K, Map) [function]
    rule setLabelVarsAux(S:Set, .Map, .K, .K, M:Map) => setLabelVars(M)
    rule setLabelVarsAux(S:Set, (A:K |-> V:K) M1:Map, .K, .K, M2:Map)
        => setLabelVarsAux(S:Set, M1:Map, A, V, M2:Map)
    rule setLabelVarsAux(S:Set, M1:Map, A, blockContent(Is:Map, Fl:Bool, Out:Set, In:Set, InDef:Set,
            InUse:Set, OutDef:Set, OutUse:Set, TheUse:Set), M2:Map)
        => setLabelVarsAux(S:Set, M1:Map, .K, .K,
               (A |-> blockContent(Is:Map, Fl:Bool, Out:Set, In:Set, S InDef:Set,
            InUse:Set, S OutDef:Set, OutUse:Set, TheUse:Set)) M2:Map)

    syntax List ::= getAllInsts(List)  [function]
    rule getAllInsts(.List) => .List
    rule getAllInsts(ListItem(blockContent(Is:Map, Fl:Bool, Out:Set, In:Set, InDef:Set,
            InUse:Set, OutDef:Set, OutUse:Set, TheUse:Set)) L:List)
          => ListItem(instMap(Is)) getAllInsts(L)

    // TODO many possible errors will slip by with this, but lots of stuff will work
    rule 'nullOfConstValueRef(.KList) => zeroinitializer [anywhere]

    syntax Int ::= base(Loc) [function]
    rule base(loc(Base:Int, _, _,_,_, _)) => Base:Int
    //rule base(stackLoc(Base:Int, _, _, _)) => Base:Int
    //rule base(inRangeLoc(A:Int, _, _)) => A
    //rule base(badRangeLoc(A:Int, _, _)) => A
    rule base(A:K) => badValue [owise]

    syntax KItem ::= getInRange(Loc)  [function]
    rule getInRange(loc(_, _, _,_,_, A:K)) => A
    //rule getInRange(stackLoc(_, _, _, A:K)) => A
    //rule isInRangeLoc(inRangeLoc(A:Int, _, _)) => inrange
    //rule isInRangeLoc(badRangeLoc(A:Int, _, _)) => badRange
    rule getInRange(A:K) => none [owise]

/*
    syntax KItem ::= getLocSize(Loc)  [function]
    rule getLocSize(loc(_, _, _, A:Int, _)) => A
    rule getLocSize(stackLoc(_, _, _, A:Int, _)) => A
    rule getLocSize(A:K) => badValue [owise]
*/

    syntax KItem ::= getStackHeapFlag(Loc)  [function]
    rule getStackHeapFlag(loc(Base:Int, _, _,RT:K,_, _)) => RT
    //rule getStackHeapFlag(stackLoc(Base:Int, _, _, _)) => stack
    //rule getStackHeapFlag(inRangeLoc(_, _, C:K)) => C
    //rule getStackHeapFlag(badRangeLoc(_, _, C:K)) => C
    rule getStackHeapFlag(A:K) => badValue [owise]

    syntax KItem ::= getRidOfGepBag(K) [function]
    rule getRidOfGepBag(gepTypeBag(T:K)) => T
    rule getRidOfGepBag(T:K) => T [owise]

    syntax Int ::= getSizeOfGepBag(K) [function]
    rule getSizeOfGepBag(vectorTypeValue(T:K, S:Int)) => S
    rule getSizeOfGepBag(arrayTypeValue(T:K, S:Int)) => S
    rule getSizeOfGepBag(structTypeValue(Ts:TypeList)) => 1
    rule getSizeOfGepBag(T:K) => 1 [owise]

    syntax Bool ::= hasAGepBag(K) [function]
    rule hasAGepBag(gepTypeBag(T:K)) => true
    rule hasAGepBag(A:K) => false [owise]

/*
    syntax Int ::= offset(Loc)
    rule offset(loc(_, Offset:Int)) => Offset:Int
    rule offset(stackLoc(_, Offset:Int)) => Offset
*/
    syntax Loc ::= Loc "+" Int [function]
    // TODO not checking for null
    
    rule loc(Base:Int, T:K, R:K,RT:K, BA:K, In:K) + Off:Int
            => loc(Base:Int +Int Off, T, R:K,RT, BA, In:K)
   /* rule stackLoc(Base:Int, T:K,R:K, In:K) + Off:Int
            => stackLoc(Base:Int +Int Off, T,R:K, In:K) */

    //functions to join a lists of bytes into a whole data
    syntax ElemList ::= listToElemList(List) [function]
    rule listToElemList(.List) => .ElemList
    rule listToElemList(ListItem(A:K) L:List)
                    => valValue(A),listToElemList(L)

    syntax Bool ::= isAllUndef(List) [function]
    rule isAllUndef(.List) => true
    rule isAllUndef(ListItem(A:K) L:List) => isAllUndef(L)
         requires A ==K undef
    rule isAllUndef(ListItem(A:K) L:List) => false
         requires A =/=K undef

    syntax Bool ::= isAllPoison(List) [function]
    rule isAllPoison(.List) => true
    rule isAllPoison(ListItem(A:K) L:List) => isAllPoison(L)
         requires A ==K poisonVal
    rule isAllPoison(ListItem(A:K) L:List) => false
         requires A =/=K poisonVal


    syntax List ::= getRidOfReadPiece(List) [function]
    rule getRidOfReadPiece(.List) => .List
    rule getRidOfReadPiece(ListItem(readPiece(A:Int, B:K)) L:List)
          => ListItem(B) getRidOfReadPiece(L)
    rule getRidOfReadPiece(ListItem(A:K) L:List)
          => ListItem(A) getRidOfReadPiece(L) [owise]

    //check if a term is a byte of pointer
    syntax Bool ::= isPointerByte(K) [function]
    rule isPointerByte(ptrByte(A:K, B:K)) => true
    rule isPointerByte(_) => false [owise]

    syntax Bool ::= isIntLoc(K) [function]
    rule isIntLoc(intLoc(_,_,_,_,_)) => true
    rule isIntLoc(_) => false [owise]

    syntax KItem ::= joinBytes(K, List) [function]
                   | joinIntBytes(K, Int, Int, Int, Int, List, K) [function]
                     //type, result, current, remain bits, bound, bits, store-loc-info
                   | joinPointerByte(List, Int, Int) [function]
                   | joinPointerByteAux(List, K, Int, Int) [function]
                   | joinArrayByte(List, List, Int, Int, K) [function]
                   | joinArrayByteAux(K, List, Int, Int, K) [function]
                   | joinVectorByte(List, List, Int, Int, K) [function]
                   | joinVectorByteAux(K, List, Int, Int, K) [function]

    rule joinBytes(integerType(N:Int), L:List)
             => joinIntBytes(integerType(N), 0, 0, N, numBitsPerByte
                *Int sizeof(integerType(N)), getRidOfReadPiece(L:List), none)
    rule joinBytes(pointerTypeValue(A:K, B:K), L:List)
             => joinPointerByte(getRidOfReadPiece(L:List),
                           0, sizeof(pointerTypeValue(A:K, B:K)))
    rule joinBytes(arrayTypeValue(A:K, B:Int), L:List)
             => joinArrayByte(getRidOfReadPiece(L:List), .List, 0, B, A)
    rule joinBytes(vectorTypeValue(A:K, B:Int), L:List)
             => joinVectorByte(getRidOfReadPiece(L:List), .List, 0, B, A)

    rule joinArrayByte(L:List, Re:List, N:Int, Size:Int, InTy:K)
           => joinArrayByteAux(countByte(L, .List, sizeof(InTy)),
                 Re, N, Size, InTy)
         requires N <Int Size
    rule joinArrayByte(L:List, Re:List, N:Int, Size:Int, InTy:K)
               => arrayValue(listToElemList(Re))
         requires N >=Int Size
           andBool notBool isAllUndef(Re) andBool notBool isAllPoison(Re)
    rule joinArrayByte(L:List, Re:List, N:Int, Size:Int, InTy:K) => undef
         requires N >=Int Size andBool isAllUndef(Re)
    rule joinArrayByte(L:List, Re:List, N:Int, Size:Int, InTy:K) => poisonVal
         requires N >=Int Size andBool isAllPoison(Re)
    rule joinArrayByteAux(countByteResult(Now:List, Rest:List), Re:List,
                  N:Int, Size:Int, InTy:K) => 
           joinArrayByte(Rest, Re ListItem(joinBytes(InTy, Now)),
                N +Int 1, Size, InTy)

    rule joinVectorByte(L:List, Re:List, N:Int, Size:Int, InTy:K)
           => joinVectorByteAux(countByte(L, .List, sizeof(InTy)),
                 Re, N, Size, InTy)
         requires N <Int Size
    rule joinVectorByte(L:List, Re:List, N:Int, Size:Int, InTy:K)
               => vectorValue(listToElemList(Re))
         requires N >=Int Size
           andBool notBool isAllUndef(Re) andBool notBool isAllPoison(Re)
    rule joinVectorByte(L:List, Re:List, N:Int, Size:Int, InTy:K) => undef
         requires N >=Int Size andBool isAllUndef(Re)
    rule joinVectorByte(L:List, Re:List, N:Int, Size:Int, InTy:K) => poisonVal
         requires N >=Int Size andBool isAllPoison(Re)
    rule joinVectorByteAux(countByteResult(Now:List, Rest:List), Re:List,
                  N:Int, Size:Int, InTy:K) => 
           joinVectorByte(Rest, Re ListItem(joinBytes(InTy, Now)),
                N +Int 1, Size, InTy)

    //deal with pointer bytes joining to get a piontvalue
    syntax KItem ::= comparePointerResult(K, K, Int) [function]
    rule comparePointerResult(none, R:Int, I:Int)
         => R *Int (2 ^Int (I *Int numBitsPerByte))
    rule comparePointerResult(R1:Int, R2:Int, I:Int)
         => R1 +Int (R2 *Int (2 ^Int (I *Int numBitsPerByte)))
    rule comparePointerResult(A:K, poisonVal, I:Int) => poisonVal
    rule comparePointerResult(A:K, undef, I:Int) => undef
         requires A =/=K poisonVal
    rule comparePointerResult(undef, A:K, I:Int) => undef
         requires A =/=K poisonVal
    rule comparePointerResult(poisonVal, A:K, I:Int) => poisonVal
    rule comparePointerResult(A:K, loc(B:K, T:K,
              Ra:K, Ran:K, Ba:K, InR:K), I:Int)
              => comparePointerResult(A, B, I)
         requires (B ==K undef orBool B ==K poisonVal)
    rule comparePointerResult(A:K, floatLoc(B:K, T:K,
              Ra:K, Ran:K, Ba:K), I:Int)
                 => comparePointerResult(A, B, I)
         requires (B ==K undef orBool B ==K poisonVal)
    rule comparePointerResult(A:K, intLoc(B:K, T:K,
              Ra:K, Ran:K, Ba:K), I:Int)
                => comparePointerResult(A, B, I)
         requires (B ==K undef orBool B ==K poisonVal)
    rule comparePointerResult(R1:Int, loc(R:Int, T:K,
              Ra:K, Ran:K, Ba:K, InR:K), I:Int)
         => loc(R1 +Int (R *Int (2 ^Int (I *Int numBitsPerByte))), T:K,
              Ra:K, Ran:K, Ba:K, InR:K)
    rule comparePointerResult(R1:Int, intLoc(R:Int, T:K,
              Ra:K, Ran:K, Ba:K), I:Int)
         => loc(R1 +Int (R *Int (2 ^Int (I *Int numBitsPerByte))), T:K,
              Ra:K, Ran:K, Ba:K, none)
    rule comparePointerResult(R1:Int, floatLoc(R:Int, T:K,
              Ra:K, Ran:K, Ba:K), I:Int)
         => loc(R1 +Int (R *Int (2 ^Int (I *Int numBitsPerByte))), T:K,
              Ra:K, Ran:K, Ba:K, none)
    rule comparePointerResult(loc(R1:Int, T:K,
              Ra:K, Ran:K, Ba:K, InR':K), loc(R:Int, T:K,
              Ra:K, Ran:K, Ba:K, InR:K), I:Int)
         => loc(R1 +Int (R *Int (2 ^Int (I *Int numBitsPerByte))), T:K,
              Ra:K, Ran:K, Ba:K, mergeInrangeFlags(InR', InR:K))
    rule comparePointerResult(loc(R1:Int, T:K,
              Ra:K, Ran:K, Ba:K, InR:K), intLoc(R:Int, T:K,
              Ra:K, Ran:K, Ba:K), I:Int)
         => loc(R1 +Int (R *Int (2 ^Int (I *Int numBitsPerByte))), T:K,
              Ra:K, Ran:K, Ba:K, InR)
    rule comparePointerResult(loc(R1:Int, T:K,
              Ra:K, Ran:K, Ba:K, InR:K), floatLoc(R:Int, T:K,
              Ra:K, Ran:K, Ba:K), I:Int)
         => loc(R1 +Int (R *Int (2 ^Int (I *Int numBitsPerByte))), T:K,
              Ra:K, Ran:K, Ba:K, InR)

    rule comparePointerResult(loc(R1:Int, T':K,
              Ra':K, Ran':K, Ba':K, InR':K), loc(R:Int, T:K,
              Ra:K, Ran:K, Ba:K, InR:K), I:Int) => undef
         requires (T' =/=K T orBool Ra' =/=K Ra orBool Ran' =/=K Ran
                     orBool Ba' =/=K Ba)
    rule comparePointerResult(loc(R1:Int, T':K,
              Ra':K, Ran':K, Ba':K, InR':K), intLoc(R:Int, T:K,
              Ra:K, Ran:K, Ba:K), I:Int) => undef
         requires (T' =/=K T orBool Ra' =/=K Ra orBool Ran' =/=K Ran
                     orBool Ba' =/=K Ba)
    rule comparePointerResult(loc(R1:Int, T':K,
              Ra':K, Ran':K, Ba':K, InR':K), floatLoc(R:Int, T:K,
              Ra:K, Ran:K, Ba:K), I:Int) => undef
         requires (T' =/=K T orBool Ra' =/=K Ra orBool Ran' =/=K Ran
                     orBool Ba' =/=K Ba)

    rule comparePointerResult(none, loc(R:Int, T:K,
              Ra:K, Ran:K, Ba:K, InR:K), I:Int)
         => loc(R *Int (2 ^Int (I *Int numBitsPerByte)), T:K,
              Ra:K, Ran:K, Ba:K, InR:K)
    rule comparePointerResult(none, intLoc(R:Int, T:K,
              Ra:K, Ran:K, Ba:K), I:Int)
         => loc(R *Int (2 ^Int (I *Int numBitsPerByte)), T:K,
              Ra:K, Ran:K, Ba:K, none)
    rule comparePointerResult(none, floatLoc(R:Int, T:K,
              Ra:K, Ran:K, Ba:K), I:Int)
         => loc(R *Int (2 ^Int (I *Int numBitsPerByte)), T:K,
              Ra:K, Ran:K, Ba:K, none)

    rule joinPointerByte(L:List, I:Int, Size:Int) => undef
         requires size(L) =/=Int Size orBool Size ==Int 0
    rule joinPointerByte(L:List, I:Int, Size:Int)
               => joinPointerByteAux(L, none, I, Size)
         requires size(L) ==Int Size andBool Size =/=Int 0

    rule joinPointerByteAux(.List, X:K, Size, Size:Int) => X
    rule joinPointerByteAux(L:List ListItem(intByte(BL:List)),
                X:K, I:Int, Size:Int)
         => joinPointerByteAux(L, comparePointerResult(X,
             joinIntBits(BL, 0, 0, numBitsPerByte), I), I +Int 1, Size)
         requires I <Int Size
    rule joinPointerByteAux(L:List ListItem(loc(intByte(BL:List),T:K,
              Ra:K, Ran:K, Ba:K, InR:K)), X:K, I:Int, Size:Int)
         => joinPointerByteAux(L, comparePointerResult(X, loc(
             joinIntBits(BL, 0, 0, numBitsPerByte),
                  T, Ra, Ran, Ba, InR), I), I +Int 1, Size)
         requires I <Int Size
    rule joinPointerByteAux(L:List ListItem(intLoc(intByte(BL:List),T:K,
              Ra:K, Ran:K, Ba:K)), X:K, I:Int, Size:Int)
         => joinPointerByteAux(L, comparePointerResult(X, intLoc(
             joinIntBits(BL, 0, 0, numBitsPerByte),
                  T, Ra, Ran, Ba), I), I +Int 1, Size)
         requires I <Int Size
    rule joinPointerByteAux(L:List ListItem(floatLoc(intByte(BL:List),T:K,
              Ra:K, Ran:K, Ba:K)), X:K, I:Int, Size:Int)
         => joinPointerByteAux(L, comparePointerResult(X, floatLoc(
             joinIntBits(BL, 0, 0, numBitsPerByte),
                  T, Ra, Ran, Ba), I), I +Int 1, Size)
         requires I <Int Size


    //join integer bytes
    rule joinIntBytes(T:K, R:Int, Size, Rem:Int,
                 Size:Int, L:List, none) => normalizingInt(T, R)
    rule joinIntBytes(T:K, R:Int, Size, Rem:Int,
                 Size:Int, L:List, intLoc(A:K, B:K, C:K, D:K, E:K))
               => intLoc(normalizingInt(T, R), B, C, D, E)

    rule joinIntBytes(T:K, R:Int, N:Int, Rem:Int,
                 Size:Int, L:List ListItem(intByte(BL:List)), A:K)
              => joinIntBits(BL, 0, 0, Rem)
         requires N <Int Size andBool Rem <Int numBitsPerByte
          andBool (joinIntBits(BL, 0, 0, Rem) ==K undef
             orBool joinIntBits(BL, 0, 0, Rem) ==K poisonVal)
    rule joinIntBytes(T:K, R:Int, N:Int, Rem:Int,
                 Size:Int, L:List ListItem(loc(intByte(BL:List),
                         Ty:K, Rv:K, Ran:K, Bn:K, InR:K)), A:K)
              => joinIntBits(BL, 0, 0, Rem)
         requires N <Int Size andBool Rem <Int numBitsPerByte
          andBool (joinIntBits(BL, 0, 0, Rem) ==K undef
             orBool joinIntBits(BL, 0, 0, Rem) ==K poisonVal)
    rule joinIntBytes(T:K, R:Int, N:Int, Rem:Int,
                 Size:Int, L:List ListItem(floatLoc(intByte(BL:List),
                         Ty:K, Rv:K, Ran:K, Bn:K)), A:K)
              => joinIntBits(BL, 0, 0, Rem)
         requires N <Int Size andBool Rem <Int numBitsPerByte
          andBool (joinIntBits(BL, 0, 0, Rem) ==K undef
             orBool joinIntBits(BL, 0, 0, Rem) ==K poisonVal)
    rule joinIntBytes(T:K, R:Int, N:Int, Rem:Int,
                 Size:Int, L:List ListItem(intLoc(intByte(BL:List),
                         Ty:K, Rv:K, Ran:K, Bn:K)), A:K)
              => joinIntBits(BL, 0, 0, Rem)
         requires N <Int Size andBool Rem <Int numBitsPerByte
          andBool (joinIntBits(BL, 0, 0, Rem) ==K undef
             orBool joinIntBits(BL, 0, 0, Rem) ==K poisonVal)

    rule joinIntBytes(T:K, R:Int, N:Int, Rem:Int,
                 Size:Int, L:List ListItem(intByte(BL:List)), A:K)
              => joinIntBits(BL, 0, 0, numBitsPerByte)
         requires N <Int Size andBool Rem >=Int numBitsPerByte
          andBool (joinIntBits(BL, 0, 0, numBitsPerByte) ==K undef
             orBool joinIntBits(BL, 0, 0, numBitsPerByte) ==K poisonVal)
    rule joinIntBytes(T:K, R:Int, N:Int, Rem:Int,
                 Size:Int, L:List ListItem(loc(intByte(BL:List),
                         Ty:K, Rv:K, Ran:K, Bn:K, InR:K)), A:K)
              => joinIntBits(BL, 0, 0, numBitsPerByte)
         requires N <Int Size andBool Rem >=Int numBitsPerByte
          andBool (joinIntBits(BL, 0, 0, numBitsPerByte) ==K undef
             orBool joinIntBits(BL, 0, 0, numBitsPerByte) ==K poisonVal)
    rule joinIntBytes(T:K, R:Int, N:Int, Rem:Int,
                 Size:Int, L:List ListItem(floatLoc(intByte(BL:List),
                         Ty:K, Rv:K, Ran:K, Bn:K)), A:K)
              => joinIntBits(BL, 0, 0, numBitsPerByte)
         requires N <Int Size andBool Rem >=Int numBitsPerByte
          andBool (joinIntBits(BL, 0, 0, numBitsPerByte) ==K undef
             orBool joinIntBits(BL, 0, 0, numBitsPerByte) ==K poisonVal)
    rule joinIntBytes(T:K, R:Int, N:Int, Rem:Int,
                 Size:Int, L:List ListItem(intLoc(intByte(BL:List),
                         Ty:K, Rv:K, Ran:K, Bn:K)), A:K)
              => joinIntBits(BL, 0, 0, numBitsPerByte)
         requires N <Int Size andBool Rem >=Int numBitsPerByte
          andBool (joinIntBits(BL, 0, 0, numBitsPerByte) ==K undef
             orBool joinIntBits(BL, 0, 0, numBitsPerByte) ==K poisonVal)
    rule joinIntBytes(T:K, R:Int, N:Int, Rem:Int,
                 Size:Int, L:List ListItem(intByte(BL:List)), A:K)
               => joinIntBytes(T, (2 ^Int N)
                      *Int joinIntBits(BL, 0, 0, numBitsPerByte) +Int R,
                   N +Int numBitsPerByte,
                       Rem -Int numBitsPerByte, Size, L, A)
         requires N <Int Size andBool Rem >=Int numBitsPerByte
             andBool joinIntBits(BL, 0, 0, numBitsPerByte) =/=K undef
             andBool joinIntBits(BL, 0, 0, numBitsPerByte) =/=K poisonVal
    rule joinIntBytes(T:K, R:Int, N:Int, Rem:Int,
                 Size:Int, L:List ListItem(loc(intByte(BL:List),
                         Ty:K, Rv:K, Ran:K, Bn:K, InR:K)), none)
               => joinIntBytes(T, (2 ^Int N)
                      *Int joinIntBits(BL, 0, 0, numBitsPerByte) +Int R,
                   N +Int numBitsPerByte, Rem -Int numBitsPerByte,
                Size, L, intLoc(none, Ty, Rv, Ran, Bn))
         requires N <Int Size andBool Rem >=Int numBitsPerByte
             andBool joinIntBits(BL, 0, 0, numBitsPerByte) =/=K undef
             andBool joinIntBits(BL, 0, 0, numBitsPerByte) =/=K poisonVal
    rule joinIntBytes(T:K, R:Int, N:Int, Rem:Int,
                 Size:Int, L:List ListItem(floatLoc(intByte(BL:List),
                         Ty:K, Rv:K, Ran:K, Bn:K)), none)
               => joinIntBytes(T, (2 ^Int N)
                      *Int joinIntBits(BL, 0, 0, numBitsPerByte) +Int R,
                   N +Int numBitsPerByte, Rem -Int numBitsPerByte,
                Size, L, intLoc(none, Ty, Rv, Ran, Bn))
         requires N <Int Size andBool Rem >=Int numBitsPerByte
             andBool joinIntBits(BL, 0, 0, numBitsPerByte) =/=K undef
             andBool joinIntBits(BL, 0, 0, numBitsPerByte) =/=K poisonVal
    rule joinIntBytes(T:K, R:Int, N:Int, Rem:Int,
                 Size:Int, L:List ListItem(intLoc(intByte(BL:List),
                         Ty:K, Rv:K, Ran:K, Bn:K)), none)
               => joinIntBytes(T, (2 ^Int N)
                      *Int joinIntBits(BL, 0, 0, numBitsPerByte) +Int R,
                   N +Int numBitsPerByte, Rem -Int numBitsPerByte,
                Size, L, intLoc(none, Ty, Rv, Ran, Bn))
         requires N <Int Size andBool Rem >=Int numBitsPerByte
             andBool joinIntBits(BL, 0, 0, numBitsPerByte) =/=K undef
             andBool joinIntBits(BL, 0, 0, numBitsPerByte) =/=K poisonVal
    rule joinIntBytes(T:K, R:Int, N:Int, Rem:Int,
                 Size:Int, L:List ListItem(loc(intByte(BL:List),
                         Ty:K, Rv:K, Ran:K, Bn:K, InR:K)),
                        intLoc(A:K, Ty:K, Rv:K, Ran:K, Bn:K))
               => joinIntBytes(T, (2 ^Int N)
                      *Int joinIntBits(BL, 0, 0, numBitsPerByte) +Int R,
                   N +Int numBitsPerByte, Rem -Int numBitsPerByte,
                Size, L, intLoc(A:K, Ty:K, Rv:K, Ran:K, Bn:K))
         requires N <Int Size andBool Rem >=Int numBitsPerByte
             andBool joinIntBits(BL, 0, 0, numBitsPerByte) =/=K undef
             andBool joinIntBits(BL, 0, 0, numBitsPerByte) =/=K poisonVal
    rule joinIntBytes(T:K, R:Int, N:Int, Rem:Int,
                 Size:Int, L:List ListItem(loc(intByte(BL:List),
                         Ty:K, Rv:K, Ran:K, Bn:K, InR:K)),
                        intLoc(A:K, Ty':K, Rv':K, Ran':K, Bn':K)) => undef
         requires N <Int Size andBool Rem >=Int numBitsPerByte
             andBool joinIntBits(BL, 0, 0, numBitsPerByte) =/=K undef
             andBool joinIntBits(BL, 0, 0, numBitsPerByte) =/=K poisonVal
             andBool (Ty =/=K Ty' orBool Rv =/=K Rv'
                             orBool Ran =/=K Ran' orBool Bn =/=K Bn')
    rule joinIntBytes(T:K, R:Int, N:Int, Rem:Int,
                 Size:Int, L:List ListItem(floatLoc(intByte(BL:List),
                         Ty:K, Rv:K, Ran:K, Bn:K)),
                        intLoc(A:K, Ty:K, Rv:K, Ran:K, Bn:K))
               => joinIntBytes(T, (2 ^Int N)
                      *Int joinIntBits(BL, 0, 0, numBitsPerByte) +Int R,
                   N +Int numBitsPerByte, Rem -Int numBitsPerByte,
                Size, L, intLoc(A:K, Ty:K, Rv:K, Ran:K, Bn:K))
         requires N <Int Size andBool Rem >=Int numBitsPerByte
             andBool joinIntBits(BL, 0, 0, numBitsPerByte) =/=K undef
             andBool joinIntBits(BL, 0, 0, numBitsPerByte) =/=K poisonVal
    rule joinIntBytes(T:K, R:Int, N:Int, Rem:Int,
                 Size:Int, L:List ListItem(floatLoc(intByte(BL:List),
                         Ty:K, Rv:K, Ran:K, Bn:K)),
                        intLoc(A:K, Ty':K, Rv':K, Ran':K, Bn':K)) => undef
         requires N <Int Size andBool Rem >=Int numBitsPerByte
             andBool joinIntBits(BL, 0, 0, numBitsPerByte) =/=K undef
             andBool joinIntBits(BL, 0, 0, numBitsPerByte) =/=K poisonVal
             andBool (Ty =/=K Ty' orBool Rv =/=K Rv'
                             orBool Ran =/=K Ran' orBool Bn =/=K Bn')
    rule joinIntBytes(T:K, R:Int, N:Int, Rem:Int,
                 Size:Int, L:List ListItem(intLoc(intByte(BL:List),
                         Ty:K, Rv:K, Ran:K, Bn:K)),
                        intLoc(A:K, Ty:K, Rv:K, Ran:K, Bn:K))
               => joinIntBytes(T, (2 ^Int N)
                      *Int joinIntBits(BL, 0, 0, numBitsPerByte) +Int R,
                   N +Int numBitsPerByte, Rem -Int numBitsPerByte,
                Size, L, intLoc(A:K, Ty:K, Rv:K, Ran:K, Bn:K))
         requires N <Int Size andBool Rem >=Int numBitsPerByte
             andBool joinIntBits(BL, 0, 0, numBitsPerByte) =/=K undef
             andBool joinIntBits(BL, 0, 0, numBitsPerByte) =/=K poisonVal
    rule joinIntBytes(T:K, R:Int, N:Int, Rem:Int,
                 Size:Int, L:List ListItem(intLoc(intByte(BL:List),
                         Ty:K, Rv:K, Ran:K, Bn:K)),
                        intLoc(A:K, Ty':K, Rv':K, Ran':K, Bn':K)) => undef
         requires N <Int Size andBool Rem >=Int numBitsPerByte
             andBool joinIntBits(BL, 0, 0, numBitsPerByte) =/=K undef
             andBool joinIntBits(BL, 0, 0, numBitsPerByte) =/=K poisonVal
             andBool (Ty =/=K Ty' orBool Rv =/=K Rv'
                             orBool Ran =/=K Ran' orBool Bn =/=K Bn')
    rule joinIntBytes(T:K, R:Int, N:Int, Rem:Int,
                 Size:Int, L:List ListItem(intByte(BL:List)), A:K)
               => joinIntBytes(T, normalizingInt(T, (2 ^Int N) *Int
                      joinIntBits(BL, 0, 0, Rem) +Int R), Size, 0, Size, L, A:K)
         requires N <Int Size andBool Rem >Int 0
                  andBool Rem <Int numBitsPerByte
             andBool joinIntBits(BL, 0, 0, Rem) =/=K undef
             andBool joinIntBits(BL, 0, 0, Rem) =/=K poisonVal
    rule joinIntBytes(T:K, R:Int, N:Int, Rem:Int,
                 Size:Int, L:List ListItem(loc(intByte(BL:List),
                         Ty:K, Rv:K, Ran:K, Bn:K, InR:K)), none)
               => joinIntBytes(T, normalizingInt(T, (2 ^Int N) *Int
                      joinIntBits(BL, 0, 0, Rem) +Int R), Size, 0, Size,
                          L, intLoc(none, Ty, Rv, Ran, Bn))
         requires N <Int Size andBool Rem >Int 0
                  andBool Rem <Int numBitsPerByte
             andBool joinIntBits(BL, 0, 0, Rem) =/=K undef
             andBool joinIntBits(BL, 0, 0, Rem) =/=K poisonVal
    rule joinIntBytes(T:K, R:Int, N:Int, Rem:Int,
                 Size:Int, L:List ListItem(floatLoc(intByte(BL:List),
                         Ty:K, Rv:K, Ran:K, Bn:K)), none)
               => joinIntBytes(T, normalizingInt(T, (2 ^Int N) *Int
                      joinIntBits(BL, 0, 0, Rem) +Int R), Size, 0, Size,
                          L, intLoc(none, Ty, Rv, Ran, Bn))
         requires N <Int Size andBool Rem >Int 0
                  andBool Rem <Int numBitsPerByte
             andBool joinIntBits(BL, 0, 0, Rem) =/=K undef
             andBool joinIntBits(BL, 0, 0, Rem) =/=K poisonVal
    rule joinIntBytes(T:K, R:Int, N:Int, Rem:Int,
                 Size:Int, L:List ListItem(intLoc(intByte(BL:List),
                         Ty:K, Rv:K, Ran:K, Bn:K)), none)
               => joinIntBytes(T, normalizingInt(T, (2 ^Int N) *Int
                      joinIntBits(BL, 0, 0, Rem) +Int R), Size, 0, Size,
                          L, intLoc(none, Ty, Rv, Ran, Bn))
         requires N <Int Size andBool Rem >Int 0
                  andBool Rem <Int numBitsPerByte
             andBool joinIntBits(BL, 0, 0, Rem) =/=K undef
             andBool joinIntBits(BL, 0, 0, Rem) =/=K poisonVal
    rule joinIntBytes(T:K, R:Int, N:Int, Rem:Int,
                 Size:Int, L:List ListItem(loc(intByte(BL:List),
                         Ty:K, Rv:K, Ran:K, Bn:K, InR:K)),
                      intLoc(A:K, Ty':K, Rv':K, Ran':K, Bn':K)) => undef
         requires N <Int Size andBool Rem >Int 0
                  andBool Rem <Int numBitsPerByte
             andBool joinIntBits(BL, 0, 0, Rem) =/=K undef
             andBool joinIntBits(BL, 0, 0, Rem) =/=K poisonVal
             andBool (Ty =/=K Ty' orBool Rv =/=K Rv'
                             orBool Ran =/=K Ran' orBool Bn =/=K Bn')
    rule joinIntBytes(T:K, R:Int, N:Int, Rem:Int,
                 Size:Int, L:List ListItem(floatLoc(intByte(BL:List),
                         Ty:K, Rv:K, Ran:K, Bn:K)),
                      intLoc(A:K, Ty':K, Rv':K, Ran':K, Bn':K)) => undef
         requires N <Int Size andBool Rem >Int 0
                  andBool Rem <Int numBitsPerByte
             andBool joinIntBits(BL, 0, 0, Rem) =/=K undef
             andBool joinIntBits(BL, 0, 0, Rem) =/=K poisonVal
             andBool (Ty =/=K Ty' orBool Rv =/=K Rv'
                             orBool Ran =/=K Ran' orBool Bn =/=K Bn')
    rule joinIntBytes(T:K, R:Int, N:Int, Rem:Int,
                 Size:Int, L:List ListItem(intLoc(intByte(BL:List),
                         Ty:K, Rv:K, Ran:K, Bn:K)),
                      intLoc(A:K, Ty':K, Rv':K, Ran':K, Bn':K)) => undef
         requires N <Int Size andBool Rem >Int 0
                  andBool Rem <Int numBitsPerByte
             andBool joinIntBits(BL, 0, 0, Rem) =/=K undef
             andBool joinIntBits(BL, 0, 0, Rem) =/=K poisonVal
             andBool (Ty =/=K Ty' orBool Rv =/=K Rv'
                             orBool Ran =/=K Ran' orBool Bn =/=K Bn')
    //end of joining int bytes


    syntax KItem ::= joinIntBits(List, Int, Int, Int) [function]
                  //term, result, real bits, bound byte bits
    rule joinIntBits(L:List, R:Int, B:Int, B:Int) => R
    rule joinIntBits(L ListItem(undef), R, N, B) => undef
         requires N <Int B
    rule joinIntBits(L ListItem(poisonVal), R, N, B) => poisonVal
         requires N <Int B
    rule joinIntBits(L ListItem(X:Int), R:Int, N:Int, B:Int)
            => joinIntBits(L, ((2 ^Int N) *Int X) +Int R, N +Int 1, B)
         requires N <Int B


    //functions to split a whole data into list of bytes
    syntax KItem ::= splitBytes(K, K) [function]// value, type
    syntax List ::= splitBytesAux(K, K) [function]

    rule splitBytes(V:KResult, T:K)
                => region(splitBytesAux(V, T), sizeof(T))

    rule splitBytesAux(V:KResult, integerType(N:Int))
                  => splitIntByte(V, N, sizeof(integerType(N))
                 *Int numBitsPerByte)
    rule splitBytesAux(V:KResult, T:FPType)
          => splitFloatByte(V, T)

    rule splitBytesAux(V:KResult, pointerTypeValue(A:K, B:K))
                  => splitPointerByte(V, 0, sizeof(
                             pointerTypeValue(A:K, B:K)))
    rule splitBytesAux(V:KResult, arrayTypeValue(A:K, B:Int))
                  => splitArrayByte(V, 0, B, A)
    rule splitBytesAux(V:KResult, vectorTypeValue(A:K, B:Int))
                  => splitArrayByte(V, 0, B, A)
    rule splitBytesAux(V:KResult, packedStructTypeValue(T1:TypeList))
           => splitPackedStructByte(V, T1)
    rule splitBytesAux(V:KResult, structTypeValue(T1:TypeList))
           => splitStructByte(V, T1)

    //split bytes for float
    syntax Bool ::= isFloatForm(K) [function]
    rule isFloatForm(float(_:Int, _:Int, _:List)) => true
    rule isFloatForm(_) => false

    syntax KItem ::= convertToNormalFloat(K, Int, Int) [function]
    rule convertToNormalFloat(nan, E:Int, M:Int)
          => floatByte(ListItem(0) copyOfK(1,E), copyOfK(1,M))
    rule convertToNormalFloat(posInf, E:Int, M:Int)
          => floatByte(ListItem(0) copyOfK(1,E), copyOfK(0,M))
    rule convertToNormalFloat(negInf, E:Int, M:Int)
          => floatByte(ListItem(1) copyOfK(1,E), copyOfK(0,M))
    rule convertToNormalFloat(posZero, E:Int, M:Int)
          => floatByte(ListItem(0) copyOfK(0,E), copyOfK(0,M))
    rule convertToNormalFloat(negZero, E:Int, M:Int)
          => floatByte(ListItem(1) copyOfK(0,E), copyOfK(0,M))
    rule convertToNormalFloat(A:K, V:Int, D:Int) => A [owise]

    syntax List ::= insertFloatLocInfo(List, K, K, K, K) [function]
    rule insertFloatLocInfo(.List, A:K, B:K, C:K, D:K) => .List
    rule insertFloatLocInfo(ListItem(Loc:K) L:List, A:K, B:K, C:K, D:K)
        => ListItem(floatLoc(Loc, A, B, C, D))
            insertFloatLocInfo(L, A, B, C, D)

    syntax List ::= splitFloatByte(K, K) [function]
                  | splitFloatByteAux(List, Int, Int) [function]
                  | splitFloatByteAuxA(K, Int, Int) [function]
    rule splitFloatByte(V:K, T:K)
             => splitFloatByte(convertToNormalFloat(
                  V, exponentOf(T), mantissaOf(T)), T)
         requires V ==K nan orBool V ==K posZero
             orBool V ==K negZero orBool V ==K posInf
              orBool V ==K negInf
    rule splitFloatByte(float(N:Int, E:Int, M:List), T:K)
         => splitFloatByte(floatByte(ListItem(normalizingInt(
               integerType(1), N)) decToBin(E, exponentOf(T)), M), T)
    rule splitFloatByte(floatByte(L:List, R:List), ppc_fp128)
            => splitFloatByteAux(L:List copyOfK(0,sizeofInBits(ppc_fp128)
                   -Int mantissaOf(ppc_fp128) -Int exponentOf(ppc_fp128))
                          R:List, 0, sizeof(ppc_fp128))
    rule splitFloatByte(floatByte(L:List, R:List), T:K)
              => splitFloatByteAux(L R, 0, sizeof(T))
         requires T =/=K ppc_fp128
    rule splitFloatByte(floatLoc(A:K, B:K, C:K, D:K, E:K), T:K)
           => insertFloatLocInfo(splitFloatByte(A, T), B, C, D, E)

    rule splitFloatByteAux(.List, N:Int, N:Int) => .List
    rule splitFloatByteAux(L:List, X:Int, N:Int)
            => splitFloatByteAuxA(countByte(L, .List,
                numBitsPerByte), X, N)
         requires X <Int N
    rule splitFloatByteAuxA(countByteResult(Re:List, L:List), X, N)
           => ListItem(intByte(L))
                 splitFloatByteAux(Re, X +Int numBitsPerByte, N)

    syntax List ::= splitIntByteAux(K, Int) [function]
                  | splitIntByte(K, Int, Int) [function]
    rule splitIntByteAux(countByteResult(Re:List, L:List), A:Int)
          => .List
         requires A:Int <Int 0
    rule splitIntByteAux(countByteResult(Re:List, L:List), A:Int)
          => ListItem(intByte(L))
         requires A:Int ==Int 0
    rule splitIntByteAux(countByteResult(Re:List, L:List), A:Int)
          => ListItem(intByte(L))
             splitIntByteAux(countByte(Re, .List, numBitsPerByte),
               A -Int numBitsPerByte)
         requires A:Int >Int 0

    rule splitIntByteAux(intLoc(countByteResult(Re:List, L:List),
                   T:K, Fom:K, Ran:K, BA:K), A:Int) => .List
         requires A:Int <Int 0
    rule splitIntByteAux(intLoc(countByteResult(Re:List, L:List),
            T:K, Fom:K, Ran:K, BA:K), A:Int)
          => ListItem(intLoc(intByte(L),T:K, Fom:K, Ran:K, BA:K))
         requires A:Int ==Int 0
    rule splitIntByteAux(intLoc(countByteResult(Re:List, L:List),
           T:K, Fom:K, Ran:K, BA:K), A:Int)
          => ListItem(intLoc(intByte(L), T, Fom, Ran, BA))
             splitIntByteAux(intLoc(countByte(Re, .List, numBitsPerByte),
            T:K, Fom:K, Ran:K, BA:K), A -Int numBitsPerByte)
         requires A:Int >Int 0

    rule splitIntByte(A:K, N:Int, B:Int)
          => splitIntByteAux(countByte(splitIntBits(A, N, B), .List,
                              numBitsPerByte), B -Int numBitsPerByte)
          requires notBool isIntLoc(A)
    rule splitIntByte(intLoc(A:K, T:K, Fom:K, Ran:K, BA:K), N:Int, B:Int)
          => splitIntByteAux(intLoc(countByte(splitIntBits(A, N, B), .List,
                 numBitsPerByte), T:K, Fom:K, Ran:K, BA:K), B -Int numBitsPerByte)

    //deal with pointer splitting. 
    syntax List ::= insertLocInfo(List, K, K, K, K, K) [function]
    rule insertLocInfo(.List, A:K, B:K, C:K, D:K, E:K) => .List
    rule insertLocInfo(ListItem(Loc:K) L:List, A:K, B:K, C:K, D:K, E:K)
        => ListItem(loc(Loc, A, B, C, D, E))
            insertLocInfo(L, A, B, C, D, E)

    syntax List ::= splitPointerByte(K, Int, Int) [function]
    rule splitPointerByte(zeroinitializer, I:Int, N:Int)
           => splitPointerByte(loc(nullMemoryLoc, void,
                   value(nullMemoryLoc,nullMemoryLoc),heap,none, none), I, N)
    rule splitPointerByte(A:K, I:Int, N:Int)
             => ListItem(intByte(copyOfK(A, numBitsPerByte)))
                       splitPointerByte(A:K, I +Int 1, N)
         requires I <Int N andBool (A ==K undef orBool A ==K poisonVal)
    rule splitPointerByte(A:K, I:Int, N:Int) => .List
         requires I >=Int N
    rule splitPointerByte(loc(A:K, B:K, C:K, D:K, E:K, F:K), I:Int, N:Int)
             =>  insertLocInfo(splitIntByte(
                  A, N, N *Int numBitsPerByte), B, C, D, E, F)

    syntax List ::= splitArrayByte(K, Int, Int, K)  [function]
                  | splitArrayByteAux(ElemList, Int, Int, K)  [function]
    rule splitArrayByte(X:K, I:Int, N:Int, A:K)
          => splitBytesAux(X, A) splitArrayByte(X:K, I +Int 1, N, A)
         requires I <Int N andBool (X ==K undef orBool X ==K poisonVal)
    rule splitArrayByte(arrayValue(E:ElemList), I:Int, N:Int, A:K)
          => splitArrayByteAux(E, I, N, A)
         requires I <Int N
    rule splitArrayByte(vectorValue(E:ElemList), I:Int, N:Int, A:K)
          => splitArrayByteAux(E, I, N, A)
         requires I <Int N
    rule splitArrayByte(X:K, I:Int, N:Int, A:K) => .List
         requires I >=Int N
    rule splitArrayByteAux(.ElemList, I:Int, N:Int, A:K)
          => splitBytesAux(undef, A) splitArrayByteAux(.ElemList, I +Int 1, N, A)
         requires I <Int N
    rule splitArrayByteAux((valValue(X:K),E:ElemList), I:Int, N:Int, A:K)
          => splitBytesAux(X, A) splitArrayByteAux(E, I +Int 1, N, A)
         requires I <Int N
    rule splitArrayByteAux(E:ElemList, I:Int, N:Int, A:K) => .List
         requires I >=Int N

    //split on a packStructType
    syntax List ::= splitPackedStructByte(K, TypeList) [function]
    rule splitPackedStructByte(A:K, T:TypeList)
             => splitIntByte(A, sizeof(packedStructTypeValue(T)), 
                      sizeof(packedStructTypeValue(T)) *Int numBitsPerByte)
         requires A ==K undef orBool A ==K poisonVal
    rule splitPackedStructByte(packedStructVal(.ElemList), .TypeList) => .List
    rule splitPackedStructByte(packedStructVal(valValue(V:K),
                  Es:ElemList), (T:KResult, Ts:TypeList))
                => splitBytesAux(V, T) splitPackedStructByte(packedStructVal(Es), Ts)

    //deal with struct byte by filling gap with undef bits
    syntax List ::= fillUndefBits(Int, Int) [function]
    rule fillUndefBits(N, N:Int) => .List
    rule fillUndefBits(I:Int, N:Int) => ListItem(intByte(copyOfK(undef, numBitsPerByte)))
            fillUndefBits(I +Int 1, N)
         requires I <Int N

    syntax List ::= splitStructByte(K, TypeList) [function]
    rule splitStructByte(A:K, T:TypeList)
             => splitIntByte(A, sizeof(structTypeValue(T)), 
                      sizeof(structTypeValue(T)) *Int numBitsPerByte)
         requires A ==K undef orBool A ==K poisonVal
    rule splitStructByte(constStructVal(.ElemList), .TypeList) => .List
    rule splitStructByte(constStructVal(valValue(V:K),Es:ElemList),
            (T:KResult, Ts:TypeList))
           => splitBytesAux(V, T) splitStructByte(constStructVal(Es), Ts)
         requires (numBitsPerByte *Int structAlign)
                  dividesInt size(splitBytesAux(V, T))
    rule splitStructByte(constStructVal(valValue(V:K),Es:ElemList),
            (T:KResult, Ts:TypeList))
           => splitBytesAux(V, T) fillUndefBits(0, (size(splitBytesAux(V, T))
                /Int structAlign +Int 1) *Int structAlign)
              splitStructByte(constStructVal(Es), Ts)
         requires notBool structAlign dividesInt size(splitBytesAux(V, T))

    syntax Int ::= wvalist(List, K)
    //rule isNat(wvalist(_, _)) => true

    syntax KItem ::= "byteType" [function]
    rule byteType => integerType(numBitsPerByte)

    syntax KItem ::= i(K) [function]//[latex "i({#1})"]
    rule i(N:Int) => integerType(N)

    syntax Int ::= sizeofInBits(K) [function]

    //syntax Loc ::= intToPtrOfLoc(K, K)
    //syntax Int ::= ptrToIntOfLoc(K, K)
    syntax KItem ::= read(K, K) [strict(1)]
    syntax KItem ::= write(K, K, K) [strict] // type, value, location

    syntax Kitem ::= innerType(K) [function]
    rule innerType('pointerType(K:K,, _)) => K:K
    rule innerType(arrayType(K:K, _)) => K:K
    rule innerType(arrayTypeValue(K:K, _)) => K:K
    rule innerType(vectorType(K:K, _)) => K:K
    rule innerType(vectorTypeValue(K:K, _)) => K:K


    // these give the two's complement signed max and min of a type
    syntax Int ::= smax(K) [function]
    syntax Int ::= smin(K) [function]
    rule smax(Type:KResult) => (2 ^Int absInt(sizeofInBits(Type) -Int 1)) -Int 1
    rule smin(Type:KResult) => 0 -Int (2 ^Int absInt(sizeofInBits(Type) -Int 1))

    syntax Int ::= ufmax(K) [function]
    syntax Int ::= ufmin(K) [function]
    rule ufmax(Type:KResult) => (2 ^Int absInt(sizeofInBits(Type))) -Int 1
    rule ufmin(Type:KResult) => 0

    // should be a K, but builtins can't use K :(
    // declare signed : K K -> Nat // type, value
    syntax Int ::= signed(K, K) [function]
    //rule isNat(signed(_, _)) => true

    // case when in bounds
    rule signed(Type:KResult, I:Int) => I
        when smin(Type) <=Int I andBool smax(Type) >=Int I

    // this reduces it to be close
    rule signed(Type:KResult, I:Int)
            => signed(Type:KResult, I %Int (ufmax(Type) +Int 1))
        when I >Int ufmax(Type) // note umax here
    // this picks up any extra distance
    rule signed(Type:KResult, I:Int)
            => I -Int (ufmax(Type) +Int 1)
        when I >Int smax(Type) andBool I <=Int ufmax(Type)

    // same as above
    rule signed(Type:KResult, I:Int)
            => signed(Type:KResult, I %Int (ufmax(Type) +Int 1))
        when I <Int 0 -Int ufmax(Type)
    rule signed(Type:KResult, I:Int)
            => I +Int (ufmax(Type) +Int 1)
        when I <Int smin(Type) andBool I >=Int 0 -Int ufmax(Type)


    // computes the positive remainder, whereas % can returns a negative number
    // TODO maybe should go in pl builtins
    syntax Int ::= K "remInt" K [function]
    rule (I:Int remInt N:Int) => ((I %Int N) +Int N) %Int N

    // declare unsigned : K K -> Nat // type, value
    syntax Int ::= unsigned(K, K) [function]
    //rule isNat(unsigned(_, _)) => true

    rule unsigned(Type:KResult, N:Int) => N
        when ufmin(Type) <=Int N andBool ufmax(Type) >=Int N
    rule unsigned(Type:KResult, I:Int) => I remInt (ufmax(Type) +Int 1)
        when I <Int ufmin(Type)
    rule unsigned(Type:KResult, N:Int) => N %Int (ufmax(Type) +Int 1)
        when N >Int ufmax(Type)

    syntax Bool ::= isIntegerType(K) [function]
    rule isIntegerType(integerType(N:Int)) => true
         requires N >Int 0
    rule isIntegerType(_) => false [owise]

    syntax Bool ::= isFloatType(K) [function]
    rule isFloatType(F:FPType) => true
    rule isFloatType(_) => false [owise]

    syntax Bool ::= isFunType(K) [function]
    rule isFunType(functionTypeValue(A:K, B:K)) => true
    rule isFunType(_) => false [owise]

    syntax Bool ::= isVoidFunType(K) [function]
    rule isVoidFunType(functionTypeValue(void, B:K)) => true
    rule isVoidFunType('functionType(void,, B:ArgList)) => true
    rule isVoidFunType(_) => false [owise]

    syntax Bool ::= isRetTypeOfFun(K, K) [function]
    rule isRetTypeOfFun(functionTypeValue(T:K, B:K), T:K) => true
    rule isRetTypeOfFun(_,_) => false [owise]

    syntax Bool ::= isPointerType(K) [function]
    rule isPointerType('pointerType(_,, _)) => true
    rule isPointerType(pointerTypeValue(_, _)) => true
    rule isPointerType(_) => false [owise]

    syntax Bool ::= isValidCatchType(K) [function]
    rule isValidCatchType(pointerTypeValue(pointerTypeValue(
                    integerType(8), A2:K), A1:K)) => true
    rule isValidCatchType(_) => false [owise]

    syntax Bool ::= isValidFilterType(K) [function]
    rule isValidFilterType(arrayTypeValue(
        pointerTypeValue(pointerTypeValue(
            integerType(8), A2:K), A1:K), I:Int)) => true
    rule isValidFilterType(_) => false [owise]

    syntax Bool ::= isArrayType(K) [function]
    rule isArrayType(arrayType(_, _)) => true
    rule isArrayType(arrayTypeValue(_, _)) => true
    rule isArrayType(_) => false [owise]

    syntax Bool ::= isStructType(K)
    rule isStructType('structType(_)) => true
    rule isStructType(structTypeValue(_)) => true
    rule isStructType('packedStructType(_)) => true
    rule isStructType(packedStructTypeValue(_)) => true
    rule isStructType(_) => false [owise]
/*
    syntax Bool ::= isPackedStructType(K)
    rule isPackedStructType('packedStructType(_)) => true
    rule isPackedStructType(packedStructTypeValue(_)) => true
    rule isPackedStructType(_) => false [owise]
*/
    // fixme size should depend on architecture
    rule sizeofInBits(void) => 0
    rule sizeofInBits('pointerType(_,, _)) => numBytesPerPointer *Int numBitsPerByte
    rule sizeofInBits(pointerTypeValue(_, _)) => numBytesPerPointer *Int numBitsPerByte
    rule sizeofInBits(arrayType(Type:KResult, Len:Int)) => sizeofInBits(Type) *Int Len
    rule sizeofInBits(arrayTypeValue(Type:KResult, Len:Int)) => sizeofInBits(Type) *Int Len
    rule sizeofInBits(vectorType(Type:KResult, Len:Int)) => sizeofInBits(Type) *Int Len
    rule sizeofInBits(vectorTypeValue(Type:KResult, Len:Int)) => sizeofInBits(Type) *Int Len

    rule sizeofInBits(integerType(N:Int)) => N
    rule sizeofInBits(half) => 16
    rule sizeofInBits(float) => 32
    rule sizeofInBits(double) => 64
    rule sizeofInBits(x86_fp80) => 80
    rule sizeofInBits(ppc_fp128) => 128
    rule sizeofInBits(fp128) => 128
    // TODO listK should be Fields (bug in K)
    rule sizeofInBits(structTypeValue(Type:KResult, L:TypeList))
      => sizeofInBits(Type) +Int sizeofInBits(structTypeValue(L))
         requires (numBitsPerByte *Int structAlign)
                  dividesInt sizeofInBits(Type)
    rule sizeofInBits(structTypeValue(Type:KResult, L:TypeList))
      => (sizeofInBits(Type) /Int (numBitsPerByte *Int structAlign)
          +Int 1) *Int (numBitsPerByte *Int structAlign)
           +Int sizeofInBits(structTypeValue(L))
         requires notBool ((numBitsPerByte *Int structAlign)
                  dividesInt sizeofInBits(Type))
    rule sizeofInBits(structTypeValue(.TypeList)) => 0
    rule sizeofInBits('structType(Type:KResult, L:TypeList))
      => sizeofInBits(Type) +Int sizeofInBits('structType(L))
         requires (numBitsPerByte *Int structAlign)
                  dividesInt sizeofInBits(Type)
    rule sizeofInBits('structType(Type:KResult, L:TypeList))
      => (sizeofInBits(Type) /Int (numBitsPerByte *Int structAlign)
          +Int 1) *Int (numBitsPerByte *Int structAlign)
            +Int sizeofInBits('structType(L))
         requires notBool ((numBitsPerByte *Int structAlign)
                  dividesInt sizeofInBits(Type))
    rule sizeofInBits('structType(.TypeList)) => 0
    rule sizeofInBits(packedStructTypeValue(Type:KResult, L:TypeList))
      => sizeofInBits(Type) +Int sizeofInBits(packedStructTypeValue(L))
    rule sizeofInBits(packedStructTypeValue(.TypeList)) => 0

    syntax Int ::= sizeof(K) [function]
    rule sizeof(Type:KResult) => sizeofInBits(Type) /Int numBitsPerByte
        requires numBitsPerByte dividesInt sizeofInBits(Type)
    rule sizeof(Type:KResult) => sizeofInBits(Type) /Int numBitsPerByte +Int 1
        requires notBool (numBitsPerByte dividesInt sizeofInBits(Type))

    //calculate the offset of a element type in a struct
    syntax Int ::= bitsofStruct(K, Int, Int) [function]//type, position, offset 
    rule bitsofStruct(T:K, 0, Off:Int) => Off
    rule bitsofStruct(structTypeValue(.TypeList), N:Int, Off:Int) => -1
         requires N >Int 0 
    rule bitsofStruct(structTypeValue(Type:KResult, L:TypeList), N:Int, Off:Int)
         => bitsofStruct(structTypeValue(L), N -Int 1, Off +Int sizeofInBits(Type))
            requires N >Int 0 andBool (numBitsPerByte *Int structAlign)
                  dividesInt sizeofInBits(Type)
    rule bitsofStruct(structTypeValue(Type:KResult, L:TypeList), N:Int, Off:Int)
         => bitsofStruct(structTypeValue(L), N -Int 1, Off +Int
            (sizeofInBits(Type) /Int (numBitsPerByte *Int structAlign)
               +Int 1) *Int (numBitsPerByte *Int structAlign))
         requires N >Int 0 andBool notBool ((numBitsPerByte *Int structAlign)
                  dividesInt sizeofInBits(Type))

    syntax Int ::= sizeOfStruct(K, K) [function] //type, position
    rule sizeOfStruct(T:K, N:Int) => bitsofStruct(T, N, 0) /Int numBitsPerByte
         requires bitsofStruct(T, N, 0) =/=K -1
    rule sizeOfStruct(T:K, N:Int) => -1
         requires bitsofStruct(T, N, 0) ==K -1
    rule sizeOfStruct(T:K, N:K) => -1 [owise]

    syntax KItem ::= getTypeInStruct(K, Int) [function]
    rule getTypeInStruct(structTypeValue(.TypeList), N:Int) => none
         requires N >Int 0
    rule getTypeInStruct(structTypeValue(T:KResult, Ts:TypeList), 0) => T
    rule getTypeInStruct(structTypeValue(T:KResult, Ts:TypeList), N:Int)
          => getTypeInStruct(structTypeValue(Ts), N -Int 1)
         requires N >Int 0

    syntax KItem ::= zeroOfType(K)
    rule zeroOfType(Type:KResult) => 0
        when isIntegerType(Type)


    syntax List ::= K "copiesOf" List [function]
    rule N:Int copiesOf L:List => L (N:Int -Int 1 copiesOf L)
        when N:Int >Int 0
    rule 0 copiesOf _ => .List

    // define N:Int +Int (Offset:Int +Int sym(Base:Int))
        // => (N +Int Offset) +Int sym(Base)

    // define I:Int +Int (Offset:Int +Int sym(Base:Int))
        // => (absInt(I +Int Offset)) +Int sym(Base)
        // when I <Int 0 andBool I +Int Offset >=Int 0

    syntax SymbolicValueRef ::= makeVarFromLabel(LabelStringConstant)
                                [function]
    rule makeVarFromLabel(L:LabelStringConstant)
              => name(localVar, substrString(#tokenToString(L), 0
                    , lengthString(#tokenToString(L)) -Int 1))

/*
    syntax ElemList ::= formCases(K) [function]
                      | formCasesInList(ElemList, ElemList) [function]

    rule formCases(.JumpTable) => .ElemList
    rule formCases(It:IntType Ca:ConstValueRef,
                 label Va:ValueRef Cs:JumpTable)
                 => val(case(operand(It,addNameToString(Ca))
                                 ,addNameToString(Va))), formCases(Cs)
    rule formCases(K:K) => K [owise]

    rule formCasesInList(.ElemList, Es:ElemList) => .ElemList
    rule formCasesInList(valValue(typeOperandResult(T:KResult, A:K)), E1:ElemList,
                   val(La:K), E2:ElemList) => val(case(operand(T,A), La)), formCasesInList(E1,E2)
*/

/*
    syntax ElemList ::= toCallees(ParamList) [function]

    rule toCallees(.ParamList) => .ElemList
    rule toCallees(Ty:Type Pa:ParamAttrs V:ValueRef,Pl:ParamList)
                => val(callee(operand(addNameToString(Ty)
                  ,addNameToString(V)),modifiers(formElemList(Pa)))),toCallees(Pl)
*/
    syntax KItem ::= getMainOp(K) [function]
    rule getMainOp(Op:FloatOps F:FastMathFlags) => Op
    rule getMainOp(Op:IntConstructors S:OptNW) => Op
    rule getMainOp(Op:DivConstructors S:OptExact) => Op
    rule getMainOp(Op:ArithmeticOps) => Op

    syntax Int ::= mod(Int, Int)   [function]
    rule mod(I1:Int, I2:Int) => I1 %Int I2
        requires I1 >=Int 0
    rule mod(I1:Int, I2:Int) => I1 %Int I2 +Int I2
        requires I1 <Int 0

    syntax Bool ::= isTheInt(K)            [function]
                  | isTheBool(K)           [function]
                  | isTheLocalName(K)      [function]

    rule isTheInt(I:Int) => true
    rule isTheInt(K:K) => false [owise]
    rule isTheBool(I:Bool) => true
    rule isTheBool(K:K) => false [owise]
    rule isTheLocalName(I:LocalName) => true
    rule isTheLocalName(K:K) => false [owise]

    syntax KItem ::= getInnerType(K) [function]
    rule getInnerType(vectorTypeValue(T:K, N:Int)) => T
    rule getInnerType(arrayTypeValue(T:K, N:Int)) => T
    rule getInnerType(pointerTypeValue(T:K, A:K)) => T

    syntax KItem ::= getIntType(K)    [function]
                   | getIntInIntType(K) [function]
    rule getIntType(integerType(N:Int)) => integerType(N:Int)
    rule getIntType(T:FPType) => T
    rule getIntType(vectorTypeValue(T:K, N:Int)) => T
    rule getIntType(K:K) => K [owise]
    rule getIntInIntType(integerType(N:Int)) => N
    rule getIntInIntType(vectorTypeValue(T:K, N:Int)) => getIntInIntType(T)
    rule getIntInIntType(K:K) => K [owise]

    syntax KItem ::= normalizingInt(K, K) [function]// type, int
                   | deNormalizingInt(K, Int) [function]
                   | applyInts(K, K, K, K, Set, ElemList) [function]
                              // op, type, int, int, flags
                   | applyInt(K, K, K, K, Set) [function]
                                // op, type, int, int, flags
                   | applyFloats(K, K, K, K) [function]
                              // op, type, floats, floats
                   | applyFloat(K, K, K, K) [function]
                                // op, type, float, float
                   | checkInt(K, K, K, Set) [function]
                                 //type, unsign, sign, flags
                   | checkExact(K, K, K, Set) [function]
                                 //type, value, flags
                   | applyOp(K, K, K)     [function] // op, int, int
                   | applyCast(K, K, K, K)   [function] //op, type ints, type
                   | applyCasts(K, K, K, K)   [function] //op, type ints, type
                   | applySelect(K, K, K) [function] //bool, first, second
                   | applySelects(K, K, K) [function] //bool, first, second
                   | applyIcmps(K, K, K, K, ElemList) [function]
                                        // op, type, value1, value2, vector
                   | applyIcmp(K, K, K, K) [function] // op, type, int, int
                   | outOfSignScope(Int, K) [function]
                   | calShiftValue(Int, Int) [function]

    syntax ElemList ::= applySelectsAux(K, K, K) [function] //bool, first, second
     
    syntax Int ::= boolToInt(Bool)   [function]
    rule boolToInt(true) => 1
    rule boolToInt(false) => 0

    syntax ElemList ::= makeResultList(Int, K) [function]

    rule makeResultList(0, A:K) => .ElemList
    rule makeResultList(N:Int, A:KResult)
              => valValue(A),makeResultList(N -Int 1, A)
         requires N >Int 0
    rule makeResultList(N:Int, A:K) => .ElemList [owise]

    rule calShiftValue(N:Int, 0) => 0
    rule calShiftValue(N:Int, I:Int)
           => (2 ^Int N) +Int calShiftValue(N -Int 1, I -Int 1)
         requires N >=Int 0 andBool I =/=K 0
    rule calShiftValue(N:Int, I:Int) => 0
         requires N <Int 0

    rule outOfSignScope(V:Int, integerType(N:Int)) => true
         requires V >=Int (2 ^Int (N -Int 1))
    rule outOfSignScope(V:Int, integerType(N:Int)) => true
         requires V <Int (0 -Int (2 ^Int (N -Int 1)))
    rule outOfSignScope(V:Int, A:K) => false [owise]

    rule deNormalizingInt(integerType(N:Int), V:Int) => V
         requires V <Int (2 ^Int (N -Int 1))
    rule deNormalizingInt(integerType(N:Int), V:Int) => (V -Int (2 ^Int N))
         requires V >=Int (2 ^Int (N -Int 1))

    rule normalizingInt(integerType(N:Int), V:Int) => mod(V, 2 ^Int N)
    rule normalizingInt(integerType(N:Int), vectorValue(valValue(I:Int),Es:ElemList))
                       => vectorValue(valValue(mod(I, 2 ^Int N)),
                           normalizingInt(integerType(N:Int), Es:ElemList))
    rule normalizingInt(integerType(N:Int), valValue(I:Int),Es:ElemList)
                       => valValue(mod(I, 2 ^Int N)),
                           normalizingInt(integerType(N:Int), Es:ElemList)
    rule normalizingInt(integerType(N:Int), vectorValue(valValue(K:K),Es:ElemList))
                       => vectorValue(valValue(K),
                           normalizingInt(integerType(N:Int), vectorValue(Es:ElemList)))
         requires notBool isTheInt(K)
    rule normalizingInt(integerType(N:Int), valValue(K:K),Es:ElemList)
                       => valValue(K),
                           normalizingInt(integerType(N:Int), vectorValue(Es:ElemList))
         requires notBool isTheInt(K)
    rule normalizingInt(A:K, .ElemList) => .ElemList
    rule normalizingInt(A:K, K:K) => K
         requires getKLabel(K) ==KLabel 'poisonVal
                             orBool getKLabel(K) ==KLabel 'undef
 
    rule applyOp('add(.KList), V1:Int, V2:Int) => V1 +Int V2
    rule applyOp('sub(.KList), V1:Int, V2:Int) => V1 -Int V2
    rule applyOp('mul(.KList), V1:Int, V2:Int) => V1 *Int V2
    rule applyOp('shl(.KList), V1:Int, V2:Int) => V1 *Int (2 ^Int V2)
    rule applyOp('or(.KList), V1:Int, V2:Int) => V1 |Int V2
    rule applyOp('and(.KList), V1:Int, V2:Int) => V1 &Int V2
    rule applyOp('xor(.KList), V1:Int, V2:Int) => V1 xorInt V2
    rule applyOp('sdiv(.KList), V1:Int, V2:Int) => V1 /Int V2
    rule applyOp('udiv(.KList), V1:Int, V2:Int) => V1 /Int V2
    rule applyOp(lshr, V1:Int, V2:Int) => V1 /Int (2 ^Int V2)
    rule applyOp(ashr, V1:Int, V2:Int) => V1 /Int (2 ^Int V2)
    rule applyOp(urem, V1:Int, V2:Int) => V1 %Int V2
    rule applyOp(srem, V1:Int, V2:Int) => V1 %Int V2
    rule applyOp(eq, V1:Int, V2:Int) => boolToInt(V1 ==Int V2)
    rule applyOp(eq, loc(X:Int, Y:K, R:K,RT:K, BA:K, In:K),
                       loc(X':Int, Y':K,R':K,RT':K,BA':K, In':K))
                  => boolToInt(X ==Int X')
    rule applyOp(ne, V1:Int, V2:Int) => boolToInt(V1 =/=Int V2)
    rule applyOp(ne, loc(X:Int, Y:K,R:K,RT:K,BA:K, In:K),
                          loc(X':Int, Y':K,R':K,RT':K,BA':K, In':K))
                  => boolToInt(X =/=Int X')
    rule applyOp(Op:K, V1:Int, V2:Int) => boolToInt(V1 >Int V2)
         requires Op ==K 'ugtOfIcmp(.KList) orBool Op ==K sgt
    rule applyOp(Op:K, loc(X:Int, Y:K,R:K,RT:K,BA:K, In:K),
                         loc(X':Int, Y':K,R':K,RT':K,BA':K, In':K))
                => boolToInt(X  >Int X')
    rule applyOp(Op:K, V1:Int, V2:Int) => boolToInt(V1 >=Int V2)
         requires Op ==K 'ugeOfIcmp(.KList) orBool Op ==K sge
    rule applyOp(Op:K, loc(X:Int, Y:K,R:K,RT:K,BA:K, In:K),
                            loc(X':Int, Y':K,R':K,RT':K,BA':K, In':K))
            => boolToInt(X >=Int X')
    rule applyOp(Op:K, V1:Int, V2:Int) => boolToInt(V1 <Int V2)
         requires Op ==K 'ultOfIcmp(.KList) orBool Op ==K slt
    rule applyOp(Op:K, loc(X:Int, Y:K,R:K,RT:K,BA:K, In:K),
                           loc(X':Int, Y':K,R':K,RT':K,BA':K, In':K))
              => boolToInt(X <Int X')
    rule applyOp(Op:K, V1:Int, V2:Int) => boolToInt(V1 <=Int V2)
         requires Op ==K 'uleOfIcmp(.KList) orBool Op ==K sle
    rule applyOp(Op:K, loc(X:Int, Y:K,R:K,RT:K,BA:K, In:K),
                          loc(X':Int, Y':K,R':K,RT':K,BA':K, In':K))
         => boolToInt(X <=Int X')

    rule checkInt(integerType(N:Int), V1:Int, V2:Int, S:Set)
                      => normalizingInt(integerType(N:Int), V1)
         requires (nuw in S) andBool (nsw in S)
               andBool goodNuw(integerType(N:Int), V1)
               andBool goodNsw(integerType(N:Int), V2)
    rule checkInt(integerType(N:Int), V1:Int, V2:Int, S:Set)
                  => normalizingInt(integerType(N:Int), V1)
         requires (nuw in S) andBool (notBool (nsw in S))
               andBool goodNuw(integerType(N:Int), V1)
    rule checkInt(integerType(N:Int), V1:Int, V2:Int, S:Set)
                 => normalizingInt(integerType(N:Int), V1)
         requires (notBool (nuw in S)) andBool (nsw in S)
               andBool goodNsw(integerType(N:Int), V2)
    rule checkInt(integerType(N:Int), V1:Int, V2:Int, S:Set)
                 => normalizingInt(integerType(N:Int), V1)
         requires (notBool (nuw in S)) andBool (notBool (nsw in S))
    rule checkInt(integerType(N:Int), V1:Int, V2:Int, S:Set) => poisonVal
         requires (nuw in S) andBool
                    notBool goodNuw(integerType(N:Int), V1)
    rule checkInt(integerType(N:Int), V1:Int, V2:Int, S:Set) => poisonVal
         requires (nsw in S) andBool
                    notBool goodNsw(integerType(N:Int), V2)

    //input of apply int, assuming that v1 and v2 have been normalized.
    rule applyInt(Op:K, X:K, badValue, V2:K, S:Set) => badValue
    rule applyInt(Op:K, X:K, V1:K, badValue, S:Set) => badValue
    rule applyInt(Op:K, X:K, poisonVal, V2:K, S:Set) => poisonVal
         requires V2 =/=K badValue
    rule applyInt(Op:K, X:K, V1:K, poisonVal, S:Set) => poisonVal
         requires V1 =/=K badValue
    rule applyInt(Op:K, X:K, zeroinitializer, V2:K, S:Set)
          => applyInt(Op, X, 0, V2, S)
    rule applyInt(Op:K, X:K, V1:K, zeroinitializer, S:Set)
          => applyInt(Op, X, V1, 0, S)
    rule applyInt(Op:K, X:K, V1:K, undef, S:Set) => undef
         requires Op =/=K 'or(.KList) andBool Op =/=K 'and(.KList)
               andBool V1 =/=K badValue andBool V1 =/=K poisonVal
    rule applyInt(Op:K, X:K, undef, V2:K, S:Set) => undef
         requires Op =/=K 'or(.KList) andBool Op =/=K 'and(.KList)
               andBool V2 =/=K badValue andBool V2 =/=K poisonVal
    rule applyInt('or(.KList), integerType(N:Int),
                      V1:Int, undef, S:Set) => undef
         requires V1 =/=K ((2 ^Int N) -Int 1)
    rule applyInt('or(.KList), integerType(N:Int),
                      V1:Int, undef, S:Set) => V1
         requires V1 ==K ((2 ^Int N) -Int 1)
    rule applyInt('or(.KList), integerType(N:Int),
                      undef, V2:Int, S:Set) => undef
         requires V2 =/=K ((2 ^Int N) -Int 1)
    rule applyInt('or(.KList), integerType(N:Int),
                      undef, V2:Int, S:Set) => V2
         requires V2 ==K ((2 ^Int N) -Int 1)
    rule applyInt('and(.KList), integerType(N:Int),
                      V1:Int, undef, S:Set) => undef
         requires V1 =/=K 0
    rule applyInt('and(.KList), integerType(N:Int),
                      V1:Int, undef, S:Set) => V1
         requires V1 ==K 0
    rule applyInt('and(.KList), integerType(N:Int),
                      undef, V2:Int, S:Set) => undef
         requires V2 =/=K 0
    rule applyInt('and(.KList), integerType(N:Int),
                      undef, V2:Int, S:Set) => V2
         requires V2 ==K 0
    rule applyInt(Op:K, T:K, V1:Int, V2:Int, S:Set)
             => checkInt(T, applyOp(Op, V1, V2),
                 applyOp(Op, deNormalizingInt(T, V1),
                            deNormalizingInt(T,V2)), S)
         requires Op ==K 'add(.KList)
                  orBool Op ==K 'sub(.KList)
                  orBool Op ==K 'mul(.KList)
    rule applyInt(Op:LogicalOps, T:K, V1:Int, V2:Int, S:Set)
             => applyOp(Op, V1, V2)
    rule applyInt(shl, integerType(N:Int),
                   V1:Int, V2:Int, S:Set) => poisonVal
         requires V2 >=Int N
    rule applyInt(shl, integerType(N:Int),
                V1:Int, V2:Int, S:Set) => poisonVal
         requires V2 <Int N
         andBool deNormalizingInt(integerType(N:Int), V1) <Int 0
           andBool applyOp(shl,
                 deNormalizingInt(integerType(N:Int), V1), V2) >=Int 0

    rule applyInt(shl, integerType(N:Int), V1:Int, V2:Int, S:Set)
             => checkInt(integerType(N:Int), applyOp(shl, V1, V2),
             applyOp(shl,
                 deNormalizingInt(integerType(N:Int), V1), V2), S)
         requires V2 <Int N
          andBool deNormalizingInt(integerType(N:Int), V1) <Int 0
           andBool applyOp(shl,
            deNormalizingInt(integerType(N:Int), V1), V2) <Int 0
    rule applyInt(shl, integerType(N:Int), V1:Int, V2:Int, S:Set)
             => checkInt(integerType(N:Int), applyOp(shl, V1, V2),
                 applyOp(shl,
                    deNormalizingInt(integerType(N:Int), V1), V2), S)
         requires V2 <Int N
               andBool deNormalizingInt(integerType(N:Int), V1) >=Int 0
    rule applyInt(udiv, T:K, V1:Int, V2:Int, S:Set) => badValue
         requires V2 ==K 0
    rule applyInt(udiv, T:K, V1:Int, V2:Int, S:Set) => poisonVal
         requires V2 =/=K 0 andBool (exact in S andBool V1 %Int V2 =/=K 0)
    rule applyInt(udiv, T:K, V1:Int, V2:Int, S:Set) => applyOp(udiv, V1, V2)
         requires V2 =/=K 0 andBool
                ((exact in S andBool V1 %Int V2 ==K 0)
                orBool (notBool (exact in S)))
    rule applyInt(sdiv, T:K, V1:Int, V2:Int, S:Set) => badValue
         requires V2 ==K 0
    rule applyInt(sdiv, integerType(N:Int),
               V1:Int, V2:Int, S:Set) => badValue
         requires V2 =/=K 0
            andBool outOfSignScope(applyOp(sdiv,
             deNormalizingInt(integerType(N:Int), V1),
              deNormalizingInt(integerType(N:Int),V2)), integerType(N:Int))
    rule applyInt(sdiv, integerType(N:Int),
               V1:Int, V2:Int, S:Set) => poisonVal
         requires V2 =/=K 0
            andBool notBool outOfSignScope(applyOp(sdiv,
             deNormalizingInt(integerType(N:Int), V1),
              deNormalizingInt(integerType(N:Int),V2)), integerType(N:Int))
           andBool (exact in S andBool deNormalizingInt(integerType(N:Int), V1)
                         %Int deNormalizingInt(integerType(N:Int),V2) =/=K 0)
    rule applyInt(sdiv, integerType(N:Int),
               V1:Int, V2:Int, S:Set) => applyOp(sdiv,
                          deNormalizingInt(integerType(N:Int), V1),
                                    deNormalizingInt(integerType(N:Int),V2))
         requires V2 =/=K 0
            andBool notBool outOfSignScope(applyOp(sdiv,
             deNormalizingInt(integerType(N:Int), V1),
              deNormalizingInt(integerType(N:Int),V2)), integerType(N:Int))
           andBool ((exact in S
                     andBool deNormalizingInt(integerType(N:Int), V1)
                           %Int deNormalizingInt(integerType(N:Int),V2) ==K 0)
                      orBool (notBool (exact in S)))
    rule applyInt(Op:K, integerType(N:Int),
                   V1:Int, V2:Int, S:Set) => poisonVal
         requires V2 >=Int N andBool (Op ==K lshr orBool Op ==K ashr)
    rule applyInt(Op:K, integerType(N:Int),
                   V1:Int, V2:Int, S:Set) => poisonVal
         requires V2 <Int N andBool (exact in S)
             andBool (Op ==K lshr orBool Op ==K ashr)
              andBool V1 %Int (2 ^Int V2) =/=K 0
    rule applyInt(lshr, integerType(N:Int),
                   V1:Int, V2:Int, S:Set) => applyOp(lshr, V1, V2)
         requires V2 <Int N
           andBool ((notBool (exact in S))
                 orBool ((exact in S)
                  andBool V1 %Int (2 ^Int V2) ==K 0))
    rule applyInt(ashr, integerType(N:Int),
                   V1:Int, V2:Int, S:Set) => applyOp(ashr, V1, V2)
         requires V2 <Int N
           andBool V2 <Int (2 ^Int (N -Int 1))
           andBool ((notBool (exact in S))
                 orBool ((exact in S)
                  andBool V1 %Int (2 ^Int V2) ==K 0))
    rule applyInt(ashr, integerType(N:Int),
                   V1:Int, V2:Int, S:Set) =>
            calShiftValue(N -Int 1, V2) +Int applyOp(ashr, V1, V2)
         requires V2 <Int N
           andBool V2 >=Int (2 ^Int (N -Int 1))
           andBool ((notBool (exact in S))
                 orBool ((exact in S)
                  andBool V1 %Int (2 ^Int V2) ==K 0))
    rule applyInt(urem, integerType(N:Int),
                   V1:Int, V2:Int, S:Set) => badValue
         requires V2 ==K 0
    rule applyInt(urem, integerType(N:Int),
                   V1:Int, V2:Int, S:Set)
                          => applyOp(urem, normalizingInt(integerType(N:Int),V1),
                  normalizingInt(integerType(N:Int),V2))
         requires V2 =/=K 0
    rule applyInt(srem, integerType(N:Int),
                   V1:Int, V2:Int, S:Set) => badValue
         requires V2 ==K 0
    rule applyInt(srem, integerType(N:Int),
                   V1:Int, V2:Int, S:Set) => badValue
         requires V2 =/=K 0
           andBool outOfSignScope(applyOp(sdiv,
             deNormalizingInt(integerType(N:Int), V1),
              deNormalizingInt(integerType(N:Int),V2)),
                integerType(N:Int))
    rule applyInt(srem, integerType(N:Int),
                   V1:Int, V2:Int, S:Set)
            => applyOp(srem,
             deNormalizingInt(integerType(N:Int), V1),
              deNormalizingInt(integerType(N:Int),V2))
         requires V2 =/=K 0
           andBool notBool outOfSignScope(applyOp(sdiv,
             deNormalizingInt(integerType(N:Int), V1),
              deNormalizingInt(integerType(N:Int),V2)),
                integerType(N:Int))

    rule applyInts(Op:K, T:K, V1:Int, V2:Int, S:Set, Es:ElemList)
         => applyInt(Op, T, V1, V2, S)
    rule applyInts(Op:K, T:K, badValue, V2:K, S:Set, Es:ElemList)
         => badValue
    rule applyInts(Op:K, T:K, V1:K, badValue, S:Set, Es:ElemList)
         => badValue
    rule applyInts(Op:K, T:K, poisonVal, V2:K, S:Set, Es:ElemList)
         => poisonVal
         requires V2 =/=K badValue
    rule applyInts(Op:K, T:K, V1:K, poisonVal, S:Set, Es:ElemList)
         => poisonVal
         requires V1 =/=K badValue
    rule applyInts(Op:K, T:K, undef, undef, S:Set, Es:ElemList)
         => undef
    rule applyInts(Op:K, integerType(N:Int),
                    undef, V2:Int, S:Set, Es:ElemList)
         => applyInt(Op, integerType(N:Int), undef, V2, S:Set)
    rule applyInts(Op:K, integerType(N:Int),
                    V1:Int, undef, S:Set, Es:ElemList)
         => applyInt(Op, integerType(N:Int), V1, undef, S:Set)
    rule applyInts(Op:K, T:K, zeroinitializer,
                    X:K, S:Set, Es:ElemList)
         => applyInts(Op, T:K, dealWithZeroInitializer(T), X, S:Set, Es)
    rule applyInts(Op:K, T:K, X:K,
                   zeroinitializer, S:Set, Es:ElemList)
         => applyInts(Op, T:K, X,dealWithZeroInitializer(T), S:Set, Es)
    rule applyInts(Op:K, T:K, vectorValue(.ElemList),
                        vectorValue(.ElemList), S:Set, Es:ElemList)
         => vectorValue(Es)
    rule applyInts(Op:K, vectorTypeValue(T:K, N:Int), undef,
                        V2:K, S:Set, Es:ElemList)
         => applyInts(Op:K, vectorTypeValue(T:K, N:Int),
               vectorValue(makeResultList(N, undef)),
                        V2, S:Set, Es:ElemList)
         requires V2 =/=K undef
    rule applyInts(Op:K, vectorTypeValue(T:K, N:Int),
          V1:K, undef, S:Set, Es:ElemList)
         => applyInts(Op:K, vectorTypeValue(T:K, N:Int), V1,
               vectorValue(makeResultList(N, undef)),
                            S:Set, Es:ElemList)
         requires V1 =/=K undef
    rule applyInts(Op:K, T:K, vectorValue(valValue(V1:K),E1:ElemList),
           vectorValue(valValue(V2:K),E2:ElemList), S:Set, Es:ElemList)
         => applyInts(Op, T, vectorValue(E1), vectorValue(E2), S,
                addElemToEnd(valValue(applyInt(Op, getIntType(T), V1, V2, S)), Es))
         requires applyInt(Op, getIntType(T), V1, V2, S) =/=K badValue
    rule applyInts(Op:K, T:K, vectorValue(valValue(V1:K),E1:ElemList),
           vectorValue(valValue(V2:K),E2:ElemList), S:Set, Es:ElemList)
         => badValue
         requires applyInt(Op, getIntType(T), V1, V2, S) ==K badValue

    //floating addition
    syntax KItem ::= addTwoFloat(List, List, List, Int) [function]
    rule addTwoFloat(.List, .List,L:List, A:Int) => holdDigits(A, L)
    rule addTwoFloat(L1:List ListItem(A:Int), L2:List ListItem(B:Int),
                 L3:List, C:Int) => addTwoFloat(L1, L2,
                       ListItem(A +Int B +Int C -Int 2) L3, 1)
         requires A +Int B +Int C >=Int 2
    rule addTwoFloat(L1:List ListItem(A:Int), L2:List ListItem(B:Int),
                 L3:List, C:Int) => addTwoFloat(L1, L2,
                       ListItem(A +Int B +Int C) L3, 0)
         requires A +Int B +Int C <Int 2

    //floating subtration
    //if left is bigger than right in floats,
     // if two have the same mantissa length
    syntax Bool ::= isListEqual(List, List) [function]
    rule isListEqual(.List, .List) => true
    rule isListEqual(ListItem(A:Int) L:List, ListItem(A) L':List)
          => isListEqual(L, L')
    rule isListEqual(ListItem(A:Int) L:List, ListItem(A':K) L':List) => false
         requires A =/=K A'

    syntax Bool ::= isEqualBigger(List, List)  [function]
    rule isEqualBigger(.List, .List) => true
    rule isEqualBigger(ListItem(A:Int) L:List, ListItem(A) L':List)
             => isEqualBigger(L, L')
    rule isEqualBigger(ListItem(0) L:List, ListItem(1) L':List) => false
    rule isEqualBigger(ListItem(1) L:List, ListItem(0) L':List) => true

    syntax KItem ::= subTwoFloat(List, List, List, Int) [function]
    rule subTwoFloat(.List, .List,L:List, A:Int) => holdDigits(A, L)
    rule subTwoFloat(L1:List ListItem(0), L2:List ListItem(0), L:List, 0)
            => subTwoFloat(L1, L2, ListItem(0) L, 0)
    rule subTwoFloat(L1:List ListItem(0), L2:List ListItem(0), L:List, 1)
            => subTwoFloat(L1, L2, ListItem(1) L, 1)
    rule subTwoFloat(L1:List ListItem(1), L2:List ListItem(0), L:List, 0)
            => subTwoFloat(L1, L2, ListItem(1) L, 0)
    rule subTwoFloat(L1:List ListItem(1), L2:List ListItem(0), L:List, 1)
            => subTwoFloat(L1, L2, ListItem(0) L, 0)
    rule subTwoFloat(L1:List ListItem(0), L2:List ListItem(1), L:List, 0)
            => subTwoFloat(L1, L2, ListItem(1) L, 1)
    rule subTwoFloat(L1:List ListItem(0), L2:List ListItem(1), L:List, 1)
            => subTwoFloat(L1, L2, ListItem(0) L, 1)
    rule subTwoFloat(L1:List ListItem(1), L2:List ListItem(1), L:List, 0)
            => subTwoFloat(L1, L2, ListItem(0) L, 0)
    rule subTwoFloat(L1:List ListItem(1), L2:List ListItem(1), L:List, 1)
            => subTwoFloat(L1, L2, ListItem(1) L, 1)

    syntax List ::= cutMantissaBack(List, Int) [function]
    rule cutMantissaBack(L:List, 0) => L
    rule cutMantissaBack(L:List ListItem(A:Int), N:Int)
              => cutMantissaBack(L, N -Int 1)
         requires N >Int 0

    syntax KItem ::= roundingAddFloat(K, List, Int, Int, Int) [function]
                       //ty, mantissas, sign, high, low exp
    rule roundingAddFloat(T:K, L:List, 0, X:Int, Y:Int) => posZero
         requires X -Int Y >Int mantissaOf(T) +Int 1
    rule roundingAddFloat(T:K, L:List, 1, X:Int, Y:Int) => negZero
         requires X -Int Y >Int mantissaOf(T) +Int 1
    rule roundingAddFloat(T:K, L:List, S:Int, X:Int, Y:Int)
             => float(S, X, copyOfK(0, X -Int Y)
                          cutMantissaBack(L, X -Int Y))
         requires X -Int Y <=Int mantissaOf(T) +Int 1

    syntax KItem ::= roundingSubFloat(K, List, Int, Int, Int) [function]
    rule roundingSubFloat(T:K, L:List, 0, X:Int, Y:Int) => posZero
         requires X -Int Y >Int mantissaOf(T) +Int 1
    rule roundingSubFloat(T:K, L:List, 1, X:Int, Y:Int) => negZero
         requires X -Int Y >Int mantissaOf(T) +Int 1
    rule roundingSubFloat(T:K, L:List, S:Int, X:Int, Y:Int)
             => float(S, X, copyOfK(0, X -Int Y) L)
         requires X -Int Y <=Int mantissaOf(T) +Int 1

    syntax KItem ::= formNewFloat(K, Int, Int, List)  [function]
    rule formNewFloat(T:K, 0, B:Int, ListItem(0)) => posZero
    rule formNewFloat(T:K, 1, B:Int, ListItem(0)) => negZero
    rule formNewFloat(T:K, S:Int, B:Int, ListItem(1) L:List)
             => float(S, B -Int (mantissaOf(T) -Int size(L)),
                        L copyOfK(0, mantissaOf(T) -Int size(L)))
         requires B -Int (mantissaOf(T) -Int size(L)) >=Int lowBoundExp(T)
    rule formNewFloat(T:K, 0, B:Int, ListItem(1) L:List)  => posZero
         requires B -Int (mantissaOf(T) -Int size(L)) <Int lowBoundExp(T)
    rule formNewFloat(T:K, 1, B:Int, ListItem(1) L:List)  => negZero
         requires B -Int (mantissaOf(T) -Int size(L)) <Int lowBoundExp(T)

    syntax List ::= normalizeMantissa(K, List) [function]
    rule normalizeMantissa(T:K, L:List) => L 
         requires size(L) ==Int mantissaOf(T)
    rule normalizeMantissa(T:K, L:List)
                 => L copyOfK(0, mantissaOf(T) -Int size(L))
         requires size(L) <Int mantissaOf(T)
    rule normalizeMantissa(T:K, L:List)
                => cutMantissaBack(L, size(L) -Int mantissaOf(T))
         requires size(L) >Int mantissaOf(T)

    syntax KItem ::= formSubFloat(K, Int, Int, List) [function]
                     //ty, sign, exp, mantissa
    rule formSubFloat(T:K, 0, B:Int, .List) => posZero 
    rule formSubFloat(T:K, 1, B:Int, .List) => negZero
    rule formSubFloat(T:K, I:Int, B:Int, ListItem(1) L:List) => posZero
         requires B <Int lowBoundExp(T)
    rule formSubFloat(T:K, I:Int, B:Int, ListItem(1) L:List) => negZero
         requires B <Int lowBoundExp(T)
    rule formSubFloat(T:K, I:Int, B:Int, ListItem(1) L:List)
           => float(I, B, normalizeMantissa(T, L))
         requires B <=Int upperBoundExp(T) andBool B >=Int lowBoundExp(T)
    rule formSubFloat(T:K, I:Int, B:Int, ListItem(0) L:List)
           => formSubFloat(T, I, B -Int 1, L)


    syntax KItem ::= floatAdd(K, K, K) [function]
                   | floatAddAux(K, Int, Int, K) [function]
                           //type, Sign, exp, result
                   | floatAddAuxA(K, K, K) [function]
                   | floatAddSub(K, Int, Int, K) [function]
                           //type, Sign, exp, result
                   | floatAddSubA(K, K, K) [function]
    rule floatAdd(T:K, posInf, negInf) => nan
    rule floatAdd(T:K, negInf, posInf) => nan
    rule floatAdd(T:K, posInf, A:K) => posInf
         requires A =/=K negInf
    rule floatAdd(T:K, A:K, posInf) => posInf
         requires A =/=K negInf
    rule floatAdd(T:K, negInf, A:K) => negInf
         requires A =/=K posInf
    rule floatAdd(T:K, A:K, negInf) => negInf
         requires A =/=K posInf
    rule floatAdd(T:K, undef, A:K) => undef
         requires A =/=K posInf andBool A =/=K negInf
    rule floatAdd(T:K, A:K, undef) => undef
         requires A =/=K posInf andBool A =/=K negInf
    rule floatAdd(T:K, posZero, A:K) => A
         requires A =/=K posInf andBool A =/=K negInf
                 andBool A =/=K undef
    rule floatAdd(T:K, A:K, posZero) => A
         requires A =/=K posInf andBool A =/=K negInf
                 andBool A =/=K undef
    rule floatAdd(T:K, negZero, A:K) => A
         requires A =/=K posInf andBool A =/=K negInf
                 andBool A =/=K undef andBool A =/=K posZero
    rule floatAdd(T:K, A:K, negZero) => A
         requires A =/=K posInf andBool A =/=K negInf
                 andBool A =/=K undef andBool A =/=K posZero
    rule floatAdd(T:K, float(I:Int, B:Int, L1:List),
               float(I:Int, B:Int, L2:List))
                => floatAddAux(T, I, B,
                     addTwoFloat(ListItem(1) L1, ListItem(1)  L2, .List, 0))
    rule floatAdd(T:K, float(I:Int, B1:Int, L1:List),
               float(I:Int, B2:Int, L2:List))
                => floatAddAuxA(T, float(I:Int, B1:Int, ListItem(1) L1:List),
                       roundingAddFloat(T, ListItem(1)  L2, I, B1, B2))
         requires B1 >Int B2
    rule floatAdd(T:K, float(I:Int, B1:Int, L1:List),
               float(I:Int, B2:Int, L2:List))
                => floatAddAuxA(T, roundingAddFloat(T, ListItem(1) L1, I:Int, B2, B1),
                       float(I:Int, B2:Int, ListItem(1) L2:List))
         requires B1 <Int B2
    rule floatAdd(T:K, float(1, B:Int, L1:List), float(0, B:Int, L2:List))
                => floatAddSub(T, 1, B, subTwoFloat(ListItem(1) L1,
                                ListItem(1) L2, .List, 0))
         requires isEqualBigger(L1, L2)
    rule floatAdd(T:K, float(1, B:Int, L1:List), float(0, B:Int, L2:List))
                => floatAddSub(T, 0, B,
                     subTwoFloat(ListItem(1) L2,
                                ListItem(1) L1, .List, 0))
         requires notBool isEqualBigger(L1, L2)
    rule floatAdd(T:K, float(0, B:Int, L1:List),
               float(1, B:Int, L2:List))
                => floatAddSub(T, 0, B,
                     subTwoFloat(ListItem(1) L1, ListItem(1) L2, .List, 0))
         requires isEqualBigger(L1, L2)
    rule floatAdd(T:K, float(0, B:Int, L1:List),
               float(1, B:Int, L2:List))
                => floatAddSub(T, 1, B,
                     subTwoFloat(ListItem(1) L2, ListItem(1) L1, .List, 0))
         requires notBool isEqualBigger(L1, L2)
    rule floatAdd(T:K, float(I1:Int, B1:Int, L1:List),
               float(I2:Int, B2:Int, L2:List))
                => floatAddSubA(T, float(I1:Int, B1:Int,
                             ListItem(1) L1:List copyOfK(0, B1 -Int B2)),
                     roundingSubFloat(T, ListItem(1) L2, I2, B1, B2))
         requires I1 =/=Int I2 andBool B1 >Int B2
    rule floatAdd(T:K, float(I1:Int, B1:Int, L1:List),
               float(I2:Int, B2:Int, L2:List))
                => floatAddSubA(T, roundingSubFloat(T, ListItem(1) L1, I1, B2, B1),
                   float(I2:Int, B2:Int,
                             ListItem(1) L2:List copyOfK(0, B2 -Int B1)))
         requires I1 =/=Int I2 andBool B1 <Int B2

    rule floatAddSub(T:K, I:Int, B:Int, holdDigits(I':Int, L:List))
            => formSubFloat(T, I, B, L)

    rule floatAddSubA(T:K, A:K, B:K) => A
         requires (A ==K posZero orBool A ==K negZero)
                andBool (B ==K posZero orBool B ==K negZero)
    rule floatAddSubA(T:K, float(I1:Int, B1:Int, L1:List), A:K)
           => float(I1:Int, B1:Int, normalizeMantissa(T, L1))
         requires A ==K posZero orBool A ==K negZero
    rule floatAddSubA(T:K, A:K, float(I1:Int, B1:Int, L1:List))
           => float(I1:Int, B1:Int, normalizeMantissa(T, L1))
         requires A ==K posZero orBool A ==K negZero
    rule floatAddSubA(T:K, float(1, B:Int, L1:List), float(0, B:Int, L2:List))
                => floatAddSub(T, 1, B,
                     subTwoFloat(ListItem(1) L1,
                                ListItem(1) L2, .List, 0))
         requires isEqualBigger(L1, L2)
    rule floatAddSubA(T:K, float(1, B:Int, L1:List), float(0, B:Int, L2:List))
                => floatAddSub(T, 0, B,
                     subTwoFloat(ListItem(1) L2,
                                ListItem(1) L1, .List, 0))
         requires notBool isEqualBigger(L1, L2)
    rule floatAddSubA(T:K, float(0, B:Int, L1:List),
               float(1, B:Int, L2:List))
                => floatAddSub(T, 0, B,
                     subTwoFloat(ListItem(1) L1, ListItem(1) L2, .List, 0))
         requires isEqualBigger(L1, L2)
    rule floatAddSubA(T:K, float(0, B:Int, L1:List),
               float(1, B:Int, L2:List))
                => floatAddSub(T, 1, B,
                     subTwoFloat(ListItem(1) L2, ListItem(1) L1, .List, 0))

    rule floatAddAuxA(T:K, A:K, B:K) => A
         requires (A ==K posZero orBool A ==K negZero)
               andBool (B ==K posZero orBool B ==K negZero)
    rule floatAddAuxA(T:K, A:K, float(I:Int, B:Int, ListItem(1) L:List))
                => float(I:Int, B:Int, L:List)
         requires A ==K posZero orBool A ==K negZero
    rule floatAddAuxA(T:K, float(I:Int, B:Int, ListItem(1) L:List), A:K)
                => float(I:Int, B:Int, L:List)
         requires A ==K posZero orBool A ==K negZero
    rule floatAddAuxA(T:K, float(I:Int, B:Int, L1:List),
               float(I:Int, B:Int, L2:List))
             => floatAddAux(T, I, B, addTwoFloat(L1, L2, .List, 0))

    rule floatAddAux(T:K, I:Int, B:Int, holdDigits(1, L:List ListItem(N:Int)))
            => float(I, B +Int 1, L)
         requires B +Int 1 <=Int upperBoundExp(T)
      rule floatAddAux(T:K, 0, B:Int, holdDigits(1, L:List ListItem(N:Int))) => posInf
         requires B +Int 1 >Int upperBoundExp(T)
      rule floatAddAux(T:K, 1, B:Int, holdDigits(1, L:List ListItem(N:Int))) => negInf
         requires B +Int 1 >Int upperBoundExp(T)
    rule floatAddAux(T:K, I:Int, B:Int, holdDigits(0, L:List))
            => formNewFloat(T, I, B, deleteFrontZero(L))

    //helper functions for floating division and reminder.
    syntax List ::= getTheList(K) [function]
    rule getTheList(holdDigits(A:K, B:List)) => B

    syntax List ::= cutFirstElem(List) [function]
    rule cutFirstElem(ListItem(A:K) L:List) => L
    rule cutFirstElem(L:List) => L [owise]

    //floating division implementation
    syntax KItem ::= floatDiv(K, K, K) [function]
                   | floatDivAux(K, Int, Int, List) [function]
                   | floatDivAuxA(K, Int, K) [function]
                   | floatDivCal(K, Int, List, List, List) [function]
                   | floatDivCalAux(K, Int, K, List, List) [function]

    rule floatDivCal(T:K, I:Int, L1:List, L2:List, Re:List) => Re
         requires size(Re) >=Int mantissaOf(T) +Int 2
    rule floatDivCal(T:K, 0, ListItem(0) L1:List, L2:List, Re:List)
           => floatDivCal(T, 0, L1, L2, Re ListItem(0))
         requires size(Re) <Int mantissaOf(T) +Int 2
    rule floatDivCal(T:K, 0, ListItem(1) L1:List, L2:List, Re:List)
           => floatDivCal(T, 0, cutFirstElem(getTheList(
                subTwoFloat(ListItem(1) L1, L2, .List, 0))), L2, Re ListItem(1))
         requires size(Re) <Int mantissaOf(T) +Int 2
            andBool size(ListItem(1) L1:List) ==Int size(L2)
            andBool isEqualBigger(ListItem(1) L1:List, L2)
    rule floatDivCal(T:K, 0, ListItem(1) L1:List, L2:List, Re:List)
           => floatDivCal(T, 1, L1, L2, Re ListItem(0))
         requires size(Re) <Int mantissaOf(T) +Int 2
            andBool size(ListItem(1) L1:List) ==Int size(L2)
            andBool notBool isEqualBigger(ListItem(1) L1:List, L2)

    rule floatDivCal(T:K, X:Int, ListItem(1) L1:List, L2:List, Re:List)
          => floatDivCal(T:K, X, ListItem(1) L1:List copyOfK(0,
                  size(L2) -Int size(ListItem(1) L1:List)), L2:List, Re:List)
         requires size(Re) <Int mantissaOf(T) +Int 2
            andBool size(ListItem(1) L1:List) <Int size(L2)
    rule floatDivCal(T:K, X:Int, ListItem(1) L1:List, L2:List, Re:List)
           => floatDivCalAux(T, X, countFromLeft(ListItem(1) L1:List,
                   .List, size(L2)), L2, Re)
         requires size(Re) <Int mantissaOf(T) +Int 2
            andBool size(ListItem(1) L1:List) >Int size(L2)

    rule floatDivCal(T:K, 1, L1:List, L2:List, Re:List)
           => floatDivCal(T, 0, cutFirstElem(getTheList(subTwoFloat(
                     ListItem(1) L1, L2, .List, 0))), L2, Re ListItem(1))
         requires size(Re) <Int mantissaOf(T) +Int 2
            andBool size(ListItem(1) L1:List) ==Int size(L2)

    rule floatDivCalAux(T:K, 0, countByteResult(ListItem(1) L1:List,
                   L1':List), L2:List, Re:List)
           => floatDivCal(T, 0, cutFirstElem(getTheList(subTwoFloat(ListItem(1) L1,
                        L2, .List, 0)) L1'), L2, Re ListItem(1))
         requires isEqualBigger(ListItem(1) L1:List, L2)
    rule floatDivCalAux(T:K, 0, countByteResult(ListItem(1) L1:List,
                   L1':List), L2:List, Re:List)
           => floatDivCal(T, 1, L1 L1', L2, Re ListItem(0))
         requires notBool isEqualBigger(ListItem(1) L1:List, L2)
    rule floatDivCalAux(T:K, 1, countByteResult(L1:List, L1':List), L2:List, Re:List)
           => floatDivCal(T, 0, cutFirstElem(getTheList(subTwoFloat(
                     ListItem(1) L1, L2, .List, 0))) L1', L2, Re ListItem(1))
         requires size(ListItem(1) L1:List) ==Int size(L2)

    rule floatDiv(T:K, A:K, B:K) => nan
         requires (A ==K negZero orBool A ==K posZero)
           andBool (B ==K negZero orBool B ==K posZero)
    rule floatDiv(T:K, A:K, B:K) => nan
         requires (B ==K negInf orBool B ==K posInf)
           andBool (A ==K posInf orBool A ==K negInf)
    rule floatDiv(T:K, posZero, B:K) => negZero
         requires isNegFloat(B) andBool
              B =/=K posZero andBool B =/=K negZero
    rule floatDiv(T:K, negZero, B:K) => posZero
         requires isNegFloat(B) andBool
              B =/=K posZero andBool B =/=K negZero
    rule floatDiv(T:K, posZero, B:K) => posZero
         requires notBool isNegFloat(B) andBool
              B =/=K posZero andBool B =/=K negZero
    rule floatDiv(T:K, negZero, B:K) => negZero
         requires notBool isNegFloat(B) andBool
              B =/=K posZero andBool B =/=K negZero
    rule floatDiv(T:K, B:K, posZero) => negInf
         requires isNegFloat(B) andBool
              B =/=K posZero andBool B =/=K negZero
    rule floatDiv(T:K, B:K, negZero) => posInf
         requires isNegFloat(B) andBool
              B =/=K posZero andBool B =/=K negZero
    rule floatDiv(T:K, B:K, posZero) => posInf
         requires notBool isNegFloat(B) andBool
              B =/=K posZero andBool B =/=K negZero
    rule floatDiv(T:K, B:K, negZero) => negInf
         requires notBool isNegFloat(B) andBool
              B =/=K posZero andBool B =/=K negZero
    rule floatDiv(T:K, B:K, posInf) => negZero
         requires isNegFloat(B) andBool
              B =/=K posInf andBool B =/=K negInf
              andBool B =/=K posZero andBool B =/=K negZero
    rule floatDiv(T:K, B:K, negInf) => posZero
         requires isNegFloat(B) andBool
              B =/=K posInf andBool B =/=K negInf
              andBool B =/=K posZero andBool B =/=K negZero
    rule floatDiv(T:K, B:K, posInf) => posZero
         requires notBool isNegFloat(B) andBool
              B =/=K posInf andBool B =/=K negInf
              andBool B =/=K posZero andBool B =/=K negZero
    rule floatDiv(T:K, B:K, negInf) => negZero
         requires notBool isNegFloat(B) andBool
              B =/=K posInf andBool B =/=K negInf
              andBool B =/=K posZero andBool B =/=K negZero
    rule floatDiv(T:K, posInf, B:K) => negInf
         requires isNegFloat(B) andBool
              B =/=K posInf andBool B =/=K negInf
              andBool B =/=K posZero andBool B =/=K negZero
    rule floatDiv(T:K, negInf, B:K) => posInf
         requires isNegFloat(B) andBool
              B =/=K posInf andBool B =/=K negInf
              andBool B =/=K posZero andBool B =/=K negZero
    rule floatDiv(T:K, posInf, B:K) => posInf
         requires notBool isNegFloat(B) andBool
              B =/=K posInf andBool B =/=K negInf
              andBool B =/=K posZero andBool B =/=K negZero
    rule floatDiv(T:K, negInf, B:K) => negInf
         requires notBool isNegFloat(B) andBool
              B =/=K posInf andBool B =/=K negInf
              andBool B =/=K posZero andBool B =/=K negZero
    rule floatDiv(T:K, undef, B:K) => undef
         requires B =/=K posInf andBool B =/=K negInf
              andBool B =/=K posZero andBool B =/=K negZero
    rule floatDiv(T:K, B:K, undef) => undef
         requires B =/=K posInf andBool B =/=K negInf
              andBool B =/=K posZero andBool B =/=K negZero
    rule floatDiv(T:K, float(I1:Int, B1:Int, L1:List),
               float(I2:Int, B2:Int, L2:List))
            => floatDivAux(T, (I1 +Int I2) %Int 2,
                     B1 -Int B2, floatDivCal(T, 0, ListItem(1) L1, ListItem(1) L2, .List))
 
    rule floatDivAux(T:K, I:Int, B:Int, ListItem(1) L:List)
                => float(I, B, getLeftCountResult(countFromLeft(.List, L, mantissaOf(T))))
         requires B >=Int lowBoundExp(T)
    rule floatDivAux(T:K, 1, B:Int, ListItem(1) L:List) => negZero
         requires B <Int lowBoundExp(T)
    rule floatDivAux(T:K, 0, B:Int, ListItem(1) L:List) => posZero
         requires B <Int lowBoundExp(T)
    rule floatDivAux(T:K, I:Int, B:Int, ListItem(0) L:List)
         => floatDivAuxA(T, I, moveFloatLeft(L, B))
    rule floatDivAuxA(T:K, I:Int, holdDigits(A:Int, L:List))
         => float(I, A, getLeftCountResult(countFromLeft(.List, L, mantissaOf(T))))
         requires A >=Int lowBoundExp(T)
    rule floatDivAuxA(T:K, 0, holdDigits(A:Int, L:List)) => posZero
         requires A <Int lowBoundExp(T)
    rule floatDivAuxA(T:K, 1, holdDigits(A:Int, L:List)) => negZero
         requires A <Int lowBoundExp(T)

    //function for implementing float reminder op.
    syntax KItem ::= floatRem(K, K, K) [function]
                  | floatRemAux(K, Int, Int, Int) [function]
                  | floatRemAuxA(K, Int, Int, List) [function]
    rule floatRem(T:K, A:K, B:K) => nan
         requires A ==K posInf orBool A ==K negInf
    rule floatRem(T:K, A:K, B:K) => nan
         requires A =/=K posInf andBool A =/=K negInf
             andBool (B ==K posZero orBool B ==K negZero)
    rule floatRem(T:K, A:K, B:K) => A
         requires B ==K posInf orBool B ==K negInf
    rule floatRem(T:K, A:K, B:K) => A
         requires B =/=K posZero andBool B =/=K negZero
           andBool (A ==K posZero orBool A ==K negZero)
    rule floatRem(T:K, undef, A:K) => undef
         requires A =/=K posZero andBool A =/=K negZero 
    rule floatRem(T:K, A:K, undef) => undef
         requires A =/=K posInf andBool A =/=K negInf
    rule floatRem(T:K, float(I1:Int, B1:Int, L1:List),
           float(I2:Int, B2:Int, L2:List)) 
            => float(I1:Int, B1:Int, L1:List)
        requires isNegFloat(floatAdd(T:K,
                float(0, B1:Int, L1:List), float(1, B2:Int, L2:List)))
    rule floatRem(T:K, float(I1:Int, B1:Int, L1:List),
           float(I2:Int, B2:Int, L2:List)) 
            => floatRemAux(T, I1, B2,
                  binToDecNoLimit(ListItem(1) L1 copyOfK(0, B1 -Int B2)) %Int
                  binToDecNoLimit(ListItem(1) L2))
        requires notBool isNegFloat(floatAdd(T:K,
                float(0, B1:Int, L1:List), float(1, B2:Int, L2:List)))
    rule floatRemAux(T:K, 0, B:Int, 0) => posZero
    rule floatRemAux(T:K, 1, B:Int, 0) => posZero
    rule floatRemAux(T:K, I:Int, B:Int, N:Int)
               => floatRemAuxA(T, I, B, decToBinNoLimit(N))
         requires N =/=Int 0
    rule floatRemAuxA(T:K, I:Int, B:Int, L:List)
          => float(I, B -Int
              (mantissaOf(T) +Int 1 -Int size(L)), cutFirstElem(L)
                copyOfK(0, mantissaOf(T) +Int 1 -Int size(L)))
         requires B -Int (mantissaOf(T) +Int 1 -Int size(L))
                      >=Int lowBoundExp(T)
    rule floatRemAuxA(T:K, 1, B:Int, L:List)
            => negZero
         requires B -Int (mantissaOf(T) +Int 1 -Int size(L))
                      <Int lowBoundExp(T)
    rule floatRemAuxA(T:K, 0, B:Int, L:List)
            => posZero
         requires B -Int (mantissaOf(T) +Int 1 -Int size(L))
                      <Int lowBoundExp(T)

    //the functions for implementing float multiplication
    syntax List ::= floatAddNoLimit(List, List) [function]
                  | floatAddNotLimitAux(K) [function]
    rule floatAddNoLimit(L1:List, L2:List)
           => floatAddNoLimit(L1, copyOfK(0, size(L1) -Int size(L2)) L2)
          requires size(L1) >Int size(L2)
    rule floatAddNoLimit(L1:List, L2:List)
           => floatAddNoLimit(copyOfK(0, size(L2) -Int size(L1)) L1, L2)
          requires size(L1) <Int size(L2)
    rule floatAddNoLimit(L1:List, L2:List)
                 => floatAddNotLimitAux(addTwoFloat(L1, L2, .List, 0))
         requires size(L1) ==Int size(L2)
    rule floatAddNotLimitAux(holdDigits(1, L:List)) => ListItem(1) L
    rule floatAddNotLimitAux(holdDigits(0, L:List)) => deleteFrontZero(L)


    syntax List ::= floatMulCal(List, List, List, Int) [function]
    rule floatMulCal(L1:List, .List, Re:List, N:Int) => Re
    rule floatMulCal(L1:List, L2:List ListItem(0), Re:List, N:Int)
          => floatMulCal(L1, L2, Re, N +Int 1)
    rule floatMulCal(L1:List, L2:List ListItem(1), Re:List, N:Int)
           => floatMulCal(L1, L2, floatAddNoLimit(L1 copyOfK(0, N), Re), N +Int 1)

    syntax Bool ::= isNegFloat(K) [function]
    rule isNegFloat(posZero) => false
    rule isNegFloat(negZero) => true
    rule isNegFloat(negInf) => true
    rule isNegFloat(posInf) => false
    rule isNegFloat(float(1, B:Int, L:List)) => true
    rule isNegFloat(float(0, B:Int, L:List)) => false

    syntax KItem ::= floatMul(K, K, K) [function]
                   | floatMulAux(K, Int, Int, K) [function]
    rule floatMul(T:K, A:K, B:K) => nan
         requires (A ==K negZero orBool A ==K posZero)
           andBool (B ==K posInf orBool B ==K negInf)
    rule floatMul(T:K, A:K, B:K) => nan
         requires (B ==K negZero orBool B ==K posZero)
           andBool (A ==K posInf orBool A ==K negInf)
    rule floatMul(T:K, posZero, A:K) => negZero
         requires A =/=K posInf andBool A =/=K negInf
               andBool isNegFloat(A)
    rule floatMul(T:K, posZero, A:K) => posZero
         requires A =/=K posInf andBool A =/=K negInf
               andBool notBool isNegFloat(A)
    rule floatMul(T:K, negZero, A:K) => posZero
         requires A =/=K posInf andBool A =/=K negInf
               andBool isNegFloat(A)
    rule floatMul(T:K, negZero, A:K) => negZero
         requires A =/=K posInf andBool A =/=K negInf
               andBool notBool isNegFloat(A)
    rule floatMul(T:K, A:K, posZero) => negZero
         requires A =/=K posInf andBool A =/=K negInf
               andBool isNegFloat(A)
    rule floatMul(T:K, A:K, posZero) => posZero
         requires A =/=K posInf andBool A =/=K negInf
               andBool notBool isNegFloat(A)
    rule floatMul(T:K, A:K, negZero) => posZero
         requires A =/=K posInf andBool A =/=K negInf
               andBool isNegFloat(A)
    rule floatMul(T:K, A:K, negZero) => negZero
         requires A =/=K posInf andBool A =/=K negInf
               andBool notBool isNegFloat(A)
    rule floatMul(T:K, posInf, A:K) => negInf
         requires A =/=K posZero andBool A =/=K negZero
              andBool isNegFloat(A)
    rule floatMul(T:K, posInf, A:K) => posInf
         requires A =/=K posZero andBool A =/=K negZero
              andBool notBool isNegFloat(A)
    rule floatMul(T:K, negInf, A:K) => posInf
         requires A =/=K posZero andBool A =/=K negZero
              andBool isNegFloat(A)
    rule floatMul(T:K, negInf, A:K) => negInf
         requires A =/=K posZero andBool A =/=K negZero
              andBool notBool isNegFloat(A)
    rule floatMul(T:K, A:K, posInf) => negInf
         requires A =/=K posZero andBool A =/=K negZero
              andBool isNegFloat(A)
    rule floatMul(T:K, A:K, posInf) => posInf
         requires A =/=K posZero andBool A =/=K negZero
              andBool notBool isNegFloat(A)
    rule floatMul(T:K, A:K, negInf) => posInf
         requires A =/=K posZero andBool A =/=K negZero
              andBool isNegFloat(A)
    rule floatMul(T:K, A:K, negInf) => negInf
         requires A =/=K posZero andBool A =/=K negZero
              andBool notBool isNegFloat(A)
    rule floatMul(T:K, A:K, undef) => undef
         requires A =/=K negInf andBool A =/=K posInf
                andBool A =/=K posZero andBool A =/=K negZero
    rule floatMul(T:K, undef, A:K) => undef
         requires A =/=K negInf andBool A =/=K posInf
                andBool A =/=K posZero andBool A =/=K negZero
    rule floatMul(T:K, float(I1:Int, B1:Int, L1:List),
                              float(I2:Int, B2:Int, L2:List))
          => floatMulAux(T, (I1 +Int I2) %Int 2,
                    B1 +Int B2, countFromRight(
           floatMulCal(ListItem(1) L1, ListItem(1) L2,
                 ListItem(0), 0), .List, mantissaOf(T) *Int 2))

    rule floatMulAux(T:K, I:Int, B:Int,
               countByteResult(ListItem(1) Left:List, Right:List))
          => float(I, B:Int +Int size(Left), getLeftCountResult(
                  countFromLeft(.List, Left Right, mantissaOf(T))))
         requires B +Int size(Left) <=Int upperBoundExp(T)
               andBool B +Int size(Left) >=Int lowBoundExp(T)
               andBool size(Left Right) >=Int mantissaOf(T)
    rule floatMulAux(T:K, I:Int, B:Int,
               countByteResult(ListItem(1) Left:List, Right:List))
          => float(I, B:Int +Int size(Left), Left Right
                      copyOfK(0, mantissaOf(T) -Int size(Left Right)))
         requires B +Int size(Left) <=Int upperBoundExp(T)
               andBool B +Int size(Left) >=Int lowBoundExp(T)
               andBool size(Left Right) <Int mantissaOf(T)
    rule floatMulAux(T:K, 1, B:Int,
               countByteResult(ListItem(1) Left:List, Right:List)) => negInf
         requires B +Int size(Left) >Int upperBoundExp(T)
    rule floatMulAux(T:K, 0, B:Int,
               countByteResult(ListItem(1) Left:List, Right:List)) => posInf
         requires B +Int size(Left) >Int upperBoundExp(T)
    rule floatMulAux(T:K, 1, B:Int,
               countByteResult(ListItem(1) Left:List, Right:List)) => negZero
         requires B +Int size(Left) <Int lowBoundExp(T)
    rule floatMulAux(T:K, 0, B:Int,
               countByteResult(ListItem(1) Left:List, Right:List)) => posZero
         requires B +Int size(Left) <Int lowBoundExp(T)

    syntax KItem ::= floatNeg(K) [function]
    rule floatNeg(negInf) => posInf
    rule floatNeg(posInf) => negInf
    rule floatNeg(negZero) => posZero
    rule floatNeg(posZero) => negZero
    rule floatNeg(float(0, B:Int, L:List)) => float(1, B, L)
    rule floatNeg(float(1, B:Int, L:List)) => float(0, B, L)
    rule floatNeg(A:K) => A [owise]

    rule applyFloat(Op:K, T:K, poisonVal, V2:K) => poisonVal
    rule applyFloat(Op:K, T:K, V1:K, poisonVal) => poisonVal
    rule applyFloat(Op:K, T:K, undef, undef) => posZero
         requires Op ==K fsub orBool Op ==K fdiv orBool Op ==K frem
    rule applyFloat(Op:K, T:K, undef, undef) => undef
         requires Op ==K fadd orBool Op ==K fmul
    rule applyFloat(Op:K, T:K, nan, V2:K) => nan
         requires V2 =/=K poisonVal
    rule applyFloat(Op:K, T:K, V1:K, nan) => nan
         requires V1 =/=K poisonVal
    rule applyFloat(fadd, T:K, V1:K, V2:K) => floatAdd(T:K, V1, V2)
         requires V2 =/=K poisonVal andBool V2 =/=K nan
                andBool V1 =/=K poisonVal andBool V1 =/=K nan
                andBool (V1 =/=K undef orBool V2 =/=K undef)
    rule applyFloat(fsub, T:K, V1:K, V2:K) => floatAdd(T:K, V1, floatNeg(V2))
         requires V2 =/=K poisonVal andBool V2 =/=K nan
                andBool V1 =/=K poisonVal andBool V1 =/=K nan
                andBool (V1 =/=K undef orBool V2 =/=K undef)
    rule applyFloat(fmul, T:K, V1:K, V2:K) => floatMul(T:K, V1, V2)
         requires V2 =/=K poisonVal andBool V2 =/=K nan
                andBool V1 =/=K poisonVal andBool V1 =/=K nan
                andBool (V1 =/=K undef orBool V2 =/=K undef)
    rule applyFloat(fdiv, T:K, V1:K, V2:K) => floatDiv(T:K, V1, V2)
         requires V2 =/=K poisonVal andBool V2 =/=K nan
                andBool V1 =/=K poisonVal andBool V1 =/=K nan
                andBool (V1 =/=K undef orBool V2 =/=K undef)
    rule applyFloat(frem, T:K, V1:K, V2:K) => floatRem(T:K, V1, V2)
         requires V2 =/=K poisonVal andBool V2 =/=K nan
                andBool V1 =/=K poisonVal andBool V1 =/=K nan
                andBool (V1 =/=K undef orBool V2 =/=K undef)

    rule applyFloats(Op:K, T:K,
            vectorValue(Es:ElemList), vectorValue(Es':ElemList))
             => vectorValue(applyFloats(Op,T, Es, Es'))
    rule applyFloats(Op:K, T:K, .ElemList, .ElemList) => .ElemList
    rule applyFloats(Op:K, vectorTypeValue(T:K, I:Int),
           valValue(X:K),Es:ElemList, valValue(Y:K),Es':ElemList)
         => valValue(applyFloat(Op, T, X, Y)),
                      applyFloats(Op, vectorTypeValue(T:K, I:Int), Es, Es')
    rule applyFloats(Op:K, vectorTypeValue(T:K, I:Int), A:K, B:K)
         => applyFloat(Op, T, A, B) [owise]

    rule applyIcmp(OP:K, T:K, badValue, V2:K) => badValue
    rule applyIcmp(OP:K, T:K, V1:K, badValue) => badValue
    rule applyIcmp(OP:K, T:K, poisonVal, V2:K) => poisonVal
         requires V2 =/=K badValue
    rule applyIcmp(OP:K, T:K, V1:K, poisonVal) => poisonVal
         requires V1 =/=K badValue
    rule applyIcmp(OP:K, T:K, undef, V2:K) => undef
         requires V2 =/=K badValue andBool V2 =/=K poisonVal
    rule applyIcmp(OP:K, T:K, V1:K, undef) => undef
         requires V1 =/=K badValue andBool V1 =/=K poisonVal
    rule applyIcmp(OP:K, T:K , zeroinitializer, V2:K)
            => applyIcmp(OP, T, dealWithZeroInitializer(T), V2)
    rule applyIcmp(OP:K, T:K, V1:K, zeroinitializer)
            => applyIcmp(OP, T, V1, dealWithZeroInitializer(T))
    rule applyIcmp(Op:K, integerType(N:Int), V1:Int, V2:Int)
      => applyOp(Op, normalizingInt(integerType(N:Int), V1),
                 normalizingInt(integerType(N:Int), V2))
         requires Op ==K eq orBool Op ==K ne
         orBool Op ==K 'ultOfIcmp(.KList)
         orBool Op ==K 'ugtOfIcmp(.KList)
         orBool Op ==K 'ugeOfIcmp(.KList)
         orBool Op ==K 'uleOfIcmp(.KList)

    rule applyIcmp(Op:K, integerType(N:Int), V1:Int, V2:Int)
      => applyOp(Op, deNormalizingInt( integerType(N:Int),
                normalizingInt(integerType(N:Int), V1)),
                 deNormalizingInt(integerType(N:Int),
                   normalizingInt(integerType(N:Int), V2)))
         requires Op ==K slt orBool Op ==K sgt
           orBool Op ==K sle orBool Op ==K sge

    rule applyIcmp(Op:K, pointerTypeValue(_, _), V1:Loc, V2:Loc)
      => applyOp(Op, V1, V2)

    rule applyIcmps(Op:K, T:K, badValue, V2:K, Es:ElemList)
         => badValue
    rule applyIcmps(Op:K, T:K, V1:K, badValue, Es:ElemList)
         => badValue
    rule applyIcmps(Op:K, T:K, V1:Int, V2:Int, Es:ElemList)
         => applyIcmp(Op, T, V1, V2)
    rule applyIcmps(Op:K, T:K, V1:Loc, V2:Loc, Es:ElemList)
         => applyIcmp(Op, T, V1, V2)
    rule applyIcmps(Op:K, T:K, poisonVal, V2:K, Es:ElemList)
         => poisonVal
         requires V2 =/=K badValue
    rule applyIcmps(Op:K, T:K, V1:K, poisonVal, Es:ElemList)
         => poisonVal
         requires V1 =/=K badValue
    rule applyIcmps(Op:K, T:K, undef, V2:K, Es:ElemList)
         => undef
         requires V2 =/=K badValue andBool V2 =/=K poisonVal
    rule applyIcmps(Op:K, T:K, V1:K, undef, Es:ElemList)
         => undef
         requires V1 =/=K badValue andBool V1 =/=K poisonVal
    rule applyIcmps(Op:K, T:K, zeroinitializer, V2:K, Es:ElemList)
         => applyIcmps(Op:K, T:K, dealWithZeroInitializer(T), V2, Es:ElemList)
    rule applyIcmps(Op:K, T:K, V1:K, zeroinitializer, Es:ElemList)
         => applyIcmps(Op:K, T:K, V1, dealWithZeroInitializer(T), Es:ElemList)

    rule applyIcmps(Op:K, T:K, vectorValue(valValue(V1:K),E1:ElemList),
           vectorValue(valValue(V2:K),E2:ElemList), Es:ElemList)
         => applyIcmps(Op, T, vectorValue(E1), vectorValue(E2),
                addElemToEnd(valValue(applyIcmp(Op, getIntType(T), V1, V2)), Es))
         requires applyIcmp(Op, getIntType(T), V1, V2) =/=K badValue
    rule applyIcmps(Op:K, T:K, vectorValue(valValue(V1:K),E1:ElemList),
           vectorValue(valValue(V2:K),E2:ElemList), Es:ElemList)
         => badValue
         requires applyIcmp(Op, getIntType(T), V1, V2) ==K badValue

    //deal with fcmp
    syntax KItem ::= getFloatFromLoc(K) [function]
    rule getFloatFromLoc(floatLoc(A:K, _,_,_,_)) => A

    syntax KItem ::= applyFcmps(K, K, K, K) [function]
                                        // op, type, value1, value2, vector
                   | applyFcmp(K, K, K, K) [function] // op, type, int, int
                   | applyFcmpAux(K, K, K, K) [function] // op, type, int, int
                   | applyOeq(K, K) [function]
                   | flipBooleanBit(K) [function]
                   | applyOgt(K, K, K) [function]//type, v1, v2
                   | applyOge(K, K, K) [function]//type, v1, v2

    rule flipBooleanBit(1) => 0
    rule flipBooleanBit(0) => 1

    rule applyOeq(undef, undef) => 1
    rule applyOeq(nan, A:K) => 0
    rule applyOeq(A:K, nan) => 0
    rule applyOeq(posInf, posInf) => 1
    rule applyOeq(negInf, negInf) => 1
    rule applyOeq(A:K, B:K) => 1
         requires (A ==K posZero orBool A ==K negZero)
            andBool (B ==K posZero orBool B ==K negZero)
    rule applyOeq(float(X:Int, Y:Int, Z:List),
                      float(X:Int, Y:Int, Z':List)) => 1
         requires isListEqual(Z, Z')
    rule applyOeq(A:K, B:K) => 0 [owise]

    rule applyOgt(T:K, nan, A:K) => 0
    rule applyOgt(T:K, A:K, nan) => 0
    rule applyOgt(T:K, posInf, A:K) => 1
         requires A =/=K posInf andBool A =/=K nan
    rule applyOgt(T:K, A:K, negInf) => 1
         requires A =/=K negInf andBool A =/=K nan
    rule applyOgt(T:K, A:K, B:K) => 1
         requires (B ==K posZero orBool B ==K negZero)
            andBool A =/=K nan andBool A =/=K undef 
           andBool notBool isNegFloat(A)
           andBool A =/=K posZero
    rule applyOgt(T:K, A:K, B:K) => 1
         requires (A ==K posZero orBool A ==K negZero)
            andBool B =/=K nan andBool B =/=K undef 
           andBool isNegFloat(B) andBool B =/=K negZero
    rule applyOgt(T:K, float(X:Int, Y:Int, Z:List),
                      float(X':Int, Y':Int, Z':List))
             => applyOgt(T, applyFloat(fsub, T, float(X:Int, Y:Int, Z:List),
                    float(X':Int, Y':Int, Z':List)), posZero)
    rule applyOgt(T:K, A:K, B:K) => 0 [owise]

    rule applyOge(T:K, nan, A:K) => 0
    rule applyOge(T:K, A:K, nan) => 0
    rule applyOge(T:K, posInf, A:K) => 1
         requires A =/=K nan
    rule applyOge(T:K, A:K, negInf) => 1
         requires A =/=K nan
    rule applyOge(T:K, A:K, B:K) => 1
         requires (B ==K posZero orBool B ==K negZero)
            andBool A =/=K nan andBool A =/=K undef 
           andBool (notBool isNegFloat(A)
                   orBool A ==K posZero)
    rule applyOge(T:K, A:K, B:K) => 1
         requires (A ==K posZero orBool A ==K negZero)
            andBool B =/=K nan andBool B =/=K undef 
           andBool (isNegFloat(B) orBool B ==K negZero)
    rule applyOge(T:K, float(X:Int, Y:Int, Z:List),
                      float(X':Int, Y':Int, Z':List))
             => applyOge(T, applyFloat(fsub, T, float(X:Int, Y:Int, Z:List),
                    float(X':Int, Y':Int, Z':List)), posZero)
    rule applyOge(T:K, A:K, B:K) => 0 [owise]

    rule applyFcmpAux(true, T:K, V1:K, V2:K) => 1
    rule applyFcmpAux(false, T:K, V1:K, V2:K) => 0
    rule applyFcmpAux(oeq, T:K, V1:K, V2:K) => applyOeq(V1, V2)
    rule applyFcmpAux(ogt, T:K, V1:K, V2:K) => applyOgt(T, V1, V2)
    rule applyFcmpAux(oge, T:K, V1:K, V2:K) => applyOge(T, V1, V2)
    rule applyFcmpAux(olt, T:K, V1:K, V2:K) => applyOgt(T, V2, V1)
    rule applyFcmpAux(ole, T:K, V1:K, V2:K) => applyOge(T, V2, V1)
    rule applyFcmpAux(one, T:K, V1:K, V2:K) => flipBooleanBit(applyOeq(V1, V2))
         requires V1 =/=K nan andBool V2 =/=K nan
    rule applyFcmpAux(one, T:K, V1:K, V2:K) => 0
         requires V1 ==K nan orBool V2 ==K nan
    rule applyFcmpAux(ord, T:K, V1:K, V2:K) => 1
         requires V1 =/=K nan andBool V2 =/=K nan
    rule applyFcmpAux(ord, T:K, V1:K, V2:K) => 0
         requires V1 ==K nan orBool V2 ==K nan
    rule applyFcmpAux(ueq, T:K, V1:K, V2:K) => applyOeq(V1, V2)
         requires V1 =/=K nan andBool V2 =/=K nan
    rule applyFcmpAux(ueq, T:K, V1:K, V2:K) => 1
         requires V1 ==K nan orBool V2 ==K nan
    rule applyFcmpAux('ugtOfFcmp(.KList), T:K, V1:K, V2:K) => applyOgt(T, V1, V2)
         requires V1 =/=K nan andBool V2 =/=K nan
    rule applyFcmpAux('ugtOfFcmp(.KList), T:K, V1:K, V2:K) => 1
         requires V1 ==K nan orBool V2 ==K nan
    rule applyFcmpAux('ugeOfFcmp(.KList), T:K, V1:K, V2:K) => applyOge(T, V1, V2)
         requires V1 =/=K nan andBool V2 =/=K nan
    rule applyFcmpAux('ugeOfFcmp(.KList), T:K, V1:K, V2:K) => 1
         requires V1 ==K nan orBool V2 ==K nan
    rule applyFcmpAux('ultOfFcmp(.KList), T:K, V1:K, V2:K) => applyOgt(T, V2, V1)
         requires V1 =/=K nan andBool V2 =/=K nan
    rule applyFcmpAux('ultOfFcmp(.KList), T:K, V1:K, V2:K) => 1
         requires V1 ==K nan orBool V2 ==K nan
    rule applyFcmpAux('uleOfFcmp(.KList), T:K, V1:K, V2:K) => applyOge(T, V2, V1)
         requires V1 =/=K nan andBool V2 =/=K nan
    rule applyFcmpAux('uleOfFcmp(.KList), T:K, V1:K, V2:K) => 1
         requires V1 ==K nan orBool V2 ==K nan
    rule applyFcmpAux(une, T:K, V1:K, V2:K) => flipBooleanBit(applyOeq(V1, V2))
         requires V1 =/=K nan andBool V2 =/=K nan
    rule applyFcmpAux(une, T:K, V1:K, V2:K) => 1
         requires V1 ==K nan orBool V2 ==K nan
    rule applyFcmpAux(uno, T:K, V1:K, V2:K) => 0
         requires V1 =/=K nan andBool V2 =/=K nan
    rule applyFcmpAux(uno, T:K, V1:K, V2:K) => 1
         requires V1 ==K nan orBool V2 ==K nan

    rule applyFcmp(X:K, T:K, floatLoc(A:K, B:K, C:K, D:K, E:K), V2:K)
           => applyFcmp(X, T, getFloatFromLoc(floatLoc(
                          A:K, B:K, C:K, D:K, E:K)), V2)
    rule applyFcmp(X:K, T:K, V1:K, floatLoc(A:K, B:K, C:K, D:K, E:K))
           => applyFcmp(X, T, V1, getFloatFromLoc(floatLoc(
                          A:K, B:K, C:K, D:K, E:K)))
    rule applyFcmp(Op:K, T:K, poisonVal, V2:K) => poisonVal
    rule applyFcmp(Op:K, T:K, V1:K, poisonVal) => poisonVal
    rule applyFcmp(Op:K, T:K, V1:K, V2:K)
           => applyFcmpAux(Op, T, V1, V2) [owise]

    rule applyFcmps(Op:K, T:K, vectorValue(Es:ElemList), vectorValue(Es':ElemList))
           => vectorValue(applyFcmps(Op, T, Es, Es'))
    rule applyFcmps(Op:K, vectorTypeValue(T:K, I:Int), .ElemList, .ElemList)
         => .ElemList
    rule applyFcmps(Op:K, vectorTypeValue(T:K, I:Int),
          valValue(A:K),Es1:ElemList, valValue(B:K),Es2:ElemList)
         => valValue(applyFcmp(Op, T, A, B)),
                applyFcmps(Op, vectorTypeValue(T:K, I:Int), Es1, Es2)
    rule applyFcmps(Op:K, T:K, V1:K, V2:K) => applyFcmp(Op, T, V1, V2)
         requires isFloatType(T)
    rule applyFcmps(Op:K, vectorTypeValue(T:K, I:Int), V1:K, V2:K)
            => applyFcmp(Op, T, V1, V2) [owise]


    syntax Int ::= seqAdds(Int, Int) [function]
    rule seqAdds(N:Int, N':Int) => 0
         requires N >=Int N'
    rule seqAdds(N:Int, N':Int) => (2 ^Int N) +Int seqAdds(N +Int 1, N')
         requires N <Int N'

    rule applyCast(trunc, integerType(N:Int),
                V1:Int, integerType(N':Int)) => mod(V1, 2 ^Int N')
    rule applyCast(zext, integerType(N:Int),
                     V1:Int, integerType(N':Int)) => V1
    rule applyCast(sext, integerType(N:Int),
                         V1:Int, integerType(N':Int)) => V1
         requires V1 <Int (2 ^Int (N -Int 1))
    rule applyCast(sext, integerType(N:Int),
                V1:Int, integerType(N':Int)) => V1 +Int seqAdds(N, N')
         requires V1 >=Int (2 ^Int (N -Int 1))
    rule applyCast(Op:K, T:K, intLoc(A:K, B:K, R:K,D:K,BA:K), T':K)
              => intLoc(applyCast(Op, T, A, T'), B, R,D,BA:K)
    rule applyCast(Op:K, T:K, poisonVal, T':K) => poisonVal
    rule applyCast(Op:K, T:K, undef, T':K) => undef
    rule applyCast(Op:K, T:K, zeroinitializer, T':K)
               => applyCast(Op:K, T:K, dealWithZeroInitializer(T), T')

    rule applyCasts(Op:K, T:K, .ElemList, T':K) => .ElemList
    rule applyCasts(Op:K, T:K, vectorValue(Es:ElemList), T':K)
               => vectorValue(applyCasts(Op, T, Es, T':K))
    rule applyCasts(Op:K, vectorTypeValue(T:K, N:Int), (valValue(A:K),Es:ElemList), T':K)
               => valValue(applyCast(Op, T, A, T')),
                 applyCasts(Op, vectorTypeValue(T:K, N:Int), Es, T')
    rule applyCasts(Op:K, T:K, zeroinitializer, T2:K)
          => applyCasts(Op, T, dealWithZeroInitializer(T), T2)
    rule applyCasts(Op:K, T:K, I1:K, I2:K) => applyCast(Op, getIntType(T), I1, I2)    [owise]


    //dealing with floating point casting fptrunc and fpext
    //and also float to int casting
    syntax KItem ::= applyFloatCasts(K, K, K, K, List) [function]
                   | applyFloatCast(K, K, K, K) [function]
                   | applyFPTrunc(Int, Int, K) [function]
                   | applyFloatInts(K, K, K, K, List) [function]
                   | applyFloatInt(K, K, K, K) [function]
                   | applyUnsignedFloatInt(K, K) [function] //value, type
                   | applySignedFloatInt(Int, K, K) [function] //sign, value, type
                   | applyUnsignedIntFloat(List, K) [function]
                   | applyUnsignedIntFloatAux(Int, List, K) [function]
                   | applySignedIntFloat(Int, List, K) [function]
                   | applySignedIntFloatAux(Int, Int, List, K) [function]
                   | applyIntFloats(K, K, K, K, List) [function]
                   | applyIntFloat(K, K, K, K) [function]

    rule applyFloatCast(Op:K, T:K, floatLoc(A:K, B:K, R:K,D:K,BA:K), T':K)
              => floatLoc(applyFloatCast(Op, T, A, T'), B, R,D,BA:K)
    rule applyFloatCast(Op:K, T:K, poisonVal, T':K) => poisonVal
    rule applyFloatCast(Op:K, T:K, undef, T':K) => undef
    rule applyFloatCast(Op:K, T:K, zeroinitializer, T':K)
               => applyFloatCast(Op:K, T:K, dealWithZeroInitializer(T), T')
    rule applyFloatCast(Op:K, T:K, A:K, T':K) => A
         requires A ==K posZero orBool A ==K negZero
            orBool A ==K posInf orBool A ==K negInf orBool A ==K nan
    rule applyFloatCast(fpext, T1:K, float(I:Int, S:Int, L:List), T2:K)
           => float(I, S, L copyOfK(0, mantissaOf(T2) -Int mantissaOf(T1)))
    rule applyFloatCast(fptrunc, T1:K, float(I:Int, S:Int, L:List), T2:K) => badValue
         requires S >Int upperBoundExp(T2) orBool S <Int lowBoundExp(T2)
    rule applyFloatCast(fptrunc, T1:K, float(I:Int, S:Int, L:List), T2:K)
          => applyFPTrunc(I, S, countFromLeft(.List, L, mantissaOf(T2)))

    rule applyFPTrunc(I:Int, S:Int, countByteResult(L1:List, L2:List))
         => float(I, S, L1)
         requires isZeroDigit(deleteFrontZero(L2))
    rule applyFPTrunc(I:Int, S:Int, countByteResult(L1:List, L2:List)) => badValue
         requires notBool isZeroDigit(deleteFrontZero(L2))

    rule applyFloatCasts(Op:K, vectorTypeValue(T1:K, I:Int),
                          vectorValue(.ElemList), vectorTypeValue(T2:K, I:Int), L:List)
           => vectorValue(listToElemList(L))
    rule applyFloatCasts(Op:K, vectorTypeValue(T1:K, I:Int), vectorValue(
                    valValue(A:K),Es:ElemList), vectorTypeValue(T2:K, I:Int), L:List)
             => applyFloatCasts(Op, vectorTypeValue(T1:K, I:Int), vectorValue(Es),
                vectorTypeValue(T2, I), L ListItem(applyFloatCast(Op, T1, A, T2)))
         requires applyFloatCast(Op, T1, A, T2) =/=K badValue
    rule applyFloatCasts(Op:K, vectorTypeValue(T1:K, I:Int),
               vectorValue(valValue(A:K),Es:ElemList),
                   vectorTypeValue(T2:K, I:Int), L:List) => badValue
         requires applyFloatCast(Op, T1, A, T2) ==K badValue
    rule applyFloatCasts(Op:K, T1:K, zeroinitializer, T2:K, L:List)
             => applyFloatCasts(Op, T1, dealWithZeroInitializer(T1), T2, L)
    rule applyFloatCasts(Op:K, T1:K, V:K, T2:K, L:List)
           => applyFloatCast(Op, getIntType(T1), V, getIntType(T2)) [owise]

    //int to float casting function
    rule applyIntFloat(Op:K, T:K, intLoc(A:K, B:K, R:K,D:K,BA:K), T':K)
              => floatLoc(applyIntFloat(Op, T, A, T'), B, R,D,BA:K)
    rule applyIntFloat(Op:K, T:K, poisonVal, T':K) => poisonVal
    rule applyIntFloat(Op:K, T:K, undef, T':K) => undef
    rule applyIntFloat(Op:K, T:K, zeroinitializer, T':K)
               => applyIntFloat(Op:K, T:K, dealWithZeroInitializer(T), T')
    rule applyIntFloat(uitofp, integerType(N:Int), A:Int, T':K)
               => applyUnsignedIntFloat(
                   decToBinNoLimit(normalizingInt(integerType(N:Int), A)), T')
    rule applyIntFloat(sitofp, integerType(N:Int), A:Int, T':K)
               => applySignedIntFloat(deNormalizingInt(integerType(N),
                           normalizingInt(integerType(N:Int), A)),
                   decToBinNoLimit(absInt(deNormalizingInt(integerType(N),
                         normalizingInt(integerType(N:Int), A)))), T')

    rule applySignedIntFloat(I:Int, .List, T:FPType) => posZero
    rule applySignedIntFloat(I:Int, ListItem(1) L:List, T:FPType)
           => applySignedIntFloatAux(I, size(L), deleteBackZero(L), T)
         requires size(L) <=Int upperBoundExp(T)
    rule applySignedIntFloat(I:Int, ListItem(1) L:List, T:FPType) => badValue
         requires size(L) >Int upperBoundExp(T)

    rule applySignedIntFloatAux(I:Int, S:Int, L:List, T:FPType)
           => float(0, S, L copyOfK(0, mantissaOf(T) -Int size(L)))
         requires size(L) <=Int mantissaOf(T) andBool I >=Int 0
    rule applySignedIntFloatAux(I:Int, S:Int, L:List, T:FPType)
           => float(1, S, L copyOfK(0, mantissaOf(T) -Int size(L)))
         requires size(L) <=Int mantissaOf(T) andBool I <Int 0
    rule applySignedIntFloatAux(I:Int, S:Int, L:List, T:FPType) => badValue
         requires size(L) >Int mantissaOf(T)

    rule applyUnsignedIntFloat(.List, T:FPType) => posZero
    rule applyUnsignedIntFloat(ListItem(1) L:List, T:FPType)
              => applyUnsignedIntFloatAux(size(L), deleteBackZero(L), T)
         requires size(L) <=Int upperBoundExp(T)
    rule applyUnsignedIntFloat(ListItem(1) L:List, T:FPType) => badValue
         requires size(L) >Int upperBoundExp(T)
    rule applyUnsignedIntFloatAux(S:Int, L:List, T:FPType)
           => float(0, S, L copyOfK(0, mantissaOf(T) -Int size(L)))
         requires size(L) <=Int mantissaOf(T)
    rule applyUnsignedIntFloatAux(S:Int, L:List, T:FPType) => badValue
         requires size(L) >Int mantissaOf(T)

    rule applyIntFloats(Op:K, vectorTypeValue(T1:K, I:Int),
                          vectorValue(.ElemList), vectorTypeValue(T2:K, I:Int), L:List)
           => vectorValue(listToElemList(L))
    rule applyIntFloats(Op:K, vectorTypeValue(T1:K, I:Int), vectorValue(
                    valValue(A:K),Es:ElemList), vectorTypeValue(T2:K, I:Int), L:List)
             => applyIntFloats(Op, vectorTypeValue(T1:K, I:Int), vectorValue(Es),
                vectorTypeValue(T2, I), L ListItem(applyIntFloat(Op, T1, A, T2)))
         requires applyIntFloat(Op, T1, A, T2) =/=K badValue
    rule applyIntFloats(Op:K, vectorTypeValue(T1:K, I:Int),
               vectorValue(valValue(A:K),Es:ElemList),
                   vectorTypeValue(T2:K, I:Int), L:List) => badValue
         requires applyIntFloat(Op, T1, A, T2) ==K badValue
    rule applyIntFloats(Op:K, T1:K, zeroinitializer, T2:K, L:List)
             => applyIntFloats(Op, T1, dealWithZeroInitializer(T1), T2, L)
    rule applyIntFloats(Op:K, T1:K, V:K, T2:K, L:List)
           => applyIntFloat(Op, getIntType(T1), V, getIntType(T2)) [owise]

    //float to int casting function
    rule applyFloatInt(Op:K, T:K, floatLoc(A:K, B:K, R:K,D:K,BA:K), T':K)
              => intLoc(applyFloatInt(Op, T, A, T'), B, R,D,BA:K)
    rule applyFloatInt(Op:K, T:K, poisonVal, T':K) => poisonVal
    rule applyFloatInt(Op:K, T:K, undef, T':K) => undef
    rule applyFloatInt(Op:K, T:K, zeroinitializer, T':K)
               => applyFloatInt(Op:K, T:K, dealWithZeroInitializer(T), T')
    rule applyFloatInt(Op:K, T:K, A:K, T':K) => 0
         requires A ==K posZero orBool A ==K negZero
    rule applyFloatInt(Op:K, T:K, A:K, T':K) => badValue
         requires A ==K posInf orBool A ==K negInf orBool A ==K nan
    rule applyFloatInt(fptoui, T1:K, float(I:Int, S:Int, L:List), T2:K) => badValue
         requires I ==Int 1
    rule applyFloatInt(fptoui, T1:K, float(I:Int, S:Int, L:List), T2:K) => 0
         requires I ==Int 0 andBool S <Int 0
    rule applyFloatInt(fptoui, T1:K, float(I:Int, S:Int, L:List), T2:K)
                 => applyUnsignedFloatInt(
                     binToDecNoLimit(ListItem(1) getLeftCountResult(
                               countFromLeftNoLimit(.List, L, S))), T2)
         requires I ==Int 0 andBool S >=Int 0
    rule applyFloatInt(fptosi, T1:K, float(I:Int, S:Int, L:List), T2:K) => 0
         requires S <Int 0
    rule applyFloatInt(fptosi, T1:K, float(I:Int, S:Int, L:List), T2:K)
                 => applySignedFloatInt(I,
                     binToDecNoLimit(ListItem(1)
           getLeftCountResult(countFromLeftNoLimit(.List, L, S))), T2)
         requires S >=Int 0

    rule applySignedFloatInt(0, I:Int, integerType(N:Int))
              => normalizingInt(integerType(N), I)
         requires I <Int (2 ^Int (N -Int 1))
    rule applySignedFloatInt(0, I:Int, integerType(N:Int)) => badValue
         requires I >=Int (2 ^Int (N -Int 1))
    rule applySignedFloatInt(1, I:Int, integerType(N:Int))
                => normalizingInt(integerType(N), 0 -Int I)
         requires I <=Int (2 ^Int (N -Int 1))
    rule applySignedFloatInt(1, I:Int, integerType(N:Int)) => badValue
         requires I >Int (2 ^Int (N -Int 1))

    rule applyUnsignedFloatInt(I:Int, integerType(N:Int)) => I
         requires I <Int (2 ^Int N)
    rule applyUnsignedFloatInt(I:Int, T:K) => badValue [owise]

    rule applyFloatInts(Op:K, vectorTypeValue(T1:K, I:Int),
                          vectorValue(.ElemList), vectorTypeValue(T2:K, I:Int), L:List)
           => vectorValue(listToElemList(L))
    rule applyFloatInts(Op:K, vectorTypeValue(T1:K, I:Int), vectorValue(
                    valValue(A:K),Es:ElemList), vectorTypeValue(T2:K, I:Int), L:List)
             => applyFloatInts(Op, vectorTypeValue(T1:K, I:Int), vectorValue(Es),
                vectorTypeValue(T2, I), L ListItem(applyFloatInt(Op, T1, A, T2)))
         requires applyFloatInt(Op, T1, A, T2) =/=K badValue
    rule applyFloatInts(Op:K, vectorTypeValue(T1:K, I:Int),
               vectorValue(valValue(A:K),Es:ElemList),
                   vectorTypeValue(T2:K, I:Int), L:List) => badValue
         requires applyFloatInt(Op, T1, A, T2) ==K badValue
    rule applyFloatInts(Op:K, T1:K, zeroinitializer, T2:K, L:List)
             => applyFloatInts(Op, T1, dealWithZeroInitializer(T1), T2, L)
    rule applyFloatInts(Op:K, T1:K, V:K, T2:K, L:List)
           => applyFloatInt(Op, getIntType(T1), V, getIntType(T2)) [owise]

    rule applySelect(0, A:K, B:K) => A
    rule applySelect(I:Int, A:K, B:K) => B
         requires I =/=Int 0

    rule applySelects(I:Int, V1:K, V2:K) => applySelect(I, V1, V2)
    rule applySelects(vectorValue(S:ElemList), vectorValue(V1:ElemList),
                 vectorValue(V2:ElemList))
              => vectorValue(applySelectsAux(vectorValue(S:ElemList),
                  vectorValue(V1:ElemList), vectorValue(V2:ElemList)))

    rule applySelectsAux(vectorValue(.ElemList), vectorValue(V1:ElemList),
                   vectorValue(V2:ElemList)) => .ElemList
    rule applySelectsAux(vectorValue(valValue(I:Int), S:ElemList),
              vectorValue(valValue(V1:K),E1:ElemList),
                          vectorValue(valValue(V2:K),E2:ElemList))
                  => valValue(applySelect(I, V1, V2)),
                          applySelectsAux(vectorValue(S),
                            vectorValue(E1), vectorValue(E2))
    rule applySelectsAux(X:K, Y:K, Z:K) => .ElemList [owise]

    syntax Bool ::= goodNuw(K, Int)          [function] //type,  int value
                   | goodNsw(K, Int)         [function] //type, int signed value
    rule goodNuw(integerType(N:Int), V:Int) => true
         requires V <Int (2 ^Int N) andBool V >=Int 0
    rule goodNuw(integerType(N:Int), V:Int) => false
         requires V >=Int (2 ^Int N) orBool V <Int 0

    rule goodNsw(integerType(N:Int), I1:Int) => false
         requires I1 <Int (0 -Int (2 ^Int (N -Int 1)))
                    orBool I1 >=Int (2 ^Int (N -Int 1))
    rule goodNsw(integerType(N:Int), I1:Int) => true
         requires I1 >=Int (0 -Int (2 ^Int (N -Int 1)))
                    andBool I1 <Int (2 ^Int (N -Int 1))

    syntax Bool ::= isPowOfTwo(Int, Int)  [function]
    rule isPowOfTwo(A:Int, B:Int) => false
         requires A <Int B
    rule isPowOfTwo(A:Int, B:Int) => true
         requires A ==Int B
    rule isPowOfTwo(A:Int, B:Int) => isPowOfTwo(A, B *Int 2)
         requires A >Int B

    syntax Bool ::= isValidAlign(Int) [function]
    rule isValidAlign(A:Int) => 
          (isPowOfTwo(A, 1) orBool A ==K 0) andBool A <=Int (2 ^Int 29)

    //dealing with alignment to a number
    syntax Set ::= deleteAlign(Set) [function]
    rule deleteAlign(SetItem(A:Align) S:Set) => S
    rule deleteAlign(S:Set) => S [owise]

    syntax Int ::= adjustAlign(Int) [function]
    rule adjustAlign(0) => 1
    rule adjustAlign(A:Int) => A [owise]

    syntax Int ::= getAlign(Set, K) [function]
    rule getAlign(.Set, .K) => 1
    rule getAlign(SetItem(K:K) S:Set, .K) => getAlign(S, K)
    rule getAlign(S:Set, align N:UnsignedInt)
                   => adjustAlign(String2Int(#tokenToString(N)))
    rule getAlign(S:Set, K:KItem => .K)
         requires getKLabel(K) =/=KLabel 'align

    syntax ElemList ::= getOutEdges(K) [function]
    rule getOutEdges(I:IntType C:ConstValueRef,
              'labelValue(V:ValueRef) Ju:JumpTable) => val(addNameToString(V)),getOutEdges(Ju)
    rule getOutEdges(.JumpTable) => .ElemList
    rule getOutEdges('labelValue(V:ValueRef), Ju:LabelValues) => val(addNameToString(V)),getOutEdges(Ju)
    rule getOutEdges(.LabelValues) => .ElemList
    rule getOutEdges(V:LocalName) => val(addNameToString(V))

    syntax ElemList ::= getArgsInFunction(ElemList) [function]
    rule getArgsInFunction(.ElemList) => .ElemList
    rule getArgsInFunction(val(arg(S:Set, T:K, V:K)), E:ElemList)
            => val(typeOperand(T, V)),getArgsInFunction(E)
    rule getArgsInFunction(valValue(typedArg(S:Set, T:K, V:K)), E:ElemList)
            => valValue(typeOperandResult(T, V)),getArgsInFunction(E)

    syntax Set ::= formArgSet(ElemList)      [function]
    rule formArgSet(.ElemList) => .Set
    rule formArgSet(valValue(typeOperandResult(T:K, V:K)), E:ElemList)
            => SetItem(operand(T, V)) formArgSet(E)

    syntax ElemList ::= formArgList(ElemList, ParamList)   [function]
    rule formArgList(.ElemList, Ps:ParamList) => .ElemList
    rule formArgList(valValue(typeOperandResult(T:KResult, E:K)), Es:ElemList,
                       Ty:Type Pa:ParamAttrs Va:ValueRef, Pl:ParamList)
                          => val(arg(formSet(Pa), T, Va)),formArgList(Es, Pl)

    syntax ElemList ::= toArgList(ElemList)   [function]
    rule toArgList(.ElemList) => .ElemList
    rule toArgList(valValue(typeOperandGepVal(A:K, T:K, C:K)), Es:ElemList)
                 => valValue(typedArg(.Set, T, C)),toArgList(Es)

    syntax ElemList ::= formOperandList(ElemList)    [function]
    rule formOperandList(.ElemList) => .ElemList
    rule formOperandList(valValue(typeOperandResult(T:K, V:K)),Es:ElemList)
           => val(operand(T, V)),formOperandList(Es)
    rule formOperandList(valValue(typedArg(S:Set, T:K, V:K)), Es:ElemList)
          => val(operand(T, V)), formOperandList(Es)

    syntax KLabel ::= getKLabelFromOp(K) [function]
    rule getKLabelFromOp('add(.KList)) => 'theAdd
    rule getKLabelFromOp('sub(.KList)) => 'theSub
    rule getKLabelFromOp(mul) => 'theMul
    rule getKLabelFromOp(shl) => 'theShl
    rule getKLabelFromOp('udiv(.KList)) => 'theUDiv
    rule getKLabelFromOp('sdiv(.KList)) => 'theSDiv
    rule getKLabelFromOp('urem(.KList)) => 'theURem
    rule getKLabelFromOp('srem(.KList)) => 'theSRem
    rule getKLabelFromOp(fadd) => 'theFAdd
    rule getKLabelFromOp(fsub) => 'theFSub
    rule getKLabelFromOp(fmul) => 'theFMul
    rule getKLabelFromOp(fdiv) => 'theFDiv
    rule getKLabelFromOp(frem) => 'theFRem
    rule getKLabelFromOp('lshr(.KList)) => 'theLShr
    rule getKLabelFromOp('ashr(.KList)) => 'theAShr
    rule getKLabelFromOp('and(.KList)) => 'theAnd
    rule getKLabelFromOp('or(.KList)) => 'theOr
    rule getKLabelFromOp('xor(.KList)) => 'theXor
    rule getKLabelFromOp(uitofp) => 'theUIToFP
    rule getKLabelFromOp(sitofp) => 'theSIToFP
    rule getKLabelFromOp(fptoui) => 'theFpToUI
    rule getKLabelFromOp(fptosi) => 'theFpToSI
    rule getKLabelFromOp(fptrunc) => 'theFPTrunc
    rule getKLabelFromOp(fpext) => 'theFPExt
    rule getKLabelFromOp(trunc) => 'theTrunc
    rule getKLabelFromOp(zext) => 'theZExt
    rule getKLabelFromOp(sext) => 'theSExt
    rule getKLabelFromOp(oeq) => 'oEQ
    rule getKLabelFromOp(ogt) => 'oGT
    rule getKLabelFromOp(oge) => 'oGE
    rule getKLabelFromOp(olt) => 'oLT
    rule getKLabelFromOp(ole) => 'oLE
    rule getKLabelFromOp(one) => 'oNE
    rule getKLabelFromOp(ord) => 'oRD
    rule getKLabelFromOp('ugtOfFcmp(.KList)) => 'uGT
    rule getKLabelFromOp('ugeOfFcmp(.KList)) => 'uGE
    rule getKLabelFromOp('ultOfFcmp(.KList)) => 'uLT
    rule getKLabelFromOp('uleOfFcmp(.KList)) => 'uLE
    rule getKLabelFromOp(une) => 'uNE
    rule getKLabelFromOp(uno) => 'uNO
    rule getKLabelFromOp(ueq) => 'uEQ
    rule getKLabelFromOp(tail call) => 'call
    rule getKLabelFromOp(call) => 'call
    rule getKLabelFromOp(notail call) => 'call
    rule getKLabelFromOp(musttail call) => 'tailcall

    syntax Bool ::= hasVectorInList(ElemList)    [function]
    rule hasVectorInList(.ElemList) => false
    rule hasVectorInList(valValue(typeOperandGepVal(A:K,
        vectorTypeValue(_:K, _:K), _:K)), Es:ElemList) => true
    rule hasVectorInList(valValue(typeOperandGepVal(X:K, A:K, _:K)),
                  Es:ElemList) => hasVectorInList(Es)
         requires notBool isVectorType(A)

    syntax Bool ::= isVector(K)   [function]
    rule isVector(vectorValue(E:ElemList)) => true
    rule isVector(vector(E:ElemList)) => true
    rule isVector(_:K) => false [owise]

    syntax Bool ::= isVectorType(K)   [function]
    rule isVectorType(vectorTypeValue(A:K, B:K)) => true
    rule isVectorType(vectorType(A:K, B:K)) => true
    rule isVectorType(_:K) => false [owise]

    syntax Bool ::= hasVectorInValueList(ElemList) [function]
    rule hasVectorInValueList(.ElemList) => false
    rule hasVectorInValueList(valValue(vectorValue(_:K)),
                                             Es:ElemList) => true
    rule hasVectorInValueList(valValue(A:K), Es:ElemList)
                                         => hasVectorInValueList(Es)
         requires notBool isVector(A)

    syntax Bool ::= hasVectorInReturnedVal(ReturnedVal)    [function]
    rule hasVectorInReturnedVal(.ReturnedVal) => false
    rule hasVectorInReturnedVal(
                      vectorType(_:K, _:K) V:ValueRef, Es:ReturnedVal) => true
    rule hasVectorInReturnedVal(T:Type V:ValueRef,
                  Es:ReturnedVal) => hasVectorInReturnedVal(Es)
         requires getKLabel(T) =/=KLabel 'vectorType

    //function to fill a getelementptr index
    // list with full vector representation.
    syntax KItem ::= getVectorNum(ElemList)        [function]
    rule getVectorNum(.ElemList) => badValue
    rule getVectorNum(valValue(typeOperandGepVal(A:K,
        vectorTypeValue(_:K, I:K), _:K)), Es:ElemList) => I
    rule getVectorNum(valValue(typeOperandGepVal(A:K, T:K, _:K)),
                  Es:ElemList) => getVectorNum(Es)
         requires notBool isVectorType(T)

    syntax Bool ::= allSameStructVectorNum(K, ElemList)  [function]
                  | allSameStructVectorNumAux(K, K, ElemList) [function]

    syntax KItem ::= getFirstInVector(K) [function]
    rule getFirstInVector(valValue(A:K),Es:ElemList) => A
    rule getFirstInVector(A:K) => badValue [owise]
   
    syntax KItem ::= getAllVectorVals(K, List)  [function]
    rule getAllVectorVals(vector(.ElemList), L:List)
                => vector(listToElemList(L))
    rule getAllVectorVals(vector(val(operand(T:K, A:K)),Es:ElemList), L:List)
              => getAllVectorVals(vector(Es), L ListItem(getConstIntValue(A,32)))
    rule getAllVectorVals(A:K, L:List) => badValue [owise]

    syntax Bool ::= isAllSameInt(ElemList) [function]
                  | isAllSameIntAux(Int, ElemList) [function]
    rule isAllSameInt(.ElemList) => true
    rule isAllSameInt(valValue(A:Int),Es:ElemList)
          => isAllSameIntAux(A, Es)
    rule isAllSameIntAux(I:Int, .ElemList) => true
    rule isAllSameIntAux(I:Int, valValue(I:Int),Es:ElemList)
                => isAllSameIntAux(I, Es)
    rule isAllSameIntAux(I:Int, valValue(I':Int),Es:ElemList) => false
         requires I =/=Int I'

    rule allSameStructVectorNum(T:K, .ElemList) => true
    rule allSameStructVectorNum(gepTypeBag(T:K), valValue(X:K),Es:ElemList)
          => allSameStructVectorNum(T, Es)
    rule allSameStructVectorNum(arrayTypeValue(T:K, B:Int),
          valValue(X:K),Es:ElemList) => allSameStructVectorNum(T, Es)
    rule allSameStructVectorNum(vectorTypeValue(T:K, B:Int),
          valValue(X:K),Es:ElemList) => allSameStructVectorNum(T, Es)
    rule allSameStructVectorNum(T:K,
          valValue(typeOperandGepVal(A:K, B:K, C:K)),Es:ElemList)
               => allSameStructVectorNumAux(T, getAllVectorVals(C, .List), Es)
         requires isStructType(T)
    rule allSameStructVectorNum(T:K, valValue(X:K),Es:ElemList) => true
         requires notBool isVectorType(T) andBool
                   notBool isArrayType(T) andBool notBool isStructType(T)

    rule allSameStructVectorNumAux(T:K, badValue, Es:ElemList) => false
    rule allSameStructVectorNumAux(structTypeValue(Ts:TypeList),
                vector(Is:ElemList), Es:ElemList)
           => allSameStructVectorNum(
                getGepTypeInStruct(Ts, getFirstInVector(Is)), Es)
         requires getFirstInVector(Is) =/=K badValue
            andBool getGepTypeInStruct(Ts, getFirstInVector(Is)) =/=K badType
    rule allSameStructVectorNumAux(structTypeValue(Ts:TypeList),
                vector(Is:ElemList), Es:ElemList) => false
         requires getFirstInVector(Is) ==K badValue
            orBool getGepTypeInStruct(Ts, getFirstInVector(Is)) ==K badType
    rule allSameStructVectorNumAux(packedStructTypeValue(Ts:TypeList),
                vector(Is:ElemList), Es:ElemList)
           => allSameStructVectorNum(
                getGepTypeInStruct(Ts, getFirstInVector(Is)), Es)
         requires getFirstInVector(Is) =/=K badValue
            andBool getGepTypeInStruct(Ts, getFirstInVector(Is)) =/=K badType
    rule allSameStructVectorNumAux(packedStructTypeValue(Ts:TypeList),
                vector(Is:ElemList), Es:ElemList) => false
         requires getFirstInVector(Is) ==K badValue
            orBool getGepTypeInStruct(Ts, getFirstInVector(Is)) ==K badType

    syntax Bool ::= isSameVectorNum(ElemList, Int) [function]
    rule isSameVectorNum(.ElemList, X:Int) => true
    rule isSameVectorNum(valValue(typeOperandGepVal(A:K,
        vectorTypeValue(_:K, I), _:K)), Es:ElemList, I:Int)
             => isSameVectorNum(Es, I)
    rule isSameVectorNum(valValue(typeOperandGepVal(A:K,
        vectorTypeValue(_:K, I'), _:K)), Es:ElemList, I:Int) => false
        requires I =/=Int I'

    syntax Bool ::= isAllSameType(List) [function]
                  | isAllSameTypeAux(List, K) [function]
    rule isAllSameType(.List) => true
    rule isAllSameType(ListItem(T:K) L:List)
           => isAllSameTypeAux(L, T)
    rule isAllSameTypeAux(.List, T:K) => true
    rule isAllSameTypeAux(ListItem(T:K) L:List, T:K)
               => isAllSameTypeAux(L, T)
    rule isAllSameTypeAux(ListItem(T':K) L:List, T:K) => false
         requires T' =/=K T

    syntax ElemList ::= copyOfElemList(K, K, Int) [function]
                  //type, value, number
    rule copyOfElemList(T:K, A:K, 0) => .ElemList
    rule copyOfElemList(T:K, A:K, N:Int) =>
              val(operand(T,A)),copyOfElemList(T, A, N -Int 1)
         requires N >Int 0

    syntax ElemList ::= fulfillVector(ElemList, Int)       [function]
    rule fulfillVector(.ElemList, I:Int) => .ElemList
    rule fulfillVector(valValue(typeOperandGepVal(A:K, 
        vectorTypeValue(B:K, C:K), D:K)), Es:ElemList, I:Int)
              => valValue(typeOperandGepVal(A:K,
         vectorTypeValue(B:K, C:K), D:K)), fulfillVector(Es, I)
    rule fulfillVector(valValue(typeOperandGepVal(A:K, 
               B:K, D:K)), Es:ElemList, I:Int)
              => valValue(typeOperandGepVal(A:K,
             vectorTypeValue(B:K, I),
                vector(copyOfElemList(B, D:K, I)))), fulfillVector(Es, I)
         requires notBool isVectorType(B)

    //a series functions to combine lists of gep arg to gep vector args
    syntax KItem ::= splitFirstInList(List, List, List) [function]
    rule splitFirstInList(.List, L:List, R:List)
           => splitListResult(L, R)
    rule splitFirstInList(ListItem(.ElemList) L:List, L1:List, L2:List)
              => none
    rule splitFirstInList(ListItem(val(gepOperand(A:K, T:K, C:K)),Es:ElemList)
                         L:List, L1:List, L2:List)
           => splitFirstInList(L, L1 ListItem(gepOperand(A:K, T:K, C:K)), L2 ListItem(Es))
    
    syntax KItem ::= getInrangeInList(List) [function]
    rule getInrangeInList(ListItem(gepOperand(A:K, T:K, C:K)) L:List) => A
    rule getInrangeInList(.List) => badValue

    syntax KItem ::= getTypeInList(List) [function]
    rule getTypeInList(ListItem(gepOperand(A:K, T:K, C:K)) L:List) => T
    rule getTypeInList(ListItem(T:KResult) L:List) => T
    rule getTypeInList(.List) => badValue

    syntax KItem ::= toGepVectorInList(List, ElemList) [function]
    rule toGepVectorInList(.List, Es:ElemList) => vector(Es)
    rule toGepVectorInList(ListItem(gepOperand(A:K, T:K, C:K)) L:List, Es:ElemList)
            => toGepVectorInList(L, addElemToEnd(val(operand(T,C)), Es))

    syntax ElemList ::= toVectorGep(List, Int) [function]
                      | toVectorGepAux(K, Int) [function]
    rule toVectorGep(L:List, VI:Int)
              => toVectorGepAux(splitFirstInList(L, .List, .List), VI)
    rule toVectorGepAux(none, VI:Int) => .ElemList
    rule toVectorGepAux(splitListResult(L, R), VI:Int)
           => val(gepOperand(getInrangeInList(L),
                  vectorTypeValue(getTypeInList(L), VI),
                    toGepVectorInList(L, .ElemList))),toVectorGep(R, VI)
         requires getInrangeInList(L) =/=K badValue
              andBool getTypeInList(L) =/=K badValue

    syntax ElemList ::= toGepOperand(ElemList) [function]
    rule toGepOperand(.ElemList) => .ElemList
    rule toGepOperand(valValue(typeOperandGepVal(A:K, T:K, C:K)),Es:ElemList)
           => val(gepOperand(A, T, C)),toGepOperand(Es)          

    syntax List ::= divideElemList(ElemList, List)    [function]
                  | divideElemAux(K, ElemList, List)  [function]
                  | addElemAux(List, List)            [function]
    rule divideElemAux(A:K, .ElemList, L:List) => L
    rule divideElemAux(A:K, val(operand(T:K, Y:K)),Es:ElemList, L:List)
         => divideElemAux(A, Es, L ListItem(typeOperandGepVal(A, T, Y)))
    rule addElemAux(.List, L:List) => .List
    rule addElemAux(ListItem(Es:ElemList) L:List, ListItem(
           typeOperandGepVal(A:K, B:K, C:K)) BL:List)
             => ListItem(addElemToEnd(valValue(
              typeOperandGepVal(A:K, B:K, C:K)), Es)) addElemAux(L, BL)
    rule divideElemList(.ElemList, L:List) => L
    rule divideElemList(valValue(typeOperandGepVal(
             A:K, vectorTypeValue(B:K, I:Int),
                vector(Es:ElemList))), Res:ElemList, L:List)
           => divideElemList(Res, addElemAux(L, divideElemAux(A, Es, .List)))

    syntax KItem ::= evalToInt(K) [function]
    syntax ElemList ::= evalToIntInList(ElemList)  [function]

    rule evalToInt(I:Int) => I
    rule evalToInt(vector(Es:ElemList)) => vector(evalToIntInList(Es))
    rule evalToInt(A:K) => A [owise]

    rule evalToIntInList(.ElemList) => .ElemList
    rule evalToIntInList(val(operand(T:K, B:K)),
             Es:ElemList) => valValue(evalToInt(B)), evalToIntInList(Es)

    syntax List ::= formListFromTypeList(TypeList)  [function]
    rule formListFromTypeList(.TypeList) => .List
    rule formListFromTypeList(T:Type, Ts:TypeList)
                        => ListItem(T) formListFromTypeList(Ts)

    rule { Es:ReturnedVal } => constantStruct(formElemList(Es))  [structural]
    rule < { Es:ReturnedVal } > => packedStruct(formElemList(Es))  [structural]

    syntax Set ::= getAllLocalVar(K)   [function]
    syntax Set ::= getAllLocalVars(ElemList)  [function]

    rule getAllLocalVar(X:SymbolicValueRef) => SetItem(X)
    rule getAllLocalVar(vector(Es:ElemList)) => getAllLocalVars(Es)
    rule getAllLocalVar(K:K) => .Set  [owise]
    rule getAllLocalVars(.ElemList) => .Set
    rule getAllLocalVars(val(edge(V:K, L:K)), Es:ElemList)
                                       => getAllLocalVar(V) getAllLocalVars(Es)
    rule getAllLocalVars(val(operand(T':Type, V:ValueRef)), Es:ElemList)
                                       => getAllLocalVar(V) getAllLocalVars(Es)
    rule getAllLocalVars(valValue(typeOperandResult(T:K, V:K)), Es:ElemList)
                                          => getAllLocalVar(V) getAllLocalVars(Es)

    syntax List ::= setBlockToPath(List, K, K) [function]
    rule setBlockToPath(.List, _:K, _:K) => .List
    rule setBlockToPath(ListItem(blockPath(L:List ListItem(A:K))) BL:List, A:K, B:K)
          => ListItem(blockPath(L ListItem(A) ListItem(B))) setBlockToPath(BL, A, B)
    rule setBlockToPath(ListItem(blockPath(L:List ListItem(A:K))) BL:List, A':K, B:K)
          => ListItem(blockPath(L ListItem(A))) setBlockToPath(BL, A', B)
         requires A =/=K A'

    syntax List ::= mergeList(List, List) [function]
    rule mergeList(.List, L:List) => L
    rule mergeList(ListItem(A:K) L:List, L':List)
             => mergeList(L, ListItem(A) L')
         requires notBool A in L'
    rule mergeList(ListItem(A:K) L:List, L':List)
             => mergeList(L, L')
         requires A in L'

    syntax List ::= addElemToList(K, List) [function]
    rule addElemToList(A:K, .List) => .List
    rule addElemToList(A:K, ListItem(blockPath(L':List)) L:List)
                 => ListItem(blockPath(L' ListItem(A))) addElemToList(A, L)

    syntax Map ::= addChildToKey(Map, Int, Int) [function]
    rule addChildToKey(M:Map (A:Int |-> runBlock(Count:Int,
              Name:K, Fa:K, L:List, S:Set, Cs:Set)), A:Int, C:Int)
        => M (A |-> runBlock(Count, Name, Fa, L, S, SetItem(C) Cs))
    rule addChildToKey(M:Map, A:Int, C:Int) => M [owise]

    syntax Map ::= addNextBlockMemOp(Map, Int,Int, K) [function]
    syntax List ::= addNextBlockMemOpList(List, Int, K) [function]
    rule addNextBlockMemOp(M:Map (A:Int |-> runBlock(Count:Int,
              Name:K, Fa:K, L:List, S:Set, Cs:Set)), A:Int, Chi:Int, C:K)
        => M (A |-> runBlock(Count, Name, Fa,
                      addNextBlockMemOpList(L, Chi, C), S, Cs))
    rule addNextBlockMemOp(M:Map, A:Int,Chi:Int, C:K) => M [owise]
    rule addNextBlockMemOpList(.List, Chi:Int, C:K) => .List
    rule addNextBlockMemOpList(L:List
                 ListItem(memProto(Co:Int, In:K, M:Map, B:Bool)), Chi:Int, C:K)
           => L ListItem(memProto(Co, In, M[Chi <- C], B))

    syntax Map ::= updateChoiceInMap(Map, Int, Set) [function]
    rule updateChoiceInMap(M:Map (A:Int |-> nextSpecs(S:Set)), A:Int, C:Set)
        => M (A |-> nextSpecs(C))
    rule updateChoiceInMap(M:Map, A:Int, C:Set) => M [owise]


    //selecting phi in a list of phi ops
    syntax List ::= selectPhis(Int, K, List) [function]//label, op list
    syntax KItem ::= selectPhi(Int, K, K) [function]
    rule selectPhis(Fa:Int, A:K, .List) => .List
    rule selectPhis(Fa:Int, A:K, ListItem(instNumInfo(Num:Int,
               assign(X:K, instruction(In:K, Attrs:Set, Meta:K)), La:K)) L:List)
         =>  ListItem(instNumInfo(Num:Int,
               assign(X:K, instruction(In:K, Attrs:Set, Meta:K)), La:K))
             selectPhis(Fa:Int, A, L)
         requires La =/=K phiInst
    rule selectPhis(Fa:Int, A:K, ListItem(instNumInfo(Num:Int,
               assign(X:K, instruction(In:K, Attrs:Set, Meta:K)), phiInst)) L:List)
        =>  ListItem(instNumInfo(Num:Int,
               assign(X:K, instruction(selectPhi(Fa, A, In:K), Attrs:Set, Meta:K)), phiInst))
                selectPhis(Fa:Int, A, L)
    rule selectPhi(Fa:Int, L:K, phi(T:K, Es:ElemList)) => selectPhi(Fa:Int, L, Es)
    rule selectPhi(Fa:Int, L:K, .ElemList) => badValue
    rule selectPhi(Fa:Int, L:K, val(edge(V:K, L:K)),Es:ElemList)
          => phiResult(Fa, V)
    rule selectPhi(Fa:Int, L:K, val(edge(V:K, L':K)),Es:ElemList)
          => selectPhi(Fa, L, Es)
         requires L =/=K L'

    syntax KItem ::= guessNextBlock(K) [function]
    rule guessNextBlock(unconditional(A:K)) => A
    rule guessNextBlock(conditional(A:K, B:K, C:K)) => B
    rule guessNextBlock(switch(A:K, B:K, C:K,
                      ListItem(typedCase(It:K, I:K, D:K)) Es:List)) => D
    rule guessNextBlock(indirectbr(A:K, ListItem(B:K) Es:List)) => B
    //rule guessNextBlock(invoke(A:K, B:K, C:K, D:K, FL:K)) => C
    rule guessNextBlock(_:K) => .K [owise]

/*    syntax Set ::= getAllBrBlocks(K) [function]
    rule getAllBrBlocks(unconditional(A:K)) => SetItem(A)
    rule getAllBrBlocks(conditional(A:K, B:K, C:K))
               => SetItem(B) SetItem(C)
    rule getAllBrBlocks(switch(A:K, B:K, C:K, Es:List))
               => SetItem(C) elemListToSet(Es)
    rule getAllBrBlocks(indirectbr(A:K, Es:ElemList)) => elemListToSet(Es)
*/
    syntax Set ::= getRestBlocks(K, K, Map) [function]
    rule getRestBlocks(unconditional(A:K), .K, (A |-> B:K) M:Map)
           => getRestBlocks(unconditional(A:K), B, M:Map)
    rule getRestBlocks(unconditional(A:K), blockContent(
               _:Map, _:Bool, _:Set, _:Set, _:Set,
              _:Set, _:Set, _:Set, _:Set), M:Map)
              => .Set
    rule getRestBlocks(conditional(A:K, B:K, C:K), .K, (B |-> D:K) M:Map)
             => getRestBlocks(conditional(A:K, B:K, C:K), D, M:Map)
    rule getRestBlocks(conditional(A:K, B:K, C:K), blockContent(
               _:Map, _:Bool, _:Set, _:Set, _:Set,
              _:Set, _:Set, _:Set, _:Set), M:Map)
               => SetItem(C)
         requires C =/=K B
        rule getRestBlocks(conditional(A:K, B:K, C:K), blockContent(
               _:Map, _:Bool, _:Set, _:Set, _:Set,
              _:Set, _:Set, _:Set, _:Set), M:Map)
               => .Set
         requires C ==K B
    rule getRestBlocks(switch(A:K, B:K, C:K, ListItem(typedCase(It:K, I:K, D:K)) Es:List),
               .K, (D |-> E:K) M:Map)
             => getRestBlocks(switch(A:K, B:K, C:K, Es:List), E, M:Map)
    rule getRestBlocks(switch(A:K, B:K, C:K,
               ListItem(typedCase(It:K, I:K, D:K)) Es:List), blockContent(
               _:Map, _:Bool, _:Set, _:Set, _:Set,
              _:Set, _:Set, _:Set, _:Set), M:Map)
             => removeItemFromSet(D, .K, SetItem(C) switchListToSet(Es))
    rule getRestBlocks(indirectbr(A:K, (ListItem(B:K) Es:List)),
               .K, (B |-> C:K) M:Map)
             => getRestBlocks(indirectbr(A:K,
                       (ListItem(B:K) Es:List)), C, M:Map)
    rule getRestBlocks(indirectbr(A:K, (ListItem(B:K) Es:List))
           , blockContent( _:Map, _:Bool, _:Set, _:Set, _:Set,
              _:Set, _:Set, _:Set, _:Set), M:Map)
                   => removeItemFromSet(B, .K, indirectbrListToSet(Es))
    rule getRestBlocks(invoke(A:K, B:K, C:K, D:K, FL:K),
               .K, (C |-> E:K) M:Map)
             => getRestBlocks(invoke(A:K, B:K, C:K, D:K, FL:K), E, M:Map)
    rule getRestBlocks(invoke(A:K, B:K, C:K, D:K, FL:K)
           , blockContent( _:Map, _:Bool, _:Set, _:Set, _:Set,
              _:Set, _:Set, _:Set, _:Set), M:Map) => .Set

    syntax Set ::= removeItemFromSet(K, K, Set) [function]
    rule removeItemFromSet(A:K, .K, .Set) => .Set
    rule removeItemFromSet(A:K, .K, SetItem(B:K) S:Set)
           => removeItemFromSet(A, B, S)
    rule removeItemFromSet(A:K, B:K, S:Set)
          => SetItem(B) removeItemFromSet(A, .K, S)
         requires A =/=K B andBool B =/=K .K
    rule removeItemFromSet(A:K, A:K, S:Set)
          => removeItemFromSet(A, .K, S)
         requires A =/=K .K

    syntax Bool ::= hasRestBlocks(K, Map)  [function]
    rule hasRestBlocks(.K, .Map) => false
    rule hasRestBlocks(.K, (A:K |-> B:K) M:Map)
              => hasRestBlocks(B, M)
    rule hasRestBlocks(nextSpecs(.Set), M:Map)
            => hasRestBlocks(.K, M)
    rule hasRestBlocks(nextSpecs(SetItem(A:K) S:Set), M:Map)
            => true

    syntax Set ::= switchListToSet(List) [function]
    rule switchListToSet(.List) => .Set
    rule switchListToSet(ListItem(typedCase(It:K, I:K, A:K)) L:List)
             => SetItem(A) switchListToSet(L)

    syntax Set ::= indirectbrListToSet(List) [function]
    rule indirectbrListToSet(.List) => .Set
    rule indirectbrListToSet(ListItem(A:K) L:List)
             => SetItem(A) indirectbrListToSet(L)

    syntax Set ::= elemListToSet(ElemList) [function]
    rule elemListToSet(.ElemList) => .Set
    rule elemListToSet(val(A:K), Es:ElemList)
                        => SetItem(A) elemListToSet(Es)
    rule elemListToSet(valValue(A:K), Es:ElemList)
                        => SetItem(A) elemListToSet(Es)

    //get the next block that has not been speculated yet.
    syntax KItem ::= findNextBlock(K, K, K, Map, Map) [function]
                       //b-id, runblock, rest-choice, runb-map, rest-map
                   | findNextBlockAux(K, Set, Map, Map) [function]

    rule findNextBlock(A:K, .K, .K, M:Map, M':Map) => none
         requires (notBool A in keys(M)) orBool (notBool A in keys(M'))
    rule findNextBlock(A:K, .K, .K, (A |-> B:K) M:Map, (A |-> C:K) M':Map)
          => findNextBlock(A, B, C, M, M')
    rule findNextBlock(A:K, runBlock(Count:Int, Name:K, Fa:Int,
               L:List, S:Set, Child:Set), nextSpecs(.Set), M:Map, M':Map)
          => findNextBlockAux(.K, Child, M, M')
    rule findNextBlock(A:K, runBlock(Count:Int, Name:K, Fa:Int,
               L:List, S:Set, Child:Set), nextSpecs(SetItem(Na:K) Cs:Set), M:Map, M':Map)
          => selectSpec(A, Na, Cs)
    rule findNextBlockAux(.K, .Set, M:Map, M':Map) => none
    rule findNextBlockAux(.K, SetItem(A:K) S:Set, M:Map, M':Map)
           => findNextBlockAux(findNextBlock(A, .K, .K, M, M'), S, M, M')
    rule findNextBlockAux(none, S:Set, M:Map, M':Map)
            => findNextBlockAux(.K, S, M, M')
    rule findNextBlockAux(selectSpec(A:K, B:K, Cs:Set), S:Set, M:Map, M':Map)
              => selectSpec(A:K, B:K, Cs:Set)

    syntax KItem ::= getFatherName(K, Map) [function]
    rule getFatherName(A:K, M:Map) => none
         requires notBool A in keys(M)
    rule getFatherName(A:K, (A |-> runBlock(Count:Int,
                   Name:K, Fa:Int, L:List, S:Set, Child:Set)) M:Map) => Name
    syntax KItem ::= getFatherId(K) [function]
    rule getFatherId(runBlock(Count:Int,
                   Name:K, Fa:K, L:List, S:Set, Child:Set)) => Fa
    rule getFatherId(A:K) => none [owise]

    //test if A is a father of B in the specTree Map, reflesive
    syntax Bool ::= isFather(K, K, Map)  [function]
    rule isFather(A:K, A:K, M:Map) => true
    rule isFather(A:K, B:K, M:Map) => false
         requires notBool B in keys(M) andBool A =/=K B
    rule isFather(A:K, B:K, (B |-> C:K) M:Map)
           => isFather(A, getFatherId(C), M)
         requires A =/=K B

    //cut off tree branches that is a not a child of the spectree
    syntax Set ::= getAllChildrenAux(Int, K, Map) [function]
                 | getAllChildren(Set, Map) [function]
    rule getAllChildrenAux(I:Int, .K, M:Map) => .Set
         requires notBool I in keys(M)
    rule getAllChildrenAux(I:Int, .K, (I |-> A:K) M:Map)
          => getAllChildrenAux(I, A, M)
    rule getAllChildrenAux(I:Int, runBlock(Count:Int,
                   Name:K, Fa:K, L:List, S:Set, Child:Set), M:Map)
          => Child getAllChildren(Child, M)

    rule getAllChildren(.Set, M:Map) => .Set
    rule getAllChildren(SetItem(A:Int) S:Set, M:Map)
              => getAllChildrenAux(A,.K, M) getAllChildren(S, M)

    syntax Map ::= cutOffWrongBranches(Int, Int, Map)
                 | cutOffWrongBranchesAux(Int, K, Set, Map)
               //kept child, runblock, Map
    rule cutOffWrongBranches(Fa:Int, Chi:Int, M:Map)
            => cutOffWrongBranchesAux(Chi, .K, getAllChildrenAux(Fa, .K, M), M)

    rule cutOffWrongBranchesAux(Chi:Int, .K, .Set, M:Map) => M
    rule cutOffWrongBranchesAux(Chi:Int, .K, SetItem(A:K) S:Set, M:Map)
          => cutOffWrongBranchesAux(Chi, A, S, M)
    rule cutOffWrongBranchesAux(Chi:Int, Chi, S:Set, M:Map)
          => cutOffWrongBranchesAux(Chi, .K, S, M)
    rule cutOffWrongBranchesAux(Chi:Int, C:Int, S:Set, (C |-> D:K) M:Map)
          => cutOffWrongBranchesAux(Chi, .K, S, M)
         requires Chi =/=K C
    rule cutOffWrongBranchesAux(Chi:Int, C:Int, S:Set, M:Map)
          => cutOffWrongBranchesAux(Chi, .K, S, M)
         requires Chi =/=K C andBool notBool C in keys(M)


    //get rid of mem inst that is not in the specTree
    syntax List ::= getRidWrongSepcOps(Set, List) [function]
    rule getRidWrongSepcOps(S:Set, .List) => .List
    rule getRidWrongSepcOps(S:Set, ListItem(singleMem(TID:Int, Bn:Int,
                     In:Int, Ran:K, Op:K)) L:List)
         => ListItem(singleMem(TID:Int, Bn:Int,
                     In:Int, Ran:K, Op:K)) getRidWrongSepcOps(S, L)
         requires Bn in S
    rule getRidWrongSepcOps(S:Set, ListItem(singleMem(TID:Int, Bn:Int,
                     In:Int, Ran:K, Op:K)) L:List)
           => getRidWrongSepcOps(S, L) [owise]

    //get rid of mem values in mem registers 
    syntax Map ::= getRidWrongSepcMems(Set, K, K, Map) [function]
    rule getRidWrongSepcMems(S:Set, .K, .K, .Map) => .Map
    rule getRidWrongSepcMems(S:Set, .K, .K, (A:K |-> B:K) M:Map)
           => getRidWrongSepcMems(S, A, B, M)
    rule getRidWrongSepcMems(S:Set, varInstance(Bn:Int,In:Int), B:K, M:Map)
           => (varInstance(Bn:Int,In:Int) |-> B) getRidWrongSepcMems(S, .K, .K, M)
         requires Bn in S
    rule getRidWrongSepcMems(S:Set, varInstance(Bn:Int,In:Int), B:K, M:Map)
           => getRidWrongSepcMems(S, .K, .K, M) [owise]

    syntax Set ::= getWrongSpecLocs(Set, K, K, Map) [function]
    rule getWrongSpecLocs(S:Set, .K, .K, .Map) => .Set
    rule getWrongSpecLocs(S:Set, .K, .K, (A:K |-> B:K) M:Map)
           => getWrongSpecLocs(S, A, B, M)
    rule getWrongSpecLocs(S:Set, varInstance(Bn:Int,In:Int), B:K, M:Map)
           => getWrongSpecLocs(S, .K, .K, M)
         requires Bn in S
    rule getWrongSpecLocs(S:Set, varInstance(Bn:Int,In:Int), pairResult(C:K, D:K), M:Map)
           => SetItem(C) getWrongSpecLocs(S, .K, .K, M) [owise]

    syntax Map ::= getRidWrongCBD(K, Set, Map) [function]
    rule getRidWrongCBD(.K, .Set, M:Map) => M
    rule getRidWrongCBD(.K, SetItem(A:K) S:Set, M:Map)
          => getRidWrongCBD(A, S, M)
    rule getRidWrongCBD(A:Loc, S:Set, (A |-> B:K) M:Map)
           => getRidWrongCBD(.K, S, M)
    rule getRidWrongCBD(A:Loc, S:Set, M:Map) => getRidWrongCBD(.K, S, M) [owise]


    syntax Set ::= getSet(K) [function]
    rule getSet(nextSpecs(S:Set)) => S
    rule getSet(A:K) => .Set [owise]

    syntax Map ::= changeBlocks(Int, K, Set, Map, Bool)  [function]

    rule changeBlocks(Count:Int, Name:K, S:Set, M:Map, true)
          => M (Count |-> nextSpecs(SetItem(Name) S))
    rule changeBlocks(Count:Int, Name:K, S:Set, M:Map, false)
          => M (Count |-> nextSpecs(S))

    syntax Map ::= updateChoiceMap(Map, K, K, K) [function]

    rule updateChoiceMap(Chi:Map (A:K |-> B:K), .K, A:K, X:K)
           => updateChoiceMap(Chi, B, A, X)
    rule updateChoiceMap(Chi:Map, nextSpecs(S:Set), A:K, X:K)
           => Chi (A |-> nextSpecs(S:Set SetItem(X)))

    syntax Bool ::= isAvailable(K) [function]
    rule isAvailable(Op:KLabel(Ty:K,, V1:KResult,, V2:KResult)) => true
        requires isIntOp(Op:KLabel(Ty:K,, V1:KResult,, V2:KResult))
    rule isAvailable(alloca(Ty:K, preAlloca(T2:K, V:KResult),
                             Ad:Int, Align:Int, Con:Bool)) => true
    rule isAvailable(alloca(Ty:K, preAlloca(T2:K, V:SymbolicValueRef),
                             Ad:Int, Align:Int, Con:Bool)) => false
    rule isAvailable(store(Ty:K, V1:KResult, T2:K, V2:KResult,
                             Align:Int)) => true
    rule isAvailable(store(Ty:K, V1:SymbolicValueRef, T2:K, V2:KResult,
                             Align:Int)) => false
    rule isAvailable(store(Ty:K, V1:KResult, T2:K, V2:SymbolicValueRef,
                             Align:Int)) => false
    rule isAvailable(store(Ty:K, V1:SymbolicValueRef,
           T2:K, V2:SymbolicValueRef, Align:Int)) => false
    rule isAvailable(load(Ty:K, V1:KResult, Align:Int)) => true
    rule isAvailable(load(Ty:K, V1:SymbolicValueRef, Align:Int)) => false
    rule isAvailable(Op:KLabel(Ty:K,, V1:SymbolicValueRef,, V2:K)) => false
        requires isIntOp(Op:KLabel(Ty:K,, V1:SymbolicValueRef,, V2:K))
    rule isAvailable(Op:KLabel(Ty:K,, V1:K,, V2:SymbolicValueRef)) => false
        requires isIntOp(Op:KLabel(Ty:K,, V1,, V2))
     rule isAvailable(ret(Ty:K, V:KResult)) => true
    rule isAvailable(ret(Ty:K, V:SymbolicValueRef)) => false
     rule isAvailable(unconditional(L:K)) => true
    rule isAvailable(conditional(operand(T:K, V:KResult), L1:K, L2:K)) => true
    rule isAvailable(conditional(operand(T:K,
                      V:SymbolicValueRef), L1:K, L2:K)) => false
    rule isAvailable(switch(T:K, V:KResult, L1:K, L2:K)) => true
    rule isAvailable(switch(T:K, V:SymbolicValueRef, L1:K, L2:K)) => false
    rule isAvailable(indirectbr(operand(T:K, V:KResult), Es:List)) => true
    rule isAvailable(indirectbr(operand(
                   T:K, V:SymbolicValueRef), Es:List)) => false
    rule isAvailable(landingpad(T:K, L:List)) => true
    rule isAvailable(A:K) => false [owise]

    syntax Bool ::= isFloatOp(K) [function]
    rule isFloatOp(A:K) => true
        requires getKLabel(A) ==KLabel 'theFAdd
              orBool getKLabel(A) ==KLabel 'theFSub
              orBool getKLabel(A) ==KLabel 'theFMul
              orBool getKLabel(A) ==KLabel 'theFDiv
              orBool getKLabel(A) ==KLabel 'theFRem
   rule isFloatOp(A:K) => false [owise]

    syntax Bool ::= isIntOp(K) [function]
    rule isIntOp(A:K) => true
        requires getKLabel(A) ==KLabel 'theAdd
              orBool getKLabel(A) ==KLabel 'theSub
              orBool getKLabel(A) ==KLabel 'theMul
              orBool getKLabel(A) ==KLabel 'theUDiv
              orBool getKLabel(A) ==KLabel 'theSDiv
              orBool getKLabel(A) ==KLabel 'theURem
              orBool getKLabel(A) ==KLabel 'theSRem
              orBool getKLabel(A) ==KLabel 'theShl
              orBool getKLabel(A) ==KLabel 'theLShr
              orBool getKLabel(A) ==KLabel 'theAShr
              orBool getKLabel(A) ==KLabel 'theOr
              orBool getKLabel(A) ==KLabel 'theAnd
              orBool getKLabel(A) ==KLabel 'theXor
   rule isIntOp(A:K) => false [owise]

    syntax KItem ::= toIntOp(KLabel) [function]
    rule toIntOp('theAdd) => 'add(.KList)
    rule toIntOp('theSub) => 'sub(.KList)
    rule toIntOp('theMul) => 'mul(.KList)
    rule toIntOp('theUDiv) => 'udiv(.KList)
    rule toIntOp('theSDiv) => 'sdiv(.KList)
    rule toIntOp('theURem) => 'urem(.KList)
    rule toIntOp('theSRem) => 'srem(.KList)
    rule toIntOp('theShl) => 'shl(.KList)
    rule toIntOp('theLShr) => 'lshr(.KList)
    rule toIntOp('theAShr) => 'ashr(.KList)
    rule toIntOp('theOr) => 'or(.KList)
    rule toIntOp('theAnd) => 'and(.KList)
    rule toIntOp('theXor) => 'xor(.KList)
    rule toIntOp(A:KLabel) => A(.KList) [owise]

   syntax List ::= removeInst(Int, Int, List) [function]
   rule removeInst(A:Int, B:Int, .List) => .List
   rule removeInst(A:Int, B:Int, ListItem(dynInstInfo(A:Int,
           B:Int, Is:K, T:K)) L:List) => L
   rule removeInst(Bn:Int, In:Int, ListItem(singleMem(Tid:Int,
           Bn:Int, In:Int, Ran:K, X:K)) L:List) => L
   rule removeInst(A:Int, B:Int, ListItem(X:K) L:List)
             => ListItem(X:K) (removeInst(A, B, L))
        [owise]

   //deal with either => stack/loc
   syntax KItem ::= removeEither(K, K) [function]
   rule removeEither(Ran:K, X:SymbolicValueRef) => Ran
   rule removeEither(Ran:K, loc(A:K, B:K, C:K, R:K, D:K, E:K)) => R 

   syntax Bool ::= isValidMemProType(K) [function]
   rule isValidMemProType(toRead(A:K, Od:K)) => true
   rule isValidMemProType(toWrite(A:K, Od:K)) => true
   rule isValidMemProType(toReadWrite(A:Set, Od:List)) => true
   rule isValidMemProType(_:K) => false

   //find the sequenced before var from the current block
   syntax Int ::= findPreVarBlockNum(Int, Int, K,  K, Map) [function] 
         //root-block, cur-block, var, cur-runblock, spec-tree
   rule findPreVarBlockNum(Root:Int, Cur:Int, V:K, .K, M:Map) => Root
        requires notBool Cur in keys(M) orBool Cur <=Int Root
   rule findPreVarBlockNum(Root:Int, Cur:Int, V:K, .K, (Cur |-> B:K) M:Map)
          => findPreVarBlockNum(Root, Cur, V:K, B, M)
   rule findPreVarBlockNum(Root:Int, Cur:Int,V:K,
            runBlock(Bn:Int, Name:K, none, L:List, Vars:Set, Cs:Set), M:Map) => Root
   rule findPreVarBlockNum(Root:Int, Cur:Int, V:K,
            runBlock(Bn:Int, Name:K, Fa:Int, L:List, Vars:Set, Cs:Set), M:Map) => Bn
        requires V in Vars
   rule findPreVarBlockNum(Root:Int, Cur:Int, V:K,
            runBlock(Bn:Int, Name:K, Fa:Int, L:List, Vars:Set, Cs:Set), M:Map)
              => findPreVarBlockNum(Root, Fa, V, .K, M)
        requires notBool V in Vars

   syntax List ::= updateVarInList(Int, Int, List, Map, Map, Map) [function]
   syntax KItem ::= updateVarInTerm(Int, Int, K, Map, Map, Map) [function]
                  | updateVarInGepTerm(Int, Int, K, Map, Map, Map) [function]
                  | updateVarInTermList(Int, Int, ElemList, Map, Map, Map) [function]
                  | updateVarInVar(Int, Int, K, Map, Map, Map) [function]
                  | updateVarInVarAux(Int, K, Int, Map, Map) [function]
                    //root, Var, found-block-id, regs, spec-regs

   rule updateVarInList(Cur:Int, BN:Int, .List, M:Map, RM:Map, Rev:Map) => .List
   rule updateVarInList(Cur:Int, Pre:Int, ListItem(dynInstInfo(Bn:Int,
                     In:Int, Inst:K, T:K)) L:List, M:Map, RM:Map, Rev:Map)
        => ListItem(dynInstInfo(Bn:Int, In:Int,
                updateVarInTerm(Cur, Bn, Inst:K, M, RM, Rev), T:K))
               updateVarInList(Cur, Pre, L, M, RM, Rev)
        requires Bn >=Int Pre
   rule updateVarInList(Cur:Int, Pre:Int, ListItem(dynInstInfo(Bn:Int,
                     In:Int, Inst:K, T:K)) L:List, M:Map, RM:Map, Rev:Map)
        => ListItem(dynInstInfo(Bn:Int,
                     In:Int, Inst:K, T:K))
            updateVarInList(Cur, Pre, L, M, RM, Rev)
        requires Bn <Int Pre
   rule updateVarInList(Cur:Int, Pre:Int, ListItem(singleMem(TID:Int, Bn:Int,
                     In:Int, Ran:K, OK:KLabel(X:SymbolicValueRef))) L:List, M:Map, RM:Map, Rev:Map)
        => ListItem(singleMem(TID:Int, Bn:Int, In:Int, removeEither(Ran:K,
                 updateVarInVar(Cur, Bn, X, M, RM, Rev)),
                updateVarInVar(Cur, Bn, X, M, RM, Rev)))
               updateVarInList(Cur, Pre, L, M, RM, Rev)
        requires Bn >=Int Pre andBool isValidMemProType(OK(X))
   rule updateVarInList(Cur:Int, Pre:Int, ListItem(singleMem(TID:Int, Bn:Int,
                     In:Int, Ran:K, OK:KLabel(X:K))) L:List, M:Map, RM:Map, Rev:Map)
        => ListItem(singleMem(TID:Int, Bn:Int, In:Int, Ran:K, X))
               updateVarInList(Cur, Pre, L, M, RM, Rev)
        requires isValidMemProType(OK(X)) andBool 
                  (Bn <Int Pre orBool notBool isValidMemProType(X))
   rule updateVarInList(Cur:Int, Pre:Int, ListItem(singleMem(TID:Int, Bn:Int,
                     In:Int, Ran:K, X:K)) L:List, M:Map, RM:Map, Rev:Map)
        => ListItem(singleMem(TID:Int, Bn:Int, In:Int, Ran:K, X))
               updateVarInList(Cur, Pre, L, M, RM, Rev)
        requires notBool isValidMemProType(X)

   rule updateVarInVar(Cur:Int, Cb:Int, X:SymbolicValueRef,
                             M:Map, RM:Map, Rev:Map)
            => updateVarInVarAux(Cur, X,
                  findPreVarBlockNum(Cur, Cb, X, .K, Rev), M, RM)
   rule updateVarInVarAux(Root:Int, X:K, Root':Int,
              M:Map, (X |-> V:K) RM:Map) => V
        requires Root' <=Int Root
   rule updateVarInVarAux(Root:Int, X:K, Root':Int,
              M:Map, RM:Map) => X
        requires Root' <=Int Root
            andBool notBool X in keys(RM)
   rule updateVarInVarAux(Root:Int, X:K, Cur:Int,
              (varInstance(Cur, X) |-> V) M:Map, RM:Map) => V
        requires Cur >Int Root
   rule updateVarInVarAux(Root:Int, X:K, Cur:Int, M:Map, RM:Map) => X
        requires Cur >Int Root
               andBool notBool varInstance(Cur, X) in keys(M)

   rule updateVarInTerm(Cur:Int, C:Int, name(localVar, S:String),
                M:Map, RM:Map, Rev:Map) =>
             updateVarInVar(Cur, C, name(localVar, S:String),
                M:Map, RM, Rev:Map)
   rule updateVarInTerm(Cur:Int, C:Int, X:K, M:Map, RM:Map, Rev:Map) => X
        requires notBool isLocalVariable(X)

   rule updateVarInTerm(Cur:Int, C:Int, phiResult(F:Int,
                    name(localVar, S:String)), M:Map, RM:Map, Rev:Map)
          => phiResult(F, updateVarInVar(Cur, F, name(localVar, S:String), M, RM, Rev))
   rule updateVarInTerm(Cur:Int, C:Int, phiResult(F:Int,
                    X:K), M:Map, RM:Map, Rev:Map) => phiResult(F, X)
        requires notBool isLocalVariable(X)

   rule updateVarInTerm(Cur:Int, C:Int, noAssign(In:K), M:Map, RM:Map, Rev:Map)
        => noAssign(updateVarInTerm(Cur, C, In, M, RM, Rev))
   rule updateVarInTerm(Cur:Int, C:Int, assign(X:K, Inst:K), M:Map, RM:Map, Rev:Map)
        => assign(X, updateVarInTerm(Cur, C, Inst, removeEntry(M, X), RM, Rev))
   rule updateVarInTerm(Cur:Int, C:Int, instruction(In:K,
                  Attrs:Set, Meta:K), M:Map, RM:Map, Rev:Map)
        => instruction(updateVarInTerm(Cur, C, In, M, RM, Rev), Attrs, Meta)
   rule updateVarInTerm(Cur:Int, C:Int, Op:KLabel(Ty:K,, V1:K,,
                 V2:K), M:Map, RM:Map, Rev:Map)
        => Op:KLabel(Ty,, updateVarInTerm(Cur, C, V1, M, RM, Rev),,
                      updateVarInTerm(Cur, C, V2, M, RM, Rev))
        requires isIntOp(Op:KLabel(Ty:K,, V1:K,, V2:K))
   rule updateVarInTerm(Cur:Int, C:Int, Op:KLabel(Ty:K,, V1:K,,
                 V2:K), M:Map, RM:Map, Rev:Map)
        => Op:KLabel(Ty,, updateVarInTerm(Cur, C, V1, M, RM, Rev),,
                      updateVarInTerm(Cur, C, V2, M, RM, Rev))
        requires isFloatOp(Op:KLabel(Ty:K,, V1:K,, V2:K))
   rule updateVarInTerm(Cur:Int, C:Int, fCmp(Op:K, T:K,
                        V1:K, V2:K), M:Map, RM:Map, Rev:Map)
        => fCmp(Op:K, T:K, updateVarInTerm(Cur, C, V1, M, RM, Rev),
               updateVarInTerm(Cur, C, V2, M, RM, Rev))
   rule updateVarInTerm(Cur:Int, C:Int, iCmp(Op:K, T:K,
                        V1:K, V2:K), M:Map, RM:Map, Rev:Map)
        => iCmp(Op:K, T:K, updateVarInTerm(Cur, C, V1, M, RM, Rev),
               updateVarInTerm(Cur, C, V2, M, RM, Rev))
   rule updateVarInTerm(Cur:Int, C:Int, extractValue(V:K,
                            L:List), M:Map, RM:Map, Rev:Map)
        => extractValue(updateVarInTerm(Cur, C:Int, V:K, M, RM, Rev), L)
   rule updateVarInTerm(Cur:Int, C:Int, insertValue(T1:K, V1:K, V2:K,
                            L:List), M:Map, RM:Map, Rev:Map)
        => insertValue(T1, updateVarInTerm(Cur, C:Int, V1:K, M, RM, Rev),
               updateVarInTerm(Cur, C:Int, V2:K, M, RM, Rev), L)
   rule updateVarInTerm(Cur:Int, C:Int, elemExtract(T1:K,
                            V1:K, T2:K, V2:K), M:Map, RM:Map, Rev:Map)
        => elemExtract(T1, updateVarInTerm(Cur, C:Int, V1:K, M, RM, Rev),
                   T2, updateVarInTerm(Cur, C:Int, V2:K, M, RM, Rev))
   rule updateVarInTerm(Cur:Int, C:Int, insertElem(T1:K,
                   V1:K, T2:K, V2:K, T3:K, V3:K), M:Map, RM:Map, Rev:Map)
        => insertElem(T1, updateVarInTerm(Cur, C:Int, V1:K, M, RM, Rev),
                   T2, updateVarInTerm(Cur, C:Int, V2:K, M, RM, Rev), T3,
                   updateVarInTerm(Cur, C:Int, V3:K, M, RM, Rev))
   rule updateVarInTerm(Cur:Int, C:Int, shuffleVector(T1:K,
                   V1:K, V2:K, T3:K, V3:K), M:Map, RM:Map, Rev:Map)
        => shuffleVector(T1, updateVarInTerm(Cur, C:Int, V1:K, M, RM, Rev),
                  updateVarInTerm(Cur, C:Int, V2:K, M, RM, Rev), T3,
                   updateVarInTerm(Cur, C:Int, V3:K, M, RM, Rev))
   rule updateVarInTerm(Cur:Int, C:Int, theSIToFP(T:K,
                            V:K, T':K), M:Map, RM:Map, Rev:Map)
        => theSIToFP(T, updateVarInTerm(Cur, C:Int, V:K, M, RM, Rev), T')
   rule updateVarInTerm(Cur:Int, C:Int, theUIToFP(T:K,
                            V:K, T':K), M:Map, RM:Map, Rev:Map)
        => theUIToFP(T, updateVarInTerm(Cur, C:Int, V:K, M, RM, Rev), T')
   rule updateVarInTerm(Cur:Int, C:Int, theFpToSI(T:K,
                            V:K, T':K), M:Map, RM:Map, Rev:Map)
        => theFpToSI(T, updateVarInTerm(Cur, C:Int, V:K, M, RM, Rev), T')
   rule updateVarInTerm(Cur:Int, C:Int, theFpToUI(T:K,
                            V:K, T':K), M:Map, RM:Map, Rev:Map)
        => theFpToUI(T, updateVarInTerm(Cur, C:Int, V:K, M, RM, Rev), T')
   rule updateVarInTerm(Cur:Int, C:Int, theFPExt(T:K,
                            V:K, T':K), M:Map, RM:Map, Rev:Map)
        => theFPExt(T, updateVarInTerm(Cur, C:Int, V:K, M, RM, Rev), T')
   rule updateVarInTerm(Cur:Int, C:Int, theFPTrunc(T:K,
                            V:K, T':K), M:Map, RM:Map, Rev:Map)
        => theFPTrunc(T, updateVarInTerm(Cur, C:Int, V:K, M, RM, Rev), T')
   rule updateVarInTerm(Cur:Int, C:Int, theTrunc(T:K,
                            V:K, T':K), M:Map, RM:Map, Rev:Map)
        => theTrunc(T, updateVarInTerm(Cur, C:Int, V:K, M, RM, Rev), T')
   rule updateVarInTerm(Cur:Int, C:Int, theSExt(T:K,
                            V:K, T':K), M:Map, RM:Map, Rev:Map)
        => theSExt(T, updateVarInTerm(Cur, C:Int, V:K, M, RM, Rev), T')
   rule updateVarInTerm(Cur:Int, C:Int, theZExt(T:K,
                            V:K, T':K), M:Map, RM:Map, Rev:Map)
        => theZExt(T, updateVarInTerm(Cur, C:Int, V:K, M, RM, Rev), T')
   rule updateVarInTerm(Cur:Int, C:Int, theIntToPtr(T:K,
                            V:K, T':K), M:Map, RM:Map, Rev:Map)
        => theIntToPtr(T, updateVarInTerm(Cur, C:Int, V:K, M, RM, Rev), T')
   rule updateVarInTerm(Cur:Int, C:Int, thePtrToInt(T:K,
                            V:K, T':K), M:Map, RM:Map, Rev:Map)
        => thePtrToInt(T, updateVarInTerm(Cur, C:Int, V:K, M, RM, Rev), T')
   rule updateVarInTerm(Cur:Int, C:Int, theAddrSpaceCast(T:K,
                            V:K, T':K), M:Map, RM:Map, Rev:Map)
        => theAddrSpaceCast(T, updateVarInTerm(Cur, C:Int, V:K, M, RM, Rev), T')
   rule updateVarInTerm(Cur:Int, C:Int, theBitCast(T:K,
                            V:K, T':K), M:Map, RM:Map, Rev:Map)
        => theBitCast(T, updateVarInTerm(Cur, C:Int, V:K, M, RM, Rev), T')
   rule updateVarInTerm(Cur:Int, C:Int, conditional(operand(T:K, V:K),
                            V1:K, V2:K), M:Map, RM:Map, Rev:Map)
        => conditional(operand(T:K, updateVarInTerm(Cur, C:Int, V:K, M, RM, Rev)),
               V1, V2)
   rule updateVarInTerm(Cur:Int, C:Int, indirectbr(A:K, Es:List), M:Map, RM:Map, Rev:Map)
        => indirectbr(updateVarInTerm(Cur, C:Int, A:K, M, RM, Rev), Es)
   rule updateVarInTerm(Cur:Int, C:Int, switch(T:K, V:K, L:K, Rs:List), M:Map, RM:Map, Rev:Map)
        => switch(T:K, updateVarInTerm(Cur, C:Int, V:K, M, RM, Rev), L, Rs)
   rule updateVarInTerm(Cur:Int, C:Int, select(T:K, I:K
                            operand(T1:K, V1:K), operand(T2:K, V2:K)),
                       M:Map, RM:Map, Rev:Map)
        => select(T, updateVarInTerm(Cur, C:Int, I, M, RM, Rev),
              operand(T1:K, updateVarInTerm(Cur, C:Int, V1:K, M, RM, Rev)),
              operand(T2:K, updateVarInTerm(Cur, C:Int, V2:K, M, RM, Rev)))
   rule updateVarInTerm(Cur:Int, C:Int, unconditional(V:K), M:Map, RM:Map, Rev:Map)
        => unconditional(V:K)
   rule updateVarInTerm(Cur:Int, C:Int, globalAlloca(T:K, A:K, Ad:Int, Al:K, Con:Bool),
                          M:Map, RM:Map, Rev:Map)
          => globalAlloca(T:K, updateVarInTerm(Cur, C, A, M, RM, Rev),  Ad:Int, Al:K, Con:Bool)
   rule updateVarInTerm(Cur:Int, C:Int, alloca(T:K, A:K, Ad:Int, Al:K, Con:Bool),
                          M:Map, RM:Map, Rev:Map)
          => alloca(T:K, updateVarInTerm(Cur, C, A, M, RM, Rev),  Ad:Int, Al:K, Con:Bool)
   rule updateVarInTerm(Cur:Int, C:Int, preAlloca(T:K, A:K),
                          M:Map, RM:Map, Rev:Map)
          => preAlloca(T:K, updateVarInTerm(Cur, C, A, M, RM, Rev))
   rule updateVarInTerm(Cur:Int, C:Int, tailCall(T:K, callee(V:K,
                       arguments(Es:ElemList))), M:Map, RM:Map, Rev:Map)
          => tailCall(T:K, callee(V:K,
                       arguments(updateVarInTermList(Cur, C, Es, M, RM, Rev))))
   rule updateVarInTerm(Cur:Int, C:Int, call(T:K,
               callee(V:K, arguments(Es:ElemList))), M:Map, RM:Map, Rev:Map)
          => call(T:K, callee(V:K,
                   arguments(updateVarInTermList(Cur, C, Es, M, RM, Rev))))
   rule updateVarInTerm(Cur:Int, C:Int, landingpad(T:K, L:List), M:Map, RM:Map, Rev:Map)
          => landingpad(T, L)
   rule updateVarInTerm(Cur:Int, C:Int, invoke(T:K,
               callee(V:K, arguments(Es:ElemList)), L1:K, L2:K, FL:K), M:Map, RM:Map, Rev:Map)
          => invoke(T:K, callee(V:K,
                   arguments(updateVarInTermList(Cur, C, Es, M, RM, Rev))), L1, L2, FL:K)
   rule updateVarInTerm(Cur:Int, C:Int, load(Ty:K, V:K, Al:Int), M:Map, RM:Map, Rev:Map)
        => load(Ty, updateVarInTerm(Cur, C, V, M, RM, Rev), Al)
   rule updateVarInTerm(Cur:Int, C:Int, fence(Od:K), M:Map, RM:Map, Rev:Map)
        => fence(Od)
   rule updateVarInTerm(Cur:Int, C:Int,
             getElementPtr(Ty:K, V:K, Es:ElemList), M:Map, RM:Map, Rev:Map)
        => getElementPtr(Ty, updateVarInGepTerm(Cur, C, V, M, RM, Rev),
              updateVarInTermList(Cur, C, Es, M, RM, Rev))
   rule updateVarInTerm(Cur:Int, C:Int, cmpxchg(TV1:K,
                   TV2:K, TV3:K, Or1:K, Or2:K), M:Map, RM:Map, Rev:Map)
        => cmpxchg(updateVarInTerm(Cur, C, TV1, M, RM, Rev),
                updateVarInTerm(Cur, C, TV2, M, RM, Rev),
                 updateVarInTerm(Cur, C, TV3, M, RM, Rev),Or1,Or2)
   rule updateVarInTerm(Cur:Int, C:Int, atomicrmw(B:K,TV1:K,
                   TV2:K, Or:K), M:Map, RM:Map, Rev:Map)
        => atomicrmw(B, updateVarInTerm(Cur, C, TV1, M, RM, Rev),
                updateVarInTerm(Cur, C, TV2, M, RM, Rev),Or)
   rule updateVarInTerm(Cur:Int, C:Int, store(Ty:K,
                   V:K, T1:K, V1:K, Al:Int), M:Map, RM:Map, Rev:Map)
        => store(Ty, updateVarInTerm(Cur, C, V, M, RM, Rev),
                       T1, updateVarInTerm(Cur, C, V1, M, RM, Rev), Al)
   rule updateVarInTerm(Cur:Int, C:Int, operand(Ty:K, V:K), M:Map, RM:Map, Rev:Map)
        => operand(Ty, updateVarInTerm(Cur, C, V, M, RM, Rev))
   rule updateVarInTerm(Cur:Int, C:Int, theVAArg(Ty:K, V:K, T2:K), M:Map, RM:Map, Rev:Map)
        => theVAArg(Ty, updateVarInTerm(Cur, C, V, M, RM, Rev), T2)
   rule updateVarInTerm(Cur:Int, C:Int, ret(Ty:K, V:K), M:Map, RM:Map, Rev:Map)
        => ret(Ty, updateVarInTerm(Cur, C, V, M, RM, Rev))
   rule updateVarInTerm(Cur:Int, C:Int, A:K, M, RM, Rev)
         => A [owise]

   rule updateVarInGepTerm(Cur:Int, C:Int,
               vector(Es:ElemList), M:Map, RM:Map, Rev:Map)
         => vector(updateVarInTermList(Cur, C, Es, M, RM, Rev))
   rule updateVarInGepTerm(Cur:Int, C:Int,
               X:K, M:Map, RM:Map, Rev:Map)
         => updateVarInTerm(Cur, C, X:K, M, RM, Rev) [owise]
   rule updateVarInTermList(Cur:Int, C:Int, .ElemList,
                               M:Map, RM:Map, Rev:Map) => .ElemList
   rule updateVarInTermList(Cur:Int, C:Int,
          val(arg(S:Set, T:K, X:K)),Es:ElemList, M:Map, RM:Map, Rev:Map)
        => val(arg(S:Set, T:K, updateVarInTerm(Cur, C:Int, X, M, RM, Rev))),
               (updateVarInTermList(Cur, C, Es, M:Map, RM, Rev))
   rule updateVarInTermList(Cur:Int, C:Int,
          val(operand(T:K, X:K)),Es:ElemList, M:Map, RM:Map, Rev:Map)
        => val(operand(T:K, updateVarInTerm(Cur, C:Int, X, M, RM, Rev))),
               (updateVarInTermList(Cur, C, Es, M:Map, RM, Rev))
   rule updateVarInTermList(Cur:Int, C:Int,
          val(gepOperand(A:K, T:K, X:K)),Es:ElemList, M:Map, RM:Map, Rev:Map)
        => val(gepOperand(A:K, T:K, updateVarInTerm(Cur, C:Int, X, M, RM, Rev))),
               (updateVarInTermList(Cur, C, Es, M:Map, RM, Rev))
/*
   //a new method to update map and update key with loc
   syntax Map ::= updateEnv(Map, K, K) [function]
   rule updateEnv(M:Map, loc(A:K, B:K,R:K,RT:K,BA:K, D:K), X:K)
            => M[aLoc(A, B, RT) <- X]
   rule updateEnv(M:Map, varInstance(BN:Int,
          loc(A:K, B:K,R:K,RT:K, BA:K, D:K)), X:K)
            => M[varInstance(BN, aLoc(A, B, RT)) <- X]
   rule updateEnv(M:Map, singleMem(TID:Int,Bn:Int,
       In:Int,R:K, loc(A:K, B:K,R:K,RT:K,BA:K, D:K)), X:K)
            => M[singleMem(TID:Int,Bn:Int,
       In:Int,R:K, aLoc(A:K, B:K, RT)) <- X]
   rule updateEnv(M:Map, Y:K, X:K) => M[Y <- X] [owise]
*/

   //determine if the current blockexecution need to stay
   syntax KItem ::= checkToKillBlockEx(K, K, Set, Map, Map) [function]
   rule checkToKillBlockEx(New:K, blockExecution(OldId:K, BE:List),
               S:Set, Rev:Map, RM:Map)
          => blockExecution(OldId:K, BE:List)
        requires OldId in S
   rule checkToKillBlockEx(New:Int, blockExecution(OldId:K, BE:List),
            S:Set, Rev:Map, RM:Map)
                  => findNewSpec(findNextBlock(New, .K, .K, Rev, RM))
        requires notBool OldId in S
   rule checkToKillBlockEx(New:K, blockExecution(OldId:K, BE:List),
            S:Set, Rev:Map, RM:Map) => .K [owise]

   //get all children of a root block num including the block
   syntax Set ::= getChildrenOfBlock(K, K, Map) [function]
                | getChildrenOfBlockAux(K, Set, Map) [function]
   rule getChildrenOfBlock(A:K, .K, M:Map) => SetItem(A)
        requires notBool A in keys(M)
   rule getChildrenOfBlock(A:K, .K, (A |-> B:K) M:Map)
          => getChildrenOfBlock(A, B, M)
   rule getChildrenOfBlock(A:K, runBlock(Bn:Int, Name:K,
              Fa:Int, L:List, Vars:Set, Cs:Set), M:Map)
         => getChildrenOfBlockAux(.K, Cs, M)
   rule getChildrenOfBlockAux(.K, .Set, M:Map) => .Set
   rule getChildrenOfBlockAux(.K, SetItem(A:K) S:Set, M:Map)
         => getChildrenOfBlockAux(A, S, M)
   rule getChildrenOfBlockAux(A:Int, S:Set, M:Map)
          => getChildrenOfBlock(A, S, M)
              getChildrenOfBlockAux(.K, S, M)

   //get a spec map that does not include the old root and 
    //other spec branches that are not selected (new root exlcuding).
   syntax Map ::= getNewSpecMap(Int, Set, K, K, Map) [function]
   rule getNewSpecMap(A:Int,S:Set, .K, .K, .Map) => .Map
   rule getNewSpecMap(A:Int,S:Set, .K, .K, (B:K |-> C:K) M:Map)
       => getNewSpecMap(A,S, B, C, M)
   rule getNewSpecMap(A:Int, S:Set, varInstance(B:Int, C:K), V:K, M:Map)
       => (varInstance(B:Int, C:K) |-> V) getNewSpecMap(A, S, .K, .K, M)
         requires A =/=K B andBool B in S
   rule getNewSpecMap(A:Int, S:Set, varInstance(B:Int, C:K), V:K, M:Map)
        => getNewSpecMap(A, S, .K, .K, M)
        requires A ==K B orBool notBool B in S

   syntax Map ::= getNewRootSpecMap(Int, K, K, Map) [function]
   rule getNewRootSpecMap(A:Int, .K, .K, .Map) => .Map
   rule getNewRootSpecMap(A:Int, .K, .K, (B:K |-> C:K) M:Map)
        => getNewRootSpecMap(A, B, C, M)
   rule getNewRootSpecMap(A:Int, varInstance(A:Int, C:K), V:K, M:Map)
       => (varInstance(A:Int, C:K) |-> V) getNewRootSpecMap(A, .K, .K, M)
   rule getNewRootSpecMap(A:Int, varInstance(B:Int, C:K), V:K, M:Map)
      => getNewRootSpecMap(A, .K, .K, M)
        requires A =/=K B

   syntax List ::= getNewSpecOps(Set, K, List) [function]
   rule getNewSpecOps(S:Set, .K, .List) => .List
   rule getNewSpecOps(S:Set, .K, ListItem(A:K) L:List)
       => getNewSpecOps(S, A, L)
   rule getNewSpecOps(S:Set, dynInstInfo(A:Int, B:Int, C:K, D:K), L:List)
       => ListItem(dynInstInfo(A:Int, B:Int, C:K, D:K)) getNewSpecOps(S, .K, L)
        requires A in S
   rule getNewSpecOps(S:Set, dynInstInfo(A:Int, B:Int, C:K, D:K), L:List)
       => getNewSpecOps(S, .K, L)
        requires notBool A in S

   syntax Map ::= updateMapByMap(Map, K, K, Map) [function]

   rule updateMapByMap(M:Map, .K, .K, .Map) => M
   rule updateMapByMap(M:Map, .K, .K, (A:K |-> B:K) RM:Map)
          => updateMapByMap(M, A, B, RM)
   rule updateMapByMap(M:Map, varInstance(A:Int, X:K), Y:K, RM:Map)
          => updateMapByMap(M[X <- Y], .K, .K, RM)

   syntax Bool ::= hasDefInList(List, K)  [function]
   rule hasDefInList(.List, X:K) => false
   rule hasDefInList(ListItem(dynInstInfo(Bn, In,
              assign(X, Inst), T)) L:List, X:K) => true
   rule hasDefInList(ListItem(dynInstInfo(Bn, In,
              assign(X', Inst), T)) L:List, X:K)
         => hasDefInList(L, X)
        requires X =/=K X'

   syntax Map ::= removeEntry(Map, K) [function]
   rule removeEntry(M:Map (X:K |-> Y:K),
        assign(X:K, Inst:K)) => M
   rule removeEntry(M:Map, assign(X:K, Inst:K)) => M
        requires notBool (X in keys(M))
   rule removeEntry(M:Map, A:K) => M [owise]

   syntax Bool ::= isLocalVariable(K) [function]
   rule isLocalVariable(name(localVar, X:K)) => true
   rule isLocalVariable(_:K) => false [owise]

   syntax Bool ::= isGlobalVariable(K) [function]
   rule isGlobalVariable(name(global, X:K)) => true
   rule isGlobalVariable(_:K) => false [owise]

   syntax Bool ::= isConstExprVal(K) [function]
   rule isConstExprVal(constExprVal(X:K)) => true
   rule isConstExprVal(_:K) => false [owise]

   syntax Set ::= varsToOperands(K, Set)  [function]
   rule varsToOperands(.K, .Set) => .Set
   rule varsToOperands(.K, SetItem(A:K) S:Set)
             => varsToOperands(A, S)
   rule varsToOperands(varOp(N:K, C:K, T:K, V:K), S:Set)
           => SetItem(operand(T, V)) varsToOperands(.K, S)

   syntax Bool ::= hasLasso(Set, K, Map)  [function]
                 | hasLassoAux(Set, K, Set, Map) [function]

   rule hasLasso(S:Set, blockContent(In:Map, F:Bool, Out:Set, InEd:Set,
               InDef:Set, InUse:Set, OutDef:Set, OutUse:Set, Cur:Set), M:Map)
        => hasLassoAux(S, .K, Out, M)
        requires intersectSet(S, Out) <=Set .Set
   rule hasLasso(S:Set, blockContent(In:Map, F:Bool, Out:Set, InEd:Set,
               InDef:Set, InUse:Set, OutDef:Set, OutUse:Set, Cur:Set), M:Map)
        => true
        requires notBool (intersectSet(S, Out) <=Set .Set)
   rule hasLassoAux(S:Set, .K, .Set, M:Map) => false
   rule hasLassoAux(S:Set, .K, SetItem(A:K) Out:Set, M:Map)
            => hasLassoAux(S, A, Out, M)
   rule hasLassoAux(S:Set, A:SymbolicValueRef, Out:Set, (A |-> X:K) M:Map)
          => true
        requires hasLasso(S SetItem(A), X, (A |-> X:K) M:Map)
   rule hasLassoAux(S:Set, A:SymbolicValueRef, Out:Set, (A |-> X:K) M:Map)
          => hasLassoAux(S, .K, Out, (A |-> X:K) M:Map)
        requires notBool hasLasso(S SetItem(A), X, (A |-> X:K) M:Map)

   syntax Set ::= getAllKeysFromMap(K, Map) [function]
                | getAllKeysFromMapAux(K, Set) [function]
   rule getAllKeysFromMap(.K, .Map) => .Set
   rule getAllKeysFromMap(.K, (A:K |-> B:K) M:Map)
        => SetItem(A) getAllKeysFromMap(B, M)
   rule getAllKeysFromMap(nextSpecs(S:Set), M:Map)
             => getAllKeysFromMapAux(.K, S)
                    getAllKeysFromMap(.K, M)
   rule getAllKeysFromMapAux(.K, .Set) => .Set
   rule getAllKeysFromMapAux(.K, SetItem(X:K) S:Set)
         => getAllKeysFromMapAux(X, S)
   rule getAllKeysFromMapAux(basicBlockNum(X:Int, B:K), S:Set)
          => SetItem(X) getAllKeysFromMapAux(.K, S)

   syntax KItem ::= collectNewSpecMap(K, Map, K) [function]
                  | collectNewSpecMapAux(K, Map, Map, K, K) [function]
   rule collectNewSpecMap(New:K, M:Map, .K)
         => newSpecMap(.Map, getAllKeysFromMap(.K, M))
   rule collectNewSpecMap(New:K, (A |-> V:K) M:Map, A:Int)
         => collectNewSpecMapAux(New, (A |-> V:K) M, M, .K, V)
   rule collectNewSpecMap(New:K, M:Map, A:Int)
         => newSpecMap(.Map, SetItem(A) getAllKeysFromMap(.K, M))
        requires notBool A in keys(M)


   rule collectNewSpecMapAux(New:K, OldM:Map, M:Map, .K, nextSpecs(.Set))
                  => newSpecMap(.Map, getAllKeysFromMap(.K, OldM))
   rule collectNewSpecMapAux(New:K, OldM:Map, M:Map,
          .K, nextSpecs(SetItem(A:K) R:Set))
       => collectNewSpecMapAux(New:K, OldM:Map, M:Map,
             A, nextSpecs(R:Set))
   rule collectNewSpecMapAux(New, OldM:Map, M:Map,
            basicBlockNum(N:Int, New':K), Next:K)
       => collectNewSpecMapAux(New, OldM, M, .K, Next)
        requires New =/=K New'
   rule collectNewSpecMapAux(New, OldM:Map, M:Map,
            basicBlockNum(N:Int, New:K), Next:K)
         => newSpecMap(collectTreeMap(New, M), minusSet(.K,
             getAllKeysFromMap(.K, OldM),
                SetItem(N) getAllKeysFromMap(.K, collectTreeMap(New, M))))

   syntax Map ::= collectTreeMap(K, Map) [function]
                | collectTreeMapAux(K, Set, Map) [function]
   rule collectTreeMap(A:K, (A |-> B:K) M:Map)
           => (A |-> B:K) collectTreeMapAux(.K,
                       getSet(B), (A |-> B:K) M)
   rule collectTreeMap(A:K, M:Map) => .Map
        requires notBool A in keys(M)
   rule collectTreeMapAux(.K, .Set, M:Map) => .Map
   rule collectTreeMapAux(.K, SetItem(A) S:Set, M:Map)
         => collectTreeMapAux(A, S, M)
   rule collectTreeMapAux(basicBlockNum(New:Int, N:K), S:Set, M:Map)
         => collectTreeMap(New, M) collectTreeMapAux(.K, S, M)

   syntax KItem ::= collectNewMap(Map, K, Set) [function]
   rule collectNewMap(M:Map, .K, .Set) => M
   rule collectNewMap(M:Map, .K, SetItem(A:K) S:Set)
           => collectNewMap(M, A, S)
   rule collectNewMap((A |-> C:K) M:Map, A:K, S:Set)
              => collectNewMap(M, .K, S)
   rule collectNewMap(M:Map, A:K, S:Set)
               => collectNewMap(M, .K, S)
        requires notBool A in keys(M)

   syntax Map ::= cutItemInMapAux(Map, K, K, K) [function]
                | cutItemInMap(Map, K, Set) [function]
   rule cutItemInMap(M:Map, .K, .Set) => M
   rule cutItemInMap(M:Map, .K, SetItem(A:K) S:Set)
         => cutItemInMap(M, A, S)
   rule cutItemInMap(M:Map, A:Int, S:Set)
         => cutItemInMap(cutItemInMapAux(M, .K, .K, A), .K, S)
   rule cutItemInMapAux(.Map, .K, .K, A:K) => .Map
   rule cutItemInMapAux((A:K |-> C:K) M:Map, .K, .K, B:K)
          => cutItemInMapAux(M, A, C, B)
   rule cutItemInMapAux(M:Map, A:Int, B:Int, B:Int)
             => cutItemInMapAux(M, .K, .K, B)
   rule cutItemInMapAux(M:Map, A:Int, B:Int, B':Int)
             => (A |-> B) cutItemInMapAux(M, .K, .K, B')
        requires B =/=K B'

   //check if the jumping block is already a child of the current block
   syntax Bool ::= inChoiceMap(K, K, K, Map) [function]
                 | inChoiceMapAux(K, K, Set, K, Map) [function]
   rule inChoiceMap(E:K, A:K, .K, M:Map) => false
        requires notBool A in keys(M)
   rule inChoiceMap(E:K, A:K, .K, (A |-> B:K) M:Map)
        => inChoiceMap(E:K, A, B, M)
   rule inChoiceMap(E:K, A:K, runBlock(Bn:Int, Name:K,
              Fa:Int, L:List, Vars:Set, Cs:Set), M:Map)
        => inChoiceMapAux(E:K, .K, Cs, .K, M)
   rule inChoiceMapAux(E:K, .K, .Set, .K, M:Map) => false
   rule inChoiceMapAux(E:K, .K, SetItem(A:K) S:Set,.K, M:Map)
         => inChoiceMapAux(E:K, A, S, .K, M)
   rule inChoiceMapAux(E:K, A:Int, S:Set, .K, M:Map)
         => inChoiceMapAux(E:K, .K, S,.K, M)
        requires notBool A in keys(M)
   rule inChoiceMapAux(E:K, A:Int, S:Set,.K, (A |-> B:K) M:Map)
         => inChoiceMapAux(E, A, S, B, (A |-> B:K) M)
   rule inChoiceMapAux(Name, A:Int, S:Set, runBlock(Bn:Int, Name:K,
              Fa:Int, L:List, Vars:Set, Cs:Set), M:Map) => true
   rule inChoiceMapAux(Name':K, A:Int, S:Set, runBlock(Bn:Int, Name:K,
              Fa:Int, L:List, Vars:Set, Cs:Set), M:Map)
      => inChoiceMapAux(Name', .K, S, .K, M)
         requires Name =/=K Name'

   syntax KItem ::= getBlockNum(K, K, K, Map) [function]
                | getBlockNumAux(K, K, Set, K, Map) [function]
   rule getBlockNum(E:K, A:K, .K, M:Map) => none
        requires notBool A in keys(M)
   rule getBlockNum(E:K, A:K, .K, (A |-> B:K) M:Map)
        => getBlockNum(E:K, A, B, M)
   rule getBlockNum(E:K, A:K, runBlock(Bn:Int, Name:K,
              Fa:Int, L:List, Vars:Set, Cs:Set), M:Map)
        => getBlockNumAux(E:K, .K, Cs, .K, M)
   rule getBlockNumAux(E:K, .K, .Set, .K, M:Map) => none
   rule getBlockNumAux(E:K, .K, SetItem(A:K) S:Set,.K, M:Map)
         => getBlockNumAux(E:K, A, S, .K, M)
   rule getBlockNumAux(E:K, A:Int, S:Set, .K, M:Map)
         => getBlockNumAux(E:K, .K, S,.K, M)
        requires notBool A in keys(M)
   rule getBlockNumAux(E:K, A:Int, S:Set,.K, (A |-> B:K) M:Map)
         => getBlockNumAux(E, A, S, B, (A |-> B:K) M)
   rule getBlockNumAux(Name, A:Int, S:Set, runBlock(Bn:Int, Name:K,
              Fa:Int, L:List, Vars:Set, Cs:Set), M:Map) => Bn
   rule getBlockNumAux(Name':K, A:Int, S:Set, runBlock(Bn:Int, Name:K,
              Fa:Int, L:List, Vars:Set, Cs:Set), M:Map)
      => getBlockNumAux(Name', .K, S, .K, M)
         requires Name =/=K Name'

   syntax KItem ::= mergeBackInstQueue(K) [function]
   rule mergeBackInstQueue(splitQueue(A:List, B:List, C:List))
                 => instList(A B C)
   rule mergeBackInstQueue(A:K) => A [owise]

/*
   syntax KItem ::= removeFailSpec(K, Set) [function]
   rule removeFailSpec(instList(L:List), S:Set)
          => instList(removeFailSpecAux(L, S))
   rule removeFailSpec(A:K, S:Set) => A [owise]

   syntax List ::= removeFailSpecAux(List, Set)  [function]
   rule removeFailSpecAux(.List, S:Set) => .List
   rule removeFailSpecAux(ListItem(dynInstInfo(BN:Int, IN:Int, Inst:K, T:K))
                L:List, S:Set)  => ListItem(dynInstInfo(
              BN:Int, IN:Int, Inst:K, T:K)) removeFailSpecAux(L,S)
        requires notBool BN in S
   rule removeFailSpecAux(ListItem(dynInstInfo(BN:Int, IN:Int, Inst:K, T:K))
                L:List, S:Set)  => removeFailSpecAux(L,S)
        requires BN in S

   syntax KItem ::= correctNewBlock(K, Set) [function]
   rule correctNewBlock(blockExecution(basicBlockNum(
                   Count:Int, B:K), L:List), S:Set)
         => blockExecution(basicBlockNum(Count:Int, B:K), L:List)
        requires notBool (Count in S)
   rule correctNewBlock(blockExecution(basicBlockNum(
                   Count:Int, B:K), L:List), S:Set)
         => findNewBlock
        requires (Count in S)
*/
   syntax Set ::= minusSet(K, Set, Set) [function]
   rule minusSet(.K, S:Set, .Set) => S
   rule minusSet(.K, S:Set, SetItem(A) S1:Set)
        => minusSet(A, S, S1)
   rule minusSet(A:KItem, SetItem(A) S:Set, S1:Set)
        => minusSet(.K, S, S1)
   rule minusSet(A:KItem, S:Set, S1:Set)
        => minusSet(.K, S, S1)
       requires notBool A in S

   syntax Bool ::= allHaveDef(K, K, K, Set, Map) [function]
   rule allHaveDef(A:K, .K, R:K, .Set, M:Map) => true
   rule allHaveDef(A:K, .K, R:K, SetItem(X:K) S:Set, M:Map)
          => allHaveDef(A:K, X, R, S, M)
   rule allHaveDef(A:K, X:K, .K, S:Set, (X |-> B:K) M:Map)
         => allHaveDef(A, X, B, S, (X |-> B:K) M)
   rule allHaveDef(A:K, X:K, blockContent(Is:Map, Fl:Bool,
              Out:Set, In:Set, InDef:Set,
            InUse:Set, OutDef:Set, OutUse:Set, TheUse:Set), S:Set, M:Map)
         => allHaveDef(A, .K, .K, S, M)
        requires isInDefsWithType(A, .K, OutDef)
   rule allHaveDef(A:K, X:K, blockContent(Is:Map, Fl:Bool,
              Out:Set, In:Set, InDef:Set,
            InUse:Set, OutDef:Set, OutUse:Set, TheUse:Set), S:Set, M:Map)
         => false
        requires notBool isInDefsWithType(A, .K, OutDef)

/*
    syntax KItem ::= formMemType(K, Int) [function]
                   | formMemTypeAux(K) [function]
    syntax TypeList ::= formMemTypeInList(TypeList) [function]

    rule formMemType(T:K, N:Int) => memTypeNum(formMemTypeAux(T), N)
    rule formMemTypeAux(arrayTypeValue(T:K, N:Int))
            => memTypeValue(.K, arrayTypeValue(formMemTypeAux(T), N))
    rule formMemTypeAux(vectorTypeValue(T:K, N:Int))
            => memTypeValue(.K, vectorTypeValue(formMemTypeAux(T), N))
    rule formMemTypeAux(packedStructTypeValue(Ts:K))
            => memTypeValue(.K, packedStructTypeValue(formMemTypeInList(Ts)))
    rule formMemTypeAux(structTypeValue(Ts:K))
            => memTypeValue(.K, structTypeValue(formMemTypeInList(Ts)))
    rule formMemTypeAux(T:K) => memTypeValue(.K, T)
         requires notBool isVectorType(T) andBool notBool isArrayType(T)
                andBool notBool isStructType(T)
    rule formMemTypeInList(.TypeList) => .TypeList
    rule formMemTypeInList(T:Type,Ts:TypeList)
               => formMemTypeAux(T),formMemTypeInList(Ts)
*/
    syntax KItem ::= nextMemSym(Int, Int, Int,K, K) [function]
                 //suppose base, Address space, Align, type, range
    rule nextMemSym(N:Int, Ad:Int, Al:Int, T:K,R:K) => loc(
                          N, pointerTypeValue(T, Ad),R,heap, none, none)
         requires Al ==K 0
    rule nextMemSym(N:Int, Ad:Int, Al:Int,T:K,R:K)
             => loc(N, pointerTypeValue(T, Ad),R,heap, none, none)
         requires Al =/=K 0 andBool Al dividesInt N
    rule nextMemSym(N:Int, Ad:Int, Al:Int, T:K,R:K)
           => loc((N /Int Al) *Int Al +Int Al,
                       pointerTypeValue(T, Ad),R,heap,none, none)
         requires Al =/=K 0 andBool notBool (Al dividesInt N)

    syntax KItem ::= nextStackSym(Int, Int, Int,K, K) [function]
                 //suppose base, addrspace, Align, range
    rule nextStackSym(N:Int, Ad:Int, Al:Int, T:K, R:K)
              => loc(N, pointerTypeValue(T, Ad),R,stack, none, none)
         requires Al ==K 0
    rule nextStackSym(N:Int, Ad:Int, Al:Int, T:K,R:K)
             => loc(N, pointerTypeValue(T, Ad),R,stack, none, none)
         requires Al =/=K 0 andBool Al dividesInt N
    rule nextStackSym(N:Int, Ad:Int, Al:Int, T:K,R:K)
           => loc((N /Int Al) *Int Al +Int Al,
                    pointerTypeValue(T, Ad),R,stack,none, none)
         requires Al =/=K 0 andBool notBool (Al dividesInt N)

    syntax Int ::= curBase(Int, Int) [function] //base, align
    rule curBase(N:Int, Al:Int) => N
         requires Al ==K 0
    rule curBase(N:Int, Al:Int) => N
         requires Al =/=K 0 andBool Al dividesInt N
    rule curBase(N:Int, Al:Int) => (N /Int Al) *Int Al +Int Al
         requires Al =/=K 0 andBool notBool (Al dividesInt N)

    syntax Int ::= nextBase(Int, Int, Int)  [function]
                 //suppose base, Limit, Align
    rule nextBase(N:Int, Limit:Int, Al:Int) => N +Int Limit
         requires Al ==K 0
    rule nextBase(N:Int, Limit:Int, Al:Int) => N +Int Limit
         requires Al =/=K 0 andBool Al dividesInt N
    rule nextBase(N:Int, Limit:Int, Al:Int)
           => (N /Int Al) *Int Al +Int Al +Int Limit
         requires Al =/=K 0 andBool notBool (Al dividesInt N)

    syntax Int ::= newPacking(Int, Int) [function]
                 //suppose base, Align
    rule newPacking(N:Int, Al:Int) => 0
         requires Al ==K 0
    rule newPacking(N:Int, Al:Int) => 0
         requires Al =/=K 0 andBool Al dividesInt N
    rule newPacking(N:Int, Al:Int)
           => (N /Int Al) *Int Al +Int Al -Int N
         requires Al =/=K 0 andBool notBool (Al dividesInt N)

    syntax List ::= decToBin(K, Int)  [function]
    rule decToBin(I:Int, 0) => .List 
    rule decToBin(I:Int, N:Int) => decToBin(I, N -Int 1) ListItem(0)
         requires I <=Int 0 andBool N >Int 0
    rule decToBin(I:Int, N:Int)
                 => decToBin(I /Int 2, N -Int 1) ListItem(I %Int 2)
         requires I >Int 0 andBool N >Int 0

    syntax List ::= decToBinNoLimit(K)  [function]
    rule decToBinNoLimit(I:Int) => .List 
         requires I ==Int 0
    rule decToBinNoLimit(I:Int)
                 => decToBinNoLimit(I /Int 2) ListItem(I %Int 2)
         requires I >Int 0

    syntax Bool ::= hasBadValue(List) [function]
    rule hasBadValue(.List) => false
    rule hasBadValue(ListItem(A:Int) L:List) => hasBadValue(L)
    rule hasBadValue(ListItem(A:K) L:List) => true [owise]

    syntax KItem ::= getBadValue(List) [function]
    rule getBadValue(.List) => none
    rule getBadValue(ListItem(A:Int) L:List) => getBadValue(L)
    rule getBadValue(ListItem(undef) L:List) => undef
         requires getBadValue(L) =/=K poisonVal
    rule getBadValue(ListItem(undef) L:List) => poisonVal
         requires getBadValue(L) ==K poisonVal
    rule getBadValue(ListItem(poisonVal) L:List) => poisonVal

    syntax Int ::= binToDec(List, Int)  [function]
                 | binToDecAux(List, Int) [function]
    rule binToDec(L:List, I:Int) => binToDecAux(L, I)
         requires notBool hasBadValue(L)
    rule binToDec(L:List, I:Int) => getBadValue(L)
         requires hasBadValue(L)
    rule binToDecAux(.List, N:Int) => 0
    rule binToDecAux(L:List ListItem(A:Int), N:Int)
            => A *Int (2 ^Int N) +Int binToDecAux(L, N +Int 1)

    syntax Int ::= binToDecNoLimit(List)  [function]
                 | binToDecNoLimitAux(List, Int) [function]
    rule binToDecNoLimit(L:List) => binToDecNoLimitAux(L, 0)
    rule binToDecNoLimitAux(.List, I:Int) => 0
    rule binToDecNoLimitAux(L:List ListItem(A:Int) , N:Int)
            => A *Int (2 ^Int N) +Int binToDecNoLimitAux(L, N +Int 1)

    syntax List ::= copyOfK(K, Int) [function]
    rule copyOfK(A:K, N:Int) => .List
         requires N <=Int 0
    rule copyOfK(A:K, N:Int) => ListItem(A) copyOfK(A, N -Int 1)
         requires N >Int 0

    syntax List ::= splitIntBits(K, Int, Int) [function]
                  //term, real bits, bound byte bits
    rule splitIntBits(undef, N:Int, B:Int)
             => copyOfK(undef, B)
    rule splitIntBits(poisonVal, N:Int, B:Int)
               => copyOfK(poisonVal, B)
    rule splitIntBits(zeroinitializer, N:Int, B:Int)
                => splitIntBits(0, N, B)
    rule splitIntBits(I:Int, N:Int, B:Int)
              => copyOfK(undef, numBitsPerByte)
         requires N <Int 0 orBool B <Int 0 orBool (B -Int N <Int 0)
    rule splitIntBits(I:Int, N:Int, B:Int)
              => copyOfK(undef, B -Int N) decToBin(I, N)
         requires N >=Int 0 andBool (B -Int N >Int 0)
    rule splitIntBits(I:Int, N:Int, B:Int) => decToBin(I, N)
         requires N >=Int 0 andBool (B -Int N ==Int 0)

    syntax KItem ::= countByte(List, List, Int) [function]
    rule countByte(L':List, L:List, I:Int) => countByteResult(L', L)
         requires I <=Int 0
    rule countByte(.List, L:List, I:Int)
                 => countByte(.List, ListItem(undef) L, I -Int 1)
         requires I >Int 0
    rule countByte(L:List ListItem(A:K), L1:List, I:Int)
                 => countByte(L, ListItem(A:K) L1, I -Int 1)
          requires I >Int 0

    syntax Set ::= listToSet(List) [function]
    rule listToSet(.List) => .Set
    rule listToSet(ListItem(A:K) L:List) => SetItem(A) listToSet(L)

    syntax List ::= genWriteBytes(Int, Int, Int, K, K, K, K,
                                        Int, Int, Int, Int)  [function]
          //thread, block, inst, heap/stack, type, Value, ori,
          // Base, offset count, limit, addrspace
    rule genWriteBytes(TID:Int, BN:Int, IN:Int, Ran:K,
                  Ty:K, region(.List, A:Int), V1:K, B:Int, I:Int, S:Int, Ad:Int)
            => genWriteBytes(TID, BN, IN, Ran, Ty:K, region(.List, A), V1,
                    B, I +Int 1, S:Int, Ad)
                    ListItem(singleMem(TID, BN, IN, Ran:K,
                         writeAByte(Ty:K, undef, V1, B, I, S, Ad:Int)))
         requires I <Int A
    rule genWriteBytes(TID, BN:Int, IN:Int, Ran:K, Ty:K,
                 region(ListItem(V:K) L:List, A:Int), V1:K,
               B:Int, I:Int, S:Int, Ad:Int)
            => genWriteBytes(TID, BN:Int, IN:Int, Ran:K,
                  Ty:K, region(L:List, A), V1:K, B:Int, I +Int 1, S, Ad)
                   ListItem(singleMem(TID, BN, IN, Ran:K,
                          writeAByte(Ty:K, V, V1:K, B, I, S, Ad)))
         requires I <Int A
    rule genWriteBytes(TID, BN:Int, IN:Int, Ran:K, Ty:K,
              region(L:List, A:Int), V1:K, B:Int, I:Int, S:Int, Ad:Int) => .List
         requires I >=Int A

    syntax List ::= combineList(List, List) [function]
    rule combineList(L1:List, L2:List) => L1 L2

    syntax List ::= removeMemBlock(List, Int) [function]
    rule removeMemBlock(.List, I:Int) => .List
    rule removeMemBlock(ListItem(value(A:Int, B:Int)) L:List, I:Int) => L
         requires I >=Int A andBool I <=Int B
    rule removeMemBlock(ListItem(value(A:Int, B:Int)) L:List, I:Int)
              => ListItem(value(A:Int, B:Int)) removeMemBlock(L, I)
         requires I <Int A orBool I >Int B

    syntax List ::= genReadBytes(Int, Int, Int, K, K,
                                        Int, Int, Int, Int)  [function]
          //thread, block, inst, heap/stack, type,
          // Base, offset count, size, addrspace
    rule genReadBytes(TID:Int, BN:Int, IN:Int, Ran:K,
                  Ty:K, B:Int, I:Int, S:Int, Ad:Int)
            => genReadBytes(TID, BN, IN, Ran, Ty:K, B, I +Int 1, S:Int, Ad)
                ListItem(singleMem(TID, BN, IN, Ran:K,
                      readAByte(Ty:K, B, I, S, Ad:Int)))
         requires I <Int S
    rule genReadBytes(TID, BN:Int, IN:Int, Ran:K, Ty:K,
                   B:Int, I:Int, S:Int, Ad:Int) => .List
         requires I >=Int S

    syntax KItem ::= getOrdering(K, Set) [function]
    rule getOrdering(.K, .Set) => .K
    rule getOrdering(.K, SetItem(A:K) S:Set) => getOrdering(A, S)
    rule getOrdering(O:Ordering, S:Set) => O
    rule getOrdering(A:KItem, S:Set) => getOrdering(.K, S:Set)
         requires A =/=K unordered andBool A =/=K monotonic
                  andBool A =/=K acquire andBool A =/=K release
                  andBool A =/=K acq_rel andBool A =/=K seq_cst

/*
    syntax KItem ::= getMemVar(K) [function]
    rule getMemVar(assign(X:K, In:K)) => getMemVar(In)
    rule getMemVar(noAssign(X:K)) => getMemVar(X)
    rule getMemVar(instruction(X:K, Y:Set, Z:K))
             => getMemVar(X)
    rule getMemVar(store(X:K, Y:K, T1:K, Z:K, A:Int)) => Z
    rule getMemVar(load(X:K, Y:K, A:Int)) => Y
    rule getMemVar(fence(A:K)) => fence(A)
    rule getMemVar(A:K) => .K [owise]
*/

    syntax Set ::= getDefVar(K) [function]
    rule getDefVar(assign(X:K, In:K)) => SetItem(X)
    rule getDefVar(noAssign(X:K)) => .Set

    syntax Set ::= getVarsFromVarOp(K, Set) [function]
    rule getVarsFromVarOp(.K, .Set) => .Set
    rule getVarsFromVarOp(.K, SetItem(A) S:Set)
          => getVarsFromVarOp(A, S)
    rule getVarsFromVarOp(varOp(A:K, B:K, T:K, V:K), S:Set)
           => SetItem(V) getVarsFromVarOp(.K, S)

    syntax Bool ::= isFence(K) [function]
    rule isFence(fence(A:K)) => true
    rule isFence(_) => false [owise]

    syntax Set ::= getSubTypeBase(Int, K)  [function]
                 | getSubTypeBaseArray(Int, K, Int, Int) [function]
    rule getSubTypeBase(Base:Int, integerType(N:Int)) => .Set
    rule getSubTypeBase(Base:Int, pointerTypeValue(_, _)) => .Set
    rule getSubTypeBase(Base:Int, arrayTypeValue(A:K, N:Int))
         => getSubTypeBaseArray(Base, A, 0, N)
    rule getSubTypeBaseArray(Base:Int, A:K, I:Int, N:Int)
       => SetItem(Base) getSubTypeBase(Base, A)
           getSubTypeBaseArray(Base +Int sizeof(A), A, I +Int 1, N)
         requires I <Int N
    rule getSubTypeBaseArray(Base:Int, A:K, I:Int, N:Int) => .Set
         requires I >=Int N

    syntax Map ::= getSubTypeChunck(Int, K, K)  [function]
                 | getSubTypeChunckArray(Int, K, Int, Int, K) [function]
    rule getSubTypeChunck(Base:Int, integerType(N:Int), R:K) => .Map
    rule getSubTypeChunck(Base:Int, pointerTypeValue(_, _), R:K) => .Map
    rule getSubTypeChunck(Base:Int, arrayTypeValue(A:K, N:Int), R:K)
          => getSubTypeChunckArray(Base, A, 0, N, R)
    rule getSubTypeChunckArray(Base:Int, A:K, I:Int, N:Int, R:K)
          => (Base |-> memChunck(Base, sizeof(A), 0, A, R, false, getSubTypeBase(
                       Base, A), getSubTypeChunck(Base, A, R)))
                getSubTypeChunckArray(Base +Int sizeof(A), A, I +Int 1, N, R)
         requires I <Int N
    rule getSubTypeChunckArray(Base:Int, A:K, I:Int, N:Int, R:K) => .Map
         requires I >=Int N

    syntax List ::= getTopMemList(Int, Int, Int, Int, K, K) [function]
    rule getTopMemList(Base:Int, I:Int, N:Int, Size:Int, T:K, R:K)
          => ListItem(memChunck(Base, Size, 0, T, R, false,
               SetItem(Base) getSubTypeBase(Base, T),
                getSubTypeChunck(Base, T, R)))
            getTopMemList(Base +Int Size, I +Int 1, N, Size, T, R)
         requires I <Int N
    rule getTopMemList(Base:Int, I:Int, N:Int, Size:Int, T:K, R:K) => .List
         requires I >=Int N

    //check if two bases + offsets are in the same memory range 
    syntax Bool ::= inSameMemRangeAux(Int, Int, Int, Int, K)  [function]
                    //first base, first offset, second base, second offset, range
                  | inSameMemRange(Int, Int, Int, Int, List)  [function]
    rule inSameMemRangeAux(B:Int, O:Int, B':Int, O':Int, value(X:Int, Y:Int))
           => (B +Int O) >=Int X andBool (B +Int O) <Int Y
               andBool (B' +Int O') >=Int X andBool (B' +Int O') <Int Y
    rule inSameMemRange(B:Int, O:Int, B':Int, O':Int, .List) => false
    rule inSameMemRange(B:Int, O:Int, B':Int, O':Int, ListItem(A:K) L:List)
           => inSameMemRange(B, O, B', O', L)
         requires notBool inSameMemRangeAux(B, O, B', O', A)
    rule inSameMemRange(B:Int, O:Int, B':Int, O':Int, ListItem(A:K) L:List)
           => true
         requires inSameMemRangeAux(B, O, B', O', A)

    //determine if a memory op can be executed in toCommit cell
    syntax KItem ::= getBaseAndOffset(K) [function]
                   | getTheLoc(K, K) [function]
                   | getTheLocInSize(K, K) [function]
                   | getValueInWrite(K) [function]
                   | getTypeValueInWrite(K) [function]
                   | getBaseAndSize(K) [function]
                   | getValueInTuple(K) [function]
                   | getBytesInAtomicWrite(K) [function]

    rule getBaseAndOffset(writeAByte(T:K, V:K,V1:K, Ba:Int, Ex:Int, Size:Int, Ad:Int))
            => pairResult(Ba, Size)
    rule getBaseAndOffset(atomicWrite(T:K, V:K,V1:K, Ba:Int, Ex:Int, Ad:Int, A:K))
            => pairResult(Ba, Ex)
    rule getBaseAndOffset(readAByte(T:K, Ba:Int, Ex:Int, Size:Int, Ad:Int))
            => pairResult(Ba, Size)
    rule getBaseAndOffset(atomicRead(T:K, Ba:Int, Ex:Int, Ad:Int, A:K))
            => pairResult(Ba, Ex)

    rule getBaseAndSize(writeAByte(T:K, V:K,V1:K, Ba:Int, Ex:Int, Size:Int, Ad:Int))
            => pairResult(Ba, Size)
    rule getBaseAndSize(atomicWrite(T:K, V:K,V1:K, Ba:Int, Size:Int,Ad:Int, A:K))
            => pairResult(Ba, Size)
    rule getBaseAndSize(readAByte(T:K, Ba:Int, Ex:Int, Size:Int,Ad:Int))
            => pairResult(Ba, Size)
    rule getBaseAndSize(atomicRead(T:K, Ba:Int, Size:Int,Ad:Int, A:K))
            => pairResult(Ba, Size)
    rule getBaseAndSize(atomicReadWrite(T:K, Ba:Int, Size:Int,Ad:Int, A:K, Ne:K))
            => pairResult(Ba, Size)
    rule getBaseAndSize(loc(Ba:K, pointerTypeValue(T:K, _:K),
              _:K, _:K, _:K, _:K)) => pairResult(Ba, sizeof(T))
    rule getBaseAndSize(A:K) => none [owise]

    rule getTheLoc(heap, readAByte(T:K, Ba:Int, Ex:Int, Size:Int, Ad:Int))
            => aLoc(Ba, pointerTypeValue(T, Ad), heap)
    rule getTheLoc(stack, readAByte(T:K, Ba:Int, Ex:Int, Size:Int, Ad:Int))
            => aLoc(Ba, pointerTypeValue(T, Ad), stack)
    rule getTheLoc(heap, writeAByte(T:K, V:K,V1:K, Ba:Int, Ex:Int, Size:Int, Ad:Int))
            => aLoc(Ba, pointerTypeValue(T, Ad), heap)
    rule getTheLoc(stack, writeAByte(T:K, V:K,V1:K, Ba:Int, Ex:Int, Size:Int, Ad:Int))
            => aLoc(Ba, pointerTypeValue(T, Ad), stack)
    rule getTheLoc(heap, atomicWrite(T:K, V:K,V1:K, Ba:Int, Ex:Int, Ad:Int, A:K))
            => aLoc(Ba, pointerTypeValue(T, Ad), heap)
    rule getTheLoc(stack, atomicWrite(T:K, V:K,V1:K, Ba:Int, Ex:Int, Ad:Int, A:K))
            => aLoc(Ba, pointerTypeValue(T, Ad), stack)
    rule getTheLoc(heap, readAByte(T:K, Ba:Int, Ex:Int, A:Int, Ad:Int))
            => aLoc(Ba, pointerTypeValue(T, Ad), heap)
    rule getTheLoc(stack, readAByte(T:K, Ba:Int, Ex:Int, A:Int, Ad:Int))
            =>  aLoc(Ba, pointerTypeValue(T, Ad), stack)
    rule getTheLoc(heap, atomicRead(T:K, Ba:Int, Ex:Int, Ad:Int, A:K))
            => aLoc(Ba, pointerTypeValue(T, Ad), heap)
    rule getTheLoc(stack, atomicRead(T:K, Ba:Int, Ex:Int, Ad:Int, A:K))
            =>  aLoc(Ba, pointerTypeValue(T, Ad), stack)
    rule getTheLoc(heap, atomicReadWrite(T:K, Ba:Int, Ex:Int, Ad:Int, A:K, Ne:K))
            => aLoc(Ba, pointerTypeValue(T, Ad), heap)
    rule getTheLoc(stack, atomicReadWrite(T:K, Ba:Int, Ex:Int, Ad:Int, A:K, Ne:K))
            =>  aLoc(Ba, pointerTypeValue(T, Ad), stack)

    rule getTheLocInSize(heap, readAByte(T:K, Ba:Int, Ex:Int, Size:Int, Ad:Int))
            => aLoc(Ba, Size, heap)
    rule getTheLocInSize(stack, readAByte(T:K, Ba:Int, Ex:Int, Size:Int, Ad:Int))
            => aLoc(Ba, Size, stack)
    rule getTheLocInSize(heap, writeAByte(T:K, V:K,V1:K, Ba:Int, Ex:Int, Size:Int, Ad:Int))
            => aLoc(Ba, Size, heap)
    rule getTheLocInSize(stack, writeAByte(T:K, V:K,V1:K, Ba:Int, Ex:Int, Size:Int, Ad:Int))
            => aLoc(Ba, Size, stack)
    rule getTheLocInSize(heap, atomicWrite(T:K, V:K,V1:K, Ba:Int, Ex:Int, Ad:Int, A:K))
            => aLoc(Ba, Ex, heap)
    rule getTheLocInSize(stack, atomicWrite(T:K, V:K,V1:K, Ba:Int, Ex:Int, Ad:Int, A:K))
            => aLoc(Ba, Ex, stack)
    rule getTheLocInSize(heap, readAByte(T:K, Ba:Int, Ex:Int, A:Int, Ad:Int))
            => aLoc(Ba, Ex, heap)
    rule getTheLocInSize(stack, readAByte(T:K, Ba:Int, Ex:Int, A:Int, Ad:Int))
            =>  aLoc(Ba, Ex, stack)
    rule getTheLocInSize(heap, atomicRead(T:K, Ba:Int, Ex:Int, Ad:Int, A:K))
            => aLoc(Ba, Ex, heap)
    rule getTheLocInSize(stack, atomicRead(T:K, Ba:Int, Ex:Int, Ad:Int, A:K))
            =>  aLoc(Ba, Ex, stack)
    rule getTheLocInSize(heap, atomicReadWrite(T:K, Ba:Int, Ex:Int, Ad:Int, A:K, Ne:K))
            => aLoc(Ba, Ex, heap)
    rule getTheLocInSize(stack, atomicReadWrite(T:K, Ba:Int, Ex:Int, Ad:Int, A:K, Ne:K))
            =>  aLoc(Ba, Ex, stack)
    rule getTheLocInSize(R:K, loc(Ba:K, pointerTypeValue(T:K, _:K),
              _:K, Ran:K, _:K, _:K)) => aLoc(Ba, sizeof(T), Ran)
    rule getTheLocInSize(R:K, A:K) => none [owise]

    rule getValueInWrite(writeAByte(T:K, V:K,V1:K, Ba:Int, Ex:Int, Size:Int, Ad:Int))
            => V1
    rule getValueInWrite(atomicWrite(T:K, V:K,V1:K, Ba:Int, Ex:Int, Ad:Int, A:K))
            => V1

    rule getValueInTuple(value(T:K, V:K)) => V
    rule getValueInTuple(A:K) => A [owise]

    rule getTypeValueInWrite(writeAByte(T:K, V:K,V1:K, Ba:Int, Ex:Int, Size:Int, Ad:Int))
            => value(T,V1)
    rule getTypeValueInWrite(atomicWrite(T:K, V:K,V1:K, Ba:Int, Ex:Int,Ad:Int, A:K))
            => value(T,V1)

    rule getBytesInAtomicWrite(atomicWrite(
               T:K, V:K,V1:K, Ba:Int, Ex:Int,Ad:Int, A:K)) => V
    rule getBytesInAtomicWrite(A:K) => none [owise]

    syntax Bool ::= isALoc(K) [function]
                  | isRealLoc(K) [function]

    rule isRealLoc(floatLoc(_,_,_,_,_)) => true
    rule isRealLoc(intLoc(_,_,_,_,_)) => true
    rule isRealLoc(A:K) => isALoc(A) [owise]

    rule isALoc(loc(A:K, B:K, _,_,_, _)) => true
    //rule isALoc(stackLoc(A:K, B:K,_, _)) => true
    rule isALoc(aLoc(A:K, B:K, C:K)) => true
    rule isALoc(A:K) => false [owise]

    //check if an op is a write
    syntax Bool ::= getOrderInMemOp(K) [function]
    rule getOrderInMemOp(readAByte(T:K, C:Int, E:Int, F:Int, Ad:Int)) => none 
    rule getOrderInMemOp(atomicRead(T:K, C:Int, E:Int, Ad:Int, F:K)) => F
    rule getOrderInMemOp(writeAByte(T:K, A:K, B:K, C:Int, E:Int, F:Int, Ad:Int)) => none
    rule getOrderInMemOp(atomicWrite(T:K, A:K, B:K, C:Int, E:Int,Ad:Int,  F:K)) => F
    rule getOrderInMemOp(atomicReadWrite(T:K, C:Int, E:Int, Ad:Int, F:K, Ne:K)) => F
    rule getOrderInMemOp(vaWait) => none
    rule getOrderInMemOp(toClose(_)) => none
    rule getOrderInMemOp(A:K) => badValue [owise]

    syntax Bool ::= isARead(K) [function]
    rule isARead(readAByte(T:K, C:Int, E:Int, F:Int, Ad:Int)) => true 
    rule isARead(atomicRead(T:K, C:Int, E:Int, Ad:Int, F:K)) => true
    //rule isARead(atomicReadWrite(T:K, C:Int, E:Int, Ad:Int, F:K, Ne:K)) => true
    rule isARead(A:K) => false [owise]

    syntax KItem ::= getTypeInRead(K) [function]
    rule getTypeInRead(readAByte(T:K, C:Int, E:Int, F:Int, Ad:Int)) => T
    rule getTypeInRead(atomicRead(T:K, C:Int, E:Int, Ad:Int, F:K)) => T
    rule getTypeInRead(A:K) => badType [owise]

    syntax Bool ::= isAWrite(K) [function]
    rule isAWrite(writeAByte(T:K, A:K, B:K, C:Int, E:Int, F:Int, Ad:Int)) => true 
    rule isAWrite(atomicWrite(T:K, A:K, B:K, C:Int, E:Int, Ad:Int, F:K)) => true
    rule isAWrite(A:K) => false [owise]

    syntax Bool ::= isAReadWrite(K) [function]
    rule isAReadWrite(atomicReadWrite(A:K, B:Int, C:Int, D:Int, E:K, F:K)) => true
    rule isAReadWrite(A:K) => false [owise]

    syntax Bool ::= rightHitType(List, Int, K) [function]
    syntax Bool ::= rightHitTypeMap(Map, K, Int, K) [function]
    rule rightHitType(.List, Base:Int, T:K) => false
    rule rightHitType(ListItem(memChunck(Base:Int, X:Int, Y:Int, T:K,
        B:K, I:Bool, Bs:Set, Ne:Map)) L:List, Base:Int, T:K) => true
    rule rightHitType(ListItem(memChunck(Base:Int, X:Int, Y:Int, T:K,
        B:K, I:Bool, Bs:Set, Ne:Map)) L:List, Base':Int, T':K) => true
         requires rightHitTypeMap(Ne, .K, Base', T')
    rule rightHitType(ListItem(memChunck(Base:Int, X:Int, Y:Int, T:K,
        B:K, I:Bool, Bs:Set, Ne:Map)) L:List, Base':Int, T':K)
              => rightHitType(L, Base', T')
         requires notBool rightHitTypeMap(Ne, .K, Base', T')
             andBool Base =/=K Base' andBool T =/=K T'
    rule rightHitTypeMap(.Map, .K, Base:Int, T:K) => false
    rule rightHitTypeMap((X:K |-> Y:K) M:Map, .K, Base:Int, T:K)
           => rightHitTypeMap(M, Y, Base, T)
    rule rightHitTypeMap(M:Map, memChunck(Base:Int, X:Int, Y:Int, T:K,
        B:K, I:Bool, Bs:Set, Ne:Map), Base:Int, T:K) => true
    rule rightHitTypeMap(M:Map, memChunck(Base:Int, X:Int, Y:Int, T:K,
        B:K, I:Bool, Bs:Set, Ne:Map), Base':Int, T':K) => true
        requires Base' +Int sizeof(T') <=Int Base +Int X
                 andBool Base' >=Int Base
                 andBool rightHitTypeMap(Ne, .K, Base', T')
    rule rightHitTypeMap(M:Map, memChunck(Base:Int, X:Int, Y:Int, T:K,
        B:K, I:Bool, Bs:Set, Ne:Map), Base':Int, T':K) => false
        requires Base' +Int sizeof(T') <=Int Base +Int X
                 andBool Base' >=Int Base
                 andBool notBool rightHitTypeMap(Ne, .K, Base', T')
    rule rightHitTypeMap(M, memChunck(Base:Int, X:Int, Y:Int, T:K,
        B:K, I:Bool, Bs:Set, Ne:Map), Base':Int, T':K)
         => rightHitTypeMap(M, .K, Base', T')
        requires Base' +Int sizeof(T') >Int Base +Int X
                 orBool Base' <Int Base

    syntax Bool ::= isOverlapAux(Int, Int, K) [function]
                  | isOverlap(Int, Int, K, Set) [function]
    rule isOverlapAux(Base:Int, Last:Int, singleMem(Tid, Bn, In, Ran:K,
                        value(Base':Int, Last':Int)))
           => (Base >=Int Base' andBool Base <Int Last')
              orBool (Base <=Int Base' andBool Base' <Int Last)
    rule isOverlap(Base:Int, Last:Int, .K, .Set) => false
    rule isOverlap(Base:Int, Last:Int, .K, SetItem(A:K) S:Set) => 
           isOverlap(Base:Int, Last:Int, A, S:Set)
    rule isOverlap(Base:Int, Last:Int,
               singleMem(Tid:Int, Bn:Int, In:Int, Ran:K, X:K), S:Set) => 
           isOverlap(Base:Int, Last:Int, .K, S:Set)
         requires notBool isOverlapAux(Base, Last,
                    singleMem(Tid:Int, Bn:Int, In:Int, Ran:K, X:K))
    rule isOverlap(Base:Int, Last:Int,
               singleMem(Tid:Int, Bn:Int, In:Int, Ran:K, X:K), S:Set) => true
         requires isOverlapAux(Base, Last,
                    singleMem(Tid:Int, Bn:Int, In:Int, Ran:K, X:K))

    syntax Bool ::= hasInstance(Int, Int, Int, K, Set) [function]
    rule hasInstance(Tid:Int, Bn:Int, In:Int, .K, .Set) => false
    rule hasInstance(Tid:Int, Bn:Int, In:Int, .K, SetItem(A:K) S:Set)
           => hasInstance(Tid, Bn, In, A, S)
    rule hasInstance(Tid, Bn, In, singleMem(Tid, Bn, In, Ran:K, X:K), S:Set)
           => true
    rule hasInstance(Tid, Bn, In, singleMem(Tid', Bn', In', Ran:K, X:K), S:Set)
            => hasInstance(Tid, Bn, In, .K, S)
         requires Tid =/=K Tid' orBool Bn =/=K Bn' orBool In =/=K In'

    syntax Map ::= updateMemWithAtomic(Map, Int, K) [function]
    rule updateMemWithAtomic(M:Map, B:Int, region(.List, A:K)) => M
    rule updateMemWithAtomic(M:Map, B:Int, region(ListItem(X:K) L:List, A:K))
           => updateMemWithAtomic(M[B <- X], B +Int 1, region(L, A))

    syntax List ::= getMemWithAtomic(Map, Int, Int, Int) [function]
    rule getMemWithAtomic(M:Map, B:Int, Size:Int, Size:Int) => .List
    rule getMemWithAtomic((B +Int N |-> V:K) M:Map, B:Int, N:Int, Size:Int)
              => getMemWithAtomic(M, B, N +Int 1, Size) ListItem(V)
         requires N <Int Size
    rule getMemWithAtomic(M:Map, B:Int, N:Int, Size:Int)
              => getMemWithAtomic(M, B, N +Int 1, Size) ListItem(undef)
         requires N <Int Size andBool notBool ((B +Int N) in keys(M))

    syntax Int ::= sizeOfFunArg(ElemList) [function]
    rule sizeOfFunArg(.ElemList) => 0
    rule sizeOfFunArg(valValue(typedArg(S:Set, T:K, A:K)), E:ElemList)
             => sizeof(T) +Int sizeOfFunArg(E)

    syntax Bool ::= isExternal(Set) [function]
    rule isExternal(S:Set) => external in S orBool extern_weak in S

    syntax Bool ::= isUnnamed(Set) [function]
    rule isUnnamed(S:Set) => unnamed_addr in S orBool local_unnamed_addr in S

    syntax Bool ::= isThreadLocal(Set) [function]
    rule isThreadLocal(S:Set) => thread_local in S
           orBool thread_local( localdynamic ) in S
           orBool thread_local( initialexec ) in S
           orBool thread_local( localexec ) in S

    syntax KItem ::= getRangeFromFlagInStack(Bool) [function]
    rule getRangeFromFlagInStack(true) => constant
    rule getRangeFromFlagInStack(false) => stack

    syntax KItem ::= getRangeFromFlagInHeap(Bool) [function]
    rule getRangeFromFlagInHeap(true) => constant
    rule getRangeFromFlagInHeap(false) => heap

    //deal with unnamed map, generic
    syntax KItem ::= findVarByLocs(K, Map, K, K) [function]
    rule findVarByLocs(A:K, .Map, .K, .K) => badValue
    rule findVarByLocs(A:K, (B:K |-> C:K) M:Map, .K, .K)
           => findVarByLocs(A, M, B, C)
    rule findVarByLocs(aLoc(B:Int, T:K, R:K),
                 M, V:K, loc(B, T, Ra:K, R, BL:K, In:K))
               => mapEntry(V, loc(B, T, Ra:K, R, BL:K, In:K))
    rule findVarByLocs(aLoc(B:Int, T:K, R:K),
                 M, V:K, loc(B':Int, T':K, Ra:K, R':K, BL:K, In:K))
                => findVarByLocs(aLoc(B:Int, T:K, R:K), M, .K, .K)
         requires B =/=K B' orBool T =/=K T' orBool R =/=K R'

    syntax List ::= findItemsInMap(K, Map, K, K) [function]
    rule findItemsInMap(A:K, .Map, .K, .K) => .List
    rule findItemsInMap(A:K, (B:K |-> C:K) M:Map, .K, .K)
           => findItemsInMap(A, M, B, C)
    rule findItemsInMap(A:K, M, B:K, A:K)
                  => ListItem(B) findItemsInMap(A, M, .K, .K)
         requires A =/=K .K
    rule findItemsInMap(A:K, M, B:K, A':K) => findItemsInMap(A, M, .K, .K)
         requires A' =/=K .K andBool A =/=K A'

    //use for determining if a base + offset is valid memory/stack location
    syntax Bool ::= isInStackRange(List, Int, Int, Set) [function]
    rule isInStackRange(.List, Base:Int, Size:Int, Local:Set) => false
    rule isInStackRange(ListItem(value(Left:Int, Right:Int)) L:List,
                    Base:Int, Size:Int, Local:Set) => true
         requires Base +Int Size <=Int Right andBool Base >=Int Left
               andBool (Left in Local orBool inAlloca(Left) in Local)
    rule isInStackRange(ListItem(value(Left:Int, Right:Int)) L:List,
                    Base:Int, Size:Int, Local:Set) => false
         requires Base +Int Size <=Int Right andBool Base >=Int Left
               andBool notBool (Left in Local orBool inAlloca(Left) in Local)
    rule isInStackRange(ListItem(value(Left:Int, Right:Int)) L:List,
                    Base:Int, Size:Int, Local:Set)
                        => isInStackRange(L, Base, Size, Local)
         requires notBool (Base +Int Size <=Int Right andBool Base >=Int Left)

    syntax Bool ::= isInMemRange(List, Int, Int) [function]
    rule isInMemRange(.List, Base:Int, Size:Int) => false
    rule isInMemRange(ListItem(value(Left:Int, Right:Int)) L:List,
                    Base:Int, Size:Int) => true
         requires Base +Int Size <=Int Right andBool Base >=Int Left
    rule isInMemRange(ListItem(value(Left:Int, Right:Int)) L:List,
                    Base:Int, Size:Int) => isInMemRange(L, Base, Size)
         requires notBool (Base +Int Size <=Int Right andBool Base >=Int Left)

    //remove a race element in a race set
    syntax Set ::= removeRaceInSet(Set, K, Int, Int, Int) [function]
    rule removeRaceInSet(.Set, .K, A:Int, B:Int, C:Int) => .Set
    rule removeRaceInSet(SetItem(X:K) S:Set, .K, A:Int, B:Int, C:Int)
          => removeRaceInSet(S, X, A, B, C)
    rule removeRaceInSet(S:Set,singleMem(A:Int,
           B:Int, C:Int, Ran:K, RW:K), A:Int, B:Int, C:Int) => S
    rule removeRaceInSet(S:Set,singleMem(A':Int,
           B':Int, C':Int, Ran:K, RW:K), A:Int, B:Int, C:Int)
             => SetItem(singleMem(A':Int,
           B':Int, C':Int, Ran:K, RW:K)) removeRaceInSet(S,.K, A, B, C)
        requires A =/=K A' orBool B =/=K B' orBool C =/=K C'

    syntax List ::= removeLocalStack(Int, List) [function]
    rule removeLocalStack(Base:Int, .List) => .List
    rule removeLocalStack(Base:Int, ListItem(value(Base,
               End:Int)) L:List) => L
    rule removeLocalStack(Base:Int, ListItem(value(Base':Int,
               End:Int)) L:List) => ListItem(value(Base,
               End:Int)) removeLocalStack(Base, L)
         requires Base =/=K Base'

    syntax Bool ::= hasSameType(K, K)  [function] //type, value
    rule hasSameType(Ty:K, value(Ty:K, V:K)) => true
    rule hasSameType(Ty:K, value(Ty':K, V:K)) => false
         requires Ty =/=K Ty'

    //delete the entries having no var as the first element
    syntax Map ::= deleteNonTargetMap(K, K, K, Map) [function]
    rule deleteNonTargetMap(X:K, .K, .K, .Map) => .Map
    rule deleteNonTargetMap(X:K, .K, .K, (A:K |-> B:K) M:Map)
           => deleteNonTargetMap(X, A, B, M)
    rule deleteNonTargetMap(X:K, varInstance(Bn:Int, X:K), B:K, M:Map)
             => (varInstance(Bn:Int, X:K) |-> B:K)
                   deleteNonTargetMap(X, .K, .K, M)
    rule deleteNonTargetMap(X:K, varInstance(Bn:Int, X':K), B:K, M:Map)
             => deleteNonTargetMap(X, .K, .K, M)
         requires X =/=K X'

    syntax Bool ::= hasValidSpecRead(K, K, K, Map, Map) [function]
    rule hasValidSpecRead(X:K, .K, .K, .Map, Rev:Map) => false
    rule hasValidSpecRead(X:K, .K, .K, (A:K |-> B:K) M:Map, Rev:Map)
          => hasValidSpecRead(X, A, B, M, Rev)
    rule hasValidSpecRead(X:K, varInstance(Bn:Int, N:K),
           B:K, M:Map, Rev:Map) => true
         requires isFather(Bn, X, Rev)
    rule hasValidSpecRead(X:K, varInstance(Bn:Int, N:K),
           B:K, M:Map, Rev:Map) => hasValidSpecRead(X, .K, .K, M, Rev)
         requires notBool isFather(Bn, X, Rev)

    syntax KItem ::= getValidSpecRead(K, K, K, Map, Map) [function]
    rule getValidSpecRead(X:K, .K, .K, .Map, Rev:Map) => badValue
    rule getValidSpecRead(X:K, .K, .K, (A:K |-> B:K) M:Map, Rev:Map)
          => getValidSpecRead(X, A, B, M, Rev)
    rule getValidSpecRead(X:K, varInstance(Bn:Int, N:K),
           B:K, M:Map, Rev:Map) => B
         requires isFather(Bn, X, Rev)
    rule getValidSpecRead(X:K, varInstance(Bn:Int, N:K),
           B:K, M:Map, Rev:Map) => getValidSpecRead(X, .K, .K, M, Rev)
         requires notBool isFather(Bn, X, Rev)

    syntax List ::= insertToOrderList(Int, K, List) [function]
    rule insertToOrderList(A:Int, B:K, .List) => ListItem(readPiece(A,B))
    rule insertToOrderList(A:Int, B:K, ListItem(
                               readPiece(A':Int, C:K)) L:List)
          => ListItem(readPiece(A, B)) L
         requires A >=Int A' 
    rule insertToOrderList(A:Int, B:K, ListItem(
                               readPiece(A':Int, C:K)) L:List)
          => ListItem(readPiece(A', C)) insertToOrderList(A, B, L)
         requires A <Int A' 

    //use for comparing casting ops
    syntax Bool ::= compareCastIntNums(K, Int, Int) [function]
    rule compareCastIntNums(trunc, N:Int, N':Int) => N >Int N'
    rule compareCastIntNums(zext, N:Int, N':Int) => N <Int N'
    rule compareCastIntNums(sext, N:Int, N':Int) => N <Int N'

    syntax Bool ::= compareCastFloatTypes(K, K, K) [function]
    rule compareCastFloatTypes(fptrunc, T1:K, T2:K)
              => mantissaOf(T1) >Int mantissaOf(T2)
    rule compareCastFloatTypes(fpext, T1:K, T2:K)
              => mantissaOf(T1) <Int mantissaOf(T2)

    syntax Bool ::= isIntCastOp(K) [function]
    rule isIntCastOp(trunc) => true
    rule isIntCastOp(zext) => true
    rule isIntCastOp(sext) => true
    rule isIntCastOp(Op:K) => false [owise]

    syntax KItem ::= normalPointer(K)  [function]
    rule normalPointer(zeroinitializer)
           => loc(nullMemoryLoc, void,
                 value(nullMemoryLoc,nullMemoryLoc),heap,none, none)
    rule normalPointer(A:K) => A [owise]

    syntax KItem ::= normalPointers(K)  [function]
    rule normalPointers(vectorValue(Es:ElemList))
           => vectorValue(normalPointers(Es))
    rule normalPointers(.ElemList) => .ElemList
    rule normalPointers(valValue(A:K),Es:ElemList)
            => valValue(normalPointer(A)), normalPointers(Es)
    rule normalPointers(A:K) => A [owise]

    //use in ptrtoint op
    syntax Bool ::= hasInRanges(K) [function]
                  | hasInRange(K) [function]
    rule hasInRange(loc(_, _, _, _,_, inrange)) => true
    //rule hasInRange(stackLoc(_, _, _, inrange)) => true
    rule hasInRange(loc(_, _, _, _,_, badRange)) => true
    //rule hasInRange(stackLoc(_, _, _, badRange)) => true
    rule hasInRange(A:K) => false [owise]
    rule hasInRanges(A:Loc) => hasInRange(A)
    rule hasInRanges(vectorValue(Es:ElemList)) => hasInRanges(Es)
    rule hasInRanges(.ElemList) => false
    rule hasInRanges(valValue(A:K), Es:ElemList)
               => hasInRange(A) orBool hasInRanges(Es)
    rule hasInRanges(A:K) => false [owise]

    syntax KItem ::= toIntLocs(K) [function]
                   | toIntLoc(K)  [function]

    rule toIntLoc(loc(A:Int, B:K,value(Left:Int, Right:Int),RT:K,BA:K, D:K))
         => intLoc(normalizingInt(integerType(numBitsPerByte
         *Int numBytesPerPointer), A), B,value(Left:Int, Right:Int),RT, BA)
         requires Right -Int Left >=Int 0
    rule toIntLoc(loc(A:Int, B:K,value(Left:Int, Right:Int),RT:K,BA:K, D:K))
         => normalizingInt(integerType(numBitsPerByte *Int numBytesPerPointer), A)
         requires Right -Int Left <Int 0
    rule toIntLoc(zeroinitializer) => 0
    rule toIntLoc(A:K) => A [owise]
    rule toIntLocs(vectorValue(Es:ElemList))
               => vectorValue(toIntLocs(Es))
    rule toIntLocs(.ElemList) => .ElemList
    rule toIntLocs(valValue(A:K), Es:ElemList)
               => valValue(toIntLoc(A)), toIntLocs(Es)
    rule toIntLocs(A:K) => toIntLoc(A) [owise]

    syntax KItem ::= reverseLocs(K, K) [function]
                   | reverseLoc(K, K)  [function]

    rule reverseLoc(intLoc(A:Int, T,
                         value(Left:Int, Right:Int),RT:K, BA:K),
           pointerTypeValue(T':K, Ad:Int))
               => loc(normalizingInt(integerType(
                     numBitsPerByte *Int numBytesPerPointer), A),
                  pointerTypeValue(T':K, Ad:Int),
                   value(Left, Right), RT, BA, none)
    rule reverseLoc(A:K,
           pointerTypeValue(T':K, Ad:Int))
               => loc(normalizingInt(integerType(
                     numBitsPerByte *Int numBytesPerPointer), A),
                  pointerTypeValue(T':K, Ad:Int),
                 value(nullMemoryLoc, nullMemoryLoc),heap, none, none)
    rule reverseLoc(A:K, T:K) => normalPointer(A) [owise]
    rule reverseLocs(vectorValue(Es:ElemList), T:K)
               => vectorValue(reverseLocs(Es, T))
    rule reverseLocs(.ElemList, T:K) => .ElemList
    rule reverseLocs(valValue(A:K), Es:ElemList, vectorTypeValue(T:K, N:Int))
               => valValue(reverseLoc(A, T)),
                                  reverseLocs(Es, vectorTypeValue(T:K, N:Int))
    rule reverseLocs(A:K, T:K) => reverseLoc(A, getInnerType(T)) [owise]

    syntax ElemList ::= getArgTypes(ElemList) [function]
    rule getArgTypes(.ElemList) => .ElemList
    rule getArgTypes(valValue(typedArg(S:Set, T:K, A:K)),Es:ElemList)
            => valValue(T),getArgTypes(Es)

    syntax Bool ::= hasMMXType(K)  [function]
                  | hasInValidMMXTypeAux(TypeList) [function]
                  | hasInValidMMXTypeInList(ElemList) [function]
                  | hasInValidMMXType(K) [function]
    rule hasMMXType(x86_mmx) => true
    rule hasMMXType(structTypeValue(Ts:TypeList)) => hasInValidMMXType(Ts)
    rule hasMMXType(packedStructTypeValue(Ts:TypeList)) => hasInValidMMXType(Ts)
    rule hasMMXType(pointerTypeValue(A:K, B:K)) => hasInValidMMXType(A)
    rule hasMMXType(arrayTypeValue(A:K, B:K)) => hasInValidMMXType(A)
    rule hasMMXType(vectorTypeValue(A:K, B:K)) => hasInValidMMXType(A)
    rule hasMMXType(functionTypeValue(A:K, B:K))
               => hasInValidMMXType(A) orBool hasInValidMMXTypeInList(B) 
    rule hasMMXType(A:K) => false [owise]

    rule hasInValidMMXTypeInList(.ElemList) => false
    rule hasInValidMMXTypeInList(valValue(T:K),Es:ElemList)
            => hasInValidMMXType(T:K) orBool hasInValidMMXTypeInList(Es)
    rule hasInValidMMXTypeAux(.TypeList) => false
    rule hasInValidMMXTypeAux(T:K, Ts:TypeList) =>
               hasInValidMMXType(T) orBool hasInValidMMXTypeAux(Ts)
    rule hasInValidMMXType(structTypeValue(Ts:TypeList)) => hasInValidMMXTypeAux(Ts)
    rule hasInValidMMXType(packedStructTypeValue(Ts:TypeList)) => hasInValidMMXTypeAux(Ts)
    rule hasInValidMMXType(pointerTypeValue(A:K, B:K)) => hasInValidMMXType(A)
    rule hasInValidMMXType(arrayTypeValue(A:K, B:K)) => hasMMXType(A)
    rule hasInValidMMXType(vectorTypeValue(A:K, B:K)) => hasMMXType(A)
    rule hasInValidMMXType(functionTypeValue(A:K, B:K)) =>
                hasInValidMMXType(A) orBool hasInValidMMXTypeInList(B)
    rule hasInValidMMXType(A:K) => false [owise]

    syntax Bool ::= hasPointerType(K) [function]
                  | hasPointerTypeAux(TypeList) [function]
    rule hasPointerType(integerType(A:Int)) => false
    rule hasPointerType(F:K) => false
         requires isFloatType(F)
    rule hasPointerType(x86_mmx) => false
    rule hasPointerType(F:K) => true
         requires isPointerType(F)
    rule hasPointerType(vectorTypeValue(A:K, I:Int))
             => hasPointerType(A)
    rule hasPointerType(arrayTypeValue(A:K, I:Int))
             => hasPointerType(A)
    rule hasPointerType(structTypeValue(Ts:TypeList))
             => hasPointerTypeAux(Ts)
    rule hasPointerType(packedStructTypeValue(Ts:TypeList))
             => hasPointerTypeAux(Ts)
    rule hasPointerTypeAux(.TypeList) => false
    rule hasPointerTypeAux(T:K, Ts:TypeList)
           => hasPointerType(T) orBool hasPointerTypeAux(Ts)

    syntax KItem ::= insertTypeToLoc(K, K) [function]
    rule insertTypeToLoc(loc(A:K, T:K, C:K,RT:K, BA:K, D:K), T2:K)
             => loc(A:K, T2, C,RT,BA:K, D)
    rule insertTypeToLoc(A:K, T2:K) => A [owise]

    syntax K ::= insertTypeToLocs(K, K) [function]
    rule insertTypeToLocs(vectorValue(Es:ElemList), T:K)
            => vectorValue(insertTypeToLocs(Es, T))
    rule insertTypeToLocs(.ElemList, A:K) => .ElemList
    rule insertTypeToLocs(valValue(A:K),Es:ElemList, T:K)
            => valValue(insertTypeToLoc(A, T)),insertTypeToLocs(Es,T)
    rule insertTypeToLocs(A:K, T:K) => insertTypeToLoc(A, T:K) [owise]

    syntax Bool ::= isValidBitCastType(K) [function]
                  | isValidBitCastTypeAux(K) [function]
    rule isValidBitCastType(integerType(A:Int)) => true
    rule isValidBitCastType(F:K) => true
         requires isFloatType(F)
    rule isValidBitCastType(x86_mmx) => true
    rule isValidBitCastType(F:K) => true
         requires isPointerType(F)
    rule isValidBitCastType(vectorTypeValue(A:K, I:Int))
             => isValidBitCastTypeAux(A)
    rule isValidBitCastType(A:K) => false [owise]

    rule isValidBitCastTypeAux(integerType(A:Int)) => true
    rule isValidBitCastTypeAux(F:K) => true
         requires isFloatType(F)
    rule isValidBitCastTypeAux(F:K) => true
         requires isPointerType(F)
    rule isValidBitCastTypeAux(A:K) => false [owise]

    //use for bitcast
    syntax List ::= splitToBits(K, K) [function]//type, value
                  | splitToBitsAux(K, List) [function]

    rule splitToBitsAux(T:K, .List) => .List
    rule splitToBitsAux(integerType(N:Int), ListItem(I:Int) L:List)
          => decToBin(normalizingInt(integerType(N:Int),I), N)
                    splitToBitsAux(integerType(N:Int), L)
    rule splitToBitsAux(integerType(N:Int), ListItem(zeroinitializer) L:List)
          => splitToBitsAux(integerType(N:Int), ListItem(0) L:List)
    rule splitToBitsAux(integerType(N:Int), ListItem(A:K) L:List)
              => copyOfK(A, N) splitToBitsAux(integerType(N:Int), L)
         requires A ==K poisonVal orBool A ==K undef

    rule splitToBits(vectorTypeValue(T:K, I:Int),
                vectorValue(Es:ElemList)) => splitToBitsAux(T, elemListToList(Es))
    rule splitToBits(integerType(N:Int), I:Int)
                       => decToBin(normalizingInt(integerType(N:Int),I), N)
    rule splitToBits(T:K, A:K) => A [owise]

    syntax KItem ::= joinBitsToVal(K, List) [function]//type, bits
    syntax List ::= joinBitsToValAux(K, K, List) [function]
                  | joinBitsToValCount(K, K, K) [function]

    rule joinBitsToValAux(integerType(N:Int), 0, L:List) => .List
    rule joinBitsToValAux(integerType(N:Int), X:Int, L:List)
          => joinBitsToValCount(integerType(N:Int), X -Int 1, countByte(L, .List, N))
         requires X >Int 0
    rule joinBitsToValCount(integerType(N:Int), X:Int,
                              countByteResult(Rest:List, Now:List))
            => joinBitsToValAux(integerType(N:Int), X, Rest) ListItem(binToDec(Now, 0))

    rule joinBitsToVal(vectorTypeValue(T:K, I:Int), L:List)
         => vectorValue(listToElemList(joinBitsToValAux(T, I, L)))
    rule joinBitsToVal(integerType(N:Int), L:List)
         => normalizingInt(integerType(N:Int), binToDec(L, 0))

    syntax Bool ::= isReadVal(K) [function]
    rule isReadVal(loadVal(_)) => true
    rule isReadVal(vaArgOp(_,_)) => true
    rule isReadVal(_) => false [owise]

    syntax Bool ::= isGlobalValue(K) [function]
    rule isGlobalValue(globalValue(_,_,_)) => true
    rule isGlobalValue(A:K) => false [owise]

    //floating piont functions
    syntax Int ::= exponentOf(K) [function]
    rule exponentOf(half) => 5
    rule exponentOf(float) => 8
    rule exponentOf(double) => 11
    rule exponentOf(ppc_fp128) => 11
    rule exponentOf(fp128) => 15
    rule exponentOf(x86_fp80) => 15

    syntax Int ::= mantissaOf(K) [function]
    rule mantissaOf(half) => 10
    rule mantissaOf(float) => 23
    rule mantissaOf(double) => 52
    rule mantissaOf(ppc_fp128) => 106
    rule mantissaOf(fp128) => 112
    rule mantissaOf(x86_fp80) => 64

    syntax Int ::= exponentSub(K) [function]
    rule exponentSub(A:K) => 2 ^Int (exponentOf(A) -Int 1) -Int 1

    syntax Int ::= lowBoundExp(K) [function]
    rule lowBoundExp(A:K) => 1 -Int exponentSub(A)

    syntax Int ::= upperBoundExp(K) [function]
    rule upperBoundExp(A:K) => (2 ^Int exponentOf(A))
                                       -Int 2 -Int exponentSub(A)

    syntax Bool ::= hasOne(List) [function]
    rule hasOne(.List) => false
    rule hasOne(ListItem(0) L:List) => hasOne(L)
    rule hasOne(ListItem(1) L:List) => true [owise]

    syntax Int ::= countLastOne(List, Int) [function]
    rule countLastOne(.List, N:Int) => N
    rule countLastOne(L:List ListItem(0), N)
                        => countLastOne(L, N +Int 1)
    rule countLastOne(L:List ListItem(1), N) => N

    syntax Int ::= bitsOfSig(K, List) [function] //type, bits
    rule bitsOfSig(T:K, List) => mantissaOf(T) -Int countLastOne(List, 0)

    syntax List ::= getLeftCountResult(K) [function]
    rule getLeftCountResult(countByteResult(L:List, A:List)) => L

    //dealing with input like 1.0 or x.yeq

    //put a list of digits to an integer.
    syntax Int ::= digitsToInt(List, Int) [function]
    rule digitsToInt(.List, N:Int) => 0
    rule digitsToInt(L:List ListItem(A:Int), N:Int)
              => (10 ^Int N) *Int A
                      +Int digitsToInt(L, N +Int 1)

    syntax KItem ::= floatToMid(Floating) [function]
                   | floatToMidAux(Int, List, String) [function]
                   | floatToMidAuxA(Int, List, List, String) [function]
                   | floatToMidAuxB(Int, List, List, Int, List, String) [function]
    rule floatToMid(F:Floating) => floatToMidAux(0, .List, substrString(
                #tokenToString(F), 0, lengthString(#tokenToString(F))))
        requires lengthString(#tokenToString(F)) >Int 0
            andBool isDecDigit(substrString(#tokenToString(F), 0, 1))
    rule floatToMid(F:Floating) => floatToMidAux(0,.List, substrString(
                #tokenToString(F), 1, lengthString(#tokenToString(F))))
        requires lengthString(#tokenToString(F)) >Int 0
            andBool substrString(#tokenToString(F), 0, 1) ==K "+"
    rule floatToMid(F:Floating) => floatToMidAux(1,.List, substrString(
                #tokenToString(F), 1, lengthString(#tokenToString(F))))
        requires lengthString(#tokenToString(F)) >Int 0
            andBool substrString(#tokenToString(F), 0, 1) ==K "-"
    rule floatToMid(F:Floating) => badValue [owise]

    rule floatToMidAux(S:Int, L:List, A:String)
             => floatToMidAux(S, L ListItem(hexCharToInt(ordChar(substrString(A,0,1)))),
                  substrString(A, 1, lengthString(A)))
         requires lengthString(A) >Int 0
              andBool isDecDigit(substrString(A,0,1))
    rule floatToMidAux(S:Int, L:List, A:String)
             => floatToMidAuxA(S, L, .List, substrString(A, 1, lengthString(A)))
         requires lengthString(A) >Int 0 andBool substrString(A,0,1) ==K "."
    rule floatToMidAux(S:Int, L:List, A:String) => badValue [owise]

    rule floatToMidAuxA(S:Int, L:List, R:List, A:String) => preFloat(S, L, R, 0)
          requires lengthString(A) ==Int 0 andBool size(R) =/=Int 0
    rule floatToMidAuxA(S:Int, L:List, .List, A:String)
             => preFloat(S, L, ListItem(0), 0)
          requires lengthString(A) ==Int 0
    rule floatToMidAuxA(S:Int, L:List, R:List, A:String)
                => floatToMidAuxA(S, L, R ListItem(hexCharToInt(
               ordChar(substrString(A,0,1)))), substrString(A, 1, lengthString(A)))
          requires lengthString(A) >Int 0
               andBool isDecDigit(substrString(A,0,1))

    rule floatToMidAuxA(S:Int, L:List, R:List, A:String)
                => floatToMidAuxB(S, L, R,  0, .List,
                             substrString(A, 2, lengthString(A)))
          requires lengthString(A) >Int 1
               andBool (substrString(A,0,1) ==K "e" orBool substrString(A,0,1) ==K "E")
               andBool substrString(A, 1, 2) ==K "+"
               andBool size(R) =/=Int 0
    rule floatToMidAuxA(S:Int, L:List, .List, A:String)
                => floatToMidAuxB(S, L, ListItem(0),  0, .List,
                             substrString(A, 2, lengthString(A)))
          requires lengthString(A) >Int 1
               andBool (substrString(A,0,1) ==K "e" orBool substrString(A,0,1) ==K "E")
               andBool substrString(A, 1, 2) ==K "+"

    rule floatToMidAuxA(S:Int, L:List, R:List, A:String)
                => floatToMidAuxB(S, L, R,  0, .List,
                             substrString(A, 1, lengthString(A)))
          requires lengthString(A) >Int 1
               andBool (substrString(A,0,1) ==K "e" orBool substrString(A,0,1) ==K "E")
               andBool isDecDigit(substrString(A, 1, 2))
               andBool size(R) =/=Int 0
    rule floatToMidAuxA(S:Int, L:List, .List, A:String)
                => floatToMidAuxB(S, L, ListItem(0),  0, .List,
                             substrString(A, 1, lengthString(A)))
          requires lengthString(A) >Int 1
               andBool (substrString(A,0,1) ==K "e" orBool substrString(A,0,1) ==K "E")
               andBool isDecDigit(substrString(A, 1, 2))
    rule floatToMidAuxA(S:Int, L:List, R:List, A:String)
                => floatToMidAuxB(S, L, R,  1, .List,
                             substrString(A, 2, lengthString(A)))
          requires lengthString(A) >Int 1
               andBool (substrString(A,0,1) ==K "e" orBool substrString(A,0,1) ==K "E")
               andBool substrString(A, 1, 2) ==K "-"
               andBool size(R) =/=Int 0
    rule floatToMidAuxA(S:Int, L:List, .List, A:String)
                => floatToMidAuxB(S, L, ListItem(0), 1, .List,
                             substrString(A, 2, lengthString(A)))
          requires lengthString(A) >Int 1
               andBool (substrString(A,0,1) ==K "e" orBool substrString(A,0,1) ==K "E")
               andBool substrString(A, 1, 2) ==K "-"
    rule floatToMidAuxA(S:Int, L:List, L':List, A:String) => badValue [owise]

    rule floatToMidAuxB(S:Int, L:List, R:List, 0, Ex:List, A:String)
           => preFloat(S, L, R, digitsToInt(Ex, 0))
         requires lengthString(A) ==Int 0
    rule floatToMidAuxB(S:Int, L:List, R:List, 1, Ex:List, A:String)
           => preFloat(S, L, R, 0 -Int digitsToInt(Ex, 0))
         requires lengthString(A) ==Int 0
    rule floatToMidAuxB(S:Int, L:List, R:List, X:Int, Ex:List, A:String)
           => floatToMidAuxB(S, L, R, X, Ex ListItem(
                  hexCharToInt(ordChar(substrString(A,0,1)))),
                 substrString(A, 1, lengthString(A)))
         requires lengthString(A) >Int 0 andBool isDecDigit(substrString(A, 0, 1))

    //move dot around on the float
    syntax KItem ::= frontCount(List, List, Int) [function]
    rule frontCount(L:List, Now:List, 0) => countByteResult(L, Now)
    rule frontCount(L:List, .List, N:Int)
            => frontCount(L ListItem(0),.List, N -Int 1)
         requires N >Int 0
    rule frontCount(L:List, ListItem(A:Int) Now:List, N:Int)
            => frontCount(L ListItem(A), Now, N -Int 1)
         requires N >Int 0

    syntax KItem ::= backCount(List, List, Int) [function]
    rule backCount(L:List, Now:List, 0) => countByteResult(L, Now)
    rule backCount(.List, L:List, N:Int)
            => backCount(.List, ListItem(0) L, N -Int 1)
         requires N >Int 0
    rule backCount(L:List ListItem(A:Int), Now:List, N:Int)
            => backCount(L, ListItem(A) Now, N -Int 1)
         requires N >Int 0

    syntax KItem ::= deleteExpInFloat(K) [function]
                   | deleteExpInFloatAuxA(Int, List, K) [function]
                   | deleteExpInFloatAuxB(Int, K, List) [function]
    rule deleteExpInFloat(preFloat(I:Int, L:List, L':List, N:Int))
          => deleteExpInFloatAuxA(I, L, frontCount(.List, L', N))
         requires N >=Int 0
    rule deleteExpInFloat(preFloat(I:Int, L:List, L':List, N:Int))
          => deleteExpInFloatAuxB(I, backCount(L, .List, 0 -Int N), L')
         requires N <Int 0

    rule deleteExpInFloatAuxA(I:Int, L:List,
             countByteResult(Left:List, Right:List)) => secFloat(I, L Left, Right)
    rule deleteExpInFloatAuxB(I:Int, countByteResult(Left:List, Right:List),
            L:List) => secFloat(I, Left, Right L)

    syntax List ::= deleteFrontZero(List) [function]
    rule deleteFrontZero(.List) => ListItem(0)
    rule deleteFrontZero(ListItem(0) L:List)
            => deleteFrontZero(L)
    rule deleteFrontZero(ListItem(A:Int) L:List) => ListItem(A) L
         requires A =/=Int 0

    syntax List ::= deleteBackZero(List) [function]
    rule deleteBackZero(.List) => ListItem(0)
    rule deleteBackZero(L:List ListItem(0))
            => deleteBackZero(L)
    rule deleteBackZero(L:List ListItem(A:Int)) => L ListItem(A) 
         requires A =/=Int 0

    syntax KItem ::= mulTwoToDigits(List, List, Int) [function]
                    //to list, finish list, reminder
    rule mulTwoToDigits(.List, L:List, I:Int) => holdDigits(I, L)

    rule mulTwoToDigits(R:List ListItem(A:Int), L:List, I:Int)
          => mulTwoToDigits(R, ListItem(A *Int 2 +Int I) L, 0)
         requires A *Int 2 +Int I <Int 10
    rule mulTwoToDigits(R:List ListItem(A:Int), L:List, I:Int)
          => mulTwoToDigits(R, ListItem(A *Int 2 +Int I -Int 10) L, 1)
         requires A *Int 2 +Int I >=Int 10

    syntax Bool ::= isZeroDigit(List) [function]
    rule isZeroDigit(ListItem(0)) => true
    rule isZeroDigit(L:List) => false [owise]

    syntax KItem ::= rightToBin(List, Int, Int, List)  [function]
                      //digits, current bin num, max bin num, bins
                   | rightToBinAux(K, Int, Int, List)  [function]
    rule rightToBin(ListItem(0), A:Int, N:Int, L:List)
             => holdDigits(A, L)
         requires size(L) =/=Int 0
    rule rightToBin(ListItem(0), A:Int, N:Int, .List)
             => holdDigits(0, ListItem(0))
    rule rightToBin(L:List, A:Int, N:Int, Re:List)
          => rightToBinAux(mulTwoToDigits(L, .List, 0), A +Int 1, N, Re)
         requires (notBool isZeroDigit(L)) andBool A <=Int N
    rule rightToBin(L:List, A:Int, N:Int, Re:List) => badValue
         requires (notBool isZeroDigit(L)) andBool A >Int N
    rule rightToBinAux(holdDigits(X:Int, L:List), A:Int, N:Int, Re:List)
              => rightToBin(deleteBackZero(L), A, N, Re ListItem(X))

    syntax Int ::= sizeOfDigits(List) [function]
    rule sizeOfDigits(.List) => 0
    rule sizeOfDigits(ListItem(0)) => 0
    rule sizeOfDigits(L:List) => size(L) [owise]

    syntax KItem ::= moveFloatLeft(List, Int) [function]
    rule moveFloatLeft(ListItem(1) R:List, I:Int)
          => holdDigits(I -Int 1, R)
    rule moveFloatLeft(ListItem(0) R:List, I:Int)
          => moveFloatLeft(R, I -Int 1)
    rule moveFloatLeft(.List, I:Int) => badValue

    syntax List ::= extendZero(List, Int, Int) [function]
    rule extendZero(L:List, N:Int, N:Int) => L
    rule extendZero(L:List, I:Int, N:Int)
        => extendZero(L ListItem(0), I +Int 1, N)
        requires I <Int N

    syntax KItem ::= toFormalFloat(K, K) [function] //type, v
                   | toFormalFloatAux(K, K) [function]//type,v
                   | toFormalFloatAuxA(K, Int, List, K) [function]
                   | toFormalFloatAuxB(K, Int, K) [function]

    rule toFormalFloat(T:K, secFloat(I:Int, Left:List, R:List))
          => toFormalFloatAux(T, secFloat(I, decToBinNoLimit(digitsToInt(
                       deleteFrontZero(Left), 0)), deleteBackZero(R)))
    rule toFormalFloatAux(T:K, secFloat(I:Int, Left:List, R:List))
             => toFormalFloatAuxA(T, I, deleteFrontZero(Left),
               rightToBin(R, 0, mantissaOf(T) -Int sizeOfDigits(Left), .List))
    rule toFormalFloatAuxA(T:K, I:Int, L:List, badValue) => badValue
    rule toFormalFloatAuxA(T:K, 0, ListItem(0), holdDigits(0, Re:List)) => posZero
    rule toFormalFloatAuxA(T:K, 1, ListItem(0), holdDigits(0, Re:List)) => negZero
    rule toFormalFloatAuxA(T:K, S:Int, ListItem(0), holdDigits(A:Int, Re:List))
              => toFormalFloatAuxB(T, S, moveFloatLeft(Re, 0))
         requires A >Int 0
    rule toFormalFloatAuxA(T:K, S:Int, ListItem(1) L:List, holdDigits(A:Int, Re:List))
              => float(S, size(L), extendZero(
                         deleteBackZero(L Re), size(deleteBackZero(L Re)), mantissaOf(T)))
         requires size(L) <=Int upperBoundExp(T)
    rule toFormalFloatAuxA(T:K, S:Int, L:List, B:K) => badValue [owise]
    rule toFormalFloatAuxB(T:K, S:Int, holdDigits(I:Int, R:List))
                 => float(S, I, extendZero(deleteBackZero(R),
                              size(deleteBackZero(R)), mantissaOf(T)))
         requires I >=Int lowBoundExp(T)
    rule toFormalFloatAuxB(T:K, S:Int, B:K) => badValue [owise]

    //dealing with input of hex
    syntax List ::= countFromLeftNoLimit(List, List, Int) [function]
    rule countFromLeftNoLimit(L:List, L':List, 0) => countByteResult(L, L')
    rule countFromLeftNoLimit(L:List, .List, N:Int)
            => countFromLeftNoLimit(L:List ListItem(0), .List, N -Int 1) 
         requires N >Int 0
    rule countFromLeftNoLimit(L:List, ListItem(A:K) L':List, N:Int)
               => countFromLeftNoLimit(L ListItem(A), L', N -Int 1)
         requires N >Int 0

    syntax List ::= countFromLeft(List, List, Int) [function]
    rule countFromLeft(L:List, L':List, 0) => countByteResult(L, L')
    rule countFromLeft(L:List, .List, N:Int) => ListItem(badValue)
         requires N >Int 0
    rule countFromLeft(L:List, ListItem(A:K) L':List, N:Int)
               => countFromLeft(L ListItem(A), L', N -Int 1)
         requires N >Int 0

    syntax List ::= countFromRight(List, List, Int) [function]
    rule countFromRight(L:List, L':List, 0) => countByteResult(L, L')
    rule countFromRight(.List, L:List, N:Int)
                 => countFromRight(.List, ListItem(0) L, N -Int 1)
         requires N >Int 0
    rule countFromRight(L:List ListItem(A:K) , L':List, N:Int)
               => countFromRight(L,  ListItem(A) L', N -Int 1)
         requires N >Int 0

    syntax KItem ::= toSmallFloat(K, K, K) [function]//or_ty, v, new_ty
    rule toSmallFloat(OT:K, float(S:Int, E:Int, L:List), T:K)
            => binToFloatSpecAux(T, float(S:Int, E:Int, L:List))
            requires E ==Int lowBoundExp(T) -Int 1
                       andBool notBool hasOne(L)
    rule toSmallFloat(OT:K, float(S:Int, E:Int, L:List), T:K)
              => float(S, E, getLeftCountResult(
                             countFromLeft(.List, L, mantissaOf(T))))
         requires E >=Int lowBoundExp(T) andBool E <=Int upperBoundExp(T)
            andBool bitsOfSig(OT, L) <=Int mantissaOf(T)
    rule toSmallFloat(OT:K, float(S:Int, E:Int, L:List), T:K)
              => badValue
         requires (E <Int lowBoundExp(T) orBool E >Int upperBoundExp(T))
            orBool bitsOfSig(OT, L) >Int mantissaOf(T)
    rule toSmallFloat(OT:K, A:K, T:K) => A [owise]

    syntax List ::= digitToBin(Int) [function]
    rule digitToBin(I:Int) => decToBin(hexCharToInt(I), 4)
         requires hexCharToInt(I) =/=K badValue
    rule digitToBin(I:Int) => ListItem(badValue) [owise]

    syntax List ::= digitsToBin(String) [function]
    rule digitsToBin(S:String) => .List
         requires lengthString(S) ==Int 0
    rule digitsToBin(S:String) => digitToBin(ordChar(substrString(S, 0, 1)))
                        digitsToBin(substrString(S, 1, lengthString(S)))
         requires lengthString(S) >Int 0

    syntax List ::= hexToBin(K, K) [function] //Type, v
    rule hexToBin(T:K, A:K) => digitsToBin(substrString(#tokenToString(A),
                                2, lengthString(#tokenToString(A))))
         requires lengthString(#tokenToString(A)) ==Int 18
               andBool substrString(#tokenToString(A), 0, 2) ==K "0x"
                andBool (T ==K float orBool T ==K double orBool T ==K half)
    rule hexToBin(x86_fp80, A:K) => digitsToBin(substrString(#tokenToString(A),
                                3, lengthString(#tokenToString(A))))
         requires lengthString(#tokenToString(A)) ==Int 23
               andBool substrString(#tokenToString(A), 0, 3) ==K "0xK"
    rule hexToBin(ppc_fp128, A:K) => digitsToBin(substrString(#tokenToString(A),
                                3, lengthString(#tokenToString(A))))
         requires lengthString(#tokenToString(A)) ==Int 35
               andBool substrString(#tokenToString(A), 0, 3) ==K "0xM"
    rule hexToBin(fp128, A:K) => digitsToBin(substrString(#tokenToString(A),
                                3, lengthString(#tokenToString(A))))
         requires lengthString(#tokenToString(A)) ==Int 35
               andBool substrString(#tokenToString(A), 0, 3) ==K "0xL"
    rule hexToBin(half, A:K) => digitsToBin(substrString(#tokenToString(A),
                                3, lengthString(#tokenToString(A))))
         requires lengthString(#tokenToString(A)) ==Int 7
               andBool substrString(#tokenToString(A), 0, 3) ==K "0xH"
    rule hexToBin(T:K, A:K) => ListItem(badValue) [owise]

    syntax KItem ::= binToFloatSpecAux(K, K) [function]
    rule binToFloatSpecAux(T:K, float(S:Int, E:Int, M:List)) => posZero
         requires lowBoundExp(T) -Int 1 ==Int E andBool notBool hasOne(M)
                      andBool S ==Int 0
    rule binToFloatSpecAux(T:K, float(S:Int, E:Int, M:List)) => negZero
         requires lowBoundExp(T) -Int 1 ==Int E andBool notBool hasOne(M)
                      andBool S ==Int 1
    rule binToFloatSpecAux(T:K, float(S:Int, E:Int, M:List)) => nan
         requires exponentSub(T) +Int 1 ==Int E andBool hasOne(M)
    rule binToFloatSpecAux(T:K, float(S:Int, E:Int, M:List)) => posInf
         requires exponentSub(T) +Int 1 ==Int E
                 andBool S ==Int 0 andBool notBool hasOne(M)
    rule binToFloatSpecAux(T:K, float(S:Int, E:Int, M:List)) => negInf
         requires exponentSub(T) +Int 1 ==Int E
                 andBool S ==Int 1 andBool notBool hasOne(M)
    rule binToFloatSpecAux(T:K, A:K) => A [owise]

    //if the list has no badValue
    syntax KItem ::= binToFloat(K, List) [function]
                   | binToFloatAux(K, Int, K) [function]
                        //type, sign, exponent/mantissa
                   | binToFloatCovert(K, Int, K) [function]
                        //type, sign, exponent/mantissa
                   | binToFloatPPC(Int, K) [function]
                   | binToFloatPPCAuxA(Int, Int, K)  [function]
                   | binToFloatPPCAuxB(Int, Int, List, K) [function]
    rule binToFloat(half, ListItem(A:Int) L:List)
           => binToFloatAux(half, A, countFromLeft(.List, L, exponentOf(half)))
         requires size(ListItem(A:Int) L:List) ==Int 16
             andBool notBool hasBadValue(L)
    rule binToFloat(half, ListItem(A:Int) L:List)
           => binToFloatCovert(half, A, countFromLeft(.List, L, exponentOf(double)))
         requires size(ListItem(A:Int) L:List) ==Int 64
                andBool notBool hasBadValue(L)
    rule binToFloat(float, ListItem(A:Int) L:List)
           => binToFloatCovert(float, A, countFromLeft(.List, L, exponentOf(double)))
         requires notBool hasBadValue(L)
    rule binToFloat(double, ListItem(A:Int) L:List)
           => binToFloatAux(double, A, countFromLeft(.List, L, exponentOf(double)))
         requires notBool hasBadValue(L)
    rule binToFloat(x86_fp80, ListItem(A:Int) L:List)
           => binToFloatAux(x86_fp80, A, countFromLeft(.List, L, exponentOf(x86_fp80)))
         requires notBool hasBadValue(L)
    rule binToFloat(fp128, ListItem(A:Int) L:List)
           => binToFloatAux(fp128, A, countFromLeft(.List, L, exponentOf(fp128)))
         requires notBool hasBadValue(L)
    rule binToFloat(ppc_fp128, ListItem(A:Int) L:List)
           => binToFloatPPC(A, countFromLeft(.List, L, exponentOf(ppc_fp128)))
         requires notBool hasBadValue(L)
    rule binToFloat(A:K, L:List) => badValue [owise]
    
    rule binToFloatPPC(A:Int, countByteResult(L:List, L':List))
            => binToFloatPPCAuxA(A, binToDecNoLimit(L) -Int exponentSub(ppc_fp128),
                              countFromLeft(.List, L', mantissaOf(ppc_fp128) /Int 2))
    rule binToFloatPPCAuxA(A:Int, E:Int, countByteResult(L:List, L':List))
          => binToFloatPPCAuxB(A, E, L, countFromLeft(.List, L, 12))
    rule binToFloatPPCAuxB(A:Int, E:Int, L:List,
                       countByteResult(Not:List, L':List))
          => binToFloatSpecAux(ppc_fp128, float(A, E, L L'))
    rule binToFloatAux(T:K, A:Int, countByteResult(L:List, L':List))
             => binToFloatSpecAux(T, float(A, 
                        binToDecNoLimit(L) -Int exponentSub(T), L'))

    rule binToFloatCovert(T:K, A:Int,
            countByteResult(L:List, L':List)) => posZero
         requires lowBoundExp(double) -Int 1 ==Int
                    binToDecNoLimit(L) -Int exponentSub(double)
                    andBool notBool hasOne(L')
                      andBool A ==Int 0
    rule binToFloatCovert(T:K, A:Int,
              countByteResult(L:List, L':List)) => negZero
         requires lowBoundExp(double) -Int 1 ==Int
                    binToDecNoLimit(L) -Int exponentSub(double)
                    andBool notBool hasOne(L')
                      andBool A ==Int 1
    rule binToFloatCovert(T:K, A:Int, countByteResult(L:List, L':List))
            => toSmallFloat(double, float(A, binToDecNoLimit(L)
                   -Int exponentSub(double), L'), T)
         requires lowBoundExp(double) -Int 1 =/=Int
                     binToDecNoLimit(L) -Int exponentSub(double)
                   orBool notBool hasOne(L')

    syntax KItem ::= formalizeFloat(K, K) [function] //ty, v
    rule formalizeFloat(T:K, V:Floating) => toFormalFloat(T, 
                                    deleteExpInFloat(floatToMid(V)))
    rule formalizeFloat(T:K, V:HexConstant) => binToFloat(T, hexToBin(T, V))
    rule formalizeFloat(T:K, zeroinitializer) => posZero
    rule formalizeFloat(T:K, V:K) => V [owise]

    syntax KItem ::= formalizeFloats(K, K) [function]
    rule formalizeFloats(vectorTypeValue(T:K, I:Int)
               ,vector(Es:ElemList))
             => vector(formalizeFloats(vectorTypeValue(T:K, I:Int), Es))
    rule formalizeFloats(T:K, .ElemList) => .ElemList
    rule formalizeFloats(vectorTypeValue(T:K, I:Int), valValue(A:K),Es:ElemList)
            => val(formalizeFloat(T, A)),
                        formalizeFloats(vectorTypeValue(T:K, I:Int), Es)

    rule formalizeFloats(vectorTypeValue(T:K, I:Int),
              val(operand(T':K, A:K)),Es:ElemList)
            => val(operand(T', formalizeFloat(T, A))),
                        formalizeFloats(vectorTypeValue(T:K, I:Int), Es)
    rule formalizeFloats(vectorTypeValue(T:K, I:Int), zeroinitializer)
               => vector(copyOfElemList(T, posZero, I))
    rule formalizeFloats(T:K, A:K) => formalizeFloat(T, A) [owise]

    syntax KItem ::= formalizeAllFloats(K, K) [function]
                   | formalizeAllFloatsAux(K, K) [function]
    rule formalizeAllFloats(vectorTypeValue(T:K, I:Int), A:K)
           => formalizeFloats(vectorTypeValue(T:K, I:Int), A:K)
    rule formalizeAllFloats(T:K, A:K) => formalizeFloat(T, A)
         requires notBool isVectorType(T)
            andBool notBool isArrayType(T)
            andBool notBool isStructType(T)
    rule formalizeAllFloats(arrayTypeValue(T:K, I:Int)
               ,array(Es:ElemList))
             => array(formalizeAllFloats(arrayTypeValue(T:K, I:Int), Es))
    rule formalizeAllFloats(arrayTypeValue(T:K, I:Int)
               ,arrayValue(Es:ElemList))
             => arrayValue(formalizeAllFloats(arrayTypeValue(T:K, I:Int), Es))
    rule formalizeAllFloats(T:K, .ElemList) => .ElemList
    rule formalizeAllFloats(arrayTypeValue(T:K, I:Int),
              val(operand(T':K, A:K)),Es:ElemList)
            => val(operand(T', formalizeAllFloats(T, A))),
                        formalizeAllFloats(arrayTypeValue(T:K, I:Int), Es)
    rule formalizeAllFloats(T:K, zeroinitializer)
            => formalizeAllFloats(T, dealWithZeroInitializer(T))
         requires isArrayType(T) orBool isStructType(T)
    rule formalizeAllFloats(structTypeValue(T:K), constantStruct(A:K))
            => constantStruct(formalizeAllFloatsAux(T, A))
    rule formalizeAllFloats(structTypeValue(T:K), constStructVal(A:K))
            => constStructVal(formalizeAllFloatsAux(T, A))
    rule formalizeAllFloats(packedStructTypeValue(T:K), packedStruct(A:K))
            => packedStruct(formalizeAllFloatsAux(T, A))
    rule formalizeAllFloats(packedStructTypeValue(T:K), packedStructVal(A:K))
            => packedStructVal(formalizeAllFloatsAux(T, A))
    rule formalizeAllFloats(T:K, A:K) => A [owise]

    rule formalizeAllFloatsAux(.TypeList, .ElemList) => .ElemList
    rule formalizeAllFloatsAux(T:K, Ts:TypeList, valValue(A:K),Es:ElemList)
             => valValue(formalizeAllFloats(T, A)), formalizeAllFloatsAux(Ts, Es)
    rule formalizeAllFloatsAux(T:K, Ts:TypeList,
                   val(operand(T':K, A:K)),Es:ElemList)
             => val(operand(T', formalizeAllFloats(T, A))), formalizeAllFloatsAux(Ts, Es)
    rule formalizeAllFloatsAux(T:K, V:K) => badValue [owise]


    syntax Bool ::= isValidFloatExpr(K) [function]
    rule isValidFloatExpr('float(_,,_,,_)) => true
    rule isValidFloatExpr(undef) => true
    rule isValidFloatExpr(poisonVal) => true
    rule isValidFloatExpr(A:ConstExpr) => true
    rule isValidFloatExpr(nan) => true
    rule isValidFloatExpr(posZero) => true
    rule isValidFloatExpr(negZero) => true
    rule isValidFloatExpr(posInf) => true
    rule isValidFloatExpr(negInf) => true
    rule isValidFloatExpr(A:K) => false

    //insert a element to a vector
    syntax KItem ::= insertElemFun(ElemList, Int, K, List) [function]
    rule insertElemFun(.ElemList, N:Int, A:K, L:List) => badValue
    rule insertElemFun(valValue(A:K),Es:ElemList, 0, B:K, L:List)
             => vectorValue(listToElemList(L ListItem(B) elemListToList(Es)))
    rule insertElemFun(valValue(A:K),Es:ElemList, N:Int, B:K, L:List)
             => insertElemFun(Es, N -Int 1, B, L ListItem(A))
         requires N >Int 0

    syntax KItem ::= getListElem(List, Int) [function]
    rule getListElem(ListItem(A:K) L:List, 0) => A
    rule getListElem(ListItem(A:K) L:List, N:Int)
          => getListElem(L, N -Int 1)
         requires N >Int 0
    rule getListElem(.List, N:Int) => badValue

    syntax KItem ::= getElemListElem(ElemList, Int) [function]
    rule getElemListElem(val(A:K), L:ElemList, 0) => A
    rule getElemListElem(valValue(A:K), L:ElemList, 0) => A
    rule getElemListElem(val(A:K), L:ElemList, N:Int)
          => getElemListElem(L, N -Int 1)
         requires N >Int 0
    rule getElemListElem(valValue(A:K), L:ElemList, N:Int)
          => getElemListElem(L, N -Int 1)
         requires N >Int 0
    rule getElemListElem(.ElemList, N:Int) => badValue

    //for dealing with shuffle op
    syntax ElemList ::= getShuffleResult(List, ElemList) [function]
    rule getShuffleResult(L:List, .ElemList) => .ElemList
    rule getShuffleResult(L:List, valValue(A:K),Es:ElemList)
             => valValue(A), getShuffleResult(L, Es)
         requires A ==K poisonVal orBool A ==K undef
    rule getShuffleResult(L:List, valValue(zeroinitializer),Es:ElemList)
             => getShuffleResult(L:List, valValue(0),Es:ElemList)
    rule getShuffleResult(L:List, valValue(A:Int),Es:ElemList)
             => valValue(getListElem(L, A)),
                 getShuffleResult(L:List, Es:ElemList)

    //a function to find the right place in an array
    //or struct to place the insert element, assume no exception
    syntax KItem ::= placeInsertValue(K, K, K, List) [function]
    rule placeInsertValue(valValue(A:K),Es:ElemList, B:K, 0, .List)
            => valValue(B),Es
    rule placeInsertValue(Es:K, B:K, .K, ListItem(N:Int) L:List)
         => placeInsertValue(Es, B, N, L)
    rule placeInsertValue(arrayValue(Es:ElemList), B:K, X:K, L:List)
         => arrayValue(placeInsertValue(Es, B, X, L))
    rule placeInsertValue(constStructVal(Es:ElemList), B:K, X:K, L:List)
         => constStructVal(placeInsertValue(Es, B, X, L))
    rule placeInsertValue(packedStructVal(Es:ElemList), B:K, X:K, L:List)
         => packedStructVal(placeInsertValue(Es, B, X, L))

    rule placeInsertValue(valValue(A:K),Es:ElemList, B:K, 0, L:List)
            => valValue(placeInsertValue(A, B, .K, L)),Es
         requires size(L) >=Int 1
    rule placeInsertValue(valValue(A:K),Es:ElemList, B:K, N:Int, L:List)
             => valValue(A), placeInsertValue(Es, B, N -Int 1, L)
         requires N >Int 0

    //checking landingpad correct
    syntax Bool ::= isLandingpadInst(K) [function]
    rule isLandingpadInst(landingpad(A:K, T:List)) => true
    rule isLandingpadInst(_:K) => false [owise]

    syntax Bool ::= isInvokeInst(K) [function]
    rule isInvokeInst(invoke(_:K, _:K, _:K, _:K, _:K)) => true
    rule isInvokeInst(_:K) => false [owise]

    syntax Bool ::= isResumeVal(K) [function]
    rule isResumeVal(resumeVal(_:K)) => true
    rule isResumeVal(_:K) => false [owise]

    syntax KItem ::= checkLandingpadAux(K, K, K, Map)  [function]
    rule checkLandingpadAux(I:K, .K,  .K, .Map) => checkLandingpad
    rule checkLandingpadAux(I:K, .K, .K, (A:K |-> B:K) M:Map)
            => checkLandingpadAux(I, A, B, M)
    rule checkLandingpadAux(I:Int, I:Int, X:K, M:Map)
          => checkLandingpadAux(I, .K, .K, M)
    rule checkLandingpadAux(I:Int, I1:Int,
              instNumInfo(TheCount:K, AK:K, phiInst), M:Map)
          => checkLandingpadAux(I, .K, .K, M)
       requires I1 <Int I
    rule checkLandingpadAux(I:Int, I1:Int,
              instNumInfo(TheCount:K, noAssign(AK:K), InLabel:K), M:Map)
          => checkLandingpadAux(I, .K, .K, M)
         requires I1 >Int I
    rule checkLandingpadAux(I:Int, I1:Int,
              instNumInfo(TheCount:K, assign(X:K, instruction(Inst:K,
                  S:Set, Me:K)), InLabel:K), M:Map)
          => checkLandingpadAux(I, .K, .K, M)
       requires I1 >Int I andBool notBool isLandingpadInst(Inst)
    /*rule checkLandingpadAux(I:Int, I1:Int, AK:K, M:Map)
          => landingpadBadState [owise]
*/
    syntax Bool ::= containLandingpads(K, Map) [function]
    rule containLandingpads(.K,.Map) => false
    rule containLandingpads(.K, (A:K |-> B:K) M:Map)
             => containLandingpads(B, M)
    rule containLandingpads(instNumInfo(TheCount:K, assign(X:K, instruction(Inst:K,
                  S:Set, Me:K)), InLabel:K), M:Map) => true
         requires isLandingpadInst(Inst)
    rule containLandingpads(instNumInfo(
                TheCount:K, AK:K, InLabel:K), M:Map)
           => containLandingpads(.K, M) [owise]

    syntax Int ::= getMaxFromSet(K, K, Set) [function]
    rule getMaxFromSet(.K, .K, .Set) => 0
    rule getMaxFromSet(.K, .K, SetItem(A:K) S:Set)
            => getMaxFromSet(A, A, S)
    rule getMaxFromSet(A:Int, .K, SetItem(B:K) S:Set)
            => getMaxFromSet(A, B, S)
    rule getMaxFromSet(A:Int, B:Int, S:Set) => getMaxFromSet(A, .K, S)
         requires A >=Int B
       rule getMaxFromSet(A:Int, B:Int, S:Set) => getMaxFromSet(B, .K, S)
         requires B >Int A

    syntax Bool ::= containLandingpadAndTyped(K, K, Map) [function]
    rule containLandingpadAndTyped(T:K, .K, .Map) => false
    rule containLandingpadAndTyped(T:K, .K, (A:K |-> B:K) M:Map)
             => containLandingpadAndTyped(T, B, M)
    rule containLandingpadAndTyped(T:K, instNumInfo(
            TheCount:K, assign(X:K, instruction(landingpad(T, L:List),
                  S:Set, Me:K)), InLabel:K), M:Map) => true
    rule containLandingpadAndTyped(T:K, instNumInfo(
            TheCount:K, assign(X:K, instruction(landingpad(T':K, L:List),
                  S:Set, Me:K)), InLabel:K), M:Map) => false
         requires T =/=K T'
    rule containLandingpadAndTyped(T:K, instNumInfo(
            TheCount:K, AX:K, InLabel:K), M:Map)
           => containLandingpadAndTyped(T, .K, M) [owise]

    //cmpxchg check, if arg1 has stronger ordering than arg2
    syntax Bool ::= strongerOrder(K, K) [function]
    rule strongerOrder(seq_cst, A:K) => true
    rule strongerOrder(acq_rel, A:K) => true
         requires A =/=K seq_cst
    rule strongerOrder(release, A:K) => true
         requires A ==K release orBool A ==K monotonic orBool A ==K unordered
    rule strongerOrder(acquire, A:K) => true
         requires A ==K acquire orBool A ==K monotonic orBool A ==K unordered
    rule strongerOrder(monotonic, A:K) => true
         requires A ==K monotonic orBool A ==K unordered
    rule strongerOrder(A:K, A:K) => false [owise]

    //atomicrmw integer ops
    syntax KItem ::= applyAtomicrmwInt(K, K, K, K) [function]//op, type, original, new
    rule applyAtomicrmwInt(xchg, T:K, X:K, V:K) => normalizingInt(T, V)
    rule applyAtomicrmwInt(nand, T:K, X:K, V:K)
       => applyInt('sub(.KList), T, applyInt('sub(.KList), T,
              0, applyInt('and(.KList),T, X, V, .Set), .Set), 1, .Set)
    rule applyAtomicrmwInt(max, T:K, X:K, V:K)
                            => applyIcmp(sgt, T, X, V)
         requires applyIcmp(sgt, T, X, V) =/=K 1
                andBool applyIcmp(sgt, T, X, V) =/=K 0
    rule applyAtomicrmwInt(max, T:K, X:K, V:K) => X
         requires applyIcmp(sgt, T, X, V) ==K 1
    rule applyAtomicrmwInt(max, T:K, X:K, V:K) => V
         requires applyIcmp(sgt, T, X, V) ==K 1
    rule applyAtomicrmwInt(umax, T:K, X:K, V:K)
                            => applyIcmp('ugtOfIcmp(.KList), T, X, V)
         requires applyIcmp('ugtOfIcmp(.KList), T, X, V) =/=K 1
                andBool applyIcmp('ugtOfIcmp(.KList), T, X, V) =/=K 0
    rule applyAtomicrmwInt(umax, T:K, X:K, V:K) => X
         requires applyIcmp('ugtOfIcmp(.KList), T, X, V) ==K 1
    rule applyAtomicrmwInt(umax, T:K, X:K, V:K) => V
         requires applyIcmp('ugtOfIcmp(.KList), T, X, V) ==K 1
    rule applyAtomicrmwInt(umin, T:K, X:K, V:K)
                            => applyIcmp('ultOfIcmp(.KList), T, X, V)
         requires applyIcmp('ultOfIcmp(.KList), T, X, V) =/=K 1
                andBool applyIcmp('ultOfIcmp(.KList), T, X, V) =/=K 0
    rule applyAtomicrmwInt(umin, T:K, X:K, V:K) => X
         requires applyIcmp('ultOfIcmp(.KList), T, X, V) ==K 1
    rule applyAtomicrmwInt(umin, T:K, X:K, V:K) => V
         requires applyIcmp('ultOfIcmp(.KList), T, X, V) ==K 1
    rule applyAtomicrmwInt(min, T:K, X:K, V:K)
                            => applyIcmp(slt, T, X, V)
         requires applyIcmp(slt, T, X, V) =/=K 1
                andBool applyIcmp(slt,T, X, V) =/=K 0
    rule applyAtomicrmwInt(min, T:K, X:K, V:K) => X
         requires applyIcmp(slt, T, X, V) ==K 1
    rule applyAtomicrmwInt(min, T:K, X:K, V:K) => V
         requires applyIcmp(slt, T, X, V) ==K 1
    rule applyAtomicrmwInt('addOfAtomicrmw(.KList), T:K, X:K, V:K)
                            => applyInt('add(.KList), T, X, V, .Set)
    rule applyAtomicrmwInt('subOfAtomicrmw(.KList), T:K, X:K, V:K)
                            => applyInt('sub(.KList), T, X, V, .Set)
    rule applyAtomicrmwInt('andOfAtomicrmw(.KList), T:K, X:K, V:K)
                            => applyInt('and(.KList), T, X, V, .Set)
    rule applyAtomicrmwInt('orOfAtomicrmw(.KList), T:K, X:K, V:K)
                            => applyInt('or(.KList), T, X, V, .Set)
    rule applyAtomicrmwInt('xorOfAtomicrmw(.KList), T:K, X:K, V:K)
                            => applyInt('xor(.KList), T, X, V, .Set)

    //get the father store op of a load op
    syntax Bool ::= withinLoc(Loc, Loc) [function]
          //first loc within the range of the second loc
    rule withinLoc(aLoc(Base:Int, pointerTypeValue(T:K, Ad:K), Ran:K),
                loc(Base2:Int, T2:K,
               value(Left2:Int, Right2:Int), Ran:K, BAddr2:K, InR2:K)) => true
         requires Base2 <=Int Right2 andBool Base >=Int Left2
            andBool Base >=Int Base2 andBool Base +Int sizeof(T) <=Int Right2
    rule withinLoc(Loc1:Loc, Loc2:Loc) => false [owise]

    syntax Bool ::= withinLocs(Loc, K, Set) [function]
    rule withinLocs(L:Loc, .K, .Set) => false
    rule withinLocs(L:Loc, .K, S:Set) => false
         requires size(S) >Int 1
    rule withinLocs(L:Loc, .K, SetItem(A:K))
          => withinLocs(L, A, .Set)
    rule withinLocs(aLoc(Base:Int, pointerTypeValue(T:K, Ad:K), Ran:K),
                loc(Base2:Int, T2:K, value(Left2:Int, Right2:Int),
               Ran:K, BAddr2:K, InR2:K), S:Set) => true
         requires Base2 <=Int Right2 andBool Base >=Int Left2
            andBool Base >=Int Base2 andBool Base +Int sizeof(T) <=Int Right2
    rule withinLocs(Loc1:Loc, Loc2:Loc, S:Set) => false [owise]

    syntax List ::= getMemList(K) [function]
    rule getMemList(runBlock(A:Int, B:K, C:K, D:List, E:Set, F:Set)) => D
    rule getMemList(A:K) => .List [owise]

    syntax List ::= getMemListAtInt(Int, List) [function]
    rule getMemListAtInt(In:Int, .List) => .List
    rule getMemListAtInt(In:Int, L:List ListItem(
             memProto(In, B:K, C:Map, D:Bool))) => L
    rule getMemListAtInt(In:Int, L:List ListItem(
             memProto(In':Int, B:K, C:Map, D:Bool)))
            => getMemListAtInt(In, L)

    //this function is useful only when the father op is an unordered
    syntax KItem ::= getFatherStore(Int, Int, Loc, Map) [function]
                   | getFatherStoreAux(Int, K, Loc, List, Map) [function]
    rule getFatherStore(Bn:Int, In:Int, Loc:Loc, (Bn |-> A:K) M:Map)
              => getFatherStoreAux(Bn, getFatherId(A), Loc,
                         getMemListAtInt(In, getMemList(A)), M)
    rule getFatherStore(Bn:Int, In:Int,Loc:Loc, M:Map) => none [owise]

    rule getFatherStoreAux(Bn:Int, none,Loc:Loc, L:List, M:Map) => none
    rule getFatherStoreAux(Bn:Int,Fa:Int, Loc:Loc,.List, M:Map) => none
         requires notBool Fa in keys(M)
    rule getFatherStoreAux(Bn:Int,Fa:Int,Loc:Loc, .List, (Fa |-> A:K) M:Map)
           => getFatherStoreAux(Fa:Int, getFatherId(A),Loc, getMemList(A), M)
    rule getFatherStoreAux(Bn:Int, Fa:Int, Loc:Loc, L:List ListItem(
              memProto(X:Int, toWrite(A:SymbolicValueRef, Or:K),
               Ops:Map, B:Bool)), M:Map) => none
    rule getFatherStoreAux(Bn:Int, Fa:Int, Loc:Loc, L:List ListItem(
              memProto(X:Int, toWrite(Loc':Loc, unordered),
               Ops:Map, B:Bool)), M:Map) => pairResult(Bn, X)
         requires withinLoc(Loc, Loc') 
    rule getFatherStoreAux(Bn:Int, Fa:Int, Loc:Loc, L:List ListItem(
              memProto(X:Int, toWrite(Loc':Loc, Or:K),
               Ops:Map, B:Bool)), M:Map) => none
         requires withinLoc(Loc, Loc') andBool Or =/=K unordered
    rule getFatherStoreAux(Bn:Int, Fa:Int, Loc:Loc, L:List ListItem(
              memProto(X:Int, toWrite(Loc':Loc, Or:K),
               Ops:Map, B:Bool)), M:Map)
         => getFatherStoreAux(Bn, Fa, Loc, L, M)
         requires notBool withinLoc(Loc, Loc')
    rule getFatherStoreAux(Bn:Int, Fa:Int, Loc:Loc, L:List ListItem(
              memProto(X:Int, toReadWrite(Loc':Set, Or:List),
               Ops:Map, B:Bool)), M:Map) => none
         requires withinLocs(Loc,.K, Loc')
    rule getFatherStoreAux(Bn:Int, Fa:Int, Loc:Loc, L:List ListItem(
              memProto(X:Int, toReadWrite(Loc':Set, Or:List),
               Ops:Map, B:Bool)), M:Map)
         => getFatherStoreAux(Bn, Fa, Loc, L, M)
         requires notBool withinLocs(Loc,.K, Loc')
    rule getFatherStoreAux(Bn:Int, Fa:Int, Loc:Loc, L:List ListItem(A:K), M:Map)
         => getFatherStoreAux(Bn, Fa, Loc, L, M) [owise]

    syntax Bool ::= hasInstanceInMemReg(K, Map) [function]
    rule hasInstanceInMemReg(pairResult(Bn:Int, In:Int),
                   (varInstance(Bn, In) |-> A:K) M:Map) => true
    rule hasInstanceInMemReg(C:K, M:Map) => false [owise]

    syntax KItem ::= getInstanceInMemReg(K, Map) [function]
    rule getInstanceInMemReg(pairResult(Bn:Int, In:Int),
                   (varInstance(Bn, In) |-> A:K) M:Map) => A
    rule getInstanceInMemReg(C:K, M:Map) => none [owise]

    //get a byte list from the middle of a region
    syntax List ::= countOnList(List, Int) [function]
    rule countOnList(L:List, 0) => .List
    rule countOnList(.List, N:Int) => .List
    rule countOnList(ListItem(A:K) L:List, N:Int)
           => ListItem(A) countOnList(L, N)
         requires N >Int 0

    syntax List ::= getBytesFromRegion(Int, Int, K) [function]
    rule getBytesFromRegion(Base:Int, Size:Int, pairResult(
             aLoc(Base:Int, T:K, Ran:K), region(L:List, S:Int)))
       => countOnList(L, Size)
    rule getBytesFromRegion(Base:Int, Size:Int, pairResult(
             aLoc(Base':Int, T:K, Ran:K), region(ListItem(B:K) L:List, S:Int)))
       => getBytesFromRegion(Base, Size, pairResult(aLoc(Base' +Int 1,
              T, Ran), region(L, S)))

    syntax KItem ::= getInstanceInCBD(Int, Int, K, K, Map) [function]
    rule getInstanceInCBD(B:Int, Size:Int, .K, .K, .Map) => none
    rule getInstanceInCBD(B:Int, Size:Int, .K, .K, (X:K |-> Y:K) M:Map)
           => getInstanceInCBD(B, Size, X, Y, M)
    rule getInstanceInCBD(B:Int, Size:Int,
            aLoc(Base:Int, pointerTypeValue(T:K, Ad:K), Ran:K), Y:K, M:Map)
        => pairResult(aLoc(Base:Int, pointerTypeValue(T:K, Ad:K), Ran:K), Y)
         requires B >=Int Base andBool B +Int Size <=Int Base +Int sizeof(T)
    rule getInstanceInCBD(B:Int, Size:Int, aLoc(Base:Int,
          pointerTypeValue(T:K, Ad:K), Ran:K), Y:K, M:Map)
                 => getInstanceInCBD(B, Size, .K, .K, M)
         requires B <Int Base orBool B +Int Size >Int Base +Int sizeof(T)

    syntax Map ::= markMemOp(Int, Int, K, Map) [function]
    syntax List ::= markMemOpAux(Int, List) [function]

    rule markMemOp(B:Int, In:Int, .K, (B |-> C:K) M:Map)
           => markMemOp(B, In, C, M)
    rule markMemOp(B:Int, In:Int, .K, M:Map) => M
         requires notBool B in keys(M)
    rule markMemOp(B:Int, In:Int, runBlock(C:Int, N:K, F:K,
           L:List, S1:Set, S2:Set), M:Map)
          => (B |-> runBlock(C:Int, N:K, F:K,
           markMemOpAux(In, L), S1:Set, S2:Set)) M
   
    rule markMemOpAux(In:Int, .List) => .List
    rule markMemOpAux(In:Int, ListItem(memProto(
                       In, A:K, B:Map, C:Bool)) L:List)
          => ListItem(memProto(In, A, B, true)) L
    rule markMemOpAux(In:Int, ListItem(
              memProto(In':Int, A:K, B:Map, C:Bool)) L:List)
          => ListItem(memProto(In', A, B, C)) markMemOpAux(In, L)

    //check if a mem op is available to be moved to the mem op cell
    syntax List ::= getAllMemProtos(Int, Int, K, Map) [function]
                  | getAllMemProtosList(Int, List) [function]
                  | getAllMemProtosListAux(List) [function]
                  | getAllMemProtosAux(Int,Int, K, Map) [function]

    rule getAllMemProtosList(Chi:Int, .List) => .List
    rule getAllMemProtosList(Chi:Int, L:List ListItem(memProto(
                       In, A:K, (Chi |-> Op:K) B:Map, true)))
          => getAllMemProtosListAux(L) ListItem(memProto(
                       In, Op, B:Map, true))
     rule getAllMemProtosList(Chi:Int, L:List ListItem(memProto(
                       In, A:K, .Map, false)))
          => getAllMemProtosListAux(L)
    rule getAllMemProtosList(Chi:Int, L:List ListItem(memProto(
                       In, A:K, B:Map, true)))
          => getAllMemProtosListAux(L) ListItem(memProto(
                       In, A:K, B:Map, true)) [owise]

    rule getAllMemProtosListAux(.List) => .List
    rule getAllMemProtosListAux(ListItem(memProto(
                       In, A:K, B:Map, true)) L:List)
           => getAllMemProtosListAux(L)
    rule getAllMemProtosListAux(ListItem(memProto(
                       In, A:K, B:Map, false)) L:List)
           => ListItem(memProto(In, A:K, B:Map, false))
                 getAllMemProtosListAux(L)

    rule getAllMemProtos(Bn:Int, In:Int, .K, M:Map) => .List
         requires notBool Bn in keys(M)
    rule getAllMemProtos(Bn:Int, In:Int, .K, (Bn |-> A:K) M:Map)
           => getAllMemProtos(Bn, In, A, M)
    rule getAllMemProtos(Bn:Int, In:Int, runBlock(C:Int, N:K, F:Int,
           L:List, S1:Set, S2:Set), M:Map)
        => getAllMemProtosAux(F, Bn, .K, M)
             getAllMemProtosListAux(getMemListAtInt(In,L))
    rule getAllMemProtos(Bn:Int, In:Int, runBlock(C:Int, N:K, none,
           L:List, S1:Set, S2:Set), M:Map)
        => getAllMemProtosListAux(getMemListAtInt(In,L))

    rule getAllMemProtosAux(Bn:Int, Chi:Int, .K, M:Map) => .List
         requires notBool Bn in keys(M)
    rule getAllMemProtosAux(Bn:Int, Chi:Int, .K, (Bn |-> A:K) M:Map)
             => getAllMemProtosAux(Bn, Chi:Int, A, M)
    rule getAllMemProtosAux(Bn:Int, Chi:Int, runBlock(C:Int, N:K, F:Int,
           L:List, S1:Set, S2:Set), M:Map)
             => getAllMemProtosAux(F,Bn, .K, M) getAllMemProtosList(Chi, L)
    rule getAllMemProtosAux(Bn:Int,Chi:Int, runBlock(C:Int, N:K, none,
           L:List, S1:Set, S2:Set), M:Map)
             => getAllMemProtosList(Chi, L)

    syntax KItem ::= getRealSeqFence(Int, Int, Int, K, Map) [function]
                   | getRightChild(K, Map, K, Map) [function]
                   | findOpInList(Int, List) [function]

    rule findOpInList(A:Int, .List) => none
    rule findOpInList(A:Int, ListItem(memProto(
                   A:Int, C:K, B:Map, Bo:Bool)) L:List) => C
    rule findOpInList(A:Int, ListItem(memProto(
                   A':Int, C:K, B:Map, Bo:Bool)) L:List)
           => findOpInList(A, L)
          requires A =/=Int A'

    rule getRealSeqFence(Cur:Int, Bn:Int, In:Int, .K, M:Map) => none
         requires notBool Bn in keys(M)
    rule getRealSeqFence(Cur:Int, Bn:Int, In:Int, .K, (Bn |-> A:K) M:Map)
           => getRealSeqFence(Cur, Bn, In, A, M)
    rule getRealSeqFence(Cur:Int, Bn:Int, In:Int, runBlock(C:Int, N:K,
               F:K, .List, S1:Set, S2:Set), M:Map) => none
    rule getRealSeqFence(Cur:Int, Bn:Int, In:Int, runBlock(C:Int, N:K,
               F:K, L:List ListItem(memProto(
                   In, A:K, B:Map, Bo:Bool)), S1:Set, S2:Set), M:Map)
          => getRightChild(Cur, B,.K, M)
         requires Bn <Int Cur
    rule getRealSeqFence(Cur:Int, Bn:Int, In:Int, runBlock(C:Int, N:K,
               F:K, L:List ListItem(memProto(
          In, A:K, .Map, Bo:Bool)), S1:Set, S2:Set), M:Map) => none
         requires Bn >=Int Cur
    rule getRealSeqFence(Cur:Int, Bn:Int, In:Int, runBlock(C:Int, N:K,
               F:K, L:List ListItem(memProto(
                   In':Int, A:K, B:Map, Bo:Bool)), S1:Set, S2:Set), M:Map)
          => findOpInList(In, L)
         requires In =/=K In'

    rule getRightChild(Cur:Int, (Cur |-> Op) B:Map, .K, M:Map) => Op
    rule getRightChild(Cur:Int, B:Map, .K, (Cur |-> A:K) M:Map)
               => getRightChild(Cur, B, A, M)
         requires notBool Cur in keys(B)
    rule getRightChild(Cur:K, BM:Map, runBlock(C:Int, N:K,
               F:K, L:List, S1:Set, S2:Set), M:Map)
       => getRightChild(F, BM, .K, M:Map)
    rule getRightChild(none, BM:Map, .K, M:Map) => none
    rule getRightChild(F:Int, BM:Map, .K, M:Map) => none
         requires notBool F in keys(BM)
                andBool notBool F in keys(M)


    syntax Bool ::= isReadEffectOrder(K) [function]
    rule isReadEffectOrder(acquire) => true
    rule isReadEffectOrder(acq_rel) => true
    rule isReadEffectOrder(seq_cst) => true
    rule isReadEffectOrder(A:K) => false [owise]

    syntax Bool ::= isWriteEffectOrder(K) [function]
    rule isWriteEffectOrder(release) => true
    rule isWriteEffectOrder(acq_rel) => true
    rule isWriteEffectOrder(seq_cst) => true
    rule isWriteEffectOrder(A:K) => false [owise]

    syntax Bool ::= isReadEffectFence(K) [function]
    rule isReadEffectFence(acquireFence) => true
    rule isReadEffectFence(readRWFence) => true
    rule isReadEffectFence(readWriteFence) => true
    rule isReadEffectFence(seqFence) => true
    rule isReadEffectFence(readSeqFence) => true
    rule isReadEffectFence(A:K) => false [owise]

    syntax Bool ::= isWriteEffectFence(K) [function]
    rule isWriteEffectFence(releaseFence) => true
    rule isWriteEffectFence(writeRWFence) => true
    rule isWriteEffectFence(readWriteFence) => true
    rule isWriteEffectFence(seqFence) => true
    rule isWriteEffectFence(writeSeqFence) => true
    rule isWriteEffectFence(A:K) => false [owise]

    syntax KItem ::= convertWriteFenceToOrder(K, K) [function]
    rule convertWriteFenceToOrder(releaseFence, Or:K) => release
         requires Or =/=K acq_rel andBool Or =/=K seq_cst
              andBool Or =/=K acquire
    rule convertWriteFenceToOrder(releaseFence, acquire) => acq_rel
    rule convertWriteFenceToOrder(releaseFence, Or:K) => Or
         requires Or ==K acq_rel orBool Or ==K seq_cst
    rule convertWriteFenceToOrder(writeRWFence, Or:K) => release
         requires Or =/=K acq_rel andBool Or =/=K seq_cst
              andBool Or =/=K acquire
    rule convertWriteFenceToOrder(writeRWFence, acquire) => acq_rel
    rule convertWriteFenceToOrder(writeRWFence, Or:K) => Or
         requires Or ==K acq_rel orBool Or ==K seq_cst
    rule convertWriteFenceToOrder(readWriteFence, Or:K) => acq_rel
         requires Or =/=K seq_cst
    rule convertWriteFenceToOrder(readWriteFence, seq_cst) => seq_cst
    rule convertWriteFenceToOrder(seqFence, Or:K) => seq_cst
    rule convertWriteFenceToOrder(writeSeqFence, Or:K) => release
         requires Or =/=K acq_rel andBool Or =/=K seq_cst
              andBool Or =/=K acquire
    rule convertWriteFenceToOrder(writeSeqFence, acquire) => acq_rel
    rule convertWriteFenceToOrder(writeSeqFence, Or:K) => Or
         requires Or ==K acq_rel orBool Or ==K seq_cst
    rule convertWriteFenceToOrder(A:K, Or:K) => Or [owise]


    syntax Bool ::= isConflit(K, K) [function]
    rule isConflit(aLoc(B:Int, S:Int, R:K), aLoc(B2:Int, S2:Int, R2:K)) => false
         requires R =/=K R2
    rule isConflit(aLoc(Base:Int, Size:Int, Ran:K), aLoc(Base':Int, Size':Int, Ran:K))
        => (Base >=Int Base' andBool Base <Int Base' +Int Size')
      orBool (Base' >=Int Base andBool Base' <Int Base +Int Size)
      orBool (Base' +Int Size' >Int Base
                    andBool Base' +Int Size' <=Int Base +Int Size)
      orBool (Base +Int Size >Int Base'
                    andBool Base +Int Size <=Int Base' +Int Size')
    rule isConflit(A:K, B:K) => true [owise]

    syntax Bool ::= isConflits(K, Set) [function]
    rule isConflits(A:K, .Set) => false
    rule isConflits(A:K, SetItem(B:K) S:Set)
           => isConflit(A, getTheLocInSize(none, B))
              orBool isConflits(A, S)
/*
    syntax Bool ::= isWriteWithSameLoc(K, List) [function]
    rule isWriteWithSameLoc(aLoc(Base:Int, Size:Int, Ran:K), .List) => false
    rule isWriteWithSameLoc(aLoc(Base:Int, Size:Int, Ran:K),
           L:List ListItem(memProto(In:Int, toWrite(X:K, Or:K), BM:Map, B:Bool))) => true
         requires isConflit(aLoc(Base:Int, Size:Int, Ran:K),
               getTheLocInSize(none, X))
    rule isWriteWithSameLoc(aLoc(Base:Int, Size:Int, Ran:K),
           L:List ListItem(memProto(In:Int, toWrite(X:K, Or:K), BM:Map, B:Bool)))
          => isWriteWithSameLoc(aLoc(Base:Int, Size:Int, Ran:K), L)
         requires notBool isConflit(aLoc(Base:Int, Size:Int, Ran:K),
               getTheLocInSize(none, X))
*/
   //check availability for heap mem ops
    syntax Bool ::= isMemAvailable(Int, Int, Int,K, K, Map) [function]
                     //cur, mem-block, inst-id, range, order, spectree
                  | isMemAvailableAux(K,K, List) [function]
                  | isMemAvailableRead(K, K, List) [function]
                  | isMemAvailableWrite(K, K, List) [function]
                  | isMemAvailableWriteAux(K, K, List) [function]
                  | isMemAvailableReadWrite(K, K, List) [function]
                  | isMemAvailableReadWriteAux(K, K, List) [function]
                  | isMemAvailableFence(K, K, List) [function]
                  | isMemAvailableFenceAux(List) [function]

    //case when the input op is a read op
    rule isMemAvailableRead(Loc:K, Or:K, .List) => true
    rule isMemAvailableRead(Loc:K, Or:K, L:List ListItem(memProto(
           In:Int, toRead(X:K, Or':K), BM:Map, B:Bool))) => false
         requires isReadEffectOrder(Or')
    rule isMemAvailableRead(Loc:K, Or:K, L:List ListItem(memProto(
           In:Int, toRead(X:K, Or':K), BM:Map, B:Bool)))
             => isMemAvailableRead(Loc, Or, L)
         requires notBool isReadEffectOrder(Or')
    rule isMemAvailableRead(Loc:K, Or:K, L:List ListItem(memProto(
           In:Int, toWrite(X:K, Or':K), BM:Map, B:Bool))) => false
         requires isConflit(Loc, getTheLocInSize(none, X))
    rule isMemAvailableRead(Loc:K, Or:K, L:List ListItem(memProto(
           In:Int, toWrite(X:K, Or':K), BM:Map, B:Bool)))
             => isMemAvailableRead(Loc, Or, L)
         requires notBool isConflit(Loc, getTheLocInSize(none, X))
    rule isMemAvailableRead(Loc:K, Or:K, L:List ListItem(memProto(
           In:Int, toReadWrite(X:Set, ListItem(Or':K) OrL:List),
          BM:Map, B:Bool))) => false
         requires isReadEffectOrder(Or')
    rule isMemAvailableRead(Loc:K, Or:K, L:List ListItem(memProto(
           In:Int, toReadWrite(X:Set, ListItem(Or':K) OrL:List),
          BM:Map, B:Bool))) => false
         requires notBool isReadEffectOrder(Or')
                   andBool isConflits(Loc, X)
    rule isMemAvailableRead(Loc:K, Or:K, L:List ListItem(memProto(
           In:Int, toReadWrite(X:Set, ListItem(Or':K) OrL:List),
          BM:Map, B:Bool))) => isMemAvailableRead(Loc, Or, L)
         requires notBool isReadEffectOrder(Or')
                   andBool notBool isConflits(Loc, X)
    rule isMemAvailableRead(Loc:K, Or:K, L:List ListItem(memProto(
           In:Int, Fen:K, BM:Map, B:Bool))) => false
         requires isReadEffectFence(Fen)
    rule isMemAvailableRead(Loc:K, Or:K, L:List ListItem(memProto(
           In:Int, Fen:K, BM:Map, B:Bool)))
              => isMemAvailableRead(Loc, Or, L)
         requires notBool isReadEffectFence(Fen)
    rule isMemAvailableRead(Loc:K, Or:K, L ListItem(A:K))
           => isMemAvailableRead(Loc, Or, L) [owise]

    //case when the input op is a write op
    rule isMemAvailableWrite(Loc:K, Or:K, .List) => true
    rule isMemAvailableWrite(Loc:K, Or:K, L:List ListItem(memProto(
           In:Int, A:K, BM:Map, B:Bool)))
             => isMemAvailableWriteAux(Loc, convertWriteFenceToOrder(A, Or), L)
         requires isWriteEffectFence(A)
    rule isMemAvailableWrite(Loc:K, Or:K, L:List ListItem(memProto(
           In:Int, A:K, BM:Map, B:Bool)))
             => isMemAvailableWriteAux(Loc, Or, ListItem(memProto(
           In:Int, A:K, BM:Map, B:Bool)))
         requires notBool isWriteEffectFence(A)

    rule isMemAvailableWriteAux(Loc:K, Or:K, .List) => true
    rule isMemAvailableWriteAux(Loc:K, Or:K, L:List ListItem(memProto(
           In:Int, A:K, BM:Map, B:Bool))) => false
         requires isWriteEffectOrder(Or)
    rule isMemAvailableWriteAux(Loc:K, Or:K, L:List ListItem(memProto(
           In:Int, toRead(X:K, Or':K), BM:Map, B:Bool))) => false
         requires notBool isWriteEffectOrder(Or)
                 andBool isReadEffectOrder(Or')
    rule isMemAvailableWriteAux(Loc:K, Or:K, L:List ListItem(memProto(
           In:Int, toRead(X:K, Or':K), BM:Map, B:Bool))) => false
         requires notBool isWriteEffectOrder(Or)
                 andBool notBool isReadEffectOrder(Or')
                 andBool isConflit(Loc, getTheLocInSize(none, X))
    rule isMemAvailableWriteAux(Loc:K, Or:K, L:List ListItem(memProto(
           In:Int, toRead(X:K, Or':K), BM:Map, B:Bool)))
             => isMemAvailableWriteAux(Loc, Or, L)
         requires notBool isWriteEffectOrder(Or)
                 andBool notBool isReadEffectOrder(Or')
             andBool notBool isConflit(Loc, getTheLocInSize(none, X))
    rule isMemAvailableWriteAux(Loc:K, Or:K, L:List ListItem(memProto(
           In:Int, toWrite(X:K, Or':K), BM:Map, B:Bool))) => false
         requires notBool isWriteEffectOrder(Or)
             andBool isConflit(Loc, getTheLocInSize(none, X))
    rule isMemAvailableWriteAux(Loc:K, Or:K, L:List ListItem(memProto(
           In:Int, toWrite(X:K, Or':K), BM:Map, B:Bool)))
          => isMemAvailableWriteAux(Loc, Or, L)
         requires notBool isWriteEffectOrder(Or)
             andBool notBool isConflit(Loc, getTheLocInSize(none, X))
    rule isMemAvailableWriteAux(Loc:K, Or:K, L:List ListItem(memProto(
           In:Int, toReadWrite(X:Set, ListItem(Or':K) OrL:List),
          BM:Map, B:Bool))) => false
         requires notBool isWriteEffectOrder(Or)
                  andBool isReadEffectOrder(Or')
    rule isMemAvailableWriteAux(Loc:K, Or:K, L:List ListItem(memProto(
           In:Int, toReadWrite(X:Set, ListItem(Or':K) OrL:List),
          BM:Map, B:Bool))) => false
         requires notBool isWriteEffectOrder(Or)
              andBool notBool isReadEffectOrder(Or')
                   andBool isConflits(Loc, X)
    rule isMemAvailableWriteAux(Loc:K, Or:K, L:List ListItem(memProto(
           In:Int, toReadWrite(X:Set, ListItem(Or':K) OrL:List),
          BM:Map, B:Bool))) => isMemAvailableWriteAux(Loc, Or, L)
         requires notBool isWriteEffectOrder(Or)
              andBool notBool isReadEffectOrder(Or')
                   andBool notBool isConflits(Loc, X)
    rule isMemAvailableWriteAux(Loc:K, Or:K, L:List ListItem(memProto(
           In:Int, Fen:K, BM:Map, B:Bool))) => false
         requires notBool isWriteEffectOrder(Or)
                  andBool isReadEffectFence(Fen)
    rule isMemAvailableWriteAux(Loc:K, Or:K, L:List ListItem(memProto(
           In:Int, Fen:K, BM:Map, B:Bool)))
              => isMemAvailableWriteAux(Loc, Or, L)
         requires notBool isWriteEffectOrder(Or)
                  andBool notBool isReadEffectFence(Fen)
    rule isMemAvailableWriteAux(Loc:K, Or:K, L ListItem(A:K))
           => isMemAvailableWriteAux(Loc, Or, L) [owise]

    //dealing with atomic read write ops
    rule isMemAvailableReadWrite(Loc:K, Or:K, .List) => true
    rule isMemAvailableReadWrite(Loc:K, Or:K, L:List ListItem(memProto(
           In:Int, A:K, BM:Map, B:Bool)))
             => isMemAvailableReadWriteAux(Loc, convertWriteFenceToOrder(A, Or), L)
         requires isWriteEffectFence(A)
    rule isMemAvailableReadWrite(Loc:K, Or:K, L:List ListItem(memProto(
           In:Int, A:K, BM:Map, B:Bool)))
             => isMemAvailableReadWriteAux(Loc, Or, ListItem(memProto(
           In:Int, A:K, BM:Map, B:Bool)))
         requires notBool isWriteEffectFence(A)

    rule isMemAvailableReadWriteAux(Loc:K, Or:K, .List) => true
    rule isMemAvailableReadWriteAux(Loc:K, Or:K, L:List ListItem(memProto(
           In:Int, A:K, BM:Map, B:Bool))) => false
         requires isWriteEffectOrder(Or)
    rule isMemAvailableReadWriteAux(Loc:K, Or:K, L:List ListItem(memProto(
           In:Int, toRead(X:K, Or':K), BM:Map, B:Bool))) => false
         requires notBool isWriteEffectOrder(Or)
                 andBool isReadEffectOrder(Or')
    rule isMemAvailableReadWriteAux(Loc:K, Or:K, L:List ListItem(memProto(
           In:Int, toRead(X:K, Or':K), BM:Map, B:Bool))) => false
         requires notBool isWriteEffectOrder(Or)
                 andBool isReadEffectOrder(Or')
              andBool isConflit(Loc, getTheLocInSize(none, X))
    rule isMemAvailableReadWriteAux(Loc:K, Or:K, L:List ListItem(memProto(
           In:Int, toRead(X:K, Or':K), BM:Map, B:Bool)))
             => isMemAvailableReadWriteAux(Loc, Or, L)
         requires notBool isWriteEffectOrder(Or)
                 andBool notBool isReadEffectOrder(Or')
                andBool notBool isConflit(Loc, getTheLocInSize(none, X))
    rule isMemAvailableReadWriteAux(Loc:K, Or:K, L:List ListItem(memProto(
           In:Int, toWrite(X:K, Or':K), BM:Map, B:Bool))) => false
         requires notBool isWriteEffectOrder(Or)
             andBool isConflit(Loc, getTheLocInSize(none, X))
    rule isMemAvailableReadWriteAux(Loc:K, Or:K, L:List ListItem(memProto(
           In:Int, toWrite(X:K, Or':K), BM:Map, B:Bool)))
          => isMemAvailableReadWriteAux(Loc, Or, L)
         requires notBool isWriteEffectOrder(Or)
             andBool notBool isConflit(Loc, getTheLocInSize(none, X))

    rule isMemAvailableReadWriteAux(Loc:K, Or:K, L:List ListItem(memProto(
           In:Int, toReadWrite(X:Set, ListItem(Or':K) OrL:List),
          BM:Map, B:Bool))) => false
         requires notBool isWriteEffectOrder(Or)
                  andBool isReadEffectOrder(Or')
    rule isMemAvailableReadWriteAux(Loc:K, Or:K, L:List ListItem(memProto(
           In:Int, toReadWrite(X:Set, ListItem(Or':K) OrL:List),
          BM:Map, B:Bool))) => false
         requires notBool isWriteEffectOrder(Or)
              andBool notBool isReadEffectOrder(Or')
                   andBool isConflits(Loc, X)
    rule isMemAvailableReadWriteAux(Loc:K, Or:K, L:List ListItem(memProto(
           In:Int, toReadWrite(X:Set, ListItem(Or':K) OrL:List),
          BM:Map, B:Bool))) => isMemAvailableReadWriteAux(Loc, Or, L)
         requires notBool isWriteEffectOrder(Or)
              andBool notBool isReadEffectOrder(Or')
                   andBool notBool isConflits(Loc, X)
    rule isMemAvailableReadWriteAux(Loc:K, Or:K, L:List ListItem(memProto(
           In:Int, Fen:K, BM:Map, B:Bool))) => false
         requires notBool isWriteEffectOrder(Or)
                  andBool isReadEffectFence(Fen)
    rule isMemAvailableReadWriteAux(Loc:K, Or:K, L:List ListItem(memProto(
           In:Int, Fen:K, BM:Map, B:Bool)))
              => isMemAvailableReadWriteAux(Loc, Or, L)
         requires notBool isWriteEffectOrder(Or)
                  andBool notBool isReadEffectFence(Fen)
    rule isMemAvailableReadWriteAux(Loc:K, Or:K, L ListItem(A:K))
           => isMemAvailableWriteAux(Loc, Or, L) [owise]

    //deal with the case when the op is a fence(seq_cst)
    rule isMemAvailableFence(Ran:K, fence(seq_cst), L:List)
           => isMemAvailableFenceAux(L)
    rule isMemAvailableFence(Ran:K, A:K, .List) => true
         requires A =/=K fence(seq_cst)
    rule isMemAvailableFence(Ran:K, A:K, L:List) => false
         requires A =/=K fence(seq_cst) andBool size(L) >Int 0

    rule isMemAvailableFenceAux(.List) => true
    rule isMemAvailableFenceAux(L:List ListItem(memProto(
           In:Int, fence(Or:K), BM:Map, B:Bool))) => false
    rule isMemAvailableFenceAux(L:List ListItem(memProto(
           In:Int, A:K, BM:Map, B:Bool))) => false
         requires isReadEffectFence(A)
             orBool isWriteEffectFence(A)
    rule isMemAvailableFenceAux(L:List ListItem(memProto(
           In:Int, X:K, BM:Map, B:Bool)))
            => isMemAvailableFenceAux(L) [owise]

    //main function isMemAvailable
    rule isMemAvailable(Cur:Int, Bn:Int, In:Int,Ran:K, A:K, M:Map)
          => isMemAvailableAux(Ran, A, getAllMemProtos(Bn, In, .K, M))
         requires A =/=K fence(seq_cst)
    rule isMemAvailable(Cur:Int, Bn:Int, In:Int,Ran:K, fence(seq_cst), M:Map)
          => isMemAvailableFence(Ran, getRealSeqFence(Cur, Bn, In, .K, M),
             getAllMemProtos(Bn, In, .K, M))

    rule isMemAvailableAux(Ran:K, toClose(A:Int), .List) => true
    rule isMemAvailableAux(Ran:K, toClose(A:Int), L:List) => false
         requires size(L) =/=Int 0
    rule isMemAvailableAux(Ran:K, vaWait, .List) => true
    rule isMemAvailableAux(Ran:K, vaWait, L:List) => false
         requires size(L) =/=Int 0

    rule isMemAvailableAux(Ran:K, Op:K, L:List) => isMemAvailableRead(
             getTheLocInSize(Ran, Op), getOrderInMemOp(Op), L)
         requires isARead(Op)
    rule isMemAvailableAux(Ran:K, Op:K, L:List) => isMemAvailableWrite(
             getTheLocInSize(Ran, Op), getOrderInMemOp(Op), L)
         requires isAWrite(Op)
    rule isMemAvailableAux(Ran:K, atomicReadWrite(T:K, Base:Int, 
           Size:Int, Ad:Int, Order:K, Next:K), L:List)
         => isMemAvailableReadWrite(aLoc(Base, Size, Ran), Order, L)


endmodule
