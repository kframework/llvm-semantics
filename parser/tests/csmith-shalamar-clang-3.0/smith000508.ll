; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith000508.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = global i32 48830980, align 4
@g_22 = global i32 -481370261, align 4
@g_25 = global [3 x i32] [i32 -714509075, i32 -714509075, i32 -714509075], align 4
@g_24 = global i32* bitcast (i8* getelementptr (i8* bitcast ([3 x i32]* @g_25 to i8*), i64 4) to i32*), align 8
@g_26 = global [1 x [3 x i32**]] [[3 x i32**] [i32** @g_24, i32** @g_24, i32** @g_24]], align 16
@g_27 = global i32** null, align 8
@.str = private unnamed_addr constant [19 x i8] c"checksum g_2 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [20 x i8] c"checksum g_22 = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [23 x i8] c"checksum g_25[0] = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [23 x i8] c"checksum g_25[1] = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [23 x i8] c"checksum g_25[2] = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define signext i8 @func_1() nounwind uwtable {
  %1 = alloca i8, align 1
  %l_11 = alloca [1 x [8 x i64]], align 16
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %l_12 = alloca i32, align 4
  %l_13 = alloca i8, align 1
  %l_23 = alloca [5 x i8], align 1
  %l_28 = alloca i32**, align 8
  %i1 = alloca i32, align 4
  store i32 0, i32* %i, align 4
  br label %2

; <label>:2                                       ; preds = %20, %0
  %3 = load i32* %i, align 4
  %4 = icmp slt i32 %3, 1
  br i1 %4, label %5, label %23

; <label>:5                                       ; preds = %2
  store i32 0, i32* %j, align 4
  br label %6

; <label>:6                                       ; preds = %16, %5
  %7 = load i32* %j, align 4
  %8 = icmp slt i32 %7, 8
  br i1 %8, label %9, label %19

; <label>:9                                       ; preds = %6
  %10 = load i32* %j, align 4
  %11 = sext i32 %10 to i64
  %12 = load i32* %i, align 4
  %13 = sext i32 %12 to i64
  %14 = getelementptr inbounds [1 x [8 x i64]]* %l_11, i32 0, i64 %13
  %15 = getelementptr inbounds [8 x i64]* %14, i32 0, i64 %11
  store i64 9, i64* %15, align 8
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
  store volatile i32 0, i32* @g_2, align 4
  br label %24

; <label>:24                                      ; preds = %55, %23
  %25 = load volatile i32* @g_2, align 4
  %26 = icmp sge i32 %25, 0
  br i1 %26, label %27, label %60

; <label>:27                                      ; preds = %24
  store i32 1, i32* %l_12, align 4
  %28 = getelementptr inbounds [1 x [8 x i64]]* %l_11, i32 0, i64 0
  %29 = getelementptr inbounds [8 x i64]* %28, i32 0, i64 5
  %30 = load i64* %29, align 8
  %31 = load volatile i32* @g_2, align 4
  %32 = sext i32 %31 to i64
  %33 = icmp sgt i64 %30, %32
  %34 = zext i1 %33 to i32
  %35 = trunc i32 %34 to i16
  %36 = call signext i16 @safe_div_func_int16_t_s_s(i16 signext %35, i16 signext -1)
  %37 = sext i16 %36 to i32
  %38 = icmp ne i32 %37, 0
  br i1 %38, label %39, label %42

; <label>:39                                      ; preds = %27
  %40 = load volatile i32* @g_2, align 4
  %41 = icmp ne i32 %40, 0
  br label %42

; <label>:42                                      ; preds = %39, %27
  %43 = phi i1 [ false, %27 ], [ %41, %39 ]
  %44 = zext i1 %43 to i32
  %45 = sext i32 %44 to i64
  %46 = call i32 @func_7(i64 %45)
  %47 = trunc i32 %46 to i16
  %48 = call signext i16 @safe_lshift_func_int16_t_s_u(i16 signext %47, i32 -9)
  %49 = icmp ne i16 %48, 0
  br i1 %49, label %50, label %53

; <label>:50                                      ; preds = %42
  %51 = load i32* %l_12, align 4
  %52 = trunc i32 %51 to i8
  store i8 %52, i8* %1
  br label %109

; <label>:53                                      ; preds = %42
  store i8 0, i8* %l_13, align 1
  %54 = load i8* %l_13, align 1
  store i8 %54, i8* %1
  br label %109
                                                  ; No predecessors!
  %56 = load volatile i32* @g_2, align 4
  %57 = sext i32 %56 to i64
  %58 = call i64 @safe_add_func_int64_t_s_s(i64 %57, i64 3)
  %59 = trunc i64 %58 to i32
  store volatile i32 %59, i32* @g_2, align 4
  br label %24

; <label>:60                                      ; preds = %24
  store volatile i32 0, i32* @g_2, align 4
  br label %61

; <label>:61                                      ; preds = %101, %60
  %62 = load volatile i32* @g_2, align 4
  %63 = icmp ne i32 %62, -29
  br i1 %63, label %64, label %106

; <label>:64                                      ; preds = %61
  store i32** @g_24, i32*** %l_28, align 8
  store i32 0, i32* %i1, align 4
  br label %65

; <label>:65                                      ; preds = %72, %64
  %66 = load i32* %i1, align 4
  %67 = icmp slt i32 %66, 5
  br i1 %67, label %68, label %75

; <label>:68                                      ; preds = %65
  %69 = load i32* %i1, align 4
  %70 = sext i32 %69 to i64
  %71 = getelementptr inbounds [5 x i8]* %l_23, i32 0, i64 %70
  store i8 -3, i8* %71, align 1
  br label %72

; <label>:72                                      ; preds = %68
  %73 = load i32* %i1, align 4
  %74 = add nsw i32 %73, 1
  store i32 %74, i32* %i1, align 4
  br label %65

; <label>:75                                      ; preds = %65
  %76 = load volatile i32* @g_2, align 4
  %77 = trunc i32 %76 to i8
  %78 = load i32* @g_22, align 4
  %79 = icmp ne i32 %78, 0
  br i1 %79, label %85, label %80

; <label>:80                                      ; preds = %75
  %81 = getelementptr inbounds [5 x i8]* %l_23, i32 0, i64 0
  %82 = load i8* %81, align 1
  %83 = sext i8 %82 to i32
  %84 = icmp ne i32 %83, 0
  br label %85

; <label>:85                                      ; preds = %80, %75
  %86 = phi i1 [ true, %75 ], [ %84, %80 ]
  %87 = zext i1 %86 to i32
  %88 = trunc i32 %87 to i8
  %89 = getelementptr inbounds [5 x i8]* %l_23, i32 0, i64 1
  %90 = load i8* %89, align 1
  %91 = sext i8 %90 to i16
  %92 = load i32** @g_24, align 8
  %93 = call i32* @func_16(i8 signext %77, i8 zeroext %88, i32* null, i16 signext %91, i32* %92)
  %94 = load i32*** %l_28, align 8
  store i32* %93, i32** %94
  %95 = getelementptr inbounds [1 x [8 x i64]]* %l_11, i32 0, i64 0
  %96 = getelementptr inbounds [8 x i64]* %95, i32 0, i64 5
  %97 = load i64* %96, align 8
  %98 = icmp ne i64 %97, 0
  br i1 %98, label %99, label %100

; <label>:99                                      ; preds = %85
  br label %101

; <label>:100                                     ; preds = %85
  br label %101

; <label>:101                                     ; preds = %100, %99
  %102 = load volatile i32* @g_2, align 4
  %103 = sext i32 %102 to i64
  %104 = call i64 @safe_add_func_uint64_t_u_u(i64 %103, i64 1)
  %105 = trunc i64 %104 to i32
  store volatile i32 %105, i32* @g_2, align 4
  br label %61

; <label>:106                                     ; preds = %61
  %107 = load i32* getelementptr inbounds ([3 x i32]* @g_25, i32 0, i64 1), align 4
  %108 = trunc i32 %107 to i8
  store i8 %108, i8* %1
  br label %109

; <label>:109                                     ; preds = %106, %53, %50
  %110 = load i8* %1
  ret i8 %110
}

define internal signext i16 @safe_lshift_func_int16_t_s_u(i16 signext %left, i32 %right) nounwind uwtable {
  %1 = alloca i16, align 2
  %2 = alloca i32, align 4
  store i16 %left, i16* %1, align 2
  store i32 %right, i32* %2, align 4
  %3 = load i16* %1, align 2
  %4 = sext i16 %3 to i32
  %5 = icmp slt i32 %4, 0
  br i1 %5, label %15, label %6

; <label>:6                                       ; preds = %0
  %7 = load i32* %2, align 4
  %8 = icmp uge i32 %7, 32
  br i1 %8, label %15, label %9

; <label>:9                                       ; preds = %6
  %10 = load i16* %1, align 2
  %11 = sext i16 %10 to i32
  %12 = load i32* %2, align 4
  %13 = ashr i32 32767, %12
  %14 = icmp sgt i32 %11, %13
  br i1 %14, label %15, label %18

; <label>:15                                      ; preds = %9, %6, %0
  %16 = load i16* %1, align 2
  %17 = sext i16 %16 to i32
  br label %23

; <label>:18                                      ; preds = %9
  %19 = load i16* %1, align 2
  %20 = sext i16 %19 to i32
  %21 = load i32* %2, align 4
  %22 = shl i32 %20, %21
  br label %23

; <label>:23                                      ; preds = %18, %15
  %24 = phi i32 [ %17, %15 ], [ %22, %18 ]
  %25 = trunc i32 %24 to i16
  ret i16 %25
}

define i32 @func_7(i64 %p_8) nounwind uwtable {
  %1 = alloca i64, align 8
  store i64 %p_8, i64* %1, align 8
  %2 = load volatile i32* @g_2, align 4
  ret i32 %2
}

define internal signext i16 @safe_div_func_int16_t_s_s(i16 signext %si1, i16 signext %si2) nounwind uwtable {
  %1 = alloca i16, align 2
  %2 = alloca i16, align 2
  store i16 %si1, i16* %1, align 2
  store i16 %si2, i16* %2, align 2
  %3 = load i16* %2, align 2
  %4 = sext i16 %3 to i32
  %5 = icmp eq i32 %4, 0
  br i1 %5, label %14, label %6

; <label>:6                                       ; preds = %0
  %7 = load i16* %1, align 2
  %8 = sext i16 %7 to i32
  %9 = icmp eq i32 %8, -32768
  br i1 %9, label %10, label %17

; <label>:10                                      ; preds = %6
  %11 = load i16* %2, align 2
  %12 = sext i16 %11 to i32
  %13 = icmp eq i32 %12, -1
  br i1 %13, label %14, label %17

; <label>:14                                      ; preds = %10, %0
  %15 = load i16* %1, align 2
  %16 = sext i16 %15 to i32
  br label %23

; <label>:17                                      ; preds = %10, %6
  %18 = load i16* %1, align 2
  %19 = sext i16 %18 to i32
  %20 = load i16* %2, align 2
  %21 = sext i16 %20 to i32
  %22 = sdiv i32 %19, %21
  br label %23

; <label>:23                                      ; preds = %17, %14
  %24 = phi i32 [ %16, %14 ], [ %22, %17 ]
  %25 = trunc i32 %24 to i16
  ret i16 %25
}

define internal i64 @safe_add_func_int64_t_s_s(i64 %si1, i64 %si2) nounwind uwtable {
  %1 = alloca i64, align 8
  %2 = alloca i64, align 8
  store i64 %si1, i64* %1, align 8
  store i64 %si2, i64* %2, align 8
  %3 = load i64* %1, align 8
  %4 = icmp sgt i64 %3, 0
  br i1 %4, label %5, label %13

; <label>:5                                       ; preds = %0
  %6 = load i64* %2, align 8
  %7 = icmp sgt i64 %6, 0
  br i1 %7, label %8, label %13

; <label>:8                                       ; preds = %5
  %9 = load i64* %1, align 8
  %10 = load i64* %2, align 8
  %11 = sub nsw i64 9223372036854775807, %10
  %12 = icmp sgt i64 %9, %11
  br i1 %12, label %24, label %13

; <label>:13                                      ; preds = %8, %5, %0
  %14 = load i64* %1, align 8
  %15 = icmp slt i64 %14, 0
  br i1 %15, label %16, label %26

; <label>:16                                      ; preds = %13
  %17 = load i64* %2, align 8
  %18 = icmp slt i64 %17, 0
  br i1 %18, label %19, label %26

; <label>:19                                      ; preds = %16
  %20 = load i64* %1, align 8
  %21 = load i64* %2, align 8
  %22 = sub nsw i64 -9223372036854775808, %21
  %23 = icmp slt i64 %20, %22
  br i1 %23, label %24, label %26

; <label>:24                                      ; preds = %19, %8
  %25 = load i64* %1, align 8
  br label %30

; <label>:26                                      ; preds = %19, %16, %13
  %27 = load i64* %1, align 8
  %28 = load i64* %2, align 8
  %29 = add nsw i64 %27, %28
  br label %30

; <label>:30                                      ; preds = %26, %24
  %31 = phi i64 [ %25, %24 ], [ %29, %26 ]
  ret i64 %31
}

define i32* @func_16(i8 signext %p_17, i8 zeroext %p_18, i32* %p_19, i16 signext %p_20, i32* %p_21) nounwind uwtable {
  %1 = alloca i8, align 1
  %2 = alloca i8, align 1
  %3 = alloca i32*, align 8
  %4 = alloca i16, align 2
  %5 = alloca i32*, align 8
  store i8 %p_17, i8* %1, align 1
  store i8 %p_18, i8* %2, align 1
  store i32* %p_19, i32** %3, align 8
  store i16 %p_20, i16* %4, align 2
  store i32* %p_21, i32** %5, align 8
  %6 = load i32** %5, align 8
  ret i32* %6
}

define internal i64 @safe_add_func_uint64_t_u_u(i64 %ui1, i64 %ui2) nounwind uwtable {
  %1 = alloca i64, align 8
  %2 = alloca i64, align 8
  store i64 %ui1, i64* %1, align 8
  store i64 %ui2, i64* %2, align 8
  %3 = load i64* %1, align 8
  %4 = load i64* %2, align 8
  %5 = add i64 %3, %4
  ret i64 %5
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
  %5 = load volatile i32* @g_2, align 4
  %6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %5)
  %7 = load i32* @g_22, align 4
  %8 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str1, i32 0, i32 0), i32 %7)
  %9 = load i32* getelementptr inbounds ([3 x i32]* @g_25, i32 0, i64 0), align 4
  %10 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str2, i32 0, i32 0), i32 %9)
  %11 = load i32* getelementptr inbounds ([3 x i32]* @g_25, i32 0, i64 1), align 4
  %12 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str3, i32 0, i32 0), i32 %11)
  %13 = load i32* getelementptr inbounds ([3 x i32]* @g_25, i32 0, i64 2), align 4
  %14 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str4, i32 0, i32 0), i32 %13)
  %15 = load i32* getelementptr inbounds ([3 x i32]* @g_25, i32 0, i64 1), align 4
  %16 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str3, i32 0, i32 0), i32 %15)
  %17 = load i32* %1
  ret i32 %17
}

declare i32 @printf(i8*, ...)
