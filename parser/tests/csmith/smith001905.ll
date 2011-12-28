; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith001905.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_3 = global i32 0, align 4
@.str = private unnamed_addr constant [19 x i8] c"checksum g_3 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define signext i16 @func_1() nounwind uwtable {
entry:
  %retval = alloca i16, align 2
  %l_2 = alloca [7 x i8], align 1
  %i = alloca i32, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp, 7
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp1 = load i32* %i, align 4
  %idxprom = sext i32 %tmp1 to i64
  %arrayidx = getelementptr inbounds [7 x i8]* %l_2, i32 0, i64 %idxprom
  store i8 0, i8* %arrayidx, align 1
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %tmp2 = load i32* %i, align 4
  %inc = add nsw i32 %tmp2, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  volatile store i32 6, i32* @g_3, align 4
  br label %for.cond3

for.cond3:                                        ; preds = %for.inc11, %for.end
  %tmp4 = volatile load i32* @g_3, align 4
  %cmp5 = icmp sge i32 %tmp4, 0
  br i1 %cmp5, label %for.body6, label %for.end13

for.body6:                                        ; preds = %for.cond3
  %tmp7 = volatile load i32* @g_3, align 4
  %rem = urem i32 %tmp7, 7
  %idxprom8 = zext i32 %rem to i64
  %arrayidx9 = getelementptr inbounds [7 x i8]* %l_2, i32 0, i64 %idxprom8
  %tmp10 = load i8* %arrayidx9, align 1
  %conv = zext i8 %tmp10 to i16
  store i16 %conv, i16* %retval
  br label %return

for.inc11:                                        ; No predecessors!
  %tmp12 = volatile load i32* @g_3, align 4
  %add = add nsw i32 %tmp12, -2
  volatile store i32 %add, i32* @g_3, align 4
  br label %for.cond3

for.end13:                                        ; preds = %for.cond3
  %tmp14 = volatile load i32* @g_3, align 4
  %conv15 = trunc i32 %tmp14 to i16
  store i16 %conv15, i16* %retval
  br label %return

return:                                           ; preds = %for.end13, %for.body6
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
  %tmp = volatile load i32* @g_3, align 4
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %tmp)
  %0 = load i32* %retval
  ret i32 %0
}

declare i32 @printf(i8*, ...)
