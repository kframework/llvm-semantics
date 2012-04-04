; ModuleID = '/home/david/src/c-semantics/tests/integration/hanoiSimple.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@step = common global i32 0, align 4

define void @hanoi(i32 %t1, i32 %t2, i32 %t3, i32 %n) nounwind uwtable {
entry:
  %t1.addr = alloca i32, align 4
  %t2.addr = alloca i32, align 4
  %t3.addr = alloca i32, align 4
  %n.addr = alloca i32, align 4
  store i32 %t1, i32* %t1.addr, align 4
  store i32 %t2, i32* %t2.addr, align 4
  store i32 %t3, i32* %t3.addr, align 4
  store i32 %n, i32* %n.addr, align 4
  %0 = load i32* @step, align 4
  %inc = add nsw i32 %0, 1
  store i32 %inc, i32* @step, align 4
  %1 = load i32* %n.addr, align 4
  %cmp = icmp eq i32 %1, 1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  br label %return

if.end:                                           ; preds = %entry
  %2 = load i32* %t1.addr, align 4
  %3 = load i32* %t3.addr, align 4
  %4 = load i32* %t2.addr, align 4
  %5 = load i32* %n.addr, align 4
  %sub = sub nsw i32 %5, 1
  call void @hanoi(i32 %2, i32 %3, i32 %4, i32 %sub)
  %6 = load i32* %t3.addr, align 4
  %7 = load i32* %t2.addr, align 4
  %8 = load i32* %t1.addr, align 4
  %9 = load i32* %n.addr, align 4
  %sub1 = sub nsw i32 %9, 1
  call void @hanoi(i32 %6, i32 %7, i32 %8, i32 %sub1)
  br label %return

return:                                           ; preds = %if.end, %if.then
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %n = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 4, i32* %n, align 4
  %0 = load i32* %n, align 4
  call void @hanoi(i32 1, i32 2, i32 3, i32 %0)
  %1 = load i32* @step, align 4
  ret i32 %1
}
