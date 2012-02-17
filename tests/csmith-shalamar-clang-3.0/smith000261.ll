; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith000261.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.S1 = type { i32, i8 }

@g_2 = global %struct.S1* null, align 8
@g_3 = global %struct.S1** null, align 8
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable {
  %l_4 = alloca [7 x [8 x [1 x %struct.S1**]]], align 16
  %l_5 = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  store i32 -1185926829, i32* %l_5, align 4
  store i32 0, i32* %i, align 4
  br label %1

; <label>:1                                       ; preds = %30, %0
  %2 = load i32* %i, align 4
  %3 = icmp slt i32 %2, 7
  br i1 %3, label %4, label %33

; <label>:4                                       ; preds = %1
  store i32 0, i32* %j, align 4
  br label %5

; <label>:5                                       ; preds = %26, %4
  %6 = load i32* %j, align 4
  %7 = icmp slt i32 %6, 8
  br i1 %7, label %8, label %29

; <label>:8                                       ; preds = %5
  store i32 0, i32* %k, align 4
  br label %9

; <label>:9                                       ; preds = %22, %8
  %10 = load i32* %k, align 4
  %11 = icmp slt i32 %10, 1
  br i1 %11, label %12, label %25

; <label>:12                                      ; preds = %9
  %13 = load i32* %k, align 4
  %14 = sext i32 %13 to i64
  %15 = load i32* %j, align 4
  %16 = sext i32 %15 to i64
  %17 = load i32* %i, align 4
  %18 = sext i32 %17 to i64
  %19 = getelementptr inbounds [7 x [8 x [1 x %struct.S1**]]]* %l_4, i32 0, i64 %18
  %20 = getelementptr inbounds [8 x [1 x %struct.S1**]]* %19, i32 0, i64 %16
  %21 = getelementptr inbounds [1 x %struct.S1**]* %20, i32 0, i64 %14
  store %struct.S1** @g_2, %struct.S1*** %21, align 8
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
  %34 = load %struct.S1** @g_2, align 8
  store %struct.S1* %34, %struct.S1** @g_2, align 8
  ret i32 -1185926829
}

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  %4 = call i32 @func_1()
  %5 = load i32* %1
  ret i32 %5
}
