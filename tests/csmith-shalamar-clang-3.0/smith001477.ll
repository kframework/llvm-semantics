; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith001477.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = constant [9 x i16] [i16 -72, i16 -72, i16 -72, i16 -72, i16 -72, i16 -72, i16 -72, i16 -72, i16 -72], align 16
@g_4 = global i32 1822608209, align 4
@.str = private unnamed_addr constant [22 x i8] c"checksum g_2[0] = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [22 x i8] c"checksum g_2[1] = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [22 x i8] c"checksum g_2[2] = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [22 x i8] c"checksum g_2[3] = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [22 x i8] c"checksum g_2[4] = %d\0A\00", align 1
@.str5 = private unnamed_addr constant [22 x i8] c"checksum g_2[5] = %d\0A\00", align 1
@.str6 = private unnamed_addr constant [22 x i8] c"checksum g_2[6] = %d\0A\00", align 1
@.str7 = private unnamed_addr constant [22 x i8] c"checksum g_2[7] = %d\0A\00", align 1
@.str8 = private unnamed_addr constant [22 x i8] c"checksum g_2[8] = %d\0A\00", align 1
@.str9 = private unnamed_addr constant [19 x i8] c"checksum g_4 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable {
  %l_3 = alloca [8 x i32*], align 16
  %i = alloca i32, align 4
  store i32 0, i32* %i, align 4
  br label %1

; <label>:1                                       ; preds = %8, %0
  %2 = load i32* %i, align 4
  %3 = icmp slt i32 %2, 8
  br i1 %3, label %4, label %11

; <label>:4                                       ; preds = %1
  %5 = load i32* %i, align 4
  %6 = sext i32 %5 to i64
  %7 = getelementptr inbounds [8 x i32*]* %l_3, i32 0, i64 %6
  store i32* @g_4, i32** %7, align 8
  br label %8

; <label>:8                                       ; preds = %4
  %9 = load i32* %i, align 4
  %10 = add nsw i32 %9, 1
  store i32 %10, i32* %i, align 4
  br label %1

; <label>:11                                      ; preds = %1
  %12 = load i16* getelementptr inbounds ([9 x i16]* @g_2, i32 0, i64 1), align 2
  %13 = zext i16 %12 to i32
  %14 = load i32* @g_4, align 4
  %15 = and i32 %14, %13
  store i32 %15, i32* @g_4, align 4
  %16 = load i32* @g_4, align 4
  ret i32 %16
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
  %5 = load i16* getelementptr inbounds ([9 x i16]* @g_2, i32 0, i64 0), align 2
  %6 = zext i16 %5 to i32
  %7 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str, i32 0, i32 0), i32 %6)
  %8 = load i16* getelementptr inbounds ([9 x i16]* @g_2, i32 0, i64 1), align 2
  %9 = zext i16 %8 to i32
  %10 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str1, i32 0, i32 0), i32 %9)
  %11 = load i16* getelementptr inbounds ([9 x i16]* @g_2, i32 0, i64 2), align 2
  %12 = zext i16 %11 to i32
  %13 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str2, i32 0, i32 0), i32 %12)
  %14 = load i16* getelementptr inbounds ([9 x i16]* @g_2, i32 0, i64 3), align 2
  %15 = zext i16 %14 to i32
  %16 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str3, i32 0, i32 0), i32 %15)
  %17 = load i16* getelementptr inbounds ([9 x i16]* @g_2, i32 0, i64 4), align 2
  %18 = zext i16 %17 to i32
  %19 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str4, i32 0, i32 0), i32 %18)
  %20 = load i16* getelementptr inbounds ([9 x i16]* @g_2, i32 0, i64 5), align 2
  %21 = zext i16 %20 to i32
  %22 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str5, i32 0, i32 0), i32 %21)
  %23 = load i16* getelementptr inbounds ([9 x i16]* @g_2, i32 0, i64 6), align 2
  %24 = zext i16 %23 to i32
  %25 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str6, i32 0, i32 0), i32 %24)
  %26 = load i16* getelementptr inbounds ([9 x i16]* @g_2, i32 0, i64 7), align 2
  %27 = zext i16 %26 to i32
  %28 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str7, i32 0, i32 0), i32 %27)
  %29 = load i16* getelementptr inbounds ([9 x i16]* @g_2, i32 0, i64 8), align 2
  %30 = zext i16 %29 to i32
  %31 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str8, i32 0, i32 0), i32 %30)
  %32 = load i16* getelementptr inbounds ([9 x i16]* @g_2, i32 0, i64 1), align 2
  %33 = zext i16 %32 to i32
  %34 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str1, i32 0, i32 0), i32 %33)
  %35 = load i32* @g_4, align 4
  %36 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str9, i32 0, i32 0), i32 %35)
  %37 = load i32* %1
  ret i32 %37
}

declare i32 @printf(i8*, ...)
