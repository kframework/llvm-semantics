// Copyright (c) 2013-2015 K Team. All Rights Reserved.
requires "llvm-syntax.k"
requires "llvm-abstractsyntax.k"
requires "llvm-settings.k"
requires "llvm-helpers.k"
requires "llvm-standard-library-syntax.k"
requires "llvm-syscalls-syntax.k"
requires "llvm-configuration.k"

module LLVM-SELECTION
    imports LLVM-SYNTAX
    imports LLVM-ABSTRACTSYNTAX
    imports LLVM-SETTINGS
    imports LLVM-HELPERS
    imports LLVM-STANDARD-LIBRARY-SYNTAX
    imports LLVM-SYSCALLS-SYNTAX
    imports LLVM-CONFIGURATION

    rule [select-false]:
        select(Type:KResult, I:Int, _, K:K) => K
        when unsigned(Type, I) ==Int 0
    rule [select-true]:
        select(Type:KResult, I:Int, K:K, _) => K
        when unsigned(Type, I) >Int 0

endmodule
