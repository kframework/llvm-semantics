; ModuleID = './unary-plus-float.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %x = alloca float, align 4
  %y = alloca float, align 4
  %z = alloca double, align 8
  store i32 0, i32* %1
  store float 0x40091EB860000000, float* %x, align 4
  store float 0xC001604180000000, float* %y, align 4
  store double 0x40336B851EB851EB, double* %z, align 8
  %2 = load float* %x, align 4
  %3 = load float* %y, align 4
  %4 = fadd float %2, %3
  %5 = fpext float %4 to double
  %6 = load double* %z, align 8
  %7 = fadd double %5, %6
  %8 = fptosi double %7 to i32
  ret i32 %8
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
