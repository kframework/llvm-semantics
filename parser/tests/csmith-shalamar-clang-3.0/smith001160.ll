; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith001160.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_6 = global i16 0, align 2
@g_11 = global i32 -1, align 4
@g_12 = global [7 x i32*] zeroinitializer, align 16
@g_13 = global [3 x [4 x [5 x i32*]]] zeroinitializer, align 16
@.str = private unnamed_addr constant [19 x i8] c"checksum g_6 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [20 x i8] c"checksum g_11 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable {
  %l_3 = alloca i32, align 4
  %l_21 = alloca i32*, align 8
  store i32 0, i32* %l_3, align 4
  store i32* @g_11, i32** %l_21, align 8
  %1 = load i32* %l_3, align 4
  %2 = trunc i32 %1 to i16
  %3 = call signext i16 @safe_unary_minus_func_int16_t_s(i16 signext %2)
  %4 = sext i16 %3 to i32
  %5 = load i16* @g_6, align 2
  %6 = sext i16 %5 to i32
  %7 = icmp ne i32 %6, 0
  br i1 %7, label %8, label %12

; <label>:8                                       ; preds = %0
  %9 = load i16* @g_6, align 2
  %10 = sext i16 %9 to i32
  %11 = icmp ne i32 %10, 0
  br label %12

; <label>:12                                      ; preds = %8, %0
  %13 = phi i1 [ false, %0 ], [ %11, %8 ]
  %14 = zext i1 %13 to i32
  %15 = load i32* %l_3, align 4
  %16 = load i16* @g_6, align 2
  %17 = sext i16 %16 to i32
  %18 = xor i32 %15, %17
  %19 = icmp slt i32 %14, %18
  %20 = zext i1 %19 to i32
  %21 = trunc i32 %20 to i16
  %22 = load i32* @g_11, align 4
  %23 = sext i32 %22 to i64
  %24 = call i32 @func_7(i64 %23)
  %25 = trunc i32 %24 to i16
  %26 = call zeroext i16 @safe_add_func_uint16_t_u_u(i16 zeroext %21, i16 zeroext %25)
  %27 = zext i16 %26 to i32
  %28 = icmp ne i32 %27, 0
  br i1 %28, label %37, label %29

; <label>:29                                      ; preds = %12
  %30 = load i32* %l_3, align 4
  %31 = trunc i32 %30 to i16
  %32 = load i32* @g_11, align 4
  %33 = trunc i32 %32 to i8
  %34 = call i32 @func_17(i16 zeroext %31, i8 zeroext %33)
  %35 = load i32* %l_3, align 4
  %36 = icmp eq i32 %34, %35
  br label %37

; <label>:37                                      ; preds = %29, %12
  %38 = phi i1 [ true, %12 ], [ %36, %29 ]
  %39 = zext i1 %38 to i32
  %40 = icmp sgt i32 %4, %39
  %41 = zext i1 %40 to i32
  %42 = load i32** %l_21, align 8
  store i32 %41, i32* %42
  %43 = load i32** %l_21, align 8
  %44 = load i32* %43
  ret i32 %44
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

define i32 @func_7(i64 %p_8) nounwind uwtable {
  %1 = alloca i64, align 8
  %l_10 = alloca i32*, align 8
  %l_9 = alloca i32**, align 8
  %l_14 = alloca i32*, align 8
  store i64 %p_8, i64* %1, align 8
  store i32* @g_11, i32** %l_10, align 8
  store i32** %l_10, i32*** %l_9, align 8
  store i32* @g_11, i32** %l_14, align 8
  %2 = load i32*** %l_9, align 8
  store i32* null, i32** %2
  %3 = load i64* %1, align 8
  %4 = load i64* %1, align 8
  %5 = icmp ne i64 %3, %4
  %6 = zext i1 %5 to i32
  %7 = sext i32 %6 to i64
  %8 = load i64* %1, align 8
  %9 = icmp eq i64 %7, %8
  %10 = zext i1 %9 to i32
  %11 = sext i32 %10 to i64
  %12 = or i64 1423687254, %11
  %13 = load i32** %l_14, align 8
  %14 = load i32* %13
  %15 = sext i32 %14 to i64
  %16 = and i64 %15, %12
  %17 = trunc i64 %16 to i32
  store i32 %17, i32* %13
  %18 = load i64* %1, align 8
  %19 = trunc i64 %18 to i16
  %20 = icmp eq i32** %l_14, getelementptr inbounds ([3 x [4 x [5 x i32*]]]* @g_13, i32 0, i64 2, i64 3, i64 1)
  %21 = zext i1 %20 to i32
  %22 = trunc i32 %21 to i16
  %23 = call zeroext i16 @safe_add_func_uint16_t_u_u(i16 zeroext %19, i16 zeroext %22)
  %24 = zext i16 %23 to i32
  %25 = load i32** %l_14, align 8
  %26 = load i32* %25
  %27 = or i32 %26, %24
  store i32 %27, i32* %25
  %28 = load i64* %1, align 8
  %29 = trunc i64 %28 to i32
  ret i32 %29
}

define i32 @func_17(i16 zeroext %p_18, i8 zeroext %p_19) nounwind uwtable {
  %1 = alloca i16, align 2
  %2 = alloca i8, align 1
  %l_20 = alloca i32, align 4
  store i16 %p_18, i16* %1, align 2
  store i8 %p_19, i8* %2, align 1
  store i32 1, i32* %l_20, align 4
  %3 = load i32* %l_20, align 4
  ret i32 %3
}

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  %4 = call i32 @func_1()
  %5 = load i16* @g_6, align 2
  %6 = sext i16 %5 to i32
  %7 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %6)
  %8 = load i32* @g_11, align 4
  %9 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str1, i32 0, i32 0), i32 %8)
  %10 = load i32* %1
  ret i32 %10
}

declare i32 @printf(i8*, ...)
