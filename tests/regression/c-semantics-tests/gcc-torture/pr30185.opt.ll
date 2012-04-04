; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/pr30185.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define { i8, i64 } @foo(i8 %x.coerce0, i64 %x.coerce1, i8 %y.coerce0, i64 %y.coerce1) nounwind uwtable readnone {
entry:
  %div = sdiv i64 %x.coerce1, %y.coerce1
  %0 = insertvalue { i8, i64 } { i8 0, i64 undef }, i64 %div, 1
  ret { i8, i64 } %0
}

define i32 @main() nounwind uwtable {
if.end11:
  ret i32 0
}
