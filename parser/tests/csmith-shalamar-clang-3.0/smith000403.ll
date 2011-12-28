; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith000403.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = constant i16 -1, align 2
@g_3 = global i16 8, align 2
@g_5 = global [6 x i32] [i32 1213985372, i32 1213985372, i32 1213985372, i32 1213985372, i32 1213985372, i32 1213985372], align 16
@.str = private unnamed_addr constant [19 x i8] c"checksum g_2 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [19 x i8] c"checksum g_3 = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [22 x i8] c"checksum g_5[0] = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [22 x i8] c"checksum g_5[1] = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [22 x i8] c"checksum g_5[2] = %d\0A\00", align 1
@.str5 = private unnamed_addr constant [22 x i8] c"checksum g_5[3] = %d\0A\00", align 1
@.str6 = private unnamed_addr constant [22 x i8] c"checksum g_5[4] = %d\0A\00", align 1
@.str7 = private unnamed_addr constant [22 x i8] c"checksum g_5[5] = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define zeroext i16 @func_1() nounwind uwtable {
  %l_4 = alloca [5 x i32], align 16
  %i = alloca i32, align 4
  %i1 = alloca i32, align 4
  store i32 0, i32* %i, align 4
  br label %1

; <label>:1                                       ; preds = %8, %0
  %2 = load i32* %i, align 4
  %3 = icmp slt i32 %2, 5
  br i1 %3, label %4, label %11

; <label>:4                                       ; preds = %1
  %5 = load i32* %i, align 4
  %6 = sext i32 %5 to i64
  %7 = getelementptr inbounds [5 x i32]* %l_4, i32 0, i64 %6
  store i32 1806489493, i32* %7, align 4
  br label %8

; <label>:8                                       ; preds = %4
  %9 = load i32* %i, align 4
  %10 = add nsw i32 %9, 1
  store i32 %10, i32* %i, align 4
  br label %1

; <label>:11                                      ; preds = %1
  %12 = load volatile i16* @g_2, align 2
  store volatile i16 %12, i16* @g_3, align 2
  store volatile i16 2, i16* @g_3, align 2
  br label %13

; <label>:13                                      ; preds = %18, %11
  %14 = load volatile i16* @g_3, align 2
  %15 = sext i16 %14 to i32
  %16 = icmp slt i32 %15, 5
  br i1 %16, label %17, label %23

; <label>:17                                      ; preds = %13
  br label %18

; <label>:18                                      ; preds = %17
  %19 = load volatile i16* @g_3, align 2
  %20 = sext i16 %19 to i32
  %21 = add nsw i32 %20, 3
  %22 = trunc i32 %21 to i16
  store volatile i16 %22, i16* @g_3, align 2
  br label %13

; <label>:23                                      ; preds = %13
  %24 = load volatile i16* @g_3, align 2
  %25 = zext i16 %24 to i32
  %26 = srem i32 %25, 5
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds [5 x i32]* %l_4, i32 0, i64 %27
  %29 = load i32* %28, align 4
  %30 = trunc i32 %29 to i16
  ret i16 %30
}

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  %i = alloca i32, align 4
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  %4 = call zeroext i16 @func_1()
  %5 = load volatile i16* @g_2, align 2
  %6 = zext i16 %5 to i32
  %7 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %6)
  %8 = load volatile i16* @g_3, align 2
  %9 = sext i16 %8 to i32
  %10 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str1, i32 0, i32 0), i32 %9)
  %11 = load volatile i32* getelementptr inbounds ([6 x i32]* @g_5, i32 0, i64 0), align 4
  %12 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str2, i32 0, i32 0), i32 %11)
  %13 = load volatile i32* getelementptr inbounds ([6 x i32]* @g_5, i32 0, i64 1), align 4
  %14 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str3, i32 0, i32 0), i32 %13)
  %15 = load volatile i32* getelementptr inbounds ([6 x i32]* @g_5, i32 0, i64 2), align 4
  %16 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str4, i32 0, i32 0), i32 %15)
  %17 = load volatile i32* getelementptr inbounds ([6 x i32]* @g_5, i32 0, i64 3), align 4
  %18 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str5, i32 0, i32 0), i32 %17)
  %19 = load volatile i32* getelementptr inbounds ([6 x i32]* @g_5, i32 0, i64 4), align 4
  %20 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str6, i32 0, i32 0), i32 %19)
  %21 = load volatile i32* getelementptr inbounds ([6 x i32]* @g_5, i32 0, i64 5), align 4
  %22 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str7, i32 0, i32 0), i32 %21)
  %23 = load volatile i32* getelementptr inbounds ([6 x i32]* @g_5, i32 0, i64 0), align 4
  %24 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str2, i32 0, i32 0), i32 %23)
  %25 = load i32* %1
  ret i32 %25
}

declare i32 @printf(i8*, ...)
