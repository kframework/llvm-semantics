; ModuleID = './980604-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@a = global i32 1, align 4
@b = global i32 -1, align 4
@c = global i32 1, align 4
@d = global i32 0, align 4

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %e = alloca double, align 8
  %f = alloca double, align 8
  %g = alloca double, align 8
  store i32 0, i32* %1
  %2 = load i32* @c, align 4
  %3 = sitofp i32 %2 to double
  store double %3, double* %f, align 8
  %4 = load i32* @d, align 4
  %5 = sitofp i32 %4 to double
  store double %5, double* %g, align 8
  %6 = load i32* @a, align 4
  %7 = load i32* @b, align 4
  %8 = icmp slt i32 %6, %7
  br i1 %8, label %9, label %11

; <label>:9                                       ; preds = %0
  %10 = load double* %f, align 8
  br label %13

; <label>:11                                      ; preds = %0
  %12 = load double* %g, align 8
  br label %13

; <label>:13                                      ; preds = %11, %9
  %14 = phi double [ %10, %9 ], [ %12, %11 ]
  store double %14, double* %e, align 8
  %15 = load double* %e, align 8
  %16 = fcmp une double %15, 0.000000e+00
  br i1 %16, label %17, label %18

; <label>:17                                      ; preds = %13
  call void @abort() #2
  unreachable

; <label>:18                                      ; preds = %13
  call void @exit(i32 0) #2
  unreachable
                                                  ; No predecessors!
  %20 = load i32* %1
  ret i32 %20
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
