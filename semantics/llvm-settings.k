//
requires "llvm-syntax.k"
requires "llvm-abstractsyntax.k"

module LLVM-SETTINGS
    imports LLVM-SYNTAX
    imports LLVM-ABSTRACTSYNTAX

    syntax Int ::= "numBitsPerByte" [function]
    rule numBitsPerByte => 8

    syntax Int ::= "numOfMaxInQueue" [function]
    rule numOfMaxInQueue => 20

    syntax Int ::= "maxSpecGap"  [function]
    rule maxSpecGap => 4

    syntax Int ::= "numOfReservations" [function]
    rule numOfReservations => 20

    syntax Int ::= "numBytesPerPointer" [function]
    rule numBytesPerPointer => 8

    syntax Int ::= "structAlign" [function]
    rule structAlign => 8

    syntax Int ::= "startMemoryLoc" [function]
    rule startMemoryLoc => 1

    syntax Int ::= "nullMemoryLoc" [function]
    rule nullMemoryLoc => 0

    syntax Int ::= "defaultAddrSpace" [function]
    rule defaultAddrSpace => 0

    syntax Int ::= "maxStackSize"  [function]
    rule maxStackSize => 2 *Int (10 ^Int 7)

    syntax Int ::= "numBytesFunHeader" [function]
    rule numBytesFunHeader => 20

    syntax Int ::= "numBytesBlockAddress" [function]
    rule numBytesBlockAddress => 8

    syntax Int ::= "staticBlockNum" [function]
    rule staticBlockNum => -1
    
    syntax KItem ::= "blockAddressType" [function]
    rule blockAddressType => pointerTypeValue(integerType(8), 0)

    syntax KItem ::= "vaArgType" [function]
    rule vaArgType => pointerTypeValue(integerType(8), 0)

    syntax Int ::= "maxMemChannel" [function]
    rule maxMemChannel => 2

    syntax KItem ::= "llvmVoidPointerType" [function]
    rule llvmVoidPointerType => integerType(8)

    syntax Int ::= "EAGAIN" [function]
    rule EAGAIN => 1

    syntax Int ::= "EINVAL" [function]
    rule EINVAL => 2

    syntax Int ::= "ESRCH" [function]
    rule ESRCH => 3

    syntax Int ::= "EDEADLK" [function]
    rule EDEADLK => 4

    syntax Int ::= "EBUSY" [function]
    rule EBUSY => 5

    syntax Int ::= "EPERM" [function]
    rule EPERM => 6

    syntax Int ::= "PTHREAD_CANCELED" [function]
    rule PTHREAD_CANCELED => -1

    syntax Int ::= "PTHREAD_RUNNING" [function]
    rule PTHREAD_RUNNING => 0

    syntax Int ::= "PTHREAD_TERMINATED" [function]
    rule PTHREAD_TERMINATED => 1

    syntax Int ::= "maxThreads" [function]
    rule maxThreads => 10000

    syntax KItem ::= "mutexIdType" [function]
    rule mutexIdType => structTypeValue(arrayTypeValue(integerType(64), 5),.TypeList)

endmodule
