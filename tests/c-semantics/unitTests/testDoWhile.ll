; ModuleID = './testDoWhile.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %i = alloca i32, align 4
  %x = alloca i32, align 4
  store i32 0, i32* %1
  store i32 5, i32* %i, align 4
  store i32 0, i32* %x, align 4
  br label %2

; <label>:2                                       ; preds = %7, %0
  %3 = load i32* %i, align 4
  %4 = add nsw i32 %3, -1
  store i32 %4, i32* %i, align 4
  %5 = load i32* %x, align 4
  %6 = add nsw i32 %5, 1
  store i32 %6, i32* %x, align 4
  br label %7

; <label>:7                                       ; preds = %2
  %8 = load i32* %i, align 4
  %9 = icmp sgt i32 %8, 0
  br i1 %9, label %2, label %10

; <label>:10                                      ; preds = %7
  br label %11

; <label>:11                                      ; preds = %10
  %12 = load i32* %x, align 4
  %13 = add nsw i32 %12, 1
  store i32 %13, i32* %x, align 4
  br label %14

; <label>:14                                      ; preds = %11
  %15 = load i32* %x, align 4
  ret i32 %15
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
