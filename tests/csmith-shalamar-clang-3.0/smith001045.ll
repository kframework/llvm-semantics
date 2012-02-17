; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith001045.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_4 = global [8 x i32] [i32 -7, i32 -7, i32 -7, i32 -7, i32 -7, i32 -7, i32 -7, i32 -7], align 16
@.str = private unnamed_addr constant [22 x i8] c"checksum g_4[0] = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [22 x i8] c"checksum g_4[1] = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [22 x i8] c"checksum g_4[2] = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [22 x i8] c"checksum g_4[3] = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [22 x i8] c"checksum g_4[4] = %d\0A\00", align 1
@.str5 = private unnamed_addr constant [22 x i8] c"checksum g_4[5] = %d\0A\00", align 1
@.str6 = private unnamed_addr constant [22 x i8] c"checksum g_4[6] = %d\0A\00", align 1
@.str7 = private unnamed_addr constant [22 x i8] c"checksum g_4[7] = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define zeroext i16 @func_1() nounwind uwtable {
  %l_2 = alloca i32, align 4
  %l_3 = alloca i32*, align 8
  store i32 0, i32* %l_2, align 4
  store i32* getelementptr inbounds ([8 x i32]* @g_4, i32 0, i64 3), i32** %l_3, align 8
  %1 = load i32* %l_2, align 4
  %2 = load i32** %l_3, align 8
  %3 = load i32* %2
  %4 = and i32 %3, %1
  store i32 %4, i32* %2
  %5 = load i32* getelementptr inbounds ([8 x i32]* @g_4, i32 0, i64 4), align 4
  %6 = trunc i32 %5 to i16
  %7 = load i32* getelementptr inbounds ([8 x i32]* @g_4, i32 0, i64 3), align 4
  %8 = sext i32 %7 to i64
  %9 = icmp ne i64 1, %8
  %10 = zext i1 %9 to i32
  %11 = call signext i16 @safe_lshift_func_int16_t_s_s(i16 signext %6, i32 %10)
  %12 = trunc i16 %11 to i8
  %13 = call signext i8 @safe_lshift_func_int8_t_s_u(i8 signext %12, i32 0)
  %14 = sext i8 %13 to i32
  %15 = load i32** %l_3, align 8
  store i32 %14, i32* %15
  %16 = load i32** %l_3, align 8
  %17 = load i32* %16
  %18 = trunc i32 %17 to i16
  ret i16 %18
}

define internal signext i8 @safe_lshift_func_int8_t_s_u(i8 signext %left, i32 %right) nounwind uwtable {
  %1 = alloca i8, align 1
  %2 = alloca i32, align 4
  store i8 %left, i8* %1, align 1
  store i32 %right, i32* %2, align 4
  %3 = load i8* %1, align 1
  %4 = sext i8 %3 to i32
  %5 = icmp slt i32 %4, 0
  br i1 %5, label %15, label %6

; <label>:6                                       ; preds = %0
  %7 = load i32* %2, align 4
  %8 = icmp uge i32 %7, 32
  br i1 %8, label %15, label %9

; <label>:9                                       ; preds = %6
  %10 = load i8* %1, align 1
  %11 = sext i8 %10 to i32
  %12 = load i32* %2, align 4
  %13 = ashr i32 127, %12
  %14 = icmp sgt i32 %11, %13
  br i1 %14, label %15, label %18

; <label>:15                                      ; preds = %9, %6, %0
  %16 = load i8* %1, align 1
  %17 = sext i8 %16 to i32
  br label %23

; <label>:18                                      ; preds = %9
  %19 = load i8* %1, align 1
  %20 = sext i8 %19 to i32
  %21 = load i32* %2, align 4
  %22 = shl i32 %20, %21
  br label %23

; <label>:23                                      ; preds = %18, %15
  %24 = phi i32 [ %17, %15 ], [ %22, %18 ]
  %25 = trunc i32 %24 to i8
  ret i8 %25
}

define internal signext i16 @safe_lshift_func_int16_t_s_s(i16 signext %left, i32 %right) nounwind uwtable {
  %1 = alloca i16, align 2
  %2 = alloca i32, align 4
  store i16 %left, i16* %1, align 2
  store i32 %right, i32* %2, align 4
  %3 = load i16* %1, align 2
  %4 = sext i16 %3 to i32
  %5 = icmp slt i32 %4, 0
  br i1 %5, label %18, label %6

; <label>:6                                       ; preds = %0
  %7 = load i32* %2, align 4
  %8 = icmp slt i32 %7, 0
  br i1 %8, label %18, label %9

; <label>:9                                       ; preds = %6
  %10 = load i32* %2, align 4
  %11 = icmp sge i32 %10, 32
  br i1 %11, label %18, label %12

; <label>:12                                      ; preds = %9
  %13 = load i16* %1, align 2
  %14 = sext i16 %13 to i32
  %15 = load i32* %2, align 4
  %16 = ashr i32 32767, %15
  %17 = icmp sgt i32 %14, %16
  br i1 %17, label %18, label %21

; <label>:18                                      ; preds = %12, %9, %6, %0
  %19 = load i16* %1, align 2
  %20 = sext i16 %19 to i32
  br label %26

; <label>:21                                      ; preds = %12
  %22 = load i16* %1, align 2
  %23 = sext i16 %22 to i32
  %24 = load i32* %2, align 4
  %25 = shl i32 %23, %24
  br label %26

; <label>:26                                      ; preds = %21, %18
  %27 = phi i32 [ %20, %18 ], [ %25, %21 ]
  %28 = trunc i32 %27 to i16
  ret i16 %28
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
  %5 = load i32* getelementptr inbounds ([8 x i32]* @g_4, i32 0, i64 0), align 4
  %6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str, i32 0, i32 0), i32 %5)
  %7 = load i32* getelementptr inbounds ([8 x i32]* @g_4, i32 0, i64 1), align 4
  %8 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str1, i32 0, i32 0), i32 %7)
  %9 = load i32* getelementptr inbounds ([8 x i32]* @g_4, i32 0, i64 2), align 4
  %10 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str2, i32 0, i32 0), i32 %9)
  %11 = load i32* getelementptr inbounds ([8 x i32]* @g_4, i32 0, i64 3), align 4
  %12 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str3, i32 0, i32 0), i32 %11)
  %13 = load i32* getelementptr inbounds ([8 x i32]* @g_4, i32 0, i64 4), align 4
  %14 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str4, i32 0, i32 0), i32 %13)
  %15 = load i32* getelementptr inbounds ([8 x i32]* @g_4, i32 0, i64 5), align 4
  %16 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str5, i32 0, i32 0), i32 %15)
  %17 = load i32* getelementptr inbounds ([8 x i32]* @g_4, i32 0, i64 6), align 4
  %18 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str6, i32 0, i32 0), i32 %17)
  %19 = load i32* getelementptr inbounds ([8 x i32]* @g_4, i32 0, i64 7), align 4
  %20 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str7, i32 0, i32 0), i32 %19)
  %21 = load i32* getelementptr inbounds ([8 x i32]* @g_4, i32 0, i64 3), align 4
  %22 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str3, i32 0, i32 0), i32 %21)
  %23 = load i32* %1
  ret i32 %23
}

declare i32 @printf(i8*, ...)
