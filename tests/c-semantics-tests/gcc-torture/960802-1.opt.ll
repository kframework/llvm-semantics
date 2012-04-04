; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/960802-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@val = global i64 1577058304, align 8

define i64 @f1() nounwind uwtable readnone {
entry:
  ret i64 306
}

define i64 @f2() nounwind uwtable readnone {
entry:
  ret i64 1577058304
}

define void @f3(i64 %b) nounwind uwtable {
entry:
  store i64 %b, i64* @val, align 8, !tbaa !0
  ret void
}

define void @f4() nounwind uwtable {
entry:
  store i64 1577058610, i64* @val, align 8, !tbaa !0
  ret void
}

define i32 @main() noreturn nounwind uwtable {
if.end:
  store i64 1577058610, i64* @val, align 8, !tbaa !0
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn nounwind

!0 = metadata !{metadata !"long", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
