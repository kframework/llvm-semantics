; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith000752.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = global i8 54, align 1
@.str = private unnamed_addr constant [19 x i8] c"checksum g_2 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable {
  %l_3 = alloca i64, align 8
  %l_4 = alloca i32*, align 8
  %l_5 = alloca i32, align 4
  store i64 7026436497578861094, i64* %l_3, align 8
  store i32* null, i32** %l_4, align 8
  store i32 4, i32* %l_5, align 4
  %1 = load volatile i8* @g_2, align 1
  %2 = zext i8 %1 to i64
  %3 = xor i64 %2, 3478438854
  %4 = load i64* %l_3, align 8
  %5 = icmp uge i64 %3, %4
  %6 = zext i1 %5 to i32
  %7 = load i32* %l_5, align 4
  %8 = xor i32 %7, %6
  store i32 %8, i32* %l_5, align 4
  %9 = load volatile i8* @g_2, align 1
  %10 = zext i8 %9 to i32
  ret i32 %10
}

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  %4 = call i32 @func_1()
  %5 = load volatile i8* @g_2, align 1
  %6 = zext i8 %5 to i32
  %7 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %6)
  %8 = load i32* %1
  ret i32 %8
}

declare i32 @printf(i8*, ...)
