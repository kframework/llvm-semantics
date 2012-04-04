; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20041213-2.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define void @foo(i32 %i) nounwind uwtable noinline {
entry:
  %i.addr = alloca i32, align 4
  %next_n = alloca i32, align 4
  %j = alloca i32, align 4
  %n = alloca i32, align 4
  store i32 %i, i32* %i.addr, align 4
  store i32 1, i32* %next_n, align 4
  store i32 0, i32* %j, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc6, %entry
  %0 = load i32* %i.addr, align 4
  %cmp = icmp ne i32 %0, 0
  br i1 %cmp, label %for.body, label %for.end7

for.body:                                         ; preds = %for.cond
  %1 = load i32* %next_n, align 4
  store i32 %1, i32* %n, align 4
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc, %for.body
  %2 = load i32* %j, align 4
  %3 = load i32* %n, align 4
  %cmp2 = icmp slt i32 %2, %3
  br i1 %cmp2, label %for.body3, label %for.end

for.body3:                                        ; preds = %for.cond1
  %4 = load i32* %next_n, align 4
  %inc = add nsw i32 %4, 1
  store i32 %inc, i32* %next_n, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body3
  %5 = load i32* %j, align 4
  %inc4 = add nsw i32 %5, 1
  store i32 %inc4, i32* %j, align 4
  br label %for.cond1

for.end:                                          ; preds = %for.cond1
  %6 = load i32* %j, align 4
  %7 = load i32* %n, align 4
  %cmp5 = icmp ne i32 %6, %7
  br i1 %cmp5, label %if.then, label %if.end

if.then:                                          ; preds = %for.end
  call void @abort() noreturn
  unreachable

if.end:                                           ; preds = %for.end
  br label %for.inc6

for.inc6:                                         ; preds = %if.end
  %8 = load i32* %i.addr, align 4
  %dec = add nsw i32 %8, -1
  store i32 %dec, i32* %i.addr, align 4
  br label %for.cond

for.end7:                                         ; preds = %for.cond
  ret void
}

declare void @abort() noreturn

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  call void @foo(i32 2)
  call void @exit(i32 0) noreturn
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

declare void @exit(i32) noreturn
