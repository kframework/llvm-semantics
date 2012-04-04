; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/960909-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @ffs(i32 %x) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %x.addr = alloca i32, align 4
  %bit = alloca i32, align 4
  %mask = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* %x.addr, align 4
  %cmp = icmp eq i32 %0, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval
  br label %return

if.end:                                           ; preds = %entry
  store i32 1, i32* %bit, align 4
  store i32 1, i32* %mask, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end
  %1 = load i32* %x.addr, align 4
  %2 = load i32* %mask, align 4
  %and = and i32 %1, %2
  %tobool = icmp ne i32 %and, 0
  %lnot = xor i1 %tobool, true
  br i1 %lnot, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %3 = load i32* %bit, align 4
  %inc = add nsw i32 %3, 1
  store i32 %inc, i32* %bit, align 4
  %4 = load i32* %mask, align 4
  %shl = shl i32 %4, 1
  store i32 %shl, i32* %mask, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %5 = load i32* %bit, align 4
  store i32 %5, i32* %retval
  br label %return

return:                                           ; preds = %for.end, %if.then
  %6 = load i32* %retval
  ret i32 %6
}

define void @f(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  %y = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* %x.addr, align 4
  %call = call i32 (...)* bitcast (i32 (i32)* @ffs to i32 (...)*)(i32 %0)
  %sub = sub nsw i32 %call, 1
  store i32 %sub, i32* %y, align 4
  %1 = load i32* %y, align 4
  %cmp = icmp slt i32 %1, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret void
}

declare void @abort() noreturn nounwind

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  call void (...)* bitcast (void (i32)* @f to void (...)*)(i32 1)
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

declare void @exit(i32) noreturn nounwind
