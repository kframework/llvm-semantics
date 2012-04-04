; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/unroll-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @main() nounwind uwtable {
entry:
  %a = alloca i32, align 4
  store i32 0, i32* %a, align 4
  br label %while.cond

while.cond:                                       ; preds = %entry
  %call = call i32 @f(i32 1)
  %call1 = call i32 @f(i32 %call)
  %call2 = call i32 @f(i32 %call1)
  %call3 = call i32 @f(i32 %call2)
  %call4 = call i32 @f(i32 %call3)
  %call5 = call i32 @f(i32 %call4)
  %call6 = call i32 @f(i32 %call5)
  %call7 = call i32 @f(i32 %call6)
  %call8 = call i32 @f(i32 %call7)
  %call9 = call i32 @f(i32 %call8)
  %0 = load i32* %a, align 4
  %add = add nsw i32 %call9, %0
  %cmp = icmp slt i32 %add, 12
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %1 = load i32* %a, align 4
  %inc = add nsw i32 %1, 1
  store i32 %inc, i32* %a, align 4
  call void @exit(i32 0) noreturn nounwind
  unreachable

while.end:                                        ; preds = %while.cond
  %2 = load i32* %a, align 4
  %cmp10 = icmp ne i32 %2, 1
  br i1 %cmp10, label %if.then, label %if.end

if.then:                                          ; preds = %while.end
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %while.end
  ret i32 0
}

declare i32 @f(i32)

declare void @exit(i32) noreturn nounwind

declare void @abort() noreturn nounwind
