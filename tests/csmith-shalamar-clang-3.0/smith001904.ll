; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith001904.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_3 = global i32 -1, align 4
@g_7 = global i32* null, align 8
@.str = private unnamed_addr constant [19 x i8] c"checksum g_3 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable {
  %l_2 = alloca [7 x i16], align 2
  %i = alloca i32, align 4
  %l_6 = alloca i8, align 1
  store i32 0, i32* %i, align 4
  br label %1

; <label>:1                                       ; preds = %8, %0
  %2 = load i32* %i, align 4
  %3 = icmp slt i32 %2, 7
  br i1 %3, label %4, label %11

; <label>:4                                       ; preds = %1
  %5 = load i32* %i, align 4
  %6 = sext i32 %5 to i64
  %7 = getelementptr inbounds [7 x i16]* %l_2, i32 0, i64 %6
  store i16 -1, i16* %7, align 2
  br label %8

; <label>:8                                       ; preds = %4
  %9 = load i32* %i, align 4
  %10 = add nsw i32 %9, 1
  store i32 %10, i32* %i, align 4
  br label %1

; <label>:11                                      ; preds = %1
  store i32 4, i32* @g_3, align 4
  br label %12

; <label>:12                                      ; preds = %25, %11
  %13 = load i32* @g_3, align 4
  %14 = icmp sge i32 %13, 0
  br i1 %14, label %15, label %28

; <label>:15                                      ; preds = %12
  store i8 -1, i8* %l_6, align 1
  %16 = load i32* @g_3, align 4
  %17 = call signext i16 @safe_lshift_func_int16_t_s_s(i16 signext 24962, i32 -1001191646)
  %18 = sext i16 %17 to i32
  %19 = icmp sge i32 %16, %18
  %20 = zext i1 %19 to i32
  %21 = load i8* %l_6, align 1
  %22 = zext i8 %21 to i32
  %23 = and i32 %22, %20
  %24 = trunc i32 %23 to i8
  store i8 %24, i8* %l_6, align 1
  store i32* @g_3, i32** @g_7, align 8
  br label %25

; <label>:25                                      ; preds = %15
  %26 = load i32* @g_3, align 4
  %27 = add nsw i32 %26, -2
  store i32 %27, i32* @g_3, align 4
  br label %12

; <label>:28                                      ; preds = %12
  %29 = load i32* @g_3, align 4
  %30 = urem i32 %29, 7
  %31 = zext i32 %30 to i64
  %32 = getelementptr inbounds [7 x i16]* %l_2, i32 0, i64 %31
  %33 = load i16* %32, align 2
  %34 = sext i16 %33 to i32
  ret i32 %34
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

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  %4 = call i32 @func_1()
  %5 = load i32* @g_3, align 4
  %6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %5)
  %7 = load i32* %1
  ret i32 %7
}

declare i32 @printf(i8*, ...)
