// 
requires "llvm-syntax.k"
requires "llvm-abstractsyntax.k"
requires "llvm-settings.k"
requires "llvm-helpers.k"
requires "llvm-standard-library-syntax.k"
requires "llvm-syscalls-syntax.k"
requires "llvm-configuration.k"

module LLVM-PHI
    // TODO possibly preprocess PHI
    imports LLVM-SYNTAX
    imports LLVM-ABSTRACTSYNTAX
    imports LLVM-SETTINGS
    imports LLVM-HELPERS
    imports LLVM-STANDARD-LIBRARY-SYNTAX
    imports LLVM-SYSCALLS-SYNTAX
    imports LLVM-CONFIGURATION

    //change second argument of PHI from KLIst to listK(KList)

    rule
        <k> phi(_:K, val(edge(K':K, OldLabel:SymbolicValueRef)), _:ElemList)
            => K' ...</k>
        <cpu> dynInstHold(Num:Int, IN:Int, T:K) </cpu>
        <currBlock> basicBlockNum(Num:Int, Label:K) </currBlock> 
        <prevBlock> basicBlockNum(OldNum:Int, OldLabel) </prevBlock>

    rule
        <k> phi(_:K,
                 val(edge(K:K, Label:SymbolicValueRef)), L:ElemList
                        => L) ...</k>
        <cpu> dynInstHold(Num:Int, IN:Int, T:K) </cpu>
        <currBlock> basicBlockNum(Num:Int, NewLabel:K) </currBlock> 
        <prevBlock> basicBlockNum(OldNum:Int, OldLabel) </prevBlock>
        when OldLabel =/=K Label

    rule
        <k> phi(_:K, L:ElemList) => findPhi(Prev, L) ...</k>
        <cpu> dynInstHold(Num:Int, IN:Int, T:K) </cpu>
        <currBlock> basicBlockNum(Num':Int, Label:K) </currBlock> 
        <reverseChoice>... Num |-> Prev:K ...</reverseChoice>
        requires Num =/=K Num'

    rule <k> findPhi(X:K, L:ElemList) => findPhiAux(Label, L:ElemList) ...</k>
         <currChoice> X |-> Label:K </currChoice>
    
    rule findPhiAux(Label, val(edge(A:K, Label:K)),E:ElemList) => A
    rule findPhiAux(Label:K, val(edge(A:K, Label':K)), E:ElemList)
              => findPhiAux(Label, E)
         requires Label =/=K Label'

endmodule
