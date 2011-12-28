; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith001379.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = global [8 x i32] zeroinitializer, align 16
@g_5 = global i32 1, align 4
@g_39 = global i32* @g_5, align 8
@g_38 = global i32** @g_39, align 8
@g_37 = global i32*** @g_38, align 8
@.str = private unnamed_addr constant [22 x i8] c"checksum g_2[0] = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [22 x i8] c"checksum g_2[1] = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [22 x i8] c"checksum g_2[2] = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [22 x i8] c"checksum g_2[3] = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [22 x i8] c"checksum g_2[4] = %d\0A\00", align 1
@.str5 = private unnamed_addr constant [22 x i8] c"checksum g_2[5] = %d\0A\00", align 1
@.str6 = private unnamed_addr constant [22 x i8] c"checksum g_2[6] = %d\0A\00", align 1
@.str7 = private unnamed_addr constant [22 x i8] c"checksum g_2[7] = %d\0A\00", align 1
@.str8 = private unnamed_addr constant [19 x i8] c"checksum g_5 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i64 @func_1() nounwind uwtable {
entry:
  %retval = alloca i64, align 8
  %l_22 = alloca i32*, align 8
  %l_23 = alloca i64, align 8
  %l_12 = alloca i16, align 2
  %l_28 = alloca i32, align 4
  %l_21 = alloca i32*, align 8
  %l_36 = alloca i32, align 4
  %l_11 = alloca i32*, align 8
  %l_10 = alloca i32**, align 8
  store i32* @g_5, i32** %l_22, align 8
  store i64 -1118748404390521565, i64* %l_23, align 8
  volatile store i32 -7, i32* getelementptr inbounds ([8 x i32]* @g_2, i32 0, i64 1), align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc77, %entry
  %tmp = volatile load i32* getelementptr inbounds ([8 x i32]* @g_2, i32 0, i64 1), align 4
  %cmp = icmp slt i32 %tmp, 4
  br i1 %cmp, label %for.body, label %for.end80

for.body:                                         ; preds = %for.cond
  store i16 1, i16* %l_12, align 2
  store i32 -139865368, i32* %l_28, align 4
  store i32 8, i32* @g_5, align 4
  br label %for.cond3

for.cond3:                                        ; preds = %for.inc68, %for.body
  %tmp4 = load i32* @g_5, align 4
  %cmp5 = icmp ne i32 %tmp4, 0
  br i1 %cmp5, label %for.body6, label %for.end71

for.body6:                                        ; preds = %for.cond3
  store i32* null, i32** %l_21, align 8
  store i32 1, i32* %l_36, align 4
  store i32 -30, i32* @g_5, align 4
  br label %for.cond9

for.cond9:                                        ; preds = %for.inc, %for.body6
  %tmp10 = load i32* @g_5, align 4
  %cmp11 = icmp sle i32 %tmp10, 0
  br i1 %cmp11, label %for.body12, label %for.end

for.body12:                                       ; preds = %for.cond9
  store i32* getelementptr inbounds ([8 x i32]* @g_2, i32 0, i64 1), i32** %l_11, align 8
  store i32** %l_11, i32*** %l_10, align 8
  %tmp15 = load i32*** %l_10, align 8
  store i32* getelementptr inbounds ([8 x i32]* @g_2, i32 0, i64 1), i32** %tmp15
  %tmp16 = load i16* %l_12, align 2
  %conv = sext i16 %tmp16 to i64
  store i64 %conv, i64* %retval
  br label %return

for.inc:                                          ; No predecessors!
  %tmp17 = load i32* @g_5, align 4
  %conv18 = trunc i32 %tmp17 to i16
  %call = call signext i16 @safe_add_func_int16_t_s_s(i16 signext %conv18, i16 signext 1)
  %conv19 = sext i16 %call to i32
  store i32 %conv19, i32* @g_5, align 4
  br label %for.cond9

for.end:                                          ; preds = %for.cond9
  %tmp20 = volatile load i32* getelementptr inbounds ([8 x i32]* @g_2, i32 0, i64 6), align 4
  %tmp21 = load i16* %l_12, align 2
  %conv22 = trunc i16 %tmp21 to i8
  %tmp23 = load i32* @g_5, align 4
  %call24 = call signext i8 @safe_rshift_func_int8_t_s_s(i8 signext %conv22, i32 %tmp23)
  %conv25 = sext i8 %call24 to i32
  %call26 = call i32 @safe_sub_func_int32_t_s_s(i32 %tmp20, i32 %conv25)
  %conv27 = sext i32 %call26 to i64
  %tmp28 = load i32** %l_21, align 8
  %tmp29 = load i32** %l_22, align 8
  %cmp30 = icmp eq i32* %tmp28, %tmp29
  %conv31 = zext i1 %cmp30 to i32
  %conv32 = sext i32 %conv31 to i64
  %tmp33 = load i64* %l_23, align 8
  %or = or i64 %conv32, %tmp33
  %or34 = or i64 %conv27, %or
  %conv35 = trunc i64 %or34 to i16
  %tmp36 = load i32* @g_5, align 4
  %conv37 = trunc i32 %tmp36 to i8
  %tmp38 = load i16* %l_12, align 2
  %conv39 = trunc i16 %tmp38 to i8
  %call40 = call zeroext i8 @safe_mul_func_uint8_t_u_u(i8 zeroext %conv37, i8 zeroext %conv39)
  %conv41 = zext i8 %call40 to i32
  %tobool = icmp ne i32 %conv41, 0
  br i1 %tobool, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %for.end
  %tmp42 = load i16* %l_12, align 2
  %conv43 = sext i16 %tmp42 to i32
  %tobool44 = icmp ne i32 %conv43, 0
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %for.end
  %0 = phi i1 [ true, %for.end ], [ %tobool44, %lor.rhs ]
  %lor.ext = zext i1 %0 to i32
  %conv45 = sext i32 %lor.ext to i64
  %call46 = call i64 @safe_mod_func_int64_t_s_s(i64 %conv45, i64 670076450)
  %conv47 = trunc i64 %call46 to i16
  %call48 = call signext i16 @safe_mod_func_int16_t_s_s(i16 signext %conv35, i16 signext %conv47)
  %tmp49 = load i32* @g_5, align 4
  %conv50 = trunc i32 %tmp49 to i16
  %call51 = call signext i16 @safe_mod_func_int16_t_s_s(i16 signext %call48, i16 signext %conv50)
  %conv52 = sext i16 %call51 to i64
  %xor = xor i64 3594160352, %conv52
  %conv53 = trunc i64 %xor to i32
  store i32 %conv53, i32* %l_28, align 4
  %tmp54 = load i32** %l_21, align 8
  %cmp55 = icmp eq i32* null, %tmp54
  %conv56 = zext i1 %cmp55 to i32
  %conv57 = sext i32 %conv56 to i64
  %tmp58 = load i32** %l_22, align 8
  %tmp59 = load i32* %tmp58
  %conv60 = trunc i32 %tmp59 to i8
  %tmp61 = load i32* %l_36, align 4
  %tmp62 = load i32* %l_28, align 4
  %cmp63 = icmp sle i32 %tmp61, %tmp62
  %conv64 = zext i1 %cmp63 to i32
  %tmp65 = volatile load i32* getelementptr inbounds ([8 x i32]* @g_2, i32 0, i64 1), align 4
  %call66 = call i32** @func_29(i64 %conv57, i8 zeroext %conv60, i32 %conv64, i32** %l_21, i32 %tmp65)
  %tmp67 = volatile load i32**** @g_37, align 8
  store i32** %call66, i32*** %tmp67
  br label %for.inc68

for.inc68:                                        ; preds = %lor.end
  %tmp69 = load i32* @g_5, align 4
  %call70 = call i32 @safe_sub_func_uint32_t_u_u(i32 %tmp69, i32 1)
  store i32 %call70, i32* @g_5, align 4
  br label %for.cond3

for.end71:                                        ; preds = %for.cond3
  %tmp72 = load i32** @g_39, align 8
  %tmp73 = load i32* %tmp72
  %tmp74 = load i32** @g_39, align 8
  store i32 %tmp73, i32* %tmp74
  %tmp75 = load i32* @g_5, align 4
  %conv76 = sext i32 %tmp75 to i64
  store i64 %conv76, i64* %retval
  br label %return

for.inc77:                                        ; No predecessors!
  %tmp78 = volatile load i32* getelementptr inbounds ([8 x i32]* @g_2, i32 0, i64 1), align 4
  %call79 = call i32 @safe_sub_func_int32_t_s_s(i32 %tmp78, i32 1)
  volatile store i32 %call79, i32* getelementptr inbounds ([8 x i32]* @g_2, i32 0, i64 1), align 4
  br label %for.cond

for.end80:                                        ; preds = %for.cond
  %tmp81 = volatile load i32* getelementptr inbounds ([8 x i32]* @g_2, i32 0, i64 1), align 4
  %conv82 = sext i32 %tmp81 to i64
  store i64 %conv82, i64* %retval
  br label %return

return:                                           ; preds = %for.end80, %for.end71, %for.body12
  %1 = load i64* %retval
  ret i64 %1
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

define i32** @func_29(i64 %p_30, i8 zeroext %p_31, i32 %p_32, i32** %p_33, i32 %p_34) nounwind uwtable {
entry:
  %p_30.addr = alloca i64, align 8
  %p_31.addr = alloca i8, align 1
  %p_32.addr = alloca i32, align 4
  %p_33.addr = alloca i32**, align 8
  %p_34.addr = alloca i32, align 4
  %l_35 = alloca i32, align 4
  store i64 %p_30, i64* %p_30.addr, align 8
  store i8 %p_31, i8* %p_31.addr, align 1
  store i32 %p_32, i32* %p_32.addr, align 4
  store i32** %p_33, i32*** %p_33.addr, align 8
  store i32 %p_34, i32* %p_34.addr, align 4
  store i32 0, i32* %l_35, align 4
  %tmp = load i32* %l_35, align 4
  store i32 %tmp, i32* %l_35, align 4
  %tmp1 = load i32*** %p_33.addr, align 8
  ret i32** %tmp1
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
  %call = call i64 @func_1()
  %tmp = volatile load i32* getelementptr inbounds ([8 x i32]* @g_2, i32 0, i64 0), align 4
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str, i32 0, i32 0), i32 %tmp)
  %tmp2 = volatile load i32* getelementptr inbounds ([8 x i32]* @g_2, i32 0, i64 1), align 4
  %call3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str1, i32 0, i32 0), i32 %tmp2)
  %tmp4 = volatile load i32* getelementptr inbounds ([8 x i32]* @g_2, i32 0, i64 2), align 4
  %call5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str2, i32 0, i32 0), i32 %tmp4)
  %tmp6 = volatile load i32* getelementptr inbounds ([8 x i32]* @g_2, i32 0, i64 3), align 4
  %call7 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str3, i32 0, i32 0), i32 %tmp6)
  %tmp8 = volatile load i32* getelementptr inbounds ([8 x i32]* @g_2, i32 0, i64 4), align 4
  %call9 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str4, i32 0, i32 0), i32 %tmp8)
  %tmp10 = volatile load i32* getelementptr inbounds ([8 x i32]* @g_2, i32 0, i64 5), align 4
  %call11 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str5, i32 0, i32 0), i32 %tmp10)
  %tmp12 = volatile load i32* getelementptr inbounds ([8 x i32]* @g_2, i32 0, i64 6), align 4
  %call13 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str6, i32 0, i32 0), i32 %tmp12)
  %tmp14 = volatile load i32* getelementptr inbounds ([8 x i32]* @g_2, i32 0, i64 7), align 4
  %call15 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str7, i32 0, i32 0), i32 %tmp14)
  %tmp16 = volatile load i32* getelementptr inbounds ([8 x i32]* @g_2, i32 0, i64 1), align 4
  %call17 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str1, i32 0, i32 0), i32 %tmp16)
  %tmp18 = load i32* @g_5, align 4
  %call19 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str8, i32 0, i32 0), i32 %tmp18)
  %0 = load i32* %retval
  ret i32 %0
}

declare i32 @printf(i8*, ...)
