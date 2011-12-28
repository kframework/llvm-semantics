; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith000770.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_5 = global i32 0, align 4
@g_8 = global i32 1997174728, align 4
@g_7 = global i32* @g_8, align 8
@.str = private unnamed_addr constant [19 x i8] c"checksum g_5 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [19 x i8] c"checksum g_8 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %l_6 = alloca [2 x [7 x i32*]], align 16
  %l_9 = alloca i32**, align 8
  %l_12 = alloca [7 x [3 x [1 x i8]]], align 16
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  store i32** @g_7, i32*** %l_9, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc10, %entry
  %tmp = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp, 2
  br i1 %cmp, label %for.body, label %for.end13

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc, %for.body
  %tmp2 = load i32* %j, align 4
  %cmp3 = icmp slt i32 %tmp2, 7
  br i1 %cmp3, label %for.body4, label %for.end

for.body4:                                        ; preds = %for.cond1
  %tmp5 = load i32* %j, align 4
  %idxprom = sext i32 %tmp5 to i64
  %tmp6 = load i32* %i, align 4
  %idxprom7 = sext i32 %tmp6 to i64
  %arrayidx = getelementptr inbounds [2 x [7 x i32*]]* %l_6, i32 0, i64 %idxprom7
  %arrayidx8 = getelementptr inbounds [7 x i32*]* %arrayidx, i32 0, i64 %idxprom
  store i32* null, i32** %arrayidx8, align 8
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

for.cond14:                                       ; preds = %for.inc43, %for.end13
  %tmp15 = load i32* %i, align 4
  %cmp16 = icmp slt i32 %tmp15, 7
  br i1 %cmp16, label %for.body17, label %for.end46

for.body17:                                       ; preds = %for.cond14
  store i32 0, i32* %j, align 4
  br label %for.cond18

for.cond18:                                       ; preds = %for.inc39, %for.body17
  %tmp19 = load i32* %j, align 4
  %cmp20 = icmp slt i32 %tmp19, 3
  br i1 %cmp20, label %for.body21, label %for.end42

for.body21:                                       ; preds = %for.cond18
  store i32 0, i32* %k, align 4
  br label %for.cond22

for.cond22:                                       ; preds = %for.inc35, %for.body21
  %tmp23 = load i32* %k, align 4
  %cmp24 = icmp slt i32 %tmp23, 1
  br i1 %cmp24, label %for.body25, label %for.end38

for.body25:                                       ; preds = %for.cond22
  %tmp26 = load i32* %k, align 4
  %idxprom27 = sext i32 %tmp26 to i64
  %tmp28 = load i32* %j, align 4
  %idxprom29 = sext i32 %tmp28 to i64
  %tmp30 = load i32* %i, align 4
  %idxprom31 = sext i32 %tmp30 to i64
  %arrayidx32 = getelementptr inbounds [7 x [3 x [1 x i8]]]* %l_12, i32 0, i64 %idxprom31
  %arrayidx33 = getelementptr inbounds [3 x [1 x i8]]* %arrayidx32, i32 0, i64 %idxprom29
  %arrayidx34 = getelementptr inbounds [1 x i8]* %arrayidx33, i32 0, i64 %idxprom27
  store i8 -57, i8* %arrayidx34, align 1
  br label %for.inc35

for.inc35:                                        ; preds = %for.body25
  %tmp36 = load i32* %k, align 4
  %inc37 = add nsw i32 %tmp36, 1
  store i32 %inc37, i32* %k, align 4
  br label %for.cond22

for.end38:                                        ; preds = %for.cond22
  br label %for.inc39

for.inc39:                                        ; preds = %for.end38
  %tmp40 = load i32* %j, align 4
  %inc41 = add nsw i32 %tmp40, 1
  store i32 %inc41, i32* %j, align 4
  br label %for.cond18

for.end42:                                        ; preds = %for.cond18
  br label %for.inc43

for.inc43:                                        ; preds = %for.end42
  %tmp44 = load i32* %i, align 4
  %inc45 = add nsw i32 %tmp44, 1
  store i32 %inc45, i32* %i, align 4
  br label %for.cond14

for.end46:                                        ; preds = %for.cond14
  %tmp47 = volatile load i32** @g_7, align 8
  %tmp48 = load i32*** %l_9, align 8
  volatile store i32* %tmp47, i32** %tmp48
  volatile store i32 19, i32* @g_5, align 4
  br label %for.cond49

for.cond49:                                       ; preds = %for.inc55, %for.end46
  %tmp50 = volatile load i32* @g_5, align 4
  %cmp51 = icmp ule i32 %tmp50, 3
  br i1 %cmp51, label %for.body52, label %for.end58

for.body52:                                       ; preds = %for.cond49
  %tmp53 = volatile load i32** @g_7, align 8
  %tmp54 = volatile load i32* %tmp53
  store i32 %tmp54, i32* %retval
  br label %return

for.inc55:                                        ; No predecessors!
  %tmp56 = volatile load i32* @g_5, align 4
  %conv = trunc i32 %tmp56 to i16
  %call = call signext i16 @safe_add_func_int16_t_s_s(i16 signext %conv, i16 signext 1)
  %conv57 = sext i16 %call to i32
  volatile store i32 %conv57, i32* @g_5, align 4
  br label %for.cond49

for.end58:                                        ; preds = %for.cond49
  %arrayidx59 = getelementptr inbounds [7 x [3 x [1 x i8]]]* %l_12, i32 0, i64 0
  %arrayidx60 = getelementptr inbounds [3 x [1 x i8]]* %arrayidx59, i32 0, i64 2
  %arrayidx61 = getelementptr inbounds [1 x i8]* %arrayidx60, i32 0, i64 0
  %tmp62 = load i8* %arrayidx61, align 1
  %conv63 = zext i8 %tmp62 to i32
  store i32 %conv63, i32* %retval
  br label %return

return:                                           ; preds = %for.end58, %for.body52
  %0 = load i32* %retval
  ret i32 %0
}

define internal signext i16 @safe_add_func_int16_t_s_s(i16 signext %si1, i16 signext %si2) nounwind uwtable {
entry:
  %si1.addr = alloca i16, align 2
  %si2.addr = alloca i16, align 2
  store i16 %si1, i16* %si1.addr, align 2
  store i16 %si2, i16* %si2.addr, align 2
  %tmp = load i16* %si1.addr, align 2
  %conv = sext i16 %tmp to i32
  %tmp1 = load i16* %si2.addr, align 2
  %conv2 = sext i16 %tmp1 to i32
  %add = add nsw i32 %conv, %conv2
  %conv3 = trunc i32 %add to i16
  ret i16 %conv3
}

define i32* @func_2(i32* %p_3, i8 signext %p_4) nounwind uwtable {
entry:
  %p_3.addr = alloca i32*, align 8
  %p_4.addr = alloca i8, align 1
  store i32* %p_3, i32** %p_3.addr, align 8
  store i8 %p_4, i8* %p_4.addr, align 1
  %tmp = volatile load i32* @g_5, align 4
  %tmp1 = load i32** %p_3.addr, align 8
  store i32 %tmp, i32* %tmp1
  %tmp2 = load i32** %p_3.addr, align 8
  ret i32* %tmp2
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
  %tmp = volatile load i32* @g_5, align 4
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %tmp)
  %tmp2 = volatile load i32* @g_8, align 4
  %call3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str1, i32 0, i32 0), i32 %tmp2)
  %0 = load i32* %retval
  ret i32 %0
}

declare i32 @printf(i8*, ...)
