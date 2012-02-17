; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith000975.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_11 = global i8 3, align 1
@g_12 = global i32 0, align 4
@g_27 = global i32* null, align 8
@g_28 = global i32* null, align 8
@g_29 = global i32* null, align 8
@g_32 = global i32 -642882109, align 4
@g_31 = global i32* @g_32, align 8
@g_37 = global i32** @g_31, align 8
@.str = private unnamed_addr constant [20 x i8] c"checksum g_11 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [20 x i8] c"checksum g_12 = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [20 x i8] c"checksum g_32 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define signext i16 @func_1() nounwind uwtable {
  %l_4 = alloca i32, align 4
  %l_34 = alloca [3 x i32*], align 16
  %i = alloca i32, align 4
  %l_33 = alloca i32*, align 8
  %l_35 = alloca i32, align 4
  %l_38 = alloca i32**, align 8
  store i32 1833189762, i32* %l_4, align 4
  store i32 0, i32* %i, align 4
  br label %1

; <label>:1                                       ; preds = %8, %0
  %2 = load i32* %i, align 4
  %3 = icmp slt i32 %2, 3
  br i1 %3, label %4, label %11

; <label>:4                                       ; preds = %1
  %5 = load i32* %i, align 4
  %6 = sext i32 %5 to i64
  %7 = getelementptr inbounds [3 x i32*]* %l_34, i32 0, i64 %6
  store i32* null, i32** %7, align 8
  br label %8

; <label>:8                                       ; preds = %4
  %9 = load i32* %i, align 4
  %10 = add nsw i32 %9, 1
  store i32 %10, i32* %i, align 4
  br label %1

; <label>:11                                      ; preds = %1
  %12 = load i32* %l_4, align 4
  %13 = trunc i32 %12 to i16
  %14 = load i32* %l_4, align 4
  %15 = trunc i32 %14 to i16
  %16 = call zeroext i16 @safe_mul_func_uint16_t_u_u(i16 zeroext %13, i16 zeroext %15)
  %17 = zext i16 %16 to i32
  %18 = load i32* %l_4, align 4
  %19 = zext i32 %18 to i64
  %20 = call i32 @func_9(i64 %19)
  %21 = icmp ne i32 %20, 0
  br i1 %21, label %34, label %22

; <label>:22                                      ; preds = %11
  %23 = load i8* @g_11, align 1
  %24 = sext i8 %23 to i32
  %25 = load i32* %l_4, align 4
  %26 = icmp ne i32 %25, 0
  br i1 %26, label %30, label %27

; <label>:27                                      ; preds = %22
  %28 = load i32* %l_4, align 4
  %29 = icmp ne i32 %28, 0
  br label %30

; <label>:30                                      ; preds = %27, %22
  %31 = phi i1 [ true, %22 ], [ %29, %27 ]
  %32 = zext i1 %31 to i32
  %33 = icmp sle i32 %24, %32
  br label %34

; <label>:34                                      ; preds = %30, %11
  %35 = phi i1 [ true, %11 ], [ %33, %30 ]
  %36 = zext i1 %35 to i32
  %37 = call zeroext i16 @safe_lshift_func_uint16_t_u_s(i16 zeroext -27491, i32 %36)
  %38 = trunc i16 %37 to i8
  %39 = load i8* @g_11, align 1
  %40 = call signext i8 @safe_add_func_int8_t_s_s(i8 signext %38, i8 signext %39)
  %41 = sext i8 %40 to i32
  %42 = icmp sge i32 %17, %41
  %43 = zext i1 %42 to i32
  %44 = load i32* @g_12, align 4
  %45 = and i32 %44, %43
  store i32 %45, i32* @g_12, align 4
  store i32 0, i32* @g_12, align 4
  br label %46

; <label>:46                                      ; preds = %63, %34
  %47 = load i32* @g_12, align 4
  %48 = icmp uge i32 %47, 21
  br i1 %48, label %49, label %66

; <label>:49                                      ; preds = %46
  store i32* null, i32** %l_33, align 8
  store i32 1, i32* %l_35, align 4
  store i32** @g_31, i32*** %l_38, align 8
  %50 = load i32** %l_33, align 8
  %51 = getelementptr inbounds [3 x i32*]* %l_34, i32 0, i64 2
  store i32* %50, i32** %51, align 8
  %52 = load i32* %l_4, align 4
  %53 = icmp ne i32 %52, 0
  br i1 %53, label %54, label %55

; <label>:54                                      ; preds = %49
  br label %56

; <label>:55                                      ; preds = %49
  br label %56

; <label>:56                                      ; preds = %55, %54
  %57 = load i32* %l_35, align 4
  %58 = icmp ne i32 %57, 0
  br i1 %58, label %59, label %60

; <label>:59                                      ; preds = %56
  br label %66

; <label>:60                                      ; preds = %56
  %61 = load volatile i32*** @g_37, align 8
  store i32* %l_35, i32** %61
  %62 = load i32*** %l_38, align 8
  store i32* null, i32** %62
  br label %63

; <label>:63                                      ; preds = %60
  %64 = load i32* @g_12, align 4
  %65 = call i32 @safe_sub_func_int32_t_s_s(i32 %64, i32 3)
  store i32 %65, i32* @g_12, align 4
  br label %46

; <label>:66                                      ; preds = %59, %46
  %67 = load i8* @g_11, align 1
  %68 = sext i8 %67 to i16
  ret i16 %68
}

define internal zeroext i16 @safe_mul_func_uint16_t_u_u(i16 zeroext %ui1, i16 zeroext %ui2) nounwind uwtable {
  %1 = alloca i16, align 2
  %2 = alloca i16, align 2
  store i16 %ui1, i16* %1, align 2
  store i16 %ui2, i16* %2, align 2
  %3 = load i16* %1, align 2
  %4 = zext i16 %3 to i32
  %5 = load i16* %2, align 2
  %6 = zext i16 %5 to i32
  %7 = mul i32 %4, %6
  %8 = trunc i32 %7 to i16
  ret i16 %8
}

define internal signext i8 @safe_add_func_int8_t_s_s(i8 signext %si1, i8 signext %si2) nounwind uwtable {
  %1 = alloca i8, align 1
  %2 = alloca i8, align 1
  store i8 %si1, i8* %1, align 1
  store i8 %si2, i8* %2, align 1
  %3 = load i8* %1, align 1
  %4 = sext i8 %3 to i32
  %5 = load i8* %2, align 1
  %6 = sext i8 %5 to i32
  %7 = add nsw i32 %4, %6
  %8 = trunc i32 %7 to i8
  ret i8 %8
}

define internal zeroext i16 @safe_lshift_func_uint16_t_u_s(i16 zeroext %left, i32 %right) nounwind uwtable {
  %1 = alloca i16, align 2
  %2 = alloca i32, align 4
  store i16 %left, i16* %1, align 2
  store i32 %right, i32* %2, align 4
  %3 = load i32* %2, align 4
  %4 = icmp slt i32 %3, 0
  br i1 %4, label %14, label %5

; <label>:5                                       ; preds = %0
  %6 = load i32* %2, align 4
  %7 = icmp sge i32 %6, 32
  br i1 %7, label %14, label %8

; <label>:8                                       ; preds = %5
  %9 = load i16* %1, align 2
  %10 = zext i16 %9 to i32
  %11 = load i32* %2, align 4
  %12 = ashr i32 65535, %11
  %13 = icmp sgt i32 %10, %12
  br i1 %13, label %14, label %17

; <label>:14                                      ; preds = %8, %5, %0
  %15 = load i16* %1, align 2
  %16 = zext i16 %15 to i32
  br label %22

; <label>:17                                      ; preds = %8
  %18 = load i16* %1, align 2
  %19 = zext i16 %18 to i32
  %20 = load i32* %2, align 4
  %21 = shl i32 %19, %20
  br label %22

; <label>:22                                      ; preds = %17, %14
  %23 = phi i32 [ %16, %14 ], [ %21, %17 ]
  %24 = trunc i32 %23 to i16
  ret i16 %24
}

define i32 @func_9(i64 %p_10) nounwind uwtable {
  %1 = alloca i64, align 8
  store i64 %p_10, i64* %1, align 8
  %2 = load i64* %1, align 8
  %3 = trunc i64 %2 to i32
  ret i32 %3
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

define i32* @func_15(i32* %p_16, i32* %p_17, i64 %p_18, i32 %p_19) nounwind uwtable {
  %1 = alloca i32*, align 8
  %2 = alloca i32*, align 8
  %3 = alloca i64, align 8
  %4 = alloca i32, align 4
  store i32* %p_16, i32** %1, align 8
  store i32* %p_17, i32** %2, align 8
  store i64 %p_18, i64* %3, align 8
  store i32 %p_19, i32* %4, align 4
  %5 = load i32* @g_12, align 4
  %6 = load i32** %1, align 8
  %7 = load i32* %6
  %8 = xor i32 %7, %5
  store i32 %8, i32* %6
  %9 = load i32** %1, align 8
  ret i32* %9
}

define i32* @func_20(i64 %p_21) nounwind uwtable {
  %1 = alloca i64, align 8
  %l_24 = alloca [7 x i32], align 16
  %l_30 = alloca i32, align 4
  %i = alloca i32, align 4
  store i64 %p_21, i64* %1, align 8
  store i32 831211331, i32* %l_30, align 4
  store i32 0, i32* %i, align 4
  br label %2

; <label>:2                                       ; preds = %9, %0
  %3 = load i32* %i, align 4
  %4 = icmp slt i32 %3, 7
  br i1 %4, label %5, label %12

; <label>:5                                       ; preds = %2
  %6 = load i32* %i, align 4
  %7 = sext i32 %6 to i64
  %8 = getelementptr inbounds [7 x i32]* %l_24, i32 0, i64 %7
  store i32 -4, i32* %8, align 4
  br label %9

; <label>:9                                       ; preds = %5
  %10 = load i32* %i, align 4
  %11 = add nsw i32 %10, 1
  store i32 %11, i32* %i, align 4
  br label %2

; <label>:12                                      ; preds = %2
  %13 = getelementptr inbounds [7 x i32]* %l_24, i32 0, i64 0
  %14 = load i32* %13, align 4
  %15 = zext i32 %14 to i64
  %16 = load i64* %1, align 8
  %17 = icmp ugt i64 %15, %16
  %18 = zext i1 %17 to i32
  %19 = trunc i32 %18 to i16
  %20 = load i32* @g_12, align 4
  %21 = load i8* @g_11, align 1
  %22 = sext i8 %21 to i32
  %23 = xor i32 %20, %22
  %24 = trunc i32 %23 to i16
  %25 = call signext i16 @safe_mod_func_int16_t_s_s(i16 signext %19, i16 signext %24)
  %26 = sext i16 %25 to i32
  %27 = icmp ne i32 %26, 0
  br i1 %27, label %32, label %28

; <label>:28                                      ; preds = %12
  %29 = getelementptr inbounds [7 x i32]* %l_24, i32 0, i64 0
  %30 = load i32* %29, align 4
  %31 = icmp ne i32 %30, 0
  br label %32

; <label>:32                                      ; preds = %28, %12
  %33 = phi i1 [ true, %12 ], [ %31, %28 ]
  %34 = zext i1 %33 to i32
  %35 = sext i32 %34 to i64
  %36 = icmp ne i64 %35, 0
  %37 = zext i1 %36 to i32
  %38 = call i32 @func_9(i64 1)
  %39 = sext i32 %38 to i64
  %40 = call i32 @func_9(i64 %39)
  %41 = load i8* @g_11, align 1
  %42 = sext i8 %41 to i64
  %43 = call i32 @func_9(i64 %42)
  %44 = trunc i32 %43 to i16
  %45 = load i32* @g_12, align 4
  %46 = load i32* @g_12, align 4
  %47 = zext i32 %46 to i64
  %48 = call i32 @func_9(i64 %47)
  %49 = xor i32 %45, %48
  %50 = trunc i32 %49 to i16
  %51 = call zeroext i16 @safe_div_func_uint16_t_u_u(i16 zeroext %44, i16 zeroext %50)
  %52 = zext i16 %51 to i32
  %53 = xor i32 %40, %52
  %54 = or i32 %37, %53
  %55 = sext i32 %54 to i64
  %56 = load i64* %1, align 8
  %57 = icmp ult i64 %55, %56
  %58 = zext i1 %57 to i32
  store i32 %58, i32* %l_30, align 4
  ret i32* %l_30
}

define internal signext i16 @safe_mod_func_int16_t_s_s(i16 signext %si1, i16 signext %si2) nounwind uwtable {
  %1 = alloca i16, align 2
  %2 = alloca i16, align 2
  store i16 %si1, i16* %1, align 2
  store i16 %si2, i16* %2, align 2
  %3 = load i16* %2, align 2
  %4 = sext i16 %3 to i32
  %5 = icmp eq i32 %4, 0
  br i1 %5, label %14, label %6

; <label>:6                                       ; preds = %0
  %7 = load i16* %1, align 2
  %8 = sext i16 %7 to i32
  %9 = icmp eq i32 %8, -32768
  br i1 %9, label %10, label %17

; <label>:10                                      ; preds = %6
  %11 = load i16* %2, align 2
  %12 = sext i16 %11 to i32
  %13 = icmp eq i32 %12, -1
  br i1 %13, label %14, label %17

; <label>:14                                      ; preds = %10, %0
  %15 = load i16* %1, align 2
  %16 = sext i16 %15 to i32
  br label %23

; <label>:17                                      ; preds = %10, %6
  %18 = load i16* %1, align 2
  %19 = sext i16 %18 to i32
  %20 = load i16* %2, align 2
  %21 = sext i16 %20 to i32
  %22 = srem i32 %19, %21
  br label %23

; <label>:23                                      ; preds = %17, %14
  %24 = phi i32 [ %16, %14 ], [ %22, %17 ]
  %25 = trunc i32 %24 to i16
  ret i16 %25
}

define internal zeroext i16 @safe_div_func_uint16_t_u_u(i16 zeroext %ui1, i16 zeroext %ui2) nounwind uwtable {
  %1 = alloca i16, align 2
  %2 = alloca i16, align 2
  store i16 %ui1, i16* %1, align 2
  store i16 %ui2, i16* %2, align 2
  %3 = load i16* %2, align 2
  %4 = zext i16 %3 to i32
  %5 = icmp eq i32 %4, 0
  br i1 %5, label %6, label %9

; <label>:6                                       ; preds = %0
  %7 = load i16* %1, align 2
  %8 = zext i16 %7 to i32
  br label %15

; <label>:9                                       ; preds = %0
  %10 = load i16* %1, align 2
  %11 = zext i16 %10 to i32
  %12 = load i16* %2, align 2
  %13 = zext i16 %12 to i32
  %14 = sdiv i32 %11, %13
  br label %15

; <label>:15                                      ; preds = %9, %6
  %16 = phi i32 [ %8, %6 ], [ %14, %9 ]
  %17 = trunc i32 %16 to i16
  ret i16 %17
}

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  %4 = call signext i16 @func_1()
  %5 = load i8* @g_11, align 1
  %6 = sext i8 %5 to i32
  %7 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str, i32 0, i32 0), i32 %6)
  %8 = load i32* @g_12, align 4
  %9 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str1, i32 0, i32 0), i32 %8)
  %10 = load i32* @g_32, align 4
  %11 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str2, i32 0, i32 0), i32 %10)
  %12 = load i32* %1
  ret i32 %12
}

declare i32 @printf(i8*, ...)
