// Copyright (c) 2013-2014 K Team. All Rights Reserved.
/*@

This is the syntax of LLVM.

The LLVM code representation is designed to be used in three different forms:
 as an in-memory compiler IR, as an on-disk bitcode representation 
(suitable for fast loading by a Just-In-Time compiler), 
and as a human readable assembly language representation. 
This allows LLVM to provide a powerful intermediate representation 
for efficient compiler transformations and analysis, 
while providing a natural means to debug and visualize the transformations. 
The three different forms of LLVM are all equivalent. 
This document describes the human readable representation and notation.

This syntax requires a input LLVM program without comments.
*/
module LLVM-SYNTAX

    /*
    Define syntactic constructors for non-keyword tokens. 
    */

    syntax HexConstant ::= Token{[0][x][0-9 a-f]*}
    syntax UnsignedInt ::= Token{[1-9][0-9]*}
    syntax FpVal ::= HexConstant | Float
    syntax #String ::= Token{[\"] (~[\"])* [\"]}
    syntax LocalValID ::= Token{[\%][1-9][0-9]*}
    syntax LocalVar ::=  Token{[\%][a-z A-Z \. \_ \- \$][0-9 a-z A-Z \. \_ \- \$]*}
    syntax LocalVar ::= Token{[\%][\"] (~[\"])* [\"]}

    syntax GlobalValID ::= Token{[\@][1-9][0-9]*}
    syntax GlobalVar ::= Token{[\@][a-z A-Z \. \_ \- \$][0-9 a-z A-Z \. \_ \- \$]*}
    syntax LocalVar ::= Token{[\@][\"] (~[\"])* [\"]}

    syntax LabelStringConstant ::= Token{[1-9][0-9]*[\:]}
    syntax LabelStringConstant ::= Token{[a-z A-Z \. \_ \- \$][0-9 a-z A-Z \. \_ \- \$]*[\:]}
    syntax LabelStringConstant ::= Token{[\@][\"] (~[\"])* [\"][\:]}

    //define local and global names as well as local and global assignments
    syntax LocalName ::= LocalVar | String | LocalValID
    syntax OptLocalAssign ::= LocalName "="
    syntax GlobalName ::= GlobalVar | LocalValID
    syntax OptGlobalAssign ::= GlobalName "="

    /*@
      Symbolic value reference is including local names, 
      global variables, local valid ids and global valid ids.
     */
    syntax SymbolicValueRef ::= LocalValID | GlobalValID
                              | LocalName | GlobalVar

    /*@
      There are the primary operators.
      Define the nsw and nuw flags.
      llvm: nuw only applies to integer operations.
      llvm: nsw only applies to integer operations.
      llvm: nuw is "no unsigned wrap" and nsw is "no signed wrap".
    */
    syntax OptNSW ::= "nsw" 
    syntax OptNUW ::= "nuw"
    syntax OptNW  ::= OptNUW OptNSW | OptNSW OptNUW | OptNSW | OptNUW

    //llvm: if exact is defined in udiv and sdiv, it means 
    //the result value of these operators is a poison value 
    //if any of the bits shifted out are non-zero
    syntax OptExact ::= "exact"
    syntax OptVolatile ::= "volatile"

    //define the arithmetic operators, logical and cast operators
    syntax IntConstructors ::= "add" | "sub" | "mul" | "shl"
    syntax DivConstructors ::= "udiv" | "sdiv" | "lshr" | "ashr" 
    syntax ArithmeticFloatOps ::= "fadd" | "fsub" | "fmul" | "fdiv"
                          | "urem" | "srem" | "frem"
    syntax BinaryOps ::= IntConstructors OptNW 
                      | IntConstructors
                      | DivConstructors OptExact 
                      | DivConstructors
                      | ArithmeticFloatOps


    syntax LogicalOps ::= "and" | "or" | "xor"
    syntax CastOps ::= "trunc" | "zext" | "sext" | "fptrunc" 
                     | "fpext" | "bitcast" | "uitofp" | "sitofp" 
                     | "fptoui" | "fptosi" | "inttoptr" | "ptrtoint"

    //define the predicates
    syntax IPredicates ::= "eq" | "ne" | "slt" | "sgt" | "sle" 
                         | "sge" | "ult" | "ugt" | "ule" | "uge"
    syntax FPredicates ::= "oeq" | "one" | "olt" | "ogt" | "ole" 
                         | "oge" | "ord" | "uno" | "ueq" | "une"
                         | "ult" | "ugt" | "ule" | "uge" | Bool

    //define alias linkage key words
    //define the Internal Linkage key words for global value and function declaration
    syntax AliasLinkage ::=  "weak" | "weak_odr" | "internal"
    syntax FunctionDefineLinkage ::= AliasLinkage | "linkonce" | "linkonce_odr" | "dllexport"
    syntax GVInternalLinkage ::= FunctionDefineLinkage | "appending" | "common" 
                               | "private" | "linker_private" | "linker_private_weak"

    //define the External Linkage key words for global value and function declaration
    syntax FunctionDeclareLinkage ::= "dllimport" | "extern_weak"
    syntax GVExternalLinkage ::= FunctionDeclareLinkage | "external"

    //define Global value visibility style key words
    syntax GVVisibilityStyle ::=  "default" | "hidden" | "protected"

    //define LLVM calling convention key words
    syntax OptCallingConv ::= "ccc" | "fastcc" | "coldcc" | "x86_stdcallcc"
                            | "x86_fastcallcc" | "cc" UnsignedInt

    //define param attributes: The return type and each parameter of 
    //a function type may have a set of parameter attributes associated with them.
    //the attributes is for function, expression and declaration
    syntax OptAlign ::= "align" UnsignedInt
    syntax CommonAttr ::= "inreg" | "zeroext" | "signext" 
    syntax RetAttr ::= CommonAttr | "noalias"
    syntax ParamAttr ::= RetAttr | OptAlign | "sret" | "nocapture" | "byval" 
                       | "nest" | "inalloca" | "returned" 
    syntax FuncAttr ::= CommonAttr | "noreturn" | "nounwind" | "readnone" | "nobuiltin"
                      | "readonly" | "inlinehint" | alignstack(UnsignedInt) | "noinline"
                      | "alwaysinline" | "optsize" | "ssp" | "sspreq" | "naked"
                      | "returns_twice" | "nonlazybind" | "cold" | "minsize" 
                      | "noduplicate" | "noimplicitfloat" | "noredzone" | "optnone"
                      | "sanitize_address" | "sanitize_memory" | "sanitize_thread"
                      | "sspstrong" | "uwtable"

    //define garbage collector name and section name
    syntax OptGC ::= "gc" String
    syntax SectionString ::= "section" String

    //define global attributes. Cannot define each attribute list precisely.
    //because list subsort problem 
    syntax GlobalVarAttribute ::= SectionString | ParamAttr | FuncAttr
    syntax ListOfGlobalVarAttribute ::= List{GlobalVarAttribute," "}
    syntax GlobalVarAttributes ::= ListOfGlobalVarAttribute | Token{[\#][0-9]+}


    //define the float types and primary types
    syntax IntType ::= Token{[i][1-9][0-9]*}
    syntax FPType  ::= "float" | "double" | "ppc_fp128" | "fp128" | "x86_fp80"
    syntax PrimType ::= FPType | IntType | "label" | "void"

    //define address space and types
    syntax OptAddrSpace ::= addrspace(UnsignedInt) | "unnamed_addr"
    syntax ArgType ::= Types GlobalVarAttributes
    syntax ArgTypeList ::= ArgType | ArgTypeList "," ArgType
    syntax ArgTypeListI ::= ArgTypeList | ArgTypeList "," "..." | "..."

    syntax Types ::= "opaque"
                   | PrimType
                   | Types OptAddrSpace"*"
                   | Types "*"
                   | SymbolicValueRef
                   | Types "(" ArgTypeListI ")" GlobalVarAttributes
                   | Types "(" ")" GlobalVarAttributes
                   | "[" UnsignedInt "x" Types "]"
                   | "<" UnsignedInt "x" Types ">"
                   | "{" TypeListI "}"
                   | "<" "{" TypeListI "}" ">"

    syntax TypeListI ::= List{Types,","}

    //define constant values and expressions
    syntax OptInBounds ::= "inbounds"
    syntax ValueRef ::= SymbolicValueRef | ConstValueRef
    syntax ResolvedVal ::= Types ValueRef
    syntax ReturnedVal ::= ResolvedVal | ReturnedVal "," ResolvedVal
    syntax IndexList ::= List{ResolvedVal,","}
    syntax Strings ::= List{String,","}
    syntax OptSideEffect ::= "sideeffect"

    //syntax ConstVal ::= Types ConstValueRef
    syntax ConstValueRef ::= Int | UnsignedInt | FpVal | Bool | ConstExpr
                           | "null" | "undef" | "zeroinitializer"
                           | "<" ReturnedVal ">"
                           | "[" ReturnedVal "]"
                           | "[" "]"
                           | "{" ReturnedVal "}"
                           | "{" "}"
                           | "c" String
                           | "<" "{" ReturnedVal "}" ">"
                           | "<" "{" "}" ">"
                           | "asm" OptSideEffect String "," String
                           | "asm" String "," String
    //syntax ConstVector ::= ResolvedVal | ConstVector "," ResolvedVal

    syntax ConstantIndexList ::= "," UnsignedInt | ConstantIndexList "," UnsignedInt
    syntax ConstExpr::= CastOps "(" ResolvedVal "to" Types ")"
                      | BinaryOps "(" ResolvedVal "," ResolvedVal ")"
                      | "getelementptr" OptInBounds "(" ResolvedVal IndexList ")"
                      | "getelementptr" "(" ResolvedVal IndexList ")"
                      | select(ResolvedVal, ResolvedVal, ResolvedVal)
                      | "icmp" IPredicates "(" ResolvedVal "," ResolvedVal ")"
                      | "fcmp" FPredicates "(" ResolvedVal "," ResolvedVal ")"
                      | extractelement(ResolvedVal, ResolvedVal)
                      | insertelement(ResolvedVal, ResolvedVal, ResolvedVal)
                      | shufflevector(ResolvedVal, ResolvedVal, ResolvedVal)
                      | "extractvalue" "(" ResolvedVal ConstantIndexList ")"
                      | "insertvalue" "(" ResolvedVal "," ResolvedVal ConstantIndexList ")"

    //define global type constants, thread local constants and external behaviors.
    syntax GlobalType ::= "global" | "constant"
    syntax ThreadLocal ::= "thread_local" "(" ThreadLocalAttr ")" | "thread_local"
    syntax ThreadLocalAttr ::= "localdynamic" | "initialexec" | "localexec"
    syntax ExternallyInitialized ::= "externally_initialized"

    //define Aliasee references.
    syntax AliaseeRef ::= Types SymbolicValueRef
                        | "bitcast" "(" AliaseeRef "to" Types ")"

    //define Modules and definitions.
    syntax Module ::= List{Definition," "}
    syntax Definition ::= "define" Function
                        | "declare" FunctionProto
                        | "module" "asm" AsmBlock
                        | OptLocalAssign "type" Types
                        | "type" Types
                        | GlobalAssignAndGVVBlock ThreadLocalAndOptAddrBlock
                          GlobalType ResolvedVal GlobalVarAttributes
                        | GlobalAssignAndGVVBlock
                          GlobalType ResolvedVal GlobalVarAttributes
                        | ThreadLocalAndOptAddrBlock
                          GlobalType ResolvedVal GlobalVarAttributes
                        | GlobalType ResolvedVal GlobalVarAttributes
                        | GlobalAndExternalBlock ThreadLocalAndOptAddrBlock
                          GlobalType Types GlobalVarAttributes
                        | GlobalAndExternalBlock
                          GlobalType Types GlobalVarAttributes
                        | GlobalAssignAndGVVBlock "alias" AliasLinkage AliaseeRef
                        | GlobalAssignAndGVVBlock "alias" AliaseeRef
                        | "target" TargetDefinition
                        | "deplibs" "=" LibrariesDefinition

   syntax GlobalAssignAndGVVBlock ::= OptGlobalAssign GVInternalLinkage GVVisibilityStyle
                                    | OptGlobalAssign GVInternalLinkage
                                    | OptGlobalAssign GVVisibilityStyle
                                    | GVInternalLinkage GVVisibilityStyle
                                    | OptGlobalAssign
                                    | GVInternalLinkage
                                    | GVVisibilityStyle
   syntax GlobalAndExternalBlock ::= OptGlobalAssign GVExternalLinkage GVVisibilityStyle
                                   | GVExternalLinkage GVVisibilityStyle
                                   | OptGlobalAssign GVExternalLinkage
                                   | GVExternalLinkage
   syntax ThreadLocalAndOptAddrBlock ::= ThreadLocal OptAddrSpace
                                       | ThreadLocal
                                       | OptAddrSpace

   //define a AsmBlock to be a string constant.
   syntax AsmBlock ::= String

   //define target definitions.
   syntax TargetDefinition ::= "triple" "=" String
                      | "datalayout" "=" String

   //define libraries definitions.
   syntax StringList ::= List{String,","}
   syntax LibrariesDefinition ::= "[" StringList "]" | "[" "]"

   //define argument lists.
   syntax ArgListH ::= ArgListH "," Types GlobalVarAttributes LocalName
                     | Types GlobalVarAttributes LocalName
   syntax ArgList ::= ArgListH | ArgListH "," "..." | "..."

   //define function headers. 
   syntax FunctionHeaderH ::= OptCallingConv GlobalVarAttributes Types
                              GlobalName "(" ArgList ")"
                              GlobalVarAttributes TailOfFunctionHeader
                            | GlobalVarAttributes Types
                              GlobalName "(" ArgList ")"
                              GlobalVarAttributes TailOfFunctionHeader
                            | OptCallingConv GlobalVarAttributes Types
                              GlobalName "(" ")"
                              GlobalVarAttributes TailOfFunctionHeader
                            | OptCallingConv GlobalVarAttributes Types
                              GlobalName "(" ArgList ")"
                              GlobalVarAttributes
                            | OptCallingConv GlobalVarAttributes Types
                              GlobalName "(" ")"
                              GlobalVarAttributes
                            | GlobalVarAttributes Types
                              GlobalName "(" ArgList ")"
                              GlobalVarAttributes
                            | GlobalVarAttributes Types
                              GlobalName "(" ")"
                              GlobalVarAttributes TailOfFunctionHeader
                            | GlobalVarAttributes Types
                              GlobalName "(" ")" GlobalVarAttributes

   syntax TailOfFunctionHeader ::= SectionString OptAlign OptGC
                                 | OptAlign OptGC
                                 | SectionString OptGC
                                 | SectionString OptAlign
                                 | SectionString
                                 | OptAlign
                                 | OptGC

   //define function bodies.
   syntax Begin ::= "begin" | "{"
   syntax End ::= "end" | "}"
   syntax BasicBlock ::= LabelStringConstant InstructionList OptLocalAssign BBTerminatorInst
                       | LabelStringConstant InstructionList BBTerminatorInst
                       | InstructionList OptLocalAssign BBTerminatorInst
                       | InstructionList BBTerminatorInst
   syntax BasicBlockList ::= BasicBlockList BasicBlock | BasicBlock
   syntax FunctionHeader ::= FunctionDefineLinkage GVVisibilityStyle FunctionHeaderH
                           | GVVisibilityStyle FunctionHeaderH
                           | FunctionDefineLinkage FunctionHeaderH
                           | FunctionHeaderH
   syntax Function ::= FunctionHeader Begin BasicBlockList End
   syntax FunctionProto ::= FunctionDeclareLinkage GVVisibilityStyle FunctionHeaderH
                          | GVVisibilityStyle FunctionHeaderH
                          | FunctionDeclareLinkage FunctionHeaderH
                          | FunctionHeaderH

   //define instruction lists and instruction list values
   syntax OptTailCall ::= "tail" "call" | "call"
   syntax Inst ::= OptLocalAssign InstVal | InstVal
   syntax InstructionList ::= List{Inst,","}
   syntax InstVal ::= BinaryOps Types ValueRef "," ValueRef
                    | LogicalOps Types ValueRef "," ValueRef
                    | "icmp" IPredicates Types ValueRef "," ValueRef
                    | "fcmp" FPredicates Types ValueRef "," ValueRef
                    | CastOps ResolvedVal "to" Types
                    | "select" ResolvedVal "," ResolvedVal "," ResolvedVal
                    | "va_arg" ResolvedVal "," Types
                    | "extractelement" ResolvedVal "," ResolvedVal
                    | "insertelement" ResolvedVal "," ResolvedVal "," ResolvedVal
                    | "shufflevector" ResolvedVal "," ResolvedVal "," ResolvedVal
                    | "phi" PHIList
                    | OptTailCall OptCallingConv Types
                      ValueRef "(" ParamList ")" GlobalVarAttributes
                    | OptTailCall Types
                      ValueRef "(" ParamList ")" GlobalVarAttributes
                    | MemoryInst

   //define memory instruction lists
   syntax MemoryInst ::=  "malloc" Types "," OptAlign
                        | "malloc" Types
                        | "malloc" Types "," IntType ValueRef "," OptAlign
                        | "malloc" Types "," IntType ValueRef
                        | "alloca" Types "," OptAlign
                        | "alloca" Types
                        | "alloca" Types "," IntType ValueRef "," OptAlign
                        | "alloca" Types "," IntType ValueRef
                        | "free" ResolvedVal
                        | OptVolatile "load" Types ValueRef "," OptAlign
                        | "load" Types ValueRef "," OptAlign
                        | OptVolatile "load" Types ValueRef
                        | "load" Types ValueRef
                        | OptVolatile "store" ResolvedVal "," Types
                          ValueRef "," OptAlign
                        | "store" ResolvedVal "," Types
                          ValueRef "," OptAlign
                        | OptVolatile "store" ResolvedVal "," Types ValueRef
                        | "store" ResolvedVal "," Types ValueRef
                        | "getresult" Types ValueRef "," UnsignedInt
                        | "getelementptr" OptInBounds Types ValueRef IndexList
                        | "getelementptr" Types ValueRef IndexList
                        | "extractvalue" Types ValueRef ConstantIndexList
                        | "insertvalue" Types ValueRef "," Types
                          ValueRef ConstantIndexList

    //define parameter lists
    syntax ParamFactor ::= Types GlobalVarAttributes ValueRef GlobalVarAttributes
                       | "label" GlobalVarAttributes ValueRef GlobalVarAttributes
    syntax ParamList ::= List{ParamFactor,","}

    //define phi lists
    syntax PHIList ::= Types "[" ValueRef "," ValueRef "]"
                     | PHIList "," "[" ValueRef "," ValueRef "]"

    //define jump tables
    syntax JumpTableEntry ::= IntType ConstValueRef "," "label" ValueRef
    syntax JumpTable ::= List{JumpTableEntry," "}

    //define return statment in a function.
    syntax BBTerminatorInst ::= "ret" ReturnedVal
                              | "ret" "void"
                              | "br" "label" ValueRef
                              | "br" IntType ValueRef
                                "," "label" ValueRef "," "label" ValueRef
                              | "switch" IntType ValueRef ","
                                "label" ValueRef "[" JumpTable "]"
                              | "invoke" OptCallingConv Types
                                ValueRef "(" ParamList ")" GlobalVarAttributes
                                "to" "label" ValueRef "unwind" "label" ValueRef
                              | "invoke" Types
                                ValueRef "(" ParamList ")" GlobalVarAttributes
                                "to" "label" ValueRef "unwind" "label" ValueRef
                              | "unwind"
                              | "unreachable"

endmodule
