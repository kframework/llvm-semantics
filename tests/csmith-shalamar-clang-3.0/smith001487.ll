; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith001487.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_12 = constant i32 -2, align 4
@g_14 = global [9 x i32] [i32 -75465478, i32 -75465478, i32 -75465478, i32 -75465478, i32 -75465478, i32 -75465478, i32 -75465478, i32 -75465478, i32 -75465478], align 16
@g_22 = global [9 x [5 x i32*]] zeroinitializer, align 16
@g_24 = global i32 242716774, align 4
@g_23 = global i32* @g_24, align 8
@g_49 = global i32* null, align 8
@g_48 = global [7 x i32**] [i32** @g_49, i32** @g_49, i32** @g_49, i32** @g_49, i32** @g_49, i32** @g_49, i32** @g_49], align 16
@g_50 = global i32** null, align 8
@g_51 = global [9 x [1 x [6 x [1 x [1 x [1 x i32**]]]]]] [[1 x [6 x [1 x [1 x [1 x i32**]]]]] [[6 x [1 x [1 x [1 x i32**]]]] [[1 x [1 x [1 x i32**]]] [[1 x [1 x i32**]] [[1 x i32**] [i32** @g_49]]], [1 x [1 x [1 x i32**]]] [[1 x [1 x i32**]] [[1 x i32**] [i32** @g_49]]], [1 x [1 x [1 x i32**]]] [[1 x [1 x i32**]] [[1 x i32**] [i32** @g_49]]], [1 x [1 x [1 x i32**]]] [[1 x [1 x i32**]] [[1 x i32**] [i32** @g_49]]], [1 x [1 x [1 x i32**]]] [[1 x [1 x i32**]] [[1 x i32**] [i32** @g_49]]], [1 x [1 x [1 x i32**]]] [[1 x [1 x i32**]] [[1 x i32**] [i32** @g_49]]]]], [1 x [6 x [1 x [1 x [1 x i32**]]]]] [[6 x [1 x [1 x [1 x i32**]]]] [[1 x [1 x [1 x i32**]]] [[1 x [1 x i32**]] [[1 x i32**] [i32** @g_49]]], [1 x [1 x [1 x i32**]]] [[1 x [1 x i32**]] [[1 x i32**] [i32** @g_49]]], [1 x [1 x [1 x i32**]]] [[1 x [1 x i32**]] [[1 x i32**] [i32** @g_49]]], [1 x [1 x [1 x i32**]]] [[1 x [1 x i32**]] [[1 x i32**] [i32** @g_49]]], [1 x [1 x [1 x i32**]]] [[1 x [1 x i32**]] [[1 x i32**] [i32** @g_49]]], [1 x [1 x [1 x i32**]]] [[1 x [1 x i32**]] [[1 x i32**] [i32** @g_49]]]]], [1 x [6 x [1 x [1 x [1 x i32**]]]]] [[6 x [1 x [1 x [1 x i32**]]]] [[1 x [1 x [1 x i32**]]] [[1 x [1 x i32**]] [[1 x i32**] [i32** @g_49]]], [1 x [1 x [1 x i32**]]] [[1 x [1 x i32**]] [[1 x i32**] [i32** @g_49]]], [1 x [1 x [1 x i32**]]] [[1 x [1 x i32**]] [[1 x i32**] [i32** @g_49]]], [1 x [1 x [1 x i32**]]] [[1 x [1 x i32**]] [[1 x i32**] [i32** @g_49]]], [1 x [1 x [1 x i32**]]] [[1 x [1 x i32**]] [[1 x i32**] [i32** @g_49]]], [1 x [1 x [1 x i32**]]] [[1 x [1 x i32**]] [[1 x i32**] [i32** @g_49]]]]], [1 x [6 x [1 x [1 x [1 x i32**]]]]] [[6 x [1 x [1 x [1 x i32**]]]] [[1 x [1 x [1 x i32**]]] [[1 x [1 x i32**]] [[1 x i32**] [i32** @g_49]]], [1 x [1 x [1 x i32**]]] [[1 x [1 x i32**]] [[1 x i32**] [i32** @g_49]]], [1 x [1 x [1 x i32**]]] [[1 x [1 x i32**]] [[1 x i32**] [i32** @g_49]]], [1 x [1 x [1 x i32**]]] [[1 x [1 x i32**]] [[1 x i32**] [i32** @g_49]]], [1 x [1 x [1 x i32**]]] [[1 x [1 x i32**]] [[1 x i32**] [i32** @g_49]]], [1 x [1 x [1 x i32**]]] [[1 x [1 x i32**]] [[1 x i32**] [i32** @g_49]]]]], [1 x [6 x [1 x [1 x [1 x i32**]]]]] [[6 x [1 x [1 x [1 x i32**]]]] [[1 x [1 x [1 x i32**]]] [[1 x [1 x i32**]] [[1 x i32**] [i32** @g_49]]], [1 x [1 x [1 x i32**]]] [[1 x [1 x i32**]] [[1 x i32**] [i32** @g_49]]], [1 x [1 x [1 x i32**]]] [[1 x [1 x i32**]] [[1 x i32**] [i32** @g_49]]], [1 x [1 x [1 x i32**]]] [[1 x [1 x i32**]] [[1 x i32**] [i32** @g_49]]], [1 x [1 x [1 x i32**]]] [[1 x [1 x i32**]] [[1 x i32**] [i32** @g_49]]], [1 x [1 x [1 x i32**]]] [[1 x [1 x i32**]] [[1 x i32**] [i32** @g_49]]]]], [1 x [6 x [1 x [1 x [1 x i32**]]]]] [[6 x [1 x [1 x [1 x i32**]]]] [[1 x [1 x [1 x i32**]]] [[1 x [1 x i32**]] [[1 x i32**] [i32** @g_49]]], [1 x [1 x [1 x i32**]]] [[1 x [1 x i32**]] [[1 x i32**] [i32** @g_49]]], [1 x [1 x [1 x i32**]]] [[1 x [1 x i32**]] [[1 x i32**] [i32** @g_49]]], [1 x [1 x [1 x i32**]]] [[1 x [1 x i32**]] [[1 x i32**] [i32** @g_49]]], [1 x [1 x [1 x i32**]]] [[1 x [1 x i32**]] [[1 x i32**] [i32** @g_49]]], [1 x [1 x [1 x i32**]]] [[1 x [1 x i32**]] [[1 x i32**] [i32** @g_49]]]]], [1 x [6 x [1 x [1 x [1 x i32**]]]]] [[6 x [1 x [1 x [1 x i32**]]]] [[1 x [1 x [1 x i32**]]] [[1 x [1 x i32**]] [[1 x i32**] [i32** @g_49]]], [1 x [1 x [1 x i32**]]] [[1 x [1 x i32**]] [[1 x i32**] [i32** @g_49]]], [1 x [1 x [1 x i32**]]] [[1 x [1 x i32**]] [[1 x i32**] [i32** @g_49]]], [1 x [1 x [1 x i32**]]] [[1 x [1 x i32**]] [[1 x i32**] [i32** @g_49]]], [1 x [1 x [1 x i32**]]] [[1 x [1 x i32**]] [[1 x i32**] [i32** @g_49]]], [1 x [1 x [1 x i32**]]] [[1 x [1 x i32**]] [[1 x i32**] [i32** @g_49]]]]], [1 x [6 x [1 x [1 x [1 x i32**]]]]] [[6 x [1 x [1 x [1 x i32**]]]] [[1 x [1 x [1 x i32**]]] [[1 x [1 x i32**]] [[1 x i32**] [i32** @g_49]]], [1 x [1 x [1 x i32**]]] [[1 x [1 x i32**]] [[1 x i32**] [i32** @g_49]]], [1 x [1 x [1 x i32**]]] [[1 x [1 x i32**]] [[1 x i32**] [i32** @g_49]]], [1 x [1 x [1 x i32**]]] [[1 x [1 x i32**]] [[1 x i32**] [i32** @g_49]]], [1 x [1 x [1 x i32**]]] [[1 x [1 x i32**]] [[1 x i32**] [i32** @g_49]]], [1 x [1 x [1 x i32**]]] [[1 x [1 x i32**]] [[1 x i32**] [i32** @g_49]]]]], [1 x [6 x [1 x [1 x [1 x i32**]]]]] [[6 x [1 x [1 x [1 x i32**]]]] [[1 x [1 x [1 x i32**]]] [[1 x [1 x i32**]] [[1 x i32**] [i32** @g_49]]], [1 x [1 x [1 x i32**]]] [[1 x [1 x i32**]] [[1 x i32**] [i32** @g_49]]], [1 x [1 x [1 x i32**]]] [[1 x [1 x i32**]] [[1 x i32**] [i32** @g_49]]], [1 x [1 x [1 x i32**]]] [[1 x [1 x i32**]] [[1 x i32**] [i32** @g_49]]], [1 x [1 x [1 x i32**]]] [[1 x [1 x i32**]] [[1 x i32**] [i32** @g_49]]], [1 x [1 x [1 x i32**]]] [[1 x [1 x i32**]] [[1 x i32**] [i32** @g_49]]]]]], align 16
@g_52 = global i32** null, align 8
@.str = private unnamed_addr constant [20 x i8] c"checksum g_12 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [23 x i8] c"checksum g_14[0] = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [23 x i8] c"checksum g_14[1] = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [23 x i8] c"checksum g_14[2] = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [23 x i8] c"checksum g_14[3] = %d\0A\00", align 1
@.str5 = private unnamed_addr constant [23 x i8] c"checksum g_14[4] = %d\0A\00", align 1
@.str6 = private unnamed_addr constant [23 x i8] c"checksum g_14[5] = %d\0A\00", align 1
@.str7 = private unnamed_addr constant [23 x i8] c"checksum g_14[6] = %d\0A\00", align 1
@.str8 = private unnamed_addr constant [23 x i8] c"checksum g_14[7] = %d\0A\00", align 1
@.str9 = private unnamed_addr constant [23 x i8] c"checksum g_14[8] = %d\0A\00", align 1
@.str10 = private unnamed_addr constant [20 x i8] c"checksum g_24 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define signext i8 @func_1() nounwind uwtable {
  %1 = alloca i8, align 1
  %l_13 = alloca i16, align 2
  %l_60 = alloca i32, align 4
  %l_63 = alloca i64, align 8
  %l_26 = alloca i32, align 4
  %l_30 = alloca i32, align 4
  %l_47 = alloca [5 x [6 x i32*]], align 16
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %l_21 = alloca [9 x [1 x [10 x [1 x [1 x [1 x [1 x [1 x i32]]]]]]]], align 16
  %l_35 = alloca i32*, align 8
  %l_53 = alloca i32**, align 8
  %i1 = alloca i32, align 4
  %j2 = alloca i32, align 4
  %k = alloca i32, align 4
  %l = alloca i32, align 4
  %m = alloca i32, align 4
  %n = alloca i32, align 4
  %o = alloca i32, align 4
  %p = alloca i32, align 4
  %l_25 = alloca [3 x i32*], align 16
  %l_27 = alloca i16, align 2
  %i3 = alloca i32, align 4
  store i16 -3, i16* %l_13, align 2
  store i32 1, i32* %l_60, align 4
  store i64 -3470062506014656151, i64* %l_63, align 8
  %2 = load i16* %l_13, align 2
  %3 = sext i16 %2 to i32
  %4 = call i32 @func_7(i8 signext -2, i8 zeroext -2, i32 %3)
  %5 = xor i32 %4, -1
  %6 = load i16* %l_13, align 2
  %7 = sext i16 %6 to i32
  %8 = call i32 @func_7(i8 signext -2, i8 zeroext -2, i32 %7)
  %9 = or i32 %8, -2
  %10 = icmp ult i32 %5, %9
  %11 = zext i1 %10 to i32
  %12 = trunc i32 %11 to i8
  %13 = call signext i8 @safe_add_func_int8_t_s_s(i8 signext %12, i8 signext -2)
  %14 = sext i8 %13 to i16
  %15 = call zeroext i16 @safe_rshift_func_uint16_t_u_s(i16 zeroext %14, i32 -1139773754)
  %16 = call zeroext i16 @safe_unary_minus_func_uint16_t_u(i16 zeroext %15)
  %17 = icmp ne i16 %16, 0
  br i1 %17, label %18, label %19

; <label>:18                                      ; preds = %0
  store i8 -2, i8* %1
  br label %255

; <label>:19                                      ; preds = %0
  store i32 1321722648, i32* %l_26, align 4
  store i32 1098880481, i32* %l_30, align 4
  store i32 0, i32* %i, align 4
  br label %20

; <label>:20                                      ; preds = %38, %19
  %21 = load i32* %i, align 4
  %22 = icmp slt i32 %21, 5
  br i1 %22, label %23, label %41

; <label>:23                                      ; preds = %20
  store i32 0, i32* %j, align 4
  br label %24

; <label>:24                                      ; preds = %34, %23
  %25 = load i32* %j, align 4
  %26 = icmp slt i32 %25, 6
  br i1 %26, label %27, label %37

; <label>:27                                      ; preds = %24
  %28 = load i32* %j, align 4
  %29 = sext i32 %28 to i64
  %30 = load i32* %i, align 4
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds [5 x [6 x i32*]]* %l_47, i32 0, i64 %31
  %33 = getelementptr inbounds [6 x i32*]* %32, i32 0, i64 %29
  store i32* @g_24, i32** %33, align 8
  br label %34

; <label>:34                                      ; preds = %27
  %35 = load i32* %j, align 4
  %36 = add nsw i32 %35, 1
  store i32 %36, i32* %j, align 4
  br label %24

; <label>:37                                      ; preds = %24
  br label %38

; <label>:38                                      ; preds = %37
  %39 = load i32* %i, align 4
  %40 = add nsw i32 %39, 1
  store i32 %40, i32* %i, align 4
  br label %20

; <label>:41                                      ; preds = %20
  store i16 2, i16* %l_13, align 2
  br label %42

; <label>:42                                      ; preds = %227, %41
  %43 = load i16* %l_13, align 2
  %44 = sext i16 %43 to i32
  %45 = icmp slt i32 %44, 9
  br i1 %45, label %46, label %232

; <label>:46                                      ; preds = %42
  store i32* %l_26, i32** %l_35, align 8
  store i32** %l_35, i32*** %l_53, align 8
  store i32 0, i32* %i1, align 4
  br label %47

; <label>:47                                      ; preds = %131, %46
  %48 = load i32* %i1, align 4
  %49 = icmp slt i32 %48, 9
  br i1 %49, label %50, label %134

; <label>:50                                      ; preds = %47
  store i32 0, i32* %j2, align 4
  br label %51

; <label>:51                                      ; preds = %127, %50
  %52 = load i32* %j2, align 4
  %53 = icmp slt i32 %52, 1
  br i1 %53, label %54, label %130

; <label>:54                                      ; preds = %51
  store i32 0, i32* %k, align 4
  br label %55

; <label>:55                                      ; preds = %123, %54
  %56 = load i32* %k, align 4
  %57 = icmp slt i32 %56, 10
  br i1 %57, label %58, label %126

; <label>:58                                      ; preds = %55
  store i32 0, i32* %l, align 4
  br label %59

; <label>:59                                      ; preds = %119, %58
  %60 = load i32* %l, align 4
  %61 = icmp slt i32 %60, 1
  br i1 %61, label %62, label %122

; <label>:62                                      ; preds = %59
  store i32 0, i32* %m, align 4
  br label %63

; <label>:63                                      ; preds = %115, %62
  %64 = load i32* %m, align 4
  %65 = icmp slt i32 %64, 1
  br i1 %65, label %66, label %118

; <label>:66                                      ; preds = %63
  store i32 0, i32* %n, align 4
  br label %67

; <label>:67                                      ; preds = %111, %66
  %68 = load i32* %n, align 4
  %69 = icmp slt i32 %68, 1
  br i1 %69, label %70, label %114

; <label>:70                                      ; preds = %67
  store i32 0, i32* %o, align 4
  br label %71

; <label>:71                                      ; preds = %107, %70
  %72 = load i32* %o, align 4
  %73 = icmp slt i32 %72, 1
  br i1 %73, label %74, label %110

; <label>:74                                      ; preds = %71
  store i32 0, i32* %p, align 4
  br label %75

; <label>:75                                      ; preds = %103, %74
  %76 = load i32* %p, align 4
  %77 = icmp slt i32 %76, 1
  br i1 %77, label %78, label %106

; <label>:78                                      ; preds = %75
  %79 = load i32* %p, align 4
  %80 = sext i32 %79 to i64
  %81 = load i32* %o, align 4
  %82 = sext i32 %81 to i64
  %83 = load i32* %n, align 4
  %84 = sext i32 %83 to i64
  %85 = load i32* %m, align 4
  %86 = sext i32 %85 to i64
  %87 = load i32* %l, align 4
  %88 = sext i32 %87 to i64
  %89 = load i32* %k, align 4
  %90 = sext i32 %89 to i64
  %91 = load i32* %j2, align 4
  %92 = sext i32 %91 to i64
  %93 = load i32* %i1, align 4
  %94 = sext i32 %93 to i64
  %95 = getelementptr inbounds [9 x [1 x [10 x [1 x [1 x [1 x [1 x [1 x i32]]]]]]]]* %l_21, i32 0, i64 %94
  %96 = getelementptr inbounds [1 x [10 x [1 x [1 x [1 x [1 x [1 x i32]]]]]]]* %95, i32 0, i64 %92
  %97 = getelementptr inbounds [10 x [1 x [1 x [1 x [1 x [1 x i32]]]]]]* %96, i32 0, i64 %90
  %98 = getelementptr inbounds [1 x [1 x [1 x [1 x [1 x i32]]]]]* %97, i32 0, i64 %88
  %99 = getelementptr inbounds [1 x [1 x [1 x [1 x i32]]]]* %98, i32 0, i64 %86
  %100 = getelementptr inbounds [1 x [1 x [1 x i32]]]* %99, i32 0, i64 %84
  %101 = getelementptr inbounds [1 x [1 x i32]]* %100, i32 0, i64 %82
  %102 = getelementptr inbounds [1 x i32]* %101, i32 0, i64 %80
  store i32 2044695681, i32* %102, align 4
  br label %103

; <label>:103                                     ; preds = %78
  %104 = load i32* %p, align 4
  %105 = add nsw i32 %104, 1
  store i32 %105, i32* %p, align 4
  br label %75

; <label>:106                                     ; preds = %75
  br label %107

; <label>:107                                     ; preds = %106
  %108 = load i32* %o, align 4
  %109 = add nsw i32 %108, 1
  store i32 %109, i32* %o, align 4
  br label %71

; <label>:110                                     ; preds = %71
  br label %111

; <label>:111                                     ; preds = %110
  %112 = load i32* %n, align 4
  %113 = add nsw i32 %112, 1
  store i32 %113, i32* %n, align 4
  br label %67

; <label>:114                                     ; preds = %67
  br label %115

; <label>:115                                     ; preds = %114
  %116 = load i32* %m, align 4
  %117 = add nsw i32 %116, 1
  store i32 %117, i32* %m, align 4
  br label %63

; <label>:118                                     ; preds = %63
  br label %119

; <label>:119                                     ; preds = %118
  %120 = load i32* %l, align 4
  %121 = add nsw i32 %120, 1
  store i32 %121, i32* %l, align 4
  br label %59

; <label>:122                                     ; preds = %59
  br label %123

; <label>:123                                     ; preds = %122
  %124 = load i32* %k, align 4
  %125 = add nsw i32 %124, 1
  store i32 %125, i32* %k, align 4
  br label %55

; <label>:126                                     ; preds = %55
  br label %127

; <label>:127                                     ; preds = %126
  %128 = load i32* %j2, align 4
  %129 = add nsw i32 %128, 1
  store i32 %129, i32* %j2, align 4
  br label %51

; <label>:130                                     ; preds = %51
  br label %131

; <label>:131                                     ; preds = %130
  %132 = load i32* %i1, align 4
  %133 = add nsw i32 %132, 1
  store i32 %133, i32* %i1, align 4
  br label %47

; <label>:134                                     ; preds = %47
  %135 = load i32* getelementptr inbounds ([9 x i32]* @g_14, i32 0, i64 7), align 4
  %136 = load i16* %l_13, align 2
  %137 = zext i16 %136 to i32
  %138 = srem i32 %137, 9
  %139 = sext i32 %138 to i64
  %140 = getelementptr inbounds [9 x i32]* @g_14, i32 0, i64 %139
  %141 = load i32* %140, align 4
  %142 = or i32 %135, %141
  %143 = load i16* %l_13, align 2
  %144 = trunc i16 %143 to i8
  %145 = load i32* getelementptr inbounds ([9 x i32]* @g_14, i32 0, i64 5), align 4
  %146 = xor i32 -2, %145
  %147 = call zeroext i8 @safe_rshift_func_uint8_t_u_s(i8 zeroext %144, i32 %146)
  %148 = zext i8 %147 to i16
  %149 = load i16* %l_13, align 2
  %150 = zext i16 %149 to i32
  %151 = srem i32 %150, 9
  %152 = sext i32 %151 to i64
  %153 = getelementptr inbounds [9 x i32]* @g_14, i32 0, i64 %152
  %154 = load i32* %153, align 4
  %155 = trunc i32 %154 to i16
  %156 = call signext i16 @safe_mod_func_int16_t_s_s(i16 signext %148, i16 signext %155)
  %157 = sext i16 %156 to i32
  %158 = getelementptr inbounds [9 x [1 x [10 x [1 x [1 x [1 x [1 x [1 x i32]]]]]]]]* %l_21, i32 0, i64 1
  %159 = getelementptr inbounds [1 x [10 x [1 x [1 x [1 x [1 x [1 x i32]]]]]]]* %158, i32 0, i64 0
  %160 = getelementptr inbounds [10 x [1 x [1 x [1 x [1 x [1 x i32]]]]]]* %159, i32 0, i64 9
  %161 = getelementptr inbounds [1 x [1 x [1 x [1 x [1 x i32]]]]]* %160, i32 0, i64 0
  %162 = getelementptr inbounds [1 x [1 x [1 x [1 x i32]]]]* %161, i32 0, i64 0
  %163 = getelementptr inbounds [1 x [1 x [1 x i32]]]* %162, i32 0, i64 0
  %164 = getelementptr inbounds [1 x [1 x i32]]* %163, i32 0, i64 0
  %165 = getelementptr inbounds [1 x i32]* %164, i32 0, i64 0
  %166 = load i32* %165, align 4
  %167 = icmp ne i32 %157, %166
  %168 = zext i1 %167 to i32
  %169 = trunc i32 %168 to i8
  %170 = load i32* getelementptr inbounds ([9 x i32]* @g_14, i32 0, i64 3), align 4
  %171 = call zeroext i8 @safe_rshift_func_uint8_t_u_s(i8 zeroext %169, i32 %170)
  %172 = zext i8 %171 to i32
  %173 = icmp sgt i32 %142, %172
  br i1 %173, label %174, label %177

; <label>:174                                     ; preds = %134
  %175 = load i16* %l_13, align 2
  %176 = trunc i16 %175 to i8
  store i8 %176, i8* %1
  br label %255

; <label>:177                                     ; preds = %134
  store i16 23165, i16* %l_27, align 2
  store i32 0, i32* %i3, align 4
  br label %178

; <label>:178                                     ; preds = %193, %177
  %179 = load i32* %i3, align 4
  %180 = icmp slt i32 %179, 3
  br i1 %180, label %181, label %196

; <label>:181                                     ; preds = %178
  %182 = getelementptr inbounds [9 x [1 x [10 x [1 x [1 x [1 x [1 x [1 x i32]]]]]]]]* %l_21, i32 0, i64 8
  %183 = getelementptr inbounds [1 x [10 x [1 x [1 x [1 x [1 x [1 x i32]]]]]]]* %182, i32 0, i64 0
  %184 = getelementptr inbounds [10 x [1 x [1 x [1 x [1 x [1 x i32]]]]]]* %183, i32 0, i64 4
  %185 = getelementptr inbounds [1 x [1 x [1 x [1 x [1 x i32]]]]]* %184, i32 0, i64 0
  %186 = getelementptr inbounds [1 x [1 x [1 x [1 x i32]]]]* %185, i32 0, i64 0
  %187 = getelementptr inbounds [1 x [1 x [1 x i32]]]* %186, i32 0, i64 0
  %188 = getelementptr inbounds [1 x [1 x i32]]* %187, i32 0, i64 0
  %189 = getelementptr inbounds [1 x i32]* %188, i32 0, i64 0
  %190 = load i32* %i3, align 4
  %191 = sext i32 %190 to i64
  %192 = getelementptr inbounds [3 x i32*]* %l_25, i32 0, i64 %191
  store i32* %189, i32** %192, align 8
  br label %193

; <label>:193                                     ; preds = %181
  %194 = load i32* %i3, align 4
  %195 = add nsw i32 %194, 1
  store i32 %195, i32* %i3, align 4
  br label %178

; <label>:196                                     ; preds = %178
  %197 = load i16* %l_13, align 2
  %198 = zext i16 %197 to i32
  %199 = srem i32 %198, 9
  %200 = sext i32 %199 to i64
  %201 = getelementptr inbounds [9 x i32]* @g_14, i32 0, i64 %200
  %202 = load i32* %201, align 4
  %203 = load volatile i32** @g_23, align 8
  %204 = load i32* %203
  %205 = xor i32 %204, %202
  store i32 %205, i32* %203
  %206 = load i16* %l_13, align 2
  %207 = sext i16 %206 to i32
  store i32 %207, i32* %l_26, align 4
  %208 = load i16* %l_27, align 2
  %209 = icmp ne i16 %208, 0
  br i1 %209, label %210, label %211

; <label>:210                                     ; preds = %196
  br label %232

; <label>:211                                     ; preds = %196
  %212 = getelementptr inbounds [9 x [1 x [10 x [1 x [1 x [1 x [1 x [1 x i32]]]]]]]]* %l_21, i32 0, i64 1
  %213 = getelementptr inbounds [1 x [10 x [1 x [1 x [1 x [1 x [1 x i32]]]]]]]* %212, i32 0, i64 0
  %214 = getelementptr inbounds [10 x [1 x [1 x [1 x [1 x [1 x i32]]]]]]* %213, i32 0, i64 9
  %215 = getelementptr inbounds [1 x [1 x [1 x [1 x [1 x i32]]]]]* %214, i32 0, i64 0
  %216 = getelementptr inbounds [1 x [1 x [1 x [1 x i32]]]]* %215, i32 0, i64 0
  %217 = getelementptr inbounds [1 x [1 x [1 x i32]]]* %216, i32 0, i64 0
  %218 = getelementptr inbounds [1 x [1 x i32]]* %217, i32 0, i64 0
  %219 = getelementptr inbounds [1 x i32]* %218, i32 0, i64 0
  %220 = load i32* %219, align 4
  %221 = load i16* %l_13, align 2
  %222 = sext i16 %221 to i32
  %223 = call signext i8 @safe_rshift_func_int8_t_s_u(i8 signext -88, i32 %222)
  %224 = sext i8 %223 to i32
  %225 = and i32 %220, %224
  store i32 %225, i32* %l_30, align 4
  br label %226

; <label>:226                                     ; preds = %211
  br label %227

; <label>:227                                     ; preds = %226
  %228 = load i16* %l_13, align 2
  %229 = sext i16 %228 to i32
  %230 = add nsw i32 %229, 7
  %231 = trunc i32 %230 to i16
  store i16 %231, i16* %l_13, align 2
  br label %42

; <label>:232                                     ; preds = %210, %42
  store i32 0, i32* %l_26, align 4
  br label %233

; <label>:233                                     ; preds = %241, %232
  %234 = load i32* %l_26, align 4
  %235 = icmp eq i32 %234, 2
  br i1 %235, label %236, label %246

; <label>:236                                     ; preds = %233
  %237 = load volatile i32** @g_23, align 8
  %238 = load i32* %237
  store i32 %238, i32* %l_60, align 4
  %239 = load i32* getelementptr inbounds ([9 x i32]* @g_14, i32 0, i64 7), align 4
  %240 = trunc i32 %239 to i8
  store i8 %240, i8* %1
  br label %255
                                                  ; No predecessors!
  %242 = load i32* %l_26, align 4
  %243 = sext i32 %242 to i64
  %244 = call i64 @safe_add_func_uint64_t_u_u(i64 %243, i64 1)
  %245 = trunc i64 %244 to i32
  store i32 %245, i32* %l_26, align 4
  br label %233

; <label>:246                                     ; preds = %233
  %247 = load volatile i32** @g_23, align 8
  %248 = load i32* %247
  %249 = trunc i32 %248 to i8
  %250 = call signext i8 @safe_rshift_func_int8_t_s_s(i8 signext %249, i32 -1223923600)
  %251 = sext i8 %250 to i64
  store i64 %251, i64* %l_63, align 8
  br label %252

; <label>:252                                     ; preds = %246
  %253 = load i64* %l_63, align 8
  %254 = trunc i64 %253 to i8
  store i8 %254, i8* %1
  br label %255

; <label>:255                                     ; preds = %252, %236, %174, %18
  %256 = load i8* %1
  ret i8 %256
}

define internal zeroext i16 @safe_unary_minus_func_uint16_t_u(i16 zeroext %ui) nounwind uwtable {
  %1 = alloca i16, align 2
  store i16 %ui, i16* %1, align 2
  %2 = load i16* %1, align 2
  %3 = zext i16 %2 to i32
  %4 = sub nsw i32 0, %3
  %5 = trunc i32 %4 to i16
  ret i16 %5
}

define internal zeroext i16 @safe_rshift_func_uint16_t_u_s(i16 zeroext %left, i32 %right) nounwind uwtable {
  %1 = alloca i16, align 2
  %2 = alloca i32, align 4
  store i16 %left, i16* %1, align 2
  store i32 %right, i32* %2, align 4
  %3 = load i32* %2, align 4
  %4 = icmp slt i32 %3, 0
  br i1 %4, label %8, label %5

; <label>:5                                       ; preds = %0
  %6 = load i32* %2, align 4
  %7 = icmp sge i32 %6, 32
  br i1 %7, label %8, label %11

; <label>:8                                       ; preds = %5, %0
  %9 = load i16* %1, align 2
  %10 = zext i16 %9 to i32
  br label %16

; <label>:11                                      ; preds = %5
  %12 = load i16* %1, align 2
  %13 = zext i16 %12 to i32
  %14 = load i32* %2, align 4
  %15 = ashr i32 %13, %14
  br label %16

; <label>:16                                      ; preds = %11, %8
  %17 = phi i32 [ %10, %8 ], [ %15, %11 ]
  %18 = trunc i32 %17 to i16
  ret i16 %18
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

define i32 @func_7(i8 signext %p_8, i8 zeroext %p_9, i32 %p_10) nounwind uwtable {
  %1 = alloca i8, align 1
  %2 = alloca i8, align 1
  %3 = alloca i32, align 4
  %l_11 = alloca i16, align 2
  store i8 %p_8, i8* %1, align 1
  store i8 %p_9, i8* %2, align 1
  store i32 %p_10, i32* %3, align 4
  store i16 0, i16* %l_11, align 2
  %4 = load i16* %l_11, align 2
  %5 = sext i16 %4 to i32
  ret i32 %5
}

define internal zeroext i8 @safe_rshift_func_uint8_t_u_s(i8 zeroext %left, i32 %right) nounwind uwtable {
  %1 = alloca i8, align 1
  %2 = alloca i32, align 4
  store i8 %left, i8* %1, align 1
  store i32 %right, i32* %2, align 4
  %3 = load i32* %2, align 4
  %4 = icmp slt i32 %3, 0
  br i1 %4, label %8, label %5

; <label>:5                                       ; preds = %0
  %6 = load i32* %2, align 4
  %7 = icmp sge i32 %6, 32
  br i1 %7, label %8, label %11

; <label>:8                                       ; preds = %5, %0
  %9 = load i8* %1, align 1
  %10 = zext i8 %9 to i32
  br label %16

; <label>:11                                      ; preds = %5
  %12 = load i8* %1, align 1
  %13 = zext i8 %12 to i32
  %14 = load i32* %2, align 4
  %15 = ashr i32 %13, %14
  br label %16

; <label>:16                                      ; preds = %11, %8
  %17 = phi i32 [ %10, %8 ], [ %15, %11 ]
  %18 = trunc i32 %17 to i8
  ret i8 %18
}

define internal signext i16 @safe_mod_func_int16_t_s_s(i16 signext %si1, i16 signext %si2) nounwind uwtable {
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
  %22 = srem i32 %19, %21
  br label %23

; <label>:23                                      ; preds = %17, %14
  %24 = phi i32 [ %16, %14 ], [ %22, %17 ]
  %25 = trunc i32 %24 to i16
  ret i16 %25
}

define internal signext i8 @safe_rshift_func_int8_t_s_u(i8 signext %left, i32 %right) nounwind uwtable {
  %1 = alloca i8, align 1
  %2 = alloca i32, align 4
  store i8 %left, i8* %1, align 1
  store i32 %right, i32* %2, align 4
  %3 = load i8* %1, align 1
  %4 = sext i8 %3 to i32
  %5 = icmp slt i32 %4, 0
  br i1 %5, label %9, label %6

; <label>:6                                       ; preds = %0
  %7 = load i32* %2, align 4
  %8 = icmp uge i32 %7, 32
  br i1 %8, label %9, label %12

; <label>:9                                       ; preds = %6, %0
  %10 = load i8* %1, align 1
  %11 = sext i8 %10 to i32
  br label %17

; <label>:12                                      ; preds = %6
  %13 = load i8* %1, align 1
  %14 = sext i8 %13 to i32
  %15 = load i32* %2, align 4
  %16 = ashr i32 %14, %15
  br label %17

; <label>:17                                      ; preds = %12, %9
  %18 = phi i32 [ %11, %9 ], [ %16, %12 ]
  %19 = trunc i32 %18 to i8
  ret i8 %19
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

define internal signext i8 @safe_rshift_func_int8_t_s_s(i8 signext %left, i32 %right) nounwind uwtable {
  %1 = alloca i8, align 1
  %2 = alloca i32, align 4
  store i8 %left, i8* %1, align 1
  store i32 %right, i32* %2, align 4
  %3 = load i8* %1, align 1
  %4 = sext i8 %3 to i32
  %5 = icmp slt i32 %4, 0
  br i1 %5, label %12, label %6

; <label>:6                                       ; preds = %0
  %7 = load i32* %2, align 4
  %8 = icmp slt i32 %7, 0
  br i1 %8, label %12, label %9

; <label>:9                                       ; preds = %6
  %10 = load i32* %2, align 4
  %11 = icmp sge i32 %10, 32
  br i1 %11, label %12, label %15

; <label>:12                                      ; preds = %9, %6, %0
  %13 = load i8* %1, align 1
  %14 = sext i8 %13 to i32
  br label %20

; <label>:15                                      ; preds = %9
  %16 = load i8* %1, align 1
  %17 = sext i8 %16 to i32
  %18 = load i32* %2, align 4
  %19 = ashr i32 %17, %18
  br label %20

; <label>:20                                      ; preds = %15, %12
  %21 = phi i32 [ %14, %12 ], [ %19, %15 ]
  %22 = trunc i32 %21 to i8
  ret i8 %22
}

define i32* @func_36(i32* %p_37) nounwind uwtable {
  %1 = alloca i32*, align 8
  %l_38 = alloca i32, align 4
  %l_46 = alloca i32*, align 8
  %l_39 = alloca i32*, align 8
  store i32* %p_37, i32** %1, align 8
  store i32 -5, i32* %l_38, align 4
  store i32* @g_24, i32** %l_46, align 8
  store i32* @g_24, i32** %l_39, align 8
  %2 = load i32** %l_39, align 8
  ret i32* %2
}

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %l = alloca i32, align 4
  %m = alloca i32, align 4
  %n = alloca i32, align 4
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  %4 = call signext i8 @func_1()
  %5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str, i32 0, i32 0), i32 -2)
  %6 = load i32* getelementptr inbounds ([9 x i32]* @g_14, i32 0, i64 0), align 4
  %7 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str1, i32 0, i32 0), i32 %6)
  %8 = load i32* getelementptr inbounds ([9 x i32]* @g_14, i32 0, i64 1), align 4
  %9 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str2, i32 0, i32 0), i32 %8)
  %10 = load i32* getelementptr inbounds ([9 x i32]* @g_14, i32 0, i64 2), align 4
  %11 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str3, i32 0, i32 0), i32 %10)
  %12 = load i32* getelementptr inbounds ([9 x i32]* @g_14, i32 0, i64 3), align 4
  %13 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str4, i32 0, i32 0), i32 %12)
  %14 = load i32* getelementptr inbounds ([9 x i32]* @g_14, i32 0, i64 4), align 4
  %15 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str5, i32 0, i32 0), i32 %14)
  %16 = load i32* getelementptr inbounds ([9 x i32]* @g_14, i32 0, i64 5), align 4
  %17 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str6, i32 0, i32 0), i32 %16)
  %18 = load i32* getelementptr inbounds ([9 x i32]* @g_14, i32 0, i64 6), align 4
  %19 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str7, i32 0, i32 0), i32 %18)
  %20 = load i32* getelementptr inbounds ([9 x i32]* @g_14, i32 0, i64 7), align 4
  %21 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str8, i32 0, i32 0), i32 %20)
  %22 = load i32* getelementptr inbounds ([9 x i32]* @g_14, i32 0, i64 8), align 4
  %23 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str9, i32 0, i32 0), i32 %22)
  %24 = load i32* @g_24, align 4
  %25 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str10, i32 0, i32 0), i32 %24)
  %26 = load i32* %1
  ret i32 %26
}

declare i32 @printf(i8*, ...)
