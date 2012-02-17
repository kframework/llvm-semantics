; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith001363.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_8 = global i32 -1, align 4
@g_7 = global i32* @g_8, align 8
@.str = private unnamed_addr constant [19 x i8] c"checksum g_8 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i64 @func_1() nounwind uwtable {
entry:
  %l_9 = alloca i8, align 1
  store i8 -1, i8* %l_9, align 1
  %tmp = load i8* %l_9, align 1
  %conv = sext i8 %tmp to i64
  %tmp1 = volatile load i32** @g_7, align 8
  %tmp2 = load i32* %tmp1
  %neg = xor i32 %tmp2, -1
  %call = call i32 @func_2(i64 %conv, i32 %neg)
  %tmp3 = volatile load i32** @g_7, align 8
  store i32 %call, i32* %tmp3
  %tmp4 = load i8* %l_9, align 1
  %conv5 = sext i8 %tmp4 to i64
  ret i64 %conv5
}

define i32 @func_2(i64 %p_3, i32 %p_4) nounwind uwtable {
entry:
  %p_3.addr = alloca i64, align 8
  %p_4.addr = alloca i32, align 4
  %l_5 = alloca [9 x [10 x [1 x i32]]], align 16
  %l_6 = alloca i32*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  store i64 %p_3, i64* %p_3.addr, align 8
  store i32 %p_4, i32* %p_4.addr, align 4
  store i32* null, i32** %l_6, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc21, %entry
  %tmp = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp, 9
  br i1 %cmp, label %for.body, label %for.end24

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc17, %for.body
  %tmp2 = load i32* %j, align 4
  %cmp3 = icmp slt i32 %tmp2, 10
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
  %arrayidx = getelementptr inbounds [9 x [10 x [1 x i32]]]* %l_5, i32 0, i64 %idxprom13
  %arrayidx14 = getelementptr inbounds [10 x [1 x i32]]* %arrayidx, i32 0, i64 %idxprom11
  %arrayidx15 = getelementptr inbounds [1 x i32]* %arrayidx14, i32 0, i64 %idxprom
  store i32 0, i32* %arrayidx15, align 4
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
  %arrayidx25 = getelementptr inbounds [9 x [10 x [1 x i32]]]* %l_5, i32 0, i64 8
  %arrayidx26 = getelementptr inbounds [10 x [1 x i32]]* %arrayidx25, i32 0, i64 1
  %arrayidx27 = getelementptr inbounds [1 x i32]* %arrayidx26, i32 0, i64 0
  %tmp28 = load i32* %arrayidx27, align 4
  %arrayidx29 = getelementptr inbounds [9 x [10 x [1 x i32]]]* %l_5, i32 0, i64 8
  %arrayidx30 = getelementptr inbounds [10 x [1 x i32]]* %arrayidx29, i32 0, i64 1
  %arrayidx31 = getelementptr inbounds [1 x i32]* %arrayidx30, i32 0, i64 0
  %tmp32 = load i32* %arrayidx31, align 4
  %cmp33 = icmp uge i32 %tmp28, %tmp32
  %conv = zext i1 %cmp33 to i32
  %tmp34 = load i32* %p_4.addr, align 4
  %and = and i32 %conv, %tmp34
  %neg = xor i32 %and, -1
  %tmp35 = volatile load i32** @g_7, align 8
  store i32 %neg, i32* %tmp35
  %tmp36 = load i64* %p_3.addr, align 8
  %conv37 = trunc i64 %tmp36 to i32
  ret i32 %conv37
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
  %tmp = load i32* @g_8, align 4
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %tmp)
  %0 = load i32* %retval
  ret i32 %0
}

declare i32 @printf(i8*, ...)
