; ModuleID = './20020321-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define float @g(i8* %a, i8* %b, i32 %e, i32 %c, float %d) #0 {
  %1 = alloca i8*, align 8
  %2 = alloca i8*, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca float, align 4
  store i8* %a, i8** %1, align 8
  store i8* %b, i8** %2, align 8
  store i32 %e, i32* %3, align 4
  store i32 %c, i32* %4, align 4
  store float %d, float* %5, align 4
  %6 = load float* %5, align 4
  ret float %6
}

; Function Attrs: nounwind uwtable
define float @f(i8* %a, i8* %b, i32 %c, float %d) #0 {
  %1 = alloca i8*, align 8
  %2 = alloca i8*, align 8
  %3 = alloca i32, align 4
  %4 = alloca float, align 4
  store i8* %a, i8** %1, align 8
  store i8* %b, i8** %2, align 8
  store i32 %c, i32* %3, align 4
  store float %d, float* %4, align 4
  %5 = load i8** %1, align 8
  %6 = load i8** %2, align 8
  %7 = load i32* %3, align 4
  %8 = load float* %4, align 4
  %9 = call float @g(i8* %5, i8* %6, i32 0, i32 %7, float %8)
  ret float %9
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  %2 = call float @f(i8* null, i8* null, i32 1, float 1.000000e+00)
  ret i32 0
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
