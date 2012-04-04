; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/pr42833.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.neon_s8 = type { i8, i8, i8, i8 }
%union.anon = type { i32 }
%union.anon.0 = type { i32 }
%union.anon.1 = type { i32 }

define i32 @helper_neon_rshl_s8(i32 %arg1, i32 %arg2) nounwind uwtable {
entry:
  %arg1.addr = alloca i32, align 4
  %arg2.addr = alloca i32, align 4
  %res = alloca i32, align 4
  %vsrc1 = alloca %struct.neon_s8, align 1
  %vsrc2 = alloca %struct.neon_s8, align 1
  %vdest = alloca %struct.neon_s8, align 1
  %conv_u = alloca %union.anon, align 4
  %conv_u2 = alloca %union.anon.0, align 4
  %tmp = alloca i8, align 1
  %tmp60 = alloca i8, align 1
  %tmp124 = alloca i8, align 1
  %tmp188 = alloca i8, align 1
  %conv_u253 = alloca %union.anon.1, align 4
  store i32 %arg1, i32* %arg1.addr, align 4
  store i32 %arg2, i32* %arg2.addr, align 4
  br label %do.body

do.body:                                          ; preds = %entry
  %0 = load i32* %arg1.addr, align 4
  %i = bitcast %union.anon* %conv_u to i32*
  store i32 %0, i32* %i, align 4
  %v = bitcast %union.anon* %conv_u to %struct.neon_s8*
  %1 = bitcast %struct.neon_s8* %vsrc1 to i8*
  %2 = bitcast %struct.neon_s8* %v to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %1, i8* %2, i64 4, i32 1, i1 false)
  br label %do.end

do.end:                                           ; preds = %do.body
  br label %do.body1

do.body1:                                         ; preds = %do.end
  %3 = load i32* %arg2.addr, align 4
  %i3 = bitcast %union.anon.0* %conv_u2 to i32*
  store i32 %3, i32* %i3, align 4
  %v4 = bitcast %union.anon.0* %conv_u2 to %struct.neon_s8*
  %4 = bitcast %struct.neon_s8* %vsrc2 to i8*
  %5 = bitcast %struct.neon_s8* %v4 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %4, i8* %5, i64 4, i32 1, i1 false)
  br label %do.end5

do.end5:                                          ; preds = %do.body1
  br label %do.body6

do.body6:                                         ; preds = %do.end5
  %v1 = getelementptr inbounds %struct.neon_s8* %vsrc2, i32 0, i32 0
  %6 = load i8* %v1, align 1
  store i8 %6, i8* %tmp, align 1
  %7 = load i8* %tmp, align 1
  %conv = sext i8 %7 to i32
  %cmp = icmp sge i32 %conv, 8
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %do.body6
  %v18 = getelementptr inbounds %struct.neon_s8* %vdest, i32 0, i32 0
  store i8 0, i8* %v18, align 1
  br label %if.end56

if.else:                                          ; preds = %do.body6
  %8 = load i8* %tmp, align 1
  %conv9 = sext i8 %8 to i32
  %cmp10 = icmp slt i32 %conv9, -8
  br i1 %cmp10, label %if.then12, label %if.else17

if.then12:                                        ; preds = %if.else
  %v113 = getelementptr inbounds %struct.neon_s8* %vsrc1, i32 0, i32 0
  %9 = load i8* %v113, align 1
  %conv14 = sext i8 %9 to i32
  %shr = ashr i32 %conv14, 7
  %conv15 = trunc i32 %shr to i8
  %v116 = getelementptr inbounds %struct.neon_s8* %vdest, i32 0, i32 0
  store i8 %conv15, i8* %v116, align 1
  br label %if.end55

if.else17:                                        ; preds = %if.else
  %10 = load i8* %tmp, align 1
  %conv18 = sext i8 %10 to i32
  %cmp19 = icmp eq i32 %conv18, -8
  br i1 %cmp19, label %if.then21, label %if.else33

if.then21:                                        ; preds = %if.else17
  %v122 = getelementptr inbounds %struct.neon_s8* %vsrc1, i32 0, i32 0
  %11 = load i8* %v122, align 1
  %conv23 = sext i8 %11 to i32
  %12 = load i8* %tmp, align 1
  %conv24 = sext i8 %12 to i32
  %sub = sub nsw i32 %conv24, 1
  %shr25 = ashr i32 %conv23, %sub
  %conv26 = trunc i32 %shr25 to i8
  %v127 = getelementptr inbounds %struct.neon_s8* %vdest, i32 0, i32 0
  store i8 %conv26, i8* %v127, align 1
  %v128 = getelementptr inbounds %struct.neon_s8* %vdest, i32 0, i32 0
  %13 = load i8* %v128, align 1
  %inc = add i8 %13, 1
  store i8 %inc, i8* %v128, align 1
  %v129 = getelementptr inbounds %struct.neon_s8* %vdest, i32 0, i32 0
  %14 = load i8* %v129, align 1
  %conv30 = sext i8 %14 to i32
  %shr31 = ashr i32 %conv30, 1
  %conv32 = trunc i32 %shr31 to i8
  store i8 %conv32, i8* %v129, align 1
  br label %if.end54

if.else33:                                        ; preds = %if.else17
  %15 = load i8* %tmp, align 1
  %conv34 = sext i8 %15 to i32
  %cmp35 = icmp slt i32 %conv34, 0
  br i1 %cmp35, label %if.then37, label %if.else47

if.then37:                                        ; preds = %if.else33
  %v138 = getelementptr inbounds %struct.neon_s8* %vsrc1, i32 0, i32 0
  %16 = load i8* %v138, align 1
  %conv39 = sext i8 %16 to i32
  %17 = load i8* %tmp, align 1
  %conv40 = sext i8 %17 to i32
  %sub41 = sub nsw i32 -1, %conv40
  %shl = shl i32 1, %sub41
  %add = add nsw i32 %conv39, %shl
  %18 = load i8* %tmp, align 1
  %conv42 = sext i8 %18 to i32
  %sub43 = sub nsw i32 0, %conv42
  %shr44 = ashr i32 %add, %sub43
  %conv45 = trunc i32 %shr44 to i8
  %v146 = getelementptr inbounds %struct.neon_s8* %vdest, i32 0, i32 0
  store i8 %conv45, i8* %v146, align 1
  br label %if.end

if.else47:                                        ; preds = %if.else33
  %v148 = getelementptr inbounds %struct.neon_s8* %vsrc1, i32 0, i32 0
  %19 = load i8* %v148, align 1
  %conv49 = sext i8 %19 to i32
  %20 = load i8* %tmp, align 1
  %conv50 = sext i8 %20 to i32
  %shl51 = shl i32 %conv49, %conv50
  %conv52 = trunc i32 %shl51 to i8
  %v153 = getelementptr inbounds %struct.neon_s8* %vdest, i32 0, i32 0
  store i8 %conv52, i8* %v153, align 1
  br label %if.end

if.end:                                           ; preds = %if.else47, %if.then37
  br label %if.end54

if.end54:                                         ; preds = %if.end, %if.then21
  br label %if.end55

if.end55:                                         ; preds = %if.end54, %if.then12
  br label %if.end56

if.end56:                                         ; preds = %if.end55, %if.then
  br label %do.end57

do.end57:                                         ; preds = %if.end56
  br label %do.body58

do.body58:                                        ; preds = %do.end57
  %v2 = getelementptr inbounds %struct.neon_s8* %vsrc2, i32 0, i32 1
  %21 = load i8* %v2, align 1
  store i8 %21, i8* %tmp60, align 1
  %22 = load i8* %tmp60, align 1
  %conv61 = sext i8 %22 to i32
  %cmp62 = icmp sge i32 %conv61, 8
  br i1 %cmp62, label %if.then64, label %if.else66

if.then64:                                        ; preds = %do.body58
  %v265 = getelementptr inbounds %struct.neon_s8* %vdest, i32 0, i32 1
  store i8 0, i8* %v265, align 1
  br label %if.end120

if.else66:                                        ; preds = %do.body58
  %23 = load i8* %tmp60, align 1
  %conv67 = sext i8 %23 to i32
  %cmp68 = icmp slt i32 %conv67, -8
  br i1 %cmp68, label %if.then70, label %if.else76

if.then70:                                        ; preds = %if.else66
  %v271 = getelementptr inbounds %struct.neon_s8* %vsrc1, i32 0, i32 1
  %24 = load i8* %v271, align 1
  %conv72 = sext i8 %24 to i32
  %shr73 = ashr i32 %conv72, 7
  %conv74 = trunc i32 %shr73 to i8
  %v275 = getelementptr inbounds %struct.neon_s8* %vdest, i32 0, i32 1
  store i8 %conv74, i8* %v275, align 1
  br label %if.end119

if.else76:                                        ; preds = %if.else66
  %25 = load i8* %tmp60, align 1
  %conv77 = sext i8 %25 to i32
  %cmp78 = icmp eq i32 %conv77, -8
  br i1 %cmp78, label %if.then80, label %if.else94

if.then80:                                        ; preds = %if.else76
  %v281 = getelementptr inbounds %struct.neon_s8* %vsrc1, i32 0, i32 1
  %26 = load i8* %v281, align 1
  %conv82 = sext i8 %26 to i32
  %27 = load i8* %tmp60, align 1
  %conv83 = sext i8 %27 to i32
  %sub84 = sub nsw i32 %conv83, 1
  %shr85 = ashr i32 %conv82, %sub84
  %conv86 = trunc i32 %shr85 to i8
  %v287 = getelementptr inbounds %struct.neon_s8* %vdest, i32 0, i32 1
  store i8 %conv86, i8* %v287, align 1
  %v288 = getelementptr inbounds %struct.neon_s8* %vdest, i32 0, i32 1
  %28 = load i8* %v288, align 1
  %inc89 = add i8 %28, 1
  store i8 %inc89, i8* %v288, align 1
  %v290 = getelementptr inbounds %struct.neon_s8* %vdest, i32 0, i32 1
  %29 = load i8* %v290, align 1
  %conv91 = sext i8 %29 to i32
  %shr92 = ashr i32 %conv91, 1
  %conv93 = trunc i32 %shr92 to i8
  store i8 %conv93, i8* %v290, align 1
  br label %if.end118

if.else94:                                        ; preds = %if.else76
  %30 = load i8* %tmp60, align 1
  %conv95 = sext i8 %30 to i32
  %cmp96 = icmp slt i32 %conv95, 0
  br i1 %cmp96, label %if.then98, label %if.else110

if.then98:                                        ; preds = %if.else94
  %v299 = getelementptr inbounds %struct.neon_s8* %vsrc1, i32 0, i32 1
  %31 = load i8* %v299, align 1
  %conv100 = sext i8 %31 to i32
  %32 = load i8* %tmp60, align 1
  %conv101 = sext i8 %32 to i32
  %sub102 = sub nsw i32 -1, %conv101
  %shl103 = shl i32 1, %sub102
  %add104 = add nsw i32 %conv100, %shl103
  %33 = load i8* %tmp60, align 1
  %conv105 = sext i8 %33 to i32
  %sub106 = sub nsw i32 0, %conv105
  %shr107 = ashr i32 %add104, %sub106
  %conv108 = trunc i32 %shr107 to i8
  %v2109 = getelementptr inbounds %struct.neon_s8* %vdest, i32 0, i32 1
  store i8 %conv108, i8* %v2109, align 1
  br label %if.end117

if.else110:                                       ; preds = %if.else94
  %v2111 = getelementptr inbounds %struct.neon_s8* %vsrc1, i32 0, i32 1
  %34 = load i8* %v2111, align 1
  %conv112 = sext i8 %34 to i32
  %35 = load i8* %tmp60, align 1
  %conv113 = sext i8 %35 to i32
  %shl114 = shl i32 %conv112, %conv113
  %conv115 = trunc i32 %shl114 to i8
  %v2116 = getelementptr inbounds %struct.neon_s8* %vdest, i32 0, i32 1
  store i8 %conv115, i8* %v2116, align 1
  br label %if.end117

if.end117:                                        ; preds = %if.else110, %if.then98
  br label %if.end118

if.end118:                                        ; preds = %if.end117, %if.then80
  br label %if.end119

if.end119:                                        ; preds = %if.end118, %if.then70
  br label %if.end120

if.end120:                                        ; preds = %if.end119, %if.then64
  br label %do.end121

do.end121:                                        ; preds = %if.end120
  br label %do.body122

do.body122:                                       ; preds = %do.end121
  %v3 = getelementptr inbounds %struct.neon_s8* %vsrc2, i32 0, i32 2
  %36 = load i8* %v3, align 1
  store i8 %36, i8* %tmp124, align 1
  %37 = load i8* %tmp124, align 1
  %conv125 = sext i8 %37 to i32
  %cmp126 = icmp sge i32 %conv125, 8
  br i1 %cmp126, label %if.then128, label %if.else130

if.then128:                                       ; preds = %do.body122
  %v3129 = getelementptr inbounds %struct.neon_s8* %vdest, i32 0, i32 2
  store i8 0, i8* %v3129, align 1
  br label %if.end184

if.else130:                                       ; preds = %do.body122
  %38 = load i8* %tmp124, align 1
  %conv131 = sext i8 %38 to i32
  %cmp132 = icmp slt i32 %conv131, -8
  br i1 %cmp132, label %if.then134, label %if.else140

if.then134:                                       ; preds = %if.else130
  %v3135 = getelementptr inbounds %struct.neon_s8* %vsrc1, i32 0, i32 2
  %39 = load i8* %v3135, align 1
  %conv136 = sext i8 %39 to i32
  %shr137 = ashr i32 %conv136, 7
  %conv138 = trunc i32 %shr137 to i8
  %v3139 = getelementptr inbounds %struct.neon_s8* %vdest, i32 0, i32 2
  store i8 %conv138, i8* %v3139, align 1
  br label %if.end183

if.else140:                                       ; preds = %if.else130
  %40 = load i8* %tmp124, align 1
  %conv141 = sext i8 %40 to i32
  %cmp142 = icmp eq i32 %conv141, -8
  br i1 %cmp142, label %if.then144, label %if.else158

if.then144:                                       ; preds = %if.else140
  %v3145 = getelementptr inbounds %struct.neon_s8* %vsrc1, i32 0, i32 2
  %41 = load i8* %v3145, align 1
  %conv146 = sext i8 %41 to i32
  %42 = load i8* %tmp124, align 1
  %conv147 = sext i8 %42 to i32
  %sub148 = sub nsw i32 %conv147, 1
  %shr149 = ashr i32 %conv146, %sub148
  %conv150 = trunc i32 %shr149 to i8
  %v3151 = getelementptr inbounds %struct.neon_s8* %vdest, i32 0, i32 2
  store i8 %conv150, i8* %v3151, align 1
  %v3152 = getelementptr inbounds %struct.neon_s8* %vdest, i32 0, i32 2
  %43 = load i8* %v3152, align 1
  %inc153 = add i8 %43, 1
  store i8 %inc153, i8* %v3152, align 1
  %v3154 = getelementptr inbounds %struct.neon_s8* %vdest, i32 0, i32 2
  %44 = load i8* %v3154, align 1
  %conv155 = sext i8 %44 to i32
  %shr156 = ashr i32 %conv155, 1
  %conv157 = trunc i32 %shr156 to i8
  store i8 %conv157, i8* %v3154, align 1
  br label %if.end182

if.else158:                                       ; preds = %if.else140
  %45 = load i8* %tmp124, align 1
  %conv159 = sext i8 %45 to i32
  %cmp160 = icmp slt i32 %conv159, 0
  br i1 %cmp160, label %if.then162, label %if.else174

if.then162:                                       ; preds = %if.else158
  %v3163 = getelementptr inbounds %struct.neon_s8* %vsrc1, i32 0, i32 2
  %46 = load i8* %v3163, align 1
  %conv164 = sext i8 %46 to i32
  %47 = load i8* %tmp124, align 1
  %conv165 = sext i8 %47 to i32
  %sub166 = sub nsw i32 -1, %conv165
  %shl167 = shl i32 1, %sub166
  %add168 = add nsw i32 %conv164, %shl167
  %48 = load i8* %tmp124, align 1
  %conv169 = sext i8 %48 to i32
  %sub170 = sub nsw i32 0, %conv169
  %shr171 = ashr i32 %add168, %sub170
  %conv172 = trunc i32 %shr171 to i8
  %v3173 = getelementptr inbounds %struct.neon_s8* %vdest, i32 0, i32 2
  store i8 %conv172, i8* %v3173, align 1
  br label %if.end181

if.else174:                                       ; preds = %if.else158
  %v3175 = getelementptr inbounds %struct.neon_s8* %vsrc1, i32 0, i32 2
  %49 = load i8* %v3175, align 1
  %conv176 = sext i8 %49 to i32
  %50 = load i8* %tmp124, align 1
  %conv177 = sext i8 %50 to i32
  %shl178 = shl i32 %conv176, %conv177
  %conv179 = trunc i32 %shl178 to i8
  %v3180 = getelementptr inbounds %struct.neon_s8* %vdest, i32 0, i32 2
  store i8 %conv179, i8* %v3180, align 1
  br label %if.end181

if.end181:                                        ; preds = %if.else174, %if.then162
  br label %if.end182

if.end182:                                        ; preds = %if.end181, %if.then144
  br label %if.end183

if.end183:                                        ; preds = %if.end182, %if.then134
  br label %if.end184

if.end184:                                        ; preds = %if.end183, %if.then128
  br label %do.end185

do.end185:                                        ; preds = %if.end184
  br label %do.body186

do.body186:                                       ; preds = %do.end185
  %v4189 = getelementptr inbounds %struct.neon_s8* %vsrc2, i32 0, i32 3
  %51 = load i8* %v4189, align 1
  store i8 %51, i8* %tmp188, align 1
  %52 = load i8* %tmp188, align 1
  %conv190 = sext i8 %52 to i32
  %cmp191 = icmp sge i32 %conv190, 8
  br i1 %cmp191, label %if.then193, label %if.else195

if.then193:                                       ; preds = %do.body186
  %v4194 = getelementptr inbounds %struct.neon_s8* %vdest, i32 0, i32 3
  store i8 0, i8* %v4194, align 1
  br label %if.end249

if.else195:                                       ; preds = %do.body186
  %53 = load i8* %tmp188, align 1
  %conv196 = sext i8 %53 to i32
  %cmp197 = icmp slt i32 %conv196, -8
  br i1 %cmp197, label %if.then199, label %if.else205

if.then199:                                       ; preds = %if.else195
  %v4200 = getelementptr inbounds %struct.neon_s8* %vsrc1, i32 0, i32 3
  %54 = load i8* %v4200, align 1
  %conv201 = sext i8 %54 to i32
  %shr202 = ashr i32 %conv201, 7
  %conv203 = trunc i32 %shr202 to i8
  %v4204 = getelementptr inbounds %struct.neon_s8* %vdest, i32 0, i32 3
  store i8 %conv203, i8* %v4204, align 1
  br label %if.end248

if.else205:                                       ; preds = %if.else195
  %55 = load i8* %tmp188, align 1
  %conv206 = sext i8 %55 to i32
  %cmp207 = icmp eq i32 %conv206, -8
  br i1 %cmp207, label %if.then209, label %if.else223

if.then209:                                       ; preds = %if.else205
  %v4210 = getelementptr inbounds %struct.neon_s8* %vsrc1, i32 0, i32 3
  %56 = load i8* %v4210, align 1
  %conv211 = sext i8 %56 to i32
  %57 = load i8* %tmp188, align 1
  %conv212 = sext i8 %57 to i32
  %sub213 = sub nsw i32 %conv212, 1
  %shr214 = ashr i32 %conv211, %sub213
  %conv215 = trunc i32 %shr214 to i8
  %v4216 = getelementptr inbounds %struct.neon_s8* %vdest, i32 0, i32 3
  store i8 %conv215, i8* %v4216, align 1
  %v4217 = getelementptr inbounds %struct.neon_s8* %vdest, i32 0, i32 3
  %58 = load i8* %v4217, align 1
  %inc218 = add i8 %58, 1
  store i8 %inc218, i8* %v4217, align 1
  %v4219 = getelementptr inbounds %struct.neon_s8* %vdest, i32 0, i32 3
  %59 = load i8* %v4219, align 1
  %conv220 = sext i8 %59 to i32
  %shr221 = ashr i32 %conv220, 1
  %conv222 = trunc i32 %shr221 to i8
  store i8 %conv222, i8* %v4219, align 1
  br label %if.end247

if.else223:                                       ; preds = %if.else205
  %60 = load i8* %tmp188, align 1
  %conv224 = sext i8 %60 to i32
  %cmp225 = icmp slt i32 %conv224, 0
  br i1 %cmp225, label %if.then227, label %if.else239

if.then227:                                       ; preds = %if.else223
  %v4228 = getelementptr inbounds %struct.neon_s8* %vsrc1, i32 0, i32 3
  %61 = load i8* %v4228, align 1
  %conv229 = sext i8 %61 to i32
  %62 = load i8* %tmp188, align 1
  %conv230 = sext i8 %62 to i32
  %sub231 = sub nsw i32 -1, %conv230
  %shl232 = shl i32 1, %sub231
  %add233 = add nsw i32 %conv229, %shl232
  %63 = load i8* %tmp188, align 1
  %conv234 = sext i8 %63 to i32
  %sub235 = sub nsw i32 0, %conv234
  %shr236 = ashr i32 %add233, %sub235
  %conv237 = trunc i32 %shr236 to i8
  %v4238 = getelementptr inbounds %struct.neon_s8* %vdest, i32 0, i32 3
  store i8 %conv237, i8* %v4238, align 1
  br label %if.end246

if.else239:                                       ; preds = %if.else223
  %v4240 = getelementptr inbounds %struct.neon_s8* %vsrc1, i32 0, i32 3
  %64 = load i8* %v4240, align 1
  %conv241 = sext i8 %64 to i32
  %65 = load i8* %tmp188, align 1
  %conv242 = sext i8 %65 to i32
  %shl243 = shl i32 %conv241, %conv242
  %conv244 = trunc i32 %shl243 to i8
  %v4245 = getelementptr inbounds %struct.neon_s8* %vdest, i32 0, i32 3
  store i8 %conv244, i8* %v4245, align 1
  br label %if.end246

if.end246:                                        ; preds = %if.else239, %if.then227
  br label %if.end247

if.end247:                                        ; preds = %if.end246, %if.then209
  br label %if.end248

if.end248:                                        ; preds = %if.end247, %if.then199
  br label %if.end249

if.end249:                                        ; preds = %if.end248, %if.then193
  br label %do.end250

do.end250:                                        ; preds = %if.end249
  br label %do.body251

do.body251:                                       ; preds = %do.end250
  %v254 = bitcast %union.anon.1* %conv_u253 to %struct.neon_s8*
  %66 = bitcast %struct.neon_s8* %v254 to i8*
  %67 = bitcast %struct.neon_s8* %vdest to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %66, i8* %67, i64 4, i32 1, i1 false)
  %i255 = bitcast %union.anon.1* %conv_u253 to i32*
  %68 = load i32* %i255, align 4
  store i32 %68, i32* %res, align 4
  br label %do.end256

do.end256:                                        ; preds = %do.body251
  %69 = load i32* %res, align 4
  ret i32 %69
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %r = alloca i32, align 4
  store i32 0, i32* %retval
  %call = call i32 @helper_neon_rshl_s8(i32 84215045, i32 16843009)
  store i32 %call, i32* %r, align 4
  %0 = load i32* %r, align 4
  %cmp = icmp ne i32 %0, 168430090
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn
  unreachable

if.end:                                           ; preds = %entry
  ret i32 0
}

declare void @abort() noreturn
