; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith001084.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_11 = global i32 -2, align 4
@g_15 = global [5 x i32*] [i32* @g_11, i32* @g_11, i32* @g_11, i32* @g_11, i32* @g_11], align 16
@g_14 = global i32** bitcast (i8* getelementptr (i8* bitcast ([5 x i32*]* @g_15 to i8*), i64 24) to i32**), align 8
@g_17 = global i32* @g_11, align 8
@.str = private unnamed_addr constant [20 x i8] c"checksum g_11 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define signext i8 @func_1() nounwind uwtable {
entry:
  %l_13 = alloca i32*, align 8
  %l_16 = alloca i32**, align 8
  %l_19 = alloca i32**, align 8
  %l_18 = alloca i32***, align 8
  store i32* null, i32** %l_13, align 8
  store i32** %l_13, i32*** %l_16, align 8
  store i32** %l_13, i32*** %l_19, align 8
  store i32*** %l_19, i32**** %l_18, align 8
  %tmp = load i32** %l_13, align 8
  %tmp1 = load i32** %l_13, align 8
  %tmp2 = load i32* @g_11, align 4
  %tmp3 = load i32** %l_13, align 8
  %call = call i32* @func_2(i32* %tmp, i32* %tmp1, i32 %tmp2, i16 signext 15682, i32* %tmp3)
  %tmp4 = volatile load i32*** @g_14, align 8
  store i32* %call, i32** %tmp4
  %tmp5 = load i32*** %l_16, align 8
  %cmp = icmp ne i32** null, %tmp5
  %conv = zext i1 %cmp to i32
  %tmp6 = volatile load i32** @g_17, align 8
  %tmp7 = load i32* %tmp6
  %and = and i32 %tmp7, %conv
  store i32 %and, i32* %tmp6
  %tmp8 = load i32**** %l_18, align 8
  store i32** null, i32*** %tmp8
  %tmp9 = load i32* @g_11, align 4
  %conv10 = trunc i32 %tmp9 to i8
  ret i8 %conv10
}

define i32* @func_2(i32* %p_3, i32* %p_4, i32 %p_5, i16 signext %p_6, i32* %p_7) nounwind uwtable {
entry:
  %retval = alloca i32*, align 8
  %p_3.addr = alloca i32*, align 8
  %p_4.addr = alloca i32*, align 8
  %p_5.addr = alloca i32, align 4
  %p_6.addr = alloca i16, align 2
  %p_7.addr = alloca i32*, align 8
  %l_10 = alloca i32*, align 8
  %l_12 = alloca [4 x [5 x [1 x i32*]]], align 16
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  store i32* %p_3, i32** %p_3.addr, align 8
  store i32* %p_4, i32** %p_4.addr, align 8
  store i32 %p_5, i32* %p_5.addr, align 4
  store i16 %p_6, i16* %p_6.addr, align 2
  store i32* %p_7, i32** %p_7.addr, align 8
  store i32* @g_11, i32** %l_10, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc21, %entry
  %tmp = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp, 4
  br i1 %cmp, label %for.body, label %for.end24

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc17, %for.body
  %tmp2 = load i32* %j, align 4
  %cmp3 = icmp slt i32 %tmp2, 5
  br i1 %cmp3, label %for.body4, label %for.end20

for.body4:                                        ; preds = %for.cond1
  store i32 0, i32* %k, align 4
  br label %for.cond5

for.cond5:                                        ; preds = %for.inc, %for.body4
  %tmp6 = load i32* %k, align 4
  %cmp7 = icmp slt i32 %tmp6, 1
  br i1 %cmp7, label %for.body8, label %for.end

for.body8:                                        ; preds = %for.cond5
  %tmp9 = load i32* %k, align 4
  %idxprom = sext i32 %tmp9 to i64
  %tmp10 = load i32* %j, align 4
  %idxprom11 = sext i32 %tmp10 to i64
  %tmp12 = load i32* %i, align 4
  %idxprom13 = sext i32 %tmp12 to i64
  %arrayidx = getelementptr inbounds [4 x [5 x [1 x i32*]]]* %l_12, i32 0, i64 %idxprom13
  %arrayidx14 = getelementptr inbounds [5 x [1 x i32*]]* %arrayidx, i32 0, i64 %idxprom11
  %arrayidx15 = getelementptr inbounds [1 x i32*]* %arrayidx14, i32 0, i64 %idxprom
  store i32* null, i32** %arrayidx15, align 8
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
  store i16 0, i16* %p_6.addr, align 2
  br label %for.cond25

for.cond25:                                       ; preds = %for.inc31, %for.end24
  %tmp26 = load i16* %p_6.addr, align 2
  %conv = sext i16 %tmp26 to i32
  %cmp27 = icmp eq i32 %conv, -5
  br i1 %cmp27, label %for.body29, label %for.end35

for.body29:                                       ; preds = %for.cond25
  %tmp30 = load i32** %l_10, align 8
  store i32* %tmp30, i32** %retval
  br label %return

for.inc31:                                        ; No predecessors!
  %tmp32 = load i16* %p_6.addr, align 2
  %conv33 = sext i16 %tmp32 to i32
  %call = call i32 @safe_add_func_int32_t_s_s(i32 %conv33, i32 0)
  %conv34 = trunc i32 %call to i16
  store i16 %conv34, i16* %p_6.addr, align 2
  br label %for.cond25

for.end35:                                        ; preds = %for.cond25
  %arrayidx36 = getelementptr inbounds [4 x [5 x [1 x i32*]]]* %l_12, i32 0, i64 0
  %arrayidx37 = getelementptr inbounds [5 x [1 x i32*]]* %arrayidx36, i32 0, i64 3
  %arrayidx38 = getelementptr inbounds [1 x i32*]* %arrayidx37, i32 0, i64 0
  %tmp39 = load i32** %arrayidx38, align 8
  store i32* %tmp39, i32** %retval
  br label %return

return:                                           ; preds = %for.end35, %for.body29
  %0 = load i32** %retval
  ret i32* %0
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
  %tmp = load i32* @g_11, align 4
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str, i32 0, i32 0), i32 %tmp)
  %0 = load i32* %retval
  ret i32 %0
}

declare i32 @printf(i8*, ...)
