; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith000092.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_5 = global [3 x [4 x i32]] [[4 x i32] [i32 -10, i32 -10, i32 -10, i32 -10], [4 x i32] [i32 -10, i32 -10, i32 -10, i32 -10], [4 x i32] [i32 -10, i32 -10, i32 -10, i32 -10]], align 16
@g_33 = global i32 0, align 4
@g_32 = global i32* @g_33, align 8
@g_36 = global i32* @g_33, align 8
@g_38 = global i32* @g_33, align 8
@g_37 = global i32** @g_38, align 8
@.str = private unnamed_addr constant [25 x i8] c"checksum g_5[0][0] = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [25 x i8] c"checksum g_5[0][1] = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [25 x i8] c"checksum g_5[0][2] = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [25 x i8] c"checksum g_5[0][3] = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [25 x i8] c"checksum g_5[1][0] = %d\0A\00", align 1
@.str5 = private unnamed_addr constant [25 x i8] c"checksum g_5[1][1] = %d\0A\00", align 1
@.str6 = private unnamed_addr constant [25 x i8] c"checksum g_5[1][2] = %d\0A\00", align 1
@.str7 = private unnamed_addr constant [25 x i8] c"checksum g_5[1][3] = %d\0A\00", align 1
@.str8 = private unnamed_addr constant [25 x i8] c"checksum g_5[2][0] = %d\0A\00", align 1
@.str9 = private unnamed_addr constant [25 x i8] c"checksum g_5[2][1] = %d\0A\00", align 1
@.str10 = private unnamed_addr constant [25 x i8] c"checksum g_5[2][2] = %d\0A\00", align 1
@.str11 = private unnamed_addr constant [25 x i8] c"checksum g_5[2][3] = %d\0A\00", align 1
@.str12 = private unnamed_addr constant [20 x i8] c"checksum g_33 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable {
entry:
  %l_4 = alloca i8, align 1
  %l_48 = alloca i32*, align 8
  store i8 0, i8* %l_4, align 1
  store i32* @g_33, i32** %l_48, align 8
  %tmp = load i8* %l_4, align 1
  %conv = zext i8 %tmp to i32
  %tmp1 = load i32* getelementptr inbounds ([3 x [4 x i32]]* @g_5, i32 0, i64 2, i64 0), align 4
  %or = or i32 %conv, %tmp1
  %tmp2 = volatile load i32** @g_32, align 8
  %tmp3 = load i32* %tmp2
  %tmp4 = load i32** @g_38, align 8
  %tmp5 = load i32* %tmp4
  %call = call i32 @safe_div_func_uint32_t_u_u(i32 %tmp3, i32 %tmp5)
  %tmp6 = load i8* %l_4, align 1
  %conv7 = zext i8 %tmp6 to i64
  %tmp8 = load i8* %l_4, align 1
  %conv9 = zext i8 %tmp8 to i32
  %call10 = call i32 @func_6(i32 %call, i64 7024505740294227236, i64 0, i64 %conv7, i32 %conv9)
  %xor = xor i32 %or, %call10
  %tmp11 = load i8* %l_4, align 1
  %conv12 = zext i8 %tmp11 to i32
  %call13 = call i32 @safe_mod_func_uint32_t_u_u(i32 %xor, i32 %conv12)
  %neg = xor i32 %call13, -1
  %tmp14 = load i32* getelementptr inbounds ([3 x [4 x i32]]* @g_5, i32 0, i64 1, i64 2), align 4
  %conv15 = sext i32 %tmp14 to i64
  %cmp = icmp ne i64 2826668813, %conv15
  br i1 %cmp, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %entry
  %tmp17 = load i8* %l_4, align 1
  %conv18 = zext i8 %tmp17 to i32
  %tmp19 = load i8* %l_4, align 1
  %conv20 = zext i8 %tmp19 to i32
  %cmp21 = icmp sle i32 %conv18, %conv20
  %conv22 = zext i1 %cmp21 to i32
  %tmp23 = load i8* %l_4, align 1
  %tmp24 = load i32* getelementptr inbounds ([3 x [4 x i32]]* @g_5, i32 0, i64 2, i64 3), align 4
  %conv25 = trunc i32 %tmp24 to i8
  %call26 = call signext i8 @safe_sub_func_int8_t_s_s(i8 signext %tmp23, i8 signext %conv25)
  %conv27 = sext i8 %call26 to i16
  %tmp28 = load i32* getelementptr inbounds ([3 x [4 x i32]]* @g_5, i32 0, i64 0, i64 3), align 4
  %tmp29 = load i32* getelementptr inbounds ([3 x [4 x i32]]* @g_5, i32 0, i64 2, i64 0), align 4
  %or30 = or i32 %tmp28, %tmp29
  %conv31 = trunc i32 %or30 to i16
  %call32 = call signext i16 @safe_div_func_int16_t_s_s(i16 signext %conv27, i16 signext %conv31)
  %conv33 = sext i16 %call32 to i32
  %cmp34 = icmp sle i32 %conv22, %conv33
  %conv35 = zext i1 %cmp34 to i32
  %conv36 = trunc i32 %conv35 to i8
  %call37 = call zeroext i8 @safe_mod_func_uint8_t_u_u(i8 zeroext %conv36, i8 zeroext 93)
  %conv38 = zext i8 %call37 to i32
  %tobool = icmp ne i32 %conv38, 0
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %entry
  %0 = phi i1 [ true, %entry ], [ %tobool, %lor.rhs ]
  %lor.ext = zext i1 %0 to i32
  %xor39 = xor i32 %neg, %lor.ext
  %tmp40 = load i32** %l_48, align 8
  store i32 %xor39, i32* %tmp40
  %tmp41 = load i32** %l_48, align 8
  %tmp42 = load i32* %tmp41
  ret i32 %tmp42
}

define internal i32 @safe_mod_func_uint32_t_u_u(i32 %ui1, i32 %ui2) nounwind uwtable {
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
  %rem = urem i32 %tmp2, %tmp3
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %tmp1, %cond.true ], [ %rem, %cond.false ]
  ret i32 %cond
}

define i32 @func_6(i32 %p_7, i64 %p_8, i64 %p_9, i64 %p_10, i32 %p_11) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %p_7.addr = alloca i32, align 4
  %p_8.addr = alloca i64, align 8
  %p_9.addr = alloca i64, align 8
  %p_10.addr = alloca i64, align 8
  %p_11.addr = alloca i32, align 4
  %l_16 = alloca i32, align 4
  %l_39 = alloca i16, align 2
  %l_25 = alloca [2 x i64], align 16
  %i = alloca i32, align 4
  %l_34 = alloca i32*, align 8
  %l_35 = alloca i32*, align 8
  store i32 %p_7, i32* %p_7.addr, align 4
  store i64 %p_8, i64* %p_8.addr, align 8
  store i64 %p_9, i64* %p_9.addr, align 8
  store i64 %p_10, i64* %p_10.addr, align 8
  store i32 %p_11, i32* %p_11.addr, align 4
  store i32 0, i32* %l_16, align 4
  store i16 -1, i16* %l_39, align 2
  store i64 -20, i64* %p_8.addr, align 8
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp = load i64* %p_8.addr, align 8
  %cmp = icmp ne i64 %tmp, 0
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp1 = load i32* getelementptr inbounds ([3 x [4 x i32]]* @g_5, i32 0, i64 2, i64 0), align 4
  store i32 %tmp1, i32* %retval
  br label %return

for.inc:                                          ; No predecessors!
  %tmp2 = load i64* %p_8.addr, align 8
  %conv = trunc i64 %tmp2 to i32
  %call = call i32 @safe_add_func_uint32_t_u_u(i32 %conv, i32 1)
  %conv3 = zext i32 %call to i64
  store i64 %conv3, i64* %p_8.addr, align 8
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store i64 0, i64* %p_8.addr, align 8
  br label %for.cond4

for.cond4:                                        ; preds = %for.inc86, %for.end
  %tmp5 = load i64* %p_8.addr, align 8
  %cmp6 = icmp ugt i64 %tmp5, 0
  br i1 %cmp6, label %for.body8, label %for.end91

for.body8:                                        ; preds = %for.cond4
  store i32 0, i32* %i, align 4
  br label %for.cond11

for.cond11:                                       ; preds = %for.inc17, %for.body8
  %tmp12 = load i32* %i, align 4
  %cmp13 = icmp slt i32 %tmp12, 2
  br i1 %cmp13, label %for.body15, label %for.end19

for.body15:                                       ; preds = %for.cond11
  %tmp16 = load i32* %i, align 4
  %idxprom = sext i32 %tmp16 to i64
  %arrayidx = getelementptr inbounds [2 x i64]* %l_25, i32 0, i64 %idxprom
  store i64 3879122604978662393, i64* %arrayidx, align 8
  br label %for.inc17

for.inc17:                                        ; preds = %for.body15
  %tmp18 = load i32* %i, align 4
  %inc = add nsw i32 %tmp18, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond11

for.end19:                                        ; preds = %for.cond11
  %tmp20 = load i32* %l_16, align 4
  %conv21 = zext i32 %tmp20 to i64
  %tmp22 = load i64* %p_9.addr, align 8
  %and = and i64 %conv21, %tmp22
  %tobool = icmp ne i64 %and, 0
  br i1 %tobool, label %land.rhs, label %land.end63

land.rhs:                                         ; preds = %for.end19
  %tmp23 = load i32* getelementptr inbounds ([3 x [4 x i32]]* @g_5, i32 0, i64 2, i64 0), align 4
  %conv24 = trunc i32 %tmp23 to i8
  %tmp25 = load i32* getelementptr inbounds ([3 x [4 x i32]]* @g_5, i32 0, i64 0, i64 1), align 4
  %conv26 = trunc i32 %tmp25 to i16
  %tmp27 = load i32* getelementptr inbounds ([3 x [4 x i32]]* @g_5, i32 0, i64 2, i64 0), align 4
  %call28 = call signext i16 @safe_rshift_func_int16_t_s_u(i16 signext %conv26, i32 %tmp27)
  %conv29 = sext i16 %call28 to i32
  %tmp30 = load i32* %l_16, align 4
  %and31 = and i32 %conv29, %tmp30
  %conv32 = trunc i32 %and31 to i16
  %arrayidx33 = getelementptr inbounds [2 x i64]* %l_25, i32 0, i64 0
  %tmp34 = load i64* %arrayidx33, align 8
  %conv35 = trunc i64 %tmp34 to i16
  %call36 = call signext i16 @safe_sub_func_int16_t_s_s(i16 signext %conv32, i16 signext %conv35)
  %conv37 = trunc i16 %call36 to i8
  %arrayidx38 = getelementptr inbounds [2 x i64]* %l_25, i32 0, i64 0
  %tmp39 = load i64* %arrayidx38, align 8
  %conv40 = trunc i64 %tmp39 to i32
  %tmp41 = load i64* %p_10.addr, align 8
  %tobool42 = icmp ne i64 %tmp41, 0
  br i1 %tobool42, label %land.rhs43, label %land.end

land.rhs43:                                       ; preds = %land.rhs
  %arrayidx44 = getelementptr inbounds [2 x i64]* %l_25, i32 0, i64 1
  %tmp45 = load i64* %arrayidx44, align 8
  %tobool46 = icmp ne i64 %tmp45, 0
  br label %land.end

land.end:                                         ; preds = %land.rhs43, %land.rhs
  %0 = phi i1 [ false, %land.rhs ], [ %tobool46, %land.rhs43 ]
  %land.ext = zext i1 %0 to i32
  %conv47 = trunc i32 %land.ext to i16
  %tmp48 = load i64* %p_8.addr, align 8
  %conv49 = trunc i64 %tmp48 to i16
  %arrayidx50 = getelementptr inbounds [2 x i64]* %l_25, i32 0, i64 0
  %tmp51 = load i64* %arrayidx50, align 8
  %conv52 = trunc i64 %tmp51 to i32
  %call53 = call zeroext i16 @safe_lshift_func_uint16_t_u_u(i16 zeroext %conv49, i32 %conv52)
  %call54 = call signext i16 @safe_mul_func_int16_t_s_s(i16 signext %conv47, i16 signext %call53)
  %conv55 = sext i16 %call54 to i32
  %call56 = call i32 @safe_add_func_int32_t_s_s(i32 %conv40, i32 %conv55)
  %conv57 = trunc i32 %call56 to i8
  %call58 = call signext i8 @safe_mul_func_int8_t_s_s(i8 signext %conv37, i8 signext %conv57)
  %conv59 = sext i8 %call58 to i32
  %call60 = call zeroext i8 @safe_rshift_func_uint8_t_u_s(i8 zeroext %conv24, i32 %conv59)
  %conv61 = zext i8 %call60 to i32
  %tobool62 = icmp ne i32 %conv61, 0
  br label %land.end63

land.end63:                                       ; preds = %land.end, %for.end19
  %1 = phi i1 [ false, %for.end19 ], [ %tobool62, %land.end ]
  %land.ext64 = zext i1 %1 to i32
  %tmp65 = volatile load i32** @g_32, align 8
  store i32 %land.ext64, i32* %tmp65
  store i32 0, i32* %p_7.addr, align 4
  br label %for.cond66

for.cond66:                                       ; preds = %for.inc83, %land.end63
  %tmp67 = load i32* %p_7.addr, align 4
  %cmp68 = icmp ult i32 %tmp67, 2
  br i1 %cmp68, label %for.body70, label %for.end85

for.body70:                                       ; preds = %for.cond66
  store i32* null, i32** %l_34, align 8
  store i32* null, i32** %l_35, align 8
  %tmp73 = load i32* %p_7.addr, align 4
  %rem = urem i32 %tmp73, 2
  %idxprom74 = zext i32 %rem to i64
  %arrayidx75 = getelementptr inbounds [2 x i64]* %l_25, i32 0, i64 %idxprom74
  %tmp76 = load i64* %arrayidx75, align 8
  %tmp77 = volatile load i32** @g_36, align 8
  %tmp78 = load i32* %tmp77
  %conv79 = sext i32 %tmp78 to i64
  %or = or i64 %conv79, %tmp76
  %conv80 = trunc i64 %or to i32
  store i32 %conv80, i32* %tmp77
  %tmp81 = load i32** %l_35, align 8
  %tmp82 = volatile load i32*** @g_37, align 8
  store i32* %tmp81, i32** %tmp82
  br label %for.inc83

for.inc83:                                        ; preds = %for.body70
  %tmp84 = load i32* %p_7.addr, align 4
  %add = add i32 %tmp84, 1
  store i32 %add, i32* %p_7.addr, align 4
  br label %for.cond66

for.end85:                                        ; preds = %for.cond66
  br label %for.inc86

for.inc86:                                        ; preds = %for.end85
  %tmp87 = load i64* %p_8.addr, align 8
  %conv88 = trunc i64 %tmp87 to i32
  %call89 = call i32 @safe_add_func_int32_t_s_s(i32 %conv88, i32 0)
  %conv90 = sext i32 %call89 to i64
  store i64 %conv90, i64* %p_8.addr, align 8
  br label %for.cond4

for.end91:                                        ; preds = %for.cond4
  %tmp92 = load i16* %l_39, align 2
  %conv93 = sext i16 %tmp92 to i32
  store i32 %conv93, i32* %retval
  br label %return

return:                                           ; preds = %for.end91, %for.body
  %2 = load i32* %retval
  ret i32 %2
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

define internal i32 @safe_add_func_uint32_t_u_u(i32 %ui1, i32 %ui2) nounwind uwtable {
entry:
  %ui1.addr = alloca i32, align 4
  %ui2.addr = alloca i32, align 4
  store i32 %ui1, i32* %ui1.addr, align 4
  store i32 %ui2, i32* %ui2.addr, align 4
  %tmp = load i32* %ui1.addr, align 4
  %tmp1 = load i32* %ui2.addr, align 4
  %add = add i32 %tmp, %tmp1
  ret i32 %add
}

define internal zeroext i8 @safe_rshift_func_uint8_t_u_s(i8 zeroext %left, i32 %right) nounwind uwtable {
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
  br i1 %cmp2, label %cond.true, label %cond.false

cond.true:                                        ; preds = %lor.lhs.false, %entry
  %tmp3 = load i8* %left.addr, align 1
  %conv = zext i8 %tmp3 to i32
  br label %cond.end

cond.false:                                       ; preds = %lor.lhs.false
  %tmp4 = load i8* %left.addr, align 1
  %conv5 = zext i8 %tmp4 to i32
  %tmp6 = load i32* %right.addr, align 4
  %shr = ashr i32 %conv5, %tmp6
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %conv, %cond.true ], [ %shr, %cond.false ]
  %conv7 = trunc i32 %cond to i8
  ret i8 %conv7
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

define internal signext i16 @safe_rshift_func_int16_t_s_u(i16 signext %left, i32 %right) nounwind uwtable {
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
  br i1 %cmp3, label %cond.true, label %cond.false

cond.true:                                        ; preds = %lor.lhs.false, %entry
  %tmp5 = load i16* %left.addr, align 2
  %conv6 = sext i16 %tmp5 to i32
  br label %cond.end

cond.false:                                       ; preds = %lor.lhs.false
  %tmp7 = load i16* %left.addr, align 2
  %conv8 = sext i16 %tmp7 to i32
  %tmp9 = load i32* %right.addr, align 4
  %shr = ashr i32 %conv8, %tmp9
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %conv6, %cond.true ], [ %shr, %cond.false ]
  %conv10 = trunc i32 %cond to i16
  ret i16 %conv10
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

define internal zeroext i16 @safe_lshift_func_uint16_t_u_u(i16 zeroext %left, i32 %right) nounwind uwtable {
entry:
  %left.addr = alloca i16, align 2
  %right.addr = alloca i32, align 4
  store i16 %left, i16* %left.addr, align 2
  store i32 %right, i32* %right.addr, align 4
  %tmp = load i32* %right.addr, align 4
  %cmp = icmp uge i32 %tmp, 32
  br i1 %cmp, label %cond.true, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %tmp1 = load i16* %left.addr, align 2
  %conv = zext i16 %tmp1 to i32
  %tmp2 = load i32* %right.addr, align 4
  %shr = ashr i32 65535, %tmp2
  %cmp3 = icmp sgt i32 %conv, %shr
  br i1 %cmp3, label %cond.true, label %cond.false

cond.true:                                        ; preds = %lor.lhs.false, %entry
  %tmp5 = load i16* %left.addr, align 2
  %conv6 = zext i16 %tmp5 to i32
  br label %cond.end

cond.false:                                       ; preds = %lor.lhs.false
  %tmp7 = load i16* %left.addr, align 2
  %conv8 = zext i16 %tmp7 to i32
  %tmp9 = load i32* %right.addr, align 4
  %shl = shl i32 %conv8, %tmp9
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %conv6, %cond.true ], [ %shl, %cond.false ]
  %conv10 = trunc i32 %cond to i16
  ret i16 %conv10
}

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  %call = call i32 @func_1()
  %tmp = load i32* getelementptr inbounds ([3 x [4 x i32]]* @g_5, i32 0, i64 0, i64 0), align 4
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str, i32 0, i32 0), i32 %tmp)
  %tmp2 = load i32* getelementptr inbounds ([3 x [4 x i32]]* @g_5, i32 0, i64 0, i64 1), align 4
  %call3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str1, i32 0, i32 0), i32 %tmp2)
  %tmp4 = load i32* getelementptr inbounds ([3 x [4 x i32]]* @g_5, i32 0, i64 0, i64 2), align 4
  %call5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str2, i32 0, i32 0), i32 %tmp4)
  %tmp6 = load i32* getelementptr inbounds ([3 x [4 x i32]]* @g_5, i32 0, i64 0, i64 3), align 4
  %call7 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str3, i32 0, i32 0), i32 %tmp6)
  %tmp8 = load i32* getelementptr inbounds ([3 x [4 x i32]]* @g_5, i32 0, i64 1, i64 0), align 4
  %call9 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str4, i32 0, i32 0), i32 %tmp8)
  %tmp10 = load i32* getelementptr inbounds ([3 x [4 x i32]]* @g_5, i32 0, i64 1, i64 1), align 4
  %call11 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str5, i32 0, i32 0), i32 %tmp10)
  %tmp12 = load i32* getelementptr inbounds ([3 x [4 x i32]]* @g_5, i32 0, i64 1, i64 2), align 4
  %call13 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str6, i32 0, i32 0), i32 %tmp12)
  %tmp14 = load i32* getelementptr inbounds ([3 x [4 x i32]]* @g_5, i32 0, i64 1, i64 3), align 4
  %call15 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str7, i32 0, i32 0), i32 %tmp14)
  %tmp16 = load i32* getelementptr inbounds ([3 x [4 x i32]]* @g_5, i32 0, i64 2, i64 0), align 4
  %call17 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str8, i32 0, i32 0), i32 %tmp16)
  %tmp18 = load i32* getelementptr inbounds ([3 x [4 x i32]]* @g_5, i32 0, i64 2, i64 1), align 4
  %call19 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str9, i32 0, i32 0), i32 %tmp18)
  %tmp20 = load i32* getelementptr inbounds ([3 x [4 x i32]]* @g_5, i32 0, i64 2, i64 2), align 4
  %call21 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str10, i32 0, i32 0), i32 %tmp20)
  %tmp22 = load i32* getelementptr inbounds ([3 x [4 x i32]]* @g_5, i32 0, i64 2, i64 3), align 4
  %call23 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str11, i32 0, i32 0), i32 %tmp22)
  %tmp24 = load i32* getelementptr inbounds ([3 x [4 x i32]]* @g_5, i32 0, i64 2, i64 0), align 4
  %call25 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str8, i32 0, i32 0), i32 %tmp24)
  %tmp26 = load i32* @g_33, align 4
  %call27 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str12, i32 0, i32 0), i32 %tmp26)
  %0 = load i32* %retval
  ret i32 %0
}

declare i32 @printf(i8*, ...)
