; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/pr38048-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @foo() nounwind uwtable {
entry:
  %mat = alloca [2 x [1 x i32]], align 4
  %a = alloca [1 x i32]*, align 8
  %det = alloca i32, align 4
  %i = alloca i32, align 4
  %arraydecay = getelementptr inbounds [2 x [1 x i32]]* %mat, i32 0, i32 0
  store [1 x i32]* %arraydecay, [1 x i32]** %a, align 8
  store i32 0, i32* %det, align 4
  %arrayidx = getelementptr inbounds [2 x [1 x i32]]* %mat, i32 0, i64 0
  %arrayidx1 = getelementptr inbounds [1 x i32]* %arrayidx, i32 0, i64 0
  store i32 1, i32* %arrayidx1, align 4
  %arrayidx2 = getelementptr inbounds [2 x [1 x i32]]* %mat, i32 0, i64 1
  %arrayidx3 = getelementptr inbounds [1 x i32]* %arrayidx2, i32 0, i64 0
  store i32 2, i32* %arrayidx3, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32* %i, align 4
  %cmp = icmp slt i32 %0, 2
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %1 = load i32* %i, align 4
  %idxprom = sext i32 %1 to i64
  %2 = load [1 x i32]** %a, align 8
  %arrayidx4 = getelementptr inbounds [1 x i32]* %2, i64 %idxprom
  %arrayidx5 = getelementptr inbounds [1 x i32]* %arrayidx4, i32 0, i64 0
  %3 = load i32* %arrayidx5, align 4
  %4 = load i32* %det, align 4
  %add = add nsw i32 %4, %3
  store i32 %add, i32* %det, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %5 = load i32* %i, align 4
  %inc = add nsw i32 %5, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %6 = load i32* %det, align 4
  ret i32 %6
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  %call = call i32 @foo()
  %cmp = icmp ne i32 %call, 3
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret i32 0
}

declare void @abort() noreturn nounwind
