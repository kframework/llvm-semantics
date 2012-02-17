; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith001755.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = global i32 29202344, align 4
@g_7 = global i32 886614347, align 4
@.str = private unnamed_addr constant [19 x i8] c"checksum g_2 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [19 x i8] c"checksum g_7 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define zeroext i16 @func_1() nounwind uwtable {
  %l_8 = alloca i64, align 8
  %l_13 = alloca i32*, align 8
  %l_17 = alloca i64, align 8
  %l_5 = alloca [10 x i16], align 16
  %i = alloca i32, align 4
  %l_6 = alloca [6 x i32*], align 16
  %i1 = alloca i32, align 4
  store i64 -6, i64* %l_8, align 8
  store i32* @g_7, i32** %l_13, align 8
  store i64 3277427911883911173, i64* %l_17, align 8
  store i32 -4, i32* @g_2, align 4
  br label %1

; <label>:1                                       ; preds = %43, %0
  %2 = load i32* @g_2, align 4
  %3 = icmp eq i32 %2, -8
  br i1 %3, label %4, label %48

; <label>:4                                       ; preds = %1
  store i32 0, i32* %i, align 4
  br label %5

; <label>:5                                       ; preds = %12, %4
  %6 = load i32* %i, align 4
  %7 = icmp slt i32 %6, 10
  br i1 %7, label %8, label %15

; <label>:8                                       ; preds = %5
  %9 = load i32* %i, align 4
  %10 = sext i32 %9 to i64
  %11 = getelementptr inbounds [10 x i16]* %l_5, i32 0, i64 %10
  store i16 -19035, i16* %11, align 2
  br label %12

; <label>:12                                      ; preds = %8
  %13 = load i32* %i, align 4
  %14 = add nsw i32 %13, 1
  store i32 %14, i32* %i, align 4
  br label %5

; <label>:15                                      ; preds = %5
  store i32 6, i32* @g_2, align 4
  br label %16

; <label>:16                                      ; preds = %35, %15
  %17 = load i32* @g_2, align 4
  %18 = icmp sge i32 %17, 0
  br i1 %18, label %19, label %38

; <label>:19                                      ; preds = %16
  store i32 0, i32* %i1, align 4
  br label %20

; <label>:20                                      ; preds = %27, %19
  %21 = load i32* %i1, align 4
  %22 = icmp slt i32 %21, 6
  br i1 %22, label %23, label %30

; <label>:23                                      ; preds = %20
  %24 = load i32* %i1, align 4
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds [6 x i32*]* %l_6, i32 0, i64 %25
  store i32* @g_7, i32** %26, align 8
  br label %27

; <label>:27                                      ; preds = %23
  %28 = load i32* %i1, align 4
  %29 = add nsw i32 %28, 1
  store i32 %29, i32* %i1, align 4
  br label %20

; <label>:30                                      ; preds = %20
  %31 = load i32* @g_2, align 4
  %32 = sext i32 %31 to i64
  %33 = load i64* %l_8, align 8
  %34 = and i64 %33, %32
  store i64 %34, i64* %l_8, align 8
  br label %35

; <label>:35                                      ; preds = %30
  %36 = load i32* @g_2, align 4
  %37 = add nsw i32 %36, -7
  store i32 %37, i32* @g_2, align 4
  br label %16

; <label>:38                                      ; preds = %16
  %39 = load i32* @g_2, align 4
  %40 = icmp ne i32 %39, 0
  br i1 %40, label %41, label %42

; <label>:41                                      ; preds = %38
  br label %49

; <label>:42                                      ; preds = %38
  br label %43

; <label>:43                                      ; preds = %42
  %44 = load i32* @g_2, align 4
  %45 = trunc i32 %44 to i16
  %46 = call zeroext i16 @safe_add_func_uint16_t_u_u(i16 zeroext %45, i16 zeroext 3)
  %47 = zext i16 %46 to i32
  store i32 %47, i32* @g_2, align 4
  br label %1

; <label>:48                                      ; preds = %1
  br label %49

; <label>:49                                      ; preds = %48, %41
  %50 = load i64* %l_8, align 8
  %51 = trunc i64 %50 to i8
  %52 = load i32** %l_13, align 8
  %53 = call i32* @func_9(i8 zeroext %51, i32* @g_7, i32* %52)
  store i32* %53, i32** %l_13, align 8
  %54 = call zeroext i16 @safe_mul_func_uint16_t_u_u(i16 zeroext 30461, i16 zeroext 28677)
  %55 = zext i16 %54 to i32
  %56 = load i32** %l_13, align 8
  store i32 %55, i32* %56
  %57 = load i32** %l_13, align 8
  %58 = load i32* %57
  %59 = trunc i32 %58 to i16
  ret i16 %59
}

define internal zeroext i16 @safe_add_func_uint16_t_u_u(i16 zeroext %ui1, i16 zeroext %ui2) nounwind uwtable {
  %1 = alloca i16, align 2
  %2 = alloca i16, align 2
  store i16 %ui1, i16* %1, align 2
  store i16 %ui2, i16* %2, align 2
  %3 = load i16* %1, align 2
  %4 = zext i16 %3 to i32
  %5 = load i16* %2, align 2
  %6 = zext i16 %5 to i32
  %7 = add nsw i32 %4, %6
  %8 = trunc i32 %7 to i16
  ret i16 %8
}

define i32* @func_9(i8 zeroext %p_10, i32* %p_11, i32* %p_12) nounwind uwtable {
  %1 = alloca i8, align 1
  %2 = alloca i32*, align 8
  %3 = alloca i32*, align 8
  store i8 %p_10, i8* %1, align 1
  store i32* %p_11, i32** %2, align 8
  store i32* %p_12, i32** %3, align 8
  ret i32* @g_2
}

define internal zeroext i16 @safe_mul_func_uint16_t_u_u(i16 zeroext %ui1, i16 zeroext %ui2) nounwind uwtable {
  %1 = alloca i16, align 2
  %2 = alloca i16, align 2
  store i16 %ui1, i16* %1, align 2
  store i16 %ui2, i16* %2, align 2
  %3 = load i16* %1, align 2
  %4 = zext i16 %3 to i32
  %5 = load i16* %2, align 2
  %6 = zext i16 %5 to i32
  %7 = mul i32 %4, %6
  %8 = trunc i32 %7 to i16
  ret i16 %8
}

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  %4 = call zeroext i16 @func_1()
  %5 = load i32* @g_2, align 4
  %6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %5)
  %7 = load i32* @g_7, align 4
  %8 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str1, i32 0, i32 0), i32 %7)
  %9 = load i32* %1
  ret i32 %9
}

declare i32 @printf(i8*, ...)
