; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith000915.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = global [7 x i16] [i16 17513, i16 17513, i16 17513, i16 17513, i16 17513, i16 17513, i16 17513], align 2
@g_4 = global i32 -1114352581, align 4
@g_3 = global i32* @g_4, align 8
@g_12 = global i32 978188025, align 4
@.str = private unnamed_addr constant [22 x i8] c"checksum g_2[0] = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [22 x i8] c"checksum g_2[1] = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [22 x i8] c"checksum g_2[2] = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [22 x i8] c"checksum g_2[3] = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [22 x i8] c"checksum g_2[4] = %d\0A\00", align 1
@.str5 = private unnamed_addr constant [22 x i8] c"checksum g_2[5] = %d\0A\00", align 1
@.str6 = private unnamed_addr constant [22 x i8] c"checksum g_2[6] = %d\0A\00", align 1
@.str7 = private unnamed_addr constant [19 x i8] c"checksum g_4 = %d\0A\00", align 1
@.str8 = private unnamed_addr constant [20 x i8] c"checksum g_12 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i64 @func_1() nounwind uwtable {
entry:
  %l_13 = alloca i32, align 4
  %l_27 = alloca i32*, align 8
  store i32 0, i32* %l_13, align 4
  volatile store i32* @g_4, i32** %l_27, align 8
  %tmp = volatile load i16* getelementptr inbounds ([7 x i16]* @g_2, i32 0, i64 1), align 2
  %conv = zext i16 %tmp to i32
  %tmp1 = volatile load i32** @g_3, align 8
  volatile store i32 %conv, i32* %tmp1
  %tmp2 = volatile load i32** @g_3, align 8
  volatile store i32* %tmp2, i32** %l_27, align 8
  volatile store i32* @g_4, i32** %l_27, align 8
  %tmp3 = volatile load i16* getelementptr inbounds ([7 x i16]* @g_2, i32 0, i64 1), align 2
  %conv4 = zext i16 %tmp3 to i64
  ret i64 %conv4
}

define i32* @func_5(i64 %p_6, i32* %p_7) nounwind uwtable {
entry:
  %p_6.addr = alloca i64, align 8
  %p_7.addr = alloca i32*, align 8
  %l_10 = alloca i8, align 1
  %l_11 = alloca i32*, align 8
  store i64 %p_6, i64* %p_6.addr, align 8
  store i32* %p_7, i32** %p_7.addr, align 8
  store i8 3, i8* %l_10, align 1
  store i32* @g_12, i32** %l_11, align 8
  %tmp = load i32** %p_7.addr, align 8
  %tmp1 = load i32* %tmp
  %tmp2 = load i32** %p_7.addr, align 8
  %tmp3 = load i32* %tmp2
  %conv = trunc i32 %tmp3 to i16
  %tmp4 = load i32** %p_7.addr, align 8
  %tmp5 = load i32* %tmp4
  %call = call zeroext i16 @safe_rshift_func_uint16_t_u_s(i16 zeroext %conv, i32 %tmp5)
  %conv6 = zext i16 %call to i32
  %tmp7 = load i8* %l_10, align 1
  %conv8 = zext i8 %tmp7 to i32
  %cmp = icmp slt i32 %conv6, %conv8
  %conv9 = zext i1 %cmp to i32
  %tmp10 = load i32** %p_7.addr, align 8
  %tmp11 = load i32* %tmp10
  %cmp12 = icmp ne i32 %conv9, %tmp11
  %conv13 = zext i1 %cmp12 to i32
  %cmp14 = icmp sge i32 %tmp1, %conv13
  %conv15 = zext i1 %cmp14 to i32
  %tmp16 = volatile load i32** @g_3, align 8
  volatile store i32 %conv15, i32* %tmp16
  %tmp17 = load i32** %p_7.addr, align 8
  %tmp18 = load i32* %tmp17
  %tmp19 = load i32** %p_7.addr, align 8
  %tmp20 = load i32* %tmp19
  %xor = xor i32 %tmp20, %tmp18
  store i32 %xor, i32* %tmp19
  %tmp21 = load i32** %l_11, align 8
  ret i32* %tmp21
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

define i32* @func_14(i64 %p_15, i32* %p_16, i32* %p_17, i8 zeroext %p_18, i32* %p_19) nounwind uwtable {
entry:
  %p_15.addr = alloca i64, align 8
  %p_16.addr = alloca i32*, align 8
  %p_17.addr = alloca i32*, align 8
  %p_18.addr = alloca i8, align 1
  %p_19.addr = alloca i32*, align 8
  store i64 %p_15, i64* %p_15.addr, align 8
  store i32* %p_16, i32** %p_16.addr, align 8
  store i32* %p_17, i32** %p_17.addr, align 8
  store i8 %p_18, i8* %p_18.addr, align 1
  store i32* %p_19, i32** %p_19.addr, align 8
  %tmp = load i32** %p_19.addr, align 8
  ret i32* %tmp
}

define i32* @func_20(i32 %p_21, i32* %p_22, i32 %p_23, i32* %p_24, i32* %p_25) nounwind uwtable {
entry:
  %p_21.addr = alloca i32, align 4
  %p_22.addr = alloca i32*, align 8
  %p_23.addr = alloca i32, align 4
  %p_24.addr = alloca i32*, align 8
  %p_25.addr = alloca i32*, align 8
  %l_26 = alloca [3 x [9 x i32]], align 16
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 %p_21, i32* %p_21.addr, align 4
  store i32* %p_22, i32** %p_22.addr, align 8
  store i32 %p_23, i32* %p_23.addr, align 4
  store i32* %p_24, i32** %p_24.addr, align 8
  store i32* %p_25, i32** %p_25.addr, align 8
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
  %cmp3 = icmp slt i32 %tmp2, 9
  br i1 %cmp3, label %for.body4, label %for.end

for.body4:                                        ; preds = %for.cond1
  %tmp5 = load i32* %j, align 4
  %idxprom = sext i32 %tmp5 to i64
  %tmp6 = load i32* %i, align 4
  %idxprom7 = sext i32 %tmp6 to i64
  %arrayidx = getelementptr inbounds [3 x [9 x i32]]* %l_26, i32 0, i64 %idxprom7
  %arrayidx8 = getelementptr inbounds [9 x i32]* %arrayidx, i32 0, i64 %idxprom
  store i32 -655199934, i32* %arrayidx8, align 4
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
  store i32 0, i32* %p_21.addr, align 4
  br label %for.cond14

for.cond14:                                       ; preds = %for.inc31, %for.end13
  %tmp15 = load i32* %p_21.addr, align 4
  %cmp16 = icmp ult i32 %tmp15, 3
  br i1 %cmp16, label %for.body17, label %for.end34

for.body17:                                       ; preds = %for.cond14
  store i32 0, i32* %p_23.addr, align 4
  br label %for.cond18

for.cond18:                                       ; preds = %for.inc28, %for.body17
  %tmp19 = load i32* %p_23.addr, align 4
  %cmp20 = icmp slt i32 %tmp19, 9
  br i1 %cmp20, label %for.body21, label %for.end30

for.body21:                                       ; preds = %for.cond18
  %tmp22 = load i32* %p_23.addr, align 4
  %idxprom23 = sext i32 %tmp22 to i64
  %tmp24 = load i32* %p_21.addr, align 4
  %idxprom25 = zext i32 %tmp24 to i64
  %arrayidx26 = getelementptr inbounds [3 x [9 x i32]]* %l_26, i32 0, i64 %idxprom25
  %arrayidx27 = getelementptr inbounds [9 x i32]* %arrayidx26, i32 0, i64 %idxprom23
  store i32 1, i32* %arrayidx27, align 4
  br label %for.inc28

for.inc28:                                        ; preds = %for.body21
  %tmp29 = load i32* %p_23.addr, align 4
  %add = add nsw i32 %tmp29, 1
  store i32 %add, i32* %p_23.addr, align 4
  br label %for.cond18

for.end30:                                        ; preds = %for.cond18
  br label %for.inc31

for.inc31:                                        ; preds = %for.end30
  %tmp32 = load i32* %p_21.addr, align 4
  %add33 = add i32 %tmp32, 1
  store i32 %add33, i32* %p_21.addr, align 4
  br label %for.cond14

for.end34:                                        ; preds = %for.cond14
  ret i32* @g_12
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
  %tmp = volatile load i16* getelementptr inbounds ([7 x i16]* @g_2, i32 0, i64 0), align 2
  %conv = zext i16 %tmp to i32
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str, i32 0, i32 0), i32 %conv)
  %tmp2 = volatile load i16* getelementptr inbounds ([7 x i16]* @g_2, i32 0, i64 1), align 2
  %conv3 = zext i16 %tmp2 to i32
  %call4 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str1, i32 0, i32 0), i32 %conv3)
  %tmp5 = volatile load i16* getelementptr inbounds ([7 x i16]* @g_2, i32 0, i64 2), align 2
  %conv6 = zext i16 %tmp5 to i32
  %call7 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str2, i32 0, i32 0), i32 %conv6)
  %tmp8 = volatile load i16* getelementptr inbounds ([7 x i16]* @g_2, i32 0, i64 3), align 2
  %conv9 = zext i16 %tmp8 to i32
  %call10 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str3, i32 0, i32 0), i32 %conv9)
  %tmp11 = volatile load i16* getelementptr inbounds ([7 x i16]* @g_2, i32 0, i64 4), align 2
  %conv12 = zext i16 %tmp11 to i32
  %call13 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str4, i32 0, i32 0), i32 %conv12)
  %tmp14 = volatile load i16* getelementptr inbounds ([7 x i16]* @g_2, i32 0, i64 5), align 2
  %conv15 = zext i16 %tmp14 to i32
  %call16 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str5, i32 0, i32 0), i32 %conv15)
  %tmp17 = volatile load i16* getelementptr inbounds ([7 x i16]* @g_2, i32 0, i64 6), align 2
  %conv18 = zext i16 %tmp17 to i32
  %call19 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str6, i32 0, i32 0), i32 %conv18)
  %tmp20 = volatile load i16* getelementptr inbounds ([7 x i16]* @g_2, i32 0, i64 1), align 2
  %conv21 = zext i16 %tmp20 to i32
  %call22 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str1, i32 0, i32 0), i32 %conv21)
  %tmp23 = volatile load i32* @g_4, align 4
  %call24 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str7, i32 0, i32 0), i32 %tmp23)
  %tmp25 = load i32* @g_12, align 4
  %call26 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str8, i32 0, i32 0), i32 %tmp25)
  %0 = load i32* %retval
  ret i32 %0
}

declare i32 @printf(i8*, ...)
