; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20070212-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.f = type { i32 }

define i32 @g(i32 %i, i32 %c, %struct.f* nocapture %ff, i32* nocapture %p) nounwind uwtable {
entry:
  %i.addr = alloca i32, align 4
  store i32 %i, i32* %i.addr, align 4, !tbaa !0
  %tobool = icmp eq i32 %c, 0
  %i1 = getelementptr inbounds %struct.f* %ff, i64 0, i32 0
  %t.0 = select i1 %tobool, i32* %i1, i32* %i.addr
  store i32 0, i32* %p, align 4, !tbaa !0
  %0 = load i32* %t.0, align 4, !tbaa !0
  ret i32 %0
}

define i32 @main() nounwind uwtable {
if.end:
  ret i32 0
}

!0 = metadata !{metadata !"int", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
