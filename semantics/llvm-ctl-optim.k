/*requires "llvm-semantics.k"*/

module CTL-SYNTAX

    /* Labels */
    /*--------*/
    syntax Label        ::= Id

    /* CTL atomic predicates (plug in language specific here) */
    /*--------------------------------------------------------*/
    syntax CTLAtomic    ::= Label
                          | "true"
                          | "enter"
                          | "exit"
                          | "skip"
                          | "not" CTLAtomic
                          > CTLAtomic "|" CTLAtomic
                          > CTLAtomic " " CTLAtomic

    /* CTL spatial connectives */
    /*-------------------------*/
    syntax CTLQuant     ::= "A"                                         /* for all paths */
                          | "E"                                         /* exists a path */

    /* CTL patterns */
    /*--------------*/
    syntax CTLPattern   ::= CTLAtomic                                   /* atomic patterns */
                          | PatternName                                 /* defined pattern */
                          | "(" CTLPattern ")" [bracket]                /* allow parens */
                          | Label ":" CTLPattern                        /* label and pattern */
                          | "not" CTLPattern                            /* `not` */
                          > CTLPattern "|" CTLPattern [left]            /* `or` */
                          > CTLPattern " " CTLPattern [left]            /* `and` */
                          > "--" CTLQuant             ">" CTLPattern    /* `next` */
                          | "--" CTLQuant            "->" CTLPattern    /* `eventually` */
                          | "--" CTLQuant CTLPattern "->" CTLPattern    /* `until` */
                          | CTLPattern "<"  CTLQuant            "--"    /* `pred` */
                          | CTLPattern "<-" CTLQuant            "--"    /* `was` */
                          | CTLPattern "<-" CTLQuant CTLPattern "--"    /* `since` */

    /* Syntax for defining patterns */
    /*------------------------------*/
    syntax PatternArgs  ::= List{CTLPattern, ","}
    syntax PatternName  ::= Label
                          | Label "(" PatternArgs ")"
    syntax PatternDef   ::= "pattern" PatternName "=" CTLPattern "."

endmodule

module CTL-OPTIM
    imports CTL-SYNTAX

    /* Transformation rule syntax */
    /*----------------------------*/
    syntax Rule         ::= CTLPattern "=>" CTLAtomic
                          /* | CTLPattern "=>" CTLPattern "if" CTLPattern */
    syntax RuleName     ::= Label
    syntax Rules        ::= List{Rule, " "}
    syntax RuleDef      ::= "rule" RuleName ":" Rules "."

    /* How to build composite transformations */
    /*----------------------------------------*/
    syntax StrategyName ::= RuleName
    syntax Strategy     ::= RuleName                                /* apply rule once */
                          | StrategyName                            /* apply strategy once */
                          | "(" Strategy ")" [bracket]              /* parenthesis */
                          | Strategy "*"                            /* apply many */
                          > Strategy ";" Strategy [left]            /* sequence */

    /* Name a list of rules as belonging to a transformation */
    /*-------------------------------------------------------*/
    syntax StrategyDef  ::= "strategy" StrategyName ":" Strategy "."

    /* Program transformation specification */
    /*--------------------------------------*/
    syntax OptimTools   ::= PatternDef
                          | RuleDef
                          | StrategyDef
    syntax OptimSpec    ::= List{OptimTools, " "}
                          | OptimSpec
                            "run" StrategyName "on"
                            Program
    syntax Program      ::= "program here"

endmodule


module LLVM-CTL-OPTIM
    imports CTL-OPTIM
    /*imports LLVM-SYNTAX*/
endmodule
