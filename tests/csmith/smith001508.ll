; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith001508.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_3 = global [1 x i32] [i32 -194136827], align 4
@g_4 = global i32 1748799429, align 4
@g_5 = global i32 82738465, align 4
@g_12 = constant i32* @g_4, align 8
@g_32 = constant i8 7, align 1
@.str = private unnamed_addr constant [22 x i8] c"checksum g_3[0] = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [19 x i8] c"checksum g_4 = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [19 x i8] c"checksum g_5 = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [20 x i8] c"checksum g_32 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define signext i8 @func_1() nounwind uwtable {
entry:
  %l_2 = alloca [1 x [6 x [8 x i32]]], align 16
  %l_8 = alloca i32, align 4
  %l_48 = alloca i64, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  store i32 -1448513146, i32* %l_8, align 4
  store i64 -5110642578287550726, i64* %l_48, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc21, %entry
  %tmp = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp, 1
  br i1 %cmp, label %for.body, label %for.end24

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc17, %for.body
  %tmp2 = load i32* %j, align 4
  %cmp3 = icmp slt i32 %tmp2, 6
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
  %arrayidx = getelementptr inbounds [1 x [6 x [8 x i32]]]* %l_2, i32 0, i64 %idxprom13
  %arrayidx14 = getelementptr inbounds [6 x [8 x i32]]* %arrayidx, i32 0, i64 %idxprom11
  %arrayidx15 = getelementptr inbounds [8 x i32]* %arrayidx14, i32 0, i64 %idxprom
  store i32 -706441934, i32* %arrayidx15, align 4
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
  %tmp25 = load i32* %l_8, align 4
  %conv = trunc i32 %tmp25 to i8
  ret i8 %conv
}

define i32 @func_16(i64 %p_17, i16 zeroext %p_18) nounwind uwtable {
entry:
  %p_17.addr = alloca i64, align 8
  %p_18.addr = alloca i16, align 2
  %l_26 = alloca i16, align 2
  %l_40 = alloca [1 x i32*], align 8
  %i = alloca i32, align 4
  %l_23 = alloca i32*, align 8
  store i64 %p_17, i64* %p_17.addr, align 8
  store i16 %p_18, i16* %p_18.addr, align 2
  store i16 1, i16* %l_26, align 2
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp, 1
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp1 = load i32* %i, align 4
  %idxprom = sext i32 %tmp1 to i64
  %arrayidx = getelementptr inbounds [1 x i32*]* %l_40, i32 0, i64 %idxprom
  store i32* @g_5, i32** %arrayidx, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %tmp2 = load i32* %i, align 4
  %inc = add nsw i32 %tmp2, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  br label %lbl_41

lbl_41:                                           ; preds = %if.then, %for.end
  store i32 -29, i32* @g_5, align 4
  br label %for.cond3

for.cond3:                                        ; preds = %for.inc52, %lbl_41
  %tmp4 = load i32* @g_5, align 4
  %cmp5 = icmp slt i32 %tmp4, -9
  br i1 %cmp5, label %for.body6, label %for.end57

for.body6:                                        ; preds = %for.cond3
  store i32* @g_4, i32** %l_23, align 8
  %tmp8 = load i32** %l_23, align 8
  %cmp9 = icmp ne i32* getelementptr inbounds ([1 x i32]* @g_3, i32 0, i64 0), %tmp8
  %conv = zext i1 %cmp9 to i32
  %conv10 = trunc i32 %conv to i16
  %tmp11 = load i16* %p_18.addr, align 2
  %conv12 = zext i16 %tmp11 to i32
  %tmp13 = load i16* %l_26, align 2
  %conv14 = sext i16 %tmp13 to i32
  %tobool = icmp ne i32 %conv14, 0
  br i1 %tobool, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %for.body6
  %tmp15 = load i16* %l_26, align 2
  %conv16 = sext i16 %tmp15 to i32
  %tobool17 = icmp ne i32 %conv16, 0
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %for.body6
  %0 = phi i1 [ true, %for.body6 ], [ %tobool17, %lor.rhs ]
  %lor.ext = zext i1 %0 to i32
  %conv18 = trunc i32 %lor.ext to i8
  %tmp19 = load i32* @g_4, align 4
  %conv20 = sext i32 %tmp19 to i64
  %call = call i32 @func_27(i64 %conv20, i16 zeroext 7)
  %conv21 = trunc i32 %call to i8
  %call22 = call zeroext i8 @safe_sub_func_uint8_t_u_u(i8 zeroext %conv18, i8 zeroext %conv21)
  %conv23 = zext i8 %call22 to i32
  %cmp24 = icmp sge i32 %conv12, %conv23
  %conv25 = zext i1 %cmp24 to i32
  %conv26 = sext i32 %conv25 to i64
  %tmp27 = load i16* %p_18.addr, align 2
  %tmp28 = load i16* %l_26, align 2
  %conv29 = sext i16 %tmp28 to i32
  %call30 = call signext i16 @safe_rshift_func_int16_t_s_s(i16 signext %tmp27, i32 %conv29)
  %conv31 = trunc i16 %call30 to i8
  %tmp32 = load i64* %p_17.addr, align 8
  %conv33 = trunc i64 %tmp32 to i16
  %call34 = call zeroext i16 @safe_unary_minus_func_uint16_t_u(i16 zeroext %conv33)
  %conv35 = trunc i16 %call34 to i8
  %call36 = call zeroext i8 @safe_mul_func_uint8_t_u_u(i8 zeroext %conv31, i8 zeroext %conv35)
  %conv37 = zext i8 %call36 to i64
  %call38 = call i64 @safe_mod_func_int64_t_s_s(i64 %conv37, i64 1)
  %xor = xor i64 %conv26, %call38
  %conv39 = trunc i64 %xor to i32
  %call40 = call zeroext i16 @safe_rshift_func_uint16_t_u_s(i16 zeroext %conv10, i32 %conv39)
  %conv41 = zext i16 %call40 to i32
  %arrayidx42 = getelementptr inbounds [1 x i32*]* %l_40, i32 0, i64 0
  %tmp43 = load i32** %arrayidx42, align 8
  %arrayidx44 = getelementptr inbounds [1 x i32*]* %l_40, i32 0, i64 0
  %tmp45 = load i32** %arrayidx44, align 8
  %cmp46 = icmp ne i32* %tmp43, %tmp45
  %conv47 = zext i1 %cmp46 to i32
  %and = and i32 %conv41, %conv47
  %tmp48 = load i32* @g_5, align 4
  %xor49 = xor i32 %tmp48, %and
  store i32 %xor49, i32* @g_5, align 4
  %tmp50 = load i64* %p_17.addr, align 8
  %tobool51 = icmp ne i64 %tmp50, 0
  br i1 %tobool51, label %if.then, label %if.end

if.then:                                          ; preds = %lor.end
  br label %lbl_41

if.end:                                           ; preds = %lor.end
  br label %for.inc52

for.inc52:                                        ; preds = %if.end
  %tmp53 = load i32* @g_5, align 4
  %conv54 = trunc i32 %tmp53 to i16
  %call55 = call signext i16 @safe_sub_func_int16_t_s_s(i16 signext %conv54, i16 signext 1)
  %conv56 = sext i16 %call55 to i32
  store i32 %conv56, i32* @g_5, align 4
  br label %for.cond3

for.end57:                                        ; preds = %for.cond3
  store i32 -6, i32* @g_4, align 4
  br label %for.cond58

for.cond58:                                       ; preds = %for.inc73, %for.end57
  %tmp59 = load i32* @g_4, align 4
  %cmp60 = icmp ne i32 %tmp59, 0
  br i1 %cmp60, label %for.body62, label %for.end78

for.body62:                                       ; preds = %for.cond58
  %tmp63 = volatile load i32** @g_12, align 8
  %tmp64 = load i32* %tmp63
  %tobool65 = icmp ne i32 %tmp64, 0
  br i1 %tobool65, label %if.then66, label %if.end67

if.then66:                                        ; preds = %for.body62
  br label %for.end78

if.end67:                                         ; preds = %for.body62
  %tmp68 = volatile load i32** @g_12, align 8
  %tmp69 = load i32* %tmp68
  %tobool70 = icmp ne i32 %tmp69, 0
  br i1 %tobool70, label %if.then71, label %if.end72

if.then71:                                        ; preds = %if.end67
  br label %for.inc73

if.end72:                                         ; preds = %if.end67
  br label %for.inc73

for.inc73:                                        ; preds = %if.end72, %if.then71
  %tmp74 = load i32* @g_4, align 4
  %conv75 = trunc i32 %tmp74 to i8
  %call76 = call zeroext i8 @safe_sub_func_uint8_t_u_u(i8 zeroext %conv75, i8 zeroext 9)
  %conv77 = zext i8 %call76 to i32
  store i32 %conv77, i32* @g_4, align 4
  br label %for.cond58

for.end78:                                        ; preds = %if.then66, %for.cond58
  %tmp79 = load i16* %p_18.addr, align 2
  %conv80 = zext i16 %tmp79 to i32
  ret i32 %conv80
}

define internal zeroext i16 @safe_rshift_func_uint16_t_u_s(i16 zeroext %left, i32 %right) nounwind uwtable {
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
  br i1 %cmp2, label %cond.true, label %cond.false

cond.true:                                        ; preds = %lor.lhs.false, %entry
  %tmp3 = load i16* %left.addr, align 2
  %conv = zext i16 %tmp3 to i32
  br label %cond.end

cond.false:                                       ; preds = %lor.lhs.false
  %tmp4 = load i16* %left.addr, align 2
  %conv5 = zext i16 %tmp4 to i32
  %tmp6 = load i32* %right.addr, align 4
  %shr = ashr i32 %conv5, %tmp6
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %conv, %cond.true ], [ %shr, %cond.false ]
  %conv7 = trunc i32 %cond to i16
  ret i16 %conv7
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

define i32 @func_27(i64 %p_28, i16 zeroext %p_29) nounwind uwtable {
entry:
  %p_28.addr = alloca i64, align 8
  %p_29.addr = alloca i16, align 2
  %l_31 = alloca i32*, align 8
  %l_30 = alloca i32**, align 8
  store i64 %p_28, i64* %p_28.addr, align 8
  store i16 %p_29, i16* %p_29.addr, align 2
  store i32* getelementptr inbounds ([1 x i32]* @g_3, i32 0, i64 0), i32** %l_31, align 8
  store i32** %l_31, i32*** %l_30, align 8
  %tmp = load i32*** %l_30, align 8
  store i32* null, i32** %tmp
  %tmp1 = volatile load i32** @g_12, align 8
  %tmp2 = load i32* %tmp1
  ret i32 %tmp2
}

define internal i64 @safe_mod_func_int64_t_s_s(i64 %si1, i64 %si2) nounwind uwtable {
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
  %rem = srem i64 %tmp6, %tmp7
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i64 [ %tmp5, %cond.true ], [ %rem, %cond.false ]
  ret i64 %cond
}

define internal zeroext i8 @safe_mul_func_uint8_t_u_u(i8 zeroext %ui1, i8 zeroext %ui2) nounwind uwtable {
entry:
  %ui1.addr = alloca i8, align 1
  %ui2.addr = alloca i8, align 1
  store i8 %ui1, i8* %ui1.addr, align 1
  store i8 %ui2, i8* %ui2.addr, align 1
  %tmp = load i8* %ui1.addr, align 1
  %conv = zext i8 %tmp to i32
  %tmp1 = load i8* %ui2.addr, align 1
  %conv2 = zext i8 %tmp1 to i32
  %mul = mul i32 %conv, %conv2
  %conv3 = trunc i32 %mul to i8
  ret i8 %conv3
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
  %i = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  %call = call signext i8 @func_1()
  %tmp = load i32* getelementptr inbounds ([1 x i32]* @g_3, i32 0, i64 0), align 4
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str, i32 0, i32 0), i32 %tmp)
  %tmp2 = load i32* getelementptr inbounds ([1 x i32]* @g_3, i32 0, i64 0), align 4
  %call3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str, i32 0, i32 0), i32 %tmp2)
  %tmp4 = load i32* @g_4, align 4
  %call5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str1, i32 0, i32 0), i32 %tmp4)
  %tmp6 = load i32* @g_5, align 4
  %call7 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str2, i32 0, i32 0), i32 %tmp6)
  %call8 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str3, i32 0, i32 0), i32 7)
  %0 = load i32* %retval
  ret i32 %0
}

declare i32 @printf(i8*, ...)
