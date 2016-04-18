requires "llvm-syntax.k"

module CTL

    /* CTL* models */
    /*-------------*/

    /* TODO: Perhaps we have a `Model` configuration which must have some
     * ability to query for `succ(NodeLabel)` and `pred(NodeLabel)` from. Then
     * someone must just specify how the `Model` configuration is structured.
     */

    /*configuration <T>
                    <k> </k>
                    <model> .Map </model>
                  </T>*/

    /* a CTL* model defines the NodeLabels and succ/pred functions */
    syntax State        ::= Id
    syntax SetState     ::= State
                          | State SetState
                          | succ(Model, State)
                          | pred(Model, State)
    syntax Path         ::= State
                          | State ";" Path
                          | "(" Path ")"        [bracket]
    syntax SetPath      ::= Path
                          | Path SetPath
                          | "<-" State
                          | State "->"
    syntax Model        ::= SetState

    /* CTL* predicates */
    /*-----------------*/

    /* extend `StatePred` with atomic predicates via sub-sorting */
    syntax Quant        ::= "A" | "E"
    syntax StatePred    ::= "(" StatePred ")"   [bracket]
                          | "ctl-false"
                          | "ctl-true"
                          | "not" StatePred
                          > StatePred "or" StatePred
                          > StatePred "and" StatePred
                          > StatePred "implies" StatePred
                          > StatePred "iff" StatePred
                          > Quant PathPred
                          /*| State                                            implicit `is-state` */

    syntax PathPred     ::= "(" PathPred ")"    [bracket]
                          | StatePred
                          | "not" PathPred
                          > PathPred "or" PathPred
                          > PathPred "and" PathPred
                          > PathPred "implies" PathPred
                          > PathPred "iff" PathPred
                          | "->" PathPred                                   /* `next` */
                          | "--" PathPred "->" PathPred                     /* `until` */
                          | PathPred "<-"                                   /* `pred` */
                          | PathPred "<-" PathPred "--"                     /* `since` */

    /* CTL* negative normal form */
    /*---------------------------*/

    /* `not` */
    rule not not C          => C                                        [structural]
    rule not ctl-true       => ctl-false                                [structural]
    rule not ctl-false      => ctl-true                                 [structural]

    /* `and` */
    rule C and C            => C                                        [structural]
    rule ctl-true and C     => C                                        [structural]
    rule ctl-false and C    => ctl-false                                [structural]
    rule not (C1 and C2)    => (not C1) or (not C2)                     [structural]

    /* `or` */
    rule C or C             => C                                        [structural]
    rule ctl-true or C      => ctl-true                                 [structural]
    rule ctl-false or C     => C                                        [structural]
    rule not (C1 or C2)     => (not C1) and (not C2)                    [structural]

    /* `implies` and `iff` */
    rule C1 implies C2      => (not C1) or C2                           [structural]
    rule C1 iff C2          => (C1 and C2) or (not C1 and not C2)       [structural]

    /* Path quantifiers */
    rule not (A P)          => E (not P)                                [structural]
    rule not (E P)          => A (not P)                                [structural]

    /* Path predicates */
    rule not (-> P)         => -> (not P)                               [structural]
    rule not (-- P1 -> P2)  => -- not P2 -> not (P1 or P2)              [structural]
    rule not (P <-)         => (not P) <-                               [structural]
    rule not (P2 <- P1 --)  => not (P1 or P2) <- not P2 --              [structural]

    /* TODO: Should we go to ANF instead of CNF? ANF would have the benefit that
     * if there is no working assignment to the predicates, it will discover it
     * more "syntactically" without having to calculate the atomic predicates.
     * Below are the rules to go to ANF (commented out for now).
     *
     * Perhaps what we could do is store, for each property we are trying to
     * prove, the ANF polynomial over the atomic predicates for that property.
     * If it's unsatisfiable, the ANF polynomial will reduce to ctl-false for us
     * automatically, but otherwise we'll have the ANF polynomials of all the
     * properties we're interested in for analysis/optimization. We then just
     * have to pick which optimization we want to actually do, which tells us
     * which polynomials we have to solve. Then we `and` those polynomials
     * together for a new one (and also know immediately if it's satisfiable or
     * not, though we still have to search for a satisfying assignment).
     */

    /*
     * syntax StatePred    ::= StatePred "xor" StatePred
     * syntax PathPred     ::= PathPred "xor" PathPred
     *
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
                          | "(" Model "," Path           ")" "|=" PathPred
                          | "(" Model "," Quant SetPath  ")" "|=" PathPred

    /* Satisfaction definition */
    rule (M, S) |= ctl-true     => true                                 [structural]
    rule (M, S) |= ctl-false    => false                                [structural]
    /*rule (M, S) |= SP:State   => S ==K SP                             [structural]*/
    rule (M, S) |= not SP       => notBool ((M,S) |= SP)                [structural]
    rule (M, S) |= S1 and S2    => ((M,S) |= S1) andBool ((M,S) |= S2)  [structural]
    rule (M, S) |= S1 or S2     => ((M,N) |= S1) orBool ((M,N) |= S2)   [structural]

    /* Conversion of path quantifiers which are over actual Path subsort */
    rule (M, S) |= Q:Quant (-> P)   => (M, Q succ(M, S)) |= P           [structural]
    rule (M, S) |= Q:Quant (P <-)   => (M, Q pred(M, S)) |= P           [structural]

    rule (M, S) |= Q:Quant (-- P1 -> P2)
                => (M, S) |= P2 or Q (-> (Q (-- P1 -> P2)))             [structural]
    rule (M, S) |= Q:Quant (P2 <- P1 --)
                => (M, S) |= P2 or Q ((Q (P2 <- P1 --)) <-)             [structural]

    /* TODO: Do we handle a formula like `(M, S) |= A phi`, where `phi` is some
     * atomic predicate? I don't think this does. Does that mean we are actually
     * still just in CTL?
     */

    /* Satisfaction calculation over PathPred */
    rule (M, (S;P):Path) |= SP:StatePred    => (M, S) |= SP             [structural]
    rule (M, P:Path) |= not PP              => notBool ((M,P) |= PP)    [structural]
    rule (M, ) |= (P1 and P2):PathPred
            => ((M,Ns) |= P1) andBool ((M,Ns) |= P2)
            if Ns is path in M                                          [structural]
    rule (M, Ns:NodeLabels) |= (P1 or P2):PathPred
            => ((M,Ns) |= P1) orBool ((M,Ns) |= P2)
            if Ns is path in M                                          [structural]
    rule (M, (N0, Ns):NodeLabels) |= (-> P):PathPred
            => (M, Ns) |= P
            if Ns is path in M                                          [structural]
    rule (M, (N0, Ns):NodeLabels) |= (-- P1 -> P2):PathPred
            => ((M, (N0,Ns)) |= P2)
                    orBool
               (((M, (N0, Ns)) |= P1) andBool ((M, Ns) |= (-- P1 -> P2)))
            if Ns is path in M                                          [structural]
    rule (M, (N0, Ns):NodeLabels) |= (P <-):PathPred
            => (M, Ns) |= P
            if Ns is path in M                                          [structural]
    rule (M, (N0,Ns):NodeLabels) |= (P2 <- P1 --):PathPred
            => ((M, (N0,Ns)) |= P2)
                    orBool
               (((M, (N0, Ns)) |= P1) andBool ((M, Ns) |= (P2 <- P1 --)))
            if N0,Ns is path in M                                       [structural]

    /* TODO: Should we just switch to regular CTL? CTL* can express more
     * properties, but also seems harder to implement. The claim is it is as
     * efficient as LTL though (PSPACE).
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
