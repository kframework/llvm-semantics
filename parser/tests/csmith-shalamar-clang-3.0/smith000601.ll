; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith000601.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.S2 = type { i32, i32 }

@g_3 = global i32 -9, align 4
@g_6 = global i32 1, align 4
@g_5 = global i32* @g_6, align 8
@g_10 = global i32 767093092, align 4
@g_16 = global %struct.S2 { i32 1688278528, i32 1418978851 }, align 4
@.str = private unnamed_addr constant [19 x i8] c"checksum g_3 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [19 x i8] c"checksum g_6 = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [20 x i8] c"checksum g_10 = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [23 x i8] c"checksum g_16.f0 = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [23 x i8] c"checksum g_16.f1 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable {
  %l_2 = alloca [4 x i32], align 16
  %l_9 = alloca i32*, align 8
  %l_17 = alloca i32**, align 8
  %i = alloca i32, align 4
  %l_4 = alloca [6 x i16], align 2
  %i1 = alloca i32, align 4
  store i32* @g_10, i32** %l_9, align 8
  store i32** %l_9, i32*** %l_17, align 8
  store i32 0, i32* %i, align 4
  br label %1

; <label>:1                                       ; preds = %8, %0
  %2 = load i32* %i, align 4
  %3 = icmp slt i32 %2, 4
  br i1 %3, label %4, label %11

; <label>:4                                       ; preds = %1
  %5 = load i32* %i, align 4
  %6 = sext i32 %5 to i64
  %7 = getelementptr inbounds [4 x i32]* %l_2, i32 0, i64 %6
  store i32 9, i32* %7, align 4
  br label %8

; <label>:8                                       ; preds = %4
  %9 = load i32* %i, align 4
  %10 = add nsw i32 %9, 1
  store i32 %10, i32* %i, align 4
  br label %1

; <label>:11                                      ; preds = %1
  store volatile i32 1, i32* @g_3, align 4
  br label %12

; <label>:12                                      ; preds = %33, %11
  %13 = load volatile i32* @g_3, align 4
  %14 = icmp slt i32 %13, 4
  br i1 %14, label %15, label %36

; <label>:15                                      ; preds = %12
  store i32 0, i32* %i1, align 4
  br label %16

; <label>:16                                      ; preds = %23, %15
  %17 = load i32* %i1, align 4
  %18 = icmp slt i32 %17, 6
  br i1 %18, label %19, label %26

; <label>:19                                      ; preds = %16
  %20 = load i32* %i1, align 4
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds [6 x i16]* %l_4, i32 0, i64 %21
  store i16 -10033, i16* %22, align 2
  br label %23

; <label>:23                                      ; preds = %19
  %24 = load i32* %i1, align 4
  %25 = add nsw i32 %24, 1
  store i32 %25, i32* %i1, align 4
  br label %16

; <label>:26                                      ; preds = %16
  %27 = getelementptr inbounds [6 x i16]* %l_4, i32 0, i64 1
  %28 = load i16* %27, align 2
  %29 = zext i16 %28 to i32
  %30 = load volatile i32** @g_5, align 8
  %31 = load i32* %30
  %32 = xor i32 %31, %29
  store i32 %32, i32* %30
  br label %33

; <label>:33                                      ; preds = %26
  %34 = load volatile i32* @g_3, align 4
  %35 = add nsw i32 %34, 4
  store volatile i32 %35, i32* @g_3, align 4
  br label %12

; <label>:36                                      ; preds = %12
  %37 = load volatile i32** @g_5, align 8
  %38 = load i32* %37
  %39 = trunc i32 %38 to i16
  %40 = load i32* @g_6, align 4
  %41 = trunc i32 %40 to i16
  %42 = call signext i16 @safe_mod_func_int16_t_s_s(i16 signext %39, i16 signext %41)
  %43 = sext i16 %42 to i32
  %44 = load i32** %l_9, align 8
  %45 = load i32* %44
  %46 = and i32 %45, %43
  store i32 %46, i32* %44
  %47 = load i64* bitcast (%struct.S2* @g_16 to i64*), align 1
  %48 = call i32* @func_11(i32* @g_10, i64 %47, i32* null)
  %49 = load i32*** %l_17, align 8
  store i32* %48, i32** %49
  %50 = load i32*** %l_17, align 8
  %51 = load i32** %50
  %52 = load i32* %51
  ret i32 %52
}

define internal signext i16 @safe_mod_func_int16_t_s_s(i16 signext %si1, i16 signext %si2) nounwind uwtable {
  %1 = alloca i16, align 2
  %2 = alloca i16, align 2
  store i16 %si1, i16* %1, align 2
  store i16 %si2, i16* %2, align 2
  %3 = load i16* %2, align 2
  %4 = sext i16 %3 to i32
  %5 = icmp eq i32 %4, 0
  br i1 %5, label %14, label %6

; <label>:6                                       ; preds = %0
  %7 = load i16* %1, align 2
  %8 = sext i16 %7 to i32
  %9 = icmp eq i32 %8, -32768
  br i1 %9, label %10, label %17

; <label>:10                                      ; preds = %6
  %11 = load i16* %2, align 2
  %12 = sext i16 %11 to i32
  %13 = icmp eq i32 %12, -1
  br i1 %13, label %14, label %17

; <label>:14                                      ; preds = %10, %0
  %15 = load i16* %1, align 2
  %16 = sext i16 %15 to i32
  br label %23

; <label>:17                                      ; preds = %10, %6
  %18 = load i16* %1, align 2
  %19 = sext i16 %18 to i32
  %20 = load i16* %2, align 2
  %21 = sext i16 %20 to i32
  %22 = srem i32 %19, %21
  br label %23

; <label>:23                                      ; preds = %17, %14
  %24 = phi i32 [ %16, %14 ], [ %22, %17 ]
  %25 = trunc i32 %24 to i16
  ret i16 %25
}

define i32* @func_11(i32* %p_12, i64 %p_13.coerce, i32* %p_14) nounwind uwtable {
  %1 = alloca i32*, align 8
  %p_13 = alloca %struct.S2, align 8
  %2 = alloca i32*, align 8
  %l_15 = alloca i32*, align 8
  store i32* %p_12, i32** %1, align 8
  %3 = bitcast %struct.S2* %p_13 to i64*
  store i64 %p_13.coerce, i64* %3
  store i32* %p_14, i32** %2, align 8
  store i32* @g_6, i32** %l_15, align 8
  %4 = load i32** %l_15, align 8
  ret i32* %4
}

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  %4 = call i32 @func_1()
  %5 = load volatile i32* @g_3, align 4
  %6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %5)
  %7 = load i32* @g_6, align 4
  %8 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str1, i32 0, i32 0), i32 %7)
  %9 = load i32* @g_10, align 4
  %10 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str2, i32 0, i32 0), i32 %9)
  %11 = load i32* getelementptr inbounds (%struct.S2* @g_16, i32 0, i32 0), align 4
  %12 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str3, i32 0, i32 0), i32 %11)
  %13 = load i32* getelementptr inbounds (%struct.S2* @g_16, i32 0, i32 1), align 4
  %14 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str4, i32 0, i32 0), i32 %13)
  %15 = load i32* %1
  ret i32 %15
}

declare i32 @printf(i8*, ...)
