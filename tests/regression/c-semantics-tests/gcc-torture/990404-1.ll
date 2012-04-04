; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/990404-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@x = global [10 x i32] [i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9], align 16

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %niterations = alloca i32, align 4
  %i = alloca i32, align 4
  %i1 = alloca i32, align 4
  %mi = alloca i32, align 4
  %max = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 0, i32* %niterations, align 4
  br label %for.cond

for.cond:                                         ; preds = %if.end14, %entry
  store i32 0, i32* %max, align 4
  store i32 0, i32* %i1, align 4
  br label %for.cond2

for.cond2:                                        ; preds = %for.inc, %for.cond
  %0 = load i32* %i1, align 4
  %cmp = icmp slt i32 %0, 10
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond2
  %1 = load i32* %i1, align 4
  %idxprom = sext i32 %1 to i64
  %arrayidx = getelementptr inbounds [10 x i32]* @x, i32 0, i64 %idxprom
  %2 = load i32* %arrayidx, align 4
  %3 = load i32* %max, align 4
  %cmp3 = icmp sgt i32 %2, %3
  br i1 %cmp3, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %4 = load i32* %i1, align 4
  %idxprom4 = sext i32 %4 to i64
  %arrayidx5 = getelementptr inbounds [10 x i32]* @x, i32 0, i64 %idxprom4
  %5 = load i32* %arrayidx5, align 4
  store i32 %5, i32* %max, align 4
  %6 = load i32* %i1, align 4
  store i32 %6, i32* %mi, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %7 = load i32* %i1, align 4
  %inc = add nsw i32 %7, 1
  store i32 %inc, i32* %i1, align 4
  br label %for.cond2

for.end:                                          ; preds = %for.cond2
  %8 = load i32* %max, align 4
  %cmp6 = icmp eq i32 %8, 0
  br i1 %cmp6, label %if.then7, label %if.end8

if.then7:                                         ; preds = %for.end
  br label %for.end15

if.end8:                                          ; preds = %for.end
  %9 = load i32* %mi, align 4
  %idxprom9 = sext i32 %9 to i64
  %arrayidx10 = getelementptr inbounds [10 x i32]* @x, i32 0, i64 %idxprom9
  store i32 0, i32* %arrayidx10, align 4
  %10 = load i32* %niterations, align 4
  %inc11 = add nsw i32 %10, 1
  store i32 %inc11, i32* %niterations, align 4
  %11 = load i32* %niterations, align 4
  %cmp12 = icmp sgt i32 %11, 10
  br i1 %cmp12, label %if.then13, label %if.end14

if.then13:                                        ; preds = %if.end8
  call void @abort() noreturn nounwind
  unreachable

if.end14:                                         ; preds = %if.end8
  br label %for.cond

for.end15:                                        ; preds = %if.then7
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %12 = load i32* %retval
  ret i32 %12
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
