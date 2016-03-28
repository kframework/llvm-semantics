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
    syntax NodeLabel    ::= Id
    syntax NodeLabels   ::= NodeLabel
                          | NodeLabel "," NodeLabels
                          | succ(NodeLabel,Model)                   /* query for successors */
                          | pred(NodeLabel,Model)                   /* query for predecessors */
    syntax Model        ::= NodeLabels

    /* CTL* predicates */
    /*-----------------*/

    /* extend `State` with atomic predicates via sub-sorting */
    syntax State        ::= NodeLabel                               /* implicit `is-state` */
                          | "(" State ")"                               [bracket]
                          | "ctl-false"
                          | "ctl-true"
                          | "not" State
                          > State "or" State
                          > State "and" State
                          > State "implies" State
                          > State "iff" State
                          > "A" Path
                          | "E" Path

    syntax Path         ::= "(" Path ")"                                [bracket]
                          | State
                          | "not" Path
                          > Path "or" Path
                          > Path "and" Path
                          > Path "implies" Path
                          > Path "iff" Path
                          | "-->" Path                              /* `next` */
                          | "--" Path "->" Path                     /* `until` */
                          | Path "<--"                              /* `pred` */
                          | Path "<-" Path "--"                     /* `since` */

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
    syntax Bool         ::= "(" Model "," NodeLabel ")" "|=" State
                          | "(" Model "," NodeLabels ")" "|=" Path

    /* Satisfaction calculation over State */
    rule (M, N:NodeLabel) |= ctl-true => true                           [structural]
    rule (M, N:NodeLabel) |= ctl-false => false                         [structural]
    rule (M, N:NodeLabel) |= (N':NodeLabel):State => N ==K N'           [structural]
    rule (M, N:NodeLabel) |= (not S):State => notBool ((M,N) |= S)      [structural]
    rule (M, N:NodeLabel) |= (S1 and S2):State
                            => ((M,N) |= S1) andBool ((M,N) |= S2)      [structural]
    rule (M, N:NodeLabel) |= (S1 or S2):State
                            => ((M,N) |= S1) orBool ((M,N) |= S2)       [structural]
    /* rule (M, N:NodeLabel) |= A P => ... */
    /* rule (M, N:NodeLabel) |= E P => ... */
    /* TODO: finish A P and E P rules. Perhaps have to break it up into `or`s
     * and `and`s over paths starting at the pred/succ nodes? */

    /* Satisfaction calculation over Path */
    /*rule (M, Ns:NodeLabels) |= P:Path => false when not (Ns isPathIn M)   [structural]*/
    rule (M, (N0,Ns):NodeLabels) |= S:State => (M, N0) |= S             [structural]
    rule (M, Ns:NodeLabels) |= (not P):Path => notBool ((M,Ns) |= P)    [structural]
    rule (M, Ns:NodeLabels) |= (P1 and P2):Path
                            => ((M,Ns) |= P1) andBool ((M,Ns) |= P2)    [structural]
    rule (M, Ns:NodeLabels) |= (P1 or P2):Path
                            => ((M,Ns) |= P1) orBool ((M,Ns) |= P2)     [structural]
    rule (M, (N0, Ns):NodeLabels) |= (--> P):Path => (M, Ns) |= P       [structural]
    rule (M, (N0, Ns):NodeLabels) |= (-- P1 -> P2):Path
                            => ((M, (N0,Ns)) |= P2)
                                orBool
                               (((M, (N0, Ns)) |= P1)
                                    andBool
                                ((M, Ns) |= (-- P1 -> P2)))             [structural]

    /* TODO: Should we just switch to regural CTL? CTL* can express more
     * properties, but also seems harder to implement. The claim is it is as
     * efficient as LTL or CTL to implement though.
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

    syntax NodeLabel    ::= "deadcode"
    syntax State        ::= "deadcode?"
    rule <k> deadcode? =>   ( (defines V:VarId) and
                              (A --not uses V-> exit)
                            ) implies deadcode ... </k>
    rule <k> N:Label => skip ... </k>
        when (M:Model, N:Label) |= deadcode

    /* TODO: Fix this by using configurations for Model */

endmodule

module CTL-CFG-DEFUSE-LLVM
    imports CTL-CFG-DEFUSE-DEADCODE
    imports LLVM-SYNTAX

    /* What are the NodeLabel and Model for LLVM? */
    syntax NodeLabel    ::= LabelStringConstant
    /* The below is already defined */
    /* syntax BasicBlock    ::= BasicBlock */

    /* So how do we get successors and precessors in these models? */
    rule <k> succ(N, (M : I T):BasicBlock BBL) => get_successors (T) ... </k>
            when N ==K M
    rule <k> succ(N, (M : I T):BasicBlock BBL) => succ(N, BBL) ... </k>
            when N =/=K M
    /* TODO: Handle unlabeled BasicBlock from LLVM syntax */
    /* TODO: Handle predecessors */

    /* Now we have to provide the semantics of "uses" and "defines" */
    syntax VarId        ::= LocalVar
                          | GlobalVar
    rule <k> (M:Model, N:NodeLabel) |= uses V:VarId => unsatis ... </k>
    rule <k> (M:Model, N:NodeLabel) |= defines V:VarId => satis ... </k>
    /* TODO: These definitions are a bit conservative */

    /* Helper for getting successors above */
    syntax NodeLabels   ::= get_successors(BBTerminatorInstruction)
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


    /* Take a program and generate appropriate instance of CTL-CFG for it */
    rule <k> D:Function => to_ctl_spec(D) </k>
    /* TODO: Only handling functions. Should handle any program by sequencing
     * through each function in turn
     */

    rule <k> (OL OVS ODSC FH { BBL }):Function => BBL </k>
    rule <k> (BB BBL):BasicBlockList => BBL </k>
         <model> . => BB ... </model>
    /* TODO: Make models work above so this works here */

endmodule
