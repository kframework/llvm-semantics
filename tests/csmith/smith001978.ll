; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith001978.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = global i32 966279603, align 4
@g_9 = constant i32* @g_2, align 8
@g_53 = global i32* @g_2, align 8
@g_52 = global i32** @g_53, align 8
@g_76 = global [1 x i32*] zeroinitializer, align 8
@g_75 = global [10 x [5 x i32**]] [[5 x i32**] [i32** getelementptr inbounds ([1 x i32*]* @g_76, i32 0, i32 0), i32** getelementptr inbounds ([1 x i32*]* @g_76, i32 0, i32 0), i32** getelementptr inbounds ([1 x i32*]* @g_76, i32 0, i32 0), i32** getelementptr inbounds ([1 x i32*]* @g_76, i32 0, i32 0), i32** getelementptr inbounds ([1 x i32*]* @g_76, i32 0, i32 0)], [5 x i32**] [i32** getelementptr inbounds ([1 x i32*]* @g_76, i32 0, i32 0), i32** getelementptr inbounds ([1 x i32*]* @g_76, i32 0, i32 0), i32** getelementptr inbounds ([1 x i32*]* @g_76, i32 0, i32 0), i32** getelementptr inbounds ([1 x i32*]* @g_76, i32 0, i32 0), i32** getelementptr inbounds ([1 x i32*]* @g_76, i32 0, i32 0)], [5 x i32**] [i32** getelementptr inbounds ([1 x i32*]* @g_76, i32 0, i32 0), i32** getelementptr inbounds ([1 x i32*]* @g_76, i32 0, i32 0), i32** getelementptr inbounds ([1 x i32*]* @g_76, i32 0, i32 0), i32** getelementptr inbounds ([1 x i32*]* @g_76, i32 0, i32 0), i32** getelementptr inbounds ([1 x i32*]* @g_76, i32 0, i32 0)], [5 x i32**] [i32** getelementptr inbounds ([1 x i32*]* @g_76, i32 0, i32 0), i32** getelementptr inbounds ([1 x i32*]* @g_76, i32 0, i32 0), i32** getelementptr inbounds ([1 x i32*]* @g_76, i32 0, i32 0), i32** getelementptr inbounds ([1 x i32*]* @g_76, i32 0, i32 0), i32** getelementptr inbounds ([1 x i32*]* @g_76, i32 0, i32 0)], [5 x i32**] [i32** getelementptr inbounds ([1 x i32*]* @g_76, i32 0, i32 0), i32** getelementptr inbounds ([1 x i32*]* @g_76, i32 0, i32 0), i32** getelementptr inbounds ([1 x i32*]* @g_76, i32 0, i32 0), i32** getelementptr inbounds ([1 x i32*]* @g_76, i32 0, i32 0), i32** getelementptr inbounds ([1 x i32*]* @g_76, i32 0, i32 0)], [5 x i32**] [i32** getelementptr inbounds ([1 x i32*]* @g_76, i32 0, i32 0), i32** getelementptr inbounds ([1 x i32*]* @g_76, i32 0, i32 0), i32** getelementptr inbounds ([1 x i32*]* @g_76, i32 0, i32 0), i32** getelementptr inbounds ([1 x i32*]* @g_76, i32 0, i32 0), i32** getelementptr inbounds ([1 x i32*]* @g_76, i32 0, i32 0)], [5 x i32**] [i32** getelementptr inbounds ([1 x i32*]* @g_76, i32 0, i32 0), i32** getelementptr inbounds ([1 x i32*]* @g_76, i32 0, i32 0), i32** getelementptr inbounds ([1 x i32*]* @g_76, i32 0, i32 0), i32** getelementptr inbounds ([1 x i32*]* @g_76, i32 0, i32 0), i32** getelementptr inbounds ([1 x i32*]* @g_76, i32 0, i32 0)], [5 x i32**] [i32** getelementptr inbounds ([1 x i32*]* @g_76, i32 0, i32 0), i32** getelementptr inbounds ([1 x i32*]* @g_76, i32 0, i32 0), i32** getelementptr inbounds ([1 x i32*]* @g_76, i32 0, i32 0), i32** getelementptr inbounds ([1 x i32*]* @g_76, i32 0, i32 0), i32** getelementptr inbounds ([1 x i32*]* @g_76, i32 0, i32 0)], [5 x i32**] [i32** getelementptr inbounds ([1 x i32*]* @g_76, i32 0, i32 0), i32** getelementptr inbounds ([1 x i32*]* @g_76, i32 0, i32 0), i32** getelementptr inbounds ([1 x i32*]* @g_76, i32 0, i32 0), i32** getelementptr inbounds ([1 x i32*]* @g_76, i32 0, i32 0), i32** getelementptr inbounds ([1 x i32*]* @g_76, i32 0, i32 0)], [5 x i32**] [i32** getelementptr inbounds ([1 x i32*]* @g_76, i32 0, i32 0), i32** getelementptr inbounds ([1 x i32*]* @g_76, i32 0, i32 0), i32** getelementptr inbounds ([1 x i32*]* @g_76, i32 0, i32 0), i32** getelementptr inbounds ([1 x i32*]* @g_76, i32 0, i32 0), i32** getelementptr inbounds ([1 x i32*]* @g_76, i32 0, i32 0)]], align 16
@g_82 = global i32 1, align 4
@g_92 = global i32* @g_2, align 8
@g_91 = constant [7 x i32**] [i32** @g_92, i32** @g_92, i32** @g_92, i32** @g_92, i32** @g_92, i32** @g_92, i32** @g_92], align 16
@.str = private unnamed_addr constant [19 x i8] c"checksum g_2 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [20 x i8] c"checksum g_82 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define zeroext i16 @func_1() nounwind uwtable {
entry:
  %retval = alloca i16, align 2
  %l_8 = alloca i32, align 4
  %l_97 = alloca i32*, align 8
  %l_5 = alloca i16, align 2
  %l_14 = alloca i32, align 4
  %l_29 = alloca [4 x [1 x [3 x i32*]]], align 16
  %l_98 = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %l_100 = alloca i32**, align 8
  store i32 9, i32* %l_8, align 4
  store i32* @g_2, i32** %l_97, align 8
  store i32 0, i32* @g_2, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp = load i32* @g_2, align 4
  %cmp = icmp sge i32 %tmp, -24
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  store i16 7, i16* %l_5, align 2
  %tmp2 = load i16* %l_5, align 2
  store i16 %tmp2, i16* %retval
  br label %return

for.inc:                                          ; No predecessors!
  %tmp3 = load i32* @g_2, align 4
  %conv = trunc i32 %tmp3 to i8
  %call = call signext i8 @safe_add_func_int8_t_s_s(i8 signext %conv, i8 signext 0)
  %conv4 = sext i8 %call to i32
  store i32 %conv4, i32* @g_2, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store i32 0, i32* @g_2, align 4
  br label %for.cond5

for.cond5:                                        ; preds = %for.inc117, %for.end
  %tmp6 = load i32* @g_2, align 4
  %cmp7 = icmp sge i32 %tmp6, 13
  br i1 %cmp7, label %for.body9, label %for.end122

for.body9:                                        ; preds = %for.cond5
  store i32 -1141265166, i32* %l_14, align 4
  store i32 -1, i32* %l_98, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond16

for.cond16:                                       ; preds = %for.inc45, %for.body9
  %tmp17 = load i32* %i, align 4
  %cmp18 = icmp slt i32 %tmp17, 4
  br i1 %cmp18, label %for.body20, label %for.end48

for.body20:                                       ; preds = %for.cond16
  store i32 0, i32* %j, align 4
  br label %for.cond21

for.cond21:                                       ; preds = %for.inc41, %for.body20
  %tmp22 = load i32* %j, align 4
  %cmp23 = icmp slt i32 %tmp22, 1
  br i1 %cmp23, label %for.body25, label %for.end44

for.body25:                                       ; preds = %for.cond21
  store i32 0, i32* %k, align 4
  br label %for.cond26

for.cond26:                                       ; preds = %for.inc38, %for.body25
  %tmp27 = load i32* %k, align 4
  %cmp28 = icmp slt i32 %tmp27, 3
  br i1 %cmp28, label %for.body30, label %for.end40

for.body30:                                       ; preds = %for.cond26
  %tmp31 = load i32* %k, align 4
  %idxprom = sext i32 %tmp31 to i64
  %tmp32 = load i32* %j, align 4
  %idxprom33 = sext i32 %tmp32 to i64
  %tmp34 = load i32* %i, align 4
  %idxprom35 = sext i32 %tmp34 to i64
  %arrayidx = getelementptr inbounds [4 x [1 x [3 x i32*]]]* %l_29, i32 0, i64 %idxprom35
  %arrayidx36 = getelementptr inbounds [1 x [3 x i32*]]* %arrayidx, i32 0, i64 %idxprom33
  %arrayidx37 = getelementptr inbounds [3 x i32*]* %arrayidx36, i32 0, i64 %idxprom
  store i32* %l_8, i32** %arrayidx37, align 8
  br label %for.inc38

for.inc38:                                        ; preds = %for.body30
  %tmp39 = load i32* %k, align 4
  %inc = add nsw i32 %tmp39, 1
  store i32 %inc, i32* %k, align 4
  br label %for.cond26

for.end40:                                        ; preds = %for.cond26
  br label %for.inc41

for.inc41:                                        ; preds = %for.end40
  %tmp42 = load i32* %j, align 4
  %inc43 = add nsw i32 %tmp42, 1
  store i32 %inc43, i32* %j, align 4
  br label %for.cond21

for.end44:                                        ; preds = %for.cond21
  br label %for.inc45

for.inc45:                                        ; preds = %for.end44
  %tmp46 = load i32* %i, align 4
  %inc47 = add nsw i32 %tmp46, 1
  store i32 %inc47, i32* %i, align 4
  br label %for.cond16

for.end48:                                        ; preds = %for.cond16
  %tmp49 = load i32* %l_8, align 4
  %tmp50 = volatile load i32** @g_9, align 8
  %tmp51 = load i32* %tmp50
  %xor = xor i32 %tmp51, %tmp49
  store i32 %xor, i32* %tmp50
  %tmp52 = load i32* %l_14, align 4
  %tmp53 = load i32* %l_8, align 4
  %cmp54 = icmp ne i32 %tmp52, %tmp53
  br i1 %cmp54, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %for.end48
  %tmp56 = load i32* %l_8, align 4
  %tmp57 = volatile load i32** @g_9, align 8
  %tmp58 = load i32* %tmp57
  %conv59 = trunc i32 %tmp58 to i16
  %tmp60 = load i32* %l_14, align 4
  %call61 = call signext i16 @safe_rshift_func_int16_t_s_u(i16 signext %conv59, i32 %tmp60)
  %conv62 = sext i16 %call61 to i32
  %cmp63 = icmp sge i32 %tmp56, %conv62
  %conv64 = zext i1 %cmp63 to i32
  %tmp65 = load i32* %l_14, align 4
  %cmp66 = icmp ule i32 %conv64, %tmp65
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %for.end48
  %0 = phi i1 [ true, %for.end48 ], [ %cmp66, %lor.rhs ]
  %lor.ext = zext i1 %0 to i32
  %tmp68 = load i32* @g_2, align 4
  %conv69 = trunc i32 %tmp68 to i8
  %arrayidx70 = getelementptr inbounds [4 x [1 x [3 x i32*]]]* %l_29, i32 0, i64 1
  %arrayidx71 = getelementptr inbounds [1 x [3 x i32*]]* %arrayidx70, i32 0, i64 0
  %arrayidx72 = getelementptr inbounds [3 x i32*]* %arrayidx71, i32 0, i64 0
  %tmp73 = load i32** %arrayidx72, align 8
  %tmp74 = load i32* @g_2, align 4
  %conv75 = trunc i32 %tmp74 to i8
  %call76 = call i32* @func_25(i32* %l_8, i32* %tmp73, i8 signext %conv75)
  %tmp77 = load i32* @g_2, align 4
  %tobool = icmp ne i32 %tmp77, 0
  %lnot = xor i1 %tobool, true
  %lnot.ext = zext i1 %lnot to i32
  %conv78 = trunc i32 %lnot.ext to i8
  %call79 = call i32* @func_25(i32* @g_2, i32* %call76, i8 signext %conv78)
  %tmp80 = load i32** %l_97, align 8
  %tmp81 = load i32* %l_98, align 4
  %conv82 = trunc i32 %tmp81 to i8
  %call83 = call i32 @func_19(i32* %call79, i32* %tmp80, i8 zeroext %conv82, i32* %l_8)
  %conv84 = trunc i32 %call83 to i8
  %call85 = call zeroext i8 @safe_sub_func_uint8_t_u_u(i8 zeroext %conv69, i8 zeroext %conv84)
  %conv86 = zext i8 %call85 to i32
  %call87 = call i32 @safe_add_func_int32_t_s_s(i32 %lor.ext, i32 %conv86)
  %conv88 = trunc i32 %call87 to i16
  %tmp89 = load i32** @g_53, align 8
  %tmp90 = load i32* %tmp89
  %tmp91 = load i32** %l_97, align 8
  %tmp92 = load i32* %tmp91
  %tmp93 = load i32** %l_97, align 8
  %tmp94 = load i32* %tmp93
  %call95 = call i32 @safe_unary_minus_func_uint32_t_u(i32 %tmp94)
  %cmp96 = icmp ult i32 %tmp92, %call95
  %conv97 = zext i1 %cmp96 to i32
  %cmp98 = icmp ne i32 %tmp90, %conv97
  %conv99 = zext i1 %cmp98 to i32
  %conv100 = trunc i32 %conv99 to i16
  %call101 = call signext i16 @safe_mod_func_int16_t_s_s(i16 signext %conv88, i16 signext %conv100)
  %tobool102 = icmp ne i16 %call101, 0
  br i1 %tobool102, label %if.then, label %if.else

if.then:                                          ; preds = %lor.end
  %tmp103 = load i32* @g_2, align 4
  %conv104 = trunc i32 %tmp103 to i16
  store i16 %conv104, i16* %retval
  br label %return

if.else:                                          ; preds = %lor.end
  store i32** %l_97, i32*** %l_100, align 8
  %tmp106 = load i32* @g_82, align 4
  %tmp107 = load i32** %l_97, align 8
  %tmp108 = load i32* %tmp107
  %call109 = call i32 @func_42(i32 %tmp106, i32 %tmp108)
  %tmp110 = volatile load i32** @g_9, align 8
  %tmp111 = load i32* %tmp110
  %cmp112 = icmp eq i32 %call109, %tmp111
  %conv113 = zext i1 %cmp112 to i32
  %conv114 = sext i32 %conv113 to i64
  %call115 = call i32* @func_77(i64 %conv114)
  %tmp116 = load i32*** %l_100, align 8
  store i32* %call115, i32** %tmp116
  br label %if.end

if.end:                                           ; preds = %if.else
  br label %for.inc117

for.inc117:                                       ; preds = %if.end
  %tmp118 = load i32* @g_2, align 4
  %conv119 = sext i32 %tmp118 to i64
  %call120 = call i64 @safe_sub_func_uint64_t_u_u(i64 %conv119, i64 1)
  %conv121 = trunc i64 %call120 to i32
  store i32 %conv121, i32* @g_2, align 4
  br label %for.cond5

for.end122:                                       ; preds = %for.cond5
  %tmp123 = load i32* @g_2, align 4
  %conv124 = trunc i32 %tmp123 to i16
  store i16 %conv124, i16* %retval
  br label %return

return:                                           ; preds = %for.end122, %if.then, %for.body
  %1 = load i16* %retval
  ret i16 %1
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

define i32 @func_19(i32* %p_20, i32* %p_21, i8 zeroext %p_22, i32* %p_23) nounwind uwtable {
entry:
  %p_20.addr = alloca i32*, align 8
  %p_21.addr = alloca i32*, align 8
  %p_22.addr = alloca i8, align 1
  %p_23.addr = alloca i32*, align 8
  %l_24 = alloca i32, align 4
  store i32* %p_20, i32** %p_20.addr, align 8
  store i32* %p_21, i32** %p_21.addr, align 8
  store i8 %p_22, i8* %p_22.addr, align 1
  store i32* %p_23, i32** %p_23.addr, align 8
  store i32 442835045, i32* %l_24, align 4
  %tmp = load i32* %l_24, align 4
  ret i32 %tmp
}

define i32* @func_25(i32* %p_26, i32* %p_27, i8 signext %p_28) nounwind uwtable {
entry:
  %p_26.addr = alloca i32*, align 8
  %p_27.addr = alloca i32*, align 8
  %p_28.addr = alloca i8, align 1
  store i32* %p_26, i32** %p_26.addr, align 8
  store i32* %p_27, i32** %p_27.addr, align 8
  store i8 %p_28, i8* %p_28.addr, align 1
  %tmp = load i32** %p_26.addr, align 8
  ret i32* %tmp
}

define internal i32 @safe_unary_minus_func_uint32_t_u(i32 %ui) nounwind uwtable {
entry:
  %ui.addr = alloca i32, align 4
  store i32 %ui, i32* %ui.addr, align 4
  %tmp = load i32* %ui.addr, align 4
  %sub = sub i32 0, %tmp
  ret i32 %sub
}

define i32* @func_77(i64 %p_78) nounwind uwtable {
entry:
  %p_78.addr = alloca i64, align 8
  %l_79 = alloca i32*, align 8
  %l_80 = alloca [1 x i32**], align 8
  %l_81 = alloca i32*, align 8
  %l_83 = alloca i32*, align 8
  %i = alloca i32, align 4
  %l_86 = alloca i64, align 8
  %l_87 = alloca [4 x i32], align 16
  %i11 = alloca i32, align 4
  store i64 %p_78, i64* %p_78.addr, align 8
  store i32* @g_2, i32** %l_79, align 8
  store i32* @g_82, i32** %l_81, align 8
  store i32* null, i32** %l_83, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp, 1
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp1 = load i32* %i, align 4
  %idxprom = sext i32 %tmp1 to i64
  %arrayidx = getelementptr inbounds [1 x i32**]* %l_80, i32 0, i64 %idxprom
  store i32** %l_79, i32*** %arrayidx, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %tmp2 = load i32* %i, align 4
  %inc = add nsw i32 %tmp2, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  br label %lbl_88

lbl_88:                                           ; preds = %if.then, %for.end
  %tmp3 = load i32** %l_79, align 8
  store i32* %tmp3, i32** %l_81, align 8
  store i32* null, i32** %l_83, align 8
  store i64 -3, i64* %p_78.addr, align 8
  br label %for.cond4

for.cond4:                                        ; preds = %for.inc27, %lbl_88
  %tmp5 = load i64* %p_78.addr, align 8
  %cmp6 = icmp ule i64 %tmp5, -17
  br i1 %cmp6, label %for.body7, label %for.end29

for.body7:                                        ; preds = %for.cond4
  store i64 6, i64* %l_86, align 8
  store i32 0, i32* %i11, align 4
  br label %for.cond12

for.cond12:                                       ; preds = %for.inc19, %for.body7
  %tmp13 = load i32* %i11, align 4
  %cmp14 = icmp slt i32 %tmp13, 4
  br i1 %cmp14, label %for.body15, label %for.end22

for.body15:                                       ; preds = %for.cond12
  %tmp16 = load i32* %i11, align 4
  %idxprom17 = sext i32 %tmp16 to i64
  %arrayidx18 = getelementptr inbounds [4 x i32]* %l_87, i32 0, i64 %idxprom17
  store i32 -1139917298, i32* %arrayidx18, align 4
  br label %for.inc19

for.inc19:                                        ; preds = %for.body15
  %tmp20 = load i32* %i11, align 4
  %inc21 = add nsw i32 %tmp20, 1
  store i32 %inc21, i32* %i11, align 4
  br label %for.cond12

for.end22:                                        ; preds = %for.cond12
  %tmp23 = load i64* %l_86, align 8
  %arrayidx24 = getelementptr inbounds [4 x i32]* %l_87, i32 0, i64 1
  %tmp25 = load i32* %arrayidx24, align 4
  %conv = sext i32 %tmp25 to i64
  %and = and i64 %conv, %tmp23
  %conv26 = trunc i64 %and to i32
  store i32 %conv26, i32* %arrayidx24, align 4
  br label %for.inc27

for.inc27:                                        ; preds = %for.end22
  %tmp28 = load i64* %p_78.addr, align 8
  %call = call i64 @safe_sub_func_int64_t_s_s(i64 %tmp28, i64 1)
  store i64 %call, i64* %p_78.addr, align 8
  br label %for.cond4

for.end29:                                        ; preds = %for.cond4
  %tmp30 = load i64* %p_78.addr, align 8
  %tobool = icmp ne i64 %tmp30, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %for.end29
  br label %lbl_88

if.end:                                           ; preds = %for.end29
  ret i32* @g_2
}

define i32 @func_42(i32 %p_43, i32 %p_44) nounwind uwtable {
entry:
  %p_43.addr = alloca i32, align 4
  %p_44.addr = alloca i32, align 4
  %l_45 = alloca i32, align 4
  store i32 %p_43, i32* %p_43.addr, align 4
  store i32 %p_44, i32* %p_44.addr, align 4
  store i32 1410334470, i32* %l_45, align 4
  %tmp = load i32* %l_45, align 4
  ret i32 %tmp
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

define i32* @func_30(i32* %p_31) nounwind uwtable {
entry:
  %p_31.addr = alloca i32*, align 8
  %l_32 = alloca i16, align 2
  %l_94 = alloca i32*, align 8
  %l_95 = alloca i32**, align 8
  %l_96 = alloca i32**, align 8
  store i32* %p_31, i32** %p_31.addr, align 8
  store i16 7, i16* %l_32, align 2
  store i32* @g_82, i32** %l_94, align 8
  store i32** null, i32*** %l_95, align 8
  store i32** %l_94, i32*** %l_96, align 8
  %tmp = load i16* %l_32, align 2
  %conv = sext i16 %tmp to i32
  %tmp1 = load i32** %p_31.addr, align 8
  store i32 %conv, i32* %tmp1
  %tmp2 = load i16* %l_32, align 2
  %conv3 = sext i16 %tmp2 to i32
  %tmp4 = load i32** %l_94, align 8
  %cmp = icmp eq i32* %tmp4, null
  %conv5 = zext i1 %cmp to i32
  %call = call i32 @func_42(i32 %conv3, i32 %conv5)
  %tmp6 = load i32** %l_94, align 8
  %tmp7 = load i32* @g_2, align 4
  %tmp8 = load i32* @g_2, align 4
  %conv9 = sext i32 %tmp8 to i64
  %tmp10 = load i32* @g_2, align 4
  %conv11 = trunc i32 %tmp10 to i16
  %call12 = call i32* @func_33(i32 %call, i32* %tmp6, i32 %tmp7, i64 %conv9, i16 signext %conv11)
  %tmp13 = load i32** %l_94, align 8
  %tmp14 = load i32** %l_94, align 8
  %tmp15 = load i32* %tmp14
  %conv16 = trunc i32 %tmp15 to i8
  %call17 = call i32* @func_25(i32* %call12, i32* %tmp13, i8 signext %conv16)
  %tmp18 = load i32** %l_94, align 8
  %tmp19 = load i32* %tmp18
  %conv20 = trunc i32 %tmp19 to i8
  %call21 = call i32* @func_25(i32* @g_2, i32* %call17, i8 signext %conv20)
  %tmp22 = load i32*** %l_96, align 8
  store i32* %call21, i32** %tmp22
  %tmp23 = load i32** %p_31.addr, align 8
  ret i32* %tmp23
}

define i32* @func_33(i32 %p_34, i32* %p_35, i32 %p_36, i64 %p_37, i16 signext %p_38) nounwind uwtable {
entry:
  %p_34.addr = alloca i32, align 4
  %p_35.addr = alloca i32*, align 8
  %p_36.addr = alloca i32, align 4
  %p_37.addr = alloca i64, align 8
  %p_38.addr = alloca i16, align 2
  %l_41 = alloca i8, align 1
  %l_48 = alloca i32, align 4
  %l_51 = alloca i32*, align 8
  %l_50 = alloca i32**, align 8
  %l_49 = alloca [2 x [3 x [8 x i32***]]], align 16
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %l_89 = alloca i32*, align 8
  %l_90 = alloca i32*, align 8
  %l_93 = alloca i32, align 4
  store i32 %p_34, i32* %p_34.addr, align 4
  store i32* %p_35, i32** %p_35.addr, align 8
  store i32 %p_36, i32* %p_36.addr, align 4
  store i64 %p_37, i64* %p_37.addr, align 8
  store i16 %p_38, i16* %p_38.addr, align 2
  store i8 -93, i8* %l_41, align 1
  store i32 1707783216, i32* %l_48, align 4
  store i32* %l_48, i32** %l_51, align 8
  store i32** %l_51, i32*** %l_50, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc21, %entry
  %tmp = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp, 2
  br i1 %cmp, label %for.body, label %for.end24

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc17, %for.body
  %tmp2 = load i32* %j, align 4
  %cmp3 = icmp slt i32 %tmp2, 3
  br i1 %cmp3, label %for.body4, label %for.end20

for.body4:                                        ; preds = %for.cond1
  store i32 0, i32* %k, align 4
  br label %for.cond5

for.cond5:                                        ; preds = %for.inc, %for.body4
  %tmp6 = load i32* %k, align 4
  %cmp7 = icmp slt i32 %tmp6, 8
  br i1 %cmp7, label %for.body8, label %for.end

for.body8:                                        ; preds = %for.cond5
  %tmp9 = load i32* %k, align 4
  %idxprom = sext i32 %tmp9 to i64
  %tmp10 = load i32* %j, align 4
  %idxprom11 = sext i32 %tmp10 to i64
  %tmp12 = load i32* %i, align 4
  %idxprom13 = sext i32 %tmp12 to i64
  %arrayidx = getelementptr inbounds [2 x [3 x [8 x i32***]]]* %l_49, i32 0, i64 %idxprom13
  %arrayidx14 = getelementptr inbounds [3 x [8 x i32***]]* %arrayidx, i32 0, i64 %idxprom11
  %arrayidx15 = getelementptr inbounds [8 x i32***]* %arrayidx14, i32 0, i64 %idxprom
  store i32*** %l_50, i32**** %arrayidx15, align 8
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
  %tmp25 = load i8* %l_41, align 1
  %conv = sext i8 %tmp25 to i16
  %call = call signext i8 @safe_lshift_func_int8_t_s_s(i8 signext 36, i32 1956576990)
  %conv26 = sext i8 %call to i32
  %tmp27 = load i8* %l_41, align 1
  %conv28 = sext i8 %tmp27 to i32
  %call29 = call i32 @func_42(i32 %conv26, i32 %conv28)
  %conv30 = trunc i32 %call29 to i16
  %call31 = call zeroext i16 @safe_add_func_uint16_t_u_u(i16 zeroext %conv, i16 zeroext %conv30)
  %conv32 = zext i16 %call31 to i32
  %tmp33 = load i32* %l_48, align 4
  %or = or i32 %tmp33, %conv32
  store i32 %or, i32* %l_48, align 4
  store i32** null, i32*** @g_52, align 8
  %tmp34 = load i32** %p_35.addr, align 8
  %tmp35 = load i32* %tmp34
  %tmp36 = load i32** %p_35.addr, align 8
  %tmp37 = load i32* %tmp36
  %cmp38 = icmp eq i32 %tmp35, %tmp37
  %conv39 = zext i1 %cmp38 to i32
  %conv40 = sext i32 %conv39 to i64
  %tmp41 = load i32** %p_35.addr, align 8
  %tmp42 = load i32* %tmp41
  %tmp43 = load i32** %l_51, align 8
  %tmp44 = load i32* %tmp43
  %tmp45 = load i32* @g_2, align 4
  %conv46 = trunc i32 %tmp45 to i8
  %call47 = call i32* @func_58(i32 %tmp44, i32*** null, i8 signext %conv46)
  %call48 = call i32 @func_19(i32* %call47, i32* @g_2, i8 zeroext -79, i32* null)
  %call49 = call i32 @safe_mod_func_uint32_t_u_u(i32 %tmp42, i32 %call48)
  %conv50 = zext i32 %call49 to i64
  %call51 = call i64 @safe_add_func_int64_t_s_s(i64 %conv40, i64 %conv50)
  %tobool = icmp ne i64 %call51, 0
  br i1 %tobool, label %if.then, label %if.else

if.then:                                          ; preds = %for.end24
  %tmp52 = load i32** %p_35.addr, align 8
  %tmp53 = load i32* %tmp52
  %tobool54 = icmp ne i32 %tmp53, 0
  br i1 %tobool54, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %if.then
  %tmp55 = load i32** %p_35.addr, align 8
  %tmp56 = load i32* %tmp55
  %tobool57 = icmp ne i32 %tmp56, 0
  br label %land.end

land.end:                                         ; preds = %land.rhs, %if.then
  %0 = phi i1 [ false, %if.then ], [ %tobool57, %land.rhs ]
  %land.ext = zext i1 %0 to i32
  %tmp58 = load i32** %l_51, align 8
  store i32 %land.ext, i32* %tmp58
  br label %if.end

if.else:                                          ; preds = %for.end24
  store i32* null, i32** %l_89, align 8
  store i32* %l_48, i32** %l_90, align 8
  store i32 1275188668, i32* %l_93, align 4
  %tmp62 = load i32* @g_82, align 4
  %conv63 = sext i32 %tmp62 to i64
  %call64 = call i32* @func_77(i64 %conv63)
  %tmp65 = load i32*** %l_50, align 8
  %tmp66 = load i32** %l_51, align 8
  %tmp67 = load i32* %tmp66
  %tmp68 = load i32** %p_35.addr, align 8
  %tmp69 = load i32** %l_89, align 8
  %cmp70 = icmp ne i32* %tmp68, %tmp69
  %conv71 = zext i1 %cmp70 to i32
  %cmp72 = icmp ne i32 %tmp67, %conv71
  %conv73 = zext i1 %cmp72 to i32
  %conv74 = trunc i32 %conv73 to i16
  %tmp75 = load i32* @g_2, align 4
  %tmp76 = load i32* %p_34.addr, align 4
  %conv77 = trunc i32 %tmp76 to i16
  %tmp78 = load i32* @g_2, align 4
  %call79 = call i32 @func_63(i32** getelementptr inbounds ([1 x i32*]* @g_76, i32 0, i64 0), i32 %tmp75, i16 signext %conv77, i32** @g_53, i32 %tmp78)
  %tobool80 = icmp ne i32 %call79, 0
  br i1 %tobool80, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %if.else
  %tmp81 = load i32** %l_90, align 8
  %tmp82 = load i32** %l_90, align 8
  %tmp83 = load i32* %p_34.addr, align 4
  %conv84 = trunc i32 %tmp83 to i8
  %tmp85 = load i32** %l_90, align 8
  %call86 = call i32 @func_19(i32* %tmp81, i32* %tmp82, i8 zeroext %conv84, i32* %tmp85)
  %tobool87 = icmp ne i32 %call86, 0
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %if.else
  %1 = phi i1 [ true, %if.else ], [ %tobool87, %lor.rhs ]
  %lnot = xor i1 %1, true
  %lnot.ext = zext i1 %lnot to i32
  %conv88 = trunc i32 %lnot.ext to i16
  %call89 = call i32** @func_70(i32* %call64, i32** %tmp65, i16 zeroext %conv74, i16 signext %conv88)
  %tmp90 = load i32*** %l_50, align 8
  %tmp91 = load i32** %tmp90
  %tmp92 = load i32* %tmp91
  %tmp93 = load i64* %p_37.addr, align 8
  %conv94 = trunc i64 %tmp93 to i16
  %tmp95 = load i32*** getelementptr inbounds ([7 x i32**]* @g_91, i32 0, i64 2), align 8
  %tmp96 = load i32* @g_2, align 4
  %call97 = call i32 @func_63(i32** %call89, i32 %tmp92, i16 signext %conv94, i32** %tmp95, i32 %tmp96)
  %tmp98 = load i32*** %l_50, align 8
  %tmp99 = load i32** %tmp98
  %tmp100 = load i32* %tmp99
  %cmp101 = icmp sgt i32 %call97, %tmp100
  %conv102 = zext i1 %cmp101 to i32
  %tmp103 = load i32* %l_93, align 4
  %and = and i32 %tmp103, %conv102
  store i32 %and, i32* %l_93, align 4
  store i8 0, i8* %l_41, align 1
  br label %for.cond104

for.cond104:                                      ; preds = %for.inc113, %lor.end
  %tmp105 = load i8* %l_41, align 1
  %conv106 = sext i8 %tmp105 to i32
  %cmp107 = icmp slt i32 %conv106, 1
  br i1 %cmp107, label %for.body109, label %for.end117

for.body109:                                      ; preds = %for.cond104
  %tmp110 = load i8* %l_41, align 1
  %idxprom111 = sext i8 %tmp110 to i64
  %arrayidx112 = getelementptr inbounds [1 x i32*]* @g_76, i32 0, i64 %idxprom111
  store i32* @g_2, i32** %arrayidx112, align 8
  br label %for.inc113

for.inc113:                                       ; preds = %for.body109
  %tmp114 = load i8* %l_41, align 1
  %conv115 = sext i8 %tmp114 to i32
  %add = add nsw i32 %conv115, 1
  %conv116 = trunc i32 %add to i8
  store i8 %conv116, i8* %l_41, align 1
  br label %for.cond104

for.end117:                                       ; preds = %for.cond104
  br label %if.end

if.end:                                           ; preds = %for.end117, %land.end
  %tmp118 = load i32*** %l_50, align 8
  %tmp119 = load i32** %tmp118
  ret i32* %tmp119
}

define internal zeroext i16 @safe_add_func_uint16_t_u_u(i16 zeroext %ui1, i16 zeroext %ui2) nounwind uwtable {
entry:
  %ui1.addr = alloca i16, align 2
  %ui2.addr = alloca i16, align 2
  store i16 %ui1, i16* %ui1.addr, align 2
  store i16 %ui2, i16* %ui2.addr, align 2
  %tmp = load i16* %ui1.addr, align 2
  %conv = zext i16 %tmp to i32
  %tmp1 = load i16* %ui2.addr, align 2
  %conv2 = zext i16 %tmp1 to i32
  %add = add nsw i32 %conv, %conv2
  %conv3 = trunc i32 %add to i16
  ret i16 %conv3
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

define i32* @func_58(i32 %p_59, i32*** %p_60, i8 signext %p_61) nounwind uwtable {
entry:
  %p_59.addr = alloca i32, align 4
  %p_60.addr = alloca i32***, align 8
  %p_61.addr = alloca i8, align 1
  %l_62 = alloca i32*, align 8
  store i32 %p_59, i32* %p_59.addr, align 4
  store i32*** %p_60, i32**** %p_60.addr, align 8
  store i8 %p_61, i8* %p_61.addr, align 1
  store i32* @g_2, i32** %l_62, align 8
  %tmp = load i32** %l_62, align 8
  ret i32* %tmp
}

define i32 @func_63(i32** %p_64, i32 %p_65, i16 signext %p_66, i32** %p_67, i32 %p_68) nounwind uwtable {
entry:
  %p_64.addr = alloca i32**, align 8
  %p_65.addr = alloca i32, align 4
  %p_66.addr = alloca i16, align 2
  %p_67.addr = alloca i32**, align 8
  %p_68.addr = alloca i32, align 4
  %l_69 = alloca [9 x [10 x i32]], align 16
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32** %p_64, i32*** %p_64.addr, align 8
  store i32 %p_65, i32* %p_65.addr, align 4
  store i16 %p_66, i16* %p_66.addr, align 2
  store i32** %p_67, i32*** %p_67.addr, align 8
  store i32 %p_68, i32* %p_68.addr, align 4
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
  %cmp3 = icmp slt i32 %tmp2, 10
  br i1 %cmp3, label %for.body4, label %for.end

for.body4:                                        ; preds = %for.cond1
  %tmp5 = load i32* %j, align 4
  %idxprom = sext i32 %tmp5 to i64
  %tmp6 = load i32* %i, align 4
  %idxprom7 = sext i32 %tmp6 to i64
  %arrayidx = getelementptr inbounds [9 x [10 x i32]]* %l_69, i32 0, i64 %idxprom7
  %arrayidx8 = getelementptr inbounds [10 x i32]* %arrayidx, i32 0, i64 %idxprom
  store i32 -1503318190, i32* %arrayidx8, align 4
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
  %tmp14 = load i32*** %p_67.addr, align 8
  %tmp15 = load i32** %tmp14
  %tmp16 = load i32*** %p_67.addr, align 8
  store i32* %tmp15, i32** %tmp16
  %arrayidx17 = getelementptr inbounds [9 x [10 x i32]]* %l_69, i32 0, i64 5
  %arrayidx18 = getelementptr inbounds [10 x i32]* %arrayidx17, i32 0, i64 6
  %tmp19 = load i32* %arrayidx18, align 4
  ret i32 %tmp19
}

define i32** @func_70(i32* %p_71, i32** %p_72, i16 zeroext %p_73, i16 signext %p_74) nounwind uwtable {
entry:
  %p_71.addr = alloca i32*, align 8
  %p_72.addr = alloca i32**, align 8
  %p_73.addr = alloca i16, align 2
  %p_74.addr = alloca i16, align 2
  store i32* %p_71, i32** %p_71.addr, align 8
  store i32** %p_72, i32*** %p_72.addr, align 8
  store i16 %p_73, i16* %p_73.addr, align 2
  store i16 %p_74, i16* %p_74.addr, align 2
  %tmp = load i32*** getelementptr inbounds ([10 x [5 x i32**]]* @g_75, i32 0, i64 4, i64 3), align 8
  ret i32** %tmp
}

define internal i64 @safe_sub_func_int64_t_s_s(i64 %si1, i64 %si2) nounwind uwtable {
entry:
  %si1.addr = alloca i64, align 8
  %si2.addr = alloca i64, align 8
  store i64 %si1, i64* %si1.addr, align 8
  store i64 %si2, i64* %si2.addr, align 8
  %tmp = load i64* %si1.addr, align 8
  %tmp1 = load i64* %si2.addr, align 8
  %xor = xor i64 %tmp, %tmp1
  %tmp2 = load i64* %si1.addr, align 8
  %tmp3 = load i64* %si1.addr, align 8
  %tmp4 = load i64* %si2.addr, align 8
  %xor5 = xor i64 %tmp3, %tmp4
  %and = and i64 %xor5, -9223372036854775808
  %xor6 = xor i64 %tmp2, %and
  %tmp7 = load i64* %si2.addr, align 8
  %sub = sub nsw i64 %xor6, %tmp7
  %tmp8 = load i64* %si2.addr, align 8
  %xor9 = xor i64 %sub, %tmp8
  %and10 = and i64 %xor, %xor9
  %cmp = icmp slt i64 %and10, 0
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %tmp11 = load i64* %si1.addr, align 8
  br label %cond.end

cond.false:                                       ; preds = %entry
  %tmp12 = load i64* %si1.addr, align 8
  %tmp13 = load i64* %si2.addr, align 8
  %sub14 = sub nsw i64 %tmp12, %tmp13
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i64 [ %tmp11, %cond.true ], [ %sub14, %cond.false ]
  ret i64 %cond
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
  %call = call zeroext i16 @func_1()
  %tmp = load i32* @g_2, align 4
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %tmp)
  %tmp2 = load i32* @g_82, align 4
  %call3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str1, i32 0, i32 0), i32 %tmp2)
  %0 = load i32* %retval
  ret i32 %0
}

declare i32 @printf(i8*, ...)
