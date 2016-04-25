module CTL-SYNTAX

    /* States and Models */
    syntax State        ::= Id
    syntax StateQuery   ::= succ(State)
                          | pred(State)
    syntax Set          ::= SetItem(State)
    syntax SetState     ::= Set
    syntax Model        ::= SetState

    /* atomic predicates (extend with specific uses) */
    syntax AtomicPred   ::= Id               /* extend with atomic propositions */
                          | State

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
    syntax PathPred     ::= "(" PathPred ")"                [bracket]
                          | StatePred
                          | "not" PathPred
                          > PathPred "or" PathPred          [left]
                          > PathPred "and" PathPred         [left]
                          > PathPred "xor" PathPred         [left]
                          > PathPred "implies" PathPred
                          > PathPred "iff" PathPred
                          | "->" PathPred
                          | "next" PathPred
                          | "--" PathPred "->" PathPred
                          | PathPred "until" PathPred
                          | PathPred "<-"
                          | "prev" PathPred
                          | PathPred "<-" PathPred "--"
                          | PathPred "since" PathPred
                          | "-->" PathPred
                          | "eventually" PathPred
                          | PathPred "<--"
                          | "was" PathPred

endmodule


module CTL-NORMALIZING
    imports CTL-SYNTAX

    /* remove `not`, `or`, `implies`, and `iff` */
    rule    not     C               => ctl-true xor C                       [structural]
    rule C1 or      C2              => (C1 xor C2) xor (C1 and C2)          [structural]
    rule C1 implies C2              => (not C1) or C2                       [structural]
    rule C1 iff     C2              => (C1 and C2) or not (C1 or C2)        [structural]

    /* simplify `xor` */
    rule C          xor C           => ctl-false                            [structural]
    rule ctl-false  xor C           => C                                    [structural]
    rule C          xor ctl-false   => C                                    [structural]

    /* simplify `and` */
    rule ctl-false  and C           => ctl-false                            [structural]
    rule C          and ctl-false   => ctl-false                            [structural]
    rule ctl-true   and C           => C                                    [structural]
    rule C          and ctl-true    => C                                    [structural]
    rule C          and C           => C                                    [structural]

    /* distribute `and` over `xor` */
    rule (C1 xor C2) and C3         => (C1 and C3) xor (C2 and C3)          [structural]

    /* desugar path predicates */
    rule -> P                       => next P                               [structural]
    rule -- P1 -> P2                => P1 until P2                          [structural]
    rule P <-                       => prev P                               [structural]
    rule P2 <- P1 --                => P1 since P2                          [structural]
    rule --> P                      => eventually P                         [structural]
    rule P <--                      => was P                                [structural]
    rule eventually P               => ctl-true until P                     [structural]
    rule was P                      => ctl-true since P                     [structural]

    /* unroll quantified `until` and `since` */
    rule Q:Quant (P1 until P2)      => P2 or (Q (next (Q (P1 until P2))))   [structural]
    rule Q:Quant (P1 since P2)      => P2 or (Q (prev (Q (P1 since P2))))   [structural]

    /* path quantifier on state predicate => drop quantifier */
    rule Q:Quant (S:StatePred)      => S                                    [structural]

endmodule


module SATISFACTION

    /* satsifaction */
    syntax Satis        ::= "satis"
                          | "unsatis"
                          | "(" Satis ")"                   [bracket]
                          > "not" Satis                     [seqstrict]
                          > Satis "xor" Satis               [right, seqstrict]
                          > Satis "and" Satis               [right, seqstrict]
                          | Satis       Satis               [right, seqstrict] /* implicit `and` */
                          > Satis "or"  Satis               [right, seqstrict]
    syntax KResult      ::= Satis

    /* remove `not` and `or` */
    rule not S:Satis            => satis xor S                      [structural]
    rule S1:Satis or S2:Satis   => (S1 xor S2) xor (S1 and S2)      [structural]

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
    syntax States       ::= SetState | StateQuery
    syntax SatisQuery   ::= State           "|=" StatePred
                          | States          "|=" StatePred          [strict(1)]     /* implicit `and` */
                          | Quant States    "|=" StatePred          [strict(2)]
    syntax KResult      ::= SetState
    syntax Satis        ::= SatisQuery

    /* extension of satisfaction to sets of states/paths */
    rule S:Set |= P                     => A S |= P                     [structural]    /* implicit `and` */
    rule A .Set |= SP                   => satis                        [structural]
    rule A (SetItem(S:State) SS) |= P   => (S |= P) and (A SS |= P)     [structural]
    rule E (.Set) |= SP                 => unsatis                      [structural]
    rule E (SetItem(S:State) SS) |= P   => (S |= P) or (E SS |= P)      [structural]

    /* boolean logic */
    rule S:State |= ctl-true            => satis                        [structural]
    rule S:State |= ctl-false           => unsatis                      [structural]
    rule S:State |= S':State            => satis        when S ==K S'   [structural]
    rule S:State |= S':State            => unsatis      when S =/=K S'  [structural]
    rule S:State |= (P1 and P2)         => (S |= P1) and (S |= P2)      [structural]
    rule S:State |= (P1 xor P2)         => (S |= P1) xor (S |= P2)      [structural]

    /* quantified paths */
    rule S:State |= Q:Quant (next P)    => Q succ(S) |= P               [structural]
    rule S:State |= Q:Quant (prev P)    => Q pred(S) |= P               [structural]


    /* testing */
    syntax StateDesc    ::= State "->" SetState "::" StatePred
    syntax ModelDesc    ::= StateDesc
                          | StateDesc ";;" ModelDesc
    syntax ModelQuery   ::= ModelDesc "-----" SatisQuery

    /*
     * syntax Rule         ::= Name
     * syntax Rewrite      ::= Rule
     *                       | Rule "*"
     *                       | Rule ";;" Rule      [right]
     * syntax Optimization ::= Model
     *                         ";; begin optimization"
     *                         ";;" Rewrite
     *                         ";; end optimization"
     */

    syntax KItem        ::= ModelQuery
                          | SatisQuery
                          | buildModel(ModelDesc)
                          | addEdges(State,SetState)
                          | addEdge(State,State)
                          | addBackEdge(State,State)

    rule addEdges(S:State, .Set) => .
    rule addEdges(S:State, SetItem(S1:State) SS) => addEdge(S,S1) ~> addEdges(S,SS)

    rule MD:ModelDesc ----- S:SatisQuery            => buildModel(MD) ~> S
    rule buildModel(SD:StateDesc ;; MD:ModelDesc)   => buildModel(SD) ~> buildModel(MD)

    rule <k> buildModel(S:State -> SS:SetState :: SP:StatePred)
                => addEdges(S,SS) ... </k>
         <atomic> (.Map => S|->SP) SPS:Map </atomic>

    rule <k> addEdge(S:State, S':State) => . </k>
         <succs> ... S |-> ((.Set => SetItem(S')) SS) ... </succs>
    rule <k> addEdge(S:State, S':State) => . </k>
         <succs> (.Map => S|->SetItem(S')) Succs:Map </succs>
         when notBool (S in keys(Succs))

    rule <k> addBackEdge(S:State, S':State) => . </k>
         <prevs> ... S |-> ((.Set => SetItem(S')) SS) ... </prevs>
    rule <k> addBackEdge(S:State, S':State) => . </k>
         <prevs> (.Map => S|->SetItem(S')) Prevs:Map </prevs>
         when notBool (S in keys(Prevs))

    configuration
        <ctl>
            <k> $PGM:ModelQuery </k>
            <succs> .Map </succs>
            <prevs> .Map </prevs>
            <atomic> .Map </atomic>
        </ctl>

endmodule
