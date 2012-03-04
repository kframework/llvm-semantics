; ModuleID = '/home/grosu/celliso2/c-semantics/tests/unitTests/testNestedBreak.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
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
  %tmp = load i32* %x, align 4
  store i32 %tmp, i32* %retval1, align 4
  br label %while.body

while.body:                                       ; preds = %entry
  store i32 6, i32* %y, align 4
  br label %while.cond3

while.cond3:                                      ; preds = %while.end, %while.body
  %tmp4 = load i32* %retval1, align 4
  %cmp = icmp eq i32 %tmp4, 5
  br i1 %cmp, label %while.body5, label %while.end17

while.body5:                                      ; preds = %while.cond3
  store i32 7, i32* %z, align 4
  br label %while.body8

while.body8:                                      ; preds = %while.body5
  store i32 9, i32* %w, align 4
  %tmp10 = load i32* %w, align 4
  %tmp11 = load i32* %retval1, align 4
  %add = add nsw i32 %tmp11, %tmp10
  store i32 %add, i32* %retval1, align 4
  br label %while.end

while.end:                                        ; preds = %while.body8
  %tmp12 = load i32* %z, align 4
  %tmp13 = load i32* %retval1, align 4
  %add14 = add nsw i32 %tmp13, %tmp12
  store i32 %add14, i32* %retval1, align 4
  %tmp15 = load i32* %retval1, align 4
  %add16 = add nsw i32 %tmp15, 2
  store i32 %add16, i32* %retval1, align 4
  br label %while.cond3

while.end17:                                      ; preds = %while.cond3
  %tmp18 = load i32* %y, align 4
  %tmp19 = load i32* %retval1, align 4
  %add20 = add nsw i32 %tmp19, %tmp18
  store i32 %add20, i32* %retval1, align 4
  br label %while.end21

while.end21:                                      ; preds = %while.end17
  %tmp22 = load i32* %retval1, align 4
  ret i32 %tmp22
}
