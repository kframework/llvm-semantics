; ModuleID = './floats-ull.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [15 x i8] c"Messed up 1.99\00", align 1
@.str1 = private unnamed_addr constant [23 x i8] c"VOLATILE: Messed up &&\00", align 1
@.str2 = private unnamed_addr constant [13 x i8] c"Messed up ~~\00", align 1
@.str3 = private unnamed_addr constant [14 x i8] c"Messed up 0.0\00", align 1

; Function Attrs: nounwind uwtable
define i64 @f2ull(float %f) #0 {
  %1 = alloca float, align 4
  store float %f, float* %1, align 4
  %2 = load float* %1, align 4
  %3 = fptoui float %2 to i64
  ret i64 %3
}

; Function Attrs: nounwind uwtable
define i64 @d2ull(double %d) #0 {
  %1 = alloca double, align 8
  store double %d, double* %1, align 8
  %2 = load double* %1, align 8
  %3 = fptoui double %2 to i64
  ret i64 %3
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %innerInt = alloca i64, align 8
  %innerFloat = alloca float, align 4
  %lhs_ull = alloca i64, align 8
  %choice1 = alloca i64, align 8
  %choice2 = alloca i64, align 8
  store i32 0, i32* %1
  %2 = call i64 @f2ull(float 0x3FFFD70A40000000)
  %3 = icmp ne i64 %2, 1
  br i1 %3, label %4, label %6

; <label>:4                                       ; preds = %0
  %5 = call i32 @puts(i8* getelementptr inbounds ([15 x i8]* @.str, i32 0, i32 0))
  br label %6

; <label>:6                                       ; preds = %4, %0
  store i64 9223372036854775807, i64* %innerInt, align 8
  %7 = load i64* %innerInt, align 8
  %8 = uitofp i64 %7 to float
  store float %8, float* %innerFloat, align 4
  %9 = load float* %innerFloat, align 4
  %10 = call i64 @f2ull(float %9)
  store i64 %10, i64* %lhs_ull, align 8
  store i64 9223372036854775807, i64* %choice1, align 8
  store i64 -9223372036854775808, i64* %choice2, align 8
  %11 = load i64* %lhs_ull, align 8
  %12 = load i64* %choice1, align 8
  %13 = icmp ne i64 %11, %12
  br i1 %13, label %14, label %20

; <label>:14                                      ; preds = %6
  %15 = load i64* %lhs_ull, align 8
  %16 = load i64* %choice2, align 8
  %17 = icmp ne i64 %15, %16
  br i1 %17, label %18, label %20

; <label>:18                                      ; preds = %14
  %19 = call i32 @puts(i8* getelementptr inbounds ([23 x i8]* @.str1, i32 0, i32 0))
  br label %20

; <label>:20                                      ; preds = %18, %14, %6
  %21 = call i64 @f2ull(float 0x43E0000000000000)
  %22 = icmp ne i64 %21, -9223372036854775808
  br i1 %22, label %23, label %25

; <label>:23                                      ; preds = %20
  %24 = call i32 @puts(i8* getelementptr inbounds ([13 x i8]* @.str2, i32 0, i32 0))
  br label %25

; <label>:25                                      ; preds = %23, %20
  %26 = call i64 @d2ull(double 0.000000e+00)
  %27 = icmp ne i64 %26, 0
  br i1 %27, label %28, label %30

; <label>:28                                      ; preds = %25
  %29 = call i32 @puts(i8* getelementptr inbounds ([14 x i8]* @.str3, i32 0, i32 0))
  br label %30

; <label>:30                                      ; preds = %28, %25
  ret i32 0
}

declare i32 @puts(i8*) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
