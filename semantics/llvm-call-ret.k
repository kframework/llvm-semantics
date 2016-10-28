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
            ~> Body
        </k>
        <currModule> ModName:SymbolicValueRef </currModule>
        <funModuleName> ModName </funModuleName>
        <functionName> FunName </functionName>
        <formalParameters> arguments(Formals:ElemList) </formalParameters>
        <initialBasicBlock> IBBName:SymbolicValueRef </initialBasicBlock>
        <basicBlocks>... IBBName
                            |-> blockContent(Body:K, _:Set, _:Set, _:Set,
                                            _:Set, _:Set, _:Set, _:Set) ...</basicBlocks>
        [large]

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
