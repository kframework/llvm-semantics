// 
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

    rule [select-vector]:
        select(vectorTypeValue(T1:KResult, N:Int), I:KResult, A:K, B:K)
                => applySelects('select(.KList), normalizingInt(getIntType(T1), I), A, B)

    rule [select-single]:
        select(integerType(1), I:KResult, A:K, B:K)
                => applySelects('select(.KList), normalizingInt(integerType(1), I), A, B)

endmodule
