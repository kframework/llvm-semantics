//
requires "llvm-syntax.k"
requires "llvm-abstractsyntax.k"
requires "llvm-settings.k"

module LLVM-HELPERS
    imports LLVM-SYNTAX
    imports LLVM-ABSTRACTSYNTAX
    imports LLVM-SETTINGS

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

    syntax KItem ::= splitBytes(K, K) // value, type
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
    rule formElemList('optScopeOrder('singlethreadEmpty(.KList),, Or:Ordering))
                       => val(Or)
    rule formElemList(singlethread Or:Ordering)
                       => val(singlethread),val(Or)
    rule formElemList(, Ui:UnsignedInt) => val(Ui)
    rule formElemList(Ui:UnsignedInt, Cil:ConstantIndexList)
                 => val(Ui),formElemList(Cil)
    rule formElemList(X:Ordering) => val(X)
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
    rule formSet('optScopeOrder('singlethreadEmpty(.KList),, S:Ordering)) => SetItem(S)
    rule formSet(singlethread S:Ordering) => SetItem(singlethread) SetItem(S)
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
                   | deNormalizingInt(K, K) [function]
                   | applyInts(K, K, K, K) [function] // op, type, int, int
                   | applyInt(K, K, K, K) [function] // op, type, int, int
                   | applyOp(K, K, K)     [function] // op, int, int
                   | applyCast(K, K, K, K)   [function] //op, type ints, type
                   | applyCasts(K, K, K, K)   [function] //op, type ints, type
                   | applySelect(K, K, K, K) [function] //op, bool, first, second
                   | applySelects(K, K, K, K) [function] //op, bool, first, second
                   | applyIcmps(K, K, K, K) [function] // op, type, int, int
                   | applyIcmp(K, K, K, K) [function] // op, type, int, int

    rule deNormalizingInt(integerType(N:Int), V:Int) => V
         requires V <Int (2 ^Int (N -Int 1))
    rule deNormalizingInt(integerType(N:Int), V:Int) => 0 -Int (V -Int (2 ^Int (N -Int 1)))
         requires V >=Int (2 ^Int (N -Int 1))
    rule deNormalizingInt(integerType(N:Int), vectorValue(valValue(I:Int),Es:ElemList))
                       => vectorValue(valValue(I),
                           deNormalizingInt(integerType(N:Int), Es:ElemList))
         requires I <Int (2 ^Int (N -Int 1))
    rule deNormalizingInt(integerType(N:Int), vectorValue(valValue(I:Int),Es:ElemList))
                       => vectorValue(valValue(0 -Int (I -Int (2 ^Int (N -Int 1)))),
                           deNormalizingInt(integerType(N:Int), Es:ElemList))
         requires I >=Int (2 ^Int (N -Int 1))
    rule deNormalizingInt(integerType(N:Int), valValue(I:Int),Es:ElemList)
                       => valValue(I),
                           deNormalizingInt(integerType(N:Int), Es:ElemList)
         requires I <Int (2 ^Int (N -Int 1))
    rule deNormalizingInt(integerType(N:Int), valValue(I:Int),Es:ElemList)
                       => valValue(0 -Int (I -Int (2 ^Int (N -Int 1)))),
                           deNormalizingInt(integerType(N:Int), Es:ElemList)
         requires I  >=Int (2 ^Int (N -Int 1))
    rule deNormalizingInt(integerType(N:Int), vectorValue(valValue(K:K),Es:ElemList))
                       => vectorValue(valValue(K),
                           deNormalizingInt(integerType(N:Int), vectorValue(Es:ElemList)))
         requires notBool isTheInt(K)
    rule deNormalizingInt(integerType(N:Int), valValue(K:K),Es:ElemList)
                       => valValue(K),
                           deNormalizingInt(integerType(N:Int), vectorValue(Es:ElemList))
         requires notBool isTheInt(K)
    rule deNormalizingInt(A:K, .ElemList) => .ElemList
    rule deNormalizingInt(A:K, K:K) => K
         requires getKLabel(K) ==KLabel 'poisonVal
                             orBool getKLabel(K) ==KLabel 'undef


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
    rule applyOp('eq(.KList), V1:Int, V2:Int) => V1 ==Int V2
    rule applyOp('neq(.KList), V1:Int, V2:Int) => V1 =/=Int V2
    rule applyOp(Op:K, V1:Int, V2:Int) => V1 >Int V2
         requires Op ==K 'ugtOfIcmp(.KList) orBool Op ==K sgt
    rule applyOp(Op:K, V1:Int, V2:Int) => V1 >=Int V2
         requires Op ==K 'ugeOfIcmp(.KList) orBool Op ==K sge
    rule applyOp(Op:K, V1:Int, V2:Int) => V1 <Int V2
         requires Op ==K 'ultOfIcmp(.KList) orBool Op ==K slt
    rule applyOp(Op:K, V1:Int, V2:Int) => V1 <=Int V2
         requires Op ==K 'uleOfIcmp(.KList) orBool Op ==K sle

    rule applyInt(Op:K, integerType(N:Int), V1:Int, V2:Int) => mod(applyOp(Op, V1, V2), 2 ^Int N)
    rule applyInt(Op:K, integerType(N:Int), A:K, A':K) => poisonVal
         requires A ==K poisonVal orBool A' ==K poisonVal
    rule applyInt(Op:K, integerType(N:Int), A:K, A':K) => undef
         requires (A ==K undef orBool A' ==K undef)
                   andBool A =/=K poisonVal
                   andBool A' =/=K poisonVal

    rule applyInts(Op:K, integerType(N:Int), .ElemList, .ElemList) => .ElemList
    rule applyInts(Op:K, integerType(N:Int), vectorValue(Es:ElemList)
                                       , vectorValue(Es':ElemList))
               => vectorValue(applyInts(Op, integerType(N:Int), Es, Es'))
    rule applyInts(Op:K, integerType(N:Int), (valValue(K:K),Es:ElemList)
                                       , (valValue(K':K),Es':ElemList))
               => valValue(applyInt(Op, integerType(N:Int), K, K')),
                                       applyInts(Op, integerType(N:Int), Es, Es')
    rule applyInts(Op:K, A:K, I1:K, I2:K) => applyInt(Op, A, I1, I2)        [owise]


    rule applyIcmp(Op:K, integerType(N:Int), V1:Int, V2:Int)
               => applyOp(Op,
                       deNormalizingInt(integerType(N:Int), normalizingInt(integerType(N:Int), V1)),
                       deNormalizingInt(integerType(N:Int), normalizingInt(integerType(N:Int), V2)))
         requires Op =/=K 'ugtOfIcmp(.KList) andBool Op =/=K 'ugeOfIcmp(.KList)
                  andBool Op =/=K 'ultOfIcmp(.KList) andBool Op =/=K 'uleOfIcmp(.KList)
    rule applyIcmp(Op:K, integerType(N:Int), V1:Int, V2:Int)
               => applyOp(Op,
                       normalizingInt(integerType(N:Int), V1),
                       normalizingInt(integerType(N:Int), V2))
         requires Op ==K 'ugtOfIcmp(.KList) orBool Op ==K 'ugeOfIcmp(.KList)
                  orBool Op ==K 'ultOfIcmp(.KList) orBool Op ==K 'uleOfIcmp(.KList)
    rule applyIcmp(Op:K, pointerTypeValue(T1:K, Addr:K),
              loc(A:Int, B:Int, C:K, D:K), loc(A':Int, B':Int, C':K, D':K))
               => applyOp(Op, A +Int B, A' +Int B')
    rule applyIcmp(Op:K, T:K, A:K, A':K) => poisonVal
         requires A ==K poisonVal orBool A' ==K poisonVal
    rule applyIcmp(Op:K, T:K, A:K, A':K) => undef
         requires (A ==K undef orBool A' ==K undef)
                   andBool A =/=K poisonVal
                   andBool A' =/=K poisonVal

    rule applyIcmps(Op:K, integerType(N:Int), .ElemList, .ElemList) => .ElemList
    rule applyIcmps(Op:K, vectorTypeValue(integerType(I:Int), N:Int),
                      vectorValue(Es:ElemList), vectorValue(Es':ElemList))
               => vectorValue(applyIcmps(Op, integerType(N:Int), Es, Es'))
    rule applyIcmps(Op:K, integerType(N:Int), (valValue(K:K),Es:ElemList)
                                       , (valValue(K':K),Es':ElemList))
               => valValue(applyIcmp(Op, integerType(N:Int), K, K')),
                                       applyIcmps(Op, integerType(N:Int), Es, Es')
    rule applyIcmps(Op:K, A:K, I1:K, I2:K) => applyInt(Op, A, I1, I2)        [owise]


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


    rule applySelect(Op:K, 0, A:K, B:K) => A
    rule applySelect(Op:K, I:Int, A:K, B:K) => B
         requires I =/=Int 0

    rule applySelects(Op:K, I:Int, operand(T:K, V:K), operand(T':K, V':K))
              => operand(T, applySelects(Op, I, V, V'))
    rule applySelects(Op:K, I:Int, vector(Es:ElemList), vector(Es':ElemList))
              => vector(applySelects(Op, I, Es, Es'))
    rule applySelects(Op:K, I:Int, .ElemList, .ElemList) => .ElemList
    rule applySelects(Op:K, I:Int, (val(A:K),Es:ElemList), (val(B:K),Es':ElemList))
              => val(applySelect(Op, I, A, B)),applySelects(Op, I, Es, Es')
    rule applySelects(Op:K, I:K, A:K, B:K)
              => applySelect(Op, I, A, B) [owise]


    syntax KItem ::= checkNuw(K, K)          [function]//type,  int value
                   | checkNsw(K, K, K)    [function]//type, int signed value, int value
    rule checkNuw(integerType(N:Int), V:Int) => V
         requires V <Int (2 ^Int N) andBool V >=Int 0
    rule checkNuw(integerType(N:Int), V:Int) => poisonVal
         requires V >=Int (2 ^Int N) orBool V <Int 0
    rule checkNuw(integerType(N:Int), V:K) => V
         requires getKLabel(V) ==KLabel 'poisonVal
                             orBool getKLabel(V) ==KLabel 'undef
    rule checkNuw(integerType(N:Int), .ElemList) => .ElemList
    rule checkNuw(integerType(N:Int), vectorValue(Es:ElemList))
            => vectorValue(checkNuw(integerType(N:Int), Es:ElemList))
    rule checkNuw(integerType(N:Int), valValue(K:K), Es:ElemList)
            => valValue(K), checkNuw(integerType(N:Int),  Es:ElemList)
         requires notBool isTheInt(K)
    rule checkNuw(integerType(N:Int), valValue(V:Int), Es:ElemList)
            => valValue(V), checkNuw(integerType(N:Int), Es:ElemList)
         requires V <Int (2 ^Int N) andBool V >=Int 0
    rule checkNuw(integerType(N:Int), valValue(V:Int), Es:ElemList)
            => valValue(poisonVal), checkNuw(integerType(N:Int), Es:ElemList)
         requires V >=Int (2 ^Int N) orBool V <Int 0

    rule checkNsw(integerType(N:Int), I1:Int, V:Int) => poisonVal
         requires I1 <Int (0 -Int (2 ^Int (N -Int 1))) orBool I1 >=Int (2 ^Int (N -Int 1))
    rule checkNsw(integerType(N:Int), I1:Int, V:Int) => V
         requires I1 >=Int (0 -Int (2 ^Int (N -Int 1))) andBool I1 <Int (2 ^Int (N -Int 1))
    rule checkNsw(integerType(N:Int), I1:K, V:K) => V
         requires getKLabel(V) ==KLabel 'poisonVal
                             orBool getKLabel(V) ==KLabel 'undef
    rule checkNsw(integerType(N:Int), I1:K, .ElemList) => .ElemList
    rule checkNsw(integerType(N:Int), I1:K, vectorValue(Es:ElemList))
            => vectorValue(checkNsw(integerType(N:Int), I1:K, Es:ElemList))
    rule checkNsw(integerType(N:Int), I1:K, valValue(V:K), Es:ElemList)
            => valValue(V), checkNsw(integerType(N:Int), I1:K, Es:ElemList)
         requires notBool isTheInt(V)

    rule checkNsw(integerType(N:Int), vectorValue(valValue(I1:Int), Is1:ElemList)
                                                           , valValue(V:Int), Es:ElemList)
            => valValue(poisonVal),
                   checkNsw(integerType(N:Int), vectorValue(valValue(I1:Int), Is1:ElemList)
                 , Es:ElemList)
         requires I1 <Int (0 -Int (2 ^Int (N -Int 1))) orBool I1 >=Int (2 ^Int (N -Int 1))

    rule checkNsw(integerType(N:Int), vectorValue(valValue(I1:Int), Is1:ElemList), valValue(V:Int), Es:ElemList)
            => valValue(V), checkNsw(integerType(N:Int), vectorValue(valValue(I1:Int), Is1:ElemList), Es:ElemList)
         requires I1 >=Int (0 -Int (2 ^Int (N -Int 1))) andBool I1 <Int (2 ^Int (N -Int 1))

    syntax Bool ::= isPowOfTwo(Int, Int)  [function]
    rule isPowOfTwo(A:Int, B:Int) => false
         requires A <Int B
    rule isPowOfTwo(A:Int, B:Int) => true
         requires A ==Int B
    rule isPowOfTwo(A:Int, B:Int) => isPowOfTwo(A, B *Int 2)
         requires A >Int B

    syntax Bool ::= isValidAlign(Int) [function]
    rule isValidAlign(A:Int) => isPowOfTwo(A, 1)

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
    rule guessNextBlock(switch(A:K, B:K, C:K, Es:ElemList)) => C
    rule guessNextBlock(indirectbr(A:K, val(B:K),Es:ElemList)) => B
    rule guessNextBlock(_:K) => .K [owise]

    syntax K ::= getValueFromBlockMap(Int, Map) [function]
    rule getValueFromBlockMap(N:Int, M:Map (N |-> I:K))
              => I ~> getValueFromBlockMap(N +Int 1, M)
    rule getValueFromBlockMap(N:Int, .Map)
              => .K

endmodule
