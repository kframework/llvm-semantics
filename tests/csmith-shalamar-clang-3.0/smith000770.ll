; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith000770.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_5 = global i32 0, align 4
@g_8 = global i32 1997174728, align 4
@g_7 = global i32* @g_8, align 8
@.str = private unnamed_addr constant [19 x i8] c"checksum g_5 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [19 x i8] c"checksum g_8 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable {
  %1 = alloca i32, align 4
  %l_6 = alloca [2 x [7 x i32*]], align 16
  %l_9 = alloca i32**, align 8
  %l_12 = alloca [7 x [3 x [1 x i8]]], align 16
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  store i32** @g_7, i32*** %l_9, align 8
  store i32 0, i32* %i, align 4
  br label %2

; <label>:2                                       ; preds = %20, %0
  %3 = load i32* %i, align 4
  %4 = icmp slt i32 %3, 2
  br i1 %4, label %5, label %23

; <label>:5                                       ; preds = %2
  store i32 0, i32* %j, align 4
  br label %6

; <label>:6                                       ; preds = %16, %5
  %7 = load i32* %j, align 4
  %8 = icmp slt i32 %7, 7
  br i1 %8, label %9, label %19

; <label>:9                                       ; preds = %6
  %10 = load i32* %j, align 4
  %11 = sext i32 %10 to i64
  %12 = load i32* %i, align 4
  %13 = sext i32 %12 to i64
  %14 = getelementptr inbounds [2 x [7 x i32*]]* %l_6, i32 0, i64 %13
  %15 = getelementptr inbounds [7 x i32*]* %14, i32 0, i64 %11
  store i32* null, i32** %15, align 8
  br label %16

; <label>:16                                      ; preds = %9
  %17 = load i32* %j, align 4
  %18 = add nsw i32 %17, 1
  store i32 %18, i32* %j, align 4
  br label %6

; <label>:19                                      ; preds = %6
  br label %20

; <label>:20                                      ; preds = %19
  %21 = load i32* %i, align 4
  %22 = add nsw i32 %21, 1
  store i32 %22, i32* %i, align 4
  br label %2

; <label>:23                                      ; preds = %2
  store i32 0, i32* %i, align 4
  br label %24

; <label>:24                                      ; preds = %53, %23
  %25 = load i32* %i, align 4
  %26 = icmp slt i32 %25, 7
  br i1 %26, label %27, label %56

; <label>:27                                      ; preds = %24
  store i32 0, i32* %j, align 4
  br label %28

; <label>:28                                      ; preds = %49, %27
  %29 = load i32* %j, align 4
  %30 = icmp slt i32 %29, 3
  br i1 %30, label %31, label %52

; <label>:31                                      ; preds = %28
  store i32 0, i32* %k, align 4
  br label %32

; <label>:32                                      ; preds = %45, %31
  %33 = load i32* %k, align 4
  %34 = icmp slt i32 %33, 1
  br i1 %34, label %35, label %48

; <label>:35                                      ; preds = %32
  %36 = load i32* %k, align 4
  %37 = sext i32 %36 to i64
  %38 = load i32* %j, align 4
  %39 = sext i32 %38 to i64
  %40 = load i32* %i, align 4
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds [7 x [3 x [1 x i8]]]* %l_12, i32 0, i64 %41
  %43 = getelementptr inbounds [3 x [1 x i8]]* %42, i32 0, i64 %39
  %44 = getelementptr inbounds [1 x i8]* %43, i32 0, i64 %37
  store i8 -57, i8* %44, align 1
  br label %45

; <label>:45                                      ; preds = %35
  %46 = load i32* %k, align 4
  %47 = add nsw i32 %46, 1
  store i32 %47, i32* %k, align 4
  br label %32

; <label>:48                                      ; preds = %32
  br label %49

; <label>:49                                      ; preds = %48
  %50 = load i32* %j, align 4
  %51 = add nsw i32 %50, 1
  store i32 %51, i32* %j, align 4
  br label %28

; <label>:52                                      ; preds = %28
  br label %53

; <label>:53                                      ; preds = %52
  %54 = load i32* %i, align 4
  %55 = add nsw i32 %54, 1
  store i32 %55, i32* %i, align 4
  br label %24

; <label>:56                                      ; preds = %24
  %57 = load volatile i32** @g_7, align 8
  %58 = load i32*** %l_9, align 8
  store volatile i32* %57, i32** %58
  store volatile i32 19, i32* @g_5, align 4
  br label %59

; <label>:59                                      ; preds = %65, %56
  %60 = load volatile i32* @g_5, align 4
  %61 = icmp ule i32 %60, 3
  br i1 %61, label %62, label %70

; <label>:62                                      ; preds = %59
  %63 = load volatile i32** @g_7, align 8
  %64 = load volatile i32* %63
  store i32 %64, i32* %1
  br label %76
                                                  ; No predecessors!
  %66 = load volatile i32* @g_5, align 4
  %67 = trunc i32 %66 to i16
  %68 = call signext i16 @safe_add_func_int16_t_s_s(i16 signext %67, i16 signext 1)
  %69 = sext i16 %68 to i32
  store volatile i32 %69, i32* @g_5, align 4
  br label %59

; <label>:70                                      ; preds = %59
  %71 = getelementptr inbounds [7 x [3 x [1 x i8]]]* %l_12, i32 0, i64 0
  %72 = getelementptr inbounds [3 x [1 x i8]]* %71, i32 0, i64 2
  %73 = getelementptr inbounds [1 x i8]* %72, i32 0, i64 0
  %74 = load i8* %73, align 1
  %75 = zext i8 %74 to i32
  store i32 %75, i32* %1
  br label %76

; <label>:76                                      ; preds = %70, %62
  %77 = load i32* %1
  ret i32 %77
}

define internal signext i16 @safe_add_func_int16_t_s_s(i16 signext %si1, i16 signext %si2) nounwind uwtable {
  %1 = alloca i16, align 2
  %2 = alloca i16, align 2
  store i16 %si1, i16* %1, align 2
  store i16 %si2, i16* %2, align 2
  %3 = load i16* %1, align 2
  %4 = sext i16 %3 to i32
  %5 = load i16* %2, align 2
  %6 = sext i16 %5 to i32
  %7 = add nsw i32 %4, %6
  %8 = trunc i32 %7 to i16
  ret i16 %8
}

define i32* @func_2(i32* %p_3, i8 signext %p_4) nounwind uwtable {
  %1 = alloca i32*, align 8
  %2 = alloca i8, align 1
  store i32* %p_3, i32** %1, align 8
  store i8 %p_4, i8* %2, align 1
  %3 = load volatile i32* @g_5, align 4
  %4 = load i32** %1, align 8
  store i32 %3, i32* %4
  %5 = load i32** %1, align 8
  ret i32* %5
}

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  %4 = call i32 @func_1()
  %5 = load volatile i32* @g_5, align 4
  %6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %5)
  %7 = load volatile i32* @g_8, align 4
  %8 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str1, i32 0, i32 0), i32 %7)
  %9 = load i32* %1
  ret i32 %9
}

declare i32 @printf(i8*, ...)
