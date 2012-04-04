; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/strct-pack-3.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.A = type <{ i16, [2 x i32] }>

define i32 @f(%struct.A* nocapture %ap) nounwind uwtable readonly {
entry:
  %arrayidx = getelementptr inbounds %struct.A* %ap, i64 0, i32 1, i64 1
  %0 = load i32* %arrayidx, align 2, !tbaa !0
  %add = shl nsw i32 %0, 1
  %arrayidx9 = getelementptr inbounds %struct.A* %ap, i64 0, i32 1, i64 0
  %1 = load i32* %arrayidx9, align 2, !tbaa !0
  %add11 = add nsw i32 %1, %add
  %add11.1 = add nsw i32 %0, %add11
  %sext = shl i32 %add11.1, 16
  %conv13 = ashr exact i32 %sext, 16
  ret i32 %conv13
}

define i32 @main() noreturn nounwind uwtable {
if.end:
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn nounwind

!0 = metadata !{metadata !"int", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
