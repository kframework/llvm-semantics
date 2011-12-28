; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith001467.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_4 = global i32 5, align 4
@g_6 = global i32 3, align 4
@g_8 = global i8 118, align 1
@.str = private unnamed_addr constant [19 x i8] c"checksum g_4 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [19 x i8] c"checksum g_6 = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [19 x i8] c"checksum g_8 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define signext i16 @func_1() nounwind uwtable {
entry:
  %retval = alloca i16, align 2
  %l_2 = alloca i8, align 1
  %l_7 = alloca i32*, align 8
  %l_3 = alloca [7 x i32], align 16
  %i = alloca i32, align 4
  %l_5 = alloca i32*, align 8
  store i8 -35, i8* %l_2, align 1
  store i32* null, i32** %l_7, align 8
  %tmp = load i8* %l_2, align 1
  %tobool = icmp ne i8 %tmp, 0
  br i1 %tobool, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %tmp1 = load i8* %l_2, align 1
  %conv = sext i8 %tmp1 to i16
  store i16 %conv, i16* %retval
  br label %return

if.else:                                          ; preds = %entry
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.else
  %tmp4 = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp4, 7
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp6 = load i32* %i, align 4
  %idxprom = sext i32 %tmp6 to i64
  %arrayidx = getelementptr inbounds [7 x i32]* %l_3, i32 0, i64 %idxprom
  store i32 5, i32* %arrayidx, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %tmp7 = load i32* %i, align 4
  %inc = add nsw i32 %tmp7, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store i8 0, i8* %l_2, align 1
  br label %for.cond8

for.cond8:                                        ; preds = %for.inc17, %for.end
  %tmp9 = load i8* %l_2, align 1
  %conv10 = sext i8 %tmp9 to i32
  %cmp11 = icmp slt i32 %conv10, 7
  br i1 %cmp11, label %for.body13, label %for.end21

for.body13:                                       ; preds = %for.cond8
  %tmp14 = load i8* %l_2, align 1
  %idxprom15 = sext i8 %tmp14 to i64
  %arrayidx16 = getelementptr inbounds [7 x i32]* %l_3, i32 0, i64 %idxprom15
  store i32 1, i32* %arrayidx16, align 4
  br label %for.inc17

for.inc17:                                        ; preds = %for.body13
  %tmp18 = load i8* %l_2, align 1
  %conv19 = sext i8 %tmp18 to i32
  %add = add nsw i32 %conv19, 1
  %conv20 = trunc i32 %add to i8
  store i8 %conv20, i8* %l_2, align 1
  br label %for.cond8

for.end21:                                        ; preds = %for.cond8
  store i8 6, i8* %l_2, align 1
  br label %for.cond22

for.cond22:                                       ; preds = %for.inc41, %for.end21
  %tmp23 = load i8* %l_2, align 1
  %conv24 = sext i8 %tmp23 to i32
  %cmp25 = icmp sge i32 %conv24, 0
  br i1 %cmp25, label %for.body27, label %for.end46

for.body27:                                       ; preds = %for.cond22
  store i32* @g_6, i32** %l_5, align 8
  %tmp29 = load i32* @g_4, align 4
  %tmp30 = load i32** %l_5, align 8
  %tmp31 = load i32* %tmp30
  %xor = xor i32 %tmp31, %tmp29
  store i32 %xor, i32* %tmp30
  %tmp32 = load i32** %l_7, align 8
  %cmp33 = icmp eq i32* %tmp32, null
  %conv34 = zext i1 %cmp33 to i32
  %tmp35 = load i32** %l_5, align 8
  store i32 %conv34, i32* %tmp35
  %tmp36 = load i32* @g_4, align 4
  %tobool37 = icmp ne i32 %tmp36, 0
  br i1 %tobool37, label %if.then38, label %if.end

if.then38:                                        ; preds = %for.body27
  br label %for.end46

if.end:                                           ; preds = %for.body27
  %tmp39 = load i8* @g_8, align 1
  %conv40 = zext i8 %tmp39 to i16
  store i16 %conv40, i16* %retval
  br label %return

for.inc41:                                        ; No predecessors!
  %tmp42 = load i8* %l_2, align 1
  %conv43 = sext i8 %tmp42 to i32
  %add44 = add nsw i32 %conv43, -5
  %conv45 = trunc i32 %add44 to i8
  store i8 %conv45, i8* %l_2, align 1
  br label %for.cond22

for.end46:                                        ; preds = %if.then38, %for.cond22
  br label %if.end47

if.end47:                                         ; preds = %for.end46
  %tmp48 = load i8* @g_8, align 1
  %conv49 = zext i8 %tmp48 to i16
  store i16 %conv49, i16* %retval
  br label %return

return:                                           ; preds = %if.end47, %if.end, %if.then
  %0 = load i16* %retval
  ret i16 %0
}

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  %call = call signext i16 @func_1()
  %tmp = load i32* @g_4, align 4
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %tmp)
  %tmp2 = load i32* @g_6, align 4
  %call3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str1, i32 0, i32 0), i32 %tmp2)
  %tmp4 = load i8* @g_8, align 1
  %conv = zext i8 %tmp4 to i32
  %call5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str2, i32 0, i32 0), i32 %conv)
  %0 = load i32* %retval
  ret i32 %0
}

declare i32 @printf(i8*, ...)
