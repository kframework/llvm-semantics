; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/960302-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@a = global i64 1, align 8

define i32 @foo() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %0 = load i64* @a, align 8
  %rem = srem i64 %0, 2
  %rem1 = srem i64 %rem, 2
  %rem2 = srem i64 %rem1, 2
  %rem3 = srem i64 %rem2, 2
  %rem4 = srem i64 %rem3, 2
  %rem5 = srem i64 %rem4, 2
  %rem6 = srem i64 %rem5, 2
  %rem7 = srem i64 %rem6, 2
  switch i64 %rem7, label %sw.default [
    i64 0, label %sw.bb
    i64 1, label %sw.bb8
  ]

sw.bb:                                            ; preds = %entry
  store i32 0, i32* %retval
  br label %return

sw.bb8:                                           ; preds = %entry
  store i32 1, i32* %retval
  br label %return

sw.default:                                       ; preds = %entry
  store i32 -1, i32* %retval
  br label %return

return:                                           ; preds = %sw.default, %sw.bb8, %sw.bb
  %1 = load i32* %retval
  ret i32 %1
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  %call = call i32 @foo()
  %cmp = icmp ne i32 %call, 1
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
