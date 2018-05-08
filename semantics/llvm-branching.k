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
          selectPhis(OldCount,Name,formInstList(1, .K, Body)))
              ~> dynNoResult(undef) ...</k>
        <toExecute> Ex:K => .K </toExecute>
        <instQueue> AnyQueue:K => instList(.List) </instQueue>
        <currBlock> basicBlockNum(OldCount:Int, Name:K)
            => basicBlockNum(Count,name(Label:K, S:String)) </currBlock>
        <specTree> Cho:Map </specTree>
        <specRegisters> SRM:Map => .Map </specRegisters>
        <registers> RM:Map => updateMapByMap(RM, .K, .K,
                            getNewRootSpecMap(OldCount, .K, .K, SRM)) </registers>
        <blockCount> Count:Int => Count +Int 1 </blockCount>
        <currModule> ModName:SymbolicValueRef </currModule>
        <funModuleName> ModName </funModuleName>
        <currFunction> FunName </currFunction>
        <functionName> FunName </functionName>
        <basicBlocks>... name(Label:K, S:String)
                 |-> blockContent(Body:Map, _:Bool, _:Set,
                  _:Set, _:Set, _:Set, _:Set, _:Set, _:Set) ...</basicBlocks>
        requires notBool inChoiceMap(name(Label:K, S:String),OldCount, .K, Cho)

    rule <k> unconditional(name(Label:K, S:String)) =>
                   dynNoResult(undef) ...</k>
        <toExecute> BlockEx:K => checkToKillBlockEx(getBlockNum(
               name(Label:K, S:String),OldCount, .K, Cho), BlockEx,
            getChildrenOfBlock(getBlockNum(
               name(Label:K, S:String),OldCount, .K, Cho),.K,Cho),Cho, RestM) </toExecute>
        <instQueue> instList(Insts:List)
               => instList(getNewSpecOps(getChildrenOfBlock(getBlockNum(
               name(Label:K, S:String),OldCount, .K, Cho)
                    ,.K,Cho),.K,Insts)) </instQueue>
        <currBlock> basicBlockNum(OldCount:Int, Name:K)
            => basicBlockNum(getBlockNum(name(Label:K, S:String),OldCount, .K, Cho)
                         ,name(Label:K, S:String)) </currBlock>
        <specTree> Cho:Map </specTree>
        <restChoice> RestM:Map </restChoice>
        <specRegisters> SRM:Map => getNewSpecMap(OldCount,
           getChildrenOfBlock(getBlockNum(
               name(Label:K, S:String),OldCount, .K, Cho)
                    ,.K ,Cho), .K, .K, SRM) </specRegisters>
        <registers> RM:Map => updateMapByMap(RM, .K, .K,
                           getNewRootSpecMap(getBlockNum(
               name(Label:K, S:String),OldCount, .K, Cho), .K, .K, SRM)) </registers>
        <currModule> ModName:SymbolicValueRef </currModule>
        <funModuleName> ModName </funModuleName>
        <currFunction> FunName </currFunction>
        <functionName> FunName </functionName>
        <basicBlocks>... name(Label:K, S:String)
                 |-> blockContent(Body:Map, _:Bool, _:Set,
                  _:Set, _:Set, _:Set, _:Set, _:Set, _:Set) ...</basicBlocks>
        requires inChoiceMap(name(Label:K, S:String), OldCount, .K, Cho)

    //deal with invokebr and resume back from invoke
    rule invokeBr(L1:K, L1:K) => unconditional(L1)
    rule V:KResult ~> invokeBr(L1:K, L1:K) => unconditional(L1) ~> waitForBranch(V)
    rule dynNoResult(undef) ~> waitForBranch(V:KResult) => V

    rule <k> isResumeVal(A:K) ~> invokeNoRet => .K ...</k>
         <expResume> X:K => A </expResume>
    rule <k> isResumeVal(A:K) ~> invokeRet => undef ...</k>
         <expResume> X:K => A </expResume>

    rule invokeNoRet => .K
    rule V:KResult ~> invokeRet => V
         requires notBool isResumeVal(V)

    rule
        <k> conditional(I:Int, Label:K, _)
            => unconditional(Label:K) ...</k>
        requires normalizingInt(integerType(1), I) ==K 1
    rule
        <k> conditional(I:Int, _, Label:K)
            => unconditional(Label:K) ...</k>
        requires normalizingInt(integerType(1), I) ==K 0

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
