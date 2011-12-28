; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith001403.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_4 = global i32 -1965365047, align 4
@g_18 = global i32 0, align 4
@g_19 = global i32* null, align 8
@g_21 = global i32 -1137368052, align 4
@g_23 = global i32 0, align 4
@g_22 = global i32* @g_23, align 8
@.str = private unnamed_addr constant [19 x i8] c"checksum g_4 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [20 x i8] c"checksum g_18 = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [20 x i8] c"checksum g_21 = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [20 x i8] c"checksum g_23 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define signext i8 @func_1() nounwind uwtable {
  %l_5 = alloca i64, align 8
  store i64 -4218924747683735383, i64* %l_5, align 8
  %1 = load i32* @g_4, align 4
  %2 = trunc i32 %1 to i8
  %3 = load i32* @g_4, align 4
  %4 = trunc i32 %3 to i8
  %5 = call signext i8 @safe_mul_func_int8_t_s_s(i8 signext %2, i8 signext %4)
  %6 = sext i8 %5 to i32
  %7 = load i32* @g_4, align 4
  %8 = icmp ne i32 %7, 0
  br i1 %8, label %13, label %9

; <label>:9                                       ; preds = %0
  %10 = load i64* %l_5, align 8
  %11 = xor i64 %10, -1
  %12 = icmp ne i64 %11, 0
  br label %13

; <label>:13                                      ; preds = %9, %0
  %14 = phi i1 [ true, %0 ], [ %12, %9 ]
  %15 = zext i1 %14 to i32
  %16 = icmp slt i32 %6, %15
  br i1 %16, label %24, label %17

; <label>:17                                      ; preds = %13
  %18 = load i32* @g_4, align 4
  %19 = load i32* @g_21, align 4
  %20 = trunc i32 %19 to i16
  %21 = call i32 @func_8(i16 signext %20)
  %22 = call i32 @safe_div_func_int32_t_s_s(i32 %18, i32 %21)
  %23 = icmp ne i32 %22, 0
  br label %24

; <label>:24                                      ; preds = %17, %13
  %25 = phi i1 [ true, %13 ], [ %23, %17 ]
  %26 = zext i1 %25 to i32
  %27 = sext i32 %26 to i64
  %28 = load i64* %l_5, align 8
  %29 = icmp sgt i64 %27, %28
  %30 = zext i1 %29 to i32
  %31 = load volatile i32** @g_22, align 8
  %32 = load i32* %31
  %33 = or i32 %32, %30
  store i32 %33, i32* %31
  %34 = load i32* @g_21, align 4
  %35 = trunc i32 %34 to i8
  ret i8 %35
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

define internal i32 @safe_div_func_int32_t_s_s(i32 %si1, i32 %si2) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 %si1, i32* %1, align 4
  store i32 %si2, i32* %2, align 4
  %3 = load i32* %2, align 4
  %4 = icmp eq i32 %3, 0
  br i1 %4, label %11, label %5

; <label>:5                                       ; preds = %0
  %6 = load i32* %1, align 4
  %7 = icmp eq i32 %6, -2147483648
  br i1 %7, label %8, label %13

; <label>:8                                       ; preds = %5
  %9 = load i32* %2, align 4
  %10 = icmp eq i32 %9, -1
  br i1 %10, label %11, label %13

; <label>:11                                      ; preds = %8, %0
  %12 = load i32* %1, align 4
  br label %17

; <label>:13                                      ; preds = %8, %5
  %14 = load i32* %1, align 4
  %15 = load i32* %2, align 4
  %16 = sdiv i32 %14, %15
  br label %17

; <label>:17                                      ; preds = %13, %11
  %18 = phi i32 [ %12, %11 ], [ %16, %13 ]
  ret i32 %18
}

define i32 @func_8(i16 signext %p_9) nounwind uwtable {
  %1 = alloca i16, align 2
  %l_20 = alloca i32*, align 8
  store i16 %p_9, i16* %1, align 2
  store i32* @g_21, i32** %l_20, align 8
  %2 = load i16* %1, align 2
  %3 = load i32* @g_4, align 4
  %4 = icmp ne i32 %3, 0
  br i1 %4, label %10, label %5

; <label>:5                                       ; preds = %0
  %6 = load i32* @g_4, align 4
  %7 = trunc i32 %6 to i8
  %8 = call i32 @func_16(i8 zeroext %7)
  %9 = icmp ne i32 %8, 0
  br label %10

; <label>:10                                      ; preds = %5, %0
  %11 = phi i1 [ true, %0 ], [ %9, %5 ]
  %12 = zext i1 %11 to i32
  %13 = trunc i32 %12 to i8
  %14 = call signext i8 @safe_lshift_func_int8_t_s_s(i8 signext %13, i32 -972591142)
  %15 = sext i8 %14 to i16
  %16 = call signext i16 @safe_mod_func_int16_t_s_s(i16 signext %2, i16 signext %15)
  %17 = call zeroext i16 @safe_lshift_func_uint16_t_u_u(i16 zeroext %16, i32 8)
  %18 = zext i16 %17 to i32
  %19 = load i32** %l_20, align 8
  %20 = load i32* %19
  %21 = or i32 %20, %18
  store i32 %21, i32* %19
  %22 = load i32** %l_20, align 8
  %23 = load i32* %22
  ret i32 %23
}

define internal zeroext i16 @safe_lshift_func_uint16_t_u_u(i16 zeroext %left, i32 %right) nounwind uwtable {
  %1 = alloca i16, align 2
  %2 = alloca i32, align 4
  store i16 %left, i16* %1, align 2
  store i32 %right, i32* %2, align 4
  %3 = load i32* %2, align 4
  %4 = icmp uge i32 %3, 32
  br i1 %4, label %11, label %5

; <label>:5                                       ; preds = %0
  %6 = load i16* %1, align 2
  %7 = zext i16 %6 to i32
  %8 = load i32* %2, align 4
  %9 = ashr i32 65535, %8
  %10 = icmp sgt i32 %7, %9
  br i1 %10, label %11, label %14

; <label>:11                                      ; preds = %5, %0
  %12 = load i16* %1, align 2
  %13 = zext i16 %12 to i32
  br label %19

; <label>:14                                      ; preds = %5
  %15 = load i16* %1, align 2
  %16 = zext i16 %15 to i32
  %17 = load i32* %2, align 4
  %18 = shl i32 %16, %17
  br label %19

; <label>:19                                      ; preds = %14, %11
  %20 = phi i32 [ %13, %11 ], [ %18, %14 ]
  %21 = trunc i32 %20 to i16
  ret i16 %21
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

define internal signext i8 @safe_lshift_func_int8_t_s_s(i8 signext %left, i32 %right) nounwind uwtable {
  %1 = alloca i8, align 1
  %2 = alloca i32, align 4
  store i8 %left, i8* %1, align 1
  store i32 %right, i32* %2, align 4
  %3 = load i8* %1, align 1
  %4 = sext i8 %3 to i32
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
  %13 = load i8* %1, align 1
  %14 = sext i8 %13 to i32
  %15 = load i32* %2, align 4
  %16 = ashr i32 127, %15
  %17 = icmp sgt i32 %14, %16
  br i1 %17, label %18, label %21

; <label>:18                                      ; preds = %12, %9, %6, %0
  %19 = load i8* %1, align 1
  %20 = sext i8 %19 to i32
  br label %26

; <label>:21                                      ; preds = %12
  %22 = load i8* %1, align 1
  %23 = sext i8 %22 to i32
  %24 = load i32* %2, align 4
  %25 = shl i32 %23, %24
  br label %26

; <label>:26                                      ; preds = %21, %18
  %27 = phi i32 [ %20, %18 ], [ %25, %21 ]
  %28 = trunc i32 %27 to i8
  ret i8 %28
}

define i32 @func_16(i8 zeroext %p_17) nounwind uwtable {
  %1 = alloca i8, align 1
  store i8 %p_17, i8* %1, align 1
  %2 = load i32* @g_18, align 4
  ret i32 %2
}

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  %4 = call signext i8 @func_1()
  %5 = load i32* @g_4, align 4
  %6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %5)
  %7 = load i32* @g_18, align 4
  %8 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str1, i32 0, i32 0), i32 %7)
  %9 = load i32* @g_21, align 4
  %10 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str2, i32 0, i32 0), i32 %9)
  %11 = load i32* @g_23, align 4
  %12 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str3, i32 0, i32 0), i32 %11)
  %13 = load i32* %1
  ret i32 %13
}

declare i32 @printf(i8*, ...)
