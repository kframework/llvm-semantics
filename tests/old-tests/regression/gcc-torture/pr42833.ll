; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/pr42833.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.neon_s8 = type { i8, i8, i8, i8 }
%union.anon = type { i32 }

define i32 @helper_neon_rshl_s8(i32 %arg1, i32 %arg2) nounwind uwtable {
entry:
  %arg1.addr = alloca i32, align 4
  %arg2.addr = alloca i32, align 4
  %res = alloca i32, align 4
  %vsrc1 = alloca %struct.neon_s8, align 1
  %vsrc2 = alloca %struct.neon_s8, align 1
  %vdest = alloca %struct.neon_s8, align 1
  %conv_u = alloca %union.anon, align 4
  %conv_u5 = alloca %union.anon, align 4
  %tmp14 = alloca i8, align 1
  %tmp83 = alloca i8, align 1
  %tmp162 = alloca i8, align 1
  %tmp241 = alloca i8, align 1
  %conv_u320 = alloca %union.anon, align 4
  store i32 %arg1, i32* %arg1.addr, align 4
  store i32 %arg2, i32* %arg2.addr, align 4
  br label %do.body

do.body:                                          ; preds = %entry
  %tmp = load i32* %arg1.addr, align 4
  %i = bitcast %union.anon* %conv_u to i32*
  store i32 %tmp, i32* %i, align 4
  %v = bitcast %union.anon* %conv_u to %struct.neon_s8*
  %tmp1 = bitcast %struct.neon_s8* %vsrc1 to i8*
  %tmp2 = bitcast %struct.neon_s8* %v to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp1, i8* %tmp2, i64 4, i32 1, i1 false)
  br label %do.end

do.end:                                           ; preds = %do.body
  br label %do.body3

do.body3:                                         ; preds = %do.end
  %tmp6 = load i32* %arg2.addr, align 4
  %i7 = bitcast %union.anon* %conv_u5 to i32*
  store i32 %tmp6, i32* %i7, align 4
  %v8 = bitcast %union.anon* %conv_u5 to %struct.neon_s8*
  %tmp9 = bitcast %struct.neon_s8* %vsrc2 to i8*
  %tmp10 = bitcast %struct.neon_s8* %v8 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp9, i8* %tmp10, i64 4, i32 1, i1 false)
  br label %do.end11

do.end11:                                         ; preds = %do.body3
  br label %do.body12

do.body12:                                        ; preds = %do.end11
  %v1 = getelementptr inbounds %struct.neon_s8* %vsrc2, i32 0, i32 0
  %tmp15 = load i8* %v1, align 1
  store i8 %tmp15, i8* %tmp14, align 1
  %tmp16 = load i8* %tmp14, align 1
  %conv = sext i8 %tmp16 to i32
  %cmp = icmp sge i32 %conv, 8
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %do.body12
  %v118 = getelementptr inbounds %struct.neon_s8* %vdest, i32 0, i32 0
  store i8 0, i8* %v118, align 1
  br label %if.end79

if.else:                                          ; preds = %do.body12
  %tmp19 = load i8* %tmp14, align 1
  %conv20 = sext i8 %tmp19 to i32
  %cmp21 = icmp slt i32 %conv20, -8
  br i1 %cmp21, label %if.then23, label %if.else29

if.then23:                                        ; preds = %if.else
  %v124 = getelementptr inbounds %struct.neon_s8* %vsrc1, i32 0, i32 0
  %tmp25 = load i8* %v124, align 1
  %conv26 = sext i8 %tmp25 to i32
  %shr = ashr i32 %conv26, 7
  %conv27 = trunc i32 %shr to i8
  %v128 = getelementptr inbounds %struct.neon_s8* %vdest, i32 0, i32 0
  store i8 %conv27, i8* %v128, align 1
  br label %if.end78

if.else29:                                        ; preds = %if.else
  %tmp30 = load i8* %tmp14, align 1
  %conv31 = sext i8 %tmp30 to i32
  %cmp32 = icmp eq i32 %conv31, -8
  br i1 %cmp32, label %if.then34, label %if.else50

if.then34:                                        ; preds = %if.else29
  %v135 = getelementptr inbounds %struct.neon_s8* %vsrc1, i32 0, i32 0
  %tmp36 = load i8* %v135, align 1
  %conv37 = sext i8 %tmp36 to i32
  %tmp38 = load i8* %tmp14, align 1
  %conv39 = sext i8 %tmp38 to i32
  %sub = sub nsw i32 %conv39, 1
  %shr40 = ashr i32 %conv37, %sub
  %conv41 = trunc i32 %shr40 to i8
  %v142 = getelementptr inbounds %struct.neon_s8* %vdest, i32 0, i32 0
  store i8 %conv41, i8* %v142, align 1
  %v143 = getelementptr inbounds %struct.neon_s8* %vdest, i32 0, i32 0
  %tmp44 = load i8* %v143, align 1
  %inc = add i8 %tmp44, 1
  store i8 %inc, i8* %v143, align 1
  %v145 = getelementptr inbounds %struct.neon_s8* %vdest, i32 0, i32 0
  %tmp46 = load i8* %v145, align 1
  %conv47 = sext i8 %tmp46 to i32
  %shr48 = ashr i32 %conv47, 1
  %conv49 = trunc i32 %shr48 to i8
  store i8 %conv49, i8* %v145, align 1
  br label %if.end77

if.else50:                                        ; preds = %if.else29
  %tmp51 = load i8* %tmp14, align 1
  %conv52 = sext i8 %tmp51 to i32
  %cmp53 = icmp slt i32 %conv52, 0
  br i1 %cmp53, label %if.then55, label %if.else68

if.then55:                                        ; preds = %if.else50
  %v156 = getelementptr inbounds %struct.neon_s8* %vsrc1, i32 0, i32 0
  %tmp57 = load i8* %v156, align 1
  %conv58 = sext i8 %tmp57 to i32
  %tmp59 = load i8* %tmp14, align 1
  %conv60 = sext i8 %tmp59 to i32
  %sub61 = sub nsw i32 -1, %conv60
  %shl = shl i32 1, %sub61
  %add = add nsw i32 %conv58, %shl
  %tmp62 = load i8* %tmp14, align 1
  %conv63 = sext i8 %tmp62 to i32
  %sub64 = sub nsw i32 0, %conv63
  %shr65 = ashr i32 %add, %sub64
  %conv66 = trunc i32 %shr65 to i8
  %v167 = getelementptr inbounds %struct.neon_s8* %vdest, i32 0, i32 0
  store i8 %conv66, i8* %v167, align 1
  br label %if.end

if.else68:                                        ; preds = %if.else50
  %v169 = getelementptr inbounds %struct.neon_s8* %vsrc1, i32 0, i32 0
  %tmp70 = load i8* %v169, align 1
  %conv71 = sext i8 %tmp70 to i32
  %tmp72 = load i8* %tmp14, align 1
  %conv73 = sext i8 %tmp72 to i32
  %shl74 = shl i32 %conv71, %conv73
  %conv75 = trunc i32 %shl74 to i8
  %v176 = getelementptr inbounds %struct.neon_s8* %vdest, i32 0, i32 0
  store i8 %conv75, i8* %v176, align 1
  br label %if.end

if.end:                                           ; preds = %if.else68, %if.then55
  br label %if.end77

if.end77:                                         ; preds = %if.end, %if.then34
  br label %if.end78

if.end78:                                         ; preds = %if.end77, %if.then23
  br label %if.end79

if.end79:                                         ; preds = %if.end78, %if.then
  br label %do.end80

do.end80:                                         ; preds = %if.end79
  br label %do.body81

do.body81:                                        ; preds = %do.end80
  %v2 = getelementptr inbounds %struct.neon_s8* %vsrc2, i32 0, i32 1
  %tmp84 = load i8* %v2, align 1
  store i8 %tmp84, i8* %tmp83, align 1
  %tmp85 = load i8* %tmp83, align 1
  %conv86 = sext i8 %tmp85 to i32
  %cmp87 = icmp sge i32 %conv86, 8
  br i1 %cmp87, label %if.then89, label %if.else91

if.then89:                                        ; preds = %do.body81
  %v290 = getelementptr inbounds %struct.neon_s8* %vdest, i32 0, i32 1
  store i8 0, i8* %v290, align 1
  br label %if.end158

if.else91:                                        ; preds = %do.body81
  %tmp92 = load i8* %tmp83, align 1
  %conv93 = sext i8 %tmp92 to i32
  %cmp94 = icmp slt i32 %conv93, -8
  br i1 %cmp94, label %if.then96, label %if.else103

if.then96:                                        ; preds = %if.else91
  %v297 = getelementptr inbounds %struct.neon_s8* %vsrc1, i32 0, i32 1
  %tmp98 = load i8* %v297, align 1
  %conv99 = sext i8 %tmp98 to i32
  %shr100 = ashr i32 %conv99, 7
  %conv101 = trunc i32 %shr100 to i8
  %v2102 = getelementptr inbounds %struct.neon_s8* %vdest, i32 0, i32 1
  store i8 %conv101, i8* %v2102, align 1
  br label %if.end157

if.else103:                                       ; preds = %if.else91
  %tmp104 = load i8* %tmp83, align 1
  %conv105 = sext i8 %tmp104 to i32
  %cmp106 = icmp eq i32 %conv105, -8
  br i1 %cmp106, label %if.then108, label %if.else126

if.then108:                                       ; preds = %if.else103
  %v2109 = getelementptr inbounds %struct.neon_s8* %vsrc1, i32 0, i32 1
  %tmp110 = load i8* %v2109, align 1
  %conv111 = sext i8 %tmp110 to i32
  %tmp112 = load i8* %tmp83, align 1
  %conv113 = sext i8 %tmp112 to i32
  %sub114 = sub nsw i32 %conv113, 1
  %shr115 = ashr i32 %conv111, %sub114
  %conv116 = trunc i32 %shr115 to i8
  %v2117 = getelementptr inbounds %struct.neon_s8* %vdest, i32 0, i32 1
  store i8 %conv116, i8* %v2117, align 1
  %v2118 = getelementptr inbounds %struct.neon_s8* %vdest, i32 0, i32 1
  %tmp119 = load i8* %v2118, align 1
  %inc120 = add i8 %tmp119, 1
  store i8 %inc120, i8* %v2118, align 1
  %v2121 = getelementptr inbounds %struct.neon_s8* %vdest, i32 0, i32 1
  %tmp122 = load i8* %v2121, align 1
  %conv123 = sext i8 %tmp122 to i32
  %shr124 = ashr i32 %conv123, 1
  %conv125 = trunc i32 %shr124 to i8
  store i8 %conv125, i8* %v2121, align 1
  br label %if.end156

if.else126:                                       ; preds = %if.else103
  %tmp127 = load i8* %tmp83, align 1
  %conv128 = sext i8 %tmp127 to i32
  %cmp129 = icmp slt i32 %conv128, 0
  br i1 %cmp129, label %if.then131, label %if.else146

if.then131:                                       ; preds = %if.else126
  %v2132 = getelementptr inbounds %struct.neon_s8* %vsrc1, i32 0, i32 1
  %tmp133 = load i8* %v2132, align 1
  %conv134 = sext i8 %tmp133 to i32
  %tmp135 = load i8* %tmp83, align 1
  %conv136 = sext i8 %tmp135 to i32
  %sub137 = sub nsw i32 -1, %conv136
  %shl138 = shl i32 1, %sub137
  %add139 = add nsw i32 %conv134, %shl138
  %tmp140 = load i8* %tmp83, align 1
  %conv141 = sext i8 %tmp140 to i32
  %sub142 = sub nsw i32 0, %conv141
  %shr143 = ashr i32 %add139, %sub142
  %conv144 = trunc i32 %shr143 to i8
  %v2145 = getelementptr inbounds %struct.neon_s8* %vdest, i32 0, i32 1
  store i8 %conv144, i8* %v2145, align 1
  br label %if.end155

if.else146:                                       ; preds = %if.else126
  %v2147 = getelementptr inbounds %struct.neon_s8* %vsrc1, i32 0, i32 1
  %tmp148 = load i8* %v2147, align 1
  %conv149 = sext i8 %tmp148 to i32
  %tmp150 = load i8* %tmp83, align 1
  %conv151 = sext i8 %tmp150 to i32
  %shl152 = shl i32 %conv149, %conv151
  %conv153 = trunc i32 %shl152 to i8
  %v2154 = getelementptr inbounds %struct.neon_s8* %vdest, i32 0, i32 1
  store i8 %conv153, i8* %v2154, align 1
  br label %if.end155

if.end155:                                        ; preds = %if.else146, %if.then131
  br label %if.end156

if.end156:                                        ; preds = %if.end155, %if.then108
  br label %if.end157

if.end157:                                        ; preds = %if.end156, %if.then96
  br label %if.end158

if.end158:                                        ; preds = %if.end157, %if.then89
  br label %do.end159

do.end159:                                        ; preds = %if.end158
  br label %do.body160

do.body160:                                       ; preds = %do.end159
  %v3 = getelementptr inbounds %struct.neon_s8* %vsrc2, i32 0, i32 2
  %tmp163 = load i8* %v3, align 1
  store i8 %tmp163, i8* %tmp162, align 1
  %tmp164 = load i8* %tmp162, align 1
  %conv165 = sext i8 %tmp164 to i32
  %cmp166 = icmp sge i32 %conv165, 8
  br i1 %cmp166, label %if.then168, label %if.else170

if.then168:                                       ; preds = %do.body160
  %v3169 = getelementptr inbounds %struct.neon_s8* %vdest, i32 0, i32 2
  store i8 0, i8* %v3169, align 1
  br label %if.end237

if.else170:                                       ; preds = %do.body160
  %tmp171 = load i8* %tmp162, align 1
  %conv172 = sext i8 %tmp171 to i32
  %cmp173 = icmp slt i32 %conv172, -8
  br i1 %cmp173, label %if.then175, label %if.else182

if.then175:                                       ; preds = %if.else170
  %v3176 = getelementptr inbounds %struct.neon_s8* %vsrc1, i32 0, i32 2
  %tmp177 = load i8* %v3176, align 1
  %conv178 = sext i8 %tmp177 to i32
  %shr179 = ashr i32 %conv178, 7
  %conv180 = trunc i32 %shr179 to i8
  %v3181 = getelementptr inbounds %struct.neon_s8* %vdest, i32 0, i32 2
  store i8 %conv180, i8* %v3181, align 1
  br label %if.end236

if.else182:                                       ; preds = %if.else170
  %tmp183 = load i8* %tmp162, align 1
  %conv184 = sext i8 %tmp183 to i32
  %cmp185 = icmp eq i32 %conv184, -8
  br i1 %cmp185, label %if.then187, label %if.else205

if.then187:                                       ; preds = %if.else182
  %v3188 = getelementptr inbounds %struct.neon_s8* %vsrc1, i32 0, i32 2
  %tmp189 = load i8* %v3188, align 1
  %conv190 = sext i8 %tmp189 to i32
  %tmp191 = load i8* %tmp162, align 1
  %conv192 = sext i8 %tmp191 to i32
  %sub193 = sub nsw i32 %conv192, 1
  %shr194 = ashr i32 %conv190, %sub193
  %conv195 = trunc i32 %shr194 to i8
  %v3196 = getelementptr inbounds %struct.neon_s8* %vdest, i32 0, i32 2
  store i8 %conv195, i8* %v3196, align 1
  %v3197 = getelementptr inbounds %struct.neon_s8* %vdest, i32 0, i32 2
  %tmp198 = load i8* %v3197, align 1
  %inc199 = add i8 %tmp198, 1
  store i8 %inc199, i8* %v3197, align 1
  %v3200 = getelementptr inbounds %struct.neon_s8* %vdest, i32 0, i32 2
  %tmp201 = load i8* %v3200, align 1
  %conv202 = sext i8 %tmp201 to i32
  %shr203 = ashr i32 %conv202, 1
  %conv204 = trunc i32 %shr203 to i8
  store i8 %conv204, i8* %v3200, align 1
  br label %if.end235

if.else205:                                       ; preds = %if.else182
  %tmp206 = load i8* %tmp162, align 1
  %conv207 = sext i8 %tmp206 to i32
  %cmp208 = icmp slt i32 %conv207, 0
  br i1 %cmp208, label %if.then210, label %if.else225

if.then210:                                       ; preds = %if.else205
  %v3211 = getelementptr inbounds %struct.neon_s8* %vsrc1, i32 0, i32 2
  %tmp212 = load i8* %v3211, align 1
  %conv213 = sext i8 %tmp212 to i32
  %tmp214 = load i8* %tmp162, align 1
  %conv215 = sext i8 %tmp214 to i32
  %sub216 = sub nsw i32 -1, %conv215
  %shl217 = shl i32 1, %sub216
  %add218 = add nsw i32 %conv213, %shl217
  %tmp219 = load i8* %tmp162, align 1
  %conv220 = sext i8 %tmp219 to i32
  %sub221 = sub nsw i32 0, %conv220
  %shr222 = ashr i32 %add218, %sub221
  %conv223 = trunc i32 %shr222 to i8
  %v3224 = getelementptr inbounds %struct.neon_s8* %vdest, i32 0, i32 2
  store i8 %conv223, i8* %v3224, align 1
  br label %if.end234

if.else225:                                       ; preds = %if.else205
  %v3226 = getelementptr inbounds %struct.neon_s8* %vsrc1, i32 0, i32 2
  %tmp227 = load i8* %v3226, align 1
  %conv228 = sext i8 %tmp227 to i32
  %tmp229 = load i8* %tmp162, align 1
  %conv230 = sext i8 %tmp229 to i32
  %shl231 = shl i32 %conv228, %conv230
  %conv232 = trunc i32 %shl231 to i8
  %v3233 = getelementptr inbounds %struct.neon_s8* %vdest, i32 0, i32 2
  store i8 %conv232, i8* %v3233, align 1
  br label %if.end234

if.end234:                                        ; preds = %if.else225, %if.then210
  br label %if.end235

if.end235:                                        ; preds = %if.end234, %if.then187
  br label %if.end236

if.end236:                                        ; preds = %if.end235, %if.then175
  br label %if.end237

if.end237:                                        ; preds = %if.end236, %if.then168
  br label %do.end238

do.end238:                                        ; preds = %if.end237
  br label %do.body239

do.body239:                                       ; preds = %do.end238
  %v4 = getelementptr inbounds %struct.neon_s8* %vsrc2, i32 0, i32 3
  %tmp242 = load i8* %v4, align 1
  store i8 %tmp242, i8* %tmp241, align 1
  %tmp243 = load i8* %tmp241, align 1
  %conv244 = sext i8 %tmp243 to i32
  %cmp245 = icmp sge i32 %conv244, 8
  br i1 %cmp245, label %if.then247, label %if.else249

if.then247:                                       ; preds = %do.body239
  %v4248 = getelementptr inbounds %struct.neon_s8* %vdest, i32 0, i32 3
  store i8 0, i8* %v4248, align 1
  br label %if.end316

if.else249:                                       ; preds = %do.body239
  %tmp250 = load i8* %tmp241, align 1
  %conv251 = sext i8 %tmp250 to i32
  %cmp252 = icmp slt i32 %conv251, -8
  br i1 %cmp252, label %if.then254, label %if.else261

if.then254:                                       ; preds = %if.else249
  %v4255 = getelementptr inbounds %struct.neon_s8* %vsrc1, i32 0, i32 3
  %tmp256 = load i8* %v4255, align 1
  %conv257 = sext i8 %tmp256 to i32
  %shr258 = ashr i32 %conv257, 7
  %conv259 = trunc i32 %shr258 to i8
  %v4260 = getelementptr inbounds %struct.neon_s8* %vdest, i32 0, i32 3
  store i8 %conv259, i8* %v4260, align 1
  br label %if.end315

if.else261:                                       ; preds = %if.else249
  %tmp262 = load i8* %tmp241, align 1
  %conv263 = sext i8 %tmp262 to i32
  %cmp264 = icmp eq i32 %conv263, -8
  br i1 %cmp264, label %if.then266, label %if.else284

if.then266:                                       ; preds = %if.else261
  %v4267 = getelementptr inbounds %struct.neon_s8* %vsrc1, i32 0, i32 3
  %tmp268 = load i8* %v4267, align 1
  %conv269 = sext i8 %tmp268 to i32
  %tmp270 = load i8* %tmp241, align 1
  %conv271 = sext i8 %tmp270 to i32
  %sub272 = sub nsw i32 %conv271, 1
  %shr273 = ashr i32 %conv269, %sub272
  %conv274 = trunc i32 %shr273 to i8
  %v4275 = getelementptr inbounds %struct.neon_s8* %vdest, i32 0, i32 3
  store i8 %conv274, i8* %v4275, align 1
  %v4276 = getelementptr inbounds %struct.neon_s8* %vdest, i32 0, i32 3
  %tmp277 = load i8* %v4276, align 1
  %inc278 = add i8 %tmp277, 1
  store i8 %inc278, i8* %v4276, align 1
  %v4279 = getelementptr inbounds %struct.neon_s8* %vdest, i32 0, i32 3
  %tmp280 = load i8* %v4279, align 1
  %conv281 = sext i8 %tmp280 to i32
  %shr282 = ashr i32 %conv281, 1
  %conv283 = trunc i32 %shr282 to i8
  store i8 %conv283, i8* %v4279, align 1
  br label %if.end314

if.else284:                                       ; preds = %if.else261
  %tmp285 = load i8* %tmp241, align 1
  %conv286 = sext i8 %tmp285 to i32
  %cmp287 = icmp slt i32 %conv286, 0
  br i1 %cmp287, label %if.then289, label %if.else304

if.then289:                                       ; preds = %if.else284
  %v4290 = getelementptr inbounds %struct.neon_s8* %vsrc1, i32 0, i32 3
  %tmp291 = load i8* %v4290, align 1
  %conv292 = sext i8 %tmp291 to i32
  %tmp293 = load i8* %tmp241, align 1
  %conv294 = sext i8 %tmp293 to i32
  %sub295 = sub nsw i32 -1, %conv294
  %shl296 = shl i32 1, %sub295
  %add297 = add nsw i32 %conv292, %shl296
  %tmp298 = load i8* %tmp241, align 1
  %conv299 = sext i8 %tmp298 to i32
  %sub300 = sub nsw i32 0, %conv299
  %shr301 = ashr i32 %add297, %sub300
  %conv302 = trunc i32 %shr301 to i8
  %v4303 = getelementptr inbounds %struct.neon_s8* %vdest, i32 0, i32 3
  store i8 %conv302, i8* %v4303, align 1
  br label %if.end313

if.else304:                                       ; preds = %if.else284
  %v4305 = getelementptr inbounds %struct.neon_s8* %vsrc1, i32 0, i32 3
  %tmp306 = load i8* %v4305, align 1
  %conv307 = sext i8 %tmp306 to i32
  %tmp308 = load i8* %tmp241, align 1
  %conv309 = sext i8 %tmp308 to i32
  %shl310 = shl i32 %conv307, %conv309
  %conv311 = trunc i32 %shl310 to i8
  %v4312 = getelementptr inbounds %struct.neon_s8* %vdest, i32 0, i32 3
  store i8 %conv311, i8* %v4312, align 1
  br label %if.end313

if.end313:                                        ; preds = %if.else304, %if.then289
  br label %if.end314

if.end314:                                        ; preds = %if.end313, %if.then266
  br label %if.end315

if.end315:                                        ; preds = %if.end314, %if.then254
  br label %if.end316

if.end316:                                        ; preds = %if.end315, %if.then247
  br label %do.end317

do.end317:                                        ; preds = %if.end316
  br label %do.body318

do.body318:                                       ; preds = %do.end317
  %v321 = bitcast %union.anon* %conv_u320 to %struct.neon_s8*
  %tmp322 = bitcast %struct.neon_s8* %v321 to i8*
  %tmp323 = bitcast %struct.neon_s8* %vdest to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp322, i8* %tmp323, i64 4, i32 1, i1 false)
  %i324 = bitcast %union.anon* %conv_u320 to i32*
  %tmp325 = load i32* %i324, align 4
  store i32 %tmp325, i32* %res, align 4
  br label %do.end326

do.end326:                                        ; preds = %do.body318
  %tmp327 = load i32* %res, align 4
  ret i32 %tmp327
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %r = alloca i32, align 4
  store i32 0, i32* %retval
  %call = call i32 @helper_neon_rshl_s8(i32 84215045, i32 16843009)
  store i32 %call, i32* %r, align 4
  %tmp = load i32* %r, align 4
  %cmp = icmp ne i32 %tmp, 168430090
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn
  unreachable

if.end:                                           ; preds = %entry
  ret i32 0
}

declare void @abort() noreturn
