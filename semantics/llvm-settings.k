// Copyright (c) 2013-2015 K Team. All Rights Reserved.
requires "llvm-syntax.k"
requires "llvm-abstractsyntax.k"

module LLVM-SETTINGS
    imports LLVM-SYNTAX
    imports LLVM-ABSTRACTSYNTAX

    syntax Int ::= "numBitsPerByte" [function]
    rule numBitsPerByte => 8

    syntax Int ::= "numBytesPerPointer" [function]
    rule numBytesPerPointer => 4

    syntax Int ::= "startMemoryLoc" [function]
    rule startMemoryLoc => randomRandom(37)
endmodule
