; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith001136.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = global i32 1, align 4
@g_15 = global i32 -1697824616, align 4
@g_14 = global i32* @g_15, align 8
@g_16 = global i32* null, align 8
@.str = private unnamed_addr constant [19 x i8] c"checksum g_2 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [20 x i8] c"checksum g_15 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define signext i8 @func_1() nounwind uwtable {
  %1 = alloca i8, align 1
  %l_20 = alloca i32, align 4
  %l_11 = alloca i32, align 4
  %l_17 = alloca i32*, align 8
  %l_18 = alloca i32*, align 8
  store i32 2058918877, i32* %l_20, align 4
  store i32 17, i32* @g_2, align 4
  br label %2

; <label>:2                                       ; preds = %48, %0
  %3 = load i32* @g_2, align 4
  %4 = icmp sgt i32 %3, 16
  br i1 %4, label %5, label %51

; <label>:5                                       ; preds = %2
  store i32 4, i32* %l_11, align 4
  store i32* null, i32** %l_17, align 8
  store i32* @g_15, i32** %l_18, align 8
  %6 = load i32* @g_2, align 4
  %7 = trunc i32 %6 to i16
  %8 = load i32* @g_2, align 4
  %9 = load i32* @g_2, align 4
  %10 = icmp sle i32 %8, %9
  br i1 %10, label %19, label %11

; <label>:11                                      ; preds = %5
  %12 = load i32* @g_2, align 4
  %13 = trunc i32 %12 to i16
  %14 = load i32* @g_2, align 4
  %15 = trunc i32 %14 to i16
  %16 = call zeroext i16 @safe_mul_func_uint16_t_u_u(i16 zeroext %13, i16 zeroext %15)
  %17 = zext i16 %16 to i32
  %18 = icmp ne i32 %17, 0
  br label %19

; <label>:19                                      ; preds = %11, %5
  %20 = phi i1 [ true, %5 ], [ %18, %11 ]
  %21 = zext i1 %20 to i32
  %22 = sext i32 %21 to i64
  %23 = icmp sle i64 %22, 2404871249
  %24 = zext i1 %23 to i32
  %25 = load i32* %l_11, align 4
  %26 = and i32 %24, %25
  %27 = load i32* @g_2, align 4
  %28 = trunc i32 %27 to i16
  %29 = call signext i16 @safe_rshift_func_int16_t_s_u(i16 signext %28, i32 1)
  %30 = sext i16 %29 to i32
  %31 = call i32 @safe_add_func_uint32_t_u_u(i32 %26, i32 %30)
  %32 = trunc i32 %31 to i16
  %33 = call signext i16 @safe_mul_func_int16_t_s_s(i16 signext %7, i16 signext %32)
  %34 = sext i16 %33 to i32
  %35 = load volatile i32** @g_14, align 8
  %36 = load i32* %35
  %37 = or i32 %36, %34
  store i32 %37, i32* %35
  %38 = load i32* @g_2, align 4
  %39 = icmp ne i32 %38, 0
  br i1 %39, label %40, label %41

; <label>:40                                      ; preds = %19
  br label %42

; <label>:41                                      ; preds = %19
  br label %42

; <label>:42                                      ; preds = %41, %40
  %43 = load i32** %l_18, align 8
  %44 = load i32* %43
  store i32 %44, i32* %43
  %45 = load i32** %l_18, align 8
  %46 = load i32* %45
  %47 = trunc i32 %46 to i8
  store i8 %47, i8* %1
  br label %54
                                                  ; No predecessors!
  %49 = load i32* @g_2, align 4
  %50 = call i32 @safe_sub_func_int32_t_s_s(i32 %49, i32 1)
  store i32 %50, i32* @g_2, align 4
  br label %2

; <label>:51                                      ; preds = %2
  %52 = load i32* %l_20, align 4
  %53 = trunc i32 %52 to i8
  store i8 %53, i8* %1
  br label %54

; <label>:54                                      ; preds = %51, %42
  %55 = load i8* %1
  ret i8 %55
}

define internal signext i16 @safe_mul_func_int16_t_s_s(i16 signext %si1, i16 signext %si2) nounwind uwtable {
  %1 = alloca i16, align 2
  %2 = alloca i16, align 2
  store i16 %si1, i16* %1, align 2
  store i16 %si2, i16* %2, align 2
  %3 = load i16* %1, align 2
  %4 = sext i16 %3 to i32
  %5 = load i16* %2, align 2
  %6 = sext i16 %5 to i32
  %7 = mul nsw i32 %4, %6
  %8 = trunc i32 %7 to i16
  ret i16 %8
}

define internal i32 @safe_add_func_uint32_t_u_u(i32 %ui1, i32 %ui2) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 %ui1, i32* %1, align 4
  store i32 %ui2, i32* %2, align 4
  %3 = load i32* %1, align 4
  %4 = load i32* %2, align 4
  %5 = add i32 %3, %4
  ret i32 %5
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

define internal i32 @safe_sub_func_int32_t_s_s(i32 %si1, i32 %si2) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 %si1, i32* %1, align 4
  store i32 %si2, i32* %2, align 4
  %3 = load i32* %1, align 4
  %4 = load i32* %2, align 4
  %5 = xor i32 %3, %4
  %6 = load i32* %1, align 4
  %7 = load i32* %1, align 4
  %8 = load i32* %2, align 4
  %9 = xor i32 %7, %8
  %10 = and i32 %9, -2147483648
  %11 = xor i32 %6, %10
  %12 = load i32* %2, align 4
  %13 = sub nsw i32 %11, %12
  %14 = load i32* %2, align 4
  %15 = xor i32 %13, %14
  %16 = and i32 %5, %15
  %17 = icmp slt i32 %16, 0
  br i1 %17, label %18, label %20

; <label>:18                                      ; preds = %0
  %19 = load i32* %1, align 4
  br label %24

; <label>:20                                      ; preds = %0
  %21 = load i32* %1, align 4
  %22 = load i32* %2, align 4
  %23 = sub nsw i32 %21, %22
  br label %24

; <label>:24                                      ; preds = %20, %18
  %25 = phi i32 [ %19, %18 ], [ %23, %20 ]
  ret i32 %25
}

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  %4 = call signext i8 @func_1()
  %5 = load i32* @g_2, align 4
  %6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %5)
  %7 = load i32* @g_15, align 4
  %8 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str1, i32 0, i32 0), i32 %7)
  %9 = load i32* %1
  ret i32 %9
}

declare i32 @printf(i8*, ...)
