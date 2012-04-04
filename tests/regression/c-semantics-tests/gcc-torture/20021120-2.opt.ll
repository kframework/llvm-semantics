; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20021120-2.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g1 = common global i32 0, align 4
@g2 = common global i32 0, align 4

define void @foo(i32 %x) nounwind uwtable {
entry:
  store i32 10, i32* @g1, align 4, !tbaa !0
  %div1 = sdiv i32 7930, %x
  store i32 %div1, i32* @g2, align 4, !tbaa !0
  ret void
}

define i32 @main() noreturn nounwind uwtable {
if.end:
  store i32 10, i32* @g1, align 4, !tbaa !0
  store i32 10, i32* @g2, align 4, !tbaa !0
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn nounwind

!0 = metadata !{metadata !"int", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
