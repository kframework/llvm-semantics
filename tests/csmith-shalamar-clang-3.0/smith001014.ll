; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith001014.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = global i32 -250458367, align 4
@g_4 = global i32 740926431, align 4
@g_3 = global i32* @g_4, align 8
@g_6 = global i32* null, align 8
@g_7 = global i32* null, align 8
@g_26 = global i32 -4, align 4
@g_25 = global i32* @g_26, align 8
@.str = private unnamed_addr constant [19 x i8] c"checksum g_2 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [19 x i8] c"checksum g_4 = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [20 x i8] c"checksum g_26 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define zeroext i16 @func_1() nounwind uwtable {
  %1 = alloca i16, align 2
  %l_5 = alloca i8, align 1
  %l_8 = alloca [7 x [4 x i32]], align 16
  %l_14 = alloca i32*, align 8
  %l_38 = alloca i32*, align 8
  %l_39 = alloca i32*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %l_11 = alloca i32, align 4
  %l_15 = alloca i32*, align 8
  %l_24 = alloca i32, align 4
  store i8 -90, i8* %l_5, align 1
  store i32* null, i32** %l_14, align 8
  store i32* null, i32** %l_38, align 8
  store i32* @g_4, i32** %l_39, align 8
  store i32 0, i32* %i, align 4
  br label %2

; <label>:2                                       ; preds = %20, %0
  %3 = load i32* %i, align 4
  %4 = icmp slt i32 %3, 7
  br i1 %4, label %5, label %23

; <label>:5                                       ; preds = %2
  store i32 0, i32* %j, align 4
  br label %6

; <label>:6                                       ; preds = %16, %5
  %7 = load i32* %j, align 4
  %8 = icmp slt i32 %7, 4
  br i1 %8, label %9, label %19

; <label>:9                                       ; preds = %6
  %10 = load i32* %j, align 4
  %11 = sext i32 %10 to i64
  %12 = load i32* %i, align 4
  %13 = sext i32 %12 to i64
  %14 = getelementptr inbounds [7 x [4 x i32]]* %l_8, i32 0, i64 %13
  %15 = getelementptr inbounds [4 x i32]* %14, i32 0, i64 %11
  store i32 506063425, i32* %15, align 4
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
  %24 = load i32* @g_2, align 4
  %25 = load volatile i32** @g_3, align 8
  %26 = load i32* %25
  %27 = and i32 %26, %24
  store i32 %27, i32* %25
  %28 = load volatile i32** @g_3, align 8
  %29 = load i32* %28
  %30 = and i32 %29, 166
  store i32 %30, i32* %28
  store i32 6, i32* @g_2, align 4
  br label %31

; <label>:31                                      ; preds = %188, %23
  %32 = load i32* @g_2, align 4
  %33 = icmp sge i32 %32, 0
  br i1 %33, label %34, label %191

; <label>:34                                      ; preds = %31
  store i32 3, i32* @g_4, align 4
  br label %35

; <label>:35                                      ; preds = %184, %34
  %36 = load i32* @g_4, align 4
  %37 = icmp sge i32 %36, 0
  br i1 %37, label %38, label %187

; <label>:38                                      ; preds = %35
  store i32 0, i32* %l_11, align 4
  store i32* null, i32** %l_15, align 8
  store i32 -707375256, i32* %l_24, align 4
  %39 = load i32* %l_11, align 4
  %40 = load i32** %l_14, align 8
  %41 = load i32** %l_15, align 8
  %42 = icmp ne i32* %40, %41
  %43 = zext i1 %42 to i32
  %44 = sext i32 %43 to i64
  %45 = load i32** %l_14, align 8
  %46 = icmp eq i32* @g_4, %45
  %47 = zext i1 %46 to i32
  %48 = sext i32 %47 to i64
  %49 = call i64 @safe_add_func_int64_t_s_s(i64 %44, i64 %48)
  %50 = load volatile i32** @g_3, align 8
  %51 = load i32* %50
  %52 = sext i32 %51 to i64
  %53 = icmp slt i64 %49, %52
  %54 = zext i1 %53 to i32
  %55 = load i32* @g_4, align 4
  %56 = icmp sgt i32 %54, %55
  %57 = zext i1 %56 to i32
  %58 = icmp slt i32 %39, %57
  %59 = zext i1 %58 to i32
  %60 = trunc i32 %59 to i8
  %61 = load i32* @g_4, align 4
  %62 = add nsw i32 %61, 2
  %63 = urem i32 %62, 4
  %64 = zext i32 %63 to i64
  %65 = load i32* @g_2, align 4
  %66 = urem i32 %65, 7
  %67 = zext i32 %66 to i64
  %68 = getelementptr inbounds [7 x [4 x i32]]* %l_8, i32 0, i64 %67
  %69 = getelementptr inbounds [4 x i32]* %68, i32 0, i64 %64
  %70 = load i32* %69, align 4
  %71 = zext i32 %70 to i64
  %72 = load i32* @g_4, align 4
  %73 = urem i32 %72, 4
  %74 = zext i32 %73 to i64
  %75 = load i32* @g_2, align 4
  %76 = urem i32 %75, 7
  %77 = zext i32 %76 to i64
  %78 = getelementptr inbounds [7 x [4 x i32]]* %l_8, i32 0, i64 %77
  %79 = getelementptr inbounds [4 x i32]* %78, i32 0, i64 %74
  %80 = load i32* %79, align 4
  %81 = load i32* @g_2, align 4
  %82 = icmp uge i32 %80, %81
  br i1 %82, label %99, label %83

; <label>:83                                      ; preds = %38
  %84 = load i32* @g_2, align 4
  %85 = trunc i32 %84 to i8
  %86 = load i32* @g_4, align 4
  %87 = urem i32 %86, 4
  %88 = zext i32 %87 to i64
  %89 = load i32* @g_2, align 4
  %90 = urem i32 %89, 7
  %91 = zext i32 %90 to i64
  %92 = getelementptr inbounds [7 x [4 x i32]]* %l_8, i32 0, i64 %91
  %93 = getelementptr inbounds [4 x i32]* %92, i32 0, i64 %88
  %94 = load i32* %93, align 4
  %95 = trunc i32 %94 to i8
  %96 = call signext i8 @safe_mod_func_int8_t_s_s(i8 signext %85, i8 signext %95)
  %97 = sext i8 %96 to i32
  %98 = icmp ne i32 %97, 0
  br label %99

; <label>:99                                      ; preds = %83, %38
  %100 = phi i1 [ true, %38 ], [ %98, %83 ]
  %101 = zext i1 %100 to i32
  %102 = load i32* @g_4, align 4
  %103 = icmp ne i32 %102, 0
  br i1 %103, label %115, label %104

; <label>:104                                     ; preds = %99
  %105 = load i32* @g_4, align 4
  %106 = urem i32 %105, 4
  %107 = zext i32 %106 to i64
  %108 = load i32* @g_2, align 4
  %109 = urem i32 %108, 7
  %110 = zext i32 %109 to i64
  %111 = getelementptr inbounds [7 x [4 x i32]]* %l_8, i32 0, i64 %110
  %112 = getelementptr inbounds [4 x i32]* %111, i32 0, i64 %107
  %113 = load i32* %112, align 4
  %114 = icmp ne i32 %113, 0
  br label %115

; <label>:115                                     ; preds = %104, %99
  %116 = phi i1 [ true, %99 ], [ %114, %104 ]
  %117 = zext i1 %116 to i32
  %118 = load i32* @g_4, align 4
  %119 = urem i32 %118, 4
  %120 = zext i32 %119 to i64
  %121 = load i32* @g_2, align 4
  %122 = urem i32 %121, 7
  %123 = zext i32 %122 to i64
  %124 = getelementptr inbounds [7 x [4 x i32]]* %l_8, i32 0, i64 %123
  %125 = getelementptr inbounds [4 x i32]* %124, i32 0, i64 %120
  %126 = load i32* %125, align 4
  %127 = load i32* @g_2, align 4
  %128 = and i32 %126, %127
  %129 = icmp ugt i32 %117, %128
  %130 = zext i1 %129 to i32
  %131 = icmp sle i32 %101, %130
  %132 = zext i1 %131 to i32
  %133 = sext i32 %132 to i64
  %134 = call i64 @safe_div_func_uint64_t_u_u(i64 %71, i64 %133)
  %135 = trunc i64 %134 to i8
  %136 = load i32* @g_4, align 4
  %137 = urem i32 %136, 4
  %138 = zext i32 %137 to i64
  %139 = load i32* @g_2, align 4
  %140 = urem i32 %139, 7
  %141 = zext i32 %140 to i64
  %142 = getelementptr inbounds [7 x [4 x i32]]* %l_8, i32 0, i64 %141
  %143 = getelementptr inbounds [4 x i32]* %142, i32 0, i64 %138
  %144 = load i32* %143, align 4
  %145 = zext i32 %144 to i64
  %146 = load i32* @g_2, align 4
  %147 = load i32* @g_4, align 4
  %148 = urem i32 %147, 4
  %149 = zext i32 %148 to i64
  %150 = load i32* @g_2, align 4
  %151 = urem i32 %150, 7
  %152 = zext i32 %151 to i64
  %153 = getelementptr inbounds [7 x [4 x i32]]* %l_8, i32 0, i64 %152
  %154 = getelementptr inbounds [4 x i32]* %153, i32 0, i64 %149
  %155 = load i32* %154, align 4
  %156 = icmp uge i32 %146, %155
  br i1 %156, label %160, label %157

; <label>:157                                     ; preds = %115
  %158 = load i32* %l_24, align 4
  %159 = icmp ne i32 %158, 0
  br label %160

; <label>:160                                     ; preds = %157, %115
  %161 = phi i1 [ true, %115 ], [ %159, %157 ]
  %162 = zext i1 %161 to i32
  %163 = load i32* @g_4, align 4
  %164 = xor i32 %162, %163
  %165 = sext i32 %164 to i64
  %166 = call i64 @safe_sub_func_uint64_t_u_u(i64 %145, i64 %165)
  %167 = trunc i64 %166 to i8
  %168 = call zeroext i8 @safe_mul_func_uint8_t_u_u(i8 zeroext %135, i8 zeroext %167)
  %169 = call signext i8 @safe_add_func_int8_t_s_s(i8 signext %60, i8 signext %168)
  %170 = sext i8 %169 to i32
  %171 = load volatile i32** @g_25, align 8
  store i32 %170, i32* %171
  %172 = load i32* %l_24, align 4
  %173 = icmp ne i32 %172, 0
  br i1 %173, label %174, label %175

; <label>:174                                     ; preds = %160
  br label %176

; <label>:175                                     ; preds = %160
  br label %176

; <label>:176                                     ; preds = %175, %174
  %177 = load volatile i32** @g_3, align 8
  %178 = load i32* %177
  %179 = icmp ne i32 %178, 0
  br i1 %179, label %180, label %181

; <label>:180                                     ; preds = %176
  br label %184

; <label>:181                                     ; preds = %176
  %182 = load i32* @g_2, align 4
  %183 = trunc i32 %182 to i16
  store i16 %183, i16* %1
  br label %225

; <label>:184                                     ; preds = %180
  %185 = load i32* @g_4, align 4
  %186 = add nsw i32 %185, -4
  store i32 %186, i32* @g_4, align 4
  br label %35

; <label>:187                                     ; preds = %35
  br label %188

; <label>:188                                     ; preds = %187
  %189 = load i32* @g_2, align 4
  %190 = add nsw i32 %189, -2
  store i32 %190, i32* @g_2, align 4
  br label %31

; <label>:191                                     ; preds = %31
  %192 = load volatile i32** @g_3, align 8
  %193 = load i32* %192
  %194 = load i32* @g_4, align 4
  %195 = call i32 @safe_mod_func_int32_t_s_s(i32 %193, i32 %194)
  %196 = trunc i32 %195 to i8
  %197 = load i32* @g_4, align 4
  %198 = trunc i32 %197 to i8
  %199 = call signext i8 @safe_mul_func_int8_t_s_s(i8 signext %196, i8 signext %198)
  %200 = sext i8 %199 to i32
  %201 = getelementptr inbounds [7 x [4 x i32]]* %l_8, i32 0, i64 2
  %202 = getelementptr inbounds [4 x i32]* %201, i32 0, i64 1
  %203 = load i32* %202, align 4
  %204 = call i32 @safe_sub_func_uint32_t_u_u(i32 %200, i32 %203)
  %205 = trunc i32 %204 to i16
  %206 = load i32* @g_26, align 4
  %207 = trunc i32 %206 to i16
  %208 = call signext i16 @safe_add_func_int16_t_s_s(i16 signext %205, i16 signext %207)
  %209 = sext i16 %208 to i64
  %210 = icmp sle i64 5, %209
  %211 = zext i1 %210 to i32
  %212 = load i32* @g_2, align 4
  %213 = trunc i32 %212 to i16
  %214 = getelementptr inbounds [7 x [4 x i32]]* %l_8, i32 0, i64 5
  %215 = getelementptr inbounds [4 x i32]* %214, i32 0, i64 1
  %216 = load i32* %215, align 4
  %217 = trunc i32 %216 to i16
  %218 = call signext i16 @safe_sub_func_int16_t_s_s(i16 signext %213, i16 signext %217)
  %219 = sext i16 %218 to i32
  %220 = icmp eq i32 %211, %219
  %221 = zext i1 %220 to i32
  %222 = load i32** %l_39, align 8
  store i32 %221, i32* %222
  %223 = load i32* @g_4, align 4
  %224 = trunc i32 %223 to i16
  store i16 %224, i16* %1
  br label %225

; <label>:225                                     ; preds = %191, %181
  %226 = load i16* %1
  ret i16 %226
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

define internal zeroext i8 @safe_mul_func_uint8_t_u_u(i8 zeroext %ui1, i8 zeroext %ui2) nounwind uwtable {
  %1 = alloca i8, align 1
  %2 = alloca i8, align 1
  store i8 %ui1, i8* %1, align 1
  store i8 %ui2, i8* %2, align 1
  %3 = load i8* %1, align 1
  %4 = zext i8 %3 to i32
  %5 = load i8* %2, align 1
  %6 = zext i8 %5 to i32
  %7 = mul i32 %4, %6
  %8 = trunc i32 %7 to i8
  ret i8 %8
}

define internal i64 @safe_div_func_uint64_t_u_u(i64 %ui1, i64 %ui2) nounwind uwtable {
  %1 = alloca i64, align 8
  %2 = alloca i64, align 8
  store i64 %ui1, i64* %1, align 8
  store i64 %ui2, i64* %2, align 8
  %3 = load i64* %2, align 8
  %4 = icmp eq i64 %3, 0
  br i1 %4, label %5, label %7

; <label>:5                                       ; preds = %0
  %6 = load i64* %1, align 8
  br label %11

; <label>:7                                       ; preds = %0
  %8 = load i64* %1, align 8
  %9 = load i64* %2, align 8
  %10 = udiv i64 %8, %9
  br label %11

; <label>:11                                      ; preds = %7, %5
  %12 = phi i64 [ %6, %5 ], [ %10, %7 ]
  ret i64 %12
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

define internal i32 @safe_mod_func_int32_t_s_s(i32 %si1, i32 %si2) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 %si1, i32* %1, align 4
  store i32 %si2, i32* %2, align 4
  %3 = load i32* %2, align 4
  %4 = icmp eq i32 %3, 0
  br i1 %4, label %11, label %5

; <label>:5                                       ; preds = %0
  %6 = load i32* %1, align 4
  %7 = icmp eq i32 %6, -2147483648
  br i1 %7, label %8, label %13

; <label>:8                                       ; preds = %5
  %9 = load i32* %2, align 4
  %10 = icmp eq i32 %9, -1
  br i1 %10, label %11, label %13

; <label>:11                                      ; preds = %8, %0
  %12 = load i32* %1, align 4
  br label %17

; <label>:13                                      ; preds = %8, %5
  %14 = load i32* %1, align 4
  %15 = load i32* %2, align 4
  %16 = srem i32 %14, %15
  br label %17

; <label>:17                                      ; preds = %13, %11
  %18 = phi i32 [ %12, %11 ], [ %16, %13 ]
  ret i32 %18
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

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  %4 = call zeroext i16 @func_1()
  %5 = load i32* @g_2, align 4
  %6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %5)
  %7 = load i32* @g_4, align 4
  %8 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str1, i32 0, i32 0), i32 %7)
  %9 = load i32* @g_26, align 4
  %10 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str2, i32 0, i32 0), i32 %9)
  %11 = load i32* %1
  ret i32 %11
}

declare i32 @printf(i8*, ...)
