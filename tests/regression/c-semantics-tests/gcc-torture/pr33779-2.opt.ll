; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/pr33779-2.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @foo(i32 %i) nounwind uwtable readnone {
entry:
  %add = shl i32 %i, 2
  %mul = add i32 %add, 4
  %div = sdiv i32 %mul, 4
  ret i32 %div
}

define i32 @main() nounwind uwtable {
if.end:
  ret i32 0
}
