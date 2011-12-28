; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith001860.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_3 = global i32 1, align 4
@g_4 = global i32 1075400155, align 4
@g_5 = global i32 125972078, align 4
@g_6 = global i32 933865841, align 4
@.str = private unnamed_addr constant [19 x i8] c"checksum g_3 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [19 x i8] c"checksum g_4 = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [19 x i8] c"checksum g_5 = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [19 x i8] c"checksum g_6 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable {
  %l_2 = alloca [5 x [8 x [1 x [1 x i16]]]], align 16
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %l = alloca i32, align 4
  store i32 0, i32* %i, align 4
  br label %1

; <label>:1                                       ; preds = %41, %0
  %2 = load i32* %i, align 4
  %3 = icmp slt i32 %2, 5
  br i1 %3, label %4, label %44

; <label>:4                                       ; preds = %1
  store i32 0, i32* %j, align 4
  br label %5

; <label>:5                                       ; preds = %37, %4
  %6 = load i32* %j, align 4
  %7 = icmp slt i32 %6, 8
  br i1 %7, label %8, label %40

; <label>:8                                       ; preds = %5
  store i32 0, i32* %k, align 4
  br label %9

; <label>:9                                       ; preds = %33, %8
  %10 = load i32* %k, align 4
  %11 = icmp slt i32 %10, 1
  br i1 %11, label %12, label %36

; <label>:12                                      ; preds = %9
  store i32 0, i32* %l, align 4
  br label %13

; <label>:13                                      ; preds = %29, %12
  %14 = load i32* %l, align 4
  %15 = icmp slt i32 %14, 1
  br i1 %15, label %16, label %32

; <label>:16                                      ; preds = %13
  %17 = load i32* %l, align 4
  %18 = sext i32 %17 to i64
  %19 = load i32* %k, align 4
  %20 = sext i32 %19 to i64
  %21 = load i32* %j, align 4
  %22 = sext i32 %21 to i64
  %23 = load i32* %i, align 4
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds [5 x [8 x [1 x [1 x i16]]]]* %l_2, i32 0, i64 %24
  %26 = getelementptr inbounds [8 x [1 x [1 x i16]]]* %25, i32 0, i64 %22
  %27 = getelementptr inbounds [1 x [1 x i16]]* %26, i32 0, i64 %20
  %28 = getelementptr inbounds [1 x i16]* %27, i32 0, i64 %18
  store i16 2, i16* %28, align 2
  br label %29

; <label>:29                                      ; preds = %16
  %30 = load i32* %l, align 4
  %31 = add nsw i32 %30, 1
  store i32 %31, i32* %l, align 4
  br label %13

; <label>:32                                      ; preds = %13
  br label %33

; <label>:33                                      ; preds = %32
  %34 = load i32* %k, align 4
  %35 = add nsw i32 %34, 1
  store i32 %35, i32* %k, align 4
  br label %9

; <label>:36                                      ; preds = %9
  br label %37

; <label>:37                                      ; preds = %36
  %38 = load i32* %j, align 4
  %39 = add nsw i32 %38, 1
  store i32 %39, i32* %j, align 4
  br label %5

; <label>:40                                      ; preds = %5
  br label %41

; <label>:41                                      ; preds = %40
  %42 = load i32* %i, align 4
  %43 = add nsw i32 %42, 1
  store i32 %43, i32* %i, align 4
  br label %1

; <label>:44                                      ; preds = %1
  store i32 0, i32* @g_3, align 4
  br label %45

; <label>:45                                      ; preds = %85, %44
  %46 = load i32* @g_3, align 4
  %47 = icmp slt i32 %46, 5
  br i1 %47, label %48, label %88

; <label>:48                                      ; preds = %45
  store volatile i32 0, i32* @g_4, align 4
  br label %49

; <label>:49                                      ; preds = %81, %48
  %50 = load volatile i32* @g_4, align 4
  %51 = icmp slt i32 %50, 8
  br i1 %51, label %52, label %84

; <label>:52                                      ; preds = %49
  store volatile i32 0, i32* @g_5, align 4
  br label %53

; <label>:53                                      ; preds = %77, %52
  %54 = load volatile i32* @g_5, align 4
  %55 = icmp slt i32 %54, 1
  br i1 %55, label %56, label %80

; <label>:56                                      ; preds = %53
  store i32 0, i32* @g_6, align 4
  br label %57

; <label>:57                                      ; preds = %73, %56
  %58 = load i32* @g_6, align 4
  %59 = icmp slt i32 %58, 1
  br i1 %59, label %60, label %76

; <label>:60                                      ; preds = %57
  %61 = load i32* @g_6, align 4
  %62 = sext i32 %61 to i64
  %63 = load volatile i32* @g_5, align 4
  %64 = sext i32 %63 to i64
  %65 = load volatile i32* @g_4, align 4
  %66 = sext i32 %65 to i64
  %67 = load i32* @g_3, align 4
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds [5 x [8 x [1 x [1 x i16]]]]* %l_2, i32 0, i64 %68
  %70 = getelementptr inbounds [8 x [1 x [1 x i16]]]* %69, i32 0, i64 %66
  %71 = getelementptr inbounds [1 x [1 x i16]]* %70, i32 0, i64 %64
  %72 = getelementptr inbounds [1 x i16]* %71, i32 0, i64 %62
  store i16 1, i16* %72, align 2
  br label %73

; <label>:73                                      ; preds = %60
  %74 = load i32* @g_6, align 4
  %75 = add nsw i32 %74, 1
  store i32 %75, i32* @g_6, align 4
  br label %57

; <label>:76                                      ; preds = %57
  br label %77

; <label>:77                                      ; preds = %76
  %78 = load volatile i32* @g_5, align 4
  %79 = add nsw i32 %78, 1
  store volatile i32 %79, i32* @g_5, align 4
  br label %53

; <label>:80                                      ; preds = %53
  br label %81

; <label>:81                                      ; preds = %80
  %82 = load volatile i32* @g_4, align 4
  %83 = add nsw i32 %82, 1
  store volatile i32 %83, i32* @g_4, align 4
  br label %49

; <label>:84                                      ; preds = %49
  br label %85

; <label>:85                                      ; preds = %84
  %86 = load i32* @g_3, align 4
  %87 = add nsw i32 %86, 1
  store i32 %87, i32* @g_3, align 4
  br label %45

; <label>:88                                      ; preds = %45
  %89 = getelementptr inbounds [5 x [8 x [1 x [1 x i16]]]]* %l_2, i32 0, i64 2
  %90 = getelementptr inbounds [8 x [1 x [1 x i16]]]* %89, i32 0, i64 4
  %91 = getelementptr inbounds [1 x [1 x i16]]* %90, i32 0, i64 0
  %92 = getelementptr inbounds [1 x i16]* %91, i32 0, i64 0
  %93 = load i16* %92, align 2
  %94 = sext i16 %93 to i32
  ret i32 %94
}

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  %4 = call i32 @func_1()
  %5 = load i32* @g_3, align 4
  %6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %5)
  %7 = load volatile i32* @g_4, align 4
  %8 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str1, i32 0, i32 0), i32 %7)
  %9 = load volatile i32* @g_5, align 4
  %10 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str2, i32 0, i32 0), i32 %9)
  %11 = load i32* @g_6, align 4
  %12 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str3, i32 0, i32 0), i32 %11)
  %13 = load i32* %1
  ret i32 %13
}

declare i32 @printf(i8*, ...)
