; ModuleID = '/home/david/src/c-semantics/tests/unitTests/realloc2.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @main() nounwind uwtable {
entry:
  %call = tail call i8* @realloc(i8* null, i64 5) nounwind
  %arrayidx = getelementptr inbounds i8* %call, i64 3
  store i8 100, i8* %arrayidx, align 1, !tbaa !0
  ret i32 100
}

declare noalias i8* @realloc(i8* nocapture, i64) nounwind

!0 = metadata !{metadata !"omnipotent char", metadata !1}
!1 = metadata !{metadata !"Simple C/C++ TBAA", null}
