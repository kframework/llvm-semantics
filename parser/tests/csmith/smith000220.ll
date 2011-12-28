; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith000220.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_5 = global i32 7, align 4
@g_6 = global i32** null, align 8
@.str = private unnamed_addr constant [19 x i8] c"checksum g_5 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable {
entry:
  %l_8 = alloca [2 x [7 x i32*]], align 16
  %l_7 = alloca i32**, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %arrayidx = getelementptr inbounds [2 x [7 x i32*]]* %l_8, i32 0, i64 0
  %arrayidx1 = getelementptr inbounds [7 x i32*]* %arrayidx, i32 0, i64 6
  store i32** %arrayidx1, i32*** %l_7, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc12, %entry
  %tmp = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp, 2
  br i1 %cmp, label %for.body, label %for.end15

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4
  br label %for.cond2

for.cond2:                                        ; preds = %for.inc, %for.body
  %tmp3 = load i32* %j, align 4
  %cmp4 = icmp slt i32 %tmp3, 7
  br i1 %cmp4, label %for.body5, label %for.end

for.body5:                                        ; preds = %for.cond2
  %tmp6 = load i32* %j, align 4
  %idxprom = sext i32 %tmp6 to i64
  %tmp7 = load i32* %i, align 4
  %idxprom8 = sext i32 %tmp7 to i64
  %arrayidx9 = getelementptr inbounds [2 x [7 x i32*]]* %l_8, i32 0, i64 %idxprom8
  %arrayidx10 = getelementptr inbounds [7 x i32*]* %arrayidx9, i32 0, i64 %idxprom
  store i32* @g_5, i32** %arrayidx10, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body5
  %tmp11 = load i32* %j, align 4
  %inc = add nsw i32 %tmp11, 1
  store i32 %inc, i32* %j, align 4
  br label %for.cond2

for.end:                                          ; preds = %for.cond2
  br label %for.inc12

for.inc12:                                        ; preds = %for.end
  %tmp13 = load i32* %i, align 4
  %inc14 = add nsw i32 %tmp13, 1
  store i32 %inc14, i32* %i, align 4
  br label %for.cond

for.end15:                                        ; preds = %for.cond
  %tmp16 = load i32* @g_5, align 4
  %conv = trunc i32 %tmp16 to i16
  %call = call i32* @func_2(i16 signext %conv)
  %tmp17 = load i32*** %l_7, align 8
  store i32* %call, i32** %tmp17
  %tmp18 = load i32* @g_5, align 4
  ret i32 %tmp18
}

define i32* @func_2(i16 signext %p_3) nounwind uwtable {
entry:
  %p_3.addr = alloca i16, align 2
  %l_4 = alloca i32*, align 8
  store i16 %p_3, i16* %p_3.addr, align 2
  store i32* @g_5, i32** %l_4, align 8
  %tmp = load i32** %l_4, align 8
  ret i32* %tmp
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
  %tmp = load i32* @g_5, align 4
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %tmp)
  %0 = load i32* %retval
  ret i32 %0
}

declare i32 @printf(i8*, ...)
