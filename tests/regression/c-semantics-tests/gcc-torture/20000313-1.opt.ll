; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20000313-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @buggy(i32* nocapture %param) nounwind uwtable {
entry:
  %0 = load i32* %param, align 4, !tbaa !0
  %cmp = icmp ne i32 %0, 0
  %sub1 = sext i1 %cmp to i32
  store i32 0, i32* %param, align 4, !tbaa !0
  ret i32 %sub1
}

define i32 @main() nounwind uwtable {
if.end3:
  ret i32 0
}

!0 = metadata !{metadata !"int", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
