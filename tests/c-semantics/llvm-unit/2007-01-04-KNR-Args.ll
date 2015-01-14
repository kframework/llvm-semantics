; ModuleID = './2007-01-04-KNR-Args.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [25 x i8] c"%c %d %d %d %d %d %d %d\0A\00", align 1

; Function Attrs: nounwind uwtable
define void @p1(i32, double, i32, double %d1, i32 %i, double, i64 %l, double %d2) #0 {
  %5 = alloca i8, align 1
  %6 = alloca float, align 4
  %7 = alloca i16, align 2
  %8 = alloca double, align 8
  %9 = alloca i32, align 4
  %10 = alloca float, align 4
  %11 = alloca i64, align 8
  %12 = alloca double, align 8
  %c = trunc i32 %0 to i8
  %f1 = fptrunc double %1 to float
  %s = trunc i32 %2 to i16
  %f2 = fptrunc double %3 to float
  store i8 %c, i8* %5, align 1
  store float %f1, float* %6, align 4
  store i16 %s, i16* %7, align 2
  store double %d1, double* %8, align 8
  store i32 %i, i32* %9, align 4
  store float %f2, float* %10, align 4
  store i64 %l, i64* %11, align 8
  store double %d2, double* %12, align 8
  %13 = load i8* %5, align 1
  %14 = sext i8 %13 to i32
  %15 = load float* %6, align 4
  %16 = fmul float 1.000000e+02, %15
  %17 = fptosi float %16 to i32
  %18 = load i16* %7, align 2
  %19 = sext i16 %18 to i32
  %20 = load double* %8, align 8
  %21 = fmul double 1.000000e+02, %20
  %22 = fptosi double %21 to i32
  %23 = load i32* %9, align 4
  %24 = load float* %10, align 4
  %25 = fmul float 1.000000e+02, %24
  %26 = fptosi float %25 to i32
  %27 = load i64* %11, align 8
  %28 = load double* %12, align 8
  %29 = fmul double 1.000000e+02, %28
  %30 = fptosi double %29 to i32
  %31 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str, i32 0, i32 0), i32 %14, i32 %17, i32 %19, i32 %22, i32 %23, i32 %26, i64 %27, i32 %30)
  ret void
}

declare i32 @printf(i8*, ...) #1

; Function Attrs: nounwind uwtable
define void @p2(i8 signext %c, float %f1, i16 signext %s, double %d1, i32 %i, float %f2, i64 %l, double %d2) #0 {
  %1 = alloca i8, align 1
  %2 = alloca float, align 4
  %3 = alloca i16, align 2
  %4 = alloca double, align 8
  %5 = alloca i32, align 4
  %6 = alloca float, align 4
  %7 = alloca i64, align 8
  %8 = alloca double, align 8
  store i8 %c, i8* %1, align 1
  store float %f1, float* %2, align 4
  store i16 %s, i16* %3, align 2
  store double %d1, double* %4, align 8
  store i32 %i, i32* %5, align 4
  store float %f2, float* %6, align 4
  store i64 %l, i64* %7, align 8
  store double %d2, double* %8, align 8
  %9 = load i8* %1, align 1
  %10 = sext i8 %9 to i32
  %11 = load float* %2, align 4
  %12 = fmul float 1.000000e+02, %11
  %13 = fptosi float %12 to i32
  %14 = load i16* %3, align 2
  %15 = sext i16 %14 to i32
  %16 = load double* %4, align 8
  %17 = fmul double 1.000000e+02, %16
  %18 = fptosi double %17 to i32
  %19 = load i32* %5, align 4
  %20 = load float* %6, align 4
  %21 = fmul float 1.000000e+02, %20
  %22 = fptosi float %21 to i32
  %23 = load i64* %7, align 8
  %24 = load double* %8, align 8
  %25 = fmul double 1.000000e+02, %24
  %26 = fptosi double %25 to i32
  %27 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str, i32 0, i32 0), i32 %10, i32 %13, i32 %15, i32 %18, i32 %19, i32 %22, i64 %23, i32 %26)
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  call void @p1(i32 97, double 4.000000e+00, i32 1, double 5.000000e+00, i32 2, double 4.000000e+00, i64 3, double 5.000000e+00)
  call void @p2(i8 signext 97, float 4.000000e+00, i16 signext 1, double 5.000000e+00, i32 2, float 4.000000e+00, i64 3, double 5.000000e+00)
  ret i32 0
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
