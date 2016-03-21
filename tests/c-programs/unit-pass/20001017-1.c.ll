; ModuleID = './20001017-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define void @bug(double* %Cref, i8 signext %transb, i32 %m, i32 %n, i32 %k, double %a, double* %A, i32 %fdA, double* %B, i32 %fdB, double %b, double* %C, i32 %fdC) #0 {
  %1 = alloca double*, align 8
  %2 = alloca i8, align 1
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca double, align 8
  %7 = alloca double*, align 8
  %8 = alloca i32, align 4
  %9 = alloca double*, align 8
  %10 = alloca i32, align 4
  %11 = alloca double, align 8
  %12 = alloca double*, align 8
  %13 = alloca i32, align 4
  store double* %Cref, double** %1, align 8
  store i8 %transb, i8* %2, align 1
  store i32 %m, i32* %3, align 4
  store i32 %n, i32* %4, align 4
  store i32 %k, i32* %5, align 4
  store double %a, double* %6, align 8
  store double* %A, double** %7, align 8
  store i32 %fdA, i32* %8, align 4
  store double* %B, double** %9, align 8
  store i32 %fdB, i32* %10, align 4
  store double %b, double* %11, align 8
  store double* %C, double** %12, align 8
  store i32 %fdC, i32* %13, align 4
  %14 = load double*, double** %12, align 8
  %15 = load double*, double** %1, align 8
  %16 = icmp ne double* %14, %15
  br i1 %16, label %17, label %18

; <label>:17                                      ; preds = %0
  call void @abort() #2
  unreachable

; <label>:18                                      ; preds = %0
  ret void
}

; Function Attrs: noreturn nounwind
declare void @abort() #1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %A = alloca [1 x double], align 8
  %B = alloca [1 x double], align 8
  %C = alloca [1 x double], align 8
  store i32 0, i32* %1
  %2 = getelementptr inbounds [1 x double], [1 x double]* %C, i32 0, i32 0
  %3 = getelementptr inbounds [1 x double], [1 x double]* %A, i32 0, i32 0
  %4 = getelementptr inbounds [1 x double], [1 x double]* %B, i32 0, i32 0
  %5 = getelementptr inbounds [1 x double], [1 x double]* %C, i32 0, i32 0
  call void @bug(double* %2, i8 signext 66, i32 1, i32 2, i32 3, double 4.000000e+00, double* %3, i32 5, double* %4, i32 6, double 7.000000e+00, double* %5, i32 8)
  ret i32 0
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
