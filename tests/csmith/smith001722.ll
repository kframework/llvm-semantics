; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith001722.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_3 = global i32 9, align 4
@g_6 = global i32* @g_3, align 8
@g_5 = global i32** @g_6, align 8
@g_17 = global i16 -11857, align 2
@.str = private unnamed_addr constant [19 x i8] c"checksum g_3 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [20 x i8] c"checksum g_17 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define zeroext i16 @func_1() nounwind uwtable {
entry:
  %retval = alloca i16, align 2
  %l_2 = alloca [7 x i64], align 16
  %l_19 = alloca i8, align 1
  %l_22 = alloca i32**, align 8
  %l_26 = alloca i32, align 4
  %i = alloca i32, align 4
  %l_4 = alloca [3 x i32*], align 16
  %l_23 = alloca i16, align 2
  %i10 = alloca i32, align 4
  %l_29 = alloca [5 x [4 x i64]], align 16
  %i119 = alloca i32, align 4
  %j = alloca i32, align 4
  store i8 -7, i8* %l_19, align 1
  store i32** @g_6, i32*** %l_22, align 8
  store i32 0, i32* %l_26, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp, 7
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp1 = load i32* %i, align 4
  %idxprom = sext i32 %tmp1 to i64
  %arrayidx = getelementptr inbounds [7 x i64]* %l_2, i32 0, i64 %idxprom
  store i64 1, i64* %arrayidx, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %tmp2 = load i32* %i, align 4
  %inc = add nsw i32 %tmp2, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store i32 6, i32* @g_3, align 4
  br label %for.cond3

for.cond3:                                        ; preds = %for.inc174, %for.end
  %tmp4 = load i32* @g_3, align 4
  %cmp5 = icmp sge i32 %tmp4, 0
  br i1 %cmp5, label %for.body6, label %for.end176

for.body6:                                        ; preds = %for.cond3
  store i16 -9, i16* %l_23, align 2
  store i32 0, i32* %i10, align 4
  br label %for.cond11

for.cond11:                                       ; preds = %for.inc18, %for.body6
  %tmp12 = load i32* %i10, align 4
  %cmp13 = icmp slt i32 %tmp12, 3
  br i1 %cmp13, label %for.body14, label %for.end21

for.body14:                                       ; preds = %for.cond11
  %tmp15 = load i32* %i10, align 4
  %idxprom16 = sext i32 %tmp15 to i64
  %arrayidx17 = getelementptr inbounds [3 x i32*]* %l_4, i32 0, i64 %idxprom16
  store i32* @g_3, i32** %arrayidx17, align 8
  br label %for.inc18

for.inc18:                                        ; preds = %for.body14
  %tmp19 = load i32* %i10, align 4
  %inc20 = add nsw i32 %tmp19, 1
  store i32 %inc20, i32* %i10, align 4
  br label %for.cond11

for.end21:                                        ; preds = %for.cond11
  %arrayidx22 = getelementptr inbounds [3 x i32*]* %l_4, i32 0, i64 2
  %tmp23 = load i32** %arrayidx22, align 8
  %tmp24 = volatile load i32*** @g_5, align 8
  store i32* %tmp23, i32** %tmp24
  %tmp25 = load i32* @g_3, align 4
  %tobool = icmp ne i32 %tmp25, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %for.end21
  br label %lbl_7

if.end:                                           ; preds = %for.end21
  br label %lbl_7

lbl_7:                                            ; preds = %if.end, %if.then
  %tmp26 = load i32* @g_3, align 4
  %rem = urem i32 %tmp26, 7
  %idxprom27 = zext i32 %rem to i64
  %arrayidx28 = getelementptr inbounds [7 x i64]* %l_2, i32 0, i64 %idxprom27
  %tmp29 = load i64* %arrayidx28, align 8
  %tobool30 = icmp ne i64 %tmp29, 0
  br i1 %tobool30, label %if.then31, label %if.end32

if.then31:                                        ; preds = %lbl_7
  br label %for.inc174

if.end32:                                         ; preds = %lbl_7
  %arrayidx33 = getelementptr inbounds [7 x i64]* %l_2, i32 0, i64 2
  %tmp34 = load i64* %arrayidx33, align 8
  %conv = trunc i64 %tmp34 to i8
  %arrayidx35 = getelementptr inbounds [7 x i64]* %l_2, i32 0, i64 0
  %tmp36 = load i64* %arrayidx35, align 8
  %cmp37 = icmp ne i64 %tmp36, 2639814352
  br i1 %cmp37, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %if.end32
  %tmp39 = volatile load i32*** @g_5, align 8
  %tmp40 = load i32** %tmp39
  %tmp41 = load i32* %tmp40
  %conv42 = trunc i32 %tmp41 to i16
  %tmp43 = load i32* @g_3, align 4
  %rem44 = urem i32 %tmp43, 7
  %idxprom45 = zext i32 %rem44 to i64
  %arrayidx46 = getelementptr inbounds [7 x i64]* %l_2, i32 0, i64 %idxprom45
  %tmp47 = load i64* %arrayidx46, align 8
  %conv48 = trunc i64 %tmp47 to i32
  %call = call zeroext i16 @safe_rshift_func_uint16_t_u_s(i16 zeroext %conv42, i32 %conv48)
  %conv49 = zext i16 %call to i32
  %tobool50 = icmp ne i32 %conv49, 0
  br label %land.end

land.end:                                         ; preds = %land.rhs, %if.end32
  %0 = phi i1 [ false, %if.end32 ], [ %tobool50, %land.rhs ]
  %land.ext = zext i1 %0 to i32
  %tmp51 = load i32* @g_3, align 4
  %rem52 = urem i32 %tmp51, 7
  %idxprom53 = zext i32 %rem52 to i64
  %arrayidx54 = getelementptr inbounds [7 x i64]* %l_2, i32 0, i64 %idxprom53
  %tmp55 = load i64* %arrayidx54, align 8
  %conv56 = trunc i64 %tmp55 to i32
  %arrayidx57 = getelementptr inbounds [7 x i64]* %l_2, i32 0, i64 4
  %tmp58 = load i64* %arrayidx57, align 8
  %neg = xor i64 %tmp58, -1
  %tmp59 = load i8* %l_19, align 1
  %conv60 = zext i8 %tmp59 to i32
  %tmp61 = load i32** @g_6, align 8
  %tmp62 = load i32* %tmp61
  %cmp63 = icmp sgt i32 %conv60, %tmp62
  %conv64 = zext i1 %cmp63 to i32
  %conv65 = sext i32 %conv64 to i64
  %cmp66 = icmp sgt i64 %neg, %conv65
  %conv67 = zext i1 %cmp66 to i32
  %tmp68 = load i32** @g_6, align 8
  %tmp69 = load i32* %tmp68
  %cmp70 = icmp sgt i32 %conv67, %tmp69
  %conv71 = zext i1 %cmp70 to i32
  %conv72 = trunc i32 %conv71 to i16
  %tmp73 = load i32** @g_6, align 8
  %tmp74 = load i32* %tmp73
  %tmp75 = load i32* @g_3, align 4
  %conv76 = trunc i32 %tmp75 to i16
  %tmp77 = load i32** @g_6, align 8
  %tmp78 = load i32* %tmp77
  %tmp79 = load i32** @g_6, align 8
  %tmp80 = load i32* %tmp79
  %conv81 = trunc i32 %tmp80 to i8
  %tmp82 = load i32** @g_6, align 8
  %tmp83 = load i32* %tmp82
  %conv84 = trunc i32 %tmp83 to i8
  %call85 = call signext i8 @safe_mul_func_int8_t_s_s(i8 signext %conv81, i8 signext %conv84)
  %conv86 = sext i8 %call85 to i16
  %tmp87 = load i32** @g_6, align 8
  %tmp88 = load i32* %tmp87
  %tobool89 = icmp ne i32 %tmp88, 0
  br i1 %tobool89, label %land.rhs90, label %land.end94

land.rhs90:                                       ; preds = %land.end
  %tmp91 = load i32** @g_6, align 8
  %tmp92 = load i32* %tmp91
  %tobool93 = icmp ne i32 %tmp92, 0
  br label %land.end94

land.end94:                                       ; preds = %land.rhs90, %land.end
  %1 = phi i1 [ false, %land.end ], [ %tobool93, %land.rhs90 ]
  %land.ext95 = zext i1 %1 to i32
  %conv96 = sext i32 %land.ext95 to i64
  %call97 = call i32 @func_12(i32 %tmp78, i16 zeroext %conv86, i64 %conv96, i32** @g_6)
  %conv98 = sext i32 %call97 to i64
  %tmp99 = load i32*** %l_22, align 8
  %call100 = call i32 @func_12(i32 %tmp74, i16 zeroext %conv76, i64 %conv98, i32** %tmp99)
  %conv101 = sext i32 %call100 to i64
  %call102 = call i32 @func_12(i32 %conv56, i16 zeroext %conv72, i64 %conv101, i32** @g_6)
  %cmp103 = icmp eq i32 %land.ext, %call102
  %conv104 = zext i1 %cmp103 to i32
  %conv105 = trunc i32 %conv104 to i8
  %call106 = call signext i8 @safe_div_func_int8_t_s_s(i8 signext %conv, i8 signext %conv105)
  %conv107 = sext i8 %call106 to i32
  %tmp108 = load i16* %l_23, align 2
  %conv109 = sext i16 %tmp108 to i32
  %or = or i32 %conv109, %conv107
  %conv110 = trunc i32 %or to i16
  store i16 %conv110, i16* %l_23, align 2
  store i16 0, i16* %l_23, align 2
  br label %for.cond111

for.cond111:                                      ; preds = %for.inc168, %land.end94
  %tmp112 = load i16* %l_23, align 2
  %conv113 = sext i16 %tmp112 to i32
  %cmp114 = icmp sle i32 %conv113, 0
  br i1 %cmp114, label %for.body116, label %for.end173

for.body116:                                      ; preds = %for.cond111
  store i32 0, i32* %i119, align 4
  br label %for.cond121

for.cond121:                                      ; preds = %for.inc141, %for.body116
  %tmp122 = load i32* %i119, align 4
  %cmp123 = icmp slt i32 %tmp122, 5
  br i1 %cmp123, label %for.body125, label %for.end144

for.body125:                                      ; preds = %for.cond121
  store i32 0, i32* %j, align 4
  br label %for.cond126

for.cond126:                                      ; preds = %for.inc137, %for.body125
  %tmp127 = load i32* %j, align 4
  %cmp128 = icmp slt i32 %tmp127, 4
  br i1 %cmp128, label %for.body130, label %for.end140

for.body130:                                      ; preds = %for.cond126
  %tmp131 = load i32* %j, align 4
  %idxprom132 = sext i32 %tmp131 to i64
  %tmp133 = load i32* %i119, align 4
  %idxprom134 = sext i32 %tmp133 to i64
  %arrayidx135 = getelementptr inbounds [5 x [4 x i64]]* %l_29, i32 0, i64 %idxprom134
  %arrayidx136 = getelementptr inbounds [4 x i64]* %arrayidx135, i32 0, i64 %idxprom132
  store i64 -3869937105976475284, i64* %arrayidx136, align 8
  br label %for.inc137

for.inc137:                                       ; preds = %for.body130
  %tmp138 = load i32* %j, align 4
  %inc139 = add nsw i32 %tmp138, 1
  store i32 %inc139, i32* %j, align 4
  br label %for.cond126

for.end140:                                       ; preds = %for.cond126
  br label %for.inc141

for.inc141:                                       ; preds = %for.end140
  %tmp142 = load i32* %i119, align 4
  %inc143 = add nsw i32 %tmp142, 1
  store i32 %inc143, i32* %i119, align 4
  br label %for.cond121

for.end144:                                       ; preds = %for.cond121
  %tmp145 = load i32*** %l_22, align 8
  %tmp146 = load i32** %tmp145
  %tmp147 = load i32*** %l_22, align 8
  %tmp148 = load i32** %tmp147
  %cmp149 = icmp ne i32* %tmp146, %tmp148
  %conv150 = zext i1 %cmp149 to i32
  %tmp151 = load i32* %l_26, align 4
  %and = and i32 %tmp151, %conv150
  store i32 %and, i32* %l_26, align 4
  store i16 0, i16* @g_17, align 2
  br label %for.cond152

for.cond152:                                      ; preds = %for.inc162, %for.end144
  %tmp153 = load i16* @g_17, align 2
  %conv154 = zext i16 %tmp153 to i32
  %cmp155 = icmp sle i32 %conv154, -6
  br i1 %cmp155, label %for.body157, label %for.end167

for.body157:                                      ; preds = %for.cond152
  %arrayidx158 = getelementptr inbounds [5 x [4 x i64]]* %l_29, i32 0, i64 3
  %arrayidx159 = getelementptr inbounds [4 x i64]* %arrayidx158, i32 0, i64 2
  %tmp160 = load i64* %arrayidx159, align 8
  %conv161 = trunc i64 %tmp160 to i16
  store i16 %conv161, i16* %retval
  br label %return

for.inc162:                                       ; No predecessors!
  %tmp163 = load i16* @g_17, align 2
  %conv164 = zext i16 %tmp163 to i32
  %call165 = call i32 @safe_add_func_int32_t_s_s(i32 %conv164, i32 1)
  %conv166 = trunc i32 %call165 to i16
  store i16 %conv166, i16* @g_17, align 2
  br label %for.cond152

for.end167:                                       ; preds = %for.cond152
  br label %for.inc168

for.inc168:                                       ; preds = %for.end167
  %tmp169 = load i16* %l_23, align 2
  %conv170 = sext i16 %tmp169 to i32
  %call171 = call i32 @safe_add_func_int32_t_s_s(i32 %conv170, i32 1)
  %conv172 = trunc i32 %call171 to i16
  store i16 %conv172, i16* %l_23, align 2
  br label %for.cond111

for.end173:                                       ; preds = %for.cond111
  br label %for.inc174

for.inc174:                                       ; preds = %for.end173, %if.then31
  %tmp175 = load i32* @g_3, align 4
  %add = add nsw i32 %tmp175, -1
  store i32 %add, i32* @g_3, align 4
  br label %for.cond3

for.end176:                                       ; preds = %for.cond3
  %tmp177 = load i16* @g_17, align 2
  store i16 %tmp177, i16* %retval
  br label %return

return:                                           ; preds = %for.end176, %for.body157
  %2 = load i16* %retval
  ret i16 %2
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

define i32 @func_12(i32 %p_13, i16 zeroext %p_14, i64 %p_15, i32** %p_16) nounwind uwtable {
entry:
  %p_13.addr = alloca i32, align 4
  %p_14.addr = alloca i16, align 2
  %p_15.addr = alloca i64, align 8
  %p_16.addr = alloca i32**, align 8
  %l_18 = alloca i32, align 4
  store i32 %p_13, i32* %p_13.addr, align 4
  store i16 %p_14, i16* %p_14.addr, align 2
  store i64 %p_15, i64* %p_15.addr, align 8
  store i32** %p_16, i32*** %p_16.addr, align 8
  store i32 -9, i32* %l_18, align 4
  %tmp = load i16* @g_17, align 2
  %conv = zext i16 %tmp to i32
  store i32 %conv, i32* %l_18, align 4
  %tmp1 = load i32** @g_6, align 8
  %tmp2 = load i32* %tmp1
  ret i32 %tmp2
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

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  %call = call zeroext i16 @func_1()
  %tmp = load i32* @g_3, align 4
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %tmp)
  %tmp2 = load i16* @g_17, align 2
  %conv = zext i16 %tmp2 to i32
  %call3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str1, i32 0, i32 0), i32 %conv)
  %0 = load i32* %retval
  ret i32 %0
}

declare i32 @printf(i8*, ...)
