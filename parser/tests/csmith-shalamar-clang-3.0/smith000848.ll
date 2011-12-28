; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith000848.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = global [1 x [4 x [3 x [1 x i16]]]] zeroinitializer, align 16
@g_4 = global i32 -4, align 4
@g_3 = global i32* @g_4, align 8
@.str = private unnamed_addr constant [31 x i8] c"checksum g_2[0][0][0][0] = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [31 x i8] c"checksum g_2[0][0][1][0] = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [31 x i8] c"checksum g_2[0][0][2][0] = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [31 x i8] c"checksum g_2[0][1][0][0] = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [31 x i8] c"checksum g_2[0][1][1][0] = %d\0A\00", align 1
@.str5 = private unnamed_addr constant [31 x i8] c"checksum g_2[0][1][2][0] = %d\0A\00", align 1
@.str6 = private unnamed_addr constant [31 x i8] c"checksum g_2[0][2][0][0] = %d\0A\00", align 1
@.str7 = private unnamed_addr constant [31 x i8] c"checksum g_2[0][2][1][0] = %d\0A\00", align 1
@.str8 = private unnamed_addr constant [31 x i8] c"checksum g_2[0][2][2][0] = %d\0A\00", align 1
@.str9 = private unnamed_addr constant [31 x i8] c"checksum g_2[0][3][0][0] = %d\0A\00", align 1
@.str10 = private unnamed_addr constant [31 x i8] c"checksum g_2[0][3][1][0] = %d\0A\00", align 1
@.str11 = private unnamed_addr constant [31 x i8] c"checksum g_2[0][3][2][0] = %d\0A\00", align 1
@.str12 = private unnamed_addr constant [19 x i8] c"checksum g_4 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define signext i8 @func_1() nounwind uwtable {
  %l_5 = alloca i64, align 8
  store i64 -1, i64* %l_5, align 8
  %1 = load volatile i16* getelementptr inbounds ([1 x [4 x [3 x [1 x i16]]]]* @g_2, i32 0, i64 0, i64 2, i64 0, i64 0), align 2
  %2 = zext i16 %1 to i64
  %3 = icmp sle i64 290607819, %2
  %4 = zext i1 %3 to i32
  %5 = load volatile i32** @g_3, align 8
  store i32 %4, i32* %5
  %6 = load i64* %l_5, align 8
  %7 = trunc i64 %6 to i8
  ret i8 %7
}

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %l = alloca i32, align 4
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  %4 = call signext i8 @func_1()
  %5 = load volatile i16* getelementptr inbounds ([1 x [4 x [3 x [1 x i16]]]]* @g_2, i32 0, i64 0, i64 0, i64 0, i64 0), align 2
  %6 = zext i16 %5 to i32
  %7 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str, i32 0, i32 0), i32 %6)
  %8 = load volatile i16* getelementptr inbounds ([1 x [4 x [3 x [1 x i16]]]]* @g_2, i32 0, i64 0, i64 0, i64 1, i64 0), align 2
  %9 = zext i16 %8 to i32
  %10 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str1, i32 0, i32 0), i32 %9)
  %11 = load volatile i16* getelementptr inbounds ([1 x [4 x [3 x [1 x i16]]]]* @g_2, i32 0, i64 0, i64 0, i64 2, i64 0), align 2
  %12 = zext i16 %11 to i32
  %13 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str2, i32 0, i32 0), i32 %12)
  %14 = load volatile i16* getelementptr inbounds ([1 x [4 x [3 x [1 x i16]]]]* @g_2, i32 0, i64 0, i64 1, i64 0, i64 0), align 2
  %15 = zext i16 %14 to i32
  %16 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str3, i32 0, i32 0), i32 %15)
  %17 = load volatile i16* getelementptr inbounds ([1 x [4 x [3 x [1 x i16]]]]* @g_2, i32 0, i64 0, i64 1, i64 1, i64 0), align 2
  %18 = zext i16 %17 to i32
  %19 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str4, i32 0, i32 0), i32 %18)
  %20 = load volatile i16* getelementptr inbounds ([1 x [4 x [3 x [1 x i16]]]]* @g_2, i32 0, i64 0, i64 1, i64 2, i64 0), align 2
  %21 = zext i16 %20 to i32
  %22 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str5, i32 0, i32 0), i32 %21)
  %23 = load volatile i16* getelementptr inbounds ([1 x [4 x [3 x [1 x i16]]]]* @g_2, i32 0, i64 0, i64 2, i64 0, i64 0), align 2
  %24 = zext i16 %23 to i32
  %25 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str6, i32 0, i32 0), i32 %24)
  %26 = load volatile i16* getelementptr inbounds ([1 x [4 x [3 x [1 x i16]]]]* @g_2, i32 0, i64 0, i64 2, i64 1, i64 0), align 2
  %27 = zext i16 %26 to i32
  %28 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str7, i32 0, i32 0), i32 %27)
  %29 = load volatile i16* getelementptr inbounds ([1 x [4 x [3 x [1 x i16]]]]* @g_2, i32 0, i64 0, i64 2, i64 2, i64 0), align 2
  %30 = zext i16 %29 to i32
  %31 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str8, i32 0, i32 0), i32 %30)
  %32 = load volatile i16* getelementptr inbounds ([1 x [4 x [3 x [1 x i16]]]]* @g_2, i32 0, i64 0, i64 3, i64 0, i64 0), align 2
  %33 = zext i16 %32 to i32
  %34 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str9, i32 0, i32 0), i32 %33)
  %35 = load volatile i16* getelementptr inbounds ([1 x [4 x [3 x [1 x i16]]]]* @g_2, i32 0, i64 0, i64 3, i64 1, i64 0), align 2
  %36 = zext i16 %35 to i32
  %37 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str10, i32 0, i32 0), i32 %36)
  %38 = load volatile i16* getelementptr inbounds ([1 x [4 x [3 x [1 x i16]]]]* @g_2, i32 0, i64 0, i64 3, i64 2, i64 0), align 2
  %39 = zext i16 %38 to i32
  %40 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str11, i32 0, i32 0), i32 %39)
  %41 = load volatile i16* getelementptr inbounds ([1 x [4 x [3 x [1 x i16]]]]* @g_2, i32 0, i64 0, i64 2, i64 0, i64 0), align 2
  %42 = zext i16 %41 to i32
  %43 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str6, i32 0, i32 0), i32 %42)
  %44 = load i32* @g_4, align 4
  %45 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str12, i32 0, i32 0), i32 %44)
  %46 = load i32* %1
  ret i32 %46
}

declare i32 @printf(i8*, ...)
