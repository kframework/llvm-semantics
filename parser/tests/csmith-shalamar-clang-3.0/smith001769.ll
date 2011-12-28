; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith001769.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = global i32 1825462207, align 4
@g_6 = constant [8 x [3 x [1 x [1 x i32*]]]] [[3 x [1 x [1 x i32*]]] [[1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]], [1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]], [1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]]], [3 x [1 x [1 x i32*]]] [[1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]], [1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]], [1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]]], [3 x [1 x [1 x i32*]]] [[1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]], [1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]], [1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]]], [3 x [1 x [1 x i32*]]] [[1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]], [1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]], [1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]]], [3 x [1 x [1 x i32*]]] [[1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]], [1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]], [1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]]], [3 x [1 x [1 x i32*]]] [[1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]], [1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]], [1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]]], [3 x [1 x [1 x i32*]]] [[1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]], [1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]], [1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]]], [3 x [1 x [1 x i32*]]] [[1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]], [1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]], [1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]]]], align 16
@g_10 = global i32 0, align 4
@g_9 = global i32* @g_10, align 8
@g_19 = global [4 x i16] zeroinitializer, align 2
@g_32 = global i32 1904985752, align 4
@g_57 = global i32 -1, align 4
@.str = private unnamed_addr constant [19 x i8] c"checksum g_2 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [20 x i8] c"checksum g_10 = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [23 x i8] c"checksum g_19[0] = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [23 x i8] c"checksum g_19[1] = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [23 x i8] c"checksum g_19[2] = %d\0A\00", align 1
@.str5 = private unnamed_addr constant [23 x i8] c"checksum g_19[3] = %d\0A\00", align 1
@.str6 = private unnamed_addr constant [20 x i8] c"checksum g_32 = %d\0A\00", align 1
@.str7 = private unnamed_addr constant [20 x i8] c"checksum g_57 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i64 @func_1() nounwind uwtable {
  %l_8 = alloca i32, align 4
  %l_56 = alloca [2 x i32*], align 16
  %l_55 = alloca i32**, align 8
  %i = alloca i32, align 4
  %l_5 = alloca i32*, align 8
  %l_7 = alloca i32*, align 8
  store i32 1720983497, i32* %l_8, align 4
  %1 = getelementptr inbounds [2 x i32*]* %l_56, i32 0, i64 1
  store i32** %1, i32*** %l_55, align 8
  store i32 0, i32* %i, align 4
  br label %2

; <label>:2                                       ; preds = %9, %0
  %3 = load i32* %i, align 4
  %4 = icmp slt i32 %3, 2
  br i1 %4, label %5, label %12

; <label>:5                                       ; preds = %2
  %6 = load i32* %i, align 4
  %7 = sext i32 %6 to i64
  %8 = getelementptr inbounds [2 x i32*]* %l_56, i32 0, i64 %7
  store i32* null, i32** %8, align 8
  br label %9

; <label>:9                                       ; preds = %5
  %10 = load i32* %i, align 4
  %11 = add nsw i32 %10, 1
  store i32 %11, i32* %i, align 4
  br label %2

; <label>:12                                      ; preds = %2
  store volatile i32 23, i32* @g_2, align 4
  br label %13

; <label>:13                                      ; preds = %19, %12
  %14 = load volatile i32* @g_2, align 4
  %15 = icmp sle i32 %14, 0
  br i1 %15, label %16, label %24

; <label>:16                                      ; preds = %13
  store i32* null, i32** %l_5, align 8
  store i32* @g_2, i32** %l_7, align 8
  %17 = load volatile i32* @g_2, align 4
  %18 = load i32** %l_7, align 8
  store volatile i32 %17, i32* %18
  br label %19

; <label>:19                                      ; preds = %16
  %20 = load volatile i32* @g_2, align 4
  %21 = trunc i32 %20 to i8
  %22 = call zeroext i8 @safe_sub_func_uint8_t_u_u(i8 zeroext %21, i8 zeroext 8)
  %23 = zext i8 %22 to i32
  store volatile i32 %23, i32* @g_2, align 4
  br label %13

; <label>:24                                      ; preds = %13
  %25 = load i32* %l_8, align 4
  %26 = load volatile i32** @g_9, align 8
  %27 = load i32* %26
  %28 = or i32 %27, %25
  store i32 %28, i32* %26
  %29 = getelementptr inbounds [2 x i32*]* %l_56, i32 0, i64 1
  %30 = load i32** %29, align 8
  %31 = load i32*** %l_55, align 8
  store i32* %30, i32** %31
  %32 = load i32* @g_32, align 4
  %33 = sext i32 %32 to i64
  ret i64 %33
}

define internal zeroext i8 @safe_sub_func_uint8_t_u_u(i8 zeroext %ui1, i8 zeroext %ui2) nounwind uwtable {
  %1 = alloca i8, align 1
  %2 = alloca i8, align 1
  store i8 %ui1, i8* %1, align 1
  store i8 %ui2, i8* %2, align 1
  %3 = load i8* %1, align 1
  %4 = zext i8 %3 to i32
  %5 = load i8* %2, align 1
  %6 = zext i8 %5 to i32
  %7 = sub nsw i32 %4, %6
  %8 = trunc i32 %7 to i8
  ret i8 %8
}

define i32* @func_11(i32 %p_12, i64 %p_13, i16 zeroext %p_14, i32* %p_15) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i64, align 8
  %3 = alloca i16, align 2
  %4 = alloca i32*, align 8
  %l_53 = alloca [10 x [10 x [1 x [1 x i32]]]], align 16
  %l_54 = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %l = alloca i32, align 4
  store i32 %p_12, i32* %1, align 4
  store i64 %p_13, i64* %2, align 8
  store i16 %p_14, i16* %3, align 2
  store i32* %p_15, i32** %4, align 8
  store i32 0, i32* %l_54, align 4
  store i32 0, i32* %i, align 4
  br label %5

; <label>:5                                       ; preds = %45, %0
  %6 = load i32* %i, align 4
  %7 = icmp slt i32 %6, 10
  br i1 %7, label %8, label %48

; <label>:8                                       ; preds = %5
  store i32 0, i32* %j, align 4
  br label %9

; <label>:9                                       ; preds = %41, %8
  %10 = load i32* %j, align 4
  %11 = icmp slt i32 %10, 10
  br i1 %11, label %12, label %44

; <label>:12                                      ; preds = %9
  store i32 0, i32* %k, align 4
  br label %13

; <label>:13                                      ; preds = %37, %12
  %14 = load i32* %k, align 4
  %15 = icmp slt i32 %14, 1
  br i1 %15, label %16, label %40

; <label>:16                                      ; preds = %13
  store i32 0, i32* %l, align 4
  br label %17

; <label>:17                                      ; preds = %33, %16
  %18 = load i32* %l, align 4
  %19 = icmp slt i32 %18, 1
  br i1 %19, label %20, label %36

; <label>:20                                      ; preds = %17
  %21 = load i32* %l, align 4
  %22 = sext i32 %21 to i64
  %23 = load i32* %k, align 4
  %24 = sext i32 %23 to i64
  %25 = load i32* %j, align 4
  %26 = sext i32 %25 to i64
  %27 = load i32* %i, align 4
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds [10 x [10 x [1 x [1 x i32]]]]* %l_53, i32 0, i64 %28
  %30 = getelementptr inbounds [10 x [1 x [1 x i32]]]* %29, i32 0, i64 %26
  %31 = getelementptr inbounds [1 x [1 x i32]]* %30, i32 0, i64 %24
  %32 = getelementptr inbounds [1 x i32]* %31, i32 0, i64 %22
  store i32 -6, i32* %32, align 4
  br label %33

; <label>:33                                      ; preds = %20
  %34 = load i32* %l, align 4
  %35 = add nsw i32 %34, 1
  store i32 %35, i32* %l, align 4
  br label %17

; <label>:36                                      ; preds = %17
  br label %37

; <label>:37                                      ; preds = %36
  %38 = load i32* %k, align 4
  %39 = add nsw i32 %38, 1
  store i32 %39, i32* %k, align 4
  br label %13

; <label>:40                                      ; preds = %13
  br label %41

; <label>:41                                      ; preds = %40
  %42 = load i32* %j, align 4
  %43 = add nsw i32 %42, 1
  store i32 %43, i32* %j, align 4
  br label %9

; <label>:44                                      ; preds = %9
  br label %45

; <label>:45                                      ; preds = %44
  %46 = load i32* %i, align 4
  %47 = add nsw i32 %46, 1
  store i32 %47, i32* %i, align 4
  br label %5

; <label>:48                                      ; preds = %5
  %49 = load i32** %4, align 8
  %50 = load i32* %49
  %51 = load i32* %1, align 4
  %52 = call i32 @func_16(i32 %51, i32* @g_10)
  %53 = icmp sgt i32 %50, %52
  %54 = zext i1 %53 to i32
  %55 = load i32** %4, align 8
  %56 = load i32* %55
  %57 = xor i32 %56, %54
  store i32 %57, i32* %55
  %58 = getelementptr inbounds [10 x [10 x [1 x [1 x i32]]]]* %l_53, i32 0, i64 3
  %59 = getelementptr inbounds [10 x [1 x [1 x i32]]]* %58, i32 0, i64 0
  %60 = getelementptr inbounds [1 x [1 x i32]]* %59, i32 0, i64 0
  %61 = getelementptr inbounds [1 x i32]* %60, i32 0, i64 0
  %62 = load i32* %61, align 4
  %63 = load i32* %l_54, align 4
  %64 = and i32 %63, %62
  store i32 %64, i32* %l_54, align 4
  ret i32* @g_32
}

define i32 @func_16(i32 %p_17, i32* %p_18) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32*, align 8
  %l_37 = alloca i32*, align 8
  %i = alloca i32, align 4
  %l_52 = alloca i64, align 8
  %l_24 = alloca i64, align 8
  %l_31 = alloca i32*, align 8
  store i32 %p_17, i32* %1, align 4
  store i32* %p_18, i32** %2, align 8
  store i32* @g_10, i32** %l_37, align 8
  store i32 1, i32* @g_10, align 4
  br label %3

; <label>:3                                       ; preds = %20, %0
  %4 = load i32* @g_10, align 4
  %5 = icmp slt i32 %4, 4
  br i1 %5, label %6, label %23

; <label>:6                                       ; preds = %3
  store i64 0, i64* %l_52, align 8
  store volatile i32 0, i32* @g_2, align 4
  br label %7

; <label>:7                                       ; preds = %11, %6
  %8 = load volatile i32* @g_2, align 4
  %9 = icmp slt i32 %8, -29
  br i1 %9, label %10, label %16

; <label>:10                                      ; preds = %7
  store i64 -4488141920626724337, i64* %l_24, align 8
  store i32* @g_10, i32** %l_31, align 8
  br label %11

; <label>:11                                      ; preds = %10
  %12 = load volatile i32* @g_2, align 4
  %13 = trunc i32 %12 to i16
  %14 = call zeroext i16 @safe_sub_func_uint16_t_u_u(i16 zeroext %13, i16 zeroext 1)
  %15 = zext i16 %14 to i32
  store volatile i32 %15, i32* @g_2, align 4
  br label %7

; <label>:16                                      ; preds = %7
  %17 = load i64* %l_52, align 8
  %18 = trunc i64 %17 to i32
  %19 = load i32** %2, align 8
  store i32 %18, i32* %19
  br label %20

; <label>:20                                      ; preds = %16
  %21 = load i32* @g_10, align 4
  %22 = add nsw i32 %21, 4
  store i32 %22, i32* @g_10, align 4
  br label %3

; <label>:23                                      ; preds = %3
  %24 = load i32** %2, align 8
  %25 = load i32* %24
  ret i32 %25
}

define internal zeroext i16 @safe_sub_func_uint16_t_u_u(i16 zeroext %ui1, i16 zeroext %ui2) nounwind uwtable {
  %1 = alloca i16, align 2
  %2 = alloca i16, align 2
  store i16 %ui1, i16* %1, align 2
  store i16 %ui2, i16* %2, align 2
  %3 = load i16* %1, align 2
  %4 = zext i16 %3 to i32
  %5 = load i16* %2, align 2
  %6 = zext i16 %5 to i32
  %7 = sub nsw i32 %4, %6
  %8 = trunc i32 %7 to i16
  ret i16 %8
}

define i32 @func_33(i32 %p_34, i32* %p_35) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32*, align 8
  %l_36 = alloca i8, align 1
  store i32 %p_34, i32* %1, align 4
  store i32* %p_35, i32** %2, align 8
  store i8 22, i8* %l_36, align 1
  %3 = load i8* %l_36, align 1
  %4 = zext i8 %3 to i32
  ret i32 %4
}

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %l = alloca i32, align 4
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  %4 = call i64 @func_1()
  %5 = load volatile i32* @g_2, align 4
  %6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %5)
  %7 = load i32* @g_10, align 4
  %8 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str1, i32 0, i32 0), i32 %7)
  %9 = load i16* getelementptr inbounds ([4 x i16]* @g_19, i32 0, i64 0), align 2
  %10 = zext i16 %9 to i32
  %11 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str2, i32 0, i32 0), i32 %10)
  %12 = load i16* getelementptr inbounds ([4 x i16]* @g_19, i32 0, i64 1), align 2
  %13 = zext i16 %12 to i32
  %14 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str3, i32 0, i32 0), i32 %13)
  %15 = load i16* getelementptr inbounds ([4 x i16]* @g_19, i32 0, i64 2), align 2
  %16 = zext i16 %15 to i32
  %17 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str4, i32 0, i32 0), i32 %16)
  %18 = load i16* getelementptr inbounds ([4 x i16]* @g_19, i32 0, i64 3), align 2
  %19 = zext i16 %18 to i32
  %20 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str5, i32 0, i32 0), i32 %19)
  %21 = load i32* @g_32, align 4
  %22 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str6, i32 0, i32 0), i32 %21)
  %23 = load i32* @g_57, align 4
  %24 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str7, i32 0, i32 0), i32 %23)
  %25 = load i32* %1
  ret i32 %25
}

declare i32 @printf(i8*, ...)
