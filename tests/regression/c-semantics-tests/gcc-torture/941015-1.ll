; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/941015-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @foo1(i64 %value) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i64, align 8
  %constant = alloca i64, align 8
  store i64 %value, i64* %value.addr, align 8
  store i64 -4611686016279904256, i64* %constant, align 8
  %0 = load i64* %value.addr, align 8
  %cmp = icmp slt i64 %0, -4611686016279904256
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  store i32 1, i32* %retval
  br label %return

if.else:                                          ; preds = %entry
  store i32 2, i32* %retval
  br label %return

return:                                           ; preds = %if.else, %if.then
  %1 = load i32* %retval
  ret i32 %1
}

define i32 @foo2(i64 %value) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i64, align 8
  %constant = alloca i64, align 8
  store i64 %value, i64* %value.addr, align 8
  store i64 -4611686016279904256, i64* %constant, align 8
  %0 = load i64* %value.addr, align 8
  %cmp = icmp ult i64 %0, -4611686016279904256
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  store i32 1, i32* %retval
  br label %return

if.else:                                          ; preds = %entry
  store i32 2, i32* %retval
  br label %return

return:                                           ; preds = %if.else, %if.then
  %1 = load i32* %retval
  ret i32 %1
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %value = alloca i64, align 8
  %x = alloca i32, align 4
  %y = alloca i32, align 4
  store i32 0, i32* %retval
  store i64 -4611686018427387903, i64* %value, align 8
  %0 = load i64* %value, align 8
  %call = call i32 (...)* bitcast (i32 (i64)* @foo1 to i32 (...)*)(i64 %0)
  store i32 %call, i32* %x, align 4
  %1 = load i64* %value, align 8
  %call1 = call i32 (...)* bitcast (i32 (i64)* @foo2 to i32 (...)*)(i64 %1)
  store i32 %call1, i32* %y, align 4
  %2 = load i32* %x, align 4
  %3 = load i32* %y, align 4
  %cmp = icmp ne i32 %2, %3
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %4 = load i32* %x, align 4
  %cmp2 = icmp ne i32 %4, 1
  br i1 %cmp2, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %lor.lhs.false
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %5 = load i32* %retval
  ret i32 %5
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
