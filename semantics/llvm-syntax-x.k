module LLVM-SYNTAX-X

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

endmodule
