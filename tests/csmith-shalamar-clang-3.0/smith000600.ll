; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith000600.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_5 = global i32 560462428, align 4
@g_6 = global i32 1, align 4
@g_9 = global [6 x i32] [i32 -2, i32 -2, i32 -2, i32 -2, i32 -2, i32 -2], align 16
@g_8 = global i32* bitcast (i8* getelementptr (i8* bitcast ([6 x i32]* @g_9 to i8*), i64 12) to i32*), align 8
@g_7 = global i32** @g_8, align 8
@g_14 = global i32* @g_6, align 8
@g_13 = global i32** @g_14, align 8
@.str = private unnamed_addr constant [19 x i8] c"checksum g_5 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [19 x i8] c"checksum g_6 = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [22 x i8] c"checksum g_9[0] = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [22 x i8] c"checksum g_9[1] = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [22 x i8] c"checksum g_9[2] = %d\0A\00", align 1
@.str5 = private unnamed_addr constant [22 x i8] c"checksum g_9[3] = %d\0A\00", align 1
@.str6 = private unnamed_addr constant [22 x i8] c"checksum g_9[4] = %d\0A\00", align 1
@.str7 = private unnamed_addr constant [22 x i8] c"checksum g_9[5] = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable {
  %l_12 = alloca i32, align 4
  store i32 1000475541, i32* %l_12, align 4
  %1 = call i32* @func_2(i64 1000475541)
  %2 = load volatile i32*** @g_13, align 8
  store i32* %1, i32** %2
  ret i32 1000475541
}

define i32* @func_2(i64 %p_3) nounwind uwtable {
  %1 = alloca i32*, align 8
  %2 = alloca i64, align 8
  %l_4 = alloca [7 x [3 x i32]], align 16
  %l_10 = alloca i32***, align 8
  %l_11 = alloca i32*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i64 %p_3, i64* %2, align 8
  store i32*** @g_7, i32**** %l_10, align 8
  store i32* null, i32** %l_11, align 8
  store i32 0, i32* %i, align 4
  br label %3

; <label>:3                                       ; preds = %21, %0
  %4 = load i32* %i, align 4
  %5 = icmp slt i32 %4, 7
  br i1 %5, label %6, label %24

; <label>:6                                       ; preds = %3
  store i32 0, i32* %j, align 4
  br label %7

; <label>:7                                       ; preds = %17, %6
  %8 = load i32* %j, align 4
  %9 = icmp slt i32 %8, 3
  br i1 %9, label %10, label %20

; <label>:10                                      ; preds = %7
  %11 = load i32* %j, align 4
  %12 = sext i32 %11 to i64
  %13 = load i32* %i, align 4
  %14 = sext i32 %13 to i64
  %15 = getelementptr inbounds [7 x [3 x i32]]* %l_4, i32 0, i64 %14
  %16 = getelementptr inbounds [3 x i32]* %15, i32 0, i64 %12
  store i32 2082486656, i32* %16, align 4
  br label %17

; <label>:17                                      ; preds = %10
  %18 = load i32* %j, align 4
  %19 = add nsw i32 %18, 1
  store i32 %19, i32* %j, align 4
  br label %7

; <label>:20                                      ; preds = %7
  br label %21

; <label>:21                                      ; preds = %20
  %22 = load i32* %i, align 4
  %23 = add nsw i32 %22, 1
  store i32 %23, i32* %i, align 4
  br label %3

; <label>:24                                      ; preds = %3
  store i32 6, i32* @g_5, align 4
  br label %25

; <label>:25                                      ; preds = %37, %24
  %26 = load i32* @g_5, align 4
  %27 = icmp sge i32 %26, 0
  br i1 %27, label %28, label %40

; <label>:28                                      ; preds = %25
  store i32 0, i32* @g_6, align 4
  br label %29

; <label>:29                                      ; preds = %33, %28
  %30 = load i32* @g_6, align 4
  %31 = icmp slt i32 %30, 3
  br i1 %31, label %32, label %36

; <label>:32                                      ; preds = %29
  store i32* @g_6, i32** %1
  br label %44
                                                  ; No predecessors!
  %34 = load i32* @g_6, align 4
  %35 = add nsw i32 %34, 1
  store i32 %35, i32* @g_6, align 4
  br label %29

; <label>:36                                      ; preds = %29
  br label %37

; <label>:37                                      ; preds = %36
  %38 = load i32* @g_5, align 4
  %39 = add nsw i32 %38, -3
  store i32 %39, i32* @g_5, align 4
  br label %25

; <label>:40                                      ; preds = %25
  %41 = load i32*** @g_7, align 8
  %42 = load i32**** %l_10, align 8
  store i32** %41, i32*** %42
  %43 = load i32** %l_11, align 8
  store i32* %43, i32** %1
  br label %44

; <label>:44                                      ; preds = %40, %32
  %45 = load i32** %1
  ret i32* %45
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
  %5 = load i32* @g_5, align 4
  %6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %5)
  %7 = load i32* @g_6, align 4
  %8 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str1, i32 0, i32 0), i32 %7)
  %9 = load volatile i32* getelementptr inbounds ([6 x i32]* @g_9, i32 0, i64 0), align 4
  %10 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str2, i32 0, i32 0), i32 %9)
  %11 = load volatile i32* getelementptr inbounds ([6 x i32]* @g_9, i32 0, i64 1), align 4
  %12 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str3, i32 0, i32 0), i32 %11)
  %13 = load volatile i32* getelementptr inbounds ([6 x i32]* @g_9, i32 0, i64 2), align 4
  %14 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str4, i32 0, i32 0), i32 %13)
  %15 = load volatile i32* getelementptr inbounds ([6 x i32]* @g_9, i32 0, i64 3), align 4
  %16 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str5, i32 0, i32 0), i32 %15)
  %17 = load volatile i32* getelementptr inbounds ([6 x i32]* @g_9, i32 0, i64 4), align 4
  %18 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str6, i32 0, i32 0), i32 %17)
  %19 = load volatile i32* getelementptr inbounds ([6 x i32]* @g_9, i32 0, i64 5), align 4
  %20 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str7, i32 0, i32 0), i32 %19)
  %21 = load volatile i32* getelementptr inbounds ([6 x i32]* @g_9, i32 0, i64 3), align 4
  %22 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str5, i32 0, i32 0), i32 %21)
  %23 = load i32* %1
  ret i32 %23
}

declare i32 @printf(i8*, ...)
