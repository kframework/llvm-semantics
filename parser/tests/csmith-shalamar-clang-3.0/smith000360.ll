; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith000360.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_4 = global i32 9, align 4
@g_3 = global i32* @g_4, align 8
@.str = private unnamed_addr constant [19 x i8] c"checksum g_4 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable {
  %l_2 = alloca [1 x i32*], align 8
  %l_5 = alloca [7 x [9 x [1 x i8]]], align 16
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  store i32 0, i32* %i, align 4
  br label %1

; <label>:1                                       ; preds = %8, %0
  %2 = load i32* %i, align 4
  %3 = icmp slt i32 %2, 1
  br i1 %3, label %4, label %11

; <label>:4                                       ; preds = %1
  %5 = load i32* %i, align 4
  %6 = sext i32 %5 to i64
  %7 = getelementptr inbounds [1 x i32*]* %l_2, i32 0, i64 %6
  store i32* null, i32** %7, align 8
  br label %8

; <label>:8                                       ; preds = %4
  %9 = load i32* %i, align 4
  %10 = add nsw i32 %9, 1
  store i32 %10, i32* %i, align 4
  br label %1

; <label>:11                                      ; preds = %1
  store i32 0, i32* %i, align 4
  br label %12

; <label>:12                                      ; preds = %41, %11
  %13 = load i32* %i, align 4
  %14 = icmp slt i32 %13, 7
  br i1 %14, label %15, label %44

; <label>:15                                      ; preds = %12
  store i32 0, i32* %j, align 4
  br label %16

; <label>:16                                      ; preds = %37, %15
  %17 = load i32* %j, align 4
  %18 = icmp slt i32 %17, 9
  br i1 %18, label %19, label %40

; <label>:19                                      ; preds = %16
  store i32 0, i32* %k, align 4
  br label %20

; <label>:20                                      ; preds = %33, %19
  %21 = load i32* %k, align 4
  %22 = icmp slt i32 %21, 1
  br i1 %22, label %23, label %36

; <label>:23                                      ; preds = %20
  %24 = load i32* %k, align 4
  %25 = sext i32 %24 to i64
  %26 = load i32* %j, align 4
  %27 = sext i32 %26 to i64
  %28 = load i32* %i, align 4
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds [7 x [9 x [1 x i8]]]* %l_5, i32 0, i64 %29
  %31 = getelementptr inbounds [9 x [1 x i8]]* %30, i32 0, i64 %27
  %32 = getelementptr inbounds [1 x i8]* %31, i32 0, i64 %25
  store i8 16, i8* %32, align 1
  br label %33

; <label>:33                                      ; preds = %23
  %34 = load i32* %k, align 4
  %35 = add nsw i32 %34, 1
  store i32 %35, i32* %k, align 4
  br label %20

; <label>:36                                      ; preds = %20
  br label %37

; <label>:37                                      ; preds = %36
  %38 = load i32* %j, align 4
  %39 = add nsw i32 %38, 1
  store i32 %39, i32* %j, align 4
  br label %16

; <label>:40                                      ; preds = %16
  br label %41

; <label>:41                                      ; preds = %40
  %42 = load i32* %i, align 4
  %43 = add nsw i32 %42, 1
  store i32 %43, i32* %i, align 4
  br label %12

; <label>:44                                      ; preds = %12
  %45 = getelementptr inbounds [1 x i32*]* %l_2, i32 0, i64 0
  %46 = load i32** %45, align 8
  store i32* %46, i32** @g_3, align 8
  %47 = getelementptr inbounds [7 x [9 x [1 x i8]]]* %l_5, i32 0, i64 3
  %48 = getelementptr inbounds [9 x [1 x i8]]* %47, i32 0, i64 8
  %49 = getelementptr inbounds [1 x i8]* %48, i32 0, i64 0
  %50 = load i8* %49, align 1
  %51 = sext i8 %50 to i32
  ret i32 %51
}

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  %4 = call i32 @func_1()
  %5 = load i32* @g_4, align 4
  %6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %5)
  %7 = load i32* %1
  ret i32 %7
}

declare i32 @printf(i8*, ...)
