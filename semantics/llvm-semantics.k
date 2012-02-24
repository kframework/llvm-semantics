module LLVM-SEMANTICS is
    including LLVM-SYNTAX

    syntax K ::= debug // TODO [semantic]

    syntax KResult ::= #Int

    syntax K ::= callMain // TODO [semantic]

    configuration
        <T multiplicity="?">
            <k> $PGM:K ~> callMain </k>
            <callStack> .List </callStack>
            <control>
                <currModule> Name("Initial") </currModule>
                <registers> .Map </registers>
                // TODO: this should eventually be a Set
                <currentModifiers> .List </currentModifiers>
            </control>
            <modules>
                <module multiplicity="*">
                    <moduleName> Name("") </moduleName>
                    <targetLayout> "" </targetLayout>
                    <targetTriple> "" </targetTriple>
                    <globalVariables> .Map </globalVariables>
                    <functions> .Map </functions>
                </module>
            </modules>
            <memory>
                <object multiplicity="*">
                    <basePtr> -1 </basePtr>
                    <size> 0 </size>
                    <bytes> .Map </bytes>
                </object>
            </memory>
            <nextLoc> sym(0) </nextLoc>
        </T>
        <result multiplicity="?">
            <returnValue> -1 </returnValue>
        </result>

    syntax K ::= int32
    macro int32 = Type(IntegerType(Width(32))) // TODO [function]

    syntax #Nat ::= sizeof K  // TODO [function]

    syntax #Nat ::= numBitsPerByte
    macro numBitsPerByte = 8

    // TODO [function]
    rule sizeof (Type(IntegerType(Width(N:#Nat)))) => N /Nat numBitsPerByte
        when numBitsPerByte dividesNat N

    rule <k> callMain => Call(int32, Value(Name("@main"))) </k>

    syntax ListItem ::= frame Bag

    rule
        <k> Call(_, FunName:Id) => Body ...</k>
        (<control>
            C:Bag
            <currModule> Name:Id </currModule>
        </control> =>
        <control>...
            <currModule> Name </currModule>
        ...</control>)
        <callStack> . => frame(C <currModule> Name </currModule>) ...</callStack>
        <moduleName> Name </moduleName>
        <functions>... FunName |-> Function(_, _, _, Body:K) ...</functions>

    rule
        <k> Ret(V:KResult) => V ...</k>
        <callStack> frame(C:Bag) => . ...</callStack>
        <control> _ => C </control>

    rule
        <k> Operand(_, K:K) => K ...</k>

    rule
        <k> Instruction(Modifiers(L:List{K}), K:K) => K ...</k>
        <currentModifiers> _ => List(L) </currentModifiers>

    syntax #Nat ::= sym "(" #Nat ")"    // TODO [semantic]

    syntax #Nat ::= nextSym #Nat
    macro nextSym(sym(N:#Nat)) = sym(N +Nat 1)

    rule
        <k> Alloca(Type:K, N:#Nat) => Loc ...</k>
        <nextLoc> Loc:#Nat => nextSym Loc </nextLoc>
        (. =>
            <object>...
                <basePtr> Loc </basePtr>
                <size> sizeof(Type) *Nat N </size>
            ...</object>
        )

    rule
        <k> Assign(X:Id, V:KResult) => . ...</k>
        <registers> M:Map => M[V / X] </registers>

    rule
        <k> X:Id => V ...</k>
        <registers>... X |-> V:KResult ...</registers>

    rule <T>... <k> V:KResult </k> ...</T> => <result>... <returnValue> V </returnValue> </result>

    rule <k> GlobalVariables(L:List{K}) => List{K}ToK(L) ...</k>

    rule <k> Functions(L:List{K}) => List{K}ToK(L) ...</k>

    rule <k> Body(L:List{K}) => List{K}ToK(L) ...</k>

    rule <k> Instructions(L:List{K}) => List{K}ToK(L) ...</k>

    rule <k> BasicBlock(_, K:K) => K ...</k>

    rule
        <k> Module(Name:Id, TargetLayout:K, TargetTriple:K, GlobalVars:K, Functions:K)
            => GlobalVars
            ~> Functions
        ...</k>
        <currModule> _ => Name </currModule>
        <modules>...
            . =>
            <module>...
                <moduleName> Name </moduleName>
                <targetLayout> TargetLayout </targetLayout>
                <targetTriple> TargetTriple </targetTriple>
            ...</module>
        ...</modules>


    rule
        <k> FUNCTION => . ...</k>
        <functions>... . => Name |-> FUNCTION ...</functions>
        where FUNCTION = Function(RetType:K, Name:Id, Arguments:K, Body:K)


    rule ModuleID(S:#String) => Name(S)
    rule Value(K:K) => K

end module
