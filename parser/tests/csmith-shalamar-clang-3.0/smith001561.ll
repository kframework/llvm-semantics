; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith001561.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_4 = global i32 239365619, align 4
@g_3 = global i32* @g_4, align 8
@g_5 = global i32* @g_4, align 8
@g_19 = global i32 6, align 4
@.str = private unnamed_addr constant [19 x i8] c"checksum g_4 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [20 x i8] c"checksum g_19 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable {
  %l_2 = alloca i64, align 8
  %l_12 = alloca i32*, align 8
  %l_15 = alloca i32*, align 8
  %l_18 = alloca i32*, align 8
  store i64 7059887792567472795, i64* %l_2, align 8
  store i32* null, i32** %l_12, align 8
  store i32* @g_4, i32** %l_15, align 8
  store i32* @g_19, i32** %l_18, align 8
  %1 = load i64* %l_2, align 8
  %2 = trunc i64 %1 to i32
  %3 = load volatile i32** @g_3, align 8
  store i32 %2, i32* %3
  %4 = load i64* %l_2, align 8
  %5 = load i64* %l_2, align 8
  %6 = icmp slt i64 %4, %5
  %7 = zext i1 %6 to i32
  %8 = load volatile i32** @g_5, align 8
  store i32 %7, i32* %8
  %9 = load volatile i32** @g_3, align 8
  %10 = load i32* %9
  %11 = load i32* @g_4, align 4
  %12 = load i32** %l_12, align 8
  %13 = load i32** %l_12, align 8
  %14 = icmp eq i32* %12, %13
  br i1 %14, label %18, label %15

; <label>:15                                      ; preds = %0
  %16 = load i32* @g_4, align 4
  %17 = icmp ne i32 %16, 0
  br label %18

; <label>:18                                      ; preds = %15, %0
  %19 = phi i1 [ true, %0 ], [ %17, %15 ]
  %20 = zext i1 %19 to i32
  %21 = xor i32 %11, %20
  %22 = icmp ne i32 %10, %21
  %23 = zext i1 %22 to i32
  %24 = load i32* @g_4, align 4
  %25 = trunc i32 %24 to i16
  %26 = call signext i16 @safe_lshift_func_int16_t_s_s(i16 signext %25, i32 -172902659)
  %27 = sext i16 %26 to i32
  %28 = load i32* @g_4, align 4
  %29 = xor i32 %27, %28
  %30 = icmp sge i32 %23, %29
  %31 = zext i1 %30 to i32
  %32 = trunc i32 %31 to i8
  %33 = load i32** %l_15, align 8
  %34 = load i32** %l_15, align 8
  %35 = load i32* %34
  %36 = sext i32 %35 to i64
  %37 = load i32* @g_4, align 4
  %38 = sext i32 %37 to i64
  %39 = call i64 @safe_div_func_int64_t_s_s(i64 %36, i64 %38)
  %40 = trunc i64 %39 to i16
  %41 = call i32 @func_6(i32* @g_4, i8 signext %32, i32* %33, i16 zeroext %40, i32* @g_4)
  %42 = load i32** %l_18, align 8
  %43 = load i32* %42
  %44 = and i32 %43, %41
  store i32 %44, i32* %42
  %45 = load i32** %l_18, align 8
  %46 = load i32* %45
  %47 = sext i32 %46 to i64
  %48 = xor i64 %47, 7
  %49 = trunc i64 %48 to i32
  store i32 %49, i32* %45
  %50 = load volatile i32** @g_3, align 8
  %51 = load i32* %50
  ret i32 %51
}

define i32 @func_6(i32* %p_7, i8 signext %p_8, i32* %p_9, i16 zeroext %p_10, i32* %p_11) nounwind uwtable {
  %1 = alloca i32*, align 8
  %2 = alloca i8, align 1
  %3 = alloca i32*, align 8
  %4 = alloca i16, align 2
  %5 = alloca i32*, align 8
  store i32* %p_7, i32** %1, align 8
  store i8 %p_8, i8* %2, align 1
  store i32* %p_9, i32** %3, align 8
  store i16 %p_10, i16* %4, align 2
  store i32* %p_11, i32** %5, align 8
  %6 = load volatile i32** @g_3, align 8
  %7 = load i32* %6
  ret i32 %7
}

define internal signext i16 @safe_lshift_func_int16_t_s_s(i16 signext %left, i32 %right) nounwind uwtable {
  %1 = alloca i16, align 2
  %2 = alloca i32, align 4
  store i16 %left, i16* %1, align 2
  store i32 %right, i32* %2, align 4
  %3 = load i16* %1, align 2
  %4 = sext i16 %3 to i32
  %5 = icmp slt i32 %4, 0
  br i1 %5, label %18, label %6

; <label>:6                                       ; preds = %0
  %7 = load i32* %2, align 4
  %8 = icmp slt i32 %7, 0
  br i1 %8, label %18, label %9

; <label>:9                                       ; preds = %6
  %10 = load i32* %2, align 4
  %11 = icmp sge i32 %10, 32
  br i1 %11, label %18, label %12

; <label>:12                                      ; preds = %9
  %13 = load i16* %1, align 2
  %14 = sext i16 %13 to i32
  %15 = load i32* %2, align 4
  %16 = ashr i32 32767, %15
  %17 = icmp sgt i32 %14, %16
  br i1 %17, label %18, label %21

; <label>:18                                      ; preds = %12, %9, %6, %0
  %19 = load i16* %1, align 2
  %20 = sext i16 %19 to i32
  br label %26

; <label>:21                                      ; preds = %12
  %22 = load i16* %1, align 2
  %23 = sext i16 %22 to i32
  %24 = load i32* %2, align 4
  %25 = shl i32 %23, %24
  br label %26

; <label>:26                                      ; preds = %21, %18
  %27 = phi i32 [ %20, %18 ], [ %25, %21 ]
  %28 = trunc i32 %27 to i16
  ret i16 %28
}

define internal i64 @safe_div_func_int64_t_s_s(i64 %si1, i64 %si2) nounwind uwtable {
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
  %16 = sdiv i64 %14, %15
  br label %17

; <label>:17                                      ; preds = %13, %11
  %18 = phi i64 [ %12, %11 ], [ %16, %13 ]
  ret i64 %18
}

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  %4 = call i32 @func_1()
  %5 = load i32* @g_4, align 4
  %6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %5)
  %7 = load i32* @g_19, align 4
  %8 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str1, i32 0, i32 0), i32 %7)
  %9 = load i32* %1
  ret i32 %9
}

declare i32 @printf(i8*, ...)
