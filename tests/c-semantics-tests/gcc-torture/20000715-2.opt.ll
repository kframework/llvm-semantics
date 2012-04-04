; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20000715-2.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @foo(i32 %a) nounwind uwtable readnone {
entry:
  %add = shl i32 %a, 2
  %conv1 = add i32 %add, 4
  %mul = and i32 %conv1, 1020
  ret i32 %mul
}

define i32 @main() noreturn nounwind uwtable {
if.end:
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn
