; ModuleID = './test48.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.fun = type { i32, i32 }

@a = common global [10 x [20 x %struct.fun]] zeroinitializer, align 16
@b = global [20 x %struct.fun]* getelementptr inbounds ([10 x [20 x %struct.fun]]* @a, i32 0, i32 0), align 8
@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @f() #0 {
  %i = alloca i32, align 4
  %sum1 = alloca i32, align 4
  %sum2 = alloca i32, align 4
  store i32 0, i32* %sum1, align 4
  store i32 0, i32* %sum2, align 4
  store i32 0, i32* %i, align 4
  br label %1

; <label>:1                                       ; preds = %13, %0
  %2 = load i32* %i, align 4
  %3 = icmp slt i32 %2, 20
  br i1 %3, label %4, label %16

; <label>:4                                       ; preds = %1
  %5 = load i32* %i, align 4
  %6 = mul nsw i32 %5, 2
  %7 = load i32* %i, align 4
  %8 = sext i32 %7 to i64
  %9 = load [20 x %struct.fun]** @b, align 8
  %10 = getelementptr inbounds [20 x %struct.fun]* %9, i64 1
  %11 = getelementptr inbounds [20 x %struct.fun]* %10, i32 0, i64 %8
  %12 = getelementptr inbounds %struct.fun* %11, i32 0, i32 0
  store i32 %6, i32* %12, align 4
  br label %13

; <label>:13                                      ; preds = %4
  %14 = load i32* %i, align 4
  %15 = add nsw i32 %14, 1
  store i32 %15, i32* %i, align 4
  br label %1

; <label>:16                                      ; preds = %1
  store i32 5, i32* %i, align 4
  br label %17

; <label>:17                                      ; preds = %28, %16
  %18 = load i32* %i, align 4
  %19 = icmp slt i32 %18, 15
  br i1 %19, label %20, label %31

; <label>:20                                      ; preds = %17
  %21 = load i32* %i, align 4
  %22 = sext i32 %21 to i64
  %23 = getelementptr inbounds [20 x %struct.fun]* getelementptr inbounds ([10 x [20 x %struct.fun]]* @a, i32 0, i64 1), i32 0, i64 %22
  %24 = getelementptr inbounds %struct.fun* %23, i32 0, i32 0
  %25 = load i32* %24, align 4
  %26 = load i32* %sum1, align 4
  %27 = add nsw i32 %26, %25
  store i32 %27, i32* %sum1, align 4
  br label %28

; <label>:28                                      ; preds = %20
  %29 = load i32* %i, align 4
  %30 = add nsw i32 %29, 1
  store i32 %30, i32* %i, align 4
  br label %17

; <label>:31                                      ; preds = %17
  store i32 5, i32* %i, align 4
  br label %32

; <label>:32                                      ; preds = %45, %31
  %33 = load i32* %i, align 4
  %34 = icmp slt i32 %33, 15
  br i1 %34, label %35, label %48

; <label>:35                                      ; preds = %32
  %36 = load i32* %i, align 4
  %37 = sext i32 %36 to i64
  %38 = load [20 x %struct.fun]** @b, align 8
  %39 = getelementptr inbounds [20 x %struct.fun]* %38, i64 1
  %40 = getelementptr inbounds [20 x %struct.fun]* %39, i32 0, i64 %37
  %41 = getelementptr inbounds %struct.fun* %40, i32 0, i32 0
  %42 = load i32* %41, align 4
  %43 = load i32* %sum2, align 4
  %44 = add nsw i32 %43, %42
  store i32 %44, i32* %sum2, align 4
  br label %45

; <label>:45                                      ; preds = %35
  %46 = load i32* %i, align 4
  %47 = add nsw i32 %46, 1
  store i32 %47, i32* %i, align 4
  br label %32

; <label>:48                                      ; preds = %32
  %49 = load i32* %sum1, align 4
  %50 = load i32* %sum2, align 4
  %51 = icmp eq i32 %49, %50
  %52 = zext i1 %51 to i32
  ret i32 %52
}

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  %zz = alloca i32, align 4
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  %4 = call i32 @f()
  store i32 %4, i32* %zz, align 4
  %5 = load i32* %zz, align 4
  %6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %5)
  ret i32 0
}

declare i32 @printf(i8*, ...) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
