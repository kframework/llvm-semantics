; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/990923-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i64 @foo(i64 %x) nounwind uwtable {
entry:
  %retval = alloca i64, align 8
  %x.addr = alloca i64, align 8
  store i64 %x, i64* %x.addr, align 8
  %0 = load i64* %x.addr, align 8
  %and = and i64 %0, 4294901760
  %cmp = icmp eq i64 %and, 2882338816
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load i64* %x.addr, align 8
  %and1 = and i64 %1, 65535
  store i64 %and1, i64* %retval
  br label %return

if.end:                                           ; preds = %entry
  store i64 1, i64* %retval
  br label %return

return:                                           ; preds = %if.end, %if.then
  %2 = load i64* %retval
  ret i64 %2
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  %call = call i64 @foo(i64 2882338816)
  %cmp = icmp ne i64 %call, 0
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %call1 = call i64 @foo(i64 0)
  %cmp2 = icmp ne i64 %call1, 1
  br i1 %cmp2, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %lor.lhs.false
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
