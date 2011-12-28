; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith001913.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_4 = global i16 -1, align 2
@g_13 = constant i8 -72, align 1
@g_17 = global i8 35, align 1
@.str = private unnamed_addr constant [19 x i8] c"checksum g_4 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [20 x i8] c"checksum g_13 = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [20 x i8] c"checksum g_17 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define zeroext i16 @func_1() nounwind uwtable {
  %l_14 = alloca i32, align 4
  %l_15 = alloca [5 x i32], align 16
  %l_16 = alloca [3 x [10 x i8]], align 16
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 0, i32* %l_14, align 4
  store i32 0, i32* %i, align 4
  br label %1

; <label>:1                                       ; preds = %8, %0
  %2 = load i32* %i, align 4
  %3 = icmp slt i32 %2, 5
  br i1 %3, label %4, label %11

; <label>:4                                       ; preds = %1
  %5 = load i32* %i, align 4
  %6 = sext i32 %5 to i64
  %7 = getelementptr inbounds [5 x i32]* %l_15, i32 0, i64 %6
  store i32 317967570, i32* %7, align 4
  br label %8

; <label>:8                                       ; preds = %4
  %9 = load i32* %i, align 4
  %10 = add nsw i32 %9, 1
  store i32 %10, i32* %i, align 4
  br label %1

; <label>:11                                      ; preds = %1
  store i32 0, i32* %i, align 4
  br label %12

; <label>:12                                      ; preds = %30, %11
  %13 = load i32* %i, align 4
  %14 = icmp slt i32 %13, 3
  br i1 %14, label %15, label %33

; <label>:15                                      ; preds = %12
  store i32 0, i32* %j, align 4
  br label %16

; <label>:16                                      ; preds = %26, %15
  %17 = load i32* %j, align 4
  %18 = icmp slt i32 %17, 10
  br i1 %18, label %19, label %29

; <label>:19                                      ; preds = %16
  %20 = load i32* %j, align 4
  %21 = sext i32 %20 to i64
  %22 = load i32* %i, align 4
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds [3 x [10 x i8]]* %l_16, i32 0, i64 %23
  %25 = getelementptr inbounds [10 x i8]* %24, i32 0, i64 %21
  store i8 -9, i8* %25, align 1
  br label %26

; <label>:26                                      ; preds = %19
  %27 = load i32* %j, align 4
  %28 = add nsw i32 %27, 1
  store i32 %28, i32* %j, align 4
  br label %16

; <label>:29                                      ; preds = %16
  br label %30

; <label>:30                                      ; preds = %29
  %31 = load i32* %i, align 4
  %32 = add nsw i32 %31, 1
  store i32 %32, i32* %i, align 4
  br label %12

; <label>:33                                      ; preds = %12
  %34 = load volatile i16* @g_4, align 2
  %35 = zext i16 %34 to i32
  %36 = call i32 @func_7(i8 zeroext -72, i32 -72, i32 -72, i16 zeroext -72)
  %37 = trunc i32 %36 to i8
  %38 = load i32* %l_14, align 4
  %39 = icmp ne i32 %38, 0
  %40 = zext i1 %39 to i32
  %41 = trunc i32 %40 to i8
  %42 = call signext i8 @safe_mod_func_int8_t_s_s(i8 signext %37, i8 signext %41)
  %43 = sext i8 %42 to i32
  %44 = load i32* %l_14, align 4
  %45 = trunc i32 %44 to i8
  %46 = load i32* %l_14, align 4
  %47 = call i32 @func_7(i8 zeroext %45, i32 -72, i32 %46, i16 zeroext -72)
  %48 = icmp slt i32 -72, %47
  %49 = zext i1 %48 to i32
  %50 = icmp sgt i32 %43, %49
  %51 = zext i1 %50 to i32
  %52 = icmp sle i32 %35, %51
  %53 = zext i1 %52 to i32
  %54 = getelementptr inbounds [5 x i32]* %l_15, i32 0, i64 3
  %55 = load i32* %54, align 4
  %56 = and i32 %53, %55
  %57 = trunc i32 %56 to i8
  %58 = getelementptr inbounds [3 x [10 x i8]]* %l_16, i32 0, i64 0
  %59 = getelementptr inbounds [10 x i8]* %58, i32 0, i64 6
  %60 = load i8* %59, align 1
  %61 = call zeroext i8 @safe_add_func_uint8_t_u_u(i8 zeroext %57, i8 zeroext %60)
  %62 = zext i8 %61 to i32
  %63 = load i8* @g_17, align 1
  %64 = sext i8 %63 to i32
  %65 = or i32 %64, %62
  %66 = trunc i32 %65 to i8
  store i8 %66, i8* @g_17, align 1
  %67 = getelementptr inbounds [3 x [10 x i8]]* %l_16, i32 0, i64 0
  %68 = getelementptr inbounds [10 x i8]* %67, i32 0, i64 6
  %69 = load i8* %68, align 1
  %70 = zext i8 %69 to i16
  ret i16 %70
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

define internal signext i8 @safe_mod_func_int8_t_s_s(i8 signext %si1, i8 signext %si2) nounwind uwtable {
  %1 = alloca i8, align 1
  %2 = alloca i8, align 1
  store i8 %si1, i8* %1, align 1
  store i8 %si2, i8* %2, align 1
  %3 = load i8* %2, align 1
  %4 = sext i8 %3 to i32
  %5 = icmp eq i32 %4, 0
  br i1 %5, label %14, label %6

; <label>:6                                       ; preds = %0
  %7 = load i8* %1, align 1
  %8 = sext i8 %7 to i32
  %9 = icmp eq i32 %8, -128
  br i1 %9, label %10, label %17

; <label>:10                                      ; preds = %6
  %11 = load i8* %2, align 1
  %12 = sext i8 %11 to i32
  %13 = icmp eq i32 %12, -1
  br i1 %13, label %14, label %17

; <label>:14                                      ; preds = %10, %0
  %15 = load i8* %1, align 1
  %16 = sext i8 %15 to i32
  br label %23

; <label>:17                                      ; preds = %10, %6
  %18 = load i8* %1, align 1
  %19 = sext i8 %18 to i32
  %20 = load i8* %2, align 1
  %21 = sext i8 %20 to i32
  %22 = srem i32 %19, %21
  br label %23

; <label>:23                                      ; preds = %17, %14
  %24 = phi i32 [ %16, %14 ], [ %22, %17 ]
  %25 = trunc i32 %24 to i8
  ret i8 %25
}

define i32 @func_7(i8 zeroext %p_8, i32 %p_9, i32 %p_10, i16 zeroext %p_11) nounwind uwtable {
  %1 = alloca i8, align 1
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i16, align 2
  %l_12 = alloca i8, align 1
  store i8 %p_8, i8* %1, align 1
  store i32 %p_9, i32* %2, align 4
  store i32 %p_10, i32* %3, align 4
  store i16 %p_11, i16* %4, align 2
  store i8 -7, i8* %l_12, align 1
  %5 = load i8* %l_12, align 1
  %6 = zext i8 %5 to i32
  ret i32 %6
}

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  %4 = call zeroext i16 @func_1()
  %5 = load volatile i16* @g_4, align 2
  %6 = zext i16 %5 to i32
  %7 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %6)
  %8 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str1, i32 0, i32 0), i32 -72)
  %9 = load i8* @g_17, align 1
  %10 = sext i8 %9 to i32
  %11 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str2, i32 0, i32 0), i32 %10)
  %12 = load i32* %1
  ret i32 %12
}

declare i32 @printf(i8*, ...)
