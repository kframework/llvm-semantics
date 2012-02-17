; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith001084.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_11 = global i32 -2, align 4
@g_15 = global [5 x i32*] [i32* @g_11, i32* @g_11, i32* @g_11, i32* @g_11, i32* @g_11], align 16
@g_14 = global i32** bitcast (i8* getelementptr (i8* bitcast ([5 x i32*]* @g_15 to i8*), i64 24) to i32**), align 8
@g_17 = global i32* @g_11, align 8
@.str = private unnamed_addr constant [20 x i8] c"checksum g_11 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define signext i8 @func_1() nounwind uwtable {
  %l_13 = alloca i32*, align 8
  %l_16 = alloca i32**, align 8
  %l_19 = alloca i32**, align 8
  %l_18 = alloca i32***, align 8
  store i32* null, i32** %l_13, align 8
  store i32** %l_13, i32*** %l_16, align 8
  store i32** %l_13, i32*** %l_19, align 8
  store i32*** %l_19, i32**** %l_18, align 8
  %1 = load i32** %l_13, align 8
  %2 = load i32** %l_13, align 8
  %3 = load i32* @g_11, align 4
  %4 = load i32** %l_13, align 8
  %5 = call i32* @func_2(i32* %1, i32* %2, i32 %3, i16 signext 15682, i32* %4)
  %6 = load volatile i32*** @g_14, align 8
  store i32* %5, i32** %6
  %7 = load i32*** %l_16, align 8
  %8 = icmp ne i32** null, %7
  %9 = zext i1 %8 to i32
  %10 = load volatile i32** @g_17, align 8
  %11 = load i32* %10
  %12 = and i32 %11, %9
  store i32 %12, i32* %10
  %13 = load i32**** %l_18, align 8
  store i32** null, i32*** %13
  %14 = load i32* @g_11, align 4
  %15 = trunc i32 %14 to i8
  ret i8 %15
}

define i32* @func_2(i32* %p_3, i32* %p_4, i32 %p_5, i16 signext %p_6, i32* %p_7) nounwind uwtable {
  %1 = alloca i32*, align 8
  %2 = alloca i32*, align 8
  %3 = alloca i32*, align 8
  %4 = alloca i32, align 4
  %5 = alloca i16, align 2
  %6 = alloca i32*, align 8
  %l_10 = alloca i32*, align 8
  %l_12 = alloca [4 x [5 x [1 x i32*]]], align 16
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  store i32* %p_3, i32** %2, align 8
  store i32* %p_4, i32** %3, align 8
  store i32 %p_5, i32* %4, align 4
  store i16 %p_6, i16* %5, align 2
  store i32* %p_7, i32** %6, align 8
  store i32* @g_11, i32** %l_10, align 8
  store i32 0, i32* %i, align 4
  br label %7

; <label>:7                                       ; preds = %36, %0
  %8 = load i32* %i, align 4
  %9 = icmp slt i32 %8, 4
  br i1 %9, label %10, label %39

; <label>:10                                      ; preds = %7
  store i32 0, i32* %j, align 4
  br label %11

; <label>:11                                      ; preds = %32, %10
  %12 = load i32* %j, align 4
  %13 = icmp slt i32 %12, 5
  br i1 %13, label %14, label %35

; <label>:14                                      ; preds = %11
  store i32 0, i32* %k, align 4
  br label %15

; <label>:15                                      ; preds = %28, %14
  %16 = load i32* %k, align 4
  %17 = icmp slt i32 %16, 1
  br i1 %17, label %18, label %31

; <label>:18                                      ; preds = %15
  %19 = load i32* %k, align 4
  %20 = sext i32 %19 to i64
  %21 = load i32* %j, align 4
  %22 = sext i32 %21 to i64
  %23 = load i32* %i, align 4
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds [4 x [5 x [1 x i32*]]]* %l_12, i32 0, i64 %24
  %26 = getelementptr inbounds [5 x [1 x i32*]]* %25, i32 0, i64 %22
  %27 = getelementptr inbounds [1 x i32*]* %26, i32 0, i64 %20
  store i32* null, i32** %27, align 8
  br label %28

; <label>:28                                      ; preds = %18
  %29 = load i32* %k, align 4
  %30 = add nsw i32 %29, 1
  store i32 %30, i32* %k, align 4
  br label %15

; <label>:31                                      ; preds = %15
  br label %32

; <label>:32                                      ; preds = %31
  %33 = load i32* %j, align 4
  %34 = add nsw i32 %33, 1
  store i32 %34, i32* %j, align 4
  br label %11

; <label>:35                                      ; preds = %11
  br label %36

; <label>:36                                      ; preds = %35
  %37 = load i32* %i, align 4
  %38 = add nsw i32 %37, 1
  store i32 %38, i32* %i, align 4
  br label %7

; <label>:39                                      ; preds = %7
  store i16 0, i16* %5, align 2
  br label %40

; <label>:40                                      ; preds = %46, %39
  %41 = load i16* %5, align 2
  %42 = sext i16 %41 to i32
  %43 = icmp eq i32 %42, -5
  br i1 %43, label %44, label %51

; <label>:44                                      ; preds = %40
  %45 = load i32** %l_10, align 8
  store i32* %45, i32** %1
  br label %56
                                                  ; No predecessors!
  %47 = load i16* %5, align 2
  %48 = sext i16 %47 to i32
  %49 = call i32 @safe_add_func_int32_t_s_s(i32 %48, i32 0)
  %50 = trunc i32 %49 to i16
  store i16 %50, i16* %5, align 2
  br label %40

; <label>:51                                      ; preds = %40
  %52 = getelementptr inbounds [4 x [5 x [1 x i32*]]]* %l_12, i32 0, i64 0
  %53 = getelementptr inbounds [5 x [1 x i32*]]* %52, i32 0, i64 3
  %54 = getelementptr inbounds [1 x i32*]* %53, i32 0, i64 0
  %55 = load i32** %54, align 8
  store i32* %55, i32** %1
  br label %56

; <label>:56                                      ; preds = %51, %44
  %57 = load i32** %1
  ret i32* %57
}

define internal i32 @safe_add_func_int32_t_s_s(i32 %si1, i32 %si2) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 %si1, i32* %1, align 4
  store i32 %si2, i32* %2, align 4
  %3 = load i32* %1, align 4
  %4 = icmp sgt i32 %3, 0
  br i1 %4, label %5, label %13

; <label>:5                                       ; preds = %0
  %6 = load i32* %2, align 4
  %7 = icmp sgt i32 %6, 0
  br i1 %7, label %8, label %13

; <label>:8                                       ; preds = %5
  %9 = load i32* %1, align 4
  %10 = load i32* %2, align 4
  %11 = sub nsw i32 2147483647, %10
  %12 = icmp sgt i32 %9, %11
  br i1 %12, label %24, label %13

; <label>:13                                      ; preds = %8, %5, %0
  %14 = load i32* %1, align 4
  %15 = icmp slt i32 %14, 0
  br i1 %15, label %16, label %26

; <label>:16                                      ; preds = %13
  %17 = load i32* %2, align 4
  %18 = icmp slt i32 %17, 0
  br i1 %18, label %19, label %26

; <label>:19                                      ; preds = %16
  %20 = load i32* %1, align 4
  %21 = load i32* %2, align 4
  %22 = sub nsw i32 -2147483648, %21
  %23 = icmp slt i32 %20, %22
  br i1 %23, label %24, label %26

; <label>:24                                      ; preds = %19, %8
  %25 = load i32* %1, align 4
  br label %30

; <label>:26                                      ; preds = %19, %16, %13
  %27 = load i32* %1, align 4
  %28 = load i32* %2, align 4
  %29 = add nsw i32 %27, %28
  br label %30

; <label>:30                                      ; preds = %26, %24
  %31 = phi i32 [ %25, %24 ], [ %29, %26 ]
  ret i32 %31
}

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  %i = alloca i32, align 4
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  %4 = call signext i8 @func_1()
  %5 = load i32* @g_11, align 4
  %6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str, i32 0, i32 0), i32 %5)
  %7 = load i32* %1
  ret i32 %7
}

declare i32 @printf(i8*, ...)
