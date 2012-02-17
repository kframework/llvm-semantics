; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith001910.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_3 = global i32 432383572, align 4
@g_5 = global i32 -8, align 4
@g_4 = global i32* @g_5, align 8
@.str = private unnamed_addr constant [19 x i8] c"checksum g_3 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [19 x i8] c"checksum g_5 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define signext i16 @func_1() nounwind uwtable {
  %l_2 = alloca i32*, align 8
  store i32* @g_3, i32** %l_2, align 8
  %1 = load i32** %l_2, align 8
  %2 = load i32* %1
  %3 = sext i32 %2 to i64
  %4 = and i64 %3, 1
  %5 = trunc i64 %4 to i32
  store i32 %5, i32* %1
  %6 = load i32* @g_3, align 4
  %7 = xor i32 %6, 1
  %8 = load i32** %l_2, align 8
  store i32 %7, i32* %8
  %9 = load i32** %l_2, align 8
  %10 = load i32* %9
  %11 = icmp ne i32 %10, 0
  br i1 %11, label %12, label %20

; <label>:12                                      ; preds = %0
  %13 = load i32** %l_2, align 8
  %14 = load i32* %13
  %15 = load i32* @g_3, align 4
  %16 = icmp slt i32 %14, %15
  %17 = zext i1 %16 to i32
  %18 = sext i32 %17 to i64
  %19 = icmp sle i64 763615107, %18
  br label %20

; <label>:20                                      ; preds = %12, %0
  %21 = phi i1 [ false, %0 ], [ %19, %12 ]
  %22 = zext i1 %21 to i32
  %23 = load volatile i32** @g_4, align 8
  %24 = load i32* %23
  %25 = and i32 %24, %22
  store i32 %25, i32* %23
  %26 = load i32* @g_3, align 4
  %27 = trunc i32 %26 to i16
  ret i16 %27
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
  %9 = load i32* %1
  ret i32 %9
}

declare i32 @printf(i8*, ...)
