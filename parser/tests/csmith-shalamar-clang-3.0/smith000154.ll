; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith000154.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_3 = global i32 -1646701846, align 4
@g_4 = global i32 1179588335, align 4
@g_5 = global i32 -7, align 4
@.str = private unnamed_addr constant [19 x i8] c"checksum g_3 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [19 x i8] c"checksum g_4 = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [19 x i8] c"checksum g_5 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i64 @func_1() nounwind uwtable {
  %1 = alloca i64, align 8
  %l_2 = alloca [1 x [5 x [6 x i32]]], align 16
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  store i32 0, i32* %i, align 4
  br label %2

; <label>:2                                       ; preds = %31, %0
  %3 = load i32* %i, align 4
  %4 = icmp slt i32 %3, 1
  br i1 %4, label %5, label %34

; <label>:5                                       ; preds = %2
  store i32 0, i32* %j, align 4
  br label %6

; <label>:6                                       ; preds = %27, %5
  %7 = load i32* %j, align 4
  %8 = icmp slt i32 %7, 5
  br i1 %8, label %9, label %30

; <label>:9                                       ; preds = %6
  store i32 0, i32* %k, align 4
  br label %10

; <label>:10                                      ; preds = %23, %9
  %11 = load i32* %k, align 4
  %12 = icmp slt i32 %11, 6
  br i1 %12, label %13, label %26

; <label>:13                                      ; preds = %10
  %14 = load i32* %k, align 4
  %15 = sext i32 %14 to i64
  %16 = load i32* %j, align 4
  %17 = sext i32 %16 to i64
  %18 = load i32* %i, align 4
  %19 = sext i32 %18 to i64
  %20 = getelementptr inbounds [1 x [5 x [6 x i32]]]* %l_2, i32 0, i64 %19
  %21 = getelementptr inbounds [5 x [6 x i32]]* %20, i32 0, i64 %17
  %22 = getelementptr inbounds [6 x i32]* %21, i32 0, i64 %15
  store i32 864301126, i32* %22, align 4
  br label %23

; <label>:23                                      ; preds = %13
  %24 = load i32* %k, align 4
  %25 = add nsw i32 %24, 1
  store i32 %25, i32* %k, align 4
  br label %10

; <label>:26                                      ; preds = %10
  br label %27

; <label>:27                                      ; preds = %26
  %28 = load i32* %j, align 4
  %29 = add nsw i32 %28, 1
  store i32 %29, i32* %j, align 4
  br label %6

; <label>:30                                      ; preds = %6
  br label %31

; <label>:31                                      ; preds = %30
  %32 = load i32* %i, align 4
  %33 = add nsw i32 %32, 1
  store i32 %33, i32* %i, align 4
  br label %2

; <label>:34                                      ; preds = %2
  store volatile i32 0, i32* @g_3, align 4
  br label %35

; <label>:35                                      ; preds = %57, %34
  %36 = load volatile i32* @g_3, align 4
  %37 = icmp slt i32 %36, 1
  br i1 %37, label %38, label %60

; <label>:38                                      ; preds = %35
  store volatile i32 2, i32* @g_4, align 4
  br label %39

; <label>:39                                      ; preds = %53, %38
  %40 = load volatile i32* @g_4, align 4
  %41 = icmp slt i32 %40, 5
  br i1 %41, label %42, label %56

; <label>:42                                      ; preds = %39
  store volatile i32 5, i32* @g_5, align 4
  br label %43

; <label>:43                                      ; preds = %49, %42
  %44 = load volatile i32* @g_5, align 4
  %45 = icmp sge i32 %44, 0
  br i1 %45, label %46, label %52

; <label>:46                                      ; preds = %43
  %47 = load volatile i32* @g_3, align 4
  %48 = sext i32 %47 to i64
  store i64 %48, i64* %1
  br label %63
                                                  ; No predecessors!
  %50 = load volatile i32* @g_5, align 4
  %51 = add nsw i32 %50, -1
  store volatile i32 %51, i32* @g_5, align 4
  br label %43

; <label>:52                                      ; preds = %43
  br label %53

; <label>:53                                      ; preds = %52
  %54 = load volatile i32* @g_4, align 4
  %55 = add nsw i32 %54, 5
  store volatile i32 %55, i32* @g_4, align 4
  br label %39

; <label>:56                                      ; preds = %39
  br label %57

; <label>:57                                      ; preds = %56
  %58 = load volatile i32* @g_3, align 4
  %59 = add nsw i32 %58, 1
  store volatile i32 %59, i32* @g_3, align 4
  br label %35

; <label>:60                                      ; preds = %35
  %61 = load volatile i32* @g_4, align 4
  %62 = sext i32 %61 to i64
  store i64 %62, i64* %1
  br label %63

; <label>:63                                      ; preds = %60, %46
  %64 = load i64* %1
  ret i64 %64
}

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  %4 = call i64 @func_1()
  %5 = load volatile i32* @g_3, align 4
  %6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %5)
  %7 = load volatile i32* @g_4, align 4
  %8 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str1, i32 0, i32 0), i32 %7)
  %9 = load volatile i32* @g_5, align 4
  %10 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str2, i32 0, i32 0), i32 %9)
  %11 = load i32* %1
  ret i32 %11
}

declare i32 @printf(i8*, ...)
