; ModuleID = './990829-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define double @test(double %le, double %ri) #0 {
  %1 = alloca double, align 8
  %2 = alloca double, align 8
  %val = alloca double, align 8
  store double %le, double* %1, align 8
  store double %ri, double* %2, align 8
  %3 = load double* %2, align 8
  %4 = load double* %1, align 8
  %5 = fsub double %3, %4
  %6 = load double* %2, align 8
  %7 = load double* %1, align 8
  %8 = fadd double %7, 1.000000e+00
  %9 = fmul double %6, %8
  %10 = fdiv double %5, %9
  store double %10, double* %val, align 8
  %11 = load double* %val, align 8
  ret double %11
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %retval = alloca double, align 8
  store i32 0, i32* %1
  %2 = call double @test(double 1.000000e+00, double 2.000000e+00)
  store double %2, double* %retval, align 8
  %3 = load double* %retval, align 8
  %4 = fcmp olt double %3, 2.400000e-01
  br i1 %4, label %8, label %5

; <label>:5                                       ; preds = %0
  %6 = load double* %retval, align 8
  %7 = fcmp ogt double %6, 2.600000e-01
  br i1 %7, label %8, label %9

; <label>:8                                       ; preds = %5, %0
  call void @abort() #2
  unreachable

; <label>:9                                       ; preds = %5
  call void @exit(i32 0) #2
  unreachable
                                                  ; No predecessors!
  %11 = load i32* %1
  ret i32 %11
}

; Function Attrs: noreturn nounwind
declare void @abort() #1

; Function Attrs: noreturn nounwind
declare void @exit(i32) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
