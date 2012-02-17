; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith001455.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_3 = global [1 x [2 x i32]] [[2 x i32] [i32 2089446293, i32 2089446293]], align 4
@g_4 = global i32 6, align 4
@g_5 = global i32 164374010, align 4
@g_6 = global i32 9, align 4
@.str = private unnamed_addr constant [25 x i8] c"checksum g_3[0][0] = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [25 x i8] c"checksum g_3[0][1] = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [19 x i8] c"checksum g_4 = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [19 x i8] c"checksum g_5 = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [19 x i8] c"checksum g_6 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i64 @func_1() nounwind uwtable {
entry:
  %retval = alloca i64, align 8
  %l_2 = alloca [6 x [5 x [1 x [1 x i64]]]], align 16
  %l_7 = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %l = alloca i32, align 4
  store i32 -1139773754, i32* %l_7, align 4
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
  %cmp7 = icmp slt i32 %tmp6, 1
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
  %arrayidx = getelementptr inbounds [6 x [5 x [1 x [1 x i64]]]]* %l_2, i32 0, i64 %idxprom19
  %arrayidx20 = getelementptr inbounds [5 x [1 x [1 x i64]]]* %arrayidx, i32 0, i64 %idxprom17
  %arrayidx21 = getelementptr inbounds [1 x [1 x i64]]* %arrayidx20, i32 0, i64 %idxprom15
  %arrayidx22 = getelementptr inbounds [1 x i64]* %arrayidx21, i32 0, i64 %idxprom
  store i64 1, i64* %arrayidx22, align 8
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
  volatile store i32 4, i32* getelementptr inbounds ([1 x [2 x i32]]* @g_3, i32 0, i64 0, i64 1), align 4
  br label %for.cond36

for.cond36:                                       ; preds = %for.inc68, %for.end35
  %tmp37 = volatile load i32* getelementptr inbounds ([1 x [2 x i32]]* @g_3, i32 0, i64 0, i64 1), align 4
  %cmp38 = icmp sge i32 %tmp37, 0
  br i1 %cmp38, label %for.body39, label %for.end71

for.body39:                                       ; preds = %for.cond36
  volatile store i32 0, i32* @g_4, align 4
  br label %for.cond40

for.cond40:                                       ; preds = %for.inc64, %for.body39
  %tmp41 = volatile load i32* @g_4, align 4
  %cmp42 = icmp slt i32 %tmp41, 5
  br i1 %cmp42, label %for.body43, label %for.end67

for.body43:                                       ; preds = %for.cond40
  volatile store i32 0, i32* @g_5, align 4
  br label %for.cond44

for.cond44:                                       ; preds = %for.inc60, %for.body43
  %tmp45 = volatile load i32* @g_5, align 4
  %cmp46 = icmp slt i32 %tmp45, 1
  br i1 %cmp46, label %for.body47, label %for.end63

for.body47:                                       ; preds = %for.cond44
  volatile store i32 0, i32* @g_6, align 4
  br label %for.cond48

for.cond48:                                       ; preds = %for.inc57, %for.body47
  %tmp49 = volatile load i32* @g_6, align 4
  %cmp50 = icmp slt i32 %tmp49, 1
  br i1 %cmp50, label %for.body51, label %for.end59

for.body51:                                       ; preds = %for.cond48
  %arrayidx52 = getelementptr inbounds [6 x [5 x [1 x [1 x i64]]]]* %l_2, i32 0, i64 5
  %arrayidx53 = getelementptr inbounds [5 x [1 x [1 x i64]]]* %arrayidx52, i32 0, i64 2
  %arrayidx54 = getelementptr inbounds [1 x [1 x i64]]* %arrayidx53, i32 0, i64 0
  %arrayidx55 = getelementptr inbounds [1 x i64]* %arrayidx54, i32 0, i64 0
  %tmp56 = load i64* %arrayidx55, align 8
  store i64 %tmp56, i64* %retval
  br label %return

for.inc57:                                        ; No predecessors!
  %tmp58 = volatile load i32* @g_6, align 4
  %add = add nsw i32 %tmp58, 1
  volatile store i32 %add, i32* @g_6, align 4
  br label %for.cond48

for.end59:                                        ; preds = %for.cond48
  br label %for.inc60

for.inc60:                                        ; preds = %for.end59
  %tmp61 = volatile load i32* @g_5, align 4
  %add62 = add nsw i32 %tmp61, 1
  volatile store i32 %add62, i32* @g_5, align 4
  br label %for.cond44

for.end63:                                        ; preds = %for.cond44
  br label %for.inc64

for.inc64:                                        ; preds = %for.end63
  %tmp65 = volatile load i32* @g_4, align 4
  %add66 = add nsw i32 %tmp65, 2
  volatile store i32 %add66, i32* @g_4, align 4
  br label %for.cond40

for.end67:                                        ; preds = %for.cond40
  br label %for.inc68

for.inc68:                                        ; preds = %for.end67
  %tmp69 = volatile load i32* getelementptr inbounds ([1 x [2 x i32]]* @g_3, i32 0, i64 0, i64 1), align 4
  %add70 = add nsw i32 %tmp69, -4
  volatile store i32 %add70, i32* getelementptr inbounds ([1 x [2 x i32]]* @g_3, i32 0, i64 0, i64 1), align 4
  br label %for.cond36

for.end71:                                        ; preds = %for.cond36
  store i64 -1139773754, i64* %retval
  br label %return

return:                                           ; preds = %for.end71, %for.body51
  %0 = load i64* %retval
  ret i64 %0
}

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  %call = call i64 @func_1()
  %tmp = volatile load i32* getelementptr inbounds ([1 x [2 x i32]]* @g_3, i32 0, i64 0, i64 0), align 4
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str, i32 0, i32 0), i32 %tmp)
  %tmp2 = volatile load i32* getelementptr inbounds ([1 x [2 x i32]]* @g_3, i32 0, i64 0, i64 1), align 4
  %call3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str1, i32 0, i32 0), i32 %tmp2)
  %tmp4 = volatile load i32* getelementptr inbounds ([1 x [2 x i32]]* @g_3, i32 0, i64 0, i64 1), align 4
  %call5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str1, i32 0, i32 0), i32 %tmp4)
  %tmp6 = volatile load i32* @g_4, align 4
  %call7 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str2, i32 0, i32 0), i32 %tmp6)
  %tmp8 = volatile load i32* @g_5, align 4
  %call9 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str3, i32 0, i32 0), i32 %tmp8)
  %tmp10 = volatile load i32* @g_6, align 4
  %call11 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str4, i32 0, i32 0), i32 %tmp10)
  %0 = load i32* %retval
  ret i32 %0
}

declare i32 @printf(i8*, ...)
