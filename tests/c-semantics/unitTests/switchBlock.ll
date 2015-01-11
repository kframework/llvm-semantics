; ModuleID = './switchBlock.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %x = alloca i32, align 4
  %i = alloca i32, align 4
  %x1 = alloca i32, align 4
  %x2 = alloca i32, align 4
  store i32 0, i32* %1
  store i32 0, i32* %x, align 4
  store i32 0, i32* %i, align 4
  br label %2

; <label>:2                                       ; preds = %9, %0
  %3 = load i32* %i, align 4
  %4 = add nsw i32 %3, 1
  store i32 %4, i32* %i, align 4
  %5 = load i32* %x, align 4
  %6 = add nsw i32 %5, 1
  store i32 %6, i32* %x, align 4
  store i32 5, i32* %x1, align 4
  %7 = load i32* %x1, align 4
  %8 = add nsw i32 %7, 1
  store i32 %8, i32* %x1, align 4
  br label %9

; <label>:9                                       ; preds = %2
  %10 = load i32* %i, align 4
  %11 = icmp slt i32 %10, 3
  br i1 %11, label %2, label %12

; <label>:12                                      ; preds = %9
  %13 = load i32* %x, align 4
  %14 = mul nsw i32 %13, 2
  store i32 %14, i32* %x, align 4
  br label %15

; <label>:15                                      ; preds = %12
  %16 = load i32* %x, align 4
  %17 = add nsw i32 %16, 1
  store i32 %17, i32* %x, align 4
  store i32 5, i32* %x2, align 4
  %18 = load i32* %x2, align 4
  %19 = add nsw i32 %18, 1
  store i32 %19, i32* %x2, align 4
  br label %20

; <label>:20                                      ; preds = %15
  %21 = load i32* %x, align 4
  ret i32 %21
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
