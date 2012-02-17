; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith000049.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_4 = constant i8 9, align 1
@g_16 = global [9 x [1 x i32]] [[1 x i32] [i32 1], [1 x i32] [i32 1], [1 x i32] [i32 1], [1 x i32] [i32 1], [1 x i32] [i32 1], [1 x i32] [i32 1], [1 x i32] [i32 1], [1 x i32] [i32 1], [1 x i32] [i32 1]], align 16
@.str = private unnamed_addr constant [19 x i8] c"checksum g_4 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [26 x i8] c"checksum g_16[0][0] = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [26 x i8] c"checksum g_16[1][0] = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [26 x i8] c"checksum g_16[2][0] = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [26 x i8] c"checksum g_16[3][0] = %d\0A\00", align 1
@.str5 = private unnamed_addr constant [26 x i8] c"checksum g_16[4][0] = %d\0A\00", align 1
@.str6 = private unnamed_addr constant [26 x i8] c"checksum g_16[5][0] = %d\0A\00", align 1
@.str7 = private unnamed_addr constant [26 x i8] c"checksum g_16[6][0] = %d\0A\00", align 1
@.str8 = private unnamed_addr constant [26 x i8] c"checksum g_16[7][0] = %d\0A\00", align 1
@.str9 = private unnamed_addr constant [26 x i8] c"checksum g_16[8][0] = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable {
entry:
  %l_5 = alloca [3 x [8 x i32]], align 16
  %l_7 = alloca i32, align 4
  %l_14 = alloca i64, align 8
  %l_15 = alloca i32*, align 8
  %l_17 = alloca [3 x i32*], align 16
  %l_18 = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 961065089, i32* %l_7, align 4
  store i64 -2509409820191035536, i64* %l_14, align 8
  store i32* getelementptr inbounds ([9 x [1 x i32]]* @g_16, i32 0, i64 6, i64 0), i32** %l_15, align 8
  store i32 -1654202773, i32* %l_18, align 4
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
  %cmp3 = icmp slt i32 %tmp2, 8
  br i1 %cmp3, label %for.body4, label %for.end

for.body4:                                        ; preds = %for.cond1
  %tmp5 = load i32* %j, align 4
  %idxprom = sext i32 %tmp5 to i64
  %tmp6 = load i32* %i, align 4
  %idxprom7 = sext i32 %tmp6 to i64
  %arrayidx = getelementptr inbounds [3 x [8 x i32]]* %l_5, i32 0, i64 %idxprom7
  %arrayidx8 = getelementptr inbounds [8 x i32]* %arrayidx, i32 0, i64 %idxprom
  store i32 459717372, i32* %arrayidx8, align 4
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
  store i32 0, i32* %i, align 4
  br label %for.cond14

for.cond14:                                       ; preds = %for.inc21, %for.end13
  %tmp15 = load i32* %i, align 4
  %cmp16 = icmp slt i32 %tmp15, 3
  br i1 %cmp16, label %for.body17, label %for.end24

for.body17:                                       ; preds = %for.cond14
  %tmp18 = load i32* %i, align 4
  %idxprom19 = sext i32 %tmp18 to i64
  %arrayidx20 = getelementptr inbounds [3 x i32*]* %l_17, i32 0, i64 %idxprom19
  store i32* %l_7, i32** %arrayidx20, align 8
  br label %for.inc21

for.inc21:                                        ; preds = %for.body17
  %tmp22 = load i32* %i, align 4
  %inc23 = add nsw i32 %tmp22, 1
  store i32 %inc23, i32* %i, align 4
  br label %for.cond14

for.end24:                                        ; preds = %for.cond14
  %arrayidx25 = getelementptr inbounds [3 x [8 x i32]]* %l_5, i32 0, i64 2
  %arrayidx26 = getelementptr inbounds [8 x i32]* %arrayidx25, i32 0, i64 1
  %tmp27 = load i32* %arrayidx26, align 4
  %cmp28 = icmp ne i32 9, %tmp27
  %conv = zext i1 %cmp28 to i32
  %call = call signext i16 @safe_unary_minus_func_int16_t_s(i16 signext 9)
  %conv29 = sext i16 %call to i32
  %cmp30 = icmp eq i32 %conv, %conv29
  br i1 %cmp30, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %for.end24
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %for.end24
  %0 = phi i1 [ true, %for.end24 ], [ true, %lor.rhs ]
  %lor.ext = zext i1 %0 to i32
  %tmp32 = load i32* %l_7, align 4
  %xor = xor i32 %lor.ext, %tmp32
  %conv33 = trunc i32 %xor to i8
  %call34 = call zeroext i8 @safe_add_func_uint8_t_u_u(i8 zeroext %conv33, i8 zeroext 2)
  %conv35 = zext i8 %call34 to i32
  %arrayidx36 = getelementptr inbounds [3 x [8 x i32]]* %l_5, i32 0, i64 2
  %arrayidx37 = getelementptr inbounds [8 x i32]* %arrayidx36, i32 0, i64 1
  %tmp38 = load i32* %arrayidx37, align 4
  %and = and i32 9, %tmp38
  %cmp39 = icmp slt i32 %and, 0
  %conv40 = zext i1 %cmp39 to i32
  %conv41 = trunc i32 %conv40 to i8
  %arrayidx42 = getelementptr inbounds [3 x [8 x i32]]* %l_5, i32 0, i64 2
  %arrayidx43 = getelementptr inbounds [8 x i32]* %arrayidx42, i32 0, i64 3
  %tmp44 = load i32* %arrayidx43, align 4
  %arrayidx45 = getelementptr inbounds [3 x [8 x i32]]* %l_5, i32 0, i64 1
  %arrayidx46 = getelementptr inbounds [8 x i32]* %arrayidx45, i32 0, i64 7
  %tmp47 = load i32* %arrayidx46, align 4
  %or = or i32 %tmp44, %tmp47
  %conv48 = sext i32 %or to i64
  %tmp49 = load i64* %l_14, align 8
  %cmp50 = icmp slt i64 9, %tmp49
  %conv51 = zext i1 %cmp50 to i32
  %conv52 = sext i32 %conv51 to i64
  %call53 = call i64 @safe_sub_func_int64_t_s_s(i64 %conv48, i64 %conv52)
  %conv54 = trunc i64 %call53 to i8
  %call55 = call zeroext i8 @safe_mul_func_uint8_t_u_u(i8 zeroext %conv41, i8 zeroext %conv54)
  %conv56 = zext i8 %call55 to i64
  %xor57 = xor i64 %conv56, 1984127398
  %conv58 = trunc i64 %xor57 to i8
  %call59 = call signext i8 @safe_mod_func_int8_t_s_s(i8 signext %conv58, i8 signext 9)
  %conv60 = sext i8 %call59 to i32
  %cmp61 = icmp sgt i32 %conv35, %conv60
  %conv62 = zext i1 %cmp61 to i32
  %tmp63 = load i32** %l_15, align 8
  %tmp64 = load i32* %tmp63
  %and65 = and i32 %tmp64, %conv62
  store i32 %and65, i32* %tmp63
  %tmp66 = load i32** %l_15, align 8
  %tmp67 = load i32* %tmp66
  %tmp68 = load i32* %l_18, align 4
  %xor69 = xor i32 %tmp68, %tmp67
  store i32 %xor69, i32* %l_18, align 4
  %tmp70 = load i32* getelementptr inbounds ([9 x [1 x i32]]* @g_16, i32 0, i64 6, i64 0), align 4
  ret i32 %tmp70
}

define internal zeroext i8 @safe_add_func_uint8_t_u_u(i8 zeroext %ui1, i8 zeroext %ui2) nounwind uwtable {
entry:
  %ui1.addr = alloca i8, align 1
  %ui2.addr = alloca i8, align 1
  store i8 %ui1, i8* %ui1.addr, align 1
  store i8 %ui2, i8* %ui2.addr, align 1
  %tmp = load i8* %ui1.addr, align 1
  %conv = zext i8 %tmp to i32
  %tmp1 = load i8* %ui2.addr, align 1
  %conv2 = zext i8 %tmp1 to i32
  %add = add nsw i32 %conv, %conv2
  %conv3 = trunc i32 %add to i8
  ret i8 %conv3
}

define internal signext i16 @safe_unary_minus_func_int16_t_s(i16 signext %si) nounwind uwtable {
entry:
  %si.addr = alloca i16, align 2
  store i16 %si, i16* %si.addr, align 2
  %tmp = load i16* %si.addr, align 2
  %conv = sext i16 %tmp to i32
  %sub = sub nsw i32 0, %conv
  %conv1 = trunc i32 %sub to i16
  ret i16 %conv1
}

define internal signext i8 @safe_mod_func_int8_t_s_s(i8 signext %si1, i8 signext %si2) nounwind uwtable {
entry:
  %si1.addr = alloca i8, align 1
  %si2.addr = alloca i8, align 1
  store i8 %si1, i8* %si1.addr, align 1
  store i8 %si2, i8* %si2.addr, align 1
  %tmp = load i8* %si2.addr, align 1
  %conv = sext i8 %tmp to i32
  %cmp = icmp eq i32 %conv, 0
  br i1 %cmp, label %cond.true, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %tmp2 = load i8* %si1.addr, align 1
  %conv3 = sext i8 %tmp2 to i32
  %cmp4 = icmp eq i32 %conv3, -128
  br i1 %cmp4, label %land.lhs.true, label %cond.false

land.lhs.true:                                    ; preds = %lor.lhs.false
  %tmp6 = load i8* %si2.addr, align 1
  %conv7 = sext i8 %tmp6 to i32
  %cmp8 = icmp eq i32 %conv7, -1
  br i1 %cmp8, label %cond.true, label %cond.false

cond.true:                                        ; preds = %land.lhs.true, %entry
  %tmp10 = load i8* %si1.addr, align 1
  %conv11 = sext i8 %tmp10 to i32
  br label %cond.end

cond.false:                                       ; preds = %land.lhs.true, %lor.lhs.false
  %tmp12 = load i8* %si1.addr, align 1
  %conv13 = sext i8 %tmp12 to i32
  %tmp14 = load i8* %si2.addr, align 1
  %conv15 = sext i8 %tmp14 to i32
  %rem = srem i32 %conv13, %conv15
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %conv11, %cond.true ], [ %rem, %cond.false ]
  %conv16 = trunc i32 %cond to i8
  ret i8 %conv16
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
  %call = call i32 @func_1()
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 9)
  %tmp = load i32* getelementptr inbounds ([9 x [1 x i32]]* @g_16, i32 0, i64 0, i64 0), align 4
  %call2 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str1, i32 0, i32 0), i32 %tmp)
  %tmp3 = load i32* getelementptr inbounds ([9 x [1 x i32]]* @g_16, i32 0, i64 1, i64 0), align 4
  %call4 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str2, i32 0, i32 0), i32 %tmp3)
  %tmp5 = load i32* getelementptr inbounds ([9 x [1 x i32]]* @g_16, i32 0, i64 2, i64 0), align 4
  %call6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str3, i32 0, i32 0), i32 %tmp5)
  %tmp7 = load i32* getelementptr inbounds ([9 x [1 x i32]]* @g_16, i32 0, i64 3, i64 0), align 4
  %call8 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str4, i32 0, i32 0), i32 %tmp7)
  %tmp9 = load i32* getelementptr inbounds ([9 x [1 x i32]]* @g_16, i32 0, i64 4, i64 0), align 4
  %call10 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str5, i32 0, i32 0), i32 %tmp9)
  %tmp11 = load i32* getelementptr inbounds ([9 x [1 x i32]]* @g_16, i32 0, i64 5, i64 0), align 4
  %call12 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str6, i32 0, i32 0), i32 %tmp11)
  %tmp13 = load i32* getelementptr inbounds ([9 x [1 x i32]]* @g_16, i32 0, i64 6, i64 0), align 4
  %call14 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str7, i32 0, i32 0), i32 %tmp13)
  %tmp15 = load i32* getelementptr inbounds ([9 x [1 x i32]]* @g_16, i32 0, i64 7, i64 0), align 4
  %call16 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str8, i32 0, i32 0), i32 %tmp15)
  %tmp17 = load i32* getelementptr inbounds ([9 x [1 x i32]]* @g_16, i32 0, i64 8, i64 0), align 4
  %call18 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str9, i32 0, i32 0), i32 %tmp17)
  %tmp19 = load i32* getelementptr inbounds ([9 x [1 x i32]]* @g_16, i32 0, i64 6, i64 0), align 4
  %call20 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str7, i32 0, i32 0), i32 %tmp19)
  %0 = load i32* %retval
  ret i32 %0
}

declare i32 @printf(i8*, ...)
