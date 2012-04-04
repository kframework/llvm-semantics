; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/loop-ivopts-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@foo.tmp = internal unnamed_addr global [4 x float] zeroinitializer, align 16

define i32 @main() nounwind uwtable {
entry:
  store float 1.650000e+02, float* getelementptr inbounds ([4 x float]* @foo.tmp, i64 0, i64 2), align 8
  store float 8.400000e+01, float* getelementptr inbounds ([4 x float]* @foo.tmp, i64 0, i64 1), align 4
  store float 1.300000e+01, float* getelementptr inbounds ([4 x float]* @foo.tmp, i64 0, i64 0), align 16
  ret i32 0
}

define void @foo(float* nocapture %x) nounwind uwtable {
for.inc11.3:
  store float 1.650000e+02, float* getelementptr inbounds ([4 x float]* @foo.tmp, i64 0, i64 2), align 8
  store float 8.400000e+01, float* getelementptr inbounds ([4 x float]* @foo.tmp, i64 0, i64 1), align 4
  store float 1.300000e+01, float* getelementptr inbounds ([4 x float]* @foo.tmp, i64 0, i64 0), align 16
  store float 1.300000e+01, float* %x, align 4, !tbaa !0
  %0 = load float* getelementptr inbounds ([4 x float]* @foo.tmp, i64 0, i64 1), align 4, !tbaa !0
  %arrayidx15 = getelementptr inbounds float* %x, i64 1
  store float %0, float* %arrayidx15, align 4, !tbaa !0
  %1 = load float* getelementptr inbounds ([4 x float]* @foo.tmp, i64 0, i64 2), align 8, !tbaa !0
  %arrayidx16 = getelementptr inbounds float* %x, i64 2
  store float %1, float* %arrayidx16, align 4, !tbaa !0
  %2 = load float* getelementptr inbounds ([4 x float]* @foo.tmp, i64 0, i64 3), align 4, !tbaa !0
  %arrayidx17 = getelementptr inbounds float* %x, i64 3
  store float %2, float* %arrayidx17, align 4, !tbaa !0
  ret void
}

!0 = metadata !{metadata !"float", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
