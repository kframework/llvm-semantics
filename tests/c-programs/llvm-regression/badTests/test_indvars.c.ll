; ModuleID = './test_indvars.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Checksum = %.0lf\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %Array = alloca [100 x [200 x i32]], align 16
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %sum = alloca double, align 8
  store i32 0, i32* %1
  store double 0.000000e+00, double* %sum, align 8
  store i32 0, i32* %i, align 4
  br label %2

; <label>:2                                       ; preds = %20, %0
  %3 = load i32, i32* %i, align 4
  %4 = icmp slt i32 %3, 100
  br i1 %4, label %5, label %23

; <label>:5                                       ; preds = %2
  store i32 0, i32* %j, align 4
  br label %6

; <label>:6                                       ; preds = %16, %5
  %7 = load i32, i32* %j, align 4
  %8 = icmp slt i32 %7, 200
  br i1 %8, label %9, label %19

; <label>:9                                       ; preds = %6
  %10 = load i32, i32* %j, align 4
  %11 = sext i32 %10 to i64
  %12 = load i32, i32* %i, align 4
  %13 = sext i32 %12 to i64
  %14 = getelementptr inbounds [100 x [200 x i32]], [100 x [200 x i32]]* %Array, i32 0, i64 %13
  %15 = getelementptr inbounds [200 x i32], [200 x i32]* %14, i32 0, i64 %11
  store i32 0, i32* %15, align 4
  br label %16

; <label>:16                                      ; preds = %9
  %17 = load i32, i32* %j, align 4
  %18 = add nsw i32 %17, 1
  store i32 %18, i32* %j, align 4
  br label %6

; <label>:19                                      ; preds = %6
  br label %20

; <label>:20                                      ; preds = %19
  %21 = load i32, i32* %i, align 4
  %22 = add nsw i32 %21, 2
  store i32 %22, i32* %i, align 4
  br label %2

; <label>:23                                      ; preds = %2
  %24 = getelementptr inbounds [100 x [200 x i32]], [100 x [200 x i32]]* %Array, i32 0, i64 0
  %25 = getelementptr inbounds [200 x i32], [200 x i32]* %24, i32 0, i32 0
  %26 = getelementptr inbounds [100 x [200 x i32]], [100 x [200 x i32]]* %Array, i32 0, i32 0
  call void @test_indvars(i32* %25, [200 x i32]* %26)
  store i32 0, i32* %i, align 4
  br label %27

; <label>:27                                      ; preds = %49, %23
  %28 = load i32, i32* %i, align 4
  %29 = icmp slt i32 %28, 100
  br i1 %29, label %30, label %52

; <label>:30                                      ; preds = %27
  store i32 0, i32* %j, align 4
  br label %31

; <label>:31                                      ; preds = %45, %30
  %32 = load i32, i32* %j, align 4
  %33 = icmp slt i32 %32, 200
  br i1 %33, label %34, label %48

; <label>:34                                      ; preds = %31
  %35 = load i32, i32* %j, align 4
  %36 = sext i32 %35 to i64
  %37 = load i32, i32* %i, align 4
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds [100 x [200 x i32]], [100 x [200 x i32]]* %Array, i32 0, i64 %38
  %40 = getelementptr inbounds [200 x i32], [200 x i32]* %39, i32 0, i64 %36
  %41 = load i32, i32* %40, align 4
  %42 = sitofp i32 %41 to double
  %43 = load double, double* %sum, align 8
  %44 = fadd double %43, %42
  store double %44, double* %sum, align 8
  br label %45

; <label>:45                                      ; preds = %34
  %46 = load i32, i32* %j, align 4
  %47 = add nsw i32 %46, 1
  store i32 %47, i32* %j, align 4
  br label %31

; <label>:48                                      ; preds = %31
  br label %49

; <label>:49                                      ; preds = %48
  %50 = load i32, i32* %i, align 4
  %51 = add nsw i32 %50, 2
  store i32 %51, i32* %i, align 4
  br label %27

; <label>:52                                      ; preds = %27
  %53 = load double, double* %sum, align 8
  %54 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i32 0, i32 0), double %53)
  ret i32 0
}

; Function Attrs: nounwind uwtable
define internal void @test_indvars(i32* %Array1, [200 x i32]* %Array2) #0 {
  %1 = alloca i32*, align 8
  %2 = alloca [200 x i32]*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32* %Array1, i32** %1, align 8
  store [200 x i32]* %Array2, [200 x i32]** %2, align 8
  %3 = load [200 x i32]*, [200 x i32]** %2, align 8
  %4 = getelementptr inbounds [200 x i32], [200 x i32]* %3, i64 3
  %5 = getelementptr inbounds [200 x i32], [200 x i32]* %4, i32 0, i64 6
  store i32 12345, i32* %5, align 4
  %6 = load i32*, i32** %1, align 8
  %7 = getelementptr inbounds i32, i32* %6, i64 1
  store i32 12345, i32* %7, align 4
  store i32 0, i32* %i, align 4
  br label %8

; <label>:8                                       ; preds = %17, %0
  %9 = load i32, i32* %i, align 4
  %10 = icmp ult i32 %9, 100
  br i1 %10, label %11, label %20

; <label>:11                                      ; preds = %8
  %12 = load i32, i32* %i, align 4
  %13 = load i32, i32* %i, align 4
  %14 = zext i32 %13 to i64
  %15 = load i32*, i32** %1, align 8
  %16 = getelementptr inbounds i32, i32* %15, i64 %14
  store i32 %12, i32* %16, align 4
  br label %17

; <label>:17                                      ; preds = %11
  %18 = load i32, i32* %i, align 4
  %19 = add i32 %18, 2
  store i32 %19, i32* %i, align 4
  br label %8

; <label>:20                                      ; preds = %8
  store i32 3, i32* %i, align 4
  br label %21

; <label>:21                                      ; preds = %31, %20
  %22 = load i32, i32* %i, align 4
  %23 = icmp ult i32 %22, 103
  br i1 %23, label %24, label %34

; <label>:24                                      ; preds = %21
  %25 = load i32, i32* %i, align 4
  %26 = add i32 %25, 4
  %27 = load i32, i32* %i, align 4
  %28 = zext i32 %27 to i64
  %29 = load i32*, i32** %1, align 8
  %30 = getelementptr inbounds i32, i32* %29, i64 %28
  store i32 %26, i32* %30, align 4
  br label %31

; <label>:31                                      ; preds = %24
  %32 = load i32, i32* %i, align 4
  %33 = add i32 %32, 1
  store i32 %33, i32* %i, align 4
  br label %21

; <label>:34                                      ; preds = %21
  store i32 13, i32* %i, align 4
  br label %35

; <label>:35                                      ; preds = %63, %34
  %36 = load i32, i32* %i, align 4
  %37 = icmp ult i32 %36, 100
  br i1 %37, label %38, label %66

; <label>:38                                      ; preds = %35
  store i32 0, i32* %j, align 4
  br label %39

; <label>:39                                      ; preds = %59, %38
  %40 = load i32, i32* %j, align 4
  %41 = icmp ult i32 %40, 100
  br i1 %41, label %42, label %62

; <label>:42                                      ; preds = %39
  %43 = load i32, i32* %i, align 4
  %44 = zext i32 %43 to i64
  %45 = load i32, i32* %i, align 4
  %46 = zext i32 %45 to i64
  %47 = load [200 x i32]*, [200 x i32]** %2, align 8
  %48 = getelementptr inbounds [200 x i32], [200 x i32]* %47, i64 %46
  %49 = getelementptr inbounds [200 x i32], [200 x i32]* %48, i32 0, i64 %44
  %50 = load i32, i32* %49, align 4
  %51 = load i32, i32* %j, align 4
  %52 = udiv i32 %51, 3
  %53 = zext i32 %52 to i64
  %54 = load i32, i32* %i, align 4
  %55 = zext i32 %54 to i64
  %56 = load [200 x i32]*, [200 x i32]** %2, align 8
  %57 = getelementptr inbounds [200 x i32], [200 x i32]* %56, i64 %55
  %58 = getelementptr inbounds [200 x i32], [200 x i32]* %57, i32 0, i64 %53
  store i32 %50, i32* %58, align 4
  br label %59

; <label>:59                                      ; preds = %42
  %60 = load i32, i32* %j, align 4
  %61 = add i32 %60, 3
  store i32 %61, i32* %j, align 4
  br label %39

; <label>:62                                      ; preds = %39
  br label %63

; <label>:63                                      ; preds = %62
  %64 = load i32, i32* %i, align 4
  %65 = add i32 %64, 1
  store i32 %65, i32* %i, align 4
  br label %35

; <label>:66                                      ; preds = %35
  ret void
}

declare i32 @printf(i8*, ...) #1

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
