; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith001622.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = global i32* null, align 8
@g_5 = global i8 114, align 1
@g_7 = global i32 -33517089, align 4
@.str = private unnamed_addr constant [19 x i8] c"checksum g_5 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [19 x i8] c"checksum g_7 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable {
  %l_3 = alloca i32**, align 8
  %l_4 = alloca i32**, align 8
  %l_6 = alloca i32*, align 8
  store i32** null, i32*** %l_3, align 8
  store i32** @g_2, i32*** %l_4, align 8
  store i32* @g_7, i32** %l_6, align 8
  %1 = load volatile i32** @g_2, align 8
  %2 = load i32*** %l_4, align 8
  store volatile i32* %1, i32** %2
  %3 = load i8* @g_5, align 1
  %4 = zext i8 %3 to i32
  %5 = load i8* @g_5, align 1
  %6 = zext i8 %5 to i32
  %7 = icmp slt i32 %4, %6
  %8 = zext i1 %7 to i32
  %9 = load i32** %l_6, align 8
  %10 = load i32* %9
  %11 = xor i32 %10, %8
  store i32 %11, i32* %9
  %12 = load i32** %l_6, align 8
  %13 = load i32* %12
  ret i32 %13
}

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  %4 = call i32 @func_1()
  %5 = load i8* @g_5, align 1
  %6 = zext i8 %5 to i32
  %7 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %6)
  %8 = load i32* @g_7, align 4
  %9 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str1, i32 0, i32 0), i32 %8)
  %10 = load i32* %1
  ret i32 %10
}

declare i32 @printf(i8*, ...)
