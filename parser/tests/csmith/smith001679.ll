; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith001679.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = global i32 7, align 4
@g_9 = global i32 -94376035, align 4
@g_8 = global i32* @g_9, align 8
@.str = private unnamed_addr constant [19 x i8] c"checksum g_2 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [19 x i8] c"checksum g_9 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %l_7 = alloca i32, align 4
  %l_32 = alloca i8, align 1
  %l_21 = alloca i32, align 4
  %l_24 = alloca i32*, align 8
  %l_27 = alloca [6 x [3 x [3 x i32]]], align 16
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %l_30 = alloca i8, align 1
  %l_31 = alloca i32*, align 8
  store i32 468890265, i32* %l_7, align 4
  store i8 -4, i8* %l_32, align 1
  volatile store i32 0, i32* @g_2, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp = volatile load i32* @g_2, align 4
  %cmp = icmp ne i32 %tmp, 0
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp1 = volatile load i32* @g_2, align 4
  store i32 %tmp1, i32* %retval
  br label %return

for.inc:                                          ; No predecessors!
  %tmp2 = volatile load i32* @g_2, align 4
  %conv = trunc i32 %tmp2 to i8
  %call = call zeroext i8 @safe_sub_func_uint8_t_u_u(i8 zeroext %conv, i8 zeroext 2)
  %conv3 = zext i8 %call to i32
  volatile store i32 %conv3, i32* @g_2, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %tmp4 = volatile load i32* @g_2, align 4
  %tmp5 = load i32* %l_7, align 4
  %cmp6 = icmp slt i32 %tmp4, %tmp5
  %conv7 = zext i1 %cmp6 to i32
  %conv8 = trunc i32 %conv7 to i16
  %tmp9 = load i32* %l_7, align 4
  %conv10 = trunc i32 %tmp9 to i16
  %call11 = call zeroext i16 @safe_sub_func_uint16_t_u_u(i16 zeroext %conv8, i16 zeroext %conv10)
  %conv12 = zext i16 %call11 to i32
  %tmp13 = volatile load i32** @g_8, align 8
  store i32 %conv12, i32* %tmp13
  %tmp14 = volatile load i32** @g_8, align 8
  %tmp15 = load i32* %tmp14
  %tmp16 = load i32* %l_7, align 4
  %xor = xor i32 %tmp15, %tmp16
  %tobool = icmp ne i32 %xor, 0
  br i1 %tobool, label %if.then, label %if.else

if.then:                                          ; preds = %for.end
  store i32 -1, i32* %l_21, align 4
  store i32* @g_9, i32** %l_24, align 8
  %call19 = call i32 @func_12(i32* null)
  %conv20 = trunc i32 %call19 to i8
  %tmp21 = load i32* %l_7, align 4
  %conv22 = trunc i32 %tmp21 to i16
  %tmp23 = load i32* %l_7, align 4
  %tmp24 = volatile load i32** @g_8, align 8
  %tmp25 = load i32* %tmp24
  %cmp26 = icmp ne i32 %tmp23, %tmp25
  %conv27 = zext i1 %cmp26 to i32
  %conv28 = sext i32 %conv27 to i64
  %cmp29 = icmp eq i64 399134342, %conv28
  %conv30 = zext i1 %cmp29 to i32
  %tmp31 = load i32* %l_21, align 4
  %tmp32 = load i32* %l_21, align 4
  %xor33 = xor i32 %tmp31, %tmp32
  %conv34 = trunc i32 %xor33 to i8
  %tmp35 = load i32* %l_7, align 4
  %tmp36 = load i32* %l_21, align 4
  %call37 = call i32 @safe_mod_func_int32_t_s_s(i32 %tmp35, i32 %tmp36)
  %call38 = call zeroext i8 @safe_rshift_func_uint8_t_u_u(i8 zeroext %conv34, i32 %call37)
  %conv39 = zext i8 %call38 to i32
  %xor40 = xor i32 %conv30, %conv39
  %conv41 = trunc i32 %xor40 to i16
  %call42 = call signext i16 @safe_sub_func_int16_t_s_s(i16 signext %conv22, i16 signext %conv41)
  %conv43 = sext i16 %call42 to i64
  %cmp44 = icmp sle i64 %conv43, 2237590656
  %conv45 = zext i1 %cmp44 to i32
  %conv46 = trunc i32 %conv45 to i8
  %call47 = call zeroext i8 @safe_mul_func_uint8_t_u_u(i8 zeroext %conv20, i8 zeroext %conv46)
  %conv48 = zext i8 %call47 to i32
  %tmp49 = load i32** %l_24, align 8
  store i32 %conv48, i32* %tmp49
  store i32 10, i32* @g_9, align 4
  br label %for.cond50

for.cond50:                                       ; preds = %for.inc96, %if.then
  %tmp51 = load i32* @g_9, align 4
  %cmp52 = icmp sge i32 %tmp51, 0
  br i1 %cmp52, label %for.body54, label %for.end99

for.body54:                                       ; preds = %for.cond50
  store i32 0, i32* %i, align 4
  br label %for.cond59

for.cond59:                                       ; preds = %for.inc88, %for.body54
  %tmp60 = load i32* %i, align 4
  %cmp61 = icmp slt i32 %tmp60, 6
  br i1 %cmp61, label %for.body63, label %for.end91

for.body63:                                       ; preds = %for.cond59
  store i32 0, i32* %j, align 4
  br label %for.cond64

for.cond64:                                       ; preds = %for.inc84, %for.body63
  %tmp65 = load i32* %j, align 4
  %cmp66 = icmp slt i32 %tmp65, 3
  br i1 %cmp66, label %for.body68, label %for.end87

for.body68:                                       ; preds = %for.cond64
  store i32 0, i32* %k, align 4
  br label %for.cond69

for.cond69:                                       ; preds = %for.inc81, %for.body68
  %tmp70 = load i32* %k, align 4
  %cmp71 = icmp slt i32 %tmp70, 3
  br i1 %cmp71, label %for.body73, label %for.end83

for.body73:                                       ; preds = %for.cond69
  %tmp74 = load i32* %k, align 4
  %idxprom = sext i32 %tmp74 to i64
  %tmp75 = load i32* %j, align 4
  %idxprom76 = sext i32 %tmp75 to i64
  %tmp77 = load i32* %i, align 4
  %idxprom78 = sext i32 %tmp77 to i64
  %arrayidx = getelementptr inbounds [6 x [3 x [3 x i32]]]* %l_27, i32 0, i64 %idxprom78
  %arrayidx79 = getelementptr inbounds [3 x [3 x i32]]* %arrayidx, i32 0, i64 %idxprom76
  %arrayidx80 = getelementptr inbounds [3 x i32]* %arrayidx79, i32 0, i64 %idxprom
  store i32 1624657053, i32* %arrayidx80, align 4
  br label %for.inc81

for.inc81:                                        ; preds = %for.body73
  %tmp82 = load i32* %k, align 4
  %inc = add nsw i32 %tmp82, 1
  store i32 %inc, i32* %k, align 4
  br label %for.cond69

for.end83:                                        ; preds = %for.cond69
  br label %for.inc84

for.inc84:                                        ; preds = %for.end83
  %tmp85 = load i32* %j, align 4
  %inc86 = add nsw i32 %tmp85, 1
  store i32 %inc86, i32* %j, align 4
  br label %for.cond64

for.end87:                                        ; preds = %for.cond64
  br label %for.inc88

for.inc88:                                        ; preds = %for.end87
  %tmp89 = load i32* %i, align 4
  %inc90 = add nsw i32 %tmp89, 1
  store i32 %inc90, i32* %i, align 4
  br label %for.cond59

for.end91:                                        ; preds = %for.cond59
  %arrayidx92 = getelementptr inbounds [6 x [3 x [3 x i32]]]* %l_27, i32 0, i64 2
  %arrayidx93 = getelementptr inbounds [3 x [3 x i32]]* %arrayidx92, i32 0, i64 1
  %arrayidx94 = getelementptr inbounds [3 x i32]* %arrayidx93, i32 0, i64 2
  %tmp95 = load i32* %arrayidx94, align 4
  store i32 %tmp95, i32* %retval
  br label %return

for.inc96:                                        ; No predecessors!
  %tmp97 = load i32* @g_9, align 4
  %call98 = call i32 @safe_add_func_int32_t_s_s(i32 %tmp97, i32 2)
  store i32 %call98, i32* @g_9, align 4
  br label %for.cond50

for.end99:                                        ; preds = %for.cond50
  br label %if.end

if.else:                                          ; preds = %for.end
  store i8 -96, i8* %l_30, align 1
  store i32* @g_9, i32** %l_31, align 8
  %call102 = call i32 @func_12(i32* @g_9)
  %conv103 = trunc i32 %call102 to i8
  %tmp104 = load i8* %l_30, align 1
  %call105 = call signext i8 @safe_mul_func_int8_t_s_s(i8 signext %conv103, i8 signext %tmp104)
  %conv106 = sext i8 %call105 to i32
  %tmp107 = load i32** %l_31, align 8
  %tmp108 = load i32* %tmp107
  %and = and i32 %tmp108, %conv106
  store i32 %and, i32* %tmp107
  %tmp109 = volatile load i32* @g_2, align 4
  store i32 %tmp109, i32* %retval
  br label %return

if.end:                                           ; preds = %for.end99
  %tmp110 = load i8* %l_32, align 1
  %conv111 = sext i8 %tmp110 to i32
  store i32 %conv111, i32* %retval
  br label %return

return:                                           ; preds = %if.end, %if.else, %for.end91, %for.body
  %0 = load i32* %retval
  ret i32 %0
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

define internal zeroext i16 @safe_sub_func_uint16_t_u_u(i16 zeroext %ui1, i16 zeroext %ui2) nounwind uwtable {
entry:
  %ui1.addr = alloca i16, align 2
  %ui2.addr = alloca i16, align 2
  store i16 %ui1, i16* %ui1.addr, align 2
  store i16 %ui2, i16* %ui2.addr, align 2
  %tmp = load i16* %ui1.addr, align 2
  %conv = zext i16 %tmp to i32
  %tmp1 = load i16* %ui2.addr, align 2
  %conv2 = zext i16 %tmp1 to i32
  %sub = sub nsw i32 %conv, %conv2
  %conv3 = trunc i32 %sub to i16
  ret i16 %conv3
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

define i32 @func_12(i32* %p_13) nounwind uwtable {
entry:
  %p_13.addr = alloca i32*, align 8
  %l_15 = alloca i32*, align 8
  %l_14 = alloca i32**, align 8
  %l_16 = alloca i32, align 4
  store i32* %p_13, i32** %p_13.addr, align 8
  store i32* @g_9, i32** %l_15, align 8
  store i32** %l_15, i32*** %l_14, align 8
  store i32 -1, i32* %l_16, align 4
  store i32** %p_13.addr, i32*** %l_14, align 8
  %tmp = load i32* %l_16, align 4
  ret i32 %tmp
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

define internal zeroext i8 @safe_rshift_func_uint8_t_u_u(i8 zeroext %left, i32 %right) nounwind uwtable {
entry:
  %left.addr = alloca i8, align 1
  %right.addr = alloca i32, align 4
  store i8 %left, i8* %left.addr, align 1
  store i32 %right, i32* %right.addr, align 4
  %tmp = load i32* %right.addr, align 4
  %cmp = icmp uge i32 %tmp, 32
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %tmp1 = load i8* %left.addr, align 1
  %conv = zext i8 %tmp1 to i32
  br label %cond.end

cond.false:                                       ; preds = %entry
  %tmp2 = load i8* %left.addr, align 1
  %conv3 = zext i8 %tmp2 to i32
  %tmp4 = load i32* %right.addr, align 4
  %shr = ashr i32 %conv3, %tmp4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %conv, %cond.true ], [ %shr, %cond.false ]
  %conv5 = trunc i32 %cond to i8
  ret i8 %conv5
}

define internal i32 @safe_mod_func_int32_t_s_s(i32 %si1, i32 %si2) nounwind uwtable {
entry:
  %si1.addr = alloca i32, align 4
  %si2.addr = alloca i32, align 4
  store i32 %si1, i32* %si1.addr, align 4
  store i32 %si2, i32* %si2.addr, align 4
  %tmp = load i32* %si2.addr, align 4
  %cmp = icmp eq i32 %tmp, 0
  br i1 %cmp, label %cond.true, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %tmp1 = load i32* %si1.addr, align 4
  %cmp2 = icmp eq i32 %tmp1, -2147483648
  br i1 %cmp2, label %land.lhs.true, label %cond.false

land.lhs.true:                                    ; preds = %lor.lhs.false
  %tmp3 = load i32* %si2.addr, align 4
  %cmp4 = icmp eq i32 %tmp3, -1
  br i1 %cmp4, label %cond.true, label %cond.false

cond.true:                                        ; preds = %land.lhs.true, %entry
  %tmp5 = load i32* %si1.addr, align 4
  br label %cond.end

cond.false:                                       ; preds = %land.lhs.true, %lor.lhs.false
  %tmp6 = load i32* %si1.addr, align 4
  %tmp7 = load i32* %si2.addr, align 4
  %rem = srem i32 %tmp6, %tmp7
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %tmp5, %cond.true ], [ %rem, %cond.false ]
  ret i32 %cond
}

define internal i32 @safe_add_func_int32_t_s_s(i32 %si1, i32 %si2) nounwind uwtable {
entry:
  %si1.addr = alloca i32, align 4
  %si2.addr = alloca i32, align 4
  store i32 %si1, i32* %si1.addr, align 4
  store i32 %si2, i32* %si2.addr, align 4
  %tmp = load i32* %si1.addr, align 4
  %cmp = icmp sgt i32 %tmp, 0
  br i1 %cmp, label %land.lhs.true, label %lor.lhs.false

land.lhs.true:                                    ; preds = %entry
  %tmp1 = load i32* %si2.addr, align 4
  %cmp2 = icmp sgt i32 %tmp1, 0
  br i1 %cmp2, label %land.lhs.true3, label %lor.lhs.false

land.lhs.true3:                                   ; preds = %land.lhs.true
  %tmp4 = load i32* %si1.addr, align 4
  %tmp5 = load i32* %si2.addr, align 4
  %sub = sub nsw i32 2147483647, %tmp5
  %cmp6 = icmp sgt i32 %tmp4, %sub
  br i1 %cmp6, label %cond.true, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %land.lhs.true3, %land.lhs.true, %entry
  %tmp7 = load i32* %si1.addr, align 4
  %cmp8 = icmp slt i32 %tmp7, 0
  br i1 %cmp8, label %land.lhs.true9, label %cond.false

land.lhs.true9:                                   ; preds = %lor.lhs.false
  %tmp10 = load i32* %si2.addr, align 4
  %cmp11 = icmp slt i32 %tmp10, 0
  br i1 %cmp11, label %land.lhs.true12, label %cond.false

land.lhs.true12:                                  ; preds = %land.lhs.true9
  %tmp13 = load i32* %si1.addr, align 4
  %tmp14 = load i32* %si2.addr, align 4
  %sub15 = sub nsw i32 -2147483648, %tmp14
  %cmp16 = icmp slt i32 %tmp13, %sub15
  br i1 %cmp16, label %cond.true, label %cond.false

cond.true:                                        ; preds = %land.lhs.true12, %land.lhs.true3
  %tmp17 = load i32* %si1.addr, align 4
  br label %cond.end

cond.false:                                       ; preds = %land.lhs.true12, %land.lhs.true9, %lor.lhs.false
  %tmp18 = load i32* %si1.addr, align 4
  %tmp19 = load i32* %si2.addr, align 4
  %add = add nsw i32 %tmp18, %tmp19
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %tmp17, %cond.true ], [ %add, %cond.false ]
  ret i32 %cond
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
  %call = call i32 @func_1()
  %tmp = volatile load i32* @g_2, align 4
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %tmp)
  %tmp2 = load i32* @g_9, align 4
  %call3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str1, i32 0, i32 0), i32 %tmp2)
  %0 = load i32* %retval
  ret i32 %0
}

declare i32 @printf(i8*, ...)
