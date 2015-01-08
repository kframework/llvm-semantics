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
    syntax FpVal ::= HexConstant | Float
    syntax IntType ::= Token{[i][1-9][0-9]*}
    syntax LocalValID ::= Token{[\%][1-9][0-9]*}
    syntax LocalVar ::= String
    syntax LocalVar ::=  Token{[\%][a-z \. \_ \- \$][0-9 a-z \. \_ \- \$]*}
    syntax LocalVar ::= Token{[\%]"\"" ((~[\"\n\r\\]) | (((([\\][nrtf\"\\]) | ([\\][x][0-9a-fA-F][0-9a-fA-F])) | ([\\][u][0-9a-fA-F][0-9a-fA-F][0-9a-fA-F][0-9a-fA-F])) | ([\\][U][0-9a-fA-F][0-9a-fA-F][0-9a-fA-F][0-9a-fA-F][0-9a-fA-F][0-9a-fA-F][0-9a-fA-F][0-9a-fA-F])))* "\""}
                    [regex("[\\\"](([^\\\"\\n\\r\\\\])|([\\\\][nrtf\\\"\\\\])|([\\\\][x][0-9a-fA-F]{2})|([\\\\][u][0-9a-fA-F]{4})|([\\\\][U][0-9a-fA-F]{8}))*[\\\"]")]
    syntax GlobalValID ::= Token{[\@][1-9][0-9]*}
    syntax GlobalVar ::= Token{[\@][a-z \. \_ \- \$][0-9 a-z \. \_ \- \$]*}
    syntax LocalVar ::= Token{[\@]"\"" ((~[\"\n\r\\]) | (((([\\][nrtf\"\\]) | ([\\][x][0-9a-fA-F][0-9a-fA-F])) | ([\\][u][0-9a-fA-F][0-9a-fA-F][0-9a-fA-F][0-9a-fA-F])) | ([\\][U][0-9a-fA-F][0-9a-fA-F][0-9a-fA-F][0-9a-fA-F][0-9a-fA-F][0-9a-fA-F][0-9a-fA-F][0-9a-fA-F])))* "\""}
                    [regex("[\\\"](([^\\\"\\n\\r\\\\])|([\\\\][nrtf\\\"\\\\])|([\\\\][x][0-9a-fA-F]{2})|([\\\\][u][0-9a-fA-F]{4})|([\\\\][U][0-9a-fA-F]{8}))*[\\\"]")]

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


/*
    syntax Identifier ::= "@" Id [klabel('globalId)] 
                        | "%" Id [klabel('localId)] 

    syntax Constant ::= Boolean | Int | Float

    syntax Linkage ::= "private" | "internal" | "available_externally" 
                     | "linkonce" | "weak" | "common" | "appending"
                     | "extern_weak" | "linkonce_odr" | "weak_odr" | "external"

    syntax Visibility ::= "default" | "hidden" | "protected"

    syntax DLLStorageClass ::= "dllimport" | "dllexport"

    syntax ThreadLocal ::= "thread_local" "(" ThreadLocalAttr ")" | "thread_local"

    syntax ThreadLocalAttr ::= "localdynamic" | "initialexec" | "localexec"

    syntax UnnamedAttr ::= "unnamed_attr"

    syntax AddrSpace ::= addrspace(Int)

    syntax ExternallyInitialized ::= "externally_initialized"

    syntax GlobalOrConstant ::= "global" | "constant"

    syntax Section ::= section(String)

    syntax Align ::= align(Int)
*/  

endmodule
