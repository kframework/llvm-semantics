; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith001653.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = global i32 -3, align 4
@g_6 = global [1 x [3 x [1 x i32]]] [[3 x [1 x i32]] [[1 x i32] [i32 -10], [1 x i32] [i32 -10], [1 x i32] [i32 -10]]], align 4
@g_8 = global i32* bitcast (i8* getelementptr (i8* bitcast ([1 x [3 x [1 x i32]]]* @g_6 to i8*), i64 4) to i32*), align 8
@g_7 = global i32** @g_8, align 8
@.str = private unnamed_addr constant [19 x i8] c"checksum g_2 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [28 x i8] c"checksum g_6[0][0][0] = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [28 x i8] c"checksum g_6[0][1][0] = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [28 x i8] c"checksum g_6[0][2][0] = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define signext i8 @func_1() nounwind uwtable {
  %1 = alloca i8, align 1
  %l_9 = alloca i32, align 4
  %l_3 = alloca i32**, align 8
  %l_5 = alloca i32*, align 8
  %l_4 = alloca i32**, align 8
  store i32 -8, i32* %l_9, align 4
  %2 = load i32* @g_2, align 4
  %3 = zext i32 %2 to i64
  %4 = icmp sle i64 6, %3
  br i1 %4, label %5, label %9

; <label>:5                                       ; preds = %0
  store i32** null, i32*** %l_3, align 8
  store i32* getelementptr inbounds ([1 x [3 x [1 x i32]]]* @g_6, i32 0, i64 0, i64 1, i64 0), i32** %l_5, align 8
  store i32** %l_5, i32*** %l_4, align 8
  %6 = load i32*** %l_4, align 8
  store i32* null, i32** %6
  %7 = load i32* getelementptr inbounds ([1 x [3 x [1 x i32]]]* @g_6, i32 0, i64 0, i64 1, i64 0), align 4
  %8 = trunc i32 %7 to i8
  store i8 %8, i8* %1
  br label %16

; <label>:9                                       ; preds = %0
  %10 = load i32*** @g_7, align 8
  %11 = icmp ne i32** %10, null
  %12 = zext i1 %11 to i32
  %13 = load i32** @g_8, align 8
  store i32 %12, i32* %13
  %14 = load i32* %l_9, align 4
  %15 = trunc i32 %14 to i8
  store i8 %15, i8* %1
  br label %16

; <label>:16                                      ; preds = %9, %5
  %17 = load i8* %1
  ret i8 %17
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
  %4 = call signext i8 @func_1()
  %5 = load i32* @g_2, align 4
  %6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %5)
  %7 = load i32* getelementptr inbounds ([1 x [3 x [1 x i32]]]* @g_6, i32 0, i64 0, i64 0, i64 0), align 4
  %8 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str1, i32 0, i32 0), i32 %7)
  %9 = load i32* getelementptr inbounds ([1 x [3 x [1 x i32]]]* @g_6, i32 0, i64 0, i64 1, i64 0), align 4
  %10 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str2, i32 0, i32 0), i32 %9)
  %11 = load i32* getelementptr inbounds ([1 x [3 x [1 x i32]]]* @g_6, i32 0, i64 0, i64 2, i64 0), align 4
  %12 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str3, i32 0, i32 0), i32 %11)
  %13 = load i32* getelementptr inbounds ([1 x [3 x [1 x i32]]]* @g_6, i32 0, i64 0, i64 1, i64 0), align 4
  %14 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str2, i32 0, i32 0), i32 %13)
  %15 = load i32* %1
  ret i32 %15
}

declare i32 @printf(i8*, ...)
