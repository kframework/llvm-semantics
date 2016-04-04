---
title: Expressing Compiler Optimizations in CTL
author: Everett Hildenbrandt
format: beamer
theme: Boadilla
fontsize: 9pt
linestretch: 1.25
header-includes:
-   \newcommand{\meet}{\land}
-   \newcommand{\join}{\lor}
-   \newcommand{\meetover}[1]{\meet_{#1}}
-   \newcommand{\joinover}[1]{\join_{#1}}
-   \newcommand{\emp}{\varnothing}
-   \newcommand{\diff}{\setminus}
-   \renewcommand{\phi}{\varphi}
...


Motivation
==========

LLVM optimizations are hard to write ...
----------------------------------------

### C++ is a systems language
-   Focused on details of controlling machine
-   Not many guarantees the language can provide you

### Lots of boilerplate
-   Traversing lists of pointers for subterm manipulation
-   Traversing CFGs (control flom graphs) to check optimization preconditions

### Correctness?
-   Should we use the semantics of C++ to try and verify?

Optimizations are hard to write, but not mathematically
-------------------------------------------------------

For example, dataflow analysis can be expressed assuming we have defined:

### Atomic predicates
-   Predicates are analysis specific
-   Definition is programming language specific
-   Eg. $uses(I,V)$ or $defines(I,V)$ for $I$ an instruction, $V$ a variable

### Lattice Operations (analysis specific)
-   Define $\bot$ ($\top$) as "least" ("most") information
-   Define $\meet$ ($\join$) of lattice (moving towards less (more) information)

### CFG (control flow graph) construction/propagation
-   Construct CFG for the program we are analyzing[^reverseCFGsToo]
-   Define $f(I)$ (transfer function) for each node of CFG

[^reverseCFGsToo]: These techniques work on "reverse CFGs" as well.

Example dataflow analysis: Available Expressions
------------------------------------------------

### Atomic predicates

$gen(I,e)$:
:   Basic block[^orInstruction] $I$ evaluates expression $e$ without modifying
    variables used in $e$

$kill(I,e)$:
:   Basic block $I$ may modify variables used in expression $e$

[^orInstruction]: Assume without loss of generality that each instruction has
    its own basic-block.

### (Semi)Lattice Operations

elements:
:   Sets of expressions

$\bot$:
:   Empty set $\emp$

$\meet$:
:   Set intersection $\cap$ - conservative

### CFG Propagation

Transfer function:
:   $f_n(I) = gen(I) \cup (AVAIL_{in}[I] \diff kill(I))$

Non-determinism:
:   $AVAIL_{in}[I] = \meetover{P \in pred(I)} AVAIL_{out}[P]$

$AVAIL_{in/out}[I]$ are the sets of available expressions at the beginning/end
of basic block $I$.


Idea
====

Express LLVM CFG optimizations using CTL in K-framework
-------------------------------------------------------

-   Why LLVM?
-   Why CTL?[^whatIsCTL]
-   Why K?

[^whatIsCTL]: CTL is computational tree logic

Why LLVM?
---------

-   LLVM-IR is already expressed as a CFG at the intra-function level
-   LLVM is a compiler with a large user base

Why CTL?
--------

### Non-determinism

CFGs where branches are "uninterpreted functions" can be "unrolled" into
non-deterministic computation trees.

### CTL preconditions

CTL can be used to express preconditions to compiler transformations. For
example, $\mathcal{AG} \lnot uses(v)$ could be a pre-condition for eliminating a
definition of $v$.

### Verification

We can define an optimization's "correctness" with respect to some CTL
invariant formulae we choose.

Why K?
------

### LLVM Semantics

The K-framework has the LLVM syntax and semantics defined (including the CFG
structure of intra-functional code). This makes defining predicates over LLVM
basic blocks easier.

### Can define semantics of CTL in K

K already has semantics of LTL (for model checking), but not CTL.[^orCTLStar] If
we define the semantics of CTL in K and tie it into the LLVM semantics, we can
have a functioning prototype compiler.

[^orCTLStar]: We could also (and are considering) using CTL\*, which is a
    superset of both LTL (linear temporal logic) and CTL. Both are useful.


CTL\* defined in K
==================

CTL\* in K - syntax
-------------------

```
syntax State    ::= NodeLabel               /* implicit `isNode` */
                  | "(" State ")"           [bracket]
                  | "ctl-true"
                  | "not" State
                  > State "or" State
                  > "E" Path

syntax Path     ::= "(" Path ")"            [bracket]
                  | State
                  | "not" Path
                  > Path "or" Path
                  > "->" Path               /* `next` */
                  | "--" Path "->" Path     /* `until` */

syntax Bool     ::= "(" Model "," NodeLabel ")" "|=" State
                  | "(" Model "," NodeLabels ")" "|=" Path
```

CTL\* in K - semantics of `and`
-------------------------------

### CTL\*

$$
(\mathcal{M}, n) \models (\phi_1 \land \phi_2)
    \iff (\mathcal{M}, n) \models \phi_1 \land (\mathcal{M}, n) \models \phi_2
$$

### In K

```
rule (M, N:NodeLabel) |= (S1 and S2):State
        =>
        ((M,N) |= S1) andBool ((M,N) |= S2)
    [structural]
```

CTL\* in K - semantics of `until`
---------------------------------

### CTL\*

$$
(\mathcal{M}, \pi) \models \phi_1 \mathcal{U} \phi_2
    \iff (\mathcal{M}, \pi) \models \phi_2 \quad
        \lor \quad ((\mathcal{M}, \pi) \models \phi_1
                \land (\mathcal{M}, \pi(1)) \models \phi_1 \mathcal{U} \phi_2
             )
$$

### In K

```
rule (M, (N0, Ns):NodeLabels) |= (-- P1 -> P2)
        =>
        (M, (N0,Ns)) |= P2
            orBool
        ((M, (N0, Ns)) |= P1 andBool (M, Ns) |= (-- P1 -> P2))
    [structural]
```


CFG Optimizations in K
======================

Example (analysis): Dominance
-----------------------------

### Add atomic predicate `dominatedBy I`

```
syntax State        ::= "dominatedBy" NodeLabel
                      | "inDominanceFrontierOf" NodeLabel

rule dominatedBy I
        => A (I <-- ctl-true --)
    [structural]

rule inDominanceFrontierOf I
        => (E (dominatedBy I <-))
            and
           not dominatedBy I
    [structural]
```

### Uses?

-   In CFG, `dominatedBy` can be used to approximate control-dependences
-   Dominance frontiers can be used to put code into SSA-form[^whatIsSSA]
-   Can be flipped to get `postDominatedBy` (flip arrow direction)

[^whatIsSSA]: Single Static Assignment form is a representation where each
    variable has a single definition.

Example (optimization): Deadcode elimination
--------------------------------------------

### Assume we have (for some language variable `V`):
-   Predicate `uses V` over LLVM instructions (may access)
-   Label `exit` for end of the CFG[^mostCFGassumes]

[^mostCFGassumes]: Most CFG analysis assumes the existence of `enter` and `exit`
    basic blocks.

### Add atomic predicate `deadcode`

```
syntax NodeLabel    ::= "exit"
syntax State        ::= "deadcode"
                      | "uses" LLVMVar

rule deadcode => (V = E) and A (-- not uses V -> exit)
```

### Add optimization (remove deadcode)

`basicBlocks` is the K-cell which holds a map from nodelabels to basic blocks

```
rule <basicBlocks> (I |-> B => .) ... </basicBlocks>
    when I |= deadcode
```

Example (optimization): Constant propagation
--------------------------------------------

### Add atomic predicates `uses E as V` and `defines V`

```
syntax State        ::= "uses" LLVMExp "as" LLVMVar
                      | "defines" LLVMVar
                      | "uses" LLVMVar

rule uses E as V
    => uses V and A (V = E <- not defines V  --)
```

### Add optimization (propagate constants)

```
rule <basicBlocks> I |-> (B => B[E/V]) ... </basicBlocks>
     when I |= uses (E:LLVMConst) as V
```

### Have assumed (not hard to do in K)
-   Patterns which match on instruction structure: `(V = E)`
-   Sub-term substitution: `B[E/V]`
-   Subsort predicates: `E:LLVMConst`


Wrapping Up
===========

Needs Finished
--------------

### Semantics of CTL\* in K
-   So far we're only handling CTL subset
-   Will this be efficient? Perhaps we export execution to
    Isabelle?[@ptrans-verif-opt]

### Library of atomic predicates for LLVM
-   So far we've just assumed these predicates exist
-   Many could be useful for other analysis as well

Further Directions
------------------

### Non-CFG optimizations on graph-structure (using CTL\*)
-   Data-dependence graphs? (related to CFGs)
-   Inter-procedural analysis? (call-graphs)

Is CTL\* good for reasoning about graphs in general? We're using CTL\* to do
some sort of symbolic execution when applied to intra-procedural (CFG)
optimizations.

Thanks!
-------

### Working with
-   Elsa Gunter: Work on PTRANS (now Morpheus)[@ptrans-verif-opt]
-   Liyi Li: Student in Elsa's group who is working on LLVM semantics

### References

---
csl: ieee.csl
references:
-   id: ptrans-verif-opt
    author:
    -   family: Mansky
        given: William
    -   family: Griffith
        given: Dennis
    -   family: Gunter
        given: Elsa
    issued:
    -   year: '2014'
    title: Specifying and Executing Optimizations for Parallel Programs
    container-title: GRAPH Inspection and Traversal Engineering (GRAPHITE)
...

