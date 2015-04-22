// Copyright (c) 2013-2014 K Team. All Rights Reserved.
/*@

This is the syntax of LLVM.

The LLVM code representation is designed to be used in three different forms:
 as an in-memory compiler IR, as an on-disk bitcode representation 
(suitable for fast loading by a Just-In-Time compiler), 
and as a human readable assembly language representation. 
This allows LLVM to provide a powerful intermediate representation 
for efficient compiler transformations and analysis, 
while providing a natural means to debug and visualize the transformations. 
The three different forms of LLVM are all equivalent. 
This document describes the human readable representation and notation.

This syntax requires a input LLVM program without comments.
*/
module LLVM-SYNTAX

    /*@
      Define syntactic constructors for non-keyword tokens. 
      Standard integers (such as ‘4’) are constants of the integer type.
      Negative numbers may be used with integer types.
    */
    syntax HexConstant ::= Token{[0][x][0-9 a-f]*}
    syntax UnsignedInt ::= Token{[0-9][0-9]*}


    /*@
      Floating point constants use standard decimal notation (e.g. 123.421),
      exponential notation (e.g. 1.23421e+2), or a more precise hexadecimal notation.
    */
    syntax FpVal ::= HexConstant | Float
    syntax #String ::= Token{[\"] (~[\"])* [\"]}
    syntax Strings ::= List{#String,","}

    /*@
      LLVM identifiers come in two basic types: global and local.
      Global identifiers (functions, global variables) begin with the '@' character.
      Local identifiers (register names, types) begin with the '%' character.
      Additionally, there are three different formats for identifiers,
      for different purposes:

        1, Named values are represented as a string of characters with their prefix.
           For example, %foo, @DivisionByZero, %a.really.long.identifier.
           The actual regular expression used is ‘[%@][-a-zA-Z$._][-a-zA-Z$._0-9]*‘.
           Identifiers that require other characters in their names can be surrounded
           with quotes. Special characters may be escaped using "\xx" where xx is the
           ASCII code for the character in hexadecimal. In this way, any character
           can be used in a name value, even quotes themselves. The "\01" prefix can
           be used on global variables to suppress mangling.
        2, Unnamed values are represented as an unsigned numeric value
           with their prefix. For example, %12, @2, %44.
        3, Constants, which are described in the section ConstValueRef below.
    */
    syntax LocalValID ::= Token{[\%][0-9]+}
    syntax LocalVar ::=  Token{[\%][a-z A-Z \. \_ \- \$][0-9 a-z A-Z \. \_ \- \$]*}
    syntax LocalVar ::= Token{[\%][\"] (~[\"])* [\"]}

    syntax GlobalValID ::= Token{[\@][0-9]+}
    syntax GlobalVar ::= Token{[\@][a-z A-Z \. \_ \- \$][0-9 a-z A-Z \. \_ \- \$]*}
    syntax GlobalVar ::= Token{[\@][\"] (~[\"])* [\"]}

    syntax LocalName ::= LocalVar | LocalValID
    syntax LocalAssign ::= LocalName "="
    syntax GlobalName ::= GlobalVar | GlobalValID
    syntax GlobalAssign ::= GlobalName "="

    //Label names are the ids for entry basic blocks.
    syntax LabelStringConstant ::= Token{[a-z A-Z \. \_ \- \$ 0-9]*[\:]}
    syntax LabelStringConstant ::= Token{[\"] (~[\"])* [\"][\:]}

    //define metadata variables, attribute group ids and comdat variables.
    syntax MetadataVar ::= Token{[\!][a-z A-Z \. \_ \- \$ \\][0-9 a-z A-Z \. \_ \- \$ \\]*}
    syntax AttributeGroupId ::= Token{[\#][0-9]+}
    syntax ComdatVar ::= Token{[\$][a-z A-Z \. \_ \- \$ \\][0-9 a-z A-Z \. \_ \- \$ \\]*}
                          [notInRules]

    /*@
      There are the primary operators.
      Define the nsw and nuw flags.
      nuw and nsw stand for “No Unsigned Wrap” and
      “No Signed Wrap”, respectively. If the nuw and/or nsw
      keywords are present, the result value of the add is a
      poison value if unsigned and/or signed overflow, respectively, occurs.
    */
    syntax NSW ::= "nsw" 
    syntax NUW ::= "nuw"
    syntax OptNW  ::= NUW NSW | NSW NUW | NSW | NUW
                    | "" [klabel('nwEmpty),onlyLabel]


    /*@
      If the exact keyword is present, the result value of the udiv
      is a poison value if %op1 is not a multiple of %op2 (as such,
      “((a udiv exact b) mul b) == a”).
    */
    syntax OptExact ::= "exact" | "" [klabel('exactEmpty),onlyLabel]


    /*@
      Certain memory accesses, such as load‘s, store‘s, and
      llvm.memcpy‘s may be marked volatile. The optimizers must not
      change the number of volatile operations or change their order
      of execution relative to other volatile operations. The optimizers
      may change the order of volatile operations relative to non-volatile
      operations. This is not Java’s “volatile” and has no cross-thread
      synchronization behavior.
    */
    syntax OptVolatile ::= "volatile" | "" [klabel('volatileEmpty),onlyLabel]


    /*@
      If the load is marked as atomic, it takes an extra ordering and optional
      singlethread argument. The release and acq_rel orderings are not valid on
      load instructions. Atomic loads produce defined results when they may see
      multiple atomic stores.
    */
    syntax OptAtomic ::= "atomic" | "" [klabel('atomicEmpty),onlyLabel]


    /*@
      linkage describes how names can or can not refer to the same entity throughout
      the whole program or one single translation unit.
      A name's linkage is related to, but distinct from, its scope. The scope of a
      name is the part of a translation unit where it is visible.
      If the name has external linkage, the entity that name denotes may be referred
      to from another translation unit using a distinct declaration for that same name,
      and from other scopes within the same translation unit using distinct declarations.
      Were the name given internal linkage, such a declaration would denote a distinct
      entity, although using the same name, but its entity could be referred to by
      distinct declarations within the same translation unit. A name that has no linkage
      at all cannot be referred to from declarations in different scopes, not even from
      within the same translation unit. Examples of such names are parameters of functions
      and local variables.

      All Global Variables and Functions have one of the following types of linkage:

      private: Global values with “private” linkage are only directly accessible
               by objects in the current module. In particular, linking code into
               a module with an private global value may cause the private to be renamed
               as necessary to avoid collisions. Because the symbol is private to the
               module, all references can be updated. This doesn’t show up in any
               symbol table in the object file.
      internal:Similar to private, but the value shows as a local symbol
               (STB_LOCAL in the case of ELF) in the object file. This corresponds to
               the notion of the ‘static‘ keyword in C.
      available_externally:
               Globals with “available_externally” linkage are never emitted into
               the object file corresponding to the LLVM module. They exist to allow
               inlining and other optimizations to take place given knowledge of the
               definition of the global, which is known to be somewhere outside the
               module. Globals with available_externally linkage are allowed to be
               discarded at will, and are otherwise the same as linkonce_odr.
               This linkage type is only allowed on definitions, not declarations.
      linkonce:
               Globals with “linkonce” linkage are merged with other globals
               of the same name when linkage occurs. This can be used to implement
               some forms of inline functions, templates, or other code which must
               be generated in each translation unit that uses it, but where the body
               may be overridden with a more definitive definition later. Unreferenced
               linkonce globals are allowed to be discarded. Note that linkonce linkage
               does not actually allow the optimizer to inline the body of this function
               into callers because it doesn’t know if this definition of the function
               is the definitive definition within the program or whether it will be
               overridden by a stronger definition. To enable inlining and other
               optimizations, use “linkonce_odr” linkage.
      weak: “weak” linkage has the same merging semantics as
            linkonce linkage, except that unreferenced globals with weak
            linkage may not be discarded. This is used for globals that are
            declared “weak” in C source code.
      common: “common” linkage is most similar to “weak” linkage, but they
              are used for tentative definitions in C, such as “int X;” at global
              scope. Symbols with “common” linkage are merged in the same way as
              weak symbols, and they may not be deleted if unreferenced. common
              symbols may not have an explicit section, must have a zero initializer,
              and may not be marked ‘constant‘. Functions and aliases may not
              have common linkage.
      appending: “appending” linkage may only be applied to global variables
                 of pointer to array type. When two global variables with appending
                 linkage are linked together, the two global arrays are appended
                 together. This is the LLVM, typesafe, equivalent of having the system
                 linker append together “sections” with identical names when .o
                 files are linked.
      extern_weak:The semantics of this linkage follow the ELF object file model:
                  the symbol is weak until linked, if not linked, the symbol becomes
                  null instead of being an undefined reference.
      linkonce_odr, weak_odr:
                  Some languages allow differing globals to be merged, such as
                  two functions with different semantics. Other languages, such as C++,
                  ensure that only equivalent globals are ever merged (the “one definition
                  rule” — “ODR”). Such languages can use the linkonce_odr and weak_odr
                  linkage types to indicate that the global will only be merged with
                  equivalent globals. These linkage types are otherwise the same as
                  their non-odr versions.
      external:
                  If none of the above identifiers are used, the global is externally
                  visible, meaning that it participates in linkage and can be used to
                  resolve external symbol references.

      It is illegal for a function declaration to have any linkage type
      other than external or extern_weak.
    */
    syntax NonExternalLinkage ::= "private" | "internal" | "weak" | "weak_odr"  | "common"
                                | "linkonce" | "linkonce_odr" | "available_externally"
                                | "appending" | "linker_private" | "linker_private_weak"
                                | "" [klabel('nonExternalLinkageEmpty),onlyLabel]
    syntax ExternalLinkage ::= "extern_weak" | "external"
    syntax OptLinkage ::= NonExternalLinkage | ExternalLinkage


    /*@
      All Global Variables and Functions have one of the following visibility styles:

      “default” - Default style
                  On targets that use the ELF object file format, default visibility
                  means that the declaration is visible to other modules and,
                  in shared libraries, means that the declared entity may be overridden.
                  On Darwin, default visibility means that the declaration is visible
                  to other modules. Default visibility corresponds to “external linkage”
                  in the language.
      “hidden” - Hidden style
                  Two declarations of an object with hidden visibility refer to the same
                  object if they are in the same shared object. Usually, hidden
                  visibility indicates that the symbol will not be placed into the
                  dynamic symbol table, so no other module (executable or shared library)
                  can reference it directly.
      “protected” - Protected style
                  On ELF, protected visibility indicates that the symbol will be placed
                  in the dynamic symbol table, but that references within the defining
                  module will bind to the local symbol. That is, the symbol cannot be
                  overridden by another module.

      A symbol with internal or private linkage must have default visibility.
    */
    syntax OptVisibilityStyle ::= "default" | "hidden" | "protected"
                               | "" [klabel('visibilityEmpty),onlyLabel]


    /*@
      All Global Variables, Functions and Aliases can have one of the
      following DLL storage class:

      dllimport
          “dllimport” causes the compiler to reference a function or variable via
          a global pointer to a pointer that is set up by the DLL exporting the symbol.
          On Microsoft Windows targets, the pointer name is formed by combining __imp_
          and the function or variable name.
      dllexport
          “dllexport” causes the compiler to provide a global pointer to a pointer
          in a DLL, so that it can be referenced with the dllimport attribute.
          On Microsoft Windows targets, the pointer name is formed by combining
          __imp_ and the function or variable name. Since this storage class exists
         for defining a dll interface, the compiler, assembler and linker know it is
         externally referenced and must refrain from deleting the symbol. 
    */
    syntax OptDllStorageClass ::= "dllimport" | "dllexport"
                                | "" [klabel('dllStorageEmpty),onlyLabel]


    /*@
      LLVM functions, calls and invokes can all have an optional calling convention
      specified for the call. The calling convention of any pair of dynamic caller/callee
      must match, or the behavior of the program is undefined. The following calling
      conventions are supported by LLVM, and more may be added in the future:

      “ccc” - The C calling convention
              This calling convention (the default if no other calling convention is
              specified) matches the target C calling conventions. This calling convention
              supports varargs function calls and tolerates some mismatch in the declared
              prototype and implemented declaration of the function (as does normal C).
      “fastcc” - The fast calling convention
              This calling convention attempts to make calls as fast as possible (e.g.
              by passing things in registers). This calling convention allows the target
              to use whatever tricks it wants to produce fast code for the target, without
              having to conform to an externally specified ABI (Application Binary
              Interface). Tail calls can only be optimized when this, the GHC or the HiPE
              convention is used. This calling convention does not support varargs and
              requires the prototype of all callees to exactly match the prototype
              of the function definition.
      “coldcc” - The cold calling convention
              This calling convention attempts to make code in the caller as efficient
              as possible under the assumption that the call is not commonly executed.
              As such, these calls often preserve all registers so that the call does
              not break any live ranges in the caller side. This calling convention
              does not support varargs and requires the prototype of all callees to
              exactly match the prototype of the function definition. Furthermore
              the inliner doesn’t consider such function calls for inlining.
      “cc 10” - GHC convention
              This calling convention has been implemented specifically for use by
              the Glasgow Haskell Compiler (GHC). It passes everything in registers, going
              to extremes to achieve this by disabling callee save registers. This calling
              convention should not be used lightly but only for specific situations such as
              an alternative to the register pinning performance technique often used when
              implementing functional programming languages. At the moment only X86 supports
              this convention and it has the following limitations:
                On X86-32 only supports up to 4 bit type parameters. No floating
                point types are supported.
                On X86-64 only supports up to 10 bit type parameters and 6 floating point
                parameters.
              This calling convention supports tail call optimization but requires both
              the caller and callee are using it.
      “cc 11” - The HiPE calling convention
              This calling convention has been implemented specifically for use by the
              High-Performance Erlang (HiPE) compiler, the native code compiler of the
              Ericsson’s Open Source Erlang/OTP system. It uses more registers for argument
              passing than the ordinary C calling convention and defines no callee-saved
              registers. The calling convention properly supports tail call optimization
              but requires that both the caller and the callee use it. It uses a register
              pinning mechanism, similar to GHC’s convention, for keeping frequently
              accessed runtime components pinned to specific hardware registers. At the
              moment only X86 supports this convention (both 32 and 64 bit).
      “webkit_jscc” - WebKit’s JavaScript calling convention
              This calling convention has been implemented for WebKit FTL JIT.
              It passes arguments on the stack right to left (as cdecl does), and returns
              a value in the platform’s customary return register.
      “anyregcc” - Dynamic calling convention for code patching
              This is a special convention that supports patching an arbitrary code
              sequence in place of a call site. This convention forces the call arguments
              into registers but allows them to be dynamically allocated. This can currently
              only be used with calls to llvm.experimental.patchpoint because only this
              intrinsic records the location of its arguments in a side table. See Stack
              maps and patch points in LLVM.
      “preserve_mostcc” - The PreserveMost calling convention
              This calling convention attempts to make the code in the caller as
              unintrusive as possible. This convention behaves identically to the C calling
              convention on how arguments and return values are passed, but it uses a
              different set of caller/callee-saved registers. This alleviates the burden
              of saving and recovering a large register set before and after the call in
              the caller. If the arguments are passed in callee-saved registers,
              then they will be preserved by the callee across the call. This doesn’t apply
              for values returned in callee-saved registers.
      “preserve_allcc” - The PreserveAll calling convention
              This calling convention attempts to make the code in the caller even less
              intrusive than the PreserveMost calling convention. This calling convention
              also behaves identical to the C calling convention on how arguments and return
              values are passed, but it uses a different set of caller/callee-saved registers.
              This removes the burden of saving and recovering a large register set before
              and after the call in the caller. If the arguments are passed in callee-saved
              registers, then they will be preserved by the callee across the call. This
              doesn’t apply for values returned in callee-saved registers.
      “cc <n>” - Numbered convention
              Any calling convention may be specified by number, allowing target-specific
              calling conventions to be used. Target specific calling conventions start at 64.

      More calling conventions can be added/defined on an as-needed basis, to support Pascal
      conventions or any other well-known target-independent convention.
    */
    syntax OptCallingConv ::= "ccc" | "fastcc" | "coldcc" | "x86_stdcallcc" | "x86_thiscallcc"
                            | "x86_fastcallcc" | "x86_cdeclmethodcc"| "intel_ocl_bicc"
                            | "arm_apcscc" | "arm_aapcscc" | "arm_aapcs_vfpcc"
                            | "msp430_intrcc" | "ptx_kernel" | "ptx_device"
                            | "spir_func" | "spir_kernel" | "x86_64_sysvcc"
                            | "x86_64_win64cc" | "webkit_jscc" | "anyregcc"
                            | "preserve_mostcc" | "preserve_allcc" | "cc" UnsignedInt
                            | "" [klabel('callingConvEmpty),onlyLabel]


    /*@
      LLVM IR floating-point binary ops (fadd, fsub, fmul, fdiv, frem) have the
      following flags that can be set to enable otherwise unsafe floating point
      operations:

      nnan: No NaNs - Allow optimizations to assume the arguments and result
            are not NaN. Such optimizations are required to retain defined behavior
            over NaNs, but the value of the result is undefined.
      ninf: No Infs - Allow optimizations to assume the arguments and result are
            not +/-Inf. Such optimizations are required to retain defined behavior
            over +/-Inf, but the value of the result is undefined.
      nsz:  No Signed Zeros - Allow optimizations to treat the sign of a zero
            argument or result as insignificant.
      arcp: Allow Reciprocal - Allow optimizations to use the reciprocal of an
            argument rather than perform division.
      fast: Fast - Allow algebraically equivalent transformations that may
            dramatically change results in floating point (e.g. reassociate).
            This flag implies all the others. 
    */
    syntax FastMathFlag ::= "fast" | "nnan" | "ninf" | "nsz" | "arcp"
    syntax FastMathFlags ::= List{FastMathFlag," "}


    /*@
      The return type and each parameter of a function type may have a
      set of parameter attributes associated with them. Parameter
      attributes are used to communicate additional information about the
      result or parameters of a function. Parameter attributes are considered
      to be part of the function, not of the function type, so functions with
      different parameter attributes can have the same function type.
    */
    syntax RetAttr ::= "inreg" [klabel('inregOfReturn)]
                     | "zeroext" [klabel('zeroextOfReturn)]
                     | "signext"  [klabel('signextOfReturn)]
                     | "noalias" [klabel('noaliasOfReturn)]
    syntax RetAttrs ::= List{RetAttr," "}

    syntax ParamAttr ::= Align | "sret" | "nocapture" | "byval"
                       | "nest" | "inalloca" | "returned"
                       | "readnone" [klabel('readnoneOfParam)]
                       | "readonly" [klabel('readonlyOfParam)]
                       | "inreg" [klabel('inregOfParam)]
                       | "zeroext" [klabel('zeroextOfParam)]
                       | "signext"  [klabel('signextOfParam)]
                       | "noalias" [klabel('noaliasOfParam)]
    syntax ParamAttrs ::= List{ParamAttr," "}

    /*@
      Function attributes are set to communicate additional information
      about a function. Function attributes are considered to be part of the
      function, not of the function type, so functions with different function
      attributes can have the same function type.
    */
    syntax CommAttr ::= "noreturn" | "nounwind" | "nobuiltin" | "builtin" | "sspstrong"
                      | "inlinehint" | "noinline" | "uwtable" | "sanitize_thread"
                      | "alwaysinline" | "optsize" | "ssp" | "sspreq" | "naked"
                      | "returns_twice" | "nonlazybind" | "cold" | "minsize" 
                      | "noduplicate" | "noimplicitfloat" | "noredzone" | "optnone"
                      | "sanitize_address" | "sanitize_memory"
                      | "readonly" [klabel('readonlyOfComm)]
                      | "readnone" [klabel('readnoneOfComm)]
                      | #String "=" #String | AttributeGroupId
    syntax FuncAttr ::= CommAttr | alignstack(UnsignedInt)
    syntax FuncAttrs ::= List{FuncAttr," "}
    syntax GroupAttr ::= CommAttr | #String | "alignstack" "=" UnsignedInt
                       | "align" "=" UnsignedInt
    syntax GroupAttrs ::= List{GroupAttr," "}


    /*@
      Comdats have a selection kind to provide input on how the linker
      should choose between keys in two different object files.
      The selection kind must be one of the following:
      any
         The linker may choose any COMDAT key, the choice is arbitrary.
      exactmatch
         The linker may choose any COMDAT key but the sections
         must contain the same data.
      largest
         The linker will choose the section containing the
         largest COMDAT key.
      noduplicates
         The linker requires that only section with this
         COMDAT key exist.
      samesize
         The linker may choose any COMDAT key but the sections must
         contain the same amount of data. 
    */
    syntax SelectionKind ::= "any" | "exactmatch" | "largest"
                           | "noduplicates" | "samesize"


    /*@
      Each function may specify a garbage collector strategy name.
      The supported values of name includes those built in to LLVM and any provided
      by loaded plugins. Specifying a GC strategy will cause the compiler to alter
      its output in order to support the named garbage collection algorithm.
      Note that LLVM itself does not contain a garbage collector, this functionality
      is restricted to generating machine code which can interoperate with a
      collector provided externally.
    */
    syntax OptGC ::= "gc" #String | "" [klabel('gcEmpty),onlyLabel]


    /*@
      Prefix data is data associated with a function which the code generator
      will emit immediately before the function’s entrypoint. The purpose of this
      feature is to allow frontends to associate language-specific runtime metadata
      with specific functions and make it available through the function pointer
      while still allowing the function pointer to be called.
    */
    syntax OptPrefix ::= "prefix" Type ValueRef | "" [klabel('prefixEmpty),onlyLabel]


    /*@
      The prologue attribute allows arbitrary code (encoded as bytes) to
      be inserted prior to the function body. This can be used for enabling function
      hot-patching and instrumentation.
      To maintain the semantics of ordinary function calls, the prologue data must
      have a particular format. Specifically, it must begin with a sequence of bytes
      which decode to a sequence of machine instructions, valid for the module’s target,
      which transfer control to the point immediately succeeding the prologue data,
      without performing any other visible action. This allows the inliner and other
      passes to reason about the semantics of the function definition without needing
      to reason about the prologue data. Obviously this makes the format of the prologue
      data highly target dependent.
    */
    syntax OptPrologue ::= "prologue" Type ValueRef | "" [klabel('prologueEmpty),onlyLabel]


    /*@
      The section attribute allows you to specify a specific section
      a global variable or function should be in after translation.
      LLVM allows an explicit section to be specified for functions.
      If the target supports it, it will emit functions to the section specified. 
      Additionally, the function can be placed in a COMDAT.
    */
    syntax OptSection ::= "section" #String | "" [klabel('sectionEmpty),onlyLabel]


    /*@
      Comdat IR provides access to COFF and ELF object file COMDAT functionality.
      Comdats have a name which represents the COMDAT key. All global objects that
      specify this key will only end up in the final object file if the linker chooses
      that key over some other key. Aliases are placed in the same COMDAT that their
      aliasee computes to, if any.
    */
    syntax Comdat ::= comdat(ComdatVar) | "comdat" [klabel('simplifiedComdat)]
    syntax OptComdat ::= Comdat | "" [klabel('comdatEmpty),onlyLabel]


    /*@
      An explicit alignment may be specified for a function. If not present,
      or if the alignment is set to zero, the alignment of the function is set by
      the target to whatever it feels convenient. If an explicit alignment is
      specified, the function is forced to have at least that much alignment.
      All alignments must be a power of 2.
    */
    syntax Align ::= "align" UnsignedInt
    syntax OptAlign ::= Align | "" [klabel('alignEmpty),onlyLabel]
    syntax OptSectionComdatAndAlign ::= "" [klabel('sectionComdatAndAlignEmpty),onlyLabel]
                                | "," "section" #String
                                | "," Align
                                | "," Comdat
                                | "," Comdat "," Align
                                | "," "section" #String "," Align
                                | "," "section" #String "," Comdat
                                | "," "section" #String "," Comdat "," Align


    /*@
      an optional address space attribute defines the numbered address
      space where the pointed-to object resides.
      Global variables can be marked with unnamed_addr which indicates
      that the address is not significant, only the content
      If the unnamed_addr attribute is given for a function, the address
      is known to not be significant and two identical functions can be merged.
    */
    syntax OptAddrSpace ::= addrspace(UnsignedInt) | "" [klabel('addrEmpty),onlyLabel]
    syntax OptUnnamedAddr ::= "unnamed_addr" | "" [klabel('unnamedEmpty),onlyLabel]


    /*@
      "inbounds" is an attribute in the getelementptr instruction.
      If the inbounds keyword is present, the result value of the getelementptr
      is a poison value if the base pointer is not an in bounds address of an
      allocated object, or if any of the addresses that would be formed by
      successive addition of the offsets implied by the indices to the base address
      with infinitely precise signed arithmetic are not an in bounds address of
      that allocated object.
      If the inbounds keyword is not present, the offsets are added to the base
      address with silently-wrapping two’s complement arithmetic.
    */
    syntax OptInBounds ::= "inbounds" | "" [klabel('inBoundsEmpty),onlyLabel]


    /*@
      "sideeffect", "alignstack" and "inteldialect" are attributes that are used in
      the asm instruction which is known as the inline assembler expression.
      LLVM supports inline assembler expressions (as opposed to Module-Level Inline
      Assembly) through the use of a special value.
      Inline asms with side effects not visible in the constraint list must be marked
      as having side effects. This is done through the use of the ‘sideeffect‘ keyword.
      The compiler should make conservative assumptions about what the asm might
      contain and should generate its usual stack alignment code in the prologue if the
      ‘alignstack‘ keyword is present.
      When the ‘inteldialect‘ keyword is present, the inline asm is using the Intel dialect.
    */
    syntax OptSideEffect ::= "sideeffect" | "" [klabel('sideeffectEmpty),onlyLabel]
    syntax OptAlignstack ::= "alignstack" | "" [klabel('alignstackEmpty),onlyLabel]
    syntax OptInteldialect ::= "inteldialect"
                             | "" [klabel('inteldialectEmpty),onlyLabel]
    //define a AsmBlock to be a string constant.
    syntax AsmBlock ::= #String

    /*@
      A variable may be defined as thread_local, which means that it will not
      be shared by threads (each thread will have a separated copy of the variable).
      Not all targets support thread-local variables. Optionally, a TLS model may be
      specified:

       localdynamic
         For variables that are only used within the current shared library.
       initialexec
         For variables in modules that will not be loaded dynamically.
       localexec
         For variables defined in the executable and only used within it.

      If no explicit model is given, the “general dynamic” model is used.
    */
    syntax OptThreadLocal ::= "thread_local" "(" ThreadLocalAttr ")" | "thread_local"
                         | "" [klabel('threadLocalEmpty),onlyLabel]
    syntax ThreadLocalAttr ::= "localdynamic" | "initialexec" | "localexec"


    /*@
      This attribute is used in defining global variables.
      By default, global initializers are optimized by assuming that
      global variables defined within the module are not modified from
      their initial values before the start of the global initializer.
      This is true even for variables potentially accessible from outside
      the module, including those with external linkage or appearing in @llvm.used
      or dllexported variables. This assumption may be suppressed by marking
      the variable with externally_initialized.
    */
    syntax OptExternallyInitialized ::= "externally_initialized"
                                      | "" [klabel('externallyInitEmpty),onlyLabel]


    /*@
      This attribute is used in specifying whether or not a variable is a
      global constant or a constant global variable.
      A variable may be defined as a global constant, which indicates that
      the contents of the variable will never be modified (enabling better
      optimization, allowing the global data to be placed in the read-only section
      of an executable, etc). Note that variables that need runtime initialization
      cannot be marked constant as there is a store to the variable.
      LLVM explicitly allows declarations of global variables to be marked constant,
      even if the final definition of the global is not. This capability can be
      used to enable slightly better optimization of the program, but requires the
      language definition to guarantee that optimizations based on the ‘constantness’
      are valid for the translation units that do not include the definition.
    */
    syntax GlobalType ::= "global" | "constant"


    /*@
      Opaque structure types are used to represent named structure types that
      do not have a body specified. This corresponds (for example) to the C notion
      of a forward declared structure.
    */
    syntax OpaqueType ::= "opaque"


    /*@
      The LLVM type system is one of the most important features of the
      intermediate representation. Being typed enables a number of optimizations
      to be performed on the intermediate representation directly, without having
      to do extra analyses on the side before the transformation. A strong type
      system makes it easier to read the generated code and enables novel analyses
      and transformations that are not feasible to perform on normal three address
      code representations.
      The void type does not represent any value and has no size.
      The function type can be thought of as a function signature.
      The integer type is a very simple type that simply specifies an arbitrary
      bit width for the integer type desired. Any bit width from 1 bit to 223-1
      (about 8 million) can be specified.
      half          16-bit floating point value
      float         32-bit floating point value
      double        64-bit floating point value
      fp128         128-bit floating point value (112-bit mantissa)
      x86_fp80      80-bit floating point value (X87)
      ppc_fp128     128-bit floating point value (two 64-bits)
      The x86_mmx type represents a value held in an MMX register on an x86 machine.
      The pointer type is used to specify memory locations. Pointers are commonly
      used to reference objects in memory.
      A vector type is a simple derived type that represents a vector of elements.
      The label type represents code labels.
      The metadata type represents embedded metadata. No derived types
      may be created from metadata except for function arguments.
      The array type is a very simple derived type that arranges elements
      sequentially in memory. The array type requires a size (number of
      elements) and an underlying data type.
      The structure type is used to represent a collection of data members
      together in memory. The elements of a structure may be any type that has a size.
    */
    syntax IntType ::= Token{[i][1-9][0-9]*}
    syntax FPType  ::= "float" | "double" | "ppc_fp128" | "fp128"
                     | "x86_fp80" | "half"
    syntax PrimType ::= FPType | IntType | "label"
    syntax VoidType ::= "void"
    syntax NonVoidType ::= "metadata"
                         | "x86_mmx"
                         | PrimType
                         | Type OptAddrSpace "*"
                         | LocalName
                         | Type "(" ArgList ")"
                         | "[" UnsignedInt "x" Type "]"
                         | "<" UnsignedInt "x" Type ">"
                         | "{" TypeList "}"
                         | "<" "{" TypeList "}" ">"
    syntax Type ::= VoidType | NonVoidType
    syntax TypeList ::= List{Type,","}


    /*@
      The two arguments to the these instructions must be integer or vector
      of integer values. Both arguments must have identical types.
    */
    syntax IntConstructors ::= "add" | "sub" | "mul" | "shl"


    /*@
      The two arguments to the these instructions must be integer
      or vector of integer values. Both arguments must have identical types.
      If the exact keyword is present, the result value of them is a poison
      value if %op1 is not a multiple of %op2 (as such,
      “((a udiv exact b) mul b) == a”).
    */
    syntax DivConstructors ::= "udiv" | "sdiv" | "lshr" | "ashr"


    /*@
      The two arguments to the these instructions must be floating
      point or vector of floating point values. Both arguments
      must have identical types.
      This instruction can also take any number of fast-math flags,
      which are optimization hints to enable otherwise unsafe floating
      point optimizations.
    */
    syntax FloatOps ::= "fadd" | "fsub" | "fmul" | "fdiv" | "frem"


    /*@
      The two arguments to the ‘urem‘ instruction must be integer or vector
      of integer values. Both arguments must have identical types.
    */
    syntax ArithmeticOps ::= "urem" | "srem"


    /*@
      Binary operators are used to do most of the computation in a program.
      They require two operands of the same type, execute an operation on them,
      and produce a single value. The operands might represent multiple data,
      as is the case with the vector data type. The result value has the same
      type as its operands.
    */
    syntax BinaryOps ::= IntConstructors OptNW
                      | DivConstructors OptExact
                      | FloatOps FastMathFlags
                      | ArithmeticOps


    /*@
      The two arguments to the ‘xor‘ instruction must be integer or vector
      of integer values. Both arguments must have identical types.
      The ‘and‘ instruction returns the bitwise logical and of its two operands.
      The ‘or‘ instruction returns the bitwise logical inclusive or of its
      two operands.
      The ‘xor‘ instruction returns the bitwise logical exclusive
      or of its two operands. The xor is used to implement the “one’s complement”
      operation, which is the “~” operator in C.
    */
    syntax LogicalOps ::= "and" | "or" | "xor"


    /*@
      The instructions in this category are the conversion instructions (casting)
      which all take a single operand and a type. They perform various bit
      conversions on the operand.
    */
    syntax CastOps ::= "trunc" | "zext" | "sext" | "fptrunc"
                     | "fpext" | "bitcast" | "uitofp" | "sitofp"
                     | "fptoui" | "fptosi" | "inttoptr"
                     | "addrspacecast" | "ptrtoint"


    /*@
      The ‘icmp‘ instruction returns a boolean value or a vector of boolean
      values based on comparison of its two integer, integer vector, pointer,
      or pointer vector operands.
      The ‘icmp‘ instruction takes three operands. The first operand is
      the condition code indicating the kind of comparison to perform.
      It is not a value, just a keyword. The possible condition code are:

         eq: equal
         ne: not equal
         ugt: unsigned greater than
         uge: unsigned greater or equal
         ult: unsigned less than
         ule: unsigned less or equal
         sgt: signed greater than
         sge: signed greater or equal
         slt: signed less than
         sle: signed less or equal

      The remaining two arguments must be integer or pointer or integer
      vector typed. They must also be identical types.
    */
    syntax IPredicate ::= "eq" | "ne" | "slt" | "sgt" | "sle" | "sge"
                         | "ult" [klabel('ultOfIcmp)]
                         | "ugt" [klabel('ugtOfIcmp)]
                         | "ule" [klabel('uleOfIcmp)]
                         | "uge" [klabel('ugeOfIcmp)]


    /*@
      The ‘fcmp‘ instruction returns a boolean value or vector of boolean
      values based on comparison of its operands.
      If the operands are floating point scalars, then the result type
      is a boolean (i1).
      If the operands are floating point vectors, then the result type is
      a vector of boolean with the same number of elements as the operands
      being compared.
    */
    syntax FPredicate ::= "oeq" | "one" | "olt" | "ogt" | "ole" 
                         | "oge" | "ord" | "uno" | "ueq" | "une" | Bool
                         | "ult" [klabel('ultOfFcmp)]
                         | "ugt" [klabel('ugtOfFcmp)]
                         | "ule" [klabel('uleOfFcmp)]
                         | "uge" [klabel('ugeOfFcmp)]


    /*@
      The following section defines some useful shortcuts for the syntax
      of LLVM. It includes definiting a construct for the "Type Value"
      combination and another construct for the "IntegerType Value" combination.
    */
    syntax ResolvedVal ::= Type ValueRef
    syntax IntResolveVal ::= IntType ValueRef [klabel('intResolveVal)]
    syntax IntResolveVals ::= "" [klabel('.IntResolveVals),onlyLabel]
                            | "," IntResolveVal IntResolveVals
    syntax ReturnedVal ::= List{ResolvedVal,","}
    syntax Index ::= ResolvedVal | "null"  [klabel('nullOfIndex)]
    syntax IndexList ::= List{Index,","}


    /*@
      Symbolic value reference is including local names, 
      global variables, local valid ids and global valid ids.
     */
    syntax SymbolicValueRef ::= LocalName | GlobalName


    /*@
      LLVM has several different basic types of constants.
      This section describes them all and their syntax.
      Boolean constants:
             The two strings ‘true‘ and ‘false‘ are both valid constants
             of the i1 type.
      Integer constants:
             Standard integers (such as ‘4’) are constants of the integer type.
             Negative numbers may be used with integer types.
      Floating point constants:
             Floating point constants use standard decimal notation (e.g. 123.421)
             and exponential notation (e.g. 1.23421e+2).
      Null pointer constants:
             The identifier ‘null‘ is recognized as a null pointer constant
             and must be of pointer type.
      Structure constants:
             Structure constants are represented with notation similar to structure
             type definitions (a comma separated list of elements, surrounded by
             braces ({})).
      Array constants:
             Array constants are represented with notation similar to array
             type definitions (a comma separated list of elements, surrounded
             by square brackets ([])).
      Vector constants:
             Vector constants are represented with notation similar to vector
             type definitions (a comma separated list of elements, surrounded
             by less-than/greater-than’s (<>)).
      Zero initialization:
             String ‘zeroinitializer‘ can be used to zero initialize a value
             to zero of any type, including scalar and aggregate types.
      Metadata node:
             A metadata node is a constant tuple without types. For example:
             “!{!0, !{!2, !0}, !"test"}”.
    */
    syntax ValueRef ::= SymbolicValueRef | ConstValueRef
    syntax ConstValueRef ::= Int | FpVal | Bool | ConstExpr
                           | "null" | "undef" | "zeroinitializer"
                           | "<" ReturnedVal ">"
                           | "[" ReturnedVal "]"
                           | "{" ReturnedVal "}"
                           | "<" "{" ReturnedVal "}" ">"
                           | "c" #String
                           | "asm" OptSideEffect OptAlignstack OptInteldialect
                             #String "," #String
                           | "!" UnsignedInt
                           | "!" #String
                           | "!" "(" IndexList ")"
    //define the values that appear in a metadata list
    syntax MetadataValue ::= "!" UnsignedInt [klabel('metaValueInVarForm)]
    syntax MetadataValues ::= List{MetadataValue," "}


    /*@
      Constant expressions are used to allow expressions involving other
      constants to be used as constants. Constant expressions may be of
      any first class type and may involve any LLVM operation that does
      not have side effects (e.g. load and call are not supported).
      The following is the syntax for constant expressions.
    */
    syntax ConstantIndexList ::= "," UnsignedInt | ConstantIndexList "," UnsignedInt
    syntax ConstExpr::= CastOps "(" ResolvedVal "to" Type ")"
                      | BinaryOps(ResolvedVal, ResolvedVal)
                      | LogicalOps(ResolvedVal, ResolvedVal)
                      | blockaddress(ValueRef, ValueRef)
                      | "icmp" IPredicate "(" ResolvedVal "," ResolvedVal ")"
                      | "fcmp" FPredicate "(" ResolvedVal "," ResolvedVal ")"
                      | "extractvalue" "(" ResolvedVal ConstantIndexList ")"
                      | "insertvalue" "(" ResolvedVal "," ResolvedVal ConstantIndexList ")"
                      | shufflevector(ResolvedVal, ResolvedVal, ResolvedVal)
                      | "getelementptr" OptInBounds "(" ReturnedVal ")"
                      | select(ResolvedVal, ResolvedVal, ResolvedVal)
                      | extractelement(ResolvedVal, ResolvedVal)
                      | insertelement(ResolvedVal, ResolvedVal, ResolvedVal)


   //definition the constructs for tail call and call
   syntax OptTailCall ::= "tail" "call" | "call"

    /*@
      This attribute is used in the landingpad instruction.
      The optional cleanup flag indicates that the landing pad block is a cleanup.
    */
    syntax OptCleanup ::= "cleanup" | "" [klabel('cleanupEmpty),onlyLabel]

    /*@
      define the factors for the landingpad instruction.
      A clause begins with the clause type — catch or filter —
      and contains the global variable representing the “type” that may
      be caught or filtered respectively. 
    */
    syntax LandingpadFactor ::= "catch" ResolvedVal | "filter" ResolvedVal
    syntax LandingpadFactors ::= List{LandingpadFactor," "}

    //define the allocation metadata. It is a syntactic convince to define it like this.
    syntax AllocMetadata ::= Type | Type "," Align
                           | Type "," IntType ValueRef
                           | Type "," IntType ValueRef "," Align

    /*@
      The inalloca argument attribute allows the caller to take the address
      of outgoing stack arguments.
    */
    syntax OptInalloca ::= "inalloca" [klabel('inallocaOfAlloca)]
                         | "" [klabel('inallocaEmpty),onlyLabel]

    /*@
      Atomic instructions (cmpxchg, atomicrmw, fence, atomic load, and
      atomic store) take ordering parameters that determine which other
      atomic instructions on the same address they synchronize with.
      unordered:
         The set of values that can be read is governed by the happens-before
         partial order. A value cannot be read unless some operation wrote it.
      monotonic:
         In addition to the guarantees of unordered, there is a single total
         order for modifications by monotonic operations on each address.
      acquire:
         In addition to the guarantees of monotonic, a synchronizes-with edge
         may be formed with a release operation. This is intended to model C++’s
         memory_order_acquire.
      release:
         In addition to the guarantees of monotonic, if this operation writes
         a value which is subsequently read by an acquire operation, it
         synchronizes-with that operation.
      acq_rel (acquire+release):
         Acts as both an acquire and release operation on its address.
         This corresponds to the C++0x/C1x memory_order_acq_rel.
      seq_cst (sequentially consistent):
         In addition to the guarantees of acq_rel (acquire for an operation
         that only reads, release for an operation that only writes), there is a
         global total order on all sequentially-consistent operations on all
         addresses, which is consistent with the happens-before partial order
         and with the modification orders of all the affected addresses.

      If an atomic operation is marked singlethread, it only synchronizes with
      or participates in modification and seq_cst total orderings with other
      operations running in the same thread (for example, in signal handlers).
    */
    syntax Ordering ::= "unordered" | "monotonic" | "acquire" | "release"
                         | "acq_rel" | "seq_cst"
    syntax OptSingleThread ::= "singlethread"
                             | "" [klabel('singlethreadEmpty),onlyLabel]
    syntax OptScopeOrder ::= OptSingleThread Ordering
                           | "" [klabel('scopeorderEmpty),onlyLabel]
    syntax OrderingList ::= Ordering | Ordering OrderingList

    /*@
      There are three arguments to the ‘atomicrmw‘ instruction: an operation to apply,
      an address whose value to modify, an argument to the operation. The operation
      must be one of the following keywords: 
        xchg
        add
        sub
        and
        nand
        or
        xor
        max
        min
        umax
        umin
    */
    syntax BinOpsForAtomicrmw ::= "xchg" | "nand" | "max"
                                | "umax" | "umin" | "min"
                                | "add" [klabel('addOfAtomicrmw)]
                                | "sub" [klabel('subOfAtomicrmw)]
                                | "and" [klabel('andOfAtomicrmw)]
                                | "or" [klabel('orOfAtomicrmw)]
                                | "xor" [klabel('xorOfAtomicrmw)]

    //define the metadata in the tail of all instructions.
    syntax InstructionMetadata ::= MetadataVar "!" UnsignedInt
                                 | MetadataVar "!" "{" IndexList "}"
    syntax InstructionMetadatas ::= "" [klabel('.InstructionMetadatas),onlyLabel]
                                 | "," InstructionMetadata InstructionMetadatas

    //define parameter lists. It is a syntactic convince to define it like this.
    syntax ParamFactor ::= Type ParamAttrs ValueRef [klabel('paramFactor)]
    syntax ParamList ::= List{ParamFactor,","}

    /*@
      Define phi lists for the use of blocks in a phi function.
      The ‘phi‘ instruction takes a list of pairs as arguments,
      with one pair for each predecessor basic block of the current block.
    */
    syntax PHIList ::= "[" ValueRef "," ValueRef "]"
                     | PHIList "," "[" ValueRef "," ValueRef "]"

    /*@
      Define jump tables for the switch instruction.
      It is an array of pairs of comparison value constants and ‘label‘s.
      The table is not allowed to contain duplicate constant entries.
    */
    syntax JumpTableEntry ::= IntType ConstValueRef "," LabelValue
    syntax JumpTable ::= List{JumpTableEntry," "}
    syntax LabelValue ::= "label" ValueRef
    syntax LabelValues ::= List{LabelValue,","}


    /*@
      The LLVM instruction set consists of several different classifications
      of instructions: terminator instructions, binary instructions, bitwise binary
      instructions, memory instructions, and other instructions.
    */
    syntax InstructionList ::= List{Instruction," "}
    syntax Instruction ::= LocalAssign InstVal | InstVal
                         | "store" OptAtomic OptVolatile ResolvedVal "," ResolvedVal
                           OptScopeOrder  "," OptAlign InstructionMetadatas
                         | "store" OptAtomic OptVolatile ResolvedVal "," ResolvedVal
                           OptScopeOrder InstructionMetadatas
                         | "fence" OptSingleThread Ordering InstructionMetadatas

    /*@
      The InstVal defines a set of instructions that can have a local name associated
       with it.
    */
    syntax InstVal ::= BinaryOps ResolvedVal "," ValueRef InstructionMetadatas
                     | LogicalOps ResolvedVal "," ValueRef InstructionMetadatas
                     | "icmp" IPredicate ResolvedVal "," ValueRef InstructionMetadatas
                     | "fcmp" FPredicate ResolvedVal "," ValueRef InstructionMetadatas
                     | CastOps ResolvedVal "to" Type InstructionMetadatas
                     | "select" ResolvedVal "," ResolvedVal "," ResolvedVal
                     | "va_arg" ResolvedVal "," Type InstructionMetadatas
                     | "getelementptr" OptInBounds ResolvedVal
                       IntResolveVals InstructionMetadatas
                     | "extractelement" ResolvedVal "," ResolvedVal InstructionMetadatas
                     | "insertelement" ResolvedVal "," ResolvedVal
                       "," ResolvedVal InstructionMetadatas
                     | "shufflevector" ResolvedVal "," ResolvedVal
                       "," ResolvedVal InstructionMetadatas
                     | "phi" Type PHIList InstructionMetadatas
                     | "landingpad" Type "personality" ResolvedVal OptCleanup
                       LandingpadFactors InstructionMetadatas
                     | OptTailCall OptCallingConv RetAttrs ResolvedVal
                       "(" ParamList ")" FuncAttrs InstructionMetadatas
                     | "alloca" OptInalloca AllocMetadata
                     | "load" OptAtomic OptVolatile ResolvedVal
                       OptScopeOrder "," OptAlign InstructionMetadatas
                     | "load" OptAtomic OptVolatile ResolvedVal
                       OptScopeOrder InstructionMetadatas
                     | "cmpxchg" OptVolatile ResolvedVal "," ResolvedVal ","
                       ResolvedVal OptSingleThread OrderingList InstructionMetadatas
                     //The ‘atomicrmw‘ instruction is used to atomically modify memory.
                     | "atomicrmw" OptVolatile BinOpsForAtomicrmw ResolvedVal
                       "," ResolvedVal OptSingleThread Ordering InstructionMetadatas
                     | "extractvalue" ResolvedVal ConstantIndexList InstructionMetadatas
                     | "insertvalue" ResolvedVal "," ResolvedVal
                       ConstantIndexList InstructionMetadatas


    /*@
      As mentioned previously, every basic block in a program ends with a “Terminator”
      instruction, which indicates which block should be executed after the current block
      is finished. These terminator instructions typically yield a ‘void‘ value:
      they produce control flow, not values (the one exception being the ‘invoke‘ instruction).
    */
    syntax BBTerminatorInstruction ::= "ret" NonVoidType ValueRef InstructionMetadatas
                                     | "ret" VoidType InstructionMetadatas
                                     | "br" LabelValue InstructionMetadatas
                                     | "br" IntType ValueRef ","
                                       LabelValue "," LabelValue InstructionMetadatas
                                     | "resume" ResolvedVal InstructionMetadatas
                                     | "indirectbr" ResolvedVal ","
                                       "[" LabelValues "]" InstructionMetadatas
                                     | "switch" IntType ValueRef ","
                                       LabelValue "[" JumpTable "]" InstructionMetadatas
                                     | "invoke" OptCallingConv RetAttrs Type
                                       ValueRef "(" ParamList ")" FuncAttrs
                                       "to" LabelValue "unwind" LabelValue InstructionMetadatas
                                     | LocalAssign "invoke" OptCallingConv RetAttrs Type
                                       ValueRef "(" ParamList ")" FuncAttrs
                                       "to" LabelValue "unwind" LabelValue InstructionMetadatas
                                     | "unreachable" InstructionMetadatas


    /*@
      Aliases, unlike function or variables, don’t create any new data.
      They are just a new symbol and metadata for an existing position.
      Aliases have a name and an aliasee that is either a global value
      or a constant expression.
    */
    syntax AliaseeRef ::= ResolvedVal
                        | "bitcast" "(" AliaseeRef "to" Type ")"
                        | "getelementptr" OptInBounds "(" IndexList ")" [klabel('elemPtrAliasee)]

    /*@
      Define target definitions for the target definition.
      datalayout: A module may specify a target specific data layout string
                  that specifies how data is to be laid out in memory.
      triple: A module may specify a target triple string that describes the target host.
    */
    syntax TargetDefinition ::= "triple" "=" #String
                       | "datalayout" "=" #String

    //Define libraries definitions for the values of the definition of deplibs.
    syntax LibrariesDefinition ::= "[" Strings "]" [klabel('deplibsValues)]

    //Define argument lists for the function header.
    syntax ArgType ::= Type ParamAttrs
                      | Type ParamAttrs LocalVar
    syntax ArgList ::= "" [klabel('argListUnit),onlyLabel] | "..."
                     | ArgType
                     | ArgType "," ArgList

    /*@
      LLVM function declarations consist of the “declare” keyword, an optional
      linkage type, an optional visibility style, an optional DLL storage class,
      an optional calling convention, an optional unnamed_addr attribute, a return type,
      an optional parameter attribute for the return type, a function name, a possibly
      empty list of arguments, an optional alignment, an optional garbage collector name,
      an optional prefix, and an optional prologue.
    */
    syntax FunctionHeader ::= OptCallingConv RetAttrs Type GlobalName
                               "(" ArgList ")" OptUnnamedAddr FuncAttrs OptSection
                                OptComdat OptAlign OptGC OptPrefix OptPrologue
    syntax FunctionProto ::= ExternalLinkage OptVisibilityStyle FunctionHeader
                           | OptDllStorageClass OptVisibilityStyle FunctionHeader

    /*@
      A function definition contains a list of basic blocks, forming the CFG
      (Control Flow Graph) for the function. Each basic block may optionally start
      with a label (giving the basic block a symbol table entry), contains a list of
      instructions, and ends with a terminator instruction (such as a branch or function
      return). If an explicit label is not provided, a block is assigned an implicit numbered
      label, using the next value from the same counter as used for unnamed temporaries.
    */
    syntax BasicBlock ::= InstructionList BBTerminatorInstruction
                        | LabelStringConstant InstructionList BBTerminatorInstruction
    syntax BasicBlockList ::= BasicBlock BasicBlockList | BasicBlock

    /*@
      LLVM function definitions consist of the “define” keyword, an optional linkage
      type, an optional visibility style, an optional DLL storage class, an optional
      calling convention, an optional unnamed_addr attribute, a return type, an optional
      parameter attribute for the return type, a function name, a (possibly empty) argument
      list (each with optional parameter attributes), optional function attributes, an optional
      section, an optional alignment, an optional comdat, an optional garbage collector name,
      an optional prefix, an optional prologue, an opening curly brace, a list of basic blocks,
      and a closing curly brace.
    */
    syntax Function ::= OptLinkage OptVisibilityStyle FunctionHeader "{" BasicBlockList "}"


    /*@
      LLVM programs are composed of Module‘s, each of which is a translation unit
      of the input programs. Each module consists of functions, global variables,
      and symbol table entries. Modules may be combined together with the LLVM linker,
      which merges function (and global variable) definitions, resolves forward declarations,
      and merges symbol table entries.
      In general, a module is made up of a list of global values (where both functions and
      global variables are global values). Global values are represented by a pointer to
      a memory location (in this case, a pointer to an array of char, and a pointer to a
      function), and have one of the following linkage types.
    */
    syntax Definition ::= "define" Function
                        | "declare" FunctionProto
                        | "module" "asm" AsmBlock
                        | LocalAssign "type" Type
                        | LocalAssign "type" OpaqueType
                        | GlobalAssign ExternalLinkage OptVisibilityStyle
                          OptDllStorageClass OptThreadLocal OptAddrSpace
                          OptUnnamedAddr OptExternallyInitialized GlobalType
                          Type OptSectionComdatAndAlign
                        | GlobalAssign NonExternalLinkage OptVisibilityStyle
                          OptDllStorageClass OptThreadLocal OptAddrSpace
                          OptUnnamedAddr OptExternallyInitialized GlobalType
                          Type ValueRef OptSectionComdatAndAlign
                        | GlobalAssign OptLinkage OptVisibilityStyle
                          "alias" OptLinkage AliaseeRef
                        | "target" TargetDefinition
                        | "deplibs" "=" LibrariesDefinition
                        | "!" UnsignedInt "=" Type "!" "{" IndexList "}"
                        | MetadataVar "=" "!" "{" MetadataValues "}"
                        | ComdatVar "=" "comdat" SelectionKind
                        | "attributes" AttributeGroupId "=" "{" GroupAttrs "}"

    syntax Module ::= List{Definition," "}

endmodule


module LLVM-ABSTRACTSYNTAX
    imports LLVM-SYNTAX

    syntax KResult ::= Int | String | Float
                      | arrayValue(KList)
                      | Loc
                      | IntegerType(K)
                      | PointerType(K, K) //type, address space
                      | ArrayTypeValue(K, K)
                      | StructTypeValue(K)
                      | listK(KList)  [latex({#1})]

    syntax NonVoidType ::= ArrayType(K, K) [strict] // inner type, length
                         | StructType(K) [strict]

    rule [ I:UnsignedInt x T:Type ] => ArrayType(
                                    String2Int(#tokenToString(I)),T) [macro]
    rule T:Type A:OptAddrSpace * => PointerType(T, A) [macro]
    rule { Ts:TypeList } => StructType(Ts) [macro]
    rule < { Ts:TypeList } > => StructType(Ts) [macro]

    //change IntType from LLVM syntax to K rule syntax
    rule I:IntType => IntegerType(String2Int(substrString(#tokenToString(I),
                        1, lengthString(#tokenToString(I))))) [macro]

    syntax Loc ::= loc(Int, Int)    // TODO [semantic]
    syntax Loc ::= funptr(K)

    syntax Nat ::= ptrByte(K, K) // address, byteNumber; part of a pointer, as a byte
    syntax Nat ::= floatByte(K, K, K) // float, type, byte number
    rule isNat(ptrByte(_, _)) => true
    rule isNat(floatByte(_, _, _)) => true

    syntax KItem ::= "debug" // TODO [semantic]
    syntax KItem ::= "callMain" // TODO [semantic]
    syntax KItem ::= "initGlobals" // TODO [semantic]

    syntax SymbolicValueRef ::= Name(#String)

    syntax KItem ::= theDefinition(K,K) [strict]
    syntax KItem ::= INotEq(K, K, K) [strict] // type, left op, right op
    syntax KItem ::= IEq(K, K, K) [strict]
    syntax KItem ::= UGT(K, K, K) [strict]
    syntax KItem ::= UGE(K, K, K) [strict]
    syntax KItem ::= ULT(K, K, K) [strict]
    syntax KItem ::= ULE(K, K, K) [strict]
    syntax KItem ::= SGT(K, K, K) [strict]
    syntax KItem ::= SGE(K, K, K) [strict]
    syntax KItem ::= SLT(K, K, K) [strict]
    syntax KItem ::= SLE(K, K, K) [strict]

    syntax KItem ::= OEQ(K, K, K) [strict]
    syntax KItem ::= OGT(K, K, K) [strict]
    syntax KItem ::= OGE(K, K, K) [strict]
    syntax KItem ::= OLT(K, K, K) [strict]
    syntax KItem ::= OLE(K, K, K) [strict]
    syntax KItem ::= ONE(K, K, K) [strict]
    syntax KItem ::= ORD(K, K, K) [strict]
    syntax KItem ::= UNE(K, K, K) [strict]
    //syntax LLVM ::= UNE(K, K, K) [strict]
    syntax KItem ::= UNO(K, K, K) [strict]
    syntax KItem ::= UEQ(K, K, K) [strict]

endmodule

module LLVM-SETTINGS
    imports LLVM-ABSTRACTSYNTAX

    syntax Int ::= "numBitsPerByte" [function]
    rule numBitsPerByte => 8

    syntax Int ::= "numBytesPerPointer" [function]
    rule numBytesPerPointer => 4
endmodule

module LLVM-HELPERS
    imports LLVM-SETTINGS

    syntax KList ::= StringToKList(String) [function]
    rule StringToKList("") => .KList
    rule
        StringToKList(S:String)
            => String2Char(substrString(S:String, 0, 1))
            ,, StringToKList(substrString(S:String, 1, lengthString(S:String)))
        when S:String =/=String ""


    // TODO many possible errors will slip by with this, but lots of stuff will work
    rule null<:ConstValueRef => loc(-1, 0) [anywhere]

    syntax Int ::= base(Loc)
    rule base(loc(Base:Int, _)) => Base:Int
    
    syntax Int ::= offset(Loc)
    rule offset(loc(_, Offset:Int)) => Offset:Int
    
    syntax Loc ::= Loc "+" Int
    // TODO not checking for null
    
    rule loc(Base:Int, Offset:Int) + Offset':Int
            => loc(Base:Int, Offset:Int +Int Offset':Int)

    syntax KItem ::= splitBytes(K, K) // value, type
    syntax KItem ::= joinBytes(K, K) [strict(1)]

    syntax Nat ::= wvalist(List, K)
    rule isNat(wvalist(_, _)) => true

    syntax KItem ::= "byteType" [function]
    rule byteType => IntegerType(numBitsPerByte)

    syntax KItem ::= i(K) [function]//[latex "i({#1})"]
    rule i(N:Int) => IntegerType(N)

    syntax Int ::= sizeofInBits(K) [function]

    syntax Loc ::= intToPtr(K, K)
    syntax Int ::= ptrToInt(K, K)
    syntax KItem ::= read(K, K) [strict(1)]
    syntax KItem ::= write(K, K, K) [strict] // type, value, location

    syntax Kitem ::= innerType(K) [function]
    rule innerType(PointerType(K:K, _)) => K:K
    rule innerType(ArrayType(K:K, _)) => K:K

    // these give the two's complement signed max and min of a type
    syntax Int ::= smax(K) [function]
    syntax Int ::= smin(K) [function]
    rule smax(Type:KResult) => (2 ^Int absInt(sizeofInBits(Type) -Int 1)) -Int 1
    rule smin(Type:KResult) => 0 -Int (2 ^Int absInt(sizeofInBits(Type) -Int 1))

    syntax Int ::= ufmax(K) [function]
    syntax Int ::= ufmin(K) [function]
    rule ufmax(Type:KResult) => (2 ^Int absInt(sizeofInBits(Type))) -Int 1
    rule ufmin(Type:KResult) => 0

    // should be a K, but builtins can't use K :(
    // declare signed : K K -> Nat // type, value
    syntax Nat ::= signed(K, K)
    rule isNat(signed(_, _)) => true

    // case when in bounds
    rule signed(Type:KResult, I:Int) => I
        when smin(Type) <=Int I andBool smax(Type) >=Int I

    // this reduces it to be close
    rule signed(Type:KResult, I:Int)
            => signed(Type:KResult, I %Int (ufmax(Type) +Int 1))
        when I >Int ufmax(Type) // note umax here
    // this picks up any extra distance
    rule signed(Type:KResult, I:Int)
            => I -Int (ufmax(Type) +Int 1)
        when I >Int smax(Type) andBool I <=Int ufmax(Type)

    // same as above
    rule signed(Type:KResult, I:Int)
            => signed(Type:KResult, I %Int (ufmax(Type) +Int 1))
        when I <Int 0 -Int ufmax(Type)
    rule signed(Type:KResult, I:Int)
            => I +Int (ufmax(Type) +Int 1)
        when I <Int smin(Type) andBool I >=Int 0 -Int ufmax(Type)


    // computes the positive remainder, whereas % can returns a negative number
    // TODO maybe should go in pl builtins
    syntax Int ::= K "remInt" K [function]
    rule (I:Int remInt N:Int) => ((I %Int N) +Int N) %Int N

    // declare unsigned : K K -> Nat // type, value
    syntax Nat ::= unsigned(K, K)
    rule isNat(unsigned(_, _)) => true

    rule unsigned(Type:KResult, N:Int) => N
        when ufmin(Type) <=Int N andBool ufmax(Type) >=Int N
    rule unsigned(Type:KResult, I:Int) => I remInt (ufmax(Type) +Int 1)
        when I <Int ufmin(Type)
    rule unsigned(Type:KResult, N:Int) => N %Int (ufmax(Type) +Int 1)
        when N >Int ufmax(Type)

    syntax Bool ::= isIntegerType(K) [function]
    rule isIntegerType(IntegerType(_)) => true
    rule isIntegerType(KLabel:KLabel(_)) => false
        when KLabel =/=KLabel 'IntegerType

    syntax Bool ::= isFloatType(K) [function]
    rule isFloatType(F:FPType) => true
    rule isFloatType(x86_mmx) => true

    syntax Bool ::= isPointerType(K) [function]
    rule isPointerType(PointerType(_, _)) => true

    syntax Bool ::= isArrayType(K) [function]
    rule isArrayType(ArrayType(_, _)) => true

    syntax Bool ::= isStructType(K)
    rule isStructType(StructType(_)) => true

    // fixme size should depend on architecture
    rule sizeofInBits(PointerType(_, _)) => numBytesPerPointer *Int numBitsPerByte
    rule sizeofInBits(ArrayType(Type:KResult, Len:Int)) => sizeofInBits(Type) *Int Len

    rule sizeofInBits(IntegerType(N:Int)) => N
    rule sizeofInBits(FloatType) => 32
    rule sizeofInBits(DoubleType) => 64
    rule sizeofInBits(X86FP80Type) => 80
    // TODO listK should be Fields (bug in K)
    rule sizeofInBits(StructType(listK((Type:KResult,, L:KList))))
      => sizeofInBits(Type) +Int sizeofInBits(StructType(listK(L)))
    rule sizeofInBits(StructType(listK(.KList))) => 0

    syntax Int ::= sizeof(K) [function]
    rule sizeof(Type:KResult) => sizeofInBits(Type) /Int numBitsPerByte
        when numBitsPerByte dividesInt sizeofInBits(Type)

    syntax KItem ::= zeroOfType(K)
    rule zeroOfType(Type:KResult) => 0
        when isIntegerType(Type)


    syntax KList ::= K "copiesOf" KList [function]
    rule N:Int copiesOf L:KList => L,, (N:Int -Int 1 copiesOf L)
        when N:Int >Int 0
    rule 0 copiesOf _ => .KList

    // define N:Nat +Int (Offset:Nat +Int sym(Base:Nat))
        // => (N +Int Offset) +Int sym(Base)

    // define I:Int +Int (Offset:Nat +Int sym(Base:Nat))
        // => (absInt(I +Int Offset)) +Int sym(Base)
        // when I <Int 0 andBool I +Int Offset >=Int 0


endmodule

module LLVM-STANDARD-LIBRARY-SYNTAX

    syntax KItem ::= memcpy(K, K, K, K, K)
    syntax KItem ::= memset(K, K, K, K, K)

    syntax KItem ::= lifetimeStart(K, K)
    syntax KItem ::= lifetimeEnd(K, K)

    syntax KItem ::= vaStart(K)
    syntax KItem ::= vaCopy(K, K)
endmodule

module LLVM-SYSCALLS-SYNTAX

    syntax KLabel ::= syscallHandler(K) [function]

    syntax KLabel ::= "'sys-write"
    rule syscallHandler(4) => 'sys-write

    syntax KLabel ::= "'sys-getpid"
    rule syscallHandler(20) => 'sys-getpid

    syntax KLabel ::= "'sys-brk"
    rule syscallHandler(45) => 'sys-brk

    syntax KLabel ::= "'sys-ioctl"
    rule syscallHandler(54) => 'sys-ioctl

    syntax KLabel ::= "'sys-rt-sigprocmask"
    rule syscallHandler(175) => 'sys-rt-sigprocmask

    syntax KLabel ::= "'sys-gettid"
    rule syscallHandler(224) => 'sys-gettid

    syntax KLabel ::= "'sys-exit-group"
    rule syscallHandler(248) => 'sys-exit-group

    syntax KLabel ::= "'sys-tgkill"
    rule syscallHandler(268) => 'sys-tgkill

endmodule


module LLVM-CONFIGURATION
    imports LLVM-HELPERS

    configuration
        <T multiplicity="?">
            <k color="LightGreen"> $PGM:Module ~> initGlobals ~> callMain </k>
            <callStack color="Goldenrod"> .List </callStack>
            <nextLoc color="gray"> loc(1, 0) </nextLoc>
            <brk> loc(0, 0) </brk>
            <control color="LightGoldenrod">
                <currBlock color="Orchid"> Name("Initial") </currBlock>
                <prevBlock color="Orchid"> Name("Initial") </prevBlock>
                <currModule color="Orchid"> Name("Initial") </currModule>
                <currFunction color="Orchid"> Name("Initial") </currFunction>
                <valist> .List </valist>
                <registers color="teal"> .Map </registers>
                // TODO: this should eventually be a Set
                <currentModifiers color="Orchid"> .List </currentModifiers>
                <localMemory> .List </localMemory>
            </control>
            <memory color="teal" type="Map">
                <object multiplicity="*" color="LightSkyBlue">
                    <basePtr color="orange" type="Key"> -1 </basePtr>
                    <type> .K </type>
                    <size> 0 </size>
                    <bytes> .Map </bytes>
                </object>
            </memory>
            // auxiliary cells:
            <gepInfo multiplicity="?" color="red">
                <gepType> .K </gepType>
                <gepResult> 0 </gepResult>
                <gepIndices> .K </gepIndices>
            </gepInfo>
            <output stream="stdout" color="DodgerBlue"> .List </output>
            <modules color="teal">
                <module multiplicity="*" color="LightSkyBlue">
                    <moduleName color="orange"> Name("") </moduleName>
                    <targetLayout> "" </targetLayout>
                    <targetTriple> "" </targetTriple>
                    <typedefs> .Map </typedefs>
                    <savedGlobals> .K </savedGlobals>
                    <globalRegisters color="teal"> .Map </globalRegisters>
                    <functions color="teal">
                        <function multiplicity="*" color="LightSkyBlue">
                            <functionName color="orange"> Name("") </functionName>
                            <returnType> .K </returnType>
                            <formalParameters> .K </formalParameters>
                            <basicBlocks> .Map </basicBlocks>
                            <initialBasicBlock> .K </initialBasicBlock>
                        </function>
                    </functions>
                    <typeInfos color="teal">
                        <typeInfo multiplicity="*" color="LightSkyBlue">
                            <typeName color="orange"> Name("") </typeName>
                            <offsets> .Map </offsets>
                        </typeInfo>
                    </typeInfos>
                </module>
            </modules>
        </T>
        <result multiplicity="?" color="DodgerBlue">
            <returnValue> -1 </returnValue>
        </result>

endmodule

/* this module gets included by all later modules */
module LLVM-INCLUDE
    imports LLVM-CONFIGURATION
    imports LLVM-STANDARD-LIBRARY-SYNTAX
    imports LLVM-SYSCALLS-SYNTAX

endmodule

/* this module contains rules for cleaning up the AST */
module LLVM-CLEAN-TREE
    imports LLVM-INCLUDE

/*
    rule <k> Operand(Type:KResult, I:Int) => signed(Type, I) ...</k>
        when isIntegerType(Type)
    rule <k> Operand(Type:KResult, V:KResult) => V ...</k>
        when notBool isIntegerType(Type)
    // rule <k> Operand(Type:KResult, V:KResult) => V ...</k>

    rule GlobalVariables(L:List{K}) => List{K}ToK(L)  [anywhere]
    rule Functions(L:List{K}) => List{K}ToK(L)        [anywhere]
    rule Typedefs(L:List{K}) => List{K}ToK(L)         [anywhere]
    rule <k> Aliases(L:List{K}) => List{K}ToK(L) ...</k>
    //rule Body(L:List{K}) => List{K}ToK(L)
    rule Instructions(L:List{K}) => List{K}ToK(L)     [anywhere]
    rule ModuleID(S:String) => Name(S)               [anywhere]
    rule Values(K:K) => K                              [anywhere]
    rule Br(K:K) => K:K                               [anywhere]
    rule ReturnType(K:K) => K [anywhere]
*/

    rule icmp ne T:Type V:ValueRef , V':ValueRef I:InstructionMetadatas
         => theDefinition(INotEq(T, V, V'),I)
    rule icmp eq T:Type V:ValueRef , V':ValueRef I:InstructionMetadatas
         => theDefinition(IEq(T, V, V'),I)
    rule icmp ugt T:Type V:ValueRef , V':ValueRef I:InstructionMetadatas
         => theDefinition(UGT(T, V, V'),I)
    rule icmp uge T:Type V:ValueRef , V':ValueRef I:InstructionMetadatas
         => theDefinition(UGE(T, V, V'),I)
    rule icmp ult T:Type V:ValueRef , V':ValueRef I:InstructionMetadatas
         => theDefinition(ULT(T, V, V'),I)
    rule icmp ule T:Type V:ValueRef , V':ValueRef I:InstructionMetadatas
         => theDefinition(ULE(T, V, V'),I)
    rule icmp sgt T:Type V:ValueRef , V':ValueRef I:InstructionMetadatas
         => theDefinition(SGT(T, V, V'),I)
    rule icmp sge T:Type V:ValueRef , V':ValueRef I:InstructionMetadatas
         => theDefinition(SGE(T, V, V'),I)
    rule icmp slt T:Type V:ValueRef , V':ValueRef I:InstructionMetadatas
         => theDefinition(SLT(T, V, V'),I)
    rule icmp sle T:Type V:ValueRef , V':ValueRef I:InstructionMetadatas
         => theDefinition(SLE(T, V, V'),I)

    rule fcmp false _:Type _:ValueRef , _:ValueRef I:InstructionMetadatas
         => theDefinition(0,I)
    rule fcmp true _:Type _:ValueRef , _:ValueRef I:InstructionMetadatas
         => theDefinition(1,I)
    rule fcmp oeq T:Type V:ValueRef , V':ValueRef I:InstructionMetadatas
         => theDefinition(OEQ(T, V, V'),I)
    rule fcmp ogt T:Type V:ValueRef , V':ValueRef I:InstructionMetadatas
         => theDefinition(OGT(T, V, V'),I)
    rule fcmp oge T:Type V:ValueRef , V':ValueRef I:InstructionMetadatas
         => theDefinition(OGE(T, V, V'),I)
    rule fcmp olt T:Type V:ValueRef , V':ValueRef I:InstructionMetadatas
         => theDefinition(OLT(T, V, V'),I)
    rule fcmp ole T:Type V:ValueRef , V':ValueRef I:InstructionMetadatas
         => theDefinition(OLE(T, V, V'),I)
    rule fcmp one T:Type V:ValueRef , V':ValueRef I:InstructionMetadatas
         => theDefinition(ONE(T, V, V'),I)
    rule fcmp ord T:Type V:ValueRef , V':ValueRef I:InstructionMetadatas
         => theDefinition(ORD(T, V, V'),I)
    rule fcmp ueq T:Type V:ValueRef , V':ValueRef I:InstructionMetadatas
         => theDefinition(UEQ(T, V, V'),I)
    rule fcmp ugt T:Type V:ValueRef , V':ValueRef I:InstructionMetadatas
         => theDefinition(UGT(T, V, V'),I)
    rule fcmp uge T:Type V:ValueRef , V':ValueRef I:InstructionMetadatas
         => theDefinition(UGE(T, V, V'),I)
    rule fcmp ult T:Type V:ValueRef , V':ValueRef I:InstructionMetadatas
         => theDefinition(ULT(T, V, V'),I)
    rule fcmp ule T:Type V:ValueRef , V':ValueRef I:InstructionMetadatas
         => theDefinition(ULE(T, V, V'),I)
    rule fcmp une T:Type V:ValueRef , V':ValueRef I:InstructionMetadatas
         => theDefinition(UNE(T, V, V'),I)
    rule fcmp uno T:Type V:ValueRef , V':ValueRef I:InstructionMetadatas
         => theDefinition(UNO(T, V, V'),I)

/*
    rule
        <k> Instruction(Modifiers(L:List{K}), K:K) => K ...</k>
        <currentModifiers> _ => List(L) </currentModifiers>

    rule
        <k> ConstantExpr(Modifiers(L:List{K}), K:K) => K ...</k>
        <currentModifiers> _ => List(L) </currentModifiers>
*/
endmodule

module LLVM-SEMANTICS
    imports LLVM-INCLUDE
    imports LLVM-CLEAN-TREE
endmodule
