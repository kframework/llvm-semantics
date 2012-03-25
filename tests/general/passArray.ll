; ModuleID = '/home/grosu/celliso2/c-semantics/tests/unitTests/passArray.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [6 x i8] c"Bug1\0A\00", align 1
@.str1 = private unnamed_addr constant [6 x i8] c"Bug2\0A\00", align 1
@.str2 = private unnamed_addr constant [6 x i8] c"Bug3\0A\00", align 1
@.str3 = private unnamed_addr constant [6 x i8] c"Bug4\0A\00", align 1

define i32 @array(i32* %a, i32 %size, i32 %start) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %a.addr = alloca i32*, align 8
  %size.addr = alloca i32, align 4
  %start.addr = alloca i32, align 4
  %i = alloca i32, align 4
  store i32* %a, i32** %a.addr, align 8
  store i32 %size, i32* %size.addr, align 4
  store i32 %start, i32* %start.addr, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp = load i32* %i, align 4
  %tmp1 = load i32* %size.addr, align 4
  %cmp = icmp slt i32 %tmp, %tmp1
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp2 = load i32* %i, align 4
  %idxprom = sext i32 %tmp2 to i64
  %tmp3 = load i32** %a.addr, align 8
  %arrayidx = getelementptr inbounds i32* %tmp3, i64 %idxprom
  %tmp4 = load i32* %arrayidx
  %tmp5 = load i32* %i, align 4
  %tmp6 = load i32* %start.addr, align 4
  %add = add nsw i32 %tmp5, %tmp6
  %cmp7 = icmp ne i32 %tmp4, %add
  br i1 %cmp7, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  store i32 1, i32* %retval
  br label %return

if.end:                                           ; preds = %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %tmp8 = load i32* %i, align 4
  %inc = add nsw i32 %tmp8, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %retval
  br label %return

return:                                           ; preds = %for.end, %if.then
  %0 = load i32* %retval
  ret i32 %0
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %x3d = alloca [3 x [5 x [7 x i32]]], align 16
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %i33 = alloca i32, align 4
  %j35 = alloca i32, align 4
  %k37 = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc28, %entry
  %tmp = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp, 3
  br i1 %cmp, label %for.body, label %for.end31

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4
  br label %for.cond2

for.cond2:                                        ; preds = %for.inc24, %for.body
  %tmp3 = load i32* %j, align 4
  %cmp4 = icmp slt i32 %tmp3, 5
  br i1 %cmp4, label %for.body5, label %for.end27

for.body5:                                        ; preds = %for.cond2
  store i32 0, i32* %k, align 4
  br label %for.cond7

for.cond7:                                        ; preds = %for.inc, %for.body5
  %tmp8 = load i32* %k, align 4
  %cmp9 = icmp slt i32 %tmp8, 7
  br i1 %cmp9, label %for.body10, label %for.end

for.body10:                                       ; preds = %for.cond7
  %tmp11 = load i32* %i, align 4
  %mul = mul nsw i32 %tmp11, 35
  %tmp12 = load i32* %j, align 4
  %mul13 = mul nsw i32 %tmp12, 7
  %add = add nsw i32 %mul, %mul13
  %tmp14 = load i32* %k, align 4
  %add15 = add nsw i32 %add, %tmp14
  %tmp16 = load i32* %k, align 4
  %idxprom = sext i32 %tmp16 to i64
  %tmp17 = load i32* %j, align 4
  %idxprom18 = sext i32 %tmp17 to i64
  %tmp19 = load i32* %i, align 4
  %idxprom20 = sext i32 %tmp19 to i64
  %arrayidx = getelementptr inbounds [3 x [5 x [7 x i32]]]* %x3d, i32 0, i64 %idxprom20
  %arrayidx21 = getelementptr inbounds [5 x [7 x i32]]* %arrayidx, i32 0, i64 %idxprom18
  %arrayidx22 = getelementptr inbounds [7 x i32]* %arrayidx21, i32 0, i64 %idxprom
  store i32 %add15, i32* %arrayidx22, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body10
  %tmp23 = load i32* %k, align 4
  %inc = add nsw i32 %tmp23, 1
  store i32 %inc, i32* %k, align 4
  br label %for.cond7

for.end:                                          ; preds = %for.cond7
  br label %for.inc24

for.inc24:                                        ; preds = %for.end
  %tmp25 = load i32* %j, align 4
  %inc26 = add nsw i32 %tmp25, 1
  store i32 %inc26, i32* %j, align 4
  br label %for.cond2

for.end27:                                        ; preds = %for.cond2
  br label %for.inc28

for.inc28:                                        ; preds = %for.end27
  %tmp29 = load i32* %i, align 4
  %inc30 = add nsw i32 %tmp29, 1
  store i32 %inc30, i32* %i, align 4
  br label %for.cond

for.end31:                                        ; preds = %for.cond
  store i32 1, i32* %i33, align 4
  store i32 2, i32* %j35, align 4
  store i32 3, i32* %k37, align 4
  %arraydecay = getelementptr inbounds [3 x [5 x [7 x i32]]]* %x3d, i32 0, i32 0
  %0 = bitcast [5 x [7 x i32]]* %arraydecay to i32*
  %call = call i32 @array(i32* %0, i32 105, i32 0)
  %tobool = icmp ne i32 %call, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %for.end31
  %call38 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([6 x i8]* @.str, i32 0, i32 0))
  br label %if.end

if.end:                                           ; preds = %if.then, %for.end31
  %tmp39 = load i32* %i33, align 4
  %idxprom40 = sext i32 %tmp39 to i64
  %arrayidx41 = getelementptr inbounds [3 x [5 x [7 x i32]]]* %x3d, i32 0, i64 %idxprom40
  %arraydecay42 = getelementptr inbounds [5 x [7 x i32]]* %arrayidx41, i32 0, i32 0
  %1 = bitcast [7 x i32]* %arraydecay42 to i32*
  %call43 = call i32 @array(i32* %1, i32 35, i32 35)
  %tobool44 = icmp ne i32 %call43, 0
  br i1 %tobool44, label %if.then45, label %if.end47

if.then45:                                        ; preds = %if.end
  %call46 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([6 x i8]* @.str1, i32 0, i32 0))
  br label %if.end47

if.end47:                                         ; preds = %if.then45, %if.end
  %tmp48 = load i32* %j35, align 4
  %idxprom49 = sext i32 %tmp48 to i64
  %tmp50 = load i32* %i33, align 4
  %idxprom51 = sext i32 %tmp50 to i64
  %arrayidx52 = getelementptr inbounds [3 x [5 x [7 x i32]]]* %x3d, i32 0, i64 %idxprom51
  %arrayidx53 = getelementptr inbounds [5 x [7 x i32]]* %arrayidx52, i32 0, i64 %idxprom49
  %arraydecay54 = getelementptr inbounds [7 x i32]* %arrayidx53, i32 0, i32 0
  %call55 = call i32 @array(i32* %arraydecay54, i32 7, i32 49)
  %tobool56 = icmp ne i32 %call55, 0
  br i1 %tobool56, label %if.then57, label %if.end59

if.then57:                                        ; preds = %if.end47
  %call58 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([6 x i8]* @.str2, i32 0, i32 0))
  br label %if.end59

if.end59:                                         ; preds = %if.then57, %if.end47
  %tmp60 = load i32* %k37, align 4
  %idxprom61 = sext i32 %tmp60 to i64
  %tmp62 = load i32* %j35, align 4
  %idxprom63 = sext i32 %tmp62 to i64
  %tmp64 = load i32* %i33, align 4
  %idxprom65 = sext i32 %tmp64 to i64
  %arrayidx66 = getelementptr inbounds [3 x [5 x [7 x i32]]]* %x3d, i32 0, i64 %idxprom65
  %arrayidx67 = getelementptr inbounds [5 x [7 x i32]]* %arrayidx66, i32 0, i64 %idxprom63
  %arrayidx68 = getelementptr inbounds [7 x i32]* %arrayidx67, i32 0, i64 %idxprom61
  %tmp69 = load i32* %arrayidx68, align 4
  %sub = sub nsw i32 %tmp69, 52
  %tobool70 = icmp ne i32 %sub, 0
  br i1 %tobool70, label %if.then71, label %if.end73

if.then71:                                        ; preds = %if.end59
  %call72 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([6 x i8]* @.str3, i32 0, i32 0))
  br label %if.end73

if.end73:                                         ; preds = %if.then71, %if.end59
  ret i32 0
}

declare i32 @printf(i8*, ...)
