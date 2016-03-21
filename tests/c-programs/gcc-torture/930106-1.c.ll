; ModuleID = './930106-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define double @g() #0 {
  ret double 1.000000e+00
}

; Function Attrs: nounwind uwtable
define i32 @f() #0 {
  %dummy = alloca [399999 x i8], align 16
  %f1 = alloca double, align 8
  %f2 = alloca double, align 8
  %f3 = alloca double, align 8
  %1 = call double @g()
  store double %1, double* %f1, align 8
  %2 = call double @g()
  store double %2, double* %f2, align 8
  %3 = call double @g()
  store double %3, double* %f3, align 8
  %4 = load double, double* %f1, align 8
  %5 = load double, double* %f2, align 8
  %6 = fadd double %4, %5
  %7 = load double, double* %f3, align 8
  %8 = fadd double %6, %7
  %9 = fptosi double %8 to i32
  ret i32 %9
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  %2 = call i32 @f()
  %3 = sitofp i32 %2 to double
  %4 = fcmp une double %3, 3.000000e+00
  br i1 %4, label %5, label %6

; <label>:5                                       ; preds = %0
  call void @abort() #2
  unreachable

; <label>:6                                       ; preds = %0
  call void @exit(i32 0) #2
  unreachable
                                                  ; No predecessors!
  %8 = load i32, i32* %1
  ret i32 %8
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
