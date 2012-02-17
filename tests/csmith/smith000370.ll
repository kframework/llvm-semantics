; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith000370.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_8 = global i32 -2, align 4
@.str = private unnamed_addr constant [19 x i8] c"checksum g_8 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable {
entry:
  %l_16 = alloca [3 x [6 x i16]], align 16
  %l_23 = alloca i32*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32* @g_8, i32** %l_23, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc10, %entry
  %tmp = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp, 3
  br i1 %cmp, label %for.body, label %for.end13

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc, %for.body
  %tmp2 = load i32* %j, align 4
  %cmp3 = icmp slt i32 %tmp2, 6
  br i1 %cmp3, label %for.body4, label %for.end

for.body4:                                        ; preds = %for.cond1
  %tmp5 = load i32* %j, align 4
  %idxprom = sext i32 %tmp5 to i64
  %tmp6 = load i32* %i, align 4
  %idxprom7 = sext i32 %tmp6 to i64
  %arrayidx = getelementptr inbounds [3 x [6 x i16]]* %l_16, i32 0, i64 %idxprom7
  %arrayidx8 = getelementptr inbounds [6 x i16]* %arrayidx, i32 0, i64 %idxprom
  store i16 22506, i16* %arrayidx8, align 2
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
  %tmp14 = load i32* @g_8, align 4
  %tobool = icmp ne i32 %tmp14, 0
  br i1 %tobool, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %for.end13
  %tmp15 = load i32* @g_8, align 4
  %tobool16 = icmp ne i32 %tmp15, 0
  br label %land.end

land.end:                                         ; preds = %land.rhs, %for.end13
  %0 = phi i1 [ false, %for.end13 ], [ %tobool16, %land.rhs ]
  %land.ext = zext i1 %0 to i32
  %conv = trunc i32 %land.ext to i16
  %tmp17 = load i32* @g_8, align 4
  %conv18 = trunc i32 %tmp17 to i16
  %arrayidx19 = getelementptr inbounds [3 x [6 x i16]]* %l_16, i32 0, i64 0
  %arrayidx20 = getelementptr inbounds [6 x i16]* %arrayidx19, i32 0, i64 1
  %tmp21 = load i16* %arrayidx20, align 2
  %arrayidx22 = getelementptr inbounds [3 x [6 x i16]]* %l_16, i32 0, i64 0
  %arrayidx23 = getelementptr inbounds [6 x i16]* %arrayidx22, i32 0, i64 1
  %tmp24 = load i16* %arrayidx23, align 2
  %call = call signext i16 @safe_sub_func_int16_t_s_s(i16 signext %tmp21, i16 signext %tmp24)
  %conv25 = sext i16 %call to i32
  %arrayidx26 = getelementptr inbounds [3 x [6 x i16]]* %l_16, i32 0, i64 2
  %arrayidx27 = getelementptr inbounds [6 x i16]* %arrayidx26, i32 0, i64 3
  %tmp28 = load i16* %arrayidx27, align 2
  %conv29 = trunc i16 %tmp28 to i8
  %call30 = call signext i8 @safe_rshift_func_int8_t_s_s(i8 signext %conv29, i32 -1178413535)
  %conv31 = sext i8 %call30 to i32
  %cmp32 = icmp sge i32 %conv25, %conv31
  br i1 %cmp32, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %land.end
  %tmp34 = load i32* @g_8, align 4
  %conv35 = trunc i32 %tmp34 to i8
  %call36 = call signext i8 @safe_lshift_func_int8_t_s_u(i8 signext %conv35, i32 2)
  %conv37 = sext i8 %call36 to i16
  %tmp38 = load i32** %l_23, align 8
  %tmp39 = load i32** %l_23, align 8
  %cmp40 = icmp eq i32* %tmp38, %tmp39
  %conv41 = zext i1 %cmp40 to i32
  %conv42 = trunc i32 %conv41 to i16
  %call43 = call signext i16 @safe_add_func_int16_t_s_s(i16 signext %conv37, i16 signext %conv42)
  %conv44 = sext i16 %call43 to i32
  %tobool45 = icmp ne i32 %conv44, 0
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %land.end
  %1 = phi i1 [ true, %land.end ], [ %tobool45, %lor.rhs ]
  %lor.ext = zext i1 %1 to i32
  %call46 = call zeroext i16 @safe_lshift_func_uint16_t_u_s(i16 zeroext 0, i32 %lor.ext)
  %conv47 = trunc i16 %call46 to i8
  %tmp48 = load i32* @g_8, align 4
  %tobool49 = icmp ne i32 %tmp48, 0
  br i1 %tobool49, label %land.rhs50, label %land.end54

land.rhs50:                                       ; preds = %lor.end
  %tmp51 = load i32** %l_23, align 8
  %tmp52 = load i32* %tmp51
  %tobool53 = icmp ne i32 %tmp52, 0
  br label %land.end54

land.end54:                                       ; preds = %land.rhs50, %lor.end
  %2 = phi i1 [ false, %lor.end ], [ %tobool53, %land.rhs50 ]
  %land.ext55 = zext i1 %2 to i32
  %conv56 = trunc i32 %land.ext55 to i8
  %tmp57 = load i32** %l_23, align 8
  %tmp58 = load i32* %tmp57
  %conv59 = trunc i32 %tmp58 to i8
  %call60 = call zeroext i8 @safe_sub_func_uint8_t_u_u(i8 zeroext %conv56, i8 zeroext %conv59)
  %conv61 = zext i8 %call60 to i64
  %call62 = call i64 @safe_mod_func_uint64_t_u_u(i64 %conv61, i64 0)
  %conv63 = trunc i64 %call62 to i32
  %call64 = call signext i8 @safe_lshift_func_int8_t_s_s(i8 signext %conv47, i32 %conv63)
  %conv65 = sext i8 %call64 to i16
  %call66 = call i32 @func_2(i32 -1, i16 zeroext %conv, i16 zeroext %conv18, i16 zeroext %conv65)
  %tmp67 = load i32** %l_23, align 8
  store i32 %call66, i32* %tmp67
  %tmp68 = load i32* @g_8, align 4
  ret i32 %tmp68
}

define i32 @func_2(i32 %p_3, i16 zeroext %p_4, i16 zeroext %p_5, i16 zeroext %p_6) nounwind uwtable {
entry:
  %p_3.addr = alloca i32, align 4
  %p_4.addr = alloca i16, align 2
  %p_5.addr = alloca i16, align 2
  %p_6.addr = alloca i16, align 2
  %l_7 = alloca i32*, align 8
  %l_9 = alloca [4 x i32], align 16
  %i = alloca i32, align 4
  store i32 %p_3, i32* %p_3.addr, align 4
  store i16 %p_4, i16* %p_4.addr, align 2
  store i16 %p_5, i16* %p_5.addr, align 2
  store i16 %p_6, i16* %p_6.addr, align 2
  store i32* @g_8, i32** %l_7, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp, 4
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp1 = load i32* %i, align 4
  %idxprom = sext i32 %tmp1 to i64
  %arrayidx = getelementptr inbounds [4 x i32]* %l_9, i32 0, i64 %idxprom
  store i32 1726319874, i32* %arrayidx, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %tmp2 = load i32* %i, align 4
  %inc = add nsw i32 %tmp2, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %tmp3 = load i32* %p_3.addr, align 4
  %tmp4 = load i32** %l_7, align 8
  store i32 %tmp3, i32* %tmp4
  %tmp5 = load i32** %l_7, align 8
  store i32 0, i32* %tmp5
  %arrayidx6 = getelementptr inbounds [4 x i32]* %l_9, i32 0, i64 2
  %tmp7 = load i32* %arrayidx6, align 4
  ret i32 %tmp7
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

define internal signext i8 @safe_lshift_func_int8_t_s_u(i8 signext %left, i32 %right) nounwind uwtable {
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
  br i1 %cmp3, label %cond.true, label %lor.lhs.false5

lor.lhs.false5:                                   ; preds = %lor.lhs.false
  %tmp6 = load i8* %left.addr, align 1
  %conv7 = sext i8 %tmp6 to i32
  %tmp8 = load i32* %right.addr, align 4
  %shr = ashr i32 127, %tmp8
  %cmp9 = icmp sgt i32 %conv7, %shr
  br i1 %cmp9, label %cond.true, label %cond.false

cond.true:                                        ; preds = %lor.lhs.false5, %lor.lhs.false, %entry
  %tmp11 = load i8* %left.addr, align 1
  %conv12 = sext i8 %tmp11 to i32
  br label %cond.end

cond.false:                                       ; preds = %lor.lhs.false5
  %tmp13 = load i8* %left.addr, align 1
  %conv14 = sext i8 %tmp13 to i32
  %tmp15 = load i32* %right.addr, align 4
  %shl = shl i32 %conv14, %tmp15
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %conv12, %cond.true ], [ %shl, %cond.false ]
  %conv16 = trunc i32 %cond to i8
  ret i8 %conv16
}

define internal i64 @safe_mod_func_uint64_t_u_u(i64 %ui1, i64 %ui2) nounwind uwtable {
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
  %rem = urem i64 %tmp2, %tmp3
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i64 [ %tmp1, %cond.true ], [ %rem, %cond.false ]
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
  %tmp = load i32* @g_8, align 4
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %tmp)
  %0 = load i32* %retval
  ret i32 %0
}

declare i32 @printf(i8*, ...)
