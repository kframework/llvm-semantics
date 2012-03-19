module LLVM-CONFIGURATION is
    including LLVM-SYNTAX

    syntax KResult ::= #Int


    syntax K ::= callMain // TODO [semantic]
    syntax #Nat ::= sym "(" #Int ")"    // TODO [semantic]
    syntax #Nat ::= ptrByte "(" K "," K ")" // address, byteNumber; part of a pointer, as a byte

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
                    <globalVariables> .Map </globalVariables>
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

module LLVM-HELPERS is
    including LLVM-SYNTAX

    syntax #Nat ::= numBitsPerByte
    macro numBitsPerByte = 8
    
    syntax #Nat ::= numBytesPerPointer
    macro numBytesPerPointer = 4

    syntax #Nat ::= sizeofInBits K  // TODO [function]
    // TODO [function]

    // these give the two's complement signed max and min of a type
    declare smax_ : K -> #Nat
    declare smin_ : K -> #Int
    define smax Type:KResult => (2 ^Int absInt(sizeofInBits(Type) -Int 1)) -Int 1
    define smin Type:KResult => -Int (2 ^Int absInt(sizeofInBits(Type) -Int 1))

    // should be a K, but builtins can't use K :(
    syntax #Int ::= signed "(" K "," K ")" // type, value
    // syntax #Nat ::= canonicalize "(" K "," K ")" // type, value
    
    // TODO only handling case where I is already in range
    rule
        signed(Type:KResult, I:#Int) => I
        when smin(Type) <=Int I andBool smax(Type) >=Int I
        [anywhere]
    // rule
        // signed(Type:KResult, I:#Int) => 
        // where SIGNEDBASE = 2 ^Int (sizeofInBits(Type) -Int 1)
        // [anywhere]

    syntax #Bool ::= isIntegerType "(" K ")" // predicate
    rule isIntegerType(Type(IntegerType(Width(_)))) => true  [anywhere]
    syntax #Bool ::= isPointerType "(" K ")" // predicate
    rule isPointerType(Type(PointerType(_))) => true  [anywhere]
    
    // fixme size should depend on architecture
    rule sizeofInBits(Type(PointerType(_))) => numBytesPerPointer *Nat numBitsPerByte
        [anywhere]
    rule sizeofInBits(Type(ArrayType(Type:KResult, Len:#Nat))) => sizeofInBits(Type(Type)) *Nat Len
        [anywhere]
    
    rule sizeofInBits(Type(IntegerType(Width(N:#Nat)))) => N
        [anywhere]
    // TODO listK should be Fields (bug in K)
    rule sizeofInBits(Type(StructType(listK((Type:KResult,,L:List{K})))))
      => sizeofInBits(Type) +Nat sizeofInBits(Type(StructType(listK(L))))
        [anywhere]
    rule sizeofInBits(Type(StructType(listK(.List{K})))) => 0
        [anywhere]

    syntax #Nat ::= sizeof K  // TODO [function]
    rule sizeof(K:K) => sizeofInBits(K:K) /Nat numBitsPerByte
        when numBitsPerByte dividesNat sizeofInBits(K:K)
        [anywhere]

    syntax K ::= int32
    macro int32 = Type(IntegerType(Width(32))) // TODO [function]

    syntax K ::= interpretInt "(" K "," K ")" // cannot be function
end module

/* this module gets included by all later modules */
module LLVM-INCLUDE is
    including LLVM-CONFIGURATION
    including LLVM-HELPERS

    syntax K ::= debug // TODO [semantic]

end module

/* this module contains rules for cleaning up the AST */
module LLVM-CLEAN-TREE is
    including LLVM-INCLUDE

    // rule <k> BasicBlock(_, K:K) => K ...</k>
    rule <k> Operand(_, K:K) => K ...</k>

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
        <k> PHI(_, (Edge(K:K, Name:Id),, _:List{K})) => K:K ...</k>
        <prevBlock> Name </prevBlock>
    rule
        <k> PHI(_, ((Edge(K:K, Name:Id) => .List{K}),, _:List{K})) ...</k>
        <prevBlock> Name':Id </prevBlock>
        when Name =/=Bool Name'
end module

module LLVM-GLOBALS is
    including LLVM-INCLUDE
    
    // TODO might need a new globalRegisters, and GId vs LId
    
    // TODO no need to do anything since not yet checking whether variables exist before using them
    // rule
        // <k> GlobalVariable(X:Id, _, _, .List{K}) => . ...</k>
    // rule
        // <k> GlobalVariable(X:Id, _, _, K:K) => Assign(X:Id, K:K) ...</k> 
end module

module LLVM-REGISTERS is
    including LLVM-INCLUDE

    rule [assign-register]:
        <k> Assign(X:Id, V:KResult) => . ...</k>
        <registers> M:Map => M[V / X] </registers>

    rule [lookup-register]:
        <k> X:Id => V ...</k>
        <registers>... X |-> V:KResult ...</registers>

end module

module LLVM-BRANCHING is
    including LLVM-INCLUDE

    rule
        <k> Unconditional(Label:Id) => Body:K ...</k>
        <currFunction> FunName:Id </currFunction>
        <functionName> FunName:Id </functionName>
        <basicBlocks>... Label:Id |-> Body:K ...</basicBlocks>

    rule
        <k> Conditional(1, Label:K, _)
            => Unconditional(Label:K)
        ...</k>
    rule
        <k> Conditional(0, _, Label:K)
            => Unconditional(Label:K)
        ...</k>

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
            <returnValue> ((I %Int 256) +Int 256) %Int 256 </returnValue>
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
        <k> Typedef(X:Id, UnresolvedType:K) => . ...</k>
        <currModule> Name:Id </currModule>
        <moduleName> Name </moduleName>
        <typedefs>... . => X |-> UnresolvedType ...</typedefs>

    rule
        <k> NamedType(X:Id) => UnresolvedType ...</k>
        <typedefs>... X |-> UnresolvedType:K ...</typedefs>

    // TODO: hack because hybrids don't seem to be working
    rule
        <k> Fields(L:List{K}) => listK(L) ...</k>
        when isKResult(L)

    rule
        <k> FUNCTION => Body:K ...</k>
        <currFunction> _ => Name </currFunction>
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
        when isKResult(L)
    
    rule
        <k> Call(_, Callee(FunName:Id, listK(Args:List{K}))) ~> Tail:K
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
        <k> bind((Arg:K,, Args:List{K}), (Arg(_, Formal:K),, Formals:List{K}))
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
            => interpretInt(I1 +Int I2, Type)
        ...</k>
    rule
        <k> Sub(Type:KResult, I1:#Int, I2:#Int)
            => interpretInt(I1 -Int I2, Type)
        ...</k>
    rule
        <k> Mul(Type:KResult, I1:#Int, I2:#Int)
            => interpretInt(I1 *Int I2, Type)
        ...</k>
    rule
        <k> SDiv(Type:KResult, I1:#Int, I2:#Int)
            => interpretInt(I1 /Int I2, Type)
        ...</k>

        
    rule
        <k> Shl(Type:KResult, I:#Int, Len:#Nat)
            => interpretInt(I <<Int Len, Type)
        ...</k>
    rule // LShr can only shift in zeroes, so assume nat for now
    // can probably do like ashr below, but used unsigned()
        <k> LShr(Type:KResult, N:#Nat, Len:#Nat)
            => interpretInt(N >>Int Len, Type)
        ...</k>
    rule 
        <k> AShr(Type:KResult, I:#Int, Len:#Nat)
            => interpretInt(signed(Type, I:#Int) >>Int Len, Type)
        ...</k>
    rule
        <k> Or(Type:KResult, I1:#Int, I2:#Int)
            => interpretInt(I1 |Int I2, Type)
        ...</k>
    rule
        <k> And(Type:KResult, I1:#Int, I2:#Int)
            => interpretInt(I1 &Int I2, Type)
        ...</k>
    rule
        <k> Xor(Type:KResult, I1:#Int, I2:#Int)
            => interpretInt(I1 xorInt I2, Type)
        ...</k>


    // weave into add
        // checkNSW(unsign(I1) +Int unsign(I2), Type)
        // ~> checkNUW(sign(I1) +Int sign(I2), Type)
    // before RHS

    // rule interpret(I:#Int, Type:KResult) => ((I %Int MAX) + MAX) %Int
        // where MAX = 2 ^Int sizeofInBits(Type)
    rule <k> interpretInt(I:#Int, Type:KResult) => I %Int MAX ...</k>
        // <modifiers> nsw </modifiers>
        where MAX = 2 ^Int sizeofInBits(Type)

end module

module LLVM-GEP is
    including LLVM-INCLUDE

    syntax K ::= gep

    rule
        <k> GetElementPtr(Type:KResult, PtrVal:#Nat, Indices:List{K}) => gep ...</k>
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
                <gepResult> Loc:#Nat </gepResult>
            ...</gepInfo>
            => .
        )

    rule <gepType> Type(Type:KResult) => Type </gepType>

    rule
        <gepType> PointerType(Type:KResult) => Type </gepType>
        <gepIndices> N:#Nat => . ...</gepIndices> 
        <gepResult> PtrVal:#Nat => PtrVal +Nat sizeof(Type(Type)) *Nat N </gepResult>

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
    syntax K ::= writeBytes "(" List{K} "," K ")" // list of bytes, location
    syntax K ::= splitBytes "(" K "," K ")" // value, type
    syntax K ::= splitIntegerBytes "(" K "," K ")" // value, numBytes
    syntax K ::= splitIntegerBytes' "(" K "," K "," List{K} ")" // value, numbytes, accumulator
    syntax K ::= splitPointerBytes "(" K "," K ")" // value, numBytes
    syntax K ::= splitPointerBytes' "(" K "," K "," K "," List{K} ")" // value, numbytes, whichByte, accumulator

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
        splitBytes(V:KResult, Type:KResult)
            => splitIntegerBytes(V, sizeof(Type))
        when isIntegerType(Type)
        [anywhere]
    
    rule
        splitBytes(V:KResult, Type:KResult)
            => splitPointerBytes(V, sizeof(Type))
        when isPointerType(Type)
        [anywhere]

    rule
        splitIntegerBytes(V:KResult, NumBytes:#Nat)
            => splitIntegerBytes'(V, NumBytes, .List{K})
        [anywhere]
    rule
        splitIntegerBytes'(I:#Int, sNat(NumBytes:#Nat), L:List{K})
            => splitIntegerBytes'(
                I >>Int numBitsPerByte,
                NumBytes,
                (L ,, (I &Int MASK))
            )
        where MASK = (2 ^Int numBitsPerByte) -Int 1
        [anywhere]
    // TODO: ideally, the parser should canonicalize integer literals to positive
    rule
        splitIntegerBytes'(I:#Int, 0, L:List{K})
            => listK(L)
        when I ==Bool 0 orBool I ==Bool -1
        [anywhere]
        
    rule
        splitPointerBytes(V:KResult, NumBytes:#Nat)
            => splitPointerBytes'(V, NumBytes, 0, .List{K})
        [anywhere]
    rule
        splitPointerBytes'(V:KResult, sNat(NumBytes:#Nat), N:#Nat, L:List{K})
            => splitPointerBytes'(V:KResult, NumBytes, sNat(N:#Nat), (L ,, ptrByte(V, N)))
        [anywhere]
    rule
        splitPointerBytes'(V:KResult, 0, _, L:List{K})
            => listK(L)
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

    syntax K ::= innerType "(" K ")"
    rule innerType(Type(PointerType(K:K))) => Type(K:K)  [anywhere]

    syntax K ::= read "(" K "," K ")"
    syntax K ::= readBytes "(" K "," K ")"
    syntax K ::= readBytes' "(" K "," K "," List{K} ")"
    syntax K ::= interpretBytes "(" K "," K ")" [strict(1)]
    syntax K ::= interpretIntBytes "(" K "," K "," K ")"

end module

module LLVM-COMPARISONS is
    including LLVM-INCLUDE

    // TODO FIXME these are wrong unless we apply a modulus or keep canonical
    // TODO reduce these to within bounds
    rule INotEq(_, I1:#Int, I2:#Int) => boolToInt(I1:#Int =/=Bool I2:#Int)  [anywhere]
    rule IEq(_, I1:#Int, I2:#Int) => boolToInt(I1:#Int ==Bool I2:#Int)  [anywhere]
    
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
    // TODO only handling positives
    rule
        <k> Trunc(Type:KResult, N:#Nat) => N:#Nat %Int BASE ...</k>
        when isIntegerType(Type)
        where BASE = (2 ^Int (numBitsPerByte *Int sizeof(Type)))

    
    // TODO only handling scalars
    // TODO only handling positives
    rule
        <k> ZExt(_, N:#Nat) => N:#Nat ...</k>
    
    // TODO only handling scalars
    rule
        <k> SExt(Type:KResult, I:#Int) => signed(Type, I) ...</k>
        
    // TODO need to normalize here
    rule
        <k> BitCast(_, I:#Int) => I:#Int ...</k>
        
    syntax #Nat ::= intToPtr "(" K "," K ")"
    // TODO need to normalize here
    rule
        <k> IntToPtr(Type:KResult, I:#Int) => intToPtr(Type, I) ...</k>
end module

module LLVM-STANDARD-LIBRARY is
    including LLVM-INCLUDE
    
    // perhaps this kind of stuff could be generalized, or done away with
    // its purpose is to make the actual function definitions nice
    syntax K ::= exit "(" K ")"
    rule
        <k> Call(_, Callee(Name("@exit"), listK(V:KResult)))
            => exit(V)
        ...</k>

    // actual library definitions
    rule
        <k> exit(I:#Int) ~> _
            => I:#Int
        ...</k>
    
end module


module LLVM-SEMANTICS is
    including LLVM-INCLUDE

    including LLVM-CLEAN-TREE
    including LLVM-MISC
    including LLVM-GLOBALS
    including LLVM-BRANCHING
    including LLVM-REGISTERS
    including LLVM-START-AND-STOP
    including LLVM-CALL-RET
    including LLVM-DECLARATIONS
    including LLVM-ARITHMETIC
    including LLVM-GEP
    including LLVM-MEMORY
    including LLVM-COMPARISONS
    including LLVM-CONVERSIONS
    including LLVM-STANDARD-LIBRARY
end module
