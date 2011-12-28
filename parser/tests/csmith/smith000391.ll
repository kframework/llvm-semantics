; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith000391.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_9 = global i32 -2, align 4
@g_11 = global i32* @g_9, align 8
@g_10 = global i32** @g_11, align 8
@g_25 = global i32* @g_9, align 8
@.str = private unnamed_addr constant [19 x i8] c"checksum g_9 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i64 @func_1() nounwind uwtable {
entry:
  %l_13 = alloca i16, align 2
  %l_18 = alloca i8, align 1
  store i16 -8, i16* %l_13, align 2
  store i8 8, i8* %l_18, align 1
  %tmp = load i32** @g_11, align 8
  %tmp1 = load i32* %tmp
  %xor = xor i32 %tmp1, 65528
  %conv = sext i32 %xor to i64
  %cmp = icmp sgt i64 %conv, 2162176962
  br i1 %cmp, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %entry
  %tmp3 = volatile load i32*** @g_10, align 8
  %tmp4 = load i32** %tmp3
  %tmp5 = load i32* %tmp4
  %tobool = icmp ne i32 %tmp5, 0
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %entry
  %0 = phi i1 [ true, %entry ], [ %tobool, %lor.rhs ]
  %lor.ext = zext i1 %0 to i32
  %conv6 = trunc i32 %lor.ext to i16
  %tmp7 = load i8* %l_18, align 1
  %conv8 = sext i8 %tmp7 to i32
  %tmp9 = load i32** @g_11, align 8
  %tmp10 = load i32* %tmp9
  %cmp11 = icmp slt i32 %conv8, %tmp10
  %conv12 = zext i1 %cmp11 to i32
  %conv13 = trunc i32 %conv12 to i8
  %tmp14 = load i32** @g_11, align 8
  %tmp15 = load i32* %tmp14
  %call = call signext i8 @safe_lshift_func_int8_t_s_u(i8 signext %conv13, i32 %tmp15)
  %conv16 = sext i8 %call to i16
  %call17 = call signext i16 @safe_mul_func_int16_t_s_s(i16 signext %conv16, i16 signext 13594)
  %conv18 = sext i16 %call17 to i32
  %call19 = call i32 @func_4(i32 65528, i16 zeroext %conv6, i32 %conv18)
  %tmp20 = load i32* @g_9, align 4
  %conv21 = trunc i32 %tmp20 to i16
  %call22 = call zeroext i16 @safe_add_func_uint16_t_u_u(i16 zeroext %conv21, i16 zeroext 0)
  %conv23 = zext i16 %call22 to i32
  %call24 = call i32 @safe_sub_func_int32_t_s_s(i32 %call19, i32 %conv23)
  %tmp25 = load i8* %l_18, align 1
  %conv26 = sext i8 %tmp25 to i32
  %tmp27 = load i8* %l_18, align 1
  %conv28 = sext i8 %tmp27 to i32
  %and = and i32 65528, %conv28
  %and29 = and i32 %conv26, %and
  %tobool30 = icmp ne i32 %and29, 0
  br i1 %tobool30, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %lor.end
  %tmp31 = load i8* %l_18, align 1
  %tobool32 = icmp ne i8 %tmp31, 0
  %lnot = xor i1 %tobool32, true
  %lnot.ext = zext i1 %lnot to i32
  %call33 = call signext i16 @safe_rshift_func_int16_t_s_s(i16 signext -8, i32 %lnot.ext)
  %conv34 = sext i16 %call33 to i32
  %tobool35 = icmp ne i32 %conv34, 0
  br label %land.end

land.end:                                         ; preds = %land.rhs, %lor.end
  %1 = phi i1 [ false, %lor.end ], [ %tobool35, %land.rhs ]
  %land.ext = zext i1 %1 to i32
  %tmp36 = load i32* @g_9, align 4
  %cmp37 = icmp sge i32 %land.ext, %tmp36
  %conv38 = zext i1 %cmp37 to i32
  %conv39 = trunc i32 %conv38 to i16
  %call40 = call zeroext i16 @safe_div_func_uint16_t_u_u(i16 zeroext %conv39, i16 zeroext 3627)
  %conv41 = zext i16 %call40 to i32
  %cmp42 = icmp eq i32 %call24, %conv41
  %conv43 = zext i1 %cmp42 to i32
  %tmp44 = volatile load i32** @g_25, align 8
  store i32 %conv43, i32* %tmp44
  ret i64 65528
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

define i32 @func_4(i32 %p_5, i16 zeroext %p_6, i32 %p_7) nounwind uwtable {
entry:
  %p_5.addr = alloca i32, align 4
  %p_6.addr = alloca i16, align 2
  %p_7.addr = alloca i32, align 4
  %l_8 = alloca [5 x i32*], align 16
  %l_12 = alloca i8, align 1
  %i = alloca i32, align 4
  store i32 %p_5, i32* %p_5.addr, align 4
  store i16 %p_6, i16* %p_6.addr, align 2
  store i32 %p_7, i32* %p_7.addr, align 4
  store i8 0, i8* %l_12, align 1
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp, 5
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp1 = load i32* %i, align 4
  %idxprom = sext i32 %tmp1 to i64
  %arrayidx = getelementptr inbounds [5 x i32*]* %l_8, i32 0, i64 %idxprom
  store i32* @g_9, i32** %arrayidx, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %tmp2 = load i32* %i, align 4
  %inc = add nsw i32 %tmp2, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %arrayidx3 = getelementptr inbounds [5 x i32*]* %l_8, i32 0, i64 1
  %tmp4 = load i32** %arrayidx3, align 8
  %tmp5 = volatile load i32*** @g_10, align 8
  store i32* %tmp4, i32** %tmp5
  %tmp6 = load i8* %l_12, align 1
  %conv = sext i8 %tmp6 to i32
  ret i32 %conv
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

define internal signext i16 @safe_rshift_func_int16_t_s_s(i16 signext %left, i32 %right) nounwind uwtable {
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
  %cmp3 = icmp slt i32 %tmp2, 0
  br i1 %cmp3, label %cond.true, label %lor.lhs.false5

lor.lhs.false5:                                   ; preds = %lor.lhs.false
  %tmp6 = load i32* %right.addr, align 4
  %cmp7 = icmp sge i32 %tmp6, 32
  br i1 %cmp7, label %cond.true, label %cond.false

cond.true:                                        ; preds = %lor.lhs.false5, %lor.lhs.false, %entry
  %tmp9 = load i16* %left.addr, align 2
  %conv10 = sext i16 %tmp9 to i32
  br label %cond.end

cond.false:                                       ; preds = %lor.lhs.false5
  %tmp11 = load i16* %left.addr, align 2
  %conv12 = sext i16 %tmp11 to i32
  %tmp13 = load i32* %right.addr, align 4
  %shr = ashr i32 %conv12, %tmp13
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %conv10, %cond.true ], [ %shr, %cond.false ]
  %conv14 = trunc i32 %cond to i16
  ret i16 %conv14
}

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  %call = call i64 @func_1()
  %tmp = load i32* @g_9, align 4
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %tmp)
  %0 = load i32* %retval
  ret i32 %0
}

declare i32 @printf(i8*, ...)
