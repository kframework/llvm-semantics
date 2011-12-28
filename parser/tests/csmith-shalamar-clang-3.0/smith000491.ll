; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith000491.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = global i32 398334073, align 4
@g_7 = global i32 1, align 4
@g_8 = global i32* @g_2, align 8
@.str = private unnamed_addr constant [19 x i8] c"checksum g_2 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [19 x i8] c"checksum g_7 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define signext i8 @func_1() nounwind uwtable {
  %l_5 = alloca i32, align 4
  %l_6 = alloca i32*, align 8
  store volatile i32 19, i32* @g_2, align 4
  br label %1

; <label>:1                                       ; preds = %9, %0
  %2 = load volatile i32* @g_2, align 4
  %3 = icmp sle i32 %2, 0
  br i1 %3, label %4, label %12

; <label>:4                                       ; preds = %1
  store i32 -1, i32* %l_5, align 4
  store i32* @g_7, i32** %l_6, align 8
  %5 = load i32* %l_5, align 4
  %6 = load i32** %l_6, align 8
  %7 = load i32* %6
  %8 = and i32 %7, %5
  store i32 %8, i32* %6
  br label %9

; <label>:9                                       ; preds = %4
  %10 = load volatile i32* @g_2, align 4
  %11 = call i32 @safe_add_func_uint32_t_u_u(i32 %10, i32 9)
  store volatile i32 %11, i32* @g_2, align 4
  br label %1

; <label>:12                                      ; preds = %1
  %13 = load volatile i32* @g_2, align 4
  %14 = load volatile i32** @g_8, align 8
  store volatile i32 %13, i32* %14
  %15 = load volatile i32* @g_2, align 4
  %16 = trunc i32 %15 to i8
  ret i8 %16
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

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  %4 = call signext i8 @func_1()
  %5 = load volatile i32* @g_2, align 4
  %6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %5)
  %7 = load i32* @g_7, align 4
  %8 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str1, i32 0, i32 0), i32 %7)
  %9 = load i32* %1
  ret i32 %9
}

declare i32 @printf(i8*, ...)
