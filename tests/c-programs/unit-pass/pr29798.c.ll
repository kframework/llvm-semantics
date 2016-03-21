; ModuleID = './pr29798.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %i = alloca i32, align 4
  %oldrho = alloca double, align 8
  %beta = alloca double, align 8
  %work = alloca double, align 8
  %rho = alloca double, align 8
  store i32 0, i32* %1
  store double 0.000000e+00, double* %beta, align 8
  store double 1.000000e+00, double* %work, align 8
  store i32 1, i32* %i, align 4
  br label %2

; <label>:2                                       ; preds = %23, %0
  %3 = load i32, i32* %i, align 4
  %4 = icmp sle i32 %3, 2
  br i1 %4, label %5, label %26

; <label>:5                                       ; preds = %2
  %6 = load double, double* %work, align 8
  %7 = load double, double* %work, align 8
  %8 = fmul double %6, %7
  store double %8, double* %rho, align 8
  %9 = load i32, i32* %i, align 4
  %10 = icmp ne i32 %9, 1
  br i1 %10, label %11, label %15

; <label>:11                                      ; preds = %5
  %12 = load double, double* %rho, align 8
  %13 = load double, double* %oldrho, align 8
  %14 = fdiv double %12, %13
  store double %14, double* %beta, align 8
  br label %15

; <label>:15                                      ; preds = %11, %5
  %16 = load double, double* %beta, align 8
  %17 = fcmp oeq double %16, 1.000000e+00
  br i1 %17, label %18, label %19

; <label>:18                                      ; preds = %15
  call void @abort() #2
  unreachable

; <label>:19                                      ; preds = %15
  %20 = load double, double* %work, align 8
  %21 = fdiv double %20, 2.000000e+00
  store double %21, double* %work, align 8
  %22 = load double, double* %rho, align 8
  store double %22, double* %oldrho, align 8
  br label %23

; <label>:23                                      ; preds = %19
  %24 = load i32, i32* %i, align 4
  %25 = add nsw i32 %24, 1
  store i32 %25, i32* %i, align 4
  br label %2

; <label>:26                                      ; preds = %2
  ret i32 0
}

; Function Attrs: noreturn nounwind
declare void @abort() #1

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
