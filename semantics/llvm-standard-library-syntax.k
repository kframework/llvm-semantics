//

module LLVM-STANDARD-LIBRARY-SYNTAX

    syntax KItem ::= memcpy(K, K, K)
    syntax KItem ::= memmove(K, K, K)
    syntax KItem ::= memset(K, K, K)

    syntax KItem ::= lifetimeStart(K, K)
    syntax KItem ::= lifetimeEnd(K, K)
    syntax KItem ::= libcStartMainZero(K, K, K, K, K, K)

    syntax KItem ::= vaStart(K)
    syntax KItem ::= vaCopy(K, K)
    syntax KItem ::= vaClose(K)

endmodule
