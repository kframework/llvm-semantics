// Copyright (c) 2013-2014 K Team. All Rights Reserved.
requires "llvm-syntax.k"

module LLVM-ABSTRACTSYNTAX
    imports LLVM-SYNTAX

    syntax KResult ::= Int | #String | Floating
                      | arrayValue(KList)
                      | Loc
                      | integerType(K)
                      | pointerType(K, K) //type, address space
                      | arrayTypeValue(K, K)
                      | structTypeValue(K)
                      | listK(KList)  [latex({#1})]

    syntax Element ::= val(K) [strict]
    rule 'isKResult(val(K:K)) => true
        when 'isKResult(K:K)
    syntax ElemList ::= List{Element,","} [strict,klabel('elemCon)]
    syntax Int ::= lengthOfList(ElemList) [function]

    rule lengthOfList(.ElemList) => 0
    rule lengthOfList(val(K:K),L:ElemList) => 1 +Int lengthOfList(L)

    syntax KItem ::= elemListToK(ElemList) [function]

    rule elemListToK(.ElemList) => .K
    rule elemListToK(val(K:K), L:ElemList) => K ~> elemListToK(L)

    syntax NonVoidType ::= arrayType(K, K) [strict] // inner type, length
                         | structType(K) [strict]
                         | namedType(K)

    rule [ I:UnsignedInt x T:Type ] => arrayType(
                                    String2Int(#tokenToString(I)),T) [macro]
    rule T:Type A:OptAddrSpace * => pointerType(T, A) [macro]
    rule { Ts:TypeList } => structType(Ts) [macro]
    rule < { Ts:TypeList } > => structType(Ts) [macro]

    //change IntType from LLVM syntax to K rule syntax
    rule I:IntType => integerType(String2Int(substrString(#tokenToString(I),
                        1, lengthString(#tokenToString(I))))) [macro]

    syntax Loc ::= loc(Int, Int)    // TODO [semantic]
    syntax Loc ::= funptr(K)

/*
    syntax List ::= list(KList) [function]

    rule list(.KList) => .List
    rule list(A:K,, KL:KList) => ListItem(A) list(KL)
*/
    syntax Int ::= ptrByte(K, K) // address, byteNumber; part of a pointer, as a byte
    syntax Int ::= floatByte(K, K, K) // float, type, byte number
    //rule isNat(ptrByte(_, _)) => true
    //rule isNat(floatByte(_, _, _)) => true

    syntax KItem ::= "debug" // TODO [semantic]
    syntax KItem ::= "callMain" // TODO [semantic]
    syntax KItem ::= "initGlobals" // TODO [semantic]

    syntax KItem ::= initializer(K, K) // type, value
    syntax KItem ::= globalVariable(K, K, K, K) [strict(3)]// Value/Name, Modifiers, Type, Initializer
    syntax KItem ::= modifiers(ElemList)
    syntax KItem ::= alloca(K, K) [strict] // Type, NumElements
    syntax KItem ::= load(K, K) [strict]
    syntax KItem ::= store(K, K, K) [strict]  // Type, Value, Destination
    syntax KItem ::= assign(K, K) [strict(2)] // Name, Instruction
    syntax KItem ::= unconditional(K)
    syntax KItem ::= conditional(K, K, K) [strict(1)]
    syntax KItem ::= switch(K, K, K, K) [strict(1,2,4)] // type, condition, default dest, list of cases
    syntax KItem ::= case(K, K) [strict(1)] // value, successor
    rule 'isKResult(case(K:K, _)) => true
        when 'isKResult(K:K)

    syntax KItem ::= arguments(ElemList) [strict]
    syntax KItem ::= values(K)
    syntax KItem ::= phi(K, K) // type, edge list
    syntax KItem ::= edge(K, K) // used by PHI
    syntax KItem ::= select(K, K, K, K) [strict(1,2)] // condition, true val, false val
    syntax KItem ::= call(K, K) [strict(2)] // Type, Callee
    syntax KItem ::= callee(K, K) [strict] // Value/Name, Arguments
    rule 'isKResult(callee(K:K, K':K)) => true
        when 'isKResult(K:K) andBool 'isKResult(K')

    syntax KItem ::= aliases(ElemList)
    syntax KItem ::= alias(K, K)
    syntax KItem ::= theModule(K, K, K, K, K, K, K)
    syntax KItem ::= basicBlock(K, K) // Name, Instructions
    syntax KItem ::= functionDef(K, K, K, K)  [strict(1)] // RetType, Value/Name, Arguments, Body
    syntax KItem ::= functionDecl(K, K, K)  [strict(1)] // RetType, Value/Name, Arguments
    syntax KItem ::= typedef(K, K) // name, type TODO: modifiers
    syntax KItem ::= fields(ElemList) [strict]
    syntax KItem ::= types(ElemList)  [strict]
    syntax KItem ::= setBlock(K)
    syntax KItem ::= body(ElemList)

    syntax SymbolicValueRef ::= name(#String)

    syntax KItem ::= theDefinition(K,K) [strict]
    syntax KItem ::= INotEq(K, K, K) [strict] // type, left op, right op
    syntax KItem ::= IEq(K, K, K) [strict]
    syntax KItem ::= UGT(K, K, K) [strict]
    syntax KItem ::= UGE(K, K, K) [strict]
    syntax KItem ::= ULT(K, K, K) [strict]
    syntax KItem ::= ULE(K, K, K) [strict]
    syntax KItem ::= SGT(K, K, K) [strict]
    syntax KItem ::= SGE(K, K, K) [strict]
    syntax KItem ::= SLT(K, K, K) [strict]
    syntax KItem ::= SLE(K, K, K) [strict]

    syntax KItem ::= OEQ(K, K, K) [strict]
    syntax KItem ::= OGT(K, K, K) [strict]
    syntax KItem ::= OGE(K, K, K) [strict]
    syntax KItem ::= OLT(K, K, K) [strict]
    syntax KItem ::= OLE(K, K, K) [strict]
    syntax KItem ::= ONE(K, K, K) [strict]
    syntax KItem ::= ORD(K, K, K) [strict]
    syntax KItem ::= UNE(K, K, K) [strict]
    //syntax LLVM ::= UNE(K, K, K) [strict]
    syntax KItem ::= UNO(K, K, K) [strict]
    syntax KItem ::= UEQ(K, K, K) [strict]


endmodule

module LLVM-SETTINGS
    imports LLVM-SYNTAX
    imports LLVM-ABSTRACTSYNTAX

    syntax Int ::= "numBitsPerByte" [function]
    rule numBitsPerByte => 8

    syntax Int ::= "numBytesPerPointer" [function]
    rule numBytesPerPointer => 4
endmodule

module LLVM-HELPERS
    imports LLVM-SYNTAX
    imports LLVM-ABSTRACTSYNTAX
    imports LLVM-SETTINGS

    syntax KItem ::= "none"
    syntax KItem ::= searchElemInMap(Map,K,K) [function]

    rule searchElemInMap(.Map,.K, _:K) => none
    rule searchElemInMap(M:Map, .K, Key':K)
         => searchElemInMap(M, choice(M), Key')
         when size(M) =/=Int 0
    rule searchElemInMap(M:Map,Key:K,Key:K)
         => M[Key]
    rule searchElemInMap(M:Map,Key:K,Key':K)
         => searchElemInMap(removeAll(M,SetItem(Key)),.K,Key')
         when Key =/=K Key' andBool Key =/=K .K

    syntax KList ::= StringToKList(String) [function]
    rule StringToKList("") => .KList
    rule
        StringToKList(S:String)
            => String2Char(substrString(S:String, 0, 1))
            ,, StringToKList(substrString(S:String, 1, lengthString(S:String)))
        when S:String =/=String ""


    // TODO many possible errors will slip by with this, but lots of stuff will work
    rule 'nullOfConstValueRef(.KList) => loc(-1, 0) [anywhere]

    syntax Int ::= base(Loc)
    rule base(loc(Base:Int, _)) => Base:Int
    
    syntax Int ::= offset(Loc)
    rule offset(loc(_, Offset:Int)) => Offset:Int
    
    syntax Loc ::= Loc "+" Int
    // TODO not checking for null
    
    rule loc(Base:Int, Offset:Int) + Offset':Int
            => loc(Base:Int, Offset:Int +Int Offset':Int)

    syntax KItem ::= splitBytes(K, K) // value, type
    syntax KItem ::= joinBytes(K, K) [strict(1)]

    syntax Int ::= wvalist(List, K)
    //rule isNat(wvalist(_, _)) => true

    syntax KItem ::= "byteType" [function]
    rule byteType => integerType(numBitsPerByte)

    syntax KItem ::= i(K) [function]//[latex "i({#1})"]
    rule i(N:Int) => integerType(N)

    syntax Int ::= sizeofInBits(K) [function]

    syntax Loc ::= intToPtr(K, K)
    syntax Int ::= ptrToInt(K, K)
    syntax KItem ::= read(K, K) [strict(1)]
    syntax KItem ::= write(K, K, K) [strict] // type, value, location

    syntax Kitem ::= innerType(K) [function]
    rule innerType(pointerType(K:K, _)) => K:K
    rule innerType(arrayType(K:K, _)) => K:K

    // these give the two's complement signed max and min of a type
    syntax Int ::= smax(K) [function]
    syntax Int ::= smin(K) [function]
    rule smax(Type:KResult) => (2 ^Int absInt(sizeofInBits(Type) -Int 1)) -Int 1
    rule smin(Type:KResult) => 0 -Int (2 ^Int absInt(sizeofInBits(Type) -Int 1))

    syntax Int ::= ufmax(K) [function]
    syntax Int ::= ufmin(K) [function]
    rule ufmax(Type:KResult) => (2 ^Int absInt(sizeofInBits(Type))) -Int 1
    rule ufmin(Type:KResult) => 0

    // should be a K, but builtins can't use K :(
    // declare signed : K K -> Nat // type, value
    syntax Int ::= signed(K, K)
    //rule isNat(signed(_, _)) => true

    // case when in bounds
    rule signed(Type:KResult, I:Int) => I
        when smin(Type) <=Int I andBool smax(Type) >=Int I

    // this reduces it to be close
    rule signed(Type:KResult, I:Int)
            => signed(Type:KResult, I %Int (ufmax(Type) +Int 1))
        when I >Int ufmax(Type) // note umax here
    // this picks up any extra distance
    rule signed(Type:KResult, I:Int)
            => I -Int (ufmax(Type) +Int 1)
        when I >Int smax(Type) andBool I <=Int ufmax(Type)

    // same as above
    rule signed(Type:KResult, I:Int)
            => signed(Type:KResult, I %Int (ufmax(Type) +Int 1))
        when I <Int 0 -Int ufmax(Type)
    rule signed(Type:KResult, I:Int)
            => I +Int (ufmax(Type) +Int 1)
        when I <Int smin(Type) andBool I >=Int 0 -Int ufmax(Type)


    // computes the positive remainder, whereas % can returns a negative number
    // TODO maybe should go in pl builtins
    syntax Int ::= K "remInt" K [function]
    rule (I:Int remInt N:Int) => ((I %Int N) +Int N) %Int N

    // declare unsigned : K K -> Nat // type, value
    syntax Int ::= unsigned(K, K) [function]
    //rule isNat(unsigned(_, _)) => true

    rule unsigned(Type:KResult, N:Int) => N
        when ufmin(Type) <=Int N andBool ufmax(Type) >=Int N
    rule unsigned(Type:KResult, I:Int) => I remInt (ufmax(Type) +Int 1)
        when I <Int ufmin(Type)
    rule unsigned(Type:KResult, N:Int) => N %Int (ufmax(Type) +Int 1)
        when N >Int ufmax(Type)

    syntax Bool ::= isIntegerType(K) [function]
    rule isIntegerType(integerType(_)) => true
    rule isIntegerType(KLabel:KLabel(_)) => false
        when KLabel =/=KLabel 'integerType

    syntax Bool ::= isFloatType(K) [function]
    rule isFloatType(F:FPType) => true
    rule isFloatType(x86_mmx) => true

    syntax Bool ::= isPointerType(K) [function]
    rule isPointerType(pointerType(_, _)) => true

    syntax Bool ::= isArrayType(K) [function]
    rule isArrayType(arrayType(_, _)) => true

    syntax Bool ::= isStructType(K)
    rule isStructType(structType(_)) => true

    // fixme size should depend on architecture
    rule sizeofInBits(pointerType(_, _)) => numBytesPerPointer *Int numBitsPerByte
    rule sizeofInBits(arrayType(Type:KResult, Len:Int)) => sizeofInBits(Type) *Int Len

    rule sizeofInBits(integerType(N:Int)) => N
    rule sizeofInBits(float) => 32
    rule sizeofInBits(double) => 64
    rule sizeofInBits(x86_fp80) => 80
    // TODO listK should be Fields (bug in K)
    rule sizeofInBits(structType(listK((Type:KResult,, L:KList))))
      => sizeofInBits(Type) +Int sizeofInBits(structType(listK(L)))
    rule sizeofInBits(structType(listK(.KList))) => 0

    syntax Int ::= sizeof(K) [function]
    rule sizeof(Type:KResult) => sizeofInBits(Type) /Int numBitsPerByte
        when numBitsPerByte dividesInt sizeofInBits(Type)

    syntax KItem ::= zeroOfType(K)
    rule zeroOfType(Type:KResult) => 0
        when isIntegerType(Type)


    syntax KList ::= K "copiesOf" KList [function]
    rule N:Int copiesOf L:KList => L,, (N:Int -Int 1 copiesOf L)
        when N:Int >Int 0
    rule 0 copiesOf _ => .KList

    // define N:Nat +Int (Offset:Nat +Int sym(Base:Nat))
        // => (N +Int Offset) +Int sym(Base)

    // define I:Int +Int (Offset:Nat +Int sym(Base:Nat))
        // => (absInt(I +Int Offset)) +Int sym(Base)
        // when I <Int 0 andBool I +Int Offset >=Int 0


endmodule

module LLVM-STANDARD-LIBRARY-SYNTAX

    syntax KItem ::= memcpy(K, K, K, K, K)
    syntax KItem ::= memset(K, K, K, K, K)

    syntax KItem ::= lifetimeStart(K, K)
    syntax KItem ::= lifetimeEnd(K, K)

    syntax KItem ::= vaStart(K)
    syntax KItem ::= vaCopy(K, K)
endmodule

module LLVM-SYSCALLS-SYNTAX

    syntax KLabel ::= syscallHandler(K) [function]

    syntax KLabel ::= "'sys-write"
    rule syscallHandler(4) => 'sys-write

    syntax KLabel ::= "'sys-getpid"
    rule syscallHandler(20) => 'sys-getpid

    syntax KLabel ::= "'sys-brk"
    rule syscallHandler(45) => 'sys-brk

    syntax KLabel ::= "'sys-ioctl"
    rule syscallHandler(54) => 'sys-ioctl

    syntax KLabel ::= "'sys-rt-sigprocmask"
    rule syscallHandler(175) => 'sys-rt-sigprocmask

    syntax KLabel ::= "'sys-gettid"
    rule syscallHandler(224) => 'sys-gettid

    syntax KLabel ::= "'sys-exit-group"
    rule syscallHandler(248) => 'sys-exit-group

    syntax KLabel ::= "'sys-tgkill"
    rule syscallHandler(268) => 'sys-tgkill

endmodule


module LLVM-CONFIGURATION
    imports LLVM-SYNTAX
    imports LLVM-ABSTRACTSYNTAX
    imports LLVM-SETTINGS
    imports LLVM-HELPERS

    configuration
        <T multiplicity="?">
            <k color="LightGreen"> $PGM:Module ~> initGlobals ~> callMain </k>
            <callStack color="Goldenrod"> .ElemList </callStack>
            <nextLoc color="gray"> loc(1, 0) </nextLoc>
            <brk> loc(0, 0) </brk>
            <control color="LightGoldenrod">
                <currBlock color="Orchid"> name("Initial") </currBlock>
                <prevBlock color="Orchid"> name("Initial") </prevBlock>
                <currModule color="Orchid"> name("Initial") </currModule>
                <currFunction color="Orchid"> name("Initial") </currFunction>
                <valist> .ElemList </valist>
                <registers color="teal"> .Map </registers>
                // TODO: this should eventually be a Set
                <currentModifiers color="Orchid"> .ElemList </currentModifiers>
                <localMemory> .ElemList </localMemory>
            </control>
            <memory color="teal" type="Map">
                <object multiplicity="*" color="LightSkyBlue">
                    <basePtr color="orange" type="Key"> -1 </basePtr>
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
            <modules color="teal">
                <module multiplicity="*" color="LightSkyBlue">
                    <moduleName color="orange"> name("") </moduleName>
                    <targetLayout> "" </targetLayout>
                    <targetTriple> "" </targetTriple>
                    <typedefs> .Map </typedefs>
                    <savedGlobals> .K </savedGlobals>
                    <globalRegisters color="teal"> .Map </globalRegisters>
                    <functions color="teal">
                        <function multiplicity="*" color="LightSkyBlue">
                            <functionName color="orange"> name("") </functionName>
                            <returnType> .K </returnType>
                            <formalParameters> .K </formalParameters>
                            <basicBlocks> .Map </basicBlocks>
                            <initialBasicBlock> .K </initialBasicBlock>
                        </function>
                    </functions>
                    <typeInfos color="teal">
                        <typeInfo multiplicity="*" color="LightSkyBlue">
                            <typeName color="orange"> name("") </typeName>
                            <offsets> .Map </offsets>
                        </typeInfo>
                    </typeInfos>
                </module>
            </modules>
        </T>
        <result multiplicity="?" color="DodgerBlue">
            <returnValue> -1 </returnValue>
        </result>

endmodule

/* this module contains rules for cleaning up the AST */
module LLVM-CLEAN-TREE
    imports LLVM-SYNTAX
    imports LLVM-ABSTRACTSYNTAX
    imports LLVM-SETTINGS
    imports LLVM-HELPERS
    imports LLVM-CONFIGURATION
    imports LLVM-STANDARD-LIBRARY-SYNTAX
    imports LLVM-SYSCALLS-SYNTAX

/*
    rule <k> Operand(Type:KResult, I:Int) => signed(Type, I) ...</k>
        when isIntegerType(Type)
    rule <k> Operand(Type:KResult, V:KResult) => V ...</k>
        when notBool isIntegerType(Type)
    // rule <k> Operand(Type:KResult, V:KResult) => V ...</k>

    rule GlobalVariables(L:KList) => KListToK(L)  [anywhere]
    rule Functions(L:KList) => KListToK(L)        [anywhere]
    rule Typedefs(L:KList) => KListToK(L)         [anywhere]
    rule <k> Aliases(L:KList) => KListToK(L) ...</k>
    //rule Body(L:KList) => KListToK(L)
    rule Instructions(L:KList) => KListToK(L)     [anywhere]
    rule ModuleID(S:String) => name(S)               [anywhere]
    rule values(K:K) => K                              [anywhere]
    rule Br(K:K) => K:K                               [anywhere]
    rule ReturnType(K:K) => K [anywhere]
*/


    rule icmp ne T:Type V:ValueRef , V':ValueRef I:InstructionMetadatas
         => theDefinition(INotEq(T, V, V'),I)
    rule icmp eq T:Type V:ValueRef , V':ValueRef I:InstructionMetadatas
         => theDefinition(IEq(T, V, V'),I)
    rule icmp ugt T:Type V:ValueRef , V':ValueRef I:InstructionMetadatas
         => theDefinition(UGT(T, V, V'),I)
    rule icmp uge T:Type V:ValueRef , V':ValueRef I:InstructionMetadatas
         => theDefinition(UGE(T, V, V'),I)
    rule icmp ult T:Type V:ValueRef , V':ValueRef I:InstructionMetadatas
         => theDefinition(ULT(T, V, V'),I)
    rule icmp ule T:Type V:ValueRef , V':ValueRef I:InstructionMetadatas
         => theDefinition(ULE(T, V, V'),I)
    rule icmp sgt T:Type V:ValueRef , V':ValueRef I:InstructionMetadatas
         => theDefinition(SGT(T, V, V'),I)
    rule icmp sge T:Type V:ValueRef , V':ValueRef I:InstructionMetadatas
         => theDefinition(SGE(T, V, V'),I)
    rule icmp slt T:Type V:ValueRef , V':ValueRef I:InstructionMetadatas
         => theDefinition(SLT(T, V, V'),I)
    rule icmp sle T:Type V:ValueRef , V':ValueRef I:InstructionMetadatas
         => theDefinition(SLE(T, V, V'),I)

    rule fcmp false _:Type _:ValueRef , _:ValueRef I:InstructionMetadatas
         => theDefinition(0,I)
    rule fcmp true _:Type _:ValueRef , _:ValueRef I:InstructionMetadatas
         => theDefinition(1,I)
    rule fcmp oeq T:Type V:ValueRef , V':ValueRef I:InstructionMetadatas
         => theDefinition(OEQ(T, V, V'),I)
    rule fcmp ogt T:Type V:ValueRef , V':ValueRef I:InstructionMetadatas
         => theDefinition(OGT(T, V, V'),I)
    rule fcmp oge T:Type V:ValueRef , V':ValueRef I:InstructionMetadatas
         => theDefinition(OGE(T, V, V'),I)
    rule fcmp olt T:Type V:ValueRef , V':ValueRef I:InstructionMetadatas
         => theDefinition(OLT(T, V, V'),I)
    rule fcmp ole T:Type V:ValueRef , V':ValueRef I:InstructionMetadatas
         => theDefinition(OLE(T, V, V'),I)
    rule fcmp one T:Type V:ValueRef , V':ValueRef I:InstructionMetadatas
         => theDefinition(ONE(T, V, V'),I)
    rule fcmp ord T:Type V:ValueRef , V':ValueRef I:InstructionMetadatas
         => theDefinition(ORD(T, V, V'),I)
    rule fcmp ueq T:Type V:ValueRef , V':ValueRef I:InstructionMetadatas
         => theDefinition(UEQ(T, V, V'),I)
    rule fcmp ugt T:Type V:ValueRef , V':ValueRef I:InstructionMetadatas
         => theDefinition(UGT(T, V, V'),I)
    rule fcmp uge T:Type V:ValueRef , V':ValueRef I:InstructionMetadatas
         => theDefinition(UGE(T, V, V'),I)
    rule fcmp ult T:Type V:ValueRef , V':ValueRef I:InstructionMetadatas
         => theDefinition(ULT(T, V, V'),I)
    rule fcmp ule T:Type V:ValueRef , V':ValueRef I:InstructionMetadatas
         => theDefinition(ULE(T, V, V'),I)
    rule fcmp une T:Type V:ValueRef , V':ValueRef I:InstructionMetadatas
         => theDefinition(UNE(T, V, V'),I)
    rule fcmp uno T:Type V:ValueRef , V':ValueRef I:InstructionMetadatas
         => theDefinition(UNO(T, V, V'),I)


/*
    rule
        <k> Instruction(Modifiers(L:KList), K:K) => K ...</k>
        <currentModifiers> _ => List(L) </currentModifiers>

    rule
        <k> ConstantExpr(Modifiers(L:KList), K:K) => K ...</k>
        <currentModifiers> _ => List(L) </currentModifiers>
*/
endmodule

module LLVM-GLOBALS
    imports LLVM-SYNTAX
    imports LLVM-ABSTRACTSYNTAX
    imports LLVM-SETTINGS
    imports LLVM-HELPERS
    imports LLVM-CONFIGURATION
    imports LLVM-STANDARD-LIBRARY-SYNTAX
    imports LLVM-SYSCALLS-SYNTAX


    syntax KItem ::= preInit(K, K, K) [strict(2)]

    
    rule
        <k> globalVariable(X:SymbolicValueRef, modifiers(L:ElemList), pointerType(TyK:K,Ad:K), Init:K)
            => preInit(X, alloca(TyK:K, 1), Init:K)
        ...</k>
        <currentModifiers> _ => L </currentModifiers>

    rule
        <k> preInit(X:SymbolicValueRef, Loc:Loc, initializer(TK:K, K:K)) => .K ...</k>
        <savedGlobals>... .K => store(TK:K, K:K, Loc) </savedGlobals>
        <globalRegisters> M:Map => M[X <- Loc] </globalRegisters>

    rule <k> initGlobals => K:K ...</k>
        <savedGlobals> K:K => .K </savedGlobals>

endmodule

module LLVM-REGISTERS
    imports LLVM-SYNTAX
    imports LLVM-ABSTRACTSYNTAX
    imports LLVM-SETTINGS
    imports LLVM-HELPERS
    imports LLVM-CONFIGURATION
    imports LLVM-STANDARD-LIBRARY-SYNTAX
    imports LLVM-SYSCALLS-SYNTAX

    rule [assign-register]:
        <k> assign(X:SymbolicValueRef, V:KResult) => . ...</k>
        <registers> M:Map => M[X <- V] </registers>

    // TODO using constructors in the AST instead of matching on a string
    rule [lookup-register]:
        <k> name(S:#String) => searchElemInMap(M,.K,name(S)) ...</k>
        <registers> M:Map </registers>
        when substrString(S, 0, 1) ==String "%"
           andBool searchElemInMap(M,.K,name(S)) =/=K none

    rule [lookup-global-register]:
        <k> name(S:#String) => searchElemInMap(M,.K,name(S)) ...</k>
        <globalRegisters> M:Map </globalRegisters>
        when substrString(S, 0, 1) ==String "@"
           andBool searchElemInMap(M,.K,name(S)) =/=K none

endmodule

module LLVM-BRANCHING
    imports LLVM-SYNTAX
    imports LLVM-ABSTRACTSYNTAX
    imports LLVM-SETTINGS
    imports LLVM-HELPERS
    imports LLVM-CONFIGURATION
    imports LLVM-STANDARD-LIBRARY-SYNTAX
    imports LLVM-SYSCALLS-SYNTAX

    rule
        <k> unconditional(Label:SymbolicValueRef) => M[Label] </k>
        <currFunction> FunName:SymbolicValueRef </currFunction>
        <functionName> FunName:SymbolicValueRef </functionName>
        <basicBlocks> M:Map </basicBlocks>

    rule
        <k> conditional(I:Int, Label:K, _)
            => unconditional(Label:K)
        </k>
        when unsigned(i(1), I) ==Int 1
    rule
        <k> conditional(I:Int, _, Label:K)
            => unconditional(Label:K)
        </k>
        when unsigned(i(1), I) ==Int 0

    // TODO put static switch information into a map like with phi nodes
    // TODO semantic design pattern: list traversal -> statically storing info and using simple rules later
    rule [switch-default]:
        <k> switch(_, I:Int, Label:K, listK(.KList))
            => unconditional(Label:K)
        </k>
    rule [switch-hit]:
        <k> switch(Type:KResult, I:Int, _, listK((case(I':Int, Label:K),, L:KList)))
            => unconditional(Label:K)
        </k>
        when unsigned(Type, I) ==Int unsigned(Type, I')
    rule [switch-miss]:
        <k> switch(
                Type:KResult,
                I:Int,
                _,
                listK(((case(I':Int, Label:K) => .KList),, L:KList))
            )
        </k>
        when unsigned(Type, I) =/=Int unsigned(Type, I')

endmodule

module LLVM-PHI
    // TODO possibly preprocess PHI
    imports LLVM-SYNTAX
    imports LLVM-ABSTRACTSYNTAX
    imports LLVM-SETTINGS
    imports LLVM-HELPERS
    imports LLVM-CONFIGURATION
    imports LLVM-STANDARD-LIBRARY-SYNTAX
    imports LLVM-SYSCALLS-SYNTAX

    //change second argument of PHI from KLIst to listK(KList)
    rule
        <k> phi(_:K, listK((edge(K':K, Label:SymbolicValueRef),, _:KList)))
            => K'
        ...</k>
        <prevBlock> Label </prevBlock>

    rule
        <k> phi(_:K,
                 listK(((edge(K:K, Label:SymbolicValueRef) => .KList),, _:KList))) ...</k>
        <prevBlock> Label':SymbolicValueRef </prevBlock>
        when Label =/=K Label'

endmodule

module LLVM-SELECTION
    imports LLVM-SYNTAX
    imports LLVM-ABSTRACTSYNTAX
    imports LLVM-SETTINGS
    imports LLVM-HELPERS
    imports LLVM-CONFIGURATION
    imports LLVM-STANDARD-LIBRARY-SYNTAX
    imports LLVM-SYSCALLS-SYNTAX

    rule [select-false]:
        select(Type:KResult, I:Int, _, K:K) => K
        when unsigned(Type, I) ==Int 0
    rule [select-true]:
        select(Type:KResult, I:Int, K:K, _) => K
        when unsigned(Type, I) >Int 0
endmodule

module LLVM-START-AND-STOP
    imports LLVM-SYNTAX
    imports LLVM-ABSTRACTSYNTAX
    imports LLVM-SETTINGS
    imports LLVM-HELPERS
    imports LLVM-CONFIGURATION
    imports LLVM-STANDARD-LIBRARY-SYNTAX
    imports LLVM-SYSCALLS-SYNTAX

    rule
        <k> callMain
            => call(i(32), callee(values(name("@__libc_start_main_0")),
                arguments(
                    val(funptr(name("@main"))), // address of main
                    (val(0), // argc
                    (val(alloca(i(8), 8)), // argv
                    (val('nullOfConstValueRef(.KList)), // init
                    (val('nullOfConstValueRef(.KList)), // fini
                    val('nullOfConstValueRef(.KList))// ldso_fini
                )))))
            ))
        </k>
        <functionName> name("@main") </functionName>
        <formalParameters> arguments(L:ElemList) </formalParameters>
        when lengthOfList(L) ==Int 0

    // TODO need to initialize argc and argv properly
    // TODO need to make nicer
    rule
        <k> callMain
            => call(i(32), callee(values(name("@__libc_start_main_2")),
                arguments((
                    val(funptr(name("@main"))), // address of main
                    val(0), // argc
                    val(
                        initEnvStructures(alloca(i(8),
                         (sizeof(pointerType(i(8),0)) *Int 3) +Int (sizeof(i(64)) *Int 38)))
                    ),
                    val('nullOfConstValueRef(.KList)), // init
                    val('nullOfConstValueRef(.KList)), // fini
                    val('nullOfConstValueRef(.KList)) // ldso_fini
                ))
            ))
        </k>
        <functionName> name("@main") </functionName>
        <formalParameters> arguments(L:ElemList) </formalParameters>
        when lengthOfList(L) ==Int 2

    syntax KItem ::= initEnvStructures(K) [strict]
    syntax KItem ::= "initEnvStructures'" "(" K ")"

    rule // argv & envp
        <k> initEnvStructures(Loc:Loc)
            => write(arrayType(pointerType(i(8),0), 3), zeroinitializer, Loc)
            ~> initEnvStructures'(Loc + sizeof(arrayType(pointerType(i(8),0), 3)))
            ~> Loc
        ...</k>

    rule
        <k> initEnvStructures'(Loc:Loc)
            => memset(Loc, 0, 37, .K, .K) // auxv
        ...</k>

    rule [terminate-exit]:
        <T>...
            <k> I:Int => call(void, callee(values(name("@exit")), arguments(val(I)))) </k>
        ...</T>

    // TODO it's not clear whether this belongs here or in SYSCALLS-IMPL
    //output buffer need to in a final state.
    rule
        <T>...
            <k> 'sys-exit-group(I:Int,, _) ...</k>
            <output> .List </output>
        ...</T>
        =>
        <result>...
            <returnValue> I remInt 256 </returnValue>
        ...</result>

endmodule

module LLVM-DECLARATIONS
    imports LLVM-SYNTAX
    imports LLVM-ABSTRACTSYNTAX
    imports LLVM-SETTINGS
    imports LLVM-HELPERS
    imports LLVM-CONFIGURATION
    imports LLVM-STANDARD-LIBRARY-SYNTAX
    imports LLVM-SYSCALLS-SYNTAX

    // TODO: semantic design pattern: assignment rule
    rule
        <k> alias(X:SymbolicValueRef, K:K) => . ...</k>
        <globalRegisters> Map:Map => Map[X <- K] </globalRegisters>

    // TODO KListToK module sections
    // TODO: semantic design pattern: multi-arity (want multiple pieces of data at the same time like key/value pairs) vs. variadic (when you don't need to do things at the same time)
    rule
        <k> theModule(Label:SymbolicValueRef, TargetLayout:K, TargetTriple:K, Typedefs:K, GlobalVars:K,
            Aliases:K, Functions:K)
            => Typedefs
            ~> GlobalVars
            ~> Aliases
            ~> Functions
        ...</k>
        <currModule> _ => Label </currModule>
        <modules>...
            . =>
            <module>...
                <moduleName> Label </moduleName>
                <targetLayout> TargetLayout </targetLayout>
                <targetTriple> TargetTriple </targetTriple>
            ...</module>
        ...</modules>

    rule [typedef-assignment]:
        <k> typedef(X:SymbolicValueRef, UnresolvedType:K) => .K ...</k>
        //<currentModifiers> _ => List(L) </currentModifiers> TODO not printing modifiers
        <currModule> Label:SymbolicValueRef </currModule>
        <moduleName> Label':SymbolicValueRef </moduleName>
        <typedefs> M:Map => M[X <- UnresolvedType] </typedefs>
        when Label ==K Label'

    rule [typedef-lookup]:
        <k> namedType(X:SymbolicValueRef) => UnresolvedType ...</k>
        <typedefs>... X |-> UnresolvedType:K ...</typedefs>

    // TODO: hack because hybrids don't seem to be working
    rule Fields(L:ElemList) => L
    rule Types(L:ElemList) => L

    rule
        <k> functionDef(RetType:KResult, Label:SymbolicValueRef, Arguments:K, F:K)
            => F ...</k>
        <currFunction> _ => Label </currFunction>
        <globalRegisters> M:Map => M[Label <- funptr(Label)] </globalRegisters>
        (. =>
            <function>...
                <returnType> RetType </returnType>
                <formalParameters> Arguments:K </formalParameters>
                <functionName> Label </functionName>
            ...</function>
        )

    rule
        <k> functionDecl(RetType:KResult, Label:SymbolicValueRef, Arguments:K)
            => .K ...</k>
        <globalRegisters> M:Map => M[Label <- funptr(Label)] </globalRegisters>
        (. =>
            <function>...
                <returnType> RetType </returnType>
                <formalParameters> Arguments:K </formalParameters>
                <functionName> Label </functionName>
            ...</function>
        )

    // TODO add redundant context for readability (maps)
    rule
        <k> body(val(basicBlock(Label:SymbolicValueRef, K:K)), L:ElemList)
            => basicBlock(Label:SymbolicValueRef, K:K)
            ~> elemListToK(L)
        ...</k>
        <currFunction> FunName:SymbolicValueRef </currFunction>
        <functionName> FunName':SymbolicValueRef </functionName>
        <initialBasicBlock> .K => Label:SymbolicValueRef </initialBasicBlock>
        when FunName ==K FunName'

    rule
        <k> basicBlock(Label:SymbolicValueRef, K:K) => .K ...</k>
        <currFunction> FunName:SymbolicValueRef </currFunction>
        <functionName> FunName':SymbolicValueRef </functionName>
        <basicBlocks> M => M[Label <- (setBlock(Label) ~> K:K)] </basicBlocks>
        when FunName ==K FunName'

    rule
        <k> setBlock(Label:SymbolicValueRef) => .K ...</k>
        <currBlock> Label':SymbolicValueRef => Label </currBlock>
        <prevBlock> _ => Label' </prevBlock>

endmodule

module LLVM-SEMANTICS
    imports LLVM-SYNTAX
    imports LLVM-ABSTRACTSYNTAX
    imports LLVM-SETTINGS
    imports LLVM-HELPERS
    imports LLVM-CONFIGURATION
    imports LLVM-STANDARD-LIBRARY-SYNTAX
    imports LLVM-SYSCALLS-SYNTAX
    imports LLVM-CLEAN-TREE
    imports LLVM-GLOBALS
    imports LLVM-REGISTERS
    imports LLVM-BRANCHING
    imports LLVM-PHI
    imports LLVM-SELECTION
    imports LLVM-START-AND-STOP
    imports LLVM-DECLARATIONS
/*
    imports LLVM-HELPERS-SPLIT-BYTES
    imports LLVM-HELPERS-JOIN-BYTES

    imports LLVM-SELECTION
    imports LLVM-REGISTERS
    imports LLVM-START-AND-STOP
    imports LLVM-CALL-RET
    imports LLVM-VARIADICS
    imports LLVM-DECLARATIONS
    imports LLVM-ARITHMETIC
    imports LLVM-FLOATING-POINT-ARITHMETIC
    imports LLVM-GEP
    imports LLVM-MEMORY
    imports LLVM-COMPARISONS
    imports LLVM-CONVERSIONS
    imports LLVM-LITERALS
    imports LLVM-STANDARD-LIBRARY-PREPROCESS
    imports LLVM-STANDARD-LIBRARY
    imports LLVM-SYSCALLS-PREPROCESS
    imports LLVM-SYSCALLS
    imports LLVM-EXCEPTIONS

    imports LLVM-INTERNAL-TESTING-FUNCTIONS
*/
endmodule
