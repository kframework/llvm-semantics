; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith000246.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_7 = global [8 x i32] [i32 -167511435, i32 -167511435, i32 -167511435, i32 -167511435, i32 -167511435, i32 -167511435, i32 -167511435, i32 -167511435], align 16
@g_10 = global i32 7, align 4
@g_9 = global [10 x [8 x i32*]] [[8 x i32*] [i32* @g_10, i32* @g_10, i32* @g_10, i32* @g_10, i32* @g_10, i32* @g_10, i32* @g_10, i32* @g_10], [8 x i32*] [i32* @g_10, i32* @g_10, i32* @g_10, i32* @g_10, i32* @g_10, i32* @g_10, i32* @g_10, i32* @g_10], [8 x i32*] [i32* @g_10, i32* @g_10, i32* @g_10, i32* @g_10, i32* @g_10, i32* @g_10, i32* @g_10, i32* @g_10], [8 x i32*] [i32* @g_10, i32* @g_10, i32* @g_10, i32* @g_10, i32* @g_10, i32* @g_10, i32* @g_10, i32* @g_10], [8 x i32*] [i32* @g_10, i32* @g_10, i32* @g_10, i32* @g_10, i32* @g_10, i32* @g_10, i32* @g_10, i32* @g_10], [8 x i32*] [i32* @g_10, i32* @g_10, i32* @g_10, i32* @g_10, i32* @g_10, i32* @g_10, i32* @g_10, i32* @g_10], [8 x i32*] [i32* @g_10, i32* @g_10, i32* @g_10, i32* @g_10, i32* @g_10, i32* @g_10, i32* @g_10, i32* @g_10], [8 x i32*] [i32* @g_10, i32* @g_10, i32* @g_10, i32* @g_10, i32* @g_10, i32* @g_10, i32* @g_10, i32* @g_10], [8 x i32*] [i32* @g_10, i32* @g_10, i32* @g_10, i32* @g_10, i32* @g_10, i32* @g_10, i32* @g_10, i32* @g_10], [8 x i32*] [i32* @g_10, i32* @g_10, i32* @g_10, i32* @g_10, i32* @g_10, i32* @g_10, i32* @g_10, i32* @g_10]], align 16
@g_11 = global [7 x [3 x i32*]] [[3 x i32*] [i32* @g_10, i32* @g_10, i32* @g_10], [3 x i32*] [i32* @g_10, i32* @g_10, i32* @g_10], [3 x i32*] [i32* @g_10, i32* @g_10, i32* @g_10], [3 x i32*] [i32* @g_10, i32* @g_10, i32* @g_10], [3 x i32*] [i32* @g_10, i32* @g_10, i32* @g_10], [3 x i32*] [i32* @g_10, i32* @g_10, i32* @g_10], [3 x i32*] [i32* @g_10, i32* @g_10, i32* @g_10]], align 16
@g_12 = global [4 x i32*] [i32* @g_10, i32* @g_10, i32* @g_10, i32* @g_10], align 16
@g_13 = global i32* null, align 8
@g_14 = global i32* @g_10, align 8
@.str = private unnamed_addr constant [22 x i8] c"checksum g_7[0] = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [22 x i8] c"checksum g_7[1] = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [22 x i8] c"checksum g_7[2] = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [22 x i8] c"checksum g_7[3] = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [22 x i8] c"checksum g_7[4] = %d\0A\00", align 1
@.str5 = private unnamed_addr constant [22 x i8] c"checksum g_7[5] = %d\0A\00", align 1
@.str6 = private unnamed_addr constant [22 x i8] c"checksum g_7[6] = %d\0A\00", align 1
@.str7 = private unnamed_addr constant [22 x i8] c"checksum g_7[7] = %d\0A\00", align 1
@.str8 = private unnamed_addr constant [20 x i8] c"checksum g_10 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable {
  %l_8 = alloca i16, align 2
  %l_15 = alloca i32*, align 8
  store i16 -547, i16* %l_8, align 2
  store i32* @g_10, i32** %l_15, align 8
  %1 = load i16* %l_8, align 2
  %2 = zext i16 %1 to i32
  %3 = load i32* getelementptr inbounds ([8 x i32]* @g_7, i32 0, i64 7), align 4
  %4 = trunc i32 %3 to i16
  %5 = load i16* %l_8, align 2
  %6 = trunc i16 %5 to i8
  %7 = call i32 @func_2(i32 %2, i16 signext %4, i8 signext %6, i32 613540510)
  %8 = load volatile i32** @g_14, align 8
  store i32 %7, i32* %8
  %9 = load i32** %l_15, align 8
  %10 = load i32* %9
  %11 = sext i32 %10 to i64
  %12 = xor i64 %11, 1
  %13 = trunc i64 %12 to i32
  store i32 %13, i32* %9
  %14 = load i32** %l_15, align 8
  %15 = load i32* %14
  ret i32 %15
}

define i32 @func_2(i32 %p_3, i16 signext %p_4, i8 signext %p_5, i32 %p_6) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i16, align 2
  %3 = alloca i8, align 1
  %4 = alloca i32, align 4
  store i32 %p_3, i32* %1, align 4
  store i16 %p_4, i16* %2, align 2
  store i8 %p_5, i8* %3, align 1
  store i32 %p_6, i32* %4, align 4
  %5 = load i32* getelementptr inbounds ([8 x i32]* @g_7, i32 0, i64 4), align 4
  ret i32 %5
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
  %4 = call i32 @func_1()
  %5 = load i32* getelementptr inbounds ([8 x i32]* @g_7, i32 0, i64 0), align 4
  %6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str, i32 0, i32 0), i32 %5)
  %7 = load i32* getelementptr inbounds ([8 x i32]* @g_7, i32 0, i64 1), align 4
  %8 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str1, i32 0, i32 0), i32 %7)
  %9 = load i32* getelementptr inbounds ([8 x i32]* @g_7, i32 0, i64 2), align 4
  %10 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str2, i32 0, i32 0), i32 %9)
  %11 = load i32* getelementptr inbounds ([8 x i32]* @g_7, i32 0, i64 3), align 4
  %12 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str3, i32 0, i32 0), i32 %11)
  %13 = load i32* getelementptr inbounds ([8 x i32]* @g_7, i32 0, i64 4), align 4
  %14 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str4, i32 0, i32 0), i32 %13)
  %15 = load i32* getelementptr inbounds ([8 x i32]* @g_7, i32 0, i64 5), align 4
  %16 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str5, i32 0, i32 0), i32 %15)
  %17 = load i32* getelementptr inbounds ([8 x i32]* @g_7, i32 0, i64 6), align 4
  %18 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str6, i32 0, i32 0), i32 %17)
  %19 = load i32* getelementptr inbounds ([8 x i32]* @g_7, i32 0, i64 7), align 4
  %20 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str7, i32 0, i32 0), i32 %19)
  %21 = load i32* getelementptr inbounds ([8 x i32]* @g_7, i32 0, i64 4), align 4
  %22 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str4, i32 0, i32 0), i32 %21)
  %23 = load i32* @g_10, align 4
  %24 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str8, i32 0, i32 0), i32 %23)
  %25 = load i32* %1
  ret i32 %25
}

declare i32 @printf(i8*, ...)
