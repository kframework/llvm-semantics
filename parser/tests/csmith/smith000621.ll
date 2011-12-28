; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith000621.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_4 = global i32 -7, align 4
@g_3 = global i32* @g_4, align 8
@g_11 = global i32* @g_4, align 8
@g_10 = constant i32** @g_11, align 8
@.str = private unnamed_addr constant [19 x i8] c"checksum g_4 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define zeroext i16 @func_1() nounwind uwtable {
entry:
  %l_2 = alloca i8, align 1
  store i8 9, i8* %l_2, align 1
  %tmp = load i8* %l_2, align 1
  %conv = zext i8 %tmp to i32
  %tmp1 = volatile load i32** @g_3, align 8
  store i32 %conv, i32* %tmp1
  %tmp2 = load i8* %l_2, align 1
  %conv3 = zext i8 %tmp2 to i64
  %call = call i32* @func_5(i64 %conv3, i32* null)
  %tmp4 = volatile load i32*** @g_10, align 8
  store i32* %call, i32** %tmp4
  %tmp5 = load i8* %l_2, align 1
  %conv6 = zext i8 %tmp5 to i16
  ret i16 %conv6
}

define i32* @func_5(i64 %p_6, i32* %p_7) nounwind uwtable {
entry:
  %p_6.addr = alloca i64, align 8
  %p_7.addr = alloca i32*, align 8
  %l_8 = alloca [5 x i64], align 16
  %l_9 = alloca i32*, align 8
  %i = alloca i32, align 4
  store i64 %p_6, i64* %p_6.addr, align 8
  store i32* %p_7, i32** %p_7.addr, align 8
  store i32* null, i32** %l_9, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp, 5
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp1 = load i32* %i, align 4
  %idxprom = sext i32 %tmp1 to i64
  %arrayidx = getelementptr inbounds [5 x i64]* %l_8, i32 0, i64 %idxprom
  store i64 1, i64* %arrayidx, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %tmp2 = load i32* %i, align 4
  %inc = add nsw i32 %tmp2, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %tmp3 = volatile load i32** @g_3, align 8
  %tmp4 = load i32* %tmp3
  %conv = sext i32 %tmp4 to i64
  %arrayidx5 = getelementptr inbounds [5 x i64]* %l_8, i32 0, i64 0
  %tmp6 = load i64* %arrayidx5, align 8
  %or = or i64 %tmp6, %conv
  store i64 %or, i64* %arrayidx5, align 8
  store i32 0, i32* @g_4, align 4
  br label %for.cond7

for.cond7:                                        ; preds = %for.inc15, %for.end
  %tmp8 = load i32* @g_4, align 4
  %cmp9 = icmp slt i32 %tmp8, 5
  br i1 %cmp9, label %for.body11, label %for.end17

for.body11:                                       ; preds = %for.cond7
  %tmp12 = load i32* @g_4, align 4
  %idxprom13 = sext i32 %tmp12 to i64
  %arrayidx14 = getelementptr inbounds [5 x i64]* %l_8, i32 0, i64 %idxprom13
  store i64 0, i64* %arrayidx14, align 8
  br label %for.inc15

for.inc15:                                        ; preds = %for.body11
  %tmp16 = load i32* @g_4, align 4
  %add = add nsw i32 %tmp16, 1
  store i32 %add, i32* @g_4, align 4
  br label %for.cond7

for.end17:                                        ; preds = %for.cond7
  %tmp18 = load i32** %l_9, align 8
  ret i32* %tmp18
}

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  %call = call zeroext i16 @func_1()
  %tmp = load i32* @g_4, align 4
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %tmp)
  %0 = load i32* %retval
  ret i32 %0
}

declare i32 @printf(i8*, ...)
