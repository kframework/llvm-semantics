; ModuleID = '/home/david/src/c-semantics/tests/mustPass/j058e.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@x = common global double 0.000000e+00, align 8
@p0 = global double* @x, align 8
@p = global double* @x, align 8
@y = common global double 0.000000e+00, align 8

define i32 @main() nounwind uwtable readonly {
entry:
  %0 = load double** @p, align 8, !tbaa !0
  %1 = load double* %0, align 8, !tbaa !3
  %conv = fptosi double %1 to i32
  ret i32 %conv
}

!0 = metadata !{metadata !"any pointer", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
!3 = metadata !{metadata !"double", metadata !1}
