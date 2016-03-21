; ModuleID = './2002-05-02-ArgumentTest.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [26 x i8] c"%d, %f, %d, %lld, %d, %f\0A\00", align 1

; Function Attrs: nounwind uwtable
define void @testfunc(i16 signext %s, float %X, i8 signext %C, i64 %LL, i32 %I, double %D) #0 {
  %1 = alloca i16, align 2
  %2 = alloca float, align 4
  %3 = alloca i8, align 1
  %4 = alloca i64, align 8
  %5 = alloca i32, align 4
  %6 = alloca double, align 8
  store i16 %s, i16* %1, align 2
  store float %X, float* %2, align 4
  store i8 %C, i8* %3, align 1
  store i64 %LL, i64* %4, align 8
  store i32 %I, i32* %5, align 4
  store double %D, double* %6, align 8
  %7 = load i16, i16* %1, align 2
  %8 = sext i16 %7 to i32
  %9 = load float, float* %2, align 4
  %10 = fpext float %9 to double
  %11 = load i8, i8* %3, align 1
  %12 = sext i8 %11 to i32
  %13 = load i64, i64* %4, align 8
  %14 = load i32, i32* %5, align 4
  %15 = load double, double* %6, align 8
  %16 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str, i32 0, i32 0), i32 %8, double %10, i32 %12, i64 %13, i32 %14, double %15)
  ret void
}

declare i32 @printf(i8*, ...) #1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  call void @testfunc(i16 signext 12, float 0x3FF3EB8520000000, i8 signext 120, i64 123456677890, i32 -10, double 4.500000e+15)
  ret i32 0
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
