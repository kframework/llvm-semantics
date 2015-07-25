// Copyright (c) 2013-2015 K Team. All Rights Reserved.
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

    syntax List ::= StringToList(String) [function]
    rule StringToList("") => .List
    rule
        StringToList(S:String)
            => ListItem(String2Char(substrString(S:String, 0, 1)))
                StringToList(substrString(S:String, 1, lengthString(S:String)))
        when S =/=String ""


    // TODO many possible errors will slip by with this, but lots of stuff will work
    rule 'nullOfConstValueRef(.KList) => loc(-1, 0) [anywhere]

    syntax Int ::= base(Loc)
    rule base(loc(Base:Int, _)) => Base:Int
    
    syntax Int ::= offset(Loc)
    rule offset(loc(_, Offset:Int)) => Offset:Int
    
    syntax Loc ::= Loc "+" Int
    // TODO not checking for null
    
    rule loc(Base:Int, Offset:Int) + Offset':Int
            => loc(Base:Int, Offset:Int +Int Offset':Int)

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
    rule innerType(pointerType(K:K, _)) => K:K
    rule innerType(arrayType(K:K, _)) => K:K
    rule innerType(arrayTypeValue(K:K, _)) => K:K

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
    syntax Int ::= signed(K, K)
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
    rule isIntegerType(KLabel:KLabel(_)) => false
        when KLabel =/=KLabel 'integerType
    rule isIntegerType(_) => false [owise]

    syntax Bool ::= isFloatType(K) [function]
    rule isFloatType(F:FPType) => true
    rule isFloatType(x86_mmx) => true
    rule isFloatType(_) => false [owise]

    syntax Bool ::= isPointerType(K) [function]
    rule isPointerType(pointerType(_, _)) => true
    rule isPointerType(_) => false [owise]

    syntax Bool ::= isArrayType(K) [function]
    rule isArrayType(arrayType(_, _)) => true
    rule isArrayType(arrayTypeValue(_, _)) => true
    rule isArrayType(_) => false [owise]

    syntax Bool ::= isStructType(K)
    rule isStructType(structType(_)) => true
    rule isStructType(structTypeValue(_)) => true
    rule isStructType(_) => false [owise]

    // fixme size should depend on architecture
    rule sizeofInBits(pointerType(_, _)) => numBytesPerPointer *Int numBitsPerByte
    rule sizeofInBits(arrayType(Type:KResult, Len:Int)) => sizeofInBits(Type) *Int Len
    rule sizeofInBits(arrayTypeValue(Type:KResult, Len:Int)) => sizeofInBits(Type) *Int Len

    rule sizeofInBits(integerType(N:Int)) => N
    rule sizeofInBits(float) => 32
    rule sizeofInBits(double) => 64
    rule sizeofInBits(x86_fp80) => 80
    // TODO listK should be Fields (bug in K)
    rule sizeofInBits(structTypeValue(listK((ListItem(Type:KResult) L:List))))
      => sizeofInBits(Type) +Int sizeofInBits(structTypeValue(listK(L)))
    rule sizeofInBits(structTypeValue(listK(.List))) => 0
    rule sizeofInBits(structType(listK((ListItem(Type:KResult) L:List))))
      => sizeofInBits(Type) +Int sizeofInBits(structType(listK(L)))
    rule sizeofInBits(structType(listK(.List))) => 0

    syntax Int ::= sizeof(K) [function]
    rule sizeof(Type:KResult) => sizeofInBits(Type) /Int numBitsPerByte
        when numBitsPerByte dividesInt sizeofInBits(Type)

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
              => name(substrString(#tokenToString(L), 0
                    , lengthString(#tokenToString(L)) -Int 1))

    //useful function to turn a kitem into an elemList
    //here: add addNameToString to every position where it has type or valueref
    syntax KItem ::= doubleList(RetAttrs, FuncAttrs)
    syntax ElemList ::= formElemList(K) [function]

    rule formElemList('.InstructionMetadatas(.KList)) => .ElemList
    rule formElemList(, Mv:MetadataVar Mi:MetadataValueInt Ins:InstructionMetadatas)
              => val(Mv Mi),formElemList(Ins)
    rule formElemList(, Mv:MetadataVar ! { In:IndexList } Ins:InstructionMetadatas)
              => val(Mv ! { In }),formElemList(Ins)
    rule formElemList(.LabelValues) => .ElemList
    rule formElemList(label Va:ValueRef, Ls:LabelValues)
                    => val(Va),formElemList(Ls)
    rule formElemList(doubleList(.RetAttrs,.FuncAttrs)) => .ElemList
    rule formElemList(doubleList(.RetAttrs,F:FuncAttr Fs:FuncAttrs))
            => val(F),formElemList(doubleList(.RetAttrs,Fs))
    rule formElemList(doubleList(R:RetAttr Rs:RetAttrs,Fs:FuncAttrs))
            => val(R),formElemList(doubleList(Rs,Fs))
    rule formElemList(.ParamList) => .ElemList
    rule formElemList(Ty:Type Pa:ParamAttrs Va:ValueRef, Pl:ParamList)
            => val(arg(modifiers(formElemList(Pa)),
                     addNameToString(Ty),addNameToString(Va))),formElemList(Pl)
    rule formElemList(.ParamAttrs) => .ElemList
    rule formElemList(Pa:ParamAttr Ps:ParamAttrs) => val(Pa),formElemList(Ps)
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
            => val(operand(It,V)),formElemList(Ins)
    rule formElemList([ V1:ValueRef , V2:ValueRef ])
            => val(edge(V1,V2))
    rule formElemList([ V1:ValueRef , V2:ValueRef ] , Pl:PHIList)
            => val(edge(V1,V2)),formElemList(Pl)
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
    rule formElemList(K:K) => K [owise]

    syntax Cases ::= formCases(K) [function]

    rule formCases(.JumpTable) => .Cases
    rule formCases(It:IntType Ca:ConstValueRef,
                 label Va:ValueRef Cs:JumpTable)
                 => case(operand(It,Ca),Va), formCases(Cs)
    rule formCases(K:K) => K [owise]

    syntax ElemList ::= toCallees(ParamList) [function]

    rule toCallees(.ParamList) => .ElemList
    rule toCallees(Ty:Type Pa:ParamAttrs V:ValueRef,Pl:ParamList)
                => val(callee(operand(Ty,V),modifiers(formElemList(Pa)))),toCallees(Pl)

    syntax KItem ::= dealWithAllocaElem(AllocMetadata) [function]

    rule dealWithAllocaElem(Ty:Type) => alloca(Ty,1,'alignEmpty(.KList))
    rule dealWithAllocaElem(Ty:Type, A:Align) => alloca(Ty,1,A)
    rule dealWithAllocaElem(Ty:Type, It:IntType V:ValueRef)
                      => preAlloca(Ty,It,V,'alignEmpty(.KList))
    rule dealWithAllocaElem(Ty:Type, It:IntType V:ValueRef, A:Align)
                      => preAlloca(Ty,It,V,A)

    syntax SymbolicValueRef ::= addNameToString(K) [function]

    rule addNameToString(L:LocalName) => name(#tokenToString(L))
    rule addNameToString(G:GlobalName) => name(#tokenToString(G))
    rule addNameToString(K:K) => K [owise]

endmodule
