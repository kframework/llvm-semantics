//
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

    rule [int-arith]:
        <k> Op:KLabel(Type:KResult,, I1:KResult,, I2:KResult)
            => flagStage(toIntOp(Op), applyInts(toIntOp(Op),
                                Type, I1, I2, S, .ElemList)) ...</k>
        <currentModifiers> S:Set </currentModifiers>
        requires isIntOp(Op(Type,, I1,, I2))

    rule flagStage(Op:K, V:KResult) => V
         requires V =/=K badValue

    rule [udiv-failed]:
        <k> flagStage(udiv, badValue) ~> K:K => .K </k>
        <output>... .List => ListItem("error: udiv by zero undefined behavior") </output>

    rule [sdiv-failed]:
        <k> flagStage(sdiv, badValue) ~> K:K => .K </k>
        <output>... .List => ListItem("error: sdiv by zero or overflow undefined behavior") </output>

    rule [urem-failed]:
        <k> flagStage(urem, badValue) ~> K:K => .K </k>
        <output>... .List => ListItem("error: urem by zero undefined behavior") </output>

    rule [srem-failed]:
        <k> flagStage(urem, badValue) ~> K:K => .K </k>
        <output>... .List => ListItem("error: srem by zero or overflow undefined behavior") </output>

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

    syntax KItem ::= gep(K, K, K)

    syntax ElemList ::= formSingletonGepList(Int, Int, K, K, ElemList)            [function]
    syntax ElemList ::= formSingletonGepVector(Int, K, ElemList, ElemList)        [function]
                      | formSingletonGepElemList(Int, ElemList)                   [function]
                      | formSingletonGepElem(Int, Int, K)                         [function]

    rule formSingletonGepVector(I:Int, T:K, .ElemList, Es:ElemList) => .ElemList
    rule formSingletonGepVector(I:Int,
              T:K, valValue(P:KResult),As:ElemList, Es:ElemList)
           => val(gep(T, P, formSingletonGepElemList(I, Es))),
                        formSingletonGepVector(I +Int 1, T, As, Es)


    rule formSingletonGepList(I:Int, I:Int, T:K, P:K, Es:ElemList) => .ElemList
    rule formSingletonGepList(I:Int, N:Int, T:K, P:K, Es:ElemList)
               => val(gep(T, P, formSingletonGepElemList(N, Es))),
                      formSingletonGepList(I, N +Int 1, T, P, Es)
         requires N <Int I

    rule formSingletonGepElemList(I, .ElemList) => .ElemList
    rule formSingletonGepElemList(I, valValue(N:Int), Es:ElemList)
            => valValue(N),formSingletonGepElemList(I, Es)
    rule formSingletonGepElemList(I, valValue(vectorValue(As:ElemList)), Es:ElemList)
            => valValue(formSingletonGepElem(I, 0, As:ElemList)),formSingletonGepElemList(I, Es)
    rule formSingletonGepElem(I:Int, I, valValue(A:K),Es:ElemList) => A
    rule formSingletonGepElem(I:Int, N:Int, valValue(A:K),Es:ElemList)
            => formSingletonGepElem(I, N +Int 1, Es)

    // TODO gep indices are supposed to be treated as signed (and can definitely use -1)
    rule getElementPtr(Type:KResult, PtrVal:Loc, Indices:KResult)
            => gep(gepTypeBag(Type), PtrVal, Indices)
        requires getKLabel(Type) ==KLabel 'pointerTypeValue
                 andBool notBool hasVectorInValueList(Indices)

    rule getElementPtr(Type:KResult, PtrVal:Loc, Indices:KResult)
            => vector(formSingletonGepList(
                         evalToInt(getVectorNum(Indices)), 0, 
                            gepTypeBag(Type), PtrVal, Indices))
        requires getKLabel(Type) ==KLabel 'pointerTypeValue
                 andBool hasVectorInValueList(Indices)
                 andBool getVectorNum(Indices) =/=K badType

    rule getElementPtr(vectorTypeValue(T:KResult, N:Int),
                        vectorValue(Vl:ElemList), Indices:KResult)
            => vector(formSingletonGepVector(0, gepTypeBag(T), Vl, Indices))

    rule gep(gepTypeBag(pointerTypeValue(Type:KResult, _:K)),
             PtrVal:Loc, valValue(I:Int), Es:ElemList)
                  => gep(Type, PtrVal + (sizeof(Type) *Int I), Es)

    rule gep(arrayTypeValue(Type:KResult, _),
             PtrVal:Loc, valValue(I:Int), Es:ElemList)
                  => gep(Type, PtrVal + (sizeof(Type) *Int I), Es)

    rule gep(structTypeValue(Type:KResult, L:TypeList),
             PtrVal:Loc, valValue(I:Int), Es:ElemList)
                  => gep(structTypeValue(L:TypeList),
                      PtrVal + sizeof(Type), valValue(I -Int 1), Es)
         requires I >Int 0

    rule gep(structTypeValue(Type:KResult, L:TypeList),
             PtrVal:Loc, valValue(0), Es:ElemList)
                  => gep(Type, PtrVal, Es)

    rule gep(T:KResult, PtrVal:Loc, .ElemList) => PtrVal
endmodule

module LLVM-HELPERS-SPLIT-BYTES
    imports LLVM-SYNTAX
    imports LLVM-ABSTRACTSYNTAX
    imports LLVM-SETTINGS
    imports LLVM-HELPERS
    imports LLVM-CONFIGURATION
    imports LLVM-STANDARD-LIBRARY-SYNTAX
    imports LLVM-SYSCALLS-SYNTAX

    syntax KItem ::= splitBytes(K, K, K) //value numBytes, type
    syntax KItem ::= splitIntegerBytes(K, K, K) // value, numBytes, type
    syntax KItem ::= "splitIntegerBytes'" "(" K "," K "," List ")" // value, numbytes, accumulator
    syntax KItem ::= splitFloatBytes(K, K, K, K, List) // value, type, numBytes, accnum accumulator
    syntax KItem ::= splitPointerBytes(K, K) // value, numBytes
    syntax KItem ::= "splitPointerBytes'" "(" K "," K "," K "," List ")" // value, numbytes, whichByte, accumulator
    syntax KItem ::= splitArrayVectorBytes(ElemList, K, List, K, K) // values, value, numBytes, type
    syntax KItem ::= splitStructBytes(K, K, K, List) // value, singleValue, field types, accumulator

    // Type(IntegerType(32))
    // should generate list with LSBytes first

    rule splitBytes(V:KResult, T:KResult) => splitBytes(V, sizeof(T), T)

    //deal with int types.
    rule splitBytes(I:Int, NumBytes:Int, Type:KResult)
            => splitIntegerBytes'(unsigned(Type, I), NumBytes, .List)
         requires (I:Int >=Int 0 orBool I:Int <=Int 0) andBool isIntegerType(Type)

    rule splitBytes(zeroinitializer, NumBytes:Int, Type:KResult)
            => splitIntegerBytes'(0, NumBytes, .List)
         requires isIntegerType(Type)

    rule splitIntegerBytes'(I:Int, NumBytes:Int, L:List)
            => splitIntegerBytes'(
                I >>Int numBitsPerByte,
                NumBytes -Int 1,
                (L ListItem(I &Int ((2 ^Int numBitsPerByte) -Int 1)))
            )
        when NumBytes >Int 0

    rule splitIntegerBytes'(MyK:K, 0, L:List)
            => region(L, size(L))
        when MyK ==K 0


    rule splitIntegerBytes(wvalist(VAList:List, Loc:Loc), 1, _)
            => region(ListItem(wvalist(VAList:List, Loc:Loc)), 1)

/*
    rule
        <k> splitBytes(V:KResult, Type:KResult)
            => splitIntegerBytes(V, sizeof(Type), Type)
        ...</k>
        when isIntegerType(Type)
*/

    //deal with float bytes
    rule splitBytes(V:KResult, N:Int, Type:KResult)
            => splitFloatBytes(V, Type, N, 0, .List)
        when isFloatType(Type)

    rule splitFloatBytes(V:KResult, Type:KResult, 0, _:Int, L:List)
            => region(L, size(L))

    // TODO perhaps a pattern: even more localized rewriting: rewriting inside a constructor rather than rewriting the whole thing
    rule
        <k> splitFloatBytes(
                V:KResult,
                Type:KResult,
                NumBytes:Int => NumBytes -Int 1,
                (N:Int => N +Int 1),
                L:List => (L ListItem(floatByte(V, Type, N)))
            )
        ...</k>
        when NumBytes >Int 0

    //deal with pointer type
    rule splitBytes((zeroinitializer
              => 'nullOfConstValueRef(.KList)), NumBytes:Int, Type:KResult)
         requires isPointerType(Type)

    rule splitBytes(Loc:Loc, NumBytes:Int, Type:KResult)
            => splitPointerBytes'(Loc:Loc, NumBytes, 0, .List)
         requires isPointerType(Type)

    rule splitPointerBytes'(Loc:Loc, NumBytes:Int, N:Int, L:List)
            => splitPointerBytes'(Loc:Loc, NumBytes -Int 1,
                   N:Int +Int 1, (L ListItem(ptrByte(Loc:Loc, N))))
        when NumBytes >Int 0
    rule splitPointerBytes'(Loc:Loc, 0, _, L:List)
            => region(L, size(L))

/*
    rule
        <k> splitBytes(V:KResult, Type:KResult)
            => splitPointerBytes(V, sizeof(Type))
        ...</k>
        when isPointerType(Type)
*/

    //deal with array and vector types
    rule splitBytes(arrayValue(L:ElemList), NumBytes:Int, Type:KResult)
            => splitArrayVectorBytes(L, .K, .List,
                          NumBytes /Int lengthOfList(L), innerType(Type))
         requires (isArrayType(Type) orBool isVectorType(Type))
                  andBool lengthOfList(L) dividesInt NumBytes

    rule splitArrayVectorBytes(valValue(A:K), L:ElemList, .K, L':List, NumBytes:Int, Type:KResult)
            => splitArrayVectorBytes(L, A, L', NumBytes, Type)
 
    rule splitArrayVectorBytes(L, A:KItem, L':List, NumBytes:Int, Type:KResult)
         => splitBytes(A, NumBytes, Type)
             ~> splitArrayVectorBytes(L, emptyHOLE, L', NumBytes:Int, Type:KResult)
         requires A =/=K emptyHOLE

    rule region(L:List, N:Int)
           ~> splitArrayVectorBytes(Es:ElemList, emptyHOLE, L':List, NumBytes:Int, Type:KResult)
         => splitArrayVectorBytes(Es:ElemList, .K, L' L, NumBytes:Int, Type:KResult)

    rule splitArrayVectorBytes(.ElemList, .K, L:List, _:Int, _:KResult) => region(L, size(L))

    //deal with zero for vector and array
    rule splitBytes(zeroinitializer, NumBytes:Int, TypeLabel:KLabel(T:K ,, N:Int))
           => splitBytes(zeroinitializer, NumBytes /Int N, innerType(TypeLabel:KLabel(T:K ,, N:Int)))
              ~> splitBytes(emptyHOLE, NumBytes, TypeLabel:KLabel(T:K ,, N:Int))
         requires (isArrayType(TypeLabel(T,, N)) orBool isVectorType(TypeLabel(T,, N)))
                  andBool N dividesInt NumBytes

    rule region(L:List, N':Int) ~> splitBytes(emptyHOLE, NumBytes:Int, TypeLabel:KLabel(T:K ,, N:Int))
           => region(N copiesOf L, N *Int size(L))


/*
    rule
        <k> splitBytes(V:KResult, Type:KResult)
            => splitArrayBytes(V, sizeof(Type), innerType(Type))
        ...</k>
        when isArrayType(Type)

    rule
        <k> splitBytes(V:KResult, Type:KResult)
            => splitArrayBytes(V, sizeof(Type), innerType(Type))
        ...</k>
        when isVectorType(Type)

*/

    rule splitBytes(V:KResult, T:KResult)
            => splitStructBytes(V, .K, T, .List)
         requires isStructType(T)

    // TODO assumes no padding
    // TODO need to heat types
    // TODO BUG L'' causes latex to fail (generates L ' ')
    rule splitStructBytes(constantStruct(valValue(V:KResult), Fields:ElemList),
                 .K, T:KResult, L':List) =>
               splitStructBytes(constantStruct(Fields), V, T, L')

    rule splitStructBytes(zeroinitializer, .K, T:KResult, L':List)
            => splitStructBytes(zeroinitializer, zeroinitializer, T, L':List)

    rule splitStructBytes(A:K, V:KItem, structTypeValue(Type:KResult, L:TypeList), L':List)
            => splitBytes(V, Type)
            ~> splitStructBytes(A, emptyHOLE, structTypeValue(L), L':List)
         requires V =/=K emptyHOLE

    rule region(L:List, N:Int) ~> splitStructBytes(A:K, emptyHOLE, Ts:K, L':List)
            => splitStructBytes(A, .K, Ts, L' L)

    rule splitStructBytes(_, .K, structTypeValue(.TypeList), L:List)
            => region(L, size(L))

endmodule

module LLVM-HELPERS-JOIN-BYTES
    imports LLVM-SYNTAX
    imports LLVM-ABSTRACTSYNTAX
    imports LLVM-SETTINGS
    imports LLVM-HELPERS
    imports LLVM-CONFIGURATION
    imports LLVM-STANDARD-LIBRARY-SYNTAX
    imports LLVM-SYSCALLS-SYNTAX

    syntax KItem ::= joinIntBytes(K, K, K)
    syntax KItem ::= joinFloatBytes(K, K, K)//region, length, result, type
    syntax KItem ::= joinPointerBytes(K, K, K)
    syntax KItem ::= joinArrayVectorBytes(K, K, K, ElemList)
    syntax KItem ::= joinStructBytes(K, K, K, ElemList)
                     //region, temp, type, result

    rule joinBytes(region(L:List, N:Int), Type:KResult)
            => joinIntBytes(region(L:List, N:Int), 0, Type)
         requires isIntegerType(Type) andBool sizeof(Type) ==K N

    rule joinBytes(region(L:List, N:Int), Type:KResult)
            => joinFloatBytes(region(L:List, N:Int), sizeof(Type), 0.0)
         requires isFloatType(Type) andBool N ==K sizeof(Type)

    rule joinBytes(region(L:List, N:Int), Type:KResult)
            => joinPointerBytes(region(L:List, N:Int), sizeof(Type), 0)
         requires isPointerType(Type) andBool N ==K sizeof(Type)

    rule joinBytes(V:KResult, Type:KResult)
                  => joinArrayVectorBytes(V, .K, Type, .ElemList)
         requires isArrayType(Type) orBool isVectorType(Type)
    rule joinBytes(V:KResult, Type:KResult)
            => joinStructBytes(V, .K, Type, .ElemList)
         requires isStructType(Type) orBool isPackedStructType(Type)

    rule joinBytes(V:KResult, Type:KResult)
            => V
        requires (notBool isIntegerType(Type))
             andBool (notBool isFloatType(Type))
             andBool (notBool isPointerType(Type))
             andBool (notBool isArrayType(Type))
             andBool (notBool isVectorType(Type))
             andBool (notBool isStructType(Type))
             andBool (notBool isPackedStructType(Type))

    rule joinIntBytes(region(L:List ListItem(N:Int), Len:Int), N':Int, Type:KResult)
            => joinIntBytes(region(L:List, Len -Int 1),
                           (N':Int <<Int numBitsPerByte) |Int N:Int, Type:KResult)
        when Len >Int 0 andBool N' >=Int 0 andBool N >=Int 0

    rule joinIntBytes(region(L:List ListItem(wvalist(VAList:List, Loc:K)), Len:Int), N':Int, Type:KResult)
            => joinIntBytes(region(L:List, Len -Int 1),
                           wvalist(VAList:List, Loc:K), Type:KResult)
        when Len >Int 0

    rule joinIntBytes(region(.List, 0), N:Int, Type:KResult)
        => normalizingInt(getIntType(Type), N)
        when N >=Int 0
        [anywhere]

    rule joinIntBytes(region(.List, 0), wvalist(VAList:List, Loc:Loc), Type:KResult)
        => wvalist(VAList:List, Loc:Loc)
        [anywhere]

    //deal with joining float bytes
    rule joinFloatBytes(region((ListItem(floatByte(F:Float, T:KResult, N:Int))
                             L:List => L), Len:Int), (N:Int => N +Int 1),  F':Float => F)
         requires N >=Int 0 andBool N <=Int Len

    rule joinFloatBytes(region(.List, Len:Int), Len:Int, F:K) => F


    //deal with pointer bytes
    rule joinPointerBytes(region((L:List ListItem(ptrByte(Loc:Loc, N:Int))), Len:Int), Len':Int, N':Int)
            => joinPointerBytes(region(L:List, Len), Len' -Int 1, 
                          (N':Int <<Int numBitsPerByte) |Int ptrByte(Loc:Loc, N:Int))
        when Len' >Int 0

    rule joinPointerBytes(region(.List, Len:Int), 0, Loc:Loc)
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

    syntax List ::= countList(List, Int)   [function]
    rule countList(.List, N:Int) => .List
    rule countList(L:List, 0) => .List
    rule countList(ListItem(A:K) L:List, N:Int)
                => ListItem(A:K) countList(L, N -Int 1)
         requires N =/=K 0

    syntax List ::= countRestList(List, Int)   [function]
    rule countRestList(.List, N:Int) => .List
    rule countRestList(L:List, 0) => L
    rule countRestList(ListItem(A:K) L:List, N:Int)
                => countRestList(L, N -Int 1)
         requires N =/=K 0

    //deal with array and vector types
    rule joinArrayVectorBytes(region(L:List, Len:Int),
                          .K, Type:KResult, Es:ElemList)
            => joinArrayVectorBytes(region(countRestList(L, sizeof(innerType(Type))),
                                                           Len -Int sizeof(innerType(Type))),
                region(countList(L, sizeof(innerType(Type))),sizeof(innerType(Type))), Type, Es)
         requires (Len -Int sizeof(innerType(Type)) >=Int 0)
                      andBool sizeof(innerType(Type)) dividesInt Len

    rule joinArrayVectorBytes(A:K, B:KItem,
                       Type:KResult, Es:ElemList)
            => joinBytes(B, innerType(Type))
                ~> joinArrayVectorBytes(A, emptyHOLE, Type, Es)
         requires B =/=K emptyHOLE

    rule A:KResult ~> joinArrayVectorBytes(B:K,
                         emptyHOLE, Type:KResult, Es:ElemList)
            => joinArrayVectorBytes(B, .K, Type,
                             addElemToEnd(valValue(A), Es))

    rule joinArrayVectorBytes(region(.List, 0), .K, T:KResult, Es)
            => arrayValue(Es)
         requires isArrayType(T)
    rule joinArrayVectorBytes(region(.List, 0), .K, T:KResult, Es)
            => vectorValue(Es)
         requires isVectorType(T)

    //deal with struct types and packed struct type
    rule joinStructBytes(region(L:List, Len:Int), 
                 .K, TLabel:KLabel(Type:KResult, Ts:TypeList), L':ElemList)
           => joinStructBytes(region(countRestList(L, sizeof(innerType(Type))),
                  Len -Int sizeof(innerType(Type))),
                      region(countList(L, sizeof(innerType(Type))),sizeof(innerType(Type))),
                       TLabel:KLabel(Type:KResult, Ts:TypeList), L')

    rule joinStructBytes(A:K, V:KItem,
                      TLabel:KLabel(Type:KResult, L:TypeList), L':ElemList)
            => joinBytes(V, Type)
            ~> joinStructBytes(A, emptyHOLE, TLabel(L), L')
         requires V =/=K emptyHOLE

    rule A:KResult ~> joinStructBytes(B:K, emptyHOLE, Ts:K, L':ElemList)
            => joinStructBytes(B, .K, Ts, addElemToEnd(valValue(A), L'))

    rule joinStructBytes(region(.List, 0), .K,
                     structTypeValue(.TypeList), L:ElemList)
            => constantStruct(L)
    rule joinStructBytes(region(.List, 0), .K,
                     packedStructTypeValue(.TypeList), L:ElemList)
            => packedStruct(L)

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
                                       => loc(N:Int +Int Align, 0, undef, undef)
         requires Align >Int Limit andBool isPowOfTwo(Align, 1) andBool Limit >Int 0
    rule nextSym loc(N:Int, 0, Limit:Int, Align:Int)
                                       => loc(N:Int +Int Limit, 0, undef, undef)
         requires Align <=Int Limit
    rule nextSym loc(N:Int, 0, Limit:Int, undef)
                                       => loc(N:Int +Int Limit, 0, undef, undef)

    syntax KItem ::= insertLimit(Loc, K) [function]
    rule insertLimit(loc(A:K, B:K, Limit:K, Align:K), K:K) => loc(A, B, K, Align)
    syntax KItem ::= insertAlign(Loc, K) [function]
    rule insertAlign(loc(A:K, B:K, Limit:K, Align:K), I:Int) => loc(A, B, Limit, I)
    rule insertAlign(Loc:K, I:K) => Loc [owise]

    rule preAlloca(integerType(I:Int), N:Int)
              => normalizingInt(integerType(I:Int), N) [structural]


    //use to alloc the memory for gloable variables.
    rule
        <k> globalAlloca(Type:KResult, N:Int, Al:K)
                          => insertAlign(insertLimit(Loc, sizeof(Type) *Int N),Al) ...</k>
        (.Bag =>
            <object>...
                <basePtr> base(Loc) </basePtr>
                <type> Type </type>
                <align> Al </align>
                <size> sizeof(Type) *Int N </size>
            ...</object>
        )
        <nextLoc> Loc:Loc => nextSym insertAlign(
                       insertLimit(Loc, sizeof(Type) *Int N),Al) </nextLoc>
        <memoryRange> value(I:Int, F:Int) => value(I, base(nextSym insertAlign(
                       insertLimit(Loc, sizeof(Type) *Int N),Al)))      </memoryRange>
        requires N >Int 0

    rule
        <k> globalAlloca(Type:KResult, N:Int, Al:K) ~> K:K
                          => .K </k>
         <output>... .List => ListItem("error: undefined behavior") </output>
        requires N ==Int 0

    rule
        <k> alloca(Type:KResult, N:Int, Al:K) ~> K:K
                          => .K </k>
         <output>... .List => ListItem("error: undefined behavior") </output>
        requires N ==Int 0

    rule
        <k> alloca(Type:KResult, N:Int, Al:K)
                          => insertAlign(insertLimit(Loc, sizeof(Type) *Int N),Al) ...</k>
        (.Bag =>
            <object>...
                <basePtr> base(Loc) </basePtr>
                <type> Type </type>
                <align> Al </align>
                <size> sizeof(Type) *Int N </size>
            ...</object>
        )
        <localMemory>... .List => ListItem(base(Loc)) </localMemory>
        <nextLoc> Loc:Loc => nextSym insertAlign(
                              insertLimit(Loc, sizeof(Type) *Int N),Al) </nextLoc>
        <memoryRange> value(I:Int, F:Int) => value(I, base(nextSym insertAlign(
                       insertLimit(Loc, sizeof(Type) *Int N),Al)))      </memoryRange>
        requires N >Int 0

    //DONE: TODO: store must save to a pointer type
    rule
        <k> store(Type:KResult, V:KResult, loc(Base:Int, Offset:Int, Limit:K, Align:K))
            => write(Type:KResult, V:KResult, loc(Base:Int, Offset:Int, Limit:K, Align:K))
        ...</k>
        <memoryRange> value(I:Int, F:Int) </memoryRange>
        requires Base <=Int F andBool Base >=Int I
                 andBool Base +Int Offset <=Int F andBool Base +Int Offset >=Int I

    rule
        <k> store(Type:KResult, V:KResult, A:KResult) ~> K:K
            => .K </k>
        <output>... .List => ListItem("error: undefined behavior") </output>
        requires getKLabel(A) =/=KLabel 'loc

    rule
        <k> store(Type:KResult, V:KResult, loc(Base:Int, Offset:Int, Limit:K, Align:K))
            ~> K:K  => .K </k>
        <memoryRange> value(I:Int, F:Int) </memoryRange>
        <output>... .List => ListItem("error: undefined behavior") </output>
        requires Base >Int F orBool Base <Int I
                 orBool Base +Int Offset >Int F orBool Base +Int Offset <Int I

    syntax KItem ::= writeBytes(K, K) [strict(1)] // list of bytes, location
                   | atomicWrite(List, K, Set) //list of bytes, location, modifiers

    rule write(Type:KResult, V:KResult, Loc:Loc)
            => writeBytes(splitBytes(V, Type), Loc)
    // rule
        // <k> writeBytes(listK((N:Int,, L:KList)), Base:Int +Int Offset:Int)
        // <basePtr> Base:Int </basePtr>
        // <bytes> M:Map => M:Map[unknownByte / Offset:Int] </bytes>
        // when notBool Offset in keys(M:Map)

    // TODO similar problem as sNat; want to match through a deconstructor
    rule
        <k> writeBytes(region((ListItem(N:K) L:List), Len:Int),
                                  loc(Base:Int, Offset:Int, Limit:Int, Align:K))
            => writeBytes(region(L:List, Len -Int 1),
                                    loc(Base:Int, Offset:Int, Limit, Align) + 1)
        ...</k>
        <buffer> Bufs:List (.List => ListItem(atomicWrite(ListItem(N),
                    loc(Base:Int, Offset:Int, Limit:Int, Align:K), Mods))) </buffer>
        <currentModifiers> Mods:Set </currentModifiers>
        requires Offset <Int Limit andBool notBool (atomic in Mods)

    rule
        <k> writeBytes(region(L:List, Len:Int),
                                  loc(Base:Int, Offset:Int, Limit:Int, Align:K))
            => .K
        ...</k>
        <buffer> Bufs:List (.List => ListItem(atomicWrite(L,
                    loc(Base:Int, Offset:Int, Limit:Int, Align:K), Mods:Set))) </buffer>
        <currentModifiers> Mods:Set </currentModifiers>
        requires Offset +Int Len <=Int Limit andBool (atomic in Mods)


    rule
        <k> writeBytes(region((ListItem(N:Int) L:List), Len:Int),
                     loc(Base:Int, Offset:Int, Limit:Int, Align:K)) ~> K:K
            => .K </k>
        <output>... .List => ListItem("error: undefined behavior") </output>
        requires Offset +Int Len >Int Limit

    rule
        <k> writeBytes(region((ListItem(N:Int) L:List), Len:Int),
                            loc(Base:Int, Offset:Int, undef, undef)) ~> K:K
            => .K </k>
        <output>... .List => ListItem("error: undefined behavior") </output>

    rule writeBytes(region(.List, 0), _) => .K

    rule <buffer> (ListItem(A:K) => .List) Bufs:List </buffer>
         <exBuffer> L':List (.List => ListItem(A)) </exBuffer>

    rule <exBuffer> ListItem(atomicWrite(ListItem(N:K) L':List,
               loc(Base:Int, Offset:Int, Limit:Int, Align:K), Mods:Set)
             => atomicWrite(L',
               loc(Base:Int, Offset:Int, Limit:Int, Align:K) + 1, Mods)) Bufs:List </exBuffer>
        <basePtr> Base:Int </basePtr>
        <bytes> M:Map => M:Map[Offset <- N] </bytes>

    rule <exBuffer> (ListItem(atomicWrite(.List,
                            Loc:K, Mods:Set)) => .List) Bufs:List </exBuffer>

    rule
        <k> load('pointerTypeValue(TyK:K,, A:K), loc(Base:Int, Offset:Int, Limit:K, Align:K))
            => read(TyK:K, loc(Base:Int, Offset:Int, Limit:K, Align:K))
        ...</k>
        <memoryRange> value(I:Int, F:Int) </memoryRange>
        requires Base <=Int F andBool Base >=Int I
                 andBool Base +Int Offset <=Int F andBool Base +Int Offset >=Int I

    rule
        <k> load(Type:KResult, A:KResult) ~> K:K
            => .K </k>
        <output>... .List => ListItem("error: undefined behavior") </output>
        requires getKLabel(A) =/=KLabel 'loc

    rule
        <k> load(Type:KResult, loc(Base:Int, Offset:Int, Limit:K, Align:K))
            ~> K:K  => .K </k>
        <memoryRange> value(I:Int, F:Int) </memoryRange>
        <output>... .List => ListItem("error: undefined behavior") </output>
        requires Base >Int F orBool Base <Int I
                 orBool Base +Int Offset >Int F orBool Base +Int Offset <Int I

    rule read(Type:KResult, Loc:Loc)
            => joinBytes(readBytes(sizeof(Type:KResult), Loc:Loc), Type:KResult)

    rule readBytes(Len:Int, Loc:Loc)
            => readBytes(Len:Int, Loc:Loc, .List)

    rule <k> readBytes(Len:Int, loc(Base:Int, Offset:Int, Limit:Int, Align:Int), L:List)
            => readBytes(emptyHOLE, Len:Int -Int 1,
                  loc(Base:Int, Offset:Int, Limit, Align) + 1, L:List)
        ...</k>
         <threadId> Tid:Int </threadId>
        <buffer> Bufs:List (.List => ListItem(atomicRead(Tid, Base, Offset, Mods))) </buffer>
        <currentModifiers> Mods:Set </currentModifiers>
        requires Len:Int >Int 0 andBool Offset <Int Limit andBool notBool atomic in Mods

    rule
        <k> readBytes(Len:Int, loc(Base:Int, Offset:Int, Limit:Int, Align:Int), .List)
            => readBytes(emptyHOLE, 0,
                  loc(Base:Int, Offset:Int, Limit, Align), .List)
        ...</k>
         <threadId> Tid:Int </threadId>
        <buffer> Bufs:List (.List => 
             ListItem(atomicReads(Tid, Len, loc(Base:Int, Offset:Int, Limit, Align), Mods))) </buffer>
        <currentModifiers> Mods:Set </currentModifiers>
        requires Len:Int >Int 0 andBool Offset +Int Len <=Int Limit andBool atomic in Mods

    rule
        <k> readBytes(Len:Int, loc(Base:Int, Offset:Int, Limit:Int, Align:Int), L:List) ~> K:K
            => .K </k>
        <output>... .List => ListItem("error: undefined behavior") </output>
        requires Limit <Int Offset +Int Len andBool Len =/=Int 0

    rule
        <k> readBytes(Len:Int, loc(Base:Int, Offset:Int, undef, undef), L:List) ~> K:K
            => .K </k>
        <output>... .List => ListItem("error: undefined behavior") </output>

    rule readBytes(0, _, L:List)
            => region(L, size(L))

    rule <k> readBytes(emptyHOLE, Len:Int, Loc:K, L:List)
             => readBytes(Len, Loc, (L:List ListItem(V:KResult)))
         ...</k>
         <threadId> Tid:Int </threadId>
         <exBuffer> (ListItem(atomicRead(Tid, Base:Int, Offset:Int, Mods:Set))
                          => .List) ExBufs:List </exBuffer>
         <basePtr> Base:Int </basePtr>
         <bytes>... Offset |-> V:KResult ...</bytes>

    rule <k> readBytes(emptyHOLE, TempLen:Int, TempLoc:K, L:List)
             => readBytes(emptyHOLE, TempLen, TempLoc, L ListItem(V))
         ...</k>
         <threadId> Tid:Int </threadId>
         <exBuffer> (ListItem(atomicReads(Tid:Int, Len:Int,
                     loc(Base:Int, Offset:Int, Limit:Int, Align:Int), Mods:Set)
                      => atomicReads(Tid, Len:Int -Int 1,
             loc(Base:Int, Offset:Int, Limit:Int, Align:Int) + 1, Mods:Set))) ExBufs:List </exBuffer>
         <basePtr> Base:Int </basePtr>
         <bytes>... Offset |-> V:KResult ...</bytes>
         requires Len:Int >Int 0

    rule <k> readBytes(emptyHOLE, TempLen:Int, TempLoc:K, L:List)
             => readBytes(TempLen, TempLoc, L)
         ...</k>
         <threadId> Tid:Int </threadId>
         <exBuffer> (ListItem(atomicReads(Tid:Int, 0, Loc:K, Mods:Set))
                         => .List) ExBufs:List </exBuffer>


    syntax KItem ::= readBytes(K, K)
    syntax KItem ::= readBytes(K, K, List)
    syntax KItem ::= readBytes(K, K, K, List) //holding situation
    syntax KItem ::= atomicRead(K, K, K, Set) //id,base, offset, modifiers.
    syntax KItem ::= atomicReads(K,K, K, Set) //id,Len, location, modifiers.

endmodule

module LLVM-COMPARISONS
    imports LLVM-SYNTAX
    imports LLVM-ABSTRACTSYNTAX
    imports LLVM-SETTINGS
    imports LLVM-HELPERS
    imports LLVM-CONFIGURATION
    imports LLVM-STANDARD-LIBRARY-SYNTAX
    imports LLVM-SYSCALLS-SYNTAX

    rule iCmp(Op:K, T:KResult, V1:KResult, V2:KResult) => applyIcmps(Op, T, V1, V2)

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
            => arrayValue(StringToList(substrString(#tokenToString(S),
                                    1, lengthString(#tokenToString(S)) -Int 1)))
        ...</k>

/*
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
*/

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
                   valValue(Argc:K),valValue(Argv:K),Vl:ElemList)))
            => call(i(32), callee(V1,arguments(valValue(Argc:K),valValue(Argv:K),.ElemList)))
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
