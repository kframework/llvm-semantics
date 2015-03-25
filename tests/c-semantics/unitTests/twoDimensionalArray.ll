; ModuleID = './twoDimensionalArray.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %a = alloca [3 x [2 x i32]], align 16
  store i32 0, i32* %1
  %2 = getelementptr inbounds [3 x [2 x i32]]* %a, i32 0, i64 0
  %3 = getelementptr inbounds [2 x i32]* %2, i32 0, i64 0
  store i32 5, i32* %3, align 4
  %4 = getelementptr inbounds [3 x [2 x i32]]* %a, i32 0, i64 0
  %5 = getelementptr inbounds [2 x i32]* %4, i32 0, i64 1
  store i32 6, i32* %5, align 4
  %6 = getelementptr inbounds [3 x [2 x i32]]* %a, i32 0, i64 1
  %7 = getelementptr inbounds [2 x i32]* %6, i32 0, i64 0
  store i32 7, i32* %7, align 4
  %8 = getelementptr inbounds [3 x [2 x i32]]* %a, i32 0, i64 1
  %9 = getelementptr inbounds [2 x i32]* %8, i32 0, i64 1
  store i32 8, i32* %9, align 4
  %10 = getelementptr inbounds [3 x [2 x i32]]* %a, i32 0, i64 2
  %11 = getelementptr inbounds [2 x i32]* %10, i32 0, i64 0
  store i32 9, i32* %11, align 4
  %12 = getelementptr inbounds [3 x [2 x i32]]* %a, i32 0, i64 2
  %13 = getelementptr inbounds [2 x i32]* %12, i32 0, i64 1
  store i32 10, i32* %13, align 4
  %14 = getelementptr inbounds [3 x [2 x i32]]* %a, i32 0, i64 0
  %15 = getelementptr inbounds [2 x i32]* %14, i32 0, i64 0
  %16 = load i32* %15, align 4
  %17 = icmp ne i32 %16, 5
  br i1 %17, label %18, label %19

; <label>:18                                      ; preds = %0
  store i32 5, i32* %1
  br label %50

; <label>:19                                      ; preds = %0
  %20 = getelementptr inbounds [3 x [2 x i32]]* %a, i32 0, i64 0
  %21 = getelementptr inbounds [2 x i32]* %20, i32 0, i64 1
  %22 = load i32* %21, align 4
  %23 = icmp ne i32 %22, 6
  br i1 %23, label %24, label %25

; <label>:24                                      ; preds = %19
  store i32 6, i32* %1
  br label %50

; <label>:25                                      ; preds = %19
  %26 = getelementptr inbounds [3 x [2 x i32]]* %a, i32 0, i64 1
  %27 = getelementptr inbounds [2 x i32]* %26, i32 0, i64 0
  %28 = load i32* %27, align 4
  %29 = icmp ne i32 %28, 7
  br i1 %29, label %30, label %31

; <label>:30                                      ; preds = %25
  store i32 7, i32* %1
  br label %50

; <label>:31                                      ; preds = %25
  %32 = getelementptr inbounds [3 x [2 x i32]]* %a, i32 0, i64 1
  %33 = getelementptr inbounds [2 x i32]* %32, i32 0, i64 1
  %34 = load i32* %33, align 4
  %35 = icmp ne i32 %34, 8
  br i1 %35, label %36, label %37

; <label>:36                                      ; preds = %31
  store i32 8, i32* %1
  br label %50

; <label>:37                                      ; preds = %31
  %38 = getelementptr inbounds [3 x [2 x i32]]* %a, i32 0, i64 2
  %39 = getelementptr inbounds [2 x i32]* %38, i32 0, i64 0
  %40 = load i32* %39, align 4
  %41 = icmp ne i32 %40, 9
  br i1 %41, label %42, label %43

; <label>:42                                      ; preds = %37
  store i32 9, i32* %1
  br label %50

; <label>:43                                      ; preds = %37
  %44 = getelementptr inbounds [3 x [2 x i32]]* %a, i32 0, i64 2
  %45 = getelementptr inbounds [2 x i32]* %44, i32 0, i64 1
  %46 = load i32* %45, align 4
  %47 = icmp ne i32 %46, 10
  br i1 %47, label %48, label %49

; <label>:48                                      ; preds = %43
  store i32 10, i32* %1
  br label %50

; <label>:49                                      ; preds = %43
  store i32 0, i32* %1
  br label %50

; <label>:50                                      ; preds = %49, %48, %42, %36, %30, %24, %18
  %51 = load i32* %1
  ret i32 %51
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
