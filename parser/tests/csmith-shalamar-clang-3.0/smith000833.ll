; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith000833.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_3 = global i32 1, align 4
@g_4 = global i32 -1, align 4
@.str = private unnamed_addr constant [19 x i8] c"checksum g_3 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [19 x i8] c"checksum g_4 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable {
  %l_2 = alloca [4 x [4 x i32]], align 16
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 0, i32* %i, align 4
  br label %1

; <label>:1                                       ; preds = %19, %0
  %2 = load i32* %i, align 4
  %3 = icmp slt i32 %2, 4
  br i1 %3, label %4, label %22

; <label>:4                                       ; preds = %1
  store i32 0, i32* %j, align 4
  br label %5

; <label>:5                                       ; preds = %15, %4
  %6 = load i32* %j, align 4
  %7 = icmp slt i32 %6, 4
  br i1 %7, label %8, label %18

; <label>:8                                       ; preds = %5
  %9 = load i32* %j, align 4
  %10 = sext i32 %9 to i64
  %11 = load i32* %i, align 4
  %12 = sext i32 %11 to i64
  %13 = getelementptr inbounds [4 x [4 x i32]]* %l_2, i32 0, i64 %12
  %14 = getelementptr inbounds [4 x i32]* %13, i32 0, i64 %10
  store i32 8, i32* %14, align 4
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
  store i32 0, i32* @g_3, align 4
  br label %23

; <label>:23                                      ; preds = %41, %22
  %24 = load i32* @g_3, align 4
  %25 = icmp slt i32 %24, 4
  br i1 %25, label %26, label %44

; <label>:26                                      ; preds = %23
  store i32 0, i32* @g_4, align 4
  br label %27

; <label>:27                                      ; preds = %37, %26
  %28 = load i32* @g_4, align 4
  %29 = icmp slt i32 %28, 4
  br i1 %29, label %30, label %40

; <label>:30                                      ; preds = %27
  %31 = load i32* @g_4, align 4
  %32 = sext i32 %31 to i64
  %33 = load i32* @g_3, align 4
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds [4 x [4 x i32]]* %l_2, i32 0, i64 %34
  %36 = getelementptr inbounds [4 x i32]* %35, i32 0, i64 %32
  store i32 -2002700367, i32* %36, align 4
  br label %37

; <label>:37                                      ; preds = %30
  %38 = load i32* @g_4, align 4
  %39 = add nsw i32 %38, 1
  store i32 %39, i32* @g_4, align 4
  br label %27

; <label>:40                                      ; preds = %27
  br label %41

; <label>:41                                      ; preds = %40
  %42 = load i32* @g_3, align 4
  %43 = add nsw i32 %42, 1
  store i32 %43, i32* @g_3, align 4
  br label %23

; <label>:44                                      ; preds = %23
  %45 = load i32* @g_4, align 4
  ret i32 %45
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
  %7 = load i32* @g_4, align 4
  %8 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str1, i32 0, i32 0), i32 %7)
  %9 = load i32* %1
  ret i32 %9
}

declare i32 @printf(i8*, ...)
