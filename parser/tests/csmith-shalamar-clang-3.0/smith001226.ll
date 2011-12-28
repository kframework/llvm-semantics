; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith001226.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = global i32 0, align 4
@g_19 = global i32 -758613387, align 4
@g_36 = global i32* @g_2, align 8
@g_35 = global i32** @g_36, align 8
@g_38 = global i32* @g_19, align 8
@g_37 = global [4 x i32**] [i32** @g_38, i32** @g_38, i32** @g_38, i32** @g_38], align 16
@g_40 = global [2 x i32**] [i32** @g_38, i32** @g_38], align 16
@g_41 = global i32** @g_38, align 8
@func_10.l_13 = internal constant [10 x i8] c"\E3\E3\E3\E3\E3\E3\E3\E3\E3\E3", align 1
@.str = private unnamed_addr constant [19 x i8] c"checksum g_2 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [20 x i8] c"checksum g_19 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable {
  %1 = alloca i32, align 4
  %l_42 = alloca i32*, align 8
  %l_45 = alloca [10 x [8 x [1 x i16]]], align 16
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %l_7 = alloca i64, align 8
  %l_22 = alloca i32, align 4
  %l_33 = alloca i32*, align 8
  %l_32 = alloca i32**, align 8
  %l_39 = alloca i32**, align 8
  store i32* @g_19, i32** %l_42, align 8
  store i32 0, i32* %i, align 4
  br label %2

; <label>:2                                       ; preds = %31, %0
  %3 = load i32* %i, align 4
  %4 = icmp slt i32 %3, 10
  br i1 %4, label %5, label %34

; <label>:5                                       ; preds = %2
  store i32 0, i32* %j, align 4
  br label %6

; <label>:6                                       ; preds = %27, %5
  %7 = load i32* %j, align 4
  %8 = icmp slt i32 %7, 8
  br i1 %8, label %9, label %30

; <label>:9                                       ; preds = %6
  store i32 0, i32* %k, align 4
  br label %10

; <label>:10                                      ; preds = %23, %9
  %11 = load i32* %k, align 4
  %12 = icmp slt i32 %11, 1
  br i1 %12, label %13, label %26

; <label>:13                                      ; preds = %10
  %14 = load i32* %k, align 4
  %15 = sext i32 %14 to i64
  %16 = load i32* %j, align 4
  %17 = sext i32 %16 to i64
  %18 = load i32* %i, align 4
  %19 = sext i32 %18 to i64
  %20 = getelementptr inbounds [10 x [8 x [1 x i16]]]* %l_45, i32 0, i64 %19
  %21 = getelementptr inbounds [8 x [1 x i16]]* %20, i32 0, i64 %17
  %22 = getelementptr inbounds [1 x i16]* %21, i32 0, i64 %15
  store i16 -25014, i16* %22, align 2
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
  store volatile i32 0, i32* @g_2, align 4
  br label %35

; <label>:35                                      ; preds = %102, %34
  %36 = load volatile i32* @g_2, align 4
  %37 = icmp sge i32 %36, 27
  br i1 %37, label %38, label %105

; <label>:38                                      ; preds = %35
  store i64 -10, i64* %l_7, align 8
  store volatile i32 18, i32* @g_2, align 4
  br label %39

; <label>:39                                      ; preds = %45, %38
  %40 = load volatile i32* @g_2, align 4
  %41 = icmp sgt i32 %40, 0
  br i1 %41, label %42, label %50

; <label>:42                                      ; preds = %39
  %43 = load i64* %l_7, align 8
  %44 = trunc i64 %43 to i32
  store i32 %44, i32* %1
  br label %129
                                                  ; No predecessors!
  %46 = load volatile i32* @g_2, align 4
  %47 = trunc i32 %46 to i8
  %48 = call zeroext i8 @safe_add_func_uint8_t_u_u(i8 zeroext %47, i8 zeroext 1)
  %49 = zext i8 %48 to i32
  store volatile i32 %49, i32* @g_2, align 4
  br label %39

; <label>:50                                      ; preds = %39
  %51 = load volatile i32* @g_2, align 4
  %52 = trunc i32 %51 to i8
  %53 = call signext i8 @safe_add_func_int8_t_s_s(i8 signext 114, i8 signext %52)
  %54 = sext i8 %53 to i64
  %55 = call i32 @func_10(i64 %54, i8 signext 11)
  %56 = trunc i32 %55 to i8
  %57 = call zeroext i8 @safe_lshift_func_uint8_t_u_s(i8 zeroext %56, i32 -4)
  %58 = icmp ne i8 %57, 0
  br i1 %58, label %59, label %92

; <label>:59                                      ; preds = %50
  store i32 -1, i32* %l_22, align 4
  store i32* @g_19, i32** %l_33, align 8
  store i32** %l_33, i32*** %l_32, align 8
  %60 = load volatile i32* @g_2, align 4
  %61 = load i32* %l_22, align 4
  %62 = icmp ult i32 %60, %61
  %63 = zext i1 %62 to i32
  %64 = trunc i32 %63 to i16
  %65 = call signext i16 @safe_rshift_func_int16_t_s_u(i16 signext %64, i32 -2024953758)
  %66 = sext i16 %65 to i32
  %67 = icmp ne i32 %66, 0
  br i1 %67, label %77, label %68

; <label>:68                                      ; preds = %59
  %69 = load volatile i32* @g_2, align 4
  %70 = load i32* @g_19, align 4
  %71 = sext i32 %70 to i64
  %72 = load i32* @g_19, align 4
  %73 = call i32 @func_30(i32 %72)
  %74 = load i32* %l_22, align 4
  %75 = call i32 @func_23(i32 %69, i64 %71, i32 %73, i32 %74, i32* @g_19)
  %76 = icmp ne i32 %75, 0
  br label %77

; <label>:77                                      ; preds = %68, %59
  %78 = phi i1 [ true, %59 ], [ %76, %68 ]
  %79 = zext i1 %78 to i32
  %80 = icmp ne i32 0, %79
  %81 = zext i1 %80 to i32
  %82 = trunc i32 %81 to i8
  %83 = call i32* @func_16(i8 signext %82)
  %84 = load i32*** %l_32, align 8
  store i32* %83, i32** %84
  %85 = load i32* @g_19, align 4
  %86 = icmp ne i32 %85, 0
  br i1 %86, label %87, label %88

; <label>:87                                      ; preds = %77
  br label %89

; <label>:88                                      ; preds = %77
  br label %89

; <label>:89                                      ; preds = %88, %87
  %90 = load i32** %l_33, align 8
  store i32 -10, i32* %90
  %91 = load volatile i32*** @g_35, align 8
  store i32* @g_2, i32** %91
  br label %99

; <label>:92                                      ; preds = %50
  store i32** null, i32*** %l_39, align 8
  %93 = call i32* @func_16(i8 signext 0)
  %94 = load volatile i32*** @g_41, align 8
  store i32* %93, i32** %94
  store i32* null, i32** %l_42, align 8
  %95 = load i64* %l_7, align 8
  %96 = icmp ne i64 %95, 0
  br i1 %96, label %97, label %98

; <label>:97                                      ; preds = %92
  br label %102

; <label>:98                                      ; preds = %92
  br label %99

; <label>:99                                      ; preds = %98, %89
  %100 = load i64* %l_7, align 8
  %101 = trunc i64 %100 to i32
  store i32 %101, i32* %1
  br label %129

; <label>:102                                     ; preds = %97
  %103 = load volatile i32* @g_2, align 4
  %104 = call i32 @safe_add_func_int32_t_s_s(i32 %103, i32 1)
  store volatile i32 %104, i32* @g_2, align 4
  br label %35

; <label>:105                                     ; preds = %35
  store i32 0, i32* @g_19, align 4
  br label %106

; <label>:106                                     ; preds = %118, %105
  %107 = load i32* @g_19, align 4
  %108 = icmp sgt i32 %107, 22
  br i1 %108, label %109, label %123

; <label>:109                                     ; preds = %106
  %110 = load volatile i32*** @g_35, align 8
  %111 = load i32** %110
  %112 = load volatile i32* %111
  %113 = icmp ne i32 %112, 0
  br i1 %113, label %114, label %115

; <label>:114                                     ; preds = %109
  br label %123

; <label>:115                                     ; preds = %109
  %116 = load i32** @g_38, align 8
  %117 = load i32* %116
  store i32 %117, i32* %1
  br label %129
                                                  ; No predecessors!
  %119 = load i32* @g_19, align 4
  %120 = trunc i32 %119 to i8
  %121 = call zeroext i8 @safe_sub_func_uint8_t_u_u(i8 zeroext %120, i8 zeroext 1)
  %122 = zext i8 %121 to i32
  store i32 %122, i32* @g_19, align 4
  br label %106

; <label>:123                                     ; preds = %114, %106
  %124 = getelementptr inbounds [10 x [8 x [1 x i16]]]* %l_45, i32 0, i64 6
  %125 = getelementptr inbounds [8 x [1 x i16]]* %124, i32 0, i64 5
  %126 = getelementptr inbounds [1 x i16]* %125, i32 0, i64 0
  %127 = load i16* %126, align 2
  %128 = sext i16 %127 to i32
  store i32 %128, i32* %1
  br label %129

; <label>:129                                     ; preds = %123, %115, %99, %42
  %130 = load i32* %1
  ret i32 %130
}

define internal zeroext i8 @safe_add_func_uint8_t_u_u(i8 zeroext %ui1, i8 zeroext %ui2) nounwind uwtable {
  %1 = alloca i8, align 1
  %2 = alloca i8, align 1
  store i8 %ui1, i8* %1, align 1
  store i8 %ui2, i8* %2, align 1
  %3 = load i8* %1, align 1
  %4 = zext i8 %3 to i32
  %5 = load i8* %2, align 1
  %6 = zext i8 %5 to i32
  %7 = add nsw i32 %4, %6
  %8 = trunc i32 %7 to i8
  ret i8 %8
}

define internal zeroext i8 @safe_lshift_func_uint8_t_u_s(i8 zeroext %left, i32 %right) nounwind uwtable {
  %1 = alloca i8, align 1
  %2 = alloca i32, align 4
  store i8 %left, i8* %1, align 1
  store i32 %right, i32* %2, align 4
  %3 = load i32* %2, align 4
  %4 = icmp slt i32 %3, 0
  br i1 %4, label %14, label %5

; <label>:5                                       ; preds = %0
  %6 = load i32* %2, align 4
  %7 = icmp sge i32 %6, 32
  br i1 %7, label %14, label %8

; <label>:8                                       ; preds = %5
  %9 = load i8* %1, align 1
  %10 = zext i8 %9 to i32
  %11 = load i32* %2, align 4
  %12 = ashr i32 255, %11
  %13 = icmp sgt i32 %10, %12
  br i1 %13, label %14, label %17

; <label>:14                                      ; preds = %8, %5, %0
  %15 = load i8* %1, align 1
  %16 = zext i8 %15 to i32
  br label %22

; <label>:17                                      ; preds = %8
  %18 = load i8* %1, align 1
  %19 = zext i8 %18 to i32
  %20 = load i32* %2, align 4
  %21 = shl i32 %19, %20
  br label %22

; <label>:22                                      ; preds = %17, %14
  %23 = phi i32 [ %16, %14 ], [ %21, %17 ]
  %24 = trunc i32 %23 to i8
  ret i8 %24
}

define i32 @func_10(i64 %p_11, i8 signext %p_12) nounwind uwtable {
  %1 = alloca i64, align 8
  %2 = alloca i8, align 1
  %i = alloca i32, align 4
  store i64 %p_11, i64* %1, align 8
  store i8 %p_12, i8* %2, align 1
  %3 = load i8* getelementptr inbounds ([10 x i8]* @func_10.l_13, i32 0, i64 9), align 1
  %4 = sext i8 %3 to i32
  ret i32 %4
}

define internal signext i8 @safe_add_func_int8_t_s_s(i8 signext %si1, i8 signext %si2) nounwind uwtable {
  %1 = alloca i8, align 1
  %2 = alloca i8, align 1
  store i8 %si1, i8* %1, align 1
  store i8 %si2, i8* %2, align 1
  %3 = load i8* %1, align 1
  %4 = sext i8 %3 to i32
  %5 = load i8* %2, align 1
  %6 = sext i8 %5 to i32
  %7 = add nsw i32 %4, %6
  %8 = trunc i32 %7 to i8
  ret i8 %8
}

define i32* @func_16(i8 signext %p_17) nounwind uwtable {
  %1 = alloca i8, align 1
  %l_18 = alloca i32*, align 8
  store i8 %p_17, i8* %1, align 1
  store i32* @g_19, i32** %l_18, align 8
  %2 = load i32** %l_18, align 8
  store i32 1561159054, i32* %2
  %3 = load i32** %l_18, align 8
  ret i32* %3
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

define i32 @func_23(i32 %p_24, i64 %p_25, i32 %p_26, i32 %p_27, i32* %p_28) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i64, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32*, align 8
  %l_29 = alloca i32, align 4
  store i32 %p_24, i32* %1, align 4
  store i64 %p_25, i64* %2, align 8
  store i32 %p_26, i32* %3, align 4
  store i32 %p_27, i32* %4, align 4
  store i32* %p_28, i32** %5, align 8
  store i32 1, i32* %l_29, align 4
  %6 = load i32* %l_29, align 4
  %7 = load i32** %5, align 8
  store i32 %6, i32* %7
  %8 = load i32* %l_29, align 4
  ret i32 %8
}

define i32 @func_30(i32 %p_31) nounwind uwtable {
  %1 = alloca i32, align 4
  store i32 %p_31, i32* %1, align 4
  %2 = load i32* @g_19, align 4
  ret i32 %2
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

define internal zeroext i8 @safe_sub_func_uint8_t_u_u(i8 zeroext %ui1, i8 zeroext %ui2) nounwind uwtable {
  %1 = alloca i8, align 1
  %2 = alloca i8, align 1
  store i8 %ui1, i8* %1, align 1
  store i8 %ui2, i8* %2, align 1
  %3 = load i8* %1, align 1
  %4 = zext i8 %3 to i32
  %5 = load i8* %2, align 1
  %6 = zext i8 %5 to i32
  %7 = sub nsw i32 %4, %6
  %8 = trunc i32 %7 to i8
  ret i8 %8
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
  %5 = load volatile i32* @g_2, align 4
  %6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %5)
  %7 = load i32* @g_19, align 4
  %8 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str1, i32 0, i32 0), i32 %7)
  %9 = load i32* %1
  ret i32 %9
}

declare i32 @printf(i8*, ...)
