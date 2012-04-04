; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/990527-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@sum = common global i32 0, align 4

define void @g(i32 %i) nounwind uwtable {
entry:
  %i.addr = alloca i32, align 4
  store i32 %i, i32* %i.addr, align 4
  %0 = load i32* %i.addr, align 4
  %1 = load i32* @sum, align 4
  %add = add nsw i32 %1, %0
  store i32 %add, i32* @sum, align 4
  ret void
}

define void @f(i32 %j) nounwind uwtable {
entry:
  %j.addr = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 %j, i32* %j.addr, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32* %i, align 4
  %cmp = icmp slt i32 %0, 9
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %1 = load i32* %j.addr, align 4
  %inc = add nsw i32 %1, 1
  store i32 %inc, i32* %j.addr, align 4
  %2 = load i32* %j.addr, align 4
  call void @g(i32 %2)
  store i32 9, i32* %j.addr, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %3 = load i32* %i, align 4
  %inc1 = add nsw i32 %3, 1
  store i32 %inc1, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  call void @f(i32 0)
  %0 = load i32* @sum, align 4
  %cmp = icmp ne i32 %0, 81
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %1 = load i32* %retval
  ret i32 %1
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
