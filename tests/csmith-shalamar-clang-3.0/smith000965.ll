; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith000965.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = global i16 -1145, align 2
@g_4 = global i32 0, align 4
@.str = private unnamed_addr constant [19 x i8] c"checksum g_2 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [19 x i8] c"checksum g_4 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define signext i16 @func_1() nounwind uwtable {
  %l_3 = alloca i32*, align 8
  %l_7 = alloca [7 x i16], align 2
  %i = alloca i32, align 4
  store i32* @g_4, i32** %l_3, align 8
  store i32 0, i32* %i, align 4
  br label %1

; <label>:1                                       ; preds = %8, %0
  %2 = load i32* %i, align 4
  %3 = icmp slt i32 %2, 7
  br i1 %3, label %4, label %11

; <label>:4                                       ; preds = %1
  %5 = load i32* %i, align 4
  %6 = sext i32 %5 to i64
  %7 = getelementptr inbounds [7 x i16]* %l_7, i32 0, i64 %6
  store i16 29887, i16* %7, align 2
  br label %8

; <label>:8                                       ; preds = %4
  %9 = load i32* %i, align 4
  %10 = add nsw i32 %9, 1
  store i32 %10, i32* %i, align 4
  br label %1

; <label>:11                                      ; preds = %1
  br label %12

; <label>:12                                      ; preds = %41, %11
  %13 = load i16* @g_2, align 2
  %14 = zext i16 %13 to i32
  %15 = load i32** %l_3, align 8
  %16 = load i32* %15
  %17 = xor i32 %16, %14
  store i32 %17, i32* %15
  %18 = load i32** %l_3, align 8
  %19 = load i32* %18
  %20 = trunc i32 %19 to i16
  %21 = call signext i16 @safe_lshift_func_int16_t_s_u(i16 signext %20, i32 1357306448)
  %22 = icmp ne i16 %21, 0
  br i1 %22, label %23, label %38

; <label>:23                                      ; preds = %12
  store i16 0, i16* @g_2, align 2
  br label %24

; <label>:24                                      ; preds = %32, %23
  %25 = load i16* @g_2, align 2
  %26 = zext i16 %25 to i32
  %27 = icmp slt i32 %26, 7
  br i1 %27, label %28, label %37

; <label>:28                                      ; preds = %24
  %29 = load i16* @g_2, align 2
  %30 = zext i16 %29 to i64
  %31 = getelementptr inbounds [7 x i16]* %l_7, i32 0, i64 %30
  store i16 -21216, i16* %31, align 2
  br label %32

; <label>:32                                      ; preds = %28
  %33 = load i16* @g_2, align 2
  %34 = zext i16 %33 to i32
  %35 = add nsw i32 %34, 1
  %36 = trunc i32 %35 to i16
  store i16 %36, i16* @g_2, align 2
  br label %24

; <label>:37                                      ; preds = %24
  br label %43

; <label>:38                                      ; preds = %12
  %39 = load i32* @g_4, align 4
  %40 = icmp ne i32 %39, 0
  br i1 %40, label %41, label %42

; <label>:41                                      ; preds = %38
  br label %12

; <label>:42                                      ; preds = %38
  br label %43

; <label>:43                                      ; preds = %42, %37
  %44 = load i32* @g_4, align 4
  %45 = trunc i32 %44 to i16
  ret i16 %45
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

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  %4 = call signext i16 @func_1()
  %5 = load i16* @g_2, align 2
  %6 = zext i16 %5 to i32
  %7 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %6)
  %8 = load i32* @g_4, align 4
  %9 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str1, i32 0, i32 0), i32 %8)
  %10 = load i32* %1
  ret i32 %10
}

declare i32 @printf(i8*, ...)
