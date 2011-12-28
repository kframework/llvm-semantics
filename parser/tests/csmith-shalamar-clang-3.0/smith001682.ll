; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith001682.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = global i32 -179040897, align 4
@g_14 = global i32 492391683, align 4
@g_23 = global i32 -3, align 4
@g_28 = global i16 22707, align 2
@g_34 = global i32 -2076813535, align 4
@g_35 = global i32 -10, align 4
@g_36 = global i32 1743226037, align 4
@g_41 = global i8 1, align 1
@.str = private unnamed_addr constant [19 x i8] c"checksum g_2 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [20 x i8] c"checksum g_14 = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [20 x i8] c"checksum g_23 = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [20 x i8] c"checksum g_28 = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [20 x i8] c"checksum g_34 = %d\0A\00", align 1
@.str5 = private unnamed_addr constant [20 x i8] c"checksum g_35 = %d\0A\00", align 1
@.str6 = private unnamed_addr constant [20 x i8] c"checksum g_36 = %d\0A\00", align 1
@.str7 = private unnamed_addr constant [20 x i8] c"checksum g_41 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable {
  %l_29 = alloca i32, align 4
  %l_42 = alloca i32*, align 8
  %l_9 = alloca [7 x [3 x i16]], align 16
  %l_30 = alloca [6 x i32*], align 16
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 -1932891759, i32* %l_29, align 4
  store i32* @g_35, i32** %l_42, align 8
  store volatile i32 -5, i32* @g_2, align 4
  br label %1

; <label>:1                                       ; preds = %107, %0
  %2 = load volatile i32* @g_2, align 4
  %3 = icmp sle i32 %2, 0
  br i1 %3, label %4, label %112

; <label>:4                                       ; preds = %1
  store i32 0, i32* %i, align 4
  br label %5

; <label>:5                                       ; preds = %23, %4
  %6 = load i32* %i, align 4
  %7 = icmp slt i32 %6, 7
  br i1 %7, label %8, label %26

; <label>:8                                       ; preds = %5
  store i32 0, i32* %j, align 4
  br label %9

; <label>:9                                       ; preds = %19, %8
  %10 = load i32* %j, align 4
  %11 = icmp slt i32 %10, 3
  br i1 %11, label %12, label %22

; <label>:12                                      ; preds = %9
  %13 = load i32* %j, align 4
  %14 = sext i32 %13 to i64
  %15 = load i32* %i, align 4
  %16 = sext i32 %15 to i64
  %17 = getelementptr inbounds [7 x [3 x i16]]* %l_9, i32 0, i64 %16
  %18 = getelementptr inbounds [3 x i16]* %17, i32 0, i64 %14
  store i16 28248, i16* %18, align 2
  br label %19

; <label>:19                                      ; preds = %12
  %20 = load i32* %j, align 4
  %21 = add nsw i32 %20, 1
  store i32 %21, i32* %j, align 4
  br label %9

; <label>:22                                      ; preds = %9
  br label %23

; <label>:23                                      ; preds = %22
  %24 = load i32* %i, align 4
  %25 = add nsw i32 %24, 1
  store i32 %25, i32* %i, align 4
  br label %5

; <label>:26                                      ; preds = %5
  store i32 0, i32* %i, align 4
  br label %27

; <label>:27                                      ; preds = %34, %26
  %28 = load i32* %i, align 4
  %29 = icmp slt i32 %28, 6
  br i1 %29, label %30, label %37

; <label>:30                                      ; preds = %27
  %31 = load i32* %i, align 4
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds [6 x i32*]* %l_30, i32 0, i64 %32
  store i32* null, i32** %33, align 8
  br label %34

; <label>:34                                      ; preds = %30
  %35 = load i32* %i, align 4
  %36 = add nsw i32 %35, 1
  store i32 %36, i32* %i, align 4
  br label %27

; <label>:37                                      ; preds = %27
  %38 = getelementptr inbounds [7 x [3 x i16]]* %l_9, i32 0, i64 2
  %39 = getelementptr inbounds [3 x i16]* %38, i32 0, i64 0
  %40 = load i16* %39, align 2
  %41 = call zeroext i16 @safe_lshift_func_uint16_t_u_u(i16 zeroext %40, i32 -1240567729)
  %42 = trunc i16 %41 to i8
  %43 = load volatile i32* @g_2, align 4
  %44 = call i32 @safe_div_func_uint32_t_u_u(i32 -1, i32 %43)
  %45 = call zeroext i8 @safe_lshift_func_uint8_t_u_u(i8 zeroext %42, i32 %44)
  %46 = zext i8 %45 to i64
  %47 = load i32* @g_14, align 4
  %48 = trunc i32 %47 to i16
  %49 = load i32* @g_14, align 4
  %50 = trunc i32 %49 to i16
  %51 = call zeroext i16 @safe_mul_func_uint16_t_u_u(i16 zeroext %48, i16 zeroext %50)
  %52 = zext i16 %51 to i64
  %53 = icmp sgt i64 2619421253, %52
  %54 = zext i1 %53 to i32
  %55 = sext i32 %54 to i64
  %56 = or i64 %55, 2697992403
  %57 = icmp slt i64 %46, %56
  %58 = zext i1 %57 to i32
  %59 = sext i32 %58 to i64
  %60 = icmp eq i64 %59, 4028910655
  %61 = zext i1 %60 to i32
  %62 = getelementptr inbounds [7 x [3 x i16]]* %l_9, i32 0, i64 1
  %63 = getelementptr inbounds [3 x i16]* %62, i32 0, i64 1
  %64 = load i16* %63, align 2
  %65 = call zeroext i16 @safe_lshift_func_uint16_t_u_u(i16 zeroext %64, i32 -1263162930)
  %66 = zext i16 %65 to i32
  %67 = load i16* @g_28, align 2
  %68 = zext i16 %67 to i32
  %69 = load i32* %l_29, align 4
  %70 = icmp ult i32 %68, %69
  %71 = zext i1 %70 to i32
  %72 = icmp ne i32 %66, %71
  %73 = zext i1 %72 to i32
  %74 = trunc i32 %73 to i8
  %75 = getelementptr inbounds [6 x i32*]* %l_30, i32 0, i64 2
  %76 = load i32** %75, align 8
  %77 = icmp ne i32* @g_14, %76
  %78 = zext i1 %77 to i32
  %79 = sext i32 %78 to i64
  %80 = icmp sle i64 -1, %79
  %81 = zext i1 %80 to i32
  %82 = trunc i32 %81 to i8
  %83 = call signext i8 @safe_mul_func_int8_t_s_s(i8 signext %74, i8 signext %82)
  %84 = sext i8 %83 to i64
  %85 = load i32* @g_14, align 4
  %86 = load i32* %l_29, align 4
  %87 = call i32 @func_17(i64 %84, i8 signext -1, i32 %85, i32 %86)
  %88 = trunc i32 %87 to i16
  %89 = load i8* @g_41, align 1
  %90 = sext i8 %89 to i64
  %91 = load i32* %l_29, align 4
  %92 = zext i32 %91 to i64
  %93 = call i64 @safe_add_func_int64_t_s_s(i64 %90, i64 %92)
  %94 = trunc i64 %93 to i8
  %95 = load i32* @g_36, align 4
  %96 = trunc i32 %95 to i8
  %97 = call signext i8 @safe_mul_func_int8_t_s_s(i8 signext %94, i8 signext %96)
  %98 = call i32 @func_31(i8 zeroext %97)
  %99 = load i16* @g_28, align 2
  %100 = zext i16 %99 to i32
  %101 = icmp eq i32 %98, %100
  %102 = zext i1 %101 to i32
  %103 = call zeroext i16 @safe_rshift_func_uint16_t_u_u(i16 zeroext %88, i32 %102)
  %104 = zext i16 %103 to i32
  %105 = icmp sge i32 %61, %104
  %106 = zext i1 %105 to i32
  store i32 %106, i32* @g_14, align 4
  br label %107

; <label>:107                                     ; preds = %37
  %108 = load volatile i32* @g_2, align 4
  %109 = trunc i32 %108 to i8
  %110 = call zeroext i8 @safe_sub_func_uint8_t_u_u(i8 zeroext %109, i8 zeroext 8)
  %111 = zext i8 %110 to i32
  store volatile i32 %111, i32* @g_2, align 4
  br label %1

; <label>:112                                     ; preds = %1
  %113 = load i32** %l_42, align 8
  %114 = load i32** %l_42, align 8
  %115 = icmp ne i32* %113, %114
  %116 = zext i1 %115 to i32
  %117 = load i32** %l_42, align 8
  store i32 %116, i32* %117
  %118 = load i16* @g_28, align 2
  %119 = zext i16 %118 to i32
  ret i32 %119
}

define internal zeroext i8 @safe_lshift_func_uint8_t_u_u(i8 zeroext %left, i32 %right) nounwind uwtable {
  %1 = alloca i8, align 1
  %2 = alloca i32, align 4
  store i8 %left, i8* %1, align 1
  store i32 %right, i32* %2, align 4
  %3 = load i32* %2, align 4
  %4 = icmp uge i32 %3, 32
  br i1 %4, label %11, label %5

; <label>:5                                       ; preds = %0
  %6 = load i8* %1, align 1
  %7 = zext i8 %6 to i32
  %8 = load i32* %2, align 4
  %9 = ashr i32 255, %8
  %10 = icmp sgt i32 %7, %9
  br i1 %10, label %11, label %14

; <label>:11                                      ; preds = %5, %0
  %12 = load i8* %1, align 1
  %13 = zext i8 %12 to i32
  br label %19

; <label>:14                                      ; preds = %5
  %15 = load i8* %1, align 1
  %16 = zext i8 %15 to i32
  %17 = load i32* %2, align 4
  %18 = shl i32 %16, %17
  br label %19

; <label>:19                                      ; preds = %14, %11
  %20 = phi i32 [ %13, %11 ], [ %18, %14 ]
  %21 = trunc i32 %20 to i8
  ret i8 %21
}

define internal zeroext i16 @safe_lshift_func_uint16_t_u_u(i16 zeroext %left, i32 %right) nounwind uwtable {
  %1 = alloca i16, align 2
  %2 = alloca i32, align 4
  store i16 %left, i16* %1, align 2
  store i32 %right, i32* %2, align 4
  %3 = load i32* %2, align 4
  %4 = icmp uge i32 %3, 32
  br i1 %4, label %11, label %5

; <label>:5                                       ; preds = %0
  %6 = load i16* %1, align 2
  %7 = zext i16 %6 to i32
  %8 = load i32* %2, align 4
  %9 = ashr i32 65535, %8
  %10 = icmp sgt i32 %7, %9
  br i1 %10, label %11, label %14

; <label>:11                                      ; preds = %5, %0
  %12 = load i16* %1, align 2
  %13 = zext i16 %12 to i32
  br label %19

; <label>:14                                      ; preds = %5
  %15 = load i16* %1, align 2
  %16 = zext i16 %15 to i32
  %17 = load i32* %2, align 4
  %18 = shl i32 %16, %17
  br label %19

; <label>:19                                      ; preds = %14, %11
  %20 = phi i32 [ %13, %11 ], [ %18, %14 ]
  %21 = trunc i32 %20 to i16
  ret i16 %21
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

define internal zeroext i16 @safe_rshift_func_uint16_t_u_u(i16 zeroext %left, i32 %right) nounwind uwtable {
  %1 = alloca i16, align 2
  %2 = alloca i32, align 4
  store i16 %left, i16* %1, align 2
  store i32 %right, i32* %2, align 4
  %3 = load i32* %2, align 4
  %4 = icmp uge i32 %3, 32
  br i1 %4, label %5, label %8

; <label>:5                                       ; preds = %0
  %6 = load i16* %1, align 2
  %7 = zext i16 %6 to i32
  br label %13

; <label>:8                                       ; preds = %0
  %9 = load i16* %1, align 2
  %10 = zext i16 %9 to i32
  %11 = load i32* %2, align 4
  %12 = ashr i32 %10, %11
  br label %13

; <label>:13                                      ; preds = %8, %5
  %14 = phi i32 [ %7, %5 ], [ %12, %8 ]
  %15 = trunc i32 %14 to i16
  ret i16 %15
}

define i32 @func_17(i64 %p_18, i8 signext %p_19, i32 %p_20, i32 %p_21) nounwind uwtable {
  %1 = alloca i64, align 8
  %2 = alloca i8, align 1
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %l_22 = alloca i32*, align 8
  store i64 %p_18, i64* %1, align 8
  store i8 %p_19, i8* %2, align 1
  store i32 %p_20, i32* %3, align 4
  store i32 %p_21, i32* %4, align 4
  store i32* @g_23, i32** %l_22, align 8
  %5 = load i32* @g_14, align 4
  %6 = icmp ne i32 %5, 0
  br i1 %6, label %8, label %7

; <label>:7                                       ; preds = %0
  br label %8

; <label>:8                                       ; preds = %7, %0
  %9 = phi i1 [ true, %0 ], [ true, %7 ]
  %10 = zext i1 %9 to i32
  %11 = load i32** %l_22, align 8
  store i32 %10, i32* %11
  %12 = load i32* @g_14, align 4
  ret i32 %12
}

define internal signext i8 @safe_mul_func_int8_t_s_s(i8 signext %si1, i8 signext %si2) nounwind uwtable {
  %1 = alloca i8, align 1
  %2 = alloca i8, align 1
  store i8 %si1, i8* %1, align 1
  store i8 %si2, i8* %2, align 1
  %3 = load i8* %1, align 1
  %4 = sext i8 %3 to i32
  %5 = load i8* %2, align 1
  %6 = sext i8 %5 to i32
  %7 = mul nsw i32 %4, %6
  %8 = trunc i32 %7 to i8
  ret i8 %8
}

define i32 @func_31(i8 zeroext %p_32) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i8, align 1
  %l_33 = alloca [4 x [1 x i16]], align 2
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %i1 = alloca i32, align 4
  %j2 = alloca i32, align 4
  store i8 %p_32, i8* %2, align 1
  store i32 0, i32* %i, align 4
  br label %3

; <label>:3                                       ; preds = %21, %0
  %4 = load i32* %i, align 4
  %5 = icmp slt i32 %4, 4
  br i1 %5, label %6, label %24

; <label>:6                                       ; preds = %3
  store i32 0, i32* %j, align 4
  br label %7

; <label>:7                                       ; preds = %17, %6
  %8 = load i32* %j, align 4
  %9 = icmp slt i32 %8, 1
  br i1 %9, label %10, label %20

; <label>:10                                      ; preds = %7
  %11 = load i32* %j, align 4
  %12 = sext i32 %11 to i64
  %13 = load i32* %i, align 4
  %14 = sext i32 %13 to i64
  %15 = getelementptr inbounds [4 x [1 x i16]]* %l_33, i32 0, i64 %14
  %16 = getelementptr inbounds [1 x i16]* %15, i32 0, i64 %12
  store i16 8965, i16* %16, align 2
  br label %17

; <label>:17                                      ; preds = %10
  %18 = load i32* %j, align 4
  %19 = add nsw i32 %18, 1
  store i32 %19, i32* %j, align 4
  br label %7

; <label>:20                                      ; preds = %7
  br label %21

; <label>:21                                      ; preds = %20
  %22 = load i32* %i, align 4
  %23 = add nsw i32 %22, 1
  store i32 %23, i32* %i, align 4
  br label %3

; <label>:24                                      ; preds = %3
  store i8 1, i8* %2, align 1
  br label %25

; <label>:25                                      ; preds = %55, %24
  %26 = load i8* %2, align 1
  %27 = zext i8 %26 to i32
  %28 = icmp slt i32 %27, 4
  br i1 %28, label %29, label %60

; <label>:29                                      ; preds = %25
  store i32 0, i32* @g_34, align 4
  br label %30

; <label>:30                                      ; preds = %51, %29
  %31 = load i32* @g_34, align 4
  %32 = icmp slt i32 %31, 1
  br i1 %32, label %33, label %54

; <label>:33                                      ; preds = %30
  store i32 1, i32* @g_35, align 4
  br label %34

; <label>:34                                      ; preds = %47, %33
  %35 = load i32* @g_35, align 4
  %36 = icmp slt i32 %35, 4
  br i1 %36, label %37, label %50

; <label>:37                                      ; preds = %34
  store i32 0, i32* @g_36, align 4
  br label %38

; <label>:38                                      ; preds = %43, %37
  %39 = load i32* @g_36, align 4
  %40 = icmp slt i32 %39, 1
  br i1 %40, label %41, label %46

; <label>:41                                      ; preds = %38
  %42 = load i32* @g_14, align 4
  store i32 %42, i32* %1
  br label %65
                                                  ; No predecessors!
  %44 = load i32* @g_36, align 4
  %45 = add nsw i32 %44, 1
  store i32 %45, i32* @g_36, align 4
  br label %38

; <label>:46                                      ; preds = %38
  br label %47

; <label>:47                                      ; preds = %46
  %48 = load i32* @g_35, align 4
  %49 = add nsw i32 %48, 4
  store i32 %49, i32* @g_35, align 4
  br label %34

; <label>:50                                      ; preds = %34
  br label %51

; <label>:51                                      ; preds = %50
  %52 = load i32* @g_34, align 4
  %53 = add nsw i32 %52, 1
  store i32 %53, i32* @g_34, align 4
  br label %30

; <label>:54                                      ; preds = %30
  br label %55

; <label>:55                                      ; preds = %54
  %56 = load i8* %2, align 1
  %57 = zext i8 %56 to i32
  %58 = add nsw i32 %57, 3
  %59 = trunc i32 %58 to i8
  store i8 %59, i8* %2, align 1
  br label %25

; <label>:60                                      ; preds = %25
  %61 = getelementptr inbounds [4 x [1 x i16]]* %l_33, i32 0, i64 3
  %62 = getelementptr inbounds [1 x i16]* %61, i32 0, i64 0
  %63 = load i16* %62, align 2
  %64 = sext i16 %63 to i32
  store i32 %64, i32* %1
  br label %65

; <label>:65                                      ; preds = %60, %41
  %66 = load i32* %1
  ret i32 %66
}

define internal i64 @safe_add_func_int64_t_s_s(i64 %si1, i64 %si2) nounwind uwtable {
  %1 = alloca i64, align 8
  %2 = alloca i64, align 8
  store i64 %si1, i64* %1, align 8
  store i64 %si2, i64* %2, align 8
  %3 = load i64* %1, align 8
  %4 = icmp sgt i64 %3, 0
  br i1 %4, label %5, label %13

; <label>:5                                       ; preds = %0
  %6 = load i64* %2, align 8
  %7 = icmp sgt i64 %6, 0
  br i1 %7, label %8, label %13

; <label>:8                                       ; preds = %5
  %9 = load i64* %1, align 8
  %10 = load i64* %2, align 8
  %11 = sub nsw i64 9223372036854775807, %10
  %12 = icmp sgt i64 %9, %11
  br i1 %12, label %24, label %13

; <label>:13                                      ; preds = %8, %5, %0
  %14 = load i64* %1, align 8
  %15 = icmp slt i64 %14, 0
  br i1 %15, label %16, label %26

; <label>:16                                      ; preds = %13
  %17 = load i64* %2, align 8
  %18 = icmp slt i64 %17, 0
  br i1 %18, label %19, label %26

; <label>:19                                      ; preds = %16
  %20 = load i64* %1, align 8
  %21 = load i64* %2, align 8
  %22 = sub nsw i64 -9223372036854775808, %21
  %23 = icmp slt i64 %20, %22
  br i1 %23, label %24, label %26

; <label>:24                                      ; preds = %19, %8
  %25 = load i64* %1, align 8
  br label %30

; <label>:26                                      ; preds = %19, %16, %13
  %27 = load i64* %1, align 8
  %28 = load i64* %2, align 8
  %29 = add nsw i64 %27, %28
  br label %30

; <label>:30                                      ; preds = %26, %24
  %31 = phi i64 [ %25, %24 ], [ %29, %26 ]
  ret i64 %31
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

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  %4 = call i32 @func_1()
  %5 = load volatile i32* @g_2, align 4
  %6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %5)
  %7 = load i32* @g_14, align 4
  %8 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str1, i32 0, i32 0), i32 %7)
  %9 = load i32* @g_23, align 4
  %10 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str2, i32 0, i32 0), i32 %9)
  %11 = load i16* @g_28, align 2
  %12 = zext i16 %11 to i32
  %13 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str3, i32 0, i32 0), i32 %12)
  %14 = load i32* @g_34, align 4
  %15 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str4, i32 0, i32 0), i32 %14)
  %16 = load i32* @g_35, align 4
  %17 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str5, i32 0, i32 0), i32 %16)
  %18 = load i32* @g_36, align 4
  %19 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str6, i32 0, i32 0), i32 %18)
  %20 = load i8* @g_41, align 1
  %21 = sext i8 %20 to i32
  %22 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str7, i32 0, i32 0), i32 %21)
  %23 = load i32* %1
  ret i32 %23
}

declare i32 @printf(i8*, ...)
