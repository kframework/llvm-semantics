; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20100209-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @bar(i32 %foo) nounwind uwtable readnone {
entry:
  %conv = sext i32 %foo to i64
  %div = lshr i64 %conv, 3
  %conv1 = trunc i64 %div to i32
  ret i32 %conv1
}

define i32 @main() nounwind uwtable {
if.end:
  ret i32 0
}
