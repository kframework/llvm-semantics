; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith000823.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_5 = global i32 -1, align 4
@g_18 = global i32 9, align 4
@g_17 = global i32* @g_18, align 8
@g_19 = global i32* @g_18, align 8
@.str = private unnamed_addr constant [19 x i8] c"checksum g_5 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [20 x i8] c"checksum g_18 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define signext i16 @func_1() nounwind uwtable {
entry:
  %l_4 = alloca i32, align 4
  %l_16 = alloca [6 x i8], align 1
  %i = alloca i32, align 4
  store i32 0, i32* %l_4, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp, 6
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp1 = load i32* %i, align 4
  %idxprom = sext i32 %tmp1 to i64
  %arrayidx = getelementptr inbounds [6 x i8]* %l_16, i32 0, i64 %idxprom
  store i8 -39, i8* %arrayidx, align 1
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %tmp2 = load i32* %i, align 4
  %inc = add nsw i32 %tmp2, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %tmp3 = load i32* %l_4, align 4
  %conv = sext i32 %tmp3 to i64
  %cmp4 = icmp sle i64 2287759131, %conv
  %conv5 = zext i1 %cmp4 to i32
  %conv6 = trunc i32 %conv5 to i16
  %tmp7 = volatile load i32* @g_5, align 4
  %tmp8 = load i32* %l_4, align 4
  %tmp9 = load i32* %l_4, align 4
  %or = or i32 %tmp8, %tmp9
  %conv10 = sext i32 %or to i64
  %cmp11 = icmp slt i64 %conv10, -1
  br i1 %cmp11, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %for.end
  %arrayidx13 = getelementptr inbounds [6 x i8]* %l_16, i32 0, i64 0
  %tmp14 = load i8* %arrayidx13, align 1
  %call = call i32 @func_6(i8 zeroext %tmp14)
  %tobool = icmp ne i32 %call, 0
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %for.end
  %0 = phi i1 [ true, %for.end ], [ %tobool, %lor.rhs ]
  %lor.ext = zext i1 %0 to i32
  %and = and i32 %tmp7, %lor.ext
  %conv15 = trunc i32 %and to i16
  %call16 = call signext i16 @safe_sub_func_int16_t_s_s(i16 signext %conv6, i16 signext %conv15)
  %conv17 = sext i16 %call16 to i32
  %arrayidx18 = getelementptr inbounds [6 x i8]* %l_16, i32 0, i64 0
  %tmp19 = load i8* %arrayidx18, align 1
  %conv20 = sext i8 %tmp19 to i32
  %xor = xor i32 %conv17, %conv20
  %tmp21 = volatile load i32** @g_17, align 8
  store i32 %xor, i32* %tmp21
  %tmp22 = volatile load i32** @g_17, align 8
  %tmp23 = load i32* %tmp22
  %tmp24 = volatile load i32** @g_17, align 8
  store i32 %tmp23, i32* %tmp24
  %arrayidx25 = getelementptr inbounds [6 x i8]* %l_16, i32 0, i64 1
  %tmp26 = load i8* %arrayidx25, align 1
  %conv27 = sext i8 %tmp26 to i32
  %tmp28 = volatile load i32** @g_19, align 8
  store i32 %conv27, i32* %tmp28
  %tmp29 = volatile load i32* @g_5, align 4
  %conv30 = trunc i32 %tmp29 to i16
  ret i16 %conv30
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

define i32 @func_6(i8 zeroext %p_7) nounwind uwtable {
entry:
  %p_7.addr = alloca i8, align 1
  %l_14 = alloca i16, align 2
  %l_15 = alloca i32, align 4
  store i8 %p_7, i8* %p_7.addr, align 1
  store i16 1, i16* %l_14, align 2
  store i32 -1, i32* %l_15, align 4
  %tmp = load i8* %p_7.addr, align 1
  %conv = zext i8 %tmp to i64
  %cmp = icmp slt i64 %conv, 3655192313
  %conv1 = zext i1 %cmp to i32
  %conv2 = sext i32 %conv1 to i64
  %call = call signext i8 @safe_mul_func_int8_t_s_s(i8 signext 1, i8 signext -1)
  %conv3 = sext i8 %call to i64
  %call4 = call i64 @safe_div_func_int64_t_s_s(i64 %conv2, i64 %conv3)
  %conv5 = trunc i64 %call4 to i32
  %call6 = call i32 @safe_sub_func_int32_t_s_s(i32 -5, i32 %conv5)
  %tmp7 = load i16* %l_14, align 2
  %conv8 = sext i16 %tmp7 to i32
  %cmp9 = icmp sle i32 %call6, %conv8
  %conv10 = zext i1 %cmp9 to i32
  store i32 %conv10, i32* %l_15, align 4
  %tmp11 = load i16* %l_14, align 2
  %conv12 = sext i16 %tmp11 to i32
  ret i32 %conv12
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

define internal i64 @safe_div_func_int64_t_s_s(i64 %si1, i64 %si2) nounwind uwtable {
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
  %div = sdiv i64 %tmp6, %tmp7
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i64 [ %tmp5, %cond.true ], [ %div, %cond.false ]
  ret i64 %cond
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

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  %call = call signext i16 @func_1()
  %tmp = volatile load i32* @g_5, align 4
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %tmp)
  %tmp2 = load i32* @g_18, align 4
  %call3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str1, i32 0, i32 0), i32 %tmp2)
  %0 = load i32* %retval
  ret i32 %0
}

declare i32 @printf(i8*, ...)
