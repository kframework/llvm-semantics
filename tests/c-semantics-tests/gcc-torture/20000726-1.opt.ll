; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20000726-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @main() noreturn nounwind uwtable {
if.end:
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

define void @adjust_xy(i16* nocapture %x, i16* nocapture %y) nounwind uwtable {
entry:
  store i16 1, i16* %x, align 2, !tbaa !0
  ret void
}

declare void @exit(i32) noreturn nounwind

!0 = metadata !{metadata !"short", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
