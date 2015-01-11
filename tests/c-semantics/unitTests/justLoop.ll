; ModuleID = './justLoop.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 0, i32* %1
  store i32 0, i32* %i, align 4
  br label %2

; <label>:2                                       ; preds = %6, %0
  %3 = load i32* %i, align 4
  %4 = icmp slt i32 %3, 100
  br i1 %4, label %5, label %9

; <label>:5                                       ; preds = %2
  br label %6

; <label>:6                                       ; preds = %5
  %7 = load i32* %i, align 4
  %8 = add nsw i32 %7, 1
  store i32 %8, i32* %i, align 4
  br label %2

; <label>:9                                       ; preds = %2
  ret i32 0
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
