; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/pr34130.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @foo(i32 %i) nounwind uwtable readnone {
entry:
  %sub = add nsw i32 %i, -2
  %ispos = icmp sgt i32 %sub, -1
  %neg = sub i32 2, %i
  %call = select i1 %ispos, i32 %sub, i32 %neg
  %mul = mul nsw i32 %call, -2
  ret i32 %mul
}

define i32 @main() nounwind uwtable {
if.end:
  ret i32 0
}
