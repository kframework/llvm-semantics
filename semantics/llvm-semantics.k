// Copyright (c) 2013-2015 K Team. All Rights Reserved.
requires "llvm-syntax.k"
requires "llvm-abstractsyntax.k"
requires "llvm-settings.k"
requires "llvm-helpers.k"
requires "llvm-standard-library-syntax.k"
requires "llvm-syscalls-syntax.k"
requires "llvm-configuration.k"
requires "llvm-clean-tree.k"
requires "llvm-globals.k"
requires "llvm-registers.k"
requires "llvm-branching.k"
requires "llvm-phi.k"
requires "llvm-selection.k"
requires "llvm-start-and-stop.k"
requires "llvm-preprocessing.k"
requires "llvm-normalizing.k"
requires "llvm-declarations.k"
requires "llvm-call-ret.k"
requires "llvm-variadics.k"

module LLVM-ARITHMETIC
    imports LLVM-SYNTAX
    imports LLVM-ABSTRACTSYNTAX
    imports LLVM-SETTINGS
    imports LLVM-HELPERS
    imports LLVM-CONFIGURATION
    imports LLVM-STANDARD-LIBRARY-SYNTAX
    imports LLVM-SYSCALLS-SYNTAX

    rule <k> flagStage(T:K, I1:K, V:K) => flagStage2(T, I1, checkNuw(T, V)) ...</k>
         <currentModifiers> S:Set </currentModifiers>
         requires nuw in S
    rule <k> flagStage(T:K, I1:K, V:K) => flagStage2(T, I1, V) ...</k>
         <currentModifiers> S:Set </currentModifiers>
         requires notBool nuw in S
    rule <k> flagStage2(T:K, I1:K, V:K) => normalizingInt(T,checkNsw(T, I1, V)) ...</k>
         <currentModifiers> S:Set </currentModifiers>
         requires nsw in S
    rule <k> flagStage2(T:K,I1:K, V:K) => normalizingInt(T, V) ...</k>
         <currentModifiers> S:Set </currentModifiers>
         requires notBool nsw in S

    rule [add]:
        theAdd(Type:KResult, I1:KResult , I2:KResult)
            => flagStage(getIntType(Type), applyInts('add(.KList), getIntType(Type),
                             deNormalizingInt(getIntType(Type), normalizingInt(getIntType(Type), I1))
                                   , deNormalizingInt(getIntType(Type), normalizingInt(getIntType(Type), I2)))
                            , applyInts('add(.KList), getIntType(Type),
                             normalizingInt(getIntType(Type), I1), normalizingInt(getIntType(Type), I2)))
    rule [sub]:
        theSub(Type:KResult, I1:KResult , I2:KResult)
            => flagStage(getIntType(Type), applyInts('sub(.KList), getIntType(Type),
                             deNormalizingInt(getIntType(Type), normalizingInt(getIntType(Type), I1))
                                   , deNormalizingInt(getIntType(Type), normalizingInt(getIntType(Type), I2)))
                            , applyInts('sub(.KList), getIntType(Type),
                             normalizingInt(getIntType(Type), I1), normalizingInt(getIntType(Type), I2)))

    rule [mul]:
        theMul(Type:KResult, I1:KResult , I2:KResult)
            => flagStage(getIntType(Type), applyInts('mul(.KList), getIntType(Type),
                             deNormalizingInt(getIntType(Type), normalizingInt(getIntType(Type), I1))
                                   , deNormalizingInt(getIntType(Type), normalizingInt(getIntType(Type), I2)))
                            , applyInts('mul(.KList), getIntType(Type),
                             normalizingInt(getIntType(Type), I1), normalizingInt(getIntType(Type), I2)))

    rule [shl]:
        theShl(Type:KResult, I1:KResult , I2:KResult)
            => flagStage(getIntType(Type), applyInts('shl(.KList), getIntType(Type),
                             deNormalizingInt(getIntType(Type), normalizingInt(getIntType(Type), I1))
                                   , deNormalizingInt(getIntType(Type), normalizingInt(getIntType(Type), I2)))
                            , applyInts('shl(.KList), getIntType(Type),
                             normalizingInt(getIntType(Type), I1), normalizingInt(getIntType(Type), I2)))
        requires I2 <Int getIntInIntType(getIntType(Type))

    rule [shl-failed]:
        <k> theShl(Type:KResult, I1:KResult , I2:KResult) ~> K => .K </k>
         <output>... .List => ListItem("error: undefined behavior") </output>
        requires I2 >=Int getIntInIntType(getIntType(Type))

    rule [or]:
        theOr(Type:KResult, I1:KResult , I2:KResult)
            => applyInts('or(.KList), getIntType(Type),
                             normalizingInt(getIntType(Type), I1), normalizingInt(getIntType(Type), I2))

    rule [xor]:
        theXor(Type:KResult, I1:KResult , I2:KResult)
            => applyInts('xor(.KList), getIntType(Type),
                             normalizingInt(getIntType(Type), I1), normalizingInt(getIntType(Type), I2))

    rule [and]:
        theAnd(Type:KResult, I1:KResult , I2:KResult)
            => applyInts('and(.KList), getIntType(Type),
                             normalizingInt(getIntType(Type), I1), normalizingInt(getIntType(Type), I2))

    rule
        <k> theSDiv(Type:KResult, I1:Int, I2:Int)
            => signed(Type, (signed(Type, I1) /Int signed(Type, I2)))
        ...</k>
        when signed(Type, I2) =/=Int 0 // catch undefined
    rule
        <k> theUDiv(Type:KResult, I1:Int, I2:Int)
            => signed(Type, (unsigned(Type, I1) /Int unsigned(Type, I2)))
        ...</k>
        when unsigned(Type, I2) =/=Int 0 // catch undefined
    rule
        <k> theSRem(Type:KResult, I1:Int, I2:Int)
            => signed(Type, (signed(Type, I1) %Int signed(Type, I2)))
        ...</k>
        when signed(Type, I2) =/=Int 0 // catch undefined
    rule
        <k> theURem(Type:KResult, I1:Int, I2:Int)
            => signed(Type, (unsigned(Type, I1) %Int unsigned(Type, I2)))
        ...</k>
        when unsigned(Type, I2) =/=Int 0 // catch undefined

    rule
        <k> theLShr(Type:KResult, I:Int, Len:Int)
            => signed(Type, unsigned(Type, I) >>Int Len)
        ...</k>
        when Len >=Int 0
    rule
        <k> theAShr(Type:KResult, I:Int, Len:Int)
            => signed(Type, signed(Type, I:Int) >>Int Len)
        ...</k>
        when Len >=Int 0


    // weave into add
        // checkNSW(unsign(I1) +Int unsign(I2), Type)
        // ~> checkNUW(sign(I1) +Int sign(I2), Type)
    // before RHS

endmodule

module LLVM-FLOATING-POINT-ARITHMETIC
    imports LLVM-SYNTAX
    imports LLVM-ABSTRACTSYNTAX
    imports LLVM-SETTINGS
    imports LLVM-HELPERS
    imports LLVM-CONFIGURATION
    imports LLVM-STANDARD-LIBRARY-SYNTAX
    imports LLVM-SYSCALLS-SYNTAX

    rule
        <k> theFAdd(Type:KResult, F1:Float, F2:Float)
            => F1 +Float F2
        ...</k>

    rule
        <k> theFSub(Type:KResult, F1:Float, F2:Float)
            => F1 -Float F2
        ...</k>

    rule
        <k> theFMul(Type:KResult, F1:Float, F2:Float)
            => F1 *Float F2
        ...</k>

    // TODO incorrect since NaN * 0 = NaN
    rule theFMul(_, F:#Float, PositiveZero) => 0.0

endmodule

module LLVM-GEP
    imports LLVM-SYNTAX
    imports LLVM-ABSTRACTSYNTAX
    imports LLVM-SETTINGS
    imports LLVM-HELPERS
    imports LLVM-CONFIGURATION
    imports LLVM-STANDARD-LIBRARY-SYNTAX
    imports LLVM-SYSCALLS-SYNTAX

    syntax KItem ::= gep(K)    [strict]

    // TODO gep indices are supposed to be treated as signed (and can definitely use -1)
    rule
        <k> getElementPtr(Type:KResult, PtrVal:Loc, Indices:ElemList)
            => gep(Type)
        ...</k>
        (. =>
            <gepInfo>...
                // <gepType> Type </gepType>
                <gepResult> PtrVal </gepResult>
                <gepIndices> elemListToK(Indices) </gepIndices>
            ...</gepInfo>
        )

    rule
        <k> gep(_:KResult) => Loc ...</k>
        (
            <gepInfo>...
                <gepIndices> .K </gepIndices>
                <gepResult> Loc:Loc </gepResult>
            ...</gepInfo>
            => .
        )

    // rule <gepType> Type:KResult => Type </gepType>

    // TODO this is pretty ugly
    // these rules make sure the body of a pointer type is a result
    syntax KItem ::= "typing"
    //syntax KItem ::= evalPointerType(K, K) [strict(1)]
    
    //rule 'pointerType(T:K,, A:K) ~> gep => evalPointerType(T, A) ~> gep
         //when notBool 'isKResult(T)

    //rule evalPointerType(T:KResult, A:K) => 'pointerType(T,, A)

    rule
        <k> gep(pointerTypeValue(Type:KResult, _:K)) => gep(Type) ...</k>
        <gepIndices> I:Int => .K ...</gepIndices>
        <gepResult> PtrVal:Loc => PtrVal + (sizeof(Type) *Int I) </gepResult>

    rule
        <k> gep(arrayTypeValue(Type:KResult, _)) => gep(Type) ...</k>
        <gepIndices> N:Int => . ...</gepIndices>
        <gepResult> PtrVal:Loc => PtrVal + (sizeof(Type) *Int N) </gepResult>
        when N >=Int 0

    // WARNING TODO: _ may match more than one result (ask Traian)
    rule
        <k> gep(structTypeValue(listK(ListItem(Type:KResult) L:List => L))) ...</k>
        <gepIndices> N:Int => N -Int 1 ...</gepIndices>
        <gepResult> PtrVal:Loc => PtrVal + sizeof(Type) </gepResult>
        when N >Int 0

    rule
        <k> gep(structTypeValue(listK(ListItem(Type:KResult) L:List))) => gep(Type) ...</k>
        <gepIndices> 0 => . ...</gepIndices>

endmodule

module LLVM-HELPERS-SPLIT-BYTES
    imports LLVM-SYNTAX
    imports LLVM-ABSTRACTSYNTAX
    imports LLVM-SETTINGS
    imports LLVM-HELPERS
    imports LLVM-CONFIGURATION
    imports LLVM-STANDARD-LIBRARY-SYNTAX
    imports LLVM-SYSCALLS-SYNTAX

    syntax KItem ::= splitIntegerBytes(K, K, K) // value, numBytes, type
    syntax KItem ::= "splitIntegerBytes'" "(" K "," K "," List ")" // value, numbytes, accumulator
    syntax KItem ::= splitFloatBytes(K, K, K, List) // value, type, numBytes, accumulator
    syntax KItem ::= splitPointerBytes(K, K) // value, numBytes
    syntax KItem ::= "splitPointerBytes'" "(" K "," K "," K "," List ")" // value, numbytes, whichByte, accumulator
    syntax KItem ::= splitArrayBytes(K, K, K) [strict(3)] // value, numBytes, innertype
    syntax KItem ::= splitStructBytes(K, List) // value, field types
    syntax KItem ::= "splitStructBytes'" "(" K "," List "," List ")" // value, field types, accumulator


    // Type(IntegerType(32))
    // should generate list with LSBytes first
    rule
        <k> splitBytes(V:KResult, Type:KResult)
            => splitIntegerBytes(V, sizeof(Type), Type)
        ...</k>
        when isIntegerType(Type)

    rule
        <k> splitBytes(V:KResult, Type:KResult)
            => splitFloatBytes(V, Type, sizeof(Type), .List)
        ...</k>
        when isFloatType(Type)

    rule
        <k> splitBytes(V:KResult, Type:KResult)
            => splitPointerBytes(V, sizeof(Type))
        ...</k>
        when isPointerType(Type)

    rule
        <k> splitBytes(V:KResult, Type:KResult)
            => splitArrayBytes(V, sizeof(Type), innerType(Type))
        ...</k>
        when isArrayType(Type)

    rule
        <k> splitBytes(V:KResult, structTypeValue(listK(L:List)))
            => splitStructBytes(V, L)
        ...</k>

    rule
        <k> splitIntegerBytes(I:Int, NumBytes:Int, Type:KResult)
            => splitIntegerBytes'(unsigned(Type, I), NumBytes, .List)
        ...</k>
        when I:Int >=Int 0 orBool I:Int <=Int 0 // trying to avoid this case unless real int
    // TODO can possibly rewrite zeroinitializer to 0 here, and only have one case
    rule
        <k> splitIntegerBytes(zeroinitializer, NumBytes:Int, _)
            => splitIntegerBytes'(zeroinitializer, NumBytes, .List)
        ...</k>
    rule
        <k> splitIntegerBytes'(I:Int, NumBytes:Int, L:List)
            => splitIntegerBytes'(
                I >>Int numBitsPerByte,
                NumBytes -Int 1,
                (L ListItem(I &Int ((2 ^Int numBitsPerByte) -Int 1)))
            )
        ...</k>
        when NumBytes >Int 0

    rule
        <k> splitIntegerBytes'(zeroinitializer, NumBytes:Int, L:List)
            => splitIntegerBytes'(zeroinitializer, NumBytes -Int 1, (L ListItem(0)))
        ...</k>
        when NumBytes >Int 0
    // TODO: ideally, the parser should canonicalize integer literals to positive
    // TODO BUG no idea why i have to use "MyK" here instead of "K"....
    rule
        <k> splitIntegerBytes'(MyK:K, 0, L:List)
            => listK(L)
        ...</k>
        when MyK ==K 0
        orBool MyK ==K zeroinitializer

    rule
        <k> splitIntegerBytes(wvalist(VAList:List, Loc:Loc), 1, _)
            => listK(ListItem(wvalist(VAList:List, Loc:Loc)))
        ...</k>

    rule
        <k> splitFloatBytes(V:KResult, Type:KResult, 0, L:List)
            => listK(L)
        ...</k>

    // TODO perhaps a pattern: even more localized rewriting: rewriting inside a constructor rather than rewriting the whole thing
    rule
        <k> splitFloatBytes(
                V:KResult,
                Type:KResult,
                NumBytes:Int => NumBytes -Int 1,
                L:List => ListItem(floatByte(V, Type, NumBytes -Int 1)) L
            )
        ...</k>
        when NumBytes >Int 0

    rule
        <k> splitPointerBytes((zeroinitializer => 'nullOfConstValueRef(.KList)), _) ...</k>
    rule
        <k> splitPointerBytes(Loc:Loc, NumBytes:Int)
            => splitPointerBytes'(Loc:Loc, NumBytes, 0, .List)
        ...</k>
    rule
        <k> splitPointerBytes'(Loc:Loc, NumBytes:Int, N:Int, L:List)
            => splitPointerBytes'(Loc:Loc, NumBytes -Int 1, N:Int +Int 1, (L ListItem(ptrByte(Loc:Loc, N))))
        ...</k>
        when NumBytes >Int 0
    rule
        <k> splitPointerBytes'(Loc:Loc, 0, _, L:List)
            => listK(L)
        ...</k>

    rule
        <k> splitArrayBytes(arrayValue(L:List), NumBytes:Int, _)
            => listK(L)
        ...</k>
        when size(L) ==Int NumBytes

    rule
        <k> (.K => splitBytes(zeroinitializer, Type)) ~> splitArrayBytes(zeroinitializer, _, Type:KResult) ...</k>

    rule
        <k> listK(L:List) ~> splitArrayBytes(zeroinitializer, NumBytes:Int, Type:KResult)
            => listK((NumBytes /Int sizeof(Type)) copiesOf L:List)
        ...</k>
        when sizeof(Type) divInt NumBytes

    // TODO assumes no padding
    // TODO need to heat types
    // TODO BUG L'' causes latex to fail (generates L ' ')
    rule
        <k> splitStructBytes(V:KResult, L:List)
            => splitStructBytes'(V:KResult, L:List, .List)
        ...</k>
    rule
        <k> splitStructBytes'(constantStruct(K:K, listK(ListItem(V:KResult) Fields:List)),
                      (ListItem(Type:KResult) L:List), L':List)
            => splitBytes(V, Type)
            ~> splitStructBytes'(constantStruct(K:K, listK(Fields)), L:List, L':List)
        ...</k>
    rule
        <k> splitStructBytes'(zeroinitializer, (ListItem(Type:KResult) L:List), L':List)
            => splitBytes(zeroinitializer, Type)
            ~> splitStructBytes'(zeroinitializer, L:List, L':List)
        ...</k>
    rule
        <k> (listK(L:List) => .K) ~> splitStructBytes'(_, _, (_:List (.List => L))) ...</k>
    rule
        <k> splitStructBytes'(_, .List, L:List)
            => listK(L)
        ...</k>

endmodule

module LLVM-HELPERS-JOIN-BYTES
    imports LLVM-SYNTAX
    imports LLVM-ABSTRACTSYNTAX
    imports LLVM-SETTINGS
    imports LLVM-HELPERS
    imports LLVM-CONFIGURATION
    imports LLVM-STANDARD-LIBRARY-SYNTAX
    imports LLVM-SYSCALLS-SYNTAX

    syntax KItem ::= joinIntBytes(K, K, K, K)
    syntax KItem ::= joinFloatBytes(K, K, K)
    syntax KItem ::= joinPointerBytes(K, K, K)

    rule
        <k> joinBytes(V:KResult, Type:KResult)
            => joinIntBytes(V:KResult, sizeof(Type), 0, Type)
        ...</k>
        when isIntegerType(Type)

    rule
        <k> joinBytes(V:KResult, Type:KResult)
            => joinFloatBytes(V:KResult, sizeof(Type), 0)
        ...</k>
        when isFloatType(Type)

    rule
        <k> joinBytes(V:KResult, Type:KResult)
            => joinPointerBytes(V:KResult, sizeof(Type), 0)
        ...</k>
        when isPointerType(Type)

    rule
        <k> joinIntBytes(listK(L:List ListItem(N:Int)), Len:Int, N':Int, Type:KResult)
            => joinIntBytes(listK(L:List), Len:Int -Int 1,
                           (N':Int <<Int numBitsPerByte) |Int N:Int, Type:KResult)
        ...</k>
        when Len >Int 0 andBool N' >=Int 0 andBool N >=Int 0

    rule joinIntBytes(listK(.List), 0, N:Int, Type:KResult)
        => signed(Type, N:Int)
        when N >=Int 0
        [anywhere]

    rule joinIntBytes(listK(.List), 0, wvalist(VAList:List, Loc:Loc), Type:KResult)
        => wvalist(VAList:List, Loc:Loc)
        [anywhere]

    // TODO BAD
    rule
        <k> joinFloatBytes(listK(ListItem(floatByte(F:Float, _, _)) _), _, _)
            => F
        ...</k>

    rule
        <k> joinPointerBytes(listK((L:List ListItem(ptrByte(Loc:Loc, N:Int)))), Len:Int, N':Int)
            => joinPointerBytes(listK(L:List), Len:Int -Int 1, 
                          (N':Int <<Int numBitsPerByte) |Int ptrByte(Loc:Loc, N:Int))
        ...</k>
        when Len >Int 0 andBool N >=Int 0 andBool N' >=Int 0

    rule joinPointerBytes(listK(.List), 0, Loc:Loc)
        => Loc:Loc
        [anywhere]

    // crazy stuff to reassemble pointer
    syntax Int ::= ptrBytes(K, K, K)
    //rule 'isInt(ptrBytes(_, _, _)) => true
    
    rule
        0 |Int ptrByte(V:KResult, N:Int)
            => ptrByte(V:KResult, N:Int)
        [anywhere]
    rule
        (ptrByte(V:KResult, SNatN:Int) <<Int Len:Int) |Int ptrByte(V:KResult, N:Int)
            => ptrBytes(V:KResult, N:Int, SNatN:Int)
        when Len ==Int numBitsPerByte
        andBool SNatN ==Int N +Int 1
        andBool N >=Int 0
        [anywhere]
    rule
        (ptrBytes(V:KResult, SNatN:Int, N':Int) <<Int Len:Int) |Int ptrByte(V:KResult, N:Int)
            => ptrBytes(V:KResult, N:Int, N':Int)
        when SNatN ==Int N +Int 1 andBool N' >=Int 0
             andBool N >=Int 0 andBool Len >=Int 0 
        [anywhere]
    rule
        ptrBytes(V:KResult, 0, N:Int)
            => V
        when N ==Int numBytesPerPointer -Int 1
        [anywhere]

endmodule

module LLVM-MEMORY
    imports LLVM-SYNTAX
    imports LLVM-ABSTRACTSYNTAX
    imports LLVM-SETTINGS
    imports LLVM-HELPERS
    imports LLVM-CONFIGURATION
    imports LLVM-STANDARD-LIBRARY-SYNTAX
    imports LLVM-SYSCALLS-SYNTAX

    syntax KItem ::= "nextSym" Loc [function]

    rule nextSym loc(N:Int, 0, Limit:Int, Align:Int)
                                       => loc(N:Int +Int Align, 0, Limit, Align)
         requires Align >Int Limit andBool isPowOfTwo(Align, 1) andBool Limit >Int 0
    rule nextSym loc(N:Int, 0, Limit:Int, Align:Int)
                                       => loc(N:Int +Int Limit, 0, Limit, Align)
         requires Align <=Int Limit

    rule preAlloca(Ty:K, Type:KResult, N:Int, Al:OptAlign)
              => alloca(Ty,sizeof(Type) *Int N, Al:OptAlign) [structural]


    //use to alloc the memory for gloable variables.
    rule
        <k> globalAlloca(Type:KResult, N:Int, Al:OptAlign)
                          => value(pointerTypeValue(Type, 'addrEmpty(.KList)) ,Loc) ...</k>
        (.Bag =>
            <object>...
                <basePtr> base(Loc) </basePtr>
                <type> Type </type>
                <size> sizeof(Type) *Int N </size>
            ...</object>
        )
        <nextLoc> Loc:Loc => nextSym Loc </nextLoc>

    rule
        <k> alloca(Type:KResult, N:Int, Al:OptAlign)
                          => value(pointerTypeValue(Type, 'addrEmpty(.KList)) ,Loc) ...</k>
        (.Bag =>
            <object>...
                <basePtr> base(Loc) </basePtr>
                <type> Type </type>
                <size> sizeof(Type) *Int N </size>
            ...</object>
        )
        <localMemory>... .List => ListItem(base(Loc)) </localMemory>
        <nextLoc> Loc:Loc => nextSym Loc </nextLoc>

    //TODO: store must save to a pointer type
    rule
        <k> store(Type:KResult, V:KResult, Loc:Loc)
            => write(Type:KResult, V:KResult, Loc:Loc)
        ...</k>

    syntax KItem ::= writeBytes(K, K) [strict(1)] // list of bytes, location

    rule write(Type:KResult, V:KResult, Loc:Loc)
            => writeBytes(splitBytes(V, Type), Loc)
    // rule
        // <k> writeBytes(listK((N:Int,, L:KList)), Base:Int +Int Offset:Int)
        // <basePtr> Base:Int </basePtr>
        // <bytes> M:Map => M:Map[unknownByte / Offset:Int] </bytes>
        // when notBool Offset in keys(M:Map)

    // TODO similar problem as sNat; want to match through a deconstructor
    rule
        <k> writeBytes(listK((ListItem(N:Int) L:List)), loc(Base:Int, Offset:Int, Limit:Int, Align:Int))
            => writeBytes(listK(L:List), loc(Base:Int, Offset:Int, Limit, Align) + 1)
        ...</k>
        <basePtr> Base:Int </basePtr>
        <bytes> M:Map => M:Map[Offset <- N] </bytes>
        requires Offset <Int Limit
        // <size> Len:Int </size>
        // when Offset < Len
        // i guess


    rule
        <k> writeBytes(listK((ListItem(N:Int) L:List)), loc(Base:Int, Offset:Int, Limit:Int, Align:Int)) ~> K:K
            => .K </k>
        <output>... .List => ListItem("error: undefined behavior") </output>
        requires Offset >=Int Limit

    rule
        <k> writeBytes(listK((ListItem(N:Int) L:List)), loc(Base:Int, Offset:Int, undef, undef)) ~> K:K
            => .K </k>
        <output>... .List => ListItem("error: undefined behavior") </output>

    rule writeBytes(listK(.List), _) => .K

    rule
        <k> load('pointerType(TyK:K,, A:K), Loc:Loc)
            => read(TyK:K, Loc:Loc)
        ...</k>


    rule read(Type:KResult, Loc:Loc)
            => joinBytes(readBytes(sizeof(Type:KResult), Loc:Loc), Type:KResult)

    rule readBytes(Len:Int, Loc:Loc)
            => readBytes'(Len:Int, Loc:Loc, .List)

    rule
        <k> readBytes'(Len:Int, loc(Base:Int, Offset:Int, Limit:Int, Align:Int), L:List)
            => readBytes'(Len:Int -Int 1, loc(Base:Int, Offset:Int, Limit, Align) + 1, (L:List ListItem(V:KResult)))
        ...</k>
        <basePtr> Base:Int </basePtr>
        <bytes>... Offset |-> V:KResult ...</bytes>
        when Len:Int >Int 0 andBool Offset <Int Limit

    rule
        <k> readBytes'(Len:Int, loc(Base:Int, Offset:Int, Limit:Int, Align:Int), L:List) ~> K:K
            => .K </k>
        <output>... .List => ListItem("error: undefined behavior") </output>
        requires Limit >=Int Offset

    rule
        <k> readBytes'(Len:Int, loc(Base:Int, Offset:Int, undef, undef), L:List) ~> K:K
            => .K </k>
        <output>... .List => ListItem("error: undefined behavior") </output>

    rule readBytes'(0, _, L:List)
            => listK(L)

    syntax KItem ::= readBytes(K, K)
    syntax KItem ::= "readBytes'" "(" K "," K "," List ")"

endmodule

module LLVM-COMPARISONS
    imports LLVM-SYNTAX
    imports LLVM-ABSTRACTSYNTAX
    imports LLVM-SETTINGS
    imports LLVM-HELPERS
    imports LLVM-CONFIGURATION
    imports LLVM-STANDARD-LIBRARY-SYNTAX
    imports LLVM-SYSCALLS-SYNTAX

    // all of these take place only at the top of K
    // TODO these break with ==Int or =/=Int
    rule iNotEq(Type:KResult, I1:Int, I2:Int)
        => boolToInt(unsigned(Type, I1) =/=K unsigned(Type, I2))
    rule iEq(Type:KResult, I1:Int, I2:Int)
        => boolToInt(unsigned(Type, I1) ==K unsigned(Type, I2))
    rule uGT(Type:KResult, I1:Int, I2:Int) => boolToInt(unsigned(Type, I1:Int) >Int unsigned(Type, I2:Int))
    rule uGE(Type:KResult, I1:Int, I2:Int) => boolToInt(unsigned(Type, I1:Int) >=Int unsigned(Type, I2:Int))
    rule uLT(Type:KResult, I1:Int, I2:Int) => boolToInt(unsigned(Type, I1:Int) <Int unsigned(Type, I2:Int))
    rule uLE(Type:KResult, I1:Int, I2:Int) => boolToInt(unsigned(Type, I1:Int) <=Int unsigned(Type, I2:Int))
    rule sGT(Type:KResult, I1:Int, I2:Int) => boolToInt(signed(Type, I1:Int) >Int signed(Type, I2:Int))
    rule sGE(Type:KResult, I1:Int, I2:Int) => boolToInt(signed(Type, I1:Int) >=Int signed(Type, I2:Int))
    rule sLT(Type:KResult, I1:Int, I2:Int) => boolToInt(signed(Type, I1:Int) <Int signed(Type, I2:Int))
    rule sLE(Type:KResult, I1:Int, I2:Int) => boolToInt(signed(Type, I1:Int) >=Int signed(Type, I2:Int))

    rule iNotEq(Type:KResult, Loc1:Loc, Loc2:Loc)
        => boolToInt(unsigned(Type, Loc1:Loc) =/=K unsigned(Type, Loc2:Loc))
    rule iEq(Type:KResult, Loc1:Loc, Loc2:Loc)
        => boolToInt(unsigned(Type, Loc1:Loc) ==K unsigned(Type, Loc2:Loc))
    rule uGT(Type:KResult, Loc1:Loc, Loc2:Loc) => boolToInt(unsigned(Type, Loc1:Loc) >Int unsigned(Type, Loc2:Loc))
    rule uGE(Type:KResult, Loc1:Loc, Loc2:Loc) => boolToInt(unsigned(Type, Loc1:Loc) >=Int unsigned(Type, Loc2:Loc))
    rule uLT(Type:KResult, Loc1:Loc, Loc2:Loc) => boolToInt(unsigned(Type, Loc1:Loc) <Int unsigned(Type, Loc2:Loc))
    rule uLE(Type:KResult, Loc1:Loc, Loc2:Loc) => boolToInt(unsigned(Type, Loc1:Loc) <=Int unsigned(Type, Loc2:Loc))
    rule sGT(Type:KResult, Loc1:Loc, Loc2:Loc) => boolToInt(signed(Type, Loc1:Loc) >Int signed(Type, Loc2:Loc))
    rule sGE(Type:KResult, Loc1:Loc, Loc2:Loc) => boolToInt(signed(Type, Loc1:Loc) >=Int signed(Type, Loc2:Loc))
    rule sLT(Type:KResult, Loc1:Loc, Loc2:Loc) => boolToInt(signed(Type, Loc1:Loc) <Int signed(Type, Loc2:Loc))
    rule sLE(Type:KResult, Loc1:Loc, Loc2:Loc) => boolToInt(signed(Type, Loc1:Loc) >=Int signed(Type, Loc2:Loc))

    // TODO not handling QNAN
    rule oEQ(Type:KResult, F1:Float, F2:Float)
        => boolToInt(F1:Float ==Float F2:Float)
    rule oGT(Type:KResult, F1:Float, F2:Float)
        => boolToInt(F1:Float >Float F2:Float)
    rule oGE(Type:KResult, F1:Float, F2:Float)
        => boolToInt(F1:Float >=Float F2:Float)
    rule oLT(Type:KResult, F1:Float, F2:Float)
        => boolToInt(F1:Float <Float F2:Float)
    rule oLE(Type:KResult, F1:Float, F2:Float)
        => boolToInt(F1:Float <=Float F2:Float)
    rule oNE(Type:KResult, F1:Float, F2:Float)
        => boolToInt(F1:Float =/=Float F2:Float)
    // rule ORD(Type:KResult, F1:Float, F2:Float)
        // => // if both are not QNAN
    rule uEQ(Type:KResult, F1:Float, F2:Float)
        => boolToInt(F1:Float ==Float F2:Float)
    rule uGT(Type:KResult, F1:Float, F2:Float)
        => boolToInt(F1:Float >Float F2:Float)
    rule uGE(Type:KResult, F1:Float, F2:Float)
        => boolToInt(F1:Float >=Float F2:Float)
    rule uLT(Type:KResult, F1:Float, F2:Float)
        => boolToInt(F1:Float <Float F2:Float)
    rule uLE(Type:KResult, F1:Float, F2:Float)
        => boolToInt(F1:Float <=Float F2:Float)
    rule uNE(Type:KResult, F1:Float, F2:Float)
        => boolToInt(F1:Float =/=Float F2:Float)
    // rule UNO(Type:KResult, F1:Float, F2:Float)
        // => if either is QNAN

    syntax KItem ::= boolToInt(K)
    rule boolToInt(true) => 1
    rule boolToInt(false) => 0

endmodule

module LLVM-CONVERSIONS
    imports LLVM-SYNTAX
    imports LLVM-ABSTRACTSYNTAX
    imports LLVM-SETTINGS
    imports LLVM-HELPERS
    imports LLVM-CONFIGURATION
    imports LLVM-STANDARD-LIBRARY-SYNTAX
    imports LLVM-SYSCALLS-SYNTAX

    rule [trunc]:
        theTrunc(Type:KResult, I:KResult, Type2:KResult)
                  => applyCasts(trunc, getIntType(Type),
                             normalizingInt(getIntType(Type), I), getIntType(Type2))
    rule [zext]:
        theZExt(Type:KResult, I:KResult, Type2:KResult)
                  => applyCasts(sext, getIntType(Type),
                             normalizingInt(getIntType(Type), I), getIntType(Type2))

    rule [sext]:
        theSExt(Type:KResult, I:KResult, Type2:KResult)
                  => applyCasts(sext, getIntType(Type),
                             normalizingInt(getIntType(Type), I), getIntType(Type2))

    // TODO need to normalize here
    rule
        <k> theBitCast(_, I:Int, _) => I:Int ...</k>
    rule
        <k> theBitCast(_, Loc:Loc, _) => Loc:Loc ...</k>

    //rule
        //<k> BitCast(IntegerType(_), F:#Float) => Float2Int(F) ...</k>

    // TODO need to normalize here
    rule
        <k> theIntToPtr(Type:KResult, K:K, Type2:KResult) => intToPtrOfLoc(Type, K:K) ...</k>
    rule
        <k> thePtrToInt(Type:KResult, K:K, Type2:KResult) => ptrToIntOfLoc(Type, K:K) ...</k>

    // TODO needs side conditions
    rule intToPtrOfLoc(Type:KResult, intToPtrOfLoc(Type':KResult, K:K)) => K:K [anywhere]
    rule ptrToIntOfLoc(Type:KResult, ptrToIntOfLoc(Type':KResult, K:K)) => K:K [anywhere]

    rule unsigned(Type:KResult, Loc:Loc)
        => ptrToIntOfLoc(Type, Loc:Loc)
        [anywhere]
    rule signed(Type:KResult, Loc:Loc)
        => ptrToIntOfLoc(Type, Loc:Loc)
        [anywhere]
    rule unsigned(_, ptrToIntOfLoc(Type:KResult, K:K))
        => ptrToIntOfLoc(Type, K:K)
    rule signed(_, ptrToIntOfLoc(Type:KResult, K:K))
        => ptrToIntOfLoc(Type, K:K)

    // definitely misses problems with null
    // TODO assumes types are same and are big enough
/*
    rule ptrToIntOfLoc(_, loc(I:Int, Offset:Int)) >Int ptrToIntOfLoc(_, loc(I:Int, Offset':Int))
        => Offset >Int Offset'
        [anywhere]
    rule ptrToIntOfLoc(_, loc(I:Int, Offset:Int)) >=Int ptrToIntOfLoc(_, loc(I:Int, Offset':Int))
        => Offset >=Int Offset'
        [anywhere]
    rule ptrToIntOfLoc(_, loc(I:Int, Offset:Int)) <Int ptrToIntOfLoc(_, loc(I:Int, Offset':Int))
        => Offset <Int Offset'
        [anywhere]
    rule ptrToIntOfLoc(_, loc(I:Int, Offset:Int)) <=Int ptrToIntOfLoc(_, loc(I:Int, Offset':Int))
        => Offset <=Int Offset'
        [anywhere]
    rule ptrToIntOfLoc(Type:KResult, loc(I:Int, Offset:Int))
                  -Int ptrToIntOfLoc(Type:KResult, loc(I:Int, Offset':Int))
        => signed(Type, Offset -Int Offset')
        [anywhere]
*/
    rule
        <k> theFpToSI(Type:KResult, F:Float, Type2:KResult)
            => signed(Type, Float2Int(F))
        ...</k>

    rule
        <k> theFpToUI(Type:KResult, F:Float, Type2:KResult)
            => unsigned(Type, Float2Int(F))
        ...</k>

endmodule

module LLVM-LITERALS
    imports LLVM-SYNTAX
    imports LLVM-ABSTRACTSYNTAX
    imports LLVM-SETTINGS
    imports LLVM-HELPERS
    imports LLVM-CONFIGURATION
    imports LLVM-STANDARD-LIBRARY-SYNTAX
    imports LLVM-SYSCALLS-SYNTAX

    rule float(S) => String2Float(S)
    //when String2Float(S) >=Float String2Float(S)
        // TODO when 'isFloat(String2Float(S))

    rule
        <k> c S:StringName
            => arrayValue(StringToList(#tokenToString(S)))
        ...</k>

    rule
        <k> constantArray(Type:KResult, listK(L:List))
            => createArrayValue(Type, L)
        ...</k>

    syntax KItem ::= createArrayValue(K, List)
    syntax KItem ::= "createArrayValue'" "(" K "," List "," List ")"
    syntax KItem ::= "createArrayValue''" "(" K "," List "," K "," List ")" [strict(3)]

    rule
        <k> createArrayValue(Type:KResult, L:List)
            => createArrayValue'(Type:KResult, L:List, .List)
        ...</k>
    rule
        <k> createArrayValue'(Type:KResult, (ListItem(K:K) L:List), L':List)
            => createArrayValue''(Type:KResult, L:List, splitBytes(K, Type), L':List)
        ...</k>
    rule
        <k> createArrayValue''(Type:KResult, L:List, listK(Bytes:List), L':List)
            => createArrayValue'(Type:KResult, L:List, (L' Bytes))
        ...</k>
    rule
        <k> createArrayValue'(_, .List, L:List)
            => arrayValue(L)
        ...</k>

endmodule

module LLVM-STANDARD-LIBRARY-PREPROCESS
    imports LLVM-SYNTAX
    imports LLVM-ABSTRACTSYNTAX
    imports LLVM-SETTINGS
    imports LLVM-HELPERS
    imports LLVM-CONFIGURATION
    imports LLVM-STANDARD-LIBRARY-SYNTAX
    imports LLVM-SYSCALLS-SYNTAX

    /////////////////////////////////////////////////////////
    // turning calls to intrinsics into semantic productions
    // perhaps this kind of stuff could be generalized, or done away with
    // its purpose is to make the actual function definitions nice

    rule
        // TODO why doesn't this work?
        // <k> Call(_, Callee(funptr(Name(globalVar, S:String)), listK(L:KList)))
            // => 'memcpy`(_`,_`,_`,_`,_`)(L)
        <k> call(_, calleeValue(funptr(name(globalVar, S:String)), (valValue(V1:KResult),
                   valValue(V2:KResult), valValue(V3:KResult), valValue(V4:KResult), valValue(V5:KResult))))
            => memcpy(V1, V2, V3, V4, V5)
        ...</k>
        when substrString(S, 0, 12) ==String "llvm.memcpy."

    rule
        <k> call(_, calleeValue(funptr(name(globalVar, S:String)), (valValue(V1:KResult),
                  valValue(V2:KResult), valValue(V3:KResult), valValue(V4:KResult), valValue(V5:KResult))))
            => memset(V1, V2, V3, V4, V5)
        ...</k>
        when substrString(S, 0, 12) ==String "llvm.memset."

    rule
        <k> call(_, calleeValue(funptr(name(globalVar, "llvm.lifetime.start")), (valValue(V1:KResult),
                   valValue(V2:KResult))))
            => lifetimeStart(V1, V2)
        ...</k>

    rule
        <k> call(_, calleeValue(funptr(name(globalVar, "__libc_start_main_0")), (valValue(V1:KResult),
                   Vl:ElemList)))
            => call(i(32), callee(V1,arguments(.ElemList)))
        ...</k>

    rule
        <k> call(_, calleeValue(funptr(name(globalVar, "__libc_start_main_2")), (valValue(V1:KResult),
                   Vl:ElemList)))
            => call(i(32), callee(V1,arguments(.ElemList)))
        ...</k>

    rule
        <k> call(_, calleeValue(funptr(name(globalVar, "llvm.lifetime.end")), (valValue(V1:KResult),
                  valValue(V2:KResult))))
            => lifetimeEnd(V1, V2)
        ...</k>

    rule
        <k> call(_, calleeValue(funptr(name(globalVar, "llvm.va_start")), (valValue(V1:KResult))))
            => vaStart(V1)
        ...</k>

    rule
        <k> call(_, calleeValue(funptr(name(globalVar, "llvm.va_copy")), (valValue(V1:KResult),
                  valValue(V2:KResult))))
            => vaCopy(V1, V2)
        ...</k>

    rule
        <k> call(_, calleeValue(funptr(name(globalVar, "llvm.va_end")), _))
            => .K
        ...</k>

    rule
        <k> call(_, calleeValue(funptr(name(globalVar, "exit")), _))
            => .K
        ...</k>

endmodule

module LLVM-STANDARD-LIBRARY
    imports LLVM-SYNTAX
    imports LLVM-ABSTRACTSYNTAX
    imports LLVM-SETTINGS
    imports LLVM-HELPERS
    imports LLVM-CONFIGURATION
    imports LLVM-STANDARD-LIBRARY-SYNTAX
    imports LLVM-SYSCALLS-SYNTAX

    // memcpy
    rule
        <k> memcpy(Dest:Loc, Src:Loc, Len:Int, K1:K, K2:K)
            => store(byteType, load('pointerType(byteType,, 0), Src), Dest)
            ~> memcpy(Dest + 1, Src + 1, Len -Int 1, K1, K2)
        ...</k>
        when Len >Int 0
    rule
        <k> memcpy(_, _, 0, _, _) => .K ...</k>

    // memset
    rule
        <k> memset(Dest:Loc, N:Int, Len:Int, K1:K, K2:K)
            => store(byteType, N, Dest)
            ~> memset(Dest + 1, N, Len -Int 1, K1, K2)
        ...</k>
        when Len >Int 0
    rule
        <k> memset(_, _, 0, _, _) => .K ...</k>

    // lifetimeStart
    // don't need to do anything for positive semantics
    rule
        <k> lifetimeStart(_, _) => .K ...</k>

    // lifetimeEnd
    // don't need to do anything for positive semantics
    rule
        <k> lifetimeEnd(_, _) => .K ...</k>

    //@ Variadic intrinsics
    rule
        <k> vaStart(Loc:Loc) => write(i(numBitsPerByte), wvalist(VAList, Loc), Loc) ...</k>
        <valist> VAList:List </valist>

    rule
        <k> vaCopy(Loc1:Loc, Loc2:Loc)
            => write(i(numBitsPerByte), read(i(numBitsPerByte), Loc2), Loc1)
        ...</k>

endmodule

module LLVM-SYSCALLS-PREPROCESS
    imports LLVM-SYNTAX
    imports LLVM-ABSTRACTSYNTAX
    imports LLVM-SETTINGS
    imports LLVM-HELPERS
    imports LLVM-CONFIGURATION
    imports LLVM-STANDARD-LIBRARY-SYNTAX
    imports LLVM-SYSCALLS-SYNTAX

    rule
        <k> call(_, calleeValue(funptr(name(globalVar, "__syscall")), (valValue(N:Int), L:ElemList)))
            => (syscallHandler(N))(L)
        ...</k>
endmodule

module LLVM-SYSCALLS
    imports LLVM-SYNTAX
    imports LLVM-ABSTRACTSYNTAX
    imports LLVM-SETTINGS
    imports LLVM-HELPERS
    imports LLVM-CONFIGURATION
    imports LLVM-STANDARD-LIBRARY-SYNTAX
    imports LLVM-SYSCALLS-SYNTAX

    rule <k> 'sys-ioctl(_) => 0 ...</k>
    rule <k> 'sys-rt-sigprocmask(_) => 0 ...</k>
    rule <k> 'sys-gettid(_) => 0 ...</k>

    //there might be a problem here. about the sort of brk cell.
    rule
        <k> 'sys-brk(ptrToIntOfLoc(_,Loc:Loc),, _) => Brk ...</k>
        <brk> Brk:Loc </brk>
        when Loc ==K 'nullOfConstValueRef(.KList)


    // TODO krun should provide this value
    rule <k> 'sys-getpid(_) => 10000 ...</k>

    syntax KItem ::= printString(K) [strict]
    syntax KItem ::= readString(K, K)
    syntax KItem ::= "readString'" "(" K "," K "," K ")"

    rule
        <k> 'sys-write(FileDesc:Int,, ptrToIntOfLoc(_, Loc:Loc),, Len:Int,, _)
            => printString(readString(Loc, Len))
        ...</k>
        when Len >=Int 0

    rule
        <k> readString(Loc:Loc, Len:Int)
            => readString'(Loc, Len, "")
        ...</k>
        when Len >=Int 0

    rule
        <k> (. => read(i(8), Loc))
            ~> readString'(Loc:Loc, I:Int, _)
        ...</k>
        when I >Int 0

    rule <k> readString'(_, 0, S:String) => S ...</k>

    rule
        <k> (I:Int => .)
            ~> readString'(
                (Loc:Loc => Loc + 1),
                (N:Int => N -Int 1),
                (S:String => S +String Int2String(unsigned(i(8), I)))
            )
        ...</k>
        when N >Int 0

    rule <k> printString(S:String) => lengthString(S) ...</k>
         <output>... .List => ListItem(S) </output>

endmodule

module LLVM-INTERNAL-TESTING-FUNCTIONS
    // do not include this module when printing
    // TODO add to makefile's grep to look for line like above when excluding modules
    imports LLVM-SYNTAX
    imports LLVM-ABSTRACTSYNTAX
    imports LLVM-SETTINGS
    imports LLVM-HELPERS
    imports LLVM-CONFIGURATION
    imports LLVM-STANDARD-LIBRARY-SYNTAX
    imports LLVM-SYSCALLS-SYNTAX

    rule
        <k> call(_, calleeValue(funptr(name(globalVar, S:String)), (valValue(I:Int))))
            => .K
        ...</k>
        <output>... .List => ListItem(Int2String(I) +String "\n") </output>
        when substrString(S, 0, 13) ==String "__fsl.print.i"
        andBool (I >=Int 0 orBool I <=Int 0) // real integer
endmodule

module LLVM-EXCEPTIONS
    imports LLVM-SYNTAX
    imports LLVM-ABSTRACTSYNTAX
    imports LLVM-SETTINGS
    imports LLVM-HELPERS
    imports LLVM-CONFIGURATION
    imports LLVM-STANDARD-LIBRARY-SYNTAX
    imports LLVM-SYSCALLS-SYNTAX


/*
    rule
        <k> Call(_, calleeValue(funptr(Name(globalVar, "__cxa")), listK(V1:KResult,, V2:KResult)))
            => @__cxa_allocate_exception
        ...</k>
*/
endmodule

module LLVM-SEMANTICS
    imports LLVM-SYNTAX
    imports LLVM-ABSTRACTSYNTAX
    imports LLVM-SETTINGS
    imports LLVM-HELPERS
    imports LLVM-CONFIGURATION
    imports LLVM-STANDARD-LIBRARY-SYNTAX
    imports LLVM-SYSCALLS-SYNTAX
    imports LLVM-CLEAN-TREE
    imports LLVM-GLOBALS
    imports LLVM-REGISTERS
    imports LLVM-BRANCHING
    imports LLVM-PHI
    imports LLVM-SELECTION
    imports LLVM-START-AND-STOP
    imports LLVM-DECLARATIONS
    imports LLVM-PREPROCESSING
    imports LLVM-NORMALIZING
    imports LLVM-CALL-RET
    imports LLVM-VARIADICS
    imports LLVM-ARITHMETIC

    imports LLVM-FLOATING-POINT-ARITHMETIC
    imports LLVM-GEP

    imports LLVM-HELPERS-SPLIT-BYTES

    imports LLVM-HELPERS-JOIN-BYTES

    imports LLVM-MEMORY

    imports LLVM-COMPARISONS
    imports LLVM-CONVERSIONS

    imports LLVM-LITERALS
    imports LLVM-STANDARD-LIBRARY-PREPROCESS
    imports LLVM-STANDARD-LIBRARY

    imports LLVM-SYSCALLS-PREPROCESS
    imports LLVM-SYSCALLS

    imports LLVM-INTERNAL-TESTING-FUNCTIONS
    imports LLVM-EXCEPTIONS
endmodule
