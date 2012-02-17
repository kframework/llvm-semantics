; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith000621.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_4 = global i32 -7, align 4
@g_3 = global i32* @g_4, align 8
@g_11 = global i32* @g_4, align 8
@g_10 = constant i32** @g_11, align 8
@.str = private unnamed_addr constant [19 x i8] c"checksum g_4 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define zeroext i16 @func_1() nounwind uwtable {
  %l_2 = alloca i8, align 1
  store i8 9, i8* %l_2, align 1
  %1 = load i8* %l_2, align 1
  %2 = zext i8 %1 to i32
  %3 = load volatile i32** @g_3, align 8
  store i32 %2, i32* %3
  %4 = load i8* %l_2, align 1
  %5 = zext i8 %4 to i64
  %6 = call i32* @func_5(i64 %5, i32* null)
  %7 = load volatile i32*** @g_10, align 8
  store i32* %6, i32** %7
  %8 = load i8* %l_2, align 1
  %9 = zext i8 %8 to i16
  ret i16 %9
}

define i32* @func_5(i64 %p_6, i32* %p_7) nounwind uwtable {
  %1 = alloca i64, align 8
  %2 = alloca i32*, align 8
  %l_8 = alloca [5 x i64], align 16
  %l_9 = alloca i32*, align 8
  %i = alloca i32, align 4
  store i64 %p_6, i64* %1, align 8
  store i32* %p_7, i32** %2, align 8
  store i32* null, i32** %l_9, align 8
  store i32 0, i32* %i, align 4
  br label %3

; <label>:3                                       ; preds = %10, %0
  %4 = load i32* %i, align 4
  %5 = icmp slt i32 %4, 5
  br i1 %5, label %6, label %13

; <label>:6                                       ; preds = %3
  %7 = load i32* %i, align 4
  %8 = sext i32 %7 to i64
  %9 = getelementptr inbounds [5 x i64]* %l_8, i32 0, i64 %8
  store i64 1, i64* %9, align 8
  br label %10

; <label>:10                                      ; preds = %6
  %11 = load i32* %i, align 4
  %12 = add nsw i32 %11, 1
  store i32 %12, i32* %i, align 4
  br label %3

; <label>:13                                      ; preds = %3
  %14 = load volatile i32** @g_3, align 8
  %15 = load i32* %14
  %16 = sext i32 %15 to i64
  %17 = getelementptr inbounds [5 x i64]* %l_8, i32 0, i64 0
  %18 = load i64* %17, align 8
  %19 = or i64 %18, %16
  store i64 %19, i64* %17, align 8
  store i32 0, i32* @g_4, align 4
  br label %20

; <label>:20                                      ; preds = %27, %13
  %21 = load i32* @g_4, align 4
  %22 = icmp slt i32 %21, 5
  br i1 %22, label %23, label %30

; <label>:23                                      ; preds = %20
  %24 = load i32* @g_4, align 4
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds [5 x i64]* %l_8, i32 0, i64 %25
  store i64 0, i64* %26, align 8
  br label %27

; <label>:27                                      ; preds = %23
  %28 = load i32* @g_4, align 4
  %29 = add nsw i32 %28, 1
  store i32 %29, i32* @g_4, align 4
  br label %20

; <label>:30                                      ; preds = %20
  %31 = load i32** %l_9, align 8
  ret i32* %31
}

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  %4 = call zeroext i16 @func_1()
  %5 = load i32* @g_4, align 4
  %6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %5)
  %7 = load i32* %1
  ret i32 %7
}

declare i32 @printf(i8*, ...)
