; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith001925.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = global i32 0, align 4
@g_13 = global i32 0, align 4
@g_25 = global i32* null, align 8
@g_24 = global i32** @g_25, align 8
@.str = private unnamed_addr constant [19 x i8] c"checksum g_2 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [20 x i8] c"checksum g_13 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define zeroext i16 @func_1() nounwind uwtable {
entry:
  %l_17 = alloca [10 x i8], align 1
  %i = alloca i32, align 4
  %l_14 = alloca i32, align 4
  %l_16 = alloca i32*, align 8
  %l_15 = alloca i32**, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp, 10
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp1 = load i32* %i, align 4
  %idxprom = sext i32 %tmp1 to i64
  %arrayidx = getelementptr inbounds [10 x i8]* %l_17, i32 0, i64 %idxprom
  store i8 1, i8* %arrayidx, align 1
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %tmp2 = load i32* %i, align 4
  %inc = add nsw i32 %tmp2, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  volatile store i32 -26, i32* @g_2, align 4
  br label %for.cond3

for.cond3:                                        ; preds = %for.inc42, %for.end
  %tmp4 = volatile load i32* @g_2, align 4
  %cmp5 = icmp eq i32 %tmp4, -12
  br i1 %cmp5, label %for.body6, label %for.end47

for.body6:                                        ; preds = %for.cond3
  store i32 -764396133, i32* %l_14, align 4
  store i32* null, i32** %l_16, align 8
  store i32** %l_16, i32*** %l_15, align 8
  %tmp10 = load i32* @g_13, align 4
  %conv = sext i32 %tmp10 to i64
  %call = call i32* @func_5(i32* null, i64 %conv, i16 zeroext 15771)
  %tmp11 = load i32*** %l_15, align 8
  store i32* %call, i32** %tmp11
  volatile store i32 0, i32* @g_2, align 4
  br label %for.cond12

for.cond12:                                       ; preds = %for.inc20, %for.body6
  %tmp13 = volatile load i32* @g_2, align 4
  %cmp14 = icmp slt i32 %tmp13, 10
  br i1 %cmp14, label %for.body16, label %for.end22

for.body16:                                       ; preds = %for.cond12
  %tmp17 = volatile load i32* @g_2, align 4
  %idxprom18 = sext i32 %tmp17 to i64
  %arrayidx19 = getelementptr inbounds [10 x i8]* %l_17, i32 0, i64 %idxprom18
  store i8 1, i8* %arrayidx19, align 1
  br label %for.inc20

for.inc20:                                        ; preds = %for.body16
  %tmp21 = volatile load i32* @g_2, align 4
  %add = add nsw i32 %tmp21, 1
  volatile store i32 %add, i32* @g_2, align 4
  br label %for.cond12

for.end22:                                        ; preds = %for.cond12
  %call23 = call zeroext i16 @safe_mul_func_uint16_t_u_u(i16 zeroext 0, i16 zeroext -10)
  %conv24 = zext i16 %call23 to i32
  %tmp25 = load i32* @g_13, align 4
  %conv26 = trunc i32 %tmp25 to i16
  %call27 = call signext i16 @safe_lshift_func_int16_t_s_u(i16 signext %conv26, i32 -3)
  %conv28 = sext i16 %call27 to i32
  %cmp29 = icmp slt i32 %conv24, %conv28
  %conv30 = zext i1 %cmp29 to i32
  %tmp31 = load i32** %l_16, align 8
  store i32 %conv30, i32* %tmp31
  store i32 0, i32* @g_13, align 4
  br label %for.cond32

for.cond32:                                       ; preds = %for.inc38, %for.end22
  %tmp33 = load i32* @g_13, align 4
  %cmp34 = icmp ne i32 %tmp33, 0
  br i1 %cmp34, label %for.body36, label %for.end41

for.body36:                                       ; preds = %for.cond32
  %tmp37 = load i32*** %l_15, align 8
  store i32* null, i32** %tmp37
  br label %for.inc38

for.inc38:                                        ; preds = %for.body36
  %tmp39 = load i32* @g_13, align 4
  %call40 = call i32 @safe_sub_func_uint32_t_u_u(i32 %tmp39, i32 1)
  store i32 %call40, i32* @g_13, align 4
  br label %for.cond32

for.end41:                                        ; preds = %for.cond32
  br label %for.inc42

for.inc42:                                        ; preds = %for.end41
  %tmp43 = volatile load i32* @g_2, align 4
  %conv44 = trunc i32 %tmp43 to i8
  %call45 = call zeroext i8 @safe_sub_func_uint8_t_u_u(i8 zeroext %conv44, i8 zeroext 5)
  %conv46 = zext i8 %call45 to i32
  volatile store i32 %conv46, i32* @g_2, align 4
  br label %for.cond3

for.end47:                                        ; preds = %for.cond3
  %tmp48 = volatile load i32*** @g_24, align 8
  store i32* @g_2, i32** %tmp48
  %tmp49 = volatile load i32* @g_2, align 4
  %conv50 = trunc i32 %tmp49 to i16
  ret i16 %conv50
}

define i32* @func_5(i32* %p_6, i64 %p_7, i16 zeroext %p_8) nounwind uwtable {
entry:
  %p_6.addr = alloca i32*, align 8
  %p_7.addr = alloca i64, align 8
  %p_8.addr = alloca i16, align 2
  %l_11 = alloca i32, align 4
  %l_12 = alloca i32*, align 8
  store i32* %p_6, i32** %p_6.addr, align 8
  store i64 %p_7, i64* %p_7.addr, align 8
  store i16 %p_8, i16* %p_8.addr, align 2
  store i32 1274613468, i32* %l_11, align 4
  store i32* @g_13, i32** %l_12, align 8
  %call = call signext i8 @safe_mod_func_int8_t_s_s(i8 signext -36, i8 signext -36)
  %conv = sext i8 %call to i32
  %tmp = load i32** %l_12, align 8
  store i32 %conv, i32* %tmp
  ret i32* @g_13
}

define internal zeroext i16 @safe_mul_func_uint16_t_u_u(i16 zeroext %ui1, i16 zeroext %ui2) nounwind uwtable {
entry:
  %ui1.addr = alloca i16, align 2
  %ui2.addr = alloca i16, align 2
  store i16 %ui1, i16* %ui1.addr, align 2
  store i16 %ui2, i16* %ui2.addr, align 2
  %tmp = load i16* %ui1.addr, align 2
  %conv = zext i16 %tmp to i32
  %tmp1 = load i16* %ui2.addr, align 2
  %conv2 = zext i16 %tmp1 to i32
  %mul = mul i32 %conv, %conv2
  %conv3 = trunc i32 %mul to i16
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

define internal i32 @safe_sub_func_uint32_t_u_u(i32 %ui1, i32 %ui2) nounwind uwtable {
entry:
  %ui1.addr = alloca i32, align 4
  %ui2.addr = alloca i32, align 4
  store i32 %ui1, i32* %ui1.addr, align 4
  store i32 %ui2, i32* %ui2.addr, align 4
  %tmp = load i32* %ui1.addr, align 4
  %tmp1 = load i32* %ui2.addr, align 4
  %sub = sub i32 %tmp, %tmp1
  ret i32 %sub
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

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  %call = call zeroext i16 @func_1()
  %tmp = volatile load i32* @g_2, align 4
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %tmp)
  %tmp2 = load i32* @g_13, align 4
  %call3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str1, i32 0, i32 0), i32 %tmp2)
  %0 = load i32* %retval
  ret i32 %0
}

declare i32 @printf(i8*, ...)
