; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith001706.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_9 = global i32 1972767171, align 4
@.str = private unnamed_addr constant [19 x i8] c"checksum g_9 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define zeroext i16 @func_1() nounwind uwtable {
  %l_10 = alloca [3 x i32], align 4
  %l_11 = alloca i32*, align 8
  %l_12 = alloca [8 x [7 x [1 x i32]]], align 16
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  store i32* null, i32** %l_11, align 8
  store i32 0, i32* %i, align 4
  br label %1

; <label>:1                                       ; preds = %8, %0
  %2 = load i32* %i, align 4
  %3 = icmp slt i32 %2, 3
  br i1 %3, label %4, label %11

; <label>:4                                       ; preds = %1
  %5 = load i32* %i, align 4
  %6 = sext i32 %5 to i64
  %7 = getelementptr inbounds [3 x i32]* %l_10, i32 0, i64 %6
  store i32 705993964, i32* %7, align 4
  br label %8

; <label>:8                                       ; preds = %4
  %9 = load i32* %i, align 4
  %10 = add nsw i32 %9, 1
  store i32 %10, i32* %i, align 4
  br label %1

; <label>:11                                      ; preds = %1
  store i32 0, i32* %i, align 4
  br label %12

; <label>:12                                      ; preds = %41, %11
  %13 = load i32* %i, align 4
  %14 = icmp slt i32 %13, 8
  br i1 %14, label %15, label %44

; <label>:15                                      ; preds = %12
  store i32 0, i32* %j, align 4
  br label %16

; <label>:16                                      ; preds = %37, %15
  %17 = load i32* %j, align 4
  %18 = icmp slt i32 %17, 7
  br i1 %18, label %19, label %40

; <label>:19                                      ; preds = %16
  store i32 0, i32* %k, align 4
  br label %20

; <label>:20                                      ; preds = %33, %19
  %21 = load i32* %k, align 4
  %22 = icmp slt i32 %21, 1
  br i1 %22, label %23, label %36

; <label>:23                                      ; preds = %20
  %24 = load i32* %k, align 4
  %25 = sext i32 %24 to i64
  %26 = load i32* %j, align 4
  %27 = sext i32 %26 to i64
  %28 = load i32* %i, align 4
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds [8 x [7 x [1 x i32]]]* %l_12, i32 0, i64 %29
  %31 = getelementptr inbounds [7 x [1 x i32]]* %30, i32 0, i64 %27
  %32 = getelementptr inbounds [1 x i32]* %31, i32 0, i64 %25
  store i32 1, i32* %32, align 4
  br label %33

; <label>:33                                      ; preds = %23
  %34 = load i32* %k, align 4
  %35 = add nsw i32 %34, 1
  store i32 %35, i32* %k, align 4
  br label %20

; <label>:36                                      ; preds = %20
  br label %37

; <label>:37                                      ; preds = %36
  %38 = load i32* %j, align 4
  %39 = add nsw i32 %38, 1
  store i32 %39, i32* %j, align 4
  br label %16

; <label>:40                                      ; preds = %16
  br label %41

; <label>:41                                      ; preds = %40
  %42 = load i32* %i, align 4
  %43 = add nsw i32 %42, 1
  store i32 %43, i32* %i, align 4
  br label %12

; <label>:44                                      ; preds = %12
  %45 = getelementptr inbounds [3 x i32]* %l_10, i32 0, i64 1
  %46 = load i32* %45, align 4
  %47 = load i32* @g_9, align 4
  %48 = and i32 %46, %47
  %49 = getelementptr inbounds [3 x i32]* %l_10, i32 0, i64 1
  %50 = load i32* %49, align 4
  %51 = sext i32 %50 to i64
  %52 = load i32* @g_9, align 4
  %53 = trunc i32 %52 to i8
  %54 = call i32 @func_2(i8 zeroext -53, i32 %48, i64 %51, i8 zeroext %53)
  %55 = getelementptr inbounds [8 x [7 x [1 x i32]]]* %l_12, i32 0, i64 4
  %56 = getelementptr inbounds [7 x [1 x i32]]* %55, i32 0, i64 6
  %57 = getelementptr inbounds [1 x i32]* %56, i32 0, i64 0
  %58 = load i32* %57, align 4
  %59 = and i32 %58, %54
  store i32 %59, i32* %57, align 4
  %60 = load i32* @g_9, align 4
  %61 = trunc i32 %60 to i16
  ret i16 %61
}

define i32 @func_2(i8 zeroext %p_3, i32 %p_4, i64 %p_5, i8 zeroext %p_6) nounwind uwtable {
  %1 = alloca i8, align 1
  %2 = alloca i32, align 4
  %3 = alloca i64, align 8
  %4 = alloca i8, align 1
  %l_7 = alloca i32*, align 8
  %l_8 = alloca i32*, align 8
  store i8 %p_3, i8* %1, align 1
  store i32 %p_4, i32* %2, align 4
  store i64 %p_5, i64* %3, align 8
  store i8 %p_6, i8* %4, align 1
  store i32* null, i32** %l_7, align 8
  store i32* @g_9, i32** %l_8, align 8
  %5 = load i32** %l_8, align 8
  %6 = load i32* %5
  %7 = sext i32 %6 to i64
  %8 = and i64 %7, 2560990231
  %9 = trunc i64 %8 to i32
  store i32 %9, i32* %5
  %10 = load i32** %l_8, align 8
  %11 = load i32* %10
  ret i32 %11
}

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  %4 = call zeroext i16 @func_1()
  %5 = load i32* @g_9, align 4
  %6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %5)
  %7 = load i32* %1
  ret i32 %7
}

declare i32 @printf(i8*, ...)
