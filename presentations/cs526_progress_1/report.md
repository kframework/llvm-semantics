---
title: Progress Report 1 - MP2
author: Liyi Li (liyili2), Everett Hildenbrandt (hildenb2)
geometry: margin=2.5cm
format: latex
linestretch: 1.25
csl: ieee.csl
...


Project
=======

The goal is to create a directed-graph rewriting DSL in K which can be used to
specify compiler optimizations as CFG rewrites. We are using K because it would
be nice to immediately have a prototype executable of the rules, as well as
access to verification frameworks (like Isabelle and Coq). We would like to
extend this to data-dependence and call-graph optimizations as well.

For reasoning about graph rewrites we are using CTL (computation tree logic).
CTL has an efficient proof system, and there has been previous work defining
optimizations using CTL[@ptrans-verif-opt].


CTL Specification
-----------------

The syntax of CTL is defined K[^actuallyCTLStar], which allows us to parse CTL
formulae as side-conditions on graph-rewrites. The semantics are mostly defined
as well, though they still need testing.

[^actuallyCTLStar]: Right now we are actually using CTL*. CTL* is a logic that's
    able to express both CTL and LTL (linear temporal logic) formulas, making it
    a strict superset of both CTL and LTL. We're debating switching back to pure
    CTL for simplicity (though the satisfaction-decision algorithms for each are
    the same complexity), but it would be nice to have the semantics of CTL*
    defined in K as anyway.

In order to make some target language usable, you must provide what is used as
the `NodeLabel` for that language (eg. the names of the basic blocks for CFG
analysis). The `pred` and `succ` functions must also be specified (which give
the successors and predecessors of a specific node in a graph).

We have a simple system for plugging in predicates specific to the language and
optimization. We have defined a sort `State` in CTL which can be extended with
subsort inclusion to include predicates over the target language's syntax.

As an example, CFG analysis often assumes the use of `enter` and `exit` labeled
nodes, and `skip` basic blocks with some specific properties. Thus, we declare
new constants `enter` and `exit` as `NodeLabel`s and add a `BasicBlock` sort
which one pre-defined constant `skip`. Taking it one step further, many analysis
use def-use predicates, so we have a skeleton of a `CTL-CFG-DEFUSE` module which
defines the predicates `defines VARIABLE` and `uses VARIABLE` which can be used
for these types of analysis.


LLVM Integration
----------------

For LLVM, we're only performing CFG analysis on a single function at a time.
Right now we're only focusing on running an optimization over a single function,
though extending to a whole program should not be difficult.

So we will operate on individual files with just a `Function` definition in
them. The basic blocks of the function are split up into a CFG, which serves as
the `Model` for our CTL semantics. We also extend the sort `NodeLabel` with the
sort `LabelStringConstant` (this is the sort used to label basic blocks in the
LLVM syntax defined in K).

We also have to define how to insert a `skip` instruction into the LLVM rules,
because we assume implicitly that it exists for CFG analysis. This hasn't been
done yet.

In order to actually perform optimizations, we'll have to take pre-defined CTL
analysis from above (for example the `CTL-CFG-DEFUSE` module), and tell K how to
interpret the `defines` and `uses` predicates for LLVM. We are still working on
this part as well.


Testing
-------

We have downloaded a large bank of tests from various sources, including the
LLVM test-suite and gcc-torture tests (converted to LLVM IR with clang). So far
we've used a few simple hand-written tests which just include a single function
definition - these are just pulled at random from our large bank of tests. Once
we extend our ability to test to entire programs, we should be able to use the
programs unmodified.

As we don't have any working optimizations yet (many parts of our semantics need
to be defined still), we have just been testing that our syntax definitions
parse correctly thus far for the CTL. The LLVM semantics already largely exist.


References
==========

---
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
