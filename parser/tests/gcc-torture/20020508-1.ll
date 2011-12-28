; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20020508-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@uc = global i8 52, align 1
@us = global i16 -3532, align 2
@ui = global i32 62004, align 4
@ul = global i64 4063516280, align 8
@ull = global i64 1090791845765373680, align 8
@shift1 = global i32 4, align 4
@shift2 = global i32 60, align 4

define i32 @gnu_dev_major(i64 %__dev) nounwind uwtable inlinehint {
entry:
  %__dev.addr = alloca i64, align 8
  store i64 %__dev, i64* %__dev.addr, align 8
  %tmp = load i64* %__dev.addr, align 8
  %shr = lshr i64 %tmp, 8
  %and = and i64 %shr, 4095
  %tmp1 = load i64* %__dev.addr, align 8
  %shr2 = lshr i64 %tmp1, 32
  %conv = trunc i64 %shr2 to i32
  %and3 = and i32 %conv, -4096
  %conv4 = zext i32 %and3 to i64
  %or = or i64 %and, %conv4
  %conv5 = trunc i64 %or to i32
  ret i32 %conv5
}

define i32 @gnu_dev_minor(i64 %__dev) nounwind uwtable inlinehint {
entry:
  %__dev.addr = alloca i64, align 8
  store i64 %__dev, i64* %__dev.addr, align 8
  %tmp = load i64* %__dev.addr, align 8
  %and = and i64 %tmp, 255
  %tmp1 = load i64* %__dev.addr, align 8
  %shr = lshr i64 %tmp1, 12
  %conv = trunc i64 %shr to i32
  %and2 = and i32 %conv, -256
  %conv3 = zext i32 %and2 to i64
  %or = or i64 %and, %conv3
  %conv4 = trunc i64 %or to i32
  ret i32 %conv4
}

define i64 @gnu_dev_makedev(i32 %__major, i32 %__minor) nounwind uwtable inlinehint {
entry:
  %__major.addr = alloca i32, align 4
  %__minor.addr = alloca i32, align 4
  store i32 %__major, i32* %__major.addr, align 4
  store i32 %__minor, i32* %__minor.addr, align 4
  %tmp = load i32* %__minor.addr, align 4
  %and = and i32 %tmp, 255
  %tmp1 = load i32* %__major.addr, align 4
  %and2 = and i32 %tmp1, 4095
  %shl = shl i32 %and2, 8
  %or = or i32 %and, %shl
  %conv = zext i32 %or to i64
  %tmp3 = load i32* %__minor.addr, align 4
  %and4 = and i32 %tmp3, -256
  %conv5 = zext i32 %and4 to i64
  %shl6 = shl i64 %conv5, 12
  %or7 = or i64 %conv, %shl6
  %tmp8 = load i32* %__major.addr, align 4
  %and9 = and i32 %tmp8, -4096
  %conv10 = zext i32 %and9 to i64
  %shl11 = shl i64 %conv10, 32
  %or12 = or i64 %or7, %shl11
  ret i64 %or12
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  %tmp = load i8* @uc, align 1
  %conv = zext i8 %tmp to i32
  %tmp1 = load i32* @shift1, align 4
  %shr = ashr i32 %conv, %tmp1
  %tmp2 = load i8* @uc, align 1
  %conv3 = zext i8 %tmp2 to i32
  %tmp4 = load i32* @shift1, align 4
  %conv5 = sext i32 %tmp4 to i64
  %sub = sub i64 8, %conv5
  %sh_prom = trunc i64 %sub to i32
  %shl = shl i32 %conv3, %sh_prom
  %or = or i32 %shr, %shl
  %cmp = icmp ne i32 %or, 835
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  %tmp7 = load i8* @uc, align 1
  %conv8 = zext i8 %tmp7 to i32
  %shr9 = ashr i32 %conv8, 4
  %tmp10 = load i8* @uc, align 1
  %conv11 = zext i8 %tmp10 to i32
  %shl12 = shl i32 %conv11, 4
  %or13 = or i32 %shr9, %shl12
  %cmp14 = icmp ne i32 %or13, 835
  br i1 %cmp14, label %if.then16, label %if.end17

if.then16:                                        ; preds = %if.end
  call void @abort() noreturn nounwind
  unreachable

if.end17:                                         ; preds = %if.end
  %tmp18 = load i16* @us, align 2
  %conv19 = zext i16 %tmp18 to i32
  %tmp20 = load i32* @shift1, align 4
  %shr21 = ashr i32 %conv19, %tmp20
  %tmp22 = load i16* @us, align 2
  %conv23 = zext i16 %tmp22 to i32
  %tmp24 = load i32* @shift1, align 4
  %conv25 = sext i32 %tmp24 to i64
  %sub26 = sub i64 16, %conv25
  %sh_prom27 = trunc i64 %sub26 to i32
  %shl28 = shl i32 %conv23, %sh_prom27
  %or29 = or i32 %shr21, %shl28
  %cmp30 = icmp ne i32 %or29, 253972259
  br i1 %cmp30, label %if.then32, label %if.end33

if.then32:                                        ; preds = %if.end17
  call void @abort() noreturn nounwind
  unreachable

if.end33:                                         ; preds = %if.end17
  %tmp34 = load i16* @us, align 2
  %conv35 = zext i16 %tmp34 to i32
  %shr36 = ashr i32 %conv35, 4
  %tmp37 = load i16* @us, align 2
  %conv38 = zext i16 %tmp37 to i32
  %shl39 = shl i32 %conv38, 12
  %or40 = or i32 %shr36, %shl39
  %cmp41 = icmp ne i32 %or40, 253972259
  br i1 %cmp41, label %if.then43, label %if.end44

if.then43:                                        ; preds = %if.end33
  call void @abort() noreturn nounwind
  unreachable

if.end44:                                         ; preds = %if.end33
  %tmp45 = load i32* @ui, align 4
  %tmp46 = load i32* @shift1, align 4
  %shr47 = lshr i32 %tmp45, %tmp46
  %tmp48 = load i32* @ui, align 4
  %tmp49 = load i32* @shift1, align 4
  %conv50 = sext i32 %tmp49 to i64
  %sub51 = sub i64 32, %conv50
  %sh_prom52 = trunc i64 %sub51 to i32
  %shl53 = shl i32 %tmp48, %sh_prom52
  %or54 = or i32 %shr47, %shl53
  %cmp55 = icmp ne i32 %or54, 1073745699
  br i1 %cmp55, label %if.then57, label %if.end58

if.then57:                                        ; preds = %if.end44
  call void @abort() noreturn nounwind
  unreachable

if.end58:                                         ; preds = %if.end44
  %tmp59 = load i32* @ui, align 4
  %shr60 = lshr i32 %tmp59, 4
  %tmp61 = load i32* @ui, align 4
  %shl62 = shl i32 %tmp61, 28
  %or63 = or i32 %shr60, %shl62
  %cmp64 = icmp ne i32 %or63, 1073745699
  br i1 %cmp64, label %if.then66, label %if.end67

if.then66:                                        ; preds = %if.end58
  call void @abort() noreturn nounwind
  unreachable

if.end67:                                         ; preds = %if.end58
  %tmp68 = load i64* @ul, align 8
  %tmp69 = load i32* @shift1, align 4
  %sh_prom70 = zext i32 %tmp69 to i64
  %shr71 = lshr i64 %tmp68, %sh_prom70
  %tmp72 = load i64* @ul, align 8
  %tmp73 = load i32* @shift1, align 4
  %conv74 = sext i32 %tmp73 to i64
  %sub75 = sub i64 64, %conv74
  %shl76 = shl i64 %tmp72, %sub75
  %or77 = or i64 %shr71, %shl76
  %cmp78 = icmp ne i64 %or77, -9223372036600806041
  br i1 %cmp78, label %if.then80, label %if.end81

if.then80:                                        ; preds = %if.end67
  call void @abort() noreturn nounwind
  unreachable

if.end81:                                         ; preds = %if.end67
  %tmp82 = load i64* @ul, align 8
  %shr83 = lshr i64 %tmp82, 4
  %tmp84 = load i64* @ul, align 8
  %shl85 = shl i64 %tmp84, 60
  %or86 = or i64 %shr83, %shl85
  %cmp87 = icmp ne i64 %or86, -9223372036600806041
  br i1 %cmp87, label %if.then89, label %if.end90

if.then89:                                        ; preds = %if.end81
  call void @abort() noreturn nounwind
  unreachable

if.end90:                                         ; preds = %if.end81
  %tmp91 = load i64* @ull, align 8
  %tmp92 = load i32* @shift1, align 4
  %sh_prom93 = zext i32 %tmp92 to i64
  %shr94 = lshr i64 %tmp91, %sh_prom93
  %tmp95 = load i64* @ull, align 8
  %tmp96 = load i32* @shift1, align 4
  %conv97 = sext i32 %tmp96 to i64
  %sub98 = sub i64 64, %conv97
  %shl99 = shl i64 %tmp95, %sub98
  %or100 = or i64 %shr94, %shl99
  %cmp101 = icmp ne i64 %or100, 68174490360335855
  br i1 %cmp101, label %if.then103, label %if.end104

if.then103:                                       ; preds = %if.end90
  call void @abort() noreturn nounwind
  unreachable

if.end104:                                        ; preds = %if.end90
  %tmp105 = load i64* @ull, align 8
  %shr106 = lshr i64 %tmp105, 4
  %tmp107 = load i64* @ull, align 8
  %shl108 = shl i64 %tmp107, 60
  %or109 = or i64 %shr106, %shl108
  %cmp110 = icmp ne i64 %or109, 68174490360335855
  br i1 %cmp110, label %if.then112, label %if.end113

if.then112:                                       ; preds = %if.end104
  call void @abort() noreturn nounwind
  unreachable

if.end113:                                        ; preds = %if.end104
  %tmp114 = load i64* @ull, align 8
  %tmp115 = load i32* @shift2, align 4
  %sh_prom116 = zext i32 %tmp115 to i64
  %shr117 = lshr i64 %tmp114, %sh_prom116
  %tmp118 = load i64* @ull, align 8
  %tmp119 = load i32* @shift2, align 4
  %conv120 = sext i32 %tmp119 to i64
  %sub121 = sub i64 64, %conv120
  %shl122 = shl i64 %tmp118, %sub121
  %or123 = or i64 %shr117, %shl122
  %cmp124 = icmp ne i64 %or123, -994074541463572736
  br i1 %cmp124, label %if.then126, label %if.end127

if.then126:                                       ; preds = %if.end113
  call void @abort() noreturn nounwind
  unreachable

if.end127:                                        ; preds = %if.end113
  %tmp128 = load i64* @ull, align 8
  %shr129 = lshr i64 %tmp128, 60
  %tmp130 = load i64* @ull, align 8
  %shl131 = shl i64 %tmp130, 4
  %or132 = or i64 %shr129, %shl131
  %cmp133 = icmp ne i64 %or132, -994074541463572736
  br i1 %cmp133, label %if.then135, label %if.end136

if.then135:                                       ; preds = %if.end127
  call void @abort() noreturn nounwind
  unreachable

if.end136:                                        ; preds = %if.end127
  %tmp137 = load i8* @uc, align 1
  %conv138 = zext i8 %tmp137 to i32
  %tmp139 = load i32* @shift1, align 4
  %shl140 = shl i32 %conv138, %tmp139
  %tmp141 = load i8* @uc, align 1
  %conv142 = zext i8 %tmp141 to i32
  %tmp143 = load i32* @shift1, align 4
  %conv144 = sext i32 %tmp143 to i64
  %sub145 = sub i64 8, %conv144
  %sh_prom146 = trunc i64 %sub145 to i32
  %shr147 = ashr i32 %conv142, %sh_prom146
  %or148 = or i32 %shl140, %shr147
  %cmp149 = icmp ne i32 %or148, 835
  br i1 %cmp149, label %if.then151, label %if.end152

if.then151:                                       ; preds = %if.end136
  call void @abort() noreturn nounwind
  unreachable

if.end152:                                        ; preds = %if.end136
  %tmp153 = load i8* @uc, align 1
  %conv154 = zext i8 %tmp153 to i32
  %shl155 = shl i32 %conv154, 4
  %tmp156 = load i8* @uc, align 1
  %conv157 = zext i8 %tmp156 to i32
  %shr158 = ashr i32 %conv157, 4
  %or159 = or i32 %shl155, %shr158
  %cmp160 = icmp ne i32 %or159, 835
  br i1 %cmp160, label %if.then162, label %if.end163

if.then162:                                       ; preds = %if.end152
  call void @abort() noreturn nounwind
  unreachable

if.end163:                                        ; preds = %if.end152
  %tmp164 = load i16* @us, align 2
  %conv165 = zext i16 %tmp164 to i32
  %tmp166 = load i32* @shift1, align 4
  %shl167 = shl i32 %conv165, %tmp166
  %tmp168 = load i16* @us, align 2
  %conv169 = zext i16 %tmp168 to i32
  %tmp170 = load i32* @shift1, align 4
  %conv171 = sext i32 %tmp170 to i64
  %sub172 = sub i64 16, %conv171
  %sh_prom173 = trunc i64 %sub172 to i32
  %shr174 = ashr i32 %conv169, %sh_prom173
  %or175 = or i32 %shl167, %shr174
  %cmp176 = icmp ne i32 %or175, 992079
  br i1 %cmp176, label %if.then178, label %if.end179

if.then178:                                       ; preds = %if.end163
  call void @abort() noreturn nounwind
  unreachable

if.end179:                                        ; preds = %if.end163
  %tmp180 = load i16* @us, align 2
  %conv181 = zext i16 %tmp180 to i32
  %shl182 = shl i32 %conv181, 4
  %tmp183 = load i16* @us, align 2
  %conv184 = zext i16 %tmp183 to i32
  %shr185 = ashr i32 %conv184, 12
  %or186 = or i32 %shl182, %shr185
  %cmp187 = icmp ne i32 %or186, 992079
  br i1 %cmp187, label %if.then189, label %if.end190

if.then189:                                       ; preds = %if.end179
  call void @abort() noreturn nounwind
  unreachable

if.end190:                                        ; preds = %if.end179
  %tmp191 = load i32* @ui, align 4
  %tmp192 = load i32* @shift1, align 4
  %shl193 = shl i32 %tmp191, %tmp192
  %tmp194 = load i32* @ui, align 4
  %tmp195 = load i32* @shift1, align 4
  %conv196 = sext i32 %tmp195 to i64
  %sub197 = sub i64 32, %conv196
  %sh_prom198 = trunc i64 %sub197 to i32
  %shr199 = lshr i32 %tmp194, %sh_prom198
  %or200 = or i32 %shl193, %shr199
  %cmp201 = icmp ne i32 %or200, 992064
  br i1 %cmp201, label %if.then203, label %if.end204

if.then203:                                       ; preds = %if.end190
  call void @abort() noreturn nounwind
  unreachable

if.end204:                                        ; preds = %if.end190
  %tmp205 = load i32* @ui, align 4
  %shl206 = shl i32 %tmp205, 4
  %tmp207 = load i32* @ui, align 4
  %shr208 = lshr i32 %tmp207, 28
  %or209 = or i32 %shl206, %shr208
  %cmp210 = icmp ne i32 %or209, 992064
  br i1 %cmp210, label %if.then212, label %if.end213

if.then212:                                       ; preds = %if.end204
  call void @abort() noreturn nounwind
  unreachable

if.end213:                                        ; preds = %if.end204
  %tmp214 = load i64* @ul, align 8
  %tmp215 = load i32* @shift1, align 4
  %sh_prom216 = zext i32 %tmp215 to i64
  %shl217 = shl i64 %tmp214, %sh_prom216
  %tmp218 = load i64* @ul, align 8
  %tmp219 = load i32* @shift1, align 4
  %conv220 = sext i32 %tmp219 to i64
  %sub221 = sub i64 64, %conv220
  %shr222 = lshr i64 %tmp218, %sub221
  %or223 = or i64 %shl217, %shr222
  %cmp224 = icmp ne i64 %or223, 65016260480
  br i1 %cmp224, label %if.then226, label %if.end227

if.then226:                                       ; preds = %if.end213
  call void @abort() noreturn nounwind
  unreachable

if.end227:                                        ; preds = %if.end213
  %tmp228 = load i64* @ul, align 8
  %shl229 = shl i64 %tmp228, 4
  %tmp230 = load i64* @ul, align 8
  %shr231 = lshr i64 %tmp230, 60
  %or232 = or i64 %shl229, %shr231
  %cmp233 = icmp ne i64 %or232, 65016260480
  br i1 %cmp233, label %if.then235, label %if.end236

if.then235:                                       ; preds = %if.end227
  call void @abort() noreturn nounwind
  unreachable

if.end236:                                        ; preds = %if.end227
  %tmp237 = load i64* @ull, align 8
  %tmp238 = load i32* @shift1, align 4
  %sh_prom239 = zext i32 %tmp238 to i64
  %shl240 = shl i64 %tmp237, %sh_prom239
  %tmp241 = load i64* @ull, align 8
  %tmp242 = load i32* @shift1, align 4
  %conv243 = sext i32 %tmp242 to i64
  %sub244 = sub i64 64, %conv243
  %shr245 = lshr i64 %tmp241, %sub244
  %or246 = or i64 %shl240, %shr245
  %cmp247 = icmp ne i64 %or246, -994074541463572736
  br i1 %cmp247, label %if.then249, label %if.end250

if.then249:                                       ; preds = %if.end236
  call void @abort() noreturn nounwind
  unreachable

if.end250:                                        ; preds = %if.end236
  %tmp251 = load i64* @ull, align 8
  %shl252 = shl i64 %tmp251, 4
  %tmp253 = load i64* @ull, align 8
  %shr254 = lshr i64 %tmp253, 60
  %or255 = or i64 %shl252, %shr254
  %cmp256 = icmp ne i64 %or255, -994074541463572736
  br i1 %cmp256, label %if.then258, label %if.end259

if.then258:                                       ; preds = %if.end250
  call void @abort() noreturn nounwind
  unreachable

if.end259:                                        ; preds = %if.end250
  %tmp260 = load i64* @ull, align 8
  %tmp261 = load i32* @shift2, align 4
  %sh_prom262 = zext i32 %tmp261 to i64
  %shl263 = shl i64 %tmp260, %sh_prom262
  %tmp264 = load i64* @ull, align 8
  %tmp265 = load i32* @shift2, align 4
  %conv266 = sext i32 %tmp265 to i64
  %sub267 = sub i64 64, %conv266
  %shr268 = lshr i64 %tmp264, %sub267
  %or269 = or i64 %shl263, %shr268
  %cmp270 = icmp ne i64 %or269, 68174490360335855
  br i1 %cmp270, label %if.then272, label %if.end273

if.then272:                                       ; preds = %if.end259
  call void @abort() noreturn nounwind
  unreachable

if.end273:                                        ; preds = %if.end259
  %tmp274 = load i64* @ull, align 8
  %shl275 = shl i64 %tmp274, 60
  %tmp276 = load i64* @ull, align 8
  %shr277 = lshr i64 %tmp276, 4
  %or278 = or i64 %shl275, %shr277
  %cmp279 = icmp ne i64 %or278, 68174490360335855
  br i1 %cmp279, label %if.then281, label %if.end282

if.then281:                                       ; preds = %if.end273
  call void @abort() noreturn nounwind
  unreachable

if.end282:                                        ; preds = %if.end273
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
