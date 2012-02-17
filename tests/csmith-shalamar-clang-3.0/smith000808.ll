; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith000808.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_4 = global [8 x i8] c"\EE\EE\EE\EE\EE\EE\EE\EE", align 1
@.str = private unnamed_addr constant [22 x i8] c"checksum g_4[0] = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [22 x i8] c"checksum g_4[1] = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [22 x i8] c"checksum g_4[2] = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [22 x i8] c"checksum g_4[3] = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [22 x i8] c"checksum g_4[4] = %d\0A\00", align 1
@.str5 = private unnamed_addr constant [22 x i8] c"checksum g_4[5] = %d\0A\00", align 1
@.str6 = private unnamed_addr constant [22 x i8] c"checksum g_4[6] = %d\0A\00", align 1
@.str7 = private unnamed_addr constant [22 x i8] c"checksum g_4[7] = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define zeroext i8 @func_1() nounwind uwtable {
  %l_2 = alloca i8, align 1
  %l_3 = alloca i32, align 4
  store i8 -126, i8* %l_2, align 1
  store i32 -2, i32* %l_3, align 4
  %1 = load i8* %l_2, align 1
  %2 = zext i8 %1 to i32
  %3 = load i8* %l_2, align 1
  %4 = zext i8 %3 to i32
  %5 = icmp eq i32 %2, %4
  %6 = zext i1 %5 to i32
  store i32 %6, i32* %l_3, align 4
  store i32 0, i32* %l_3, align 4
  br label %7

; <label>:7                                       ; preds = %14, %0
  %8 = load i32* %l_3, align 4
  %9 = icmp slt i32 %8, 8
  br i1 %9, label %10, label %17

; <label>:10                                      ; preds = %7
  %11 = load i32* %l_3, align 4
  %12 = sext i32 %11 to i64
  %13 = getelementptr inbounds [8 x i8]* @g_4, i32 0, i64 %12
  store i8 -69, i8* %13, align 1
  br label %14

; <label>:14                                      ; preds = %10
  %15 = load i32* %l_3, align 4
  %16 = add nsw i32 %15, 1
  store i32 %16, i32* %l_3, align 4
  br label %7

; <label>:17                                      ; preds = %7
  %18 = load i8* %l_2, align 1
  ret i8 %18
}

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  %i = alloca i32, align 4
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  %4 = call zeroext i8 @func_1()
  %5 = load i8* getelementptr inbounds ([8 x i8]* @g_4, i32 0, i64 0), align 1
  %6 = zext i8 %5 to i32
  %7 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str, i32 0, i32 0), i32 %6)
  %8 = load i8* getelementptr inbounds ([8 x i8]* @g_4, i32 0, i64 1), align 1
  %9 = zext i8 %8 to i32
  %10 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str1, i32 0, i32 0), i32 %9)
  %11 = load i8* getelementptr inbounds ([8 x i8]* @g_4, i32 0, i64 2), align 1
  %12 = zext i8 %11 to i32
  %13 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str2, i32 0, i32 0), i32 %12)
  %14 = load i8* getelementptr inbounds ([8 x i8]* @g_4, i32 0, i64 3), align 1
  %15 = zext i8 %14 to i32
  %16 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str3, i32 0, i32 0), i32 %15)
  %17 = load i8* getelementptr inbounds ([8 x i8]* @g_4, i32 0, i64 4), align 1
  %18 = zext i8 %17 to i32
  %19 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str4, i32 0, i32 0), i32 %18)
  %20 = load i8* getelementptr inbounds ([8 x i8]* @g_4, i32 0, i64 5), align 1
  %21 = zext i8 %20 to i32
  %22 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str5, i32 0, i32 0), i32 %21)
  %23 = load i8* getelementptr inbounds ([8 x i8]* @g_4, i32 0, i64 6), align 1
  %24 = zext i8 %23 to i32
  %25 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str6, i32 0, i32 0), i32 %24)
  %26 = load i8* getelementptr inbounds ([8 x i8]* @g_4, i32 0, i64 7), align 1
  %27 = zext i8 %26 to i32
  %28 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str7, i32 0, i32 0), i32 %27)
  %29 = load i32* %1
  ret i32 %29
}

declare i32 @printf(i8*, ...)
