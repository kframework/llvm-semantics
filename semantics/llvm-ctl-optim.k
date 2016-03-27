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
    syntax PatternDef   ::= PatternName "=" CTLPattern
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

    syntax CTLData      ::= NodeLabel

endmodule

module LLVM-CTL-OPTIM
    imports CTL-SEMANTICS
    imports LLVM-SYNTAX

    /* Rule/Strategy Names */
    /*---------------------*/
    syntax RuleName     ::= Id

    /* Transformation rule syntax */
    /*----------------------------*/
    syntax Rule         ::= CTLPattern "=>" CTLAtomic       /* basic rule */
                          | "(" Rule ")" [bracket]          /* parenthesis */
                          | Rule "*"                        /* apply many */
                          | Rule ";" Rule [left]            /* sequence rules */
                          | Rule "|" Rule [left]            /* left-biased choice */
    syntax Rules        ::= List{Rule, " "}
    syntax RuleDef      ::= RuleName ":=" Rule
    syntax RuleDefs     ::= List{RuleDef, " "} [klabel('ruleDefs)]

    /* Program transformation specification */
    /*--------------------------------------*/
    syntax Program      ::= "skip"
    syntax OptimTools   ::= "patterns"  "::" PatternDefs
                            "rules"     "::" RuleDefs
    syntax OptimRun     ::= "run" RuleName
                          | "run" RuleName "on" Program
                          | OptimTools OptimRun

    /* Our computation configuration */
    /*-------------------------------*/
    configuration <T>
                    <k> $PGM:OptimRun </k>
                    <patterns> .Map </patterns>
                    <rules> .Map </rules>
                    <ctl-data> .Map </ctl-data>
                  </T>

    /* Split up into correct configuration */
    /*-------------------------------------*/
    rule <k> (PN = P):PatternDef => . ... </k>
         <patterns> ... . => (PN |-> P) ... </patterns>

    rule <k> (RN := R):RuleDef => . ... </k>
         <rules> ... . => (RN |-> R) ... </rules>

    syntax CTLData      ::= InstructionList BBTerminatorInstruction
    rule <k> (NL IL T):BasicBlock => . ... </k>
         <ctl-data> ... . => (NL |-> IL T) ... </ctl-data>

    rule <k> patterns   :: .PatternDefs
             rules      :: .RuleDefs
            => . ... </k>

    syntax Program      ::= Function
    rule <k> run RN on OL OVS ODSC FH { .BasicBlockList }
            => run RN </k>

endmodule
