; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith001173.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_6 = global i8 6, align 1
@g_11 = global [2 x [4 x i16]] [[4 x i16] [i16 -32556, i16 -32556, i16 -32556, i16 -32556], [4 x i16] [i16 -32556, i16 -32556, i16 -32556, i16 -32556]], align 16
@g_19 = global i32 -10, align 4
@.str = private unnamed_addr constant [19 x i8] c"checksum g_6 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [26 x i8] c"checksum g_11[0][0] = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [26 x i8] c"checksum g_11[0][1] = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [26 x i8] c"checksum g_11[0][2] = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [26 x i8] c"checksum g_11[0][3] = %d\0A\00", align 1
@.str5 = private unnamed_addr constant [26 x i8] c"checksum g_11[1][0] = %d\0A\00", align 1
@.str6 = private unnamed_addr constant [26 x i8] c"checksum g_11[1][1] = %d\0A\00", align 1
@.str7 = private unnamed_addr constant [26 x i8] c"checksum g_11[1][2] = %d\0A\00", align 1
@.str8 = private unnamed_addr constant [26 x i8] c"checksum g_11[1][3] = %d\0A\00", align 1
@.str9 = private unnamed_addr constant [20 x i8] c"checksum g_19 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define signext i16 @func_1() nounwind uwtable {
  %l_12 = alloca i8, align 1
  %l_13 = alloca i64, align 8
  %l_18 = alloca i32*, align 8
  store i8 1, i8* %l_12, align 1
  store i64 2128968691002523555, i64* %l_13, align 8
  store i32* @g_19, i32** %l_18, align 8
  %1 = load volatile i8* @g_6, align 1
  %2 = sext i8 %1 to i16
  %3 = call zeroext i16 @safe_rshift_func_uint16_t_u_s(i16 zeroext %2, i32 -10)
  %4 = load i16* getelementptr inbounds ([2 x [4 x i16]]* @g_11, i32 0, i64 0, i64 1), align 2
  %5 = zext i16 %4 to i32
  %6 = load i8* %l_12, align 1
  %7 = zext i8 %6 to i32
  %8 = call i32 @safe_add_func_int32_t_s_s(i32 %5, i32 %7)
  %9 = sext i32 %8 to i64
  %10 = load i64* %l_13, align 8
  %11 = icmp eq i64 %9, %10
  %12 = zext i1 %11 to i32
  %13 = trunc i32 %12 to i8
  %14 = load i16* getelementptr inbounds ([2 x [4 x i16]]* @g_11, i32 0, i64 0, i64 0), align 2
  %15 = zext i16 %14 to i64
  %16 = load i64* %l_13, align 8
  %17 = and i64 %15, %16
  %18 = icmp ne i64 %17, 0
  br i1 %18, label %28, label %19

; <label>:19                                      ; preds = %0
  %20 = load i16* getelementptr inbounds ([2 x [4 x i16]]* @g_11, i32 0, i64 1, i64 1), align 2
  %21 = zext i16 %20 to i32
  %22 = icmp ne i32 %21, 0
  br i1 %22, label %26, label %23

; <label>:23                                      ; preds = %19
  %24 = load i64* %l_13, align 8
  %25 = icmp ne i64 %24, 0
  br label %26

; <label>:26                                      ; preds = %23, %19
  %27 = phi i1 [ true, %19 ], [ %25, %23 ]
  br label %28

; <label>:28                                      ; preds = %26, %0
  %29 = phi i1 [ true, %0 ], [ %27, %26 ]
  %30 = zext i1 %29 to i32
  %31 = load i64* %l_13, align 8
  %32 = load i16* getelementptr inbounds ([2 x [4 x i16]]* @g_11, i32 0, i64 0, i64 1), align 2
  %33 = zext i16 %32 to i64
  %34 = icmp ne i64 %31, %33
  %35 = zext i1 %34 to i32
  %36 = sext i32 %35 to i64
  %37 = load i16* getelementptr inbounds ([2 x [4 x i16]]* @g_11, i32 0, i64 0, i64 3), align 2
  %38 = zext i16 %37 to i64
  %39 = load i64* %l_13, align 8
  %40 = xor i64 %38, %39
  %41 = call i64 @safe_mod_func_uint64_t_u_u(i64 %36, i64 %40)
  %42 = trunc i64 %41 to i32
  %43 = call i32 @safe_add_func_uint32_t_u_u(i32 %30, i32 %42)
  %44 = trunc i32 %43 to i8
  %45 = call signext i8 @safe_add_func_int8_t_s_s(i8 signext %13, i8 signext %44)
  %46 = sext i8 %45 to i32
  %47 = call zeroext i16 @safe_lshift_func_uint16_t_u_s(i16 zeroext %3, i32 %46)
  %48 = zext i16 %47 to i32
  %49 = load i8* %l_12, align 1
  %50 = zext i8 %49 to i32
  %51 = icmp sle i32 %48, %50
  %52 = zext i1 %51 to i32
  %53 = load i32** %l_18, align 8
  %54 = load i32* %53
  %55 = or i32 %54, %52
  store i32 %55, i32* %53
  %56 = load i16* getelementptr inbounds ([2 x [4 x i16]]* @g_11, i32 0, i64 0, i64 1), align 2
  ret i16 %56
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

define internal i64 @safe_mod_func_uint64_t_u_u(i64 %ui1, i64 %ui2) nounwind uwtable {
  %1 = alloca i64, align 8
  %2 = alloca i64, align 8
  store i64 %ui1, i64* %1, align 8
  store i64 %ui2, i64* %2, align 8
  %3 = load i64* %2, align 8
  %4 = icmp eq i64 %3, 0
  br i1 %4, label %5, label %7

; <label>:5                                       ; preds = %0
  %6 = load i64* %1, align 8
  br label %11

; <label>:7                                       ; preds = %0
  %8 = load i64* %1, align 8
  %9 = load i64* %2, align 8
  %10 = urem i64 %8, %9
  br label %11

; <label>:11                                      ; preds = %7, %5
  %12 = phi i64 [ %6, %5 ], [ %10, %7 ]
  ret i64 %12
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
  %4 = call signext i16 @func_1()
  %5 = load volatile i8* @g_6, align 1
  %6 = sext i8 %5 to i32
  %7 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %6)
  %8 = load i16* getelementptr inbounds ([2 x [4 x i16]]* @g_11, i32 0, i64 0, i64 0), align 2
  %9 = zext i16 %8 to i32
  %10 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str1, i32 0, i32 0), i32 %9)
  %11 = load i16* getelementptr inbounds ([2 x [4 x i16]]* @g_11, i32 0, i64 0, i64 1), align 2
  %12 = zext i16 %11 to i32
  %13 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str2, i32 0, i32 0), i32 %12)
  %14 = load i16* getelementptr inbounds ([2 x [4 x i16]]* @g_11, i32 0, i64 0, i64 2), align 2
  %15 = zext i16 %14 to i32
  %16 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str3, i32 0, i32 0), i32 %15)
  %17 = load i16* getelementptr inbounds ([2 x [4 x i16]]* @g_11, i32 0, i64 0, i64 3), align 2
  %18 = zext i16 %17 to i32
  %19 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str4, i32 0, i32 0), i32 %18)
  %20 = load i16* getelementptr inbounds ([2 x [4 x i16]]* @g_11, i32 0, i64 1, i64 0), align 2
  %21 = zext i16 %20 to i32
  %22 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str5, i32 0, i32 0), i32 %21)
  %23 = load i16* getelementptr inbounds ([2 x [4 x i16]]* @g_11, i32 0, i64 1, i64 1), align 2
  %24 = zext i16 %23 to i32
  %25 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str6, i32 0, i32 0), i32 %24)
  %26 = load i16* getelementptr inbounds ([2 x [4 x i16]]* @g_11, i32 0, i64 1, i64 2), align 2
  %27 = zext i16 %26 to i32
  %28 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str7, i32 0, i32 0), i32 %27)
  %29 = load i16* getelementptr inbounds ([2 x [4 x i16]]* @g_11, i32 0, i64 1, i64 3), align 2
  %30 = zext i16 %29 to i32
  %31 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str8, i32 0, i32 0), i32 %30)
  %32 = load i16* getelementptr inbounds ([2 x [4 x i16]]* @g_11, i32 0, i64 0, i64 1), align 2
  %33 = zext i16 %32 to i32
  %34 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str2, i32 0, i32 0), i32 %33)
  %35 = load i32* @g_19, align 4
  %36 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str9, i32 0, i32 0), i32 %35)
  %37 = load i32* %1
  ret i32 %37
}

declare i32 @printf(i8*, ...)
