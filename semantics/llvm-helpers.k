//
requires "llvm-syntax.k"
requires "llvm-abstractsyntax.k"
requires "llvm-settings.k"

module LLVM-HELPERS
    imports LLVM-SYNTAX
    imports LLVM-ABSTRACTSYNTAX
    imports LLVM-SETTINGS

    //helper functions for type checking phi functions, switches and gep
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

    syntax KItem ::= "none"
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
    rule 'nullOfConstValueRef(.KList) => loc(startMemoryLoc -Int 1, 0, undef, undef) [anywhere]

    syntax Int ::= base(Loc) [function]
    rule base(loc(Base:Int, _, _, _)) => Base:Int
    
    syntax Int ::= offset(Loc)
    rule offset(loc(_, Offset:Int, _, _)) => Offset:Int
    
    syntax Int ::= offsetLimit(Loc)
    rule offset(loc(_, _, OffsetLimit:Int, _)) => OffsetLimit
    rule offset(loc(_, _, OffsetLimit:K, _)) => -1 [owise]

    syntax Int ::= alignment(Loc)
    rule offset(loc(_, _, _, Align:Int)) => Align
    rule offset(loc(_, _, _, Align:K)) => -1 [owise]

    syntax Loc ::= Loc "+" Int [function]
    // TODO not checking for null
    
    rule loc(Base:Int, Offset:Int, Limit:K, Align:K) + Offset':Int
            => loc(Base:Int, Offset:Int +Int Offset':Int, Limit, Align)

    //functions to split a whole data into list of bytes
    syntax KItem ::= splitBytes(K, K) [function]// value, type
    syntax List ::= splitBytesAux(K, K) [function]

    rule splitBytes(V:KResult, T:K)
                => region(splitBytesAux(V, T), sizeof(T))

    rule splitBytesAux(V:KResult, integerType(N:Int))
                  => splitIntByte(V, N, sizeof(integerType(N))
                 *Int numBitsPerByte)
    rule splitBytesAux(V:KResult, pointerTypeValue(A:K, B:K))
                  => splitPointerByte(V, 0, sizeof(
                             pointerTypeValue(A:K, B:K)))
    rule splitBytesAux(V:KResult, arrayTypeValue(A:K, B:Int))
                  => splitArrayByte(V, 0, B, A)
    rule splitBytesAux(V:KResult, vectorTypeValue(A:K, B:Int))
                  => splitArrayByte(V, 0, B, A)

    syntax List ::= splitIntByteAux(K, Int) [function]
                  | splitIntByte(K, Int, Int) [function]
    rule splitIntByteAux(countByteResult(Re:List, L:List), A:Int)
          => .List
         requires A:Int <Int 0
    rule splitIntByteAux(countByteResult(Re:List, L:List), A:Int)
          => ListItem(intByte(L))
         requires A:Int ==Int 0
    rule splitIntByteAux(countByteResult(Re:List, L:List), A:Int)
          => splitIntByteAux(countByte(Re, .List, numBitsPerByte),
               A -Int numBitsPerByte) ListItem(intByte(L))
         requires A:Int >Int 0
    rule splitIntByte(A:K, N:Int, B:Int)
          => splitIntByteAux(countByte(splitIntBits(A, N, B), .List,
                              numBitsPerByte), B -Int numBitsPerByte)

    syntax List ::= splitPointerByte(K, Int, Int) [function]
    rule splitPointerByte(zeroinitializer, I:Int, N:Int)
           => splitPointerByte('nullOfConstValueRef(.KList), I, N)
    rule splitPointerByte(A:K, I:Int, N:Int)
             => ListItem(A) splitPointerByte(A:K, I +Int 1, N)
         requires I <Int N andBool (A ==K undef orBool A ==K poisonVal)
    rule splitPointerByte(A:K, I:Int, N:Int) => .List
         requires I >=Int N
    rule splitPointerByte(X:Loc, I:Int, N:Int)
             => splitPointerByte(X, I +Int 1, N) ListItem(ptrByte(X, I))
         requires I <Int N
    rule splitPointerByte(X:Loc, I:Int, N:Int) => .List
         requires I >=Int N

    syntax List ::= splitArrayByte(K, Int, Int, K)  [function]
                  | splitArrayByteAux(ElemList, Int, Int, K)  [function]
    rule splitArrayByte(X:K, I:Int, N:Int, A:K)
          => splitBytesAux(X, A) splitArrayByte(X:K, I +Int 1, N, A)
         requires I <Int N andBool (X ==K undef orBool X ==K poisonVal)
    rule splitArrayByte(arrayValue(E:ElemList), I:Int, N:Int, A:K)
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

    syntax KItem ::= joinBytes(K, K) [strict(1)]

    syntax Int ::= wvalist(List, K)
    //rule isNat(wvalist(_, _)) => true

    syntax KItem ::= "byteType" [function]
    rule byteType => integerType(numBitsPerByte)

    syntax KItem ::= i(K) [function]//[latex "i({#1})"]
    rule i(N:Int) => integerType(N)

    syntax Int ::= sizeofInBits(K) [function]

    syntax Loc ::= intToPtrOfLoc(K, K)
    syntax Int ::= ptrToIntOfLoc(K, K)
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
    rule isIntegerType(integerType(_)) => true
    rule isIntegerType(_) => false [owise]

    syntax Bool ::= isFloatType(K) [function]
    rule isFloatType(F:FPType) => true
    rule isFloatType(_) => false [owise]

    syntax Bool ::= isPointerType(K) [function]
    rule isPointerType('pointerType(_,, _)) => true
    rule isPointerType(pointerTypeValue(_, _)) => true
    rule isPointerType(_) => false [owise]

    syntax Bool ::= isArrayType(K) [function]
    rule isArrayType(arrayType(_, _)) => true
    rule isArrayType(arrayTypeValue(_, _)) => true
    rule isArrayType(_) => false [owise]

    syntax Bool ::= isStructType(K)
    rule isStructType('structType(_)) => true
    rule isStructType(structTypeValue(_)) => true
    rule isStructType(_) => false [owise]

    syntax Bool ::= isPackedStructType(K)
    rule isPackedStructType('packedStructType(_)) => true
    rule isPackedStructType(packedStructTypeValue(_)) => true
    rule isPackedStructType(_) => false [owise]

    // fixme size should depend on architecture
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
    // TODO listK should be Fields (bug in K)
    rule sizeofInBits(structTypeValue(Type:KResult, L:TypeList))
      => sizeofInBits(Type) +Int sizeofInBits(structTypeValue(L))
    rule sizeofInBits(structTypeValue(.TypeList)) => 0
    rule sizeofInBits('structType(Type:KResult, L:TypeList))
      => sizeofInBits(Type) +Int sizeofInBits('structType(L))
    rule sizeofInBits('structType(.TypeList)) => 0

    syntax Int ::= sizeof(K) [function]
    rule sizeof(Type:KResult) => sizeofInBits(Type) /Int numBitsPerByte
        requires numBitsPerByte dividesInt sizeofInBits(Type)
    rule sizeof(Type:KResult) => sizeofInBits(Type) /Int numBitsPerByte +Int 1
        requires notBool (numBitsPerByte dividesInt sizeofInBits(Type))

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

    //useful function to turn a kitem into an elemList
    //here: add addNameToString to every position where it has type or valueref
    syntax KItem ::= doubleList(RetAttrs, FuncAttrs)
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
    rule formElemList(cleanup) => val(cleanup)
    rule formElemList('cleanupEmpty(.KList)) => .ElemList
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
    rule formElemList('scopeorderEmpty(.KList)) => .ElemList
    rule formElemList('singlethreadEmpty(.KList)) => .ElemList
    rule formElemList(syncscope(" S:SyncScopeKey "))
                       => val(S),.ElemList
    rule formElemList(, N:UnsignedInt)
              => val(String2Int(#tokenToString(N))),.ElemList
    rule formElemList(N:UnsignedInt, Cil:ConstantIndexList)
           => val(String2Int(#tokenToString(N))),formElemList(Cil)
    rule formElemList(X:Ordering) => val(X),.ElemList
    rule formElemList(X:Ordering Xl:OrderingList)
                 => val(X),formElemList(Xl)
    rule formElemList('argListUnit(.KList)) => .ElemList
    rule formElemList(...) => .ElemList
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

    syntax ElemList ::= formElemListInGep(ReturnedVal) [function]
    rule formElemListInGep(.ReturnedVal) => .ElemList
    rule formElemListInGep(T:Type V:ValueRef, R:ReturnedVal)
            => val(typeOperand(T, addNameToString(V))), formElemListInGep(R)


    syntax ElemList ::= formTypeCheckList(K)   [function]
    rule formTypeCheckList('.ReturnedVal(.KList)) => .ElemList
    rule formTypeCheckList(It:Type V:ValueRef , Ins:ReturnedVal)
            => val(typeOperand(It,addNameToString(V))),formTypeCheckList(Ins)
    rule formTypeCheckList(.ParamList) => .ElemList
    rule formTypeCheckList(T:Type _:ParamAttrs V:ValueRef, Pl:ParamList)
            => val(typeOperand(T,addNameToString(V))),formTypeCheckList(Pl)
    rule formTypeCheckList(K:K) => K [owise]


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
    rule formSet(S:Ordering) => SetItem(S)
    rule formSet(S:Ordering Ss:OrderingList) => SetItem(S) formSet(Ss)
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

/*
    syntax ElemList ::= toCallees(ParamList) [function]

    rule toCallees(.ParamList) => .ElemList
    rule toCallees(Ty:Type Pa:ParamAttrs V:ValueRef,Pl:ParamList)
                => val(callee(operand(addNameToString(Ty)
                  ,addNameToString(V)),modifiers(formElemList(Pa)))),toCallees(Pl)
*/
    syntax SymbolicValueRef ::= addNameToString(K) [function]

    rule addNameToString(Var:LocalName) => name(localVar, substrString(#tokenToString(Var),1
                          ,lengthString(#tokenToString(Var))))
    rule addNameToString(Var:GlobalName) => name(globalVar, substrString(#tokenToString(Var),1
                          ,lengthString(#tokenToString(Var))))
    rule addNameToString(Var:LabelStringConstant) => name(localVar, substrString(#tokenToString(Var),0
                          ,lengthString(#tokenToString(Var)) -Int 1))
    rule addNameToString(< R:ReturnedVal >) => vector(formElemList(R))
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
    rule addNameToString(K:K) => K [owise]

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

    syntax KItem ::= getIntType(K)    [function]
                   | getIntInIntType(K) [function]
    rule getIntType(integerType(N:Int)) => integerType(N:Int)
    rule getIntType(vectorTypeValue(T:K, N:Int)) => T
    rule getIntType(K:K) => K [owise]
    rule getIntInIntType(integerType(N:Int)) => N
    rule getIntInIntType(vectorTypeValue(T:K, N:Int)) => T
    rule getIntInIntType(K:K) => K [owise]

    syntax KItem ::= normalizingInt(K, K) [function]// type, int
                   | deNormalizingInt(K, Int) [function]
                   | applyInts(K, K, K, K, Set, ElemList) [function]
                              // op, type, int, int, flags
                   | applyInt(K, K, K, K, Set) [function]
                                // op, type, int, int, flags
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
    rule applyOp(urem, V1:Int, V2:Int) => V1 modInt V2
    rule applyOp(srem, V1:Int, V2:Int) => V1 %Int V2
    rule applyOp(eq, V1:Int, V2:Int) => boolToInt(V1 ==Int V2)
    rule applyOp(eq, loc(X:Int, Y:Int, L:K, A:K),
          loc(X':Int, Y':Int, L':K, A':K))
                  => boolToInt((X +Int Y) ==Int (X' +Int Y'))
    rule applyOp(ne, V1:Int, V2:Int) => boolToInt(V1 =/=Int V2)
    rule applyOp(ne, loc(X:Int, Y:Int, L:K, A:K),
          loc(X':Int, Y':Int, L':K, A':K))
                  => boolToInt((X +Int Y) =/=Int (X' +Int Y'))
    rule applyOp(Op:K, V1:Int, V2:Int) => boolToInt(V1 >Int V2)
         requires Op ==K 'ugtOfIcmp(.KList) orBool Op ==K sgt
    rule applyOp(Op:K, loc(X:Int, Y:Int, L:K, A:K),
          loc(X':Int, Y':Int, L':K, A':K))
                => boolToInt((X +Int Y) >Int (X' +Int Y'))
    rule applyOp(Op:K, V1:Int, V2:Int) => boolToInt(V1 >=Int V2)
         requires Op ==K 'ugeOfIcmp(.KList) orBool Op ==K sge
    rule applyOp(Op:K, loc(X:Int, Y:Int, L:K, A:K),
          loc(X':Int, Y':Int, L':K, A':K))
            => boolToInt((X +Int Y) >=Int (X' +Int Y'))
    rule applyOp(Op:K, V1:Int, V2:Int) => boolToInt(V1 <Int V2)
         requires Op ==K 'ultOfIcmp(.KList) orBool Op ==K slt
    rule applyOp(Op:K, loc(X:Int, Y:Int, L:K, A:K),
          loc(X':Int, Y':Int, L':K, A':K))
              => boolToInt((X +Int Y) <Int (X' +Int Y'))
    rule applyOp(Op:K, V1:Int, V2:Int) => boolToInt(V1 <=Int V2)
         requires Op ==K 'uleOfIcmp(.KList) orBool Op ==K sle
    rule applyOp(Op:K, loc(X:Int, Y:Int, L:K, A:K),
          loc(X':Int, Y':Int, L':K, A':K))
         => boolToInt((X +Int Y) <=Int (X' +Int Y'))

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
                          => applyOp(urem, V1, V2)
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
                    zeroinitializer, S:Set, Es:ElemList)
         => applyInt(Op, T:K, 0, 0, S:Set)
    rule applyInts(Op:K, integerType(N:Int),
                  zeroinitializer, V2:Int, S:Set, Es:ElemList)
         => applyInt(Op, integerType(N:Int), zeroinitializer, V2, S:Set)
    rule applyInts(Op:K, integerType(N:Int),
                     V1:Int, zeroinitializer, S:Set, Es:ElemList)
         => applyInt(Op, integerType(N:Int), V1, zeroinitializer, S:Set)
    rule applyInts(Op:K, T:K, vectorValue(.ElemList),
                        vectorValue(.ElemList), S:Set, Es:ElemList)
         => vectorValue(Es)
    rule applyInts(Op:K, vectorTypeValue(T:K, N:Int), undef,
                        V2:K, S:Set, Es:ElemList)
         => applyInts(Op:K, vectorTypeValue(T:K, N:Int),
               vectorValue(makeResultList(N, undef)),
                        V2, S:Set, Es:ElemList)
    rule applyInts(Op:K, vectorTypeValue(T:K, N:Int),
          V1:K, undef, S:Set, Es:ElemList)
         => applyInts(Op:K, vectorTypeValue(T:K, N:Int), V1,
               vectorValue(makeResultList(N, undef)),
                            S:Set, Es:ElemList)

    rule applyInts(Op:K, vectorTypeValue(T:K, N:Int), zeroinitializer,
                        V2:K, S:Set, Es:ElemList)
         => applyInts(Op:K, vectorTypeValue(T:K, N:Int),
               vectorValue(makeResultList(N, zeroinitializer)),
                        V2, S:Set, Es:ElemList)
    rule applyInts(Op:K, vectorTypeValue(T:K, N:Int),
          V1:K, zeroinitializer, S:Set, Es:ElemList)
         => applyInts(Op:K, vectorTypeValue(T:K, N:Int), V1,
               vectorValue(makeResultList(N, zeroinitializer)),
                            S:Set, Es:ElemList)

    rule applyInts(Op:K, T:K, vectorValue(valValue(V1:K),E1:ElemList),
           vectorValue(valValue(V2:K),E2:ElemList), S:Set, Es:ElemList)
         => applyInts(Op, T, vectorValue(E1), vectorValue(E2), S,
                addElemToEnd(valValue(applyInt(Op, getIntType(T), V1, V2, S)), Es))
         requires applyInt(Op, getIntType(T), V1, V2, S) =/=K badValue
    rule applyInts(Op:K, T:K, vectorValue(valValue(V1:K),E1:ElemList),
           vectorValue(valValue(V2:K),E2:ElemList), S:Set, Es:ElemList)
         => badValue
         requires applyInt(Op, getIntType(T), V1, V2, S) ==K badValue

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
    rule applyIcmp(OP:K,
              integerType(N:Int), zeroinitializer, V2:K)
            => applyIcmp(OP, integerType(N:Int), 0, V2)
    rule applyIcmp(OP:K,
               integerType(N:Int), V1:K, zeroinitializer)
            => applyIcmp(OP, integerType(N:Int), V1, 0)
    rule applyIcmp(OP:K, pointerTypeValue(T:K, Ad:K),
                zeroinitializer, V2:K)
            => applyIcmp(OP, pointerTypeValue(T:K, Ad:K),
                loc(startMemoryLoc, 0, undef, undef), V2)
    rule applyIcmp(OP:K, pointerTypeValue(T:K, Ad:K),
                V1:K, zeroinitializer)
            => applyIcmp(OP, pointerTypeValue(T:K, Ad:K),
                    V1, loc(startMemoryLoc, 0, undef, undef))
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
    rule applyIcmps(Op:K, T:K, V1:K, zeroinitializer, Es:ElemList)
         => applyIcmp(Op, T, V1, zeroinitializer)
         requires getKLabel(T) ==KLabel 'integerType
                  orBool getKLabel(T) ==KLabel 'pointerTypeValue
    rule applyIcmps(Op:K, T:K, zeroinitializer, V2:K, Es:ElemList)
         => applyIcmp(Op, T, zeroinitializer, V2)
         requires getKLabel(T) ==KLabel 'integerType
                  orBool getKLabel(T) ==KLabel 'pointerTypeValue
    rule applyIcmps(Op:K, T:K, vectorValue(.ElemList),
                        vectorValue(.ElemList), Es:ElemList)
         => vectorValue(Es)

    rule applyIcmps(Op:K, vectorTypeValue(T:K, N:Int),
         zeroinitializer, V2:K, Es:ElemList)
         => applyIcmps(Op:K, vectorTypeValue(T:K, N:Int),
               vectorValue(makeResultList(N, zeroinitializer)),
                        V2, Es:ElemList)
    rule applyIcmps(Op:K, vectorTypeValue(T:K, N:Int), V1:K,
         zeroinitializer, Es:ElemList)
         => applyIcmps(Op:K, vectorTypeValue(T:K, N:Int),
           V1, vectorValue(makeResultList(N, zeroinitializer)),
              Es:ElemList)

    rule applyIcmps(Op:K, T:K, vectorValue(valValue(V1:K),E1:ElemList),
           vectorValue(valValue(V2:K),E2:ElemList), Es:ElemList)
         => applyIcmps(Op, T, vectorValue(E1), vectorValue(E2),
                addElemToEnd(valValue(applyIcmp(Op, getIntType(T), V1, V2)), Es))
         requires applyIcmp(Op, getIntType(T), V1, V2) =/=K badValue
    rule applyIcmps(Op:K, T:K, vectorValue(valValue(V1:K),E1:ElemList),
           vectorValue(valValue(V2:K),E2:ElemList), Es:ElemList)
         => badValue
         requires applyIcmp(Op, getIntType(T), V1, V2) ==K badValue


    syntax Int ::= seqAdds(Int, Int) [function]
    rule seqAdds(N:Int, N':Int) => 2 ^Int N
         requires N >=Int N'
    rule seqAdds(N:Int, N':Int) => (2 ^Int N) +Int seqAdds(N +Int 1, N')
         requires N <Int N'

    rule applyCast(trunc, integerType(N:Int), V1:Int, integerType(N':Int)) => mod(V1, 2 ^Int N')
    rule applyCast(zext, integerType(N:Int), V1:Int, integerType(N':Int)) => V1
    rule applyCast(sext, integerType(N:Int), V1:Int, integerType(N':Int)) => V1
         requires V1 <Int (2 ^Int (N -Int 1))
    rule applyCast(sext, integerType(N:Int), V1:Int, integerType(N':Int)) => V1 +Int seqAdds(N, N')
         requires V1 >=Int (2 ^Int (N -Int 1))
    rule applyCast(Op:K, T:K, poisonVal, T':K) => poisonVal
    rule applyCast(Op:K, T:K, undef, T':K) => undef

    rule applyCasts(Op:K, integerType(N:Int), .ElemList, T:K) => .ElemList
    rule applyCasts(Op:K, integerType(N:Int), vectorValue(Es:ElemList), T:K)
               => vectorValue(applyCasts(Op, integerType(N:Int), Es, T:K))
    rule applyCasts(Op:K, integerType(N:Int), (valValue(K:K),Es:ElemList), T:K)
               => valValue(applyCast(Op, integerType(N:Int), K, T)),
                                       applyCasts(Op, integerType(N:Int), Es, T)
    rule applyCasts(Op:K, A:K, I1:K, I2:K) => applyCast(Op, A, I1, I2)        [owise]


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

    syntax KItem ::= getAlign(Set, K) [function]
    rule getAlign(.Set, .K) => 'alignEmpty(.KList)
    rule getAlign(SetItem(K:K) S:Set, .K) => getAlign(S, K)
    rule getAlign(S:Set, align N:UnsignedInt) => String2Int(#tokenToString(N))
    rule getAlign(S:Set, K:K => .K)
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

    syntax Set ::= formArgSet(ElemList)      [function]
    rule formArgSet(.ElemList) => .Set
    rule formArgSet(valValue(typeOperandResult(T:K, V:K)), E:ElemList)
            => SetItem(operand(T, V)) formArgSet(E)

    syntax ElemList ::= formArgList(ElemList, ParamList)   [function]
    rule formArgList(.ElemList, Ps:ParamList) => .ElemList
    rule formArgList(valValue(typeOperandResult(T:KResult, E:K)), Es:ElemList,
                       Ty:Type Pa:ParamAttrs Va:ValueRef, Pl:ParamList)
                          => val(arg(formSet(Pa), T, Va)),formArgList(Es, Pl)

    syntax ElemList ::= formOperandList(ElemList)    [function]
    rule formOperandList(.ElemList) => .ElemList
    rule formOperandList(valValue(typeOperandResult(T:K, V:K)),Es:ElemList)
           => val(operand(T, V)),formOperandList(Es)

    syntax KLabel ::= getKLabelFromOp(K) [function]
    rule getKLabelFromOp('add(.KList)) => 'theAdd
    rule getKLabelFromOp('sub(.KList)) => 'theSub
    rule getKLabelFromOp(mul) => 'theMul
    rule getKLabelFromOp(shl) => 'theShl
    rule getKLabelFromOp('udiv(.KList)) => 'theUDiv
    rule getKLabelFromOp('sdiv(.KList)) => 'theSDiv
    rule getKLabelFromOp('urem(.KList)) => 'theURem
    rule getKLabelFromOp('srem(.KList)) => 'theSRem
    rule getKLabelFromOp('lshr(.KList)) => 'theLShr
    rule getKLabelFromOp('ashr(.KList)) => 'theAShr
    rule getKLabelFromOp('and(.KList)) => 'theAnd
    rule getKLabelFromOp('or(.KList)) => 'theOr
    rule getKLabelFromOp('xor(.KList)) => 'theXor
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
    rule getKLabelFromOp(call) => 'call
    rule getKLabelFromOp(tail call) => 'tailCall

    syntax Bool ::= hasVectorInList(ElemList)    [function]
    rule hasVectorInList(.ElemList) => false
    rule hasVectorInList(valValue(typeOperandResult(
        vectorTypeValue(_:K, _:K), _:K)), Es:ElemList) => true
    rule hasVectorInList(valValue(typeOperandResult(A:K, _:K)),
                  Es:ElemList) => hasVectorInList(Es)
         requires getKLabel(A) =/=KLabel 'vectorTypeValue
    rule hasVectorInList(val(operand(
        vectorType(_:K, _:K), _:K)), Es:ElemList) => true
    rule hasVectorInList(val(operand(A:K, _:K)),
                  Es:ElemList) => hasVectorInList(Es)
         requires getKLabel(A) =/=KLabel 'vectorType

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

    syntax KItem ::= getVectorNum(ElemList)        [function]
    rule getVectorNum(.ElemList) => badType
    rule getVectorNum(valValue(typeOperandResult(
        vectorTypeValue(_:K, I:K), _:K)), Es:ElemList) => I
    rule getVectorNum(valValue(typeOperandResult(A:K, _:K)),
                  Es:ElemList) => getVectorNum(Es)
         requires getKLabel(A) =/=KLabel 'vectorTypeValue
    rule getVectorNum(val(operand(
        vectorType(_:K, I:K), _:K)), Es:ElemList) => I
    rule getVectorNum(val(operand(A:K, _:K)),
                  Es:ElemList) => getVectorNum(Es)
         requires getKLabel(A) =/=KLabel 'vectorType

    syntax KItem ::= fulfillVector(ElemList, K)       [function]
    rule fulfillVector(.ElemList, I:Int) => .ElemList
    rule fulfillVector(val(operand(
        vectorType(A:K, B:K), C:K)), Es:ElemList, I:Int)
              => val(operand(vectorType(A:K, B:K), C:K)), fulfillVector(Es, I)
    rule fulfillVector(val(operand(A:K, B:K)), Es:ElemList, I:Int)
              => val(operand(vectorType(A:K, I), B:K)), fulfillVector(Es, I)
         requires getKLabel(A) =/=KLabel 'vectorType

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
/*
    syntax List ::= dealWithDependList(List, K, K, Set)
    rule dealWithDependList(L:List, I:K, Def:K, .Set) => L
    rule dealWithDependList(L:List, I:K, Def:K, SetItem(Use:K) Uses:Set)
          => 
*/
    syntax KItem ::= guessNextBlock(K) [function]
    rule guessNextBlock(unconditional(A:K)) => A
    rule guessNextBlock(conditional(A:K, B:K, C:K)) => B
    rule guessNextBlock(switch(A:K, B:K, C:K,
                         (val(D:K), Es:ElemList))) => D
    rule guessNextBlock(indirectbr(A:K, val(B:K),Es:ElemList)) => B
    rule guessNextBlock(_:K) => .K [owise]

    syntax Set ::= getAllBrBlocks(K) [function]
    rule getAllBrBlocks(unconditional(A:K)) => SetItem(A)
    rule getAllBrBlocks(conditional(A:K, B:K, C:K))
               => SetItem(B) SetItem(C)
    rule getAllBrBlocks(switch(A:K, B:K, C:K, Es:ElemList))
               => SetItem(C) elemListToSet(Es)
    rule getAllBrBlocks(indirectbr(A:K, Es:ElemList)) => elemListToSet(Es)

    syntax Set ::= getRestBlocks(K, K, Map) [function]
    rule getRestBlocks(unconditional(A:K), .K, (A |-> B:K) M:Map)
           => getRestBlocks(unconditional(A:K), B, M:Map)
    rule getRestBlocks(unconditional(A:K), blockContent(
               _:Map, true, _:Set, _:Set, _:Set,
              _:Set, _:Set, _:Set, _:Set), M:Map)
              => SetItem(A)
    rule getRestBlocks(unconditional(A:K), blockContent(
               _:Map, false, _:Set, _:Set, _:Set,
              _:Set, _:Set, _:Set, _:Set), M:Map)
              => .Set
    rule getRestBlocks(conditional(A:K, B:K, C:K), .K, (B |-> D:K) M:Map)
             => getRestBlocks(conditional(A:K, B:K, C:K), D, M:Map)
    rule getRestBlocks(conditional(A:K, B:K, C:K), blockContent(
               _:Map, true, _:Set, _:Set, _:Set,
              _:Set, _:Set, _:Set, _:Set), M:Map)
               => SetItem(B) SetItem(C)
    rule getRestBlocks(conditional(A:K, B:K, C:K), blockContent(
               _:Map, false, _:Set, _:Set, _:Set,
              _:Set, _:Set, _:Set, _:Set), M:Map)
               => SetItem(C)
         requires C =/=K B
        rule getRestBlocks(conditional(A:K, B:K, C:K), blockContent(
               _:Map, false, _:Set, _:Set, _:Set,
              _:Set, _:Set, _:Set, _:Set), M:Map)
               => .Set
         requires C ==K B
    rule getRestBlocks(switch(A:K, B:K, C:K, (val(D:K),Es:ElemList)),
               .K, (D |-> E:K) M:Map)
             => getRestBlocks(
                   switch(A:K, B:K, C:K, Es:ElemList), E, M:Map)
    rule getRestBlocks(switch(A:K, B:K, C:K,
               (val(D:K), Es:ElemList)), blockContent(
               _:Map, true, _:Set, _:Set, _:Set,
              _:Set, _:Set, _:Set, _:Set), M:Map)
             => SetItem(C) SetItem(D) elemListToSet(Es)
    rule getRestBlocks(switch(A:K, B:K, C:K,
               (val(D:K), Es:ElemList)), blockContent(
               _:Map, false, _:Set, _:Set, _:Set,
              _:Set, _:Set, _:Set, _:Set), M:Map)
             => removeItemFromSet(D, .K, SetItem(C) elemListToSet(Es))
    rule getRestBlocks(indirectbr(A:K, (val(B:K), Es:ElemList)),
               .K, (B |-> C:K) M:Map)
             => getRestBlocks(indirectbr(A:K,
                       (val(B:K), Es:ElemList)), C, M:Map)
    rule getRestBlocks(indirectbr(A:K, (val(B:K), Es:ElemList))
           , blockContent( _:Map, true, _:Set, _:Set, _:Set,
              _:Set, _:Set, _:Set, _:Set), M:Map)
                   => SetItem(B) elemListToSet(Es)
    rule getRestBlocks(indirectbr(A:K, (val(B:K), Es:ElemList))
           , blockContent( _:Map, false, _:Set, _:Set, _:Set,
              _:Set, _:Set, _:Set, _:Set), M:Map)
                   => removeItemFromSet(B, .K, elemListToSet(Es))

    syntax Set ::= removeItemFromSet(K, K, Set) [function]
    rule removeItemFromSet(A:K, .K, .Set) => .Set
    rule removeItemFromSet(A:K, .K, SetItem(B:Set) S:Set)
           => removeItemFromSet(A, B, S)
    rule removeItemFromSet(A:K, B:K, S:Set)
          => SetItem(B) removeItemFromSet(A, .K, S)
         requires A =/=K B
    rule removeItemFromSet(A:K, A:K, S:Set)
          => removeItemFromSet(A, .K, S)

    syntax Bool ::= hasRestBlocks(K, Map)  [function]
    rule hasRestBlocks(.K, .Map) => false
    rule hasRestBlocks(.K, (A:K |-> B:K) M:Map)
              => hasRestBlocks(B, M)
    rule hasRestBlocks(nextSpecs(.Set), M:Map)
            => hasRestBlocks(.K, M)
    rule hasRestBlocks(nextSpecs(SetItem(A:K) S:Set), M:Map)
            => true

    syntax Set ::= elemListToSet(ElemList) [function]
    rule elemListToSet(.ElemList) => .Set
    rule elemListToSet(val(A:K), Es:ElemList)
                        => SetItem(A) elemListToSet(Es)
    rule elemListToSet(valValue(A:K), Es:ElemList)
                        => SetItem(A) elemListToSet(Es)

    syntax KItem ::= findNextBlock(K, Map, Map)  [function]
                   | findNextBlockAux(Set, K, Set, Map, Map) [function]
                   | findNextBlockNext(Set, K, Map, Map) [function]

    syntax Set ::= getSet(K) [function]
    rule getSet(nextSpecs(S:Set)) => S
    rule getSet(A:K) => .Set [owise]

    syntax Int ::= getIntKey(K) [function]
    rule getIntKey(basicBlockNum(X:Int, Y:K)) => X
    rule getIntKey(A:K) => -1

    rule findNextBlock(A:K, EX:Map, RM:Map) => emptyHOLE
         requires notBool (A in keys(EX))
    rule findNextBlock(A:K, (A |-> B:K) EX:Map, RM:Map)
          => findNextBlockAux(.Set, .K, getSet(B), EX, RM)

    rule findNextBlockAux(A:Set, .K, .Set, EX:Map, RM:Map)
              => findNextBlockNext(A, .K, EX, RM)
    rule findNextBlockAux(A:Set, .K, SetItem(B:K) S:Set, EX:Map, RM:Map)
              => findNextBlockAux(A, B, S, EX, RM)
    rule findNextBlockAux(A:Set, basicBlockNum(Count:Int,
                   In:K), S:Set, EX:Map, (Count |-> nextSpecs(.Set)) RM:Map)
         => findNextBlockAux(A, .K, S, EX, (Count |-> nextSpecs(.Set)) RM)
    rule findNextBlockAux(A:Set, basicBlockNum(Count:Int,
                   In:K), S:Set, EX:Map,
            (Count |-> nextSpecs(SetItem(B:K) S':Set)) RM:Map)
         => selectSpec(Count, B, S')

    rule findNextBlockNext(.Set, .K, EX:Map, RM:Map) => emptyHOLE
    rule findNextBlockNext(SetItem(B:K) S:Set, .K, EX:Map, RM:Map)
                 => findNextBlockNext(S, findNextBlock(
                            getIntKey(B), EX, RM), EX, RM)
    rule findNextBlockNext(S:Set, emptyHOLE, EX, RM)
             => findNextBlockNext(S, .K, EX, RM)
    rule findNextBlockNext(S:Set, selectSpec(X:K,
                            Y:K, Z:K), EX:Map, RM:Map)
            => selectSpec(X, Y, Z)

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
    rule isAvailable(Op:KLabel(Ty:K,, V1:SymbolicValueRef,, V2:K)) => false
        requires isIntOp(Op:KLabel(Ty:K,, V1:SymbolicValueRef,, V2:K))
    rule isAvailable(Op:KLabel(Ty:K,, V1:K,, V2:SymbolicValueRef)) => false
        requires isIntOp(Op:KLabel(Ty:K,, V1,, V2))
    rule isAvailable(A:K) => false [owise]

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
           Bn:Int, In:Int, X:K)) L:List) => L
   rule removeInst(A:Int, B:Int, ListItem(X:K) L:List)
             => ListItem(X:K) (removeInst(A, B, L))
        [owise]

   syntax List ::= updateVarInList(Int, Int, List, Map, Map, Map) [function]
   syntax KItem ::= updateVarInTerm(Int, Int, K, Map, Map, Map) [function]
                  | updateVarInTermList(Int, Int, ElemList, Map, Map, Map) [function]
                  | updateVarInVar(Int, Int, K, Map, Map, Map) [function]


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
                     In:Int, X:SymbolicValueRef)) L:List, M:Map, RM:Map, Rev:Map)
        => ListItem(singleMem(TID:Int, Bn:Int, In:Int,
                updateVarInVar(Cur, Bn, X, M, RM, Rev)))
               updateVarInList(Cur, Pre, L, M, RM, Rev)
        requires Bn >=Int Pre
   rule updateVarInList(Cur:Int, Pre:Int, ListItem(singleMem(TID:Int, Bn:Int,
                     In:Int, X:K)) L:List, M:Map, RM:Map, Rev:Map)
        => ListItem(singleMem(TID:Int, Bn:Int, In:Int, X))
               updateVarInList(Cur, Pre, L, M, RM, Rev)
        requires Bn <Int Pre orBool notBool isLocalVariable(X)

   rule updateVarInVar(Cur:Int, Cb:Int, X:SymbolicValueRef,
             (varInstance(Cb, X) |-> V:K) M:Map, RM:Map, Rev:Map)
            => V
   rule updateVarInVar(Cur:Int, Cb:Int, X:SymbolicValueRef,
             M:Map, RM:Map, (Cb:Int |-> CbNext:K) Rev:Map)
        => updateVarInVar(Cur, CbNext, X, M, RM, Rev:Map)
        requires notBool varInstance(Cb, X) in keys(M)
                 andBool Cur <Int Cb
   rule updateVarInVar(Cur:Int, Cb:Int, X:SymbolicValueRef,
             M:Map, (X |-> V:K) RM:Map, Rev:Map) => V
        requires Cur >=Int Cb
   rule updateVarInVar(Cur:Int, Cb:Int, X:SymbolicValueRef,
             M:Map, RM:Map, Rev:Map) => X
        requires Cur >=Int Cb andBool notBool X in keys(RM)

   rule updateVarInTerm(Cur:Int, C:Int, name(localVar, S:String),
                M:Map, RM:Map, Rev:Map) =>
             updateVarInVar(Cur, C, name(localVar, S:String),
                M:Map, RM, Rev:Map)
   rule updateVarInTerm(Cur:Int, C:Int, name(globalVar, S:String),
                M:Map, RM:Map, Rev:Map) => name(globalVar, S:String)

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
   rule updateVarInTerm(Cur:Int, C:Int, iCmp(Op:K, T:K,
                        V1:K, V2:K), M:Map, RM:Map, Rev:Map)
        => iCmp(Op:K, T:K, updateVarInTerm(Cur, C, V1, M, RM, Rev),
               updateVarInTerm(Cur, C, V2, M, RM, Rev))
   rule updateVarInTerm(Cur:Int, C:Int, conditional(operand(T:K, V:K),
                            V1:K, V2:K), M:Map, RM:Map, Rev:Map)
        => conditional(operand(T:K, updateVarInTerm(Cur, C:Int, V:K, M, RM, Rev)),
               V1, V2)
   rule updateVarInTerm(Cur:Int, C:Int, select(T:K, I:K
                            operand(T1:K, V1:K), operand(T2:K, V2:K)),
                       M:Map, RM:Map, Rev:Map)
        => select(T, updateVarInTerm(Cur, C:Int, I, M, RM, Rev),
              operand(T1:K, updateVarInTerm(Cur, C:Int, V1:K, M, RM, Rev)),
              operand(T2:K, updateVarInTerm(Cur, C:Int, V2:K, M, RM, Rev)))
   rule updateVarInTerm(Cur:Int, C:Int, unconditional(V:K), M:Map, RM:Map, Rev:Map)
        => unconditional(V:K)
   rule updateVarInTerm(Cur:Int, C:Int, alloca(T:K, A:K, Al:K),
                          M:Map, RM:Map, Rev:Map)
          => alloca(T:K, updateVarInTerm(Cur, C, A, M, RM, Rev), Al:K)
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
   rule updateVarInTerm(Cur:Int, C:Int, ret(Ty:K, V:K), M:Map, RM:Map, Rev:Map)
        => ret(Ty, updateVarInTerm(Cur, C, V, M, RM, Rev))
   rule updateVarInTerm(Cur:Int, C:Int, A:K, M, RM, Rev)
         => A [owise]

   rule updateVarInTermList(Cur:Int, C:Int, .ElemList,
                               M:Map, RM:Map, Rev:Map) => .ElemList
   rule updateVarInTermList(Cur:Int, C:Int,
          val(arg(S:Set, T:K, X:K)),Es:ElemList, M:Map, RM:Map, Rev:Map)
        => val(arg(S:Set, T:K, updateVarInTerm(Cur, C:Int, X, M, RM, Rev))),
               (updateVarInTermList(Cur, C, Es, M:Map, RM, Rev))

   syntax Map ::= cutOffRegs(Int, K, K, Map) [function]
                | getOffRegs(Int, K, K, Map) [function]
                | updateMapByMap(Map, K, K, Map) [function]

   rule cutOffRegs(A:Int, .K, .K, .Map) => .Map
   rule cutOffRegs(A:Int, .K, .K, (X:K |-> Y:K) M:Map)
         => cutOffRegs(A, X, Y, M)
   rule cutOffRegs(A:Int, varInstance(A:Int, X:K), Y:K, M:Map)
         => cutOffRegs(A, .K, .K, M)
   rule cutOffRegs(A:Int, varInstance(B:Int, X:K), Y:K, M:Map)
        => (varInstance(B:Int, X:K) |-> Y:K) cutOffRegs(A, .K, .K, M)
        requires A =/=K B

   rule getOffRegs(A:Int, .K, .K, .Map) => .Map
   rule getOffRegs(A:Int, .K, .K, (X:K |-> Y:K) M:Map)
         => getOffRegs(A, X, Y, M)
   rule getOffRegs(A:Int, varInstance(A:Int, X:K), Y:K, M:Map)
         => (varInstance(A:Int, X:K) |-> Y:K) getOffRegs(A, .K, .K, M)
   rule getOffRegs(A:Int, varInstance(B:Int, X:K), Y:K, M:Map)
        => getOffRegs(A, .K, .K, M)
        requires A =/=K B

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

   syntax Bool ::= inChoiceMap(K, K, K, Map) [function]
                 | inChoiceMapAux(K, K, Set) [function]
   rule inChoiceMap(Old:K, New:K, .K, (Old |-> V:K) M:Map)
         => inChoiceMap(Old, New, V, M)
   rule inChoiceMap(Old:K, New:K, .K, M:Map) => false
        requires notBool Old in keys(M)
   rule inChoiceMap(Old:K, New:K, nextSpecs(S:Set), M:Map)
           => inChoiceMapAux(New, .K, S)
   rule inChoiceMapAux(New:K, .K, .Set) => false
   rule inChoiceMapAux(New:K, .K, SetItem(A:K) S:Set)
          => inChoiceMapAux(New, A, S)
   rule inChoiceMapAux(New:K, basicBlockNum(X:Int, New:K), S:Set)
         => true
   rule inChoiceMapAux(New:K, basicBlockNum(X:Int, New':K), S:Set)
         => inChoiceMapAux(New, .K, S)
        requires New =/=K New'

   syntax Int ::= getBlockNum(K, K, K, Map) [function]
                | getBlockNumAux(K, K, Set) [function]
   rule getBlockNum(Old:K, New:K, .K, (Old |-> B:K) S:Map)
         => getBlockNum(Old, New, B, S)
   rule getBlockNum(Old:K, New:K, .K, S:Map) => -1
        requires notBool Old in keys(S)
   rule getBlockNum(Old:K, New:K, nextSpecs(S:Set), M:Map)
           => getBlockNumAux(New, .K, S)
   rule getBlockNumAux(New:K, .K, .Set) => -1
   rule getBlockNumAux(New:K, .K, SetItem(A:K) S:Set)
          => getBlockNumAux(New, A, S)
   rule getBlockNumAux(New:K, basicBlockNum(X:Int, New:K), S:Set)
           => X
   rule getBlockNumAux(New:K, basicBlockNum(X:Int, New':K), S:Set)
         => getBlockNumAux(New, .K, S)
        requires New =/=K New'

   syntax KItem ::= mergeBackInstQueue(K) [function]
   rule mergeBackInstQueue(splitQueue(A:List, B:List, C:List))
                 => instList(A B C)
   rule mergeBackInstQueue(A:K) => A [owise]

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


    syntax KItem ::= nextSym(Int, Int, Int) [function]
                 //suppose base, Limit, Align
    rule nextSym(N:Int, Limit:Int, Al:Int) => loc(N, 0, Limit, 0)
         requires Al ==K 0
    rule nextSym(N:Int, Limit:Int, Al:Int) => loc(N, 0, Limit, 0)
         requires Al =/=K 0 andBool Al dividesInt N
    rule nextSym(N:Int, Limit:Int, Al:Int)
           => loc((N /Int Al) *Int Al +Int Al, 0, Limit,
                   (N /Int Al) *Int Al +Int Al -Int N)
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

    syntax Int ::= newPacking(Int, Int, Int) [function]
                 //suppose base, Limit, Align
    rule newPacking(N:Int, Limit:Int, Al:Int) => 0
         requires Al ==K 0
    rule newPacking(N:Int, Limit:Int, Al:Int) => 0
         requires Al =/=K 0 andBool Al dividesInt N
    rule newPacking(N:Int, Limit:Int, Al:Int)
           => (N /Int Al) *Int Al +Int Al -Int N
         requires Al =/=K 0 andBool notBool (Al dividesInt N)

    syntax KItem ::= insertLimit(Loc, K) [function]
    rule insertLimit(loc(A:K, B:K, Limit:K, Align:K), T:K)
             => loc(A, B, sizeof(T), Align)

    syntax List ::= decToBin(Int, Int)  [function]
    rule decToBin(I:Int, 0) => .List 
    rule decToBin(I:Int, N:Int) => decToBin(I, N -Int 1) ListItem(0)
         requires I <=Int 0 andBool N >Int 0
    rule decToBin(I:Int, N:Int) => decToBin(I /Int 2, N -Int 1)
                               ListItem(I %Int 2)
         requires I >Int 0 andBool N >Int 0

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
    rule countByte(.List, L:List, I:Int) => countByteResult(.List, L)
         requires I <=Int 0
    rule countByte(.List, L:List, I:Int)
                 => countByte(.List, ListItem(undef) L, I -Int 1)
         requires I >Int 0
    rule countByte(L:List ListItem(A:K), L1:List, I:Int)
                 => countByte(L, ListItem(A:K) L1, I -Int 1)
          requires I >Int 0
    rule countByte(L:List ListItem(A:K), L1:List, I:Int)
                 => countByteResult(L:List ListItem(A:K), L1)
         requires I <=Int 0

    //a function to update toCommit cell with actually memoy op
    syntax List ::= subPrototypeWithActual(List, Int, Int, Int, List) [function]
    rule subPrototypeWithActual(.List, TID:Int, BN:Int, IN:Int, S:List) => .List
    rule subPrototypeWithActual(ListItem(singleMem(TID:Int, BN:Int, IN:Int, X:K)) L:List, 
                TID, BN, IN, S:List) => S L
    rule subPrototypeWithActual(ListItem(singleMem(TID:Int, BN:Int, IN:Int, X:K)) L:List, 
                TID':Int, BN':Int, IN':Int, S:List) => ListItem(singleMem(TID, BN, IN, X:K))
              subPrototypeWithActual(L, TID', BN', IN', S)
         requires TID =/=K TID' orBool BN =/=K BN' orBool IN =/=K IN'

    syntax List ::= genWriteBytes(Int, Int, Int, K, K, K,
                                        Int, Int, Int, Int)  [function]
          //block, inst, type, Value, ori, Base, offset, offset count, limit
    rule genWriteBytes(TID:Int, BN:Int, IN:Int,
                  Ty:K, region(.List, A:Int), V1:K, B:Int, C:Int, I:Int, S:Int)
            => genWriteBytes(TID, BN, IN, Ty:K, region(.List, A), V1, B, C, I +Int 1, S:Int)
                    ListItem(singleMem(TID, BN, IN, writeAByte(Ty:K, undef, V1, B, C, I, S)))
         requires I <Int A
    rule genWriteBytes(TID, BN:Int, IN:Int, Ty:K, region(ListItem(V:K) L:List, A:Int), V1:K,
               B:Int, C:Int, I:Int, S:Int)
            => genWriteBytes(TID, BN:Int, IN:Int, Ty:K, region(L:List, A), V1:K,
               B:Int, C:Int, I +Int 1, S)
                   ListItem(singleMem(TID, BN, IN, writeAByte(Ty:K, V, V1:K, B, C, I, S)))
         requires I <Int A
    rule genWriteBytes(TID, BN:Int, IN:Int, Ty:K, region(L:List, A:Int), V1:K,
                   B:Int, C:Int, I:Int, S:Int) => .List
         requires I >=Int A

    syntax KItem ::= getOrdering(K, Set) [function]
    rule getOrdering(.K, .Set) => .K
    rule getOrdering(.K, SetItem(A:K) S:Set) => getOrdering(A, S)
    rule getOrdering(O:Ordering, S:Set) => O
    rule getOrdering(A:KItem, S:Set) => getOrdering(.K, S:Set)
         requires A =/=K unordered andBool A =/=K monotonic
                  andBool A =/=K acquire andBool A =/=K release
                  andBool A =/=K acq_rel andBool A =/=K seq_cst

    syntax KItem ::= getMemVar(K) [function]
    rule getMemVar(assign(X:K, In:K)) => getMemVar(In)
    rule getMemVar(noAssign(X:K)) => getMemVar(X)
    rule getMemVar(instruction(X:K, Y:Set, Z:K))
             => getMemVar(X)
    rule getMemVar(store(X:K, Y:K, Z:K)) => Z
    rule getMemVar(load(X:K, Y:K)) => Y
    rule getMemVar(A:K) => .K [owise]

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
    syntax Bool ::= inSameMemRangeAux(Int, Int, Int, Int, K)
                    //first base, first offset, second base, second offset, range
                  | inSameMemRange(Int, Int, Int, Int, List)
    rule inSameMemRangeAux(B:Int, O:Int, B':Int, O':Int, value(X:Int, Y:Int))
           => (B >=Int X andBool B <Int Y andBool B' >=Int X andBool B' <Int Y)
            orBool (B +Int O >=Int X andBool B +Int O <Int Y
                             andBool B' >=Int X andBool B' <Int Y)
            orBool (B >=Int X andBool B <Int Y
                        andBool B' +Int O' >=Int X andBool B' +Int O' <Int Y)
            orBool (B +Int O >=Int X andBool B +Int O <Int Y
                    andBool B' +Int O' >=Int X andBool B' +Int O' <Int Y)
    rule inSameMemRange(B:Int, O:Int, B':Int, O':Int, .List) => false
    rule inSameMemRange(B:Int, O:Int, B':Int, O':Int, ListItem(A:K) L:List)
           => inSameMemRange(B, O, B', O', L)
         requires notBool inSameMemRangeAux(B, O, B', O', A)
    rule inSameMemRange(B:Int, O:Int, B':Int, O':Int, ListItem(A:K) L:List)
           => true
         requires inSameMemRangeAux(B, O, B', O', A)

    //determine if a memory op can be executed in toCommit cell
    syntax KItem ::= getBaseAndOffset(K) [function]
                   | getBaseAndSize(K) [function]
    rule getBaseAndOffset(writeAByte(T:K, V:K,V1:K, Ba:Int, Of:Int, Ex:Int, Size:Int))
            => pairResult(Ba, Of)
    rule getBaseAndOffset(atomicWrite(T:K, V:K,V1:K, Ba:Int, Of:Int, Ex:Int, A:K))
            => pairResult(Ba, Of)

    rule getBaseAndSize(writeAByte(T:K, V:K,V1:K, Ba:Int, Of:Int, Ex:Int, Size:Int))
            => pairResult(Ba +Int Of, Size)
    rule getBaseAndSize(atomicWrite(T:K, V:K,V1:K, Ba:Int, Of:Int, Size:Int, A:K))
            => pairResult(Ba +Int Of, Size)

    syntax Bool ::= isMemAvailable(List, K, List) [function]
                  | isMemAvailableA(Int, Int, K, List)  [function]
                  | isMemAvailableB(K, K)  [function]
                  | isALoc(K) [function]

    rule isALoc(loc(A:K, B:K, C:K, D:K)) => true
    rule isALoc(A:K) => false [owise]
    rule isMemAvailableA(B:Int, O:Int, pairResult(Ba:Int, Of:Int), L:List)
           => notBool inSameMemRange(B, O, Ba, Of, L)
    rule isMemAvailableB(pairResult(Bo:Int, Size:Int),
                             pairResult(Boa:Int, Size':Int))
           => (Bo +Int Size <Int Boa) orBool (Bo >=Int Boa +Int Size')

    rule isMemAvailable(.List, A:K, S:List) => true
    rule isMemAvailable(ListItem(singleMem(TID:Int, Bn:Int,
                    In:Int, X:SymbolicValueRef)) L:List, A:K, S:List) => false
    rule isMemAvailable(ListItem(singleMem(TID:Int, Bn:Int,
                    In:Int, loc(Base:Int, Offset:Int, Y:K, Z:K))) L:List,
                      singleMem(TID':Int, Bn':Int,In':Int,W:K), S:List) => false
         requires notBool isMemAvailableA(Base, Offset, getBaseAndOffset(W), S)
                  andBool (TID =/=K TID' orBool Bn =/=K Bn' orBool In =/=K In')
    rule isMemAvailable(ListItem(singleMem(TID:Int, Bn:Int,
                    In:Int, loc(Base:Int, Offset:Int, Y:K, Z:K))) L:List,
             singleMem(TID':Int, Bn':Int,In':Int,W:K), S:List) => isMemAvailable(L, W, S)
         requires isMemAvailableA(Base, Offset, getBaseAndOffset(W), S)
                  andBool (TID =/=K TID' orBool Bn =/=K Bn' orBool In =/=K In')
    rule isMemAvailable(ListItem(singleMem(TID:Int, Bn:Int,
                    In:Int, X:K)) L:List,
                      singleMem(TID':Int, Bn':Int,In':Int,W:K), S:List) => false
         requires notBool isLocalVariable(X) andBool notBool isALoc(X)
                andBool notBool isMemAvailableB(getBaseAndSize(X), getBaseAndSize(W))
                 andBool (TID =/=K TID' orBool Bn =/=K Bn' orBool In =/=K In')
    rule isMemAvailable(ListItem(singleMem(TID:Int, Bn:Int,
                    In:Int, X:K)) L:List,
         singleMem(TID':Int, Bn':Int,In':Int,W:K), S:List) => isMemAvailable(L, W, S)
         requires notBool isLocalVariable(X) andBool notBool isALoc(X)
                andBool isMemAvailableB(getBaseAndSize(X), getBaseAndSize(W))
                 andBool (TID =/=K TID' orBool Bn =/=K Bn' orBool In =/=K In')
    rule isMemAvailable(ListItem(singleMem(TID:Int, Bn:Int,
                    In:Int, X:K)) L:List,
         singleMem(TID:Int, Bn:Int,In:Int,W:K), S:List) => isMemAvailable(L, W, S)
          requires notBool isLocalVariable(X)

    //check if an op is a write
    syntax Bool ::= isAWrite(K) [function]
    rule isAWrite(writeAByte(T:K, A:K, B:K, C:Int, D:Int, E:Int, F:Int)) => true 
    rule isAWrite(atomicWrite(T:K, A:K, B:K, C:Int, D:Int, E:Int, F:K)) => true
    rule isAWrite(A:K) => false [owise]

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
        requires rightHitTypeMap(Ne, .K, Base', T')
    rule rightHitTypeMap(M, memChunck(Base:Int, X:Int, Y:Int, T:K,
        B:K, I:Bool, Bs:Set, Ne:Map), Base':Int, T':K)
         => rightHitTypeMap(M, .K, Base', T')
        requires notBool rightHitTypeMap(Ne, .K, Base', T')
              andBool Base =/=K Base' andBool T =/=K T'

    syntax Bool ::= isOverlapAux(Int, Int, K) [function]
                  | isOverlap(Int, Int, K, Set) [function]
    rule isOverlapAux(Base:Int, Last:Int, singleMem(Tid, Bn, In,
                        value(Base':Int, Last':Int)))
           => (Base >=Int Base' andBool Base <Int Last')
              orBool (Base <=Int Base' andBool Base' <Int Last)
    rule isOverlap(Base:Int, Last:Int, .K, .Set) => true
    rule isOverlap(Base:Int, Last:Int, .K, SetItem(A:K) S:Set) => 
           isOverlap(Base:Int, Last:Int, A, S:Set)
    rule isOverlap(Base:Int, Last:Int,
               singleMem(Tid:Int, Bn:Int, In:Int, X:K), S:Set) => 
           isOverlap(Base:Int, Last:Int, .K, S:Set)
         requires notBool isOverlapAux(Base, Last,
                          singleMem(Tid:Int, Bn:Int, In:Int, X:K))
    rule isOverlap(Base:Int, Last:Int,
               singleMem(Tid:Int, Bn:Int, In:Int, X:K), S:Set) => false
         requires isOverlapAux(Base, Last,
                          singleMem(Tid:Int, Bn:Int, In:Int, X:K))

    syntax Bool ::= hasInstance(Int, Int, Int, K, Set) [function]
    rule hasInstance(Tid:Int, Bn:Int, In:Int, .K, .Set) => false
    rule hasInstance(Tid:Int, Bn:Int, In:Int, .K, SetItem(A:K) S:Set)
           => hasInstance(Tid, Bn, In, A, S)
    rule hasInstance(Tid, Bn, In, singleMem(Tid, Bn, In, X:K), S:Set)
           => true
    rule hasInstance(Tid, Bn, In, singleMem(Tid', Bn', In', X:K), S:Set)
            => hasInstance(Tid, Bn, In, .K, S)
         requires Tid =/=K Tid' orBool Bn =/=K Bn' orBool In =/=K In'

    syntax Map ::= updateMemWithAtomic(Map, Int, K) [function]
    rule updateMemWithAtomic(M:Map, B:Int, region(.List, A:K)) => M
    rule updateMemWithAtomic(M:Map, B:Int, region(ListItem(X:K) L:List, A:K))
           => updateMemWithAtomic(M[B <- X], B +Int 1, region(L, A))

endmodule
