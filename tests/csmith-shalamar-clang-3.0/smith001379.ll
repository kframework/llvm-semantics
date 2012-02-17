; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith001379.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = global [8 x i32] zeroinitializer, align 16
@g_5 = global i32 1, align 4
@g_39 = global i32* @g_5, align 8
@g_38 = global i32** @g_39, align 8
@g_37 = global i32*** @g_38, align 8
@.str = private unnamed_addr constant [22 x i8] c"checksum g_2[0] = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [22 x i8] c"checksum g_2[1] = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [22 x i8] c"checksum g_2[2] = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [22 x i8] c"checksum g_2[3] = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [22 x i8] c"checksum g_2[4] = %d\0A\00", align 1
@.str5 = private unnamed_addr constant [22 x i8] c"checksum g_2[5] = %d\0A\00", align 1
@.str6 = private unnamed_addr constant [22 x i8] c"checksum g_2[6] = %d\0A\00", align 1
@.str7 = private unnamed_addr constant [22 x i8] c"checksum g_2[7] = %d\0A\00", align 1
@.str8 = private unnamed_addr constant [19 x i8] c"checksum g_5 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i64 @func_1() nounwind uwtable {
  %1 = alloca i64, align 8
  %l_22 = alloca i32*, align 8
  %l_23 = alloca i64, align 8
  %l_12 = alloca i16, align 2
  %l_28 = alloca i32, align 4
  %l_21 = alloca i32*, align 8
  %l_36 = alloca i32, align 4
  %l_11 = alloca i32*, align 8
  %l_10 = alloca i32**, align 8
  store i32* @g_5, i32** %l_22, align 8
  store i64 -1118748404390521565, i64* %l_23, align 8
  store volatile i32 -7, i32* getelementptr inbounds ([8 x i32]* @g_2, i32 0, i64 1), align 4
  br label %2

; <label>:2                                       ; preds = %87, %0
  %3 = load volatile i32* getelementptr inbounds ([8 x i32]* @g_2, i32 0, i64 1), align 4
  %4 = icmp slt i32 %3, 4
  br i1 %4, label %5, label %90

; <label>:5                                       ; preds = %2
  store i16 1, i16* %l_12, align 2
  store i32 -139865368, i32* %l_28, align 4
  store i32 8, i32* @g_5, align 4
  br label %6

; <label>:6                                       ; preds = %78, %5
  %7 = load i32* @g_5, align 4
  %8 = icmp ne i32 %7, 0
  br i1 %8, label %9, label %81

; <label>:9                                       ; preds = %6
  store i32* null, i32** %l_21, align 8
  store i32 1, i32* %l_36, align 4
  store i32 -30, i32* @g_5, align 4
  br label %10

; <label>:10                                      ; preds = %17, %9
  %11 = load i32* @g_5, align 4
  %12 = icmp sle i32 %11, 0
  br i1 %12, label %13, label %22

; <label>:13                                      ; preds = %10
  store i32* getelementptr inbounds ([8 x i32]* @g_2, i32 0, i64 1), i32** %l_11, align 8
  store i32** %l_11, i32*** %l_10, align 8
  %14 = load i32*** %l_10, align 8
  store i32* getelementptr inbounds ([8 x i32]* @g_2, i32 0, i64 1), i32** %14
  %15 = load i16* %l_12, align 2
  %16 = sext i16 %15 to i64
  store i64 %16, i64* %1
  br label %93
                                                  ; No predecessors!
  %18 = load i32* @g_5, align 4
  %19 = trunc i32 %18 to i16
  %20 = call signext i16 @safe_add_func_int16_t_s_s(i16 signext %19, i16 signext 1)
  %21 = sext i16 %20 to i32
  store i32 %21, i32* @g_5, align 4
  br label %10

; <label>:22                                      ; preds = %10
  %23 = load volatile i32* getelementptr inbounds ([8 x i32]* @g_2, i32 0, i64 6), align 4
  %24 = load i16* %l_12, align 2
  %25 = trunc i16 %24 to i8
  %26 = load i32* @g_5, align 4
  %27 = call signext i8 @safe_rshift_func_int8_t_s_s(i8 signext %25, i32 %26)
  %28 = sext i8 %27 to i32
  %29 = call i32 @safe_sub_func_int32_t_s_s(i32 %23, i32 %28)
  %30 = sext i32 %29 to i64
  %31 = load i32** %l_21, align 8
  %32 = load i32** %l_22, align 8
  %33 = icmp eq i32* %31, %32
  %34 = zext i1 %33 to i32
  %35 = sext i32 %34 to i64
  %36 = load i64* %l_23, align 8
  %37 = or i64 %35, %36
  %38 = or i64 %30, %37
  %39 = trunc i64 %38 to i16
  %40 = load i32* @g_5, align 4
  %41 = trunc i32 %40 to i8
  %42 = load i16* %l_12, align 2
  %43 = trunc i16 %42 to i8
  %44 = call zeroext i8 @safe_mul_func_uint8_t_u_u(i8 zeroext %41, i8 zeroext %43)
  %45 = zext i8 %44 to i32
  %46 = icmp ne i32 %45, 0
  br i1 %46, label %51, label %47

; <label>:47                                      ; preds = %22
  %48 = load i16* %l_12, align 2
  %49 = sext i16 %48 to i32
  %50 = icmp ne i32 %49, 0
  br label %51

; <label>:51                                      ; preds = %47, %22
  %52 = phi i1 [ true, %22 ], [ %50, %47 ]
  %53 = zext i1 %52 to i32
  %54 = sext i32 %53 to i64
  %55 = call i64 @safe_mod_func_int64_t_s_s(i64 %54, i64 670076450)
  %56 = trunc i64 %55 to i16
  %57 = call signext i16 @safe_mod_func_int16_t_s_s(i16 signext %39, i16 signext %56)
  %58 = load i32* @g_5, align 4
  %59 = trunc i32 %58 to i16
  %60 = call signext i16 @safe_mod_func_int16_t_s_s(i16 signext %57, i16 signext %59)
  %61 = sext i16 %60 to i64
  %62 = xor i64 3594160352, %61
  %63 = trunc i64 %62 to i32
  store i32 %63, i32* %l_28, align 4
  %64 = load i32** %l_21, align 8
  %65 = icmp eq i32* null, %64
  %66 = zext i1 %65 to i32
  %67 = sext i32 %66 to i64
  %68 = load i32** %l_22, align 8
  %69 = load i32* %68
  %70 = trunc i32 %69 to i8
  %71 = load i32* %l_36, align 4
  %72 = load i32* %l_28, align 4
  %73 = icmp sle i32 %71, %72
  %74 = zext i1 %73 to i32
  %75 = load volatile i32* getelementptr inbounds ([8 x i32]* @g_2, i32 0, i64 1), align 4
  %76 = call i32** @func_29(i64 %67, i8 zeroext %70, i32 %74, i32** %l_21, i32 %75)
  %77 = load volatile i32**** @g_37, align 8
  store i32** %76, i32*** %77
  br label %78

; <label>:78                                      ; preds = %51
  %79 = load i32* @g_5, align 4
  %80 = call i32 @safe_sub_func_uint32_t_u_u(i32 %79, i32 1)
  store i32 %80, i32* @g_5, align 4
  br label %6

; <label>:81                                      ; preds = %6
  %82 = load i32** @g_39, align 8
  %83 = load i32* %82
  %84 = load i32** @g_39, align 8
  store i32 %83, i32* %84
  %85 = load i32* @g_5, align 4
  %86 = sext i32 %85 to i64
  store i64 %86, i64* %1
  br label %93
                                                  ; No predecessors!
  %88 = load volatile i32* getelementptr inbounds ([8 x i32]* @g_2, i32 0, i64 1), align 4
  %89 = call i32 @safe_sub_func_int32_t_s_s(i32 %88, i32 1)
  store volatile i32 %89, i32* getelementptr inbounds ([8 x i32]* @g_2, i32 0, i64 1), align 4
  br label %2

; <label>:90                                      ; preds = %2
  %91 = load volatile i32* getelementptr inbounds ([8 x i32]* @g_2, i32 0, i64 1), align 4
  %92 = sext i32 %91 to i64
  store i64 %92, i64* %1
  br label %93

; <label>:93                                      ; preds = %90, %81, %13
  %94 = load i64* %1
  ret i64 %94
}

define internal signext i16 @safe_add_func_int16_t_s_s(i16 signext %si1, i16 signext %si2) nounwind uwtable {
  %1 = alloca i16, align 2
  %2 = alloca i16, align 2
  store i16 %si1, i16* %1, align 2
  store i16 %si2, i16* %2, align 2
  %3 = load i16* %1, align 2
  %4 = sext i16 %3 to i32
  %5 = load i16* %2, align 2
  %6 = sext i16 %5 to i32
  %7 = add nsw i32 %4, %6
  %8 = trunc i32 %7 to i16
  ret i16 %8
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

define i32** @func_29(i64 %p_30, i8 zeroext %p_31, i32 %p_32, i32** %p_33, i32 %p_34) nounwind uwtable {
  %1 = alloca i64, align 8
  %2 = alloca i8, align 1
  %3 = alloca i32, align 4
  %4 = alloca i32**, align 8
  %5 = alloca i32, align 4
  %l_35 = alloca i32, align 4
  store i64 %p_30, i64* %1, align 8
  store i8 %p_31, i8* %2, align 1
  store i32 %p_32, i32* %3, align 4
  store i32** %p_33, i32*** %4, align 8
  store i32 %p_34, i32* %5, align 4
  store i32 0, i32* %l_35, align 4
  %6 = load i32* %l_35, align 4
  store i32 %6, i32* %l_35, align 4
  %7 = load i32*** %4, align 8
  ret i32** %7
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
  %4 = call i64 @func_1()
  %5 = load volatile i32* getelementptr inbounds ([8 x i32]* @g_2, i32 0, i64 0), align 4
  %6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str, i32 0, i32 0), i32 %5)
  %7 = load volatile i32* getelementptr inbounds ([8 x i32]* @g_2, i32 0, i64 1), align 4
  %8 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str1, i32 0, i32 0), i32 %7)
  %9 = load volatile i32* getelementptr inbounds ([8 x i32]* @g_2, i32 0, i64 2), align 4
  %10 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str2, i32 0, i32 0), i32 %9)
  %11 = load volatile i32* getelementptr inbounds ([8 x i32]* @g_2, i32 0, i64 3), align 4
  %12 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str3, i32 0, i32 0), i32 %11)
  %13 = load volatile i32* getelementptr inbounds ([8 x i32]* @g_2, i32 0, i64 4), align 4
  %14 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str4, i32 0, i32 0), i32 %13)
  %15 = load volatile i32* getelementptr inbounds ([8 x i32]* @g_2, i32 0, i64 5), align 4
  %16 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str5, i32 0, i32 0), i32 %15)
  %17 = load volatile i32* getelementptr inbounds ([8 x i32]* @g_2, i32 0, i64 6), align 4
  %18 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str6, i32 0, i32 0), i32 %17)
  %19 = load volatile i32* getelementptr inbounds ([8 x i32]* @g_2, i32 0, i64 7), align 4
  %20 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str7, i32 0, i32 0), i32 %19)
  %21 = load volatile i32* getelementptr inbounds ([8 x i32]* @g_2, i32 0, i64 1), align 4
  %22 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str1, i32 0, i32 0), i32 %21)
  %23 = load i32* @g_5, align 4
  %24 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str8, i32 0, i32 0), i32 %23)
  %25 = load i32* %1
  ret i32 %25
}

declare i32 @printf(i8*, ...)
