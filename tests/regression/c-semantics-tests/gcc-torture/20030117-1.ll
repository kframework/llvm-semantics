; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20030117-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  %call = call i32 @foo(i32 5, i32 10, i32 21)
  %cmp = icmp ne i32 %call, 12
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  %call1 = call i32 @bar(i32 9, i32 12, i32 15)
  %cmp2 = icmp ne i32 %call1, 150
  br i1 %cmp2, label %if.then3, label %if.end4

if.then3:                                         ; preds = %if.end
  call void @abort() noreturn nounwind
  unreachable

if.end4:                                          ; preds = %if.end
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

define i32 @foo(i32 %x, i32 %y, i32 %z) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  %y.addr = alloca i32, align 4
  %z.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  store i32 %y, i32* %y.addr, align 4
  store i32 %z, i32* %z.addr, align 4
  %0 = load i32* %x.addr, align 4
  %1 = load i32* %y.addr, align 4
  %add = add nsw i32 %0, %1
  %2 = load i32* %z.addr, align 4
  %add1 = add nsw i32 %add, %2
  %div = sdiv i32 %add1, 3
  ret i32 %div
}

declare void @abort() noreturn nounwind

define i32 @bar(i32 %x, i32 %y, i32 %z) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  %y.addr = alloca i32, align 4
  %z.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  store i32 %y, i32* %y.addr, align 4
  store i32 %z, i32* %z.addr, align 4
  %0 = load i32* %x.addr, align 4
  %1 = load i32* %x.addr, align 4
  %mul = mul nsw i32 %0, %1
  %2 = load i32* %y.addr, align 4
  %3 = load i32* %y.addr, align 4
  %mul1 = mul nsw i32 %2, %3
  %4 = load i32* %z.addr, align 4
  %5 = load i32* %z.addr, align 4
  %mul2 = mul nsw i32 %4, %5
  %call = call i32 @foo(i32 %mul, i32 %mul1, i32 %mul2)
  ret i32 %call
}

declare void @exit(i32) noreturn nounwind
