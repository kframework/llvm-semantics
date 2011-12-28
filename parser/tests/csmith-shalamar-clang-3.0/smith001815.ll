; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith001815.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_14 = global [6 x i16] [i16 8, i16 8, i16 8, i16 8, i16 8, i16 8], align 2
@g_22 = global i32 910736786, align 4
@g_21 = global i32* @g_22, align 8
@g_51 = global i8 -50, align 1
@.str = private unnamed_addr constant [23 x i8] c"checksum g_14[0] = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [23 x i8] c"checksum g_14[1] = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [23 x i8] c"checksum g_14[2] = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [23 x i8] c"checksum g_14[3] = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [23 x i8] c"checksum g_14[4] = %d\0A\00", align 1
@.str5 = private unnamed_addr constant [23 x i8] c"checksum g_14[5] = %d\0A\00", align 1
@.str6 = private unnamed_addr constant [20 x i8] c"checksum g_22 = %d\0A\00", align 1
@.str7 = private unnamed_addr constant [20 x i8] c"checksum g_51 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable {
  %1 = alloca i32, align 4
  %l_9 = alloca i8, align 1
  %l_17 = alloca i32*, align 8
  %l_18 = alloca i32, align 4
  %l_19 = alloca i32**, align 8
  %l_20 = alloca [9 x [6 x i32**]], align 16
  %l_23 = alloca i64, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %l_38 = alloca [8 x [1 x i64]], align 16
  %l_50 = alloca [1 x [9 x i32*]], align 16
  %i1 = alloca i32, align 4
  %j2 = alloca i32, align 4
  %l_28 = alloca i16, align 2
  %l_33 = alloca i16, align 2
  %l_56 = alloca [7 x i64], align 16
  %i3 = alloca i32, align 4
  store i8 8, i8* %l_9, align 1
  store i32* null, i32** %l_17, align 8
  store i32 -1428562482, i32* %l_18, align 4
  store i32** null, i32*** %l_19, align 8
  store i64 -7014378899162412654, i64* %l_23, align 8
  store i32 0, i32* %i, align 4
  br label %2

; <label>:2                                       ; preds = %20, %0
  %3 = load i32* %i, align 4
  %4 = icmp slt i32 %3, 9
  br i1 %4, label %5, label %23

; <label>:5                                       ; preds = %2
  store i32 0, i32* %j, align 4
  br label %6

; <label>:6                                       ; preds = %16, %5
  %7 = load i32* %j, align 4
  %8 = icmp slt i32 %7, 6
  br i1 %8, label %9, label %19

; <label>:9                                       ; preds = %6
  %10 = load i32* %j, align 4
  %11 = sext i32 %10 to i64
  %12 = load i32* %i, align 4
  %13 = sext i32 %12 to i64
  %14 = getelementptr inbounds [9 x [6 x i32**]]* %l_20, i32 0, i64 %13
  %15 = getelementptr inbounds [6 x i32**]* %14, i32 0, i64 %11
  store i32** null, i32*** %15, align 8
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
  %24 = load i8* %l_9, align 1
  %25 = zext i8 %24 to i16
  %26 = load i8* %l_9, align 1
  %27 = zext i8 %26 to i32
  %28 = load i8* %l_9, align 1
  %29 = zext i8 %28 to i32
  %30 = xor i32 %27, %29
  %31 = trunc i32 %30 to i16
  %32 = load i16* getelementptr inbounds ([6 x i16]* @g_14, i32 0, i64 0), align 2
  %33 = trunc i16 %32 to i8
  %34 = load i16* getelementptr inbounds ([6 x i16]* @g_14, i32 0, i64 2), align 2
  %35 = zext i16 %34 to i32
  %36 = call signext i8 @safe_lshift_func_int8_t_s_s(i8 signext %33, i32 %35)
  %37 = sext i8 %36 to i16
  %38 = call signext i16 @safe_div_func_int16_t_s_s(i16 signext %31, i16 signext %37)
  %39 = sext i16 %38 to i64
  %40 = load i16* getelementptr inbounds ([6 x i16]* @g_14, i32 0, i64 0), align 2
  %41 = zext i16 %40 to i64
  %42 = load i16* getelementptr inbounds ([6 x i16]* @g_14, i32 0, i64 0), align 2
  %43 = zext i16 %42 to i32
  %44 = load i16* getelementptr inbounds ([6 x i16]* @g_14, i32 0, i64 0), align 2
  %45 = zext i16 %44 to i32
  %46 = icmp sge i32 %43, %45
  %47 = zext i1 %46 to i32
  %48 = sext i32 %47 to i64
  %49 = call i64 @safe_mod_func_int64_t_s_s(i64 %41, i64 %48)
  %50 = icmp eq i64 %39, %49
  %51 = zext i1 %50 to i32
  %52 = trunc i32 %51 to i16
  %53 = call signext i16 @safe_mul_func_int16_t_s_s(i16 signext %25, i16 signext %52)
  %54 = icmp ne i16 %53, 0
  %55 = xor i1 %54, true
  %56 = zext i1 %55 to i32
  %57 = load i32** %l_17, align 8
  %58 = load i32* %l_18, align 4
  %59 = trunc i32 %58 to i16
  %60 = call i32* @func_2(i32 %56, i32* null, i32* %57, i16 signext %59)
  store i32* %60, i32** @g_21, align 8
  %61 = load i64* %l_23, align 8
  %62 = load i16* getelementptr inbounds ([6 x i16]* @g_14, i32 0, i64 0), align 2
  %63 = zext i16 %62 to i32
  %64 = xor i32 %63, -1
  %65 = sext i32 %64 to i64
  %66 = icmp sle i64 %61, %65
  %67 = zext i1 %66 to i32
  %68 = sext i32 %67 to i64
  %69 = and i64 2974878459, %68
  %70 = load i32* @g_22, align 4
  %71 = sext i32 %70 to i64
  %72 = xor i64 %71, %69
  %73 = trunc i64 %72 to i32
  store i32 %73, i32* @g_22, align 4
  store i64 -17, i64* %l_23, align 8
  br label %74

; <label>:74                                      ; preds = %211, %23
  %75 = load i64* %l_23, align 8
  %76 = icmp sgt i64 %75, -24
  br i1 %76, label %77, label %216

; <label>:77                                      ; preds = %74
  store i32 0, i32* %i1, align 4
  br label %78

; <label>:78                                      ; preds = %96, %77
  %79 = load i32* %i1, align 4
  %80 = icmp slt i32 %79, 8
  br i1 %80, label %81, label %99

; <label>:81                                      ; preds = %78
  store i32 0, i32* %j2, align 4
  br label %82

; <label>:82                                      ; preds = %92, %81
  %83 = load i32* %j2, align 4
  %84 = icmp slt i32 %83, 1
  br i1 %84, label %85, label %95

; <label>:85                                      ; preds = %82
  %86 = load i32* %j2, align 4
  %87 = sext i32 %86 to i64
  %88 = load i32* %i1, align 4
  %89 = sext i32 %88 to i64
  %90 = getelementptr inbounds [8 x [1 x i64]]* %l_38, i32 0, i64 %89
  %91 = getelementptr inbounds [1 x i64]* %90, i32 0, i64 %87
  store i64 -3887472543215578885, i64* %91, align 8
  br label %92

; <label>:92                                      ; preds = %85
  %93 = load i32* %j2, align 4
  %94 = add nsw i32 %93, 1
  store i32 %94, i32* %j2, align 4
  br label %82

; <label>:95                                      ; preds = %82
  br label %96

; <label>:96                                      ; preds = %95
  %97 = load i32* %i1, align 4
  %98 = add nsw i32 %97, 1
  store i32 %98, i32* %i1, align 4
  br label %78

; <label>:99                                      ; preds = %78
  store i32 0, i32* %i1, align 4
  br label %100

; <label>:100                                     ; preds = %118, %99
  %101 = load i32* %i1, align 4
  %102 = icmp slt i32 %101, 1
  br i1 %102, label %103, label %121

; <label>:103                                     ; preds = %100
  store i32 0, i32* %j2, align 4
  br label %104

; <label>:104                                     ; preds = %114, %103
  %105 = load i32* %j2, align 4
  %106 = icmp slt i32 %105, 9
  br i1 %106, label %107, label %117

; <label>:107                                     ; preds = %104
  %108 = load i32* %j2, align 4
  %109 = sext i32 %108 to i64
  %110 = load i32* %i1, align 4
  %111 = sext i32 %110 to i64
  %112 = getelementptr inbounds [1 x [9 x i32*]]* %l_50, i32 0, i64 %111
  %113 = getelementptr inbounds [9 x i32*]* %112, i32 0, i64 %109
  store i32* %l_18, i32** %113, align 8
  br label %114

; <label>:114                                     ; preds = %107
  %115 = load i32* %j2, align 4
  %116 = add nsw i32 %115, 1
  store i32 %116, i32* %j2, align 4
  br label %104

; <label>:117                                     ; preds = %104
  br label %118

; <label>:118                                     ; preds = %117
  %119 = load i32* %i1, align 4
  %120 = add nsw i32 %119, 1
  store i32 %120, i32* %i1, align 4
  br label %100

; <label>:121                                     ; preds = %100
  %122 = load i32* @g_22, align 4
  %123 = trunc i32 %122 to i16
  %124 = call zeroext i16 @safe_mul_func_uint16_t_u_u(i16 zeroext %123, i16 zeroext 23087)
  %125 = icmp ne i16 %124, 0
  br i1 %125, label %126, label %129

; <label>:126                                     ; preds = %121
  store i16 5092, i16* %l_28, align 2
  %127 = load i16* %l_28, align 2
  %128 = sext i16 %127 to i32
  store i32 %128, i32* %1
  br label %219

; <label>:129                                     ; preds = %121
  store i16 -1, i16* %l_33, align 2
  %130 = load i16* %l_33, align 2
  %131 = getelementptr inbounds [8 x [1 x i64]]* %l_38, i32 0, i64 3
  %132 = getelementptr inbounds [1 x i64]* %131, i32 0, i64 0
  %133 = load i64* %132, align 8
  %134 = trunc i64 %133 to i16
  %135 = load i16* %l_33, align 2
  %136 = load i16* getelementptr inbounds ([6 x i16]* @g_14, i32 0, i64 0), align 2
  %137 = call signext i16 @safe_div_func_int16_t_s_s(i16 signext %135, i16 signext %136)
  %138 = call signext i16 @safe_mul_func_int16_t_s_s(i16 signext %134, i16 signext %137)
  %139 = sext i16 %138 to i32
  %140 = load i16* getelementptr inbounds ([6 x i16]* @g_14, i32 0, i64 4), align 2
  %141 = zext i16 %140 to i32
  %142 = call i32 @safe_add_func_int32_t_s_s(i32 %139, i32 %141)
  %143 = getelementptr inbounds [1 x [9 x i32*]]* %l_50, i32 0, i64 0
  %144 = getelementptr inbounds [9 x i32*]* %143, i32 0, i64 1
  %145 = load i32** %144, align 8
  %146 = load i8* @g_51, align 1
  %147 = sext i8 %146 to i64
  %148 = call i32 @func_43(i32* %145, i64 %147, i32** @g_21, i32* @g_22)
  %149 = trunc i32 %148 to i8
  %150 = load i32** @g_21, align 8
  %151 = load i32** @g_21, align 8
  %152 = icmp ne i32* %150, %151
  %153 = zext i1 %152 to i32
  %154 = trunc i32 %153 to i8
  %155 = call signext i8 @safe_mul_func_int8_t_s_s(i8 signext %149, i8 signext %154)
  %156 = sext i8 %155 to i32
  %157 = load i16* getelementptr inbounds ([6 x i16]* @g_14, i32 0, i64 2), align 2
  %158 = zext i16 %157 to i32
  %159 = icmp ne i32 %158, 0
  br i1 %159, label %164, label %160

; <label>:160                                     ; preds = %129
  %161 = load i8* @g_51, align 1
  %162 = sext i8 %161 to i32
  %163 = icmp ne i32 %162, 0
  br label %164

; <label>:164                                     ; preds = %160, %129
  %165 = phi i1 [ true, %129 ], [ %163, %160 ]
  %166 = zext i1 %165 to i32
  %167 = icmp sge i32 %156, %166
  %168 = zext i1 %167 to i32
  %169 = xor i32 %142, %168
  %170 = trunc i32 %169 to i16
  %171 = call zeroext i16 @safe_div_func_uint16_t_u_u(i16 zeroext %130, i16 zeroext %170)
  %172 = load i16* getelementptr inbounds ([6 x i16]* @g_14, i32 0, i64 5), align 2
  %173 = call zeroext i16 @safe_mod_func_uint16_t_u_u(i16 zeroext %171, i16 zeroext %172)
  %174 = icmp ne i16 %173, 0
  br i1 %174, label %175, label %206

; <label>:175                                     ; preds = %164
  store i32 0, i32* %i3, align 4
  br label %176

; <label>:176                                     ; preds = %183, %175
  %177 = load i32* %i3, align 4
  %178 = icmp slt i32 %177, 7
  br i1 %178, label %179, label %186

; <label>:179                                     ; preds = %176
  %180 = load i32* %i3, align 4
  %181 = sext i32 %180 to i64
  %182 = getelementptr inbounds [7 x i64]* %l_56, i32 0, i64 %181
  store i64 1282768208840480440, i64* %182, align 8
  br label %183

; <label>:183                                     ; preds = %179
  %184 = load i32* %i3, align 4
  %185 = add nsw i32 %184, 1
  store i32 %185, i32* %i3, align 4
  br label %176

; <label>:186                                     ; preds = %176
  %187 = call signext i16 @safe_sub_func_int16_t_s_s(i16 signext 1, i16 signext 25403)
  %188 = sext i16 %187 to i64
  %189 = load i16* getelementptr inbounds ([6 x i16]* @g_14, i32 0, i64 0), align 2
  %190 = zext i16 %189 to i64
  %191 = call i64 @safe_sub_func_uint64_t_u_u(i64 %188, i64 %190)
  %192 = icmp ne i64 %191, 0
  br i1 %192, label %193, label %197

; <label>:193                                     ; preds = %186
  %194 = getelementptr inbounds [7 x i64]* %l_56, i32 0, i64 6
  %195 = load i64* %194, align 8
  %196 = icmp sgt i64 2228369253, %195
  br label %197

; <label>:197                                     ; preds = %193, %186
  %198 = phi i1 [ false, %186 ], [ %196, %193 ]
  %199 = zext i1 %198 to i32
  %200 = load i32* @g_22, align 4
  %201 = and i32 %200, %199
  store i32 %201, i32* @g_22, align 4
  %202 = getelementptr inbounds [7 x i64]* %l_56, i32 0, i64 6
  %203 = load i64* %202, align 8
  %204 = trunc i64 %203 to i32
  %205 = call i32 @safe_add_func_int32_t_s_s(i32 %204, i32 -10)
  store i32 %205, i32* @g_22, align 4
  br label %209

; <label>:206                                     ; preds = %164
  %207 = load i8* @g_51, align 1
  %208 = sext i8 %207 to i32
  store i32 %208, i32* %1
  br label %219

; <label>:209                                     ; preds = %197
  br label %210

; <label>:210                                     ; preds = %209
  br label %211

; <label>:211                                     ; preds = %210
  %212 = load i64* %l_23, align 8
  %213 = trunc i64 %212 to i32
  %214 = call i32 @safe_sub_func_int32_t_s_s(i32 %213, i32 7)
  %215 = sext i32 %214 to i64
  store i64 %215, i64* %l_23, align 8
  br label %74

; <label>:216                                     ; preds = %74
  %217 = load i8* @g_51, align 1
  %218 = sext i8 %217 to i32
  store i32 %218, i32* %1
  br label %219

; <label>:219                                     ; preds = %216, %206, %126
  %220 = load i32* %1
  ret i32 %220
}

define i32* @func_2(i32 %p_3, i32* %p_4, i32* %p_5, i16 signext %p_6) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32*, align 8
  %3 = alloca i32*, align 8
  %4 = alloca i16, align 2
  store i32 %p_3, i32* %1, align 4
  store i32* %p_4, i32** %2, align 8
  store i32* %p_5, i32** %3, align 8
  store i16 %p_6, i16* %4, align 2
  %5 = load i32** %3, align 8
  ret i32* %5
}

define internal signext i16 @safe_mul_func_int16_t_s_s(i16 signext %si1, i16 signext %si2) nounwind uwtable {
  %1 = alloca i16, align 2
  %2 = alloca i16, align 2
  store i16 %si1, i16* %1, align 2
  store i16 %si2, i16* %2, align 2
  %3 = load i16* %1, align 2
  %4 = sext i16 %3 to i32
  %5 = load i16* %2, align 2
  %6 = sext i16 %5 to i32
  %7 = mul nsw i32 %4, %6
  %8 = trunc i32 %7 to i16
  ret i16 %8
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

define internal signext i8 @safe_lshift_func_int8_t_s_s(i8 signext %left, i32 %right) nounwind uwtable {
  %1 = alloca i8, align 1
  %2 = alloca i32, align 4
  store i8 %left, i8* %1, align 1
  store i32 %right, i32* %2, align 4
  %3 = load i8* %1, align 1
  %4 = sext i8 %3 to i32
  %5 = icmp slt i32 %4, 0
  br i1 %5, label %18, label %6

; <label>:6                                       ; preds = %0
  %7 = load i32* %2, align 4
  %8 = icmp slt i32 %7, 0
  br i1 %8, label %18, label %9

; <label>:9                                       ; preds = %6
  %10 = load i32* %2, align 4
  %11 = icmp sge i32 %10, 32
  br i1 %11, label %18, label %12

; <label>:12                                      ; preds = %9
  %13 = load i8* %1, align 1
  %14 = sext i8 %13 to i32
  %15 = load i32* %2, align 4
  %16 = ashr i32 127, %15
  %17 = icmp sgt i32 %14, %16
  br i1 %17, label %18, label %21

; <label>:18                                      ; preds = %12, %9, %6, %0
  %19 = load i8* %1, align 1
  %20 = sext i8 %19 to i32
  br label %26

; <label>:21                                      ; preds = %12
  %22 = load i8* %1, align 1
  %23 = sext i8 %22 to i32
  %24 = load i32* %2, align 4
  %25 = shl i32 %23, %24
  br label %26

; <label>:26                                      ; preds = %21, %18
  %27 = phi i32 [ %20, %18 ], [ %25, %21 ]
  %28 = trunc i32 %27 to i8
  ret i8 %28
}

define internal i64 @safe_mod_func_int64_t_s_s(i64 %si1, i64 %si2) nounwind uwtable {
  %1 = alloca i64, align 8
  %2 = alloca i64, align 8
  store i64 %si1, i64* %1, align 8
  store i64 %si2, i64* %2, align 8
  %3 = load i64* %2, align 8
  %4 = icmp eq i64 %3, 0
  br i1 %4, label %11, label %5

; <label>:5                                       ; preds = %0
  %6 = load i64* %1, align 8
  %7 = icmp eq i64 %6, -9223372036854775808
  br i1 %7, label %8, label %13

; <label>:8                                       ; preds = %5
  %9 = load i64* %2, align 8
  %10 = icmp eq i64 %9, -1
  br i1 %10, label %11, label %13

; <label>:11                                      ; preds = %8, %0
  %12 = load i64* %1, align 8
  br label %17

; <label>:13                                      ; preds = %8, %5
  %14 = load i64* %1, align 8
  %15 = load i64* %2, align 8
  %16 = srem i64 %14, %15
  br label %17

; <label>:17                                      ; preds = %13, %11
  %18 = phi i64 [ %12, %11 ], [ %16, %13 ]
  ret i64 %18
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

define internal zeroext i16 @safe_mod_func_uint16_t_u_u(i16 zeroext %ui1, i16 zeroext %ui2) nounwind uwtable {
  %1 = alloca i16, align 2
  %2 = alloca i16, align 2
  store i16 %ui1, i16* %1, align 2
  store i16 %ui2, i16* %2, align 2
  %3 = load i16* %2, align 2
  %4 = zext i16 %3 to i32
  %5 = icmp eq i32 %4, 0
  br i1 %5, label %6, label %9

; <label>:6                                       ; preds = %0
  %7 = load i16* %1, align 2
  %8 = zext i16 %7 to i32
  br label %15

; <label>:9                                       ; preds = %0
  %10 = load i16* %1, align 2
  %11 = zext i16 %10 to i32
  %12 = load i16* %2, align 2
  %13 = zext i16 %12 to i32
  %14 = srem i32 %11, %13
  br label %15

; <label>:15                                      ; preds = %9, %6
  %16 = phi i32 [ %8, %6 ], [ %14, %9 ]
  %17 = trunc i32 %16 to i16
  ret i16 %17
}

define internal zeroext i16 @safe_div_func_uint16_t_u_u(i16 zeroext %ui1, i16 zeroext %ui2) nounwind uwtable {
  %1 = alloca i16, align 2
  %2 = alloca i16, align 2
  store i16 %ui1, i16* %1, align 2
  store i16 %ui2, i16* %2, align 2
  %3 = load i16* %2, align 2
  %4 = zext i16 %3 to i32
  %5 = icmp eq i32 %4, 0
  br i1 %5, label %6, label %9

; <label>:6                                       ; preds = %0
  %7 = load i16* %1, align 2
  %8 = zext i16 %7 to i32
  br label %15

; <label>:9                                       ; preds = %0
  %10 = load i16* %1, align 2
  %11 = zext i16 %10 to i32
  %12 = load i16* %2, align 2
  %13 = zext i16 %12 to i32
  %14 = sdiv i32 %11, %13
  br label %15

; <label>:15                                      ; preds = %9, %6
  %16 = phi i32 [ %8, %6 ], [ %14, %9 ]
  %17 = trunc i32 %16 to i16
  ret i16 %17
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

define i32 @func_43(i32* %p_44, i64 %p_45, i32** %p_46, i32* %p_47) nounwind uwtable {
  %1 = alloca i32*, align 8
  %2 = alloca i64, align 8
  %3 = alloca i32**, align 8
  %4 = alloca i32*, align 8
  %l_48 = alloca [9 x i16], align 16
  %l_49 = alloca i16, align 2
  %i = alloca i32, align 4
  store i32* %p_44, i32** %1, align 8
  store i64 %p_45, i64* %2, align 8
  store i32** %p_46, i32*** %3, align 8
  store i32* %p_47, i32** %4, align 8
  store i16 -3963, i16* %l_49, align 2
  store i32 0, i32* %i, align 4
  br label %5

; <label>:5                                       ; preds = %12, %0
  %6 = load i32* %i, align 4
  %7 = icmp slt i32 %6, 9
  br i1 %7, label %8, label %15

; <label>:8                                       ; preds = %5
  %9 = load i32* %i, align 4
  %10 = sext i32 %9 to i64
  %11 = getelementptr inbounds [9 x i16]* %l_48, i32 0, i64 %10
  store i16 -1, i16* %11, align 2
  br label %12

; <label>:12                                      ; preds = %8
  %13 = load i32* %i, align 4
  %14 = add nsw i32 %13, 1
  store i32 %14, i32* %i, align 4
  br label %5

; <label>:15                                      ; preds = %5
  %16 = getelementptr inbounds [9 x i16]* %l_48, i32 0, i64 5
  %17 = load i16* %16, align 2
  %18 = sext i16 %17 to i64
  %19 = and i64 %18, -4
  %20 = trunc i64 %19 to i32
  %21 = load i32** %4, align 8
  store i32 %20, i32* %21
  %22 = load i16* %l_49, align 2
  %23 = sext i16 %22 to i32
  ret i32 %23
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

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  %i = alloca i32, align 4
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  %4 = call i32 @func_1()
  %5 = load i16* getelementptr inbounds ([6 x i16]* @g_14, i32 0, i64 0), align 2
  %6 = zext i16 %5 to i32
  %7 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str, i32 0, i32 0), i32 %6)
  %8 = load i16* getelementptr inbounds ([6 x i16]* @g_14, i32 0, i64 1), align 2
  %9 = zext i16 %8 to i32
  %10 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str1, i32 0, i32 0), i32 %9)
  %11 = load i16* getelementptr inbounds ([6 x i16]* @g_14, i32 0, i64 2), align 2
  %12 = zext i16 %11 to i32
  %13 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str2, i32 0, i32 0), i32 %12)
  %14 = load i16* getelementptr inbounds ([6 x i16]* @g_14, i32 0, i64 3), align 2
  %15 = zext i16 %14 to i32
  %16 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str3, i32 0, i32 0), i32 %15)
  %17 = load i16* getelementptr inbounds ([6 x i16]* @g_14, i32 0, i64 4), align 2
  %18 = zext i16 %17 to i32
  %19 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str4, i32 0, i32 0), i32 %18)
  %20 = load i16* getelementptr inbounds ([6 x i16]* @g_14, i32 0, i64 5), align 2
  %21 = zext i16 %20 to i32
  %22 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str5, i32 0, i32 0), i32 %21)
  %23 = load i16* getelementptr inbounds ([6 x i16]* @g_14, i32 0, i64 0), align 2
  %24 = zext i16 %23 to i32
  %25 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str, i32 0, i32 0), i32 %24)
  %26 = load i32* @g_22, align 4
  %27 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str6, i32 0, i32 0), i32 %26)
  %28 = load i8* @g_51, align 1
  %29 = sext i8 %28 to i32
  %30 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str7, i32 0, i32 0), i32 %29)
  %31 = load i32* %1
  ret i32 %31
}

declare i32 @printf(i8*, ...)
