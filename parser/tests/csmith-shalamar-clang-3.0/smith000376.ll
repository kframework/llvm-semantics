; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith000376.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = global i32 2, align 4
@g_18 = global i16 0, align 2
@g_41 = global i8 -6, align 1
@g_48 = global [2 x i32*] zeroinitializer, align 16
@g_58 = global i8 -126, align 1
@g_85 = global i32* null, align 8
@g_84 = global i32** @g_85, align 8
@g_110 = global i32** @g_85, align 8
@g_112 = global i32 -1638173852, align 4
@g_111 = global i32* @g_112, align 8
@g_166 = global i32 7, align 4
@g_180 = global i32** getelementptr inbounds ([2 x i32*]* @g_48, i32 0, i32 0), align 8
@g_179 = global i32*** @g_180, align 8
@.str = private unnamed_addr constant [19 x i8] c"checksum g_2 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [20 x i8] c"checksum g_18 = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [20 x i8] c"checksum g_41 = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [20 x i8] c"checksum g_58 = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [21 x i8] c"checksum g_112 = %d\0A\00", align 1
@.str5 = private unnamed_addr constant [21 x i8] c"checksum g_166 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable {
  %l_247 = alloca i8, align 1
  %l_249 = alloca i32**, align 8
  %l_248 = alloca i32, align 4
  %l_250 = alloca i64, align 8
  %l_251 = alloca i32, align 4
  store i8 98, i8* %l_247, align 1
  store i32** @g_111, i32*** %l_249, align 8
  store i32 -11, i32* @g_2, align 4
  br label %1

; <label>:1                                       ; preds = %5, %0
  %2 = load i32* @g_2, align 4
  %3 = icmp eq i32 %2, 0
  br i1 %3, label %4, label %8

; <label>:4                                       ; preds = %1
  store i32 9, i32* %l_248, align 4
  store i64 3215530268210909360, i64* %l_250, align 8
  store i32 1, i32* %l_251, align 4
  br label %5

; <label>:5                                       ; preds = %4
  %6 = load i32* @g_2, align 4
  %7 = call i32 @safe_sub_func_int32_t_s_s(i32 %6, i32 1)
  store i32 %7, i32* @g_2, align 4
  br label %1

; <label>:8                                       ; preds = %1
  %9 = load i8* @g_41, align 1
  %10 = sext i8 %9 to i32
  ret i32 %10
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

define i32 @func_7(i64 %p_8, i32 %p_9, i64 %p_10, i32 %p_11, i64 %p_12) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i64, align 8
  %3 = alloca i32, align 4
  %4 = alloca i64, align 8
  %5 = alloca i32, align 4
  %6 = alloca i64, align 8
  %l_17 = alloca i32, align 4
  %l_86 = alloca i32*, align 8
  %l_105 = alloca i64, align 8
  %l_106 = alloca i32*, align 8
  %l_131 = alloca i32*, align 8
  %l_136 = alloca [2 x [1 x [7 x [1 x [1 x i32**]]]]], align 16
  %l_174 = alloca i16, align 2
  %l_199 = alloca [7 x [1 x [4 x [3 x [1 x [1 x [1 x [1 x i64]]]]]]]], align 16
  %l_208 = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %l = alloca i32, align 4
  %m = alloca i32, align 4
  %n = alloca i32, align 4
  %o = alloca i32, align 4
  %p = alloca i32, align 4
  %l_243 = alloca i32*, align 8
  %l_244 = alloca i32*, align 8
  %l_246 = alloca i16, align 2
  %i1 = alloca i32, align 4
  store i64 %p_8, i64* %2, align 8
  store i32 %p_9, i32* %3, align 4
  store i64 %p_10, i64* %4, align 8
  store i32 %p_11, i32* %5, align 4
  store i64 %p_12, i64* %6, align 8
  store i32 407751808, i32* %l_17, align 4
  store i32* @g_2, i32** %l_86, align 8
  %7 = load i64* %4, align 8
  %8 = trunc i64 %7 to i16
  %9 = load i32* @g_2, align 4
  %10 = icmp ne i32 %9, 0
  br i1 %10, label %14, label %11

; <label>:11                                      ; preds = %0
  %12 = load i64* %6, align 8
  %13 = icmp ne i64 %12, 0
  br label %14

; <label>:14                                      ; preds = %11, %0
  %15 = phi i1 [ true, %0 ], [ %13, %11 ]
  %16 = zext i1 %15 to i32
  %17 = load i32* %l_17, align 4
  %18 = trunc i32 %17 to i16
  %19 = load i32* @g_2, align 4
  %20 = trunc i32 %19 to i16
  %21 = call zeroext i16 @safe_mod_func_uint16_t_u_u(i16 zeroext %18, i16 zeroext %20)
  %22 = zext i16 %21 to i32
  %23 = icmp sgt i32 %16, %22
  %24 = zext i1 %23 to i32
  %25 = call signext i16 @safe_lshift_func_int16_t_s_u(i16 signext %8, i32 %24)
  %26 = sext i16 %25 to i32
  %27 = icmp ne i32 %26, 0
  br i1 %27, label %33, label %28

; <label>:28                                      ; preds = %14
  %29 = load i16* @g_18, align 2
  %30 = sext i16 %29 to i32
  %31 = load i32* %3, align 4
  %32 = icmp eq i32 %30, %31
  br i1 %32, label %33, label %36

; <label>:33                                      ; preds = %28, %14
  %34 = load i32* %l_17, align 4
  %35 = icmp ne i32 %34, 0
  br label %36

; <label>:36                                      ; preds = %33, %28
  %37 = phi i1 [ false, %28 ], [ %35, %33 ]
  %38 = zext i1 %37 to i32
  %39 = load i32* %l_17, align 4
  %40 = icmp ne i32 %39, 0
  %41 = xor i1 %40, true
  %42 = zext i1 %41 to i32
  %43 = icmp eq i32 %38, %42
  br i1 %43, label %44, label %189

; <label>:44                                      ; preds = %36
  store i64 263208857363062774, i64* %l_105, align 8
  store i32* @g_2, i32** %l_106, align 8
  store i32* @g_112, i32** %l_131, align 8
  store i16 11187, i16* %l_174, align 2
  store i32 1, i32* %l_208, align 4
  store i32 0, i32* %i, align 4
  br label %45

; <label>:45                                      ; preds = %96, %44
  %46 = load i32* %i, align 4
  %47 = icmp slt i32 %46, 2
  br i1 %47, label %48, label %99

; <label>:48                                      ; preds = %45
  store i32 0, i32* %j, align 4
  br label %49

; <label>:49                                      ; preds = %92, %48
  %50 = load i32* %j, align 4
  %51 = icmp slt i32 %50, 1
  br i1 %51, label %52, label %95

; <label>:52                                      ; preds = %49
  store i32 0, i32* %k, align 4
  br label %53

; <label>:53                                      ; preds = %88, %52
  %54 = load i32* %k, align 4
  %55 = icmp slt i32 %54, 7
  br i1 %55, label %56, label %91

; <label>:56                                      ; preds = %53
  store i32 0, i32* %l, align 4
  br label %57

; <label>:57                                      ; preds = %84, %56
  %58 = load i32* %l, align 4
  %59 = icmp slt i32 %58, 1
  br i1 %59, label %60, label %87

; <label>:60                                      ; preds = %57
  store i32 0, i32* %m, align 4
  br label %61

; <label>:61                                      ; preds = %80, %60
  %62 = load i32* %m, align 4
  %63 = icmp slt i32 %62, 1
  br i1 %63, label %64, label %83

; <label>:64                                      ; preds = %61
  %65 = load i32* %m, align 4
  %66 = sext i32 %65 to i64
  %67 = load i32* %l, align 4
  %68 = sext i32 %67 to i64
  %69 = load i32* %k, align 4
  %70 = sext i32 %69 to i64
  %71 = load i32* %j, align 4
  %72 = sext i32 %71 to i64
  %73 = load i32* %i, align 4
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds [2 x [1 x [7 x [1 x [1 x i32**]]]]]* %l_136, i32 0, i64 %74
  %76 = getelementptr inbounds [1 x [7 x [1 x [1 x i32**]]]]* %75, i32 0, i64 %72
  %77 = getelementptr inbounds [7 x [1 x [1 x i32**]]]* %76, i32 0, i64 %70
  %78 = getelementptr inbounds [1 x [1 x i32**]]* %77, i32 0, i64 %68
  %79 = getelementptr inbounds [1 x i32**]* %78, i32 0, i64 %66
  store i32** %l_106, i32*** %79, align 8
  br label %80

; <label>:80                                      ; preds = %64
  %81 = load i32* %m, align 4
  %82 = add nsw i32 %81, 1
  store i32 %82, i32* %m, align 4
  br label %61

; <label>:83                                      ; preds = %61
  br label %84

; <label>:84                                      ; preds = %83
  %85 = load i32* %l, align 4
  %86 = add nsw i32 %85, 1
  store i32 %86, i32* %l, align 4
  br label %57

; <label>:87                                      ; preds = %57
  br label %88

; <label>:88                                      ; preds = %87
  %89 = load i32* %k, align 4
  %90 = add nsw i32 %89, 1
  store i32 %90, i32* %k, align 4
  br label %53

; <label>:91                                      ; preds = %53
  br label %92

; <label>:92                                      ; preds = %91
  %93 = load i32* %j, align 4
  %94 = add nsw i32 %93, 1
  store i32 %94, i32* %j, align 4
  br label %49

; <label>:95                                      ; preds = %49
  br label %96

; <label>:96                                      ; preds = %95
  %97 = load i32* %i, align 4
  %98 = add nsw i32 %97, 1
  store i32 %98, i32* %i, align 4
  br label %45

; <label>:99                                      ; preds = %45
  store i32 0, i32* %i, align 4
  br label %100

; <label>:100                                     ; preds = %184, %99
  %101 = load i32* %i, align 4
  %102 = icmp slt i32 %101, 7
  br i1 %102, label %103, label %187

; <label>:103                                     ; preds = %100
  store i32 0, i32* %j, align 4
  br label %104

; <label>:104                                     ; preds = %180, %103
  %105 = load i32* %j, align 4
  %106 = icmp slt i32 %105, 1
  br i1 %106, label %107, label %183

; <label>:107                                     ; preds = %104
  store i32 0, i32* %k, align 4
  br label %108

; <label>:108                                     ; preds = %176, %107
  %109 = load i32* %k, align 4
  %110 = icmp slt i32 %109, 4
  br i1 %110, label %111, label %179

; <label>:111                                     ; preds = %108
  store i32 0, i32* %l, align 4
  br label %112

; <label>:112                                     ; preds = %172, %111
  %113 = load i32* %l, align 4
  %114 = icmp slt i32 %113, 3
  br i1 %114, label %115, label %175

; <label>:115                                     ; preds = %112
  store i32 0, i32* %m, align 4
  br label %116

; <label>:116                                     ; preds = %168, %115
  %117 = load i32* %m, align 4
  %118 = icmp slt i32 %117, 1
  br i1 %118, label %119, label %171

; <label>:119                                     ; preds = %116
  store i32 0, i32* %n, align 4
  br label %120

; <label>:120                                     ; preds = %164, %119
  %121 = load i32* %n, align 4
  %122 = icmp slt i32 %121, 1
  br i1 %122, label %123, label %167

; <label>:123                                     ; preds = %120
  store i32 0, i32* %o, align 4
  br label %124

; <label>:124                                     ; preds = %160, %123
  %125 = load i32* %o, align 4
  %126 = icmp slt i32 %125, 1
  br i1 %126, label %127, label %163

; <label>:127                                     ; preds = %124
  store i32 0, i32* %p, align 4
  br label %128

; <label>:128                                     ; preds = %156, %127
  %129 = load i32* %p, align 4
  %130 = icmp slt i32 %129, 1
  br i1 %130, label %131, label %159

; <label>:131                                     ; preds = %128
  %132 = load i32* %p, align 4
  %133 = sext i32 %132 to i64
  %134 = load i32* %o, align 4
  %135 = sext i32 %134 to i64
  %136 = load i32* %n, align 4
  %137 = sext i32 %136 to i64
  %138 = load i32* %m, align 4
  %139 = sext i32 %138 to i64
  %140 = load i32* %l, align 4
  %141 = sext i32 %140 to i64
  %142 = load i32* %k, align 4
  %143 = sext i32 %142 to i64
  %144 = load i32* %j, align 4
  %145 = sext i32 %144 to i64
  %146 = load i32* %i, align 4
  %147 = sext i32 %146 to i64
  %148 = getelementptr inbounds [7 x [1 x [4 x [3 x [1 x [1 x [1 x [1 x i64]]]]]]]]* %l_199, i32 0, i64 %147
  %149 = getelementptr inbounds [1 x [4 x [3 x [1 x [1 x [1 x [1 x i64]]]]]]]* %148, i32 0, i64 %145
  %150 = getelementptr inbounds [4 x [3 x [1 x [1 x [1 x [1 x i64]]]]]]* %149, i32 0, i64 %143
  %151 = getelementptr inbounds [3 x [1 x [1 x [1 x [1 x i64]]]]]* %150, i32 0, i64 %141
  %152 = getelementptr inbounds [1 x [1 x [1 x [1 x i64]]]]* %151, i32 0, i64 %139
  %153 = getelementptr inbounds [1 x [1 x [1 x i64]]]* %152, i32 0, i64 %137
  %154 = getelementptr inbounds [1 x [1 x i64]]* %153, i32 0, i64 %135
  %155 = getelementptr inbounds [1 x i64]* %154, i32 0, i64 %133
  store i64 -7857288773594412158, i64* %155, align 8
  br label %156

; <label>:156                                     ; preds = %131
  %157 = load i32* %p, align 4
  %158 = add nsw i32 %157, 1
  store i32 %158, i32* %p, align 4
  br label %128

; <label>:159                                     ; preds = %128
  br label %160

; <label>:160                                     ; preds = %159
  %161 = load i32* %o, align 4
  %162 = add nsw i32 %161, 1
  store i32 %162, i32* %o, align 4
  br label %124

; <label>:163                                     ; preds = %124
  br label %164

; <label>:164                                     ; preds = %163
  %165 = load i32* %n, align 4
  %166 = add nsw i32 %165, 1
  store i32 %166, i32* %n, align 4
  br label %120

; <label>:167                                     ; preds = %120
  br label %168

; <label>:168                                     ; preds = %167
  %169 = load i32* %m, align 4
  %170 = add nsw i32 %169, 1
  store i32 %170, i32* %m, align 4
  br label %116

; <label>:171                                     ; preds = %116
  br label %172

; <label>:172                                     ; preds = %171
  %173 = load i32* %l, align 4
  %174 = add nsw i32 %173, 1
  store i32 %174, i32* %l, align 4
  br label %112

; <label>:175                                     ; preds = %112
  br label %176

; <label>:176                                     ; preds = %175
  %177 = load i32* %k, align 4
  %178 = add nsw i32 %177, 1
  store i32 %178, i32* %k, align 4
  br label %108

; <label>:179                                     ; preds = %108
  br label %180

; <label>:180                                     ; preds = %179
  %181 = load i32* %j, align 4
  %182 = add nsw i32 %181, 1
  store i32 %182, i32* %j, align 4
  br label %104

; <label>:183                                     ; preds = %104
  br label %184

; <label>:184                                     ; preds = %183
  %185 = load i32* %i, align 4
  %186 = add nsw i32 %185, 1
  store i32 %186, i32* %i, align 4
  br label %100

; <label>:187                                     ; preds = %100
  %188 = load i32** %l_106, align 8
  store i32* %188, i32** %l_106, align 8
  br label %282

; <label>:189                                     ; preds = %36
  store i32* null, i32** %l_243, align 8
  store i32* @g_166, i32** %l_244, align 8
  store i16 -9, i16* %l_246, align 2
  br label %190

; <label>:190                                     ; preds = %208, %189
  %191 = load i32* %3, align 4
  %192 = load i32** @g_111, align 8
  store i32 %191, i32* %192
  store i16 1, i16* @g_18, align 2
  br label %193

; <label>:193                                     ; preds = %236, %190
  %194 = load i16* @g_18, align 2
  %195 = sext i16 %194 to i32
  %196 = icmp slt i32 %195, 2
  br i1 %196, label %197, label %241

; <label>:197                                     ; preds = %193
  %198 = load i32** @g_111, align 8
  %199 = load i32* %198
  %200 = call signext i16 @safe_unary_minus_func_int16_t_s(i16 signext -11344)
  %201 = sext i16 %200 to i32
  %202 = xor i32 %199, %201
  %203 = trunc i32 %202 to i8
  %204 = call zeroext i8 @safe_sub_func_uint8_t_u_u(i8 zeroext %203, i8 zeroext 1)
  %205 = zext i8 %204 to i32
  store i32 %205, i32* %3, align 4
  %206 = load i64* %4, align 8
  %207 = icmp ne i64 %206, 0
  br i1 %207, label %208, label %209

; <label>:208                                     ; preds = %197
  br label %190

; <label>:209                                     ; preds = %197
  %210 = load i16* @g_18, align 2
  %211 = zext i16 %210 to i32
  %212 = srem i32 %211, 2
  %213 = sext i32 %212 to i64
  %214 = getelementptr inbounds [2 x i32*]* @g_48, i32 0, i64 %213
  %215 = load volatile i32** %214, align 8
  %216 = load i32*** @g_180, align 8
  store volatile i32* %215, i32** %216
  store i32 0, i32* @g_2, align 4
  br label %217

; <label>:217                                     ; preds = %226, %209
  %218 = load i32* @g_2, align 4
  %219 = icmp sle i32 %218, -23
  br i1 %219, label %220, label %231

; <label>:220                                     ; preds = %217
  %221 = load i64* %6, align 8
  %222 = icmp ne i64 %221, 0
  br i1 %222, label %223, label %224

; <label>:223                                     ; preds = %220
  br label %231

; <label>:224                                     ; preds = %220
  %225 = load i32*** @g_180, align 8
  store volatile i32* %3, i32** %225
  br label %226

; <label>:226                                     ; preds = %224
  %227 = load i32* @g_2, align 4
  %228 = sext i32 %227 to i64
  %229 = call i64 @safe_sub_func_uint64_t_u_u(i64 %228, i64 3)
  %230 = trunc i64 %229 to i32
  store i32 %230, i32* @g_2, align 4
  br label %217

; <label>:231                                     ; preds = %223, %217
  %232 = load i32* @g_112, align 4
  %233 = icmp ne i32 %232, 0
  br i1 %233, label %234, label %235

; <label>:234                                     ; preds = %231
  br label %242

; <label>:235                                     ; preds = %231
  br label %236

; <label>:236                                     ; preds = %235
  %237 = load i16* @g_18, align 2
  %238 = sext i16 %237 to i32
  %239 = add nsw i32 %238, 2
  %240 = trunc i32 %239 to i16
  store i16 %240, i16* @g_18, align 2
  br label %193

; <label>:241                                     ; preds = %193
  br label %242

; <label>:242                                     ; preds = %241, %234
  %243 = load i16* @g_18, align 2
  %244 = zext i16 %243 to i32
  %245 = srem i32 %244, 2
  %246 = sext i32 %245 to i64
  %247 = getelementptr inbounds [2 x i32*]* @g_48, i32 0, i64 %246
  %248 = load volatile i32** %247, align 8
  %249 = load i32*** @g_110, align 8
  %250 = load i32** %249
  %251 = icmp ne i32* %248, %250
  %252 = zext i1 %251 to i32
  %253 = sext i32 %252 to i64
  %254 = icmp sgt i64 %253, -1
  br i1 %254, label %255, label %262

; <label>:255                                     ; preds = %242
  %256 = load i8* @g_41, align 1
  %257 = sext i8 %256 to i32
  %258 = load i32** @g_85, align 8
  %259 = call i32* @func_87(i32 %257, i32* %258)
  %260 = call i32 @func_80(i32* %259)
  %261 = icmp ne i32 %260, 0
  br label %262

; <label>:262                                     ; preds = %255, %242
  %263 = phi i1 [ false, %242 ], [ %261, %255 ]
  %264 = zext i1 %263 to i32
  %265 = load i32** @g_111, align 8
  %266 = load i32* %265
  %267 = icmp sle i32 %264, %266
  %268 = zext i1 %267 to i32
  %269 = load i32** %l_244, align 8
  %270 = load i32* %269
  %271 = or i32 %270, %268
  store i32 %271, i32* %269
  store i64 0, i64* %4, align 8
  br label %272

; <label>:272                                     ; preds = %278, %262
  %273 = load i64* %4, align 8
  %274 = icmp ult i64 %273, 2
  br i1 %274, label %275, label %281

; <label>:275                                     ; preds = %272
  %276 = load i16* %l_246, align 2
  %277 = sext i16 %276 to i32
  store i32 %277, i32* %1
  br label %285
                                                  ; No predecessors!
  %279 = load i64* %4, align 8
  %280 = add i64 %279, 1
  store i64 %280, i64* %4, align 8
  br label %272

; <label>:281                                     ; preds = %272
  br label %282

; <label>:282                                     ; preds = %281, %187
  %283 = load i32** %l_86, align 8
  %284 = load i32* %283
  store i32 %284, i32* %1
  br label %285

; <label>:285                                     ; preds = %282, %275
  %286 = load i32* %1
  ret i32 %286
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

define internal signext i16 @safe_unary_minus_func_int16_t_s(i16 signext %si) nounwind uwtable {
  %1 = alloca i16, align 2
  store i16 %si, i16* %1, align 2
  %2 = load i16* %1, align 2
  %3 = sext i16 %2 to i32
  %4 = sub nsw i32 0, %3
  %5 = trunc i32 %4 to i16
  ret i16 %5
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

define i32 @func_80(i32* %p_81) nounwind uwtable {
  %1 = alloca i32*, align 8
  %l_82 = alloca [10 x [10 x [1 x i32]]], align 16
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  store i32* %p_81, i32** %1, align 8
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
  %8 = icmp slt i32 %7, 10
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
  %20 = getelementptr inbounds [10 x [10 x [1 x i32]]]* %l_82, i32 0, i64 %19
  %21 = getelementptr inbounds [10 x [1 x i32]]* %20, i32 0, i64 %17
  %22 = getelementptr inbounds [1 x i32]* %21, i32 0, i64 %15
  store i32 2, i32* %22, align 4
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
  %35 = load i32** %1, align 8
  store i32 -6, i32* %35
  %36 = getelementptr inbounds [10 x [10 x [1 x i32]]]* %l_82, i32 0, i64 4
  %37 = getelementptr inbounds [10 x [1 x i32]]* %36, i32 0, i64 7
  %38 = getelementptr inbounds [1 x i32]* %37, i32 0, i64 0
  %39 = load i32* %38, align 4
  ret i32 %39
}

define i32* @func_87(i32 %p_88, i32* %p_89) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32*, align 8
  %l_100 = alloca i32*, align 8
  %l_99 = alloca [2 x i32**], align 16
  %i = alloca i32, align 4
  store i32 %p_88, i32* %1, align 4
  store i32* %p_89, i32** %2, align 8
  store i32* null, i32** %l_100, align 8
  store i32 0, i32* %i, align 4
  br label %3

; <label>:3                                       ; preds = %10, %0
  %4 = load i32* %i, align 4
  %5 = icmp slt i32 %4, 2
  br i1 %5, label %6, label %13

; <label>:6                                       ; preds = %3
  %7 = load i32* %i, align 4
  %8 = sext i32 %7 to i64
  %9 = getelementptr inbounds [2 x i32**]* %l_99, i32 0, i64 %8
  store i32** %l_100, i32*** %9, align 8
  br label %10

; <label>:10                                      ; preds = %6
  %11 = load i32* %i, align 4
  %12 = add nsw i32 %11, 1
  store i32 %12, i32* %i, align 4
  br label %3

; <label>:13                                      ; preds = %3
  %14 = load i32* @g_2, align 4
  %15 = call i32* @func_90(i32 %14)
  store i32* %15, i32** %2, align 8
  ret i32* @g_2
}

define i32* @func_19(i16 signext %p_20, i32* %p_21, i32* %p_22, i16 zeroext %p_23) nounwind uwtable {
  %1 = alloca i16, align 2
  %2 = alloca i32*, align 8
  %3 = alloca i32*, align 8
  %4 = alloca i16, align 2
  %l_27 = alloca i32*, align 8
  %l_28 = alloca i32, align 4
  %l_66 = alloca [4 x i64], align 16
  %l_83 = alloca [10 x [7 x [1 x [1 x [1 x i32*]]]]], align 16
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %l = alloca i32, align 4
  %m = alloca i32, align 4
  store i16 %p_20, i16* %1, align 2
  store i32* %p_21, i32** %2, align 8
  store i32* %p_22, i32** %3, align 8
  store i16 %p_23, i16* %4, align 2
  store i32* null, i32** %l_27, align 8
  store i32 -2, i32* %l_28, align 4
  %5 = load i16* @g_18, align 2
  %6 = trunc i16 %5 to i8
  %7 = call zeroext i8 @safe_unary_minus_func_uint8_t_u(i8 zeroext %6)
  %8 = zext i8 %7 to i32
  %9 = load i32** %l_27, align 8
  %10 = icmp ne i32* %9, @g_2
  %11 = zext i1 %10 to i32
  %12 = and i32 %8, %11
  %13 = trunc i32 %12 to i8
  %14 = load i32* %l_28, align 4
  %15 = load i32** %3, align 8
  %16 = load i32* %15
  %17 = load i32** %3, align 8
  %18 = load i32* %17
  %19 = icmp sge i32 %16, %18
  %20 = zext i1 %19 to i32
  %21 = trunc i32 %20 to i16
  %22 = call i32 @func_29(i16 zeroext %21)
  %23 = icmp eq i32 %14, %22
  %24 = zext i1 %23 to i32
  %25 = call signext i8 @safe_rshift_func_int8_t_s_u(i8 signext %13, i32 %24)
  %26 = sext i8 %25 to i32
  %27 = load i16* @g_18, align 2
  %28 = sext i16 %27 to i32
  %29 = icmp ne i32 %26, %28
  %30 = zext i1 %29 to i32
  %31 = load i8* @g_41, align 1
  %32 = sext i8 %31 to i32
  %33 = xor i32 %32, %30
  %34 = trunc i32 %33 to i8
  store i8 %34, i8* @g_41, align 1
  %35 = load i8* @g_41, align 1
  %36 = sext i8 %35 to i32
  %37 = icmp ne i32 %36, 0
  br i1 %37, label %38, label %42

; <label>:38                                      ; preds = %0
  %39 = load i16* @g_18, align 2
  %40 = sext i16 %39 to i32
  %41 = icmp ne i32 %40, 0
  br label %42

; <label>:42                                      ; preds = %38, %0
  %43 = phi i1 [ false, %0 ], [ %41, %38 ]
  %44 = zext i1 %43 to i32
  %45 = trunc i32 %44 to i8
  %46 = load i32** %2, align 8
  %47 = load i32* %46
  %48 = load i32** %3, align 8
  %49 = load i32* %48
  %50 = trunc i32 %49 to i16
  %51 = load i32** %2, align 8
  %52 = load i32* %51
  %53 = trunc i32 %52 to i16
  %54 = call zeroext i16 @safe_mod_func_uint16_t_u_u(i16 zeroext %50, i16 zeroext %53)
  %55 = load i32** %2, align 8
  %56 = load i32* %55
  %57 = load i32** %2, align 8
  %58 = load i32* %57
  %59 = icmp slt i32 %56, %58
  %60 = zext i1 %59 to i32
  %61 = trunc i32 %60 to i16
  %62 = call signext i16 @safe_div_func_int16_t_s_s(i16 signext %54, i16 signext %61)
  %63 = sext i16 %62 to i32
  %64 = icmp sle i32 %47, %63
  %65 = zext i1 %64 to i32
  %66 = trunc i32 %65 to i16
  %67 = call zeroext i16 @safe_rshift_func_uint16_t_u_s(i16 zeroext %66, i32 -1683666630)
  %68 = zext i16 %67 to i64
  %69 = load i16* %1, align 2
  %70 = sext i16 %69 to i32
  %71 = call i32 @func_44(i64 1, i64 %68, i32 %70)
  %72 = trunc i32 %71 to i8
  %73 = call signext i8 @safe_div_func_int8_t_s_s(i8 signext %45, i8 signext %72)
  %74 = sext i8 %73 to i32
  %75 = load i32** %2, align 8
  store i32 %74, i32* %75
  br label %76

; <label>:76                                      ; preds = %182, %42
  %77 = load i8* @g_58, align 1
  %78 = sext i8 %77 to i32
  %79 = load i32** %3, align 8
  %80 = load i32* %79
  %81 = icmp slt i32 %78, %80
  %82 = zext i1 %81 to i32
  %83 = icmp eq i32* null, %l_28
  %84 = zext i1 %83 to i32
  %85 = load i32* %l_28, align 4
  %86 = sext i32 %85 to i64
  %87 = load i8* @g_41, align 1
  %88 = sext i8 %87 to i64
  %89 = load i16* %1, align 2
  %90 = sext i16 %89 to i32
  %91 = call i32 @func_44(i64 %86, i64 %88, i32 %90)
  %92 = xor i32 %84, %91
  %93 = call i32 @safe_add_func_int32_t_s_s(i32 %82, i32 %92)
  %94 = load i32* %l_28, align 4
  %95 = icmp ne i32 %94, 0
  br i1 %95, label %97, label %96

; <label>:96                                      ; preds = %76
  br label %97

; <label>:97                                      ; preds = %96, %76
  %98 = phi i1 [ true, %76 ], [ false, %96 ]
  %99 = zext i1 %98 to i32
  %100 = trunc i32 %99 to i8
  %101 = load i32** %3, align 8
  %102 = load i32* %101
  %103 = call zeroext i8 @safe_rshift_func_uint8_t_u_u(i8 zeroext %100, i32 %102)
  %104 = zext i8 %103 to i32
  %105 = or i32 %93, %104
  %106 = load i32** %2, align 8
  %107 = load i32* %106
  %108 = xor i32 %107, %105
  store i32 %108, i32* %106
  store i16 0, i16* %1, align 2
  br label %109

; <label>:109                                     ; preds = %250, %97
  %110 = load i16* %1, align 2
  %111 = sext i16 %110 to i32
  %112 = icmp eq i32 %111, 0
  br i1 %112, label %113, label %253

; <label>:113                                     ; preds = %109
  store i32 0, i32* %i, align 4
  br label %114

; <label>:114                                     ; preds = %121, %113
  %115 = load i32* %i, align 4
  %116 = icmp slt i32 %115, 4
  br i1 %116, label %117, label %124

; <label>:117                                     ; preds = %114
  %118 = load i32* %i, align 4
  %119 = sext i32 %118 to i64
  %120 = getelementptr inbounds [4 x i64]* %l_66, i32 0, i64 %119
  store i64 0, i64* %120, align 8
  br label %121

; <label>:121                                     ; preds = %117
  %122 = load i32* %i, align 4
  %123 = add nsw i32 %122, 1
  store i32 %123, i32* %i, align 4
  br label %114

; <label>:124                                     ; preds = %114
  store i32 0, i32* %i, align 4
  br label %125

; <label>:125                                     ; preds = %176, %124
  %126 = load i32* %i, align 4
  %127 = icmp slt i32 %126, 10
  br i1 %127, label %128, label %179

; <label>:128                                     ; preds = %125
  store i32 0, i32* %j, align 4
  br label %129

; <label>:129                                     ; preds = %172, %128
  %130 = load i32* %j, align 4
  %131 = icmp slt i32 %130, 7
  br i1 %131, label %132, label %175

; <label>:132                                     ; preds = %129
  store i32 0, i32* %k, align 4
  br label %133

; <label>:133                                     ; preds = %168, %132
  %134 = load i32* %k, align 4
  %135 = icmp slt i32 %134, 1
  br i1 %135, label %136, label %171

; <label>:136                                     ; preds = %133
  store i32 0, i32* %l, align 4
  br label %137

; <label>:137                                     ; preds = %164, %136
  %138 = load i32* %l, align 4
  %139 = icmp slt i32 %138, 1
  br i1 %139, label %140, label %167

; <label>:140                                     ; preds = %137
  store i32 0, i32* %m, align 4
  br label %141

; <label>:141                                     ; preds = %160, %140
  %142 = load i32* %m, align 4
  %143 = icmp slt i32 %142, 1
  br i1 %143, label %144, label %163

; <label>:144                                     ; preds = %141
  %145 = load i32* %m, align 4
  %146 = sext i32 %145 to i64
  %147 = load i32* %l, align 4
  %148 = sext i32 %147 to i64
  %149 = load i32* %k, align 4
  %150 = sext i32 %149 to i64
  %151 = load i32* %j, align 4
  %152 = sext i32 %151 to i64
  %153 = load i32* %i, align 4
  %154 = sext i32 %153 to i64
  %155 = getelementptr inbounds [10 x [7 x [1 x [1 x [1 x i32*]]]]]* %l_83, i32 0, i64 %154
  %156 = getelementptr inbounds [7 x [1 x [1 x [1 x i32*]]]]* %155, i32 0, i64 %152
  %157 = getelementptr inbounds [1 x [1 x [1 x i32*]]]* %156, i32 0, i64 %150
  %158 = getelementptr inbounds [1 x [1 x i32*]]* %157, i32 0, i64 %148
  %159 = getelementptr inbounds [1 x i32*]* %158, i32 0, i64 %146
  store i32* %l_28, i32** %159, align 8
  br label %160

; <label>:160                                     ; preds = %144
  %161 = load i32* %m, align 4
  %162 = add nsw i32 %161, 1
  store i32 %162, i32* %m, align 4
  br label %141

; <label>:163                                     ; preds = %141
  br label %164

; <label>:164                                     ; preds = %163
  %165 = load i32* %l, align 4
  %166 = add nsw i32 %165, 1
  store i32 %166, i32* %l, align 4
  br label %137

; <label>:167                                     ; preds = %137
  br label %168

; <label>:168                                     ; preds = %167
  %169 = load i32* %k, align 4
  %170 = add nsw i32 %169, 1
  store i32 %170, i32* %k, align 4
  br label %133

; <label>:171                                     ; preds = %133
  br label %172

; <label>:172                                     ; preds = %171
  %173 = load i32* %j, align 4
  %174 = add nsw i32 %173, 1
  store i32 %174, i32* %j, align 4
  br label %129

; <label>:175                                     ; preds = %129
  br label %176

; <label>:176                                     ; preds = %175
  %177 = load i32* %i, align 4
  %178 = add nsw i32 %177, 1
  store i32 %178, i32* %i, align 4
  br label %125

; <label>:179                                     ; preds = %125
  %180 = load i16* %1, align 2
  %181 = icmp ne i16 %180, 0
  br i1 %181, label %182, label %183

; <label>:182                                     ; preds = %179
  br label %76

; <label>:183                                     ; preds = %179
  %184 = getelementptr inbounds [4 x i64]* %l_66, i32 0, i64 1
  %185 = load i64* %184, align 8
  %186 = trunc i64 %185 to i8
  %187 = load i32** %3, align 8
  %188 = load i32* %187
  %189 = icmp ne i32 %188, 0
  br i1 %189, label %191, label %190

; <label>:190                                     ; preds = %183
  br label %191

; <label>:191                                     ; preds = %190, %183
  %192 = phi i1 [ true, %183 ], [ true, %190 ]
  %193 = zext i1 %192 to i32
  %194 = trunc i32 %193 to i8
  %195 = load i32** %2, align 8
  %196 = load i32* %195
  %197 = call zeroext i8 @safe_lshift_func_uint8_t_u_s(i8 zeroext %194, i32 %196)
  %198 = call signext i8 @safe_sub_func_int8_t_s_s(i8 signext %186, i8 signext %197)
  %199 = sext i8 %198 to i32
  %200 = load i32** %2, align 8
  %201 = load i32* %200
  %202 = xor i32 %201, %199
  store i32 %202, i32* %200
  %203 = load i32* @g_2, align 4
  %204 = trunc i32 %203 to i16
  %205 = call i32 @func_29(i16 zeroext %204)
  %206 = getelementptr inbounds [4 x i64]* %l_66, i32 0, i64 1
  %207 = load i64* %206, align 8
  %208 = trunc i64 %207 to i8
  %209 = getelementptr inbounds [4 x i64]* %l_66, i32 0, i64 1
  %210 = load i64* %209, align 8
  %211 = trunc i64 %210 to i8
  %212 = call zeroext i8 @safe_mod_func_uint8_t_u_u(i8 zeroext %208, i8 zeroext %211)
  %213 = zext i8 %212 to i32
  %214 = icmp sge i32 %205, %213
  %215 = zext i1 %214 to i32
  %216 = load i32** %2, align 8
  store i32 %215, i32* %216
  %217 = load i16* %1, align 2
  %218 = trunc i16 %217 to i8
  %219 = load i16* %4, align 2
  %220 = trunc i16 %219 to i8
  %221 = load i32** %3, align 8
  %222 = load i32* %221
  %223 = trunc i32 %222 to i8
  %224 = getelementptr inbounds [10 x [7 x [1 x [1 x [1 x i32*]]]]]* %l_83, i32 0, i64 7
  %225 = getelementptr inbounds [7 x [1 x [1 x [1 x i32*]]]]* %224, i32 0, i64 0
  %226 = getelementptr inbounds [1 x [1 x [1 x i32*]]]* %225, i32 0, i64 0
  %227 = getelementptr inbounds [1 x [1 x i32*]]* %226, i32 0, i64 0
  %228 = getelementptr inbounds [1 x i32*]* %227, i32 0, i64 0
  %229 = load i32** %228, align 8
  %230 = call i32 @func_80(i32* %229)
  %231 = trunc i32 %230 to i8
  %232 = call signext i8 @safe_div_func_int8_t_s_s(i8 signext %223, i8 signext %231)
  %233 = sext i8 %232 to i32
  %234 = load i16* %1, align 2
  %235 = sext i16 %234 to i64
  %236 = load i16* %1, align 2
  %237 = sext i16 %236 to i64
  %238 = load i16* %1, align 2
  %239 = sext i16 %238 to i32
  %240 = call i32 @func_44(i64 %235, i64 %237, i32 %239)
  %241 = sext i32 %240 to i64
  %242 = icmp sgt i64 0, %241
  %243 = zext i1 %242 to i32
  %244 = or i32 %233, %243
  %245 = trunc i32 %244 to i16
  %246 = call i32 @func_29(i16 zeroext %245)
  %247 = trunc i32 %246 to i16
  %248 = call i32* @func_71(i8 signext %218, i32* @g_2, i32* %l_28, i8 signext %220, i16 zeroext %247)
  %249 = load volatile i32*** @g_84, align 8
  store i32* %248, i32** %249
  br label %250

; <label>:250                                     ; preds = %191
  %251 = load i16* %1, align 2
  %252 = call signext i16 @safe_add_func_int16_t_s_s(i16 signext %251, i16 signext 3)
  store i16 %252, i16* %1, align 2
  br label %109

; <label>:253                                     ; preds = %109
  %254 = load i32** %2, align 8
  ret i32* %254
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

define internal zeroext i8 @safe_unary_minus_func_uint8_t_u(i8 zeroext %ui) nounwind uwtable {
  %1 = alloca i8, align 1
  store i8 %ui, i8* %1, align 1
  %2 = load i8* %1, align 1
  %3 = zext i8 %2 to i32
  %4 = sub nsw i32 0, %3
  %5 = trunc i32 %4 to i8
  ret i8 %5
}

define i32 @func_29(i16 zeroext %p_30) nounwind uwtable {
  %1 = alloca i16, align 2
  %l_40 = alloca i16, align 2
  %l_37 = alloca i32*, align 8
  store i16 %p_30, i16* %1, align 2
  store i16 0, i16* %l_40, align 2
  store i16 25, i16* %1, align 2
  br label %2

; <label>:2                                       ; preds = %53, %0
  %3 = load i16* %1, align 2
  %4 = zext i16 %3 to i32
  %5 = icmp ne i32 %4, 0
  br i1 %5, label %6, label %56

; <label>:6                                       ; preds = %2
  store i32* @g_2, i32** %l_37, align 8
  %7 = load i16* @g_18, align 2
  %8 = sext i16 %7 to i32
  %9 = icmp ne i32 %8, 0
  br i1 %9, label %13, label %10

; <label>:10                                      ; preds = %6
  %11 = load i32* @g_2, align 4
  %12 = icmp ne i32 %11, 0
  br label %13

; <label>:13                                      ; preds = %10, %6
  %14 = phi i1 [ true, %6 ], [ %12, %10 ]
  %15 = zext i1 %14 to i32
  %16 = load i32** %l_37, align 8
  %17 = icmp eq i32* %16, @g_2
  %18 = zext i1 %17 to i32
  %19 = icmp sle i32 %15, %18
  %20 = zext i1 %19 to i32
  %21 = trunc i32 %20 to i16
  %22 = load i16* @g_18, align 2
  %23 = sext i16 %22 to i32
  %24 = call zeroext i16 @safe_rshift_func_uint16_t_u_s(i16 zeroext %21, i32 %23)
  %25 = zext i16 %24 to i32
  %26 = icmp ne i32 %25, 0
  br i1 %26, label %27, label %30

; <label>:27                                      ; preds = %13
  %28 = call i32 @safe_div_func_uint32_t_u_u(i32 0, i32 2037573611)
  %29 = icmp ne i32 %28, 0
  br label %30

; <label>:30                                      ; preds = %27, %13
  %31 = phi i1 [ false, %13 ], [ %29, %27 ]
  %32 = zext i1 %31 to i32
  %33 = trunc i32 %32 to i8
  %34 = load i16* @g_18, align 2
  %35 = sext i16 %34 to i32
  %36 = load i16* %1, align 2
  %37 = zext i16 %36 to i32
  %38 = sext i32 %37 to i64
  %39 = icmp sge i64 %38, -2
  %40 = zext i1 %39 to i32
  %41 = load i16* %1, align 2
  %42 = zext i16 %41 to i64
  %43 = icmp sle i64 %42, 2119031735
  %44 = zext i1 %43 to i32
  %45 = and i32 %40, %44
  %46 = or i32 %35, %45
  %47 = trunc i32 %46 to i8
  %48 = call zeroext i8 @safe_div_func_uint8_t_u_u(i8 zeroext %33, i8 zeroext %47)
  %49 = zext i8 %48 to i64
  %50 = icmp sle i64 %49, 3797269343
  %51 = zext i1 %50 to i32
  %52 = load i32** %l_37, align 8
  store i32 %51, i32* %52
  br label %53

; <label>:53                                      ; preds = %30
  %54 = load i16* %1, align 2
  %55 = call zeroext i16 @safe_sub_func_uint16_t_u_u(i16 zeroext %54, i16 zeroext 4)
  store i16 %55, i16* %1, align 2
  br label %2

; <label>:56                                      ; preds = %2
  ret i32 0
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

define i32 @func_44(i64 %p_45, i64 %p_46, i32 %p_47) nounwind uwtable {
  %1 = alloca i64, align 8
  %2 = alloca i64, align 8
  %3 = alloca i32, align 4
  %l_49 = alloca i32*, align 8
  store i64 %p_45, i64* %1, align 8
  store i64 %p_46, i64* %2, align 8
  store i32 %p_47, i32* %3, align 4
  store i32* @g_2, i32** %l_49, align 8
  %4 = load i64* %1, align 8
  %5 = trunc i64 %4 to i32
  %6 = load i32** %l_49, align 8
  store i32 %5, i32* %6
  %7 = load i64* %2, align 8
  %8 = trunc i64 %7 to i32
  ret i32 %8
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

define internal zeroext i8 @safe_rshift_func_uint8_t_u_u(i8 zeroext %left, i32 %right) nounwind uwtable {
  %1 = alloca i8, align 1
  %2 = alloca i32, align 4
  store i8 %left, i8* %1, align 1
  store i32 %right, i32* %2, align 4
  %3 = load i32* %2, align 4
  %4 = icmp uge i32 %3, 32
  br i1 %4, label %5, label %8

; <label>:5                                       ; preds = %0
  %6 = load i8* %1, align 1
  %7 = zext i8 %6 to i32
  br label %13

; <label>:8                                       ; preds = %0
  %9 = load i8* %1, align 1
  %10 = zext i8 %9 to i32
  %11 = load i32* %2, align 4
  %12 = ashr i32 %10, %11
  br label %13

; <label>:13                                      ; preds = %8, %5
  %14 = phi i32 [ %7, %5 ], [ %12, %8 ]
  %15 = trunc i32 %14 to i8
  ret i8 %15
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

define internal zeroext i8 @safe_mod_func_uint8_t_u_u(i8 zeroext %ui1, i8 zeroext %ui2) nounwind uwtable {
  %1 = alloca i8, align 1
  %2 = alloca i8, align 1
  store i8 %ui1, i8* %1, align 1
  store i8 %ui2, i8* %2, align 1
  %3 = load i8* %2, align 1
  %4 = zext i8 %3 to i32
  %5 = icmp eq i32 %4, 0
  br i1 %5, label %6, label %9

; <label>:6                                       ; preds = %0
  %7 = load i8* %1, align 1
  %8 = zext i8 %7 to i32
  br label %15

; <label>:9                                       ; preds = %0
  %10 = load i8* %1, align 1
  %11 = zext i8 %10 to i32
  %12 = load i8* %2, align 1
  %13 = zext i8 %12 to i32
  %14 = srem i32 %11, %13
  br label %15

; <label>:15                                      ; preds = %9, %6
  %16 = phi i32 [ %8, %6 ], [ %14, %9 ]
  %17 = trunc i32 %16 to i8
  ret i8 %17
}

define i32* @func_71(i8 signext %p_72, i32* %p_73, i32* %p_74, i8 signext %p_75, i16 zeroext %p_76) nounwind uwtable {
  %1 = alloca i8, align 1
  %2 = alloca i32*, align 8
  %3 = alloca i32*, align 8
  %4 = alloca i8, align 1
  %5 = alloca i16, align 2
  %l_77 = alloca i32*, align 8
  store i8 %p_72, i8* %1, align 1
  store i32* %p_73, i32** %2, align 8
  store i32* %p_74, i32** %3, align 8
  store i8 %p_75, i8* %4, align 1
  store i16 %p_76, i16* %5, align 2
  store i32* @g_2, i32** %l_77, align 8
  %6 = load i32** %l_77, align 8
  %7 = icmp eq i32* null, %6
  %8 = zext i1 %7 to i32
  %9 = load i32** %2, align 8
  store i32 %8, i32* %9
  ret i32* @g_2
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

define internal zeroext i8 @safe_div_func_uint8_t_u_u(i8 zeroext %ui1, i8 zeroext %ui2) nounwind uwtable {
  %1 = alloca i8, align 1
  %2 = alloca i8, align 1
  store i8 %ui1, i8* %1, align 1
  store i8 %ui2, i8* %2, align 1
  %3 = load i8* %2, align 1
  %4 = zext i8 %3 to i32
  %5 = icmp eq i32 %4, 0
  br i1 %5, label %6, label %9

; <label>:6                                       ; preds = %0
  %7 = load i8* %1, align 1
  %8 = zext i8 %7 to i32
  br label %15

; <label>:9                                       ; preds = %0
  %10 = load i8* %1, align 1
  %11 = zext i8 %10 to i32
  %12 = load i8* %2, align 1
  %13 = zext i8 %12 to i32
  %14 = sdiv i32 %11, %13
  br label %15

; <label>:15                                      ; preds = %9, %6
  %16 = phi i32 [ %8, %6 ], [ %14, %9 ]
  %17 = trunc i32 %16 to i8
  ret i8 %17
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

define internal zeroext i16 @safe_sub_func_uint16_t_u_u(i16 zeroext %ui1, i16 zeroext %ui2) nounwind uwtable {
  %1 = alloca i16, align 2
  %2 = alloca i16, align 2
  store i16 %ui1, i16* %1, align 2
  store i16 %ui2, i16* %2, align 2
  %3 = load i16* %1, align 2
  %4 = zext i16 %3 to i32
  %5 = load i16* %2, align 2
  %6 = zext i16 %5 to i32
  %7 = sub nsw i32 %4, %6
  %8 = trunc i32 %7 to i16
  ret i16 %8
}

define i32* @func_90(i32 %p_91) nounwind uwtable {
  %1 = alloca i32, align 4
  store i32 %p_91, i32* %1, align 4
  ret i32* %1
}

define i32 @func_92(i32 %p_93, i32** %p_94, i64 %p_95, i64 %p_96) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32**, align 8
  %3 = alloca i64, align 8
  %4 = alloca i64, align 8
  %l_97 = alloca [1 x i16], align 2
  %l_98 = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 %p_93, i32* %1, align 4
  store i32** %p_94, i32*** %2, align 8
  store i64 %p_95, i64* %3, align 8
  store i64 %p_96, i64* %4, align 8
  store i32 -723463235, i32* %l_98, align 4
  store i32 0, i32* %i, align 4
  br label %5

; <label>:5                                       ; preds = %12, %0
  %6 = load i32* %i, align 4
  %7 = icmp slt i32 %6, 1
  br i1 %7, label %8, label %15

; <label>:8                                       ; preds = %5
  %9 = load i32* %i, align 4
  %10 = sext i32 %9 to i64
  %11 = getelementptr inbounds [1 x i16]* %l_97, i32 0, i64 %10
  store i16 0, i16* %11, align 2
  br label %12

; <label>:12                                      ; preds = %8
  %13 = load i32* %i, align 4
  %14 = add nsw i32 %13, 1
  store i32 %14, i32* %i, align 4
  br label %5

; <label>:15                                      ; preds = %5
  %16 = getelementptr inbounds [1 x i16]* %l_97, i32 0, i64 0
  %17 = load i16* %16, align 2
  %18 = zext i16 %17 to i32
  %19 = call i32* @func_90(i32 %18)
  %20 = load i32*** %2, align 8
  store i32* %19, i32** %20
  %21 = load i64* %4, align 8
  %22 = trunc i64 %21 to i32
  store i32 %22, i32* %l_98, align 4
  %23 = load i64* %4, align 8
  %24 = trunc i64 %23 to i32
  ret i32 %24
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
  %5 = load i32* @g_2, align 4
  %6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %5)
  %7 = load i16* @g_18, align 2
  %8 = sext i16 %7 to i32
  %9 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str1, i32 0, i32 0), i32 %8)
  %10 = load i8* @g_41, align 1
  %11 = sext i8 %10 to i32
  %12 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str2, i32 0, i32 0), i32 %11)
  %13 = load i8* @g_58, align 1
  %14 = sext i8 %13 to i32
  %15 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str3, i32 0, i32 0), i32 %14)
  %16 = load i32* @g_112, align 4
  %17 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([21 x i8]* @.str4, i32 0, i32 0), i32 %16)
  %18 = load i32* @g_166, align 4
  %19 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([21 x i8]* @.str5, i32 0, i32 0), i32 %18)
  %20 = load i32* %1
  ret i32 %20
}

declare i32 @printf(i8*, ...)
