; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith001508.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_3 = global [1 x i32] [i32 -194136827], align 4
@g_4 = global i32 1748799429, align 4
@g_5 = global i32 82738465, align 4
@g_12 = constant i32* @g_4, align 8
@g_32 = constant i8 7, align 1
@.str = private unnamed_addr constant [22 x i8] c"checksum g_3[0] = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [19 x i8] c"checksum g_4 = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [19 x i8] c"checksum g_5 = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [20 x i8] c"checksum g_32 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define signext i8 @func_1() nounwind uwtable {
  %l_2 = alloca [1 x [6 x [8 x i32]]], align 16
  %l_8 = alloca i32, align 4
  %l_48 = alloca i64, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  store i32 -1448513146, i32* %l_8, align 4
  store i64 -5110642578287550726, i64* %l_48, align 8
  store i32 0, i32* %i, align 4
  br label %1

; <label>:1                                       ; preds = %30, %0
  %2 = load i32* %i, align 4
  %3 = icmp slt i32 %2, 1
  br i1 %3, label %4, label %33

; <label>:4                                       ; preds = %1
  store i32 0, i32* %j, align 4
  br label %5

; <label>:5                                       ; preds = %26, %4
  %6 = load i32* %j, align 4
  %7 = icmp slt i32 %6, 6
  br i1 %7, label %8, label %29

; <label>:8                                       ; preds = %5
  store i32 0, i32* %k, align 4
  br label %9

; <label>:9                                       ; preds = %22, %8
  %10 = load i32* %k, align 4
  %11 = icmp slt i32 %10, 8
  br i1 %11, label %12, label %25

; <label>:12                                      ; preds = %9
  %13 = load i32* %k, align 4
  %14 = sext i32 %13 to i64
  %15 = load i32* %j, align 4
  %16 = sext i32 %15 to i64
  %17 = load i32* %i, align 4
  %18 = sext i32 %17 to i64
  %19 = getelementptr inbounds [1 x [6 x [8 x i32]]]* %l_2, i32 0, i64 %18
  %20 = getelementptr inbounds [6 x [8 x i32]]* %19, i32 0, i64 %16
  %21 = getelementptr inbounds [8 x i32]* %20, i32 0, i64 %14
  store i32 -706441934, i32* %21, align 4
  br label %22

; <label>:22                                      ; preds = %12
  %23 = load i32* %k, align 4
  %24 = add nsw i32 %23, 1
  store i32 %24, i32* %k, align 4
  br label %9

; <label>:25                                      ; preds = %9
  br label %26

; <label>:26                                      ; preds = %25
  %27 = load i32* %j, align 4
  %28 = add nsw i32 %27, 1
  store i32 %28, i32* %j, align 4
  br label %5

; <label>:29                                      ; preds = %5
  br label %30

; <label>:30                                      ; preds = %29
  %31 = load i32* %i, align 4
  %32 = add nsw i32 %31, 1
  store i32 %32, i32* %i, align 4
  br label %1

; <label>:33                                      ; preds = %1
  %34 = load i32* %l_8, align 4
  %35 = trunc i32 %34 to i8
  ret i8 %35
}

define i32 @func_16(i64 %p_17, i16 zeroext %p_18) nounwind uwtable {
  %1 = alloca i64, align 8
  %2 = alloca i16, align 2
  %l_26 = alloca i16, align 2
  %l_40 = alloca [1 x i32*], align 8
  %i = alloca i32, align 4
  %l_23 = alloca i32*, align 8
  store i64 %p_17, i64* %1, align 8
  store i16 %p_18, i16* %2, align 2
  store i16 1, i16* %l_26, align 2
  store i32 0, i32* %i, align 4
  br label %3

; <label>:3                                       ; preds = %10, %0
  %4 = load i32* %i, align 4
  %5 = icmp slt i32 %4, 1
  br i1 %5, label %6, label %13

; <label>:6                                       ; preds = %3
  %7 = load i32* %i, align 4
  %8 = sext i32 %7 to i64
  %9 = getelementptr inbounds [1 x i32*]* %l_40, i32 0, i64 %8
  store i32* @g_5, i32** %9, align 8
  br label %10

; <label>:10                                      ; preds = %6
  %11 = load i32* %i, align 4
  %12 = add nsw i32 %11, 1
  store i32 %12, i32* %i, align 4
  br label %3

; <label>:13                                      ; preds = %3
  br label %14

; <label>:14                                      ; preds = %72, %13
  store i32 -29, i32* @g_5, align 4
  br label %15

; <label>:15                                      ; preds = %74, %14
  %16 = load i32* @g_5, align 4
  %17 = icmp slt i32 %16, -9
  br i1 %17, label %18, label %79

; <label>:18                                      ; preds = %15
  store i32* @g_4, i32** %l_23, align 8
  %19 = load i32** %l_23, align 8
  %20 = icmp ne i32* getelementptr inbounds ([1 x i32]* @g_3, i32 0, i64 0), %19
  %21 = zext i1 %20 to i32
  %22 = trunc i32 %21 to i16
  %23 = load i16* %2, align 2
  %24 = zext i16 %23 to i32
  %25 = load i16* %l_26, align 2
  %26 = sext i16 %25 to i32
  %27 = icmp ne i32 %26, 0
  br i1 %27, label %32, label %28

; <label>:28                                      ; preds = %18
  %29 = load i16* %l_26, align 2
  %30 = sext i16 %29 to i32
  %31 = icmp ne i32 %30, 0
  br label %32

; <label>:32                                      ; preds = %28, %18
  %33 = phi i1 [ true, %18 ], [ %31, %28 ]
  %34 = zext i1 %33 to i32
  %35 = trunc i32 %34 to i8
  %36 = load i32* @g_4, align 4
  %37 = sext i32 %36 to i64
  %38 = call i32 @func_27(i64 %37, i16 zeroext 7)
  %39 = trunc i32 %38 to i8
  %40 = call zeroext i8 @safe_sub_func_uint8_t_u_u(i8 zeroext %35, i8 zeroext %39)
  %41 = zext i8 %40 to i32
  %42 = icmp sge i32 %24, %41
  %43 = zext i1 %42 to i32
  %44 = sext i32 %43 to i64
  %45 = load i16* %2, align 2
  %46 = load i16* %l_26, align 2
  %47 = sext i16 %46 to i32
  %48 = call signext i16 @safe_rshift_func_int16_t_s_s(i16 signext %45, i32 %47)
  %49 = trunc i16 %48 to i8
  %50 = load i64* %1, align 8
  %51 = trunc i64 %50 to i16
  %52 = call zeroext i16 @safe_unary_minus_func_uint16_t_u(i16 zeroext %51)
  %53 = trunc i16 %52 to i8
  %54 = call zeroext i8 @safe_mul_func_uint8_t_u_u(i8 zeroext %49, i8 zeroext %53)
  %55 = zext i8 %54 to i64
  %56 = call i64 @safe_mod_func_int64_t_s_s(i64 %55, i64 1)
  %57 = xor i64 %44, %56
  %58 = trunc i64 %57 to i32
  %59 = call zeroext i16 @safe_rshift_func_uint16_t_u_s(i16 zeroext %22, i32 %58)
  %60 = zext i16 %59 to i32
  %61 = getelementptr inbounds [1 x i32*]* %l_40, i32 0, i64 0
  %62 = load i32** %61, align 8
  %63 = getelementptr inbounds [1 x i32*]* %l_40, i32 0, i64 0
  %64 = load i32** %63, align 8
  %65 = icmp ne i32* %62, %64
  %66 = zext i1 %65 to i32
  %67 = and i32 %60, %66
  %68 = load i32* @g_5, align 4
  %69 = xor i32 %68, %67
  store i32 %69, i32* @g_5, align 4
  %70 = load i64* %1, align 8
  %71 = icmp ne i64 %70, 0
  br i1 %71, label %72, label %73

; <label>:72                                      ; preds = %32
  br label %14

; <label>:73                                      ; preds = %32
  br label %74

; <label>:74                                      ; preds = %73
  %75 = load i32* @g_5, align 4
  %76 = trunc i32 %75 to i16
  %77 = call signext i16 @safe_sub_func_int16_t_s_s(i16 signext %76, i16 signext 1)
  %78 = sext i16 %77 to i32
  store i32 %78, i32* @g_5, align 4
  br label %15

; <label>:79                                      ; preds = %15
  store i32 -6, i32* @g_4, align 4
  br label %80

; <label>:80                                      ; preds = %94, %79
  %81 = load i32* @g_4, align 4
  %82 = icmp ne i32 %81, 0
  br i1 %82, label %83, label %99

; <label>:83                                      ; preds = %80
  %84 = load volatile i32** @g_12, align 8
  %85 = load i32* %84
  %86 = icmp ne i32 %85, 0
  br i1 %86, label %87, label %88

; <label>:87                                      ; preds = %83
  br label %99

; <label>:88                                      ; preds = %83
  %89 = load volatile i32** @g_12, align 8
  %90 = load i32* %89
  %91 = icmp ne i32 %90, 0
  br i1 %91, label %92, label %93

; <label>:92                                      ; preds = %88
  br label %94

; <label>:93                                      ; preds = %88
  br label %94

; <label>:94                                      ; preds = %93, %92
  %95 = load i32* @g_4, align 4
  %96 = trunc i32 %95 to i8
  %97 = call zeroext i8 @safe_sub_func_uint8_t_u_u(i8 zeroext %96, i8 zeroext 9)
  %98 = zext i8 %97 to i32
  store i32 %98, i32* @g_4, align 4
  br label %80

; <label>:99                                      ; preds = %87, %80
  %100 = load i16* %2, align 2
  %101 = zext i16 %100 to i32
  ret i32 %101
}

define internal zeroext i16 @safe_rshift_func_uint16_t_u_s(i16 zeroext %left, i32 %right) nounwind uwtable {
  %1 = alloca i16, align 2
  %2 = alloca i32, align 4
  store i16 %left, i16* %1, align 2
  store i32 %right, i32* %2, align 4
  %3 = load i32* %2, align 4
  %4 = icmp slt i32 %3, 0
  br i1 %4, label %8, label %5

; <label>:5                                       ; preds = %0
  %6 = load i32* %2, align 4
  %7 = icmp sge i32 %6, 32
  br i1 %7, label %8, label %11

; <label>:8                                       ; preds = %5, %0
  %9 = load i16* %1, align 2
  %10 = zext i16 %9 to i32
  br label %16

; <label>:11                                      ; preds = %5
  %12 = load i16* %1, align 2
  %13 = zext i16 %12 to i32
  %14 = load i32* %2, align 4
  %15 = ashr i32 %13, %14
  br label %16

; <label>:16                                      ; preds = %11, %8
  %17 = phi i32 [ %10, %8 ], [ %15, %11 ]
  %18 = trunc i32 %17 to i16
  ret i16 %18
}

define internal zeroext i8 @safe_sub_func_uint8_t_u_u(i8 zeroext %ui1, i8 zeroext %ui2) nounwind uwtable {
  %1 = alloca i8, align 1
  %2 = alloca i8, align 1
  store i8 %ui1, i8* %1, align 1
  store i8 %ui2, i8* %2, align 1
  %3 = load i8* %1, align 1
  %4 = zext i8 %3 to i32
  %5 = load i8* %2, align 1
  %6 = zext i8 %5 to i32
  %7 = sub nsw i32 %4, %6
  %8 = trunc i32 %7 to i8
  ret i8 %8
}

define i32 @func_27(i64 %p_28, i16 zeroext %p_29) nounwind uwtable {
  %1 = alloca i64, align 8
  %2 = alloca i16, align 2
  %l_31 = alloca i32*, align 8
  %l_30 = alloca i32**, align 8
  store i64 %p_28, i64* %1, align 8
  store i16 %p_29, i16* %2, align 2
  store i32* getelementptr inbounds ([1 x i32]* @g_3, i32 0, i64 0), i32** %l_31, align 8
  store i32** %l_31, i32*** %l_30, align 8
  %3 = load i32*** %l_30, align 8
  store i32* null, i32** %3
  %4 = load volatile i32** @g_12, align 8
  %5 = load i32* %4
  ret i32 %5
}

define internal i64 @safe_mod_func_int64_t_s_s(i64 %si1, i64 %si2) nounwind uwtable {
  %1 = alloca i64, align 8
  %2 = alloca i64, align 8
  store i64 %si1, i64* %1, align 8
  store i64 %si2, i64* %2, align 8
  %3 = load i64* %2, align 8
  %4 = icmp eq i64 %3, 0
  br i1 %4, label %11, label %5

; <label>:5                                       ; preds = %0
  %6 = load i64* %1, align 8
  %7 = icmp eq i64 %6, -9223372036854775808
  br i1 %7, label %8, label %13

; <label>:8                                       ; preds = %5
  %9 = load i64* %2, align 8
  %10 = icmp eq i64 %9, -1
  br i1 %10, label %11, label %13

; <label>:11                                      ; preds = %8, %0
  %12 = load i64* %1, align 8
  br label %17

; <label>:13                                      ; preds = %8, %5
  %14 = load i64* %1, align 8
  %15 = load i64* %2, align 8
  %16 = srem i64 %14, %15
  br label %17

; <label>:17                                      ; preds = %13, %11
  %18 = phi i64 [ %12, %11 ], [ %16, %13 ]
  ret i64 %18
}

define internal zeroext i8 @safe_mul_func_uint8_t_u_u(i8 zeroext %ui1, i8 zeroext %ui2) nounwind uwtable {
  %1 = alloca i8, align 1
  %2 = alloca i8, align 1
  store i8 %ui1, i8* %1, align 1
  store i8 %ui2, i8* %2, align 1
  %3 = load i8* %1, align 1
  %4 = zext i8 %3 to i32
  %5 = load i8* %2, align 1
  %6 = zext i8 %5 to i32
  %7 = mul i32 %4, %6
  %8 = trunc i32 %7 to i8
  ret i8 %8
}

define internal signext i16 @safe_rshift_func_int16_t_s_s(i16 signext %left, i32 %right) nounwind uwtable {
  %1 = alloca i16, align 2
  %2 = alloca i32, align 4
  store i16 %left, i16* %1, align 2
  store i32 %right, i32* %2, align 4
  %3 = load i16* %1, align 2
  %4 = sext i16 %3 to i32
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
  %13 = load i16* %1, align 2
  %14 = sext i16 %13 to i32
  br label %20

; <label>:15                                      ; preds = %9
  %16 = load i16* %1, align 2
  %17 = sext i16 %16 to i32
  %18 = load i32* %2, align 4
  %19 = ashr i32 %17, %18
  br label %20

; <label>:20                                      ; preds = %15, %12
  %21 = phi i32 [ %14, %12 ], [ %19, %15 ]
  %22 = trunc i32 %21 to i16
  ret i16 %22
}

define internal zeroext i16 @safe_unary_minus_func_uint16_t_u(i16 zeroext %ui) nounwind uwtable {
  %1 = alloca i16, align 2
  store i16 %ui, i16* %1, align 2
  %2 = load i16* %1, align 2
  %3 = zext i16 %2 to i32
  %4 = sub nsw i32 0, %3
  %5 = trunc i32 %4 to i16
  ret i16 %5
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
  %4 = call signext i8 @func_1()
  %5 = load i32* getelementptr inbounds ([1 x i32]* @g_3, i32 0, i64 0), align 4
  %6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str, i32 0, i32 0), i32 %5)
  %7 = load i32* getelementptr inbounds ([1 x i32]* @g_3, i32 0, i64 0), align 4
  %8 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str, i32 0, i32 0), i32 %7)
  %9 = load i32* @g_4, align 4
  %10 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str1, i32 0, i32 0), i32 %9)
  %11 = load i32* @g_5, align 4
  %12 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str2, i32 0, i32 0), i32 %11)
  %13 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str3, i32 0, i32 0), i32 7)
  %14 = load i32* %1
  ret i32 %14
}

declare i32 @printf(i8*, ...)
