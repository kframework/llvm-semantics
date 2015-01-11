; ModuleID = './990127-2.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define void @fpEq(double %x, double %y) #0 {
  %1 = alloca double, align 8
  %2 = alloca double, align 8
  store double %x, double* %1, align 8
  store double %y, double* %2, align 8
  %3 = load double* %1, align 8
  %4 = load double* %2, align 8
  %5 = fcmp une double %3, %4
  br i1 %5, label %6, label %7

; <label>:6                                       ; preds = %0
  call void @abort() #2
  unreachable

; <label>:7                                       ; preds = %0
  ret void
}

; Function Attrs: noreturn nounwind
declare void @abort() #1

; Function Attrs: nounwind uwtable
define void @fpTest(double %x, double %y) #0 {
  %1 = alloca double, align 8
  %2 = alloca double, align 8
  %result1 = alloca double, align 8
  %result2 = alloca double, align 8
  store double %x, double* %1, align 8
  store double %y, double* %2, align 8
  store double 0x4053D55555555556, double* %result1, align 8
  %3 = load double* %1, align 8
  %4 = fmul double %3, 1.000000e+02
  %5 = load double* %2, align 8
  %6 = fdiv double %4, %5
  store double %6, double* %result2, align 8
  %7 = load double* %result1, align 8
  %8 = load double* %result2, align 8
  call void @fpEq(double %7, double %8)
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  call void @fpTest(double 3.570000e+01, double 4.500000e+01)
  call void @exit(i32 0) #2
  unreachable
                                                  ; No predecessors!
  %3 = load i32* %1
  ret i32 %3
}

; Function Attrs: noreturn nounwind
declare void @exit(i32) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
