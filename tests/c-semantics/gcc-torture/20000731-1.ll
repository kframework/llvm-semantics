; ModuleID = './20000731-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define double @foo() #0 {
  ret double 0.000000e+00
}

; Function Attrs: nounwind uwtable
define void @do_sibcall() #0 {
  %1 = call double @foo()
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %x = alloca double, align 8
  store i32 0, i32* %1
  store double 0.000000e+00, double* %x, align 8
  br label %2

; <label>:2                                       ; preds = %6, %0
  %3 = load double* %x, align 8
  %4 = fcmp olt double %3, 2.000000e+01
  br i1 %4, label %5, label %9

; <label>:5                                       ; preds = %2
  call void @do_sibcall()
  br label %6

; <label>:6                                       ; preds = %5
  %7 = load double* %x, align 8
  %8 = fadd double %7, 1.000000e+00
  store double %8, double* %x, align 8
  br label %2

; <label>:9                                       ; preds = %2
  %10 = load double* %x, align 8
  %11 = fcmp oge double %10, 1.000000e+01
  br i1 %11, label %13, label %12

; <label>:12                                      ; preds = %9
  call void @abort() #2
  unreachable

; <label>:13                                      ; preds = %9
  call void @exit(i32 0) #2
  unreachable
                                                  ; No predecessors!
  %15 = load i32* %1
  ret i32 %15
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
