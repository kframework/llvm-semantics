; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/980526-3.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @compare(i32 %x, i32 %y) nounwind uwtable readnone {
entry:
  %not.cmp = icmp ne i32 %x, %y
  %. = zext i1 %not.cmp to i32
  ret i32 %.
}

define i32 @main() noreturn nounwind uwtable {
if.else:
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn nounwind
