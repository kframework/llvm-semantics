requires "llvm-semantics.k"

module CTL-SYNTAX

    /* Stuff I haven't thought about yet */
    /*-----------------------------------*/
    syntax Var          ::= String
    syntax Name         ::= String

    /* CTL spatial quantifiers */
    /*-------------------------*/
    syntax CTLQuant     ::= "A"                                         /* for all paths */
                          | "E"                                         /* exists a path */

    /* CTL Logic Connectives */
    /*-----------------------*/
    syntax InstPattern  ::= Var ":" InstPattern                         /* name a pattern */
                          | "enter"                                     /* entrance node */
                          | "exit"                                      /* exit nodes */
                          | "skip"                                      /* identity nodes */
                          | "not" InstPattern                           /* `not` */
                          | InstPattern " " InstPattern [left]          /* `and` */
                          | InstPattern "|" InstPattern [left]          /* `or` */
                          | InstPattern ";" InstPattern [right]         /* same as `--A>` */
                          | "--" CTLQuant ">" InstPattern               /* `next` */
                          | InstPattern "<" CTLQuant "--"               /* backwards `next` */
                          | "--" CTLQuant InstPattern "->" InstPattern  /* `until` */
                          | InstPattern "<-" CTLQuant InstPattern "--"  /* backwards `until` */
                          | "--" CTLQuant "->"                          /* `eventually` */
                          | "<-" CTLQuant "--"                          /* backwards `eventually` */

    /* Syntax for defining patterns */
    /*------------------------------*/
    syntax PatternArgs  ::= List{InstPattern, " "}
    syntax PatternName  ::= Name PatternArgs
    syntax PatternDef   ::= "pattern" "[" PatternName "]" ":" InstPattern

    /* Transformation rule syntax */
    /*----------------------------*/
    syntax Rule         ::= InstPattern "=>" InstPattern
                          | InstPattern "=>" InstPattern "if" InstPattern

    /* Define a transformation rule */
    /*------------------------------*/
    syntax RuleName     ::= Name
    syntax Rules        ::= List{Rule, " "}
    syntax RuleDef      ::= "rule" "[" RuleName "]" ":" Rules

    /* How to build composite transformations */
    /*----------------------------------------*/
    syntax StrategyName ::= RuleName
    syntax Strategy     ::= RuleName                                    /* apply rule once */
                          | StrategyName                                /* apply strategy once */
                          | Strategy "*"                                /* apply many */
                          | Strategy ";" Strategy [left]                /* sequence */

    /* Name a list of rules as belonging to a transformation */
    /*-------------------------------------------------------*/
    syntax StrategyDef  ::= "strategy" "[" StrategyName "]" ":" Strategy

endmodule


module LLVM-CTL-OPTIM
    imports CTL-SYNTAX
endmodule
