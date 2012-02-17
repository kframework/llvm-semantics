; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith000075.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_10 = global i32 5, align 4
@g_9 = global [7 x i32*] [i32* @g_10, i32* @g_10, i32* @g_10, i32* @g_10, i32* @g_10, i32* @g_10, i32* @g_10], align 16
@g_20 = global i32* @g_10, align 8
@g_31 = global i8 -45, align 1
@.str = private unnamed_addr constant [20 x i8] c"checksum g_10 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [20 x i8] c"checksum g_31 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i64 @func_1() nounwind uwtable {
entry:
  %l_2 = alloca i16, align 2
  %l_34 = alloca i32*, align 8
  store i16 17194, i16* %l_2, align 2
  store i32* @g_10, i32** %l_34, align 8
  %tmp = load i16* %l_2, align 2
  %conv = zext i16 %tmp to i32
  %tmp1 = load i16* %l_2, align 2
  %conv2 = zext i16 %tmp1 to i32
  %tobool = icmp ne i32 %conv2, 0
  br i1 %tobool, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %entry
  %tmp3 = volatile load i32** @g_20, align 8
  %tmp4 = load i32* %tmp3
  %conv5 = trunc i32 %tmp4 to i16
  %tmp6 = load i32* @g_10, align 4
  %call = call zeroext i16 @safe_lshift_func_uint16_t_u_u(i16 zeroext %conv5, i32 %tmp6)
  %conv7 = trunc i16 %call to i8
  %tmp8 = load i32* @g_10, align 4
  %conv9 = sext i32 %tmp8 to i64
  %tmp10 = load i32* @g_10, align 4
  %tmp11 = load i16* %l_2, align 2
  %conv12 = trunc i16 %tmp11 to i8
  %tmp13 = load i16* %l_2, align 2
  %conv14 = zext i16 %tmp13 to i32
  %call15 = call zeroext i8 @safe_lshift_func_uint8_t_u_u(i8 zeroext %conv12, i32 %conv14)
  %conv16 = zext i8 %call15 to i32
  %call17 = call signext i8 @func_12(i8 signext %conv7, i64 %conv9, i32 %tmp10, i32 %conv16)
  %tmp18 = load i8* @g_31, align 1
  %tmp19 = load i16* %l_2, align 2
  %call20 = call signext i16 @safe_rshift_func_int16_t_s_s(i16 signext %tmp19, i32 1)
  %conv21 = sext i16 %call20 to i32
  %call22 = call signext i8 @safe_lshift_func_int8_t_s_s(i8 signext %tmp18, i32 %conv21)
  %conv23 = sext i8 %call22 to i32
  %tmp24 = load i8* @g_31, align 1
  %conv25 = zext i8 %tmp24 to i32
  %call26 = call i32 @func_3(i16 zeroext 0, i8 signext %call17, i32 %conv23, i32 1984750410, i32 %conv25)
  %tobool27 = icmp ne i32 %call26, 0
  br label %land.end

land.end:                                         ; preds = %land.rhs, %entry
  %0 = phi i1 [ false, %entry ], [ %tobool27, %land.rhs ]
  %land.ext = zext i1 %0 to i32
  %or = or i32 %conv, %land.ext
  %tobool28 = icmp ne i32 %or, 0
  br i1 %tobool28, label %land.rhs29, label %land.end33

land.rhs29:                                       ; preds = %land.end
  %tmp30 = load i16* %l_2, align 2
  %conv31 = zext i16 %tmp30 to i32
  %tobool32 = icmp ne i32 %conv31, 0
  br label %land.end33

land.end33:                                       ; preds = %land.rhs29, %land.end
  %1 = phi i1 [ false, %land.end ], [ %tobool32, %land.rhs29 ]
  %land.ext34 = zext i1 %1 to i32
  %tmp35 = load i32** %l_34, align 8
  store i32 %land.ext34, i32* %tmp35
  %tmp36 = load i8* @g_31, align 1
  %conv37 = zext i8 %tmp36 to i64
  ret i64 %conv37
}

define i32 @func_3(i16 zeroext %p_4, i8 signext %p_5, i32 %p_6, i32 %p_7, i32 %p_8) nounwind uwtable {
entry:
  %p_4.addr = alloca i16, align 2
  %p_5.addr = alloca i8, align 1
  %p_6.addr = alloca i32, align 4
  %p_7.addr = alloca i32, align 4
  %p_8.addr = alloca i32, align 4
  %l_11 = alloca [2 x [3 x i32]], align 16
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i16 %p_4, i16* %p_4.addr, align 2
  store i8 %p_5, i8* %p_5.addr, align 1
  store i32 %p_6, i32* %p_6.addr, align 4
  store i32 %p_7, i32* %p_7.addr, align 4
  store i32 %p_8, i32* %p_8.addr, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc10, %entry
  %tmp = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp, 2
  br i1 %cmp, label %for.body, label %for.end13

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc, %for.body
  %tmp2 = load i32* %j, align 4
  %cmp3 = icmp slt i32 %tmp2, 3
  br i1 %cmp3, label %for.body4, label %for.end

for.body4:                                        ; preds = %for.cond1
  %tmp5 = load i32* %j, align 4
  %idxprom = sext i32 %tmp5 to i64
  %tmp6 = load i32* %i, align 4
  %idxprom7 = sext i32 %tmp6 to i64
  %arrayidx = getelementptr inbounds [2 x [3 x i32]]* %l_11, i32 0, i64 %idxprom7
  %arrayidx8 = getelementptr inbounds [3 x i32]* %arrayidx, i32 0, i64 %idxprom
  store i32 -7, i32* %arrayidx8, align 4
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
  volatile store i32* null, i32** getelementptr inbounds ([7 x i32*]* @g_9, i32 0, i64 3), align 8
  %arrayidx14 = getelementptr inbounds [2 x [3 x i32]]* %l_11, i32 0, i64 0
  %arrayidx15 = getelementptr inbounds [3 x i32]* %arrayidx14, i32 0, i64 0
  %tmp16 = load i32* %arrayidx15, align 4
  ret i32 %tmp16
}

define signext i8 @func_12(i8 signext %p_13, i64 %p_14, i32 %p_15, i32 %p_16) nounwind uwtable {
entry:
  %retval = alloca i8, align 1
  %p_13.addr = alloca i8, align 1
  %p_14.addr = alloca i64, align 8
  %p_15.addr = alloca i32, align 4
  %p_16.addr = alloca i32, align 4
  %l_24 = alloca i8, align 1
  %l_19 = alloca [5 x i8], align 1
  %i = alloca i32, align 4
  store i8 %p_13, i8* %p_13.addr, align 1
  store i64 %p_14, i64* %p_14.addr, align 8
  store i32 %p_15, i32* %p_15.addr, align 4
  store i32 %p_16, i32* %p_16.addr, align 4
  store i8 83, i8* %l_24, align 1
  store i8 0, i8* %p_13.addr, align 1
  br label %for.cond

for.cond:                                         ; preds = %for.inc13, %entry
  %tmp = load i8* %p_13.addr, align 1
  %conv = sext i8 %tmp to i32
  %cmp = icmp slt i32 %conv, -4
  br i1 %cmp, label %for.body, label %for.end17

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %i, align 4
  br label %for.cond4

for.cond4:                                        ; preds = %for.inc, %for.body
  %tmp5 = load i32* %i, align 4
  %cmp6 = icmp slt i32 %tmp5, 5
  br i1 %cmp6, label %for.body8, label %for.end

for.body8:                                        ; preds = %for.cond4
  %tmp9 = load i32* %i, align 4
  %idxprom = sext i32 %tmp9 to i64
  %arrayidx = getelementptr inbounds [5 x i8]* %l_19, i32 0, i64 %idxprom
  store i8 52, i8* %arrayidx, align 1
  br label %for.inc

for.inc:                                          ; preds = %for.body8
  %tmp10 = load i32* %i, align 4
  %inc = add nsw i32 %tmp10, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond4

for.end:                                          ; preds = %for.cond4
  %arrayidx11 = getelementptr inbounds [5 x i8]* %l_19, i32 0, i64 1
  %tmp12 = load i8* %arrayidx11, align 1
  store i8 %tmp12, i8* %retval
  br label %return

for.inc13:                                        ; No predecessors!
  %tmp14 = load i8* %p_13.addr, align 1
  %conv15 = sext i8 %tmp14 to i64
  %call = call i64 @safe_sub_func_int64_t_s_s(i64 %conv15, i64 7)
  %conv16 = trunc i64 %call to i8
  store i8 %conv16, i8* %p_13.addr, align 1
  br label %for.cond

for.end17:                                        ; preds = %for.cond
  %tmp18 = load i32* %p_15.addr, align 4
  %tmp19 = volatile load i32** @g_20, align 8
  %tmp20 = load i32* %tmp19
  %xor = xor i32 %tmp20, %tmp18
  store i32 %xor, i32* %tmp19
  store i8 0, i8* %p_13.addr, align 1
  br label %for.cond21

for.cond21:                                       ; preds = %for.inc29, %for.end17
  %tmp22 = load i8* %p_13.addr, align 1
  %conv23 = sext i8 %tmp22 to i32
  %cmp24 = icmp slt i32 %conv23, 0
  br i1 %cmp24, label %for.body26, label %for.end32

for.body26:                                       ; preds = %for.cond21
  %tmp27 = load i32* @g_10, align 4
  %conv28 = trunc i32 %tmp27 to i8
  store i8 %conv28, i8* %retval
  br label %return

for.inc29:                                        ; No predecessors!
  %tmp30 = load i8* %p_13.addr, align 1
  %call31 = call signext i8 @safe_sub_func_int8_t_s_s(i8 signext %tmp30, i8 signext 1)
  store i8 %call31, i8* %p_13.addr, align 1
  br label %for.cond21

for.end32:                                        ; preds = %for.cond21
  %tmp33 = load i8* %l_24, align 1
  store i8 %tmp33, i8* %retval
  br label %return

return:                                           ; preds = %for.end32, %for.body26, %for.end
  %0 = load i8* %retval
  ret i8 %0
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

define internal signext i8 @safe_sub_func_int8_t_s_s(i8 signext %si1, i8 signext %si2) nounwind uwtable {
entry:
  %si1.addr = alloca i8, align 1
  %si2.addr = alloca i8, align 1
  store i8 %si1, i8* %si1.addr, align 1
  store i8 %si2, i8* %si2.addr, align 1
  %tmp = load i8* %si1.addr, align 1
  %conv = sext i8 %tmp to i32
  %tmp1 = load i8* %si2.addr, align 1
  %conv2 = sext i8 %tmp1 to i32
  %sub = sub nsw i32 %conv, %conv2
  %conv3 = trunc i32 %sub to i8
  ret i8 %conv3
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
  %tmp = load i32* @g_10, align 4
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str, i32 0, i32 0), i32 %tmp)
  %tmp2 = load i8* @g_31, align 1
  %conv = zext i8 %tmp2 to i32
  %call3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str1, i32 0, i32 0), i32 %conv)
  %0 = load i32* %retval
  ret i32 %0
}

declare i32 @printf(i8*, ...)
