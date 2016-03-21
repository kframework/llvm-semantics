; ModuleID = './941021-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@glob_dbl = common global double 0.000000e+00, align 8

; Function Attrs: nounwind uwtable
define void @f(double* %pdbl, double %value) #0 {
  %1 = alloca double*, align 8
  %2 = alloca double, align 8
  store double* %pdbl, double** %1, align 8
  store double %value, double* %2, align 8
  %3 = load double*, double** %1, align 8
  %4 = icmp eq double* %3, null
  br i1 %4, label %5, label %6

; <label>:5                                       ; preds = %0
  store double* @glob_dbl, double** %1, align 8
  br label %6

; <label>:6                                       ; preds = %5, %0
  %7 = load double, double* %2, align 8
  %8 = load double*, double** %1, align 8
  store double %7, double* %8, align 8
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  call void @f(double* null, double 5.510000e+01)
  %2 = load double, double* @glob_dbl, align 8
  %3 = fcmp une double %2, 5.510000e+01
  br i1 %3, label %4, label %5

; <label>:4                                       ; preds = %0
  call void @abort() #2
  unreachable

; <label>:5                                       ; preds = %0
  call void @exit(i32 0) #2
  unreachable
                                                  ; No predecessors!
  %7 = load i32, i32* %1
  ret i32 %7
}

; Function Attrs: noreturn nounwind
declare void @abort() #1

; Function Attrs: noreturn nounwind
declare void @exit(i32) #1

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
