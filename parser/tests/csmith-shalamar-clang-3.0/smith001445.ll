; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith001445.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = global i32 0, align 4
@g_12 = global i32* @g_2, align 8
@func_1.l_10 = internal constant [8 x [7 x i8]] [[7 x i8] c"\01\01\01\01\01\01\01", [7 x i8] c"\01\01\01\01\01\01\01", [7 x i8] c"\01\01\01\01\01\01\01", [7 x i8] c"\01\01\01\01\01\01\01", [7 x i8] c"\01\01\01\01\01\01\01", [7 x i8] c"\01\01\01\01\01\01\01", [7 x i8] c"\01\01\01\01\01\01\01", [7 x i8] c"\01\01\01\01\01\01\01"], align 16
@.str = private unnamed_addr constant [19 x i8] c"checksum g_2 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i64 @func_1() nounwind uwtable {
  %l_9 = alloca i16, align 2
  %l_11 = alloca [10 x i32], align 16
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %l_15 = alloca i32*, align 8
  store i16 29887, i16* %l_9, align 2
  store i32 0, i32* @g_2, align 4
  br label %1

; <label>:1                                       ; preds = %35, %0
  %2 = load i32* @g_2, align 4
  %3 = icmp sle i32 %2, -30
  br i1 %3, label %4, label %40

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
  %11 = getelementptr inbounds [10 x i32]* %l_11, i32 0, i64 %10
  store i32 0, i32* %11, align 4
  br label %12

; <label>:12                                      ; preds = %8
  %13 = load i32* %i, align 4
  %14 = add nsw i32 %13, 1
  store i32 %14, i32* %i, align 4
  br label %5

; <label>:15                                      ; preds = %5
  %16 = load i16* %l_9, align 2
  %17 = load i8* getelementptr inbounds ([8 x [7 x i8]]* @func_1.l_10, i32 0, i64 0, i64 2), align 1
  %18 = zext i8 %17 to i16
  %19 = call zeroext i16 @safe_mul_func_uint16_t_u_u(i16 zeroext %16, i16 zeroext %18)
  %20 = trunc i16 %19 to i8
  %21 = call signext i8 @safe_lshift_func_int8_t_s_s(i8 signext %20, i32 1407552508)
  %22 = sext i8 %21 to i32
  %23 = getelementptr inbounds [10 x i32]* %l_11, i32 0, i64 7
  %24 = load i32* %23, align 4
  %25 = load i32* @g_2, align 4
  %26 = icmp ugt i32 %24, %25
  %27 = zext i1 %26 to i32
  %28 = icmp sge i32 %22, %27
  %29 = zext i1 %28 to i32
  %30 = load i16* %l_9, align 2
  %31 = sext i16 %30 to i32
  %32 = icmp sgt i32 %29, %31
  %33 = zext i1 %32 to i32
  %34 = load volatile i32** @g_12, align 8
  store i32 %33, i32* %34
  br label %35

; <label>:35                                      ; preds = %15
  %36 = load i32* @g_2, align 4
  %37 = sext i32 %36 to i64
  %38 = call i64 @safe_sub_func_uint64_t_u_u(i64 %37, i64 2)
  %39 = trunc i64 %38 to i32
  store i32 %39, i32* @g_2, align 4
  br label %1

; <label>:40                                      ; preds = %1
  store i32 3, i32* @g_2, align 4
  br label %41

; <label>:41                                      ; preds = %60, %40
  %42 = load i32* @g_2, align 4
  %43 = icmp sgt i32 %42, 20
  br i1 %43, label %44, label %65

; <label>:44                                      ; preds = %41
  store i32* @g_2, i32** %l_15, align 8
  %45 = load i32** %l_15, align 8
  store i32 4, i32* %45
  %46 = call i32 @func_18(i8 zeroext -5)
  %47 = sext i32 %46 to i64
  %48 = load volatile i32** @g_12, align 8
  %49 = load i32* %48
  %50 = sext i32 %49 to i64
  %51 = call i64 @safe_div_func_uint64_t_u_u(i64 %47, i64 %50)
  %52 = load i32** %l_15, align 8
  %53 = load i32* %52
  %54 = trunc i32 %53 to i8
  %55 = call signext i8 @safe_rshift_func_int8_t_s_s(i8 signext %54, i32 -995590194)
  %56 = sext i8 %55 to i64
  %57 = icmp uge i64 %51, %56
  %58 = zext i1 %57 to i32
  %59 = load i32** %l_15, align 8
  store i32 %58, i32* %59
  br label %60

; <label>:60                                      ; preds = %44
  %61 = load i32* @g_2, align 4
  %62 = sext i32 %61 to i64
  %63 = call i64 @safe_sub_func_int64_t_s_s(i64 %62, i64 1)
  %64 = trunc i64 %63 to i32
  store i32 %64, i32* @g_2, align 4
  br label %41

; <label>:65                                      ; preds = %41
  %66 = load i32* @g_2, align 4
  %67 = sext i32 %66 to i64
  ret i64 %67
}

define internal signext i8 @safe_lshift_func_int8_t_s_s(i8 signext %left, i32 %right) nounwind uwtable {
  %1 = alloca i8, align 1
  %2 = alloca i32, align 4
  store i8 %left, i8* %1, align 1
  store i32 %right, i32* %2, align 4
  %3 = load i8* %1, align 1
  %4 = sext i8 %3 to i32
  %5 = icmp slt i32 %4, 0
  br i1 %5, label %18, label %6

; <label>:6                                       ; preds = %0
  %7 = load i32* %2, align 4
  %8 = icmp slt i32 %7, 0
  br i1 %8, label %18, label %9

; <label>:9                                       ; preds = %6
  %10 = load i32* %2, align 4
  %11 = icmp sge i32 %10, 32
  br i1 %11, label %18, label %12

; <label>:12                                      ; preds = %9
  %13 = load i8* %1, align 1
  %14 = sext i8 %13 to i32
  %15 = load i32* %2, align 4
  %16 = ashr i32 127, %15
  %17 = icmp sgt i32 %14, %16
  br i1 %17, label %18, label %21

; <label>:18                                      ; preds = %12, %9, %6, %0
  %19 = load i8* %1, align 1
  %20 = sext i8 %19 to i32
  br label %26

; <label>:21                                      ; preds = %12
  %22 = load i8* %1, align 1
  %23 = sext i8 %22 to i32
  %24 = load i32* %2, align 4
  %25 = shl i32 %23, %24
  br label %26

; <label>:26                                      ; preds = %21, %18
  %27 = phi i32 [ %20, %18 ], [ %25, %21 ]
  %28 = trunc i32 %27 to i8
  ret i8 %28
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

define internal i64 @safe_div_func_uint64_t_u_u(i64 %ui1, i64 %ui2) nounwind uwtable {
  %1 = alloca i64, align 8
  %2 = alloca i64, align 8
  store i64 %ui1, i64* %1, align 8
  store i64 %ui2, i64* %2, align 8
  %3 = load i64* %2, align 8
  %4 = icmp eq i64 %3, 0
  br i1 %4, label %5, label %7

; <label>:5                                       ; preds = %0
  %6 = load i64* %1, align 8
  br label %11

; <label>:7                                       ; preds = %0
  %8 = load i64* %1, align 8
  %9 = load i64* %2, align 8
  %10 = udiv i64 %8, %9
  br label %11

; <label>:11                                      ; preds = %7, %5
  %12 = phi i64 [ %6, %5 ], [ %10, %7 ]
  ret i64 %12
}

define i32 @func_18(i8 zeroext %p_19) nounwind uwtable {
  %1 = alloca i8, align 1
  %l_20 = alloca i8, align 1
  store i8 %p_19, i8* %1, align 1
  store i8 -120, i8* %l_20, align 1
  %2 = load i8* %l_20, align 1
  %3 = sext i8 %2 to i32
  ret i32 %3
}

define internal signext i8 @safe_rshift_func_int8_t_s_s(i8 signext %left, i32 %right) nounwind uwtable {
  %1 = alloca i8, align 1
  %2 = alloca i32, align 4
  store i8 %left, i8* %1, align 1
  store i32 %right, i32* %2, align 4
  %3 = load i8* %1, align 1
  %4 = sext i8 %3 to i32
  %5 = icmp slt i32 %4, 0
  br i1 %5, label %12, label %6

; <label>:6                                       ; preds = %0
  %7 = load i32* %2, align 4
  %8 = icmp slt i32 %7, 0
  br i1 %8, label %12, label %9

; <label>:9                                       ; preds = %6
  %10 = load i32* %2, align 4
  %11 = icmp sge i32 %10, 32
  br i1 %11, label %12, label %15

; <label>:12                                      ; preds = %9, %6, %0
  %13 = load i8* %1, align 1
  %14 = sext i8 %13 to i32
  br label %20

; <label>:15                                      ; preds = %9
  %16 = load i8* %1, align 1
  %17 = sext i8 %16 to i32
  %18 = load i32* %2, align 4
  %19 = ashr i32 %17, %18
  br label %20

; <label>:20                                      ; preds = %15, %12
  %21 = phi i32 [ %14, %12 ], [ %19, %15 ]
  %22 = trunc i32 %21 to i8
  ret i8 %22
}

define internal i64 @safe_sub_func_int64_t_s_s(i64 %si1, i64 %si2) nounwind uwtable {
  %1 = alloca i64, align 8
  %2 = alloca i64, align 8
  store i64 %si1, i64* %1, align 8
  store i64 %si2, i64* %2, align 8
  %3 = load i64* %1, align 8
  %4 = load i64* %2, align 8
  %5 = xor i64 %3, %4
  %6 = load i64* %1, align 8
  %7 = load i64* %1, align 8
  %8 = load i64* %2, align 8
  %9 = xor i64 %7, %8
  %10 = and i64 %9, -9223372036854775808
  %11 = xor i64 %6, %10
  %12 = load i64* %2, align 8
  %13 = sub nsw i64 %11, %12
  %14 = load i64* %2, align 8
  %15 = xor i64 %13, %14
  %16 = and i64 %5, %15
  %17 = icmp slt i64 %16, 0
  br i1 %17, label %18, label %20

; <label>:18                                      ; preds = %0
  %19 = load i64* %1, align 8
  br label %24

; <label>:20                                      ; preds = %0
  %21 = load i64* %1, align 8
  %22 = load i64* %2, align 8
  %23 = sub nsw i64 %21, %22
  br label %24

; <label>:24                                      ; preds = %20, %18
  %25 = phi i64 [ %19, %18 ], [ %23, %20 ]
  ret i64 %25
}

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  %4 = call i64 @func_1()
  %5 = load i32* @g_2, align 4
  %6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %5)
  %7 = load i32* %1
  ret i32 %7
}

declare i32 @printf(i8*, ...)
