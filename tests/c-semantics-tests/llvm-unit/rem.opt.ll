; ModuleID = '/home/david/src/c-semantics/tests/llvm-unit/rem.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [37 x i8] c"Test #%u, failed in iteration #: %u\0A\00", align 1
@.str2 = private unnamed_addr constant [54 x i8] c"m=%u, x_u=%u, y_u=%u, z_u=%u, x_s=%d, y_s=%d, z_s=%d\0A\00", align 1
@str29 = private unnamed_addr constant [21 x i8] c"Failing test vector:\00"
@str30 = private unnamed_addr constant [25 x i8] c"\0A *** REM test done! ***\00"

define i64 @gcd(i64 %a, i64 %b) nounwind uwtable readnone {
entry:
  br label %while.body

while.body:                                       ; preds = %while.body, %entry
  %b.addr.0 = phi i64 [ %b, %entry ], [ %rem, %while.body ]
  %a.addr.0 = phi i64 [ %a, %entry ], [ %b.addr.0, %while.body ]
  %rem = srem i64 %a.addr.0, %b.addr.0
  %cmp = icmp eq i64 %rem, 0
  br i1 %cmp, label %if.then, label %while.body

if.then:                                          ; preds = %while.body
  ret i64 %b.addr.0
}

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable {
entry:
  br label %for.body

for.body:                                         ; preds = %for.body, %entry
  %call = tail call i32 @rand() nounwind
  %cmp1 = icmp eq i32 %call, 0
  br i1 %cmp1, label %for.body, label %if.end

if.end:                                           ; preds = %for.body
  %call2 = tail call i32 @rand() nounwind
  %call3 = tail call i32 @rand() nounwind
  %call4 = tail call i32 @rand() nounwind
  %call5 = tail call i32 @rand() nounwind
  %rem894 = and i32 %call5, 1
  %tobool = icmp ne i32 %rem894, 0
  %call6 = tail call i32 @rand() nounwind
  %sub = sub nsw i32 0, %call6
  %cond = select i1 %tobool, i32 %call6, i32 %sub
  %call8 = tail call i32 @rand() nounwind
  %rem9895 = and i32 %call8, 1
  %tobool10 = icmp ne i32 %rem9895, 0
  %call12 = tail call i32 @rand() nounwind
  %sub15 = sub nsw i32 0, %call12
  %cond17 = select i1 %tobool10, i32 %call12, i32 %sub15
  %call18 = tail call i32 @rand() nounwind
  %rem19896 = and i32 %call18, 1
  %tobool20 = icmp ne i32 %rem19896, 0
  %call22 = tail call i32 @rand() nounwind
  %sub25 = sub nsw i32 0, %call22
  %cond27 = select i1 %tobool20, i32 %call22, i32 %sub25
  %rem67.pre-phi = urem i32 %call2, %call
  %rem68 = urem i32 %call3, %call
  %uadd = tail call { i32, i1 } @llvm.uadd.with.overflow.i32(i32 %rem67.pre-phi, i32 %rem68)
  %0 = extractvalue { i32, i1 } %uadd, 0
  %cmp70 = extractvalue { i32, i1 } %uadd, 1
  br i1 %cmp70, label %if.end86, label %lor.lhs.false71

lor.lhs.false71:                                  ; preds = %if.end
  %uadd897 = tail call { i32, i1 } @llvm.uadd.with.overflow.i32(i32 %call2, i32 %call3)
  %cmp73 = extractvalue { i32, i1 } %uadd897, 1
  br i1 %cmp73, label %if.end86, label %lor.lhs.false74

lor.lhs.false74:                                  ; preds = %lor.lhs.false71
  %1 = extractvalue { i32, i1 } %uadd897, 0
  %rem78 = urem i32 %0, %call
  %rem80 = urem i32 %1, %call
  %cmp81 = icmp eq i32 %rem78, %rem80
  br i1 %cmp81, label %if.end86, label %if.then82

if.then82:                                        ; preds = %lor.lhs.false74
  %call83 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([37 x i8]* @.str, i64 0, i64 0), i32 5, i32 0) nounwind
  %puts1222 = tail call i32 @puts(i8* getelementptr inbounds ([21 x i8]* @str29, i64 0, i64 0))
  %call85 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([54 x i8]* @.str2, i64 0, i64 0), i32 %call, i32 %call2, i32 %call3, i32 %call4, i32 %cond, i32 %cond17, i32 %cond27) nounwind
  br label %return

if.end86:                                         ; preds = %lor.lhs.false74, %lor.lhs.false71, %if.end
  %uadd898 = tail call { i32, i1 } @llvm.uadd.with.overflow.i32(i32 %call3, i32 %call4)
  %2 = extractvalue { i32, i1 } %uadd898, 0
  %cmp88 = extractvalue { i32, i1 } %uadd898, 1
  br i1 %cmp88, label %if.end109, label %lor.lhs.false89

lor.lhs.false89:                                  ; preds = %if.end86
  %sub90 = sub i32 %call2, %call4
  %cmp91 = icmp ugt i32 %sub90, %call2
  br i1 %cmp91, label %if.end109, label %lor.lhs.false92

lor.lhs.false92:                                  ; preds = %lor.lhs.false89
  %rem95 = urem i32 %2, %call
  %cmp96 = icmp eq i32 %rem67.pre-phi, %rem95
  %conv = zext i1 %cmp96 to i32
  %rem97 = urem i32 %conv, %call
  %rem99 = urem i32 %sub90, %call
  %cmp101 = icmp eq i32 %rem99, %rem68
  %conv102 = zext i1 %cmp101 to i32
  %cmp103 = icmp eq i32 %rem97, %conv102
  br i1 %cmp103, label %if.end109, label %if.then105

if.then105:                                       ; preds = %lor.lhs.false92
  %call106 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([37 x i8]* @.str, i64 0, i64 0), i32 6, i32 0) nounwind
  %puts1223 = tail call i32 @puts(i8* getelementptr inbounds ([21 x i8]* @str29, i64 0, i64 0))
  %call108 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([54 x i8]* @.str2, i64 0, i64 0), i32 %call, i32 %call2, i32 %call3, i32 %call4, i32 %cond, i32 %cond17, i32 %cond27) nounwind
  br label %return

if.end109:                                        ; preds = %lor.lhs.false92, %lor.lhs.false89, %if.end86
  %mul = mul i32 %call3, %call
  %div = udiv i32 %mul, %call
  %cmp110 = icmp eq i32 %div, %call3
  br i1 %cmp110, label %lor.lhs.false112, label %if.end128

lor.lhs.false112:                                 ; preds = %if.end109
  %uadd899 = tail call { i32, i1 } @llvm.uadd.with.overflow.i32(i32 %call2, i32 %mul)
  %cmp115 = extractvalue { i32, i1 } %uadd899, 1
  br i1 %cmp115, label %if.end128, label %lor.lhs.false117

lor.lhs.false117:                                 ; preds = %lor.lhs.false112
  %3 = extractvalue { i32, i1 } %uadd899, 0
  %rem121 = urem i32 %3, %call
  %cmp122 = icmp eq i32 %rem67.pre-phi, %rem121
  br i1 %cmp122, label %if.end128, label %if.then124

if.then124:                                       ; preds = %lor.lhs.false117
  %call125 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([37 x i8]* @.str, i64 0, i64 0), i32 7, i32 0) nounwind
  %puts1224 = tail call i32 @puts(i8* getelementptr inbounds ([21 x i8]* @str29, i64 0, i64 0))
  %call127 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([54 x i8]* @.str2, i64 0, i64 0), i32 %call, i32 %call2, i32 %call3, i32 %call4, i32 %cond, i32 %cond17, i32 %cond27) nounwind
  br label %return

if.end128:                                        ; preds = %if.end109, %lor.lhs.false117, %lor.lhs.false112
  %conv129 = sext i32 %cond27 to i64
  %conv130 = zext i32 %call to i64
  br label %while.body.i

while.body.i:                                     ; preds = %while.body.i, %if.end128
  %b.addr.0.i = phi i64 [ %conv130, %if.end128 ], [ %rem.i, %while.body.i ]
  %a.addr.0.i = phi i64 [ %conv129, %if.end128 ], [ %b.addr.0.i, %while.body.i ]
  %rem.i = srem i64 %a.addr.0.i, %b.addr.0.i
  %cmp.i = icmp eq i64 %rem.i, 0
  br i1 %cmp.i, label %gcd.exit, label %while.body.i

gcd.exit:                                         ; preds = %while.body.i
  %cmp132 = icmp ne i64 %b.addr.0.i, 1
  %cmp135 = icmp eq i32 %cond27, 0
  %or.cond = or i1 %cmp132, %cmp135
  br i1 %or.cond, label %if.end168, label %lor.lhs.false137

lor.lhs.false137:                                 ; preds = %gcd.exit
  %conv138 = sext i32 %cond to i64
  br label %while.body.i1217

while.body.i1217:                                 ; preds = %while.body.i1217, %lor.lhs.false137
  %b.addr.0.i1213 = phi i64 [ %conv129, %lor.lhs.false137 ], [ %rem.i1215, %while.body.i1217 ]
  %a.addr.0.i1214 = phi i64 [ %conv138, %lor.lhs.false137 ], [ %b.addr.0.i1213, %while.body.i1217 ]
  %rem.i1215 = srem i64 %a.addr.0.i1214, %b.addr.0.i1213
  %cmp.i1216 = icmp eq i64 %rem.i1215, 0
  br i1 %cmp.i1216, label %gcd.exit1218, label %while.body.i1217

gcd.exit1218:                                     ; preds = %while.body.i1217
  %cmp142 = icmp eq i64 %b.addr.0.i1213, %conv129
  br i1 %cmp142, label %lor.lhs.false144, label %if.end168

lor.lhs.false144:                                 ; preds = %gcd.exit1218
  %conv145 = sext i32 %cond17 to i64
  br label %while.body.i1211

while.body.i1211:                                 ; preds = %while.body.i1211, %lor.lhs.false144
  %b.addr.0.i1207 = phi i64 [ %conv129, %lor.lhs.false144 ], [ %rem.i1209, %while.body.i1211 ]
  %a.addr.0.i1208 = phi i64 [ %conv145, %lor.lhs.false144 ], [ %b.addr.0.i1207, %while.body.i1211 ]
  %rem.i1209 = srem i64 %a.addr.0.i1208, %b.addr.0.i1207
  %cmp.i1210 = icmp eq i64 %rem.i1209, 0
  br i1 %cmp.i1210, label %gcd.exit1212, label %while.body.i1211

gcd.exit1212:                                     ; preds = %while.body.i1211
  %cmp149 = icmp eq i64 %b.addr.0.i1207, %conv129
  br i1 %cmp149, label %lor.lhs.false151, label %if.end168

lor.lhs.false151:                                 ; preds = %gcd.exit1212
  %rem152 = urem i32 %cond, %call
  %rem153 = urem i32 %cond17, %call
  %cmp154 = icmp eq i32 %rem152, %rem153
  %div156 = sdiv i32 %cond, %cond27
  %rem157 = urem i32 %div156, %call
  %div158 = sdiv i32 %cond17, %cond27
  %rem159 = urem i32 %div158, %call
  %cmp160 = icmp eq i32 %rem157, %rem159
  %cmp162tmp = xor i1 %cmp154, %cmp160
  br i1 %cmp162tmp, label %if.then164, label %if.end168

if.then164:                                       ; preds = %lor.lhs.false151
  %call165 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([37 x i8]* @.str, i64 0, i64 0), i32 8, i32 0) nounwind
  %puts1225 = tail call i32 @puts(i8* getelementptr inbounds ([21 x i8]* @str29, i64 0, i64 0))
  %call167 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([54 x i8]* @.str2, i64 0, i64 0), i32 %call, i32 %call2, i32 %call3, i32 %call4, i32 %cond, i32 %cond17, i32 %cond27) nounwind
  br label %return

if.end168:                                        ; preds = %gcd.exit, %lor.lhs.false151, %gcd.exit1212, %gcd.exit1218
  %conv169 = zext i32 %call4 to i64
  br label %while.body.i1205

while.body.i1205:                                 ; preds = %while.body.i1205, %if.end168
  %b.addr.0.i1201 = phi i64 [ %conv130, %if.end168 ], [ %rem.i1203, %while.body.i1205 ]
  %a.addr.0.i1202 = phi i64 [ %conv169, %if.end168 ], [ %b.addr.0.i1201, %while.body.i1205 ]
  %rem.i1203 = srem i64 %a.addr.0.i1202, %b.addr.0.i1201
  %cmp.i1204 = icmp eq i64 %rem.i1203, 0
  br i1 %cmp.i1204, label %gcd.exit1206, label %while.body.i1205

gcd.exit1206:                                     ; preds = %while.body.i1205
  %cmp172 = icmp ne i64 %b.addr.0.i1201, 1
  %cmp175 = icmp eq i32 %call4, 0
  %or.cond900 = or i1 %cmp172, %cmp175
  br i1 %or.cond900, label %while.body.i1187, label %lor.lhs.false177

lor.lhs.false177:                                 ; preds = %gcd.exit1206
  %conv178 = sext i32 %cond to i64
  br label %while.body.i1199

while.body.i1199:                                 ; preds = %while.body.i1199, %lor.lhs.false177
  %b.addr.0.i1195 = phi i64 [ %conv169, %lor.lhs.false177 ], [ %rem.i1197, %while.body.i1199 ]
  %a.addr.0.i1196 = phi i64 [ %conv178, %lor.lhs.false177 ], [ %b.addr.0.i1195, %while.body.i1199 ]
  %rem.i1197 = srem i64 %a.addr.0.i1196, %b.addr.0.i1195
  %cmp.i1198 = icmp eq i64 %rem.i1197, 0
  br i1 %cmp.i1198, label %gcd.exit1200, label %while.body.i1199

gcd.exit1200:                                     ; preds = %while.body.i1199
  %cmp182 = icmp eq i64 %b.addr.0.i1195, %conv169
  br i1 %cmp182, label %lor.lhs.false184, label %while.body.i1187

lor.lhs.false184:                                 ; preds = %gcd.exit1200
  %conv185 = sext i32 %cond17 to i64
  br label %while.body.i1193

while.body.i1193:                                 ; preds = %while.body.i1193, %lor.lhs.false184
  %b.addr.0.i1189 = phi i64 [ %conv169, %lor.lhs.false184 ], [ %rem.i1191, %while.body.i1193 ]
  %a.addr.0.i1190 = phi i64 [ %conv185, %lor.lhs.false184 ], [ %b.addr.0.i1189, %while.body.i1193 ]
  %rem.i1191 = srem i64 %a.addr.0.i1190, %b.addr.0.i1189
  %cmp.i1192 = icmp eq i64 %rem.i1191, 0
  br i1 %cmp.i1192, label %gcd.exit1194, label %while.body.i1193

gcd.exit1194:                                     ; preds = %while.body.i1193
  %cmp189 = icmp eq i64 %b.addr.0.i1189, %conv169
  br i1 %cmp189, label %lor.lhs.false191, label %while.body.i1187

lor.lhs.false191:                                 ; preds = %gcd.exit1194
  %rem192 = urem i32 %cond, %call
  %rem193 = urem i32 %cond17, %call
  %cmp194 = icmp eq i32 %rem192, %rem193
  %div196 = udiv i32 %cond, %call4
  %rem197 = urem i32 %div196, %call
  %div198 = udiv i32 %cond17, %call4
  %rem199 = urem i32 %div198, %call
  %cmp200 = icmp eq i32 %rem197, %rem199
  %cmp202tmp = xor i1 %cmp194, %cmp200
  br i1 %cmp202tmp, label %if.then204, label %while.body.i1187

if.then204:                                       ; preds = %lor.lhs.false191
  %call205 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([37 x i8]* @.str, i64 0, i64 0), i32 9, i32 0) nounwind
  %puts1226 = tail call i32 @puts(i8* getelementptr inbounds ([21 x i8]* @str29, i64 0, i64 0))
  %call207 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([54 x i8]* @.str2, i64 0, i64 0), i32 %call, i32 %call2, i32 %call3, i32 %call4, i32 %cond, i32 %cond17, i32 %cond27) nounwind
  br label %return

while.body.i1187:                                 ; preds = %gcd.exit1200, %gcd.exit1194, %lor.lhs.false191, %gcd.exit1206, %while.body.i1187
  %b.addr.0.i1183 = phi i64 [ %rem.i1185, %while.body.i1187 ], [ %conv130, %gcd.exit1206 ], [ %conv130, %lor.lhs.false191 ], [ %conv130, %gcd.exit1194 ], [ %conv130, %gcd.exit1200 ]
  %a.addr.0.i1184 = phi i64 [ %b.addr.0.i1183, %while.body.i1187 ], [ %conv129, %gcd.exit1206 ], [ %conv129, %lor.lhs.false191 ], [ %conv129, %gcd.exit1194 ], [ %conv129, %gcd.exit1200 ]
  %rem.i1185 = srem i64 %a.addr.0.i1184, %b.addr.0.i1183
  %cmp.i1186 = icmp eq i64 %rem.i1185, 0
  br i1 %cmp.i1186, label %gcd.exit1188, label %while.body.i1187

gcd.exit1188:                                     ; preds = %while.body.i1187
  %cmp212 = icmp ne i64 %b.addr.0.i1183, 1
  %or.cond901 = or i1 %cmp212, %cmp135
  br i1 %or.cond901, label %while.body.i1169, label %lor.lhs.false217

lor.lhs.false217:                                 ; preds = %gcd.exit1188
  %conv218 = sext i32 %cond to i64
  br label %while.body.i1181

while.body.i1181:                                 ; preds = %while.body.i1181, %lor.lhs.false217
  %b.addr.0.i1177 = phi i64 [ %conv129, %lor.lhs.false217 ], [ %rem.i1179, %while.body.i1181 ]
  %a.addr.0.i1178 = phi i64 [ %conv218, %lor.lhs.false217 ], [ %b.addr.0.i1177, %while.body.i1181 ]
  %rem.i1179 = srem i64 %a.addr.0.i1178, %b.addr.0.i1177
  %cmp.i1180 = icmp eq i64 %rem.i1179, 0
  br i1 %cmp.i1180, label %gcd.exit1182, label %while.body.i1181

gcd.exit1182:                                     ; preds = %while.body.i1181
  %cmp222 = icmp eq i64 %b.addr.0.i1177, %conv129
  br i1 %cmp222, label %lor.lhs.false224, label %while.body.i1169

lor.lhs.false224:                                 ; preds = %gcd.exit1182
  %conv225 = zext i32 %call3 to i64
  br label %while.body.i1175

while.body.i1175:                                 ; preds = %while.body.i1175, %lor.lhs.false224
  %b.addr.0.i1171 = phi i64 [ %conv129, %lor.lhs.false224 ], [ %rem.i1173, %while.body.i1175 ]
  %a.addr.0.i1172 = phi i64 [ %conv225, %lor.lhs.false224 ], [ %b.addr.0.i1171, %while.body.i1175 ]
  %rem.i1173 = srem i64 %a.addr.0.i1172, %b.addr.0.i1171
  %cmp.i1174 = icmp eq i64 %rem.i1173, 0
  br i1 %cmp.i1174, label %gcd.exit1176, label %while.body.i1175

gcd.exit1176:                                     ; preds = %while.body.i1175
  %cmp229 = icmp eq i64 %b.addr.0.i1171, %conv129
  br i1 %cmp229, label %lor.lhs.false231, label %while.body.i1169

lor.lhs.false231:                                 ; preds = %gcd.exit1176
  %rem232 = urem i32 %cond, %call
  %cmp234 = icmp eq i32 %rem232, %rem68
  %div236 = sdiv i32 %cond, %cond27
  %rem237 = urem i32 %div236, %call
  %div238 = udiv i32 %call3, %cond27
  %rem239 = urem i32 %div238, %call
  %cmp240 = icmp eq i32 %rem237, %rem239
  %cmp242tmp = xor i1 %cmp234, %cmp240
  br i1 %cmp242tmp, label %if.then244, label %while.body.i1169

if.then244:                                       ; preds = %lor.lhs.false231
  %call245 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([37 x i8]* @.str, i64 0, i64 0), i32 10, i32 0) nounwind
  %puts1227 = tail call i32 @puts(i8* getelementptr inbounds ([21 x i8]* @str29, i64 0, i64 0))
  %call247 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([54 x i8]* @.str2, i64 0, i64 0), i32 %call, i32 %call2, i32 %call3, i32 %call4, i32 %cond, i32 %cond17, i32 %cond27) nounwind
  br label %return

while.body.i1169:                                 ; preds = %gcd.exit1182, %gcd.exit1176, %lor.lhs.false231, %gcd.exit1188, %while.body.i1169
  %b.addr.0.i1165 = phi i64 [ %rem.i1167, %while.body.i1169 ], [ %conv130, %gcd.exit1188 ], [ %conv130, %lor.lhs.false231 ], [ %conv130, %gcd.exit1176 ], [ %conv130, %gcd.exit1182 ]
  %a.addr.0.i1166 = phi i64 [ %b.addr.0.i1165, %while.body.i1169 ], [ %conv169, %gcd.exit1188 ], [ %conv169, %lor.lhs.false231 ], [ %conv169, %gcd.exit1176 ], [ %conv169, %gcd.exit1182 ]
  %rem.i1167 = srem i64 %a.addr.0.i1166, %b.addr.0.i1165
  %cmp.i1168 = icmp eq i64 %rem.i1167, 0
  br i1 %cmp.i1168, label %gcd.exit1170, label %while.body.i1169

gcd.exit1170:                                     ; preds = %while.body.i1169
  %cmp252 = icmp ne i64 %b.addr.0.i1165, 1
  %or.cond902 = or i1 %cmp252, %cmp175
  br i1 %or.cond902, label %while.body.i1151, label %lor.lhs.false257

lor.lhs.false257:                                 ; preds = %gcd.exit1170
  %conv258 = sext i32 %cond to i64
  br label %while.body.i1163

while.body.i1163:                                 ; preds = %while.body.i1163, %lor.lhs.false257
  %b.addr.0.i1159 = phi i64 [ %conv169, %lor.lhs.false257 ], [ %rem.i1161, %while.body.i1163 ]
  %a.addr.0.i1160 = phi i64 [ %conv258, %lor.lhs.false257 ], [ %b.addr.0.i1159, %while.body.i1163 ]
  %rem.i1161 = srem i64 %a.addr.0.i1160, %b.addr.0.i1159
  %cmp.i1162 = icmp eq i64 %rem.i1161, 0
  br i1 %cmp.i1162, label %gcd.exit1164, label %while.body.i1163

gcd.exit1164:                                     ; preds = %while.body.i1163
  %cmp262 = icmp eq i64 %b.addr.0.i1159, %conv169
  br i1 %cmp262, label %lor.lhs.false264, label %while.body.i1151

lor.lhs.false264:                                 ; preds = %gcd.exit1164
  %conv265 = zext i32 %call3 to i64
  br label %while.body.i1157

while.body.i1157:                                 ; preds = %while.body.i1157, %lor.lhs.false264
  %b.addr.0.i1153 = phi i64 [ %conv169, %lor.lhs.false264 ], [ %rem.i1155, %while.body.i1157 ]
  %a.addr.0.i1154 = phi i64 [ %conv265, %lor.lhs.false264 ], [ %b.addr.0.i1153, %while.body.i1157 ]
  %rem.i1155 = srem i64 %a.addr.0.i1154, %b.addr.0.i1153
  %cmp.i1156 = icmp eq i64 %rem.i1155, 0
  br i1 %cmp.i1156, label %gcd.exit1158, label %while.body.i1157

gcd.exit1158:                                     ; preds = %while.body.i1157
  %cmp269 = icmp eq i64 %b.addr.0.i1153, %conv169
  br i1 %cmp269, label %lor.lhs.false271, label %while.body.i1151

lor.lhs.false271:                                 ; preds = %gcd.exit1158
  %rem272 = urem i32 %cond, %call
  %cmp274 = icmp eq i32 %rem272, %rem68
  %div276 = udiv i32 %cond, %call4
  %rem277 = urem i32 %div276, %call
  %div278 = udiv i32 %call3, %call4
  %rem279 = urem i32 %div278, %call
  %cmp280 = icmp eq i32 %rem277, %rem279
  %cmp282tmp = xor i1 %cmp274, %cmp280
  br i1 %cmp282tmp, label %if.then284, label %while.body.i1151

if.then284:                                       ; preds = %lor.lhs.false271
  %call285 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([37 x i8]* @.str, i64 0, i64 0), i32 11, i32 0) nounwind
  %puts1228 = tail call i32 @puts(i8* getelementptr inbounds ([21 x i8]* @str29, i64 0, i64 0))
  %call287 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([54 x i8]* @.str2, i64 0, i64 0), i32 %call, i32 %call2, i32 %call3, i32 %call4, i32 %cond, i32 %cond17, i32 %cond27) nounwind
  br label %return

while.body.i1151:                                 ; preds = %gcd.exit1164, %gcd.exit1158, %lor.lhs.false271, %gcd.exit1170, %while.body.i1151
  %b.addr.0.i1147 = phi i64 [ %rem.i1149, %while.body.i1151 ], [ %conv130, %gcd.exit1170 ], [ %conv130, %lor.lhs.false271 ], [ %conv130, %gcd.exit1158 ], [ %conv130, %gcd.exit1164 ]
  %a.addr.0.i1148 = phi i64 [ %b.addr.0.i1147, %while.body.i1151 ], [ %conv129, %gcd.exit1170 ], [ %conv129, %lor.lhs.false271 ], [ %conv129, %gcd.exit1158 ], [ %conv129, %gcd.exit1164 ]
  %rem.i1149 = srem i64 %a.addr.0.i1148, %b.addr.0.i1147
  %cmp.i1150 = icmp eq i64 %rem.i1149, 0
  br i1 %cmp.i1150, label %gcd.exit1152, label %while.body.i1151

gcd.exit1152:                                     ; preds = %while.body.i1151
  %cmp292 = icmp ne i64 %b.addr.0.i1147, 1
  %or.cond903 = or i1 %cmp292, %cmp135
  br i1 %or.cond903, label %while.body.i1133, label %lor.lhs.false297

lor.lhs.false297:                                 ; preds = %gcd.exit1152
  %conv298 = zext i32 %call2 to i64
  br label %while.body.i1145

while.body.i1145:                                 ; preds = %while.body.i1145, %lor.lhs.false297
  %b.addr.0.i1141 = phi i64 [ %conv129, %lor.lhs.false297 ], [ %rem.i1143, %while.body.i1145 ]
  %a.addr.0.i1142 = phi i64 [ %conv298, %lor.lhs.false297 ], [ %b.addr.0.i1141, %while.body.i1145 ]
  %rem.i1143 = srem i64 %a.addr.0.i1142, %b.addr.0.i1141
  %cmp.i1144 = icmp eq i64 %rem.i1143, 0
  br i1 %cmp.i1144, label %gcd.exit1146, label %while.body.i1145

gcd.exit1146:                                     ; preds = %while.body.i1145
  %cmp302 = icmp eq i64 %b.addr.0.i1141, %conv129
  br i1 %cmp302, label %lor.lhs.false304, label %while.body.i1133

lor.lhs.false304:                                 ; preds = %gcd.exit1146
  %conv305 = sext i32 %cond17 to i64
  br label %while.body.i1139

while.body.i1139:                                 ; preds = %while.body.i1139, %lor.lhs.false304
  %b.addr.0.i1135 = phi i64 [ %conv129, %lor.lhs.false304 ], [ %rem.i1137, %while.body.i1139 ]
  %a.addr.0.i1136 = phi i64 [ %conv305, %lor.lhs.false304 ], [ %b.addr.0.i1135, %while.body.i1139 ]
  %rem.i1137 = srem i64 %a.addr.0.i1136, %b.addr.0.i1135
  %cmp.i1138 = icmp eq i64 %rem.i1137, 0
  br i1 %cmp.i1138, label %gcd.exit1140, label %while.body.i1139

gcd.exit1140:                                     ; preds = %while.body.i1139
  %cmp309 = icmp eq i64 %b.addr.0.i1135, %conv129
  br i1 %cmp309, label %lor.lhs.false311, label %while.body.i1133

lor.lhs.false311:                                 ; preds = %gcd.exit1140
  %rem313 = urem i32 %cond17, %call
  %cmp314 = icmp eq i32 %rem67.pre-phi, %rem313
  %div316 = udiv i32 %call2, %cond27
  %rem317 = urem i32 %div316, %call
  %div318 = sdiv i32 %cond17, %cond27
  %rem319 = urem i32 %div318, %call
  %cmp320 = icmp eq i32 %rem317, %rem319
  %cmp322tmp = xor i1 %cmp314, %cmp320
  br i1 %cmp322tmp, label %if.then324, label %while.body.i1133

if.then324:                                       ; preds = %lor.lhs.false311
  %call325 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([37 x i8]* @.str, i64 0, i64 0), i32 12, i32 0) nounwind
  %puts1229 = tail call i32 @puts(i8* getelementptr inbounds ([21 x i8]* @str29, i64 0, i64 0))
  %call327 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([54 x i8]* @.str2, i64 0, i64 0), i32 %call, i32 %call2, i32 %call3, i32 %call4, i32 %cond, i32 %cond17, i32 %cond27) nounwind
  br label %return

while.body.i1133:                                 ; preds = %gcd.exit1146, %gcd.exit1140, %lor.lhs.false311, %gcd.exit1152, %while.body.i1133
  %b.addr.0.i1129 = phi i64 [ %rem.i1131, %while.body.i1133 ], [ %conv130, %gcd.exit1152 ], [ %conv130, %lor.lhs.false311 ], [ %conv130, %gcd.exit1140 ], [ %conv130, %gcd.exit1146 ]
  %a.addr.0.i1130 = phi i64 [ %b.addr.0.i1129, %while.body.i1133 ], [ %conv169, %gcd.exit1152 ], [ %conv169, %lor.lhs.false311 ], [ %conv169, %gcd.exit1140 ], [ %conv169, %gcd.exit1146 ]
  %rem.i1131 = srem i64 %a.addr.0.i1130, %b.addr.0.i1129
  %cmp.i1132 = icmp eq i64 %rem.i1131, 0
  br i1 %cmp.i1132, label %gcd.exit1134, label %while.body.i1133

gcd.exit1134:                                     ; preds = %while.body.i1133
  %cmp332 = icmp ne i64 %b.addr.0.i1129, 1
  %or.cond904 = or i1 %cmp332, %cmp175
  br i1 %or.cond904, label %while.body.i1115, label %lor.lhs.false337

lor.lhs.false337:                                 ; preds = %gcd.exit1134
  %conv338 = zext i32 %call2 to i64
  br label %while.body.i1127

while.body.i1127:                                 ; preds = %while.body.i1127, %lor.lhs.false337
  %b.addr.0.i1123 = phi i64 [ %conv169, %lor.lhs.false337 ], [ %rem.i1125, %while.body.i1127 ]
  %a.addr.0.i1124 = phi i64 [ %conv338, %lor.lhs.false337 ], [ %b.addr.0.i1123, %while.body.i1127 ]
  %rem.i1125 = srem i64 %a.addr.0.i1124, %b.addr.0.i1123
  %cmp.i1126 = icmp eq i64 %rem.i1125, 0
  br i1 %cmp.i1126, label %gcd.exit1128, label %while.body.i1127

gcd.exit1128:                                     ; preds = %while.body.i1127
  %cmp342 = icmp eq i64 %b.addr.0.i1123, %conv169
  br i1 %cmp342, label %lor.lhs.false344, label %while.body.i1115

lor.lhs.false344:                                 ; preds = %gcd.exit1128
  %conv345 = sext i32 %cond17 to i64
  br label %while.body.i1121

while.body.i1121:                                 ; preds = %while.body.i1121, %lor.lhs.false344
  %b.addr.0.i1117 = phi i64 [ %conv169, %lor.lhs.false344 ], [ %rem.i1119, %while.body.i1121 ]
  %a.addr.0.i1118 = phi i64 [ %conv345, %lor.lhs.false344 ], [ %b.addr.0.i1117, %while.body.i1121 ]
  %rem.i1119 = srem i64 %a.addr.0.i1118, %b.addr.0.i1117
  %cmp.i1120 = icmp eq i64 %rem.i1119, 0
  br i1 %cmp.i1120, label %gcd.exit1122, label %while.body.i1121

gcd.exit1122:                                     ; preds = %while.body.i1121
  %cmp349 = icmp eq i64 %b.addr.0.i1117, %conv169
  br i1 %cmp349, label %lor.lhs.false351, label %while.body.i1115

lor.lhs.false351:                                 ; preds = %gcd.exit1122
  %rem353 = urem i32 %cond17, %call
  %cmp354 = icmp eq i32 %rem67.pre-phi, %rem353
  %div356 = udiv i32 %call2, %call4
  %rem357 = urem i32 %div356, %call
  %div358 = udiv i32 %cond17, %call4
  %rem359 = urem i32 %div358, %call
  %cmp360 = icmp eq i32 %rem357, %rem359
  %cmp362tmp = xor i1 %cmp354, %cmp360
  br i1 %cmp362tmp, label %if.then364, label %while.body.i1115

if.then364:                                       ; preds = %lor.lhs.false351
  %call365 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([37 x i8]* @.str, i64 0, i64 0), i32 13, i32 0) nounwind
  %puts1230 = tail call i32 @puts(i8* getelementptr inbounds ([21 x i8]* @str29, i64 0, i64 0))
  %call367 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([54 x i8]* @.str2, i64 0, i64 0), i32 %call, i32 %call2, i32 %call3, i32 %call4, i32 %cond, i32 %cond17, i32 %cond27) nounwind
  br label %return

while.body.i1115:                                 ; preds = %gcd.exit1128, %gcd.exit1122, %lor.lhs.false351, %gcd.exit1134, %while.body.i1115
  %b.addr.0.i1111 = phi i64 [ %rem.i1113, %while.body.i1115 ], [ %conv130, %gcd.exit1134 ], [ %conv130, %lor.lhs.false351 ], [ %conv130, %gcd.exit1122 ], [ %conv130, %gcd.exit1128 ]
  %a.addr.0.i1112 = phi i64 [ %b.addr.0.i1111, %while.body.i1115 ], [ %conv129, %gcd.exit1134 ], [ %conv129, %lor.lhs.false351 ], [ %conv129, %gcd.exit1122 ], [ %conv129, %gcd.exit1128 ]
  %rem.i1113 = srem i64 %a.addr.0.i1112, %b.addr.0.i1111
  %cmp.i1114 = icmp eq i64 %rem.i1113, 0
  br i1 %cmp.i1114, label %gcd.exit1116, label %while.body.i1115

gcd.exit1116:                                     ; preds = %while.body.i1115
  %cmp372 = icmp ne i64 %b.addr.0.i1111, 1
  %or.cond905 = or i1 %cmp372, %cmp135
  br i1 %or.cond905, label %while.body.i1097, label %lor.lhs.false377

lor.lhs.false377:                                 ; preds = %gcd.exit1116
  %conv378 = zext i32 %call2 to i64
  br label %while.body.i1109

while.body.i1109:                                 ; preds = %while.body.i1109, %lor.lhs.false377
  %b.addr.0.i1105 = phi i64 [ %conv129, %lor.lhs.false377 ], [ %rem.i1107, %while.body.i1109 ]
  %a.addr.0.i1106 = phi i64 [ %conv378, %lor.lhs.false377 ], [ %b.addr.0.i1105, %while.body.i1109 ]
  %rem.i1107 = srem i64 %a.addr.0.i1106, %b.addr.0.i1105
  %cmp.i1108 = icmp eq i64 %rem.i1107, 0
  br i1 %cmp.i1108, label %gcd.exit1110, label %while.body.i1109

gcd.exit1110:                                     ; preds = %while.body.i1109
  %cmp382 = icmp eq i64 %b.addr.0.i1105, %conv129
  br i1 %cmp382, label %lor.lhs.false384, label %while.body.i1097

lor.lhs.false384:                                 ; preds = %gcd.exit1110
  %conv385 = zext i32 %call3 to i64
  br label %while.body.i1103

while.body.i1103:                                 ; preds = %while.body.i1103, %lor.lhs.false384
  %b.addr.0.i1099 = phi i64 [ %conv129, %lor.lhs.false384 ], [ %rem.i1101, %while.body.i1103 ]
  %a.addr.0.i1100 = phi i64 [ %conv385, %lor.lhs.false384 ], [ %b.addr.0.i1099, %while.body.i1103 ]
  %rem.i1101 = srem i64 %a.addr.0.i1100, %b.addr.0.i1099
  %cmp.i1102 = icmp eq i64 %rem.i1101, 0
  br i1 %cmp.i1102, label %gcd.exit1104, label %while.body.i1103

gcd.exit1104:                                     ; preds = %while.body.i1103
  %cmp389 = icmp eq i64 %b.addr.0.i1099, %conv129
  br i1 %cmp389, label %lor.lhs.false391, label %while.body.i1097

lor.lhs.false391:                                 ; preds = %gcd.exit1104
  %cmp394 = icmp eq i32 %rem67.pre-phi, %rem68
  %div396 = udiv i32 %call2, %cond27
  %rem397 = urem i32 %div396, %call
  %div398 = udiv i32 %call3, %cond27
  %rem399 = urem i32 %div398, %call
  %cmp400 = icmp eq i32 %rem397, %rem399
  %cmp402tmp = xor i1 %cmp394, %cmp400
  br i1 %cmp402tmp, label %if.then404, label %while.body.i1097

if.then404:                                       ; preds = %lor.lhs.false391
  %call405 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([37 x i8]* @.str, i64 0, i64 0), i32 14, i32 0) nounwind
  %puts1231 = tail call i32 @puts(i8* getelementptr inbounds ([21 x i8]* @str29, i64 0, i64 0))
  %call407 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([54 x i8]* @.str2, i64 0, i64 0), i32 %call, i32 %call2, i32 %call3, i32 %call4, i32 %cond, i32 %cond17, i32 %cond27) nounwind
  br label %return

while.body.i1097:                                 ; preds = %gcd.exit1110, %gcd.exit1104, %lor.lhs.false391, %gcd.exit1116, %while.body.i1097
  %b.addr.0.i1093 = phi i64 [ %rem.i1095, %while.body.i1097 ], [ %conv130, %gcd.exit1116 ], [ %conv130, %lor.lhs.false391 ], [ %conv130, %gcd.exit1104 ], [ %conv130, %gcd.exit1110 ]
  %a.addr.0.i1094 = phi i64 [ %b.addr.0.i1093, %while.body.i1097 ], [ %conv169, %gcd.exit1116 ], [ %conv169, %lor.lhs.false391 ], [ %conv169, %gcd.exit1104 ], [ %conv169, %gcd.exit1110 ]
  %rem.i1095 = srem i64 %a.addr.0.i1094, %b.addr.0.i1093
  %cmp.i1096 = icmp eq i64 %rem.i1095, 0
  br i1 %cmp.i1096, label %gcd.exit1098, label %while.body.i1097

gcd.exit1098:                                     ; preds = %while.body.i1097
  %cmp412 = icmp ne i64 %b.addr.0.i1093, 1
  %or.cond906 = or i1 %cmp412, %cmp175
  br i1 %or.cond906, label %if.end448, label %lor.lhs.false417

lor.lhs.false417:                                 ; preds = %gcd.exit1098
  %conv418 = zext i32 %call2 to i64
  br label %while.body.i1091

while.body.i1091:                                 ; preds = %while.body.i1091, %lor.lhs.false417
  %b.addr.0.i1087 = phi i64 [ %conv169, %lor.lhs.false417 ], [ %rem.i1089, %while.body.i1091 ]
  %a.addr.0.i1088 = phi i64 [ %conv418, %lor.lhs.false417 ], [ %b.addr.0.i1087, %while.body.i1091 ]
  %rem.i1089 = srem i64 %a.addr.0.i1088, %b.addr.0.i1087
  %cmp.i1090 = icmp eq i64 %rem.i1089, 0
  br i1 %cmp.i1090, label %gcd.exit1092, label %while.body.i1091

gcd.exit1092:                                     ; preds = %while.body.i1091
  %cmp422 = icmp eq i64 %b.addr.0.i1087, %conv169
  br i1 %cmp422, label %lor.lhs.false424, label %if.end448

lor.lhs.false424:                                 ; preds = %gcd.exit1092
  %conv425 = zext i32 %call3 to i64
  br label %while.body.i1085

while.body.i1085:                                 ; preds = %while.body.i1085, %lor.lhs.false424
  %b.addr.0.i1081 = phi i64 [ %conv169, %lor.lhs.false424 ], [ %rem.i1083, %while.body.i1085 ]
  %a.addr.0.i1082 = phi i64 [ %conv425, %lor.lhs.false424 ], [ %b.addr.0.i1081, %while.body.i1085 ]
  %rem.i1083 = srem i64 %a.addr.0.i1082, %b.addr.0.i1081
  %cmp.i1084 = icmp eq i64 %rem.i1083, 0
  br i1 %cmp.i1084, label %gcd.exit1086, label %while.body.i1085

gcd.exit1086:                                     ; preds = %while.body.i1085
  %cmp429 = icmp eq i64 %b.addr.0.i1081, %conv169
  br i1 %cmp429, label %lor.lhs.false431, label %if.end448

lor.lhs.false431:                                 ; preds = %gcd.exit1086
  %cmp434 = icmp eq i32 %rem67.pre-phi, %rem68
  %div436 = udiv i32 %call2, %call4
  %rem437 = urem i32 %div436, %call
  %div438 = udiv i32 %call3, %call4
  %rem439 = urem i32 %div438, %call
  %cmp440 = icmp eq i32 %rem437, %rem439
  %cmp442tmp = xor i1 %cmp434, %cmp440
  br i1 %cmp442tmp, label %if.then444, label %if.end448

if.then444:                                       ; preds = %lor.lhs.false431
  %call445 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([37 x i8]* @.str, i64 0, i64 0), i32 15, i32 0) nounwind
  %puts1232 = tail call i32 @puts(i8* getelementptr inbounds ([21 x i8]* @str29, i64 0, i64 0))
  %call447 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([54 x i8]* @.str2, i64 0, i64 0), i32 %call, i32 %call2, i32 %call3, i32 %call4, i32 %cond, i32 %cond17, i32 %cond27) nounwind
  br label %return

if.end448:                                        ; preds = %gcd.exit1098, %lor.lhs.false431, %gcd.exit1086, %gcd.exit1092
  br i1 %cmp135, label %if.end491, label %lor.lhs.false451

lor.lhs.false451:                                 ; preds = %if.end448
  %conv452 = sext i32 %cond to i64
  br label %while.body.i1079

while.body.i1079:                                 ; preds = %while.body.i1079, %lor.lhs.false451
  %b.addr.0.i1075 = phi i64 [ %conv129, %lor.lhs.false451 ], [ %rem.i1077, %while.body.i1079 ]
  %a.addr.0.i1076 = phi i64 [ %conv452, %lor.lhs.false451 ], [ %b.addr.0.i1075, %while.body.i1079 ]
  %rem.i1077 = srem i64 %a.addr.0.i1076, %b.addr.0.i1075
  %cmp.i1078 = icmp eq i64 %rem.i1077, 0
  br i1 %cmp.i1078, label %gcd.exit1080, label %while.body.i1079

gcd.exit1080:                                     ; preds = %while.body.i1079
  %cmp456 = icmp eq i64 %b.addr.0.i1075, %conv129
  br i1 %cmp456, label %lor.lhs.false458, label %if.end491

lor.lhs.false458:                                 ; preds = %gcd.exit1080
  %conv459 = sext i32 %cond17 to i64
  br label %while.body.i1073

while.body.i1073:                                 ; preds = %while.body.i1073, %lor.lhs.false458
  %b.addr.0.i1069 = phi i64 [ %conv129, %lor.lhs.false458 ], [ %rem.i1071, %while.body.i1073 ]
  %a.addr.0.i1070 = phi i64 [ %conv459, %lor.lhs.false458 ], [ %b.addr.0.i1069, %while.body.i1073 ]
  %rem.i1071 = srem i64 %a.addr.0.i1070, %b.addr.0.i1069
  %cmp.i1072 = icmp eq i64 %rem.i1071, 0
  br i1 %cmp.i1072, label %gcd.exit1074, label %while.body.i1073

gcd.exit1074:                                     ; preds = %while.body.i1073
  %cmp463 = icmp eq i64 %b.addr.0.i1069, %conv129
  br i1 %cmp463, label %while.body.i1067, label %if.end491

while.body.i1067:                                 ; preds = %gcd.exit1074, %while.body.i1067
  %b.addr.0.i1063 = phi i64 [ %rem.i1065, %while.body.i1067 ], [ %conv129, %gcd.exit1074 ]
  %a.addr.0.i1064 = phi i64 [ %b.addr.0.i1063, %while.body.i1067 ], [ %conv130, %gcd.exit1074 ]
  %rem.i1065 = srem i64 %a.addr.0.i1064, %b.addr.0.i1063
  %cmp.i1066 = icmp eq i64 %rem.i1065, 0
  br i1 %cmp.i1066, label %gcd.exit1068, label %while.body.i1067

gcd.exit1068:                                     ; preds = %while.body.i1067
  %cmp470 = icmp eq i64 %b.addr.0.i1063, %conv129
  br i1 %cmp470, label %lor.lhs.false472, label %if.end491

lor.lhs.false472:                                 ; preds = %gcd.exit1068
  %rem473 = urem i32 %cond, %call
  %rem474 = urem i32 %cond17, %call
  %cmp475 = icmp eq i32 %rem473, %rem474
  %div477 = sdiv i32 %cond, %cond27
  %div478 = udiv i32 %call, %cond27
  %rem479 = urem i32 %div477, %div478
  %div480 = sdiv i32 %cond17, %cond27
  %rem482 = urem i32 %div480, %div478
  %cmp483 = icmp eq i32 %rem479, %rem482
  %cmp485tmp = xor i1 %cmp475, %cmp483
  br i1 %cmp485tmp, label %if.then487, label %if.end491

if.then487:                                       ; preds = %lor.lhs.false472
  %call488 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([37 x i8]* @.str, i64 0, i64 0), i32 16, i32 0) nounwind
  %puts1233 = tail call i32 @puts(i8* getelementptr inbounds ([21 x i8]* @str29, i64 0, i64 0))
  %call490 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([54 x i8]* @.str2, i64 0, i64 0), i32 %call, i32 %call2, i32 %call3, i32 %call4, i32 %cond, i32 %cond17, i32 %cond27) nounwind
  br label %return

if.end491:                                        ; preds = %lor.lhs.false472, %gcd.exit1068, %gcd.exit1074, %gcd.exit1080, %if.end448
  br i1 %cmp175, label %if.end534, label %lor.lhs.false494

lor.lhs.false494:                                 ; preds = %if.end491
  %conv495 = sext i32 %cond to i64
  br label %while.body.i1061

while.body.i1061:                                 ; preds = %while.body.i1061, %lor.lhs.false494
  %b.addr.0.i1057 = phi i64 [ %conv169, %lor.lhs.false494 ], [ %rem.i1059, %while.body.i1061 ]
  %a.addr.0.i1058 = phi i64 [ %conv495, %lor.lhs.false494 ], [ %b.addr.0.i1057, %while.body.i1061 ]
  %rem.i1059 = srem i64 %a.addr.0.i1058, %b.addr.0.i1057
  %cmp.i1060 = icmp eq i64 %rem.i1059, 0
  br i1 %cmp.i1060, label %gcd.exit1062, label %while.body.i1061

gcd.exit1062:                                     ; preds = %while.body.i1061
  %cmp499 = icmp eq i64 %b.addr.0.i1057, %conv169
  br i1 %cmp499, label %lor.lhs.false501, label %if.end534

lor.lhs.false501:                                 ; preds = %gcd.exit1062
  %conv502 = sext i32 %cond17 to i64
  br label %while.body.i1055

while.body.i1055:                                 ; preds = %while.body.i1055, %lor.lhs.false501
  %b.addr.0.i1051 = phi i64 [ %conv169, %lor.lhs.false501 ], [ %rem.i1053, %while.body.i1055 ]
  %a.addr.0.i1052 = phi i64 [ %conv502, %lor.lhs.false501 ], [ %b.addr.0.i1051, %while.body.i1055 ]
  %rem.i1053 = srem i64 %a.addr.0.i1052, %b.addr.0.i1051
  %cmp.i1054 = icmp eq i64 %rem.i1053, 0
  br i1 %cmp.i1054, label %gcd.exit1056, label %while.body.i1055

gcd.exit1056:                                     ; preds = %while.body.i1055
  %cmp506 = icmp eq i64 %b.addr.0.i1051, %conv169
  br i1 %cmp506, label %while.body.i1049, label %if.end534

while.body.i1049:                                 ; preds = %gcd.exit1056, %while.body.i1049
  %b.addr.0.i1045 = phi i64 [ %rem.i1047, %while.body.i1049 ], [ %conv169, %gcd.exit1056 ]
  %a.addr.0.i1046 = phi i64 [ %b.addr.0.i1045, %while.body.i1049 ], [ %conv130, %gcd.exit1056 ]
  %rem.i1047 = srem i64 %a.addr.0.i1046, %b.addr.0.i1045
  %cmp.i1048 = icmp eq i64 %rem.i1047, 0
  br i1 %cmp.i1048, label %gcd.exit1050, label %while.body.i1049

gcd.exit1050:                                     ; preds = %while.body.i1049
  %cmp513 = icmp eq i64 %b.addr.0.i1045, %conv169
  br i1 %cmp513, label %lor.lhs.false515, label %if.end534

lor.lhs.false515:                                 ; preds = %gcd.exit1050
  %rem516 = urem i32 %cond, %call
  %rem517 = urem i32 %cond17, %call
  %cmp518 = icmp eq i32 %rem516, %rem517
  %div520 = udiv i32 %cond, %call4
  %div521 = udiv i32 %call, %call4
  %rem522 = urem i32 %div520, %div521
  %div523 = udiv i32 %cond17, %call4
  %rem525 = urem i32 %div523, %div521
  %cmp526 = icmp eq i32 %rem522, %rem525
  %cmp528tmp = xor i1 %cmp518, %cmp526
  br i1 %cmp528tmp, label %if.then530, label %if.end534

if.then530:                                       ; preds = %lor.lhs.false515
  %call531 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([37 x i8]* @.str, i64 0, i64 0), i32 17, i32 0) nounwind
  %puts1234 = tail call i32 @puts(i8* getelementptr inbounds ([21 x i8]* @str29, i64 0, i64 0))
  %call533 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([54 x i8]* @.str2, i64 0, i64 0), i32 %call, i32 %call2, i32 %call3, i32 %call4, i32 %cond, i32 %cond17, i32 %cond27) nounwind
  br label %return

if.end534:                                        ; preds = %lor.lhs.false515, %gcd.exit1050, %gcd.exit1056, %gcd.exit1062, %if.end491
  br i1 %cmp135, label %if.end577, label %lor.lhs.false537

lor.lhs.false537:                                 ; preds = %if.end534
  %conv538 = sext i32 %cond to i64
  br label %while.body.i1043

while.body.i1043:                                 ; preds = %while.body.i1043, %lor.lhs.false537
  %b.addr.0.i1039 = phi i64 [ %conv129, %lor.lhs.false537 ], [ %rem.i1041, %while.body.i1043 ]
  %a.addr.0.i1040 = phi i64 [ %conv538, %lor.lhs.false537 ], [ %b.addr.0.i1039, %while.body.i1043 ]
  %rem.i1041 = srem i64 %a.addr.0.i1040, %b.addr.0.i1039
  %cmp.i1042 = icmp eq i64 %rem.i1041, 0
  br i1 %cmp.i1042, label %gcd.exit1044, label %while.body.i1043

gcd.exit1044:                                     ; preds = %while.body.i1043
  %cmp542 = icmp eq i64 %b.addr.0.i1039, %conv129
  br i1 %cmp542, label %lor.lhs.false544, label %if.end577

lor.lhs.false544:                                 ; preds = %gcd.exit1044
  %conv545 = zext i32 %call3 to i64
  br label %while.body.i1037

while.body.i1037:                                 ; preds = %while.body.i1037, %lor.lhs.false544
  %b.addr.0.i1033 = phi i64 [ %conv129, %lor.lhs.false544 ], [ %rem.i1035, %while.body.i1037 ]
  %a.addr.0.i1034 = phi i64 [ %conv545, %lor.lhs.false544 ], [ %b.addr.0.i1033, %while.body.i1037 ]
  %rem.i1035 = srem i64 %a.addr.0.i1034, %b.addr.0.i1033
  %cmp.i1036 = icmp eq i64 %rem.i1035, 0
  br i1 %cmp.i1036, label %gcd.exit1038, label %while.body.i1037

gcd.exit1038:                                     ; preds = %while.body.i1037
  %cmp549 = icmp eq i64 %b.addr.0.i1033, %conv129
  br i1 %cmp549, label %while.body.i1031, label %if.end577

while.body.i1031:                                 ; preds = %gcd.exit1038, %while.body.i1031
  %b.addr.0.i1027 = phi i64 [ %rem.i1029, %while.body.i1031 ], [ %conv129, %gcd.exit1038 ]
  %a.addr.0.i1028 = phi i64 [ %b.addr.0.i1027, %while.body.i1031 ], [ %conv130, %gcd.exit1038 ]
  %rem.i1029 = srem i64 %a.addr.0.i1028, %b.addr.0.i1027
  %cmp.i1030 = icmp eq i64 %rem.i1029, 0
  br i1 %cmp.i1030, label %gcd.exit1032, label %while.body.i1031

gcd.exit1032:                                     ; preds = %while.body.i1031
  %cmp556 = icmp eq i64 %b.addr.0.i1027, %conv129
  br i1 %cmp556, label %lor.lhs.false558, label %if.end577

lor.lhs.false558:                                 ; preds = %gcd.exit1032
  %rem559 = urem i32 %cond, %call
  %cmp561 = icmp eq i32 %rem559, %rem68
  %div563 = sdiv i32 %cond, %cond27
  %div564 = udiv i32 %call, %cond27
  %rem565 = urem i32 %div563, %div564
  %div566 = udiv i32 %call3, %cond27
  %rem568 = urem i32 %div566, %div564
  %cmp569 = icmp eq i32 %rem565, %rem568
  %cmp571tmp = xor i1 %cmp561, %cmp569
  br i1 %cmp571tmp, label %if.then573, label %if.end577

if.then573:                                       ; preds = %lor.lhs.false558
  %call574 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([37 x i8]* @.str, i64 0, i64 0), i32 18, i32 0) nounwind
  %puts1235 = tail call i32 @puts(i8* getelementptr inbounds ([21 x i8]* @str29, i64 0, i64 0))
  %call576 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([54 x i8]* @.str2, i64 0, i64 0), i32 %call, i32 %call2, i32 %call3, i32 %call4, i32 %cond, i32 %cond17, i32 %cond27) nounwind
  br label %return

if.end577:                                        ; preds = %lor.lhs.false558, %gcd.exit1032, %gcd.exit1038, %gcd.exit1044, %if.end534
  br i1 %cmp175, label %if.end620, label %lor.lhs.false580

lor.lhs.false580:                                 ; preds = %if.end577
  %conv581 = sext i32 %cond to i64
  br label %while.body.i1025

while.body.i1025:                                 ; preds = %while.body.i1025, %lor.lhs.false580
  %b.addr.0.i1021 = phi i64 [ %conv169, %lor.lhs.false580 ], [ %rem.i1023, %while.body.i1025 ]
  %a.addr.0.i1022 = phi i64 [ %conv581, %lor.lhs.false580 ], [ %b.addr.0.i1021, %while.body.i1025 ]
  %rem.i1023 = srem i64 %a.addr.0.i1022, %b.addr.0.i1021
  %cmp.i1024 = icmp eq i64 %rem.i1023, 0
  br i1 %cmp.i1024, label %gcd.exit1026, label %while.body.i1025

gcd.exit1026:                                     ; preds = %while.body.i1025
  %cmp585 = icmp eq i64 %b.addr.0.i1021, %conv169
  br i1 %cmp585, label %lor.lhs.false587, label %if.end620

lor.lhs.false587:                                 ; preds = %gcd.exit1026
  %conv588 = zext i32 %call3 to i64
  br label %while.body.i1019

while.body.i1019:                                 ; preds = %while.body.i1019, %lor.lhs.false587
  %b.addr.0.i1015 = phi i64 [ %conv169, %lor.lhs.false587 ], [ %rem.i1017, %while.body.i1019 ]
  %a.addr.0.i1016 = phi i64 [ %conv588, %lor.lhs.false587 ], [ %b.addr.0.i1015, %while.body.i1019 ]
  %rem.i1017 = srem i64 %a.addr.0.i1016, %b.addr.0.i1015
  %cmp.i1018 = icmp eq i64 %rem.i1017, 0
  br i1 %cmp.i1018, label %gcd.exit1020, label %while.body.i1019

gcd.exit1020:                                     ; preds = %while.body.i1019
  %cmp592 = icmp eq i64 %b.addr.0.i1015, %conv169
  br i1 %cmp592, label %while.body.i1013, label %if.end620

while.body.i1013:                                 ; preds = %gcd.exit1020, %while.body.i1013
  %b.addr.0.i1009 = phi i64 [ %rem.i1011, %while.body.i1013 ], [ %conv169, %gcd.exit1020 ]
  %a.addr.0.i1010 = phi i64 [ %b.addr.0.i1009, %while.body.i1013 ], [ %conv130, %gcd.exit1020 ]
  %rem.i1011 = srem i64 %a.addr.0.i1010, %b.addr.0.i1009
  %cmp.i1012 = icmp eq i64 %rem.i1011, 0
  br i1 %cmp.i1012, label %gcd.exit1014, label %while.body.i1013

gcd.exit1014:                                     ; preds = %while.body.i1013
  %cmp599 = icmp eq i64 %b.addr.0.i1009, %conv169
  br i1 %cmp599, label %lor.lhs.false601, label %if.end620

lor.lhs.false601:                                 ; preds = %gcd.exit1014
  %rem602 = urem i32 %cond, %call
  %cmp604 = icmp eq i32 %rem602, %rem68
  %div606 = udiv i32 %cond, %call4
  %div607 = udiv i32 %call, %call4
  %rem608 = urem i32 %div606, %div607
  %div609 = udiv i32 %call3, %call4
  %rem611 = urem i32 %div609, %div607
  %cmp612 = icmp eq i32 %rem608, %rem611
  %cmp614tmp = xor i1 %cmp604, %cmp612
  br i1 %cmp614tmp, label %if.then616, label %if.end620

if.then616:                                       ; preds = %lor.lhs.false601
  %call617 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([37 x i8]* @.str, i64 0, i64 0), i32 19, i32 0) nounwind
  %puts1236 = tail call i32 @puts(i8* getelementptr inbounds ([21 x i8]* @str29, i64 0, i64 0))
  %call619 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([54 x i8]* @.str2, i64 0, i64 0), i32 %call, i32 %call2, i32 %call3, i32 %call4, i32 %cond, i32 %cond17, i32 %cond27) nounwind
  br label %return

if.end620:                                        ; preds = %lor.lhs.false601, %gcd.exit1014, %gcd.exit1020, %gcd.exit1026, %if.end577
  br i1 %cmp135, label %if.end663, label %lor.lhs.false623

lor.lhs.false623:                                 ; preds = %if.end620
  %conv624 = zext i32 %call2 to i64
  br label %while.body.i1007

while.body.i1007:                                 ; preds = %while.body.i1007, %lor.lhs.false623
  %b.addr.0.i1003 = phi i64 [ %conv129, %lor.lhs.false623 ], [ %rem.i1005, %while.body.i1007 ]
  %a.addr.0.i1004 = phi i64 [ %conv624, %lor.lhs.false623 ], [ %b.addr.0.i1003, %while.body.i1007 ]
  %rem.i1005 = srem i64 %a.addr.0.i1004, %b.addr.0.i1003
  %cmp.i1006 = icmp eq i64 %rem.i1005, 0
  br i1 %cmp.i1006, label %gcd.exit1008, label %while.body.i1007

gcd.exit1008:                                     ; preds = %while.body.i1007
  %cmp628 = icmp eq i64 %b.addr.0.i1003, %conv129
  br i1 %cmp628, label %lor.lhs.false630, label %if.end663

lor.lhs.false630:                                 ; preds = %gcd.exit1008
  %conv631 = sext i32 %cond17 to i64
  br label %while.body.i1001

while.body.i1001:                                 ; preds = %while.body.i1001, %lor.lhs.false630
  %b.addr.0.i997 = phi i64 [ %conv129, %lor.lhs.false630 ], [ %rem.i999, %while.body.i1001 ]
  %a.addr.0.i998 = phi i64 [ %conv631, %lor.lhs.false630 ], [ %b.addr.0.i997, %while.body.i1001 ]
  %rem.i999 = srem i64 %a.addr.0.i998, %b.addr.0.i997
  %cmp.i1000 = icmp eq i64 %rem.i999, 0
  br i1 %cmp.i1000, label %gcd.exit1002, label %while.body.i1001

gcd.exit1002:                                     ; preds = %while.body.i1001
  %cmp635 = icmp eq i64 %b.addr.0.i997, %conv129
  br i1 %cmp635, label %while.body.i995, label %if.end663

while.body.i995:                                  ; preds = %gcd.exit1002, %while.body.i995
  %b.addr.0.i991 = phi i64 [ %rem.i993, %while.body.i995 ], [ %conv129, %gcd.exit1002 ]
  %a.addr.0.i992 = phi i64 [ %b.addr.0.i991, %while.body.i995 ], [ %conv130, %gcd.exit1002 ]
  %rem.i993 = srem i64 %a.addr.0.i992, %b.addr.0.i991
  %cmp.i994 = icmp eq i64 %rem.i993, 0
  br i1 %cmp.i994, label %gcd.exit996, label %while.body.i995

gcd.exit996:                                      ; preds = %while.body.i995
  %cmp642 = icmp eq i64 %b.addr.0.i991, %conv129
  br i1 %cmp642, label %lor.lhs.false644, label %if.end663

lor.lhs.false644:                                 ; preds = %gcd.exit996
  %rem646 = urem i32 %cond17, %call
  %cmp647 = icmp eq i32 %rem67.pre-phi, %rem646
  %div649 = udiv i32 %call2, %cond27
  %div650 = udiv i32 %call, %cond27
  %rem651 = urem i32 %div649, %div650
  %div652 = sdiv i32 %cond17, %cond27
  %rem654 = urem i32 %div652, %div650
  %cmp655 = icmp eq i32 %rem651, %rem654
  %cmp657tmp = xor i1 %cmp647, %cmp655
  br i1 %cmp657tmp, label %if.then659, label %if.end663

if.then659:                                       ; preds = %lor.lhs.false644
  %call660 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([37 x i8]* @.str, i64 0, i64 0), i32 20, i32 0) nounwind
  %puts1237 = tail call i32 @puts(i8* getelementptr inbounds ([21 x i8]* @str29, i64 0, i64 0))
  %call662 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([54 x i8]* @.str2, i64 0, i64 0), i32 %call, i32 %call2, i32 %call3, i32 %call4, i32 %cond, i32 %cond17, i32 %cond27) nounwind
  br label %return

if.end663:                                        ; preds = %lor.lhs.false644, %gcd.exit996, %gcd.exit1002, %gcd.exit1008, %if.end620
  br i1 %cmp175, label %if.end706, label %lor.lhs.false666

lor.lhs.false666:                                 ; preds = %if.end663
  %conv667 = zext i32 %call2 to i64
  br label %while.body.i989

while.body.i989:                                  ; preds = %while.body.i989, %lor.lhs.false666
  %b.addr.0.i985 = phi i64 [ %conv169, %lor.lhs.false666 ], [ %rem.i987, %while.body.i989 ]
  %a.addr.0.i986 = phi i64 [ %conv667, %lor.lhs.false666 ], [ %b.addr.0.i985, %while.body.i989 ]
  %rem.i987 = srem i64 %a.addr.0.i986, %b.addr.0.i985
  %cmp.i988 = icmp eq i64 %rem.i987, 0
  br i1 %cmp.i988, label %gcd.exit990, label %while.body.i989

gcd.exit990:                                      ; preds = %while.body.i989
  %cmp671 = icmp eq i64 %b.addr.0.i985, %conv169
  br i1 %cmp671, label %lor.lhs.false673, label %if.end706

lor.lhs.false673:                                 ; preds = %gcd.exit990
  %conv674 = sext i32 %cond17 to i64
  br label %while.body.i983

while.body.i983:                                  ; preds = %while.body.i983, %lor.lhs.false673
  %b.addr.0.i979 = phi i64 [ %conv169, %lor.lhs.false673 ], [ %rem.i981, %while.body.i983 ]
  %a.addr.0.i980 = phi i64 [ %conv674, %lor.lhs.false673 ], [ %b.addr.0.i979, %while.body.i983 ]
  %rem.i981 = srem i64 %a.addr.0.i980, %b.addr.0.i979
  %cmp.i982 = icmp eq i64 %rem.i981, 0
  br i1 %cmp.i982, label %gcd.exit984, label %while.body.i983

gcd.exit984:                                      ; preds = %while.body.i983
  %cmp678 = icmp eq i64 %b.addr.0.i979, %conv169
  br i1 %cmp678, label %while.body.i977, label %if.end706

while.body.i977:                                  ; preds = %gcd.exit984, %while.body.i977
  %b.addr.0.i973 = phi i64 [ %rem.i975, %while.body.i977 ], [ %conv169, %gcd.exit984 ]
  %a.addr.0.i974 = phi i64 [ %b.addr.0.i973, %while.body.i977 ], [ %conv130, %gcd.exit984 ]
  %rem.i975 = srem i64 %a.addr.0.i974, %b.addr.0.i973
  %cmp.i976 = icmp eq i64 %rem.i975, 0
  br i1 %cmp.i976, label %gcd.exit978, label %while.body.i977

gcd.exit978:                                      ; preds = %while.body.i977
  %cmp685 = icmp eq i64 %b.addr.0.i973, %conv169
  br i1 %cmp685, label %lor.lhs.false687, label %if.end706

lor.lhs.false687:                                 ; preds = %gcd.exit978
  %rem689 = urem i32 %cond17, %call
  %cmp690 = icmp eq i32 %rem67.pre-phi, %rem689
  %div692 = udiv i32 %call2, %call4
  %div693 = udiv i32 %call, %call4
  %rem694 = urem i32 %div692, %div693
  %div695 = udiv i32 %cond17, %call4
  %rem697 = urem i32 %div695, %div693
  %cmp698 = icmp eq i32 %rem694, %rem697
  %cmp700tmp = xor i1 %cmp690, %cmp698
  br i1 %cmp700tmp, label %if.then702, label %if.end706

if.then702:                                       ; preds = %lor.lhs.false687
  %call703 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([37 x i8]* @.str, i64 0, i64 0), i32 21, i32 0) nounwind
  %puts1238 = tail call i32 @puts(i8* getelementptr inbounds ([21 x i8]* @str29, i64 0, i64 0))
  %call705 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([54 x i8]* @.str2, i64 0, i64 0), i32 %call, i32 %call2, i32 %call3, i32 %call4, i32 %cond, i32 %cond17, i32 %cond27) nounwind
  br label %return

if.end706:                                        ; preds = %lor.lhs.false687, %gcd.exit978, %gcd.exit984, %gcd.exit990, %if.end663
  br i1 %cmp135, label %if.end749, label %lor.lhs.false709

lor.lhs.false709:                                 ; preds = %if.end706
  %conv710 = zext i32 %call2 to i64
  br label %while.body.i971

while.body.i971:                                  ; preds = %while.body.i971, %lor.lhs.false709
  %b.addr.0.i967 = phi i64 [ %conv129, %lor.lhs.false709 ], [ %rem.i969, %while.body.i971 ]
  %a.addr.0.i968 = phi i64 [ %conv710, %lor.lhs.false709 ], [ %b.addr.0.i967, %while.body.i971 ]
  %rem.i969 = srem i64 %a.addr.0.i968, %b.addr.0.i967
  %cmp.i970 = icmp eq i64 %rem.i969, 0
  br i1 %cmp.i970, label %gcd.exit972, label %while.body.i971

gcd.exit972:                                      ; preds = %while.body.i971
  %cmp714 = icmp eq i64 %b.addr.0.i967, %conv129
  br i1 %cmp714, label %lor.lhs.false716, label %if.end749

lor.lhs.false716:                                 ; preds = %gcd.exit972
  %conv717 = zext i32 %call3 to i64
  br label %while.body.i965

while.body.i965:                                  ; preds = %while.body.i965, %lor.lhs.false716
  %b.addr.0.i961 = phi i64 [ %conv129, %lor.lhs.false716 ], [ %rem.i963, %while.body.i965 ]
  %a.addr.0.i962 = phi i64 [ %conv717, %lor.lhs.false716 ], [ %b.addr.0.i961, %while.body.i965 ]
  %rem.i963 = srem i64 %a.addr.0.i962, %b.addr.0.i961
  %cmp.i964 = icmp eq i64 %rem.i963, 0
  br i1 %cmp.i964, label %gcd.exit966, label %while.body.i965

gcd.exit966:                                      ; preds = %while.body.i965
  %cmp721 = icmp eq i64 %b.addr.0.i961, %conv129
  br i1 %cmp721, label %while.body.i959, label %if.end749

while.body.i959:                                  ; preds = %gcd.exit966, %while.body.i959
  %b.addr.0.i955 = phi i64 [ %rem.i957, %while.body.i959 ], [ %conv129, %gcd.exit966 ]
  %a.addr.0.i956 = phi i64 [ %b.addr.0.i955, %while.body.i959 ], [ %conv130, %gcd.exit966 ]
  %rem.i957 = srem i64 %a.addr.0.i956, %b.addr.0.i955
  %cmp.i958 = icmp eq i64 %rem.i957, 0
  br i1 %cmp.i958, label %gcd.exit960, label %while.body.i959

gcd.exit960:                                      ; preds = %while.body.i959
  %cmp728 = icmp eq i64 %b.addr.0.i955, %conv129
  br i1 %cmp728, label %lor.lhs.false730, label %if.end749

lor.lhs.false730:                                 ; preds = %gcd.exit960
  %cmp733 = icmp eq i32 %rem67.pre-phi, %rem68
  %div735 = udiv i32 %call2, %cond27
  %div736 = udiv i32 %call, %cond27
  %rem737 = urem i32 %div735, %div736
  %div738 = udiv i32 %call3, %cond27
  %rem740 = urem i32 %div738, %div736
  %cmp741 = icmp eq i32 %rem737, %rem740
  %cmp743tmp = xor i1 %cmp733, %cmp741
  br i1 %cmp743tmp, label %if.then745, label %if.end749

if.then745:                                       ; preds = %lor.lhs.false730
  %call746 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([37 x i8]* @.str, i64 0, i64 0), i32 22, i32 0) nounwind
  %puts1239 = tail call i32 @puts(i8* getelementptr inbounds ([21 x i8]* @str29, i64 0, i64 0))
  %call748 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([54 x i8]* @.str2, i64 0, i64 0), i32 %call, i32 %call2, i32 %call3, i32 %call4, i32 %cond, i32 %cond17, i32 %cond27) nounwind
  br label %return

if.end749:                                        ; preds = %lor.lhs.false730, %gcd.exit960, %gcd.exit966, %gcd.exit972, %if.end706
  br i1 %cmp175, label %for.end, label %lor.lhs.false752

lor.lhs.false752:                                 ; preds = %if.end749
  %conv753 = zext i32 %call2 to i64
  br label %while.body.i953

while.body.i953:                                  ; preds = %while.body.i953, %lor.lhs.false752
  %b.addr.0.i949 = phi i64 [ %conv169, %lor.lhs.false752 ], [ %rem.i951, %while.body.i953 ]
  %a.addr.0.i950 = phi i64 [ %conv753, %lor.lhs.false752 ], [ %b.addr.0.i949, %while.body.i953 ]
  %rem.i951 = srem i64 %a.addr.0.i950, %b.addr.0.i949
  %cmp.i952 = icmp eq i64 %rem.i951, 0
  br i1 %cmp.i952, label %gcd.exit954, label %while.body.i953

gcd.exit954:                                      ; preds = %while.body.i953
  %cmp757 = icmp eq i64 %b.addr.0.i949, %conv169
  br i1 %cmp757, label %lor.lhs.false759, label %while.body.i935

lor.lhs.false759:                                 ; preds = %gcd.exit954
  %conv760 = zext i32 %call3 to i64
  br label %while.body.i947

while.body.i947:                                  ; preds = %while.body.i947, %lor.lhs.false759
  %b.addr.0.i943 = phi i64 [ %conv169, %lor.lhs.false759 ], [ %rem.i945, %while.body.i947 ]
  %a.addr.0.i944 = phi i64 [ %conv760, %lor.lhs.false759 ], [ %b.addr.0.i943, %while.body.i947 ]
  %rem.i945 = srem i64 %a.addr.0.i944, %b.addr.0.i943
  %cmp.i946 = icmp eq i64 %rem.i945, 0
  br i1 %cmp.i946, label %gcd.exit948, label %while.body.i947

gcd.exit948:                                      ; preds = %while.body.i947
  %cmp764 = icmp eq i64 %b.addr.0.i943, %conv169
  br i1 %cmp764, label %while.body.i941, label %while.body.i935

while.body.i941:                                  ; preds = %gcd.exit948, %while.body.i941
  %b.addr.0.i937 = phi i64 [ %rem.i939, %while.body.i941 ], [ %conv169, %gcd.exit948 ]
  %a.addr.0.i938 = phi i64 [ %b.addr.0.i937, %while.body.i941 ], [ %conv130, %gcd.exit948 ]
  %rem.i939 = srem i64 %a.addr.0.i938, %b.addr.0.i937
  %cmp.i940 = icmp eq i64 %rem.i939, 0
  br i1 %cmp.i940, label %gcd.exit942, label %while.body.i941

gcd.exit942:                                      ; preds = %while.body.i941
  %cmp771 = icmp eq i64 %b.addr.0.i937, %conv169
  br i1 %cmp771, label %lor.lhs.false773, label %while.body.i935

lor.lhs.false773:                                 ; preds = %gcd.exit942
  %cmp776 = icmp eq i32 %rem67.pre-phi, %rem68
  %div778 = udiv i32 %call2, %call4
  %div779 = udiv i32 %call, %call4
  %rem780 = urem i32 %div778, %div779
  %div781 = udiv i32 %call3, %call4
  %rem783 = urem i32 %div781, %div779
  %cmp784 = icmp eq i32 %rem780, %rem783
  %cmp786tmp = xor i1 %cmp776, %cmp784
  br i1 %cmp786tmp, label %if.then788, label %while.body.i935

if.then788:                                       ; preds = %lor.lhs.false773
  %call789 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([37 x i8]* @.str, i64 0, i64 0), i32 23, i32 0) nounwind
  %puts1240 = tail call i32 @puts(i8* getelementptr inbounds ([21 x i8]* @str29, i64 0, i64 0))
  %call791 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([54 x i8]* @.str2, i64 0, i64 0), i32 %call, i32 %call2, i32 %call3, i32 %call4, i32 %cond, i32 %cond17, i32 %cond27) nounwind
  br label %return

while.body.i935:                                  ; preds = %lor.lhs.false773, %gcd.exit942, %gcd.exit948, %gcd.exit954, %while.body.i935
  %b.addr.0.i931 = phi i64 [ %rem.i933, %while.body.i935 ], [ %conv169, %gcd.exit954 ], [ %conv169, %gcd.exit948 ], [ %conv169, %gcd.exit942 ], [ %conv169, %lor.lhs.false773 ]
  %a.addr.0.i932 = phi i64 [ %b.addr.0.i931, %while.body.i935 ], [ %conv130, %gcd.exit954 ], [ %conv130, %gcd.exit948 ], [ %conv130, %gcd.exit942 ], [ %conv130, %lor.lhs.false773 ]
  %rem.i933 = srem i64 %a.addr.0.i932, %b.addr.0.i931
  %cmp.i934 = icmp eq i64 %rem.i933, 0
  br i1 %cmp.i934, label %gcd.exit936, label %while.body.i935

gcd.exit936:                                      ; preds = %while.body.i935
  %cmp800 = icmp eq i64 %b.addr.0.i931, %conv169
  br i1 %cmp800, label %lor.lhs.false802, label %while.body.i929

lor.lhs.false802:                                 ; preds = %gcd.exit936
  %rem803 = urem i32 %cond, %call
  %rem804 = urem i32 %cond17, %call
  %cmp805 = icmp eq i32 %rem803, %rem804
  %rem807 = urem i32 %cond, %call4
  %rem808 = urem i32 %cond17, %call4
  %cmp809 = icmp eq i32 %rem807, %rem808
  %cmp811tmp = xor i1 %cmp805, %cmp809
  br i1 %cmp811tmp, label %if.then813, label %while.body.i929

if.then813:                                       ; preds = %lor.lhs.false802
  %call814 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([37 x i8]* @.str, i64 0, i64 0), i32 25, i32 0) nounwind
  %puts1241 = tail call i32 @puts(i8* getelementptr inbounds ([21 x i8]* @str29, i64 0, i64 0))
  %call816 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([54 x i8]* @.str2, i64 0, i64 0), i32 %call, i32 %call2, i32 %call3, i32 %call4, i32 %cond, i32 %cond17, i32 %cond27) nounwind
  br label %return

while.body.i929:                                  ; preds = %lor.lhs.false802, %gcd.exit936, %while.body.i929
  %b.addr.0.i925 = phi i64 [ %rem.i927, %while.body.i929 ], [ %conv169, %gcd.exit936 ], [ %conv169, %lor.lhs.false802 ]
  %a.addr.0.i926 = phi i64 [ %b.addr.0.i925, %while.body.i929 ], [ %conv130, %gcd.exit936 ], [ %conv130, %lor.lhs.false802 ]
  %rem.i927 = srem i64 %a.addr.0.i926, %b.addr.0.i925
  %cmp.i928 = icmp eq i64 %rem.i927, 0
  br i1 %cmp.i928, label %gcd.exit930, label %while.body.i929

gcd.exit930:                                      ; preds = %while.body.i929
  %cmp825 = icmp eq i64 %b.addr.0.i925, %conv169
  br i1 %cmp825, label %lor.lhs.false827, label %while.body.i923

lor.lhs.false827:                                 ; preds = %gcd.exit930
  %rem828 = urem i32 %cond, %call
  %cmp830 = icmp eq i32 %rem828, %rem68
  %rem832 = urem i32 %cond, %call4
  %rem833 = urem i32 %call3, %call4
  %cmp834 = icmp eq i32 %rem832, %rem833
  %cmp836tmp = xor i1 %cmp830, %cmp834
  br i1 %cmp836tmp, label %if.then838, label %while.body.i923

if.then838:                                       ; preds = %lor.lhs.false827
  %call839 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([37 x i8]* @.str, i64 0, i64 0), i32 27, i32 0) nounwind
  %puts1242 = tail call i32 @puts(i8* getelementptr inbounds ([21 x i8]* @str29, i64 0, i64 0))
  %call841 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([54 x i8]* @.str2, i64 0, i64 0), i32 %call, i32 %call2, i32 %call3, i32 %call4, i32 %cond, i32 %cond17, i32 %cond27) nounwind
  br label %return

while.body.i923:                                  ; preds = %lor.lhs.false827, %gcd.exit930, %while.body.i923
  %b.addr.0.i919 = phi i64 [ %rem.i921, %while.body.i923 ], [ %conv169, %gcd.exit930 ], [ %conv169, %lor.lhs.false827 ]
  %a.addr.0.i920 = phi i64 [ %b.addr.0.i919, %while.body.i923 ], [ %conv130, %gcd.exit930 ], [ %conv130, %lor.lhs.false827 ]
  %rem.i921 = srem i64 %a.addr.0.i920, %b.addr.0.i919
  %cmp.i922 = icmp eq i64 %rem.i921, 0
  br i1 %cmp.i922, label %gcd.exit924, label %while.body.i923

gcd.exit924:                                      ; preds = %while.body.i923
  %cmp850 = icmp eq i64 %b.addr.0.i919, %conv169
  br i1 %cmp850, label %lor.lhs.false852, label %while.body.i917

lor.lhs.false852:                                 ; preds = %gcd.exit924
  %rem854 = urem i32 %cond17, %call
  %cmp855 = icmp eq i32 %rem67.pre-phi, %rem854
  %rem857 = urem i32 %call2, %call4
  %rem858 = urem i32 %cond17, %call4
  %cmp859 = icmp eq i32 %rem857, %rem858
  %cmp861tmp = xor i1 %cmp855, %cmp859
  br i1 %cmp861tmp, label %if.then863, label %while.body.i917

if.then863:                                       ; preds = %lor.lhs.false852
  %call864 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([37 x i8]* @.str, i64 0, i64 0), i32 29, i32 0) nounwind
  %puts1243 = tail call i32 @puts(i8* getelementptr inbounds ([21 x i8]* @str29, i64 0, i64 0))
  %call866 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([54 x i8]* @.str2, i64 0, i64 0), i32 %call, i32 %call2, i32 %call3, i32 %call4, i32 %cond, i32 %cond17, i32 %cond27) nounwind
  br label %return

while.body.i917:                                  ; preds = %lor.lhs.false852, %gcd.exit924, %while.body.i917
  %b.addr.0.i913 = phi i64 [ %rem.i915, %while.body.i917 ], [ %conv169, %gcd.exit924 ], [ %conv169, %lor.lhs.false852 ]
  %a.addr.0.i914 = phi i64 [ %b.addr.0.i913, %while.body.i917 ], [ %conv130, %gcd.exit924 ], [ %conv130, %lor.lhs.false852 ]
  %rem.i915 = srem i64 %a.addr.0.i914, %b.addr.0.i913
  %cmp.i916 = icmp eq i64 %rem.i915, 0
  br i1 %cmp.i916, label %gcd.exit918, label %while.body.i917

gcd.exit918:                                      ; preds = %while.body.i917
  %cmp875 = icmp eq i64 %b.addr.0.i913, %conv169
  br i1 %cmp875, label %lor.lhs.false877, label %for.end

lor.lhs.false877:                                 ; preds = %gcd.exit918
  %cmp880 = icmp eq i32 %rem67.pre-phi, %rem68
  %rem882 = urem i32 %call2, %call4
  %rem883 = urem i32 %call3, %call4
  %cmp884 = icmp eq i32 %rem882, %rem883
  %cmp886tmp = xor i1 %cmp880, %cmp884
  br i1 %cmp886tmp, label %if.then888, label %for.end

if.then888:                                       ; preds = %lor.lhs.false877
  %call889 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([37 x i8]* @.str, i64 0, i64 0), i32 31, i32 0) nounwind
  %puts1244 = tail call i32 @puts(i8* getelementptr inbounds ([21 x i8]* @str29, i64 0, i64 0))
  %call891 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([54 x i8]* @.str2, i64 0, i64 0), i32 %call, i32 %call2, i32 %call3, i32 %call4, i32 %cond, i32 %cond17, i32 %cond27) nounwind
  br label %return

for.end:                                          ; preds = %if.end749, %lor.lhs.false877, %gcd.exit918
  %puts1245 = tail call i32 @puts(i8* getelementptr inbounds ([25 x i8]* @str30, i64 0, i64 0))
  br label %return

return:                                           ; preds = %for.end, %if.then888, %if.then863, %if.then838, %if.then813, %if.then788, %if.then745, %if.then702, %if.then659, %if.then616, %if.then573, %if.then530, %if.then487, %if.then444, %if.then404, %if.then364, %if.then324, %if.then284, %if.then244, %if.then204, %if.then164, %if.then124, %if.then105, %if.then82
  %retval.0 = phi i32 [ 1, %if.then888 ], [ 1, %if.then863 ], [ 1, %if.then838 ], [ 1, %if.then813 ], [ 1, %if.then788 ], [ 1, %if.then745 ], [ 1, %if.then702 ], [ 1, %if.then659 ], [ 1, %if.then616 ], [ 1, %if.then573 ], [ 1, %if.then530 ], [ 1, %if.then487 ], [ 1, %if.then444 ], [ 1, %if.then404 ], [ 1, %if.then364 ], [ 1, %if.then324 ], [ 1, %if.then284 ], [ 1, %if.then244 ], [ 1, %if.then204 ], [ 1, %if.then164 ], [ 1, %if.then124 ], [ 1, %if.then105 ], [ 1, %if.then82 ], [ 0, %for.end ]
  ret i32 %retval.0
}

declare i32 @rand() nounwind

declare i32 @printf(i8* nocapture, ...) nounwind

declare { i32, i1 } @llvm.uadd.with.overflow.i32(i32, i32) nounwind readnone

declare i32 @puts(i8* nocapture) nounwind
