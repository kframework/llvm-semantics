; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith000619.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_9 = global i32 -9, align 4
@g_11 = global [9 x [5 x [2 x i32*]]] zeroinitializer, align 16
@g_14 = global i32 1716703450, align 4
@g_13 = global i32* @g_14, align 8
@.str = private unnamed_addr constant [19 x i8] c"checksum g_9 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [20 x i8] c"checksum g_14 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define signext i16 @func_1() nounwind uwtable {
  %l_12 = alloca i32, align 4
  store i32 1072031770, i32* %l_12, align 4
  %1 = load i32* %l_12, align 4
  %2 = load i32* @g_9, align 4
  %3 = load i32* @g_9, align 4
  %4 = trunc i32 %3 to i8
  %5 = load i32* %l_12, align 4
  %6 = load i32* @g_9, align 4
  %7 = call i32 @func_2(i32 %1, i32 %2, i8 zeroext %4, i32 %5, i32 %6)
  %8 = load volatile i32** @g_13, align 8
  %9 = load i32* %8
  %10 = or i32 %9, %7
  store i32 %10, i32* %8
  %11 = load i32* @g_14, align 4
  %12 = trunc i32 %11 to i16
  ret i16 %12
}

define i32 @func_2(i32 %p_3, i32 %p_4, i8 zeroext %p_5, i32 %p_6, i32 %p_7) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8, align 1
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %l_8 = alloca i32*, align 8
  %l_10 = alloca [8 x i32**], align 16
  %i = alloca i32, align 4
  store i32 %p_3, i32* %1, align 4
  store i32 %p_4, i32* %2, align 4
  store i8 %p_5, i8* %3, align 1
  store i32 %p_6, i32* %4, align 4
  store i32 %p_7, i32* %5, align 4
  store i32* @g_9, i32** %l_8, align 8
  store i32 0, i32* %i, align 4
  br label %6

; <label>:6                                       ; preds = %13, %0
  %7 = load i32* %i, align 4
  %8 = icmp slt i32 %7, 8
  br i1 %8, label %9, label %16

; <label>:9                                       ; preds = %6
  %10 = load i32* %i, align 4
  %11 = sext i32 %10 to i64
  %12 = getelementptr inbounds [8 x i32**]* %l_10, i32 0, i64 %11
  store i32** %l_8, i32*** %12, align 8
  br label %13

; <label>:13                                      ; preds = %9
  %14 = load i32* %i, align 4
  %15 = add nsw i32 %14, 1
  store i32 %15, i32* %i, align 4
  br label %6

; <label>:16                                      ; preds = %6
  %17 = load i32** %l_8, align 8
  store i32* %17, i32** getelementptr inbounds ([9 x [5 x [2 x i32*]]]* @g_11, i32 0, i64 3, i64 2, i64 1), align 8
  %18 = load i8* %3, align 1
  %19 = zext i8 %18 to i32
  ret i32 %19
}

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  %4 = call signext i16 @func_1()
  %5 = load i32* @g_9, align 4
  %6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %5)
  %7 = load i32* @g_14, align 4
  %8 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str1, i32 0, i32 0), i32 %7)
  %9 = load i32* %1
  ret i32 %9
}

declare i32 @printf(i8*, ...)
