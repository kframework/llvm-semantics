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
                               updateVarInTerm(CurN, N, In, M', M, Rev), T))) </instQueue>
         <registers> M:Map </registers>
         <specRegisters> M':Map </specRegisters>
         <reverseChoice> Rev:Map </reverseChoice>
         <currBlock> basicBlockNum(CurN:Int, CurLabel:K) </currBlock>
         requires size(InQueue) <Int numOfMaxInQueue andBool T =/=K terminators
         [transition]

    //this rule is to do a speculative move by guessing a next block to execute.
    rule <toExecute> blockExecution(basicBlockNum(N:Int, Name:K),
               ListItem(instNumInfo(Num:Int,
                     noAssign(instruction(In:K, Attrs:Set, Meta:K)), terminators)))
            => blockExecution(basicBlockNum(Count, guessNextBlock(In)),
               formInstList(1, .K, Body)) ...</toExecute>
         <registers> M:Map </registers>
         <specRegisters> M':Map </specRegisters>
         <instQueue> instList(InQueue:List => InQueue ListItem(dynInstInfo(N, Num,
             updateVarInTerm(BN, N, noAssign(instruction(In:K,
               Attrs:Set, Meta:K)), M', M, Rev), terminators))) </instQueue>
         <currBlock> basicBlockNum(BN:Int, CurLabel:K) </currBlock>
         <blockCount> Count:Int => Count +Int 1 </blockCount> 
         <specChoice> allowChoice(Chi:Map =>
               Chi[N <- nextSpecs(SetItem(
                   basicBlockNum(Count, guessNextBlock(In))))]) </specChoice>
         <reverseChoice> Rev:Map => Rev[Count <- N] </reverseChoice>
         <restChoice> RM:Map => RM[N:Int <- nextSpecs(getRestBlocks(In, .K,
                   (guessNextBlock(In) |-> blockContent(Body, Flag,
                     InEg, OutEgs, InDef, InUse, OutDef, OutUse, Use)) BM))] </restChoice>
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
              => blockExecutionAux(findNextBlock(BN, Chi, RM)) ...</toExecute>
         <specChoice> allowChoice(Chi:Map)
                      => holdChoice(Chi) </specChoice>
         <restChoice> RM:Map </restChoice>
         <currBlock> basicBlockNum(BN:Int, CurLabel:K) </currBlock>
         <blockCount> Count:Int </blockCount> 
         requires hasRestBlocks(.K, RM) andBool (Count -Int maxSpecGap <Int BN)
          [structural]

    rule <toExecute> blockExecutionAux(selectSpec(PreCount:Int,
                    Name:K, Rest:Set))
            => blockExecution(basicBlockNum(Count, Name),
               formInstList(1, .K, Body)) ...</toExecute>
         <blockCount> Count:Int => Count +Int 1 </blockCount> 
         <specChoice> holdChoice(Chi:Map) 
              => allowChoice(updateChoiceMap(Chi, .K, PreCount,
                           basicBlockNum(Count, Name))) </specChoice>
         <reverseChoice> Rev:Map => Rev[Count <- PreCount] </reverseChoice>
         <restChoice> (PreCount |-> Rest':K) RM:Map
              => changeBlocks(PreCount, Name, Rest, RM, Flag) </restChoice>
         <currModule> ModName:SymbolicValueRef </currModule>
         <funModuleName> ModName </funModuleName>
         <currFunction> FunName:SymbolicValueRef </currFunction>
         <functionName> FunName </functionName>
         <basicBlocks>... Name |-> blockContent(Body:Map, Flag:Bool,
                _:Set, _:Set, _:Set, _:Set, _:Set, _:Set, _:Set) ...</basicBlocks>
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
         <specRegisters> M:Map => M[varInstance(BN, X) <- V] </specRegisters>
         <registers> M':Map </registers>
         <currBlock> basicBlockNum(Cur:Int, _:K) </currBlock>
         <instQueue> instList(L:List => updateVarInList(Cur, BN,
               L, M[varInstance(BN, X) <- V], M', Rev)) </instQueue>
         <reverseChoice> Rev:Map </reverseChoice>
         requires BN >Int Cur

    rule <k> runDynInst(dynResult(X:SymbolicValueRef, V:KResult)) => .K ...</k>
         <cpu> dynInstHold(BN:Int, IN:Int, T:K) => .K </cpu>
         <specRegisters> M:Map </specRegisters>
         <registers> M':Map => M'[X <- V] </registers>
         <currBlock> basicBlockNum(Cur:Int, _:K) </currBlock>
         <instQueue> instList(L:List => updateVarInList(Cur, BN,
               L, M, M'[X <- V], Rev)) </instQueue>
         <reverseChoice> Rev:Map </reverseChoice>
         requires BN <=Int Cur

    rule <k> runDynInst(dynNoResult(V:KResult)) => .K ...</k>
         <cpu> dynInstHold(BN:Int, IN:Int, T:K) => .K </cpu>

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
         </tomasulo>
         =>
         <tomasulo>...
           <instQueue> instList(.List) </instQueue>
         ...</tomasulo>
         )
        <callStack> .List => ListItem(frame(Tail, C, D)) ...</callStack>


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
        <callStack> ListItem(frame(Tail:K, C:Bag, D:Bag)) => .List ...</callStack>
        <control> <localMemory> Locals:List </localMemory> _ => C </control>
        <tomasulo> _:Bag => D </tomasulo>

    rule
        <k> clearLocalMemory((ListItem(Base:Int) => .List) _) ...</k>
        (<object>... <basePtr> Base:Int </basePtr> ...</object> => .)

    rule clearLocalMemory(.List) => .K

    rule initializer(void, V:K) ~> clearVoid => .K
    rule initializer(T:K, V:KResult) ~> clearVoid => V
         when T =/=K void

endmodule
