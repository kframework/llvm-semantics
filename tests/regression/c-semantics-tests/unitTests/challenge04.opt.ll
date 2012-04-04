; ModuleID = '/home/david/src/c-semantics/tests/unitTests/challenge04.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.t = type { [2 x i32] }

@s = common global %struct.t zeroinitializer, align 4

define void @f(i64 %s.coerce) nounwind uwtable readnone {
entry:
  ret void
}

define void @g(i32* nocapture %a) nounwind uwtable {
entry:
  %arrayidx = getelementptr inbounds i32* %a, i64 1
  store i32 5, i32* %arrayidx, align 4, !tbaa !0
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  %0 = load i32* getelementptr inbounds (%struct.t* @s, i64 0, i32 0, i64 1), align 4, !tbaa !0
  store i32 5, i32* getelementptr inbounds (%struct.t* @s, i64 0, i32 0, i64 1), align 4, !tbaa !0
  %add = add nsw i32 %0, 5
  ret i32 %add
}

!0 = metadata !{metadata !"int", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
