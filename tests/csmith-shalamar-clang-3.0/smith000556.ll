; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith000556.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_7 = global [9 x i32] [i32 1891830172, i32 1891830172, i32 1891830172, i32 1891830172, i32 1891830172, i32 1891830172, i32 1891830172, i32 1891830172, i32 1891830172], align 16
@g_9 = global i32 374868041, align 4
@g_14 = global i32* null, align 8
@.str = private unnamed_addr constant [22 x i8] c"checksum g_7[0] = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [22 x i8] c"checksum g_7[1] = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [22 x i8] c"checksum g_7[2] = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [22 x i8] c"checksum g_7[3] = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [22 x i8] c"checksum g_7[4] = %d\0A\00", align 1
@.str5 = private unnamed_addr constant [22 x i8] c"checksum g_7[5] = %d\0A\00", align 1
@.str6 = private unnamed_addr constant [22 x i8] c"checksum g_7[6] = %d\0A\00", align 1
@.str7 = private unnamed_addr constant [22 x i8] c"checksum g_7[7] = %d\0A\00", align 1
@.str8 = private unnamed_addr constant [22 x i8] c"checksum g_7[8] = %d\0A\00", align 1
@.str9 = private unnamed_addr constant [19 x i8] c"checksum g_9 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define signext i16 @func_1() nounwind uwtable {
  %l_10 = alloca i32, align 4
  %l_12 = alloca i32*, align 8
  %l_11 = alloca i32**, align 8
  %l_13 = alloca [5 x i32*], align 16
  %l_15 = alloca i8, align 1
  %i = alloca i32, align 4
  store i32 0, i32* %l_10, align 4
  store i32* @g_9, i32** %l_12, align 8
  store i32** %l_12, i32*** %l_11, align 8
  store i8 -109, i8* %l_15, align 1
  store i32 0, i32* %i, align 4
  br label %1

; <label>:1                                       ; preds = %8, %0
  %2 = load i32* %i, align 4
  %3 = icmp slt i32 %2, 5
  br i1 %3, label %4, label %11

; <label>:4                                       ; preds = %1
  %5 = load i32* %i, align 4
  %6 = sext i32 %5 to i64
  %7 = getelementptr inbounds [5 x i32*]* %l_13, i32 0, i64 %6
  store i32* null, i32** %7, align 8
  br label %8

; <label>:8                                       ; preds = %4
  %9 = load i32* %i, align 4
  %10 = add nsw i32 %9, 1
  store i32 %10, i32* %i, align 4
  br label %1

; <label>:11                                      ; preds = %1
  %12 = load i32* @g_9, align 4
  %13 = load volatile i32* getelementptr inbounds ([9 x i32]* @g_7, i32 0, i64 1), align 4
  %14 = trunc i32 %13 to i16
  %15 = load i32* @g_9, align 4
  %16 = trunc i32 %15 to i8
  %17 = call i32* @func_2(i32 %12, i16 zeroext %14, i16 signext 0, i8 signext %16)
  %18 = load i32*** %l_11, align 8
  store i32* %17, i32** %18
  %19 = getelementptr inbounds [5 x i32*]* %l_13, i32 0, i64 2
  %20 = load i32** %19, align 8
  store i32* %20, i32** @g_14, align 8
  %21 = load i32*** %l_11, align 8
  store i32* null, i32** %21
  %22 = load i8* %l_15, align 1
  %23 = sext i8 %22 to i16
  ret i16 %23
}

define i32* @func_2(i32 %p_3, i16 zeroext %p_4, i16 signext %p_5, i8 signext %p_6) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i16, align 2
  %3 = alloca i16, align 2
  %4 = alloca i8, align 1
  %l_8 = alloca i32*, align 8
  store i32 %p_3, i32* %1, align 4
  store i16 %p_4, i16* %2, align 2
  store i16 %p_5, i16* %3, align 2
  store i8 %p_6, i8* %4, align 1
  store i32* @g_9, i32** %l_8, align 8
  %5 = load volatile i32* getelementptr inbounds ([9 x i32]* @g_7, i32 0, i64 4), align 4
  %6 = load i32** %l_8, align 8
  %7 = load i32* %6
  %8 = or i32 %7, %5
  store i32 %8, i32* %6
  %9 = load i32** %l_8, align 8
  ret i32* %9
}

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  %i = alloca i32, align 4
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  %4 = call signext i16 @func_1()
  %5 = load volatile i32* getelementptr inbounds ([9 x i32]* @g_7, i32 0, i64 0), align 4
  %6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str, i32 0, i32 0), i32 %5)
  %7 = load volatile i32* getelementptr inbounds ([9 x i32]* @g_7, i32 0, i64 1), align 4
  %8 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str1, i32 0, i32 0), i32 %7)
  %9 = load volatile i32* getelementptr inbounds ([9 x i32]* @g_7, i32 0, i64 2), align 4
  %10 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str2, i32 0, i32 0), i32 %9)
  %11 = load volatile i32* getelementptr inbounds ([9 x i32]* @g_7, i32 0, i64 3), align 4
  %12 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str3, i32 0, i32 0), i32 %11)
  %13 = load volatile i32* getelementptr inbounds ([9 x i32]* @g_7, i32 0, i64 4), align 4
  %14 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str4, i32 0, i32 0), i32 %13)
  %15 = load volatile i32* getelementptr inbounds ([9 x i32]* @g_7, i32 0, i64 5), align 4
  %16 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str5, i32 0, i32 0), i32 %15)
  %17 = load volatile i32* getelementptr inbounds ([9 x i32]* @g_7, i32 0, i64 6), align 4
  %18 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str6, i32 0, i32 0), i32 %17)
  %19 = load volatile i32* getelementptr inbounds ([9 x i32]* @g_7, i32 0, i64 7), align 4
  %20 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str7, i32 0, i32 0), i32 %19)
  %21 = load volatile i32* getelementptr inbounds ([9 x i32]* @g_7, i32 0, i64 8), align 4
  %22 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str8, i32 0, i32 0), i32 %21)
  %23 = load volatile i32* getelementptr inbounds ([9 x i32]* @g_7, i32 0, i64 4), align 4
  %24 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str4, i32 0, i32 0), i32 %23)
  %25 = load i32* @g_9, align 4
  %26 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str9, i32 0, i32 0), i32 %25)
  %27 = load i32* %1
  ret i32 %27
}

declare i32 @printf(i8*, ...)
