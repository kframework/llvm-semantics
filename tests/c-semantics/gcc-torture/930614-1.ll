; ModuleID = './930614-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define void @f(double* %ty) #0 {
  %1 = alloca double*, align 8
  store double* %ty, double** %1, align 8
  %2 = load double** %1, align 8
  store double -1.000000e+00, double* %2, align 8
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %foo = alloca [6 x double], align 16
  %tx = alloca double, align 8
  %ty = alloca double, align 8
  %d = alloca double, align 8
  store i32 0, i32* %1
  store double 0.000000e+00, double* %tx, align 8
  call void @f(double* %ty)
  %2 = load double* %ty, align 8
  %3 = fcmp olt double %2, 0.000000e+00
  br i1 %3, label %4, label %7

; <label>:4                                       ; preds = %0
  %5 = load double* %ty, align 8
  %6 = fsub double -0.000000e+00, %5
  store double %6, double* %ty, align 8
  br label %7

; <label>:7                                       ; preds = %4, %0
  %8 = load double* %tx, align 8
  %9 = load double* %ty, align 8
  %10 = fcmp ogt double %8, %9
  br i1 %10, label %11, label %13

; <label>:11                                      ; preds = %7
  %12 = load double* %tx, align 8
  br label %15

; <label>:13                                      ; preds = %7
  %14 = load double* %ty, align 8
  br label %15

; <label>:15                                      ; preds = %13, %11
  %16 = phi double [ %12, %11 ], [ %14, %13 ]
  store double %16, double* %d, align 8
  %17 = load double* %ty, align 8
  %18 = load double* %d, align 8
  %19 = fcmp une double %17, %18
  br i1 %19, label %20, label %21

; <label>:20                                      ; preds = %15
  call void @abort() #2
  unreachable

; <label>:21                                      ; preds = %15
  call void @exit(i32 0) #2
  unreachable
                                                  ; No predecessors!
  %23 = load i32* %1
  ret i32 %23
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
