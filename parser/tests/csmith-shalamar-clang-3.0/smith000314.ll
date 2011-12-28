; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith000314.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_3 = global [8 x i8] c"\02\02\02\02\02\02\02\02", align 1
@.str = private unnamed_addr constant [22 x i8] c"checksum g_3[0] = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [22 x i8] c"checksum g_3[1] = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [22 x i8] c"checksum g_3[2] = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [22 x i8] c"checksum g_3[3] = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [22 x i8] c"checksum g_3[4] = %d\0A\00", align 1
@.str5 = private unnamed_addr constant [22 x i8] c"checksum g_3[5] = %d\0A\00", align 1
@.str6 = private unnamed_addr constant [22 x i8] c"checksum g_3[6] = %d\0A\00", align 1
@.str7 = private unnamed_addr constant [22 x i8] c"checksum g_3[7] = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable {
  %1 = alloca i32, align 4
  %l_2 = alloca i16, align 2
  %i = alloca i32, align 4
  store i16 -18637, i16* %l_2, align 2
  %2 = load i16* %l_2, align 2
  %3 = icmp ne i16 %2, 0
  br i1 %3, label %4, label %20

; <label>:4                                       ; preds = %0
  store i16 6, i16* %l_2, align 2
  br label %5

; <label>:5                                       ; preds = %12, %4
  %6 = load i16* %l_2, align 2
  %7 = zext i16 %6 to i32
  %8 = icmp sge i32 %7, 0
  br i1 %8, label %9, label %17

; <label>:9                                       ; preds = %5
  %10 = load i8* getelementptr inbounds ([8 x i8]* @g_3, i32 0, i64 5), align 1
  %11 = sext i8 %10 to i32
  store i32 %11, i32* %1
  br label %23
                                                  ; No predecessors!
  %13 = load i16* %l_2, align 2
  %14 = zext i16 %13 to i32
  %15 = add nsw i32 %14, -7
  %16 = trunc i32 %15 to i16
  store i16 %16, i16* %l_2, align 2
  br label %5

; <label>:17                                      ; preds = %5
  %18 = load i16* %l_2, align 2
  %19 = zext i16 %18 to i32
  store i32 %19, i32* %1
  br label %23

; <label>:20                                      ; preds = %0
  %21 = load i16* %l_2, align 2
  %22 = zext i16 %21 to i32
  store i32 %22, i32* %1
  br label %23

; <label>:23                                      ; preds = %20, %17, %9
  %24 = load i32* %1
  ret i32 %24
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
  %5 = load i8* getelementptr inbounds ([8 x i8]* @g_3, i32 0, i64 0), align 1
  %6 = sext i8 %5 to i32
  %7 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str, i32 0, i32 0), i32 %6)
  %8 = load i8* getelementptr inbounds ([8 x i8]* @g_3, i32 0, i64 1), align 1
  %9 = sext i8 %8 to i32
  %10 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str1, i32 0, i32 0), i32 %9)
  %11 = load i8* getelementptr inbounds ([8 x i8]* @g_3, i32 0, i64 2), align 1
  %12 = sext i8 %11 to i32
  %13 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str2, i32 0, i32 0), i32 %12)
  %14 = load i8* getelementptr inbounds ([8 x i8]* @g_3, i32 0, i64 3), align 1
  %15 = sext i8 %14 to i32
  %16 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str3, i32 0, i32 0), i32 %15)
  %17 = load i8* getelementptr inbounds ([8 x i8]* @g_3, i32 0, i64 4), align 1
  %18 = sext i8 %17 to i32
  %19 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str4, i32 0, i32 0), i32 %18)
  %20 = load i8* getelementptr inbounds ([8 x i8]* @g_3, i32 0, i64 5), align 1
  %21 = sext i8 %20 to i32
  %22 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str5, i32 0, i32 0), i32 %21)
  %23 = load i8* getelementptr inbounds ([8 x i8]* @g_3, i32 0, i64 6), align 1
  %24 = sext i8 %23 to i32
  %25 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str6, i32 0, i32 0), i32 %24)
  %26 = load i8* getelementptr inbounds ([8 x i8]* @g_3, i32 0, i64 7), align 1
  %27 = sext i8 %26 to i32
  %28 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str7, i32 0, i32 0), i32 %27)
  %29 = load i32* %1
  ret i32 %29
}

declare i32 @printf(i8*, ...)
