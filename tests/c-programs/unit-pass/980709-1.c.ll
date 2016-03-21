; ModuleID = './980709-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %a = alloca double, align 8
  %c = alloca double, align 8
  store i32 0, i32* %1
  store volatile double 3.200000e+01, double* %a, align 8
  %2 = load volatile double, double* %a, align 8
  %3 = call double @pow(double %2, double 0x3FD5555555555555) #3
  store double %3, double* %c, align 8
  %4 = load double, double* %c, align 8
  %5 = fadd double %4, 1.000000e-01
  %6 = fcmp ogt double %5, 3.174802e+00
  br i1 %6, label %7, label %12

; <label>:7                                       ; preds = %0
  %8 = load double, double* %c, align 8
  %9 = fsub double %8, 1.000000e-01
  %10 = fcmp olt double %9, 3.174802e+00
  br i1 %10, label %11, label %12

; <label>:11                                      ; preds = %7
  call void @exit(i32 0) #4
  unreachable

; <label>:12                                      ; preds = %7, %0
  call void @abort() #4
  unreachable
                                                  ; No predecessors!
  %14 = load i32, i32* %1
  ret i32 %14
}

; Function Attrs: nounwind
declare double @pow(double, double) #1

; Function Attrs: noreturn nounwind
declare void @exit(i32) #2

; Function Attrs: noreturn nounwind
declare void @abort() #2

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
