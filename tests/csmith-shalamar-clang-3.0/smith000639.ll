; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith000639.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_4 = constant i32 -1, align 4
@g_8 = global i32 -3, align 4
@g_10 = global i32 1, align 4
@g_31 = global i32 653085642, align 4
@g_30 = global i32* @g_31, align 8
@g_33 = global i32 -1, align 4
@.str = private unnamed_addr constant [19 x i8] c"checksum g_4 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [19 x i8] c"checksum g_8 = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [20 x i8] c"checksum g_10 = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [20 x i8] c"checksum g_31 = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [20 x i8] c"checksum g_33 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable {
  %1 = alloca i32, align 4
  %l_11 = alloca i8, align 1
  %l_32 = alloca i32*, align 8
  %l_29 = alloca i32*, align 8
  %l_28 = alloca i32**, align 8
  %l_34 = alloca i32*, align 8
  store i8 -3, i8* %l_11, align 1
  store i32* @g_33, i32** %l_32, align 8
  %2 = load volatile i32* @g_4, align 4
  %3 = load i8* %l_11, align 1
  %4 = zext i8 %3 to i64
  %5 = call i32 @func_5(i64 %4)
  %6 = or i32 %2, %5
  %7 = trunc i32 %6 to i8
  %8 = load i8* %l_11, align 1
  %9 = call zeroext i8 @safe_div_func_uint8_t_u_u(i8 zeroext %7, i8 zeroext %8)
  %10 = icmp ne i8 %9, 0
  br i1 %10, label %11, label %23

; <label>:11                                      ; preds = %0
  store i32* null, i32** %l_29, align 8
  store i32** %l_29, i32*** %l_28, align 8
  %12 = load i32*** %l_28, align 8
  %13 = call zeroext i16 @func_23(i8 zeroext -36, i32** %12)
  %14 = load i32** @g_30, align 8
  %15 = icmp ne i32* %14, null
  %16 = zext i1 %15 to i32
  %17 = trunc i32 %16 to i8
  %18 = load i32** %l_32, align 8
  %19 = call i32* @func_12(i32* @g_8, i16 zeroext %13, i8 zeroext %17, i32* %18)
  %20 = load i32*** %l_28, align 8
  store i32* %19, i32** %20
  %21 = load i32** @g_30, align 8
  %22 = load volatile i32* %21
  store i32 %22, i32* %1
  br label %32

; <label>:23                                      ; preds = %0
  store i32* null, i32** %l_34, align 8
  %24 = load i32** %l_34, align 8
  store i32* %24, i32** %l_34, align 8
  %25 = load i32** @g_30, align 8
  %26 = load volatile i32* %25
  %27 = sext i32 %26 to i64
  %28 = xor i64 %27, 1977601183
  %29 = trunc i64 %28 to i32
  store volatile i32 %29, i32* %25
  %30 = load i32** %l_32, align 8
  %31 = load i32* %30
  store i32 %31, i32* %1
  br label %32

; <label>:32                                      ; preds = %23, %11
  %33 = load i32* %1
  ret i32 %33
}

define internal zeroext i8 @safe_div_func_uint8_t_u_u(i8 zeroext %ui1, i8 zeroext %ui2) nounwind uwtable {
  %1 = alloca i8, align 1
  %2 = alloca i8, align 1
  store i8 %ui1, i8* %1, align 1
  store i8 %ui2, i8* %2, align 1
  %3 = load i8* %2, align 1
  %4 = zext i8 %3 to i32
  %5 = icmp eq i32 %4, 0
  br i1 %5, label %6, label %9

; <label>:6                                       ; preds = %0
  %7 = load i8* %1, align 1
  %8 = zext i8 %7 to i32
  br label %15

; <label>:9                                       ; preds = %0
  %10 = load i8* %1, align 1
  %11 = zext i8 %10 to i32
  %12 = load i8* %2, align 1
  %13 = zext i8 %12 to i32
  %14 = sdiv i32 %11, %13
  br label %15

; <label>:15                                      ; preds = %9, %6
  %16 = phi i32 [ %8, %6 ], [ %14, %9 ]
  %17 = trunc i32 %16 to i8
  ret i8 %17
}

define i32 @func_5(i64 %p_6) nounwind uwtable {
  %1 = alloca i64, align 8
  %l_7 = alloca i32*, align 8
  %l_9 = alloca i32*, align 8
  store i64 %p_6, i64* %1, align 8
  store i32* @g_8, i32** %l_7, align 8
  store i32* null, i32** %l_9, align 8
  %2 = load i64* %1, align 8
  %3 = icmp sgt i64 %2, 1494155828
  br i1 %3, label %4, label %5

; <label>:4                                       ; preds = %0
  br label %5

; <label>:5                                       ; preds = %4, %0
  %6 = phi i1 [ false, %0 ], [ true, %4 ]
  %7 = zext i1 %6 to i32
  %8 = sext i32 %7 to i64
  %9 = icmp sge i64 %8, -5
  %10 = zext i1 %9 to i32
  %11 = load i32** %l_7, align 8
  store i32 %10, i32* %11
  %12 = load i32** %l_7, align 8
  %13 = load i32* %12
  %14 = load i32* @g_10, align 4
  %15 = or i32 %14, %13
  store i32 %15, i32* @g_10, align 4
  %16 = load i64* %1, align 8
  %17 = trunc i64 %16 to i32
  ret i32 %17
}

define i32* @func_12(i32* %p_13, i16 zeroext %p_14, i8 zeroext %p_15, i32* %p_16) nounwind uwtable {
  %1 = alloca i32*, align 8
  %2 = alloca i32*, align 8
  %3 = alloca i16, align 2
  %4 = alloca i8, align 1
  %5 = alloca i32*, align 8
  %l_18 = alloca i32**, align 8
  %l_17 = alloca i32***, align 8
  %l_22 = alloca i32*, align 8
  store i32* %p_13, i32** %2, align 8
  store i16 %p_14, i16* %3, align 2
  store i8 %p_15, i8* %4, align 1
  store i32* %p_16, i32** %5, align 8
  store i32** null, i32*** %l_18, align 8
  store i32*** %l_18, i32**** %l_17, align 8
  br label %6

; <label>:6                                       ; preds = %23, %0
  %7 = load i32**** %l_17, align 8
  store i32** null, i32*** %7
  %8 = load i32* @g_8, align 4
  %9 = icmp eq i32** null, %2
  %10 = zext i1 %9 to i32
  %11 = icmp slt i32 %8, %10
  %12 = zext i1 %11 to i32
  %13 = load volatile i32* @g_4, align 4
  %14 = icmp eq i32 %12, %13
  %15 = zext i1 %14 to i32
  %16 = load i32** %5, align 8
  store i32 %15, i32* %16
  store i32 0, i32* @g_10, align 4
  br label %17

; <label>:17                                      ; preds = %26, %6
  %18 = load i32* @g_10, align 4
  %19 = icmp uge i32 %18, -27
  br i1 %19, label %20, label %31

; <label>:20                                      ; preds = %17
  store i32* null, i32** %l_22, align 8
  %21 = load i32* @g_8, align 4
  %22 = icmp ne i32 %21, 0
  br i1 %22, label %23, label %24

; <label>:23                                      ; preds = %20
  br label %6

; <label>:24                                      ; preds = %20
  %25 = load i32** %l_22, align 8
  store i32* %25, i32** %1
  br label %32
                                                  ; No predecessors!
  %27 = load i32* @g_10, align 4
  %28 = zext i32 %27 to i64
  %29 = call i64 @safe_add_func_int64_t_s_s(i64 %28, i64 1)
  %30 = trunc i64 %29 to i32
  store i32 %30, i32* @g_10, align 4
  br label %17

; <label>:31                                      ; preds = %17
  store i32* @g_8, i32** %1
  br label %32

; <label>:32                                      ; preds = %31, %24
  %33 = load i32** %1
  ret i32* %33
}

define zeroext i16 @func_23(i8 zeroext %p_24, i32** %p_25) nounwind uwtable {
  %1 = alloca i8, align 1
  %2 = alloca i32**, align 8
  %l_26 = alloca i32, align 4
  %l_27 = alloca i32*, align 8
  store i8 %p_24, i8* %1, align 1
  store i32** %p_25, i32*** %2, align 8
  store volatile i32 -1, i32* %l_26, align 4
  store i32* @g_8, i32** %l_27, align 8
  %3 = load volatile i32* @g_4, align 4
  store volatile i32 %3, i32* %l_26, align 4
  %4 = load volatile i32* @g_4, align 4
  %5 = load i32** %l_27, align 8
  %6 = load i32* %5
  %7 = xor i32 %6, %4
  store i32 %7, i32* %5
  %8 = load volatile i32* @g_4, align 4
  %9 = trunc i32 %8 to i16
  ret i16 %9
}

define internal i64 @safe_add_func_int64_t_s_s(i64 %si1, i64 %si2) nounwind uwtable {
  %1 = alloca i64, align 8
  %2 = alloca i64, align 8
  store i64 %si1, i64* %1, align 8
  store i64 %si2, i64* %2, align 8
  %3 = load i64* %1, align 8
  %4 = icmp sgt i64 %3, 0
  br i1 %4, label %5, label %13

; <label>:5                                       ; preds = %0
  %6 = load i64* %2, align 8
  %7 = icmp sgt i64 %6, 0
  br i1 %7, label %8, label %13

; <label>:8                                       ; preds = %5
  %9 = load i64* %1, align 8
  %10 = load i64* %2, align 8
  %11 = sub nsw i64 9223372036854775807, %10
  %12 = icmp sgt i64 %9, %11
  br i1 %12, label %24, label %13

; <label>:13                                      ; preds = %8, %5, %0
  %14 = load i64* %1, align 8
  %15 = icmp slt i64 %14, 0
  br i1 %15, label %16, label %26

; <label>:16                                      ; preds = %13
  %17 = load i64* %2, align 8
  %18 = icmp slt i64 %17, 0
  br i1 %18, label %19, label %26

; <label>:19                                      ; preds = %16
  %20 = load i64* %1, align 8
  %21 = load i64* %2, align 8
  %22 = sub nsw i64 -9223372036854775808, %21
  %23 = icmp slt i64 %20, %22
  br i1 %23, label %24, label %26

; <label>:24                                      ; preds = %19, %8
  %25 = load i64* %1, align 8
  br label %30

; <label>:26                                      ; preds = %19, %16, %13
  %27 = load i64* %1, align 8
  %28 = load i64* %2, align 8
  %29 = add nsw i64 %27, %28
  br label %30

; <label>:30                                      ; preds = %26, %24
  %31 = phi i64 [ %25, %24 ], [ %29, %26 ]
  ret i64 %31
}

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  %4 = call i32 @func_1()
  %5 = load volatile i32* @g_4, align 4
  %6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %5)
  %7 = load i32* @g_8, align 4
  %8 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str1, i32 0, i32 0), i32 %7)
  %9 = load i32* @g_10, align 4
  %10 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str2, i32 0, i32 0), i32 %9)
  %11 = load volatile i32* @g_31, align 4
  %12 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str3, i32 0, i32 0), i32 %11)
  %13 = load i32* @g_33, align 4
  %14 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str4, i32 0, i32 0), i32 %13)
  %15 = load i32* %1
  ret i32 %15
}

declare i32 @printf(i8*, ...)
