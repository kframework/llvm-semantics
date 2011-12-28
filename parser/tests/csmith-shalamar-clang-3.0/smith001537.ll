; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith001537.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_3 = global i32 0, align 4
@g_2 = global [6 x [2 x i32*]] [[2 x i32*] [i32* @g_3, i32* @g_3], [2 x i32*] [i32* @g_3, i32* @g_3], [2 x i32*] [i32* @g_3, i32* @g_3], [2 x i32*] [i32* @g_3, i32* @g_3], [2 x i32*] [i32* @g_3, i32* @g_3], [2 x i32*] [i32* @g_3, i32* @g_3]], align 16
@g_4 = global [1 x [7 x i32**]] [[7 x i32**] [i32** bitcast (i8* getelementptr (i8* bitcast ([6 x [2 x i32*]]* @g_2 to i8*), i64 24) to i32**), i32** bitcast (i8* getelementptr (i8* bitcast ([6 x [2 x i32*]]* @g_2 to i8*), i64 24) to i32**), i32** bitcast (i8* getelementptr (i8* bitcast ([6 x [2 x i32*]]* @g_2 to i8*), i64 24) to i32**), i32** bitcast (i8* getelementptr (i8* bitcast ([6 x [2 x i32*]]* @g_2 to i8*), i64 24) to i32**), i32** bitcast (i8* getelementptr (i8* bitcast ([6 x [2 x i32*]]* @g_2 to i8*), i64 24) to i32**), i32** bitcast (i8* getelementptr (i8* bitcast ([6 x [2 x i32*]]* @g_2 to i8*), i64 24) to i32**), i32** bitcast (i8* getelementptr (i8* bitcast ([6 x [2 x i32*]]* @g_2 to i8*), i64 24) to i32**)]], align 16
@g_7 = global i32 1260925030, align 4
@.str = private unnamed_addr constant [19 x i8] c"checksum g_3 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [19 x i8] c"checksum g_7 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define signext i16 @func_1() nounwind uwtable {
  %l_5 = alloca i32**, align 8
  %l_6 = alloca i32*, align 8
  store i32** getelementptr inbounds ([6 x [2 x i32*]]* @g_2, i32 0, i64 1, i64 0), i32*** %l_5, align 8
  store i32* @g_7, i32** %l_6, align 8
  %1 = load volatile i32** getelementptr inbounds ([6 x [2 x i32*]]* @g_2, i32 0, i64 1, i64 1), align 8
  %2 = load i32*** %l_5, align 8
  store volatile i32* %1, i32** %2
  %3 = load i32*** %l_5, align 8
  %4 = load volatile i32** %3
  %5 = load volatile i32* %4
  %6 = load i32** %l_6, align 8
  %7 = load i32* %6
  %8 = and i32 %7, %5
  store i32 %8, i32* %6
  %9 = load i32*** %l_5, align 8
  %10 = load volatile i32** %9
  %11 = load volatile i32* %10
  %12 = trunc i32 %11 to i16
  ret i16 %12
}

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  %4 = call signext i16 @func_1()
  %5 = load volatile i32* @g_3, align 4
  %6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %5)
  %7 = load i32* @g_7, align 4
  %8 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str1, i32 0, i32 0), i32 %7)
  %9 = load i32* %1
  ret i32 %9
}

declare i32 @printf(i8*, ...)
