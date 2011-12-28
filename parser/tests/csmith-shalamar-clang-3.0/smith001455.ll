; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith001455.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_3 = global [1 x [2 x i32]] [[2 x i32] [i32 2089446293, i32 2089446293]], align 4
@g_4 = global i32 6, align 4
@g_5 = global i32 164374010, align 4
@g_6 = global i32 9, align 4
@.str = private unnamed_addr constant [25 x i8] c"checksum g_3[0][0] = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [25 x i8] c"checksum g_3[0][1] = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [19 x i8] c"checksum g_4 = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [19 x i8] c"checksum g_5 = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [19 x i8] c"checksum g_6 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i64 @func_1() nounwind uwtable {
  %1 = alloca i64, align 8
  %l_2 = alloca [6 x [5 x [1 x [1 x i64]]]], align 16
  %l_7 = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %l = alloca i32, align 4
  store i32 -1139773754, i32* %l_7, align 4
  store i32 0, i32* %i, align 4
  br label %2

; <label>:2                                       ; preds = %42, %0
  %3 = load i32* %i, align 4
  %4 = icmp slt i32 %3, 6
  br i1 %4, label %5, label %45

; <label>:5                                       ; preds = %2
  store i32 0, i32* %j, align 4
  br label %6

; <label>:6                                       ; preds = %38, %5
  %7 = load i32* %j, align 4
  %8 = icmp slt i32 %7, 5
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
  %16 = icmp slt i32 %15, 1
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
  %26 = getelementptr inbounds [6 x [5 x [1 x [1 x i64]]]]* %l_2, i32 0, i64 %25
  %27 = getelementptr inbounds [5 x [1 x [1 x i64]]]* %26, i32 0, i64 %23
  %28 = getelementptr inbounds [1 x [1 x i64]]* %27, i32 0, i64 %21
  %29 = getelementptr inbounds [1 x i64]* %28, i32 0, i64 %19
  store i64 1, i64* %29, align 8
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
  store volatile i32 4, i32* getelementptr inbounds ([1 x [2 x i32]]* @g_3, i32 0, i64 0, i64 1), align 4
  br label %46

; <label>:46                                      ; preds = %79, %45
  %47 = load volatile i32* getelementptr inbounds ([1 x [2 x i32]]* @g_3, i32 0, i64 0, i64 1), align 4
  %48 = icmp sge i32 %47, 0
  br i1 %48, label %49, label %82

; <label>:49                                      ; preds = %46
  store volatile i32 0, i32* @g_4, align 4
  br label %50

; <label>:50                                      ; preds = %75, %49
  %51 = load volatile i32* @g_4, align 4
  %52 = icmp slt i32 %51, 5
  br i1 %52, label %53, label %78

; <label>:53                                      ; preds = %50
  store volatile i32 0, i32* @g_5, align 4
  br label %54

; <label>:54                                      ; preds = %71, %53
  %55 = load volatile i32* @g_5, align 4
  %56 = icmp slt i32 %55, 1
  br i1 %56, label %57, label %74

; <label>:57                                      ; preds = %54
  store volatile i32 0, i32* @g_6, align 4
  br label %58

; <label>:58                                      ; preds = %67, %57
  %59 = load volatile i32* @g_6, align 4
  %60 = icmp slt i32 %59, 1
  br i1 %60, label %61, label %70

; <label>:61                                      ; preds = %58
  %62 = getelementptr inbounds [6 x [5 x [1 x [1 x i64]]]]* %l_2, i32 0, i64 5
  %63 = getelementptr inbounds [5 x [1 x [1 x i64]]]* %62, i32 0, i64 2
  %64 = getelementptr inbounds [1 x [1 x i64]]* %63, i32 0, i64 0
  %65 = getelementptr inbounds [1 x i64]* %64, i32 0, i64 0
  %66 = load i64* %65, align 8
  store i64 %66, i64* %1
  br label %83
                                                  ; No predecessors!
  %68 = load volatile i32* @g_6, align 4
  %69 = add nsw i32 %68, 1
  store volatile i32 %69, i32* @g_6, align 4
  br label %58

; <label>:70                                      ; preds = %58
  br label %71

; <label>:71                                      ; preds = %70
  %72 = load volatile i32* @g_5, align 4
  %73 = add nsw i32 %72, 1
  store volatile i32 %73, i32* @g_5, align 4
  br label %54

; <label>:74                                      ; preds = %54
  br label %75

; <label>:75                                      ; preds = %74
  %76 = load volatile i32* @g_4, align 4
  %77 = add nsw i32 %76, 2
  store volatile i32 %77, i32* @g_4, align 4
  br label %50

; <label>:78                                      ; preds = %50
  br label %79

; <label>:79                                      ; preds = %78
  %80 = load volatile i32* getelementptr inbounds ([1 x [2 x i32]]* @g_3, i32 0, i64 0, i64 1), align 4
  %81 = add nsw i32 %80, -4
  store volatile i32 %81, i32* getelementptr inbounds ([1 x [2 x i32]]* @g_3, i32 0, i64 0, i64 1), align 4
  br label %46

; <label>:82                                      ; preds = %46
  store i64 -1139773754, i64* %1
  br label %83

; <label>:83                                      ; preds = %82, %61
  %84 = load i64* %1
  ret i64 %84
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
  %4 = call i64 @func_1()
  %5 = load volatile i32* getelementptr inbounds ([1 x [2 x i32]]* @g_3, i32 0, i64 0, i64 0), align 4
  %6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str, i32 0, i32 0), i32 %5)
  %7 = load volatile i32* getelementptr inbounds ([1 x [2 x i32]]* @g_3, i32 0, i64 0, i64 1), align 4
  %8 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str1, i32 0, i32 0), i32 %7)
  %9 = load volatile i32* getelementptr inbounds ([1 x [2 x i32]]* @g_3, i32 0, i64 0, i64 1), align 4
  %10 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str1, i32 0, i32 0), i32 %9)
  %11 = load volatile i32* @g_4, align 4
  %12 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str2, i32 0, i32 0), i32 %11)
  %13 = load volatile i32* @g_5, align 4
  %14 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str3, i32 0, i32 0), i32 %13)
  %15 = load volatile i32* @g_6, align 4
  %16 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str4, i32 0, i32 0), i32 %15)
  %17 = load i32* %1
  ret i32 %17
}

declare i32 @printf(i8*, ...)
