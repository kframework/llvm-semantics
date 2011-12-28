; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith000853.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_4 = global i32 -112248957, align 4
@g_3 = global i32* @g_4, align 8
@.str = private unnamed_addr constant [19 x i8] c"checksum g_4 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i64 @func_1() nounwind uwtable {
entry:
  %l_2 = alloca i32, align 4
  %l_7 = alloca i32, align 4
  %l_8 = alloca [2 x [2 x i32]], align 16
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 217412110, i32* %l_2, align 4
  store i32 1, i32* %l_7, align 4
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
  %cmp3 = icmp slt i32 %tmp2, 2
  br i1 %cmp3, label %for.body4, label %for.end

for.body4:                                        ; preds = %for.cond1
  %tmp5 = load i32* %j, align 4
  %idxprom = sext i32 %tmp5 to i64
  %tmp6 = load i32* %i, align 4
  %idxprom7 = sext i32 %tmp6 to i64
  %arrayidx = getelementptr inbounds [2 x [2 x i32]]* %l_8, i32 0, i64 %idxprom7
  %arrayidx8 = getelementptr inbounds [2 x i32]* %arrayidx, i32 0, i64 %idxprom
  store i32 -944809224, i32* %arrayidx8, align 4
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
  %tmp14 = load i32* %l_2, align 4
  %tmp15 = volatile load i32** @g_3, align 8
  %tmp16 = load i32* %tmp15
  %and = and i32 %tmp16, %tmp14
  store i32 %and, i32* %tmp15
  %tmp17 = volatile load i32** @g_3, align 8
  %tmp18 = load i32* %tmp17
  %tobool = icmp ne i32 %tmp18, 0
  %lnot = xor i1 %tobool, true
  %lnot.ext = zext i1 %lnot to i32
  %cmp19 = icmp ne i32 %lnot.ext, 1
  %conv = zext i1 %cmp19 to i32
  %tmp20 = load i32* %l_7, align 4
  %call = call i32 @safe_sub_func_int32_t_s_s(i32 %conv, i32 %tmp20)
  %arrayidx21 = getelementptr inbounds [2 x [2 x i32]]* %l_8, i32 0, i64 1
  %arrayidx22 = getelementptr inbounds [2 x i32]* %arrayidx21, i32 0, i64 1
  %tmp23 = load i32* %arrayidx22, align 4
  %or = or i32 %tmp23, %call
  store i32 %or, i32* %arrayidx22, align 4
  %tmp24 = load i32* @g_4, align 4
  %conv25 = sext i32 %tmp24 to i64
  ret i64 %conv25
}

define internal i32 @safe_sub_func_int32_t_s_s(i32 %si1, i32 %si2) nounwind uwtable {
entry:
  %si1.addr = alloca i32, align 4
  %si2.addr = alloca i32, align 4
  store i32 %si1, i32* %si1.addr, align 4
  store i32 %si2, i32* %si2.addr, align 4
  %tmp = load i32* %si1.addr, align 4
  %tmp1 = load i32* %si2.addr, align 4
  %xor = xor i32 %tmp, %tmp1
  %tmp2 = load i32* %si1.addr, align 4
  %tmp3 = load i32* %si1.addr, align 4
  %tmp4 = load i32* %si2.addr, align 4
  %xor5 = xor i32 %tmp3, %tmp4
  %and = and i32 %xor5, -2147483648
  %xor6 = xor i32 %tmp2, %and
  %tmp7 = load i32* %si2.addr, align 4
  %sub = sub nsw i32 %xor6, %tmp7
  %tmp8 = load i32* %si2.addr, align 4
  %xor9 = xor i32 %sub, %tmp8
  %and10 = and i32 %xor, %xor9
  %cmp = icmp slt i32 %and10, 0
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %tmp11 = load i32* %si1.addr, align 4
  br label %cond.end

cond.false:                                       ; preds = %entry
  %tmp12 = load i32* %si1.addr, align 4
  %tmp13 = load i32* %si2.addr, align 4
  %sub14 = sub nsw i32 %tmp12, %tmp13
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %tmp11, %cond.true ], [ %sub14, %cond.false ]
  ret i32 %cond
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
  %tmp = load i32* @g_4, align 4
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %tmp)
  %0 = load i32* %retval
  ret i32 %0
}

declare i32 @printf(i8*, ...)
