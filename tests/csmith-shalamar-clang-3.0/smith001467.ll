; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith001467.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_4 = global i32 5, align 4
@g_6 = global i32 3, align 4
@g_8 = global i8 118, align 1
@.str = private unnamed_addr constant [19 x i8] c"checksum g_4 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [19 x i8] c"checksum g_6 = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [19 x i8] c"checksum g_8 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define signext i16 @func_1() nounwind uwtable {
  %1 = alloca i16, align 2
  %l_2 = alloca i8, align 1
  %l_7 = alloca i32*, align 8
  %l_3 = alloca [7 x i32], align 16
  %i = alloca i32, align 4
  %l_5 = alloca i32*, align 8
  store i8 -35, i8* %l_2, align 1
  store i32* null, i32** %l_7, align 8
  %2 = load i8* %l_2, align 1
  %3 = icmp ne i8 %2, 0
  br i1 %3, label %4, label %7

; <label>:4                                       ; preds = %0
  %5 = load i8* %l_2, align 1
  %6 = sext i8 %5 to i16
  store i16 %6, i16* %1
  br label %61

; <label>:7                                       ; preds = %0
  store i32 0, i32* %i, align 4
  br label %8

; <label>:8                                       ; preds = %15, %7
  %9 = load i32* %i, align 4
  %10 = icmp slt i32 %9, 7
  br i1 %10, label %11, label %18

; <label>:11                                      ; preds = %8
  %12 = load i32* %i, align 4
  %13 = sext i32 %12 to i64
  %14 = getelementptr inbounds [7 x i32]* %l_3, i32 0, i64 %13
  store i32 5, i32* %14, align 4
  br label %15

; <label>:15                                      ; preds = %11
  %16 = load i32* %i, align 4
  %17 = add nsw i32 %16, 1
  store i32 %17, i32* %i, align 4
  br label %8

; <label>:18                                      ; preds = %8
  store i8 0, i8* %l_2, align 1
  br label %19

; <label>:19                                      ; preds = %27, %18
  %20 = load i8* %l_2, align 1
  %21 = sext i8 %20 to i32
  %22 = icmp slt i32 %21, 7
  br i1 %22, label %23, label %32

; <label>:23                                      ; preds = %19
  %24 = load i8* %l_2, align 1
  %25 = sext i8 %24 to i64
  %26 = getelementptr inbounds [7 x i32]* %l_3, i32 0, i64 %25
  store i32 1, i32* %26, align 4
  br label %27

; <label>:27                                      ; preds = %23
  %28 = load i8* %l_2, align 1
  %29 = sext i8 %28 to i32
  %30 = add nsw i32 %29, 1
  %31 = trunc i32 %30 to i8
  store i8 %31, i8* %l_2, align 1
  br label %19

; <label>:32                                      ; preds = %19
  store i8 6, i8* %l_2, align 1
  br label %33

; <label>:33                                      ; preds = %52, %32
  %34 = load i8* %l_2, align 1
  %35 = sext i8 %34 to i32
  %36 = icmp sge i32 %35, 0
  br i1 %36, label %37, label %57

; <label>:37                                      ; preds = %33
  store i32* @g_6, i32** %l_5, align 8
  %38 = load i32* @g_4, align 4
  %39 = load i32** %l_5, align 8
  %40 = load i32* %39
  %41 = xor i32 %40, %38
  store i32 %41, i32* %39
  %42 = load i32** %l_7, align 8
  %43 = icmp eq i32* %42, null
  %44 = zext i1 %43 to i32
  %45 = load i32** %l_5, align 8
  store i32 %44, i32* %45
  %46 = load i32* @g_4, align 4
  %47 = icmp ne i32 %46, 0
  br i1 %47, label %48, label %49

; <label>:48                                      ; preds = %37
  br label %57

; <label>:49                                      ; preds = %37
  %50 = load i8* @g_8, align 1
  %51 = zext i8 %50 to i16
  store i16 %51, i16* %1
  br label %61
                                                  ; No predecessors!
  %53 = load i8* %l_2, align 1
  %54 = sext i8 %53 to i32
  %55 = add nsw i32 %54, -5
  %56 = trunc i32 %55 to i8
  store i8 %56, i8* %l_2, align 1
  br label %33

; <label>:57                                      ; preds = %48, %33
  br label %58

; <label>:58                                      ; preds = %57
  %59 = load i8* @g_8, align 1
  %60 = zext i8 %59 to i16
  store i16 %60, i16* %1
  br label %61

; <label>:61                                      ; preds = %58, %49, %4
  %62 = load i16* %1
  ret i16 %62
}

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  %4 = call signext i16 @func_1()
  %5 = load i32* @g_4, align 4
  %6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %5)
  %7 = load i32* @g_6, align 4
  %8 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str1, i32 0, i32 0), i32 %7)
  %9 = load i8* @g_8, align 1
  %10 = zext i8 %9 to i32
  %11 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str2, i32 0, i32 0), i32 %10)
  %12 = load i32* %1
  ret i32 %12
}

declare i32 @printf(i8*, ...)
