; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/loop-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca [3 x i32], align 4
  store i32 0, i32* %retval
  store i32 0, i32* %j, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32* %i, align 4
  %cmp = icmp slt i32 %0, 3
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %1 = load i32* %j, align 4
  %inc = add nsw i32 %1, 1
  store i32 %inc, i32* %j, align 4
  %2 = load i32* %i, align 4
  %idxprom = sext i32 %2 to i64
  %arrayidx = getelementptr inbounds [3 x i32]* %k, i32 0, i64 %idxprom
  store i32 %1, i32* %arrayidx, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %3 = load i32* %i, align 4
  %inc1 = add nsw i32 %3, 1
  store i32 %inc1, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store i32 2, i32* %i, align 4
  br label %for.cond2

for.cond2:                                        ; preds = %for.inc8, %for.end
  %4 = load i32* %i, align 4
  %cmp3 = icmp sge i32 %4, 0
  br i1 %cmp3, label %for.body4, label %for.end9

for.body4:                                        ; preds = %for.cond2
  %5 = load i32* %i, align 4
  %idxprom5 = sext i32 %5 to i64
  %arrayidx6 = getelementptr inbounds [3 x i32]* %k, i32 0, i64 %idxprom5
  %6 = load i32* %arrayidx6, align 4
  %7 = load i32* %i, align 4
  %cmp7 = icmp ne i32 %6, %7
  br i1 %cmp7, label %if.then, label %if.end

if.then:                                          ; preds = %for.body4
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %for.body4
  br label %for.inc8

for.inc8:                                         ; preds = %if.end
  %8 = load i32* %i, align 4
  %dec = add nsw i32 %8, -1
  store i32 %dec, i32* %i, align 4
  br label %for.cond2

for.end9:                                         ; preds = %for.cond2
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %9 = load i32* %retval
  ret i32 %9
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
