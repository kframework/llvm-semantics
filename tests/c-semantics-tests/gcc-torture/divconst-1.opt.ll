; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/divconst-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.t1 = type { i32, i32, i32, i32 }

define void @f(%struct.t1* nocapture %ps) nounwind uwtable {
entry:
  %a = getelementptr inbounds %struct.t1* %ps, i64 0, i32 0
  store i32 10000, i32* %a, align 4, !tbaa !0
  %b = getelementptr inbounds %struct.t1* %ps, i64 0, i32 1
  store i32 3333, i32* %b, align 4, !tbaa !0
  %c = getelementptr inbounds %struct.t1* %ps, i64 0, i32 2
  store i32 10000, i32* %c, align 4, !tbaa !0
  %d = getelementptr inbounds %struct.t1* %ps, i64 0, i32 3
  store i32 3333, i32* %d, align 4, !tbaa !0
  ret void
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
