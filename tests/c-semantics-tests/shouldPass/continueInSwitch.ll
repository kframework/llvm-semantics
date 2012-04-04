; ModuleID = '/home/david/src/c-semantics/tests/shouldPass/continueInSwitch.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %i = alloca i32, align 4
  %n = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 0, i32* %n, align 4
  store i32 1, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32* %i, align 4
  %cmp = icmp sle i32 %0, 1
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %1 = load i32* %i, align 4
  switch i32 %1, label %sw.default [
  ]

sw.default:                                       ; preds = %for.body
  %2 = load i32* %n, align 4
  %inc = add nsw i32 %2, 1
  store i32 %inc, i32* %n, align 4
  br label %for.inc

for.inc:                                          ; preds = %sw.default
  %3 = load i32* %i, align 4
  %inc1 = add nsw i32 %3, 1
  store i32 %inc1, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %4 = load i32* %retval
  ret i32 %4
}
