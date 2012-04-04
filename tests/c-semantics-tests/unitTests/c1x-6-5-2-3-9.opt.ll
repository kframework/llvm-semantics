; ModuleID = '/home/david/src/c-semantics/tests/unitTests/c1x-6-5-2-3-9.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%union.anon = type { %struct.anon.1 }
%struct.anon.1 = type { i32, double }

@u = common global %union.anon zeroinitializer, align 8

define i32 @main() nounwind uwtable {
entry:
  store i32 1, i32* getelementptr inbounds (%union.anon* @u, i64 0, i32 0, i32 0), align 8, !tbaa !0
  store double 3.140000e+00, double* getelementptr inbounds (%union.anon* @u, i64 0, i32 0, i32 1), align 8, !tbaa !3
  ret i32 1
}

!0 = metadata !{metadata !"int", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
!3 = metadata !{metadata !"double", metadata !1}
