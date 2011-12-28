; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith000219.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_5 = global i8 -118, align 1
@g_7 = global i32 -1, align 4
@g_6 = global i32* @g_7, align 8
@g_8 = global i32 -1, align 4
@func_1.l_15 = internal constant [6 x [7 x [1 x [1 x i32]]]] [[7 x [1 x [1 x i32]]] [[1 x [1 x i32]] [[1 x i32] [i32 124798387]], [1 x [1 x i32]] [[1 x i32] [i32 124798387]], [1 x [1 x i32]] [[1 x i32] [i32 124798387]], [1 x [1 x i32]] [[1 x i32] [i32 124798387]], [1 x [1 x i32]] [[1 x i32] [i32 124798387]], [1 x [1 x i32]] [[1 x i32] [i32 124798387]], [1 x [1 x i32]] [[1 x i32] [i32 124798387]]], [7 x [1 x [1 x i32]]] [[1 x [1 x i32]] [[1 x i32] [i32 124798387]], [1 x [1 x i32]] [[1 x i32] [i32 124798387]], [1 x [1 x i32]] [[1 x i32] [i32 124798387]], [1 x [1 x i32]] [[1 x i32] [i32 124798387]], [1 x [1 x i32]] [[1 x i32] [i32 124798387]], [1 x [1 x i32]] [[1 x i32] [i32 124798387]], [1 x [1 x i32]] [[1 x i32] [i32 124798387]]], [7 x [1 x [1 x i32]]] [[1 x [1 x i32]] [[1 x i32] [i32 124798387]], [1 x [1 x i32]] [[1 x i32] [i32 124798387]], [1 x [1 x i32]] [[1 x i32] [i32 124798387]], [1 x [1 x i32]] [[1 x i32] [i32 124798387]], [1 x [1 x i32]] [[1 x i32] [i32 124798387]], [1 x [1 x i32]] [[1 x i32] [i32 124798387]], [1 x [1 x i32]] [[1 x i32] [i32 124798387]]], [7 x [1 x [1 x i32]]] [[1 x [1 x i32]] [[1 x i32] [i32 124798387]], [1 x [1 x i32]] [[1 x i32] [i32 124798387]], [1 x [1 x i32]] [[1 x i32] [i32 124798387]], [1 x [1 x i32]] [[1 x i32] [i32 124798387]], [1 x [1 x i32]] [[1 x i32] [i32 124798387]], [1 x [1 x i32]] [[1 x i32] [i32 124798387]], [1 x [1 x i32]] [[1 x i32] [i32 124798387]]], [7 x [1 x [1 x i32]]] [[1 x [1 x i32]] [[1 x i32] [i32 124798387]], [1 x [1 x i32]] [[1 x i32] [i32 124798387]], [1 x [1 x i32]] [[1 x i32] [i32 124798387]], [1 x [1 x i32]] [[1 x i32] [i32 124798387]], [1 x [1 x i32]] [[1 x i32] [i32 124798387]], [1 x [1 x i32]] [[1 x i32] [i32 124798387]], [1 x [1 x i32]] [[1 x i32] [i32 124798387]]], [7 x [1 x [1 x i32]]] [[1 x [1 x i32]] [[1 x i32] [i32 124798387]], [1 x [1 x i32]] [[1 x i32] [i32 124798387]], [1 x [1 x i32]] [[1 x i32] [i32 124798387]], [1 x [1 x i32]] [[1 x i32] [i32 124798387]], [1 x [1 x i32]] [[1 x i32] [i32 124798387]], [1 x [1 x i32]] [[1 x i32] [i32 124798387]], [1 x [1 x i32]] [[1 x i32] [i32 124798387]]]], align 16
@.str = private unnamed_addr constant [19 x i8] c"checksum g_5 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [19 x i8] c"checksum g_7 = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [19 x i8] c"checksum g_8 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i64 @func_1() nounwind uwtable {
  %1 = alloca i64, align 8
  %l_2 = alloca [6 x i32], align 16
  %l_25 = alloca i32*, align 8
  %i = alloca i32, align 4
  %l_11 = alloca i8, align 1
  %l_16 = alloca i32*, align 8
  %i1 = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %l = alloca i32, align 4
  %l_28 = alloca i32, align 4
  %l_33 = alloca [4 x [9 x i32*]], align 16
  %i2 = alloca i32, align 4
  %j3 = alloca i32, align 4
  %l_37 = alloca [3 x [3 x [2 x [5 x [1 x [1 x i32]]]]]], align 16
  %i4 = alloca i32, align 4
  %j5 = alloca i32, align 4
  %k6 = alloca i32, align 4
  %l7 = alloca i32, align 4
  %m = alloca i32, align 4
  %n = alloca i32, align 4
  %l_36 = alloca i8, align 1
  %l_38 = alloca [1 x [6 x [1 x [4 x i64]]]], align 16
  %i8 = alloca i32, align 4
  %j9 = alloca i32, align 4
  %k10 = alloca i32, align 4
  %l11 = alloca i32, align 4
  store i32* @g_7, i32** %l_25, align 8
  store i32 0, i32* %i, align 4
  br label %2

; <label>:2                                       ; preds = %9, %0
  %3 = load i32* %i, align 4
  %4 = icmp slt i32 %3, 6
  br i1 %4, label %5, label %12

; <label>:5                                       ; preds = %2
  %6 = load i32* %i, align 4
  %7 = sext i32 %6 to i64
  %8 = getelementptr inbounds [6 x i32]* %l_2, i32 0, i64 %7
  store i32 -4, i32* %8, align 4
  br label %9

; <label>:9                                       ; preds = %5
  %10 = load i32* %i, align 4
  %11 = add nsw i32 %10, 1
  store i32 %11, i32* %i, align 4
  br label %2

; <label>:12                                      ; preds = %2
  %13 = getelementptr inbounds [6 x i32]* %l_2, i32 0, i64 3
  %14 = load i32* %13, align 4
  %15 = getelementptr inbounds [6 x i32]* %l_2, i32 0, i64 3
  %16 = load i32* %15, align 4
  %17 = load volatile i8* @g_5, align 1
  %18 = zext i8 %17 to i32
  %19 = icmp slt i32 %16, %18
  br i1 %19, label %26, label %20

; <label>:20                                      ; preds = %12
  %21 = getelementptr inbounds [6 x i32]* %l_2, i32 0, i64 3
  %22 = load i32* %21, align 4
  %23 = load volatile i8* @g_5, align 1
  %24 = zext i8 %23 to i32
  %25 = icmp sge i32 %22, %24
  br label %26

; <label>:26                                      ; preds = %20, %12
  %27 = phi i1 [ true, %12 ], [ %25, %20 ]
  %28 = zext i1 %27 to i32
  %29 = trunc i32 %28 to i16
  %30 = call zeroext i16 @safe_lshift_func_uint16_t_u_s(i16 zeroext %29, i32 1152174884)
  %31 = zext i16 %30 to i32
  %32 = icmp eq i32 %14, %31
  %33 = zext i1 %32 to i32
  %34 = getelementptr inbounds [6 x i32]* %l_2, i32 0, i64 3
  %35 = load i32* %34, align 4
  %36 = icmp sle i32 %33, %35
  %37 = zext i1 %36 to i32
  %38 = getelementptr inbounds [6 x i32]* %l_2, i32 0, i64 3
  %39 = load i32* %38, align 4
  %40 = icmp sle i32 %37, %39
  %41 = zext i1 %40 to i32
  %42 = load volatile i32** @g_6, align 8
  store i32 %41, i32* %42
  %43 = load volatile i32** @g_6, align 8
  %44 = load i32* %43
  %45 = load i32* @g_8, align 4
  %46 = or i32 %45, %44
  store i32 %46, i32* @g_8, align 4
  %47 = load volatile i32** @g_6, align 8
  %48 = load i32* %47
  %49 = load i32* @g_8, align 4
  %50 = and i32 %48, %49
  %51 = trunc i32 %50 to i16
  %52 = load i32* @g_7, align 4
  %53 = sext i32 %52 to i64
  %54 = and i64 %53, 1
  %55 = trunc i64 %54 to i16
  %56 = call zeroext i16 @safe_mul_func_uint16_t_u_u(i16 zeroext %51, i16 zeroext %55)
  %57 = icmp ne i16 %56, 0
  br i1 %57, label %58, label %293

; <label>:58                                      ; preds = %26
  store i8 -9, i8* %l_11, align 1
  %59 = load volatile i32** @g_6, align 8
  %60 = load i32* %59
  %61 = trunc i32 %60 to i8
  store i8 %61, i8* %l_11, align 1
  br label %62

; <label>:62                                      ; preds = %84, %58
  store volatile i8 0, i8* @g_5, align 1
  br label %63

; <label>:63                                      ; preds = %71, %62
  %64 = load volatile i8* @g_5, align 1
  %65 = zext i8 %64 to i32
  %66 = icmp slt i32 %65, 6
  br i1 %66, label %67, label %76

; <label>:67                                      ; preds = %63
  %68 = load volatile i8* @g_5, align 1
  %69 = zext i8 %68 to i64
  %70 = getelementptr inbounds [6 x i32]* %l_2, i32 0, i64 %69
  store i32 5369819, i32* %70, align 4
  br label %71

; <label>:71                                      ; preds = %67
  %72 = load volatile i8* @g_5, align 1
  %73 = zext i8 %72 to i32
  %74 = add nsw i32 %73, 1
  %75 = trunc i32 %74 to i8
  store volatile i8 %75, i8* @g_5, align 1
  br label %63

; <label>:76                                      ; preds = %63
  store i8 22, i8* %l_11, align 1
  br label %77

; <label>:77                                      ; preds = %98, %76
  %78 = load i8* %l_11, align 1
  %79 = sext i8 %78 to i32
  %80 = icmp sge i32 %79, 15
  br i1 %80, label %81, label %103

; <label>:81                                      ; preds = %77
  store i32* @g_8, i32** %l_16, align 8
  %82 = load i8* %l_11, align 1
  %83 = icmp ne i8 %82, 0
  br i1 %83, label %84, label %85

; <label>:84                                      ; preds = %81
  br label %62

; <label>:85                                      ; preds = %81
  %86 = load volatile i32** @g_6, align 8
  %87 = load i32* %86
  %88 = icmp ne i32 %87, 0
  br i1 %88, label %89, label %92

; <label>:89                                      ; preds = %85
  %90 = load i32* getelementptr inbounds ([6 x [7 x [1 x [1 x i32]]]]* @func_1.l_15, i32 0, i64 3, i64 0, i64 0, i64 0), align 4
  %91 = icmp ne i32 %90, 0
  br label %92

; <label>:92                                      ; preds = %89, %85
  %93 = phi i1 [ false, %85 ], [ %91, %89 ]
  %94 = zext i1 %93 to i32
  %95 = load i32** %l_16, align 8
  %96 = load i32* %95
  %97 = or i32 %96, %94
  store i32 %97, i32* %95
  br label %98

; <label>:98                                      ; preds = %92
  %99 = load i8* %l_11, align 1
  %100 = sext i8 %99 to i32
  %101 = call i32 @safe_sub_func_int32_t_s_s(i32 %100, i32 1)
  %102 = trunc i32 %101 to i8
  store i8 %102, i8* %l_11, align 1
  br label %77

; <label>:103                                     ; preds = %77
  %104 = load volatile i32** @g_6, align 8
  %105 = load i32* %104
  %106 = trunc i32 %105 to i8
  %107 = call zeroext i8 @safe_rshift_func_uint8_t_u_s(i8 zeroext %106, i32 5)
  %108 = icmp ne i8 %107, 0
  br i1 %108, label %109, label %121

; <label>:109                                     ; preds = %103
  store volatile i8 15, i8* @g_5, align 1
  br label %110

; <label>:110                                     ; preds = %117, %109
  %111 = load volatile i8* @g_5, align 1
  %112 = zext i8 %111 to i32
  %113 = icmp ne i32 %112, 0
  br i1 %113, label %114, label %120

; <label>:114                                     ; preds = %110
  %115 = load i32* @g_7, align 4
  %116 = sext i32 %115 to i64
  store i64 %116, i64* %1
  br label %361
                                                  ; No predecessors!
  %118 = load volatile i8* @g_5, align 1
  %119 = call signext i8 @safe_sub_func_int8_t_s_s(i8 signext %118, i8 signext 1)
  store volatile i8 %119, i8* @g_5, align 1
  br label %110

; <label>:120                                     ; preds = %110
  br label %292

; <label>:121                                     ; preds = %103
  store i32 0, i32* %l_28, align 4
  store i32 0, i32* %i2, align 4
  br label %122

; <label>:122                                     ; preds = %140, %121
  %123 = load i32* %i2, align 4
  %124 = icmp slt i32 %123, 4
  br i1 %124, label %125, label %143

; <label>:125                                     ; preds = %122
  store i32 0, i32* %j3, align 4
  br label %126

; <label>:126                                     ; preds = %136, %125
  %127 = load i32* %j3, align 4
  %128 = icmp slt i32 %127, 9
  br i1 %128, label %129, label %139

; <label>:129                                     ; preds = %126
  %130 = load i32* %j3, align 4
  %131 = sext i32 %130 to i64
  %132 = load i32* %i2, align 4
  %133 = sext i32 %132 to i64
  %134 = getelementptr inbounds [4 x [9 x i32*]]* %l_33, i32 0, i64 %133
  %135 = getelementptr inbounds [9 x i32*]* %134, i32 0, i64 %131
  store i32* null, i32** %135, align 8
  br label %136

; <label>:136                                     ; preds = %129
  %137 = load i32* %j3, align 4
  %138 = add nsw i32 %137, 1
  store i32 %138, i32* %j3, align 4
  br label %126

; <label>:139                                     ; preds = %126
  br label %140

; <label>:140                                     ; preds = %139
  %141 = load i32* %i2, align 4
  %142 = add nsw i32 %141, 1
  store i32 %142, i32* %i2, align 4
  br label %122

; <label>:143                                     ; preds = %122
  store volatile i8 -29, i8* @g_5, align 1
  br label %144

; <label>:144                                     ; preds = %286, %143
  %145 = load volatile i8* @g_5, align 1
  %146 = zext i8 %145 to i32
  %147 = icmp slt i32 %146, -3
  br i1 %147, label %148, label %291

; <label>:148                                     ; preds = %144
  store i32 0, i32* %i4, align 4
  br label %149

; <label>:149                                     ; preds = %211, %148
  %150 = load i32* %i4, align 4
  %151 = icmp slt i32 %150, 3
  br i1 %151, label %152, label %214

; <label>:152                                     ; preds = %149
  store i32 0, i32* %j5, align 4
  br label %153

; <label>:153                                     ; preds = %207, %152
  %154 = load i32* %j5, align 4
  %155 = icmp slt i32 %154, 3
  br i1 %155, label %156, label %210

; <label>:156                                     ; preds = %153
  store i32 0, i32* %k6, align 4
  br label %157

; <label>:157                                     ; preds = %203, %156
  %158 = load i32* %k6, align 4
  %159 = icmp slt i32 %158, 2
  br i1 %159, label %160, label %206

; <label>:160                                     ; preds = %157
  store i32 0, i32* %l7, align 4
  br label %161

; <label>:161                                     ; preds = %199, %160
  %162 = load i32* %l7, align 4
  %163 = icmp slt i32 %162, 5
  br i1 %163, label %164, label %202

; <label>:164                                     ; preds = %161
  store i32 0, i32* %m, align 4
  br label %165

; <label>:165                                     ; preds = %195, %164
  %166 = load i32* %m, align 4
  %167 = icmp slt i32 %166, 1
  br i1 %167, label %168, label %198

; <label>:168                                     ; preds = %165
  store i32 0, i32* %n, align 4
  br label %169

; <label>:169                                     ; preds = %191, %168
  %170 = load i32* %n, align 4
  %171 = icmp slt i32 %170, 1
  br i1 %171, label %172, label %194

; <label>:172                                     ; preds = %169
  %173 = load i32* %n, align 4
  %174 = sext i32 %173 to i64
  %175 = load i32* %m, align 4
  %176 = sext i32 %175 to i64
  %177 = load i32* %l7, align 4
  %178 = sext i32 %177 to i64
  %179 = load i32* %k6, align 4
  %180 = sext i32 %179 to i64
  %181 = load i32* %j5, align 4
  %182 = sext i32 %181 to i64
  %183 = load i32* %i4, align 4
  %184 = sext i32 %183 to i64
  %185 = getelementptr inbounds [3 x [3 x [2 x [5 x [1 x [1 x i32]]]]]]* %l_37, i32 0, i64 %184
  %186 = getelementptr inbounds [3 x [2 x [5 x [1 x [1 x i32]]]]]* %185, i32 0, i64 %182
  %187 = getelementptr inbounds [2 x [5 x [1 x [1 x i32]]]]* %186, i32 0, i64 %180
  %188 = getelementptr inbounds [5 x [1 x [1 x i32]]]* %187, i32 0, i64 %178
  %189 = getelementptr inbounds [1 x [1 x i32]]* %188, i32 0, i64 %176
  %190 = getelementptr inbounds [1 x i32]* %189, i32 0, i64 %174
  store i32 -1, i32* %190, align 4
  br label %191

; <label>:191                                     ; preds = %172
  %192 = load i32* %n, align 4
  %193 = add nsw i32 %192, 1
  store i32 %193, i32* %n, align 4
  br label %169

; <label>:194                                     ; preds = %169
  br label %195

; <label>:195                                     ; preds = %194
  %196 = load i32* %m, align 4
  %197 = add nsw i32 %196, 1
  store i32 %197, i32* %m, align 4
  br label %165

; <label>:198                                     ; preds = %165
  br label %199

; <label>:199                                     ; preds = %198
  %200 = load i32* %l7, align 4
  %201 = add nsw i32 %200, 1
  store i32 %201, i32* %l7, align 4
  br label %161

; <label>:202                                     ; preds = %161
  br label %203

; <label>:203                                     ; preds = %202
  %204 = load i32* %k6, align 4
  %205 = add nsw i32 %204, 1
  store i32 %205, i32* %k6, align 4
  br label %157

; <label>:206                                     ; preds = %157
  br label %207

; <label>:207                                     ; preds = %206
  %208 = load i32* %j5, align 4
  %209 = add nsw i32 %208, 1
  store i32 %209, i32* %j5, align 4
  br label %153

; <label>:210                                     ; preds = %153
  br label %211

; <label>:211                                     ; preds = %210
  %212 = load i32* %i4, align 4
  %213 = add nsw i32 %212, 1
  store i32 %213, i32* %i4, align 4
  br label %149

; <label>:214                                     ; preds = %149
  %215 = load i32** %l_25, align 8
  %216 = icmp ne i32* @g_8, %215
  %217 = zext i1 %216 to i32
  %218 = load volatile i32** @g_6, align 8
  %219 = load i32* %218
  %220 = trunc i32 %219 to i8
  %221 = call signext i8 @safe_div_func_int8_t_s_s(i8 signext 0, i8 signext %220)
  %222 = sext i8 %221 to i32
  %223 = icmp sle i32 %217, %222
  %224 = zext i1 %223 to i32
  %225 = load i8* %l_11, align 1
  %226 = sext i8 %225 to i32
  %227 = load i32** %l_25, align 8
  %228 = load i32* %227
  %229 = xor i32 %226, %228
  %230 = icmp ne i32 %229, 0
  br i1 %230, label %231, label %232

; <label>:231                                     ; preds = %214
  br label %232

; <label>:232                                     ; preds = %231, %214
  %233 = phi i1 [ false, %214 ], [ false, %231 ]
  %234 = zext i1 %233 to i32
  %235 = sext i32 %234 to i64
  %236 = getelementptr inbounds [4 x [9 x i32*]]* %l_33, i32 0, i64 3
  %237 = getelementptr inbounds [9 x i32*]* %236, i32 0, i64 1
  %238 = load i32** %237, align 8
  %239 = icmp eq i32* @g_8, %238
  %240 = zext i1 %239 to i32
  %241 = sext i32 %240 to i64
  %242 = load i32* @g_7, align 4
  %243 = sext i32 %242 to i64
  %244 = call i64 @safe_add_func_int64_t_s_s(i64 %241, i64 %243)
  %245 = icmp sgt i64 %235, %244
  %246 = zext i1 %245 to i32
  %247 = sext i32 %246 to i64
  %248 = or i64 %247, -6
  %249 = trunc i64 %248 to i32
  %250 = load i32** %l_25, align 8
  %251 = load i32* %250
  %252 = call i32 @safe_mod_func_uint32_t_u_u(i32 %249, i32 %251)
  %253 = call i32 @safe_div_func_uint32_t_u_u(i32 %224, i32 %252)
  %254 = icmp ne i32 %253, 0
  br i1 %254, label %255, label %274

; <label>:255                                     ; preds = %232
  store i32 12, i32* @g_7, align 4
  br label %256

; <label>:256                                     ; preds = %262, %255
  %257 = load i32* @g_7, align 4
  %258 = icmp sle i32 %257, -8
  br i1 %258, label %259, label %265

; <label>:259                                     ; preds = %256
  store i8 0, i8* %l_36, align 1
  store i8 0, i8* %l_36, align 1
  %260 = load i8* %l_36, align 1
  %261 = sext i8 %260 to i64
  store i64 %261, i64* %1
  br label %361
                                                  ; No predecessors!
  %263 = load i32* @g_7, align 4
  %264 = call i32 @safe_sub_func_int32_t_s_s(i32 %263, i32 9)
  store i32 %264, i32* @g_7, align 4
  br label %256

; <label>:265                                     ; preds = %256
  %266 = getelementptr inbounds [3 x [3 x [2 x [5 x [1 x [1 x i32]]]]]]* %l_37, i32 0, i64 0
  %267 = getelementptr inbounds [3 x [2 x [5 x [1 x [1 x i32]]]]]* %266, i32 0, i64 1
  %268 = getelementptr inbounds [2 x [5 x [1 x [1 x i32]]]]* %267, i32 0, i64 1
  %269 = getelementptr inbounds [5 x [1 x [1 x i32]]]* %268, i32 0, i64 1
  %270 = getelementptr inbounds [1 x [1 x i32]]* %269, i32 0, i64 0
  %271 = getelementptr inbounds [1 x i32]* %270, i32 0, i64 0
  %272 = load i32* %271, align 4
  %273 = sext i32 %272 to i64
  store i64 %273, i64* %1
  br label %361

; <label>:274                                     ; preds = %232
  %275 = getelementptr inbounds [3 x [3 x [2 x [5 x [1 x [1 x i32]]]]]]* %l_37, i32 0, i64 2
  %276 = getelementptr inbounds [3 x [2 x [5 x [1 x [1 x i32]]]]]* %275, i32 0, i64 1
  %277 = getelementptr inbounds [2 x [5 x [1 x [1 x i32]]]]* %276, i32 0, i64 0
  %278 = getelementptr inbounds [5 x [1 x [1 x i32]]]* %277, i32 0, i64 2
  %279 = getelementptr inbounds [1 x [1 x i32]]* %278, i32 0, i64 0
  %280 = getelementptr inbounds [1 x i32]* %279, i32 0, i64 0
  %281 = load i32* %280, align 4
  %282 = icmp ne i32 %281, 0
  br i1 %282, label %283, label %284

; <label>:283                                     ; preds = %274
  br label %291

; <label>:284                                     ; preds = %274
  br label %285

; <label>:285                                     ; preds = %284
  br label %286

; <label>:286                                     ; preds = %285
  %287 = load volatile i8* @g_5, align 1
  %288 = zext i8 %287 to i64
  %289 = call i64 @safe_sub_func_int64_t_s_s(i64 %288, i64 1)
  %290 = trunc i64 %289 to i8
  store volatile i8 %290, i8* @g_5, align 1
  br label %144

; <label>:291                                     ; preds = %283, %144
  br label %292

; <label>:292                                     ; preds = %291, %120
  br label %357

; <label>:293                                     ; preds = %26
  store i32 0, i32* %i8, align 4
  br label %294

; <label>:294                                     ; preds = %334, %293
  %295 = load i32* %i8, align 4
  %296 = icmp slt i32 %295, 1
  br i1 %296, label %297, label %337

; <label>:297                                     ; preds = %294
  store i32 0, i32* %j9, align 4
  br label %298

; <label>:298                                     ; preds = %330, %297
  %299 = load i32* %j9, align 4
  %300 = icmp slt i32 %299, 6
  br i1 %300, label %301, label %333

; <label>:301                                     ; preds = %298
  store i32 0, i32* %k10, align 4
  br label %302

; <label>:302                                     ; preds = %326, %301
  %303 = load i32* %k10, align 4
  %304 = icmp slt i32 %303, 1
  br i1 %304, label %305, label %329

; <label>:305                                     ; preds = %302
  store i32 0, i32* %l11, align 4
  br label %306

; <label>:306                                     ; preds = %322, %305
  %307 = load i32* %l11, align 4
  %308 = icmp slt i32 %307, 4
  br i1 %308, label %309, label %325

; <label>:309                                     ; preds = %306
  %310 = load i32* %l11, align 4
  %311 = sext i32 %310 to i64
  %312 = load i32* %k10, align 4
  %313 = sext i32 %312 to i64
  %314 = load i32* %j9, align 4
  %315 = sext i32 %314 to i64
  %316 = load i32* %i8, align 4
  %317 = sext i32 %316 to i64
  %318 = getelementptr inbounds [1 x [6 x [1 x [4 x i64]]]]* %l_38, i32 0, i64 %317
  %319 = getelementptr inbounds [6 x [1 x [4 x i64]]]* %318, i32 0, i64 %315
  %320 = getelementptr inbounds [1 x [4 x i64]]* %319, i32 0, i64 %313
  %321 = getelementptr inbounds [4 x i64]* %320, i32 0, i64 %311
  store i64 -1, i64* %321, align 8
  br label %322

; <label>:322                                     ; preds = %309
  %323 = load i32* %l11, align 4
  %324 = add nsw i32 %323, 1
  store i32 %324, i32* %l11, align 4
  br label %306

; <label>:325                                     ; preds = %306
  br label %326

; <label>:326                                     ; preds = %325
  %327 = load i32* %k10, align 4
  %328 = add nsw i32 %327, 1
  store i32 %328, i32* %k10, align 4
  br label %302

; <label>:329                                     ; preds = %302
  br label %330

; <label>:330                                     ; preds = %329
  %331 = load i32* %j9, align 4
  %332 = add nsw i32 %331, 1
  store i32 %332, i32* %j9, align 4
  br label %298

; <label>:333                                     ; preds = %298
  br label %334

; <label>:334                                     ; preds = %333
  %335 = load i32* %i8, align 4
  %336 = add nsw i32 %335, 1
  store i32 %336, i32* %i8, align 4
  br label %294

; <label>:337                                     ; preds = %294
  store i32 3, i32* @g_8, align 4
  br label %338

; <label>:338                                     ; preds = %347, %337
  %339 = load i32* @g_8, align 4
  %340 = icmp slt i32 %339, 6
  br i1 %340, label %341, label %350

; <label>:341                                     ; preds = %338
  %342 = getelementptr inbounds [1 x [6 x [1 x [4 x i64]]]]* %l_38, i32 0, i64 0
  %343 = getelementptr inbounds [6 x [1 x [4 x i64]]]* %342, i32 0, i64 4
  %344 = getelementptr inbounds [1 x [4 x i64]]* %343, i32 0, i64 0
  %345 = getelementptr inbounds [4 x i64]* %344, i32 0, i64 1
  %346 = load i64* %345, align 8
  store i64 %346, i64* %1
  br label %361
                                                  ; No predecessors!
  %348 = load i32* @g_8, align 4
  %349 = add nsw i32 %348, 4
  store i32 %349, i32* @g_8, align 4
  br label %338

; <label>:350                                     ; preds = %338
  %351 = load i32** %l_25, align 8
  %352 = icmp eq i32* %351, null
  %353 = zext i1 %352 to i32
  %354 = load i32** %l_25, align 8
  %355 = load i32* %354
  %356 = and i32 %355, %353
  store i32 %356, i32* %354
  br label %357

; <label>:357                                     ; preds = %350, %292
  %358 = load i32** %l_25, align 8
  %359 = load i32* %358
  %360 = sext i32 %359 to i64
  store i64 %360, i64* %1
  br label %361

; <label>:361                                     ; preds = %357, %341, %265, %259, %114
  %362 = load i64* %1
  ret i64 %362
}

define internal zeroext i16 @safe_lshift_func_uint16_t_u_s(i16 zeroext %left, i32 %right) nounwind uwtable {
  %1 = alloca i16, align 2
  %2 = alloca i32, align 4
  store i16 %left, i16* %1, align 2
  store i32 %right, i32* %2, align 4
  %3 = load i32* %2, align 4
  %4 = icmp slt i32 %3, 0
  br i1 %4, label %14, label %5

; <label>:5                                       ; preds = %0
  %6 = load i32* %2, align 4
  %7 = icmp sge i32 %6, 32
  br i1 %7, label %14, label %8

; <label>:8                                       ; preds = %5
  %9 = load i16* %1, align 2
  %10 = zext i16 %9 to i32
  %11 = load i32* %2, align 4
  %12 = ashr i32 65535, %11
  %13 = icmp sgt i32 %10, %12
  br i1 %13, label %14, label %17

; <label>:14                                      ; preds = %8, %5, %0
  %15 = load i16* %1, align 2
  %16 = zext i16 %15 to i32
  br label %22

; <label>:17                                      ; preds = %8
  %18 = load i16* %1, align 2
  %19 = zext i16 %18 to i32
  %20 = load i32* %2, align 4
  %21 = shl i32 %19, %20
  br label %22

; <label>:22                                      ; preds = %17, %14
  %23 = phi i32 [ %16, %14 ], [ %21, %17 ]
  %24 = trunc i32 %23 to i16
  ret i16 %24
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

define internal i32 @safe_div_func_uint32_t_u_u(i32 %ui1, i32 %ui2) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 %ui1, i32* %1, align 4
  store i32 %ui2, i32* %2, align 4
  %3 = load i32* %2, align 4
  %4 = icmp eq i32 %3, 0
  br i1 %4, label %5, label %7

; <label>:5                                       ; preds = %0
  %6 = load i32* %1, align 4
  br label %11

; <label>:7                                       ; preds = %0
  %8 = load i32* %1, align 4
  %9 = load i32* %2, align 4
  %10 = udiv i32 %8, %9
  br label %11

; <label>:11                                      ; preds = %7, %5
  %12 = phi i32 [ %6, %5 ], [ %10, %7 ]
  ret i32 %12
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

define internal i32 @safe_mod_func_uint32_t_u_u(i32 %ui1, i32 %ui2) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 %ui1, i32* %1, align 4
  store i32 %ui2, i32* %2, align 4
  %3 = load i32* %2, align 4
  %4 = icmp eq i32 %3, 0
  br i1 %4, label %5, label %7

; <label>:5                                       ; preds = %0
  %6 = load i32* %1, align 4
  br label %11

; <label>:7                                       ; preds = %0
  %8 = load i32* %1, align 4
  %9 = load i32* %2, align 4
  %10 = urem i32 %8, %9
  br label %11

; <label>:11                                      ; preds = %7, %5
  %12 = phi i32 [ %6, %5 ], [ %10, %7 ]
  ret i32 %12
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

define internal i64 @safe_sub_func_int64_t_s_s(i64 %si1, i64 %si2) nounwind uwtable {
  %1 = alloca i64, align 8
  %2 = alloca i64, align 8
  store i64 %si1, i64* %1, align 8
  store i64 %si2, i64* %2, align 8
  %3 = load i64* %1, align 8
  %4 = load i64* %2, align 8
  %5 = xor i64 %3, %4
  %6 = load i64* %1, align 8
  %7 = load i64* %1, align 8
  %8 = load i64* %2, align 8
  %9 = xor i64 %7, %8
  %10 = and i64 %9, -9223372036854775808
  %11 = xor i64 %6, %10
  %12 = load i64* %2, align 8
  %13 = sub nsw i64 %11, %12
  %14 = load i64* %2, align 8
  %15 = xor i64 %13, %14
  %16 = and i64 %5, %15
  %17 = icmp slt i64 %16, 0
  br i1 %17, label %18, label %20

; <label>:18                                      ; preds = %0
  %19 = load i64* %1, align 8
  br label %24

; <label>:20                                      ; preds = %0
  %21 = load i64* %1, align 8
  %22 = load i64* %2, align 8
  %23 = sub nsw i64 %21, %22
  br label %24

; <label>:24                                      ; preds = %20, %18
  %25 = phi i64 [ %19, %18 ], [ %23, %20 ]
  ret i64 %25
}

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  %4 = call i64 @func_1()
  %5 = load volatile i8* @g_5, align 1
  %6 = zext i8 %5 to i32
  %7 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %6)
  %8 = load i32* @g_7, align 4
  %9 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str1, i32 0, i32 0), i32 %8)
  %10 = load i32* @g_8, align 4
  %11 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str2, i32 0, i32 0), i32 %10)
  %12 = load i32* %1
  ret i32 %12
}

declare i32 @printf(i8*, ...)
