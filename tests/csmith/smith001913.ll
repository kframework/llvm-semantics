; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith001913.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_4 = global i16 -1, align 2
@g_13 = constant i8 -72, align 1
@g_17 = global i8 35, align 1
@.str = private unnamed_addr constant [19 x i8] c"checksum g_4 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [20 x i8] c"checksum g_13 = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [20 x i8] c"checksum g_17 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define zeroext i16 @func_1() nounwind uwtable {
entry:
  %l_14 = alloca i32, align 4
  %l_15 = alloca [5 x i32], align 16
  %l_16 = alloca [3 x [10 x i8]], align 16
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 0, i32* %l_14, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp, 5
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp1 = load i32* %i, align 4
  %idxprom = sext i32 %tmp1 to i64
  %arrayidx = getelementptr inbounds [5 x i32]* %l_15, i32 0, i64 %idxprom
  store i32 317967570, i32* %arrayidx, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %tmp2 = load i32* %i, align 4
  %inc = add nsw i32 %tmp2, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %i, align 4
  br label %for.cond3

for.cond3:                                        ; preds = %for.inc21, %for.end
  %tmp4 = load i32* %i, align 4
  %cmp5 = icmp slt i32 %tmp4, 3
  br i1 %cmp5, label %for.body6, label %for.end24

for.body6:                                        ; preds = %for.cond3
  store i32 0, i32* %j, align 4
  br label %for.cond7

for.cond7:                                        ; preds = %for.inc17, %for.body6
  %tmp8 = load i32* %j, align 4
  %cmp9 = icmp slt i32 %tmp8, 10
  br i1 %cmp9, label %for.body10, label %for.end20

for.body10:                                       ; preds = %for.cond7
  %tmp11 = load i32* %j, align 4
  %idxprom12 = sext i32 %tmp11 to i64
  %tmp13 = load i32* %i, align 4
  %idxprom14 = sext i32 %tmp13 to i64
  %arrayidx15 = getelementptr inbounds [3 x [10 x i8]]* %l_16, i32 0, i64 %idxprom14
  %arrayidx16 = getelementptr inbounds [10 x i8]* %arrayidx15, i32 0, i64 %idxprom12
  store i8 -9, i8* %arrayidx16, align 1
  br label %for.inc17

for.inc17:                                        ; preds = %for.body10
  %tmp18 = load i32* %j, align 4
  %inc19 = add nsw i32 %tmp18, 1
  store i32 %inc19, i32* %j, align 4
  br label %for.cond7

for.end20:                                        ; preds = %for.cond7
  br label %for.inc21

for.inc21:                                        ; preds = %for.end20
  %tmp22 = load i32* %i, align 4
  %inc23 = add nsw i32 %tmp22, 1
  store i32 %inc23, i32* %i, align 4
  br label %for.cond3

for.end24:                                        ; preds = %for.cond3
  %tmp25 = volatile load i16* @g_4, align 2
  %conv = zext i16 %tmp25 to i32
  %call = call i32 @func_7(i8 zeroext -72, i32 -72, i32 -72, i16 zeroext -72)
  %conv26 = trunc i32 %call to i8
  %tmp27 = load i32* %l_14, align 4
  %tobool = icmp ne i32 %tmp27, 0
  %land.ext = zext i1 %tobool to i32
  %conv28 = trunc i32 %land.ext to i8
  %call29 = call signext i8 @safe_mod_func_int8_t_s_s(i8 signext %conv26, i8 signext %conv28)
  %conv30 = sext i8 %call29 to i32
  %tmp31 = load i32* %l_14, align 4
  %conv32 = trunc i32 %tmp31 to i8
  %tmp33 = load i32* %l_14, align 4
  %call34 = call i32 @func_7(i8 zeroext %conv32, i32 -72, i32 %tmp33, i16 zeroext -72)
  %cmp35 = icmp slt i32 -72, %call34
  %conv36 = zext i1 %cmp35 to i32
  %cmp37 = icmp sgt i32 %conv30, %conv36
  %conv38 = zext i1 %cmp37 to i32
  %cmp39 = icmp sle i32 %conv, %conv38
  %conv40 = zext i1 %cmp39 to i32
  %arrayidx41 = getelementptr inbounds [5 x i32]* %l_15, i32 0, i64 3
  %tmp42 = load i32* %arrayidx41, align 4
  %and = and i32 %conv40, %tmp42
  %conv43 = trunc i32 %and to i8
  %arrayidx44 = getelementptr inbounds [3 x [10 x i8]]* %l_16, i32 0, i64 0
  %arrayidx45 = getelementptr inbounds [10 x i8]* %arrayidx44, i32 0, i64 6
  %tmp46 = load i8* %arrayidx45, align 1
  %call47 = call zeroext i8 @safe_add_func_uint8_t_u_u(i8 zeroext %conv43, i8 zeroext %tmp46)
  %conv48 = zext i8 %call47 to i32
  %tmp49 = load i8* @g_17, align 1
  %conv50 = sext i8 %tmp49 to i32
  %or = or i32 %conv50, %conv48
  %conv51 = trunc i32 %or to i8
  store i8 %conv51, i8* @g_17, align 1
  %arrayidx52 = getelementptr inbounds [3 x [10 x i8]]* %l_16, i32 0, i64 0
  %arrayidx53 = getelementptr inbounds [10 x i8]* %arrayidx52, i32 0, i64 6
  %tmp54 = load i8* %arrayidx53, align 1
  %conv55 = zext i8 %tmp54 to i16
  ret i16 %conv55
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

define i32 @func_7(i8 zeroext %p_8, i32 %p_9, i32 %p_10, i16 zeroext %p_11) nounwind uwtable {
entry:
  %p_8.addr = alloca i8, align 1
  %p_9.addr = alloca i32, align 4
  %p_10.addr = alloca i32, align 4
  %p_11.addr = alloca i16, align 2
  %l_12 = alloca i8, align 1
  store i8 %p_8, i8* %p_8.addr, align 1
  store i32 %p_9, i32* %p_9.addr, align 4
  store i32 %p_10, i32* %p_10.addr, align 4
  store i16 %p_11, i16* %p_11.addr, align 2
  store i8 -7, i8* %l_12, align 1
  %tmp = load i8* %l_12, align 1
  %conv = zext i8 %tmp to i32
  ret i32 %conv
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
  %tmp = volatile load i16* @g_4, align 2
  %conv = zext i16 %tmp to i32
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %conv)
  %call2 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str1, i32 0, i32 0), i32 -72)
  %tmp3 = load i8* @g_17, align 1
  %conv4 = sext i8 %tmp3 to i32
  %call5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str2, i32 0, i32 0), i32 %conv4)
  %0 = load i32* %retval
  ret i32 %0
}

declare i32 @printf(i8*, ...)
