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
    syntax LocalValID ::= Token{[\%][1-9][0-9]*}
    syntax LocalVar ::=  Token{[\%][a-z \. \_ \- \$][0-9 a-z \. \_ \- \$]*}
    syntax LocalVar ::= Token{[\%]"\"" ((~[\"\n\r\\]) | (((([\\][nrtf\"\\]) | ([\\][x][0-9a-fA-F][0-9a-fA-F])) | ([\\][u][0-9a-fA-F][0-9a-fA-F][0-9a-fA-F][0-9a-fA-F])) | ([\\][U][0-9a-fA-F][0-9a-fA-F][0-9a-fA-F][0-9a-fA-F][0-9a-fA-F][0-9a-fA-F][0-9a-fA-F][0-9a-fA-F])))* "\""}

    syntax GlobalValID ::= Token{[\@][1-9][0-9]*}
    syntax GlobalVar ::= Token{[\@][a-z \. \_ \- \$][0-9 a-z \. \_ \- \$]*}
    syntax LocalVar ::= Token{[\@]"\"" ((~[\"\n\r\\]) | (((([\\][nrtf\"\\]) | ([\\][x][0-9a-fA-F][0-9a-fA-F])) | ([\\][u][0-9a-fA-F][0-9a-fA-F][0-9a-fA-F][0-9a-fA-F])) | ([\\][U][0-9a-fA-F][0-9a-fA-F][0-9a-fA-F][0-9a-fA-F][0-9a-fA-F][0-9a-fA-F][0-9a-fA-F][0-9a-fA-F])))* "\""}

    syntax LocalName ::= LocalVar | String

    /*@
      Symbolic value reference is including local names, 
      global variables, local valid ids and global valid ids.
     */
    syntax SymbolicValueRef ::= LOCALVALID | GLOBALVALID
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
    syntax GlobalVarAttributes ::= List{GlobalVarAttribute," "}


    //define the float types and primary types
    syntax IntType ::= Token{[i][1-9][0-9]*}
    syntax FPType  ::= "float" | "double" | "ppc_fp128" | "fp128" | "x86_fp80"
    syntax PrimType ::= FPType | IntType | "label" | "void"

    //define address space and types
    syntax OptAddrSpace ::= addrspace(UnsignedInt)
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
    syntax IndexList ::= List{ResolvedVal,","}
    syntax Strings ::= List{String,","}
    syntax OptSideEffect ::= "sideeffect"

    syntax ConstVal ::= Types ConstValueRef
    syntax ConstValueRef ::= Int | UnsignedInt | FpVal | Bool | ConstExpr
                           | "null" | "undef" | "zeroinitializer"
                           | "<" ConstVector ">"
                           | "[" ConstVector "]"
                           | "[" "]"
                           | "{" ConstVector "}"
                           | "{" "}"
                           | "c" String
                           | "<" "{" ConstVector "}" ">"
                           | "<" "{" "}" ">"
                           | "asm" OptSideEffect String "," String
                           | "asm" String "," String
    syntax ConstVector ::= ConstVal | ConstVector "," ConstVal

    syntax ConstantIndexList ::= "," UnsignedInt | ConstantIndexList "," UnsignedInt
    syntax ConstExpr::= CastOps "(" ConstVal "to" Types ")"
                      | BinaryOps "(" ConstVal "," ConstVal ")"
                      | "getelementptr" OptInBounds "(" ConstVal IndexList ")"
                      | "getelementptr" "(" ConstVal IndexList ")"
                      | select(ConstVal, ConstVal, ConstVal)
                      | "icmp" IPredicates "(" ConstVal "," ConstVal ")"
                      | "fcmp" FPredicates "(" ConstVal "," ConstVal ")"
                      | extractelement(ConstVal, ConstVal)
                      | insertelement(ConstVal, ConstVal, ConstVal)
                      | shufflevector(ConstVal, ConstVal, ConstVal)
                      | "extractvalue" "(" ConstVal ConstantIndexList ")"
                      | "insertvalue" "(" ConstVal "," ConstVal ConstantIndexList ")"

/*
    syntax ThreadLocal ::= "thread_local" "(" ThreadLocalAttr ")" | "thread_local"

    syntax ThreadLocalAttr ::= "localdynamic" | "initialexec" | "localexec"

    syntax UnnamedAttr ::= "unnamed_attr"

    syntax ExternallyInitialized ::= "externally_initialized"

    syntax GlobalOrConstant ::= "global" | "constant"
*/  
endmodule
