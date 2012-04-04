; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20000603-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.s1 = type { double }
%struct.s2 = type { double }

define double @f(%struct.s1* nocapture %a, %struct.s2* nocapture %b) nounwind uwtable {
entry:
  %d = getelementptr inbounds %struct.s1* %a, i64 0, i32 0
  store double 1.000000e+00, double* %d, align 8, !tbaa !0
  %d1 = getelementptr inbounds %struct.s2* %b, i64 0, i32 0
  %0 = load double* %d1, align 8, !tbaa !0
  %add = fadd double %0, 1.000000e+00
  ret double %add
}

define i32 @main() nounwind uwtable {
if.end:
  ret i32 0
}

!0 = metadata !{metadata !"double", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
