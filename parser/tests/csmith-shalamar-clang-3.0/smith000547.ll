; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith000547.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = global i32 -5, align 4
@.str = private unnamed_addr constant [19 x i8] c"checksum g_2 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable {
  %1 = alloca i32, align 4
  %l_5 = alloca [8 x [2 x [1 x [6 x i32]]]], align 16
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %l = alloca i32, align 4
  store i32 0, i32* %i, align 4
  br label %2

; <label>:2                                       ; preds = %42, %0
  %3 = load i32* %i, align 4
  %4 = icmp slt i32 %3, 8
  br i1 %4, label %5, label %45

; <label>:5                                       ; preds = %2
  store i32 0, i32* %j, align 4
  br label %6

; <label>:6                                       ; preds = %38, %5
  %7 = load i32* %j, align 4
  %8 = icmp slt i32 %7, 2
  br i1 %8, label %9, label %41

; <label>:9                                       ; preds = %6
  store i32 0, i32* %k, align 4
  br label %10

; <label>:10                                      ; preds = %34, %9
  %11 = load i32* %k, align 4
  %12 = icmp slt i32 %11, 1
  br i1 %12, label %13, label %37

; <label>:13                                      ; preds = %10
  store i32 0, i32* %l, align 4
  br label %14

; <label>:14                                      ; preds = %30, %13
  %15 = load i32* %l, align 4
  %16 = icmp slt i32 %15, 6
  br i1 %16, label %17, label %33

; <label>:17                                      ; preds = %14
  %18 = load i32* %l, align 4
  %19 = sext i32 %18 to i64
  %20 = load i32* %k, align 4
  %21 = sext i32 %20 to i64
  %22 = load i32* %j, align 4
  %23 = sext i32 %22 to i64
  %24 = load i32* %i, align 4
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds [8 x [2 x [1 x [6 x i32]]]]* %l_5, i32 0, i64 %25
  %27 = getelementptr inbounds [2 x [1 x [6 x i32]]]* %26, i32 0, i64 %23
  %28 = getelementptr inbounds [1 x [6 x i32]]* %27, i32 0, i64 %21
  %29 = getelementptr inbounds [6 x i32]* %28, i32 0, i64 %19
  store i32 553545266, i32* %29, align 4
  br label %30

; <label>:30                                      ; preds = %17
  %31 = load i32* %l, align 4
  %32 = add nsw i32 %31, 1
  store i32 %32, i32* %l, align 4
  br label %14

; <label>:33                                      ; preds = %14
  br label %34

; <label>:34                                      ; preds = %33
  %35 = load i32* %k, align 4
  %36 = add nsw i32 %35, 1
  store i32 %36, i32* %k, align 4
  br label %10

; <label>:37                                      ; preds = %10
  br label %38

; <label>:38                                      ; preds = %37
  %39 = load i32* %j, align 4
  %40 = add nsw i32 %39, 1
  store i32 %40, i32* %j, align 4
  br label %6

; <label>:41                                      ; preds = %6
  br label %42

; <label>:42                                      ; preds = %41
  %43 = load i32* %i, align 4
  %44 = add nsw i32 %43, 1
  store i32 %44, i32* %i, align 4
  br label %2

; <label>:45                                      ; preds = %2
  store i32 0, i32* @g_2, align 4
  br label %46

; <label>:46                                      ; preds = %55, %45
  %47 = load i32* @g_2, align 4
  %48 = icmp sle i32 %47, 0
  br i1 %48, label %49, label %60

; <label>:49                                      ; preds = %46
  %50 = getelementptr inbounds [8 x [2 x [1 x [6 x i32]]]]* %l_5, i32 0, i64 6
  %51 = getelementptr inbounds [2 x [1 x [6 x i32]]]* %50, i32 0, i64 0
  %52 = getelementptr inbounds [1 x [6 x i32]]* %51, i32 0, i64 0
  %53 = getelementptr inbounds [6 x i32]* %52, i32 0, i64 4
  %54 = load i32* %53, align 4
  store i32 %54, i32* %1
  br label %62
                                                  ; No predecessors!
  %56 = load i32* @g_2, align 4
  %57 = trunc i32 %56 to i16
  %58 = call signext i16 @safe_sub_func_int16_t_s_s(i16 signext %57, i16 signext 1)
  %59 = sext i16 %58 to i32
  store i32 %59, i32* @g_2, align 4
  br label %46

; <label>:60                                      ; preds = %46
  %61 = load i32* @g_2, align 4
  store i32 %61, i32* %1
  br label %62

; <label>:62                                      ; preds = %60, %49
  %63 = load i32* %1
  ret i32 %63
}

define internal signext i16 @safe_sub_func_int16_t_s_s(i16 signext %si1, i16 signext %si2) nounwind uwtable {
  %1 = alloca i16, align 2
  %2 = alloca i16, align 2
  store i16 %si1, i16* %1, align 2
  store i16 %si2, i16* %2, align 2
  %3 = load i16* %1, align 2
  %4 = sext i16 %3 to i32
  %5 = load i16* %2, align 2
  %6 = sext i16 %5 to i32
  %7 = sub nsw i32 %4, %6
  %8 = trunc i32 %7 to i16
  ret i16 %8
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
