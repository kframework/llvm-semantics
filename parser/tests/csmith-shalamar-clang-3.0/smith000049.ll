; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith000049.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_4 = constant i8 9, align 1
@g_16 = global [9 x [1 x i32]] [[1 x i32] [i32 1], [1 x i32] [i32 1], [1 x i32] [i32 1], [1 x i32] [i32 1], [1 x i32] [i32 1], [1 x i32] [i32 1], [1 x i32] [i32 1], [1 x i32] [i32 1], [1 x i32] [i32 1]], align 16
@.str = private unnamed_addr constant [19 x i8] c"checksum g_4 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [26 x i8] c"checksum g_16[0][0] = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [26 x i8] c"checksum g_16[1][0] = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [26 x i8] c"checksum g_16[2][0] = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [26 x i8] c"checksum g_16[3][0] = %d\0A\00", align 1
@.str5 = private unnamed_addr constant [26 x i8] c"checksum g_16[4][0] = %d\0A\00", align 1
@.str6 = private unnamed_addr constant [26 x i8] c"checksum g_16[5][0] = %d\0A\00", align 1
@.str7 = private unnamed_addr constant [26 x i8] c"checksum g_16[6][0] = %d\0A\00", align 1
@.str8 = private unnamed_addr constant [26 x i8] c"checksum g_16[7][0] = %d\0A\00", align 1
@.str9 = private unnamed_addr constant [26 x i8] c"checksum g_16[8][0] = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable {
  %l_5 = alloca [3 x [8 x i32]], align 16
  %l_7 = alloca i32, align 4
  %l_14 = alloca i64, align 8
  %l_15 = alloca i32*, align 8
  %l_17 = alloca [3 x i32*], align 16
  %l_18 = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 961065089, i32* %l_7, align 4
  store i64 -2509409820191035536, i64* %l_14, align 8
  store i32* getelementptr inbounds ([9 x [1 x i32]]* @g_16, i32 0, i64 6, i64 0), i32** %l_15, align 8
  store i32 -1654202773, i32* %l_18, align 4
  store i32 0, i32* %i, align 4
  br label %1

; <label>:1                                       ; preds = %19, %0
  %2 = load i32* %i, align 4
  %3 = icmp slt i32 %2, 3
  br i1 %3, label %4, label %22

; <label>:4                                       ; preds = %1
  store i32 0, i32* %j, align 4
  br label %5

; <label>:5                                       ; preds = %15, %4
  %6 = load i32* %j, align 4
  %7 = icmp slt i32 %6, 8
  br i1 %7, label %8, label %18

; <label>:8                                       ; preds = %5
  %9 = load i32* %j, align 4
  %10 = sext i32 %9 to i64
  %11 = load i32* %i, align 4
  %12 = sext i32 %11 to i64
  %13 = getelementptr inbounds [3 x [8 x i32]]* %l_5, i32 0, i64 %12
  %14 = getelementptr inbounds [8 x i32]* %13, i32 0, i64 %10
  store i32 459717372, i32* %14, align 4
  br label %15

; <label>:15                                      ; preds = %8
  %16 = load i32* %j, align 4
  %17 = add nsw i32 %16, 1
  store i32 %17, i32* %j, align 4
  br label %5

; <label>:18                                      ; preds = %5
  br label %19

; <label>:19                                      ; preds = %18
  %20 = load i32* %i, align 4
  %21 = add nsw i32 %20, 1
  store i32 %21, i32* %i, align 4
  br label %1

; <label>:22                                      ; preds = %1
  store i32 0, i32* %i, align 4
  br label %23

; <label>:23                                      ; preds = %30, %22
  %24 = load i32* %i, align 4
  %25 = icmp slt i32 %24, 3
  br i1 %25, label %26, label %33

; <label>:26                                      ; preds = %23
  %27 = load i32* %i, align 4
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds [3 x i32*]* %l_17, i32 0, i64 %28
  store i32* %l_7, i32** %29, align 8
  br label %30

; <label>:30                                      ; preds = %26
  %31 = load i32* %i, align 4
  %32 = add nsw i32 %31, 1
  store i32 %32, i32* %i, align 4
  br label %23

; <label>:33                                      ; preds = %23
  %34 = getelementptr inbounds [3 x [8 x i32]]* %l_5, i32 0, i64 2
  %35 = getelementptr inbounds [8 x i32]* %34, i32 0, i64 1
  %36 = load i32* %35, align 4
  %37 = icmp ne i32 9, %36
  %38 = zext i1 %37 to i32
  %39 = call signext i16 @safe_unary_minus_func_int16_t_s(i16 signext 9)
  %40 = sext i16 %39 to i32
  %41 = icmp eq i32 %38, %40
  br i1 %41, label %43, label %42

; <label>:42                                      ; preds = %33
  br label %43

; <label>:43                                      ; preds = %42, %33
  %44 = phi i1 [ true, %33 ], [ true, %42 ]
  %45 = zext i1 %44 to i32
  %46 = load i32* %l_7, align 4
  %47 = xor i32 %45, %46
  %48 = trunc i32 %47 to i8
  %49 = call zeroext i8 @safe_add_func_uint8_t_u_u(i8 zeroext %48, i8 zeroext 2)
  %50 = zext i8 %49 to i32
  %51 = getelementptr inbounds [3 x [8 x i32]]* %l_5, i32 0, i64 2
  %52 = getelementptr inbounds [8 x i32]* %51, i32 0, i64 1
  %53 = load i32* %52, align 4
  %54 = and i32 9, %53
  %55 = icmp slt i32 %54, 0
  %56 = zext i1 %55 to i32
  %57 = trunc i32 %56 to i8
  %58 = getelementptr inbounds [3 x [8 x i32]]* %l_5, i32 0, i64 2
  %59 = getelementptr inbounds [8 x i32]* %58, i32 0, i64 3
  %60 = load i32* %59, align 4
  %61 = getelementptr inbounds [3 x [8 x i32]]* %l_5, i32 0, i64 1
  %62 = getelementptr inbounds [8 x i32]* %61, i32 0, i64 7
  %63 = load i32* %62, align 4
  %64 = or i32 %60, %63
  %65 = sext i32 %64 to i64
  %66 = load i64* %l_14, align 8
  %67 = icmp slt i64 9, %66
  %68 = zext i1 %67 to i32
  %69 = sext i32 %68 to i64
  %70 = call i64 @safe_sub_func_int64_t_s_s(i64 %65, i64 %69)
  %71 = trunc i64 %70 to i8
  %72 = call zeroext i8 @safe_mul_func_uint8_t_u_u(i8 zeroext %57, i8 zeroext %71)
  %73 = zext i8 %72 to i64
  %74 = xor i64 %73, 1984127398
  %75 = trunc i64 %74 to i8
  %76 = call signext i8 @safe_mod_func_int8_t_s_s(i8 signext %75, i8 signext 9)
  %77 = sext i8 %76 to i32
  %78 = icmp sgt i32 %50, %77
  %79 = zext i1 %78 to i32
  %80 = load i32** %l_15, align 8
  %81 = load i32* %80
  %82 = and i32 %81, %79
  store i32 %82, i32* %80
  %83 = load i32** %l_15, align 8
  %84 = load i32* %83
  %85 = load i32* %l_18, align 4
  %86 = xor i32 %85, %84
  store i32 %86, i32* %l_18, align 4
  %87 = load i32* getelementptr inbounds ([9 x [1 x i32]]* @g_16, i32 0, i64 6, i64 0), align 4
  ret i32 %87
}

define internal zeroext i8 @safe_add_func_uint8_t_u_u(i8 zeroext %ui1, i8 zeroext %ui2) nounwind uwtable {
  %1 = alloca i8, align 1
  %2 = alloca i8, align 1
  store i8 %ui1, i8* %1, align 1
  store i8 %ui2, i8* %2, align 1
  %3 = load i8* %1, align 1
  %4 = zext i8 %3 to i32
  %5 = load i8* %2, align 1
  %6 = zext i8 %5 to i32
  %7 = add nsw i32 %4, %6
  %8 = trunc i32 %7 to i8
  ret i8 %8
}

define internal signext i16 @safe_unary_minus_func_int16_t_s(i16 signext %si) nounwind uwtable {
  %1 = alloca i16, align 2
  store i16 %si, i16* %1, align 2
  %2 = load i16* %1, align 2
  %3 = sext i16 %2 to i32
  %4 = sub nsw i32 0, %3
  %5 = trunc i32 %4 to i16
  ret i16 %5
}

define internal signext i8 @safe_mod_func_int8_t_s_s(i8 signext %si1, i8 signext %si2) nounwind uwtable {
  %1 = alloca i8, align 1
  %2 = alloca i8, align 1
  store i8 %si1, i8* %1, align 1
  store i8 %si2, i8* %2, align 1
  %3 = load i8* %2, align 1
  %4 = sext i8 %3 to i32
  %5 = icmp eq i32 %4, 0
  br i1 %5, label %14, label %6

; <label>:6                                       ; preds = %0
  %7 = load i8* %1, align 1
  %8 = sext i8 %7 to i32
  %9 = icmp eq i32 %8, -128
  br i1 %9, label %10, label %17

; <label>:10                                      ; preds = %6
  %11 = load i8* %2, align 1
  %12 = sext i8 %11 to i32
  %13 = icmp eq i32 %12, -1
  br i1 %13, label %14, label %17

; <label>:14                                      ; preds = %10, %0
  %15 = load i8* %1, align 1
  %16 = sext i8 %15 to i32
  br label %23

; <label>:17                                      ; preds = %10, %6
  %18 = load i8* %1, align 1
  %19 = sext i8 %18 to i32
  %20 = load i8* %2, align 1
  %21 = sext i8 %20 to i32
  %22 = srem i32 %19, %21
  br label %23

; <label>:23                                      ; preds = %17, %14
  %24 = phi i32 [ %16, %14 ], [ %22, %17 ]
  %25 = trunc i32 %24 to i8
  ret i8 %25
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
  %4 = call i32 @func_1()
  %5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 9)
  %6 = load i32* getelementptr inbounds ([9 x [1 x i32]]* @g_16, i32 0, i64 0, i64 0), align 4
  %7 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str1, i32 0, i32 0), i32 %6)
  %8 = load i32* getelementptr inbounds ([9 x [1 x i32]]* @g_16, i32 0, i64 1, i64 0), align 4
  %9 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str2, i32 0, i32 0), i32 %8)
  %10 = load i32* getelementptr inbounds ([9 x [1 x i32]]* @g_16, i32 0, i64 2, i64 0), align 4
  %11 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str3, i32 0, i32 0), i32 %10)
  %12 = load i32* getelementptr inbounds ([9 x [1 x i32]]* @g_16, i32 0, i64 3, i64 0), align 4
  %13 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str4, i32 0, i32 0), i32 %12)
  %14 = load i32* getelementptr inbounds ([9 x [1 x i32]]* @g_16, i32 0, i64 4, i64 0), align 4
  %15 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str5, i32 0, i32 0), i32 %14)
  %16 = load i32* getelementptr inbounds ([9 x [1 x i32]]* @g_16, i32 0, i64 5, i64 0), align 4
  %17 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str6, i32 0, i32 0), i32 %16)
  %18 = load i32* getelementptr inbounds ([9 x [1 x i32]]* @g_16, i32 0, i64 6, i64 0), align 4
  %19 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str7, i32 0, i32 0), i32 %18)
  %20 = load i32* getelementptr inbounds ([9 x [1 x i32]]* @g_16, i32 0, i64 7, i64 0), align 4
  %21 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str8, i32 0, i32 0), i32 %20)
  %22 = load i32* getelementptr inbounds ([9 x [1 x i32]]* @g_16, i32 0, i64 8, i64 0), align 4
  %23 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str9, i32 0, i32 0), i32 %22)
  %24 = load i32* getelementptr inbounds ([9 x [1 x i32]]* @g_16, i32 0, i64 6, i64 0), align 4
  %25 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str7, i32 0, i32 0), i32 %24)
  %26 = load i32* %1
  ret i32 %26
}

declare i32 @printf(i8*, ...)
