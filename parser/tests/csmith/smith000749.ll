; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith000749.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = global i32 0, align 4
@.str = private unnamed_addr constant [19 x i8] c"checksum g_2 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %l_7 = alloca [7 x [2 x [1 x [6 x [1 x i32*]]]]], align 16
  %l_6 = alloca i32**, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %l = alloca i32, align 4
  %m = alloca i32, align 4
  %l_5 = alloca i8, align 1
  %arrayidx = getelementptr inbounds [7 x [2 x [1 x [6 x [1 x i32*]]]]]* %l_7, i32 0, i64 1
  %arrayidx1 = getelementptr inbounds [2 x [1 x [6 x [1 x i32*]]]]* %arrayidx, i32 0, i64 0
  %arrayidx2 = getelementptr inbounds [1 x [6 x [1 x i32*]]]* %arrayidx1, i32 0, i64 0
  %arrayidx3 = getelementptr inbounds [6 x [1 x i32*]]* %arrayidx2, i32 0, i64 1
  %arrayidx4 = getelementptr inbounds [1 x i32*]* %arrayidx3, i32 0, i64 0
  store i32** %arrayidx4, i32*** %l_6, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc48, %entry
  %tmp = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp, 7
  br i1 %cmp, label %for.body, label %for.end51

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4
  br label %for.cond5

for.cond5:                                        ; preds = %for.inc44, %for.body
  %tmp6 = load i32* %j, align 4
  %cmp7 = icmp slt i32 %tmp6, 2
  br i1 %cmp7, label %for.body8, label %for.end47

for.body8:                                        ; preds = %for.cond5
  store i32 0, i32* %k, align 4
  br label %for.cond9

for.cond9:                                        ; preds = %for.inc40, %for.body8
  %tmp10 = load i32* %k, align 4
  %cmp11 = icmp slt i32 %tmp10, 1
  br i1 %cmp11, label %for.body12, label %for.end43

for.body12:                                       ; preds = %for.cond9
  store i32 0, i32* %l, align 4
  br label %for.cond13

for.cond13:                                       ; preds = %for.inc36, %for.body12
  %tmp14 = load i32* %l, align 4
  %cmp15 = icmp slt i32 %tmp14, 6
  br i1 %cmp15, label %for.body16, label %for.end39

for.body16:                                       ; preds = %for.cond13
  store i32 0, i32* %m, align 4
  br label %for.cond17

for.cond17:                                       ; preds = %for.inc, %for.body16
  %tmp18 = load i32* %m, align 4
  %cmp19 = icmp slt i32 %tmp18, 1
  br i1 %cmp19, label %for.body20, label %for.end

for.body20:                                       ; preds = %for.cond17
  %tmp21 = load i32* %m, align 4
  %idxprom = sext i32 %tmp21 to i64
  %tmp22 = load i32* %l, align 4
  %idxprom23 = sext i32 %tmp22 to i64
  %tmp24 = load i32* %k, align 4
  %idxprom25 = sext i32 %tmp24 to i64
  %tmp26 = load i32* %j, align 4
  %idxprom27 = sext i32 %tmp26 to i64
  %tmp28 = load i32* %i, align 4
  %idxprom29 = sext i32 %tmp28 to i64
  %arrayidx30 = getelementptr inbounds [7 x [2 x [1 x [6 x [1 x i32*]]]]]* %l_7, i32 0, i64 %idxprom29
  %arrayidx31 = getelementptr inbounds [2 x [1 x [6 x [1 x i32*]]]]* %arrayidx30, i32 0, i64 %idxprom27
  %arrayidx32 = getelementptr inbounds [1 x [6 x [1 x i32*]]]* %arrayidx31, i32 0, i64 %idxprom25
  %arrayidx33 = getelementptr inbounds [6 x [1 x i32*]]* %arrayidx32, i32 0, i64 %idxprom23
  %arrayidx34 = getelementptr inbounds [1 x i32*]* %arrayidx33, i32 0, i64 %idxprom
  store i32* @g_2, i32** %arrayidx34, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body20
  %tmp35 = load i32* %m, align 4
  %inc = add nsw i32 %tmp35, 1
  store i32 %inc, i32* %m, align 4
  br label %for.cond17

for.end:                                          ; preds = %for.cond17
  br label %for.inc36

for.inc36:                                        ; preds = %for.end
  %tmp37 = load i32* %l, align 4
  %inc38 = add nsw i32 %tmp37, 1
  store i32 %inc38, i32* %l, align 4
  br label %for.cond13

for.end39:                                        ; preds = %for.cond13
  br label %for.inc40

for.inc40:                                        ; preds = %for.end39
  %tmp41 = load i32* %k, align 4
  %inc42 = add nsw i32 %tmp41, 1
  store i32 %inc42, i32* %k, align 4
  br label %for.cond9

for.end43:                                        ; preds = %for.cond9
  br label %for.inc44

for.inc44:                                        ; preds = %for.end43
  %tmp45 = load i32* %j, align 4
  %inc46 = add nsw i32 %tmp45, 1
  store i32 %inc46, i32* %j, align 4
  br label %for.cond5

for.end47:                                        ; preds = %for.cond5
  br label %for.inc48

for.inc48:                                        ; preds = %for.end47
  %tmp49 = load i32* %i, align 4
  %inc50 = add nsw i32 %tmp49, 1
  store i32 %inc50, i32* %i, align 4
  br label %for.cond

for.end51:                                        ; preds = %for.cond
  store i32 0, i32* @g_2, align 4
  br label %for.cond52

for.cond52:                                       ; preds = %for.inc58, %for.end51
  %tmp53 = load i32* @g_2, align 4
  %cmp54 = icmp sgt i32 %tmp53, 0
  br i1 %cmp54, label %for.body55, label %for.end60

for.body55:                                       ; preds = %for.cond52
  store i8 1, i8* %l_5, align 1
  %tmp57 = load i8* %l_5, align 1
  %conv = zext i8 %tmp57 to i32
  store i32 %conv, i32* %retval
  br label %return

for.inc58:                                        ; No predecessors!
  %tmp59 = load i32* @g_2, align 4
  %call = call i32 @safe_add_func_uint32_t_u_u(i32 %tmp59, i32 1)
  store i32 %call, i32* @g_2, align 4
  br label %for.cond52

for.end60:                                        ; preds = %for.cond52
  %tmp61 = load i32*** %l_6, align 8
  store i32* @g_2, i32** %tmp61
  %tmp62 = load i32*** %l_6, align 8
  %tmp63 = load i32** %tmp62
  %tmp64 = load i32* %tmp63
  store i32 %tmp64, i32* %retval
  br label %return

return:                                           ; preds = %for.end60, %for.body55
  %0 = load i32* %retval
  ret i32 %0
}

define internal i32 @safe_add_func_uint32_t_u_u(i32 %ui1, i32 %ui2) nounwind uwtable {
entry:
  %ui1.addr = alloca i32, align 4
  %ui2.addr = alloca i32, align 4
  store i32 %ui1, i32* %ui1.addr, align 4
  store i32 %ui2, i32* %ui2.addr, align 4
  %tmp = load i32* %ui1.addr, align 4
  %tmp1 = load i32* %ui2.addr, align 4
  %add = add i32 %tmp, %tmp1
  ret i32 %add
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
  %tmp = load i32* @g_2, align 4
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %tmp)
  %0 = load i32* %retval
  ret i32 %0
}

declare i32 @printf(i8*, ...)
