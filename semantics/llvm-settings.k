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

    syntax Int ::= "maxStackSize"  [function]
    rule maxStackSize => 2 *Int (10 ^Int 7)

    syntax Int ::= "numBytesFunHeader" [function]
    rule numBytesFunHeader => 20

    syntax Int ::= "fixedFunPtrPosition" [function]
    rule fixedFunPtrPosition => -2

endmodule
