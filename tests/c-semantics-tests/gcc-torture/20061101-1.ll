; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20061101-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @tar(i32 %i) nounwind uwtable {
entry:
  %i.addr = alloca i32, align 4
  store i32 %i, i32* %i.addr, align 4
  %0 = load i32* %i.addr, align 4
  %cmp = icmp ne i32 %0, 36863
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret i32 -1
}

declare void @abort() noreturn nounwind

define void @bug(i32 %q, i32 %bcount) nounwind uwtable {
entry:
  %q.addr = alloca i32, align 4
  %bcount.addr = alloca i32, align 4
  %j = alloca i32, align 4
  %outgo = alloca i32, align 4
  store i32 %q, i32* %q.addr, align 4
  store i32 %bcount, i32* %bcount.addr, align 4
  store i32 0, i32* %j, align 4
  store i32 0, i32* %outgo, align 4
  br label %while.cond

while.cond:                                       ; preds = %if.end, %entry
  %0 = load i32* %j, align 4
  %cmp = icmp ne i32 %0, -1
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %1 = load i32* %outgo, align 4
  %inc = add nsw i32 %1, 1
  store i32 %inc, i32* %outgo, align 4
  %2 = load i32* %outgo, align 4
  %3 = load i32* %q.addr, align 4
  %sub = sub nsw i32 %3, 1
  %cmp1 = icmp sgt i32 %2, %sub
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %while.body
  %4 = load i32* %q.addr, align 4
  %sub2 = sub nsw i32 %4, 1
  store i32 %sub2, i32* %outgo, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %while.body
  %5 = load i32* %outgo, align 4
  %6 = load i32* %bcount.addr, align 4
  %mul = mul nsw i32 %5, %6
  %call = call i32 @tar(i32 %mul)
  store i32 %call, i32* %j, align 4
  br label %while.cond

while.end:                                        ; preds = %while.cond
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  call void @bug(i32 5, i32 36863)
  ret i32 0
}
