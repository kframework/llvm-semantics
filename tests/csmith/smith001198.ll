; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith001198.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = global i16 -18895, align 2
@.str = private unnamed_addr constant [19 x i8] c"checksum g_2 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i64 @func_1() nounwind uwtable {
entry:
  %retval = alloca i64, align 8
  %l_3 = alloca [4 x i16], align 2
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
  %arrayidx = getelementptr inbounds [4 x i16]* %l_3, i32 0, i64 %idxprom
  store i16 -2, i16* %arrayidx, align 2
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %tmp2 = load i32* %i, align 4
  %inc = add nsw i32 %tmp2, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %tmp3 = volatile load i16* @g_2, align 2
  %conv = zext i16 %tmp3 to i32
  %arrayidx4 = getelementptr inbounds [4 x i16]* %l_3, i32 0, i64 1
  %tmp5 = load i16* %arrayidx4, align 2
  %conv6 = zext i16 %tmp5 to i32
  %xor = xor i32 %conv6, %conv
  %conv7 = trunc i32 %xor to i16
  store i16 %conv7, i16* %arrayidx4, align 2
  volatile store i16 0, i16* @g_2, align 2
  br label %for.cond8

for.cond8:                                        ; preds = %for.inc16, %for.end
  %tmp9 = volatile load i16* @g_2, align 2
  %conv10 = zext i16 %tmp9 to i32
  %cmp11 = icmp slt i32 %conv10, 4
  br i1 %cmp11, label %for.body13, label %for.end20

for.body13:                                       ; preds = %for.cond8
  %tmp14 = volatile load i16* @g_2, align 2
  %conv15 = zext i16 %tmp14 to i64
  store i64 %conv15, i64* %retval
  br label %return

for.inc16:                                        ; No predecessors!
  %tmp17 = volatile load i16* @g_2, align 2
  %conv18 = zext i16 %tmp17 to i32
  %add = add nsw i32 %conv18, 3
  %conv19 = trunc i32 %add to i16
  volatile store i16 %conv19, i16* @g_2, align 2
  br label %for.cond8

for.end20:                                        ; preds = %for.cond8
  %arrayidx21 = getelementptr inbounds [4 x i16]* %l_3, i32 0, i64 1
  %tmp22 = load i16* %arrayidx21, align 2
  %conv23 = zext i16 %tmp22 to i64
  store i64 %conv23, i64* %retval
  br label %return

return:                                           ; preds = %for.end20, %for.body13
  %0 = load i64* %retval
  ret i64 %0
}

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  %call = call i64 @func_1()
  %tmp = volatile load i16* @g_2, align 2
  %conv = zext i16 %tmp to i32
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %conv)
  %0 = load i32* %retval
  ret i32 %0
}

declare i32 @printf(i8*, ...)
