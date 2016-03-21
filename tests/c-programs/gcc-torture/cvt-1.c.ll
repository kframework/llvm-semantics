; ModuleID = './cvt-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define i64 @g2(double %f) #0 {
  %1 = alloca double, align 8
  store double %f, double* %1, align 8
  %2 = load double, double* %1, align 8
  %3 = fptosi double %2 to i64
  ret i64 %3
}

; Function Attrs: nounwind uwtable
define double @f(i64 %i) #0 {
  %1 = alloca i64, align 8
  store i64 %i, i64* %1, align 8
  %2 = load i64, i64* %1, align 8
  %3 = sitofp i64 %2 to double
  %4 = call i64 @g1(double %3)
  %5 = load i64, i64* %1, align 8
  %6 = sitofp i64 %5 to double
  %7 = call i64 @g2(double %6)
  %8 = icmp ne i64 %4, %7
  br i1 %8, label %9, label %10

; <label>:9                                       ; preds = %0
  call void @abort() #3
  unreachable

; <label>:10                                      ; preds = %0
  %11 = load i64, i64* %1, align 8
  %12 = sitofp i64 %11 to double
  %13 = call i64 @g2(double %12)
  %14 = sitofp i64 %13 to double
  ret double %14
}

; Function Attrs: inlinehint nounwind uwtable
define internal i64 @g1(double %x) #1 {
  %1 = alloca double, align 8
  store double %x, double* %1, align 8
  %2 = load double, double* %1, align 8
  %3 = fptosi double %2 to i64
  %4 = sitofp i64 %3 to double
  %5 = fptosi double %4 to i64
  ret i64 %5
}

; Function Attrs: noreturn nounwind
declare void @abort() #2

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  %2 = call double @f(i64 123456789)
  %3 = fcmp une double %2, 0x419D6F3454000000
  br i1 %3, label %4, label %5

; <label>:4                                       ; preds = %0
  call void @abort() #3
  unreachable

; <label>:5                                       ; preds = %0
  %6 = call double @f(i64 123456789)
  %7 = call i64 @g2(double 0x419D6F3454000000)
  %8 = sitofp i64 %7 to double
  %9 = fcmp une double %6, %8
  br i1 %9, label %10, label %11

; <label>:10                                      ; preds = %5
  call void @abort() #3
  unreachable

; <label>:11                                      ; preds = %5
  call void @exit(i32 0) #3
  unreachable
                                                  ; No predecessors!
  %13 = load i32, i32* %1
  ret i32 %13
}

; Function Attrs: noreturn nounwind
declare void @exit(i32) #2

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { inlinehint nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
