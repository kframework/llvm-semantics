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

    rule <threads> TB:Bag
          <thread>...
           <k> getElementPtr(pointerTypeValue(T:K, Ad:Int), A:K, Indices:KResult) ~> K:K </k>
          ...</thread> => .Bag
         </threads>
         <output>... .List
                => ListItem("error: undefined behavior due to getelementptr of struct type index out of range.") </output>
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

    //syntax KItem ::= splitBytes(K, K, K)   //value numBytes, type
    //syntax KItem ::= splitIntegerBytes(K, K, K) // value, numBytes, type
    //syntax KItem ::= "splitIntegerBytes'" "(" K "," K "," List ")" // value, numbytes, accumulator
    //syntax KItem ::= splitFloatBytes(K, K, K, K, List) // value, type, numBytes, accnum accumulator
    //syntax KItem ::= splitPointerBytes(K, K) // value, numBytes
    //syntax KItem ::= "splitPointerBytes'" "(" K "," K "," K "," List ")" // value, numbytes, whichByte, accumulator
    //syntax KItem ::= splitArrayVectorBytes(ElemList, K, List, K, K) // values, value, numBytes, type
   // syntax KItem ::= splitStructBytes(K, K, K, List) // value, singleValue, field types, accumulator

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
/*
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

    rule
        <k> splitBytes(V:KResult, Type:KResult)
            => splitPointerBytes(V, sizeof(Type))
        ...</k>
        when isPointerType(Type)


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

    //communication between channels
    rule <memory>... <channelOps> ListItem(sendToAll(A:Int,
         (Chan:Int => Chan +Int 1), Size:Int, MsgN:Int, TMN:Map, Msg:K)) L:List </channelOps>
                   ...</memory>
    <memory>... <channelId> Chan </channelId>
                <channelOps> RL:List (.List => ListItem(rec(A, MsgN, TMN, Msg))) </channelOps> 
        ...</memory>
    requires Chan <Int Size andBool Chan =/=Int A

    rule <memory>... <channelOps> ListItem(sendToAll(A:Int,
         (A:Int => A +Int 1), Size:Int, MsgN:Int, TMN:Map, Msg:K)) L:List </channelOps> ...</memory>
         requires A <Int Size

    rule <memory>... <channelOps> (ListItem(sendToAll(A:Int,
         Size, Size:Int, MsgN:Int,TMN:Map, Msg:K)) => .List) L:List </channelOps> ...</memory>

    //create new mems message exchange
    //create or realloc new memory in heap in every channel
    rule <memory>...
           <channelId> Chan':Int </channelId>
          (<object>... <chunckRange> value(Base:Int, Right:Int) </chunckRange>
             ...</object> =>
              <object>...
               <chunckRange> V </chunckRange>
               <size> N </size>
              <addrSpace> Ad </addrSpace>
               <range> Ran </range> 
               <align> Al </align>
                       ...</object>)
                  <timeStamps> TMN:Map => addOneInTimeStamp(Chan', updateTimeStamp(
                               0, maxMemChannel, .K, .K, TMN, TMN')) </timeStamps>
                <channelOps> (ListItem(rec(Chan:Int, MsgN:Int, TMN':Map,
              toCloseAndNext(Base:Int, startMem(V:K,
               N:Int, Ad:Int, Ran:K, Al:Int)))) => .List) RL:List </channelOps>
           ...</memory>
           <memory>... <channelId> Chan </channelId>
                       <ackMap>... MsgN |->
                    (AcK:Int => AcK +Int 1) ...</ackMap> ...</memory>
         requires notBool timeStampGreater(0, maxMemChannel, .K, .K, TMN, TMN')
         [transition]

    rule <memory>...
           <channelId> Chan':Int </channelId>
          (.Bag =>
              <object>...
               <chunckRange> V </chunckRange>
               <size> N </size>
              <addrSpace> Ad </addrSpace>
               <range> Ran </range> 
               <align> Al </align>
                       ...</object>)
                  <timeStamps> TMN:Map => addOneInTimeStamp(Chan', updateTimeStamp(
                               0, maxMemChannel, .K, .K, TMN, TMN')) </timeStamps>
                <channelOps> (ListItem(rec(Chan:Int, MsgN:Int, TMN':Map, startMem(V:K,
               N:Int, Ad:Int, Ran:K, Al:Int))) => .List) RL:List </channelOps>
           ...</memory>
           <memory>... <channelId> Chan </channelId>
                       <ackMap>... MsgN |->
                    (AcK:Int => AcK +Int 1) ...</ackMap> ...</memory>
         requires notBool timeStampGreater(0, maxMemChannel, .K, .K, TMN, TMN')
         [transition]

    rule <memory>...
           <channelId> Chan':Int </channelId>
                  <timeStamps> TMN:Map </timeStamps>
                <channelOps> (ListItem(rec(Chan:Int, MsgN:Int, TMN':Map,
                                Msg:K)) => .List) RL:List </channelOps>
            <byteMap> BM:Map </byteMap>
           ...</memory>
           <memory>... <channelId> Chan </channelId>
                       <ackMap>... (MsgN |-> (AcK => AcK +Int 1))
                                                  ...</ackMap> ...</memory>
         requires timeStampGreater(0, maxMemChannel, .K, .K, TMN, TMN')
                   andBool getOrderInMsg(Msg) ==K seq_cst
         [transition]

    rule <memory>...
           <channelId> Chan':Int </channelId>
                  <timeStamps> TMN:Map </timeStamps>
                <channelOps> (ListItem(rec(Chan:Int, MsgN:Int, TMN':Map,
                                msgSeqFence)) => .List) RL:List </channelOps>
            <byteMap> BM:Map </byteMap>
           ...</memory>
           <memory>... <channelId> Chan </channelId>
                       <ackMap>  ACM:Map (MsgN |-> (AcK => AcK +Int 1))
                                                  </ackMap> ...</memory>
         requires notBool timeStampGreater(0, maxMemChannel, .K, .K, TMN, TMN')
        [transition]

    rule <memory>...
           <channelId> Chan':Int </channelId>
                  <timeStamps> TMN:Map </timeStamps>
                <channelOps> (ListItem(rec(Chan:Int, MsgN:Int, TMN':Map,
                                Msg:K)) => .List) RL:List </channelOps>
            <byteMap> BM:Map </byteMap>
           ...</memory>
           <memory>... <channelId> Chan </channelId>
                       <ackMap>  ACM:Map ((MsgN |-> AcK)
                          => checkAcks(MsgN, AcK +Int 1)) </ackMap> ...</memory>
         requires timeStampGreater(0, maxMemChannel, .K, .K, TMN, TMN')
                   andBool getOrderInMsg(Msg) =/=K seq_cst
         [transition]

    rule <memory>...
            <memOpList> (ListItem(singleMem(Tid:Int, Bn:Int, In:Int,heap,
                        msgWait(MsgN)))
                           => .List) L:List </memOpList>
         <ackMap> AM:Map ((MsgN |-> N:Int) => .Map) </ackMap>
             ...</memory>
         requires N ==Int maxMemChannel -Int 1
         [structural]

    //non-atomic memory write in other channel
    rule <memory>...
         <object>... <chunckRange> value(Left:Int, Right:Int) </chunckRange>
         <race> Races:Set </race>
         <complete> CM:Map </complete> ...</object>
           <channelId> Chan':Int </channelId>
                  <timeStamps> TMN:Map => addOneInTimeStamp(Chan', updateTimeStamp(
                               0, maxMemChannel, .K, .K, TMN, TMN')) </timeStamps>
          <channelOps> (ListItem(rec(Chan:Int, MsgN:Int, TMN':Map,
            msgByteWrite(Tid:Int,Bn:Int, In:Int, Base:Int,
                     Off:Int, 1, V:K))) => .List) RL:List </channelOps>
            <byteMap> BM:Map => BM[Base +Int Off <- V] </byteMap>
           ...</memory>
           <memory>... <channelId> Chan </channelId>
                       <ackMap> ACM:Map ((MsgN |-> AcK)
                          => checkAcks(MsgN, AcK +Int 1)) </ackMap> ...</memory>
         requires notBool timeStampGreater(0, maxMemChannel, .K, .K, TMN, TMN')
           andBool Base +Int 1 <=Int Right andBool Base  >=Int Left
                 andBool notBool isOverlap(Base, 1, .K, Races)
         [transition]

    rule <memory>...
         <object>... <chunckRange> value(Left:Int, Right:Int) </chunckRange>
         <race> Races:Set (.Set => SetItem(
                   singleMem(Tid, Bn, In, heap, value(Base,
                 Base +Int Size)))) </race>
         <complete> CM:Map => CM[memId(Tid,Bn,In) <- 1] </complete>
             ...</object>
         <channelId> Chan':Int </channelId>
          <timeStamps> TMN:Map => addOneInTimeStamp(Chan', updateTimeStamp(
                               0, maxMemChannel, .K, .K, TMN, TMN')) </timeStamps>
          <channelOps> (ListItem(rec(Chan:Int, MsgN:Int, TMN':Map,
            msgByteWrite(Tid:Int,Bn:Int, In:Int,
                      Base:Int, Off:Int, Size:Int, V:K))) => .List) RL:List </channelOps>
            <byteMap> BM:Map => BM[Base +Int Off <- V] </byteMap>
           ...</memory>
           <memory>... <channelId> Chan </channelId>
                       <ackMap> ACM:Map ((MsgN |-> AcK)
                          => checkAcks(MsgN, AcK +Int 1)) </ackMap> ...</memory>
         requires notBool timeStampGreater(0, maxMemChannel, .K, .K, TMN, TMN')
           andBool Base +Int Size <=Int Right andBool Base  >=Int Left
                 andBool notBool isOverlap(Base, Size, .K, Races)
                 andBool notBool memId(Tid, Bn, In) in keys(CM)
                 andBool Size =/=Int 1
          [transition]

    rule <memory>...
         <object>... <chunckRange> value(Left:Int, Right:Int) </chunckRange>
         <complete>... memId(Tid, Bn, In)
                          |-> (Count:Int => Count +Int 1) ...</complete>
         <race> Races:Set </race>
             ...</object>
         <channelId> Chan':Int </channelId>
          <timeStamps> TMN:Map => addOneInTimeStamp(Chan', updateTimeStamp(
                               0, maxMemChannel, .K, .K, TMN, TMN')) </timeStamps>
          <channelOps> (ListItem(rec(Chan:Int, MsgN:Int, TMN':Map,
            msgByteWrite(Tid:Int,Bn:Int, In:Int,
                      Base:Int, Off:Int, Size:Int, V:K))) => .List) RL:List </channelOps>
            <byteMap> BM:Map => BM[Base +Int Off <- V] </byteMap>
           ...</memory>
           <memory>... <channelId> Chan </channelId>
                       <ackMap> ACM:Map ((MsgN |-> AcK)
                          => checkAcks(MsgN, AcK +Int 1)) </ackMap> ...</memory>
         requires notBool timeStampGreater(0, maxMemChannel, .K, .K, TMN, TMN')
           andBool Base +Int Size <=Int Right andBool Base  >=Int Left
                 andBool Count +Int 1 <Int Size
                 andBool Size =/=Int 1
         [transition]

    rule <memory>...
         <object>... <chunckRange> value(Left:Int, Right:Int) </chunckRange>
         <complete> CM:Map ((memId(Tid, Bn, In)
                          |-> Count:K) => .Map) </complete>
         <race> Races:Set => removeRaceInSet(Races,.K, Tid, Bn, In) </race>
             ...</object>
         <channelId> Chan':Int </channelId>
          <timeStamps> TMN:Map => addOneInTimeStamp(Chan', updateTimeStamp(
                               0, maxMemChannel, .K, .K, TMN, TMN')) </timeStamps>
          <channelOps> (ListItem(rec(Chan:Int, MsgN:Int, TMN':Map,
            msgByteWrite(Tid:Int,Bn:Int, In:Int,
                      Base:Int, Off:Int, Size:Int, V:K))) => .List) RL:List </channelOps>
            <byteMap> BM:Map => BM[Base +Int Off <- V] </byteMap>
           ...</memory>
           <memory>... <channelId> Chan </channelId>
                       <ackMap> ACM:Map ((MsgN |-> AcK)
                          => checkAcks(MsgN, AcK +Int 1)) </ackMap> ...</memory>
         requires notBool timeStampGreater(0, maxMemChannel, .K, .K, TMN, TMN')
           andBool Base +Int Size <=Int Right andBool Base  >=Int Left
                 andBool Count +Int 1 >=Int Size
                 andBool Size =/=Int 1
         [transition]

    rule <threads> Td:Bag => .Bag </threads>
         <memory>...
         <object>... <chunckRange> value(Left:Int, Right:Int) </chunckRange>
         <complete> CM:Map </complete>
         <race> Races:Set </race> ...</object>
         <channelId> Chan':Int </channelId>
          <timeStamps> TMN:Map </timeStamps>
          <channelOps> (ListItem(rec(Chan:Int, MsgN:Int, TMN':Map,
            msgByteWrite(Tid:Int,Bn:Int, In:Int,
                      Base:Int, Off:Int, Size:Int, V:K))) RL:List => .List) </channelOps>
            <byteMap> BM:Map </byteMap>
           ...</memory>
           <memory>... <channelId> Chan </channelId>
                       <ackMap> ACM:Map (MsgN |-> AcK) </ackMap> ...</memory>
        <output>... .List =>
          ListItem("error: undefied behavior because two mem op races on the same location") </output>
         requires notBool timeStampGreater(0, maxMemChannel, .K, .K, TMN, TMN')
            andBool Base +Int Size <=Int Right andBool Base >=Int Left
                 andBool isOverlap(Base, Size, .K, Races)
        [transition]

    //close the memory heap in all channels
    rule <memory>...
          (<object>... <chunckRange> value(Base:Int, Right:Int) </chunckRange>
             ...</object> => .Bag)
         <channelId> Chan':Int </channelId>
          <timeStamps> TMN:Map => addOneInTimeStamp(Chan', updateTimeStamp(
                               0, maxMemChannel, .K, .K, TMN, TMN')) </timeStamps>
          <channelOps> (ListItem(rec(Chan:Int, MsgN:Int, TMN':Map,
                            toClose(Base:Int))) => .List) RL:List </channelOps>
           ...</memory>
           <memory>... <channelId> Chan </channelId>
                       <ackMap> ACM:Map ((MsgN |-> AcK)
                          => checkAcks(MsgN, AcK +Int 1)) </ackMap> ...</memory>
         requires notBool timeStampGreater(0, maxMemChannel, .K, .K, TMN, TMN')
         [transition]


    //atomic memory write in other channel
    rule <memory>...
         <object>... <chunckRange> value(Left:Int, Right:Int) </chunckRange>
         <complete> CM:Map </complete>
         <race> Races:Set </race>
             ...</object>
         <channelId> Chan':Int </channelId>
          <timeStamps> TMN:Map => addOneInTimeStamp(Chan', updateTimeStamp(
                               0, maxMemChannel, .K, .K, TMN, TMN')) </timeStamps>
          <channelOps> (ListItem(rec(Chan:Int, MsgN:Int, TMN':Map,
            msgWrite(Tid:Int,Bn:Int, In:Int,
                      Base:Int, Size:Int, V:K, Ord:K))) => .List) RL:List </channelOps>
            <byteMap> BM:Map => updateMemWithAtomic(BM, Base, V) </byteMap>
           ...</memory>
           <memory>... <channelId> Chan </channelId>
                       <ackMap> ACM:Map ((MsgN |-> AcK)
                          => checkAcks(MsgN, AcK +Int 1)) </ackMap> ...</memory>
         requires notBool timeStampGreater(0, maxMemChannel, .K, .K, TMN, TMN')
           andBool Base +Int Size <=Int Right andBool Base  >=Int Left
                 andBool notBool isOverlap(Base, Size, .K, Races)
                  andBool Ord =/=K seq_cst
         [transition]

    rule <memory>...
         <object>... <chunckRange> value(Left:Int, Right:Int) </chunckRange>
         <complete> CM:Map </complete>
         <race> Races:Set </race>
             ...</object>
         <channelId> Chan':Int </channelId>
          <timeStamps> TMN:Map => addOneInTimeStamp(Chan', updateTimeStamp(
                               0, maxMemChannel, .K, .K, TMN, TMN')) </timeStamps>
          <channelOps> (ListItem(rec(Chan:Int, MsgN:Int, TMN':Map,
                     msgWrite(Tid:Int,Bn:Int, In:Int,
                      Base:Int, Size:Int, V:K, seq_cst))) => .List) RL:List </channelOps>
            <byteMap> BM:Map => updateMemWithAtomic(BM, Base, V) </byteMap>
           ...</memory>
           <memory>... <channelId> Chan </channelId>
                       <ackMap>... MsgN |-> (AcK => AcK +Int 1) ...</ackMap> ...</memory>
         requires notBool timeStampGreater(0, maxMemChannel, .K, .K, TMN, TMN')
           andBool Base +Int Size <=Int Right andBool Base >=Int Left
                 andBool notBool isOverlap(Base, Size, .K, Races)
         [transition]

    rule <threads> Td:Bag => .Bag </threads>
         <memory>...
         <object>... <chunckRange> value(Left:Int, Right:Int) </chunckRange>
         <complete> CM:Map </complete>
         <race> Races:Set </race> ...</object>
         <channelId> Chan':Int </channelId>
          <timeStamps> TMN:Map </timeStamps>
          <channelOps> (ListItem(rec(Chan:Int, MsgN:Int, TMN':Map,
            msgWrite(Tid:Int,Bn:Int, In:Int,
                      Base:Int, Size:Int, V:K, Ord:K))) RL:List => .List) </channelOps>
            <byteMap> BM:Map </byteMap>
           ...</memory>
           <memory>... <channelId> Chan </channelId>
                       <ackMap> ACM:Map (MsgN |-> AcK) </ackMap> ...</memory>
        <output>... .List =>
          ListItem("error: undefied behavior because two mem op races on the same location") </output>
         requires notBool timeStampGreater(0, maxMemChannel, .K, .K, TMN, TMN')
            andBool Base +Int Size <=Int Right andBool Base >=Int Left
                 andBool isOverlap(Base, Size, .K, Races)
       [transition]

    //initialize channels
    rule initialMemChannels(0) => .K
    rule <k> initialMemChannels(N:Int) => initialMemChannels(N -Int 1) ...</k>
         (.Bag => <memory>... <channelId> N -Int 1 </channelId>
                        <timeStamps> initTimeStamp(0,maxMemChannel) </timeStamps> ...</memory>)

    //free a memory in heap
    rule <k> free(loc(Base:Int, Ty,
                 value(Left:Int, Right:Int), heap, none, InR:K))
                 => dynNoResult(undef) ...</k>
         <cpu> dynInstHold(B:Int , In:Int, Label:K) </cpu>
         <currBlock> basicBlockNum(BN:Int, _:K) </currBlock>
         <toCommit> memList(Ava:K, Ava':Set, Avb:List, Avb':List, CML:List, ML:List)
            => memList(Ava, Ava', Avb:List, Avb':List, CML,
                 ML ListItem(singleMem(TID, B, In,heap, toClose(Base)))) </toCommit>
        <currentModifiers> Mods:Set </currentModifiers>
        <threadId> TID:Int </threadId>
        requires Base >=Int Left andBool Base <=Int Right
        [transition]

    //realloc a memory in heap --> close current one and create a new one
    rule <k> realloc(loc(Base1:Int, Ty,
                 value(Left:Int, Right:Int), heap, none, InR:K), Size:Int)
                          => globalAllocaWait(TN +Int 1, nextMemSym(Base, 0, 1,
               llvmVoidPointerType, value(Base, nextBase(Base, Size, 1))))  ...</k>
         <memChannelId> Chan:Int </memChannelId>
         <currBlock> basicBlockNum(BN:Int, _:K) </currBlock>
        <memory>...
        <channelId> Chan </channelId>
          (<object> D:Bag
           <chunckRange> value(Base1:Int, Right1:Int) </chunckRange>
            </object> =>
            <object>...
             <chunckRange> value(Base, nextBase(Base, Size, 1)) </chunckRange>
             <size> 1 </size>
             <addrSpace> 0 </addrSpace>
             <range> heap </range> 
             <align> newPacking(Base, 1) </align>
                       ...</object> )
        <ackMap> AckM:Map => AckM[TN +Int 1 <- 0] </ackMap>
        <channelOps> ChanL:List (.List => ListItem(sendToAll(Chan, 0, maxMemChannel,
               TN +Int 1, TMN (Chan |-> TN +Int 1),
                   toCloseAndNext(Base1, startMem(value(Base, nextBase(Base, Size, 1)), 1,
              0, heap, newPacking(Base, 1)))))) </channelOps>
        <timeStamps> TMN:Map (Chan |-> (TN:Int => TN +Int 1)) </timeStamps>
        ...</memory>
        <memoryList> MRL:List (.List => ListItem(value(Base,
                     nextBase(Base, Size, 1)))) </memoryList>
        <nextBase> Base:Int => nextBase(Base, Size, 1) </nextBase>
        <memoryRange> value(I:Int, F:Int) => value(I, nextBase(Base,
                            Size, 1)) </memoryRange>
        requires Size >Int 0 andBool Base1 >=Int Left andBool Base1 <=Int Right
        [transition]

    rule <threads> 
           (<thread>...
             <k> realloc(loc(Base1:Int, Ty,
                 value(Left:Int, Right:Int), heap, none, InR:K), Size:Int) </k>
             <memChannelId> Chan:Int </memChannelId>
             <currBlock> basicBlockNum(BN:Int, _:K) </currBlock>
           ...</thread> TD:Bag => .Bag) </threads>
        <memory>...
        <channelId> Chan </channelId>
         <memOpList> ML:List => .List </memOpList>
        ...</memory>
         <memoryList> SL:List </memoryList>
         <output>... .List => ListItem("error: undefied behavior because trying to realloc a memory location but the input pointer is not the original one created by a malloc/calloc/realloc function.") </output>
         requires notBool isAStartBase(Base1, SL)

    rule <k> realloc(Loc:Loc, Size:Int) ~> K:K => .K </k>
         (<tomasulo>
            D:Bag
         </tomasulo> =>  <tomasulo>...
                        <instQueue> instList(.List) </instQueue>
                          ...</tomasulo>)
         <output>... .List => ListItem("error: undefined behavior due to malloc zero bype.") </output>
        requires Size <=Int 0

    //alloca in heap
    rule preAlloca(integerType(I:Int), N:Int)
              => normalizingInt(integerType(I:Int), N) [structural]

    rule <k> globalAllocaWait(Msg:Int, Loc:K) => Loc ...</k>
         <memChannelId> Chan:Int </memChannelId> 
        <memory>...
        <channelId> Chan </channelId>
        <ackMap> AM:Map((Msg |-> N:Int) => .Map) </ackMap>
        ...</memory>
        requires N ==Int maxMemChannel -Int 1
        [structural]

    //malloc/calloc in heap
    rule <k> globalMalloc(Size:Int, N:Int)
                          => globalAllocaWait(TN +Int 1, nextMemSym(Base, 0, 1,
               llvmVoidPointerType, value(Base,
                       nextBase(Base, Size *Int N, 1))))  ...</k>
         <memChannelId> Chan:Int </memChannelId>
         <currBlock> basicBlockNum(BN:Int, _:K) </currBlock>
        <memory>...
        <channelId> Chan </channelId>
        (.Bag =>
            <object>...
             <chunckRange> value(Base,
                    nextBase(Base, Size *Int N, 1)) </chunckRange>
             <size> N </size>
             <addrSpace> 0 </addrSpace>
             <range> heap </range> 
             <align> newPacking(Base, 1) </align>
                       ...</object> )
        <ackMap> AckM:Map => AckM[TN +Int 1 <- 0] </ackMap>
        <channelOps> ChanL:List (.List => ListItem(sendToAll(Chan, 0, maxMemChannel,
               TN +Int 1, TMN (Chan |-> TN +Int 1),
                   startMem(value(Base,
                    nextBase(Base, Size *Int N, 1)), N,
              0, heap, newPacking(Base, 1))))) </channelOps>
        <timeStamps> TMN:Map (Chan |-> (TN:Int => TN +Int 1)) </timeStamps>
        ...</memory>
        <memoryList> MRL:List (.List => ListItem(value(Base,
                     nextBase(Base, Size *Int N, 1)))) </memoryList>
        <nextBase> Base:Int => nextBase(Base, Size *Int N, 1) </nextBase>
        <memoryRange> value(I:Int, F:Int) => value(I, nextBase(Base,
                            Size *Int N, 1)) </memoryRange>
        requires (Size *Int N) >Int 0
        [transition]

    rule <k> globalMalloc(Size:Int, N:Int) ~> K:K => .K </k>
         (<tomasulo>
            D:Bag
         </tomasulo> =>  <tomasulo>...
                        <instQueue> instList(.List) </instQueue>
                          ...</tomasulo>)
         <output>... .List => ListItem("error: undefined behavior due to malloc zero bype.") </output>
        requires (Size *Int N) <=Int 0

    //static global init values in heap
    rule <k> globalAlloca(Type:KResult, N:Int, Ad:Int, Al:Int, Con:Bool)
                          => globalAllocaWait(TN +Int 1, nextMemSym(Base, Ad, Al, Type,
                       value(curBase(Base, Al),
                       nextBase(Base, sizeof(Type) *Int N, Al))))  ...</k>
         <memChannelId> Chan:Int </memChannelId>
         <currBlock> basicBlockNum(BN:Int, _:K) </currBlock>
        <memory>...
        <channelId> Chan </channelId>
        (.Bag =>
            <object>...
             <chunckRange> value(curBase(Base, Al),
                    nextBase(Base, sizeof(Type) *Int N, Al)) </chunckRange>
             <size> N </size>
             <addrSpace> Ad </addrSpace>
             <range> getRangeFromFlagInHeap(Con) </range> 
             <align> newPacking(Base, Al) </align>
                       ...</object> )
        <ackMap> AckM:Map => AckM[TN +Int 1 <- 0] </ackMap>
        <channelOps> ChanL:List (.List => ListItem(sendToAll(Chan, 0, maxMemChannel,
               TN +Int 1, TMN (Chan |-> TN +Int 1),
                   startMem(value(curBase(Base, Al),
                    nextBase(Base, sizeof(Type) *Int N, Al)), N,
              Ad, getRangeFromFlagInHeap(Con), newPacking(Base, Al))))) </channelOps>
        <timeStamps> TMN:Map (Chan |-> (TN:Int => TN +Int 1)) </timeStamps>
        ...</memory>
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

    //alloca in stack
    rule <k> alloca(Type:KResult, N:Int, Ad:Int, Al:Int, Con:Bool)
                          => nextStackSym(Base, Ad, Al,
                     Type,value(curBase(Base, Al),
                    nextBase(Base, sizeof(Type) *Int N, Al))) ...</k>
         <threadId> Tid:Int </threadId>
        (.Bag =>
            <stackObject>...
            <stackThreadId> Tid </stackThreadId>
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

    //fence is handled by the specTree so we just need to omit it except seq_cst
    rule fence(Or:K) => dynNoResult(undef)

    rule <k> staticSeqFence => .K ...</k>
         <memChannelId> Chan:Int </memChannelId>
         <channelId> Chan </channelId>
        <instructionCounter> Static:Int => Static +Int 1 </instructionCounter>
         <threadId> TID:Int </threadId>
         <memOpList> L:List (.List => ListItem(singleMem(TID,
             staticBlockNum, Static, heap, fence(seq_cst)))) </memOpList>

    rule <k> fence(seq_cst) => dynNoResult(undef) ...</k>
        <cpu> dynInstHold(B:Int , In:Int, Label:K) </cpu>
        <threadId> TID:Int </threadId>
        <currBlock> basicBlockNum(BN:Int, _:K) </currBlock>
        <toCommit> memList(Ava:K, Ava':Set, Avb:List, Avb':List, CML:List, ML:List)
         => memList(Ava, Ava', Avb:List, Avb':List, CML,
                  ML ListItem(singleMem(TID, B, In, heap, fence(seq_cst)))) </toCommit>

    rule <channelId> CId:Int </channelId>
         <memOpList> (ListItem(singleMem(TID,
             Bn:Int, In:Int, heap, fence(seq_cst)))
               => ListItem(singleMem(TID,
             Bn:Int, In:Int, heap, msgWait(MsgN +Int 1)))) L:List </memOpList>
         <timeStamps> TM:Map (CId |-> (MsgN:Int => MsgN +Int 1)) </timeStamps>
         <channelOps> ChanOps:List (.List => ListItem(
               sendToAll(CId, 0, maxMemChannel, MsgN +Int 1,
                   TM (CId |-> MsgN +Int 1), msgSeqFence))) </channelOps>
         <ackMap> AckM:Map => AckM[MsgN +Int 1 <- 0] </ackMap>
         <ackMap> .Map </ackMap>

    //atomicrmw op
    rule <k> atomicrmw(Op:K, loc(Base:Int, pointerTypeValue(Type:KResult, Ad:Int),
            value(Left:Int, Right:Int),stack, none, InR:K), V2:KResult, Or:K, _:Bool)
           => loadVal(Type) ...</k>
        <cpu> dynInstHold(B:Int , In:Int, Label:K) </cpu>
        <currBlock> basicBlockNum(BN:Int, _:K) </currBlock>
        <toCommit> memList(Ava:K, Ava':Set, Avb:List, Avb':List, CML:List, ML:List)
            => memList(Ava, Ava', Avb:List, Avb':List, CML,
                  ML ListItem(singleMem(TID, B, In,stack,
                  atomicReadWrite(Type, Base, sizeof(Type), Ad, Or,
                   atomicrmwWait(Type, Op, V2,
                loc(Base:Int, pointerTypeValue(Type:KResult, Ad:Int),
             value(Left:Int, Right:Int), stack, none, InR:K)))))) </toCommit>
        <currentModifiers> Mods:Set </currentModifiers>
        <threadId> TID:Int </threadId>
        <localMemory> LocalStack:Set </localMemory>
           <stackList> SL:List </stackList>
        requires Base >=Int Left andBool Base +Int sizeof(Type) <=Int Right
                 andBool isInStackRange(SL, Base, sizeof(Type), LocalStack)
        [transition]

    rule <k> atomicrmw(Op:K, loc(Base:Int, pointerTypeValue(Type:KResult, Ad:Int),
             value(Left:Int, Right:Int), heap, none, InR:K),
                    V2:KResult, Or:K, _:Bool)
           => loadVal(Type) ...</k>
        <cpu> dynInstHold(B:Int , In:Int, Label:K) </cpu>
        <currBlock> basicBlockNum(BN:Int, _:K) </currBlock>
        <toCommit> memList(Ava:K, Ava':Set, Avb:List, Avb':List, CML:List, ML:List)
         => memList(Ava, Ava', Avb:List, Avb':List, CML,
                    ML ListItem(singleMem(TID, B, In, heap,
            atomicReadWrite(Type, Base, sizeof(Type), Ad:Int, Or,
          atomicrmwWait(Type, Op,V2,
             loc(Base:Int, pointerTypeValue(Type:KResult, Ad:Int),
             value(Left:Int, Right:Int), heap, none, InR:K)))))) </toCommit>
        <currentModifiers> Mods:Set </currentModifiers>
        <threadId> TID:Int </threadId>
        <memoryList> MOL:List </memoryList>
        requires Base >=Int Left andBool Base +Int sizeof(Type) <=Int Right
                 andBool isInMemRange(MOL, Base, sizeof(Type))
        [transition]

    rule <k> atomicrmw(Op:K, loc(Base:Int, pointerTypeValue(Type:KResult, Ad:Int),
             value(Left:Int, Right:Int), heap, none, InR:K),
                    V2:KResult, Or:K, _:Bool) ~> K:K
            => .K </k>
        <memoryList> MOL:List </memoryList>
         (<tomasulo>
            D:Bag
         </tomasulo> =>  <tomasulo>...
                        <instQueue> instList(.List) </instQueue>
                          ...</tomasulo>)
        <output>... .List => ListItem("error: undefied behavior because atomicrmw to a location out of the chunck of memory.") </output>
        requires notBool isInMemRange(MOL, Base, sizeof(Type))

    rule <k> atomicrmw(Op:K, loc(Base:Int, pointerTypeValue(Type:KResult, Ad:Int),
             value(Left:Int, Right:Int), stack, none, InR:K),
                    V2:KResult, Or:K, _:Bool) ~> K:K
            => .K </k>
        <stackList> MOL:List </stackList>
        <localMemory> LocalStack:Set </localMemory>
         (<tomasulo>
            D:Bag
         </tomasulo> =>  <tomasulo>...
                        <instQueue> instList(.List) </instQueue>
                          ...</tomasulo>)
        <output>... .List => ListItem("error: undefied behavior because atomicrmw to a location out of the chunck of stack.") </output>
        requires notBool isInStackRange(MOL, Base, sizeof(Type),LocalStack)

    rule <k> atomicrmw(Op:K, loc(Base:Int, pointerTypeValue(Type:KResult, Ad:Int),
             value(Left:Int, Right:Int), Ran:K, none, InR:K),
                    V2:KResult, Or:K, _:Bool) ~> K:K
                => .K </k>
        <output>... (.List => ListItem("error: undefied behavior atomicrmw memory/stack location out of range or does not exist.")) </output>
         (<tomasulo> D:Bag </tomasulo> =>
                <tomasulo>...
                        <instQueue> instList(.List) </instQueue>
                          ...</tomasulo>)
       requires Base <Int Left orBool Base +Int sizeof(Type) >Int Right

    rule <k> atomicrmw(Op:K, loc(Base:Int, pointerTypeValue(Type':KResult, Ad':Int),
                value(Left:Int, Right:Int),RT:K,
               blockAddVal(_, _), InR:K), V2:KResult, Or:K, _:Bool)
                 ~> K:K => .K </k>
        <output>... (.List => ListItem("error: undefied behavior atomicrmw memory/stack locations that are block addresses.")) </output>
         (<tomasulo> D:Bag </tomasulo> =>
                <tomasulo>...
                        <instQueue> instList(.List) </instQueue>
                          ...</tomasulo>)

    //cmpxchg op
    rule <k> cmpxchg(loc(Base:Int, pointerTypeValue(Type:KResult, Ad:Int),
                    value(Left:Int, Right:Int),stack, none, InR:K),
               V2:KResult, V3:KResult, Or1:K, Or2:K, _:Bool)
           => loadVal(Type) ...</k>
        <cpu> dynInstHold(B:Int , In:Int, Label:K) </cpu>
        <currBlock> basicBlockNum(BN:Int, _:K) </currBlock>
        <toCommit> memList(Ava:K, Ava':Set, Avb:List, Avb':List, CML:List, ML:List)
            => memList(Ava:K, Ava':Set, Avb:List, Avb':List, CML,
                  ML ListItem(singleMem(TID, B, In,stack,
                  atomicReadWrite(Type, Base, sizeof(Type), Ad, Or1,
         cmpxchgWait(Type, V2,V3, loc(Base:Int,
              pointerTypeValue(Type:KResult, Ad:Int),
             value(Left:Int, Right:Int), stack,
                         none, InR:K)))))) </toCommit>
        <currentModifiers> Mods:Set </currentModifiers>
        <threadId> TID:Int </threadId>
        <localMemory> LocalStack:Set </localMemory>
           <stackList> SL:List </stackList>
        requires Base >=Int Left andBool Base +Int sizeof(Type) <=Int Right
                 andBool isInStackRange(SL, Base, sizeof(Type), LocalStack)
                 andBool sizeof(Type) dividesInt Base
        [transition]

    rule <k> cmpxchg(loc(Base:Int, pointerTypeValue(Type:KResult, Ad:Int),
             value(Left:Int, Right:Int), heap, none, InR:K),
                    V2:KResult, V3:KResult, Or1:K, Or2:K, _:Bool)
           => loadVal(Type) ...</k>
        <cpu> dynInstHold (B:Int , In:Int, Label:K) </cpu>
        <currBlock> basicBlockNum(BN:Int, _:K) </currBlock>
        <toCommit> memList(Ava:K, Ava':Set, Avb:List, Avb':List, CML:List, ML:List)
         => memList(Ava, Ava', Avb:List, Avb':List, CML,
                    ML ListItem(singleMem(TID, B, In, heap,
            atomicReadWrite(Type, Base, sizeof(Type), Ad:Int, Or1,
         cmpxchgWait(Type, V2,V3, loc(Base:Int, pointerTypeValue(Type:KResult, Ad:Int),
             value(Left:Int, Right:Int), heap, none, InR:K)))))) </toCommit>
        <currentModifiers> Mods:Set </currentModifiers>
        <threadId> TID:Int </threadId>
        <memoryList> MOL:List </memoryList>
        requires Base >=Int Left andBool Base +Int sizeof(Type) <=Int Right
                 andBool isInMemRange(MOL, Base, sizeof(Type))
                 andBool sizeof(Type) dividesInt Base
        [transition]

    rule <k> cmpxchg(loc(Base:Int, pointerTypeValue(Type:KResult, Ad:Int),
             value(Left:Int, Right:Int), Ran:K, none, InR:K),
                    V2:KResult, V3:KResult, Or1:K, Or2:K, _:Bool) ~> K:K
            => .K </k>
         (<tomasulo>
            D:Bag
         </tomasulo> =>  <tomasulo>...
                        <instQueue> instList(.List) </instQueue>
                          ...</tomasulo>)
        <output>... .List => ListItem("error: undefied behavior because pointer location align is not bigger than the size of the type the cmpxchg op is writing") </output>
         requires notBool (sizeof(Type) dividesInt Base)

    rule <k> cmpxchg(loc(Base:Int, pointerTypeValue(Type:KResult, Ad:Int),
             value(Left:Int, Right:Int), Ran:K, none, InR:K),
                    V2:KResult, V3:KResult, Or1:K, Or2:K, _:Bool) ~> K:K
                => .K </k>
        <output>... (.List => ListItem("error: undefied behavior cmpxchg memory/stack location out of range or does not exist.")) </output>
         (<tomasulo> D:Bag </tomasulo> =>
                <tomasulo>...
                        <instQueue> instList(.List) </instQueue>
                          ...</tomasulo>)
       requires Base <Int Left orBool Base +Int sizeof(Type) >Int Right

    rule <k> cmpxchg(loc(Base:Int, pointerTypeValue(Type':KResult, Ad':Int),
                value(Left:Int, Right:Int),RT:K,
               blockAddVal(_, _), InR:K), V2:KResult, V3:KResult, Or1:K, Or2:K, _:Bool)
                 ~> K:K => .K </k>
        <output>... (.List => ListItem("error: undefied behavior cmpxchg memory/stack locations that are block addresses.")) </output>
         (<tomasulo> D:Bag </tomasulo> =>
                <tomasulo>...
                        <instQueue> instList(.List) </instQueue>
                          ...</tomasulo>)

    rule <k> cmpxchg(loc(Base:Int, pointerTypeValue(Type:KResult, Ad:Int),
             value(Left:Int, Right:Int), heap, none, InR:K),
                    V2:KResult, V3:KResult, Or1:K, Or2:K, _:Bool) ~> K:K
            => .K </k>
        <memoryList> MOL:List </memoryList>
         (<tomasulo>
            D:Bag
         </tomasulo> =>  <tomasulo>...
                        <instQueue> instList(.List) </instQueue>
                          ...</tomasulo>)
        <output>... .List => ListItem("error: undefied behavior because cmpxchg to a location out of the chunck of memory.") </output>
        requires notBool isInMemRange(MOL, Base, sizeof(Type))

    rule <k> cmpxchg(loc(Base:Int, pointerTypeValue(Type:KResult, Ad:Int),
             value(Left:Int, Right:Int), stack, none, InR:K),
                    V2:KResult, V3:KResult, Or1:K, Or2:K, _:Bool) ~> K:K
            => .K </k>
        <stackList> MOL:List </stackList>
        <localMemory> LocalStack:Set </localMemory>
         (<tomasulo>
            D:Bag
         </tomasulo> =>  <tomasulo>...
                        <instQueue> instList(.List) </instQueue>
                          ...</tomasulo>)
        <output>... .List => ListItem("error: undefied behavior because cmpxchg to a location out of the chunck of stack.") </output>
        requires notBool isInStackRange(MOL, Base, sizeof(Type),LocalStack)

    //load op to load a value from a loc
    rule <k> load(pointerTypeValue(Type:KResult, Ad:Int),
               loc(Base:Int, pointerTypeValue(Type':KResult, Ad':Int),
               value(Left:Int, Right:Int),RT:K, none, InR:K), RA:Int, _:Bool) ~> K:K
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
               blockAddVal(_, _), InR:K), RA:Int, _:Bool) ~> K:K => .K </k>
        <output>... (.List => ListItem("error: undefied behavior loading memory/stack locations that are block addresses.")) </output>
         (<tomasulo> D:Bag </tomasulo> =>
                <tomasulo>...
                        <instQueue> instList(.List) </instQueue>
                          ...</tomasulo>)

    rule <k> load(pointerTypeValue(Type:KResult, Ad:Int),
               loc(Base:Int, pointerTypeValue(Type:KResult, Ad:Int),
             value(Left:Int, Right:Int), heap, none, InR:K), RA:Int, _:Bool)
           => loadVal(Type:KResult) ...</k>
        <cpu> dynInstHold(B:Int , In:Int, Label:K) </cpu>
        <currBlock> basicBlockNum(BN:Int, _:K) </currBlock>
        <currentModifiers> Mods:Set </currentModifiers>
        <threadId> TID:Int </threadId>
        <toCommit> memList(Ava:K, Ava':Set, Avb:List, Avb':List, CML:List, ML:List)
            => memList(Ava, Ava', Avb:List, Avb':List, CML,
                      ML genReadBytes(TID, B, In, heap, Type,
                            Base, 0, sizeof(Type), Ad:Int)) </toCommit>
        <memoryList> MOL:List </memoryList>
        requires Base >=Int Left andBool Base +Int sizeof(Type) <=Int Right
                 andBool isInMemRange(MOL, Base, sizeof(Type))
                 andBool notBool atomic in Mods
                 andBool RA dividesInt Base
        [transition]

    rule <k> load(pointerTypeValue(Type:KResult, Ad:Int),
                  loc(Base:Int, pointerTypeValue(Type:KResult, Ad:Int),
                 value(Left:Int, Right:Int),stack, none, InR:K), RA:Int, _:Bool)
           => loadVal(Type:KResult) ...</k>
        <cpu> dynInstHold(B:Int , In:Int, Label:K) </cpu>
        <currBlock> basicBlockNum(BN:Int, _:K) </currBlock>
        <toCommit> memList(Ava:K, Ava':Set, Avb:List, Avb':List, CML:List, ML:List)
        => memList(Ava, Ava', Avb:List, Avb':List, CML,
                      ML genReadBytes(TID, B, In, stack, Type,
                            Base, 0, sizeof(Type), Ad:Int)) </toCommit>
        <currentModifiers> Mods:Set </currentModifiers>
        <threadId> TID:Int </threadId>
        <localMemory> LocalStack:Set </localMemory>
           <stackList> SL:List </stackList>
        requires Base >=Int Left andBool Base +Int sizeof(Type) <=Int Right
                 andBool isInStackRange(SL, Base, sizeof(Type), LocalStack)
                 andBool notBool atomic in Mods
                 andBool RA dividesInt Base

    rule <k> load(pointerTypeValue(Type:KResult, Ad:Int),
                  loc(Base:Int, pointerTypeValue(Type:KResult, Ad:Int),
                      value(Left:Int, Right:Int), heap, none, InR:K), RA:Int, _:Bool)
           => loadVal(Type:KResult) ...</k>
        <cpu> dynInstHold (B:Int , In:Int, Label:K) </cpu>
        <currBlock> basicBlockNum(BN:Int, _:K) </currBlock>
        <toCommit> memList(Ava:K, Ava':Set, Avb:List, Avb':List, CML:List, ML:List)
         => memList(Ava, Ava', Avb:List, Avb':List, CML,
                   ML ListItem(singleMem(TID, B, In, heap,
            atomicRead(Type, Base, sizeof(Type), Ad:Int, 
                       getOrdering(.K, Mods))))) </toCommit>
        <currentModifiers> Mods:Set </currentModifiers>
        <threadId> TID:Int </threadId>
        <memoryList> MOL:List </memoryList>
        requires Base >=Int Left andBool Base +Int sizeof(Type) <=Int Right
                 andBool isInMemRange(MOL, Base, sizeof(Type))
                 andBool atomic in Mods
                 andBool RA dividesInt Base

    rule <k> load(pointerTypeValue(Type:KResult, Ad:Int),
                 loc(Base:Int, pointerTypeValue(Type:KResult, Ad:Int),
                    value(Left:Int, Right:Int),stack, none, InR:K), RA:Int, _:Bool)
           => loadVal(Type:KResult) ...</k>
        <cpu> dynInstHold (B:Int , In:Int, Label:K) </cpu>
        <currBlock> basicBlockNum(BN:Int, _:K) </currBlock>
        <toCommit> memList(Ava:K, Ava':Set, Avb:List, Avb':List, CML:List, ML:List)
            => memList(Ava, Ava', Avb:List, Avb':List, CML,
                   ML ListItem(singleMem(TID, B, In,stack,
                  atomicRead(Type, Base, sizeof(Type), Ad,
                      getOrdering(.K, Mods))))) </toCommit>
        <currentModifiers> Mods:Set </currentModifiers>
        <threadId> TID:Int </threadId>
        <localMemory> LocalStack:Set </localMemory>
           <stackList> SL:List </stackList>
        requires Base >=Int Left andBool Base +Int sizeof(Type) <=Int Right
                 andBool isInStackRange(SL, Base, sizeof(Type), LocalStack)
                 andBool atomic in Mods
                 andBool RA dividesInt Base

    rule <k> load(pointerTypeValue(Type:KResult, Ad:Int),
               loc(Base:Int, pointerTypeValue(Type':KResult, Ad':Int),
                     R:K, RT:K, none,InR:K), RA:Int, _:Bool) ~> K:K
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
                 R:K, heap, none, InR:K), RA:Int, _:Bool) ~> K:K
            => .K </k>
        <memoryList> MOL:List </memoryList>
         (<tomasulo>
            D:Bag
         </tomasulo> =>  <tomasulo>...
                        <instQueue> instList(.List) </instQueue>
                          ...</tomasulo>)
        <output>... .List => ListItem("error: undefied behavior because load to a location out of the chunck of memory.") </output>
        requires notBool isInMemRange(MOL, Base, sizeof(Type))

    rule <k> load(pointerTypeValue(Type:KResult, Ad:Int),
               loc(Base:Int, pointerTypeValue(Type':KResult, Ad':Int),
                     R:K,stack, none, InR:K), RA:Int, _:Bool) ~> K:K
            => .K </k>
        <stackList> MOL:List </stackList>
        <localMemory> LocalStack:Set </localMemory>
         (<tomasulo>
            D:Bag
         </tomasulo> =>  <tomasulo>...
                        <instQueue> instList(.List) </instQueue>
                          ...</tomasulo>)
        <output>... .List => ListItem("error: undefied behavior because load to a location out of the chunck of stack.") </output>
        requires notBool isInStackRange(MOL, Base, sizeof(Type),LocalStack)

    rule <k> load(pointerTypeValue(Type:KResult, Ad:Int),
                 A:KResult, RA:Int, _:Bool) ~> K:K
            => .K </k>
        <output>... .List => ListItem("error: undefined behavior because load to a non-location.") </output>
        requires notBool isALoc(A)

    //static load function is a single load in a function, 
     //so it does not need to go through tocommit cell/readback-cell
    rule <k> staticLoad(Type:KResult, loc(Base:Int, pointerTypeValue(T2:K, Ad:Int),
               value(Left:Int, Right:Int), heap, none, InR:K), Or:K)
                   => staticLoadHold(Type) ...</k>
        <instructionCounter> Static:Int => Static +Int 1 </instructionCounter>
        <memChannelId> Chan:Int </memChannelId>
        <channelId> Chan </channelId>
        <memOpList> L:List (.List => ListItem(singleMem(TID:Int,
                     staticBlockNum, Static, heap,
                     memmoveRead(Base, sizeof(Type), Ad, Or)))) </memOpList>
        <threadId> TID:Int </threadId>
        <memoryList> MOL:List </memoryList>
         requires Base >=Int Left andBool Base +Int sizeof(Type) <=Int Right
                 andBool isInMemRange(MOL, Base, sizeof(Type))

    rule <k> staticLoad(Type:KResult, loc(Base:Int, pointerTypeValue(T2:K, Ad:Int),
               value(Left:Int, Right:Int), stack, none, InR:K), Or:K)
                   => staticLoadHold(Type) ...</k>
        <instructionCounter> Static:Int => Static +Int 1 </instructionCounter>
        <stackOpList> L:List (.List => ListItem(singleMem(TID:Int,
                     staticBlockNum, Static, stack,
                     memmoveRead(Base, sizeof(Type), Ad, Or)))) </stackOpList>
        <currentModifiers> Mods:Set </currentModifiers>
        <threadId> TID:Int </threadId>
        <localMemory> LocalStack:Set </localMemory>
           <stackList> SL:List </stackList>
         requires Base >=Int Left andBool Base +Int sizeof(Type) <=Int Right
                 andBool isInStackRange(SL, Base, sizeof(Type), LocalStack)

    rule <threads> (TD:Bag
           <thread>...
             <stackList> SL:List </stackList>
             <localMemory> LocalStack:Set </localMemory>
             <k> staticLoad(Type:KResult, loc(Base:Int, T2:K, value(Left:Int, Right:Int), heap,
             none, InR:K), Or:K) ~> K:K </k>
           ...</thread>) => .Bag </threads>
        <output>... (.List => ListItem("error: undefied behavior trying to load values from a memory that is not allocated.")) </output>
        <channelId> Chan </channelId>
        <memoryList> MOL:List </memoryList>
         requires Base >=Int Left andBool Base +Int sizeof(Type) <=Int Right
                 andBool notBool isInStackRange(SL, Base, sizeof(Type), LocalStack)

    rule <threads> (TD:Bag
           <thread>...
             <memChannelId> Chan:Int </memChannelId>
             <k> staticLoad(Type:KResult, loc(Base:Int, T2:K, value(Left:Int, Right:Int), heap,
             none, InR:K), Or:K) ~> K:K </k>
           ...</thread>) => .Bag </threads>
        <output>... (.List => ListItem("error: undefied behavior trying to load values from a memory that is not allocated.")) </output>
        <channelId> Chan </channelId>
        <memoryList> MOL:List </memoryList>
         requires Base >=Int Left andBool Base +Int sizeof(Type) <=Int Right
                 andBool notBool isInMemRange(MOL, Base, sizeof(Type))

    rule <threads> (TD:Bag
           <thread>...
             <k> staticLoad(Type:KResult, loc(Base:Int, T2:K, value(Left:Int, Right:Int), RT:K,
             none, InR:K), Or:K) ~> K:K </k>
           ...</thread>) => .Bag </threads>
        <output>... (.List => ListItem("error: undefied behavior trying to load values out of bound of the input pointer.")) </output>
         requires Base <Int Left andBool Base +Int sizeof(Type) >Int Right

    //DONE: TODO: store must save to a pointer type
    rule <k> store(Type:KResult, V:KResult, T2:K,
                   loc(Base:Int, T2, value(Left:Int, Right:Int), RT:K,
             none, InR:K), RA:Int, _:Bool) ~> K:K => .K </k>
        <output>... (.List => ListItem("error: undefied behavior storing memory location out of range or does not exist.")) </output>
         (<tomasulo> D:Bag </tomasulo> =>
                <tomasulo>...
                        <instQueue> instList(.List) </instQueue>
                          ...</tomasulo>)
       requires Base <Int Left orBool Base +Int sizeof(Type) >Int Right

    rule <k> store(Type:KResult, V:KResult, T2:K,
                   loc(Base:Int, T2, value(Left:Int, Right:Int), RT:K,
                blockAddVal(_, _), InR:K), RA:Int, _:Bool) ~> K:K => .K </k>
        <output>... (.List => ListItem("error: undefied behavior storing memory locations that are block addresses.")) </output>
         (<tomasulo> D:Bag </tomasulo> =>
                <tomasulo>...
                        <instQueue> instList(.List) </instQueue>
                          ...</tomasulo>)

    rule preStaticStore(Type:KResult,
               typeOperandResult(Type, V:K), T2:K, Loc:K, Ra:Int)
          => staticStore(Type, V, T2, Loc, Ra)

    rule <k> staticStore(Type:KResult, V:KResult, T2:K,
                   loc(Base:Int, pointerTypeValue(Type, Ad:Int),
               value(Left:Int, Right:Int), stack, none, InR:K), RA:Int) => .K ...</k>
        <instructionCounter> Static:Int => Static +Int 1 </instructionCounter>
        <stackOpList> L:List (.List => genWriteBytes(TID, staticBlockNum, Static, 
                    stack, Type, splitBytes(V, Type), storeOperand(TID, Type, V),
                            Base, 0, sizeof(Type), Ad)) </stackOpList>
        <currentModifiers> Mods:Set </currentModifiers>
        <threadId> TID:Int </threadId>
        <localMemory> LocalStack:Set </localMemory>
           <stackList> SL:List </stackList>
        requires Base >=Int Left andBool Base +Int sizeof(Type) <=Int Right
                 andBool isInStackRange(SL, Base, sizeof(Type), LocalStack)
                 andBool notBool atomic in Mods
                 andBool RA dividesInt Base

    rule <k> staticStore(Type:KResult, V:KResult, T2:K,
                   loc(Base:Int, pointerTypeValue(Type, Ad:Int),
              value(Left:Int, Right:Int), heap, none, InR:K), RA:Int) => .K ...</k>
        <instructionCounter> Static:Int => Static +Int 1 </instructionCounter>
         <memChannelId> Chan:Int </memChannelId>
        <channelId> Chan </channelId>
        <memOpList> L:List (.List => genWriteBytes(TID, staticBlockNum, Static, 
                    heap, Type, splitBytes(V, Type), storeOperand(TID, Type, V),
                            Base, 0, sizeof(Type), Ad)) </memOpList>
        <currentModifiers> Mods:Set </currentModifiers>
        <threadId> TID:Int </threadId>
        <memoryList> MOL:List </memoryList>
        requires Base >=Int Left andBool Base +Int sizeof(Type) <=Int Right
                 andBool isInMemRange(MOL, Base, sizeof(Type))
                 andBool notBool atomic in Mods
                 andBool RA dividesInt Base

    rule <k> staticAtomicStore(Type:KResult, V:KResult, T2:K,
                   loc(Base:Int, pointerTypeValue(Type, Ad:Int),
               value(Left:Int, Right:Int), stack, none, InR:K), RA:Int) => .K ...</k>
        <instructionCounter> Static:Int => Static +Int 1 </instructionCounter>
        <stackOpList> L:List (.List => ListItem(singleMem(TID,
                 staticBlockNum, Static, stack, atomicWrite(Type,
                     V:KResult, none, Base,
              sizeof(Type), Ad:Int, monotonic)))) </stackOpList>
        <threadId> TID:Int </threadId>
        <localMemory> LocalStack:Set </localMemory>
           <stackList> SL:List </stackList>
        requires Base >=Int Left andBool Base +Int sizeof(Type) <=Int Right
                 andBool isInStackRange(SL, Base, sizeof(Type), LocalStack)
                 andBool RA dividesInt Base

    rule <k> staticAtomicStore(Type:KResult, V:KResult, T2:K,
                   loc(Base:Int, pointerTypeValue(Type, Ad:Int),
              value(Left:Int, Right:Int), heap, none, InR:K), RA:Int) => .K ...</k>
        <instructionCounter> Static:Int => Static +Int 1 </instructionCounter>
         <memChannelId> Chan:Int </memChannelId>
        <channelId> Chan </channelId>
        <memOpList> L:List (.List => ListItem(singleMem(TID,
                 staticBlockNum, Static, stack, atomicWrite(Type,
                     V:KResult, none, Base,
              sizeof(Type), Ad:Int, monotonic)))) </memOpList>
        <threadId> TID:Int </threadId>
        <memoryList> MOL:List </memoryList>
        requires Base >=Int Left andBool Base +Int sizeof(Type) <=Int Right
                 andBool isInMemRange(MOL, Base, sizeof(Type))
                 andBool RA dividesInt Base

    rule <k> store(Type:KResult, V:KResult, T2:K,
                   loc(Base:Int, pointerTypeValue(Type, Ad:Int),
                     value(Left:Int, Right:Int), heap, none, InR:K), RA:Int, _:Bool)
            => dynNoResult(undef) ...</k>
        <cpu> dynInstHold(B:Int , In:Int, Label:K) </cpu>
        <currBlock> basicBlockNum(BN:Int, _:K) </currBlock>
        <toCommit> memList(Ava:K, Ava':Set, Avb:List, Avb':List, CML:List, ML:List)
            => memList(Ava, Ava', Avb:List, Avb':List, CML,
                     ML genWriteBytes(TID, B, In,
                   heap, Type, splitBytes(V, Type), storeOperand(TID, Type, V),
                            Base, 0, sizeof(Type), Ad)) </toCommit>
        <currentModifiers> Mods:Set </currentModifiers>
        <threadId> TID:Int </threadId>
        <memoryList> MOL:List </memoryList>
        requires Base >=Int Left andBool Base +Int sizeof(Type) <=Int Right
                 andBool isInMemRange(MOL, Base, sizeof(Type))
                 andBool notBool atomic in Mods
                 andBool RA dividesInt Base

    rule <k> store(Type:KResult, V:KResult,T2:K, loc(Base:Int,
                   pointerTypeValue(Type, Ad:Int),
                 value(Left:Int, Right:Int), stack, none, InR:K), RA:Int, _:Bool)
            => dynNoResult(undef) ...</k>
        <cpu> dynInstHold(B:Int , In:Int, Label:K) </cpu>
        <currBlock> basicBlockNum(BN:Int, _:K) </currBlock>
        <toCommit> memList(Ava:K, Ava':Set, Avb:List, Avb':List, CML:List, ML:List)
        => memList(Ava, Ava', Avb:List, Avb':List, CML,
                      ML genWriteBytes(TID, B, In,
                    stack, Type, splitBytes(V, Type), storeOperand(TID, Type, V),
                            Base, 0, sizeof(Type), Ad)) </toCommit>
        <currentModifiers> Mods:Set </currentModifiers>
        <threadId> TID:Int </threadId>
        <localMemory> LocalStack:Set </localMemory>
           <stackList> SL:List </stackList>
        requires Base >=Int Left andBool Base +Int sizeof(Type) <=Int Right
                 andBool isInStackRange(SL, Base, sizeof(Type), LocalStack)
                 andBool notBool atomic in Mods
                 andBool RA dividesInt Base

    rule <k> store(Type:KResult, V:KResult, T2:K,
                  loc(Base:Int, pointerTypeValue(Type, Ad:Int),
                  value(Left:Int, Right:Int), heap, none, InR:K), RA:Int, _:Bool)
            => dynNoResult(undef) ...</k>
        <cpu> dynInstHold (B:Int , In:Int, Label:K) </cpu>
        <currBlock> basicBlockNum(BN:Int, _:K) </currBlock>
        <toCommit> memList(Ava:K, Ava':Set, Avb:List, Avb':List, CML:List, ML:List)
         => memList(Ava, Ava', Avb:List, Avb':List, CML,
                  ML ListItem(singleMem(TID, B, In, heap, atomicWrite(Type,
                     splitBytes(V, Type), storeOperand(TID, Type, V), Base,
              sizeof(Type), Ad:Int, getOrdering(.K, Mods))))) </toCommit>
        <currentModifiers> Mods:Set </currentModifiers>
        <threadId> TID:Int </threadId>
        <memoryList> MOL:List </memoryList>
        requires Base >=Int Left andBool Base +Int sizeof(Type) <=Int Right
                 andBool isInMemRange(MOL, Base, sizeof(Type))
                 andBool atomic in Mods
                 andBool RA dividesInt Base

    rule <k> store(Type:KResult, V:KResult, T2:K,
                  loc(Base:Int, pointerTypeValue(Type, Ad:Int),
                    value(Left:Int, Right:Int),stack, none, InR:K), RA:Int, _:Bool)
            => dynNoResult(undef) ...</k>
        <cpu> dynInstHold (B:Int , In:Int, Label:K) </cpu>
        <currBlock> basicBlockNum(BN:Int, _:K) </currBlock>
        <toCommit> memList(Ava:K, Ava':Set, Avb:List, Avb':List, CML:List, ML:List)
            => memList(Ava, Ava', Avb:List, Avb':List, CML,
                   ML ListItem(singleMem(TID, B, In,stack, atomicWrite(Type,
                     splitBytes(V, Type), storeOperand(TID, Type, V), Base,
              sizeof(Type), Ad, getOrdering(.K, Mods))))) </toCommit>
        <currentModifiers> Mods:Set </currentModifiers>
        <threadId> TID:Int </threadId>
        <localMemory> LocalStack:Set </localMemory>
        <stackList> SL:List </stackList>
        requires Base >=Int Left andBool Base +Int sizeof(Type) <=Int Right
                 andBool isInStackRange(SL, Base, sizeof(Type), LocalStack)
                 andBool atomic in Mods
                 andBool RA dividesInt Base

    rule <k> store(Type:KResult, V:KResult, T2:K,
               loc(Base:Int, pointerTypeValue(Type':K, Ad:Int),
              R:K, RT:K, none, InR:K), RA:Int, _:Bool) ~> K:K
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
                       R:K, heap, none, InR:K), RA:Int, _:Bool) ~> K:K
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
                   R:K, stack, none, InR:K), RA:Int, _:Bool) ~> K:K
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

    rule <k> store(Type:KResult, V:KResult, T2:K, A:KResult, RA:Int, _:Bool) ~> K:K
            => .K </k>
         (<tomasulo>
            D:Bag
         </tomasulo> =>  <tomasulo>...
                        <instQueue> instList(.List) </instQueue>
                          ...</tomasulo>)
        <output>... .List => ListItem("error: undefined behavior because store to a non-location.") </output>
        requires notBool isALoc(A)

    //commit cell to memory cell
    rule memList(.K, SetItem(A:K) Ave:Set,
                            Avb:List, Avb':List, CML:List, ML:List)
          => memList(A, Ave, Avb:List, Avb':List, CML, ML)

    rule <toCommit> memList(singleMem(TID:Int,
                     Bn:Int, In:Int, heap, Op:K), Ave:Set,
                            Avb:List, Avb':List, CML:List, ML:List)
                   => memList(.K, Ave, Avb:List, Avb':List, .List, CML ML) </toCommit>
          <specTree> M:Map => markMemOp(Bn, In,.K, M) </specTree>
          <memOpList> L:List (.List => ListItem(singleMem(TID:Int,
                     Bn:Int, In:Int, heap, Op:K))) </memOpList>
         requires (notBool isAWrite(Op) orBool
                  getOrderInMemOp(Op) =/=K unordered)
                  andBool notBool hasMemOpInList(TID, Bn, In, Avb Avb' CML ML)
                  andBool notBool hasMemOpInSet(TID, Bn, In, .K, Ave)
         [transition]

    //dealing with memmove
    rule <toCommit> memList(singleMem(TID:Int,
                     Bn:Int, In:Int, heap, Op:K), Ave:Set,
                            Avb:List, Avb':List, CML:List, ML:List)
                   => memList(.K, Ave, Avb:List, Avb':List, .List, CML ML) </toCommit>
          <memOpList> L:List (.List => ListItem(singleMem(TID:Int,
                     Bn:Int, In:Int, heap, Op:K))) </memOpList>
         requires (notBool isAWrite(Op) orBool
                  getOrderInMemOp(Op) =/=K unordered)
                  andBool (hasMemOpInList(TID, Bn, In, Avb Avb' CML ML)
                  orBool hasMemOpInSet(TID, Bn, In, .K, Ave))
         [transition]

    rule <toCommit> memList(singleMem(TID:Int,
                     Bn:Int, In:Int, heap, Op:K), Ave:Set,
                            Avb:List, Avb':List, CML:List, ML:List)
                   => memList(.K, Ave, Avb:List, Avb':List, .List, CML ML) </toCommit>
          <specTree> M:Map => markMemOp(Bn, In,.K, M) </specTree>
          <currBlock> basicBlockNum(OldCount:Int, Name:K) </currBlock>
          <memRegisters> M:Map ((varInstance(Bn, In) |-> Val:K) => .Map) </memRegisters>
          <memOpList> L:List (.List => ListItem(singleMem(TID:Int,
                     Bn:Int, In:Int, heap, Op:K))) </memOpList>
         requires isAWrite(Op) andBool
                  getOrderInMemOp(Op) ==K unordered
                  andBool notBool hasMemOpInList(TID, Bn, In, Avb Avb' CML ML)
                  andBool notBool hasMemOpInSet(TID, Bn, In, .K, Ave)
         [transition]

    rule <toCommit> memList(singleMem(TID:Int,
                     Bn:Int, In:Int, heap, Op:K), Ave:Set,
                            Avb:List, Avb':List, CML:List, ML:List)
                   => memList(.K, Ave, Avb:List, Avb':List, .List, CML ML) </toCommit>
          <currBlock> basicBlockNum(OldCount:Int, Name:K) </currBlock>
          <memRegisters> M:Map ((varInstance(Bn, In) |-> Val:K) => .Map) </memRegisters>
          <memOpList> L:List (.List => ListItem(singleMem(TID:Int,
                     Bn:Int, In:Int, heap, Op:K))) </memOpList>
         requires isAWrite(Op) andBool
                  getOrderInMemOp(Op) ==K unordered
                  andBool (hasMemOpInList(TID, Bn, In, Avb Avb' CML ML)
                  orBool hasMemOpInSet(TID, Bn, In, .K, Ave))
         [transition]

    rule <toCommit> memList(singleMem(TID:Int,
                     Bn:Int, In:Int, stack, Op:K),
                          Ave:Set, Avb:List, Avb':List, CML:List, ML:List)
                  => memList(.K, Ave, Avb:List, Avb':List, .List, CML ML) </toCommit>
          <specTree> M:Map => markMemOp(Bn, In,.K, M) </specTree>
          <stackOpList> L:List (.List => ListItem(singleMem(TID:Int,
                     Bn:Int, In:Int, heap, Op:K))) </stackOpList>
          requires notBool hasMemOpInList(TID, Bn, In, Avb Avb' CML ML)
                  andBool notBool hasMemOpInSet(TID, Bn, In, .K, Ave)
          [transition]

    rule <toCommit> memList(singleMem(TID:Int,
                     Bn:Int, In:Int, stack, Op:K),
                          Ave:Set, Avb:List, Avb':List, CML:List, ML:List)
                  => memList(.K, Ave, Avb:List, Avb':List, .List, CML ML) </toCommit>
          <stackOpList> L:List (.List => ListItem(singleMem(TID:Int,
                     Bn:Int, In:Int, heap, Op:K))) </stackOpList>
          requires (hasMemOpInList(TID, Bn, In, Avb Avb' CML ML)
                  orBool hasMemOpInSet(TID, Bn, In, .K, Ave))
          [transition]

    rule <toCommit> memList(Ava:K, Ava':Set, Avb:List,
                 ListItem(singleMem(TID:Int, Bn:Int,
                     In:Int, stack, Op:K)) S:List,Check:List, Not:List)
             => memList(Ava, Ava', Avb:List
                 ListItem(singleMem(TID:Int, Bn:Int,
                     In:Int, stack, Op:K)), S, Check, Not) </toCommit>
         [transition]

    rule <toCommit> memList(Ava:K, Ava':Set, Avb:List,
                 ListItem(singleMem(TID:Int, Bn:Int,
                     In:Int, Ran:K, Op:K)) S:List,Check:List, Not:List)
             => memList(Ava, Ava', Avb:List
                 ListItem(singleMem(TID:Int, Bn:Int,
                     In:Int, Ran:K, Op:K)), S, Check, Not) </toCommit>
         requires getOrderInMemOp(Op) =/=K unordered
         [transition]

    rule <toCommit> memList(Ava:K, Ava':Set, Avb:List,
                 S:List,Check:List, ListItem(singleMem(TID:Int, Bn:Int,
                     In:Int, Ran:K, Op:K)) Not:List)
             => memList(Ava , Ava' SetItem(singleMem(TID:Int, Bn:Int,
                     In:Int, Ran:K, Op:K)), Avb:List, S, Check, Not) </toCommit>
         <currBlock> basicBlockNum(Cur:Int, _:K) </currBlock>
          <specTree> M:Map </specTree>
         requires isMemAvailable(Cur, Bn, In, Ran, getOrderInMemOp(Op), M)
                  andBool Bn <=Int Cur
         [transition]

    rule <toCommit> memList(Ava:K, Ava':Set, Avb:List,
                 S:List,Check:List, ListItem(singleMem(TID:Int, Bn:Int,
                     In:Int, Ran:K, Op:K)) Not:List)
             => memList(Ava , Ava', Avb:List, S ListItem(singleMem(TID:Int, Bn:Int,
                     In:Int, Ran:K, Op:K)), Check, Not) </toCommit>
         <currBlock> basicBlockNum(Cur:Int, _:K) </currBlock>
          <specTree> M:Map </specTree>
         requires isMemAvailable(Cur, Bn, In, Ran, getOrderInMemOp(Op), M)
                  andBool Bn >Int Cur
         [transition]

    rule <toCommit> memList(Ava:K, Ava':Set, Avb:List,
                 S:List,Check:List, ListItem(singleMem(TID:Int, Bn:Int,
                     In:Int, Ran:K, Op:K)) Not:List)
             => memList(Ava , Ava', Avb:List, S,
                   Check ListItem(singleMem(TID:Int, Bn:Int,
                     In:Int, Ran:K, Op:K)), Not) </toCommit>
         <currBlock> basicBlockNum(Cur:Int, _:K) </currBlock>
          <specTree> M:Map </specTree>
         requires notBool isMemAvailable(Cur, Bn, In, Ran, getOrderInMemOp(Op), M)
         [transition]

    //deal with speculative write/read with mem op being unordered
    rule <toCommit> memList(Ava:K, Ava':Set, Avb:List,
                 ListItem(singleMem(TID:Int, Bn:Int,
                     In:Int, heap, Op:K)) S:List,Check:List, Not:List)
             => memList(Ava, Ava', Avb:List
                 ListItem(singleMem(TID:Int, Bn:Int, In:Int,heap,
                   Op:K)), S, Check,Not:List) </toCommit>
         <currBlock> basicBlockNum(Cur:Int, _:K) </currBlock>
         <memRegisters> M:Map => M[varInstance(Bn,In)
                           <- pairResult(getTheLoc(heap, Op),
                                   getBytesInAtomicWrite(Op))] </memRegisters>
         <cbd> M':Map => M'[getTheLoc(heap, Op) <- getBytesInAtomicWrite(Op)] </cbd>
         requires isAWrite(Op) andBool getOrderInMemOp(Op) ==K unordered
         [transition]

    rule <readBack> readMap(RM:Map (varInstance(Bn, In)
                 |-> readBackHold(X:K, loadHold(T':K, .List), Unf:K, Fl:K)))
             => readMapAux(varInstance(Bn, In), readBackHold(X:K,
                loadHold(T':K, getBytesFromRegion(Base, Size,
                  getInstanceInMemReg(getFatherStore(Bn, In, aLoc(Base,
                  pointerTypeValue(Ty, Ad), heap), Rev), M))), Unf:K, Fl), RM) </readBack>
         <specTree> Rev:Map </specTree>
         <currBlock> basicBlockNum(Cur:Int, _:K) </currBlock>
         <toCommit> memList(Ava:K, Ava':Set, Avb:List,
                 ListItem(singleMem(TID:Int, Bn:Int,
                     In:Int, heap, atomicRead(Ty:K, Base:Int,
              Size:Int, Ad:Int, unordered))) S:List,Check:List, Not:List)
             => memList(Ava, Ava', Avb:List, S, Check,Not:List) </toCommit>
         <memRegisters> M:Map </memRegisters>
         requires getFatherStore(Bn, In, aLoc(Base,
                  pointerTypeValue(Ty, Ad), heap), Rev) =/=K none
                andBool hasInstanceInMemReg(
                         getFatherStore(Bn, In, aLoc(Base,
                  pointerTypeValue(Ty, Ad), heap), Rev), M)
         [transition]

    rule <readBack> readMap(RM:Map (varInstance(Bn, In)
                 |-> readBackHold(X:K, loadHold(T':K, .List),Unf:K, Fl:K)))
             => readMapAux(varInstance(Bn, In), readBackHold(X:K,
                loadHold(T':K, getBytesFromRegion(Base, Size,
                  getInstanceInCBD(Base, Size, .K, .K, M))),Unf:K, Fl), RM) </readBack>
         <specTree> Rev:Map </specTree>
         <currBlock> basicBlockNum(Cur:Int, _:K) </currBlock>
         <toCommit> memList(Ava:K, Ava':Set, Avb:List,
                 ListItem(singleMem(TID:Int, Bn:Int,
                     In:Int, heap, atomicRead(Ty:K, Base:Int,
              Size:Int, Ad:Int, unordered))) S:List,Check:List, Not:List)
             => memList(Ava, Ava', Avb:List, S, Check,Not:List) </toCommit>
         <cbd> M:Map </cbd>
         requires getFatherStore(Bn, In, aLoc(Base,
                  pointerTypeValue(Ty, Ad), heap), Rev) ==K none
            andBool getInstanceInCBD(Base, Size, .K, .K, M) =/=K none
         [transition]

    rule <toCommit> memList(Ava:K, Ava':Set, Avb:List,
                 ListItem(singleMem(TID:Int, Bn:Int,
                     In:Int, heap, atomicRead(Ty:K, Base:Int,
              Size:Int, Ad:Int, unordered))) S:List,Check:List, Not:List)
             => memList(Ava, Ava', Avb:List ListItem(singleMem(TID:Int, Bn:Int,
                     In:Int, heap, atomicRead(Ty:K, Base:Int,
              Size:Int, Ad:Int, unordered))), S, Check,Not:List) </toCommit>
         <currBlock> basicBlockNum(Cur:Int, _:K) </currBlock>
         <specTree> Rev:Map </specTree>
         <cbd> M:Map </cbd>
         requires getFatherStore(Bn, In, aLoc(Base,
                  pointerTypeValue(Ty, Ad), heap), Rev) ==K none
            andBool getInstanceInCBD(Base, Size, .K, .K, M) ==K none
         [transition]

    //non-atomic write stack
    rule <stackOpList> (ListItem(singleMem(Tid:Int, Bn:Int, In:Int,stack,
                        writeAByte(T:K, V:K, V1:K, Base:Int,
                  Other:Int, Size:Int, Ad:Int))) => .List) L:List </stackOpList>
         <stackObject>...
           <stackThreadId> Tid </stackThreadId>
           <stackAddrSpace> Ad </stackAddrSpace>
           <stackChunckRange> value(Left:Int, Right:Int) </stackChunckRange>
           <stackRange> constant </stackRange>
            ...</stackObject>
         <stackMap> BM:Map => BM[Base +Int Other <- V] </stackMap>
         requires Base +Int Size <=Int Right andBool Base >=Int Left
                   andBool notBool Base +Int Other in keys(BM)

    rule <stackOpList> (ListItem(singleMem(Tid:Int, Bn:Int, In:Int,stack,
                        writeAByte(T:K, V:K, V1:K, Base:Int,
                  Other:Int, Size:Int, Ad:Int))) => .List) L:List </stackOpList>
         <stackObject>...
           <stackThreadId> Tid </stackThreadId>
           <stackAddrSpace> Ad':Int </stackAddrSpace>
           <stackChunckRange> value(Left:Int, Right:Int) </stackChunckRange>
           <stackRange> constant </stackRange>
            ...</stackObject>
         <output>... .List =>
            ListItem("warning: input address space does not match with the address space of the stack.")
         </output>
         <stackMap> BM:Map => BM[Base +Int Other <- V] </stackMap>
         requires Base +Int Size <=Int Right andBool Base >=Int Left
                   andBool notBool Base +Int Other in keys(BM)
                    andBool Ad =/=Int Ad'

    rule <threads> (<thread>...
         <threadId> TID </threadId>
         <stackOpList> ListItem(singleMem(TID:Int, Bn:Int, In:Int,stack,
                        writeAByte(T:K, V:K, V1:K, Base:Int,
                  Other:Int, Size:Int, Ad:Int))) L:List </stackOpList>
          <stackList> SL:List </stackList>
          <localMemory> LocalStack:Set </localMemory>
         ...</thread> TD:Bag) => .Bag </threads>
         <output>... .List => ListItem("non-atomic read error when trying to read from some places that are out of the memory bound.")
         </output>
         requires notBool isInStackRange(SL, Base, Size, LocalStack)

    rule <k> K:K => .K </k>
         (<tomasulo>
            D:Bag
         </tomasulo> =>  <tomasulo>...
                        <instQueue> instList(.List) </instQueue>
                          ...</tomasulo>)
          <stackOpList> (ListItem(singleMem(Tid:Int, Bn:Int, In:Int,stack,
                        writeAByte(T:K, V:K, V1:K, Base:Int,
                  Other:Int, Size:Int, Ad:Int))) L:List => .List) </stackOpList>
         <stackObject>...
           <stackThreadId> Tid </stackThreadId>
           <stackAddrSpace> Ad </stackAddrSpace>
           <stackChunckRange> value(Left:Int, Right:Int) </stackChunckRange>
           <stackRange> constant </stackRange>
            ...</stackObject>
         <output>... .List =>
            ListItem("write a byte in a statck constant field that has been initialized.")
         </output>
         <stackMap> BM:Map </stackMap>
         requires Base +Int Size <=Int Right andBool Base >=Int Left
                   andBool Base +Int Other in keys(BM)

    rule <stackOpList> (ListItem(singleMem(Tid:Int, Bn:Int, In:Int,stack,
                        writeAByte(T:K, V:K, V1:K, Base:Int,
                  Other:Int, Size:Int, Ad:Int))) => .List) L:List </stackOpList>
         <stackObject>...
           <stackThreadId> Tid </stackThreadId>
           <stackAddrSpace> Ad':Int </stackAddrSpace>
           <stackChunckRange> value(Left:Int, Right:Int) </stackChunckRange>
           <stackRange> stack </stackRange>
            ...</stackObject>
         <output>... .List =>
            ListItem("warning: input address space does not match with the address space of the stack.")
         </output>
         <stackMap> BM:Map => BM[Base +Int Other <- V] </stackMap>
         requires Base +Int Size <=Int Right andBool Base >=Int Left
                   andBool Ad =/=K Ad'

    rule <stackOpList> (ListItem(singleMem(Tid:Int, Bn:Int, In:Int,stack,
                        writeAByte(T:K, V:K, V1:K, Base:Int,
                  Other:Int, Size:Int, Ad:Int))) => .List) L:List </stackOpList>
         <stackObject>...
           <stackThreadId> Tid </stackThreadId>
           <stackAddrSpace> Ad </stackAddrSpace>
           <stackChunckRange> value(Left:Int, Right:Int) </stackChunckRange>
           <stackRange> stack </stackRange>
            ...</stackObject>
         <stackMap> BM:Map => BM[Base +Int Other <- V] </stackMap>
         requires Base +Int Size <=Int Right andBool Base >=Int Left

    //read values from read back cell
    rule <readBack> readMapAux(varInstance(Bn:Int, In:Int),
              readBackHold(X:K, loadHold(T:K, LL:List),.K,
                        cmpxchgResult(N:Int)), RM:Map)
                  => readMap(RM) </readBack>
         <specRegisters> M:Map => M[varInstance(Bn, X) <- constStructVal(
                 valValue(joinBytes(T, LL)),valValue(N),.ElemList)] </specRegisters>
         <registers> M':Map </registers>
         <currBlock> basicBlockNum(Cur:Int, _:K) </currBlock>
         <instQueue> instList(L:List => updateVarInList(Cur, Bn,
               L, M[varInstance(Bn, X) <- constStructVal(
                 valValue(joinBytes(T, LL)),valValue(N),.ElemList)], M', Rev)) </instQueue>
         <toCommit> memList(Ava:K, Ava':Set, Avb:List, Avb':List, CML:List, ML:List)
               => memList(Ava, Ava', Avb:List, Avb':List,
                     CML, updateVarInList(Cur, Bn, ML,
                         M[varInstance(Bn, X) <- constStructVal(
                 valValue(joinBytes(T, LL)),valValue(N),.ElemList)], M', Rev)) </toCommit>
         <specTree> Rev:Map => updateVarInSpecTree(Rev, Cur, .K, .K,
              M[varInstance(Bn, X) <- constStructVal(
                 valValue(joinBytes(T, LL)),valValue(N),.ElemList)], M', Rev) </specTree>
         requires sizeof(T) ==K size(LL) andBool Bn >Int Cur
         [transition]

    rule <readBack> readMapAux(varInstance(Bn:Int, In:Int),
              readBackHold(X:K, loadHold(T:K, LL:List),.K, .K), RM:Map)
                  => readMap(RM) </readBack>
         <specRegisters> M:Map => M[varInstance(Bn, X) <- joinBytes(T, LL)] </specRegisters>
         <registers> M':Map </registers>
         <currBlock> basicBlockNum(Cur:Int, _:K) </currBlock>
         <instQueue> instList(L:List => updateVarInList(Cur, Bn,
               L, M[varInstance(Bn, X) <- joinBytes(T, LL)], M', Rev)) </instQueue>
         <toCommit> memList(Ava:K, Ava':Set, Avb:List, Avb':List, CML:List, ML:List)
               => memList(Ava, Ava', Avb:List, Avb':List,
                     CML, updateVarInList(Cur, Bn, ML,
                         M[varInstance(Bn, X) <- joinBytes(T, LL)], M', Rev)) </toCommit>
         <specTree> Rev:Map => updateVarInSpecTree(Rev, Cur, .K, .K,
              M[varInstance(Bn, X) <- joinBytes(T, LL)], M', Rev) </specTree>
         requires sizeof(T) ==K size(LL) andBool Bn >Int Cur
         [transition]

    rule <readBack> readMapAux(varInstance(Bn:Int, In:Int),
              readBackHold(X:K, loadHold(T:K, LL:List), undef, Fl:K), RM:Map)
                  => readMap(RM) </readBack>
         <specRegisters> M:Map => M[varInstance(Bn, X) <- undef] </specRegisters>
         <registers> M':Map </registers>
         <currBlock> basicBlockNum(Cur:Int, _:K) </currBlock>
         <instQueue> instList(L:List => updateVarInList(Cur, Bn,
               L, M[varInstance(Bn, X) <- joinBytes(T, LL)], M', Rev)) </instQueue>
         <toCommit> memList(Ava:K, Ava':Set, Avb:List, Avb':List, CML:List, ML:List)
               => memList(Ava, Ava', Avb:List, Avb':List,
                     CML, updateVarInList(Cur, Bn, ML,
                         M[varInstance(Bn, X) <- joinBytes(T, LL)], M', Rev)) </toCommit>
         <specTree> Rev:Map => updateVarInSpecTree(Rev, Cur, .K, .K,
              M[varInstance(Bn, X) <- joinBytes(T, LL)], M', Rev) </specTree>
         requires sizeof(T) ==K size(LL) andBool Bn >Int Cur
         [transition]

    rule <readBack> readMapAux(varInstance(Bn:Int, In:Int),
             readBackHold(X:K, loadHold(T:K, LL:List),.K, cmpxchgResult(N:Int)), RM:Map)
                  => readMap(RM) </readBack>
         <specRegisters> M:Map </specRegisters>
         <registers> M':Map => M'[X <- constStructVal(
                 valValue(joinBytes(T, LL)),valValue(N),.ElemList)] </registers>
         <currBlock> basicBlockNum(Cur:Int, _:K) </currBlock>
         <instQueue> instList(L:List => updateVarInList(Cur, Bn,
               L, M, M'[X <- constStructVal(
                 valValue(joinBytes(T, LL)),valValue(N),.ElemList)], Rev)) </instQueue>
         <toCommit> memList(Ava:K, Ava':Set, Avb:List, Avb':List, CML:List, ML:List)
               => memList(Ava, Ava', Avb:List, Avb':List,
                     CML, updateVarInList(Cur, Bn,
               L, M, M'[X <- constStructVal(
                 valValue(joinBytes(T, LL)),valValue(N),.ElemList)], Rev)) </toCommit>
         <specTree> Rev:Map => updateVarInSpecTree(Rev, Cur, .K, .K,
              M, M'[X <- constStructVal(
                 valValue(joinBytes(T, LL)),valValue(N),.ElemList)], Rev) </specTree>
         requires sizeof(T) ==K size(LL) andBool Bn <=Int Cur
         [transition]

    rule <readBack> readMapAux(varInstance(Bn:Int, In:Int),
             readBackHold(X:K, loadHold(T:K, LL:List),.K, .K), RM:Map)
                  => readMap(RM) </readBack>
         <specRegisters> M:Map </specRegisters>
         <registers> M':Map => M'[X <- joinBytes(T, LL)] </registers>
         <currBlock> basicBlockNum(Cur:Int, _:K) </currBlock>
         <instQueue> instList(L:List => updateVarInList(Cur, Bn,
               L, M, M'[X <- joinBytes(T, LL)], Rev)) </instQueue>
         <toCommit> memList(Ava:K, Ava':Set, Avb:List, Avb':List, CML:List, ML:List)
               => memList(Ava, Ava', Avb:List, Avb':List,
                     CML, updateVarInList(Cur, Bn,
               L, M, M'[X <- joinBytes(T, LL)], Rev)) </toCommit>
         <specTree> Rev:Map => updateVarInSpecTree(Rev, Cur, .K, .K,
              M, M'[X <- joinBytes(T, LL)], Rev) </specTree>
         requires sizeof(T) ==K size(LL) andBool Bn <=Int Cur
         [transition]

    rule <readBack> readMapAux(varInstance(Bn:Int, In:Int),
             readBackHold(X:K, loadHold(T:K, LL:List), undef, Fl:K), RM:Map)
                  => readMap(RM) </readBack>
         <specRegisters> M:Map </specRegisters>
         <registers> M':Map => M'[X <- undef] </registers>
         <currBlock> basicBlockNum(Cur:Int, _:K) </currBlock>
         <instQueue> instList(L:List => updateVarInList(Cur, Bn,
               L, M, M'[X <- joinBytes(T, LL)], Rev)) </instQueue>
         <toCommit> memList(Ava:K, Ava':Set, Avb:List, Avb':List, CML:List, ML:List)
               => memList(Ava, Ava', Avb:List, Avb':List,
                     CML, updateVarInList(Cur, Bn,
               L, M, M'[X <- joinBytes(T, LL)], Rev)) </toCommit>
         <specTree> Rev:Map => updateVarInSpecTree(Rev, Cur, .K, .K,
              M, M'[X <- joinBytes(T, LL)], Rev) </specTree>
         requires sizeof(T) ==K size(LL) andBool Bn <=Int Cur
         [transition]

    rule <readBack> readMapAux(varInstance(Bn:Int, In:Int),
              readBackHold(X:K, loadHold(T:K, LL:List),Unf:K, Fl:K), RM:Map)
                  => readMap(RM (varInstance(Bn:Int, In:Int)
                |-> readBackHold(X:K, loadHold(T:K, LL:List),Unf, Fl))) </readBack>
         requires sizeof(T) =/=K size(LL)
         [structural]

    //non-atomic read in stack
    rule <readBack> readMap(M:Map (varInstance(Bn, In)
                 |-> readBackHold(X:K, loadHold(T':K, LL:List), Unf:K, Fl:K)))
             => readMapAux(varInstance(Bn, In), readBackHold(X:K,
                loadHold(T':K, insertToOrderList(Other, V, LL)), Unf:K, Fl), M) </readBack>
         <stackOpList> (ListItem(singleMem(Tid:Int, Bn:Int, In:Int,stack,
                        readAByte(T:K, Base:Int,
                  Other:Int, Size:Int, Ad:Int))) => .List) L:List </stackOpList>
         <stackObject>...
           <stackThreadId> Tid </stackThreadId>
           <stackAddrSpace> Ad </stackAddrSpace>
           <stackChunckRange> value(Left:Int, Right:Int) </stackChunckRange>
            ...</stackObject>
         <stackMap>... (Base +Int Other) |-> V:K ...</stackMap>
         requires Base +Int Size <=Int Right andBool Base >=Int Left
         [transition]

    rule <readBack> readMap(M:Map (varInstance(Bn, In)
                 |-> readBackHold(X:K, loadHold(T':K, LL:List), Unf:K, Fl:K)))
             => readMapAux(varInstance(Bn, In), readBackHold(X:K,
                loadHold(T':K, insertToOrderList(Other, V, LL)), Unf:K, Fl), M) </readBack>
         <stackOpList> (ListItem(singleMem(Tid:Int, Bn:Int, In:Int,stack,
                        readAByte(T:K, Base:Int,
                  Other:Int, Size:Int, Ad:Int))) => .List) L:List </stackOpList>
         <stackObject>...
           <stackThreadId> Tid </stackThreadId>
           <stackAddrSpace> Ad':Int </stackAddrSpace>
           <stackChunckRange> value(Left:Int, Right:Int) </stackChunckRange>
            ...</stackObject>
         <stackMap>... (Base +Int Other) |-> V:K ...</stackMap>
         <output>... .List =>
            ListItem("warning: input address space does not match with the address space of the stack.")
         </output>
         requires Base +Int Size <=Int Right andBool Base >=Int Left
                 andBool Ad =/=K Ad'
         [transition]

    rule <threads> (<thread>...
         <threadId> TID </threadId>
         <stackOpList> ListItem(singleMem(TID:Int, Bn:Int, In:Int,stack,
                        readAByte(T:K, Base:Int, Other:Int,
                  Size:Int, Ad:Int))) L:List </stackOpList>
          <stackList> SL:List </stackList>
          <localMemory> LocalStack:Set </localMemory>
         ...</thread> TD:Bag) => .Bag </threads>
         <output>... .List =>
            ListItem("non-atomic read error when trying to read from some places that are out of the memory bound.")
         </output>
         requires notBool isInStackRange(SL, Base, Size, LocalStack)

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
            ...</stackObject>
         <stackMap> BM:Map </stackMap>
        <output>... .List => ListItem("error: undefied behavior because read a field that has not initialized yet.") </output>
         requires Base +Int Size <=Int Right andBool Base >=Int Left
               andBool notBool (Base +Int Other) in keys(BM)

    //stack close memory location
    rule <stackOpList> (ListItem(singleMem(TID:Int, B, In,
                stack, toClose(Base:Int))) => .List) L:List </stackOpList>
         <stackObjects>...
          (<stackObject> D:Bag
           <stackThreadId> Tid </stackThreadId>
           <stackChunckRange> value(Base:Int, Right:Int) </stackChunckRange>
            </stackObject> => .Bag)
         ...</stackObjects>
         <localMemory> Local:Set (SetItem(Base) => .Set) </localMemory>
         <stackList> SL:List => removeMemBlock(SL, Base) </stackList>

    rule (<tomasulo>
            D:Bag
         </tomasulo> =>  <tomasulo>...
                        <instQueue> instList(.List) </instQueue>
                          ...</tomasulo>)
         <stackOpList> (ListItem(singleMem(TID:Int, B, In,
                stack, toClose(Base:Int))) L:List => .List) </stackOpList>
         <localMemory> Local:Set </localMemory>
         <stackList> SL:List </stackList>
         <output>... .List => ListItem("error: undefied behavior because trying to end a va_arg loc that is not initialized or has already deleted.") </output>
         requires notBool Base in Local

    //heap close memory location
    rule <memOpList> (ListItem(singleMem(TID:Int, B, In,
                stack, toClose(Base:Int)))
                => ListItem(singleMem(TID:Int, B:Int, In:Int,heap,
                        msgWait(MsgN +Int 1)))) L:List </memOpList>
          (<object> D:Bag
           <chunckRange> value(Base:Int, Right:Int) </chunckRange>
            </object> => .Bag)
         <memoryList> SL:List => removeMemBlock(SL, Base) </memoryList>
         <timeStamps> TM:Map (CId |-> (MsgN:Int => MsgN +Int 1)) </timeStamps>
         <channelOps> ChanOps:List (.List => ListItem(
               sendToAll(CId, 0, maxMemChannel, MsgN +Int 1,
                   TM (CId |-> MsgN +Int 1), toClose(Base:Int)))) </channelOps>
         <ackMap> AckM:Map => AckM[MsgN +Int 1 <- 0] </ackMap>

    rule (<threads> TD:Bag => .Bag </threads>)
         <memOpList> (ListItem(singleMem(TID:Int, B, In,
                stack, toClose(Base:Int))) L:List => .List) </memOpList>
         <memoryList> SL:List </memoryList>
         <output>... .List => ListItem("error: undefied behavior because trying to free a memory location but the input pointer is not the original one created by a malloc/calloc/realloc function.") </output>
         requires notBool isAStartBase(Base, SL)

    //dealing with cmpxchg/atomicrmw
    rule <readBack> readMapAux(varInstance(Bn:Int, In:Int),
             readBackHold(X:K, loadHold(T:K, LL:List), Unf:K, cmpxchgResult(N:Int)), RM:Map)
                  => readMap(RM) </readBack>
         <specRegisters> M:Map </specRegisters>
         <registers> M':Map => M'[X <- constStructVal(
                 valValue(joinBytes(T, LL)),valValue(N),.ElemList)] </registers>
         <currBlock> basicBlockNum(Cur:Int, _:K) </currBlock>
         <instQueue> instList(L:List => updateVarInList(Cur, Bn,
               L, M, M'[X <- constStructVal(
                 valValue(joinBytes(T, LL)),valValue(N),.ElemList)], Rev)) </instQueue>
         <toCommit> memList(Ava:K, Ava':Set, Avb:List, Avb':List, CML:List, ML:List)
               => memList(Ava, Ava', Avb:List, Avb':List,
                     CML, updateVarInList(Cur, Bn,
               L, M, M'[X <- constStructVal(valValue(joinBytes(T, LL)),
                         valValue(N),.ElemList)], Rev)) </toCommit>
         <specTree> Rev:Map </specTree>
         requires sizeof(T) ==K size(LL) andBool Bn <=Int Cur
         [transition]

    rule <readBack> readMapAux(varInstance(Bn:Int, In:Int),
              readBackHold(X:K, loadHold(T:K, LL:List), Unf:K, cmpxchgResult(N:Int)), RM:Map)
                  => readMap(RM) </readBack>
         <specRegisters> M:Map => M[varInstance(Bn, X) <- constStructVal(
                 valValue(joinBytes(T, LL)),valValue(N),.ElemList)] </specRegisters>
         <registers> M':Map </registers>
         <currBlock> basicBlockNum(Cur:Int, _:K) </currBlock>
         <instQueue> instList(L:List => updateVarInList(Cur, Bn,
               L, M[varInstance(Bn, X) <- constStructVal(
                 valValue(joinBytes(T, LL)),valValue(N),.ElemList)], M', Rev)) </instQueue>
         <toCommit> memList(Ava:K, Ava':Set,Avb:List, Avb':List, CML:List, ML:List)
               => memList(Ava, Ava', Avb:List, Avb':List,
                     CML, updateVarInList(Cur, Bn, ML,
                        M[varInstance(Bn, X) <-
                        constStructVal(valValue(joinBytes(T, LL)),
                    valValue(N),.ElemList)], M', Rev)) </toCommit>
         <specTree> Rev:Map </specTree>
         requires sizeof(T) ==K size(LL) andBool Bn >Int Cur
         [transition]

    //deal with va_arg read a value and then read the actually content
    //then write back the hold to the next struct position
    rule <readBack> readMap(RM:Map (varInstance(Bn, In)
                 |-> readBackHold(X:K, loadHold(T':K, .List),Unf:K,
                  (vaWaitRead(T1:K) ~> vaWaitWrite(Loc:Loc)))))
             => readMapAux(varInstance(Bn, In), readBackHold(X:K,
                loadHold(T':K, getMemWithAtomic(BM, Base, 0, Size)),Unf, .K), RM) </readBack>
         <stackOpList> (ListItem(singleMem(Tid:Int, Bn:Int, In:Int,stack,
                        atomicRead(T:K, Base:Int,
                  Size:Int, Ad:Int, Order:K))) =>
            ListItem(singleMem(Tid, Bn, In, stack, atomicRead(T1,
                  base(VaLoc) +Int sizeOfStruct(VaType, joinBytes(T,
                         getMemWithAtomic(BM, Base, 0, Size))),
                 sizeof(T1), 0, Order:K)))
            ListItem(singleMem(Tid, Bn, In,stack,
              atomicWrite(getInnerType(vaArgType),
                      splitBytes(joinBytes(T, getMemWithAtomic(BM, Base, 0, Size))
                               +Int 1, getInnerType(vaArgType)),
                      storeOperand(Tid, getInnerType(vaArgType),
                  splitBytes(joinBytes(T, getMemWithAtomic(BM, Base, 0, Size))
                               +Int 1, getInnerType(vaArgType))), base(Loc),
              sizeof(getInnerType(vaArgType)), 0, monotonic)))) L:List </stackOpList>
         <stackObject>...
           <stackThreadId> Tid </stackThreadId>
         <stackAddrSpace> Ad:Int </stackAddrSpace>
            <stackChunckRange> value(Left:Int, Right:Int) </stackChunckRange>
                 ...</stackObject>
         <stackMap> BM:Map </stackMap>
         <vaList> value(VaType:K, VaLoc:Loc) </vaList>
         requires Base +Int Size <=Int Right andBool Base >=Int Left
                 andBool isChunckWritten(BM, Base, Base +Int Size)
              andBool sizeOfStruct(VaType, joinBytes(T,
                             getMemWithAtomic(BM, Base, 0, Size))) =/=K -1
              andBool sizeof(T1) <=Int sizeof(getTypeInStruct(VaType,
                               joinBytes(T, getMemWithAtomic(BM, Base, 0, Size))))

    rule <readBack> readMap(RM:Map (varInstance(Bn, In)
                 |-> readBackHold(X:K, loadHold(T':K, .List),Unf:K,
                  vaWaitWrite(Loc:Loc))))
                  => readMap(RM) </readBack>
         <stackOpList> (ListItem(singleMem(Tid:Int, Bn:Int, In:Int,stack,
                        atomicRead(T:K, Base:Int, Size:Int, Ad:Int, Order:K)))
                => ListItem(singleMem(Tid, Bn, In,stack,
              atomicWrite(getInnerType(vaArgType),
                      splitBytes(joinBytes(T, getMemWithAtomic(BM, Base, 0, Size))
                              , getInnerType(vaArgType)),
                      storeOperand(Tid, getInnerType(vaArgType),
                  splitBytes(joinBytes(T, getMemWithAtomic(BM, Base, 0, Size))
                              , getInnerType(vaArgType))), base(Loc),
              sizeof(getInnerType(vaArgType)), 0, monotonic)))) L:List </stackOpList>
         <stackObject>...
           <stackThreadId> Tid </stackThreadId>
         <stackAddrSpace> Ad:Int </stackAddrSpace>
            <stackChunckRange> value(Left:Int, Right:Int) </stackChunckRange>
                 ...</stackObject>
         <stackMap> BM:Map </stackMap>
         <vaList> value(VaType:K, VaLoc:Loc) </vaList>
         requires Base +Int Size <=Int Right andBool Base >=Int Left
                 andBool isChunckWritten(BM, Base, Base +Int Size)
         [transition]

    rule (<tomasulo> D:Bag
            <readBack> readMap(RM:Map (varInstance(Bn, In)
                 |-> readBackHold(X:K, loadHold(T':K, .List),Unf:K,
                  (vaWaitRead(T1:K) ~> vaWaitWrite(Loc:Loc))))) </readBack>
          </tomasulo> => <tomasulo>...
                        <instQueue> instList(.List) </instQueue>
                          ...</tomasulo>)
         <stackOpList> (ListItem(singleMem(Tid:Int, Bn:Int, In:Int,stack,
                        atomicRead(T:K, Base:Int,
                  Size:Int, Ad:Int, Order:K))) L:List => .List) </stackOpList>
         <vaList> value(VaType:K, VaLoc:K) </vaList>
         <k> K:K => .K </k>
         <stackMap> BM:Map </stackMap>
        <output>... .List => ListItem("error: input arg va_arg type mismatch.") </output>
           requires sizeOfStruct(VaType, joinBytes(T,
                          getMemWithAtomic(BM, Base, 0, Size))) =/=K -1
                  andBool sizeof(T1) >Int sizeof(getTypeInStruct(
                   VaType, joinBytes(T, getMemWithAtomic(BM, Base, 0, Size))))

    rule (<tomasulo> D:Bag
           <readBack> readMap(RM:Map (varInstance(Bn, In)
                 |-> readBackHold(X:K, loadHold(T':K, .List),Unf:K,
                  (vaWaitRead(T1:K) ~> vaWaitWrite(Loc:Loc))))) </readBack>
              </tomasulo> <tomasulo>...
                        <instQueue> instList(.List) </instQueue>
                          ...</tomasulo>)
         <k> K:K => .K </k>
         <stackOpList> (ListItem(singleMem(Tid:Int, Bn:Int, In:Int,stack,
                        atomicRead(T:K, Base:Int,
                  Size:Int, Ad:Int, Order:K))) L:List => .List) </stackOpList>
         <vaList> value(VaType:K, VaLoc:Loc) </vaList>
         <stackMap> BM:Map </stackMap>
        <output>... .List => ListItem("error: try to read a outofrange place as a va_arg.") </output>
           requires sizeof(T1) <=Int sizeof(getTypeInStruct(
                   VaType, joinBytes(T, getMemWithAtomic(BM, Base, 0, Size))))
                   andBool sizeOfStruct(VaType, 
               joinBytes(T, getMemWithAtomic(BM, Base, 0, Size))) ==K -1

    //non-atomic write in heap
    rule <threads> TD:Bag => .Bag </threads>
         <memOpList> ListItem(singleMem(Tid:Int, Bn:Int, In:Int,heap,
                        writeAByte(T:K, V:K, V1:K, Base:Int, Other:Int,
                  Size:Int, Ad:Int))) L:List => .List </memOpList>
         <object>... <chunckRange> value(Left:Int, Right:Int) </chunckRange>
         <race> Races:Set </race>
            ...</object>
         <output>... .List =>
            ListItem("non-atomic write error when trying to read from some places that are out of the memory bound.")
         </output>
        <memoryList> MOL:List </memoryList>
        requires notBool isInMemRange(MOL, Base, Size)


    //first case, when the write is a single byte
    rule <channelId> CId </channelId>
         <memOpList> (ListItem(singleMem(Tid:Int, Bn:Int, In:Int,heap,
                        writeAByte(T:K, V:K, V1:K, Base:Int,
                  Other:Int, 1, Ad:Int))) => .List) L:List </memOpList>
         <object>... <chunckRange> value(Left:Int, Right:Int) </chunckRange>
         <race> Races:Set </race>
         <addrSpace> Ad </addrSpace>
         <range> constant </range>
         <complete> CM:Map </complete> ...</object>
         <timeStamps> TM:Map (CId |-> (MsgN:Int => MsgN +Int 1)) </timeStamps>
         <channelOps> ChanOps:List (.List => ListItem(
               sendToAll(CId, 0, maxMemChannel, MsgN +Int 1,
                   TM (CId |-> MsgN +Int 1),
                 msgByteWrite(Tid,Bn,In, Base, Other, 1, V)))) </channelOps>
         <ackMap> AckM:Map => AckM[MsgN +Int 1 <- 0] </ackMap>
         <byteMap> BM:Map => BM[Base +Int Other <- V] </byteMap>
         requires Base +Int 1 <=Int Right andBool Base  >=Int Left
                 andBool notBool isOverlap(Base, 1, .K, Races)
                 andBool notBool memId(Tid, Bn, In) in keys(CM)
                 andBool notBool (Base +Int Other) in keys(BM)

    rule <channelId> CId </channelId>
         <memOpList> (ListItem(singleMem(Tid:Int, Bn:Int, In:Int,heap,
                        writeAByte(T:K, V:K, V1:K, Base:Int,
                  Other:Int, 1, Ad:Int))) => .List) L:List </memOpList>
         <object>... <chunckRange> value(Left:Int, Right:Int) </chunckRange>
         <race> Races:Set </race>
         <addrSpace> Ad </addrSpace>
         <range> heap </range>
         <complete> CM:Map </complete>
          ...</object>
         <timeStamps> TM:Map (CId |-> (MsgN:Int => MsgN +Int 1)) </timeStamps>
         <channelOps> ChanOps:List (.List => ListItem(
               sendToAll(CId, 0, maxMemChannel, MsgN +Int 1,
                   TM (CId |-> MsgN +Int 1),
                 msgByteWrite(Tid,Bn,In, Base, Other, 1, V)))) </channelOps>
         <ackMap> AckM:Map => AckM[MsgN +Int 1 <- 0] </ackMap>
         <byteMap> BM:Map => BM[Base +Int Other <- V] </byteMap>
         requires Base +Int 1 <=Int Right andBool Base  >=Int Left
                 andBool notBool isOverlap(Base, 1, .K, Races)
                 andBool notBool memId(Tid, Bn, In) in keys(CM)

    rule <threads> Td:Bag => .Bag </threads>
         <memOpList> ListItem(singleMem(Tid:Int, Bn:Int, In:Int,heap,
                        writeAByte(T:K, V:K, V1:K, Base:Int,
                  Other:Int, Size:Int, Ad:Int))) L:List => .List </memOpList>
         <object>... <chunckRange> value(Left:Int, Right:Int) </chunckRange>
         <race> Races:Set </race>
         <range> constant </range>
            ...</object>
         <byteMap> BM:Map </byteMap>
        <output>... .List => ListItem("error: undefied behavior because trying to write to a constant field that has been initialized.") </output>
         requires Base +Int Size <Int Right andBool Base >=Int Left
                andBool (Base +Int Other) in keys(BM)

    rule <channelId> CId </channelId>
         <memOpList> (ListItem(singleMem(Tid:Int, Bn:Int, In:Int,heap,
                        writeAByte(T:K, V:K, V1:K, Base:Int,
                  Other:Int, 1, Ad:Int))) => .List) L:List </memOpList>
         <object>... <chunckRange> value(Left:Int, Right:Int) </chunckRange>
         <range> heap </range>
         <race> Races:Set </race>
         <complete> CM:Map </complete>
         <addrSpace> Ad':Int </addrSpace>
          ...</object>
         <timeStamps> TM:Map (CId |-> (MsgN:Int => MsgN +Int 1)) </timeStamps>
         <channelOps> ChanOps:List (.List => ListItem(
               sendToAll(CId, 0, maxMemChannel, MsgN +Int 1,
                   TM (CId |-> MsgN +Int 1),
                 msgByteWrite(Tid,Bn,In, Base, Other, 1, V)))) </channelOps>
         <ackMap> AckM:Map => AckM[MsgN +Int 1 <- 0] </ackMap>
         <byteMap> BM:Map => BM[Base +Int Other <- V] </byteMap>
         <output>... .List =>
            ListItem("warning: input address space does not match with the address space of the memory.")
         </output>
         requires Base +Int 1 <=Int Right andBool Base  >=Int Left
                 andBool notBool isOverlap(Base, 1, .K, Races)
                 andBool notBool memId(Tid, Bn, In) in keys(CM)
                 andBool Ad =/=K Ad'

    rule <channelId> CId </channelId>
         <memOpList> (ListItem(singleMem(Tid:Int, Bn:Int, In:Int,heap,
                        writeAByte(T:K, V:K, V1:K, Base:Int,
                  Other:Int, 1, Ad:Int))) => .List) L:List </memOpList>
         <object>... <chunckRange> value(Left:Int, Right:Int) </chunckRange>
         <range> constant </range>
         <race> Races:Set </race>
         <complete> CM:Map </complete>
         <addrSpace> Ad':Int </addrSpace>
          ...</object>
         <timeStamps> TM:Map (CId |-> (MsgN:Int => MsgN +Int 1)) </timeStamps>
         <channelOps> ChanOps:List (.List => ListItem(
               sendToAll(CId, 0, maxMemChannel, MsgN +Int 1,
                   TM (CId |-> MsgN +Int 1),
                 msgByteWrite(Tid,Bn,In, Base, Other, 1, V)))) </channelOps>
         <ackMap> AckM:Map => AckM[MsgN +Int 1 <- 0] </ackMap>
         <byteMap> BM:Map => BM[Base +Int Other <- V] </byteMap>
         <output>... .List =>
            ListItem("warning: input address space does not match with the address space of the memory.")
         </output>
         requires Base +Int 1 <=Int Right andBool Base  >=Int Left
                 andBool notBool isOverlap(Base, 1, .K, Races)
                 andBool notBool memId(Tid, Bn, In) in keys(CM)
                 andBool Ad =/=K Ad'
                 andBool notBool (Base +Int Other) in keys(BM)

    //non-atomic write: when the byte number is not one
     //and this is the first time the non-atomic write is touching the mem
    rule <channelId> CId </channelId>
         <memOpList> (ListItem(singleMem(Tid:Int, Bn:Int, In:Int,heap,
                        writeAByte(T:K, V:K, V1:K, Base:Int,
                  Other:Int, Size:Int, Ad:Int))) => .List) L:List </memOpList>
         <object>... <chunckRange> value(Left:Int, Right:Int) </chunckRange>
         <addrSpace> Ad:Int </addrSpace>
         <range> constant </range>
         <race> Races:Set (.Set => SetItem(
                   singleMem(Tid, Bn, In, heap, value(Base,
                 Base +Int Size)))) </race>
         <complete> CM:Map => CM[memId(Tid,Bn,In) <- 1] </complete>
            ...</object>
         <timeStamps> TM:Map (CId |-> (MsgN:Int => MsgN +Int 1)) </timeStamps>
         <channelOps> ChanOps:List (.List => ListItem(
               sendToAll(CId, 0, maxMemChannel, MsgN +Int 1,
                   TM (CId |-> MsgN +Int 1),
                 msgByteWrite(Tid,Bn,In, Base, Other, Size, V)))) </channelOps>
         <ackMap> AckM:Map => AckM[MsgN +Int 1 <- 0] </ackMap>
         <byteMap> BM:Map => BM[Base +Int Other <- V] </byteMap>
         requires Base +Int Size <=Int Right andBool Base >=Int Left
                 andBool notBool isOverlap(Base, Size, .K, Races)
                 andBool notBool memId(Tid, Bn, In) in keys(CM)
                 andBool Size =/=Int 1
                 andBool notBool (Base +Int Other) in keys(BM)

    rule <channelId> CId </channelId>
         <memOpList> (ListItem(singleMem(Tid:Int, Bn:Int, In:Int,heap,
                        writeAByte(T:K, V:K, V1:K, Base:Int,
                  Other:Int, Size:Int, Ad:Int))) => .List) L:List </memOpList>
         <object>... <chunckRange> value(Left:Int, Right:Int) </chunckRange>
         <addrSpace> Ad:Int </addrSpace>
         <range> heap </range>
         <race> Races:Set (.Set => SetItem(
                   singleMem(Tid, Bn, In, heap, value(Base,
                 Base +Int Size)))) </race>
         <complete> CM:Map => CM[memId(Tid,Bn,In) <- 1] </complete>
            ...</object>
         <timeStamps> TM:Map (CId |-> (MsgN:Int => MsgN +Int 1)) </timeStamps>
         <channelOps> ChanOps:List (.List => ListItem(
               sendToAll(CId, 0, maxMemChannel, MsgN +Int 1,
                   TM (CId |-> MsgN +Int 1),
                 msgByteWrite(Tid,Bn,In, Base, Other, Size, V)))) </channelOps>
         <ackMap> AckM:Map => AckM[MsgN +Int 1 <- 0] </ackMap>
         <byteMap> BM:Map => BM[Base +Int Other <- V] </byteMap>
         requires Base +Int Size <=Int Right andBool Base >=Int Left
                 andBool notBool isOverlap(Base, Size, .K, Races)
                 andBool notBool memId(Tid, Bn, In) in keys(CM)
                 andBool Size =/=Int 1

    rule <channelId> CId </channelId>
         <memOpList> (ListItem(singleMem(Tid:Int, Bn:Int, In:Int,heap,
                        writeAByte(T:K, V:K, V1:K, Base:Int,
                  Other:Int, Size:Int, Ad:Int))) => .List) L:List </memOpList>
         <object>... <chunckRange> value(Left:Int, Right:Int) </chunckRange>
         <range> constant </range>
         <addrSpace> Ad':Int </addrSpace>
         <race> Races:Set (.Set => SetItem(
                   singleMem(Tid, Bn, In, heap, value(Base,
                 Base +Int Size)))) </race>
         <complete> CM:Map => CM[memId(Tid,Bn,In) <- 1] </complete>
            ...</object>
         <timeStamps> TM:Map (CId |-> (MsgN:Int => MsgN +Int 1)) </timeStamps>
         <channelOps> ChanOps:List (.List => ListItem(
               sendToAll(CId, 0, maxMemChannel, MsgN +Int 1,
                   TM (CId |-> MsgN +Int 1),
                 msgByteWrite(Tid,Bn,In, Base, Other, Size, V)))) </channelOps>
         <ackMap> AckM:Map => AckM[MsgN +Int 1 <- 0] </ackMap>
         <byteMap> BM:Map => BM[Base +Int Other <- V] </byteMap>
         <output>... .List =>
            ListItem("warning: input address space does not match with the address space of the memory.")
         </output>
         requires Base +Int Size <=Int Right andBool Base >=Int Left
                 andBool notBool isOverlap(Base, Size, .K, Races)
                 andBool notBool memId(Tid, Bn, In) in keys(CM)
                 andBool Size =/=Int 1 andBool Ad =/=K Ad'
                 andBool notBool (Base +Int Other) in keys(BM)

    rule <channelId> CId </channelId>
         <memOpList> (ListItem(singleMem(Tid:Int, Bn:Int, In:Int,heap,
                        writeAByte(T:K, V:K, V1:K, Base:Int,
                  Other:Int, Size:Int, Ad:Int))) => .List) L:List </memOpList>
         <object>... <chunckRange> value(Left:Int, Right:Int) </chunckRange>
         <range> heap </range>
         <addrSpace> Ad':Int </addrSpace>
         <race> Races:Set (.Set => SetItem(
                   singleMem(Tid, Bn, In, heap, value(Base,
                 Base +Int Size)))) </race>
         <complete> CM:Map => CM[memId(Tid,Bn,In) <- 1] </complete>
            ...</object>
         <timeStamps> TM:Map (CId |-> (MsgN:Int => MsgN +Int 1)) </timeStamps>
         <channelOps> ChanOps:List (.List => ListItem(
               sendToAll(CId, 0, maxMemChannel, MsgN +Int 1,
                   TM (CId |-> MsgN +Int 1),
                 msgByteWrite(Tid,Bn,In, Base, Other, Size, V)))) </channelOps>
         <ackMap> AckM:Map => AckM[MsgN +Int 1 <- 0] </ackMap>
         <byteMap> BM:Map => BM[Base +Int Other <- V] </byteMap>
         <output>... .List =>
            ListItem("warning: input address space does not match with the address space of the memory.")
         </output>
         requires Base +Int Size <=Int Right andBool Base >=Int Left
                 andBool notBool isOverlap(Base, Size, .K, Races)
                 andBool notBool memId(Tid, Bn, In) in keys(CM)
                 andBool Size =/=Int 1 andBool Ad =/=K Ad'

    //non-atomic write: when the byte number is not one
     //and this is for the rest of the write to touch the mem
    rule <channelId> CId </channelId>
         <memOpList> (ListItem(singleMem(Tid:Int, Bn:Int, In:Int, heap,
                        writeAByte(T:K, V:K, V1:K, Base:Int,
                  Other:Int, Size:Int, Ad:Int))) => .List) L:List </memOpList>
         <object>... <chunckRange> value(Left:Int, Right:Int) </chunckRange>
         <addrSpace> Ad:Int </addrSpace>
         <complete>... memId(Tid, Bn, In)
                          |-> (Count:Int => Count +Int 1) ...</complete>
         <race> Races:Set </race>
         <range> constant </range>
            ...</object>
         <timeStamps> TM:Map (CId |-> (MsgN:Int => MsgN +Int 1)) </timeStamps>
         <channelOps> ChanOps:List (.List => ListItem(
               sendToAll(CId, 0, maxMemChannel, MsgN +Int 1,
                   TM (CId |-> MsgN +Int 1),
                 msgByteWrite(Tid,Bn,In, Base, Other, Size, V)))) </channelOps>
         <ackMap> AckM:Map => AckM[MsgN +Int 1 <- 0] </ackMap>
         <byteMap> BM:Map => BM[Base +Int Other <- V] </byteMap>
         requires Base +Int Size <=Int Right andBool Base >=Int Left
                 andBool Count +Int 1 <Int Size
                 andBool Size =/=Int 1
                 andBool notBool (Base +Int Other) in keys(BM)

    rule <channelId> CId </channelId> 
         <memOpList> (ListItem(singleMem(Tid:Int, Bn:Int, In:Int, heap,
                        writeAByte(T:K, V:K, V1:K, Base:Int,
                  Other:Int, Size:Int, Ad:Int))) => .List) L:List </memOpList>
         <object>... <chunckRange> value(Left:Int, Right:Int) </chunckRange>
         <addrSpace> Ad:Int </addrSpace>
         <complete>... memId(Tid, Bn, In)
                          |-> (Count:Int => Count +Int 1) ...</complete>
         <race> Races:Set </race>
         <range> heap </range>
            ...</object>
         <timeStamps> TM:Map (CId |-> (MsgN:Int => MsgN +Int 1)) </timeStamps>
         <channelOps> ChanOps:List (.List => ListItem(
               sendToAll(CId, 0, maxMemChannel, MsgN +Int 1,
                   TM (CId |-> MsgN +Int 1),
                 msgByteWrite(Tid,Bn,In, Base, Other, Size, V)))) </channelOps>
         <ackMap> AckM:Map => AckM[MsgN +Int 1 <- 0] </ackMap>
         <byteMap> BM:Map => BM[Base +Int Other <- V] </byteMap>
         requires Base +Int Size <=Int Right andBool Base >=Int Left
                 andBool Count +Int 1 <Int Size
                 andBool Size =/=Int 1

    rule <channelId> CId </channelId>
         <memOpList> (ListItem(singleMem(Tid:Int, Bn:Int, In:Int, heap,
                        writeAByte(T:K, V:K, V1:K, Base:Int,
                  Other:Int, Size:Int, Ad:Int))) => .List) L:List </memOpList>
         <object>... <chunckRange> value(Left:Int, Right:Int) </chunckRange>
         <addrSpace> Ad':Int </addrSpace>
         <complete>... memId(Tid, Bn, In)
                          |-> (Count:Int => Count +Int 1) ...</complete>
         <race> Races:Set </race>
         <range> constant </range>
            ...</object>
         <timeStamps> TM:Map (CId |-> (MsgN:Int => MsgN +Int 1)) </timeStamps>
         <channelOps> ChanOps:List (.List => ListItem(
               sendToAll(CId, 0, maxMemChannel, MsgN +Int 1,
                   TM (CId |-> MsgN +Int 1),
                 msgByteWrite(Tid,Bn,In, Base, Other, Size, V)))) </channelOps>
         <ackMap> AckM:Map => AckM[MsgN +Int 1 <- 0] </ackMap>
         <byteMap> BM:Map => BM[Base +Int Other <- V] </byteMap>
         <output>... .List =>
            ListItem("warning: input address space does not match with the address space of the memory.")
         </output>
         requires Base +Int Size <=Int Right andBool Base >=Int Left
                 andBool Count +Int 1 <Int Size
                 andBool Size =/=Int 1 andBool Ad =/=K Ad'
                 andBool notBool (Base +Int Other) in keys(BM)

    rule <channelId> CId </channelId> 
         <memOpList> (ListItem(singleMem(Tid:Int, Bn:Int, In:Int, heap,
                        writeAByte(T:K, V:K, V1:K, Base:Int,
                  Other:Int, Size:Int, Ad:Int))) => .List) L:List </memOpList>
         <object>... <chunckRange> value(Left:Int, Right:Int) </chunckRange>
         <addrSpace> Ad':Int </addrSpace>
         <complete>... memId(Tid, Bn, In)
                          |-> (Count:Int => Count +Int 1) ...</complete>
         <race> Races:Set </race>
         <range> heap </range>
            ...</object>
         <timeStamps> TM:Map (CId |-> (MsgN:Int => MsgN +Int 1)) </timeStamps>
         <channelOps> ChanOps:List (.List => ListItem(
               sendToAll(CId, 0, maxMemChannel, MsgN +Int 1,
                   TM (CId |-> MsgN +Int 1),
                 msgByteWrite(Tid,Bn,In, Base, Other, Size, V)))) </channelOps>
         <ackMap> AckM:Map => AckM[MsgN +Int 1 <- 0] </ackMap>
         <byteMap> BM:Map => BM[Base +Int Other <- V] </byteMap>
         <output>... .List =>
            ListItem("warning: input address space does not match with the address space of the memory.")
         </output>
         requires Base +Int Size <=Int Right andBool Base >=Int Left
                 andBool Count +Int 1 <Int Size
                 andBool Size =/=Int 1 andBool Ad =/=K Ad'

    //when the write byte op is the last one 
    rule <channelId> CId </channelId>
         <memOpList> (ListItem(singleMem(Tid:Int, Bn:Int, In:Int,heap,
                        writeAByte(T:K, V:K, V1:K, Base:Int,
                  Other:Int, Size:Int, Ad:Int))) => .List) L:List </memOpList>
         <object>... <chunckRange> value(Left:Int, Right:Int) </chunckRange>
         <addrSpace> Ad:Int </addrSpace>
         <complete> CM:Map ((memId(Tid, Bn, In)
                          |-> Count:K) => .Map) </complete>
         <race> Races:Set => removeRaceInSet(Races,.K, Tid, Bn, In) </race>
         <range> constant </range>
            ...</object>
         <timeStamps> TM:Map (CId |-> (MsgN:Int => MsgN +Int 1)) </timeStamps>
         <channelOps> ChanOps:List (.List => ListItem(
               sendToAll(CId, 0, maxMemChannel, MsgN +Int 1,
                   TM (CId |-> MsgN +Int 1),
                 msgByteWrite(Tid,Bn,In, Base, Other, Size, V)))) </channelOps>
         <ackMap> AckM:Map => AckM[MsgN +Int 1 <- 0] </ackMap>
         <byteMap> BM:Map => BM[Base +Int Other <- V] </byteMap>
         requires Base +Int Size <=Int Right andBool Base >=Int Left
                 andBool Count +Int 1 >=Int Size
                 andBool Size =/=Int 1
                 andBool notBool (Base +Int Other) in keys(BM)

    rule <channelId> CId </channelId>
         <memOpList> (ListItem(singleMem(Tid:Int, Bn:Int, In:Int,heap,
                        writeAByte(T:K, V:K, V1:K, Base:Int,
                  Other:Int, Size:Int, Ad:Int))) => .List) L:List </memOpList>
         <object>... <chunckRange> value(Left:Int, Right:Int) </chunckRange>
         <addrSpace> Ad:Int </addrSpace>
         <complete> CM:Map ((memId(Tid, Bn, In)
                          |-> Count:K) => .Map) </complete>
         <race> Races:Set => removeRaceInSet(Races,.K, Tid, Bn, In) </race>
         <range> heap </range>
            ...</object>
         <timeStamps> TM:Map (CId |-> (MsgN:Int => MsgN +Int 1)) </timeStamps>
         <channelOps> ChanOps:List (.List => ListItem(
               sendToAll(CId, 0, maxMemChannel, MsgN +Int 1,
                   TM (CId |-> MsgN +Int 1),
                 msgByteWrite(Tid,Bn,In, Base, Other, Size, V)))) </channelOps>
         <ackMap> AckM:Map => AckM[MsgN +Int 1 <- 0] </ackMap>
         <byteMap> BM:Map => BM[Base +Int Other <- V] </byteMap>
         requires Base +Int Size <=Int Right andBool Base >=Int Left
                 andBool Count +Int 1 >=Int Size
                 andBool Size =/=Int 1

    rule <channelId> CId </channelId>
         <memOpList> (ListItem(singleMem(Tid:Int, Bn:Int, In:Int,heap,
                        writeAByte(T:K, V:K, V1:K, Base:Int,
                  Other:Int, Size:Int, Ad:Int))) => .List) L:List </memOpList>
         <object>... <chunckRange> value(Left:Int, Right:Int) </chunckRange>
         <addrSpace> Ad':Int </addrSpace>
         <complete> CM:Map ((memId(Tid, Bn, In)
                          |-> Count:K) => .Map) </complete>
         <race> Races:Set => removeRaceInSet(Races,.K, Tid, Bn, In) </race>
         <range> constant </range>
            ...</object>
         <timeStamps> TM:Map (CId |-> (MsgN:Int => MsgN +Int 1)) </timeStamps>
         <channelOps> ChanOps:List (.List => ListItem(
               sendToAll(CId, 0, maxMemChannel, MsgN +Int 1,
                   TM (CId |-> MsgN +Int 1),
                 msgByteWrite(Tid,Bn,In, Base, Other, Size, V)))) </channelOps>
         <ackMap> AckM:Map => AckM[MsgN +Int 1 <- 0] </ackMap>
         <byteMap> BM:Map => BM[Base +Int Other <- V] </byteMap>
         <output>... .List =>
            ListItem("warning: input address space does not match with the address space of the memory.")
         </output>
         requires Base +Int Size <=Int Right andBool Base >=Int Left
                 andBool Count +Int 1 >=Int Size
                 andBool Size =/=Int 1 andBool Ad =/=K Ad'
                 andBool notBool (Base +Int Other) in keys(BM)

    rule <channelId> CId </channelId>
         <memOpList> (ListItem(singleMem(Tid:Int, Bn:Int, In:Int,heap,
                        writeAByte(T:K, V:K, V1:K, Base:Int,
                  Other:Int, Size:Int, Ad:Int))) => .List) L:List </memOpList>
         <object>... <chunckRange> value(Left:Int, Right:Int) </chunckRange>
         <addrSpace> Ad':Int </addrSpace>
         <complete> CM:Map ((memId(Tid, Bn, In)
                          |-> Count:K) => .Map) </complete>
         <race> Races:Set => removeRaceInSet(Races,.K, Tid, Bn, In) </race>
         <range> heap </range>
            ...</object>
         <timeStamps> TM:Map (CId |-> (MsgN:Int => MsgN +Int 1)) </timeStamps>
         <channelOps> ChanOps:List (.List => ListItem(
               sendToAll(CId, 0, maxMemChannel, MsgN +Int 1,
                   TM (CId |-> MsgN +Int 1),
                 msgByteWrite(Tid,Bn,In, Base, Other, Size, V)))) </channelOps>
         <ackMap> AckM:Map => AckM[MsgN +Int 1 <- 0] </ackMap>
         <byteMap> BM:Map => BM[Base +Int Other <- V] </byteMap>
         <output>... .List =>
            ListItem("warning: input address space does not match with the address space of the memory.")
         </output>
         requires Base +Int Size <=Int Right andBool Base >=Int Left
                 andBool Count +Int 1 >=Int Size
                 andBool Size =/=Int 1 andBool Ad =/=K Ad'

    //if there is a race condition
    rule <threads> TD:Bag => .Bag </threads>
         <memOpList> ListItem(singleMem(Tid:Int, Bn:Int, In:Int,heap,
                        writeAByte(T:K, V:K, V1:K, Base:Int,
                  Other:Int, Size:Int, Ad:Int))) L:List => .List </memOpList>
         <object>... <chunckRange> value(Left:Int, Right:Int) </chunckRange>
         <race> Races:Set </race> ...</object>
        <output>... .List =>
          ListItem("error: undefied behavior because two mem op races on the same location") </output>
         requires Base +Int Size <=Int Right
                     andBool Base >=Int Left
                 andBool isOverlap(Base, Size, .K, Races)

    //non-atomic read in heap
    rule <threads> TD:Bag => .Bag </threads>
         <memOpList> ListItem(singleMem(Tid:Int, Bn:Int, In:Int,heap,
                        readAByte(T:K, Base:Int, Other:Int,
                  Size:Int, Ad:Int))) L:List => .List </memOpList>
         <object>... <chunckRange> value(Left:Int, Right:Int) </chunckRange>
         <race> Races:Set </race>
            ...</object>
         <output>... .List =>
            ListItem("non-atomic read error when trying to read from some places that are out of the memory bound.")
         </output>
        <memoryList> MOL:List </memoryList>
        requires notBool isInMemRange(MOL, Base, Size)

    //if there is only one byte
    rule <readBack> readMap(RM:Map (varInstance(Bn, In)
                 |-> readBackHold(X:K, loadHold(T':K, LL:List), Unf:K, Fl:K)))
             => readMapAux(varInstance(Bn, In), readBackHold(X:K,
                loadHold(T':K, insertToOrderList(Other, V, LL)), undef, Fl), RM) </readBack>
         <threadId> Tid </threadId>
         <memChannelId> CId:K </memChannelId>
         <channelId> CId </channelId>
         <memOpList> (ListItem(singleMem(Tid:Int, Bn:Int, In:Int,heap,
                        readAByte(T:K, Base:Int,
                  Other:Int, Size:Int, Ad:Int))) => .List) L:List </memOpList>
         <object>... <chunckRange> value(Left:Int, Right:Int) </chunckRange>
         <addrSpace> Ad:Int </addrSpace>
         <race> Races:Set </race>
         <complete> CM:Map => updateCompleteCell(CM,
                     Size, memId(Tid, Bn, In))  </complete>
                  ...</object>
         <byteMap>... Base +Int Other |-> V:K ...</byteMap>
         requires Base +Int Size <=Int Right andBool Base >=Int Left
                 andBool isOverlap(Base, Size, .K, Races)
                 andBool notBool memId(Tid, Bn, In) in keys(CM)
          [transition]

    rule <readBack> readMap(RM:Map (varInstance(Bn, In)
                 |-> readBackHold(X:K, loadHold(T':K, LL:List), Unf:K, Fl:K)))
             => readMapAux(varInstance(Bn, In), readBackHold(X:K,
                loadHold(T':K, insertToOrderList(Other, V, LL)), Unf:K, Fl), RM) </readBack>
         <threadId> Tid </threadId>
         <memChannelId> CId:K </memChannelId>
         <channelId> CId </channelId>
         <memOpList> (ListItem(singleMem(Tid:Int, Bn:Int, In:Int,heap,
                        readAByte(T:K, Base:Int,
                  Other:Int, 1, Ad:Int))) => .List) L:List </memOpList>
         <object>... <chunckRange> value(Left:Int, Right:Int) </chunckRange>
         <addrSpace> Ad:Int </addrSpace>
         <race> Races:Set </race> ...</object>
         <byteMap>... Base +Int Other |-> V:K ...</byteMap>
         requires Base +Int 1 <=Int Right andBool Base >=Int Left
                 andBool notBool isOverlap(Base, 1, .K, Races)
          [transition]

    rule <readBack> readMap(RM:Map (varInstance(Bn, In)
                 |-> readBackHold(X:K, loadHold(T':K, LL:List),Unf:K, Fl:K)))
             => readMapAux(varInstance(Bn, In), readBackHold(X:K,
                loadHold(T':K, insertToOrderList(Other, V, LL)),Unf, Fl), RM) </readBack>
         <threadId> Tid </threadId>
         <memChannelId> CId:K </memChannelId>
         <channelId> CId </channelId>
         <memOpList> (ListItem(singleMem(Tid:Int, Bn:Int, In:Int,heap,
                        readAByte(T:K, Base:Int,
                  Other:Int, 1, Ad:Int))) => .List) L:List </memOpList>
         <object>... <chunckRange> value(Left:Int, Right:Int) </chunckRange>
         <addrSpace> Ad':Int </addrSpace>
          <race> Races:Set </race> ...</object>
         <byteMap>... Base +Int Other |-> V:K ...</byteMap>
         <output>... .List =>
            ListItem("warning: input address space does not match with the address space of the memory.")
         </output>
         requires Base +Int 1 <=Int Right andBool Base >=Int Left
                 andBool notBool isOverlap(Base, 1, .K, Races)
                   andBool Ad =/=K Ad'
          [transition]

    //when the bytes are not one
    rule <readBack> readMap(RM:Map (varInstance(Bn, In)
                 |-> readBackHold(X:K, loadHold(T':K, LL:List), Unf:K, Fl:K)))
             => readMapAux(varInstance(Bn, In), readBackHold(X:K,
                loadHold(T':K, insertToOrderList(Other, V, LL)), Unf, Fl), RM) </readBack>
         <threadId> Tid </threadId>
         <memChannelId> CId:K </memChannelId>
         <channelId> CId </channelId>
         <memOpList> (ListItem(singleMem(Tid:Int, Bn:Int, In:Int,heap,
                        readAByte(T:K, Base:Int,
                  Other:Int, Size:Int, Ad:Int))) => .List) L:List </memOpList>
         <object>... <chunckRange> value(Left:Int, Right:Int) </chunckRange>
         <addrSpace> Ad:Int </addrSpace>
         <race> Races:Set (.Set => SetItem(
                   singleMem(Tid, Bn, In, heap, value(Base,
                 Base +Int Size)))) </race>
         <complete> CM:Map => CM[memId(Tid,Bn,In) <- 1] </complete>
            ...</object>
         <byteMap>... Base +Int Other |-> V:K ...</byteMap>
         requires Base +Int Size <=Int Right andBool Base >=Int Left
                 andBool notBool isOverlap(Base, Size, .K, Races)
                 andBool notBool memId(Tid, Bn, In) in keys(CM)
                 andBool Size =/=Int 1

    rule <readBack> readMap(RM:Map (varInstance(Bn, In)
                 |-> readBackHold(X:K, loadHold(T':K, LL:List),Unf:K, Fl:K)))
             => readMapAux(varInstance(Bn, In), readBackHold(X:K,
                loadHold(T':K, insertToOrderList(Other, V, LL)),Unf, Fl), RM) </readBack>
         <threadId> Tid </threadId>
         <memChannelId> CId:K </memChannelId>
         <channelId> CId </channelId>
         <memOpList> (ListItem(singleMem(Tid:Int, Bn:Int, In:Int,heap,
                        readAByte(T:K, Base:Int,
                  Other:Int, Size:Int, Ad:Int))) => .List) L:List </memOpList>
         <object>... <chunckRange> value(Left:Int, Right:Int) </chunckRange>
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
         requires Base +Int Size <=Int Right andBool Base >=Int Left
                 andBool notBool isOverlap(Base, Size, .K, Races)
                 andBool notBool memId(Tid, Bn, In) in keys(CM)
                 andBool Size =/=Int 1 andBool Ad =/=K Ad'

    rule <readBack> readMap(RM:Map (varInstance(Bn, In)
                 |-> readBackHold(X:K, loadHold(T':K, LL:List),Unf:K, Fl:K)))
             => readMapAux(varInstance(Bn, In), readBackHold(X:K,
                loadHold(T':K, insertToOrderList(Other, V, LL)),Unf:K, Fl), RM) </readBack>
         <threadId> Tid </threadId>
         <memChannelId> CId:K </memChannelId>
         <channelId> CId </channelId>
         <memOpList> (ListItem(singleMem(Tid:Int, Bn:Int, In:Int, heap,
                        readAByte(T:K, Base:Int,
                  Other:Int, Size:Int, Ad:Int))) => .List) L:List </memOpList>
         <object>... <chunckRange> value(Left:Int, Right:Int) </chunckRange>
         <addrSpace> Ad:Int </addrSpace>
         <complete>... memId(Tid, Bn, In)
                          |-> (Count:Int => Count +Int 1) ...</complete>
         <race> Races:Set </race>
            ...</object>
         <byteMap>... Base +Int Other |-> V:K ...</byteMap>
         requires Base +Int Size <=Int Right andBool Base >=Int Left
                 andBool Count +Int 1 <Int Size andBool Size =/=Int 1
                 andBool notBool isOverlap(Base, Size, .K, Races)

    rule <readBack> readMap(RM:Map (varInstance(Bn, In)
                 |-> readBackHold(X:K, loadHold(T':K, LL:List), Unf:K, Fl:K)))
             => readMapAux(varInstance(Bn, In), readBackHold(X:K,
                loadHold(T':K, insertToOrderList(Other, V, LL)), undef, Fl), RM) </readBack>
         <threadId> Tid </threadId>
         <memChannelId> CId:K </memChannelId>
         <channelId> CId </channelId>
         <memOpList> (ListItem(singleMem(Tid:Int, Bn:Int, In:Int, heap,
                        readAByte(T:K, Base:Int,
                  Other:Int, Size:Int, Ad:Int))) => .List) L:List </memOpList>
         <object>... <chunckRange> value(Left:Int, Right:Int) </chunckRange>
         <addrSpace> Ad:Int </addrSpace>
         <complete>... memId(Tid, Bn, In)
                          |-> (Count:Int => Count +Int 1) ...</complete>
         <race> Races:Set </race>
            ...</object>
         <byteMap>... Base +Int Other |-> V:K ...</byteMap>
         requires Base +Int Size <=Int Right andBool Base >=Int Left
                 andBool Count +Int 1 <Int Size andBool Size =/=Int 1
                 andBool isOverlap(Base, Size, .K, Races)

    rule <readBack> readMap(RM:Map (varInstance(Bn, In)
                 |-> readBackHold(X:K, loadHold(T':K, LL:List),Unf:K, Fl:K)))
             => readMapAux(varInstance(Bn, In), readBackHold(X:K,
                loadHold(T':K, insertToOrderList(Other, V, LL)),Unf, Fl), RM) </readBack>
         <threadId> Tid </threadId>
         <memChannelId> CId:K </memChannelId>
         <channelId> CId </channelId>
         <memOpList> (ListItem(singleMem(Tid:Int, Bn:Int, In:Int, heap,
                        readAByte(T:K, Base:Int,
                  Other:Int, Size:Int, Ad:Int))) => .List) L:List </memOpList>
         <object>... <chunckRange> value(Left:Int, Right:Int) </chunckRange>
         <addrSpace> Ad':Int </addrSpace>
         <complete>... memId(Tid, Bn, In)
                          |-> (Count:Int => Count +Int 1) ...</complete>
         <race> Races:Set </race> ...</object>
         <byteMap>... Base +Int Other |-> V:K ...</byteMap>
         <output>... .List =>
            ListItem("warning: input address space does not match with the address space of the memory.")
         </output>
         requires Base +Int Size <=Int Right andBool Base >=Int Left
                 andBool Count +Int 1 <Int Size
                 andBool Size =/=Int 1 andBool Ad =/=K Ad'
                 andBool notBool isOverlap(Base, Size, .K, Races)

    rule <readBack> readMap(RM:Map (varInstance(Bn, In)
                 |-> readBackHold(X:K, loadHold(T':K, LL:List),Unf:K, Fl:K)))
             => readMapAux(varInstance(Bn, In), readBackHold(X:K,
                loadHold(T':K, insertToOrderList(Other, V, LL)),undef, Fl), RM) </readBack>
         <threadId> Tid </threadId>
         <memChannelId> CId:K </memChannelId>
         <channelId> CId </channelId>
         <memOpList> (ListItem(singleMem(Tid:Int, Bn:Int, In:Int, heap,
                        readAByte(T:K, Base:Int,
                  Other:Int, Size:Int, Ad:Int))) => .List) L:List </memOpList>
         <object>... <chunckRange> value(Left:Int, Right:Int) </chunckRange>
         <addrSpace> Ad':Int </addrSpace>
         <complete>... memId(Tid, Bn, In)
                          |-> (Count:Int => Count +Int 1) ...</complete>
         <race> Races:Set </race> ...</object>
         <byteMap>... Base +Int Other |-> V:K ...</byteMap>
         <output>... .List =>
            ListItem("warning: input address space does not match with the address space of the memory.")
         </output>
         requires Base +Int Size <=Int Right andBool Base >=Int Left
                 andBool Count +Int 1 <Int Size
                 andBool Size =/=Int 1 andBool Ad =/=K Ad'
                 andBool isOverlap(Base, Size, .K, Races)

    //when finishing reading all bytes
    rule <readBack> readMap(RM:Map (varInstance(Bn, In)
                 |-> readBackHold(X:K, loadHold(T':K, LL:List),Unf:K, Fl:K)))
             => readMapAux(varInstance(Bn, In), readBackHold(X:K,
                loadHold(T':K, insertToOrderList(Other, V, LL)),Unf, Fl), RM) </readBack>
         <threadId> Tid </threadId>
         <memChannelId> CId:K </memChannelId>
         <channelId> CId </channelId>
         <memOpList> (ListItem(singleMem(Tid:Int, Bn:Int, In:Int,heap,
                        readAByte(T:K, Base:Int,
                  Other:Int, Size:Int, Ad:Int))) => .List) L:List </memOpList>
         <object>... <chunckRange> value(Left:Int, Right:Int) </chunckRange>
         <addrSpace> Ad:Int </addrSpace>
         <complete> (CM:Map (memId(Tid, Bn, In)
                          |-> Count:K)) => CM </complete>
         <race> Races:Set => removeRaceInSet(Races,.K, Tid, Bn, In) </race> ...</object>
         <byteMap>... Base +Int Other |-> V:K ...</byteMap>
         requires Base +Int Size <=Int Right andBool Base >=Int Left
                 andBool Count +Int 1 >=Int Size
                 andBool Size =/=Int 1
                 andBool notBool isOverlap(Base, Size, .K, Races)

    rule <readBack> readMap(RM:Map (varInstance(Bn, In)
                 |-> readBackHold(X:K, loadHold(T':K, LL:List),Unf:K, Fl:K)))
             => readMapAux(varInstance(Bn, In), readBackHold(X:K,
                loadHold(T':K, insertToOrderList(Other, V, LL)),undef, Fl), RM) </readBack>
         <threadId> Tid </threadId>
         <memChannelId> CId:K </memChannelId>
         <channelId> CId </channelId>
         <memOpList> (ListItem(singleMem(Tid:Int, Bn:Int, In:Int,heap,
                        readAByte(T:K, Base:Int,
                  Other:Int, Size:Int, Ad:Int))) => .List) L:List </memOpList>
         <object>... <chunckRange> value(Left:Int, Right:Int) </chunckRange>
         <addrSpace> Ad:Int </addrSpace>
         <complete> (CM:Map (memId(Tid, Bn, In)
                          |-> Count:K)) => CM </complete>
         <race> Races:Set => removeRaceInSet(Races,.K, Tid, Bn, In) </race> ...</object>
         <byteMap>... Base +Int Other |-> V:K ...</byteMap>
         requires Base +Int Size <=Int Right andBool Base >=Int Left
                 andBool Count +Int 1 >=Int Size
                 andBool Size =/=Int 1
                 andBool isOverlap(Base, Size, .K, Races)

    rule <readBack> readMap(RM:Map (varInstance(Bn, In)
                 |-> readBackHold(X:K, loadHold(T':K, LL:List),Unf:K, Fl:K)))
             => readMapAux(varInstance(Bn, In), readBackHold(X:K,
                loadHold(T':K, insertToOrderList(Other, V, LL)),Unf, Fl), RM) </readBack>
         <threadId> Tid </threadId>
         <memChannelId> CId:K </memChannelId>
         <channelId> CId </channelId>
         <memOpList> (ListItem(singleMem(Tid:Int, Bn:Int, In:Int,heap,
                        readAByte(T:K, Base:Int,
                  Other:Int, Size:Int, Ad:Int))) => .List) L:List </memOpList>
         <object>... <chunckRange> value(Left:Int, Right:Int) </chunckRange>
         <addrSpace> Ad':Int </addrSpace>
         <complete> CM:Map ((memId(Tid, Bn, In)
                          |-> Count:K) => .Map) </complete>
         <race> Races:Set => removeRaceInSet(Races,.K, Tid, Bn, In) </race> ...</object>
         <byteMap>... Base +Int Other |-> V:K ...</byteMap>
         <output>... .List =>
            ListItem("warning: input address space does not match with the address space of the memory.")
         </output>
         requires Base +Int Size <=Int Right andBool Base >=Int Left
                 andBool Count +Int 1 >=Int Size
                 andBool Size =/=Int 1 andBool Ad =/=K Ad'
                 andBool notBool isOverlap(Base, Size, .K, Races)

    rule <readBack> readMap(RM:Map (varInstance(Bn, In)
                 |-> readBackHold(X:K, loadHold(T':K, LL:List),Unf:K, Fl:K)))
             => readMapAux(varInstance(Bn, In), readBackHold(X:K,
                loadHold(T':K, insertToOrderList(Other, V, LL)),undef, Fl), RM) </readBack>
         <threadId> Tid </threadId>
         <memChannelId> CId:K </memChannelId>
         <channelId> CId </channelId>
         <memOpList> (ListItem(singleMem(Tid:Int, Bn:Int, In:Int,heap,
                        readAByte(T:K, Base:Int,
                  Other:Int, Size:Int, Ad:Int))) => .List) L:List </memOpList>
         <object>... <chunckRange> value(Left:Int, Right:Int) </chunckRange>
         <addrSpace> Ad':Int </addrSpace>
         <complete> CM:Map ((memId(Tid, Bn, In)
                          |-> Count:K) => .Map) </complete>
         <race> Races:Set => removeRaceInSet(Races,.K, Tid, Bn, In) </race> ...</object>
         <byteMap>... Base +Int Other |-> V:K ...</byteMap>
         <output>... .List =>
            ListItem("warning: input address space does not match with the address space of the memory.")
         </output>
         requires Base +Int Size <=Int Right andBool Base >=Int Left
                 andBool Count +Int 1 >=Int Size
                 andBool Size =/=Int 1 andBool Ad =/=K Ad'
                 andBool isOverlap(Base, Size, .K, Races)

    //atomic write in stack
    rule <stackOpList> (ListItem(singleMem(Tid:Int, Bn:Int, In:Int,stack,
                        atomicWrite(T:K, V:K, V1:K, Base:Int,
                  Size:Int, Ad:Int, Order:K))) => .List) L:List </stackOpList>
         <stackObject>...
           <stackThreadId> Tid </stackThreadId>
         <stackAddrSpace> Ad:Int </stackAddrSpace>
            <stackChunckRange> value(Left:Int, Right:Int) </stackChunckRange>
          <stackRange> constant </stackRange>
                ...</stackObject>
         <stackMap> BM:Map => updateMemWithAtomic(BM, Base, V) </stackMap>
         requires Base +Int Size <=Int Right andBool Base >=Int Left
              andBool notBool isChunckWritten(BM, Base, Base +Int Size)

    rule <threads> (<thread>...
         <threadId> TID </threadId>
         <stackOpList> ListItem(singleMem(TID:Int, Bn:Int, In:Int,stack,
                        atomicWrite(T:K, V:K, V1:K, Base:Int,
                  Size:Int, Ad:Int, Order:K))) L:List </stackOpList>
          <stackList> SL:List </stackList>
          <localMemory> LocalStack:Set </localMemory>
         ...</thread> TD:Bag) => .Bag </threads>
         <output>... .List => ListItem("non-atomic read error when trying to read from some places that are out of the memory bound.")
         </output>
         requires notBool isInStackRange(SL, Base, Size, LocalStack)

    rule <k> K:K => .K </k>
         (<tomasulo>
            D:Bag
         </tomasulo> =>  <tomasulo>...
                        <instQueue> instList(.List) </instQueue>
                          ...</tomasulo>)
          <stackOpList> (ListItem(singleMem(Tid:Int, Bn:Int, In:Int,stack,
                        atomicWrite(T:K, V:K, V1:K, Base:Int,
                  Size:Int, Ad:Int, Order:K))) L:List => .List) </stackOpList>
         <stackObject>...
           <stackThreadId> Tid </stackThreadId>
           <stackChunckRange> value(Left:Int, Right:Int) </stackChunckRange>
           <stackRange> constant </stackRange>
            ...</stackObject>
         <output>... .List =>
            ListItem("atomic write a byte in a statck constant field that has been initialized.")
         </output>
         <stackMap> BM:Map </stackMap>
         requires Base +Int Size <=Int Right andBool Base >=Int Left
                   andBool isChunckWritten(BM, Base, Base +Int Size)

    rule <stackOpList> (ListItem(singleMem(Tid:Int, Bn:Int, In:Int,stack,
                        atomicWrite(T:K, V:K, V1:K, Base:Int,
                  Size:Int, Ad:Int, Order:K))) => .List) L:List </stackOpList>
         <stackObject>...
           <stackThreadId> Tid </stackThreadId>
         <stackAddrSpace> Ad:Int </stackAddrSpace>
            <stackChunckRange> value(Left:Int, Right:Int) </stackChunckRange>
          <stackRange> stack </stackRange>
                ...</stackObject>
         <stackMap> BM:Map => updateMemWithAtomic(BM, Base, V) </stackMap>
         requires Base +Int Size <=Int Right andBool Base >=Int Left

    rule <stackOpList> (ListItem(singleMem(Tid:Int, Bn:Int, In:Int,stack,
                        atomicWrite(T:K, V:K, V1:K, Base:Int,
                  Size:Int, Ad:Int, Order:K))) => .List) L:List </stackOpList>
         <stackObject>...
           <stackThreadId> Tid </stackThreadId>
         <stackAddrSpace> Ad':Int </stackAddrSpace>
            <stackChunckRange> value(Left:Int, Right:Int) </stackChunckRange>
          <stackRange> constant </stackRange>
              ...</stackObject>
         <stackMap> BM:Map => updateMemWithAtomic(BM, Base, V) </stackMap>
         <output>... .List =>
            ListItem("warning: input address space does not match with the address space of the stack.")
         </output>
         requires Base +Int Size <=Int Right andBool Base >=Int Left
                  andBool Ad =/=K Ad'
                   andBool notBool isChunckWritten(BM, Base, Base +Int Size)

    rule <stackOpList> (ListItem(singleMem(Tid:Int, Bn:Int, In:Int,stack,
                        atomicWrite(T:K, V:K, V1:K, Base:Int,
                  Size:Int, Ad:Int, Order:K))) => .List) L:List </stackOpList>
         <stackObject>...
           <stackThreadId> Tid </stackThreadId>
         <stackAddrSpace> Ad':Int </stackAddrSpace>
            <stackChunckRange> value(Left:Int, Right:Int) </stackChunckRange>
          <stackRange> stack </stackRange>
              ...</stackObject>
         <stackMap> BM:Map => updateMemWithAtomic(BM, Base, V) </stackMap>
         <output>... .List =>
            ListItem("warning: input address space does not match with the address space of the stack.")
         </output>
         requires Base +Int Size <=Int Right andBool Base >=Int Left
                  andBool Ad =/=K Ad'

    //atomic readwrite in stack
    rule <readBack> readMap(RM:Map (varInstance(Bn, In)
                 |-> readBackHold(X:K, loadHold(T':K, .List),Unf:K, Fl:K)))
             => readMapAux(varInstance(Bn, In), readBackHold(X:K,
                loadHold(T':K, getMemWithAtomic(BM, Base, 0, Size)), Unf,
                      cmpxchgResult(1)), RM) </readBack>
         <stackOpList> (ListItem(singleMem(Tid:Int, Bn:Int, In:Int,stack,
                        atomicReadWrite(Type:K, Base:Int,
                  Size:Int, Ad:Int, Order:K, cmpxchgWait(T2:K, CV:K,
            V:K, loc(Base:Int, pointerTypeValue(Type, Ad':Int),
                      value(Left:Int, Right:Int), stack, none, InR:K)))))
              => ListItem(singleMem(Tid:Int, Bn:Int, In:Int,stack,
              atomicWrite(T2, splitBytes(V, T2), storeOperand(Tid, T2, V), Base,
              sizeof(T2), Ad', Order)))) L:List </stackOpList>
         <stackObject>...
           <stackRange> stack </stackRange>
           <stackThreadId> Tid </stackThreadId>
         <stackAddrSpace> Ad:Int </stackAddrSpace>
            <stackChunckRange> value(Left:Int, Right:Int) </stackChunckRange>
                     ...</stackObject>
         <stackMap> BM:Map </stackMap>
         requires Base +Int Size <=Int Right andBool Base >=Int Left
                 andBool sizeof(T') ==K size(getMemWithAtomic(BM, Base, 0, Size))
                 andBool applyIcmp(eq, T2,
                joinBytes(T',getMemWithAtomic(BM, Base, 0, Size)), CV) ==K 1

    rule <readBack> readMap(RM:Map (varInstance(Bn, In)
                 |-> readBackHold(X:K, loadHold(T':K, .List),Unf:K, Fl:K)))
             => readMapAux(varInstance(Bn, In), readBackHold(X:K,
                loadHold(T':K, getMemWithAtomic(BM, Base, 0, Size)),Unf,
                   cmpxchgResult(0)), RM) </readBack>
         <stackOpList> (ListItem(singleMem(Tid:Int, Bn:Int, In:Int,stack,
                        atomicReadWrite(Type:K, Base:Int,
                  Size:Int, Ad:Int, Order:K, cmpxchgWait(T2:K, CV:K,
            V:K, loc(Base:Int, pointerTypeValue(Type, Ad':Int),
                      value(Left:Int, Right:Int), stack, none, InR:K)))))
                       => .List) L:List </stackOpList>
         <stackObject>...
           <stackRange> stack </stackRange>
           <stackThreadId> Tid </stackThreadId>
         <stackAddrSpace> Ad:Int </stackAddrSpace>
            <stackChunckRange> value(Left:Int, Right:Int) </stackChunckRange>
              ...</stackObject>
         <stackMap> BM:Map </stackMap>
         requires Base +Int Size <=Int Right andBool Base >=Int Left
                 andBool sizeof(T') ==K size(getMemWithAtomic(BM, Base, 0, Size))
                 andBool applyIcmp(eq, T2,
                joinBytes(T',getMemWithAtomic(BM, Base, 0, Size)), CV) =/=K 1

    rule <readBack> readMap(RM:Map (varInstance(Bn, In)
                 |-> readBackHold(X:K, loadHold(T':K, .List),Unf:K, Fl:K)))
             => readMapAux(varInstance(Bn, In), readBackHold(X:K,
                loadHold(T':K, getMemWithAtomic(BM, Base, 0, Size)),Unf,
                  cmpxchgResult(1)), RM) </readBack>
         <stackOpList> (ListItem(singleMem(Tid:Int, Bn:Int, In:Int,stack,
                        atomicReadWrite(Type:K, Base:Int,
                  Size:Int, Ad:Int, Order:K, cmpxchgWait(T2:K, CV:K,
            V:K, loc(Base:Int, pointerTypeValue(Type, Ad':Int),
                      value(Left:Int, Right:Int), stack, none, InR:K)))))
              => ListItem(singleMem(Tid:Int, Bn:Int, In:Int,stack,
              atomicWrite(T2, splitBytes(V, T2)
             , storeOperand(Tid, T2, V), Base,
              sizeof(T2), Ad', Order)))) L:List </stackOpList>
         <stackObject>...
           <stackRange> stack </stackRange>
           <stackThreadId> Tid </stackThreadId>
         <stackAddrSpace> Ad1:Int </stackAddrSpace>
            <stackChunckRange> value(Left:Int, Right:Int) </stackChunckRange>
                     ...</stackObject>
         <stackMap> BM:Map </stackMap>
         <output>... .List =>
            ListItem("warning: input address space does not match with the address space of the stack.")
         </output>
         requires Base +Int Size <=Int Right andBool Base >=Int Left
                  andBool Ad =/=K Ad1
                 andBool sizeof(T') ==K size(getMemWithAtomic(BM, Base, 0, Size))
                 andBool applyIcmp(eq, T2,
                joinBytes(T',getMemWithAtomic(BM, Base, 0, Size)), CV) ==K 1

    rule <readBack> readMap(RM:Map (varInstance(Bn, In)
                 |-> readBackHold(X:K, loadHold(T':K, .List), Unf:K, Fl:K)))
             => readMapAux(varInstance(Bn, In), readBackHold(X:K,
                loadHold(T':K, getMemWithAtomic(BM, Base, 0, Size)),Unf,
                    cmpxchgResult(0)), RM) </readBack>
         <stackOpList> (ListItem(singleMem(Tid:Int, Bn:Int, In:Int,stack,
                        atomicReadWrite(Type:K, Base:Int,
                  Size:Int, Ad:Int, Order:K, cmpxchgWait(T2:K, CV:K,
            V:K, loc(Base:Int, pointerTypeValue(Type, Ad':Int),
                      value(Left:Int, Right:Int), stack, none, InR:K)))))
                       => .List) L:List </stackOpList>
         <stackObject>...
           <stackRange> stack </stackRange>
           <stackThreadId> Tid </stackThreadId>
         <stackAddrSpace> Ad1:Int </stackAddrSpace>
            <stackChunckRange> value(Left:Int, Right:Int) </stackChunckRange>
                 ...</stackObject>
         <stackMap> BM:Map </stackMap>
         <output>... .List =>
            ListItem("warning: input address space does not match with the address space of the stack.")
         </output>
         requires Base +Int Size <=Int Right andBool Base >=Int Left
                  andBool Ad =/=K Ad1
                 andBool sizeof(T') ==K size(getMemWithAtomic(BM, Base, 0, Size))
                 andBool applyIcmp(eq, T2,
                joinBytes(T',getMemWithAtomic(BM, Base, 0, Size)), CV) =/=K 1

    rule <readBack> readMap(RM:Map (varInstance(Bn, In)
                 |-> readBackHold(X:K, loadHold(T':K, .List), Unf:K, Fl:K)))
             => readMapAux(varInstance(Bn, In), readBackHold(X:K,
                loadHold(T':K, getMemWithAtomic(BM, Base, 0, Size)),Unf, Fl), RM) </readBack>
         <stackOpList> (ListItem(singleMem(Tid:Int, Bn:Int, In:Int,stack,
                        atomicReadWrite(Type:K, Base:Int,
                  Size:Int, Ad:Int, Order:K, atomicrmwWait(T2:K, Op:K,
            V:K, loc(Base:Int, pointerTypeValue(Type, Ad':Int),
                      value(Left:Int, Right:Int), stack, none, InR:K)))))
              => ListItem(singleMem(Tid:Int, Bn:Int, In:Int,stack,
              atomicWrite(T2, splitBytes(applyAtomicrmwInt(Op, T2,
                   joinBytes(T',getMemWithAtomic(BM, Base, 0, Size)), V), T2)
             , storeOperand(Tid, T2, applyAtomicrmwInt(Op, T2,
                   joinBytes(T',getMemWithAtomic(BM, Base, 0, Size)), V)), Base,
              sizeof(T2), Ad', Order)))) L:List </stackOpList>
         <stackObject>...
           <stackRange> stack </stackRange>
           <stackThreadId> Tid </stackThreadId>
         <stackAddrSpace> Ad:Int </stackAddrSpace>
            <stackChunckRange> value(Left:Int, Right:Int) </stackChunckRange>
                ...</stackObject>
         <stackMap> BM:Map </stackMap>
         requires Base +Int Size <=Int Right andBool Base >=Int Left
                 andBool sizeof(T') ==K size(getMemWithAtomic(BM, Base, 0, Size))

    rule <readBack> readMap(RM:Map (varInstance(Bn, In)
                 |-> readBackHold(X:K, loadHold(T':K, .List), Unf:K, Fl:K)))
             => readMapAux(varInstance(Bn, In), readBackHold(X:K,
                loadHold(T':K, getMemWithAtomic(BM, Base, 0, Size)),Unf:K, Fl), RM) </readBack>
         <stackOpList> (ListItem(singleMem(Tid:Int, Bn:Int, In:Int,stack,
                        atomicReadWrite(Type:K, Base:Int,
                  Size:Int, Ad:Int, Order:K, atomicrmwWait(T2:K, Op:K,
            V:K, loc(Base:Int, pointerTypeValue(Type, Ad':Int),
                      value(Left:Int, Right:Int), stack, none, InR:K)))))
              => ListItem(singleMem(Tid:Int, Bn:Int, In:Int,stack,
              atomicWrite(T2, splitBytes(applyAtomicrmwInt(Op, T2,
                   joinBytes(T',getMemWithAtomic(BM, Base, 0, Size)), V), T2)
             , storeOperand(Tid, T2, applyAtomicrmwInt(Op, T2,
                   joinBytes(T',getMemWithAtomic(BM, Base, 0, Size)), V)), Base,
              sizeof(T2), Ad', Order)))) L:List </stackOpList>
         <stackObject>...
           <stackRange> stack </stackRange>
           <stackThreadId> Tid </stackThreadId>
         <stackAddrSpace> Ad1:Int </stackAddrSpace>
            <stackChunckRange> value(Left:Int, Right:Int) </stackChunckRange>
                 ...</stackObject>
         <stackMap> BM:Map </stackMap>
         <output>... .List =>
            ListItem("warning: input address space does not match with the address space of the stack.")
         </output>
         requires Base +Int Size <=Int Right andBool Base >=Int Left
                  andBool Ad =/=K Ad1
                 andBool sizeof(T') ==K size(getMemWithAtomic(BM, Base, 0, Size))

    rule <k> A:K => .K </k>
         (<tomasulo>
            D:Bag
         </tomasulo> =>  <tomasulo>...
                        <instQueue> instList(.List) </instQueue>
                          ...</tomasulo>)
         <stackOpList> (ListItem(singleMem(Tid:Int, Bn:Int, In:Int,stack,
                        atomicReadWrite(T:K, Base:Int,
                  Size:Int, Ad:Int, Order:K, Next:K))) L:List => .List) </stackOpList>
         <stackObject>...
            <stackThreadId> Tid </stackThreadId>
            <stackChunckRange> value(Left:Int, Right:Int) </stackChunckRange>
         <stackRange> constant </stackRange> ...</stackObject>
        <output>... .List
            => ListItem("error: atomicrmw or cmpxchg op cannot work on constant stack location.") </output>
         requires Base +Int Size <=Int Right andBool Base >=Int Left

    rule <threads> (<thread>...
         <threadId> TID </threadId>
         <stackOpList> ListItem(singleMem(TID:Int, Bn:Int, In:Int,stack,
                        atomicReadWrite(T:K, Base:Int,
                  Size:Int, Ad:Int, Or:K, Next:K))) L:List </stackOpList>
          <stackList> SL:List </stackList>
          <localMemory> LocalStack:Set </localMemory>
         ...</thread> TD:Bag) => .Bag </threads>
         <output>... .List => ListItem("atomicrmw or cmpxchg op error when trying to read from some places that are out of the memory bound.")
         </output>
         requires notBool isInStackRange(SL, Base, Size, LocalStack)

    //atomic read in stack
    rule <readBack> readMap(RM:Map (varInstance(Bn, In)
                 |-> readBackHold(X:K, loadHold(T':K, .List),Unf:K, .K)))
             => readMapAux(varInstance(Bn, In), readBackHold(X:K,
                loadHold(T':K, getMemWithAtomic(BM, Base, 0, Size)),Unf, .K), RM) </readBack>
         <stackOpList> (ListItem(singleMem(Tid:Int, Bn:Int, In:Int,stack,
                        atomicRead(T:K, Base:Int,
                  Size:Int, Ad:Int, Order:K))) => .List) L:List </stackOpList>
         <stackObject>...
           <stackThreadId> Tid </stackThreadId>
         <stackAddrSpace> Ad:Int </stackAddrSpace>
            <stackChunckRange> value(Left:Int, Right:Int) </stackChunckRange>
                 ...</stackObject>
         <stackMap> BM:Map </stackMap>
         requires Base +Int Size <=Int Right andBool Base >=Int Left
                 andBool isChunckWritten(BM, Base, Base +Int Size)

    rule <readBack> readMap(RM:Map (varInstance(Bn, In)
                 |-> readBackHold(X:K, loadHold(T':K, .List),Unf:K, .K)))
             => readMapAux(varInstance(Bn, In), readBackHold(X:K,
                loadHold(T':K, getMemWithAtomic(BM, Base, 0, Size)),Unf, .K), RM) </readBack>
         <stackOpList> (ListItem(singleMem(Tid:Int, Bn:Int, In:Int,stack,
                        atomicRead(T:K, Base:Int,
                  Size:Int, Ad:Int, Order:K))) => .List) L:List </stackOpList>
         <stackObject>...
           <stackThreadId> Tid </stackThreadId>
         <stackAddrSpace> Ad':Int </stackAddrSpace>
            <stackChunckRange> value(Left:Int, Right:Int) </stackChunckRange>
                      ...</stackObject>
         <stackMap> BM:Map </stackMap>
         <output>... .List =>
            ListItem("warning: input address space does not match with the address space of the stack.")
         </output>
         requires Base +Int Size <=Int Right andBool Base >=Int Left
                  andBool Ad =/=K Ad'
                 andBool isChunckWritten(BM, Base, Base +Int Size)

    rule <k> A:K => .K </k>
         (<tomasulo>
            D:Bag
         </tomasulo> =>  <tomasulo>...
                        <instQueue> instList(.List) </instQueue>
                          ...</tomasulo>)
         <stackOpList> (ListItem(singleMem(Tid:Int, Bn:Int, In:Int,stack,
                        atomicRead(T:K, Base:Int,
                  Size:Int, Ad:Int, Order:K))) => .List) L:List </stackOpList>
         <stackObject>...
           <stackThreadId> Tid </stackThreadId>
            <stackChunckRange> value(Left:Int, Right:Int) </stackChunckRange>
                      ...</stackObject>
         <stackMap> BM:Map </stackMap>
        <output>... .List => ListItem("undefied behavior because atomic loading a stack that has not been initialized fully.") </output>
         requires Base +Int Size <=Int Right andBool Base >=Int Left
                 andBool notBool isChunckWritten(BM, Base, Base +Int Size)

    rule <threads> (<thread>...
         <threadId> TID </threadId>
         <stackOpList> ListItem(singleMem(TID:Int, Bn:Int, In:Int,stack,
                        atomicRead(T:K, Base:Int,
                  Size:Int, Ad:Int, Order:K))) L:List </stackOpList>
          <stackList> SL:List </stackList>
          <localMemory> LocalStack:Set </localMemory>
         ...</thread> TD:Bag) => .Bag </threads>
         <output>... .List =>
            ListItem("atomic read error when trying to read from some places that are out of the memory bound.")
         </output>
         requires notBool isInStackRange(SL, Base, Size, LocalStack)

    rule <threads> (TD:Bag
         <thread>...
         <stackOpList> (ListItem(singleMem(Tid:Int, Bn:Int, In:Int,stack,
                        memmoveRead(Base:Int,
                  Size:Int, Ad:Int, Order:K)))) L:List </stackOpList>
         <stackMap> BM:Map </stackMap>
         <threadId> Tid </threadId>
         ...</thread>) => .Bag
         </threads>
         <stackObject>...
           <stackThreadId> Tid </stackThreadId>
            <stackChunckRange> value(Left:Int, Right:Int) </stackChunckRange>
                      ...</stackObject>
        <output>... .List => ListItem("undefied behavior because atomic loading a stack that has not been initialized fully.") </output>
         requires Base +Int Size <=Int Right andBool Base >=Int Left
                 andBool notBool isChunckWritten(BM, Base, Base +Int Size)

    rule <k> staticLoadHold(T:K)
               => region(getMemWithAtomic(BM, Base, 0, Size), Size) ...</k>
         <threadId> TID </threadId>
         <currBlock> basicBlockNum(BN:Int, _:K) </currBlock>
         <stackOpList> (ListItem(singleMem(TID:Int, Bn:Int, In:Int,stack,
                        memmoveRead(Base:Int,
                  Size:Int, Ad:Int, Order:K))) => .List) L:List </stackOpList>
         <stackObject>...
           <stackThreadId> TID </stackThreadId>
         <stackAddrSpace> Ad:Int </stackAddrSpace>
            <stackChunckRange> value(Left:Int, Right:Int) </stackChunckRange>
                 ...</stackObject>
         <stackMap> BM:Map </stackMap>
         requires Base +Int Size <=Int Right andBool Base >=Int Left
                 andBool isChunckWritten(BM, Base, Base +Int Size)

    rule <k> staticLoadHold(T:K)
               => region(getMemWithAtomic(BM, Base, 0, Size), Size) ...</k>
         <threadId> TID </threadId>
         <currBlock> basicBlockNum(BN:Int, _:K) </currBlock>
         <stackOpList> (ListItem(singleMem(TID:Int, Bn:Int, In:Int,stack,
                        memmoveRead(Base:Int,
                  Size:Int, Ad:Int, Order:K))) => .List) L:List </stackOpList>
         <stackObject>...
           <stackThreadId> TID </stackThreadId>
         <stackAddrSpace> Ad':Int </stackAddrSpace>
            <stackChunckRange> value(Left:Int, Right:Int) </stackChunckRange>
                 ...</stackObject>
         <stackMap> BM:Map </stackMap>
         <output>... .List =>
            ListItem("warning: input address space does not match with the address space of the stack.")
         </output>
         requires Base +Int Size <=Int Right andBool Base >=Int Left
                 andBool isChunckWritten(BM, Base, Base +Int Size)
                  andBool Ad =/=K Ad'

    rule <threads> (<thread>...
         <threadId> TID </threadId>
         <stackOpList> ListItem(singleMem(TID:Int, Bn:Int, In:Int,stack,
                        memmoveRead(Base:Int,
                  Size:Int, Ad:Int, Order:K))) L:List </stackOpList>
          <stackList> SL:List </stackList>
          <localMemory> LocalStack:Set </localMemory>
         ...</thread> TD:Bag) => .Bag </threads>
         <output>... .List =>
            ListItem("memcpy/memmove error when trying to read from some places that are out of the memory bound.")
         </output>
         requires notBool isInStackRange(SL, Base, Size, LocalStack)

    //atomic write in heap
    rule <channelId> CId:Int </channelId>
         <memOpList> (ListItem(singleMem(Tid:Int, Bn:Int, In:Int,heap,
                        atomicWrite(T:K, V:K, V1:K, Base:Int,
                  Size:Int, Ad:Int, seq_cst)))
             => ListItem(singleMem(Tid:Int, Bn:Int, In:Int,heap,
                        msgWait(MsgN +Int 1)))) L:List </memOpList>
         <object>... <chunckRange> value(Left:Int, Right:Int) </chunckRange>
         <addrSpace> Ad:Int </addrSpace>
         <range> constant </range>
         <race> Races:Set </race> ...</object>
         <timeStamps> TM:Map (CId |-> (MsgN:Int => MsgN +Int 1)) </timeStamps>
         <channelOps> ChanOps:List (.List => ListItem(
               sendToAll(CId, 0, maxMemChannel, MsgN +Int 1,
                   TM (CId |-> MsgN +Int 1),
                 msgWrite(Tid,Bn,In, Base, Size, V, seq_cst)))) </channelOps>
         <ackMap> AckM:Map => AckM[MsgN +Int 1 <- 0] </ackMap>
         <byteMap> BM:Map => updateMemWithAtomic(BM, Base, V) </byteMap>
         requires Base +Int Size <=Int Right andBool Base >=Int Left
                 andBool notBool isOverlap(Base, Size, .K, Races)
                 andBool notBool isChunckWritten(BM, Base, Base +Int Size)

    rule <channelId> CId </channelId>
         <memOpList> (ListItem(singleMem(Tid:Int, Bn:Int, In:Int,heap,
                        atomicWrite(T:K, V:K, V1:K, Base:Int,
                  Size:Int, Ad:Int, Order:K))) => .List) L:List </memOpList>
         <object>... <chunckRange> value(Left:Int, Right:Int) </chunckRange>
         <addrSpace> Ad:Int </addrSpace>
         <range> constant </range>
         <race> Races:Set </race> ...</object>
         <timeStamps> TM:Map (CId |-> (MsgN:Int => MsgN +Int 1)) </timeStamps>
         <channelOps> ChanOps:List (.List => ListItem(
               sendToAll(CId, 0, maxMemChannel, MsgN +Int 1,
                   TM (CId |-> MsgN +Int 1),
                 msgWrite(Tid,Bn,In, Base, Size, V, Order)))) </channelOps>
         <ackMap> AckM:Map => AckM[MsgN +Int 1 <- 0] </ackMap>
         <byteMap> BM:Map => updateMemWithAtomic(BM, Base, V) </byteMap>
         requires Base +Int Size <=Int Right andBool Base >=Int Left
                 andBool notBool isOverlap(Base, Size, .K, Races)
                 andBool notBool isChunckWritten(BM, Base, Base +Int Size)
                 andBool Order =/=K seq_cst

    rule <channelId> CId </channelId>
         <memOpList> (ListItem(singleMem(Tid:Int, Bn:Int, In:Int,heap,
                        atomicWrite(T:K, V:K, V1:K, Base:Int,
                  Size:Int, Ad:Int, seq_cst)))
             => ListItem(singleMem(Tid:Int, Bn:Int, In:Int,heap,
                        msgWait(MsgN +Int 1)))) L:List </memOpList>
         <object>... <chunckRange> value(Left:Int, Right:Int) </chunckRange>
         <addrSpace> Ad:Int </addrSpace>
         <range> heap </range>
         <race> Races:Set </race> ...</object>
         <timeStamps> TM:Map (CId |-> (MsgN:Int => MsgN +Int 1)) </timeStamps>
         <channelOps> ChanOps:List (.List => ListItem(
               sendToAll(CId, 0, maxMemChannel, MsgN +Int 1,
                   TM (CId |-> MsgN +Int 1),
                 msgWrite(Tid,Bn,In, Base, Size, V, seq_cst)))) </channelOps>
         <ackMap> AckM:Map => AckM[MsgN +Int 1 <- 0] </ackMap>
         <byteMap> BM:Map => updateMemWithAtomic(BM, Base, V) </byteMap>
         requires Base +Int Size <=Int Right andBool Base >=Int Left
                 andBool notBool isOverlap(Base, Size, .K, Races)

    rule <channelId> CId </channelId>
         <memOpList> (ListItem(singleMem(Tid:Int, Bn:Int, In:Int,heap,
                        atomicWrite(T:K, V:K, V1:K, Base:Int,
                  Size:Int, Ad:Int, Order:K))) => .List) L:List </memOpList>
         <object>... <chunckRange> value(Left:Int, Right:Int) </chunckRange>
         <addrSpace> Ad:Int </addrSpace>
         <range> heap </range>
         <race> Races:Set </race> ...</object>
         <timeStamps> TM:Map (CId |-> (MsgN:Int => MsgN +Int 1)) </timeStamps>
         <channelOps> ChanOps:List (.List => ListItem(
               sendToAll(CId, 0, maxMemChannel, MsgN +Int 1,
                   TM (CId |-> MsgN +Int 1),
                 msgWrite(Tid,Bn,In, Base, Size, V, Order)))) </channelOps>
         <ackMap> AckM:Map => AckM[MsgN +Int 1 <- 0] </ackMap>
         <byteMap> BM:Map => updateMemWithAtomic(BM, Base, V) </byteMap>
         requires Base +Int Size <=Int Right andBool Base >=Int Left
                 andBool notBool isOverlap(Base, Size, .K, Races)
                 andBool Order =/=K seq_cst

    rule <threads> TD:Bag => .Bag </threads>
         <memOpList> ListItem(singleMem(Tid:Int, Bn:Int, In:Int,heap,
                        atomicWrite(T:K, V:K, V1:K, Base:Int,
                  Size:Int, Ad:Int, Or:K))) L:List => .List </memOpList>
         <object>... <chunckRange> value(Left:Int, Right:Int) </chunckRange>
         <race> Races:Set </race>
            ...</object>
         <output>... .List =>
            ListItem("atomic write error when trying to read from some places that are out of the memory bound.")
         </output>
        <memoryList> MOL:List </memoryList>
        requires notBool isInMemRange(MOL, Base, Size)

    rule <threads> Td:Bag => .Bag </threads>
         <memOpList> (ListItem(singleMem(Tid:Int, Bn:Int, In:Int,heap,
                        atomicWrite(T:K, V:K, V1:K, Base:Int,
                  Size:Int, Ad:Int, Order:K))) L:List => .List) </memOpList>
         <object>... <chunckRange> value(Left:Int, Right:Int) </chunckRange>
         <range> constant </range>
         <race> Races:Set </race> ...</object>
         <byteMap> BM:Map </byteMap>
         <output>... .List =>
            ListItem("atomic write a byte in a heap constant field that has been initialized.")
         </output>
         requires Base +Int Size <=Int Right andBool Base >=Int Left
                 andBool notBool isOverlap(Base, Size, .K, Races)
                 andBool isChunckWritten(BM, Base, Base +Int Size)
                 andBool Order =/=K seq_cst

    rule <channelId> CId </channelId>
         <memOpList> (ListItem(singleMem(Tid:Int, Bn:Int, In:Int,heap,
                        atomicWrite(T:K, V:K, V1:K, Base:Int,
                  Size:Int, Ad:Int, seq_cst)))
             => ListItem(singleMem(Tid:Int, Bn:Int, In:Int,heap,
                        msgWait(MsgN +Int 1)))) L:List </memOpList>
         <object>... <chunckRange> value(Left:Int, Right:Int) </chunckRange>
         <addrSpace> Ad':Int </addrSpace>
         <range> constant </range>
         <race> Races:Set </race> ...</object>
         <timeStamps> TM:Map (CId |-> (MsgN:Int => MsgN +Int 1)) </timeStamps>
         <channelOps> ChanOps:List (.List => ListItem(
               sendToAll(CId, 0, maxMemChannel, MsgN +Int 1,
                   TM (CId |-> MsgN +Int 1),
                 msgWrite(Tid,Bn,In, Base, Size, V, seq_cst)))) </channelOps>
         <ackMap> AckM:Map => AckM[MsgN +Int 1 <- 0] </ackMap>
         <byteMap> BM:Map => updateMemWithAtomic(BM, Base, V) </byteMap>
         <output>... .List =>
            ListItem("warning: input address space does not match with the address space of the memory.")
         </output>
         requires Base +Int Size <=Int Right andBool Base >=Int Left
                 andBool notBool isOverlap(Base, Size, .K, Races)
                 andBool Ad =/=K Ad'
                 andBool notBool isChunckWritten(BM, Base, Base +Int Size)

    rule <channelId> CId </channelId>
         <memOpList> (ListItem(singleMem(Tid:Int, Bn:Int, In:Int,heap,
                        atomicWrite(T:K, V:K, V1:K, Base:Int,
                  Size:Int, Ad:Int, Order:K))) => .List) L:List </memOpList>
         <object>... <chunckRange> value(Left:Int, Right:Int) </chunckRange>
         <addrSpace> Ad':Int </addrSpace>
         <range> constant </range>
         <race> Races:Set </race> ...</object>
         <timeStamps> TM:Map (CId |-> (MsgN:Int => MsgN +Int 1)) </timeStamps>
         <channelOps> ChanOps:List (.List => ListItem(
               sendToAll(CId, 0, maxMemChannel, MsgN +Int 1, TM (CId |-> MsgN +Int 1),
                 msgWrite(Tid,Bn,In, Base, Size, V, Order)))) </channelOps>
         <ackMap> AckM:Map => AckM[MsgN +Int 1 <- 0] </ackMap>
         <byteMap> BM:Map => updateMemWithAtomic(BM, Base, V) </byteMap>
         <output>... .List =>
            ListItem("warning: input address space does not match with the address space of the memory.")
         </output>
         requires Base +Int Size <=Int Right
                     andBool Base >=Int Left
                 andBool notBool isOverlap(Base, Size, .K, Races)
                 andBool Ad =/=K Ad'
                 andBool notBool isChunckWritten(BM, Base, Base +Int Size)
                 andBool Order =/=K seq_cst

    rule <channelId> CId </channelId>
         <memOpList> (ListItem(singleMem(Tid:Int, Bn:Int, In:Int,heap,
                        atomicWrite(T:K, V:K, V1:K, Base:Int,
                  Size:Int, Ad:Int, seq_cst)))
             => ListItem(singleMem(Tid:Int, Bn:Int, In:Int,heap,
                        msgWait(MsgN +Int 1)))) L:List </memOpList>
         <object>... <chunckRange> value(Left:Int, Right:Int) </chunckRange>
         <addrSpace> Ad':Int </addrSpace>
         <range> heap </range>
         <race> Races:Set </race> ...</object>
         <timeStamps> TM:Map (CId |-> (MsgN:Int => MsgN +Int 1)) </timeStamps>
         <channelOps> ChanOps:List (.List => ListItem(
               sendToAll(CId, 0, maxMemChannel, MsgN +Int 1,
                   TM (CId |-> MsgN +Int 1),
                 msgWrite(Tid,Bn,In, Base, Size, V, seq_cst)))) </channelOps>
         <ackMap> AckM:Map => AckM[MsgN +Int 1 <- 0] </ackMap>
         <byteMap> BM:Map => updateMemWithAtomic(BM, Base, V) </byteMap>
         <output>... .List =>
            ListItem("warning: input address space does not match with the address space of the memory.")
         </output>
         requires Base +Int Size <=Int Right andBool Base >=Int Left
                 andBool notBool isOverlap(Base, Size, .K, Races)
                 andBool Ad =/=K Ad'

    rule <channelId> CId </channelId>
         <memOpList> (ListItem(singleMem(Tid:Int, Bn:Int, In:Int,heap,
                        atomicWrite(T:K, V:K, V1:K, Base:Int,
                  Size:Int, Ad:Int, Order:K))) => .List) L:List </memOpList>
         <object>... <chunckRange> value(Left:Int, Right:Int) </chunckRange>
         <addrSpace> Ad':Int </addrSpace>
         <range> heap </range>
         <race> Races:Set </race> ...</object>
         <timeStamps> TM:Map (CId |-> (MsgN:Int => MsgN +Int 1)) </timeStamps>
         <channelOps> ChanOps:List (.List => ListItem(
               sendToAll(CId, 0, maxMemChannel, MsgN +Int 1, TM (CId |-> MsgN +Int 1),
                 msgWrite(Tid,Bn,In, Base, Size, V, Order)))) </channelOps>
         <ackMap> AckM:Map => AckM[MsgN +Int 1 <- 0] </ackMap>
         <byteMap> BM:Map => updateMemWithAtomic(BM, Base, V) </byteMap>
         <output>... .List =>
            ListItem("warning: input address space does not match with the address space of the memory.")
         </output>
         requires Base +Int Size <=Int Right andBool Base >=Int Left
                 andBool notBool isOverlap(Base, Size, .K, Races)
                 andBool Ad =/=K Ad'
                 andBool Order =/=K seq_cst

    rule <threads> Td:Bag => .Bag </threads>
         <memOpList> ListItem(singleMem(Tid:Int, Bn:Int, In:Int,heap,
                        atomicWrite(T:K,V:K, V1:K, Base:Int,
                  Size:Int, Ad:Int, Order:K))) L:List => .List </memOpList>
         <object>... <chunckRange> value(Left:Int, Right:Int) </chunckRange>
         <race> Races:Set </race>
            ...</object>
        <output>... .List => ListItem("error: undefied behavior because an atomic mem op happens at the middle of an non-atomic mem op.") </output>
         requires Base +Int Size <=Int Right andBool Base >=Int Left
                 andBool isOverlap(Base, Size, .K, Races)

    //atomic read write in heap
    rule <readBack> readMap(RM:Map (varInstance(Bn, In)
                 |-> readBackHold(X:K, loadHold(T':K, .List),Unf:K, Fl:K)))
             => readMapAux(varInstance(Bn, In), readBackHold(X:K,
                loadHold(T':K, getMemWithAtomic(BM, Base, 0, Size)),Unf,
                    cmpxchgResult(1)), RM) </readBack>
         <memChannelId> CId:K </memChannelId>
         <channelId> CId </channelId>
         <memOpList> (ListItem(singleMem(Tid:Int, Bn:Int, In:Int,heap,
                        atomicReadWrite(T:K, Base:Int,
                  Size:Int, Ad:Int, seq_cst, cmpxchgWait(T2:K, CV:K,
            V:K, loc(Base:Int, pointerTypeValue(Type, Ad':Int),
                      value(Left:Int, Right:Int),
                      heap, none, InR:K)))))
                 => ListItem(singleMem(Tid:Int, Bn:Int,
                          In:Int,heap,msgWait(MsgN +Int 1)))) L:List </memOpList>
         <object>... <chunckRange> value(Left:Int, Right:Int) </chunckRange>
         <addrSpace> Ad:Int </addrSpace>
         <range> heap </range>
         <race> Races:Set </race> ...</object>
         <timeStamps> TM:Map (CId |-> (MsgN:Int => MsgN +Int 1)) </timeStamps>
         <channelOps> ChanOps:List (.List => ListItem(
               sendToAll(CId, 0, maxMemChannel, MsgN +Int 1,
                   TM (CId |-> MsgN +Int 1),
                 msgWrite(Tid,Bn,In, Base, Size, region(
                getMemWithAtomic(BM, Base, 0, Size), T'), seq_cst)))) </channelOps>
         <ackMap> AckM:Map => AckM[MsgN +Int 1 <- 0] </ackMap>
         <byteMap> BM:Map => updateMemWithAtomic(BM, Base,
                           region(getMemWithAtomic(BM, Base, 0, Size), T')) </byteMap>
         requires Base +Int Size <=Int Right andBool Base >=Int Left
                 andBool notBool isOverlap(Base, Size, .K, Races)
                 andBool sizeof(T') ==K size(getMemWithAtomic(BM, Base, 0, Size))
                 andBool applyIcmp(eq, T2,
                joinBytes(T',getMemWithAtomic(BM, Base, 0, Size)), CV) ==K 1

    rule <readBack> readMap(RM:Map (varInstance(Bn, In)
                 |-> readBackHold(X:K, loadHold(T':K, .List),Unf:K, Fl:K)))
             => readMapAux(varInstance(Bn, In), readBackHold(X:K,
                loadHold(T':K, getMemWithAtomic(BM, Base, 0, Size)),Unf,
                    cmpxchgResult(1)), RM) </readBack>
         <memChannelId> CId:K </memChannelId>
         <channelId> CId </channelId>
         <memOpList> (ListItem(singleMem(Tid:Int, Bn:Int, In:Int,heap,
                        atomicReadWrite(T:K, Base:Int,
                  Size:Int, Ad:Int, Order:K, cmpxchgWait(T2:K, CV:K,
            V:K, loc(Base:Int, pointerTypeValue(Type, Ad':Int),
                      value(Left:Int, Right:Int),
                      heap, none, InR:K))))) => .List ) L:List </memOpList>
         <object>... <chunckRange> value(Left:Int, Right:Int) </chunckRange>
         <addrSpace> Ad:Int </addrSpace>
         <range> heap </range>
         <race> Races:Set </race> ...</object>
         <timeStamps> TM:Map (CId |-> (MsgN:Int => MsgN +Int 1)) </timeStamps>
         <channelOps> ChanOps:List (.List => ListItem(
               sendToAll(CId, 0, maxMemChannel, MsgN +Int 1,
                   TM (CId |-> MsgN +Int 1),
                 msgWrite(Tid,Bn,In, Base, Size, region(
                getMemWithAtomic(BM, Base, 0, Size), T'), Order)))) </channelOps>
         <ackMap> AckM:Map => AckM[MsgN +Int 1 <- 0] </ackMap>
         <byteMap> BM:Map => updateMemWithAtomic(BM, Base,
                           region(getMemWithAtomic(BM, Base, 0, Size), T')) </byteMap>
         requires Base +Int Size <=Int Right andBool Base >=Int Left
                 andBool notBool isOverlap(Base, Size, .K, Races)
                 andBool sizeof(T') ==K size(getMemWithAtomic(BM, Base, 0, Size))
                 andBool applyIcmp(eq, T2,
                joinBytes(T',getMemWithAtomic(BM, Base, 0, Size)), CV) ==K 1
                 andBool Order =/=K seq_cst

    rule <threads> Td:Bag => .Bag </threads>
         <memOpList> (ListItem(singleMem(Tid:Int, Bn:Int, In:Int,heap,
                        atomicReadWrite(T:K, Base:Int,
                  Size:Int, Ad:Int, Order:K, Next:K))) L:List => .List) </memOpList>
         <object>... <chunckRange> value(Left:Int, Right:Int) </chunckRange>
         <range> constant </range> ...</object>
        <output>... .List
            => ListItem("error: atomicrmw or cmpxchg op cannot work on constant heap location.") </output>
         requires Base +Int Size <=Int Right andBool Base >=Int Left

    rule <readBack> readMap(RM:Map (varInstance(Bn, In)
                 |-> readBackHold(X:K, loadHold(T':K, .List), Unf:K, Fl:K)))
             => readMapAux(varInstance(Bn, In), readBackHold(X:K,
                loadHold(T':K, getMemWithAtomic(BM, Base, 0, Size)),Unf,
                    cmpxchgResult(1)), RM) </readBack>
         <memOpList> (ListItem(singleMem(Tid:Int, Bn:Int, In:Int,heap,
                        atomicReadWrite(T:K, Base:Int,
                  Size:Int, Ad:Int, seq_cst, cmpxchgWait(T2:K, CV:K,
            V:K, loc(Base:Int, pointerTypeValue(Type, Ad':Int),
                      value(Left:Int, Right:Int),
                      heap, none, InR:K)))))
                 => ListItem(singleMem(Tid:Int, Bn:Int,
                          In:Int,heap,msgWait(MsgN +Int 1)))) L:List </memOpList>
         <object>... <chunckRange> value(Left:Int, Right:Int) </chunckRange>
         <range> heap </range>
         <addrSpace> Ad1:Int </addrSpace>
         <race> Races:Set </race> ...</object>
         <timeStamps> TM:Map (CId |-> (MsgN:Int => MsgN +Int 1)) </timeStamps>
         <channelOps> ChanOps:List (.List => ListItem(
               sendToAll(CId, 0, maxMemChannel, MsgN +Int 1,
                   TM (CId |-> MsgN +Int 1),
                 msgWrite(Tid,Bn,In, Base, Size, region(
                getMemWithAtomic(BM, Base, 0, Size), T'), seq_cst)))) </channelOps>
         <ackMap> AckM:Map => AckM[MsgN +Int 1 <- 0] </ackMap>
         <byteMap> BM:Map => updateMemWithAtomic(BM, Base,
                           region(getMemWithAtomic(BM, Base, 0, Size), T')) </byteMap>
         <output>... .List =>
            ListItem("warning: input address space does not match with the address space of the memory.")
         </output>
         requires Base +Int Size <=Int Right andBool Base >=Int Left
                 andBool Ad =/=K Ad1
                 andBool notBool isOverlap(Base, Size, .K, Races)
                 andBool sizeof(T') ==K size(getMemWithAtomic(BM, Base, 0, Size))
                 andBool applyIcmp(eq, T2,
                joinBytes(T',getMemWithAtomic(BM, Base, 0, Size)), CV) ==K 1

    rule <readBack> readMap(RM:Map (varInstance(Bn, In)
                 |-> readBackHold(X:K, loadHold(T':K, .List), Unf:K, Fl:K)))
             => readMapAux(varInstance(Bn, In), readBackHold(X:K,
                loadHold(T':K, getMemWithAtomic(BM, Base, 0, Size)),Unf,
                    cmpxchgResult(1)), RM) </readBack>
         <memOpList> (ListItem(singleMem(Tid:Int, Bn:Int, In:Int,heap,
                        atomicReadWrite(T:K, Base:Int,
                  Size:Int, Ad:Int, Order:K, cmpxchgWait(T2:K, CV:K,
            V:K, loc(Base:Int, pointerTypeValue(Type, Ad':Int),
                      value(Left:Int, Right:Int),
                      heap, none, InR:K))))) => .List) L:List </memOpList>
         <object>... <chunckRange> value(Left:Int, Right:Int) </chunckRange>
         <range> heap </range>
         <addrSpace> Ad1:Int </addrSpace>
         <race> Races:Set </race> ...</object>
         <timeStamps> TM:Map (CId |-> (MsgN:Int => MsgN +Int 1)) </timeStamps>
         <channelOps> ChanOps:List (.List => ListItem(
               sendToAll(CId, 0, maxMemChannel, MsgN +Int 1,
                   TM (CId |-> MsgN +Int 1),
                 msgWrite(Tid,Bn,In, Base, Size, region(
                getMemWithAtomic(BM, Base, 0, Size), T'), Order)))) </channelOps>
         <ackMap> AckM:Map => AckM[MsgN +Int 1 <- 0] </ackMap>
         <byteMap> BM:Map => updateMemWithAtomic(BM, Base,
                           region(getMemWithAtomic(BM, Base, 0, Size), T')) </byteMap>
         <output>... .List =>
            ListItem("warning: input address space does not match with the address space of the memory.")
         </output>
         requires Base +Int Size <=Int Right andBool Base >=Int Left
                 andBool Ad =/=K Ad1
                 andBool notBool isOverlap(Base, Size, .K, Races)
                 andBool sizeof(T') ==K size(getMemWithAtomic(BM, Base, 0, Size))
                 andBool applyIcmp(eq, T2,
                joinBytes(T',getMemWithAtomic(BM, Base, 0, Size)), CV) ==K 1
                 andBool Order =/=K seq_cst

    rule <readBack> readMap(RM:Map (varInstance(Bn, In)
                 |-> readBackHold(X:K, loadHold(T':K, .List),Unf:K, Fl:K)))
             => readMapAux(varInstance(Bn, In), readBackHold(X:K,
                loadHold(T':K, getMemWithAtomic(BM, Base, 0, Size)),Unf,
                        cmpxchgResult(0)), RM) </readBack>
         <memOpList> (ListItem(singleMem(Tid:Int, Bn:Int, In:Int,heap,
                        atomicReadWrite(T:K, Base:Int,
                  Size:Int, Ad:Int, Order:K, cmpxchgWait(T2:K, CV:K,
            V:K, loc(Base:Int, pointerTypeValue(Type, Ad':Int),
                      value(Left:Int, Right:Int),
                      heap, none, InR:K))))) => .List) L:List </memOpList>
         <object>... <chunckRange> value(Left:Int, Right:Int) </chunckRange>
         <range> heap </range>
         <addrSpace> Ad:Int </addrSpace>
         <race> Races:Set </race> ...</object>
         <byteMap> BM:Map </byteMap>
         requires Base +Int Size <=Int Right andBool Base >=Int Left
                 andBool notBool isOverlap(Base, Size, .K, Races)
                 andBool sizeof(T') ==K size(getMemWithAtomic(BM, Base, 0, Size))
                 andBool applyIcmp(eq, T2,
                joinBytes(T',getMemWithAtomic(BM, Base, 0, Size)), CV) =/=K 1
                 andBool Order =/=K seq_cst

    rule <readBack> readMap(RM:Map (varInstance(Bn, In)
                 |-> readBackHold(X:K, loadHold(T':K, .List), Unf:K, Fl:K)))
             => readMapAux(varInstance(Bn, In), readBackHold(X:K,
                loadHold(T':K, getMemWithAtomic(BM, Base, 0, Size)), Unf,
                        cmpxchgResult(0)), RM) </readBack>
         <memOpList> (ListItem(singleMem(Tid:Int, Bn:Int, In:Int,heap,
                        atomicReadWrite(T:K, Base:Int,
                  Size:Int, Ad:Int, Order:K, cmpxchgWait(T2:K, CV:K,
            V:K, loc(Base:Int, pointerTypeValue(Type, Ad':Int),
                      value(Left:Int, Right:Int),
                      heap, none, InR:K))))) => .List) L:List </memOpList>
         <object>... <chunckRange> value(Left:Int, Right:Int) </chunckRange>
         <range> heap </range>
         <addrSpace> Ad1:Int </addrSpace>
         <race> Races:Set </race> ...</object>
         <byteMap> BM:Map </byteMap>
         <output>... .List =>
            ListItem("warning: input address space does not match with the address space of the memory.")
         </output>
         requires Base +Int Size <=Int Right andBool Base >=Int Left
                 andBool Ad =/=K Ad1
                 andBool notBool isOverlap(Base, Size, .K, Races)
                 andBool sizeof(T') ==K size(getMemWithAtomic(BM, Base, 0, Size))
                 andBool applyIcmp(eq, T2,
                joinBytes(T',getMemWithAtomic(BM, Base, 0, Size)), CV) =/=K 1
                 andBool Order =/=K seq_cst

    rule <readBack> readMap(RM:Map (varInstance(Bn, In)
                 |-> readBackHold(X:K, loadHold(T':K, .List), Unf:K, Fl:K)))
             => readMapAux(varInstance(Bn, In), readBackHold(X:K,
                loadHold(T':K, getMemWithAtomic(BM, Base, 0, Size)), Unf, Fl), RM) </readBack>
         <memOpList> (ListItem(singleMem(Tid:Int, Bn:Int, In:Int,heap,
                        atomicReadWrite(T:K, Base:Int,
                  Size:Int, Ad:Int, seq_cst, atomicrmwWait(T2:K, Op:K,
            V:K, loc(Base:Int, pointerTypeValue(Type, Ad':Int),
                      value(Left:Int, Right:Int), heap, none, InR:K)))))
                => ListItem(singleMem(Tid:Int, Bn:Int,
                          In:Int,heap,msgWait(MsgN +Int 1)))) L:List </memOpList>
         <object>... <chunckRange> value(Left:Int, Right:Int) </chunckRange>
         <range> heap </range>
         <addrSpace> Ad:Int </addrSpace>
         <race> Races:Set </race> ...</object>
         <timeStamps> TM:Map (CId |-> (MsgN:Int => MsgN +Int 1)) </timeStamps>
         <channelOps> ChanOps:List (.List => ListItem(
               sendToAll(CId, 0, maxMemChannel, MsgN +Int 1,
                   TM (CId |-> MsgN +Int 1),
                 msgWrite(Tid,Bn,In, Base, Size, region(applyAtomicrmwInt(Op, T2,
                   joinBytes(T',getMemWithAtomic(
                              BM, Base, 0, Size)), V), T2), seq_cst)))) </channelOps>
         <ackMap> AckM:Map => AckM[MsgN +Int 1 <- 0] </ackMap>
         <byteMap> BM:Map => updateMemWithAtomic(BM, Base,
                           region(applyAtomicrmwInt(Op, T2,
                   joinBytes(T',getMemWithAtomic(BM, Base, 0, Size)), V), T2)) </byteMap>
         requires Base +Int Size <=Int Right andBool Base >=Int Left
                 andBool notBool isOverlap(Base, Size, .K, Races)
                 andBool sizeof(T') ==K size(getMemWithAtomic(BM, Base, 0, Size))

    rule <readBack> readMap(RM:Map (varInstance(Bn, In)
                 |-> readBackHold(X:K, loadHold(T':K, .List), Unf:K, Fl:K)))
             => readMapAux(varInstance(Bn, In), readBackHold(X:K,
                loadHold(T':K, getMemWithAtomic(BM, Base, 0, Size)), Unf, Fl), RM) </readBack>
         <memOpList> (ListItem(singleMem(Tid:Int, Bn:Int, In:Int,heap,
                        atomicReadWrite(T:K, Base:Int,
                  Size:Int, Ad:Int, Order:K, atomicrmwWait(T2:K, Op:K,
            V:K, loc(Base:Int, pointerTypeValue(Type, Ad':Int),
                      value(Left:Int, Right:Int), heap, none, InR:K)))))
                => .List) L:List </memOpList>
         <object>... <chunckRange> value(Left:Int, Right:Int) </chunckRange>
         <range> heap </range>
         <addrSpace> Ad:Int </addrSpace>
         <race> Races:Set </race> ...</object>
         <timeStamps> TM:Map (CId |-> (MsgN:Int => MsgN +Int 1)) </timeStamps>
         <channelOps> ChanOps:List (.List => ListItem(
               sendToAll(CId, 0, maxMemChannel, MsgN +Int 1,
                   TM (CId |-> MsgN +Int 1),
                 msgWrite(Tid,Bn,In, Base, Size, region(applyAtomicrmwInt(Op, T2,
                   joinBytes(T',getMemWithAtomic(
                              BM, Base, 0, Size)), V), T2), Order)))) </channelOps>
         <ackMap> AckM:Map => AckM[MsgN +Int 1 <- 0] </ackMap>
         <byteMap> BM:Map => updateMemWithAtomic(BM, Base,
                           region(applyAtomicrmwInt(Op, T2,
                   joinBytes(T',getMemWithAtomic(BM, Base, 0, Size)), V), T2)) </byteMap>
         requires Base +Int Size <=Int Right andBool Base >=Int Left
                 andBool notBool isOverlap(Base, Size, .K, Races)
                 andBool sizeof(T') ==K size(getMemWithAtomic(BM, Base, 0, Size))
                 andBool Order =/=K seq_cst

    rule <readBack> readMap(RM:Map (varInstance(Bn, In)
                 |-> readBackHold(X:K, loadHold(T':K, .List), Unf:K, Fl:K)))
             => readMapAux(varInstance(Bn, In), readBackHold(X:K,
                loadHold(T':K, getMemWithAtomic(BM, Base, 0, Size)), Unf, Fl), RM) </readBack>
         <memOpList> (ListItem(singleMem(Tid:Int, Bn:Int, In:Int,heap,
                        atomicReadWrite(T:K, Base:Int,
                  Size:Int, Ad:Int, seq_cst, atomicrmwWait(T2:K, Op:K,
            V:K, loc(Base:Int, pointerTypeValue(Type, Ad':Int),
                      value(Left:Int, Right:Int),
                      heap, none, InR:K)))))
                => ListItem(singleMem(Tid:Int, Bn:Int,
                          In:Int,heap,msgWait(MsgN +Int 1)))) L:List </memOpList>
         <object>... <chunckRange> value(Left:Int, Right:Int) </chunckRange>
         <range> heap </range>
         <addrSpace> Ad1:Int </addrSpace>
         <race> Races:Set </race> ...</object>
         <timeStamps> TM:Map (CId |-> (MsgN:Int => MsgN +Int 1)) </timeStamps>
         <channelOps> ChanOps:List (.List => ListItem(
               sendToAll(CId, 0, maxMemChannel, MsgN +Int 1,
                   TM (CId |-> MsgN +Int 1),
                 msgWrite(Tid,Bn,In, Base, Size, region(applyAtomicrmwInt(Op, T2,
                   joinBytes(T',getMemWithAtomic(
                              BM, Base, 0, Size)), V), T2), seq_cst)))) </channelOps>
         <ackMap> AckM:Map => AckM[MsgN +Int 1 <- 0] </ackMap>
         <byteMap> BM:Map => updateMemWithAtomic(BM, Base,
                           region(applyAtomicrmwInt(Op, T2,
                   joinBytes(T',getMemWithAtomic(BM, Base, 0, Size)), V), T2)) </byteMap>
         <output>... .List =>
            ListItem("warning: input address space does not match with the address space of the memory.")
         </output>
         requires Base +Int Size <=Int Right andBool Base >=Int Left
                 andBool notBool isOverlap(Base, Size, .K, Races)
                 andBool sizeof(T') ==K size(getMemWithAtomic(BM, Base, 0, Size))
                 andBool Ad =/=K Ad1

    rule <readBack> readMap(RM:Map (varInstance(Bn, In)
                 |-> readBackHold(X:K, loadHold(T':K, .List), Unf:K, Fl:K)))
             => readMapAux(varInstance(Bn, In), readBackHold(X:K,
                loadHold(T':K, getMemWithAtomic(BM, Base, 0, Size)), Unf, Fl), RM) </readBack>
         <memOpList> (ListItem(singleMem(Tid:Int, Bn:Int, In:Int,heap,
                        atomicReadWrite(T:K, Base:Int,
                  Size:Int, Ad:Int, Order:K, atomicrmwWait(T2:K, Op:K,
            V:K, loc(Base:Int, pointerTypeValue(Type, Ad':Int),
                      value(Left:Int, Right:Int),
                      heap, none, InR:K)))))
                => .List) L:List </memOpList>
         <object>... <chunckRange> value(Left:Int, Right:Int) </chunckRange>
         <range> heap </range>
         <addrSpace> Ad1:Int </addrSpace>
         <race> Races:Set </race> ...</object>
         <timeStamps> TM:Map (CId |-> (MsgN:Int => MsgN +Int 1)) </timeStamps>
         <channelOps> ChanOps:List (.List => ListItem(
               sendToAll(CId, 0, maxMemChannel, MsgN +Int 1,
                   TM (CId |-> MsgN +Int 1),
                 msgWrite(Tid,Bn,In, Base, Size, region(applyAtomicrmwInt(Op, T2,
                   joinBytes(T',getMemWithAtomic(
                              BM, Base, 0, Size)), V), T2), Order)))) </channelOps>
         <ackMap> AckM:Map => AckM[MsgN +Int 1 <- 0] </ackMap>
         <byteMap> BM:Map => updateMemWithAtomic(BM, Base,
                           region(applyAtomicrmwInt(Op, T2,
                   joinBytes(T',getMemWithAtomic(BM, Base, 0, Size)), V), T2)) </byteMap>
         <output>... .List =>
            ListItem("warning: input address space does not match with the address space of the memory.")
         </output>
         requires Base +Int Size <=Int Right andBool Base >=Int Left
                 andBool notBool isOverlap(Base, Size, .K, Races)
                 andBool sizeof(T') ==K size(getMemWithAtomic(BM, Base, 0, Size))
                 andBool Ad =/=K Ad1
                 andBool Order =/=K seq_cst

    rule <k> A:K => .K </k>
         (<tomasulo>
            D:Bag
         </tomasulo> =>  <tomasulo>...
                        <instQueue> instList(.List) </instQueue>
                          ...</tomasulo>)
         <memOpList> ListItem(singleMem(Tid:Int, Bn:Int, In:Int,heap,
                        atomicReadWrite(T:K, Base:Int,
                  Size:Int, Ad:Int, Order:K, Next:K))) L:List => .List </memOpList>
         <object>... <chunckRange> value(Left:Int, Right:Int) </chunckRange>
         <race> Races:Set </race>
         <range> heap </range>
            ...</object>
        <output>... .List => ListItem("error: undefied behavior because an atomic mem op happens at the middle of an non-atomic mem op -- race condition.") </output>
         requires Base +Int Size <=Int Right andBool Base >=Int Left
                 andBool isOverlap(Base, Size, .K, Races)

    //atomic read in heap
    rule <readBack> readMap(RM:Map (varInstance(Bn, In)
                 |-> readBackHold(X:K, loadHold(T':K, .List), Unf:K, .K)))
             => readMapAux(varInstance(Bn, In), readBackHold(X:K,
                loadHold(T':K, getMemWithAtomic(BM, Base, 0, Size)),Unf,.K), RM) </readBack>
         <memChannelId> CId:K </memChannelId>
         <channelId> CId </channelId>
         <memOpList> (ListItem(singleMem(Tid:Int, Bn:Int, In:Int,heap,
                        atomicRead(T:K, Base:Int,
                  Size:Int, Ad:Int, seq_cst)))
                   => ListItem(singleMem(Tid:Int, Bn:Int, In:Int,heap,
                        msgWait(MsgN +Int 1)))) L:List </memOpList>
         <object>... <chunckRange> value(Left:Int, Right:Int) </chunckRange>
         <addrSpace> Ad:Int </addrSpace>
         <race> Races:Set </race> ...</object>
         <timeStamps> TM:Map (CId |-> (MsgN:Int => MsgN +Int 1)) </timeStamps>
         <channelOps> ChanOps:List (.List => ListItem(
               sendToAll(CId, 0, maxMemChannel, MsgN +Int 1,
                   TM (CId |-> MsgN +Int 1), msgSeqFence))) </channelOps>
         <ackMap> AckM:Map => AckM[MsgN +Int 1 <- 0] </ackMap>
         <byteMap> BM:Map </byteMap>
         requires Base +Int Size <=Int Right andBool Base >=Int Left
                 andBool notBool isOverlap(Base, Size, .K, Races)
                 andBool isChunckWritten(BM, Base, Base +Int Size)

    rule <readBack> readMap(RM:Map (varInstance(Bn, In)
                 |-> readBackHold(X:K, loadHold(T':K, .List), Unf:K, .K)))
             => readMapAux(varInstance(Bn, In), readBackHold(X:K,
                loadHold(T':K, getMemWithAtomic(BM, Base, 0, Size)),Unf,.K), RM) </readBack>
         <memChannelId> CId:K </memChannelId>
         <channelId> CId </channelId>
         <memOpList> (ListItem(singleMem(Tid:Int, Bn:Int, In:Int,heap,
                        atomicRead(T:K, Base:Int,
                  Size:Int, Ad:Int, Order:K))) => .List) L:List </memOpList>
         <object>... <chunckRange> value(Left:Int, Right:Int) </chunckRange>
         <addrSpace> Ad:Int </addrSpace>
         <race> Races:Set </race> ...</object>
         <byteMap> BM:Map </byteMap>
         requires Base +Int Size <=Int Right andBool Base >=Int Left
                 andBool notBool isOverlap(Base, Size, .K, Races)
                 andBool isChunckWritten(BM, Base, Base +Int Size)
                 andBool Order =/=K seq_cst

    rule <readBack> readMap(RM:Map (varInstance(Bn, In)
                 |-> readBackHold(X:K, loadHold(T':K, .List), Unf:K, .K)))
             => readMapAux(varInstance(Bn, In), readBackHold(X:K,
                loadHold(T':K, getMemWithAtomic(BM, Base, 0, Size)), Unf, .K), RM) </readBack>
         <memChannelId> CId:K </memChannelId>
         <channelId> CId </channelId>
         <memOpList> (ListItem(singleMem(Tid:Int, Bn:Int, In:Int,heap,
                        atomicRead(T:K, Base:Int,
                  Size:Int, Ad:Int, seq_cst))) 
                   => ListItem(singleMem(Tid:Int, Bn:Int, In:Int,heap,
                        msgWait(MsgN +Int 1)))) L:List </memOpList>
         <object>... <chunckRange> value(Left:Int, Right:Int) </chunckRange>
         <addrSpace> Ad':Int </addrSpace>
         <race> Races:Set </race> ...</object>
         <timeStamps> TM:Map (CId |-> (MsgN:Int => MsgN +Int 1)) </timeStamps>
         <channelOps> ChanOps:List (.List => ListItem(
               sendToAll(CId, 0, maxMemChannel, MsgN +Int 1,
                   TM (CId |-> MsgN +Int 1), msgSeqFence))) </channelOps>
         <ackMap> AckM:Map => AckM[MsgN +Int 1 <- 0] </ackMap>
         <byteMap> BM:Map </byteMap>
         <output>... .List =>
            ListItem("warning: input address space does not match with the address space of the memory.")
         </output>
         requires Base +Int Size <=Int Right andBool Base >=Int Left
                 andBool notBool isOverlap(Base, Size, .K, Races)
                 andBool Ad =/=K Ad'
                 andBool isChunckWritten(BM, Base, Base +Int Size)

    rule <readBack> readMap(RM:Map (varInstance(Bn, In)
                 |-> readBackHold(X:K, loadHold(T':K, .List), Unf:K, .K)))
             => readMapAux(varInstance(Bn, In), readBackHold(X:K,
                loadHold(T':K, getMemWithAtomic(BM, Base, 0, Size)), Unf, .K), RM) </readBack>
         <memChannelId> CId:K </memChannelId>
         <channelId> CId </channelId>
         <memOpList> (ListItem(singleMem(Tid:Int, Bn:Int, In:Int,heap,
                        atomicRead(T:K, Base:Int,
                  Size:Int, Ad:Int, Order:K))) => .List) L:List </memOpList>
         <object>... <chunckRange> value(Left:Int, Right:Int) </chunckRange>
         <addrSpace> Ad':Int </addrSpace>
         <race> Races:Set </race> ...</object>
         <byteMap> BM:Map </byteMap>
         <output>... .List =>
            ListItem("warning: input address space does not match with the address space of the memory.")
         </output>
         requires Base +Int Size <=Int Right andBool Base >=Int Left
                 andBool notBool isOverlap(Base, Size, .K, Races)
                 andBool Ad =/=K Ad'
                 andBool isChunckWritten(BM, Base, Base +Int Size)
                 andBool Order =/=K seq_cst

    rule <threads> TD:Bag => .Bag </threads>
         <memOpList> (ListItem(singleMem(Tid:Int, Bn:Int, In:Int,heap,
                        atomicRead(T:K, Base:Int,
                  Size:Int, Ad:Int, Order:K))) => .List) L:List </memOpList>
         <object>... <chunckRange> value(Left:Int, Right:Int) </chunckRange>
         <race> Races:Set </race> ...</object>
         <byteMap> BM:Map </byteMap>
        <output>... .List => ListItem("undefied behavior because atomic loading a heap that has not been initialized fully.") </output>
         requires Base +Int Size <=Int Right andBool Base >=Int Left
                 andBool notBool isOverlap(Base, Size, .K, Races)
                 andBool notBool isChunckWritten(BM, Base, Base +Int Size)

    rule <threads> TD:Bag => .Bag </threads>
         <memOpList> ListItem(singleMem(Tid:Int, Bn:Int, In:Int,heap,
                        atomicRead(T:K, Base:Int,
                  Size:Int, Ad:Int, Order:K))) L:List => .List </memOpList>
         <object>... <chunckRange> value(Left:Int, Right:Int) </chunckRange>
         <race> Races:Set </race>
            ...</object>
        <output>... .List => ListItem("error: undefied behavior because an atomic mem op happens at the middle of an non-atomic mem op -- race condition.") </output>
         requires Base +Int Size <=Int Right andBool Base >=Int Left
                 andBool isOverlap(Base, Size, .K, Races)

    rule <threads> TD:Bag => .Bag </threads>
         <memOpList> ListItem(singleMem(Tid:Int, Bn:Int, In:Int,heap,
                        atomicRead(T:K, Base:Int,
                  Size:Int, Ad:Int, Order:K))) L:List => .List </memOpList>
         <object>... <chunckRange> value(Left:Int, Right:Int) </chunckRange>
         <race> Races:Set </race>
            ...</object>
         <output>... .List =>
            ListItem("atomic read error when trying to read from some places that are out of the memory bound.")
         </output>
        <memoryList> MOL:List </memoryList>
        requires notBool isInMemRange(MOL, Base, Size)

    rule <threads> TD:Bag => .Bag </threads>
         <memOpList> ListItem(singleMem(Tid:Int, Bn:Int, In:Int,heap,
                        memmoveRead(Base:Int,
                  Size:Int, Ad:Int, Order:K))) L:List => .List </memOpList>
         <object>... <chunckRange> value(Left:Int, Right:Int) </chunckRange>
         <race> Races:Set </race>
            ...</object>
         <output>... .List =>
            ListItem("memcpy/memmove error when trying to read from some places that are out of the memory bound.")
         </output>
        <memoryList> MOL:List </memoryList>
        requires notBool isInMemRange(MOL, Base, Size)

    rule <threads> TD:Bag => .Bag </threads>
         <memOpList> ListItem(singleMem(Tid:Int, Bn:Int, In:Int,heap,
                        memmoveRead(Base:Int,
                  Size:Int, Ad:Int, Order:K))) L:List => .List </memOpList>
         <object>... <chunckRange> value(Left:Int, Right:Int) </chunckRange>
         <race> Races:Set </race>
            ...</object>
         <byteMap> BM:Map </byteMap>
        <output>... .List => ListItem("undefied behavior because atomic loading a heap that has not been initialized fully.") </output>
         requires Base +Int Size <=Int Right andBool Base >=Int Left
                 andBool notBool isChunckWritten(BM, Base, Base +Int Size)

    rule <threads> TD:Bag => .Bag </threads>
         <memOpList> ListItem(singleMem(Tid:Int, Bn:Int, In:Int,heap,
                        memmoveRead(Base:Int,
                  Size:Int, Ad:Int, Order:K))) L:List => .List </memOpList>
         <object>... <chunckRange> value(Left:Int, Right:Int) </chunckRange>
         <race> Races:Set </race>
            ...</object>
        <output>... .List => ListItem("error: undefied behavior because an atomic mem op happens at the middle of an non-atomic mem op -- race condition.") </output>
         requires Base +Int Size <=Int Right andBool Base >=Int Left
                 andBool isOverlap(Base, Size, .K, Races)

    rule <k> staticLoadHold(T:K)
               => region(getMemWithAtomic(BM, Base, 0, Size), Size) ...</k>
         <threadId> TID </threadId>
         <currBlock> basicBlockNum(BN:Int, _:K) </currBlock>
         <memChannelId> CId:K </memChannelId>
         <channelId> CId </channelId>
         <memOpList> (ListItem(singleMem(TID:Int, Bn:Int, In:Int,heap,
                        memmoveRead(Base:Int,
                  Size:Int, Ad:Int, Order:K))) => .List) L:List </memOpList>
         <object>... <chunckRange> value(Left:Int, Right:Int) </chunckRange>
         <addrSpace> Ad:Int </addrSpace>
         <race> Races:Set </race> ...</object>
         <byteMap> BM:Map </byteMap>
         requires Base +Int Size <=Int Right andBool Base >=Int Left
                 andBool isChunckWritten(BM, Base, Base +Int Size)
                 andBool notBool isOverlap(Base, Size, .K, Races)

    rule <k> staticLoadHold(T:K)
               => region(getMemWithAtomic(BM, Base, 0, Size), Size) ...</k>
         <threadId> TID </threadId>
         <currBlock> basicBlockNum(BN:Int, _:K) </currBlock>
         <memChannelId> CId:K </memChannelId>
         <channelId> CId </channelId>
         <memOpList> (ListItem(singleMem(TID:Int, Bn:Int, In:Int,heap,
                        memmoveRead(Base:Int,
                  Size:Int, Ad:Int, Order:K))) => .List) L:List </memOpList>
         <object>... <chunckRange> value(Left:Int, Right:Int) </chunckRange>
         <addrSpace> Ad':Int </addrSpace>
         <race> Races:Set </race> ...</object>
         <byteMap> BM:Map </byteMap>
         <output>... .List =>
            ListItem("warning: input address space does not match with the address space of the stack.")
         </output>
         requires Base +Int Size <=Int Right andBool Base >=Int Left
                 andBool isChunckWritten(BM, Base, Base +Int Size)
                 andBool notBool isOverlap(Base, Size, .K, Races)
                  andBool Ad =/=K Ad'

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

    rule fCmp(Op:K, T:KResult, V1:KResult, V2:KResult)
                        => applyFcmps(Op, T, V1, V2)

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
    rule theFPTrunc(Ty1:KResult, F:KResult, Ty2:KResult)
         => theFPTruncAux(applyFloatCasts(fptrunc, Ty1, F, Ty2, .List))

    rule theFPTruncAux(A:K) => A
         requires A =/=K badValue

    rule <k> theFPTruncAux(badValue) ~> K:K => .K </k>
         (<tomasulo>
            D:Bag
         </tomasulo> =>  <tomasulo>...
                        <instQueue> instList(.List) </instQueue>
                          ...</tomasulo>)
        <output>... .List => ListItem("error: it undefined behavior when fptrunc op applied on a value which is either not exact float that can be trunced or it is overflow when truncing.") </output>

    rule theFPExt(Ty1:KResult, F:KResult, Ty2:KResult)
         => applyFloatCasts(fpext, Ty1, F, Ty2, .List)

    rule theFpToSI(Type:KResult, F:KResult, Type2:KResult)
            => theFpToSIAux(applyFloatInts(fptosi, Type, F, Type2, .List))

    rule <k> theFpToSIAux(badValue) ~> K:K => .K </k>
         (<tomasulo>
            D:Bag
         </tomasulo> =>  <tomasulo>...
                        <instQueue> instList(.List) </instQueue>
                          ...</tomasulo>)
        <output>... .List => ListItem("error: the value in the fptosi op cannot fit in the size of the user defined int type.") </output>

    rule theFpToSIAux(A:K) => A
         requires A =/=K badValue

    rule theFpToUI(Type:KResult, F:KResult, Type2:KResult)
            => theFpToUIAux(applyFloatInts(fptoui, Type, F, Type2, .List))

    rule <k> theFpToUIAux(badValue) ~> K:K => .K </k>
         (<tomasulo>
            D:Bag
         </tomasulo> =>  <tomasulo>...
                        <instQueue> instList(.List) </instQueue>
                          ...</tomasulo>)
        <output>... .List => ListItem("error: the value in the fptoui op cannot fit in the size of the user defined int type or it is negative.") </output>

    rule theFpToUIAux(A:K) => A
         requires A =/=K badValue

    rule theSIToFP(T1:KResult, A:KResult, T2:KResult)
            => theSIToFPAux(applyIntFloats(sitofp, T1, A, T2, .List))

    rule theSIToFPAux(A:K) => A
         requires A =/=K badValue

    rule <k> theSIToFPAux(badValue) ~> K:K => .K </k>
         (<tomasulo>
            D:Bag
         </tomasulo> =>  <tomasulo>...
                        <instQueue> instList(.List) </instQueue>
                          ...</tomasulo>)
        <output>... .List => ListItem("error: the value in the sitofp op cannot fit in the size of the user defined float type.") </output>

    rule theUIToFP(T1:KResult, A:KResult, T2:KResult)
            => theUIToFPAux(applyIntFloats(uitofp, T1, A, T2, .List))

    rule theUIToFPAux(A:K) => A
         requires A =/=K badValue

    rule <k> theUIToFPAux(badValue) ~> K:K => .K </k>
         (<tomasulo>
            D:Bag
         </tomasulo> =>  <tomasulo>...
                        <instQueue> instList(.List) </instQueue>
                          ...</tomasulo>)
        <output>... .List => ListItem("error: the value in the uitofp op cannot fit in the size of the user defined float type.") </output>

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

    //mutex lib functions
    rule call(_, calleeValue(funptr(name(globalVar, "pthread_mutex_init")),
                         (valValue(V1:KResult),
                   valValue(V2:KResult))))
            => mutexInit(V1, V2)

    rule call(_, calleeValue(funptr(name(globalVar, "pthread_mutex_destroy")),
                         (valValue(V1:KResult))))
            => mutexDestroy(V1)

    rule call(_, calleeValue(funptr(name(globalVar, "pthread_mutex_lock")),
                         (valValue(V1:KResult))))
            => mutexLock(V1)

    rule call(_, calleeValue(funptr(name(globalVar, "pthread_mutex_trylock")),
                         (valValue(V1:KResult))))
            => mutexTryLock(V1)

    rule call(_, calleeValue(funptr(name(globalVar, "pthread_mutex_unlock")),
                         (valValue(V1:KResult))))
            => mutexUnLock(V1)

    //pthread lib, pthread create function
    rule call(_, calleeValue(funptr(name(globalVar, "pthread_create")),
                         (valValue(V1:KResult),
                   valValue(V2:KResult), valValue(V3:KResult),
                     valValue(V4:KResult))))
            => pthreadCreate(V1, V2, V3, V4)

    rule call(_, calleeValue(funptr(name(globalVar, "pthread_detach")),
                         (valValue(V1:KResult))))
            => pthreadDetach(normalizingInt(integerType(64), V1))

    rule call(_, calleeValue(funptr(name(globalVar, "pthread_exit")),
                         (valValue(V1:KResult))))
            => pthreadExit(V1)

    rule call(_, calleeValue(funptr(name(globalVar, "pthread_join")),
                         (valValue(V1:KResult),
                   valValue(V2:KResult))))
            => pthreadJoin(normalizingInt(integerType(64), V1), V2)

    rule call(_, calleeValue(funptr(name(globalVar, "pthread_cancel")),
                         (valValue(V1:KResult))))
            => pthreadCancel(normalizingInt(integerType(64), V1))

    //volitile will be taken care by the release order after each function
    rule call(_, calleeValue(funptr(name(globalVar, "llvm.memcpy.p0i8.p0i8.i32")),
                         (valValue(V1:KResult),
                   valValue(V2:KResult), valValue(V3:KResult),
                     valValue(V4:KResult))))
            => memcpy(V1, V2, normalizingInt(integerType(32), V3))

    rule call(_, calleeValue(funptr(name(globalVar, "llvm.memcpy.p0i8.p0i8.i64")),
                         (valValue(V1:KResult),
                   valValue(V2:KResult), valValue(V3:KResult),
                     valValue(V4:KResult))))
            => memcpy(V1, V2, normalizingInt(integerType(64), V3))

    rule call(_, calleeValue(funptr(name(globalVar, "llvm.memmove.p0i8.p0i8.i32")),
                         (valValue(V1:KResult),
                   valValue(V2:KResult), valValue(V3:KResult),
                     valValue(V4:KResult))))
            => memmove(V1, V2, normalizingInt(integerType(32), V3))

    rule call(_, calleeValue(funptr(name(globalVar, "llvm.memmove.p0i8.p0i8.i64")),
                         (valValue(V1:KResult),
                   valValue(V2:KResult), valValue(V3:KResult),
                     valValue(V4:KResult))))
            => memmove(V1, V2, normalizingInt(integerType(64), V3))

    rule call(_, calleeValue(funptr(name(globalVar, "llvm.memset.p0i8.i32")),
                         (valValue(V1:KResult),
                   valValue(V2:KResult), valValue(V3:KResult),
                     valValue(V4:KResult))))
            => memset(V1, V2, normalizingInt(integerType(32), V3))

    rule call(_, calleeValue(funptr(name(globalVar, "llvm.memset.p0i8.i64")),
                         (valValue(V1:KResult),
                   valValue(V2:KResult), valValue(V3:KResult),
                     valValue(V4:KResult))))
            => memset(V1, V2, normalizingInt(integerType(64), V3))

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
        <k> call(_, calleeValue(funptr(name(globalVar, "llvm.va_end")), (valValue(V1:KResult))))
            => vaClose(V1)
        ...</k>

    rule <k> call(_, calleeValue(funptr(name(globalVar, "exit")), V:K))
            => .K ...</k>
        (.Bag => <result><returnValue> V </returnValue></result>)

    rule call(_, calleeValue(funptr(name(globalVar, "malloc")),
                 (valValue(V1:KResult), .ElemList)))
             => globalMalloc(V1, 1)

    rule call(_, calleeValue(funptr(name(globalVar, "calloc")),
                 (valValue(V1:KResult),valValue(V2:KResult), .ElemList)))
             => globalMalloc(V2, V1)

    rule call(_, calleeValue(funptr(name(globalVar, "free")),
                 (valValue(V1:KResult), .ElemList))) => free(V1)

    rule call(_, calleeValue(funptr(name(globalVar, "realloc")),
                 (valValue(V1:KResult),valValue(V2:KResult), .ElemList)))
                  => realloc(V1,V2)

endmodule

module LLVM-STANDARD-LIBRARY
    imports LLVM-SYNTAX
    imports LLVM-ABSTRACTSYNTAX
    imports LLVM-SETTINGS
    imports LLVM-HELPERS
    imports LLVM-CONFIGURATION
    imports LLVM-STANDARD-LIBRARY-SYNTAX
    imports LLVM-SYSCALLS-SYNTAX

    //memcpy is bascially a restricted form of memmove
    //what we need to do is to transform memcpy to memmove by checking if two overlaps
    rule memcpy(loc(Base:Int, pointerTypeValue(Type, Ad:Int),
                     value(Left:Int, Right:Int), Ran:K, none, InR:K),
                loc(Base1:Int, pointerTypeValue(Type1, Ad1:Int),
                     value(Left1:Int, Right1:Int), Ran1:K, none, InR1:K), Size:Int)
        => memmove(loc(Base:Int, pointerTypeValue(Type, Ad:Int),
                     value(Left:Int, Right:Int), Ran:K, none, InR:K),
                loc(Base1:Int, pointerTypeValue(Type1, Ad1:Int),
                     value(Left1:Int, Right1:Int), Ran1:K, none, InR1:K), Size:Int)
         requires (Ran ==K stack andBool Ran1 ==K heap)
                  orBool (Ran ==K heap andBool Ran1 ==K stack)

    rule memcpy(loc(Base:Int, pointerTypeValue(Type, Ad:Int),
                     value(Left:Int, Right:Int), Ran:K, none, InR:K),
                loc(Base1:Int, pointerTypeValue(Type1, Ad1:Int),
                     value(Left1:Int, Right1:Int), Ran1:K, none, InR1:K), Size:Int)
        => memmove(loc(Base:Int, pointerTypeValue(Type, Ad:Int),
                     value(Left:Int, Right:Int), Ran:K, none, InR:K),
                loc(Base1:Int, pointerTypeValue(Type1, Ad1:Int),
                     value(Left1:Int, Right1:Int), Ran1:K, none, InR1:K), Size:Int)
         requires ((Ran ==K stack andBool Ran1 ==K stack)
                  orBool (Ran ==K heap andBool Ran1 ==K heap))
                andBool notBool isOverlapMeaning(Base,
                             Base +Int Size, Base1, Base1 +Int Size)

    rule <threads> <thread>...
                 <k> memcpy(loc(Base:Int, pointerTypeValue(Type, Ad:Int),
                     value(Left:Int, Right:Int), Ran:K, none, InR:K),
                 loc(Base1:Int, pointerTypeValue(Type1, Ad1:Int),
                     value(Left1:Int, Right1:Int), Ran1:K, none, InR1:K), Size:Int)
            ~> K:K </k>
         </thread> TD:Bag => .Bag </threads>
         <output>... .List =>
            ListItem("memcpy error when the two input pointers overlap.")
         </output>
         requires ((Ran ==K stack andBool Ran1 ==K stack)
                  orBool (Ran ==K heap andBool Ran1 ==K heap))
                andBool isOverlapMeaning(Base,
                             Base +Int Size, Base1, Base1 +Int Size)

    // memmove -- basically an atomic read write
    rule <threads> <thread>...
                 <k> memmove(loc(Base:Int, pointerTypeValue(Type, Ad:Int),
                     value(Left:Int, Right:Int), stack, none, InR:K),
                 loc(Base1:Int, pointerTypeValue(Type1, Ad1:Int),
                     value(Left1:Int, Right1:Int), Ran:K, none, InR1:K), Size:Int)
             ~> K:K </k>
         </thread> TD:Bag => .Bag </threads>
         <output>... .List =>
            ListItem("memcpy/memmove error when trying to read/write values outside the bound of the input pointers restricted.")
         </output>
         requires Base +Int Size >Int Right orBool Base <Int Left
                orBool Base1 +Int Size >Int Right1 orBool Base1 <Int Left1

    rule <k> memmove(loc(Base:Int, pointerTypeValue(Type, Ad:Int),
                     value(Left:Int, Right:Int), Ran:K, none, InR:K),
                 loc(Base1:Int, pointerTypeValue(Type1, Ad1:Int),
                     value(Left1:Int, Right1:Int), Ran1:K, none, InR1:K), Size:Int)
               ~> Tail:K
            => contextSwitch(name(globalVar, "llvm.memmove."),
                        dynNoResult(undef) ~> Tail)
                 ~> staticAtomicStore(arrayTypeValue(llvmVoidPointerType, Size),
                      staticLoad(arrayTypeValue(
                            llvmVoidPointerType, Size),
                   loc(Base:Int, pointerTypeValue(arrayTypeValue(
                            llvmVoidPointerType, Size), Ad:Int),
                     value(Left:Int, Right:Int), Ran:K, none, InR:K), monotonic),
                       pointerTypeValue(arrayTypeValue(llvmVoidPointerType, Size), Ad),
                       loc(Base1:Int, pointerTypeValue(
                        arrayTypeValue(llvmVoidPointerType, Size), Ad1:Int),
                     value(Left1:Int, Right1:Int), Ran1:K, none, InR1:K), 1)
                 ~> ret(void, undef) </k>
         requires Base +Int Size <=Int Right andBool Base >=Int Left
                andBool Base1 +Int Size <=Int Right1 andBool Base1 >=Int Left1
         [transition]

    // memset
    rule memset(loc(Base:Int, pointerTypeValue(Type, Ad:Int),
                     value(Left:Int, Right:Int), Ran:K, none, InR:K),
                  V:KResult, Len:Int)
          => store(arrayTypeValue(llvmVoidPointerType, Len), V,
                    pointerTypeValue(arrayTypeValue(llvmVoidPointerType, Len), Ad),
                loc(Base, pointerTypeValue(arrayTypeValue(llvmVoidPointerType, Len),
                     Ad), value(Left, Right), Ran, none, InR), 1, false)

    // lifetimeStart
    // don't need to do anything for positive semantics
    rule
        <k> lifetimeStart(_, _) => .K ...</k>

    // lifetimeEnd
    // don't need to do anything for positive semantics
    rule
        <k> lifetimeEnd(_, _) => .K ...</k>

    //pthread create, first context switch, and then
    rule <k> pthreadCreateCore(Tid:Int, loc(P:Int,pointerTypeValue(T:K, Ad:Int),
                        value(P:Int,P:Int), RT:K, BA:K, D:K), Arg:KResult)
             => pthreadCreateCore(Tid, value(T, V), Arg) ...</k>
            <cbd>... aLoc(P, pointerTypeValue(T, Ad:Int), heap) |-> value(T, V:K) ...</cbd>

    rule <threads> (TD:Bag
          <thread>... <k> pthreadCreateCore(Tid:Int, loc(P:Int,pointerTypeValue(T:K, Ad:Int),
                        value(P1:Int,P2:Int), RT:K, BA:K, D:K), Arg:KResult) ~> K:K </k>
          ...</thread>) => .Bag
         </threads>
         <output>... .List
                => ListItem("error: function pointer pointing to bad place in pthread create.") </output>
         requires P <Int P1 orBool P >Int P2

    rule  <cbd>... aLoc(P, pointerTypeValue(T, Ad:Int), heap) |-> value(T':K, V:K) ...</cbd>
          <threads> (TD:Bag
          <thread>... <k> pthreadCreateCore(Tid:Int, loc(P:Int,pointerTypeValue(T:K, Ad:Int),
                        value(P:Int,P:Int), RT:K, BA:K, D:K), Arg:KResult) ~> K:K </k>
          ...</thread>) => .Bag
         </threads>
         <output>... .List => ListItem("error: function pointer pointing to wrong function type in pthread function.") </output>
         requires T =/=K T'

    rule  <cbd> M:Map </cbd>
          <threads> (TD:Bag
          <thread>... <k> pthreadCreateCore(Tid:Int, loc(P:Int,T:K,
                        value(P:Int,P:Int), RT:K, BA:K, D:K), Arg:KResult) ~> K:K </k>
          ...</thread>) => .Bag
         </threads>
         <output>... .List
                => ListItem("error: no such function for the place or function has wrong type in pthread function.") </output>
         requires notBool aLoc(P, T, heap) in keys(M)

    rule <k> pthreadCreateCore(Tid:Int, value(T, funptr(FunName)), Arg:KResult)
                => .K ...</k>
         <threadStatus> M:Map => M[Tid <- pthreadGlobal(true, PTHREAD_RUNNING, .K)] </threadStatus>
         <currModule> Label:K </currModule>
         (.Bag => <thread>...
                   <k> call(T, calleeValue(
                      funptr(FunName), valValue(Arg),.ElemList)) </k>
                   <threadId> Tid </threadId>
                   <memChannelId> Tid %Int maxMemChannel </memChannelId>
                   <control>... <currModule> Label </currModule> ...</control>
                    ...</thread>)

    rule <k> pthreadCreate(loc(Base:Int, pointerTypeValue(T:K, Ad:Int),
                  value(Left:Int, Right:Int), Ran:K, none, InR:K),
                  V2:K, V3:K, V4:K) ~> Tail:K
                   => contextSwitch(name(globalVar, "pthread_create"), Tail)
                 ~> staticStore(integerType(64), ThreadId, pointerTypeValue(integerType(64), Ad),
                       loc(Base:Int, pointerTypeValue(integerType(64), Ad:Int),
                  value(Left:Int, Right:Int), Ran:K, none, InR:K), 1)
                 ~> (pthreadCreateCore(ThreadId, V3, V4)
                 ~> ret(integerType(32), 0)) </k>
         <threadCount> ThreadId:Int => ThreadId +Int 1 </threadCount>
         requires Base >=Int Left andBool Base +Int sizeof(integerType(64)) <=Int Right
                   andBool ThreadId <Int (2 ^Int 64) andBool ThreadId >=Int 0
                   andBool ThreadId <Int maxThreads

    rule (<threads> Td:Bag
         <thread>...
            <k> pthreadCreate(loc(Base:Int, pointerTypeValue(T:K, Ad:Int),
                  value(Left:Int, Right:Int), Ran:K, none, InR:K),
                  V2:K, V3:K, V4:K) ~> K:K </k>
         ...</thread> </threads> => .Bag)
         <output>... .List =>
            ListItem("input thread id pointer for the pthread create function points to illegal place.")
         </output>
         requires Base <Int Left andBool Base +Int sizeof(integerType(64)) >Int Right

    rule <threadCount> ThreadId:Int </threadCount>
         <k> pthreadCreate(loc(Base:Int, pointerTypeValue(T:K, Ad:Int),
                  value(Left:Int, Right:Int), Ran:K, none, InR:K),
                  V2:K, V3:K, V4:K) => EAGAIN ...</k>
         <output>... .List =>
            ListItem("Insufficient resources to create another thread.")
         </output>
         requires ThreadId >=Int (2 ^Int 64) orBool ThreadId <Int 0

    rule <threadCount> ThreadId:Int </threadCount>
         <k> pthreadCreate(loc(Base:Int, pointerTypeValue(T:K, Ad:Int),
                  value(Left:Int, Right:Int), Ran:K, none, InR:K),
                  V2:K, V3:K, V4:K) => EAGAIN ...</k>
         <output>... .List =>
            ListItem("A system-imposed limit on the number of threads was encountered.")
         </output>
         requires ThreadId >=Int maxThreads
    
    //pthread exit function
    rule (<thread>... <k> pthreadExit(V:KResult) ~> K:K </k>
                       <threadId> Tid:Int </threadId> ...</thread> => .Bag)
         <threadStatus>... Tid |-> pthreadGlobal(A:Bool, (B:K => PTHREAD_TERMINATED),
                                      (C:K => V)) ...</threadStatus>

    //pthread detach function
    rule <k> pthreadDetach(Tid:Int) => 0 ...</k>
         <threadStatus>... Tid |-> pthreadGlobal((true => false), B:K, C:K) ...</threadStatus>

    rule <k> pthreadDetach(Tid:Int) => EINVAL ...</k>
         <output>... .List =>
            ListItem("Thread detach function: the thread is not a joinable thread.")
         </output>
         <threadStatus>... Tid |-> pthreadGlobal(false, B:K, C:K) ...</threadStatus>

    rule <k> pthreadDetach(Tid:Int) => ESRCH ...</k>
         <output>... .List =>
            ListItem("Thread detach function: the thread does not exist.")
         </output>
         <threadStatus> M:Map </threadStatus>
         requires notBool Tid in keys(M)

    //pthread cancel function
    rule <k> pthreadCancel(Tid:Int) => 0 ...</k>
         <threadStatus>... Tid |-> pthreadGlobal(true,
                 (B:K => PTHREAD_CANCELED), C:K) ...</threadStatus>
         (<thread>... <threadId> Tid </threadId> ...</thread> => .Bag)
         requires B ==K PTHREAD_RUNNING

    rule <k> pthreadCancel(Tid:Int) => 0 ...</k>
         <threadStatus>... Tid |-> pthreadGlobal(true,
                 (B:K => PTHREAD_CANCELED), C:K) ...</threadStatus>
         requires B ==K PTHREAD_TERMINATED orBool B ==K PTHREAD_CANCELED

    rule <k> pthreadCancel(Tid:Int) => ESRCH ...</k>
         <output>... .List =>
            ListItem("Thread cancel function: the thread does not exist.")
         </output>
         <threadStatus> M:Map </threadStatus>
         requires notBool Tid in keys(M)

    rule <threads> (TD:Bag
              <thread>... <k> pthreadCancel(Tid:Int) ~> K:K </k> ...</thread>)
                 => .Bag
         </threads>
         <output>... .List =>
            ListItem("Thread cancel function is not safe when the thread is not joinable.")
         </output>
         <threadStatus>... Tid |-> pthreadGlobal(false, B:K, C:K) ...</threadStatus>

    //pthread join function
    rule <k> pthreadJoin(Tid:Int, loc(Base:Int, pointerTypeValue(T:K, Ad:Int),
                  value(Left:Int, Right:Int), Ran:K, none, InR:K))
               => EINVAL ...</k>
         <output>... .List =>
            ListItem("Thread join: thread is not a joinable thread.")
         </output>
         <threadStatus>... Tid |-> pthreadGlobal(false, B:K, C:K) ...</threadStatus>

    rule <k> pthreadJoin(Tid:Int, loc(Base:Int, pointerTypeValue(T:K, Ad:Int),
                  value(Left:Int, Right:Int), Ran:K, none, InR:K))
               => ESRCH ...</k>
         <threadStatus> M:Map </threadStatus>
         <threadCount> TidCount:Int </threadCount>
         <output>... .List =>
            ListItem("Thread join: No thread with the ID thread could be found.")
         </output>
         requires Tid >Int TidCount andBool notBool Tid in keys(M)

    rule <threads> (Td:Bag 
             <thread>...
                    <k> pthreadJoin(Tid:Int, loc(Base:Int, pointerTypeValue(T:K, Ad:Int),
                  value(Left:Int, Right:Int), Ran:K, none, InR:K))
                ~> K:K </k> ...</thread>
         <threadCount> TidCount:Int </threadCount> => .Bag)
         </threads>
         <threadStatus> M:Map </threadStatus>
         <output>... .List =>
            ListItem("Thread join: trying to join with a thread that has been joined results in undefined behavior.")
         </output>
         requires Tid >=Int 0 andBool Tid <=Int TidCount andBool notBool Tid in keys(M)

    rule <k> pthreadJoin(Tid:Int, loc(Base:Int, pointerTypeValue(T:K, Ad:Int),
                  value(Left:Int, Right:Int), Ran:K, none, InR:K))
               => EINVAL ...</k>
         <threadId> Tid':Int </threadId>
         <threadStatus>... Tid |-> pthreadGlobal(true, B:K, C:K) ...</threadStatus>
         <waitJoinThreads>... Tid |-> Tid2:K ...</waitJoinThreads>
         <output>... .List =>
            ListItem("Thread join: Another thread is already waiting to join with this thread.")
         </output>

    rule <k> pthreadJoin(Tid:Int, loc(Base:Int, pointerTypeValue(T:K, Ad:Int),
                  value(Left:Int, Right:Int), Ran:K, none, InR:K))
               => EDEADLK ...</k>
         <threadId> Tid':Int </threadId>
         <threadStatus>... Tid |-> pthreadGlobal(true, B:K, C:K) ...</threadStatus>
         <waitJoinThreads> M:Map </waitJoinThreads>
         <output>... .List =>
            ListItem("Thread join:  A deadlock was detected (e.g., two threads tried to join with each other); or thread specifies the calling thread.")
         </output>
         requires notBool Tid in keys(M) andBool hasChainWait(M, Tid', Tid)

    rule <k> pthreadJoin(Tid:Int, loc(Base:Int, pointerTypeValue(T:K, Ad:Int),
                  value(Left:Int, Right:Int), Ran:K, none, InR:K)) ~> Tail:K
                   => contextSwitch(name(globalVar, "pthread_join"), Tail)
                 ~> (pthreadJoinWait(Tid, loc(Base:Int, pointerTypeValue(T:K, Ad:Int),
                  value(Left:Int, Right:Int), Ran:K, none, InR:K))
                 ~> ret(integerType(32), 0)) </k>
         <threadId> Tid':Int </threadId>
         <threadStatus>... Tid |-> pthreadGlobal(true, B:K, C:K) ...</threadStatus>
         <waitJoinThreads> M:Map => M[Tid <- Tid'] </waitJoinThreads>
         requires notBool Tid in keys(M) andBool notBool hasChainWait(M, Tid', Tid)

    rule <k> pthreadJoinWait(Tid:Int, loc(Base:Int, pointerTypeValue(T:K, Ad:Int),
                  value(Left:Int, Right:Int), Ran:K, none, InR:K))
           => staticStore(T, selectStatus(B, C), pointerTypeValue(T, Ad),
                       loc(Base:Int, pointerTypeValue(T:K, Ad:Int),
                  value(Left:Int, Right:Int), Ran:K, none, InR:K), 1) ...</k>
         <threadStatus> M:Map ((Tid |-> pthreadGlobal(A:Bool, B:K, C:K)) => .Map) </threadStatus>
         <waitJoinThreads> M':Map ((Tid |-> Tid':K) => .Map) </waitJoinThreads>
         requires B ==K PTHREAD_CANCELED orBool B ==K PTHREAD_TERMINATED

    //mutex init function
    rule <threads> TD:Bag
          <thread>... <k> mutexInit(loc(Base:Int, pointerTypeValue(T:K, Ad:Int),
                  value(Left:Int, Right:Int), Ran:K, none, InR:K), V2:K)
                 ~> K:K </k> ...</thread> => .Bag
           </threads>
         <mutexCount> MutexId:Int </mutexCount>
         <output>... .List =>
            ListItem("Mutex init function error: input pointer is not a valid pointer or tries to access memory out of bound of the pointer.")
         </output>
         requires Base <Int Left orBool Base +Int sizeof(mutexIdType) >Int Right

    rule <k> mutexInit(loc(Base:Int, pointerTypeValue(T:K, Ad:Int),
                  value(Left:Int, Right:Int), Ran:K, none, InR:K), V2:K)
               => EAGAIN ...</k>
         <mutexCount> MutexId:Int </mutexCount>
         <output>... .List =>
            ListItem("Mutex init: The system lacked the necessary resources (other than memory) to initialize another mutex.")
         </output>
         requires Base >=Int Left andBool Base +Int sizeof(mutexIdType) <=Int Right
                   andBool (MutexId >Int (2 ^Int 64) orBool MutexId <Int 0)

    rule mutexInitCore(region(L:List, Size:Int))
               => mutexInitNext(joinBytes(mutexIdType ,L))

    rule <k> mutexInitNext(constStructVal(valValue(X:Int),Es:ElemList))
                  => ret(integerType(32), EBUSY) ...</k>
         <avaMutex> S:Set </avaMutex>
         <output>... .List =>
            ListItem("Mutex init: The implementation has detected an attempt to reinitialize the object referenced by mutex, a previously initialized, but not yet destroyed, mutex.")
         </output>
         requires X in S

    rule <k> mutexInitNext(constStructVal(valValue(X:Int),Es:ElemList))
                  => ret(integerType(32), 0) ...</k>
         <avaMutex> S:Set (.Set => SetItem(MutexId)) </avaMutex>
         <mutexCount> MutexId:Int => MutexId +Int 1 </mutexCount>
         (.Bag => <mutex> <mutexId> MutexId </mutexId>
                           <holdThread> .K </holdThread>
                             </mutex>)
         requires notBool X in S

    rule <k> mutexInit(loc(Base:Int, pointerTypeValue(T:K, Ad:Int),
                  value(Left:Int, Right:Int), Ran:K, none, InR:K), V2:K) ~> Tail:K
                   => contextSwitch(name(globalVar, "pthread_mutex_init"), Tail)
                 ~> mutexInitCore(
                     staticLoad(mutexIdType, loc(Base:Int, pointerTypeValue(T:K, Ad:Int),
                  value(Left:Int, Right:Int), Ran:K, none, InR:K), monotonic)) </k>
         <mutexCount> MutexId:Int </mutexCount>
         requires Base >=Int Left andBool Base +Int sizeof(mutexIdType) <=Int Right
                   andBool MutexId <Int (2 ^Int 64) andBool MutexId >=Int 0

    //mutex destroy function
    rule <threads> TD:Bag
          <thread>... <k> mutexDestroy(loc(Base:Int, pointerTypeValue(T:K, Ad:Int),
                  value(Left:Int, Right:Int), Ran:K, none, InR:K))
                 ~> K:K </k> ...</thread> => .Bag
           </threads>
         <mutexCount> MutexId:Int </mutexCount>
         <output>... .List =>
            ListItem("Mutex init function error: input pointer is not a valid pointer or tries to access memory out of bound of the pointer.")
         </output>
         requires Base <Int Left orBool Base +Int sizeof(mutexIdType) >Int Right

    rule <k> mutexDestroy(loc(Base:Int, pointerTypeValue(T:K, Ad:Int),
                  value(Left:Int, Right:Int), Ran:K, none, InR:K)) ~> Tail:K
                   => contextSwitch(name(globalVar, "pthread_mutex_destroy"), Tail)
                 ~> mutexDestroyCore(
                     staticLoad(mutexIdType, loc(Base:Int, pointerTypeValue(T:K, Ad:Int),
                  value(Left:Int, Right:Int), Ran:K, none, InR:K), monotonic)) </k>
         <mutexCount> MutexId:Int </mutexCount>
         requires Base >=Int Left andBool Base +Int sizeof(mutexIdType) <=Int Right

    rule mutexDestroyCore(region(L:List, Size:Int))
               => mutexDestroyNext(joinBytes(mutexIdType ,L))

    rule <k> mutexDestroyNext(constStructVal(valValue(X:Int),Es:ElemList))
                  => ret(integerType(32), EINVAL) ...</k>
         <avaMutex> S:Set </avaMutex>
         <output>... .List =>
            ListItem("Mutex destroy function: The value specified by mutex is invalid.")
         </output>
         requires notBool X in S

    rule <k> mutexDestroyNext(constStructVal(valValue(X:Int),Es:ElemList))
                  => ret(integerType(32), EBUSY) ...</k>
         <avaMutex> S:Set </avaMutex>
         <mutex> <mutexId> X </mutexId>
                 <holdThread> A:K </holdThread>
         </mutex>
         <output>... .List =>
            ListItem("Mutex destroy function: The implementation has detected an attempt to destroy the object referenced by mutex while it is locked or referenced (for example, while being used in a pthread_cond_timedwait() or pthread_cond_wait()) by another thread.")
         </output>
         requires X in S andBool A =/=K .K

    rule <k> mutexDestroyNext(constStructVal(valValue(X:Int),Es:ElemList))
                  => ret(integerType(32), 0) ...</k>
         <avaMutex> (S:Set SetItem(X) => S) </avaMutex>
         (<mutex> <mutexId> X </mutexId>
                 <holdThread> .K </holdThread>
         </mutex> => .Bag)

    //pthread_mutex_lock
    rule <threads> TD:Bag
          <thread>... <k> mutexLock(loc(Base:Int, pointerTypeValue(T:K, Ad:Int),
                  value(Left:Int, Right:Int), Ran:K, none, InR:K))
                 ~> K:K </k> ...</thread> => .Bag
           </threads>
         <mutexCount> MutexId:Int </mutexCount>
         <output>... .List =>
            ListItem("Mutex lock function error: input pointer is not a valid pointer or tries to access memory out of bound of the pointer.")
         </output>
         requires Base <Int Left orBool Base +Int sizeof(mutexIdType) >Int Right

    rule <k> mutexLock(loc(Base:Int, pointerTypeValue(T:K, Ad:Int),
                  value(Left:Int, Right:Int), Ran:K, none, InR:K)) ~> Tail:K
                   => contextSwitch(name(globalVar, "pthread_mutex_lock"), Tail)
                 ~> mutexLockCore(
                     staticLoad(mutexIdType, loc(Base:Int, pointerTypeValue(T:K, Ad:Int),
                  value(Left:Int, Right:Int), Ran:K, none, InR:K), monotonic)) </k>
         <mutexCount> MutexId:Int </mutexCount>
         requires Base >=Int Left andBool Base +Int sizeof(mutexIdType) <=Int Right

    rule mutexLockCore(region(L:List, Size:Int))
               => mutexLockNext(joinBytes(mutexIdType ,L))

    rule <k> mutexLockNext(constStructVal(valValue(X:Int),Es:ElemList))
                  => ret(integerType(32), EINVAL) ...</k>
         <avaMutex> S:Set </avaMutex>
         <output>... .List =>
            ListItem("Mutex lock function: The value specified by mutex does not refer to an initialized mutex object.")
         </output>
         requires notBool X in S

    rule <k> mutexLockNext(constStructVal(valValue(X:Int),Es:ElemList))
                  => ret(integerType(32), EDEADLK) ...</k>
         <threadId> Tid:Int </threadId>
         <avaMutex> S:Set </avaMutex>
         <mutex> <mutexId> X </mutexId>
                 <holdThread> Tid </holdThread>
         </mutex>
         <output>... .List =>
            ListItem("Mutex lock function: The current thread already owns the mutex.")
         </output>
         requires X in S

    rule <k> mutexLockNext(constStructVal(valValue(X:Int),Es:ElemList))
                  => ret(integerType(32), 0) ...</k>
         <threadId> Tid:Int </threadId>
         <avaMutex> S:Set </avaMutex>
         <mutex> <mutexId> X </mutexId>
                 <holdThread> .K => Tid </holdThread>
         </mutex>
         requires X in S

    //pthread mutex try lock
    rule <threads> TD:Bag
          <thread>... <k> mutexTryLock(loc(Base:Int, pointerTypeValue(T:K, Ad:Int),
                  value(Left:Int, Right:Int), Ran:K, none, InR:K))
                 ~> K:K </k> ...</thread> => .Bag
           </threads>
         <mutexCount> MutexId:Int </mutexCount>
         <output>... .List =>
            ListItem("Mutex try lock function error: input pointer is not a valid pointer or tries to access memory out of bound of the pointer.")
         </output>
         requires Base <Int Left orBool Base +Int sizeof(mutexIdType) >Int Right

    rule <k> mutexTryLock(loc(Base:Int, pointerTypeValue(T:K, Ad:Int),
                  value(Left:Int, Right:Int), Ran:K, none, InR:K)) ~> Tail:K
                   => contextSwitch(name(globalVar, "pthread_mutex_trylock"), Tail)
                 ~> mutexTryLockCore(
                     staticLoad(mutexIdType, loc(Base:Int, pointerTypeValue(T:K, Ad:Int),
                  value(Left:Int, Right:Int), Ran:K, none, InR:K), monotonic)) </k>
         <mutexCount> MutexId:Int </mutexCount>
         requires Base >=Int Left andBool Base +Int sizeof(mutexIdType) <=Int Right

    rule mutexTryLockCore(region(L:List, Size:Int))
               => mutexTryLockNext(joinBytes(mutexIdType ,L))

    rule <k> mutexTryLockNext(constStructVal(valValue(X:Int),Es:ElemList))
                  => ret(integerType(32), EINVAL) ...</k>
         <avaMutex> S:Set </avaMutex>
         <output>... .List =>
            ListItem("Mutex try lock function: The value specified by mutex does not refer to an initialized mutex object.")
         </output>
         requires notBool X in S

    rule <k> mutexTryLockNext(constStructVal(valValue(X:Int),Es:ElemList))
                  => ret(integerType(32), EBUSY) ...</k>
         <avaMutex> S:Set </avaMutex>
         <mutex> <mutexId> X </mutexId>
                 <holdThread> A:K </holdThread>
         </mutex>
         <output>... .List =>
            ListItem("Mutex try lock function: The mutex could not be acquired because it was already locked.")
         </output>
         requires X in S andBool A =/=K .K

    rule <k> mutexTryLockNext(constStructVal(valValue(X:Int),Es:ElemList))
                  => ret(integerType(32), 0) ...</k>
         <threadId> Tid:Int </threadId>
         <avaMutex> S:Set </avaMutex>
         <mutex> <mutexId> X </mutexId>
                 <holdThread> .K => Tid </holdThread>
         </mutex>
         requires X in S

    //pthread mutex unlock
    rule <threads> TD:Bag
          <thread>... <k> mutexUnLock(loc(Base:Int, pointerTypeValue(T:K, Ad:Int),
                  value(Left:Int, Right:Int), Ran:K, none, InR:K))
                 ~> K:K </k> ...</thread> => .Bag
           </threads>
         <mutexCount> MutexId:Int </mutexCount>
         <output>... .List =>
            ListItem("Mutex unlock function error: input pointer is not a valid pointer or tries to access memory out of bound of the pointer.")
         </output>
         requires Base <Int Left orBool Base +Int sizeof(mutexIdType) >Int Right

    rule <k> mutexUnLock(loc(Base:Int, pointerTypeValue(T:K, Ad:Int),
                  value(Left:Int, Right:Int), Ran:K, none, InR:K)) ~> Tail:K
                   => contextSwitch(name(globalVar, "pthread_mutex_unlock"), Tail)
                 ~> mutexUnLockCore(
                     staticLoad(mutexIdType, loc(Base:Int, pointerTypeValue(T:K, Ad:Int),
                  value(Left:Int, Right:Int), Ran:K, none, InR:K), monotonic)) </k>
         <mutexCount> MutexId:Int </mutexCount>
         requires Base >=Int Left andBool Base +Int sizeof(mutexIdType) <=Int Right

    rule mutexUnLockCore(region(L:List, Size:Int))
               => mutexUnLockNext(joinBytes(mutexIdType ,L))

    rule <k> mutexUnLockNext(constStructVal(valValue(X:Int),Es:ElemList))
                  => ret(integerType(32), EINVAL) ...</k>
         <avaMutex> S:Set </avaMutex>
         <output>... .List =>
            ListItem("Mutex unlock function: The value specified by mutex does not refer to an initialized mutex object.")
         </output>
         requires notBool X in S

    rule <k> mutexUnLockNext(constStructVal(valValue(X:Int),Es:ElemList))
                  => ret(integerType(32), EPERM) ...</k>
         <avaMutex> S:Set </avaMutex>
         <threadId> Tid:Int </threadId>
         <mutex> <mutexId> X </mutexId>
                 <holdThread> A:K </holdThread>
         </mutex>
         <output>... .List =>
            ListItem("Mutex unlock function: The current thread does not own the mutex.")
         </output>
         requires X in S andBool A =/=K Tid

    rule <k> mutexUnLockNext(constStructVal(valValue(X:Int),Es:ElemList))
                  => ret(integerType(32), 0) ...</k>
         <threadId> Tid:Int </threadId>
         <avaMutex> S:Set </avaMutex>
         <mutex> <mutexId> X </mutexId>
                 <holdThread> Tid => .K </holdThread>
         </mutex>
         requires X in S

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

    rule <k> landingpad(T:K, L:List) => V </k>
         <expResume> V:K => .K </expResume>
         requires V =/=K .K

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
