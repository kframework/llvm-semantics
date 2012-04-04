; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/restrict-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.A = type { i32, i32 }

define void @bar(%struct.A* noalias nocapture %p) nounwind uwtable {
entry:
  %i1.i = getelementptr inbounds %struct.A* %p, i64 0, i32 0
  %0 = load i32* %i1.i, align 4, !tbaa !0
  %add.i = shl nsw i32 %0, 1
  %1 = zext i32 %add.i to i64
  %2 = bitcast %struct.A* %p to i64*
  store i64 %1, i64* %2, align 4
  %cmp = icmp eq i32 %add.i, 2
  br i1 %cmp, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret void
}

declare void @abort() noreturn nounwind

define i32 @main() nounwind uwtable {
bar.exit:
  ret i32 0
}

!0 = metadata !{metadata !"int", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
