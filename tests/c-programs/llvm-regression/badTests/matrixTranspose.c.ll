; ModuleID = './matrixTranspose.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@A = common global [2048 x float] zeroinitializer, align 16
@.str = private unnamed_addr constant [22 x i8] c"Checksum before = %d\0A\00", align 1
@.str.1 = private unnamed_addr constant [22 x i8] c"Checksum  after = %d\0A\00", align 1

; Function Attrs: nounwind uwtable
define void @complex_transpose(float* %rA, float* %iA, i32 %n, i32 %is, i32 %js) #0 {
  %1 = alloca float*, align 8
  %2 = alloca float*, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %ar = alloca float, align 4
  %ai = alloca float, align 4
  %br = alloca float, align 4
  %bi = alloca float, align 4
  store float* %rA, float** %1, align 8
  store float* %iA, float** %2, align 8
  store i32 %n, i32* %3, align 4
  store i32 %is, i32* %4, align 4
  store i32 %js, i32* %5, align 4
  store i32 1, i32* %i, align 4
  br label %6

; <label>:6                                       ; preds = %108, %0
  %7 = load i32, i32* %i, align 4
  %8 = load i32, i32* %3, align 4
  %9 = icmp slt i32 %7, %8
  br i1 %9, label %10, label %111

; <label>:10                                      ; preds = %6
  store i32 0, i32* %j, align 4
  br label %11

; <label>:11                                      ; preds = %104, %10
  %12 = load i32, i32* %j, align 4
  %13 = load i32, i32* %i, align 4
  %14 = icmp slt i32 %12, %13
  br i1 %14, label %15, label %107

; <label>:15                                      ; preds = %11
  %16 = load i32, i32* %i, align 4
  %17 = load i32, i32* %4, align 4
  %18 = mul nsw i32 %16, %17
  %19 = load i32, i32* %j, align 4
  %20 = load i32, i32* %5, align 4
  %21 = mul nsw i32 %19, %20
  %22 = add nsw i32 %18, %21
  %23 = sext i32 %22 to i64
  %24 = load float*, float** %1, align 8
  %25 = getelementptr inbounds float, float* %24, i64 %23
  %26 = load float, float* %25, align 4
  store float %26, float* %ar, align 4
  %27 = load i32, i32* %i, align 4
  %28 = load i32, i32* %4, align 4
  %29 = mul nsw i32 %27, %28
  %30 = load i32, i32* %j, align 4
  %31 = load i32, i32* %5, align 4
  %32 = mul nsw i32 %30, %31
  %33 = add nsw i32 %29, %32
  %34 = sext i32 %33 to i64
  %35 = load float*, float** %2, align 8
  %36 = getelementptr inbounds float, float* %35, i64 %34
  %37 = load float, float* %36, align 4
  store float %37, float* %ai, align 4
  %38 = load i32, i32* %j, align 4
  %39 = load i32, i32* %4, align 4
  %40 = mul nsw i32 %38, %39
  %41 = load i32, i32* %i, align 4
  %42 = load i32, i32* %5, align 4
  %43 = mul nsw i32 %41, %42
  %44 = add nsw i32 %40, %43
  %45 = sext i32 %44 to i64
  %46 = load float*, float** %1, align 8
  %47 = getelementptr inbounds float, float* %46, i64 %45
  %48 = load float, float* %47, align 4
  store float %48, float* %br, align 4
  %49 = load i32, i32* %j, align 4
  %50 = load i32, i32* %4, align 4
  %51 = mul nsw i32 %49, %50
  %52 = load i32, i32* %i, align 4
  %53 = load i32, i32* %5, align 4
  %54 = mul nsw i32 %52, %53
  %55 = add nsw i32 %51, %54
  %56 = sext i32 %55 to i64
  %57 = load float*, float** %2, align 8
  %58 = getelementptr inbounds float, float* %57, i64 %56
  %59 = load float, float* %58, align 4
  store float %59, float* %bi, align 4
  %60 = load float, float* %ar, align 4
  %61 = load i32, i32* %j, align 4
  %62 = load i32, i32* %4, align 4
  %63 = mul nsw i32 %61, %62
  %64 = load i32, i32* %i, align 4
  %65 = load i32, i32* %5, align 4
  %66 = mul nsw i32 %64, %65
  %67 = add nsw i32 %63, %66
  %68 = sext i32 %67 to i64
  %69 = load float*, float** %1, align 8
  %70 = getelementptr inbounds float, float* %69, i64 %68
  store float %60, float* %70, align 4
  %71 = load float, float* %ai, align 4
  %72 = load i32, i32* %j, align 4
  %73 = load i32, i32* %4, align 4
  %74 = mul nsw i32 %72, %73
  %75 = load i32, i32* %i, align 4
  %76 = load i32, i32* %5, align 4
  %77 = mul nsw i32 %75, %76
  %78 = add nsw i32 %74, %77
  %79 = sext i32 %78 to i64
  %80 = load float*, float** %2, align 8
  %81 = getelementptr inbounds float, float* %80, i64 %79
  store float %71, float* %81, align 4
  %82 = load float, float* %br, align 4
  %83 = load i32, i32* %i, align 4
  %84 = load i32, i32* %4, align 4
  %85 = mul nsw i32 %83, %84
  %86 = load i32, i32* %j, align 4
  %87 = load i32, i32* %5, align 4
  %88 = mul nsw i32 %86, %87
  %89 = add nsw i32 %85, %88
  %90 = sext i32 %89 to i64
  %91 = load float*, float** %1, align 8
  %92 = getelementptr inbounds float, float* %91, i64 %90
  store float %82, float* %92, align 4
  %93 = load float, float* %bi, align 4
  %94 = load i32, i32* %i, align 4
  %95 = load i32, i32* %4, align 4
  %96 = mul nsw i32 %94, %95
  %97 = load i32, i32* %j, align 4
  %98 = load i32, i32* %5, align 4
  %99 = mul nsw i32 %97, %98
  %100 = add nsw i32 %96, %99
  %101 = sext i32 %100 to i64
  %102 = load float*, float** %2, align 8
  %103 = getelementptr inbounds float, float* %102, i64 %101
  store float %93, float* %103, align 4
  br label %104

; <label>:104                                     ; preds = %15
  %105 = load i32, i32* %j, align 4
  %106 = add nsw i32 %105, 1
  store i32 %106, i32* %j, align 4
  br label %11

; <label>:107                                     ; preds = %11
  br label %108

; <label>:108                                     ; preds = %107
  %109 = load i32, i32* %i, align 4
  %110 = add nsw i32 %109, 1
  store i32 %110, i32* %i, align 4
  br label %6

; <label>:111                                     ; preds = %6
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  %i = alloca i32, align 4
  %sum = alloca float, align 4
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  store float 0.000000e+00, float* %sum, align 4
  store i32 0, i32* %i, align 4
  br label %4

; <label>:4                                       ; preds = %19, %0
  %5 = load i32, i32* %i, align 4
  %6 = icmp slt i32 %5, 2048
  br i1 %6, label %7, label %22

; <label>:7                                       ; preds = %4
  %8 = load i32, i32* %i, align 4
  %9 = sitofp i32 %8 to float
  %10 = load i32, i32* %i, align 4
  %11 = sext i32 %10 to i64
  %12 = getelementptr inbounds [2048 x float], [2048 x float]* @A, i32 0, i64 %11
  store float %9, float* %12, align 4
  %13 = load float, float* %sum, align 4
  %14 = load i32, i32* %i, align 4
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds [2048 x float], [2048 x float]* @A, i32 0, i64 %15
  %17 = load float, float* %16, align 4
  %18 = fadd float %13, %17
  store float %18, float* %sum, align 4
  br label %19

; <label>:19                                      ; preds = %7
  %20 = load i32, i32* %i, align 4
  %21 = add nsw i32 %20, 1
  store i32 %21, i32* %i, align 4
  br label %4

; <label>:22                                      ; preds = %4
  %23 = load float, float* %sum, align 4
  %24 = fmul float 1.000000e+01, %23
  %25 = fptosi float %24 to i32
  %26 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str, i32 0, i32 0), i32 %25)
  store i32 0, i32* %i, align 4
  br label %27

; <label>:27                                      ; preds = %31, %22
  %28 = load i32, i32* %i, align 4
  %29 = icmp slt i32 %28, 10
  br i1 %29, label %30, label %34

; <label>:30                                      ; preds = %27
  call void @complex_transpose(float* getelementptr inbounds ([2048 x float], [2048 x float]* @A, i32 0, i32 0), float* getelementptr inbounds ([2048 x float], [2048 x float]* @A, i32 0, i64 1), i32 32, i32 2, i32 64)
  br label %31

; <label>:31                                      ; preds = %30
  %32 = load i32, i32* %i, align 4
  %33 = add nsw i32 %32, 1
  store i32 %33, i32* %i, align 4
  br label %27

; <label>:34                                      ; preds = %27
  store float 0.000000e+00, float* %sum, align 4
  store i32 0, i32* %i, align 4
  br label %35

; <label>:35                                      ; preds = %45, %34
  %36 = load i32, i32* %i, align 4
  %37 = icmp slt i32 %36, 2048
  br i1 %37, label %38, label %48

; <label>:38                                      ; preds = %35
  %39 = load float, float* %sum, align 4
  %40 = load i32, i32* %i, align 4
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds [2048 x float], [2048 x float]* @A, i32 0, i64 %41
  %43 = load float, float* %42, align 4
  %44 = fadd float %39, %43
  store float %44, float* %sum, align 4
  br label %45

; <label>:45                                      ; preds = %38
  %46 = load i32, i32* %i, align 4
  %47 = add nsw i32 %46, 1
  store i32 %47, i32* %i, align 4
  br label %35

; <label>:48                                      ; preds = %35
  %49 = load float, float* %sum, align 4
  %50 = fmul float 1.000000e+01, %49
  %51 = fptosi float %50 to i32
  %52 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1, i32 0, i32 0), i32 %51)
  ret i32 0
}

declare i32 @printf(i8*, ...) #1

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
