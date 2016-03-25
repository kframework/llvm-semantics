/*requires "llvm-semantics.k"*/

module CTL-SYNTAX

    /* Node labels */
    /*-------------*/
    syntax NodeLabel    ::= Id
                          | "enter"
                          | "exit"
                          | "skip"

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

    /* CTL specification */
    /*-------------------*/
    syntax CTLSatis     ::= NodeLabel "|=" CTLPattern
    syntax CTLSpec      ::= List{CTLSatis, " "} [klabel('CTLSpec)]
    syntax CTLQuery     ::= CTLSpec "|=" NodeLabel "|=" CTLPattern "?"
endmodule


module CTL-SIMPLIFICATION
    imports CTL-SYNTAX

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
endmodule

module CTL-OPTIM
    imports CTL-SYNTAX

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
    syntax OptimSpec    ::= "patterns"   "::" PatternDefs
                            "rules"      "::" RuleDefs
                            "strategies" "::" StrategyDefs
                            "program"    "::" Program

endmodule


module LLVM-CTL-OPTIM
    imports CTL-OPTIM
    imports CTL-SIMPLIFICATION
    /*imports LLVM-SYNTAX*/

    /*syntax Program      ::= Function*/
endmodule
