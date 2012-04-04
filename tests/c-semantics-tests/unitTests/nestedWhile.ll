; ModuleID = '/home/david/src/c-semantics/tests/unitTests/nestedWhile.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %x = alloca i32, align 4
  %retval1 = alloca i32, align 4
  %y = alloca i32, align 4
  %x6 = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 5, i32* %x, align 4
  store i32 0, i32* %retval1, align 4
  br label %while.cond

while.cond:                                       ; preds = %while.end, %entry
  %0 = load i32* %x, align 4
  %cmp = icmp sgt i32 %0, 0
  br i1 %cmp, label %while.body, label %while.end7

while.body:                                       ; preds = %while.cond
  store i32 3, i32* %y, align 4
  br label %while.cond2

while.cond2:                                      ; preds = %while.body4, %while.body
  %1 = load i32* %y, align 4
  %cmp3 = icmp sgt i32 %1, 0
  br i1 %cmp3, label %while.body4, label %while.end

while.body4:                                      ; preds = %while.cond2
  %2 = load i32* %retval1, align 4
  %inc = add nsw i32 %2, 1
  store i32 %inc, i32* %retval1, align 4
  %3 = load i32* %y, align 4
  %dec = add nsw i32 %3, -1
  store i32 %dec, i32* %y, align 4
  br label %while.cond2

while.end:                                        ; preds = %while.cond2
  %4 = load i32* %x, align 4
  %dec5 = add nsw i32 %4, -1
  store i32 %dec5, i32* %x, align 4
  store i32 0, i32* %x6, align 4
  br label %while.cond

while.end7:                                       ; preds = %while.cond
  %5 = load i32* %retval1, align 4
  ret i32 %5
}
