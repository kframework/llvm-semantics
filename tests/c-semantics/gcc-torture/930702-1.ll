; ModuleID = './930702-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define i32 @fp(double %a, i32 %b) #0 {
  %1 = alloca double, align 8
  %2 = alloca i32, align 4
  store double %a, double* %1, align 8
  store i32 %b, i32* %2, align 4
  %3 = load double* %1, align 8
  %4 = fcmp une double %3, 3.300000e+01
  br i1 %4, label %8, label %5

; <label>:5                                       ; preds = %0
  %6 = load i32* %2, align 4
  %7 = icmp ne i32 %6, 11
  br i1 %7, label %8, label %9

; <label>:8                                       ; preds = %5, %0
  call void @abort() #2
  unreachable

; <label>:9                                       ; preds = %5
  ret i32 0
}

; Function Attrs: noreturn nounwind
declare void @abort() #1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %f = alloca i32 (double, i32)*, align 8
  store i32 0, i32* %1
  store i32 (double, i32)* @fp, i32 (double, i32)** %f, align 8
  %2 = call i32 @fp(double 3.300000e+01, i32 11)
  %3 = load i32 (double, i32)** %f, align 8
  %4 = call i32 %3(double 3.300000e+01, i32 11)
  call void @exit(i32 0) #2
  unreachable
                                                  ; No predecessors!
  %6 = load i32* %1
  ret i32 %6
}

; Function Attrs: noreturn nounwind
declare void @exit(i32) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
