; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith000176.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable {
  %l_2 = alloca [7 x [5 x [1 x [1 x i64]]]], align 16
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %l = alloca i32, align 4
  store i32 0, i32* %i, align 4
  br label %1

; <label>:1                                       ; preds = %41, %0
  %2 = load i32* %i, align 4
  %3 = icmp slt i32 %2, 7
  br i1 %3, label %4, label %44

; <label>:4                                       ; preds = %1
  store i32 0, i32* %j, align 4
  br label %5

; <label>:5                                       ; preds = %37, %4
  %6 = load i32* %j, align 4
  %7 = icmp slt i32 %6, 5
  br i1 %7, label %8, label %40

; <label>:8                                       ; preds = %5
  store i32 0, i32* %k, align 4
  br label %9

; <label>:9                                       ; preds = %33, %8
  %10 = load i32* %k, align 4
  %11 = icmp slt i32 %10, 1
  br i1 %11, label %12, label %36

; <label>:12                                      ; preds = %9
  store i32 0, i32* %l, align 4
  br label %13

; <label>:13                                      ; preds = %29, %12
  %14 = load i32* %l, align 4
  %15 = icmp slt i32 %14, 1
  br i1 %15, label %16, label %32

; <label>:16                                      ; preds = %13
  %17 = load i32* %l, align 4
  %18 = sext i32 %17 to i64
  %19 = load i32* %k, align 4
  %20 = sext i32 %19 to i64
  %21 = load i32* %j, align 4
  %22 = sext i32 %21 to i64
  %23 = load i32* %i, align 4
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds [7 x [5 x [1 x [1 x i64]]]]* %l_2, i32 0, i64 %24
  %26 = getelementptr inbounds [5 x [1 x [1 x i64]]]* %25, i32 0, i64 %22
  %27 = getelementptr inbounds [1 x [1 x i64]]* %26, i32 0, i64 %20
  %28 = getelementptr inbounds [1 x i64]* %27, i32 0, i64 %18
  store i64 1, i64* %28, align 8
  br label %29

; <label>:29                                      ; preds = %16
  %30 = load i32* %l, align 4
  %31 = add nsw i32 %30, 1
  store i32 %31, i32* %l, align 4
  br label %13

; <label>:32                                      ; preds = %13
  br label %33

; <label>:33                                      ; preds = %32
  %34 = load i32* %k, align 4
  %35 = add nsw i32 %34, 1
  store i32 %35, i32* %k, align 4
  br label %9

; <label>:36                                      ; preds = %9
  br label %37

; <label>:37                                      ; preds = %36
  %38 = load i32* %j, align 4
  %39 = add nsw i32 %38, 1
  store i32 %39, i32* %j, align 4
  br label %5

; <label>:40                                      ; preds = %5
  br label %41

; <label>:41                                      ; preds = %40
  %42 = load i32* %i, align 4
  %43 = add nsw i32 %42, 1
  store i32 %43, i32* %i, align 4
  br label %1

; <label>:44                                      ; preds = %1
  %45 = getelementptr inbounds [7 x [5 x [1 x [1 x i64]]]]* %l_2, i32 0, i64 5
  %46 = getelementptr inbounds [5 x [1 x [1 x i64]]]* %45, i32 0, i64 4
  %47 = getelementptr inbounds [1 x [1 x i64]]* %46, i32 0, i64 0
  %48 = getelementptr inbounds [1 x i64]* %47, i32 0, i64 0
  %49 = load i64* %48, align 8
  %50 = trunc i64 %49 to i32
  ret i32 %50
}

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  %4 = call i32 @func_1()
  %5 = load i32* %1
  ret i32 %5
}
