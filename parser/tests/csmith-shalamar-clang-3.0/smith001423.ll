; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith001423.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = global i32 1974829013, align 4
@.str = private unnamed_addr constant [19 x i8] c"checksum g_2 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable {
  %l_5 = alloca [3 x [9 x [3 x [1 x i16]]]], align 16
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %l = alloca i32, align 4
  store i32 0, i32* %i, align 4
  br label %1

; <label>:1                                       ; preds = %41, %0
  %2 = load i32* %i, align 4
  %3 = icmp slt i32 %2, 3
  br i1 %3, label %4, label %44

; <label>:4                                       ; preds = %1
  store i32 0, i32* %j, align 4
  br label %5

; <label>:5                                       ; preds = %37, %4
  %6 = load i32* %j, align 4
  %7 = icmp slt i32 %6, 9
  br i1 %7, label %8, label %40

; <label>:8                                       ; preds = %5
  store i32 0, i32* %k, align 4
  br label %9

; <label>:9                                       ; preds = %33, %8
  %10 = load i32* %k, align 4
  %11 = icmp slt i32 %10, 3
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
  %25 = getelementptr inbounds [3 x [9 x [3 x [1 x i16]]]]* %l_5, i32 0, i64 %24
  %26 = getelementptr inbounds [9 x [3 x [1 x i16]]]* %25, i32 0, i64 %22
  %27 = getelementptr inbounds [3 x [1 x i16]]* %26, i32 0, i64 %20
  %28 = getelementptr inbounds [1 x i16]* %27, i32 0, i64 %18
  store i16 -9, i16* %28, align 2
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
  store i32 0, i32* @g_2, align 4
  br label %45

; <label>:45                                      ; preds = %57, %44
  %46 = load i32* @g_2, align 4
  %47 = icmp ne i32 %46, 29
  br i1 %47, label %48, label %60

; <label>:48                                      ; preds = %45
  %49 = getelementptr inbounds [3 x [9 x [3 x [1 x i16]]]]* %l_5, i32 0, i64 2
  %50 = getelementptr inbounds [9 x [3 x [1 x i16]]]* %49, i32 0, i64 3
  %51 = getelementptr inbounds [3 x [1 x i16]]* %50, i32 0, i64 0
  %52 = getelementptr inbounds [1 x i16]* %51, i32 0, i64 0
  %53 = load i16* %52, align 2
  %54 = icmp ne i16 %53, 0
  br i1 %54, label %55, label %56

; <label>:55                                      ; preds = %48
  br label %60

; <label>:56                                      ; preds = %48
  br label %57

; <label>:57                                      ; preds = %56
  %58 = load i32* @g_2, align 4
  %59 = call i32 @safe_sub_func_int32_t_s_s(i32 %58, i32 2)
  store i32 %59, i32* @g_2, align 4
  br label %45

; <label>:60                                      ; preds = %55, %45
  %61 = load i32* @g_2, align 4
  ret i32 %61
}

define internal i32 @safe_sub_func_int32_t_s_s(i32 %si1, i32 %si2) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 %si1, i32* %1, align 4
  store i32 %si2, i32* %2, align 4
  %3 = load i32* %1, align 4
  %4 = load i32* %2, align 4
  %5 = xor i32 %3, %4
  %6 = load i32* %1, align 4
  %7 = load i32* %1, align 4
  %8 = load i32* %2, align 4
  %9 = xor i32 %7, %8
  %10 = and i32 %9, -2147483648
  %11 = xor i32 %6, %10
  %12 = load i32* %2, align 4
  %13 = sub nsw i32 %11, %12
  %14 = load i32* %2, align 4
  %15 = xor i32 %13, %14
  %16 = and i32 %5, %15
  %17 = icmp slt i32 %16, 0
  br i1 %17, label %18, label %20

; <label>:18                                      ; preds = %0
  %19 = load i32* %1, align 4
  br label %24

; <label>:20                                      ; preds = %0
  %21 = load i32* %1, align 4
  %22 = load i32* %2, align 4
  %23 = sub nsw i32 %21, %22
  br label %24

; <label>:24                                      ; preds = %20, %18
  %25 = phi i32 [ %19, %18 ], [ %23, %20 ]
  ret i32 %25
}

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  %4 = call i32 @func_1()
  %5 = load i32* @g_2, align 4
  %6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %5)
  %7 = load i32* %1
  ret i32 %7
}

declare i32 @printf(i8*, ...)
