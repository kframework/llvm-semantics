; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith001363.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_8 = global i32 -1, align 4
@g_7 = global i32* @g_8, align 8
@.str = private unnamed_addr constant [19 x i8] c"checksum g_8 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i64 @func_1() nounwind uwtable {
  %l_9 = alloca i8, align 1
  store i8 -1, i8* %l_9, align 1
  %1 = load i8* %l_9, align 1
  %2 = sext i8 %1 to i64
  %3 = load volatile i32** @g_7, align 8
  %4 = load i32* %3
  %5 = xor i32 %4, -1
  %6 = call i32 @func_2(i64 %2, i32 %5)
  %7 = load volatile i32** @g_7, align 8
  store i32 %6, i32* %7
  %8 = load i8* %l_9, align 1
  %9 = sext i8 %8 to i64
  ret i64 %9
}

define i32 @func_2(i64 %p_3, i32 %p_4) nounwind uwtable {
  %1 = alloca i64, align 8
  %2 = alloca i32, align 4
  %l_5 = alloca [9 x [10 x [1 x i32]]], align 16
  %l_6 = alloca i32*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  store i64 %p_3, i64* %1, align 8
  store i32 %p_4, i32* %2, align 4
  store i32* null, i32** %l_6, align 8
  store i32 0, i32* %i, align 4
  br label %3

; <label>:3                                       ; preds = %32, %0
  %4 = load i32* %i, align 4
  %5 = icmp slt i32 %4, 9
  br i1 %5, label %6, label %35

; <label>:6                                       ; preds = %3
  store i32 0, i32* %j, align 4
  br label %7

; <label>:7                                       ; preds = %28, %6
  %8 = load i32* %j, align 4
  %9 = icmp slt i32 %8, 10
  br i1 %9, label %10, label %31

; <label>:10                                      ; preds = %7
  store i32 0, i32* %k, align 4
  br label %11

; <label>:11                                      ; preds = %24, %10
  %12 = load i32* %k, align 4
  %13 = icmp slt i32 %12, 1
  br i1 %13, label %14, label %27

; <label>:14                                      ; preds = %11
  %15 = load i32* %k, align 4
  %16 = sext i32 %15 to i64
  %17 = load i32* %j, align 4
  %18 = sext i32 %17 to i64
  %19 = load i32* %i, align 4
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds [9 x [10 x [1 x i32]]]* %l_5, i32 0, i64 %20
  %22 = getelementptr inbounds [10 x [1 x i32]]* %21, i32 0, i64 %18
  %23 = getelementptr inbounds [1 x i32]* %22, i32 0, i64 %16
  store i32 0, i32* %23, align 4
  br label %24

; <label>:24                                      ; preds = %14
  %25 = load i32* %k, align 4
  %26 = add nsw i32 %25, 1
  store i32 %26, i32* %k, align 4
  br label %11

; <label>:27                                      ; preds = %11
  br label %28

; <label>:28                                      ; preds = %27
  %29 = load i32* %j, align 4
  %30 = add nsw i32 %29, 1
  store i32 %30, i32* %j, align 4
  br label %7

; <label>:31                                      ; preds = %7
  br label %32

; <label>:32                                      ; preds = %31
  %33 = load i32* %i, align 4
  %34 = add nsw i32 %33, 1
  store i32 %34, i32* %i, align 4
  br label %3

; <label>:35                                      ; preds = %3
  %36 = getelementptr inbounds [9 x [10 x [1 x i32]]]* %l_5, i32 0, i64 8
  %37 = getelementptr inbounds [10 x [1 x i32]]* %36, i32 0, i64 1
  %38 = getelementptr inbounds [1 x i32]* %37, i32 0, i64 0
  %39 = load i32* %38, align 4
  %40 = getelementptr inbounds [9 x [10 x [1 x i32]]]* %l_5, i32 0, i64 8
  %41 = getelementptr inbounds [10 x [1 x i32]]* %40, i32 0, i64 1
  %42 = getelementptr inbounds [1 x i32]* %41, i32 0, i64 0
  %43 = load i32* %42, align 4
  %44 = icmp uge i32 %39, %43
  %45 = zext i1 %44 to i32
  %46 = load i32* %2, align 4
  %47 = and i32 %45, %46
  %48 = xor i32 %47, -1
  %49 = load volatile i32** @g_7, align 8
  store i32 %48, i32* %49
  %50 = load i64* %1, align 8
  %51 = trunc i64 %50 to i32
  ret i32 %51
}

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  %4 = call i64 @func_1()
  %5 = load i32* @g_8, align 4
  %6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %5)
  %7 = load i32* %1
  ret i32 %7
}

declare i32 @printf(i8*, ...)
