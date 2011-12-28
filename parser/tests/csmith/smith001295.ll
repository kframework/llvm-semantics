; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith001295.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_9 = global i16 -28066, align 2
@g_12 = global i32 -868071568, align 4
@g_11 = constant i32* @g_12, align 8
@.str = private unnamed_addr constant [19 x i8] c"checksum g_9 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [20 x i8] c"checksum g_12 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i64 @func_1() nounwind uwtable {
entry:
  %retval = alloca i64, align 8
  %l_6 = alloca [3 x i32], align 4
  %i = alloca i32, align 4
  %l_10 = alloca [5 x [3 x [6 x i32]]], align 16
  %i23 = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp, 3
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp1 = load i32* %i, align 4
  %idxprom = sext i32 %tmp1 to i64
  %arrayidx = getelementptr inbounds [3 x i32]* %l_6, i32 0, i64 %idxprom
  store i32 -2101511396, i32* %arrayidx, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %tmp2 = load i32* %i, align 4
  %inc = add nsw i32 %tmp2, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %arrayidx3 = getelementptr inbounds [3 x i32]* %l_6, i32 0, i64 1
  %tmp4 = load i32* %arrayidx3, align 4
  %conv = trunc i32 %tmp4 to i16
  %arrayidx5 = getelementptr inbounds [3 x i32]* %l_6, i32 0, i64 1
  %tmp6 = load i32* %arrayidx5, align 4
  %arrayidx7 = getelementptr inbounds [3 x i32]* %l_6, i32 0, i64 1
  %tmp8 = load i32* %arrayidx7, align 4
  %cmp9 = icmp ule i32 %tmp6, %tmp8
  br i1 %cmp9, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %for.end
  %tmp11 = load i16* @g_9, align 2
  %call = call signext i16 @safe_lshift_func_int16_t_s_u(i16 signext %tmp11, i32 1)
  %conv12 = sext i16 %call to i32
  %tobool = icmp ne i32 %conv12, 0
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %for.end
  %0 = phi i1 [ true, %for.end ], [ %tobool, %lor.rhs ]
  %lnot = xor i1 %0, true
  %lnot.ext = zext i1 %lnot to i32
  %conv13 = trunc i32 %lnot.ext to i16
  %call14 = call zeroext i16 @safe_add_func_uint16_t_u_u(i16 zeroext %conv, i16 zeroext %conv13)
  %tmp15 = load i16* @g_9, align 2
  %call16 = call zeroext i16 @safe_mod_func_uint16_t_u_u(i16 zeroext %call14, i16 zeroext %tmp15)
  %conv17 = zext i16 %call16 to i64
  %xor = xor i64 %conv17, 410561473
  %tobool18 = icmp ne i64 %xor, 0
  br i1 %tobool18, label %if.then, label %if.else

if.then:                                          ; preds = %lor.end
  %tmp19 = load i16* @g_9, align 2
  %conv20 = zext i16 %tmp19 to i64
  store i64 %conv20, i64* %retval
  br label %return

if.else:                                          ; preds = %lor.end
  store i32 0, i32* %i23, align 4
  br label %for.cond26

for.cond26:                                       ; preds = %for.inc58, %if.else
  %tmp27 = load i32* %i23, align 4
  %cmp28 = icmp slt i32 %tmp27, 5
  br i1 %cmp28, label %for.body30, label %for.end61

for.body30:                                       ; preds = %for.cond26
  store i32 0, i32* %j, align 4
  br label %for.cond31

for.cond31:                                       ; preds = %for.inc54, %for.body30
  %tmp32 = load i32* %j, align 4
  %cmp33 = icmp slt i32 %tmp32, 3
  br i1 %cmp33, label %for.body35, label %for.end57

for.body35:                                       ; preds = %for.cond31
  store i32 0, i32* %k, align 4
  br label %for.cond36

for.cond36:                                       ; preds = %for.inc50, %for.body35
  %tmp37 = load i32* %k, align 4
  %cmp38 = icmp slt i32 %tmp37, 6
  br i1 %cmp38, label %for.body40, label %for.end53

for.body40:                                       ; preds = %for.cond36
  %tmp41 = load i32* %k, align 4
  %idxprom42 = sext i32 %tmp41 to i64
  %tmp43 = load i32* %j, align 4
  %idxprom44 = sext i32 %tmp43 to i64
  %tmp45 = load i32* %i23, align 4
  %idxprom46 = sext i32 %tmp45 to i64
  %arrayidx47 = getelementptr inbounds [5 x [3 x [6 x i32]]]* %l_10, i32 0, i64 %idxprom46
  %arrayidx48 = getelementptr inbounds [3 x [6 x i32]]* %arrayidx47, i32 0, i64 %idxprom44
  %arrayidx49 = getelementptr inbounds [6 x i32]* %arrayidx48, i32 0, i64 %idxprom42
  store i32 -7, i32* %arrayidx49, align 4
  br label %for.inc50

for.inc50:                                        ; preds = %for.body40
  %tmp51 = load i32* %k, align 4
  %inc52 = add nsw i32 %tmp51, 1
  store i32 %inc52, i32* %k, align 4
  br label %for.cond36

for.end53:                                        ; preds = %for.cond36
  br label %for.inc54

for.inc54:                                        ; preds = %for.end53
  %tmp55 = load i32* %j, align 4
  %inc56 = add nsw i32 %tmp55, 1
  store i32 %inc56, i32* %j, align 4
  br label %for.cond31

for.end57:                                        ; preds = %for.cond31
  br label %for.inc58

for.inc58:                                        ; preds = %for.end57
  %tmp59 = load i32* %i23, align 4
  %inc60 = add nsw i32 %tmp59, 1
  store i32 %inc60, i32* %i23, align 4
  br label %for.cond26

for.end61:                                        ; preds = %for.cond26
  %arrayidx62 = getelementptr inbounds [5 x [3 x [6 x i32]]]* %l_10, i32 0, i64 3
  %arrayidx63 = getelementptr inbounds [3 x [6 x i32]]* %arrayidx62, i32 0, i64 2
  %arrayidx64 = getelementptr inbounds [6 x i32]* %arrayidx63, i32 0, i64 3
  %tmp65 = load i32* %arrayidx64, align 4
  %tmp66 = volatile load i32** @g_11, align 8
  %tmp67 = load i32* %tmp66
  %and = and i32 %tmp67, %tmp65
  store i32 %and, i32* %tmp66
  %tmp68 = load i32* @g_12, align 4
  %conv69 = sext i32 %tmp68 to i64
  store i64 %conv69, i64* %retval
  br label %return

return:                                           ; preds = %for.end61, %if.then
  %1 = load i64* %retval
  ret i64 %1
}

define internal zeroext i16 @safe_mod_func_uint16_t_u_u(i16 zeroext %ui1, i16 zeroext %ui2) nounwind uwtable {
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
  %rem = srem i32 %conv5, %conv7
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %conv3, %cond.true ], [ %rem, %cond.false ]
  %conv8 = trunc i32 %cond to i16
  ret i16 %conv8
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

define internal signext i16 @safe_lshift_func_int16_t_s_u(i16 signext %left, i32 %right) nounwind uwtable {
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
  %cmp3 = icmp uge i32 %tmp2, 32
  br i1 %cmp3, label %cond.true, label %lor.lhs.false5

lor.lhs.false5:                                   ; preds = %lor.lhs.false
  %tmp6 = load i16* %left.addr, align 2
  %conv7 = sext i16 %tmp6 to i32
  %tmp8 = load i32* %right.addr, align 4
  %shr = ashr i32 32767, %tmp8
  %cmp9 = icmp sgt i32 %conv7, %shr
  br i1 %cmp9, label %cond.true, label %cond.false

cond.true:                                        ; preds = %lor.lhs.false5, %lor.lhs.false, %entry
  %tmp11 = load i16* %left.addr, align 2
  %conv12 = sext i16 %tmp11 to i32
  br label %cond.end

cond.false:                                       ; preds = %lor.lhs.false5
  %tmp13 = load i16* %left.addr, align 2
  %conv14 = sext i16 %tmp13 to i32
  %tmp15 = load i32* %right.addr, align 4
  %shl = shl i32 %conv14, %tmp15
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %conv12, %cond.true ], [ %shl, %cond.false ]
  %conv16 = trunc i32 %cond to i16
  ret i16 %conv16
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
  %tmp = load i16* @g_9, align 2
  %conv = zext i16 %tmp to i32
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %conv)
  %tmp2 = load i32* @g_12, align 4
  %call3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str1, i32 0, i32 0), i32 %tmp2)
  %0 = load i32* %retval
  ret i32 %0
}

declare i32 @printf(i8*, ...)
