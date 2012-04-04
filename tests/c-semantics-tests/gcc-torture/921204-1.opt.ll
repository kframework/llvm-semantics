; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/921204-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @f(i32 %i.coerce) nounwind uwtable readnone {
entry:
  %bf.clear = and i32 %i.coerce, 1
  %tobool = icmp eq i32 %bf.clear, 0
  %0 = or i32 %i.coerce, 1310720
  %1 = and i32 %i.coerce, -1310721
  %o.0.0 = select i1 %tobool, i32 %1, i32 %0
  ret i32 %o.0.0
}

define i32 @main() noreturn nounwind uwtable {
if.end:
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn nounwind
