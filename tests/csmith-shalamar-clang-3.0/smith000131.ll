; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith000131.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = global i32 -1, align 4
@g_7 = global i32 -746925003, align 4
@.str = private unnamed_addr constant [19 x i8] c"checksum g_2 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [19 x i8] c"checksum g_7 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define signext i16 @func_1() nounwind uwtable {
  %1 = alloca i16, align 2
  %l_5 = alloca i32*, align 8
  %l_6 = alloca i32**, align 8
  %l_9 = alloca i16, align 2
  store i32* @g_2, i32** %l_5, align 8
  store i32 0, i32* @g_2, align 4
  br label %2

; <label>:2                                       ; preds = %25, %0
  %3 = load i32* @g_2, align 4
  %4 = icmp sle i32 %3, -21
  br i1 %4, label %5, label %28

; <label>:5                                       ; preds = %2
  store i32** %l_5, i32*** %l_6, align 8
  br label %6

; <label>:6                                       ; preds = %14, %5
  %7 = load i32** %l_5, align 8
  %8 = load i32*** %l_6, align 8
  store i32* %7, i32** %8
  %9 = load i32* @g_7, align 4
  %10 = icmp ne i32 %9, 0
  br i1 %10, label %11, label %16

; <label>:11                                      ; preds = %6
  %12 = load i32* @g_7, align 4
  %13 = icmp ne i32 %12, 0
  br i1 %13, label %14, label %15

; <label>:14                                      ; preds = %11
  br label %6

; <label>:15                                      ; preds = %11
  br label %18

; <label>:16                                      ; preds = %6
  store i16 5241, i16* %l_9, align 2
  %17 = load i16* %l_9, align 2
  store i16 %17, i16* %1
  br label %32

; <label>:18                                      ; preds = %15
  %19 = load i32*** %l_6, align 8
  %20 = load i32** %19
  %21 = load i32* %20
  %22 = icmp ne i32 %21, 0
  br i1 %22, label %23, label %24

; <label>:23                                      ; preds = %18
  br label %25

; <label>:24                                      ; preds = %18
  br label %25

; <label>:25                                      ; preds = %24, %23
  %26 = load i32* @g_2, align 4
  %27 = call i32 @safe_sub_func_uint32_t_u_u(i32 %26, i32 6)
  store i32 %27, i32* @g_2, align 4
  br label %2

; <label>:28                                      ; preds = %2
  %29 = load i32** %l_5, align 8
  %30 = load i32* %29
  %31 = trunc i32 %30 to i16
  store i16 %31, i16* %1
  br label %32

; <label>:32                                      ; preds = %28, %16
  %33 = load i16* %1
  ret i16 %33
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
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  %4 = call signext i16 @func_1()
  %5 = load i32* @g_2, align 4
  %6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %5)
  %7 = load i32* @g_7, align 4
  %8 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str1, i32 0, i32 0), i32 %7)
  %9 = load i32* %1
  ret i32 %9
}

declare i32 @printf(i8*, ...)
