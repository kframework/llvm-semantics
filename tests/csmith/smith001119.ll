; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith001119.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_7 = global i8 -93, align 1
@g_8 = global i8 0, align 1
@.str = private unnamed_addr constant [19 x i8] c"checksum g_7 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [19 x i8] c"checksum g_8 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %l_15 = alloca [4 x [5 x [1 x [1 x i16]]]], align 16
  %l_16 = alloca i8, align 1
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %l = alloca i32, align 4
  store i8 -94, i8* %l_16, align 1
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc32, %entry
  %tmp = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp, 4
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
  %arrayidx = getelementptr inbounds [4 x [5 x [1 x [1 x i16]]]]* %l_15, i32 0, i64 %idxprom19
  %arrayidx20 = getelementptr inbounds [5 x [1 x [1 x i16]]]* %arrayidx, i32 0, i64 %idxprom17
  %arrayidx21 = getelementptr inbounds [1 x [1 x i16]]* %arrayidx20, i32 0, i64 %idxprom15
  %arrayidx22 = getelementptr inbounds [1 x i16]* %arrayidx21, i32 0, i64 %idxprom
  store i16 22799, i16* %arrayidx22, align 2
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
  %tmp36 = volatile load i8* @g_7, align 1
  %conv = zext i8 %tmp36 to i16
  %tmp37 = load i8* @g_8, align 1
  %conv38 = sext i8 %tmp37 to i16
  %call = call zeroext i16 @safe_add_func_uint16_t_u_u(i16 zeroext %conv, i16 zeroext %conv38)
  %tmp39 = load i8* @g_8, align 1
  %conv40 = sext i8 %tmp39 to i16
  %tmp41 = load i8* @g_8, align 1
  %conv42 = sext i8 %tmp41 to i32
  %call43 = call zeroext i16 @safe_rshift_func_uint16_t_u_u(i16 zeroext %conv40, i32 %conv42)
  %conv44 = trunc i16 %call43 to i8
  %call45 = call i32 @func_11(i8 zeroext %conv44)
  %arrayidx46 = getelementptr inbounds [4 x [5 x [1 x [1 x i16]]]]* %l_15, i32 0, i64 2
  %arrayidx47 = getelementptr inbounds [5 x [1 x [1 x i16]]]* %arrayidx46, i32 0, i64 3
  %arrayidx48 = getelementptr inbounds [1 x [1 x i16]]* %arrayidx47, i32 0, i64 0
  %arrayidx49 = getelementptr inbounds [1 x i16]* %arrayidx48, i32 0, i64 0
  %tmp50 = load i16* %arrayidx49, align 2
  %conv51 = sext i16 %tmp50 to i32
  %tmp52 = load i8* @g_8, align 1
  %call53 = call i32 @func_11(i8 zeroext %tmp52)
  %cmp54 = icmp sgt i32 %conv51, %call53
  %conv55 = zext i1 %cmp54 to i32
  %cmp56 = icmp sgt i32 %call45, %conv55
  %conv57 = zext i1 %cmp56 to i32
  %conv58 = trunc i32 %conv57 to i16
  %arrayidx59 = getelementptr inbounds [4 x [5 x [1 x [1 x i16]]]]* %l_15, i32 0, i64 2
  %arrayidx60 = getelementptr inbounds [5 x [1 x [1 x i16]]]* %arrayidx59, i32 0, i64 3
  %arrayidx61 = getelementptr inbounds [1 x [1 x i16]]* %arrayidx60, i32 0, i64 0
  %arrayidx62 = getelementptr inbounds [1 x i16]* %arrayidx61, i32 0, i64 0
  %tmp63 = load i16* %arrayidx62, align 2
  %conv64 = sext i16 %tmp63 to i32
  %tmp65 = load i8* @g_8, align 1
  %conv66 = sext i8 %tmp65 to i32
  %cmp67 = icmp sge i32 %conv64, %conv66
  %conv68 = zext i1 %cmp67 to i32
  %tmp69 = load i8* @g_8, align 1
  %call70 = call i32 @func_11(i8 zeroext %tmp69)
  %xor = xor i32 %conv68, %call70
  %tmp71 = load i8* @g_8, align 1
  %conv72 = sext i8 %tmp71 to i32
  %cmp73 = icmp eq i32 %xor, %conv72
  %conv74 = zext i1 %cmp73 to i32
  %conv75 = trunc i32 %conv74 to i16
  %call76 = call signext i16 @safe_mod_func_int16_t_s_s(i16 signext %conv58, i16 signext %conv75)
  %call77 = call signext i16 @safe_mul_func_int16_t_s_s(i16 signext %call, i16 signext %call76)
  %call78 = call zeroext i16 @safe_unary_minus_func_uint16_t_u(i16 zeroext %call77)
  %tobool = icmp ne i16 %call78, 0
  br i1 %tobool, label %if.then, label %if.else

if.then:                                          ; preds = %for.end35
  %tmp79 = load i8* @g_8, align 1
  %conv80 = sext i8 %tmp79 to i32
  store i32 %conv80, i32* %retval
  br label %return

if.else:                                          ; preds = %for.end35
  %tmp81 = load i8* %l_16, align 1
  %conv82 = zext i8 %tmp81 to i32
  store i32 %conv82, i32* %retval
  br label %return

return:                                           ; preds = %if.else, %if.then
  %0 = load i32* %retval
  ret i32 %0
}

define internal zeroext i16 @safe_unary_minus_func_uint16_t_u(i16 zeroext %ui) nounwind uwtable {
entry:
  %ui.addr = alloca i16, align 2
  store i16 %ui, i16* %ui.addr, align 2
  %tmp = load i16* %ui.addr, align 2
  %conv = zext i16 %tmp to i32
  %sub = sub nsw i32 0, %conv
  %conv1 = trunc i32 %sub to i16
  ret i16 %conv1
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

define i32 @func_11(i8 zeroext %p_12) nounwind uwtable {
entry:
  %p_12.addr = alloca i8, align 1
  store i8 %p_12, i8* %p_12.addr, align 1
  %tmp = load i8* @g_8, align 1
  %conv = sext i8 %tmp to i32
  ret i32 %conv
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

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  %call = call i32 @func_1()
  %tmp = volatile load i8* @g_7, align 1
  %conv = zext i8 %tmp to i32
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %conv)
  %tmp2 = load i8* @g_8, align 1
  %conv3 = sext i8 %tmp2 to i32
  %call4 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str1, i32 0, i32 0), i32 %conv3)
  %0 = load i32* %retval
  ret i32 %0
}

declare i32 @printf(i8*, ...)
