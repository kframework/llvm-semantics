; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20031214-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.anon = type { double, [2 x i32] }

@g = global %struct.anon { double 0.000000e+00, [2 x i32] [i32 1, i32 2] }, align 8
@k = global i32 0, align 4

define void @b(i32* nocapture %j) nounwind uwtable readnone {
entry:
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  %0 = load i32* @k, align 4, !tbaa !0
  %1 = load i32* getelementptr inbounds (%struct.anon* @g, i64 0, i32 1, i64 0), align 8, !tbaa !0
  %cmp1 = icmp sgt i32 %0, %1
  %. = select i1 %cmp1, i32 %0, i32 %1
  %2 = load i32* getelementptr inbounds (%struct.anon* @g, i64 0, i32 1, i64 1), align 4, !tbaa !0
  %cmp1.1 = icmp sgt i32 %., %2
  %..1 = select i1 %cmp1.1, i32 %., i32 %2
  %inc4 = add nsw i32 %..1, 1
  store i32 %inc4, i32* @k, align 4, !tbaa !0
  ret i32 0
}

!0 = metadata !{metadata !"int", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
