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
                          | "was" PathPred              | PathPred "<--"

endmodule


module CTL-NORMALIZING
    imports CTL-SYNTAX

    /* remove `not`, `or`, `implies`, and `iff` */
    rule            not     C           => ctl-true xor C                   [structural]
    rule C1         or      C2          => C1 xor C2 xor (C1 and C2)        [structural]
    rule C1         implies C2          => (not C1) or C2                   [structural]
    rule C1         iff     C2          => (C1 and C2) or not (C1 or C2)    [structural]

    /* simplify `xor` */
    rule C          xor     C           => ctl-false                        [structural]
    rule ctl-false  xor     C           => C                                [structural]
    rule C          xor     ctl-false   => C                                [structural]

    /* simplify `and` */
    rule ctl-false  and     C           => ctl-false                        [structural]
    rule C          and     ctl-false   => ctl-false                        [structural]
    rule ctl-true   and     C           => C                                [structural]
    rule C          and     ctl-true    => C                                [structural]
    rule C          and     C           => C                                [structural]

    /* distribute `and` over `xor` */
    rule (C1 xor C2) and C3             => (C1 and C3) xor (C2 and C3)      [structural]

    /* desugar path predicates */
    rule -> P                           => next P                           [structural]
    rule -- P1 -> P2                    => P1 until P2                      [structural]
    rule P <-                           => prev P                           [structural]
    rule P2 <- P1 --                    => P1 since P2                      [structural]
    rule --> P                          => eventually P                     [structural]
    rule P <--                          => was P                            [structural]
    rule eventually P                   => ctl-true until P                 [structural]
    rule was P                          => ctl-true since P                 [structural]

    /* unroll quantified `until` and `since` */
    rule Q:Quant (P1 until P2)          => P2 or (Q (next (P1 until P2)))   [structural]
    rule Q:Quant (P1 since P2)          => P2 or (Q (prev (P1 since P2)))   [structural]

    /* path quantifier on state predicate => drop quantifier */
    rule Q:Quant (S:StatePred)          => S                                [structural]

endmodule


module SATISFACTION

    /* satsifaction */
    syntax Satis        ::= "satis"
                          | "unsatis"
                          | "fromBool" "(" Bool ")"
                          | "(" Satis ")"                   [bracket]
                          > "not" Satis
                          > Satis "and" Satis               [left]
                          > Satis "or"  Satis               [left]
                          > Satis "xor" Satis               [left]

    /* remove `not` and `or` */
    rule not S:Satis            => satis xor S                      [structural]
    rule S1:Satis or S2:Satis   => S1 xor S2 xor (S1 and S2)        [structural]

    /* simplify `xor` */
    rule S       xor S          => unsatis                          [structural]
    rule unsatis xor S          => S                                [structural]
    rule S       xor unsatis    => S                                [structural]

    /* simplify `and` */
    rule unsatis and S          => unsatis                          [structural]
    rule S       and unsatis    => unsatis                          [structural]
    rule satis   and S          => S                                [structural]
    rule S       and satis      => S                                [structural]
    rule S       and S          => S                                [structural]

    /* distribute `xor` over `and` */
    rule (S1 xor S2) and S3     => (S1 and S3) xor (S2 and S3)      [structural]

    /* interpret booleans as satisfaction */
    rule fromBool(true)         => satis                            [structural]
    rule fromBool(false)        => unsatis                          [structural]

endmodule


module CTL-SEMANTICS
    imports SATISFACTION
    imports CTL-NORMALIZING

    /* satisfaction syntax (only CTL, not CTL*) */
    syntax Satis        ::= "(" Model "," State          ")" "|=" StatePred
                          | "(" Model "," Quant SetState ")" "|=" StatePred

    /* Extension of satisfaction to sets of states/paths */
    rule (M, Q:Quant (S:State)) |= SP       => (M, S) |= SP                             [structural]
    rule (M, A (S;SS)) |= P                 => ((M, S) |= P) and ((M, A SS) |= P)       [structural]
    rule (M, E (S;SS)) |= P                 => ((M, S) |= P) or ((M, E SS) |= P)        [structural]

    /* boolean logic */
    rule (M, S) |= S':State                 => fromBool(S ==K S')                       [structural]
    rule (M, S) |= P1 and P2                => ((M,S) |= P1) and ((M,S) |= P2)          [structural]
    rule (M, S) |= P1 xor P2                => ((M,S) |= P1) xor ((M,S) |= P2)          [structural]

    /* quantified paths (`until` and `since` are made into `next` and `prev`) */
    rule (M, S) |= Q:Quant (next P)         => (M, Q succ(M, S)) |= P                   [structural]
    rule (M, S) |= Q:Quant (prev P)         => (M, Q pred(M, S)) |= P                   [structural]

endmodule


module CTL-OPTIM
    imports CTL-SEMANTICS

    syntax Test ::= "hello"

endmodule
