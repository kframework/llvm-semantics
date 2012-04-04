; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/loop-14.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@a3 = common global [3 x i32] zeroinitializer, align 4

define void @f(i32* nocapture %a) nounwind uwtable {
entry:
  %arrayidx = getelementptr inbounds i32* %a, i64 2
  store i32 21, i32* %arrayidx, align 4, !tbaa !0
  %arrayidx.1 = getelementptr inbounds i32* %a, i64 1
  store i32 42, i32* %arrayidx.1, align 4, !tbaa !0
  ret void
}

define i32 @main() noreturn nounwind uwtable {
if.end:
  store i32 21, i32* getelementptr inbounds ([3 x i32]* @a3, i64 0, i64 2), align 4, !tbaa !0
  store i32 42, i32* getelementptr inbounds ([3 x i32]* @a3, i64 0, i64 1), align 4, !tbaa !0
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn nounwind

!0 = metadata !{metadata !"int", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
