; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith001925.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = global i32 0, align 4
@g_13 = global i32 0, align 4
@g_25 = global i32* null, align 8
@g_24 = global i32** @g_25, align 8
@.str = private unnamed_addr constant [19 x i8] c"checksum g_2 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [20 x i8] c"checksum g_13 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define zeroext i16 @func_1() nounwind uwtable {
  %l_17 = alloca [10 x i8], align 1
  %i = alloca i32, align 4
  %l_14 = alloca i32, align 4
  %l_16 = alloca i32*, align 8
  %l_15 = alloca i32**, align 8
  store i32 0, i32* %i, align 4
  br label %1

; <label>:1                                       ; preds = %8, %0
  %2 = load i32* %i, align 4
  %3 = icmp slt i32 %2, 10
  br i1 %3, label %4, label %11

; <label>:4                                       ; preds = %1
  %5 = load i32* %i, align 4
  %6 = sext i32 %5 to i64
  %7 = getelementptr inbounds [10 x i8]* %l_17, i32 0, i64 %6
  store i8 1, i8* %7, align 1
  br label %8

; <label>:8                                       ; preds = %4
  %9 = load i32* %i, align 4
  %10 = add nsw i32 %9, 1
  store i32 %10, i32* %i, align 4
  br label %1

; <label>:11                                      ; preds = %1
  store volatile i32 -26, i32* @g_2, align 4
  br label %12

; <label>:12                                      ; preds = %49, %11
  %13 = load volatile i32* @g_2, align 4
  %14 = icmp eq i32 %13, -12
  br i1 %14, label %15, label %54

; <label>:15                                      ; preds = %12
  store i32 -764396133, i32* %l_14, align 4
  store i32* null, i32** %l_16, align 8
  store i32** %l_16, i32*** %l_15, align 8
  %16 = load i32* @g_13, align 4
  %17 = sext i32 %16 to i64
  %18 = call i32* @func_5(i32* null, i64 %17, i16 zeroext 15771)
  %19 = load i32*** %l_15, align 8
  store i32* %18, i32** %19
  store volatile i32 0, i32* @g_2, align 4
  br label %20

; <label>:20                                      ; preds = %27, %15
  %21 = load volatile i32* @g_2, align 4
  %22 = icmp slt i32 %21, 10
  br i1 %22, label %23, label %30

; <label>:23                                      ; preds = %20
  %24 = load volatile i32* @g_2, align 4
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds [10 x i8]* %l_17, i32 0, i64 %25
  store i8 1, i8* %26, align 1
  br label %27

; <label>:27                                      ; preds = %23
  %28 = load volatile i32* @g_2, align 4
  %29 = add nsw i32 %28, 1
  store volatile i32 %29, i32* @g_2, align 4
  br label %20

; <label>:30                                      ; preds = %20
  %31 = call zeroext i16 @safe_mul_func_uint16_t_u_u(i16 zeroext 0, i16 zeroext -10)
  %32 = zext i16 %31 to i32
  %33 = load i32* @g_13, align 4
  %34 = trunc i32 %33 to i16
  %35 = call signext i16 @safe_lshift_func_int16_t_s_u(i16 signext %34, i32 -3)
  %36 = sext i16 %35 to i32
  %37 = icmp slt i32 %32, %36
  %38 = zext i1 %37 to i32
  %39 = load i32** %l_16, align 8
  store i32 %38, i32* %39
  store i32 0, i32* @g_13, align 4
  br label %40

; <label>:40                                      ; preds = %45, %30
  %41 = load i32* @g_13, align 4
  %42 = icmp ne i32 %41, 0
  br i1 %42, label %43, label %48

; <label>:43                                      ; preds = %40
  %44 = load i32*** %l_15, align 8
  store i32* null, i32** %44
  br label %45

; <label>:45                                      ; preds = %43
  %46 = load i32* @g_13, align 4
  %47 = call i32 @safe_sub_func_uint32_t_u_u(i32 %46, i32 1)
  store i32 %47, i32* @g_13, align 4
  br label %40

; <label>:48                                      ; preds = %40
  br label %49

; <label>:49                                      ; preds = %48
  %50 = load volatile i32* @g_2, align 4
  %51 = trunc i32 %50 to i8
  %52 = call zeroext i8 @safe_sub_func_uint8_t_u_u(i8 zeroext %51, i8 zeroext 5)
  %53 = zext i8 %52 to i32
  store volatile i32 %53, i32* @g_2, align 4
  br label %12

; <label>:54                                      ; preds = %12
  %55 = load volatile i32*** @g_24, align 8
  store i32* @g_2, i32** %55
  %56 = load volatile i32* @g_2, align 4
  %57 = trunc i32 %56 to i16
  ret i16 %57
}

define i32* @func_5(i32* %p_6, i64 %p_7, i16 zeroext %p_8) nounwind uwtable {
  %1 = alloca i32*, align 8
  %2 = alloca i64, align 8
  %3 = alloca i16, align 2
  %l_11 = alloca i32, align 4
  %l_12 = alloca i32*, align 8
  store i32* %p_6, i32** %1, align 8
  store i64 %p_7, i64* %2, align 8
  store i16 %p_8, i16* %3, align 2
  store i32 1274613468, i32* %l_11, align 4
  store i32* @g_13, i32** %l_12, align 8
  %4 = call signext i8 @safe_mod_func_int8_t_s_s(i8 signext -36, i8 signext -36)
  %5 = sext i8 %4 to i32
  %6 = load i32** %l_12, align 8
  store i32 %5, i32* %6
  ret i32* @g_13
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

define internal signext i16 @safe_lshift_func_int16_t_s_u(i16 signext %left, i32 %right) nounwind uwtable {
  %1 = alloca i16, align 2
  %2 = alloca i32, align 4
  store i16 %left, i16* %1, align 2
  store i32 %right, i32* %2, align 4
  %3 = load i16* %1, align 2
  %4 = sext i16 %3 to i32
  %5 = icmp slt i32 %4, 0
  br i1 %5, label %15, label %6

; <label>:6                                       ; preds = %0
  %7 = load i32* %2, align 4
  %8 = icmp uge i32 %7, 32
  br i1 %8, label %15, label %9

; <label>:9                                       ; preds = %6
  %10 = load i16* %1, align 2
  %11 = sext i16 %10 to i32
  %12 = load i32* %2, align 4
  %13 = ashr i32 32767, %12
  %14 = icmp sgt i32 %11, %13
  br i1 %14, label %15, label %18

; <label>:15                                      ; preds = %9, %6, %0
  %16 = load i16* %1, align 2
  %17 = sext i16 %16 to i32
  br label %23

; <label>:18                                      ; preds = %9
  %19 = load i16* %1, align 2
  %20 = sext i16 %19 to i32
  %21 = load i32* %2, align 4
  %22 = shl i32 %20, %21
  br label %23

; <label>:23                                      ; preds = %18, %15
  %24 = phi i32 [ %17, %15 ], [ %22, %18 ]
  %25 = trunc i32 %24 to i16
  ret i16 %25
}

define internal i32 @safe_sub_func_uint32_t_u_u(i32 %ui1, i32 %ui2) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 %ui1, i32* %1, align 4
  store i32 %ui2, i32* %2, align 4
  %3 = load i32* %1, align 4
  %4 = load i32* %2, align 4
  %5 = sub i32 %3, %4
  ret i32 %5
}

define internal zeroext i8 @safe_sub_func_uint8_t_u_u(i8 zeroext %ui1, i8 zeroext %ui2) nounwind uwtable {
  %1 = alloca i8, align 1
  %2 = alloca i8, align 1
  store i8 %ui1, i8* %1, align 1
  store i8 %ui2, i8* %2, align 1
  %3 = load i8* %1, align 1
  %4 = zext i8 %3 to i32
  %5 = load i8* %2, align 1
  %6 = zext i8 %5 to i32
  %7 = sub nsw i32 %4, %6
  %8 = trunc i32 %7 to i8
  ret i8 %8
}

define internal signext i8 @safe_mod_func_int8_t_s_s(i8 signext %si1, i8 signext %si2) nounwind uwtable {
  %1 = alloca i8, align 1
  %2 = alloca i8, align 1
  store i8 %si1, i8* %1, align 1
  store i8 %si2, i8* %2, align 1
  %3 = load i8* %2, align 1
  %4 = sext i8 %3 to i32
  %5 = icmp eq i32 %4, 0
  br i1 %5, label %14, label %6

; <label>:6                                       ; preds = %0
  %7 = load i8* %1, align 1
  %8 = sext i8 %7 to i32
  %9 = icmp eq i32 %8, -128
  br i1 %9, label %10, label %17

; <label>:10                                      ; preds = %6
  %11 = load i8* %2, align 1
  %12 = sext i8 %11 to i32
  %13 = icmp eq i32 %12, -1
  br i1 %13, label %14, label %17

; <label>:14                                      ; preds = %10, %0
  %15 = load i8* %1, align 1
  %16 = sext i8 %15 to i32
  br label %23

; <label>:17                                      ; preds = %10, %6
  %18 = load i8* %1, align 1
  %19 = sext i8 %18 to i32
  %20 = load i8* %2, align 1
  %21 = sext i8 %20 to i32
  %22 = srem i32 %19, %21
  br label %23

; <label>:23                                      ; preds = %17, %14
  %24 = phi i32 [ %16, %14 ], [ %22, %17 ]
  %25 = trunc i32 %24 to i8
  ret i8 %25
}

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  %4 = call zeroext i16 @func_1()
  %5 = load volatile i32* @g_2, align 4
  %6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %5)
  %7 = load i32* @g_13, align 4
  %8 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str1, i32 0, i32 0), i32 %7)
  %9 = load i32* %1
  ret i32 %9
}

declare i32 @printf(i8*, ...)
