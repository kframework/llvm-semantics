; ModuleID = './compoundLiteral.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %p = alloca i32*, align 8
  %2 = alloca [2 x i32], align 4
  store i32 0, i32* %1
  %3 = getelementptr inbounds [2 x i32]* %2, i64 0, i64 0
  store i32 2, i32* %3
  %4 = getelementptr inbounds i32* %3, i64 1
  store i32 4, i32* %4
  %5 = getelementptr inbounds [2 x i32]* %2, i32 0, i32 0
  store i32* %5, i32** %p, align 8
  %6 = load i32** %p, align 8
  %7 = load i32* %6, align 4
  ret i32 %7
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
