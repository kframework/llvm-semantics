; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith001451.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_7 = global i32 -8, align 4
@g_12 = global i32* @g_7, align 8
@.str = private unnamed_addr constant [19 x i8] c"checksum g_7 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i64 @func_1() nounwind uwtable {
  %l_8 = alloca i32, align 4
  %l_11 = alloca i32, align 4
  store i32 -541234113, i32* %l_8, align 4
  store i32 2127307843, i32* %l_11, align 4
  %1 = load i32* %l_8, align 4
  %2 = trunc i32 %1 to i16
  %3 = load i32* %l_11, align 4
  %4 = sext i32 %3 to i64
  %5 = call i64 @safe_mod_func_int64_t_s_s(i64 %4, i64 3)
  %6 = trunc i64 %5 to i8
  %7 = load i32* @g_7, align 4
  %8 = trunc i32 %7 to i8
  %9 = call i32* @func_2(i16 signext %2, i8 zeroext %6, i8 signext %8)
  store i32* %9, i32** @g_12, align 8
  %10 = load i32* %l_11, align 4
  %11 = sext i32 %10 to i64
  ret i64 %11
}

define i32* @func_2(i16 signext %p_3, i8 zeroext %p_4, i8 signext %p_5) nounwind uwtable {
  %1 = alloca i16, align 2
  %2 = alloca i8, align 1
  %3 = alloca i8, align 1
  %l_6 = alloca i32*, align 8
  store i16 %p_3, i16* %1, align 2
  store i8 %p_4, i8* %2, align 1
  store i8 %p_5, i8* %3, align 1
  store i32* @g_7, i32** %l_6, align 8
  %4 = load i32** %l_6, align 8
  ret i32* %4
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

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  %4 = call i64 @func_1()
  %5 = load i32* @g_7, align 4
  %6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %5)
  %7 = load i32* %1
  ret i32 %7
}

declare i32 @printf(i8*, ...)
