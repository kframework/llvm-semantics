; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20000731-2.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 1, i32* %i, align 4
  store i32 0, i32* %j, align 4
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %0 = load i32* %i, align 4
  %cmp = icmp ne i32 %0, 1024
  br i1 %cmp, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %while.cond
  %1 = load i32* %j, align 4
  %cmp1 = icmp sle i32 %1, 0
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %while.cond
  %2 = phi i1 [ true, %while.cond ], [ %cmp1, %lor.rhs ]
  br i1 %2, label %while.body, label %while.end

while.body:                                       ; preds = %lor.end
  %3 = load i32* %i, align 4
  %mul = mul nsw i32 %3, 2
  store i32 %mul, i32* %i, align 4
  %4 = load i32* %j, align 4
  %inc = add nsw i32 %4, 1
  store i32 %inc, i32* %j, align 4
  br label %while.cond

while.end:                                        ; preds = %lor.end
  %5 = load i32* %j, align 4
  %cmp2 = icmp ne i32 %5, 10
  br i1 %cmp2, label %if.then, label %if.end

if.then:                                          ; preds = %while.end
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %while.end
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %6 = load i32* %retval
  ret i32 %6
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
