; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith001951.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_4 = global i32 -1, align 4
@g_5 = global [4 x [2 x [4 x i32*]]] zeroinitializer, align 16
@.str = private unnamed_addr constant [19 x i8] c"checksum g_4 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable {
  %l_3 = alloca [1 x [3 x i32*]], align 16
  %l_2 = alloca [6 x [7 x [1 x [1 x [1 x [1 x i32**]]]]]], align 16
  %l_6 = alloca i64, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %l = alloca i32, align 4
  %m = alloca i32, align 4
  %n = alloca i32, align 4
  store i64 5152474960435308309, i64* %l_6, align 8
  store i32 0, i32* %i, align 4
  br label %1

; <label>:1                                       ; preds = %19, %0
  %2 = load i32* %i, align 4
  %3 = icmp slt i32 %2, 1
  br i1 %3, label %4, label %22

; <label>:4                                       ; preds = %1
  store i32 0, i32* %j, align 4
  br label %5

; <label>:5                                       ; preds = %15, %4
  %6 = load i32* %j, align 4
  %7 = icmp slt i32 %6, 3
  br i1 %7, label %8, label %18

; <label>:8                                       ; preds = %5
  %9 = load i32* %j, align 4
  %10 = sext i32 %9 to i64
  %11 = load i32* %i, align 4
  %12 = sext i32 %11 to i64
  %13 = getelementptr inbounds [1 x [3 x i32*]]* %l_3, i32 0, i64 %12
  %14 = getelementptr inbounds [3 x i32*]* %13, i32 0, i64 %10
  store i32* @g_4, i32** %14, align 8
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
  store i32 0, i32* %i, align 4
  br label %23

; <label>:23                                      ; preds = %87, %22
  %24 = load i32* %i, align 4
  %25 = icmp slt i32 %24, 6
  br i1 %25, label %26, label %90

; <label>:26                                      ; preds = %23
  store i32 0, i32* %j, align 4
  br label %27

; <label>:27                                      ; preds = %83, %26
  %28 = load i32* %j, align 4
  %29 = icmp slt i32 %28, 7
  br i1 %29, label %30, label %86

; <label>:30                                      ; preds = %27
  store i32 0, i32* %k, align 4
  br label %31

; <label>:31                                      ; preds = %79, %30
  %32 = load i32* %k, align 4
  %33 = icmp slt i32 %32, 1
  br i1 %33, label %34, label %82

; <label>:34                                      ; preds = %31
  store i32 0, i32* %l, align 4
  br label %35

; <label>:35                                      ; preds = %75, %34
  %36 = load i32* %l, align 4
  %37 = icmp slt i32 %36, 1
  br i1 %37, label %38, label %78

; <label>:38                                      ; preds = %35
  store i32 0, i32* %m, align 4
  br label %39

; <label>:39                                      ; preds = %71, %38
  %40 = load i32* %m, align 4
  %41 = icmp slt i32 %40, 1
  br i1 %41, label %42, label %74

; <label>:42                                      ; preds = %39
  store i32 0, i32* %n, align 4
  br label %43

; <label>:43                                      ; preds = %67, %42
  %44 = load i32* %n, align 4
  %45 = icmp slt i32 %44, 1
  br i1 %45, label %46, label %70

; <label>:46                                      ; preds = %43
  %47 = getelementptr inbounds [1 x [3 x i32*]]* %l_3, i32 0, i64 0
  %48 = getelementptr inbounds [3 x i32*]* %47, i32 0, i64 0
  %49 = load i32* %n, align 4
  %50 = sext i32 %49 to i64
  %51 = load i32* %m, align 4
  %52 = sext i32 %51 to i64
  %53 = load i32* %l, align 4
  %54 = sext i32 %53 to i64
  %55 = load i32* %k, align 4
  %56 = sext i32 %55 to i64
  %57 = load i32* %j, align 4
  %58 = sext i32 %57 to i64
  %59 = load i32* %i, align 4
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds [6 x [7 x [1 x [1 x [1 x [1 x i32**]]]]]]* %l_2, i32 0, i64 %60
  %62 = getelementptr inbounds [7 x [1 x [1 x [1 x [1 x i32**]]]]]* %61, i32 0, i64 %58
  %63 = getelementptr inbounds [1 x [1 x [1 x [1 x i32**]]]]* %62, i32 0, i64 %56
  %64 = getelementptr inbounds [1 x [1 x [1 x i32**]]]* %63, i32 0, i64 %54
  %65 = getelementptr inbounds [1 x [1 x i32**]]* %64, i32 0, i64 %52
  %66 = getelementptr inbounds [1 x i32**]* %65, i32 0, i64 %50
  store i32** %48, i32*** %66, align 8
  br label %67

; <label>:67                                      ; preds = %46
  %68 = load i32* %n, align 4
  %69 = add nsw i32 %68, 1
  store i32 %69, i32* %n, align 4
  br label %43

; <label>:70                                      ; preds = %43
  br label %71

; <label>:71                                      ; preds = %70
  %72 = load i32* %m, align 4
  %73 = add nsw i32 %72, 1
  store i32 %73, i32* %m, align 4
  br label %39

; <label>:74                                      ; preds = %39
  br label %75

; <label>:75                                      ; preds = %74
  %76 = load i32* %l, align 4
  %77 = add nsw i32 %76, 1
  store i32 %77, i32* %l, align 4
  br label %35

; <label>:78                                      ; preds = %35
  br label %79

; <label>:79                                      ; preds = %78
  %80 = load i32* %k, align 4
  %81 = add nsw i32 %80, 1
  store i32 %81, i32* %k, align 4
  br label %31

; <label>:82                                      ; preds = %31
  br label %83

; <label>:83                                      ; preds = %82
  %84 = load i32* %j, align 4
  %85 = add nsw i32 %84, 1
  store i32 %85, i32* %j, align 4
  br label %27

; <label>:86                                      ; preds = %27
  br label %87

; <label>:87                                      ; preds = %86
  %88 = load i32* %i, align 4
  %89 = add nsw i32 %88, 1
  store i32 %89, i32* %i, align 4
  br label %23

; <label>:90                                      ; preds = %23
  store volatile i32* null, i32** getelementptr inbounds ([4 x [2 x [4 x i32*]]]* @g_5, i32 0, i64 2, i64 1, i64 2), align 8
  %91 = load i64* %l_6, align 8
  %92 = trunc i64 %91 to i32
  ret i32 %92
}

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
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
