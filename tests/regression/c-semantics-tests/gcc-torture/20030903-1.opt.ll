; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20030903-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@test = internal global i32 0, align 4

define i32 @main() nounwind uwtable {
entry:
  %0 = load volatile i32* @test, align 4, !tbaa !0
  switch i32 %0, label %sw.epilog [
    i32 1, label %sw.bb
    i32 2, label %sw.bb1
    i32 3, label %sw.bb2
    i32 4, label %sw.bb3
  ]

sw.bb:                                            ; preds = %entry
  tail call fastcc void @y()
  unreachable

sw.bb1:                                           ; preds = %entry
  tail call fastcc void @y()
  unreachable

sw.bb2:                                           ; preds = %entry
  tail call fastcc void @y()
  unreachable

sw.bb3:                                           ; preds = %entry
  tail call fastcc void @y()
  unreachable

sw.epilog:                                        ; preds = %entry
  ret i32 0
}

define internal fastcc void @y() noreturn nounwind uwtable {
entry:
  tail call void @abort() noreturn nounwind
  unreachable
}

declare void @abort() noreturn nounwind

!0 = metadata !{metadata !"_ZTS1X", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
