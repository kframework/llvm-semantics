; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith001469.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_3 = global i32 -1237137653, align 4
@.str = private unnamed_addr constant [19 x i8] c"checksum g_3 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define zeroext i8 @func_1() nounwind uwtable {
  %1 = alloca i8, align 1
  %l_2 = alloca [4 x [2 x i32*]], align 16
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %l_6 = alloca i8, align 1
  store i32 0, i32* %i, align 4
  br label %2

; <label>:2                                       ; preds = %20, %0
  %3 = load i32* %i, align 4
  %4 = icmp slt i32 %3, 4
  br i1 %4, label %5, label %23

; <label>:5                                       ; preds = %2
  store i32 0, i32* %j, align 4
  br label %6

; <label>:6                                       ; preds = %16, %5
  %7 = load i32* %j, align 4
  %8 = icmp slt i32 %7, 2
  br i1 %8, label %9, label %19

; <label>:9                                       ; preds = %6
  %10 = load i32* %j, align 4
  %11 = sext i32 %10 to i64
  %12 = load i32* %i, align 4
  %13 = sext i32 %12 to i64
  %14 = getelementptr inbounds [4 x [2 x i32*]]* %l_2, i32 0, i64 %13
  %15 = getelementptr inbounds [2 x i32*]* %14, i32 0, i64 %11
  store i32* @g_3, i32** %15, align 8
  br label %16

; <label>:16                                      ; preds = %9
  %17 = load i32* %j, align 4
  %18 = add nsw i32 %17, 1
  store i32 %18, i32* %j, align 4
  br label %6

; <label>:19                                      ; preds = %6
  br label %20

; <label>:20                                      ; preds = %19
  %21 = load i32* %i, align 4
  %22 = add nsw i32 %21, 1
  store i32 %22, i32* %i, align 4
  br label %2

; <label>:23                                      ; preds = %2
  %24 = getelementptr inbounds [4 x [2 x i32*]]* %l_2, i32 0, i64 0
  %25 = getelementptr inbounds [2 x i32*]* %24, i32 0, i64 1
  store i32* null, i32** %25, align 8
  store i32 26, i32* @g_3, align 4
  br label %26

; <label>:26                                      ; preds = %36, %23
  %27 = load i32* @g_3, align 4
  %28 = icmp eq i32 %27, -21
  br i1 %28, label %29, label %41

; <label>:29                                      ; preds = %26
  store i8 -54, i8* %l_6, align 1
  %30 = load i32* @g_3, align 4
  %31 = load i8* %l_6, align 1
  %32 = sext i8 %31 to i32
  %33 = and i32 %32, %30
  %34 = trunc i32 %33 to i8
  store i8 %34, i8* %l_6, align 1
  %35 = load i8* %l_6, align 1
  store i8 %35, i8* %1
  br label %44
                                                  ; No predecessors!
  %37 = load i32* @g_3, align 4
  %38 = sext i32 %37 to i64
  %39 = call i64 @safe_add_func_int64_t_s_s(i64 %38, i64 1)
  %40 = trunc i64 %39 to i32
  store i32 %40, i32* @g_3, align 4
  br label %26

; <label>:41                                      ; preds = %26
  %42 = load i32* @g_3, align 4
  %43 = trunc i32 %42 to i8
  store i8 %43, i8* %1
  br label %44

; <label>:44                                      ; preds = %41, %29
  %45 = load i8* %1
  ret i8 %45
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
  %4 = call zeroext i8 @func_1()
  %5 = load i32* @g_3, align 4
  %6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %5)
  %7 = load i32* %1
  ret i32 %7
}

declare i32 @printf(i8*, ...)
