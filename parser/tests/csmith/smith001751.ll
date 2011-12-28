; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith001751.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = global i32 7, align 4
@g_13 = global [5 x [2 x i32]] [[2 x i32] [i32 1, i32 1], [2 x i32] [i32 1, i32 1], [2 x i32] [i32 1, i32 1], [2 x i32] [i32 1, i32 1], [2 x i32] [i32 1, i32 1]], align 16
@g_40 = global [2 x [3 x i32*]] [[3 x i32*] [i32* bitcast (i8* getelementptr (i8* bitcast ([5 x [2 x i32]]* @g_13 to i8*), i64 24) to i32*), i32* bitcast (i8* getelementptr (i8* bitcast ([5 x [2 x i32]]* @g_13 to i8*), i64 24) to i32*), i32* bitcast (i8* getelementptr (i8* bitcast ([5 x [2 x i32]]* @g_13 to i8*), i64 24) to i32*)], [3 x i32*] [i32* bitcast (i8* getelementptr (i8* bitcast ([5 x [2 x i32]]* @g_13 to i8*), i64 24) to i32*), i32* bitcast (i8* getelementptr (i8* bitcast ([5 x [2 x i32]]* @g_13 to i8*), i64 24) to i32*), i32* bitcast (i8* getelementptr (i8* bitcast ([5 x [2 x i32]]* @g_13 to i8*), i64 24) to i32*)]], align 16
@g_41 = global i32* bitcast (i8* getelementptr (i8* bitcast ([5 x [2 x i32]]* @g_13 to i8*), i64 32) to i32*), align 8
@func_1.l_5 = internal constant [7 x [3 x i32]] [[3 x i32] [i32 -2050559553, i32 -2050559553, i32 -2050559553], [3 x i32] [i32 -2050559553, i32 -2050559553, i32 -2050559553], [3 x i32] [i32 -2050559553, i32 -2050559553, i32 -2050559553], [3 x i32] [i32 -2050559553, i32 -2050559553, i32 -2050559553], [3 x i32] [i32 -2050559553, i32 -2050559553, i32 -2050559553], [3 x i32] [i32 -2050559553, i32 -2050559553, i32 -2050559553], [3 x i32] [i32 -2050559553, i32 -2050559553, i32 -2050559553]], align 16
@.str = private unnamed_addr constant [19 x i8] c"checksum g_2 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [26 x i8] c"checksum g_13[0][0] = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [26 x i8] c"checksum g_13[0][1] = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [26 x i8] c"checksum g_13[1][0] = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [26 x i8] c"checksum g_13[1][1] = %d\0A\00", align 1
@.str5 = private unnamed_addr constant [26 x i8] c"checksum g_13[2][0] = %d\0A\00", align 1
@.str6 = private unnamed_addr constant [26 x i8] c"checksum g_13[2][1] = %d\0A\00", align 1
@.str7 = private unnamed_addr constant [26 x i8] c"checksum g_13[3][0] = %d\0A\00", align 1
@.str8 = private unnamed_addr constant [26 x i8] c"checksum g_13[3][1] = %d\0A\00", align 1
@.str9 = private unnamed_addr constant [26 x i8] c"checksum g_13[4][0] = %d\0A\00", align 1
@.str10 = private unnamed_addr constant [26 x i8] c"checksum g_13[4][1] = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i64 @func_1() nounwind uwtable {
entry:
  %retval = alloca i64, align 8
  %l_38 = alloca i8, align 1
  %l_39 = alloca i64, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i8 -1, i8* %l_38, align 1
  store i64 4, i64* %l_39, align 8
  volatile store i32 7, i32* @g_2, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp = volatile load i32* @g_2, align 4
  %cmp = icmp sgt i32 %tmp, 0
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp3 = load i32* getelementptr inbounds ([7 x [3 x i32]]* @func_1.l_5, i32 0, i64 1, i64 2), align 4
  %conv = sext i32 %tmp3 to i64
  store i64 %conv, i64* %retval
  br label %return

for.inc:                                          ; No predecessors!
  %tmp4 = volatile load i32* @g_2, align 4
  %conv5 = trunc i32 %tmp4 to i8
  %call = call signext i8 @safe_add_func_int8_t_s_s(i8 signext %conv5, i8 signext 1)
  %conv6 = sext i8 %call to i32
  volatile store i32 %conv6, i32* @g_2, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %tmp7 = volatile load i32* @g_2, align 4
  %tmp8 = load i8* %l_38, align 1
  %conv9 = sext i8 %tmp8 to i64
  %tmp10 = load i8* %l_38, align 1
  %conv11 = sext i8 %tmp10 to i32
  %tmp12 = load i8* %l_38, align 1
  %call13 = call i32 @func_6(i32 1, i64 %conv9, i32 %conv11, i8 signext %tmp12)
  %or = or i32 %tmp7, %call13
  %tobool = icmp ne i32 %or, 0
  br i1 %tobool, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %for.end
  %tmp14 = load i64* %l_39, align 8
  %tobool15 = icmp ne i64 %tmp14, 0
  br label %land.end

land.end:                                         ; preds = %land.rhs, %for.end
  %0 = phi i1 [ false, %for.end ], [ %tobool15, %land.rhs ]
  %land.ext = zext i1 %0 to i32
  %tmp16 = volatile load i32** @g_41, align 8
  store i32 %land.ext, i32* %tmp16
  %tmp17 = load i8* %l_38, align 1
  %conv18 = sext i8 %tmp17 to i64
  store i64 %conv18, i64* %retval
  br label %return

return:                                           ; preds = %land.end, %for.body
  %1 = load i64* %retval
  ret i64 %1
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

define i32 @func_6(i32 %p_7, i64 %p_8, i32 %p_9, i8 signext %p_10) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %p_7.addr = alloca i32, align 4
  %p_8.addr = alloca i64, align 8
  %p_9.addr = alloca i32, align 4
  %p_10.addr = alloca i8, align 1
  %l_11 = alloca i16, align 2
  %l_12 = alloca i32*, align 8
  %l_28 = alloca i32**, align 8
  %l_27 = alloca [8 x i32***], align 16
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %l_33 = alloca i64, align 8
  %l_36 = alloca i32***, align 8
  store i32 %p_7, i32* %p_7.addr, align 4
  store i64 %p_8, i64* %p_8.addr, align 8
  store i32 %p_9, i32* %p_9.addr, align 4
  store i8 %p_10, i8* %p_10.addr, align 1
  store i16 8907, i16* %l_11, align 2
  store i32* getelementptr inbounds ([5 x [2 x i32]]* @g_13, i32 0, i64 3, i64 0), i32** %l_12, align 8
  store i32** %l_12, i32*** %l_28, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp, 8
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp1 = load i32* %i, align 4
  %idxprom = sext i32 %tmp1 to i64
  %arrayidx = getelementptr inbounds [8 x i32***]* %l_27, i32 0, i64 %idxprom
  store i32*** %l_28, i32**** %arrayidx, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %tmp2 = load i32* %i, align 4
  %inc = add nsw i32 %tmp2, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %tmp3 = load i16* %l_11, align 2
  %conv = sext i16 %tmp3 to i64
  %cmp4 = icmp sle i64 3419336788, %conv
  %conv5 = zext i1 %cmp4 to i32
  %tmp6 = load i32** %l_12, align 8
  store i32 %conv5, i32* %tmp6
  store i64 0, i64* %p_8.addr, align 8
  br label %for.cond7

for.cond7:                                        ; preds = %for.inc108, %for.end
  %tmp8 = load i64* %p_8.addr, align 8
  %cmp9 = icmp slt i64 %tmp8, 5
  br i1 %cmp9, label %for.body11, label %for.end111

for.body11:                                       ; preds = %for.cond7
  store i8 1, i8* %p_10.addr, align 1
  br label %for.cond12

for.cond12:                                       ; preds = %for.inc103, %for.body11
  %tmp13 = load i8* %p_10.addr, align 1
  %conv14 = sext i8 %tmp13 to i32
  %cmp15 = icmp slt i32 %conv14, 2
  br i1 %cmp15, label %for.body17, label %for.end107

for.body17:                                       ; preds = %for.cond12
  store i64 1, i64* %l_33, align 8
  store i32*** null, i32**** %l_36, align 8
  %tmp20 = load i32** %l_12, align 8
  store i32 -1, i32* %tmp20
  %tmp21 = load i8* %p_10.addr, align 1
  %conv22 = zext i8 %tmp21 to i32
  %rem = srem i32 %conv22, 2
  %idxprom23 = sext i32 %rem to i64
  %tmp24 = load i64* %p_8.addr, align 8
  %rem25 = urem i64 %tmp24, 5
  %arrayidx26 = getelementptr inbounds [5 x [2 x i32]]* @g_13, i32 0, i64 %rem25
  %arrayidx27 = getelementptr inbounds [2 x i32]* %arrayidx26, i32 0, i64 %idxprom23
  %tmp28 = load i32* %arrayidx27, align 4
  %conv29 = trunc i32 %tmp28 to i8
  %arrayidx30 = getelementptr inbounds [8 x i32***]* %l_27, i32 0, i64 1
  %tmp31 = load i32**** %arrayidx30, align 8
  %cmp32 = icmp eq i32*** %tmp31, %l_28
  %land.ext = zext i1 %cmp32 to i32
  %conv34 = trunc i32 %land.ext to i8
  %call = call signext i8 @safe_add_func_int8_t_s_s(i8 signext %conv29, i8 signext %conv34)
  %conv35 = sext i8 %call to i32
  %tobool = icmp ne i32 %conv35, 0
  br i1 %tobool, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %for.body17
  %tmp36 = load i32* getelementptr inbounds ([5 x [2 x i32]]* @g_13, i32 0, i64 3, i64 0), align 4
  %tmp37 = load i32*** %l_28, align 8
  %tmp38 = load i32** %tmp37
  %tmp39 = load i32* %tmp38
  %conv40 = trunc i32 %tmp39 to i8
  %tmp41 = load i8* %p_10.addr, align 1
  %conv42 = zext i8 %tmp41 to i32
  %rem43 = srem i32 %conv42, 2
  %idxprom44 = sext i32 %rem43 to i64
  %tmp45 = load i64* %p_8.addr, align 8
  %rem46 = urem i64 %tmp45, 5
  %arrayidx47 = getelementptr inbounds [5 x [2 x i32]]* @g_13, i32 0, i64 %rem46
  %arrayidx48 = getelementptr inbounds [2 x i32]* %arrayidx47, i32 0, i64 %idxprom44
  %tmp49 = load i32* %arrayidx48, align 4
  %conv50 = trunc i32 %tmp49 to i8
  %call51 = call signext i8 @safe_add_func_int8_t_s_s(i8 signext %conv40, i8 signext %conv50)
  %conv52 = sext i8 %call51 to i32
  %or = or i32 %tmp36, %conv52
  %conv53 = trunc i32 %or to i8
  %tmp54 = load i32* getelementptr inbounds ([5 x [2 x i32]]* @g_13, i32 0, i64 1, i64 1), align 4
  %conv55 = sext i32 %tmp54 to i64
  %tmp56 = load i64* %l_33, align 8
  %cmp57 = icmp ult i64 %conv55, %tmp56
  br i1 %cmp57, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %land.rhs
  %tmp59 = load i8* %p_10.addr, align 1
  %conv60 = zext i8 %tmp59 to i32
  %rem61 = srem i32 %conv60, 2
  %idxprom62 = sext i32 %rem61 to i64
  %tmp63 = load i64* %p_8.addr, align 8
  %rem64 = urem i64 %tmp63, 5
  %arrayidx65 = getelementptr inbounds [5 x [2 x i32]]* @g_13, i32 0, i64 %rem64
  %arrayidx66 = getelementptr inbounds [2 x i32]* %arrayidx65, i32 0, i64 %idxprom62
  %tmp67 = load i32* %arrayidx66, align 4
  %tobool68 = icmp ne i32 %tmp67, 0
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %land.rhs
  %0 = phi i1 [ true, %land.rhs ], [ %tobool68, %lor.rhs ]
  %lor.ext = zext i1 %0 to i32
  %conv69 = trunc i32 %lor.ext to i8
  %call70 = call zeroext i8 @safe_div_func_uint8_t_u_u(i8 zeroext %conv53, i8 zeroext %conv69)
  %conv71 = zext i8 %call70 to i32
  %tobool72 = icmp ne i32 %conv71, 0
  br label %land.end

land.end:                                         ; preds = %lor.end, %for.body17
  %1 = phi i1 [ false, %for.body17 ], [ %tobool72, %lor.end ]
  %land.ext73 = zext i1 %1 to i32
  %tmp74 = load i64* %l_33, align 8
  %conv75 = trunc i64 %tmp74 to i16
  %call76 = call zeroext i16 @safe_lshift_func_uint16_t_u_u(i16 zeroext %conv75, i32 7)
  %conv77 = zext i16 %call76 to i32
  %tmp78 = load i32*** %l_28, align 8
  %tmp79 = load i32** %tmp78
  %tmp80 = load i32* %tmp79
  %cmp81 = icmp eq i32 %conv77, %tmp80
  %conv82 = zext i1 %cmp81 to i32
  %tmp83 = load i32* getelementptr inbounds ([5 x [2 x i32]]* @g_13, i32 0, i64 0, i64 0), align 4
  %xor = xor i32 %conv82, %tmp83
  %conv84 = trunc i32 %xor to i8
  %tmp85 = load i32* getelementptr inbounds ([5 x [2 x i32]]* @g_13, i32 0, i64 3, i64 0), align 4
  %conv86 = sext i32 %tmp85 to i64
  %call87 = call i32 @func_14(i32 %land.ext73, i8 signext %conv84, i64 %conv86)
  %tmp88 = load i32* getelementptr inbounds ([5 x [2 x i32]]* @g_13, i32 0, i64 3, i64 0), align 4
  %conv89 = trunc i32 %tmp88 to i8
  %call90 = call i32 @func_14(i32 %call87, i8 signext %conv89, i64 0)
  %tmp91 = load i32*** %l_28, align 8
  %tmp92 = load i32** %tmp91
  store i32 %call90, i32* %tmp92
  %tmp93 = load i8* %p_10.addr, align 1
  %tobool94 = icmp ne i8 %tmp93, 0
  br i1 %tobool94, label %if.then, label %if.end

if.then:                                          ; preds = %land.end
  br label %lbl_37

if.end:                                           ; preds = %land.end
  br label %lbl_37

lbl_37:                                           ; preds = %if.end, %if.then
  %tmp95 = load i32**** %l_36, align 8
  %tmp96 = load i32**** %l_36, align 8
  %cmp97 = icmp eq i32*** %tmp95, %tmp96
  %conv98 = zext i1 %cmp97 to i32
  %tmp99 = load i32** %l_12, align 8
  %tmp100 = load i32* %tmp99
  %or101 = or i32 %tmp100, %conv98
  store i32 %or101, i32* %tmp99
  %tmp102 = load i32* getelementptr inbounds ([5 x [2 x i32]]* @g_13, i32 0, i64 2, i64 0), align 4
  store i32 %tmp102, i32* %retval
  br label %return

for.inc103:                                       ; No predecessors!
  %tmp104 = load i8* %p_10.addr, align 1
  %conv105 = sext i8 %tmp104 to i32
  %add = add nsw i32 %conv105, 2
  %conv106 = trunc i32 %add to i8
  store i8 %conv106, i8* %p_10.addr, align 1
  br label %for.cond12

for.end107:                                       ; preds = %for.cond12
  br label %for.inc108

for.inc108:                                       ; preds = %for.end107
  %tmp109 = load i64* %p_8.addr, align 8
  %add110 = add nsw i64 %tmp109, 4
  store i64 %add110, i64* %p_8.addr, align 8
  br label %for.cond7

for.end111:                                       ; preds = %for.cond7
  %tmp112 = load i32* getelementptr inbounds ([5 x [2 x i32]]* @g_13, i32 0, i64 2, i64 0), align 4
  store i32 %tmp112, i32* %retval
  br label %return

return:                                           ; preds = %for.end111, %lbl_37
  %2 = load i32* %retval
  ret i32 %2
}

define i32 @func_14(i32 %p_15, i8 signext %p_16, i64 %p_17) nounwind uwtable {
entry:
  %p_15.addr = alloca i32, align 4
  %p_16.addr = alloca i8, align 1
  %p_17.addr = alloca i64, align 8
  %l_22 = alloca [7 x i32*], align 16
  %l_24 = alloca i32**, align 8
  %l_23 = alloca i32***, align 8
  %i = alloca i32, align 4
  store i32 %p_15, i32* %p_15.addr, align 4
  store i8 %p_16, i8* %p_16.addr, align 1
  store i64 %p_17, i64* %p_17.addr, align 8
  store i32** null, i32*** %l_24, align 8
  store i32*** %l_24, i32**** %l_23, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp, 7
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp1 = load i32* %i, align 4
  %idxprom = sext i32 %tmp1 to i64
  %arrayidx = getelementptr inbounds [7 x i32*]* %l_22, i32 0, i64 %idxprom
  store i32* getelementptr inbounds ([5 x [2 x i32]]* @g_13, i32 0, i64 3, i64 0), i32** %arrayidx, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %tmp2 = load i32* %i, align 4
  %inc = add nsw i32 %tmp2, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %arrayidx3 = getelementptr inbounds [7 x i32*]* %l_22, i32 0, i64 4
  %tmp4 = load i32** %arrayidx3, align 8
  %cmp5 = icmp ne i32* %tmp4, null
  br i1 %cmp5, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %for.end
  %tmp6 = load i32* getelementptr inbounds ([5 x [2 x i32]]* @g_13, i32 0, i64 3, i64 1), align 4
  %tobool = icmp ne i32 %tmp6, 0
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %for.end
  %0 = phi i1 [ true, %for.end ], [ %tobool, %lor.rhs ]
  %lor.ext = zext i1 %0 to i32
  %conv = sext i32 %lor.ext to i64
  %call = call i32** @func_18(i64 %conv)
  %tmp7 = load i32**** %l_23, align 8
  store i32** %call, i32*** %tmp7
  %tmp8 = load i32* %p_15.addr, align 4
  ret i32 %tmp8
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

define i32** @func_18(i64 %p_19) nounwind uwtable {
entry:
  %p_19.addr = alloca i64, align 8
  %l_21 = alloca [4 x [4 x [2 x [1 x i32*]]]], align 16
  %l_20 = alloca i32**, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %l = alloca i32, align 4
  store i64 %p_19, i64* %p_19.addr, align 8
  %arrayidx = getelementptr inbounds [4 x [4 x [2 x [1 x i32*]]]]* %l_21, i32 0, i64 0
  %arrayidx1 = getelementptr inbounds [4 x [2 x [1 x i32*]]]* %arrayidx, i32 0, i64 2
  %arrayidx2 = getelementptr inbounds [2 x [1 x i32*]]* %arrayidx1, i32 0, i64 1
  %arrayidx3 = getelementptr inbounds [1 x i32*]* %arrayidx2, i32 0, i64 0
  store i32** %arrayidx3, i32*** %l_20, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc36, %entry
  %tmp = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp, 4
  br i1 %cmp, label %for.body, label %for.end39

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4
  br label %for.cond4

for.cond4:                                        ; preds = %for.inc32, %for.body
  %tmp5 = load i32* %j, align 4
  %cmp6 = icmp slt i32 %tmp5, 4
  br i1 %cmp6, label %for.body7, label %for.end35

for.body7:                                        ; preds = %for.cond4
  store i32 0, i32* %k, align 4
  br label %for.cond8

for.cond8:                                        ; preds = %for.inc28, %for.body7
  %tmp9 = load i32* %k, align 4
  %cmp10 = icmp slt i32 %tmp9, 2
  br i1 %cmp10, label %for.body11, label %for.end31

for.body11:                                       ; preds = %for.cond8
  store i32 0, i32* %l, align 4
  br label %for.cond12

for.cond12:                                       ; preds = %for.inc, %for.body11
  %tmp13 = load i32* %l, align 4
  %cmp14 = icmp slt i32 %tmp13, 1
  br i1 %cmp14, label %for.body15, label %for.end

for.body15:                                       ; preds = %for.cond12
  %tmp16 = load i32* %l, align 4
  %idxprom = sext i32 %tmp16 to i64
  %tmp17 = load i32* %k, align 4
  %idxprom18 = sext i32 %tmp17 to i64
  %tmp19 = load i32* %j, align 4
  %idxprom20 = sext i32 %tmp19 to i64
  %tmp21 = load i32* %i, align 4
  %idxprom22 = sext i32 %tmp21 to i64
  %arrayidx23 = getelementptr inbounds [4 x [4 x [2 x [1 x i32*]]]]* %l_21, i32 0, i64 %idxprom22
  %arrayidx24 = getelementptr inbounds [4 x [2 x [1 x i32*]]]* %arrayidx23, i32 0, i64 %idxprom20
  %arrayidx25 = getelementptr inbounds [2 x [1 x i32*]]* %arrayidx24, i32 0, i64 %idxprom18
  %arrayidx26 = getelementptr inbounds [1 x i32*]* %arrayidx25, i32 0, i64 %idxprom
  store i32* getelementptr inbounds ([5 x [2 x i32]]* @g_13, i32 0, i64 1, i64 1), i32** %arrayidx26, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body15
  %tmp27 = load i32* %l, align 4
  %inc = add nsw i32 %tmp27, 1
  store i32 %inc, i32* %l, align 4
  br label %for.cond12

for.end:                                          ; preds = %for.cond12
  br label %for.inc28

for.inc28:                                        ; preds = %for.end
  %tmp29 = load i32* %k, align 4
  %inc30 = add nsw i32 %tmp29, 1
  store i32 %inc30, i32* %k, align 4
  br label %for.cond8

for.end31:                                        ; preds = %for.cond8
  br label %for.inc32

for.inc32:                                        ; preds = %for.end31
  %tmp33 = load i32* %j, align 4
  %inc34 = add nsw i32 %tmp33, 1
  store i32 %inc34, i32* %j, align 4
  br label %for.cond4

for.end35:                                        ; preds = %for.cond4
  br label %for.inc36

for.inc36:                                        ; preds = %for.end35
  %tmp37 = load i32* %i, align 4
  %inc38 = add nsw i32 %tmp37, 1
  store i32 %inc38, i32* %i, align 4
  br label %for.cond

for.end39:                                        ; preds = %for.cond
  %tmp40 = load i32*** %l_20, align 8
  ret i32** %tmp40
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
  %call = call i64 @func_1()
  %tmp = volatile load i32* @g_2, align 4
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %tmp)
  %tmp2 = load i32* getelementptr inbounds ([5 x [2 x i32]]* @g_13, i32 0, i64 0, i64 0), align 4
  %call3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str1, i32 0, i32 0), i32 %tmp2)
  %tmp4 = load i32* getelementptr inbounds ([5 x [2 x i32]]* @g_13, i32 0, i64 0, i64 1), align 4
  %call5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str2, i32 0, i32 0), i32 %tmp4)
  %tmp6 = load i32* getelementptr inbounds ([5 x [2 x i32]]* @g_13, i32 0, i64 1, i64 0), align 4
  %call7 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str3, i32 0, i32 0), i32 %tmp6)
  %tmp8 = load i32* getelementptr inbounds ([5 x [2 x i32]]* @g_13, i32 0, i64 1, i64 1), align 4
  %call9 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str4, i32 0, i32 0), i32 %tmp8)
  %tmp10 = load i32* getelementptr inbounds ([5 x [2 x i32]]* @g_13, i32 0, i64 2, i64 0), align 4
  %call11 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str5, i32 0, i32 0), i32 %tmp10)
  %tmp12 = load i32* getelementptr inbounds ([5 x [2 x i32]]* @g_13, i32 0, i64 2, i64 1), align 4
  %call13 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str6, i32 0, i32 0), i32 %tmp12)
  %tmp14 = load i32* getelementptr inbounds ([5 x [2 x i32]]* @g_13, i32 0, i64 3, i64 0), align 4
  %call15 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str7, i32 0, i32 0), i32 %tmp14)
  %tmp16 = load i32* getelementptr inbounds ([5 x [2 x i32]]* @g_13, i32 0, i64 3, i64 1), align 4
  %call17 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str8, i32 0, i32 0), i32 %tmp16)
  %tmp18 = load i32* getelementptr inbounds ([5 x [2 x i32]]* @g_13, i32 0, i64 4, i64 0), align 4
  %call19 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str9, i32 0, i32 0), i32 %tmp18)
  %tmp20 = load i32* getelementptr inbounds ([5 x [2 x i32]]* @g_13, i32 0, i64 4, i64 1), align 4
  %call21 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str10, i32 0, i32 0), i32 %tmp20)
  %tmp22 = load i32* getelementptr inbounds ([5 x [2 x i32]]* @g_13, i32 0, i64 3, i64 0), align 4
  %call23 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str7, i32 0, i32 0), i32 %tmp22)
  %0 = load i32* %retval
  ret i32 %0
}

declare i32 @printf(i8*, ...)
