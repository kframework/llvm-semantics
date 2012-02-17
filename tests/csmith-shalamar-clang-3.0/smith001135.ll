; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith001135.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_7 = global i32 1, align 4
@g_6 = constant i32* @g_7, align 8
@g_8 = global i32* @g_7, align 8
@.str = private unnamed_addr constant [19 x i8] c"checksum g_7 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable {
  %l_4 = alloca [3 x [9 x i32]], align 16
  %l_5 = alloca i32*, align 8
  %l_9 = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32* null, i32** %l_5, align 8
  store i32 -1, i32* %l_9, align 4
  store i32 0, i32* %i, align 4
  br label %1

; <label>:1                                       ; preds = %19, %0
  %2 = load i32* %i, align 4
  %3 = icmp slt i32 %2, 3
  br i1 %3, label %4, label %22

; <label>:4                                       ; preds = %1
  store i32 0, i32* %j, align 4
  br label %5

; <label>:5                                       ; preds = %15, %4
  %6 = load i32* %j, align 4
  %7 = icmp slt i32 %6, 9
  br i1 %7, label %8, label %18

; <label>:8                                       ; preds = %5
  %9 = load i32* %j, align 4
  %10 = sext i32 %9 to i64
  %11 = load i32* %i, align 4
  %12 = sext i32 %11 to i64
  %13 = getelementptr inbounds [3 x [9 x i32]]* %l_4, i32 0, i64 %12
  %14 = getelementptr inbounds [9 x i32]* %13, i32 0, i64 %10
  store i32 3, i32* %14, align 4
  br label %15

; <label>:15                                      ; preds = %8
  %16 = load i32* %j, align 4
  %17 = add nsw i32 %16, 1
  store i32 %17, i32* %j, align 4
  br label %5

; <label>:18                                      ; preds = %5
  br label %19

; <label>:19                                      ; preds = %18
  %20 = load i32* %i, align 4
  %21 = add nsw i32 %20, 1
  store i32 %21, i32* %i, align 4
  br label %1

; <label>:22                                      ; preds = %1
  %23 = getelementptr inbounds [3 x [9 x i32]]* %l_4, i32 0, i64 0
  %24 = getelementptr inbounds [9 x i32]* %23, i32 0, i64 4
  %25 = load i32* %24, align 4
  %26 = zext i32 %25 to i64
  %27 = getelementptr inbounds [3 x [9 x i32]]* %l_4, i32 0, i64 1
  %28 = getelementptr inbounds [9 x i32]* %27, i32 0, i64 6
  %29 = load i32* %28, align 4
  %30 = zext i32 %29 to i64
  %31 = call i64 @safe_div_func_int64_t_s_s(i64 %26, i64 %30)
  %32 = load volatile i32** @g_6, align 8
  %33 = load i32* %32
  %34 = sext i32 %33 to i64
  %35 = xor i64 %34, %31
  %36 = trunc i64 %35 to i32
  store i32 %36, i32* %32
  %37 = load volatile i32** @g_6, align 8
  %38 = load i32* %37
  %39 = sext i32 %38 to i64
  %40 = and i64 -9, %39
  %41 = trunc i64 %40 to i32
  %42 = load volatile i32** @g_8, align 8
  store i32 %41, i32* %42
  %43 = load volatile i32** @g_6, align 8
  %44 = load i32* %43
  %45 = sext i32 %44 to i64
  %46 = icmp slt i64 %45, 410561473
  %47 = zext i1 %46 to i32
  %48 = load i32* @g_7, align 4
  %49 = load i32* @g_7, align 4
  %50 = icmp ne i32 %49, 0
  br i1 %50, label %51, label %52

; <label>:51                                      ; preds = %22
  br label %52

; <label>:52                                      ; preds = %51, %22
  %53 = phi i1 [ false, %22 ], [ true, %51 ]
  %54 = zext i1 %53 to i32
  %55 = sext i32 %54 to i64
  %56 = icmp sgt i64 2940362591, %55
  %57 = zext i1 %56 to i32
  %58 = icmp ne i32 %48, %57
  %59 = zext i1 %58 to i32
  %60 = or i32 %47, %59
  store i32 %60, i32* %l_9, align 4
  %61 = getelementptr inbounds [3 x [9 x i32]]* %l_4, i32 0, i64 0
  %62 = getelementptr inbounds [9 x i32]* %61, i32 0, i64 4
  %63 = load i32* %62, align 4
  ret i32 %63
}

define internal i64 @safe_div_func_int64_t_s_s(i64 %si1, i64 %si2) nounwind uwtable {
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
  %16 = sdiv i64 %14, %15
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
  %4 = call i32 @func_1()
  %5 = load i32* @g_7, align 4
  %6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %5)
  %7 = load i32* %1
  ret i32 %7
}

declare i32 @printf(i8*, ...)
