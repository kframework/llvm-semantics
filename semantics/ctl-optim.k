module CTL-SYNTAX

    /* States and Models */
    syntax State        ::= Id
    syntax SetState     ::= State
                          | State ";" SetState
                          | succ(Model, State)
                          | pred(Model, State)
    syntax Model        ::= SetState


    /* atomic predicates (extend with specific uses) */
    syntax AtomicPred   ::= State               /* extend with atomic propositions */

    /* state predicates (atomics with boolean logic added) */
    syntax Quant        ::= "A" | "E"
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

    /* path predicates (states with path descriptors added) */
    syntax PathPred     ::= "(" PathPred ")"    [bracket]
                          | StatePred
                          | "not" PathPred
                          > PathPred "or" PathPred          [left]
                          > PathPred "and" PathPred         [left]
                          > PathPred "xor" PathPred         [left]
                          > PathPred "implies" PathPred
                          > PathPred "iff" PathPred
                          | "next" PathPred             | "->" PathPred
                          | PathPred "until" PathPred   | "--" PathPred "->" PathPred
                          | "prev" PathPred             | PathPred "<-"
                          | PathPred "since" PathPred   | PathPred "<-" PathPred "--"
                          | "eventually" PathPred       | "-->" PathPred
                          | "dominatedBy" PathPred      | PathPred "<--"

    /* satsifaction relation (only have CTL, not CTL* here) */
    syntax Bool         ::= "(" Model "," State          ")" "|=" StatePred
                          | "(" Model "," Quant SetState ")" "|=" StatePred

    /* TODO: Paths don't seem to make much sense (especially in the presence of
     * backwards temporal operators). For example, what should be the correct
     * interpretation of `(M, S0 . S1 . P) |= PP <-`? That formula specifies a
     * path for the path-predicate to be true over, the predicate says that in
     * the *previous* state that `PP` should be true. We don't even have access
     * to the previous state though! Should it generate a backwards path from
     * the model to test `PP` over? Which backwards path should it generate?
     */
    /*
     * syntax Path         ::= "selfloop"
     *                       | State "." Path
     *                       | "(" Path ")"        [bracket]
     * syntax SetPath      ::= Path
     *                       | Path ";" SetPath
     *                       | "<-" State
     *                       | State "->"
     * syntax Bool         ::= "(" Model "," Path           ")" "|=" PathPred
     *                       | "(" Model "," Quant SetPath  ")" "|=" PathPred
     */
endmodule


module CTL-NORMALIZING
    imports CTL-SYNTAX

    /* desugaring path predicates */
    rule -> P                   => next P                               [structural]
    rule -- P1 -> P2            => P1 until P2                          [structural]
    rule P <-                   => prev P                               [structural]
    rule P2 <- P1 --            => P1 since P2                          [structural]
    rule --> P                  => eventually P                         [structural]
    rule P <--                  => dominatedBy P                        [structural]
    rule eventually P           => ctl-true until P                     [structural]
    rule dominatedBy P          => ctl-true since P                     [structural]
    rule Q:Quant (P1 until P2)  => P2 or Q (next (P1 until P2))         [structural]
    rule Q:Quant (P1 since P2)  => P2 or Q (prev (P1 since P2))         [structural]

    /* desugaring `xor`, `iff`, `implies` */
    rule C1 xor C2              => (C1 and not C2) or (C2 and not C1)   [structural]
    rule C1 implies C2          => (not C1) or C2                       [structural]
    rule C1 iff C2              => (C1 and C2) or not (C1 or C2)        [structural]

    /* negative normal form */
    rule not not C              => C                                    [structural]
    rule not ctl-true           => ctl-false                            [structural]
    rule not ctl-false          => ctl-true                             [structural]
    rule not (C1 and C2)        => (not C1) or (not C2)                 [structural]
    rule not (C1 or C2)         => (not C1) and (not C2)                [structural]
    rule not (A P)              => E (not P)                            [structural]
    rule not (E P)              => A (not P)                            [structural]
    rule not (next P)           => next (not P)                         [structural]
    rule not (P1 until P2)      => (not P2) until not (P1 or P2)        [structural]
    rule not (prev P)           => prev (not P)                         [structural]
    rule not (P1 since P2)      => (not P2) since not (P1 or P2)        [structural]

    /* short-circuit `and` and `or` */
    rule C and C                => C                                    [structural]
    rule ctl-true and C         => C                                    [structural]
    rule C and ctl-true         => C                                    [structural]
    rule ctl-false and C        => ctl-false                            [structural]
    rule C and ctl-false        => ctl-false                            [structural]
    rule C or C                 => C                                    [structural]
    rule ctl-true or C          => ctl-true                             [structural]
    rule C or ctl-true          => ctl-true                             [structural]
    rule ctl-false or C         => C                                    [structural]
    rule C or ctl-false         => C                                    [structural]

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
endmodule


module CTL-SEMANTICS
    imports CTL-NORMALIZING

    /* Atomic predicates */
    rule (M, S) |= not AP:AtomicPred    => notBool ((M, S) |= AP)       [structural]
    rule (M, S) |= S':State             => S ==K S'                     [structural]

    /* Extension of satisfaction to sets of states/paths */
    rule (M, Q (S:State)) |= SP
                        => (M, S) |= SP                                 [structural]
    rule (M, A (S ; SS)) |= P
                        => ((M, S) |= P) andBool ((M, A SS) |= P)       [structural]
    rule (M, E (S ; SS)) |= P
                        => ((M, S) |= P) orBool ((M, E SS) |= P)        [structural]

    /* boolean logic */
    rule (M, S) |= ctl-true     => true                                 [structural]
    rule (M, S) |= ctl-false    => false                                [structural]
    rule (M, S) |= not SP       => notBool ((M,S) |= SP)                [structural]
    rule (M, S) |= S1 and S2    => ((M,S) |= S1) andBool ((M,S) |= S2)  [structural]
    rule (M, S) |= S1 or S2     => ((M,N) |= S1) orBool ((M,N) |= S2)   [structural]

    /* quantified paths (`until` and `since` are made into `next` and `prev`) */
    rule (M, S) |= Q:Quant (next P) => (M, Q succ(M, S)) |= P           [structural]
    rule (M, S) |= Q:Quant (prev P) => (M, Q pred(M, S)) |= P           [structural]

    /* path quantifier on state predicate => drop quantifier */
    rule (M, S) |= Q:Quant (SP:StatePred) => (M, S) |= SP               [structural]

    /* TODO: Should we add a `when` clause which makes sure the predicate hasn't
     * already been checked on the previous/next nodes? Is this what Lasso would
     * essentially do? Is there a better way?
     */
endmodule
