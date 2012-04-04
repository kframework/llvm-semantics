; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/960802-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@val = global i64 1577058304, align 8

define i64 @f1() nounwind uwtable {
entry:
  ret i64 306
}

define i64 @f2() nounwind uwtable {
entry:
  ret i64 1577058304
}

define void @f3(i64 %b) nounwind uwtable {
entry:
  %b.addr = alloca i64, align 8
  store i64 %b, i64* %b.addr, align 8
  %0 = load i64* %b.addr, align 8
  store i64 %0, i64* @val, align 8
  ret void
}

define void @f4() nounwind uwtable {
entry:
  %v = alloca i64, align 8
  %o = alloca i64, align 8
  %call = call i64 @f1()
  store i64 %call, i64* %v, align 8
  %call1 = call i64 @f2()
  store i64 %call1, i64* %o, align 8
  %0 = load i64* %v, align 8
  %and = and i64 %0, 16777215
  %1 = load i64* %o, align 8
  %and2 = and i64 %1, 4278190080
  %or = or i64 %and, %and2
  store i64 %or, i64* %v, align 8
  %2 = load i64* %v, align 8
  call void @f3(i64 %2)
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  call void @f4()
  %0 = load i64* @val, align 8
  %cmp = icmp ne i64 %0, 1577058610
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %1 = load i32* %retval
  ret i32 %1
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
