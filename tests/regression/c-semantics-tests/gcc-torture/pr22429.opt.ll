; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/pr22429.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @f(i32 %n) nounwind uwtable readnone {
entry:
  %n.off = add i32 %n, 1073741824
  %n.off.lobit = lshr i32 %n.off, 31
  %n.off.lobit.not = xor i32 %n.off.lobit, 1
  ret i32 %n.off.lobit.not
}

define i32 @main() nounwind uwtable {
if.end:
  ret i32 0
}
