; ModuleID = '/home/david/src/c-semantics/tests/mustPass/j315a.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @foo(i32* nocapture %p1, i32* nocapture %p2) nounwind uwtable {
entry:
  %0 = load i32* %p1, align 4, !tbaa !0
  %inc = add nsw i32 %0, 1
  store i32 %inc, i32* %p1, align 4, !tbaa !0
  %1 = load i32* %p2, align 4, !tbaa !0
  %inc1 = add nsw i32 %1, 1
  store i32 %inc1, i32* %p2, align 4, !tbaa !0
  %add = add nsw i32 %1, %0
  ret i32 %add
}

define i32 @main() nounwind uwtable readnone {
entry:
  ret i32 0
}

!0 = metadata !{metadata !"int", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
