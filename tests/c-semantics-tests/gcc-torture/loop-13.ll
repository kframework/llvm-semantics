; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/loop-13.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define void @scale(i64* %alpha, i64* %x, i32 %n) nounwind uwtable {
entry:
  %alpha.addr = alloca i64*, align 8
  %x.addr = alloca i64*, align 8
  %n.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %ix = alloca i32, align 4
  %tmpr = alloca i64, align 8
  %tmpi = alloca i64, align 8
  store i64* %alpha, i64** %alpha.addr, align 8
  store i64* %x, i64** %x.addr, align 8
  store i32 %n, i32* %n.addr, align 4
  %0 = load i64** %alpha.addr, align 8
  %1 = load i64* %0, align 8
  %cmp = icmp ne i64 %1, 1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 0, i32* %i, align 4
  store i32 0, i32* %ix, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.then
  %2 = load i32* %i, align 4
  %3 = load i32* %n.addr, align 4
  %cmp1 = icmp slt i32 %2, %3
  br i1 %cmp1, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %4 = load i64** %alpha.addr, align 8
  %5 = load i64* %4, align 8
  %6 = load i32* %ix, align 4
  %idxprom = sext i32 %6 to i64
  %7 = load i64** %x.addr, align 8
  %arrayidx = getelementptr inbounds i64* %7, i64 %idxprom
  %8 = load i64* %arrayidx, align 8
  %mul = mul nsw i64 %5, %8
  store i64 %mul, i64* %tmpr, align 8
  %9 = load i64** %alpha.addr, align 8
  %10 = load i64* %9, align 8
  %11 = load i32* %ix, align 4
  %add = add nsw i32 %11, 1
  %idxprom2 = sext i32 %add to i64
  %12 = load i64** %x.addr, align 8
  %arrayidx3 = getelementptr inbounds i64* %12, i64 %idxprom2
  %13 = load i64* %arrayidx3, align 8
  %mul4 = mul nsw i64 %10, %13
  store i64 %mul4, i64* %tmpi, align 8
  %14 = load i64* %tmpr, align 8
  %15 = load i32* %ix, align 4
  %idxprom5 = sext i32 %15 to i64
  %16 = load i64** %x.addr, align 8
  %arrayidx6 = getelementptr inbounds i64* %16, i64 %idxprom5
  store i64 %14, i64* %arrayidx6, align 8
  %17 = load i64* %tmpi, align 8
  %18 = load i32* %ix, align 4
  %add7 = add nsw i32 %18, 1
  %idxprom8 = sext i32 %add7 to i64
  %19 = load i64** %x.addr, align 8
  %arrayidx9 = getelementptr inbounds i64* %19, i64 %idxprom8
  store i64 %17, i64* %arrayidx9, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %20 = load i32* %i, align 4
  %inc = add nsw i32 %20, 1
  store i32 %inc, i32* %i, align 4
  %21 = load i32* %ix, align 4
  %add10 = add nsw i32 %21, 2
  store i32 %add10, i32* %ix, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  br label %if.end

if.end:                                           ; preds = %for.end, %entry
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %i = alloca i32, align 4
  %x = alloca [10 x i64], align 16
  %alpha = alloca i64, align 8
  store i32 0, i32* %retval
  store i64 2, i64* %alpha, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32* %i, align 4
  %cmp = icmp slt i32 %0, 10
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %1 = load i32* %i, align 4
  %conv = sext i32 %1 to i64
  %2 = load i32* %i, align 4
  %idxprom = sext i32 %2 to i64
  %arrayidx = getelementptr inbounds [10 x i64]* %x, i32 0, i64 %idxprom
  store i64 %conv, i64* %arrayidx, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %3 = load i32* %i, align 4
  %inc = add nsw i32 %3, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %arraydecay = getelementptr inbounds [10 x i64]* %x, i32 0, i32 0
  call void @scale(i64* %alpha, i64* %arraydecay, i32 5)
  %arrayidx1 = getelementptr inbounds [10 x i64]* %x, i32 0, i64 9
  %4 = load i64* %arrayidx1, align 8
  %cmp2 = icmp ne i64 %4, 18
  br i1 %cmp2, label %if.then, label %if.end

if.then:                                          ; preds = %for.end
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %for.end
  ret i32 0
}

declare void @abort() noreturn nounwind
