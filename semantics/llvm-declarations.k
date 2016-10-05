//
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
            => setInitBlock(F) ~> checkSingleAssignment(F) ...</k>
        <currFunction> _ => Label </currFunction>
         <currentProgPoint> ProgCount:Int => 0 </currentProgPoint>
        <globalRegisters> M:Map => M[Label <- funptr(Label)] </globalRegisters>
        <currModule> ModName:SymbolicValueRef </currModule>
        <instructionCounter> InstCount:Int => 0 </instructionCounter>
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

    //install the sequence point for each instruction.

    rule <k> seqPoint(I:Int, A:K) => A ...</k>
         <currentProgPoint> N:Int => I </currentProgPoint>

    //rule for setting initial basic block of a given block
    rule <k> setInitBlock(I:InstructionList B:BBTerminatorInstruction) => .K ...</k>
        <currModule> ModName:SymbolicValueRef </currModule>
        <funModuleName> ModName </funModuleName>
        <currFunction> FunName:SymbolicValueRef </currFunction>
        <functionName> FunName </functionName>
         <localFunVarCounter> N:Int </localFunVarCounter>
        <initialBasicBlock> _ => name(localVar, Int2String(N)) </initialBasicBlock>

    rule <k> setInitBlock(L:LabelStringConstant
                     I:InstructionList B:BBTerminatorInstruction) => .K ...</k>
        <currModule> ModName:SymbolicValueRef </currModule>
        <funModuleName> ModName </funModuleName>
        <currFunction> FunName:SymbolicValueRef </currFunction>
        <functionName> FunName </functionName>
        <initialBasicBlock> _ => addNameToString(L) </initialBasicBlock>

    rule <k> setInitBlock(I:InstructionList B:BBTerminatorInstruction
                            BBL:BasicBlockList) => .K ...</k>
        <currModule> ModName:SymbolicValueRef </currModule>
        <funModuleName> ModName </funModuleName>
        <currFunction> FunName:SymbolicValueRef </currFunction>
        <functionName> FunName </functionName>
         <localFunVarCounter> N:Int </localFunVarCounter>
        <initialBasicBlock> _ => name(localVar, Int2String(N)) </initialBasicBlock>

    rule <k> setInitBlock(L:LabelStringConstant I:InstructionList
                  B:BBTerminatorInstruction BBL:BasicBlockList) => .K ...</k>
        <currModule> ModName:SymbolicValueRef </currModule>
        <funModuleName> ModName </funModuleName>
        <currFunction> FunName:SymbolicValueRef </currFunction>
        <functionName> FunName </functionName>
        <initialBasicBlock> _ => addNameToString(L) </initialBasicBlock>
/*
    rule
        <k> basicBlock(Name:SymbolicValueRef, K:K) => .K ...</k>
        <currModule> ModName:SymbolicValueRef </currModule>
        <funModuleName> ModName </funModuleName>
        <currFunction> FunName:SymbolicValueRef </currFunction>
        <functionName> FunName:SymbolicValueRef </functionName>
        <basicBlocks>... .Map => Name:SymbolicValueRef |-> (setBlock(Name) ~> K:K) ...</basicBlocks>
*/
    rule
        <k> setBlock(Label:SymbolicValueRef) => .K ...</k>
        <currBlock> Label':SymbolicValueRef => Label </currBlock>
        <prevBlock> _ => Label' </prevBlock>

endmodule
