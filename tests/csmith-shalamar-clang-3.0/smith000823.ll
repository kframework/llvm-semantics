; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith000823.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_5 = global i32 -1, align 4
@g_18 = global i32 9, align 4
@g_17 = global i32* @g_18, align 8
@g_19 = global i32* @g_18, align 8
@.str = private unnamed_addr constant [19 x i8] c"checksum g_5 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [20 x i8] c"checksum g_18 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define signext i16 @func_1() nounwind uwtable {
  %l_4 = alloca i32, align 4
  %l_16 = alloca [6 x i8], align 1
  %i = alloca i32, align 4
  store i32 0, i32* %l_4, align 4
  store i32 0, i32* %i, align 4
  br label %1

; <label>:1                                       ; preds = %8, %0
  %2 = load i32* %i, align 4
  %3 = icmp slt i32 %2, 6
  br i1 %3, label %4, label %11

; <label>:4                                       ; preds = %1
  %5 = load i32* %i, align 4
  %6 = sext i32 %5 to i64
  %7 = getelementptr inbounds [6 x i8]* %l_16, i32 0, i64 %6
  store i8 -39, i8* %7, align 1
  br label %8

; <label>:8                                       ; preds = %4
  %9 = load i32* %i, align 4
  %10 = add nsw i32 %9, 1
  store i32 %10, i32* %i, align 4
  br label %1

; <label>:11                                      ; preds = %1
  %12 = load i32* %l_4, align 4
  %13 = sext i32 %12 to i64
  %14 = icmp sle i64 2287759131, %13
  %15 = zext i1 %14 to i32
  %16 = trunc i32 %15 to i16
  %17 = load volatile i32* @g_5, align 4
  %18 = load i32* %l_4, align 4
  %19 = load i32* %l_4, align 4
  %20 = or i32 %18, %19
  %21 = sext i32 %20 to i64
  %22 = icmp slt i64 %21, -1
  br i1 %22, label %28, label %23

; <label>:23                                      ; preds = %11
  %24 = getelementptr inbounds [6 x i8]* %l_16, i32 0, i64 0
  %25 = load i8* %24, align 1
  %26 = call i32 @func_6(i8 zeroext %25)
  %27 = icmp ne i32 %26, 0
  br label %28

; <label>:28                                      ; preds = %23, %11
  %29 = phi i1 [ true, %11 ], [ %27, %23 ]
  %30 = zext i1 %29 to i32
  %31 = and i32 %17, %30
  %32 = trunc i32 %31 to i16
  %33 = call signext i16 @safe_sub_func_int16_t_s_s(i16 signext %16, i16 signext %32)
  %34 = sext i16 %33 to i32
  %35 = getelementptr inbounds [6 x i8]* %l_16, i32 0, i64 0
  %36 = load i8* %35, align 1
  %37 = sext i8 %36 to i32
  %38 = xor i32 %34, %37
  %39 = load volatile i32** @g_17, align 8
  store i32 %38, i32* %39
  %40 = load volatile i32** @g_17, align 8
  %41 = load i32* %40
  %42 = load volatile i32** @g_17, align 8
  store i32 %41, i32* %42
  %43 = getelementptr inbounds [6 x i8]* %l_16, i32 0, i64 1
  %44 = load i8* %43, align 1
  %45 = sext i8 %44 to i32
  %46 = load volatile i32** @g_19, align 8
  store i32 %45, i32* %46
  %47 = load volatile i32* @g_5, align 4
  %48 = trunc i32 %47 to i16
  ret i16 %48
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

define i32 @func_6(i8 zeroext %p_7) nounwind uwtable {
  %1 = alloca i8, align 1
  %l_14 = alloca i16, align 2
  %l_15 = alloca i32, align 4
  store i8 %p_7, i8* %1, align 1
  store i16 1, i16* %l_14, align 2
  store i32 -1, i32* %l_15, align 4
  %2 = load i8* %1, align 1
  %3 = zext i8 %2 to i64
  %4 = icmp slt i64 %3, 3655192313
  %5 = zext i1 %4 to i32
  %6 = sext i32 %5 to i64
  %7 = call signext i8 @safe_mul_func_int8_t_s_s(i8 signext 1, i8 signext -1)
  %8 = sext i8 %7 to i64
  %9 = call i64 @safe_div_func_int64_t_s_s(i64 %6, i64 %8)
  %10 = trunc i64 %9 to i32
  %11 = call i32 @safe_sub_func_int32_t_s_s(i32 -5, i32 %10)
  %12 = load i16* %l_14, align 2
  %13 = sext i16 %12 to i32
  %14 = icmp sle i32 %11, %13
  %15 = zext i1 %14 to i32
  store i32 %15, i32* %l_15, align 4
  %16 = load i16* %l_14, align 2
  %17 = sext i16 %16 to i32
  ret i32 %17
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

define internal signext i8 @safe_mul_func_int8_t_s_s(i8 signext %si1, i8 signext %si2) nounwind uwtable {
  %1 = alloca i8, align 1
  %2 = alloca i8, align 1
  store i8 %si1, i8* %1, align 1
  store i8 %si2, i8* %2, align 1
  %3 = load i8* %1, align 1
  %4 = sext i8 %3 to i32
  %5 = load i8* %2, align 1
  %6 = sext i8 %5 to i32
  %7 = mul nsw i32 %4, %6
  %8 = trunc i32 %7 to i8
  ret i8 %8
}

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  %4 = call signext i16 @func_1()
  %5 = load volatile i32* @g_5, align 4
  %6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %5)
  %7 = load i32* @g_18, align 4
  %8 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str1, i32 0, i32 0), i32 %7)
  %9 = load i32* %1
  ret i32 %9
}

declare i32 @printf(i8*, ...)
