; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith001793.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_3 = global i32 1023856146, align 4
@g_2 = global [7 x [2 x i32*]] [[2 x i32*] [i32* @g_3, i32* @g_3], [2 x i32*] [i32* @g_3, i32* @g_3], [2 x i32*] [i32* @g_3, i32* @g_3], [2 x i32*] [i32* @g_3, i32* @g_3], [2 x i32*] [i32* @g_3, i32* @g_3], [2 x i32*] [i32* @g_3, i32* @g_3], [2 x i32*] [i32* @g_3, i32* @g_3]], align 16
@g_6 = global i32 -860867031, align 4
@.str = private unnamed_addr constant [19 x i8] c"checksum g_3 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [19 x i8] c"checksum g_6 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define zeroext i8 @func_1() nounwind uwtable {
entry:
  %l_4 = alloca [6 x i16], align 2
  %l_5 = alloca i32*, align 8
  %i = alloca i32, align 4
  store i32* @g_6, i32** %l_5, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp, 6
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp1 = load i32* %i, align 4
  %idxprom = sext i32 %tmp1 to i64
  %arrayidx = getelementptr inbounds [6 x i16]* %l_4, i32 0, i64 %idxprom
  store i16 -1, i16* %arrayidx, align 2
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %tmp2 = load i32* %i, align 4
  %inc = add nsw i32 %tmp2, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store i32* null, i32** getelementptr inbounds ([7 x [2 x i32*]]* @g_2, i32 0, i64 3, i64 0), align 8
  %arrayidx3 = getelementptr inbounds [6 x i16]* %l_4, i32 0, i64 0
  %tmp4 = load i16* %arrayidx3, align 2
  %conv = sext i16 %tmp4 to i32
  %tmp5 = load i32** %l_5, align 8
  store i32 %conv, i32* %tmp5
  %tmp6 = load i32* @g_6, align 4
  %conv7 = trunc i32 %tmp6 to i8
  ret i8 %conv7
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
  %call = call zeroext i8 @func_1()
  %tmp = volatile load i32* @g_3, align 4
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %tmp)
  %tmp2 = load i32* @g_6, align 4
  %call3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str1, i32 0, i32 0), i32 %tmp2)
  %0 = load i32* %retval
  ret i32 %0
}

declare i32 @printf(i8*, ...)
