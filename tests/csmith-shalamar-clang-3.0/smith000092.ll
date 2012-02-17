; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith000092.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_5 = global [3 x [4 x i32]] [[4 x i32] [i32 -10, i32 -10, i32 -10, i32 -10], [4 x i32] [i32 -10, i32 -10, i32 -10, i32 -10], [4 x i32] [i32 -10, i32 -10, i32 -10, i32 -10]], align 16
@g_33 = global i32 0, align 4
@g_32 = global i32* @g_33, align 8
@g_36 = global i32* @g_33, align 8
@g_38 = global i32* @g_33, align 8
@g_37 = global i32** @g_38, align 8
@.str = private unnamed_addr constant [25 x i8] c"checksum g_5[0][0] = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [25 x i8] c"checksum g_5[0][1] = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [25 x i8] c"checksum g_5[0][2] = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [25 x i8] c"checksum g_5[0][3] = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [25 x i8] c"checksum g_5[1][0] = %d\0A\00", align 1
@.str5 = private unnamed_addr constant [25 x i8] c"checksum g_5[1][1] = %d\0A\00", align 1
@.str6 = private unnamed_addr constant [25 x i8] c"checksum g_5[1][2] = %d\0A\00", align 1
@.str7 = private unnamed_addr constant [25 x i8] c"checksum g_5[1][3] = %d\0A\00", align 1
@.str8 = private unnamed_addr constant [25 x i8] c"checksum g_5[2][0] = %d\0A\00", align 1
@.str9 = private unnamed_addr constant [25 x i8] c"checksum g_5[2][1] = %d\0A\00", align 1
@.str10 = private unnamed_addr constant [25 x i8] c"checksum g_5[2][2] = %d\0A\00", align 1
@.str11 = private unnamed_addr constant [25 x i8] c"checksum g_5[2][3] = %d\0A\00", align 1
@.str12 = private unnamed_addr constant [20 x i8] c"checksum g_33 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable {
  %l_4 = alloca i8, align 1
  %l_48 = alloca i32*, align 8
  store i8 0, i8* %l_4, align 1
  store i32* @g_33, i32** %l_48, align 8
  %1 = load i8* %l_4, align 1
  %2 = zext i8 %1 to i32
  %3 = load i32* getelementptr inbounds ([3 x [4 x i32]]* @g_5, i32 0, i64 2, i64 0), align 4
  %4 = or i32 %2, %3
  %5 = load volatile i32** @g_32, align 8
  %6 = load i32* %5
  %7 = load i32** @g_38, align 8
  %8 = load i32* %7
  %9 = call i32 @safe_div_func_uint32_t_u_u(i32 %6, i32 %8)
  %10 = load i8* %l_4, align 1
  %11 = zext i8 %10 to i64
  %12 = load i8* %l_4, align 1
  %13 = zext i8 %12 to i32
  %14 = call i32 @func_6(i32 %9, i64 7024505740294227236, i64 0, i64 %11, i32 %13)
  %15 = xor i32 %4, %14
  %16 = load i8* %l_4, align 1
  %17 = zext i8 %16 to i32
  %18 = call i32 @safe_mod_func_uint32_t_u_u(i32 %15, i32 %17)
  %19 = xor i32 %18, -1
  %20 = load i32* getelementptr inbounds ([3 x [4 x i32]]* @g_5, i32 0, i64 1, i64 2), align 4
  %21 = sext i32 %20 to i64
  %22 = icmp ne i64 2826668813, %21
  br i1 %22, label %47, label %23

; <label>:23                                      ; preds = %0
  %24 = load i8* %l_4, align 1
  %25 = zext i8 %24 to i32
  %26 = load i8* %l_4, align 1
  %27 = zext i8 %26 to i32
  %28 = icmp sle i32 %25, %27
  %29 = zext i1 %28 to i32
  %30 = load i8* %l_4, align 1
  %31 = load i32* getelementptr inbounds ([3 x [4 x i32]]* @g_5, i32 0, i64 2, i64 3), align 4
  %32 = trunc i32 %31 to i8
  %33 = call signext i8 @safe_sub_func_int8_t_s_s(i8 signext %30, i8 signext %32)
  %34 = sext i8 %33 to i16
  %35 = load i32* getelementptr inbounds ([3 x [4 x i32]]* @g_5, i32 0, i64 0, i64 3), align 4
  %36 = load i32* getelementptr inbounds ([3 x [4 x i32]]* @g_5, i32 0, i64 2, i64 0), align 4
  %37 = or i32 %35, %36
  %38 = trunc i32 %37 to i16
  %39 = call signext i16 @safe_div_func_int16_t_s_s(i16 signext %34, i16 signext %38)
  %40 = sext i16 %39 to i32
  %41 = icmp sle i32 %29, %40
  %42 = zext i1 %41 to i32
  %43 = trunc i32 %42 to i8
  %44 = call zeroext i8 @safe_mod_func_uint8_t_u_u(i8 zeroext %43, i8 zeroext 93)
  %45 = zext i8 %44 to i32
  %46 = icmp ne i32 %45, 0
  br label %47

; <label>:47                                      ; preds = %23, %0
  %48 = phi i1 [ true, %0 ], [ %46, %23 ]
  %49 = zext i1 %48 to i32
  %50 = xor i32 %19, %49
  %51 = load i32** %l_48, align 8
  store i32 %50, i32* %51
  %52 = load i32** %l_48, align 8
  %53 = load i32* %52
  ret i32 %53
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

define i32 @func_6(i32 %p_7, i64 %p_8, i64 %p_9, i64 %p_10, i32 %p_11) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i64, align 8
  %4 = alloca i64, align 8
  %5 = alloca i64, align 8
  %6 = alloca i32, align 4
  %l_16 = alloca i32, align 4
  %l_39 = alloca i16, align 2
  %l_25 = alloca [2 x i64], align 16
  %i = alloca i32, align 4
  %l_34 = alloca i32*, align 8
  %l_35 = alloca i32*, align 8
  store i32 %p_7, i32* %2, align 4
  store i64 %p_8, i64* %3, align 8
  store i64 %p_9, i64* %4, align 8
  store i64 %p_10, i64* %5, align 8
  store i32 %p_11, i32* %6, align 4
  store i32 0, i32* %l_16, align 4
  store i16 -1, i16* %l_39, align 2
  store i64 -20, i64* %3, align 8
  br label %7

; <label>:7                                       ; preds = %12, %0
  %8 = load i64* %3, align 8
  %9 = icmp ne i64 %8, 0
  br i1 %9, label %10, label %17

; <label>:10                                      ; preds = %7
  %11 = load i32* getelementptr inbounds ([3 x [4 x i32]]* @g_5, i32 0, i64 2, i64 0), align 4
  store i32 %11, i32* %1
  br label %114
                                                  ; No predecessors!
  %13 = load i64* %3, align 8
  %14 = trunc i64 %13 to i32
  %15 = call i32 @safe_add_func_uint32_t_u_u(i32 %14, i32 1)
  %16 = zext i32 %15 to i64
  store i64 %16, i64* %3, align 8
  br label %7

; <label>:17                                      ; preds = %7
  store i64 0, i64* %3, align 8
  br label %18

; <label>:18                                      ; preds = %106, %17
  %19 = load i64* %3, align 8
  %20 = icmp ugt i64 %19, 0
  br i1 %20, label %21, label %111

; <label>:21                                      ; preds = %18
  store i32 0, i32* %i, align 4
  br label %22

; <label>:22                                      ; preds = %29, %21
  %23 = load i32* %i, align 4
  %24 = icmp slt i32 %23, 2
  br i1 %24, label %25, label %32

; <label>:25                                      ; preds = %22
  %26 = load i32* %i, align 4
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds [2 x i64]* %l_25, i32 0, i64 %27
  store i64 3879122604978662393, i64* %28, align 8
  br label %29

; <label>:29                                      ; preds = %25
  %30 = load i32* %i, align 4
  %31 = add nsw i32 %30, 1
  store i32 %31, i32* %i, align 4
  br label %22

; <label>:32                                      ; preds = %22
  %33 = load i32* %l_16, align 4
  %34 = zext i32 %33 to i64
  %35 = load i64* %4, align 8
  %36 = and i64 %34, %35
  %37 = icmp ne i64 %36, 0
  br i1 %37, label %38, label %82

; <label>:38                                      ; preds = %32
  %39 = load i32* getelementptr inbounds ([3 x [4 x i32]]* @g_5, i32 0, i64 2, i64 0), align 4
  %40 = trunc i32 %39 to i8
  %41 = load i32* getelementptr inbounds ([3 x [4 x i32]]* @g_5, i32 0, i64 0, i64 1), align 4
  %42 = trunc i32 %41 to i16
  %43 = load i32* getelementptr inbounds ([3 x [4 x i32]]* @g_5, i32 0, i64 2, i64 0), align 4
  %44 = call signext i16 @safe_rshift_func_int16_t_s_u(i16 signext %42, i32 %43)
  %45 = sext i16 %44 to i32
  %46 = load i32* %l_16, align 4
  %47 = and i32 %45, %46
  %48 = trunc i32 %47 to i16
  %49 = getelementptr inbounds [2 x i64]* %l_25, i32 0, i64 0
  %50 = load i64* %49, align 8
  %51 = trunc i64 %50 to i16
  %52 = call signext i16 @safe_sub_func_int16_t_s_s(i16 signext %48, i16 signext %51)
  %53 = trunc i16 %52 to i8
  %54 = getelementptr inbounds [2 x i64]* %l_25, i32 0, i64 0
  %55 = load i64* %54, align 8
  %56 = trunc i64 %55 to i32
  %57 = load i64* %5, align 8
  %58 = icmp ne i64 %57, 0
  br i1 %58, label %59, label %63

; <label>:59                                      ; preds = %38
  %60 = getelementptr inbounds [2 x i64]* %l_25, i32 0, i64 1
  %61 = load i64* %60, align 8
  %62 = icmp ne i64 %61, 0
  br label %63

; <label>:63                                      ; preds = %59, %38
  %64 = phi i1 [ false, %38 ], [ %62, %59 ]
  %65 = zext i1 %64 to i32
  %66 = trunc i32 %65 to i16
  %67 = load i64* %3, align 8
  %68 = trunc i64 %67 to i16
  %69 = getelementptr inbounds [2 x i64]* %l_25, i32 0, i64 0
  %70 = load i64* %69, align 8
  %71 = trunc i64 %70 to i32
  %72 = call zeroext i16 @safe_lshift_func_uint16_t_u_u(i16 zeroext %68, i32 %71)
  %73 = call signext i16 @safe_mul_func_int16_t_s_s(i16 signext %66, i16 signext %72)
  %74 = sext i16 %73 to i32
  %75 = call i32 @safe_add_func_int32_t_s_s(i32 %56, i32 %74)
  %76 = trunc i32 %75 to i8
  %77 = call signext i8 @safe_mul_func_int8_t_s_s(i8 signext %53, i8 signext %76)
  %78 = sext i8 %77 to i32
  %79 = call zeroext i8 @safe_rshift_func_uint8_t_u_s(i8 zeroext %40, i32 %78)
  %80 = zext i8 %79 to i32
  %81 = icmp ne i32 %80, 0
  br label %82

; <label>:82                                      ; preds = %63, %32
  %83 = phi i1 [ false, %32 ], [ %81, %63 ]
  %84 = zext i1 %83 to i32
  %85 = load volatile i32** @g_32, align 8
  store i32 %84, i32* %85
  store i32 0, i32* %2, align 4
  br label %86

; <label>:86                                      ; preds = %102, %82
  %87 = load i32* %2, align 4
  %88 = icmp ult i32 %87, 2
  br i1 %88, label %89, label %105

; <label>:89                                      ; preds = %86
  store i32* null, i32** %l_34, align 8
  store i32* null, i32** %l_35, align 8
  %90 = load i32* %2, align 4
  %91 = urem i32 %90, 2
  %92 = zext i32 %91 to i64
  %93 = getelementptr inbounds [2 x i64]* %l_25, i32 0, i64 %92
  %94 = load i64* %93, align 8
  %95 = load volatile i32** @g_36, align 8
  %96 = load i32* %95
  %97 = sext i32 %96 to i64
  %98 = or i64 %97, %94
  %99 = trunc i64 %98 to i32
  store i32 %99, i32* %95
  %100 = load i32** %l_35, align 8
  %101 = load volatile i32*** @g_37, align 8
  store i32* %100, i32** %101
  br label %102

; <label>:102                                     ; preds = %89
  %103 = load i32* %2, align 4
  %104 = add i32 %103, 1
  store i32 %104, i32* %2, align 4
  br label %86

; <label>:105                                     ; preds = %86
  br label %106

; <label>:106                                     ; preds = %105
  %107 = load i64* %3, align 8
  %108 = trunc i64 %107 to i32
  %109 = call i32 @safe_add_func_int32_t_s_s(i32 %108, i32 0)
  %110 = sext i32 %109 to i64
  store i64 %110, i64* %3, align 8
  br label %18

; <label>:111                                     ; preds = %18
  %112 = load i16* %l_39, align 2
  %113 = sext i16 %112 to i32
  store i32 %113, i32* %1
  br label %114

; <label>:114                                     ; preds = %111, %10
  %115 = load i32* %1
  ret i32 %115
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

define internal zeroext i8 @safe_mod_func_uint8_t_u_u(i8 zeroext %ui1, i8 zeroext %ui2) nounwind uwtable {
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
  %14 = srem i32 %11, %13
  br label %15

; <label>:15                                      ; preds = %9, %6
  %16 = phi i32 [ %8, %6 ], [ %14, %9 ]
  %17 = trunc i32 %16 to i8
  ret i8 %17
}

define internal signext i16 @safe_div_func_int16_t_s_s(i16 signext %si1, i16 signext %si2) nounwind uwtable {
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
  %22 = sdiv i32 %19, %21
  br label %23

; <label>:23                                      ; preds = %17, %14
  %24 = phi i32 [ %16, %14 ], [ %22, %17 ]
  %25 = trunc i32 %24 to i16
  ret i16 %25
}

define internal signext i8 @safe_sub_func_int8_t_s_s(i8 signext %si1, i8 signext %si2) nounwind uwtable {
  %1 = alloca i8, align 1
  %2 = alloca i8, align 1
  store i8 %si1, i8* %1, align 1
  store i8 %si2, i8* %2, align 1
  %3 = load i8* %1, align 1
  %4 = sext i8 %3 to i32
  %5 = load i8* %2, align 1
  %6 = sext i8 %5 to i32
  %7 = sub nsw i32 %4, %6
  %8 = trunc i32 %7 to i8
  ret i8 %8
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

define internal zeroext i8 @safe_rshift_func_uint8_t_u_s(i8 zeroext %left, i32 %right) nounwind uwtable {
  %1 = alloca i8, align 1
  %2 = alloca i32, align 4
  store i8 %left, i8* %1, align 1
  store i32 %right, i32* %2, align 4
  %3 = load i32* %2, align 4
  %4 = icmp slt i32 %3, 0
  br i1 %4, label %8, label %5

; <label>:5                                       ; preds = %0
  %6 = load i32* %2, align 4
  %7 = icmp sge i32 %6, 32
  br i1 %7, label %8, label %11

; <label>:8                                       ; preds = %5, %0
  %9 = load i8* %1, align 1
  %10 = zext i8 %9 to i32
  br label %16

; <label>:11                                      ; preds = %5
  %12 = load i8* %1, align 1
  %13 = zext i8 %12 to i32
  %14 = load i32* %2, align 4
  %15 = ashr i32 %13, %14
  br label %16

; <label>:16                                      ; preds = %11, %8
  %17 = phi i32 [ %10, %8 ], [ %15, %11 ]
  %18 = trunc i32 %17 to i8
  ret i8 %18
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

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  %4 = call i32 @func_1()
  %5 = load i32* getelementptr inbounds ([3 x [4 x i32]]* @g_5, i32 0, i64 0, i64 0), align 4
  %6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str, i32 0, i32 0), i32 %5)
  %7 = load i32* getelementptr inbounds ([3 x [4 x i32]]* @g_5, i32 0, i64 0, i64 1), align 4
  %8 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str1, i32 0, i32 0), i32 %7)
  %9 = load i32* getelementptr inbounds ([3 x [4 x i32]]* @g_5, i32 0, i64 0, i64 2), align 4
  %10 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str2, i32 0, i32 0), i32 %9)
  %11 = load i32* getelementptr inbounds ([3 x [4 x i32]]* @g_5, i32 0, i64 0, i64 3), align 4
  %12 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str3, i32 0, i32 0), i32 %11)
  %13 = load i32* getelementptr inbounds ([3 x [4 x i32]]* @g_5, i32 0, i64 1, i64 0), align 4
  %14 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str4, i32 0, i32 0), i32 %13)
  %15 = load i32* getelementptr inbounds ([3 x [4 x i32]]* @g_5, i32 0, i64 1, i64 1), align 4
  %16 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str5, i32 0, i32 0), i32 %15)
  %17 = load i32* getelementptr inbounds ([3 x [4 x i32]]* @g_5, i32 0, i64 1, i64 2), align 4
  %18 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str6, i32 0, i32 0), i32 %17)
  %19 = load i32* getelementptr inbounds ([3 x [4 x i32]]* @g_5, i32 0, i64 1, i64 3), align 4
  %20 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str7, i32 0, i32 0), i32 %19)
  %21 = load i32* getelementptr inbounds ([3 x [4 x i32]]* @g_5, i32 0, i64 2, i64 0), align 4
  %22 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str8, i32 0, i32 0), i32 %21)
  %23 = load i32* getelementptr inbounds ([3 x [4 x i32]]* @g_5, i32 0, i64 2, i64 1), align 4
  %24 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str9, i32 0, i32 0), i32 %23)
  %25 = load i32* getelementptr inbounds ([3 x [4 x i32]]* @g_5, i32 0, i64 2, i64 2), align 4
  %26 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str10, i32 0, i32 0), i32 %25)
  %27 = load i32* getelementptr inbounds ([3 x [4 x i32]]* @g_5, i32 0, i64 2, i64 3), align 4
  %28 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str11, i32 0, i32 0), i32 %27)
  %29 = load i32* getelementptr inbounds ([3 x [4 x i32]]* @g_5, i32 0, i64 2, i64 0), align 4
  %30 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str8, i32 0, i32 0), i32 %29)
  %31 = load i32* @g_33, align 4
  %32 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str12, i32 0, i32 0), i32 %31)
  %33 = load i32* %1
  ret i32 %33
}

declare i32 @printf(i8*, ...)
