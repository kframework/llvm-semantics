// Copyright (c) 2013-2015 K Team. All Rights Reserved.
requires "llvm-syntax.k"

module LLVM-ABSTRACTSYNTAX
    imports LLVM-SYNTAX

    syntax KResult ::= Int | String | Floating
                      | arrayValue(List)
                      | Loc
                      | integerType(K)
                      | pointerType(K, K) //type, address space
                      | arrayTypeValue(K, K)  // inner type, length
                      | structTypeValue(K)
                      | functionTypeValue(K, K)  // return type, argument types
                      | listK(List)  [latex({#1})]

    syntax Element ::= val(K) [strict]
    syntax ElementResult ::= valValue(K)
    syntax Element ::= ElementResult
    syntax KResult ::= ElementResult
    rule val(K:KResult) => valValue(K) [structural]

    //syntax KItem ::= ElemList
    syntax ElemList ::= List{Element,","} [strict]
    syntax Int ::= lengthOfList(ElemList) [function]

    rule lengthOfList(.ElemList) => 0
    rule lengthOfList(val(K:K),L:ElemList) => 1 +Int lengthOfList(L)

    syntax KItem ::= elemListToK(ElemList) [function]

    rule elemListToK(.ElemList) => .K
    rule elemListToK(val(K:K), L:ElemList) => K ~> elemListToK(L)

    syntax KItem ::= instructionListToK(InstructionList) [function]

    rule instructionListToK(.InstructionList) => .K
    rule instructionListToK(K:Instruction L:Instruction)
                             => K ~> instructionListToK(L)

    syntax List ::= elemListToList(ElemList) [function]

    rule elemListToList(.ElemList) => .List
    rule elemListToList(val(K:K), L:ElemList) => ListItem(K) elemListToList(L)

    syntax ElemList ::= combineElemList(ElemList, ElemList) [function]

    rule combineElemList(.ElemList,Bs:ElemList) => Bs
    rule combineElemList((A:Element,As:ElemList),Bs:ElemList) => A,combineElemList(As,Bs)

    syntax NonVoidType ::= arrayType(K, K) [strict] // inner type, length
                         | structType(K) [strict]
                         | namedType(K)
                         | functionType(K, K) [strict] // return type, argument types

    rule arrayType(K1:KResult, K2:KResult) => arrayTypeValue(K1, K2) [structural]
    rule structType(K1:KResult) => structTypeValue(K1) [structural]
    rule functionType(K1:KResult, K2:KResult) => functionTypeValue(K1, K2) [structural]

    //uniform the types.
    rule [ I:UnsignedInt x T:Type ] => arrayType(T,
                                    String2Int(#tokenToString(I))) [structural]
    rule T:Type A:OptAddrSpace * => pointerType(T, A) [structural]
    rule { Ts:TypeList } => structType(Ts) [macro]
    rule < { Ts:TypeList } > => structType(Ts) [macro]

    //change IntType from LLVM syntax to K rule syntax
    rule I:IntType => integerType(String2Int(substrString(#tokenToString(I),
                        1, lengthString(#tokenToString(I))))) [structural]

    syntax Loc ::= loc(Int, Int)    // TODO [semantic]
    syntax Loc ::= funptr(K)
    syntax ValueRef ::= Loc
/*
    syntax List ::= list(KList) [function]

    rule list(.KList) => .List
    rule list(A:K,, KL:KList) => ListItem(A) list(KL)
*/
    syntax Int ::= ptrByte(K, K) // address, byteNumber; part of a pointer, as a byte
    syntax Int ::= floatByte(K, K, K) // float, type, byte number
    //rule isNat(ptrByte(_, _)) => true
    //rule isNat(floatByte(_, _, _)) => true

    syntax KItem ::= "emptyDef"
    syntax KItem ::= "funBegin"
    syntax KItem ::= "debug" // TODO [semantic]
    syntax KItem ::= "callMain" // TODO [semantic]
    syntax KItem ::= "initGlobals" // TODO [semantic]
    syntax ElemList ::= "vararg"

    //LLVM builtin values
    syntax KResult ::= "NaN"
    syntax KResult ::= "PositiveZero"
    syntax KResult ::= "NegativeZero"
    syntax KResult ::= "PositiveInfinity"
    syntax KResult ::= "NegativeInfinity"

    //don't know how to deal with
    syntax KItem ::= moduleAsm(K) // now let's to be K first, maybe String
    syntax KItem ::= metaConst(K, IndexList) //Type, IndexList
    syntax KItem ::= metaVar(MetadataVar, MetadataInts) //Name, MetaList

    syntax KItem ::= float(String)
    syntax KItem ::= constantString(String)
    syntax KItem ::= constantArray(K, K) [strict] // element type, arguments

    syntax KItem ::= invoke(K, K, K, K)//operand, Params, fromLabel toLabel
    syntax KItem ::= initializer(K, K) // type, value
    syntax KItem ::= globalVariable(K, K, K, K) [strict(3)]// Value/Name, Modifiers, Type, Initializer
    syntax KItem ::= modifiers(ElemList)
    syntax KItem ::= insMetas(ElemList)
    syntax KItem ::= alloca(K, K, K) [strict] // Type, NumElements, align
    syntax KItem ::= preAlloca(K, K, K, K) [strict(2,3)] // Type, IntType, NumElements, align
    syntax KItem ::= load(K, K) [strict]//type value
    syntax KItem ::= operand(K, K) [strict] // Type, Value

    //instructions
    syntax KItem ::= store(K, K, K) [strict]  // Type, Value, Destination
    syntax KItem ::= fence(K) [strict]
    syntax KItem ::= ret(K, K) [strict]//type value,
    syntax KItem ::= assign(K, K) [strict(2)] // Name, Instruction
    syntax KItem ::= instruction(K, K, K) //body, modifiers, instructionMetadatas

    syntax KItem ::= "unreachable"
    syntax KItem ::= resume(K)//operand
    syntax KItem ::= indirectbr(K, ElemList)//operand, list of labels
    syntax KItem ::= unconditional(K)//label
    syntax KItem ::= conditional(K, K, K) [strict(1)]//operand, label1, label2
    syntax KItem ::= switch(K, K, K, K) [strict(1,2,4)] // type, condition, default dest, list of cases
    syntax Case ::= case(K, K) [strict(1)] // operand, successor
    syntax CaseResult ::= caseValue(K, K)
    syntax KResult ::= CaseResult
    syntax Case ::= CaseResult
    syntax Cases ::= List{Case,","} [strict,klabel('caseCon)]
    //syntax KItem ::= Cases
    rule case(K:KResult, K') => caseValue(K, K') [structural]

    syntax KItem ::= arguments(ElemList) [strict]
    syntax KItem ::= arg(K, K, K) // Modifiers, Type, Value/Name

    //@ Conversion Operations
    syntax KItem ::= theTrunc(K, K, K) [strict] // type, op, totype
    syntax KItem ::= theSExt(K, K, K) [strict] // type, op, totype
    syntax KItem ::= theZExt(K, K, K) [strict] // oldtype, op, totype
    syntax KItem ::= theBitCast(K, K, K) [strict] // type, op, totype
    syntax KItem ::= theIntToPtr(K, K, K) [strict] // type, op, totype
    syntax KItem ::= thePtrToInt(K, K, K) [strict] // type, op, totype
    syntax KItem ::= theFpToSI(K, K, K) [strict] // type, op, totype
    syntax KItem ::= theFpToUI(K, K, K) [strict] // type, op, totype
    syntax KItem ::= theFPTrunc(K, K, K) [strict] // type, op, totype
    syntax KItem ::= theFPExt(K, K, K) [strict] // type, op, totype
    syntax KItem ::= theSIToFP(K, K, K) [strict] // type, op, totype
    syntax KItem ::= theUIToFP(K, K, K) [strict] // type, op, totype
    syntax KItem ::= theAddrspacecast(K, K, K) [strict]//type, op, totype

    syntax KItem ::= constantStruct(K, K) [strict(2)] // modifiers, arguments
    syntax KItem ::= theVAArg(K, K) [strict] // result type, va_list
    syntax KItem ::= values(K) [function]
    rule values(K:K) => K
    syntax KItem ::= phi(K, ElemList) [strict(1)] // type, edge list
    syntax KItem ::= edge(K, K) // used by PHI
    syntax KItem ::= select(K, K, K, K) [strict(1,2)] // condition, true val, false val
    syntax KItem ::= tailCall(K, ElemList) [strict]//type, Callees
    syntax KItem ::= call(K, ElemList) [strict] // Type, Callees
    syntax KItem ::= callee(K, K) [strict] // Value/Name, Arguments
    syntax KItem ::= calleeValue(K, K)
    rule callee(K:KResult, K':KResult) => calleeValue(K, K') [structural]

    syntax KItem ::= getElementPtr(K, K, K) [strict]// operand, operand, modifiers
    syntax KItem ::= extractElement(K, K) [strict]
    syntax KItem ::= insertElement(K, K, K) [strict]
    syntax KItem ::= shuffleVector(K, K, K) [strict]
    syntax KItem ::= landingPad(K,K,K) [strict(1,2)] // operand,operand modifiers
    syntax KItem ::= extractValue(K, ElemList) [strict]
    syntax KItem ::= cmpxChg(K, K, K) [strict]
    syntax KItem ::= atomicRmw(K, K, K) [strict]
    syntax KItem ::= insertValue(K, K, ElemList) [strict]

    syntax KItem ::= aliases(ElemList)
    syntax KItem ::= alias(K, K, K) //modifiers, Name, Aliasee
    syntax KItem ::= theModule(K, K, K, K, K, K, K, K)
                    //Id, TargetLayout, TargetTriple, MetaVars,Typedefs,GlobalVars,Aliases,Functions 
    syntax KItem ::= basicBlock(K, K) // Name, Instructions
    syntax KItem ::= functionDef(K, K, K, K, K)  [strict(2)] // Attributes, RetType, Value/Name, Arguments, Body
    syntax KItem ::= functionDecl(K, K, K, K)  [strict(2)] // Attributes,Type, Value/Name, Arguments
    syntax KItem ::= typedef(K, K) // name, type TODO: modifiers
    syntax KItem ::= fields(ElemList) [strict]
    syntax KItem ::= types(ElemList)  [strict]
    syntax KItem ::= setBlock(K)
    syntax KItem ::= body(ElemList)

    syntax SymbolicValueRef ::= name(String)

    syntax KItem ::= theDefinition(K,K) [strict]
    syntax KItem ::= iNotEq(K, K, K) [strict] // type, left op, right op
    syntax KItem ::= iEq(K, K, K) [strict]
    syntax KItem ::= uGT(K, K, K) [strict]
    syntax KItem ::= uGE(K, K, K) [strict]
    syntax KItem ::= uLT(K, K, K) [strict]
    syntax KItem ::= uLE(K, K, K) [strict]
    syntax KItem ::= sGT(K, K, K) [strict]
    syntax KItem ::= sGE(K, K, K) [strict]
    syntax KItem ::= sLT(K, K, K) [strict]
    syntax KItem ::= sLE(K, K, K) [strict]

    syntax KItem ::= oEQ(K, K, K) [strict]
    syntax KItem ::= oGT(K, K, K) [strict]
    syntax KItem ::= oGE(K, K, K) [strict]
    syntax KItem ::= oLT(K, K, K) [strict]
    syntax KItem ::= oLE(K, K, K) [strict]
    syntax KItem ::= oNE(K, K, K) [strict]
    syntax KItem ::= oRD(K, K, K) [strict]
    syntax KItem ::= uNE(K, K, K) [strict]
    //syntax LLVM ::= uNE(K, K, K) [strict]
    syntax KItem ::= uNO(K, K, K) [strict]
    syntax KItem ::= uEQ(K, K, K) [strict]


    //@ Binary Operations
    syntax KItem ::= theAdd(K, K, K) [strict] // Type, Left op, Right op
    syntax KItem ::= theSub(K, K, K) [strict] // Type, Left op, Right op
    syntax KItem ::= theMul(K, K, K) [strict] // Type, Left op, Right op
    syntax KItem ::= theUDiv(K, K, K) [strict] // Type, Left op, Right op
    syntax KItem ::= theSDiv(K, K, K) [strict] // Type, Left op, Right op
    syntax KItem ::= theURem(K, K, K) [strict] // Type, Left op, Right op
    syntax KItem ::= theSRem(K, K, K) [strict] // Type, Left op, Right op

    //@ Floating-point Binary Operations
    //strict on all the arguments for theFSub, theFMul, theFDiv, the FRem
    syntax KItem ::= theFAdd(K, K, K) [strict] // Type, Left op, Right op
    syntax KItem ::= theFSub(K, K, K) [strict] // Type, Left op, Right op
    syntax KItem ::= theFMul(K, K, K) [strict] // Type, Left op, Right op
    syntax KItem ::= theFDiv(K, K, K) [strict] // Type, Left op, Right op
    syntax KItem ::= theFRem(K, K, K) [strict] // Type, Left op, Right op

    //@ Bitwise Binary Operations
    // strict on all the arguments for theShl, theLShr,theAShr, theOr, theXor
    syntax KItem ::= theShl(K, K, K) [strict] // Type, Left op, Right op
    syntax KItem ::= theLShr(K, K, K) [strict] // Type, Left op, Right op
    syntax KItem ::= theAShr(K, K, K) [strict] // Type, Left op, Right op
    syntax KItem ::= theOr(K, K, K) [strict] // Type, Left op, Right op
    syntax KItem ::= theAnd(K, K, K) [strict] // Type, Left op, Right op
    syntax KItem ::= theXor(K, K, K) [strict] // Type, Left op, Right op


endmodule
