// Copyright (c) 2013-2014 K Team. All Rights Reserved.
/*@

This is the syntax of LLVM.

This syntax requires a input LLVM program without any comments on it.
*/
module LLVM-SYNTAX-REAL

    /*a program is a list of stmts which is separated by an empty string. 
    */
    //syntax Pgm ::= List{Stmt," "} [latex({#1})]

    /*
    Define rules for non-keyword tokens. This is currently just a bunch
    of hacks. They don't cover many valid forms of tokens, and they also
    generate some invalid forms of tokens. 
    */

    syntax HexConstant ::= Token{[0][x][0-9 a-f]*}
    syntax UnsignedInt ::= Token{[1-9][0-9]}
    syntax FpVal ::= HexConstant | Float
    syntax IntType ::= Token{[i][1-9][0-9]*}
    syntax LocalValID ::= Token{[\%][1-9][0-9]*}
    syntax LocalVar ::=  Token{[\%][a-z \. \_ \- \$][0-9 a-z \. \_ \- \$]*}
    syntax LocalVar ::= Token{[\%]"\"" ((~[\"\n\r\\]) | (((([\\][nrtf\"\\]) | ([\\][x][0-9a-fA-F][0-9a-fA-F])) | ([\\][u][0-9a-fA-F][0-9a-fA-F][0-9a-fA-F][0-9a-fA-F])) | ([\\][U][0-9a-fA-F][0-9a-fA-F][0-9a-fA-F][0-9a-fA-F][0-9a-fA-F][0-9a-fA-F][0-9a-fA-F][0-9a-fA-F])))* "\""}
                    [regex("[\\\"](([^\\\"\\n\\r\\\\])|([\\\\][nrtf\\\"\\\\])|([\\\\][x][0-9a-fA-F]{2})|([\\\\][u][0-9a-fA-F]{4})|([\\\\][U][0-9a-fA-F]{8}))*[\\\"]")]
    syntax GlobalValID ::= Token{[\@][1-9][0-9]*}
    syntax GlobalVar ::= Token{[\@][a-z \. \_ \- \$][0-9 a-z \. \_ \- \$]*}
    syntax LocalVar ::= Token{[\@]"\"" ((~[\"\n\r\\]) | (((([\\][nrtf\"\\]) | ([\\][x][0-9a-fA-F][0-9a-fA-F])) | ([\\][u][0-9a-fA-F][0-9a-fA-F][0-9a-fA-F][0-9a-fA-F])) | ([\\][U][0-9a-fA-F][0-9a-fA-F][0-9a-fA-F][0-9a-fA-F][0-9a-fA-F][0-9a-fA-F][0-9a-fA-F][0-9a-fA-F])))* "\""}
                    [regex("[\\\"](([^\\\"\\n\\r\\\\])|([\\\\][nrtf\\\"\\\\])|([\\\\][x][0-9a-fA-F]{2})|([\\\\][u][0-9a-fA-F]{4})|([\\\\][U][0-9a-fA-F]{8}))*[\\\"]")]

    syntax LocalName ::= LocalVar | LocalValID | String
    syntax GlobalName ::= GlobalVar | GlobalValID

    //This is the primary operators

    //define the nsw and nuw flag
    //llvm: nuw only applies to integer operations
    //llvm: nsw only applies to integer operations
    //llvm: nuw is "no unsigned wrap" and nsw is "no signed wrap"
    syntax OptNSW ::= "nsw" 
    syntax OptNUW ::= "nuw"
    syntax OptNW  ::= OptNUW OptNSW | OptNSW OptNUW | OptNSW | OptNUW
    
    //llvm: if exact is defined in udiv and sdiv. It means 
    //the result value of the ashr is a poison value 
    //if any of the bits shifted out are non-zero
    syntax OptExact ::= "exact"

    //define the arithmetic operators, logical and cast operators
    syntax IntConstructors ::= "add" | "sub" | "mul" | "shl"
    syntax DivConstructors ::= "udiv" | "sdiv" | "lshr" | "ashr" 

    syntax OtherOps ::= "fadd" | "fsub" | "fmul" | "fdiv"
                          | "urem" | "srem" | "frem"
    //syntax IntOps ::= IntConstructors | IntConstructors OptNW 
    //syntax DivOps ::= DivConstructors | DivConstructors OptExact

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

    //define the float types
    syntax FPType  ::= "float" | "double" | "ppc_fp128" | "fp128" | "x86_fp80"

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
   
    syntax OptRetAttrs ::= RetAttr | OptRetAttrs RetAttr
    syntax OptParamAttrs ::= ParamAttr | OptParamAttrs ParamAttr
    syntax OptFuncAttrs ::= FuncAttr | OptFuncAttrs FuncAttr

    //define garbage collector name and section name
    syntax OptGC ::= "gc" String
    syntax SectionString ::= "section" String

    //define global attributes
    syntax GlobalVarAttribute ::= SectionString | OptAlign
    syntax GlobalVarAttributes ::= GlobalVarAttribute 
                                 | GlobalVarAttributes GlobalVarAttribute

/*
    syntax Constant ::= Boolean | Int | Float

    syntax ThreadLocal ::= "thread_local" "(" ThreadLocalAttr ")" | "thread_local"

    syntax ThreadLocalAttr ::= "localdynamic" | "initialexec" | "localexec"

    syntax UnnamedAttr ::= "unnamed_attr"

    syntax AddrSpace ::= addrspace(Int)

    syntax ExternallyInitialized ::= "externally_initialized"

    syntax GlobalOrConstant ::= "global" | "constant"
*/  

endmodule
