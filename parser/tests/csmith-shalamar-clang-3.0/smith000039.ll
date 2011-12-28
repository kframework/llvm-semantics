; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith000039.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = global i32 -2088476043, align 4
@g_17 = global i32 -1140569333, align 4
@.str = private unnamed_addr constant [19 x i8] c"checksum g_2 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [20 x i8] c"checksum g_17 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define zeroext i16 @func_1() nounwind uwtable {
  %l_13 = alloca [2 x [6 x i16]], align 16
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %l_16 = alloca i32*, align 8
  store i32 -15, i32* @g_2, align 4
  br label %1

; <label>:1                                       ; preds = %59, %0
  %2 = load i32* @g_2, align 4
  %3 = icmp sge i32 %2, 7
  br i1 %3, label %4, label %64

; <label>:4                                       ; preds = %1
  store i32 0, i32* %i, align 4
  br label %5

; <label>:5                                       ; preds = %23, %4
  %6 = load i32* %i, align 4
  %7 = icmp slt i32 %6, 2
  br i1 %7, label %8, label %26

; <label>:8                                       ; preds = %5
  store i32 0, i32* %j, align 4
  br label %9

; <label>:9                                       ; preds = %19, %8
  %10 = load i32* %j, align 4
  %11 = icmp slt i32 %10, 6
  br i1 %11, label %12, label %22

; <label>:12                                      ; preds = %9
  %13 = load i32* %j, align 4
  %14 = sext i32 %13 to i64
  %15 = load i32* %i, align 4
  %16 = sext i32 %15 to i64
  %17 = getelementptr inbounds [2 x [6 x i16]]* %l_13, i32 0, i64 %16
  %18 = getelementptr inbounds [6 x i16]* %17, i32 0, i64 %14
  store i16 6997, i16* %18, align 2
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
  store i32 -29, i32* @g_2, align 4
  br label %27

; <label>:27                                      ; preds = %53, %26
  %28 = load i32* @g_2, align 4
  %29 = icmp slt i32 %28, 0
  br i1 %29, label %30, label %58

; <label>:30                                      ; preds = %27
  store i32* @g_17, i32** %l_16, align 8
  %31 = getelementptr inbounds [2 x [6 x i16]]* %l_13, i32 0, i64 1
  %32 = getelementptr inbounds [6 x i16]* %31, i32 0, i64 0
  %33 = load i16* %32, align 2
  %34 = zext i16 %33 to i32
  %35 = getelementptr inbounds [2 x [6 x i16]]* %l_13, i32 0, i64 1
  %36 = getelementptr inbounds [6 x i16]* %35, i32 0, i64 0
  %37 = load i16* %36, align 2
  %38 = zext i16 %37 to i32
  %39 = load i32* @g_2, align 4
  %40 = call i32 @safe_div_func_uint32_t_u_u(i32 %38, i32 %39)
  %41 = icmp eq i32 %34, %40
  %42 = zext i1 %41 to i32
  %43 = trunc i32 %42 to i16
  %44 = call zeroext i16 @safe_add_func_uint16_t_u_u(i16 zeroext -1, i16 zeroext %43)
  %45 = trunc i16 %44 to i8
  %46 = call signext i8 @safe_rshift_func_int8_t_s_s(i8 signext %45, i32 1)
  %47 = sext i8 %46 to i16
  %48 = call zeroext i16 @safe_rshift_func_uint16_t_u_u(i16 zeroext %47, i32 -3)
  %49 = zext i16 %48 to i32
  %50 = load i32** %l_16, align 8
  %51 = load i32* %50
  %52 = xor i32 %51, %49
  store i32 %52, i32* %50
  br label %53

; <label>:53                                      ; preds = %30
  %54 = load i32* @g_2, align 4
  %55 = trunc i32 %54 to i16
  %56 = call signext i16 @safe_sub_func_int16_t_s_s(i16 signext %55, i16 signext 3)
  %57 = sext i16 %56 to i32
  store i32 %57, i32* @g_2, align 4
  br label %27

; <label>:58                                      ; preds = %27
  br label %59

; <label>:59                                      ; preds = %58
  %60 = load i32* @g_2, align 4
  %61 = trunc i32 %60 to i16
  %62 = call zeroext i16 @safe_add_func_uint16_t_u_u(i16 zeroext %61, i16 zeroext 1)
  %63 = zext i16 %62 to i32
  store i32 %63, i32* @g_2, align 4
  br label %1

; <label>:64                                      ; preds = %1
  %65 = load i32* @g_2, align 4
  %66 = trunc i32 %65 to i16
  ret i16 %66
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
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  %4 = call zeroext i16 @func_1()
  %5 = load i32* @g_2, align 4
  %6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %5)
  %7 = load i32* @g_17, align 4
  %8 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str1, i32 0, i32 0), i32 %7)
  %9 = load i32* %1
  ret i32 %9
}

declare i32 @printf(i8*, ...)
