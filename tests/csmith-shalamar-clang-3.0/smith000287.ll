; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith000287.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_3 = global i32 0, align 4
@g_5 = global i32 -1092827760, align 4
@g_13 = global i16 -5329, align 2
@.str = private unnamed_addr constant [19 x i8] c"checksum g_3 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [19 x i8] c"checksum g_5 = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [20 x i8] c"checksum g_13 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define signext i16 @func_1() nounwind uwtable {
  %l_2 = alloca i32, align 4
  %l_6 = alloca i32*, align 8
  %l_4 = alloca i32*, align 8
  %l_12 = alloca i16, align 2
  %l_9 = alloca [6 x i8], align 1
  %i = alloca i32, align 4
  store i32 48438659, i32* %l_2, align 4
  store i32* @g_5, i32** %l_6, align 8
  %1 = load i32* %l_2, align 4
  %2 = icmp ne i32 %1, 0
  br i1 %2, label %3, label %21

; <label>:3                                       ; preds = %0
  %4 = load i32* @g_3, align 4
  %5 = zext i32 %4 to i64
  %6 = icmp sge i64 1464303940, %5
  br i1 %6, label %7, label %21

; <label>:7                                       ; preds = %3
  store i32* @g_5, i32** %l_4, align 8
  %8 = load i32* %l_2, align 4
  %9 = load i32** %l_4, align 8
  %10 = load i32* %9
  %11 = or i32 %10, %8
  store i32 %11, i32* %9
  %12 = load i32* %l_2, align 4
  %13 = load i32** %l_6, align 8
  %14 = icmp ne i32* null, %13
  %15 = zext i1 %14 to i32
  %16 = icmp uge i32 %12, %15
  %17 = zext i1 %16 to i32
  %18 = load i32** %l_4, align 8
  %19 = load i32* %18
  %20 = and i32 %19, %17
  store i32 %20, i32* %18
  br label %62

; <label>:21                                      ; preds = %3, %0
  store i16 -17269, i16* %l_12, align 2
  store i32 0, i32* %l_2, align 4
  br label %22

; <label>:22                                      ; preds = %56, %21
  %23 = load i32* %l_2, align 4
  %24 = icmp ne i32 %23, -4
  br i1 %24, label %25, label %61

; <label>:25                                      ; preds = %22
  store i32 0, i32* %i, align 4
  br label %26

; <label>:26                                      ; preds = %33, %25
  %27 = load i32* %i, align 4
  %28 = icmp slt i32 %27, 6
  br i1 %28, label %29, label %36

; <label>:29                                      ; preds = %26
  %30 = load i32* %i, align 4
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds [6 x i8]* %l_9, i32 0, i64 %31
  store i8 -66, i8* %32, align 1
  br label %33

; <label>:33                                      ; preds = %29
  %34 = load i32* %i, align 4
  %35 = add nsw i32 %34, 1
  store i32 %35, i32* %i, align 4
  br label %26

; <label>:36                                      ; preds = %26
  %37 = load i32** %l_6, align 8
  %38 = load i32* %37
  %39 = sext i32 %38 to i64
  %40 = or i64 %39, -1
  %41 = trunc i64 %40 to i32
  store i32 %41, i32* %37
  %42 = getelementptr inbounds [6 x i8]* %l_9, i32 0, i64 0
  %43 = load i8* %42, align 1
  %44 = icmp ne i8 %43, 0
  br i1 %44, label %45, label %46

; <label>:45                                      ; preds = %36
  br label %61

; <label>:46                                      ; preds = %36
  %47 = load i32* @g_5, align 4
  %48 = or i32 %47, -17269
  %49 = trunc i32 %48 to i8
  %50 = call zeroext i8 @safe_mul_func_uint8_t_u_u(i8 zeroext 0, i8 zeroext %49)
  %51 = zext i8 %50 to i32
  %52 = load i16* @g_13, align 2
  %53 = zext i16 %52 to i32
  %54 = xor i32 %53, %51
  %55 = trunc i32 %54 to i16
  store i16 %55, i16* @g_13, align 2
  br label %56

; <label>:56                                      ; preds = %46
  %57 = load i32* %l_2, align 4
  %58 = zext i32 %57 to i64
  %59 = call i64 @safe_add_func_int64_t_s_s(i64 %58, i64 5)
  %60 = trunc i64 %59 to i32
  store i32 %60, i32* %l_2, align 4
  br label %22

; <label>:61                                      ; preds = %45, %22
  br label %62

; <label>:62                                      ; preds = %61, %7
  %63 = load i16* @g_13, align 2
  ret i16 %63
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

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  %4 = call signext i16 @func_1()
  %5 = load i32* @g_3, align 4
  %6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %5)
  %7 = load i32* @g_5, align 4
  %8 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str1, i32 0, i32 0), i32 %7)
  %9 = load i16* @g_13, align 2
  %10 = zext i16 %9 to i32
  %11 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str2, i32 0, i32 0), i32 %10)
  %12 = load i32* %1
  ret i32 %12
}

declare i32 @printf(i8*, ...)
