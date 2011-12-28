; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith000376.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
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
entry:
  %l_247 = alloca i8, align 1
  %l_249 = alloca i32**, align 8
  %l_248 = alloca i32, align 4
  %l_250 = alloca i64, align 8
  %l_251 = alloca i32, align 4
  store i8 98, i8* %l_247, align 1
  store i32** @g_111, i32*** %l_249, align 8
  store i32 -11, i32* @g_2, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp = load i32* @g_2, align 4
  %cmp = icmp eq i32 %tmp, 0
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  store i32 9, i32* %l_248, align 4
  store i64 3215530268210909360, i64* %l_250, align 8
  store i32 1, i32* %l_251, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %tmp4 = load i32* @g_2, align 4
  %call = call i32 @safe_sub_func_int32_t_s_s(i32 %tmp4, i32 1)
  store i32 %call, i32* @g_2, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %tmp5 = load i8* @g_41, align 1
  %conv = sext i8 %tmp5 to i32
  ret i32 %conv
}

define internal i32 @safe_sub_func_int32_t_s_s(i32 %si1, i32 %si2) nounwind uwtable {
entry:
  %si1.addr = alloca i32, align 4
  %si2.addr = alloca i32, align 4
  store i32 %si1, i32* %si1.addr, align 4
  store i32 %si2, i32* %si2.addr, align 4
  %tmp = load i32* %si1.addr, align 4
  %tmp1 = load i32* %si2.addr, align 4
  %xor = xor i32 %tmp, %tmp1
  %tmp2 = load i32* %si1.addr, align 4
  %tmp3 = load i32* %si1.addr, align 4
  %tmp4 = load i32* %si2.addr, align 4
  %xor5 = xor i32 %tmp3, %tmp4
  %and = and i32 %xor5, -2147483648
  %xor6 = xor i32 %tmp2, %and
  %tmp7 = load i32* %si2.addr, align 4
  %sub = sub nsw i32 %xor6, %tmp7
  %tmp8 = load i32* %si2.addr, align 4
  %xor9 = xor i32 %sub, %tmp8
  %and10 = and i32 %xor, %xor9
  %cmp = icmp slt i32 %and10, 0
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %tmp11 = load i32* %si1.addr, align 4
  br label %cond.end

cond.false:                                       ; preds = %entry
  %tmp12 = load i32* %si1.addr, align 4
  %tmp13 = load i32* %si2.addr, align 4
  %sub14 = sub nsw i32 %tmp12, %tmp13
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %tmp11, %cond.true ], [ %sub14, %cond.false ]
  ret i32 %cond
}

define i32 @func_7(i64 %p_8, i32 %p_9, i64 %p_10, i32 %p_11, i64 %p_12) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %p_8.addr = alloca i64, align 8
  %p_9.addr = alloca i32, align 4
  %p_10.addr = alloca i64, align 8
  %p_11.addr = alloca i32, align 4
  %p_12.addr = alloca i64, align 8
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
  %i193 = alloca i32, align 4
  store i64 %p_8, i64* %p_8.addr, align 8
  store i32 %p_9, i32* %p_9.addr, align 4
  store i64 %p_10, i64* %p_10.addr, align 8
  store i32 %p_11, i32* %p_11.addr, align 4
  store i64 %p_12, i64* %p_12.addr, align 8
  store i32 407751808, i32* %l_17, align 4
  store i32* @g_2, i32** %l_86, align 8
  %tmp = load i64* %p_10.addr, align 8
  %conv = trunc i64 %tmp to i16
  %tmp1 = load i32* @g_2, align 4
  %tobool = icmp ne i32 %tmp1, 0
  br i1 %tobool, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %entry
  %tmp2 = load i64* %p_12.addr, align 8
  %tobool3 = icmp ne i64 %tmp2, 0
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %entry
  %0 = phi i1 [ true, %entry ], [ %tobool3, %lor.rhs ]
  %lor.ext = zext i1 %0 to i32
  %tmp4 = load i32* %l_17, align 4
  %conv5 = trunc i32 %tmp4 to i16
  %tmp6 = load i32* @g_2, align 4
  %conv7 = trunc i32 %tmp6 to i16
  %call = call zeroext i16 @safe_mod_func_uint16_t_u_u(i16 zeroext %conv5, i16 zeroext %conv7)
  %conv8 = zext i16 %call to i32
  %cmp = icmp sgt i32 %lor.ext, %conv8
  %conv9 = zext i1 %cmp to i32
  %call10 = call signext i16 @safe_lshift_func_int16_t_s_u(i16 signext %conv, i32 %conv9)
  %conv11 = sext i16 %call10 to i32
  %tobool12 = icmp ne i32 %conv11, 0
  br i1 %tobool12, label %land.rhs, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %lor.end
  %tmp13 = load i16* @g_18, align 2
  %conv14 = sext i16 %tmp13 to i32
  %tmp15 = load i32* %p_9.addr, align 4
  %cmp16 = icmp eq i32 %conv14, %tmp15
  br i1 %cmp16, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %lor.lhs.false, %lor.end
  %tmp18 = load i32* %l_17, align 4
  %tobool19 = icmp ne i32 %tmp18, 0
  br label %land.end

land.end:                                         ; preds = %land.rhs, %lor.lhs.false
  %1 = phi i1 [ false, %lor.lhs.false ], [ %tobool19, %land.rhs ]
  %land.ext = zext i1 %1 to i32
  %tmp20 = load i32* %l_17, align 4
  %tobool21 = icmp ne i32 %tmp20, 0
  %lnot = xor i1 %tobool21, true
  %lnot.ext = zext i1 %lnot to i32
  %cmp22 = icmp eq i32 %land.ext, %lnot.ext
  br i1 %cmp22, label %if.then, label %if.else

if.then:                                          ; preds = %land.end
  store i64 263208857363062774, i64* %l_105, align 8
  store i32* @g_2, i32** %l_106, align 8
  store i32* @g_112, i32** %l_131, align 8
  store i16 11187, i16* %l_174, align 2
  store i32 1, i32* %l_208, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc88, %if.then
  %tmp39 = load i32* %i, align 4
  %cmp40 = icmp slt i32 %tmp39, 2
  br i1 %cmp40, label %for.body, label %for.end91

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4
  br label %for.cond42

for.cond42:                                       ; preds = %for.inc84, %for.body
  %tmp43 = load i32* %j, align 4
  %cmp44 = icmp slt i32 %tmp43, 1
  br i1 %cmp44, label %for.body46, label %for.end87

for.body46:                                       ; preds = %for.cond42
  store i32 0, i32* %k, align 4
  br label %for.cond47

for.cond47:                                       ; preds = %for.inc80, %for.body46
  %tmp48 = load i32* %k, align 4
  %cmp49 = icmp slt i32 %tmp48, 7
  br i1 %cmp49, label %for.body51, label %for.end83

for.body51:                                       ; preds = %for.cond47
  store i32 0, i32* %l, align 4
  br label %for.cond52

for.cond52:                                       ; preds = %for.inc76, %for.body51
  %tmp53 = load i32* %l, align 4
  %cmp54 = icmp slt i32 %tmp53, 1
  br i1 %cmp54, label %for.body56, label %for.end79

for.body56:                                       ; preds = %for.cond52
  store i32 0, i32* %m, align 4
  br label %for.cond57

for.cond57:                                       ; preds = %for.inc, %for.body56
  %tmp58 = load i32* %m, align 4
  %cmp59 = icmp slt i32 %tmp58, 1
  br i1 %cmp59, label %for.body61, label %for.end

for.body61:                                       ; preds = %for.cond57
  %tmp62 = load i32* %m, align 4
  %idxprom = sext i32 %tmp62 to i64
  %tmp63 = load i32* %l, align 4
  %idxprom64 = sext i32 %tmp63 to i64
  %tmp65 = load i32* %k, align 4
  %idxprom66 = sext i32 %tmp65 to i64
  %tmp67 = load i32* %j, align 4
  %idxprom68 = sext i32 %tmp67 to i64
  %tmp69 = load i32* %i, align 4
  %idxprom70 = sext i32 %tmp69 to i64
  %arrayidx = getelementptr inbounds [2 x [1 x [7 x [1 x [1 x i32**]]]]]* %l_136, i32 0, i64 %idxprom70
  %arrayidx71 = getelementptr inbounds [1 x [7 x [1 x [1 x i32**]]]]* %arrayidx, i32 0, i64 %idxprom68
  %arrayidx72 = getelementptr inbounds [7 x [1 x [1 x i32**]]]* %arrayidx71, i32 0, i64 %idxprom66
  %arrayidx73 = getelementptr inbounds [1 x [1 x i32**]]* %arrayidx72, i32 0, i64 %idxprom64
  %arrayidx74 = getelementptr inbounds [1 x i32**]* %arrayidx73, i32 0, i64 %idxprom
  store i32** %l_106, i32*** %arrayidx74, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body61
  %tmp75 = load i32* %m, align 4
  %inc = add nsw i32 %tmp75, 1
  store i32 %inc, i32* %m, align 4
  br label %for.cond57

for.end:                                          ; preds = %for.cond57
  br label %for.inc76

for.inc76:                                        ; preds = %for.end
  %tmp77 = load i32* %l, align 4
  %inc78 = add nsw i32 %tmp77, 1
  store i32 %inc78, i32* %l, align 4
  br label %for.cond52

for.end79:                                        ; preds = %for.cond52
  br label %for.inc80

for.inc80:                                        ; preds = %for.end79
  %tmp81 = load i32* %k, align 4
  %inc82 = add nsw i32 %tmp81, 1
  store i32 %inc82, i32* %k, align 4
  br label %for.cond47

for.end83:                                        ; preds = %for.cond47
  br label %for.inc84

for.inc84:                                        ; preds = %for.end83
  %tmp85 = load i32* %j, align 4
  %inc86 = add nsw i32 %tmp85, 1
  store i32 %inc86, i32* %j, align 4
  br label %for.cond42

for.end87:                                        ; preds = %for.cond42
  br label %for.inc88

for.inc88:                                        ; preds = %for.end87
  %tmp89 = load i32* %i, align 4
  %inc90 = add nsw i32 %tmp89, 1
  store i32 %inc90, i32* %i, align 4
  br label %for.cond

for.end91:                                        ; preds = %for.cond
  store i32 0, i32* %i, align 4
  br label %for.cond92

for.cond92:                                       ; preds = %for.inc184, %for.end91
  %tmp93 = load i32* %i, align 4
  %cmp94 = icmp slt i32 %tmp93, 7
  br i1 %cmp94, label %for.body96, label %for.end187

for.body96:                                       ; preds = %for.cond92
  store i32 0, i32* %j, align 4
  br label %for.cond97

for.cond97:                                       ; preds = %for.inc180, %for.body96
  %tmp98 = load i32* %j, align 4
  %cmp99 = icmp slt i32 %tmp98, 1
  br i1 %cmp99, label %for.body101, label %for.end183

for.body101:                                      ; preds = %for.cond97
  store i32 0, i32* %k, align 4
  br label %for.cond102

for.cond102:                                      ; preds = %for.inc176, %for.body101
  %tmp103 = load i32* %k, align 4
  %cmp104 = icmp slt i32 %tmp103, 4
  br i1 %cmp104, label %for.body106, label %for.end179

for.body106:                                      ; preds = %for.cond102
  store i32 0, i32* %l, align 4
  br label %for.cond107

for.cond107:                                      ; preds = %for.inc172, %for.body106
  %tmp108 = load i32* %l, align 4
  %cmp109 = icmp slt i32 %tmp108, 3
  br i1 %cmp109, label %for.body111, label %for.end175

for.body111:                                      ; preds = %for.cond107
  store i32 0, i32* %m, align 4
  br label %for.cond112

for.cond112:                                      ; preds = %for.inc168, %for.body111
  %tmp113 = load i32* %m, align 4
  %cmp114 = icmp slt i32 %tmp113, 1
  br i1 %cmp114, label %for.body116, label %for.end171

for.body116:                                      ; preds = %for.cond112
  store i32 0, i32* %n, align 4
  br label %for.cond117

for.cond117:                                      ; preds = %for.inc164, %for.body116
  %tmp118 = load i32* %n, align 4
  %cmp119 = icmp slt i32 %tmp118, 1
  br i1 %cmp119, label %for.body121, label %for.end167

for.body121:                                      ; preds = %for.cond117
  store i32 0, i32* %o, align 4
  br label %for.cond122

for.cond122:                                      ; preds = %for.inc160, %for.body121
  %tmp123 = load i32* %o, align 4
  %cmp124 = icmp slt i32 %tmp123, 1
  br i1 %cmp124, label %for.body126, label %for.end163

for.body126:                                      ; preds = %for.cond122
  store i32 0, i32* %p, align 4
  br label %for.cond127

for.cond127:                                      ; preds = %for.inc156, %for.body126
  %tmp128 = load i32* %p, align 4
  %cmp129 = icmp slt i32 %tmp128, 1
  br i1 %cmp129, label %for.body131, label %for.end159

for.body131:                                      ; preds = %for.cond127
  %tmp132 = load i32* %p, align 4
  %idxprom133 = sext i32 %tmp132 to i64
  %tmp134 = load i32* %o, align 4
  %idxprom135 = sext i32 %tmp134 to i64
  %tmp136 = load i32* %n, align 4
  %idxprom137 = sext i32 %tmp136 to i64
  %tmp138 = load i32* %m, align 4
  %idxprom139 = sext i32 %tmp138 to i64
  %tmp140 = load i32* %l, align 4
  %idxprom141 = sext i32 %tmp140 to i64
  %tmp142 = load i32* %k, align 4
  %idxprom143 = sext i32 %tmp142 to i64
  %tmp144 = load i32* %j, align 4
  %idxprom145 = sext i32 %tmp144 to i64
  %tmp146 = load i32* %i, align 4
  %idxprom147 = sext i32 %tmp146 to i64
  %arrayidx148 = getelementptr inbounds [7 x [1 x [4 x [3 x [1 x [1 x [1 x [1 x i64]]]]]]]]* %l_199, i32 0, i64 %idxprom147
  %arrayidx149 = getelementptr inbounds [1 x [4 x [3 x [1 x [1 x [1 x [1 x i64]]]]]]]* %arrayidx148, i32 0, i64 %idxprom145
  %arrayidx150 = getelementptr inbounds [4 x [3 x [1 x [1 x [1 x [1 x i64]]]]]]* %arrayidx149, i32 0, i64 %idxprom143
  %arrayidx151 = getelementptr inbounds [3 x [1 x [1 x [1 x [1 x i64]]]]]* %arrayidx150, i32 0, i64 %idxprom141
  %arrayidx152 = getelementptr inbounds [1 x [1 x [1 x [1 x i64]]]]* %arrayidx151, i32 0, i64 %idxprom139
  %arrayidx153 = getelementptr inbounds [1 x [1 x [1 x i64]]]* %arrayidx152, i32 0, i64 %idxprom137
  %arrayidx154 = getelementptr inbounds [1 x [1 x i64]]* %arrayidx153, i32 0, i64 %idxprom135
  %arrayidx155 = getelementptr inbounds [1 x i64]* %arrayidx154, i32 0, i64 %idxprom133
  store i64 -7857288773594412158, i64* %arrayidx155, align 8
  br label %for.inc156

for.inc156:                                       ; preds = %for.body131
  %tmp157 = load i32* %p, align 4
  %inc158 = add nsw i32 %tmp157, 1
  store i32 %inc158, i32* %p, align 4
  br label %for.cond127

for.end159:                                       ; preds = %for.cond127
  br label %for.inc160

for.inc160:                                       ; preds = %for.end159
  %tmp161 = load i32* %o, align 4
  %inc162 = add nsw i32 %tmp161, 1
  store i32 %inc162, i32* %o, align 4
  br label %for.cond122

for.end163:                                       ; preds = %for.cond122
  br label %for.inc164

for.inc164:                                       ; preds = %for.end163
  %tmp165 = load i32* %n, align 4
  %inc166 = add nsw i32 %tmp165, 1
  store i32 %inc166, i32* %n, align 4
  br label %for.cond117

for.end167:                                       ; preds = %for.cond117
  br label %for.inc168

for.inc168:                                       ; preds = %for.end167
  %tmp169 = load i32* %m, align 4
  %inc170 = add nsw i32 %tmp169, 1
  store i32 %inc170, i32* %m, align 4
  br label %for.cond112

for.end171:                                       ; preds = %for.cond112
  br label %for.inc172

for.inc172:                                       ; preds = %for.end171
  %tmp173 = load i32* %l, align 4
  %inc174 = add nsw i32 %tmp173, 1
  store i32 %inc174, i32* %l, align 4
  br label %for.cond107

for.end175:                                       ; preds = %for.cond107
  br label %for.inc176

for.inc176:                                       ; preds = %for.end175
  %tmp177 = load i32* %k, align 4
  %inc178 = add nsw i32 %tmp177, 1
  store i32 %inc178, i32* %k, align 4
  br label %for.cond102

for.end179:                                       ; preds = %for.cond102
  br label %for.inc180

for.inc180:                                       ; preds = %for.end179
  %tmp181 = load i32* %j, align 4
  %inc182 = add nsw i32 %tmp181, 1
  store i32 %inc182, i32* %j, align 4
  br label %for.cond97

for.end183:                                       ; preds = %for.cond97
  br label %for.inc184

for.inc184:                                       ; preds = %for.end183
  %tmp185 = load i32* %i, align 4
  %inc186 = add nsw i32 %tmp185, 1
  store i32 %inc186, i32* %i, align 4
  br label %for.cond92

for.end187:                                       ; preds = %for.cond92
  %tmp188 = load i32** %l_106, align 8
  store i32* %tmp188, i32** %l_106, align 8
  br label %if.end282

if.else:                                          ; preds = %land.end
  store i32* null, i32** %l_243, align 8
  store i32* @g_166, i32** %l_244, align 8
  store i16 -9, i16* %l_246, align 2
  br label %lbl_240

lbl_240:                                          ; preds = %if.then211, %if.else
  %tmp194 = load i32* %p_9.addr, align 4
  %tmp195 = load i32** @g_111, align 8
  store i32 %tmp194, i32* %tmp195
  store i16 1, i16* @g_18, align 2
  br label %for.cond196

for.cond196:                                      ; preds = %for.inc238, %lbl_240
  %tmp197 = load i16* @g_18, align 2
  %conv198 = sext i16 %tmp197 to i32
  %cmp199 = icmp slt i32 %conv198, 2
  br i1 %cmp199, label %for.body201, label %for.end242

for.body201:                                      ; preds = %for.cond196
  %tmp202 = load i32** @g_111, align 8
  %tmp203 = load i32* %tmp202
  %call204 = call signext i16 @safe_unary_minus_func_int16_t_s(i16 signext -11344)
  %conv205 = sext i16 %call204 to i32
  %xor = xor i32 %tmp203, %conv205
  %conv206 = trunc i32 %xor to i8
  %call207 = call zeroext i8 @safe_sub_func_uint8_t_u_u(i8 zeroext %conv206, i8 zeroext 1)
  %conv208 = zext i8 %call207 to i32
  store i32 %conv208, i32* %p_9.addr, align 4
  %tmp209 = load i64* %p_10.addr, align 8
  %tobool210 = icmp ne i64 %tmp209, 0
  br i1 %tobool210, label %if.then211, label %if.end

if.then211:                                       ; preds = %for.body201
  br label %lbl_240

if.end:                                           ; preds = %for.body201
  %tmp212 = load i16* @g_18, align 2
  %conv213 = zext i16 %tmp212 to i32
  %rem = srem i32 %conv213, 2
  %idxprom214 = sext i32 %rem to i64
  %arrayidx215 = getelementptr inbounds [2 x i32*]* @g_48, i32 0, i64 %idxprom214
  %tmp216 = volatile load i32** %arrayidx215, align 8
  %tmp217 = load i32*** @g_180, align 8
  volatile store i32* %tmp216, i32** %tmp217
  store i32 0, i32* @g_2, align 4
  br label %for.cond218

for.cond218:                                      ; preds = %for.inc228, %if.end
  %tmp219 = load i32* @g_2, align 4
  %cmp220 = icmp sle i32 %tmp219, -23
  br i1 %cmp220, label %for.body222, label %for.end233

for.body222:                                      ; preds = %for.cond218
  %tmp223 = load i64* %p_12.addr, align 8
  %tobool224 = icmp ne i64 %tmp223, 0
  br i1 %tobool224, label %if.then225, label %if.end226

if.then225:                                       ; preds = %for.body222
  br label %for.end233

if.end226:                                        ; preds = %for.body222
  %tmp227 = load i32*** @g_180, align 8
  volatile store i32* %p_9.addr, i32** %tmp227
  br label %for.inc228

for.inc228:                                       ; preds = %if.end226
  %tmp229 = load i32* @g_2, align 4
  %conv230 = sext i32 %tmp229 to i64
  %call231 = call i64 @safe_sub_func_uint64_t_u_u(i64 %conv230, i64 3)
  %conv232 = trunc i64 %call231 to i32
  store i32 %conv232, i32* @g_2, align 4
  br label %for.cond218

for.end233:                                       ; preds = %if.then225, %for.cond218
  %tmp234 = load i32* @g_112, align 4
  %tobool235 = icmp ne i32 %tmp234, 0
  br i1 %tobool235, label %if.then236, label %if.end237

if.then236:                                       ; preds = %for.end233
  br label %lbl_245

if.end237:                                        ; preds = %for.end233
  br label %for.inc238

for.inc238:                                       ; preds = %if.end237
  %tmp239 = load i16* @g_18, align 2
  %conv240 = sext i16 %tmp239 to i32
  %add = add nsw i32 %conv240, 2
  %conv241 = trunc i32 %add to i16
  store i16 %conv241, i16* @g_18, align 2
  br label %for.cond196

for.end242:                                       ; preds = %for.cond196
  br label %lbl_245

lbl_245:                                          ; preds = %for.end242, %if.then236
  %tmp243 = load i16* @g_18, align 2
  %conv244 = zext i16 %tmp243 to i32
  %rem245 = srem i32 %conv244, 2
  %idxprom246 = sext i32 %rem245 to i64
  %arrayidx247 = getelementptr inbounds [2 x i32*]* @g_48, i32 0, i64 %idxprom246
  %tmp248 = volatile load i32** %arrayidx247, align 8
  %tmp249 = load i32*** @g_110, align 8
  %tmp250 = load i32** %tmp249
  %cmp251 = icmp ne i32* %tmp248, %tmp250
  %conv252 = zext i1 %cmp251 to i32
  %conv253 = sext i32 %conv252 to i64
  %cmp254 = icmp sgt i64 %conv253, -1
  br i1 %cmp254, label %land.rhs256, label %land.end263

land.rhs256:                                      ; preds = %lbl_245
  %tmp257 = load i8* @g_41, align 1
  %conv258 = sext i8 %tmp257 to i32
  %tmp259 = load i32** @g_85, align 8
  %call260 = call i32* @func_87(i32 %conv258, i32* %tmp259)
  %call261 = call i32 @func_80(i32* %call260)
  %tobool262 = icmp ne i32 %call261, 0
  br label %land.end263

land.end263:                                      ; preds = %land.rhs256, %lbl_245
  %2 = phi i1 [ false, %lbl_245 ], [ %tobool262, %land.rhs256 ]
  %land.ext264 = zext i1 %2 to i32
  %tmp265 = load i32** @g_111, align 8
  %tmp266 = load i32* %tmp265
  %cmp267 = icmp sle i32 %land.ext264, %tmp266
  %conv268 = zext i1 %cmp267 to i32
  %tmp269 = load i32** %l_244, align 8
  %tmp270 = load i32* %tmp269
  %or = or i32 %tmp270, %conv268
  store i32 %or, i32* %tmp269
  store i64 0, i64* %p_10.addr, align 8
  br label %for.cond271

for.cond271:                                      ; preds = %for.inc278, %land.end263
  %tmp272 = load i64* %p_10.addr, align 8
  %cmp273 = icmp ult i64 %tmp272, 2
  br i1 %cmp273, label %for.body275, label %for.end281

for.body275:                                      ; preds = %for.cond271
  %tmp276 = load i16* %l_246, align 2
  %conv277 = sext i16 %tmp276 to i32
  store i32 %conv277, i32* %retval
  br label %return

for.inc278:                                       ; No predecessors!
  %tmp279 = load i64* %p_10.addr, align 8
  %add280 = add i64 %tmp279, 1
  store i64 %add280, i64* %p_10.addr, align 8
  br label %for.cond271

for.end281:                                       ; preds = %for.cond271
  br label %if.end282

if.end282:                                        ; preds = %for.end281, %for.end187
  %tmp283 = load i32** %l_86, align 8
  %tmp284 = load i32* %tmp283
  store i32 %tmp284, i32* %retval
  br label %return

return:                                           ; preds = %if.end282, %for.body275
  %3 = load i32* %retval
  ret i32 %3
}

define internal signext i16 @safe_lshift_func_int16_t_s_u(i16 signext %left, i32 %right) nounwind uwtable {
entry:
  %left.addr = alloca i16, align 2
  %right.addr = alloca i32, align 4
  store i16 %left, i16* %left.addr, align 2
  store i32 %right, i32* %right.addr, align 4
  %tmp = load i16* %left.addr, align 2
  %conv = sext i16 %tmp to i32
  %cmp = icmp slt i32 %conv, 0
  br i1 %cmp, label %cond.true, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %tmp2 = load i32* %right.addr, align 4
  %cmp3 = icmp uge i32 %tmp2, 32
  br i1 %cmp3, label %cond.true, label %lor.lhs.false5

lor.lhs.false5:                                   ; preds = %lor.lhs.false
  %tmp6 = load i16* %left.addr, align 2
  %conv7 = sext i16 %tmp6 to i32
  %tmp8 = load i32* %right.addr, align 4
  %shr = ashr i32 32767, %tmp8
  %cmp9 = icmp sgt i32 %conv7, %shr
  br i1 %cmp9, label %cond.true, label %cond.false

cond.true:                                        ; preds = %lor.lhs.false5, %lor.lhs.false, %entry
  %tmp11 = load i16* %left.addr, align 2
  %conv12 = sext i16 %tmp11 to i32
  br label %cond.end

cond.false:                                       ; preds = %lor.lhs.false5
  %tmp13 = load i16* %left.addr, align 2
  %conv14 = sext i16 %tmp13 to i32
  %tmp15 = load i32* %right.addr, align 4
  %shl = shl i32 %conv14, %tmp15
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %conv12, %cond.true ], [ %shl, %cond.false ]
  %conv16 = trunc i32 %cond to i16
  ret i16 %conv16
}

define internal zeroext i16 @safe_mod_func_uint16_t_u_u(i16 zeroext %ui1, i16 zeroext %ui2) nounwind uwtable {
entry:
  %ui1.addr = alloca i16, align 2
  %ui2.addr = alloca i16, align 2
  store i16 %ui1, i16* %ui1.addr, align 2
  store i16 %ui2, i16* %ui2.addr, align 2
  %tmp = load i16* %ui2.addr, align 2
  %conv = zext i16 %tmp to i32
  %cmp = icmp eq i32 %conv, 0
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %tmp2 = load i16* %ui1.addr, align 2
  %conv3 = zext i16 %tmp2 to i32
  br label %cond.end

cond.false:                                       ; preds = %entry
  %tmp4 = load i16* %ui1.addr, align 2
  %conv5 = zext i16 %tmp4 to i32
  %tmp6 = load i16* %ui2.addr, align 2
  %conv7 = zext i16 %tmp6 to i32
  %rem = srem i32 %conv5, %conv7
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %conv3, %cond.true ], [ %rem, %cond.false ]
  %conv8 = trunc i32 %cond to i16
  ret i16 %conv8
}

define internal zeroext i8 @safe_sub_func_uint8_t_u_u(i8 zeroext %ui1, i8 zeroext %ui2) nounwind uwtable {
entry:
  %ui1.addr = alloca i8, align 1
  %ui2.addr = alloca i8, align 1
  store i8 %ui1, i8* %ui1.addr, align 1
  store i8 %ui2, i8* %ui2.addr, align 1
  %tmp = load i8* %ui1.addr, align 1
  %conv = zext i8 %tmp to i32
  %tmp1 = load i8* %ui2.addr, align 1
  %conv2 = zext i8 %tmp1 to i32
  %sub = sub nsw i32 %conv, %conv2
  %conv3 = trunc i32 %sub to i8
  ret i8 %conv3
}

define internal signext i16 @safe_unary_minus_func_int16_t_s(i16 signext %si) nounwind uwtable {
entry:
  %si.addr = alloca i16, align 2
  store i16 %si, i16* %si.addr, align 2
  %tmp = load i16* %si.addr, align 2
  %conv = sext i16 %tmp to i32
  %sub = sub nsw i32 0, %conv
  %conv1 = trunc i32 %sub to i16
  ret i16 %conv1
}

define internal i64 @safe_sub_func_uint64_t_u_u(i64 %ui1, i64 %ui2) nounwind uwtable {
entry:
  %ui1.addr = alloca i64, align 8
  %ui2.addr = alloca i64, align 8
  store i64 %ui1, i64* %ui1.addr, align 8
  store i64 %ui2, i64* %ui2.addr, align 8
  %tmp = load i64* %ui1.addr, align 8
  %tmp1 = load i64* %ui2.addr, align 8
  %sub = sub i64 %tmp, %tmp1
  ret i64 %sub
}

define i32 @func_80(i32* %p_81) nounwind uwtable {
entry:
  %p_81.addr = alloca i32*, align 8
  %l_82 = alloca [10 x [10 x [1 x i32]]], align 16
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  store i32* %p_81, i32** %p_81.addr, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc21, %entry
  %tmp = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp, 10
  br i1 %cmp, label %for.body, label %for.end24

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc17, %for.body
  %tmp2 = load i32* %j, align 4
  %cmp3 = icmp slt i32 %tmp2, 10
  br i1 %cmp3, label %for.body4, label %for.end20

for.body4:                                        ; preds = %for.cond1
  store i32 0, i32* %k, align 4
  br label %for.cond5

for.cond5:                                        ; preds = %for.inc, %for.body4
  %tmp6 = load i32* %k, align 4
  %cmp7 = icmp slt i32 %tmp6, 1
  br i1 %cmp7, label %for.body8, label %for.end

for.body8:                                        ; preds = %for.cond5
  %tmp9 = load i32* %k, align 4
  %idxprom = sext i32 %tmp9 to i64
  %tmp10 = load i32* %j, align 4
  %idxprom11 = sext i32 %tmp10 to i64
  %tmp12 = load i32* %i, align 4
  %idxprom13 = sext i32 %tmp12 to i64
  %arrayidx = getelementptr inbounds [10 x [10 x [1 x i32]]]* %l_82, i32 0, i64 %idxprom13
  %arrayidx14 = getelementptr inbounds [10 x [1 x i32]]* %arrayidx, i32 0, i64 %idxprom11
  %arrayidx15 = getelementptr inbounds [1 x i32]* %arrayidx14, i32 0, i64 %idxprom
  store i32 2, i32* %arrayidx15, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body8
  %tmp16 = load i32* %k, align 4
  %inc = add nsw i32 %tmp16, 1
  store i32 %inc, i32* %k, align 4
  br label %for.cond5

for.end:                                          ; preds = %for.cond5
  br label %for.inc17

for.inc17:                                        ; preds = %for.end
  %tmp18 = load i32* %j, align 4
  %inc19 = add nsw i32 %tmp18, 1
  store i32 %inc19, i32* %j, align 4
  br label %for.cond1

for.end20:                                        ; preds = %for.cond1
  br label %for.inc21

for.inc21:                                        ; preds = %for.end20
  %tmp22 = load i32* %i, align 4
  %inc23 = add nsw i32 %tmp22, 1
  store i32 %inc23, i32* %i, align 4
  br label %for.cond

for.end24:                                        ; preds = %for.cond
  %tmp25 = load i32** %p_81.addr, align 8
  store i32 -6, i32* %tmp25
  %arrayidx26 = getelementptr inbounds [10 x [10 x [1 x i32]]]* %l_82, i32 0, i64 4
  %arrayidx27 = getelementptr inbounds [10 x [1 x i32]]* %arrayidx26, i32 0, i64 7
  %arrayidx28 = getelementptr inbounds [1 x i32]* %arrayidx27, i32 0, i64 0
  %tmp29 = load i32* %arrayidx28, align 4
  ret i32 %tmp29
}

define i32* @func_87(i32 %p_88, i32* %p_89) nounwind uwtable {
entry:
  %p_88.addr = alloca i32, align 4
  %p_89.addr = alloca i32*, align 8
  %l_100 = alloca i32*, align 8
  %l_99 = alloca [2 x i32**], align 16
  %i = alloca i32, align 4
  store i32 %p_88, i32* %p_88.addr, align 4
  store i32* %p_89, i32** %p_89.addr, align 8
  store i32* null, i32** %l_100, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp, 2
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp1 = load i32* %i, align 4
  %idxprom = sext i32 %tmp1 to i64
  %arrayidx = getelementptr inbounds [2 x i32**]* %l_99, i32 0, i64 %idxprom
  store i32** %l_100, i32*** %arrayidx, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %tmp2 = load i32* %i, align 4
  %inc = add nsw i32 %tmp2, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %tmp3 = load i32* @g_2, align 4
  %call = call i32* @func_90(i32 %tmp3)
  store i32* %call, i32** %p_89.addr, align 8
  ret i32* @g_2
}

define i32* @func_19(i16 signext %p_20, i32* %p_21, i32* %p_22, i16 zeroext %p_23) nounwind uwtable {
entry:
  %p_20.addr = alloca i16, align 2
  %p_21.addr = alloca i32*, align 8
  %p_22.addr = alloca i32*, align 8
  %p_23.addr = alloca i16, align 2
  %l_27 = alloca i32*, align 8
  %l_28 = alloca i32, align 4
  %l_66 = alloca [4 x i64], align 16
  %l_83 = alloca [10 x [7 x [1 x [1 x [1 x i32*]]]]], align 16
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %l = alloca i32, align 4
  %m = alloca i32, align 4
  store i16 %p_20, i16* %p_20.addr, align 2
  store i32* %p_21, i32** %p_21.addr, align 8
  store i32* %p_22, i32** %p_22.addr, align 8
  store i16 %p_23, i16* %p_23.addr, align 2
  store i32* null, i32** %l_27, align 8
  store i32 -2, i32* %l_28, align 4
  %tmp = load i16* @g_18, align 2
  %conv = trunc i16 %tmp to i8
  %call = call zeroext i8 @safe_unary_minus_func_uint8_t_u(i8 zeroext %conv)
  %conv1 = zext i8 %call to i32
  %tmp2 = load i32** %l_27, align 8
  %cmp = icmp ne i32* %tmp2, @g_2
  %conv3 = zext i1 %cmp to i32
  %and = and i32 %conv1, %conv3
  %conv4 = trunc i32 %and to i8
  %tmp5 = load i32* %l_28, align 4
  %tmp6 = load i32** %p_22.addr, align 8
  %tmp7 = load i32* %tmp6
  %tmp8 = load i32** %p_22.addr, align 8
  %tmp9 = load i32* %tmp8
  %cmp10 = icmp sge i32 %tmp7, %tmp9
  %conv11 = zext i1 %cmp10 to i32
  %conv12 = trunc i32 %conv11 to i16
  %call13 = call i32 @func_29(i16 zeroext %conv12)
  %cmp14 = icmp eq i32 %tmp5, %call13
  %conv15 = zext i1 %cmp14 to i32
  %call16 = call signext i8 @safe_rshift_func_int8_t_s_u(i8 signext %conv4, i32 %conv15)
  %conv17 = sext i8 %call16 to i32
  %tmp18 = load i16* @g_18, align 2
  %conv19 = sext i16 %tmp18 to i32
  %cmp20 = icmp ne i32 %conv17, %conv19
  %conv21 = zext i1 %cmp20 to i32
  %tmp22 = load i8* @g_41, align 1
  %conv23 = sext i8 %tmp22 to i32
  %xor = xor i32 %conv23, %conv21
  %conv24 = trunc i32 %xor to i8
  store i8 %conv24, i8* @g_41, align 1
  %tmp25 = load i8* @g_41, align 1
  %conv26 = sext i8 %tmp25 to i32
  %tobool = icmp ne i32 %conv26, 0
  br i1 %tobool, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %entry
  %tmp27 = load i16* @g_18, align 2
  %conv28 = sext i16 %tmp27 to i32
  %tobool29 = icmp ne i32 %conv28, 0
  br label %land.end

land.end:                                         ; preds = %land.rhs, %entry
  %0 = phi i1 [ false, %entry ], [ %tobool29, %land.rhs ]
  %land.ext = zext i1 %0 to i32
  %conv30 = trunc i32 %land.ext to i8
  %tmp31 = load i32** %p_21.addr, align 8
  %tmp32 = load i32* %tmp31
  %tmp33 = load i32** %p_22.addr, align 8
  %tmp34 = load i32* %tmp33
  %conv35 = trunc i32 %tmp34 to i16
  %tmp36 = load i32** %p_21.addr, align 8
  %tmp37 = load i32* %tmp36
  %conv38 = trunc i32 %tmp37 to i16
  %call39 = call zeroext i16 @safe_mod_func_uint16_t_u_u(i16 zeroext %conv35, i16 zeroext %conv38)
  %tmp40 = load i32** %p_21.addr, align 8
  %tmp41 = load i32* %tmp40
  %tmp42 = load i32** %p_21.addr, align 8
  %tmp43 = load i32* %tmp42
  %cmp44 = icmp slt i32 %tmp41, %tmp43
  %conv45 = zext i1 %cmp44 to i32
  %conv46 = trunc i32 %conv45 to i16
  %call47 = call signext i16 @safe_div_func_int16_t_s_s(i16 signext %call39, i16 signext %conv46)
  %conv48 = sext i16 %call47 to i32
  %cmp49 = icmp sle i32 %tmp32, %conv48
  %conv50 = zext i1 %cmp49 to i32
  %conv51 = trunc i32 %conv50 to i16
  %call52 = call zeroext i16 @safe_rshift_func_uint16_t_u_s(i16 zeroext %conv51, i32 -1683666630)
  %conv53 = zext i16 %call52 to i64
  %tmp54 = load i16* %p_20.addr, align 2
  %conv55 = sext i16 %tmp54 to i32
  %call56 = call i32 @func_44(i64 1, i64 %conv53, i32 %conv55)
  %conv57 = trunc i32 %call56 to i8
  %call58 = call signext i8 @safe_div_func_int8_t_s_s(i8 signext %conv30, i8 signext %conv57)
  %conv59 = sext i8 %call58 to i32
  %tmp60 = load i32** %p_21.addr, align 8
  store i32 %conv59, i32* %tmp60
  br label %lbl_63

lbl_63:                                           ; preds = %if.then, %land.end
  %tmp61 = load i8* @g_58, align 1
  %conv62 = sext i8 %tmp61 to i32
  %tmp63 = load i32** %p_22.addr, align 8
  %tmp64 = load i32* %tmp63
  %cmp65 = icmp slt i32 %conv62, %tmp64
  %conv66 = zext i1 %cmp65 to i32
  %cmp67 = icmp eq i32* null, %l_28
  %conv68 = zext i1 %cmp67 to i32
  %tmp69 = load i32* %l_28, align 4
  %conv70 = sext i32 %tmp69 to i64
  %tmp71 = load i8* @g_41, align 1
  %conv72 = sext i8 %tmp71 to i64
  %tmp73 = load i16* %p_20.addr, align 2
  %conv74 = sext i16 %tmp73 to i32
  %call75 = call i32 @func_44(i64 %conv70, i64 %conv72, i32 %conv74)
  %xor76 = xor i32 %conv68, %call75
  %call77 = call i32 @safe_add_func_int32_t_s_s(i32 %conv66, i32 %xor76)
  %tmp78 = load i32* %l_28, align 4
  %tobool79 = icmp ne i32 %tmp78, 0
  br i1 %tobool79, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %lbl_63
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %lbl_63
  %1 = phi i1 [ true, %lbl_63 ], [ false, %lor.rhs ]
  %lor.ext = zext i1 %1 to i32
  %conv80 = trunc i32 %lor.ext to i8
  %tmp81 = load i32** %p_22.addr, align 8
  %tmp82 = load i32* %tmp81
  %call83 = call zeroext i8 @safe_rshift_func_uint8_t_u_u(i8 zeroext %conv80, i32 %tmp82)
  %conv84 = zext i8 %call83 to i32
  %or = or i32 %call77, %conv84
  %tmp85 = load i32** %p_21.addr, align 8
  %tmp86 = load i32* %tmp85
  %xor87 = xor i32 %tmp86, %or
  store i32 %xor87, i32* %tmp85
  store i16 0, i16* %p_20.addr, align 2
  br label %for.cond

for.cond:                                         ; preds = %for.inc233, %lor.end
  %tmp88 = load i16* %p_20.addr, align 2
  %conv89 = sext i16 %tmp88 to i32
  %cmp90 = icmp eq i32 %conv89, 0
  br i1 %cmp90, label %for.body, label %for.end236

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %i, align 4
  br label %for.cond99

for.cond99:                                       ; preds = %for.inc, %for.body
  %tmp100 = load i32* %i, align 4
  %cmp101 = icmp slt i32 %tmp100, 4
  br i1 %cmp101, label %for.body103, label %for.end

for.body103:                                      ; preds = %for.cond99
  %tmp104 = load i32* %i, align 4
  %idxprom = sext i32 %tmp104 to i64
  %arrayidx = getelementptr inbounds [4 x i64]* %l_66, i32 0, i64 %idxprom
  store i64 0, i64* %arrayidx, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body103
  %tmp105 = load i32* %i, align 4
  %inc = add nsw i32 %tmp105, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond99

for.end:                                          ; preds = %for.cond99
  store i32 0, i32* %i, align 4
  br label %for.cond106

for.cond106:                                      ; preds = %for.inc162, %for.end
  %tmp107 = load i32* %i, align 4
  %cmp108 = icmp slt i32 %tmp107, 10
  br i1 %cmp108, label %for.body110, label %for.end165

for.body110:                                      ; preds = %for.cond106
  store i32 0, i32* %j, align 4
  br label %for.cond111

for.cond111:                                      ; preds = %for.inc158, %for.body110
  %tmp112 = load i32* %j, align 4
  %cmp113 = icmp slt i32 %tmp112, 7
  br i1 %cmp113, label %for.body115, label %for.end161

for.body115:                                      ; preds = %for.cond111
  store i32 0, i32* %k, align 4
  br label %for.cond116

for.cond116:                                      ; preds = %for.inc154, %for.body115
  %tmp117 = load i32* %k, align 4
  %cmp118 = icmp slt i32 %tmp117, 1
  br i1 %cmp118, label %for.body120, label %for.end157

for.body120:                                      ; preds = %for.cond116
  store i32 0, i32* %l, align 4
  br label %for.cond121

for.cond121:                                      ; preds = %for.inc150, %for.body120
  %tmp122 = load i32* %l, align 4
  %cmp123 = icmp slt i32 %tmp122, 1
  br i1 %cmp123, label %for.body125, label %for.end153

for.body125:                                      ; preds = %for.cond121
  store i32 0, i32* %m, align 4
  br label %for.cond126

for.cond126:                                      ; preds = %for.inc146, %for.body125
  %tmp127 = load i32* %m, align 4
  %cmp128 = icmp slt i32 %tmp127, 1
  br i1 %cmp128, label %for.body130, label %for.end149

for.body130:                                      ; preds = %for.cond126
  %tmp131 = load i32* %m, align 4
  %idxprom132 = sext i32 %tmp131 to i64
  %tmp133 = load i32* %l, align 4
  %idxprom134 = sext i32 %tmp133 to i64
  %tmp135 = load i32* %k, align 4
  %idxprom136 = sext i32 %tmp135 to i64
  %tmp137 = load i32* %j, align 4
  %idxprom138 = sext i32 %tmp137 to i64
  %tmp139 = load i32* %i, align 4
  %idxprom140 = sext i32 %tmp139 to i64
  %arrayidx141 = getelementptr inbounds [10 x [7 x [1 x [1 x [1 x i32*]]]]]* %l_83, i32 0, i64 %idxprom140
  %arrayidx142 = getelementptr inbounds [7 x [1 x [1 x [1 x i32*]]]]* %arrayidx141, i32 0, i64 %idxprom138
  %arrayidx143 = getelementptr inbounds [1 x [1 x [1 x i32*]]]* %arrayidx142, i32 0, i64 %idxprom136
  %arrayidx144 = getelementptr inbounds [1 x [1 x i32*]]* %arrayidx143, i32 0, i64 %idxprom134
  %arrayidx145 = getelementptr inbounds [1 x i32*]* %arrayidx144, i32 0, i64 %idxprom132
  store i32* %l_28, i32** %arrayidx145, align 8
  br label %for.inc146

for.inc146:                                       ; preds = %for.body130
  %tmp147 = load i32* %m, align 4
  %inc148 = add nsw i32 %tmp147, 1
  store i32 %inc148, i32* %m, align 4
  br label %for.cond126

for.end149:                                       ; preds = %for.cond126
  br label %for.inc150

for.inc150:                                       ; preds = %for.end149
  %tmp151 = load i32* %l, align 4
  %inc152 = add nsw i32 %tmp151, 1
  store i32 %inc152, i32* %l, align 4
  br label %for.cond121

for.end153:                                       ; preds = %for.cond121
  br label %for.inc154

for.inc154:                                       ; preds = %for.end153
  %tmp155 = load i32* %k, align 4
  %inc156 = add nsw i32 %tmp155, 1
  store i32 %inc156, i32* %k, align 4
  br label %for.cond116

for.end157:                                       ; preds = %for.cond116
  br label %for.inc158

for.inc158:                                       ; preds = %for.end157
  %tmp159 = load i32* %j, align 4
  %inc160 = add nsw i32 %tmp159, 1
  store i32 %inc160, i32* %j, align 4
  br label %for.cond111

for.end161:                                       ; preds = %for.cond111
  br label %for.inc162

for.inc162:                                       ; preds = %for.end161
  %tmp163 = load i32* %i, align 4
  %inc164 = add nsw i32 %tmp163, 1
  store i32 %inc164, i32* %i, align 4
  br label %for.cond106

for.end165:                                       ; preds = %for.cond106
  %tmp166 = load i16* %p_20.addr, align 2
  %tobool167 = icmp ne i16 %tmp166, 0
  br i1 %tobool167, label %if.then, label %if.end

if.then:                                          ; preds = %for.end165
  br label %lbl_63

if.end:                                           ; preds = %for.end165
  %arrayidx168 = getelementptr inbounds [4 x i64]* %l_66, i32 0, i64 1
  %tmp169 = load i64* %arrayidx168, align 8
  %conv170 = trunc i64 %tmp169 to i8
  %tmp171 = load i32** %p_22.addr, align 8
  %tmp172 = load i32* %tmp171
  %tobool173 = icmp ne i32 %tmp172, 0
  br i1 %tobool173, label %lor.end175, label %lor.rhs174

lor.rhs174:                                       ; preds = %if.end
  br label %lor.end175

lor.end175:                                       ; preds = %lor.rhs174, %if.end
  %2 = phi i1 [ true, %if.end ], [ true, %lor.rhs174 ]
  %lor.ext176 = zext i1 %2 to i32
  %conv177 = trunc i32 %lor.ext176 to i8
  %tmp178 = load i32** %p_21.addr, align 8
  %tmp179 = load i32* %tmp178
  %call180 = call zeroext i8 @safe_lshift_func_uint8_t_u_s(i8 zeroext %conv177, i32 %tmp179)
  %call181 = call signext i8 @safe_sub_func_int8_t_s_s(i8 signext %conv170, i8 signext %call180)
  %conv182 = sext i8 %call181 to i32
  %tmp183 = load i32** %p_21.addr, align 8
  %tmp184 = load i32* %tmp183
  %xor185 = xor i32 %tmp184, %conv182
  store i32 %xor185, i32* %tmp183
  %tmp186 = load i32* @g_2, align 4
  %conv187 = trunc i32 %tmp186 to i16
  %call188 = call i32 @func_29(i16 zeroext %conv187)
  %arrayidx189 = getelementptr inbounds [4 x i64]* %l_66, i32 0, i64 1
  %tmp190 = load i64* %arrayidx189, align 8
  %conv191 = trunc i64 %tmp190 to i8
  %arrayidx192 = getelementptr inbounds [4 x i64]* %l_66, i32 0, i64 1
  %tmp193 = load i64* %arrayidx192, align 8
  %conv194 = trunc i64 %tmp193 to i8
  %call195 = call zeroext i8 @safe_mod_func_uint8_t_u_u(i8 zeroext %conv191, i8 zeroext %conv194)
  %conv196 = zext i8 %call195 to i32
  %cmp197 = icmp sge i32 %call188, %conv196
  %conv198 = zext i1 %cmp197 to i32
  %tmp199 = load i32** %p_21.addr, align 8
  store i32 %conv198, i32* %tmp199
  %tmp200 = load i16* %p_20.addr, align 2
  %conv201 = trunc i16 %tmp200 to i8
  %tmp202 = load i16* %p_23.addr, align 2
  %conv203 = trunc i16 %tmp202 to i8
  %tmp204 = load i32** %p_22.addr, align 8
  %tmp205 = load i32* %tmp204
  %conv206 = trunc i32 %tmp205 to i8
  %arrayidx207 = getelementptr inbounds [10 x [7 x [1 x [1 x [1 x i32*]]]]]* %l_83, i32 0, i64 7
  %arrayidx208 = getelementptr inbounds [7 x [1 x [1 x [1 x i32*]]]]* %arrayidx207, i32 0, i64 0
  %arrayidx209 = getelementptr inbounds [1 x [1 x [1 x i32*]]]* %arrayidx208, i32 0, i64 0
  %arrayidx210 = getelementptr inbounds [1 x [1 x i32*]]* %arrayidx209, i32 0, i64 0
  %arrayidx211 = getelementptr inbounds [1 x i32*]* %arrayidx210, i32 0, i64 0
  %tmp212 = load i32** %arrayidx211, align 8
  %call213 = call i32 @func_80(i32* %tmp212)
  %conv214 = trunc i32 %call213 to i8
  %call215 = call signext i8 @safe_div_func_int8_t_s_s(i8 signext %conv206, i8 signext %conv214)
  %conv216 = sext i8 %call215 to i32
  %tmp217 = load i16* %p_20.addr, align 2
  %conv218 = sext i16 %tmp217 to i64
  %tmp219 = load i16* %p_20.addr, align 2
  %conv220 = sext i16 %tmp219 to i64
  %tmp221 = load i16* %p_20.addr, align 2
  %conv222 = sext i16 %tmp221 to i32
  %call223 = call i32 @func_44(i64 %conv218, i64 %conv220, i32 %conv222)
  %conv224 = sext i32 %call223 to i64
  %cmp225 = icmp sgt i64 0, %conv224
  %conv226 = zext i1 %cmp225 to i32
  %or227 = or i32 %conv216, %conv226
  %conv228 = trunc i32 %or227 to i16
  %call229 = call i32 @func_29(i16 zeroext %conv228)
  %conv230 = trunc i32 %call229 to i16
  %call231 = call i32* @func_71(i8 signext %conv201, i32* @g_2, i32* %l_28, i8 signext %conv203, i16 zeroext %conv230)
  %tmp232 = volatile load i32*** @g_84, align 8
  store i32* %call231, i32** %tmp232
  br label %for.inc233

for.inc233:                                       ; preds = %lor.end175
  %tmp234 = load i16* %p_20.addr, align 2
  %call235 = call signext i16 @safe_add_func_int16_t_s_s(i16 signext %tmp234, i16 signext 3)
  store i16 %call235, i16* %p_20.addr, align 2
  br label %for.cond

for.end236:                                       ; preds = %for.cond
  %tmp237 = load i32** %p_21.addr, align 8
  ret i32* %tmp237
}

define internal signext i8 @safe_rshift_func_int8_t_s_u(i8 signext %left, i32 %right) nounwind uwtable {
entry:
  %left.addr = alloca i8, align 1
  %right.addr = alloca i32, align 4
  store i8 %left, i8* %left.addr, align 1
  store i32 %right, i32* %right.addr, align 4
  %tmp = load i8* %left.addr, align 1
  %conv = sext i8 %tmp to i32
  %cmp = icmp slt i32 %conv, 0
  br i1 %cmp, label %cond.true, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %tmp2 = load i32* %right.addr, align 4
  %cmp3 = icmp uge i32 %tmp2, 32
  br i1 %cmp3, label %cond.true, label %cond.false

cond.true:                                        ; preds = %lor.lhs.false, %entry
  %tmp5 = load i8* %left.addr, align 1
  %conv6 = sext i8 %tmp5 to i32
  br label %cond.end

cond.false:                                       ; preds = %lor.lhs.false
  %tmp7 = load i8* %left.addr, align 1
  %conv8 = sext i8 %tmp7 to i32
  %tmp9 = load i32* %right.addr, align 4
  %shr = ashr i32 %conv8, %tmp9
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %conv6, %cond.true ], [ %shr, %cond.false ]
  %conv10 = trunc i32 %cond to i8
  ret i8 %conv10
}

define internal zeroext i8 @safe_unary_minus_func_uint8_t_u(i8 zeroext %ui) nounwind uwtable {
entry:
  %ui.addr = alloca i8, align 1
  store i8 %ui, i8* %ui.addr, align 1
  %tmp = load i8* %ui.addr, align 1
  %conv = zext i8 %tmp to i32
  %sub = sub nsw i32 0, %conv
  %conv1 = trunc i32 %sub to i8
  ret i8 %conv1
}

define i32 @func_29(i16 zeroext %p_30) nounwind uwtable {
entry:
  %p_30.addr = alloca i16, align 2
  %l_40 = alloca i16, align 2
  %l_37 = alloca i32*, align 8
  store i16 %p_30, i16* %p_30.addr, align 2
  store i16 0, i16* %l_40, align 2
  store i16 25, i16* %p_30.addr, align 2
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp = load i16* %p_30.addr, align 2
  %conv = zext i16 %tmp to i32
  %cmp = icmp ne i32 %conv, 0
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  store i32* @g_2, i32** %l_37, align 8
  %tmp3 = load i16* @g_18, align 2
  %conv4 = sext i16 %tmp3 to i32
  %tobool = icmp ne i32 %conv4, 0
  br i1 %tobool, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %for.body
  %tmp5 = load i32* @g_2, align 4
  %tobool6 = icmp ne i32 %tmp5, 0
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %for.body
  %0 = phi i1 [ true, %for.body ], [ %tobool6, %lor.rhs ]
  %lor.ext = zext i1 %0 to i32
  %tmp7 = load i32** %l_37, align 8
  %cmp8 = icmp eq i32* %tmp7, @g_2
  %conv9 = zext i1 %cmp8 to i32
  %cmp10 = icmp sle i32 %lor.ext, %conv9
  %conv11 = zext i1 %cmp10 to i32
  %conv12 = trunc i32 %conv11 to i16
  %tmp13 = load i16* @g_18, align 2
  %conv14 = sext i16 %tmp13 to i32
  %call = call zeroext i16 @safe_rshift_func_uint16_t_u_s(i16 zeroext %conv12, i32 %conv14)
  %conv15 = zext i16 %call to i32
  %tobool16 = icmp ne i32 %conv15, 0
  br i1 %tobool16, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %lor.end
  %call17 = call i32 @safe_div_func_uint32_t_u_u(i32 0, i32 2037573611)
  %tobool18 = icmp ne i32 %call17, 0
  br label %land.end

land.end:                                         ; preds = %land.rhs, %lor.end
  %1 = phi i1 [ false, %lor.end ], [ %tobool18, %land.rhs ]
  %land.ext = zext i1 %1 to i32
  %conv19 = trunc i32 %land.ext to i8
  %tmp20 = load i16* @g_18, align 2
  %conv21 = sext i16 %tmp20 to i32
  %tmp22 = load i16* %p_30.addr, align 2
  %conv23 = zext i16 %tmp22 to i32
  %conv24 = sext i32 %conv23 to i64
  %cmp25 = icmp sge i64 %conv24, -2
  %conv26 = zext i1 %cmp25 to i32
  %tmp27 = load i16* %p_30.addr, align 2
  %conv28 = zext i16 %tmp27 to i64
  %cmp29 = icmp sle i64 %conv28, 2119031735
  %conv30 = zext i1 %cmp29 to i32
  %and = and i32 %conv26, %conv30
  %or = or i32 %conv21, %and
  %conv31 = trunc i32 %or to i8
  %call32 = call zeroext i8 @safe_div_func_uint8_t_u_u(i8 zeroext %conv19, i8 zeroext %conv31)
  %conv33 = zext i8 %call32 to i64
  %cmp34 = icmp sle i64 %conv33, 3797269343
  %conv35 = zext i1 %cmp34 to i32
  %tmp36 = load i32** %l_37, align 8
  store i32 %conv35, i32* %tmp36
  br label %for.inc

for.inc:                                          ; preds = %land.end
  %tmp37 = load i16* %p_30.addr, align 2
  %call38 = call zeroext i16 @safe_sub_func_uint16_t_u_u(i16 zeroext %tmp37, i16 zeroext 4)
  store i16 %call38, i16* %p_30.addr, align 2
  br label %for.cond

for.end:                                          ; preds = %for.cond
  ret i32 0
}

define internal signext i8 @safe_div_func_int8_t_s_s(i8 signext %si1, i8 signext %si2) nounwind uwtable {
entry:
  %si1.addr = alloca i8, align 1
  %si2.addr = alloca i8, align 1
  store i8 %si1, i8* %si1.addr, align 1
  store i8 %si2, i8* %si2.addr, align 1
  %tmp = load i8* %si2.addr, align 1
  %conv = sext i8 %tmp to i32
  %cmp = icmp eq i32 %conv, 0
  br i1 %cmp, label %cond.true, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %tmp2 = load i8* %si1.addr, align 1
  %conv3 = sext i8 %tmp2 to i32
  %cmp4 = icmp eq i32 %conv3, -128
  br i1 %cmp4, label %land.lhs.true, label %cond.false

land.lhs.true:                                    ; preds = %lor.lhs.false
  %tmp6 = load i8* %si2.addr, align 1
  %conv7 = sext i8 %tmp6 to i32
  %cmp8 = icmp eq i32 %conv7, -1
  br i1 %cmp8, label %cond.true, label %cond.false

cond.true:                                        ; preds = %land.lhs.true, %entry
  %tmp10 = load i8* %si1.addr, align 1
  %conv11 = sext i8 %tmp10 to i32
  br label %cond.end

cond.false:                                       ; preds = %land.lhs.true, %lor.lhs.false
  %tmp12 = load i8* %si1.addr, align 1
  %conv13 = sext i8 %tmp12 to i32
  %tmp14 = load i8* %si2.addr, align 1
  %conv15 = sext i8 %tmp14 to i32
  %div = sdiv i32 %conv13, %conv15
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %conv11, %cond.true ], [ %div, %cond.false ]
  %conv16 = trunc i32 %cond to i8
  ret i8 %conv16
}

define i32 @func_44(i64 %p_45, i64 %p_46, i32 %p_47) nounwind uwtable {
entry:
  %p_45.addr = alloca i64, align 8
  %p_46.addr = alloca i64, align 8
  %p_47.addr = alloca i32, align 4
  %l_49 = alloca i32*, align 8
  store i64 %p_45, i64* %p_45.addr, align 8
  store i64 %p_46, i64* %p_46.addr, align 8
  store i32 %p_47, i32* %p_47.addr, align 4
  store i32* @g_2, i32** %l_49, align 8
  %tmp = load i64* %p_45.addr, align 8
  %conv = trunc i64 %tmp to i32
  %tmp1 = load i32** %l_49, align 8
  store i32 %conv, i32* %tmp1
  %tmp2 = load i64* %p_46.addr, align 8
  %conv3 = trunc i64 %tmp2 to i32
  ret i32 %conv3
}

define internal zeroext i16 @safe_rshift_func_uint16_t_u_s(i16 zeroext %left, i32 %right) nounwind uwtable {
entry:
  %left.addr = alloca i16, align 2
  %right.addr = alloca i32, align 4
  store i16 %left, i16* %left.addr, align 2
  store i32 %right, i32* %right.addr, align 4
  %tmp = load i32* %right.addr, align 4
  %cmp = icmp slt i32 %tmp, 0
  br i1 %cmp, label %cond.true, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %tmp1 = load i32* %right.addr, align 4
  %cmp2 = icmp sge i32 %tmp1, 32
  br i1 %cmp2, label %cond.true, label %cond.false

cond.true:                                        ; preds = %lor.lhs.false, %entry
  %tmp3 = load i16* %left.addr, align 2
  %conv = zext i16 %tmp3 to i32
  br label %cond.end

cond.false:                                       ; preds = %lor.lhs.false
  %tmp4 = load i16* %left.addr, align 2
  %conv5 = zext i16 %tmp4 to i32
  %tmp6 = load i32* %right.addr, align 4
  %shr = ashr i32 %conv5, %tmp6
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %conv, %cond.true ], [ %shr, %cond.false ]
  %conv7 = trunc i32 %cond to i16
  ret i16 %conv7
}

define internal signext i16 @safe_div_func_int16_t_s_s(i16 signext %si1, i16 signext %si2) nounwind uwtable {
entry:
  %si1.addr = alloca i16, align 2
  %si2.addr = alloca i16, align 2
  store i16 %si1, i16* %si1.addr, align 2
  store i16 %si2, i16* %si2.addr, align 2
  %tmp = load i16* %si2.addr, align 2
  %conv = sext i16 %tmp to i32
  %cmp = icmp eq i32 %conv, 0
  br i1 %cmp, label %cond.true, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %tmp2 = load i16* %si1.addr, align 2
  %conv3 = sext i16 %tmp2 to i32
  %cmp4 = icmp eq i32 %conv3, -32768
  br i1 %cmp4, label %land.lhs.true, label %cond.false

land.lhs.true:                                    ; preds = %lor.lhs.false
  %tmp6 = load i16* %si2.addr, align 2
  %conv7 = sext i16 %tmp6 to i32
  %cmp8 = icmp eq i32 %conv7, -1
  br i1 %cmp8, label %cond.true, label %cond.false

cond.true:                                        ; preds = %land.lhs.true, %entry
  %tmp10 = load i16* %si1.addr, align 2
  %conv11 = sext i16 %tmp10 to i32
  br label %cond.end

cond.false:                                       ; preds = %land.lhs.true, %lor.lhs.false
  %tmp12 = load i16* %si1.addr, align 2
  %conv13 = sext i16 %tmp12 to i32
  %tmp14 = load i16* %si2.addr, align 2
  %conv15 = sext i16 %tmp14 to i32
  %div = sdiv i32 %conv13, %conv15
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %conv11, %cond.true ], [ %div, %cond.false ]
  %conv16 = trunc i32 %cond to i16
  ret i16 %conv16
}

define internal i32 @safe_add_func_int32_t_s_s(i32 %si1, i32 %si2) nounwind uwtable {
entry:
  %si1.addr = alloca i32, align 4
  %si2.addr = alloca i32, align 4
  store i32 %si1, i32* %si1.addr, align 4
  store i32 %si2, i32* %si2.addr, align 4
  %tmp = load i32* %si1.addr, align 4
  %cmp = icmp sgt i32 %tmp, 0
  br i1 %cmp, label %land.lhs.true, label %lor.lhs.false

land.lhs.true:                                    ; preds = %entry
  %tmp1 = load i32* %si2.addr, align 4
  %cmp2 = icmp sgt i32 %tmp1, 0
  br i1 %cmp2, label %land.lhs.true3, label %lor.lhs.false

land.lhs.true3:                                   ; preds = %land.lhs.true
  %tmp4 = load i32* %si1.addr, align 4
  %tmp5 = load i32* %si2.addr, align 4
  %sub = sub nsw i32 2147483647, %tmp5
  %cmp6 = icmp sgt i32 %tmp4, %sub
  br i1 %cmp6, label %cond.true, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %land.lhs.true3, %land.lhs.true, %entry
  %tmp7 = load i32* %si1.addr, align 4
  %cmp8 = icmp slt i32 %tmp7, 0
  br i1 %cmp8, label %land.lhs.true9, label %cond.false

land.lhs.true9:                                   ; preds = %lor.lhs.false
  %tmp10 = load i32* %si2.addr, align 4
  %cmp11 = icmp slt i32 %tmp10, 0
  br i1 %cmp11, label %land.lhs.true12, label %cond.false

land.lhs.true12:                                  ; preds = %land.lhs.true9
  %tmp13 = load i32* %si1.addr, align 4
  %tmp14 = load i32* %si2.addr, align 4
  %sub15 = sub nsw i32 -2147483648, %tmp14
  %cmp16 = icmp slt i32 %tmp13, %sub15
  br i1 %cmp16, label %cond.true, label %cond.false

cond.true:                                        ; preds = %land.lhs.true12, %land.lhs.true3
  %tmp17 = load i32* %si1.addr, align 4
  br label %cond.end

cond.false:                                       ; preds = %land.lhs.true12, %land.lhs.true9, %lor.lhs.false
  %tmp18 = load i32* %si1.addr, align 4
  %tmp19 = load i32* %si2.addr, align 4
  %add = add nsw i32 %tmp18, %tmp19
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %tmp17, %cond.true ], [ %add, %cond.false ]
  ret i32 %cond
}

define internal zeroext i8 @safe_rshift_func_uint8_t_u_u(i8 zeroext %left, i32 %right) nounwind uwtable {
entry:
  %left.addr = alloca i8, align 1
  %right.addr = alloca i32, align 4
  store i8 %left, i8* %left.addr, align 1
  store i32 %right, i32* %right.addr, align 4
  %tmp = load i32* %right.addr, align 4
  %cmp = icmp uge i32 %tmp, 32
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %tmp1 = load i8* %left.addr, align 1
  %conv = zext i8 %tmp1 to i32
  br label %cond.end

cond.false:                                       ; preds = %entry
  %tmp2 = load i8* %left.addr, align 1
  %conv3 = zext i8 %tmp2 to i32
  %tmp4 = load i32* %right.addr, align 4
  %shr = ashr i32 %conv3, %tmp4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %conv, %cond.true ], [ %shr, %cond.false ]
  %conv5 = trunc i32 %cond to i8
  ret i8 %conv5
}

define internal signext i8 @safe_sub_func_int8_t_s_s(i8 signext %si1, i8 signext %si2) nounwind uwtable {
entry:
  %si1.addr = alloca i8, align 1
  %si2.addr = alloca i8, align 1
  store i8 %si1, i8* %si1.addr, align 1
  store i8 %si2, i8* %si2.addr, align 1
  %tmp = load i8* %si1.addr, align 1
  %conv = sext i8 %tmp to i32
  %tmp1 = load i8* %si2.addr, align 1
  %conv2 = sext i8 %tmp1 to i32
  %sub = sub nsw i32 %conv, %conv2
  %conv3 = trunc i32 %sub to i8
  ret i8 %conv3
}

define internal zeroext i8 @safe_lshift_func_uint8_t_u_s(i8 zeroext %left, i32 %right) nounwind uwtable {
entry:
  %left.addr = alloca i8, align 1
  %right.addr = alloca i32, align 4
  store i8 %left, i8* %left.addr, align 1
  store i32 %right, i32* %right.addr, align 4
  %tmp = load i32* %right.addr, align 4
  %cmp = icmp slt i32 %tmp, 0
  br i1 %cmp, label %cond.true, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %tmp1 = load i32* %right.addr, align 4
  %cmp2 = icmp sge i32 %tmp1, 32
  br i1 %cmp2, label %cond.true, label %lor.lhs.false3

lor.lhs.false3:                                   ; preds = %lor.lhs.false
  %tmp4 = load i8* %left.addr, align 1
  %conv = zext i8 %tmp4 to i32
  %tmp5 = load i32* %right.addr, align 4
  %shr = ashr i32 255, %tmp5
  %cmp6 = icmp sgt i32 %conv, %shr
  br i1 %cmp6, label %cond.true, label %cond.false

cond.true:                                        ; preds = %lor.lhs.false3, %lor.lhs.false, %entry
  %tmp8 = load i8* %left.addr, align 1
  %conv9 = zext i8 %tmp8 to i32
  br label %cond.end

cond.false:                                       ; preds = %lor.lhs.false3
  %tmp10 = load i8* %left.addr, align 1
  %conv11 = zext i8 %tmp10 to i32
  %tmp12 = load i32* %right.addr, align 4
  %shl = shl i32 %conv11, %tmp12
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %conv9, %cond.true ], [ %shl, %cond.false ]
  %conv13 = trunc i32 %cond to i8
  ret i8 %conv13
}

define internal zeroext i8 @safe_mod_func_uint8_t_u_u(i8 zeroext %ui1, i8 zeroext %ui2) nounwind uwtable {
entry:
  %ui1.addr = alloca i8, align 1
  %ui2.addr = alloca i8, align 1
  store i8 %ui1, i8* %ui1.addr, align 1
  store i8 %ui2, i8* %ui2.addr, align 1
  %tmp = load i8* %ui2.addr, align 1
  %conv = zext i8 %tmp to i32
  %cmp = icmp eq i32 %conv, 0
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %tmp2 = load i8* %ui1.addr, align 1
  %conv3 = zext i8 %tmp2 to i32
  br label %cond.end

cond.false:                                       ; preds = %entry
  %tmp4 = load i8* %ui1.addr, align 1
  %conv5 = zext i8 %tmp4 to i32
  %tmp6 = load i8* %ui2.addr, align 1
  %conv7 = zext i8 %tmp6 to i32
  %rem = srem i32 %conv5, %conv7
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %conv3, %cond.true ], [ %rem, %cond.false ]
  %conv8 = trunc i32 %cond to i8
  ret i8 %conv8
}

define i32* @func_71(i8 signext %p_72, i32* %p_73, i32* %p_74, i8 signext %p_75, i16 zeroext %p_76) nounwind uwtable {
entry:
  %p_72.addr = alloca i8, align 1
  %p_73.addr = alloca i32*, align 8
  %p_74.addr = alloca i32*, align 8
  %p_75.addr = alloca i8, align 1
  %p_76.addr = alloca i16, align 2
  %l_77 = alloca i32*, align 8
  store i8 %p_72, i8* %p_72.addr, align 1
  store i32* %p_73, i32** %p_73.addr, align 8
  store i32* %p_74, i32** %p_74.addr, align 8
  store i8 %p_75, i8* %p_75.addr, align 1
  store i16 %p_76, i16* %p_76.addr, align 2
  store i32* @g_2, i32** %l_77, align 8
  %tmp = load i32** %l_77, align 8
  %cmp = icmp eq i32* null, %tmp
  %conv = zext i1 %cmp to i32
  %tmp1 = load i32** %p_73.addr, align 8
  store i32 %conv, i32* %tmp1
  ret i32* @g_2
}

define internal signext i16 @safe_add_func_int16_t_s_s(i16 signext %si1, i16 signext %si2) nounwind uwtable {
entry:
  %si1.addr = alloca i16, align 2
  %si2.addr = alloca i16, align 2
  store i16 %si1, i16* %si1.addr, align 2
  store i16 %si2, i16* %si2.addr, align 2
  %tmp = load i16* %si1.addr, align 2
  %conv = sext i16 %tmp to i32
  %tmp1 = load i16* %si2.addr, align 2
  %conv2 = sext i16 %tmp1 to i32
  %add = add nsw i32 %conv, %conv2
  %conv3 = trunc i32 %add to i16
  ret i16 %conv3
}

define internal zeroext i8 @safe_div_func_uint8_t_u_u(i8 zeroext %ui1, i8 zeroext %ui2) nounwind uwtable {
entry:
  %ui1.addr = alloca i8, align 1
  %ui2.addr = alloca i8, align 1
  store i8 %ui1, i8* %ui1.addr, align 1
  store i8 %ui2, i8* %ui2.addr, align 1
  %tmp = load i8* %ui2.addr, align 1
  %conv = zext i8 %tmp to i32
  %cmp = icmp eq i32 %conv, 0
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %tmp2 = load i8* %ui1.addr, align 1
  %conv3 = zext i8 %tmp2 to i32
  br label %cond.end

cond.false:                                       ; preds = %entry
  %tmp4 = load i8* %ui1.addr, align 1
  %conv5 = zext i8 %tmp4 to i32
  %tmp6 = load i8* %ui2.addr, align 1
  %conv7 = zext i8 %tmp6 to i32
  %div = sdiv i32 %conv5, %conv7
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %conv3, %cond.true ], [ %div, %cond.false ]
  %conv8 = trunc i32 %cond to i8
  ret i8 %conv8
}

define internal i32 @safe_div_func_uint32_t_u_u(i32 %ui1, i32 %ui2) nounwind uwtable {
entry:
  %ui1.addr = alloca i32, align 4
  %ui2.addr = alloca i32, align 4
  store i32 %ui1, i32* %ui1.addr, align 4
  store i32 %ui2, i32* %ui2.addr, align 4
  %tmp = load i32* %ui2.addr, align 4
  %cmp = icmp eq i32 %tmp, 0
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %tmp1 = load i32* %ui1.addr, align 4
  br label %cond.end

cond.false:                                       ; preds = %entry
  %tmp2 = load i32* %ui1.addr, align 4
  %tmp3 = load i32* %ui2.addr, align 4
  %div = udiv i32 %tmp2, %tmp3
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %tmp1, %cond.true ], [ %div, %cond.false ]
  ret i32 %cond
}

define internal zeroext i16 @safe_sub_func_uint16_t_u_u(i16 zeroext %ui1, i16 zeroext %ui2) nounwind uwtable {
entry:
  %ui1.addr = alloca i16, align 2
  %ui2.addr = alloca i16, align 2
  store i16 %ui1, i16* %ui1.addr, align 2
  store i16 %ui2, i16* %ui2.addr, align 2
  %tmp = load i16* %ui1.addr, align 2
  %conv = zext i16 %tmp to i32
  %tmp1 = load i16* %ui2.addr, align 2
  %conv2 = zext i16 %tmp1 to i32
  %sub = sub nsw i32 %conv, %conv2
  %conv3 = trunc i32 %sub to i16
  ret i16 %conv3
}

define i32* @func_90(i32 %p_91) nounwind uwtable {
entry:
  %p_91.addr = alloca i32, align 4
  store i32 %p_91, i32* %p_91.addr, align 4
  ret i32* %p_91.addr
}

define i32 @func_92(i32 %p_93, i32** %p_94, i64 %p_95, i64 %p_96) nounwind uwtable {
entry:
  %p_93.addr = alloca i32, align 4
  %p_94.addr = alloca i32**, align 8
  %p_95.addr = alloca i64, align 8
  %p_96.addr = alloca i64, align 8
  %l_97 = alloca [1 x i16], align 2
  %l_98 = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 %p_93, i32* %p_93.addr, align 4
  store i32** %p_94, i32*** %p_94.addr, align 8
  store i64 %p_95, i64* %p_95.addr, align 8
  store i64 %p_96, i64* %p_96.addr, align 8
  store i32 -723463235, i32* %l_98, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp, 1
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp1 = load i32* %i, align 4
  %idxprom = sext i32 %tmp1 to i64
  %arrayidx = getelementptr inbounds [1 x i16]* %l_97, i32 0, i64 %idxprom
  store i16 0, i16* %arrayidx, align 2
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %tmp2 = load i32* %i, align 4
  %inc = add nsw i32 %tmp2, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %arrayidx3 = getelementptr inbounds [1 x i16]* %l_97, i32 0, i64 0
  %tmp4 = load i16* %arrayidx3, align 2
  %conv = zext i16 %tmp4 to i32
  %call = call i32* @func_90(i32 %conv)
  %tmp5 = load i32*** %p_94.addr, align 8
  store i32* %call, i32** %tmp5
  %tmp6 = load i64* %p_96.addr, align 8
  %conv7 = trunc i64 %tmp6 to i32
  store i32 %conv7, i32* %l_98, align 4
  %tmp8 = load i64* %p_96.addr, align 8
  %conv9 = trunc i64 %tmp8 to i32
  ret i32 %conv9
}

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %i = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  %call = call i32 @func_1()
  %tmp = load i32* @g_2, align 4
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %tmp)
  %tmp2 = load i16* @g_18, align 2
  %conv = sext i16 %tmp2 to i32
  %call3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str1, i32 0, i32 0), i32 %conv)
  %tmp4 = load i8* @g_41, align 1
  %conv5 = sext i8 %tmp4 to i32
  %call6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str2, i32 0, i32 0), i32 %conv5)
  %tmp7 = load i8* @g_58, align 1
  %conv8 = sext i8 %tmp7 to i32
  %call9 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str3, i32 0, i32 0), i32 %conv8)
  %tmp10 = load i32* @g_112, align 4
  %call11 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([21 x i8]* @.str4, i32 0, i32 0), i32 %tmp10)
  %tmp12 = load i32* @g_166, align 4
  %call13 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([21 x i8]* @.str5, i32 0, i32 0), i32 %tmp12)
  %0 = load i32* %retval
  ret i32 %0
}

declare i32 @printf(i8*, ...)
