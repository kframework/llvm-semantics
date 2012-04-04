; ModuleID = '/home/david/src/c-semantics/tests/unitTests/testBasicBreak.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %i = alloca i32, align 4
  %retval1 = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 5, i32* %i, align 4
  store i32 0, i32* %retval1, align 4
  br label %while.cond

while.cond:                                       ; preds = %entry
  %0 = load i32* %i, align 4
  %cmp = icmp sgt i32 %0, 0
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %1 = load i32* %retval1, align 4
  %inc = add nsw i32 %1, 1
  store i32 %inc, i32* %retval1, align 4
  br label %while.end

while.end:                                        ; preds = %while.body, %while.cond
  %2 = load i32* %retval1, align 4
  ret i32 %2
}
