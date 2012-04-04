; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/991216-4.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  call void @bug(i32 5, i32 10)
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

define internal void @bug(i32 %size, i32 %tries) nounwind uwtable {
entry:
  %size.addr = alloca i32, align 4
  %tries.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %num = alloca i32, align 4
  store i32 %size, i32* %size.addr, align 4
  store i32 %tries, i32* %tries.addr, align 4
  store i32 0, i32* %num, align 4
  br label %while.cond

while.cond:                                       ; preds = %for.end, %entry
  %0 = load i32* %num, align 4
  %1 = load i32* %size.addr, align 4
  %cmp = icmp slt i32 %0, %1
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  store i32 1, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %while.body
  %2 = load i32* %i, align 4
  %3 = load i32* %tries.addr, align 4
  %cmp1 = icmp slt i32 %2, %3
  br i1 %cmp1, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %4 = load i32* %num, align 4
  %inc = add nsw i32 %4, 1
  store i32 %inc, i32* %num, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %5 = load i32* %i, align 4
  %inc2 = add nsw i32 %5, 1
  store i32 %inc2, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  br label %while.cond

while.end:                                        ; preds = %while.cond
  ret void
}

declare void @exit(i32) noreturn nounwind
