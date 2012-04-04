; ModuleID = '/home/david/src/c-semantics/tests/unitTests/realloc1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @main() nounwind uwtable {
entry:
  %call = tail call noalias i8* @malloc(i64 5) nounwind
  %arrayidx = getelementptr inbounds i8* %call, i64 3
  store i8 100, i8* %arrayidx, align 1, !tbaa !0
  %call1 = tail call i8* @realloc(i8* %call, i64 5) nounwind
  %arrayidx2 = getelementptr inbounds i8* %call1, i64 3
  %0 = load i8* %arrayidx2, align 1, !tbaa !0
  %conv = sext i8 %0 to i32
  ret i32 %conv
}

declare noalias i8* @malloc(i64) nounwind

declare noalias i8* @realloc(i8* nocapture, i64) nounwind

!0 = metadata !{metadata !"omnipotent char", metadata !1}
!1 = metadata !{metadata !"Simple C/C++ TBAA", null}
