requires "llvm-semantics.k"

module CTL-SYNTAX

    /* Node labels */
    /*-------------*/
    syntax NodeLabel    ::= Id
                          | "enter"
                          | "exit"
                          | "skip"
    syntax NodeLabels   ::= List{NodeLabel, ","} [klabel('nodeLabels)]

    /* CTL spatial connectives */
    /*-------------------------*/
    syntax CTLQuant     ::= "A"                                         /* for all paths */
                          | "E"                                         /* exists a path */

    /* CTL patterns */
    /*--------------*/
    syntax CTLAtomic    ::= NodeLabel
    syntax CTLPattern   ::= CTLAtomic                                   /* atomic patterns */
                          | "ct-true"                                   /* true symbol */
                          | PatternName                                 /* defined pattern */
                          | NodeLabel ":" PatternName                   /* label and pattern */
                          | "(" CTLPattern ")" [bracket]                /* parenthesis */
                          | "not" CTLPattern                            /* `not` */
                          > CTLPattern "|" CTLPattern [left]            /* `or` */
                          > CTLPattern "&" CTLPattern [left]            /* `and` */
                          > "--" CTLQuant             ">" CTLPattern    /* `next` */
                          | "--" CTLQuant            "->" CTLPattern    /* `eventually` */
                          | "--" CTLQuant CTLPattern "->" CTLPattern    /* `until` */
                          | CTLPattern "<"  CTLQuant            "--"    /* `pred` */
                          | CTLPattern "<-" CTLQuant            "--"    /* `was` */
                          | CTLPattern "<-" CTLQuant CTLPattern "--"    /* `since` */

    /* Syntax for defining patterns */
    /*------------------------------*/
    syntax PatternArgs  ::= List{CTLPattern, ","}
    syntax PatternName  ::= NodeLabel
                          | NodeLabel "(" PatternArgs ")"
    syntax PatternDef   ::= PatternName "=" CTLPattern "."
    syntax PatternDefs  ::= List{PatternDef, " "} [klabel('patternDefs)]

endmodule

module CTL-SEMANTICS
    imports CTL-SYNTAX

    /* Simplification rules (should we use the builtin #Bool for efficiency?) */
    /*------------------------------------------------------------------------*/

    /* rules for `not` */
    rule not not C:CTLPattern           => C            [structural]

    /* rules for `and` */
    rule C:CTLPattern & C               => C            [structural]
    rule ct-true & C:CTLPattern         => C            [structural]
    rule (not ct-true) & C:CTLPattern   => not ct-true  [structural]

    /* rules for `or` */
    rule C:CTLPattern | C               => C            [structural]
    rule ct-true | C:CTLPattern         => ct-true      [structural]
    rule (not ct-true) | C:CTLPattern   => C            [structural]

    /* CTL Nodes */
    /*-----------*/

    syntax CTLData      ::= NodeLabel
    syntax CTLNode      ::= "block" NodeLabel "::"
                                "pred" ":" NodeLabels
                                "succ" ":" NodeLabels
                                "patt" ":" CTLPattern
                                "data" ":" CTLData
    syntax CTLGraph     ::= CTLNode
                          | CTLNode CTLGraph

endmodule

module CTL-OPTIM
    imports CTL-SEMANTICS

    /* Rule/Strategy Names */
    /*---------------------*/
    syntax RuleName     ::= Id

    /* Transformation rule syntax */
    /*----------------------------*/
    syntax Rule         ::= CTLPattern "=>" CTLAtomic
                          /* | CTLPattern "=>" CTLPattern "if" CTLPattern */
    syntax Rules        ::= List{Rule, " "}
    syntax RuleDef      ::= RuleName ":=" Rules "."
    syntax RuleDefs     ::= List{RuleDef, " "} [klabel('ruleDefs)]

    /* Build composite transformations */
    /*---------------------------------*/
    syntax StrategyName ::= RuleName
    syntax Strategy     ::= StrategyName                            /* apply once */
                          | "(" Strategy ")" [bracket]              /* parenthesis */
                          | Strategy "*"                            /* apply many */
                          > Strategy ";" Strategy [left]            /* sequence */
    syntax StrategyDef  ::= StrategyName ":=" Strategy "."
    syntax StrategyDefs ::= List{StrategyDef, " "} [klabel('strategyDefs)]

    /* Program transformation specification */
    /*--------------------------------------*/
    syntax Program      ::= "skip"
    syntax OptimTools   ::= "patterns"   "::" PatternDefs
                            "rules"      "::" RuleDefs
                            "strategies" "::" StrategyDefs
    syntax OptimProgram ::= OptimTools
                            "program"    "::" Program
    syntax OptimSpec    ::= OptimTools
                            "ctl-graph"  "::" CTLGraph

endmodule


module LLVM-CTL-OPTIM
    imports CTL-SEMANTICS
    imports LLVM-SYNTAX

    /* Make specific to LLVM */
    /*-----------------------*/

    /* subsorts */
    syntax Program      ::= Function
    syntax NodeLabel    ::= LabelStringConstant
                          | LabelValue
    syntax CTLData      ::= "{" InstructionList BBTerminatorInstruction "}"
    syntax NodeLabels   ::= "get_successors" "(" BBTerminatorInstruction ")"
                          | "get_successors" "(" JumpTable ")"

    /* calculating succesors of a BasicBlock */
    /*TODO: No idea if this is the correct way to do this case analysis in K */
    /*TODO: No idea if these rules capture the semantics of LLVM */
    rule get_successors ( ret N:NonVoidType V:ValueRef IM:InstructionMetadatas )
            => exit
    rule get_successors ( ret V:VoidType IM:InstructionMetadatas )
            => exit
    rule get_successors ( br LV:LabelValue IM:InstructionMetadatas )
            => LV
    rule get_successors ( br I:IntType V:ValueRef , L1:LabelValue , L2:LabelValue IM:InstructionMetadatas )
            => L1, L2
    rule get_successors ( resume R:ResolvedVal IM:InstructionMetadatas )
            => exit
    rule get_successors ( indirectbr R:ResolvedVal , [ LVS:LabelValues ] IM:InstructionMetadatas )
            => LVS
    rule get_successors ( switch I:IntType V:ValueRef , DEF:LabelValue
                            [ JT:JumpTable ] IM:InstructionMetadatas )
            => DEF, get_successors(JT)
    rule get_successors ( I:IntType CVR:ConstValueRef , LV:LabelValue )
            => LV
    rule get_successors ( I:IntType CVR:ConstValueRef , LV:LabelValue JT:JumpTable )
            => LV, get_successors(JT)
    rule get_successors ( invoke OCC:OptCallingConv RA:RetAttrs T:Type VR:ValueRef ( PL:ParamList )
                                FA:FuncAttrs to LV1:LabelValue unwind LV2:LabelValue IM:InstructionMetadatas )
            => LV1, LV2
    rule get_successors ( LA:LocalAssign invoke OCC:OptCallingConv RA:RetAttrs T:Type VR:ValueRef
                                ( PL:ParamList ) FA:FuncAttrs
                                to LV1:LabelValue unwind LV2:LabelValue IM:InstructionMetadatas )
            => LV1, LV2
    rule get_successors ( unreachable InstructionMetadatas )
            => exit


    /* Computer CTL Graph */
    /*--------------------*/
    syntax CTLGraph     ::= "to_ctl_graph" "(" BasicBlockList ")"

    rule to_ctl_graph ( BB:BasicBlock BBL:BasicBlockList )
            => to_ctl_graph(BB) to_ctl_graph(BBL)

    rule to_ctl_graph ( L:LabelStringConstant
                        I:InstructionList
                        T:BBTerminatorInstruction
                      )
            =>
            block L ::
                pred : enter
                succ : get_successors(T)
                patt : ct-true
                data : { I T }

    /*rule O:OptimTools
         program    :: OL:OptLinkage
                       OVS:OptVisibilityStyle
                       ODSC:OptDllStorageClass
                       FH:FunctionHeader
                       { BBL:BasicBlockList }
            =>
            O
            ctl-graph   :: to_ctl_graph(BBL)*/

endmodule
