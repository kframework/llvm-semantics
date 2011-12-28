; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith000572.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = global i16 18942, align 2
@g_3 = global i8 -7, align 1
@g_12 = global i32 171075558, align 4
@g_11 = constant [1 x i32*] [i32* @g_12], align 8
@g_24 = global i32* @g_12, align 8
@g_23 = constant [3 x i32**] [i32** @g_24, i32** @g_24, i32** @g_24], align 16
@.str = private unnamed_addr constant [19 x i8] c"checksum g_2 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [19 x i8] c"checksum g_3 = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [20 x i8] c"checksum g_12 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define signext i16 @func_1() nounwind uwtable {
entry:
  %retval = alloca i16, align 2
  %l_16 = alloca i32*, align 8
  %l_15 = alloca i32**, align 8
  %l_28 = alloca i32, align 4
  %l_25 = alloca i16, align 2
  store i32* null, i32** %l_16, align 8
  store i32** %l_16, i32*** %l_15, align 8
  store i32 1778338986, i32* %l_28, align 4
  %tmp = volatile load i16* @g_2, align 2
  %conv = trunc i16 %tmp to i8
  volatile store i8 %conv, i8* @g_3, align 1
  %call = call i32* @func_4(i32* @g_12)
  %tmp1 = load i32*** %l_15, align 8
  store i32* %call, i32** %tmp1
  %tmp2 = load i32*** %l_15, align 8
  %tmp3 = load i32** %tmp2
  %cmp = icmp eq i32* null, %tmp3
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  store i16 1, i16* %l_25, align 2
  %tmp6 = load i32*** getelementptr inbounds ([3 x i32**]* @g_23, i32 0, i64 2), align 8
  %tmp7 = load i16* %l_25, align 2
  %conv8 = sext i16 %tmp7 to i64
  %tmp9 = load i32** %l_16, align 8
  %tmp10 = load i32* %tmp9
  %conv11 = trunc i32 %tmp10 to i8
  %tmp12 = load i16* %l_25, align 2
  %conv13 = trunc i16 %tmp12 to i8
  %call14 = call signext i8 @safe_sub_func_int8_t_s_s(i8 signext %conv11, i8 signext %conv13)
  %conv15 = sext i8 %call14 to i16
  %call16 = call i32 @func_17(i32** %tmp6, i64 %conv8, i16 signext %conv15)
  %tmp17 = load i32** %l_16, align 8
  store i32 %call16, i32* %tmp17
  %tmp18 = load i32* %l_28, align 4
  %tmp19 = load i32*** %l_15, align 8
  %tmp20 = load i32** %tmp19
  %tmp21 = load i32* %tmp20
  %xor = xor i32 %tmp21, %tmp18
  store i32 %xor, i32* %tmp20
  br label %if.end

if.else:                                          ; preds = %entry
  %tmp22 = volatile load i8* @g_3, align 1
  %conv23 = zext i8 %tmp22 to i16
  store i16 %conv23, i16* %retval
  br label %return

if.end:                                           ; preds = %if.then
  %tmp24 = volatile load i16* @g_2, align 2
  store i16 %tmp24, i16* %retval
  br label %return

return:                                           ; preds = %if.end, %if.else
  %0 = load i16* %retval
  ret i16 %0
}

define i32* @func_4(i32* %p_5) nounwind uwtable {
entry:
  %p_5.addr = alloca i32*, align 8
  %l_13 = alloca i16, align 2
  %l_14 = alloca i32, align 4
  %l_10 = alloca [7 x [10 x i32]], align 16
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32* %p_5, i32** %p_5.addr, align 8
  store i16 -1, i16* %l_13, align 2
  store i32 -2145855012, i32* %l_14, align 4
  %tmp = volatile load i8* @g_3, align 1
  %conv = zext i8 %tmp to i32
  %call = call zeroext i8 @safe_lshift_func_uint8_t_u_s(i8 zeroext 60, i32 -291331149)
  %conv1 = zext i8 %call to i32
  %cmp = icmp slt i32 %conv, %conv1
  %conv2 = zext i1 %cmp to i32
  %tmp3 = load i32** %p_5.addr, align 8
  store i32 %conv2, i32* %tmp3
  %tmp4 = volatile load i8* @g_3, align 1
  %conv5 = zext i8 %tmp4 to i32
  %tmp6 = load i32** %p_5.addr, align 8
  store i32 %conv5, i32* %tmp6
  volatile store i8 0, i8* @g_3, align 1
  br label %for.cond

for.cond:                                         ; preds = %for.inc64, %entry
  %tmp7 = volatile load i8* @g_3, align 1
  %conv8 = zext i8 %tmp7 to i32
  %cmp9 = icmp sge i32 %conv8, 9
  br i1 %cmp9, label %for.body, label %for.end69

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %i, align 4
  br label %for.cond14

for.cond14:                                       ; preds = %for.inc29, %for.body
  %tmp15 = load i32* %i, align 4
  %cmp16 = icmp slt i32 %tmp15, 7
  br i1 %cmp16, label %for.body18, label %for.end32

for.body18:                                       ; preds = %for.cond14
  store i32 0, i32* %j, align 4
  br label %for.cond19

for.cond19:                                       ; preds = %for.inc, %for.body18
  %tmp20 = load i32* %j, align 4
  %cmp21 = icmp slt i32 %tmp20, 10
  br i1 %cmp21, label %for.body23, label %for.end

for.body23:                                       ; preds = %for.cond19
  %tmp24 = load i32* %j, align 4
  %idxprom = sext i32 %tmp24 to i64
  %tmp25 = load i32* %i, align 4
  %idxprom26 = sext i32 %tmp25 to i64
  %arrayidx = getelementptr inbounds [7 x [10 x i32]]* %l_10, i32 0, i64 %idxprom26
  %arrayidx27 = getelementptr inbounds [10 x i32]* %arrayidx, i32 0, i64 %idxprom
  store i32 0, i32* %arrayidx27, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body23
  %tmp28 = load i32* %j, align 4
  %inc = add nsw i32 %tmp28, 1
  store i32 %inc, i32* %j, align 4
  br label %for.cond19

for.end:                                          ; preds = %for.cond19
  br label %for.inc29

for.inc29:                                        ; preds = %for.end
  %tmp30 = load i32* %i, align 4
  %inc31 = add nsw i32 %tmp30, 1
  store i32 %inc31, i32* %i, align 4
  br label %for.cond14

for.end32:                                        ; preds = %for.cond14
  volatile store i16 0, i16* @g_2, align 2
  br label %for.cond33

for.cond33:                                       ; preds = %for.inc58, %for.end32
  %tmp34 = volatile load i16* @g_2, align 2
  %conv35 = zext i16 %tmp34 to i32
  %cmp36 = icmp slt i32 %conv35, 7
  br i1 %cmp36, label %for.body38, label %for.end63

for.body38:                                       ; preds = %for.cond33
  volatile store i8 6, i8* @g_3, align 1
  br label %for.cond39

for.cond39:                                       ; preds = %for.inc53, %for.body38
  %tmp40 = volatile load i8* @g_3, align 1
  %conv41 = zext i8 %tmp40 to i32
  %cmp42 = icmp sge i32 %conv41, 0
  br i1 %cmp42, label %for.body44, label %for.end57

for.body44:                                       ; preds = %for.cond39
  %tmp45 = volatile load i32** getelementptr inbounds ([1 x i32*]* @g_11, i32 0, i64 0), align 8
  %tmp46 = load i32** %p_5.addr, align 8
  %cmp47 = icmp ne i32* %tmp45, %tmp46
  %conv48 = zext i1 %cmp47 to i32
  %tmp49 = load i32** %p_5.addr, align 8
  store i32 %conv48, i32* %tmp49
  %tmp50 = load i16* %l_13, align 2
  %conv51 = sext i16 %tmp50 to i32
  %tmp52 = load i32* %l_14, align 4
  %or = or i32 %tmp52, %conv51
  store i32 %or, i32* %l_14, align 4
  br label %for.inc53

for.inc53:                                        ; preds = %for.body44
  %tmp54 = volatile load i8* @g_3, align 1
  %conv55 = zext i8 %tmp54 to i32
  %add = add nsw i32 %conv55, -10
  %conv56 = trunc i32 %add to i8
  volatile store i8 %conv56, i8* @g_3, align 1
  br label %for.cond39

for.end57:                                        ; preds = %for.cond39
  br label %for.inc58

for.inc58:                                        ; preds = %for.end57
  %tmp59 = volatile load i16* @g_2, align 2
  %conv60 = zext i16 %tmp59 to i32
  %add61 = add nsw i32 %conv60, 3
  %conv62 = trunc i32 %add61 to i16
  volatile store i16 %conv62, i16* @g_2, align 2
  br label %for.cond33

for.end63:                                        ; preds = %for.cond33
  br label %for.inc64

for.inc64:                                        ; preds = %for.end63
  %tmp65 = volatile load i8* @g_3, align 1
  %conv66 = zext i8 %tmp65 to i64
  %call67 = call i64 @safe_add_func_uint64_t_u_u(i64 %conv66, i64 1)
  %conv68 = trunc i64 %call67 to i8
  volatile store i8 %conv68, i8* @g_3, align 1
  br label %for.cond

for.end69:                                        ; preds = %for.cond
  ret i32* @g_12
}

define i32 @func_17(i32** %p_18, i64 %p_19, i16 signext %p_20) nounwind uwtable {
entry:
  %p_18.addr = alloca i32**, align 8
  %p_19.addr = alloca i64, align 8
  %p_20.addr = alloca i16, align 2
  %l_21 = alloca i8, align 1
  %l_22 = alloca i32*, align 8
  store i32** %p_18, i32*** %p_18.addr, align 8
  store i64 %p_19, i64* %p_19.addr, align 8
  store i16 %p_20, i16* %p_20.addr, align 2
  store i8 -46, i8* %l_21, align 1
  store i32* @g_12, i32** %l_22, align 8
  %tmp = load i32** %l_22, align 8
  store i32 -46, i32* %tmp
  %tmp1 = load i64* %p_19.addr, align 8
  %conv = trunc i64 %tmp1 to i32
  ret i32 %conv
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

define internal zeroext i8 @safe_lshift_func_uint8_t_u_s(i8 zeroext %left, i32 %right) nounwind uwtable {
entry:
  %left.addr = alloca i8, align 1
  %right.addr = alloca i32, align 4
  store i8 %left, i8* %left.addr, align 1
  store i32 %right, i32* %right.addr, align 4
  %tmp = load i32* %right.addr, align 4
  %cmp = icmp slt i32 %tmp, 0
  br i1 %cmp, label %cond.true, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %tmp1 = load i32* %right.addr, align 4
  %cmp2 = icmp sge i32 %tmp1, 32
  br i1 %cmp2, label %cond.true, label %lor.lhs.false3

lor.lhs.false3:                                   ; preds = %lor.lhs.false
  %tmp4 = load i8* %left.addr, align 1
  %conv = zext i8 %tmp4 to i32
  %tmp5 = load i32* %right.addr, align 4
  %shr = ashr i32 255, %tmp5
  %cmp6 = icmp sgt i32 %conv, %shr
  br i1 %cmp6, label %cond.true, label %cond.false

cond.true:                                        ; preds = %lor.lhs.false3, %lor.lhs.false, %entry
  %tmp8 = load i8* %left.addr, align 1
  %conv9 = zext i8 %tmp8 to i32
  br label %cond.end

cond.false:                                       ; preds = %lor.lhs.false3
  %tmp10 = load i8* %left.addr, align 1
  %conv11 = zext i8 %tmp10 to i32
  %tmp12 = load i32* %right.addr, align 4
  %shl = shl i32 %conv11, %tmp12
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %conv9, %cond.true ], [ %shl, %cond.false ]
  %conv13 = trunc i32 %cond to i8
  ret i8 %conv13
}

define internal i64 @safe_add_func_uint64_t_u_u(i64 %ui1, i64 %ui2) nounwind uwtable {
entry:
  %ui1.addr = alloca i64, align 8
  %ui2.addr = alloca i64, align 8
  store i64 %ui1, i64* %ui1.addr, align 8
  store i64 %ui2, i64* %ui2.addr, align 8
  %tmp = load i64* %ui1.addr, align 8
  %tmp1 = load i64* %ui2.addr, align 8
  %add = add i64 %tmp, %tmp1
  ret i64 %add
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
  %call = call signext i16 @func_1()
  %tmp = volatile load i16* @g_2, align 2
  %conv = zext i16 %tmp to i32
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %conv)
  %tmp2 = volatile load i8* @g_3, align 1
  %conv3 = zext i8 %tmp2 to i32
  %call4 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str1, i32 0, i32 0), i32 %conv3)
  %tmp5 = load i32* @g_12, align 4
  %call6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str2, i32 0, i32 0), i32 %tmp5)
  %0 = load i32* %retval
  ret i32 %0
}

declare i32 @printf(i8*, ...)
