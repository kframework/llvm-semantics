; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith001682.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = global i32 -179040897, align 4
@g_14 = global i32 492391683, align 4
@g_23 = global i32 -3, align 4
@g_28 = global i16 22707, align 2
@g_34 = global i32 -2076813535, align 4
@g_35 = global i32 -10, align 4
@g_36 = global i32 1743226037, align 4
@g_41 = global i8 1, align 1
@.str = private unnamed_addr constant [19 x i8] c"checksum g_2 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [20 x i8] c"checksum g_14 = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [20 x i8] c"checksum g_23 = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [20 x i8] c"checksum g_28 = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [20 x i8] c"checksum g_34 = %d\0A\00", align 1
@.str5 = private unnamed_addr constant [20 x i8] c"checksum g_35 = %d\0A\00", align 1
@.str6 = private unnamed_addr constant [20 x i8] c"checksum g_36 = %d\0A\00", align 1
@.str7 = private unnamed_addr constant [20 x i8] c"checksum g_41 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable {
entry:
  %l_29 = alloca i32, align 4
  %l_42 = alloca i32*, align 8
  %l_9 = alloca [7 x [3 x i16]], align 16
  %l_30 = alloca [6 x i32*], align 16
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 -1932891759, i32* %l_29, align 4
  store i32* @g_35, i32** %l_42, align 8
  volatile store i32 -5, i32* @g_2, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc99, %entry
  %tmp = volatile load i32* @g_2, align 4
  %cmp = icmp sle i32 %tmp, 0
  br i1 %cmp, label %for.body, label %for.end104

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %i, align 4
  br label %for.cond5

for.cond5:                                        ; preds = %for.inc18, %for.body
  %tmp6 = load i32* %i, align 4
  %cmp7 = icmp slt i32 %tmp6, 7
  br i1 %cmp7, label %for.body8, label %for.end21

for.body8:                                        ; preds = %for.cond5
  store i32 0, i32* %j, align 4
  br label %for.cond9

for.cond9:                                        ; preds = %for.inc, %for.body8
  %tmp10 = load i32* %j, align 4
  %cmp11 = icmp slt i32 %tmp10, 3
  br i1 %cmp11, label %for.body12, label %for.end

for.body12:                                       ; preds = %for.cond9
  %tmp13 = load i32* %j, align 4
  %idxprom = sext i32 %tmp13 to i64
  %tmp14 = load i32* %i, align 4
  %idxprom15 = sext i32 %tmp14 to i64
  %arrayidx = getelementptr inbounds [7 x [3 x i16]]* %l_9, i32 0, i64 %idxprom15
  %arrayidx16 = getelementptr inbounds [3 x i16]* %arrayidx, i32 0, i64 %idxprom
  store i16 28248, i16* %arrayidx16, align 2
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
  store i32 0, i32* %i, align 4
  br label %for.cond22

for.cond22:                                       ; preds = %for.inc29, %for.end21
  %tmp23 = load i32* %i, align 4
  %cmp24 = icmp slt i32 %tmp23, 6
  br i1 %cmp24, label %for.body25, label %for.end32

for.body25:                                       ; preds = %for.cond22
  %tmp26 = load i32* %i, align 4
  %idxprom27 = sext i32 %tmp26 to i64
  %arrayidx28 = getelementptr inbounds [6 x i32*]* %l_30, i32 0, i64 %idxprom27
  store i32* null, i32** %arrayidx28, align 8
  br label %for.inc29

for.inc29:                                        ; preds = %for.body25
  %tmp30 = load i32* %i, align 4
  %inc31 = add nsw i32 %tmp30, 1
  store i32 %inc31, i32* %i, align 4
  br label %for.cond22

for.end32:                                        ; preds = %for.cond22
  %arrayidx33 = getelementptr inbounds [7 x [3 x i16]]* %l_9, i32 0, i64 2
  %arrayidx34 = getelementptr inbounds [3 x i16]* %arrayidx33, i32 0, i64 0
  %tmp35 = load i16* %arrayidx34, align 2
  %call = call zeroext i16 @safe_lshift_func_uint16_t_u_u(i16 zeroext %tmp35, i32 -1240567729)
  %conv = trunc i16 %call to i8
  %tmp36 = volatile load i32* @g_2, align 4
  %call37 = call i32 @safe_div_func_uint32_t_u_u(i32 -1, i32 %tmp36)
  %call38 = call zeroext i8 @safe_lshift_func_uint8_t_u_u(i8 zeroext %conv, i32 %call37)
  %conv39 = zext i8 %call38 to i64
  %tmp40 = load i32* @g_14, align 4
  %conv41 = trunc i32 %tmp40 to i16
  %tmp42 = load i32* @g_14, align 4
  %conv43 = trunc i32 %tmp42 to i16
  %call44 = call zeroext i16 @safe_mul_func_uint16_t_u_u(i16 zeroext %conv41, i16 zeroext %conv43)
  %conv45 = zext i16 %call44 to i64
  %cmp46 = icmp sgt i64 2619421253, %conv45
  %conv47 = zext i1 %cmp46 to i32
  %conv48 = sext i32 %conv47 to i64
  %or = or i64 %conv48, 2697992403
  %cmp49 = icmp slt i64 %conv39, %or
  %conv50 = zext i1 %cmp49 to i32
  %conv51 = sext i32 %conv50 to i64
  %cmp52 = icmp eq i64 %conv51, 4028910655
  %conv53 = zext i1 %cmp52 to i32
  %arrayidx54 = getelementptr inbounds [7 x [3 x i16]]* %l_9, i32 0, i64 1
  %arrayidx55 = getelementptr inbounds [3 x i16]* %arrayidx54, i32 0, i64 1
  %tmp56 = load i16* %arrayidx55, align 2
  %call57 = call zeroext i16 @safe_lshift_func_uint16_t_u_u(i16 zeroext %tmp56, i32 -1263162930)
  %conv58 = zext i16 %call57 to i32
  %tmp59 = load i16* @g_28, align 2
  %conv60 = zext i16 %tmp59 to i32
  %tmp61 = load i32* %l_29, align 4
  %cmp62 = icmp ult i32 %conv60, %tmp61
  %conv63 = zext i1 %cmp62 to i32
  %cmp64 = icmp ne i32 %conv58, %conv63
  %conv65 = zext i1 %cmp64 to i32
  %conv66 = trunc i32 %conv65 to i8
  %arrayidx67 = getelementptr inbounds [6 x i32*]* %l_30, i32 0, i64 2
  %tmp68 = load i32** %arrayidx67, align 8
  %cmp69 = icmp ne i32* @g_14, %tmp68
  %conv70 = zext i1 %cmp69 to i32
  %conv71 = sext i32 %conv70 to i64
  %cmp72 = icmp sle i64 -1, %conv71
  %conv73 = zext i1 %cmp72 to i32
  %conv74 = trunc i32 %conv73 to i8
  %call75 = call signext i8 @safe_mul_func_int8_t_s_s(i8 signext %conv66, i8 signext %conv74)
  %conv76 = sext i8 %call75 to i64
  %tmp77 = load i32* @g_14, align 4
  %tmp78 = load i32* %l_29, align 4
  %call79 = call i32 @func_17(i64 %conv76, i8 signext -1, i32 %tmp77, i32 %tmp78)
  %conv80 = trunc i32 %call79 to i16
  %tmp81 = load i8* @g_41, align 1
  %conv82 = sext i8 %tmp81 to i64
  %tmp83 = load i32* %l_29, align 4
  %conv84 = zext i32 %tmp83 to i64
  %call85 = call i64 @safe_add_func_int64_t_s_s(i64 %conv82, i64 %conv84)
  %conv86 = trunc i64 %call85 to i8
  %tmp87 = load i32* @g_36, align 4
  %conv88 = trunc i32 %tmp87 to i8
  %call89 = call signext i8 @safe_mul_func_int8_t_s_s(i8 signext %conv86, i8 signext %conv88)
  %call90 = call i32 @func_31(i8 zeroext %call89)
  %tmp91 = load i16* @g_28, align 2
  %conv92 = zext i16 %tmp91 to i32
  %cmp93 = icmp eq i32 %call90, %conv92
  %conv94 = zext i1 %cmp93 to i32
  %call95 = call zeroext i16 @safe_rshift_func_uint16_t_u_u(i16 zeroext %conv80, i32 %conv94)
  %conv96 = zext i16 %call95 to i32
  %cmp97 = icmp sge i32 %conv53, %conv96
  %conv98 = zext i1 %cmp97 to i32
  store i32 %conv98, i32* @g_14, align 4
  br label %for.inc99

for.inc99:                                        ; preds = %for.end32
  %tmp100 = volatile load i32* @g_2, align 4
  %conv101 = trunc i32 %tmp100 to i8
  %call102 = call zeroext i8 @safe_sub_func_uint8_t_u_u(i8 zeroext %conv101, i8 zeroext 8)
  %conv103 = zext i8 %call102 to i32
  volatile store i32 %conv103, i32* @g_2, align 4
  br label %for.cond

for.end104:                                       ; preds = %for.cond
  %tmp105 = load i32** %l_42, align 8
  %tmp106 = load i32** %l_42, align 8
  %cmp107 = icmp ne i32* %tmp105, %tmp106
  %conv108 = zext i1 %cmp107 to i32
  %tmp109 = load i32** %l_42, align 8
  store i32 %conv108, i32* %tmp109
  %tmp110 = load i16* @g_28, align 2
  %conv111 = zext i16 %tmp110 to i32
  ret i32 %conv111
}

define internal zeroext i8 @safe_lshift_func_uint8_t_u_u(i8 zeroext %left, i32 %right) nounwind uwtable {
entry:
  %left.addr = alloca i8, align 1
  %right.addr = alloca i32, align 4
  store i8 %left, i8* %left.addr, align 1
  store i32 %right, i32* %right.addr, align 4
  %tmp = load i32* %right.addr, align 4
  %cmp = icmp uge i32 %tmp, 32
  br i1 %cmp, label %cond.true, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %tmp1 = load i8* %left.addr, align 1
  %conv = zext i8 %tmp1 to i32
  %tmp2 = load i32* %right.addr, align 4
  %shr = ashr i32 255, %tmp2
  %cmp3 = icmp sgt i32 %conv, %shr
  br i1 %cmp3, label %cond.true, label %cond.false

cond.true:                                        ; preds = %lor.lhs.false, %entry
  %tmp5 = load i8* %left.addr, align 1
  %conv6 = zext i8 %tmp5 to i32
  br label %cond.end

cond.false:                                       ; preds = %lor.lhs.false
  %tmp7 = load i8* %left.addr, align 1
  %conv8 = zext i8 %tmp7 to i32
  %tmp9 = load i32* %right.addr, align 4
  %shl = shl i32 %conv8, %tmp9
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %conv6, %cond.true ], [ %shl, %cond.false ]
  %conv10 = trunc i32 %cond to i8
  ret i8 %conv10
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

define internal zeroext i16 @safe_rshift_func_uint16_t_u_u(i16 zeroext %left, i32 %right) nounwind uwtable {
entry:
  %left.addr = alloca i16, align 2
  %right.addr = alloca i32, align 4
  store i16 %left, i16* %left.addr, align 2
  store i32 %right, i32* %right.addr, align 4
  %tmp = load i32* %right.addr, align 4
  %cmp = icmp uge i32 %tmp, 32
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %tmp1 = load i16* %left.addr, align 2
  %conv = zext i16 %tmp1 to i32
  br label %cond.end

cond.false:                                       ; preds = %entry
  %tmp2 = load i16* %left.addr, align 2
  %conv3 = zext i16 %tmp2 to i32
  %tmp4 = load i32* %right.addr, align 4
  %shr = ashr i32 %conv3, %tmp4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %conv, %cond.true ], [ %shr, %cond.false ]
  %conv5 = trunc i32 %cond to i16
  ret i16 %conv5
}

define i32 @func_17(i64 %p_18, i8 signext %p_19, i32 %p_20, i32 %p_21) nounwind uwtable {
entry:
  %p_18.addr = alloca i64, align 8
  %p_19.addr = alloca i8, align 1
  %p_20.addr = alloca i32, align 4
  %p_21.addr = alloca i32, align 4
  %l_22 = alloca i32*, align 8
  store i64 %p_18, i64* %p_18.addr, align 8
  store i8 %p_19, i8* %p_19.addr, align 1
  store i32 %p_20, i32* %p_20.addr, align 4
  store i32 %p_21, i32* %p_21.addr, align 4
  store i32* @g_23, i32** %l_22, align 8
  %tmp = load i32* @g_14, align 4
  %tobool = icmp ne i32 %tmp, 0
  br i1 %tobool, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %entry
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %entry
  %0 = phi i1 [ true, %entry ], [ true, %lor.rhs ]
  %lor.ext = zext i1 %0 to i32
  %tmp1 = load i32** %l_22, align 8
  store i32 %lor.ext, i32* %tmp1
  %tmp2 = load i32* @g_14, align 4
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

define i32 @func_31(i8 zeroext %p_32) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %p_32.addr = alloca i8, align 1
  %l_33 = alloca [4 x [1 x i16]], align 2
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %i25 = alloca i32, align 4
  %j27 = alloca i32, align 4
  store i8 %p_32, i8* %p_32.addr, align 1
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc10, %entry
  %tmp = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp, 4
  br i1 %cmp, label %for.body, label %for.end13

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc, %for.body
  %tmp2 = load i32* %j, align 4
  %cmp3 = icmp slt i32 %tmp2, 1
  br i1 %cmp3, label %for.body4, label %for.end

for.body4:                                        ; preds = %for.cond1
  %tmp5 = load i32* %j, align 4
  %idxprom = sext i32 %tmp5 to i64
  %tmp6 = load i32* %i, align 4
  %idxprom7 = sext i32 %tmp6 to i64
  %arrayidx = getelementptr inbounds [4 x [1 x i16]]* %l_33, i32 0, i64 %idxprom7
  %arrayidx8 = getelementptr inbounds [1 x i16]* %arrayidx, i32 0, i64 %idxprom
  store i16 8965, i16* %arrayidx8, align 2
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
  store i8 1, i8* %p_32.addr, align 1
  br label %for.cond14

for.cond14:                                       ; preds = %for.inc50, %for.end13
  %tmp15 = load i8* %p_32.addr, align 1
  %conv = zext i8 %tmp15 to i32
  %cmp16 = icmp slt i32 %conv, 4
  br i1 %cmp16, label %for.body18, label %for.end55

for.body18:                                       ; preds = %for.cond14
  store i32 0, i32* @g_34, align 4
  br label %for.cond19

for.cond19:                                       ; preds = %for.inc46, %for.body18
  %tmp20 = load i32* @g_34, align 4
  %cmp21 = icmp slt i32 %tmp20, 1
  br i1 %cmp21, label %for.body23, label %for.end49

for.body23:                                       ; preds = %for.cond19
  store i32 1, i32* @g_35, align 4
  br label %for.cond28

for.cond28:                                       ; preds = %for.inc42, %for.body23
  %tmp29 = load i32* @g_35, align 4
  %cmp30 = icmp slt i32 %tmp29, 4
  br i1 %cmp30, label %for.body32, label %for.end45

for.body32:                                       ; preds = %for.cond28
  store i32 0, i32* @g_36, align 4
  br label %for.cond33

for.cond33:                                       ; preds = %for.inc39, %for.body32
  %tmp34 = load i32* @g_36, align 4
  %cmp35 = icmp slt i32 %tmp34, 1
  br i1 %cmp35, label %for.body37, label %for.end41

for.body37:                                       ; preds = %for.cond33
  %tmp38 = load i32* @g_14, align 4
  store i32 %tmp38, i32* %retval
  br label %return

for.inc39:                                        ; No predecessors!
  %tmp40 = load i32* @g_36, align 4
  %add = add nsw i32 %tmp40, 1
  store i32 %add, i32* @g_36, align 4
  br label %for.cond33

for.end41:                                        ; preds = %for.cond33
  br label %for.inc42

for.inc42:                                        ; preds = %for.end41
  %tmp43 = load i32* @g_35, align 4
  %add44 = add nsw i32 %tmp43, 4
  store i32 %add44, i32* @g_35, align 4
  br label %for.cond28

for.end45:                                        ; preds = %for.cond28
  br label %for.inc46

for.inc46:                                        ; preds = %for.end45
  %tmp47 = load i32* @g_34, align 4
  %add48 = add nsw i32 %tmp47, 1
  store i32 %add48, i32* @g_34, align 4
  br label %for.cond19

for.end49:                                        ; preds = %for.cond19
  br label %for.inc50

for.inc50:                                        ; preds = %for.end49
  %tmp51 = load i8* %p_32.addr, align 1
  %conv52 = zext i8 %tmp51 to i32
  %add53 = add nsw i32 %conv52, 3
  %conv54 = trunc i32 %add53 to i8
  store i8 %conv54, i8* %p_32.addr, align 1
  br label %for.cond14

for.end55:                                        ; preds = %for.cond14
  %arrayidx56 = getelementptr inbounds [4 x [1 x i16]]* %l_33, i32 0, i64 3
  %arrayidx57 = getelementptr inbounds [1 x i16]* %arrayidx56, i32 0, i64 0
  %tmp58 = load i16* %arrayidx57, align 2
  %conv59 = sext i16 %tmp58 to i32
  store i32 %conv59, i32* %retval
  br label %return

return:                                           ; preds = %for.end55, %for.body37
  %0 = load i32* %retval
  ret i32 %0
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

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  %call = call i32 @func_1()
  %tmp = volatile load i32* @g_2, align 4
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %tmp)
  %tmp2 = load i32* @g_14, align 4
  %call3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str1, i32 0, i32 0), i32 %tmp2)
  %tmp4 = load i32* @g_23, align 4
  %call5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str2, i32 0, i32 0), i32 %tmp4)
  %tmp6 = load i16* @g_28, align 2
  %conv = zext i16 %tmp6 to i32
  %call7 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str3, i32 0, i32 0), i32 %conv)
  %tmp8 = load i32* @g_34, align 4
  %call9 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str4, i32 0, i32 0), i32 %tmp8)
  %tmp10 = load i32* @g_35, align 4
  %call11 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str5, i32 0, i32 0), i32 %tmp10)
  %tmp12 = load i32* @g_36, align 4
  %call13 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str6, i32 0, i32 0), i32 %tmp12)
  %tmp14 = load i8* @g_41, align 1
  %conv15 = sext i8 %tmp14 to i32
  %call16 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str7, i32 0, i32 0), i32 %conv15)
  %0 = load i32* %retval
  ret i32 %0
}

declare i32 @printf(i8*, ...)
