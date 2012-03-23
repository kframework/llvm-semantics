module LLVM-SPECIAL is
    including LLVM-SYNTAX
    
    syntax K ::= callMain // TODO [semantic]
    syntax KResult ::= #Int
    syntax KResult ::= arrayValue "(" List{K} ")"

    syntax #Nat ::= sym "(" #Int ")"    // TODO [semantic]
    // syntax Loc ::= sym "(" #Int ")"
    syntax #Nat ::= funptr "(" K ")"
    syntax #Nat ::= ptrByte "(" K "," K ")" // address, byteNumber; part of a pointer, as a byte
    
    syntax K ::= debug // TODO [semantic]


end module

module LLVM-CONFIGURATION is
    including LLVM-SYNTAX
    including LLVM-SPECIAL
    
    configuration
        <T multiplicity="?">
            <k> $PGM:K ~> callMain </k>
            <callStack> .List </callStack>
            <control>
                <currBlock> Name("Initial") </currBlock>
                <prevBlock> Name("Initial") </prevBlock>
                <currModule> Name("Initial") </currModule>
                <currFunction> Name("Initial") </currFunction>
                <registers> .Map </registers>
                // TODO: this should eventually be a Set
                <currentModifiers> .List </currentModifiers>
            </control>
            <modules>
                <module multiplicity="*">
                    <moduleName> Name("") </moduleName>
                    <targetLayout> "" </targetLayout>
                    <targetTriple> "" </targetTriple>
                    <typedefs> .Map </typedefs>
                    <globalRegisters> .Map </globalRegisters>
                    <functions>
                        <function multiplicity="*">
                            <functionName> Name("") </functionName>
                            <returnType> .K </returnType>
                            <formalParameters> .K </formalParameters>
                            <basicBlocks> .Map </basicBlocks>
                            <initialBasicBlock> .K </initialBasicBlock>
                        </function>
                    </functions>
                    <typeInfos>
                        <typeInfo multiplicity="*">
                            <typeName> Name("") </typeName>
                            <offsets> .Map </offsets>
                        </typeInfo>
                    </typeInfos>
                </module>
            </modules>
            <memory>
                <object multiplicity="*">
                    <type> .K </type>
                    <basePtr> -1 </basePtr>
                    <size> 0 </size>
                    <bytes> .Map </bytes>
                </object>
            </memory>
            <nextLoc> sym(0) </nextLoc>
            // auxiliary cells:
            <gepInfo multiplicity="?">
                <gepType> .K </gepType>
                <gepResult> 0 </gepResult>
                <gepIndices> .K </gepIndices>
            </gepInfo>
        </T>
        <result multiplicity="?">
            <returnValue> -1 </returnValue>
        </result>

end module

module LLVM-SETTINGS is
    including LLVM-SYNTAX
    including LLVM-SPECIAL
    
    declare numBitsPerByte : -> #Nat
    define numBitsPerByte => 8
    
    declare numBytesPerPointer : -> #Nat
    define numBytesPerPointer => 4
end module

module LLVM-HELPERS is
    including LLVM-SYNTAX
    including LLVM-SETTINGS
    
    syntax K ::= splitBytes "(" K "," K ")" // value, type

    declare byteType : -> K
    define byteType => IntegerType(Width(numBitsPerByte))

    declare int32 : -> K
    define int32 => IntegerType(Width(32))
    declare int1 : -> K
    define int1 => IntegerType(Width(1))

    declare sizeofInBits : K -> #Nat

    syntax K ::= innerType "(" K ")"
    rule innerType(PointerType(K:K)) => K:K  [anywhere]
    rule innerType(ArrayType(K:K, _)) => K:K  [anywhere]
    
    // these give the two's complement signed max and min of a type
    declare smax_ : K -> #Nat
    declare smin_ : K -> #Int
    define smax Type:KResult => (2 ^Int absInt(sizeofInBits(Type) -Int 1)) -Int 1
    define smin Type:KResult => -Int (2 ^Int absInt(sizeofInBits(Type) -Int 1))
    
    declare umax_ : K -> #Nat
    declare umin_ : K -> #Nat
    define umax Type:KResult => (2 ^Int absInt(sizeofInBits(Type))) -Int 1
    define umin Type:KResult => 0
    
    // should be a K, but builtins can't use K :(
    syntax #Int ::= signed "(" K "," K ")" // type, value
    
    
    // cannot be a function, has to take place on top of K
    // syntax K ::= canonicalize "(" K "," K ")"
    // syntax K ::= canonicalizeArray "(" K "," List{K} ")" [strict(1)]
    // syntax K ::= canonicalizeArray' "(" K "," List{K} "," List{K} ")"
    // syntax K ::= canonicalizeStruct "(" K "," K ")"
    // syntax K ::= canonicalizeStruct' "(" List{K} "," K "," List{K} ")"
    
    // rule 
        // <k> canonicalize(Type:KResult, I:#Int) => unsigned(Type, I) ...</k>
        // when isIntegerType(Type)
    // rule <k> canonicalize(Type:KResult, I:#Int) => I ...</k>
        // when isPointerType(Type)
    // rule <k> canonicalize(VoidType, VoidValue) => VoidValue ...</k>
    // rule <k> canonicalize(Type:KResult, arrayValue(L:List{K}))
            // => canonicalizeArray(innerType(Type), L)
        // ...</k>
        // when isArrayType(Type)
    // // TODO using arguments to heat to listK
    // rule <k> canonicalize(StructType(L:List{K}), V:KResult)
            // => canonicalizeStruct(Arguments(L), V)
        // ...</k>
    
    // // canonicalizeArray
    // rule <k> canonicalizeArray(Type:KResult, L:List{K})
            // => canonicalizeArray'(Type, L, .List{K})
        // ...</k>
    // rule <k> (.K => canonicalize(Type, V))
            // ~> canonicalizeArray'(Type:KResult, ((V:KResult => .List{K}),, L:List{K}), _)
        // ...</k>
    // rule <k> (V:KResult => .)
            // ~> canonicalizeArray'(Type:KResult, L:List{K}, (_,, (.List{K} => V)))
        // ...</k>
    // rule <k> canonicalizeArray'(Type:KResult, .List{K}, L:List{K})
            // => arrayValue(L)
        // ...</k>
        
    // // canonicalizeStruct
    // rule <k> canonicalizeStruct(listK(L:List{K}), V:KResult)
            // => canonicalizeStruct'(L, V, .List{K})
        // ...</k>
    // rule <k> (. => canonicalize(Type, 
            // canonicalizeStruct'((Type:KResult,, L:List{K}), ConstantStruct(M:K, listK()), L':List{K})
        // ...</k>
    
    rule
        signed(Type:KResult, I:#Int) => I
        when smin(Type) <=Int I andBool smax(Type) >=Int I
        [anywhere]
    // TODO these could be sped up
    rule
        // TODO K not compiling this correctly :(
        // signed(Type:KResult, (I:#Int => I +Int umax(I)))
        signed(Type:KResult, I:#Int)
        => signed(Type:KResult, I +Int (umax(Type) +Nat 1))
        when I <Int smin(Type)
        [anywhere]
    rule
        // signed(Type:KResult, (I:#Int => I -Int umax(I)))
        signed(Type:KResult, I:#Int)
        => signed(Type:KResult, I -Int (umax(Type) +Nat 1))
        when I >Int smax(Type)
        [anywhere]
        
    
    // computes the positive remainder, whereas % can returns a negative number
    // TODO maybe should go in pl builtins
    syntax #Nat ::= K "remInt" K
    rule (I:#Int remInt N:#Nat) => ((I %Int N) +Int N) %Int N [anywhere]
    
    syntax #Nat ::= unsigned "(" K "," K ")" // type, value
    rule
        unsigned(Type:KResult, N:#Nat) => N
        when umin(Type) <=Nat N andBool umax(Type) >=Nat N
        [anywhere]
    rule
        unsigned(Type:KResult, I:#Int) => I remInt (umax(Type) +Nat 1)
        when I <Int umin(Type)
        [anywhere]
    rule
        unsigned(Type:KResult, N:#Nat) => N %Nat (umax(Type) +Nat 1)
        when N >Nat umax(Type)
        [anywhere]

    syntax #Bool ::= isIntegerType "(" K ")" // predicate
    rule isIntegerType(IntegerType(Width(_))) => true  [anywhere]
    rule isIntegerType(KLabel:KLabel(_)) => false
        when KLabel =/=Bool 'IntegerType
        [anywhere]
    syntax #Bool ::= isPointerType "(" K ")" // predicate
    rule isPointerType(PointerType(_)) => true  [anywhere]
    syntax #Bool ::= isArrayType "(" K ")" // predicate
    rule isArrayType(ArrayType(_, _)) => true  [anywhere]
    syntax #Bool ::= isStructType "(" K ")" // predicate
    rule isStructType(StructType(_)) => true  [anywhere]
    
    // fixme size should depend on architecture
    define sizeofInBits(PointerType(_)) => numBytesPerPointer *Nat numBitsPerByte
    define sizeofInBits(ArrayType(Type:KResult, Len:#Nat)) => sizeofInBits(Type) *Nat Len
    
    define sizeofInBits(IntegerType(Width(N:#Nat))) => N
    // TODO listK should be Fields (bug in K)
    define sizeofInBits(StructType(listK((Type:KResult,,L:List{K}))))
      => sizeofInBits(Type) +Nat sizeofInBits(StructType(listK(L)))
    define sizeofInBits(StructType(listK(.List{K}))) => 0

    declare sizeof : K -> #Nat
    define sizeof(K:K) => sizeofInBits(K:K) /Nat numBitsPerByte
        when numBitsPerByte dividesNat sizeofInBits(K:K)
        
    declare zeroOfType : K -> K
    define zeroOfType(Type:KResult) => 0
        when isIntegerType(Type)
        
    
    declare _copiesOf_ : K List{K} -> List{K}
    define sNat(N:#Nat) copiesOf L:List{K} => L,, (N:#Nat copiesOf L)
    define 0 copiesOf _ => .List{K}

    // syntax K ::= interpretInt "(" K "," K ")" // cannot be function
end module

/* this module gets included by all later modules */
module LLVM-INCLUDE is
    including LLVM-CONFIGURATION
    including LLVM-SETTINGS
    including LLVM-HELPERS

end module

/* this module contains rules for cleaning up the AST */
module LLVM-CLEAN-TREE is
    including LLVM-INCLUDE
    
    rule <k> Operand(Type:KResult, I:#Int) => signed(Type, I) ...</k>
        when isIntegerType(Type)
    rule <k> Operand(Type:KResult, V:KResult) => V ...</k>
        when notBool isIntegerType(Type)

    rule GlobalVariables(L:List{K}) => List{K}ToK(L)  [anywhere]
    rule Functions(L:List{K}) => List{K}ToK(L)        [anywhere]
    rule Typedefs(L:List{K}) => List{K}ToK(L)         [anywhere]
    //rule Body(L:List{K}) => List{K}ToK(L)
    rule Instructions(L:List{K}) => List{K}ToK(L)     [anywhere]
    rule ModuleID(S:#String) => Name(S)               [anywhere]
    rule Value(K:K) => K                              [anywhere]
    rule Br(K:K) => K:K                               [anywhere]

    rule ICmp(Predicate("ne"), TyK:K, K1:K, K2:K) => INotEq(TyK:K, K1:K, K2:K) [anywhere]
    rule ICmp(Predicate(Str:#String), TyK:K, K1:K, K2:K) => IEq(TyK:K, K1:K, K2:K) 
        when Str ==Bool "e" +String "q" // TODO avoiding bug in kompile
        [anywhere]
    rule ICmp(Predicate("ugt"), TyK:K, K1:K, K2:K) => UGT(TyK:K, K1:K, K2:K) [anywhere]
    rule ICmp(Predicate("uge"), TyK:K, K1:K, K2:K) => UGE(TyK:K, K1:K, K2:K) [anywhere]
    rule ICmp(Predicate("ult"), TyK:K, K1:K, K2:K) => ULT(TyK:K, K1:K, K2:K) [anywhere]
    rule ICmp(Predicate("ule"), TyK:K, K1:K, K2:K) => ULE(TyK:K, K1:K, K2:K) [anywhere]
    rule ICmp(Predicate("sgt"), TyK:K, K1:K, K2:K) => SGT(TyK:K, K1:K, K2:K) [anywhere]
    rule ICmp(Predicate("sge"), TyK:K, K1:K, K2:K) => SGE(TyK:K, K1:K, K2:K) [anywhere]
    rule ICmp(Predicate("slt"), TyK:K, K1:K, K2:K) => SLT(TyK:K, K1:K, K2:K) [anywhere]
    rule ICmp(Predicate("sle"), TyK:K, K1:K, K2:K) => SLE(TyK:K, K1:K, K2:K) [anywhere] 
    
    rule ReturnType(K:K) => K [anywhere]
end module


module LLVM-MISC is
    including LLVM-INCLUDE

    // TODO many possible errors will slip by with this, but lots of stuff will work
    rule
        <k> Null => sym(-1) +Nat 0 ...</k>
    
    rule
        <k> Instruction(Modifiers(L:List{K}), K:K) => K ...</k>
        <currentModifiers> _ => List(L) </currentModifiers>

    rule
        <k> ConstantExpr(Modifiers(L:List{K}), K:K) => K ...</k>
        <currentModifiers> _ => List(L) </currentModifiers>

    rule
        <k> PHI(_, (Edge(K:K, Name:Id),, _:List{K})) => K:K ...</k>
        <prevBlock> Name </prevBlock>
    rule
        <k> PHI(_, ((Edge(K:K, Name:Id) => .List{K}),, _:List{K})) ...</k>
        <prevBlock> Name':Id </prevBlock>
        when Name =/=Bool Name'
end module

module LLVM-GLOBALS is
    including LLVM-INCLUDE

    syntax K ::= init "(" K "," K "," K ")" [strict(2)]
    
    rule
        <k> GlobalVariable(X:Id, Modifiers(L:List{K}), PointerType(TyK:K), Init:K)
            => init(X, Alloca(TyK, 1), Init:K)
        ...</k>
        <currentModifiers> _ => List(L) </currentModifiers>
        
    rule
        <k> init(X:Id, Loc:#Nat, Initializer(TK:K, K:K))
            => Store(TK:K, K:K, Loc)
        ...</k>
        <globalRegisters> M:Map => M[Loc/X] </globalRegisters>
end module

module LLVM-REGISTERS is
    including LLVM-INCLUDE

    rule [assign-register]:
        <k> Assign(X:Id, V:KResult) => . ...</k>
        <registers> M:Map => M[V / X] </registers>

    rule [lookup-register]:
        <k> X => V ...</k>
        <registers>... X |-> V:KResult ...</registers>
        when substrString(S, 0, 1) ==Bool "%"
        where X = Name(S:#String)
        
    rule [lookup-global-register]:
        <k> X => V ...</k>
        <globalRegisters>... X |-> V:KResult ...</globalRegisters>
        when substrString(S, 0, 1) ==Bool "@"
        where X = Name(S:#String)

end module

module LLVM-BRANCHING is
    including LLVM-INCLUDE

    rule
        <k> Unconditional(Label:Id) => Body:K </k>
        <currFunction> FunName:Id </currFunction>
        <functionName> FunName:Id </functionName>
        <basicBlocks>... Label:Id |-> Body:K ...</basicBlocks>

    rule
        <k> Conditional(I:#Int, Label:K, _)
            => Unconditional(Label:K)
        </k>
        when unsigned(int1, I) ==Bool 1
    rule
        <k> Conditional(I:#Int, _, Label:K)
            => Unconditional(Label:K)
        </k>
        when unsigned(int1, I) ==Bool 0
        
    rule [switch-default]:
        <k> Switch(_, I:#Int, Label:K, listK(.List{K}))
            => Unconditional(Label:K)
        </k>
    rule [switch-hit]:
        <k> Switch(Type:KResult, I:#Int, _, listK((Case(I':#Int, Label:K),, L:List{K})))
            => Unconditional(Label:K)
        </k>
        when unsigned(Type, I) ==Bool unsigned(Type, I')
    rule [switch-miss]:
        <k> Switch(
                Type:KResult, 
                I:#Int, 
                _, 
                listK(((Case(I':#Int, Label:K) => .List{K}),, L:List{K}))
            )
        </k>
        when unsigned(Type, I) =/=Bool unsigned(Type, I')
end module

module LLVM-SELECTION is
    including LLVM-INCLUDE
    
    rule [select-false]:
        Select(Type:KResult, I:#Int, _, K:K) => K
        when unsigned(Type, I) ==Bool 0
    rule [select-true]:
        Select(Type:KResult, I:#Int, K:K, _) => K
        when unsigned(Type, I) >Nat 0
        // when I =/=Bool 0 // TODO normalize numbers?
end module

module LLVM-START-AND-STOP is
    including LLVM-INCLUDE

    rule <k> callMain => Call(int32, Callee(Value(Name("@main")), Arguments(.List{K}))) </k>
        <functionName> Name("@main") </functionName>
        <formalParameters> Arguments(L:List{K}) </formalParameters>
        when lengthList{K}(L) ==Bool 0
    
    // TODO need to allocate char** etc for command line arguments
    rule <k> callMain => Call(int32, Callee(Value(Name("@main")), Arguments((0,, 0)))) </k>
        <functionName> Name("@main") </functionName>
        <formalParameters> Arguments(L:List{K}) </formalParameters>
        when lengthList{K}(L) ==Bool 2

    rule [terminate]:
        <T>...
            <k> I:#Int </k>
        ...</T>
        => <result>...
            <returnValue> I remInt 256 </returnValue>
        </result>
end module

module LLVM-DECLARATIONS is
    including LLVM-INCLUDE

    rule
        <k> Module(Name:Id, TargetLayout:K, TargetTriple:K, Typedefs:K, GlobalVars:K, Functions:K)
            => Typedefs
            ~> GlobalVars
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
        <k> Typedef(X:Id, Modifiers(L:List{K}), UnresolvedType:K) => . ...</k>
        <currentModifiers> _ => List(L) </currentModifiers>
        <currModule> Name:Id </currModule>
        <moduleName> Name </moduleName>
        <typedefs>... . => X |-> UnresolvedType ...</typedefs>

    rule
        <k> NamedType(X:Id) => UnresolvedType ...</k>
        <typedefs>... X |-> UnresolvedType:K ...</typedefs>

    // TODO: hack because hybrids don't seem to be working
    rule
        <k> Fields(L:List{K}) => listK(L) ...</k>
        when 'isKResult(L)
    rule <k> Types(L:List{K}) => listK(L) ...</k>
        when 'isKResult(L)
        
    rule
        <k> FUNCTION => Body:K ...</k>
        <currFunction> _ => Name </currFunction>
        <globalRegisters> M:Map => M[funptr(Name)/Name] </globalRegisters>
        (. =>
            <function>...
                <returnType> RetType </returnType>
                <formalParameters> Arguments:K </formalParameters>
                <functionName> Name </functionName>
            ...</function>
        )
        where FUNCTION = FunctionDef(RetType:KResult, Name:Id, Arguments:K, Body:K)
    
    rule
        <k> FUNCTION => . ...</k>
        <globalRegisters> M:Map => M[funptr(Name)/Name] </globalRegisters>
        (. =>
            <function>...
                <returnType> RetType </returnType>
                <formalParameters> Arguments:K </formalParameters>
                <functionName> Name </functionName>
            ...</function>
        )
        where FUNCTION = FunctionDecl(RetType:KResult, Name:Id, Arguments:K)

    rule
        <k> Body((BasicBlock(Name:Id, K:K) ,, L:List{K}))
            => BasicBlock(Name:Id, K:K)
            ~> List{K}ToK(L)
        ...</k>
        <currFunction> FunName:Id </currFunction>
        <functionName> FunName:Id </functionName>
        <initialBasicBlock> .K => Name:Id </initialBasicBlock>

    syntax K ::= setBlock "(" K ")"
    rule
        <k> BasicBlock(Name:Id, K:K) => . ...</k>
        <currFunction> FunName:Id </currFunction>
        <functionName> FunName:Id </functionName>
        <basicBlocks>... . => Name:Id |-> (setBlock(Name) ~> K:K) ...</basicBlocks>

    rule
        <k> setBlock(Name:Id) => . ...</k>
        <currBlock> Name':Id => Name </currBlock>
        <prevBlock> _ => Name' </prevBlock>

end module

module LLVM-CALL-RET is
    including LLVM-INCLUDE

    syntax ListItem ::= frame "(" K "," Bag ")"
    syntax K ::= "bind" "(" List{K} "," List{K} ")"
    
    
     rule
        <k> Arguments(L:List{K}) => listK(L) ...</k>
        when 'isKResult(L)
    
    rule
        <k> Call(_, Callee(funptr(FunName:Id), listK(Args:List{K}))) ~> Tail:K
            => bind(Args, Formals)
            ~> Body
        </k>
        (<control>
            C:Bag
            <currModule> Name:Id </currModule>
            <currFunction> FunName':Id </currFunction>
        </control> =>
        <control>...
            <currModule> Name </currModule>
            <currFunction> FunName:Id </currFunction>
        ...</control>)
        <callStack> . => frame(Tail, (C <currModule> Name </currModule> <currFunction> FunName':Id </currFunction>)) ...</callStack>
        <moduleName> Name </moduleName>
        <functionName> FunName </functionName>
        <formalParameters> Arguments(Formals:List{K}) </formalParameters>
        <initialBasicBlock> IBBName:Id </initialBasicBlock>
        <basicBlocks>... IBBName |-> Body:K ...</basicBlocks>
        //<functions>... FunName |-> Function(_, FunName:Id, _, Body:K) ...</functions>
        
    // might need a way to convert nonmatching types here?  depends on semantics
    rule
        <k> bind((Arg:K,, Args:List{K}), (Arg(_, _, Formal:K),, Formals:List{K}))
            => Assign(Formal, Arg)
            ~> bind(Args:List{K}, Formals:List{K})
        ...</k>
    rule
        <k> bind(.List{K}, .List{K}) => . ...</k>
    // rule
        // <k> bind(Args:List{K}, Vararg) => bindVariadic(Args) ...</k>
    
    // syntax K ::= bindVariadic "(" List{K} ")"
    // syntax K ::= bindVariadic' "(" List{K} "," K ")"
    // syntax Id ::= variadic "(" K "," K ")"
    // rule
        // <k> bindVariadic(Args:List{K}) => bindVariadic'(Args, 0) ...</k>
    // rule
        // <k> bindVariadic'((Arg:K,, Args:List{K}), Loc:#Nat, N:#Nat)
            // => Assign(variadic(N), Arg)
            // ~> bindVariadic'(Args:List{K}, sNat(N))
        // ...</k>
    // rule
        // <k> bindVariadic'(.List{K}, _) => . ...</k>

    // TODO this isn't great.  would be better to check type when doing the call/returning and handle appropriately
    syntax K ::= clearVoid
    
    rule
        <k> Ret(V:KResult) ~> _ => V ~> clearVoid ~> Tail </k>
        <callStack> frame(Tail:K, C:Bag) => . ...</callStack>
        <control> _ => C </control>

    rule
        <k> VoidValue ~> clearVoid => . ...</k>
    rule
        <k> V:KResult ~> clearVoid => V ...</k>
        when V =/=Bool VoidValue
end module

module LLVM-ARITHMETIC is
    including LLVM-INCLUDE

    rule [add]:
        <k> Add(Type:KResult, I1:#Int, I2:#Int)
            => I1 +Int I2
        ...</k>
    rule
        <k> Sub(Type:KResult, I1:#Int, I2:#Int)
            => I1 -Int I2
        ...</k>
    rule
        <k> Mul(Type:KResult, I1:#Int, I2:#Int)
            => I1 *Int I2
        ...</k>
    rule
        <k> SDiv(Type:KResult, I1:#Int, I2:#Int)
            => signed(Type, I1) /Int signed(Type, I2)
        ...</k>
        when signed(Type, I2) =/=Bool 0 // catch undefined
    // TODO should probably wrap this with signed
    rule
        <k> UDiv(Type:KResult, I1:#Int, I2:#Int)
            => unsigned(Type, I1) /Int unsigned(Type, I2)
        ...</k>
        when unsigned(Type, I2) =/=Bool 0 // catch undefined
    rule
        <k> SRem(Type:KResult, I1:#Int, I2:#Int)
            => signed(Type, I1) %Int signed(Type, I2)
        ...</k>
        when signed(Type, I2) =/=Bool 0 // catch undefined
    rule
        <k> URem(Type:KResult, I1:#Int, I2:#Int)
            => unsigned(Type, I1) %Int unsigned(Type, I2)
        ...</k>
        when unsigned(Type, I2) =/=Bool 0 // catch undefined
        
    rule
        <k> Shl(Type:KResult, I:#Int, Len:#Nat)
            => I <<Int Len
        ...</k>
    rule
        <k> LShr(Type:KResult, I:#Int, Len:#Nat)
            => unsigned(Type, I) >>Int Len
        ...</k>
    rule 
        <k> AShr(Type:KResult, I:#Int, Len:#Nat)
            => signed(Type, I:#Int) >>Int Len
        ...</k>
    rule
        <k> Or(Type:KResult, I1:#Int, I2:#Int)
            => I1 |Int I2
        ...</k>
    rule
        <k> And(Type:KResult, I1:#Int, I2:#Int)
            => I1 &Int I2
        ...</k>
    rule
        <k> Xor(Type:KResult, I1:#Int, I2:#Int)
            => I1 xorInt I2
        ...</k>


    // weave into add
        // checkNSW(unsign(I1) +Int unsign(I2), Type)
        // ~> checkNUW(sign(I1) +Int sign(I2), Type)
    // before RHS

end module

module LLVM-GEP is
    including LLVM-INCLUDE

    syntax K ::= gep

    // TODO gep indices are supposed to be treated as signed (and can definitely use -1)
    rule
        <k> GetElementPtr(Type:KResult, PtrVal:#Nat, Indices:List{K}) 
            => gep 
        ...</k>
        (. =>
            <gepInfo>...
                <gepType> Type </gepType>
                <gepResult> PtrVal </gepResult>
                <gepIndices> List{K}ToK(Indices) </gepIndices>
            ...</gepInfo>
        )

    rule
        <k> gep => Loc ...</k>
        (
            <gepInfo>...
                <gepIndices> .K </gepIndices>
                <gepResult> Loc:#Nat </gepResult>
            ...</gepInfo>
            => .
        )

    // rule <gepType> Type:KResult => Type </gepType>

    // TODO this is pretty ugly
    // these rules make sure the body of a pointer type is a result
    syntax K ::= typing
    rule
        <gepType> (. => typing) ~> PointerType(TyK:K) </gepType>
        <k> (. => TyK:K) ...</k>
        when 'isKResult(TyK) =/=Bool true // tricky
    rule
        <gepType> (typing => .) ~> PointerType((_ => Type)) </gepType>
        <k> Type:KResult => . ...</k>
    rule
        <gepType> PointerType(Type:KResult) => Type </gepType>
        <gepIndices> N:#Nat => . ...</gepIndices> 
        <gepResult> PtrVal:#Nat => PtrVal +Nat sizeof(Type) *Nat N </gepResult>
        
    rule
        <gepType> (. => typing) ~> ArrayType(TyK:K, _) </gepType>
        <k> (. => TyK:K) ...</k>
        when 'isKResult(TyK) =/=Bool true // tricky
    rule
        <gepType> (typing => .) ~> ArrayType((_ => Type), _) </gepType>
        <k> Type:KResult => . ...</k>
    rule
        <gepType> ArrayType(Type:KResult, _) => Type </gepType>
        <gepIndices> N:#Nat => . ...</gepIndices>
        <gepResult> PtrVal:#Nat => PtrVal +Nat sizeof(Type) *Nat N </gepResult>

    rule
        <gepType> (. => typing) ~> StructType(listK(TyK:K,,L:List{K})) </gepType>
        <k> (. => TyK:K) ...</k>
        when 'isKResult(TyK) =/=Bool true // tricky
    rule
        <gepType> (typing => .) ~> StructType(listK((TyK:K => Type),,L:List{K})) </gepType>
        <k> Type:KResult => . ...</k>
    // WARNING TODO: _ may match more than one result (ask Traian)
    rule
        <gepType> StructType(listK((Type:KResult => .List{K}),,L:List{K})) </gepType>
        <gepIndices> sNat(N:#Nat) => N ...</gepIndices> 
        <gepResult> PtrVal:#Nat => PtrVal +Nat sizeof(Type) </gepResult>

    rule
        <gepType> StructType(listK(Type:KResult,,L:List{K})) => Type </gepType>
        <gepIndices> 0 => . ...</gepIndices>

end module

module LLVM-MEMORY is
    including LLVM-INCLUDE

    syntax #Nat ::= nextSym #Nat
    macro nextSym(sym(N:#Nat)) = sym(N +Nat 1)

    rule
        <k> Alloca(Type:KResult, N:#Nat) => Loc +Nat 0 ...</k>
        <nextLoc> Loc:#Nat => nextSym Loc </nextLoc>
        (. =>
            <object>...
                <type> Type </type>
                <basePtr> Loc </basePtr>
                <size> sizeof(Type) *Nat N </size>
            ...</object>
        )

    rule
        <k> Store(Type:KResult, V:KResult, Loc:#Nat)
            => write(Type:KResult, V:KResult, Loc:#Nat)
        ...</k>

    syntax K ::= write "(" K "," K "," K ")" // type, value, location
    syntax K ::= writeBytes "(" K "," K ")" [strict(1)] // list of bytes, location
    
    syntax K ::= splitIntegerBytes "(" K "," K "," K ")" // value, numBytes, type
    syntax K ::= splitIntegerBytes' "(" K "," K "," List{K} ")" // value, numbytes, accumulator
    syntax K ::= splitPointerBytes "(" K "," K ")" // value, numBytes
    syntax K ::= splitPointerBytes' "(" K "," K "," K "," List{K} ")" // value, numbytes, whichByte, accumulator
    syntax K ::= splitArrayBytes "(" K "," K "," K ")" [strict(3)] // value, numBytes, innertype
    syntax K ::= splitStructBytes "(" K "," List{K} ")" // value, field types
    syntax K ::= splitStructBytes' "(" K "," List{K} "," List{K} ")" // value, field types, accumulator

    rule
        <k> write(Type:KResult, V:KResult, Loc:#Nat)
            => writeBytes(splitBytes(V, Type), Loc)
        ...</k>
    // rule
        // <k> writeBytes(listK((N:#Nat,, L:List{K})), Base:#Nat +Nat Offset:#Nat)
        // <basePtr> Base:#Nat </basePtr>
        // <bytes> M:Map => M:Map[unknownByte / Offset:#Nat] </bytes>
        // when notBool Offset in keys(M:Map)

    rule
        <k> writeBytes(listK((N:#Nat,, L:List{K})), Base:#Nat +Nat Offset:#Nat)
            => writeBytes(listK(L:List{K}), Base:#Nat +Nat sNat(Offset:#Nat))
        ...</k>
        <basePtr> Base:#Nat </basePtr>
        <bytes> M:Map => M:Map[N:#Nat / Offset:#Nat] </bytes>
        // <size> Len:#Nat </size>
        // when Offset < Len
        // i guess

    rule
        <k> writeBytes(listK(.List{K}), _) => . ...</k>

    // Type(IntegerType(Width(32)))
    // should generate list with LSBytes first
    rule
        <k> splitBytes(V:KResult, Type:KResult)
            => splitIntegerBytes(V, sizeof(Type), Type)
        ...</k>
        when isIntegerType(Type)
    
    rule
        <k> splitBytes(V:KResult, Type:KResult)
            => splitPointerBytes(V, sizeof(Type))
        ...</k>
        when isPointerType(Type)
        
    rule
        <k> splitBytes(V:KResult, Type:KResult)
            => splitArrayBytes(V, sizeof(Type), innerType(Type))
        ...</k>
        when isArrayType(Type)
        
    rule
        <k> splitBytes(V:KResult, StructType(listK(L:List{K})))
            => splitStructBytes(V, L)
        ...</k>

    rule
        <k> splitIntegerBytes(I:#Int, NumBytes:#Nat, Type:KResult)
            => splitIntegerBytes'(unsigned(Type, I), NumBytes, .List{K})
        ...</k>
    rule
        <k> splitIntegerBytes(Zeroinitializer, NumBytes:#Nat, _)
            => splitIntegerBytes'(Zeroinitializer, NumBytes, .List{K})
        ...</k>
    rule
        <k> splitIntegerBytes'(I:#Int, sNat(NumBytes:#Nat), L:List{K})
            => splitIntegerBytes'(
                I >>Int numBitsPerByte,
                NumBytes,
                (L ,, (I &Int MASK))
            )
        ...</k>
        where MASK = (2 ^Int numBitsPerByte) -Int 1
    rule
        <k> splitIntegerBytes'(Zeroinitializer, sNat(NumBytes:#Nat), L:List{K})
            => splitIntegerBytes'(Zeroinitializer, NumBytes, (L,, 0))
        ...</k>
    // TODO: ideally, the parser should canonicalize integer literals to positive
    // TODO BUG no idea why i have to use "MyK" here instead of "K"....
    rule
        <k> splitIntegerBytes'(MyK:K, 0, L:List{K})
            => listK(L)
        ...</k>
        when MyK ==Bool 0
        orBool MyK ==Bool Zeroinitializer
        
    rule
        <k> splitPointerBytes(V:KResult, NumBytes:#Nat)
            => splitPointerBytes'(V, NumBytes, 0, .List{K})
        ...</k>
    rule
        <k> splitPointerBytes'(V:KResult, sNat(NumBytes:#Nat), N:#Nat, L:List{K})
            => splitPointerBytes'(V:KResult, NumBytes, sNat(N:#Nat), (L ,, ptrByte(V, N)))
        ...</k>
    rule
        <k> splitPointerBytes'(V:KResult, 0, _, L:List{K})
            => listK(L)
        ...</k>
        
    rule
        <k> splitArrayBytes(arrayValue(L:List{K}), NumBytes:#Nat, _)
            => listK(L)
        ...</k>
        when lengthList{K}(L) ==Bool NumBytes
    
    rule
        <k> (.K => splitBytes(Zeroinitializer, Type)) ~> splitArrayBytes(Zeroinitializer, _, Type:KResult) ...</k>
        
    rule
        <k> listK(L:List{K}) ~> splitArrayBytes(Zeroinitializer, NumBytes:#Nat, Type:KResult)
            => listK(numCopies copiesOf L:List{K})
        ...</k>
        when sizeof(Type) dividesInt NumBytes
        where numCopies = NumBytes /Int sizeof(Type)
        
    // TODO assumes no padding
    // TODO need to heat types
    rule
        <k> splitStructBytes(V:KResult, L:List{K})
            => splitStructBytes'(V:KResult, L:List{K}, .List{K})
        ...</k>
    rule
        <k> splitStructBytes'(ConstantStruct(K:K, listK((V:KResult,, L'':List{K}))), (Type:KResult,, L:List{K}), L':List{K})
            => splitBytes(V, Type) 
            ~> splitStructBytes'(ConstantStruct(K:K, listK(L'')), L:List{K}, L':List{K})
        ...</k>
    rule
        <k> splitStructBytes'(Zeroinitializer, (Type:KResult,, L:List{K}), L':List{K})
            => splitBytes(Zeroinitializer, Type) 
            ~> splitStructBytes'(Zeroinitializer, L:List{K}, L':List{K})
        ...</k>
    rule
        <k> (listK(L:List{K}) => .K) ~> splitStructBytes'(_, _, (_ ,, (.List{K} => L))) ...</k>
    rule
        <k> splitStructBytes'(_, .List{K}, L:List{K})
            => listK(L)
        ...</k>
    
    // crazy stuff to reassemble pointer
    syntax #Nat ::= ptrBytes "(" K "," K "," K ")"
    rule 
        0 |Nat ptrByte(V:KResult, N:#Nat)
            => ptrByte(V:KResult, N:#Nat)
        [anywhere]
    rule
        (ptrByte(V:KResult, sNat(N:#Nat)) <<Nat Len:#Nat) |Nat ptrByte(V:KResult, N:#Nat)
            => ptrBytes(V:KResult, N:#Nat, sNat(N:#Nat))
        when Len ==Bool numBitsPerByte
        [anywhere]
    rule
        (ptrBytes(V:KResult, sNat(N:#Nat), N':#Nat) <<Nat Len:#Nat) |Nat ptrByte(V:KResult, N:#Nat)
            => ptrBytes(V:KResult, N:#Nat, N':#Nat)
        [anywhere]
    rule
        ptrBytes(V:KResult, 0, N:#Nat)
            => V
        where N ==Bool (numBytesPerPointer -Int 1)
        [anywhere]
        

    rule
        <k> Load(Type:KResult, Loc:#Nat)
            => read(Type:KResult, Loc:#Nat)
        ...</k>

    rule
        <k> read(Type:KResult, Loc:#Nat)
            => interpretBytes(readBytes(sizeof(innerType(Type:KResult)), Loc:#Nat), Type:KResult)
        ...</k>

    rule
        <k> readBytes(Len:#Nat, Loc:#Nat)
            => readBytes'(Len:#Nat, Loc:#Nat, .List{K})
        ...</k>

    rule
        <k> readBytes'(sNat(Len:#Nat), Base:#Nat +Nat Offset:#Nat, L:List{K})
            => readBytes'(Len:#Nat, Base:#Nat +Nat sNat(Offset:#Nat), (L:List{K} ,, V:KResult))
        ...</k>
        <basePtr> Base:#Nat </basePtr>
        <bytes>... Offset |-> V:KResult ...</bytes>

    rule
        <k> readBytes'(0, _, L:List{K})
            => listK(L)
        ...</k>

    rule
        <k> interpretBytes(K:KResult, Type:KResult)
            => interpretIntBytes(K:KResult, sizeof(innerType(Type)), 0)
        ...</k>

    rule
        <k> interpretIntBytes(listK((L:List{K},, N:#Nat)), sNat(Len:#Nat), N':#Nat)
            => interpretIntBytes(listK(L:List{K}), Len:#Nat, RESULT)
        ...</k>
        where RESULT = (N':#Nat <<Nat numBitsPerByte) |Nat N:#Nat

    rule interpretIntBytes(listK(.List{K}), 0, N:#Nat)
        => N:#Nat
        [anywhere]

    syntax K ::= read "(" K "," K ")"
    syntax K ::= readBytes "(" K "," K ")"
    syntax K ::= readBytes' "(" K "," K "," List{K} ")"
    syntax K ::= interpretBytes "(" K "," K ")" [strict(1)]
    syntax K ::= interpretIntBytes "(" K "," K "," K ")"

end module

module LLVM-COMPARISONS is
    including LLVM-INCLUDE

    rule INotEq(Type:KResult, I1:#Int, I2:#Int) 
        => boolToInt(unsigned(Type, I1) =/=Bool unsigned(Type, I2)) 
        [anywhere]
    // syntax K ::= isEqual "(" K "," K ")"
    rule IEq(Type:KResult, I1:#Int, I2:#Int) 
        => boolToInt(unsigned(Type, I1) ==Bool unsigned(Type, I2))
        [anywhere]
    // rule IEq(Type:KResult, I1:#Int, I2:#Int) 
        // => isEqual(unsigned(Type, I1), unsigned(Type, I2))       
        // [anywhere]
    
    rule UGT(Type:KResult, I1:#Int, I2:#Int) => boolToInt(unsigned(Type, I1:#Int) >Int unsigned(Type, I2:#Int))  [anywhere]
    rule UGE(Type:KResult, I1:#Int, I2:#Int) => boolToInt(unsigned(Type, I1:#Int) >=Int unsigned(Type, I2:#Int))  [anywhere]
    rule ULT(Type:KResult, I1:#Int, I2:#Int) => boolToInt(unsigned(Type, I1:#Int) <Int unsigned(Type, I2:#Int))  [anywhere]
    rule ULE(Type:KResult, I1:#Int, I2:#Int) => boolToInt(unsigned(Type, I1:#Int) <=Int unsigned(Type, I2:#Int))  [anywhere]
    rule SGT(Type:KResult, I1:#Int, I2:#Int) => boolToInt(signed(Type, I1:#Int) >Int signed(Type, I2:#Int))  [anywhere]
    rule SGE(Type:KResult, I1:#Int, I2:#Int) => boolToInt(signed(Type, I1:#Int) >=Int signed(Type, I2:#Int))  [anywhere]
    rule SLT(Type:KResult, I1:#Int, I2:#Int) => boolToInt(signed(Type, I1:#Int) <Int signed(Type, I2:#Int))  [anywhere]
    rule SLE(Type:KResult, I1:#Int, I2:#Int) => boolToInt(signed(Type, I1:#Int) >=Int signed(Type, I2:#Int))  [anywhere]
    
    // rule canonicalize(Type:KResult, I:#Int) => ((I:#Int %Int BASE) +Int BASE) %Int BASE
        // when isIntegerType(Type)
        // where BASE = (2 ^Int sizeofInBits(Type))
        
        // [anywhere]

    syntax #Int ::= boolToInt "(" K ")"
    rule boolToInt(true) => 1   [anywhere]
    rule boolToInt(false) => 0  [anywhere]

end module

module LLVM-CONVERSIONS is
    including LLVM-INCLUDE
    
    // TODO only handling scalars
    rule
        <k> Trunc(Type:KResult, I:#Int) => signed(Type, I) ...</k>
    
    // TODO only handling scalars
    rule
        <k> ZExt(Type:KResult, I:#Int) => unsigned(Type, I) ...</k>
    
    // TODO only handling scalars
    rule
        <k> SExt(Type:KResult, I:#Int) => signed(Type, I) ...</k>
        
    // TODO need to normalize here
    rule
        <k> BitCast(_, I:#Int) => I:#Int ...</k>
        
    syntax #Nat ::= intToPtr "(" K "," K ")"
    syntax #Int ::= ptrToInt "(" K "," K ")"
    // TODO need to normalize here
    rule
        <k> IntToPtr(Type:KResult, I:#Int) => intToPtr(Type, I) ...</k>
    rule
        <k> PtrToInt(Type:KResult, N:#Nat) => ptrToInt(Type, N) ...</k>
        
    // TODO needs side conditions
    rule ptrToInt(Type:KResult, intToPtr(Type':KResult, I:#Int)) => I:#Int
    rule intToPtr(Type:KResult, ptrToInt(Type':KResult, N:#Nat)) => N:#Nat

    rule unsigned(Type:KResult, sym(Base:#Nat) +Nat Offset:#Nat)
        => ptrToInt(Type, sym(Base:#Nat) +Nat Offset:#Nat)
    rule signed(Type:KResult, sym(Base:#Nat) +Nat Offset:#Nat) 
        => ptrToInt(Type, sym(Base:#Nat) +Nat Offset:#Nat)
    
    
    // Chucky's sucky rules
    rule ptrToInt(_, sym(Base:#Nat) +Nat Offset:#Nat) >Int ptrToInt(_, sym(Base:#Nat) +Nat Offset':#Nat)
        => Offset >Int Offset'
    rule ptrToInt(_, sym(Base:#Nat) +Nat Offset:#Nat) >=Int ptrToInt(_, sym(Base:#Nat) +Nat Offset':#Nat)
        => Offset >=Int Offset'
    rule ptrToInt(_, sym(Base:#Nat) +Nat Offset:#Nat) <Int ptrToInt(_, sym(Base:#Nat) +Nat Offset':#Nat)
        => Offset <Int Offset'
    rule ptrToInt(_, sym(Base:#Nat) +Nat Offset:#Nat) <=Int ptrToInt(_, sym(Base:#Nat) +Nat Offset':#Nat)
        => Offset <=Int Offset'
            
    
    // // david's crazy/cool rule
    // rule ptrToInt(sym(N) + M) => M

    // unsigned(somePtr) => PtrToNat(somePtr)
    // signed(somePtr) => PtrToInt(somePtr)
    // UGT(Pointer, sym(5) + 0, sym(5) + 2)
    
    // ptr1 > ptr ==> PtrToInt(ptr1) > PtrToInt(ptr2)
    
    // IntToPtr(Zext(..., PointerToInt(sym(5))))
    
    
    // PtrToInt(IntToPtr(5)) == 5
    // IntToPtr(PtrToInt(sym(5) + 6)) == sym(5) + 6
end module


module LLVM-LITERALS is
    including LLVM-INCLUDE
    
    rule
        <k> ConstantString(S:#String)
            => arrayValue(StringToList{K}(S))
        ...</k>

    rule
        <k> ConstantArray(Type:KResult, listK(L:List{K}))
            => createArrayValue(Type, L)
        ...</k>
       
    syntax K ::= createArrayValue "(" K "," List{K} ")"
    syntax K ::= createArrayValue' "(" K "," List{K} "," List{K} ")"
    syntax K ::= createArrayValue'' "(" K "," List{K} "," K "," List{K} ")" [strict(3)]
    
    // declare createArrayValue : K List{K} -> K
    // declare createArrayValue' : K List{K} List{K} -> K
    // declare createArrayValue'' : K List{K} K List{K} -> K
    
    rule
        <k> createArrayValue(Type:KResult, L:List{K})
            => createArrayValue'(Type:KResult, L:List{K}, .List{K})
        ...</k>
    rule
        <k> createArrayValue'(Type:KResult, (K:K,, L:List{K}), L':List{K})
            => createArrayValue''(Type:KResult, L:List{K}, splitBytes(K, Type), L':List{K})
        ...</k>
    rule
        <k> createArrayValue''(Type:KResult, L:List{K}, listK(L'':List{K}), L':List{K})
            => createArrayValue'(Type:KResult, L:List{K}, (L':List{K},, L'':List{K}))
        ...</k>
    rule
        <k> createArrayValue'(_, .List{K}, L:List{K})
            => arrayValue(L)
        ...</k>

    // declare stringToArray : K -> K
    // declare stringToArray' : K K -> K
    
    // define
        // stringToArray(S:#String)
            // => arrayValue( StringToListstringToArray'(S:#String, .List{K})
    // define
        // stringToArray'("", L:List{K})
            // => listK(L)
    // define
        // stringToArray'(S:#String, L:List{K})
            // => stringToArray'(tail(S:#String), (L:List{K},, head(S)))
        
    
end module

module LLVM-STANDARD-LIBRARY is
    including LLVM-INCLUDE
    
    // TODO accidentally using where instead of when leads to no error message; it just drops the condition
    
    /////////////////////////////////////////////////////////
    // turning calls to intrinsics into semantic productions
    // perhaps this kind of stuff could be generalized, or done away with
    // its purpose is to make the actual function definitions nice
    syntax K ::= exit "(" K ")"
    rule
        <k> Call(_, Callee(funptr(Name("@exit")), listK(V:KResult)))
            => exit(V)
        ...</k>

    syntax K ::= memcpy "(" K "," K "," K "," K "," K ")"
    rule
        // TODO why doesn't this work?
        // <k> Call(_, Callee(funptr(Name(S:#String)), listK(L:List{K})))
            // => 'memcpy`(_`,_`,_`,_`,_`)(L)
        <k> Call(_, Callee(funptr(Name(S:#String)), listK(V1:KResult,, V2:KResult,, V3:KResult,, V4:KResult,, V5:KResult)))
            => memcpy(V1, V2, V3, V4, V5)
        ...</k>
        when substrString(S, 0, 13) ==Bool "@llvm.memcpy."

    syntax K ::= memset "(" K "," K "," K "," K "," K ")"
    rule
        <k> Call(_, Callee(funptr(Name(S:#String)), listK(V1:KResult,, V2:KResult,, V3:KResult,, V4:KResult,, V5:KResult)))
            => memset(V1, V2, V3, V4, V5)
        ...</k>
        when substrString(S, 0, 13) ==Bool "@llvm.memset."

    syntax K ::= lifetimeStart "(" K "," K ")"
    rule
        <k> Call(_, Callee(funptr(Name("@llvm.lifetime.start")), listK(V1:KResult,, V2:KResult)))
            => lifetimeStart(V1, V2)
        ...</k>
        
    syntax K ::= lifetimeEnd "(" K "," K ")"
    rule
        <k> Call(_, Callee(funptr(Name("@llvm.lifetime.end")), listK(V1:KResult,, V2:KResult)))
            => lifetimeEnd(V1, V2)
        ...</k>

    /////////////////////////////////////////////////////////
    // actual library definitions
    rule
        <k> exit(I:#Int) ~> _
            => I:#Int
        </k>
    
    // memcpy
    rule
        <k> memcpy(Dest:#Nat, Src:#Nat, sNat(Len:#Nat), K1:K, K2:K)
            => Store(byteType, Load(PointerType(byteType), Src), Dest)
            ~> memcpy(Dest +Nat 1, Src +Nat 1, Len, K1, K2)
        ...</k>
    rule
        <k> memcpy(_, _, 0, _, _) => . ...</k>
        
    // memset
    rule
        <k> memset(Dest:#Nat, N:#Nat, sNat(Len:#Nat), K1:K, K2:K)
            => Store(byteType, N, Dest)
            ~> memset(Dest +Nat 1, N, Len, K1, K2)
        ...</k>
    rule
        <k> memset(_, _, 0, _, _) => . ...</k>
        
    // lifetimeStart
    // don't need to do anything for positive semantics
    rule
        <k> lifetimeStart(_, _) => . ...</k>
        
    // lifetimeEnd
    // don't need to do anything for positive semantics
    rule
        <k> lifetimeEnd(_, _) => . ...</k>
    
end module

module LLVM-SEMANTICS is
    including LLVM-INCLUDE

    including LLVM-CLEAN-TREE
    including LLVM-MISC
    including LLVM-GLOBALS
    including LLVM-BRANCHING
    including LLVM-SELECTION
    including LLVM-REGISTERS
    including LLVM-START-AND-STOP
    including LLVM-CALL-RET
    including LLVM-DECLARATIONS
    including LLVM-ARITHMETIC
    including LLVM-GEP
    including LLVM-MEMORY
    including LLVM-COMPARISONS
    including LLVM-CONVERSIONS
    including LLVM-LITERALS
    including LLVM-STANDARD-LIBRARY
end module
