; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith000025.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = global [5 x i32] [i32 4, i32 4, i32 4, i32 4, i32 4], align 16
@g_7 = global i32 1572032109, align 4
@g_13 = constant [6 x i32*] [i32* @g_7, i32* @g_7, i32* @g_7, i32* @g_7, i32* @g_7, i32* @g_7], align 16
@g_14 = global [1 x i32*] zeroinitializer, align 8
@.str = private unnamed_addr constant [22 x i8] c"checksum g_2[0] = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [22 x i8] c"checksum g_2[1] = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [22 x i8] c"checksum g_2[2] = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [22 x i8] c"checksum g_2[3] = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [22 x i8] c"checksum g_2[4] = %d\0A\00", align 1
@.str5 = private unnamed_addr constant [19 x i8] c"checksum g_7 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i64 @func_1() nounwind uwtable {
  %l_12 = alloca i64, align 8
  %l_18 = alloca i32*, align 8
  %l_17 = alloca [8 x [2 x [1 x [1 x [5 x i32**]]]]], align 16
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %l = alloca i32, align 4
  %m = alloca i32, align 4
  %l_6 = alloca i32*, align 8
  %l_5 = alloca i32**, align 8
  %l_16 = alloca i32, align 4
  %l_15 = alloca [6 x [7 x i32*]], align 16
  %i1 = alloca i32, align 4
  %j2 = alloca i32, align 4
  store i64 0, i64* %l_12, align 8
  store i32* @g_7, i32** %l_18, align 8
  store i32 0, i32* %i, align 4
  br label %1

; <label>:1                                       ; preds = %52, %0
  %2 = load i32* %i, align 4
  %3 = icmp slt i32 %2, 8
  br i1 %3, label %4, label %55

; <label>:4                                       ; preds = %1
  store i32 0, i32* %j, align 4
  br label %5

; <label>:5                                       ; preds = %48, %4
  %6 = load i32* %j, align 4
  %7 = icmp slt i32 %6, 2
  br i1 %7, label %8, label %51

; <label>:8                                       ; preds = %5
  store i32 0, i32* %k, align 4
  br label %9

; <label>:9                                       ; preds = %44, %8
  %10 = load i32* %k, align 4
  %11 = icmp slt i32 %10, 1
  br i1 %11, label %12, label %47

; <label>:12                                      ; preds = %9
  store i32 0, i32* %l, align 4
  br label %13

; <label>:13                                      ; preds = %40, %12
  %14 = load i32* %l, align 4
  %15 = icmp slt i32 %14, 1
  br i1 %15, label %16, label %43

; <label>:16                                      ; preds = %13
  store i32 0, i32* %m, align 4
  br label %17

; <label>:17                                      ; preds = %36, %16
  %18 = load i32* %m, align 4
  %19 = icmp slt i32 %18, 5
  br i1 %19, label %20, label %39

; <label>:20                                      ; preds = %17
  %21 = load i32* %m, align 4
  %22 = sext i32 %21 to i64
  %23 = load i32* %l, align 4
  %24 = sext i32 %23 to i64
  %25 = load i32* %k, align 4
  %26 = sext i32 %25 to i64
  %27 = load i32* %j, align 4
  %28 = sext i32 %27 to i64
  %29 = load i32* %i, align 4
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds [8 x [2 x [1 x [1 x [5 x i32**]]]]]* %l_17, i32 0, i64 %30
  %32 = getelementptr inbounds [2 x [1 x [1 x [5 x i32**]]]]* %31, i32 0, i64 %28
  %33 = getelementptr inbounds [1 x [1 x [5 x i32**]]]* %32, i32 0, i64 %26
  %34 = getelementptr inbounds [1 x [5 x i32**]]* %33, i32 0, i64 %24
  %35 = getelementptr inbounds [5 x i32**]* %34, i32 0, i64 %22
  store i32** %l_18, i32*** %35, align 8
  br label %36

; <label>:36                                      ; preds = %20
  %37 = load i32* %m, align 4
  %38 = add nsw i32 %37, 1
  store i32 %38, i32* %m, align 4
  br label %17

; <label>:39                                      ; preds = %17
  br label %40

; <label>:40                                      ; preds = %39
  %41 = load i32* %l, align 4
  %42 = add nsw i32 %41, 1
  store i32 %42, i32* %l, align 4
  br label %13

; <label>:43                                      ; preds = %13
  br label %44

; <label>:44                                      ; preds = %43
  %45 = load i32* %k, align 4
  %46 = add nsw i32 %45, 1
  store i32 %46, i32* %k, align 4
  br label %9

; <label>:47                                      ; preds = %9
  br label %48

; <label>:48                                      ; preds = %47
  %49 = load i32* %j, align 4
  %50 = add nsw i32 %49, 1
  store i32 %50, i32* %j, align 4
  br label %5

; <label>:51                                      ; preds = %5
  br label %52

; <label>:52                                      ; preds = %51
  %53 = load i32* %i, align 4
  %54 = add nsw i32 %53, 1
  store i32 %54, i32* %i, align 4
  br label %1

; <label>:55                                      ; preds = %1
  store volatile i32 0, i32* getelementptr inbounds ([5 x i32]* @g_2, i32 0, i64 4), align 4
  br label %56

; <label>:56                                      ; preds = %97, %55
  %57 = load volatile i32* getelementptr inbounds ([5 x i32]* @g_2, i32 0, i64 4), align 4
  %58 = icmp sge i32 %57, 29
  br i1 %58, label %59, label %102

; <label>:59                                      ; preds = %56
  store i32* @g_7, i32** %l_6, align 8
  store i32** %l_6, i32*** %l_5, align 8
  store i32 -3, i32* %l_16, align 4
  %60 = load i32*** %l_5, align 8
  store i32* null, i32** %60
  store i32 5, i32* @g_7, align 4
  br label %61

; <label>:61                                      ; preds = %91, %59
  %62 = load i32* @g_7, align 4
  %63 = icmp slt i32 %62, 25
  br i1 %63, label %64, label %96

; <label>:64                                      ; preds = %61
  store i32 0, i32* %i1, align 4
  br label %65

; <label>:65                                      ; preds = %83, %64
  %66 = load i32* %i1, align 4
  %67 = icmp slt i32 %66, 6
  br i1 %67, label %68, label %86

; <label>:68                                      ; preds = %65
  store i32 0, i32* %j2, align 4
  br label %69

; <label>:69                                      ; preds = %79, %68
  %70 = load i32* %j2, align 4
  %71 = icmp slt i32 %70, 7
  br i1 %71, label %72, label %82

; <label>:72                                      ; preds = %69
  %73 = load i32* %j2, align 4
  %74 = sext i32 %73 to i64
  %75 = load i32* %i1, align 4
  %76 = sext i32 %75 to i64
  %77 = getelementptr inbounds [6 x [7 x i32*]]* %l_15, i32 0, i64 %76
  %78 = getelementptr inbounds [7 x i32*]* %77, i32 0, i64 %74
  store i32* @g_7, i32** %78, align 8
  br label %79

; <label>:79                                      ; preds = %72
  %80 = load i32* %j2, align 4
  %81 = add nsw i32 %80, 1
  store i32 %81, i32* %j2, align 4
  br label %69

; <label>:82                                      ; preds = %69
  br label %83

; <label>:83                                      ; preds = %82
  %84 = load i32* %i1, align 4
  %85 = add nsw i32 %84, 1
  store i32 %85, i32* %i1, align 4
  br label %65

; <label>:86                                      ; preds = %65
  %87 = load i32* @g_7, align 4
  %88 = trunc i32 %87 to i16
  %89 = call signext i16 @safe_rshift_func_int16_t_s_u(i16 signext %88, i32 0)
  %90 = sext i16 %89 to i32
  store i32 %90, i32* %l_16, align 4
  br label %91

; <label>:91                                      ; preds = %86
  %92 = load i32* @g_7, align 4
  %93 = trunc i32 %92 to i16
  %94 = call signext i16 @safe_sub_func_int16_t_s_s(i16 signext %93, i16 signext 2)
  %95 = sext i16 %94 to i32
  store i32 %95, i32* @g_7, align 4
  br label %61

; <label>:96                                      ; preds = %61
  br label %97

; <label>:97                                      ; preds = %96
  %98 = load volatile i32* getelementptr inbounds ([5 x i32]* @g_2, i32 0, i64 4), align 4
  %99 = trunc i32 %98 to i16
  %100 = call signext i16 @safe_add_func_int16_t_s_s(i16 signext %99, i16 signext 1)
  %101 = sext i16 %100 to i32
  store volatile i32 %101, i32* getelementptr inbounds ([5 x i32]* @g_2, i32 0, i64 4), align 4
  br label %56

; <label>:102                                     ; preds = %56
  store volatile i32* @g_7, i32** getelementptr inbounds ([1 x i32*]* @g_14, i32 0, i64 0), align 8
  %103 = load i32* @g_7, align 4
  %104 = sext i32 %103 to i64
  ret i64 %104
}

define internal signext i16 @safe_rshift_func_int16_t_s_u(i16 signext %left, i32 %right) nounwind uwtable {
  %1 = alloca i16, align 2
  %2 = alloca i32, align 4
  store i16 %left, i16* %1, align 2
  store i32 %right, i32* %2, align 4
  %3 = load i16* %1, align 2
  %4 = sext i16 %3 to i32
  %5 = icmp slt i32 %4, 0
  br i1 %5, label %9, label %6

; <label>:6                                       ; preds = %0
  %7 = load i32* %2, align 4
  %8 = icmp uge i32 %7, 32
  br i1 %8, label %9, label %12

; <label>:9                                       ; preds = %6, %0
  %10 = load i16* %1, align 2
  %11 = sext i16 %10 to i32
  br label %17

; <label>:12                                      ; preds = %6
  %13 = load i16* %1, align 2
  %14 = sext i16 %13 to i32
  %15 = load i32* %2, align 4
  %16 = ashr i32 %14, %15
  br label %17

; <label>:17                                      ; preds = %12, %9
  %18 = phi i32 [ %11, %9 ], [ %16, %12 ]
  %19 = trunc i32 %18 to i16
  ret i16 %19
}

define internal signext i16 @safe_sub_func_int16_t_s_s(i16 signext %si1, i16 signext %si2) nounwind uwtable {
  %1 = alloca i16, align 2
  %2 = alloca i16, align 2
  store i16 %si1, i16* %1, align 2
  store i16 %si2, i16* %2, align 2
  %3 = load i16* %1, align 2
  %4 = sext i16 %3 to i32
  %5 = load i16* %2, align 2
  %6 = sext i16 %5 to i32
  %7 = sub nsw i32 %4, %6
  %8 = trunc i32 %7 to i16
  ret i16 %8
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

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  %i = alloca i32, align 4
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  %4 = call i64 @func_1()
  %5 = load volatile i32* getelementptr inbounds ([5 x i32]* @g_2, i32 0, i64 0), align 4
  %6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str, i32 0, i32 0), i32 %5)
  %7 = load volatile i32* getelementptr inbounds ([5 x i32]* @g_2, i32 0, i64 1), align 4
  %8 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str1, i32 0, i32 0), i32 %7)
  %9 = load volatile i32* getelementptr inbounds ([5 x i32]* @g_2, i32 0, i64 2), align 4
  %10 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str2, i32 0, i32 0), i32 %9)
  %11 = load volatile i32* getelementptr inbounds ([5 x i32]* @g_2, i32 0, i64 3), align 4
  %12 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str3, i32 0, i32 0), i32 %11)
  %13 = load volatile i32* getelementptr inbounds ([5 x i32]* @g_2, i32 0, i64 4), align 4
  %14 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str4, i32 0, i32 0), i32 %13)
  %15 = load volatile i32* getelementptr inbounds ([5 x i32]* @g_2, i32 0, i64 4), align 4
  %16 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str4, i32 0, i32 0), i32 %15)
  %17 = load i32* @g_7, align 4
  %18 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str5, i32 0, i32 0), i32 %17)
  %19 = load i32* %1
  ret i32 %19
}

declare i32 @printf(i8*, ...)
