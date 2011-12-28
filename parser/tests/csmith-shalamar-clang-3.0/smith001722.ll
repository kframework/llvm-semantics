; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith001722.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_3 = global i32 9, align 4
@g_6 = global i32* @g_3, align 8
@g_5 = global i32** @g_6, align 8
@g_17 = global i16 -11857, align 2
@.str = private unnamed_addr constant [19 x i8] c"checksum g_3 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [20 x i8] c"checksum g_17 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define zeroext i16 @func_1() nounwind uwtable {
  %1 = alloca i16, align 2
  %l_2 = alloca [7 x i64], align 16
  %l_19 = alloca i8, align 1
  %l_22 = alloca i32**, align 8
  %l_26 = alloca i32, align 4
  %i = alloca i32, align 4
  %l_4 = alloca [3 x i32*], align 16
  %l_23 = alloca i16, align 2
  %i1 = alloca i32, align 4
  %l_29 = alloca [5 x [4 x i64]], align 16
  %i2 = alloca i32, align 4
  %j = alloca i32, align 4
  store i8 -7, i8* %l_19, align 1
  store i32** @g_6, i32*** %l_22, align 8
  store i32 0, i32* %l_26, align 4
  store i32 0, i32* %i, align 4
  br label %2

; <label>:2                                       ; preds = %9, %0
  %3 = load i32* %i, align 4
  %4 = icmp slt i32 %3, 7
  br i1 %4, label %5, label %12

; <label>:5                                       ; preds = %2
  %6 = load i32* %i, align 4
  %7 = sext i32 %6 to i64
  %8 = getelementptr inbounds [7 x i64]* %l_2, i32 0, i64 %7
  store i64 1, i64* %8, align 8
  br label %9

; <label>:9                                       ; preds = %5
  %10 = load i32* %i, align 4
  %11 = add nsw i32 %10, 1
  store i32 %11, i32* %i, align 4
  br label %2

; <label>:12                                      ; preds = %2
  store i32 6, i32* @g_3, align 4
  br label %13

; <label>:13                                      ; preds = %186, %12
  %14 = load i32* @g_3, align 4
  %15 = icmp sge i32 %14, 0
  br i1 %15, label %16, label %189

; <label>:16                                      ; preds = %13
  store i16 -9, i16* %l_23, align 2
  store i32 0, i32* %i1, align 4
  br label %17

; <label>:17                                      ; preds = %24, %16
  %18 = load i32* %i1, align 4
  %19 = icmp slt i32 %18, 3
  br i1 %19, label %20, label %27

; <label>:20                                      ; preds = %17
  %21 = load i32* %i1, align 4
  %22 = sext i32 %21 to i64
  %23 = getelementptr inbounds [3 x i32*]* %l_4, i32 0, i64 %22
  store i32* @g_3, i32** %23, align 8
  br label %24

; <label>:24                                      ; preds = %20
  %25 = load i32* %i1, align 4
  %26 = add nsw i32 %25, 1
  store i32 %26, i32* %i1, align 4
  br label %17

; <label>:27                                      ; preds = %17
  %28 = getelementptr inbounds [3 x i32*]* %l_4, i32 0, i64 2
  %29 = load i32** %28, align 8
  %30 = load volatile i32*** @g_5, align 8
  store i32* %29, i32** %30
  %31 = load i32* @g_3, align 4
  %32 = icmp ne i32 %31, 0
  br i1 %32, label %33, label %34

; <label>:33                                      ; preds = %27
  br label %35

; <label>:34                                      ; preds = %27
  br label %35

; <label>:35                                      ; preds = %34, %33
  %36 = load i32* @g_3, align 4
  %37 = urem i32 %36, 7
  %38 = zext i32 %37 to i64
  %39 = getelementptr inbounds [7 x i64]* %l_2, i32 0, i64 %38
  %40 = load i64* %39, align 8
  %41 = icmp ne i64 %40, 0
  br i1 %41, label %42, label %43

; <label>:42                                      ; preds = %35
  br label %186

; <label>:43                                      ; preds = %35
  %44 = getelementptr inbounds [7 x i64]* %l_2, i32 0, i64 2
  %45 = load i64* %44, align 8
  %46 = trunc i64 %45 to i8
  %47 = getelementptr inbounds [7 x i64]* %l_2, i32 0, i64 0
  %48 = load i64* %47, align 8
  %49 = icmp ne i64 %48, 2639814352
  br i1 %49, label %50, label %64

; <label>:50                                      ; preds = %43
  %51 = load volatile i32*** @g_5, align 8
  %52 = load i32** %51
  %53 = load i32* %52
  %54 = trunc i32 %53 to i16
  %55 = load i32* @g_3, align 4
  %56 = urem i32 %55, 7
  %57 = zext i32 %56 to i64
  %58 = getelementptr inbounds [7 x i64]* %l_2, i32 0, i64 %57
  %59 = load i64* %58, align 8
  %60 = trunc i64 %59 to i32
  %61 = call zeroext i16 @safe_rshift_func_uint16_t_u_s(i16 zeroext %54, i32 %60)
  %62 = zext i16 %61 to i32
  %63 = icmp ne i32 %62, 0
  br label %64

; <label>:64                                      ; preds = %50, %43
  %65 = phi i1 [ false, %43 ], [ %63, %50 ]
  %66 = zext i1 %65 to i32
  %67 = load i32* @g_3, align 4
  %68 = urem i32 %67, 7
  %69 = zext i32 %68 to i64
  %70 = getelementptr inbounds [7 x i64]* %l_2, i32 0, i64 %69
  %71 = load i64* %70, align 8
  %72 = trunc i64 %71 to i32
  %73 = getelementptr inbounds [7 x i64]* %l_2, i32 0, i64 4
  %74 = load i64* %73, align 8
  %75 = xor i64 %74, -1
  %76 = load i8* %l_19, align 1
  %77 = zext i8 %76 to i32
  %78 = load i32** @g_6, align 8
  %79 = load i32* %78
  %80 = icmp sgt i32 %77, %79
  %81 = zext i1 %80 to i32
  %82 = sext i32 %81 to i64
  %83 = icmp sgt i64 %75, %82
  %84 = zext i1 %83 to i32
  %85 = load i32** @g_6, align 8
  %86 = load i32* %85
  %87 = icmp sgt i32 %84, %86
  %88 = zext i1 %87 to i32
  %89 = trunc i32 %88 to i16
  %90 = load i32** @g_6, align 8
  %91 = load i32* %90
  %92 = load i32* @g_3, align 4
  %93 = trunc i32 %92 to i16
  %94 = load i32** @g_6, align 8
  %95 = load i32* %94
  %96 = load i32** @g_6, align 8
  %97 = load i32* %96
  %98 = trunc i32 %97 to i8
  %99 = load i32** @g_6, align 8
  %100 = load i32* %99
  %101 = trunc i32 %100 to i8
  %102 = call signext i8 @safe_mul_func_int8_t_s_s(i8 signext %98, i8 signext %101)
  %103 = sext i8 %102 to i16
  %104 = load i32** @g_6, align 8
  %105 = load i32* %104
  %106 = icmp ne i32 %105, 0
  br i1 %106, label %107, label %111

; <label>:107                                     ; preds = %64
  %108 = load i32** @g_6, align 8
  %109 = load i32* %108
  %110 = icmp ne i32 %109, 0
  br label %111

; <label>:111                                     ; preds = %107, %64
  %112 = phi i1 [ false, %64 ], [ %110, %107 ]
  %113 = zext i1 %112 to i32
  %114 = sext i32 %113 to i64
  %115 = call i32 @func_12(i32 %95, i16 zeroext %103, i64 %114, i32** @g_6)
  %116 = sext i32 %115 to i64
  %117 = load i32*** %l_22, align 8
  %118 = call i32 @func_12(i32 %91, i16 zeroext %93, i64 %116, i32** %117)
  %119 = sext i32 %118 to i64
  %120 = call i32 @func_12(i32 %72, i16 zeroext %89, i64 %119, i32** @g_6)
  %121 = icmp eq i32 %66, %120
  %122 = zext i1 %121 to i32
  %123 = trunc i32 %122 to i8
  %124 = call signext i8 @safe_div_func_int8_t_s_s(i8 signext %46, i8 signext %123)
  %125 = sext i8 %124 to i32
  %126 = load i16* %l_23, align 2
  %127 = sext i16 %126 to i32
  %128 = or i32 %127, %125
  %129 = trunc i32 %128 to i16
  store i16 %129, i16* %l_23, align 2
  store i16 0, i16* %l_23, align 2
  br label %130

; <label>:130                                     ; preds = %180, %111
  %131 = load i16* %l_23, align 2
  %132 = sext i16 %131 to i32
  %133 = icmp sle i32 %132, 0
  br i1 %133, label %134, label %185

; <label>:134                                     ; preds = %130
  store i32 0, i32* %i2, align 4
  br label %135

; <label>:135                                     ; preds = %153, %134
  %136 = load i32* %i2, align 4
  %137 = icmp slt i32 %136, 5
  br i1 %137, label %138, label %156

; <label>:138                                     ; preds = %135
  store i32 0, i32* %j, align 4
  br label %139

; <label>:139                                     ; preds = %149, %138
  %140 = load i32* %j, align 4
  %141 = icmp slt i32 %140, 4
  br i1 %141, label %142, label %152

; <label>:142                                     ; preds = %139
  %143 = load i32* %j, align 4
  %144 = sext i32 %143 to i64
  %145 = load i32* %i2, align 4
  %146 = sext i32 %145 to i64
  %147 = getelementptr inbounds [5 x [4 x i64]]* %l_29, i32 0, i64 %146
  %148 = getelementptr inbounds [4 x i64]* %147, i32 0, i64 %144
  store i64 -3869937105976475284, i64* %148, align 8
  br label %149

; <label>:149                                     ; preds = %142
  %150 = load i32* %j, align 4
  %151 = add nsw i32 %150, 1
  store i32 %151, i32* %j, align 4
  br label %139

; <label>:152                                     ; preds = %139
  br label %153

; <label>:153                                     ; preds = %152
  %154 = load i32* %i2, align 4
  %155 = add nsw i32 %154, 1
  store i32 %155, i32* %i2, align 4
  br label %135

; <label>:156                                     ; preds = %135
  %157 = load i32*** %l_22, align 8
  %158 = load i32** %157
  %159 = load i32*** %l_22, align 8
  %160 = load i32** %159
  %161 = icmp ne i32* %158, %160
  %162 = zext i1 %161 to i32
  %163 = load i32* %l_26, align 4
  %164 = and i32 %163, %162
  store i32 %164, i32* %l_26, align 4
  store i16 0, i16* @g_17, align 2
  br label %165

; <label>:165                                     ; preds = %174, %156
  %166 = load i16* @g_17, align 2
  %167 = zext i16 %166 to i32
  %168 = icmp sle i32 %167, -6
  br i1 %168, label %169, label %179

; <label>:169                                     ; preds = %165
  %170 = getelementptr inbounds [5 x [4 x i64]]* %l_29, i32 0, i64 3
  %171 = getelementptr inbounds [4 x i64]* %170, i32 0, i64 2
  %172 = load i64* %171, align 8
  %173 = trunc i64 %172 to i16
  store i16 %173, i16* %1
  br label %191
                                                  ; No predecessors!
  %175 = load i16* @g_17, align 2
  %176 = zext i16 %175 to i32
  %177 = call i32 @safe_add_func_int32_t_s_s(i32 %176, i32 1)
  %178 = trunc i32 %177 to i16
  store i16 %178, i16* @g_17, align 2
  br label %165

; <label>:179                                     ; preds = %165
  br label %180

; <label>:180                                     ; preds = %179
  %181 = load i16* %l_23, align 2
  %182 = sext i16 %181 to i32
  %183 = call i32 @safe_add_func_int32_t_s_s(i32 %182, i32 1)
  %184 = trunc i32 %183 to i16
  store i16 %184, i16* %l_23, align 2
  br label %130

; <label>:185                                     ; preds = %130
  br label %186

; <label>:186                                     ; preds = %185, %42
  %187 = load i32* @g_3, align 4
  %188 = add nsw i32 %187, -1
  store i32 %188, i32* @g_3, align 4
  br label %13

; <label>:189                                     ; preds = %13
  %190 = load i16* @g_17, align 2
  store i16 %190, i16* %1
  br label %191

; <label>:191                                     ; preds = %189, %169
  %192 = load i16* %1
  ret i16 %192
}

define internal signext i8 @safe_div_func_int8_t_s_s(i8 signext %si1, i8 signext %si2) nounwind uwtable {
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
  %22 = sdiv i32 %19, %21
  br label %23

; <label>:23                                      ; preds = %17, %14
  %24 = phi i32 [ %16, %14 ], [ %22, %17 ]
  %25 = trunc i32 %24 to i8
  ret i8 %25
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

define i32 @func_12(i32 %p_13, i16 zeroext %p_14, i64 %p_15, i32** %p_16) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i16, align 2
  %3 = alloca i64, align 8
  %4 = alloca i32**, align 8
  %l_18 = alloca i32, align 4
  store i32 %p_13, i32* %1, align 4
  store i16 %p_14, i16* %2, align 2
  store i64 %p_15, i64* %3, align 8
  store i32** %p_16, i32*** %4, align 8
  store i32 -9, i32* %l_18, align 4
  %5 = load i16* @g_17, align 2
  %6 = zext i16 %5 to i32
  store i32 %6, i32* %l_18, align 4
  %7 = load i32** @g_6, align 8
  %8 = load i32* %7
  ret i32 %8
}

define internal signext i8 @safe_mul_func_int8_t_s_s(i8 signext %si1, i8 signext %si2) nounwind uwtable {
  %1 = alloca i8, align 1
  %2 = alloca i8, align 1
  store i8 %si1, i8* %1, align 1
  store i8 %si2, i8* %2, align 1
  %3 = load i8* %1, align 1
  %4 = sext i8 %3 to i32
  %5 = load i8* %2, align 1
  %6 = sext i8 %5 to i32
  %7 = mul nsw i32 %4, %6
  %8 = trunc i32 %7 to i8
  ret i8 %8
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
  %4 = call zeroext i16 @func_1()
  %5 = load i32* @g_3, align 4
  %6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %5)
  %7 = load i16* @g_17, align 2
  %8 = zext i16 %7 to i32
  %9 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str1, i32 0, i32 0), i32 %8)
  %10 = load i32* %1
  ret i32 %10
}

declare i32 @printf(i8*, ...)
