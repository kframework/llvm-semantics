; ModuleID = '/home/david/src/c-semantics/tests/unitTests/compoundLiteral.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %p = alloca i32*, align 8
  %.compoundliteral = alloca [2 x i32], align 4
  store i32 0, i32* %retval
  %arrayinit.begin = getelementptr inbounds [2 x i32]* %.compoundliteral, i64 0, i64 0
  store i32 2, i32* %arrayinit.begin
  %arrayinit.element = getelementptr inbounds i32* %arrayinit.begin, i64 1
  store i32 4, i32* %arrayinit.element
  %arraydecay = getelementptr inbounds [2 x i32]* %.compoundliteral, i32 0, i32 0
  store i32* %arraydecay, i32** %p, align 8
  %0 = load i32** %p, align 8
  %1 = load i32* %0, align 4
  ret i32 %1
}
