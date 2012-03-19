module LLVM-SYNTAX is
    including K

    syntax KResult ::= LLVMValue
    syntax KResult ::= listK "(" List{K} ")"

    // ModuleID, TargetLayout, TargetTriple, Typedefs, GlobalVariables, Functions
    syntax LLVM ::= "Module" "(" K "," K "," K "," K "," K "," K ")"
    // TODO: syntax LLVM ::= Module(K, K, K, K, K)

    syntax LLVM ::= `ModuleID "(" #String ")"
    syntax LLVM ::= `TargetLayout "(" #String ")"
    syntax LLVM ::= `TargetTriple "(" #String ")"
    syntax LLVM ::= `Typedefs "(" List{K} ")"
    syntax LLVM ::= `GlobalVariables "(" List{K} ")"
    syntax LLVM ::= `Functions "(" List{K} ")"

    syntax LLVM ::= `Typedef "(" K "," K ")"
    syntax LLVM ::= `GlobalVariable "(" K "," K "," K "," List{K} ")" // Value/Name, Modifiers, Type, Initializer
    // TODO maybe some or none type instead of using list

    syntax LLVM ::= `Modifiers "(" List{K} ")"
    syntax LLVM ::= `Initializer "(" K "," K ")"

    syntax LLVM ::= `Constant

    syntax LLVM ::= `Type "(" K ")"         [strict hybrid]
    syntax LLVM ::= `NamedType "(" K ")"
    syntax LLVM ::= `PointerType "(" K ")"  [strict hybrid]
    syntax LLVM ::= `ArrayType "(" K "," K ")" [strict hybrid] // inner type, length
    syntax LLVM ::= `StructType "(" K ")" [strict hybrid]
    syntax LLVM ::= `FunctionType "(" K "," K ")" [strict hybrid] // return type, argument types
    syntax LLVMValue ::= `VarargType
    syntax LLVMValue ::= `IntegerType "(" K ")"
    syntax LLVM ::= `LabelType
    syntax LLVMValue ::= `VoidType
    
    
    syntax LLVM ::= `ConstantArray "(" K "," K ")" // element type, arguments
    
    syntax LLVM ::= `Switch "(" K "," K "," K "," K ")" [strict(1 2 4)] // type, condition, default dest, list of cases
    syntax LLVM ::= `Case "(" K "," K ")" [strict(1)] // value, successor
    define isKResult(Case(K:K, _)) => true
        when isKResult(K:K)
    
    
    syntax LLVM ::= `Types "(" List{K} ")"
    context Types((_:List{K},,HOLE,,_:List{K}))

    syntax LLVM ::= `Fields "(" List{K} ")"
    context Fields((_:List{K},,HOLE,,_:List{K}))

    syntax LLVM ::= `FunctionDef "(" K "," K "," K "," K ")"  [strict(1)] // RetType, Value/Name, Arguments, Body
    syntax LLVM ::= `FunctionDecl "(" K "," K "," K ")"  [strict(1)] // RetType, Value/Name, Arguments
    syntax LLVM ::= `Arg "(" K "," K ")" // Type, Value/Name
    syntax LLVM ::= `NoName // used for arguments with no name

    syntax LLVM ::= `ReturnType "(" K ")"
    syntax LLVM ::= `Arguments "(" List{K} ")"
    context Arguments((_:List{K},,HOLE,,_:List{K}))
    syntax LLVM ::= `Body "(" List{K} ")"

    syntax LLVM ::= `BasicBlock "(" K "," K ")" // Name, Instructions
    syntax LLVM ::= `Instructions "(" List{K} ")"

    // context Br(Conditional(HOLE, _, _))

    syntax LLVM ::= `Assign "(" K "," K ")" [strict(2)] // Name, Instruction
    syntax LLVM ::= `Instruction "(" K "," K ")" // Modifiers, the Instruction
    syntax LLVM ::= `ConstantExpr "(" K "," K ")" // Modifiers, the operator
    syntax LLVM ::= `Modifiers "(" List{K} ")"

    syntax LLVM ::= `Alloca "(" K "," K ")" [strict] // Type, NumElements
    syntax LLVM ::= `Callee "(" K "," K ")" [strict(2)] // Value/Name, Arguments
    
    // TODO should probably be both arguments (hybrid) for handling function pointers
    define isKResult(Callee(_, K:K)) => true
        when isKResult(K:K)

    syntax LLVM ::= `Load "(" K "," K ")" [strict(2)]
    syntax LLVM ::= `Store "(" K "," K  "," K ")" [strict(2 3)]  // Type, Value, Destination
    syntax LLVM ::= `GetElementPtr "(" K "," K "," List{K} ")" [strict(1 2)]

    context GetElementPtr(_, _, (_,,HOLE,,_))

    syntax LLVM ::= `ConstantExpr "(" K "," K "," K "," K ")"
    syntax LLVM ::= `Opcode "(" K ")"

    syntax LLVM ::= `Unconditional "(" K ")"
    syntax LLVM ::= `Conditional "(" K "," K "," K ")" [strict(1)]

    syntax LLVM ::= `Alignment "(" #Nat ")"

    syntax LLVM ::= `ConstantString "(" #String ")"

    syntax Id ::= `Name "(" #String ")"
    syntax LLVM ::= Id
    syntax LLVM ::= `Value "(" K ")"
    syntax LLVM ::= `Operand "(" K "," K ")" // Type, Value
    syntax LLVM ::= `Width "(" #Nat ")"
    syntax LLVM ::= `Null
    syntax LLVMValue ::= `VoidValue // for returning from void functions
    syntax LLVM ::= `Zeroinitializer
    
    syntax LLVM ::= `Vararg

    syntax LLVM ::= `NoSignedWrap
    syntax LLVM ::= `NoUnsignedWrap

    syntax LLVM ::= `Edge "(" K "," K ")" // used by PHI
    
    syntax LLVM ::= `Predicate "(" K ")"

    syntax LLVM ::= `INotEq "(" K "," K "," K ")" [strict] // type, left op, right op
    syntax LLVM ::= `IEq "(" K "," K "," K ")" [strict]
    syntax LLVM ::= `UGT "(" K "," K "," K ")" [strict]
    syntax LLVM ::= `UGE "(" K "," K "," K ")" [strict]
    syntax LLVM ::= `ULT "(" K "," K "," K ")" [strict]
    syntax LLVM ::= `ULE "(" K "," K "," K ")" [strict]
    syntax LLVM ::= `SGT "(" K "," K "," K ")" [strict]
    syntax LLVM ::= `SGE "(" K "," K "," K ")" [strict]
    syntax LLVM ::= `SLT "(" K "," K "," K ")" [strict]
    syntax LLVM ::= `SLE "(" K "," K "," K ")" [strict]
    
    //@ Terminator Instructions
    syntax LLVM ::= `Ret "(" K ")" [strict]
    syntax LLVM ::= `Br "(" K ")"
    syntax LLVM ::= `Unreachable
    
    //@ Binary Operations
    syntax LLVM ::= `Add "(" K "," K "," K ")" [strict(2 3)] // Type, Left op, Right op
    syntax LLVM ::= `Sub "(" K "," K "," K ")" [strict(2 3)] // Type, Left op, Right op
    syntax LLVM ::= `Mul "(" K "," K "," K ")" [strict(2 3)] // Type, Left op, Right op
    syntax LLVM ::= `UDiv "(" K "," K "," K ")" [strict(2 3)] // Type, Left op, Right op
    syntax LLVM ::= `SDiv "(" K "," K "," K ")" [strict(2 3)] // Type, Left op, Right op
    syntax LLVM ::= `URem "(" K "," K "," K ")" [strict(2 3)] // Type, Left op, Right op
    syntax LLVM ::= `SRem "(" K "," K "," K ")" [strict(2 3)] // Type, Left op, Right op
    
    //@ Bitwise Binary Operations
    syntax LLVM ::= `Shl "(" K "," K "," K ")" [strict(2 3)] // Type, Left op, Right op
    syntax LLVM ::= `LShr "(" K "," K "," K ")" [strict(2 3)] // Type, Left op, Right op
    syntax LLVM ::= `AShr "(" K "," K "," K ")" [strict(2 3)] // Type, Left op, Right op
    syntax LLVM ::= `Or "(" K "," K "," K ")" [strict(2 3)] // Type, Left op, Right op
    syntax LLVM ::= `And "(" K "," K "," K ")" [strict(2 3)] // Type, Left op, Right op
    syntax LLVM ::= `Xor "(" K "," K "," K ")" [strict(2 3)] // Type, Left op, Right op

    //@ Conversion Operations
    syntax LLVM ::= `Trunc "(" K "," K ")" [strict] // type, op
    syntax LLVM ::= `SExt "(" K "," K ")" [strict] // type, op
    syntax LLVM ::= `ZExt "(" K "," K ")" [strict] // type, op
    syntax LLVM ::= `BitCast "(" K "," K ")" [strict] // type, op
    syntax LLVM ::= `IntToPtr "(" K "," K ")" [strict] // type, op
    syntax LLVM ::= `PtrToInt "(" K "," K ")" [strict] // type, op
    
    //@ Other Operations
    syntax LLVM ::= `PHI "(" K "," List{K} ")" // type, edge list
    syntax LLVM ::= `ICmp "(" K "," K "," K "," K ")" // Kind, Type, Left op, Right op  
    syntax LLVM ::= `Call "(" K "," K ")" [strict(2)] // Type, Callee
    syntax LLVM ::= `Select "(" K "," K "," K ")" [strict(1)] // condition, true val, false val

end module
