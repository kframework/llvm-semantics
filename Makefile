
all: runKompile runJavac

runKompile: semantics/llvm-syntax.k semantics/llvm-syntax-kompiled
	kompile semantics/llvm-syntax.k --backend java

runJavac: DeleteLLVMComments.java DeleteLLVMComments.class
	javac -g DeleteLLVMComments.java
