; ModuleID = './bigstack.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.Mixed_struct = type { i32, [10 x double], [10 x [10 x double]], [10 x %struct.Flat_struct] }
%struct.Flat_struct = type { i8, float }

@.str = private unnamed_addr constant [14 x i8] c"Sum(M)  = %d\0A\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Sum(MA[%d]) = %d\0A\00", align 1

; Function Attrs: nounwind uwtable
define double @AddMixed(%struct.Mixed_struct* %M) #0 {
  %1 = alloca %struct.Mixed_struct*, align 8
  %sum = alloca double, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store %struct.Mixed_struct* %M, %struct.Mixed_struct** %1, align 8
  store double 0.000000e+00, double* %sum, align 8
  store i32 0, i32* %i, align 4
  br label %2

; <label>:2                                       ; preds = %14, %0
  %3 = load i32, i32* %i, align 4
  %4 = icmp slt i32 %3, 10
  br i1 %4, label %5, label %17

; <label>:5                                       ; preds = %2
  %6 = load i32, i32* %i, align 4
  %7 = sext i32 %6 to i64
  %8 = load %struct.Mixed_struct*, %struct.Mixed_struct** %1, align 8
  %9 = getelementptr inbounds %struct.Mixed_struct, %struct.Mixed_struct* %8, i32 0, i32 1
  %10 = getelementptr inbounds [10 x double], [10 x double]* %9, i32 0, i64 %7
  %11 = load double, double* %10, align 8
  %12 = load double, double* %sum, align 8
  %13 = fadd double %12, %11
  store double %13, double* %sum, align 8
  br label %14

; <label>:14                                      ; preds = %5
  %15 = load i32, i32* %i, align 4
  %16 = add nsw i32 %15, 1
  store i32 %16, i32* %i, align 4
  br label %2

; <label>:17                                      ; preds = %2
  store i32 0, i32* %i, align 4
  br label %18

; <label>:18                                      ; preds = %41, %17
  %19 = load i32, i32* %i, align 4
  %20 = icmp slt i32 %19, 10
  br i1 %20, label %21, label %44

; <label>:21                                      ; preds = %18
  store i32 0, i32* %j, align 4
  br label %22

; <label>:22                                      ; preds = %37, %21
  %23 = load i32, i32* %j, align 4
  %24 = icmp slt i32 %23, 10
  br i1 %24, label %25, label %40

; <label>:25                                      ; preds = %22
  %26 = load i32, i32* %j, align 4
  %27 = sext i32 %26 to i64
  %28 = load i32, i32* %i, align 4
  %29 = sext i32 %28 to i64
  %30 = load %struct.Mixed_struct*, %struct.Mixed_struct** %1, align 8
  %31 = getelementptr inbounds %struct.Mixed_struct, %struct.Mixed_struct* %30, i32 0, i32 2
  %32 = getelementptr inbounds [10 x [10 x double]], [10 x [10 x double]]* %31, i32 0, i64 %29
  %33 = getelementptr inbounds [10 x double], [10 x double]* %32, i32 0, i64 %27
  %34 = load double, double* %33, align 8
  %35 = load double, double* %sum, align 8
  %36 = fadd double %35, %34
  store double %36, double* %sum, align 8
  br label %37

; <label>:37                                      ; preds = %25
  %38 = load i32, i32* %j, align 4
  %39 = add nsw i32 %38, 1
  store i32 %39, i32* %j, align 4
  br label %22

; <label>:40                                      ; preds = %22
  br label %41

; <label>:41                                      ; preds = %40
  %42 = load i32, i32* %i, align 4
  %43 = add nsw i32 %42, 1
  store i32 %43, i32* %i, align 4
  br label %18

; <label>:44                                      ; preds = %18
  store i32 0, i32* %i, align 4
  br label %45

; <label>:45                                      ; preds = %69, %44
  %46 = load i32, i32* %i, align 4
  %47 = icmp slt i32 %46, 10
  br i1 %47, label %48, label %72

; <label>:48                                      ; preds = %45
  %49 = load i32, i32* %i, align 4
  %50 = sext i32 %49 to i64
  %51 = load %struct.Mixed_struct*, %struct.Mixed_struct** %1, align 8
  %52 = getelementptr inbounds %struct.Mixed_struct, %struct.Mixed_struct* %51, i32 0, i32 3
  %53 = getelementptr inbounds [10 x %struct.Flat_struct], [10 x %struct.Flat_struct]* %52, i32 0, i64 %50
  %54 = getelementptr inbounds %struct.Flat_struct, %struct.Flat_struct* %53, i32 0, i32 0
  %55 = load i8, i8* %54, align 1
  %56 = sitofp i8 %55 to double
  %57 = load double, double* %sum, align 8
  %58 = fadd double %57, %56
  store double %58, double* %sum, align 8
  %59 = load i32, i32* %i, align 4
  %60 = sext i32 %59 to i64
  %61 = load %struct.Mixed_struct*, %struct.Mixed_struct** %1, align 8
  %62 = getelementptr inbounds %struct.Mixed_struct, %struct.Mixed_struct* %61, i32 0, i32 3
  %63 = getelementptr inbounds [10 x %struct.Flat_struct], [10 x %struct.Flat_struct]* %62, i32 0, i64 %60
  %64 = getelementptr inbounds %struct.Flat_struct, %struct.Flat_struct* %63, i32 0, i32 1
  %65 = load float, float* %64, align 4
  %66 = fpext float %65 to double
  %67 = load double, double* %sum, align 8
  %68 = fadd double %67, %66
  store double %68, double* %sum, align 8
  br label %69

; <label>:69                                      ; preds = %48
  %70 = load i32, i32* %i, align 4
  %71 = add nsw i32 %70, 1
  store i32 %71, i32* %i, align 4
  br label %45

; <label>:72                                      ; preds = %45
  %73 = load double, double* %sum, align 8
  ret double %73
}

; Function Attrs: nounwind uwtable
define void @InitializeMixed(%struct.Mixed_struct* %M, i32 %base) #0 {
  %1 = alloca %struct.Mixed_struct*, align 8
  %2 = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store %struct.Mixed_struct* %M, %struct.Mixed_struct** %1, align 8
  store i32 %base, i32* %2, align 4
  store i32 0, i32* %i, align 4
  br label %3

; <label>:3                                       ; preds = %16, %0
  %4 = load i32, i32* %i, align 4
  %5 = icmp slt i32 %4, 10
  br i1 %5, label %6, label %19

; <label>:6                                       ; preds = %3
  %7 = load i32, i32* %i, align 4
  %8 = load i32, i32* %2, align 4
  %9 = add nsw i32 %7, %8
  %10 = sitofp i32 %9 to double
  %11 = load i32, i32* %i, align 4
  %12 = sext i32 %11 to i64
  %13 = load %struct.Mixed_struct*, %struct.Mixed_struct** %1, align 8
  %14 = getelementptr inbounds %struct.Mixed_struct, %struct.Mixed_struct* %13, i32 0, i32 1
  %15 = getelementptr inbounds [10 x double], [10 x double]* %14, i32 0, i64 %12
  store double %10, double* %15, align 8
  br label %16

; <label>:16                                      ; preds = %6
  %17 = load i32, i32* %i, align 4
  %18 = add nsw i32 %17, 1
  store i32 %18, i32* %i, align 4
  br label %3

; <label>:19                                      ; preds = %3
  store i32 0, i32* %i, align 4
  br label %20

; <label>:20                                      ; preds = %47, %19
  %21 = load i32, i32* %i, align 4
  %22 = icmp slt i32 %21, 10
  br i1 %22, label %23, label %50

; <label>:23                                      ; preds = %20
  store i32 0, i32* %j, align 4
  br label %24

; <label>:24                                      ; preds = %43, %23
  %25 = load i32, i32* %j, align 4
  %26 = icmp slt i32 %25, 10
  br i1 %26, label %27, label %46

; <label>:27                                      ; preds = %24
  %28 = load i32, i32* %i, align 4
  %29 = mul nsw i32 %28, 10
  %30 = load i32, i32* %j, align 4
  %31 = add nsw i32 %29, %30
  %32 = load i32, i32* %2, align 4
  %33 = add nsw i32 %31, %32
  %34 = sitofp i32 %33 to double
  %35 = load i32, i32* %j, align 4
  %36 = sext i32 %35 to i64
  %37 = load i32, i32* %i, align 4
  %38 = sext i32 %37 to i64
  %39 = load %struct.Mixed_struct*, %struct.Mixed_struct** %1, align 8
  %40 = getelementptr inbounds %struct.Mixed_struct, %struct.Mixed_struct* %39, i32 0, i32 2
  %41 = getelementptr inbounds [10 x [10 x double]], [10 x [10 x double]]* %40, i32 0, i64 %38
  %42 = getelementptr inbounds [10 x double], [10 x double]* %41, i32 0, i64 %36
  store double %34, double* %42, align 8
  br label %43

; <label>:43                                      ; preds = %27
  %44 = load i32, i32* %j, align 4
  %45 = add nsw i32 %44, 1
  store i32 %45, i32* %j, align 4
  br label %24

; <label>:46                                      ; preds = %24
  br label %47

; <label>:47                                      ; preds = %46
  %48 = load i32, i32* %i, align 4
  %49 = add nsw i32 %48, 1
  store i32 %49, i32* %i, align 4
  br label %20

; <label>:50                                      ; preds = %20
  store i32 0, i32* %i, align 4
  br label %51

; <label>:51                                      ; preds = %72, %50
  %52 = load i32, i32* %i, align 4
  %53 = icmp slt i32 %52, 10
  br i1 %53, label %54, label %75

; <label>:54                                      ; preds = %51
  %55 = load i32, i32* %i, align 4
  %56 = sext i32 %55 to i64
  %57 = load %struct.Mixed_struct*, %struct.Mixed_struct** %1, align 8
  %58 = getelementptr inbounds %struct.Mixed_struct, %struct.Mixed_struct* %57, i32 0, i32 3
  %59 = getelementptr inbounds [10 x %struct.Flat_struct], [10 x %struct.Flat_struct]* %58, i32 0, i64 %56
  %60 = getelementptr inbounds %struct.Flat_struct, %struct.Flat_struct* %59, i32 0, i32 0
  store i8 81, i8* %60, align 1
  %61 = load i32, i32* %i, align 4
  %62 = sdiv i32 %61, 10
  %63 = load i32, i32* %2, align 4
  %64 = add nsw i32 %62, %63
  %65 = sitofp i32 %64 to float
  %66 = load i32, i32* %i, align 4
  %67 = sext i32 %66 to i64
  %68 = load %struct.Mixed_struct*, %struct.Mixed_struct** %1, align 8
  %69 = getelementptr inbounds %struct.Mixed_struct, %struct.Mixed_struct* %68, i32 0, i32 3
  %70 = getelementptr inbounds [10 x %struct.Flat_struct], [10 x %struct.Flat_struct]* %69, i32 0, i64 %67
  %71 = getelementptr inbounds %struct.Flat_struct, %struct.Flat_struct* %70, i32 0, i32 1
  store float %65, float* %71, align 4
  br label %72

; <label>:72                                      ; preds = %54
  %73 = load i32, i32* %i, align 4
  %74 = add nsw i32 %73, 1
  store i32 %74, i32* %i, align 4
  br label %51

; <label>:75                                      ; preds = %51
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  %M = alloca %struct.Mixed_struct, align 8
  %MA = alloca [4 x %struct.Mixed_struct], align 16
  %i = alloca i32, align 4
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  call void @InitializeMixed(%struct.Mixed_struct* %M, i32 100)
  %4 = call double @AddMixed(%struct.Mixed_struct* %M)
  %5 = fmul double 1.000000e+04, %4
  %6 = fptosi double %5 to i32
  %7 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str, i32 0, i32 0), i32 %6)
  store i32 0, i32* %i, align 4
  br label %8

; <label>:8                                       ; preds = %26, %0
  %9 = load i32, i32* %i, align 4
  %10 = icmp slt i32 %9, 4
  br i1 %10, label %11, label %29

; <label>:11                                      ; preds = %8
  %12 = load i32, i32* %i, align 4
  %13 = sext i32 %12 to i64
  %14 = getelementptr inbounds [4 x %struct.Mixed_struct], [4 x %struct.Mixed_struct]* %MA, i32 0, i64 %13
  %15 = load i32, i32* %i, align 4
  %16 = add nsw i32 %15, 2
  %17 = mul nsw i32 100, %16
  call void @InitializeMixed(%struct.Mixed_struct* %14, i32 %17)
  %18 = load i32, i32* %i, align 4
  %19 = load i32, i32* %i, align 4
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds [4 x %struct.Mixed_struct], [4 x %struct.Mixed_struct]* %MA, i32 0, i64 %20
  %22 = call double @AddMixed(%struct.Mixed_struct* %21)
  %23 = fmul double 1.000000e+04, %22
  %24 = fptosi double %23 to i32
  %25 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i32 0, i32 0), i32 %18, i32 %24)
  br label %26

; <label>:26                                      ; preds = %11
  %27 = load i32, i32* %i, align 4
  %28 = add nsw i32 %27, 1
  store i32 %28, i32* %i, align 4
  br label %8

; <label>:29                                      ; preds = %8
  ret i32 0
}

declare i32 @printf(i8*, ...) #1

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
