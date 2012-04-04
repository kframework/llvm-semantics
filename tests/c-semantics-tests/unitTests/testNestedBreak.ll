; ModuleID = '/home/david/src/c-semantics/tests/unitTests/testNestedBreak.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %x = alloca i32, align 4
  %retval1 = alloca i32, align 4
  %y = alloca i32, align 4
  %z = alloca i32, align 4
  %w = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 5, i32* %x, align 4
  %0 = load i32* %x, align 4
  store i32 %0, i32* %retval1, align 4
  br label %while.body

while.body:                                       ; preds = %entry
  store i32 6, i32* %y, align 4
  br label %while.cond2

while.cond2:                                      ; preds = %while.end, %while.body
  %1 = load i32* %retval1, align 4
  %cmp = icmp eq i32 %1, 5
  br i1 %cmp, label %while.body3, label %while.end8

while.body3:                                      ; preds = %while.cond2
  store i32 7, i32* %z, align 4
  br label %while.body5

while.body5:                                      ; preds = %while.body3
  store i32 9, i32* %w, align 4
  %2 = load i32* %w, align 4
  %3 = load i32* %retval1, align 4
  %add = add nsw i32 %3, %2
  store i32 %add, i32* %retval1, align 4
  br label %while.end

while.end:                                        ; preds = %while.body5
  %4 = load i32* %z, align 4
  %5 = load i32* %retval1, align 4
  %add6 = add nsw i32 %5, %4
  store i32 %add6, i32* %retval1, align 4
  %6 = load i32* %retval1, align 4
  %add7 = add nsw i32 %6, 2
  store i32 %add7, i32* %retval1, align 4
  br label %while.cond2

while.end8:                                       ; preds = %while.cond2
  %7 = load i32* %y, align 4
  %8 = load i32* %retval1, align 4
  %add9 = add nsw i32 %8, %7
  store i32 %add9, i32* %retval1, align 4
  br label %while.end10

while.end10:                                      ; preds = %while.end8
  %9 = load i32* %retval1, align 4
  ret i32 %9
}
