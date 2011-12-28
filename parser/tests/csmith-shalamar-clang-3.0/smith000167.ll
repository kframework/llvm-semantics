; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith000167.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = global i16 0, align 2
@g_4 = global [6 x i32] [i32 477550526, i32 477550526, i32 477550526, i32 477550526, i32 477550526, i32 477550526], align 16
@.str = private unnamed_addr constant [19 x i8] c"checksum g_2 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [22 x i8] c"checksum g_4[0] = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [22 x i8] c"checksum g_4[1] = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [22 x i8] c"checksum g_4[2] = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [22 x i8] c"checksum g_4[3] = %d\0A\00", align 1
@.str5 = private unnamed_addr constant [22 x i8] c"checksum g_4[4] = %d\0A\00", align 1
@.str6 = private unnamed_addr constant [22 x i8] c"checksum g_4[5] = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i64 @func_1() nounwind uwtable {
  %l_3 = alloca [8 x [8 x [1 x i32*]]], align 16
  %l_5 = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  store i32 -3, i32* %l_5, align 4
  store i32 0, i32* %i, align 4
  br label %1

; <label>:1                                       ; preds = %30, %0
  %2 = load i32* %i, align 4
  %3 = icmp slt i32 %2, 8
  br i1 %3, label %4, label %33

; <label>:4                                       ; preds = %1
  store i32 0, i32* %j, align 4
  br label %5

; <label>:5                                       ; preds = %26, %4
  %6 = load i32* %j, align 4
  %7 = icmp slt i32 %6, 8
  br i1 %7, label %8, label %29

; <label>:8                                       ; preds = %5
  store i32 0, i32* %k, align 4
  br label %9

; <label>:9                                       ; preds = %22, %8
  %10 = load i32* %k, align 4
  %11 = icmp slt i32 %10, 1
  br i1 %11, label %12, label %25

; <label>:12                                      ; preds = %9
  %13 = load i32* %k, align 4
  %14 = sext i32 %13 to i64
  %15 = load i32* %j, align 4
  %16 = sext i32 %15 to i64
  %17 = load i32* %i, align 4
  %18 = sext i32 %17 to i64
  %19 = getelementptr inbounds [8 x [8 x [1 x i32*]]]* %l_3, i32 0, i64 %18
  %20 = getelementptr inbounds [8 x [1 x i32*]]* %19, i32 0, i64 %16
  %21 = getelementptr inbounds [1 x i32*]* %20, i32 0, i64 %14
  store i32* getelementptr inbounds ([6 x i32]* @g_4, i32 0, i64 3), i32** %21, align 8
  br label %22

; <label>:22                                      ; preds = %12
  %23 = load i32* %k, align 4
  %24 = add nsw i32 %23, 1
  store i32 %24, i32* %k, align 4
  br label %9

; <label>:25                                      ; preds = %9
  br label %26

; <label>:26                                      ; preds = %25
  %27 = load i32* %j, align 4
  %28 = add nsw i32 %27, 1
  store i32 %28, i32* %j, align 4
  br label %5

; <label>:29                                      ; preds = %5
  br label %30

; <label>:30                                      ; preds = %29
  %31 = load i32* %i, align 4
  %32 = add nsw i32 %31, 1
  store i32 %32, i32* %i, align 4
  br label %1

; <label>:33                                      ; preds = %1
  %34 = load i16* @g_2, align 2
  %35 = sext i16 %34 to i32
  %36 = load i16* @g_2, align 2
  %37 = sext i16 %36 to i32
  %38 = icmp slt i32 %35, %37
  br i1 %38, label %40, label %39

; <label>:39                                      ; preds = %33
  br label %40

; <label>:40                                      ; preds = %39, %33
  %41 = phi i1 [ true, %33 ], [ true, %39 ]
  %42 = zext i1 %41 to i32
  store i32 %42, i32* %l_5, align 4
  %43 = load i32* getelementptr inbounds ([6 x i32]* @g_4, i32 0, i64 3), align 4
  %44 = sext i32 %43 to i64
  ret i64 %44
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
  %5 = load i16* @g_2, align 2
  %6 = sext i16 %5 to i32
  %7 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %6)
  %8 = load i32* getelementptr inbounds ([6 x i32]* @g_4, i32 0, i64 0), align 4
  %9 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str1, i32 0, i32 0), i32 %8)
  %10 = load i32* getelementptr inbounds ([6 x i32]* @g_4, i32 0, i64 1), align 4
  %11 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str2, i32 0, i32 0), i32 %10)
  %12 = load i32* getelementptr inbounds ([6 x i32]* @g_4, i32 0, i64 2), align 4
  %13 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str3, i32 0, i32 0), i32 %12)
  %14 = load i32* getelementptr inbounds ([6 x i32]* @g_4, i32 0, i64 3), align 4
  %15 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str4, i32 0, i32 0), i32 %14)
  %16 = load i32* getelementptr inbounds ([6 x i32]* @g_4, i32 0, i64 4), align 4
  %17 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str5, i32 0, i32 0), i32 %16)
  %18 = load i32* getelementptr inbounds ([6 x i32]* @g_4, i32 0, i64 5), align 4
  %19 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str6, i32 0, i32 0), i32 %18)
  %20 = load i32* getelementptr inbounds ([6 x i32]* @g_4, i32 0, i64 3), align 4
  %21 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str4, i32 0, i32 0), i32 %20)
  %22 = load i32* %1
  ret i32 %22
}

declare i32 @printf(i8*, ...)
