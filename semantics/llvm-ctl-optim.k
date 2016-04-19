requires "llvm-syntax.k"

module CTL

    /* State, Path, and Model syntax */
    /*-------------------------------*/

    /* State and SetState */
    syntax State        ::= Id
    syntax SetState     ::= State
                          | State ";" SetState
                          | succ(Model, State)
                          | pred(Model, State)

    /* Path and SetPath */
    /* TODO: Paths don't seem to make much sense (especially in the presence of
     * backwards temporal operators). For example, what should be the correct
     * interpretation of `(M, S0 . S1 . P) |= PP <-`? That formula specifies a
     * path for the path-predicate to be true over, the predicate says that in
     * the *previous* state that `PP` should be true. We don't even have access
     * to the previous state though! Should it generate a backwards path from
     * the model to test `PP` over? Which backwards path should it generate?
     */
    /*syntax Path         ::= "selfloop"
                          | State "." Path
                          | "(" Path ")"        [bracket]
    syntax SetPath      ::= Path
                          | Path ";" SetPath
                          | "<-" State
                          | State "->"
    */

    /* A Model is a SetState */
    syntax Model        ::= SetState

    /* CTL* syntax */
    /*-------------*/

    syntax Quant        ::= "A" | "E"

    /* extend `AtomicPred` with atomic predicates for your language */
    /* here the implicit `is-state` predicate is supplied */
    syntax AtomicPred   ::= State

    syntax StatePred    ::= AtomicPred
                          | "(" StatePred ")"   [bracket]
                          | "ctl-false"
                          | "ctl-true"
                          | "not" StatePred
                          > StatePred "or" StatePred        [left]
                          > StatePred "and" StatePred       [left]
                          > StatePred "xor" StatePred       [left]
                          > StatePred "implies" StatePred
                          > StatePred "iff" StatePred
                          > Quant PathPred

    syntax PathPred     ::= "(" PathPred ")"    [bracket]
                          | StatePred
                          | "not" PathPred
                          > PathPred "or" PathPred          [left]
                          > PathPred "and" PathPred         [left]
                          > PathPred "xor" PathPred         [left]
                          > PathPred "implies" PathPred
                          > PathPred "iff" PathPred
                          | "next" PathPred
                          | "->" PathPred
                          | PathPred "until" PathPred
                          | "--" PathPred "->" PathPred
                          | "prev" PathPred
                          | PathPred "<-"
                          | PathPred "since" PathPred
                          | PathPred "<-" PathPred "--"
                          | "-->" PathPred
                          | "eventually" PathPred
                          | PathPred "<--"
                          | "dominatedBy" PathPred

    /* CTL* simplification */
    /*---------------------*/

    /* desugaring path predicates */
    rule -> P               => next P                                   [structural]
    rule -- P1 -> P2        => P1 until P2                              [structural]
    rule P <-               => prev P                                   [structural]
    rule P2 <- P1 --        => P1 since P2                              [structural]
    rule --> P              => eventually P                             [structural]
    rule P <--              => dominatedBy P                            [structural]
    rule eventually P       => ctl-true until P                         [structural]
    rule dominatedBy P      => ctl-true since P                         [structural]

    /* quantifier normal form */

    /* negative normal form */
    rule not not C          => C                                        [structural]
    rule not ctl-true       => ctl-false                                [structural]
    rule not ctl-false      => ctl-true                                 [structural]
    rule not (C1 and C2)    => (not C1) or (not C2)                     [structural]
    rule not (C1 or C2)     => (not C1) and (not C2)                    [structural]
    rule not (A P)          => E (not P)                                [structural]
    rule not (E P)          => A (not P)                                [structural]
    rule not (next P)       => next (not P)                             [structural]
    rule not (P1 until P2)  => (not P2) until not (P1 or P2)            [structural]
    rule not (prev P)       => prev (not P)                             [structural]
    rule not (P1 since P2)  => (not P2) since not (P1 or P2)            [structural]

    /* short-circuit `and` and `or` */
    rule C and C            => C                                        [structural]
    rule ctl-true and C     => C                                        [structural]
    rule ctl-false and C    => ctl-false                                [structural]
    rule C or C             => C                                        [structural]
    rule ctl-true or C      => ctl-true                                 [structural]
    rule ctl-false or C     => C                                        [structural]

    /* desugaring `xor`, `iff`, `implies` */
    rule C1 xor C2          => (C1 and not C2) or (C2 and not C1)       [structural]
    rule C1 implies C2      => (not C1) or C2                           [structural]
    rule C1 iff C2          => (C1 and C2) or (not C1 and not C2)       [structural]

    /* algebraic normal form */
    /* TODO: Should we go to ANF instead? We would know (without having to
     * search assignments) if a formula is unsatisfiable.
     */
    /*
     * rule not C              => ctl-true xor C                           [structural]
     * rule C1 or C2           => (C1 xor C2) xor (C1 and C2)              [structural]
     * rule C xor C            => ctl-false                                [structural]
     * rule C xor ctl-false    => C                                        [structural]
     * rule (C1 xor C2) and C3 => (C1 and C3) xor (C2 and C3)              [structural]
     */

    /* CTL* semantics */
    /*----------------*/

    /* Satsifaction relation */
    syntax Bool         ::= "(" Model "," State          ")" "|=" StatePred
                          | "(" Model "," Quant SetState ")" "|=" StatePred
                          /*| "(" Model "," Path           ")" "|=" PathPred
                           *| "(" Model "," Quant SetPath  ")" "|=" PathPred
                           */

    /* Atomic predicates */
    rule (M, S) |= not AP:AtomicPred    => notBool ((M, S) |= AP)       [structural]
    rule (M, S) |= S':State             => S ==K S'                     [structural]

    /* Extension of satisfaction to sets of states/paths */
    rule (M, Q (S:State)) |= SP => (M, S) |= SP                         [structural]
    /*rule (M, Q (P:Path)) |= PP  => (M, P) |= PP                         [structural]*/
    rule (M, A (S ; SS)) |= P
                => ((M, S) |= P) andBool ((M, A SS) |= P)               [structural]
    rule (M, E (S ; SS)) |= P
                => ((M, S) |= P) orBool ((M, E SS) |= P)                [structural]

    /* basic satisfaction */
    rule (M, S) |= ctl-true     => true                                 [structural]
    rule (M, S) |= ctl-false    => false                                [structural]
    rule (M, S) |= not SP       => notBool ((M,S) |= SP)                [structural]
    rule (M, S) |= S1 and S2    => ((M,S) |= S1) andBool ((M,S) |= S2)  [structural]
    rule (M, S) |= S1 or S2     => ((M,N) |= S1) orBool ((M,N) |= S2)   [structural]

    /* Conversion of path quantifiers which are over actual Path subsort */
    rule (M, S) |= Q:Quant (next P) => (M, Q succ(M, S)) |= P           [structural]
    rule (M, S) |= Q:Quant (prev P) => (M, Q pred(M, S)) |= P           [structural]
    rule Q:Quant (P1 until P2)      => P2 or Q (next (P1 until P2))     [structural]
    rule Q:Quant (P1 since P2)      => P2 or Q (prev (P1 since P2))     [structural]
    /*rule (M, S) |= Q:Quant (P1 until P2)
                => (M, S) |= P2 or Q (next (Q (P1 until P2)))           [structural]
    rule (M, S) |= Q:Quant (P1 since P2)
                => (M, S) |= P2 or Q (prev (Q (P1 since P2)))           [structural]*/

    /* path quantifier on state predicate => drop quantifier */
    rule (M, S) |= Q:Quant (SP:StatePred) => (M, S) |= SP               [structural]

    /* TODO: Propagationg of temporal operators/support for paths */

    /* TODO: Should we add a `when` clause which makes sure the predicate hasn't
     * already been checked on the previous/next nodes? Is this what Lasso would
     * essentially do? Is there a better way?
     */
endmodule

module CTL-CFG
    imports CTL

    syntax BasicBlock   ::= "skip"
    syntax NodeLabel    ::= "enter"
                          | "exit"


    /* TODO: Define semantics of CFGs */

endmodule

module CTL-CFG-DEFUSE
    imports CTL-CFG

    syntax VarId        ::= Id                              /* VarId < ExpId in future? */
    syntax NodeLabel    ::= "uses" VarId
                          | "defines" VarId

endmodule

module CTL-CFG-DEFUSE-DEADCODE
    imports CTL-CFG-DEFUSE

    syntax StatePred        ::= "deadcode"
    rule deadcode => defines V:VarId
                        and
                     A (-- not uses V -> exit)                          [structural]
    /*rule <k> N:Label => skip ... </k>
        when (M:Model, N:Label) |= deadcode*/

    /* TODO: Fix this by using configurations from LLVM */

endmodule

module CTL-CFG-DEFUSE-LLVM
    imports CTL-CFG-DEFUSE-DEADCODE
    imports LLVM-SYNTAX

    /* What are the NodeLabel and Model for LLVM? */
    syntax NodeLabel    ::= LabelStringConstant
    /* The below is already defined */
    /* syntax BasicBlock    ::= BasicBlock */

    /* So how do we get successors and precessors in these models? */
    /*rule <k> succ(N, (M : I T):BasicBlock BBL) => get_successors (T) ... </k>
            when N ==K M
    rule <k> succ(N, (M : I T):BasicBlock BBL) => succ(N, BBL) ... </k>
            when N =/=K M*/
    /* TODO: Handle unlabeled BasicBlock from LLVM syntax */
    /* TODO: Handle predecessors */

    /* Now we have to provide the semantics of "uses" and "defines" */
    syntax VarId        ::= LocalVar
                          | GlobalVar
    rule <k> (M:Model, N:NodeLabel) |= uses V:VarId => false ... </k>
    rule <k> (M:Model, N:NodeLabel) |= defines V:VarId => false ... </k>
    /* TODO: These definitions are a bit conservative */

    /* Helper for getting successors above */
    /*syntax NodeLabels   ::= get_successors(BBTerminatorInstruction)
    rule <k> get_successors ( ret N:NonVoidType V:ValueRef IM:InstructionMetadatas )
                => exit ... </k>
    rule <k> get_successors ( ret V:VoidType IM:InstructionMetadatas )
                => exit ... </k>
    rule <k> get_successors ( br LV:LabelValue IM:InstructionMetadatas )
                => LV ... </k>
    rule <k> get_successors ( br I:IntType V:ValueRef , L1:LabelValue , L2:LabelValue IM:InstructionMetadatas )
                => L1, L2, .NodeLabels ... </k>
    rule <k> get_successors ( resume R:ResolvedVal IM:InstructionMetadatas )
                => exit ... </k>
    rule <k> get_successors ( indirectbr R:ResolvedVal , [ LVS:LabelValues ] IM:InstructionMetadatas )
                => LVS ... </k>
    rule <k> get_successors ( switch I:IntType V:ValueRef , DEF:LabelValue
                                [ JT:JumpTable ] IM:InstructionMetadatas )
                => DEF, get_successors(JT) ... </k>
    rule <k> get_successors ( I:IntType CVR:ConstValueRef , LV:LabelValue )
                => LV ... </k>
    rule <k> get_successors ( I:IntType CVR:ConstValueRef , LV:LabelValue JT:JumpTable )
                => LV, get_successors(JT) ... </k>
    rule <k> get_successors ( invoke OCC:OptCallingConv RA:RetAttrs T:Type VR:ValueRef ( PL:ParamList )
                                    FA:FuncAttrs to LV1:LabelValue unwind LV2:LabelValue IM:InstructionMetadatas )
                => LV1, LV2, .NodeLabels ... </k>
    rule <k> get_successors ( LA:LocalAssign invoke OCC:OptCallingConv RA:RetAttrs T:Type VR:ValueRef
                                    ( PL:ParamList ) FA:FuncAttrs
                                    to LV1:LabelValue unwind LV2:LabelValue IM:InstructionMetadatas )
                => LV1, LV2, .NodeLabels ... </k>
    rule <k> get_successors ( unreachable InstructionMetadatas )
                => exit ... </k>
    */

    /* Take a program and generate appropriate instance of CTL-CFG for it */
    /*rule <k> D:Function => to_ctl_spec(D) </k>*/
    /* TODO: Only handling functions. Should handle any program by sequencing
     * through each function in turn
     */

    rule <k> (OL OVS ODSC FH { BBL }):Function => BBL </k>
    rule <k> (BB BBL):BasicBlockList => BBL </k>
         <model> . => BB ... </model>
    /* TODO: Make models work above so this works here */

endmodule


module LLVM-CTL-OPTIM
    imports CTL-CFG-DEFUSE-LLVM
endmodule
