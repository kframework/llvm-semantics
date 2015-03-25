; ModuleID = './continueInSwitch.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %i = alloca i32, align 4
  %n = alloca i32, align 4
  store i32 0, i32* %1
  store i32 0, i32* %n, align 4
  store i32 1, i32* %i, align 4
  br label %2

; <label>:2                                       ; preds = %10, %0
  %3 = load i32* %i, align 4
  %4 = icmp sle i32 %3, 1
  br i1 %4, label %5, label %13

; <label>:5                                       ; preds = %2
  %6 = load i32* %i, align 4
  switch i32 %6, label %7 [
  ]

; <label>:7                                       ; preds = %5
  %8 = load i32* %n, align 4
  %9 = add nsw i32 %8, 1
  store i32 %9, i32* %n, align 4
  br label %10

; <label>:10                                      ; preds = %7
  %11 = load i32* %i, align 4
  %12 = add nsw i32 %11, 1
  store i32 %12, i32* %i, align 4
  br label %2

; <label>:13                                      ; preds = %2
  %14 = load i32* %1
  ret i32 %14
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
