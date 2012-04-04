; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20000717-2.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  call void @compare(i64 8589934591)
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

define internal void @compare(i64 %foo) nounwind uwtable {
entry:
  %foo.addr = alloca i64, align 8
  store i64 %foo, i64* %foo.addr, align 8
  %0 = load i64* %foo.addr, align 8
  %cmp = icmp slt i64 %0, 4294967297
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret void
}

declare void @exit(i32) noreturn nounwind

declare void @abort() noreturn nounwind
