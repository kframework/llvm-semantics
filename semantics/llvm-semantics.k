// Copyright (c) 2013-2014 K Team. All Rights Reserved.
requires "llvm-syntax.k"

module LLVM-ABSTRACTSYNTAX
    imports LLVM-SYNTAX

    syntax KResult ::= Int | String | Floating
                      | arrayValue(List)
                      | Loc
                      | integerType(K)
                      | pointerType(K, K) //type, address space
                      | arrayTypeValue(K, K)  // inner type, length
                      | structTypeValue(K)
                      | functionTypeValue(K, K)  // return type, argument types
                      | listK(List)  [latex({#1})]

    syntax Element ::= val(K) [strict]
    syntax KResult ::= valValue(K)
    rule val(K:KResult) => valValue(K) [structural]

    syntax ElemList ::= List{Element,","} [strict,klabel('elemCon)]
    syntax Int ::= lengthOfList(ElemList) [function]

    rule lengthOfList(.ElemList) => 0
    rule lengthOfList(val(K:K),L:ElemList) => 1 +Int lengthOfList(L)

    syntax KItem ::= elemListToK(ElemList) [function]

    rule elemListToK(.ElemList) => .K
    rule elemListToK(val(K:K), L:ElemList) => K ~> elemListToK(L)

    syntax KItem ::= instructionListToK(InstructionList) [function]

    rule instructionListToK(.InstructionList) => .K
    rule instructionListToK(K:Instruction L:Instruction)
                             => K ~> instructionListToK(L)

    syntax List ::= elemListToList(ElemList) [function]

    rule elemListToList(.ElemList) => .List
    rule elemListToList(val(K:K), L:ElemList) => ListItem(K) elemListToList(L)

    syntax NonVoidType ::= arrayType(K, K) [strict] // inner type, length
                         | structType(K) [strict]
                         | namedType(K)
                         | functionType(K, K) [strict] // return type, argument types

    rule arrayType(K1:KResult, K2:KResult) => arrayTypeValue(K1, K2) [structural]
    rule structType(K1:KResult) => structTypeValue(K1) [structural]
    rule functionType(K1:KResult, K2:KResult) => functionTypeValue(K1, K2) [structural]

    //uniform the types.
    rule [ I:UnsignedInt x T:Type ] => arrayType(T,
                                    String2Int(#tokenToString(I))) [structural]
    rule T:Type A:OptAddrSpace * => pointerType(T, A) [structural]
    rule { Ts:TypeList } => structType(Ts) [macro]
    rule < { Ts:TypeList } > => structType(Ts) [macro]

    //change IntType from LLVM syntax to K rule syntax
    rule I:IntType => integerType(String2Int(substrString(#tokenToString(I),
                        1, lengthString(#tokenToString(I))))) [structural]

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

    syntax KItem ::= "emptyDef"
    syntax KItem ::= "funBegin"
    syntax KItem ::= "debug" // TODO [semantic]
    syntax KItem ::= "callMain" // TODO [semantic]
    syntax KItem ::= "initGlobals" // TODO [semantic]
    syntax ElemList ::= "vararg"

    //LLVM builtin values
    syntax KResult ::= "NaN"
    syntax KResult ::= "PositiveZero"
    syntax KResult ::= "NegativeZero"
    syntax KResult ::= "PositiveInfinity"
    syntax KResult ::= "NegativeInfinity"

    //don't know how to deal with
    syntax KItem ::= moduleAsm(String)
    syntax KItem ::= metaConst(K, IndexList) //Type, IndexList
    syntax KItem ::= metaVar(MetadataVar, MetadataInts) //Name, MetaList

    syntax KItem ::= float(String)
    syntax KItem ::= constantString(String)
    syntax KItem ::= constantArray(K, K) [strict] // element type, arguments

    syntax KItem ::= invoke(K, K, K, K)//operand, Params, fromLabel toLabel
    syntax KItem ::= initializer(K, K) // type, value
    syntax KItem ::= globalVariable(K, K, K, K) [strict(3)]// Value/Name, Modifiers, Type, Initializer
    syntax KItem ::= modifiers(ElemList)
    syntax KItem ::= insMetas(ElemList)
    syntax KItem ::= alloca(K, K) [strict] // Type, NumElements
    syntax KItem ::= load(K, K) [strict]
    syntax KItem ::= operand(K, K) [strict] // Type, Value

    //instructions
    syntax KItem ::= store(K, K, K) [strict]  // Type, Value, Destination
    syntax KItem ::= ret(K, K) [strict]//type value,
    syntax KItem ::= assign(K, K) [strict(2)] // Name, Instruction
    syntax KItem ::= instruction(K, K, K) //body, modifiers, instructionMetadatas

    syntax KItem ::= "unreachable"
    syntax KItem ::= resume(K)//operand
    syntax KItem ::= indirectbr(K, ElemList)//operand, list of labels
    syntax KItem ::= unconditional(K)//label
    syntax KItem ::= conditional(K, K, K) [strict(1)]//operand, label1, label2
    syntax KItem ::= switch(K, K, K, K) [strict(1,2,4)] // type, condition, default dest, list of cases
    syntax Case ::= case(K, K) [strict(1)] // operand, successor
    syntax KResult ::= caseValue(K, K)
    syntax Cases ::= List{Case,","} [strict,klabel('caseCon)]
    rule case(K:KResult, K') => caseValue(K, K') [structural]

    syntax KItem ::= arguments(ElemList) [strict]
    syntax KItem ::= arg(K, K, K) // Modifiers, Type, Value/Name

    //@ Conversion Operations
    syntax KItem ::= theTrunc(K, K, K) [strict] // type, op, totype
    syntax KItem ::= theSExt(K, K, K) [strict] // type, op, totype
    syntax KItem ::= theZExt(K, K, K) [strict] // oldtype, op, totype
    syntax KItem ::= theBitCast(K, K, K) [strict] // type, op, totype
    syntax KItem ::= theIntToPtr(K, K, K) [strict] // type, op, totype
    syntax KItem ::= thePtrToInt(K, K, K) [strict] // type, op, totype
    syntax KItem ::= theFpToSI(K, K, K) [strict] // type, op, totype
    syntax KItem ::= theFpToUI(K, K, K) [strict] // type, op, totype
    syntax KItem ::= theFPTrunc(K, K, K) [strict] // type, op, totype
    syntax KItem ::= theFPExt(K, K, K) [strict] // type, op, totype
    syntax KItem ::= theSIToFP(K, K, K) [strict] // type, op, totype
    syntax KItem ::= theUIToFP(K, K, K) [strict] // type, op, totype
    syntax KItem ::= theAddrspacecast(K, K, K) [strict]//type, op, totype

    syntax KItem ::= constantStruct(K, K) [strict(2)] // modifiers, arguments
    syntax KItem ::= theVAArg(K, K) [strict] // result type, va_list
    syntax KItem ::= values(K)
    syntax KItem ::= phi(K, K) // type, edge list
    syntax KItem ::= edge(K, K) // used by PHI
    syntax KItem ::= select(K, K, K, K) [strict(1,2)] // condition, true val, false val
    syntax KItem ::= call(K, K) [strict(2)] // Type, Callee
    syntax KItem ::= callee(K, K) [strict] // Value/Name, Arguments
    syntax KItem ::= calleeValue(K, K)
    rule callee(K:KResult, K':KResult) => calleeValue(K, K') [structural]

    syntax KItem ::= getElementPtr(K, K, ElemList) [strict]
    syntax KItem ::= aliases(ElemList)
    syntax KItem ::= alias(K, K, K) //modifiers, Name, Aliasee
    syntax KItem ::= theModule(K, K, K, K, K, K, K, K)
                    //Id, TargetLayout, TargetTriple, MetaVars,Typedefs,GlobalVars,Aliases,Functions 
    syntax KItem ::= basicBlock(K, K) // Name, Instructions
    syntax KItem ::= functionDef(K, K, K, K, K)  [strict(2)] // Attributes, RetType, Value/Name, Arguments, Body
    syntax KItem ::= functionDecl(K, K, K, K)  [strict(2)] // Attributes,Type, Value/Name, Arguments
    syntax KItem ::= typedef(K, K) // name, type TODO: modifiers
    syntax KItem ::= fields(ElemList) [strict]
    syntax KItem ::= types(ElemList)  [strict]
    syntax KItem ::= setBlock(K)
    syntax KItem ::= body(ElemList)

    syntax SymbolicValueRef ::= name(String)

    syntax KItem ::= theDefinition(K,K) [strict]
    syntax KItem ::= iNotEq(K, K, K) [strict] // type, left op, right op
    syntax KItem ::= iEq(K, K, K) [strict]
    syntax KItem ::= uGT(K, K, K) [strict]
    syntax KItem ::= uGE(K, K, K) [strict]
    syntax KItem ::= uLT(K, K, K) [strict]
    syntax KItem ::= uLE(K, K, K) [strict]
    syntax KItem ::= sGT(K, K, K) [strict]
    syntax KItem ::= sGE(K, K, K) [strict]
    syntax KItem ::= sLT(K, K, K) [strict]
    syntax KItem ::= sLE(K, K, K) [strict]

    syntax KItem ::= oEQ(K, K, K) [strict]
    syntax KItem ::= oGT(K, K, K) [strict]
    syntax KItem ::= oGE(K, K, K) [strict]
    syntax KItem ::= oLT(K, K, K) [strict]
    syntax KItem ::= oLE(K, K, K) [strict]
    syntax KItem ::= oNE(K, K, K) [strict]
    syntax KItem ::= oRD(K, K, K) [strict]
    syntax KItem ::= uNE(K, K, K) [strict]
    //syntax LLVM ::= uNE(K, K, K) [strict]
    syntax KItem ::= uNO(K, K, K) [strict]
    syntax KItem ::= uEQ(K, K, K) [strict]


    //@ Binary Operations
    syntax KItem ::= theAdd(K, K, K) [strict] // Type, Left op, Right op
    syntax KItem ::= theSub(K, K, K) [strict] // Type, Left op, Right op
    syntax KItem ::= theMul(K, K, K) [strict] // Type, Left op, Right op
    syntax KItem ::= theUDiv(K, K, K) [strict] // Type, Left op, Right op
    syntax KItem ::= theSDiv(K, K, K) [strict] // Type, Left op, Right op
    syntax KItem ::= theURem(K, K, K) [strict] // Type, Left op, Right op
    syntax KItem ::= theSRem(K, K, K) [strict] // Type, Left op, Right op

    //@ Floating-point Binary Operations
    //strict on all the arguments for theFSub, theFMul, theFDiv, the FRem
    syntax KItem ::= theFAdd(K, K, K) [strict] // Type, Left op, Right op
    syntax KItem ::= theFSub(K, K, K) [strict] // Type, Left op, Right op
    syntax KItem ::= theFMul(K, K, K) [strict] // Type, Left op, Right op
    syntax KItem ::= theFDiv(K, K, K) [strict] // Type, Left op, Right op
    syntax KItem ::= theFRem(K, K, K) [strict] // Type, Left op, Right op

    //@ Bitwise Binary Operations
    // strict on all the arguments for the LShr, AShr, 
    syntax KItem ::= theShl(K, K, K) [strict(2,3)] // Type, Left op, Right op
    syntax KItem ::= theLShr(K, K, K) [strict] // Type, Left op, Right op
    syntax KItem ::= theAShr(K, K, K) [strict] // Type, Left op, Right op
    syntax KItem ::= theOr(K, K, K) [strict(2,3)] // Type, Left op, Right op
    syntax KItem ::= theAnd(K, K, K) [strict] // Type, Left op, Right op
    syntax KItem ::= theXor(K, K, K) [strict(2,3)] // Type, Left op, Right op


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

    syntax List ::= StringToList(String) [function]
    rule StringToList("") => .List
    rule
        StringToList(S:String)
            => ListItem(String2Char(substrString(S:String, 0, 1)))
                StringToList(substrString(S:String, 1, lengthString(S:String)))
        when S =/=String ""


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

    syntax Loc ::= intToPtrOfLoc(K, K)
    syntax Int ::= ptrToIntOfLoc(K, K)
    syntax KItem ::= read(K, K) [strict(1)]
    syntax KItem ::= write(K, K, K) [strict] // type, value, location

    syntax Kitem ::= innerType(K) [function]
    rule innerType(pointerType(K:K, _)) => K:K
    rule innerType(arrayType(K:K, _)) => K:K
    rule innerType(arrayTypeValue(K:K, _)) => K:K

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
    rule isIntegerType(_) => false [owise]

    syntax Bool ::= isFloatType(K) [function]
    rule isFloatType(F:FPType) => true
    rule isFloatType(x86_mmx) => true
    rule isFloatType(_) => false [owise]

    syntax Bool ::= isPointerType(K) [function]
    rule isPointerType(pointerType(_, _)) => true
    rule isPointerType(_) => false [owise]

    syntax Bool ::= isArrayType(K) [function]
    rule isArrayType(arrayType(_, _)) => true
    rule isArrayType(arrayTypeValue(_, _)) => true
    rule isArrayType(_) => false [owise]

    syntax Bool ::= isStructType(K)
    rule isStructType(structType(_)) => true
    rule isStructType(structTypeValue(_)) => true
    rule isStructType(_) => false [owise]

    // fixme size should depend on architecture
    rule sizeofInBits(pointerType(_, _)) => numBytesPerPointer *Int numBitsPerByte
    rule sizeofInBits(arrayType(Type:KResult, Len:Int)) => sizeofInBits(Type) *Int Len
    rule sizeofInBits(arrayTypeValue(Type:KResult, Len:Int)) => sizeofInBits(Type) *Int Len

    rule sizeofInBits(integerType(N:Int)) => N
    rule sizeofInBits(float) => 32
    rule sizeofInBits(double) => 64
    rule sizeofInBits(x86_fp80) => 80
    // TODO listK should be Fields (bug in K)
    rule sizeofInBits(structTypeValue(listK((ListItem(Type:KResult) L:List))))
      => sizeofInBits(Type) +Int sizeofInBits(structTypeValue(listK(L)))
    rule sizeofInBits(structTypeValue(listK(.List))) => 0
    rule sizeofInBits(structType(listK((ListItem(Type:KResult) L:List))))
      => sizeofInBits(Type) +Int sizeofInBits(structType(listK(L)))
    rule sizeofInBits(structType(listK(.List))) => 0

    syntax Int ::= sizeof(K) [function]
    rule sizeof(Type:KResult) => sizeofInBits(Type) /Int numBitsPerByte
        when numBitsPerByte dividesInt sizeofInBits(Type)

    syntax KItem ::= zeroOfType(K)
    rule zeroOfType(Type:KResult) => 0
        when isIntegerType(Type)


    syntax List ::= K "copiesOf" List [function]
    rule N:Int copiesOf L:List => L (N:Int -Int 1 copiesOf L)
        when N:Int >Int 0
    rule 0 copiesOf _ => .List

    // define N:Int +Int (Offset:Int +Int sym(Base:Int))
        // => (N +Int Offset) +Int sym(Base)

    // define I:Int +Int (Offset:Int +Int sym(Base:Int))
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
            <callStack color="Goldenrod"> .List </callStack>
            <nextLoc color="gray"> loc(1, 0) </nextLoc>
            <brk> loc(0, 0) </brk>
            <control color="LightGoldenrod">
                <currBlock color="Orchid"> name("Initial") </currBlock>
                <prevBlock color="Orchid"> name("Initial") </prevBlock>
                <currModule color="Orchid"> name("Initial") </currModule>
                <currFunction color="Orchid"> name("Initial") </currFunction>
                <valist> .List </valist>
                <registers color="teal"> .Map </registers>
                // TODO: this should eventually be a Set
                <currentModifiers color="Orchid"> .ElemList </currentModifiers>
                <currentMetadatas color="Orchid"> .ElemList </currentMetadatas>
                <localMemory> .List </localMemory>
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
                    <globalFunVarCounter> 0 </globalFunVarCounter>
                    <attributeGroups> .Map </attributeGroups>
                    <metaGroups> .Map </metaGroups>
                    <globalRegisters color="teal"> .Map </globalRegisters>
                    <typeInfos color="teal">
                        <typeInfo multiplicity="*" color="LightSkyBlue">
                            <typeName color="orange"> name("") </typeName>
                            <offsets> .Map </offsets>
                        </typeInfo>
                    </typeInfos>
                </module>
            </modules>
            <functions color="teal">
                 <function multiplicity="*" color="LightSkyBlue">
                       <funModuleName color="orange"> name("") </funModuleName>
                       <functionName color="orange"> name("") </functionName>
                       <returnType> .K </returnType>
                       <formalParameters> .K </formalParameters>
                       <basicBlocks> .Map </basicBlocks>
                       <localFunVarCounter> 0 </localFunVarCounter>
                       <initialBasicBlock> .K </initialBasicBlock>
                 </function>
            </functions>
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

    rule <k> operand(Type:KResult, I:Int) => signed(Type, I) ...</k>
        when isIntegerType(Type)
    rule <k> operand(Type:KResult, V:KResult) => V ...</k>
        when notBool isIntegerType(Type)
/*
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


    rule
        <k> instruction(K:K, modifiers(L:Element), insMetas(L':Element)) => K ...</k>
        <currentModifiers> _ => L </currentModifiers>
        <currentMetadatas> _ => L' </currentMetadatas>
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

    //for the pointer type of global variable.
    rule
        <k> globalVariable(X:SymbolicValueRef, modifiers(L:ElemList), pointerType(TyK:K,Ad:K), Init:K)
            => preInit(X, alloca(TyK:K, 1), initializer(TyK,Init))
        ...</k>
        <currentModifiers> _ => L </currentModifiers>

    //for the array type of global variable.
    rule
        <k> globalVariable(X:SymbolicValueRef, modifiers(L:ElemList)
                , arrayTypeValue(TyK:KResult,Size:Int), Init:K)
            => preInit(X, alloca(TyK, Size), initializer(TyK,Init))
        ...</k>
        <currentModifiers> _ => L </currentModifiers>

    //for the struct type of global variable.
    rule
        <k> globalVariable(X:SymbolicValueRef, modifiers(L:ElemList)
                , structTypeValue(TyK:KResult), Init:K)
            => preInit(X, alloca(TyK, 1), initializer(TyK,Init))
        ...</k>
        <currentModifiers> _ => L </currentModifiers>

    //for the function type of global variable - an error.
    rule
        <k> globalVariable(X:SymbolicValueRef, modifiers(L:ElemList)
                , functionTypeValue(TyK:K, K':K), Init:K) ~> K
            => .K
        </k>
        <output>... .List => ListItem("error: invalid type for global variable") </output>

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
        <k> name(S:String) => searchElemInMap(M,.K,name(S)) ...</k>
        <registers> M:Map </registers>
        when substrString(S, 0, 1) ==String "%"
           andBool searchElemInMap(M,.K,name(S)) =/=K none

    rule [lookup-global-register]:
        <k> name(S:String) => searchElemInMap(M,.K,name(S)) ...</k>
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
        <currModule> ModName:SymbolicValueRef </currModule>
        <funModuleName> ModName </funModuleName>
        <currFunction> FunName:SymbolicValueRef </currFunction>
        <functionName> FunName </functionName>
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
        <k> switch(_, I:Int, Label:K, listK(.List))
            => unconditional(Label:K)
        </k>
    rule [switch-hit]:
        <k> switch(Type:KResult, I:Int, _, listK(ListItem(caseValue(I':Int, Label:K)) L:List))
            => unconditional(Label:K)
        </k>
        when unsigned(Type, I) ==Int unsigned(Type, I')
    rule [switch-miss]:
        <k> switch(
                Type:KResult,
                I:Int,
                _,
                listK(ListItem(caseValue(I':Int, Label:K)) L:List
                     => L)
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
        <k> phi(_:K, listK(ListItem(edge(K':K, Label:SymbolicValueRef)) _:List))
            => K'
        ...</k>
        <prevBlock> Label </prevBlock>

    rule
        <k> phi(_:K,
                 listK(ListItem(edge(K:K, Label:SymbolicValueRef)) L:List
                        => L)) ...</k>
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
        <currModule> ModName:SymbolicValueRef </currModule>
        <funModuleName> ModName </funModuleName>
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
        <currModule> ModName:SymbolicValueRef </currModule>
        <funModuleName> ModName </funModuleName>
        <functionName> name("@main") </functionName>
        <formalParameters> arguments(L:ElemList) </formalParameters>
        when lengthOfList(L) ==Int 2

    syntax KItem ::= initEnvStructures(K) [strict]
    syntax KItem ::= "initEnvStructures'" "(" K ")"

    rule // argv & envp
        <k> initEnvStructures(Loc:Loc)
            => write(arrayTypeValue(pointerType(i(8),0), 3), zeroinitializer, Loc)
            ~> initEnvStructures'(Loc + sizeof(arrayTypeValue(pointerType(i(8),0), 3)))
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

module LLVM-PREPROCESSING
    imports LLVM-SYNTAX
    imports LLVM-ABSTRACTSYNTAX
    imports LLVM-SETTINGS
    imports LLVM-HELPERS
    imports LLVM-CONFIGURATION
    imports LLVM-STANDARD-LIBRARY-SYNTAX
    imports LLVM-SYSCALLS-SYNTAX

    syntax KItem ::= preModule(Module, K, K, K, K, K, K, K, K)
    syntax KItem ::= stringConstruct(String)
    syntax KItem ::= preFunctionDecl(FunctionProto) [function]

    rule preFunctionDecl(Ex:ExternalLinkage Vi:OptVisibilityStyle
                         Cl:OptCallingConv Re:RetAttrs Ty:Type Gl:GlobalName
                         ( Ars:ArgList ) Un:OptUnnamedAddr Fu:FuncAttrs Se:OptSection
                         Co:OptComdat Al:OptAlign Gc:OptGC Pf:OptPrefix Pl:OptPrologue)
          => functionDecl(modifiers(val(Ex),val('dllStorageEmpty(.KList)),val(Vi),val(Cl)
                         ,val(Re),val(Un),val(Fu),val(Se)
                         ,val(Co),val(Al),val(Gc),val(Pf),val(Pl)),Ty,Gl,Ars)
    rule preFunctionDecl(Dll:OptDllStorageClass Vi:OptVisibilityStyle
                         Cl:OptCallingConv Re:RetAttrs Ty:Type Gl:GlobalName
                         ( Ars:ArgList ) Un:OptUnnamedAddr Fu:FuncAttrs Se:OptSection
                         Co:OptComdat Al:OptAlign Gc:OptGC Pf:OptPrefix Pl:OptPrologue)
          => functionDecl(modifiers(val('nonExternalLinkageEmpty(.KList)),val(Dll),val(Vi),val(Cl)
                         ,val(Re),val(Un),val(Fu),val(Se)
                         ,val(Co),val(Al),val(Gc),val(Pf),val(Pl)),Ty,Gl,Ars)

    syntax KItem ::= preFunctionDef(Function) [function]

    rule preFunctionDef(Li:OptLinkage Vi:OptVisibilityStyle Dll:OptDllStorageClass
                        Cl:OptCallingConv Re:RetAttrs Ty:Type Gl:GlobalName
                         (Ars:ArgList) Un:OptUnnamedAddr Fu:FuncAttrs Se:OptSection
                          Co:OptComdat Al:OptAlign Gc:OptGC Pf:OptPrefix Pr:OptPrologue
                        {Bl:BasicBlockList})
         => functionDef(modifiers(val(Li),val(Vi),val(Dll),val(Cl),val(Re),val(Un),val(Fu)
                       ,val(Se),val(Co),val(Al),val(Gc),val(Pf),val(Pr)),Ty,Gl,Ars,Bl)

    syntax ElemList ::= dealWithSectionComdatAndAlign(K, K, K, K, K, K, K, K, K) [function]
    rule dealWithSectionComdatAndAlign(A:K, B:K, C:K, D:K, E:K, F:K, G:K,
          H:K, 'sectionComdatAndAlignEmpty(.KList))
         => val(A),val(B),val(C),val(D),val(E),val(F),val(G),val(H)
            ,val('sectionEmpty(.KList)),val('comdatEmpty(.KList)),val('alignEmpty(.KList))
    rule dealWithSectionComdatAndAlign(A:K, B:K, C:K, D:K, E:K, F:K, G:K,
          H:K, , section S)
         => val(A),val(B),val(C),val(D),val(E),val(F),val(G),val(H)
            ,val(section S),val('comdatEmpty(.KList)),val('alignEmpty(.KList))
    rule dealWithSectionComdatAndAlign(A:K, B:K, C:K, D:K, E:K, F:K, G:K,
          H:K, , Al:Align)
         => val(A),val(B),val(C),val(D),val(E),val(F),val(G),val(H)
            ,val('sectionEmpty(.KList)),val('comdatEmpty(.KList)),val(Al)
    rule dealWithSectionComdatAndAlign(A:K, B:K, C:K, D:K, E:K, F:K, G:K,
          H:K, , Co:Comdat)
         => val(A),val(B),val(C),val(D),val(E),val(F),val(G),val(H)
            ,val('sectionEmpty(.KList)),val(Co),val('alignEmpty(.KList))
    rule dealWithSectionComdatAndAlign(A:K, B:K, C:K, D:K, E:K, F:K, G:K,
          H:K, , Co:Comdat , Al:Align)
         => val(A),val(B),val(C),val(D),val(E),val(F),val(G),val(H)
            ,val('sectionEmpty(.KList)),val(Co),val(Al)
    rule dealWithSectionComdatAndAlign(A:K, B:K, C:K, D:K, E:K, F:K, G:K,
          H:K, , section S , Al:Align)
         => val(A),val(B),val(C),val(D),val(E),val(F),val(G),val(H)
            ,val(section S),val('comdatEmpty(.KList)),val(Al)
    rule dealWithSectionComdatAndAlign(A:K, B:K, C:K, D:K, E:K, F:K, G:K,
          H:K, , Al:Align , section S)
         => val(A),val(B),val(C),val(D),val(E),val(F),val(G),val(H)
            ,val(section S),val('comdatEmpty(.KList)),val(Al)
    rule dealWithSectionComdatAndAlign(A:K, B:K, C:K, D:K, E:K, F:K, G:K,
          H:K, , section S , Co:Comdat)
         => val(A),val(B),val(C),val(D),val(E),val(F),val(G),val(H)
            ,val(section S),val(Co),val('alignEmpty(.KList))
    rule dealWithSectionComdatAndAlign(A:K, B:K, C:K, D:K, E:K, F:K, G:K,
          H:K, , section S , Co:Comdat , Al:Align)
         => val(A),val(B),val(C),val(D),val(E),val(F),val(G),val(H)
            ,val(section S),val(Co),val(Al)


    rule <k> DefList:Module => preModule(DefList, .K, .K, .K, .K, .K, .K, .K, .K) ...</k>
         <modules>...
            .Bag =>
            <module>...
                <moduleName> name("main") </moduleName>
            ...</module>
        ...</modules>
        [structural]

    rule preModule(target triple = S DL:Module, ModuleAsms:K, TargetLayout:K,
            TargetTriple:K, MetaVars:K, Typedefs:K, GlobalVars:K, Aliases:K, Functions:K)
         => preModule(DL:Module, ModuleAsms, TargetLayout:K, TargetTriple:K ~> stringConstruct(S), MetaVars:K,
               Typedefs:K, GlobalVars:K, Aliases:K, Functions:K)
    rule preModule(target datalayout = S DL:Module, ModuleAsms:K, TargetLayout:K,
            TargetTriple:K, MetaVars:K, Typedefs:K, GlobalVars:K, Aliases:K, Functions:K)
         => preModule(DL, ModuleAsms:K, TargetLayout:K ~> stringConstruct(S), TargetTriple:K, MetaVars:K,
               Typedefs:K, GlobalVars:K, Aliases:K, Functions:K)
    rule preModule(declare F:FunctionProto DL:Module, ModuleAsms:K, TargetLayout:K,
            TargetTriple:K, MetaVars:K, Typedefs:K, GlobalVars:K, Aliases:K, Functions:K)
         => preModule(DL:Module, ModuleAsms:K, TargetLayout:K, TargetTriple:K, MetaVars:K,
               Typedefs:K, GlobalVars:K, Aliases:K, Functions:K ~> preFunctionDecl(F))
    rule preModule(define F:Function DL:Module, ModuleAsms:K, TargetLayout:K,
            TargetTriple:K, MetaVars:K, Typedefs:K, GlobalVars:K, Aliases:K, Functions:K)
         => preModule(DL, ModuleAsms:K, TargetLayout:K, TargetTriple:K, MetaVars:K,
               Typedefs:K, GlobalVars:K, Aliases:K, Functions:K ~> preFunctionDef(F))
    rule preModule(module asm S DL:Module, ModuleAsms:K, TargetLayout:K,
            TargetTriple:K, MetaVars:K, Typedefs:K, GlobalVars:K, Aliases:K, Functions:K)
         => preModule(DL:Module, ModuleAsms:K ~> moduleAsm(S), TargetLayout:K, TargetTriple:K, MetaVars:K,
               Typedefs:K, GlobalVars:K, Aliases:K, Functions:K)
    rule preModule(N:LocalName = type Ty:Type DL:Module, ModuleAsms:K, TargetLayout:K,
            TargetTriple:K, MetaVars:K, Typedefs:K, GlobalVars:K, Aliases:K, Functions:K)
         => preModule(DL:Module, ModuleAsms:K, TargetLayout:K, TargetTriple:K, MetaVars:K,
               Typedefs:K ~> typedef(name(#tokenToString(N)),Ty)
               , GlobalVars:K, Aliases:K, Functions:K)
    rule preModule(N:LocalName = type opaque DL:Module, ModuleAsms:K, TargetLayout:K,
            TargetTriple:K, MetaVars:K, Typedefs:K, GlobalVars:K, Aliases:K, Functions:K)
         => preModule(DL:Module, ModuleAsms:K, TargetLayout:K, TargetTriple:K, MetaVars:K,
               Typedefs:K ~> typedef(name(#tokenToString(N)),opaque)
               , GlobalVars:K, Aliases:K, Functions:K)
    rule preModule(N:GlobalVar = Ex:ExternalLinkage Vi:OptVisibilityStyle
                          Dll:OptDllStorageClass Th:OptThreadLocal Ad:OptAddrSpace
                          Un:OptUnnamedAddr Exi:OptExternallyInitialized Gl:GlobalType
                          Ty:Type Sca:OptSectionComdatAndAlign DL:Module, ModuleAsms:K, TargetLayout:K,
            TargetTriple:K, MetaVars:K, Typedefs:K, GlobalVars:K, Aliases:K, Functions:K)
         => preModule(DL:Module, ModuleAsms:K, TargetLayout:K, TargetTriple:K, MetaVars:K,
               Typedefs:K, GlobalVars ~> globalVariable(name(#tokenToString(N)),modifiers(
              dealWithSectionComdatAndAlign(Ex,Vi,Dll,Th,Ad,Un,Exi,Gl,Sca))
              ,Ty,emptyDef), Aliases:K, Functions:K)

    rule <k> preModule(N:GlobalValID = Ex:ExternalLinkage Vi:OptVisibilityStyle
                          Dll:OptDllStorageClass Th:OptThreadLocal Ad:OptAddrSpace
                          Un:OptUnnamedAddr Exi:OptExternallyInitialized Gl:GlobalType
                          Ty:Type Sca:OptSectionComdatAndAlign DL:Module, ModuleAsms:K, TargetLayout:K,
            TargetTriple:K, MetaVars:K, Typedefs:K, GlobalVars:K, Aliases:K, Functions:K)
         => preModule(DL:Module, ModuleAsms:K, TargetLayout:K, TargetTriple:K, MetaVars:K,
               Typedefs:K, GlobalVars ~> globalVariable(name(#tokenToString(N)),modifiers(
              dealWithSectionComdatAndAlign(Ex,Vi,Dll,Th,Ad,Un,Exi,Gl,Sca))
              ,Ty,emptyDef), Aliases:K, Functions:K)
         ...</k><globalFunVarCounter> Count:Int => Count +Int 1 </globalFunVarCounter>
         when String2Int(substrString(#tokenToString(N),1
               ,lengthString(#tokenToString(N)))) ==Int Count

    rule <k> preModule(N:GlobalValID = Ex:ExternalLinkage Vi:OptVisibilityStyle
                          Dll:OptDllStorageClass Th:OptThreadLocal Ad:OptAddrSpace
                          Un:OptUnnamedAddr Exi:OptExternallyInitialized Gl:GlobalType
                          Ty:Type Sca:OptSectionComdatAndAlign DL:Module, ModuleAsms:K, TargetLayout:K,
            TargetTriple:K, MetaVars:K, Typedefs:K, GlobalVars:K, Aliases:K, Functions:K) ~> K:K
         => .K </k><globalFunVarCounter> Count:Int => Count +Int 1 </globalFunVarCounter>
         <output>... .List => ListItem("error: variable expected to be numbered " +String Int2String(Count)) </output>
         when String2Int(substrString(#tokenToString(N),1
               ,lengthString(#tokenToString(N)))) =/=Int Count

    rule <k> preModule(Ex:ExternalLinkage Vi:OptVisibilityStyle
                          Dll:OptDllStorageClass Th:OptThreadLocal Ad:OptAddrSpace
                          Un:OptUnnamedAddr Exi:OptExternallyInitialized Gl:GlobalType
                          Ty:Type Sca:OptSectionComdatAndAlign DL:Module, ModuleAsms:K, TargetLayout:K,
            TargetTriple:K, MetaVars:K, Typedefs:K, GlobalVars:K, Aliases:K, Functions:K)
         => preModule(DL:Module, ModuleAsms:K, TargetLayout:K, TargetTriple:K, MetaVars:K,
               Typedefs:K, GlobalVars ~> globalVariable(name(#tokenToString("@" +String Int2String(Count)))
             ,modifiers(dealWithSectionComdatAndAlign(Ex,Vi,Dll,Th,Ad,Un,Exi,Gl,Sca))
              ,Ty,emptyDef), Aliases:K, Functions:K)
         ...</k><globalFunVarCounter> Count:Int => Count +Int 1 </globalFunVarCounter>

    rule preModule(N:GlobalVar = Ex:NonExternalLinkage Vi:OptVisibilityStyle
                     Dll:OptDllStorageClass Th:OptThreadLocal Ad:OptAddrSpace
                     Un:OptUnnamedAddr Exi:OptExternallyInitialized Gl:GlobalType
                     Ty:Type Vl:ValueRef Sca:OptSectionComdatAndAlign DL:Module
                     , ModuleAsms:K, TargetLayout:K,
                    TargetTriple:K, MetaVars:K, Typedefs:K, GlobalVars:K, Aliases:K, Functions:K)
         => preModule(DL:Module, ModuleAsms:K, TargetLayout:K, TargetTriple:K, MetaVars:K,
               Typedefs:K, GlobalVars ~> globalVariable(name(#tokenToString(N)),modifiers(
              dealWithSectionComdatAndAlign(Ex,Vi,Dll,Th,Ad,Un,Exi,Gl,Sca))
              ,Ty,Vl), Aliases:K, Functions:K)

    rule <k> preModule(N:GlobalValID = Ex:NonExternalLinkage Vi:OptVisibilityStyle
                 Dll:OptDllStorageClass Th:OptThreadLocal Ad:OptAddrSpace
                 Un:OptUnnamedAddr Exi:OptExternallyInitialized Gl:GlobalType
                 Ty:Type Vl:ValueRef Sca:OptSectionComdatAndAlign DL:Module, ModuleAsms:K, TargetLayout:K,
            TargetTriple:K, MetaVars:K, Typedefs:K, GlobalVars:K, Aliases:K, Functions:K)
         => preModule(DL:Module, ModuleAsms:K, TargetLayout:K, TargetTriple:K, MetaVars:K,
               Typedefs:K, GlobalVars ~> globalVariable(name(#tokenToString(N)),modifiers(
              dealWithSectionComdatAndAlign(Ex,Vi,Dll,Th,Ad,Un,Exi,Gl,Sca))
              ,Ty,Vl), Aliases:K, Functions:K)
         ...</k><globalFunVarCounter> Count:Int => Count +Int 1 </globalFunVarCounter>
         when String2Int(substrString(#tokenToString(N),1
               ,lengthString(#tokenToString(N)))) ==Int Count

    rule <k> preModule(N:GlobalValID = Ex:NonExternalLinkage Vi:OptVisibilityStyle
               Dll:OptDllStorageClass Th:OptThreadLocal Ad:OptAddrSpace
               Un:OptUnnamedAddr Exi:OptExternallyInitialized Gl:GlobalType
               Ty:Type Vl:ValueRef Sca:OptSectionComdatAndAlign DL:Module, ModuleAsms:K, TargetLayout:K,
               TargetTriple:K, MetaVars:K, Typedefs:K, GlobalVars:K, Aliases:K, Functions:K) ~> K:K
         => .K </k><globalFunVarCounter> Count:Int => Count +Int 1 </globalFunVarCounter>
         <output>... .List => ListItem("error: variable expected to be numbered " +String Int2String(Count)) </output>
         when String2Int(substrString(#tokenToString(N),1
               ,lengthString(#tokenToString(N)))) =/=Int Count

    rule <k> preModule(Ex:NonExternalLinkage Vi:OptVisibilityStyle
               Dll:OptDllStorageClass Th:OptThreadLocal Ad:OptAddrSpace
               Un:OptUnnamedAddr Exi:OptExternallyInitialized Gl:GlobalType
               Ty:Type Vl:ValueRef Sca:OptSectionComdatAndAlign DL:Module, ModuleAsms:K, TargetLayout:K,
            TargetTriple:K, MetaVars:K, Typedefs:K, GlobalVars:K, Aliases:K, Functions:K)
         => preModule(DL:Module, ModuleAsms:K, TargetLayout:K, TargetTriple:K, MetaVars:K,
               Typedefs:K, GlobalVars ~> globalVariable(name(#tokenToString("@" +String Int2String(Count)))
             ,modifiers(dealWithSectionComdatAndAlign(Ex,Vi,Dll,Th,Ad,Un,Exi,Gl,Sca))
              ,Ty,Vl), Aliases:K, Functions:K)
         ...</k><globalFunVarCounter> Count:Int => Count +Int 1 </globalFunVarCounter>

    rule preModule(deplibs = [ Ss:Strings ] DL:Module, ModuleAsms:K, TargetLayout:K, TargetTriple:K
           , MetaVars:K, Typedefs:K, GlobalVars:K, Aliases:K, Functions:K)
         => preModule(DL:Module, ModuleAsms:K, TargetLayout:K, TargetTriple:K
           , MetaVars:K, Typedefs:K, GlobalVars:K, Aliases:K, Functions:K)

    rule preModule(Cv:ComdatVar = comdat Sel:SelectionKind DL:Module, ModuleAsms:K
           , TargetLayout:K, TargetTriple:K
           , MetaVars:K, Typedefs:K, GlobalVars:K, Aliases:K, Functions:K)
         => preModule(DL:Module, ModuleAsms:K, TargetLayout:K, TargetTriple:K
           , MetaVars:K, Typedefs:K, GlobalVars:K, Aliases:K, Functions:K)

    rule preModule(N:GlobalVar = Ex:OptLinkage Vi:OptVisibilityStyle
                     alias Exi:OptLinkage Al:AliaseeRef DL:Module
                     , ModuleAsms:K, TargetLayout:K,TargetTriple:K
                     , MetaVars:K, Typedefs:K, GlobalVars:K, Aliases:K, Functions:K)
         => preModule(DL:Module, ModuleAsms:K, TargetLayout:K, TargetTriple:K, MetaVars:K, Typedefs:K
           , GlobalVars, Aliases:K ~> alias(modifiers(val(Ex),val(Vi),val(Exi))
           ,name(#tokenToString(N)),Al), Functions:K)

    rule <k> preModule(N:GlobalValID = Ex:OptLinkage Vi:OptVisibilityStyle
                     alias Exi:OptLinkage Al:AliaseeRef DL:Module, ModuleAsms:K, TargetLayout:K,
            TargetTriple:K, MetaVars:K, Typedefs:K, GlobalVars:K, Aliases:K, Functions:K)
         => preModule(DL:Module, ModuleAsms:K, TargetLayout:K, TargetTriple:K, MetaVars:K,
               Typedefs:K, GlobalVars, Aliases:K ~> alias(modifiers(val(Ex),val(Vi),val(Exi))
               ,name(#tokenToString(N)),Al), Functions:K)
         ...</k><globalFunVarCounter> Count:Int => Count +Int 1 </globalFunVarCounter>
         when String2Int(substrString(#tokenToString(N),1
               ,lengthString(#tokenToString(N)))) ==Int Count

    rule <k> preModule(N:GlobalValID = Ex:OptLinkage Vi:OptVisibilityStyle
                     alias Exi:OptLinkage Al:AliaseeRef DL:Module, ModuleAsms:K, TargetLayout:K,
               TargetTriple:K, MetaVars:K, Typedefs:K, GlobalVars:K, Aliases:K, Functions:K) ~> K:K
         => .K </k><globalFunVarCounter> Count:Int => Count +Int 1 </globalFunVarCounter>
         <output>... .List => ListItem("error: variable expected to be numbered " +String Int2String(Count)) </output>
         when String2Int(substrString(#tokenToString(N),1
               ,lengthString(#tokenToString(N)))) =/=Int Count

    rule <k> preModule(attributes Av:AttributeGroupId = { .GroupAttrs } DL:Module, ModuleAsms:K
           , TargetLayout:K, TargetTriple:K
           , MetaVars:K, Typedefs:K, GlobalVars:K, Aliases:K, Functions:K) ~>K:K => .K </k>
         <output>... .List => ListItem("error: attribute group has no attributes") </output>

    rule <k> preModule(attributes Av:AttributeGroupId = { Gas:GroupAttrs } DL:Module, ModuleAsms:K
           , TargetLayout:K, TargetTriple:K
           , MetaVars:K, Typedefs:K, GlobalVars:K, Aliases:K, Functions:K)
            => preModule(DL,ModuleAsms,TargetLayout,TargetTriple
               , MetaVars,Typedefs,GlobalVars,Aliases,Functions) ...</k>
         <attributeGroups> M:Map => M[Av <- Gas] </attributeGroups>
         when Gas =/=K .GroupAttrs

    rule <k> preModule(! I:UnsignedInt = Ty:Type ! { Ins:IndexList } DL:Module
           , ModuleAsms:K, TargetLayout:K, TargetTriple:K
           , MetaVars:K, Typedefs:K, GlobalVars:K, Aliases:K, Functions:K)
            => preModule(DL,ModuleAsms,TargetLayout,TargetTriple
               , MetaVars,Typedefs,GlobalVars,Aliases,Functions) ...</k>
         <attributeGroups> M:Map => M[I <- metaConst(Ty, Ins)] </attributeGroups>
         when notBool (I in keys(M))

    rule <k> preModule(! I:UnsignedInt = Ty:Type ! { Ins:IndexList } DL:Module
           , ModuleAsms:K, TargetLayout:K, TargetTriple:K
           , MetaVars:K, Typedefs:K, GlobalVars:K, Aliases:K, Functions:K) ~> K:K
            => .K </k>
         <attributeGroups> M:Map </attributeGroups>
         <output>... .List => ListItem("error: Metadata id is already used") </output>
         when I in keys(M)

    rule preModule(N:MetadataVar = ! { Mis:MetadataInts } DL:Module
           , ModuleAsms:K, TargetLayout:K, TargetTriple:K
           , MetaVars:K, Typedefs:K, GlobalVars:K, Aliases:K, Functions:K)
         => preModule(DL
           , ModuleAsms, TargetLayout, TargetTriple
           , MetaVars ~> metaVar(N,Mis),Typedefs,GlobalVars, Aliases, Functions)

    rule preModule(.Module, ModuleAsms:K, TargetLayout:K, TargetTriple:K, MetaVars:K
            , Typedefs:K, GlobalVars:K, Aliases:K, Functions:K)
         => theModule(name("main"),TargetLayout, TargetTriple, MetaVars
            ,Typedefs, GlobalVars,Aliases, Functions) [structural]

    rule <k> metaVar(N:MetadataVar, Mis:MetadataInts) => .K ...</k>
         <attributeGroups> M:Map => M[N <- Mis] </attributeGroups>
         when allInMap(Mis,M)
    rule <k> metaVar(N:MetadataVar, Mis:MetadataInts) ~> K:K => .K </k>
         <attributeGroups> M:Map </attributeGroups>
         <output>... .List => ListItem("error: use of undefined metadata ''") </output>
         when notBool allInMap(Mis,M)

    syntax Bool ::= allInMap(MetadataInts, Map) [function]

    rule allInMap(.MetadataInts,M:Map) => true
    rule allInMap(! I:UnsignedInt, Mis:MetadataInts,M:Map) => false
         when notBool (I in keys(M))
    rule allInMap(! I:UnsignedInt, Mis:MetadataInts,M:Map)
         => allInMap(Mis,M)
         when I in keys(M)

endmodule

module LLVM-NORMALIZING
    imports LLVM-SYNTAX
    imports LLVM-ABSTRACTSYNTAX
    imports LLVM-SETTINGS
    imports LLVM-HELPERS
    imports LLVM-CONFIGURATION
    imports LLVM-STANDARD-LIBRARY-SYNTAX
    imports LLVM-SYSCALLS-SYNTAX
    imports LLVM-PREPROCESSING

    syntax SymbolicValueRef ::= makeVarFromLabel(LabelStringConstant)
                                [function]
    rule makeVarFromLabel(L:LabelStringConstant)
              => name(substrString(#tokenToString(L), 0
                    , lengthString(#tokenToString(L)) -Int 1))

    //useful function to turn a kitem into an elemList
    syntax KItem ::= doubleList(RetAttrs, FuncAttrs)
    syntax ElemList ::= formElemList(K) [function]

    rule formElemList('.InstructionMetadatas(.KList)) => .ElemList
    rule formElemList(, Mv:MetadataVar Mi:MetadataValueInt Ins:InstructionMetadatas)
              => val(Mv Mi),formElemList(Ins)
    rule formElemList(, Mv:MetadataVar ! { In:IndexList } Ins:InstructionMetadatas)
              => val(Mv ! { In }),formElemList(Ins)
    rule formElemList(.LabelValues) => .ElemList
    rule formElemList(label Va:ValueRef, Ls:LabelValues)
                    => val(Va),formElemList(Ls)
    rule formElemList(doubleList(.RetAttrs,.FuncAttrs)) => .ElemList
    rule formElemList(doubleList(.RetAttrs,F:FuncAttr Fs:FuncAttrs))
            => val(F),formElemList(doubleList(.RetAttrs,Fs))
    rule formElemList(doubleList(R:RetAttr Rs:RetAttrs,Fs:FuncAttrs))
            => val(R),formElemList(doubleList(Rs,Fs))
    rule formElemList(.ParamList) => .ElemList
    rule formElemList(Ty:Type Pa:ParamAttrs Va:ValueRef, Pl:ParamList)
            => val(arg(modifiers(formElemList(Pa)),Ty,Va)),formElemList(Pl)
    rule formElemList(.ParamAttrs) => .ElemList
    rule formElemList(Pa:ParamAttr Ps:ParamAttrs) => val(Pa),formElemList(Ps)
    rule formElemList(nsw) => val(nsw)
    rule formElemList(nuw) => val(nuw)
    rule formElemList(nsw nuw) => val(nsw),val(nuw)
    rule formElemList(nuw nsw) => val(nsw),val(nuw)
    rule formElemList('nwEmpty(.KList)) => .ElemList
    rule formElemList(.FastMathFlags) => .ElemList
    //here | Done
    //do the same as fast for "nnan" | "ninf" | "nsz" | "arcp"
    rule formElemList(fast Fl:FastMathFlags) => val(fast),formElemList(Fl)
    rule formElemList(nnan Fl:FastMathFlags) => val(nnan),formElemList(Fl)
    rule formElemList(ninf Fl:FastMathFlags) => val(ninf),formElemList(Fl)
    rule formElemList(nsz Fl:FastMathFlags) => val(nsz),formElemList(Fl)
    rule formElemList(arcp Fl:FastMathFlags) => val(arcp),formElemList(Fl)
    rule formElemList(K:K) => K [owise]

    syntax Cases ::= formCases(K) [function]

    rule formCases(.JumpTable) => .Cases
    rule formCases(It:IntType Ca:ConstValueRef,
                 label Va:ValueRef Cs:JumpTable)
                 => case(operand(It,Ca),Va), formCases(Cs)
    rule formCases(K:K) => K [owise]

    syntax KItem ::= instValToKItem(InstVal) [function]
   
    //here
    //do the same for all IntConstructors  "add" | "sub" | "mul" | "shl" | done
    rule instValToKItem(add Onw:OptNW Ty:Type V1:ValueRef , V2:ValueRef Ins:InstructionMetadatas)
           => instruction(theAdd(Ty,V1,V2),formElemList(Onw),Ins)
    rule instValToKItem(sub Onw:OptNW Ty:Type V1:ValueRef , V2:ValueRef Ins:InstructionMetadatas)
           => instruction(theSub(Ty,V1,V2),formElemList(Onw),Ins)
    rule instValToKItem(mul Onw:OptNW Ty:Type V1:ValueRef , V2:ValueRef Ins:InstructionMetadatas)
           => instruction(theMul(Ty,V1,V2),formElemList(Onw),Ins)
    rule instValToKItem(shl Onw:OptNW Ty:Type V1:ValueRef , V2:ValueRef Ins:InstructionMetadatas)
           => instruction(theShl(Ty,V1,V2),formElemList(Onw),Ins)
    //do the same for all DivConstructors ::= "udiv" | "sdiv" | "lshr" | "ashr"
    //done
    rule instValToKItem(udiv Opx:OptExact Ty:Type V1:ValueRef , V2:ValueRef Ins:InstructionMetadatas)
           => instruction(theUDiv(Ty,V1,V2),formElemList(Opx),Ins)
    rule instValToKItem(sdiv Opx:OptExact Ty:Type V1:ValueRef , V2:ValueRef Ins:InstructionMetadatas)
           => instruction(theSDiv(Ty,V1,V2),formElemList(Opx),Ins)
    rule instValToKItem(lshr Opx:OptExact Ty:Type V1:ValueRef , V2:ValueRef Ins:InstructionMetadatas)
           => instruction(theLShr(Ty,V1,V2),formElemList(Opx),Ins)
    rule instValToKItem(ashr Opx:OptExact Ty:Type V1:ValueRef , V2:ValueRef Ins:InstructionMetadatas)
           => instruction(theAShr(Ty,V1,V2),formElemList(Opx),Ins)
    //do the same for all FloatOps ::= "fadd" | "fsub" | "fmul" | "fdiv" | "frem"
    rule instValToKItem(fadd Fmf:FastMathFlags Ty:Type V1:ValueRef , V2:ValueRef Ins:InstructionMetadatas)
           => instruction(theFAdd(Ty,V1,V2),formElemList(Fmf),Ins)
    rule instValToKItem(fsub Fmf:FastMathFlags Ty:Type V1:ValueRef , V2:ValueRef Ins:InstructionMetadatas)
           => instruction(theFSub(Ty,V1,V2),formElemList(Fmf),Ins)
    rule instValToKItem(fmul Fmf:FastMathFlags Ty:Type V1:ValueRef , V2:ValueRef Ins:InstructionMetadatas)
           => instruction(theFMul(Ty,V1,V2),formElemList(Fmf),Ins)
    rule instValToKItem(fdiv Fmf:FastMathFlags Ty:Type V1:ValueRef , V2:ValueRef Ins:InstructionMetadatas)
           => instruction(theFDiv(Ty,V1,V2),formElemList(Fmf),Ins)
    rule instValToKItem(frem Fmf:FastMathFlags Ty:Type V1:ValueRef , V2:ValueRef Ins:InstructionMetadatas)
           => instruction(theFRem(Ty,V1,V2),formElemList(Fmf),Ins)





   
    //do the same for all FloatOps ::= "fadd" | "fsub" | "fmul" | "fdiv" | "frem"

    rule instValToKItem(urem Ty:Type V1:ValueRef , V2:ValueRef Ins:InstructionMetadatas)
           => instruction(theURem(Ty,V1,V2),.ElemList,Ins)
    rule instValToKItem(srem Ty:Type V1:ValueRef , V2:ValueRef Ins:InstructionMetadatas)
           => instruction(theSRem(Ty,V1,V2),.ElemList,Ins)

    rule instValToKItem(and Ty:Type V1:ValueRef , V2:ValueRef Ins:InstructionMetadatas)
           => instruction(theAnd(Ty,V1,V2),.ElemList,Ins)
    //do the same for LogicalOps ::= "and" | "or" | "xor"


   /*
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
    */

    //do the same for all the rules above.
    rule instValToKItem(icmp ne Ty:Type V1:ValueRef , V2:ValueRef Ins:InstructionMetadatas)
           => instruction(iNotEq(Ty,V1,V2),.ElemList,Ins)

    //do the same for all the rules: CastOps ::= "trunc" | "zext" | "sext" | "fptrunc"
                     //| "fpext" | "bitcast" | "uitofp" | "sitofp"
                     //| "fptoui" | "fptosi" | "inttoptr"
                     //| "addrspacecast" | "ptrtoint"
    rule instValToKItem(trunc Ty1:Type V:ValueRef to Ty2:Type Ins:InstructionMetadatas)
           => instruction(theTrunc(Ty1, V, Ty2),.ElemList,Ins)

    //ensure the static single assignment property in a function.
    //and normalize the llvm operators to abstract syntax.

    syntax KItem ::= checkSingleAssignment(K, K, Set)
                   | checkSingleAssignmentInBlock(SymbolicValueRef, K,K, Set)

    //form a basicBlock finally.
    rule checkSingleAssignmentInBlock(N:SymbolicValueRef, .K, K:K, S:Set)
         ~> checkSingleAssignment(K1:K, K2:K, S':Set)
         => checkSingleAssignment(K1, K2 ~> basicBlock(N,K), S S')

    //have dealt with all instruction list.
    rule checkSingleAssignmentInBlock(N:SymbolicValueRef, .InstructionList
                               BB:K, K:K, S:Set)
         => checkSingleAssignmentInBlock(N, BB, K, S)

    //deal with termination instructions.
    rule checkSingleAssignmentInBlock(N:SymbolicValueRef, ret Nt:NonVoidType
                                  Va:ValueRef Meta:InstructionMetadatas, K:K, S:Set)
         => checkSingleAssignmentInBlock(N, .K, K
                         ~> instruction(ret(Nt,Va),modifiers(.ElemList),
                                            insMetas(formElemList(Meta))), S)
    rule checkSingleAssignmentInBlock(N:SymbolicValueRef, ret Nt:VoidType
                                  Meta:InstructionMetadatas, K:K, S:Set)
         => checkSingleAssignmentInBlock(N, .K, K
                         ~> instruction(ret(Nt,emptyDef),modifiers(.ElemList),
                                                   insMetas(formElemList(Meta))), S)
    rule checkSingleAssignmentInBlock(N:SymbolicValueRef, br label La:ValueRef
                                  Meta:InstructionMetadatas, K:K, S:Set)
         => checkSingleAssignmentInBlock(N, .K, K
                   ~> instruction(unconditional(La), modifiers(.ElemList),
                                     insMetas(formElemList(Meta))), S)
    rule checkSingleAssignmentInBlock(N:SymbolicValueRef, br It:IntType Va:ValueRef ,
                                       label La1:ValueRef , label La2:ValueRef
                                  Meta:InstructionMetadatas, K:K, S:Set)
         => checkSingleAssignmentInBlock(N, .K, K
             ~> instruction(conditional(operand(It,Va), La1, La2),
                             modifiers(.ElemList),insMetas(formElemList(Meta))), S)
    rule checkSingleAssignmentInBlock(N:SymbolicValueRef, resume Ty:Type Va:ValueRef
                                    Meta:InstructionMetadatas, K:K, S:Set)
         => checkSingleAssignmentInBlock(N, .K, K
             ~> instruction(resume(operand(Ty,Va)),
                             modifiers(.ElemList),insMetas(formElemList(Meta))), S)
    rule checkSingleAssignmentInBlock(N:SymbolicValueRef, indirectbr Ty:Type Va:ValueRef ,
                                       [ Las:LabelValues ]
                                  Meta:InstructionMetadatas, K:K, S:Set)
         => checkSingleAssignmentInBlock(N, .K, K
                ~> instruction(indirectbr(operand(Ty,Va),
                   formElemList(Las)),modifiers(.ElemList), insMetas(formElemList(Meta))), S)
    rule checkSingleAssignmentInBlock(N:SymbolicValueRef, switch It:IntType Va:ValueRef ,
                                       label La:ValueRef [ Ju:JumpTable ]
                                  Meta:InstructionMetadatas, K:K, S:Set)
         => checkSingleAssignmentInBlock(N, .K, K
                  ~> instruction(switch(It,Va,La,formCases(Ju)),
                                      modifiers(.ElemList),insMetas(formElemList(Meta))), S)
    rule checkSingleAssignmentInBlock(N:SymbolicValueRef, unreachable
                                  Meta:InstructionMetadatas, K:K, S:Set)
         => checkSingleAssignmentInBlock(N, .K, K
                       ~> instruction(unreachable,modifiers(.ElemList),insMetas(formElemList(Meta))), S)

    rule <k>checkSingleAssignmentInBlock(N:SymbolicValueRef, invoke Opc:OptCallingConv Re:RetAttrs
                                       Ty:Type Va:ValueRef (Pa:ParamList) Fu:FuncAttrs
                                       to label La1:ValueRef unwind label La2:ValueRef 
                                  Meta:InstructionMetadatas, K:K, S:Set)
         => checkSingleAssignmentInBlock(N, .K, K ~> assign(name("%"+String Int2String(I)),
                   instruction(invoke(operand(Ty,Va),formElemList(Pa),La1,La2),
                 modifiers(val(Opc),formElemList(doubleList(Re,Fu))),insMetas(formElemList(Meta)))), S)
         ...</k>
        <currModule> ModName:SymbolicValueRef </currModule>
        <funModuleName> ModName </funModuleName>
        <currFunction> FunName:SymbolicValueRef </currFunction>
        <functionName> FunName </functionName>
        <localFunVarCounter> I:Int => I +Int 1 </localFunVarCounter>

    rule checkSingleAssignmentInBlock(N:SymbolicValueRef,Var:LocalVar
                                       = invoke Opc:OptCallingConv Re:RetAttrs
                                       Ty:Type Va:ValueRef (Pa:ParamList) Fu:FuncAttrs
                                       to La1:LabelValue unwind La2:LabelValue 
                                  Meta:InstructionMetadatas, K:K, S:Set)
         => checkSingleAssignmentInBlock(N, .K, K ~> assign(name(#tokenToString(Var)),
                   instruction(invoke(operand(Ty,Va),formElemList(Pa),La1,La2),
                 modifiers(val(Opc),formElemList(doubleList(Re,Fu))),insMetas(formElemList(Meta)))), SetItem(Var) S)
          when notBool (Var in S)

    rule <k> checkSingleAssignmentInBlock(N:SymbolicValueRef,Var:LocalVar
                                       = invoke Opc:OptCallingConv Re:RetAttrs
                                       Ty:Type Va:ValueRef (Pa:ParamList) Fu:FuncAttrs
                                       to La1:LabelValue unwind La2:LabelValue 
                                  Meta:InstructionMetadatas, K:K, S:Set) ~> K':K
         => .K
         </k>
         <output>... .List => ListItem(" multiple definition of local value named '"
                   +String substrString(#tokenToString(Var),1
               ,lengthString(#tokenToString(Var))) +String "'") </output>
          when Var in S

    rule <k>checkSingleAssignmentInBlock(N:SymbolicValueRef,Var:LocalValID
                                       = invoke Opc:OptCallingConv Re:RetAttrs
                                       Ty:Type Va:ValueRef (Pa:ParamList) Fu:FuncAttrs
                                       to La1:LabelValue unwind La2:LabelValue 
                                  Meta:InstructionMetadatas, K:K, S:Set)
         => checkSingleAssignmentInBlock(N, .K, K ~> assign(name(#tokenToString(Var)),
                   instruction(invoke(operand(Ty,Va),formElemList(Pa),La1,La2),
                 modifiers(val(Opc),formElemList(doubleList(Re,Fu))),insMetas(formElemList(Meta)))), S)
         ...</k>
         <currModule> ModName:SymbolicValueRef </currModule>
         <funModuleName> ModName </funModuleName>
         <currFunction> FunName:SymbolicValueRef </currFunction>
         <functionName> FunName </functionName>
         <localFunVarCounter> I:Int => I +Int 1 </localFunVarCounter>
          when String2Int(substrString(#tokenToString(Var),1
               ,lengthString(#tokenToString(Var)))) ==Int I

    rule <k>checkSingleAssignmentInBlock(N:SymbolicValueRef,Var:LocalValID
                                       = invoke Opc:OptCallingConv Re:RetAttrs
                                       Ty:Type Va:ValueRef (Pa:ParamList) Fu:FuncAttrs
                                       to La1:LabelValue unwind La2:LabelValue 
                                  Meta:InstructionMetadatas, K:K, S:Set) ~> K':K
         => .K </k>
         <currModule> ModName:SymbolicValueRef </currModule>
         <funModuleName> ModName </funModuleName>
         <currFunction> FunName:SymbolicValueRef </currFunction>
         <functionName> FunName </functionName>
         <localFunVarCounter> I:Int </localFunVarCounter>
         <output>... .List => ListItem("error: variable expected to be numbered " +String Int2String(I)) </output>
          when String2Int(substrString(#tokenToString(Var),1
               ,lengthString(#tokenToString(Var)))) =/=Int I

    rule <k>checkSingleAssignmentInBlock(N:SymbolicValueRef, In:InstVal Ins:InstructionList
                               BB:BBTerminatorInstruction, K:K, S:Set)
         => checkSingleAssignmentInBlock(N, Ins BB, K
                      ~> assign(name("%" +String Int2String(I)),instValToKItem(In)), S)
         ...</k>
         <currModule> ModName:SymbolicValueRef </currModule>
         <funModuleName> ModName </funModuleName>
         <currFunction> FunName:SymbolicValueRef </currFunction>
         <functionName> FunName </functionName>
         <localFunVarCounter> I:Int => I +Int 1 </localFunVarCounter>

    rule <k>checkSingleAssignmentInBlock(N:SymbolicValueRef, Var:LocalVar = In:InstVal
               Ins:InstructionList BB:BBTerminatorInstruction, K:K, S:Set)
         => checkSingleAssignmentInBlock(N, Ins BB, K
                      ~> assign(name(#tokenToString(Var)),instValToKItem(In)), SetItem(Var) S)
         ...</k>
         when notBool (Var in S)

    rule <k> checkSingleAssignmentInBlock(N:SymbolicValueRef, Var:LocalVar = In:InstVal
               Ins:InstructionList BB:BBTerminatorInstruction, K:K, S:Set) ~> K':K
         => .K </k>
         <output>... .List => ListItem(" multiple definition of local value named '"
                   +String substrString(#tokenToString(Var),1
               ,lengthString(#tokenToString(Var))) +String "'") </output>
         when (Var in S)

    rule <k>checkSingleAssignmentInBlock(N:SymbolicValueRef, Var:LocalValID = In:InstVal
               Ins:InstructionList BB:BBTerminatorInstruction, K:K, S:Set)
         => checkSingleAssignmentInBlock(N, Ins BB, K
                      ~> assign(name(#tokenToString(Var)),instValToKItem(In)), SetItem(Var) S)
         ...</k>
         <currModule> ModName:SymbolicValueRef </currModule>
         <funModuleName> ModName </funModuleName>
         <currFunction> FunName:SymbolicValueRef </currFunction>
         <functionName> FunName </functionName>
         <localFunVarCounter> I:Int => I +Int 1 </localFunVarCounter>
         when notBool (Var in S) andBool String2Int(substrString(#tokenToString(Var),1
               ,lengthString(#tokenToString(Var)))) ==Int I

    rule <k>checkSingleAssignmentInBlock(N:SymbolicValueRef, Var:LocalValID = In:InstVal
               Ins:InstructionList BB:BBTerminatorInstruction, K:K, S:Set) ~> K':K
         => .K </k>
         <currModule> ModName:SymbolicValueRef </currModule>
         <funModuleName> ModName </funModuleName>
         <currFunction> FunName:SymbolicValueRef </currFunction>
         <functionName> FunName </functionName>
         <localFunVarCounter> I:Int </localFunVarCounter>
         <output>... .List => ListItem("error: variable expected to be numbered "
                                         +String Int2String(I)) </output>
          when String2Int(substrString(#tokenToString(Var),1
               ,lengthString(#tokenToString(Var)))) =/=Int I

    rule checkSingleAssignment(.K, K:K, S:Set) => K
    rule checkSingleAssignment(L:LabelStringConstant Ins:InstructionList
                                BB:BBTerminatorInstruction BBL:BasicBlockList, K:K, S:Set)
         => checkSingleAssignmentInBlock(makeVarFromLabel(L),Ins BB, .K, S)
           ~> checkSingleAssignment(BBL, K, S:Set)
    rule checkSingleAssignment(L:LabelStringConstant Ins:InstructionList
                                BB:BBTerminatorInstruction, K:K, S:Set)
         => checkSingleAssignmentInBlock(makeVarFromLabel(L),Ins BB, .K, S) ~>
            checkSingleAssignment(.K, K, S)

    rule <k>checkSingleAssignment(Ins:InstructionList
                                BB:BBTerminatorInstruction BBL:BasicBlockList, K:K, S:Set)
         => checkSingleAssignmentInBlock(name("%" +String Int2String(I)), Ins BB, .K, S)
           ~> checkSingleAssignment(BBL, K, S)
         ...</k>
        <currModule> ModName:SymbolicValueRef </currModule>
        <funModuleName> ModName </funModuleName>
        <currFunction> FunName:SymbolicValueRef </currFunction>
        <functionName> FunName </functionName>
        <localFunVarCounter> I:Int => I +Int 1 </localFunVarCounter>

    rule <k> checkSingleAssignment(Ins:InstructionList
                                BB:BBTerminatorInstruction, K:K, S:Set)
         => checkSingleAssignmentInBlock(name("%" +String Int2String(I)), Ins BB, .K, S)
           ~> checkSingleAssignment(.K , K, S)
         ...</k>
        <currModule> ModName:SymbolicValueRef </currModule>
        <funModuleName> ModName </funModuleName>
        <currFunction> FunName:SymbolicValueRef </currFunction>
        <functionName> FunName </functionName>
        <localFunVarCounter> I:Int => I +Int 1 </localFunVarCounter>

endmodule

module LLVM-DECLARATIONS
    imports LLVM-SYNTAX
    imports LLVM-ABSTRACTSYNTAX
    imports LLVM-SETTINGS
    imports LLVM-HELPERS
    imports LLVM-CONFIGURATION
    imports LLVM-STANDARD-LIBRARY-SYNTAX
    imports LLVM-SYSCALLS-SYNTAX
    imports LLVM-PREPROCESSING
    imports LLVM-NORMALIZING

    // TODO: semantic design pattern: assignment rule
    rule
        <k> alias(Mod:K, X:SymbolicValueRef, K:K) => . ...</k>
        <globalRegisters> Map:Map => Map[X <- K] </globalRegisters>

    // TODO KListToK module sections
    // TODO: semantic design pattern: multi-arity (want multiple pieces of data at the same time like key/value pairs) vs. variadic (when you don't need to do things at the same time)
    rule
        <k> theModule(Label:SymbolicValueRef, TargetLayout:K, TargetTriple:K, MetaVars:K
            , Typedefs:K, GlobalVars:K, Aliases:K, Functions:K)
            => MetaVars
            ~> Typedefs
            ~> GlobalVars
            ~> Aliases
            ~> Functions
        ...</k>
        <currModule> _ => Label </currModule>
        <modules>...
            <module>...
                <moduleName> Label </moduleName>
                <targetLayout> _ => TargetLayout </targetLayout>
                <targetTriple> _ => TargetTriple </targetTriple>
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
        <k> functionDef(Attributes:K,RetType:KResult, Label:SymbolicValueRef, Arguments:K, F:K)
            => checkSingleAssignment(F, .K, .Set) ...</k>
        <currFunction> _ => Label </currFunction>
        <globalRegisters> M:Map => M[Label <- funptr(Label)] </globalRegisters>
        <currModule> ModName:SymbolicValueRef </currModule>
        (.Bag =>
            <function>...
                <funModuleName> ModName </funModuleName>
                <returnType> RetType </returnType>
                <formalParameters> Arguments:K </formalParameters>
                <functionName> Label </functionName>
            ...</function>
        )

    rule
        <k> functionDecl(Attributes:K,RetType:KResult, Label:SymbolicValueRef, Arguments:K)
            => .K ...</k>
        <globalRegisters> M:Map => M[Label <- funptr(Label)] </globalRegisters>
        <currModule> ModName:SymbolicValueRef </currModule>
        (.Bag =>
            <function>...
                <funModuleName> ModName </funModuleName>
                <returnType> RetType </returnType>
                <formalParameters> Arguments:K </formalParameters>
                <functionName> Label </functionName>
            ...</function>
        )

    rule BB:BasicBlock BBL:BasicBlockList => BB ~> BBL
/*
    rule <k> funBegin ~> Ins:InstructionList Tem:BBTerminatorInstruction
                           BBL:BasicBlockList
             => BBL ...</k>
        <currFunction> FunName:SymbolicValueRef </currFunction>
        <functionName> FunName':SymbolicValueRef </functionName>
         <localFunVarCounter> I:Int => I +Int 1 </localFunVarCounter>
        <initialBasicBlock> .K => name(Int2String(I)) </initialBasicBlock>
        <basicBlocks> M:Map => M[name(Int2String(I))
                <- (setBlock(name(Int2String(I)))
             ~> instructionListToK(Ins) ~> Tem)] </basicBlocks>
        when FunName ==K FunName'
*/
    rule <k> funBegin
             => .K ...</k>
         <localFunVarCounter> I:Int => I +Int 1 </localFunVarCounter>
        //<currFunction> FunName:SymbolicValueRef </currFunction>
        /*<modules>...
            <module>...
               <functions>...
                  <function>...
        //<functionName> FunName':SymbolicValueRef </functionName>
         <localFunVarCounter> I:Int => I +Int 1 </localFunVarCounter>
               ...</function>
           ...</functions>
            ...</module>
        ...</modules>
       */
        //<initialBasicBlock> .K => name(Int2String(I)) </initialBasicBlock>
        /*<basicBlocks> M:Map => M[name(Int2String(I))
                <- (setBlock(name(Int2String(I)))
             ~> instructionListToK(Ins) ~> Tem)] </basicBlocks>*/
        //when FunName ==K FunName'
/*
    rule <k> funBegin ~> L:LabelStringConstant Ins:InstructionList
                         Tem:BBTerminatorInstruction BBL:BasicBlockList
             => BBL ...</k>
        <currFunction> FunName:SymbolicValueRef </currFunction>
        <functionName> FunName':SymbolicValueRef </functionName>
        <initialBasicBlock> .K => makeVarFromLabel(L) </initialBasicBlock>
        <basicBlocks> M:Map => M[makeVarFromLabel(L)
                <- (setBlock(makeVarFromLabel(L))
             ~> instructionListToK(Ins) ~> Tem)] </basicBlocks>
        when FunName ==K FunName'

    rule <k> funBegin ~> L:LabelStringConstant Ins:InstructionList
                         Tem:BBTerminatorInstruction
             => .K ...</k>
        <currFunction> FunName:SymbolicValueRef </currFunction>
        <functionName> FunName':SymbolicValueRef </functionName>
        <initialBasicBlock> .K => makeVarFromLabel(L) </initialBasicBlock>
        <basicBlocks> M:Map => M[makeVarFromLabel(L)
                <- (setBlock(makeVarFromLabel(L))
             ~> instructionListToK(Ins) ~> Tem)] </basicBlocks>
        when FunName ==K FunName'
*/
    rule
        <k> Label:LabelStringConstant Ins:InstructionList
            Tem:BBTerminatorInstruction => .K ...</k>
        <currModule> ModName:SymbolicValueRef </currModule>
        <funModuleName> ModName </funModuleName>
        <currFunction> FunName:SymbolicValueRef </currFunction>
        <functionName> FunName:SymbolicValueRef </functionName>
        <basicBlocks> M:Map => M[makeVarFromLabel(Label)
                <- (setBlock(makeVarFromLabel(Label))
             ~> instructionListToK(Ins) ~> Tem)] </basicBlocks>

    rule
        <k> setBlock(Label:SymbolicValueRef) => .K ...</k>
        <currBlock> Label':SymbolicValueRef => Label </currBlock>
        <prevBlock> _ => Label' </prevBlock>

endmodule

module LLVM-CALL-RET
    imports LLVM-SYNTAX
    imports LLVM-ABSTRACTSYNTAX
    imports LLVM-SETTINGS
    imports LLVM-HELPERS
    imports LLVM-CONFIGURATION
    imports LLVM-STANDARD-LIBRARY-SYNTAX
    imports LLVM-SYSCALLS-SYNTAX

    syntax KItem ::= frame(K, Bag)
    syntax KItem ::= bind(List, List)

    rule <k> arguments(L:ElemList) => elemListToK(L) ...</k>

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
        <k> call(_, calleeValue(funptr(FunName:SymbolicValueRef), listK(Args:List))) ~> Tail:K
            => contextSwitch(FunName, Tail)
            ~> bind(Args, elemListToList(Formals))
            ~> Body
        </k>
        <currModule> ModName:SymbolicValueRef </currModule>
        <funModuleName> ModName </funModuleName>
        <functionName> FunName </functionName>
        <formalParameters> arguments(Formals:ElemList) </formalParameters>
        <initialBasicBlock> IBBName:SymbolicValueRef </initialBasicBlock>
        <basicBlocks>... IBBName |-> Body:K ...</basicBlocks>
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
        <k> bind((ListItem(Arg:K) Args:List), (ListItem(arg(_, _, Formal:K)) Formals:List))
            => assign(Formal, Arg)
            ~> bind(Args, Formals)
        ...</k>
    rule
        <k> bind(.List, .List) => .K ...</k>

    rule
        <k> bind((ListItem(Arg:K) L:List
                  => L), ListItem(vararg)) ...</k>
        <valist>... .List => ListItem(Arg) </valist>

    rule
        <k> bind(.List, ListItem(vararg)) => .K ...</k>

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

module LLVM-VARIADICS
    imports LLVM-SYNTAX
    imports LLVM-ABSTRACTSYNTAX
    imports LLVM-SETTINGS
    imports LLVM-HELPERS
    imports LLVM-CONFIGURATION
    imports LLVM-STANDARD-LIBRARY-SYNTAX
    imports LLVM-SYSCALLS-SYNTAX

    syntax KItem ::= valist(List, K)
    syntax KItem ::= vaArg(K, K, K) [strict]

    rule
        <k> theVAArg(Type:KResult, Loc:Loc) => vaArg(Type, Loc, read(i(numBitsPerByte), Loc)) ...</k>

    rule
        <k> vaArg(Type, Loc:Loc, wvalist((ListItem(K:K) VAList:List), _))
            => write(i(numBitsPerByte), wvalist(VAList, Loc), Loc)
            ~> K
        ...</k>

    // TODO a really sketchy rule:
    rule
        0 |Int wvalist(VAList:List, Loc:Loc)
            => wvalist(VAList:List, Loc:Loc)
        [anywhere]


endmodule

module LLVM-ARITHMETIC
    imports LLVM-SYNTAX
    imports LLVM-ABSTRACTSYNTAX
    imports LLVM-SETTINGS
    imports LLVM-HELPERS
    imports LLVM-CONFIGURATION
    imports LLVM-STANDARD-LIBRARY-SYNTAX
    imports LLVM-SYSCALLS-SYNTAX

    rule [add]:
        <k> theAdd(Type:KResult, I1:Int, I2:Int)
            => signed(Type, I1 +Int I2)
        ...</k>
    rule
        <k> theSub(Type:KResult, I1:Int, I2:Int)
            => signed(Type, I1 -Int I2)
        ...</k>
    rule
        <k> theMul(Type:KResult, I1:Int, I2:Int)
            => signed(Type, I1 *Int I2)
        ...</k>
    rule
        <k> theSDiv(Type:KResult, I1:Int, I2:Int)
            => signed(Type, (signed(Type, I1) /Int signed(Type, I2)))
        ...</k>
        when signed(Type, I2) =/=Int 0 // catch undefined
    rule
        <k> theUDiv(Type:KResult, I1:Int, I2:Int)
            => signed(Type, (unsigned(Type, I1) /Int unsigned(Type, I2)))
        ...</k>
        when unsigned(Type, I2) =/=Int 0 // catch undefined
    rule
        <k> theSRem(Type:KResult, I1:Int, I2:Int)
            => signed(Type, (signed(Type, I1) %Int signed(Type, I2)))
        ...</k>
        when signed(Type, I2) =/=Int 0 // catch undefined
    rule
        <k> theURem(Type:KResult, I1:Int, I2:Int)
            => signed(Type, (unsigned(Type, I1) %Int unsigned(Type, I2)))
        ...</k>
        when unsigned(Type, I2) =/=Int 0 // catch undefined

    rule
        <k> theShl(Type:KResult, I:Int, Len:Int)
            => signed(Type, I <<Int Len)
        ...</k>
        when Len >=Int 0
    rule
        <k> theLShr(Type:KResult, I:Int, Len:Int)
            => signed(Type, unsigned(Type, I) >>Int Len)
        ...</k>
        when Len >=Int 0
    rule
        <k> theAShr(Type:KResult, I:Int, Len:Int)
            => signed(Type, signed(Type, I:Int) >>Int Len)
        ...</k>
        when Len >=Int 0
    rule
        <k> theOr(Type:KResult, I1:Int, I2:Int)
            => signed(Type, I1 |Int I2)
        ...</k>
    rule
        <k> theAnd(Type:KResult, I1:Int, I2:Int)
            => signed(Type, I1 &Int I2)
        ...</k>
    rule
        <k> theXor(Type:KResult, I1:Int, I2:Int)
            => signed(Type, I1 xorInt I2)
        ...</k>


    // weave into add
        // checkNSW(unsign(I1) +Int unsign(I2), Type)
        // ~> checkNUW(sign(I1) +Int sign(I2), Type)
    // before RHS

endmodule

module LLVM-FLOATING-POINT-ARITHMETIC
    imports LLVM-SYNTAX
    imports LLVM-ABSTRACTSYNTAX
    imports LLVM-SETTINGS
    imports LLVM-HELPERS
    imports LLVM-CONFIGURATION
    imports LLVM-STANDARD-LIBRARY-SYNTAX
    imports LLVM-SYSCALLS-SYNTAX

    rule
        <k> theFAdd(Type:KResult, F1:Float, F2:Float)
            => F1 +Float F2
        ...</k>

    rule
        <k> theFSub(Type:KResult, F1:Float, F2:Float)
            => F1 -Float F2
        ...</k>

    rule
        <k> theFMul(Type:KResult, F1:Float, F2:Float)
            => F1 *Float F2
        ...</k>

    // TODO incorrect since NaN * 0 = NaN
    rule theFMul(_, F:#Float, PositiveZero) => 0.0

endmodule

module LLVM-GEP
    imports LLVM-SYNTAX
    imports LLVM-ABSTRACTSYNTAX
    imports LLVM-SETTINGS
    imports LLVM-HELPERS
    imports LLVM-CONFIGURATION
    imports LLVM-STANDARD-LIBRARY-SYNTAX
    imports LLVM-SYSCALLS-SYNTAX

    syntax KItem ::= "gep"

    // TODO gep indices are supposed to be treated as signed (and can definitely use -1)
    rule
        <k> getElementPtr(Type:KResult, PtrVal:Loc, Indices:ElemList)
            => Type ~> gep
        ...</k>
        (. =>
            <gepInfo>...
                // <gepType> Type </gepType>
                <gepResult> PtrVal </gepResult>
                <gepIndices> elemListToK(Indices) </gepIndices>
            ...</gepInfo>
        )

    rule
        <k> _:KResult ~> gep => Loc ...</k>
        (
            <gepInfo>...
                <gepIndices> .K </gepIndices>
                <gepResult> Loc:Loc </gepResult>
            ...</gepInfo>
            => .
        )

    // rule <gepType> Type:KResult => Type </gepType>

    // TODO this is pretty ugly
    // these rules make sure the body of a pointer type is a result
    syntax KItem ::= "typing"
    syntax KItem ::= evalPointerType(K, K) [strict(1)]
    
    rule pointerType(T:K, A:K) ~> gep => evalPointerType(T, A) ~> gep
         when notBool 'isKResult(T)

    rule evalPointerType(T:KResult, A:K) => pointerType(T, A)

    rule
        <k> pointerType(Type:KResult, _:K) => Type ...</k>
        <gepIndices> I:Int => . ...</gepIndices>
        <gepResult> PtrVal:Loc => PtrVal + (sizeof(Type) *Int I) </gepResult>

    rule
        <k> arrayTypeValue(Type:KResult, _) => Type ...</k>
        <gepIndices> N:Int => . ...</gepIndices>
        <gepResult> PtrVal:Loc => PtrVal + (sizeof(Type) *Int N) </gepResult>
        when N >=Int 0

    // WARNING TODO: _ may match more than one result (ask Traian)
    rule
        <k> structTypeValue(listK(ListItem(Type:KResult) L:List => L)) ...</k>
        <gepIndices> N:Int => N -Int 1 ...</gepIndices>
        <gepResult> PtrVal:Loc => PtrVal + sizeof(Type) </gepResult>
        when N >Int 0

    rule
        <k> structTypeValue(listK(ListItem(Type:KResult) L:List)) => Type ...</k>
        <gepIndices> 0 => . ...</gepIndices>

endmodule

module LLVM-HELPERS-SPLIT-BYTES
    imports LLVM-SYNTAX
    imports LLVM-ABSTRACTSYNTAX
    imports LLVM-SETTINGS
    imports LLVM-HELPERS
    imports LLVM-CONFIGURATION
    imports LLVM-STANDARD-LIBRARY-SYNTAX
    imports LLVM-SYSCALLS-SYNTAX

    syntax KItem ::= splitIntegerBytes(K, K, K) // value, numBytes, type
    syntax KItem ::= "splitIntegerBytes'" "(" K "," K "," List ")" // value, numbytes, accumulator
    syntax KItem ::= splitFloatBytes(K, K, K, List) // value, type, numBytes, accumulator
    syntax KItem ::= splitPointerBytes(K, K) // value, numBytes
    syntax KItem ::= "splitPointerBytes'" "(" K "," K "," K "," List ")" // value, numbytes, whichByte, accumulator
    syntax KItem ::= splitArrayBytes(K, K, K) [strict(3)] // value, numBytes, innertype
    syntax KItem ::= splitStructBytes(K, List) // value, field types
    syntax KItem ::= "splitStructBytes'" "(" K "," List "," List ")" // value, field types, accumulator


    // Type(IntegerType(32))
    // should generate list with LSBytes first
    rule
        <k> splitBytes(V:KResult, Type:KResult)
            => splitIntegerBytes(V, sizeof(Type), Type)
        ...</k>
        when isIntegerType(Type)

    rule
        <k> splitBytes(V:KResult, Type:KResult)
            => splitFloatBytes(V, Type, sizeof(Type), .List)
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
        <k> splitBytes(V:KResult, structTypeValue(listK(L:List)))
            => splitStructBytes(V, L)
        ...</k>

    rule
        <k> splitIntegerBytes(I:Int, NumBytes:Int, Type:KResult)
            => splitIntegerBytes'(unsigned(Type, I), NumBytes, .List)
        ...</k>
        when I:Int >=Int 0 orBool I:Int <=Int 0 // trying to avoid this case unless real int
    // TODO can possibly rewrite zeroinitializer to 0 here, and only have one case
    rule
        <k> splitIntegerBytes(zeroinitializer, NumBytes:Int, _)
            => splitIntegerBytes'(zeroinitializer, NumBytes, .List)
        ...</k>
    rule
        <k> splitIntegerBytes'(I:Int, NumBytes:Int, L:List)
            => splitIntegerBytes'(
                I >>Int numBitsPerByte,
                NumBytes -Int 1,
                (L ListItem(I &Int ((2 ^Int numBitsPerByte) -Int 1)))
            )
        ...</k>
        when NumBytes >Int 0

    rule
        <k> splitIntegerBytes'(zeroinitializer, NumBytes:Int, L:List)
            => splitIntegerBytes'(zeroinitializer, NumBytes -Int 1, (L ListItem(0)))
        ...</k>
        when NumBytes >Int 0
    // TODO: ideally, the parser should canonicalize integer literals to positive
    // TODO BUG no idea why i have to use "MyK" here instead of "K"....
    rule
        <k> splitIntegerBytes'(MyK:K, 0, L:List)
            => listK(L)
        ...</k>
        when MyK ==K 0
        orBool MyK ==K zeroinitializer

    rule
        <k> splitIntegerBytes(wvalist(VAList:List, Loc:Loc), 1, _)
            => listK(ListItem(wvalist(VAList:List, Loc:Loc)))
        ...</k>

    rule
        <k> splitFloatBytes(V:KResult, Type:KResult, 0, L:List)
            => listK(L)
        ...</k>

    // TODO perhaps a pattern: even more localized rewriting: rewriting inside a constructor rather than rewriting the whole thing
    rule
        <k> splitFloatBytes(
                V:KResult,
                Type:KResult,
                NumBytes:Int => NumBytes -Int 1,
                L:List => ListItem(floatByte(V, Type, NumBytes -Int 1)) L
            )
        ...</k>
        when NumBytes >Int 0

    rule
        <k> splitPointerBytes((zeroinitializer => 'nullOfConstValueRef(.KList)), _) ...</k>
    rule
        <k> splitPointerBytes(Loc:Loc, NumBytes:Int)
            => splitPointerBytes'(Loc:Loc, NumBytes, 0, .List)
        ...</k>
    rule
        <k> splitPointerBytes'(Loc:Loc, NumBytes:Int, N:Int, L:List)
            => splitPointerBytes'(Loc:Loc, NumBytes -Int 1, N:Int +Int 1, (L ListItem(ptrByte(Loc:Loc, N))))
        ...</k>
        when NumBytes >Int 0
    rule
        <k> splitPointerBytes'(Loc:Loc, 0, _, L:List)
            => listK(L)
        ...</k>

    rule
        <k> splitArrayBytes(arrayValue(L:List), NumBytes:Int, _)
            => listK(L)
        ...</k>
        when size(L) ==Int NumBytes

    rule
        <k> (.K => splitBytes(zeroinitializer, Type)) ~> splitArrayBytes(zeroinitializer, _, Type:KResult) ...</k>

    rule
        <k> listK(L:List) ~> splitArrayBytes(zeroinitializer, NumBytes:Int, Type:KResult)
            => listK((NumBytes /Int sizeof(Type)) copiesOf L:List)
        ...</k>
        when sizeof(Type) divInt NumBytes

    // TODO assumes no padding
    // TODO need to heat types
    // TODO BUG L'' causes latex to fail (generates L ' ')
    rule
        <k> splitStructBytes(V:KResult, L:List)
            => splitStructBytes'(V:KResult, L:List, .List)
        ...</k>
    rule
        <k> splitStructBytes'(constantStruct(K:K, listK(ListItem(V:KResult) Fields:List)),
                      (ListItem(Type:KResult) L:List), L':List)
            => splitBytes(V, Type)
            ~> splitStructBytes'(constantStruct(K:K, listK(Fields)), L:List, L':List)
        ...</k>
    rule
        <k> splitStructBytes'(zeroinitializer, (ListItem(Type:KResult) L:List), L':List)
            => splitBytes(zeroinitializer, Type)
            ~> splitStructBytes'(zeroinitializer, L:List, L':List)
        ...</k>
    rule
        <k> (listK(L:List) => .K) ~> splitStructBytes'(_, _, (_:List (.List => L))) ...</k>
    rule
        <k> splitStructBytes'(_, .List, L:List)
            => listK(L)
        ...</k>

endmodule

module LLVM-HELPERS-JOIN-BYTES
    imports LLVM-SYNTAX
    imports LLVM-ABSTRACTSYNTAX
    imports LLVM-SETTINGS
    imports LLVM-HELPERS
    imports LLVM-CONFIGURATION
    imports LLVM-STANDARD-LIBRARY-SYNTAX
    imports LLVM-SYSCALLS-SYNTAX

    syntax KItem ::= joinIntBytes(K, K, K, K)
    syntax KItem ::= joinFloatBytes(K, K, K)
    syntax KItem ::= joinPointerBytes(K, K, K)

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
        <k> joinIntBytes(listK(L:List ListItem(N:Int)), Len:Int, N':Int, Type:KResult)
            => joinIntBytes(listK(L:List), Len:Int -Int 1,
                           (N':Int <<Int numBitsPerByte) |Int N:Int, Type:KResult)
        ...</k>
        when Len >Int 0 andBool N' >=Int 0 andBool N >=Int 0

    rule joinIntBytes(listK(.List), 0, N:Int, Type:KResult)
        => signed(Type, N:Int)
        when N >=Int 0
        [anywhere]

    rule joinIntBytes(listK(.List), 0, wvalist(VAList:List, Loc:Loc), Type:KResult)
        => wvalist(VAList:List, Loc:Loc)
        [anywhere]

    // TODO BAD
    rule
        <k> joinFloatBytes(listK(ListItem(floatByte(F:Float, _, _)) _), _, _)
            => F
        ...</k>

    rule
        <k> joinPointerBytes(listK((L:List ListItem(ptrByte(Loc:Loc, N:Int)))), Len:Int, N':Int)
            => joinPointerBytes(listK(L:List), Len:Int -Int 1, 
                          (N':Int <<Int numBitsPerByte) |Int ptrByte(Loc:Loc, N:Int))
        ...</k>
        when Len >Int 0 andBool N >=Int 0 andBool N' >=Int 0

    rule joinPointerBytes(listK(.List), 0, Loc:Loc)
        => Loc:Loc
        [anywhere]

    // crazy stuff to reassemble pointer
    syntax Int ::= ptrBytes(K, K, K)
    //rule 'isInt(ptrBytes(_, _, _)) => true
    
    rule
        0 |Int ptrByte(V:KResult, N:Int)
            => ptrByte(V:KResult, N:Int)
        [anywhere]
    rule
        (ptrByte(V:KResult, SNatN:Int) <<Int Len:Int) |Int ptrByte(V:KResult, N:Int)
            => ptrBytes(V:KResult, N:Int, SNatN:Int)
        when Len ==Int numBitsPerByte
        andBool SNatN ==Int N +Int 1
        andBool N >=Int 0
        [anywhere]
    rule
        (ptrBytes(V:KResult, SNatN:Int, N':Int) <<Int Len:Int) |Int ptrByte(V:KResult, N:Int)
            => ptrBytes(V:KResult, N:Int, N':Int)
        when SNatN ==Int N +Int 1 andBool N' >=Int 0
             andBool N >=Int 0 andBool Len >=Int 0 
        [anywhere]
    rule
        ptrBytes(V:KResult, 0, N:Int)
            => V
        when N ==Int numBytesPerPointer -Int 1
        [anywhere]

endmodule

module LLVM-MEMORY
    imports LLVM-SYNTAX
    imports LLVM-ABSTRACTSYNTAX
    imports LLVM-SETTINGS
    imports LLVM-HELPERS
    imports LLVM-CONFIGURATION
    imports LLVM-STANDARD-LIBRARY-SYNTAX
    imports LLVM-SYSCALLS-SYNTAX

    syntax KItem ::= "nextSym" Loc [function]
    rule nextSym loc(N:Int, 0) => loc(N:Int +Int 1, 0)

    rule
        <k> alloca(Type:KResult, N:Int) => Loc ...</k>
        (. =>
            <object>...
                <basePtr> base(Loc) </basePtr>
                <type> Type </type>
                <size> sizeof(Type) *Int N </size>
            ...</object>
        )
        <localMemory>... .List => ListItem(base(Loc)) </localMemory>
        <nextLoc> Loc:Loc => nextSym Loc </nextLoc>

    rule
        <k> store(Type:KResult, V:KResult, Loc:Loc)
            => write(Type:KResult, V:KResult, Loc:Loc)
        ...</k>

    syntax KItem ::= writeBytes(K, K) [strict(1)] // list of bytes, location

    rule
        <k> write(Type:KResult, V:KResult, Loc:Loc)
            => writeBytes(splitBytes(V, Type), Loc)
        ...</k>
    // rule
        // <k> writeBytes(listK((N:Int,, L:KList)), Base:Int +Int Offset:Int)
        // <basePtr> Base:Int </basePtr>
        // <bytes> M:Map => M:Map[unknownByte / Offset:Int] </bytes>
        // when notBool Offset in keys(M:Map)

    // TODO similar problem as sNat; want to match through a deconstructor
    rule
        <k> writeBytes(listK((ListItem(N:Int) L:List)), loc(Base:Int, Offset:Int))
            => writeBytes(listK(L:List), loc(Base:Int, Offset:Int) + 1)
        ...</k>
        <basePtr> Base:Int </basePtr>
        <bytes> M:Map => M:Map[Offset <- N] </bytes>
        // <size> Len:Int </size>
        // when Offset < Len
        // i guess

    rule
        <k> writeBytes(listK(.List), _) => . ...</k>

    rule
        <k> load(pointerType(TyK:K,A:K), Loc:Loc)
            => read(TyK:K, Loc:Loc)
        ...</k>

    rule
        <k> read(Type:KResult, Loc:Loc)
            => joinBytes(readBytes(sizeof(Type:KResult), Loc:Loc), Type:KResult)
        ...</k>

    rule
        <k> readBytes(Len:Int, Loc:Loc)
            => readBytes'(Len:Int, Loc:Loc, .List)
        ...</k>

    rule
        <k> readBytes'(Len:Int, loc(Base:Int, Offset:Int), L:List)
            => readBytes'(Len:Int -Int 1, loc(Base:Int, Offset:Int) + 1, (L:List ListItem(V:KResult)))
        ...</k>
        <basePtr> Base:Int </basePtr>
        <bytes>... Offset |-> V:KResult ...</bytes>
        when Len:Int >Int 0

    rule
        <k> readBytes'(0, _, L:List)
            => listK(L)
        ...</k>

    syntax KItem ::= readBytes(K, K)
    syntax KItem ::= "readBytes'" "(" K "," K "," List ")"

endmodule

module LLVM-COMPARISONS
    imports LLVM-SYNTAX
    imports LLVM-ABSTRACTSYNTAX
    imports LLVM-SETTINGS
    imports LLVM-HELPERS
    imports LLVM-CONFIGURATION
    imports LLVM-STANDARD-LIBRARY-SYNTAX
    imports LLVM-SYSCALLS-SYNTAX

    // all of these take place only at the top of K
    // TODO these break with ==Int or =/=Int
    rule iNotEq(Type:KResult, I1:Int, I2:Int)
        => boolToInt(unsigned(Type, I1) =/=K unsigned(Type, I2))
    rule iEq(Type:KResult, I1:Int, I2:Int)
        => boolToInt(unsigned(Type, I1) ==K unsigned(Type, I2))
    rule uGT(Type:KResult, I1:Int, I2:Int) => boolToInt(unsigned(Type, I1:Int) >Int unsigned(Type, I2:Int))
    rule uGE(Type:KResult, I1:Int, I2:Int) => boolToInt(unsigned(Type, I1:Int) >=Int unsigned(Type, I2:Int))
    rule uLT(Type:KResult, I1:Int, I2:Int) => boolToInt(unsigned(Type, I1:Int) <Int unsigned(Type, I2:Int))
    rule uLE(Type:KResult, I1:Int, I2:Int) => boolToInt(unsigned(Type, I1:Int) <=Int unsigned(Type, I2:Int))
    rule sGT(Type:KResult, I1:Int, I2:Int) => boolToInt(signed(Type, I1:Int) >Int signed(Type, I2:Int))
    rule sGE(Type:KResult, I1:Int, I2:Int) => boolToInt(signed(Type, I1:Int) >=Int signed(Type, I2:Int))
    rule sLT(Type:KResult, I1:Int, I2:Int) => boolToInt(signed(Type, I1:Int) <Int signed(Type, I2:Int))
    rule sLE(Type:KResult, I1:Int, I2:Int) => boolToInt(signed(Type, I1:Int) >=Int signed(Type, I2:Int))

    rule iNotEq(Type:KResult, Loc1:Loc, Loc2:Loc)
        => boolToInt(unsigned(Type, Loc1:Loc) =/=K unsigned(Type, Loc2:Loc))
    rule iEq(Type:KResult, Loc1:Loc, Loc2:Loc)
        => boolToInt(unsigned(Type, Loc1:Loc) ==K unsigned(Type, Loc2:Loc))
    rule uGT(Type:KResult, Loc1:Loc, Loc2:Loc) => boolToInt(unsigned(Type, Loc1:Loc) >Int unsigned(Type, Loc2:Loc))
    rule uGE(Type:KResult, Loc1:Loc, Loc2:Loc) => boolToInt(unsigned(Type, Loc1:Loc) >=Int unsigned(Type, Loc2:Loc))
    rule uLT(Type:KResult, Loc1:Loc, Loc2:Loc) => boolToInt(unsigned(Type, Loc1:Loc) <Int unsigned(Type, Loc2:Loc))
    rule uLE(Type:KResult, Loc1:Loc, Loc2:Loc) => boolToInt(unsigned(Type, Loc1:Loc) <=Int unsigned(Type, Loc2:Loc))
    rule sGT(Type:KResult, Loc1:Loc, Loc2:Loc) => boolToInt(signed(Type, Loc1:Loc) >Int signed(Type, Loc2:Loc))
    rule sGE(Type:KResult, Loc1:Loc, Loc2:Loc) => boolToInt(signed(Type, Loc1:Loc) >=Int signed(Type, Loc2:Loc))
    rule sLT(Type:KResult, Loc1:Loc, Loc2:Loc) => boolToInt(signed(Type, Loc1:Loc) <Int signed(Type, Loc2:Loc))
    rule sLE(Type:KResult, Loc1:Loc, Loc2:Loc) => boolToInt(signed(Type, Loc1:Loc) >=Int signed(Type, Loc2:Loc))

    // TODO not handling QNAN
    rule oEQ(Type:KResult, F1:Float, F2:Float)
        => boolToInt(F1:Float ==Float F2:Float)
    rule oGT(Type:KResult, F1:Float, F2:Float)
        => boolToInt(F1:Float >Float F2:Float)
    rule oGE(Type:KResult, F1:Float, F2:Float)
        => boolToInt(F1:Float >=Float F2:Float)
    rule oLT(Type:KResult, F1:Float, F2:Float)
        => boolToInt(F1:Float <Float F2:Float)
    rule oLE(Type:KResult, F1:Float, F2:Float)
        => boolToInt(F1:Float <=Float F2:Float)
    rule oNE(Type:KResult, F1:Float, F2:Float)
        => boolToInt(F1:Float =/=Float F2:Float)
    // rule ORD(Type:KResult, F1:Float, F2:Float)
        // => // if both are not QNAN
    rule uEQ(Type:KResult, F1:Float, F2:Float)
        => boolToInt(F1:Float ==Float F2:Float)
    rule uGT(Type:KResult, F1:Float, F2:Float)
        => boolToInt(F1:Float >Float F2:Float)
    rule uGE(Type:KResult, F1:Float, F2:Float)
        => boolToInt(F1:Float >=Float F2:Float)
    rule uLT(Type:KResult, F1:Float, F2:Float)
        => boolToInt(F1:Float <Float F2:Float)
    rule uLE(Type:KResult, F1:Float, F2:Float)
        => boolToInt(F1:Float <=Float F2:Float)
    rule uNE(Type:KResult, F1:Float, F2:Float)
        => boolToInt(F1:Float =/=Float F2:Float)
    // rule UNO(Type:KResult, F1:Float, F2:Float)
        // => if either is QNAN

    syntax KItem ::= boolToInt(K)
    rule boolToInt(true) => 1
    rule boolToInt(false) => 0

endmodule

module LLVM-CONVERSIONS
    imports LLVM-SYNTAX
    imports LLVM-ABSTRACTSYNTAX
    imports LLVM-SETTINGS
    imports LLVM-HELPERS
    imports LLVM-CONFIGURATION
    imports LLVM-STANDARD-LIBRARY-SYNTAX
    imports LLVM-SYSCALLS-SYNTAX

    // TODO only handling scalars
    rule
        <k> theTrunc(Type:KResult, I:Int, Type2:KResult) => signed(Type, I) ...</k>

    // TODO only handling scalars
    rule
        <k> theZExt(Type:KResult, I:Int, Type2:KResult) => unsigned(Type, I) ...</k>
    // TODO only handling scalars
    rule
        <k> theSExt(Type:KResult, I:Int, Type2:KResult) => I ...</k>
        when signed(Type, I) ==Int I // sanity check since this isn't supposed to change values and I is supposed to have been canonicalized

    // TODO need to normalize here
    rule
        <k> theBitCast(_, I:Int, _) => I:Int ...</k>
    rule
        <k> theBitCast(_, Loc:Loc, _) => Loc:Loc ...</k>

    //rule
        //<k> BitCast(IntegerType(_), F:#Float) => Float2Int(F) ...</k>

    // TODO need to normalize here
    rule
        <k> theIntToPtr(Type:KResult, K:K, Type2:KResult) => intToPtrOfLoc(Type, K:K) ...</k>
    rule
        <k> thePtrToInt(Type:KResult, K:K, Type2:KResult) => ptrToIntOfLoc(Type, K:K) ...</k>

    // TODO needs side conditions
    rule intToPtrOfLoc(Type:KResult, intToPtrOfLoc(Type':KResult, K:K)) => K:K [anywhere]
    rule ptrToIntOfLoc(Type:KResult, ptrToIntOfLoc(Type':KResult, K:K)) => K:K [anywhere]

    rule unsigned(Type:KResult, Loc:Loc)
        => ptrToIntOfLoc(Type, Loc:Loc)
        [anywhere]
    rule signed(Type:KResult, Loc:Loc)
        => ptrToIntOfLoc(Type, Loc:Loc)
        [anywhere]
    rule unsigned(_, ptrToIntOfLoc(Type:KResult, K:K))
        => ptrToIntOfLoc(Type, K:K)
    rule signed(_, ptrToIntOfLoc(Type:KResult, K:K))
        => ptrToIntOfLoc(Type, K:K)

    // definitely misses problems with null
    // TODO assumes types are same and are big enough
    rule ptrToIntOfLoc(_, loc(I:Int, Offset:Int)) >Int ptrToIntOfLoc(_, loc(I:Int, Offset':Int))
        => Offset >Int Offset'
        [anywhere]
    rule ptrToIntOfLoc(_, loc(I:Int, Offset:Int)) >=Int ptrToIntOfLoc(_, loc(I:Int, Offset':Int))
        => Offset >=Int Offset'
        [anywhere]
    rule ptrToIntOfLoc(_, loc(I:Int, Offset:Int)) <Int ptrToIntOfLoc(_, loc(I:Int, Offset':Int))
        => Offset <Int Offset'
        [anywhere]
    rule ptrToIntOfLoc(_, loc(I:Int, Offset:Int)) <=Int ptrToIntOfLoc(_, loc(I:Int, Offset':Int))
        => Offset <=Int Offset'
        [anywhere]
    rule ptrToIntOfLoc(Type:KResult, loc(I:Int, Offset:Int))
                  -Int ptrToIntOfLoc(Type:KResult, loc(I:Int, Offset':Int))
        => signed(Type, Offset -Int Offset')
        [anywhere]

    rule
        <k> theFpToSI(Type:KResult, F:Float, Type2:KResult)
            => signed(Type, Float2Int(F))
        ...</k>

    rule
        <k> theFpToUI(Type:KResult, F:Float, Type2:KResult)
            => unsigned(Type, Float2Int(F))
        ...</k>

endmodule

module LLVM-LITERALS
    imports LLVM-SYNTAX
    imports LLVM-ABSTRACTSYNTAX
    imports LLVM-SETTINGS
    imports LLVM-HELPERS
    imports LLVM-CONFIGURATION
    imports LLVM-STANDARD-LIBRARY-SYNTAX
    imports LLVM-SYSCALLS-SYNTAX

    rule float(S) => String2Float(S)
    //when String2Float(S) >=Float String2Float(S)
        // TODO when 'isFloat(String2Float(S))

    rule
        <k> constantString(S:String)
            => arrayValue(StringToList(S))
        ...</k>

    rule
        <k> constantArray(Type:KResult, listK(L:List))
            => createArrayValue(Type, L)
        ...</k>

    syntax KItem ::= createArrayValue(K, List)
    syntax KItem ::= "createArrayValue'" "(" K "," List "," List ")"
    syntax KItem ::= "createArrayValue''" "(" K "," List "," K "," List ")" [strict(3)]

    rule
        <k> createArrayValue(Type:KResult, L:List)
            => createArrayValue'(Type:KResult, L:List, .List)
        ...</k>
    rule
        <k> createArrayValue'(Type:KResult, (ListItem(K:K) L:List), L':List)
            => createArrayValue''(Type:KResult, L:List, splitBytes(K, Type), L':List)
        ...</k>
    rule
        <k> createArrayValue''(Type:KResult, L:List, listK(Bytes:List), L':List)
            => createArrayValue'(Type:KResult, L:List, (L' Bytes))
        ...</k>
    rule
        <k> createArrayValue'(_, .List, L:List)
            => arrayValue(L)
        ...</k>

endmodule

module LLVM-STANDARD-LIBRARY-PREPROCESS
    imports LLVM-SYNTAX
    imports LLVM-ABSTRACTSYNTAX
    imports LLVM-SETTINGS
    imports LLVM-HELPERS
    imports LLVM-CONFIGURATION
    imports LLVM-STANDARD-LIBRARY-SYNTAX
    imports LLVM-SYSCALLS-SYNTAX

    /////////////////////////////////////////////////////////
    // turning calls to intrinsics into semantic productions
    // perhaps this kind of stuff could be generalized, or done away with
    // its purpose is to make the actual function definitions nice

    rule
        // TODO why doesn't this work?
        // <k> Call(_, Callee(funptr(Name(S:String)), listK(L:KList)))
            // => 'memcpy`(_`,_`,_`,_`,_`)(L)
        <k> call(_, calleeValue(funptr(name(S:String)), listK(ListItem(V1:KResult)
                   ListItem(V2:KResult) ListItem(V3:KResult) ListItem(V4:KResult) ListItem(V5:KResult))))
            => memcpy(V1, V2, V3, V4, V5)
        ...</k>
        when substrString(S, 0, 13) ==String "@llvm.memcpy."

    rule
        <k> call(_, calleeValue(funptr(name(S:String)), listK(ListItem(V1:KResult)
                  ListItem(V2:KResult) ListItem(V3:KResult) ListItem(V4:KResult) ListItem(V5:KResult))))
            => memset(V1, V2, V3, V4, V5)
        ...</k>
        when substrString(S, 0, 13) ==String "@llvm.memset."

    rule
        <k> call(_, calleeValue(funptr(name("@llvm.lifetime.start")), listK(ListItem(V1:KResult)
                   ListItem(V2:KResult))))
            => lifetimeStart(V1, V2)
        ...</k>

    rule
        <k> call(_, calleeValue(funptr(name("@llvm.lifetime.end")), listK(ListItem(V1:KResult)
                  ListItem(V2:KResult))))
            => lifetimeEnd(V1, V2)
        ...</k>

    rule
        <k> call(_, calleeValue(funptr(name("@llvm.va_start")), listK(ListItem(V1:KResult))))
            => vaStart(V1)
        ...</k>

    rule
        <k> call(_, calleeValue(funptr(name("@llvm.va_copy")), listK(ListItem(V1:KResult)
                  ListItem(V2:KResult))))
            => vaCopy(V1, V2)
        ...</k>

    rule
        <k> call(_, calleeValue(funptr(name("@llvm.va_end")), _))
            => .K
        ...</k>
endmodule

module LLVM-STANDARD-LIBRARY
    imports LLVM-SYNTAX
    imports LLVM-ABSTRACTSYNTAX
    imports LLVM-SETTINGS
    imports LLVM-HELPERS
    imports LLVM-CONFIGURATION
    imports LLVM-STANDARD-LIBRARY-SYNTAX
    imports LLVM-SYSCALLS-SYNTAX

    // memcpy
    rule
        <k> memcpy(Dest:Loc, Src:Loc, Len:Int, K1:K, K2:K)
            => store(byteType, load(pointerType(byteType,0), Src), Dest)
            ~> memcpy(Dest + 1, Src + 1, Len -Int 1, K1, K2)
        ...</k>
        when Len >Int 0
    rule
        <k> memcpy(_, _, 0, _, _) => .K ...</k>

    // memset
    rule
        <k> memset(Dest:Loc, N:Int, Len:Int, K1:K, K2:K)
            => store(byteType, N, Dest)
            ~> memset(Dest + 1, N, Len -Int 1, K1, K2)
        ...</k>
        when Len >Int 0
    rule
        <k> memset(_, _, 0, _, _) => .K ...</k>

    // lifetimeStart
    // don't need to do anything for positive semantics
    rule
        <k> lifetimeStart(_, _) => .K ...</k>

    // lifetimeEnd
    // don't need to do anything for positive semantics
    rule
        <k> lifetimeEnd(_, _) => .K ...</k>

    //@ Variadic intrinsics
    rule
        <k> vaStart(Loc:Loc) => write(i(numBitsPerByte), wvalist(VAList, Loc), Loc) ...</k>
        <valist> VAList:List </valist>

    rule
        <k> vaCopy(Loc1:Loc, Loc2:Loc)
            => write(i(numBitsPerByte), read(i(numBitsPerByte), Loc2), Loc1)
        ...</k>

endmodule

module LLVM-SYSCALLS-PREPROCESS
    imports LLVM-SYNTAX
    imports LLVM-ABSTRACTSYNTAX
    imports LLVM-SETTINGS
    imports LLVM-HELPERS
    imports LLVM-CONFIGURATION
    imports LLVM-STANDARD-LIBRARY-SYNTAX
    imports LLVM-SYSCALLS-SYNTAX

    rule
        <k> call(_, calleeValue(funptr(name("@__syscall")), listK(ListItem(N:Int) L:List)))
            => (syscallHandler(N))(L)
        ...</k>
endmodule

module LLVM-SYSCALLS
    imports LLVM-SYNTAX
    imports LLVM-ABSTRACTSYNTAX
    imports LLVM-SETTINGS
    imports LLVM-HELPERS
    imports LLVM-CONFIGURATION
    imports LLVM-STANDARD-LIBRARY-SYNTAX
    imports LLVM-SYSCALLS-SYNTAX

    rule <k> 'sys-ioctl(_) => 0 ...</k>
    rule <k> 'sys-rt-sigprocmask(_) => 0 ...</k>
    rule <k> 'sys-gettid(_) => 0 ...</k>

    //there might be a problem here. about the sort of brk cell.
    rule
        <k> 'sys-brk(ptrToIntOfLoc(_,Loc:Loc),, _) => Brk ...</k>
        <brk> Brk:Loc </brk>
        when Loc ==K 'nullOfConstValueRef(.KList)


    // TODO krun should provide this value
    rule <k> 'sys-getpid(_) => 10000 ...</k>

    syntax KItem ::= printString(K) [strict]
    syntax KItem ::= readString(K, K)
    syntax KItem ::= "readString'" "(" K "," K "," K ")"

    rule
        <k> 'sys-write(FileDesc:Int,, ptrToIntOfLoc(_, Loc:Loc),, Len:Int,, _)
            => printString(readString(Loc, Len))
        ...</k>
        when Len >=Int 0

    rule
        <k> readString(Loc:Loc, Len:Int)
            => readString'(Loc, Len, "")
        ...</k>
        when Len >=Int 0

    rule
        <k> (. => read(i(8), Loc))
            ~> readString'(Loc:Loc, I:Int, _)
        ...</k>
        when I >Int 0

    rule <k> readString'(_, 0, S:String) => S ...</k>

    rule
        <k> (I:Int => .)
            ~> readString'(
                (Loc:Loc => Loc + 1),
                (N:Int => N -Int 1),
                (S:String => S +String Int2String(unsigned(i(8), I)))
            )
        ...</k>
        when N >Int 0

    rule <k> printString(S:String) => lengthString(S) ...</k>
         <output>... .List => ListItem(S) </output>

endmodule

module LLVM-INTERNAL-TESTING-FUNCTIONS
    // do not include this module when printing
    // TODO add to makefile's grep to look for line like above when excluding modules
    imports LLVM-SYNTAX
    imports LLVM-ABSTRACTSYNTAX
    imports LLVM-SETTINGS
    imports LLVM-HELPERS
    imports LLVM-CONFIGURATION
    imports LLVM-STANDARD-LIBRARY-SYNTAX
    imports LLVM-SYSCALLS-SYNTAX

    rule
        <k> call(_, calleeValue(funptr(name(S:String)), listK(ListItem(I:Int))))
            => .K
        ...</k>
        <output>... .List => ListItem(Int2String(I) +String "\n") </output>
        when substrString(S, 0, 14) ==String "@__fsl.print.i"
        andBool (I >=Int 0 orBool I <=Int 0) // real integer
endmodule

module LLVM-EXCEPTIONS
    imports LLVM-SYNTAX
    imports LLVM-ABSTRACTSYNTAX
    imports LLVM-SETTINGS
    imports LLVM-HELPERS
    imports LLVM-CONFIGURATION
    imports LLVM-STANDARD-LIBRARY-SYNTAX
    imports LLVM-SYSCALLS-SYNTAX


/*
    rule
        <k> Call(_, calleeValue(funptr(Name("@__cxa")), listK(V1:KResult,, V2:KResult)))
            => @__cxa_allocate_exception
        ...</k>
*/
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
    imports LLVM-PREPROCESSING
    imports LLVM-NORMALIZING
    imports LLVM-CALL-RET
    imports LLVM-VARIADICS
    imports LLVM-ARITHMETIC
    imports LLVM-FLOATING-POINT-ARITHMETIC
    imports LLVM-GEP
    imports LLVM-HELPERS-SPLIT-BYTES
    imports LLVM-HELPERS-JOIN-BYTES
    imports LLVM-MEMORY
    imports LLVM-COMPARISONS
    imports LLVM-CONVERSIONS
    imports LLVM-LITERALS
    imports LLVM-STANDARD-LIBRARY-PREPROCESS
    imports LLVM-STANDARD-LIBRARY
    imports LLVM-SYSCALLS-PREPROCESS
    imports LLVM-SYSCALLS
    imports LLVM-INTERNAL-TESTING-FUNCTIONS
    imports LLVM-EXCEPTIONS
endmodule
