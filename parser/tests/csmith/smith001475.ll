; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith001475.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_9 = global i32 -592223239, align 4
@g_13 = global i32 1, align 4
@g_12 = global i32* @g_13, align 8
@.str = private unnamed_addr constant [19 x i8] c"checksum g_9 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [20 x i8] c"checksum g_13 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable {
entry:
  %l_8 = alloca i32, align 4
  %l_11 = alloca i32*, align 8
  %l_10 = alloca [5 x [8 x i32**]], align 16
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 -7, i32* %l_8, align 4
  store i32* null, i32** %l_11, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc10, %entry
  %tmp = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp, 5
  br i1 %cmp, label %for.body, label %for.end13

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc, %for.body
  %tmp2 = load i32* %j, align 4
  %cmp3 = icmp slt i32 %tmp2, 8
  br i1 %cmp3, label %for.body4, label %for.end

for.body4:                                        ; preds = %for.cond1
  %tmp5 = load i32* %j, align 4
  %idxprom = sext i32 %tmp5 to i64
  %tmp6 = load i32* %i, align 4
  %idxprom7 = sext i32 %tmp6 to i64
  %arrayidx = getelementptr inbounds [5 x [8 x i32**]]* %l_10, i32 0, i64 %idxprom7
  %arrayidx8 = getelementptr inbounds [8 x i32**]* %arrayidx, i32 0, i64 %idxprom
  store i32** %l_11, i32*** %arrayidx8, align 8
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
  %tmp14 = load i32* %l_8, align 4
  %conv = trunc i32 %tmp14 to i16
  %tmp15 = load i32* %l_8, align 4
  %conv16 = trunc i32 %tmp15 to i8
  %tmp17 = load i32* @g_9, align 4
  %tmp18 = load i32* %l_8, align 4
  %conv19 = trunc i32 %tmp18 to i16
  %call = call i32* @func_2(i16 zeroext %conv, i8 signext %conv16, i32 %tmp17, i16 zeroext %conv19)
  store i32* %call, i32** @g_12, align 8
  %tmp20 = load i32* @g_13, align 4
  ret i32 %tmp20
}

define i32* @func_2(i16 zeroext %p_3, i8 signext %p_4, i32 %p_5, i16 zeroext %p_6) nounwind uwtable {
entry:
  %p_3.addr = alloca i16, align 2
  %p_4.addr = alloca i8, align 1
  %p_5.addr = alloca i32, align 4
  %p_6.addr = alloca i16, align 2
  %l_7 = alloca [3 x i32*], align 16
  %i = alloca i32, align 4
  store i16 %p_3, i16* %p_3.addr, align 2
  store i8 %p_4, i8* %p_4.addr, align 1
  store i32 %p_5, i32* %p_5.addr, align 4
  store i16 %p_6, i16* %p_6.addr, align 2
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp, 3
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp1 = load i32* %i, align 4
  %idxprom = sext i32 %tmp1 to i64
  %arrayidx = getelementptr inbounds [3 x i32*]* %l_7, i32 0, i64 %idxprom
  store i32* null, i32** %arrayidx, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %tmp2 = load i32* %i, align 4
  %inc = add nsw i32 %tmp2, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %arrayidx3 = getelementptr inbounds [3 x i32*]* %l_7, i32 0, i64 2
  %tmp4 = load i32** %arrayidx3, align 8
  ret i32* %tmp4
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
  %tmp = load i32* @g_9, align 4
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %tmp)
  %tmp2 = load i32* @g_13, align 4
  %call3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str1, i32 0, i32 0), i32 %tmp2)
  %0 = load i32* %retval
  ret i32 %0
}

declare i32 @printf(i8*, ...)
