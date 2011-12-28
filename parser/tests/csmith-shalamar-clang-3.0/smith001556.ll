; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith001556.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_4 = global i32 -942779432, align 4
@g_10 = constant [9 x [1 x i32*]] [[1 x i32*] [i32* @g_4], [1 x i32*] [i32* @g_4], [1 x i32*] [i32* @g_4], [1 x i32*] [i32* @g_4], [1 x i32*] [i32* @g_4], [1 x i32*] [i32* @g_4], [1 x i32*] [i32* @g_4], [1 x i32*] [i32* @g_4], [1 x i32*] [i32* @g_4]], align 16
@g_9 = global i32** bitcast (i8* getelementptr (i8* bitcast ([9 x [1 x i32*]]* @g_10 to i8*), i64 56) to i32**), align 8
@g_16 = global [3 x [8 x [1 x [3 x i32*]]]] [[8 x [1 x [3 x i32*]]] [[1 x [3 x i32*]] [[3 x i32*] [i32* @g_4, i32* @g_4, i32* @g_4]], [1 x [3 x i32*]] [[3 x i32*] [i32* @g_4, i32* @g_4, i32* @g_4]], [1 x [3 x i32*]] [[3 x i32*] [i32* @g_4, i32* @g_4, i32* @g_4]], [1 x [3 x i32*]] [[3 x i32*] [i32* @g_4, i32* @g_4, i32* @g_4]], [1 x [3 x i32*]] [[3 x i32*] [i32* @g_4, i32* @g_4, i32* @g_4]], [1 x [3 x i32*]] [[3 x i32*] [i32* @g_4, i32* @g_4, i32* @g_4]], [1 x [3 x i32*]] [[3 x i32*] [i32* @g_4, i32* @g_4, i32* @g_4]], [1 x [3 x i32*]] [[3 x i32*] [i32* @g_4, i32* @g_4, i32* @g_4]]], [8 x [1 x [3 x i32*]]] [[1 x [3 x i32*]] [[3 x i32*] [i32* @g_4, i32* @g_4, i32* @g_4]], [1 x [3 x i32*]] [[3 x i32*] [i32* @g_4, i32* @g_4, i32* @g_4]], [1 x [3 x i32*]] [[3 x i32*] [i32* @g_4, i32* @g_4, i32* @g_4]], [1 x [3 x i32*]] [[3 x i32*] [i32* @g_4, i32* @g_4, i32* @g_4]], [1 x [3 x i32*]] [[3 x i32*] [i32* @g_4, i32* @g_4, i32* @g_4]], [1 x [3 x i32*]] [[3 x i32*] [i32* @g_4, i32* @g_4, i32* @g_4]], [1 x [3 x i32*]] [[3 x i32*] [i32* @g_4, i32* @g_4, i32* @g_4]], [1 x [3 x i32*]] [[3 x i32*] [i32* @g_4, i32* @g_4, i32* @g_4]]], [8 x [1 x [3 x i32*]]] [[1 x [3 x i32*]] [[3 x i32*] [i32* @g_4, i32* @g_4, i32* @g_4]], [1 x [3 x i32*]] [[3 x i32*] [i32* @g_4, i32* @g_4, i32* @g_4]], [1 x [3 x i32*]] [[3 x i32*] [i32* @g_4, i32* @g_4, i32* @g_4]], [1 x [3 x i32*]] [[3 x i32*] [i32* @g_4, i32* @g_4, i32* @g_4]], [1 x [3 x i32*]] [[3 x i32*] [i32* @g_4, i32* @g_4, i32* @g_4]], [1 x [3 x i32*]] [[3 x i32*] [i32* @g_4, i32* @g_4, i32* @g_4]], [1 x [3 x i32*]] [[3 x i32*] [i32* @g_4, i32* @g_4, i32* @g_4]], [1 x [3 x i32*]] [[3 x i32*] [i32* @g_4, i32* @g_4, i32* @g_4]]]], align 16
@g_15 = global i32** bitcast (i8* getelementptr (i8* bitcast ([3 x [8 x [1 x [3 x i32*]]]]* @g_16 to i8*), i64 400) to i32**), align 8
@.str = private unnamed_addr constant [19 x i8] c"checksum g_4 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define signext i16 @func_1() nounwind uwtable {
  %l_3 = alloca i32*, align 8
  %l_2 = alloca i32**, align 8
  %l_13 = alloca [7 x i32], align 16
  %l_14 = alloca i32*, align 8
  %i = alloca i32, align 4
  store i32* null, i32** %l_3, align 8
  store i32** %l_3, i32*** %l_2, align 8
  %1 = load i32*** %l_2, align 8
  store i32* null, i32** %1
  store i32 0, i32* @g_4, align 4
  br label %2

; <label>:2                                       ; preds = %31, %0
  %3 = load i32* @g_4, align 4
  %4 = icmp slt i32 %3, 0
  br i1 %4, label %5, label %36

; <label>:5                                       ; preds = %2
  store i32* @g_4, i32** %l_14, align 8
  store i32 0, i32* %i, align 4
  br label %6

; <label>:6                                       ; preds = %13, %5
  %7 = load i32* %i, align 4
  %8 = icmp slt i32 %7, 7
  br i1 %8, label %9, label %16

; <label>:9                                       ; preds = %6
  %10 = load i32* %i, align 4
  %11 = sext i32 %10 to i64
  %12 = getelementptr inbounds [7 x i32]* %l_13, i32 0, i64 %11
  store i32 -8, i32* %12, align 4
  br label %13

; <label>:13                                      ; preds = %9
  %14 = load i32* %i, align 4
  %15 = add nsw i32 %14, 1
  store i32 %15, i32* %i, align 4
  br label %6

; <label>:16                                      ; preds = %6
  %17 = load volatile i32*** @g_9, align 8
  %18 = icmp ne i32** null, %17
  %19 = zext i1 %18 to i32
  %20 = getelementptr inbounds [7 x i32]* %l_13, i32 0, i64 3
  %21 = load i32* %20, align 4
  %22 = trunc i32 %21 to i16
  %23 = icmp ne i32** %l_3, getelementptr inbounds ([9 x [1 x i32*]]* @g_10, i32 0, i64 3, i64 0)
  %24 = zext i1 %23 to i32
  %25 = call signext i16 @safe_rshift_func_int16_t_s_u(i16 signext %22, i32 %24)
  %26 = sext i16 %25 to i32
  %27 = call i32 @safe_mod_func_uint32_t_u_u(i32 %19, i32 %26)
  %28 = load i32** %l_14, align 8
  %29 = load i32* %28
  %30 = xor i32 %29, %27
  store i32 %30, i32* %28
  br label %31

; <label>:31                                      ; preds = %16
  %32 = load i32* @g_4, align 4
  %33 = trunc i32 %32 to i8
  %34 = call zeroext i8 @safe_add_func_uint8_t_u_u(i8 zeroext %33, i8 zeroext 4)
  %35 = zext i8 %34 to i32
  store i32 %35, i32* @g_4, align 4
  br label %2

; <label>:36                                      ; preds = %2
  %37 = load volatile i32*** @g_9, align 8
  %38 = load volatile i32** %37
  %39 = load volatile i32*** @g_15, align 8
  store volatile i32* %38, i32** %39
  %40 = load i32* @g_4, align 4
  %41 = trunc i32 %40 to i16
  ret i16 %41
}

define internal i32 @safe_mod_func_uint32_t_u_u(i32 %ui1, i32 %ui2) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 %ui1, i32* %1, align 4
  store i32 %ui2, i32* %2, align 4
  %3 = load i32* %2, align 4
  %4 = icmp eq i32 %3, 0
  br i1 %4, label %5, label %7

; <label>:5                                       ; preds = %0
  %6 = load i32* %1, align 4
  br label %11

; <label>:7                                       ; preds = %0
  %8 = load i32* %1, align 4
  %9 = load i32* %2, align 4
  %10 = urem i32 %8, %9
  br label %11

; <label>:11                                      ; preds = %7, %5
  %12 = phi i32 [ %6, %5 ], [ %10, %7 ]
  ret i32 %12
}

define internal signext i16 @safe_rshift_func_int16_t_s_u(i16 signext %left, i32 %right) nounwind uwtable {
  %1 = alloca i16, align 2
  %2 = alloca i32, align 4
  store i16 %left, i16* %1, align 2
  store i32 %right, i32* %2, align 4
  %3 = load i16* %1, align 2
  %4 = sext i16 %3 to i32
  %5 = icmp slt i32 %4, 0
  br i1 %5, label %9, label %6

; <label>:6                                       ; preds = %0
  %7 = load i32* %2, align 4
  %8 = icmp uge i32 %7, 32
  br i1 %8, label %9, label %12

; <label>:9                                       ; preds = %6, %0
  %10 = load i16* %1, align 2
  %11 = sext i16 %10 to i32
  br label %17

; <label>:12                                      ; preds = %6
  %13 = load i16* %1, align 2
  %14 = sext i16 %13 to i32
  %15 = load i32* %2, align 4
  %16 = ashr i32 %14, %15
  br label %17

; <label>:17                                      ; preds = %12, %9
  %18 = phi i32 [ %11, %9 ], [ %16, %12 ]
  %19 = trunc i32 %18 to i16
  ret i16 %19
}

define internal zeroext i8 @safe_add_func_uint8_t_u_u(i8 zeroext %ui1, i8 zeroext %ui2) nounwind uwtable {
  %1 = alloca i8, align 1
  %2 = alloca i8, align 1
  store i8 %ui1, i8* %1, align 1
  store i8 %ui2, i8* %2, align 1
  %3 = load i8* %1, align 1
  %4 = zext i8 %3 to i32
  %5 = load i8* %2, align 1
  %6 = zext i8 %5 to i32
  %7 = add nsw i32 %4, %6
  %8 = trunc i32 %7 to i8
  ret i8 %8
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
  %4 = call signext i16 @func_1()
  %5 = load i32* @g_4, align 4
  %6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %5)
  %7 = load i32* %1
  ret i32 %7
}

declare i32 @printf(i8*, ...)
