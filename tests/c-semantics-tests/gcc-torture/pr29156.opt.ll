; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/pr29156.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.test1 = type { i32, i32 }
%struct.test2 = type { float, %struct.test1 }

@global = common global i32 0, align 4

define i32 @bla(%struct.test1* nocapture %xa, %struct.test2* nocapture %xb) nounwind uwtable {
entry:
  store i32 1, i32* @global, align 4, !tbaa !0
  %a = getelementptr inbounds %struct.test2* %xb, i64 0, i32 1, i32 0
  store i32 1, i32* %a, align 4, !tbaa !0
  %a1 = getelementptr inbounds %struct.test1* %xa, i64 0, i32 0
  store i32 8, i32* %a1, align 4, !tbaa !0
  %0 = load i32* %a, align 4, !tbaa !0
  ret i32 %0
}

define i32 @main() nounwind uwtable {
if.end:
  store i32 1, i32* @global, align 4, !tbaa !0
  ret i32 0
}

!0 = metadata !{metadata !"int", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
