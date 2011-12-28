; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith001645.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_3 = global [6 x i32] [i32 -7, i32 -7, i32 -7, i32 -7, i32 -7, i32 -7], align 16
@g_5 = global i32 535264726, align 4
@.str = private unnamed_addr constant [22 x i8] c"checksum g_3[0] = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [22 x i8] c"checksum g_3[1] = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [22 x i8] c"checksum g_3[2] = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [22 x i8] c"checksum g_3[3] = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [22 x i8] c"checksum g_3[4] = %d\0A\00", align 1
@.str5 = private unnamed_addr constant [22 x i8] c"checksum g_3[5] = %d\0A\00", align 1
@.str6 = private unnamed_addr constant [19 x i8] c"checksum g_5 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define zeroext i16 @func_1() nounwind uwtable {
  %1 = alloca i16, align 2
  %l_2 = alloca [10 x i16], align 16
  %i = alloca i32, align 4
  %l_4 = alloca i32*, align 8
  store i32 0, i32* %i, align 4
  br label %2

; <label>:2                                       ; preds = %9, %0
  %3 = load i32* %i, align 4
  %4 = icmp slt i32 %3, 10
  br i1 %4, label %5, label %12

; <label>:5                                       ; preds = %2
  %6 = load i32* %i, align 4
  %7 = sext i32 %6 to i64
  %8 = getelementptr inbounds [10 x i16]* %l_2, i32 0, i64 %7
  store i16 16074, i16* %8, align 2
  br label %9

; <label>:9                                       ; preds = %5
  %10 = load i32* %i, align 4
  %11 = add nsw i32 %10, 1
  store i32 %11, i32* %i, align 4
  br label %2

; <label>:12                                      ; preds = %2
  store volatile i32 9, i32* getelementptr inbounds ([6 x i32]* @g_3, i32 0, i64 0), align 4
  br label %13

; <label>:13                                      ; preds = %24, %12
  %14 = load volatile i32* getelementptr inbounds ([6 x i32]* @g_3, i32 0, i64 0), align 4
  %15 = icmp sge i32 %14, 0
  br i1 %15, label %16, label %27

; <label>:16                                      ; preds = %13
  store i32* @g_5, i32** %l_4, align 8
  %17 = load volatile i32* getelementptr inbounds ([6 x i32]* @g_3, i32 0, i64 4), align 4
  %18 = load i32** %l_4, align 8
  %19 = load i32* %18
  %20 = xor i32 %19, %17
  store i32 %20, i32* %18
  %21 = load i32** %l_4, align 8
  %22 = load i32* %21
  %23 = trunc i32 %22 to i16
  store i16 %23, i16* %1
  br label %30
                                                  ; No predecessors!
  %25 = load volatile i32* getelementptr inbounds ([6 x i32]* @g_3, i32 0, i64 0), align 4
  %26 = add nsw i32 %25, -4
  store volatile i32 %26, i32* getelementptr inbounds ([6 x i32]* @g_3, i32 0, i64 0), align 4
  br label %13

; <label>:27                                      ; preds = %13
  %28 = load volatile i32* getelementptr inbounds ([6 x i32]* @g_3, i32 0, i64 4), align 4
  %29 = trunc i32 %28 to i16
  store i16 %29, i16* %1
  br label %30

; <label>:30                                      ; preds = %27, %16
  %31 = load i16* %1
  ret i16 %31
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
  %5 = load volatile i32* getelementptr inbounds ([6 x i32]* @g_3, i32 0, i64 0), align 4
  %6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str, i32 0, i32 0), i32 %5)
  %7 = load volatile i32* getelementptr inbounds ([6 x i32]* @g_3, i32 0, i64 1), align 4
  %8 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str1, i32 0, i32 0), i32 %7)
  %9 = load volatile i32* getelementptr inbounds ([6 x i32]* @g_3, i32 0, i64 2), align 4
  %10 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str2, i32 0, i32 0), i32 %9)
  %11 = load volatile i32* getelementptr inbounds ([6 x i32]* @g_3, i32 0, i64 3), align 4
  %12 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str3, i32 0, i32 0), i32 %11)
  %13 = load volatile i32* getelementptr inbounds ([6 x i32]* @g_3, i32 0, i64 4), align 4
  %14 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str4, i32 0, i32 0), i32 %13)
  %15 = load volatile i32* getelementptr inbounds ([6 x i32]* @g_3, i32 0, i64 5), align 4
  %16 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str5, i32 0, i32 0), i32 %15)
  %17 = load volatile i32* getelementptr inbounds ([6 x i32]* @g_3, i32 0, i64 0), align 4
  %18 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str, i32 0, i32 0), i32 %17)
  %19 = load i32* @g_5, align 4
  %20 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str6, i32 0, i32 0), i32 %19)
  %21 = load i32* %1
  ret i32 %21
}

declare i32 @printf(i8*, ...)
