; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith000522.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_3 = constant i32 1, align 4
@g_6 = global i32 1069239995, align 4
@g_5 = global i32* @g_6, align 8
@.str = private unnamed_addr constant [19 x i8] c"checksum g_3 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [19 x i8] c"checksum g_6 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define zeroext i16 @func_1() nounwind uwtable {
  %1 = alloca i16, align 2
  %l_2 = alloca i32*, align 8
  %l_4 = alloca [4 x i32**], align 16
  %i = alloca i32, align 4
  store i32* @g_3, i32** %l_2, align 8
  store i32 0, i32* %i, align 4
  br label %2

; <label>:2                                       ; preds = %9, %0
  %3 = load i32* %i, align 4
  %4 = icmp slt i32 %3, 4
  br i1 %4, label %5, label %12

; <label>:5                                       ; preds = %2
  %6 = load i32* %i, align 4
  %7 = sext i32 %6 to i64
  %8 = getelementptr inbounds [4 x i32**]* %l_4, i32 0, i64 %7
  store i32** null, i32*** %8, align 8
  br label %9

; <label>:9                                       ; preds = %5
  %10 = load i32* %i, align 4
  %11 = add nsw i32 %10, 1
  store i32 %11, i32* %i, align 4
  br label %2

; <label>:12                                      ; preds = %2
  %13 = load i32** %l_2, align 8
  store i32* %13, i32** @g_5, align 8
  %14 = icmp ne i32** %l_2, @g_5
  br i1 %14, label %15, label %16

; <label>:15                                      ; preds = %12
  store i32* @g_6, i32** @g_5, align 8
  br label %17

; <label>:16                                      ; preds = %12
  store i16 1, i16* %1
  br label %21

; <label>:17                                      ; preds = %15
  %18 = load i32** %l_2, align 8
  %19 = load i32* %18
  %20 = trunc i32 %19 to i16
  store i16 %20, i16* %1
  br label %21

; <label>:21                                      ; preds = %17, %16
  %22 = load i16* %1
  ret i16 %22
}

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  %4 = call zeroext i16 @func_1()
  %5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 1)
  %6 = load i32* @g_6, align 4
  %7 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str1, i32 0, i32 0), i32 %6)
  %8 = load i32* %1
  ret i32 %8
}

declare i32 @printf(i8*, ...)
