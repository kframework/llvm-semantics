; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith000144.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_4 = global i32 0, align 4
@g_3 = global i32* @g_4, align 8
@.str = private unnamed_addr constant [19 x i8] c"checksum g_4 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable {
  %l_2 = alloca [10 x i8], align 1
  %l_5 = alloca [4 x i32], align 16
  %i = alloca i32, align 4
  store i32 0, i32* %i, align 4
  br label %1

; <label>:1                                       ; preds = %8, %0
  %2 = load i32* %i, align 4
  %3 = icmp slt i32 %2, 10
  br i1 %3, label %4, label %11

; <label>:4                                       ; preds = %1
  %5 = load i32* %i, align 4
  %6 = sext i32 %5 to i64
  %7 = getelementptr inbounds [10 x i8]* %l_2, i32 0, i64 %6
  store i8 -7, i8* %7, align 1
  br label %8

; <label>:8                                       ; preds = %4
  %9 = load i32* %i, align 4
  %10 = add nsw i32 %9, 1
  store i32 %10, i32* %i, align 4
  br label %1

; <label>:11                                      ; preds = %1
  store i32 0, i32* %i, align 4
  br label %12

; <label>:12                                      ; preds = %19, %11
  %13 = load i32* %i, align 4
  %14 = icmp slt i32 %13, 4
  br i1 %14, label %15, label %22

; <label>:15                                      ; preds = %12
  %16 = load i32* %i, align 4
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds [4 x i32]* %l_5, i32 0, i64 %17
  store i32 -1, i32* %18, align 4
  br label %19

; <label>:19                                      ; preds = %15
  %20 = load i32* %i, align 4
  %21 = add nsw i32 %20, 1
  store i32 %21, i32* %i, align 4
  br label %12

; <label>:22                                      ; preds = %12
  %23 = getelementptr inbounds [10 x i8]* %l_2, i32 0, i64 2
  %24 = load i8* %23, align 1
  %25 = zext i8 %24 to i32
  %26 = load volatile i32** @g_3, align 8
  %27 = load i32* %26
  %28 = xor i32 %27, %25
  store i32 %28, i32* %26
  %29 = getelementptr inbounds [4 x i32]* %l_5, i32 0, i64 0
  %30 = load i32* %29, align 4
  ret i32 %30
}

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  %4 = call i32 @func_1()
  %5 = load i32* @g_4, align 4
  %6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %5)
  %7 = load i32* %1
  ret i32 %7
}

declare i32 @printf(i8*, ...)
