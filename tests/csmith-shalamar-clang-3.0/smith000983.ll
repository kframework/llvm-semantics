; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith000983.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = global [3 x i16] [i16 -10, i16 -10, i16 -10], align 2
@.str = private unnamed_addr constant [22 x i8] c"checksum g_2[0] = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [22 x i8] c"checksum g_2[1] = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [22 x i8] c"checksum g_2[2] = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable {
  %1 = load i16* getelementptr inbounds ([3 x i16]* @g_2, i32 0, i64 1), align 2
  %2 = zext i16 %1 to i32
  ret i32 %2
}

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  %i = alloca i32, align 4
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  %4 = call i32 @func_1()
  %5 = load i16* getelementptr inbounds ([3 x i16]* @g_2, i32 0, i64 0), align 2
  %6 = zext i16 %5 to i32
  %7 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str, i32 0, i32 0), i32 %6)
  %8 = load i16* getelementptr inbounds ([3 x i16]* @g_2, i32 0, i64 1), align 2
  %9 = zext i16 %8 to i32
  %10 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str1, i32 0, i32 0), i32 %9)
  %11 = load i16* getelementptr inbounds ([3 x i16]* @g_2, i32 0, i64 2), align 2
  %12 = zext i16 %11 to i32
  %13 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str2, i32 0, i32 0), i32 %12)
  %14 = load i16* getelementptr inbounds ([3 x i16]* @g_2, i32 0, i64 1), align 2
  %15 = zext i16 %14 to i32
  %16 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str1, i32 0, i32 0), i32 %15)
  %17 = load i32* %1
  ret i32 %17
}

declare i32 @printf(i8*, ...)
