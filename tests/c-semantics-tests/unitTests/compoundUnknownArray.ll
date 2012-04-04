; ModuleID = '/home/david/src/c-semantics/tests/unitTests/compoundUnknownArray.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %.compoundliteral = alloca [5 x i32], align 4
  store i32 0, i32* %retval
  %arrayinit.begin = getelementptr inbounds [5 x i32]* %.compoundliteral, i64 0, i64 0
  store i32 1, i32* %arrayinit.begin
  %arrayinit.element = getelementptr inbounds i32* %arrayinit.begin, i64 1
  store i32 2, i32* %arrayinit.element
  %arrayinit.element1 = getelementptr inbounds i32* %arrayinit.element, i64 1
  store i32 3, i32* %arrayinit.element1
  %arrayinit.element2 = getelementptr inbounds i32* %arrayinit.element1, i64 1
  store i32 4, i32* %arrayinit.element2
  %arrayinit.element3 = getelementptr inbounds i32* %arrayinit.element2, i64 1
  store i32 5, i32* %arrayinit.element3
  %arrayidx = getelementptr inbounds [5 x i32]* %.compoundliteral, i32 0, i64 4
  %0 = load i32* %arrayidx, align 4
  ret i32 %0
}
