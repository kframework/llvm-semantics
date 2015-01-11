; ModuleID = './r060201-link1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define void @first() #0 {
  ret void
}

; Function Attrs: nounwind uwtable
define float @second() #0 {
  %n = alloca float, align 4
  %1 = call float @func()
  store float %1, float* %n, align 4
  %2 = load float* %n, align 4
  ret float %2
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %myn = alloca float, align 4
  %x = alloca i32, align 4
  store i32 0, i32* %1
  %2 = call float @second()
  store float %2, float* %myn, align 4
  %3 = load float* %myn, align 4
  %4 = fptosi float %3 to i32
  store i32 %4, i32* %x, align 4
  %5 = load i32* %x, align 4
  ret i32 %5
}

; Function Attrs: nounwind uwtable
define internal float @func() #0 {
  ret float 5.000000e+00
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
