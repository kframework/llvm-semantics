; ModuleID = './930608-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@a = constant [1 x double (double)*] [double (double)* @f], align 8

; Function Attrs: nounwind uwtable
define double @f(double %a) #0 {
  %1 = alloca double, align 8
  store double %a, double* %1, align 8
  ret double 0.000000e+00
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %p = alloca double (...)*, align 8
  store i32 0, i32* %1
  store double (...)* bitcast (double (double)* @f to double (...)*), double (...)** %p, align 8
  %2 = load double (...)** %p, align 8
  %3 = load double (double)** getelementptr inbounds ([1 x double (double)*]* @a, i32 0, i64 0), align 8
  %4 = bitcast double (double)* %3 to double (...)*
  %5 = icmp ne double (...)* %2, %4
  br i1 %5, label %6, label %7

; <label>:6                                       ; preds = %0
  call void @abort() #2
  unreachable

; <label>:7                                       ; preds = %0
  call void @exit(i32 0) #2
  unreachable
                                                  ; No predecessors!
  %9 = load i32* %1
  ret i32 %9
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
