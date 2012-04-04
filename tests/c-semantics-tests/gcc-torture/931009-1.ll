; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/931009-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  call void @f()
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

declare void @exit(i32) noreturn nounwind

define void @f() nounwind uwtable {
entry:
  %a = alloca [2 x i32], align 4
  %arraydecay = getelementptr inbounds [2 x i32]* %a, i32 0, i32 0
  call void (...)* bitcast (void (i32*, i32, i32, i32)* @g to void (...)*)(i32* %arraydecay, i32 2, i32 0, i32 1)
  %arrayidx = getelementptr inbounds [2 x i32]* %a, i32 0, i64 0
  %0 = load i32* %arrayidx, align 4
  %cmp = icmp ne i32 %0, 0
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %arrayidx1 = getelementptr inbounds [2 x i32]* %a, i32 0, i64 1
  %1 = load i32* %arrayidx1, align 4
  %cmp2 = icmp ne i32 %1, 1
  br i1 %cmp2, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %lor.lhs.false
  ret void
}

define internal void @g(i32* %out, i32 %size, i32 %lo, i32 %hi) nounwind uwtable {
entry:
  %out.addr = alloca i32*, align 8
  %size.addr = alloca i32, align 4
  %lo.addr = alloca i32, align 4
  %hi.addr = alloca i32, align 4
  %j = alloca i32, align 4
  store i32* %out, i32** %out.addr, align 8
  store i32 %size, i32* %size.addr, align 4
  store i32 %lo, i32* %lo.addr, align 4
  store i32 %hi, i32* %hi.addr, align 4
  store i32 0, i32* %j, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32* %j, align 4
  %1 = load i32* %size.addr, align 4
  %cmp = icmp slt i32 %0, %1
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %2 = load i32* %j, align 4
  %3 = load i32* %hi.addr, align 4
  %4 = load i32* %lo.addr, align 4
  %sub = sub nsw i32 %3, %4
  %mul = mul nsw i32 %2, %sub
  %5 = load i32* %j, align 4
  %idxprom = sext i32 %5 to i64
  %6 = load i32** %out.addr, align 8
  %arrayidx = getelementptr inbounds i32* %6, i64 %idxprom
  store i32 %mul, i32* %arrayidx, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %7 = load i32* %j, align 4
  %inc = add nsw i32 %7, 1
  store i32 %inc, i32* %j, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  ret void
}

declare void @abort() noreturn nounwind
