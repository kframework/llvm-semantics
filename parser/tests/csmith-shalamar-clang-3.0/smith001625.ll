; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith001625.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_4 = global i8 91, align 1
@g_7 = global i32 1, align 4
@g_6 = global i32* @g_7, align 8
@g_18 = global i32 -1, align 4
@g_38 = constant i16 1, align 2
@g_39 = global [4 x [2 x i32]] [[2 x i32] [i32 6, i32 6], [2 x i32] [i32 6, i32 6], [2 x i32] [i32 6, i32 6], [2 x i32] [i32 6, i32 6]], align 16
@func_1.l_2 = internal constant [7 x i8] c"\01\01\01\01\01\01\01", align 1
@.str = private unnamed_addr constant [19 x i8] c"checksum g_4 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [19 x i8] c"checksum g_7 = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [20 x i8] c"checksum g_18 = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [20 x i8] c"checksum g_38 = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [26 x i8] c"checksum g_39[0][0] = %d\0A\00", align 1
@.str5 = private unnamed_addr constant [26 x i8] c"checksum g_39[0][1] = %d\0A\00", align 1
@.str6 = private unnamed_addr constant [26 x i8] c"checksum g_39[1][0] = %d\0A\00", align 1
@.str7 = private unnamed_addr constant [26 x i8] c"checksum g_39[1][1] = %d\0A\00", align 1
@.str8 = private unnamed_addr constant [26 x i8] c"checksum g_39[2][0] = %d\0A\00", align 1
@.str9 = private unnamed_addr constant [26 x i8] c"checksum g_39[2][1] = %d\0A\00", align 1
@.str10 = private unnamed_addr constant [26 x i8] c"checksum g_39[3][0] = %d\0A\00", align 1
@.str11 = private unnamed_addr constant [26 x i8] c"checksum g_39[3][1] = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable {
  %1 = alloca i32, align 4
  %l_3 = alloca [3 x i32*], align 16
  %l_5 = alloca i64, align 8
  %i = alloca i32, align 4
  %l_8 = alloca i32**, align 8
  %l_15 = alloca i8, align 1
  %l_20 = alloca i32, align 4
  %l_19 = alloca i32, align 4
  %l_21 = alloca [3 x [10 x [1 x [2 x [1 x i8]]]]], align 16
  %i1 = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %l = alloca i32, align 4
  %m = alloca i32, align 4
  %l_26 = alloca i8, align 1
  %l_27 = alloca i32, align 4
  store i64 5703958251970127068, i64* %l_5, align 8
  store i32 0, i32* %i, align 4
  br label %2

; <label>:2                                       ; preds = %9, %0
  %3 = load i32* %i, align 4
  %4 = icmp slt i32 %3, 3
  br i1 %4, label %5, label %12

; <label>:5                                       ; preds = %2
  %6 = load i32* %i, align 4
  %7 = sext i32 %6 to i64
  %8 = getelementptr inbounds [3 x i32*]* %l_3, i32 0, i64 %7
  store i32* null, i32** %8, align 8
  br label %9

; <label>:9                                       ; preds = %5
  %10 = load i32* %i, align 4
  %11 = add nsw i32 %10, 1
  store i32 %11, i32* %i, align 4
  br label %2

; <label>:12                                      ; preds = %2
  %13 = load i8* getelementptr inbounds ([7 x i8]* @func_1.l_2, i32 0, i64 5), align 1
  store i8 %13, i8* @g_4, align 1
  %14 = load i64* %l_5, align 8
  %15 = icmp ne i64 %14, 0
  br i1 %15, label %16, label %70

; <label>:16                                      ; preds = %12
  store i32** @g_6, i32*** %l_8, align 8
  %17 = load i32** @g_6, align 8
  %18 = load i32*** %l_8, align 8
  store i32* %17, i32** %18
  store i8 27, i8* @g_4, align 1
  br label %19

; <label>:19                                      ; preds = %25, %16
  %20 = load i8* @g_4, align 1
  %21 = zext i8 %20 to i32
  %22 = icmp eq i32 %21, 0
  br i1 %22, label %23, label %30

; <label>:23                                      ; preds = %19
  %24 = load volatile i32* @g_7, align 4
  store i32 %24, i32* %1
  br label %220
                                                  ; No predecessors!
  %26 = load i8* @g_4, align 1
  %27 = zext i8 %26 to i16
  %28 = call signext i16 @safe_sub_func_int16_t_s_s(i16 signext %27, i16 signext 1)
  %29 = trunc i16 %28 to i8
  store i8 %29, i8* @g_4, align 1
  br label %19

; <label>:30                                      ; preds = %19
  store volatile i32 25, i32* @g_7, align 4
  br label %31

; <label>:31                                      ; preds = %64, %30
  %32 = load volatile i32* @g_7, align 4
  %33 = icmp slt i32 %32, 14
  br i1 %33, label %34, label %69

; <label>:34                                      ; preds = %31
  store i8 -72, i8* %l_15, align 1
  store i32 -1626839478, i32* %l_20, align 4
  %35 = load i32*** %l_8, align 8
  %36 = load i32** %35
  %37 = load volatile i32* %36
  %38 = icmp ne i32 %37, 0
  br i1 %38, label %39, label %40

; <label>:39                                      ; preds = %34
  br label %69

; <label>:40                                      ; preds = %34
  store i64 0, i64* %l_5, align 8
  br label %41

; <label>:41                                      ; preds = %59, %40
  %42 = load i64* %l_5, align 8
  %43 = icmp ule i64 %42, -30
  br i1 %43, label %44, label %62

; <label>:44                                      ; preds = %41
  store i32 1, i32* %l_19, align 4
  %45 = load i8* %l_15, align 1
  %46 = sext i8 %45 to i32
  %47 = load i32** @g_6, align 8
  store volatile i32 %46, i32* %47
  %48 = load i32** @g_6, align 8
  %49 = load volatile i32* %48
  %50 = trunc i32 %49 to i16
  %51 = call zeroext i16 @safe_add_func_uint16_t_u_u(i16 zeroext %50, i16 zeroext 1)
  %52 = zext i16 %51 to i32
  %53 = load i32* @g_18, align 4
  %54 = xor i32 %53, %52
  store i32 %54, i32* @g_18, align 4
  %55 = load i32* %l_19, align 4
  %56 = icmp ne i32 %55, 0
  br i1 %56, label %57, label %58

; <label>:57                                      ; preds = %44
  br label %59

; <label>:58                                      ; preds = %44
  br label %59

; <label>:59                                      ; preds = %58, %57
  %60 = load i64* %l_5, align 8
  %61 = call i64 @safe_sub_func_int64_t_s_s(i64 %60, i64 1)
  store i64 %61, i64* %l_5, align 8
  br label %41

; <label>:62                                      ; preds = %41
  %63 = load i32* %l_20, align 4
  store i32 %63, i32* %1
  br label %220
                                                  ; No predecessors!
  %65 = load volatile i32* @g_7, align 4
  %66 = trunc i32 %65 to i8
  %67 = call signext i8 @safe_add_func_int8_t_s_s(i8 signext %66, i8 signext 8)
  %68 = sext i8 %67 to i32
  store volatile i32 %68, i32* @g_7, align 4
  br label %31

; <label>:69                                      ; preds = %39, %31
  br label %133

; <label>:70                                      ; preds = %12
  store i32 0, i32* %i1, align 4
  br label %71

; <label>:71                                      ; preds = %122, %70
  %72 = load i32* %i1, align 4
  %73 = icmp slt i32 %72, 3
  br i1 %73, label %74, label %125

; <label>:74                                      ; preds = %71
  store i32 0, i32* %j, align 4
  br label %75

; <label>:75                                      ; preds = %118, %74
  %76 = load i32* %j, align 4
  %77 = icmp slt i32 %76, 10
  br i1 %77, label %78, label %121

; <label>:78                                      ; preds = %75
  store i32 0, i32* %k, align 4
  br label %79

; <label>:79                                      ; preds = %114, %78
  %80 = load i32* %k, align 4
  %81 = icmp slt i32 %80, 1
  br i1 %81, label %82, label %117

; <label>:82                                      ; preds = %79
  store i32 0, i32* %l, align 4
  br label %83

; <label>:83                                      ; preds = %110, %82
  %84 = load i32* %l, align 4
  %85 = icmp slt i32 %84, 2
  br i1 %85, label %86, label %113

; <label>:86                                      ; preds = %83
  store i32 0, i32* %m, align 4
  br label %87

; <label>:87                                      ; preds = %106, %86
  %88 = load i32* %m, align 4
  %89 = icmp slt i32 %88, 1
  br i1 %89, label %90, label %109

; <label>:90                                      ; preds = %87
  %91 = load i32* %m, align 4
  %92 = sext i32 %91 to i64
  %93 = load i32* %l, align 4
  %94 = sext i32 %93 to i64
  %95 = load i32* %k, align 4
  %96 = sext i32 %95 to i64
  %97 = load i32* %j, align 4
  %98 = sext i32 %97 to i64
  %99 = load i32* %i1, align 4
  %100 = sext i32 %99 to i64
  %101 = getelementptr inbounds [3 x [10 x [1 x [2 x [1 x i8]]]]]* %l_21, i32 0, i64 %100
  %102 = getelementptr inbounds [10 x [1 x [2 x [1 x i8]]]]* %101, i32 0, i64 %98
  %103 = getelementptr inbounds [1 x [2 x [1 x i8]]]* %102, i32 0, i64 %96
  %104 = getelementptr inbounds [2 x [1 x i8]]* %103, i32 0, i64 %94
  %105 = getelementptr inbounds [1 x i8]* %104, i32 0, i64 %92
  store i8 98, i8* %105, align 1
  br label %106

; <label>:106                                     ; preds = %90
  %107 = load i32* %m, align 4
  %108 = add nsw i32 %107, 1
  store i32 %108, i32* %m, align 4
  br label %87

; <label>:109                                     ; preds = %87
  br label %110

; <label>:110                                     ; preds = %109
  %111 = load i32* %l, align 4
  %112 = add nsw i32 %111, 1
  store i32 %112, i32* %l, align 4
  br label %83

; <label>:113                                     ; preds = %83
  br label %114

; <label>:114                                     ; preds = %113
  %115 = load i32* %k, align 4
  %116 = add nsw i32 %115, 1
  store i32 %116, i32* %k, align 4
  br label %79

; <label>:117                                     ; preds = %79
  br label %118

; <label>:118                                     ; preds = %117
  %119 = load i32* %j, align 4
  %120 = add nsw i32 %119, 1
  store i32 %120, i32* %j, align 4
  br label %75

; <label>:121                                     ; preds = %75
  br label %122

; <label>:122                                     ; preds = %121
  %123 = load i32* %i1, align 4
  %124 = add nsw i32 %123, 1
  store i32 %124, i32* %i1, align 4
  br label %71

; <label>:125                                     ; preds = %71
  %126 = getelementptr inbounds [3 x [10 x [1 x [2 x [1 x i8]]]]]* %l_21, i32 0, i64 0
  %127 = getelementptr inbounds [10 x [1 x [2 x [1 x i8]]]]* %126, i32 0, i64 2
  %128 = getelementptr inbounds [1 x [2 x [1 x i8]]]* %127, i32 0, i64 0
  %129 = getelementptr inbounds [2 x [1 x i8]]* %128, i32 0, i64 0
  %130 = getelementptr inbounds [1 x i8]* %129, i32 0, i64 0
  %131 = load i8* %130, align 1
  %132 = sext i8 %131 to i32
  store i32 %132, i32* %1
  br label %220

; <label>:133                                     ; preds = %69
  store i32* @g_7, i32** @g_6, align 8
  store i32 0, i32* @g_18, align 4
  br label %134

; <label>:134                                     ; preds = %213, %133
  %135 = load i32* @g_18, align 4
  %136 = icmp ult i32 %135, 0
  br i1 %136, label %137, label %218

; <label>:137                                     ; preds = %134
  store i8 6, i8* %l_26, align 1
  store i32 -627628233, i32* %l_27, align 4
  store i64 -1, i64* %l_5, align 8
  br label %138

; <label>:138                                     ; preds = %144, %137
  %139 = load i64* %l_5, align 8
  %140 = icmp ugt i64 %139, 22
  br i1 %140, label %141, label %149

; <label>:141                                     ; preds = %138
  %142 = load i8* %l_26, align 1
  %143 = zext i8 %142 to i32
  store i32 %143, i32* %1
  br label %220
                                                  ; No predecessors!
  %145 = load i64* %l_5, align 8
  %146 = trunc i64 %145 to i32
  %147 = call i32 @safe_add_func_uint32_t_u_u(i32 %146, i32 5)
  %148 = zext i32 %147 to i64
  store i64 %148, i64* %l_5, align 8
  br label %138

; <label>:149                                     ; preds = %138
  %150 = load i32** @g_6, align 8
  %151 = load volatile i32* %150
  %152 = load i32* %l_27, align 4
  %153 = xor i32 %152, %151
  store i32 %153, i32* %l_27, align 4
  %154 = load i32** @g_6, align 8
  %155 = load volatile i32* %154
  %156 = load i32* @g_18, align 4
  %157 = or i32 %155, %156
  %158 = icmp ne i32 %157, 0
  br i1 %158, label %159, label %166

; <label>:159                                     ; preds = %149
  %160 = load i32** @g_6, align 8
  %161 = load volatile i32* %160
  %162 = trunc i32 %161 to i8
  %163 = call zeroext i8 @safe_rshift_func_uint8_t_u_u(i8 zeroext %162, i32 7)
  %164 = zext i8 %163 to i32
  %165 = icmp ne i32 %164, 0
  br label %166

; <label>:166                                     ; preds = %159, %149
  %167 = phi i1 [ false, %149 ], [ %165, %159 ]
  %168 = zext i1 %167 to i32
  %169 = call zeroext i16 @safe_rshift_func_uint16_t_u_s(i16 zeroext -13198, i32 %168)
  %170 = trunc i16 %169 to i8
  %171 = getelementptr inbounds [3 x i32*]* %l_3, i32 0, i64 1
  %172 = load i32** %171, align 8
  %173 = getelementptr inbounds [3 x i32*]* %l_3, i32 0, i64 1
  %174 = load i32** %173, align 8
  %175 = icmp eq i32* %172, %174
  %176 = zext i1 %175 to i32
  %177 = load i32* @g_18, align 4
  %178 = and i32 %176, %177
  %179 = trunc i32 %178 to i8
  %180 = call signext i8 @safe_sub_func_int8_t_s_s(i8 signext %170, i8 signext %179)
  %181 = load i8* %l_26, align 1
  %182 = load i8* %l_26, align 1
  %183 = zext i8 %182 to i32
  %184 = call zeroext i8 @safe_rshift_func_uint8_t_u_u(i8 zeroext %181, i32 %183)
  %185 = zext i8 %184 to i32
  %186 = load i32* %l_27, align 4
  %187 = icmp ne i32 %186, 1
  %188 = zext i1 %187 to i32
  %189 = xor i32 %185, %188
  %190 = load i8* @g_4, align 1
  %191 = zext i8 %190 to i32
  %192 = icmp ne i32 %191, 0
  br i1 %192, label %196, label %193

; <label>:193                                     ; preds = %166
  %194 = load i32* %l_27, align 4
  %195 = icmp ne i32 %194, 0
  br label %196

; <label>:196                                     ; preds = %193, %166
  %197 = phi i1 [ true, %166 ], [ %195, %193 ]
  %198 = zext i1 %197 to i32
  %199 = sext i32 %198 to i64
  %200 = icmp sge i64 1, %199
  %201 = zext i1 %200 to i32
  %202 = icmp slt i32 %189, %201
  %203 = zext i1 %202 to i32
  %204 = xor i32 %203, -1
  %205 = sext i32 %204 to i64
  %206 = icmp slt i64 1343611072, %205
  %207 = zext i1 %206 to i32
  %208 = trunc i32 %207 to i8
  %209 = call zeroext i8 @safe_mod_func_uint8_t_u_u(i8 zeroext %180, i8 zeroext %208)
  %210 = zext i8 %209 to i32
  %211 = load i32* getelementptr inbounds ([4 x [2 x i32]]* @g_39, i32 0, i64 0, i64 1), align 4
  %212 = xor i32 %211, %210
  store i32 %212, i32* getelementptr inbounds ([4 x [2 x i32]]* @g_39, i32 0, i64 0, i64 1), align 4
  br label %213

; <label>:213                                     ; preds = %196
  %214 = load i32* @g_18, align 4
  %215 = trunc i32 %214 to i8
  %216 = call zeroext i8 @safe_sub_func_uint8_t_u_u(i8 zeroext %215, i8 zeroext 3)
  %217 = zext i8 %216 to i32
  store i32 %217, i32* @g_18, align 4
  br label %134

; <label>:218                                     ; preds = %134
  %219 = load i32* getelementptr inbounds ([4 x [2 x i32]]* @g_39, i32 0, i64 2, i64 1), align 4
  store i32 %219, i32* %1
  br label %220

; <label>:220                                     ; preds = %218, %141, %125, %62, %23
  %221 = load i32* %1
  ret i32 %221
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

define internal i32 @safe_add_func_uint32_t_u_u(i32 %ui1, i32 %ui2) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 %ui1, i32* %1, align 4
  store i32 %ui2, i32* %2, align 4
  %3 = load i32* %1, align 4
  %4 = load i32* %2, align 4
  %5 = add i32 %3, %4
  ret i32 %5
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
  %j = alloca i32, align 4
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  %4 = call i32 @func_1()
  %5 = load i8* @g_4, align 1
  %6 = zext i8 %5 to i32
  %7 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %6)
  %8 = load volatile i32* @g_7, align 4
  %9 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str1, i32 0, i32 0), i32 %8)
  %10 = load i32* @g_18, align 4
  %11 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str2, i32 0, i32 0), i32 %10)
  %12 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str3, i32 0, i32 0), i32 1)
  %13 = load i32* getelementptr inbounds ([4 x [2 x i32]]* @g_39, i32 0, i64 0, i64 0), align 4
  %14 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str4, i32 0, i32 0), i32 %13)
  %15 = load i32* getelementptr inbounds ([4 x [2 x i32]]* @g_39, i32 0, i64 0, i64 1), align 4
  %16 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str5, i32 0, i32 0), i32 %15)
  %17 = load i32* getelementptr inbounds ([4 x [2 x i32]]* @g_39, i32 0, i64 1, i64 0), align 4
  %18 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str6, i32 0, i32 0), i32 %17)
  %19 = load i32* getelementptr inbounds ([4 x [2 x i32]]* @g_39, i32 0, i64 1, i64 1), align 4
  %20 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str7, i32 0, i32 0), i32 %19)
  %21 = load i32* getelementptr inbounds ([4 x [2 x i32]]* @g_39, i32 0, i64 2, i64 0), align 4
  %22 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str8, i32 0, i32 0), i32 %21)
  %23 = load i32* getelementptr inbounds ([4 x [2 x i32]]* @g_39, i32 0, i64 2, i64 1), align 4
  %24 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str9, i32 0, i32 0), i32 %23)
  %25 = load i32* getelementptr inbounds ([4 x [2 x i32]]* @g_39, i32 0, i64 3, i64 0), align 4
  %26 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str10, i32 0, i32 0), i32 %25)
  %27 = load i32* getelementptr inbounds ([4 x [2 x i32]]* @g_39, i32 0, i64 3, i64 1), align 4
  %28 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str11, i32 0, i32 0), i32 %27)
  %29 = load i32* getelementptr inbounds ([4 x [2 x i32]]* @g_39, i32 0, i64 0, i64 1), align 4
  %30 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str5, i32 0, i32 0), i32 %29)
  %31 = load i32* %1
  ret i32 %31
}

declare i32 @printf(i8*, ...)
