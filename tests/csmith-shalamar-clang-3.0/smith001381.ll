; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith001381.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_4 = global i32 9, align 4
@g_3 = global [2 x [2 x [3 x i32*]]] [[2 x [3 x i32*]] [[3 x i32*] [i32* @g_4, i32* @g_4, i32* @g_4], [3 x i32*] [i32* @g_4, i32* @g_4, i32* @g_4]], [2 x [3 x i32*]] [[3 x i32*] [i32* @g_4, i32* @g_4, i32* @g_4], [3 x i32*] [i32* @g_4, i32* @g_4, i32* @g_4]]], align 16
@.str = private unnamed_addr constant [19 x i8] c"checksum g_4 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define zeroext i16 @func_1() nounwind uwtable {
  %l_2 = alloca i16, align 2
  %l_5 = alloca i32*, align 8
  store i16 26695, i16* %l_2, align 2
  store i32* @g_4, i32** %l_5, align 8
  %1 = load i16* %l_2, align 2
  %2 = sext i16 %1 to i32
  %3 = load i32** %l_5, align 8
  %4 = load i32* %3
  %5 = xor i32 %4, %2
  store i32 %5, i32* %3
  %6 = load i32** %l_5, align 8
  %7 = load i32* %6
  %8 = load i32** %l_5, align 8
  store i32 %7, i32* %8
  %9 = load i32** %l_5, align 8
  %10 = load i32* %9
  %11 = trunc i32 %10 to i16
  ret i16 %11
}

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  %4 = call zeroext i16 @func_1()
  %5 = load i32* @g_4, align 4
  %6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %5)
  %7 = load i32* %1
  ret i32 %7
}

declare i32 @printf(i8*, ...)
