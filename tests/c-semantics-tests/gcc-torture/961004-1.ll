; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/961004-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@k = global i32 0, align 4

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32* %i, align 4
  %cmp = icmp slt i32 %0, 2
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %1 = load i32* @k, align 4
  %tobool = icmp ne i32 %1, 0
  br i1 %tobool, label %if.then, label %if.else

if.then:                                          ; preds = %for.body
  %2 = load i32* %j, align 4
  %cmp1 = icmp ne i32 %2, 2
  br i1 %cmp1, label %if.then2, label %if.end

if.then2:                                         ; preds = %if.then
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %if.then
  br label %if.end3

if.else:                                          ; preds = %for.body
  store i32 2, i32* %j, align 4
  %3 = load i32* @k, align 4
  %inc = add nsw i32 %3, 1
  store i32 %inc, i32* @k, align 4
  br label %if.end3

if.end3:                                          ; preds = %if.else, %if.end
  br label %for.inc

for.inc:                                          ; preds = %if.end3
  %4 = load i32* %i, align 4
  %inc4 = add nsw i32 %4, 1
  store i32 %inc4, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %5 = load i32* %retval
  ret i32 %5
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
