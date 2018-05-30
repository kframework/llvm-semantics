//
requires "llvm-syntax.k"
requires "llvm-abstractsyntax.k"
requires "llvm-settings.k"
requires "llvm-helpers.k"
requires "llvm-standard-library-syntax.k"
requires "llvm-syscalls-syntax.k"
requires "llvm-configuration.k"

module LLVM-CALL-RET
    imports LLVM-SYNTAX
    imports LLVM-ABSTRACTSYNTAX
    imports LLVM-SETTINGS
    imports LLVM-HELPERS
    imports LLVM-STANDARD-LIBRARY-SYNTAX
    imports LLVM-SYSCALLS-SYNTAX
    imports LLVM-CONFIGURATION

    syntax KItem ::= frame(K, Bag, Bag)
    syntax KItem ::= bind(ElemList, ElemList)

    rule arguments(L:ElemList) => L

    //rule typedArg(A:K, T:K, V:K) => V

    // TODO: rename tail
    // grabbing argument names
    // figuring out right function body (grab first bb)
    // add frame to call stack
    // replacing control cell with new cell

    // pushframe/popframe
    //
    // TODO would like to use ACTUAL control cell sitting on top of the stack, but can't have cells in lists and use context transformers
    // TODO would like to use ACTUAL control cell sitting on top of the stack, but can't have cells in lists and use context transformers
    // TODO bind term to variable even if term has inner rewrites
    // TODO ... on RHS to reset cell
    // TODO assuming single module

    // TODO perhaps another semantic design pattern: idea of context switching: pushing on a stack, doing something, and then popping from the stack
    //need to modify the context switching to implement inalloca easily.

    //function call find pointer
    rule <k> call(A:K, calleeValue(loc(P:Int,pointerTypeValue(T:K, Ad:Int),
                        value(P:Int,P:Int), RT:K, BA:K, D:K), Args:ElemList))
         => call(A, calleeValue(V, Args)) ...</k>
            <cbd>... aLoc(P, pointerTypeValue(T, Ad:Int), heap) |-> value(T, V:K) ...</cbd>

    rule <k> call(A:K, calleeValue(loc(P:Int,T:K,
                        value(P1:Int,P2:Int), RT:K, BA:K, C:K), Args:ElemList)) ~> K:K 
              => .K </k>
         <output>... .List
                => ListItem("error: function pointer pointing to bad place.") </output>
         (<tomasulo>
            D:Bag
         </tomasulo> =>  <tomasulo>...
                        <instQueue> instList(.List) </instQueue>
                          ...</tomasulo>)
         requires P <Int P1 orBool P >Int P2

    rule <k> call(A:K, calleeValue(loc(P:Int,pointerTypeValue(T:K, Ad:Int),
                        value(P:Int,P:Int), RT:K, BA:K, C:K), Args:ElemList)) ~> K:K 
              => .K </k>
            <cbd>... aLoc(P, pointerTypeValue(T, Ad:Int), heap) |-> value(T', V:K) ...</cbd>
         <output>... .List
                => ListItem("error: function pointer pointing to wrong function type.") </output>
         (<tomasulo>
            D:Bag
         </tomasulo> =>  <tomasulo>...
                        <instQueue> instList(.List) </instQueue>
                          ...</tomasulo>)
         requires T =/=K T'

    rule <k> call(A:K, calleeValue(loc(P:Int,T:K,
                        value(P:Int,P:Int),RT:K, BA:K,C:K), Args:ElemList)) ~> K:K 
              => .K </k>
          <cbd> M:Map </cbd>
         <output>... .List
                => ListItem("error: no such function for the place or function has wrong type.") </output>
         (<tomasulo>
            D:Bag
         </tomasulo> =>  <tomasulo>...
                        <instQueue> instList(.List) </instQueue>
                          ...</tomasulo>)
         requires notBool aLoc(P, T, heap) in keys(M)

    rule
        <k> call(_, calleeValue(funptr(FunName), Args:KResult)) ~> Tail:K
            => contextSwitch(FunName, Tail)
            ~> bind(Args, Formals)
            ~> startInitBlock(IBBName)
        </k>
        <currModule> ModName:SymbolicValueRef </currModule>
        <funModuleName> ModName </funModuleName>
        <functionName> FunName </functionName>
        <formalParameters> arguments(Formals:ElemList) </formalParameters>
        <initialBasicBlock> IBBName:SymbolicValueRef </initialBasicBlock>
        [large]

    //invoke finds pointer
    rule <k> invoke(A:K, calleeValue(loc(P:Int,pointerTypeValue(T:K, Ad:Int),
                        value(P:Int,P:Int), RT:K, BA:K, D:K), Args:ElemList), L1:K, L2:K, FL:K)
         => invoke(A, calleeValue(V, Args), L1:K, L2:K, FL:K) ...</k>
            <cbd>... aLoc(P, pointerTypeValue(T, Ad:Int), heap) |-> value(T, V:K) ...</cbd>

    rule <k> invoke(A:K, calleeValue(loc(P:Int,T:K,
               value(P1:Int,P2:Int), RT:K, BA:K, C:K), Args:ElemList), L1:K, L2:K, FL:K) ~> K:K 
              => .K </k>
         <output>... .List
                => ListItem("error: invoke function pointer pointing to bad place.") </output>
         (<tomasulo>
            D:Bag
         </tomasulo> =>  <tomasulo>...
                        <instQueue> instList(.List) </instQueue>
                          ...</tomasulo>)
         requires P <Int P1 orBool P >Int P2

    rule <k> invoke(A:K, calleeValue(loc(P:Int,pointerTypeValue(T:K, Ad:Int),
              value(P:Int,P:Int), RT:K, BA:K, C:K), Args:ElemList), L1:K, L2:K, FL:K) ~> K:K 
              => .K </k>
            <cbd>... aLoc(P, pointerTypeValue(T, Ad:Int), heap) |-> value(T', V:K) ...</cbd>
         <output>... .List
                => ListItem("error: invoke function pointer pointing to wrong function type.") </output>
         (<tomasulo>
            D:Bag
         </tomasulo> =>  <tomasulo>...
                        <instQueue> instList(.List) </instQueue>
                          ...</tomasulo>)
         requires T =/=K T'

    rule <k> invoke(A:K, calleeValue(loc(P:Int,T:K,
              value(P:Int,P:Int),RT:K, BA:K,C:K), Args:ElemList), L1:K, L2:K, FL:K) ~> K:K 
              => .K </k>
          <cbd> M:Map </cbd>
         <output>... .List
                => ListItem("error: no such invoke function for the place or function has wrong type.") </output>
         (<tomasulo>
            D:Bag
         </tomasulo> =>  <tomasulo>...
                        <instQueue> instList(.List) </instQueue>
                          ...</tomasulo>)
         requires notBool aLoc(P, T, heap) in keys(M)

    rule
        <k> invoke(_, calleeValue(funptr(FunName), Args:ElemList), L1:K, L2:K, FL:K) ~> Tail:K
            => contextSwitch(FunName, FL ~> (invokeBr(L1, L2) ~> Tail))
            ~> bind(Args, Formals)
            ~> startInitBlock(IBBName)
        </k>
        <currModule> ModName:SymbolicValueRef </currModule>
        <funModuleName> ModName </funModuleName>
        <functionName> FunName </functionName>
        <formalParameters> arguments(Formals:ElemList) </formalParameters>
        <initialBasicBlock> IBBName:SymbolicValueRef </initialBasicBlock>
        [large]

    rule <k> blockExecution(A:K, B:List) => .K ...</k>
         <toExecute> _:K => blockExecution(A:K, B:List) </toExecute>

    //moving instruction into instQueue if it is not full
    rule <toExecute> blockExecution(basicBlockNum(N:Int, _:K),
               (ListItem(instNumInfo(Num:Int, In:K, T:K)) L:List => L)) ...</toExecute>
         <instQueue> instList(InQueue:List =>
                         InQueue ListItem(dynInstInfo(N, Num,
                               updateVarInTerm(CurN, N, In, M', M,
                Rev (CurN |-> runBlock(
                   CurId, CurL, FaId, MemL, Defs, Childs))), T))) </instQueue>
         <registers> M:Map </registers>
         <specRegisters> M':Map </specRegisters>
         <specTree> Rev:Map (CurN |-> runBlock(CurId:Int,CurL:K, FaId:K, 
            MemL:List, (Defs:Set => Defs getDefVar(In)), Childs:Set)) </specTree>
         <currBlock> basicBlockNum(CurN:Int, CurLabel:K) </currBlock>
         requires size(InQueue) <Int numOfMaxInQueue andBool T =/=K terminators
         [transition]

    //this rule is to do a speculative move by guessing a next block to execute.
    rule <toExecute> blockExecution(basicBlockNum(N:Int, Name:K),
               ListItem(instNumInfo(Num:Int,
                     noAssign(instruction(In:K, Attrs:Set, Meta:K)), terminators)))
            => blockExecution(basicBlockNum(Count, guessNextBlock(In)),
               selectPhis(N,Name,formInstList(1, .K, Body))) ...</toExecute>
         <registers> M:Map </registers>
         <specRegisters> M':Map </specRegisters>
         <instQueue> instList(InQueue:List => InQueue ListItem(dynInstInfo(N, Num,
             updateVarInTerm(BN, N, noAssign(instruction(In:K,
               Attrs:Set, Meta:K)), M', M, Rev), terminators))) </instQueue>
         <currBlock> basicBlockNum(BN:Int, CurLabel:K) </currBlock>
         <blockCount> Count:Int => Count +Int 1 </blockCount> 
         <specTree> Rev:Map => 
             updateVarInSpecTree(formMemListWithMem(Count, guessNextBlock(In), N,
                    formInstList(1, .K, Body), VaLoc,
                  getVarsFromVarOp(.K, OutDef -Set InDef),
                       addChildToKey(Rev, N, Count)), BN, .K,.K, M',M, Rev) </specTree>
         <restChoice> RM:Map => RM[N:Int <- nextSpecs(getRestBlocks(In, .K,
                  (guessNextBlock(In) |-> blockContent(Body, Flag,
                    InEg, OutEgs, InDef, InUse, OutDef, OutUse, Use)) BM))] </restChoice>
         <vaList> value(_:K, VaLoc:Loc) </vaList>
        <currModule> ModName:SymbolicValueRef </currModule>
        <funModuleName> ModName </funModuleName>
        <currFunction> FunName:SymbolicValueRef </currFunction>
        <functionName> FunName </functionName>
        <basicBlocks> guessNextBlock(In) |-> blockContent(Body:Map,
                          Flag:Bool, InEg:Set, OutEgs:Set, InDef:Set,
                             InUse:Set, OutDef:Set, OutUse:Set, Use:Set) BM:Map </basicBlocks>
         requires size(InQueue) <Int numOfMaxInQueue andBool (Count -Int maxSpecGap) <Int BN
         [transition]

     //rules for speculative moves by choosing a different direction because of 
     //hitting return operators.
    rule <toExecute> blockExecution(basicBlockNum(N:Int, Name:K), .List)
             => findNewSpec(findNextBlock(BN, .K, .K, Rev, RM)) ...</toExecute>
         <specTree> Rev:Map </specTree>
         <restChoice> RM:Map </restChoice>
         <currBlock> basicBlockNum(BN:Int, CurLabel:K) </currBlock>

    //after branching jump we need to maintain the specTree
    rule <toExecute> blockHold(findNewSpec(none)) => blockHold(.K) ...</toExecute>

    rule <k> adjustMemList(OldCount:Int, NewCount:Int)
                   => adjustMemList(NewCount) ...</k>
         <toExecute> blockHold(.K) => .K ...</toExecute>
         <specTree> SPT:Map => cutOffWrongBranches(OldCount, NewCount, SPT) </specTree>

    rule <k> adjustMemList(OldCount:Int, NewCount:Int)
                   => adjustMemList(NewCount) ...</k>
         <toExecute> blockHold(blockExecution(OldId:K, BE:List))
                       => blockExecution(OldId:K, BE:List) ...</toExecute>
         <specTree> SPT:Map => cutOffWrongBranches(OldCount, NewCount, SPT) </specTree>

    rule <k> adjustMemList(OldCount:Int, NewCount:Int) => adjustMemList(NewCount) ...</k>
         <toExecute> blockHold(findNewSpec(selectSpec(Fa:Int, Name:K, Cs:Set)))
              => blockExecution(basicBlockNum(Count, Name),
            selectPhis(Fa, getFatherName(Fa, Rev), formInstList(1, .K, Body)))
                 ...</toExecute>
         <specTree> Rev:Map => cutOffWrongBranches(OldCount, NewCount,
                    formMemListWithMem(Count, Name, Fa,
             formInstList(1, .K, Body), VaLoc, getVarsFromVarOp(.K,
            OutDef -Set InDef), addChildToKey(Rev, Fa, Count))) </specTree>
         <restChoice> RM:Map => updateChoiceInMap(RM,Fa,Cs) </restChoice>
         <vaList> value(_:K, VaLoc:Loc) </vaList>
         <currBlock> blockHold(basicBlockNum(BN:Int, CurLabel:K)) </currBlock>
         <blockCount> Count:Int => Count +Int 1 </blockCount> 
         <currModule> ModName:SymbolicValueRef </currModule>
         <funModuleName> ModName </funModuleName>
         <currFunction> FunName:SymbolicValueRef </currFunction>
         <functionName> FunName </functionName>
         <basicBlocks>... Name |-> blockContent(Body:Map, _:Bool,
                _:Set, _:Set, InDef:Set, _:Set, OutDef:Set, _:Set, _:Set) ...</basicBlocks>
          [transition]

    //if we finishes inputing a block to input queue, and then we need to find new spec block
    rule <toExecute> findNewSpec(none) => .K ...</toExecute>

    rule <toExecute> findNewSpec(selectSpec(Fa:Int, Name:K, Cs:Set))
              => blockExecution(basicBlockNum(Count, Name),
            selectPhis(Fa, getFatherName(Fa, Rev), formInstList(1, .K, Body)))
                 ...</toExecute>
         <specTree> Rev:Map => formMemListWithMem(Count, Name, Fa,
             formInstList(1, .K, Body), VaLoc, getVarsFromVarOp(.K,
            OutDef -Set InDef), addChildToKey(Rev, Fa, Count)) </specTree>
         <restChoice> RM:Map => updateChoiceInMap(RM,Fa,Cs) </restChoice>
         <vaList> value(_:K, VaLoc:Loc) </vaList>
         <currBlock> basicBlockNum(BN:Int, CurLabel:K) </currBlock>
         <blockCount> Count:Int => Count +Int 1 </blockCount> 
         <currModule> ModName:SymbolicValueRef </currModule>
         <funModuleName> ModName </funModuleName>
         <currFunction> FunName:SymbolicValueRef </currFunction>
         <functionName> FunName </functionName>
         <basicBlocks>... Name |-> blockContent(Body:Map, _:Bool,
                _:Set, _:Set, InDef:Set, _:Set, OutDef:Set, _:Set, _:Set) ...</basicBlocks>
          [transition]

    rule <instQueue> instList(ListItem(A:K) L:List)
                      => splitQueue(.List, ListItem(A), L) </instQueue>
         <cpu> .K </cpu>
         [structural]

    rule <instQueue> splitQueue(.List, ListItem(dynInstInfo(BN:Int,
                        IN:Int, Inst:K, T:K)) Pre:List, L:List)
               => instList(Pre L) </instQueue>
         <cpu> .K => dynInstInfo(BN, IN, Inst, T) </cpu>
          requires (T ==K terminators) orBool (T ==K returnInst)
                   orBool (T ==K callInst) orBool (T ==K vaInst)
                    orBool (T ==K fenceInst)
         [structural]

    rule <instQueue> splitQueue(AV:List, ListItem(dynInstInfo(BN:Int,
                        IN:Int, Inst:K, T:K)) Pre:List, L:List)
               => instList(Pre L) </instQueue>
         <cpu> .K => dynInstInfo(BN, IN, Inst, T) </cpu>
          requires (T =/=K terminators) andBool (T =/=K returnInst)
                   andBool (T =/=K callInst) andBool (T =/=K vaInst)
                   andBool (T =/=K fenceInst)
         [transition]

    rule <instQueue> splitQueue(Av:List ListItem(dynInstInfo(BN:Int,
                  IN:Int, Inst:K, T:K)), Pre:List, L:List)
                   => instList(removeInst(BN,IN,Pre L)) </instQueue>
         <cpu> .K => dynInstInfo(BN, IN, Inst, T) </cpu>
         [transition]

    rule <instQueue> splitQueue(AV:List, Pre:List,
                ListItem(dynInstInfo(BN:Int, IN:Int, Inst:K, T:K)) L:List)
          => splitQueue(AV ListItem(dynInstInfo(BN:Int, IN:Int, Inst:K, T:K)),
              Pre ListItem(dynInstInfo(BN:Int, IN:Int, Inst:K, T:K)), L) </instQueue>
          requires (T =/=K terminators) andBool (T =/=K returnInst)
                  andBool (T =/=K callInst) andBool (T =/=K vaInst)
                    andBool (T =/=K fenceInst)
                    andBool (isAvailable(Inst))
         [transition]

    rule <instQueue> splitQueue(AV:List, Pre:List,
                ListItem(dynInstInfo(BN:Int, IN:Int, Inst:K, T:K)) L:List)
          => splitQueue(AV, Pre ListItem(dynInstInfo(BN:Int,
                                IN:Int, Inst:K, T:K)), L) </instQueue>
          requires (T ==K terminators) orBool (T ==K returnInst)
                  orBool (T ==K callInst) orBool (T ==K vaInst)
                   orBool (T ==K fenceInst)
                    orBool (notBool isAvailable(Inst))
         [transition]

    rule <cpu> dynInstInfo(BN:Int, IN:Int, Inst:K, T:K)
                 => dynInstHold(BN, IN, T) </cpu>
         <k> (.K => runDynInst(Inst)) ~> K:K </k>
        [transition]

    rule <k> runDynInst(dynResult(X:SymbolicValueRef, V:KResult)) => .K ...</k>
         <cpu> dynInstHold(BN:Int, IN:Int, T:K) => .K </cpu>
         <specRegisters> M:Map => M[varInstance(BN, X) <- V] </specRegisters>
         <registers> M':Map </registers>
         <currBlock> basicBlockNum(Cur:Int, _:K) </currBlock>
         <instQueue> instList(L:List => updateVarInList(Cur, BN,
               L, M[varInstance(BN, X) <- V], M', Rev)) </instQueue>
         <toCommit> memList(Ava:K, Ava':Set, Avb:List, Avb':List, CML:List, ML:List)
               => memList(Ava:K, Ava':Set, Avb:List, Avb':List,.List,
                    updateVarInList(Cur, BN, CML ML,
                       M[varInstance(BN, X) <- V], M', Rev)) </toCommit>
         <specTree> Rev:Map => updateVarInSpecTree(Rev, Cur, .K, .K,
                         M[varInstance(BN, X) <- V], M', Rev) </specTree>
         requires BN >Int Cur
         [transition]

    rule <k> runDynInst(dynResult(X:SymbolicValueRef, V:KResult)) => .K ...</k>
         <cpu> dynInstHold(BN:Int, IN:Int, T:K) => .K </cpu>
         <specRegisters> M:Map </specRegisters>
         <registers> M':Map => M'[X <- V] </registers>
         <currBlock> basicBlockNum(Cur:Int, _:K) </currBlock>
         <instQueue> instList(L:List => updateVarInList(Cur, BN,
               L, M, M'[X <- V], Rev)) </instQueue>
         <toCommit> memList(Ava:K, Ava':Set, Avb:List, Avb':List, CML:List, ML:List)
               => memList(Ava:K, Ava':Set, Avb:List, Avb':List, .List,
                       updateVarInList(Cur, BN,
                        CML ML, M, M'[X <- V], Rev)) </toCommit>
         <specTree> Rev:Map => updateVarInSpecTree(Rev, Cur, .K, .K,
                         M, M'[X <- V], Rev) </specTree>
         requires BN <=Int Cur
         [transition]

    rule <k> runDynInst(dynNoResult(V:KResult)) => .K ...</k>
         <cpu> dynInstHold(BN:Int, IN:Int, T:K) => .K </cpu>
        [transition]

    syntax KItem ::= contextSwitch(K, K)

    rule
        <k> contextSwitch(FunName, Tail) => .K ...</k>
        (<control>
            C:Bag
        </control> =>
        <control>...
            <currFunction> FunName:SymbolicValueRef </currFunction>
        ...</control>)
        (<tomasulo>
            D:Bag
           <toCommit> memList(.K, .Set, .List, .List, .List, .List) </toCommit>
         </tomasulo>
         =>
         <tomasulo>...
           <instQueue> instList(.List) </instQueue>
           <toCommit> memList(.K, .Set, .List, .List, .List, .List) </toCommit>
         ...</tomasulo>)
        <callStack> .List => ListItem(frame(Tail, C, D)) ...</callStack>


    // TODO perhaps a pattern: turning a list of pairs into a map

    // might need a way to convert nonmatching types here?  depends on semantics
    rule
        <k> bind((valValue(typedArg(_, _, Arg:K)), Args:ElemList),
                    (valValue(typedArg(_, _, Formal:K)), Formals:ElemList))
            => stacticAssign(Formal, Arg)
            ~> bind(Args, Formals)
        ...</k>
    rule
        <k> bind(.ElemList, .ElemList) => .K ...</k>

    rule bind((valValue(typedArg(S:Set, T:K, Arg:K)), Args:ElemList),
               (valValue(vaListType),Formals:ElemList))
           => vaListCal('structType(formTypeList(
              getAllTypes(valValue(
                 typedArg(S:Set, T:K, Arg:K)), Args:ElemList))),
                  alloca('structType(formTypeList(
              getAllTypes(valValue(
                 typedArg(S:Set, T:K, Arg:K)), Args:ElemList))), 1, 0, 1, false),
                constantStruct(formOperandList(valValue(
                 typedArg(S:Set, T:K, Arg:K)), Args:ElemList)))

    rule <k> vaListCal(T:KResult, Loc:Loc, V:KResult)
          => staticStore(T, V, pointerTypeValue(T, 0), Loc, 1) ...</k>
         <vaList> K:K => value(T,Loc) </vaList>
                   
/*
    rule
        <k> bind((valValue(typedArg(_, _, Arg:K)), L:ElemList
                  => L), val(vararg)) ...</k>
        <valist>... .List => ListItem(Arg) </valist>

    rule
        <k> bind(.ElemList, val(vararg)) => .K ...</k>
*/

    // TODO this isn't great.  would be better to check type when doing the call/returning and handle appropriately

    rule <k> resume(T:KResult, V:KResult) ~> _
            => clearLocalMemory(.K, Locals)
            ~> (initializer(T, V)
            ~> (clearResume
            ~> Tail))
        </k>
        <callStack> ListItem(frame(Tail:K, C:Bag, D:Bag)) => .List ...</callStack>
        <control> <localMemory> Locals:Set </localMemory> _ => C </control>
        <tomasulo> _:Bag => D </tomasulo>

    // TODO rename Tail
    rule
        <k> ret(T:KResult, V:KResult) ~> _
            => clearLocalMemory(.K, Locals)
            ~> (initializer(T, V)
            ~> (clearVoid
            ~> Tail))
        </k>
        <callStack> ListItem(frame(Tail:K, C:Bag, D:Bag)) => .List ...</callStack>
        <control> <localMemory> Locals:Set </localMemory> _ => C </control>
        <tomasulo> _:Bag => D </tomasulo>

    rule clearLocalMemory(.K, .Set) => .K
    rule clearLocalMemory(.K, SetItem(A:K) S:Set) => clearLocalMemory(A, S)
    rule
        <k> clearLocalMemory((Base:Int => .K), _) ...</k>
        <threadId> Tid </threadId>
        <stackThreadId> Tid:Int </stackThreadId> 
        <stackList> SL:List => removeLocalStack(Base, SL) </stackList>
        (<stackObject>...
            <stackChunckRange> value(Base:Int, X:K) </stackChunckRange>
           ...</stackObject> => .Bag)

    rule
        <k> clearLocalMemory((inAlloca(Base:Int) => .K), _) ...</k>
        <threadId> Tid </threadId>
        <stackThreadId> Tid:Int </stackThreadId> 
        <stackList> SL:List => removeLocalStack(Base, SL) </stackList>
        (<stackObject>...
           <stackChunckRange> value(Base:Int, X:K) </stackChunckRange>
          ...</stackObject> => .Bag)

    rule initializer(void, V:K) ~> clearVoid => .K
    rule initializer(T:K, V:KResult) ~> clearVoid => V
         when T =/=K void

    rule initializer(void, V:K) ~> clearResume => resumeVal(undef)
    rule initializer(T:K, V:KResult) ~> clearResume => resumeVal(V)
         when T =/=K void

endmodule
