; ModuleID = '/home/david/src/c-semantics/tests/unitTests/testWhile.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %i = alloca i32, align 4
  %x = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 5, i32* %i, align 4
  store i32 0, i32* %x, align 4
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %0 = load i32* %i, align 4
  %cmp = icmp sgt i32 %0, 0
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %1 = load i32* %i, align 4
  %dec = add nsw i32 %1, -1
  store i32 %dec, i32* %i, align 4
  %2 = load i32* %x, align 4
  %inc = add nsw i32 %2, 1
  store i32 %inc, i32* %x, align 4
  br label %while.cond

while.end:                                        ; preds = %while.cond
  br label %while.cond1

while.cond1:                                      ; preds = %while.body2, %while.end
  br i1 false, label %while.body2, label %while.end4

while.body2:                                      ; preds = %while.cond1
  %3 = load i32* %x, align 4
  %inc3 = add nsw i32 %3, 1
  store i32 %inc3, i32* %x, align 4
  br label %while.cond1

while.end4:                                       ; preds = %while.cond1
  %4 = load i32* %x, align 4
  ret i32 %4
}
