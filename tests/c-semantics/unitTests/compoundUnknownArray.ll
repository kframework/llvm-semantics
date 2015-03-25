; ModuleID = './compoundUnknownArray.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca [5 x i32], align 4
  store i32 0, i32* %1
  %3 = getelementptr inbounds [5 x i32]* %2, i64 0, i64 0
  store i32 1, i32* %3
  %4 = getelementptr inbounds i32* %3, i64 1
  store i32 2, i32* %4
  %5 = getelementptr inbounds i32* %4, i64 1
  store i32 3, i32* %5
  %6 = getelementptr inbounds i32* %5, i64 1
  store i32 4, i32* %6
  %7 = getelementptr inbounds i32* %6, i64 1
  store i32 5, i32* %7
  %8 = getelementptr inbounds [5 x i32]* %2, i32 0, i64 4
  %9 = load i32* %8, align 4
  ret i32 %9
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
