; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith000619.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_9 = global i32 -9, align 4
@g_11 = global [9 x [5 x [2 x i32*]]] zeroinitializer, align 16
@g_14 = global i32 1716703450, align 4
@g_13 = global i32* @g_14, align 8
@.str = private unnamed_addr constant [19 x i8] c"checksum g_9 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [20 x i8] c"checksum g_14 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define signext i16 @func_1() nounwind uwtable {
entry:
  %l_12 = alloca i32, align 4
  store i32 1072031770, i32* %l_12, align 4
  %tmp = load i32* %l_12, align 4
  %tmp1 = load i32* @g_9, align 4
  %tmp2 = load i32* @g_9, align 4
  %conv = trunc i32 %tmp2 to i8
  %tmp3 = load i32* %l_12, align 4
  %tmp4 = load i32* @g_9, align 4
  %call = call i32 @func_2(i32 %tmp, i32 %tmp1, i8 zeroext %conv, i32 %tmp3, i32 %tmp4)
  %tmp5 = volatile load i32** @g_13, align 8
  %tmp6 = load i32* %tmp5
  %or = or i32 %tmp6, %call
  store i32 %or, i32* %tmp5
  %tmp7 = load i32* @g_14, align 4
  %conv8 = trunc i32 %tmp7 to i16
  ret i16 %conv8
}

define i32 @func_2(i32 %p_3, i32 %p_4, i8 zeroext %p_5, i32 %p_6, i32 %p_7) nounwind uwtable {
entry:
  %p_3.addr = alloca i32, align 4
  %p_4.addr = alloca i32, align 4
  %p_5.addr = alloca i8, align 1
  %p_6.addr = alloca i32, align 4
  %p_7.addr = alloca i32, align 4
  %l_8 = alloca i32*, align 8
  %l_10 = alloca [8 x i32**], align 16
  %i = alloca i32, align 4
  store i32 %p_3, i32* %p_3.addr, align 4
  store i32 %p_4, i32* %p_4.addr, align 4
  store i8 %p_5, i8* %p_5.addr, align 1
  store i32 %p_6, i32* %p_6.addr, align 4
  store i32 %p_7, i32* %p_7.addr, align 4
  store i32* @g_9, i32** %l_8, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp, 8
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp1 = load i32* %i, align 4
  %idxprom = sext i32 %tmp1 to i64
  %arrayidx = getelementptr inbounds [8 x i32**]* %l_10, i32 0, i64 %idxprom
  store i32** %l_8, i32*** %arrayidx, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %tmp2 = load i32* %i, align 4
  %inc = add nsw i32 %tmp2, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %tmp3 = load i32** %l_8, align 8
  store i32* %tmp3, i32** getelementptr inbounds ([9 x [5 x [2 x i32*]]]* @g_11, i32 0, i64 3, i64 2, i64 1), align 8
  %tmp4 = load i8* %p_5.addr, align 1
  %conv = zext i8 %tmp4 to i32
  ret i32 %conv
}

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  %call = call signext i16 @func_1()
  %tmp = load i32* @g_9, align 4
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %tmp)
  %tmp2 = load i32* @g_14, align 4
  %call3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str1, i32 0, i32 0), i32 %tmp2)
  %0 = load i32* %retval
  ret i32 %0
}

declare i32 @printf(i8*, ...)
