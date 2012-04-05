module LLVM-SYNTAX is
    including K

    syntax KResult ::= LLVMValue
    syntax KResult ::= listK "(" List{K} ")"  [latex "{#1}"]

    //@ Modules
    syntax LLVM ::= `Module "(" K "," K "," K "," K "," K "," K "," K ")"
    // ModuleID, TargetLayout, TargetTriple, Typedefs, GlobalVariables, Aliases, Functions
    // TODO: syntax LLVM ::= Module(K, K, K, K, K)

    syntax LLVM ::= `ModuleID "(" #String ")"
    syntax LLVM ::= `TargetLayout "(" #String ")"
    syntax LLVM ::= `TargetTriple "(" #String ")"
    syntax LLVM ::= `Typedefs "(" List{K} ")"
    syntax LLVM ::= `GlobalVariables "(" List{K} ")"
    syntax LLVM ::= `Functions "(" List{K} ")"
    syntax LLVM ::= `Instructions "(" List{K} ")"

    syntax LLVM ::= `Typedef "(" K "," K ")" // name, type TODO: modifiers
    syntax LLVM ::= `GlobalVariable "(" K "," K "," K "," K ")" [strict(3)]// Value/Name, Modifiers, Type, Initializer
    syntax LLVM ::= `Initializer "(" K "," K ")" // type, value

    syntax LLVM ::= `Alias "(" K "," K ")"

    //@ Types
    syntax LLVM ::= `Types "(" List{K} ")"
    context Types((_:List{K},,HOLE,,_:List{K}))
    syntax LLVM ::= `NamedType "(" K ")"
    syntax LLVMValue ::= `PointerType "(" K ")" [latex "{#1}*"]
    syntax LLVM ::= `ArrayType "(" K "," K ")" [strict hybrid latex "\lbrack
{#2} \times {#1}\rbrack"] // inner type, length
    syntax LLVM ::= `StructType "(" K ")" [strict hybrid latex "\{{#1}\}"]
    syntax LLVM ::= `FunctionType "(" K "," K ")" [strict hybrid] // return type, argument types
    syntax LLVMValue ::= `VarargType
    syntax LLVMValue ::= `IntegerType "(" K ")"
    syntax LLVM ::= `Width "(" #Nat ")"
    syntax LLVM ::= `LabelType
    syntax LLVMValue ::= `VoidType
    syntax LLVMValue ::= `FloatType
    syntax LLVMValue ::= `DoubleType
    syntax LLVM ::= `X86FP80Type
    syntax LLVM ::= `FP128Type
    syntax LLVM ::= `PPCFP128Type
    syntax LLVM ::= `X86MMXType

    syntax LLVM ::= `Fields "(" List{K} ")"
    context Fields((_:List{K},,HOLE,,_:List{K}))

    //@ Functions and function declarations
    syntax LLVM ::= `FunctionDef "(" K "," K "," K "," K ")"  [strict(1)] // RetType, Value/Name, Arguments, Body
    syntax LLVM ::= `FunctionDecl "(" K "," K "," K ")"  [strict(1)] // RetType, Value/Name, Arguments
    syntax LLVM ::= `Arg "(" K "," K "," K ")" // Modifiers, Type, Value/Name
    syntax LLVM ::= `NoName // used for arguments with no name
    syntax LLVM ::= `Vararg

    //@ Argument modifiers
    syntax LLVM ::= `ByVal
    syntax LLVM ::= `Nest
    syntax LLVM ::= `SRet
    syntax LLVM ::= `NoAlias
    syntax LLVM ::= `NoCapture

    syntax LLVM ::= `ReturnType "(" K ")"
    syntax LLVM ::= `Arguments "(" List{K} ")"
    context Arguments((_:List{K},,HOLE,,_:List{K}))
    syntax LLVM ::= `Body "(" List{K} ")"

    syntax LLVM ::= `BasicBlock "(" K "," K ")" // Name, Instructions
    syntax LLVM ::= `Assign "(" K "," K ")" [strict(2)] // Name, Instruction
    syntax LLVM ::= `Instruction "(" K "," K ")" // Modifiers, the Instruction
    syntax LLVM ::= `ConstantExpr "(" K "," K ")" // Modifiers, the operator

    syntax LLVM ::= `Opaque

    //@ Modifiers
    syntax LLVM ::= `Modifiers "(" List{K} ")"
    syntax LLVM ::= `Alignment "(" #Nat ")"
    syntax LLVM ::= `Constant
    syntax LLVM ::= `NoSignedWrap
    syntax LLVM ::= `NoUnsignedWrap
    syntax LLVM ::= `Packed

    //@ Identifiers, values, and constants
    syntax Id ::= `Name "(" #String ")"
    syntax LLVM ::= Id
    syntax LLVM ::= `Value "(" K ")"
    syntax LLVM ::= `Operand "(" K "," K ")" [strict] // Type, Value
    syntax LLVM ::= `ConstantString "(" #String ")"
    syntax LLVM ::= `ConstantArray "(" K "," K ")" [strict] // element type, arguments
    syntax LLVM ::= `ConstantStruct "(" K "," K ")" [strict(2)] // modifiers, arguments
    define 'isKResult(ConstantStruct(_, K)) => true
        when 'isKResult(K:K)
    syntax LLVM ::= `Null
    syntax LLVM ::= `Undef
    syntax LLVM ::= `NaN
    syntax LLVM ::= `PositiveZero
    syntax LLVM ::= `NegativeZero
    syntax LLVM ::= `PositiveInfinity
    syntax LLVM ::= `NegativeInfinity
    syntax LLVMValue ::= `VoidValue // for returning from void functions
    syntax LLVMValue ::= `Zeroinitializer

    //@ Memory instructions
    syntax LLVM ::= `Alloca "(" K "," K ")" [strict] // Type, NumElements
    syntax LLVM ::= `Load "(" K "," K ")" [strict]
    syntax LLVM ::= `Store "(" K "," K  "," K ")" [strict]  // Type, Value, Destination
    syntax LLVM ::= `GetElementPtr "(" K "," K "," List{K} ")" [strict(1 2)]
    context GetElementPtr(_, _, (_,,HOLE,,_))

    //@ Branching/Conditional instructions
    syntax LLVM ::= `Br "(" K ")"
    syntax LLVM ::= `Unconditional "(" K ")"
    syntax LLVM ::= `Conditional "(" K "," K "," K ")" [strict(1)]
    syntax LLVM ::= `Switch "(" K "," K "," K "," K ")" [strict(1 2 4)] // type, condition, default dest, list of cases
    syntax LLVM ::= `Case "(" K "," K ")" [strict(1)] // value, successor
    define 'isKResult(Case(K:K, _)) => true
        when 'isKResult(K:K)
    syntax LLVM ::= `Select "(" K "," K "," K "," K ")" [strict(1 2)] // condition, true val, false val

    //@ Comparison operations
    syntax LLVM ::= `ICmp "(" K "," K "," K "," K ")" // Predicate, Type, Left op, Right op
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
    syntax LLVM ::= `Edge "(" K "," K ")" // used by PHI

    syntax LLVM ::= `Call "(" K "," K ")" [strict(2)] // Type, Callee
    syntax LLVM ::= `Callee "(" K "," K ")" [strict hybrid] // Value/Name, Arguments

    syntax LLVM ::= `VAArg "(" K "," K ")" [strict] // result type, va_list

end module
