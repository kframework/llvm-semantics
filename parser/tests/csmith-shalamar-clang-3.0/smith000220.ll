; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith000220.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_5 = global i32 7, align 4
@g_6 = global i32** null, align 8
@.str = private unnamed_addr constant [19 x i8] c"checksum g_5 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable {
  %l_8 = alloca [2 x [7 x i32*]], align 16
  %l_7 = alloca i32**, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %1 = getelementptr inbounds [2 x [7 x i32*]]* %l_8, i32 0, i64 0
  %2 = getelementptr inbounds [7 x i32*]* %1, i32 0, i64 6
  store i32** %2, i32*** %l_7, align 8
  store i32 0, i32* %i, align 4
  br label %3

; <label>:3                                       ; preds = %21, %0
  %4 = load i32* %i, align 4
  %5 = icmp slt i32 %4, 2
  br i1 %5, label %6, label %24

; <label>:6                                       ; preds = %3
  store i32 0, i32* %j, align 4
  br label %7

; <label>:7                                       ; preds = %17, %6
  %8 = load i32* %j, align 4
  %9 = icmp slt i32 %8, 7
  br i1 %9, label %10, label %20

; <label>:10                                      ; preds = %7
  %11 = load i32* %j, align 4
  %12 = sext i32 %11 to i64
  %13 = load i32* %i, align 4
  %14 = sext i32 %13 to i64
  %15 = getelementptr inbounds [2 x [7 x i32*]]* %l_8, i32 0, i64 %14
  %16 = getelementptr inbounds [7 x i32*]* %15, i32 0, i64 %12
  store i32* @g_5, i32** %16, align 8
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
  %25 = load i32* @g_5, align 4
  %26 = trunc i32 %25 to i16
  %27 = call i32* @func_2(i16 signext %26)
  %28 = load i32*** %l_7, align 8
  store i32* %27, i32** %28
  %29 = load i32* @g_5, align 4
  ret i32 %29
}

define i32* @func_2(i16 signext %p_3) nounwind uwtable {
  %1 = alloca i16, align 2
  %l_4 = alloca i32*, align 8
  store i16 %p_3, i16* %1, align 2
  store i32* @g_5, i32** %l_4, align 8
  %2 = load i32** %l_4, align 8
  ret i32* %2
}

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  %4 = call i32 @func_1()
  %5 = load i32* @g_5, align 4
  %6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %5)
  %7 = load i32* %1
  ret i32 %7
}

declare i32 @printf(i8*, ...)
