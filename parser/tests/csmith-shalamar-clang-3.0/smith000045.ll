; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith000045.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_10 = global i32 1108402532, align 4
@g_9 = global i32* @g_10, align 8
@g_15 = global [8 x i32*] zeroinitializer, align 16
@g_14 = global i32** bitcast (i8* getelementptr (i8* bitcast ([8 x i32*]* @g_15 to i8*), i64 48) to i32**), align 8
@.str = private unnamed_addr constant [20 x i8] c"checksum g_10 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define zeroext i16 @func_1() nounwind uwtable {
  %l_13 = alloca i32*, align 8
  %l_16 = alloca [2 x [1 x i32]], align 4
  %l_17 = alloca i32*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32* null, i32** %l_13, align 8
  store i32* @g_10, i32** %l_17, align 8
  store i32 0, i32* %i, align 4
  br label %1

; <label>:1                                       ; preds = %19, %0
  %2 = load i32* %i, align 4
  %3 = icmp slt i32 %2, 2
  br i1 %3, label %4, label %22

; <label>:4                                       ; preds = %1
  store i32 0, i32* %j, align 4
  br label %5

; <label>:5                                       ; preds = %15, %4
  %6 = load i32* %j, align 4
  %7 = icmp slt i32 %6, 1
  br i1 %7, label %8, label %18

; <label>:8                                       ; preds = %5
  %9 = load i32* %j, align 4
  %10 = sext i32 %9 to i64
  %11 = load i32* %i, align 4
  %12 = sext i32 %11 to i64
  %13 = getelementptr inbounds [2 x [1 x i32]]* %l_16, i32 0, i64 %12
  %14 = getelementptr inbounds [1 x i32]* %13, i32 0, i64 %10
  store i32 641538176, i32* %14, align 4
  br label %15

; <label>:15                                      ; preds = %8
  %16 = load i32* %j, align 4
  %17 = add nsw i32 %16, 1
  store i32 %17, i32* %j, align 4
  br label %5

; <label>:18                                      ; preds = %5
  br label %19

; <label>:19                                      ; preds = %18
  %20 = load i32* %i, align 4
  %21 = add nsw i32 %20, 1
  store i32 %21, i32* %i, align 4
  br label %1

; <label>:22                                      ; preds = %1
  %23 = load i32** %l_13, align 8
  %24 = load volatile i32** @g_9, align 8
  %25 = load i32* %24
  %26 = load i32* @g_10, align 4
  %27 = icmp sge i32 %25, %26
  %28 = zext i1 %27 to i32
  %29 = trunc i32 %28 to i16
  %30 = call i32* @func_2(i32* @g_10, i32* %23, i16 zeroext %29)
  %31 = load volatile i32*** @g_14, align 8
  store i32* %30, i32** %31
  %32 = getelementptr inbounds [2 x [1 x i32]]* %l_16, i32 0, i64 0
  %33 = getelementptr inbounds [1 x i32]* %32, i32 0, i64 0
  %34 = load i32* %33, align 4
  %35 = load i32** %l_17, align 8
  store i32 %34, i32* %35
  %36 = load i32* @g_10, align 4
  %37 = trunc i32 %36 to i16
  ret i16 %37
}

define i32* @func_2(i32* %p_3, i32* %p_4, i16 zeroext %p_5) nounwind uwtable {
  %1 = alloca i32*, align 8
  %2 = alloca i32*, align 8
  %3 = alloca i16, align 2
  %l_11 = alloca i32*, align 8
  %l_12 = alloca i32*, align 8
  %l_8 = alloca i8, align 1
  store i32* %p_3, i32** %1, align 8
  store i32* %p_4, i32** %2, align 8
  store i16 %p_5, i16* %3, align 2
  store volatile i32* @g_10, i32** %l_11, align 8
  store i32* @g_10, i32** %l_12, align 8
  store i16 2, i16* %3, align 2
  br label %4

; <label>:4                                       ; preds = %19, %0
  %5 = load i16* %3, align 2
  %6 = zext i16 %5 to i32
  %7 = icmp eq i32 %6, -16
  br i1 %7, label %8, label %22

; <label>:8                                       ; preds = %4
  store i8 -95, i8* %l_8, align 1
  %9 = load i8* %l_8, align 1
  %10 = icmp ne i8 %9, 0
  br i1 %10, label %11, label %12

; <label>:11                                      ; preds = %8
  br label %22

; <label>:12                                      ; preds = %8
  %13 = load volatile i32** @g_9, align 8
  store volatile i32* %13, i32** %l_11, align 8
  %14 = load i32** %1, align 8
  %15 = load i32* %14
  %16 = icmp ne i32 %15, 0
  br i1 %16, label %17, label %18

; <label>:17                                      ; preds = %12
  br label %22

; <label>:18                                      ; preds = %12
  br label %19

; <label>:19                                      ; preds = %18
  %20 = load i16* %3, align 2
  %21 = call signext i16 @safe_sub_func_int16_t_s_s(i16 signext %20, i16 signext 1)
  store i16 %21, i16* %3, align 2
  br label %4

; <label>:22                                      ; preds = %17, %11, %4
  %23 = load i32** %l_12, align 8
  ret i32* %23
}

define internal signext i16 @safe_sub_func_int16_t_s_s(i16 signext %si1, i16 signext %si2) nounwind uwtable {
  %1 = alloca i16, align 2
  %2 = alloca i16, align 2
  store i16 %si1, i16* %1, align 2
  store i16 %si2, i16* %2, align 2
  %3 = load i16* %1, align 2
  %4 = sext i16 %3 to i32
  %5 = load i16* %2, align 2
  %6 = sext i16 %5 to i32
  %7 = sub nsw i32 %4, %6
  %8 = trunc i32 %7 to i16
  ret i16 %8
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
  %5 = load i32* @g_10, align 4
  %6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str, i32 0, i32 0), i32 %5)
  %7 = load i32* %1
  ret i32 %7
}

declare i32 @printf(i8*, ...)
