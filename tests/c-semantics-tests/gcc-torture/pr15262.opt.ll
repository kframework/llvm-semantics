; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/pr15262.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.A = type { i32, i32 }

define void @bar(float* nocapture %p) nounwind uwtable {
entry:
  store float 0x4014CCCCC0000000, float* %p, align 4, !tbaa !0
  ret void
}

define i32 @foo(%struct.A* nocapture %locp, i32 %i, i32 %str) nounwind uwtable {
entry:
  %f = alloca float, align 4
  %g = alloca float, align 4
  %tobool = icmp ne i32 %i, 0
  %g.f = select i1 %tobool, float* %g, float* %f
  store float 0x4014CCCCC0000000, float* %g.f, align 4, !tbaa !0
  %i2 = getelementptr inbounds %struct.A* %locp, i64 0, i32 1
  store i32 1, i32* %i2, align 4, !tbaa !3
  ret i32 1
}

define i32 @main() nounwind uwtable {
if.end:
  ret i32 0
}

!0 = metadata !{metadata !"float", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
!3 = metadata !{metadata !"int", metadata !1}
