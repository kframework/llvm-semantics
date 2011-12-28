; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith000915.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = global [7 x i16] [i16 17513, i16 17513, i16 17513, i16 17513, i16 17513, i16 17513, i16 17513], align 2
@g_4 = global i32 -1114352581, align 4
@g_3 = global i32* @g_4, align 8
@g_12 = global i32 978188025, align 4
@.str = private unnamed_addr constant [22 x i8] c"checksum g_2[0] = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [22 x i8] c"checksum g_2[1] = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [22 x i8] c"checksum g_2[2] = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [22 x i8] c"checksum g_2[3] = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [22 x i8] c"checksum g_2[4] = %d\0A\00", align 1
@.str5 = private unnamed_addr constant [22 x i8] c"checksum g_2[5] = %d\0A\00", align 1
@.str6 = private unnamed_addr constant [22 x i8] c"checksum g_2[6] = %d\0A\00", align 1
@.str7 = private unnamed_addr constant [19 x i8] c"checksum g_4 = %d\0A\00", align 1
@.str8 = private unnamed_addr constant [20 x i8] c"checksum g_12 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i64 @func_1() nounwind uwtable {
  %l_13 = alloca i32, align 4
  %l_27 = alloca i32*, align 8
  store i32 0, i32* %l_13, align 4
  store volatile i32* @g_4, i32** %l_27, align 8
  %1 = load volatile i16* getelementptr inbounds ([7 x i16]* @g_2, i32 0, i64 1), align 2
  %2 = zext i16 %1 to i32
  %3 = load volatile i32** @g_3, align 8
  store volatile i32 %2, i32* %3
  %4 = load volatile i32** @g_3, align 8
  store volatile i32* %4, i32** %l_27, align 8
  store volatile i32* @g_4, i32** %l_27, align 8
  %5 = load volatile i16* getelementptr inbounds ([7 x i16]* @g_2, i32 0, i64 1), align 2
  %6 = zext i16 %5 to i64
  ret i64 %6
}

define i32* @func_5(i64 %p_6, i32* %p_7) nounwind uwtable {
  %1 = alloca i64, align 8
  %2 = alloca i32*, align 8
  %l_10 = alloca i8, align 1
  %l_11 = alloca i32*, align 8
  store i64 %p_6, i64* %1, align 8
  store i32* %p_7, i32** %2, align 8
  store i8 3, i8* %l_10, align 1
  store i32* @g_12, i32** %l_11, align 8
  %3 = load i32** %2, align 8
  %4 = load i32* %3
  %5 = load i32** %2, align 8
  %6 = load i32* %5
  %7 = trunc i32 %6 to i16
  %8 = load i32** %2, align 8
  %9 = load i32* %8
  %10 = call zeroext i16 @safe_rshift_func_uint16_t_u_s(i16 zeroext %7, i32 %9)
  %11 = zext i16 %10 to i32
  %12 = load i8* %l_10, align 1
  %13 = zext i8 %12 to i32
  %14 = icmp slt i32 %11, %13
  %15 = zext i1 %14 to i32
  %16 = load i32** %2, align 8
  %17 = load i32* %16
  %18 = icmp ne i32 %15, %17
  %19 = zext i1 %18 to i32
  %20 = icmp sge i32 %4, %19
  %21 = zext i1 %20 to i32
  %22 = load volatile i32** @g_3, align 8
  store volatile i32 %21, i32* %22
  %23 = load i32** %2, align 8
  %24 = load i32* %23
  %25 = load i32** %2, align 8
  %26 = load i32* %25
  %27 = xor i32 %26, %24
  store i32 %27, i32* %25
  %28 = load i32** %l_11, align 8
  ret i32* %28
}

define internal zeroext i16 @safe_rshift_func_uint16_t_u_s(i16 zeroext %left, i32 %right) nounwind uwtable {
  %1 = alloca i16, align 2
  %2 = alloca i32, align 4
  store i16 %left, i16* %1, align 2
  store i32 %right, i32* %2, align 4
  %3 = load i32* %2, align 4
  %4 = icmp slt i32 %3, 0
  br i1 %4, label %8, label %5

; <label>:5                                       ; preds = %0
  %6 = load i32* %2, align 4
  %7 = icmp sge i32 %6, 32
  br i1 %7, label %8, label %11

; <label>:8                                       ; preds = %5, %0
  %9 = load i16* %1, align 2
  %10 = zext i16 %9 to i32
  br label %16

; <label>:11                                      ; preds = %5
  %12 = load i16* %1, align 2
  %13 = zext i16 %12 to i32
  %14 = load i32* %2, align 4
  %15 = ashr i32 %13, %14
  br label %16

; <label>:16                                      ; preds = %11, %8
  %17 = phi i32 [ %10, %8 ], [ %15, %11 ]
  %18 = trunc i32 %17 to i16
  ret i16 %18
}

define i32* @func_14(i64 %p_15, i32* %p_16, i32* %p_17, i8 zeroext %p_18, i32* %p_19) nounwind uwtable {
  %1 = alloca i64, align 8
  %2 = alloca i32*, align 8
  %3 = alloca i32*, align 8
  %4 = alloca i8, align 1
  %5 = alloca i32*, align 8
  store i64 %p_15, i64* %1, align 8
  store i32* %p_16, i32** %2, align 8
  store i32* %p_17, i32** %3, align 8
  store i8 %p_18, i8* %4, align 1
  store i32* %p_19, i32** %5, align 8
  %6 = load i32** %5, align 8
  ret i32* %6
}

define i32* @func_20(i32 %p_21, i32* %p_22, i32 %p_23, i32* %p_24, i32* %p_25) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32*, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32*, align 8
  %5 = alloca i32*, align 8
  %l_26 = alloca [3 x [9 x i32]], align 16
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 %p_21, i32* %1, align 4
  store i32* %p_22, i32** %2, align 8
  store i32 %p_23, i32* %3, align 4
  store i32* %p_24, i32** %4, align 8
  store i32* %p_25, i32** %5, align 8
  store i32 0, i32* %i, align 4
  br label %6

; <label>:6                                       ; preds = %24, %0
  %7 = load i32* %i, align 4
  %8 = icmp slt i32 %7, 3
  br i1 %8, label %9, label %27

; <label>:9                                       ; preds = %6
  store i32 0, i32* %j, align 4
  br label %10

; <label>:10                                      ; preds = %20, %9
  %11 = load i32* %j, align 4
  %12 = icmp slt i32 %11, 9
  br i1 %12, label %13, label %23

; <label>:13                                      ; preds = %10
  %14 = load i32* %j, align 4
  %15 = sext i32 %14 to i64
  %16 = load i32* %i, align 4
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds [3 x [9 x i32]]* %l_26, i32 0, i64 %17
  %19 = getelementptr inbounds [9 x i32]* %18, i32 0, i64 %15
  store i32 -655199934, i32* %19, align 4
  br label %20

; <label>:20                                      ; preds = %13
  %21 = load i32* %j, align 4
  %22 = add nsw i32 %21, 1
  store i32 %22, i32* %j, align 4
  br label %10

; <label>:23                                      ; preds = %10
  br label %24

; <label>:24                                      ; preds = %23
  %25 = load i32* %i, align 4
  %26 = add nsw i32 %25, 1
  store i32 %26, i32* %i, align 4
  br label %6

; <label>:27                                      ; preds = %6
  store i32 0, i32* %1, align 4
  br label %28

; <label>:28                                      ; preds = %46, %27
  %29 = load i32* %1, align 4
  %30 = icmp ult i32 %29, 3
  br i1 %30, label %31, label %49

; <label>:31                                      ; preds = %28
  store i32 0, i32* %3, align 4
  br label %32

; <label>:32                                      ; preds = %42, %31
  %33 = load i32* %3, align 4
  %34 = icmp slt i32 %33, 9
  br i1 %34, label %35, label %45

; <label>:35                                      ; preds = %32
  %36 = load i32* %3, align 4
  %37 = sext i32 %36 to i64
  %38 = load i32* %1, align 4
  %39 = zext i32 %38 to i64
  %40 = getelementptr inbounds [3 x [9 x i32]]* %l_26, i32 0, i64 %39
  %41 = getelementptr inbounds [9 x i32]* %40, i32 0, i64 %37
  store i32 1, i32* %41, align 4
  br label %42

; <label>:42                                      ; preds = %35
  %43 = load i32* %3, align 4
  %44 = add nsw i32 %43, 1
  store i32 %44, i32* %3, align 4
  br label %32

; <label>:45                                      ; preds = %32
  br label %46

; <label>:46                                      ; preds = %45
  %47 = load i32* %1, align 4
  %48 = add i32 %47, 1
  store i32 %48, i32* %1, align 4
  br label %28

; <label>:49                                      ; preds = %28
  ret i32* @g_12
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
  %5 = load volatile i16* getelementptr inbounds ([7 x i16]* @g_2, i32 0, i64 0), align 2
  %6 = zext i16 %5 to i32
  %7 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str, i32 0, i32 0), i32 %6)
  %8 = load volatile i16* getelementptr inbounds ([7 x i16]* @g_2, i32 0, i64 1), align 2
  %9 = zext i16 %8 to i32
  %10 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str1, i32 0, i32 0), i32 %9)
  %11 = load volatile i16* getelementptr inbounds ([7 x i16]* @g_2, i32 0, i64 2), align 2
  %12 = zext i16 %11 to i32
  %13 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str2, i32 0, i32 0), i32 %12)
  %14 = load volatile i16* getelementptr inbounds ([7 x i16]* @g_2, i32 0, i64 3), align 2
  %15 = zext i16 %14 to i32
  %16 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str3, i32 0, i32 0), i32 %15)
  %17 = load volatile i16* getelementptr inbounds ([7 x i16]* @g_2, i32 0, i64 4), align 2
  %18 = zext i16 %17 to i32
  %19 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str4, i32 0, i32 0), i32 %18)
  %20 = load volatile i16* getelementptr inbounds ([7 x i16]* @g_2, i32 0, i64 5), align 2
  %21 = zext i16 %20 to i32
  %22 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str5, i32 0, i32 0), i32 %21)
  %23 = load volatile i16* getelementptr inbounds ([7 x i16]* @g_2, i32 0, i64 6), align 2
  %24 = zext i16 %23 to i32
  %25 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str6, i32 0, i32 0), i32 %24)
  %26 = load volatile i16* getelementptr inbounds ([7 x i16]* @g_2, i32 0, i64 1), align 2
  %27 = zext i16 %26 to i32
  %28 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str1, i32 0, i32 0), i32 %27)
  %29 = load volatile i32* @g_4, align 4
  %30 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str7, i32 0, i32 0), i32 %29)
  %31 = load i32* @g_12, align 4
  %32 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str8, i32 0, i32 0), i32 %31)
  %33 = load i32* %1
  ret i32 %33
}

declare i32 @printf(i8*, ...)
