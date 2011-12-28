; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith001815.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_14 = global [6 x i16] [i16 8, i16 8, i16 8, i16 8, i16 8, i16 8], align 2
@g_22 = global i32 910736786, align 4
@g_21 = global i32* @g_22, align 8
@g_51 = global i8 -50, align 1
@.str = private unnamed_addr constant [23 x i8] c"checksum g_14[0] = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [23 x i8] c"checksum g_14[1] = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [23 x i8] c"checksum g_14[2] = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [23 x i8] c"checksum g_14[3] = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [23 x i8] c"checksum g_14[4] = %d\0A\00", align 1
@.str5 = private unnamed_addr constant [23 x i8] c"checksum g_14[5] = %d\0A\00", align 1
@.str6 = private unnamed_addr constant [20 x i8] c"checksum g_22 = %d\0A\00", align 1
@.str7 = private unnamed_addr constant [20 x i8] c"checksum g_51 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %l_9 = alloca i8, align 1
  %l_17 = alloca i32*, align 8
  %l_18 = alloca i32, align 4
  %l_19 = alloca i32**, align 8
  %l_20 = alloca [9 x [6 x i32**]], align 16
  %l_23 = alloca i64, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %l_38 = alloca [8 x [1 x i64]], align 16
  %l_50 = alloca [1 x [9 x i32*]], align 16
  %i64 = alloca i32, align 4
  %j66 = alloca i32, align 4
  %l_28 = alloca i16, align 2
  %l_33 = alloca i16, align 2
  %l_56 = alloca [7 x i64], align 16
  %i167 = alloca i32, align 4
  store i8 8, i8* %l_9, align 1
  store i32* null, i32** %l_17, align 8
  store i32 -1428562482, i32* %l_18, align 4
  store i32** null, i32*** %l_19, align 8
  store i64 -7014378899162412654, i64* %l_23, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc10, %entry
  %tmp = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp, 9
  br i1 %cmp, label %for.body, label %for.end13

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc, %for.body
  %tmp2 = load i32* %j, align 4
  %cmp3 = icmp slt i32 %tmp2, 6
  br i1 %cmp3, label %for.body4, label %for.end

for.body4:                                        ; preds = %for.cond1
  %tmp5 = load i32* %j, align 4
  %idxprom = sext i32 %tmp5 to i64
  %tmp6 = load i32* %i, align 4
  %idxprom7 = sext i32 %tmp6 to i64
  %arrayidx = getelementptr inbounds [9 x [6 x i32**]]* %l_20, i32 0, i64 %idxprom7
  %arrayidx8 = getelementptr inbounds [6 x i32**]* %arrayidx, i32 0, i64 %idxprom
  store i32** null, i32*** %arrayidx8, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body4
  %tmp9 = load i32* %j, align 4
  %inc = add nsw i32 %tmp9, 1
  store i32 %inc, i32* %j, align 4
  br label %for.cond1

for.end:                                          ; preds = %for.cond1
  br label %for.inc10

for.inc10:                                        ; preds = %for.end
  %tmp11 = load i32* %i, align 4
  %inc12 = add nsw i32 %tmp11, 1
  store i32 %inc12, i32* %i, align 4
  br label %for.cond

for.end13:                                        ; preds = %for.cond
  %tmp14 = load i8* %l_9, align 1
  %conv = zext i8 %tmp14 to i16
  %tmp15 = load i8* %l_9, align 1
  %conv16 = zext i8 %tmp15 to i32
  %tmp17 = load i8* %l_9, align 1
  %conv18 = zext i8 %tmp17 to i32
  %xor = xor i32 %conv16, %conv18
  %conv19 = trunc i32 %xor to i16
  %tmp20 = load i16* getelementptr inbounds ([6 x i16]* @g_14, i32 0, i64 0), align 2
  %conv21 = trunc i16 %tmp20 to i8
  %tmp22 = load i16* getelementptr inbounds ([6 x i16]* @g_14, i32 0, i64 2), align 2
  %conv23 = zext i16 %tmp22 to i32
  %call = call signext i8 @safe_lshift_func_int8_t_s_s(i8 signext %conv21, i32 %conv23)
  %conv24 = sext i8 %call to i16
  %call25 = call signext i16 @safe_div_func_int16_t_s_s(i16 signext %conv19, i16 signext %conv24)
  %conv26 = sext i16 %call25 to i64
  %tmp27 = load i16* getelementptr inbounds ([6 x i16]* @g_14, i32 0, i64 0), align 2
  %conv28 = zext i16 %tmp27 to i64
  %tmp29 = load i16* getelementptr inbounds ([6 x i16]* @g_14, i32 0, i64 0), align 2
  %conv30 = zext i16 %tmp29 to i32
  %tmp31 = load i16* getelementptr inbounds ([6 x i16]* @g_14, i32 0, i64 0), align 2
  %conv32 = zext i16 %tmp31 to i32
  %cmp33 = icmp sge i32 %conv30, %conv32
  %conv34 = zext i1 %cmp33 to i32
  %conv35 = sext i32 %conv34 to i64
  %call36 = call i64 @safe_mod_func_int64_t_s_s(i64 %conv28, i64 %conv35)
  %cmp37 = icmp eq i64 %conv26, %call36
  %conv38 = zext i1 %cmp37 to i32
  %conv39 = trunc i32 %conv38 to i16
  %call40 = call signext i16 @safe_mul_func_int16_t_s_s(i16 signext %conv, i16 signext %conv39)
  %tobool = icmp ne i16 %call40, 0
  %lnot = xor i1 %tobool, true
  %lnot.ext = zext i1 %lnot to i32
  %tmp41 = load i32** %l_17, align 8
  %tmp42 = load i32* %l_18, align 4
  %conv43 = trunc i32 %tmp42 to i16
  %call44 = call i32* @func_2(i32 %lnot.ext, i32* null, i32* %tmp41, i16 signext %conv43)
  store i32* %call44, i32** @g_21, align 8
  %tmp45 = load i64* %l_23, align 8
  %tmp46 = load i16* getelementptr inbounds ([6 x i16]* @g_14, i32 0, i64 0), align 2
  %conv47 = zext i16 %tmp46 to i32
  %neg = xor i32 %conv47, -1
  %conv48 = sext i32 %neg to i64
  %cmp49 = icmp sle i64 %tmp45, %conv48
  %conv50 = zext i1 %cmp49 to i32
  %conv51 = sext i32 %conv50 to i64
  %and = and i64 2974878459, %conv51
  %tmp52 = load i32* @g_22, align 4
  %conv53 = sext i32 %tmp52 to i64
  %xor54 = xor i64 %conv53, %and
  %conv55 = trunc i64 %xor54 to i32
  store i32 %conv55, i32* @g_22, align 4
  store i64 -17, i64* %l_23, align 8
  br label %for.cond56

for.cond56:                                       ; preds = %for.inc200, %for.end13
  %tmp57 = load i64* %l_23, align 8
  %cmp58 = icmp sgt i64 %tmp57, -24
  br i1 %cmp58, label %for.body60, label %for.end205

for.body60:                                       ; preds = %for.cond56
  store i32 0, i32* %i64, align 4
  br label %for.cond67

for.cond67:                                       ; preds = %for.inc87, %for.body60
  %tmp68 = load i32* %i64, align 4
  %cmp69 = icmp slt i32 %tmp68, 8
  br i1 %cmp69, label %for.body71, label %for.end90

for.body71:                                       ; preds = %for.cond67
  store i32 0, i32* %j66, align 4
  br label %for.cond72

for.cond72:                                       ; preds = %for.inc83, %for.body71
  %tmp73 = load i32* %j66, align 4
  %cmp74 = icmp slt i32 %tmp73, 1
  br i1 %cmp74, label %for.body76, label %for.end86

for.body76:                                       ; preds = %for.cond72
  %tmp77 = load i32* %j66, align 4
  %idxprom78 = sext i32 %tmp77 to i64
  %tmp79 = load i32* %i64, align 4
  %idxprom80 = sext i32 %tmp79 to i64
  %arrayidx81 = getelementptr inbounds [8 x [1 x i64]]* %l_38, i32 0, i64 %idxprom80
  %arrayidx82 = getelementptr inbounds [1 x i64]* %arrayidx81, i32 0, i64 %idxprom78
  store i64 -3887472543215578885, i64* %arrayidx82, align 8
  br label %for.inc83

for.inc83:                                        ; preds = %for.body76
  %tmp84 = load i32* %j66, align 4
  %inc85 = add nsw i32 %tmp84, 1
  store i32 %inc85, i32* %j66, align 4
  br label %for.cond72

for.end86:                                        ; preds = %for.cond72
  br label %for.inc87

for.inc87:                                        ; preds = %for.end86
  %tmp88 = load i32* %i64, align 4
  %inc89 = add nsw i32 %tmp88, 1
  store i32 %inc89, i32* %i64, align 4
  br label %for.cond67

for.end90:                                        ; preds = %for.cond67
  store i32 0, i32* %i64, align 4
  br label %for.cond91

for.cond91:                                       ; preds = %for.inc111, %for.end90
  %tmp92 = load i32* %i64, align 4
  %cmp93 = icmp slt i32 %tmp92, 1
  br i1 %cmp93, label %for.body95, label %for.end114

for.body95:                                       ; preds = %for.cond91
  store i32 0, i32* %j66, align 4
  br label %for.cond96

for.cond96:                                       ; preds = %for.inc107, %for.body95
  %tmp97 = load i32* %j66, align 4
  %cmp98 = icmp slt i32 %tmp97, 9
  br i1 %cmp98, label %for.body100, label %for.end110

for.body100:                                      ; preds = %for.cond96
  %tmp101 = load i32* %j66, align 4
  %idxprom102 = sext i32 %tmp101 to i64
  %tmp103 = load i32* %i64, align 4
  %idxprom104 = sext i32 %tmp103 to i64
  %arrayidx105 = getelementptr inbounds [1 x [9 x i32*]]* %l_50, i32 0, i64 %idxprom104
  %arrayidx106 = getelementptr inbounds [9 x i32*]* %arrayidx105, i32 0, i64 %idxprom102
  store i32* %l_18, i32** %arrayidx106, align 8
  br label %for.inc107

for.inc107:                                       ; preds = %for.body100
  %tmp108 = load i32* %j66, align 4
  %inc109 = add nsw i32 %tmp108, 1
  store i32 %inc109, i32* %j66, align 4
  br label %for.cond96

for.end110:                                       ; preds = %for.cond96
  br label %for.inc111

for.inc111:                                       ; preds = %for.end110
  %tmp112 = load i32* %i64, align 4
  %inc113 = add nsw i32 %tmp112, 1
  store i32 %inc113, i32* %i64, align 4
  br label %for.cond91

for.end114:                                       ; preds = %for.cond91
  %tmp115 = load i32* @g_22, align 4
  %conv116 = trunc i32 %tmp115 to i16
  %call117 = call zeroext i16 @safe_mul_func_uint16_t_u_u(i16 zeroext %conv116, i16 zeroext 23087)
  %tobool118 = icmp ne i16 %call117, 0
  br i1 %tobool118, label %if.then, label %if.else

if.then:                                          ; preds = %for.end114
  store i16 5092, i16* %l_28, align 2
  %tmp120 = load i16* %l_28, align 2
  %conv121 = sext i16 %tmp120 to i32
  store i32 %conv121, i32* %retval
  br label %return

if.else:                                          ; preds = %for.end114
  store i16 -1, i16* %l_33, align 2
  %tmp123 = load i16* %l_33, align 2
  %arrayidx124 = getelementptr inbounds [8 x [1 x i64]]* %l_38, i32 0, i64 3
  %arrayidx125 = getelementptr inbounds [1 x i64]* %arrayidx124, i32 0, i64 0
  %tmp126 = load i64* %arrayidx125, align 8
  %conv127 = trunc i64 %tmp126 to i16
  %tmp128 = load i16* %l_33, align 2
  %tmp129 = load i16* getelementptr inbounds ([6 x i16]* @g_14, i32 0, i64 0), align 2
  %call130 = call signext i16 @safe_div_func_int16_t_s_s(i16 signext %tmp128, i16 signext %tmp129)
  %call131 = call signext i16 @safe_mul_func_int16_t_s_s(i16 signext %conv127, i16 signext %call130)
  %conv132 = sext i16 %call131 to i32
  %tmp133 = load i16* getelementptr inbounds ([6 x i16]* @g_14, i32 0, i64 4), align 2
  %conv134 = zext i16 %tmp133 to i32
  %call135 = call i32 @safe_add_func_int32_t_s_s(i32 %conv132, i32 %conv134)
  %arrayidx136 = getelementptr inbounds [1 x [9 x i32*]]* %l_50, i32 0, i64 0
  %arrayidx137 = getelementptr inbounds [9 x i32*]* %arrayidx136, i32 0, i64 1
  %tmp138 = load i32** %arrayidx137, align 8
  %tmp139 = load i8* @g_51, align 1
  %conv140 = sext i8 %tmp139 to i64
  %call141 = call i32 @func_43(i32* %tmp138, i64 %conv140, i32** @g_21, i32* @g_22)
  %conv142 = trunc i32 %call141 to i8
  %tmp143 = load i32** @g_21, align 8
  %tmp144 = load i32** @g_21, align 8
  %cmp145 = icmp ne i32* %tmp143, %tmp144
  %conv146 = zext i1 %cmp145 to i32
  %conv147 = trunc i32 %conv146 to i8
  %call148 = call signext i8 @safe_mul_func_int8_t_s_s(i8 signext %conv142, i8 signext %conv147)
  %conv149 = sext i8 %call148 to i32
  %tmp150 = load i16* getelementptr inbounds ([6 x i16]* @g_14, i32 0, i64 2), align 2
  %conv151 = zext i16 %tmp150 to i32
  %tobool152 = icmp ne i32 %conv151, 0
  br i1 %tobool152, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %if.else
  %tmp153 = load i8* @g_51, align 1
  %conv154 = sext i8 %tmp153 to i32
  %tobool155 = icmp ne i32 %conv154, 0
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %if.else
  %0 = phi i1 [ true, %if.else ], [ %tobool155, %lor.rhs ]
  %lor.ext = zext i1 %0 to i32
  %cmp156 = icmp sge i32 %conv149, %lor.ext
  %conv157 = zext i1 %cmp156 to i32
  %xor158 = xor i32 %call135, %conv157
  %conv159 = trunc i32 %xor158 to i16
  %call160 = call zeroext i16 @safe_div_func_uint16_t_u_u(i16 zeroext %tmp123, i16 zeroext %conv159)
  %tmp161 = load i16* getelementptr inbounds ([6 x i16]* @g_14, i32 0, i64 5), align 2
  %call162 = call zeroext i16 @safe_mod_func_uint16_t_u_u(i16 zeroext %call160, i16 zeroext %tmp161)
  %tobool163 = icmp ne i16 %call162, 0
  br i1 %tobool163, label %if.then164, label %if.else196

if.then164:                                       ; preds = %lor.end
  store i32 0, i32* %i167, align 4
  br label %for.cond168

for.cond168:                                      ; preds = %for.inc176, %if.then164
  %tmp169 = load i32* %i167, align 4
  %cmp170 = icmp slt i32 %tmp169, 7
  br i1 %cmp170, label %for.body172, label %for.end179

for.body172:                                      ; preds = %for.cond168
  %tmp173 = load i32* %i167, align 4
  %idxprom174 = sext i32 %tmp173 to i64
  %arrayidx175 = getelementptr inbounds [7 x i64]* %l_56, i32 0, i64 %idxprom174
  store i64 1282768208840480440, i64* %arrayidx175, align 8
  br label %for.inc176

for.inc176:                                       ; preds = %for.body172
  %tmp177 = load i32* %i167, align 4
  %inc178 = add nsw i32 %tmp177, 1
  store i32 %inc178, i32* %i167, align 4
  br label %for.cond168

for.end179:                                       ; preds = %for.cond168
  %call180 = call signext i16 @safe_sub_func_int16_t_s_s(i16 signext 1, i16 signext 25403)
  %conv181 = sext i16 %call180 to i64
  %tmp182 = load i16* getelementptr inbounds ([6 x i16]* @g_14, i32 0, i64 0), align 2
  %conv183 = zext i16 %tmp182 to i64
  %call184 = call i64 @safe_sub_func_uint64_t_u_u(i64 %conv181, i64 %conv183)
  %tobool185 = icmp ne i64 %call184, 0
  br i1 %tobool185, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %for.end179
  %arrayidx186 = getelementptr inbounds [7 x i64]* %l_56, i32 0, i64 6
  %tmp187 = load i64* %arrayidx186, align 8
  %cmp188 = icmp sgt i64 2228369253, %tmp187
  br label %land.end

land.end:                                         ; preds = %land.rhs, %for.end179
  %1 = phi i1 [ false, %for.end179 ], [ %cmp188, %land.rhs ]
  %land.ext = zext i1 %1 to i32
  %tmp190 = load i32* @g_22, align 4
  %and191 = and i32 %tmp190, %land.ext
  store i32 %and191, i32* @g_22, align 4
  %arrayidx192 = getelementptr inbounds [7 x i64]* %l_56, i32 0, i64 6
  %tmp193 = load i64* %arrayidx192, align 8
  %conv194 = trunc i64 %tmp193 to i32
  %call195 = call i32 @safe_add_func_int32_t_s_s(i32 %conv194, i32 -10)
  store i32 %call195, i32* @g_22, align 4
  br label %if.end

if.else196:                                       ; preds = %lor.end
  %tmp197 = load i8* @g_51, align 1
  %conv198 = sext i8 %tmp197 to i32
  store i32 %conv198, i32* %retval
  br label %return

if.end:                                           ; preds = %land.end
  br label %if.end199

if.end199:                                        ; preds = %if.end
  br label %for.inc200

for.inc200:                                       ; preds = %if.end199
  %tmp201 = load i64* %l_23, align 8
  %conv202 = trunc i64 %tmp201 to i32
  %call203 = call i32 @safe_sub_func_int32_t_s_s(i32 %conv202, i32 7)
  %conv204 = sext i32 %call203 to i64
  store i64 %conv204, i64* %l_23, align 8
  br label %for.cond56

for.end205:                                       ; preds = %for.cond56
  %tmp206 = load i8* @g_51, align 1
  %conv207 = sext i8 %tmp206 to i32
  store i32 %conv207, i32* %retval
  br label %return

return:                                           ; preds = %for.end205, %if.else196, %if.then
  %2 = load i32* %retval
  ret i32 %2
}

define i32* @func_2(i32 %p_3, i32* %p_4, i32* %p_5, i16 signext %p_6) nounwind uwtable {
entry:
  %p_3.addr = alloca i32, align 4
  %p_4.addr = alloca i32*, align 8
  %p_5.addr = alloca i32*, align 8
  %p_6.addr = alloca i16, align 2
  store i32 %p_3, i32* %p_3.addr, align 4
  store i32* %p_4, i32** %p_4.addr, align 8
  store i32* %p_5, i32** %p_5.addr, align 8
  store i16 %p_6, i16* %p_6.addr, align 2
  %tmp = load i32** %p_5.addr, align 8
  ret i32* %tmp
}

define internal signext i16 @safe_mul_func_int16_t_s_s(i16 signext %si1, i16 signext %si2) nounwind uwtable {
entry:
  %si1.addr = alloca i16, align 2
  %si2.addr = alloca i16, align 2
  store i16 %si1, i16* %si1.addr, align 2
  store i16 %si2, i16* %si2.addr, align 2
  %tmp = load i16* %si1.addr, align 2
  %conv = sext i16 %tmp to i32
  %tmp1 = load i16* %si2.addr, align 2
  %conv2 = sext i16 %tmp1 to i32
  %mul = mul nsw i32 %conv, %conv2
  %conv3 = trunc i32 %mul to i16
  ret i16 %conv3
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

define internal signext i8 @safe_lshift_func_int8_t_s_s(i8 signext %left, i32 %right) nounwind uwtable {
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
  %cmp3 = icmp slt i32 %tmp2, 0
  br i1 %cmp3, label %cond.true, label %lor.lhs.false5

lor.lhs.false5:                                   ; preds = %lor.lhs.false
  %tmp6 = load i32* %right.addr, align 4
  %cmp7 = icmp sge i32 %tmp6, 32
  br i1 %cmp7, label %cond.true, label %lor.lhs.false9

lor.lhs.false9:                                   ; preds = %lor.lhs.false5
  %tmp10 = load i8* %left.addr, align 1
  %conv11 = sext i8 %tmp10 to i32
  %tmp12 = load i32* %right.addr, align 4
  %shr = ashr i32 127, %tmp12
  %cmp13 = icmp sgt i32 %conv11, %shr
  br i1 %cmp13, label %cond.true, label %cond.false

cond.true:                                        ; preds = %lor.lhs.false9, %lor.lhs.false5, %lor.lhs.false, %entry
  %tmp15 = load i8* %left.addr, align 1
  %conv16 = sext i8 %tmp15 to i32
  br label %cond.end

cond.false:                                       ; preds = %lor.lhs.false9
  %tmp17 = load i8* %left.addr, align 1
  %conv18 = sext i8 %tmp17 to i32
  %tmp19 = load i32* %right.addr, align 4
  %shl = shl i32 %conv18, %tmp19
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %conv16, %cond.true ], [ %shl, %cond.false ]
  %conv20 = trunc i32 %cond to i8
  ret i8 %conv20
}

define internal i64 @safe_mod_func_int64_t_s_s(i64 %si1, i64 %si2) nounwind uwtable {
entry:
  %si1.addr = alloca i64, align 8
  %si2.addr = alloca i64, align 8
  store i64 %si1, i64* %si1.addr, align 8
  store i64 %si2, i64* %si2.addr, align 8
  %tmp = load i64* %si2.addr, align 8
  %cmp = icmp eq i64 %tmp, 0
  br i1 %cmp, label %cond.true, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %tmp1 = load i64* %si1.addr, align 8
  %cmp2 = icmp eq i64 %tmp1, -9223372036854775808
  br i1 %cmp2, label %land.lhs.true, label %cond.false

land.lhs.true:                                    ; preds = %lor.lhs.false
  %tmp3 = load i64* %si2.addr, align 8
  %cmp4 = icmp eq i64 %tmp3, -1
  br i1 %cmp4, label %cond.true, label %cond.false

cond.true:                                        ; preds = %land.lhs.true, %entry
  %tmp5 = load i64* %si1.addr, align 8
  br label %cond.end

cond.false:                                       ; preds = %land.lhs.true, %lor.lhs.false
  %tmp6 = load i64* %si1.addr, align 8
  %tmp7 = load i64* %si2.addr, align 8
  %rem = srem i64 %tmp6, %tmp7
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i64 [ %tmp5, %cond.true ], [ %rem, %cond.false ]
  ret i64 %cond
}

define internal zeroext i16 @safe_mul_func_uint16_t_u_u(i16 zeroext %ui1, i16 zeroext %ui2) nounwind uwtable {
entry:
  %ui1.addr = alloca i16, align 2
  %ui2.addr = alloca i16, align 2
  store i16 %ui1, i16* %ui1.addr, align 2
  store i16 %ui2, i16* %ui2.addr, align 2
  %tmp = load i16* %ui1.addr, align 2
  %conv = zext i16 %tmp to i32
  %tmp1 = load i16* %ui2.addr, align 2
  %conv2 = zext i16 %tmp1 to i32
  %mul = mul i32 %conv, %conv2
  %conv3 = trunc i32 %mul to i16
  ret i16 %conv3
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

define internal zeroext i16 @safe_div_func_uint16_t_u_u(i16 zeroext %ui1, i16 zeroext %ui2) nounwind uwtable {
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
  %div = sdiv i32 %conv5, %conv7
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %conv3, %cond.true ], [ %div, %cond.false ]
  %conv8 = trunc i32 %cond to i16
  ret i16 %conv8
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

define internal signext i8 @safe_mul_func_int8_t_s_s(i8 signext %si1, i8 signext %si2) nounwind uwtable {
entry:
  %si1.addr = alloca i8, align 1
  %si2.addr = alloca i8, align 1
  store i8 %si1, i8* %si1.addr, align 1
  store i8 %si2, i8* %si2.addr, align 1
  %tmp = load i8* %si1.addr, align 1
  %conv = sext i8 %tmp to i32
  %tmp1 = load i8* %si2.addr, align 1
  %conv2 = sext i8 %tmp1 to i32
  %mul = mul nsw i32 %conv, %conv2
  %conv3 = trunc i32 %mul to i8
  ret i8 %conv3
}

define i32 @func_43(i32* %p_44, i64 %p_45, i32** %p_46, i32* %p_47) nounwind uwtable {
entry:
  %p_44.addr = alloca i32*, align 8
  %p_45.addr = alloca i64, align 8
  %p_46.addr = alloca i32**, align 8
  %p_47.addr = alloca i32*, align 8
  %l_48 = alloca [9 x i16], align 16
  %l_49 = alloca i16, align 2
  %i = alloca i32, align 4
  store i32* %p_44, i32** %p_44.addr, align 8
  store i64 %p_45, i64* %p_45.addr, align 8
  store i32** %p_46, i32*** %p_46.addr, align 8
  store i32* %p_47, i32** %p_47.addr, align 8
  store i16 -3963, i16* %l_49, align 2
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp, 9
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp1 = load i32* %i, align 4
  %idxprom = sext i32 %tmp1 to i64
  %arrayidx = getelementptr inbounds [9 x i16]* %l_48, i32 0, i64 %idxprom
  store i16 -1, i16* %arrayidx, align 2
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %tmp2 = load i32* %i, align 4
  %inc = add nsw i32 %tmp2, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %arrayidx3 = getelementptr inbounds [9 x i16]* %l_48, i32 0, i64 5
  %tmp4 = load i16* %arrayidx3, align 2
  %conv = sext i16 %tmp4 to i64
  %and = and i64 %conv, -4
  %conv5 = trunc i64 %and to i32
  %tmp6 = load i32** %p_47.addr, align 8
  store i32 %conv5, i32* %tmp6
  %tmp7 = load i16* %l_49, align 2
  %conv8 = sext i16 %tmp7 to i32
  ret i32 %conv8
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

define internal signext i16 @safe_sub_func_int16_t_s_s(i16 signext %si1, i16 signext %si2) nounwind uwtable {
entry:
  %si1.addr = alloca i16, align 2
  %si2.addr = alloca i16, align 2
  store i16 %si1, i16* %si1.addr, align 2
  store i16 %si2, i16* %si2.addr, align 2
  %tmp = load i16* %si1.addr, align 2
  %conv = sext i16 %tmp to i32
  %tmp1 = load i16* %si2.addr, align 2
  %conv2 = sext i16 %tmp1 to i32
  %sub = sub nsw i32 %conv, %conv2
  %conv3 = trunc i32 %sub to i16
  ret i16 %conv3
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
  %tmp = load i16* getelementptr inbounds ([6 x i16]* @g_14, i32 0, i64 0), align 2
  %conv = zext i16 %tmp to i32
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str, i32 0, i32 0), i32 %conv)
  %tmp2 = load i16* getelementptr inbounds ([6 x i16]* @g_14, i32 0, i64 1), align 2
  %conv3 = zext i16 %tmp2 to i32
  %call4 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str1, i32 0, i32 0), i32 %conv3)
  %tmp5 = load i16* getelementptr inbounds ([6 x i16]* @g_14, i32 0, i64 2), align 2
  %conv6 = zext i16 %tmp5 to i32
  %call7 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str2, i32 0, i32 0), i32 %conv6)
  %tmp8 = load i16* getelementptr inbounds ([6 x i16]* @g_14, i32 0, i64 3), align 2
  %conv9 = zext i16 %tmp8 to i32
  %call10 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str3, i32 0, i32 0), i32 %conv9)
  %tmp11 = load i16* getelementptr inbounds ([6 x i16]* @g_14, i32 0, i64 4), align 2
  %conv12 = zext i16 %tmp11 to i32
  %call13 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str4, i32 0, i32 0), i32 %conv12)
  %tmp14 = load i16* getelementptr inbounds ([6 x i16]* @g_14, i32 0, i64 5), align 2
  %conv15 = zext i16 %tmp14 to i32
  %call16 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str5, i32 0, i32 0), i32 %conv15)
  %tmp17 = load i16* getelementptr inbounds ([6 x i16]* @g_14, i32 0, i64 0), align 2
  %conv18 = zext i16 %tmp17 to i32
  %call19 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str, i32 0, i32 0), i32 %conv18)
  %tmp20 = load i32* @g_22, align 4
  %call21 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str6, i32 0, i32 0), i32 %tmp20)
  %tmp22 = load i8* @g_51, align 1
  %conv23 = sext i8 %tmp22 to i32
  %call24 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str7, i32 0, i32 0), i32 %conv23)
  %0 = load i32* %retval
  ret i32 %0
}

declare i32 @printf(i8*, ...)
