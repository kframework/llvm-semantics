; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/930111-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  %call = call i32 (...)* bitcast (i32 (i64)* @wwrite to i32 (...)*)(i64 0)
  %cmp = icmp ne i32 %call, 123
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

define i32 @wwrite(i64 %i) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %i.addr = alloca i64, align 8
  store i64 %i, i64* %i.addr, align 8
  %0 = load i64* %i.addr, align 8
  switch i64 %0, label %sw.default [
    i64 3, label %sw.bb
    i64 10, label %sw.bb
    i64 23, label %sw.bb
    i64 28, label %sw.bb
    i64 47, label %sw.bb
  ]

sw.bb:                                            ; preds = %entry, %entry, %entry, %entry, %entry
  store i32 0, i32* %retval
  br label %return

sw.default:                                       ; preds = %entry
  store i32 123, i32* %retval
  br label %return

return:                                           ; preds = %sw.default, %sw.bb
  %1 = load i32* %retval
  ret i32 %1
}
