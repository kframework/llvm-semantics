; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith000602.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = global i16 -19514, align 2
@g_4 = global i32 -1311847611, align 4
@g_3 = constant [3 x i32*] [i32* @g_4, i32* @g_4, i32* @g_4], align 16
@g_5 = global i32* null, align 8
@g_6 = global i32* null, align 8
@g_12 = global [8 x i32] [i32 1687928846, i32 1687928846, i32 1687928846, i32 1687928846, i32 1687928846, i32 1687928846, i32 1687928846, i32 1687928846], align 16
@.str = private unnamed_addr constant [19 x i8] c"checksum g_2 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [19 x i8] c"checksum g_4 = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [23 x i8] c"checksum g_12[0] = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [23 x i8] c"checksum g_12[1] = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [23 x i8] c"checksum g_12[2] = %d\0A\00", align 1
@.str5 = private unnamed_addr constant [23 x i8] c"checksum g_12[3] = %d\0A\00", align 1
@.str6 = private unnamed_addr constant [23 x i8] c"checksum g_12[4] = %d\0A\00", align 1
@.str7 = private unnamed_addr constant [23 x i8] c"checksum g_12[5] = %d\0A\00", align 1
@.str8 = private unnamed_addr constant [23 x i8] c"checksum g_12[6] = %d\0A\00", align 1
@.str9 = private unnamed_addr constant [23 x i8] c"checksum g_12[7] = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i64 @func_1() nounwind uwtable {
  %l_7 = alloca [2 x [6 x [1 x i32*]]], align 16
  %l_8 = alloca [5 x [4 x [1 x i8]]], align 16
  %l_10 = alloca i32*, align 8
  %l_9 = alloca [5 x i32**], align 16
  %l_11 = alloca [1 x [1 x [2 x i32*]]], align 16
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  store i32* null, i32** %l_10, align 8
  store i32 0, i32* %i, align 4
  br label %1

; <label>:1                                       ; preds = %30, %0
  %2 = load i32* %i, align 4
  %3 = icmp slt i32 %2, 2
  br i1 %3, label %4, label %33

; <label>:4                                       ; preds = %1
  store i32 0, i32* %j, align 4
  br label %5

; <label>:5                                       ; preds = %26, %4
  %6 = load i32* %j, align 4
  %7 = icmp slt i32 %6, 6
  br i1 %7, label %8, label %29

; <label>:8                                       ; preds = %5
  store i32 0, i32* %k, align 4
  br label %9

; <label>:9                                       ; preds = %22, %8
  %10 = load i32* %k, align 4
  %11 = icmp slt i32 %10, 1
  br i1 %11, label %12, label %25

; <label>:12                                      ; preds = %9
  %13 = load i32* %k, align 4
  %14 = sext i32 %13 to i64
  %15 = load i32* %j, align 4
  %16 = sext i32 %15 to i64
  %17 = load i32* %i, align 4
  %18 = sext i32 %17 to i64
  %19 = getelementptr inbounds [2 x [6 x [1 x i32*]]]* %l_7, i32 0, i64 %18
  %20 = getelementptr inbounds [6 x [1 x i32*]]* %19, i32 0, i64 %16
  %21 = getelementptr inbounds [1 x i32*]* %20, i32 0, i64 %14
  store i32* @g_4, i32** %21, align 8
  br label %22

; <label>:22                                      ; preds = %12
  %23 = load i32* %k, align 4
  %24 = add nsw i32 %23, 1
  store i32 %24, i32* %k, align 4
  br label %9

; <label>:25                                      ; preds = %9
  br label %26

; <label>:26                                      ; preds = %25
  %27 = load i32* %j, align 4
  %28 = add nsw i32 %27, 1
  store i32 %28, i32* %j, align 4
  br label %5

; <label>:29                                      ; preds = %5
  br label %30

; <label>:30                                      ; preds = %29
  %31 = load i32* %i, align 4
  %32 = add nsw i32 %31, 1
  store i32 %32, i32* %i, align 4
  br label %1

; <label>:33                                      ; preds = %1
  store i32 0, i32* %i, align 4
  br label %34

; <label>:34                                      ; preds = %63, %33
  %35 = load i32* %i, align 4
  %36 = icmp slt i32 %35, 5
  br i1 %36, label %37, label %66

; <label>:37                                      ; preds = %34
  store i32 0, i32* %j, align 4
  br label %38

; <label>:38                                      ; preds = %59, %37
  %39 = load i32* %j, align 4
  %40 = icmp slt i32 %39, 4
  br i1 %40, label %41, label %62

; <label>:41                                      ; preds = %38
  store i32 0, i32* %k, align 4
  br label %42

; <label>:42                                      ; preds = %55, %41
  %43 = load i32* %k, align 4
  %44 = icmp slt i32 %43, 1
  br i1 %44, label %45, label %58

; <label>:45                                      ; preds = %42
  %46 = load i32* %k, align 4
  %47 = sext i32 %46 to i64
  %48 = load i32* %j, align 4
  %49 = sext i32 %48 to i64
  %50 = load i32* %i, align 4
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds [5 x [4 x [1 x i8]]]* %l_8, i32 0, i64 %51
  %53 = getelementptr inbounds [4 x [1 x i8]]* %52, i32 0, i64 %49
  %54 = getelementptr inbounds [1 x i8]* %53, i32 0, i64 %47
  store volatile i8 -42, i8* %54, align 1
  br label %55

; <label>:55                                      ; preds = %45
  %56 = load i32* %k, align 4
  %57 = add nsw i32 %56, 1
  store i32 %57, i32* %k, align 4
  br label %42

; <label>:58                                      ; preds = %42
  br label %59

; <label>:59                                      ; preds = %58
  %60 = load i32* %j, align 4
  %61 = add nsw i32 %60, 1
  store i32 %61, i32* %j, align 4
  br label %38

; <label>:62                                      ; preds = %38
  br label %63

; <label>:63                                      ; preds = %62
  %64 = load i32* %i, align 4
  %65 = add nsw i32 %64, 1
  store i32 %65, i32* %i, align 4
  br label %34

; <label>:66                                      ; preds = %34
  store i32 0, i32* %i, align 4
  br label %67

; <label>:67                                      ; preds = %74, %66
  %68 = load i32* %i, align 4
  %69 = icmp slt i32 %68, 5
  br i1 %69, label %70, label %77

; <label>:70                                      ; preds = %67
  %71 = load i32* %i, align 4
  %72 = sext i32 %71 to i64
  %73 = getelementptr inbounds [5 x i32**]* %l_9, i32 0, i64 %72
  store i32** %l_10, i32*** %73, align 8
  br label %74

; <label>:74                                      ; preds = %70
  %75 = load i32* %i, align 4
  %76 = add nsw i32 %75, 1
  store i32 %76, i32* %i, align 4
  br label %67

; <label>:77                                      ; preds = %67
  store i32 0, i32* %i, align 4
  br label %78

; <label>:78                                      ; preds = %107, %77
  %79 = load i32* %i, align 4
  %80 = icmp slt i32 %79, 1
  br i1 %80, label %81, label %110

; <label>:81                                      ; preds = %78
  store i32 0, i32* %j, align 4
  br label %82

; <label>:82                                      ; preds = %103, %81
  %83 = load i32* %j, align 4
  %84 = icmp slt i32 %83, 1
  br i1 %84, label %85, label %106

; <label>:85                                      ; preds = %82
  store i32 0, i32* %k, align 4
  br label %86

; <label>:86                                      ; preds = %99, %85
  %87 = load i32* %k, align 4
  %88 = icmp slt i32 %87, 2
  br i1 %88, label %89, label %102

; <label>:89                                      ; preds = %86
  %90 = load i32* %k, align 4
  %91 = sext i32 %90 to i64
  %92 = load i32* %j, align 4
  %93 = sext i32 %92 to i64
  %94 = load i32* %i, align 4
  %95 = sext i32 %94 to i64
  %96 = getelementptr inbounds [1 x [1 x [2 x i32*]]]* %l_11, i32 0, i64 %95
  %97 = getelementptr inbounds [1 x [2 x i32*]]* %96, i32 0, i64 %93
  %98 = getelementptr inbounds [2 x i32*]* %97, i32 0, i64 %91
  store i32* getelementptr inbounds ([8 x i32]* @g_12, i32 0, i64 5), i32** %98, align 8
  br label %99

; <label>:99                                      ; preds = %89
  %100 = load i32* %k, align 4
  %101 = add nsw i32 %100, 1
  store i32 %101, i32* %k, align 4
  br label %86

; <label>:102                                     ; preds = %86
  br label %103

; <label>:103                                     ; preds = %102
  %104 = load i32* %j, align 4
  %105 = add nsw i32 %104, 1
  store i32 %105, i32* %j, align 4
  br label %82

; <label>:106                                     ; preds = %82
  br label %107

; <label>:107                                     ; preds = %106
  %108 = load i32* %i, align 4
  %109 = add nsw i32 %108, 1
  store i32 %109, i32* %i, align 4
  br label %78

; <label>:110                                     ; preds = %78
  %111 = load volatile i16* @g_2, align 2
  %112 = trunc i16 %111 to i8
  %113 = getelementptr inbounds [5 x [4 x [1 x i8]]]* %l_8, i32 0, i64 3
  %114 = getelementptr inbounds [4 x [1 x i8]]* %113, i32 0, i64 2
  %115 = getelementptr inbounds [1 x i8]* %114, i32 0, i64 0
  store volatile i8 %112, i8* %115, align 1
  %116 = getelementptr inbounds [1 x [1 x [2 x i32*]]]* %l_11, i32 0, i64 0
  %117 = getelementptr inbounds [1 x [2 x i32*]]* %116, i32 0, i64 0
  %118 = getelementptr inbounds [2 x i32*]* %117, i32 0, i64 0
  store i32* null, i32** %118, align 8
  %119 = load volatile i16* @g_2, align 2
  %120 = sext i16 %119 to i64
  ret i64 %120
}

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  %i = alloca i32, align 4
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  %4 = call i64 @func_1()
  %5 = load volatile i16* @g_2, align 2
  %6 = sext i16 %5 to i32
  %7 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %6)
  %8 = load volatile i32* @g_4, align 4
  %9 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str1, i32 0, i32 0), i32 %8)
  %10 = load i32* getelementptr inbounds ([8 x i32]* @g_12, i32 0, i64 0), align 4
  %11 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str2, i32 0, i32 0), i32 %10)
  %12 = load i32* getelementptr inbounds ([8 x i32]* @g_12, i32 0, i64 1), align 4
  %13 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str3, i32 0, i32 0), i32 %12)
  %14 = load i32* getelementptr inbounds ([8 x i32]* @g_12, i32 0, i64 2), align 4
  %15 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str4, i32 0, i32 0), i32 %14)
  %16 = load i32* getelementptr inbounds ([8 x i32]* @g_12, i32 0, i64 3), align 4
  %17 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str5, i32 0, i32 0), i32 %16)
  %18 = load i32* getelementptr inbounds ([8 x i32]* @g_12, i32 0, i64 4), align 4
  %19 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str6, i32 0, i32 0), i32 %18)
  %20 = load i32* getelementptr inbounds ([8 x i32]* @g_12, i32 0, i64 5), align 4
  %21 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str7, i32 0, i32 0), i32 %20)
  %22 = load i32* getelementptr inbounds ([8 x i32]* @g_12, i32 0, i64 6), align 4
  %23 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str8, i32 0, i32 0), i32 %22)
  %24 = load i32* getelementptr inbounds ([8 x i32]* @g_12, i32 0, i64 7), align 4
  %25 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str9, i32 0, i32 0), i32 %24)
  %26 = load i32* getelementptr inbounds ([8 x i32]* @g_12, i32 0, i64 5), align 4
  %27 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str7, i32 0, i32 0), i32 %26)
  %28 = load i32* %1
  ret i32 %28
}

declare i32 @printf(i8*, ...)
