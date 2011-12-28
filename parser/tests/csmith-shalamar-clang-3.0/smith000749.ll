; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith000749.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = global i32 0, align 4
@.str = private unnamed_addr constant [19 x i8] c"checksum g_2 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable {
  %1 = alloca i32, align 4
  %l_7 = alloca [7 x [2 x [1 x [6 x [1 x i32*]]]]], align 16
  %l_6 = alloca i32**, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %l = alloca i32, align 4
  %m = alloca i32, align 4
  %l_5 = alloca i8, align 1
  %2 = getelementptr inbounds [7 x [2 x [1 x [6 x [1 x i32*]]]]]* %l_7, i32 0, i64 1
  %3 = getelementptr inbounds [2 x [1 x [6 x [1 x i32*]]]]* %2, i32 0, i64 0
  %4 = getelementptr inbounds [1 x [6 x [1 x i32*]]]* %3, i32 0, i64 0
  %5 = getelementptr inbounds [6 x [1 x i32*]]* %4, i32 0, i64 1
  %6 = getelementptr inbounds [1 x i32*]* %5, i32 0, i64 0
  store i32** %6, i32*** %l_6, align 8
  store i32 0, i32* %i, align 4
  br label %7

; <label>:7                                       ; preds = %58, %0
  %8 = load i32* %i, align 4
  %9 = icmp slt i32 %8, 7
  br i1 %9, label %10, label %61

; <label>:10                                      ; preds = %7
  store i32 0, i32* %j, align 4
  br label %11

; <label>:11                                      ; preds = %54, %10
  %12 = load i32* %j, align 4
  %13 = icmp slt i32 %12, 2
  br i1 %13, label %14, label %57

; <label>:14                                      ; preds = %11
  store i32 0, i32* %k, align 4
  br label %15

; <label>:15                                      ; preds = %50, %14
  %16 = load i32* %k, align 4
  %17 = icmp slt i32 %16, 1
  br i1 %17, label %18, label %53

; <label>:18                                      ; preds = %15
  store i32 0, i32* %l, align 4
  br label %19

; <label>:19                                      ; preds = %46, %18
  %20 = load i32* %l, align 4
  %21 = icmp slt i32 %20, 6
  br i1 %21, label %22, label %49

; <label>:22                                      ; preds = %19
  store i32 0, i32* %m, align 4
  br label %23

; <label>:23                                      ; preds = %42, %22
  %24 = load i32* %m, align 4
  %25 = icmp slt i32 %24, 1
  br i1 %25, label %26, label %45

; <label>:26                                      ; preds = %23
  %27 = load i32* %m, align 4
  %28 = sext i32 %27 to i64
  %29 = load i32* %l, align 4
  %30 = sext i32 %29 to i64
  %31 = load i32* %k, align 4
  %32 = sext i32 %31 to i64
  %33 = load i32* %j, align 4
  %34 = sext i32 %33 to i64
  %35 = load i32* %i, align 4
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds [7 x [2 x [1 x [6 x [1 x i32*]]]]]* %l_7, i32 0, i64 %36
  %38 = getelementptr inbounds [2 x [1 x [6 x [1 x i32*]]]]* %37, i32 0, i64 %34
  %39 = getelementptr inbounds [1 x [6 x [1 x i32*]]]* %38, i32 0, i64 %32
  %40 = getelementptr inbounds [6 x [1 x i32*]]* %39, i32 0, i64 %30
  %41 = getelementptr inbounds [1 x i32*]* %40, i32 0, i64 %28
  store i32* @g_2, i32** %41, align 8
  br label %42

; <label>:42                                      ; preds = %26
  %43 = load i32* %m, align 4
  %44 = add nsw i32 %43, 1
  store i32 %44, i32* %m, align 4
  br label %23

; <label>:45                                      ; preds = %23
  br label %46

; <label>:46                                      ; preds = %45
  %47 = load i32* %l, align 4
  %48 = add nsw i32 %47, 1
  store i32 %48, i32* %l, align 4
  br label %19

; <label>:49                                      ; preds = %19
  br label %50

; <label>:50                                      ; preds = %49
  %51 = load i32* %k, align 4
  %52 = add nsw i32 %51, 1
  store i32 %52, i32* %k, align 4
  br label %15

; <label>:53                                      ; preds = %15
  br label %54

; <label>:54                                      ; preds = %53
  %55 = load i32* %j, align 4
  %56 = add nsw i32 %55, 1
  store i32 %56, i32* %j, align 4
  br label %11

; <label>:57                                      ; preds = %11
  br label %58

; <label>:58                                      ; preds = %57
  %59 = load i32* %i, align 4
  %60 = add nsw i32 %59, 1
  store i32 %60, i32* %i, align 4
  br label %7

; <label>:61                                      ; preds = %7
  store i32 0, i32* @g_2, align 4
  br label %62

; <label>:62                                      ; preds = %68, %61
  %63 = load i32* @g_2, align 4
  %64 = icmp sgt i32 %63, 0
  br i1 %64, label %65, label %71

; <label>:65                                      ; preds = %62
  store i8 1, i8* %l_5, align 1
  %66 = load i8* %l_5, align 1
  %67 = zext i8 %66 to i32
  store i32 %67, i32* %1
  br label %76
                                                  ; No predecessors!
  %69 = load i32* @g_2, align 4
  %70 = call i32 @safe_add_func_uint32_t_u_u(i32 %69, i32 1)
  store i32 %70, i32* @g_2, align 4
  br label %62

; <label>:71                                      ; preds = %62
  %72 = load i32*** %l_6, align 8
  store i32* @g_2, i32** %72
  %73 = load i32*** %l_6, align 8
  %74 = load i32** %73
  %75 = load i32* %74
  store i32 %75, i32* %1
  br label %76

; <label>:76                                      ; preds = %71, %65
  %77 = load i32* %1
  ret i32 %77
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
  %4 = call i32 @func_1()
  %5 = load i32* @g_2, align 4
  %6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %5)
  %7 = load i32* %1
  ret i32 %7
}

declare i32 @printf(i8*, ...)
