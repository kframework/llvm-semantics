; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith001978.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = global i32 966279603, align 4
@g_9 = constant i32* @g_2, align 8
@g_53 = global i32* @g_2, align 8
@g_52 = global i32** @g_53, align 8
@g_76 = global [1 x i32*] zeroinitializer, align 8
@g_75 = global [10 x [5 x i32**]] [[5 x i32**] [i32** getelementptr inbounds ([1 x i32*]* @g_76, i32 0, i32 0), i32** getelementptr inbounds ([1 x i32*]* @g_76, i32 0, i32 0), i32** getelementptr inbounds ([1 x i32*]* @g_76, i32 0, i32 0), i32** getelementptr inbounds ([1 x i32*]* @g_76, i32 0, i32 0), i32** getelementptr inbounds ([1 x i32*]* @g_76, i32 0, i32 0)], [5 x i32**] [i32** getelementptr inbounds ([1 x i32*]* @g_76, i32 0, i32 0), i32** getelementptr inbounds ([1 x i32*]* @g_76, i32 0, i32 0), i32** getelementptr inbounds ([1 x i32*]* @g_76, i32 0, i32 0), i32** getelementptr inbounds ([1 x i32*]* @g_76, i32 0, i32 0), i32** getelementptr inbounds ([1 x i32*]* @g_76, i32 0, i32 0)], [5 x i32**] [i32** getelementptr inbounds ([1 x i32*]* @g_76, i32 0, i32 0), i32** getelementptr inbounds ([1 x i32*]* @g_76, i32 0, i32 0), i32** getelementptr inbounds ([1 x i32*]* @g_76, i32 0, i32 0), i32** getelementptr inbounds ([1 x i32*]* @g_76, i32 0, i32 0), i32** getelementptr inbounds ([1 x i32*]* @g_76, i32 0, i32 0)], [5 x i32**] [i32** getelementptr inbounds ([1 x i32*]* @g_76, i32 0, i32 0), i32** getelementptr inbounds ([1 x i32*]* @g_76, i32 0, i32 0), i32** getelementptr inbounds ([1 x i32*]* @g_76, i32 0, i32 0), i32** getelementptr inbounds ([1 x i32*]* @g_76, i32 0, i32 0), i32** getelementptr inbounds ([1 x i32*]* @g_76, i32 0, i32 0)], [5 x i32**] [i32** getelementptr inbounds ([1 x i32*]* @g_76, i32 0, i32 0), i32** getelementptr inbounds ([1 x i32*]* @g_76, i32 0, i32 0), i32** getelementptr inbounds ([1 x i32*]* @g_76, i32 0, i32 0), i32** getelementptr inbounds ([1 x i32*]* @g_76, i32 0, i32 0), i32** getelementptr inbounds ([1 x i32*]* @g_76, i32 0, i32 0)], [5 x i32**] [i32** getelementptr inbounds ([1 x i32*]* @g_76, i32 0, i32 0), i32** getelementptr inbounds ([1 x i32*]* @g_76, i32 0, i32 0), i32** getelementptr inbounds ([1 x i32*]* @g_76, i32 0, i32 0), i32** getelementptr inbounds ([1 x i32*]* @g_76, i32 0, i32 0), i32** getelementptr inbounds ([1 x i32*]* @g_76, i32 0, i32 0)], [5 x i32**] [i32** getelementptr inbounds ([1 x i32*]* @g_76, i32 0, i32 0), i32** getelementptr inbounds ([1 x i32*]* @g_76, i32 0, i32 0), i32** getelementptr inbounds ([1 x i32*]* @g_76, i32 0, i32 0), i32** getelementptr inbounds ([1 x i32*]* @g_76, i32 0, i32 0), i32** getelementptr inbounds ([1 x i32*]* @g_76, i32 0, i32 0)], [5 x i32**] [i32** getelementptr inbounds ([1 x i32*]* @g_76, i32 0, i32 0), i32** getelementptr inbounds ([1 x i32*]* @g_76, i32 0, i32 0), i32** getelementptr inbounds ([1 x i32*]* @g_76, i32 0, i32 0), i32** getelementptr inbounds ([1 x i32*]* @g_76, i32 0, i32 0), i32** getelementptr inbounds ([1 x i32*]* @g_76, i32 0, i32 0)], [5 x i32**] [i32** getelementptr inbounds ([1 x i32*]* @g_76, i32 0, i32 0), i32** getelementptr inbounds ([1 x i32*]* @g_76, i32 0, i32 0), i32** getelementptr inbounds ([1 x i32*]* @g_76, i32 0, i32 0), i32** getelementptr inbounds ([1 x i32*]* @g_76, i32 0, i32 0), i32** getelementptr inbounds ([1 x i32*]* @g_76, i32 0, i32 0)], [5 x i32**] [i32** getelementptr inbounds ([1 x i32*]* @g_76, i32 0, i32 0), i32** getelementptr inbounds ([1 x i32*]* @g_76, i32 0, i32 0), i32** getelementptr inbounds ([1 x i32*]* @g_76, i32 0, i32 0), i32** getelementptr inbounds ([1 x i32*]* @g_76, i32 0, i32 0), i32** getelementptr inbounds ([1 x i32*]* @g_76, i32 0, i32 0)]], align 16
@g_82 = global i32 1, align 4
@g_92 = global i32* @g_2, align 8
@g_91 = constant [7 x i32**] [i32** @g_92, i32** @g_92, i32** @g_92, i32** @g_92, i32** @g_92, i32** @g_92, i32** @g_92], align 16
@.str = private unnamed_addr constant [19 x i8] c"checksum g_2 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [20 x i8] c"checksum g_82 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define zeroext i16 @func_1() nounwind uwtable {
  %1 = alloca i16, align 2
  %l_8 = alloca i32, align 4
  %l_97 = alloca i32*, align 8
  %l_5 = alloca i16, align 2
  %l_14 = alloca i32, align 4
  %l_29 = alloca [4 x [1 x [3 x i32*]]], align 16
  %l_98 = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %l_100 = alloca i32**, align 8
  store i32 9, i32* %l_8, align 4
  store i32* @g_2, i32** %l_97, align 8
  store i32 0, i32* @g_2, align 4
  br label %2

; <label>:2                                       ; preds = %7, %0
  %3 = load i32* @g_2, align 4
  %4 = icmp sge i32 %3, -24
  br i1 %4, label %5, label %12

; <label>:5                                       ; preds = %2
  store i16 7, i16* %l_5, align 2
  %6 = load i16* %l_5, align 2
  store i16 %6, i16* %1
  br label %134
                                                  ; No predecessors!
  %8 = load i32* @g_2, align 4
  %9 = trunc i32 %8 to i8
  %10 = call signext i8 @safe_add_func_int8_t_s_s(i8 signext %9, i8 signext 0)
  %11 = sext i8 %10 to i32
  store i32 %11, i32* @g_2, align 4
  br label %2

; <label>:12                                      ; preds = %2
  store i32 0, i32* @g_2, align 4
  br label %13

; <label>:13                                      ; preds = %126, %12
  %14 = load i32* @g_2, align 4
  %15 = icmp sge i32 %14, 13
  br i1 %15, label %16, label %131

; <label>:16                                      ; preds = %13
  store i32 -1141265166, i32* %l_14, align 4
  store i32 -1, i32* %l_98, align 4
  store i32 0, i32* %i, align 4
  br label %17

; <label>:17                                      ; preds = %46, %16
  %18 = load i32* %i, align 4
  %19 = icmp slt i32 %18, 4
  br i1 %19, label %20, label %49

; <label>:20                                      ; preds = %17
  store i32 0, i32* %j, align 4
  br label %21

; <label>:21                                      ; preds = %42, %20
  %22 = load i32* %j, align 4
  %23 = icmp slt i32 %22, 1
  br i1 %23, label %24, label %45

; <label>:24                                      ; preds = %21
  store i32 0, i32* %k, align 4
  br label %25

; <label>:25                                      ; preds = %38, %24
  %26 = load i32* %k, align 4
  %27 = icmp slt i32 %26, 3
  br i1 %27, label %28, label %41

; <label>:28                                      ; preds = %25
  %29 = load i32* %k, align 4
  %30 = sext i32 %29 to i64
  %31 = load i32* %j, align 4
  %32 = sext i32 %31 to i64
  %33 = load i32* %i, align 4
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds [4 x [1 x [3 x i32*]]]* %l_29, i32 0, i64 %34
  %36 = getelementptr inbounds [1 x [3 x i32*]]* %35, i32 0, i64 %32
  %37 = getelementptr inbounds [3 x i32*]* %36, i32 0, i64 %30
  store i32* %l_8, i32** %37, align 8
  br label %38

; <label>:38                                      ; preds = %28
  %39 = load i32* %k, align 4
  %40 = add nsw i32 %39, 1
  store i32 %40, i32* %k, align 4
  br label %25

; <label>:41                                      ; preds = %25
  br label %42

; <label>:42                                      ; preds = %41
  %43 = load i32* %j, align 4
  %44 = add nsw i32 %43, 1
  store i32 %44, i32* %j, align 4
  br label %21

; <label>:45                                      ; preds = %21
  br label %46

; <label>:46                                      ; preds = %45
  %47 = load i32* %i, align 4
  %48 = add nsw i32 %47, 1
  store i32 %48, i32* %i, align 4
  br label %17

; <label>:49                                      ; preds = %17
  %50 = load i32* %l_8, align 4
  %51 = load volatile i32** @g_9, align 8
  %52 = load i32* %51
  %53 = xor i32 %52, %50
  store i32 %53, i32* %51
  %54 = load i32* %l_14, align 4
  %55 = load i32* %l_8, align 4
  %56 = icmp ne i32 %54, %55
  br i1 %56, label %69, label %57

; <label>:57                                      ; preds = %49
  %58 = load i32* %l_8, align 4
  %59 = load volatile i32** @g_9, align 8
  %60 = load i32* %59
  %61 = trunc i32 %60 to i16
  %62 = load i32* %l_14, align 4
  %63 = call signext i16 @safe_rshift_func_int16_t_s_u(i16 signext %61, i32 %62)
  %64 = sext i16 %63 to i32
  %65 = icmp sge i32 %58, %64
  %66 = zext i1 %65 to i32
  %67 = load i32* %l_14, align 4
  %68 = icmp ule i32 %66, %67
  br label %69

; <label>:69                                      ; preds = %57, %49
  %70 = phi i1 [ true, %49 ], [ %68, %57 ]
  %71 = zext i1 %70 to i32
  %72 = load i32* @g_2, align 4
  %73 = trunc i32 %72 to i8
  %74 = getelementptr inbounds [4 x [1 x [3 x i32*]]]* %l_29, i32 0, i64 1
  %75 = getelementptr inbounds [1 x [3 x i32*]]* %74, i32 0, i64 0
  %76 = getelementptr inbounds [3 x i32*]* %75, i32 0, i64 0
  %77 = load i32** %76, align 8
  %78 = load i32* @g_2, align 4
  %79 = trunc i32 %78 to i8
  %80 = call i32* @func_25(i32* %l_8, i32* %77, i8 signext %79)
  %81 = load i32* @g_2, align 4
  %82 = icmp ne i32 %81, 0
  %83 = xor i1 %82, true
  %84 = zext i1 %83 to i32
  %85 = trunc i32 %84 to i8
  %86 = call i32* @func_25(i32* @g_2, i32* %80, i8 signext %85)
  %87 = load i32** %l_97, align 8
  %88 = load i32* %l_98, align 4
  %89 = trunc i32 %88 to i8
  %90 = call i32 @func_19(i32* %86, i32* %87, i8 zeroext %89, i32* %l_8)
  %91 = trunc i32 %90 to i8
  %92 = call zeroext i8 @safe_sub_func_uint8_t_u_u(i8 zeroext %73, i8 zeroext %91)
  %93 = zext i8 %92 to i32
  %94 = call i32 @safe_add_func_int32_t_s_s(i32 %71, i32 %93)
  %95 = trunc i32 %94 to i16
  %96 = load i32** @g_53, align 8
  %97 = load i32* %96
  %98 = load i32** %l_97, align 8
  %99 = load i32* %98
  %100 = load i32** %l_97, align 8
  %101 = load i32* %100
  %102 = call i32 @safe_unary_minus_func_uint32_t_u(i32 %101)
  %103 = icmp ult i32 %99, %102
  %104 = zext i1 %103 to i32
  %105 = icmp ne i32 %97, %104
  %106 = zext i1 %105 to i32
  %107 = trunc i32 %106 to i16
  %108 = call signext i16 @safe_mod_func_int16_t_s_s(i16 signext %95, i16 signext %107)
  %109 = icmp ne i16 %108, 0
  br i1 %109, label %110, label %113

; <label>:110                                     ; preds = %69
  %111 = load i32* @g_2, align 4
  %112 = trunc i32 %111 to i16
  store i16 %112, i16* %1
  br label %134

; <label>:113                                     ; preds = %69
  store i32** %l_97, i32*** %l_100, align 8
  %114 = load i32* @g_82, align 4
  %115 = load i32** %l_97, align 8
  %116 = load i32* %115
  %117 = call i32 @func_42(i32 %114, i32 %116)
  %118 = load volatile i32** @g_9, align 8
  %119 = load i32* %118
  %120 = icmp eq i32 %117, %119
  %121 = zext i1 %120 to i32
  %122 = sext i32 %121 to i64
  %123 = call i32* @func_77(i64 %122)
  %124 = load i32*** %l_100, align 8
  store i32* %123, i32** %124
  br label %125

; <label>:125                                     ; preds = %113
  br label %126

; <label>:126                                     ; preds = %125
  %127 = load i32* @g_2, align 4
  %128 = sext i32 %127 to i64
  %129 = call i64 @safe_sub_func_uint64_t_u_u(i64 %128, i64 1)
  %130 = trunc i64 %129 to i32
  store i32 %130, i32* @g_2, align 4
  br label %13

; <label>:131                                     ; preds = %13
  %132 = load i32* @g_2, align 4
  %133 = trunc i32 %132 to i16
  store i16 %133, i16* %1
  br label %134

; <label>:134                                     ; preds = %131, %110, %5
  %135 = load i16* %1
  ret i16 %135
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

define i32 @func_19(i32* %p_20, i32* %p_21, i8 zeroext %p_22, i32* %p_23) nounwind uwtable {
  %1 = alloca i32*, align 8
  %2 = alloca i32*, align 8
  %3 = alloca i8, align 1
  %4 = alloca i32*, align 8
  %l_24 = alloca i32, align 4
  store i32* %p_20, i32** %1, align 8
  store i32* %p_21, i32** %2, align 8
  store i8 %p_22, i8* %3, align 1
  store i32* %p_23, i32** %4, align 8
  store i32 442835045, i32* %l_24, align 4
  %5 = load i32* %l_24, align 4
  ret i32 %5
}

define i32* @func_25(i32* %p_26, i32* %p_27, i8 signext %p_28) nounwind uwtable {
  %1 = alloca i32*, align 8
  %2 = alloca i32*, align 8
  %3 = alloca i8, align 1
  store i32* %p_26, i32** %1, align 8
  store i32* %p_27, i32** %2, align 8
  store i8 %p_28, i8* %3, align 1
  %4 = load i32** %1, align 8
  ret i32* %4
}

define internal i32 @safe_unary_minus_func_uint32_t_u(i32 %ui) nounwind uwtable {
  %1 = alloca i32, align 4
  store i32 %ui, i32* %1, align 4
  %2 = load i32* %1, align 4
  %3 = sub i32 0, %2
  ret i32 %3
}

define i32* @func_77(i64 %p_78) nounwind uwtable {
  %1 = alloca i64, align 8
  %l_79 = alloca i32*, align 8
  %l_80 = alloca [1 x i32**], align 8
  %l_81 = alloca i32*, align 8
  %l_83 = alloca i32*, align 8
  %i = alloca i32, align 4
  %l_86 = alloca i64, align 8
  %l_87 = alloca [4 x i32], align 16
  %i1 = alloca i32, align 4
  store i64 %p_78, i64* %1, align 8
  store i32* @g_2, i32** %l_79, align 8
  store i32* @g_82, i32** %l_81, align 8
  store i32* null, i32** %l_83, align 8
  store i32 0, i32* %i, align 4
  br label %2

; <label>:2                                       ; preds = %9, %0
  %3 = load i32* %i, align 4
  %4 = icmp slt i32 %3, 1
  br i1 %4, label %5, label %12

; <label>:5                                       ; preds = %2
  %6 = load i32* %i, align 4
  %7 = sext i32 %6 to i64
  %8 = getelementptr inbounds [1 x i32**]* %l_80, i32 0, i64 %7
  store i32** %l_79, i32*** %8, align 8
  br label %9

; <label>:9                                       ; preds = %5
  %10 = load i32* %i, align 4
  %11 = add nsw i32 %10, 1
  store i32 %11, i32* %i, align 4
  br label %2

; <label>:12                                      ; preds = %2
  br label %13

; <label>:13                                      ; preds = %42, %12
  %14 = load i32** %l_79, align 8
  store i32* %14, i32** %l_81, align 8
  store i32* null, i32** %l_83, align 8
  store i64 -3, i64* %1, align 8
  br label %15

; <label>:15                                      ; preds = %36, %13
  %16 = load i64* %1, align 8
  %17 = icmp ule i64 %16, -17
  br i1 %17, label %18, label %39

; <label>:18                                      ; preds = %15
  store i64 6, i64* %l_86, align 8
  store i32 0, i32* %i1, align 4
  br label %19

; <label>:19                                      ; preds = %26, %18
  %20 = load i32* %i1, align 4
  %21 = icmp slt i32 %20, 4
  br i1 %21, label %22, label %29

; <label>:22                                      ; preds = %19
  %23 = load i32* %i1, align 4
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds [4 x i32]* %l_87, i32 0, i64 %24
  store i32 -1139917298, i32* %25, align 4
  br label %26

; <label>:26                                      ; preds = %22
  %27 = load i32* %i1, align 4
  %28 = add nsw i32 %27, 1
  store i32 %28, i32* %i1, align 4
  br label %19

; <label>:29                                      ; preds = %19
  %30 = load i64* %l_86, align 8
  %31 = getelementptr inbounds [4 x i32]* %l_87, i32 0, i64 1
  %32 = load i32* %31, align 4
  %33 = sext i32 %32 to i64
  %34 = and i64 %33, %30
  %35 = trunc i64 %34 to i32
  store i32 %35, i32* %31, align 4
  br label %36

; <label>:36                                      ; preds = %29
  %37 = load i64* %1, align 8
  %38 = call i64 @safe_sub_func_int64_t_s_s(i64 %37, i64 1)
  store i64 %38, i64* %1, align 8
  br label %15

; <label>:39                                      ; preds = %15
  %40 = load i64* %1, align 8
  %41 = icmp ne i64 %40, 0
  br i1 %41, label %42, label %43

; <label>:42                                      ; preds = %39
  br label %13

; <label>:43                                      ; preds = %39
  ret i32* @g_2
}

define i32 @func_42(i32 %p_43, i32 %p_44) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %l_45 = alloca i32, align 4
  store i32 %p_43, i32* %1, align 4
  store i32 %p_44, i32* %2, align 4
  store i32 1410334470, i32* %l_45, align 4
  %3 = load i32* %l_45, align 4
  ret i32 %3
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

define i32* @func_30(i32* %p_31) nounwind uwtable {
  %1 = alloca i32*, align 8
  %l_32 = alloca i16, align 2
  %l_94 = alloca i32*, align 8
  %l_95 = alloca i32**, align 8
  %l_96 = alloca i32**, align 8
  store i32* %p_31, i32** %1, align 8
  store i16 7, i16* %l_32, align 2
  store i32* @g_82, i32** %l_94, align 8
  store i32** null, i32*** %l_95, align 8
  store i32** %l_94, i32*** %l_96, align 8
  %2 = load i16* %l_32, align 2
  %3 = sext i16 %2 to i32
  %4 = load i32** %1, align 8
  store i32 %3, i32* %4
  %5 = load i16* %l_32, align 2
  %6 = sext i16 %5 to i32
  %7 = load i32** %l_94, align 8
  %8 = icmp eq i32* %7, null
  %9 = zext i1 %8 to i32
  %10 = call i32 @func_42(i32 %6, i32 %9)
  %11 = load i32** %l_94, align 8
  %12 = load i32* @g_2, align 4
  %13 = load i32* @g_2, align 4
  %14 = sext i32 %13 to i64
  %15 = load i32* @g_2, align 4
  %16 = trunc i32 %15 to i16
  %17 = call i32* @func_33(i32 %10, i32* %11, i32 %12, i64 %14, i16 signext %16)
  %18 = load i32** %l_94, align 8
  %19 = load i32** %l_94, align 8
  %20 = load i32* %19
  %21 = trunc i32 %20 to i8
  %22 = call i32* @func_25(i32* %17, i32* %18, i8 signext %21)
  %23 = load i32** %l_94, align 8
  %24 = load i32* %23
  %25 = trunc i32 %24 to i8
  %26 = call i32* @func_25(i32* @g_2, i32* %22, i8 signext %25)
  %27 = load i32*** %l_96, align 8
  store i32* %26, i32** %27
  %28 = load i32** %1, align 8
  ret i32* %28
}

define i32* @func_33(i32 %p_34, i32* %p_35, i32 %p_36, i64 %p_37, i16 signext %p_38) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32*, align 8
  %3 = alloca i32, align 4
  %4 = alloca i64, align 8
  %5 = alloca i16, align 2
  %l_41 = alloca i8, align 1
  %l_48 = alloca i32, align 4
  %l_51 = alloca i32*, align 8
  %l_50 = alloca i32**, align 8
  %l_49 = alloca [2 x [3 x [8 x i32***]]], align 16
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %l_89 = alloca i32*, align 8
  %l_90 = alloca i32*, align 8
  %l_93 = alloca i32, align 4
  store i32 %p_34, i32* %1, align 4
  store i32* %p_35, i32** %2, align 8
  store i32 %p_36, i32* %3, align 4
  store i64 %p_37, i64* %4, align 8
  store i16 %p_38, i16* %5, align 2
  store i8 -93, i8* %l_41, align 1
  store i32 1707783216, i32* %l_48, align 4
  store i32* %l_48, i32** %l_51, align 8
  store i32** %l_51, i32*** %l_50, align 8
  store i32 0, i32* %i, align 4
  br label %6

; <label>:6                                       ; preds = %35, %0
  %7 = load i32* %i, align 4
  %8 = icmp slt i32 %7, 2
  br i1 %8, label %9, label %38

; <label>:9                                       ; preds = %6
  store i32 0, i32* %j, align 4
  br label %10

; <label>:10                                      ; preds = %31, %9
  %11 = load i32* %j, align 4
  %12 = icmp slt i32 %11, 3
  br i1 %12, label %13, label %34

; <label>:13                                      ; preds = %10
  store i32 0, i32* %k, align 4
  br label %14

; <label>:14                                      ; preds = %27, %13
  %15 = load i32* %k, align 4
  %16 = icmp slt i32 %15, 8
  br i1 %16, label %17, label %30

; <label>:17                                      ; preds = %14
  %18 = load i32* %k, align 4
  %19 = sext i32 %18 to i64
  %20 = load i32* %j, align 4
  %21 = sext i32 %20 to i64
  %22 = load i32* %i, align 4
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds [2 x [3 x [8 x i32***]]]* %l_49, i32 0, i64 %23
  %25 = getelementptr inbounds [3 x [8 x i32***]]* %24, i32 0, i64 %21
  %26 = getelementptr inbounds [8 x i32***]* %25, i32 0, i64 %19
  store i32*** %l_50, i32**** %26, align 8
  br label %27

; <label>:27                                      ; preds = %17
  %28 = load i32* %k, align 4
  %29 = add nsw i32 %28, 1
  store i32 %29, i32* %k, align 4
  br label %14

; <label>:30                                      ; preds = %14
  br label %31

; <label>:31                                      ; preds = %30
  %32 = load i32* %j, align 4
  %33 = add nsw i32 %32, 1
  store i32 %33, i32* %j, align 4
  br label %10

; <label>:34                                      ; preds = %10
  br label %35

; <label>:35                                      ; preds = %34
  %36 = load i32* %i, align 4
  %37 = add nsw i32 %36, 1
  store i32 %37, i32* %i, align 4
  br label %6

; <label>:38                                      ; preds = %6
  %39 = load i8* %l_41, align 1
  %40 = sext i8 %39 to i16
  %41 = call signext i8 @safe_lshift_func_int8_t_s_s(i8 signext 36, i32 1956576990)
  %42 = sext i8 %41 to i32
  %43 = load i8* %l_41, align 1
  %44 = sext i8 %43 to i32
  %45 = call i32 @func_42(i32 %42, i32 %44)
  %46 = trunc i32 %45 to i16
  %47 = call zeroext i16 @safe_add_func_uint16_t_u_u(i16 zeroext %40, i16 zeroext %46)
  %48 = zext i16 %47 to i32
  %49 = load i32* %l_48, align 4
  %50 = or i32 %49, %48
  store i32 %50, i32* %l_48, align 4
  store i32** null, i32*** @g_52, align 8
  %51 = load i32** %2, align 8
  %52 = load i32* %51
  %53 = load i32** %2, align 8
  %54 = load i32* %53
  %55 = icmp eq i32 %52, %54
  %56 = zext i1 %55 to i32
  %57 = sext i32 %56 to i64
  %58 = load i32** %2, align 8
  %59 = load i32* %58
  %60 = load i32** %l_51, align 8
  %61 = load i32* %60
  %62 = load i32* @g_2, align 4
  %63 = trunc i32 %62 to i8
  %64 = call i32* @func_58(i32 %61, i32*** null, i8 signext %63)
  %65 = call i32 @func_19(i32* %64, i32* @g_2, i8 zeroext -79, i32* null)
  %66 = call i32 @safe_mod_func_uint32_t_u_u(i32 %59, i32 %65)
  %67 = zext i32 %66 to i64
  %68 = call i64 @safe_add_func_int64_t_s_s(i64 %57, i64 %67)
  %69 = icmp ne i64 %68, 0
  br i1 %69, label %70, label %82

; <label>:70                                      ; preds = %38
  %71 = load i32** %2, align 8
  %72 = load i32* %71
  %73 = icmp ne i32 %72, 0
  br i1 %73, label %74, label %78

; <label>:74                                      ; preds = %70
  %75 = load i32** %2, align 8
  %76 = load i32* %75
  %77 = icmp ne i32 %76, 0
  br label %78

; <label>:78                                      ; preds = %74, %70
  %79 = phi i1 [ false, %70 ], [ %77, %74 ]
  %80 = zext i1 %79 to i32
  %81 = load i32** %l_51, align 8
  store i32 %80, i32* %81
  br label %145

; <label>:82                                      ; preds = %38
  store i32* null, i32** %l_89, align 8
  store i32* %l_48, i32** %l_90, align 8
  store i32 1275188668, i32* %l_93, align 4
  %83 = load i32* @g_82, align 4
  %84 = sext i32 %83 to i64
  %85 = call i32* @func_77(i64 %84)
  %86 = load i32*** %l_50, align 8
  %87 = load i32** %l_51, align 8
  %88 = load i32* %87
  %89 = load i32** %2, align 8
  %90 = load i32** %l_89, align 8
  %91 = icmp ne i32* %89, %90
  %92 = zext i1 %91 to i32
  %93 = icmp ne i32 %88, %92
  %94 = zext i1 %93 to i32
  %95 = trunc i32 %94 to i16
  %96 = load i32* @g_2, align 4
  %97 = load i32* %1, align 4
  %98 = trunc i32 %97 to i16
  %99 = load i32* @g_2, align 4
  %100 = call i32 @func_63(i32** getelementptr inbounds ([1 x i32*]* @g_76, i32 0, i64 0), i32 %96, i16 signext %98, i32** @g_53, i32 %99)
  %101 = icmp ne i32 %100, 0
  br i1 %101, label %110, label %102

; <label>:102                                     ; preds = %82
  %103 = load i32** %l_90, align 8
  %104 = load i32** %l_90, align 8
  %105 = load i32* %1, align 4
  %106 = trunc i32 %105 to i8
  %107 = load i32** %l_90, align 8
  %108 = call i32 @func_19(i32* %103, i32* %104, i8 zeroext %106, i32* %107)
  %109 = icmp ne i32 %108, 0
  br label %110

; <label>:110                                     ; preds = %102, %82
  %111 = phi i1 [ true, %82 ], [ %109, %102 ]
  %112 = xor i1 %111, true
  %113 = zext i1 %112 to i32
  %114 = trunc i32 %113 to i16
  %115 = call i32** @func_70(i32* %85, i32** %86, i16 zeroext %95, i16 signext %114)
  %116 = load i32*** %l_50, align 8
  %117 = load i32** %116
  %118 = load i32* %117
  %119 = load i64* %4, align 8
  %120 = trunc i64 %119 to i16
  %121 = load i32*** getelementptr inbounds ([7 x i32**]* @g_91, i32 0, i64 2), align 8
  %122 = load i32* @g_2, align 4
  %123 = call i32 @func_63(i32** %115, i32 %118, i16 signext %120, i32** %121, i32 %122)
  %124 = load i32*** %l_50, align 8
  %125 = load i32** %124
  %126 = load i32* %125
  %127 = icmp sgt i32 %123, %126
  %128 = zext i1 %127 to i32
  %129 = load i32* %l_93, align 4
  %130 = and i32 %129, %128
  store i32 %130, i32* %l_93, align 4
  store i8 0, i8* %l_41, align 1
  br label %131

; <label>:131                                     ; preds = %139, %110
  %132 = load i8* %l_41, align 1
  %133 = sext i8 %132 to i32
  %134 = icmp slt i32 %133, 1
  br i1 %134, label %135, label %144

; <label>:135                                     ; preds = %131
  %136 = load i8* %l_41, align 1
  %137 = sext i8 %136 to i64
  %138 = getelementptr inbounds [1 x i32*]* @g_76, i32 0, i64 %137
  store i32* @g_2, i32** %138, align 8
  br label %139

; <label>:139                                     ; preds = %135
  %140 = load i8* %l_41, align 1
  %141 = sext i8 %140 to i32
  %142 = add nsw i32 %141, 1
  %143 = trunc i32 %142 to i8
  store i8 %143, i8* %l_41, align 1
  br label %131

; <label>:144                                     ; preds = %131
  br label %145

; <label>:145                                     ; preds = %144, %78
  %146 = load i32*** %l_50, align 8
  %147 = load i32** %146
  ret i32* %147
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

define internal i32 @safe_mod_func_uint32_t_u_u(i32 %ui1, i32 %ui2) nounwind uwtable {
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
  %10 = urem i32 %8, %9
  br label %11

; <label>:11                                      ; preds = %7, %5
  %12 = phi i32 [ %6, %5 ], [ %10, %7 ]
  ret i32 %12
}

define i32* @func_58(i32 %p_59, i32*** %p_60, i8 signext %p_61) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32***, align 8
  %3 = alloca i8, align 1
  %l_62 = alloca i32*, align 8
  store i32 %p_59, i32* %1, align 4
  store i32*** %p_60, i32**** %2, align 8
  store i8 %p_61, i8* %3, align 1
  store i32* @g_2, i32** %l_62, align 8
  %4 = load i32** %l_62, align 8
  ret i32* %4
}

define i32 @func_63(i32** %p_64, i32 %p_65, i16 signext %p_66, i32** %p_67, i32 %p_68) nounwind uwtable {
  %1 = alloca i32**, align 8
  %2 = alloca i32, align 4
  %3 = alloca i16, align 2
  %4 = alloca i32**, align 8
  %5 = alloca i32, align 4
  %l_69 = alloca [9 x [10 x i32]], align 16
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32** %p_64, i32*** %1, align 8
  store i32 %p_65, i32* %2, align 4
  store i16 %p_66, i16* %3, align 2
  store i32** %p_67, i32*** %4, align 8
  store i32 %p_68, i32* %5, align 4
  store i32 0, i32* %i, align 4
  br label %6

; <label>:6                                       ; preds = %24, %0
  %7 = load i32* %i, align 4
  %8 = icmp slt i32 %7, 9
  br i1 %8, label %9, label %27

; <label>:9                                       ; preds = %6
  store i32 0, i32* %j, align 4
  br label %10

; <label>:10                                      ; preds = %20, %9
  %11 = load i32* %j, align 4
  %12 = icmp slt i32 %11, 10
  br i1 %12, label %13, label %23

; <label>:13                                      ; preds = %10
  %14 = load i32* %j, align 4
  %15 = sext i32 %14 to i64
  %16 = load i32* %i, align 4
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds [9 x [10 x i32]]* %l_69, i32 0, i64 %17
  %19 = getelementptr inbounds [10 x i32]* %18, i32 0, i64 %15
  store i32 -1503318190, i32* %19, align 4
  br label %20

; <label>:20                                      ; preds = %13
  %21 = load i32* %j, align 4
  %22 = add nsw i32 %21, 1
  store i32 %22, i32* %j, align 4
  br label %10

; <label>:23                                      ; preds = %10
  br label %24

; <label>:24                                      ; preds = %23
  %25 = load i32* %i, align 4
  %26 = add nsw i32 %25, 1
  store i32 %26, i32* %i, align 4
  br label %6

; <label>:27                                      ; preds = %6
  %28 = load i32*** %4, align 8
  %29 = load i32** %28
  %30 = load i32*** %4, align 8
  store i32* %29, i32** %30
  %31 = getelementptr inbounds [9 x [10 x i32]]* %l_69, i32 0, i64 5
  %32 = getelementptr inbounds [10 x i32]* %31, i32 0, i64 6
  %33 = load i32* %32, align 4
  ret i32 %33
}

define i32** @func_70(i32* %p_71, i32** %p_72, i16 zeroext %p_73, i16 signext %p_74) nounwind uwtable {
  %1 = alloca i32*, align 8
  %2 = alloca i32**, align 8
  %3 = alloca i16, align 2
  %4 = alloca i16, align 2
  store i32* %p_71, i32** %1, align 8
  store i32** %p_72, i32*** %2, align 8
  store i16 %p_73, i16* %3, align 2
  store i16 %p_74, i16* %4, align 2
  %5 = load i32*** getelementptr inbounds ([10 x [5 x i32**]]* @g_75, i32 0, i64 4, i64 3), align 8
  ret i32** %5
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
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  %4 = call zeroext i16 @func_1()
  %5 = load i32* @g_2, align 4
  %6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %5)
  %7 = load i32* @g_82, align 4
  %8 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str1, i32 0, i32 0), i32 %7)
  %9 = load i32* %1
  ret i32 %9
}

declare i32 @printf(i8*, ...)
