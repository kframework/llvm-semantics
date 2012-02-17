; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith001108.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_7 = global [6 x i8] c"\D7\D7\D7\D7\D7\D7", align 1
@g_12 = global i32 1235938667, align 4
@g_11 = global i32* @g_12, align 8
@g_32 = global i32 -1333370477, align 4
@g_42 = global i32 1258680083, align 4
@g_46 = global i32** @g_11, align 8
@.str = private unnamed_addr constant [22 x i8] c"checksum g_7[0] = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [22 x i8] c"checksum g_7[1] = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [22 x i8] c"checksum g_7[2] = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [22 x i8] c"checksum g_7[3] = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [22 x i8] c"checksum g_7[4] = %d\0A\00", align 1
@.str5 = private unnamed_addr constant [22 x i8] c"checksum g_7[5] = %d\0A\00", align 1
@.str6 = private unnamed_addr constant [20 x i8] c"checksum g_12 = %d\0A\00", align 1
@.str7 = private unnamed_addr constant [20 x i8] c"checksum g_32 = %d\0A\00", align 1
@.str8 = private unnamed_addr constant [20 x i8] c"checksum g_42 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable {
  %l_2 = alloca i8, align 1
  %l_44 = alloca i32*, align 8
  %i = alloca i32, align 4
  %l_45 = alloca i32*, align 8
  store i8 -115, i8* %l_2, align 1
  store i32* @g_32, i32** %l_44, align 8
  %1 = load i8* %l_2, align 1
  %2 = sext i8 %1 to i32
  %3 = load i8* %l_2, align 1
  %4 = call signext i8 @safe_rshift_func_int8_t_s_u(i8 signext %3, i32 0)
  %5 = sext i8 %4 to i32
  %6 = and i32 %2, %5
  %7 = load i8* %l_2, align 1
  %8 = sext i8 %7 to i32
  %9 = load volatile i8* getelementptr inbounds ([6 x i8]* @g_7, i32 0, i64 2), align 1
  %10 = sext i8 %9 to i32
  %11 = xor i32 %8, %10
  %12 = load i8* %l_2, align 1
  %13 = sext i8 %12 to i32
  %14 = load i8* %l_2, align 1
  %15 = sext i8 %14 to i32
  %16 = call i32 @func_8(i32 %13, i32 %15)
  %17 = icmp sle i32 %11, %16
  %18 = zext i1 %17 to i32
  %19 = load i32* @g_42, align 4
  %20 = or i32 %18, %19
  %21 = load i8* %l_2, align 1
  %22 = sext i8 %21 to i32
  %23 = icmp slt i32 %20, %22
  %24 = zext i1 %23 to i32
  %25 = load i8* %l_2, align 1
  %26 = sext i8 %25 to i32
  %27 = call i32 @safe_mod_func_int32_t_s_s(i32 %24, i32 %26)
  %28 = icmp sgt i32 %6, %27
  %29 = zext i1 %28 to i32
  %30 = load i32** %l_44, align 8
  store i32 %29, i32* %30
  %31 = load i32* @g_12, align 4
  %32 = icmp ne i32 %31, 0
  br i1 %32, label %33, label %34

; <label>:33                                      ; preds = %0
  br label %35

; <label>:34                                      ; preds = %0
  br label %35

; <label>:35                                      ; preds = %34, %33
  store i32 0, i32* @g_12, align 4
  br label %36

; <label>:36                                      ; preds = %61, %35
  %37 = load i32* @g_12, align 4
  %38 = icmp slt i32 %37, 6
  br i1 %38, label %39, label %64

; <label>:39                                      ; preds = %36
  store i32* @g_42, i32** %l_45, align 8
  %40 = load i32** %l_45, align 8
  %41 = load volatile i32*** @g_46, align 8
  store i32* %40, i32** %41
  %42 = load i32* @g_12, align 4
  %43 = urem i32 %42, 6
  %44 = zext i32 %43 to i64
  %45 = getelementptr inbounds [6 x i8]* @g_7, i32 0, i64 %44
  %46 = load volatile i8* %45, align 1
  %47 = sext i8 %46 to i64
  %48 = icmp eq i64 %47, 4094424717
  %49 = zext i1 %48 to i32
  %50 = load i32** @g_11, align 8
  %51 = load i32* %50
  %52 = icmp slt i32 %49, %51
  %53 = zext i1 %52 to i32
  %54 = icmp ne i32** %l_44, null
  %55 = zext i1 %54 to i32
  %56 = icmp sge i32 %53, %55
  %57 = zext i1 %56 to i32
  %58 = load i32** %l_44, align 8
  %59 = load i32* %58
  %60 = and i32 %59, %57
  store i32 %60, i32* %58
  br label %61

; <label>:61                                      ; preds = %39
  %62 = load i32* @g_12, align 4
  %63 = add nsw i32 %62, 2
  store i32 %63, i32* @g_12, align 4
  br label %36

; <label>:64                                      ; preds = %36
  %65 = load i32* @g_42, align 4
  ret i32 %65
}

define internal signext i8 @safe_rshift_func_int8_t_s_u(i8 signext %left, i32 %right) nounwind uwtable {
  %1 = alloca i8, align 1
  %2 = alloca i32, align 4
  store i8 %left, i8* %1, align 1
  store i32 %right, i32* %2, align 4
  %3 = load i8* %1, align 1
  %4 = sext i8 %3 to i32
  %5 = icmp slt i32 %4, 0
  br i1 %5, label %9, label %6

; <label>:6                                       ; preds = %0
  %7 = load i32* %2, align 4
  %8 = icmp uge i32 %7, 32
  br i1 %8, label %9, label %12

; <label>:9                                       ; preds = %6, %0
  %10 = load i8* %1, align 1
  %11 = sext i8 %10 to i32
  br label %17

; <label>:12                                      ; preds = %6
  %13 = load i8* %1, align 1
  %14 = sext i8 %13 to i32
  %15 = load i32* %2, align 4
  %16 = ashr i32 %14, %15
  br label %17

; <label>:17                                      ; preds = %12, %9
  %18 = phi i32 [ %11, %9 ], [ %16, %12 ]
  %19 = trunc i32 %18 to i8
  ret i8 %19
}

define internal i32 @safe_mod_func_int32_t_s_s(i32 %si1, i32 %si2) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 %si1, i32* %1, align 4
  store i32 %si2, i32* %2, align 4
  %3 = load i32* %2, align 4
  %4 = icmp eq i32 %3, 0
  br i1 %4, label %11, label %5

; <label>:5                                       ; preds = %0
  %6 = load i32* %1, align 4
  %7 = icmp eq i32 %6, -2147483648
  br i1 %7, label %8, label %13

; <label>:8                                       ; preds = %5
  %9 = load i32* %2, align 4
  %10 = icmp eq i32 %9, -1
  br i1 %10, label %11, label %13

; <label>:11                                      ; preds = %8, %0
  %12 = load i32* %1, align 4
  br label %17

; <label>:13                                      ; preds = %8, %5
  %14 = load i32* %1, align 4
  %15 = load i32* %2, align 4
  %16 = srem i32 %14, %15
  br label %17

; <label>:17                                      ; preds = %13, %11
  %18 = phi i32 [ %12, %11 ], [ %16, %13 ]
  ret i32 %18
}

define i32 @func_8(i32 %p_9, i32 %p_10) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %l_13 = alloca i32**, align 8
  %l_37 = alloca i16, align 2
  store i32 %p_9, i32* %1, align 4
  store i32 %p_10, i32* %2, align 4
  store i32** @g_11, i32*** %l_13, align 8
  store i16 20730, i16* %l_37, align 2
  %3 = load i32** @g_11, align 8
  %4 = load i32*** %l_13, align 8
  store i32* %3, i32** %4
  %5 = load i32** @g_11, align 8
  %6 = load i32* %5
  %7 = load i32*** %l_13, align 8
  %8 = load i32** %7
  %9 = load i32* %8
  %10 = icmp ne i32 %9, 0
  br i1 %10, label %11, label %16

; <label>:11                                      ; preds = %0
  %12 = load i32*** %l_13, align 8
  %13 = load i32** %12
  %14 = load i32* %13
  %15 = icmp ne i32 %14, 0
  br label %16

; <label>:16                                      ; preds = %11, %0
  %17 = phi i1 [ false, %0 ], [ %15, %11 ]
  %18 = zext i1 %17 to i32
  %19 = load i32** @g_11, align 8
  %20 = load i32* %19
  %21 = icmp ne i32 %20, 0
  br i1 %21, label %26, label %22

; <label>:22                                      ; preds = %16
  %23 = load i32** @g_11, align 8
  %24 = load i32* %23
  %25 = icmp ne i32 %24, 0
  br label %26

; <label>:26                                      ; preds = %22, %16
  %27 = phi i1 [ true, %16 ], [ %25, %22 ]
  %28 = zext i1 %27 to i32
  %29 = icmp eq i32 %18, %28
  %30 = zext i1 %29 to i32
  %31 = or i32 %6, %30
  %32 = sext i32 %31 to i64
  %33 = icmp eq i64 %32, 2748838289
  %34 = zext i1 %33 to i32
  %35 = trunc i32 %34 to i8
  %36 = call signext i8 @safe_rshift_func_int8_t_s_s(i8 signext %35, i32 0)
  %37 = sext i8 %36 to i16
  %38 = load i32* %2, align 4
  %39 = sext i32 %38 to i64
  %40 = load i32*** %l_13, align 8
  %41 = load i32** %40
  %42 = load i32* %41
  %43 = sext i32 %42 to i64
  %44 = call i64 @safe_div_func_uint64_t_u_u(i64 %39, i64 %43)
  %45 = trunc i64 %44 to i16
  %46 = load i32*** %l_13, align 8
  %47 = load i32** %46
  %48 = load i32*** %l_13, align 8
  %49 = load i32** %48
  %50 = load i32* %49
  %51 = load i32* @g_32, align 4
  %52 = sext i32 %51 to i64
  %53 = load i16* %l_37, align 2
  %54 = zext i16 %53 to i32
  %55 = load i32*** %l_13, align 8
  %56 = load i32** %55
  %57 = load i32* %56
  %58 = trunc i32 %57 to i16
  %59 = load i32* %1, align 4
  %60 = load i32** @g_11, align 8
  %61 = load i32* %60
  %62 = xor i32 %59, %61
  %63 = call i32 @func_38(i16 zeroext %58, i32 %62)
  %64 = load i32*** %l_13, align 8
  %65 = load i32** %64
  %66 = load i32* %65
  %67 = sext i32 %66 to i64
  %68 = icmp slt i64 3943411146, %67
  %69 = zext i1 %68 to i32
  %70 = icmp slt i32 %63, %69
  %71 = zext i1 %70 to i32
  %72 = call i32 @func_22(i32* %47, i32 %50, i64 %52, i32 %54, i32 %71)
  %73 = trunc i32 %72 to i16
  %74 = call signext i16 @safe_mod_func_int16_t_s_s(i16 signext %45, i16 signext %73)
  %75 = call zeroext i16 @safe_mul_func_uint16_t_u_u(i16 zeroext %37, i16 zeroext %74)
  %76 = zext i16 %75 to i32
  %77 = load i32*** %l_13, align 8
  %78 = load i32** %77
  store i32 %76, i32* %78
  %79 = load i32** @g_11, align 8
  store i32 -1, i32* %79
  %80 = load i32** @g_11, align 8
  %81 = load i32* %80
  ret i32 %81
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

define i32 @func_22(i32* %p_23, i32 %p_24, i64 %p_25, i32 %p_26, i32 %p_27) nounwind uwtable {
  %1 = alloca i32*, align 8
  %2 = alloca i32, align 4
  %3 = alloca i64, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %l_33 = alloca i64, align 8
  %l_34 = alloca i32**, align 8
  %l_36 = alloca i32*, align 8
  %l_35 = alloca i32**, align 8
  %l_30 = alloca i32*, align 8
  %l_31 = alloca [6 x [9 x i32*]], align 16
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32* %p_23, i32** %1, align 8
  store i32 %p_24, i32* %2, align 4
  store i64 %p_25, i64* %3, align 8
  store i32 %p_26, i32* %4, align 4
  store i32 %p_27, i32* %5, align 4
  store i64 1, i64* %l_33, align 8
  store i32** null, i32*** %l_34, align 8
  store i32* @g_32, i32** %l_36, align 8
  store i32** %l_36, i32*** %l_35, align 8
  store i32 0, i32* %5, align 4
  br label %6

; <label>:6                                       ; preds = %37, %0
  %7 = load i32* %5, align 4
  %8 = icmp ne i32 %7, 0
  br i1 %8, label %9, label %40

; <label>:9                                       ; preds = %6
  store i32* @g_12, i32** %l_30, align 8
  store i32 0, i32* %i, align 4
  br label %10

; <label>:10                                      ; preds = %28, %9
  %11 = load i32* %i, align 4
  %12 = icmp slt i32 %11, 6
  br i1 %12, label %13, label %31

; <label>:13                                      ; preds = %10
  store i32 0, i32* %j, align 4
  br label %14

; <label>:14                                      ; preds = %24, %13
  %15 = load i32* %j, align 4
  %16 = icmp slt i32 %15, 9
  br i1 %16, label %17, label %27

; <label>:17                                      ; preds = %14
  %18 = load i32* %j, align 4
  %19 = sext i32 %18 to i64
  %20 = load i32* %i, align 4
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds [6 x [9 x i32*]]* %l_31, i32 0, i64 %21
  %23 = getelementptr inbounds [9 x i32*]* %22, i32 0, i64 %19
  store i32* @g_32, i32** %23, align 8
  br label %24

; <label>:24                                      ; preds = %17
  %25 = load i32* %j, align 4
  %26 = add nsw i32 %25, 1
  store i32 %26, i32* %j, align 4
  br label %14

; <label>:27                                      ; preds = %14
  br label %28

; <label>:28                                      ; preds = %27
  %29 = load i32* %i, align 4
  %30 = add nsw i32 %29, 1
  store i32 %30, i32* %i, align 4
  br label %10

; <label>:31                                      ; preds = %10
  %32 = load i32** %l_30, align 8
  %33 = icmp ne i32* null, %32
  %34 = zext i1 %33 to i32
  %35 = load i32* @g_32, align 4
  %36 = or i32 %35, %34
  store i32 %36, i32* @g_32, align 4
  br label %37

; <label>:37                                      ; preds = %31
  %38 = load i32* %5, align 4
  %39 = call i32 @safe_sub_func_uint32_t_u_u(i32 %38, i32 1)
  store i32 %39, i32* %5, align 4
  br label %6

; <label>:40                                      ; preds = %6
  %41 = load i64* %l_33, align 8
  %42 = load i32* %4, align 4
  %43 = sext i32 %42 to i64
  %44 = or i64 %43, %41
  %45 = trunc i64 %44 to i32
  store i32 %45, i32* %4, align 4
  %46 = load i32*** %l_35, align 8
  store i32* %4, i32** %46
  %47 = load i32*** %l_35, align 8
  %48 = load i32** %47
  %49 = load i32* %48
  ret i32 %49
}

define i32 @func_38(i16 zeroext %p_39, i32 %p_40) nounwind uwtable {
  %1 = alloca i16, align 2
  %2 = alloca i32, align 4
  %l_41 = alloca i32*, align 8
  %l_43 = alloca i32, align 4
  store i16 %p_39, i16* %1, align 2
  store i32 %p_40, i32* %2, align 4
  store i32* @g_42, i32** %l_41, align 8
  store i32 1612483923, i32* %l_43, align 4
  store i32* null, i32** %l_41, align 8
  ret i32 1612483923
}

define internal i32 @safe_sub_func_uint32_t_u_u(i32 %ui1, i32 %ui2) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 %ui1, i32* %1, align 4
  store i32 %ui2, i32* %2, align 4
  %3 = load i32* %1, align 4
  %4 = load i32* %2, align 4
  %5 = sub i32 %3, %4
  ret i32 %5
}

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  %i = alloca i32, align 4
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  %4 = call i32 @func_1()
  %5 = load volatile i8* getelementptr inbounds ([6 x i8]* @g_7, i32 0, i64 0), align 1
  %6 = sext i8 %5 to i32
  %7 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str, i32 0, i32 0), i32 %6)
  %8 = load volatile i8* getelementptr inbounds ([6 x i8]* @g_7, i32 0, i64 1), align 1
  %9 = sext i8 %8 to i32
  %10 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str1, i32 0, i32 0), i32 %9)
  %11 = load volatile i8* getelementptr inbounds ([6 x i8]* @g_7, i32 0, i64 2), align 1
  %12 = sext i8 %11 to i32
  %13 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str2, i32 0, i32 0), i32 %12)
  %14 = load volatile i8* getelementptr inbounds ([6 x i8]* @g_7, i32 0, i64 3), align 1
  %15 = sext i8 %14 to i32
  %16 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str3, i32 0, i32 0), i32 %15)
  %17 = load volatile i8* getelementptr inbounds ([6 x i8]* @g_7, i32 0, i64 4), align 1
  %18 = sext i8 %17 to i32
  %19 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str4, i32 0, i32 0), i32 %18)
  %20 = load volatile i8* getelementptr inbounds ([6 x i8]* @g_7, i32 0, i64 5), align 1
  %21 = sext i8 %20 to i32
  %22 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str5, i32 0, i32 0), i32 %21)
  %23 = load volatile i8* getelementptr inbounds ([6 x i8]* @g_7, i32 0, i64 2), align 1
  %24 = sext i8 %23 to i32
  %25 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str2, i32 0, i32 0), i32 %24)
  %26 = load i32* @g_12, align 4
  %27 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str6, i32 0, i32 0), i32 %26)
  %28 = load i32* @g_32, align 4
  %29 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str7, i32 0, i32 0), i32 %28)
  %30 = load i32* @g_42, align 4
  %31 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str8, i32 0, i32 0), i32 %30)
  %32 = load i32* %1
  ret i32 %32
}

declare i32 @printf(i8*, ...)
