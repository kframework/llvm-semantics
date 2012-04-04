; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/shiftdi.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define void @g(i64 %x, i32 %y, i32 %z, i64* nocapture %p) nounwind uwtable {
entry:
  %sh_prom = zext i32 %y to i64
  %shr = lshr i64 %x, %sh_prom
  %and = and i64 %shr, 4294967295
  %and1 = and i32 %z, 31
  %sh_prom2 = zext i32 %and1 to i64
  %shl = shl i64 %and, %sh_prom2
  %and4 = and i64 %shl, 4294967295
  %sh_prom5 = zext i32 %z to i64
  %shl6 = shl i64 %and4, %sh_prom5
  %0 = load i64* %p, align 8, !tbaa !0
  %or = or i64 %0, %shl6
  store i64 %or, i64* %p, align 8, !tbaa !0
  ret void
}

define i32 @main() nounwind uwtable readnone {
entry:
  ret i32 0
}

!0 = metadata !{metadata !"long long", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
