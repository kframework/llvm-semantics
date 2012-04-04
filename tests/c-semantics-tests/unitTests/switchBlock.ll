; ModuleID = '/home/david/src/c-semantics/tests/unitTests/switchBlock.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %x = alloca i32, align 4
  %i = alloca i32, align 4
  %x2 = alloca i32, align 4
  %x6 = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 0, i32* %x, align 4
  store i32 0, i32* %i, align 4
  br label %do.body

do.body:                                          ; preds = %do.cond, %entry
  %0 = load i32* %i, align 4
  %inc = add nsw i32 %0, 1
  store i32 %inc, i32* %i, align 4
  %1 = load i32* %x, align 4
  %inc1 = add nsw i32 %1, 1
  store i32 %inc1, i32* %x, align 4
  store i32 5, i32* %x2, align 4
  %2 = load i32* %x2, align 4
  %inc3 = add nsw i32 %2, 1
  store i32 %inc3, i32* %x2, align 4
  br label %do.cond

do.cond:                                          ; preds = %do.body
  %3 = load i32* %i, align 4
  %cmp = icmp slt i32 %3, 3
  br i1 %cmp, label %do.body, label %do.end

do.end:                                           ; preds = %do.cond
  %4 = load i32* %x, align 4
  %mul = mul nsw i32 %4, 2
  store i32 %mul, i32* %x, align 4
  br label %do.body4

do.body4:                                         ; preds = %do.end
  %5 = load i32* %x, align 4
  %inc5 = add nsw i32 %5, 1
  store i32 %inc5, i32* %x, align 4
  store i32 5, i32* %x6, align 4
  %6 = load i32* %x6, align 4
  %inc7 = add nsw i32 %6, 1
  store i32 %inc7, i32* %x6, align 4
  br label %do.end9

do.end9:                                          ; preds = %do.body4
  %7 = load i32* %x, align 4
  ret i32 %7
}
