; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith000704.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_5 = global i16 -1, align 2
@g_6 = global i16 1, align 2
@.str = private unnamed_addr constant [19 x i8] c"checksum g_5 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [19 x i8] c"checksum g_6 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define zeroext i8 @func_1() nounwind uwtable {
  %l_4 = alloca i32, align 4
  %l_10 = alloca i32*, align 8
  %l_11 = alloca i32*, align 8
  store i32 1, i32* %l_4, align 4
  br label %1

; <label>:1                                       ; preds = %21, %0
  %2 = load i32* %l_4, align 4
  %3 = trunc i32 %2 to i16
  %4 = load i32* %l_4, align 4
  %5 = load volatile i16* @g_5, align 2
  %6 = zext i16 %5 to i32
  %7 = and i32 %4, %6
  %8 = load i16* @g_6, align 2
  %9 = sext i16 %8 to i32
  %10 = xor i32 %7, %9
  %11 = trunc i32 %10 to i16
  %12 = call signext i16 @safe_mul_func_int16_t_s_s(i16 signext %3, i16 signext %11)
  %13 = sext i16 %12 to i32
  store i32 %13, i32* %l_4, align 4
  store volatile i16 5, i16* @g_5, align 2
  br label %14

; <label>:14                                      ; preds = %28, %1
  %15 = load volatile i16* @g_5, align 2
  %16 = zext i16 %15 to i32
  %17 = icmp ne i32 %16, 5
  br i1 %17, label %18, label %33

; <label>:18                                      ; preds = %14
  store i32* null, i32** %l_10, align 8
  store i32* %l_4, i32** %l_11, align 8
  %19 = load i16* @g_6, align 2
  %20 = icmp ne i16 %19, 0
  br i1 %20, label %21, label %22

; <label>:21                                      ; preds = %18
  br label %1

; <label>:22                                      ; preds = %18
  %23 = load i32** %l_11, align 8
  %24 = load i32* %23
  %25 = sext i32 %24 to i64
  %26 = or i64 %25, 2703514753
  %27 = trunc i64 %26 to i32
  store i32 %27, i32* %23
  br label %28

; <label>:28                                      ; preds = %22
  %29 = load volatile i16* @g_5, align 2
  %30 = trunc i16 %29 to i8
  %31 = call signext i8 @safe_sub_func_int8_t_s_s(i8 signext %30, i8 signext 7)
  %32 = sext i8 %31 to i16
  store volatile i16 %32, i16* @g_5, align 2
  br label %14

; <label>:33                                      ; preds = %14
  %34 = load i16* @g_6, align 2
  %35 = trunc i16 %34 to i8
  ret i8 %35
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
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  %4 = call zeroext i8 @func_1()
  %5 = load volatile i16* @g_5, align 2
  %6 = zext i16 %5 to i32
  %7 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %6)
  %8 = load i16* @g_6, align 2
  %9 = sext i16 %8 to i32
  %10 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str1, i32 0, i32 0), i32 %9)
  %11 = load i32* %1
  ret i32 %11
}

declare i32 @printf(i8*, ...)
