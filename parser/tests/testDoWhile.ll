; ModuleID = '/home/grosu/celliso2/c-semantics/tests/unitTests/testDoWhile.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %i = alloca i32, align 4
  %x = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 5, i32* %i, align 4
  store i32 0, i32* %x, align 4
  br label %do.body

do.body:                                          ; preds = %do.cond, %entry
  %tmp = load i32* %i, align 4
  %dec = add nsw i32 %tmp, -1
  store i32 %dec, i32* %i, align 4
  %tmp1 = load i32* %x, align 4
  %inc = add nsw i32 %tmp1, 1
  store i32 %inc, i32* %x, align 4
  br label %do.cond

do.cond:                                          ; preds = %do.body
  %tmp2 = load i32* %i, align 4
  %cmp = icmp sgt i32 %tmp2, 0
  br i1 %cmp, label %do.body, label %do.end

do.end:                                           ; preds = %do.cond
  br label %do.body3

do.body3:                                         ; preds = %do.end
  %tmp4 = load i32* %x, align 4
  %inc5 = add nsw i32 %tmp4, 1
  store i32 %inc5, i32* %x, align 4
  br label %do.end7

do.end7:                                          ; preds = %do.body3
  %tmp8 = load i32* %x, align 4
  ret i32 %tmp8
}
