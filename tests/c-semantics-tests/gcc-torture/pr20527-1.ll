; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/pr20527-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@b = global [4 x i64] [i64 1, i64 5, i64 11, i64 23], align 16

define void @f(i64* %limit, i64* %base, i64 %minLen, i64 %maxLen) nounwind uwtable noinline {
entry:
  %limit.addr = alloca i64*, align 8
  %base.addr = alloca i64*, align 8
  %minLen.addr = alloca i64, align 8
  %maxLen.addr = alloca i64, align 8
  %i = alloca i64, align 8
  %vec = alloca i64, align 8
  store i64* %limit, i64** %limit.addr, align 8
  store i64* %base, i64** %base.addr, align 8
  store i64 %minLen, i64* %minLen.addr, align 8
  store i64 %maxLen, i64* %maxLen.addr, align 8
  store i64 0, i64* %vec, align 8
  %0 = load i64* %minLen.addr, align 8
  store i64 %0, i64* %i, align 8
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64* %i, align 8
  %2 = load i64* %maxLen.addr, align 8
  %cmp = icmp sle i64 %1, %2
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %3 = load i64* %i, align 8
  %add = add nsw i64 %3, 1
  %4 = load i64** %base.addr, align 8
  %arrayidx = getelementptr inbounds i64* %4, i64 %add
  %5 = load i64* %arrayidx, align 8
  %6 = load i64* %i, align 8
  %7 = load i64** %base.addr, align 8
  %arrayidx1 = getelementptr inbounds i64* %7, i64 %6
  %8 = load i64* %arrayidx1, align 8
  %sub = sub nsw i64 %5, %8
  %9 = load i64* %vec, align 8
  %add2 = add nsw i64 %9, %sub
  store i64 %add2, i64* %vec, align 8
  %10 = load i64* %vec, align 8
  %sub3 = sub nsw i64 %10, 1
  %11 = load i64* %i, align 8
  %12 = load i64** %limit.addr, align 8
  %arrayidx4 = getelementptr inbounds i64* %12, i64 %11
  store i64 %sub3, i64* %arrayidx4, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %13 = load i64* %i, align 8
  %inc = add nsw i64 %13, 1
  store i64 %inc, i64* %i, align 8
  br label %for.cond

for.end:                                          ; preds = %for.cond
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %l = alloca [3 x i64], align 16
  store i32 0, i32* %retval
  %arraydecay = getelementptr inbounds [3 x i64]* %l, i32 0, i32 0
  call void @f(i64* %arraydecay, i64* getelementptr inbounds ([4 x i64]* @b, i32 0, i32 0), i64 0, i64 2)
  %arrayidx = getelementptr inbounds [3 x i64]* %l, i32 0, i64 0
  %0 = load i64* %arrayidx, align 8
  %cmp = icmp ne i64 %0, 3
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %arrayidx1 = getelementptr inbounds [3 x i64]* %l, i32 0, i64 1
  %1 = load i64* %arrayidx1, align 8
  %cmp2 = icmp ne i64 %1, 9
  br i1 %cmp2, label %if.then, label %lor.lhs.false3

lor.lhs.false3:                                   ; preds = %lor.lhs.false
  %arrayidx4 = getelementptr inbounds [3 x i64]* %l, i32 0, i64 2
  %2 = load i64* %arrayidx4, align 8
  %cmp5 = icmp ne i64 %2, 21
  br i1 %cmp5, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false3, %lor.lhs.false, %entry
  call void @abort() noreturn
  unreachable

if.end:                                           ; preds = %lor.lhs.false3
  call void @exit(i32 0) noreturn
  unreachable

return:                                           ; No predecessors!
  %3 = load i32* %retval
  ret i32 %3
}

declare void @abort() noreturn

declare void @exit(i32) noreturn
