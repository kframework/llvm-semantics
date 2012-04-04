; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20000217-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define zeroext i16 @showbug(i16* nocapture %a, i16* nocapture %b) nounwind uwtable {
entry:
  %0 = load i16* %b, align 2, !tbaa !0
  %1 = load i16* %a, align 2, !tbaa !0
  %sub = add i16 %0, -8
  %add = add i16 %sub, %1
  store i16 %add, i16* %a, align 2, !tbaa !0
  %cmp = icmp ugt i16 %add, 7
  %conv5 = zext i1 %cmp to i16
  ret i16 %conv5
}

define i32 @main() noreturn nounwind uwtable {
if.end:
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn nounwind

!0 = metadata !{metadata !"short", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
