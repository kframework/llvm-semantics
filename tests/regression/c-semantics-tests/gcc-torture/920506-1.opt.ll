; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/920506-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@l = global [2 x i32] [i32 0, i32 1], align 4

define i32 @main() noreturn nounwind uwtable {
entry:
  %0 = load i32* getelementptr inbounds ([2 x i32]* @l, i64 0, i64 0), align 4, !tbaa !0
  %cond = icmp eq i32 %0, 0
  br i1 %cond, label %sw.bb, label %sw.epilog

sw.bb:                                            ; preds = %entry
  tail call void @exit(i32 0) noreturn nounwind
  unreachable

sw.epilog:                                        ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn nounwind

declare void @abort() noreturn nounwind

!0 = metadata !{metadata !"int", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
