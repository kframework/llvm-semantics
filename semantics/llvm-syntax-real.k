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
    syntax LocalVar ::=  Token{[\%][a-z \. \_ \- \$][0-9 a-z \. \_ \- \$]*}
    syntax GlobalValID ::= Token{[\@][1-9][0-9]*}
    syntax GlobalVar ::= Token{[\@][a-z \. \_ \- \$][0-9 a-z \. \_ \- \$]*}

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
