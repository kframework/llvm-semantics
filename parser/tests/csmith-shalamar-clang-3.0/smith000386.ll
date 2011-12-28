; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith000386.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = global i32 -76084617, align 4
@g_8 = global i32* @g_2, align 8
@g_7 = global i32** @g_8, align 8
@g_13 = global [9 x [1 x [1 x [1 x i32]]]] [[1 x [1 x [1 x i32]]] [[1 x [1 x i32]] [[1 x i32] [i32 -1]]], [1 x [1 x [1 x i32]]] [[1 x [1 x i32]] [[1 x i32] [i32 -1]]], [1 x [1 x [1 x i32]]] [[1 x [1 x i32]] [[1 x i32] [i32 -1]]], [1 x [1 x [1 x i32]]] [[1 x [1 x i32]] [[1 x i32] [i32 -1]]], [1 x [1 x [1 x i32]]] [[1 x [1 x i32]] [[1 x i32] [i32 -1]]], [1 x [1 x [1 x i32]]] [[1 x [1 x i32]] [[1 x i32] [i32 -1]]], [1 x [1 x [1 x i32]]] [[1 x [1 x i32]] [[1 x i32] [i32 -1]]], [1 x [1 x [1 x i32]]] [[1 x [1 x i32]] [[1 x i32] [i32 -1]]], [1 x [1 x [1 x i32]]] [[1 x [1 x i32]] [[1 x i32] [i32 -1]]]], align 16
@.str = private unnamed_addr constant [19 x i8] c"checksum g_2 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [32 x i8] c"checksum g_13[0][0][0][0] = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [32 x i8] c"checksum g_13[1][0][0][0] = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [32 x i8] c"checksum g_13[2][0][0][0] = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [32 x i8] c"checksum g_13[3][0][0][0] = %d\0A\00", align 1
@.str5 = private unnamed_addr constant [32 x i8] c"checksum g_13[4][0][0][0] = %d\0A\00", align 1
@.str6 = private unnamed_addr constant [32 x i8] c"checksum g_13[5][0][0][0] = %d\0A\00", align 1
@.str7 = private unnamed_addr constant [32 x i8] c"checksum g_13[6][0][0][0] = %d\0A\00", align 1
@.str8 = private unnamed_addr constant [32 x i8] c"checksum g_13[7][0][0][0] = %d\0A\00", align 1
@.str9 = private unnamed_addr constant [32 x i8] c"checksum g_13[8][0][0][0] = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable {
  %l_5 = alloca i32*, align 8
  %l_6 = alloca i32**, align 8
  %l_10 = alloca i32*, align 8
  store i32* @g_2, i32** %l_5, align 8
  br label %1

; <label>:1                                       ; preds = %39, %0
  store i32 0, i32* @g_2, align 4
  br label %2

; <label>:2                                       ; preds = %27, %1
  %3 = load i32* @g_2, align 4
  %4 = icmp sgt i32 %3, 10
  br i1 %4, label %5, label %32

; <label>:5                                       ; preds = %2
  store i32** null, i32*** %l_6, align 8
  store i32* @g_2, i32** %l_10, align 8
  %6 = load i32** %l_5, align 8
  %7 = load volatile i32*** @g_7, align 8
  store i32* %6, i32** %7
  %8 = load i32** %l_10, align 8
  %9 = load volatile i32*** @g_7, align 8
  %10 = load i32** %9
  %11 = icmp eq i32* %8, %10
  br i1 %11, label %12, label %19

; <label>:12                                      ; preds = %5
  %13 = load volatile i32*** @g_7, align 8
  %14 = load i32** %13
  %15 = load i32* %14
  %16 = sext i32 %15 to i64
  %17 = call i64 @safe_mod_func_int64_t_s_s(i64 0, i64 %16)
  %18 = icmp ne i64 %17, 0
  br label %19

; <label>:19                                      ; preds = %12, %5
  %20 = phi i1 [ false, %5 ], [ %18, %12 ]
  %21 = zext i1 %20 to i32
  %22 = trunc i32 %21 to i8
  %23 = call zeroext i8 @safe_unary_minus_func_uint8_t_u(i8 zeroext %22)
  %24 = zext i8 %23 to i32
  %25 = load i32* getelementptr inbounds ([9 x [1 x [1 x [1 x i32]]]]* @g_13, i32 0, i64 7, i64 0, i64 0, i64 0), align 4
  %26 = or i32 %25, %24
  store i32 %26, i32* getelementptr inbounds ([9 x [1 x [1 x [1 x i32]]]]* @g_13, i32 0, i64 7, i64 0, i64 0, i64 0), align 4
  br label %27

; <label>:27                                      ; preds = %19
  %28 = load i32* @g_2, align 4
  %29 = trunc i32 %28 to i16
  %30 = call signext i16 @safe_sub_func_int16_t_s_s(i16 signext %29, i16 signext 1)
  %31 = sext i16 %30 to i32
  store i32 %31, i32* @g_2, align 4
  br label %2

; <label>:32                                      ; preds = %2
  store i32 26, i32* @g_2, align 4
  br label %33

; <label>:33                                      ; preds = %41, %32
  %34 = load i32* @g_2, align 4
  %35 = icmp sle i32 %34, -27
  br i1 %35, label %36, label %46

; <label>:36                                      ; preds = %33
  %37 = load i32* @g_2, align 4
  %38 = icmp ne i32 %37, 0
  br i1 %38, label %39, label %40

; <label>:39                                      ; preds = %36
  br label %1

; <label>:40                                      ; preds = %36
  br label %41

; <label>:41                                      ; preds = %40
  %42 = load i32* @g_2, align 4
  %43 = trunc i32 %42 to i16
  %44 = call signext i16 @safe_sub_func_int16_t_s_s(i16 signext %43, i16 signext 1)
  %45 = sext i16 %44 to i32
  store i32 %45, i32* @g_2, align 4
  br label %33

; <label>:46                                      ; preds = %33
  %47 = load i32** %l_5, align 8
  %48 = load i32* %47
  %49 = or i32 %48, 1
  %50 = load i32** %l_5, align 8
  store i32 %49, i32* %50
  %51 = load i32** %l_5, align 8
  %52 = load i32* %51
  ret i32 %52
}

define internal zeroext i8 @safe_unary_minus_func_uint8_t_u(i8 zeroext %ui) nounwind uwtable {
  %1 = alloca i8, align 1
  store i8 %ui, i8* %1, align 1
  %2 = load i8* %1, align 1
  %3 = zext i8 %2 to i32
  %4 = sub nsw i32 0, %3
  %5 = trunc i32 %4 to i8
  ret i8 %5
}

define internal i64 @safe_mod_func_int64_t_s_s(i64 %si1, i64 %si2) nounwind uwtable {
  %1 = alloca i64, align 8
  %2 = alloca i64, align 8
  store i64 %si1, i64* %1, align 8
  store i64 %si2, i64* %2, align 8
  %3 = load i64* %2, align 8
  %4 = icmp eq i64 %3, 0
  br i1 %4, label %11, label %5

; <label>:5                                       ; preds = %0
  %6 = load i64* %1, align 8
  %7 = icmp eq i64 %6, -9223372036854775808
  br i1 %7, label %8, label %13

; <label>:8                                       ; preds = %5
  %9 = load i64* %2, align 8
  %10 = icmp eq i64 %9, -1
  br i1 %10, label %11, label %13

; <label>:11                                      ; preds = %8, %0
  %12 = load i64* %1, align 8
  br label %17

; <label>:13                                      ; preds = %8, %5
  %14 = load i64* %1, align 8
  %15 = load i64* %2, align 8
  %16 = srem i64 %14, %15
  br label %17

; <label>:17                                      ; preds = %13, %11
  %18 = phi i64 [ %12, %11 ], [ %16, %13 ]
  ret i64 %18
}

define internal signext i16 @safe_sub_func_int16_t_s_s(i16 signext %si1, i16 signext %si2) nounwind uwtable {
  %1 = alloca i16, align 2
  %2 = alloca i16, align 2
  store i16 %si1, i16* %1, align 2
  store i16 %si2, i16* %2, align 2
  %3 = load i16* %1, align 2
  %4 = sext i16 %3 to i32
  %5 = load i16* %2, align 2
  %6 = sext i16 %5 to i32
  %7 = sub nsw i32 %4, %6
  %8 = trunc i32 %7 to i16
  ret i16 %8
}

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %l = alloca i32, align 4
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  %4 = call i32 @func_1()
  %5 = load i32* @g_2, align 4
  %6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %5)
  %7 = load i32* getelementptr inbounds ([9 x [1 x [1 x [1 x i32]]]]* @g_13, i32 0, i64 0, i64 0, i64 0, i64 0), align 4
  %8 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([32 x i8]* @.str1, i32 0, i32 0), i32 %7)
  %9 = load i32* getelementptr inbounds ([9 x [1 x [1 x [1 x i32]]]]* @g_13, i32 0, i64 1, i64 0, i64 0, i64 0), align 4
  %10 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([32 x i8]* @.str2, i32 0, i32 0), i32 %9)
  %11 = load i32* getelementptr inbounds ([9 x [1 x [1 x [1 x i32]]]]* @g_13, i32 0, i64 2, i64 0, i64 0, i64 0), align 4
  %12 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([32 x i8]* @.str3, i32 0, i32 0), i32 %11)
  %13 = load i32* getelementptr inbounds ([9 x [1 x [1 x [1 x i32]]]]* @g_13, i32 0, i64 3, i64 0, i64 0, i64 0), align 4
  %14 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([32 x i8]* @.str4, i32 0, i32 0), i32 %13)
  %15 = load i32* getelementptr inbounds ([9 x [1 x [1 x [1 x i32]]]]* @g_13, i32 0, i64 4, i64 0, i64 0, i64 0), align 4
  %16 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([32 x i8]* @.str5, i32 0, i32 0), i32 %15)
  %17 = load i32* getelementptr inbounds ([9 x [1 x [1 x [1 x i32]]]]* @g_13, i32 0, i64 5, i64 0, i64 0, i64 0), align 4
  %18 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([32 x i8]* @.str6, i32 0, i32 0), i32 %17)
  %19 = load i32* getelementptr inbounds ([9 x [1 x [1 x [1 x i32]]]]* @g_13, i32 0, i64 6, i64 0, i64 0, i64 0), align 4
  %20 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([32 x i8]* @.str7, i32 0, i32 0), i32 %19)
  %21 = load i32* getelementptr inbounds ([9 x [1 x [1 x [1 x i32]]]]* @g_13, i32 0, i64 7, i64 0, i64 0, i64 0), align 4
  %22 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([32 x i8]* @.str8, i32 0, i32 0), i32 %21)
  %23 = load i32* getelementptr inbounds ([9 x [1 x [1 x [1 x i32]]]]* @g_13, i32 0, i64 8, i64 0, i64 0, i64 0), align 4
  %24 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([32 x i8]* @.str9, i32 0, i32 0), i32 %23)
  %25 = load i32* getelementptr inbounds ([9 x [1 x [1 x [1 x i32]]]]* @g_13, i32 0, i64 7, i64 0, i64 0, i64 0), align 4
  %26 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([32 x i8]* @.str8, i32 0, i32 0), i32 %25)
  %27 = load i32* %1
  ret i32 %27
}

declare i32 @printf(i8*, ...)
