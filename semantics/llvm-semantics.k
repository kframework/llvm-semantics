module LLVM-CONFIGURATION is
	including LLVM-SYNTAX

	syntax KResult ::= #Int


    syntax K ::= callMain // TODO [semantic]
    syntax #Nat ::= sym "(" #Nat ")"    // TODO [semantic]

    configuration
        <T multiplicity="?">
            <k> $PGM:K ~> callMain </k>
            <callStack> .List </callStack>
            <control>
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
                    <globalVariables> .Map </globalVariables>
                    <functions>
						<function multiplicity="*">
							<functionName> Name("") </functionName>
							<basicBlocks> .Map </basicBlocks>
							<initialBasicBlock> .K </initialBasicBlock>
						</function>
					</functions>
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
        </T>
        <result multiplicity="?">
            <returnValue> -1 </returnValue>
        </result>
end module

module LLVM-HELPERS is
	including LLVM-SYNTAX

	syntax #Nat ::= numBitsPerByte
    macro numBitsPerByte = 8

	syntax #Nat ::= sizeofInBits K  // TODO [function]
    // TODO [function]
	rule sizeofInBits(Type(IntegerType(Width(N:#Nat)))) => N

	syntax #Nat ::= sizeof K  // TODO [function]
    rule sizeof(K:K) => sizeofInBits(K:K) /Nat numBitsPerByte
        when numBitsPerByte dividesNat sizeofInBits(K:K)

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

    rule GlobalVariables(L:List{K}) => List{K}ToK(L)
    rule Functions(L:List{K}) => List{K}ToK(L)
    //rule Body(L:List{K}) => List{K}ToK(L)
    rule Instructions(L:List{K}) => List{K}ToK(L)
	rule ModuleID(S:#String) => Name(S)
    rule Value(K:K) => K
	rule Br(K:K) => K:K

	rule ICmp(Predicate("ne"), K1:K, K2:K) => INotEq(K1:K, K2:K)
end module


module LLVM-BASIC is
	including LLVM-INCLUDE

    rule
        <k> Instruction(Modifiers(L:List{K}), K:K) => K ...</k>
        <currentModifiers> _ => List(L) </currentModifiers>

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
        <k> FUNCTION => Body:K ...</k>
		<currFunction> _ => Name </currFunction>
		(. =>
			<function>...
				<functionName> Name </functionName>
			...</function>
		)
        where FUNCTION = Function(RetType:K, Name:Id, Arguments:K, Body:K)

	rule
		<k> Body((BasicBlock(Name:Id, K:K) ,, L:List{K}))
			=> BasicBlock(Name:Id, K:K)
			~> List{K}ToK(L)
		...</k>
		<currFunction> FunName:Id </currFunction>
		<functionName> FunName:Id </functionName>
		<initialBasicBlock> .K => Name:Id </initialBasicBlock>

	rule
		<k> BasicBlock(Name:Id, K:K) => . ...</k>
		<currFunction> FunName:Id </currFunction>
		<functionName> FunName:Id </functionName>
		<basicBlocks>... . => Name:Id |-> K:K ...</basicBlocks>


end module

module LLVM-CALL-RET is
	including LLVM-INCLUDE

	syntax ListItem ::= frame Bag

    rule
        <k> Call(_, Callee(FunName:Id, Args:K))
			=> //bind(Args:K)
			Body
		...</k>
        (<control>
            C:Bag
            <currModule> Name:Id </currModule>
			<currFunction> FunName':Id </currFunction>
        </control> =>
        <control>...
            <currModule> Name </currModule>
			<currFunction> FunName:Id </currFunction>
        ...</control>)
        <callStack> . => frame(C <currModule> Name </currModule> <currFunction> FunName':Id </currFunction>) ...</callStack>
        <moduleName> Name </moduleName>
		<functionName> FunName </functionName>
		<initialBasicBlock> IBBName:Id </initialBasicBlock>
		<basicBlocks>... IBBName |-> Body:K ...</basicBlocks>
        //<functions>... FunName |-> Function(_, FunName:Id, _, Body:K) ...</functions>

    rule
        <k> Ret(V:KResult) => V ...</k>
        <callStack> frame(C:Bag) => . ...</callStack>
        <control> _ => C </control>

end module

module LLVM-ARITHMETIC is
	including LLVM-INCLUDE

	rule [add]:
		<k> Add(Type:K, I1:#Int, I2:#Int)
			=> interpretInt(I1 +Int I2, Type)
		...</k>
	rule
		<k> Sub(Type:K, I1:#Int, I2:#Int)
			=> interpretInt(I1 -Int I2, Type)
		...</k>
	rule
		<k> Mul(Type:K, I1:#Int, I2:#Int)
			=> interpretInt(I1 *Int I2, Type)
		...</k>
	rule
		<k> SDiv(Type:K, I1:#Int, I2:#Int)
			=> interpretInt(I1 /Int I2, Type)
		...</k>

	rule
		<k> Or(Type:K, I1:#Int, I2:#Int)
			=> interpretInt(I1 |Int I2, Type)
		...</k>
	rule
		<k> And(Type:K, I1:#Int, I2:#Int)
			=> interpretInt(I1 &Int I2, Type)
		...</k>
	rule
		<k> Xor(Type:K, I1:#Int, I2:#Int)
			=> interpretInt(I1 xorInt I2, Type)
		...</k>


	// weave into add
		// checkNSW(unsign(I1) +Int unsign(I2), Type)
		// ~> checkNUW(sign(I1) +Int sign(I2), Type)
	// before RHS

	// rule interpret(I:#Int, Type:K) => ((I %Int MAX) + MAX) %Int
		// where MAX = 2 ^Int sizeofInBits(Type)
	rule <k> interpretInt(I:#Int, Type:K) => I %Int MAX ...</k>
		// <modifiers> nsw </modifiers>
		where MAX = 2 ^Int sizeofInBits(Type)

end module


module LLVM-MEMORY is
	including LLVM-INCLUDE

    syntax #Nat ::= nextSym #Nat
    macro nextSym(sym(N:#Nat)) = sym(N +Nat 1)

    rule
        <k> Alloca(Type:K, N:#Nat) => Loc +Nat 0 ...</k>
        <nextLoc> Loc:#Nat => nextSym Loc </nextLoc>
        (. =>
            <object>...
				<type> Type </type>
                <basePtr> Loc </basePtr>
                <size> sizeof(Type) *Nat N </size>
            ...</object>
        )

	rule
		<k> Store(Type:K, V:KResult, Loc:#Nat)
			=> write(Type:K, V:KResult, Loc:#Nat)
		...</k>

	syntax K ::= write "(" K "," K "," K ")" // type, value, location
	syntax K ::= writeBytes "(" List{K} "," K ")" // list of bytes, location
	syntax K ::= splitBytes "(" K "," K ")" // value, type
	syntax K ::= splitIntegerBytes "(" K "," K ")" // value, numBytes
	syntax K ::= splitIntegerBytes' "(" K "," K "," List{K} ")" // value, numbytes, accumulator
	syntax KResult ::= listK "(" List{K} ")"

	syntax #Bool ::= isIntegerType "(" K ")" // predicate
	rule isIntegerType(Type(IntegerType(Width(_)))) => true

	rule
		<k> write(Type:K, V:KResult, Loc:#Nat)
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
		splitBytes(V:KResult, Type:K)
			=> splitIntegerBytes(V, sizeof(Type))
		when isIntegerType(Type)

	rule
		splitIntegerBytes(V:KResult, NumBytes:#Nat)
			=> splitIntegerBytes'(V, NumBytes, .List{K})

	rule
		splitIntegerBytes'(I:#Int, sNat(NumBytes:#Nat), L:List{K})
			=> splitIntegerBytes'(
				I >>Int numBitsPerByte,
				NumBytes,
				(L ,, (I &Int MASK))
			)
		where MASK = (2 ^Int numBitsPerByte) -Int 1

	rule
		splitIntegerBytes'(0, 0, L:List{K})
			=> listK(L)


	rule
		<k> Load(Type:K, Loc:#Nat)
			=> read(Type:K, Loc:#Nat)
		...</k>

	rule
		<k> read(Type:K, Loc:#Nat)
			=> interpretBytes(readBytes(sizeof(innerType(Type:K)), Loc:#Nat), Type:K)
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
		<k> interpretBytes(K:KResult, Type:K)
			=> interpretIntBytes(K:KResult, sizeof(innerType(Type)), 0)
		...</k>

	rule
		<k> interpretIntBytes(listK((L:List{K},, N:#Nat)), sNat(Len:#Nat), N':#Nat)
			=> interpretIntBytes(listK(L:List{K}), Len:#Nat, RESULT)
		...</k>
		where RESULT = (N':#Nat <<Nat numBitsPerByte) |Nat N:#Nat

	rule interpretIntBytes(listK(.List{K}), 0, N:#Nat)
		=> N:#Nat

	syntax K ::= innerType "(" K ")"
	rule innerType(Type(PointerType(K:K))) => Type(K:K)

	syntax K ::= read "(" K "," K ")"
	syntax K ::= readBytes "(" K "," K ")"
	syntax K ::= readBytes' "(" K "," K "," List{K} ")"
	syntax K ::= interpretBytes "(" K "," K ")" [strict(1)]
	syntax K ::= interpretIntBytes "(" K "," K "," K ")"

end module

module LLVM-COMPARISONS is
	including LLVM-INCLUDE

	// TODO reduce these to within bounds
	rule INotEq(I1:#Int, I2:#Int) => boolToInt(I1:#Int =/=Bool I2:#Int)

	syntax #Int ::= boolToInt "(" K ")"
	rule boolToInt(true) => 1
	rule boolToInt(false) => 0

end module

module LLVM-SEMANTICS is
	including LLVM-INCLUDE

	including LLVM-CLEAN-TREE
	including LLVM-BASIC
	including LLVM-BRANCHING
	including LLVM-REGISTERS
	including LLVM-START-AND-STOP
	including LLVM-CALL-RET
	including LLVM-DECLARATIONS
	including LLVM-ARITHMETIC
	including LLVM-MEMORY
	including LLVM-COMPARISONS
end module