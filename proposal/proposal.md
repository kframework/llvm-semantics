---
title: DSL for writing Compiler Optimizations
author: Liyi Li (liyili2), Everett Hildenbrandt (hildenb2)
geometry: margin=2.5cm
format: latex
linestretch: 1.25
csl: ieee.csl
...


Problem
=======

Translating compiler optimizations from academic papers to an LLVM C++
implementation can be tricky. When this translation is done by hand, there can be
no guarantee that it is faithful to the original optimization. This can lead to
wasted developer time tracking down bugs in optimization implementations.

To help, we'd like to define a domain specific language (DSL) for writing
optimizations in. A developer using such a DSL should be able to clearly state
exactly the necessary information (and nothing more) to implement the
optimization; afterwards the DSL should be compiled into an executable form
either by generating C++ for use with LLVM or by making an executable program
which operates directly on the LLVM IR syntax.

Ideally, one could write down exactly the "psuedo-code" used in academic papers
to specify the optimization and that would be enough to generate the entire
optimization. You wouldn't have to learn C++ to do this. By disentangling
algorithm design from implementation, we can also avoid any dependencies on LLVM
for algorithms written in an optimization DSL. Simply by providing another
"backend" for our DSL, we could target other languages.


Previous Work
=============

See bottom for more details on references.

Alive Peephole Optimizations[@alive-peephole]:
:   Lopes et al. define a DSL based on templates for specifying peephole
    optimizations on the LLVM IR (these templates resemble rewriting logic
    specifications). Additionally, pre-conditions on the optimizations can be
    specified (so that the templates do not over-match). Their implementation
    verifies the transformation correct using an external SMT solver, then
    generates C++ code which corresponds to the specified optimization.

PTRANS using VeriF-OPT[@ptrans-verif-opt]:
:   Mansky et al. define a DSL for writing CFG-based (control flow graph)
    optimizations. This framework is not specific to LLVM, though they provide a
    "MiniLLVM" sample language for demonstration. Rather, this work demonstrates
    the key point that LLVM function optimizations are a specific instance of
    CFG-based optimizations. The PTRANS DSL is based on CTL (computational-tree
    logic), which takes quite a bit of familiarity to use correctly.


Project
=======

We will define a DSL that allow user to define most (if not all) CFG
optimizations. This DSL will be entirely generic in the sense that it is defined
in terms of CFGs; only after supplying patterns specific to a target language
instructions is the DSL instantiated to a particular target. The syntax and
semantics of the DSL will be defined in K. To make it work for LLVM, we need the
syntax and semantics of a CTL DSL in K, as well as the syntax and semantics of
LLVM in K (which is mostly done, though not thoroughly tested).

Intuitively, we can think of the DSL as providing ways to "pattern match" both
instructions in the language (the language specific part) as well as generic CFG
structures. We can think of an instruction pattern match as being an "atomic
predicate" in CTL, with the CTL connectives extending these individual
instruction patterns to also include the context of the surrounding CFG. In this
way, using only structural patterns, we can concisely express restrictions on
which instructions to transform as well what the surrounding CFG must look like
for the transformation to be valid.

Using the (semantics preserving) shallow embedding of K into Isabelle that Liyi
has worked on, we will be able to export optimizations written in our DSL to the
Isabelle theorem prover. Using this we can verify optimization correctness, as
well as generate executable code to run the optimizations with. We could
(probably) even compile the resulting executable code into a library that LLVM
could use directly, though this may be more trouble than it's worth.

The project can be broken down into (roughly) four stages:

-   Define LLVM-semantics in K-framework (mostly done)
-   Define K-semantics for CFG rewrite DSL (with PTRANS in mind)
-   Implement key optimizations for demonstration purposes

LLVM IR Rewrites
----------------

This will involve work similar to the Alive project mentioned above so that we
can rewrite individual instructions. However, if we define these rewrite rules
in the K-framework we can automatically have an executable backend which
performs the rewrites for us. Additionally, we can verify the optimizations by
exporting the K rewrite rules (along with the LLVM semantics) to Isabelle.

The LLVM semantics are defined (mostly, though not tested extensively) in the
K-framework. We can instantiated our DSL language to a specific language, LLVM
and show that we can do optimizations on LLVM programs correctly and
efficiently.

We need to have direct IR rewriting so that atomic predicates used in the CTL
formulae can be expressed using patterns over the target language. This makes
writing optimizations much easier, and make reading the written optimizations
easier as well.

CFG Rewrites
------------

The PTRANS DSL (and VeriF-OPT framework) is a powerful CFG-optimization
specification and execution framework, but is hard to use because it requires
extensive knowledge of CTL. We will make a wrapper DSL which is de-sugared to the
CTL used by PTRANS. This gives us the verification power of PTRANS (for
optimization correctness verification), but a more manageable specification
language for optimization developers to use.

The CFG-rewrite framework specified by PTRANS is language-agnostic. We'll have
to tie it back to LLVM by specifying the correct syntax and semantics of LLVM
for Isabelle (which PTRANS uses). For this, we can export the K-semantics of
both LLVM and the CFG-rewriter DSL to Isabelle and have Isabelle take care of
generating correctness proofs and translation executables.

Implement Optimizations
-----------------------

To demonstrate the correctness of our approach, we will write a few key
optimizations in our DSL and prove their correctness (as well as analyzing
their performance). What would be more important here is creating a large amount
of "useful patterns" which can be used to implement numerous optimizations.
Below there are a couple toy examples of some patterns, rules, and strategies.

Test suite
----------

Because we will be formally verifying our optimizations, we will assume that
they are correct for the purposes of testing. Instead, we will test the
performance of generated code to make sure our optimization strategies are
"complete". To do this, we will take random samples from the LLVM test-suite
(focused on ones targeted at intra-procedural analysis and performance
benchmarks) and run them through our optimization as well as the corresponding
built-in LLVM optimization pass. The resulting code will be benchmarked for
performance. We will also manually inspect some of them to ensure our
transformations are not doing anything "weird".


Proposed DSL Syntax
===================

The first draft of the DSL syntax is available in the
[git repository](https://github.com/ehildenb/ctl-optim) in file `k/syntax`. The
sections below refer to the syntax defined there.

CTL Arrows
----------

CTL is powerful for reasoning about directed graph structures, but is unwieldy
to write. We've provided "CTL-arrow" patterns which match exactly the semantics
of the typical CTL `until` and `next` operators (we've provided both forward and
backwards arrows). Because the arrows are CTL formulae, we can think of them as
matching an instruction where the CTL formula represented by the arrow is
satisfied at that point in the CFG (or any other directed graph structure).

### Example: Dominance

To claim that CTL is useful for CFG-based optimizations, we must show we can
express simple concepts like "dominance". In the following example, we show how
we could eliminate parts of the CFG which we know will throw an error because
they are dominated by a divide-by-zero instruction.

```optimization
pattern [dominatedBy I] : I <-A--

rule [removeError] : dominatedBy (c = E:Exp / 0) => noop
```

Here, we define a pattern `dominatedBy I`, which will match some other
instruction if it is dominated by the instruction `I`. The pattern used is
`I <-A--`, which in CTL this is the `backwards eventually I` operator, which
means "any instruction where all backwards paths go through instruction `I`".
When instantiated with `c = E / 0`, this means "any instruction where all
backwards paths go through an instruction which calculates an expression `E`
divided by `0` and assigns it to some variable `c`".

We also make the rule `removeError` which will rewrite an instruction to a
`noop` if it is dominated by `c = E:Exp / 0`.

### Example: Dominance Frontier

We could also define a pattern which matches instructions in the dominance
frontier of another pattern.

```optimization
pattern [inDominanceFrontierOf I] : dominatedBy I <E-- not dominatedBy I

(* Make the ` ` an explicit `and` *)
pattern [inDominanceFrontierOf I] : (dominatedBy I <E--) and (not dominatedBy I)
```

Here we've used the fact that in our grammar the space character ` ` is an
implicit `and` operation. If we made it an explicit `and`, we would get the
second pattern shown above. The second part of the pattern, `not dominatedBy I`,
will match only if the current instruction is not dominated by the instruction
`I`. The first part, `(dominatedBy I) <E--`, will only match if there exists a
predecessor of the current instruction which *is* dominated by `I`.

Altogether, it will only match instructions that are not dominated by `I` but
have a predecessor which is dominated by `I`. Using the fact that space is an
implicit `and` operator, we can write it in the quite intuitive structural
manner given above.

Usage
-----

We will define patterns to pick out structures in the graph (thus program) that
can be transformed. When a pattern matches, part of the pattern will be
re-written using a rule (this is when the optimization happens). We can control
the order to try rules in using strategies which allows us to sequence rules as
well as apply rules as many times as possible.

### Example: Constant Propagation

Using this DSL, we imagine defining constant propagation in this way:

```optimization
pattern [usesTerm c t] : c = t <-A not c = t'-- uses c

rule [constProp] : I:(usesTerm c (t:const)) => I[t/c]

rule [constFold] : c1:const +  c2:const     =>   c1 +Int   c2
                   c1:const *  c2:const     =>   c1 *Int   c2
                   c1:const -  c2:const     =>   c1 -Int   c2
                   c1:const && c2:const     =>   c1 &&Bool c2

strategy [CONST] : (constProp* ; constFold*)*
```

`usesTerm` will only match instructions which use `c` (the `uses c` part) *and*
match the pattern `c = t <-A not (c = t')--`. The part `c = t <-A ... --` means
that all backwards paths from the instruction must go through an instruction
that matches `c = t`. The part `not (c = t')` says that along all such backwards
paths, it must *not* match the instruction `c = t'`. Matched instructions use
the variable `c`, and the most recent definition of `c` will be the term `t`.

To make the `constProp` rule, we instantiate the pattern `usesTerm` with the
second argument having the additional restriction that it must be a constant.
This gives the final pattern `I:(usesTerm c (t:const))`. If we find an
instruction `I` which matches this pattern, we replace it with `I[t/c]`, which
is the same instruction `I` where every occurrence of `c` has been replaced by
the constant `t`.

We also provide a `constFold` rule which simply replaces expressions which have
constants in them with the expression actually calculated.

Finally, we provide the strategy `CONST`, which will apply `constProp` as many
times as possible, followed by `constFold` as many times as possible. The entire
sequence of propagation followed by folding will be applied as many times as
possible too (the outer `*`).

### Example: Dead-code Elimination

We can define dead-code elimination as follows (assuming an `exit` pattern which
matches exit nodes and a `noop` instruction):

```optimization
pattern [deadCode] : c = t --A not uses c-> exit

rule [deadElim] : deadCode => noop

strategy [DEADCODE] : deadElim*
```

Pattern `deadCode` matches instructions of the form `c = t` (assignment to `c`)
where the pattern `(--A not uses c-> exit` is matched as well. This pattern
means "all paths to `exit` don't use `c` anywhere along the path".

The rule `deadElim` is simple - if some instruction matches `deadCode`, it is
replaced by `noop`. The `DEADCODE` strategy repeatedly applies `DEADCODE` until
it cannot anymore.

Using this new rule, we could come up with another strategy which repeatedly
performs constant propagation and dead-code elimination.

```
strategy [CONST-DEAD]   : (CONST* ; DEADCODE*)*
```


Proposed Timetable
==================

### March 14 (passed)

-   Provide syntax for matching LLVM instructions (using K syntax/semantics)
-   Provide syntax for matching CFG structures (mostly done)
-   Have a few "ideal" examples written up (done above)

### March 28

-   Working example of exporting optimizations to Haskell executable
-   Have "library" of patterns that compiler optimization would find useful

### April 18

-   Preliminary tests of Haskell optimization executables for correctness
-   Proofs of some small optimizations' correctness using Isabelle
-   Performance tests of optimized programs vs LLVM built-in

### April 28

-   Extensive performance benchmarks of optimizations
-   Begin writing report with results


References
==========

---
references:
-   id: alive-peephole
    author:
    -   family: Lopes
        given: Nuno
    -   family: Menendez
        given: David
    -   family: Nagarakatte
        given: Santosh
    -   family: Regehr
        given: John
    issued:
    -   year: '2015'
    title: Provably Correct Peephole Optimizations with Alive
    container-title: Proc. of the 36th annual ACM SIGPLAN conference on
                        Programming Language Design and Implementation (PLDI)
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
