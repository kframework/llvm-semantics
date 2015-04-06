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
    syntax UnsignedInt ::= Token{[0-9][0-9]*}
    syntax FpVal ::= HexConstant | Float
    syntax #String ::= Token{[\"] (~[\"])* [\"]}
    syntax LocalValID ::= Token{[\%][0-9]+}
    syntax LocalVar ::=  Token{[\%][a-z A-Z \. \_ \- \$][0-9 a-z A-Z \. \_ \- \$]*}
    syntax LocalVar ::= Token{[\%][\"] (~[\"])* [\"]}

    syntax GlobalValID ::= Token{[\@][0-9]+}
    syntax GlobalVar ::= Token{[\@][a-z A-Z \. \_ \- \$][0-9 a-z A-Z \. \_ \- \$]*}
    syntax GlobalVar ::= Token{[\@][\"] (~[\"])* [\"]}

    syntax LabelStringConstant ::= Token{[1-9][0-9]*[\:]}
    syntax LabelStringConstant ::= Token{[a-z A-Z \. \_ \- \$][0-9 a-z A-Z \. \_ \- \$]*[\:]}
    syntax LabelStringConstant ::= Token{[\@][\"] (~[\"])* [\"][\:]}

    //define metadata variables and attribute group ids.
    syntax MetadataVar ::= Token{[\!][a-z A-Z \. \_ \- \$ \\][0-9 a-z A-Z \. \_ \- \$ \\]*}
    syntax AttributeGroupId ::= Token{[\#][0-9]+}

    //define local and global names as well as local and global assignments
    syntax LocalName ::= LocalVar | LocalValID
    syntax LocalAssign ::= LocalName "="
    syntax GlobalName ::= GlobalVar | GlobalValID
    syntax GlobalAssign ::= GlobalName "="

    /*@
      Symbolic value reference is including local names, 
      global variables, local valid ids and global valid ids.
     */
    syntax SymbolicValueRef ::= LocalName | GlobalName

    /*@
      There are the primary operators.
      Define the nsw and nuw flags.
      llvm: nuw only applies to integer operations.
      llvm: nsw only applies to integer operations.
      llvm: nuw is "no unsigned wrap" and nsw is "no signed wrap".
    */
    syntax NSW ::= "nsw" 
    syntax NUW ::= "nuw"
    syntax OptNW  ::= NUW NSW | NSW NUW | NSW | NUW
                    | "" [klabel('nwEmpty),onlyLabel]

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
    syntax NonExternalLinkage ::= "private" | "internal" | "weak" | "weak_odr"  | "common"
                                | "linkonce" | "linkonce_odr" | "available_externally"
                                | "appending" | "linker_private" | "linker_private_weak"
                                | "" [klabel('nonExternalLinkageEmpty),onlyLabel]

    //define the External Linkage key words for global value and function declaration
    syntax ExternalLinkage ::= "extern_weak" | "external"
    syntax OptLinkage ::= NonExternalLinkage | ExternalLinkage

    //define Global value visibility style key words
    //which is the same as the opt_visibility sort in Trevor Jim's LLVM YACC parser
    syntax OptVisibilityStyle ::= "default" | "hidden" | "protected"
                               | "" [klabel('visibilityEmpty),onlyLabel]

    //define the attributes for Dll storage class in LLVM.
    syntax OptDllStorageClass ::= "dllimport" | "dllexport"
                                | "" [klabel('dllStorageEmpty),onlyLabel]

    //define LLVM calling convention key words
    syntax OptCallingConv ::= "ccc" | "fastcc" | "coldcc" | "x86_stdcallcc" | "x86_thiscallcc"
                            | "x86_fastcallcc" | "x86_cdeclmethodcc"| "intel_ocl_bicc"
                            | "arm_apcscc" | "arm_aapcscc" | "arm_aapcs_vfpcc"
                            | "msp430_intrcc" | "ptx_kernel" | "ptx_device"
                            | "spir_func" | "spir_kernel" | "x86_64_sysvcc"
                            | "x86_64_win64cc" | "webkit_jscc" | "anyregcc"
                            | "preserve_mostcc" | "preserve_allcc" | "cc" UnsignedInt
                            | "" [klabel('callingConvEmpty),onlyLabel]

    //define param attributes: The return type and each parameter of 
    //a function type may have a set of parameter attributes associated with them.
    //the attributes is for function, expression and declaration
    syntax RetAttr ::= "inreg" [klabel('inregOfReturn)]
                     | "zeroext" [klabel('zeroextOfReturn)]
                     | "signext"  [klabel('signextOfReturn)]
                     | "noalias" [klabel('noaliasOfReturn)]
    syntax RetAttrs ::= List{RetAttr," "}

    syntax ParamAttr ::= Align | "sret" | "nocapture" | "byval"
                       | "nest" | "inalloca" | "returned"
                       | "readnone" [klabel('readnoneOfParam)]
                       | "readonly" [klabel('readonlyOfParam)]
                       | "inreg" [klabel('inregOfParam)]
                       | "zeroext" [klabel('zeroextOfParam)]
                       | "signext"  [klabel('signextOfParam)]
                       | "noalias" [klabel('noaliasOfParam)]
    syntax ParamAttrs ::= List{ParamAttr," "}

    syntax CommAttr ::= "noreturn" | "nounwind" | "nobuiltin" | "builtin" | "sspstrong"
                      | "inlinehint" | "noinline" | "uwtable" | "sanitize_thread"
                      | "alwaysinline" | "optsize" | "ssp" | "sspreq" | "naked"
                      | "returns_twice" | "nonlazybind" | "cold" | "minsize" 
                      | "noduplicate" | "noimplicitfloat" | "noredzone" | "optnone"
                      | "sanitize_address" | "sanitize_memory"
                      | "readonly" [klabel('readonlyOfComm)]
                      | "readnone" [klabel('readnoneOfComm)]
                      | #String "=" #String | AttributeGroupId
    syntax FuncAttr ::= CommAttr | alignstack(UnsignedInt)
    syntax FuncAttrs ::= List{FuncAttr," "}
    syntax GroupAttr ::= CommAttr | #String | "alignstack" "=" UnsignedInt
                       | "align" "=" UnsignedInt
    syntax GroupAttrs ::= List{GroupAttr," "}

    //define garbage collector name, section name and align name.
    syntax OptGC ::= "gc" #String | "" [klabel('gcEmpty),onlyLabel]
    syntax OptPrefix ::= "prefix" Type ValueRef | "" [klabel('prefixEmpty),onlyLabel]
    syntax OptSection ::= "section" #String | "" [klabel('sectionEmpty),onlyLabel]
    syntax Align ::= "align" UnsignedInt
    syntax OptAlign ::= Align | "" [klabel('alignEmpty),onlyLabel]
    syntax OptSectionAndAlign ::= "" [klabel('sectionAndAlignEmpty),onlyLabel]
                                | "," "section" #String
                                | "," "align" UnsignedInt
                                | "," "section" #String "," "align" UnsignedInt

    //define global attributes. Cannot define each attribute list precisely.
    //because list subsort problem 
    syntax GlobalVarAttribute ::= OptSection
    syntax ListOfGlobalVarAttribute ::= List{GlobalVarAttribute," "}
    syntax GlobalVarAttributes ::= ListOfGlobalVarAttribute


    //define the float types and primary types
    syntax IntType ::= Token{[i][1-9][0-9]*}
    syntax FPType  ::= "float" | "double" | "ppc_fp128" | "fp128"
                     | "x86_fp80" | "half"
    syntax PrimType ::= FPType | IntType | "label"

    //define address space and unnamed address space
    syntax OptAddrSpace ::= addrspace(UnsignedInt) | "" [klabel('addrEmpty),onlyLabel]
    syntax OptUnnamedAddr ::= "unnamed_addr" | "" [klabel('unnamedEmpty),onlyLabel]

    syntax OpaqueType ::= "opaque"
    syntax VoidType ::= "void"
    syntax NonVoidType ::= "metadata"
                         | "x86_mmx"
                         | PrimType
                         | Type OptAddrSpace "*"
                         | LocalName
                         | Type "(" ArgList ")"
                         | "[" UnsignedInt "x" Type "]"
                         | "<" UnsignedInt "x" Type ">"
                         | "{" TypeList "}"
                         | "<" "{" TypeList "}" ">"
    syntax Type ::= VoidType | NonVoidType

    syntax TypeList ::= List{Type,","}

    //define constant values and expressions
    syntax OptInBounds ::= "inbounds" | "" [klabel('inBoundsEmpty),onlyLabel]
    syntax ValueRef ::= SymbolicValueRef | ConstValueRef
    syntax ResolvedVal ::= Type ValueRef
    syntax ReturnedVal ::= ResolvedVal | ReturnedVal "," ResolvedVal
    syntax Index ::= ResolvedVal | "null"
    syntax IndexList ::= List{Index,","}
    syntax Strings ::= List{#String,","}
    syntax OptSideEffect ::= "sideeffect"

    //syntax ConstVal ::= Type ConstValueRef
    syntax ConstValueRef ::= Int | UnsignedInt | FpVal | Bool | ConstExpr
                           | "null" | "undef" | "zeroinitializer"
                           | "<" ReturnedVal ">"
                           | "[" ReturnedVal "]"
                           | "[" "]"
                           | "{" ReturnedVal "}"
                           | "{" "}"
                           | "c" #String
                           | "<" "{" ReturnedVal "}" ">"
                           | "<" "{" "}" ">"
                           | "asm" OptSideEffect #String "," #String
                           | "asm" #String "," #String
    //syntax ConstVector ::= ResolvedVal | ConstVector "," ResolvedVal

    syntax ConstantIndexList ::= "," UnsignedInt | ConstantIndexList "," UnsignedInt
    syntax ConstExpr::= CastOps "(" ResolvedVal "to" Type ")"
                      | BinaryOps "(" ResolvedVal "," ResolvedVal ")"
                      | "getelementptr" OptInBounds "(" ResolvedVal IndexList ")"
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
    syntax OptThreadLocal ::= "thread_local" "(" ThreadLocalAttr ")" | "thread_local"
                         | "" [klabel('threadLocalEmpty),onlyLabel]
    syntax ThreadLocalAttr ::= "localdynamic" | "initialexec" | "localexec"
    syntax OptExternallyInitialized ::= "externally_initialized"
                                      | "" [klabel('externallyInitEmpty),onlyLabel]

    //define Aliasee references.
    syntax AliaseeRef ::= ResolvedVal
                        | "bitcast" "(" AliaseeRef "to" Type ")"
                        | "getelementptr" OptInBounds "(" IndexList ")"

    //define the constructs in a metadata list
    syntax MetadataValue ::= "!" UnsignedInt
    syntax MetadataValues ::= List{MetadataValue," "}

    //define Modules and definitions.
    syntax Module ::= List{Definition," "}
    syntax Definition ::= "define" Function
                        | "declare" FunctionProto
                        | "module" "asm" AsmBlock
                        | LocalAssign "type" Type
                        | LocalAssign "type" OpaqueType
                        | GlobalAssign ExternalLinkage OptVisibilityStyle
                          OptDllStorageClass OptThreadLocal OptAddrSpace
                          OptUnnamedAddr OptExternallyInitialized GlobalType
                          Type OptSectionAndAlign
                        | GlobalAssign NonExternalLinkage OptVisibilityStyle
                          OptDllStorageClass OptThreadLocal OptAddrSpace
                          OptUnnamedAddr OptExternallyInitialized GlobalType
                          Type ValueRef OptSectionAndAlign
                        | GlobalAssign OptLinkage OptVisibilityStyle
                          "alias" OptLinkage AliaseeRef
                        | "target" TargetDefinition
                        | "deplibs" "=" LibrariesDefinition
                        | "!" UnsignedInt "=" Type "!" "{" IndexList "}"
                        | MetadataVar "=" "!" "{" MetadataValues "}"
                        | "attributes" AttributeGroupId "=" "{" GroupAttrs "}"

   //define a AsmBlock to be a string constant.
   syntax AsmBlock ::= #String

   //define target definitions.
   syntax TargetDefinition ::= "triple" "=" #String
                      | "datalayout" "=" #String

   //define libraries definitions.
   syntax StringList ::= List{#String,","}
   syntax LibrariesDefinition ::= "[" StringList "]" | "[" "]"

   //define argument lists.
   syntax ArgType ::= Type ParamAttrs
                     | Type ParamAttrs LocalVar
   syntax ArgList ::= "" [klabel('argListUnit),onlyLabel] | "..."
                    | ArgType
                    | ArgType "," ArgList

   //define function headers. 
   syntax FunctionHeaderH ::= OptCallingConv RetAttrs Type
                              GlobalName "(" ArgList ")" OptUnnamedAddr
                              FuncAttrs OptSection OptAlign OptGC OptPrefix

   //define function bodies.
   syntax BasicBlock ::= InstructionList BBTerminatorInstruction
    /*LabelStringConstant InstructionList LocalAssign BBTerminatorInstruction
                       | LabelStringConstant InstructionList BBTerminatorInstruction
                       | InstructionList LocalAssign BBTerminatorInstruction
                       | 
    */

   syntax BasicBlockList ::= BasicBlockList BasicBlock | BasicBlock
   syntax Function ::= OptLinkage OptVisibilityStyle FunctionHeaderH "{" BasicBlockList "}"
   syntax FunctionProto ::= ExternalLinkage OptVisibilityStyle FunctionHeaderH
                          | OptDllStorageClass OptVisibilityStyle FunctionHeaderH

   //define instruction lists and instruction list values
   syntax OptTailCall ::= "tail" "call" | "call"
   syntax Instruction ::= LocalAssign InstVal | InstVal
   syntax InstructionList ::= List{Instruction,","}
   syntax InstVal ::= BinaryOps ResolvedVal "," ValueRef
                    | LogicalOps Type ValueRef "," ValueRef
                    | "icmp" IPredicates Type ValueRef "," ValueRef
                    | "fcmp" FPredicates Type ValueRef "," ValueRef
                    | CastOps ResolvedVal "to" Type
                    | "select" ResolvedVal "," ResolvedVal "," ResolvedVal
                    | "va_arg" ResolvedVal "," Type
                    | "extractelement" ResolvedVal "," ResolvedVal
                    | "insertelement" ResolvedVal "," ResolvedVal "," ResolvedVal
                    | "shufflevector" ResolvedVal "," ResolvedVal "," ResolvedVal
                    | "phi" PHIList
                    | OptTailCall OptCallingConv Type
                      ValueRef "(" ParamList ")" GlobalVarAttributes
                    | OptTailCall Type
                      ValueRef "(" ParamList ")" GlobalVarAttributes
                    | MemoryInst

   //define memory instruction lists
   syntax MemoryInst ::=  "malloc" Type "," OptAlign
                        | "malloc" Type
                        | "malloc" Type "," IntType ValueRef "," OptAlign
                        | "malloc" Type "," IntType ValueRef
                        | "alloca" Type "," OptAlign
                        | "alloca" Type
                        | "alloca" Type "," IntType ValueRef "," OptAlign
                        | "alloca" Type "," IntType ValueRef
                        | "free" ResolvedVal
                        | OptVolatile "load" Type ValueRef "," OptAlign
                        | "load" Type ValueRef "," OptAlign
                        | OptVolatile "load" Type ValueRef
                        | "load" Type ValueRef
                        | OptVolatile "store" ResolvedVal "," Type
                          ValueRef "," OptAlign
                        | "store" ResolvedVal "," Type
                          ValueRef "," OptAlign
                        | OptVolatile "store" ResolvedVal "," Type ValueRef
                        | "store" ResolvedVal "," Type ValueRef
                        | "getresult" Type ValueRef "," UnsignedInt
                        | "getelementptr" OptInBounds Type ValueRef IndexList
                        | "extractvalue" Type ValueRef ConstantIndexList
                        | "insertvalue" Type ValueRef "," Type
                          ValueRef ConstantIndexList

    //define parameter lists
    syntax ParamFactor ::= Type ParamAttrs ValueRef [klabel('paramFactor)]
    syntax ParamList ::= List{ParamFactor,","}

    //define phi lists
    syntax PHIList ::= Type "[" ValueRef "," ValueRef "]"
                     | PHIList "," "[" ValueRef "," ValueRef "]"

    //define jump tables
    syntax JumpTableEntry ::= IntType ConstValueRef "," LabelValue
    syntax JumpTable ::= List{JumpTableEntry," "}
    syntax LabelValue ::= "label" ValueRef
    syntax LabelValues ::= List{LabelValue,","}

    //define the metadata in the tail of all instructions.
    syntax InstructionMetadata ::= MetadataVar "!" UnsignedInt
                                 | MetadataVar "!" "{" IndexList "}"
    syntax InstructionMetadatas ::= "" [klabel('instMetadabaEmpty),onlyLabel]
                                 | "," InstructionMetadata InstructionMetadatas

    //define return statment in a function.
    syntax BBTerminatorInstruction ::= "ret" NonVoidType ValueRef InstructionMetadatas
                                     | "ret" VoidType InstructionMetadatas
                                     | "br" LabelValue InstructionMetadatas
                                     | "br" IntType ValueRef ","
                                       LabelValue "," LabelValue InstructionMetadatas
                                     | "resume" ResolvedVal InstructionMetadatas
                                     | "indirectbr" ResolvedVal ","
                                       "[" LabelValues "]" InstructionMetadatas
                                     | "switch" IntType ValueRef ","
                                       LabelValue "[" JumpTable "]" InstructionMetadatas
                                     | "invoke" OptCallingConv RetAttrs Type
                                       ValueRef "(" ParamList ")" FuncAttrs
                                       "to" LabelValue "unwind" LabelValue InstructionMetadatas
                                     | LocalAssign "invoke" OptCallingConv RetAttrs Type
                                       ValueRef "(" ParamList ")" FuncAttrs
                                       "to" LabelValue "unwind" LabelValue InstructionMetadatas
                                     | "unreachable" InstructionMetadatas

    //this configuration will be used as testing only
    configuration <k> $PGM:Module </k>

endmodule
