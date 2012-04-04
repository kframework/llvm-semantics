; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20031020-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define void @foo(i64 %x) nounwind uwtable noinline {
entry:
  %cmp = icmp sgt i64 %x, 1023
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret void
}

declare void @abort() noreturn nounwind

define i32 @main() nounwind uwtable {
entry:
  tail call void @foo(i64 -9223372036854775808)
  tail call void @foo(i64 -9223372036854765808)
  ret i32 0
}
