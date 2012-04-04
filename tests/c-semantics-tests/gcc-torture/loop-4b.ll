; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/loop-4b.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @f() nounwind uwtable {
entry:
  %j = alloca i32, align 4
  %i = alloca i64, align 8
  store i32 1, i32* %j, align 4
  store i64 1610612736, i64* %i, align 8
  br label %do.body

do.body:                                          ; preds = %do.cond, %entry
  %0 = load i32* %j, align 4
  %shl = shl i32 %0, 1
  store i32 %shl, i32* %j, align 4
  %1 = load i64* %i, align 8
  %add = add nsw i64 %1, 268435456
  store i64 %add, i64* %i, align 8
  br label %do.cond

do.cond:                                          ; preds = %do.body
  %2 = load i64* %i, align 8
  %cmp = icmp slt i64 %2, -1610612736
  br i1 %cmp, label %do.body, label %do.end

do.end:                                           ; preds = %do.cond
  %3 = load i32* %j, align 4
  ret i32 %3
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  %call = call i32 @f()
  %cmp = icmp ne i32 %call, 2
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
