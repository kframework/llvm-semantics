; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/931012-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @f(i32 %b, i32 %c) nounwind uwtable readnone {
entry:
  %0 = icmp ult i32 %b, 2
  %cmp3 = icmp eq i32 %c, 0
  %or.cond = or i1 %0, %cmp3
  %b.addr.0 = select i1 %or.cond, i32 %b, i32 0
  ret i32 %b.addr.0
}

define i32 @main() noreturn nounwind uwtable {
if.end:
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn nounwind
