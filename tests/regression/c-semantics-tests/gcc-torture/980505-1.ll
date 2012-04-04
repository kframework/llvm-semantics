; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/980505-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %f1 = alloca i32, align 4
  %f2 = alloca i32, align 4
  %x = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 1, i32* %x, align 4
  %0 = load i32* %x, align 4
  %call = call i32 @f(i32 %0) nounwind readnone
  store i32 %call, i32* %f1, align 4
  store i32 2, i32* %x, align 4
  %1 = load i32* %x, align 4
  %call1 = call i32 @f(i32 %1) nounwind readnone
  store i32 %call1, i32* %f2, align 4
  %2 = load i32* %f1, align 4
  %cmp = icmp ne i32 %2, 1
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %3 = load i32* %f2, align 4
  %cmp2 = icmp ne i32 %3, 2
  br i1 %cmp2, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %lor.lhs.false
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %4 = load i32* %retval
  ret i32 %4
}

define internal i32 @f(i32 %x) nounwind uwtable readnone {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* %x.addr, align 4
  ret i32 %0
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
