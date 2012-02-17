; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith001251.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = global i32 535539439, align 4
@g_3 = global [5 x i8] c"\EC\EC\EC\EC\EC", align 1
@g_6 = global i32 -273016243, align 4
@g_5 = constant i32* @g_6, align 8
@.str = private unnamed_addr constant [19 x i8] c"checksum g_2 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [22 x i8] c"checksum g_3[0] = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [22 x i8] c"checksum g_3[1] = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [22 x i8] c"checksum g_3[2] = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [22 x i8] c"checksum g_3[3] = %d\0A\00", align 1
@.str5 = private unnamed_addr constant [22 x i8] c"checksum g_3[4] = %d\0A\00", align 1
@.str6 = private unnamed_addr constant [19 x i8] c"checksum g_6 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define signext i8 @func_1() nounwind uwtable {
  %l_4 = alloca i64, align 8
  store i64 -1851238411739360625, i64* %l_4, align 8
  %1 = load volatile i32* @g_2, align 4
  %2 = load i8* getelementptr inbounds ([5 x i8]* @g_3, i32 0, i64 1), align 1
  %3 = zext i8 %2 to i64
  %4 = load i64* %l_4, align 8
  %5 = load i64* %l_4, align 8
  %6 = icmp ugt i64 %4, %5
  %7 = zext i1 %6 to i32
  %8 = sext i32 %7 to i64
  %9 = xor i64 0, %8
  %10 = icmp slt i64 %3, %9
  %11 = zext i1 %10 to i32
  %12 = icmp ugt i32 %1, %11
  %13 = zext i1 %12 to i32
  %14 = load volatile i32** @g_5, align 8
  store i32 %13, i32* %14
  %15 = load i64* %l_4, align 8
  %16 = trunc i64 %15 to i8
  ret i8 %16
}

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  %i = alloca i32, align 4
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  %4 = call signext i8 @func_1()
  %5 = load volatile i32* @g_2, align 4
  %6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %5)
  %7 = load i8* getelementptr inbounds ([5 x i8]* @g_3, i32 0, i64 0), align 1
  %8 = zext i8 %7 to i32
  %9 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str1, i32 0, i32 0), i32 %8)
  %10 = load i8* getelementptr inbounds ([5 x i8]* @g_3, i32 0, i64 1), align 1
  %11 = zext i8 %10 to i32
  %12 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str2, i32 0, i32 0), i32 %11)
  %13 = load i8* getelementptr inbounds ([5 x i8]* @g_3, i32 0, i64 2), align 1
  %14 = zext i8 %13 to i32
  %15 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str3, i32 0, i32 0), i32 %14)
  %16 = load i8* getelementptr inbounds ([5 x i8]* @g_3, i32 0, i64 3), align 1
  %17 = zext i8 %16 to i32
  %18 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str4, i32 0, i32 0), i32 %17)
  %19 = load i8* getelementptr inbounds ([5 x i8]* @g_3, i32 0, i64 4), align 1
  %20 = zext i8 %19 to i32
  %21 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str5, i32 0, i32 0), i32 %20)
  %22 = load i8* getelementptr inbounds ([5 x i8]* @g_3, i32 0, i64 1), align 1
  %23 = zext i8 %22 to i32
  %24 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str2, i32 0, i32 0), i32 %23)
  %25 = load i32* @g_6, align 4
  %26 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str6, i32 0, i32 0), i32 %25)
  %27 = load i32* %1
  ret i32 %27
}

declare i32 @printf(i8*, ...)
