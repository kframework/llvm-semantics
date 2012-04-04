; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/floatunsisf-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@u = global i32 -2147483519, align 4
@f1 = common global float 0.000000e+00, align 4
@f2 = common global float 0.000000e+00, align 4

define i32 @main() noreturn nounwind uwtable {
entry:
  %0 = load volatile i32* @u, align 4, !tbaa !0
  %conv = uitofp i32 %0 to float
  store volatile float %conv, float* @f1, align 4, !tbaa !3
  store volatile float 0x41E0000020000000, float* @f2, align 4, !tbaa !3
  %1 = load volatile float* @f1, align 4, !tbaa !3
  %2 = load volatile float* @f2, align 4, !tbaa !3
  %cmp = fcmp une float %1, %2
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @abort() noreturn

declare void @exit(i32) noreturn

!0 = metadata !{metadata !"int", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
!3 = metadata !{metadata !"float", metadata !1}
