; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith000391.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_9 = global i32 -2, align 4
@g_11 = global i32* @g_9, align 8
@g_10 = global i32** @g_11, align 8
@g_25 = global i32* @g_9, align 8
@.str = private unnamed_addr constant [19 x i8] c"checksum g_9 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i64 @func_1() nounwind uwtable {
  %l_13 = alloca i16, align 2
  %l_18 = alloca i8, align 1
  store i16 -8, i16* %l_13, align 2
  store i8 8, i8* %l_18, align 1
  %1 = load i32** @g_11, align 8
  %2 = load i32* %1
  %3 = xor i32 %2, 65528
  %4 = sext i32 %3 to i64
  %5 = icmp sgt i64 %4, 2162176962
  br i1 %5, label %11, label %6

; <label>:6                                       ; preds = %0
  %7 = load volatile i32*** @g_10, align 8
  %8 = load i32** %7
  %9 = load i32* %8
  %10 = icmp ne i32 %9, 0
  br label %11

; <label>:11                                      ; preds = %6, %0
  %12 = phi i1 [ true, %0 ], [ %10, %6 ]
  %13 = zext i1 %12 to i32
  %14 = trunc i32 %13 to i16
  %15 = load i8* %l_18, align 1
  %16 = sext i8 %15 to i32
  %17 = load i32** @g_11, align 8
  %18 = load i32* %17
  %19 = icmp slt i32 %16, %18
  %20 = zext i1 %19 to i32
  %21 = trunc i32 %20 to i8
  %22 = load i32** @g_11, align 8
  %23 = load i32* %22
  %24 = call signext i8 @safe_lshift_func_int8_t_s_u(i8 signext %21, i32 %23)
  %25 = sext i8 %24 to i16
  %26 = call signext i16 @safe_mul_func_int16_t_s_s(i16 signext %25, i16 signext 13594)
  %27 = sext i16 %26 to i32
  %28 = call i32 @func_4(i32 65528, i16 zeroext %14, i32 %27)
  %29 = load i32* @g_9, align 4
  %30 = trunc i32 %29 to i16
  %31 = call zeroext i16 @safe_add_func_uint16_t_u_u(i16 zeroext %30, i16 zeroext 0)
  %32 = zext i16 %31 to i32
  %33 = call i32 @safe_sub_func_int32_t_s_s(i32 %28, i32 %32)
  %34 = load i8* %l_18, align 1
  %35 = sext i8 %34 to i32
  %36 = load i8* %l_18, align 1
  %37 = sext i8 %36 to i32
  %38 = and i32 65528, %37
  %39 = and i32 %35, %38
  %40 = icmp ne i32 %39, 0
  br i1 %40, label %41, label %49

; <label>:41                                      ; preds = %11
  %42 = load i8* %l_18, align 1
  %43 = icmp ne i8 %42, 0
  %44 = xor i1 %43, true
  %45 = zext i1 %44 to i32
  %46 = call signext i16 @safe_rshift_func_int16_t_s_s(i16 signext -8, i32 %45)
  %47 = sext i16 %46 to i32
  %48 = icmp ne i32 %47, 0
  br label %49

; <label>:49                                      ; preds = %41, %11
  %50 = phi i1 [ false, %11 ], [ %48, %41 ]
  %51 = zext i1 %50 to i32
  %52 = load i32* @g_9, align 4
  %53 = icmp sge i32 %51, %52
  %54 = zext i1 %53 to i32
  %55 = trunc i32 %54 to i16
  %56 = call zeroext i16 @safe_div_func_uint16_t_u_u(i16 zeroext %55, i16 zeroext 3627)
  %57 = zext i16 %56 to i32
  %58 = icmp eq i32 %33, %57
  %59 = zext i1 %58 to i32
  %60 = load volatile i32** @g_25, align 8
  store i32 %59, i32* %60
  ret i64 65528
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

define i32 @func_4(i32 %p_5, i16 zeroext %p_6, i32 %p_7) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i16, align 2
  %3 = alloca i32, align 4
  %l_8 = alloca [5 x i32*], align 16
  %l_12 = alloca i8, align 1
  %i = alloca i32, align 4
  store i32 %p_5, i32* %1, align 4
  store i16 %p_6, i16* %2, align 2
  store i32 %p_7, i32* %3, align 4
  store i8 0, i8* %l_12, align 1
  store i32 0, i32* %i, align 4
  br label %4

; <label>:4                                       ; preds = %11, %0
  %5 = load i32* %i, align 4
  %6 = icmp slt i32 %5, 5
  br i1 %6, label %7, label %14

; <label>:7                                       ; preds = %4
  %8 = load i32* %i, align 4
  %9 = sext i32 %8 to i64
  %10 = getelementptr inbounds [5 x i32*]* %l_8, i32 0, i64 %9
  store i32* @g_9, i32** %10, align 8
  br label %11

; <label>:11                                      ; preds = %7
  %12 = load i32* %i, align 4
  %13 = add nsw i32 %12, 1
  store i32 %13, i32* %i, align 4
  br label %4

; <label>:14                                      ; preds = %4
  %15 = getelementptr inbounds [5 x i32*]* %l_8, i32 0, i64 1
  %16 = load i32** %15, align 8
  %17 = load volatile i32*** @g_10, align 8
  store i32* %16, i32** %17
  %18 = load i8* %l_12, align 1
  %19 = sext i8 %18 to i32
  ret i32 %19
}

define internal signext i16 @safe_mul_func_int16_t_s_s(i16 signext %si1, i16 signext %si2) nounwind uwtable {
  %1 = alloca i16, align 2
  %2 = alloca i16, align 2
  store i16 %si1, i16* %1, align 2
  store i16 %si2, i16* %2, align 2
  %3 = load i16* %1, align 2
  %4 = sext i16 %3 to i32
  %5 = load i16* %2, align 2
  %6 = sext i16 %5 to i32
  %7 = mul nsw i32 %4, %6
  %8 = trunc i32 %7 to i16
  ret i16 %8
}

define internal signext i8 @safe_lshift_func_int8_t_s_u(i8 signext %left, i32 %right) nounwind uwtable {
  %1 = alloca i8, align 1
  %2 = alloca i32, align 4
  store i8 %left, i8* %1, align 1
  store i32 %right, i32* %2, align 4
  %3 = load i8* %1, align 1
  %4 = sext i8 %3 to i32
  %5 = icmp slt i32 %4, 0
  br i1 %5, label %15, label %6

; <label>:6                                       ; preds = %0
  %7 = load i32* %2, align 4
  %8 = icmp uge i32 %7, 32
  br i1 %8, label %15, label %9

; <label>:9                                       ; preds = %6
  %10 = load i8* %1, align 1
  %11 = sext i8 %10 to i32
  %12 = load i32* %2, align 4
  %13 = ashr i32 127, %12
  %14 = icmp sgt i32 %11, %13
  br i1 %14, label %15, label %18

; <label>:15                                      ; preds = %9, %6, %0
  %16 = load i8* %1, align 1
  %17 = sext i8 %16 to i32
  br label %23

; <label>:18                                      ; preds = %9
  %19 = load i8* %1, align 1
  %20 = sext i8 %19 to i32
  %21 = load i32* %2, align 4
  %22 = shl i32 %20, %21
  br label %23

; <label>:23                                      ; preds = %18, %15
  %24 = phi i32 [ %17, %15 ], [ %22, %18 ]
  %25 = trunc i32 %24 to i8
  ret i8 %25
}

define internal zeroext i16 @safe_add_func_uint16_t_u_u(i16 zeroext %ui1, i16 zeroext %ui2) nounwind uwtable {
  %1 = alloca i16, align 2
  %2 = alloca i16, align 2
  store i16 %ui1, i16* %1, align 2
  store i16 %ui2, i16* %2, align 2
  %3 = load i16* %1, align 2
  %4 = zext i16 %3 to i32
  %5 = load i16* %2, align 2
  %6 = zext i16 %5 to i32
  %7 = add nsw i32 %4, %6
  %8 = trunc i32 %7 to i16
  ret i16 %8
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

define internal signext i16 @safe_rshift_func_int16_t_s_s(i16 signext %left, i32 %right) nounwind uwtable {
  %1 = alloca i16, align 2
  %2 = alloca i32, align 4
  store i16 %left, i16* %1, align 2
  store i32 %right, i32* %2, align 4
  %3 = load i16* %1, align 2
  %4 = sext i16 %3 to i32
  %5 = icmp slt i32 %4, 0
  br i1 %5, label %12, label %6

; <label>:6                                       ; preds = %0
  %7 = load i32* %2, align 4
  %8 = icmp slt i32 %7, 0
  br i1 %8, label %12, label %9

; <label>:9                                       ; preds = %6
  %10 = load i32* %2, align 4
  %11 = icmp sge i32 %10, 32
  br i1 %11, label %12, label %15

; <label>:12                                      ; preds = %9, %6, %0
  %13 = load i16* %1, align 2
  %14 = sext i16 %13 to i32
  br label %20

; <label>:15                                      ; preds = %9
  %16 = load i16* %1, align 2
  %17 = sext i16 %16 to i32
  %18 = load i32* %2, align 4
  %19 = ashr i32 %17, %18
  br label %20

; <label>:20                                      ; preds = %15, %12
  %21 = phi i32 [ %14, %12 ], [ %19, %15 ]
  %22 = trunc i32 %21 to i16
  ret i16 %22
}

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  %4 = call i64 @func_1()
  %5 = load i32* @g_9, align 4
  %6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %5)
  %7 = load i32* %1
  ret i32 %7
}

declare i32 @printf(i8*, ...)
