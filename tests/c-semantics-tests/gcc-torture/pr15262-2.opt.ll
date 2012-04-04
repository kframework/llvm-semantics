; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/pr15262-2.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.A = type { i32, i32 }

@X = common global float 0.000000e+00, align 4

define i32 @foo(i32* nocapture %b.coerce0, float %b.coerce1, %struct.A* nocapture %q, float* nocapture %h) nounwind uwtable {
entry:
  %0 = load float* %h, align 4, !tbaa !0
  %1 = load float* @X, align 4, !tbaa !0
  %add = fadd float %1, %0
  store float %add, float* @X, align 4, !tbaa !0
  store i32 3, i32* %b.coerce0, align 4, !tbaa !3
  %t = getelementptr inbounds %struct.A* %q, i64 0, i32 0
  store i32 2, i32* %t, align 4, !tbaa !3
  %2 = load i32* %b.coerce0, align 4, !tbaa !3
  ret i32 %2
}

define i32 @main() nounwind uwtable {
if.end:
  %0 = load float* @X, align 4, !tbaa !0
  %add.i = fadd float %0, %0
  store float %add.i, float* @X, align 4, !tbaa !0
  ret i32 0
}

!0 = metadata !{metadata !"float", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
!3 = metadata !{metadata !"int", metadata !1}
