; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith001603.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = global i32 -512397033, align 4
@g_5 = global [6 x [2 x [2 x i32]]] [[2 x [2 x i32]] [[2 x i32] [i32 -2, i32 -2], [2 x i32] [i32 -2, i32 -2]], [2 x [2 x i32]] [[2 x i32] [i32 -2, i32 -2], [2 x i32] [i32 -2, i32 -2]], [2 x [2 x i32]] [[2 x i32] [i32 -2, i32 -2], [2 x i32] [i32 -2, i32 -2]], [2 x [2 x i32]] [[2 x i32] [i32 -2, i32 -2], [2 x i32] [i32 -2, i32 -2]], [2 x [2 x i32]] [[2 x i32] [i32 -2, i32 -2], [2 x i32] [i32 -2, i32 -2]], [2 x [2 x i32]] [[2 x i32] [i32 -2, i32 -2], [2 x i32] [i32 -2, i32 -2]]], align 16
@g_6 = global i32 -836883443, align 4
@g_7 = global i32 891083955, align 4
@g_15 = global i32 1749084996, align 4
@g_27 = global i32* @g_7, align 8
@g_26 = constant i32** @g_27, align 8
@.str = private unnamed_addr constant [19 x i8] c"checksum g_2 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [28 x i8] c"checksum g_5[0][0][0] = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [28 x i8] c"checksum g_5[0][0][1] = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [28 x i8] c"checksum g_5[0][1][0] = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [28 x i8] c"checksum g_5[0][1][1] = %d\0A\00", align 1
@.str5 = private unnamed_addr constant [28 x i8] c"checksum g_5[1][0][0] = %d\0A\00", align 1
@.str6 = private unnamed_addr constant [28 x i8] c"checksum g_5[1][0][1] = %d\0A\00", align 1
@.str7 = private unnamed_addr constant [28 x i8] c"checksum g_5[1][1][0] = %d\0A\00", align 1
@.str8 = private unnamed_addr constant [28 x i8] c"checksum g_5[1][1][1] = %d\0A\00", align 1
@.str9 = private unnamed_addr constant [28 x i8] c"checksum g_5[2][0][0] = %d\0A\00", align 1
@.str10 = private unnamed_addr constant [28 x i8] c"checksum g_5[2][0][1] = %d\0A\00", align 1
@.str11 = private unnamed_addr constant [28 x i8] c"checksum g_5[2][1][0] = %d\0A\00", align 1
@.str12 = private unnamed_addr constant [28 x i8] c"checksum g_5[2][1][1] = %d\0A\00", align 1
@.str13 = private unnamed_addr constant [28 x i8] c"checksum g_5[3][0][0] = %d\0A\00", align 1
@.str14 = private unnamed_addr constant [28 x i8] c"checksum g_5[3][0][1] = %d\0A\00", align 1
@.str15 = private unnamed_addr constant [28 x i8] c"checksum g_5[3][1][0] = %d\0A\00", align 1
@.str16 = private unnamed_addr constant [28 x i8] c"checksum g_5[3][1][1] = %d\0A\00", align 1
@.str17 = private unnamed_addr constant [28 x i8] c"checksum g_5[4][0][0] = %d\0A\00", align 1
@.str18 = private unnamed_addr constant [28 x i8] c"checksum g_5[4][0][1] = %d\0A\00", align 1
@.str19 = private unnamed_addr constant [28 x i8] c"checksum g_5[4][1][0] = %d\0A\00", align 1
@.str20 = private unnamed_addr constant [28 x i8] c"checksum g_5[4][1][1] = %d\0A\00", align 1
@.str21 = private unnamed_addr constant [28 x i8] c"checksum g_5[5][0][0] = %d\0A\00", align 1
@.str22 = private unnamed_addr constant [28 x i8] c"checksum g_5[5][0][1] = %d\0A\00", align 1
@.str23 = private unnamed_addr constant [28 x i8] c"checksum g_5[5][1][0] = %d\0A\00", align 1
@.str24 = private unnamed_addr constant [28 x i8] c"checksum g_5[5][1][1] = %d\0A\00", align 1
@.str25 = private unnamed_addr constant [19 x i8] c"checksum g_6 = %d\0A\00", align 1
@.str26 = private unnamed_addr constant [19 x i8] c"checksum g_7 = %d\0A\00", align 1
@.str27 = private unnamed_addr constant [20 x i8] c"checksum g_15 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define signext i16 @func_1() nounwind uwtable {
  %1 = alloca i16, align 2
  %l_12 = alloca i64, align 8
  %l_16 = alloca [8 x i32], align 16
  %i = alloca i32, align 4
  %i1 = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %l_13 = alloca i8, align 1
  %l_14 = alloca [6 x i32*], align 16
  %i2 = alloca i32, align 4
  %l_28 = alloca i32**, align 8
  store i64 -3305103600195634765, i64* %l_12, align 8
  store i32 0, i32* %i, align 4
  br label %2

; <label>:2                                       ; preds = %9, %0
  %3 = load i32* %i, align 4
  %4 = icmp slt i32 %3, 8
  br i1 %4, label %5, label %12

; <label>:5                                       ; preds = %2
  %6 = load i32* %i, align 4
  %7 = sext i32 %6 to i64
  %8 = getelementptr inbounds [8 x i32]* %l_16, i32 0, i64 %7
  store i32 -2053899842, i32* %8, align 4
  br label %9

; <label>:9                                       ; preds = %5
  %10 = load i32* %i, align 4
  %11 = add nsw i32 %10, 1
  store i32 %11, i32* %i, align 4
  br label %2

; <label>:12                                      ; preds = %2
  store volatile i32 -10, i32* @g_2, align 4
  br label %13

; <label>:13                                      ; preds = %147, %12
  %14 = load volatile i32* @g_2, align 4
  %15 = icmp sle i32 %14, 0
  br i1 %15, label %16, label %152

; <label>:16                                      ; preds = %13
  store volatile i32 3, i32* @g_2, align 4
  br label %17

; <label>:17                                      ; preds = %143, %16
  %18 = load volatile i32* @g_2, align 4
  %19 = icmp slt i32 %18, 6
  br i1 %19, label %20, label %146

; <label>:20                                      ; preds = %17
  store i32 1, i32* @g_6, align 4
  br label %21

; <label>:21                                      ; preds = %139, %20
  %22 = load i32* @g_6, align 4
  %23 = icmp slt i32 %22, 2
  br i1 %23, label %24, label %142

; <label>:24                                      ; preds = %21
  store i32 1, i32* @g_7, align 4
  br label %25

; <label>:25                                      ; preds = %135, %24
  %26 = load i32* @g_7, align 4
  %27 = icmp slt i32 %26, 2
  br i1 %27, label %28, label %138

; <label>:28                                      ; preds = %25
  store i8 -59, i8* %l_13, align 1
  store i32 0, i32* %i2, align 4
  br label %29

; <label>:29                                      ; preds = %36, %28
  %30 = load i32* %i2, align 4
  %31 = icmp slt i32 %30, 6
  br i1 %31, label %32, label %39

; <label>:32                                      ; preds = %29
  %33 = load i32* %i2, align 4
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds [6 x i32*]* %l_14, i32 0, i64 %34
  store i32* @g_15, i32** %35, align 8
  br label %36

; <label>:36                                      ; preds = %32
  %37 = load i32* %i2, align 4
  %38 = add nsw i32 %37, 1
  store i32 %38, i32* %i2, align 4
  br label %29

; <label>:39                                      ; preds = %29
  %40 = load i32* @g_7, align 4
  %41 = urem i32 %40, 2
  %42 = zext i32 %41 to i64
  %43 = load i32* @g_6, align 4
  %44 = urem i32 %43, 2
  %45 = zext i32 %44 to i64
  %46 = load volatile i32* @g_2, align 4
  %47 = urem i32 %46, 6
  %48 = zext i32 %47 to i64
  %49 = getelementptr inbounds [6 x [2 x [2 x i32]]]* @g_5, i32 0, i64 %48
  %50 = getelementptr inbounds [2 x [2 x i32]]* %49, i32 0, i64 %45
  %51 = getelementptr inbounds [2 x i32]* %50, i32 0, i64 %42
  %52 = load i32* %51, align 4
  %53 = trunc i32 %52 to i16
  %54 = load i64* %l_12, align 8
  %55 = load i32* @g_7, align 4
  %56 = load i8* %l_13, align 1
  %57 = sext i8 %56 to i32
  %58 = icmp slt i32 %55, %57
  %59 = zext i1 %58 to i32
  %60 = sext i32 %59 to i64
  %61 = icmp ule i64 %54, %60
  %62 = zext i1 %61 to i32
  %63 = trunc i32 %62 to i16
  %64 = call zeroext i16 @safe_mul_func_uint16_t_u_u(i16 zeroext %53, i16 zeroext %63)
  %65 = zext i16 %64 to i64
  %66 = icmp sle i64 %65, 1
  %67 = zext i1 %66 to i32
  %68 = trunc i32 %67 to i8
  %69 = load i8* %l_13, align 1
  %70 = sext i8 %69 to i32
  %71 = icmp ne i32 %70, 0
  br i1 %71, label %72, label %80

; <label>:72                                      ; preds = %39
  %73 = load i32* @g_6, align 4
  %74 = icmp ne i32 %73, 0
  br i1 %74, label %78, label %75

; <label>:75                                      ; preds = %72
  %76 = load i64* %l_12, align 8
  %77 = icmp ne i64 %76, 0
  br label %78

; <label>:78                                      ; preds = %75, %72
  %79 = phi i1 [ true, %72 ], [ %77, %75 ]
  br label %80

; <label>:80                                      ; preds = %78, %39
  %81 = phi i1 [ false, %39 ], [ %79, %78 ]
  %82 = zext i1 %81 to i32
  %83 = trunc i32 %82 to i8
  %84 = call signext i8 @safe_sub_func_int8_t_s_s(i8 signext %68, i8 signext %83)
  %85 = sext i8 %84 to i64
  %86 = icmp sge i64 %85, 1
  %87 = zext i1 %86 to i32
  %88 = getelementptr inbounds [8 x i32]* %l_16, i32 0, i64 5
  store i32 %87, i32* %88, align 4
  %89 = load i32* @g_7, align 4
  %90 = icmp ne i32 %89, 0
  br i1 %90, label %91, label %92

; <label>:91                                      ; preds = %80
  br label %98

; <label>:92                                      ; preds = %80
  store i8 0, i8* %l_13, align 1
  br label %93

; <label>:93                                      ; preds = %131, %92
  %94 = load i8* %l_13, align 1
  %95 = sext i8 %94 to i32
  %96 = icmp sgt i32 %95, 0
  br i1 %96, label %97, label %134

; <label>:97                                      ; preds = %93
  br label %98

; <label>:98                                      ; preds = %97, %91
  store i64 0, i64* %l_12, align 8
  br label %99

; <label>:99                                      ; preds = %105, %98
  %100 = load i64* %l_12, align 8
  %101 = icmp ule i64 %100, 0
  br i1 %101, label %102, label %108

; <label>:102                                     ; preds = %99
  %103 = load i32* @g_15, align 4
  %104 = trunc i32 %103 to i16
  store i16 %104, i16* %1
  br label %155
                                                  ; No predecessors!
  %106 = load i64* %l_12, align 8
  %107 = call i64 @safe_add_func_int64_t_s_s(i64 %106, i64 1)
  store i64 %107, i64* %l_12, align 8
  br label %99

; <label>:108                                     ; preds = %99
  store i8 -26, i8* %l_13, align 1
  br label %109

; <label>:109                                     ; preds = %127, %108
  %110 = load i8* %l_13, align 1
  %111 = sext i8 %110 to i32
  %112 = icmp sgt i32 %111, 0
  br i1 %112, label %113, label %130

; <label>:113                                     ; preds = %109
  %114 = load i32* @g_15, align 4
  %115 = trunc i32 %114 to i8
  %116 = call zeroext i8 @safe_rshift_func_uint8_t_u_s(i8 zeroext %115, i32 -1232533963)
  %117 = icmp ne i8 %116, 0
  br i1 %117, label %118, label %123

; <label>:118                                     ; preds = %113
  %119 = load volatile i32*** @g_26, align 8
  store i32* @g_15, i32** %119
  %120 = getelementptr inbounds [8 x i32]* %l_16, i32 0, i64 5
  %121 = load i32* %120, align 4
  %122 = trunc i32 %121 to i16
  store i16 %122, i16* %1
  br label %155

; <label>:123                                     ; preds = %113
  store i32** @g_27, i32*** %l_28, align 8
  %124 = load i32*** %l_28, align 8
  store i32* null, i32** %124
  %125 = load i32* @g_7, align 4
  %126 = trunc i32 %125 to i16
  store i16 %126, i16* %1
  br label %155
                                                  ; No predecessors!
  %128 = load i8* %l_13, align 1
  %129 = call signext i8 @safe_add_func_int8_t_s_s(i8 signext %128, i8 signext 3)
  store i8 %129, i8* %l_13, align 1
  br label %109

; <label>:130                                     ; preds = %109
  br label %131

; <label>:131                                     ; preds = %130
  %132 = load i8* %l_13, align 1
  %133 = call signext i8 @safe_sub_func_int8_t_s_s(i8 signext %132, i8 signext 1)
  store i8 %133, i8* %l_13, align 1
  br label %93

; <label>:134                                     ; preds = %93
  br label %135

; <label>:135                                     ; preds = %134
  %136 = load i32* @g_7, align 4
  %137 = add nsw i32 %136, 2
  store i32 %137, i32* @g_7, align 4
  br label %25

; <label>:138                                     ; preds = %25
  br label %139

; <label>:139                                     ; preds = %138
  %140 = load i32* @g_6, align 4
  %141 = add nsw i32 %140, 1
  store i32 %141, i32* @g_6, align 4
  br label %21

; <label>:142                                     ; preds = %21
  br label %143

; <label>:143                                     ; preds = %142
  %144 = load volatile i32* @g_2, align 4
  %145 = add nsw i32 %144, 3
  store volatile i32 %145, i32* @g_2, align 4
  br label %17

; <label>:146                                     ; preds = %17
  br label %147

; <label>:147                                     ; preds = %146
  %148 = load volatile i32* @g_2, align 4
  %149 = sext i32 %148 to i64
  %150 = call i64 @safe_sub_func_uint64_t_u_u(i64 %149, i64 1)
  %151 = trunc i64 %150 to i32
  store volatile i32 %151, i32* @g_2, align 4
  br label %13

; <label>:152                                     ; preds = %13
  %153 = load i64* %l_12, align 8
  %154 = trunc i64 %153 to i16
  store i16 %154, i16* %1
  br label %155

; <label>:155                                     ; preds = %152, %123, %118, %102
  %156 = load i16* %1
  ret i16 %156
}

define internal signext i8 @safe_sub_func_int8_t_s_s(i8 signext %si1, i8 signext %si2) nounwind uwtable {
  %1 = alloca i8, align 1
  %2 = alloca i8, align 1
  store i8 %si1, i8* %1, align 1
  store i8 %si2, i8* %2, align 1
  %3 = load i8* %1, align 1
  %4 = sext i8 %3 to i32
  %5 = load i8* %2, align 1
  %6 = sext i8 %5 to i32
  %7 = sub nsw i32 %4, %6
  %8 = trunc i32 %7 to i8
  ret i8 %8
}

define internal zeroext i16 @safe_mul_func_uint16_t_u_u(i16 zeroext %ui1, i16 zeroext %ui2) nounwind uwtable {
  %1 = alloca i16, align 2
  %2 = alloca i16, align 2
  store i16 %ui1, i16* %1, align 2
  store i16 %ui2, i16* %2, align 2
  %3 = load i16* %1, align 2
  %4 = zext i16 %3 to i32
  %5 = load i16* %2, align 2
  %6 = zext i16 %5 to i32
  %7 = mul i32 %4, %6
  %8 = trunc i32 %7 to i16
  ret i16 %8
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

define internal i64 @safe_sub_func_uint64_t_u_u(i64 %ui1, i64 %ui2) nounwind uwtable {
  %1 = alloca i64, align 8
  %2 = alloca i64, align 8
  store i64 %ui1, i64* %1, align 8
  store i64 %ui2, i64* %2, align 8
  %3 = load i64* %1, align 8
  %4 = load i64* %2, align 8
  %5 = sub i64 %3, %4
  ret i64 %5
}

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  %4 = call signext i16 @func_1()
  %5 = load volatile i32* @g_2, align 4
  %6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %5)
  %7 = load i32* getelementptr inbounds ([6 x [2 x [2 x i32]]]* @g_5, i32 0, i64 0, i64 0, i64 0), align 4
  %8 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str1, i32 0, i32 0), i32 %7)
  %9 = load i32* getelementptr inbounds ([6 x [2 x [2 x i32]]]* @g_5, i32 0, i64 0, i64 0, i64 1), align 4
  %10 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str2, i32 0, i32 0), i32 %9)
  %11 = load i32* getelementptr inbounds ([6 x [2 x [2 x i32]]]* @g_5, i32 0, i64 0, i64 1, i64 0), align 4
  %12 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str3, i32 0, i32 0), i32 %11)
  %13 = load i32* getelementptr inbounds ([6 x [2 x [2 x i32]]]* @g_5, i32 0, i64 0, i64 1, i64 1), align 4
  %14 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str4, i32 0, i32 0), i32 %13)
  %15 = load i32* getelementptr inbounds ([6 x [2 x [2 x i32]]]* @g_5, i32 0, i64 1, i64 0, i64 0), align 4
  %16 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str5, i32 0, i32 0), i32 %15)
  %17 = load i32* getelementptr inbounds ([6 x [2 x [2 x i32]]]* @g_5, i32 0, i64 1, i64 0, i64 1), align 4
  %18 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str6, i32 0, i32 0), i32 %17)
  %19 = load i32* getelementptr inbounds ([6 x [2 x [2 x i32]]]* @g_5, i32 0, i64 1, i64 1, i64 0), align 4
  %20 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str7, i32 0, i32 0), i32 %19)
  %21 = load i32* getelementptr inbounds ([6 x [2 x [2 x i32]]]* @g_5, i32 0, i64 1, i64 1, i64 1), align 4
  %22 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str8, i32 0, i32 0), i32 %21)
  %23 = load i32* getelementptr inbounds ([6 x [2 x [2 x i32]]]* @g_5, i32 0, i64 2, i64 0, i64 0), align 4
  %24 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str9, i32 0, i32 0), i32 %23)
  %25 = load i32* getelementptr inbounds ([6 x [2 x [2 x i32]]]* @g_5, i32 0, i64 2, i64 0, i64 1), align 4
  %26 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str10, i32 0, i32 0), i32 %25)
  %27 = load i32* getelementptr inbounds ([6 x [2 x [2 x i32]]]* @g_5, i32 0, i64 2, i64 1, i64 0), align 4
  %28 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str11, i32 0, i32 0), i32 %27)
  %29 = load i32* getelementptr inbounds ([6 x [2 x [2 x i32]]]* @g_5, i32 0, i64 2, i64 1, i64 1), align 4
  %30 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str12, i32 0, i32 0), i32 %29)
  %31 = load i32* getelementptr inbounds ([6 x [2 x [2 x i32]]]* @g_5, i32 0, i64 3, i64 0, i64 0), align 4
  %32 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str13, i32 0, i32 0), i32 %31)
  %33 = load i32* getelementptr inbounds ([6 x [2 x [2 x i32]]]* @g_5, i32 0, i64 3, i64 0, i64 1), align 4
  %34 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str14, i32 0, i32 0), i32 %33)
  %35 = load i32* getelementptr inbounds ([6 x [2 x [2 x i32]]]* @g_5, i32 0, i64 3, i64 1, i64 0), align 4
  %36 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str15, i32 0, i32 0), i32 %35)
  %37 = load i32* getelementptr inbounds ([6 x [2 x [2 x i32]]]* @g_5, i32 0, i64 3, i64 1, i64 1), align 4
  %38 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str16, i32 0, i32 0), i32 %37)
  %39 = load i32* getelementptr inbounds ([6 x [2 x [2 x i32]]]* @g_5, i32 0, i64 4, i64 0, i64 0), align 4
  %40 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str17, i32 0, i32 0), i32 %39)
  %41 = load i32* getelementptr inbounds ([6 x [2 x [2 x i32]]]* @g_5, i32 0, i64 4, i64 0, i64 1), align 4
  %42 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str18, i32 0, i32 0), i32 %41)
  %43 = load i32* getelementptr inbounds ([6 x [2 x [2 x i32]]]* @g_5, i32 0, i64 4, i64 1, i64 0), align 4
  %44 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str19, i32 0, i32 0), i32 %43)
  %45 = load i32* getelementptr inbounds ([6 x [2 x [2 x i32]]]* @g_5, i32 0, i64 4, i64 1, i64 1), align 4
  %46 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str20, i32 0, i32 0), i32 %45)
  %47 = load i32* getelementptr inbounds ([6 x [2 x [2 x i32]]]* @g_5, i32 0, i64 5, i64 0, i64 0), align 4
  %48 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str21, i32 0, i32 0), i32 %47)
  %49 = load i32* getelementptr inbounds ([6 x [2 x [2 x i32]]]* @g_5, i32 0, i64 5, i64 0, i64 1), align 4
  %50 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str22, i32 0, i32 0), i32 %49)
  %51 = load i32* getelementptr inbounds ([6 x [2 x [2 x i32]]]* @g_5, i32 0, i64 5, i64 1, i64 0), align 4
  %52 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str23, i32 0, i32 0), i32 %51)
  %53 = load i32* getelementptr inbounds ([6 x [2 x [2 x i32]]]* @g_5, i32 0, i64 5, i64 1, i64 1), align 4
  %54 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str24, i32 0, i32 0), i32 %53)
  %55 = load i32* @g_6, align 4
  %56 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str25, i32 0, i32 0), i32 %55)
  %57 = load i32* @g_7, align 4
  %58 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str26, i32 0, i32 0), i32 %57)
  %59 = load i32* @g_15, align 4
  %60 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str27, i32 0, i32 0), i32 %59)
  %61 = load i32* %1
  ret i32 %61
}

declare i32 @printf(i8*, ...)
