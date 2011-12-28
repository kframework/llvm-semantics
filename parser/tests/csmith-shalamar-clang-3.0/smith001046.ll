; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith001046.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_7 = global i8 -7, align 1
@.str = private unnamed_addr constant [19 x i8] c"checksum g_7 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define signext i16 @func_1() nounwind uwtable {
  %1 = alloca i16, align 2
  %l_2 = alloca i32, align 4
  %l_3 = alloca i32, align 4
  %l_6 = alloca i32, align 4
  store i32 703217988, i32* %l_2, align 4
  %2 = load i32* %l_2, align 4
  %3 = icmp ne i32 %2, 0
  br i1 %3, label %4, label %7

; <label>:4                                       ; preds = %0
  store i32 -1337458438, i32* %l_3, align 4
  %5 = load i32* %l_3, align 4
  %6 = trunc i32 %5 to i16
  store i16 %6, i16* %1
  br label %24

; <label>:7                                       ; preds = %0
  store i32 -13, i32* %l_2, align 4
  br label %8

; <label>:8                                       ; preds = %16, %7
  %9 = load i32* %l_2, align 4
  %10 = icmp ult i32 %9, 10
  br i1 %10, label %11, label %21

; <label>:11                                      ; preds = %8
  store i32 -667060167, i32* %l_6, align 4
  %12 = load i32* %l_6, align 4
  %13 = icmp ne i32 %12, 0
  br i1 %13, label %14, label %15

; <label>:14                                      ; preds = %11
  br label %21

; <label>:15                                      ; preds = %11
  br label %16

; <label>:16                                      ; preds = %15
  %17 = load i32* %l_2, align 4
  %18 = zext i32 %17 to i64
  %19 = call i64 @safe_add_func_int64_t_s_s(i64 %18, i64 6)
  %20 = trunc i64 %19 to i32
  store i32 %20, i32* %l_2, align 4
  br label %8

; <label>:21                                      ; preds = %14, %8
  %22 = load i8* @g_7, align 1
  %23 = sext i8 %22 to i16
  store i16 %23, i16* %1
  br label %24

; <label>:24                                      ; preds = %21, %4
  %25 = load i16* %1
  ret i16 %25
}

define internal i64 @safe_add_func_int64_t_s_s(i64 %si1, i64 %si2) nounwind uwtable {
  %1 = alloca i64, align 8
  %2 = alloca i64, align 8
  store i64 %si1, i64* %1, align 8
  store i64 %si2, i64* %2, align 8
  %3 = load i64* %1, align 8
  %4 = icmp sgt i64 %3, 0
  br i1 %4, label %5, label %13

; <label>:5                                       ; preds = %0
  %6 = load i64* %2, align 8
  %7 = icmp sgt i64 %6, 0
  br i1 %7, label %8, label %13

; <label>:8                                       ; preds = %5
  %9 = load i64* %1, align 8
  %10 = load i64* %2, align 8
  %11 = sub nsw i64 9223372036854775807, %10
  %12 = icmp sgt i64 %9, %11
  br i1 %12, label %24, label %13

; <label>:13                                      ; preds = %8, %5, %0
  %14 = load i64* %1, align 8
  %15 = icmp slt i64 %14, 0
  br i1 %15, label %16, label %26

; <label>:16                                      ; preds = %13
  %17 = load i64* %2, align 8
  %18 = icmp slt i64 %17, 0
  br i1 %18, label %19, label %26

; <label>:19                                      ; preds = %16
  %20 = load i64* %1, align 8
  %21 = load i64* %2, align 8
  %22 = sub nsw i64 -9223372036854775808, %21
  %23 = icmp slt i64 %20, %22
  br i1 %23, label %24, label %26

; <label>:24                                      ; preds = %19, %8
  %25 = load i64* %1, align 8
  br label %30

; <label>:26                                      ; preds = %19, %16, %13
  %27 = load i64* %1, align 8
  %28 = load i64* %2, align 8
  %29 = add nsw i64 %27, %28
  br label %30

; <label>:30                                      ; preds = %26, %24
  %31 = phi i64 [ %25, %24 ], [ %29, %26 ]
  ret i64 %31
}

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  %4 = call signext i16 @func_1()
  %5 = load i8* @g_7, align 1
  %6 = sext i8 %5 to i32
  %7 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %6)
  %8 = load i32* %1
  ret i32 %8
}

declare i32 @printf(i8*, ...)
