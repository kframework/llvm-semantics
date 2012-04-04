; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/921123-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @f(i16* nocapture %p) nounwind uwtable readonly {
entry:
  %0 = load i16* %p, align 2, !tbaa !0
  %dec = add i16 %0, -1
  %dec.lobit = lshr i16 %dec, 15
  %1 = zext i16 %dec.lobit to i32
  ret i32 %1
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
