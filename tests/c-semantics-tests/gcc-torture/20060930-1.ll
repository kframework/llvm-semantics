; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20060930-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @bar(i32 %a, i32 %b) nounwind uwtable noinline {
entry:
  %a.addr = alloca i32, align 4
  %b.addr = alloca i32, align 4
  store i32 %a, i32* %a.addr, align 4
  store i32 %b, i32* %b.addr, align 4
  %0 = load i32* %b.addr, align 4
  %cmp = icmp ne i32 %0, 1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret i32 0
}

declare void @abort() noreturn nounwind

define void @foo(i32 %e, i32 %n) nounwind uwtable noinline {
entry:
  %e.addr = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %bb2 = alloca i32, align 4
  %bb5 = alloca i32, align 4
  store i32 %e, i32* %e.addr, align 4
  store i32 %n, i32* %n.addr, align 4
  %0 = load i32* %e.addr, align 4
  %cmp = icmp sgt i32 %0, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load i32* %e.addr, align 4
  %sub = sub nsw i32 0, %1
  store i32 %sub, i32* %e.addr, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i32* %i, align 4
  %3 = load i32* %n.addr, align 4
  %cmp1 = icmp slt i32 %2, %3
  br i1 %cmp1, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %4 = load i32* %e.addr, align 4
  %cmp2 = icmp sge i32 %4, 0
  br i1 %cmp2, label %if.then3, label %if.else

if.then3:                                         ; preds = %for.body
  store i32 0, i32* %bb2, align 4
  store i32 0, i32* %bb5, align 4
  br label %if.end5

if.else:                                          ; preds = %for.body
  %5 = load i32* %e.addr, align 4
  %sub4 = sub nsw i32 0, %5
  store i32 %sub4, i32* %bb5, align 4
  %6 = load i32* %bb5, align 4
  store i32 %6, i32* %bb2, align 4
  br label %if.end5

if.end5:                                          ; preds = %if.else, %if.then3
  %7 = load i32* %bb5, align 4
  %8 = load i32* %bb2, align 4
  %call = call i32 @bar(i32 %7, i32 %8)
  br label %for.inc

for.inc:                                          ; preds = %if.end5
  %9 = load i32* %i, align 4
  %inc = add nsw i32 %9, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  call void @foo(i32 1, i32 1)
  ret i32 0
}
