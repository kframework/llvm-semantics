; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/941015-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @foo1(i64 %value) nounwind uwtable readnone {
entry:
  %cmp = icmp slt i64 %value, -4611686016279904256
  %. = select i1 %cmp, i32 1, i32 2
  ret i32 %.
}

define i32 @foo2(i64 %value) nounwind uwtable readnone {
entry:
  %cmp = icmp ult i64 %value, -4611686016279904256
  %. = select i1 %cmp, i32 1, i32 2
  ret i32 %.
}

define i32 @main() noreturn nounwind uwtable {
if.end:
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn nounwind
