; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith000321.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_8 = global i16 10378, align 2
@g_10 = global i32 1, align 4
@g_9 = global i32* @g_10, align 8
@g_32 = global i32* @g_10, align 8
@g_39 = global i32* @g_10, align 8
@g_38 = global i32** @g_39, align 8
@.str = private unnamed_addr constant [19 x i8] c"checksum g_8 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [20 x i8] c"checksum g_10 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable {
entry:
  %l_23 = alloca i32*, align 8
  %l_24 = alloca i32**, align 8
  %l_37 = alloca i8, align 1
  %l_22 = alloca [5 x i32*], align 16
  %l_21 = alloca [8 x [2 x [1 x [4 x i32**]]]], align 16
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %l = alloca i32, align 4
  store i32* @g_10, i32** %l_23, align 8
  store i32** null, i32*** %l_24, align 8
  store i8 1, i8* %l_37, align 1
  %tmp = load i16* @g_8, align 2
  %tmp1 = load i16* @g_8, align 2
  %call = call zeroext i16 @safe_div_func_uint16_t_u_u(i16 zeroext %tmp, i16 zeroext %tmp1)
  %conv = trunc i16 %call to i8
  %tmp2 = load i16* @g_8, align 2
  %conv3 = trunc i16 %tmp2 to i8
  %call4 = call zeroext i8 @safe_div_func_uint8_t_u_u(i8 zeroext %conv, i8 zeroext %conv3)
  %call5 = call signext i8 @safe_add_func_int8_t_s_s(i8 signext %call4, i8 signext 54)
  %tobool = icmp ne i8 %call5, 0
  br i1 %tobool, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  br label %lbl_11

lbl_11:                                           ; preds = %if.then71, %if.then
  %tmp6 = load i16* @g_8, align 2
  %conv7 = sext i16 %tmp6 to i32
  %tmp8 = volatile load i32** @g_9, align 8
  %tmp9 = load i32* %tmp8
  %xor = xor i32 %tmp9, %conv7
  store i32 %xor, i32* %tmp8
  br label %if.end78

if.else:                                          ; preds = %entry
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.else
  %tmp16 = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp16, 5
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp18 = load i32* %i, align 4
  %idxprom = sext i32 %tmp18 to i64
  %arrayidx = getelementptr inbounds [5 x i32*]* %l_22, i32 0, i64 %idxprom
  store i32* null, i32** %arrayidx, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %tmp19 = load i32* %i, align 4
  %inc = add nsw i32 %tmp19, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %i, align 4
  br label %for.cond20

for.cond20:                                       ; preds = %for.inc65, %for.end
  %tmp21 = load i32* %i, align 4
  %cmp22 = icmp slt i32 %tmp21, 8
  br i1 %cmp22, label %for.body24, label %for.end68

for.body24:                                       ; preds = %for.cond20
  store i32 0, i32* %j, align 4
  br label %for.cond25

for.cond25:                                       ; preds = %for.inc61, %for.body24
  %tmp26 = load i32* %j, align 4
  %cmp27 = icmp slt i32 %tmp26, 2
  br i1 %cmp27, label %for.body29, label %for.end64

for.body29:                                       ; preds = %for.cond25
  store i32 0, i32* %k, align 4
  br label %for.cond30

for.cond30:                                       ; preds = %for.inc57, %for.body29
  %tmp31 = load i32* %k, align 4
  %cmp32 = icmp slt i32 %tmp31, 1
  br i1 %cmp32, label %for.body34, label %for.end60

for.body34:                                       ; preds = %for.cond30
  store i32 0, i32* %l, align 4
  br label %for.cond35

for.cond35:                                       ; preds = %for.inc53, %for.body34
  %tmp36 = load i32* %l, align 4
  %cmp37 = icmp slt i32 %tmp36, 4
  br i1 %cmp37, label %for.body39, label %for.end56

for.body39:                                       ; preds = %for.cond35
  %arrayidx40 = getelementptr inbounds [5 x i32*]* %l_22, i32 0, i64 0
  %tmp41 = load i32* %l, align 4
  %idxprom42 = sext i32 %tmp41 to i64
  %tmp43 = load i32* %k, align 4
  %idxprom44 = sext i32 %tmp43 to i64
  %tmp45 = load i32* %j, align 4
  %idxprom46 = sext i32 %tmp45 to i64
  %tmp47 = load i32* %i, align 4
  %idxprom48 = sext i32 %tmp47 to i64
  %arrayidx49 = getelementptr inbounds [8 x [2 x [1 x [4 x i32**]]]]* %l_21, i32 0, i64 %idxprom48
  %arrayidx50 = getelementptr inbounds [2 x [1 x [4 x i32**]]]* %arrayidx49, i32 0, i64 %idxprom46
  %arrayidx51 = getelementptr inbounds [1 x [4 x i32**]]* %arrayidx50, i32 0, i64 %idxprom44
  %arrayidx52 = getelementptr inbounds [4 x i32**]* %arrayidx51, i32 0, i64 %idxprom42
  store i32** %arrayidx40, i32*** %arrayidx52, align 8
  br label %for.inc53

for.inc53:                                        ; preds = %for.body39
  %tmp54 = load i32* %l, align 4
  %inc55 = add nsw i32 %tmp54, 1
  store i32 %inc55, i32* %l, align 4
  br label %for.cond35

for.end56:                                        ; preds = %for.cond35
  br label %for.inc57

for.inc57:                                        ; preds = %for.end56
  %tmp58 = load i32* %k, align 4
  %inc59 = add nsw i32 %tmp58, 1
  store i32 %inc59, i32* %k, align 4
  br label %for.cond30

for.end60:                                        ; preds = %for.cond30
  br label %for.inc61

for.inc61:                                        ; preds = %for.end60
  %tmp62 = load i32* %j, align 4
  %inc63 = add nsw i32 %tmp62, 1
  store i32 %inc63, i32* %j, align 4
  br label %for.cond25

for.end64:                                        ; preds = %for.cond25
  br label %for.inc65

for.inc65:                                        ; preds = %for.end64
  %tmp66 = load i32* %i, align 4
  %inc67 = add nsw i32 %tmp66, 1
  store i32 %inc67, i32* %i, align 4
  br label %for.cond20

for.end68:                                        ; preds = %for.cond20
  %tmp69 = load i16* @g_8, align 2
  %tobool70 = icmp ne i16 %tmp69, 0
  br i1 %tobool70, label %if.then71, label %if.end

if.then71:                                        ; preds = %for.end68
  br label %lbl_11

if.end:                                           ; preds = %for.end68
  %tmp72 = load i32* @g_10, align 4
  %call73 = call i32* @func_12(i32 %tmp72)
  store i32* %call73, i32** %l_23, align 8
  %tmp74 = load i16* @g_8, align 2
  %tobool75 = icmp ne i16 %tmp74, 0
  br i1 %tobool75, label %if.then76, label %if.end77

if.then76:                                        ; preds = %if.end
  br label %lbl_40

if.end77:                                         ; preds = %if.end
  br label %if.end78

if.end78:                                         ; preds = %if.end77, %lbl_11
  %tmp79 = load i32** %l_23, align 8
  volatile store i32* %tmp79, i32** @g_9, align 8
  br label %lbl_40

lbl_40:                                           ; preds = %if.end78, %if.then76
  %tmp80 = load i16* @g_8, align 2
  %conv81 = sext i16 %tmp80 to i32
  %tmp82 = volatile load i32** @g_32, align 8
  %tmp83 = load i32* %tmp82
  %conv84 = sext i32 %tmp83 to i64
  %call85 = call i64 @safe_add_func_uint64_t_u_u(i64 -1, i64 %conv84)
  %call86 = call i64 @safe_sub_func_uint64_t_u_u(i64 %call85, i64 2248917564)
  %conv87 = trunc i64 %call86 to i8
  %tmp88 = load i8* %l_37, align 1
  %tmp89 = load i32*** @g_38, align 8
  %tmp90 = load i32* @g_10, align 4
  %conv91 = trunc i32 %tmp90 to i16
  %call92 = call i32 @func_25(i32 -520480113, i8 zeroext %conv87, i8 zeroext %tmp88, i32** %tmp89, i16 zeroext %conv91)
  %cmp93 = icmp slt i32 %conv81, %call92
  %conv94 = zext i1 %cmp93 to i32
  %tmp95 = load i32*** @g_38, align 8
  %tmp96 = load i32** %tmp95
  store i32 %conv94, i32* %tmp96
  %tmp97 = load i32** @g_39, align 8
  %tmp98 = load i32* %tmp97
  %tmp99 = load i32** @g_39, align 8
  store i32 %tmp98, i32* %tmp99
  %tmp100 = load i16* @g_8, align 2
  %conv101 = sext i16 %tmp100 to i32
  ret i32 %conv101
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

define i32* @func_12(i32 %p_13) nounwind uwtable {
entry:
  %p_13.addr = alloca i32, align 4
  %l_18 = alloca i32, align 4
  %l_19 = alloca i64, align 8
  %l_20 = alloca i32*, align 8
  store i32 %p_13, i32* %p_13.addr, align 4
  store i32 5, i32* %l_18, align 4
  store i64 -6476243495245046361, i64* %l_19, align 8
  store i32* %l_18, i32** %l_20, align 8
  %tmp = volatile load i32** @g_9, align 8
  %tmp1 = load i32* %tmp
  %conv = trunc i32 %tmp1 to i16
  %tmp2 = load i16* @g_8, align 2
  %conv3 = sext i16 %tmp2 to i32
  %tobool = icmp ne i32 %conv3, 0
  br i1 %tobool, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %entry
  %tmp4 = load i32* %l_18, align 4
  %tobool5 = icmp ne i32 %tmp4, 0
  br i1 %tobool5, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %land.rhs
  %tmp6 = load i64* %l_19, align 8
  %tobool7 = icmp ne i64 %tmp6, 0
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %land.rhs
  %0 = phi i1 [ true, %land.rhs ], [ %tobool7, %lor.rhs ]
  %lor.ext = zext i1 %0 to i32
  %conv8 = trunc i32 %lor.ext to i16
  %call = call zeroext i16 @safe_mul_func_uint16_t_u_u(i16 zeroext %conv8, i16 zeroext 0)
  %conv9 = zext i16 %call to i32
  %tobool10 = icmp ne i32 %conv9, 0
  br label %land.end

land.end:                                         ; preds = %lor.end, %entry
  %1 = phi i1 [ false, %entry ], [ %tobool10, %lor.end ]
  %land.ext = zext i1 %1 to i32
  %call11 = call zeroext i16 @safe_lshift_func_uint16_t_u_s(i16 zeroext %conv, i32 %land.ext)
  %conv12 = zext i16 %call11 to i32
  %tmp13 = load i32** %l_20, align 8
  store i32 %conv12, i32* %tmp13
  ret i32* %l_18
}

define i32 @func_25(i32 %p_26, i8 zeroext %p_27, i8 zeroext %p_28, i32** %p_29, i16 zeroext %p_30) nounwind uwtable {
entry:
  %p_26.addr = alloca i32, align 4
  %p_27.addr = alloca i8, align 1
  %p_28.addr = alloca i8, align 1
  %p_29.addr = alloca i32**, align 8
  %p_30.addr = alloca i16, align 2
  %l_31 = alloca [7 x [5 x [1 x [1 x i32]]]], align 16
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %l = alloca i32, align 4
  store i32 %p_26, i32* %p_26.addr, align 4
  store i8 %p_27, i8* %p_27.addr, align 1
  store i8 %p_28, i8* %p_28.addr, align 1
  store i32** %p_29, i32*** %p_29.addr, align 8
  store i16 %p_30, i16* %p_30.addr, align 2
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc32, %entry
  %tmp = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp, 7
  br i1 %cmp, label %for.body, label %for.end35

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc28, %for.body
  %tmp2 = load i32* %j, align 4
  %cmp3 = icmp slt i32 %tmp2, 5
  br i1 %cmp3, label %for.body4, label %for.end31

for.body4:                                        ; preds = %for.cond1
  store i32 0, i32* %k, align 4
  br label %for.cond5

for.cond5:                                        ; preds = %for.inc24, %for.body4
  %tmp6 = load i32* %k, align 4
  %cmp7 = icmp slt i32 %tmp6, 1
  br i1 %cmp7, label %for.body8, label %for.end27

for.body8:                                        ; preds = %for.cond5
  store i32 0, i32* %l, align 4
  br label %for.cond9

for.cond9:                                        ; preds = %for.inc, %for.body8
  %tmp10 = load i32* %l, align 4
  %cmp11 = icmp slt i32 %tmp10, 1
  br i1 %cmp11, label %for.body12, label %for.end

for.body12:                                       ; preds = %for.cond9
  %tmp13 = load i32* %l, align 4
  %idxprom = sext i32 %tmp13 to i64
  %tmp14 = load i32* %k, align 4
  %idxprom15 = sext i32 %tmp14 to i64
  %tmp16 = load i32* %j, align 4
  %idxprom17 = sext i32 %tmp16 to i64
  %tmp18 = load i32* %i, align 4
  %idxprom19 = sext i32 %tmp18 to i64
  %arrayidx = getelementptr inbounds [7 x [5 x [1 x [1 x i32]]]]* %l_31, i32 0, i64 %idxprom19
  %arrayidx20 = getelementptr inbounds [5 x [1 x [1 x i32]]]* %arrayidx, i32 0, i64 %idxprom17
  %arrayidx21 = getelementptr inbounds [1 x [1 x i32]]* %arrayidx20, i32 0, i64 %idxprom15
  %arrayidx22 = getelementptr inbounds [1 x i32]* %arrayidx21, i32 0, i64 %idxprom
  store i32 -296295653, i32* %arrayidx22, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body12
  %tmp23 = load i32* %l, align 4
  %inc = add nsw i32 %tmp23, 1
  store i32 %inc, i32* %l, align 4
  br label %for.cond9

for.end:                                          ; preds = %for.cond9
  br label %for.inc24

for.inc24:                                        ; preds = %for.end
  %tmp25 = load i32* %k, align 4
  %inc26 = add nsw i32 %tmp25, 1
  store i32 %inc26, i32* %k, align 4
  br label %for.cond5

for.end27:                                        ; preds = %for.cond5
  br label %for.inc28

for.inc28:                                        ; preds = %for.end27
  %tmp29 = load i32* %j, align 4
  %inc30 = add nsw i32 %tmp29, 1
  store i32 %inc30, i32* %j, align 4
  br label %for.cond1

for.end31:                                        ; preds = %for.cond1
  br label %for.inc32

for.inc32:                                        ; preds = %for.end31
  %tmp33 = load i32* %i, align 4
  %inc34 = add nsw i32 %tmp33, 1
  store i32 %inc34, i32* %i, align 4
  br label %for.cond

for.end35:                                        ; preds = %for.cond
  %arrayidx36 = getelementptr inbounds [7 x [5 x [1 x [1 x i32]]]]* %l_31, i32 0, i64 0
  %arrayidx37 = getelementptr inbounds [5 x [1 x [1 x i32]]]* %arrayidx36, i32 0, i64 2
  %arrayidx38 = getelementptr inbounds [1 x [1 x i32]]* %arrayidx37, i32 0, i64 0
  %arrayidx39 = getelementptr inbounds [1 x i32]* %arrayidx38, i32 0, i64 0
  %tmp40 = load i32* %arrayidx39, align 4
  %tmp41 = volatile load i32** @g_32, align 8
  %tmp42 = load i32* %tmp41
  %xor = xor i32 %tmp42, %tmp40
  store i32 %xor, i32* %tmp41
  %tmp43 = volatile load i32** @g_32, align 8
  %tmp44 = load i32* %tmp43
  ret i32 %tmp44
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

define internal i64 @safe_add_func_uint64_t_u_u(i64 %ui1, i64 %ui2) nounwind uwtable {
entry:
  %ui1.addr = alloca i64, align 8
  %ui2.addr = alloca i64, align 8
  store i64 %ui1, i64* %ui1.addr, align 8
  store i64 %ui2, i64* %ui2.addr, align 8
  %tmp = load i64* %ui1.addr, align 8
  %tmp1 = load i64* %ui2.addr, align 8
  %add = add i64 %tmp, %tmp1
  ret i64 %add
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

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  %call = call i32 @func_1()
  %tmp = load i16* @g_8, align 2
  %conv = sext i16 %tmp to i32
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %conv)
  %tmp2 = load i32* @g_10, align 4
  %call3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str1, i32 0, i32 0), i32 %tmp2)
  %0 = load i32* %retval
  ret i32 %0
}

declare i32 @printf(i8*, ...)
