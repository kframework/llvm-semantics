; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith001015.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_6 = global i32 -6, align 4
@g_5 = global i32* @g_6, align 8
@g_9 = global i32 0, align 4
@g_8 = global i32* @g_9, align 8
@.str = private unnamed_addr constant [19 x i8] c"checksum g_6 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [19 x i8] c"checksum g_9 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable {
  %l_4 = alloca i32, align 4
  %l_7 = alloca [9 x i32*], align 16
  %l_10 = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 96995658, i32* %l_4, align 4
  store volatile i32 1, i32* %l_10, align 4
  store i32 0, i32* %i, align 4
  br label %1

; <label>:1                                       ; preds = %8, %0
  %2 = load i32* %i, align 4
  %3 = icmp slt i32 %2, 9
  br i1 %3, label %4, label %11

; <label>:4                                       ; preds = %1
  %5 = load i32* %i, align 4
  %6 = sext i32 %5 to i64
  %7 = getelementptr inbounds [9 x i32*]* %l_7, i32 0, i64 %6
  store i32* @g_6, i32** %7, align 8
  br label %8

; <label>:8                                       ; preds = %4
  %9 = load i32* %i, align 4
  %10 = add nsw i32 %9, 1
  store i32 %10, i32* %i, align 4
  br label %1

; <label>:11                                      ; preds = %1
  %12 = load i32* %l_4, align 4
  %13 = trunc i32 %12 to i16
  %14 = call zeroext i16 @safe_lshift_func_uint16_t_u_s(i16 zeroext %13, i32 -2050559553)
  %15 = zext i16 %14 to i32
  %16 = load volatile i32** @g_5, align 8
  store i32 %15, i32* %16
  %17 = getelementptr inbounds [9 x i32*]* %l_7, i32 0, i64 6
  %18 = load i32** %17, align 8
  %19 = load volatile i32** @g_8, align 8
  %20 = icmp ne i32* %18, %19
  br i1 %20, label %21, label %25

; <label>:21                                      ; preds = %11
  %22 = load volatile i32** @g_5, align 8
  %23 = load i32* %22
  %24 = icmp ne i32 %23, 0
  br label %25

; <label>:25                                      ; preds = %21, %11
  %26 = phi i1 [ false, %11 ], [ %24, %21 ]
  %27 = zext i1 %26 to i32
  %28 = load volatile i32** @g_5, align 8
  store i32 %27, i32* %28
  %29 = load volatile i32** @g_8, align 8
  %30 = load volatile i32* %29
  store volatile i32 %30, i32* %l_10, align 4
  %31 = load i32* @g_6, align 4
  ret i32 %31
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

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  %4 = call i32 @func_1()
  %5 = load i32* @g_6, align 4
  %6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %5)
  %7 = load volatile i32* @g_9, align 4
  %8 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str1, i32 0, i32 0), i32 %7)
  %9 = load i32* %1
  ret i32 %9
}

declare i32 @printf(i8*, ...)
