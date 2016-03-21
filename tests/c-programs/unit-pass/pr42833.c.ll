; ModuleID = './pr42833.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.neon_s8 = type { i8, i8, i8, i8 }
%union.anon = type { i32 }
%union.anon.0 = type { i32 }
%union.anon.1 = type { i32 }

; Function Attrs: nounwind uwtable
define i32 @helper_neon_rshl_s8(i32 %arg1, i32 %arg2) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %res = alloca i32, align 4
  %vsrc1 = alloca %struct.neon_s8, align 1
  %vsrc2 = alloca %struct.neon_s8, align 1
  %vdest = alloca %struct.neon_s8, align 1
  %conv_u = alloca %union.anon, align 4
  %conv_u1 = alloca %union.anon.0, align 4
  %tmp = alloca i8, align 1
  %tmp2 = alloca i8, align 1
  %tmp3 = alloca i8, align 1
  %tmp4 = alloca i8, align 1
  %conv_u5 = alloca %union.anon.1, align 4
  store i32 %arg1, i32* %1, align 4
  store i32 %arg2, i32* %2, align 4
  br label %3

; <label>:3                                       ; preds = %0
  %4 = load i32, i32* %1, align 4
  %5 = bitcast %union.anon* %conv_u to i32*
  store i32 %4, i32* %5, align 4
  %6 = bitcast %union.anon* %conv_u to %struct.neon_s8*
  %7 = bitcast %struct.neon_s8* %vsrc1 to i8*
  %8 = bitcast %struct.neon_s8* %6 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %7, i8* %8, i64 4, i32 1, i1 false)
  br label %9

; <label>:9                                       ; preds = %3
  br label %10

; <label>:10                                      ; preds = %9
  %11 = load i32, i32* %2, align 4
  %12 = bitcast %union.anon.0* %conv_u1 to i32*
  store i32 %11, i32* %12, align 4
  %13 = bitcast %union.anon.0* %conv_u1 to %struct.neon_s8*
  %14 = bitcast %struct.neon_s8* %vsrc2 to i8*
  %15 = bitcast %struct.neon_s8* %13 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %14, i8* %15, i64 4, i32 1, i1 false)
  br label %16

; <label>:16                                      ; preds = %10
  br label %17

; <label>:17                                      ; preds = %16
  %18 = getelementptr inbounds %struct.neon_s8, %struct.neon_s8* %vsrc2, i32 0, i32 0
  %19 = load i8, i8* %18, align 1
  store i8 %19, i8* %tmp, align 1
  %20 = load i8, i8* %tmp, align 1
  %21 = sext i8 %20 to i32
  %22 = icmp sge i32 %21, 8
  br i1 %22, label %23, label %25

; <label>:23                                      ; preds = %17
  %24 = getelementptr inbounds %struct.neon_s8, %struct.neon_s8* %vdest, i32 0, i32 0
  store i8 0, i8* %24, align 1
  br label %89

; <label>:25                                      ; preds = %17
  %26 = load i8, i8* %tmp, align 1
  %27 = sext i8 %26 to i32
  %28 = icmp slt i32 %27, -8
  br i1 %28, label %29, label %36

; <label>:29                                      ; preds = %25
  %30 = getelementptr inbounds %struct.neon_s8, %struct.neon_s8* %vsrc1, i32 0, i32 0
  %31 = load i8, i8* %30, align 1
  %32 = sext i8 %31 to i32
  %33 = ashr i32 %32, 7
  %34 = trunc i32 %33 to i8
  %35 = getelementptr inbounds %struct.neon_s8, %struct.neon_s8* %vdest, i32 0, i32 0
  store i8 %34, i8* %35, align 1
  br label %88

; <label>:36                                      ; preds = %25
  %37 = load i8, i8* %tmp, align 1
  %38 = sext i8 %37 to i32
  %39 = icmp eq i32 %38, -8
  br i1 %39, label %40, label %58

; <label>:40                                      ; preds = %36
  %41 = getelementptr inbounds %struct.neon_s8, %struct.neon_s8* %vsrc1, i32 0, i32 0
  %42 = load i8, i8* %41, align 1
  %43 = sext i8 %42 to i32
  %44 = load i8, i8* %tmp, align 1
  %45 = sext i8 %44 to i32
  %46 = sub nsw i32 %45, 1
  %47 = ashr i32 %43, %46
  %48 = trunc i32 %47 to i8
  %49 = getelementptr inbounds %struct.neon_s8, %struct.neon_s8* %vdest, i32 0, i32 0
  store i8 %48, i8* %49, align 1
  %50 = getelementptr inbounds %struct.neon_s8, %struct.neon_s8* %vdest, i32 0, i32 0
  %51 = load i8, i8* %50, align 1
  %52 = add i8 %51, 1
  store i8 %52, i8* %50, align 1
  %53 = getelementptr inbounds %struct.neon_s8, %struct.neon_s8* %vdest, i32 0, i32 0
  %54 = load i8, i8* %53, align 1
  %55 = sext i8 %54 to i32
  %56 = ashr i32 %55, 1
  %57 = trunc i32 %56 to i8
  store i8 %57, i8* %53, align 1
  br label %87

; <label>:58                                      ; preds = %36
  %59 = load i8, i8* %tmp, align 1
  %60 = sext i8 %59 to i32
  %61 = icmp slt i32 %60, 0
  br i1 %61, label %62, label %77

; <label>:62                                      ; preds = %58
  %63 = getelementptr inbounds %struct.neon_s8, %struct.neon_s8* %vsrc1, i32 0, i32 0
  %64 = load i8, i8* %63, align 1
  %65 = sext i8 %64 to i32
  %66 = load i8, i8* %tmp, align 1
  %67 = sext i8 %66 to i32
  %68 = sub nsw i32 -1, %67
  %69 = shl i32 1, %68
  %70 = add nsw i32 %65, %69
  %71 = load i8, i8* %tmp, align 1
  %72 = sext i8 %71 to i32
  %73 = sub nsw i32 0, %72
  %74 = ashr i32 %70, %73
  %75 = trunc i32 %74 to i8
  %76 = getelementptr inbounds %struct.neon_s8, %struct.neon_s8* %vdest, i32 0, i32 0
  store i8 %75, i8* %76, align 1
  br label %86

; <label>:77                                      ; preds = %58
  %78 = getelementptr inbounds %struct.neon_s8, %struct.neon_s8* %vsrc1, i32 0, i32 0
  %79 = load i8, i8* %78, align 1
  %80 = sext i8 %79 to i32
  %81 = load i8, i8* %tmp, align 1
  %82 = sext i8 %81 to i32
  %83 = shl i32 %80, %82
  %84 = trunc i32 %83 to i8
  %85 = getelementptr inbounds %struct.neon_s8, %struct.neon_s8* %vdest, i32 0, i32 0
  store i8 %84, i8* %85, align 1
  br label %86

; <label>:86                                      ; preds = %77, %62
  br label %87

; <label>:87                                      ; preds = %86, %40
  br label %88

; <label>:88                                      ; preds = %87, %29
  br label %89

; <label>:89                                      ; preds = %88, %23
  br label %90

; <label>:90                                      ; preds = %89
  br label %91

; <label>:91                                      ; preds = %90
  %92 = getelementptr inbounds %struct.neon_s8, %struct.neon_s8* %vsrc2, i32 0, i32 1
  %93 = load i8, i8* %92, align 1
  store i8 %93, i8* %tmp2, align 1
  %94 = load i8, i8* %tmp2, align 1
  %95 = sext i8 %94 to i32
  %96 = icmp sge i32 %95, 8
  br i1 %96, label %97, label %99

; <label>:97                                      ; preds = %91
  %98 = getelementptr inbounds %struct.neon_s8, %struct.neon_s8* %vdest, i32 0, i32 1
  store i8 0, i8* %98, align 1
  br label %163

; <label>:99                                      ; preds = %91
  %100 = load i8, i8* %tmp2, align 1
  %101 = sext i8 %100 to i32
  %102 = icmp slt i32 %101, -8
  br i1 %102, label %103, label %110

; <label>:103                                     ; preds = %99
  %104 = getelementptr inbounds %struct.neon_s8, %struct.neon_s8* %vsrc1, i32 0, i32 1
  %105 = load i8, i8* %104, align 1
  %106 = sext i8 %105 to i32
  %107 = ashr i32 %106, 7
  %108 = trunc i32 %107 to i8
  %109 = getelementptr inbounds %struct.neon_s8, %struct.neon_s8* %vdest, i32 0, i32 1
  store i8 %108, i8* %109, align 1
  br label %162

; <label>:110                                     ; preds = %99
  %111 = load i8, i8* %tmp2, align 1
  %112 = sext i8 %111 to i32
  %113 = icmp eq i32 %112, -8
  br i1 %113, label %114, label %132

; <label>:114                                     ; preds = %110
  %115 = getelementptr inbounds %struct.neon_s8, %struct.neon_s8* %vsrc1, i32 0, i32 1
  %116 = load i8, i8* %115, align 1
  %117 = sext i8 %116 to i32
  %118 = load i8, i8* %tmp2, align 1
  %119 = sext i8 %118 to i32
  %120 = sub nsw i32 %119, 1
  %121 = ashr i32 %117, %120
  %122 = trunc i32 %121 to i8
  %123 = getelementptr inbounds %struct.neon_s8, %struct.neon_s8* %vdest, i32 0, i32 1
  store i8 %122, i8* %123, align 1
  %124 = getelementptr inbounds %struct.neon_s8, %struct.neon_s8* %vdest, i32 0, i32 1
  %125 = load i8, i8* %124, align 1
  %126 = add i8 %125, 1
  store i8 %126, i8* %124, align 1
  %127 = getelementptr inbounds %struct.neon_s8, %struct.neon_s8* %vdest, i32 0, i32 1
  %128 = load i8, i8* %127, align 1
  %129 = sext i8 %128 to i32
  %130 = ashr i32 %129, 1
  %131 = trunc i32 %130 to i8
  store i8 %131, i8* %127, align 1
  br label %161

; <label>:132                                     ; preds = %110
  %133 = load i8, i8* %tmp2, align 1
  %134 = sext i8 %133 to i32
  %135 = icmp slt i32 %134, 0
  br i1 %135, label %136, label %151

; <label>:136                                     ; preds = %132
  %137 = getelementptr inbounds %struct.neon_s8, %struct.neon_s8* %vsrc1, i32 0, i32 1
  %138 = load i8, i8* %137, align 1
  %139 = sext i8 %138 to i32
  %140 = load i8, i8* %tmp2, align 1
  %141 = sext i8 %140 to i32
  %142 = sub nsw i32 -1, %141
  %143 = shl i32 1, %142
  %144 = add nsw i32 %139, %143
  %145 = load i8, i8* %tmp2, align 1
  %146 = sext i8 %145 to i32
  %147 = sub nsw i32 0, %146
  %148 = ashr i32 %144, %147
  %149 = trunc i32 %148 to i8
  %150 = getelementptr inbounds %struct.neon_s8, %struct.neon_s8* %vdest, i32 0, i32 1
  store i8 %149, i8* %150, align 1
  br label %160

; <label>:151                                     ; preds = %132
  %152 = getelementptr inbounds %struct.neon_s8, %struct.neon_s8* %vsrc1, i32 0, i32 1
  %153 = load i8, i8* %152, align 1
  %154 = sext i8 %153 to i32
  %155 = load i8, i8* %tmp2, align 1
  %156 = sext i8 %155 to i32
  %157 = shl i32 %154, %156
  %158 = trunc i32 %157 to i8
  %159 = getelementptr inbounds %struct.neon_s8, %struct.neon_s8* %vdest, i32 0, i32 1
  store i8 %158, i8* %159, align 1
  br label %160

; <label>:160                                     ; preds = %151, %136
  br label %161

; <label>:161                                     ; preds = %160, %114
  br label %162

; <label>:162                                     ; preds = %161, %103
  br label %163

; <label>:163                                     ; preds = %162, %97
  br label %164

; <label>:164                                     ; preds = %163
  br label %165

; <label>:165                                     ; preds = %164
  %166 = getelementptr inbounds %struct.neon_s8, %struct.neon_s8* %vsrc2, i32 0, i32 2
  %167 = load i8, i8* %166, align 1
  store i8 %167, i8* %tmp3, align 1
  %168 = load i8, i8* %tmp3, align 1
  %169 = sext i8 %168 to i32
  %170 = icmp sge i32 %169, 8
  br i1 %170, label %171, label %173

; <label>:171                                     ; preds = %165
  %172 = getelementptr inbounds %struct.neon_s8, %struct.neon_s8* %vdest, i32 0, i32 2
  store i8 0, i8* %172, align 1
  br label %237

; <label>:173                                     ; preds = %165
  %174 = load i8, i8* %tmp3, align 1
  %175 = sext i8 %174 to i32
  %176 = icmp slt i32 %175, -8
  br i1 %176, label %177, label %184

; <label>:177                                     ; preds = %173
  %178 = getelementptr inbounds %struct.neon_s8, %struct.neon_s8* %vsrc1, i32 0, i32 2
  %179 = load i8, i8* %178, align 1
  %180 = sext i8 %179 to i32
  %181 = ashr i32 %180, 7
  %182 = trunc i32 %181 to i8
  %183 = getelementptr inbounds %struct.neon_s8, %struct.neon_s8* %vdest, i32 0, i32 2
  store i8 %182, i8* %183, align 1
  br label %236

; <label>:184                                     ; preds = %173
  %185 = load i8, i8* %tmp3, align 1
  %186 = sext i8 %185 to i32
  %187 = icmp eq i32 %186, -8
  br i1 %187, label %188, label %206

; <label>:188                                     ; preds = %184
  %189 = getelementptr inbounds %struct.neon_s8, %struct.neon_s8* %vsrc1, i32 0, i32 2
  %190 = load i8, i8* %189, align 1
  %191 = sext i8 %190 to i32
  %192 = load i8, i8* %tmp3, align 1
  %193 = sext i8 %192 to i32
  %194 = sub nsw i32 %193, 1
  %195 = ashr i32 %191, %194
  %196 = trunc i32 %195 to i8
  %197 = getelementptr inbounds %struct.neon_s8, %struct.neon_s8* %vdest, i32 0, i32 2
  store i8 %196, i8* %197, align 1
  %198 = getelementptr inbounds %struct.neon_s8, %struct.neon_s8* %vdest, i32 0, i32 2
  %199 = load i8, i8* %198, align 1
  %200 = add i8 %199, 1
  store i8 %200, i8* %198, align 1
  %201 = getelementptr inbounds %struct.neon_s8, %struct.neon_s8* %vdest, i32 0, i32 2
  %202 = load i8, i8* %201, align 1
  %203 = sext i8 %202 to i32
  %204 = ashr i32 %203, 1
  %205 = trunc i32 %204 to i8
  store i8 %205, i8* %201, align 1
  br label %235

; <label>:206                                     ; preds = %184
  %207 = load i8, i8* %tmp3, align 1
  %208 = sext i8 %207 to i32
  %209 = icmp slt i32 %208, 0
  br i1 %209, label %210, label %225

; <label>:210                                     ; preds = %206
  %211 = getelementptr inbounds %struct.neon_s8, %struct.neon_s8* %vsrc1, i32 0, i32 2
  %212 = load i8, i8* %211, align 1
  %213 = sext i8 %212 to i32
  %214 = load i8, i8* %tmp3, align 1
  %215 = sext i8 %214 to i32
  %216 = sub nsw i32 -1, %215
  %217 = shl i32 1, %216
  %218 = add nsw i32 %213, %217
  %219 = load i8, i8* %tmp3, align 1
  %220 = sext i8 %219 to i32
  %221 = sub nsw i32 0, %220
  %222 = ashr i32 %218, %221
  %223 = trunc i32 %222 to i8
  %224 = getelementptr inbounds %struct.neon_s8, %struct.neon_s8* %vdest, i32 0, i32 2
  store i8 %223, i8* %224, align 1
  br label %234

; <label>:225                                     ; preds = %206
  %226 = getelementptr inbounds %struct.neon_s8, %struct.neon_s8* %vsrc1, i32 0, i32 2
  %227 = load i8, i8* %226, align 1
  %228 = sext i8 %227 to i32
  %229 = load i8, i8* %tmp3, align 1
  %230 = sext i8 %229 to i32
  %231 = shl i32 %228, %230
  %232 = trunc i32 %231 to i8
  %233 = getelementptr inbounds %struct.neon_s8, %struct.neon_s8* %vdest, i32 0, i32 2
  store i8 %232, i8* %233, align 1
  br label %234

; <label>:234                                     ; preds = %225, %210
  br label %235

; <label>:235                                     ; preds = %234, %188
  br label %236

; <label>:236                                     ; preds = %235, %177
  br label %237

; <label>:237                                     ; preds = %236, %171
  br label %238

; <label>:238                                     ; preds = %237
  br label %239

; <label>:239                                     ; preds = %238
  %240 = getelementptr inbounds %struct.neon_s8, %struct.neon_s8* %vsrc2, i32 0, i32 3
  %241 = load i8, i8* %240, align 1
  store i8 %241, i8* %tmp4, align 1
  %242 = load i8, i8* %tmp4, align 1
  %243 = sext i8 %242 to i32
  %244 = icmp sge i32 %243, 8
  br i1 %244, label %245, label %247

; <label>:245                                     ; preds = %239
  %246 = getelementptr inbounds %struct.neon_s8, %struct.neon_s8* %vdest, i32 0, i32 3
  store i8 0, i8* %246, align 1
  br label %311

; <label>:247                                     ; preds = %239
  %248 = load i8, i8* %tmp4, align 1
  %249 = sext i8 %248 to i32
  %250 = icmp slt i32 %249, -8
  br i1 %250, label %251, label %258

; <label>:251                                     ; preds = %247
  %252 = getelementptr inbounds %struct.neon_s8, %struct.neon_s8* %vsrc1, i32 0, i32 3
  %253 = load i8, i8* %252, align 1
  %254 = sext i8 %253 to i32
  %255 = ashr i32 %254, 7
  %256 = trunc i32 %255 to i8
  %257 = getelementptr inbounds %struct.neon_s8, %struct.neon_s8* %vdest, i32 0, i32 3
  store i8 %256, i8* %257, align 1
  br label %310

; <label>:258                                     ; preds = %247
  %259 = load i8, i8* %tmp4, align 1
  %260 = sext i8 %259 to i32
  %261 = icmp eq i32 %260, -8
  br i1 %261, label %262, label %280

; <label>:262                                     ; preds = %258
  %263 = getelementptr inbounds %struct.neon_s8, %struct.neon_s8* %vsrc1, i32 0, i32 3
  %264 = load i8, i8* %263, align 1
  %265 = sext i8 %264 to i32
  %266 = load i8, i8* %tmp4, align 1
  %267 = sext i8 %266 to i32
  %268 = sub nsw i32 %267, 1
  %269 = ashr i32 %265, %268
  %270 = trunc i32 %269 to i8
  %271 = getelementptr inbounds %struct.neon_s8, %struct.neon_s8* %vdest, i32 0, i32 3
  store i8 %270, i8* %271, align 1
  %272 = getelementptr inbounds %struct.neon_s8, %struct.neon_s8* %vdest, i32 0, i32 3
  %273 = load i8, i8* %272, align 1
  %274 = add i8 %273, 1
  store i8 %274, i8* %272, align 1
  %275 = getelementptr inbounds %struct.neon_s8, %struct.neon_s8* %vdest, i32 0, i32 3
  %276 = load i8, i8* %275, align 1
  %277 = sext i8 %276 to i32
  %278 = ashr i32 %277, 1
  %279 = trunc i32 %278 to i8
  store i8 %279, i8* %275, align 1
  br label %309

; <label>:280                                     ; preds = %258
  %281 = load i8, i8* %tmp4, align 1
  %282 = sext i8 %281 to i32
  %283 = icmp slt i32 %282, 0
  br i1 %283, label %284, label %299

; <label>:284                                     ; preds = %280
  %285 = getelementptr inbounds %struct.neon_s8, %struct.neon_s8* %vsrc1, i32 0, i32 3
  %286 = load i8, i8* %285, align 1
  %287 = sext i8 %286 to i32
  %288 = load i8, i8* %tmp4, align 1
  %289 = sext i8 %288 to i32
  %290 = sub nsw i32 -1, %289
  %291 = shl i32 1, %290
  %292 = add nsw i32 %287, %291
  %293 = load i8, i8* %tmp4, align 1
  %294 = sext i8 %293 to i32
  %295 = sub nsw i32 0, %294
  %296 = ashr i32 %292, %295
  %297 = trunc i32 %296 to i8
  %298 = getelementptr inbounds %struct.neon_s8, %struct.neon_s8* %vdest, i32 0, i32 3
  store i8 %297, i8* %298, align 1
  br label %308

; <label>:299                                     ; preds = %280
  %300 = getelementptr inbounds %struct.neon_s8, %struct.neon_s8* %vsrc1, i32 0, i32 3
  %301 = load i8, i8* %300, align 1
  %302 = sext i8 %301 to i32
  %303 = load i8, i8* %tmp4, align 1
  %304 = sext i8 %303 to i32
  %305 = shl i32 %302, %304
  %306 = trunc i32 %305 to i8
  %307 = getelementptr inbounds %struct.neon_s8, %struct.neon_s8* %vdest, i32 0, i32 3
  store i8 %306, i8* %307, align 1
  br label %308

; <label>:308                                     ; preds = %299, %284
  br label %309

; <label>:309                                     ; preds = %308, %262
  br label %310

; <label>:310                                     ; preds = %309, %251
  br label %311

; <label>:311                                     ; preds = %310, %245
  br label %312

; <label>:312                                     ; preds = %311
  br label %313

; <label>:313                                     ; preds = %312
  %314 = bitcast %union.anon.1* %conv_u5 to %struct.neon_s8*
  %315 = bitcast %struct.neon_s8* %314 to i8*
  %316 = bitcast %struct.neon_s8* %vdest to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %315, i8* %316, i64 4, i32 1, i1 false)
  %317 = bitcast %union.anon.1* %conv_u5 to i32*
  %318 = load i32, i32* %317, align 4
  store i32 %318, i32* %res, align 4
  br label %319

; <label>:319                                     ; preds = %313
  %320 = load i32, i32* %res, align 4
  ret i32 %320
}

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %r = alloca i32, align 4
  store i32 0, i32* %1
  %2 = call i32 @helper_neon_rshl_s8(i32 84215045, i32 16843009)
  store i32 %2, i32* %r, align 4
  %3 = load i32, i32* %r, align 4
  %4 = icmp ne i32 %3, 168430090
  br i1 %4, label %5, label %6

; <label>:5                                       ; preds = %0
  call void @abort() #3
  unreachable

; <label>:6                                       ; preds = %0
  ret i32 0
}

; Function Attrs: noreturn
declare void @abort() #2

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }
attributes #2 = { noreturn "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
