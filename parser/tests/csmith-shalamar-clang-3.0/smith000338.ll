; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith000338.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_3 = global i32 0, align 4
@g_5 = global i32 0, align 4
@.str = private unnamed_addr constant [19 x i8] c"checksum g_3 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [19 x i8] c"checksum g_5 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define zeroext i8 @func_1() nounwind uwtable {
  %l_2 = alloca [9 x i16], align 16
  %l_4 = alloca i32*, align 8
  %i = alloca i32, align 4
  store i32* @g_5, i32** %l_4, align 8
  store i32 0, i32* %i, align 4
  br label %1

; <label>:1                                       ; preds = %8, %0
  %2 = load i32* %i, align 4
  %3 = icmp slt i32 %2, 9
  br i1 %3, label %4, label %11

; <label>:4                                       ; preds = %1
  %5 = load i32* %i, align 4
  %6 = sext i32 %5 to i64
  %7 = getelementptr inbounds [9 x i16]* %l_2, i32 0, i64 %6
  store i16 -1, i16* %7, align 2
  br label %8

; <label>:8                                       ; preds = %4
  %9 = load i32* %i, align 4
  %10 = add nsw i32 %9, 1
  store i32 %10, i32* %i, align 4
  br label %1

; <label>:11                                      ; preds = %1
  %12 = getelementptr inbounds [9 x i16]* %l_2, i32 0, i64 5
  %13 = load i16* %12, align 2
  %14 = sext i16 %13 to i32
  %15 = load volatile i32* @g_3, align 4
  %16 = icmp ne i32 %15, 0
  %17 = xor i1 %16, true
  %18 = zext i1 %17 to i32
  %19 = icmp sle i32 %14, %18
  %20 = zext i1 %19 to i32
  %21 = load i32** %l_4, align 8
  store i32 %20, i32* %21
  store i32 0, i32* @g_5, align 4
  br label %22

; <label>:22                                      ; preds = %31, %11
  %23 = load i32* @g_5, align 4
  %24 = icmp sle i32 %23, 0
  br i1 %24, label %25, label %36

; <label>:25                                      ; preds = %22
  %26 = load i32** %l_4, align 8
  %27 = load i32* %26
  %28 = icmp ne i32 %27, 0
  br i1 %28, label %29, label %30

; <label>:29                                      ; preds = %25
  br label %36

; <label>:30                                      ; preds = %25
  br label %31

; <label>:31                                      ; preds = %30
  %32 = load i32* @g_5, align 4
  %33 = sext i32 %32 to i64
  %34 = call i64 @safe_sub_func_int64_t_s_s(i64 %33, i64 1)
  %35 = trunc i64 %34 to i32
  store i32 %35, i32* @g_5, align 4
  br label %22

; <label>:36                                      ; preds = %29, %22
  %37 = load i32** %l_4, align 8
  %38 = load i32* %37
  %39 = trunc i32 %38 to i8
  ret i8 %39
}

define internal i64 @safe_sub_func_int64_t_s_s(i64 %si1, i64 %si2) nounwind uwtable {
  %1 = alloca i64, align 8
  %2 = alloca i64, align 8
  store i64 %si1, i64* %1, align 8
  store i64 %si2, i64* %2, align 8
  %3 = load i64* %1, align 8
  %4 = load i64* %2, align 8
  %5 = xor i64 %3, %4
  %6 = load i64* %1, align 8
  %7 = load i64* %1, align 8
  %8 = load i64* %2, align 8
  %9 = xor i64 %7, %8
  %10 = and i64 %9, -9223372036854775808
  %11 = xor i64 %6, %10
  %12 = load i64* %2, align 8
  %13 = sub nsw i64 %11, %12
  %14 = load i64* %2, align 8
  %15 = xor i64 %13, %14
  %16 = and i64 %5, %15
  %17 = icmp slt i64 %16, 0
  br i1 %17, label %18, label %20

; <label>:18                                      ; preds = %0
  %19 = load i64* %1, align 8
  br label %24

; <label>:20                                      ; preds = %0
  %21 = load i64* %1, align 8
  %22 = load i64* %2, align 8
  %23 = sub nsw i64 %21, %22
  br label %24

; <label>:24                                      ; preds = %20, %18
  %25 = phi i64 [ %19, %18 ], [ %23, %20 ]
  ret i64 %25
}

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  %4 = call zeroext i8 @func_1()
  %5 = load volatile i32* @g_3, align 4
  %6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %5)
  %7 = load i32* @g_5, align 4
  %8 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str1, i32 0, i32 0), i32 %7)
  %9 = load i32* %1
  ret i32 %9
}

declare i32 @printf(i8*, ...)
