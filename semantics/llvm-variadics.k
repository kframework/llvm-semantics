// Copyright (c) 2013-2015 K Team. All Rights Reserved.
requires "llvm-syntax.k"
requires "llvm-abstractsyntax.k"
requires "llvm-settings.k"
requires "llvm-helpers.k"
requires "llvm-standard-library-syntax.k"
requires "llvm-syscalls-syntax.k"
requires "llvm-configuration.k"

module LLVM-VARIADICS
    imports LLVM-SYNTAX
    imports LLVM-ABSTRACTSYNTAX
    imports LLVM-SETTINGS
    imports LLVM-HELPERS
    imports LLVM-STANDARD-LIBRARY-SYNTAX
    imports LLVM-SYSCALLS-SYNTAX
    imports LLVM-CONFIGURATION

    syntax KItem ::= valist(List, K)
    syntax KItem ::= vaArg(K, K, K) [strict]

    rule
        <k> theVAArg(Type:KResult, Loc:Loc) => vaArg(Type, Loc, read(i(numBitsPerByte), Loc)) ...</k>

    rule
        <k> vaArg(Type, Loc:Loc, wvalist((ListItem(K:K) VAList:List), _))
            => write(i(numBitsPerByte), wvalist(VAList, Loc), Loc)
            ~> K
        ...</k>

    // TODO a really sketchy rule:
    rule
        0 |Int wvalist(VAList:List, Loc:Loc)
            => wvalist(VAList:List, Loc:Loc)
        [anywhere]

endmodule
