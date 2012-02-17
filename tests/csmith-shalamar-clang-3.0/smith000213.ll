; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith000213.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = global i32 0, align 4
@g_3 = global i32 4, align 4
@g_24 = global i32 1213840250, align 4
@.str = private unnamed_addr constant [19 x i8] c"checksum g_2 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [19 x i8] c"checksum g_3 = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [20 x i8] c"checksum g_24 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define zeroext i16 @func_1() nounwind uwtable {
  %l_6 = alloca i32, align 4
  %l_23 = alloca i32*, align 8
  %l_30 = alloca i32*, align 8
  %l_29 = alloca i32**, align 8
  store i32 238387412, i32* %l_6, align 4
  store i32* @g_24, i32** %l_23, align 8
  %1 = load volatile i32* @g_2, align 4
  %2 = load i32* @g_3, align 4
  %3 = xor i32 %1, %2
  %4 = load i32* %l_6, align 4
  %5 = trunc i32 %4 to i16
  %6 = call zeroext i16 @safe_lshift_func_uint16_t_u_u(i16 zeroext %5, i32 -1227868340)
  %7 = zext i16 %6 to i32
  %8 = icmp ult i32 %3, %7
  %9 = zext i1 %8 to i32
  %10 = load i32* @g_3, align 4
  %11 = icmp ne i32 %10, 0
  br i1 %11, label %15, label %12

; <label>:12                                      ; preds = %0
  %13 = load i32* @g_3, align 4
  %14 = icmp ne i32 %13, 0
  br label %15

; <label>:15                                      ; preds = %12, %0
  %16 = phi i1 [ true, %0 ], [ %14, %12 ]
  %17 = zext i1 %16 to i32
  %18 = xor i32 %9, %17
  %19 = load i32* %l_6, align 4
  %20 = load i32* %l_6, align 4
  %21 = trunc i32 %20 to i16
  %22 = load i32* %l_6, align 4
  %23 = trunc i32 %22 to i16
  %24 = call zeroext i16 @safe_mul_func_uint16_t_u_u(i16 zeroext %21, i16 zeroext %23)
  %25 = zext i16 %24 to i32
  %26 = load i32* @g_3, align 4
  %27 = trunc i32 %26 to i16
  %28 = load i32* %l_6, align 4
  %29 = trunc i32 %28 to i16
  %30 = call zeroext i16 @safe_add_func_uint16_t_u_u(i16 zeroext %27, i16 zeroext %29)
  %31 = zext i16 %30 to i32
  %32 = icmp ne i32 %25, %31
  %33 = zext i1 %32 to i32
  %34 = call i32 @safe_div_func_int32_t_s_s(i32 %19, i32 %33)
  %35 = icmp sge i32 %18, %34
  %36 = zext i1 %35 to i32
  %37 = load i32* @g_3, align 4
  %38 = or i32 %36, %37
  %39 = load i32* @g_3, align 4
  %40 = trunc i32 %39 to i16
  %41 = load i32* @g_3, align 4
  %42 = load i32* @g_3, align 4
  %43 = zext i32 %42 to i64
  %44 = load i32* %l_6, align 4
  %45 = load i32* %l_6, align 4
  %46 = call i32 @func_15(i32 %41, i64 %43, i32 %44, i32 %45)
  %47 = sext i32 %46 to i64
  %48 = load i32* %l_6, align 4
  %49 = sext i32 %48 to i64
  %50 = load i32* %l_6, align 4
  %51 = load i32* %l_6, align 4
  %52 = or i32 %50, %51
  %53 = sext i32 %52 to i64
  %54 = call i64 @safe_mod_func_int64_t_s_s(i64 %49, i64 %53)
  %55 = icmp slt i64 %47, %54
  %56 = zext i1 %55 to i32
  %57 = trunc i32 %56 to i16
  %58 = call signext i16 @safe_div_func_int16_t_s_s(i16 signext %40, i16 signext %57)
  %59 = sext i16 %58 to i32
  %60 = icmp ule i32 %38, %59
  %61 = zext i1 %60 to i32
  %62 = load i32** %l_23, align 8
  %63 = load i32* %62
  %64 = or i32 %63, %61
  store i32 %64, i32* %62
  store i32 0, i32* @g_3, align 4
  br label %65

; <label>:65                                      ; preds = %80, %15
  %66 = load i32* @g_3, align 4
  %67 = icmp ugt i32 %66, -18
  br i1 %67, label %68, label %83

; <label>:68                                      ; preds = %65
  store i32 3, i32* @g_3, align 4
  br label %69

; <label>:69                                      ; preds = %74, %68
  %70 = load i32* @g_3, align 4
  %71 = icmp ult i32 %70, 0
  br i1 %71, label %72, label %79

; <label>:72                                      ; preds = %69
  store i32* @g_24, i32** %l_30, align 8
  store i32** %l_30, i32*** %l_29, align 8
  %73 = load i32*** %l_29, align 8
  store i32* null, i32** %73
  br label %74

; <label>:74                                      ; preds = %72
  %75 = load i32* @g_3, align 4
  %76 = zext i32 %75 to i64
  %77 = call i64 @safe_sub_func_uint64_t_u_u(i64 %76, i64 1)
  %78 = trunc i64 %77 to i32
  store i32 %78, i32* @g_3, align 4
  br label %69

; <label>:79                                      ; preds = %69
  br label %80

; <label>:80                                      ; preds = %79
  %81 = load i32* @g_3, align 4
  %82 = call i32 @safe_add_func_int32_t_s_s(i32 %81, i32 1)
  store i32 %82, i32* @g_3, align 4
  br label %65

; <label>:83                                      ; preds = %65
  %84 = load volatile i32* @g_2, align 4
  %85 = trunc i32 %84 to i16
  ret i16 %85
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

define internal i32 @safe_div_func_int32_t_s_s(i32 %si1, i32 %si2) nounwind uwtable {
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
  %16 = sdiv i32 %14, %15
  br label %17

; <label>:17                                      ; preds = %13, %11
  %18 = phi i32 [ %12, %11 ], [ %16, %13 ]
  ret i32 %18
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

define i32 @func_15(i32 %p_16, i64 %p_17, i32 %p_18, i32 %p_19) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i64, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %l_20 = alloca i32, align 4
  store i32 %p_16, i32* %1, align 4
  store i64 %p_17, i64* %2, align 8
  store i32 %p_18, i32* %3, align 4
  store i32 %p_19, i32* %4, align 4
  store i32 1, i32* %l_20, align 4
  %5 = load i32* %l_20, align 4
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
  %4 = call zeroext i16 @func_1()
  %5 = load volatile i32* @g_2, align 4
  %6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %5)
  %7 = load i32* @g_3, align 4
  %8 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str1, i32 0, i32 0), i32 %7)
  %9 = load i32* @g_24, align 4
  %10 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str2, i32 0, i32 0), i32 %9)
  %11 = load i32* %1
  ret i32 %11
}

declare i32 @printf(i8*, ...)
