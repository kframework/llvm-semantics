; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith001824.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_3 = global i32 174214363, align 4
@g_4 = global i32 8, align 4
@g_5 = global [9 x i32] zeroinitializer, align 16
@.str = private unnamed_addr constant [19 x i8] c"checksum g_3 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [19 x i8] c"checksum g_4 = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [22 x i8] c"checksum g_5[0] = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [22 x i8] c"checksum g_5[1] = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [22 x i8] c"checksum g_5[2] = %d\0A\00", align 1
@.str5 = private unnamed_addr constant [22 x i8] c"checksum g_5[3] = %d\0A\00", align 1
@.str6 = private unnamed_addr constant [22 x i8] c"checksum g_5[4] = %d\0A\00", align 1
@.str7 = private unnamed_addr constant [22 x i8] c"checksum g_5[5] = %d\0A\00", align 1
@.str8 = private unnamed_addr constant [22 x i8] c"checksum g_5[6] = %d\0A\00", align 1
@.str9 = private unnamed_addr constant [22 x i8] c"checksum g_5[7] = %d\0A\00", align 1
@.str10 = private unnamed_addr constant [22 x i8] c"checksum g_5[8] = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable {
  %l_2 = alloca [7 x [6 x [1 x i16]]], align 16
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  store i32 0, i32* %i, align 4
  br label %1

; <label>:1                                       ; preds = %30, %0
  %2 = load i32* %i, align 4
  %3 = icmp slt i32 %2, 7
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
  %19 = getelementptr inbounds [7 x [6 x [1 x i16]]]* %l_2, i32 0, i64 %18
  %20 = getelementptr inbounds [6 x [1 x i16]]* %19, i32 0, i64 %16
  %21 = getelementptr inbounds [1 x i16]* %20, i32 0, i64 %14
  store i16 -7898, i16* %21, align 2
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
  store volatile i32 0, i32* @g_3, align 4
  br label %34

; <label>:34                                      ; preds = %63, %33
  %35 = load volatile i32* @g_3, align 4
  %36 = icmp slt i32 %35, 7
  br i1 %36, label %37, label %66

; <label>:37                                      ; preds = %34
  store i32 0, i32* @g_4, align 4
  br label %38

; <label>:38                                      ; preds = %59, %37
  %39 = load i32* @g_4, align 4
  %40 = icmp slt i32 %39, 6
  br i1 %40, label %41, label %62

; <label>:41                                      ; preds = %38
  store volatile i32 0, i32* getelementptr inbounds ([9 x i32]* @g_5, i32 0, i64 7), align 4
  br label %42

; <label>:42                                      ; preds = %55, %41
  %43 = load volatile i32* getelementptr inbounds ([9 x i32]* @g_5, i32 0, i64 7), align 4
  %44 = icmp slt i32 %43, 1
  br i1 %44, label %45, label %58

; <label>:45                                      ; preds = %42
  %46 = load volatile i32* getelementptr inbounds ([9 x i32]* @g_5, i32 0, i64 7), align 4
  %47 = sext i32 %46 to i64
  %48 = load i32* @g_4, align 4
  %49 = sext i32 %48 to i64
  %50 = load volatile i32* @g_3, align 4
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds [7 x [6 x [1 x i16]]]* %l_2, i32 0, i64 %51
  %53 = getelementptr inbounds [6 x [1 x i16]]* %52, i32 0, i64 %49
  %54 = getelementptr inbounds [1 x i16]* %53, i32 0, i64 %47
  store i16 8670, i16* %54, align 2
  br label %55

; <label>:55                                      ; preds = %45
  %56 = load volatile i32* getelementptr inbounds ([9 x i32]* @g_5, i32 0, i64 7), align 4
  %57 = add nsw i32 %56, 1
  store volatile i32 %57, i32* getelementptr inbounds ([9 x i32]* @g_5, i32 0, i64 7), align 4
  br label %42

; <label>:58                                      ; preds = %42
  br label %59

; <label>:59                                      ; preds = %58
  %60 = load i32* @g_4, align 4
  %61 = add nsw i32 %60, 1
  store i32 %61, i32* @g_4, align 4
  br label %38

; <label>:62                                      ; preds = %38
  br label %63

; <label>:63                                      ; preds = %62
  %64 = load volatile i32* @g_3, align 4
  %65 = add nsw i32 %64, 1
  store volatile i32 %65, i32* @g_3, align 4
  br label %34

; <label>:66                                      ; preds = %34
  %67 = getelementptr inbounds [7 x [6 x [1 x i16]]]* %l_2, i32 0, i64 1
  %68 = getelementptr inbounds [6 x [1 x i16]]* %67, i32 0, i64 4
  %69 = getelementptr inbounds [1 x i16]* %68, i32 0, i64 0
  %70 = load i16* %69, align 2
  %71 = zext i16 %70 to i32
  ret i32 %71
}

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  %i = alloca i32, align 4
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  %4 = call i32 @func_1()
  %5 = load volatile i32* @g_3, align 4
  %6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %5)
  %7 = load i32* @g_4, align 4
  %8 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str1, i32 0, i32 0), i32 %7)
  %9 = load volatile i32* getelementptr inbounds ([9 x i32]* @g_5, i32 0, i64 0), align 4
  %10 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str2, i32 0, i32 0), i32 %9)
  %11 = load volatile i32* getelementptr inbounds ([9 x i32]* @g_5, i32 0, i64 1), align 4
  %12 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str3, i32 0, i32 0), i32 %11)
  %13 = load volatile i32* getelementptr inbounds ([9 x i32]* @g_5, i32 0, i64 2), align 4
  %14 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str4, i32 0, i32 0), i32 %13)
  %15 = load volatile i32* getelementptr inbounds ([9 x i32]* @g_5, i32 0, i64 3), align 4
  %16 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str5, i32 0, i32 0), i32 %15)
  %17 = load volatile i32* getelementptr inbounds ([9 x i32]* @g_5, i32 0, i64 4), align 4
  %18 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str6, i32 0, i32 0), i32 %17)
  %19 = load volatile i32* getelementptr inbounds ([9 x i32]* @g_5, i32 0, i64 5), align 4
  %20 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str7, i32 0, i32 0), i32 %19)
  %21 = load volatile i32* getelementptr inbounds ([9 x i32]* @g_5, i32 0, i64 6), align 4
  %22 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str8, i32 0, i32 0), i32 %21)
  %23 = load volatile i32* getelementptr inbounds ([9 x i32]* @g_5, i32 0, i64 7), align 4
  %24 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str9, i32 0, i32 0), i32 %23)
  %25 = load volatile i32* getelementptr inbounds ([9 x i32]* @g_5, i32 0, i64 8), align 4
  %26 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str10, i32 0, i32 0), i32 %25)
  %27 = load volatile i32* getelementptr inbounds ([9 x i32]* @g_5, i32 0, i64 7), align 4
  %28 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str9, i32 0, i32 0), i32 %27)
  %29 = load i32* %1
  ret i32 %29
}

declare i32 @printf(i8*, ...)
