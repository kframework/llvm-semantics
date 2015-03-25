; ModuleID = './singleLineIfGoto.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %x = alloca i32, align 4
  store i32 0, i32* %1
  store i32 5, i32* %x, align 4
  br label %4
                                                  ; No predecessors!
  br i1 false, label %3, label %7

; <label>:3                                       ; preds = %2
  br label %4

; <label>:4                                       ; preds = %3, %0
  %5 = load i32* %x, align 4
  %6 = add nsw i32 %5, 1
  store i32 %6, i32* %x, align 4
  br label %7

; <label>:7                                       ; preds = %4, %2
  %8 = load i32* %x, align 4
  ret i32 %8
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
