; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith001108.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_7 = global [6 x i8] c"\D7\D7\D7\D7\D7\D7", align 1
@g_12 = global i32 1235938667, align 4
@g_11 = global i32* @g_12, align 8
@g_32 = global i32 -1333370477, align 4
@g_42 = global i32 1258680083, align 4
@g_46 = global i32** @g_11, align 8
@.str = private unnamed_addr constant [22 x i8] c"checksum g_7[0] = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [22 x i8] c"checksum g_7[1] = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [22 x i8] c"checksum g_7[2] = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [22 x i8] c"checksum g_7[3] = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [22 x i8] c"checksum g_7[4] = %d\0A\00", align 1
@.str5 = private unnamed_addr constant [22 x i8] c"checksum g_7[5] = %d\0A\00", align 1
@.str6 = private unnamed_addr constant [20 x i8] c"checksum g_12 = %d\0A\00", align 1
@.str7 = private unnamed_addr constant [20 x i8] c"checksum g_32 = %d\0A\00", align 1
@.str8 = private unnamed_addr constant [20 x i8] c"checksum g_42 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable {
entry:
  %l_2 = alloca i8, align 1
  %l_44 = alloca i32*, align 8
  %i = alloca i32, align 4
  %l_45 = alloca i32*, align 8
  store i8 -115, i8* %l_2, align 1
  store i32* @g_32, i32** %l_44, align 8
  %tmp = load i8* %l_2, align 1
  %conv = sext i8 %tmp to i32
  %tmp1 = load i8* %l_2, align 1
  %call = call signext i8 @safe_rshift_func_int8_t_s_u(i8 signext %tmp1, i32 0)
  %conv2 = sext i8 %call to i32
  %and = and i32 %conv, %conv2
  %tmp3 = load i8* %l_2, align 1
  %conv4 = sext i8 %tmp3 to i32
  %tmp5 = volatile load i8* getelementptr inbounds ([6 x i8]* @g_7, i32 0, i64 2), align 1
  %conv6 = sext i8 %tmp5 to i32
  %xor = xor i32 %conv4, %conv6
  %tmp7 = load i8* %l_2, align 1
  %conv8 = sext i8 %tmp7 to i32
  %tmp9 = load i8* %l_2, align 1
  %conv10 = sext i8 %tmp9 to i32
  %call11 = call i32 @func_8(i32 %conv8, i32 %conv10)
  %cmp = icmp sle i32 %xor, %call11
  %conv12 = zext i1 %cmp to i32
  %tmp13 = load i32* @g_42, align 4
  %or = or i32 %conv12, %tmp13
  %tmp14 = load i8* %l_2, align 1
  %conv15 = sext i8 %tmp14 to i32
  %cmp16 = icmp slt i32 %or, %conv15
  %conv17 = zext i1 %cmp16 to i32
  %tmp18 = load i8* %l_2, align 1
  %conv19 = sext i8 %tmp18 to i32
  %call20 = call i32 @safe_mod_func_int32_t_s_s(i32 %conv17, i32 %conv19)
  %cmp21 = icmp sgt i32 %and, %call20
  %conv22 = zext i1 %cmp21 to i32
  %tmp23 = load i32** %l_44, align 8
  store i32 %conv22, i32* %tmp23
  %tmp24 = load i32* @g_12, align 4
  %tobool = icmp ne i32 %tmp24, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  br label %lbl_47

if.end:                                           ; preds = %entry
  br label %lbl_47

lbl_47:                                           ; preds = %if.end, %if.then
  store i32 0, i32* @g_12, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %lbl_47
  %tmp25 = load i32* @g_12, align 4
  %cmp26 = icmp slt i32 %tmp25, 6
  br i1 %cmp26, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  store i32* @g_42, i32** %l_45, align 8
  %tmp29 = load i32** %l_45, align 8
  %tmp30 = volatile load i32*** @g_46, align 8
  store i32* %tmp29, i32** %tmp30
  %tmp31 = load i32* @g_12, align 4
  %rem = urem i32 %tmp31, 6
  %idxprom = zext i32 %rem to i64
  %arrayidx = getelementptr inbounds [6 x i8]* @g_7, i32 0, i64 %idxprom
  %tmp32 = volatile load i8* %arrayidx, align 1
  %conv33 = sext i8 %tmp32 to i64
  %cmp34 = icmp eq i64 %conv33, 4094424717
  %conv35 = zext i1 %cmp34 to i32
  %tmp36 = load i32** @g_11, align 8
  %tmp37 = load i32* %tmp36
  %cmp38 = icmp slt i32 %conv35, %tmp37
  %conv39 = zext i1 %cmp38 to i32
  %cmp40 = icmp ne i32** %l_44, null
  %conv41 = zext i1 %cmp40 to i32
  %cmp42 = icmp sge i32 %conv39, %conv41
  %conv43 = zext i1 %cmp42 to i32
  %tmp44 = load i32** %l_44, align 8
  %tmp45 = load i32* %tmp44
  %and46 = and i32 %tmp45, %conv43
  store i32 %and46, i32* %tmp44
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %tmp47 = load i32* @g_12, align 4
  %add = add nsw i32 %tmp47, 2
  store i32 %add, i32* @g_12, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %tmp48 = load i32* @g_42, align 4
  ret i32 %tmp48
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

define i32 @func_8(i32 %p_9, i32 %p_10) nounwind uwtable {
entry:
  %p_9.addr = alloca i32, align 4
  %p_10.addr = alloca i32, align 4
  %l_13 = alloca i32**, align 8
  %l_37 = alloca i16, align 2
  store i32 %p_9, i32* %p_9.addr, align 4
  store i32 %p_10, i32* %p_10.addr, align 4
  store i32** @g_11, i32*** %l_13, align 8
  store i16 20730, i16* %l_37, align 2
  %tmp = load i32** @g_11, align 8
  %tmp1 = load i32*** %l_13, align 8
  store i32* %tmp, i32** %tmp1
  %tmp2 = load i32** @g_11, align 8
  %tmp3 = load i32* %tmp2
  %tmp4 = load i32*** %l_13, align 8
  %tmp5 = load i32** %tmp4
  %tmp6 = load i32* %tmp5
  %tobool = icmp ne i32 %tmp6, 0
  br i1 %tobool, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %entry
  %tmp7 = load i32*** %l_13, align 8
  %tmp8 = load i32** %tmp7
  %tmp9 = load i32* %tmp8
  %tobool10 = icmp ne i32 %tmp9, 0
  br label %land.end

land.end:                                         ; preds = %land.rhs, %entry
  %0 = phi i1 [ false, %entry ], [ %tobool10, %land.rhs ]
  %land.ext = zext i1 %0 to i32
  %tmp11 = load i32** @g_11, align 8
  %tmp12 = load i32* %tmp11
  %tobool13 = icmp ne i32 %tmp12, 0
  br i1 %tobool13, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %land.end
  %tmp14 = load i32** @g_11, align 8
  %tmp15 = load i32* %tmp14
  %tobool16 = icmp ne i32 %tmp15, 0
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %land.end
  %1 = phi i1 [ true, %land.end ], [ %tobool16, %lor.rhs ]
  %lor.ext = zext i1 %1 to i32
  %cmp = icmp eq i32 %land.ext, %lor.ext
  %conv = zext i1 %cmp to i32
  %or = or i32 %tmp3, %conv
  %conv17 = sext i32 %or to i64
  %cmp18 = icmp eq i64 %conv17, 2748838289
  %conv19 = zext i1 %cmp18 to i32
  %conv20 = trunc i32 %conv19 to i8
  %call = call signext i8 @safe_rshift_func_int8_t_s_s(i8 signext %conv20, i32 0)
  %conv21 = sext i8 %call to i16
  %tmp22 = load i32* %p_10.addr, align 4
  %conv23 = sext i32 %tmp22 to i64
  %tmp24 = load i32*** %l_13, align 8
  %tmp25 = load i32** %tmp24
  %tmp26 = load i32* %tmp25
  %conv27 = sext i32 %tmp26 to i64
  %call28 = call i64 @safe_div_func_uint64_t_u_u(i64 %conv23, i64 %conv27)
  %conv29 = trunc i64 %call28 to i16
  %tmp30 = load i32*** %l_13, align 8
  %tmp31 = load i32** %tmp30
  %tmp32 = load i32*** %l_13, align 8
  %tmp33 = load i32** %tmp32
  %tmp34 = load i32* %tmp33
  %tmp35 = load i32* @g_32, align 4
  %conv36 = sext i32 %tmp35 to i64
  %tmp37 = load i16* %l_37, align 2
  %conv38 = zext i16 %tmp37 to i32
  %tmp39 = load i32*** %l_13, align 8
  %tmp40 = load i32** %tmp39
  %tmp41 = load i32* %tmp40
  %conv42 = trunc i32 %tmp41 to i16
  %tmp43 = load i32* %p_9.addr, align 4
  %tmp44 = load i32** @g_11, align 8
  %tmp45 = load i32* %tmp44
  %xor = xor i32 %tmp43, %tmp45
  %call46 = call i32 @func_38(i16 zeroext %conv42, i32 %xor)
  %tmp47 = load i32*** %l_13, align 8
  %tmp48 = load i32** %tmp47
  %tmp49 = load i32* %tmp48
  %conv50 = sext i32 %tmp49 to i64
  %cmp51 = icmp slt i64 3943411146, %conv50
  %conv52 = zext i1 %cmp51 to i32
  %cmp53 = icmp slt i32 %call46, %conv52
  %conv54 = zext i1 %cmp53 to i32
  %call55 = call i32 @func_22(i32* %tmp31, i32 %tmp34, i64 %conv36, i32 %conv38, i32 %conv54)
  %conv56 = trunc i32 %call55 to i16
  %call57 = call signext i16 @safe_mod_func_int16_t_s_s(i16 signext %conv29, i16 signext %conv56)
  %call58 = call zeroext i16 @safe_mul_func_uint16_t_u_u(i16 zeroext %conv21, i16 zeroext %call57)
  %conv59 = zext i16 %call58 to i32
  %tmp60 = load i32*** %l_13, align 8
  %tmp61 = load i32** %tmp60
  store i32 %conv59, i32* %tmp61
  %tmp62 = load i32** @g_11, align 8
  store i32 -1, i32* %tmp62
  %tmp63 = load i32** @g_11, align 8
  %tmp64 = load i32* %tmp63
  ret i32 %tmp64
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

define internal signext i8 @safe_rshift_func_int8_t_s_s(i8 signext %left, i32 %right) nounwind uwtable {
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
  br i1 %cmp7, label %cond.true, label %cond.false

cond.true:                                        ; preds = %lor.lhs.false5, %lor.lhs.false, %entry
  %tmp9 = load i8* %left.addr, align 1
  %conv10 = sext i8 %tmp9 to i32
  br label %cond.end

cond.false:                                       ; preds = %lor.lhs.false5
  %tmp11 = load i8* %left.addr, align 1
  %conv12 = sext i8 %tmp11 to i32
  %tmp13 = load i32* %right.addr, align 4
  %shr = ashr i32 %conv12, %tmp13
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %conv10, %cond.true ], [ %shr, %cond.false ]
  %conv14 = trunc i32 %cond to i8
  ret i8 %conv14
}

define internal signext i16 @safe_mod_func_int16_t_s_s(i16 signext %si1, i16 signext %si2) nounwind uwtable {
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
  %rem = srem i32 %conv13, %conv15
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %conv11, %cond.true ], [ %rem, %cond.false ]
  %conv16 = trunc i32 %cond to i16
  ret i16 %conv16
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

define i32 @func_22(i32* %p_23, i32 %p_24, i64 %p_25, i32 %p_26, i32 %p_27) nounwind uwtable {
entry:
  %p_23.addr = alloca i32*, align 8
  %p_24.addr = alloca i32, align 4
  %p_25.addr = alloca i64, align 8
  %p_26.addr = alloca i32, align 4
  %p_27.addr = alloca i32, align 4
  %l_33 = alloca i64, align 8
  %l_34 = alloca i32**, align 8
  %l_36 = alloca i32*, align 8
  %l_35 = alloca i32**, align 8
  %l_30 = alloca i32*, align 8
  %l_31 = alloca [6 x [9 x i32*]], align 16
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32* %p_23, i32** %p_23.addr, align 8
  store i32 %p_24, i32* %p_24.addr, align 4
  store i64 %p_25, i64* %p_25.addr, align 8
  store i32 %p_26, i32* %p_26.addr, align 4
  store i32 %p_27, i32* %p_27.addr, align 4
  store i64 1, i64* %l_33, align 8
  store i32** null, i32*** %l_34, align 8
  store i32* @g_32, i32** %l_36, align 8
  store i32** %l_36, i32*** %l_35, align 8
  store i32 0, i32* %p_27.addr, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc25, %entry
  %tmp = load i32* %p_27.addr, align 4
  %cmp = icmp ne i32 %tmp, 0
  br i1 %cmp, label %for.body, label %for.end27

for.body:                                         ; preds = %for.cond
  store i32* @g_12, i32** %l_30, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond5

for.cond5:                                        ; preds = %for.inc18, %for.body
  %tmp6 = load i32* %i, align 4
  %cmp7 = icmp slt i32 %tmp6, 6
  br i1 %cmp7, label %for.body8, label %for.end21

for.body8:                                        ; preds = %for.cond5
  store i32 0, i32* %j, align 4
  br label %for.cond9

for.cond9:                                        ; preds = %for.inc, %for.body8
  %tmp10 = load i32* %j, align 4
  %cmp11 = icmp slt i32 %tmp10, 9
  br i1 %cmp11, label %for.body12, label %for.end

for.body12:                                       ; preds = %for.cond9
  %tmp13 = load i32* %j, align 4
  %idxprom = sext i32 %tmp13 to i64
  %tmp14 = load i32* %i, align 4
  %idxprom15 = sext i32 %tmp14 to i64
  %arrayidx = getelementptr inbounds [6 x [9 x i32*]]* %l_31, i32 0, i64 %idxprom15
  %arrayidx16 = getelementptr inbounds [9 x i32*]* %arrayidx, i32 0, i64 %idxprom
  store i32* @g_32, i32** %arrayidx16, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body12
  %tmp17 = load i32* %j, align 4
  %inc = add nsw i32 %tmp17, 1
  store i32 %inc, i32* %j, align 4
  br label %for.cond9

for.end:                                          ; preds = %for.cond9
  br label %for.inc18

for.inc18:                                        ; preds = %for.end
  %tmp19 = load i32* %i, align 4
  %inc20 = add nsw i32 %tmp19, 1
  store i32 %inc20, i32* %i, align 4
  br label %for.cond5

for.end21:                                        ; preds = %for.cond5
  %tmp22 = load i32** %l_30, align 8
  %cmp23 = icmp ne i32* null, %tmp22
  %conv = zext i1 %cmp23 to i32
  %tmp24 = load i32* @g_32, align 4
  %or = or i32 %tmp24, %conv
  store i32 %or, i32* @g_32, align 4
  br label %for.inc25

for.inc25:                                        ; preds = %for.end21
  %tmp26 = load i32* %p_27.addr, align 4
  %call = call i32 @safe_sub_func_uint32_t_u_u(i32 %tmp26, i32 1)
  store i32 %call, i32* %p_27.addr, align 4
  br label %for.cond

for.end27:                                        ; preds = %for.cond
  %tmp28 = load i64* %l_33, align 8
  %tmp29 = load i32* %p_26.addr, align 4
  %conv30 = sext i32 %tmp29 to i64
  %or31 = or i64 %conv30, %tmp28
  %conv32 = trunc i64 %or31 to i32
  store i32 %conv32, i32* %p_26.addr, align 4
  %tmp33 = load i32*** %l_35, align 8
  store i32* %p_26.addr, i32** %tmp33
  %tmp34 = load i32*** %l_35, align 8
  %tmp35 = load i32** %tmp34
  %tmp36 = load i32* %tmp35
  ret i32 %tmp36
}

define i32 @func_38(i16 zeroext %p_39, i32 %p_40) nounwind uwtable {
entry:
  %p_39.addr = alloca i16, align 2
  %p_40.addr = alloca i32, align 4
  %l_41 = alloca i32*, align 8
  %l_43 = alloca i32, align 4
  store i16 %p_39, i16* %p_39.addr, align 2
  store i32 %p_40, i32* %p_40.addr, align 4
  store i32* @g_42, i32** %l_41, align 8
  store i32 1612483923, i32* %l_43, align 4
  store i32* null, i32** %l_41, align 8
  ret i32 1612483923
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
  %tmp = volatile load i8* getelementptr inbounds ([6 x i8]* @g_7, i32 0, i64 0), align 1
  %conv = sext i8 %tmp to i32
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str, i32 0, i32 0), i32 %conv)
  %tmp2 = volatile load i8* getelementptr inbounds ([6 x i8]* @g_7, i32 0, i64 1), align 1
  %conv3 = sext i8 %tmp2 to i32
  %call4 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str1, i32 0, i32 0), i32 %conv3)
  %tmp5 = volatile load i8* getelementptr inbounds ([6 x i8]* @g_7, i32 0, i64 2), align 1
  %conv6 = sext i8 %tmp5 to i32
  %call7 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str2, i32 0, i32 0), i32 %conv6)
  %tmp8 = volatile load i8* getelementptr inbounds ([6 x i8]* @g_7, i32 0, i64 3), align 1
  %conv9 = sext i8 %tmp8 to i32
  %call10 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str3, i32 0, i32 0), i32 %conv9)
  %tmp11 = volatile load i8* getelementptr inbounds ([6 x i8]* @g_7, i32 0, i64 4), align 1
  %conv12 = sext i8 %tmp11 to i32
  %call13 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str4, i32 0, i32 0), i32 %conv12)
  %tmp14 = volatile load i8* getelementptr inbounds ([6 x i8]* @g_7, i32 0, i64 5), align 1
  %conv15 = sext i8 %tmp14 to i32
  %call16 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str5, i32 0, i32 0), i32 %conv15)
  %tmp17 = volatile load i8* getelementptr inbounds ([6 x i8]* @g_7, i32 0, i64 2), align 1
  %conv18 = sext i8 %tmp17 to i32
  %call19 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str2, i32 0, i32 0), i32 %conv18)
  %tmp20 = load i32* @g_12, align 4
  %call21 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str6, i32 0, i32 0), i32 %tmp20)
  %tmp22 = load i32* @g_32, align 4
  %call23 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str7, i32 0, i32 0), i32 %tmp22)
  %tmp24 = load i32* @g_42, align 4
  %call25 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str8, i32 0, i32 0), i32 %tmp24)
  %0 = load i32* %retval
  ret i32 %0
}

declare i32 @printf(i8*, ...)
