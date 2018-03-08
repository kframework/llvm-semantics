//This module will look at files and separate them into different parts without looking at
//the content of function bodies.
requires "llvm-syntax.k"
requires "llvm-abstractsyntax.k"
requires "llvm-settings.k"
requires "llvm-helpers.k"
requires "llvm-standard-library-syntax.k"
requires "llvm-syscalls-syntax.k"
requires "llvm-configuration.k"

module LLVM-PREPROCESSING
    imports LLVM-SYNTAX
    imports LLVM-ABSTRACTSYNTAX
    imports LLVM-SETTINGS
    imports LLVM-HELPERS
    imports LLVM-STANDARD-LIBRARY-SYNTAX
    imports LLVM-SYSCALLS-SYNTAX
    imports LLVM-CONFIGURATION

    syntax KItem ::= preModule(Module, K, K, K, K, K, K, K, K)
    syntax KItem ::= stringConstruct(String)
    syntax KItem ::= preFunctionDecl(FunctionProto) [function]
    
    //TODO: considering the semantics for Prefix data and Prologue data, which is different from other modifiers
    rule preFunctionDecl(Ex:ExternalLinkage Vi:OptVisibilityStyle
                         Cl:OptCallingConv Re:RetAttrs Ty:Type Gl:GlobalName
                         ( Ars:ArgList ) Un:OptUnnamedAddr Fu:FuncAttrs Se:OptSection
                         Co:OptComdat Al:OptAlign Gc:OptGC Pf:OptPrefix Pl:OptPrologue)
          => functionDecl(formSet(Ex) formSet(Vi) formSet(Cl)
                         formSet(Re) formSet(Un) formSet(Fu) formSet(Se)
                         formSet(Co) formSet(Al) formSet(Gc) formSet(Pf) formSet(Pl)
                         ,addNameToString(Ty),addNameToString(Gl),formElemList(Ars))
    rule preFunctionDecl(Dll:OptDllStorageClass Vi:OptVisibilityStyle
                         Cl:OptCallingConv Re:RetAttrs Ty:Type Gl:GlobalName
                         ( Ars:ArgList ) Un:OptUnnamedAddr Fu:FuncAttrs Se:OptSection
                         Co:OptComdat Al:OptAlign Gc:OptGC Pf:OptPrefix Pl:OptPrologue)
          => functionDecl(formSet(Dll) formSet(Vi) formSet(Cl)
                          formSet(Re) formSet(Un) formSet(Fu) formSet(Se)
                          formSet(Co) formSet(Al) formSet(Gc) formSet(Pf) formSet(Pl)
                         ,addNameToString(Ty),addNameToString(Gl),formElemList(Ars))

    syntax KItem ::= preFunctionDef(Function) [function]

    rule preFunctionDef(Li:OptLinkage Vi:OptVisibilityStyle Dll:OptDllStorageClass
                        Cl:OptCallingConv Re:RetAttrs Ty:Type Gl:GlobalName
                         (Ars:ArgList) Un:OptUnnamedAddr Fu:FuncAttrs Se:OptSection
                          Co:OptComdat Al:OptAlign Gc:OptGC Pf:OptPrefix Pr:OptPrologue
                        {Bl:BasicBlockList})
         => functionDef(formSet(Li) formSet(Vi) formSet(Dll) formSet(Cl) formSet(Re)
                         formSet(Un) formSet(Fu)
                        formSet(Se) formSet(Co) formSet(Al) formSet(Gc) formSet(Pf) formSet(Pr)
                         ,addNameToString(Ty),addNameToString(Gl),formElemList(Ars),Bl)

    syntax ElemList ::= dealWithSectionComdatAndAlign(K, K, K, K, K, K, K, K, K) [function]
    rule dealWithSectionComdatAndAlign(A:K, B:K, C:K, D:K, E:K, F:K, G:K,
          H:K, 'sectionComdatAndAlignEmpty(.KList))
         => val(A),val(B),val(C),val(D),val(E),val(F),val(G),val(H)
    rule dealWithSectionComdatAndAlign(A:K, B:K, C:K, D:K, E:K, F:K, G:K,
          H:K, , section S:StringName)
         => val(A),val(B),val(C),val(D),val(E),val(F),val(G),val(H)
            ,val(section S:StringName)
    rule dealWithSectionComdatAndAlign(A:K, B:K, C:K, D:K, E:K, F:K, G:K,
          H:K, , Al:Align)
         => val(A),val(B),val(C),val(D),val(E),val(F),val(G),val(H),val(Al)
    rule dealWithSectionComdatAndAlign(A:K, B:K, C:K, D:K, E:K, F:K, G:K,
          H:K, , Co:Comdat)
         => val(A),val(B),val(C),val(D),val(E),val(F),val(G),val(H),val(Co)
    rule dealWithSectionComdatAndAlign(A:K, B:K, C:K, D:K, E:K, F:K, G:K,
          H:K, , Co:Comdat , Al:Align)
         => val(A),val(B),val(C),val(D),val(E),val(F)
           ,val(G),val(H),val(Co),val(Al)
    rule dealWithSectionComdatAndAlign(A:K, B:K, C:K, D:K, E:K, F:K, G:K,
          H:K, , section S:StringName , Al:Align)
         => val(A),val(B),val(C),val(D),val(E),val(F),val(G),val(H)
            ,val(section S:StringName),val(Al)
    rule dealWithSectionComdatAndAlign(A:K, B:K, C:K, D:K, E:K, F:K, G:K,
          H:K, , Al:Align , section S:StringName)
         => val(A),val(B),val(C),val(D),val(E),val(F),val(G),val(H)
            ,val(section S:StringName),val(Al)
    rule dealWithSectionComdatAndAlign(A:K, B:K, C:K, D:K, E:K, F:K, G:K,
          H:K, , section S:StringName , Co:Comdat)
         => val(A),val(B),val(C),val(D),val(E),val(F),val(G),val(H)
            ,val(section S:StringName),val(Co)
    rule dealWithSectionComdatAndAlign(A:K, B:K, C:K, D:K, E:K, F:K, G:K,
          H:K, , section S:StringName , Co:Comdat , Al:Align)
         => val(A),val(B),val(C),val(D),val(E),val(F),val(G),val(H)
            ,val(section S:StringName),val(Co),val(Al)


    rule <k> DefList:Module => preModule(DefList, .K, .K, .K, .K, .K, .K, .K, .K) ...</k>
         <modules>...
            .Bag =>
            <module>...
                <moduleName> name(globalVar, "main") </moduleName>
            ...</module>
        ...</modules>
        [structural]

    rule preModule(target triple = S:StringName DL:Module, ModuleAsms:K, TargetLayout:K,
            TargetTriple:K, MetaVars:K, Typedefs:K, GlobalVars:K, Aliases:K, Functions:K)
         => preModule(DL:Module, ModuleAsms, TargetLayout:K, TargetTriple:K
                                             ~> stringConstruct(#tokenToString(S)), MetaVars:K,
               Typedefs:K, GlobalVars:K, Aliases:K, Functions:K)
    rule preModule(target datalayout = S:StringName DL:Module, ModuleAsms:K, TargetLayout:K,
            TargetTriple:K, MetaVars:K, Typedefs:K, GlobalVars:K, Aliases:K, Functions:K)
         => preModule(DL, ModuleAsms:K, TargetLayout:K ~> stringConstruct(#tokenToString(S))
                , TargetTriple:K, MetaVars:K,
               Typedefs:K, GlobalVars:K, Aliases:K, Functions:K)
    rule preModule(declare F:FunctionProto DL:Module, ModuleAsms:K, TargetLayout:K,
            TargetTriple:K, MetaVars:K, Typedefs:K, GlobalVars:K, Aliases:K, Functions:K)
         => preModule(DL:Module, ModuleAsms:K, TargetLayout:K, TargetTriple:K, MetaVars:K,
               Typedefs:K, GlobalVars:K, Aliases:K, Functions:K ~> preFunctionDecl(F))
    rule preModule(define F:Function DL:Module, ModuleAsms:K, TargetLayout:K,
            TargetTriple:K, MetaVars:K, Typedefs:K, GlobalVars:K, Aliases:K, Functions:K)
         => preModule(DL, ModuleAsms:K, TargetLayout:K, TargetTriple:K, MetaVars:K,
               Typedefs:K, GlobalVars:K, Aliases:K, Functions:K ~> preFunctionDef(F))
    rule preModule(module asm S:StringName DL:Module, ModuleAsms:K, TargetLayout:K,
            TargetTriple:K, MetaVars:K, Typedefs:K, GlobalVars:K, Aliases:K, Functions:K)
         => preModule(DL:Module, ModuleAsms:K ~> moduleAsm(S), TargetLayout:K, TargetTriple:K, MetaVars:K,
               Typedefs:K, GlobalVars:K, Aliases:K, Functions:K)
    rule preModule(N:LocalName = type Ty:Type DL:Module, ModuleAsms:K, TargetLayout:K,
            TargetTriple:K, MetaVars:K, Typedefs:K, GlobalVars:K, Aliases:K, Functions:K)
         => preModule(DL:Module, ModuleAsms:K, TargetLayout:K, TargetTriple:K, MetaVars:K,
               Typedefs:K ~> typedef(N,Ty)
               , GlobalVars:K, Aliases:K, Functions:K)
    rule preModule(N:LocalName = type opaque DL:Module, ModuleAsms:K, TargetLayout:K,
            TargetTriple:K, MetaVars:K, Typedefs:K, GlobalVars:K, Aliases:K, Functions:K)
         => preModule(DL:Module, ModuleAsms:K, TargetLayout:K, TargetTriple:K, MetaVars:K,
               Typedefs:K ~> typedef(N,opaque)
               , GlobalVars:K, Aliases:K, Functions:K)

    rule preModule(N:GlobalVar = Ex:ExternalLinkage Vi:OptVisibilityStyle
                          Dll:OptDllStorageClass Th:OptThreadLocal Ad:OptAddrSpace
                          Un:OptUnnamedAddr Exi:OptExternallyInitialized Gl:GlobalType
                          Ty:Type Sca:OptSectionComdatAndAlign DL:Module, ModuleAsms:K, TargetLayout:K,
            TargetTriple:K, MetaVars:K, Typedefs:K, GlobalVars:K, Aliases:K, Functions:K)
         => preModule(DL:Module, ModuleAsms:K, TargetLayout:K, TargetTriple:K, MetaVars:K,
               Typedefs:K, GlobalVars ~> globalVariable(name(globalVar,
              substrString(#tokenToString(N),1
               ,lengthString(#tokenToString(N)))),formSet(Ex) formSet(Vi)
                          formSet(Dll) formSet(Th) formSet(Un) formSet(Exi)
                 formSet(Gl) deleteAlign(formSet(Sca)) ,Ty,
                  skipValue, dealWithAddrSpace(Ad),
                     getAlign(formSet(Sca), .K)), Aliases:K, Functions:K)

    rule <k> preModule(N:GlobalValID = Ex:ExternalLinkage Vi:OptVisibilityStyle
                          Dll:OptDllStorageClass Th:OptThreadLocal Ad:OptAddrSpace
                          Un:OptUnnamedAddr Exi:OptExternallyInitialized Gl:GlobalType
                          Ty:Type Sca:OptSectionComdatAndAlign DL:Module, ModuleAsms:K, TargetLayout:K,
            TargetTriple:K, MetaVars:K, Typedefs:K, GlobalVars:K, Aliases:K, Functions:K)
         => preModule(DL:Module, ModuleAsms:K, TargetLayout:K, TargetTriple:K, MetaVars:K,
               Typedefs:K, GlobalVars ~> globalVariable(name(globalVar, substrString(#tokenToString(N),1
               ,lengthString(#tokenToString(N)))),formSet(Ex) formSet(Vi)
                          formSet(Dll) formSet(Th) formSet(Un) formSet(Exi)
            formSet(Gl) deleteAlign(formSet(Sca)),Ty,
              skipValue, dealWithAddrSpace(Ad),
                   getAlign(formSet(Sca), .K)), Aliases:K, Functions:K)
         ...</k><globalFunVarCounter> Count:Int => Count +Int 1 </globalFunVarCounter>
         when String2Int(substrString(#tokenToString(N),1
               ,lengthString(#tokenToString(N)))) ==Int Count

    rule <k> preModule(N:GlobalValID = Ex:ExternalLinkage Vi:OptVisibilityStyle
                          Dll:OptDllStorageClass Th:OptThreadLocal Ad:OptAddrSpace
                          Un:OptUnnamedAddr Exi:OptExternallyInitialized Gl:GlobalType
                          Ty:Type Sca:OptSectionComdatAndAlign DL:Module, ModuleAsms:K, TargetLayout:K,
            TargetTriple:K, MetaVars:K, Typedefs:K, GlobalVars:K, Aliases:K, Functions:K) ~> K:K
         => .K </k><globalFunVarCounter> Count:Int => Count +Int 1 </globalFunVarCounter>
         <output>... .List => ListItem("error: variable expected to be numbered " +String Int2String(Count)) </output>
         when String2Int(substrString(#tokenToString(N),1
               ,lengthString(#tokenToString(N)))) =/=Int Count

    rule <k> preModule(Ex:ExternalLinkage Vi:OptVisibilityStyle
                          Dll:OptDllStorageClass Th:OptThreadLocal Ad:OptAddrSpace
                          Un:OptUnnamedAddr Exi:OptExternallyInitialized Gl:GlobalType
                          Ty:Type Sca:OptSectionComdatAndAlign DL:Module, ModuleAsms:K, TargetLayout:K,
            TargetTriple:K, MetaVars:K, Typedefs:K, GlobalVars:K, Aliases:K, Functions:K)
         => preModule(DL:Module, ModuleAsms:K, TargetLayout:K, TargetTriple:K, MetaVars:K,
               Typedefs:K, GlobalVars ~> globalVariable(name(globalVar, Int2String(Count))
             ,formSet(Ex) formSet(Vi) formSet(Dll) formSet(Th) formSet(Un)
            formSet(Exi) formSet(Gl) deleteAlign(formSet(Sca)),Ty,
                skipValue, dealWithAddrSpace(Ad),
                   getAlign(formSet(Sca), .K)), Aliases:K, Functions:K)
         ...</k><globalFunVarCounter> Count:Int => Count +Int 1 </globalFunVarCounter>

    rule preModule(N:GlobalVar = Ex:NonExternalLinkage Vi:OptVisibilityStyle
                     Dll:OptDllStorageClass Th:OptThreadLocal Ad:OptAddrSpace
                     Un:OptUnnamedAddr Exi:OptExternallyInitialized Gl:GlobalType
                     Ty:Type Vl:ValueRef Sca:OptSectionComdatAndAlign DL:Module
                     , ModuleAsms:K, TargetLayout:K,
                    TargetTriple:K, MetaVars:K, Typedefs:K, GlobalVars:K, Aliases:K, Functions:K)
         => preModule(DL:Module, ModuleAsms:K, TargetLayout:K, TargetTriple:K, MetaVars:K,
               Typedefs:K, GlobalVars ~> globalVariable(name(globalVar, substrString(#tokenToString(N),1
               ,lengthString(#tokenToString(N)))),formSet(Ex) formSet(Vi)
               formSet(Dll) formSet(Th) formSet(Un) formSet(Exi)
         formSet(Gl) deleteAlign(formSet(Sca)),Ty,
             addNameToString(Vl), dealWithAddrSpace(Ad),
                  getAlign(formSet(Sca), .K)), Aliases:K, Functions:K)

    rule <k> preModule(N:GlobalValID = Ex:NonExternalLinkage Vi:OptVisibilityStyle
                 Dll:OptDllStorageClass Th:OptThreadLocal Ad:OptAddrSpace
                 Un:OptUnnamedAddr Exi:OptExternallyInitialized Gl:GlobalType
                 Ty:Type Vl:ValueRef Sca:OptSectionComdatAndAlign DL:Module, ModuleAsms:K, TargetLayout:K,
            TargetTriple:K, MetaVars:K, Typedefs:K, GlobalVars:K, Aliases:K, Functions:K)
         => preModule(DL:Module, ModuleAsms:K, TargetLayout:K, TargetTriple:K, MetaVars:K,
               Typedefs:K, GlobalVars ~> globalVariable(name(globalVar,
              substrString(#tokenToString(N),1
               ,lengthString(#tokenToString(N)))),formSet(Ex) formSet(Vi)
               formSet(Dll) formSet(Th) formSet(Un) formSet(Exi)
            formSet(Gl) deleteAlign(formSet(Sca)),Ty,addNameToString(Vl),dealWithAddrSpace(Ad),
                      getAlign(formSet(Sca), .K)), Aliases:K, Functions:K)
         ...</k><globalFunVarCounter> Count:Int => Count +Int 1 </globalFunVarCounter>
         when String2Int(substrString(#tokenToString(N),1
               ,lengthString(#tokenToString(N)))) ==Int Count

    rule <k> preModule(N:GlobalValID = Ex:NonExternalLinkage Vi:OptVisibilityStyle
               Dll:OptDllStorageClass Th:OptThreadLocal Ad:OptAddrSpace
               Un:OptUnnamedAddr Exi:OptExternallyInitialized Gl:GlobalType
               Ty:Type Vl:ValueRef Sca:OptSectionComdatAndAlign DL:Module, ModuleAsms:K, TargetLayout:K,
               TargetTriple:K, MetaVars:K, Typedefs:K, GlobalVars:K, Aliases:K, Functions:K) ~> K:K
         => .K </k><globalFunVarCounter> Count:Int => Count +Int 1 </globalFunVarCounter>
         <output>... .List => ListItem("error: variable expected to be numbered " +String Int2String(Count)) </output>
         when String2Int(substrString(#tokenToString(N),1
               ,lengthString(#tokenToString(N)))) =/=Int Count

    rule <k> preModule(Ex:NonExternalLinkage Vi:OptVisibilityStyle
               Dll:OptDllStorageClass Th:OptThreadLocal Ad:OptAddrSpace
               Un:OptUnnamedAddr Exi:OptExternallyInitialized Gl:GlobalType
               Ty:Type Vl:ValueRef Sca:OptSectionComdatAndAlign DL:Module, ModuleAsms:K, TargetLayout:K,
            TargetTriple:K, MetaVars:K, Typedefs:K, GlobalVars:K, Aliases:K, Functions:K)
         => preModule(DL:Module, ModuleAsms:K, TargetLayout:K, TargetTriple:K, MetaVars:K,
               Typedefs:K, GlobalVars ~> globalVariable(name(globalVar, Int2String(Count))
             ,formSet(Ex) formSet(Vi) formSet(Dll) formSet(Th) formSet(Un)
                formSet(Exi) formSet(Gl) deleteAlign(formSet(Sca)),Ty,addNameToString(Vl),
              dealWithAddrSpace(Ad), getAlign(formSet(Sca), .K)), Aliases:K, Functions:K)
         ...</k><globalFunVarCounter> Count:Int => Count +Int 1 </globalFunVarCounter>

    rule preModule(deplibs = [ Ss:Strings ] DL:Module, ModuleAsms:K, TargetLayout:K, TargetTriple:K
           , MetaVars:K, Typedefs:K, GlobalVars:K, Aliases:K, Functions:K)
         => preModule(DL:Module, ModuleAsms:K, TargetLayout:K, TargetTriple:K
           , MetaVars:K, Typedefs:K, GlobalVars:K, Aliases:K, Functions:K)

    rule preModule(Cv:ComdatVar = comdat Sel:SelectionKind DL:Module, ModuleAsms:K
           , TargetLayout:K, TargetTriple:K
           , MetaVars:K, Typedefs:K, GlobalVars:K, Aliases:K, Functions:K)
         => preModule(DL:Module, ModuleAsms:K, TargetLayout:K, TargetTriple:K
           , MetaVars:K, Typedefs:K, GlobalVars:K, Aliases:K, Functions:K)

    rule preModule(N:GlobalVar = Ex:OptLinkage Vi:OptVisibilityStyle Exi:OptDllStorageClass
                     Th:OptThreadLocal Un:OptUnnamedAddr alias Al:AliaseeRef DL:Module
                     , ModuleAsms:K, TargetLayout:K,TargetTriple:K
                     , MetaVars:K, Typedefs:K, GlobalVars:K, Aliases:K, Functions:K)
         => preModule(DL:Module, ModuleAsms:K, TargetLayout:K, TargetTriple:K, MetaVars:K, Typedefs:K
           , GlobalVars, Aliases:K ~> alias(formSet(Ex) formSet(Vi) formSet(Exi) formSet(Th) formSet(Un)
           ,name(globalVar, substrString(#tokenToString(N),1
               ,lengthString(#tokenToString(N)))),Al), Functions:K)

    rule <k> preModule(N:GlobalValID = Ex:OptLinkage Vi:OptVisibilityStyle Exi:OptDllStorageClass
                     Th:OptThreadLocal Un:OptUnnamedAddr alias Al:AliaseeRef
                        DL:Module, ModuleAsms:K, TargetLayout:K,
            TargetTriple:K, MetaVars:K, Typedefs:K, GlobalVars:K, Aliases:K, Functions:K)
         => preModule(DL:Module, ModuleAsms:K, TargetLayout:K, TargetTriple:K, MetaVars:K,
               Typedefs:K, GlobalVars, Aliases:K
                    ~> alias(formSet(Ex) formSet(Vi) formSet(Exi) formSet(Th) formSet(Un)
               ,name(globalVar, substrString(#tokenToString(N),1
               ,lengthString(#tokenToString(N)))),Al), Functions:K)
         ...</k><globalFunVarCounter> Count:Int => Count +Int 1 </globalFunVarCounter>
         when String2Int(substrString(#tokenToString(N),1
               ,lengthString(#tokenToString(N)))) ==Int Count

    rule <k> preModule(N:GlobalValID = Ex:OptLinkage Vi:OptVisibilityStyle Exi:OptDllStorageClass
                     Th:OptThreadLocal Un:OptUnnamedAddr alias Al:AliaseeRef DL:Module, ModuleAsms:K, TargetLayout:K,
               TargetTriple:K, MetaVars:K, Typedefs:K, GlobalVars:K, Aliases:K, Functions:K) ~> K:K
         => .K </k><globalFunVarCounter> Count:Int => Count +Int 1 </globalFunVarCounter>
         <output>... .List => ListItem("error: variable expected to be numbered " +String Int2String(Count)) </output>
         when String2Int(substrString(#tokenToString(N),1
               ,lengthString(#tokenToString(N)))) =/=Int Count

    rule <k> preModule(attributes Av:AttributeGroupId = { .GroupAttrs } DL:Module, ModuleAsms:K
           , TargetLayout:K, TargetTriple:K
           , MetaVars:K, Typedefs:K, GlobalVars:K, Aliases:K, Functions:K) ~>K:K => .K </k>
         <output>... .List => ListItem("error: attribute group has no attributes") </output>

    rule <k> preModule(attributes Av:AttributeGroupId = { Gas:GroupAttrs } DL:Module, ModuleAsms:K
           , TargetLayout:K, TargetTriple:K
           , MetaVars:K, Typedefs:K, GlobalVars:K, Aliases:K, Functions:K)
            => preModule(DL,ModuleAsms,TargetLayout,TargetTriple
               , MetaVars,Typedefs,GlobalVars,Aliases,Functions) ...</k>
         <attributeGroups> M:Map => M[Av <- Gas] </attributeGroups>
         when Gas =/=K .GroupAttrs

    rule <k> preModule(! I:UnsignedInt = Ty:OptDistinct ! { Ins:MetadataValues } DL:Module
           , ModuleAsms:K, TargetLayout:K, TargetTriple:K
           , MetaVars:K, Typedefs:K, GlobalVars:K, Aliases:K, Functions:K)
            => preModule(DL,ModuleAsms,TargetLayout,TargetTriple
               , MetaVars,Typedefs,GlobalVars,Aliases,Functions) ...</k>
         <attributeGroups> M:Map => M[I <- metaConst(Ty, Ins)] </attributeGroups>
         when notBool (I in keys(M))

    rule <k> preModule(! I:UnsignedInt = Ty:OptDistinct ! { Ins:MetadataValues } DL:Module
           , ModuleAsms:K, TargetLayout:K, TargetTriple:K
           , MetaVars:K, Typedefs:K, GlobalVars:K, Aliases:K, Functions:K) ~> K:K
            => .K </k>
         <attributeGroups> M:Map </attributeGroups>
         <output>... .List => ListItem("error: Metadata id is already used") </output>
         when I in keys(M)

    rule preModule(N:MetadataVar = ! { Mis:MetadataInts } DL:Module
           , ModuleAsms:K, TargetLayout:K, TargetTriple:K
           , MetaVars:K, Typedefs:K, GlobalVars:K, Aliases:K, Functions:K)
         => preModule(DL
           , ModuleAsms, TargetLayout, TargetTriple
           , MetaVars ~> metaVar(N,Mis),Typedefs,GlobalVars, Aliases, Functions)

    rule preModule(.Module, ModuleAsms:K, TargetLayout:K, TargetTriple:K, MetaVars:K
            , Typedefs:K, GlobalVars:K, Aliases:K, Functions:K)
         => theModule(name(globalVar, "main"),TargetLayout, TargetTriple, MetaVars
            ,Typedefs, GlobalVars,Aliases, Functions) [structural]

    rule <k> metaVar(N:MetadataVar, Mis:MetadataInts) => .K ...</k>
         <attributeGroups> M:Map => M[N <- Mis] </attributeGroups>
         when allInMap(Mis,M)
    rule <k> metaVar(N:MetadataVar, Mis:MetadataInts) ~> K:K => .K </k>
         <attributeGroups> M:Map </attributeGroups>
         <output>... .List => ListItem("error: use of undefined metadata ''") </output>
         when notBool allInMap(Mis,M)

    syntax Bool ::= allInMap(MetadataInts, Map) [function]

    rule allInMap(.MetadataInts,M:Map) => true
    rule allInMap(! I:UnsignedInt, Mis:MetadataInts,M:Map) => false
         when notBool (I in keys(M))
    rule allInMap(! I:UnsignedInt, Mis:MetadataInts,M:Map)
         => allInMap(Mis,M)
         when I in keys(M)

endmodule
