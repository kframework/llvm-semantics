; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith001798.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable {
entry:
  %l_2 = alloca [6 x [5 x [3 x [1 x i32]]]], align 16
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %l = alloca i32, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc32, %entry
  %tmp = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp, 6
  br i1 %cmp, label %for.body, label %for.end35

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc28, %for.body
  %tmp2 = load i32* %j, align 4
  %cmp3 = icmp slt i32 %tmp2, 5
  br i1 %cmp3, label %for.body4, label %for.end31

for.body4:                                        ; preds = %for.cond1
  store i32 0, i32* %k, align 4
  br label %for.cond5

for.cond5:                                        ; preds = %for.inc24, %for.body4
  %tmp6 = load i32* %k, align 4
  %cmp7 = icmp slt i32 %tmp6, 3
  br i1 %cmp7, label %for.body8, label %for.end27

for.body8:                                        ; preds = %for.cond5
  store i32 0, i32* %l, align 4
  br label %for.cond9

for.cond9:                                        ; preds = %for.inc, %for.body8
  %tmp10 = load i32* %l, align 4
  %cmp11 = icmp slt i32 %tmp10, 1
  br i1 %cmp11, label %for.body12, label %for.end

for.body12:                                       ; preds = %for.cond9
  %tmp13 = load i32* %l, align 4
  %idxprom = sext i32 %tmp13 to i64
  %tmp14 = load i32* %k, align 4
  %idxprom15 = sext i32 %tmp14 to i64
  %tmp16 = load i32* %j, align 4
  %idxprom17 = sext i32 %tmp16 to i64
  %tmp18 = load i32* %i, align 4
  %idxprom19 = sext i32 %tmp18 to i64
  %arrayidx = getelementptr inbounds [6 x [5 x [3 x [1 x i32]]]]* %l_2, i32 0, i64 %idxprom19
  %arrayidx20 = getelementptr inbounds [5 x [3 x [1 x i32]]]* %arrayidx, i32 0, i64 %idxprom17
  %arrayidx21 = getelementptr inbounds [3 x [1 x i32]]* %arrayidx20, i32 0, i64 %idxprom15
  %arrayidx22 = getelementptr inbounds [1 x i32]* %arrayidx21, i32 0, i64 %idxprom
  store i32 -8, i32* %arrayidx22, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body12
  %tmp23 = load i32* %l, align 4
  %inc = add nsw i32 %tmp23, 1
  store i32 %inc, i32* %l, align 4
  br label %for.cond9

for.end:                                          ; preds = %for.cond9
  br label %for.inc24

for.inc24:                                        ; preds = %for.end
  %tmp25 = load i32* %k, align 4
  %inc26 = add nsw i32 %tmp25, 1
  store i32 %inc26, i32* %k, align 4
  br label %for.cond5

for.end27:                                        ; preds = %for.cond5
  br label %for.inc28

for.inc28:                                        ; preds = %for.end27
  %tmp29 = load i32* %j, align 4
  %inc30 = add nsw i32 %tmp29, 1
  store i32 %inc30, i32* %j, align 4
  br label %for.cond1

for.end31:                                        ; preds = %for.cond1
  br label %for.inc32

for.inc32:                                        ; preds = %for.end31
  %tmp33 = load i32* %i, align 4
  %inc34 = add nsw i32 %tmp33, 1
  store i32 %inc34, i32* %i, align 4
  br label %for.cond

for.end35:                                        ; preds = %for.cond
  %arrayidx36 = getelementptr inbounds [6 x [5 x [3 x [1 x i32]]]]* %l_2, i32 0, i64 2
  %arrayidx37 = getelementptr inbounds [5 x [3 x [1 x i32]]]* %arrayidx36, i32 0, i64 1
  %arrayidx38 = getelementptr inbounds [3 x [1 x i32]]* %arrayidx37, i32 0, i64 2
  %arrayidx39 = getelementptr inbounds [1 x i32]* %arrayidx38, i32 0, i64 0
  %tmp40 = load i32* %arrayidx39, align 4
  ret i32 %tmp40
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
  %0 = load i32* %retval
  ret i32 %0
}
