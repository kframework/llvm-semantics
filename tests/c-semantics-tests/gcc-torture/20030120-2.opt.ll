; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20030120-2.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @foo(i32 %status) nounwind uwtable readnone {
entry:
  %cmp = icmp eq i32 %status, 1
  %. = zext i1 %cmp to i32
  %cmp1 = icmp eq i32 %status, 3
  %s.1 = select i1 %cmp1, i32 3, i32 %.
  %cmp4 = icmp eq i32 %status, 4
  %.s.1 = select i1 %cmp4, i32 4, i32 %s.1
  ret i32 %.s.1
}

define i32 @main() nounwind uwtable {
if.end:
  ret i32 0
}
