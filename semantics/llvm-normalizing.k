// Copyright (c) 2013-2015 K Team. All Rights Reserved.
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

    syntax KItem ::= instValToKItem(InstVal) [function]
   
    //here
    //do the same for all IntConstructors  "add" | "sub" | "mul" | "shl"
    //add addNameToString to every position where it has type and ValueRef
    //for example theAdd
    rule instValToKItem(add Onw:OptNW Ty:Type V1:ValueRef , V2:ValueRef Ins:InstructionMetadatas)
           => instruction(theAdd(addNameToString(Ty)
                                 ,addNameToString(V1)
                                 ,addNameToString(V2))
                          ,modifiers(formElemList(Onw))
                          ,insMetas(formElemList(Ins)))
    rule instValToKItem(sub Onw:OptNW Ty:Type V1:ValueRef , V2:ValueRef Ins:InstructionMetadatas)
           => instruction(theSub(addNameToString(Ty)
                                 ,addNameToString(V1)
                                 ,addNameToString(V2))
                          ,modifiers(formElemList(Onw))
                          ,insMetas(formElemList(Ins)))
    rule instValToKItem(mul Onw:OptNW Ty:Type V1:ValueRef , V2:ValueRef Ins:InstructionMetadatas)
           => instruction(theMul(addNameToString(Ty)
                                 ,addNameToString(V1)
                                 ,addNameToString(V2))
                          ,modifiers(formElemList(Onw))
                          ,insMetas(formElemList(Ins)))
    rule instValToKItem(shl Onw:OptNW Ty:Type V1:ValueRef , V2:ValueRef Ins:InstructionMetadatas)
           => instruction(theShl(addNameToString(Ty)
                                 ,addNameToString(V1)
                                 ,addNameToString(V2))
                          ,modifiers(formElemList(Onw))
                          ,insMetas(formElemList(Ins)))
    //do the same for all DivConstructors ::= "udiv" | "sdiv" | "lshr" | "ashr"
    //done
    rule instValToKItem(udiv Opx:OptExact Ty:Type V1:ValueRef , V2:ValueRef Ins:InstructionMetadatas)
           => instruction(theUDiv(addNameToString(Ty)
                                  ,addNameToString(V1)
                                  ,addNameToString(V2))
                          ,modifiers(formElemList(Opx))
                          ,insMetas(formElemList(Ins)))
    rule instValToKItem(sdiv Opx:OptExact Ty:Type V1:ValueRef , V2:ValueRef Ins:InstructionMetadatas)
           => instruction(theSDiv(addNameToString(Ty)
                                  ,addNameToString(V1)
                                  ,addNameToString(V2))
                          ,modifiers(formElemList(Opx))
                          ,insMetas(formElemList(Ins)))
    rule instValToKItem(lshr Opx:OptExact Ty:Type V1:ValueRef , V2:ValueRef Ins:InstructionMetadatas)
           => instruction(theLShr(addNameToString(Ty)
                                  ,addNameToString(V1)
                                  ,addNameToString(V2))
                          ,modifiers(formElemList(Opx))
                          ,insMetas(formElemList(Ins)))
    rule instValToKItem(ashr Opx:OptExact Ty:Type V1:ValueRef , V2:ValueRef Ins:InstructionMetadatas)
           => instruction(theAShr(addNameToString(Ty)
                                  ,addNameToString(V1)
                                  ,addNameToString(V2))
                          ,modifiers(formElemList(Opx))
                          ,insMetas(formElemList(Ins)))
    //do the same for all FloatOps ::= "fadd" | "fsub" | "fmul" | "fdiv" | "frem"
    //done
    rule instValToKItem(fadd Fmf:FastMathFlags Ty:Type V1:ValueRef , V2:ValueRef Ins:InstructionMetadatas)
           => instruction(theFAdd(addNameToString(Ty)
                                  ,addNameToString(V1)
                                  ,addNameToString(V2))
                          ,modifiers(formElemList(Fmf))
                          ,insMetas(formElemList(Ins)))
    rule instValToKItem(fsub Fmf:FastMathFlags Ty:Type V1:ValueRef , V2:ValueRef Ins:InstructionMetadatas)
           => instruction(theFSub(addNameToString(Ty)
                                  ,addNameToString(V1)
                                  ,addNameToString(V2))
                          ,modifiers(formElemList(Fmf))
                          ,insMetas(formElemList(Ins)))
    rule instValToKItem(fmul Fmf:FastMathFlags Ty:Type V1:ValueRef , V2:ValueRef Ins:InstructionMetadatas)
           => instruction(theFMul(addNameToString(Ty)
                                  ,addNameToString(V1)
                                  ,addNameToString(V2))
                          ,modifiers(formElemList(Fmf))
                          ,insMetas(formElemList(Ins)))
    rule instValToKItem(fdiv Fmf:FastMathFlags Ty:Type V1:ValueRef , V2:ValueRef Ins:InstructionMetadatas)
           => instruction(theFDiv(addNameToString(Ty)
                                  ,addNameToString(V1)
                                  ,addNameToString(V2))
                          ,modifiers(formElemList(Fmf))
                          ,insMetas(formElemList(Ins)))
    rule instValToKItem(frem Fmf:FastMathFlags Ty:Type V1:ValueRef , V2:ValueRef Ins:InstructionMetadatas)
           => instruction(theFRem(addNameToString(Ty)
                                  ,addNameToString(V1)
                                  ,addNameToString(V2))
                          ,modifiers(formElemList(Fmf))
                          ,insMetas(formElemList(Ins)))
    rule instValToKItem(urem Ty:Type V1:ValueRef , V2:ValueRef Ins:InstructionMetadatas)
           => instruction(theURem(addNameToString(Ty)
                                  ,addNameToString(V1)
                                  ,addNameToString(V2))
                          ,modifiers(.ElemList)
                          ,insMetas(formElemList(Ins)))
    rule instValToKItem(srem Ty:Type V1:ValueRef , V2:ValueRef Ins:InstructionMetadatas)
           => instruction(theSRem(addNameToString(Ty)
                                  ,addNameToString(V1)
                                  ,addNameToString(V2))
                          ,modifiers(.ElemList)
                          ,insMetas(formElemList(Ins)))
    //do the same for LogicalOps ::= "and" | "or" | "xor"
    //done
    rule instValToKItem(and Ty:Type V1:ValueRef , V2:ValueRef Ins:InstructionMetadatas)
           => instruction(theAnd(addNameToString(Ty)
                                 ,addNameToString(V1)
                                 ,addNameToString(V2))
                          ,modifiers(.ElemList)
                          ,insMetas(formElemList(Ins)))
    rule instValToKItem(or Ty:Type V1:ValueRef , V2:ValueRef Ins:InstructionMetadatas)
           => instruction(theOr(addNameToString(Ty)
                                ,addNameToString(V1)
                                ,addNameToString(V2))
                          ,modifiers(.ElemList)
                          ,insMetas(formElemList(Ins)))
    rule instValToKItem(xor Ty:Type V1:ValueRef , V2:ValueRef Ins:InstructionMetadatas)
           => instruction(theXor(addNameToString(Ty)
                                 ,addNameToString(V1)
                                 ,addNameToString(V2))
                          ,modifiers(.ElemList)
                          ,insMetas(formElemList(Ins)))

/*    
    rule icmp ne T:Type V:ValueRef , V':ValueRef I:InstructionMetadatas
           => theDefinition(INotEq(T, V, V'),I)
*/
    rule instValToKItem(icmp ne Ty:Type V1:ValueRef , V2:ValueRef Ins:InstructionMetadatas)
           => instruction(iNotEq(addNameToString(Ty)
                                 ,addNameToString(V1)
                                 ,addNameToString(V2))
                          ,modifiers(.ElemList)
                          ,insMetas(formElemList(Ins)))
/*
    rule icmp eq T:Type V:ValueRef , V':ValueRef I:InstructionMetadatas
        => theDefinition(IEq(T, V, V'),I)
*/
    rule instValToKItem(icmp eq Ty:Type V1:ValueRef , V2:ValueRef Ins:InstructionMetadatas)
           => instruction(iEq(addNameToString(Ty)
                              ,addNameToString(V1)
                              ,addNameToString(V2))
                          ,modifiers(.ElemList)
                          ,insMetas(formElemList(Ins)))
/*
   rule icmp ugt T:Type V:ValueRef , V':ValueRef I:InstructionMetadatas
         => theDefinition(UGT(T, V, V'),I)
*/
    rule instValToKItem(icmp ugt Ty:Type V1:ValueRef , V2:ValueRef Ins:InstructionMetadatas)
           => instruction(uGT(addNameToString(Ty)
                              ,addNameToString(V1)
                              ,addNameToString(V2))
                          ,modifiers(.ElemList)
                          ,insMetas(formElemList(Ins)))
/*
    rule icmp uge T:Type V:ValueRef , V':ValueRef I:InstructionMetadatas
         => theDefinition(UGE(T, V, V'),I)
*/
    rule instValToKItem(icmp uge Ty:Type V1:ValueRef , V2:ValueRef Ins:InstructionMetadatas)
           => instruction(uGE(addNameToString(Ty)
                              ,addNameToString(V1)
                              ,addNameToString(V2))
                          ,modifiers(.ElemList)
                          ,insMetas(formElemList(Ins)))
/*
    rule icmp ult T:Type V:ValueRef , V':ValueRef I:InstructionMetadatas
         => theDefinition(ULT(T, V, V'),I)
*/
    rule instValToKItem(icmp ult Ty:Type V1:ValueRef , V2:ValueRef Ins:InstructionMetadatas)
           => instruction(uLT(addNameToString(Ty)
                              ,addNameToString(V1)
                              ,addNameToString(V2))
                          ,modifiers(.ElemList)
                          ,insMetas(formElemList(Ins)))
/*
    rule icmp ule T:Type V:ValueRef , V':ValueRef I:InstructionMetadatas
         => theDefinition(ULE(T, V, V'),I)
*/
    rule instValToKItem(icmp ule Ty:Type V1:ValueRef , V2:ValueRef Ins:InstructionMetadatas)
           => instruction(uLE(addNameToString(Ty)
                              ,addNameToString(V1)
                              ,addNameToString(V2))
                          ,modifiers(.ElemList)
                          ,insMetas(formElemList(Ins)))
/*
    rule icmp sgt T:Type V:ValueRef , V':ValueRef I:InstructionMetadatas
         => theDefinition(SGT(T, V, V'),I)
*/
    rule instValToKItem(icmp sgt Ty:Type V1:ValueRef , V2:ValueRef Ins:InstructionMetadatas)
           => instruction(sGT(addNameToString(Ty)
                              ,addNameToString(V1)
                              ,addNameToString(V2))
                          ,modifiers(.ElemList)
                          ,insMetas(formElemList(Ins)))
/*
    rule icmp sge T:Type V:ValueRef , V':ValueRef I:InstructionMetadatas
         => theDefinition(SGE(T, V, V'),I)
*/
    rule instValToKItem(icmp sge Ty:Type V1:ValueRef , V2:ValueRef Ins:InstructionMetadatas)
           => instruction(sGE(addNameToString(Ty)
                              ,addNameToString(V1)
                              ,addNameToString(V2))
                          ,modifiers(.ElemList)
                          ,insMetas(formElemList(Ins)))
/*
    rule icmp slt T:Type V:ValueRef , V':ValueRef I:InstructionMetadatas
         => theDefinition(SLT(T, V, V'),I)
*/
    rule instValToKItem(icmp slt Ty:Type V1:ValueRef , V2:ValueRef Ins:InstructionMetadatas)
           => instruction(sLT(addNameToString(Ty)
                              ,addNameToString(V1)
                              ,addNameToString(V2))
                          ,modifiers(.ElemList)
                          ,insMetas(formElemList(Ins)))
/*
    rule icmp sle T:Type V:ValueRef , V':ValueRef I:InstructionMetadatas
         => theDefinition(SLE(T, V, V'),I)
*/
    rule instValToKItem(icmp sle Ty:Type V1:ValueRef , V2:ValueRef Ins:InstructionMetadatas)
           => instruction(sLE(addNameToString(Ty)
                              ,addNameToString(V1)
                              ,addNameToString(V2))
                          ,modifiers(.ElemList)
                          ,insMetas(formElemList(Ins)))
/*
    rule fcmp false _:Type _:ValueRef , _:ValueRef I:InstructionMetadatas
         => theDefinition(0,I)
*/
    rule instValToKItem(fcmp false Ty:Type V1:ValueRef , V2:ValueRef Ins:InstructionMetadatas)
           => instruction(0,modifiers(.ElemList),insMetas(formElemList(Ins)))
/*
    rule fcmp true _:Type _:ValueRef , _:ValueRef I:InstructionMetadatas
         => theDefinition(1,I)
*/
    rule instValToKItem(fcmp true Ty:Type V1:ValueRef , V2:ValueRef Ins:InstructionMetadatas)
           => instruction(1,modifiers(.ElemList),insMetas(formElemList(Ins)))
/*
    rule fcmp oeq T:Type V:ValueRef , V':ValueRef I:InstructionMetadatas
         => theDefinition(OEQ(T, V, V'),I)
*/
    rule instValToKItem(fcmp oeq Ty:Type V1:ValueRef , V2:ValueRef Ins:InstructionMetadatas)
           => instruction(oEQ(addNameToString(Ty)
                              ,addNameToString(V1)
                              ,addNameToString(V2))
                          ,modifiers(.ElemList)
                          ,insMetas(formElemList(Ins)))
/*
    rule fcmp ogt T:Type V:ValueRef , V':ValueRef I:InstructionMetadatas
         => theDefinition(OGT(T, V, V'),I)
*/
    rule instValToKItem(fcmp ogt Ty:Type V1:ValueRef , V2:ValueRef Ins:InstructionMetadatas)
           => instruction(oGT(addNameToString(Ty)
                              ,addNameToString(V1)
                              ,addNameToString(V2))
                          ,modifiers(.ElemList)
                          ,insMetas(formElemList(Ins)))
/*
    rule fcmp oge T:Type V:ValueRef , V':ValueRef I:InstructionMetadatas
         => theDefinition(OGE(T, V, V'),I)
*/
    rule instValToKItem(fcmp oge Ty:Type V1:ValueRef , V2:ValueRef Ins:InstructionMetadatas)
           => instruction(oGE(addNameToString(Ty)
                              ,addNameToString(V1)
                              ,addNameToString(V2))
                          ,modifiers(.ElemList)
                          ,insMetas(formElemList(Ins)))
/*
    rule fcmp olt T:Type V:ValueRef , V':ValueRef I:InstructionMetadatas
         => theDefinition(OLT(T, V, V'),I)
*/
    rule instValToKItem(fcmp olt Ty:Type V1:ValueRef , V2:ValueRef Ins:InstructionMetadatas)
           => instruction(oLT(addNameToString(Ty)
                              ,addNameToString(V1)
                              ,addNameToString(V2))
                          ,modifiers(.ElemList)
                          ,insMetas(formElemList(Ins)))
/*
    rule fcmp ole T:Type V:ValueRef , V':ValueRef I:InstructionMetadatas
         => theDefinition(OLE(T, V, V'),I)
*/
    rule instValToKItem(fcmp ole Ty:Type V1:ValueRef , V2:ValueRef Ins:InstructionMetadatas)
           => instruction(oLE(addNameToString(Ty)
                              ,addNameToString(V1)
                              ,addNameToString(V2))
                          ,modifiers(.ElemList)
                          ,insMetas(formElemList(Ins)))
/*
    rule fcmp one T:Type V:ValueRef , V':ValueRef I:InstructionMetadatas
         => theDefinition(ONE(T, V, V'),I)
*/
    rule instValToKItem(fcmp one Ty:Type V1:ValueRef , V2:ValueRef Ins:InstructionMetadatas)
           => instruction(oNE(addNameToString(Ty)
                              ,addNameToString(V1)
                              ,addNameToString(V2))
                          ,modifiers(.ElemList)
                          ,insMetas(formElemList(Ins)))
/*
    rule fcmp ord T:Type V:ValueRef , V':ValueRef I:InstructionMetadatas
         => theDefinition(ORD(T, V, V'),I)
*/
    rule instValToKItem(fcmp ord Ty:Type V1:ValueRef , V2:ValueRef Ins:InstructionMetadatas)
           => instruction(oRD(addNameToString(Ty)
                              ,addNameToString(V1)
                              ,addNameToString(V2))
                          ,modifiers(.ElemList)
                          ,insMetas(formElemList(Ins)))
/*
    rule fcmp ugt T:Type V:ValueRef , V':ValueRef I:InstructionMetadatas
         => theDefinition(UGT(T, V, V'),I)
*/
    rule instValToKItem(fcmp ugt Ty:Type V1:ValueRef , V2:ValueRef Ins:InstructionMetadatas)
           => instruction(uGT(addNameToString(Ty)
                              ,addNameToString(V1)
                              ,addNameToString(V2))
                          ,modifiers(.ElemList)
                          ,insMetas(formElemList(Ins)))
/*
    rule fcmp uge T:Type V:ValueRef , V':ValueRef I:InstructionMetadatas
         => theDefinition(UGE(T, V, V'),I)
*/
    rule instValToKItem(fcmp uge Ty:Type V1:ValueRef , V2:ValueRef Ins:InstructionMetadatas)
           => instruction(uGE(addNameToString(Ty)
                              ,addNameToString(V1)
                              ,addNameToString(V2))
                          ,modifiers(.ElemList)
                          ,insMetas(formElemList(Ins)))
/*
    rule fcmp ult T:Type V:ValueRef , V':ValueRef I:InstructionMetadatas
         => theDefinition(ULT(T, V, V'),I)
*/
    rule instValToKItem(fcmp ult Ty:Type V1:ValueRef , V2:ValueRef Ins:InstructionMetadatas)
           => instruction(uLT(addNameToString(Ty)
                              ,addNameToString(V1)
                              ,addNameToString(V2))
                          ,modifiers(.ElemList)
                          ,insMetas(formElemList(Ins)))
/*
    rule fcmp ule T:Type V:ValueRef , V':ValueRef I:InstructionMetadatas
         => theDefinition(ULE(T, V, V'),I)
*/
    rule instValToKItem(fcmp ule Ty:Type V1:ValueRef , V2:ValueRef Ins:InstructionMetadatas)
           => instruction(uLE(addNameToString(Ty)
                              ,addNameToString(V1)
                              ,addNameToString(V2))
                          ,modifiers(.ElemList)
                          ,insMetas(formElemList(Ins)))
/*
    rule fcmp une T:Type V:ValueRef , V':ValueRef I:InstructionMetadatas
         => theDefinition(UNE(T, V, V'),I)
*/
    rule instValToKItem(fcmp une Ty:Type V1:ValueRef , V2:ValueRef Ins:InstructionMetadatas)
           => instruction(uNE(addNameToString(Ty)
                              ,addNameToString(V1)
                              ,addNameToString(V2))
                          ,modifiers(.ElemList)
                          ,insMetas(formElemList(Ins)))
/*
    rule fcmp uno T:Type V:ValueRef , V':ValueRef I:InstructionMetadatas
         => theDefinition(UNO(T, V, V'),I)
*/
    rule instValToKItem(fcmp uno Ty:Type V1:ValueRef , V2:ValueRef Ins:InstructionMetadatas)
           => instruction(uNO(addNameToString(Ty)
                              ,addNameToString(V1)
                              ,addNameToString(V2))
                          ,modifiers(.ElemList)
                          ,insMetas(formElemList(Ins)))
/*
    rule fcmp ueq T:Type V:ValueRef , V':ValueRef I:InstructionMetadatas
         => theDefinition(UEQ(T, V, V'),I)
*/
    rule instValToKItem(fcmp ueq Ty:Type V1:ValueRef , V2:ValueRef Ins:InstructionMetadatas)
           => instruction(uEQ(addNameToString(Ty)
                              ,addNameToString(V1)
                              ,addNameToString(V2))
                          ,modifiers(.ElemList)
                          ,insMetas(formElemList(Ins)))

    //do the same for all the rules: CastOps ::= "trunc" | "zext" | "sext" | "fptrunc"
                     //| "fpext" | "bitcast" | "uitofp" | "sitofp"
                     //| "fptoui" | "fptosi" | "inttoptr"
                     //| "addrspacecast" | "ptrtoint"

    rule instValToKItem(trunc Ty1:Type V:ValueRef to Ty2:Type Ins:InstructionMetadatas)
           => instruction(theTrunc(addNameToString(Ty1)
                                   ,addNameToString(V)
                                   ,addNameToString(Ty2))
                          ,modifiers(.ElemList)
                          ,insMetas(formElemList(Ins)))
     rule instValToKItem(sext Ty1:Type V:ValueRef to Ty2:Type Ins:InstructionMetadatas)
           => instruction(theSExt(addNameToString(Ty1)
                                  ,addNameToString(V)
                                  ,addNameToString(Ty2))
                          ,modifiers(.ElemList)
                          ,insMetas(formElemList(Ins)))
     rule instValToKItem(zext Ty1:Type V:ValueRef to Ty2:Type Ins:InstructionMetadatas)
           => instruction(theZExt(addNameToString(Ty1)
                                  ,addNameToString(V)
                                  ,addNameToString(Ty2))
                          ,modifiers(.ElemList)
                          ,insMetas(formElemList(Ins)))
     rule instValToKItem(bitcast Ty1:Type V:ValueRef to Ty2:Type Ins:InstructionMetadatas)
           => instruction(theBitCast(addNameToString(Ty1)
                                     ,addNameToString(V)
                                     ,addNameToString(Ty2))
                          ,modifiers(.ElemList)
                          ,insMetas(formElemList(Ins)))
     rule instValToKItem(inttoptr Ty1:Type V:ValueRef to Ty2:Type Ins:InstructionMetadatas)
           => instruction(theIntToPtr(addNameToString(Ty1)
                                      ,addNameToString(V)
                                      ,addNameToString(Ty2))
                          ,modifiers(.ElemList)
                          ,insMetas(formElemList(Ins)))
     rule instValToKItem(ptrtoint Ty1:Type V:ValueRef to Ty2:Type Ins:InstructionMetadatas)
           => instruction(thePtrToInt(addNameToString(Ty1)
                                      ,addNameToString(V)
                                      ,addNameToString(Ty2))
                          ,modifiers(.ElemList)
                          ,insMetas(formElemList(Ins)))
     rule instValToKItem(fptosi Ty1:Type V:ValueRef to Ty2:Type Ins:InstructionMetadatas)
           => instruction(theFpToSI(addNameToString(Ty1)
                                    ,addNameToString(V)
                                    ,addNameToString(Ty2))
                          ,modifiers(.ElemList)
                          ,insMetas(formElemList(Ins)))
     rule instValToKItem(fptoui Ty1:Type V:ValueRef to Ty2:Type Ins:InstructionMetadatas)
           => instruction(theFpToUI(addNameToString(Ty1)
                                    ,addNameToString(V)
                                    ,addNameToString(Ty2))
                          ,modifiers(.ElemList)
                          ,insMetas(formElemList(Ins)))
     rule instValToKItem(fptrunc Ty1:Type V:ValueRef to Ty2:Type Ins:InstructionMetadatas)
           => instruction(theFPTrunc(addNameToString(Ty1)
                                     ,addNameToString(V)
                                     ,addNameToString(Ty2))
                          ,modifiers(.ElemList)
                          ,insMetas(formElemList(Ins)))
     rule instValToKItem(fpext Ty1:Type V:ValueRef to Ty2:Type Ins:InstructionMetadatas)
           => instruction(theFPExt(addNameToString(Ty1)
                                   ,addNameToString(V)
                                   ,addNameToString(Ty2))
                          ,modifiers(.ElemList)
                          ,insMetas(formElemList(Ins)))
     rule instValToKItem(sitofp Ty1:Type V:ValueRef to Ty2:Type Ins:InstructionMetadatas)
           => instruction(theSIToFP(addNameToString(Ty1)
                                    ,addNameToString(V)
                                    ,addNameToString(Ty2))
                          ,modifiers(.ElemList)
                          ,insMetas(formElemList(Ins)))
     rule instValToKItem(uitofp Ty1:Type V:ValueRef to Ty2:Type Ins:InstructionMetadatas)
           => instruction(theUIToFP(addNameToString(Ty1)
                                    ,addNameToString(V)
                                    ,addNameToString(Ty2))
                          ,modifiers(.ElemList)
                          ,insMetas(formElemList(Ins)))
     rule instValToKItem(addrspacecast Ty1:Type V:ValueRef to Ty2:Type Ins:InstructionMetadatas)
           => instruction(theAddrspacecast(addNameToString(Ty1)
                                           ,addNameToString(V)
                                           ,addNameToString(Ty2))
                          ,modifiers(.ElemList)
                          ,insMetas(formElemList(Ins)))

    rule instValToKItem(select Ty1:Type V1:ValueRef, Ty2:Type V2:ValueRef, Ty3:Type V3:ValueRef)
           => instruction(select(addNameToString(Ty1)
                                 ,addNameToString(V1)
                                 ,operand(addNameToString(Ty2),addNameToString(V2))
                                 ,operand(addNameToString(Ty3),addNameToString(V3)))
                          ,modifiers(.ElemList)
                          ,insMetas(.ElemList))

    rule instValToKItem(va_arg Ty1:Type V1:ValueRef, Ty2:Type Ins:InstructionMetadatas)
           => instruction(theVAArg(addNameToString(Ty2)
                                   ,operand(addNameToString(Ty1),addNameToString(V1)))
                          ,modifiers(.ElemList)
                          ,insMetas(formElemList(Ins)))

    rule instValToKItem(getelementptr Oib:OptInBounds Ty1:Type V1:ValueRef
                                    Itr:IntResolveVals Ins:InstructionMetadatas)
           => instruction(getElementPtr(addNameToString(Ty1)
                                        ,addNameToString(V1)
                                        ,modifiers(formElemList(Itr)))
                          ,modifiers(formElemList(Oib))
                          ,insMetas(formElemList(Ins)))

    rule instValToKItem(extractelement Ty1:Type V1:ValueRef,
                                    Ty2:Type V2:ValueRef Ins:InstructionMetadatas)
           => instruction(extractElement(operand(addNameToString(Ty1),addNameToString(V1))
                                         ,operand(addNameToString(Ty2),addNameToString(V2)))
                          ,modifiers(.ElemList)
                          ,insMetas(formElemList(Ins)))

    rule instValToKItem(insertelement Ty1:Type V1:ValueRef, Ty2:Type V2:ValueRef,
                              Ty3:Type V3:ValueRef Ins:InstructionMetadatas)
           => instruction(insertElement(operand(addNameToString(Ty1),addNameToString(V1))
                                        ,operand(addNameToString(Ty2),addNameToString(V2))
                                        ,operand(addNameToString(Ty3),addNameToString(V3)))
                          ,modifiers(.ElemList)
                          ,insMetas(formElemList(Ins)))

    rule instValToKItem(shufflevector Ty1:Type V1:ValueRef, Ty2:Type V2:ValueRef,
                              Ty3:Type V3:ValueRef Ins:InstructionMetadatas)
           => instruction(shuffleVector(operand(addNameToString(Ty1),addNameToString(V1))
                                        ,operand(addNameToString(Ty2),addNameToString(V2))
                                        ,operand(addNameToString(Ty3),addNameToString(V3)))
                          ,modifiers(.ElemList)
                          ,insMetas(formElemList(Ins)))

    rule instValToKItem(phi Ty1:Type Pl:PHIList Ins:InstructionMetadatas)
           => instruction(phi(addNameToString(Ty1)
                              ,formElemList(Pl))
                          ,modifiers(.ElemList)
                          ,insMetas(formElemList(Ins)))

    rule instValToKItem(landingpad Ty1:Type personality Ty2:Type V2:ValueRef
                         Oc:OptCleanup Lpfs:LandingpadFactors Ins:InstructionMetadatas)
           => instruction(landingPad(addNameToString(Ty1)
                                     ,operand(addNameToString(Ty2),addNameToString(V2))
                                     ,modifiers(formElemList(Lpfs)))
                          ,modifiers(formElemList(Oc))
                          ,insMetas(formElemList(Ins)))
    //optTailCall ::= call
    rule instValToKItem(call Ocv:OptCallingConv Rat:RetAttrs Ty1:Type
                     V1:ValueRef (ParamList) Fat:FuncAttrs Ins:InstructionMetadatas)
           => instruction(call(operand(addNameToString(Ty1),addNameToString(V1))
                               ,toCallees(ParamList))
                          ,modifiers(combineElemList(combineElemList(formElemList(Ocv),formElemList(Rat))
                                                     ,formElemList(Fat)))
                          ,insMetas(formElemList(Ins)))
    //do the same above for OptTailCall ::= tail call
    rule instValToKItem(tail call Ocv:OptCallingConv Rat:RetAttrs Ty1:Type
                     V1:ValueRef (ParamList) Fat:FuncAttrs Ins:InstructionMetadatas)
           => instruction(tailCall(operand(addNameToString(Ty1),addNameToString(V1))
                                   ,toCallees(ParamList))
                          ,modifiers(combineElemList(combineElemList(formElemList(Ocv),formElemList(Rat))
                                                     ,formElemList(Fat)))
                          ,insMetas(formElemList(Ins)))

    rule instValToKItem(alloca Oil:OptInalloca All:AllocMetadata Ins:InstructionMetadatas)
           => instruction(dealWithAllocaElem(All),modifiers(formElemList(Oil)),insMetas(formElemList(Ins)))

    rule instValToKItem(load Oac:OptAtomic Ovl:OptVolatile Ty:Type V:ValueRef
                                 Oso:OptScopeOrder Ins:InstructionMetadatas)
           => instruction(load(addNameToString(Ty)
                               ,addNameToString(V))
                          ,modifiers(combineElemList(combineElemList(formElemList(Oac),formElemList(Ovl))
                                                     ,formElemList(Oso)))
                          ,insMetas(formElemList(Ins)))
    //do the same above for "load" OptAtomic OptVolatile ResolvedVal OptScopeOrder "," OptAlign InstructionMetadatas
    rule instValToKItem(load Oac:OptAtomic Ovl:OptVolatile Ty:Type V:ValueRef
                                Oso:OptScopeOrder,  Oal:Align Ins:InstructionMetadatas)
           => instruction(load(addNameToString(Ty)
                               ,addNameToString(V))
                          ,modifiers(combineElemList(combineElemList(combineElemList(formElemList(Oac)
                                                                                     ,formElemList(Ovl))
                                                                     ,formElemList(Oso))
                                                     ,formElemList(Oal)))
                          ,insMetas(formElemList(Ins)))
     
    //try to do the following:
/* 
"extractvalue" ResolvedVal ConstantIndexList InstructionMetadatas
*/
    rule instValToKItem(extractvalue Ty1:Type V1:ValueRef Cil:ConstantIndexList Ins:InstructionMetadatas)
           => instruction(extractValue(operand(addNameToString(Ty1)
                               ,addNameToString(V1))
                                       ,formElemList(Cil))
                          ,modifiers(.ElemList)
                          ,insMetas(formElemList(Ins)))

/*
"cmpxchg" OptVolatile ResolvedVal "," ResolvedVal "," ResolvedVal OptSingleThread OrderingList InstructionMetadatas
*/
    rule instValToKItem(cmpxchg Ovl:OptVolatile Ty1:Type V1:ValueRef,
                       Ty2:Type V2:ValueRef, Ty3:Type V3:ValueRef
                       Ost:OptSingleThread Oli:OrderingList Ins:InstructionMetadatas)
           => instruction(cmpxChg(operand(addNameToString(Ty1),addNameToString(V1))
                                  ,operand(addNameToString(Ty2),addNameToString(V2))
                                  ,operand(addNameToString(Ty3),addNameToString(V3)))
                          ,modifiers(combineElemList(combineElemList(formElemList(Ovl),formElemList(Ost))
                               ,formElemList(Oli)))
                          ,insMetas(formElemList(Ins)))
/*
‘atomicrmw‘ instruction is used to atomically modify memory.
"atomicrmw" OptVolatile BinOpsForAtomicrmw ResolvedVal "," ResolvedVal OptSingleThread Ordering InstructionMetadatas
*/
    rule instValToKItem(atomicrmw Ovl:OptVolatile Bof:BinOpsForAtomicrmw Ty1:Type V1:ValueRef,
                   Ty2:Type V2:ValueRef Ost:OptSingleThread Ord:Ordering Ins:InstructionMetadatas)
          => instruction(atomicRmw(Bof
                                   ,operand(addNameToString(Ty1),addNameToString(V1))
                                   ,operand(addNameToString(Ty2),addNameToString(V2)))
                         ,modifiers(combineElemList(combineElemList(formElemList(Ovl),formElemList(Ost))
                              ,formElemList(Ord)))
                         ,insMetas(formElemList(Ins)))
/*
"insertvalue" ResolvedVal "," ResolvedVal ConstantIndexList InstructionMetadatas
*/
   rule instValToKItem(insertvalue Ty1:Type V1:ValueRef, Ty2:Type V2:ValueRef
                                Cil:ConstantIndexList Ins:InstructionMetadatas)
          => instruction(insertValue(operand(addNameToString(Ty1),addNameToString(V1))
                                     ,operand(addNameToString(Ty2),addNameToString(V2))
                                     ,formElemList(Cil))
                         ,modifiers(.ElemList)
                         ,insMetas(formElemList(Ins)))

    //ensure the static single assignment property in a function.
    //and normalize the llvm operators to abstract syntax.

    syntax KItem ::= checkSingleAssignment(K, K, Set)
                   | checkSingleAssignmentInBlock(SymbolicValueRef, K, K, Set)

    //in the checkSingleAssignment and checkSingleAssignmentInBlock
    //to add addNameToString to every positioins where show Type and ValueRef
    //for example the third rule

    //form a basicBlock finally.
    rule checkSingleAssignmentInBlock(N:SymbolicValueRef, .K, K:K, S:Set)
         ~> checkSingleAssignment(K1:K, K2:K, S':Set)
         => checkSingleAssignment(K1, K2 ~> basicBlock(N,K), S S')

    //have dealt with all instruction list.
    rule checkSingleAssignmentInBlock(N:SymbolicValueRef, .InstructionList
                               BB:K, K:K, S:Set)
         => checkSingleAssignmentInBlock(N, BB, K, S)

    //deal with termination instructions.
    rule checkSingleAssignmentInBlock(N:SymbolicValueRef, ret Nt:NonVoidType
                                  Va:ValueRef Meta:InstructionMetadatas, K:K, S:Set)
         => checkSingleAssignmentInBlock(N, .K, K
                         ~> instruction(ret(addNameToString(Nt),addNameToString(Va))
                                        ,modifiers(.ElemList)
                                        ,insMetas(formElemList(Meta)))
                            , S)
    rule checkSingleAssignmentInBlock(N:SymbolicValueRef, ret Nt:VoidType
                                  Meta:InstructionMetadatas, K:K, S:Set)
         => checkSingleAssignmentInBlock(N, .K, K
                         ~> instruction(ret(addNameToString(Nt),emptyDef)
                                        ,modifiers(.ElemList)
                                        ,insMetas(formElemList(Meta)))
                            , S)
    rule checkSingleAssignmentInBlock(N:SymbolicValueRef, br label La:ValueRef
                                  Meta:InstructionMetadatas, K:K, S:Set)
         => checkSingleAssignmentInBlock(N, .K, K
                   ~> instruction(unconditional(addNameToString(La))
                                  ,modifiers(.ElemList)
                                  ,insMetas(formElemList(Meta)))
                      , S)
    rule checkSingleAssignmentInBlock(N:SymbolicValueRef, br It:IntType Va:ValueRef ,
                                       label La1:ValueRef , label La2:ValueRef
                                  Meta:InstructionMetadatas, K:K, S:Set)
         => checkSingleAssignmentInBlock(N, .K, K
             ~> instruction(conditional(operand(addNameToString(It),addNameToString(Va))
                                        ,addNameToString(La1)
                                        ,addNameToString(La2))
                            ,modifiers(.ElemList)
                            ,insMetas(formElemList(Meta)))
                , S)
    rule checkSingleAssignmentInBlock(N:SymbolicValueRef, resume Ty:Type Va:ValueRef
                                    Meta:InstructionMetadatas, K:K, S:Set)
         => checkSingleAssignmentInBlock(N, .K, K
             ~> instruction(resume(operand(addNameToString(Ty)
                                   ,addNameToString(Va)))
                            ,modifiers(.ElemList)
                            ,insMetas(formElemList(Meta)))
                , S)
    rule checkSingleAssignmentInBlock(N:SymbolicValueRef, indirectbr Ty:Type Va:ValueRef ,
                                       [ Las:LabelValues ]
                                  Meta:InstructionMetadatas, K:K, S:Set)
         => checkSingleAssignmentInBlock(N, .K, K
                ~> instruction(indirectbr(operand(addNameToString(Ty)
                                          ,addNameToString(Va))
                                          ,formElemList(Las))
                               ,modifiers(.ElemList)
                               ,insMetas(formElemList(Meta)))
                   , S)
    rule checkSingleAssignmentInBlock(N:SymbolicValueRef, switch It:IntType Va:ValueRef ,
                                       label La:ValueRef [ Ju:JumpTable ]
                                  Meta:InstructionMetadatas, K:K, S:Set)
         => checkSingleAssignmentInBlock(N, .K, K
                  ~> instruction(switch(addNameToString(It)
                                        ,addNameToString(Va)
                                        ,addNameToString(La)
                                        ,formCases(Ju))
                                 ,modifiers(.ElemList)
                                 ,insMetas(formElemList(Meta)))
                     , S)
    rule checkSingleAssignmentInBlock(N:SymbolicValueRef, unreachable
                                  Meta:InstructionMetadatas, K:K, S:Set)
         => checkSingleAssignmentInBlock(N, .K, K
                       ~> instruction(unreachable,modifiers(.ElemList),insMetas(formElemList(Meta))), S)

    rule <k>checkSingleAssignmentInBlock(N:SymbolicValueRef, invoke Opc:OptCallingConv Re:RetAttrs
                                       Ty:Type Va:ValueRef (Pa:ParamList) Fu:FuncAttrs
                                       to label La1:ValueRef unwind label La2:ValueRef 
                                  Meta:InstructionMetadatas, K:K, S:Set)
         => checkSingleAssignmentInBlock(N, .K, K 
                ~> assign(name("%"+String Int2String(I))
                          ,instruction(invoke(operand(addNameToString(Ty),addNameToString(Va))
                                              ,formElemList(Pa)
                                              ,addNameToString(La1)
                                              ,addNameToString(La2))
                                       ,modifiers(val(Opc),formElemList(doubleList(Re,Fu)))
                                       ,insMetas(formElemList(Meta))))
                   , S)
         ...</k>
        <currModule> ModName:SymbolicValueRef </currModule>
        <funModuleName> ModName </funModuleName>
        <currFunction> FunName:SymbolicValueRef </currFunction>
        <functionName> FunName </functionName>
        <localFunVarCounter> I:Int => I +Int 1 </localFunVarCounter>

    rule checkSingleAssignmentInBlock(N:SymbolicValueRef,Var:LocalVar
                                       = invoke Opc:OptCallingConv Re:RetAttrs
                                       Ty:Type Va:ValueRef (Pa:ParamList) Fu:FuncAttrs
                                       to La1:LabelValue unwind La2:LabelValue 
                                  Meta:InstructionMetadatas, K:K, S:Set)
         => checkSingleAssignmentInBlock(N, .K, K 
                ~> assign(name(#tokenToString(Var))
                          ,instruction(invoke(operand(addNameToString(Ty),addNameToString(Va))
                                              ,formElemList(Pa)
                                              ,La1
                                              ,La2)
                                       ,modifiers(val(Opc),formElemList(doubleList(Re,Fu)))
                                       ,insMetas(formElemList(Meta))))
                   , SetItem(Var) S)
          when notBool (Var in S)

    rule <k> checkSingleAssignmentInBlock(N:SymbolicValueRef,Var:LocalVar
                                       = invoke Opc:OptCallingConv Re:RetAttrs
                                       Ty:Type Va:ValueRef (Pa:ParamList) Fu:FuncAttrs
                                       to La1:LabelValue unwind La2:LabelValue 
                                  Meta:InstructionMetadatas, K:K, S:Set) ~> K':K
         => .K
         </k>
         <output>... .List => ListItem(" multiple definition of local value named '"
                   +String substrString(#tokenToString(Var),1
               ,lengthString(#tokenToString(Var))) +String "'") </output>
          when Var in S

    rule <k>checkSingleAssignmentInBlock(N:SymbolicValueRef,Var:LocalValID
                                       = invoke Opc:OptCallingConv Re:RetAttrs
                                       Ty:Type Va:ValueRef (Pa:ParamList) Fu:FuncAttrs
                                       to La1:LabelValue unwind La2:LabelValue 
                                  Meta:InstructionMetadatas, K:K, S:Set)
         => checkSingleAssignmentInBlock(N, .K, K 
                ~> assign(name(#tokenToString(Var))
                          ,instruction(invoke(operand(addNameToString(Ty),addNameToString(Va))
                                              ,formElemList(Pa)
                                              ,La1
                                              ,La2)
                                       ,modifiers(val(Opc),formElemList(doubleList(Re,Fu)))
                                       ,insMetas(formElemList(Meta))))
                   , S)
         ...</k>
         <currModule> ModName:SymbolicValueRef </currModule>
         <funModuleName> ModName </funModuleName>
         <currFunction> FunName:SymbolicValueRef </currFunction>
         <functionName> FunName </functionName>
         <localFunVarCounter> I:Int => I +Int 1 </localFunVarCounter>
          when String2Int(substrString(#tokenToString(Var),1
               ,lengthString(#tokenToString(Var)))) ==Int I

    rule <k>checkSingleAssignmentInBlock(N:SymbolicValueRef,Var:LocalValID
                                       = invoke Opc:OptCallingConv Re:RetAttrs
                                       Ty:Type Va:ValueRef (Pa:ParamList) Fu:FuncAttrs
                                       to La1:LabelValue unwind La2:LabelValue 
                                  Meta:InstructionMetadatas, K:K, S:Set) ~> K':K
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
                               BB:BBTerminatorInstruction, K:K, S:Set)
         => checkSingleAssignmentInBlock(N, Ins BB, K
                      ~> assign(name("%" +String Int2String(I)),instValToKItem(In)), S)
         ...</k>
         <currModule> ModName:SymbolicValueRef </currModule>
         <funModuleName> ModName </funModuleName>
         <currFunction> FunName:SymbolicValueRef </currFunction>
         <functionName> FunName </functionName>
         <localFunVarCounter> I:Int => I +Int 1 </localFunVarCounter>

    rule <k>checkSingleAssignmentInBlock(N:SymbolicValueRef, Var:LocalVar = In:InstVal
               Ins:InstructionList BB:BBTerminatorInstruction, K:K, S:Set)
         => checkSingleAssignmentInBlock(N, Ins BB, K
                      ~> assign(name(#tokenToString(Var)),instValToKItem(In)), SetItem(Var) S)
         ...</k>
         when notBool (Var in S)

    rule <k> checkSingleAssignmentInBlock(N:SymbolicValueRef, Var:LocalVar = In:InstVal
               Ins:InstructionList BB:BBTerminatorInstruction, K:K, S:Set) ~> K':K
         => .K </k>
         <output>... .List => ListItem(" multiple definition of local value named '"
                   +String substrString(#tokenToString(Var),1
               ,lengthString(#tokenToString(Var))) +String "'") </output>
         when (Var in S)

    rule <k>checkSingleAssignmentInBlock(N:SymbolicValueRef, Var:LocalValID = In:InstVal
               Ins:InstructionList BB:BBTerminatorInstruction, K:K, S:Set)
         => checkSingleAssignmentInBlock(N, Ins BB, K
                      ~> assign(name(#tokenToString(Var)),instValToKItem(In)), SetItem(Var) S)
         ...</k>
         <currModule> ModName:SymbolicValueRef </currModule>
         <funModuleName> ModName </funModuleName>
         <currFunction> FunName:SymbolicValueRef </currFunction>
         <functionName> FunName </functionName>
         <localFunVarCounter> I:Int => I +Int 1 </localFunVarCounter>
         when notBool (Var in S) andBool String2Int(substrString(#tokenToString(Var),1
               ,lengthString(#tokenToString(Var)))) ==Int I

    rule <k>checkSingleAssignmentInBlock(N:SymbolicValueRef, Var:LocalValID = In:InstVal
               Ins:InstructionList BB:BBTerminatorInstruction, K:K, S:Set) ~> K':K
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

    rule checkSingleAssignmentInBlock(N:SymbolicValueRef, store Oac:OptAtomic Ovl:OptVolatile
                  Ty1:Type V1:ValueRef, Ty2:Type V2:ValueRef Osc:OptScopeOrder, Al:Align
                    Inm:InstructionMetadatas Ins:InstructionList BB:BBTerminatorInstruction, K:K, S:Set)
         => checkSingleAssignmentInBlock(N, Ins BB, K
                      ~> instruction(store(addNameToString(Ty1)
                                           ,addNameToString(V1)
                                           ,operand(addNameToString(Ty2),addNameToString(V2)))
                                     ,modifiers(combineElemList(combineElemList(combineElemList(formElemList(
                                          Oac),formElemList(Ovl)),formElemList(Osc)),formElemList(Al)))
                                     ,Inm)
                         , S)
/*
do the same for another store operation:
"store" OptAtomic OptVolatile ResolvedVal "," ResolvedVal OptScopeOrder InstructionMetadatas
*/
    rule checkSingleAssignmentInBlock(N:SymbolicValueRef
                                      , store Oac:OptAtomic Ovl:OptVolatile Ty1:Type V1:ValueRef ,
                                            Ty2:Type V2:ValueRef Osc:OptScopeOrder 
                                            Ins:InstructionMetadatas Ili:InstructionList
                                            BB:BBTerminatorInstruction
                                      , K:K
                                      , S:Set)
          => checkSingleAssignmentInBlock(N, Ili BB, K
                       ~> instruction(store(addNameToString(Ty1)
                                           ,addNameToString(V1)
                                           ,operand(addNameToString(Ty2),addNameToString(V2)))
                                      ,modifiers(combineElemList(combineElemList(formElemList(Oac),
                                            formElemList(Ovl)),formElemList(Osc)))
                                      ,Ins)
             , S)
/*
create an abstract for fence and do the same for fence operation.
"fence" OptSingleThread Ordering InstructionMetadatas
*/
    rule checkSingleAssignmentInBlock(N:SymbolicValueRef
                                      , fence Ost:OptSingleThread Ord:Ordering 
                                            Ins:InstructionMetadatas Ili:InstructionList
                                            BB:BBTerminatorInstruction
                                      , K:K
                                      , S:Set)
          => checkSingleAssignmentInBlock(N, Ili BB, K
                       ~> instruction(fence(ord)
                                      , modifiers(formElemList(Ost))
                                      , Ins)
                          , S)
    //define checkSingleAssignment
    rule checkSingleAssignment(.K, K:K, S:Set) => funBegin(K)
    rule checkSingleAssignment(L:LabelStringConstant Ins:InstructionList
                                BB:BBTerminatorInstruction BBL:BasicBlockList, K:K, S:Set)
         => checkSingleAssignmentInBlock(makeVarFromLabel(L),Ins BB, .K, S)
           ~> checkSingleAssignment(BBL, K, S:Set)
    rule checkSingleAssignment(L:LabelStringConstant Ins:InstructionList
                                BB:BBTerminatorInstruction, K:K, S:Set)
         => checkSingleAssignmentInBlock(makeVarFromLabel(L),Ins BB, .K, S) ~>
            checkSingleAssignment(.K, K, S)

    rule <k>checkSingleAssignment(Ins:InstructionList
                                BB:BBTerminatorInstruction BBL:BasicBlockList, K:K, S:Set)
         => checkSingleAssignmentInBlock(name("%" +String Int2String(I)), Ins BB, .K, S)
           ~> checkSingleAssignment(BBL, K, S)
         ...</k>
        <currModule> ModName:SymbolicValueRef </currModule>
        <funModuleName> ModName </funModuleName>
        <currFunction> FunName:SymbolicValueRef </currFunction>
        <functionName> FunName </functionName>
        <localFunVarCounter> I:Int => I +Int 1 </localFunVarCounter>

    rule <k> checkSingleAssignment(Ins:InstructionList
                                BB:BBTerminatorInstruction, K:K, S:Set)
         => checkSingleAssignmentInBlock(name("%" +String Int2String(I)), Ins BB, .K, S)
           ~> checkSingleAssignment(.K , K, S)
         ...</k>
        <currModule> ModName:SymbolicValueRef </currModule>
        <funModuleName> ModName </funModuleName>
        <currFunction> FunName:SymbolicValueRef </currFunction>
        <functionName> FunName </functionName>
        <localFunVarCounter> I:Int => I +Int 1 </localFunVarCounter>

endmodule
