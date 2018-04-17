// 
requires "llvm-syntax.k"
requires "llvm-abstractsyntax.k"
requires "llvm-settings.k"
requires "llvm-helpers.k"
requires "llvm-standard-library-syntax.k"
requires "llvm-syscalls-syntax.k"
requires "llvm-configuration.k"

module LLVM-BRANCHING
    imports LLVM-SYNTAX
    imports LLVM-ABSTRACTSYNTAX
    imports LLVM-SETTINGS
    imports LLVM-HELPERS
    imports LLVM-STANDARD-LIBRARY-SYNTAX
    imports LLVM-SYSCALLS-SYNTAX
    imports LLVM-CONFIGURATION

    //dealing with unconditional branch
    //need to take care the case when we need to clean up speculative 
    //opeartors. 
    rule <k> unconditional(name(Label:K, S:String)) =>
            blockExecution(basicBlockNum(Count,name(Label:K, S:String)),
                 formInstList(1, .K, Body))
              ~> dynNoResult(undef) ...</k>
        <toExecute> Ex:K => .K </toExecute>
        <instQueue> AnyQueue:K => instList(.List) </instQueue>
        <prevBlock> PrevB:K => basicBlockNum(OldCount:Int, Name:K) </prevBlock>
        <currBlock> basicBlockNum(OldCount:Int, Name:K)
            => basicBlockNum(Count,name(Label:K, S:String)) </currBlock>
        <specChoice> allowChoice(Cho:Map => .Map) </specChoice>
        <reverseChoice> _:Map => .Map </reverseChoice>
        <restChoice> _:Map => .Map </restChoice>
        <specRegisters> SRM:Map => cutOffRegs(OldCount, .K, .K, SRM) </specRegisters>
        <registers> RM:Map => updateMapByMap(RM, .K, .K,
                              getOffRegs(OldCount, .K, .K, SRM)) </registers>
        <blockCount> Count:Int => Count +Int 1 </blockCount>
        <currChoice> CurCh:Map => CurCh[Count <- name(Label:K, S:String)] </currChoice>
        <currModule> ModName:SymbolicValueRef </currModule>
        <funModuleName> ModName </funModuleName>
        <currFunction> FunName </currFunction>
        <functionName> FunName </functionName>
        <basicBlocks>... name(Label:K, S:String)
                 |-> blockContent(Body:Map, _:Bool, _:Set,
                  _:Set, _:Set, _:Set, _:Set, _:Set, _:Set) ...</basicBlocks>
        requires notBool inChoiceMap(OldCount, name(Label:K, S:String), .K, Cho)

    rule <k> unconditional(name(Label:K, S:String)) =>
            setSpecChoice(OldCount, getBlockNum(OldCount,
                             name(Label:K, S:String), .K, Cho),
              collectNewSpecMap(name(Label:K, S:String),
              Cho, OldCount), blockExecution(OldId:K, BE:List),
                 mergeBackInstQueue(AnyQueue))
             ~> dynNoResult(undef) ...</k>
        <toExecute> blockExecution(OldId:K, BE:List) => .K </toExecute>
        <instQueue> AnyQueue:K => instList(.List) </instQueue>
        <prevBlock> PrevB:K => basicBlockNum(OldCount:Int, Name:K) </prevBlock>
        <currBlock> basicBlockNum(OldCount:Int, Name:K)
            => basicBlockNum(getBlockNum(OldCount,
                             name(Label:K, S:String), .K, Cho)
                         ,name(Label:K, S:String)) </currBlock>
        <specRegisters> SRM:Map => cutOffRegs(OldCount, .K, .K, SRM) </specRegisters>
        <registers> RM:Map => updateMapByMap(RM, .K, .K,
                              getOffRegs(OldCount, .K, .K, SRM)) </registers>
        <specChoice> allowChoice(Cho:Map) => holdChoice(Cho) </specChoice>
        <currModule> ModName:SymbolicValueRef </currModule>
        <funModuleName> ModName </funModuleName>
        <currFunction> FunName </currFunction>
        <functionName> FunName </functionName>
        <basicBlocks>... name(Label:K, S:String)
                 |-> blockContent(Body:Map, _:Bool, _:Set,
                  _:Set, _:Set, _:Set, _:Set, _:Set, _:Set) ...</basicBlocks>
        requires inChoiceMap(OldCount, name(Label:K, S:String), .K, Cho)

     rule <k> setSpecChoice(Old:Int, New:Int,
                   newSpecMap(M:Map, S:Set), Ex:K, Queue:K)
                => setExecutionInst(New, S, correctNewBlock(Ex, S),
                   removeFailSpec(Queue, S)) ...</k>
          <specChoice> holdChoice(Cho:Map)
                         => allowChoice(M) </specChoice>
          <reverseChoice> Rev:Map => collectNewMap(Rev, .K, S) </reverseChoice>
          <restChoice> RM:Map => cutItemInMap(
                         collectNewMap(RM, .K, S), .K, S) </restChoice>

     rule <k> setExecutionInst(New:Int, S:Set, 
             blockExecution(NewId:K, L:List), Queue:K) => .K ...</k>
          <toExecute> OldEx:K => blockExecution(NewId:K, L:List) </toExecute>
          <instQueue> OldQueue:K => Queue </instQueue>

     rule <k> setExecutionInst(New:Int, S:Set,
                          findNewBlock, Queue:K) => .K ...</k>
          <instQueue> OldQueue:K => Queue </instQueue>
          <restChoice> RM:Map </restChoice>
         <currBlock> basicBlockNum(BN:Int, CurLabel:K) </currBlock>
         requires notBool hasRestBlocks(.K, RM)

     rule <k> setExecutionInst(New:Int, S:Set,
                          findNewBlock, Queue:K) => .K ...</k>
          <toExecute> OldEx:K =>
               blockExecutionAux(findNextBlock(New, Cho, RM)) </toExecute>
          <instQueue> OldQueue:K => Queue </instQueue>
          <specChoice> allowChoice(Cho:Map)
                       => holdChoice(Cho) </specChoice>
          <restChoice> RM:Map </restChoice>
         <blockCount> Count:Int </blockCount> 
         <currBlock> basicBlockNum(BN:Int, CurLabel:K) </currBlock>
         requires hasRestBlocks(.K, RM) andBool (Count -Int maxSpecGap <Int BN)

    //deal with invokebr
    rule invokeBr(L1:K, L1:K) => unconditional(L1)
    rule V:KResult ~> invokeBr(L1:K, L1:K) => unconditional(L1) ~> waitForBranch(V)
    rule dynNoResult(undef) ~> waitForBranch(V:KResult) => V

    rule
        <k> conditional(I:Int, Label:K, _)
            => unconditional(Label:K) ...</k>
        requires normalizingInt(integerType(1), I) ==K 1
    rule
        <k> conditional(I:Int, _, Label:K)
            => unconditional(Label:K) ...</k>
        requires normalizingInt(integerType(1), I) ==K 0

/*
    rule
        <k> unconditional(name(Label:K, S:String))
                => blockExecution(setBlock(name(Label:K, S:String))
                           ~> getValueFromBlockMap(0,B)) </k>
        <currModule> ModName:SymbolicValueRef </currModule>
        <funModuleName> ModName </funModuleName>
        <currFunction> FunName:SymbolicValueRef </currFunction>
        <functionName> FunName </functionName>
        <basicBlocks>... name(Label:K, S:String)
                             |-> blockContent(B:Map, _:Set, _:Set, _:Set,
                                           _:Set, _:Set, _:Set, _:Set) ...</basicBlocks>
*/
    // TODO put static switch information into a map like with phi nodes
    // TODO semantic design pattern: list traversal -> statically storing info and using simple rules later
    rule [switch-start]:
        switch(integerType(N:Int), I:Int, Label:K, L:List)
            => switchAux(normalizingInt(integerType(N:Int), I), Label, L)

    rule [switch-default]:
        switchAux(I:Int, DL:K, .List) => unconditional(DL)

    rule [switch-hit]:
        switchAux(I:Int, _, ListItem(typedCase(It:K, I:Int, Label:K)) L:List)
            => unconditional(Label:K)

    rule [switch-miss]:
        switchAux(I:Int, DL:K, ListItem(typedCase(It:K, I':Int, Label:K)) L:List)
            => switchAux(I, DL, L)
        requires I =/=Int I'

    rule [indirect-hit]:
        <k> indirectbr(loc(FunCount:Int, Ty:K, value(FunCount, FunCount), heap,
           blockAddVal(X:SymbolicValueRef, Y:SymbolicValueRef), none), Es:List)
          => unconditional(Y) ...</k>
        <currFunction> X </currFunction>
        requires Y in Es

    rule [indirect-failed-A]:
        <k> indirectbr(loc(FunCount':Int, Ty:K, value(FunCount, FunCount), heap,
           blockAddVal(X:SymbolicValueRef, Y:SymbolicValueRef), none), Es:List) ~> K:K 
               => .K </k>
        <output>... .List => ListItem("error: undefined bahavior due to try to load address different from the allowed block address name.") </output>
        requires FunCount' =/=Int FunCount

    rule [indirect-failed-B]:
        <k> indirectbr(loc(FunCount':Int, Ty:K, value(FunCount, FunCount), heap,
                  none, none), Es:List) ~> K:K => .K </k>
        <output>... .List => ListItem("error: undefined bahavior due to indirectbr branching to a address that is not a block address name.") </output>
        requires FunCount' =/=Int FunCount

    rule [indirect-failed-C]:
        <k> indirectbr(loc(FunCount':Int, Ty:K, value(FunCount, FunCount), heap,
                  blockAddVal(X:SymbolicValueRef, Y:SymbolicValueRef), none), Es:List) ~> K:K
               => .K ...</k>
        <currFunction> X':SymbolicValueRef </currFunction>
        <output>... .List => ListItem("error: undefined bahavior due to indirectbr branching to a block address name in different function.") </output>
        requires X =/=K X'

    rule [indirect-failed-C]:
        <k> indirectbr(loc(FunCount':Int, Ty:K, value(FunCount, FunCount), heap,
                  blockAddVal(X:SymbolicValueRef, Y:SymbolicValueRef), none), Es:List) ~> K:K
          => .K ...</k>
        <currFunction> X:SymbolicValueRef </currFunction>
        <output>... .List => ListItem("error: undefined bahavior due to indirectbr branching to a block address name that is not specified in the indirectbr label list.") </output>
        requires notBool Y in Es

endmodule
