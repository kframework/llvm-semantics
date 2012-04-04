; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/980709-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @main() noreturn nounwind uwtable {
entry:
  %a = alloca double, align 8
  store volatile double 3.200000e+01, double* %a, align 8, !tbaa !0
  %0 = load volatile double* %a, align 8, !tbaa !0
  %1 = call double @llvm.pow.f64(double %0, double 0x3FD5555555555555)
  %add = fadd double %1, 1.000000e-01
  %cmp = fcmp ogt double %add, 3.174802e+00
  %sub = fadd double %1, -1.000000e-01
  %cmp1 = fcmp olt double %sub, 3.174802e+00
  %or.cond = and i1 %cmp, %cmp1
  br i1 %or.cond, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  call void @exit(i32 0) noreturn nounwind
  unreachable

if.else:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable
}

declare double @llvm.pow.f64(double, double) nounwind readonly

declare void @exit(i32) noreturn nounwind

declare void @abort() noreturn nounwind

!0 = metadata !{metadata !"double", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
