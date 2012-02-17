; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith000122.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = global i32 0, align 4
@g_3 = global i32 8, align 4
@g_5 = global i32 0, align 4
@g_4 = global i32* @g_5, align 8
@.str = private unnamed_addr constant [19 x i8] c"checksum g_2 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [19 x i8] c"checksum g_3 = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [19 x i8] c"checksum g_5 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable {
  %l_6 = alloca i32**, align 8
  store i32** @g_4, i32*** %l_6, align 8
  %1 = load i32* @g_2, align 4
  %2 = load i32* @g_3, align 4
  %3 = xor i32 %2, %1
  store i32 %3, i32* @g_3, align 4
  %4 = load i32** @g_4, align 8
  %5 = load i32*** %l_6, align 8
  store i32* %4, i32** %5
  %6 = load i32*** %l_6, align 8
  %7 = load i32** %6
  %8 = load i32* %7
  ret i32 %8
}

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  %4 = call i32 @func_1()
  %5 = load i32* @g_2, align 4
  %6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %5)
  %7 = load i32* @g_3, align 4
  %8 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str1, i32 0, i32 0), i32 %7)
  %9 = load i32* @g_5, align 4
  %10 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str2, i32 0, i32 0), i32 %9)
  %11 = load i32* %1
  ret i32 %11
}

declare i32 @printf(i8*, ...)
