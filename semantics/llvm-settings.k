//
requires "llvm-syntax.k"
requires "llvm-abstractsyntax.k"

module LLVM-SETTINGS
    imports LLVM-SYNTAX
    imports LLVM-ABSTRACTSYNTAX

    syntax Int ::= "numBitsPerByte" [function]
    rule numBitsPerByte => 8

    syntax Int ::= "numOfMaxSpecuation" [function]
    rule numOfMaxSpecuation => 10

    syntax Int ::= "numOfReservations" [function]
    rule numOfReservations => 20

    syntax Int ::= "numBytesPerPointer" [function]
    rule numBytesPerPointer => 4

    syntax Int ::= "startMemoryLoc" [function]
    rule startMemoryLoc => randomRandom(37)
endmodule
