; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith001135.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_7 = global i32 1, align 4
@g_6 = constant i32* @g_7, align 8
@g_8 = global i32* @g_7, align 8
@.str = private unnamed_addr constant [19 x i8] c"checksum g_7 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable {
entry:
  %l_4 = alloca [3 x [9 x i32]], align 16
  %l_5 = alloca i32*, align 8
  %l_9 = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32* null, i32** %l_5, align 8
  store i32 -1, i32* %l_9, align 4
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
  %arrayidx = getelementptr inbounds [3 x [9 x i32]]* %l_4, i32 0, i64 %idxprom7
  %arrayidx8 = getelementptr inbounds [9 x i32]* %arrayidx, i32 0, i64 %idxprom
  store i32 3, i32* %arrayidx8, align 4
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
  %arrayidx14 = getelementptr inbounds [3 x [9 x i32]]* %l_4, i32 0, i64 0
  %arrayidx15 = getelementptr inbounds [9 x i32]* %arrayidx14, i32 0, i64 4
  %tmp16 = load i32* %arrayidx15, align 4
  %conv = zext i32 %tmp16 to i64
  %arrayidx17 = getelementptr inbounds [3 x [9 x i32]]* %l_4, i32 0, i64 1
  %arrayidx18 = getelementptr inbounds [9 x i32]* %arrayidx17, i32 0, i64 6
  %tmp19 = load i32* %arrayidx18, align 4
  %conv20 = zext i32 %tmp19 to i64
  %call = call i64 @safe_div_func_int64_t_s_s(i64 %conv, i64 %conv20)
  %tmp21 = volatile load i32** @g_6, align 8
  %tmp22 = load i32* %tmp21
  %conv23 = sext i32 %tmp22 to i64
  %xor = xor i64 %conv23, %call
  %conv24 = trunc i64 %xor to i32
  store i32 %conv24, i32* %tmp21
  %tmp25 = volatile load i32** @g_6, align 8
  %tmp26 = load i32* %tmp25
  %conv27 = sext i32 %tmp26 to i64
  %and = and i64 -9, %conv27
  %conv28 = trunc i64 %and to i32
  %tmp29 = volatile load i32** @g_8, align 8
  store i32 %conv28, i32* %tmp29
  %tmp30 = volatile load i32** @g_6, align 8
  %tmp31 = load i32* %tmp30
  %conv32 = sext i32 %tmp31 to i64
  %cmp33 = icmp slt i64 %conv32, 410561473
  %conv34 = zext i1 %cmp33 to i32
  %tmp35 = load i32* @g_7, align 4
  %tmp36 = load i32* @g_7, align 4
  %tobool = icmp ne i32 %tmp36, 0
  br i1 %tobool, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %for.end13
  br label %land.end

land.end:                                         ; preds = %land.rhs, %for.end13
  %0 = phi i1 [ false, %for.end13 ], [ true, %land.rhs ]
  %land.ext = zext i1 %0 to i32
  %conv37 = sext i32 %land.ext to i64
  %cmp38 = icmp sgt i64 2940362591, %conv37
  %conv39 = zext i1 %cmp38 to i32
  %cmp40 = icmp ne i32 %tmp35, %conv39
  %conv41 = zext i1 %cmp40 to i32
  %or = or i32 %conv34, %conv41
  store i32 %or, i32* %l_9, align 4
  %arrayidx42 = getelementptr inbounds [3 x [9 x i32]]* %l_4, i32 0, i64 0
  %arrayidx43 = getelementptr inbounds [9 x i32]* %arrayidx42, i32 0, i64 4
  %tmp44 = load i32* %arrayidx43, align 4
  ret i32 %tmp44
}

define internal i64 @safe_div_func_int64_t_s_s(i64 %si1, i64 %si2) nounwind uwtable {
entry:
  %si1.addr = alloca i64, align 8
  %si2.addr = alloca i64, align 8
  store i64 %si1, i64* %si1.addr, align 8
  store i64 %si2, i64* %si2.addr, align 8
  %tmp = load i64* %si2.addr, align 8
  %cmp = icmp eq i64 %tmp, 0
  br i1 %cmp, label %cond.true, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %tmp1 = load i64* %si1.addr, align 8
  %cmp2 = icmp eq i64 %tmp1, -9223372036854775808
  br i1 %cmp2, label %land.lhs.true, label %cond.false

land.lhs.true:                                    ; preds = %lor.lhs.false
  %tmp3 = load i64* %si2.addr, align 8
  %cmp4 = icmp eq i64 %tmp3, -1
  br i1 %cmp4, label %cond.true, label %cond.false

cond.true:                                        ; preds = %land.lhs.true, %entry
  %tmp5 = load i64* %si1.addr, align 8
  br label %cond.end

cond.false:                                       ; preds = %land.lhs.true, %lor.lhs.false
  %tmp6 = load i64* %si1.addr, align 8
  %tmp7 = load i64* %si2.addr, align 8
  %div = sdiv i64 %tmp6, %tmp7
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i64 [ %tmp5, %cond.true ], [ %div, %cond.false ]
  ret i64 %cond
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
  %tmp = load i32* @g_7, align 4
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %tmp)
  %0 = load i32* %retval
  ret i32 %0
}

declare i32 @printf(i8*, ...)
