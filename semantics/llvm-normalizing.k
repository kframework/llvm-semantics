// 
requires "llvm-syntax.k"
requires "llvm-abstractsyntax.k"
requires "llvm-settings.k"
requires "llvm-helpers.k"
requires "llvm-standard-library-syntax.k"
requires "llvm-syscalls-syntax.k"
requires "llvm-configuration.k"
requires "llvm-preprocessing.k"

module LLVM-NORMALIZING
    imports LLVM-SYNTAX
    imports LLVM-ABSTRACTSYNTAX
    imports LLVM-SETTINGS
    imports LLVM-HELPERS
    imports LLVM-STANDARD-LIBRARY-SYNTAX
    imports LLVM-SYSCALLS-SYNTAX
    imports LLVM-CONFIGURATION
    imports LLVM-PREPROCESSING


    //helper processes for type check
    rule assignUses(Name:K, X:K, Ty:K, .ElemList) => .K
    rule <k> assignUses(Name:K, Count:Int, Ty:K, val(V1:SymbolicValueRef),E:ElemList)
           => assignUses(Name:K, Count:Int, Ty:K, E:ElemList) ...</k>
         <tempUses> Uses (.Set => varOp(Name, X, Ty, V1)) </tempUses>
    rule assignUses(Name:K, Count:Int, Ty:K, val(V1:K),E:ElemList)
           => assignUses(Name:K, Count:Int, Ty:K, E:ElemList)
         requires getKLabel(V1) =/=KLabel 'name

    rule <k> badType ~> K => .K </k>
         <output>... .List => ListItem("error: expected type") </output>

    syntax KItem ::= typeCheckOp(K, K, K) //block name, var name, op
                   | typeCheckIntOp(K, K, K, K, K, K, Set, InstructionMetadatas)    
                                 [strict(4)]//block name, var name, op, ty, v1, v2, attributes, instmeta
                   | typeCheckCastOp(K, K, K, K, K, K, InstructionMetadatas)
                                [strict(4, 6)]//block, variable, operator, T1, V, T2
                   | typeCheckIntArgs(K, K, ElemList)
                   | typeCheckIntArg(K, K, K)//block, t, var
                   | typeCheckIntArg(K, K, K, K)
                   | typeCheckInGepList(K, K, ElemList) //reference type, current type, index list
                   | typeCheckInGepListStruct(K, K, ElemList, K)//reference type, current type, index_list, structural_list
                   | typeCheckIntArg(K, K, K, K, K, K)    [strict(5)]
                   | typeCheckGepOp(K, K, K, K, K, ElemList, Set, InstructionMetadatas)
                             [strict(3,4,6)]//block, var, t, t*, v, (t,v)lists, mods, instmeta
                   | typeCheckAllocaOp(K, K, K, K, K, K, Set, InstructionMetadatas)
                             [strict(3,4)]//block,var, t, int-t, v, align
                   | typeCheckStore(K, K, K, K, K, K, K, Set, InstructionMetadatas)
                             [strict(2,4)]//block, t, v, pt, v, align, atomic, mods, instmeta
                   | typeCheckLoad(K, K, K, K, K, K, K, Set, InstructionMetadatas)
                             [strict(3,4)]//block, var, t, pt, v, align, atomic, mods, instmeta
                   | typeCheckIntArgList(K, ElemList)        [strict(2)]
                   | typeCheckGepArgList(K, ElemList)        [strict(2)]
                   | typeCheckGepArgListInNum(K, ElemList) //int number of vector, list of indexes
                   | typeCheckArgList(K, ElemList)        [strict(2)]
                   | TypeMatchFunctions(K, ElemList, ElemList)  [strict(2,3)]
                   | typeCheckBr(K, K, K, K, K, InstructionMetadatas)    [strict(2)]//block, t, ..., instmeta
                   | typeCheckCmp(K, K, K, K, K, K, InstructionMetadatas)
                              [strict(4)]//block, var, op, type, v1, v2, instmeta
                   | typeCheckFCmp(K, K, K, K, K, K, InstructionMetadatas)
                              [strict(4)]//block, var, op, type, v1, v2, instmeta
                   | typeCheckPhi(K, K, K, ElemList, ElemList, Set, ElemList, InstructionMetadatas)
                              [strict(3)]//block, var, type, value-list, label-list, phi-list, instmeta
                   | typeCheckRet(K, K, K, InstructionMetadatas)           [strict(2)]//block, t, v, Meta
                   | typeCheckCall(K, K, K, K, K, ElemList, ElemList, ParamList, Set, InstructionMetadatas)
                               [strict(4, 6, 7)]//block, var, op, t, name, argt, argv, args, mods, instmeta
                   | typeCheckSwitch(K, ElemList, ElemList, ElemList, InstructionMetadatas)
                                          [strict(2)]//block, argv, argl, stroed argl, instmeta
                   | typeCheckIndirectBr(K, K, K, ElemList, ElemList, InstructionMetadatas)
                                          [strict(2)]//block, type, argv, argl, instmeta
                   | typeCheckSelect(K, K, K, K, K, K, K, K, InstructionMetadatas)
                              [strict(3,5,7)]//block,name type, value, firstT, firstV, secondT, secondV, instmeta
                   | typeCheckResume(K, K, K, InstructionMetadatas)    [strict(2)] //block, type, value, instmeta


    rule typeCheckOp(Name:SymbolicValueRef,X:SymbolicValueRef, IntOp:IntConstructors
                             Onw:OptNW Ty:Type V1:ValueRef,
                             V2:ValueRef Ins:InstructionMetadatas)
           => typeCheckIntOp(Name:SymbolicValueRef, X, IntOp, Ty,
                           addNameToString(V1), addNameToString(V2), formSet(Onw), Ins)

    rule typeCheckOp(Name:SymbolicValueRef, X:SymbolicValueRef, L:LogicalOps Ty:Type V1:ValueRef,
                  V2:ValueRef Ins:InstructionMetadatas)
           => typeCheckIntOp(Name:SymbolicValueRef, X, L, Ty,
                           addNameToString(V1), addNameToString(V2), .Set, Ins)

    rule typeCheckOp(Name:SymbolicValueRef, X:SymbolicValueRef, trunc Ty1:Type V:ValueRef
                                            to Ty2:Type Ins:InstructionMetadatas)
           => typeCheckCastOp(Name:SymbolicValueRef, X, trunc,
                                          Ty1, addNameToString(V), Ty2, Ins)
    rule typeCheckOp(Name:SymbolicValueRef, X:SymbolicValueRef, zext Ty1:Type V:ValueRef
                                            to Ty2:Type Ins:InstructionMetadatas)
           => typeCheckCastOp(Name:SymbolicValueRef, X, zext,
                                          Ty1, addNameToString(V), Ty2, Ins)
    rule typeCheckOp(Name:SymbolicValueRef, X:SymbolicValueRef, sext Ty1:Type V:ValueRef
                                            to Ty2:Type Ins:InstructionMetadatas)
           => typeCheckCastOp(Name:SymbolicValueRef, X, sext,
                                          Ty1, addNameToString(V), Ty2, Ins)

    rule typeCheckOp(Name:SymbolicValueRef, X:SymbolicValueRef,
                 getelementptr Oib:OptInBounds Ty:Type , Ty1:Type V1:ValueRef,
                                    Itr:ReturnedVal Ins:InstructionMetadatas)
           => typeCheckGepOp(Name:SymbolicValueRef, X, Ty, Ty1,
                        addNameToString(V1), formTypeCheckList(Itr), formSet(Oib), Ins)

    rule <k> typeCheckOp(Name:SymbolicValueRef, X:SymbolicValueRef,
                 getelementptr Oib:OptInBounds Ty:Type ,
                    .ReturnedVal Ins:InstructionMetadatas)
                 ~> K:K => .K </k>
         <output>... .List => ListItem("error: no reference target pointer for getelementptr") </output>

    rule typeCheckOp(Name:SymbolicValueRef, X:SymbolicValueRef,
                         alloca Oil:OptInalloca Ty:Type Ins:InstructionMetadatas)
           => typeCheckAllocaOp(Name:SymbolicValueRef, X,Ty,
                                    undef, undef, 1, formSet(Oil), Ins)
    rule typeCheckOp(Name:SymbolicValueRef, X:SymbolicValueRef,
                            alloca Oil:OptInalloca
                                   Ty:Type, align A:UnsignedInt Ins:InstructionMetadatas)
           => typeCheckAllocaOp(Name:SymbolicValueRef,
                               X,Ty,undef,undef,
                                     String2Int(#tokenToString(A)), formSet(Oil), Ins)
    rule typeCheckOp(Name:SymbolicValueRef, X:SymbolicValueRef,
                        alloca Oil:OptInalloca Ty:Type,
                           It:IntType V:ValueRef Ins:InstructionMetadatas)
           => typeCheckAllocaOp(Name:SymbolicValueRef, X,Ty,It,
                                          addNameToString(V), 1, formSet(Oil), Ins)
    rule typeCheckOp(Name:SymbolicValueRef, X:SymbolicValueRef,
               alloca Oil:OptInalloca Ty:Type, It:IntType V:ValueRef,
                                   align A:UnsignedInt Ins:InstructionMetadatas)
           => typeCheckAllocaOp(Name:SymbolicValueRef, X, Ty, It,
                addNameToString(V), String2Int(#tokenToString(A)), formSet(Oil), Ins)

    rule typeCheckOp(Name:SymbolicValueRef, K:K, store Ovl:OptVolatile
                  Ty1:Type V1:ValueRef, Ty2:Type V2:ValueRef, align I:UnsignedInt
                    Inm:InstructionMetadatas)
           => typeCheckStore(Name:SymbolicValueRef, Ty1:Type,
                addNameToString(V1), Ty2:Type, addNameToString(V2),
                    String2Int(#tokenToString(I)), .K, formSet(Ovl) formSet(align I), Inm)
    rule typeCheckOp(Name:SymbolicValueRef, K:K, store Ovl:OptVolatile
                  Ty1:Type V1:ValueRef, Ty2:Type V2:ValueRef
                    Inm:InstructionMetadatas)
           => typeCheckStore(Name:SymbolicValueRef, Ty1:Type,
                      addNameToString(V1), Ty2:Type, addNameToString(V2), 1, .K, formSet(Ovl), Inm)
    rule typeCheckOp(Name:SymbolicValueRef, K:K, store Oac:Atomic
                                                    Ovl:OptVolatile Ty1:Type V1:ValueRef,
                 Ty2:Type V2:ValueRef Ost:OptSingleThread Ord:Ordering,
                                          align I:UnsignedInt Ins:InstructionMetadatas)
           => typeCheckStore(Name:SymbolicValueRef, Ty1:Type,
                   addNameToString(V1), Ty2:Type, addNameToString(V2),
              String2Int(#tokenToString(I)), Oac, formSet(Oac) formSet(Ovl) formSet(Ost Ord) formSet(align I), Ins)

    rule typeCheckOp(Name:SymbolicValueRef,
              X:SymbolicValueRef, load Ovl:OptVolatile
                  Ty1:Type, Ty2:Type V2:ValueRef, align I:UnsignedInt
                    Inm:InstructionMetadatas)
           => typeCheckLoad(Name:SymbolicValueRef, X, Ty1:Type,
                                Ty2:Type, addNameToString(V2), String2Int(#tokenToString(I)), .K,
                           formSet(Ovl) formSet(align I) ,Inm)
    rule typeCheckOp(Name:SymbolicValueRef, X:SymbolicValueRef, load Ovl:OptVolatile
                  Ty1:Type, Ty2:Type V2:ValueRef
                    Inm:InstructionMetadatas)
           => typeCheckLoad(Name:SymbolicValueRef, X,
                           Ty1:Type, Ty2:Type, addNameToString(V2), 1, .K, formSet(Ovl), Inm)
    rule typeCheckOp(Name:SymbolicValueRef, X:SymbolicValueRef,
                                         load Oac:Atomic Ovl:OptVolatile Ty1:Type,
                 Ty2:Type V2:ValueRef Ost:OptSingleThread Ord:Ordering,
                                               align I:UnsignedInt Ins:InstructionMetadatas)
           => typeCheckLoad(Name:SymbolicValueRef, X, Ty1:Type,
                                       Ty2:Type, addNameToString(V2), String2Int(#tokenToString(I)), Oac,
                           formSet(Oac) formSet(Ovl)
                           formSet(Ost:OptSingleThread Ord:Ordering) formSet(align I), Ins)


    //type checking and instruction AST from with integer ops and logical ops.
    rule <k> typeCheckIntOp(Name:SymbolicValueRef, X:SymbolicValueRef, Op:K,
                 integerType(N:Int), V1:K, V2:K, S:Set, Meta:InstructionMetadatas)
              => assignUses(Name, TheCount, integerType(N:Int), (val(V1),val(V2),.ElemList))
                ~> typeCheckIntArgs(Name:SymbolicValueRef,
                     integerType(N), val(V1),val(V2),.ElemList)
                 ~> assignType(Name, X, integerType(N:Int)) ...</k>
        <instructionCounter> TheCount:Int => TheCount +Int 1 </instructionCounter>
        <tempBlockMap> Now:Map => Now (TheCount |->
              instNumInfo(TheCount, assign(X,instruction(getKLabelFromOp(Op)(
                       integerType(N:Int),, V1,, V2), S,
                     insMetas(formElemList(Meta)))), normalInst)) </tempBlockMap>
        <tempDefs> Defs (.Set => varOp(Name, TheCount, integerType(N:Int), X)) </tempDefs> 

    rule <k> typeCheckIntOp(Name:SymbolicValueRef, X:SymbolicValueRef, Op:K,
               vectorTypeValue(integerType(N:Int), I:Int),
                          V1:K, V2:K, S:Set, Meta:InstructionMetadatas)
              => assignUses(Name, TheCount, integerType(N:Int),
                         mergeVectorList(V1,V2)) ~> typeCheckIntArgs(Name:SymbolicValueRef,
                  vectorTypeValue(integerType(N:Int), I:Int), val(V1),val(V2),.ElemList)
                 ~> assignType(Name, X, vectorTypeValue(integerType(N:Int), I:Int)) ...</k>
        <instructionCounter> TheCount:Int => TheCount +Int 1 </instructionCounter>
        <tempBlockMap> Now:Map => Now (TheCount |->
              instNumInfo(TheCount, assign(X,instruction(getKLabelFromOp(Op)(
                   vectorTypeValue(integerType(N:Int), I:Int),, V1,, V2), S,
                     insMetas(formElemList(Meta)))),
                 normalInst)) </tempBlockMap>
        <tempDefs> Defs (.Set => varOp(Name, TheCount,
                    vectorTypeValue(integerType(N:Int), I:Int), X)) </tempDefs>

    rule <k> typeCheckIntOp(Name:SymbolicValueRef, X:SymbolicValueRef, Op:K,
               vectorTypeValue(Ty:KResult, I:Int),
               V1:K, V2:K, S:Set, Meta:InstructionMetadatas) ~> K
              => .K </k>
         <output>... .List => ListItem("error: invalid operand type for instruction") </output>
         requires getKLabel(Ty) =/=KLabel 'integerType

    rule <k> typeCheckIntOp(Name:SymbolicValueRef, X:SymbolicValueRef, Op:K,
                    Ty:KResult, V1:K, V2:K, S:Set, Meta:InstructionMetadatas) ~> K
              => .K </k>
         <output>... .List => ListItem("error: instruction requires integer or integer vector operands") </output>
         requires getKLabel(Ty) =/=KLabel 'integerType
                    andBool getKLabel(Ty) =/=KLabel 'vectorTypeValue


    //set out edges for a block
    rule setOutEdge(N:K, .ElemList) => .K
    rule <k> setOutEdge(N:K, val(V:SymbolicValueRef),El:ElemList)
                => setOutEdge(N, El) ...</k>
        <currModule> ModName:SymbolicValueRef </currModule>
        <funModuleName> ModName </funModuleName>
        <currFunction> FunName:SymbolicValueRef </currFunction>
        <functionName> FunName </functionName>
        <basicBlocks>... N |-> 
                blockContent(_:Map, Out:Set (.Set => SetItem(V)), _:Set,
                                      _:Set, _:Set, _:Set, _:Set) ...</basicBlocks>


    //in the checkSingleAssignment and checkSingleAssignmentInBlock
    //to add addNameToString to every positioins where show Type and ValueRef
    //for example the third rule
    //also type check each instruction and rewrite each instruction in AST form
    syntax KItem ::= checkSingleAssignment(K)
                   | checkSingleAssignmentInBlock(SymbolicValueRef, K, Bool) //name, tocheck, stores, is-phi-allow

    //form a basicBlock finally.
    rule <k> checkSingleAssignmentInBlock(N:SymbolicValueRef, .K, _:Bool)
             => .K ...</k>
        <currModule> ModName:SymbolicValueRef </currModule>
        <funModuleName> ModName </funModuleName>
        <currFunction> FunName:SymbolicValueRef </currFunction>
        <functionName> FunName </functionName>
        <tempBlockMap> K:Map => .Map </tempBlockMap>
        <tempDefs> Defs => .Set </tempDefs> 
        <tempUses> Uses => .Set </tempUses>
        <basicBlocks>... N |-> blockContent((_:Map => K),
                       _:Set, _:Set, _:Set, _:Set,
                 OutDef => OutDef Defs, OutUses => OutUses Uses) ...</basicBlocks>

    //have dealt with all instruction list.
    rule checkSingleAssignmentInBlock(N:SymbolicValueRef, .InstructionList
                               BB:K, B:Bool)
         => checkSingleAssignmentInBlock(N, BB, B)

    //deal with termination instructions.
    rule checkSingleAssignmentInBlock(N:SymbolicValueRef, ret Nt:NonVoidType
                                  Va:ValueRef Meta:InstructionMetadatas, _:Bool)
         => typeCheckOp(N:SymbolicValueRef, .K, ret Nt:NonVoidType
                                  Va:ValueRef Meta:InstructionMetadatas)
             ~> checkSingleAssignmentInBlock(N, .K, false)

    rule checkSingleAssignmentInBlock(N:SymbolicValueRef, ret Nt:VoidType
                                  Meta:InstructionMetadatas, _:Bool)
         => checkSingleAssignmentInBlock(N, .K, false)


    rule checkSingleAssignmentInBlock(N:SymbolicValueRef, br label La:ValueRef
                                  Meta:InstructionMetadatas, _:Bool)
         => typeCheckOp(N, .K, br label La:ValueRef
                                  Meta:InstructionMetadatas)
             ~> setOutEdge(N, getOutEdges(La))
              ~> checkSingleAssignmentInBlock(N, .K, false)

    rule checkSingleAssignmentInBlock(N:SymbolicValueRef, br It:IntType Va:ValueRef ,
                                       label La1:ValueRef , label La2:ValueRef
                                  Meta:InstructionMetadatas, _:Bool)
         => typeCheckOp(N, .K, br It:IntType Va:ValueRef ,
                                       label La1:ValueRef , label La2:ValueRef
                                  Meta:InstructionMetadatas)
             ~> setOutEdge(N, getOutEdges(La1)) ~> setOutEdge(N, getOutEdges(La2))
             ~> checkSingleAssignmentInBlock(N, .K, false)

    rule checkSingleAssignmentInBlock(N:SymbolicValueRef, resume Ty:Type Va:ValueRef
                                    Meta:InstructionMetadatas, _:Bool)
         => typeCheckOp(N, .K, resume Ty:Type Va:ValueRef
                                    Meta:InstructionMetadatas)
             ~> checkSingleAssignmentInBlock(N, .K, false)

    rule checkSingleAssignmentInBlock(N:SymbolicValueRef, indirectbr Ty:Type Va:ValueRef ,
                                       [ Las:LabelValues ]
                                  Meta:InstructionMetadatas, _:Bool)
         => typeCheckOp(N, .K, indirectbr Ty:Type Va:ValueRef ,
                                       [ Las:LabelValues ]
                                  Meta:InstructionMetadatas)
             ~> setOutEdge(N, getOutEdges(Las))
             ~> checkSingleAssignmentInBlock(N, .K, false)

    rule checkSingleAssignmentInBlock(N:SymbolicValueRef, switch It:IntType Va:ValueRef ,
                                       label La:ValueRef [ Ju:JumpTable ]
                                  Meta:InstructionMetadatas, _:Bool)
         => typeCheckOp(N, .K, switch It:IntType Va:ValueRef ,
                                       label La:ValueRef [ Ju:JumpTable ]
                                  Meta:InstructionMetadatas)
             ~> setOutEdge(N, val(addNameToString(La)))
                 ~> setOutEdge(N, getOutEdges(Ju))
             ~> checkSingleAssignmentInBlock(N, .K, false)

    rule <k> checkSingleAssignmentInBlock(N:SymbolicValueRef, unreachable
                                  Meta:InstructionMetadatas, _:Bool)
         => checkSingleAssignmentInBlock(N, .K, false) ...</k>
        <instructionCounter> TheCount:Int => TheCount +Int 1 </instructionCounter>
         <tempBlockMap> Now:Map => Now (TheCount |-> instNumInfo(TheCount,
               instruction(TheCount, unreachable,.Set,
                  insMetas(formElemList(Meta))), returnInst)) </tempBlockMap>

    rule <k>checkSingleAssignmentInBlock(N:SymbolicValueRef, invoke Opc:OptCallingConv Re:RetAttrs
                                       Ty:Type Va:ValueRef (Pa:ParamList) Fu:FuncAttrs
                                       to La1:LabelValue unwind La2:LabelValue 
                                  Meta:InstructionMetadatas, _:Bool)
         => typeCheckOp(N, name(localVar, Int2String(I)), invoke Opc:OptCallingConv Re:RetAttrs
                                       Ty:Type Va:ValueRef (Pa:ParamList) Fu:FuncAttrs
                                       to La1:LabelValue unwind La2:LabelValue 
                                  Meta:InstructionMetadatas)
             ~> checkSingleAssignmentInBlock(N, .K, false)
         ...</k>
        <currModule> ModName:SymbolicValueRef </currModule>
        <funModuleName> ModName </funModuleName>
        <currFunction> FunName:SymbolicValueRef </currFunction>
        <functionName> FunName </functionName>
        <varTypes> M:Map </varTypes>
        <localFunVarCounter> I:Int => I +Int 1 </localFunVarCounter>
        requires notBool name(localVar, Int2String(I)) in keys(M)

    rule <k> checkSingleAssignmentInBlock(N:SymbolicValueRef,Var:LocalVar
                                       = invoke Opc:OptCallingConv Re:RetAttrs
                                       Ty:Type Va:ValueRef (Pa:ParamList) Fu:FuncAttrs
                                       to La1:LabelValue unwind La2:LabelValue 
                                  Meta:InstructionMetadatas, _:Bool)
         => typeCheckOp(N, name(localVar, substrString(#tokenToString(Var),1
               ,lengthString(#tokenToString(Var)))), invoke Opc:OptCallingConv Re:RetAttrs
                                       Ty:Type Va:ValueRef (Pa:ParamList) Fu:FuncAttrs
                                       to La1:LabelValue unwind La2:LabelValue 
                                  Meta:InstructionMetadatas)
             ~> checkSingleAssignmentInBlock(N, .K, false)
        </k>
        <currModule> ModName:SymbolicValueRef </currModule>
        <funModuleName> ModName </funModuleName>
        <currFunction> FunName:SymbolicValueRef </currFunction>
        <functionName> FunName </functionName>
        <varTypes> M:Map </varTypes>
        <localFunVarCounter> I:Int => I +Int 1 </localFunVarCounter>
        requires notBool name(localVar, substrString(#tokenToString(Var),1
               ,lengthString(#tokenToString(Var)))) in keys(M)

    rule <k> checkSingleAssignmentInBlock(N:SymbolicValueRef,Var:LocalVar
                                       = invoke Opc:OptCallingConv Re:RetAttrs
                                       Ty:Type Va:ValueRef (Pa:ParamList) Fu:FuncAttrs
                                       to La1:LabelValue unwind La2:LabelValue 
                                  Meta:InstructionMetadatas, _:Bool) ~> K':K
         => .K
         </k>
         <currModule> ModName:SymbolicValueRef </currModule>
         <funModuleName> ModName </funModuleName>
         <currFunction> FunName:SymbolicValueRef </currFunction>
         <functionName> FunName </functionName>
        <varTypes> M:Map </varTypes>
         <output>... .List => ListItem(" multiple definition of local value named '"
                   +String substrString(#tokenToString(Var),1
               ,lengthString(#tokenToString(Var))) +String "'") </output>
        requires name(localVar, substrString(#tokenToString(Var),1
               ,lengthString(#tokenToString(Var)))) in keys(M)

    rule <k> checkSingleAssignmentInBlock(N:SymbolicValueRef,Var:LocalValID
                                       = invoke Opc:OptCallingConv Re:RetAttrs
                                       Ty:Type Va:ValueRef (Pa:ParamList) Fu:FuncAttrs
                                       to La1:LabelValue unwind La2:LabelValue 
                                  Meta:InstructionMetadatas, _:Bool) ~> K':K
         => .K
         </k>
         <currModule> ModName:SymbolicValueRef </currModule>
         <funModuleName> ModName </funModuleName>
         <currFunction> FunName:SymbolicValueRef </currFunction>
         <functionName> FunName </functionName>
        <varTypes> M:Map </varTypes>
         <output>... .List => ListItem(" multiple definition of local value named '"
                   +String substrString(#tokenToString(Var),1
               ,lengthString(#tokenToString(Var))) +String "'") </output>
        requires name(localVar, substrString(#tokenToString(Var),1
                          ,lengthString(#tokenToString(Var)))) in keys(M)

    rule <k>checkSingleAssignmentInBlock(N:SymbolicValueRef,Var:LocalValID
                                       = invoke Opc:OptCallingConv Re:RetAttrs
                                       Ty:Type Va:ValueRef (Pa:ParamList) Fu:FuncAttrs
                                       to La1:LabelValue unwind La2:LabelValue 
                                  Meta:InstructionMetadatas, _:Bool)
         => typeCheckOp(N, name(localVar, substrString(#tokenToString(Var),1
                          ,lengthString(#tokenToString(Var)))), invoke Opc:OptCallingConv Re:RetAttrs
                                       Ty:Type Va:ValueRef (Pa:ParamList) Fu:FuncAttrs
                                       to La1:LabelValue unwind La2:LabelValue 
                                  Meta:InstructionMetadatas)
             ~> checkSingleAssignmentInBlock(N, .K, false)
         ...</k>
         <currModule> ModName:SymbolicValueRef </currModule>
         <funModuleName> ModName </funModuleName>
         <currFunction> FunName:SymbolicValueRef </currFunction>
         <functionName> FunName </functionName>
        <varTypes> M:Map </varTypes>
         <localFunVarCounter> I:Int => I +Int 1 </localFunVarCounter>
          requires String2Int(substrString(#tokenToString(Var),1
               ,lengthString(#tokenToString(Var)))) ==Int I

    rule <k> checkSingleAssignmentInBlock(N:SymbolicValueRef,Var:LocalValID
                                       = invoke Opc:OptCallingConv Re:RetAttrs
                                       Ty:Type Va:ValueRef (Pa:ParamList) Fu:FuncAttrs
                                       to La1:LabelValue unwind La2:LabelValue 
                                  Meta:InstructionMetadatas, _:Bool) ~> K':K
            => .K </k>
         <currModule> ModName:SymbolicValueRef </currModule>
         <funModuleName> ModName </funModuleName>
         <currFunction> FunName:SymbolicValueRef </currFunction>
         <functionName> FunName </functionName>
         <localFunVarCounter> I:Int </localFunVarCounter>
         <output>... .List => ListItem("error: variable expected to be numbered " +String Int2String(I)) </output>
          when String2Int(substrString(#tokenToString(Var),1
               ,lengthString(#tokenToString(Var)))) =/=Int I

    rule <k>checkSingleAssignmentInBlock(N:SymbolicValueRef, In:InstVal Ins:InstructionList
                               BB:BBTerminatorInstruction, _:Bool)
         => typeCheckOp(N, name(localVar, Int2String(I)), In)
             ~> checkSingleAssignmentInBlock(N, Ins BB, false)
         ...</k>
         <currModule> ModName:SymbolicValueRef </currModule>
         <funModuleName> ModName </funModuleName>
         <currFunction> FunName:SymbolicValueRef </currFunction>
         <functionName> FunName </functionName>
         <varTypes> M:Map </varTypes>
         <localFunVarCounter> I:Int => I +Int 1 </localFunVarCounter>
         requires getKLabel(In) =/=KLabel 'phiFun andBool getKLabel(In) =/=KLabel 'functionCall

    rule checkSingleAssignmentInBlock(N:SymbolicValueRef, Ca:OptTailCall
                        Ocv:OptCallingConv Rat:RetAttrs void
                     V1:ValueRef (Pl:ParamList) Fat:FuncAttrs
                       Meta:InstructionMetadatas Ins:InstructionList
                               BB:BBTerminatorInstruction, _:Bool)
         => typeCheckOp(N, .K, Ca:OptTailCall
                        Ocv:OptCallingConv Rat:RetAttrs void
                     V1:ValueRef (Pl:ParamList) Fat:FuncAttrs
                       Meta:InstructionMetadatas)
             ~> checkSingleAssignmentInBlock(N, Ins BB, false)

    rule <k>checkSingleAssignmentInBlock(N:SymbolicValueRef, Ca:OptTailCall
                        Ocv:OptCallingConv Rat:RetAttrs Ty1:NonVoidType
                     V1:ValueRef (Pl:ParamList) Fat:FuncAttrs
                       Meta:InstructionMetadatas Ins:InstructionList
                               BB:BBTerminatorInstruction, _:Bool)
         => typeCheckOp(N, name(localVar, Int2String(I)), Ca:OptTailCall
                        Ocv:OptCallingConv Rat:RetAttrs Ty1:NonVoidType
                     V1:ValueRef (Pl:ParamList) Fat:FuncAttrs
                       Meta:InstructionMetadatas)
             ~> checkSingleAssignmentInBlock(N, Ins BB, false)
         ...</k>
         <currModule> ModName:SymbolicValueRef </currModule>
         <funModuleName> ModName </funModuleName>
         <currFunction> FunName:SymbolicValueRef </currFunction>
         <functionName> FunName </functionName>
         <varTypes> M:Map </varTypes>
         <localFunVarCounter> I:Int => I +Int 1 </localFunVarCounter>

    rule <k> checkSingleAssignmentInBlock(N:SymbolicValueRef,
               phi Ty:Type Pl:PHIList InstM:InstructionMetadatas Ins:InstructionList
                               BB:BBTerminatorInstruction, true)
         => typeCheckOp(N, name(localVar, Int2String(I)),
                      phi Ty:Type Pl:PHIList InstM:InstructionMetadatas)
             ~> checkSingleAssignmentInBlock(N, Ins BB, true)
         ...</k>
         <currModule> ModName:SymbolicValueRef </currModule>
         <funModuleName> ModName </funModuleName>
         <currFunction> FunName:SymbolicValueRef </currFunction>
         <functionName> FunName </functionName>
         <varTypes> M:Map </varTypes>
         <localFunVarCounter> I:Int => I +Int 1 </localFunVarCounter>

    rule <k> checkSingleAssignmentInBlock(N:SymbolicValueRef,
               phi Ty:Type Pl:PHIList InstM:InstructionMetadatas Ins:InstructionList
                               BB:BBTerminatorInstruction, false) ~> K:K => .K </k>
          <output>... .List =>
            ListItem("error: non-phi instructions between the start of a basic block and the PHI instructions") </output>

    rule <k> checkSingleAssignmentInBlock(N:SymbolicValueRef, Var:LocalVar = In:InstVal
               Ins:InstructionList BB:BBTerminatorInstruction, _:Bool)
         => typeCheckOp(N, name(localVar, substrString(#tokenToString(Var),1
                          ,lengthString(#tokenToString(Var)))), In)
             ~> checkSingleAssignmentInBlock(N, Ins BB, false)
         ...</k>
         <currModule> ModName:SymbolicValueRef </currModule>
         <funModuleName> ModName </funModuleName>
         <currFunction> FunName:SymbolicValueRef </currFunction>
         <functionName> FunName </functionName>
         <varTypes> M:Map </varTypes>
         requires notBool (name(localVar, substrString(#tokenToString(Var),1
                          ,lengthString(#tokenToString(Var))))
                                in keys(M)) andBool getKLabel(In) =/=KLabel 'phiFun
                  andBool getKLabel(In) =/=KLabel 'functionCall


    rule <k> checkSingleAssignmentInBlock(N:SymbolicValueRef, Var:LocalVar = Ca:OptTailCall
                        Ocv:OptCallingConv Rat:RetAttrs void
                     V1:ValueRef (Pl:ParamList) Fat:FuncAttrs
                       Meta:InstructionMetadatas
               Ins:InstructionList BB:BBTerminatorInstruction, _:Bool) ~> K:K
         => .K </k>
         <output>... .List => ListItem("error: instructions returning void cannot have a name") </output>

    rule <k> checkSingleAssignmentInBlock(N:SymbolicValueRef, Var:LocalVar = Ca:OptTailCall
                        Ocv:OptCallingConv Rat:RetAttrs Ty1:NonVoidType
                     V1:ValueRef (Pl:ParamList) Fat:FuncAttrs
                       Meta:InstructionMetadatas
               Ins:InstructionList BB:BBTerminatorInstruction, _:Bool)
         => typeCheckOp(N, name(localVar, substrString(#tokenToString(Var),1
                          ,lengthString(#tokenToString(Var)))), Ca:OptTailCall
                        Ocv:OptCallingConv Rat:RetAttrs Ty1:NonVoidType
                     V1:ValueRef (Pl:ParamList) Fat:FuncAttrs
                       Meta:InstructionMetadatas)
             ~> checkSingleAssignmentInBlock(N, Ins BB, false)
         ...</k>
         <currModule> ModName:SymbolicValueRef </currModule>
         <funModuleName> ModName </funModuleName>
         <currFunction> FunName:SymbolicValueRef </currFunction>
         <functionName> FunName </functionName>
         <varTypes> M:Map </varTypes>
         requires notBool (name(localVar, substrString(#tokenToString(Var),1
                          ,lengthString(#tokenToString(Var)))) in keys(M))

    rule <k> checkSingleAssignmentInBlock(N:SymbolicValueRef, Var:LocalVar =
               phi Ty:Type Pl:PHIList InstM:InstructionMetadatas
               Ins:InstructionList BB:BBTerminatorInstruction, true)
         => typeCheckOp(N, name(localVar, substrString(#tokenToString(Var),1
                          ,lengthString(#tokenToString(Var)))),
                             phi Ty:Type Pl:PHIList InstM:InstructionMetadatas)
             ~> checkSingleAssignmentInBlock(N, Ins BB, true)
         ...</k>
         <currModule> ModName:SymbolicValueRef </currModule>
         <funModuleName> ModName </funModuleName>
         <currFunction> FunName:SymbolicValueRef </currFunction>
         <functionName> FunName </functionName>
         <varTypes> M:Map </varTypes>
         requires notBool (name(localVar, substrString(#tokenToString(Var),1
                          ,lengthString(#tokenToString(Var)))) in keys(M))

    rule <k> checkSingleAssignmentInBlock(N:SymbolicValueRef, Var:LocalVar =
               phi Ty:Type Pl:PHIList InstM:InstructionMetadatas
               Ins:InstructionList BB:BBTerminatorInstruction, false) ~> K':K
         => .K </k>
          <output>... .List =>
             ListItem("error: non-phi instructions between the start of a basic block and the PHI instructions") </output>

    rule <k> checkSingleAssignmentInBlock(N:SymbolicValueRef, Var:LocalVar = In:InstVal
               Ins:InstructionList BB:BBTerminatorInstruction, _:Bool) ~> K':K
         => .K </k>
         <currModule> ModName:SymbolicValueRef </currModule>
         <funModuleName> ModName </funModuleName>
         <currFunction> FunName:SymbolicValueRef </currFunction>
         <functionName> FunName </functionName>
         <varTypes> M:Map </varTypes>
         <output>... .List => ListItem(" multiple definition of local value named '"
                   +String substrString(#tokenToString(Var),1
               ,lengthString(#tokenToString(Var))) +String "'") </output>
         when (Var in keys(M))

    rule <k>checkSingleAssignmentInBlock(N:SymbolicValueRef, Var:LocalValID = In:InstVal
               Ins:InstructionList BB:BBTerminatorInstruction, _:Bool)
         => typeCheckOp(N, name(localVar, substrString(#tokenToString(Var),1
                          ,lengthString(#tokenToString(Var)))), In)
             ~> checkSingleAssignmentInBlock(N, Ins BB, false)
         ...</k>
         <currModule> ModName:SymbolicValueRef </currModule>
         <funModuleName> ModName </funModuleName>
         <currFunction> FunName:SymbolicValueRef </currFunction>
         <functionName> FunName </functionName>
         <varTypes> M:Map </varTypes>
         <localFunVarCounter> I:Int => I +Int 1 </localFunVarCounter>
         requires notBool (name(localVar, substrString(#tokenToString(Var),1
                          ,lengthString(#tokenToString(Var)))) in keys(M))
                         andBool getKLabel(In) =/=KLabel 'phiFun
              andBool getKLabel(In) =/=KLabel 'functionCall
              andBool String2Int(substrString(#tokenToString(Var),1
               ,lengthString(#tokenToString(Var)))) ==Int I

    rule <k> checkSingleAssignmentInBlock(N:SymbolicValueRef,
                      Var:LocalValID = Ca:OptTailCall
                        Ocv:OptCallingConv Rat:RetAttrs void
                     V1:ValueRef (Pl:ParamList) Fat:FuncAttrs
                       Meta:InstructionMetadatas
               Ins:InstructionList BB:BBTerminatorInstruction, _:Bool) ~> K:K
         =>  .K </k>
         <output>... .List => ListItem("error: instructions returning void cannot have a name") </output>

    rule <k>checkSingleAssignmentInBlock(N:SymbolicValueRef,
                      Var:LocalValID = Ca:OptTailCall
                        Ocv:OptCallingConv Rat:RetAttrs Ty1:NonVoidType
                     V1:ValueRef (Pl:ParamList) Fat:FuncAttrs
                       Meta:InstructionMetadatas
               Ins:InstructionList BB:BBTerminatorInstruction, _:Bool)
         => typeCheckOp(N, name(localVar, substrString(#tokenToString(Var),1
                          ,lengthString(#tokenToString(Var)))), Ca:OptTailCall
                        Ocv:OptCallingConv Rat:RetAttrs Ty1:NonVoidType
                     V1:ValueRef (Pl:ParamList) Fat:FuncAttrs
                       Meta:InstructionMetadatas)
             ~> checkSingleAssignmentInBlock(N, Ins BB, false)
         ...</k>
         <currModule> ModName:SymbolicValueRef </currModule>
         <funModuleName> ModName </funModuleName>
         <currFunction> FunName:SymbolicValueRef </currFunction>
         <functionName> FunName </functionName>
         <varTypes> M:Map </varTypes>
         <localFunVarCounter> I:Int => I +Int 1 </localFunVarCounter>
         requires notBool (name(localVar, substrString(#tokenToString(Var),1
                          ,lengthString(#tokenToString(Var)))) in keys(M))
              andBool String2Int(substrString(#tokenToString(Var),1
               ,lengthString(#tokenToString(Var)))) ==Int I

    rule <k> checkSingleAssignmentInBlock(N:SymbolicValueRef, Var:LocalValID =
               phi Ty:Type Pl:PHIList InstM:InstructionMetadatas
               Ins:InstructionList BB:BBTerminatorInstruction, true)
         => typeCheckOp(N, name(localVar, substrString(#tokenToString(Var),1
                          ,lengthString(#tokenToString(Var)))),
                          phi Ty:Type Pl:PHIList InstM:InstructionMetadatas)
             ~> checkSingleAssignmentInBlock(N, Ins BB, true)
         ...</k>
         <currModule> ModName:SymbolicValueRef </currModule>
         <funModuleName> ModName </funModuleName>
         <currFunction> FunName:SymbolicValueRef </currFunction>
         <functionName> FunName </functionName>
         <localFunVarCounter> I:Int => I +Int 1 </localFunVarCounter>
         <varTypes> M:Map </varTypes>
         requires notBool (name(localVar, substrString(#tokenToString(Var),1
                          ,lengthString(#tokenToString(Var)))) in keys(M))
               andBool String2Int(substrString(#tokenToString(Var),1
               ,lengthString(#tokenToString(Var)))) ==Int I


    rule <k> checkSingleAssignmentInBlock(N:SymbolicValueRef, Var:LocalValID =
               phi Ty:Type Pl:PHIList InstM:InstructionMetadatas
               Ins:InstructionList BB:BBTerminatorInstruction, false) ~> K:K
         => .K </k>
          <output>... .List =>
           ListItem("error: non-phi instructions between the start of a basic block and the PHI instructions") </output>

    rule <k>checkSingleAssignmentInBlock(N:SymbolicValueRef, Var:LocalValID = In:InstVal
               Ins:InstructionList BB:BBTerminatorInstruction, _:Bool) ~> K':K
         => .K </k>
         <currModule> ModName:SymbolicValueRef </currModule>
         <funModuleName> ModName </funModuleName>
         <currFunction> FunName:SymbolicValueRef </currFunction>
         <functionName> FunName </functionName>
         <localFunVarCounter> I:Int </localFunVarCounter>
         <output>... .List => ListItem("error: variable expected to be numbered "
                                         +String Int2String(I)) </output>
          when String2Int(substrString(#tokenToString(Var),1
               ,lengthString(#tokenToString(Var)))) =/=Int I

    rule checkSingleAssignmentInBlock(N:SymbolicValueRef, store Ovl:OptVolatile
                  Ty1:Type V1:ValueRef, Ty2:Type V2:ValueRef, Al:Align
                    Inm:InstructionMetadatas Ins:InstructionList BB:BBTerminatorInstruction, _:Bool)
         => typeCheckOp(N, .K, store Ovl:OptVolatile
                  Ty1:Type V1:ValueRef, Ty2:Type V2:ValueRef, Al:Align
                    Inm:InstructionMetadatas)
             ~> checkSingleAssignmentInBlock(N, Ins BB, false)

    rule checkSingleAssignmentInBlock(N:SymbolicValueRef, store Ovl:OptVolatile
                  Ty1:Type V1:ValueRef, Ty2:Type V2:ValueRef
                    Inm:InstructionMetadatas Ins:InstructionList BB:BBTerminatorInstruction, _:Bool)
         => typeCheckOp(N, .K, store Ovl:OptVolatile
                         Ty1:Type V1:ValueRef, Ty2:Type V2:ValueRef
                          Inm:InstructionMetadatas)
             ~> checkSingleAssignmentInBlock(N, Ins BB, false)
/*
do the same for another store operation:
"store" OptAtomic OptVolatile ResolvedVal "," ResolvedVal OptScopeOrder InstructionMetadatas
*/
    rule checkSingleAssignmentInBlock(N:SymbolicValueRef
                                      , store Oac:Atomic Ovl:OptVolatile Ty1:Type V1:ValueRef ,
                                            Ty2:Type V2:ValueRef Ost:OptSingleThread Ord:Ordering, Al:Align
                                            Ins:InstructionMetadatas Ili:InstructionList
                                            BB:BBTerminatorInstruction, _:Bool)
          => typeCheckOp(N, .K, store Oac:Atomic Ovl:OptVolatile Ty1:Type V1:ValueRef ,
                                            Ty2:Type V2:ValueRef Ost:OptSingleThread Ord:Ordering, Al:Align
                                            Ins:InstructionMetadatas)
             ~> checkSingleAssignmentInBlock(N, Ili BB, false)
/*
create an abstract for fence and do the same for fence operation.
"fence" OptSingleThread Ordering InstructionMetadatas
*/
    rule checkSingleAssignmentInBlock(N:SymbolicValueRef
                                      , fence Ost:OptSingleThread Ord:Ordering 
                                            Ins:InstructionMetadatas Ili:InstructionList
                                            BB:BBTerminatorInstruction
                                      , _:Bool)
          => typeCheckOp(N, .K, fence Ost:OptSingleThread Ord:Ordering 
                                            Ins:InstructionMetadatas)
               ~> checkSingleAssignmentInBlock(N, Ili BB, false)


    //get all input vars and put them into the var type map for the function
    //we also need to set the vars to the outgoing def and incomming def set for every block
    //instruction number -1 means that these vars are defined before every instruction
    rule setArgsToBlockEnv(N:SymbolicValueRef, .ElemList) => .K
    rule <k> setArgsToBlockEnv(N:SymbolicValueRef,
                valValue(typeOperandResult(T:K, V:SymbolicValueRef)), E:ElemList)
             => setArgsToBlockEnv(N:SymbolicValueRef, E:ElemList) ...</k>
        <currModule> ModName:SymbolicValueRef </currModule>
        <funModuleName> ModName </funModuleName>
        <currFunction> FunName:SymbolicValueRef </currFunction>
        <functionName> FunName </functionName>
         <basicBlocks>... N |->
                 blockContent(_:Map, _:Set, _:Set, Def:Set
                    (.Set => SetItem(varOp(N,-1,T, V))), _:Set,
             Def':Set (.Set => SetItem(varOp(N,-1,T, V))), _:Set) ...</basicBlocks>
         <varTypes> M:Map (.Map => V |-> T) </varTypes>
        requires notBool V in keys(M) andBool notBool varOp(N, 0, T, V) in Def

    rule <k> setArgsToBlockEnv(N:SymbolicValueRef,
                valValue(typeOperandResult(T:K, V:SymbolicValueRef)), E:ElemList) ~> K:K
             => .K </k>
        <currModule> ModName:SymbolicValueRef </currModule>
        <funModuleName> ModName </funModuleName>
        <currFunction> FunName:SymbolicValueRef </currFunction>
        <functionName> FunName </functionName>
        <output>... .List => ListItem("error: define argument '" +String
                       #tokenToString(V) +String "' twices in the function header") </output>
        <varTypes> M:Map </varTypes>
        requires V in keys(M)

    rule <k> setArgsToBlockEnv(N:SymbolicValueRef,
                valValue(typeOperandResult(T:K, V:K)), E:ElemList) ~> K:K
             => .K </k>
        <currModule> ModName:SymbolicValueRef </currModule>
        <funModuleName> ModName </funModuleName>
        <currFunction> FunName:SymbolicValueRef </currFunction>
        <functionName> FunName </functionName>
         <output>... .List => ListItem("error: define argument '" +String
                         #tokenToString(V) +String "' twices in the function header") </output>
         <basicBlocks>... N |->
                 blockContent(_:Map, _:Set, _:Set,
                               Def:Set, _:Set, _:Set, _:Set) ...</basicBlocks>
        requires varOp(N, 0, T, V) in Def


    //define checkSingleAssignment
    //bugs and ambiguity in the LLVM document about the numbered label value
    rule <k> checkSingleAssignment(.K)
               => setInEdges(keys(M))
                  //~> setBlockPaths(.K, keys(M))
                  //~> setBlockInDefs(.K, keys(M))
                  //~> setBlockInUses(.K, keys(M))
                  //~> setBlockDependencies(.K, keys(M))
                  ~> checkingPhisInEdges
                  ~> checkUseVarInPhi(getArgsInFunction(E))
                    ~> checkUseVars(getArgsInFunction(E)) ...</k>
        <currModule> ModName:SymbolicValueRef </currModule>
        <funModuleName> ModName </funModuleName>
        <initialBasicBlock> InitName:SymbolicValueRef </initialBasicBlock>
         <basicBlocks> M:Map </basicBlocks>
        <currFunction> FunName:SymbolicValueRef </currFunction>
        <functionName> FunName </functionName>
        <formalParameters> arguments(E:ElemList) </formalParameters>


    //case 1: if the block comes with a label
    //the label is an english name instead of a number
    rule <k> checkSingleAssignment(L:LabelStringConstant Ins:InstructionList
                                BB:BBTerminatorInstruction BBL:BasicBlockList)
         => setArgsToBlockEnv(addNameToString(L), getArgsInFunction(Args))
              ~> checkSingleAssignmentInBlock(addNameToString(L),Ins BB, true)
           ~> checkSingleAssignment(BBL) ...</k>
        <instructionCounter> Num:Int => 1 </instructionCounter>
        <currModule> ModName:SymbolicValueRef </currModule>
        <funModuleName> ModName </funModuleName>
         <basicBlocks> M':Map (.Map  => addNameToString(L)
              |-> blockContent(.Map, .Set, .Set,
                  SetItem(varOp(addNameToString(L),0,label, addNameToString(L))),
               .Set, SetItem(varOp(addNameToString(L),0,label, addNameToString(L))), .Set)) </basicBlocks>
        <currFunction> FunName:SymbolicValueRef </currFunction>
        <functionName> FunName </functionName>
        <formalParameters> arguments(Args:ElemList) </formalParameters>
         <varTypes> M:Map (.Map =>  addNameToString(L) |-> label) </varTypes>
         requires notBool addNameToString(L) in keys(M)
                  andBool notBool isIntString(substrString(#tokenToString(L), 0
                                        , lengthString(#tokenToString(L)) -Int 1))

    //case 2: if the block name has been defined once.
    rule <k> checkSingleAssignment(L:LabelStringConstant Ins:InstructionList
                                BB:BBTerminatorInstruction BBL:BasicBlockList) ~> K:K
         => .K </k>
         <output>... .List => ListItem("multiple definition of local value named '"
                            +String substrString(#tokenToString(L),0
                          ,lengthString(#tokenToString(L)) -Int 1) +String "'") </output>
        <currModule> ModName:SymbolicValueRef </currModule>
        <funModuleName> ModName </funModuleName>
        <currFunction> FunName:SymbolicValueRef </currFunction>
        <functionName> FunName </functionName>
         <varTypes>... addNameToString(L) |-> Ty:K ...</varTypes>

    //case 3, if the block name is a num, then the integer number must be in order
    rule <k> checkSingleAssignment(L:LabelStringConstant Ins:InstructionList
                                BB:BBTerminatorInstruction BBL:BasicBlockList)
         => setArgsToBlockEnv(addNameToString(L), getArgsInFunction(Args))
              ~> checkSingleAssignmentInBlock(addNameToString(L),Ins BB, true)
           ~> checkSingleAssignment(BBL) ...</k>
        <instructionCounter> Num:Int => 1 </instructionCounter>
        <currModule> ModName:SymbolicValueRef </currModule>
        <funModuleName> ModName </funModuleName>
        <currFunction> FunName:SymbolicValueRef </currFunction>
        <functionName> FunName </functionName>
        <formalParameters> arguments(Args:ElemList) </formalParameters>
         <localFunVarCounter> I:Int => I +Int 1 </localFunVarCounter>
         <basicBlocks> M':Map (.Map  => addNameToString(L)
                         |-> blockContent(.Map, .Set, .Set,
                      SetItem(varOp(addNameToString(L),0,label, addNameToString(L))),
            .Set, SetItem(varOp(addNameToString(L),0,label, addNameToString(L))), .Set)) </basicBlocks>
         <varTypes> M:Map (.Map => addNameToString(L) |-> label) </varTypes>
         requires notBool addNameToString(L) in keys(M)
                  andBool isIntString(substrString(#tokenToString(L), 0
                                        , lengthString(#tokenToString(L)) -Int 1))
                  andBool  String2Int(substrString(#tokenToString(L),0
                                   ,lengthString(#tokenToString(L)) -Int 1)) ==Int I

    //case 4: if the label number is not in order with the var number in the fun
    rule <k> checkSingleAssignment(L:LabelStringConstant Ins:InstructionList
                                BB:BBTerminatorInstruction BBL:BasicBlockList)
                   ~> K':K => .K </k>
        <currModule> ModName:SymbolicValueRef </currModule>
        <funModuleName> ModName </funModuleName>
        <currFunction> FunName:SymbolicValueRef </currFunction>
        <functionName> FunName </functionName>
         <localFunVarCounter> I:Int </localFunVarCounter>
         <output>... .List => ListItem("error: variable expected to be numbered "
                                         +String Int2String(I)) </output>
         requires isIntString(substrString(#tokenToString(L), 0
                                        , lengthString(#tokenToString(L)) -Int 1))
                 andBool String2Int(substrString(#tokenToString(L),0
                        ,lengthString(#tokenToString(L)) -Int 1)) =/=Int I

    //case 5: same as case 1, but the block is the final one in a function
    rule <k> checkSingleAssignment(L:LabelStringConstant Ins:InstructionList
                                BB:BBTerminatorInstruction)
           => setArgsToBlockEnv(addNameToString(L), getArgsInFunction(Args))
              ~> checkSingleAssignmentInBlock(addNameToString(L),Ins BB, true)
                 ~> checkSingleAssignment(.K) ...</k>
        <instructionCounter> Num:Int => 1 </instructionCounter>
        <currModule> ModName:SymbolicValueRef </currModule>
        <funModuleName> ModName </funModuleName>
        <currFunction> FunName:SymbolicValueRef </currFunction>
        <functionName> FunName </functionName>
        <formalParameters> arguments(Args:ElemList) </formalParameters>
         <basicBlocks> M':Map (.Map  => addNameToString(L)
              |-> blockContent(.Map, .Set, .Set,
                  SetItem(varOp(addNameToString(L),0,label, addNameToString(L))),
               .Set, SetItem(varOp(addNameToString(L),0,label, addNameToString(L))), .Set)) </basicBlocks>
         <varTypes> M:Map ( .Map => addNameToString(L) |-> label) </varTypes>
         requires notBool addNameToString(L) in keys(M)
                  andBool notBool isIntString(substrString(#tokenToString(L), 0
                                        , lengthString(#tokenToString(L)) -Int 1))

    //case 6: same as case 2 failure, but the block is the final one
    rule <k> checkSingleAssignment(L:LabelStringConstant Ins:InstructionList
                                BB:BBTerminatorInstruction)
              ~> K:K => .K </k>
        <currModule> ModName:SymbolicValueRef </currModule>
        <funModuleName> ModName </funModuleName>
        <currFunction> FunName:SymbolicValueRef </currFunction>
        <functionName> FunName </functionName>
         <varTypes> M:Map </varTypes>
         <output>... .List => ListItem("multiple definition of local value named '"
                            +String substrString(#tokenToString(L),0
                          ,lengthString(#tokenToString(L)) -Int 1) +String "'") </output>
         requires addNameToString(L) in keys(M)

    //case 7: same as case 3, but the block is the final one
    rule <k> checkSingleAssignment(L:LabelStringConstant Ins:InstructionList
                                BB:BBTerminatorInstruction)
           => setArgsToBlockEnv(addNameToString(L), getArgsInFunction(Args))
              ~> checkSingleAssignmentInBlock(addNameToString(L),Ins BB, true)
                  ~> checkSingleAssignment(.K) ...</k>
        <instructionCounter> Num:Int => 1 </instructionCounter>
        <currModule> ModName:SymbolicValueRef </currModule>
        <funModuleName> ModName </funModuleName>
        <formalParameters> arguments(Args:ElemList) </formalParameters>
        <currFunction> FunName:SymbolicValueRef </currFunction>
        <functionName> FunName </functionName>
         <basicBlocks> M':Map (.Map  => addNameToString(L)
                         |-> blockContent(.Map, .Set, .Set,
                      SetItem(varOp(addNameToString(L),0,label, addNameToString(L))),
            .Set, SetItem(varOp(addNameToString(L),0,label, addNameToString(L))), .Set)) </basicBlocks>
         <localFunVarCounter> I:Int => I +Int 1 </localFunVarCounter>
         <varTypes> M:Map ( .Map => addNameToString(L) |-> label) </varTypes>
         requires isIntString(substrString(#tokenToString(L), 0
                                        , lengthString(#tokenToString(L)) -Int 1))
                  andBool  String2Int(substrString(#tokenToString(L),0
                                   ,lengthString(#tokenToString(L)) -Int 1)) ==Int I
                  andBool notBool addNameToString(L) in keys(M)

    //case 8: same as the case 4 failure, but the block is the final one.
    rule <k> checkSingleAssignment(L:LabelStringConstant Ins:InstructionList
                                BB:BBTerminatorInstruction)
             ~> K:K => .K </k>
        <currModule> ModName:SymbolicValueRef </currModule>
        <funModuleName> ModName </funModuleName>
        <currFunction> FunName:SymbolicValueRef </currFunction>
        <functionName> FunName </functionName>
         <localFunVarCounter> I:Int </localFunVarCounter>
         <output>... .List => ListItem("error: variable expected to be numbered "
                                         +String Int2String(I)) </output>
         requires isIntString(substrString(#tokenToString(L), 0
                                        , lengthString(#tokenToString(L)) -Int 1))
                  andBool String2Int(substrString(#tokenToString(L),0
                        ,lengthString(#tokenToString(L)) -Int 1)) =/=Int I

    //case 9: no specified block name, need to create one
    rule <k>checkSingleAssignment(Ins:InstructionList
                                BB:BBTerminatorInstruction BBL:BasicBlockList)
         => setArgsToBlockEnv(name(localVar, Int2String(I)), getArgsInFunction(Args))
              ~> checkSingleAssignmentInBlock(name(localVar, Int2String(I)), Ins BB, true)
           ~> checkSingleAssignment(BBL)
         ...</k>
        <instructionCounter> Num:Int => 1 </instructionCounter>
        <currModule> ModName:SymbolicValueRef </currModule>
        <funModuleName> ModName </funModuleName>
        <formalParameters> arguments(Args:ElemList) </formalParameters>
        <currFunction> FunName:SymbolicValueRef </currFunction>
        <functionName> FunName </functionName>
        <basicBlocks> M':Map (.Map  => name(localVar, Int2String(I))
                         |-> blockContent(.Map, .Set, .Set,
                      SetItem(varOp(name(localVar, Int2String(I)),0,label,
                             name(localVar, Int2String(I)))),
            .Set, SetItem(varOp(name(localVar, Int2String(I)),
                    0,label, name(localVar, Int2String(I)))), .Set)) </basicBlocks>
         <varTypes> M:Map (.Map => name(localVar, Int2String(I))  |-> label) </varTypes>
        <localFunVarCounter> I:Int => I +Int 1 </localFunVarCounter>
        requires notBool name(localVar, Int2String(I)) in keys(M)

    //case 10: generated var has been defined. 
    rule <k>checkSingleAssignment(Ins:InstructionList
                                BB:BBTerminatorInstruction BBL:BasicBlockList)
             ~> K:K => .K </k>
        <currModule> ModName:SymbolicValueRef </currModule>
        <funModuleName> ModName </funModuleName>
        <currFunction> FunName:SymbolicValueRef </currFunction>
        <functionName> FunName </functionName>
         <varTypes>... name(localVar, Int2String(I)) |-> Ty:K ...</varTypes>
        <localFunVarCounter> I:Int => I +Int 1 </localFunVarCounter>
         <output>... .List => ListItem("multiple definition of local value named '"
                            +String Int2String(I) +String "'") </output>

    //case 11: same as case 9, but block is the final one
    rule <k> checkSingleAssignment(Ins:InstructionList
                                BB:BBTerminatorInstruction)
         => setArgsToBlockEnv(name(localVar, Int2String(I)), getArgsInFunction(Args))
              ~> checkSingleAssignmentInBlock(name(localVar, Int2String(I)), Ins BB, true)
              ~> checkSingleAssignment(.K)
         ...</k>
        <instructionCounter> Num:Int => 1 </instructionCounter>
        <currModule> ModName:SymbolicValueRef </currModule>
        <funModuleName> ModName </funModuleName>
        <currFunction> FunName:SymbolicValueRef </currFunction>
        <functionName> FunName </functionName>
        <formalParameters> arguments(Args:ElemList) </formalParameters>
        <basicBlocks> M':Map (.Map  => name(localVar, Int2String(I))
                         |-> blockContent(.Map, .Set, .Set,
                      SetItem(varOp(name(localVar, Int2String(I)),0,label,
                             name(localVar, Int2String(I)))),
            .Set, SetItem(varOp(name(localVar, Int2String(I)),
                    0,label, name(localVar, Int2String(I)))), .Set)) </basicBlocks>
         <varTypes> M:Map (.Map => name(localVar, Int2String(I)) |-> label) </varTypes>
        <localFunVarCounter> I:Int => I +Int 1 </localFunVarCounter>
        requires notBool name(localVar, Int2String(I)) in keys(M)

    //case 12: same as case 10, but block is the final one
    rule <k> checkSingleAssignment(Ins:InstructionList
                                BB:BBTerminatorInstruction)
             ~> K:K => .K </k>
        <currModule> ModName:SymbolicValueRef </currModule>
        <funModuleName> ModName </funModuleName>
        <currFunction> FunName:SymbolicValueRef </currFunction>
        <functionName> FunName </functionName>
         <varTypes>... name(localVar, Int2String(I)) |-> Ty:K ...</varTypes>
        <localFunVarCounter> I:Int => I +Int 1 </localFunVarCounter>
         <output>... .List => ListItem("multiple definition of local value named '"
                            +String Int2String(I) +String "'") </output>


endmodule
