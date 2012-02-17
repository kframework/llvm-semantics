; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith000978.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_7 = global i32* null, align 8
@g_8 = global i32** @g_7, align 8
@g_10 = global i32 0, align 4
@g_9 = global i32* @g_10, align 8
@g_12 = global i32** @g_9, align 8
@.str = private unnamed_addr constant [20 x i8] c"checksum g_10 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define zeroext i16 @func_1() nounwind uwtable {
entry:
  %l_11 = alloca [4 x i16], align 2
  %i = alloca i32, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp, 4
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp1 = load i32* %i, align 4
  %idxprom = sext i32 %tmp1 to i64
  %arrayidx = getelementptr inbounds [4 x i16]* %l_11, i32 0, i64 %idxprom
  store i16 10934, i16* %arrayidx, align 2
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %tmp2 = load i32* %i, align 4
  %inc = add nsw i32 %tmp2, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %arrayidx3 = getelementptr inbounds [4 x i16]* %l_11, i32 0, i64 0
  %tmp4 = load i16* %arrayidx3, align 2
  %conv = trunc i16 %tmp4 to i8
  %tmp5 = load i32* @g_10, align 4
  %call = call i32* @func_2(i64 2822193965910059622, i8 zeroext -115, i8 signext %conv, i32 %tmp5)
  %tmp6 = volatile load i32*** @g_12, align 8
  store i32* %call, i32** %tmp6
  %arrayidx7 = getelementptr inbounds [4 x i16]* %l_11, i32 0, i64 0
  %tmp8 = load i16* %arrayidx7, align 2
  %conv9 = zext i16 %tmp8 to i32
  %tmp10 = load i32** @g_9, align 8
  %tmp11 = load i32* %tmp10
  %and = and i32 %tmp11, %conv9
  store i32 %and, i32* %tmp10
  %arrayidx12 = getelementptr inbounds [4 x i16]* %l_11, i32 0, i64 0
  %tmp13 = load i16* %arrayidx12, align 2
  ret i16 %tmp13
}

define i32* @func_2(i64 %p_3, i8 zeroext %p_4, i8 signext %p_5, i32 %p_6) nounwind uwtable {
entry:
  %p_3.addr = alloca i64, align 8
  %p_4.addr = alloca i8, align 1
  %p_5.addr = alloca i8, align 1
  %p_6.addr = alloca i32, align 4
  store i64 %p_3, i64* %p_3.addr, align 8
  store i8 %p_4, i8* %p_4.addr, align 1
  store i8 %p_5, i8* %p_5.addr, align 1
  store i32 %p_6, i32* %p_6.addr, align 4
  %tmp = load i32** @g_7, align 8
  %tmp1 = volatile load i32*** @g_8, align 8
  store i32* %tmp, i32** %tmp1
  %tmp2 = volatile load i32*** @g_8, align 8
  %tmp3 = load i32** %tmp2
  %tmp4 = volatile load i32*** @g_8, align 8
  store i32* %tmp3, i32** %tmp4
  %tmp5 = load i32** @g_9, align 8
  ret i32* %tmp5
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
  %tmp = load i32* @g_10, align 4
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str, i32 0, i32 0), i32 %tmp)
  %0 = load i32* %retval
  ret i32 %0
}

declare i32 @printf(i8*, ...)
