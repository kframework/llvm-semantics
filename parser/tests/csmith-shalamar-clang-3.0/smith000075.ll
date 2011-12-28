; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith000075.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_10 = global i32 5, align 4
@g_9 = global [7 x i32*] [i32* @g_10, i32* @g_10, i32* @g_10, i32* @g_10, i32* @g_10, i32* @g_10, i32* @g_10], align 16
@g_20 = global i32* @g_10, align 8
@g_31 = global i8 -45, align 1
@.str = private unnamed_addr constant [20 x i8] c"checksum g_10 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [20 x i8] c"checksum g_31 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i64 @func_1() nounwind uwtable {
  %l_2 = alloca i16, align 2
  %l_34 = alloca i32*, align 8
  store i16 17194, i16* %l_2, align 2
  store i32* @g_10, i32** %l_34, align 8
  %1 = load i16* %l_2, align 2
  %2 = zext i16 %1 to i32
  %3 = load i16* %l_2, align 2
  %4 = zext i16 %3 to i32
  %5 = icmp ne i32 %4, 0
  br i1 %5, label %6, label %33

; <label>:6                                       ; preds = %0
  %7 = load volatile i32** @g_20, align 8
  %8 = load i32* %7
  %9 = trunc i32 %8 to i16
  %10 = load i32* @g_10, align 4
  %11 = call zeroext i16 @safe_lshift_func_uint16_t_u_u(i16 zeroext %9, i32 %10)
  %12 = trunc i16 %11 to i8
  %13 = load i32* @g_10, align 4
  %14 = sext i32 %13 to i64
  %15 = load i32* @g_10, align 4
  %16 = load i16* %l_2, align 2
  %17 = trunc i16 %16 to i8
  %18 = load i16* %l_2, align 2
  %19 = zext i16 %18 to i32
  %20 = call zeroext i8 @safe_lshift_func_uint8_t_u_u(i8 zeroext %17, i32 %19)
  %21 = zext i8 %20 to i32
  %22 = call signext i8 @func_12(i8 signext %12, i64 %14, i32 %15, i32 %21)
  %23 = load i8* @g_31, align 1
  %24 = load i16* %l_2, align 2
  %25 = call signext i16 @safe_rshift_func_int16_t_s_s(i16 signext %24, i32 1)
  %26 = sext i16 %25 to i32
  %27 = call signext i8 @safe_lshift_func_int8_t_s_s(i8 signext %23, i32 %26)
  %28 = sext i8 %27 to i32
  %29 = load i8* @g_31, align 1
  %30 = zext i8 %29 to i32
  %31 = call i32 @func_3(i16 zeroext 0, i8 signext %22, i32 %28, i32 1984750410, i32 %30)
  %32 = icmp ne i32 %31, 0
  br label %33

; <label>:33                                      ; preds = %6, %0
  %34 = phi i1 [ false, %0 ], [ %32, %6 ]
  %35 = zext i1 %34 to i32
  %36 = or i32 %2, %35
  %37 = icmp ne i32 %36, 0
  br i1 %37, label %38, label %42

; <label>:38                                      ; preds = %33
  %39 = load i16* %l_2, align 2
  %40 = zext i16 %39 to i32
  %41 = icmp ne i32 %40, 0
  br label %42

; <label>:42                                      ; preds = %38, %33
  %43 = phi i1 [ false, %33 ], [ %41, %38 ]
  %44 = zext i1 %43 to i32
  %45 = load i32** %l_34, align 8
  store i32 %44, i32* %45
  %46 = load i8* @g_31, align 1
  %47 = zext i8 %46 to i64
  ret i64 %47
}

define i32 @func_3(i16 zeroext %p_4, i8 signext %p_5, i32 %p_6, i32 %p_7, i32 %p_8) nounwind uwtable {
  %1 = alloca i16, align 2
  %2 = alloca i8, align 1
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %l_11 = alloca [2 x [3 x i32]], align 16
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i16 %p_4, i16* %1, align 2
  store i8 %p_5, i8* %2, align 1
  store i32 %p_6, i32* %3, align 4
  store i32 %p_7, i32* %4, align 4
  store i32 %p_8, i32* %5, align 4
  store i32 0, i32* %i, align 4
  br label %6

; <label>:6                                       ; preds = %24, %0
  %7 = load i32* %i, align 4
  %8 = icmp slt i32 %7, 2
  br i1 %8, label %9, label %27

; <label>:9                                       ; preds = %6
  store i32 0, i32* %j, align 4
  br label %10

; <label>:10                                      ; preds = %20, %9
  %11 = load i32* %j, align 4
  %12 = icmp slt i32 %11, 3
  br i1 %12, label %13, label %23

; <label>:13                                      ; preds = %10
  %14 = load i32* %j, align 4
  %15 = sext i32 %14 to i64
  %16 = load i32* %i, align 4
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds [2 x [3 x i32]]* %l_11, i32 0, i64 %17
  %19 = getelementptr inbounds [3 x i32]* %18, i32 0, i64 %15
  store i32 -7, i32* %19, align 4
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
  store volatile i32* null, i32** getelementptr inbounds ([7 x i32*]* @g_9, i32 0, i64 3), align 8
  %28 = getelementptr inbounds [2 x [3 x i32]]* %l_11, i32 0, i64 0
  %29 = getelementptr inbounds [3 x i32]* %28, i32 0, i64 0
  %30 = load i32* %29, align 4
  ret i32 %30
}

define signext i8 @func_12(i8 signext %p_13, i64 %p_14, i32 %p_15, i32 %p_16) nounwind uwtable {
  %1 = alloca i8, align 1
  %2 = alloca i8, align 1
  %3 = alloca i64, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %l_24 = alloca i8, align 1
  %l_19 = alloca [5 x i8], align 1
  %i = alloca i32, align 4
  store i8 %p_13, i8* %2, align 1
  store i64 %p_14, i64* %3, align 8
  store i32 %p_15, i32* %4, align 4
  store i32 %p_16, i32* %5, align 4
  store i8 83, i8* %l_24, align 1
  store i8 0, i8* %2, align 1
  br label %6

; <label>:6                                       ; preds = %24, %0
  %7 = load i8* %2, align 1
  %8 = sext i8 %7 to i32
  %9 = icmp slt i32 %8, -4
  br i1 %9, label %10, label %29

; <label>:10                                      ; preds = %6
  store i32 0, i32* %i, align 4
  br label %11

; <label>:11                                      ; preds = %18, %10
  %12 = load i32* %i, align 4
  %13 = icmp slt i32 %12, 5
  br i1 %13, label %14, label %21

; <label>:14                                      ; preds = %11
  %15 = load i32* %i, align 4
  %16 = sext i32 %15 to i64
  %17 = getelementptr inbounds [5 x i8]* %l_19, i32 0, i64 %16
  store i8 52, i8* %17, align 1
  br label %18

; <label>:18                                      ; preds = %14
  %19 = load i32* %i, align 4
  %20 = add nsw i32 %19, 1
  store i32 %20, i32* %i, align 4
  br label %11

; <label>:21                                      ; preds = %11
  %22 = getelementptr inbounds [5 x i8]* %l_19, i32 0, i64 1
  %23 = load i8* %22, align 1
  store i8 %23, i8* %1
  br label %46
                                                  ; No predecessors!
  %25 = load i8* %2, align 1
  %26 = sext i8 %25 to i64
  %27 = call i64 @safe_sub_func_int64_t_s_s(i64 %26, i64 7)
  %28 = trunc i64 %27 to i8
  store i8 %28, i8* %2, align 1
  br label %6

; <label>:29                                      ; preds = %6
  %30 = load i32* %4, align 4
  %31 = load volatile i32** @g_20, align 8
  %32 = load i32* %31
  %33 = xor i32 %32, %30
  store i32 %33, i32* %31
  store i8 0, i8* %2, align 1
  br label %34

; <label>:34                                      ; preds = %41, %29
  %35 = load i8* %2, align 1
  %36 = sext i8 %35 to i32
  %37 = icmp slt i32 %36, 0
  br i1 %37, label %38, label %44

; <label>:38                                      ; preds = %34
  %39 = load i32* @g_10, align 4
  %40 = trunc i32 %39 to i8
  store i8 %40, i8* %1
  br label %46
                                                  ; No predecessors!
  %42 = load i8* %2, align 1
  %43 = call signext i8 @safe_sub_func_int8_t_s_s(i8 signext %42, i8 signext 1)
  store i8 %43, i8* %2, align 1
  br label %34

; <label>:44                                      ; preds = %34
  %45 = load i8* %l_24, align 1
  store i8 %45, i8* %1
  br label %46

; <label>:46                                      ; preds = %44, %38, %21
  %47 = load i8* %1
  ret i8 %47
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

define internal signext i16 @safe_rshift_func_int16_t_s_s(i16 signext %left, i32 %right) nounwind uwtable {
  %1 = alloca i16, align 2
  %2 = alloca i32, align 4
  store i16 %left, i16* %1, align 2
  store i32 %right, i32* %2, align 4
  %3 = load i16* %1, align 2
  %4 = sext i16 %3 to i32
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
  %13 = load i16* %1, align 2
  %14 = sext i16 %13 to i32
  br label %20

; <label>:15                                      ; preds = %9
  %16 = load i16* %1, align 2
  %17 = sext i16 %16 to i32
  %18 = load i32* %2, align 4
  %19 = ashr i32 %17, %18
  br label %20

; <label>:20                                      ; preds = %15, %12
  %21 = phi i32 [ %14, %12 ], [ %19, %15 ]
  %22 = trunc i32 %21 to i16
  ret i16 %22
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

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  %i = alloca i32, align 4
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  %4 = call i64 @func_1()
  %5 = load i32* @g_10, align 4
  %6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str, i32 0, i32 0), i32 %5)
  %7 = load i8* @g_31, align 1
  %8 = zext i8 %7 to i32
  %9 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str1, i32 0, i32 0), i32 %8)
  %10 = load i32* %1
  ret i32 %10
}

declare i32 @printf(i8*, ...)
