module LLVM-SYNTAX is
	including K
	
	
	syntax LLVM ::= `Module "(" K "," K "," K "," K "," K ")" // ModuleID, TargetLayout, TargetTriple, GlobalVariables, Functions
	
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
	
	syntax LLVM ::= `RetType "(" K ")"
	syntax LLVM ::= `Arguments "(" List{K} ")"
	syntax LLVM ::= `Body "(" List{K} ")"
	
	syntax LLVM ::= `BasicBlock "(" K "," K ")" // Name, Instructions
	syntax LLVM ::= `Instructions "(" List{K} ")"
	
	syntax LLVM ::= `Alloca "(" K "," K "," K ")"
	syntax LLVM ::= `Store "(" K  "," K ")"
	syntax LLVM ::= `Call "(" K "," K "," K ")"
	syntax LLVM ::= `Callee "(" K ")"
	
	syntax LLVM ::= `ConstantExpr "(" K "," K "," K "," K ")"
	syntax LLVM ::= `Opcode "(" K ")"
	
	syntax LLVM ::= `Ret "(" K ")"
	
	syntax LLVM ::= `Alignment "(" #Nat ")"
	
	syntax LLVM ::= `ConstantString "(" #String ")"
	
	syntax LLVM ::= `Name "(" #String ")"
	syntax LLVM ::= `Value "(" K ")"
	syntax LLVM ::= `Operand "(" K "," K ")" // Type, Value
	syntax LLVM ::= `Width "(" #Nat ")"
	
	syntax LLVM ::= `Arg "(" K ")"
	syntax LLVM ::= `Vararg

end module
