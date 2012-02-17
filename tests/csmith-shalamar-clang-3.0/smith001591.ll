; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith001591.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_3 = global i32 96995658, align 4
@g_15 = global [2 x i8] c"\06\06", align 1
@.str = private unnamed_addr constant [19 x i8] c"checksum g_3 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [23 x i8] c"checksum g_15[0] = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [23 x i8] c"checksum g_15[1] = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable {
  %l_2 = alloca [1 x [2 x i32*]], align 16
  %l_12 = alloca i8, align 1
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i8 -38, i8* %l_12, align 1
  store i32 0, i32* %i, align 4
  br label %1

; <label>:1                                       ; preds = %19, %0
  %2 = load i32* %i, align 4
  %3 = icmp slt i32 %2, 1
  br i1 %3, label %4, label %22

; <label>:4                                       ; preds = %1
  store i32 0, i32* %j, align 4
  br label %5

; <label>:5                                       ; preds = %15, %4
  %6 = load i32* %j, align 4
  %7 = icmp slt i32 %6, 2
  br i1 %7, label %8, label %18

; <label>:8                                       ; preds = %5
  %9 = load i32* %j, align 4
  %10 = sext i32 %9 to i64
  %11 = load i32* %i, align 4
  %12 = sext i32 %11 to i64
  %13 = getelementptr inbounds [1 x [2 x i32*]]* %l_2, i32 0, i64 %12
  %14 = getelementptr inbounds [2 x i32*]* %13, i32 0, i64 %10
  store i32* @g_3, i32** %14, align 8
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
  store i32 -1617219176, i32* @g_3, align 4
  %23 = load i32* @g_3, align 4
  %24 = load i32* @g_3, align 4
  %25 = trunc i32 %24 to i16
  %26 = load i32* @g_3, align 4
  %27 = load i32* @g_3, align 4
  %28 = xor i32 %26, %27
  %29 = trunc i32 %28 to i8
  %30 = load i8* %l_12, align 1
  %31 = call signext i8 @safe_mod_func_int8_t_s_s(i8 signext %29, i8 signext %30)
  %32 = sext i8 %31 to i16
  %33 = load i32* @g_3, align 4
  %34 = trunc i32 %33 to i16
  %35 = call signext i16 @safe_mod_func_int16_t_s_s(i16 signext %32, i16 signext %34)
  %36 = sext i16 %35 to i32
  %37 = call signext i16 @safe_rshift_func_int16_t_s_u(i16 signext %25, i32 %36)
  %38 = sext i16 %37 to i32
  %39 = xor i32 %23, %38
  %40 = trunc i32 %39 to i16
  %41 = load i32* @g_3, align 4
  %42 = trunc i32 %41 to i16
  %43 = load i32* @g_3, align 4
  %44 = load i32* @g_3, align 4
  %45 = or i32 %43, %44
  %46 = call zeroext i16 @safe_rshift_func_uint16_t_u_s(i16 zeroext %42, i32 %45)
  %47 = zext i16 %46 to i32
  %48 = call zeroext i16 @safe_lshift_func_uint16_t_u_u(i16 zeroext %40, i32 %47)
  %49 = zext i16 %48 to i32
  %50 = load i8* getelementptr inbounds ([2 x i8]* @g_15, i32 0, i64 0), align 1
  %51 = sext i8 %50 to i32
  %52 = xor i32 %51, %49
  %53 = trunc i32 %52 to i8
  store i8 %53, i8* getelementptr inbounds ([2 x i8]* @g_15, i32 0, i64 0), align 1
  %54 = load i8* getelementptr inbounds ([2 x i8]* @g_15, i32 0, i64 0), align 1
  %55 = sext i8 %54 to i32
  %56 = load i32* @g_3, align 4
  %57 = or i32 %56, %55
  store i32 %57, i32* @g_3, align 4
  %58 = load i32* @g_3, align 4
  ret i32 %58
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

define internal signext i16 @safe_rshift_func_int16_t_s_u(i16 signext %left, i32 %right) nounwind uwtable {
  %1 = alloca i16, align 2
  %2 = alloca i32, align 4
  store i16 %left, i16* %1, align 2
  store i32 %right, i32* %2, align 4
  %3 = load i16* %1, align 2
  %4 = sext i16 %3 to i32
  %5 = icmp slt i32 %4, 0
  br i1 %5, label %9, label %6

; <label>:6                                       ; preds = %0
  %7 = load i32* %2, align 4
  %8 = icmp uge i32 %7, 32
  br i1 %8, label %9, label %12

; <label>:9                                       ; preds = %6, %0
  %10 = load i16* %1, align 2
  %11 = sext i16 %10 to i32
  br label %17

; <label>:12                                      ; preds = %6
  %13 = load i16* %1, align 2
  %14 = sext i16 %13 to i32
  %15 = load i32* %2, align 4
  %16 = ashr i32 %14, %15
  br label %17

; <label>:17                                      ; preds = %12, %9
  %18 = phi i32 [ %11, %9 ], [ %16, %12 ]
  %19 = trunc i32 %18 to i16
  ret i16 %19
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

define internal zeroext i16 @safe_rshift_func_uint16_t_u_s(i16 zeroext %left, i32 %right) nounwind uwtable {
  %1 = alloca i16, align 2
  %2 = alloca i32, align 4
  store i16 %left, i16* %1, align 2
  store i32 %right, i32* %2, align 4
  %3 = load i32* %2, align 4
  %4 = icmp slt i32 %3, 0
  br i1 %4, label %8, label %5

; <label>:5                                       ; preds = %0
  %6 = load i32* %2, align 4
  %7 = icmp sge i32 %6, 32
  br i1 %7, label %8, label %11

; <label>:8                                       ; preds = %5, %0
  %9 = load i16* %1, align 2
  %10 = zext i16 %9 to i32
  br label %16

; <label>:11                                      ; preds = %5
  %12 = load i16* %1, align 2
  %13 = zext i16 %12 to i32
  %14 = load i32* %2, align 4
  %15 = ashr i32 %13, %14
  br label %16

; <label>:16                                      ; preds = %11, %8
  %17 = phi i32 [ %10, %8 ], [ %15, %11 ]
  %18 = trunc i32 %17 to i16
  ret i16 %18
}

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  %i = alloca i32, align 4
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  %4 = call i32 @func_1()
  %5 = load i32* @g_3, align 4
  %6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %5)
  %7 = load i8* getelementptr inbounds ([2 x i8]* @g_15, i32 0, i64 0), align 1
  %8 = sext i8 %7 to i32
  %9 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str1, i32 0, i32 0), i32 %8)
  %10 = load i8* getelementptr inbounds ([2 x i8]* @g_15, i32 0, i64 1), align 1
  %11 = sext i8 %10 to i32
  %12 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str2, i32 0, i32 0), i32 %11)
  %13 = load i8* getelementptr inbounds ([2 x i8]* @g_15, i32 0, i64 0), align 1
  %14 = sext i8 %13 to i32
  %15 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str1, i32 0, i32 0), i32 %14)
  %16 = load i32* %1
  ret i32 %16
}

declare i32 @printf(i8*, ...)
