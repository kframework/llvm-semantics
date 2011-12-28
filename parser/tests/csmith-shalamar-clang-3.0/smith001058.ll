; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith001058.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_9 = global i32 5, align 4
@g_12 = global i32* @g_9, align 8
@g_11 = global i32** @g_12, align 8
@.str = private unnamed_addr constant [19 x i8] c"checksum g_9 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable {
  %l_10 = alloca i32, align 4
  store i32 1997174728, i32* %l_10, align 4
  %1 = load i32* @g_9, align 4
  %2 = trunc i32 %1 to i8
  %3 = load i32* %l_10, align 4
  %4 = trunc i32 %3 to i16
  %5 = load i32* @g_9, align 4
  %6 = sext i32 %5 to i64
  %7 = call i32* @func_2(i8 signext %2, i32* @g_9, i8 signext 21, i16 zeroext %4, i64 %6)
  %8 = load volatile i32*** @g_11, align 8
  store i32* %7, i32** %8
  %9 = load volatile i32*** @g_11, align 8
  %10 = load i32** %9
  %11 = load i32* %10
  ret i32 %11
}

define i32* @func_2(i8 signext %p_3, i32* %p_4, i8 signext %p_5, i16 zeroext %p_6, i64 %p_7) nounwind uwtable {
  %1 = alloca i8, align 1
  %2 = alloca i32*, align 8
  %3 = alloca i8, align 1
  %4 = alloca i16, align 2
  %5 = alloca i64, align 8
  %l_8 = alloca i32*, align 8
  store i8 %p_3, i8* %1, align 1
  store i32* %p_4, i32** %2, align 8
  store i8 %p_5, i8* %3, align 1
  store i16 %p_6, i16* %4, align 2
  store i64 %p_7, i64* %5, align 8
  store i32* @g_9, i32** %l_8, align 8
  %6 = load i32** %l_8, align 8
  ret i32* %6
}

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  %4 = call i32 @func_1()
  %5 = load i32* @g_9, align 4
  %6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %5)
  %7 = load i32* %1
  ret i32 %7
}

declare i32 @printf(i8*, ...)
