; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith001570.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = global i32 0, align 4
@g_5 = global i16 -1, align 2
@g_7 = global i32 1, align 4
@.str = private unnamed_addr constant [19 x i8] c"checksum g_2 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [19 x i8] c"checksum g_5 = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [19 x i8] c"checksum g_7 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define zeroext i8 @func_1() nounwind uwtable {
  %l_10 = alloca i8, align 1
  %l_11 = alloca [7 x [8 x i32*]], align 16
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %l_6 = alloca i32*, align 8
  store i8 0, i8* %l_10, align 1
  store i32 0, i32* %i, align 4
  br label %1

; <label>:1                                       ; preds = %19, %0
  %2 = load i32* %i, align 4
  %3 = icmp slt i32 %2, 7
  br i1 %3, label %4, label %22

; <label>:4                                       ; preds = %1
  store i32 0, i32* %j, align 4
  br label %5

; <label>:5                                       ; preds = %15, %4
  %6 = load i32* %j, align 4
  %7 = icmp slt i32 %6, 8
  br i1 %7, label %8, label %18

; <label>:8                                       ; preds = %5
  %9 = load i32* %j, align 4
  %10 = sext i32 %9 to i64
  %11 = load i32* %i, align 4
  %12 = sext i32 %11 to i64
  %13 = getelementptr inbounds [7 x [8 x i32*]]* %l_11, i32 0, i64 %12
  %14 = getelementptr inbounds [8 x i32*]* %13, i32 0, i64 %10
  store i32* @g_7, i32** %14, align 8
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
  store volatile i32 4, i32* @g_2, align 4
  br label %23

; <label>:23                                      ; preds = %42, %22
  %24 = load volatile i32* @g_2, align 4
  %25 = icmp slt i32 %24, -14
  br i1 %25, label %26, label %45

; <label>:26                                      ; preds = %23
  store i32* @g_7, i32** %l_6, align 8
  %27 = load volatile i32* @g_2, align 4
  %28 = sext i32 %27 to i64
  %29 = load i16* @g_5, align 2
  %30 = sext i16 %29 to i64
  %31 = xor i64 3647139437, %30
  %32 = icmp ne i64 %28, %31
  %33 = zext i1 %32 to i32
  %34 = load i32** %l_6, align 8
  %35 = load i32* %34
  %36 = or i32 %35, %33
  store i32 %36, i32* %34
  %37 = load i32** %l_6, align 8
  %38 = load i32* %37
  %39 = icmp ne i32 %38, 0
  br i1 %39, label %40, label %41

; <label>:40                                      ; preds = %26
  br label %42

; <label>:41                                      ; preds = %26
  br label %42

; <label>:42                                      ; preds = %41, %40
  %43 = load volatile i32* @g_2, align 4
  %44 = call i32 @safe_add_func_int32_t_s_s(i32 %43, i32 1)
  store volatile i32 %44, i32* @g_2, align 4
  br label %23

; <label>:45                                      ; preds = %23
  %46 = load i8* %l_10, align 1
  %47 = sext i8 %46 to i64
  %48 = call i64 @safe_sub_func_uint64_t_u_u(i64 0, i64 %47)
  %49 = load volatile i32* @g_2, align 4
  %50 = sext i32 %49 to i64
  %51 = and i64 %50, %48
  %52 = trunc i64 %51 to i32
  store volatile i32 %52, i32* @g_2, align 4
  %53 = load i16* @g_5, align 2
  %54 = trunc i16 %53 to i8
  ret i8 %54
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

define internal i64 @safe_sub_func_uint64_t_u_u(i64 %ui1, i64 %ui2) nounwind uwtable {
  %1 = alloca i64, align 8
  %2 = alloca i64, align 8
  store i64 %ui1, i64* %1, align 8
  store i64 %ui2, i64* %2, align 8
  %3 = load i64* %1, align 8
  %4 = load i64* %2, align 8
  %5 = sub i64 %3, %4
  ret i64 %5
}

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  %4 = call zeroext i8 @func_1()
  %5 = load volatile i32* @g_2, align 4
  %6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %5)
  %7 = load i16* @g_5, align 2
  %8 = sext i16 %7 to i32
  %9 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str1, i32 0, i32 0), i32 %8)
  %10 = load i32* @g_7, align 4
  %11 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str2, i32 0, i32 0), i32 %10)
  %12 = load i32* %1
  ret i32 %12
}

declare i32 @printf(i8*, ...)
