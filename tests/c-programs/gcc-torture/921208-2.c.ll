; ModuleID = './921208-2.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define void @g(double %a, double %b) #0 {
  %1 = alloca double, align 8
  %2 = alloca double, align 8
  store double %a, double* %1, align 8
  store double %b, double* %2, align 8
  ret void
}

; Function Attrs: nounwind uwtable
define void @f() #0 {
  %i = alloca i32, align 4
  %a = alloca [100000 x float], align 16
  store i32 0, i32* %i, align 4
  br label %1

; <label>:1                                       ; preds = %15, %0
  %2 = load i32, i32* %i, align 4
  %3 = icmp slt i32 %2, 1
  br i1 %3, label %4, label %18

; <label>:4                                       ; preds = %1
  %5 = load i32, i32* %i, align 4
  %6 = sitofp i32 %5 to double
  %7 = fdiv double %6, 2.000000e+00
  %8 = fmul double %7, 3.000000e+00
  %9 = fadd double 1.000000e+00, %8
  call void @g(double 1.000000e+00, double %9)
  %10 = load i32, i32* %i, align 4
  %11 = sitofp i32 %10 to double
  %12 = fdiv double %11, 2.000000e+00
  %13 = fmul double %12, 3.000000e+00
  %14 = fadd double 1.000000e+00, %13
  call void @g(double 2.000000e+00, double %14)
  br label %15

; <label>:15                                      ; preds = %4
  %16 = load i32, i32* %i, align 4
  %17 = add nsw i32 %16, 1
  store i32 %17, i32* %i, align 4
  br label %1

; <label>:18                                      ; preds = %1
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  call void @f()
  call void @exit(i32 0) #2
  unreachable
                                                  ; No predecessors!
  %3 = load i32, i32* %1
  ret i32 %3
}

; Function Attrs: noreturn
declare void @exit(i32) #1

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
