; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith000050.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = global i32 -179040897, align 4
@g_10 = global i32 -443743733, align 4
@g_9 = global i32* @g_10, align 8
@.str = private unnamed_addr constant [19 x i8] c"checksum g_2 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [20 x i8] c"checksum g_10 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define zeroext i8 @func_1() nounwind uwtable {
  %1 = alloca i8, align 1
  %l_11 = alloca [10 x i8], align 1
  %i = alloca i32, align 4
  %l_5 = alloca i16, align 2
  %l_6 = alloca [9 x i32], align 16
  %i1 = alloca i32, align 4
  store i32 0, i32* %i, align 4
  br label %2

; <label>:2                                       ; preds = %9, %0
  %3 = load i32* %i, align 4
  %4 = icmp slt i32 %3, 10
  br i1 %4, label %5, label %12

; <label>:5                                       ; preds = %2
  %6 = load i32* %i, align 4
  %7 = sext i32 %6 to i64
  %8 = getelementptr inbounds [10 x i8]* %l_11, i32 0, i64 %7
  store i8 -25, i8* %8, align 1
  br label %9

; <label>:9                                       ; preds = %5
  %10 = load i32* %i, align 4
  %11 = add nsw i32 %10, 1
  store i32 %11, i32* %i, align 4
  br label %2

; <label>:12                                      ; preds = %2
  store i32 0, i32* @g_2, align 4
  br label %13

; <label>:13                                      ; preds = %37, %12
  %14 = load i32* @g_2, align 4
  %15 = icmp sgt i32 %14, 0
  br i1 %15, label %16, label %42

; <label>:16                                      ; preds = %13
  store i16 1, i16* %l_5, align 2
  %17 = load i16* %l_5, align 2
  %18 = icmp ne i16 %17, 0
  br i1 %18, label %19, label %22

; <label>:19                                      ; preds = %16
  %20 = load i32* @g_2, align 4
  %21 = trunc i32 %20 to i8
  store i8 %21, i8* %1
  br label %52

; <label>:22                                      ; preds = %16
  store i32 0, i32* %i1, align 4
  br label %23

; <label>:23                                      ; preds = %30, %22
  %24 = load i32* %i1, align 4
  %25 = icmp slt i32 %24, 9
  br i1 %25, label %26, label %33

; <label>:26                                      ; preds = %23
  %27 = load i32* %i1, align 4
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds [9 x i32]* %l_6, i32 0, i64 %28
  store i32 1, i32* %29, align 4
  br label %30

; <label>:30                                      ; preds = %26
  %31 = load i32* %i1, align 4
  %32 = add nsw i32 %31, 1
  store i32 %32, i32* %i1, align 4
  br label %23

; <label>:33                                      ; preds = %23
  %34 = getelementptr inbounds [9 x i32]* %l_6, i32 0, i64 8
  %35 = load i32* %34, align 4
  %36 = trunc i32 %35 to i8
  store i8 %36, i8* %1
  br label %52
                                                  ; No predecessors!
  %38 = load i32* @g_2, align 4
  %39 = trunc i32 %38 to i8
  %40 = call signext i8 @safe_add_func_int8_t_s_s(i8 signext %39, i8 signext 1)
  %41 = sext i8 %40 to i32
  store i32 %41, i32* @g_2, align 4
  br label %13

; <label>:42                                      ; preds = %13
  %43 = load i32* @g_2, align 4
  %44 = trunc i32 %43 to i8
  %45 = call signext i8 @safe_rshift_func_int8_t_s_u(i8 signext %44, i32 3)
  %46 = sext i8 %45 to i32
  %47 = load volatile i32** @g_9, align 8
  %48 = load i32* %47
  %49 = and i32 %48, %46
  store i32 %49, i32* %47
  %50 = getelementptr inbounds [10 x i8]* %l_11, i32 0, i64 7
  %51 = load i8* %50, align 1
  store i8 %51, i8* %1
  br label %52

; <label>:52                                      ; preds = %42, %33, %19
  %53 = load i8* %1
  ret i8 %53
}

define internal signext i8 @safe_add_func_int8_t_s_s(i8 signext %si1, i8 signext %si2) nounwind uwtable {
  %1 = alloca i8, align 1
  %2 = alloca i8, align 1
  store i8 %si1, i8* %1, align 1
  store i8 %si2, i8* %2, align 1
  %3 = load i8* %1, align 1
  %4 = sext i8 %3 to i32
  %5 = load i8* %2, align 1
  %6 = sext i8 %5 to i32
  %7 = add nsw i32 %4, %6
  %8 = trunc i32 %7 to i8
  ret i8 %8
}

define internal signext i8 @safe_rshift_func_int8_t_s_u(i8 signext %left, i32 %right) nounwind uwtable {
  %1 = alloca i8, align 1
  %2 = alloca i32, align 4
  store i8 %left, i8* %1, align 1
  store i32 %right, i32* %2, align 4
  %3 = load i8* %1, align 1
  %4 = sext i8 %3 to i32
  %5 = icmp slt i32 %4, 0
  br i1 %5, label %9, label %6

; <label>:6                                       ; preds = %0
  %7 = load i32* %2, align 4
  %8 = icmp uge i32 %7, 32
  br i1 %8, label %9, label %12

; <label>:9                                       ; preds = %6, %0
  %10 = load i8* %1, align 1
  %11 = sext i8 %10 to i32
  br label %17

; <label>:12                                      ; preds = %6
  %13 = load i8* %1, align 1
  %14 = sext i8 %13 to i32
  %15 = load i32* %2, align 4
  %16 = ashr i32 %14, %15
  br label %17

; <label>:17                                      ; preds = %12, %9
  %18 = phi i32 [ %11, %9 ], [ %16, %12 ]
  %19 = trunc i32 %18 to i8
  ret i8 %19
}

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  %4 = call zeroext i8 @func_1()
  %5 = load i32* @g_2, align 4
  %6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %5)
  %7 = load i32* @g_10, align 4
  %8 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str1, i32 0, i32 0), i32 %7)
  %9 = load i32* %1
  ret i32 %9
}

declare i32 @printf(i8*, ...)
