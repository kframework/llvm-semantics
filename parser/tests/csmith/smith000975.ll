; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith000975.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_11 = global i8 3, align 1
@g_12 = global i32 0, align 4
@g_27 = global i32* null, align 8
@g_28 = global i32* null, align 8
@g_29 = global i32* null, align 8
@g_32 = global i32 -642882109, align 4
@g_31 = global i32* @g_32, align 8
@g_37 = global i32** @g_31, align 8
@.str = private unnamed_addr constant [20 x i8] c"checksum g_11 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [20 x i8] c"checksum g_12 = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [20 x i8] c"checksum g_32 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define signext i16 @func_1() nounwind uwtable {
entry:
  %l_4 = alloca i32, align 4
  %l_34 = alloca [3 x i32*], align 16
  %i = alloca i32, align 4
  %l_33 = alloca i32*, align 8
  %l_35 = alloca i32, align 4
  %l_38 = alloca i32**, align 8
  store i32 1833189762, i32* %l_4, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp, 3
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp1 = load i32* %i, align 4
  %idxprom = sext i32 %tmp1 to i64
  %arrayidx = getelementptr inbounds [3 x i32*]* %l_34, i32 0, i64 %idxprom
  store i32* null, i32** %arrayidx, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %tmp2 = load i32* %i, align 4
  %inc = add nsw i32 %tmp2, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %tmp3 = load i32* %l_4, align 4
  %conv = trunc i32 %tmp3 to i16
  %tmp4 = load i32* %l_4, align 4
  %conv5 = trunc i32 %tmp4 to i16
  %call = call zeroext i16 @safe_mul_func_uint16_t_u_u(i16 zeroext %conv, i16 zeroext %conv5)
  %conv6 = zext i16 %call to i32
  %tmp7 = load i32* %l_4, align 4
  %conv8 = zext i32 %tmp7 to i64
  %call9 = call i32 @func_9(i64 %conv8)
  %tobool = icmp ne i32 %call9, 0
  br i1 %tobool, label %lor.end19, label %lor.rhs

lor.rhs:                                          ; preds = %for.end
  %tmp10 = load i8* @g_11, align 1
  %conv11 = sext i8 %tmp10 to i32
  %tmp12 = load i32* %l_4, align 4
  %tobool13 = icmp ne i32 %tmp12, 0
  br i1 %tobool13, label %lor.end, label %lor.rhs14

lor.rhs14:                                        ; preds = %lor.rhs
  %tmp15 = load i32* %l_4, align 4
  %tobool16 = icmp ne i32 %tmp15, 0
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs14, %lor.rhs
  %0 = phi i1 [ true, %lor.rhs ], [ %tobool16, %lor.rhs14 ]
  %lor.ext = zext i1 %0 to i32
  %cmp17 = icmp sle i32 %conv11, %lor.ext
  br label %lor.end19

lor.end19:                                        ; preds = %lor.end, %for.end
  %1 = phi i1 [ true, %for.end ], [ %cmp17, %lor.end ]
  %lor.ext20 = zext i1 %1 to i32
  %call21 = call zeroext i16 @safe_lshift_func_uint16_t_u_s(i16 zeroext -27491, i32 %lor.ext20)
  %conv22 = trunc i16 %call21 to i8
  %tmp23 = load i8* @g_11, align 1
  %call24 = call signext i8 @safe_add_func_int8_t_s_s(i8 signext %conv22, i8 signext %tmp23)
  %conv25 = sext i8 %call24 to i32
  %cmp26 = icmp sge i32 %conv6, %conv25
  %conv27 = zext i1 %cmp26 to i32
  %tmp28 = load i32* @g_12, align 4
  %and = and i32 %tmp28, %conv27
  store i32 %and, i32* @g_12, align 4
  store i32 0, i32* @g_12, align 4
  br label %for.cond29

for.cond29:                                       ; preds = %for.inc47, %lor.end19
  %tmp30 = load i32* @g_12, align 4
  %cmp31 = icmp uge i32 %tmp30, 21
  br i1 %cmp31, label %for.body33, label %for.end50

for.body33:                                       ; preds = %for.cond29
  store i32* null, i32** %l_33, align 8
  store i32 1, i32* %l_35, align 4
  store i32** @g_31, i32*** %l_38, align 8
  %tmp37 = load i32** %l_33, align 8
  %arrayidx38 = getelementptr inbounds [3 x i32*]* %l_34, i32 0, i64 2
  store i32* %tmp37, i32** %arrayidx38, align 8
  %tmp39 = load i32* %l_4, align 4
  %tobool40 = icmp ne i32 %tmp39, 0
  br i1 %tobool40, label %if.then, label %if.end

if.then:                                          ; preds = %for.body33
  br label %lbl_36

if.end:                                           ; preds = %for.body33
  br label %lbl_36

lbl_36:                                           ; preds = %if.end, %if.then
  %tmp41 = load i32* %l_35, align 4
  %tobool42 = icmp ne i32 %tmp41, 0
  br i1 %tobool42, label %if.then43, label %if.end44

if.then43:                                        ; preds = %lbl_36
  br label %for.end50

if.end44:                                         ; preds = %lbl_36
  %tmp45 = volatile load i32*** @g_37, align 8
  store i32* %l_35, i32** %tmp45
  %tmp46 = load i32*** %l_38, align 8
  store i32* null, i32** %tmp46
  br label %for.inc47

for.inc47:                                        ; preds = %if.end44
  %tmp48 = load i32* @g_12, align 4
  %call49 = call i32 @safe_sub_func_int32_t_s_s(i32 %tmp48, i32 3)
  store i32 %call49, i32* @g_12, align 4
  br label %for.cond29

for.end50:                                        ; preds = %if.then43, %for.cond29
  %tmp51 = load i8* @g_11, align 1
  %conv52 = sext i8 %tmp51 to i16
  ret i16 %conv52
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

define internal zeroext i16 @safe_lshift_func_uint16_t_u_s(i16 zeroext %left, i32 %right) nounwind uwtable {
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
  br i1 %cmp2, label %cond.true, label %lor.lhs.false3

lor.lhs.false3:                                   ; preds = %lor.lhs.false
  %tmp4 = load i16* %left.addr, align 2
  %conv = zext i16 %tmp4 to i32
  %tmp5 = load i32* %right.addr, align 4
  %shr = ashr i32 65535, %tmp5
  %cmp6 = icmp sgt i32 %conv, %shr
  br i1 %cmp6, label %cond.true, label %cond.false

cond.true:                                        ; preds = %lor.lhs.false3, %lor.lhs.false, %entry
  %tmp8 = load i16* %left.addr, align 2
  %conv9 = zext i16 %tmp8 to i32
  br label %cond.end

cond.false:                                       ; preds = %lor.lhs.false3
  %tmp10 = load i16* %left.addr, align 2
  %conv11 = zext i16 %tmp10 to i32
  %tmp12 = load i32* %right.addr, align 4
  %shl = shl i32 %conv11, %tmp12
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %conv9, %cond.true ], [ %shl, %cond.false ]
  %conv13 = trunc i32 %cond to i16
  ret i16 %conv13
}

define i32 @func_9(i64 %p_10) nounwind uwtable {
entry:
  %p_10.addr = alloca i64, align 8
  store i64 %p_10, i64* %p_10.addr, align 8
  %tmp = load i64* %p_10.addr, align 8
  %conv = trunc i64 %tmp to i32
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

define i32* @func_15(i32* %p_16, i32* %p_17, i64 %p_18, i32 %p_19) nounwind uwtable {
entry:
  %p_16.addr = alloca i32*, align 8
  %p_17.addr = alloca i32*, align 8
  %p_18.addr = alloca i64, align 8
  %p_19.addr = alloca i32, align 4
  store i32* %p_16, i32** %p_16.addr, align 8
  store i32* %p_17, i32** %p_17.addr, align 8
  store i64 %p_18, i64* %p_18.addr, align 8
  store i32 %p_19, i32* %p_19.addr, align 4
  %tmp = load i32* @g_12, align 4
  %tmp1 = load i32** %p_16.addr, align 8
  %tmp2 = load i32* %tmp1
  %xor = xor i32 %tmp2, %tmp
  store i32 %xor, i32* %tmp1
  %tmp3 = load i32** %p_16.addr, align 8
  ret i32* %tmp3
}

define i32* @func_20(i64 %p_21) nounwind uwtable {
entry:
  %p_21.addr = alloca i64, align 8
  %l_24 = alloca [7 x i32], align 16
  %l_30 = alloca i32, align 4
  %i = alloca i32, align 4
  store i64 %p_21, i64* %p_21.addr, align 8
  store i32 831211331, i32* %l_30, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp, 7
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp1 = load i32* %i, align 4
  %idxprom = sext i32 %tmp1 to i64
  %arrayidx = getelementptr inbounds [7 x i32]* %l_24, i32 0, i64 %idxprom
  store i32 -4, i32* %arrayidx, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %tmp2 = load i32* %i, align 4
  %inc = add nsw i32 %tmp2, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %arrayidx3 = getelementptr inbounds [7 x i32]* %l_24, i32 0, i64 0
  %tmp4 = load i32* %arrayidx3, align 4
  %conv = zext i32 %tmp4 to i64
  %tmp5 = load i64* %p_21.addr, align 8
  %cmp6 = icmp ugt i64 %conv, %tmp5
  %conv7 = zext i1 %cmp6 to i32
  %conv8 = trunc i32 %conv7 to i16
  %tmp9 = load i32* @g_12, align 4
  %tmp10 = load i8* @g_11, align 1
  %conv11 = sext i8 %tmp10 to i32
  %xor = xor i32 %tmp9, %conv11
  %conv12 = trunc i32 %xor to i16
  %call = call signext i16 @safe_mod_func_int16_t_s_s(i16 signext %conv8, i16 signext %conv12)
  %conv13 = sext i16 %call to i32
  %tobool = icmp ne i32 %conv13, 0
  br i1 %tobool, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %for.end
  %arrayidx14 = getelementptr inbounds [7 x i32]* %l_24, i32 0, i64 0
  %tmp15 = load i32* %arrayidx14, align 4
  %tobool16 = icmp ne i32 %tmp15, 0
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %for.end
  %0 = phi i1 [ true, %for.end ], [ %tobool16, %lor.rhs ]
  %lor.ext = zext i1 %0 to i32
  %conv17 = sext i32 %lor.ext to i64
  %cmp18 = icmp ne i64 %conv17, 0
  %conv19 = zext i1 %cmp18 to i32
  %call20 = call i32 @func_9(i64 1)
  %conv21 = sext i32 %call20 to i64
  %call22 = call i32 @func_9(i64 %conv21)
  %tmp23 = load i8* @g_11, align 1
  %conv24 = sext i8 %tmp23 to i64
  %call25 = call i32 @func_9(i64 %conv24)
  %conv26 = trunc i32 %call25 to i16
  %tmp27 = load i32* @g_12, align 4
  %tmp28 = load i32* @g_12, align 4
  %conv29 = zext i32 %tmp28 to i64
  %call30 = call i32 @func_9(i64 %conv29)
  %xor31 = xor i32 %tmp27, %call30
  %conv32 = trunc i32 %xor31 to i16
  %call33 = call zeroext i16 @safe_div_func_uint16_t_u_u(i16 zeroext %conv26, i16 zeroext %conv32)
  %conv34 = zext i16 %call33 to i32
  %xor35 = xor i32 %call22, %conv34
  %or = or i32 %conv19, %xor35
  %conv36 = sext i32 %or to i64
  %tmp37 = load i64* %p_21.addr, align 8
  %cmp38 = icmp ult i64 %conv36, %tmp37
  %conv39 = zext i1 %cmp38 to i32
  store i32 %conv39, i32* %l_30, align 4
  ret i32* %l_30
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

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  %call = call signext i16 @func_1()
  %tmp = load i8* @g_11, align 1
  %conv = sext i8 %tmp to i32
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str, i32 0, i32 0), i32 %conv)
  %tmp2 = load i32* @g_12, align 4
  %call3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str1, i32 0, i32 0), i32 %tmp2)
  %tmp4 = load i32* @g_32, align 4
  %call5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str2, i32 0, i32 0), i32 %tmp4)
  %0 = load i32* %retval
  ret i32 %0
}

declare i32 @printf(i8*, ...)
