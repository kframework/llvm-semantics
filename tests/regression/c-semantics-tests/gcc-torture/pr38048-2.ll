; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/pr38048-2.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @foo() nounwind uwtable {
entry:
  %mat = alloca [2 x [2 x i32]], align 16
  %arrayidx = getelementptr inbounds [2 x [2 x i32]]* %mat, i32 0, i64 0
  %arrayidx1 = getelementptr inbounds [2 x i32]* %arrayidx, i32 0, i64 0
  store i32 1, i32* %arrayidx1, align 4
  %arrayidx2 = getelementptr inbounds [2 x [2 x i32]]* %mat, i32 0, i64 0
  %arrayidx3 = getelementptr inbounds [2 x i32]* %arrayidx2, i32 0, i64 1
  store i32 2, i32* %arrayidx3, align 4
  %arrayidx4 = getelementptr inbounds [2 x [2 x i32]]* %mat, i32 0, i64 1
  %arrayidx5 = getelementptr inbounds [2 x i32]* %arrayidx4, i32 0, i64 0
  store i32 4, i32* %arrayidx5, align 4
  %arrayidx6 = getelementptr inbounds [2 x [2 x i32]]* %mat, i32 0, i64 1
  %arrayidx7 = getelementptr inbounds [2 x i32]* %arrayidx6, i32 0, i64 1
  store i32 8, i32* %arrayidx7, align 4
  %arraydecay = getelementptr inbounds [2 x [2 x i32]]* %mat, i32 0, i32 0
  %call = call i32 @inv_J([2 x i32]* %arraydecay)
  ret i32 %call
}

define internal i32 @inv_J([2 x i32]* %a) nounwind uwtable {
entry:
  %a.addr = alloca [2 x i32]*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %det = alloca i32, align 4
  store [2 x i32]* %a, [2 x i32]** %a.addr, align 8
  store i32 0, i32* %det, align 4
  store i32 0, i32* %j, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32* %j, align 4
  %cmp = icmp slt i32 %0, 2
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %1 = load i32* %j, align 4
  %idxprom = sext i32 %1 to i64
  %2 = load [2 x i32]** %a.addr, align 8
  %arrayidx = getelementptr inbounds [2 x i32]* %2, i64 %idxprom
  %arrayidx1 = getelementptr inbounds [2 x i32]* %arrayidx, i32 0, i64 0
  %3 = load i32* %arrayidx1, align 4
  %4 = load i32* %j, align 4
  %idxprom2 = sext i32 %4 to i64
  %5 = load [2 x i32]** %a.addr, align 8
  %arrayidx3 = getelementptr inbounds [2 x i32]* %5, i64 %idxprom2
  %arrayidx4 = getelementptr inbounds [2 x i32]* %arrayidx3, i32 0, i64 1
  %6 = load i32* %arrayidx4, align 4
  %add = add nsw i32 %3, %6
  %7 = load i32* %det, align 4
  %add5 = add nsw i32 %7, %add
  store i32 %add5, i32* %det, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %8 = load i32* %j, align 4
  %inc = add nsw i32 %8, 1
  store i32 %inc, i32* %j, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %9 = load i32* %det, align 4
  ret i32 %9
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  %call = call i32 @foo()
  %cmp = icmp ne i32 %call, 15
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret i32 0
}

declare void @abort() noreturn nounwind
