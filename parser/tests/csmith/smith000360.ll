; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith000360.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_4 = global i32 9, align 4
@g_3 = global i32* @g_4, align 8
@.str = private unnamed_addr constant [19 x i8] c"checksum g_4 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable {
entry:
  %l_2 = alloca [1 x i32*], align 8
  %l_5 = alloca [7 x [9 x [1 x i8]]], align 16
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp, 1
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp1 = load i32* %i, align 4
  %idxprom = sext i32 %tmp1 to i64
  %arrayidx = getelementptr inbounds [1 x i32*]* %l_2, i32 0, i64 %idxprom
  store i32* null, i32** %arrayidx, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %tmp2 = load i32* %i, align 4
  %inc = add nsw i32 %tmp2, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %i, align 4
  br label %for.cond3

for.cond3:                                        ; preds = %for.inc32, %for.end
  %tmp4 = load i32* %i, align 4
  %cmp5 = icmp slt i32 %tmp4, 7
  br i1 %cmp5, label %for.body6, label %for.end35

for.body6:                                        ; preds = %for.cond3
  store i32 0, i32* %j, align 4
  br label %for.cond7

for.cond7:                                        ; preds = %for.inc28, %for.body6
  %tmp8 = load i32* %j, align 4
  %cmp9 = icmp slt i32 %tmp8, 9
  br i1 %cmp9, label %for.body10, label %for.end31

for.body10:                                       ; preds = %for.cond7
  store i32 0, i32* %k, align 4
  br label %for.cond11

for.cond11:                                       ; preds = %for.inc24, %for.body10
  %tmp12 = load i32* %k, align 4
  %cmp13 = icmp slt i32 %tmp12, 1
  br i1 %cmp13, label %for.body14, label %for.end27

for.body14:                                       ; preds = %for.cond11
  %tmp15 = load i32* %k, align 4
  %idxprom16 = sext i32 %tmp15 to i64
  %tmp17 = load i32* %j, align 4
  %idxprom18 = sext i32 %tmp17 to i64
  %tmp19 = load i32* %i, align 4
  %idxprom20 = sext i32 %tmp19 to i64
  %arrayidx21 = getelementptr inbounds [7 x [9 x [1 x i8]]]* %l_5, i32 0, i64 %idxprom20
  %arrayidx22 = getelementptr inbounds [9 x [1 x i8]]* %arrayidx21, i32 0, i64 %idxprom18
  %arrayidx23 = getelementptr inbounds [1 x i8]* %arrayidx22, i32 0, i64 %idxprom16
  store i8 16, i8* %arrayidx23, align 1
  br label %for.inc24

for.inc24:                                        ; preds = %for.body14
  %tmp25 = load i32* %k, align 4
  %inc26 = add nsw i32 %tmp25, 1
  store i32 %inc26, i32* %k, align 4
  br label %for.cond11

for.end27:                                        ; preds = %for.cond11
  br label %for.inc28

for.inc28:                                        ; preds = %for.end27
  %tmp29 = load i32* %j, align 4
  %inc30 = add nsw i32 %tmp29, 1
  store i32 %inc30, i32* %j, align 4
  br label %for.cond7

for.end31:                                        ; preds = %for.cond7
  br label %for.inc32

for.inc32:                                        ; preds = %for.end31
  %tmp33 = load i32* %i, align 4
  %inc34 = add nsw i32 %tmp33, 1
  store i32 %inc34, i32* %i, align 4
  br label %for.cond3

for.end35:                                        ; preds = %for.cond3
  %arrayidx36 = getelementptr inbounds [1 x i32*]* %l_2, i32 0, i64 0
  %tmp37 = load i32** %arrayidx36, align 8
  store i32* %tmp37, i32** @g_3, align 8
  %arrayidx38 = getelementptr inbounds [7 x [9 x [1 x i8]]]* %l_5, i32 0, i64 3
  %arrayidx39 = getelementptr inbounds [9 x [1 x i8]]* %arrayidx38, i32 0, i64 8
  %arrayidx40 = getelementptr inbounds [1 x i8]* %arrayidx39, i32 0, i64 0
  %tmp41 = load i8* %arrayidx40, align 1
  %conv = sext i8 %tmp41 to i32
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
  %call = call i32 @func_1()
  %tmp = load i32* @g_4, align 4
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %tmp)
  %0 = load i32* %retval
  ret i32 %0
}

declare i32 @printf(i8*, ...)
