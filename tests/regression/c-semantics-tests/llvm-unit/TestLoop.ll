; ModuleID = '/home/david/src/c-semantics/tests/llvm-unit/TestLoop.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

define i32 @foo(i32 %i, i32 %j) nounwind uwtable {
entry:
  %i.addr = alloca i32, align 4
  %j.addr = alloca i32, align 4
  store i32 %i, i32* %i.addr, align 4
  store i32 %j, i32* %j.addr, align 4
  %0 = load i32* %j.addr, align 4
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %0)
  %1 = load i32* %j.addr, align 4
  ret i32 %1
}

declare i32 @printf(i8*, ...)

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %level = alloca i32, align 4
  %i = alloca i32, align 4
  %fval = alloca [4 x i32], align 16
  store i32 0, i32* %retval
  store i32 5, i32* %level, align 4
  store i32 3, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32* %i, align 4
  %cmp = icmp sge i32 %0, 0
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %1 = load i32* %level, align 4
  %sub = sub nsw i32 %1, 1
  %2 = load i32* %level, align 4
  %mul = mul nsw i32 %2, 4
  %3 = load i32* %i, align 4
  %add = add nsw i32 %mul, %3
  %add1 = add nsw i32 %add, 1
  %call = call i32 @foo(i32 %sub, i32 %add1)
  %4 = load i32* %i, align 4
  %idxprom = sext i32 %4 to i64
  %arrayidx = getelementptr inbounds [4 x i32]* %fval, i32 0, i64 %idxprom
  store i32 %call, i32* %arrayidx, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %5 = load i32* %i, align 4
  %dec = add nsw i32 %5, -1
  store i32 %dec, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %i, align 4
  br label %for.cond2

for.cond2:                                        ; preds = %for.inc8, %for.end
  %6 = load i32* %i, align 4
  %cmp3 = icmp slt i32 %6, 4
  br i1 %cmp3, label %for.body4, label %for.end9

for.body4:                                        ; preds = %for.cond2
  %7 = load i32* %i, align 4
  %idxprom5 = sext i32 %7 to i64
  %arrayidx6 = getelementptr inbounds [4 x i32]* %fval, i32 0, i64 %idxprom5
  %8 = load i32* %arrayidx6, align 4
  %call7 = call i32 @foo(i32 0, i32 %8)
  br label %for.inc8

for.inc8:                                         ; preds = %for.body4
  %9 = load i32* %i, align 4
  %inc = add nsw i32 %9, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond2

for.end9:                                         ; preds = %for.cond2
  ret i32 0
}
