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
                          | "succ" "(" Model "," State ")"
                          | "pred" "(" Model "," State ")"
    syntax Path         ::= State
                          | State ";" Path
    syntax SetPath      ::= Path
                          | Path SetPath
                          | "<--" State PathQuant
                          | PathQuant State "-->"
    syntax Model        ::= SetState

    /* CTL* predicates */
    /*-----------------*/

    /* extend `StatePred` with atomic predicates via sub-sorting */
    syntax PathQuant    ::= "A" | "E"
    syntax StatePred    ::= State                                           /* implicit `is-state` */
                          | "(" StatePred ")"   [bracket]
                          | "ctl-false"
                          | "ctl-true"
                          | "not" StatePred
                          > StatePred "or" StatePred
                          > StatePred "and" StatePred
                          > StatePred "implies" StatePred
                          > StatePred "iff" StatePred
                          > PathQuant PathPred

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

    /* CTL* simplification */
    /*---------------------*/

    /* `not` */
    rule not not C          => C                                        [structural]
    rule not ctl-true       => ctl-false                                [structural]
    rule not ctl-false      => ctl-true                                 [structural]

    /* `and` */
    rule C and C            => C                                        [structural]
    rule ctl-true and C     => C                                        [structural]
    rule ctl-false and C    => ctl-false                                [structural]


    /* `or` */
    rule C or C             => C                                        [structural]
    rule ctl-true or C      => ctl-true                                 [structural]
    rule ctl-false or C     => C                                        [structural]

    /* `implies` and `iff` */
    rule C1 implies C2      => (not C1) or C2                           [structural]
    rule C1 iff C2          => (C1 and C2) or (not C1 and not C2)       [structural]


    /* CTL* semantics */
    /*----------------*/

    /* Satsifaction relation */
    syntax Bool         ::= "(" Model "," State ")" "|=" StatePred
                          | "(" Model "," SetState ")" "|=" StatePred       /* implicit and */
                          | "(" Model "," Path ")" "|=" PathPred
                          | "(" Model "," SetPath ")" "|=" PathPred         /* implicit and */

    /* Satisfaction calculation over StatePred */
    rule (M, S:State) |= ctl-true => true                           [structural]
    rule (M, S:State) |= ctl-false => false                         [structural]
    rule (M, S:State) |= (N':NodeLabel):StatePred => N ==K N'           [structural]
    rule (M, S:State) |= (not S):StatePred => notBool ((M,N) |= S)      [structural]
    rule (M, S:State) |= (S1 and S2):StatePred
                 => ((M,N) |= S1) andBool ((M,N) |= S2)      [structural]
    rule (M, S:State) |= (S1 or S2):StatePred
                 => ((M,N) |= S1) orBool ((M,N) |= S2)       [structural]
    rule (M, S:State) |= (A P):PathPred
                 => (M, N) |= not (E not P)                  [structural]
    rule (M, S:State) |= (E P):PathPred
                            => (M, paths(M, N)) |= P                    [structural]
    /*rule (M, N:NodeLabel) |= (E P):PathPred
                            => ? */
    /* TODO: finish E P rule. Perhaps have to break it up into `or`s over paths
     * starting at the pred/succ nodes? */

    /* Satisfaction calculation over PathPred */
    rule (M, (N0,Ns):NodeLabels) |= S:StatePred
            => (M, N0) |= S
            if N0,Ns is path in M                                       [structural]
    rule (M, Ns:NodeLabels) |= (not P):PathPred
            => notBool ((M,Ns) |= P)
            if Ns is path in M                                          [structural]
    rule (M, Ns:NodeLabels) |= (P1 and P2):PathPred
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
