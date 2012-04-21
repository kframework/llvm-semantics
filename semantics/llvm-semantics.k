module LLVM-SPECIAL is
    including LLVM-SYNTAX

    syntax KResult ::= #Int | #String | #Float
    syntax KResult ::= arrayValue "(" List{K} ")"

    syntax #Nat ::= sym "(" #Int ")"    // TODO [semantic]
    syntax #Nat ::= funptr "(" K ")"
    syntax #Nat ::= ptrByte "(" K "," K ")" // address, byteNumber; part of a pointer, as a byte
    syntax #Nat ::= floatByte "(" K "," K "," K ")" // float, type, byte number

    syntax K ::= debug // TODO [semantic]


end module

module LLVM-CONFIGURATION is
    including LLVM-SYNTAX
    including LLVM-SPECIAL


    syntax K ::= callMain // TODO [semantic]
    syntax K ::= initGlobals // TODO [semantic]

    configuration
        <T multiplicity="?">
            <k color="LightGreen"> $PGM:K ~> initGlobals ~> callMain </k>
            <callStack color="Goldenrod"> .List </callStack>
            <nextLoc color="gray"> sym(1) </nextLoc>
            <brk> sym(0) +Nat 0 </brk>
            @latex("\\kBR")
            <control color="LightGoldenrod">
                <currBlock color="Orchid"> Name("Initial") </currBlock>
                <prevBlock color="Orchid"> Name("Initial") </prevBlock>
                <currModule color="Orchid"> Name("Initial") </currModule>
                <currFunction color="Orchid"> Name("Initial") </currFunction>
                @latex("\\kBR")
                <valist> .List </valist>
                <registers color="teal"> .Map </registers>
                // TODO: this should eventually be a Set
                <currentModifiers color="Orchid"> .List </currentModifiers>
                <localMemory> .List </localMemory>
            </control>
            @latex("\\kBR")
            <memory color="teal">
                <object multiplicity="*" color="LightSkyBlue">
                    <basePtr color="orange"> -1 </basePtr>
                    <type> .K </type>
                    <size> 0 </size>
                    <bytes> .Map </bytes>
                </object>
            </memory>
            // auxiliary cells:
            <gepInfo multiplicity="?" color="red">
                <gepType> .K </gepType>
                <gepResult> 0 </gepResult>
                <gepIndices> .K </gepIndices>
            </gepInfo>
            <output stream="stdout" color="DodgerBlue"> .List </output>
            @latex("\\kBR")
            <modules color="teal">
                <module multiplicity="*" color="LightSkyBlue">
                    <moduleName color="orange"> Name("") </moduleName>
                    <targetLayout> "" </targetLayout>
                    <targetTriple> "" </targetTriple>
                    @latex("\\kBR")
                    <typedefs> .Map </typedefs>
                    <savedGlobals> .K </savedGlobals>
                    <globalRegisters color="teal"> .Map </globalRegisters>
                    @latex("\\kBR")
                    <functions color="teal">
                        <function multiplicity="*" color="LightSkyBlue">
                            <functionName color="orange"> Name("") </functionName>
                            <returnType> .K </returnType>
                            <formalParameters> .K </formalParameters>
                            @latex("\\kBR")
                            <basicBlocks> .Map </basicBlocks>
                            <initialBasicBlock> .K </initialBasicBlock>
                        </function>
                    </functions>
                    @latex("\\kBR")
                    <typeInfos color="teal">
                        <typeInfo multiplicity="*" color="LightSkyBlue">
                            <typeName color="orange"> Name("") </typeName>
                            <offsets> .Map </offsets>
                        </typeInfo>
                    </typeInfos>
                </module>
            </modules>
            @latex("\\kBR")
        </T>
        @latex("\\kBR")
        <result multiplicity="?" color="DodgerBlue">
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

    // TODO many possible errors will slip by with this, but lots of stuff will work
    rule
        Null => sym(-1) +Nat 0 [anywhere]
        
    syntax K ::= splitBytes "(" K "," K ")" // value, type
    syntax K ::= joinBytes "(" K "," K ")" [strict(1)]

    syntax #Nat ::= wvalist "(" List "," K ")"

    declare byteType : -> K
    define byteType => IntegerType(numBitsPerByte)

    declare i : K -> K [latex "i({#1})"]
    define i(N:#Nat) => IntegerType(N)

    declare sizeofInBits : K -> #Nat

    syntax #Nat ::= intToPtr "(" K "," K ")"
    syntax #Int ::= ptrToInt "(" K "," K ")"
    syntax K ::= read "(" K "," K ")" [strict(1)]
    syntax K ::= write "(" K "," K "," K ")" [strict] // type, value, location

    syntax K ::= isLocation "(" K ")"
    rule isLocation(sym(_:#Int) +Int _:#Int) => true [anywhere]
    rule isLocation(sym(_:#Int) +Nat _:#Nat) => true [anywhere]
    rule isLocation(funptr(_)) => true [anywhere]

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

    // case when in bounds
    rule
        signed(Type:KResult, I:#Int) => I
        when smin(Type) <=Int I andBool smax(Type) >=Int I
        [anywhere]

    // this reduces it to be close
    rule
        signed(Type:KResult, I:#Int)
            => signed(Type:KResult, I %Int (umax(Type) +Nat 1))
        when I >Int umax(Type) // note umax here
        [anywhere]
    // this picks up any extra distance
    rule
        signed(Type:KResult, I:#Int)
            => I -Int (umax(Type) +Nat 1)
        when I >Int smax(Type) andBool I <=Int umax(Type)
        [anywhere]

    // same as above
    rule
        signed(Type:KResult, I:#Int)
            => signed(Type:KResult, I %Int (umax(Type) +Nat 1))
        when I <Int -Int umax(Type)
        [anywhere]
    rule
        signed(Type:KResult, I:#Int)
            => I +Int (umax(Type) +Nat 1)
        when I <Int smin(Type) andBool I >=Int -Int umax(Type)
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
    rule isIntegerType(IntegerType(_)) => true  [anywhere]
    rule isIntegerType(KLabel:KLabel(_)) => false
        when KLabel =/=Bool 'IntegerType
        [anywhere]
    syntax #Bool ::= isFloatType "(" K ")" // predicate
    rule isFloatType(FloatType) => true [anywhere]
    rule isFloatType(DoubleType) => true [anywhere]
    rule isFloatType(X86FP80Type) => true [anywhere]
    rule isFloatType(FP128Type) => true [anywhere]
    rule isFloatType(PPCFP128Type) => true [anywhere]
    rule isFloatType(X86MMXType) => true [anywhere]

    syntax #Bool ::= isPointerType "(" K ")" // predicate
    rule isPointerType(PointerType(_)) => true  [anywhere]
    syntax #Bool ::= isArrayType "(" K ")" // predicate
    rule isArrayType(ArrayType(_, _)) => true  [anywhere]
    syntax #Bool ::= isStructType "(" K ")" // predicate
    rule isStructType(StructType(_)) => true  [anywhere]

    // fixme size should depend on architecture
    define sizeofInBits(PointerType(_)) => numBytesPerPointer *Nat numBitsPerByte
    define sizeofInBits(ArrayType(Type:KResult, Len:#Nat)) => sizeofInBits(Type) *Nat Len

    define sizeofInBits(IntegerType(N:#Nat)) => N
    define sizeofInBits(FloatType) => 32
    define sizeofInBits(DoubleType) => 64
    define sizeofInBits(X86FP80Type) => 80
    // TODO listK should be Fields (bug in K)
    define sizeofInBits(StructType(listK((Type:KResult,,L:List{K}))))
      => sizeofInBits(Type) +Nat sizeofInBits(StructType(listK(L)))
    define sizeofInBits(StructType(listK(.List{K}))) => 0

    declare sizeof : K -> #Nat
    define sizeof(Type:KResult) => sizeofInBits(Type) /Nat numBitsPerByte
        when numBitsPerByte dividesNat sizeofInBits(Type)

    declare zeroOfType : K -> K
    define zeroOfType(Type:KResult) => 0
        when isIntegerType(Type)


    declare _copiesOf_ : K List{K} -> List{K}
    define sNat(N:#Nat) copiesOf L:List{K} => L,, (N:#Nat copiesOf L)
    define 0 copiesOf _ => .List{K}

    define N:#Nat +Int (Offset:#Nat +Nat sym(Base:#Nat))
        => (N +Nat Offset) +Nat sym(Base)

    define I:#Int +Int (Offset:#Nat +Nat sym(Base:#Nat))
        => (absInt(I +Int Offset)) +Nat sym(Base)
        when I <Int 0 andBool I +Int Offset >=Int 0

end module

module LLVM-STANDARD-LIBRARY-SYNTAX is
    including LLVM-SYNTAX
    
    syntax K ::= memcpy "(" K "," K "," K "," K "," K ")"
    syntax K ::= memset "(" K "," K "," K "," K "," K ")"
    
    syntax K ::= lifetimeStart "(" K "," K ")"
    syntax K ::= lifetimeEnd "(" K "," K ")"
    
    syntax K ::= vaStart "(" K ")"
    syntax K ::= vaCopy "(" K "," K ")"
end module

module LLVM-SYSCALLS-SYNTAX is
    including LLVM-SYNTAX

    declare syscallHandler : K -> KLabel

    syntax KLabel ::= 'sys-write
    define syscallHandler(4) => 'sys-write

    syntax KLabel ::= 'sys-getpid
    define syscallHandler(20) => 'sys-getpid

    syntax KLabel ::= 'sys-brk
    define syscallHandler(45) => 'sys-brk

    syntax KLabel ::= 'sys-ioctl
    define syscallHandler(54) => 'sys-ioctl

    syntax KLabel ::= 'sys-rt-sigprocmask
    define syscallHandler(175) => 'sys-rt-sigprocmask

    syntax KLabel ::= 'sys-gettid
    define syscallHandler(224) => 'sys-gettid

    syntax KLabel ::= 'sys-exit-group
    define syscallHandler(248) => 'sys-exit-group

    syntax KLabel ::= 'sys-tgkill
    define syscallHandler(268) => 'sys-tgkill

end module

/* this module gets included by all later modules */
module LLVM-INCLUDE is
    including LLVM-CONFIGURATION
    including LLVM-SETTINGS
    including LLVM-HELPERS
    including LLVM-STANDARD-LIBRARY-SYNTAX
    including LLVM-SYSCALLS-SYNTAX

end module

/* this module contains rules for cleaning up the AST */
module LLVM-CLEAN-TREE is
    including LLVM-INCLUDE

    rule <k> Operand(Type:KResult, I:#Int) => signed(Type, I) ...</k>
        when isIntegerType(Type)
    rule <k> Operand(Type:KResult, V:KResult) => V ...</k>
        when notBool isIntegerType(Type)
    // rule <k> Operand(Type:KResult, V:KResult) => V ...</k>

    rule GlobalVariables(L:List{K}) => List{K}ToK(L)  [anywhere]
    rule Functions(L:List{K}) => List{K}ToK(L)        [anywhere]
    rule Typedefs(L:List{K}) => List{K}ToK(L)         [anywhere]
	rule <k> Aliases(L:List{K}) => List{K}ToK(L) ...</k>
    //rule Body(L:List{K}) => List{K}ToK(L)
    rule Instructions(L:List{K}) => List{K}ToK(L)     [anywhere]
    rule ModuleID(S:#String) => Name(S)               [anywhere]
    rule Value(K:K) => K                              [anywhere]
    rule Br(K:K) => K:K                               [anywhere]
    rule ReturnType(K:K) => K [anywhere]

    rule ICmp(Predicate("ne"), TyK:K, K1:K, K2:K) => INotEq(TyK:K, K1:K, K2:K)
    rule ICmp(Predicate(Str:#String), TyK:K, K1:K, K2:K) => IEq(TyK:K, K1:K, K2:K)
        when Str ==Bool "e" +String "q" // TODO avoiding bug in kompile
    rule ICmp(Predicate("ugt"), TyK:K, K1:K, K2:K) => UGT(TyK:K, K1:K, K2:K)
    rule ICmp(Predicate("uge"), TyK:K, K1:K, K2:K) => UGE(TyK:K, K1:K, K2:K)
    rule ICmp(Predicate("ult"), TyK:K, K1:K, K2:K) => ULT(TyK:K, K1:K, K2:K)
    rule ICmp(Predicate("ule"), TyK:K, K1:K, K2:K) => ULE(TyK:K, K1:K, K2:K)
    rule ICmp(Predicate("sgt"), TyK:K, K1:K, K2:K) => SGT(TyK:K, K1:K, K2:K)
    rule ICmp(Predicate("sge"), TyK:K, K1:K, K2:K) => SGE(TyK:K, K1:K, K2:K)
    rule ICmp(Predicate("slt"), TyK:K, K1:K, K2:K) => SLT(TyK:K, K1:K, K2:K)
    rule ICmp(Predicate("sle"), TyK:K, K1:K, K2:K) => SLE(TyK:K, K1:K, K2:K)
	
	rule FCmp(Predicate("false"), _, _, _) => 1
	rule FCmp(Predicate("oeq"), TyK:K, K1:K, K2:K) => OEQ(TyK:K, K1:K, K2:K)
	rule FCmp(Predicate("ogt"), TyK:K, K1:K, K2:K) => OGT(TyK:K, K1:K, K2:K)
	rule FCmp(Predicate("oge"), TyK:K, K1:K, K2:K) => OGE(TyK:K, K1:K, K2:K)
	rule FCmp(Predicate("olt"), TyK:K, K1:K, K2:K) => OLT(TyK:K, K1:K, K2:K)
	rule FCmp(Predicate("ole"), TyK:K, K1:K, K2:K) => OLE(TyK:K, K1:K, K2:K)
	rule FCmp(Predicate("one"), TyK:K, K1:K, K2:K) => ONE(TyK:K, K1:K, K2:K)
	rule FCmp(Predicate("ono"), TyK:K, K1:K, K2:K) => ONO(TyK:K, K1:K, K2:K)
	rule FCmp(Predicate("ueq"), TyK:K, K1:K, K2:K) => UEQ(TyK:K, K1:K, K2:K)
	rule FCmp(Predicate("ugt"), TyK:K, K1:K, K2:K) => UGT(TyK:K, K1:K, K2:K)
	rule FCmp(Predicate("uge"), TyK:K, K1:K, K2:K) => UGE(TyK:K, K1:K, K2:K)
	rule FCmp(Predicate("ult"), TyK:K, K1:K, K2:K) => ULT(TyK:K, K1:K, K2:K)
	rule FCmp(Predicate("ule"), TyK:K, K1:K, K2:K) => ULE(TyK:K, K1:K, K2:K)
	rule FCmp(Predicate("une"), TyK:K, K1:K, K2:K) => UNE(TyK:K, K1:K, K2:K)
	rule FCmp(Predicate("uno"), TyK:K, K1:K, K2:K) => UNO(TyK:K, K1:K, K2:K)
	rule FCmp(Predicate("true"), _, _, _) => 1

    rule
        <k> Instruction(Modifiers(L:List{K}), K:K) => K ...</k>
        <currentModifiers> _ => List(L) </currentModifiers>

    rule
        <k> ConstantExpr(Modifiers(L:List{K}), K:K) => K ...</k>
        <currentModifiers> _ => List(L) </currentModifiers>
end module

module LLVM-GLOBALS is
    including LLVM-INCLUDE

    syntax K ::= preInit "(" K "," K "," K ")" [strict(2)]

     rule
        <k> GlobalVariable(X:Id, Modifiers(L:List{K}), PointerType(TyK:K), Init:K)
            => preInit(X, Alloca(TyK:K, 1), Init:K)
        ...</k>
        <currentModifiers> _ => List(L) </currentModifiers>

    rule
        <k> preInit(X:Id, Loc:#Nat, Initializer(TK:K, K:K)) => . ...</k>
        <savedGlobals>... . => Store(TK:K, K:K, Loc) </savedGlobals>
        <globalRegisters> M:Map => M[Loc/X] </globalRegisters>

    rule <k> initGlobals => K:K ...</k>
        <savedGlobals> K:K => . </savedGlobals>

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
        <k> X => K ...</k>
        <globalRegisters>... X |-> K:K ...</globalRegisters>
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
        when unsigned(i(1), I) ==Bool 1
    rule
        <k> Conditional(I:#Int, _, Label:K)
            => Unconditional(Label:K)
        </k>
        when unsigned(i(1), I) ==Bool 0

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

module LLVM-PHI is
	// TODO possibly preprocess PHI
    including LLVM-INCLUDE
    
    rule
        <k> PHI(_, (Edge(K:K, Name:Id),, _:List{K})) => K:K ...</k>
        <prevBlock> Name </prevBlock>
    rule
        <k> PHI(_, ((Edge(K:K, Name:Id) => .List{K}),, _:List{K})) ...</k>
        <prevBlock> Name':Id </prevBlock>
        when Name =/=Bool Name'
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

    rule
        <k> callMain
            => Call(i(32), Callee(Value(Name("@__libc_start_main_0")),
                Arguments((
                    funptr(Name("@main")),, // address of main
                    0,, // argc
                    Alloca(i(8), 8),, // argv
                    Null,, // init
                    Null,, // fini
                    Null // ldso_fini
                ))
            ))
        </k>
        <functionName> Name("@main") </functionName>
        <formalParameters> Arguments(L:List{K}) </formalParameters>
        when lengthList{K}(L) ==Bool 0

    // TODO need to initialize argc and argv properly
    // TODO need to make nicer
    rule
        <k> callMain
            => Call(i(32), Callee(Value(Name("@__libc_start_main_2")),
                Arguments((
                    funptr(Name("@main")),, // address of main
                    0,, // argc
                    (
                        initEnvStructures(Alloca(i(8), ARGVSIZE))
                    ),,
                    Null,, // init
                    Null,, // fini
                    Null // ldso_fini
                ))
            ))
        </k>
        <functionName> Name("@main") </functionName>
        <formalParameters> Arguments(L:List{K}) </formalParameters>
        when lengthList{K}(L) ==Bool 2
        where PTRTYPE = PointerType(i(8))
        and ARGVSIZE = (sizeof(PTRTYPE) *Int 3) +Int (sizeof(i(64)) *Int 38)

    syntax K ::= initEnvStructures "(" K ")" [strict]
    syntax K ::= initEnvStructures' "(" K ")"

    rule // argv & envp
        <k> initEnvStructures(Loc:#Nat)
            => write(ARRAYTYPE, Zeroinitializer, Loc)
            ~> initEnvStructures'(Loc +Nat sizeof(ARRAYTYPE))
            ~> Loc
        ...</k>
        where ARRAYTYPE = ArrayType(PointerType(i(8)), 3)
    rule
        <k> initEnvStructures'(Loc:#Nat)
            => memset(Loc, 0, 37, .K, .K) // auxv
        ...</k>

    rule [terminate-exit]:
        <T>...
            <k> I:#Int => Call(VoidType, Callee(Value(Name("@exit")), Arguments(I))) </k>
        ...</T>

    // TODO it's not clear whether this belongs here or in SYSCALLS-IMPL
    rule
        <T>...
            <k> 'sys-exit-group(I:#Int,,_) ...</k>
            <output> #ostream(1) #buffer(.) </output>
        ...</T>
        =>
        <result>...
            <returnValue> I remInt 256 </returnValue>
        ...</result>

end module

module LLVM-DECLARATIONS is
    including LLVM-INCLUDE

    rule
        <k> Alias(Name:Id, K:K) => . ...</k>
        <globalRegisters> Map:Map => Map[K/Name] </globalRegisters>

    rule
        <k> Module(Name:Id, TargetLayout:K, TargetTriple:K, Typedefs:K, GlobalVars:K, Aliases:K, Functions:K)
            => Typedefs
            ~> GlobalVars
            ~> Aliases
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
        <k> Typedef(X:Id, UnresolvedType:K) => . ...</k>
        //<currentModifiers> _ => List(L) </currentModifiers> TODO not printing modifiers
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
    syntax K ::= bind "(" List{K} "," List{K} ")"

    rule
        <k> Arguments(L:List{K}) => listK(L) ...</k>
        when 'isKResult(L)

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

    rule
        <k> Call(_, Callee(funptr(FunName:Id), listK(Args:List{K}))) ~> Tail:K
            => contextSwitch(FunName, Tail)
            ~> bind(Args, Formals)
            ~> Body
        </k>
        @latex("\\kBR")
        <module>...
            <functionName> FunName </functionName>
            <formalParameters> Arguments(Formals:List{K}) </formalParameters>
            <initialBasicBlock> IBBName:Id </initialBasicBlock>
            <basicBlocks>... IBBName |-> Body:K ...</basicBlocks>
        ...</module>
        [large]
    
    syntax K ::= contextSwitch "(" K "," K ")"

    rule
        <k> contextSwitch(FunName, Tail) => . ...</k>
        (<control>
            C:Bag 
        </control> =>
        <control>...
            <currFunction> FunName:Id </currFunction>
        ...</control>)
        <callStack> . => frame(Tail, C) ...</callStack>

        

    // might need a way to convert nonmatching types here?  depends on semantics
    rule
        <k> bind((Arg:K,, Args:List{K}), (Arg(_, _, Formal:K),, Formals:List{K}))
            => Assign(Formal, Arg)
            ~> bind(Args:List{K}, Formals:List{K})
        ...</k>
    rule
        <k> bind(.List{K}, .List{K}) => . ...</k>

    rule
        <k> bind(((Arg:K => .List{K}),, _:List{K}), Vararg) ...</k>
        <valist>... . => ListItem(Arg) </valist>

    rule
        <k> bind(.List{K}, Vararg) => . ...</k>

    // TODO this isn't great.  would be better to check type when doing the call/returning and handle appropriately
    syntax K ::= clearVoid

    // TODO rename Tail
    rule
        <k> Ret(V:KResult) ~> _ 
            => clearLocalMemory(Locals)
            ~> V ~> clearVoid 
            ~> Tail
        </k>
        <callStack> frame(Tail:K, C:Bag) => . ...</callStack>
        <control> <localMemory> Locals:List </localMemory> _ => C </control>
    
    syntax K ::= clearLocalMemory "(" List ")"
    rule
        <k> clearLocalMemory((ListItem(Loc:#Nat) => .) _) ...</k>
        (<object>... <basePtr> Loc </basePtr> ...</object> => .)
        
    rule
        <k> clearLocalMemory(.) => . ...</k>
    
    rule
        <k> VoidValue ~> clearVoid => . ...</k>
    rule
        <k> V:KResult ~> clearVoid => V ...</k>
        when V =/=Bool VoidValue
end module

module LLVM-VARIADICS is
    including LLVM-INCLUDE

    syntax K ::= valist "(" List{K} "," K ")"
    syntax K ::= vaArg "(" K "," K "," K ")" [strict]

    rule
        <k> VAArg(Type:KResult, Loc:#Nat) => vaArg(Type, Loc, read(i(numBitsPerByte), Loc)) ...</k>

    rule
        <k> vaArg(Type, Loc:#Nat, wvalist((ListItem(K:K) VAList:List), _))
            => write(i(numBitsPerByte), wvalist(VAList, Loc), Loc)
            ~> K
        ...</k>

    // TODO a really sketchy rule:
    rule
        0 |Nat wvalist(VAList:List, Loc:#Nat)
            => wvalist(VAList:List, Loc:#Nat)
        [anywhere]


end module

module LLVM-ARITHMETIC is
    including LLVM-INCLUDE

    rule [add]:
        <k> Add(Type:KResult, I1:#Int, I2:#Int)
            => signed(Type, I1 +Int I2)
        ...</k>
    rule
        <k> Sub(Type:KResult, I1:#Int, I2:#Int)
            => signed(Type, I1 -Int I2)
        ...</k>
    rule
        <k> Mul(Type:KResult, I1:#Int, I2:#Int)
            => signed(Type, I1 *Int I2)
        ...</k>
    rule
        <k> SDiv(Type:KResult, I1:#Int, I2:#Int)
            => signed(Type, (signed(Type, I1) /Int signed(Type, I2)))
        ...</k>
        when signed(Type, I2) =/=Bool 0 // catch undefined
    rule
        <k> UDiv(Type:KResult, I1:#Int, I2:#Int)
            => signed(Type, (unsigned(Type, I1) /Int unsigned(Type, I2)))
        ...</k>
        when unsigned(Type, I2) =/=Bool 0 // catch undefined
    rule
        <k> SRem(Type:KResult, I1:#Int, I2:#Int)
            => signed(Type, (signed(Type, I1) %Int signed(Type, I2)))
        ...</k>
        when signed(Type, I2) =/=Bool 0 // catch undefined
    rule
        <k> URem(Type:KResult, I1:#Int, I2:#Int)
            => signed(Type, (unsigned(Type, I1) %Int unsigned(Type, I2)))
        ...</k>
        when unsigned(Type, I2) =/=Bool 0 // catch undefined

    rule
        <k> Shl(Type:KResult, I:#Int, Len:#Nat)
            => signed(Type, I <<Int Len)
        ...</k>
    rule
        <k> LShr(Type:KResult, I:#Int, Len:#Nat)
            => signed(Type, unsigned(Type, I) >>Int Len)
        ...</k>
    rule
        <k> AShr(Type:KResult, I:#Int, Len:#Nat)
            => signed(Type, signed(Type, I:#Int) >>Int Len)
        ...</k>
    rule
        <k> Or(Type:KResult, I1:#Int, I2:#Int)
            => signed(Type, I1 |Int I2)
        ...</k>
    rule
        <k> And(Type:KResult, I1:#Int, I2:#Int)
            => signed(Type, I1 &Int I2)
        ...</k>
    rule
        <k> Xor(Type:KResult, I1:#Int, I2:#Int)
            => signed(Type, I1 xorInt I2)
        ...</k>


    // weave into add
        // checkNSW(unsign(I1) +Int unsign(I2), Type)
        // ~> checkNUW(sign(I1) +Int sign(I2), Type)
    // before RHS

end module

module LLVM-FLOATING-POINT-ARITHMETIC is
    including LLVM-INCLUDE

    rule
        <k> FAdd(Type:KResult, F1:#Float, F2:#Float)
            => F1 +Float F2
        ...</k>

    rule
        <k> FSub(Type:KResult, F1:#Float, F2:#Float)
            => F1 -Float F2
        ...</k>

    rule
        <k> FMul(Type:KResult, F1:#Float, F2:#Float)
            => F1 *Float F2
        ...</k>

end module

module LLVM-GEP is
    including LLVM-INCLUDE

    syntax K ::= gep

    // TODO gep indices are supposed to be treated as signed (and can definitely use -1)
    rule
        <k> GetElementPtr(Type:KResult, PtrVal:#Nat, Indices:List{K})
            => Type ~> gep
        ...</k>
        (. =>
            <gepInfo>...
                // <gepType> Type </gepType>
                <gepResult> PtrVal </gepResult>
                <gepIndices> List{K}ToK(Indices) </gepIndices>
            ...</gepInfo>
        )
        when isLocation(PtrVal) // to stop computation early

    rule
        <k> _:KResult ~> gep => Loc ...</k>
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
    context PointerType(HOLE) ~> gep
    rule
        <k> PointerType(Type:KResult) => Type ...</k>
        <gepIndices> I:#Int => . ...</gepIndices>
        <gepResult> PtrVal:#Nat => PtrVal +Int sizeof(Type) *Int I </gepResult>

    rule
        <k> ArrayType(Type:KResult, _) => Type ...</k>
        <gepIndices> N:#Nat => . ...</gepIndices>
        <gepResult> PtrVal:#Nat => PtrVal +Nat sizeof(Type) *Nat N </gepResult>

    // WARNING TODO: _ may match more than one result (ask Traian)
    rule
        <k> StructType(listK((Type:KResult => .List{K}),,L:List{K})) ...</k>
        <gepIndices> sNat(N:#Nat) => N ...</gepIndices>
        <gepResult> PtrVal:#Nat => PtrVal +Nat sizeof(Type) </gepResult>

    rule
        <k> StructType(listK(Type:KResult,,L:List{K})) => Type ...</k>
        <gepIndices> 0 => . ...</gepIndices>

end module

module LLVM-HELPERS-SPLIT-BYTES is
    including LLVM-INCLUDE
    
    syntax K ::= splitIntegerBytes "(" K "," K "," K ")" // value, numBytes, type
    syntax K ::= splitIntegerBytes' "(" K "," K "," List{K} ")" // value, numbytes, accumulator
    syntax K ::= splitFloatBytes "(" K "," K "," K "," List{K} ")" // value, type, numBytes, accumulator
    syntax K ::= splitPointerBytes "(" K "," K ")" // value, numBytes
    syntax K ::= splitPointerBytes' "(" K "," K "," K "," List{K} ")" // value, numbytes, whichByte, accumulator
    syntax K ::= splitArrayBytes "(" K "," K "," K ")" [strict(3)] // value, numBytes, innertype
    syntax K ::= splitStructBytes "(" K "," List{K} ")" // value, field types
    syntax K ::= splitStructBytes' "(" K "," List{K} "," List{K} ")" // value, field types, accumulator


    // Type(IntegerType(32))
    // should generate list with LSBytes first
    rule
        <k> splitBytes(V:KResult, Type:KResult)
            => splitIntegerBytes(V, sizeof(Type), Type)
        ...</k>
        when isIntegerType(Type)

    rule
        <k> splitBytes(V:KResult, Type:KResult)
            => splitFloatBytes(V, Type, sizeof(Type), .List{K})
        ...</k>
        when isFloatType(Type)

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
    // TODO can possibly rewrite Zeroinitializer to 0 here, and only have one case
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
        <k> splitIntegerBytes(wvalist(VAList:List, Loc:#Nat), 1, _)
            => listK(wvalist(VAList:List, Loc:#Nat))
        ...</k>

    rule
        <k> splitFloatBytes(V:KResult, Type:KResult, 0, L:List{K})
            => listK(L)
        ...</k>

    rule
        <k> splitFloatBytes(
                V:KResult,
                Type:KResult,
                sNat(NumBytes:#Nat) => NumBytes,
                L:List{K} => floatByte(V, Type, NumBytes) ,, L
            )
        ...</k>

    rule
        <k> splitPointerBytes((Zeroinitializer => Null), _) ...</k>
    rule
        <k> splitPointerBytes(Loc:#Nat, NumBytes:#Nat)
            => splitPointerBytes'(Loc:#Nat, NumBytes, 0, .List{K})
        ...</k>
    rule
        <k> splitPointerBytes'(Loc:#Nat, sNat(NumBytes:#Nat), N:#Nat, L:List{K})
            => splitPointerBytes'(Loc:#Nat, NumBytes, sNat(N:#Nat), (L ,, ptrByte(Loc:#Nat, N)))
        ...</k>
    rule
        <k> splitPointerBytes'(Loc:#Nat, 0, _, L:List{K})
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
    // TODO BUG L'' causes latex to fail (generates L ' ')
    rule
        <k> splitStructBytes(V:KResult, L:List{K})
            => splitStructBytes'(V:KResult, L:List{K}, .List{K})
        ...</k>
    rule
        <k> splitStructBytes'(ConstantStruct(K:K, listK((V:KResult,, Fields:List{K}))), (Type:KResult,, L:List{K}), L':List{K})
            => splitBytes(V, Type)
            ~> splitStructBytes'(ConstantStruct(K:K, listK(Fields)), L:List{K}, L':List{K})
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

end module

module LLVM-HELPERS-JOIN-BYTES is
    including LLVM-INCLUDE

    syntax K ::= joinIntBytes "(" K "," K "," K "," K ")"
    syntax K ::= joinFloatBytes "(" K "," K "," K ")"
    syntax K ::= joinPointerBytes "(" K "," K "," K ")"

    rule
        <k> joinBytes(V:KResult, Type:KResult)
            => joinIntBytes(V:KResult, sizeof(Type), 0, Type)
        ...</k>
        when isIntegerType(Type)

    rule
        <k> joinBytes(V:KResult, Type:KResult)
            => joinFloatBytes(V:KResult, sizeof(Type), 0)
        ...</k>
        when isFloatType(Type)

    rule
        <k> joinBytes(V:KResult, Type:KResult)
            => joinPointerBytes(V:KResult, sizeof(Type), 0)
        ...</k>
        when isPointerType(Type)

    rule
        <k> joinIntBytes(listK((L:List{K},, N:#Nat)), sNat(Len:#Nat), N':#Nat, Type:KResult)
            => joinIntBytes(listK(L:List{K}), Len:#Nat, RESULT, Type:KResult)
        ...</k>
        where RESULT = (N':#Nat <<Nat numBitsPerByte) |Nat N:#Nat

    rule joinIntBytes(listK(.List{K}), 0, N:#Nat, Type:KResult)
        => signed(Type, N:#Nat)
        when N:#Nat >=Int 0
        [anywhere]

    rule joinIntBytes(listK(.List{K}), 0, wvalist(VAList:List, Loc:#Nat), Type:KResult)
        => wvalist(VAList:List, Loc:#Nat)
        [anywhere]

    // TODO BAD
    rule
        <k> joinFloatBytes(listK(floatByte(F:#Float, _, _),, _), _, _)
            => F
        ...</k>

    rule
        <k> joinPointerBytes(listK((L:List{K},, ptrByte(Loc:#Nat, N:#Nat))), sNat(Len:#Nat), N':#Nat)
            => joinPointerBytes(listK(L:List{K}), Len:#Nat, RESULT)
        ...</k>
        when isLocation(Loc)
        where RESULT = (N':#Nat <<Nat numBitsPerByte) |Nat ptrByte(Loc:#Nat, N:#Nat)

    rule joinPointerBytes(listK(.List{K}), 0, Loc:#Nat)
        => Loc:#Nat
        when isLocation(Loc)
        [anywhere]

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
        
end module

module LLVM-MEMORY is
    including LLVM-INCLUDE

    syntax #Nat ::= nextSym #Nat
    macro nextSym(sym(N:#Nat)) = sym(N +Nat 1)

    rule
        <k> Alloca(Type:KResult, N:#Nat) => Loc +Nat 0 ...</k>
        (. =>
            <object>...
                <basePtr> Loc </basePtr>
                <type> Type </type>
                <size> sizeof(Type) *Nat N </size>
            ...</object>
        )
        <localMemory>... . => ListItem(Loc) </localMemory>
        <nextLoc> Loc:#Nat => nextSym Loc </nextLoc>

    rule
        <k> Store(Type:KResult, V:KResult, Loc:#Nat)
            => write(Type:KResult, V:KResult, Loc:#Nat)
        ...</k>

    syntax K ::= writeBytes "(" K "," K ")" [strict(1)] // list of bytes, location

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

    rule
        <k> Load(PointerType(TyK:K), Loc:#Nat)
            => read(TyK:K, Loc:#Nat)
        ...</k>
        when isLocation(Loc) // for stopping computation early

    rule
        <k> read(Type:KResult, Loc:#Nat)
            => joinBytes(readBytes(sizeof(Type:KResult), Loc:#Nat), Type:KResult)
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

    syntax K ::= readBytes "(" K "," K ")"
    syntax K ::= readBytes' "(" K "," K "," List{K} ")"


end module

module LLVM-COMPARISONS is
    including LLVM-INCLUDE

    // all of these take place only at the top of K
    rule INotEq(Type:KResult, I1:#Int, I2:#Int)
        => boolToInt(unsigned(Type, I1) =/=Bool unsigned(Type, I2))
    rule IEq(Type:KResult, I1:#Int, I2:#Int)
        => boolToInt(unsigned(Type, I1) ==Bool unsigned(Type, I2))
    rule UGT(Type:KResult, I1:#Int, I2:#Int) => boolToInt(unsigned(Type, I1:#Int) >Int unsigned(Type, I2:#Int))
    rule UGE(Type:KResult, I1:#Int, I2:#Int) => boolToInt(unsigned(Type, I1:#Int) >=Int unsigned(Type, I2:#Int))
    rule ULT(Type:KResult, I1:#Int, I2:#Int) => boolToInt(unsigned(Type, I1:#Int) <Int unsigned(Type, I2:#Int))
    rule ULE(Type:KResult, I1:#Int, I2:#Int) => boolToInt(unsigned(Type, I1:#Int) <=Int unsigned(Type, I2:#Int))
    rule SGT(Type:KResult, I1:#Int, I2:#Int) => boolToInt(signed(Type, I1:#Int) >Int signed(Type, I2:#Int))
    rule SGE(Type:KResult, I1:#Int, I2:#Int) => boolToInt(signed(Type, I1:#Int) >=Int signed(Type, I2:#Int))
    rule SLT(Type:KResult, I1:#Int, I2:#Int) => boolToInt(signed(Type, I1:#Int) <Int signed(Type, I2:#Int))
    rule SLE(Type:KResult, I1:#Int, I2:#Int) => boolToInt(signed(Type, I1:#Int) >=Int signed(Type, I2:#Int))
	
	// TODO not handling QNAN
	rule OEQ(Type:KResult, F1:#Float, F2:#Float) 
		=> boolToInt(F1:#Float ==Bool F2:#Float)
	rule OGT(Type:KResult, F1:#Float, F2:#Float) 
		=> boolToInt(F1:#Float >Float F2:#Float)	
	rule OGE(Type:KResult, F1:#Float, F2:#Float)
		=> boolToInt(F1:#Float >=Float F2:#Float)
	rule OLT(Type:KResult, F1:#Float, F2:#Float)
		=> boolToInt(F1:#Float <Float F2:#Float)
	rule OLE(Type:KResult, F1:#Float, F2:#Float)
		=> boolToInt(F1:#Float <=Float F2:#Float)
	rule ONE(Type:KResult, F1:#Float, F2:#Float) 
		=> boolToInt(F1:#Float =/=Bool F2:#Float)
	// rule ORD(Type:KResult, F1:#Float, F2:#Float) 
		// => // if both are not QNAN
	rule UEQ(Type:KResult, F1:#Float, F2:#Float) 
		=> boolToInt(F1:#Float ==Bool F2:#Float)
	rule UGT(Type:KResult, F1:#Float, F2:#Float) 
		=> boolToInt(F1:#Float >Float F2:#Float)	
	rule UGE(Type:KResult, F1:#Float, F2:#Float)
		=> boolToInt(F1:#Float >=Float F2:#Float)
	rule ULT(Type:KResult, F1:#Float, F2:#Float)
		=> boolToInt(F1:#Float <Float F2:#Float)
	rule ULE(Type:KResult, F1:#Float, F2:#Float)
		=> boolToInt(F1:#Float <=Float F2:#Float)
	rule UNE(Type:KResult, F1:#Float, F2:#Float) 
		=> boolToInt(F1:#Float =/=Bool F2:#Float)
	// rule UNO(Type:KResult, F1:#Float, F2:#Float) 
		// => if either is QNAN

    syntax K ::= boolToInt "(" K ")"
    rule boolToInt(true) => 1
    rule boolToInt(false) => 0

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
        <k> SExt(Type:KResult, I:#Int) => I ...</k>
        when signed(Type, I) ==Bool I // sanity check since this isn't supposed to change values and I is supposed to have been canonicalized

    // TODO need to normalize here
    rule
        <k> BitCast(_, I:#Int) => I:#Int ...</k>

    // TODO need to normalize here
    rule
        <k> IntToPtr(Type:KResult, I:#Int) => intToPtr(Type, I) ...</k>
    rule
        <k> PtrToInt(Type:KResult, N:#Nat) => ptrToInt(Type, N) ...</k>

    // TODO needs side conditions
    rule ptrToInt(Type:KResult, intToPtr(Type':KResult, I:#Int)) => I:#Int [anywhere]
    rule intToPtr(Type:KResult, ptrToInt(Type':KResult, N:#Nat)) => N:#Nat [anywhere]

    rule unsigned(Type:KResult, sym(I:#Int) +Nat Offset:#Nat)
        => ptrToInt(Type, sym(I:#Int) +Nat Offset:#Nat)
        [anywhere]
    rule signed(Type:KResult, sym(I:#Int) +Nat Offset:#Nat)
        => ptrToInt(Type, sym(I:#Int) +Nat Offset:#Nat)
        [anywhere]
    rule unsigned(_, ptrToInt(Type:KResult, I:#Int))
        => ptrToInt(Type, I)
    rule signed(_, ptrToInt(Type:KResult, I:#Int))
        => ptrToInt(Type, I)

    // definitely misses problems with null
    // TODO assumes types are same and are big enough
    rule ptrToInt(_, sym(I:#Int) +Nat Offset:#Nat) >Int ptrToInt(_, sym(I:#Int) +Nat Offset':#Nat)
        => Offset >Int Offset'
        [anywhere]
    rule ptrToInt(_, sym(I:#Int) +Nat Offset:#Nat) >=Int ptrToInt(_, sym(I:#Int) +Nat Offset':#Nat)
        => Offset >=Int Offset'
        [anywhere]
    rule ptrToInt(_, sym(I:#Int) +Nat Offset:#Nat) <Int ptrToInt(_, sym(I:#Int) +Nat Offset':#Nat)
        => Offset <Int Offset'
        [anywhere]
    rule ptrToInt(_, sym(I:#Int) +Nat Offset:#Nat) <=Int ptrToInt(_, sym(I:#Int) +Nat Offset':#Nat)
        => Offset <=Int Offset'
        [anywhere]
    rule ptrToInt(Type:KResult, sym(I:#Int) +Nat Offset:#Nat) -Int ptrToInt(Type:KResult, sym(I:#Int) +Nat Offset':#Nat)
        => signed(Type, Offset -Int Offset')
        [anywhere]

    rule
        <k> FPToSI(Type:KResult, F:#Float)
            => signed(Type, Float2Int(F))
        ...</k>

    rule
        <k> FPToUI(Type:KResult, F:#Float)
            => unsigned(Type, Float2Int(F))
        ...</k>

end module


module LLVM-LITERALS is
    including LLVM-INCLUDE

    rule Float(S:#String) => String2Float(S)
        when String2Float(S) >=Float String2Float(S)
        // TODO when 'isFloat(String2Float(S))

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

    rule
        <k> createArrayValue(Type:KResult, L:List{K})
            => createArrayValue'(Type:KResult, L:List{K}, .List{K})
        ...</k>
    rule
        <k> createArrayValue'(Type:KResult, (K:K,, L:List{K}), L':List{K})
            => createArrayValue''(Type:KResult, L:List{K}, splitBytes(K, Type), L':List{K})
        ...</k>
    rule
        <k> createArrayValue''(Type:KResult, L:List{K}, listK(Bytes:List{K}), L':List{K})
            => createArrayValue'(Type:KResult, L:List{K}, (L':List{K},, Bytes:List{K}))
        ...</k>
    rule
        <k> createArrayValue'(_, .List{K}, L:List{K})
            => arrayValue(L)
        ...</k>

end module

module LLVM-STANDARD-LIBRARY-PREPROCESS is
    including LLVM-INCLUDE

    /////////////////////////////////////////////////////////
    // turning calls to intrinsics into semantic productions
    // perhaps this kind of stuff could be generalized, or done away with
    // its purpose is to make the actual function definitions nice

    rule
        // TODO why doesn't this work?
        // <k> Call(_, Callee(funptr(Name(S:#String)), listK(L:List{K})))
            // => 'memcpy`(_`,_`,_`,_`,_`)(L)
        <k> Call(_, Callee(funptr(Name(S:#String)), listK(V1:KResult,, V2:KResult,, V3:KResult,, V4:KResult,, V5:KResult)))
            => memcpy(V1, V2, V3, V4, V5)
        ...</k>
        when substrString(S, 0, 13) ==Bool "@llvm.memcpy."

    rule
        <k> Call(_, Callee(funptr(Name(S:#String)), listK(V1:KResult,, V2:KResult,, V3:KResult,, V4:KResult,, V5:KResult)))
            => memset(V1, V2, V3, V4, V5)
        ...</k>
        when substrString(S, 0, 13) ==Bool "@llvm.memset."
    
    rule
        <k> Call(_, Callee(funptr(Name("@llvm.lifetime.start")), listK(V1:KResult,, V2:KResult)))
            => lifetimeStart(V1, V2)
        ...</k>
    
    rule
        <k> Call(_, Callee(funptr(Name("@llvm.lifetime.end")), listK(V1:KResult,, V2:KResult)))
            => lifetimeEnd(V1, V2)
        ...</k>
    
    rule
        <k> Call(_, Callee(funptr(Name("@llvm.va_start")), listK(V1:KResult)))
            => vaStart(V1)
        ...</k>
    
    rule
        <k> Call(_, Callee(funptr(Name("@llvm.va_copy")), listK(V1:KResult,, V2:KResult)))
            => vaCopy(V1, V2)
        ...</k>

    rule
        <k> Call(_, Callee(funptr(Name("@llvm.va_end")), _))
            => .
        ...</k>
end module

module LLVM-STANDARD-LIBRARY is
    including LLVM-INCLUDE

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

    //@ Variadic intrinsics
    rule
        <k> vaStart(Loc:#Nat) => write(i(numBitsPerByte), wvalist(VAList, Loc), Loc) ...</k>
        <valist> VAList:List </valist>

    rule
        <k> vaCopy(Loc1:#Nat, Loc2:#Nat)
            => write(i(numBitsPerByte), read(i(numBitsPerByte), Loc2), Loc1)
        ...</k>

end module

module LLVM-SYSCALLS-PREPROCESS is
    including LLVM-INCLUDE
    
    rule
        <k> Call(_, Callee(funptr(Name("@__syscall")), listK(N:#Nat,,L:List{K})))
            => (syscallHandler(N))(L)
        ...</k>
end module

module LLVM-SYSCALLS is
    including LLVM-INCLUDE

    rule <k> 'sys-ioctl(_) => 0 ...</k>
    rule <k> 'sys-rt-sigprocmask(_) => 0 ...</k>
    rule <k> 'sys-gettid(_) => 0 ...</k>

    rule
        <k> 'sys-brk(ptrToInt(_,Loc:#Nat),,_) => Brk ...</k>
        <brk> Brk:#Nat </brk>
        when Loc ==Bool Null


    // TODO krun should provide this value
    rule <k> 'sys-getpid(_) => 10000 ...</k>

    syntax K ::= printString "(" K ")" [strict]
    syntax K ::= readString "(" K "," K ")"
    syntax K ::= readString' "(" K "," K "," K ")"

    rule
        <k> 'sys-write(FileDesc:#Int,, ptrToInt(_, Loc:#Nat),, Len:#Nat,, _)
            => printString(readString(Loc, Len))
        ...</k>

    rule
        <k> readString(Loc:#Nat, Len:#Nat)
            => readString'(Loc, Len, "")
        ...</k>

    rule
        <k> (. => read(i(8), Loc))
            ~> readString'(Loc:#Nat, sNat(_), _)
        ...</k>

    rule <k> readString'(_, 0, S:#String) => S ...</k>

    rule
        <k> (I:#Int => .)
            ~> readString'(
                (Loc:#Nat => Loc +Nat 1),
                (sNat(N:#Nat) => N),
                (S:#String => NEWSTRING)
            )
        ...</k>
        where NEWSTRING = S +String charString(unsigned(i(8), I))

    rule <k> printString(S:#String) => lengthString(S) ...</k>
         <output>... . => ListItem(S) </output>

end module

module LLVM-INTERNAL-TESTING-FUNCTIONS is
	// do not include this module when printing
	// TODO add to makefile's grep to look for line like above when excluding modules
    including LLVM-INCLUDE

    rule
        <k> Call(_, Callee(funptr(Name(S:#String)), listK(I:#Int)))
            => .
        ...</k>
		<output>... . => ListItem(Int2String(I) +String "\n") </output>
        when substrString(S, 0, 14) ==Bool "@__fsl.print.i"
		andBool (I >=Int 0 orBool I <=Int 0) // real integer
end module

module LLVM-SEMANTICS is
    including LLVM-INCLUDE

    including LLVM-HELPERS-SPLIT-BYTES
    including LLVM-HELPERS-JOIN-BYTES

    including LLVM-CLEAN-TREE
    including LLVM-GLOBALS
    including LLVM-BRANCHING
    including LLVM-PHI
    including LLVM-SELECTION
    including LLVM-REGISTERS
    including LLVM-START-AND-STOP
    including LLVM-CALL-RET
    including LLVM-VARIADICS
    including LLVM-DECLARATIONS
    including LLVM-ARITHMETIC
    including LLVM-FLOATING-POINT-ARITHMETIC
    including LLVM-GEP
    including LLVM-MEMORY
    including LLVM-COMPARISONS
    including LLVM-CONVERSIONS
    including LLVM-LITERALS
    including LLVM-STANDARD-LIBRARY-PREPROCESS
    including LLVM-STANDARD-LIBRARY
    including LLVM-SYSCALLS-PREPROCESS
    including LLVM-SYSCALLS
	
	including LLVM-INTERNAL-TESTING-FUNCTIONS
end module

///////////////////////
// bugs in K

// TODO accidentally using where instead of when leads to no error message; it just drops the condition
