; ModuleID = '/home/david/src/c-semantics/tests/unitTests/staticArrayArg.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @f(i32* nocapture %a) nounwind uwtable readonly {
entry:
  %0 = load i32* %a, align 4, !tbaa !0
  %arrayidx1 = getelementptr inbounds i32* %a, i64 1
  %1 = load i32* %arrayidx1, align 4, !tbaa !0
  %arrayidx2 = getelementptr inbounds i32* %a, i64 2
  %2 = load i32* %arrayidx2, align 4, !tbaa !0
  %add = add i32 %1, %0
  %add3 = add i32 %add, %2
  ret i32 %add3
}

define i32 @main() nounwind uwtable readnone {
entry:
  ret i32 6
}

!0 = metadata !{metadata !"int", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
