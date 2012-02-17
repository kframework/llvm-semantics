; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith000854.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_6 = global i32 1, align 4
@g_8 = global i8 1, align 1
@.str = private unnamed_addr constant [19 x i8] c"checksum g_6 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [19 x i8] c"checksum g_8 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable {
  %l_7 = alloca i64, align 8
  %l_17 = alloca [5 x i32], align 16
  %l_18 = alloca i32, align 4
  %i = alloca i32, align 4
  store i64 -6687895123765336682, i64* %l_7, align 8
  store i32 1, i32* %l_18, align 4
  store i32 0, i32* %i, align 4
  br label %1

; <label>:1                                       ; preds = %8, %0
  %2 = load i32* %i, align 4
  %3 = icmp slt i32 %2, 5
  br i1 %3, label %4, label %11

; <label>:4                                       ; preds = %1
  %5 = load i32* %i, align 4
  %6 = sext i32 %5 to i64
  %7 = getelementptr inbounds [5 x i32]* %l_17, i32 0, i64 %6
  store i32 1430242041, i32* %7, align 4
  br label %8

; <label>:8                                       ; preds = %4
  %9 = load i32* %i, align 4
  %10 = add nsw i32 %9, 1
  store i32 %10, i32* %i, align 4
  br label %1

; <label>:11                                      ; preds = %1
  %12 = load volatile i32* @g_6, align 4
  %13 = trunc i32 %12 to i16
  %14 = load i64* %l_7, align 8
  %15 = icmp ne i64 %14, 0
  br i1 %15, label %16, label %19

; <label>:16                                      ; preds = %11
  %17 = load i64* %l_7, align 8
  %18 = icmp ne i64 %17, 0
  br label %19

; <label>:19                                      ; preds = %16, %11
  %20 = phi i1 [ false, %11 ], [ %18, %16 ]
  %21 = zext i1 %20 to i32
  %22 = trunc i32 %21 to i16
  %23 = call zeroext i16 @safe_mul_func_uint16_t_u_u(i16 zeroext %13, i16 zeroext %22)
  %24 = zext i16 %23 to i32
  %25 = load i8* @g_8, align 1
  %26 = sext i8 %25 to i32
  %27 = icmp eq i32 %24, %26
  %28 = zext i1 %27 to i32
  %29 = load i64* %l_7, align 8
  %30 = load i8* @g_8, align 1
  %31 = icmp ne i8 %30, 0
  %32 = xor i1 %31, true
  %33 = zext i1 %32 to i32
  %34 = sext i32 %33 to i64
  %35 = icmp ne i64 %29, %34
  %36 = zext i1 %35 to i32
  %37 = load i8* @g_8, align 1
  %38 = sext i8 %37 to i32
  %39 = and i32 %36, %38
  %40 = xor i32 %28, %39
  %41 = load i64* %l_7, align 8
  %42 = load i8* @g_8, align 1
  %43 = sext i8 %42 to i64
  %44 = xor i64 %41, %43
  %45 = trunc i64 %44 to i16
  %46 = load i8* @g_8, align 1
  %47 = sext i8 %46 to i32
  %48 = call signext i16 @safe_rshift_func_int16_t_s_u(i16 signext %45, i32 %47)
  %49 = sext i16 %48 to i32
  %50 = load i64* %l_7, align 8
  %51 = trunc i64 %50 to i32
  %52 = load i64* %l_7, align 8
  %53 = trunc i64 %52 to i32
  %54 = call i32 @safe_add_func_int32_t_s_s(i32 %51, i32 %53)
  %55 = getelementptr inbounds [5 x i32]* %l_17, i32 0, i64 4
  %56 = load i32* %55, align 4
  %57 = call i32 @safe_div_func_uint32_t_u_u(i32 %54, i32 %56)
  %58 = and i32 %49, %57
  %59 = trunc i32 %58 to i8
  %60 = getelementptr inbounds [5 x i32]* %l_17, i32 0, i64 3
  %61 = load i32* %60, align 4
  %62 = trunc i32 %61 to i8
  %63 = call signext i8 @safe_div_func_int8_t_s_s(i8 signext %59, i8 signext %62)
  %64 = sext i8 %63 to i32
  %65 = icmp ne i32 %40, %64
  %66 = zext i1 %65 to i32
  %67 = sext i32 %66 to i64
  %68 = call i64 @safe_sub_func_uint64_t_u_u(i64 %67, i64 -4)
  %69 = load i32* %l_18, align 4
  %70 = sext i32 %69 to i64
  %71 = or i64 %70, %68
  %72 = trunc i64 %71 to i32
  store i32 %72, i32* %l_18, align 4
  %73 = load i32* %l_18, align 4
  ret i32 %73
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

define internal signext i8 @safe_div_func_int8_t_s_s(i8 signext %si1, i8 signext %si2) nounwind uwtable {
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
  %22 = sdiv i32 %19, %21
  br label %23

; <label>:23                                      ; preds = %17, %14
  %24 = phi i32 [ %16, %14 ], [ %22, %17 ]
  %25 = trunc i32 %24 to i8
  ret i8 %25
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

define internal i32 @safe_div_func_uint32_t_u_u(i32 %ui1, i32 %ui2) nounwind uwtable {
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
  %10 = udiv i32 %8, %9
  br label %11

; <label>:11                                      ; preds = %7, %5
  %12 = phi i32 [ %6, %5 ], [ %10, %7 ]
  ret i32 %12
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
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  %4 = call i32 @func_1()
  %5 = load volatile i32* @g_6, align 4
  %6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %5)
  %7 = load i8* @g_8, align 1
  %8 = sext i8 %7 to i32
  %9 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str1, i32 0, i32 0), i32 %8)
  %10 = load i32* %1
  ret i32 %10
}

declare i32 @printf(i8*, ...)
