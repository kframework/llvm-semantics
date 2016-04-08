// Copyright (c) 2013-2015 K Team. All Rights Reserved.
requires "llvm-syntax.k"
requires "llvm-abstractsyntax.k"
requires "llvm-settings.k"
requires "llvm-helpers.k"
requires "llvm-standard-library-syntax.k"
requires "llvm-syscalls-syntax.k"
requires "llvm-configuration.k"
requires "llvm-preprocessing.k"
requires "llvm-normalizing.k"

module LLVM-DECLARATIONS
    imports LLVM-SYNTAX
    imports LLVM-ABSTRACTSYNTAX
    imports LLVM-SETTINGS
    imports LLVM-HELPERS
    imports LLVM-STANDARD-LIBRARY-SYNTAX
    imports LLVM-SYSCALLS-SYNTAX
    imports LLVM-CONFIGURATION
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
        <k> typedef(X:LocalName, UnresolvedType:KResult) => .K ...</k>
        //<currentModifiers> _ => List(L) </currentModifiers> TODO not printing modifiers
        <currModule> Label:SymbolicValueRef </currModule>
        <moduleName> Label:SymbolicValueRef </moduleName>
        <typedefs> M:Map => M[X <- UnresolvedType] </typedefs>

    rule [typedef-lookup]:
        <k> 'namedType(X:LocalName) => UnresolvedType ...</k>
        <typedefs>... X |-> UnresolvedType:K ...</typedefs>

    // TODO: hack because hybrids don't seem to be working
    rule fields(L:ElemList) => L
    rule types(L:ElemList) => L
    //rule funptr(A:SymbolicValueRef) => A

    rule
        <k> functionDef(Attributes:Set,RetType:KResult, Label:SymbolicValueRef, Arguments:K, F:K)
            => checkSingleAssignment(F, .K, .Set) ...</k>
        <currFunction> _ => Label </currFunction>
        <globalRegisters> M:Map => M[Label <- funptr(Label)] </globalRegisters>
        <currModule> ModName:SymbolicValueRef </currModule>
        (.Bag =>
            <function>...
                <funModuleName> ModName </funModuleName>
                <funModifiers> Attributes </funModifiers>
                <returnType> RetType </returnType>
                <formalParameters> Arguments:K </formalParameters>
                <functionName> Label </functionName>
            ...</function>
        )

    rule
        <k> functionDecl(Attributes:Set,RetType:KResult, Label:SymbolicValueRef, Arguments:K)
            => .K ...</k>
        <globalRegisters> M:Map => M[Label <- funptr(Label)] </globalRegisters>
        <currModule> ModName:SymbolicValueRef </currModule>
        (.Bag =>
            <function>...
                <funModuleName> ModName </funModuleName>
                <funModifiers> Attributes </funModifiers>
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

    rule <k> funBegin
             => .K ...</k>
         <localFunVarCounter> I:Int => I +Int 1 </localFunVarCounter>
        //<currFunction> FunName:SymbolicValueRef </currFunction>
*/
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

*/
    rule
        <k> funBegin(basicBlock(Name:SymbolicValueRef, K:K) ~> K':K)
           => basicBlock(Name, K) ~> K' ...</k>
        <currModule> ModName:SymbolicValueRef </currModule>
        <funModuleName> ModName </funModuleName>
        <currFunction> FunName:SymbolicValueRef </currFunction>
        <functionName> FunName:SymbolicValueRef </functionName>
        <initialBasicBlock> _ => Name </initialBasicBlock>

    rule
        <k> basicBlock(Name:SymbolicValueRef, K:K) => .K ...</k>
        <currModule> ModName:SymbolicValueRef </currModule>
        <funModuleName> ModName </funModuleName>
        <currFunction> FunName:SymbolicValueRef </currFunction>
        <functionName> FunName:SymbolicValueRef </functionName>
        <basicBlocks>... .Map => Name:SymbolicValueRef |-> (setBlock(Name) ~> K:K) ...</basicBlocks>

    rule
        <k> setBlock(Label:SymbolicValueRef) => .K ...</k>
        <currBlock> Label':SymbolicValueRef => Label </currBlock>
        <prevBlock> _ => Label' </prevBlock>

endmodule
