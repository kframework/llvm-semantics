module CTL-SYNTAX

    /* States and Models */
    syntax State        ::= Id
    syntax SetState     ::= State
                          | State ";" SetState
                          | succ(Model, State)              [function]
                          | pred(Model, State)              [function]
    syntax Model        ::= Id


    /* atomic predicates (extend with specific uses) */
    syntax AtomicPred   ::= State               /* extend with atomic propositions */

    /* state predicates (atomics with boolean logic added) */
    syntax Quant        ::= "A" | "E"
    syntax StatePred    ::= AtomicPred
                          | "(" StatePred ")"   [bracket]
                          | "ctl-false"
                          | "ctl-true"
                          | "not" StatePred                 [function]
                          > StatePred "or" StatePred        [left, function]
                          > StatePred "and" StatePred       [left, function]
                          > StatePred "xor" StatePred       [left, function]
                          > StatePred "implies" StatePred   [function]
                          > StatePred "iff" StatePred       [function]
                          > Quant PathPred                  [function]

    /* path predicates (states with path descriptors added) */
    syntax PathPred     ::= "(" PathPred ")"                                        [bracket]
                          | StatePred
                          | "not" PathPred                  [function]
                          > PathPred "or" PathPred          [left, function]
                          > PathPred "and" PathPred         [left, function]
                          > PathPred "xor" PathPred         [left, function]
                          > PathPred "implies" PathPred     [function]
                          > PathPred "iff" PathPred         [function]
                          | "->" PathPred                   [function]
                          | "next" PathPred                 [function]
                          | "--" PathPred "->" PathPred     [function]
                          | PathPred "until" PathPred       [function]
                          | PathPred "<-"                   [function]
                          | "prev" PathPred                 [function]
                          | PathPred "<-" PathPred "--"     [function]
                          | PathPred "since" PathPred       [function]
                          | "-->" PathPred                  [function]
                          | "eventually" PathPred           [function]
                          | PathPred "<--"                  [function]
                          | "was" PathPred                  [function]

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
                          | "(" Satis ")"                   [bracket]
                          > "not" Satis                     [function]
                          > Satis "and" Satis               [left, function]
                          > Satis "or"  Satis               [left, function]
                          > Satis "xor" Satis               [left, function]

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

endmodule


module CTL-SEMANTICS
    imports SATISFACTION
    imports CTL-NORMALIZING

    /* satisfaction syntax (only CTL, not CTL*) */
    syntax Satis        ::= "(" Model "," State          ")" "|=" StatePred     [function]
                          | "(" Model "," Quant SetState ")" "|=" StatePred     [function]

    /* extension of satisfaction to sets of states/paths */
    rule (M, Q:Quant (S:State)) |= SP   => (M, S) |= SP                         [structural]
    rule (M, A (S;SS)) |= P             => ((M, S) |= P) and ((M, A SS) |= P)   [structural]
    rule (M, E (S;SS)) |= P             => ((M, S) |= P) or ((M, E SS) |= P)    [structural]

    /* boolean logic */
    rule (M, S) |= ctl-true             => satis                                [structural]
    rule (M, S) |= ctl-false            => unsatis                              [structural]
    rule (M, S) |= S':State             => satis        when S ==K S'           [structural]
    rule (M, S) |= S':State             => unsatis      when S =/=K S'          [structural]
    rule (M, S) |= (P1 and P2)          => ((M,S) |= P1) and ((M,S) |= P2)      [structural]
    rule (M, S) |= (P1 xor P2)          => ((M,S) |= P1) xor ((M,S) |= P2)      [structural]

    /* quantified paths */
    rule (M, S) |= Q:Quant (next P)     => (M, Q succ(M, S)) |= P               [structural]
    rule (M, S) |= Q:Quant (prev P)     => (M, Q pred(M, S)) |= P               [structural]

endmodule



module CTL-OPTIM
    imports CTL-SEMANTICS

    syntax Model        ::= "mymodel"
    syntax State        ::= "s0"
                          | "s1"
                          | "s2"
                          | "s3"
                          | "s4"
                          | "s5"
                          | "enter"
                          | "exit"

    rule succ(mymodel, enter)   => s0
    rule succ(mymodel, s0)      => (s1 ; s2)
    rule succ(mymodel, s1)      => s3
    rule succ(mymodel, s2)      => s4
    rule succ(mymodel, s3)      => s4
    rule succ(mymodel, s4)      => s5
    rule succ(mymodel, s5)      => exit
    rule succ(mymodel, exit)    => exit

    rule pred(mymodel, enter)   => enter
    rule pred(mymodel, s0)      => enter
    rule pred(mymodel, s1)      => s0
    rule pred(mymodel, s2)      => s0
    rule pred(mymodel, s3)      => s1
    rule pred(mymodel, s4)      => (s3 ; s2)
    rule pred(mymodel, s5)      => s4
    rule pred(mymodel, exit)    => s5

endmodule
