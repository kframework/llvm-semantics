; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith000039.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = global i32 -2088476043, align 4
@g_17 = global i32 -1140569333, align 4
@.str = private unnamed_addr constant [19 x i8] c"checksum g_2 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [20 x i8] c"checksum g_17 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define zeroext i16 @func_1() nounwind uwtable {
entry:
  %l_13 = alloca [2 x [6 x i16]], align 16
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %l_16 = alloca i32*, align 8
  store i32 -15, i32* @g_2, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc51, %entry
  %tmp = load i32* @g_2, align 4
  %cmp = icmp sge i32 %tmp, 7
  br i1 %cmp, label %for.body, label %for.end56

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %i, align 4
  br label %for.cond4

for.cond4:                                        ; preds = %for.inc17, %for.body
  %tmp5 = load i32* %i, align 4
  %cmp6 = icmp slt i32 %tmp5, 2
  br i1 %cmp6, label %for.body7, label %for.end20

for.body7:                                        ; preds = %for.cond4
  store i32 0, i32* %j, align 4
  br label %for.cond8

for.cond8:                                        ; preds = %for.inc, %for.body7
  %tmp9 = load i32* %j, align 4
  %cmp10 = icmp slt i32 %tmp9, 6
  br i1 %cmp10, label %for.body11, label %for.end

for.body11:                                       ; preds = %for.cond8
  %tmp12 = load i32* %j, align 4
  %idxprom = sext i32 %tmp12 to i64
  %tmp13 = load i32* %i, align 4
  %idxprom14 = sext i32 %tmp13 to i64
  %arrayidx = getelementptr inbounds [2 x [6 x i16]]* %l_13, i32 0, i64 %idxprom14
  %arrayidx15 = getelementptr inbounds [6 x i16]* %arrayidx, i32 0, i64 %idxprom
  store i16 6997, i16* %arrayidx15, align 2
  br label %for.inc

for.inc:                                          ; preds = %for.body11
  %tmp16 = load i32* %j, align 4
  %inc = add nsw i32 %tmp16, 1
  store i32 %inc, i32* %j, align 4
  br label %for.cond8

for.end:                                          ; preds = %for.cond8
  br label %for.inc17

for.inc17:                                        ; preds = %for.end
  %tmp18 = load i32* %i, align 4
  %inc19 = add nsw i32 %tmp18, 1
  store i32 %inc19, i32* %i, align 4
  br label %for.cond4

for.end20:                                        ; preds = %for.cond4
  store i32 -29, i32* @g_2, align 4
  br label %for.cond21

for.cond21:                                       ; preds = %for.inc45, %for.end20
  %tmp22 = load i32* @g_2, align 4
  %cmp23 = icmp slt i32 %tmp22, 0
  br i1 %cmp23, label %for.body24, label %for.end50

for.body24:                                       ; preds = %for.cond21
  store i32* @g_17, i32** %l_16, align 8
  %arrayidx26 = getelementptr inbounds [2 x [6 x i16]]* %l_13, i32 0, i64 1
  %arrayidx27 = getelementptr inbounds [6 x i16]* %arrayidx26, i32 0, i64 0
  %tmp28 = load i16* %arrayidx27, align 2
  %conv = zext i16 %tmp28 to i32
  %arrayidx29 = getelementptr inbounds [2 x [6 x i16]]* %l_13, i32 0, i64 1
  %arrayidx30 = getelementptr inbounds [6 x i16]* %arrayidx29, i32 0, i64 0
  %tmp31 = load i16* %arrayidx30, align 2
  %conv32 = zext i16 %tmp31 to i32
  %tmp33 = load i32* @g_2, align 4
  %call = call i32 @safe_div_func_uint32_t_u_u(i32 %conv32, i32 %tmp33)
  %cmp34 = icmp eq i32 %conv, %call
  %conv35 = zext i1 %cmp34 to i32
  %conv36 = trunc i32 %conv35 to i16
  %call37 = call zeroext i16 @safe_add_func_uint16_t_u_u(i16 zeroext -1, i16 zeroext %conv36)
  %conv38 = trunc i16 %call37 to i8
  %call39 = call signext i8 @safe_rshift_func_int8_t_s_s(i8 signext %conv38, i32 1)
  %conv40 = sext i8 %call39 to i16
  %call41 = call zeroext i16 @safe_rshift_func_uint16_t_u_u(i16 zeroext %conv40, i32 -3)
  %conv42 = zext i16 %call41 to i32
  %tmp43 = load i32** %l_16, align 8
  %tmp44 = load i32* %tmp43
  %xor = xor i32 %tmp44, %conv42
  store i32 %xor, i32* %tmp43
  br label %for.inc45

for.inc45:                                        ; preds = %for.body24
  %tmp46 = load i32* @g_2, align 4
  %conv47 = trunc i32 %tmp46 to i16
  %call48 = call signext i16 @safe_sub_func_int16_t_s_s(i16 signext %conv47, i16 signext 3)
  %conv49 = sext i16 %call48 to i32
  store i32 %conv49, i32* @g_2, align 4
  br label %for.cond21

for.end50:                                        ; preds = %for.cond21
  br label %for.inc51

for.inc51:                                        ; preds = %for.end50
  %tmp52 = load i32* @g_2, align 4
  %conv53 = trunc i32 %tmp52 to i16
  %call54 = call zeroext i16 @safe_add_func_uint16_t_u_u(i16 zeroext %conv53, i16 zeroext 1)
  %conv55 = zext i16 %call54 to i32
  store i32 %conv55, i32* @g_2, align 4
  br label %for.cond

for.end56:                                        ; preds = %for.cond
  %tmp57 = load i32* @g_2, align 4
  %conv58 = trunc i32 %tmp57 to i16
  ret i16 %conv58
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

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  %call = call zeroext i16 @func_1()
  %tmp = load i32* @g_2, align 4
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %tmp)
  %tmp2 = load i32* @g_17, align 4
  %call3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str1, i32 0, i32 0), i32 %tmp2)
  %0 = load i32* %retval
  ret i32 %0
}

declare i32 @printf(i8*, ...)
