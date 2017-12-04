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

    syntax KItem ::= frame(K, Bag)
    syntax KItem ::= bind(ElemList, ElemList)

    rule arguments(L:ElemList) => L

    rule arg(A:K, T:K, V:K) => V

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

    rule
        <k> call(_, calleeValue(funptr(FunName:SymbolicValueRef), Args:ElemList)) ~> Tail:K
            => contextSwitch(FunName, Tail)
            ~> bind(Args, Formals)
            ~> setBlock(basicBlockNum(Count, IBBName)) ~>
               blockExecution(basicBlockNum(Count, IBBName), formInstList(1, .K, Body))
        </k>
        <blockCount> Count:Int => Count +Int 1 </blockCount>
        <currModule> ModName:SymbolicValueRef </currModule>
        <funModuleName> ModName </funModuleName>
        <currFunction> FunName:SymbolicValueRef </currFunction>
        <functionName> FunName </functionName>
        <formalParameters> arguments(Formals:ElemList) </formalParameters>
        <initialBasicBlock> IBBName:SymbolicValueRef </initialBasicBlock>
        <basicBlocks>... IBBName
                            |-> blockContent(Body:Map, _:Set, _:Set, _:Set,
                                            _:Set, _:Set, _:Set, _:Set) ...</basicBlocks>
        [large]

    //moving instruction into instQueue if it is not full
    rule <k> blockExecution(basicBlockNum(N:Int, _:K),
               (ListItem(instNumInfo(Num:Int, In:K, T:K)) L:List => L)) ...</k>
         <instQueue> instList(InQueue:List =>
                         InQueue ListItem(dynInstInfo(N, Num,
                               updateVarInTermMap(In, M), T))) </instQueue>
         <reserveReg> M:Map => removeEntry(M, In) </reserveReg>
         requires size(InQueue) <Int numOfMaxInQueue andBool T =/=K terminators
         [transition]

    //this rule is to do a speculative move by guessing a next block to execute.
    rule <k> blockExecution(basicBlockNum(N:Int, Name:K),
               ListItem(instNumInfo(Num:Int, instruction(In:K, Attrs:Set, Meta:K), terminators)))
            => blockExecution(basicBlockNum(Count, guessNextBlock(In)),
               formInstList(1, .K, Body)) ...</k>
         <instQueue> instList(InQueue:List => InQueue ListItem(dynInstInfo(N, Num,
             updateVarInTermMap(instruction(In:K, Attrs:Set, Meta:K), M), terminators))) </instQueue>
         <reserveReg> M:Map => removeEntry(M, In) </reserveReg>
         <currBlock> basicBlockNum(BN:Int, CurLabel:K) </currBlock>
         <blockCount> Count:Int => Count +Int 1 </blockCount> 
         <specChoice> allowChoice(Chi:List => Chi ListItem(selectSpec(basicBlockNum(N, Name),
                      SetItem(basicBlockNum(Count, guessNextBlock(In))),
                      SetItem(guessNextBlock(In)), getAllBrBlocks(In)))) </specChoice>
        <currModule> ModName:SymbolicValueRef </currModule>
        <funModuleName> ModName </funModuleName>
        <currFunction> FunName:SymbolicValueRef </currFunction>
        <functionName> FunName </functionName>
        <basicBlocks>... guessNextBlock(In)
                            |-> blockContent(Body:Map, _:Set, _:Set, _:Set,
                                            _:Set, _:Set, _:Set, _:Set) ...</basicBlocks>
         requires size(InQueue) <Int numOfMaxInQueue andBool Count -Int maxSpecGap <Int BN
         [transition]

     //rules for speculative moves by choosing a different direction because of 
     //hitting return operators.
    rule <k> blockExecution(basicBlockNum(N:Int, Name:K), .List)
              => blockExecutionAux(findNextBlock(.List, Chi)) ...</k>
         <specChoice> allowChoice(Chi:List)
                      => holdChoice(Chi) </specChoice>
          [structural]

    rule <k> blockExecutionAux(selectResult(basicBlockNum(PreCount:Int, PreName:K),
                    Name:K, Chi':List))
            => blockExecution(basicBlockNum(Count, Name),
               formInstList(1, .K, Body)) ...</k>
         <currBlock> basicBlockNum(BN:Int, CurLabel:K) </currBlock>
         <blockCount> Count:Int => Count +Int 1 </blockCount> 
         <specChoice> holdChoice(Chi:List)  => allowChoice(
                      insertBlockNum(basicBlockNum(PreCount:Int, PreName:K),
                       basicBlockNum(Count, Name), Chi')) </specChoice>
         <currModule> ModName:SymbolicValueRef </currModule>
         <funModuleName> ModName </funModuleName>
         <currFunction> FunName:SymbolicValueRef </currFunction>
         <functionName> FunName </functionName>
         <basicBlocks>... Name |-> blockContent(Body:Map, _:Set, _:Set, _:Set,
                                _:Set, _:Set, _:Set, _:Set) ...</basicBlocks>
          requires Count -Int maxSpecGap <Int BN
         [transition]

    rule <instQueue> instList(ListItem(A:K) L:List)
                      => splitQueue(.List, ListItem(A), L) </instQueue>
         <cpu> .K </cpu>
         [structural]

    rule <instQueue> splitQueue(AV:List, ListItem(dynInstInfo(BN:Int,
                        IN:Int, Inst:K, T:K)) Pre:List, L:List)
               => instList(Pre L) </instQueue>
         <cpu> .K => dynInstInfo(BN, IN, Inst, T) </cpu>
          requires (T ==K terminators) orBool (T ==K returnInst)
         [structural]

    rule <instQueue> splitQueue(Av:List ListItem(dynInstInfo(BN:Int,
                  IN:Int, Inst:K, T:K)), L:List, .List)
                   => instList(removeInst(BN,IN,L)) </instQueue>
         <cpu> .K => dynInstInfo(BN, IN, Inst, T) </cpu>
         [transition]

    rule <instQueue> splitQueue(AV:List, ListItem(dynInstInfo(BN:Int,
                        IN:Int, Inst:K, T:K)) Pre:List, L:List)
               => instList(Pre L) </instQueue>
         <cpu> .K => dynInstInfo(BN, IN, Inst, T) </cpu>
          requires (T =/=K terminators) andBool (T =/=K returnInst)
         [transition]

    rule <instQueue> splitQueue(AV:List, Pre:List,
                ListItem(dynInstInfo(BN:Int, IN:Int, Inst:K, T:K)) L:List)
               => instList(Pre L) </instQueue>
         <cpu> .K => dynInstInfo(BN, IN, Inst, T) </cpu>
          requires (T =/=K terminators) andBool (T =/=K returnInst)
                  andBool (T =/=K callInst) andBool (isAvailable(Inst))
         [transition]

    rule <instQueue> splitQueue(AV:List, Pre:List,
                ListItem(dynInstInfo(BN:Int, IN:Int, Inst:K, T:K)) L:List)
          => splitQueue(AV ListItem(dynInstInfo(BN:Int, IN:Int, Inst:K, T:K)),
              Pre ListItem(dynInstInfo(BN:Int, IN:Int, Inst:K, T:K)), L) </instQueue>
          requires (T =/=K terminators) andBool (T =/=K returnInst)
                  andBool (T =/=K callInst) andBool (isAvailable(Inst))
         [transition]

    rule <instQueue> splitQueue(AV:List, Pre:List,
                ListItem(dynInstInfo(BN:Int, IN:Int, Inst:K, T:K)) L:List)
          => splitQueue(AV, Pre ListItem(dynInstInfo(BN:Int,
                                IN:Int, Inst:K, T:K)), L) </instQueue>
          requires (T ==K terminators) orBool (T ==K returnInst)
                  orBool (T ==K callInst) orBool (notBool isAvailable(Inst))
         [structural]

    rule <cpu> dynInstInfo(BN:Int, IN:Int, Inst:K, T:K)
                 => dynInstHold(BN, IN, T) </cpu>
         <k> (.K => runDynInst(Inst)) ~> K:K </k>
 
    rule <k> runDynInst(dynResult(X:SymbolicValueRef, V:KResult)) => .K ...</k>
         <cpu> dynInstHold(BN:Int, IN:Int, T:K) => .K </cpu>
         <reserveReg> M:Map => M[X <- V] </reserveReg>
         <instQueue> instList(L:List => updateVarInList(L, X, V)) </instQueue> 
         requires notBool hasDefInList(L, X)

    rule <k> runDynInst(dynResult(X:SymbolicValueRef, V:KResult)) => .K ...</k>
         <cpu> dynInstHold(BN:Int, IN:Int, T:K) => .K </cpu>
         <instQueue> instList(L:List => updateVarInList(L, X, V)) </instQueue> 
         requires hasDefInList(L, X)

/*
    rule <k> blockExecution(L:List) => blockHOLE ...</k>
         <instQueue> InQueue:List => L </instQueue>
         <rob> ROB:List => .List </rob>
         <toCommit> ToCom:List => .List </toCommit>
         <cdb> CDB:List => .List </cdb>
         <reservations> Res:List => .List </reservations>
         <loads> Lo:List => .List </loads>
         <blockCount> N:Int => 1 </blockCount>
         <currBlock> Label':K => basicBlockNum(0, Label) </currBlock>
         <prevBlock> _ => Label' </prevBlock>
         <specNextBlockMap> TheMap:Map => .Map </specNextBlockMap>
         <initialBasicBlock> Label:SymbolicValueRef </initialBasicBlock>

    rule <instQueue> (ListItem(N:KItem) => .List) L:List </instQueue>
         <rob> ROB:List (.List => ListItem(seqPoint(I, N, Inst))) </rob>
         <reservations> Res:List (.List => ListItem(seqPoint(I, N, Inst))) </reservations>
         <currBlock> basicBlockNum(I:Int, _:K) </currBlock>
         <currModule> ModName:SymbolicValueRef </currModule>
         <funModuleName> ModName </funModuleName>
         <currFunction> FunName:SymbolicValueRef </currFunction>
         <functionName> FunName </functionName>
         <instNumInfo>... N |->
                  instNumInfo(Inst:K, _:K, _:K, _:K, _:K, _:Set, InstL:K) ...</instNumInfo>
         requires size(Res) <=Int numOfReservations
                  andBool InstL =/=K terminators
                  andBool InstL =/=K returnInst
                  andBool InstL =/=K loadInst

    rule <instQueue> (ListItem(N:KItem) => .List) L:List </instQueue>
         <rob> ROB:List (.List => ListItem(seqPoint(I, N, Inst))) </rob>
         <loads> Res:List (.List => ListItem(seqPoint(I, N, Inst))) </loads>
         <currBlock> basicBlockNum(I:Int, _:K) </currBlock>
         <currModule> ModName:SymbolicValueRef </currModule>
         <funModuleName> ModName </funModuleName>
         <currFunction> FunName:SymbolicValueRef </currFunction>
         <functionName> FunName </functionName>
         <instNumInfo>... N |->
                  instNumInfo(Inst:K, _:K, _:K, _:K, _:K, _:Set, InstL:K) ...</instNumInfo>
         requires size(Res) <=Int numOfReservations
                  andBool InstL ==K loadInst

    rule <instQueue> ListItem(N:KItem) => .List </instQueue>
         <rob> ROB:List (.List => ListItem(seqPoint(I, N, Inst))) </rob>
         <currBlock> basicBlockNum(I:Int, _:K) </currBlock>
         <currModule> ModName:SymbolicValueRef </currModule>
         <funModuleName> ModName </funModuleName>
         <currFunction> FunName:SymbolicValueRef </currFunction>
         <functionName> FunName </functionName>
         <instNumInfo>... N |->
                  instNumInfo(Inst:K, _:K, _:K, _:K, _:K, _:Set, InstL:K) ...</instNumInfo>
         requires InstL ==K returnInst

    rule <instQueue> ListItem(N:KItem) => Body </instQueue>
         <rob> ROB:List (.List => ListItem(seqPoint(I', N, Inst))) </rob>
         <reservations> Res:List (.List => ListItem(seqPoint(I', N, Inst))) </reservations>
         <blockCount> I:Int => I +Int 1 </blockCount>
         <currBlock> basicBlockNum(I':Int, TheLabel:K)
                    => basicBlockNum(I, guessNextBlock(Inst)) </currBlock>
         <prevBlock> _ => basicBlockNum(I':Int, TheLabel:K) </prevBlock>
         <currModule> ModName:SymbolicValueRef </currModule>
         <funModuleName> ModName </funModuleName>
         <specNextBlockMap> M:Map => M[I' <- guessBlockPath(ListItem(I))] </specNextBlockMap>
         <currFunction> FunName:SymbolicValueRef </currFunction>
         <functionName> FunName </functionName>
         <basicBlocks>... guessNextBlock(Inst)
                            |-> blockContent(Body:List, _:Set, _:Set, _:Set,
                                            _:Set, _:Set, _:Set, _:Set) ...</basicBlocks>
         <instNumInfo>... N |->
                  instNumInfo(Inst:K, _:K, _:K, _:K, _:K, _:Set, InstL:K) ...</instNumInfo>
         requires size(Res) <=Int numOfReservations
                  andBool InstL ==K terminators
                  andBool notBool I' in keys(M)

    rule <instQueue> ListItem(N:KItem) => Body </instQueue>
         <rob> ROB:List (.List => ListItem(seqPoint(I', N, Inst))) </rob>
         <reservations> Res:List (.List => ListItem(seqPoint(I', N, Inst))) </reservations>
         <blockCount> I:Int => I +Int 1 </blockCount>
         <currBlock> basicBlockNum(I':Int, TheLabel:K)
                    => basicBlockNum(I, guessNextBlock(Inst)) </currBlock>
         <prevBlock> _ => basicBlockNum(I':Int, TheLabel:K) </prevBlock>
         <currModule> ModName:SymbolicValueRef </currModule>
         <funModuleName> ModName </funModuleName>
         <specNextBlockMap>... I' |->
                          guessBlockPath(BlockL:List => BlockL ListItem(I)) ...</specNextBlockMap>
         <currFunction> FunName:SymbolicValueRef </currFunction>
         <functionName> FunName </functionName>
         <basicBlocks>... guessNextBlock(Inst)
                            |-> blockContent(Body:List, _:Set, _:Set, _:Set,
                                            _:Set, _:Set, _:Set, _:Set) ...</basicBlocks>
         <instNumInfo>... N |->
                  instNumInfo(Inst:K, _:K, _:K, _:K, _:K, _:Set, InstL:K) ...</instNumInfo>
         requires size(Res) <=Int numOfReservations
                  andBool InstL ==K terminators
*/
    syntax KItem ::= contextSwitch(K, K)

    rule
        <k> contextSwitch(FunName, Tail) => .K ...</k>
        (<control>
            C:Bag
        </control> =>
        <control>...
            <currFunction> FunName:SymbolicValueRef </currFunction>
        ...</control>)
        <callStack> .List => ListItem(frame(Tail, C)) ...</callStack>


    // TODO perhaps a pattern: turning a list of pairs into a map

    // might need a way to convert nonmatching types here?  depends on semantics
    rule
        <k> bind((valValue(Arg:K), Args:ElemList), (val(arg(_, _, Formal:K)), Formals:ElemList))
            => assign(Formal, Arg)
            ~> bind(Args, Formals)
        ...</k>
    rule
        <k> bind(.ElemList, .ElemList) => .K ...</k>

    rule
        <k> bind((valValue(Arg:K), L:ElemList
                  => L), val(vararg)) ...</k>
        <valist>... .List => ListItem(Arg) </valist>

    rule
        <k> bind(.ElemList, val(vararg)) => .K ...</k>

    // TODO this isn't great.  would be better to check type when doing the call/returning and handle appropriately
    syntax KItem ::= "clearVoid"
    syntax KItem ::= clearLocalMemory(List)

    // TODO rename Tail
    rule
        <k> ret(T:KResult, V:KResult) ~> _
            => clearLocalMemory(Locals)
            ~> initializer(T, V) ~> clearVoid
            ~> Tail
        </k>
        <callStack> ListItem(frame(Tail:K, C:Bag)) => .List ...</callStack>
        <control> <localMemory> Locals:List </localMemory> _ => C </control>

    rule
        <k> clearLocalMemory((ListItem(Base:Int) => .List) _) ...</k>
        (<object>... <basePtr> Base:Int </basePtr> ...</object> => .)

    rule clearLocalMemory(.List) => .K

    rule initializer(void, V:K) ~> clearVoid => .K
    rule initializer(T:K, V:KResult) ~> clearVoid => V
         when T =/=K void

endmodule
