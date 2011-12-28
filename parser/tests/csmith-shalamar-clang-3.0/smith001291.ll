; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith001291.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__undefined = common global i64 0, align 8

define zeroext i16 @func_1() nounwind uwtable {
  %l_2 = alloca [1 x [1 x [8 x i32]]], align 16
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  store i32 0, i32* %i, align 4
  br label %1

; <label>:1                                       ; preds = %30, %0
  %2 = load i32* %i, align 4
  %3 = icmp slt i32 %2, 1
  br i1 %3, label %4, label %33

; <label>:4                                       ; preds = %1
  store i32 0, i32* %j, align 4
  br label %5

; <label>:5                                       ; preds = %26, %4
  %6 = load i32* %j, align 4
  %7 = icmp slt i32 %6, 1
  br i1 %7, label %8, label %29

; <label>:8                                       ; preds = %5
  store i32 0, i32* %k, align 4
  br label %9

; <label>:9                                       ; preds = %22, %8
  %10 = load i32* %k, align 4
  %11 = icmp slt i32 %10, 8
  br i1 %11, label %12, label %25

; <label>:12                                      ; preds = %9
  %13 = load i32* %k, align 4
  %14 = sext i32 %13 to i64
  %15 = load i32* %j, align 4
  %16 = sext i32 %15 to i64
  %17 = load i32* %i, align 4
  %18 = sext i32 %17 to i64
  %19 = getelementptr inbounds [1 x [1 x [8 x i32]]]* %l_2, i32 0, i64 %18
  %20 = getelementptr inbounds [1 x [8 x i32]]* %19, i32 0, i64 %16
  %21 = getelementptr inbounds [8 x i32]* %20, i32 0, i64 %14
  store i32 0, i32* %21, align 4
  br label %22

; <label>:22                                      ; preds = %12
  %23 = load i32* %k, align 4
  %24 = add nsw i32 %23, 1
  store i32 %24, i32* %k, align 4
  br label %9

; <label>:25                                      ; preds = %9
  br label %26

; <label>:26                                      ; preds = %25
  %27 = load i32* %j, align 4
  %28 = add nsw i32 %27, 1
  store i32 %28, i32* %j, align 4
  br label %5

; <label>:29                                      ; preds = %5
  br label %30

; <label>:30                                      ; preds = %29
  %31 = load i32* %i, align 4
  %32 = add nsw i32 %31, 1
  store i32 %32, i32* %i, align 4
  br label %1

; <label>:33                                      ; preds = %1
  %34 = getelementptr inbounds [1 x [1 x [8 x i32]]]* %l_2, i32 0, i64 0
  %35 = getelementptr inbounds [1 x [8 x i32]]* %34, i32 0, i64 0
  %36 = getelementptr inbounds [8 x i32]* %35, i32 0, i64 3
  %37 = load i32* %36, align 4
  %38 = trunc i32 %37 to i16
  ret i16 %38
}

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  %4 = call zeroext i16 @func_1()
  %5 = load i32* %1
  ret i32 %5
}
