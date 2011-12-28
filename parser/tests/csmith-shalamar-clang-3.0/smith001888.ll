; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith001888.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = global i32 -2, align 4
@.str = private unnamed_addr constant [19 x i8] c"checksum g_2 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable {
  %1 = alloca i32, align 4
  %l_5 = alloca [9 x i64], align 16
  %i = alloca i32, align 4
  %i1 = alloca i32, align 4
  %l_6 = alloca i32, align 4
  store i32 0, i32* %i, align 4
  br label %2

; <label>:2                                       ; preds = %9, %0
  %3 = load i32* %i, align 4
  %4 = icmp slt i32 %3, 9
  br i1 %4, label %5, label %12

; <label>:5                                       ; preds = %2
  %6 = load i32* %i, align 4
  %7 = sext i32 %6 to i64
  %8 = getelementptr inbounds [9 x i64]* %l_5, i32 0, i64 %7
  store i64 -2, i64* %8, align 8
  br label %9

; <label>:9                                       ; preds = %5
  %10 = load i32* %i, align 4
  %11 = add nsw i32 %10, 1
  store i32 %11, i32* %i, align 4
  br label %2

; <label>:12                                      ; preds = %2
  store i32 22, i32* @g_2, align 4
  br label %13

; <label>:13                                      ; preds = %26, %12
  %14 = load i32* @g_2, align 4
  %15 = icmp ne i32 %14, 0
  br i1 %15, label %16, label %29

; <label>:16                                      ; preds = %13
  store i32 0, i32* @g_2, align 4
  br label %17

; <label>:17                                      ; preds = %22, %16
  %18 = load i32* @g_2, align 4
  %19 = icmp slt i32 %18, 9
  br i1 %19, label %20, label %25

; <label>:20                                      ; preds = %17
  store i32 -1282269715, i32* %l_6, align 4
  %21 = load i32* %l_6, align 4
  store i32 %21, i32* %1
  br label %31
                                                  ; No predecessors!
  %23 = load i32* @g_2, align 4
  %24 = add nsw i32 %23, 5
  store i32 %24, i32* @g_2, align 4
  br label %17

; <label>:25                                      ; preds = %17
  br label %26

; <label>:26                                      ; preds = %25
  %27 = load i32* @g_2, align 4
  %28 = call i32 @safe_sub_func_int32_t_s_s(i32 %27, i32 3)
  store i32 %28, i32* @g_2, align 4
  br label %13

; <label>:29                                      ; preds = %13
  %30 = load i32* @g_2, align 4
  store i32 %30, i32* %1
  br label %31

; <label>:31                                      ; preds = %29, %20
  %32 = load i32* %1
  ret i32 %32
}

define internal i32 @safe_sub_func_int32_t_s_s(i32 %si1, i32 %si2) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 %si1, i32* %1, align 4
  store i32 %si2, i32* %2, align 4
  %3 = load i32* %1, align 4
  %4 = load i32* %2, align 4
  %5 = xor i32 %3, %4
  %6 = load i32* %1, align 4
  %7 = load i32* %1, align 4
  %8 = load i32* %2, align 4
  %9 = xor i32 %7, %8
  %10 = and i32 %9, -2147483648
  %11 = xor i32 %6, %10
  %12 = load i32* %2, align 4
  %13 = sub nsw i32 %11, %12
  %14 = load i32* %2, align 4
  %15 = xor i32 %13, %14
  %16 = and i32 %5, %15
  %17 = icmp slt i32 %16, 0
  br i1 %17, label %18, label %20

; <label>:18                                      ; preds = %0
  %19 = load i32* %1, align 4
  br label %24

; <label>:20                                      ; preds = %0
  %21 = load i32* %1, align 4
  %22 = load i32* %2, align 4
  %23 = sub nsw i32 %21, %22
  br label %24

; <label>:24                                      ; preds = %20, %18
  %25 = phi i32 [ %19, %18 ], [ %23, %20 ]
  ret i32 %25
}

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  %4 = call i32 @func_1()
  %5 = load i32* @g_2, align 4
  %6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %5)
  %7 = load i32* %1
  ret i32 %7
}

declare i32 @printf(i8*, ...)
