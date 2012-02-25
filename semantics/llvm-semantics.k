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

    syntax K ::= int32
    macro int32 = Type(IntegerType(Width(32))) // TODO [function]

    syntax #Nat ::= sizeof K  // TODO [function]
	syntax #Nat ::= sizeofInBits K  // TODO [function]

    syntax #Nat ::= numBitsPerByte
    macro numBitsPerByte = 8

    // TODO [function]
	rule sizeofInBits(Type(IntegerType(Width(N:#Nat)))) => N
    rule sizeof(K:K) => sizeofInBits(K:K) /Nat numBitsPerByte
        when numBitsPerByte dividesNat sizeofInBits(K:K)

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
	syntax K ::= listK "(" List{K} ")"
	
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
	// should generate list with MSBytes first
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
        <k> Assign(X:Id, V:KResult) => . ...</k>
        <registers> M:Map => M[V / X] </registers>

    rule
        <k> X:Id => V ...</k>
        <registers>... X |-> V:KResult ...</registers>

    rule 
		<T>... 
			<k> I:#Int </k> 
		...</T> 
		=> <result>... 
			<returnValue> ((I %Int 256) +Int 256) %Int 256 </returnValue> 
		</result>

	rule [add]:
		<k> Add(Type:K, I1:#Int, I2:#Int)
			=> interpret(I1 +Int I2, Type)
		...</k>
	rule 
		<k> Sub(Type:K, I1:#Int, I2:#Int)
			=> interpret(I1 -Int I2, Type)
		...</k>
	rule 
		<k> Mul(Type:K, I1:#Int, I2:#Int)
			=> interpret(I1 *Int I2, Type)
		...</k>
	rule 
		<k> SDiv(Type:K, I1:#Int, I2:#Int)
			=> interpret(I1 /Int I2, Type)
		...</k>
		
	rule 
		<k> Or(Type:K, I1:#Int, I2:#Int)
			=> interpret(I1 |Int I2, Type)
		...</k>
	rule 
		<k> And(Type:K, I1:#Int, I2:#Int)
			=> interpret(I1 &Int I2, Type)
		...</k>
	rule 
		<k> Xor(Type:K, I1:#Int, I2:#Int)
			=> interpret(I1 xorInt I2, Type)
		...</k>
				
	
	// weave into add 
		// checkNSW(unsign(I1) +Int unsign(I2), Type)
		// ~> checkNUW(sign(I1) +Int sign(I2), Type)
	// before RHS
	

		
	syntax K ::= interpret "(" K "," K ")" // cannot be function
	
	// rule interpret(I:#Int, Type:K) => ((I %Int MAX) + MAX) %Int
		// where MAX = 2 ^Int sizeofInBits(Type)
	rule <k> interpret(I:#Int, Type:K) => I %Int MAX ...</k>
		// <modifiers> nsw </modifiers>
		where MAX = 2 ^Int sizeofInBits(Type)

		

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
