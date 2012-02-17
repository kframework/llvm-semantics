; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith001014.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = global i32 -250458367, align 4
@g_4 = global i32 740926431, align 4
@g_3 = global i32* @g_4, align 8
@g_6 = global i32* null, align 8
@g_7 = global i32* null, align 8
@g_26 = global i32 -4, align 4
@g_25 = global i32* @g_26, align 8
@.str = private unnamed_addr constant [19 x i8] c"checksum g_2 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [19 x i8] c"checksum g_4 = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [20 x i8] c"checksum g_26 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define zeroext i16 @func_1() nounwind uwtable {
entry:
  %retval = alloca i16, align 2
  %l_5 = alloca i8, align 1
  %l_8 = alloca [7 x [4 x i32]], align 16
  %l_14 = alloca i32*, align 8
  %l_38 = alloca i32*, align 8
  %l_39 = alloca i32*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %l_11 = alloca i32, align 4
  %l_15 = alloca i32*, align 8
  %l_24 = alloca i32, align 4
  store i8 -90, i8* %l_5, align 1
  store i32* null, i32** %l_14, align 8
  store i32* null, i32** %l_38, align 8
  store i32* @g_4, i32** %l_39, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc10, %entry
  %tmp = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp, 7
  br i1 %cmp, label %for.body, label %for.end13

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc, %for.body
  %tmp2 = load i32* %j, align 4
  %cmp3 = icmp slt i32 %tmp2, 4
  br i1 %cmp3, label %for.body4, label %for.end

for.body4:                                        ; preds = %for.cond1
  %tmp5 = load i32* %j, align 4
  %idxprom = sext i32 %tmp5 to i64
  %tmp6 = load i32* %i, align 4
  %idxprom7 = sext i32 %tmp6 to i64
  %arrayidx = getelementptr inbounds [7 x [4 x i32]]* %l_8, i32 0, i64 %idxprom7
  %arrayidx8 = getelementptr inbounds [4 x i32]* %arrayidx, i32 0, i64 %idxprom
  store i32 506063425, i32* %arrayidx8, align 4
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
  %tmp14 = load i32* @g_2, align 4
  %tmp15 = volatile load i32** @g_3, align 8
  %tmp16 = load i32* %tmp15
  %and = and i32 %tmp16, %tmp14
  store i32 %and, i32* %tmp15
  %tmp17 = volatile load i32** @g_3, align 8
  %tmp18 = load i32* %tmp17
  %and19 = and i32 %tmp18, 166
  store i32 %and19, i32* %tmp17
  store i32 6, i32* @g_2, align 4
  br label %for.cond20

for.cond20:                                       ; preds = %for.inc167, %for.end13
  %tmp21 = load i32* @g_2, align 4
  %cmp22 = icmp sge i32 %tmp21, 0
  br i1 %cmp22, label %for.body23, label %for.end170

for.body23:                                       ; preds = %for.cond20
  store i32 3, i32* @g_4, align 4
  br label %for.cond24

for.cond24:                                       ; preds = %for.inc163, %for.body23
  %tmp25 = load i32* @g_4, align 4
  %cmp26 = icmp sge i32 %tmp25, 0
  br i1 %cmp26, label %for.body27, label %for.end166

for.body27:                                       ; preds = %for.cond24
  store i32 0, i32* %l_11, align 4
  store i32* null, i32** %l_15, align 8
  store i32 -707375256, i32* %l_24, align 4
  %tmp31 = load i32* %l_11, align 4
  %tmp32 = load i32** %l_14, align 8
  %tmp33 = load i32** %l_15, align 8
  %cmp34 = icmp ne i32* %tmp32, %tmp33
  %conv = zext i1 %cmp34 to i32
  %conv35 = sext i32 %conv to i64
  %tmp36 = load i32** %l_14, align 8
  %cmp37 = icmp eq i32* @g_4, %tmp36
  %conv38 = zext i1 %cmp37 to i32
  %conv39 = sext i32 %conv38 to i64
  %call = call i64 @safe_add_func_int64_t_s_s(i64 %conv35, i64 %conv39)
  %tmp40 = volatile load i32** @g_3, align 8
  %tmp41 = load i32* %tmp40
  %conv42 = sext i32 %tmp41 to i64
  %cmp43 = icmp slt i64 %call, %conv42
  %conv44 = zext i1 %cmp43 to i32
  %tmp45 = load i32* @g_4, align 4
  %cmp46 = icmp sgt i32 %conv44, %tmp45
  %conv47 = zext i1 %cmp46 to i32
  %cmp48 = icmp slt i32 %tmp31, %conv47
  %conv49 = zext i1 %cmp48 to i32
  %conv50 = trunc i32 %conv49 to i8
  %tmp51 = load i32* @g_4, align 4
  %add = add nsw i32 %tmp51, 2
  %rem = urem i32 %add, 4
  %idxprom52 = zext i32 %rem to i64
  %tmp53 = load i32* @g_2, align 4
  %rem54 = urem i32 %tmp53, 7
  %idxprom55 = zext i32 %rem54 to i64
  %arrayidx56 = getelementptr inbounds [7 x [4 x i32]]* %l_8, i32 0, i64 %idxprom55
  %arrayidx57 = getelementptr inbounds [4 x i32]* %arrayidx56, i32 0, i64 %idxprom52
  %tmp58 = load i32* %arrayidx57, align 4
  %conv59 = zext i32 %tmp58 to i64
  %tmp60 = load i32* @g_4, align 4
  %rem61 = urem i32 %tmp60, 4
  %idxprom62 = zext i32 %rem61 to i64
  %tmp63 = load i32* @g_2, align 4
  %rem64 = urem i32 %tmp63, 7
  %idxprom65 = zext i32 %rem64 to i64
  %arrayidx66 = getelementptr inbounds [7 x [4 x i32]]* %l_8, i32 0, i64 %idxprom65
  %arrayidx67 = getelementptr inbounds [4 x i32]* %arrayidx66, i32 0, i64 %idxprom62
  %tmp68 = load i32* %arrayidx67, align 4
  %tmp69 = load i32* @g_2, align 4
  %cmp70 = icmp uge i32 %tmp68, %tmp69
  br i1 %cmp70, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %for.body27
  %tmp72 = load i32* @g_2, align 4
  %conv73 = trunc i32 %tmp72 to i8
  %tmp74 = load i32* @g_4, align 4
  %rem75 = urem i32 %tmp74, 4
  %idxprom76 = zext i32 %rem75 to i64
  %tmp77 = load i32* @g_2, align 4
  %rem78 = urem i32 %tmp77, 7
  %idxprom79 = zext i32 %rem78 to i64
  %arrayidx80 = getelementptr inbounds [7 x [4 x i32]]* %l_8, i32 0, i64 %idxprom79
  %arrayidx81 = getelementptr inbounds [4 x i32]* %arrayidx80, i32 0, i64 %idxprom76
  %tmp82 = load i32* %arrayidx81, align 4
  %conv83 = trunc i32 %tmp82 to i8
  %call84 = call signext i8 @safe_mod_func_int8_t_s_s(i8 signext %conv73, i8 signext %conv83)
  %conv85 = sext i8 %call84 to i32
  %tobool = icmp ne i32 %conv85, 0
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %for.body27
  %0 = phi i1 [ true, %for.body27 ], [ %tobool, %lor.rhs ]
  %lor.ext = zext i1 %0 to i32
  %tmp86 = load i32* @g_4, align 4
  %tobool87 = icmp ne i32 %tmp86, 0
  br i1 %tobool87, label %lor.end99, label %lor.rhs88

lor.rhs88:                                        ; preds = %lor.end
  %tmp89 = load i32* @g_4, align 4
  %rem90 = urem i32 %tmp89, 4
  %idxprom91 = zext i32 %rem90 to i64
  %tmp92 = load i32* @g_2, align 4
  %rem93 = urem i32 %tmp92, 7
  %idxprom94 = zext i32 %rem93 to i64
  %arrayidx95 = getelementptr inbounds [7 x [4 x i32]]* %l_8, i32 0, i64 %idxprom94
  %arrayidx96 = getelementptr inbounds [4 x i32]* %arrayidx95, i32 0, i64 %idxprom91
  %tmp97 = load i32* %arrayidx96, align 4
  %tobool98 = icmp ne i32 %tmp97, 0
  br label %lor.end99

lor.end99:                                        ; preds = %lor.rhs88, %lor.end
  %1 = phi i1 [ true, %lor.end ], [ %tobool98, %lor.rhs88 ]
  %lor.ext100 = zext i1 %1 to i32
  %tmp101 = load i32* @g_4, align 4
  %rem102 = urem i32 %tmp101, 4
  %idxprom103 = zext i32 %rem102 to i64
  %tmp104 = load i32* @g_2, align 4
  %rem105 = urem i32 %tmp104, 7
  %idxprom106 = zext i32 %rem105 to i64
  %arrayidx107 = getelementptr inbounds [7 x [4 x i32]]* %l_8, i32 0, i64 %idxprom106
  %arrayidx108 = getelementptr inbounds [4 x i32]* %arrayidx107, i32 0, i64 %idxprom103
  %tmp109 = load i32* %arrayidx108, align 4
  %tmp110 = load i32* @g_2, align 4
  %and111 = and i32 %tmp109, %tmp110
  %cmp112 = icmp ugt i32 %lor.ext100, %and111
  %conv113 = zext i1 %cmp112 to i32
  %cmp114 = icmp sle i32 %lor.ext, %conv113
  %conv115 = zext i1 %cmp114 to i32
  %conv116 = sext i32 %conv115 to i64
  %call117 = call i64 @safe_div_func_uint64_t_u_u(i64 %conv59, i64 %conv116)
  %conv118 = trunc i64 %call117 to i8
  %tmp119 = load i32* @g_4, align 4
  %rem120 = urem i32 %tmp119, 4
  %idxprom121 = zext i32 %rem120 to i64
  %tmp122 = load i32* @g_2, align 4
  %rem123 = urem i32 %tmp122, 7
  %idxprom124 = zext i32 %rem123 to i64
  %arrayidx125 = getelementptr inbounds [7 x [4 x i32]]* %l_8, i32 0, i64 %idxprom124
  %arrayidx126 = getelementptr inbounds [4 x i32]* %arrayidx125, i32 0, i64 %idxprom121
  %tmp127 = load i32* %arrayidx126, align 4
  %conv128 = zext i32 %tmp127 to i64
  %tmp129 = load i32* @g_2, align 4
  %tmp130 = load i32* @g_4, align 4
  %rem131 = urem i32 %tmp130, 4
  %idxprom132 = zext i32 %rem131 to i64
  %tmp133 = load i32* @g_2, align 4
  %rem134 = urem i32 %tmp133, 7
  %idxprom135 = zext i32 %rem134 to i64
  %arrayidx136 = getelementptr inbounds [7 x [4 x i32]]* %l_8, i32 0, i64 %idxprom135
  %arrayidx137 = getelementptr inbounds [4 x i32]* %arrayidx136, i32 0, i64 %idxprom132
  %tmp138 = load i32* %arrayidx137, align 4
  %cmp139 = icmp uge i32 %tmp129, %tmp138
  br i1 %cmp139, label %lor.end144, label %lor.rhs141

lor.rhs141:                                       ; preds = %lor.end99
  %tmp142 = load i32* %l_24, align 4
  %tobool143 = icmp ne i32 %tmp142, 0
  br label %lor.end144

lor.end144:                                       ; preds = %lor.rhs141, %lor.end99
  %2 = phi i1 [ true, %lor.end99 ], [ %tobool143, %lor.rhs141 ]
  %lor.ext145 = zext i1 %2 to i32
  %tmp146 = load i32* @g_4, align 4
  %xor = xor i32 %lor.ext145, %tmp146
  %conv147 = sext i32 %xor to i64
  %call148 = call i64 @safe_sub_func_uint64_t_u_u(i64 %conv128, i64 %conv147)
  %conv149 = trunc i64 %call148 to i8
  %call150 = call zeroext i8 @safe_mul_func_uint8_t_u_u(i8 zeroext %conv118, i8 zeroext %conv149)
  %call151 = call signext i8 @safe_add_func_int8_t_s_s(i8 signext %conv50, i8 signext %call150)
  %conv152 = sext i8 %call151 to i32
  %tmp153 = volatile load i32** @g_25, align 8
  store i32 %conv152, i32* %tmp153
  %tmp154 = load i32* %l_24, align 4
  %tobool155 = icmp ne i32 %tmp154, 0
  br i1 %tobool155, label %if.then, label %if.end

if.then:                                          ; preds = %lor.end144
  br label %lbl_27

if.end:                                           ; preds = %lor.end144
  br label %lbl_27

lbl_27:                                           ; preds = %if.end, %if.then
  %tmp156 = volatile load i32** @g_3, align 8
  %tmp157 = load i32* %tmp156
  %tobool158 = icmp ne i32 %tmp157, 0
  br i1 %tobool158, label %if.then159, label %if.end160

if.then159:                                       ; preds = %lbl_27
  br label %for.inc163

if.end160:                                        ; preds = %lbl_27
  %tmp161 = load i32* @g_2, align 4
  %conv162 = trunc i32 %tmp161 to i16
  store i16 %conv162, i16* %retval
  br label %return

for.inc163:                                       ; preds = %if.then159
  %tmp164 = load i32* @g_4, align 4
  %add165 = add nsw i32 %tmp164, -4
  store i32 %add165, i32* @g_4, align 4
  br label %for.cond24

for.end166:                                       ; preds = %for.cond24
  br label %for.inc167

for.inc167:                                       ; preds = %for.end166
  %tmp168 = load i32* @g_2, align 4
  %add169 = add nsw i32 %tmp168, -2
  store i32 %add169, i32* @g_2, align 4
  br label %for.cond20

for.end170:                                       ; preds = %for.cond20
  %tmp171 = volatile load i32** @g_3, align 8
  %tmp172 = load i32* %tmp171
  %tmp173 = load i32* @g_4, align 4
  %call174 = call i32 @safe_mod_func_int32_t_s_s(i32 %tmp172, i32 %tmp173)
  %conv175 = trunc i32 %call174 to i8
  %tmp176 = load i32* @g_4, align 4
  %conv177 = trunc i32 %tmp176 to i8
  %call178 = call signext i8 @safe_mul_func_int8_t_s_s(i8 signext %conv175, i8 signext %conv177)
  %conv179 = sext i8 %call178 to i32
  %arrayidx180 = getelementptr inbounds [7 x [4 x i32]]* %l_8, i32 0, i64 2
  %arrayidx181 = getelementptr inbounds [4 x i32]* %arrayidx180, i32 0, i64 1
  %tmp182 = load i32* %arrayidx181, align 4
  %call183 = call i32 @safe_sub_func_uint32_t_u_u(i32 %conv179, i32 %tmp182)
  %conv184 = trunc i32 %call183 to i16
  %tmp185 = load i32* @g_26, align 4
  %conv186 = trunc i32 %tmp185 to i16
  %call187 = call signext i16 @safe_add_func_int16_t_s_s(i16 signext %conv184, i16 signext %conv186)
  %conv188 = sext i16 %call187 to i64
  %cmp189 = icmp sle i64 5, %conv188
  %conv190 = zext i1 %cmp189 to i32
  %tmp191 = load i32* @g_2, align 4
  %conv192 = trunc i32 %tmp191 to i16
  %arrayidx193 = getelementptr inbounds [7 x [4 x i32]]* %l_8, i32 0, i64 5
  %arrayidx194 = getelementptr inbounds [4 x i32]* %arrayidx193, i32 0, i64 1
  %tmp195 = load i32* %arrayidx194, align 4
  %conv196 = trunc i32 %tmp195 to i16
  %call197 = call signext i16 @safe_sub_func_int16_t_s_s(i16 signext %conv192, i16 signext %conv196)
  %conv198 = sext i16 %call197 to i32
  %cmp199 = icmp eq i32 %conv190, %conv198
  %conv200 = zext i1 %cmp199 to i32
  %tmp201 = load i32** %l_39, align 8
  store i32 %conv200, i32* %tmp201
  %tmp202 = load i32* @g_4, align 4
  %conv203 = trunc i32 %tmp202 to i16
  store i16 %conv203, i16* %retval
  br label %return

return:                                           ; preds = %for.end170, %if.end160
  %3 = load i16* %retval
  ret i16 %3
}

define internal signext i8 @safe_add_func_int8_t_s_s(i8 signext %si1, i8 signext %si2) nounwind uwtable {
entry:
  %si1.addr = alloca i8, align 1
  %si2.addr = alloca i8, align 1
  store i8 %si1, i8* %si1.addr, align 1
  store i8 %si2, i8* %si2.addr, align 1
  %tmp = load i8* %si1.addr, align 1
  %conv = sext i8 %tmp to i32
  %tmp1 = load i8* %si2.addr, align 1
  %conv2 = sext i8 %tmp1 to i32
  %add = add nsw i32 %conv, %conv2
  %conv3 = trunc i32 %add to i8
  ret i8 %conv3
}

define internal i64 @safe_add_func_int64_t_s_s(i64 %si1, i64 %si2) nounwind uwtable {
entry:
  %si1.addr = alloca i64, align 8
  %si2.addr = alloca i64, align 8
  store i64 %si1, i64* %si1.addr, align 8
  store i64 %si2, i64* %si2.addr, align 8
  %tmp = load i64* %si1.addr, align 8
  %cmp = icmp sgt i64 %tmp, 0
  br i1 %cmp, label %land.lhs.true, label %lor.lhs.false

land.lhs.true:                                    ; preds = %entry
  %tmp1 = load i64* %si2.addr, align 8
  %cmp2 = icmp sgt i64 %tmp1, 0
  br i1 %cmp2, label %land.lhs.true3, label %lor.lhs.false

land.lhs.true3:                                   ; preds = %land.lhs.true
  %tmp4 = load i64* %si1.addr, align 8
  %tmp5 = load i64* %si2.addr, align 8
  %sub = sub nsw i64 9223372036854775807, %tmp5
  %cmp6 = icmp sgt i64 %tmp4, %sub
  br i1 %cmp6, label %cond.true, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %land.lhs.true3, %land.lhs.true, %entry
  %tmp7 = load i64* %si1.addr, align 8
  %cmp8 = icmp slt i64 %tmp7, 0
  br i1 %cmp8, label %land.lhs.true9, label %cond.false

land.lhs.true9:                                   ; preds = %lor.lhs.false
  %tmp10 = load i64* %si2.addr, align 8
  %cmp11 = icmp slt i64 %tmp10, 0
  br i1 %cmp11, label %land.lhs.true12, label %cond.false

land.lhs.true12:                                  ; preds = %land.lhs.true9
  %tmp13 = load i64* %si1.addr, align 8
  %tmp14 = load i64* %si2.addr, align 8
  %sub15 = sub nsw i64 -9223372036854775808, %tmp14
  %cmp16 = icmp slt i64 %tmp13, %sub15
  br i1 %cmp16, label %cond.true, label %cond.false

cond.true:                                        ; preds = %land.lhs.true12, %land.lhs.true3
  %tmp17 = load i64* %si1.addr, align 8
  br label %cond.end

cond.false:                                       ; preds = %land.lhs.true12, %land.lhs.true9, %lor.lhs.false
  %tmp18 = load i64* %si1.addr, align 8
  %tmp19 = load i64* %si2.addr, align 8
  %add = add nsw i64 %tmp18, %tmp19
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i64 [ %tmp17, %cond.true ], [ %add, %cond.false ]
  ret i64 %cond
}

define internal zeroext i8 @safe_mul_func_uint8_t_u_u(i8 zeroext %ui1, i8 zeroext %ui2) nounwind uwtable {
entry:
  %ui1.addr = alloca i8, align 1
  %ui2.addr = alloca i8, align 1
  store i8 %ui1, i8* %ui1.addr, align 1
  store i8 %ui2, i8* %ui2.addr, align 1
  %tmp = load i8* %ui1.addr, align 1
  %conv = zext i8 %tmp to i32
  %tmp1 = load i8* %ui2.addr, align 1
  %conv2 = zext i8 %tmp1 to i32
  %mul = mul i32 %conv, %conv2
  %conv3 = trunc i32 %mul to i8
  ret i8 %conv3
}

define internal i64 @safe_div_func_uint64_t_u_u(i64 %ui1, i64 %ui2) nounwind uwtable {
entry:
  %ui1.addr = alloca i64, align 8
  %ui2.addr = alloca i64, align 8
  store i64 %ui1, i64* %ui1.addr, align 8
  store i64 %ui2, i64* %ui2.addr, align 8
  %tmp = load i64* %ui2.addr, align 8
  %cmp = icmp eq i64 %tmp, 0
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %tmp1 = load i64* %ui1.addr, align 8
  br label %cond.end

cond.false:                                       ; preds = %entry
  %tmp2 = load i64* %ui1.addr, align 8
  %tmp3 = load i64* %ui2.addr, align 8
  %div = udiv i64 %tmp2, %tmp3
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i64 [ %tmp1, %cond.true ], [ %div, %cond.false ]
  ret i64 %cond
}

define internal signext i8 @safe_mod_func_int8_t_s_s(i8 signext %si1, i8 signext %si2) nounwind uwtable {
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
  %rem = srem i32 %conv13, %conv15
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %conv11, %cond.true ], [ %rem, %cond.false ]
  %conv16 = trunc i32 %cond to i8
  ret i8 %conv16
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

define internal i32 @safe_sub_func_uint32_t_u_u(i32 %ui1, i32 %ui2) nounwind uwtable {
entry:
  %ui1.addr = alloca i32, align 4
  %ui2.addr = alloca i32, align 4
  store i32 %ui1, i32* %ui1.addr, align 4
  store i32 %ui2, i32* %ui2.addr, align 4
  %tmp = load i32* %ui1.addr, align 4
  %tmp1 = load i32* %ui2.addr, align 4
  %sub = sub i32 %tmp, %tmp1
  ret i32 %sub
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

define internal i32 @safe_mod_func_int32_t_s_s(i32 %si1, i32 %si2) nounwind uwtable {
entry:
  %si1.addr = alloca i32, align 4
  %si2.addr = alloca i32, align 4
  store i32 %si1, i32* %si1.addr, align 4
  store i32 %si2, i32* %si2.addr, align 4
  %tmp = load i32* %si2.addr, align 4
  %cmp = icmp eq i32 %tmp, 0
  br i1 %cmp, label %cond.true, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %tmp1 = load i32* %si1.addr, align 4
  %cmp2 = icmp eq i32 %tmp1, -2147483648
  br i1 %cmp2, label %land.lhs.true, label %cond.false

land.lhs.true:                                    ; preds = %lor.lhs.false
  %tmp3 = load i32* %si2.addr, align 4
  %cmp4 = icmp eq i32 %tmp3, -1
  br i1 %cmp4, label %cond.true, label %cond.false

cond.true:                                        ; preds = %land.lhs.true, %entry
  %tmp5 = load i32* %si1.addr, align 4
  br label %cond.end

cond.false:                                       ; preds = %land.lhs.true, %lor.lhs.false
  %tmp6 = load i32* %si1.addr, align 4
  %tmp7 = load i32* %si2.addr, align 4
  %rem = srem i32 %tmp6, %tmp7
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %tmp5, %cond.true ], [ %rem, %cond.false ]
  ret i32 %cond
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

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  %call = call zeroext i16 @func_1()
  %tmp = load i32* @g_2, align 4
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %tmp)
  %tmp2 = load i32* @g_4, align 4
  %call3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str1, i32 0, i32 0), i32 %tmp2)
  %tmp4 = load i32* @g_26, align 4
  %call5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str2, i32 0, i32 0), i32 %tmp4)
  %0 = load i32* %retval
  ret i32 %0
}

declare i32 @printf(i8*, ...)
