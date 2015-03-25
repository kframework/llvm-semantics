; ModuleID = './loop-ivopts-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@foo.t16 = internal global [16 x float] [float 1.000000e+00, float 2.000000e+00, float 3.000000e+00, float 4.000000e+00, float 5.000000e+00, float 6.000000e+00, float 7.000000e+00, float 8.000000e+00, float 9.000000e+00, float 1.000000e+01, float 1.100000e+01, float 1.200000e+01, float 1.300000e+01, float 1.400000e+01, float 1.500000e+01, float 1.600000e+01], align 16
@foo.tmp = internal global [4 x float] zeroinitializer, align 16

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %x = alloca [4 x float], align 16
  store i32 0, i32* %1
  %2 = getelementptr inbounds [4 x float]* %x, i32 0, i32 0
  call void @foo(float* %2)
  ret i32 0
}

; Function Attrs: nounwind uwtable
define void @foo(float* %x) #0 {
  %1 = alloca float*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %temp = alloca float, align 4
  store float* %x, float** %1, align 8
  store i32 0, i32* %i, align 4
  br label %2

; <label>:2                                       ; preds = %35, %0
  %3 = load i32* %i, align 4
  %4 = icmp slt i32 %3, 4
  br i1 %4, label %5, label %38

; <label>:5                                       ; preds = %2
  %6 = load i32* %i, align 4
  %7 = sub nsw i32 3, %6
  store i32 %7, i32* %k, align 4
  %8 = load i32* %k, align 4
  %9 = mul nsw i32 5, %8
  %10 = sext i32 %9 to i64
  %11 = getelementptr inbounds [16 x float]* @foo.t16, i32 0, i64 %10
  %12 = load float* %11, align 4
  store float %12, float* %temp, align 4
  %13 = load i32* %k, align 4
  %14 = add nsw i32 %13, 1
  store i32 %14, i32* %j, align 4
  br label %15

; <label>:15                                      ; preds = %31, %5
  %16 = load i32* %j, align 4
  %17 = icmp slt i32 %16, 4
  br i1 %17, label %18, label %34

; <label>:18                                      ; preds = %15
  %19 = load i32* %k, align 4
  %20 = load i32* %j, align 4
  %21 = mul nsw i32 %20, 4
  %22 = add nsw i32 %19, %21
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds [16 x float]* @foo.t16, i32 0, i64 %23
  %25 = load float* %24, align 4
  %26 = load float* %temp, align 4
  %27 = fmul float %25, %26
  %28 = load i32* %k, align 4
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds [4 x float]* @foo.tmp, i32 0, i64 %29
  store float %27, float* %30, align 4
  br label %31

; <label>:31                                      ; preds = %18
  %32 = load i32* %j, align 4
  %33 = add nsw i32 %32, 1
  store i32 %33, i32* %j, align 4
  br label %15

; <label>:34                                      ; preds = %15
  br label %35

; <label>:35                                      ; preds = %34
  %36 = load i32* %i, align 4
  %37 = add nsw i32 %36, 1
  store i32 %37, i32* %i, align 4
  br label %2

; <label>:38                                      ; preds = %2
  %39 = load float* getelementptr inbounds ([4 x float]* @foo.tmp, i32 0, i64 0), align 4
  %40 = load float** %1, align 8
  %41 = getelementptr inbounds float* %40, i64 0
  store float %39, float* %41, align 4
  %42 = load float* getelementptr inbounds ([4 x float]* @foo.tmp, i32 0, i64 1), align 4
  %43 = load float** %1, align 8
  %44 = getelementptr inbounds float* %43, i64 1
  store float %42, float* %44, align 4
  %45 = load float* getelementptr inbounds ([4 x float]* @foo.tmp, i32 0, i64 2), align 4
  %46 = load float** %1, align 8
  %47 = getelementptr inbounds float* %46, i64 2
  store float %45, float* %47, align 4
  %48 = load float* getelementptr inbounds ([4 x float]* @foo.tmp, i32 0, i64 3), align 4
  %49 = load float** %1, align 8
  %50 = getelementptr inbounds float* %49, i64 3
  store float %48, float* %50, align 4
  ret void
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
