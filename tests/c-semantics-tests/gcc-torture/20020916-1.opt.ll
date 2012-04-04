; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20020916-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @foo(i32 %a) nounwind uwtable readnone {
entry:
  %cmp = icmp sgt i32 %a, 0
  %. = zext i1 %cmp to i32
  %cmp1 = icmp slt i32 %a, 0
  %x.1 = select i1 %cmp1, i32 1, i32 %.
  ret i32 %x.1
}

define i32 @main() nounwind uwtable {
if.end:
  ret i32 0
}
