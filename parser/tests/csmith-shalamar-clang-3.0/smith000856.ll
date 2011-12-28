; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith000856.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_3 = global i8 -30, align 1
@g_4 = global [10 x i32] [i32 1265003125, i32 1265003125, i32 1265003125, i32 1265003125, i32 1265003125, i32 1265003125, i32 1265003125, i32 1265003125, i32 1265003125, i32 1265003125], align 16
@g_5 = global i32* bitcast (i8* getelementptr (i8* bitcast ([10 x i32]* @g_4 to i8*), i64 20) to i32*), align 8
@.str = private unnamed_addr constant [19 x i8] c"checksum g_3 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [22 x i8] c"checksum g_4[0] = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [22 x i8] c"checksum g_4[1] = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [22 x i8] c"checksum g_4[2] = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [22 x i8] c"checksum g_4[3] = %d\0A\00", align 1
@.str5 = private unnamed_addr constant [22 x i8] c"checksum g_4[4] = %d\0A\00", align 1
@.str6 = private unnamed_addr constant [22 x i8] c"checksum g_4[5] = %d\0A\00", align 1
@.str7 = private unnamed_addr constant [22 x i8] c"checksum g_4[6] = %d\0A\00", align 1
@.str8 = private unnamed_addr constant [22 x i8] c"checksum g_4[7] = %d\0A\00", align 1
@.str9 = private unnamed_addr constant [22 x i8] c"checksum g_4[8] = %d\0A\00", align 1
@.str10 = private unnamed_addr constant [22 x i8] c"checksum g_4[9] = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i64 @func_1() nounwind uwtable {
  %l_2 = alloca i16, align 2
  store i16 9, i16* %l_2, align 2
  %1 = load i16* %l_2, align 2
  %2 = sext i16 %1 to i32
  %3 = load volatile i8* @g_3, align 1
  %4 = zext i8 %3 to i32
  %5 = icmp sle i32 %2, %4
  %6 = zext i1 %5 to i32
  %7 = load i32* getelementptr inbounds ([10 x i32]* @g_4, i32 0, i64 3), align 4
  %8 = load i16* %l_2, align 2
  %9 = sext i16 %8 to i32
  %10 = icmp eq i32 %7, %9
  %11 = zext i1 %10 to i32
  %12 = or i32 %6, %11
  %13 = xor i32 %12, -1
  %14 = load volatile i32** @g_5, align 8
  store i32 %13, i32* %14
  %15 = load i16* %l_2, align 2
  %16 = sext i16 %15 to i64
  ret i64 %16
}

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  %i = alloca i32, align 4
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  %4 = call i64 @func_1()
  %5 = load volatile i8* @g_3, align 1
  %6 = zext i8 %5 to i32
  %7 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %6)
  %8 = load i32* getelementptr inbounds ([10 x i32]* @g_4, i32 0, i64 0), align 4
  %9 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str1, i32 0, i32 0), i32 %8)
  %10 = load i32* getelementptr inbounds ([10 x i32]* @g_4, i32 0, i64 1), align 4
  %11 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str2, i32 0, i32 0), i32 %10)
  %12 = load i32* getelementptr inbounds ([10 x i32]* @g_4, i32 0, i64 2), align 4
  %13 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str3, i32 0, i32 0), i32 %12)
  %14 = load i32* getelementptr inbounds ([10 x i32]* @g_4, i32 0, i64 3), align 4
  %15 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str4, i32 0, i32 0), i32 %14)
  %16 = load i32* getelementptr inbounds ([10 x i32]* @g_4, i32 0, i64 4), align 4
  %17 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str5, i32 0, i32 0), i32 %16)
  %18 = load i32* getelementptr inbounds ([10 x i32]* @g_4, i32 0, i64 5), align 4
  %19 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str6, i32 0, i32 0), i32 %18)
  %20 = load i32* getelementptr inbounds ([10 x i32]* @g_4, i32 0, i64 6), align 4
  %21 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str7, i32 0, i32 0), i32 %20)
  %22 = load i32* getelementptr inbounds ([10 x i32]* @g_4, i32 0, i64 7), align 4
  %23 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str8, i32 0, i32 0), i32 %22)
  %24 = load i32* getelementptr inbounds ([10 x i32]* @g_4, i32 0, i64 8), align 4
  %25 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str9, i32 0, i32 0), i32 %24)
  %26 = load i32* getelementptr inbounds ([10 x i32]* @g_4, i32 0, i64 9), align 4
  %27 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str10, i32 0, i32 0), i32 %26)
  %28 = load i32* getelementptr inbounds ([10 x i32]* @g_4, i32 0, i64 3), align 4
  %29 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str4, i32 0, i32 0), i32 %28)
  %30 = load i32* %1
  ret i32 %30
}

declare i32 @printf(i8*, ...)
