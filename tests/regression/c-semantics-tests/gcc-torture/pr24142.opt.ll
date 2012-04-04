; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/pr24142.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @f(i32 %a, i32 %b) nounwind uwtable readnone {
entry:
  %0 = icmp ult i32 %a, 2
  %not.cmp1 = icmp ne i32 %b, 0
  %cmp4 = and i1 %0, %not.cmp1
  %. = zext i1 %cmp4 to i32
  ret i32 %.
}

define i32 @main() nounwind uwtable {
if.end:
  ret i32 0
}
