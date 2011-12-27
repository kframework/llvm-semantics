; ModuleID = '/home/grosu/celliso2/c-semantics/tests/unitTests/nestedWhile.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %x = alloca i32, align 4
  %retval1 = alloca i32, align 4
  %y = alloca i32, align 4
  %x12 = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 5, i32* %x, align 4
  store i32 0, i32* %retval1, align 4
  br label %while.cond

while.cond:                                       ; preds = %while.end, %entry
  %tmp = load i32* %x, align 4
  %cmp = icmp sgt i32 %tmp, 0
  br i1 %cmp, label %while.body, label %while.end13

while.body:                                       ; preds = %while.cond
  store i32 3, i32* %y, align 4
  br label %while.cond3

while.cond3:                                      ; preds = %while.body6, %while.body
  %tmp4 = load i32* %y, align 4
  %cmp5 = icmp sgt i32 %tmp4, 0
  br i1 %cmp5, label %while.body6, label %while.end

while.body6:                                      ; preds = %while.cond3
  %tmp7 = load i32* %retval1, align 4
  %inc = add nsw i32 %tmp7, 1
  store i32 %inc, i32* %retval1, align 4
  %tmp8 = load i32* %y, align 4
  %dec = add nsw i32 %tmp8, -1
  store i32 %dec, i32* %y, align 4
  br label %while.cond3

while.end:                                        ; preds = %while.cond3
  %tmp9 = load i32* %x, align 4
  %dec10 = add nsw i32 %tmp9, -1
  store i32 %dec10, i32* %x, align 4
  store i32 0, i32* %x12, align 4
  br label %while.cond

while.end13:                                      ; preds = %while.cond
  %tmp14 = load i32* %retval1, align 4
  ret i32 %tmp14
}
