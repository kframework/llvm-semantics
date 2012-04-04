; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/991202-3.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @f(i32 %a) nounwind uwtable readnone {
entry:
  %0 = shl i32 %a, 13
  %div = and i32 %0, 536862720
  ret i32 %div
}

define i32 @g(i32 %a) nounwind uwtable readnone {
entry:
  %mul = shl i32 %a, 16
  ret i32 %mul
}

define i32 @h(i32 %a) nounwind uwtable readnone {
entry:
  %div = lshr i32 %a, 3
  ret i32 %div
}

define i32 @main() noreturn nounwind uwtable {
if.end:
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn nounwind
