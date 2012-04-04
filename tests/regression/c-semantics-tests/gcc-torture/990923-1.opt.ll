; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/990923-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i64 @foo(i64 %x) nounwind uwtable readnone {
entry:
  %and = and i64 %x, 4294901760
  %cmp = icmp eq i64 %and, 2882338816
  %and1 = and i64 %x, 65535
  %retval.0 = select i1 %cmp, i64 %and1, i64 1
  ret i64 %retval.0
}

define i32 @main() noreturn nounwind uwtable {
if.end:
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn nounwind
