// 
requires "llvm-syntax.k"
requires "llvm-abstractsyntax.k"
requires "llvm-settings.k"
requires "llvm-helpers.k"
requires "llvm-standard-library-syntax.k"
requires "llvm-syscalls-syntax.k"
requires "llvm-configuration.k"

module LLVM-SELECTION
    imports LLVM-SYNTAX
    imports LLVM-ABSTRACTSYNTAX
    imports LLVM-SETTINGS
    imports LLVM-HELPERS
    imports LLVM-STANDARD-LIBRARY-SYNTAX
    imports LLVM-SYSCALLS-SYNTAX
    imports LLVM-CONFIGURATION

    rule [select-vector]:
        select(vectorTypeValue(T1:KResult, N:Int), I:KResult, A:KResult, B:KResult)
                => applySelects(normalizingInt(getIntType(T1), I), A, B)

    rule [select-single]:
        select(integerType(1), I:KResult, A:KResult, B:KResult)
                => applySelects(normalizingInt(integerType(1), I), A, B)

    //dealing with elementextract
    rule elemExtract(T:K, poisonVal, T2:K, A:K) => poisonVal
    rule elemExtract(T:K, undef, T2:K, A:K) => undef

    rule elemExtract(T:K, zeroinitializer, T2:K, A:K)
             => elemExtract(T, dealWithZeroInitializer(T), T2, A)
    rule elemExtract(T:K, A:K, T2:K, zeroinitializer)
             => elemExtract(T, A, T2, dealWithZeroInitializer(T2))

    rule elemExtract(T:K, A:K, T2:K, poisonVal) => poisonVal
    rule elemExtract(T:K, vectorValue(Es:ElemList), T2:K, undef)
          => undef
         requires lengthOfList(Es) >Int 1
    rule elemExtract(T:K, vectorValue(valValue(A:K),.ElemList), T2:K, undef) => A

    rule elemExtract(T:K, vectorValue(Es:ElemList), T2:K,
               intLoc(A:K, B:K, C:K, D:K, E:K))
                => elemExtract(T, vectorValue(Es:ElemList), T2, A)

    rule elemExtract(T:K, vectorValue(X:ElemList), T2:K, V:Int)
                 => elemExtractAux(X, normalizingInt(T2, V))

    rule elemExtractAux((valValue(A:K),Es:ElemList), 0) => A
    rule elemExtractAux((valValue(A:K),Es:ElemList), N:Int)
             => elemExtractAux(Es, N -Int 1)
         requires N >Int 0
    rule <k> elemExtractAux(.ElemList, N:Int) ~> K:K => .K </k>
         (<tomasulo>
            D:Bag
         </tomasulo> =>  <tomasulo>...
                        <instQueue> instList(.List) </instQueue>
                          ...</tomasulo>)
        <output>... .List => ListItem("error: extracting element out of vector range.") </output>

    //dealing with insertelement
    rule insertElem(T:K, poisonVal, T2:K, A:K, T3:K, B:K) => poisonVal
    rule insertElem(T:K, A:K, T2:K, poisonVal, T3:K, B:K) => poisonVal
    rule insertElem(T:K, A:K, T2:K, B:K, T3:K, poisonVal) => poisonVal
    rule insertElem(T:K, undef, T2:K, A:K, T3:K, B:K) => undef

    rule insertElem(T:K, vectorValue(Es:ElemList), T2:K, A:K, T3:K, undef)
          => undef
         requires lengthOfList(Es) >Int 1
    rule insertElem(T:K, vectorValue(valValue(A:K),.ElemList),
                      T2:K, B:K, T3:K, undef) => vectorValue(valValue(B),.ElemList)
    rule insertElem(T:K, zeroinitializer, T2:K, A:K, T3:K, B:K)
             => insertElem(T, dealWithZeroInitializer(T), T2, A, T3, B)
    rule insertElem(T:K, A:K, T2:K, zeroinitializer, T3:K, B:K)
             => insertElem(T, A, T2, dealWithZeroInitializer(T2), T3:K, B)
    rule insertElem(T:K, A:K, T2:K, B:K, T3:K, zeroinitializer)
             => insertElem(T, A, T2, B, T3:K, dealWithZeroInitializer(T3))

    rule insertElem(T:K, vectorValue(Es:ElemList), T2:K, V2:K, T3:K,
               intLoc(A:K, B:K, C:K, D:K, E:K))
                => insertElem(T, vectorValue(Es:ElemList), T2, V2, T3, A)
    rule insertElem(T:K, vectorValue(X:ElemList), T2:K, V2:K, T3:K, V3:Int)
                 => insertElemAux(insertElemFun(X, normalizingInt(T3, V3), V2, .List))

    rule insertElemAux(A:K) => A
         requires A =/=K badValue

    rule <k> insertElemAux(badValue) ~> K:K => .K </k>
         (<tomasulo>
            D:Bag
         </tomasulo> =>  <tomasulo>...
                        <instQueue> instList(.List) </instQueue>
                          ...</tomasulo>)
        <output>... .List => ListItem("error: insert element out of vector range.") </output>

    //dealing with shuffle vector op
    rule shuffleVector(T:K, X:K, A:K, T2:K, B:K) => X
         requires X ==K poisonVal orBool X ==K undef
    rule shuffleVector(T:K, A:K, X:K, T2:K, B:K) => X
         requires X ==K poisonVal orBool X ==K undef
    rule shuffleVector(T:K, A:K, B:K, T2:K, X:K) => X
         requires X ==K poisonVal orBool X ==K undef

    rule shuffleVector(T:K, zeroinitializer, B:K, T2:K, C:K)
            => shuffleVector(T, dealWithZeroInitializer(T), B, T2, C)
    rule shuffleVector(T:K, B:K, zeroinitializer, T2:K, C:K)
            => shuffleVector(T, B, dealWithZeroInitializer(T), T2, C)
    rule shuffleVector(T:K, A:K, B:K, T2:K, zeroinitializer)
            => shuffleVector(T, A, B, T2, dealWithZeroInitializer(T2))
    rule shuffleVector(T:K, vectorValue(A:ElemList),
                  vectorValue(B:ElemList), T2:K, vectorValue(C:ElemList))
           => getShuffleResult(elemListToList(A) elemListToList(B), C)

    //dealing with extract value
    rule extractValue(poisonVal, L:List) => poisonVal
    rule extractValue(undef, L:List) => undef
    rule extractValue(V:K, .List) => V
    rule extractValue(arrayValue(Es:ElemList), ListItem(N:Int) L:List)
           => extractValue(getElemListElem(Es, N), L)
    rule extractValue(constStructVal(Es:ElemList), ListItem(N:Int) L:List)
           => extractValue(getElemListElem(Es, N), L)
    rule extractValue(packedStructVal(Es:ElemList), ListItem(N:Int) L:List)
           => extractValue(getElemListElem(Es, N), L)

    //dealing with insert value
    rule insertValue(T:K, poisonVal, A:K, L:List) => poisonVal
    rule insertValue(T:K, A:K, poisonVal, L:List) => poisonVal
    rule insertValue(T:K, undef, undef, L:List) => undef
    rule insertValue(T:K, undef, A:K, L:List)
               => insertValue(T, dealWithUndef(T), A, L)
         requires A =/=K undef
    rule insertValue(T:K, arrayValue(Es:ElemList), A:K, L:List)
           => placeInsertValue(arrayValue(Es:ElemList), A, .K, L)
    rule insertValue(T:K, constStructVal(Es:ElemList), A:K, L:List)
           => placeInsertValue(constStructVal(Es:ElemList), A, .K, L)
    rule insertValue(T:K, packedStructVal(Es:ElemList), A:K, L:List)
           => placeInsertValue(packedStructVal(Es:ElemList), A, .K, L)

endmodule
