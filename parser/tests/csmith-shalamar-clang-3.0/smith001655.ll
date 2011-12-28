; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith001655.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_3 = global i32 -1460061947, align 4
@g_10 = global [1 x [1 x i32*]] [[1 x i32*] [i32* @g_3]], align 8
@.str = private unnamed_addr constant [19 x i8] c"checksum g_3 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define signext i8 @func_1() nounwind uwtable {
  %l_2 = alloca [6 x i32*], align 16
  %l_9 = alloca [6 x [10 x [1 x [1 x [1 x i32]]]]], align 16
  %l_11 = alloca [1 x [9 x i32**]], align 16
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %l = alloca i32, align 4
  %m = alloca i32, align 4
  store i32 0, i32* %i, align 4
  br label %1

; <label>:1                                       ; preds = %8, %0
  %2 = load i32* %i, align 4
  %3 = icmp slt i32 %2, 6
  br i1 %3, label %4, label %11

; <label>:4                                       ; preds = %1
  %5 = load i32* %i, align 4
  %6 = sext i32 %5 to i64
  %7 = getelementptr inbounds [6 x i32*]* %l_2, i32 0, i64 %6
  store i32* @g_3, i32** %7, align 8
  br label %8

; <label>:8                                       ; preds = %4
  %9 = load i32* %i, align 4
  %10 = add nsw i32 %9, 1
  store i32 %10, i32* %i, align 4
  br label %1

; <label>:11                                      ; preds = %1
  store i32 0, i32* %i, align 4
  br label %12

; <label>:12                                      ; preds = %63, %11
  %13 = load i32* %i, align 4
  %14 = icmp slt i32 %13, 6
  br i1 %14, label %15, label %66

; <label>:15                                      ; preds = %12
  store i32 0, i32* %j, align 4
  br label %16

; <label>:16                                      ; preds = %59, %15
  %17 = load i32* %j, align 4
  %18 = icmp slt i32 %17, 10
  br i1 %18, label %19, label %62

; <label>:19                                      ; preds = %16
  store i32 0, i32* %k, align 4
  br label %20

; <label>:20                                      ; preds = %55, %19
  %21 = load i32* %k, align 4
  %22 = icmp slt i32 %21, 1
  br i1 %22, label %23, label %58

; <label>:23                                      ; preds = %20
  store i32 0, i32* %l, align 4
  br label %24

; <label>:24                                      ; preds = %51, %23
  %25 = load i32* %l, align 4
  %26 = icmp slt i32 %25, 1
  br i1 %26, label %27, label %54

; <label>:27                                      ; preds = %24
  store i32 0, i32* %m, align 4
  br label %28

; <label>:28                                      ; preds = %47, %27
  %29 = load i32* %m, align 4
  %30 = icmp slt i32 %29, 1
  br i1 %30, label %31, label %50

; <label>:31                                      ; preds = %28
  %32 = load i32* %m, align 4
  %33 = sext i32 %32 to i64
  %34 = load i32* %l, align 4
  %35 = sext i32 %34 to i64
  %36 = load i32* %k, align 4
  %37 = sext i32 %36 to i64
  %38 = load i32* %j, align 4
  %39 = sext i32 %38 to i64
  %40 = load i32* %i, align 4
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds [6 x [10 x [1 x [1 x [1 x i32]]]]]* %l_9, i32 0, i64 %41
  %43 = getelementptr inbounds [10 x [1 x [1 x [1 x i32]]]]* %42, i32 0, i64 %39
  %44 = getelementptr inbounds [1 x [1 x [1 x i32]]]* %43, i32 0, i64 %37
  %45 = getelementptr inbounds [1 x [1 x i32]]* %44, i32 0, i64 %35
  %46 = getelementptr inbounds [1 x i32]* %45, i32 0, i64 %33
  store i32 6897299, i32* %46, align 4
  br label %47

; <label>:47                                      ; preds = %31
  %48 = load i32* %m, align 4
  %49 = add nsw i32 %48, 1
  store i32 %49, i32* %m, align 4
  br label %28

; <label>:50                                      ; preds = %28
  br label %51

; <label>:51                                      ; preds = %50
  %52 = load i32* %l, align 4
  %53 = add nsw i32 %52, 1
  store i32 %53, i32* %l, align 4
  br label %24

; <label>:54                                      ; preds = %24
  br label %55

; <label>:55                                      ; preds = %54
  %56 = load i32* %k, align 4
  %57 = add nsw i32 %56, 1
  store i32 %57, i32* %k, align 4
  br label %20

; <label>:58                                      ; preds = %20
  br label %59

; <label>:59                                      ; preds = %58
  %60 = load i32* %j, align 4
  %61 = add nsw i32 %60, 1
  store i32 %61, i32* %j, align 4
  br label %16

; <label>:62                                      ; preds = %16
  br label %63

; <label>:63                                      ; preds = %62
  %64 = load i32* %i, align 4
  %65 = add nsw i32 %64, 1
  store i32 %65, i32* %i, align 4
  br label %12

; <label>:66                                      ; preds = %12
  store i32 0, i32* %i, align 4
  br label %67

; <label>:67                                      ; preds = %86, %66
  %68 = load i32* %i, align 4
  %69 = icmp slt i32 %68, 1
  br i1 %69, label %70, label %89

; <label>:70                                      ; preds = %67
  store i32 0, i32* %j, align 4
  br label %71

; <label>:71                                      ; preds = %82, %70
  %72 = load i32* %j, align 4
  %73 = icmp slt i32 %72, 9
  br i1 %73, label %74, label %85

; <label>:74                                      ; preds = %71
  %75 = getelementptr inbounds [6 x i32*]* %l_2, i32 0, i64 0
  %76 = load i32* %j, align 4
  %77 = sext i32 %76 to i64
  %78 = load i32* %i, align 4
  %79 = sext i32 %78 to i64
  %80 = getelementptr inbounds [1 x [9 x i32**]]* %l_11, i32 0, i64 %79
  %81 = getelementptr inbounds [9 x i32**]* %80, i32 0, i64 %77
  store i32** %75, i32*** %81, align 8
  br label %82

; <label>:82                                      ; preds = %74
  %83 = load i32* %j, align 4
  %84 = add nsw i32 %83, 1
  store i32 %84, i32* %j, align 4
  br label %71

; <label>:85                                      ; preds = %71
  br label %86

; <label>:86                                      ; preds = %85
  %87 = load i32* %i, align 4
  %88 = add nsw i32 %87, 1
  store i32 %88, i32* %i, align 4
  br label %67

; <label>:89                                      ; preds = %67
  store i32 -1, i32* @g_3, align 4
  %90 = load i32* @g_3, align 4
  %91 = trunc i32 %90 to i16
  %92 = getelementptr inbounds [6 x [10 x [1 x [1 x [1 x i32]]]]]* %l_9, i32 0, i64 1
  %93 = getelementptr inbounds [10 x [1 x [1 x [1 x i32]]]]* %92, i32 0, i64 7
  %94 = getelementptr inbounds [1 x [1 x [1 x i32]]]* %93, i32 0, i64 0
  %95 = getelementptr inbounds [1 x [1 x i32]]* %94, i32 0, i64 0
  %96 = getelementptr inbounds [1 x i32]* %95, i32 0, i64 0
  %97 = load i32* %96, align 4
  %98 = load i32** getelementptr inbounds ([1 x [1 x i32*]]* @g_10, i32 0, i64 0, i64 0), align 8
  %99 = call i32* @func_4(i16 zeroext %91, i32 %97, i32* %98)
  store i32* %99, i32** getelementptr inbounds ([1 x [1 x i32*]]* @g_10, i32 0, i64 0, i64 0), align 8
  %100 = load i32* @g_3, align 4
  %101 = trunc i32 %100 to i8
  ret i8 %101
}

define i32* @func_4(i16 zeroext %p_5, i32 %p_6, i32* %p_7) nounwind uwtable {
  %1 = alloca i16, align 2
  %2 = alloca i32, align 4
  %3 = alloca i32*, align 8
  %l_8 = alloca i32*, align 8
  store i16 %p_5, i16* %1, align 2
  store i32 %p_6, i32* %2, align 4
  store i32* %p_7, i32** %3, align 8
  store i32* @g_3, i32** %l_8, align 8
  %4 = load i32** %l_8, align 8
  ret i32* %4
}

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  %4 = call signext i8 @func_1()
  %5 = load i32* @g_3, align 4
  %6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %5)
  %7 = load i32* %1
  ret i32 %7
}

declare i32 @printf(i8*, ...)
