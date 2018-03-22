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
         (<tomasulo>
            D:Bag
         </tomasulo> =>  <tomasulo>...
                        <instQueue> instList(.List) </instQueue>
                          ...</tomasulo>)
        <output>... .List => ListItem("error: udiv by zero undefined behavior") </output>

    rule [sdiv-failed]:
        <k> flagStage(sdiv, badValue) ~> K:K => .K </k>
         (<tomasulo>
            D:Bag
         </tomasulo> =>  <tomasulo>...
                        <instQueue> instList(.List) </instQueue>
                          ...</tomasulo>)
        <output>... .List => ListItem("error: sdiv by zero or overflow undefined behavior") </output>

    rule [urem-failed]:
        <k> flagStage(urem, badValue) ~> K:K => .K </k>
         (<tomasulo>
            D:Bag
         </tomasulo> =>  <tomasulo>...
                        <instQueue> instList(.List) </instQueue>
                          ...</tomasulo>)
        <output>... .List => ListItem("error: urem by zero undefined behavior") </output>

    rule [srem-failed]:
        <k> flagStage(srem, badValue) ~> K:K => .K </k>
         (<tomasulo>
            D:Bag
         </tomasulo> =>  <tomasulo>...
                        <instQueue> instList(.List) </instQueue>
                          ...</tomasulo>)
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

    rule theFAdd(Type:KResult, F1:KResult, F2:KResult)
            => applyFloats(fadd, Type, F1, F2)

    rule theFSub(Type:KResult, F1:KResult, F2:KResult)
            => applyFloats(fsub, Type, F1, F2)

    rule theFMul(Type:KResult, F1:KResult, F2:KResult)
            => applyFloats(fmul, Type, F1, F2)

    rule theFDiv(Type:KResult, F1:KResult, F2:KResult)
            => applyFloats(fdiv, Type, F1, F2)

    rule theFRem(Type:KResult, F1:KResult, F2:KResult)
            => applyFloats(frem, Type, F1, F2)

endmodule

module LLVM-GEP
    imports LLVM-SYNTAX
    imports LLVM-ABSTRACTSYNTAX
    imports LLVM-SETTINGS
    imports LLVM-HELPERS
    imports LLVM-CONFIGURATION
    imports LLVM-STANDARD-LIBRARY-SYNTAX
    imports LLVM-SYSCALLS-SYNTAX

    rule <k> getElementPtr(pointerTypeValue(T:K, Ad:Int), A:K, Indices:KResult) ~> K:K => .K </k>
         <output>... .List
                => ListItem("error: undefined behavior due to getelementptr of struct type index out of range.") </output>
         (<tomasulo>
            D:Bag
         </tomasulo> =>  <tomasulo>...
                        <instQueue> instList(.List) </instQueue>
                          ...</tomasulo>)
         requires A ==K badValue orBool (isALoc(A) andBool base(A) ==K badValue)

    rule getElementPtr(pointerTypeValue(T:K, Ad:Int), poisonVal, Indices:KResult)
           => poisonVal
    rule getElementPtr(pointerTypeValue(T:K, Ad:Int), A:Loc, Indices:KResult)
           => poisonVal
         requires base(A) ==K poisonVal

    rule <k> getElementPtr(pointerTypeValue(T:K, Ad:Int),
               A:K, Indices:KResult) => poisonVal </k>
         <currentModifiers> Mods:Set </currentModifiers>
         requires (A ==K undef orBool (isALoc(A) andBool base(A) ==K undef))
                andBool inbounds in Mods

    rule <k> getElementPtr(pointerTypeValue(T:K, Ad:Int),
               undef, Indices:KResult) => loc(undef, pointerTypeValue(T:K, Ad:Int),
               value(nullMemoryLoc,nullMemoryLoc), heap, none,
                      toInrangeFlag(getInrange(Indices))) </k>
         <currentModifiers> Mods:Set </currentModifiers>
         requires notBool inbounds in Mods

    rule <k> getElementPtr(pointerTypeValue(T:K, Ad:Int),
               loc(undef, pointerTypeValue(T:K, Ad:Int),
                      R:K,RT:K, BA:K, F:K), Indices:KResult)
              => loc(undef, T, R,RT:K, BA:K,
               mergeInrangeFlags(F, toInrangeFlag(getInrange(Indices)))) </k>
         <currentModifiers> Mods:Set </currentModifiers>
         requires notBool inbounds in Mods

    rule <k> getElementPtr(pointerTypeValue(T:K, Ad:Int),
             loc(A:Int, pointerTypeValue(T:K, Ad:Int),
                     R:K,RT:K,BA:K, F:K), Indices:KResult)
          => getElementPtrAux(gepTypeBag(T), R, A, Ad, BA, F, RT, Indices) ...</k>
         <currentModifiers> Mods:Set </currentModifiers>
         requires notBool inbounds in Mods

    rule <k> getElementPtr(pointerTypeValue(T:K, Ad:Int),
             loc(A:Int, pointerTypeValue(T:K, Ad:Int),
              value(Left:Int, Right:Int),RT:K, BA:K, F:K), Indices:KResult)
          => getElementPtrAux(gepTypeBag(T),
                     value(Left:Int, Right:Int), A, Ad, BA, F, RT, Indices) ...</k>
         <currentModifiers> Mods:Set </currentModifiers>
         requires inbounds in Mods andBool
               (A >=Int Left andBool A<=Int Right)

    rule <k> getElementPtr(pointerTypeValue(T:K, Ad:Int),
             loc(A:Int, pointerTypeValue(T:K, Ad:Int),
                  value(Left:Int, Right:Int),RT:K, BA:K, F:K), Indices:KResult)
          => poisonVal ...</k>
         <currentModifiers> Mods:Set </currentModifiers>
         requires inbounds in Mods andBool
               (A <Int Left orBool A >Int Right)

    rule getElementPtrAux(T:K, R:K, New:Int, Ad:Int, BA:K, InR:K,
               F:K, valValue(gepOperandResult(.K, N:Int)),Es:ElemList)
         => getElementPtrCal(T, R, New, Ad, BA, InR,  F, N, Es)

    rule getElementPtrAux(gepTypeBag(T:K), value(Left:Int, Right:Int),
           New:Int, Ad:Int, BA:K, InR:K, F:K, valValue(gepOperandResult(inrange, N:Int)),Es:ElemList)
           => getElementPtrCal(gepTypeBag(T:K), value(Left:Int, Right:Int),
               New, Ad, BA, mergeInrangeFlags(inrange, InR), F, N, Es)
         requires New +Int N *Int sizeof(T) <=Int Right andBool New >=Int Left

    rule getElementPtrAux(gepTypeBag(T:K), value(Left:Int, Right:Int),
         New:Int, Ad:Int, BA:K, InR:K, F:K, valValue(gepOperandResult(inrange, N:Int)),Es:ElemList)
           => getElementPtrCal(gepTypeBag(T:K), value(Left:Int, Right:Int),
               New,Ad, BA, badRange, F, N, Es)
         requires New +Int N *Int sizeof(T) >Int Right orBool New <Int Left

     rule getElementPtrAux(T:K, value(Left:Int, Right:Int), New:Int, Ad:Int, BA:K, InR:K,
               F:K, valValue(gepOperandResult(inrange, N:Int)),Es:ElemList)
         => getElementPtrCal(T, value(Left:Int, Right:Int), New, Ad, BA,
                           mergeInrangeFlags(inrange, InR), F, N, Es)
         requires notBool hasAGepBag(T) andBool notBool isStructType(T)
               andBool N <Int getSizeOfGepBag(T) andBool N >=Int 0

     rule getElementPtrAux(T:K, value(Left:Int, Right:Int), New:Int, Ad:Int, BA:K, InR:K,
               F:K, valValue(gepOperandResult(inrange, N:Int)),Es:ElemList)
         => getElementPtrCal(T, value(Left:Int, Right:Int), New, Ad, BA,
                           badRange, F, N, Es)
         requires notBool hasAGepBag(T) andBool notBool isStructType(T)
               andBool (N >=Int getSizeOfGepBag(T) orBool N <Int 0)

     rule getElementPtrAux(T:K, R:K, New:Int, Ad:Int, BA:K, InR:K,
               F:K, valValue(gepOperandResult(inrange, N:Int)),Es:ElemList)
         => getElementPtrCal(T, R, New, Ad,
              BA, mergeInrangeFlags(inrange, InR), F, N, Es)
         requires notBool hasAGepBag(T) andBool isStructType(T)

    rule getElementPtrAux(T:K, R:K, New:Int, Ad:Int, BA:K, InR:K, RT:K, .ElemList)
            => loc(New, pointerTypeValue(getRidOfGepBag(T), Ad), R, RT, BA, InR)

    rule getElementPtrCal(gepTypeBag(T:K), R:K, New:Int, Ad:Int, BA:K, InR:K,
               F:K, N:Int, Es:ElemList)
            => getElementPtrBound(T, R, New +Int (sizeof(T) *Int N), Ad,
                     BA, InR, F, Es)
    rule getElementPtrCal(vectorTypeValue(T:K, S:Int), R:K, New:Int, Ad:Int, BA:K, InR:K,
               F:K, N:Int, Es:ElemList)
            => getElementPtrBound(T, R, New +Int (sizeof(T) *Int N), Ad, BA, InR, F, Es)
    rule getElementPtrCal(arrayTypeValue(T:K, S:Int), R:K, New:Int, Ad:Int, BA:K, InR:K,
               F:K, N:Int, Es:ElemList)
            => getElementPtrBound(T, R, New +Int (sizeof(T) *Int N), Ad, BA, InR, F, Es)
    rule getElementPtrCal(structTypeValue(Ts:KResult), R:K, New:Int, Ad:Int, BA:K, InR:K,
               F:K, N:Int, Es:ElemList)
            => getElementPtrBound(getGepTypeInStruct(Ts, N), R,
                        calGepInStruct(New, Ts, N), Ad, BA, InR, F, Es)
    rule getElementPtrCal(packedStructTypeValue(Ts:KResult), R:K,
         New:Int, Ad:Int, BA:K, InR:K, F:K, N:Int, Es:ElemList)
            => getElementPtrBound(getGepTypeInStruct(Ts, N), R,
                        calGepInPackedStruct(New, Ts, N), Ad, BA, InR, F, Es)

    rule <k> getElementPtrBound(T:K,R:K, badValue, Ad:Int, BA:K, InR:K,
                  F:K, Es:ElemList) ~> K:K => .K </k>
         <output>... (.List
                => ListItem("error: undefined behavior due to getelementptr of struct type index out of range.")) </output>
         (<tomasulo>
            D:Bag
         </tomasulo> =>  <tomasulo>...
                        <instQueue> instList(.List) </instQueue>
                          ...</tomasulo>)

    rule <k> getElementPtrBound(T:K,R:K, New:Int, Ad:Int, BA:K, InR:K,
                F:K, Es:ElemList)
               => getElementPtrAux(T, R, New, Ad, BA, InR, F, Es) ...</k>
         <currentModifiers> Mods:Set </currentModifiers>
         requires notBool inbounds in Mods

    rule <k> getElementPtrBound(T:K, value(Left, Right),
                New:Int, Ad:Int, BA:K, InR:K, F:K, Es:ElemList)
               => getElementPtrAux(T, value(Left, Right),
                     New, Ad, BA, InR, F, Es) ...</k>
         <currentModifiers> Mods:Set </currentModifiers>
        requires New >=Int Left andBool New <=Int Right
           andBool inbounds in Mods 

    rule <k> getElementPtrBound(T:K, value(Left, Right),
             New:Int, Ad:Int, BA:K, InR:K, F:K, Es:ElemList) => poisonVal ...</k>
         <currentModifiers> Mods:Set </currentModifiers>
        <localMemory> LocalStack:Set </localMemory>
           <stackList> SL:List </stackList>
        requires New <Int Left orBool New >Int Right
            andBool inbounds in Mods

endmodule

module LLVM-HELPERS-SPLIT-BYTES
    imports LLVM-SYNTAX
    imports LLVM-ABSTRACTSYNTAX
    imports LLVM-SETTINGS
    imports LLVM-HELPERS
    imports LLVM-CONFIGURATION
    imports LLVM-STANDARD-LIBRARY-SYNTAX
    imports LLVM-SYSCALLS-SYNTAX

    syntax KItem ::= splitBytes(K, K, K)   //value numBytes, type
    syntax KItem ::= splitIntegerBytes(K, K, K) // value, numBytes, type
    syntax KItem ::= "splitIntegerBytes'" "(" K "," K "," List ")" // value, numbytes, accumulator
    syntax KItem ::= splitFloatBytes(K, K, K, K, List) // value, type, numBytes, accnum accumulator
    syntax KItem ::= splitPointerBytes(K, K) // value, numBytes
    syntax KItem ::= "splitPointerBytes'" "(" K "," K "," K "," List ")" // value, numbytes, whichByte, accumulator
    syntax KItem ::= splitArrayVectorBytes(ElemList, K, List, K, K) // values, value, numBytes, type
    syntax KItem ::= splitStructBytes(K, K, K, List) // value, singleValue, field types, accumulator

    // Type(IntegerType(32))
    // should generate list with LSBytes first
/*
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
*/
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

/*
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
*/
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
/*
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
*/
endmodule

module LLVM-HELPERS-JOIN-BYTES
    imports LLVM-SYNTAX
    imports LLVM-ABSTRACTSYNTAX
    imports LLVM-SETTINGS
    imports LLVM-HELPERS
    imports LLVM-CONFIGURATION
    imports LLVM-STANDARD-LIBRARY-SYNTAX
    imports LLVM-SYSCALLS-SYNTAX

/*
    syntax KItem ::= joinIntBytes(K, K, K)
    syntax KItem ::= joinFloatBytes(K, K, K)//region, length, result, type
    syntax KItem ::= joinPointerBytes(K, K, K)
    syntax KItem ::= joinArrayVectorBytes(K, K, K, ElemList)
    syntax KItem ::= joinStructBytes(K, K, K, ElemList)
                     //region, temp, type, result
*/
/*
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
*/
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
/*
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
*/
endmodule

module LLVM-MEMORY
    imports LLVM-SYNTAX
    imports LLVM-ABSTRACTSYNTAX
    imports LLVM-SETTINGS
    imports LLVM-HELPERS
    imports LLVM-CONFIGURATION
    imports LLVM-STANDARD-LIBRARY-SYNTAX
    imports LLVM-SYSCALLS-SYNTAX

    rule preAlloca(integerType(I:Int), N:Int)
              => normalizingInt(integerType(I:Int), N) [structural]

    rule <k> globalAlloca(Type:KResult, N:Int, Ad:Int, Al:Int, Con:Bool)
                          => nextMemSym(Base, Ad, Al, Type,
                       value(curBase(Base, Al),
                       nextBase(Base, sizeof(Type) *Int N, Al))) ...</k>
        (.Bag =>
            <object>...
           <chunck> getTopMemList(curBase(Base, Al),
                       0, N, sizeof(Type), Type,
                        getRangeFromFlagInHeap(Con)) </chunck>
             <chunckRange> value(curBase(Base, Al),
                    nextBase(Base, sizeof(Type) *Int N, Al)) </chunckRange>
             <size> N </size>
             <addrSpace> Ad </addrSpace>
             <range> getRangeFromFlagInHeap(Con) </range> 
             <align> newPacking(Base, Al) </align>
                       ...</object> )
        <memoryList> MRL:List (.List => ListItem(value(curBase(Base, Al),
                     nextBase(Base, sizeof(Type) *Int N, Al)))) </memoryList>
        <nextBase> Base:Int => nextBase(Base, sizeof(Type) *Int N, Al) </nextBase>
        <memoryRange> value(I:Int, F:Int) => value(I, nextBase(Base,
                            sizeof(Type) *Int N, Al)) </memoryRange>
        requires (sizeof(Type) *Int N) >Int 0

    rule <k> globalAlloca(Type:KResult, N:Int, Ad:Int, Al:Int, Con:Bool) ~> K:K
              => .K </k>
         (<tomasulo>
            D:Bag
         </tomasulo> =>  <tomasulo>...
                        <instQueue> instList(.List) </instQueue>
                          ...</tomasulo>)
         <output>... .List => ListItem("error: undefined behavior due to malloc zero bype.") </output>
        requires (sizeof(Type) *Int N) <=Int 0

    rule <k> alloca(Type:KResult, N:Int, Ad:Int, Al:Int, Con:Bool) ~> K:K
              => .K </k>
         (<tomasulo>
            D:Bag
         </tomasulo> =>  <tomasulo>...
                        <instQueue> instList(.List) </instQueue>
                          ...</tomasulo>)
         <output>... .List => ListItem("error: undefined behavior due to alloca zero bype.") </output>
        requires (sizeof(Type) *Int N) <=Int 0

    rule <k> alloca(Type:KResult, N:Int, Ad:Int, Al:Int, B:Bool) ~> K:K => .K </k>
        <nextStack> Base:Int </nextStack>
         (<tomasulo>
            D:Bag
         </tomasulo> =>  <tomasulo>...
                        <instQueue> instList(.List) </instQueue>
                          ...</tomasulo>)
        <output>... .List => ListItem("error: undefined behavior due to stack overflow.") </output>
        requires (sizeof(Type) *Int N) >Int 0 andBool (nextBase(Base,
                sizeof(Type) *Int N, Al)) >=Int maxStackSize

    rule <k> alloca(Type:KResult, N:Int, Ad:Int, Al:Int, Con:Bool)
                          => nextStackSym(Base, Ad, Al,
                     Type,value(curBase(Base, Al),
                    nextBase(Base, sizeof(Type) *Int N, Al))) ...</k>
         <threadId> Tid:Int </threadId>
        (.Bag =>
            <stackObject>...
            <stackThreadId> Tid </stackThreadId>
           <stackChunck> getTopMemList(curBase(Base, Al),
                       0, N, sizeof(Type), Type, getRangeFromFlagInStack(Con)) </stackChunck>
             <stackChunckRange> value(curBase(Base, Al),
                    nextBase(Base, sizeof(Type) *Int N, Al)) </stackChunckRange>
             <stackSize> N </stackSize>
             <stackAddrSpace> Ad </stackAddrSpace>
             <stackRange> getRangeFromFlagInStack(Con) </stackRange> 
             <stackAlign> newPacking(Base, Al) </stackAlign>
                       ...</stackObject> )
        <currentModifiers> Mods:Set </currentModifiers>
        <stackList> MRL:List (.List => ListItem(value(curBase(Base, Al),
                     nextBase(Base, sizeof(Type) *Int N, Al)))) </stackList>
        <localMemory>... .Set => SetItem(curBase(Base, Al)) </localMemory>
        <nextStack> Base:Int => nextBase(Base, sizeof(Type) *Int N, Al) </nextStack>
        requires (sizeof(Type) *Int N) >Int 0 andBool (nextBase(Base,
                   sizeof(Type) *Int N, Al)) <Int maxStackSize
                   andBool notBool ('inallocaOfAlloca(.KList) in Mods)

    rule <k> alloca(Type:KResult, N:Int, Ad:Int, Al:K, Con:Bool)
                          => nextStackSym(Base, Ad, Al, Type,
                       value(curBase(Base, Al),
                        nextBase(Base, sizeof(Type) *Int N, Al))) ...</k>
         <threadId> Tid:Int </threadId>
        (.Bag =>
            <stackObject>...
            <stackThreadId> Tid </stackThreadId>
          <stackChunck> getTopMemList(curBase(Base, Al),
                       0, N, sizeof(Type), Type,
                            getRangeFromFlagInStack(Con)) </stackChunck>
             <stackChunckRange> value(curBase(Base, Al),
                    nextBase(Base, sizeof(Type) *Int N, Al)) </stackChunckRange>
             <stackSize> N </stackSize>
             <stackAddrSpace> Ad </stackAddrSpace>
             <stackRange> getRangeFromFlagInStack(Con) </stackRange> 
             <stackAlign> newPacking(Base, Al) </stackAlign>
                ...</stackObject> )
        <currentModifiers> Mods:Set </currentModifiers>
        <stackList> MRL:List (.List => ListItem(value(curBase(Base, Al),
                     nextBase(Base, sizeof(Type) *Int N, Al)))) </stackList>
        <localMemory>... .Set => SetItem(inAlloca(curBase(Base, Al))) </localMemory>
        <nextStack> Base:Int => nextBase(Base, sizeof(Type) *Int N, Al) </nextStack>
        requires N >Int 0 andBool (nextBase(Base,
                   sizeof(Type) *Int N, Al)) <Int maxStackSize
              andBool ('inallocaOfAlloca(.KList) in Mods)

    //load op to load a value from a loc
    rule <k> load(pointerTypeValue(Type:KResult, Ad:Int),
               loc(Base:Int, pointerTypeValue(Type':KResult, Ad':Int),
               value(Left:Int, Right:Int),RT:K, none, InR:K), RA:Int) ~> K:K
                => .K </k>
        <output>... (.List => ListItem("error: undefied behavior loading memory/stack location out of range or does not exist.")) </output>
         (<tomasulo> D:Bag </tomasulo> =>
                <tomasulo>...
                        <instQueue> instList(.List) </instQueue>
                          ...</tomasulo>)
       requires Base <Int Left orBool Base +Int sizeof(Type) >Int Right

    rule <k> load(pointerTypeValue(Type:KResult, Ad:Int),
               loc(Base:Int, pointerTypeValue(Type':KResult, Ad':Int),
                value(Left:Int, Right:Int),RT:K,
               blockAddVal(_, _), InR:K), RA:Int) ~> K:K => .K </k>
        <output>... (.List => ListItem("error: undefied behavior loading memory/stack locations that are block addresses.")) </output>
         (<tomasulo> D:Bag </tomasulo> =>
                <tomasulo>...
                        <instQueue> instList(.List) </instQueue>
                          ...</tomasulo>)

    rule <k> load(pointerTypeValue(Type:KResult, Ad:Int),
               loc(Base:Int, pointerTypeValue(Type:KResult, Ad:Int),
             value(Left:Int, Right:Int), heap, none, InR:K), RA:Int)
           => loadVal(Type:KResult) ...</k>
        <cpu> dynInstHold(B:Int , In:Int, Label:K) </cpu>
        <currBlock> basicBlockNum(BN:Int, _:K) </currBlock>
        <currentModifiers> Mods:Set </currentModifiers>
        <threadId> TID:Int </threadId>
        <toCommit> memList(Ava:List, Ava':List, Avb:List, Avb':List, ML:List)
            => splitMemList(memList(Ava:List, Ava':List, Avb:List, Avb':List, .List),
                 Ava Ava' Avb Avb', subPrototypeWithActual(ML, TID, B, In,
                      genReadBytes(TID, B, In, heap, Type,
                            Base, 0, sizeof(Type), Ad:Int)), BN, SL, MOL) </toCommit>
        <memoryList> MOL:List </memoryList>
        <stackList> SL:List </stackList>
        requires Base >=Int Left andBool Base +Int sizeof(Type) <=Int Right
                 andBool isInMemRange(MOL, Base, sizeof(Type))
                 andBool notBool atomic in Mods
                 andBool RA dividesInt Base
        [transition]
/*
    rule <k> load(pointerTypeValue(Type:KResult, Ad:Int),
               loc(Base:Int, pointerTypeValue(Type:KResult, Ad:Int),
                     value(Left:Int, Right:Int), heap, none, InR:K), RA:Int)
           => loadVal(Type:KResult) ...</k>
        <cpu> dynInstHold(B:Int , In:Int, Label:K) </cpu>
        <currBlock> basicBlockNum(BN:Int, _:K) </currBlock>
        <currentModifiers> Mods:Set </currentModifiers>
        <threadId> TID:Int </threadId>
        <toCommit> memList(Ava:List, Ava':List, Avb:List, Avb':List, ML:List)
            => splitMemList(memList(Ava:List, Ava':List, Avb:List, Avb':List, .List),
                 Ava Ava' Avb Avb', subPrototypeWithActual(ML, TID, B, In,
                      genReadBytes(TID, B, In, heap, Type,
                            Base, 0, sizeof(Type), Ad:Int)), BN, SL, MOL) </toCommit>
        <memoryList> MOL:List </memoryList>
        <stackList> SL:List </stackList>
        requires Base >=Int Left andBool Base +Int sizeof(Type) <=Int Right
                 andBool isInMemRange(MOL, Base, sizeof(Type))
                 andBool notBool atomic in Mods
                 andBool RA dividesInt Base
*/
    rule <k> load(pointerTypeValue(Type:KResult, Ad:Int),
                  loc(Base:Int, pointerTypeValue(Type:KResult, Ad:Int),
                 value(Left:Int, Right:Int),stack, none, InR:K), RA:Int)
           => loadVal(Type:KResult) ...</k>
        <cpu> dynInstHold(B:Int , In:Int, Label:K) </cpu>
        <currBlock> basicBlockNum(BN:Int, _:K) </currBlock>
        <toCommit> memList(Ava:List, Ava':List, Avb:List, Avb':List, ML:List)
        => splitMemList(memList(Ava:List, Ava':List, Avb:List, Avb':List, .List),
               Ava Ava' Avb Avb', subPrototypeWithActual(ML, TID, B, In,
                      genReadBytes(TID, B, In, stack, Type,
                            Base, 0, sizeof(Type), Ad:Int)), BN, SL, MOL) </toCommit>
        <currentModifiers> Mods:Set </currentModifiers>
        <threadId> TID:Int </threadId>
        <localMemory> LocalStack:Set </localMemory>
        <memoryList> MOL:List </memoryList>
           <stackList> SL:List </stackList>
        requires Base >=Int Left andBool Base +Int sizeof(Type) <=Int Right
                 andBool isInStackRange(SL, Base, sizeof(Type), LocalStack)
                 andBool notBool atomic in Mods
                 andBool RA dividesInt Base

    rule <k> load(pointerTypeValue(Type:KResult, Ad:Int),
                  loc(Base:Int, pointerTypeValue(Type:KResult, Ad:Int),
                      value(Left:Int, Right:Int), heap, none, InR:K), RA:Int)
           => loadVal(Type:KResult) ...</k>
        <cpu> dynInstHold (B:Int , In:Int, Label:K) </cpu>
        <currBlock> basicBlockNum(BN:Int, _:K) </currBlock>
        <toCommit> memList(Ava:List, Ava':List, Avb:List, Avb':List, ML:List)
         => splitMemList(memList(Ava:List, Ava':List, Avb:List, Avb':List, .List),
              Ava Ava' Avb Avb', subPrototypeWithActual(ML, TID, B, In,
                      ListItem(singleMem(TID, B, In, heap,
            atomicRead(Type, Base, sizeof(Type), Ad:Int, 
                       getOrdering(.K, Mods))))), BN, SL, MOL) </toCommit>
        <currentModifiers> Mods:Set </currentModifiers>
        <threadId> TID:Int </threadId>
        <memoryList> MOL:List </memoryList>
           <stackList> SL:List </stackList>
        requires Base >=Int Left andBool Base +Int sizeof(Type) <=Int Right
                 andBool isInMemRange(MOL, Base, sizeof(Type))
                 andBool atomic in Mods
                 andBool RA dividesInt Base

    rule <k> load(pointerTypeValue(Type:KResult, Ad:Int),
                 loc(Base:Int, pointerTypeValue(Type:KResult, Ad:Int),
                    value(Left:Int, Right:Int),stack, none, InR:K), RA:Int)
           => loadVal(Type:KResult) ...</k>
        <cpu> dynInstHold (B:Int , In:Int, Label:K) </cpu>
        <currBlock> basicBlockNum(BN:Int, _:K) </currBlock>
        <toCommit> memList(Ava:List, Ava':List, Avb:List, Avb':List, ML:List)
            => splitMemList(memList(Ava:List, Ava':List, Avb:List, Avb':List, .List),
               Ava Ava' Avb Avb', subPrototypeWithActual(ML, TID, B, In,
                      ListItem(singleMem(TID, B, In,stack,
                  atomicRead(Type, Base, sizeof(Type), Ad,
                      getOrdering(.K, Mods))))), BN, SL, MOL) </toCommit>
        <currentModifiers> Mods:Set </currentModifiers>
        <threadId> TID:Int </threadId>
        <localMemory> LocalStack:Set </localMemory>
        <memoryList> MOL:List </memoryList>
           <stackList> SL:List </stackList>
        requires Base >=Int Left andBool Base +Int sizeof(Type) <=Int Right
                 andBool isInStackRange(SL, Base, sizeof(Type), LocalStack)
                 andBool atomic in Mods
                 andBool RA dividesInt Base

    rule <k> load(pointerTypeValue(Type:KResult, Ad:Int),
               loc(Base:Int, pointerTypeValue(Type':KResult, Ad':Int),
                     R:K, RT:K, none,InR:K), RA:Int) ~> K:K
            => .K </k>
         (<tomasulo>
            D:Bag
         </tomasulo> =>  <tomasulo>...
                        <instQueue> instList(.List) </instQueue>
                          ...</tomasulo>)
        <output>... .List => ListItem("error: undefied behavior because load align set up overestimated") </output>
         requires notBool (RA dividesInt Base)

    rule <k> load(pointerTypeValue(Type:KResult, Ad:Int),
              loc(Base:Int, pointerTypeValue(Type':KResult, Ad':Int),
                 R:K, heap, none, InR:K), RA:Int) ~> K:K
            => .K </k>
        <memoryList> MOL:List </memoryList>
         (<tomasulo>
            D:Bag
         </tomasulo> =>  <tomasulo>...
                        <instQueue> instList(.List) </instQueue>
                          ...</tomasulo>)
        <output>... .List => ListItem("error: undefied behavior because store to a location out of the chunck of memory.") </output>
        requires notBool isInMemRange(MOL, Base, sizeof(Type))

    rule <k> load(pointerTypeValue(Type:KResult, Ad:Int),
               loc(Base:Int, pointerTypeValue(Type':KResult, Ad':Int),
                     R:K,stack, none, InR:K), RA:Int) ~> K:K
            => .K </k>
        <stackList> MOL:List </stackList>
        <localMemory> LocalStack:Set </localMemory>
         (<tomasulo>
            D:Bag
         </tomasulo> =>  <tomasulo>...
                        <instQueue> instList(.List) </instQueue>
                          ...</tomasulo>)
        <output>... .List => ListItem("error: undefied behavior because store to a location out of the chunck of stack.") </output>
        requires notBool isInStackRange(MOL, Base, sizeof(Type),LocalStack)

    rule <k> load(pointerTypeValue(Type:KResult, Ad:Int),
                 A:KResult, RA:Int) ~> K:K
            => .K </k>
        <output>... .List => ListItem("error: undefined behavior because store to a non-location.") </output>
        requires notBool isALoc(A)

    //DONE: TODO: store must save to a pointer type
    rule <k> store(Type:KResult, V:KResult, T2:K,
                   loc(Base:Int, T2, value(Left:Int, Right:Int), RT:K,
             none, InR:K), RA:Int) ~> K:K => .K </k>
        <output>... (.List => ListItem("error: undefied behavior storing memory location out of range or does not exist.")) </output>
         (<tomasulo> D:Bag </tomasulo> =>
                <tomasulo>...
                        <instQueue> instList(.List) </instQueue>
                          ...</tomasulo>)
       requires Base <Int Left orBool Base +Int sizeof(Type) >Int Right

    rule <k> store(Type:KResult, V:KResult, T2:K,
                   loc(Base:Int, T2, value(Left:Int, Right:Int), RT:K,
                blockAddVal(_, _), InR:K), RA:Int) ~> K:K => .K </k>
        <output>... (.List => ListItem("error: undefied behavior storing memory locations that are block addresses.")) </output>
         (<tomasulo> D:Bag </tomasulo> =>
                <tomasulo>...
                        <instQueue> instList(.List) </instQueue>
                          ...</tomasulo>)

    rule <k> staticStore(Type:KResult, V:KResult, T2:K,
                   loc(Base:Int, pointerTypeValue(Type, Ad:Int),
               value(Left:Int, Right:Int), stack, none, InR:K), RA:Int) => .K ...</k>
        <instructionCounter> Static:Int => Static +Int 1 </instructionCounter>
        <registers> RM:Map => RM[aLoc(Base, pointerTypeValue(Type,
                                  Ad:Int), stack) <-  value(Type, V)] </registers>
        <toCommit> memList(Ava:List, Ava':List, Avb:List, Avb':List, ML:List)
            => memList(Ava:List, Ava' genWriteBytes(TID, staticBlockNum, Static, 
                    stack, Type, splitBytes(V, Type),
                         storeOperand(TID, Type, V),
                            Base, 0, sizeof(Type), Ad), Avb, Avb', ML) </toCommit>
        <currentModifiers> Mods:Set </currentModifiers>
        <threadId> TID:Int </threadId>
        <localMemory> LocalStack:Set </localMemory>
           <stackList> SL:List </stackList>
        <memoryList> MOL:List </memoryList>
        requires Base >=Int Left andBool Base +Int sizeof(Type) <=Int Right
                 andBool isInStackRange(SL, Base, sizeof(Type), LocalStack)
                 andBool notBool atomic in Mods
                 andBool RA dividesInt Base

    rule <k> staticStore(Type:KResult, V:KResult, T2:K,
                   loc(Base:Int, pointerTypeValue(Type, Ad:Int),
              value(Left:Int, Right:Int), heap, none, InR:K), RA:Int) => .K ...</k>
        <instructionCounter> Static:Int => Static +Int 1 </instructionCounter>
        <cbd> RM:Map => RM[aLoc(Base, pointerTypeValue(Type,
                                   Ad:Int), heap) <-  value(Type, V)] </cbd>
        <toCommit> memList(Ava:List, Ava':List, Avb:List, Avb':List, ML:List)
            => memList(Ava:List, Ava' genWriteBytes(TID, staticBlockNum, Static, 
                    heap, Type, splitBytes(V, Type),
                         storeOperand(TID, Type, V),
                            Base, 0, sizeof(Type), Ad), Avb, Avb', ML) </toCommit>
        <currentModifiers> Mods:Set </currentModifiers>
        <threadId> TID:Int </threadId>
        <memoryList> MOL:List </memoryList>
        requires Base >=Int Left andBool Base +Int sizeof(Type) <=Int Right
                 andBool isInMemRange(MOL, Base, sizeof(Type))
                 andBool notBool atomic in Mods
                 andBool RA dividesInt Base

    rule <k> store(Type:KResult, V:KResult, T2:K,
                   loc(Base:Int, pointerTypeValue(Type, Ad:Int),
                     value(Left:Int, Right:Int), heap, none, InR:K), RA:Int)
            => dynNoResult(undef) ...</k>
        <cpu> dynInstHold(B:Int , In:Int, Label:K) </cpu>
        <currBlock> basicBlockNum(BN:Int, _:K) </currBlock>
        <toCommit> memList(Ava:List, Ava':List, Avb:List, Avb':List, ML:List)
            => splitMemList(memList(Ava:List, Ava':List, Avb:List, Avb':List, .List),
                 Ava Ava' Avb Avb', subPrototypeWithActual(ML, TID, B, In,
                      genWriteBytes(TID, B, In, heap, Type, splitBytes(V, Type),
                         storeOperand(TID, Type, V),
                            Base, 0, sizeof(Type), Ad)), BN, SL, MOL) </toCommit>
        <currentModifiers> Mods:Set </currentModifiers>
        <threadId> TID:Int </threadId>
        <memoryList> MOL:List </memoryList>
           <stackList> SL:List </stackList>
        requires Base >=Int Left andBool Base +Int sizeof(Type) <=Int Right
                 andBool isInMemRange(MOL, Base, sizeof(Type))
                 andBool notBool atomic in Mods
                 andBool RA dividesInt Base

    rule <k> store(Type:KResult, V:KResult,T2:K, loc(Base:Int,
                   pointerTypeValue(Type, Ad:Int),
                 value(Left:Int, Right:Int), stack, none, InR:K), RA:Int)
            => dynNoResult(undef) ...</k>
        <cpu> dynInstHold(B:Int , In:Int, Label:K) </cpu>
        <currBlock> basicBlockNum(BN:Int, _:K) </currBlock>
        <toCommit> memList(Ava:List, Ava':List, Avb:List, Avb':List, ML:List)
        => splitMemList(memList(Ava:List, Ava':List, Avb:List, Avb':List, .List),
               Ava Ava' Avb Avb', subPrototypeWithActual(ML, TID, B, In,
                      genWriteBytes(TID, B, In, stack, Type, splitBytes(V, Type),
                         storeOperand(TID, Type, V),
                            Base, 0, sizeof(Type), Ad)), BN, SL, MOL) </toCommit>
        <currentModifiers> Mods:Set </currentModifiers>
        <threadId> TID:Int </threadId>
        <localMemory> LocalStack:Set </localMemory>
        <memoryList> MOL:List </memoryList>
           <stackList> SL:List </stackList>
        requires Base >=Int Left andBool Base +Int sizeof(Type) <=Int Right
                 andBool isInStackRange(SL, Base, sizeof(Type), LocalStack)
                 andBool notBool atomic in Mods
                 andBool RA dividesInt Base

    rule <k> store(Type:KResult, V:KResult, T2:K,
                  loc(Base:Int, pointerTypeValue(Type, Ad:Int),
                  value(Left:Int, Right:Int), heap, none, InR:K), RA:Int)
            => dynNoResult(undef) ...</k>
        <cpu> dynInstHold (B:Int , In:Int, Label:K) </cpu>
        <currBlock> basicBlockNum(BN:Int, _:K) </currBlock>
        <toCommit> memList(Ava:List, Ava':List, Avb:List, Avb':List, ML:List)
         => splitMemList(memList(Ava:List, Ava':List, Avb:List, Avb':List, .List),
              Ava Ava' Avb Avb', subPrototypeWithActual(ML, TID, B, In,
                      ListItem(singleMem(TID, B, In, heap, atomicWrite(Type,
                     splitBytes(V, Type), storeOperand(TID, Type, V), Base,
              sizeof(Type), Ad:Int, getOrdering(.K, Mods))))), BN, SL, MOL) </toCommit>
        <currentModifiers> Mods:Set </currentModifiers>
        <threadId> TID:Int </threadId>
        <memoryList> MOL:List </memoryList>
           <stackList> SL:List </stackList>
        requires Base >=Int Left andBool Base +Int sizeof(Type) <=Int Right
                 andBool isInMemRange(MOL, Base, sizeof(Type))
                 andBool atomic in Mods
                 andBool RA dividesInt Base

    rule <k> store(Type:KResult, V:KResult, T2:K,
                  loc(Base:Int, pointerTypeValue(Type, Ad:Int),
                    value(Left:Int, Right:Int),stack, none, InR:K), RA:Int)
            => dynNoResult(undef) ...</k>
        <cpu> dynInstHold (B:Int , In:Int, Label:K) </cpu>
        <currBlock> basicBlockNum(BN:Int, _:K) </currBlock>
        <toCommit> memList(Ava:List, Ava':List, Avb:List, Avb':List, ML:List)
            => splitMemList(memList(Ava:List, Ava':List, Avb:List, Avb':List, .List),
               Ava Ava' Avb Avb', subPrototypeWithActual(ML, TID, B, In,
                      ListItem(singleMem(TID, B, In,stack, atomicWrite(Type,
                     splitBytes(V, Type), storeOperand(TID, Type, V), Base,
              sizeof(Type), Ad, getOrdering(.K, Mods))))), BN, SL, MOL) </toCommit>
        <currentModifiers> Mods:Set </currentModifiers>
        <threadId> TID:Int </threadId>
        <localMemory> LocalStack:Set </localMemory>
        <memoryList> MOL:List </memoryList>
           <stackList> SL:List </stackList>
        requires Base >=Int Left andBool Base +Int sizeof(Type) <=Int Right
                 andBool isInStackRange(SL, Base, sizeof(Type), LocalStack)
                 andBool atomic in Mods
                 andBool RA dividesInt Base

    rule <k> store(Type:KResult, V:KResult, T2:K,
               loc(Base:Int, pointerTypeValue(Type':K, Ad:Int),
              R:K, RT:K, none, InR:K), RA:Int) ~> K:K
            => .K </k>
         (<tomasulo>
            D:Bag
         </tomasulo> =>  <tomasulo>...
                        <instQueue> instList(.List) </instQueue>
                          ...</tomasulo>)
        <output>... .List => ListItem("error: undefied behavior because store align set up overestimated.") </output>
         requires notBool (RA dividesInt Base)

    rule <k> store(Type:KResult, V:KResult, T2:K,
               loc(Base:Int, pointerTypeValue(Type':K, Ad:Int),
                       R:K, heap, none, InR:K), RA:Int) ~> K:K
            => .K </k>
         (<tomasulo>
            D:Bag
         </tomasulo> =>  <tomasulo>...
                        <instQueue> instList(.List) </instQueue>
                          ...</tomasulo>)
        <memoryList> MOL:List </memoryList>
        <output>... .List => ListItem("error: undefied behavior because store to a location out of the chunck of memory.") </output>
        requires notBool isInMemRange(MOL, Base, sizeof(Type))

    rule <k> store(Type:KResult, V:KResult, T2:K,
                 loc(Base:Int, pointerTypeValue(Type':K, Ad:Int),
                   R:K, stack, none, InR:K), RA:Int) ~> K:K
            => .K </k>
         (<tomasulo>
            D:Bag
         </tomasulo> =>  <tomasulo>...
                        <instQueue> instList(.List) </instQueue>
                          ...</tomasulo>)
        <stackList> MOL:List </stackList>
        <localMemory> LocalStack:Set </localMemory>
        <output>... .List => ListItem("error: undefied behavior because store to a location out of the chunck of stack.") </output>
        requires notBool isInStackRange(MOL, Base, sizeof(Type),LocalStack)

    rule <k> store(Type:KResult, V:KResult, T2:K, A:KResult, RA:Int) ~> K:K
            => .K </k>
         (<tomasulo>
            D:Bag
         </tomasulo> =>  <tomasulo>...
                        <instQueue> instList(.List) </instQueue>
                          ...</tomasulo>)
        <output>... .List => ListItem("error: undefined behavior because store to a non-location.") </output>
        requires notBool isALoc(A)

    //commit cell to memory cell
    rule <toCommit> memList(Ava:List, Ava':List, Avb:List,
                 ListItem(singleMem(TID:Int,
                     Bn:Int, In:Int, heap, Op:K)) S:List, Not:List)
             => memList(Ava:List, Ava':List, Avb:List
                 ListItem(singleMem(TID:Int, Bn:Int, In:Int,heap,
                   Op:K)), removeInst(Bn, In, S), Not:List) </toCommit>
         <specRegisters> M:Map => updateEnv(M,varInstance(Bn, getTheLoc(heap, Op))
                                        , getValueInWrite(Op)) </specRegisters>
         <cbd> M:Map => updateEnv(M,singleMem(TID:Int, Bn:Int,
                         In:Int,heap, getTheLoc(heap, Op))
                             , getTypeValueInWrite(Op)) </cbd>
         requires isAWrite(Op)
         [transition]

    rule <toCommit> memList(Ava:List, Ava':List, Avb:List,
                 ListItem(singleMem(TID:Int,
                     Bn:Int, In:Int, Ran:K, Op:K)) S:List, Not:List)
             => memList(Ava:List, Ava':List, Avb:List
                 ListItem(singleMem(TID:Int, Bn:Int, In:Int,Ran,
                  Op:K)), S, Not:List) </toCommit>
         requires notBool (isARead(Op) andBool getOrderInMemOp(Op) ==K unordered)
                      andBool notBool isAWrite(Op)
         [transition]

    rule <toCommit> memList(Ava:List, Ava':List, Avb:List,
                 ListItem(singleMem(TID:Int,
                     Bn:Int, In:Int, Ran:K, Op:K)) S:List, Not:List)
             => memList(Ava:List, Ava':List, Avb:List
                 ListItem(singleMem(TID:Int,
                     Bn:Int, In:Int,Ran, Op:K)), S:List, Not:List) </toCommit>
         <reverseChoice> Rev:Map </reverseChoice>
         <specRegisters> M:Map </specRegisters>
         requires isARead(Op) andBool
                  notBool hasValidSpecRead(Bn, .K, .K, deleteNonTargetMap(
                     getTheLoc(Ran, Op),.K, .K, M), Rev)
         [transition]

    rule <readBack> readMap((RM:Map (varInstance(Bn, In)
                             |-> varInstance(X:K, V:K))) => RM) </readBack>
         <reverseChoice> Rev:Map </reverseChoice>
         <specRegisters> M:Map => updateEnv(M,varInstance(Bn, X),
                  getValueInTuple(
                  getValidSpecRead(Bn, .K, .K, deleteNonTargetMap(
                     aLoc(Base, pointerTypeValue(Type, Ad:Int),
                         stack),.K, .K, M), Rev))) </specRegisters>
         <currBlock> basicBlockNum(BN:Int, _:K) </currBlock>
         <toCommit> memList(Ava:List, Ava':List, Avb:List,
                 ListItem(singleMem(TID:Int,
                     Bn:Int, In:Int, stack, readAByte(Type:K,
                Base:Int, Other:Int, Size:Int, Ad:Int))) S:List, Not:List)
             => memList(Ava:List, Ava':List, removeInst(Bn, In, Avb:List),
                      removeInst(Bn, In, S:List), removeInst(Bn, In, Not:List)) </toCommit>
         requires hasValidSpecRead(Bn, .K, .K, deleteNonTargetMap(
                     aLoc(Base, pointerTypeValue(Type, Ad:Int), stack),.K, .K, M), Rev)
         [transition]

    rule <readBack> readMap((RM:Map (varInstance(Bn, In)
                             |-> varInstance(X:K, V:K))) => RM) </readBack>
         <reverseChoice> Rev:Map </reverseChoice>
         <specRegisters> M:Map => updateEnv(M,varInstance(Bn, X),
                  getValueInTuple(
                  getValidSpecRead(Bn, .K, .K, deleteNonTargetMap(
                     aLoc(Base, pointerTypeValue(Type,
                    Ad:Int), heap),.K, .K, M), Rev))) </specRegisters>
         <currBlock> basicBlockNum(BN:Int, _:K) </currBlock>
         <toCommit> memList(Ava:List, Ava':List, Avb:List,
                 ListItem(singleMem(TID:Int,
                     Bn:Int, In:Int, heap, readAByte(Type:K,
                Base:Int, Other:Int, Size:Int, Ad:Int))) S:List, Not:List)
             => memList(Ava:List, Ava':List, removeInst(Bn, In, Avb:List),
                      removeInst(Bn, In, S:List), removeInst(Bn, In, Not:List)) </toCommit>
         requires hasValidSpecRead(Bn, .K, .K, deleteNonTargetMap(
                     aLoc(Base, pointerTypeValue(Type, Ad:Int), heap),.K, .K, M), Rev)
         [transition]

    rule <readBack> readMap((RM:Map (varInstance(Bn, In)
                             |-> varInstance(X:K, V:K))) => RM) </readBack>
         <reverseChoice> Rev:Map </reverseChoice>
         <specRegisters> M:Map => updateEnv(M,varInstance(Bn, X),
                  getValueInTuple(
                  getValidSpecRead(Bn, .K, .K, deleteNonTargetMap(
                    aLoc(Base, pointerTypeValue(Type, Ad),
                            stack),.K, .K, M), Rev))) </specRegisters>
         <currBlock> basicBlockNum(BN:Int, _:K) </currBlock>
         <toCommit> memList(Ava:List, Ava':List, Avb:List,
                 ListItem(singleMem(TID:Int,
                     Bn:Int, In:Int, stack, atomicRead(Type:K,
                Base:Int, Size:Int, Ad:Int, unordered))) S:List, Not:List)
             => memList(Ava:List, Ava':List, Avb, S, Not) </toCommit>
         requires hasValidSpecRead(Bn, .K, .K, deleteNonTargetMap(
                     aLoc(Base, pointerTypeValue(Type, Ad), stack),.K, .K, M), Rev)
         [transition]

    rule <readBack> readMap((RM:Map (varInstance(Bn, In)
                             |-> varInstance(X:K, V:K))) => RM) </readBack>
         <reverseChoice> Rev:Map </reverseChoice>
         <specRegisters> M:Map => updateEnv(M,varInstance(Bn, X),
                  getValueInTuple(
                  getValidSpecRead(Bn, .K, .K, deleteNonTargetMap(
                     aLoc(Base, pointerTypeValue(Type, Ad),
                               heap),.K, .K, M), Rev))) </specRegisters>
         <currBlock> basicBlockNum(BN:Int, _:K) </currBlock>
         <toCommit> memList(Ava:List, Ava':List, Avb:List,
                 ListItem(singleMem(TID:Int,
                     Bn:Int, In:Int, heap, atomicRead(Type:K,
                Base:Int, Size:Int, Ad:Int, unordered))) S:List, Not:List)
             => memList(Ava:List, Ava':List, Avb, S, Not) </toCommit>
         requires hasValidSpecRead(Bn, .K, .K, deleteNonTargetMap(
                     aLoc(Base, pointerTypeValue(Type, Ad), heap),.K, .K, M), Rev)
         [transition]

    rule <currBlock> basicBlockNum(BN:Int, _:K) </currBlock>
        <memoryList> MOL:List </memoryList>
        <stackList> SL:List </stackList>
         <toCommit> memList(Ava:List ListItem(singleMem(TID:Int,
                     Bn:Int, In:Int, stack, Op:K)),
                 Ava':List, Avb:List, S:List, Not:List)
             => splitMemList(memList(Ava, Ava', Avb:List, S:List, .List),
                 Ava Ava' Avb S, Not, BN, SL, MOL) </toCommit>
         <stackOpList> Ops:List (.List => ListItem(singleMem(TID:Int,
                     Bn:Int, In:Int, stack, Op:K))) </stackOpList>
         [transition]

    rule <currBlock> basicBlockNum(BN:Int, _:K) </currBlock>
        <memoryList> MOL:List </memoryList>
        <stackList> SL:List </stackList>
        <toCommit> memList(Ava:List ListItem(singleMem(TID:Int,
                     Bn:Int, In:Int, heap, Op:K)),
                 Ava':List, Avb:List, S:List, Not:List)
             => splitMemList(memList(Ava, Ava', Avb:List, S:List, .List),
                 Ava Ava' Avb S, Not, BN, SL, MOL) </toCommit>
         <memOpList> Ops:List (.List => ListItem(singleMem(TID:Int,
                     Bn:Int, In:Int, heap, Op:K))) </memOpList>
         [transition]

    rule <toCommit> memList(Ava:List, ListItem(X:K) Ava':List,
                     Avb:List, S:List, Not:List)
             => memList(Ava:List ListItem(X:K), Ava':List,
                     Avb:List, S:List, Not:List) </toCommit>
         [transition]

    //non-atomic write stack
    rule <stackOpList> (ListItem(singleMem(Tid:Int, Bn:Int, In:Int,stack,
                        writeAByte(T:K, V:K, V1:K, Base:Int,
                  Other:Int, Size:Int, Ad:Int))) => .List) L:List </stackOpList>
         <stackObject>...
           <stackThreadId> Tid </stackThreadId>
           <stackAddrSpace> Ad </stackAddrSpace>
           <stackChunckRange> value(Left:Int, Right:Int) </stackChunckRange>
         <stackChunck> CL:List </stackChunck>
            ...</stackObject>
         <stackMap> BM:Map => BM[Base +Int Other <- V] </stackMap>
         requires Base +Int Size <=Int Right
                        andBool Base >=Int Left
                 andBool rightHitType(CL, Base, T)

    rule <stackOpList> (ListItem(singleMem(Tid:Int, Bn:Int, In:Int,stack,
                        writeAByte(T:K, V:K, V1:K, Base:Int,
                  Other:Int, Size:Int, Ad:Int))) => .List) L:List </stackOpList>
         <stackObject>...
           <stackThreadId> Tid </stackThreadId>
           <stackAddrSpace> Ad':Int </stackAddrSpace>
           <stackChunckRange> value(Left:Int, Right:Int) </stackChunckRange>
         <stackChunck> CL:List </stackChunck>
            ...</stackObject>
         <stackMap> BM:Map => BM[Base +Int Other <- V] </stackMap>
         <output>... .List =>
            ListItem("warning: input address space does not match with the address space of the stack.")
         </output>
         requires Base +Int Size <=Int Right andBool Base >=Int Left
                 andBool rightHitType(CL, Base, T)
                 andBool Ad =/=K Ad'

    rule <stackOpList> (ListItem(singleMem(Tid:Int, Bn:Int, In:Int,stack,
                        writeAByte(T:K, V:K, V1:K, Base:Int,
                  Other:Int, Size:Int, Ad:Int))) => .List) L:List </stackOpList>
         <stackObject>...
           <stackThreadId> Tid </stackThreadId>
           <stackAddrSpace> Ad </stackAddrSpace>
           <stackChunckRange> value(Left:Int, Right:Int) </stackChunckRange>
         <stackChunck> CL:List => getTopMemList(Base,
                       0, Size, sizeof(T), T, Rg) </stackChunck>
         <stackRange> Rg:K </stackRange>
            ...</stackObject>
         <stackMap> BM:Map => BM[Base +Int Other <- V] </stackMap>
         requires Base +Int Size <=Int Right
                        andBool Base >=Int Left
                 andBool notBool rightHitType(CL, Base, T)

    rule <stackOpList> (ListItem(singleMem(Tid:Int, Bn:Int, In:Int,stack,
                        writeAByte(T:K, V:K, V1:K, Base:Int,
                  Other:Int, Size:Int, Ad:Int))) => .List) L:List </stackOpList>
         <stackObject>...
           <stackThreadId> Tid </stackThreadId>
           <stackAddrSpace> Ad':Int </stackAddrSpace>
           <stackChunckRange> value(Left:Int, Right:Int) </stackChunckRange>
         <stackChunck> CL:List => getTopMemList(Base,
                       0, Size, sizeof(T), T, Rg) </stackChunck>
         <stackRange> Rg:K </stackRange>
            ...</stackObject>
         <stackMap> BM:Map => BM[Base +Int Other <- V] </stackMap>
         <output>... .List =>
            ListItem("warning: input address space does not match with the address space of the stack.")
         </output>
         requires Base +Int Size <=Int Right andBool Base >=Int Left
                 andBool notBool rightHitType(CL, Base, T)
                  andBool Ad =/=K Ad'

    //non-atomic read stack
    rule <readBack> readMapAux(varInstance(Bn:Int, In:Int),
              varInstance(X:K, loadHold(T:K, LL:List)), RM:Map)
                  => readMap(RM) </readBack>
         <specRegisters> M:Map </specRegisters>
         <registers> M':Map => updateEnv(M', X, joinBytes(T, LL)) </registers>
         <currBlock> basicBlockNum(Cur:Int, _:K) </currBlock>
         <instQueue> instList(L:List => updateVarInList(Cur, Bn,
               L, M, updateEnv(M', X, joinBytes(T, LL)), Rev)) </instQueue>
         <toCommit> memList(Ava:List, Ava':List, Avb:List, Avb':List, ML:List)
               => splitMemList(memList(Ava:List, Ava':List, Avb:List,
                     Avb':List, .List), Ava Ava' Avb Avb',
                      updateVarInList(Cur, Bn,
               L, M, updateEnv(M', X, joinBytes(T, LL)), Rev), Cur, SL, S) </toCommit>
         <memoryList> S:List </memoryList>
           <stackList> SL:List </stackList>
         <reverseChoice> Rev:Map </reverseChoice>
         requires sizeof(T) ==K size(LL) andBool Bn <=Int Cur
         [transition]

    rule <readBack> readMapAux(varInstance(Bn:Int, In:Int),
              varInstance(X:K, loadHold(T:K, LL:List)), RM:Map)
                  => readMap(RM) </readBack>
         <specRegisters> M:Map => updateEnv(M,
                      varInstance(Bn, X), joinBytes(T, LL)) </specRegisters>
         <registers> M':Map </registers>
         <currBlock> basicBlockNum(Cur:Int, _:K) </currBlock>
         <instQueue> instList(L:List => updateVarInList(Cur, Bn,
               L, updateEnv(M,varInstance(Bn, X),
                       joinBytes(T, LL)), M', Rev)) </instQueue>
         <toCommit> memList(Ava:List, Ava':List, Avb:List, Avb':List, ML:List)
               => splitMemList(memList(Ava:List, Ava':List, Avb:List,
                     Avb':List, .List), Ava Ava' Avb Avb',
                      updateVarInList(Cur, Bn, ML,
                         updateEnv(M,varInstance(Bn, X),
                        joinBytes(T, LL)), M', Rev), Cur, SL, S) </toCommit>
         <memoryList> S:List </memoryList>
           <stackList> SL:List </stackList>
         <reverseChoice> Rev:Map </reverseChoice>
         requires sizeof(T) ==K size(LL) andBool Bn >Int Cur
         [transition]

    rule <readBack> readMapAux(varInstance(Bn:Int, In:Int),
              varInstance(X:K, loadHold(T:K, LL:List)), RM:Map)
                  => readMap(RM (varInstance(Bn:Int, In:Int)
                |-> varInstance(X:K, loadHold(T:K, LL:List)))) </readBack>
         requires sizeof(T) =/=K size(LL)
         [transition]

    rule <readBack> readMap(M:Map (varInstance(Bn, In)
                 |-> varInstance(X:K, loadHold(T':K, LL:List))))
             => readMapAux(varInstance(Bn, In), varInstance(X:K,
                loadHold(T':K, insertToOrderList(Other, V, LL))), M) </readBack>
         <stackOpList> (ListItem(singleMem(Tid:Int, Bn:Int, In:Int,stack,
                        readAByte(T:K, Base:Int,
                  Other:Int, Size:Int, Ad:Int))) => .List) L:List </stackOpList>
         <stackObject>...
           <stackThreadId> Tid </stackThreadId>
           <stackAddrSpace> Ad </stackAddrSpace>
           <stackChunckRange> value(Left:Int, Right:Int) </stackChunckRange>
         <stackChunck> CL:List </stackChunck>
            ...</stackObject>
         <stackMap>... (Base +Int Other) |-> V:K ...</stackMap>
         requires Base +Int Size <=Int Right andBool Base >=Int Left
                 andBool rightHitType(CL, Base, T)
         [transition]

    rule <readBack> readMap(M:Map (varInstance(Bn, In)
                 |-> varInstance(X:K, loadHold(T':K, LL:List))))
             => readMapAux(varInstance(Bn, In), varInstance(X:K,
                loadHold(T':K, insertToOrderList(Other, V, LL))), M) </readBack>
         <stackOpList> (ListItem(singleMem(Tid:Int, Bn:Int, In:Int,stack,
                        readAByte(T:K, Base:Int,
                  Other:Int, Size:Int, Ad:Int))) => .List) L:List </stackOpList>
         <stackObject>...
           <stackThreadId> Tid </stackThreadId>
           <stackAddrSpace> Ad':Int </stackAddrSpace>
           <stackChunckRange> value(Left:Int, Right:Int) </stackChunckRange>
         <stackChunck> CL:List </stackChunck>
            ...</stackObject>
         <stackMap>... (Base +Int Other) |-> V:K ...</stackMap>
         <output>... .List =>
            ListItem("warning: input address space does not match with the address space of the stack.")
         </output>
         requires Base +Int Size <=Int Right andBool Base >=Int Left
                 andBool rightHitType(CL, Base, T)
                 andBool Ad =/=K Ad'
         [transition]

    rule <k> K:K => .K </k>
         (<tomasulo>
            D:Bag
         </tomasulo> =>  <tomasulo>...
                        <instQueue> instList(.List) </instQueue>
                          ...</tomasulo>)
         <stackOpList> (ListItem(singleMem(Tid:Int, Bn:Int, In:Int,stack,
                        readAByte(T:K, Base:Int,
                  Other:Int, Size:Int, Ad:Int)))) L:List => .List </stackOpList>
         <stackObject>...
           <stackThreadId> Tid </stackThreadId>
           <stackChunckRange> value(Left:Int, Right:Int) </stackChunckRange>
         <stackChunck> CL:List </stackChunck>
            ...</stackObject>
         <stackMap> BM:Map </stackMap>
        <output>... .List => ListItem("error: undefied behavior because load a field that is not previously store at the same type.") </output>
         requires Base +Int Size <=Int Right
                     andBool Base >=Int Left
                 andBool notBool rightHitType(CL, Base, T)

    //non-atomic write in heap
    rule <memOpList> (ListItem(singleMem(Tid:Int, Bn:Int, In:Int,heap,
                        writeAByte(T:K, V:K, V1:K, Base:Int,
                  Other:Int, 1, Ad:Int))) => .List) L:List </memOpList>
         <object>... <chunckRange> value(Left:Int, Right:Int) </chunckRange>
         <chunck> CL:List </chunck>
         <race> Races:Set </race>
         <addrSpace> Ad </addrSpace>
          ...</object>
         <byteMap> BM:Map => BM[Base +Int Other <- V] </byteMap>
         requires Base +Int 1 <=Int Right
                     andBool Base  >=Int Left
                 andBool rightHitType(CL, Base, T)
                 andBool notBool isOverlap(Base, 1, .K, Races)
                 andBool notBool hasInstance(Tid, Bn, In, .K, Races)

    rule <memOpList> (ListItem(singleMem(Tid:Int, Bn:Int, In:Int,heap,
                        writeAByte(T:K, V:K, V1:K, Base:Int,
                  Other:Int, 1, Ad:Int))) => .List) L:List </memOpList>
         <object>... <chunckRange> value(Left:Int, Right:Int) </chunckRange>
         <chunck> CL:List </chunck>
         <race> Races:Set </race>
         <addrSpace> Ad':Int </addrSpace>
          ...</object>
         <byteMap> BM:Map => BM[Base +Int Other <- V] </byteMap>
         <output>... .List =>
            ListItem("warning: input address space does not match with the address space of the memory.")
         </output>
         requires Base +Int 1 <=Int Right andBool Base  >=Int Left
                 andBool rightHitType(CL, Base, T)
                 andBool notBool isOverlap(Base, 1, .K, Races)
                 andBool notBool hasInstance(Tid, Bn, In, .K, Races)
                 andBool Ad =/=K Ad'

    rule <memOpList> (ListItem(singleMem(Tid:Int, Bn:Int, In:Int,heap,
                        writeAByte(T:K, V:K, V1:K, Base:Int,
                  Other:Int, Size:Int, Ad:Int))) => .List) L:List </memOpList>
         <object>... <chunckRange> value(Left:Int, Right:Int) </chunckRange>
         <chunck> CL:List </chunck>
         <addrSpace> Ad:Int </addrSpace>
         <race> Races:Set (.Set => SetItem(
                   singleMem(Tid, Bn, In, heap, value(Base,
                 Base +Int Size)))) </race>
         <complete> CM:Map => CM[memId(Tid,Bn,In) <- 1] </complete>
            ...</object>
         <byteMap> BM:Map => BM[Base +Int Other <- V] </byteMap>
         requires Base +Int Size <=Int Right
                     andBool Base >=Int Left
                 andBool rightHitType(CL, Base, T)
                 andBool notBool isOverlap(Base, Size, .K, Races)
                 andBool notBool hasInstance(Tid, Bn, In, .K, Races)
                 andBool Size =/=Int 1

    rule <memOpList> (ListItem(singleMem(Tid:Int, Bn:Int, In:Int,heap,
                        writeAByte(T:K, V:K, V1:K, Base:Int,
                  Other:Int, Size:Int, Ad:Int))) => .List) L:List </memOpList>
         <object>... <chunckRange> value(Left:Int, Right:Int) </chunckRange>
         <chunck> CL:List </chunck>
         <addrSpace> Ad':Int </addrSpace>
         <race> Races:Set (.Set => SetItem(
                   singleMem(Tid, Bn, In, heap, value(Base,
                 Base +Int Size)))) </race>
         <complete> CM:Map => CM[memId(Tid,Bn,In) <- 1] </complete>
            ...</object>
         <byteMap> BM:Map => BM[Base +Int Other <- V] </byteMap>
         <output>... .List =>
            ListItem("warning: input address space does not match with the address space of the memory.")
         </output>
         requires Base +Int Size <=Int Right andBool Base >=Int Left
                 andBool rightHitType(CL, Base, T)
                 andBool notBool isOverlap(Base, Size, .K, Races)
                 andBool notBool hasInstance(Tid, Bn, In, .K, Races)
                 andBool Size =/=Int 1 andBool Ad =/=K Ad'

    rule <memOpList> (ListItem(singleMem(Tid:Int, Bn:Int, In:Int, heap,
                        writeAByte(T:K, V:K, V1:K, Base:Int,
                  Other:Int, Size:Int, Ad:Int))) => .List) L:List </memOpList>
         <object>... <chunckRange> value(Left:Int, Right:Int) </chunckRange>
         <chunck> CL:List </chunck>
         <addrSpace> Ad:Int </addrSpace>
         <complete>... memId(Tid, Bn, In)
                          |-> (Count:Int => Count +Int 1) ...</complete>
         <race> Races:Set </race>
            ...</object>
         <byteMap> BM:Map => BM[Base +Int Other <- V] </byteMap>
         requires Base +Int Size <=Int Right
                     andBool Base >=Int Left
                 andBool rightHitType(CL, Base, T)
                 andBool hasInstance(Tid, Bn, In, .K, Races)
                 andBool Count +Int 1 <Int Size
                 andBool Size =/=Int 1

    rule <memOpList> (ListItem(singleMem(Tid:Int, Bn:Int, In:Int, heap,
                        writeAByte(T:K, V:K, V1:K, Base:Int,
                  Other:Int, Size:Int, Ad:Int))) => .List) L:List </memOpList>
         <object>... <chunckRange> value(Left:Int, Right:Int) </chunckRange>
         <chunck> CL:List </chunck>
         <addrSpace> Ad':Int </addrSpace>
         <complete>... memId(Tid, Bn, In)
                          |-> (Count:Int => Count +Int 1) ...</complete>
         <race> Races:Set </race>
            ...</object>
         <byteMap> BM:Map => BM[Base +Int Other <- V] </byteMap>
         <output>... .List =>
            ListItem("warning: input address space does not match with the address space of the memory.")
         </output>
         requires Base +Int Size <=Int Right
                     andBool Base >=Int Left
                 andBool rightHitType(CL, Base, T)
                 andBool hasInstance(Tid, Bn, In, .K, Races)
                 andBool Count +Int 1 <Int Size
                 andBool Size =/=Int 1 andBool Ad =/=K Ad'

    rule <memOpList> (ListItem(singleMem(Tid:Int, Bn:Int, In:Int,heap,
                        writeAByte(T:K, V:K, V1:K, Base:Int,
                  Other:Int, Size:Int, Ad:Int))) => .List) L:List </memOpList>
         <object>... <chunckRange> value(Left:Int, Right:Int) </chunckRange>
         <chunck> CL:List </chunck>
         <addrSpace> Ad:Int </addrSpace>
         <complete> CM:Map ((memId(Tid, Bn, In)
                          |-> Count:K) => .Map) </complete>
         <race> Races:Set => removeRaceInSet(Races,.K, Tid, Bn, In) </race>
            ...</object>
         <byteMap> BM:Map => BM[Base +Int Other <- V] </byteMap>
         requires Base +Int Size <=Int Right
                     andBool Base >=Int Left
                 andBool rightHitType(CL, Base, T)
                 andBool hasInstance(Tid, Bn, In, .K, Races)
                 andBool Count +Int 1 >=Int Size
                 andBool Size =/=Int 1

    rule <memOpList> (ListItem(singleMem(Tid:Int, Bn:Int, In:Int,heap,
                        writeAByte(T:K, V:K, V1:K, Base:Int,
                  Other:Int, Size:Int, Ad:Int))) => .List) L:List </memOpList>
         <object>... <chunckRange> value(Left:Int, Right:Int) </chunckRange>
         <chunck> CL:List </chunck>
         <addrSpace> Ad':Int </addrSpace>
         <complete> CM:Map ((memId(Tid, Bn, In)
                          |-> Count:K) => .Map) </complete>
         <race> Races:Set => removeRaceInSet(Races,.K, Tid, Bn, In) </race>
            ...</object>
         <byteMap> BM:Map => BM[Base +Int Other <- V] </byteMap>
         <output>... .List =>
            ListItem("warning: input address space does not match with the address space of the memory.")
         </output>
         requires Base +Int Size <=Int Right andBool Base >=Int Left
                 andBool rightHitType(CL, Base, T)
                 andBool hasInstance(Tid, Bn, In, .K, Races)
                 andBool Count +Int 1 >=Int Size
                 andBool Size =/=Int 1 andBool Ad =/=K Ad'

    rule <memOpList> (ListItem(singleMem(Tid:Int, Bn:Int, In:Int,heap,
                        writeAByte(T:K, V:K, V1:K, Base:Int,
                  Other:Int, 1, Ad:Int))) => .List) L:List </memOpList>
         <object>... <chunckRange> value(Left:Int, Right:Int) </chunckRange>
         <chunck> CL:List => getTopMemList(Base,
                       0, 1, sizeof(T), T, Rg) </chunck>
         <race> Races:Set </race>
         <addrSpace> Ad:Int </addrSpace>
         <range> Rg:K </range> ...</object>
         <byteMap> BM:Map => BM[Base +Int Other <- V] </byteMap>
         requires Base +Int 1 <=Int Right
                     andBool Base >=Int Left
                 andBool notBool rightHitType(CL, Base, T)
                 andBool notBool isOverlap(Base, 1, .K, Races)

    rule <memOpList> (ListItem(singleMem(Tid:Int, Bn:Int, In:Int,heap,
                        writeAByte(T:K, V:K, V1:K, Base:Int,
                  Other:Int, 1, Ad:Int))) => .List) L:List </memOpList>
         <object>... <chunckRange> value(Left:Int, Right:Int) </chunckRange>
         <chunck> CL:List => getTopMemList(Base,
                       0, 1, sizeof(T), T, Rg) </chunck>
         <race> Races:Set </race>
         <addrSpace> Ad':Int </addrSpace>
         <range> Rg:K </range> ...</object>
         <byteMap> BM:Map => BM[Base +Int Other <- V] </byteMap>
         <output>... .List =>
            ListItem("warning: input address space does not match with the address space of the memory.")
         </output>
         requires Base +Int 1 <=Int Right
                     andBool Base >=Int Left
                 andBool notBool rightHitType(CL, Base, T)
                 andBool notBool isOverlap(Base, 1, .K, Races)
                 andBool Ad =/=K Ad'

    rule <memOpList> (ListItem(singleMem(Tid:Int, Bn:Int, In:Int,heap,
                        writeAByte(T:K, V:K, V1:K, Base:Int,
                  Other:Int, Size:Int, Ad:Int))) => .List) L:List </memOpList>
         <object>... <chunckRange> value(Left:Int, Right:Int) </chunckRange>
         <chunck> CL:List => getTopMemList(Base,
                       0, Size, sizeof(T), T, Rg) </chunck>
         <range> Rg:K </range>
         <addrSpace> Ad:Int </addrSpace>
         <race> Races:Set (.Set => SetItem(
                 singleMem(Tid, Bn, In,heap, value(Base,
                 Base +Int Size)))) </race>
         <complete> CM:Map => CM[memId(Tid,Bn,In) <- 1] </complete>
            ...</object>
         <byteMap> BM:Map => BM[Base +Int Other <- V] </byteMap>
         requires Base +Int Size <=Int Right
                     andBool Base >=Int Left
                 andBool notBool rightHitType(CL, Base, T)
                 andBool notBool isOverlap(Base, Size, .K, Races)
                 andBool notBool hasInstance(Tid, Bn, In, .K, Races)
                 andBool Size =/=Int 1

    rule <memOpList> (ListItem(singleMem(Tid:Int, Bn:Int, In:Int,heap,
                        writeAByte(T:K, V:K, V1:K, Base:Int,
                  Other:Int, Size:Int, Ad:Int))) => .List) L:List </memOpList>
         <object>... <chunckRange> value(Left:Int, Right:Int) </chunckRange>
         <chunck> CL:List => getTopMemList(Base,
                       0, Size, sizeof(T), T, Rg) </chunck>
         <range> Rg:K </range>
         <addrSpace> Ad':Int </addrSpace>
         <race> Races:Set (.Set => SetItem(
                 singleMem(Tid, Bn, In,heap, value(Base,
                 Base +Int Size)))) </race>
         <complete> CM:Map => CM[memId(Tid,Bn,In) <- 1] </complete>
            ...</object>
         <byteMap> BM:Map => BM[Base +Int Other <- V] </byteMap>
         <output>... .List =>
            ListItem("warning: input address space does not match with the address space of the memory.")
         </output>
         requires Base +Int Size <=Int Right andBool Base >=Int Left
                 andBool notBool rightHitType(CL, Base, T)
                 andBool notBool isOverlap(Base, Size, .K, Races)
                 andBool notBool hasInstance(Tid, Bn, In, .K, Races)
                 andBool Size =/=Int 1 andBool Ad =/=K Ad'

    rule <k> A:K => .K </k>
         <memOpList> ListItem(singleMem(Tid:Int, Bn:Int, In:Int,heap,
                        writeAByte(T:K, V:K, V1:K, Base:Int,
                  Other:Int, Size:Int, Ad:Int))) L:List => .List </memOpList>
         <object>... <chunckRange> value(Left:Int, Right:Int) </chunckRange>
         <chunck> CL:List </chunck>
         <race> Races:Set </race>
            ...</object>
         (<tomasulo>
            D:Bag
         </tomasulo> =>  <tomasulo>...
                        <instQueue> instList(.List) </instQueue>
                          ...</tomasulo>)
        <output>... .List => ListItem("error: undefied behavior because two mem ops messing around the types in the location") </output>
         requires Base +Int Size <Int Right
                     andBool Base >=Int Left
                 andBool notBool rightHitType(CL, Base, T)
                 andBool hasInstance(Tid, Bn, In, .K, Races)

    rule <k> A:K => .K </k>
         <memOpList> ListItem(singleMem(Tid:Int, Bn:Int, In:Int,heap,
                        writeAByte(T:K, V:K, V1:K, Base:Int,
                  Other:Int, Size:Int, Ad:Int))) L:List => .List </memOpList>
         <object>... <chunckRange> value(Left:Int, Right:Int) </chunckRange>
         <chunck> CL:List </chunck>
         <race> Races:Set </race> ...</object>
         (<tomasulo>
            D:Bag
         </tomasulo> =>  <tomasulo>...
                        <instQueue> instList(.List) </instQueue>
                          ...</tomasulo>)
        <output>... .List =>
          ListItem("error: undefied behavior because two mem op races on the same location") </output>
         requires Base +Int Size <=Int Right
                     andBool Base >=Int Left
                 andBool isOverlap(Base, Size, .K, Races)
                 andBool notBool hasInstance(Tid, Bn, In, .K, Races)

    //non-atomic read in heap
    rule <readBack> readMap(RM:Map (varInstance(Bn, In)
                 |-> varInstance(X:K, loadHold(T':K, LL:List))))
             => readMapAux(varInstance(Bn, In), varInstance(X:K,
                loadHold(T':K, insertToOrderList(Other, V, LL))), RM) </readBack>
         <threadId> Tid </threadId>
         <memOpList> (ListItem(singleMem(Tid:Int, Bn:Int, In:Int,heap,
                        readAByte(T:K, Base:Int,
                  Other:Int, 1, Ad:Int))) => .List) L:List </memOpList>
         <object>... <chunckRange> value(Left:Int, Right:Int) </chunckRange>
          <chunck> CL:List </chunck>
         <addrSpace> Ad:Int </addrSpace>
          <race> Races:Set </race> ...</object>
         <byteMap>... Base +Int Other |-> V:K ...</byteMap>
         requires Base +Int 1 <=Int Right
                     andBool Base >=Int Left
                 andBool rightHitType(CL, Base, T)
                 andBool notBool isOverlap(Base, 1, .K, Races)
                 andBool notBool hasInstance(Tid, Bn, In, .K, Races)
          [transition]

    rule <readBack> readMap(RM:Map (varInstance(Bn, In)
                 |-> varInstance(X:K, loadHold(T':K, LL:List))))
             => readMapAux(varInstance(Bn, In), varInstance(X:K,
                loadHold(T':K, insertToOrderList(Other, V, LL))), RM) </readBack>
         <threadId> Tid </threadId>
         <memOpList> (ListItem(singleMem(Tid:Int, Bn:Int, In:Int,heap,
                        readAByte(T:K, Base:Int,
                  Other:Int, 1, Ad:Int))) => .List) L:List </memOpList>
         <object>... <chunckRange> value(Left:Int, Right:Int) </chunckRange>
          <chunck> CL:List </chunck>
         <addrSpace> Ad':Int </addrSpace>
          <race> Races:Set </race> ...</object>
         <byteMap>... Base +Int Other |-> V:K ...</byteMap>
         <output>... .List =>
            ListItem("warning: input address space does not match with the address space of the memory.")
         </output>
         requires Base +Int 1 <=Int Right andBool Base >=Int Left
                 andBool rightHitType(CL, Base, T)
                 andBool notBool isOverlap(Base, 1, .K, Races)
                 andBool notBool hasInstance(Tid, Bn, In, .K, Races)
                   andBool Ad =/=K Ad'
          [transition]

    rule <readBack> readMap(RM:Map (varInstance(Bn, In)
                 |-> varInstance(X:K, loadHold(T':K, LL:List))))
             => readMapAux(varInstance(Bn, In), varInstance(X:K,
                loadHold(T':K, insertToOrderList(Other, V, LL))), RM) </readBack>
         <threadId> Tid </threadId>
         <memOpList> (ListItem(singleMem(Tid:Int, Bn:Int, In:Int,heap,
                        readAByte(T:K, Base:Int,
                  Other:Int, Size:Int, Ad:Int))) => .List) L:List </memOpList>
         <object>... <chunckRange> value(Left:Int, Right:Int) </chunckRange>
         <chunck> CL:List </chunck>
         <addrSpace> Ad:Int </addrSpace>
         <race> Races:Set (.Set => SetItem(
                   singleMem(Tid, Bn, In, heap, value(Base,
                 Base +Int Size)))) </race>
         <complete> CM:Map => CM[memId(Tid,Bn,In) <- 1] </complete>
            ...</object>
         <byteMap>... Base +Int Other |-> V:K ...</byteMap>
         requires Base +Int Size <=Int Right
                     andBool Base >=Int Left
                 andBool rightHitType(CL, Base, T)
                 andBool notBool isOverlap(Base, Size, .K, Races)
                 andBool notBool hasInstance(Tid, Bn, In, .K, Races)
                 andBool Size =/=Int 1

    rule <readBack> readMap(RM:Map (varInstance(Bn, In)
                 |-> varInstance(X:K, loadHold(T':K, LL:List))))
             => readMapAux(varInstance(Bn, In), varInstance(X:K,
                loadHold(T':K, insertToOrderList(Other, V, LL))), RM) </readBack>
         <threadId> Tid </threadId>
         <memOpList> (ListItem(singleMem(Tid:Int, Bn:Int, In:Int,heap,
                        readAByte(T:K, Base:Int,
                  Other:Int, Size:Int, Ad:Int))) => .List) L:List </memOpList>
         <object>... <chunckRange> value(Left:Int, Right:Int) </chunckRange>
         <chunck> CL:List </chunck>
         <addrSpace> Ad':Int </addrSpace>
         <race> Races:Set (.Set => SetItem(
                   singleMem(Tid, Bn, In, heap, value(Base,
                 Base +Int Size)))) </race>
         <complete> CM:Map => CM[memId(Tid,Bn,In) <- 1] </complete>
            ...</object>
         <byteMap>... Base +Int Other |-> V:K ...</byteMap>
         <output>... .List =>
            ListItem("warning: input address space does not match with the address space of the memory.")
         </output>
         requires Base +Int Size <=Int Right
                     andBool Base >=Int Left
                 andBool rightHitType(CL, Base, T)
                 andBool notBool isOverlap(Base, Size, .K, Races)
                 andBool notBool hasInstance(Tid, Bn, In, .K, Races)
                 andBool Size =/=Int 1
                 andBool Ad =/=K Ad'

    rule <readBack> readMap(RM:Map (varInstance(Bn, In)
                 |-> varInstance(X:K, loadHold(T':K, LL:List))))
             => readMapAux(varInstance(Bn, In), varInstance(X:K,
                loadHold(T':K, insertToOrderList(Other, V, LL))), RM) </readBack>
         <threadId> Tid </threadId>
         <memOpList> (ListItem(singleMem(Tid:Int, Bn:Int, In:Int, heap,
                        readAByte(T:K, Base:Int,
                  Other:Int, Size:Int, Ad:Int))) => .List) L:List </memOpList>
         <object>... <chunckRange> value(Left:Int, Right:Int) </chunckRange>
         <chunck> CL:List </chunck>
         <addrSpace> Ad:Int </addrSpace>
         <complete>... memId(Tid, Bn, In)
                          |-> (Count:Int => Count +Int 1) ...</complete>
         <race> Races:Set </race>
            ...</object>
         <byteMap>... Base +Int Other |-> V:K ...</byteMap>
         requires Base +Int Size <=Int Right
                     andBool Base >=Int Left
                 andBool rightHitType(CL, Base, T)
                 andBool hasInstance(Tid, Bn, In, .K, Races)
                 andBool Count +Int 1 <Int Size
                 andBool Size =/=Int 1

    rule <readBack> readMap(RM:Map (varInstance(Bn, In)
                 |-> varInstance(X:K, loadHold(T':K, LL:List))))
             => readMapAux(varInstance(Bn, In), varInstance(X:K,
                loadHold(T':K, insertToOrderList(Other, V, LL))), RM) </readBack>
         <threadId> Tid </threadId>
         <memOpList> (ListItem(singleMem(Tid:Int, Bn:Int, In:Int, heap,
                        readAByte(T:K, Base:Int,
                  Other:Int, Size:Int, Ad:Int))) => .List) L:List </memOpList>
         <object>... <chunckRange> value(Left:Int, Right:Int) </chunckRange>
         <chunck> CL:List </chunck>
         <addrSpace> Ad':Int </addrSpace>
         <complete>... memId(Tid, Bn, In)
                          |-> (Count:Int => Count +Int 1) ...</complete>
         <race> Races:Set </race>
            ...</object>
         <byteMap>... Base +Int Other |-> V:K ...</byteMap>
         <output>... .List =>
            ListItem("warning: input address space does not match with the address space of the memory.")
         </output>
         requires Base +Int Size <=Int Right andBool Base >=Int Left
                 andBool rightHitType(CL, Base, T)
                 andBool hasInstance(Tid, Bn, In, .K, Races)
                 andBool Count +Int 1 <Int Size
                 andBool Size =/=Int 1 andBool Ad =/=K Ad'

    rule <readBack> readMap(RM:Map (varInstance(Bn, In)
                 |-> varInstance(X:K, loadHold(T':K, LL:List))))
             => readMapAux(varInstance(Bn, In), varInstance(X:K,
                loadHold(T':K, insertToOrderList(Other, V, LL))), RM) </readBack>
         <threadId> Tid </threadId>
         <memOpList> (ListItem(singleMem(Tid:Int, Bn:Int, In:Int,heap,
                        readAByte(T:K, Base:Int,
                  Other:Int, Size:Int, Ad:Int))) => .List) L:List </memOpList>
         <object>... <chunckRange> value(Left:Int, Right:Int) </chunckRange>
         <chunck> CL:List </chunck>
         <addrSpace> Ad:Int </addrSpace>
         <complete> (CM:Map (memId(Tid, Bn, In)
                          |-> Count:K)) => CM </complete>
         <race> Races:Set => removeRaceInSet(Races,.K, Tid, Bn, In) </race> ...</object>
         <byteMap>... Base +Int Other |-> V:K ...</byteMap>
         requires Base +Int Size <=Int Right
                     andBool Base >=Int Left
                 andBool rightHitType(CL, Base, T)
                 andBool hasInstance(Tid, Bn, In, .K, Races)
                 andBool Count +Int 1 >=Int Size
                 andBool Size =/=Int 1

    rule <readBack> readMap(RM:Map (varInstance(Bn, In)
                 |-> varInstance(X:K, loadHold(T':K, LL:List))))
             => readMapAux(varInstance(Bn, In), varInstance(X:K,
                loadHold(T':K, insertToOrderList(Other, V, LL))), RM) </readBack>
         <threadId> Tid </threadId>
         <memOpList> (ListItem(singleMem(Tid:Int, Bn:Int, In:Int,heap,
                        readAByte(T:K, Base:Int,
                  Other:Int, Size:Int, Ad:Int))) => .List) L:List </memOpList>
         <object>... <chunckRange> value(Left:Int, Right:Int) </chunckRange>
         <chunck> CL:List </chunck>
         <addrSpace> Ad':Int </addrSpace>
         <complete> CM:Map ((memId(Tid, Bn, In)
                          |-> Count:K) => .Map) </complete>
         <race> Races:Set => removeRaceInSet(Races,.K, Tid, Bn, In) </race> ...</object>
         <byteMap>... Base +Int Other |-> V:K ...</byteMap>
         <output>... .List =>
            ListItem("warning: input address space does not match with the address space of the memory.")
         </output>
         requires Base +Int Size <=Int Right
                     andBool Base >=Int Left
                 andBool rightHitType(CL, Base, T)
                 andBool hasInstance(Tid, Bn, In, .K, Races)
                 andBool Count +Int 1 >=Int Size
                 andBool Size =/=Int 1 andBool Ad =/=K Ad'

    rule <k> K:K => .K </k>
         (<tomasulo>
            D:Bag
         </tomasulo> =>  <tomasulo>...
                        <instQueue> instList(.List) </instQueue>
                          ...</tomasulo>)
         <threadId> Tid </threadId>
         <memOpList> (ListItem(singleMem(Tid:Int, Bn:Int, In:Int,heap,
                        readAByte(T:K, Base:Int,
                  Other:Int, Size:Int, Ad:Int)))) L:List => .List </memOpList>
         <object>... <chunckRange> value(Left:Int, Right:Int) </chunckRange>
          <chunck> CL:List </chunck>
          <race> Races:Set </race> ...</object>
        <output>... .List => ListItem("error: undefied behavior because loading a position that has different type as original specified.") </output>
         requires Base+Int Size <=Int Right
                     andBool Base >=Int Left
                 andBool notBool rightHitType(CL, Base, T)
                 andBool notBool isOverlap(Base, Size, .K, Races)

    rule <k> A:K => .K </k>
         (<tomasulo>
            D:Bag
         </tomasulo> =>  <tomasulo>...
                        <instQueue> instList(.List) </instQueue>
                          ...</tomasulo>)
         <threadId> Tid </threadId>
         <memOpList> ListItem(singleMem(Tid:Int, Bn:Int, In:Int,heap,
                        readAByte(T:K, Base:Int,
                  Other:Int, Size:Int, Ad:Int))) L:List => .List </memOpList>
         <object>... <chunckRange> value(Left:Int, Right:Int) </chunckRange>
         <chunck> CL:List </chunck>
         <race> Races:Set </race>
            ...</object>
        <output>... .List => ListItem("error: undefied behavior because two mem op races on the same location") </output>
         requires Base +Int Size <=Int Right
                     andBool Base >=Int Left
                 andBool isOverlap(Base, Size, .K, Races)
                 andBool notBool hasInstance(Tid, Bn, In, .K, Races)

    //atomic write in stack
    rule <stackOpList> (ListItem(singleMem(Tid:Int, Bn:Int, In:Int,stack,
                        atomicWrite(T:K, V:K, V1:K, Base:Int,
                  Size:Int, Ad:Int, Order:K))) => .List) L:List </stackOpList>
         <stackObject>...
           <stackThreadId> Tid </stackThreadId>
         <stackAddrSpace> Ad:Int </stackAddrSpace>
            <stackChunckRange> value(Left:Int, Right:Int) </stackChunckRange>
         <stackChunck> CL:List </stackChunck> ...</stackObject>
         <stackMap> BM:Map => updateMemWithAtomic(BM, Base, V) </stackMap>
         requires Base +Int Size <=Int Right andBool Base >=Int Left
                 andBool rightHitType(CL, Base, T)

    rule <stackOpList> (ListItem(singleMem(Tid:Int, Bn:Int, In:Int,stack,
                        atomicWrite(T:K, V:K, V1:K, Base:Int,
                  Size:Int, Ad:Int, Order:K))) => .List) L:List </stackOpList>
         <stackObject>...
           <stackThreadId> Tid </stackThreadId>
         <stackAddrSpace> Ad':Int </stackAddrSpace>
            <stackChunckRange> value(Left:Int, Right:Int) </stackChunckRange>
         <stackChunck> CL:List </stackChunck> ...</stackObject>
         <stackMap> BM:Map => updateMemWithAtomic(BM, Base, V) </stackMap>
         <output>... .List =>
            ListItem("warning: input address space does not match with the address space of the stack.")
         </output>
         requires Base +Int Size <=Int Right andBool Base >=Int Left
                 andBool rightHitType(CL, Base, T) andBool Ad =/=K Ad'

    rule <stackOpList> (ListItem(singleMem(Tid:Int, Bn:Int, In:Int,stack,
                        atomicWrite(T:K, V:K, V1:K, Base:Int,
                  Size:Int,Ad:Int, Order:K))) => .List) L:List </stackOpList>
         <stackObject>...
           <stackThreadId> Tid </stackThreadId>
         <stackAddrSpace> Ad:Int </stackAddrSpace>
             <stackChunckRange> value(Left:Int, Right:Int) </stackChunckRange>
         <stackChunck> CL:List => getTopMemList(Base,
                       0, Size, sizeof(T), T, Rg) </stackChunck>
          <stackRange> Rg:K </stackRange> ...</stackObject>
         <stackMap> BM:Map => updateMemWithAtomic(BM, Base, V) </stackMap>
         requires Base +Int Size <=Int Right
                     andBool Base >=Int Left
                 andBool notBool rightHitType(CL, Base, T)

    rule <stackOpList> (ListItem(singleMem(Tid:Int, Bn:Int, In:Int,stack,
                        atomicWrite(T:K, V:K, V1:K, Base:Int,
                  Size:Int,Ad:Int, Order:K))) => .List) L:List </stackOpList>
         <stackObject>...
           <stackThreadId> Tid </stackThreadId>
         <stackAddrSpace> Ad':Int </stackAddrSpace>
             <stackChunckRange> value(Left:Int, Right:Int) </stackChunckRange>
         <stackChunck> CL:List => getTopMemList(Base,
                       0, Size, sizeof(T), T, Rg) </stackChunck>
          <stackRange> Rg:K </stackRange> ...</stackObject>
         <stackMap> BM:Map => updateMemWithAtomic(BM, Base, V) </stackMap>
         <output>... .List =>
            ListItem("warning: input address space does not match with the address space of the stack.")
         </output>
         requires Base +Int Size <=Int Right andBool Base >=Int Left
                 andBool notBool rightHitType(CL, Base, T)
                 andBool Ad =/=K Ad'

    //atomic read in stack
    rule <readBack> readMap(RM:Map (varInstance(Bn, In)
                 |-> varInstance(X:K, loadHold(T':K, .List))))
             => readMapAux(varInstance(Bn, In), varInstance(X:K,
                loadHold(T':K, getMemWithAtomic(BM, Base, 0, Size))), RM) </readBack>
         <stackOpList> (ListItem(singleMem(Tid:Int, Bn:Int, In:Int,stack,
                        atomicRead(T:K, Base:Int,
                  Size:Int, Ad:Int, Order:K))) => .List) L:List </stackOpList>
         <stackObject>...
           <stackThreadId> Tid </stackThreadId>
         <stackAddrSpace> Ad:Int </stackAddrSpace>
            <stackChunckRange> value(Left:Int, Right:Int) </stackChunckRange>
         <stackChunck> CL:List </stackChunck> ...</stackObject>
         <stackMap> BM:Map </stackMap>
         requires Base +Int Size <=Int Right
                     andBool Base >=Int Left
                 andBool rightHitType(CL, Base, T)

    rule <readBack> readMap(RM:Map (varInstance(Bn, In)
                 |-> varInstance(X:K, loadHold(T':K, .List))))
             => readMapAux(varInstance(Bn, In), varInstance(X:K,
                loadHold(T':K, getMemWithAtomic(BM, Base, 0, Size))), RM) </readBack>
         <stackOpList> (ListItem(singleMem(Tid:Int, Bn:Int, In:Int,stack,
                        atomicRead(T:K, Base:Int,
                  Size:Int, Ad:Int, Order:K))) => .List) L:List </stackOpList>
         <stackObject>...
           <stackThreadId> Tid </stackThreadId>
         <stackAddrSpace> Ad':Int </stackAddrSpace>
            <stackChunckRange> value(Left:Int, Right:Int) </stackChunckRange>
         <stackChunck> CL:List </stackChunck> ...</stackObject>
         <stackMap> BM:Map </stackMap>
         <output>... .List =>
            ListItem("warning: input address space does not match with the address space of the stack.")
         </output>
         requires Base +Int Size <=Int Right andBool Base >=Int Left
                 andBool rightHitType(CL, Base, T) andBool Ad =/=K Ad'

    rule <k> K:K => .K </k>
         (<tomasulo>
            D:Bag
         </tomasulo> =>  <tomasulo>...
                        <instQueue> instList(.List) </instQueue>
                          ...</tomasulo>)
         <stackOpList> (ListItem(singleMem(Tid:Int, Bn:Int, In:Int,stack,
                        atomicRead(T:K, Base:Int,
                  Size:Int, Ad:Int, Order:K)))) L:List => .List </stackOpList>
         <stackObject>...
           <stackThreadId> Tid </stackThreadId>
             <stackChunckRange> value(Left:Int, Right:Int) </stackChunckRange>
         <stackChunck> CL:List </stackChunck> ...</stackObject>
        <output>... .List => ListItem("undefied behavior because atomic loading a stack position that has different type as original specified.") </output>
         requires Base +Int Size <=Int Right
                     andBool Base >=Int Left
                 andBool notBool rightHitType(CL, Base, T)

    //atomic write with unordered/monotonic in heap
    rule <memOpList> (ListItem(singleMem(Tid:Int, Bn:Int, In:Int,heap,
                        atomicWrite(T:K, V:K, V1:K, Base:Int,
                  Size:Int, Ad:Int, Order:K))) => .List) L:List </memOpList>
         <object>... <chunckRange> value(Left:Int, Right:Int) </chunckRange>
         <chunck> CL:List </chunck>
         <addrSpace> Ad:Int </addrSpace>
         <race> Races:Set </race> ...</object>
         <byteMap> BM:Map => updateMemWithAtomic(BM, Base, V) </byteMap>
         requires Base +Int Size <=Int Right
                     andBool Base >=Int Left
                 andBool rightHitType(CL, Base, T)
                 andBool notBool isOverlap(Base, Size, .K, Races)
                 andBool (Order ==K monotonic orBool Order ==K unordered)

    rule <memOpList> (ListItem(singleMem(Tid:Int, Bn:Int, In:Int,heap,
                        atomicWrite(T:K, V:K, V1:K, Base:Int,
                  Size:Int, Ad:Int, Order:K))) => .List) L:List </memOpList>
         <object>... <chunckRange> value(Left:Int, Right:Int) </chunckRange>
         <chunck> CL:List </chunck>
         <addrSpace> Ad':Int </addrSpace>
         <race> Races:Set </race> ...</object>
         <byteMap> BM:Map => updateMemWithAtomic(BM, Base, V) </byteMap>
         <output>... .List =>
            ListItem("warning: input address space does not match with the address space of the memory.")
         </output>
         requires Base +Int Size <=Int Right
                     andBool Base >=Int Left
                 andBool rightHitType(CL, Base, T)
                 andBool notBool isOverlap(Base, Size, .K, Races)
                 andBool (Order ==K monotonic orBool Order ==K unordered)
                 andBool Ad =/=K Ad'

    rule <memOpList> (ListItem(singleMem(Tid:Int, Bn:Int, In:Int,heap,
                        atomicWrite(T:K, V:K, V1:K, Base:Int,
                  Size:Int, Ad:Int, Order:K))) => .List) L:List </memOpList>
         <object>... <chunckRange> value(Left:Int, Right:Int) </chunckRange>
         <chunck> CL:List => getTopMemList(Base,
                       0, Size, sizeof(T), T, Rg) </chunck>
         <addrSpace> Ad:Int </addrSpace>
          <range> Rg:K </range> <race> Races:Set </race> ...</object>
         <byteMap> BM:Map => updateMemWithAtomic(BM, Base, V) </byteMap>
         requires Base +Int Size <=Int Right andBool Base >=Int Left
                 andBool notBool rightHitType(CL, Base, T)
                 andBool notBool isOverlap(Base, Size, .K, Races)
                 andBool (Order ==K monotonic orBool Order ==K unordered)

    rule <memOpList> (ListItem(singleMem(Tid:Int, Bn:Int, In:Int,heap,
                        atomicWrite(T:K, V:K, V1:K, Base:Int,
                  Size:Int, Ad:Int, Order:K))) => .List) L:List </memOpList>
         <object>... <chunckRange> value(Left:Int, Right:Int) </chunckRange>
         <chunck> CL:List => getTopMemList(Base,
                       0, Size, sizeof(T), T, Rg) </chunck>
         <addrSpace> Ad':Int </addrSpace>
          <range> Rg:K </range> <race> Races:Set </race> ...</object>
         <byteMap> BM:Map => updateMemWithAtomic(BM, Base, V) </byteMap>
         <output>... .List =>
            ListItem("warning: input address space does not match with the address space of the memory.")
         </output>
         requires Base +Int Size <=Int Right andBool Base >=Int Left
                 andBool notBool rightHitType(CL, Base, T)
                 andBool notBool isOverlap(Base, Size, .K, Races)
                 andBool (Order ==K monotonic orBool Order ==K unordered)
                 andBool Ad =/=K Ad'


    rule <k> A:K => .K </k>
         (<tomasulo>
            D:Bag
         </tomasulo> =>  <tomasulo>...
                        <instQueue> instList(.List) </instQueue>
                          ...</tomasulo>)
         <memOpList> ListItem(singleMem(Tid:Int, Bn:Int, In:Int,heap,
                        atomicWrite(T:K,V:K, V1:K, Base:Int,
                  Size:Int, Ad:Int, Order:K))) L:List => .List </memOpList>
         <object>... <chunckRange> value(Left:Int, Right:Int) </chunckRange>
         <race> Races:Set </race>
            ...</object>
        <output>... .List => ListItem("error: undefied behavior because an atomic mem op happens at the middle of an non-atomic mem op.") </output>
         requires Base +Int Size <=Int Right
                     andBool Base >=Int Left
                 andBool isOverlap(Base, Size, .K, Races)

    //atomic read with unordered/monotonic in heap
    rule <readBack> readMap(RM:Map (varInstance(Bn, In)
                 |-> varInstance(X:K, loadHold(T':K, .List))))
             => readMapAux(varInstance(Bn, In), varInstance(X:K,
                loadHold(T':K, getMemWithAtomic(BM, Base, 0, Size))), RM) </readBack>
         <memOpList> (ListItem(singleMem(Tid:Int, Bn:Int, In:Int,heap,
                        atomicRead(T:K, Base:Int,
                  Size:Int, Ad:Int, Order:K))) => .List) L:List </memOpList>
         <object>... <chunckRange> value(Left:Int, Right:Int) </chunckRange>
         <chunck> CL:List </chunck>
         <addrSpace> Ad:Int </addrSpace>
         <race> Races:Set </race> ...</object>
         <byteMap> BM:Map </byteMap>
         requires Base +Int Size <=Int Right
                     andBool Base >=Int Left
                 andBool rightHitType(CL, Base, T)
                 andBool notBool isOverlap(Base, Size, .K, Races)
                 andBool (Order ==K monotonic orBool Order ==K unordered)

    rule <readBack> readMap(RM:Map (varInstance(Bn, In)
                 |-> varInstance(X:K, loadHold(T':K, .List))))
             => readMapAux(varInstance(Bn, In), varInstance(X:K,
                loadHold(T':K, getMemWithAtomic(BM, Base, 0, Size))), RM) </readBack>
         <memOpList> (ListItem(singleMem(Tid:Int, Bn:Int, In:Int,heap,
                        atomicRead(T:K, Base:Int,
                  Size:Int, Ad:Int, Order:K))) => .List) L:List </memOpList>
         <object>... <chunckRange> value(Left:Int, Right:Int) </chunckRange>
         <chunck> CL:List </chunck>
         <addrSpace> Ad':Int </addrSpace>
         <race> Races:Set </race> ...</object>
         <byteMap> BM:Map </byteMap>
         <output>... .List =>
            ListItem("warning: input address space does not match with the address space of the memory.")
         </output>
         requires Base +Int Size <=Int Right
                     andBool Base >=Int Left
                 andBool rightHitType(CL, Base, T)
                 andBool notBool isOverlap(Base, Size, .K, Races)
                 andBool (Order ==K monotonic orBool Order ==K unordered)
                 andBool Ad =/=K Ad'

    rule <k> A:K => .K </k>
         (<tomasulo>
            D:Bag
         </tomasulo> =>  <tomasulo>...
                        <instQueue> instList(.List) </instQueue>
                          ...</tomasulo>)
         <memOpList> (ListItem(singleMem(Tid:Int, Bn:Int, In:Int,heap,
                        atomicRead(T:K, Base:Int,
                  Size:Int, Ad:Int, Order:K))) => .List) L:List </memOpList>
         <object>... <chunckRange> value(Left:Int, Right:Int) </chunckRange>
         <chunck> CL:List </chunck> <race> Races:Set </race> ...</object>
        <output>... .List => ListItem("undefied behavior because atomic loading a heap position that has different type as original specified.") </output>
         requires Base +Int Size <=Int Right
                     andBool Base >=Int Left
                 andBool notBool rightHitType(CL, Base, T)
                 andBool notBool isOverlap(Base, Size, .K, Races)

    rule <k> A:K => .K </k>
         (<tomasulo>
            D:Bag
         </tomasulo> =>  <tomasulo>...
                        <instQueue> instList(.List) </instQueue>
                          ...</tomasulo>)
         <memOpList> ListItem(singleMem(Tid:Int, Bn:Int, In:Int,heap,
                        atomicRead(T:K, Base:Int,
                  Size:Int, Ad:Int, Order:K))) L:List => .List </memOpList>
         <object>... <chunckRange> value(Left:Int, Right:Int) </chunckRange>
         <race> Races:Set </race>
            ...</object>
        <output>... .List => ListItem("error: undefied behavior because an atomic mem op happens at the middle of an non-atomic mem op.") </output>
         requires Base +Int Size <=Int Right
                     andBool Base >=Int Left
                 andBool isOverlap(Base, Size, .K, Races)

endmodule

module LLVM-COMPARISONS
    imports LLVM-SYNTAX
    imports LLVM-ABSTRACTSYNTAX
    imports LLVM-SETTINGS
    imports LLVM-HELPERS
    imports LLVM-CONFIGURATION
    imports LLVM-STANDARD-LIBRARY-SYNTAX
    imports LLVM-SYSCALLS-SYNTAX

    rule iCmp(Op:K, T:KResult, V1:KResult, V2:KResult)
                        => applyIcmps(Op, T, V1, V2, .ElemList)
/*
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
*/
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
                  => applyCasts(trunc, Type,
                             normalizingInt(getIntType(Type), I), getIntType(Type2))
    rule [zext]:
        theZExt(Type:KResult, I:KResult, Type2:KResult)
                  => applyCasts(zext, Type,
                             normalizingInt(getIntType(Type), I), getIntType(Type2))

    rule [sext]:
        theSExt(Type:KResult, I:KResult, Type2:KResult)
                  => applyCasts(sext, Type,
                             normalizingInt(getIntType(Type), I), getIntType(Type2))

    rule [addrspacecast]:
        theAddrSpaceCast(Type:KResult, I:KResult, Type2:KResult)
               => insertTypeToLocs(dealWithZero(Type, I), Type2)

    rule [ptrtoint]:
        thePtrToInt(Type:KResult, I:KResult, Type2:KResult)
             => thePtrToIntAux(toIntLocs(I), Type2)
        requires notBool hasInRanges(I) andBool I =/=K zeroinitializer
    rule thePtrToInt(Type:KResult, zeroinitializer, Type2:KResult)
             => thePtrToIntAux(toIntLocs(dealWithZeroInitializer(Type)), Type2)

    rule thePtrToIntAux(I:KResult, integerType(N:Int))
          => applyCasts(trunc, integerType(numBitsPerByte *Int numBytesPerPointer)
                    , I, integerType(N:Int))
         requires N <Int numBitsPerByte *Int numBytesPerPointer
    rule thePtrToIntAux(I:KResult, integerType(N:Int))
          => applyCasts(zext, integerType(numBitsPerByte *Int numBytesPerPointer)
                    , I, integerType(N:Int))
         requires N >Int numBitsPerByte *Int numBytesPerPointer
    rule thePtrToIntAux(I:KResult, integerType(N:Int)) => I
         requires N ==Int numBitsPerByte *Int numBytesPerPointer

    rule thePtrToIntAux(I:KResult, vectorTypeValue(integerType(N:Int), X:Int))
          => applyCasts(trunc, vectorTypeValue(integerType(
                         numBitsPerByte *Int numBytesPerPointer), X)
                    , I, integerType(N:Int))
         requires N <Int numBitsPerByte *Int numBytesPerPointer
    rule thePtrToIntAux(I:KResult, vectorTypeValue(integerType(N:Int), X:Int))
          => applyCasts(zext, vectorTypeValue(integerType(
                         numBitsPerByte *Int numBytesPerPointer), X)
                    , I, integerType(N:Int))
         requires N >Int numBitsPerByte *Int numBytesPerPointer
    rule thePtrToIntAux(I:KResult, vectorTypeValue(integerType(N:Int), X:Int)) => I
         requires N ==Int numBitsPerByte *Int numBytesPerPointer


    rule [ptrtoint-fail]:
        <k> thePtrToInt(Type:KResult, I:KResult, Type2:KResult) ~> K:K
            => .K </k>
         <output>... .List
                => ListItem("error: undefined behavior due to inrange flag getelementptr result used in ptrtoint ops.") </output>
         (<tomasulo>
            D:Bag
         </tomasulo> =>  <tomasulo>...
                        <instQueue> instList(.List) </instQueue>
                          ...</tomasulo>)
        requires hasInRanges(I)

    rule [inttoptr]:
        theIntToPtr(T:KResult, I:KResult, Type2:KResult)
             => theIntToPtrAux(applyCasts(zext, T,
             I, integerType(numBitsPerByte *Int numBytesPerPointer)), Type2)
         requires getIntInIntType(T) <Int numBitsPerByte *Int numBytesPerPointer
    rule theIntToPtr(T:KResult, I:KResult, Type2:KResult)
             => theIntToPtrAux(applyCasts(trunc, T,
             I, integerType(numBitsPerByte *Int numBytesPerPointer)), Type2)
         requires getIntInIntType(T) >Int numBitsPerByte *Int numBytesPerPointer
    rule theIntToPtr(T:KResult, I:KResult, Type2:KResult)
             => theIntToPtrAux(I, Type2)
         requires getIntInIntType(T) ==Int numBitsPerByte *Int numBytesPerPointer

    rule theIntToPtrAux(I:KResult, T:K) => reverseLocs(I, T)

    //semantics of bitcast
    rule theBitCast(pointerTypeValue(T1:KResult, Ad:Int),
                A:KResult, pointerTypeValue(T2:KResult, Ad':Int))
               => insertTypeToLoc(dealWithZero(
                      pointerTypeValue(T1:KResult, Ad:Int), A),
                 pointerTypeValue(T2:KResult, Ad':Int))
    rule theBitCast(vectorTypeValue(pointerTypeValue(T1:KResult, Ad:Int), I:Int),
                A:KResult, vectorTypeValue(pointerTypeValue(T2:KResult, Ad':Int), I':Int))
               => insertTypeToLocs(dealWithZero(vectorTypeValue(
                        pointerTypeValue(T1:KResult, Ad:Int), I:Int), A),
               pointerTypeValue(T2:KResult, Ad':Int))
    rule theBitCast(T1:KResult, A:KResult, T2:KResult)
               => joinBitsToVal(T2, splitToBits(T1, dealWithZero(T1, A)))
         requires notBool hasPointerType(T1) andBool notBool hasPointerType(T2)

    // TODO need to normalize here
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

    //rule float(S) => String2Float(S)
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
        <k> call(_, calleeValue(funptr(name(globalVar, "exit")), V:K))
            => .K ...</k>
        (.Bag => <result><returnValue> V </returnValue></result>)

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
            => store(byteType, load('pointerType(byteType,, 0), Src, 1),
                           'pointerType(byteType,, 0), Dest, 1)
            ~> memcpy(Dest + 1, Src + 1, Len -Int 1, K1, K2)
        ...</k>
        when Len >Int 0
    rule
        <k> memcpy(_, _, 0, _, _) => .K ...</k>

    // memset
    rule
        <k> memset(Dest:Loc, N:Int, Len:Int, K1:K, K2:K)
            => store(byteType, N,'pointerType(byteType,, 0), Dest, 1)
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
    /*rule
        <k> 'sys-brk(ptrToIntOfLoc(_,Loc:Loc),, _) => Brk ...</k>
        <brk> Brk:Loc </brk>
        when Loc ==K 'nullOfConstValueRef(.KList)
        */

    // TODO krun should provide this value
    rule <k> 'sys-getpid(_) => 10000 ...</k>

    syntax KItem ::= printString(K) [strict]
    syntax KItem ::= readString(K, K)
    syntax KItem ::= "readString'" "(" K "," K "," K ")"

   /*
    rule
        <k> 'sys-write(FileDesc:Int,, ptrToIntOfLoc(_, Loc:Loc),, Len:Int,, _)
            => printString(readString(Loc, Len))
        ...</k>
        when Len >=Int 0
     */
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
         (<tomasulo>
            D:Bag
         </tomasulo> =>  <tomasulo>...
                        <instQueue> instList(.List) </instQueue>
                          ...</tomasulo>)
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
    imports LLVM-REGISTERS
    imports LLVM-BRANCHING
    imports LLVM-PHI
    imports LLVM-SELECTION
    imports LLVM-START-AND-STOP
    imports LLVM-DECLARATIONS
    imports LLVM-PREPROCESSING
    imports LLVM-NORMALIZING

    imports LLVM-GLOBALS
    imports LLVM-CALL-RET
    imports LLVM-VARIADICS
    imports LLVM-ARITHMETIC

    imports LLVM-FLOATING-POINT-ARITHMETIC
    imports LLVM-GEP

    //imports LLVM-HELPERS-SPLIT-BYTES

    //imports LLVM-HELPERS-JOIN-BYTES

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
