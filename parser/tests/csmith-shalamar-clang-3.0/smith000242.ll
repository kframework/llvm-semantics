; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith000242.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = global i32 -1, align 4
@g_22 = global i8 -22, align 1
@.str = private unnamed_addr constant [19 x i8] c"checksum g_2 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [20 x i8] c"checksum g_22 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i64 @func_1() nounwind uwtable {
  %1 = alloca i64, align 8
  %l_3 = alloca i32*, align 8
  %l_4 = alloca i32, align 4
  %l_15 = alloca [8 x i32], align 16
  %l_24 = alloca i32, align 4
  %i = alloca i32, align 4
  %l_9 = alloca i32*, align 8
  %l_14 = alloca i32, align 4
  %l_23 = alloca i64, align 8
  %i1 = alloca i32, align 4
  store i32* null, i32** %l_3, align 8
  store i32 1530633636, i32* %l_4, align 4
  store i32 0, i32* %l_24, align 4
  store i32 0, i32* %i, align 4
  br label %2

; <label>:2                                       ; preds = %9, %0
  %3 = load i32* %i, align 4
  %4 = icmp slt i32 %3, 8
  br i1 %4, label %5, label %12

; <label>:5                                       ; preds = %2
  %6 = load i32* %i, align 4
  %7 = sext i32 %6 to i64
  %8 = getelementptr inbounds [8 x i32]* %l_15, i32 0, i64 %7
  store i32 516036686, i32* %8, align 4
  br label %9

; <label>:9                                       ; preds = %5
  %10 = load i32* %i, align 4
  %11 = add nsw i32 %10, 1
  store i32 %11, i32* %i, align 4
  br label %2

; <label>:12                                      ; preds = %2
  %13 = load i32* @g_2, align 4
  %14 = icmp ne i32 %13, 0
  br i1 %14, label %15, label %18

; <label>:15                                      ; preds = %12
  %16 = load i32* @g_2, align 4
  %17 = icmp ne i32 %16, 0
  br label %18

; <label>:18                                      ; preds = %15, %12
  %19 = phi i1 [ false, %12 ], [ %17, %15 ]
  %20 = zext i1 %19 to i32
  store i32 %20, i32* %l_4, align 4
  store i32 0, i32* %l_4, align 4
  br label %21

; <label>:21                                      ; preds = %102, %18
  %22 = load i32* %l_4, align 4
  %23 = icmp eq i32 %22, 29
  br i1 %23, label %24, label %105

; <label>:24                                      ; preds = %21
  store i32* null, i32** %l_9, align 8
  store i32 371022157, i32* %l_14, align 4
  %25 = load i32* %l_4, align 4
  %26 = load i32** %l_9, align 8
  %27 = icmp eq i32* null, %26
  %28 = zext i1 %27 to i32
  %29 = load i32* %l_14, align 4
  %30 = trunc i32 %29 to i8
  %31 = load i32* @g_2, align 4
  %32 = trunc i32 %31 to i8
  %33 = call signext i8 @safe_mod_func_int8_t_s_s(i8 signext %30, i8 signext %32)
  %34 = sext i8 %33 to i32
  %35 = load i32* @g_2, align 4
  %36 = load i32* @g_2, align 4
  %37 = icmp sge i32 %35, %36
  %38 = zext i1 %37 to i32
  %39 = icmp eq i32 %34, %38
  %40 = zext i1 %39 to i32
  %41 = trunc i32 %40 to i16
  %42 = load i32* @g_2, align 4
  %43 = trunc i32 %42 to i16
  %44 = call signext i16 @safe_sub_func_int16_t_s_s(i16 signext %41, i16 signext %43)
  %45 = sext i16 %44 to i64
  %46 = icmp eq i64 %45, 4169152982
  %47 = zext i1 %46 to i32
  %48 = call i32 @safe_sub_func_int32_t_s_s(i32 %28, i32 %47)
  %49 = or i32 %25, %48
  %50 = getelementptr inbounds [8 x i32]* %l_15, i32 0, i64 4
  %51 = load i32* %50, align 4
  %52 = or i32 %51, %49
  store i32 %52, i32* %50, align 4
  store i32 0, i32* %l_14, align 4
  br label %53

; <label>:53                                      ; preds = %94, %24
  %54 = load i32* %l_14, align 4
  %55 = icmp sgt i32 %54, 23
  br i1 %55, label %56, label %99

; <label>:56                                      ; preds = %53
  store i32 -8, i32* %l_14, align 4
  br label %57

; <label>:57                                      ; preds = %90, %56
  %58 = load i32* %l_14, align 4
  %59 = icmp sle i32 %58, 14
  br i1 %59, label %60, label %93

; <label>:60                                      ; preds = %57
  store i64 -7, i64* %l_23, align 8
  store i32 8, i32* %l_4, align 4
  br label %61

; <label>:61                                      ; preds = %80, %60
  %62 = load i32* %l_4, align 4
  %63 = icmp sge i32 %62, 0
  br i1 %63, label %64, label %85

; <label>:64                                      ; preds = %61
  store i32 5, i32* @g_2, align 4
  br label %65

; <label>:65                                      ; preds = %74, %64
  %66 = load i32* @g_2, align 4
  %67 = icmp sge i32 %66, 0
  br i1 %67, label %68, label %77

; <label>:68                                      ; preds = %65
  %69 = load i32* @g_2, align 4
  %70 = load i8* @g_22, align 1
  %71 = zext i8 %70 to i32
  %72 = xor i32 %71, %69
  %73 = trunc i32 %72 to i8
  store i8 %73, i8* @g_22, align 1
  br label %74

; <label>:74                                      ; preds = %68
  %75 = load i32* @g_2, align 4
  %76 = add nsw i32 %75, -5
  store i32 %76, i32* @g_2, align 4
  br label %65

; <label>:77                                      ; preds = %65
  %78 = load i32* @g_2, align 4
  %79 = sext i32 %78 to i64
  store i64 %79, i64* %1
  br label %108
                                                  ; No predecessors!
  %81 = load i32* %l_4, align 4
  %82 = trunc i32 %81 to i16
  %83 = call zeroext i16 @safe_add_func_uint16_t_u_u(i16 zeroext %82, i16 zeroext 1)
  %84 = zext i16 %83 to i32
  store i32 %84, i32* %l_4, align 4
  br label %61

; <label>:85                                      ; preds = %61
  %86 = load i64* %l_23, align 8
  %87 = icmp ne i64 %86, 0
  br i1 %87, label %88, label %89

; <label>:88                                      ; preds = %85
  br label %93

; <label>:89                                      ; preds = %85
  br label %90

; <label>:90                                      ; preds = %89
  %91 = load i32* %l_14, align 4
  %92 = call i32 @safe_add_func_int32_t_s_s(i32 %91, i32 1)
  store i32 %92, i32* %l_14, align 4
  br label %57

; <label>:93                                      ; preds = %88, %57
  br label %94

; <label>:94                                      ; preds = %93
  %95 = load i32* %l_14, align 4
  %96 = sext i32 %95 to i64
  %97 = call i64 @safe_add_func_uint64_t_u_u(i64 %96, i64 0)
  %98 = trunc i64 %97 to i32
  store i32 %98, i32* %l_14, align 4
  br label %53

; <label>:99                                      ; preds = %53
  %100 = load i32* @g_2, align 4
  %101 = sext i32 %100 to i64
  store i64 %101, i64* %1
  br label %108
                                                  ; No predecessors!
  %103 = load i32* %l_4, align 4
  %104 = call i32 @safe_sub_func_uint32_t_u_u(i32 %103, i32 1)
  store i32 %104, i32* %l_4, align 4
  br label %21

; <label>:105                                     ; preds = %21
  %106 = load i32* %l_24, align 4
  %107 = sext i32 %106 to i64
  store i64 %107, i64* %1
  br label %108

; <label>:108                                     ; preds = %105, %99, %77
  %109 = load i64* %1
  ret i64 %109
}

define internal i32 @safe_sub_func_int32_t_s_s(i32 %si1, i32 %si2) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 %si1, i32* %1, align 4
  store i32 %si2, i32* %2, align 4
  %3 = load i32* %1, align 4
  %4 = load i32* %2, align 4
  %5 = xor i32 %3, %4
  %6 = load i32* %1, align 4
  %7 = load i32* %1, align 4
  %8 = load i32* %2, align 4
  %9 = xor i32 %7, %8
  %10 = and i32 %9, -2147483648
  %11 = xor i32 %6, %10
  %12 = load i32* %2, align 4
  %13 = sub nsw i32 %11, %12
  %14 = load i32* %2, align 4
  %15 = xor i32 %13, %14
  %16 = and i32 %5, %15
  %17 = icmp slt i32 %16, 0
  br i1 %17, label %18, label %20

; <label>:18                                      ; preds = %0
  %19 = load i32* %1, align 4
  br label %24

; <label>:20                                      ; preds = %0
  %21 = load i32* %1, align 4
  %22 = load i32* %2, align 4
  %23 = sub nsw i32 %21, %22
  br label %24

; <label>:24                                      ; preds = %20, %18
  %25 = phi i32 [ %19, %18 ], [ %23, %20 ]
  ret i32 %25
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

define internal signext i8 @safe_mod_func_int8_t_s_s(i8 signext %si1, i8 signext %si2) nounwind uwtable {
  %1 = alloca i8, align 1
  %2 = alloca i8, align 1
  store i8 %si1, i8* %1, align 1
  store i8 %si2, i8* %2, align 1
  %3 = load i8* %2, align 1
  %4 = sext i8 %3 to i32
  %5 = icmp eq i32 %4, 0
  br i1 %5, label %14, label %6

; <label>:6                                       ; preds = %0
  %7 = load i8* %1, align 1
  %8 = sext i8 %7 to i32
  %9 = icmp eq i32 %8, -128
  br i1 %9, label %10, label %17

; <label>:10                                      ; preds = %6
  %11 = load i8* %2, align 1
  %12 = sext i8 %11 to i32
  %13 = icmp eq i32 %12, -1
  br i1 %13, label %14, label %17

; <label>:14                                      ; preds = %10, %0
  %15 = load i8* %1, align 1
  %16 = sext i8 %15 to i32
  br label %23

; <label>:17                                      ; preds = %10, %6
  %18 = load i8* %1, align 1
  %19 = sext i8 %18 to i32
  %20 = load i8* %2, align 1
  %21 = sext i8 %20 to i32
  %22 = srem i32 %19, %21
  br label %23

; <label>:23                                      ; preds = %17, %14
  %24 = phi i32 [ %16, %14 ], [ %22, %17 ]
  %25 = trunc i32 %24 to i8
  ret i8 %25
}

define internal zeroext i16 @safe_add_func_uint16_t_u_u(i16 zeroext %ui1, i16 zeroext %ui2) nounwind uwtable {
  %1 = alloca i16, align 2
  %2 = alloca i16, align 2
  store i16 %ui1, i16* %1, align 2
  store i16 %ui2, i16* %2, align 2
  %3 = load i16* %1, align 2
  %4 = zext i16 %3 to i32
  %5 = load i16* %2, align 2
  %6 = zext i16 %5 to i32
  %7 = add nsw i32 %4, %6
  %8 = trunc i32 %7 to i16
  ret i16 %8
}

define internal i32 @safe_add_func_int32_t_s_s(i32 %si1, i32 %si2) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 %si1, i32* %1, align 4
  store i32 %si2, i32* %2, align 4
  %3 = load i32* %1, align 4
  %4 = icmp sgt i32 %3, 0
  br i1 %4, label %5, label %13

; <label>:5                                       ; preds = %0
  %6 = load i32* %2, align 4
  %7 = icmp sgt i32 %6, 0
  br i1 %7, label %8, label %13

; <label>:8                                       ; preds = %5
  %9 = load i32* %1, align 4
  %10 = load i32* %2, align 4
  %11 = sub nsw i32 2147483647, %10
  %12 = icmp sgt i32 %9, %11
  br i1 %12, label %24, label %13

; <label>:13                                      ; preds = %8, %5, %0
  %14 = load i32* %1, align 4
  %15 = icmp slt i32 %14, 0
  br i1 %15, label %16, label %26

; <label>:16                                      ; preds = %13
  %17 = load i32* %2, align 4
  %18 = icmp slt i32 %17, 0
  br i1 %18, label %19, label %26

; <label>:19                                      ; preds = %16
  %20 = load i32* %1, align 4
  %21 = load i32* %2, align 4
  %22 = sub nsw i32 -2147483648, %21
  %23 = icmp slt i32 %20, %22
  br i1 %23, label %24, label %26

; <label>:24                                      ; preds = %19, %8
  %25 = load i32* %1, align 4
  br label %30

; <label>:26                                      ; preds = %19, %16, %13
  %27 = load i32* %1, align 4
  %28 = load i32* %2, align 4
  %29 = add nsw i32 %27, %28
  br label %30

; <label>:30                                      ; preds = %26, %24
  %31 = phi i32 [ %25, %24 ], [ %29, %26 ]
  ret i32 %31
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

define internal i32 @safe_sub_func_uint32_t_u_u(i32 %ui1, i32 %ui2) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 %ui1, i32* %1, align 4
  store i32 %ui2, i32* %2, align 4
  %3 = load i32* %1, align 4
  %4 = load i32* %2, align 4
  %5 = sub i32 %3, %4
  ret i32 %5
}

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  %4 = call i64 @func_1()
  %5 = load i32* @g_2, align 4
  %6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %5)
  %7 = load i8* @g_22, align 1
  %8 = zext i8 %7 to i32
  %9 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str1, i32 0, i32 0), i32 %8)
  %10 = load i32* %1
  ret i32 %10
}

declare i32 @printf(i8*, ...)
