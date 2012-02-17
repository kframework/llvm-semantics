; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith000415.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_4 = global i32 -1801280268, align 4
@g_3 = constant [8 x [4 x i32*]] [[4 x i32*] [i32* @g_4, i32* @g_4, i32* @g_4, i32* @g_4], [4 x i32*] [i32* @g_4, i32* @g_4, i32* @g_4, i32* @g_4], [4 x i32*] [i32* @g_4, i32* @g_4, i32* @g_4, i32* @g_4], [4 x i32*] [i32* @g_4, i32* @g_4, i32* @g_4, i32* @g_4], [4 x i32*] [i32* @g_4, i32* @g_4, i32* @g_4, i32* @g_4], [4 x i32*] [i32* @g_4, i32* @g_4, i32* @g_4, i32* @g_4], [4 x i32*] [i32* @g_4, i32* @g_4, i32* @g_4, i32* @g_4], [4 x i32*] [i32* @g_4, i32* @g_4, i32* @g_4, i32* @g_4]], align 16
@g_5 = global i32* null, align 8
@.str = private unnamed_addr constant [19 x i8] c"checksum g_4 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i64 @func_1() nounwind uwtable {
  %l_2 = alloca [2 x [9 x i64]], align 16
  %l_6 = alloca i32*, align 8
  %l_7 = alloca i32**, align 8
  %l_8 = alloca i32**, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32* @g_4, i32** %l_6, align 8
  store i32** null, i32*** %l_7, align 8
  store i32** %l_6, i32*** %l_8, align 8
  store i32 0, i32* %i, align 4
  br label %1

; <label>:1                                       ; preds = %19, %0
  %2 = load i32* %i, align 4
  %3 = icmp slt i32 %2, 2
  br i1 %3, label %4, label %22

; <label>:4                                       ; preds = %1
  store i32 0, i32* %j, align 4
  br label %5

; <label>:5                                       ; preds = %15, %4
  %6 = load i32* %j, align 4
  %7 = icmp slt i32 %6, 9
  br i1 %7, label %8, label %18

; <label>:8                                       ; preds = %5
  %9 = load i32* %j, align 4
  %10 = sext i32 %9 to i64
  %11 = load i32* %i, align 4
  %12 = sext i32 %11 to i64
  %13 = getelementptr inbounds [2 x [9 x i64]]* %l_2, i32 0, i64 %12
  %14 = getelementptr inbounds [9 x i64]* %13, i32 0, i64 %10
  store i64 8492922746153012301, i64* %14, align 8
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
  %23 = getelementptr inbounds [2 x [9 x i64]]* %l_2, i32 0, i64 0
  %24 = getelementptr inbounds [9 x i64]* %23, i32 0, i64 6
  %25 = load i64* %24, align 8
  %26 = load i32** %l_6, align 8
  %27 = load i32* %26
  %28 = sext i32 %27 to i64
  %29 = and i64 %28, %25
  %30 = trunc i64 %29 to i32
  store i32 %30, i32* %26
  %31 = load i32** %l_6, align 8
  %32 = load i32*** %l_8, align 8
  store i32* %31, i32** %32
  %33 = call i32 @safe_unary_minus_func_uint32_t_u(i32 2051796428)
  %34 = load i32** %l_6, align 8
  %35 = load i32* %34
  %36 = or i32 %35, %33
  store i32 %36, i32* %34
  %37 = load i32* @g_4, align 4
  %38 = sext i32 %37 to i64
  ret i64 %38
}

define internal i32 @safe_unary_minus_func_uint32_t_u(i32 %ui) nounwind uwtable {
  %1 = alloca i32, align 4
  store i32 %ui, i32* %1, align 4
  %2 = load i32* %1, align 4
  %3 = sub i32 0, %2
  ret i32 %3
}

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  %4 = call i64 @func_1()
  %5 = load i32* @g_4, align 4
  %6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %5)
  %7 = load i32* %1
  ret i32 %7
}

declare i32 @printf(i8*, ...)
