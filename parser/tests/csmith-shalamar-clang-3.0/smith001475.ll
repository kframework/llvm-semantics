; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith001475.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_9 = global i32 -592223239, align 4
@g_13 = global i32 1, align 4
@g_12 = global i32* @g_13, align 8
@.str = private unnamed_addr constant [19 x i8] c"checksum g_9 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [20 x i8] c"checksum g_13 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable {
  %l_8 = alloca i32, align 4
  %l_11 = alloca i32*, align 8
  %l_10 = alloca [5 x [8 x i32**]], align 16
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 -7, i32* %l_8, align 4
  store i32* null, i32** %l_11, align 8
  store i32 0, i32* %i, align 4
  br label %1

; <label>:1                                       ; preds = %19, %0
  %2 = load i32* %i, align 4
  %3 = icmp slt i32 %2, 5
  br i1 %3, label %4, label %22

; <label>:4                                       ; preds = %1
  store i32 0, i32* %j, align 4
  br label %5

; <label>:5                                       ; preds = %15, %4
  %6 = load i32* %j, align 4
  %7 = icmp slt i32 %6, 8
  br i1 %7, label %8, label %18

; <label>:8                                       ; preds = %5
  %9 = load i32* %j, align 4
  %10 = sext i32 %9 to i64
  %11 = load i32* %i, align 4
  %12 = sext i32 %11 to i64
  %13 = getelementptr inbounds [5 x [8 x i32**]]* %l_10, i32 0, i64 %12
  %14 = getelementptr inbounds [8 x i32**]* %13, i32 0, i64 %10
  store i32** %l_11, i32*** %14, align 8
  br label %15

; <label>:15                                      ; preds = %8
  %16 = load i32* %j, align 4
  %17 = add nsw i32 %16, 1
  store i32 %17, i32* %j, align 4
  br label %5

; <label>:18                                      ; preds = %5
  br label %19

; <label>:19                                      ; preds = %18
  %20 = load i32* %i, align 4
  %21 = add nsw i32 %20, 1
  store i32 %21, i32* %i, align 4
  br label %1

; <label>:22                                      ; preds = %1
  %23 = load i32* %l_8, align 4
  %24 = trunc i32 %23 to i16
  %25 = load i32* %l_8, align 4
  %26 = trunc i32 %25 to i8
  %27 = load i32* @g_9, align 4
  %28 = load i32* %l_8, align 4
  %29 = trunc i32 %28 to i16
  %30 = call i32* @func_2(i16 zeroext %24, i8 signext %26, i32 %27, i16 zeroext %29)
  store i32* %30, i32** @g_12, align 8
  %31 = load i32* @g_13, align 4
  ret i32 %31
}

define i32* @func_2(i16 zeroext %p_3, i8 signext %p_4, i32 %p_5, i16 zeroext %p_6) nounwind uwtable {
  %1 = alloca i16, align 2
  %2 = alloca i8, align 1
  %3 = alloca i32, align 4
  %4 = alloca i16, align 2
  %l_7 = alloca [3 x i32*], align 16
  %i = alloca i32, align 4
  store i16 %p_3, i16* %1, align 2
  store i8 %p_4, i8* %2, align 1
  store i32 %p_5, i32* %3, align 4
  store i16 %p_6, i16* %4, align 2
  store i32 0, i32* %i, align 4
  br label %5

; <label>:5                                       ; preds = %12, %0
  %6 = load i32* %i, align 4
  %7 = icmp slt i32 %6, 3
  br i1 %7, label %8, label %15

; <label>:8                                       ; preds = %5
  %9 = load i32* %i, align 4
  %10 = sext i32 %9 to i64
  %11 = getelementptr inbounds [3 x i32*]* %l_7, i32 0, i64 %10
  store i32* null, i32** %11, align 8
  br label %12

; <label>:12                                      ; preds = %8
  %13 = load i32* %i, align 4
  %14 = add nsw i32 %13, 1
  store i32 %14, i32* %i, align 4
  br label %5

; <label>:15                                      ; preds = %5
  %16 = getelementptr inbounds [3 x i32*]* %l_7, i32 0, i64 2
  %17 = load i32** %16, align 8
  ret i32* %17
}

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  %4 = call i32 @func_1()
  %5 = load i32* @g_9, align 4
  %6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %5)
  %7 = load i32* @g_13, align 4
  %8 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str1, i32 0, i32 0), i32 %7)
  %9 = load i32* %1
  ret i32 %9
}

declare i32 @printf(i8*, ...)
