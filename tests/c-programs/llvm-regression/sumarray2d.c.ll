; ModuleID = './sumarray2d.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [23 x i8] c"Sum(Array[%d,%d] = %d\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @SumArray([10 x i32]* %Array, i32 %NumI, i32 %NumJ) #0 {
  %1 = alloca [10 x i32]*, align 8
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %Result = alloca i32, align 4
  store [10 x i32]* %Array, [10 x i32]** %1, align 8
  store i32 %NumI, i32* %2, align 4
  store i32 %NumJ, i32* %3, align 4
  store i32 0, i32* %Result, align 4
  store i32 0, i32* %i, align 4
  br label %4

; <label>:4                                       ; preds = %28, %0
  %5 = load i32, i32* %i, align 4
  %6 = load i32, i32* %2, align 4
  %7 = icmp ult i32 %5, %6
  br i1 %7, label %8, label %31

; <label>:8                                       ; preds = %4
  store i32 0, i32* %j, align 4
  br label %9

; <label>:9                                       ; preds = %24, %8
  %10 = load i32, i32* %j, align 4
  %11 = load i32, i32* %3, align 4
  %12 = icmp ult i32 %10, %11
  br i1 %12, label %13, label %27

; <label>:13                                      ; preds = %9
  %14 = load i32, i32* %j, align 4
  %15 = zext i32 %14 to i64
  %16 = load i32, i32* %i, align 4
  %17 = zext i32 %16 to i64
  %18 = load [10 x i32]*, [10 x i32]** %1, align 8
  %19 = getelementptr inbounds [10 x i32], [10 x i32]* %18, i64 %17
  %20 = getelementptr inbounds [10 x i32], [10 x i32]* %19, i32 0, i64 %15
  %21 = load i32, i32* %20, align 4
  %22 = load i32, i32* %Result, align 4
  %23 = add nsw i32 %22, %21
  store i32 %23, i32* %Result, align 4
  br label %24

; <label>:24                                      ; preds = %13
  %25 = load i32, i32* %j, align 4
  %26 = add i32 %25, 1
  store i32 %26, i32* %j, align 4
  br label %9

; <label>:27                                      ; preds = %9
  br label %28

; <label>:28                                      ; preds = %27
  %29 = load i32, i32* %i, align 4
  %30 = add i32 %29, 1
  store i32 %30, i32* %i, align 4
  br label %4

; <label>:31                                      ; preds = %4
  %32 = load i32, i32* %Result, align 4
  ret i32 %32
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %Array = alloca [10 x [10 x i32]], align 16
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 0, i32* %1
  store i32 0, i32* %i, align 4
  br label %2

; <label>:2                                       ; preds = %14, %0
  %3 = load i32, i32* %i, align 4
  %4 = icmp ult i32 %3, 10
  br i1 %4, label %5, label %17

; <label>:5                                       ; preds = %2
  %6 = load i32, i32* %i, align 4
  %7 = sub i32 0, %6
  %8 = load i32, i32* %i, align 4
  %9 = zext i32 %8 to i64
  %10 = load i32, i32* %i, align 4
  %11 = zext i32 %10 to i64
  %12 = getelementptr inbounds [10 x [10 x i32]], [10 x [10 x i32]]* %Array, i32 0, i64 %11
  %13 = getelementptr inbounds [10 x i32], [10 x i32]* %12, i32 0, i64 %9
  store i32 %7, i32* %13, align 4
  br label %14

; <label>:14                                      ; preds = %5
  %15 = load i32, i32* %i, align 4
  %16 = add i32 %15, 1
  store i32 %16, i32* %i, align 4
  br label %2

; <label>:17                                      ; preds = %2
  store i32 0, i32* %i, align 4
  br label %18

; <label>:18                                      ; preds = %44, %17
  %19 = load i32, i32* %i, align 4
  %20 = icmp ult i32 %19, 10
  br i1 %20, label %21, label %47

; <label>:21                                      ; preds = %18
  store i32 0, i32* %j, align 4
  br label %22

; <label>:22                                      ; preds = %40, %21
  %23 = load i32, i32* %j, align 4
  %24 = icmp ult i32 %23, 10
  br i1 %24, label %25, label %43

; <label>:25                                      ; preds = %22
  %26 = load i32, i32* %j, align 4
  %27 = load i32, i32* %i, align 4
  %28 = icmp ne i32 %26, %27
  br i1 %28, label %29, label %39

; <label>:29                                      ; preds = %25
  %30 = load i32, i32* %i, align 4
  %31 = load i32, i32* %j, align 4
  %32 = add i32 %30, %31
  %33 = load i32, i32* %j, align 4
  %34 = zext i32 %33 to i64
  %35 = load i32, i32* %i, align 4
  %36 = zext i32 %35 to i64
  %37 = getelementptr inbounds [10 x [10 x i32]], [10 x [10 x i32]]* %Array, i32 0, i64 %36
  %38 = getelementptr inbounds [10 x i32], [10 x i32]* %37, i32 0, i64 %34
  store i32 %32, i32* %38, align 4
  br label %39

; <label>:39                                      ; preds = %29, %25
  br label %40

; <label>:40                                      ; preds = %39
  %41 = load i32, i32* %j, align 4
  %42 = add i32 %41, 1
  store i32 %42, i32* %j, align 4
  br label %22

; <label>:43                                      ; preds = %22
  br label %44

; <label>:44                                      ; preds = %43
  %45 = load i32, i32* %i, align 4
  %46 = add i32 %45, 1
  store i32 %46, i32* %i, align 4
  br label %18

; <label>:47                                      ; preds = %18
  %48 = getelementptr inbounds [10 x [10 x i32]], [10 x [10 x i32]]* %Array, i32 0, i32 0
  %49 = call i32 @SumArray([10 x i32]* %48, i32 10, i32 10)
  %50 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str, i32 0, i32 0), i32 10, i32 10, i32 %49)
  ret i32 0
}

declare i32 @printf(i8*, ...) #1

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
