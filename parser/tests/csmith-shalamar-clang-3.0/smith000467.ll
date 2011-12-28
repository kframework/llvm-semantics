; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith000467.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_6 = global i32* null, align 8
@g_8 = global i16 -1, align 2
@g_13 = global i32 1, align 4
@g_14 = global [4 x i32] [i32 -1, i32 -1, i32 -1, i32 -1], align 16
@.str = private unnamed_addr constant [19 x i8] c"checksum g_8 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [20 x i8] c"checksum g_13 = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [23 x i8] c"checksum g_14[0] = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [23 x i8] c"checksum g_14[1] = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [23 x i8] c"checksum g_14[2] = %d\0A\00", align 1
@.str5 = private unnamed_addr constant [23 x i8] c"checksum g_14[3] = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define signext i16 @func_1() nounwind uwtable {
  %l_7 = alloca i32*, align 8
  %l_15 = alloca [7 x i32**], align 16
  %i = alloca i32, align 4
  store i32* null, i32** %l_7, align 8
  store i32 0, i32* %i, align 4
  br label %1

; <label>:1                                       ; preds = %8, %0
  %2 = load i32* %i, align 4
  %3 = icmp slt i32 %2, 7
  br i1 %3, label %4, label %11

; <label>:4                                       ; preds = %1
  %5 = load i32* %i, align 4
  %6 = sext i32 %5 to i64
  %7 = getelementptr inbounds [7 x i32**]* %l_15, i32 0, i64 %6
  store i32** null, i32*** %7, align 8
  br label %8

; <label>:8                                       ; preds = %4
  %9 = load i32* %i, align 4
  %10 = add nsw i32 %9, 1
  store i32 %10, i32* %i, align 4
  br label %1

; <label>:11                                      ; preds = %1
  %12 = load i32** %l_7, align 8
  %13 = load i16* @g_8, align 2
  %14 = call i32* @func_2(i32* %12, i32 1184277637, i16 zeroext %13)
  %15 = load i32* @g_13, align 4
  %16 = load i16* @g_8, align 2
  %17 = sext i16 %16 to i32
  %18 = and i32 %15, %17
  %19 = load i32* getelementptr inbounds ([4 x i32]* @g_14, i32 0, i64 2), align 4
  %20 = load i32* getelementptr inbounds ([4 x i32]* @g_14, i32 0, i64 1), align 4
  %21 = icmp uge i32 %19, %20
  %22 = zext i1 %21 to i32
  %23 = or i32 %18, %22
  %24 = icmp ne i32 %23, 0
  %25 = zext i1 %24 to i32
  %26 = trunc i32 %25 to i8
  %27 = call signext i8 @safe_div_func_int8_t_s_s(i8 signext %26, i8 signext 0)
  %28 = sext i8 %27 to i64
  %29 = call i64 @safe_sub_func_uint64_t_u_u(i64 %28, i64 -10)
  %30 = trunc i64 %29 to i32
  %31 = load i32* getelementptr inbounds ([4 x i32]* @g_14, i32 0, i64 3), align 4
  %32 = trunc i32 %31 to i16
  %33 = call i32* @func_2(i32* %14, i32 %30, i16 zeroext %32)
  store i32* %33, i32** @g_6, align 8
  %34 = load i32* @g_13, align 4
  %35 = trunc i32 %34 to i16
  ret i16 %35
}

define i32* @func_2(i32* %p_3, i32 %p_4, i16 zeroext %p_5) nounwind uwtable {
  %1 = alloca i32*, align 8
  %2 = alloca i32, align 4
  %3 = alloca i16, align 2
  store i32* %p_3, i32** %1, align 8
  store i32 %p_4, i32* %2, align 4
  store i16 %p_5, i16* %3, align 2
  %4 = load i32** @g_6, align 8
  ret i32* %4
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

define internal signext i8 @safe_div_func_int8_t_s_s(i8 signext %si1, i8 signext %si2) nounwind uwtable {
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
  %22 = sdiv i32 %19, %21
  br label %23

; <label>:23                                      ; preds = %17, %14
  %24 = phi i32 [ %16, %14 ], [ %22, %17 ]
  %25 = trunc i32 %24 to i8
  ret i8 %25
}

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  %i = alloca i32, align 4
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  %4 = call signext i16 @func_1()
  %5 = load i16* @g_8, align 2
  %6 = sext i16 %5 to i32
  %7 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %6)
  %8 = load i32* @g_13, align 4
  %9 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str1, i32 0, i32 0), i32 %8)
  %10 = load i32* getelementptr inbounds ([4 x i32]* @g_14, i32 0, i64 0), align 4
  %11 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str2, i32 0, i32 0), i32 %10)
  %12 = load i32* getelementptr inbounds ([4 x i32]* @g_14, i32 0, i64 1), align 4
  %13 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str3, i32 0, i32 0), i32 %12)
  %14 = load i32* getelementptr inbounds ([4 x i32]* @g_14, i32 0, i64 2), align 4
  %15 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str4, i32 0, i32 0), i32 %14)
  %16 = load i32* getelementptr inbounds ([4 x i32]* @g_14, i32 0, i64 3), align 4
  %17 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str5, i32 0, i32 0), i32 %16)
  %18 = load i32* getelementptr inbounds ([4 x i32]* @g_14, i32 0, i64 2), align 4
  %19 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str4, i32 0, i32 0), i32 %18)
  %20 = load i32* %1
  ret i32 %20
}

declare i32 @printf(i8*, ...)
