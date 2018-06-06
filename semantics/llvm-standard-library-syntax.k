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

    syntax KItem ::= mutexInit(K, K)
    syntax KItem ::= mutexInitCore(K) [strict]
    syntax KItem ::= mutexInitNext(K)
    syntax KItem ::= mutexDestroy(K)
    syntax KItem ::= mutexDestroyCore(K) [strict]
    syntax KItem ::= mutexDestroyNext(K)
    syntax KItem ::= mutexLock(K)
    syntax KItem ::= mutexLockCore(K) [strict]
    syntax KItem ::= mutexLockNext(K)
    syntax KItem ::= mutexTryLock(K)
    syntax KItem ::= mutexTryLockCore(K) [strict]
    syntax KItem ::= mutexTryLockNext(K)
    syntax KItem ::= mutexUnLock(K)
    syntax KItem ::= mutexUnLockCore(K) [strict]
    syntax KItem ::= mutexUnLockNext(K)

    syntax KItem ::= pthreadCreate(K, K, K, K)
    syntax KItem ::= pthreadCreateCore(Int, K, K)
    syntax KItem ::= pthreadJoin(K, K)
    syntax KItem ::= pthreadDetach(K)
    syntax KItem ::= pthreadExit(K)
    syntax KItem ::= pthreadCancel(K)

endmodule
