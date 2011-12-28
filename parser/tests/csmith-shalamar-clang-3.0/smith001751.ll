; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith001751.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = global i32 7, align 4
@g_13 = global [5 x [2 x i32]] [[2 x i32] [i32 1, i32 1], [2 x i32] [i32 1, i32 1], [2 x i32] [i32 1, i32 1], [2 x i32] [i32 1, i32 1], [2 x i32] [i32 1, i32 1]], align 16
@g_40 = global [2 x [3 x i32*]] [[3 x i32*] [i32* bitcast (i8* getelementptr (i8* bitcast ([5 x [2 x i32]]* @g_13 to i8*), i64 24) to i32*), i32* bitcast (i8* getelementptr (i8* bitcast ([5 x [2 x i32]]* @g_13 to i8*), i64 24) to i32*), i32* bitcast (i8* getelementptr (i8* bitcast ([5 x [2 x i32]]* @g_13 to i8*), i64 24) to i32*)], [3 x i32*] [i32* bitcast (i8* getelementptr (i8* bitcast ([5 x [2 x i32]]* @g_13 to i8*), i64 24) to i32*), i32* bitcast (i8* getelementptr (i8* bitcast ([5 x [2 x i32]]* @g_13 to i8*), i64 24) to i32*), i32* bitcast (i8* getelementptr (i8* bitcast ([5 x [2 x i32]]* @g_13 to i8*), i64 24) to i32*)]], align 16
@g_41 = global i32* bitcast (i8* getelementptr (i8* bitcast ([5 x [2 x i32]]* @g_13 to i8*), i64 32) to i32*), align 8
@func_1.l_5 = internal constant [7 x [3 x i32]] [[3 x i32] [i32 -2050559553, i32 -2050559553, i32 -2050559553], [3 x i32] [i32 -2050559553, i32 -2050559553, i32 -2050559553], [3 x i32] [i32 -2050559553, i32 -2050559553, i32 -2050559553], [3 x i32] [i32 -2050559553, i32 -2050559553, i32 -2050559553], [3 x i32] [i32 -2050559553, i32 -2050559553, i32 -2050559553], [3 x i32] [i32 -2050559553, i32 -2050559553, i32 -2050559553], [3 x i32] [i32 -2050559553, i32 -2050559553, i32 -2050559553]], align 16
@.str = private unnamed_addr constant [19 x i8] c"checksum g_2 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [26 x i8] c"checksum g_13[0][0] = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [26 x i8] c"checksum g_13[0][1] = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [26 x i8] c"checksum g_13[1][0] = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [26 x i8] c"checksum g_13[1][1] = %d\0A\00", align 1
@.str5 = private unnamed_addr constant [26 x i8] c"checksum g_13[2][0] = %d\0A\00", align 1
@.str6 = private unnamed_addr constant [26 x i8] c"checksum g_13[2][1] = %d\0A\00", align 1
@.str7 = private unnamed_addr constant [26 x i8] c"checksum g_13[3][0] = %d\0A\00", align 1
@.str8 = private unnamed_addr constant [26 x i8] c"checksum g_13[3][1] = %d\0A\00", align 1
@.str9 = private unnamed_addr constant [26 x i8] c"checksum g_13[4][0] = %d\0A\00", align 1
@.str10 = private unnamed_addr constant [26 x i8] c"checksum g_13[4][1] = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i64 @func_1() nounwind uwtable {
  %1 = alloca i64, align 8
  %l_38 = alloca i8, align 1
  %l_39 = alloca i64, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i8 -1, i8* %l_38, align 1
  store i64 4, i64* %l_39, align 8
  store volatile i32 7, i32* @g_2, align 4
  br label %2

; <label>:2                                       ; preds = %8, %0
  %3 = load volatile i32* @g_2, align 4
  %4 = icmp sgt i32 %3, 0
  br i1 %4, label %5, label %13

; <label>:5                                       ; preds = %2
  %6 = load i32* getelementptr inbounds ([7 x [3 x i32]]* @func_1.l_5, i32 0, i64 1, i64 2), align 4
  %7 = sext i32 %6 to i64
  store i64 %7, i64* %1
  br label %32
                                                  ; No predecessors!
  %9 = load volatile i32* @g_2, align 4
  %10 = trunc i32 %9 to i8
  %11 = call signext i8 @safe_add_func_int8_t_s_s(i8 signext %10, i8 signext 1)
  %12 = sext i8 %11 to i32
  store volatile i32 %12, i32* @g_2, align 4
  br label %2

; <label>:13                                      ; preds = %2
  %14 = load volatile i32* @g_2, align 4
  %15 = load i8* %l_38, align 1
  %16 = sext i8 %15 to i64
  %17 = load i8* %l_38, align 1
  %18 = sext i8 %17 to i32
  %19 = load i8* %l_38, align 1
  %20 = call i32 @func_6(i32 1, i64 %16, i32 %18, i8 signext %19)
  %21 = or i32 %14, %20
  %22 = icmp ne i32 %21, 0
  br i1 %22, label %23, label %26

; <label>:23                                      ; preds = %13
  %24 = load i64* %l_39, align 8
  %25 = icmp ne i64 %24, 0
  br label %26

; <label>:26                                      ; preds = %23, %13
  %27 = phi i1 [ false, %13 ], [ %25, %23 ]
  %28 = zext i1 %27 to i32
  %29 = load volatile i32** @g_41, align 8
  store i32 %28, i32* %29
  %30 = load i8* %l_38, align 1
  %31 = sext i8 %30 to i64
  store i64 %31, i64* %1
  br label %32

; <label>:32                                      ; preds = %26, %5
  %33 = load i64* %1
  ret i64 %33
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

define i32 @func_6(i32 %p_7, i64 %p_8, i32 %p_9, i8 signext %p_10) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i64, align 8
  %4 = alloca i32, align 4
  %5 = alloca i8, align 1
  %l_11 = alloca i16, align 2
  %l_12 = alloca i32*, align 8
  %l_28 = alloca i32**, align 8
  %l_27 = alloca [8 x i32***], align 16
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %l_33 = alloca i64, align 8
  %l_36 = alloca i32***, align 8
  store i32 %p_7, i32* %2, align 4
  store i64 %p_8, i64* %3, align 8
  store i32 %p_9, i32* %4, align 4
  store i8 %p_10, i8* %5, align 1
  store i16 8907, i16* %l_11, align 2
  store i32* getelementptr inbounds ([5 x [2 x i32]]* @g_13, i32 0, i64 3, i64 0), i32** %l_12, align 8
  store i32** %l_12, i32*** %l_28, align 8
  store i32 0, i32* %i, align 4
  br label %6

; <label>:6                                       ; preds = %13, %0
  %7 = load i32* %i, align 4
  %8 = icmp slt i32 %7, 8
  br i1 %8, label %9, label %16

; <label>:9                                       ; preds = %6
  %10 = load i32* %i, align 4
  %11 = sext i32 %10 to i64
  %12 = getelementptr inbounds [8 x i32***]* %l_27, i32 0, i64 %11
  store i32*** %l_28, i32**** %12, align 8
  br label %13

; <label>:13                                      ; preds = %9
  %14 = load i32* %i, align 4
  %15 = add nsw i32 %14, 1
  store i32 %15, i32* %i, align 4
  br label %6

; <label>:16                                      ; preds = %6
  %17 = load i16* %l_11, align 2
  %18 = sext i16 %17 to i64
  %19 = icmp sle i64 3419336788, %18
  %20 = zext i1 %19 to i32
  %21 = load i32** %l_12, align 8
  store i32 %20, i32* %21
  store i64 0, i64* %3, align 8
  br label %22

; <label>:22                                      ; preds = %134, %16
  %23 = load i64* %3, align 8
  %24 = icmp slt i64 %23, 5
  br i1 %24, label %25, label %137

; <label>:25                                      ; preds = %22
  store i8 1, i8* %5, align 1
  br label %26

; <label>:26                                      ; preds = %128, %25
  %27 = load i8* %5, align 1
  %28 = sext i8 %27 to i32
  %29 = icmp slt i32 %28, 2
  br i1 %29, label %30, label %133

; <label>:30                                      ; preds = %26
  store i64 1, i64* %l_33, align 8
  store i32*** null, i32**** %l_36, align 8
  %31 = load i32** %l_12, align 8
  store i32 -1, i32* %31
  %32 = load i8* %5, align 1
  %33 = zext i8 %32 to i32
  %34 = srem i32 %33, 2
  %35 = sext i32 %34 to i64
  %36 = load i64* %3, align 8
  %37 = urem i64 %36, 5
  %38 = getelementptr inbounds [5 x [2 x i32]]* @g_13, i32 0, i64 %37
  %39 = getelementptr inbounds [2 x i32]* %38, i32 0, i64 %35
  %40 = load i32* %39, align 4
  %41 = trunc i32 %40 to i8
  %42 = getelementptr inbounds [8 x i32***]* %l_27, i32 0, i64 1
  %43 = load i32**** %42, align 8
  %44 = icmp eq i32*** %43, %l_28
  %45 = zext i1 %44 to i32
  %46 = trunc i32 %45 to i8
  %47 = call signext i8 @safe_add_func_int8_t_s_s(i8 signext %41, i8 signext %46)
  %48 = sext i8 %47 to i32
  %49 = icmp ne i32 %48, 0
  br i1 %49, label %50, label %92

; <label>:50                                      ; preds = %30
  %51 = load i32* getelementptr inbounds ([5 x [2 x i32]]* @g_13, i32 0, i64 3, i64 0), align 4
  %52 = load i32*** %l_28, align 8
  %53 = load i32** %52
  %54 = load i32* %53
  %55 = trunc i32 %54 to i8
  %56 = load i8* %5, align 1
  %57 = zext i8 %56 to i32
  %58 = srem i32 %57, 2
  %59 = sext i32 %58 to i64
  %60 = load i64* %3, align 8
  %61 = urem i64 %60, 5
  %62 = getelementptr inbounds [5 x [2 x i32]]* @g_13, i32 0, i64 %61
  %63 = getelementptr inbounds [2 x i32]* %62, i32 0, i64 %59
  %64 = load i32* %63, align 4
  %65 = trunc i32 %64 to i8
  %66 = call signext i8 @safe_add_func_int8_t_s_s(i8 signext %55, i8 signext %65)
  %67 = sext i8 %66 to i32
  %68 = or i32 %51, %67
  %69 = trunc i32 %68 to i8
  %70 = load i32* getelementptr inbounds ([5 x [2 x i32]]* @g_13, i32 0, i64 1, i64 1), align 4
  %71 = sext i32 %70 to i64
  %72 = load i64* %l_33, align 8
  %73 = icmp ult i64 %71, %72
  br i1 %73, label %85, label %74

; <label>:74                                      ; preds = %50
  %75 = load i8* %5, align 1
  %76 = zext i8 %75 to i32
  %77 = srem i32 %76, 2
  %78 = sext i32 %77 to i64
  %79 = load i64* %3, align 8
  %80 = urem i64 %79, 5
  %81 = getelementptr inbounds [5 x [2 x i32]]* @g_13, i32 0, i64 %80
  %82 = getelementptr inbounds [2 x i32]* %81, i32 0, i64 %78
  %83 = load i32* %82, align 4
  %84 = icmp ne i32 %83, 0
  br label %85

; <label>:85                                      ; preds = %74, %50
  %86 = phi i1 [ true, %50 ], [ %84, %74 ]
  %87 = zext i1 %86 to i32
  %88 = trunc i32 %87 to i8
  %89 = call zeroext i8 @safe_div_func_uint8_t_u_u(i8 zeroext %69, i8 zeroext %88)
  %90 = zext i8 %89 to i32
  %91 = icmp ne i32 %90, 0
  br label %92

; <label>:92                                      ; preds = %85, %30
  %93 = phi i1 [ false, %30 ], [ %91, %85 ]
  %94 = zext i1 %93 to i32
  %95 = load i64* %l_33, align 8
  %96 = trunc i64 %95 to i16
  %97 = call zeroext i16 @safe_lshift_func_uint16_t_u_u(i16 zeroext %96, i32 7)
  %98 = zext i16 %97 to i32
  %99 = load i32*** %l_28, align 8
  %100 = load i32** %99
  %101 = load i32* %100
  %102 = icmp eq i32 %98, %101
  %103 = zext i1 %102 to i32
  %104 = load i32* getelementptr inbounds ([5 x [2 x i32]]* @g_13, i32 0, i64 0, i64 0), align 4
  %105 = xor i32 %103, %104
  %106 = trunc i32 %105 to i8
  %107 = load i32* getelementptr inbounds ([5 x [2 x i32]]* @g_13, i32 0, i64 3, i64 0), align 4
  %108 = sext i32 %107 to i64
  %109 = call i32 @func_14(i32 %94, i8 signext %106, i64 %108)
  %110 = load i32* getelementptr inbounds ([5 x [2 x i32]]* @g_13, i32 0, i64 3, i64 0), align 4
  %111 = trunc i32 %110 to i8
  %112 = call i32 @func_14(i32 %109, i8 signext %111, i64 0)
  %113 = load i32*** %l_28, align 8
  %114 = load i32** %113
  store i32 %112, i32* %114
  %115 = load i8* %5, align 1
  %116 = icmp ne i8 %115, 0
  br i1 %116, label %117, label %118

; <label>:117                                     ; preds = %92
  br label %119

; <label>:118                                     ; preds = %92
  br label %119

; <label>:119                                     ; preds = %118, %117
  %120 = load i32**** %l_36, align 8
  %121 = load i32**** %l_36, align 8
  %122 = icmp eq i32*** %120, %121
  %123 = zext i1 %122 to i32
  %124 = load i32** %l_12, align 8
  %125 = load i32* %124
  %126 = or i32 %125, %123
  store i32 %126, i32* %124
  %127 = load i32* getelementptr inbounds ([5 x [2 x i32]]* @g_13, i32 0, i64 2, i64 0), align 4
  store i32 %127, i32* %1
  br label %139
                                                  ; No predecessors!
  %129 = load i8* %5, align 1
  %130 = sext i8 %129 to i32
  %131 = add nsw i32 %130, 2
  %132 = trunc i32 %131 to i8
  store i8 %132, i8* %5, align 1
  br label %26

; <label>:133                                     ; preds = %26
  br label %134

; <label>:134                                     ; preds = %133
  %135 = load i64* %3, align 8
  %136 = add nsw i64 %135, 4
  store i64 %136, i64* %3, align 8
  br label %22

; <label>:137                                     ; preds = %22
  %138 = load i32* getelementptr inbounds ([5 x [2 x i32]]* @g_13, i32 0, i64 2, i64 0), align 4
  store i32 %138, i32* %1
  br label %139

; <label>:139                                     ; preds = %137, %119
  %140 = load i32* %1
  ret i32 %140
}

define i32 @func_14(i32 %p_15, i8 signext %p_16, i64 %p_17) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i8, align 1
  %3 = alloca i64, align 8
  %l_22 = alloca [7 x i32*], align 16
  %l_24 = alloca i32**, align 8
  %l_23 = alloca i32***, align 8
  %i = alloca i32, align 4
  store i32 %p_15, i32* %1, align 4
  store i8 %p_16, i8* %2, align 1
  store i64 %p_17, i64* %3, align 8
  store i32** null, i32*** %l_24, align 8
  store i32*** %l_24, i32**** %l_23, align 8
  store i32 0, i32* %i, align 4
  br label %4

; <label>:4                                       ; preds = %11, %0
  %5 = load i32* %i, align 4
  %6 = icmp slt i32 %5, 7
  br i1 %6, label %7, label %14

; <label>:7                                       ; preds = %4
  %8 = load i32* %i, align 4
  %9 = sext i32 %8 to i64
  %10 = getelementptr inbounds [7 x i32*]* %l_22, i32 0, i64 %9
  store i32* getelementptr inbounds ([5 x [2 x i32]]* @g_13, i32 0, i64 3, i64 0), i32** %10, align 8
  br label %11

; <label>:11                                      ; preds = %7
  %12 = load i32* %i, align 4
  %13 = add nsw i32 %12, 1
  store i32 %13, i32* %i, align 4
  br label %4

; <label>:14                                      ; preds = %4
  %15 = getelementptr inbounds [7 x i32*]* %l_22, i32 0, i64 4
  %16 = load i32** %15, align 8
  %17 = icmp ne i32* %16, null
  br i1 %17, label %21, label %18

; <label>:18                                      ; preds = %14
  %19 = load i32* getelementptr inbounds ([5 x [2 x i32]]* @g_13, i32 0, i64 3, i64 1), align 4
  %20 = icmp ne i32 %19, 0
  br label %21

; <label>:21                                      ; preds = %18, %14
  %22 = phi i1 [ true, %14 ], [ %20, %18 ]
  %23 = zext i1 %22 to i32
  %24 = sext i32 %23 to i64
  %25 = call i32** @func_18(i64 %24)
  %26 = load i32**** %l_23, align 8
  store i32** %25, i32*** %26
  %27 = load i32* %1, align 4
  ret i32 %27
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

define i32** @func_18(i64 %p_19) nounwind uwtable {
  %1 = alloca i64, align 8
  %l_21 = alloca [4 x [4 x [2 x [1 x i32*]]]], align 16
  %l_20 = alloca i32**, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %l = alloca i32, align 4
  store i64 %p_19, i64* %1, align 8
  %2 = getelementptr inbounds [4 x [4 x [2 x [1 x i32*]]]]* %l_21, i32 0, i64 0
  %3 = getelementptr inbounds [4 x [2 x [1 x i32*]]]* %2, i32 0, i64 2
  %4 = getelementptr inbounds [2 x [1 x i32*]]* %3, i32 0, i64 1
  %5 = getelementptr inbounds [1 x i32*]* %4, i32 0, i64 0
  store i32** %5, i32*** %l_20, align 8
  store i32 0, i32* %i, align 4
  br label %6

; <label>:6                                       ; preds = %46, %0
  %7 = load i32* %i, align 4
  %8 = icmp slt i32 %7, 4
  br i1 %8, label %9, label %49

; <label>:9                                       ; preds = %6
  store i32 0, i32* %j, align 4
  br label %10

; <label>:10                                      ; preds = %42, %9
  %11 = load i32* %j, align 4
  %12 = icmp slt i32 %11, 4
  br i1 %12, label %13, label %45

; <label>:13                                      ; preds = %10
  store i32 0, i32* %k, align 4
  br label %14

; <label>:14                                      ; preds = %38, %13
  %15 = load i32* %k, align 4
  %16 = icmp slt i32 %15, 2
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
  %30 = getelementptr inbounds [4 x [4 x [2 x [1 x i32*]]]]* %l_21, i32 0, i64 %29
  %31 = getelementptr inbounds [4 x [2 x [1 x i32*]]]* %30, i32 0, i64 %27
  %32 = getelementptr inbounds [2 x [1 x i32*]]* %31, i32 0, i64 %25
  %33 = getelementptr inbounds [1 x i32*]* %32, i32 0, i64 %23
  store i32* getelementptr inbounds ([5 x [2 x i32]]* @g_13, i32 0, i64 1, i64 1), i32** %33, align 8
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
  %50 = load i32*** %l_20, align 8
  ret i32** %50
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
  %4 = call i64 @func_1()
  %5 = load volatile i32* @g_2, align 4
  %6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %5)
  %7 = load i32* getelementptr inbounds ([5 x [2 x i32]]* @g_13, i32 0, i64 0, i64 0), align 4
  %8 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str1, i32 0, i32 0), i32 %7)
  %9 = load i32* getelementptr inbounds ([5 x [2 x i32]]* @g_13, i32 0, i64 0, i64 1), align 4
  %10 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str2, i32 0, i32 0), i32 %9)
  %11 = load i32* getelementptr inbounds ([5 x [2 x i32]]* @g_13, i32 0, i64 1, i64 0), align 4
  %12 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str3, i32 0, i32 0), i32 %11)
  %13 = load i32* getelementptr inbounds ([5 x [2 x i32]]* @g_13, i32 0, i64 1, i64 1), align 4
  %14 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str4, i32 0, i32 0), i32 %13)
  %15 = load i32* getelementptr inbounds ([5 x [2 x i32]]* @g_13, i32 0, i64 2, i64 0), align 4
  %16 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str5, i32 0, i32 0), i32 %15)
  %17 = load i32* getelementptr inbounds ([5 x [2 x i32]]* @g_13, i32 0, i64 2, i64 1), align 4
  %18 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str6, i32 0, i32 0), i32 %17)
  %19 = load i32* getelementptr inbounds ([5 x [2 x i32]]* @g_13, i32 0, i64 3, i64 0), align 4
  %20 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str7, i32 0, i32 0), i32 %19)
  %21 = load i32* getelementptr inbounds ([5 x [2 x i32]]* @g_13, i32 0, i64 3, i64 1), align 4
  %22 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str8, i32 0, i32 0), i32 %21)
  %23 = load i32* getelementptr inbounds ([5 x [2 x i32]]* @g_13, i32 0, i64 4, i64 0), align 4
  %24 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str9, i32 0, i32 0), i32 %23)
  %25 = load i32* getelementptr inbounds ([5 x [2 x i32]]* @g_13, i32 0, i64 4, i64 1), align 4
  %26 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str10, i32 0, i32 0), i32 %25)
  %27 = load i32* getelementptr inbounds ([5 x [2 x i32]]* @g_13, i32 0, i64 3, i64 0), align 4
  %28 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str7, i32 0, i32 0), i32 %27)
  %29 = load i32* %1
  ret i32 %29
}

declare i32 @printf(i8*, ...)
