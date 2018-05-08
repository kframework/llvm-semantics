// 
requires "llvm-syntax.k"
requires "llvm-abstractsyntax.k"
requires "llvm-settings.k"
requires "llvm-helpers.k"
requires "llvm-standard-library-syntax.k"
requires "llvm-syscalls-syntax.k"
requires "llvm-configuration.k"

module LLVM-VARIADICS
    imports LLVM-SYNTAX
    imports LLVM-ABSTRACTSYNTAX
    imports LLVM-SETTINGS
    imports LLVM-HELPERS
    imports LLVM-STANDARD-LIBRARY-SYNTAX
    imports LLVM-SYSCALLS-SYNTAX
    imports LLVM-CONFIGURATION

    rule <k> vaStart(loc(Base:Int, Ty,
                 value(Left:Int, Right:Int),Ran:K, none, InR:K)) ~> K:K => .K </k>
         (<tomasulo> D:Bag </tomasulo> => <tomasulo>...
                        <instQueue> instList(.List) </instQueue>
                          ...</tomasulo>)
        <output>... .List => ListItem("error: va_start must have correct mem location in the stack.") </output>
        <localMemory> LocalStack:Set </localMemory>
           <stackList> SL:List </stackList>
        requires Ran =/=K stack orBool 
           Base <Int Left orBool Base +Int sizeof(getInnerType(vaArgType)) >Int Right
             orBool notBool isInStackRange(
                    SL, Base, sizeof(getInnerType(vaArgType)), LocalStack)

    rule <k> vaStart(loc(Base:Int, Ty,
                 value(Left:Int, Right:Int), stack, none, InR:K))
             => dynNoResult(undef) ...</k>
         <cpu> dynInstHold(B:Int , In:Int, Label:K) </cpu>
         <currBlock> basicBlockNum(BN:Int, _:K) </currBlock>
        <toCommit> memList(Ava:List, Ava':List, Avb:List, Avb':List, ML:List)
        => splitMemList(memList(Ava:List, Ava':List, Avb:List, Avb':List, .List),
               Ava Ava' Avb Avb', subPrototypeWithActual(ML, TID, B, In,
                      genWriteBytes(TID, B, In, stack, getInnerType(vaArgType),
               splitBytes(getInnerType(vaArgType), 0),
                storeOperand(TID, getInnerType(vaArgType), 0),
                            Base, 0, sizeof(getInnerType(vaArgType)), 0)
              ListItem(singleMem(TID, B, In, stack, vaWait))), BN, SL, MOL) </toCommit>
        <threadId> TID:Int </threadId>
        <localMemory> LocalStack:Set </localMemory>
        <memoryList> MOL:List </memoryList>
           <stackList> SL:List </stackList>
        requires Base >=Int Left andBool Base +Int sizeof(getInnerType(vaArgType)) <=Int Right
                 andBool isInStackRange(SL, Base, sizeof(getInnerType(vaArgType)), LocalStack)

    rule <k> vaClose(loc(Base:Int, Ty,
                 value(Left:Int, Right:Int), stack, none, InR:K))
                 => dynNoResult(undef) ...</k>
         <cpu> dynInstHold(B:Int , In:Int, Label:K) </cpu>
        <currBlock> basicBlockNum(BN:Int, _:K) </currBlock>
        <toCommit> memList(Ava:List, Ava':List, Avb:List, Avb':List, ML:List)
            => splitMemList(memList(Ava:List, Ava':List, Avb:List, Avb':List, .List),
               Ava Ava' Avb Avb', subPrototypeWithActual(ML, TID, B, In,
                      ListItem(singleMem(TID, B, In,stack, toClose(Base)))), BN, SL, MOL) </toCommit>
        <currentModifiers> Mods:Set </currentModifiers>
        <threadId> TID:Int </threadId>
        <localMemory> LocalStack:Set </localMemory>
        <memoryList> MOL:List </memoryList>
           <stackList> SL:List </stackList>
        requires Base >=Int Left andBool Base +Int sizeof(getInnerType(vaArgType)) <=Int Right
                 andBool isInStackRange(SL, Base, sizeof(getInnerType(vaArgType)), LocalStack)

    rule <k> vaClose(loc(Base:Int, Ty,
                 value(Left:Int, Right:Int),heap, none, InR:K)) ~> K:K => .K </k>
         (<tomasulo> D:Bag </tomasulo> => <tomasulo>...
                        <instQueue> instList(.List) </instQueue>
                          ...</tomasulo>)
        <output>... .List => ListItem("error: va_close location has been deleted.") </output>
        <localMemory> LocalStack:Set </localMemory>
           <stackList> SL:List </stackList>
        requires Base <Int Left orBool Base +Int sizeof(getInnerType(vaArgType)) >Int Right
                 orBool notBool isInStackRange(
                       SL, Base, sizeof(getInnerType(vaArgType)), LocalStack)

   rule <k> vaCopy(loc(Base:Int, Ty:K,value(Left:Int, Right:Int), stack, none, InR:K),
           loc(Base1:Int, Ty1:K,value(Left1:Int, Right1:Int), stack, none, InR1:K))
              => dynNoResult(undef) ...</k>
        <cpu> dynInstHold (B:Int , In:Int, Label:K) </cpu>
        <currBlock> basicBlockNum(BN:Int, _:K) </currBlock>
         <cpu> dynInstHold(B:Int , In:Int, Label:K) </cpu>
         <currBlock> basicBlockNum(BN:Int, _:K) </currBlock>
        <readBack> readMap(RM:Map) => readMap(RM[varInstance(B, In)
             <- readBackHold(undef, loadHold(getInnerType(vaArgType), .List),
                       vaWaitWrite(loc(Base1:Int, getInnerType(vaArgType),
            value(Left1:Int, Right1:Int), stack, none, InR1:K)))]) </readBack>
        <toCommit> memList(Ava:List, Ava':List, Avb:List, Avb':List, ML:List)
        => splitMemList(memList(Ava:List, Ava':List, Avb:List, Avb':List, .List),
               Ava Ava' Avb Avb', subPrototypeWithActual(ML, TID, B, In,
                      genReadBytes(TID, B, In, stack, getInnerType(vaArgType),
                            Base, 0, sizeof(getInnerType(vaArgType)), 0)
              ListItem(singleMem(TID, B, In, stack, vaWait))), BN, SL, MOL) </toCommit>
        <currentModifiers> Mods:Set </currentModifiers>
        <threadId> TID:Int </threadId>
        <localMemory> LocalStack:Set </localMemory>
        <memoryList> MOL:List </memoryList>
           <stackList> SL:List </stackList>
        requires Base >=Int Left andBool Base +Int sizeof(getInnerType(vaArgType)) <=Int Right
                 andBool isInStackRange(SL, Base, sizeof(getInnerType(vaArgType)), LocalStack)
          andBool Base1 >=Int Left1 andBool Base1 +Int sizeof(getInnerType(vaArgType)) <=Int Right1
                 andBool isInStackRange(SL, Base1, sizeof(getInnerType(vaArgType)), LocalStack)

    rule <k> vaCopy(loc(Base:Int, Ty:K,value(Left:Int, Right:Int), stack, none, InR:K),
           loc(Base1:Int, Ty1:K,value(Left1:Int, Right1:Int), stack, none, InR1:K))
              ~> K:K => .K </k>
         (<tomasulo> D:Bag </tomasulo> => <tomasulo>...
                        <instQueue> instList(.List) </instQueue>
                          ...</tomasulo>)
        <output>... .List => ListItem("error: va_copy must have two mem locations with enough space to hold va_arg pointer information or the poniters have not been initialized yet.") </output>
        <localMemory> LocalStack:Set </localMemory>
        <stackList> SL:List </stackList>
        requires Base <Int Left orBool
                    Base +Int sizeof(getInnerType(vaArgType)) >Int Right
           orBool notBool isInStackRange(SL, Base, sizeof(getInnerType(vaArgType)), LocalStack)
          orBool Base1 <Int Left1 orBool
                   Base1 +Int sizeof(getInnerType(vaArgType)) >Int Right1
       orBool notBool isInStackRange(SL, Base1, sizeof(getInnerType(vaArgType)), LocalStack)

    rule <k> theVAArg(Ty:K, loc(Base:Int, Ty,
                 value(Left:Int, Right:Int),stack, none, InR:K), T':K)
                   => vaArgOp(loc(Base:Int, Ty,
                 value(Left:Int, Right:Int),stack, none, InR:K), T') ...</k>
         <cpu> dynInstHold(B:Int , In:Int, Label:K) </cpu>
         <currBlock> basicBlockNum(BN:Int, _:K) </currBlock>
        <toCommit> memList(Ava:List, Ava':List, Avb:List, Avb':List, ML:List)
        => splitMemList(memList(Ava:List, Ava':List, Avb:List, Avb':List, .List),
               Ava Ava' Avb Avb', subPrototypeWithActual(ML, TID, B, In,
                      genReadBytes(TID, B, In, stack, getInnerType(vaArgType),
                            Base, 0, sizeof(getInnerType(vaArgType)), 0)
              ListItem(singleMem(TID, B, In, stack, vaWait))), BN, SL, MOL) </toCommit>
        <currentModifiers> Mods:Set </currentModifiers>
        <threadId> TID:Int </threadId>
        <localMemory> LocalStack:Set </localMemory>
        <memoryList> MOL:List </memoryList>
           <stackList> SL:List </stackList>
        requires Base >=Int Left andBool Base +Int sizeof(getInnerType(vaArgType)) <=Int Right
                 andBool isInStackRange(SL, Base, sizeof(getInnerType(vaArgType)), LocalStack)

    
endmodule
