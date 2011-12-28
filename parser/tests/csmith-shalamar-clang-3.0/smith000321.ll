; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith000321.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_8 = global i16 10378, align 2
@g_10 = global i32 1, align 4
@g_9 = global i32* @g_10, align 8
@g_32 = global i32* @g_10, align 8
@g_39 = global i32* @g_10, align 8
@g_38 = global i32** @g_39, align 8
@.str = private unnamed_addr constant [19 x i8] c"checksum g_8 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [20 x i8] c"checksum g_10 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable {
  %l_23 = alloca i32*, align 8
  %l_24 = alloca i32**, align 8
  %l_37 = alloca i8, align 1
  %l_22 = alloca [5 x i32*], align 16
  %l_21 = alloca [8 x [2 x [1 x [4 x i32**]]]], align 16
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %l = alloca i32, align 4
  store i32* @g_10, i32** %l_23, align 8
  store i32** null, i32*** %l_24, align 8
  store i8 1, i8* %l_37, align 1
  %1 = load i16* @g_8, align 2
  %2 = load i16* @g_8, align 2
  %3 = call zeroext i16 @safe_div_func_uint16_t_u_u(i16 zeroext %1, i16 zeroext %2)
  %4 = trunc i16 %3 to i8
  %5 = load i16* @g_8, align 2
  %6 = trunc i16 %5 to i8
  %7 = call zeroext i8 @safe_div_func_uint8_t_u_u(i8 zeroext %4, i8 zeroext %6)
  %8 = call signext i8 @safe_add_func_int8_t_s_s(i8 signext %7, i8 signext 54)
  %9 = icmp ne i8 %8, 0
  br i1 %9, label %10, label %17

; <label>:10                                      ; preds = %0
  br label %11

; <label>:11                                      ; preds = %76, %10
  %12 = load i16* @g_8, align 2
  %13 = sext i16 %12 to i32
  %14 = load volatile i32** @g_9, align 8
  %15 = load i32* %14
  %16 = xor i32 %15, %13
  store i32 %16, i32* %14
  br label %84

; <label>:17                                      ; preds = %0
  store i32 0, i32* %i, align 4
  br label %18

; <label>:18                                      ; preds = %25, %17
  %19 = load i32* %i, align 4
  %20 = icmp slt i32 %19, 5
  br i1 %20, label %21, label %28

; <label>:21                                      ; preds = %18
  %22 = load i32* %i, align 4
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds [5 x i32*]* %l_22, i32 0, i64 %23
  store i32* null, i32** %24, align 8
  br label %25

; <label>:25                                      ; preds = %21
  %26 = load i32* %i, align 4
  %27 = add nsw i32 %26, 1
  store i32 %27, i32* %i, align 4
  br label %18

; <label>:28                                      ; preds = %18
  store i32 0, i32* %i, align 4
  br label %29

; <label>:29                                      ; preds = %70, %28
  %30 = load i32* %i, align 4
  %31 = icmp slt i32 %30, 8
  br i1 %31, label %32, label %73

; <label>:32                                      ; preds = %29
  store i32 0, i32* %j, align 4
  br label %33

; <label>:33                                      ; preds = %66, %32
  %34 = load i32* %j, align 4
  %35 = icmp slt i32 %34, 2
  br i1 %35, label %36, label %69

; <label>:36                                      ; preds = %33
  store i32 0, i32* %k, align 4
  br label %37

; <label>:37                                      ; preds = %62, %36
  %38 = load i32* %k, align 4
  %39 = icmp slt i32 %38, 1
  br i1 %39, label %40, label %65

; <label>:40                                      ; preds = %37
  store i32 0, i32* %l, align 4
  br label %41

; <label>:41                                      ; preds = %58, %40
  %42 = load i32* %l, align 4
  %43 = icmp slt i32 %42, 4
  br i1 %43, label %44, label %61

; <label>:44                                      ; preds = %41
  %45 = getelementptr inbounds [5 x i32*]* %l_22, i32 0, i64 0
  %46 = load i32* %l, align 4
  %47 = sext i32 %46 to i64
  %48 = load i32* %k, align 4
  %49 = sext i32 %48 to i64
  %50 = load i32* %j, align 4
  %51 = sext i32 %50 to i64
  %52 = load i32* %i, align 4
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds [8 x [2 x [1 x [4 x i32**]]]]* %l_21, i32 0, i64 %53
  %55 = getelementptr inbounds [2 x [1 x [4 x i32**]]]* %54, i32 0, i64 %51
  %56 = getelementptr inbounds [1 x [4 x i32**]]* %55, i32 0, i64 %49
  %57 = getelementptr inbounds [4 x i32**]* %56, i32 0, i64 %47
  store i32** %45, i32*** %57, align 8
  br label %58

; <label>:58                                      ; preds = %44
  %59 = load i32* %l, align 4
  %60 = add nsw i32 %59, 1
  store i32 %60, i32* %l, align 4
  br label %41

; <label>:61                                      ; preds = %41
  br label %62

; <label>:62                                      ; preds = %61
  %63 = load i32* %k, align 4
  %64 = add nsw i32 %63, 1
  store i32 %64, i32* %k, align 4
  br label %37

; <label>:65                                      ; preds = %37
  br label %66

; <label>:66                                      ; preds = %65
  %67 = load i32* %j, align 4
  %68 = add nsw i32 %67, 1
  store i32 %68, i32* %j, align 4
  br label %33

; <label>:69                                      ; preds = %33
  br label %70

; <label>:70                                      ; preds = %69
  %71 = load i32* %i, align 4
  %72 = add nsw i32 %71, 1
  store i32 %72, i32* %i, align 4
  br label %29

; <label>:73                                      ; preds = %29
  %74 = load i16* @g_8, align 2
  %75 = icmp ne i16 %74, 0
  br i1 %75, label %76, label %77

; <label>:76                                      ; preds = %73
  br label %11

; <label>:77                                      ; preds = %73
  %78 = load i32* @g_10, align 4
  %79 = call i32* @func_12(i32 %78)
  store i32* %79, i32** %l_23, align 8
  %80 = load i16* @g_8, align 2
  %81 = icmp ne i16 %80, 0
  br i1 %81, label %82, label %83

; <label>:82                                      ; preds = %77
  br label %86

; <label>:83                                      ; preds = %77
  br label %84

; <label>:84                                      ; preds = %83, %11
  %85 = load i32** %l_23, align 8
  store volatile i32* %85, i32** @g_9, align 8
  br label %86

; <label>:86                                      ; preds = %84, %82
  %87 = load i16* @g_8, align 2
  %88 = sext i16 %87 to i32
  %89 = load volatile i32** @g_32, align 8
  %90 = load i32* %89
  %91 = sext i32 %90 to i64
  %92 = call i64 @safe_add_func_uint64_t_u_u(i64 -1, i64 %91)
  %93 = call i64 @safe_sub_func_uint64_t_u_u(i64 %92, i64 2248917564)
  %94 = trunc i64 %93 to i8
  %95 = load i8* %l_37, align 1
  %96 = load i32*** @g_38, align 8
  %97 = load i32* @g_10, align 4
  %98 = trunc i32 %97 to i16
  %99 = call i32 @func_25(i32 -520480113, i8 zeroext %94, i8 zeroext %95, i32** %96, i16 zeroext %98)
  %100 = icmp slt i32 %88, %99
  %101 = zext i1 %100 to i32
  %102 = load i32*** @g_38, align 8
  %103 = load i32** %102
  store i32 %101, i32* %103
  %104 = load i32** @g_39, align 8
  %105 = load i32* %104
  %106 = load i32** @g_39, align 8
  store i32 %105, i32* %106
  %107 = load i16* @g_8, align 2
  %108 = sext i16 %107 to i32
  ret i32 %108
}

define internal signext i8 @safe_add_func_int8_t_s_s(i8 signext %si1, i8 signext %si2) nounwind uwtable {
  %1 = alloca i8, align 1
  %2 = alloca i8, align 1
  store i8 %si1, i8* %1, align 1
  store i8 %si2, i8* %2, align 1
  %3 = load i8* %1, align 1
  %4 = sext i8 %3 to i32
  %5 = load i8* %2, align 1
  %6 = sext i8 %5 to i32
  %7 = add nsw i32 %4, %6
  %8 = trunc i32 %7 to i8
  ret i8 %8
}

define internal zeroext i8 @safe_div_func_uint8_t_u_u(i8 zeroext %ui1, i8 zeroext %ui2) nounwind uwtable {
  %1 = alloca i8, align 1
  %2 = alloca i8, align 1
  store i8 %ui1, i8* %1, align 1
  store i8 %ui2, i8* %2, align 1
  %3 = load i8* %2, align 1
  %4 = zext i8 %3 to i32
  %5 = icmp eq i32 %4, 0
  br i1 %5, label %6, label %9

; <label>:6                                       ; preds = %0
  %7 = load i8* %1, align 1
  %8 = zext i8 %7 to i32
  br label %15

; <label>:9                                       ; preds = %0
  %10 = load i8* %1, align 1
  %11 = zext i8 %10 to i32
  %12 = load i8* %2, align 1
  %13 = zext i8 %12 to i32
  %14 = sdiv i32 %11, %13
  br label %15

; <label>:15                                      ; preds = %9, %6
  %16 = phi i32 [ %8, %6 ], [ %14, %9 ]
  %17 = trunc i32 %16 to i8
  ret i8 %17
}

define internal zeroext i16 @safe_div_func_uint16_t_u_u(i16 zeroext %ui1, i16 zeroext %ui2) nounwind uwtable {
  %1 = alloca i16, align 2
  %2 = alloca i16, align 2
  store i16 %ui1, i16* %1, align 2
  store i16 %ui2, i16* %2, align 2
  %3 = load i16* %2, align 2
  %4 = zext i16 %3 to i32
  %5 = icmp eq i32 %4, 0
  br i1 %5, label %6, label %9

; <label>:6                                       ; preds = %0
  %7 = load i16* %1, align 2
  %8 = zext i16 %7 to i32
  br label %15

; <label>:9                                       ; preds = %0
  %10 = load i16* %1, align 2
  %11 = zext i16 %10 to i32
  %12 = load i16* %2, align 2
  %13 = zext i16 %12 to i32
  %14 = sdiv i32 %11, %13
  br label %15

; <label>:15                                      ; preds = %9, %6
  %16 = phi i32 [ %8, %6 ], [ %14, %9 ]
  %17 = trunc i32 %16 to i16
  ret i16 %17
}

define i32* @func_12(i32 %p_13) nounwind uwtable {
  %1 = alloca i32, align 4
  %l_18 = alloca i32, align 4
  %l_19 = alloca i64, align 8
  %l_20 = alloca i32*, align 8
  store i32 %p_13, i32* %1, align 4
  store i32 5, i32* %l_18, align 4
  store i64 -6476243495245046361, i64* %l_19, align 8
  store i32* %l_18, i32** %l_20, align 8
  %2 = load volatile i32** @g_9, align 8
  %3 = load i32* %2
  %4 = trunc i32 %3 to i16
  %5 = load i16* @g_8, align 2
  %6 = sext i16 %5 to i32
  %7 = icmp ne i32 %6, 0
  br i1 %7, label %8, label %21

; <label>:8                                       ; preds = %0
  %9 = load i32* %l_18, align 4
  %10 = icmp ne i32 %9, 0
  br i1 %10, label %14, label %11

; <label>:11                                      ; preds = %8
  %12 = load i64* %l_19, align 8
  %13 = icmp ne i64 %12, 0
  br label %14

; <label>:14                                      ; preds = %11, %8
  %15 = phi i1 [ true, %8 ], [ %13, %11 ]
  %16 = zext i1 %15 to i32
  %17 = trunc i32 %16 to i16
  %18 = call zeroext i16 @safe_mul_func_uint16_t_u_u(i16 zeroext %17, i16 zeroext 0)
  %19 = zext i16 %18 to i32
  %20 = icmp ne i32 %19, 0
  br label %21

; <label>:21                                      ; preds = %14, %0
  %22 = phi i1 [ false, %0 ], [ %20, %14 ]
  %23 = zext i1 %22 to i32
  %24 = call zeroext i16 @safe_lshift_func_uint16_t_u_s(i16 zeroext %4, i32 %23)
  %25 = zext i16 %24 to i32
  %26 = load i32** %l_20, align 8
  store i32 %25, i32* %26
  ret i32* %l_18
}

define i32 @func_25(i32 %p_26, i8 zeroext %p_27, i8 zeroext %p_28, i32** %p_29, i16 zeroext %p_30) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i8, align 1
  %3 = alloca i8, align 1
  %4 = alloca i32**, align 8
  %5 = alloca i16, align 2
  %l_31 = alloca [7 x [5 x [1 x [1 x i32]]]], align 16
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %l = alloca i32, align 4
  store i32 %p_26, i32* %1, align 4
  store i8 %p_27, i8* %2, align 1
  store i8 %p_28, i8* %3, align 1
  store i32** %p_29, i32*** %4, align 8
  store i16 %p_30, i16* %5, align 2
  store i32 0, i32* %i, align 4
  br label %6

; <label>:6                                       ; preds = %46, %0
  %7 = load i32* %i, align 4
  %8 = icmp slt i32 %7, 7
  br i1 %8, label %9, label %49

; <label>:9                                       ; preds = %6
  store i32 0, i32* %j, align 4
  br label %10

; <label>:10                                      ; preds = %42, %9
  %11 = load i32* %j, align 4
  %12 = icmp slt i32 %11, 5
  br i1 %12, label %13, label %45

; <label>:13                                      ; preds = %10
  store i32 0, i32* %k, align 4
  br label %14

; <label>:14                                      ; preds = %38, %13
  %15 = load i32* %k, align 4
  %16 = icmp slt i32 %15, 1
  br i1 %16, label %17, label %41

; <label>:17                                      ; preds = %14
  store i32 0, i32* %l, align 4
  br label %18

; <label>:18                                      ; preds = %34, %17
  %19 = load i32* %l, align 4
  %20 = icmp slt i32 %19, 1
  br i1 %20, label %21, label %37

; <label>:21                                      ; preds = %18
  %22 = load i32* %l, align 4
  %23 = sext i32 %22 to i64
  %24 = load i32* %k, align 4
  %25 = sext i32 %24 to i64
  %26 = load i32* %j, align 4
  %27 = sext i32 %26 to i64
  %28 = load i32* %i, align 4
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds [7 x [5 x [1 x [1 x i32]]]]* %l_31, i32 0, i64 %29
  %31 = getelementptr inbounds [5 x [1 x [1 x i32]]]* %30, i32 0, i64 %27
  %32 = getelementptr inbounds [1 x [1 x i32]]* %31, i32 0, i64 %25
  %33 = getelementptr inbounds [1 x i32]* %32, i32 0, i64 %23
  store i32 -296295653, i32* %33, align 4
  br label %34

; <label>:34                                      ; preds = %21
  %35 = load i32* %l, align 4
  %36 = add nsw i32 %35, 1
  store i32 %36, i32* %l, align 4
  br label %18

; <label>:37                                      ; preds = %18
  br label %38

; <label>:38                                      ; preds = %37
  %39 = load i32* %k, align 4
  %40 = add nsw i32 %39, 1
  store i32 %40, i32* %k, align 4
  br label %14

; <label>:41                                      ; preds = %14
  br label %42

; <label>:42                                      ; preds = %41
  %43 = load i32* %j, align 4
  %44 = add nsw i32 %43, 1
  store i32 %44, i32* %j, align 4
  br label %10

; <label>:45                                      ; preds = %10
  br label %46

; <label>:46                                      ; preds = %45
  %47 = load i32* %i, align 4
  %48 = add nsw i32 %47, 1
  store i32 %48, i32* %i, align 4
  br label %6

; <label>:49                                      ; preds = %6
  %50 = getelementptr inbounds [7 x [5 x [1 x [1 x i32]]]]* %l_31, i32 0, i64 0
  %51 = getelementptr inbounds [5 x [1 x [1 x i32]]]* %50, i32 0, i64 2
  %52 = getelementptr inbounds [1 x [1 x i32]]* %51, i32 0, i64 0
  %53 = getelementptr inbounds [1 x i32]* %52, i32 0, i64 0
  %54 = load i32* %53, align 4
  %55 = load volatile i32** @g_32, align 8
  %56 = load i32* %55
  %57 = xor i32 %56, %54
  store i32 %57, i32* %55
  %58 = load volatile i32** @g_32, align 8
  %59 = load i32* %58
  ret i32 %59
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

define internal i64 @safe_add_func_uint64_t_u_u(i64 %ui1, i64 %ui2) nounwind uwtable {
  %1 = alloca i64, align 8
  %2 = alloca i64, align 8
  store i64 %ui1, i64* %1, align 8
  store i64 %ui2, i64* %2, align 8
  %3 = load i64* %1, align 8
  %4 = load i64* %2, align 8
  %5 = add i64 %3, %4
  ret i64 %5
}

define internal zeroext i16 @safe_lshift_func_uint16_t_u_s(i16 zeroext %left, i32 %right) nounwind uwtable {
  %1 = alloca i16, align 2
  %2 = alloca i32, align 4
  store i16 %left, i16* %1, align 2
  store i32 %right, i32* %2, align 4
  %3 = load i32* %2, align 4
  %4 = icmp slt i32 %3, 0
  br i1 %4, label %14, label %5

; <label>:5                                       ; preds = %0
  %6 = load i32* %2, align 4
  %7 = icmp sge i32 %6, 32
  br i1 %7, label %14, label %8

; <label>:8                                       ; preds = %5
  %9 = load i16* %1, align 2
  %10 = zext i16 %9 to i32
  %11 = load i32* %2, align 4
  %12 = ashr i32 65535, %11
  %13 = icmp sgt i32 %10, %12
  br i1 %13, label %14, label %17

; <label>:14                                      ; preds = %8, %5, %0
  %15 = load i16* %1, align 2
  %16 = zext i16 %15 to i32
  br label %22

; <label>:17                                      ; preds = %8
  %18 = load i16* %1, align 2
  %19 = zext i16 %18 to i32
  %20 = load i32* %2, align 4
  %21 = shl i32 %19, %20
  br label %22

; <label>:22                                      ; preds = %17, %14
  %23 = phi i32 [ %16, %14 ], [ %21, %17 ]
  %24 = trunc i32 %23 to i16
  ret i16 %24
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
  %4 = call i32 @func_1()
  %5 = load i16* @g_8, align 2
  %6 = sext i16 %5 to i32
  %7 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %6)
  %8 = load i32* @g_10, align 4
  %9 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str1, i32 0, i32 0), i32 %8)
  %10 = load i32* %1
  ret i32 %10
}

declare i32 @printf(i8*, ...)
