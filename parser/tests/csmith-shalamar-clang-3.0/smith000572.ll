; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith000572.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = global i16 18942, align 2
@g_3 = global i8 -7, align 1
@g_12 = global i32 171075558, align 4
@g_11 = constant [1 x i32*] [i32* @g_12], align 8
@g_24 = global i32* @g_12, align 8
@g_23 = constant [3 x i32**] [i32** @g_24, i32** @g_24, i32** @g_24], align 16
@.str = private unnamed_addr constant [19 x i8] c"checksum g_2 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [19 x i8] c"checksum g_3 = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [20 x i8] c"checksum g_12 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define signext i16 @func_1() nounwind uwtable {
  %1 = alloca i16, align 2
  %l_16 = alloca i32*, align 8
  %l_15 = alloca i32**, align 8
  %l_28 = alloca i32, align 4
  %l_25 = alloca i16, align 2
  store i32* null, i32** %l_16, align 8
  store i32** %l_16, i32*** %l_15, align 8
  store i32 1778338986, i32* %l_28, align 4
  %2 = load volatile i16* @g_2, align 2
  %3 = trunc i16 %2 to i8
  store volatile i8 %3, i8* @g_3, align 1
  %4 = call i32* @func_4(i32* @g_12)
  %5 = load i32*** %l_15, align 8
  store i32* %4, i32** %5
  %6 = load i32*** %l_15, align 8
  %7 = load i32** %6
  %8 = icmp eq i32* null, %7
  br i1 %8, label %9, label %27

; <label>:9                                       ; preds = %0
  store i16 1, i16* %l_25, align 2
  %10 = load i32*** getelementptr inbounds ([3 x i32**]* @g_23, i32 0, i64 2), align 8
  %11 = load i16* %l_25, align 2
  %12 = sext i16 %11 to i64
  %13 = load i32** %l_16, align 8
  %14 = load i32* %13
  %15 = trunc i32 %14 to i8
  %16 = load i16* %l_25, align 2
  %17 = trunc i16 %16 to i8
  %18 = call signext i8 @safe_sub_func_int8_t_s_s(i8 signext %15, i8 signext %17)
  %19 = sext i8 %18 to i16
  %20 = call i32 @func_17(i32** %10, i64 %12, i16 signext %19)
  %21 = load i32** %l_16, align 8
  store i32 %20, i32* %21
  %22 = load i32* %l_28, align 4
  %23 = load i32*** %l_15, align 8
  %24 = load i32** %23
  %25 = load i32* %24
  %26 = xor i32 %25, %22
  store i32 %26, i32* %24
  br label %30

; <label>:27                                      ; preds = %0
  %28 = load volatile i8* @g_3, align 1
  %29 = zext i8 %28 to i16
  store i16 %29, i16* %1
  br label %32

; <label>:30                                      ; preds = %9
  %31 = load volatile i16* @g_2, align 2
  store i16 %31, i16* %1
  br label %32

; <label>:32                                      ; preds = %30, %27
  %33 = load i16* %1
  ret i16 %33
}

define i32* @func_4(i32* %p_5) nounwind uwtable {
  %1 = alloca i32*, align 8
  %l_13 = alloca i16, align 2
  %l_14 = alloca i32, align 4
  %l_10 = alloca [7 x [10 x i32]], align 16
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32* %p_5, i32** %1, align 8
  store i16 -1, i16* %l_13, align 2
  store i32 -2145855012, i32* %l_14, align 4
  %2 = load volatile i8* @g_3, align 1
  %3 = zext i8 %2 to i32
  %4 = call zeroext i8 @safe_lshift_func_uint8_t_u_s(i8 zeroext 60, i32 -291331149)
  %5 = zext i8 %4 to i32
  %6 = icmp slt i32 %3, %5
  %7 = zext i1 %6 to i32
  %8 = load i32** %1, align 8
  store i32 %7, i32* %8
  %9 = load volatile i8* @g_3, align 1
  %10 = zext i8 %9 to i32
  %11 = load i32** %1, align 8
  store i32 %10, i32* %11
  store volatile i8 0, i8* @g_3, align 1
  br label %12

; <label>:12                                      ; preds = %70, %0
  %13 = load volatile i8* @g_3, align 1
  %14 = zext i8 %13 to i32
  %15 = icmp sge i32 %14, 9
  br i1 %15, label %16, label %75

; <label>:16                                      ; preds = %12
  store i32 0, i32* %i, align 4
  br label %17

; <label>:17                                      ; preds = %35, %16
  %18 = load i32* %i, align 4
  %19 = icmp slt i32 %18, 7
  br i1 %19, label %20, label %38

; <label>:20                                      ; preds = %17
  store i32 0, i32* %j, align 4
  br label %21

; <label>:21                                      ; preds = %31, %20
  %22 = load i32* %j, align 4
  %23 = icmp slt i32 %22, 10
  br i1 %23, label %24, label %34

; <label>:24                                      ; preds = %21
  %25 = load i32* %j, align 4
  %26 = sext i32 %25 to i64
  %27 = load i32* %i, align 4
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds [7 x [10 x i32]]* %l_10, i32 0, i64 %28
  %30 = getelementptr inbounds [10 x i32]* %29, i32 0, i64 %26
  store i32 0, i32* %30, align 4
  br label %31

; <label>:31                                      ; preds = %24
  %32 = load i32* %j, align 4
  %33 = add nsw i32 %32, 1
  store i32 %33, i32* %j, align 4
  br label %21

; <label>:34                                      ; preds = %21
  br label %35

; <label>:35                                      ; preds = %34
  %36 = load i32* %i, align 4
  %37 = add nsw i32 %36, 1
  store i32 %37, i32* %i, align 4
  br label %17

; <label>:38                                      ; preds = %17
  store volatile i16 0, i16* @g_2, align 2
  br label %39

; <label>:39                                      ; preds = %64, %38
  %40 = load volatile i16* @g_2, align 2
  %41 = zext i16 %40 to i32
  %42 = icmp slt i32 %41, 7
  br i1 %42, label %43, label %69

; <label>:43                                      ; preds = %39
  store volatile i8 6, i8* @g_3, align 1
  br label %44

; <label>:44                                      ; preds = %58, %43
  %45 = load volatile i8* @g_3, align 1
  %46 = zext i8 %45 to i32
  %47 = icmp sge i32 %46, 0
  br i1 %47, label %48, label %63

; <label>:48                                      ; preds = %44
  %49 = load volatile i32** getelementptr inbounds ([1 x i32*]* @g_11, i32 0, i64 0), align 8
  %50 = load i32** %1, align 8
  %51 = icmp ne i32* %49, %50
  %52 = zext i1 %51 to i32
  %53 = load i32** %1, align 8
  store i32 %52, i32* %53
  %54 = load i16* %l_13, align 2
  %55 = sext i16 %54 to i32
  %56 = load i32* %l_14, align 4
  %57 = or i32 %56, %55
  store i32 %57, i32* %l_14, align 4
  br label %58

; <label>:58                                      ; preds = %48
  %59 = load volatile i8* @g_3, align 1
  %60 = zext i8 %59 to i32
  %61 = add nsw i32 %60, -10
  %62 = trunc i32 %61 to i8
  store volatile i8 %62, i8* @g_3, align 1
  br label %44

; <label>:63                                      ; preds = %44
  br label %64

; <label>:64                                      ; preds = %63
  %65 = load volatile i16* @g_2, align 2
  %66 = zext i16 %65 to i32
  %67 = add nsw i32 %66, 3
  %68 = trunc i32 %67 to i16
  store volatile i16 %68, i16* @g_2, align 2
  br label %39

; <label>:69                                      ; preds = %39
  br label %70

; <label>:70                                      ; preds = %69
  %71 = load volatile i8* @g_3, align 1
  %72 = zext i8 %71 to i64
  %73 = call i64 @safe_add_func_uint64_t_u_u(i64 %72, i64 1)
  %74 = trunc i64 %73 to i8
  store volatile i8 %74, i8* @g_3, align 1
  br label %12

; <label>:75                                      ; preds = %12
  ret i32* @g_12
}

define i32 @func_17(i32** %p_18, i64 %p_19, i16 signext %p_20) nounwind uwtable {
  %1 = alloca i32**, align 8
  %2 = alloca i64, align 8
  %3 = alloca i16, align 2
  %l_21 = alloca i8, align 1
  %l_22 = alloca i32*, align 8
  store i32** %p_18, i32*** %1, align 8
  store i64 %p_19, i64* %2, align 8
  store i16 %p_20, i16* %3, align 2
  store i8 -46, i8* %l_21, align 1
  store i32* @g_12, i32** %l_22, align 8
  %4 = load i32** %l_22, align 8
  store i32 -46, i32* %4
  %5 = load i64* %2, align 8
  %6 = trunc i64 %5 to i32
  ret i32 %6
}

define internal signext i8 @safe_sub_func_int8_t_s_s(i8 signext %si1, i8 signext %si2) nounwind uwtable {
  %1 = alloca i8, align 1
  %2 = alloca i8, align 1
  store i8 %si1, i8* %1, align 1
  store i8 %si2, i8* %2, align 1
  %3 = load i8* %1, align 1
  %4 = sext i8 %3 to i32
  %5 = load i8* %2, align 1
  %6 = sext i8 %5 to i32
  %7 = sub nsw i32 %4, %6
  %8 = trunc i32 %7 to i8
  ret i8 %8
}

define internal zeroext i8 @safe_lshift_func_uint8_t_u_s(i8 zeroext %left, i32 %right) nounwind uwtable {
  %1 = alloca i8, align 1
  %2 = alloca i32, align 4
  store i8 %left, i8* %1, align 1
  store i32 %right, i32* %2, align 4
  %3 = load i32* %2, align 4
  %4 = icmp slt i32 %3, 0
  br i1 %4, label %14, label %5

; <label>:5                                       ; preds = %0
  %6 = load i32* %2, align 4
  %7 = icmp sge i32 %6, 32
  br i1 %7, label %14, label %8

; <label>:8                                       ; preds = %5
  %9 = load i8* %1, align 1
  %10 = zext i8 %9 to i32
  %11 = load i32* %2, align 4
  %12 = ashr i32 255, %11
  %13 = icmp sgt i32 %10, %12
  br i1 %13, label %14, label %17

; <label>:14                                      ; preds = %8, %5, %0
  %15 = load i8* %1, align 1
  %16 = zext i8 %15 to i32
  br label %22

; <label>:17                                      ; preds = %8
  %18 = load i8* %1, align 1
  %19 = zext i8 %18 to i32
  %20 = load i32* %2, align 4
  %21 = shl i32 %19, %20
  br label %22

; <label>:22                                      ; preds = %17, %14
  %23 = phi i32 [ %16, %14 ], [ %21, %17 ]
  %24 = trunc i32 %23 to i8
  ret i8 %24
}

define internal i64 @safe_add_func_uint64_t_u_u(i64 %ui1, i64 %ui2) nounwind uwtable {
  %1 = alloca i64, align 8
  %2 = alloca i64, align 8
  store i64 %ui1, i64* %1, align 8
  store i64 %ui2, i64* %2, align 8
  %3 = load i64* %1, align 8
  %4 = load i64* %2, align 8
  %5 = add i64 %3, %4
  ret i64 %5
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
  %5 = load volatile i16* @g_2, align 2
  %6 = zext i16 %5 to i32
  %7 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %6)
  %8 = load volatile i8* @g_3, align 1
  %9 = zext i8 %8 to i32
  %10 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str1, i32 0, i32 0), i32 %9)
  %11 = load i32* @g_12, align 4
  %12 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str2, i32 0, i32 0), i32 %11)
  %13 = load i32* %1
  ret i32 %13
}

declare i32 @printf(i8*, ...)
