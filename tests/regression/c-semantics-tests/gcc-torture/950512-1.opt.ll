; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/950512-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @f1(i32 %x) nounwind uwtable readnone {
entry:
  %cmp = icmp ne i32 %x, 0
  %div = select i1 %cmp, i32 2147483647, i32 2147483646
  ret i32 %div
}

define i64 @f2(i32 %x) nounwind uwtable readnone {
entry:
  %cmp = icmp ne i32 %x, 0
  %div = select i1 %cmp, i64 9223372036854775807, i64 9223372036854775806
  ret i64 %div
}

define i32 @main() noreturn nounwind uwtable {
if.end12:
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn
