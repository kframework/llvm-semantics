; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/941021-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@glob_dbl = common global double 0.000000e+00, align 8

define void @f(double* %pdbl, double %value) nounwind uwtable {
entry:
  %cmp = icmp eq double* %pdbl, null
  %glob_dbl.pdbl = select i1 %cmp, double* @glob_dbl, double* %pdbl
  store double %value, double* %glob_dbl.pdbl, align 8, !tbaa !0
  ret void
}

define i32 @main() noreturn nounwind uwtable {
if.end:
  store double 5.510000e+01, double* @glob_dbl, align 8, !tbaa !0
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn nounwind

!0 = metadata !{metadata !"double", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
