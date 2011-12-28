; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith001669.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_3 = global [1 x i32] [i32 1], align 4
@g_15 = global i32 1799092786, align 4
@g_19 = global i32* getelementptr inbounds ([1 x i32]* @g_3, i32 0, i32 0), align 8
@g_18 = global i32** @g_19, align 8
@.str = private unnamed_addr constant [22 x i8] c"checksum g_3[0] = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [20 x i8] c"checksum g_15 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i64 @func_1() nounwind uwtable {
  %l_2 = alloca i32*, align 8
  %l_14 = alloca i32*, align 8
  store i32* getelementptr inbounds ([1 x i32]* @g_3, i32 0, i64 0), i32** %l_2, align 8
  store i32* @g_15, i32** %l_14, align 8
  %1 = load i32** %l_2, align 8
  store i32 194431532, i32* %1
  %2 = load i32** %l_2, align 8
  %3 = icmp eq i32* null, %2
  %4 = zext i1 %3 to i32
  %5 = trunc i32 %4 to i8
  %6 = load i32* getelementptr inbounds ([1 x i32]* @g_3, i32 0, i64 0), align 4
  %7 = load i32* getelementptr inbounds ([1 x i32]* @g_3, i32 0, i64 0), align 4
  %8 = xor i32 %6, %7
  %9 = trunc i32 %8 to i16
  %10 = load i32* getelementptr inbounds ([1 x i32]* @g_3, i32 0, i64 0), align 4
  %11 = trunc i32 %10 to i8
  %12 = load i32* getelementptr inbounds ([1 x i32]* @g_3, i32 0, i64 0), align 4
  %13 = trunc i32 %12 to i8
  %14 = call signext i8 @safe_mul_func_int8_t_s_s(i8 signext %11, i8 signext %13)
  %15 = sext i8 %14 to i32
  %16 = call zeroext i16 @safe_lshift_func_uint16_t_u_s(i16 zeroext %9, i32 %15)
  %17 = trunc i16 %16 to i8
  %18 = call signext i8 @safe_mod_func_int8_t_s_s(i8 signext %5, i8 signext %17)
  %19 = sext i8 %18 to i32
  %20 = icmp ne i32 %19, 0
  br i1 %20, label %25, label %21

; <label>:21                                      ; preds = %0
  %22 = load i32** %l_2, align 8
  %23 = load i32* %22
  %24 = icmp ne i32 %23, 0
  br label %25

; <label>:25                                      ; preds = %21, %0
  %26 = phi i1 [ true, %0 ], [ %24, %21 ]
  %27 = zext i1 %26 to i32
  %28 = trunc i32 %27 to i8
  %29 = load i32* getelementptr inbounds ([1 x i32]* @g_3, i32 0, i64 0), align 4
  %30 = trunc i32 %29 to i8
  %31 = load i32* getelementptr inbounds ([1 x i32]* @g_3, i32 0, i64 0), align 4
  %32 = trunc i32 %31 to i8
  %33 = call zeroext i8 @safe_div_func_uint8_t_u_u(i8 zeroext %30, i8 zeroext %32)
  %34 = zext i8 %33 to i32
  %35 = call signext i8 @safe_rshift_func_int8_t_s_u(i8 signext %28, i32 %34)
  %36 = sext i8 %35 to i64
  %37 = xor i64 %36, -1
  %38 = load i32** %l_14, align 8
  %39 = load i32* %38
  %40 = sext i32 %39 to i64
  %41 = or i64 %40, %37
  %42 = trunc i64 %41 to i32
  store i32 %42, i32* %38
  %43 = load i32** %l_2, align 8
  %44 = load i32* %43
  %45 = sext i32 %44 to i64
  %46 = xor i64 %45, 0
  %47 = trunc i64 %46 to i32
  store i32 %47, i32* %43
  store i32 8, i32* @g_15, align 4
  br label %48

; <label>:48                                      ; preds = %54, %25
  %49 = load i32* @g_15, align 4
  %50 = icmp sle i32 %49, 1
  br i1 %50, label %51, label %59

; <label>:51                                      ; preds = %48
  %52 = load i32** %l_2, align 8
  %53 = load volatile i32*** @g_18, align 8
  store i32* %52, i32** %53
  br label %54

; <label>:54                                      ; preds = %51
  %55 = load i32* @g_15, align 4
  %56 = trunc i32 %55 to i16
  %57 = call signext i16 @safe_sub_func_int16_t_s_s(i16 signext %56, i16 signext 4)
  %58 = sext i16 %57 to i32
  store i32 %58, i32* @g_15, align 4
  br label %48

; <label>:59                                      ; preds = %48
  %60 = load i32* @g_15, align 4
  %61 = sext i32 %60 to i64
  ret i64 %61
}

define internal signext i8 @safe_rshift_func_int8_t_s_u(i8 signext %left, i32 %right) nounwind uwtable {
  %1 = alloca i8, align 1
  %2 = alloca i32, align 4
  store i8 %left, i8* %1, align 1
  store i32 %right, i32* %2, align 4
  %3 = load i8* %1, align 1
  %4 = sext i8 %3 to i32
  %5 = icmp slt i32 %4, 0
  br i1 %5, label %9, label %6

; <label>:6                                       ; preds = %0
  %7 = load i32* %2, align 4
  %8 = icmp uge i32 %7, 32
  br i1 %8, label %9, label %12

; <label>:9                                       ; preds = %6, %0
  %10 = load i8* %1, align 1
  %11 = sext i8 %10 to i32
  br label %17

; <label>:12                                      ; preds = %6
  %13 = load i8* %1, align 1
  %14 = sext i8 %13 to i32
  %15 = load i32* %2, align 4
  %16 = ashr i32 %14, %15
  br label %17

; <label>:17                                      ; preds = %12, %9
  %18 = phi i32 [ %11, %9 ], [ %16, %12 ]
  %19 = trunc i32 %18 to i8
  ret i8 %19
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

define internal zeroext i8 @safe_div_func_uint8_t_u_u(i8 zeroext %ui1, i8 zeroext %ui2) nounwind uwtable {
  %1 = alloca i8, align 1
  %2 = alloca i8, align 1
  store i8 %ui1, i8* %1, align 1
  store i8 %ui2, i8* %2, align 1
  %3 = load i8* %2, align 1
  %4 = zext i8 %3 to i32
  %5 = icmp eq i32 %4, 0
  br i1 %5, label %6, label %9

; <label>:6                                       ; preds = %0
  %7 = load i8* %1, align 1
  %8 = zext i8 %7 to i32
  br label %15

; <label>:9                                       ; preds = %0
  %10 = load i8* %1, align 1
  %11 = zext i8 %10 to i32
  %12 = load i8* %2, align 1
  %13 = zext i8 %12 to i32
  %14 = sdiv i32 %11, %13
  br label %15

; <label>:15                                      ; preds = %9, %6
  %16 = phi i32 [ %8, %6 ], [ %14, %9 ]
  %17 = trunc i32 %16 to i8
  ret i8 %17
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
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  %4 = call i64 @func_1()
  %5 = load i32* getelementptr inbounds ([1 x i32]* @g_3, i32 0, i64 0), align 4
  %6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str, i32 0, i32 0), i32 %5)
  %7 = load i32* getelementptr inbounds ([1 x i32]* @g_3, i32 0, i64 0), align 4
  %8 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str, i32 0, i32 0), i32 %7)
  %9 = load i32* @g_15, align 4
  %10 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str1, i32 0, i32 0), i32 %9)
  %11 = load i32* %1
  ret i32 %11
}

declare i32 @printf(i8*, ...)
