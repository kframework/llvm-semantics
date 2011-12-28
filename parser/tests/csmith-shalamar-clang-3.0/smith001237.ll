; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith001237.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_5 = global i32 4, align 4
@.str = private unnamed_addr constant [19 x i8] c"checksum g_5 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define zeroext i16 @func_1() nounwind uwtable {
  %l_2 = alloca i32*, align 8
  %l_3 = alloca i32**, align 8
  %l_4 = alloca i32*, align 8
  store i32* null, i32** %l_2, align 8
  store i32** %l_2, i32*** %l_3, align 8
  store i32* @g_5, i32** %l_4, align 8
  %1 = load i32** %l_2, align 8
  %2 = load i32*** %l_3, align 8
  store i32* %1, i32** %2
  %3 = load i32** %l_4, align 8
  %4 = load i32*** %l_3, align 8
  store i32* %3, i32** %4
  %5 = load i32* @g_5, align 4
  %6 = trunc i32 %5 to i16
  ret i16 %6
}

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  %4 = call zeroext i16 @func_1()
  %5 = load i32* @g_5, align 4
  %6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %5)
  %7 = load i32* %1
  ret i32 %7
}

declare i32 @printf(i8*, ...)
