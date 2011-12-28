; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith000978.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_7 = global i32* null, align 8
@g_8 = global i32** @g_7, align 8
@g_10 = global i32 0, align 4
@g_9 = global i32* @g_10, align 8
@g_12 = global i32** @g_9, align 8
@.str = private unnamed_addr constant [20 x i8] c"checksum g_10 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define zeroext i16 @func_1() nounwind uwtable {
  %l_11 = alloca [4 x i16], align 2
  %i = alloca i32, align 4
  store i32 0, i32* %i, align 4
  br label %1

; <label>:1                                       ; preds = %8, %0
  %2 = load i32* %i, align 4
  %3 = icmp slt i32 %2, 4
  br i1 %3, label %4, label %11

; <label>:4                                       ; preds = %1
  %5 = load i32* %i, align 4
  %6 = sext i32 %5 to i64
  %7 = getelementptr inbounds [4 x i16]* %l_11, i32 0, i64 %6
  store i16 10934, i16* %7, align 2
  br label %8

; <label>:8                                       ; preds = %4
  %9 = load i32* %i, align 4
  %10 = add nsw i32 %9, 1
  store i32 %10, i32* %i, align 4
  br label %1

; <label>:11                                      ; preds = %1
  %12 = getelementptr inbounds [4 x i16]* %l_11, i32 0, i64 0
  %13 = load i16* %12, align 2
  %14 = trunc i16 %13 to i8
  %15 = load i32* @g_10, align 4
  %16 = call i32* @func_2(i64 2822193965910059622, i8 zeroext -115, i8 signext %14, i32 %15)
  %17 = load volatile i32*** @g_12, align 8
  store i32* %16, i32** %17
  %18 = getelementptr inbounds [4 x i16]* %l_11, i32 0, i64 0
  %19 = load i16* %18, align 2
  %20 = zext i16 %19 to i32
  %21 = load i32** @g_9, align 8
  %22 = load i32* %21
  %23 = and i32 %22, %20
  store i32 %23, i32* %21
  %24 = getelementptr inbounds [4 x i16]* %l_11, i32 0, i64 0
  %25 = load i16* %24, align 2
  ret i16 %25
}

define i32* @func_2(i64 %p_3, i8 zeroext %p_4, i8 signext %p_5, i32 %p_6) nounwind uwtable {
  %1 = alloca i64, align 8
  %2 = alloca i8, align 1
  %3 = alloca i8, align 1
  %4 = alloca i32, align 4
  store i64 %p_3, i64* %1, align 8
  store i8 %p_4, i8* %2, align 1
  store i8 %p_5, i8* %3, align 1
  store i32 %p_6, i32* %4, align 4
  %5 = load i32** @g_7, align 8
  %6 = load volatile i32*** @g_8, align 8
  store i32* %5, i32** %6
  %7 = load volatile i32*** @g_8, align 8
  %8 = load i32** %7
  %9 = load volatile i32*** @g_8, align 8
  store i32* %8, i32** %9
  %10 = load i32** @g_9, align 8
  ret i32* %10
}

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  %4 = call zeroext i16 @func_1()
  %5 = load i32* @g_10, align 4
  %6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str, i32 0, i32 0), i32 %5)
  %7 = load i32* %1
  ret i32 %7
}

declare i32 @printf(i8*, ...)
