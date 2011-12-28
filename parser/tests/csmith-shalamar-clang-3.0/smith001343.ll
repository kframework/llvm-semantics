; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith001343.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_3 = global i32 6, align 4
@g_4 = global i32 -667774086, align 4
@g_5 = global i32 -1, align 4
@g_6 = global i32 1152217815, align 4
@g_11 = global i32 5, align 4
@g_18 = global i32 0, align 4
@.str = private unnamed_addr constant [19 x i8] c"checksum g_3 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [19 x i8] c"checksum g_4 = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [19 x i8] c"checksum g_5 = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [19 x i8] c"checksum g_6 = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [20 x i8] c"checksum g_11 = %d\0A\00", align 1
@.str5 = private unnamed_addr constant [20 x i8] c"checksum g_18 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define signext i8 @func_1() nounwind uwtable {
  %1 = alloca i8, align 1
  %l_2 = alloca [4 x [7 x [1 x [1 x i32]]]], align 16
  %l_10 = alloca i32*, align 8
  %l_20 = alloca i32, align 4
  %l_21 = alloca i16, align 2
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %l = alloca i32, align 4
  %l_7 = alloca i32**, align 8
  %l_9 = alloca i32*, align 8
  %l_8 = alloca [4 x [1 x i32**]], align 16
  %i1 = alloca i32, align 4
  %j2 = alloca i32, align 4
  %l_19 = alloca i32, align 4
  %l_14 = alloca i32, align 4
  %l_17 = alloca i32*, align 8
  store i32* @g_11, i32** %l_10, align 8
  store i32 2056334965, i32* %l_20, align 4
  store i16 -27884, i16* %l_21, align 2
  store i32 0, i32* %i, align 4
  br label %2

; <label>:2                                       ; preds = %42, %0
  %3 = load i32* %i, align 4
  %4 = icmp slt i32 %3, 4
  br i1 %4, label %5, label %45

; <label>:5                                       ; preds = %2
  store i32 0, i32* %j, align 4
  br label %6

; <label>:6                                       ; preds = %38, %5
  %7 = load i32* %j, align 4
  %8 = icmp slt i32 %7, 7
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
  %26 = getelementptr inbounds [4 x [7 x [1 x [1 x i32]]]]* %l_2, i32 0, i64 %25
  %27 = getelementptr inbounds [7 x [1 x [1 x i32]]]* %26, i32 0, i64 %23
  %28 = getelementptr inbounds [1 x [1 x i32]]* %27, i32 0, i64 %21
  %29 = getelementptr inbounds [1 x i32]* %28, i32 0, i64 %19
  store i32 -862936225, i32* %29, align 4
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
  store volatile i32 2, i32* @g_3, align 4
  br label %46

; <label>:46                                      ; preds = %127, %45
  %47 = load volatile i32* @g_3, align 4
  %48 = icmp slt i32 %47, 4
  br i1 %48, label %49, label %130

; <label>:49                                      ; preds = %46
  store i32 3, i32* @g_4, align 4
  br label %50

; <label>:50                                      ; preds = %123, %49
  %51 = load i32* @g_4, align 4
  %52 = icmp slt i32 %51, 7
  br i1 %52, label %53, label %126

; <label>:53                                      ; preds = %50
  store volatile i32 0, i32* @g_5, align 4
  br label %54

; <label>:54                                      ; preds = %119, %53
  %55 = load volatile i32* @g_5, align 4
  %56 = icmp slt i32 %55, 1
  br i1 %56, label %57, label %122

; <label>:57                                      ; preds = %54
  store volatile i32 0, i32* @g_6, align 4
  br label %58

; <label>:58                                      ; preds = %115, %57
  %59 = load volatile i32* @g_6, align 4
  %60 = icmp slt i32 %59, 1
  br i1 %60, label %61, label %118

; <label>:61                                      ; preds = %58
  store i32** null, i32*** %l_7, align 8
  store i32* @g_6, i32** %l_9, align 8
  store i32 0, i32* %i1, align 4
  br label %62

; <label>:62                                      ; preds = %80, %61
  %63 = load i32* %i1, align 4
  %64 = icmp slt i32 %63, 4
  br i1 %64, label %65, label %83

; <label>:65                                      ; preds = %62
  store i32 0, i32* %j2, align 4
  br label %66

; <label>:66                                      ; preds = %76, %65
  %67 = load i32* %j2, align 4
  %68 = icmp slt i32 %67, 1
  br i1 %68, label %69, label %79

; <label>:69                                      ; preds = %66
  %70 = load i32* %j2, align 4
  %71 = sext i32 %70 to i64
  %72 = load i32* %i1, align 4
  %73 = sext i32 %72 to i64
  %74 = getelementptr inbounds [4 x [1 x i32**]]* %l_8, i32 0, i64 %73
  %75 = getelementptr inbounds [1 x i32**]* %74, i32 0, i64 %71
  store i32** %l_9, i32*** %75, align 8
  br label %76

; <label>:76                                      ; preds = %69
  %77 = load i32* %j2, align 4
  %78 = add nsw i32 %77, 1
  store i32 %78, i32* %j2, align 4
  br label %66

; <label>:79                                      ; preds = %66
  br label %80

; <label>:80                                      ; preds = %79
  %81 = load i32* %i1, align 4
  %82 = add nsw i32 %81, 1
  store i32 %82, i32* %i1, align 4
  br label %62

; <label>:83                                      ; preds = %62
  store i32* @g_5, i32** %l_10, align 8
  %84 = load i32** %l_10, align 8
  %85 = load volatile i32* %84
  %86 = icmp ne i32 %85, 0
  br i1 %86, label %87, label %113

; <label>:87                                      ; preds = %83
  store i32 2076750881, i32* %l_19, align 4
  store volatile i32 0, i32* @g_11, align 4
  br label %88

; <label>:88                                      ; preds = %94, %87
  %89 = load volatile i32* @g_11, align 4
  %90 = icmp sle i32 %89, 0
  br i1 %90, label %91, label %97

; <label>:91                                      ; preds = %88
  store i32 -1, i32* %l_14, align 4
  %92 = load i32* %l_14, align 4
  %93 = trunc i32 %92 to i8
  store i8 %93, i8* %1
  br label %133
                                                  ; No predecessors!
  %95 = load volatile i32* @g_11, align 4
  %96 = call i32 @safe_sub_func_int32_t_s_s(i32 %95, i32 1)
  store volatile i32 %96, i32* @g_11, align 4
  br label %88

; <label>:97                                      ; preds = %88
  store volatile i32 0, i32* @g_11, align 4
  br label %98

; <label>:98                                      ; preds = %108, %97
  %99 = load volatile i32* @g_11, align 4
  %100 = icmp ne i32 %99, 0
  br i1 %100, label %101, label %111

; <label>:101                                     ; preds = %98
  store i32* @g_18, i32** %l_17, align 8
  %102 = load volatile i32* @g_6, align 4
  %103 = load i32** %l_17, align 8
  %104 = load i32* %103
  %105 = xor i32 %104, %102
  store i32 %105, i32* %103
  %106 = load i32* @g_18, align 4
  %107 = trunc i32 %106 to i8
  store i8 %107, i8* %1
  br label %133
                                                  ; No predecessors!
  %109 = load volatile i32* @g_11, align 4
  %110 = call i32 @safe_add_func_int32_t_s_s(i32 %109, i32 1)
  store volatile i32 %110, i32* @g_11, align 4
  br label %98

; <label>:111                                     ; preds = %98
  %112 = load i32* %l_19, align 4
  store i32 %112, i32* %l_20, align 4
  br label %114

; <label>:113                                     ; preds = %83
  store volatile i32 1999738600, i32* @g_11, align 4
  br label %114

; <label>:114                                     ; preds = %113, %111
  br label %115

; <label>:115                                     ; preds = %114
  %116 = load volatile i32* @g_6, align 4
  %117 = add nsw i32 %116, 1
  store volatile i32 %117, i32* @g_6, align 4
  br label %58

; <label>:118                                     ; preds = %58
  br label %119

; <label>:119                                     ; preds = %118
  %120 = load volatile i32* @g_5, align 4
  %121 = add nsw i32 %120, 1
  store volatile i32 %121, i32* @g_5, align 4
  br label %54

; <label>:122                                     ; preds = %54
  br label %123

; <label>:123                                     ; preds = %122
  %124 = load i32* @g_4, align 4
  %125 = add nsw i32 %124, 1
  store i32 %125, i32* @g_4, align 4
  br label %50

; <label>:126                                     ; preds = %50
  br label %127

; <label>:127                                     ; preds = %126
  %128 = load volatile i32* @g_3, align 4
  %129 = add nsw i32 %128, 3
  store volatile i32 %129, i32* @g_3, align 4
  br label %46

; <label>:130                                     ; preds = %46
  %131 = load i16* %l_21, align 2
  %132 = trunc i16 %131 to i8
  store i8 %132, i8* %1
  br label %133

; <label>:133                                     ; preds = %130, %101, %91
  %134 = load i8* %1
  ret i8 %134
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

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  %4 = call signext i8 @func_1()
  %5 = load volatile i32* @g_3, align 4
  %6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %5)
  %7 = load i32* @g_4, align 4
  %8 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str1, i32 0, i32 0), i32 %7)
  %9 = load volatile i32* @g_5, align 4
  %10 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str2, i32 0, i32 0), i32 %9)
  %11 = load volatile i32* @g_6, align 4
  %12 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str3, i32 0, i32 0), i32 %11)
  %13 = load volatile i32* @g_11, align 4
  %14 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str4, i32 0, i32 0), i32 %13)
  %15 = load i32* @g_18, align 4
  %16 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str5, i32 0, i32 0), i32 %15)
  %17 = load i32* %1
  ret i32 %17
}

declare i32 @printf(i8*, ...)
