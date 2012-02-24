module LLVM-SYNTAX is
    including K


    syntax LLVM ::= "Module" "(" K "," K "," K "," K "," K ")" // ModuleID, TargetLayout, TargetTriple, GlobalVariables, Functions
    // TODO: syntax LLVM ::= Module(K, K, K, K, K)

    syntax LLVM ::= `ModuleID "(" #String ")"
    syntax LLVM ::= `TargetLayout "(" #String ")"
    syntax LLVM ::= `TargetTriple "(" #String ")"
    syntax LLVM ::= `GlobalVariables "(" List{K} ")"
    syntax LLVM ::= `Functions "(" List{K} ")"

    syntax LLVM ::= `GlobalVariable "(" K "," K "," K "," K ")" // Value/Name, Modifiers, Type, Initializer

    syntax LLVM ::= `Modifiers "(" List{K} ")"
    syntax LLVM ::= `Initializer "(" K ")"

    syntax LLVM ::= `Constant

    syntax LLVM ::= `Type "(" K ")"

    syntax LLVM ::= `PointerType "(" K ")"
    syntax LLVM ::= `ArrayType "(" K ")"
    syntax LLVM ::= `IntegerType "(" K ")"

    syntax LLVM ::= `Function "(" K "," K "," K "," K ")" // RetType, Value/Name, Arguments, Body
    syntax LLVM ::= `Arg "(" K "," K ")" // Type, Value/Name

    syntax LLVM ::= `RetType "(" K ")"
    syntax LLVM ::= `Arguments "(" List{K} ")"
    syntax LLVM ::= `Body "(" List{K} ")"

    syntax LLVM ::= `BasicBlock "(" K "," K ")" // Name, Instructions
    syntax LLVM ::= `Instructions "(" List{K} ")"

    syntax LLVM ::= `Assign "(" K "," K ")" [strict(2)] // Name, Instruction
    syntax LLVM ::= `Instruction "(" K "," K ")" // Modifiers, the Instruction
    syntax LLVM ::= `Modifiers "(" List{K} ")"

    syntax LLVM ::= `Alloca "(" K "," K ")" [strict(2)] // Type, NumElements
    syntax LLVM ::= `Call "(" K "," K ")"   // Type, Callee
    syntax LLVM ::= `Callee "(" K "," K ")"   // Value/Name, Arguments

    syntax LLVM ::= `Load "(" K ")"
    syntax LLVM ::= `Store "(" K "," K  "," K ")" [strict(2 3)]  // Type, Value, Destination

    syntax LLVM ::= `Add "(" K "," K "," K ")" // Type, LHS, RHS

    syntax LLVM ::= `ConstantExpr "(" K "," K "," K "," K ")"
    syntax LLVM ::= `Opcode "(" K ")"

    syntax LLVM ::= `Ret "(" K ")" [strict]

    syntax LLVM ::= `Alignment "(" #Nat ")"

    syntax LLVM ::= `ConstantString "(" #String ")"

    syntax Id ::= `Name "(" #String ")"
    syntax LLVM ::= Id
    syntax LLVM ::= `Value "(" K ")"
    syntax LLVM ::= `Operand "(" K "," K ")" // Type, Value
    syntax LLVM ::= `Width "(" #Nat ")"

    syntax LLVM ::= `Vararg

    syntax LLVM ::= `NoSignedWrap
    syntax LLVM ::= `NoUnsignedWrap

end module
