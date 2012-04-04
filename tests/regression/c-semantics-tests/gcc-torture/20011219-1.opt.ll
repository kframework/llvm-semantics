; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20011219-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define void @bar(i8* nocapture %x, i32 %y, i8* nocapture %z) nounwind uwtable readnone {
entry:
  ret void
}

define i64 @foo(i32 %x, i8* nocapture %y) nounwind uwtable readonly {
entry:
  switch i32 %x, label %sw.epilog [
    i32 10, label %sw.bb
    i32 11, label %sw.bb1
    i32 12, label %sw.bb2
    i32 13, label %sw.bb3
    i32 14, label %sw.bb4
  ]

sw.bb:                                            ; preds = %entry
  %0 = bitcast i8* %y to i64*
  %1 = load i64* %0, align 8, !tbaa !0
  br label %sw.epilog

sw.bb1:                                           ; preds = %entry
  %2 = bitcast i8* %y to i64*
  %3 = load i64* %2, align 8, !tbaa !0
  br label %sw.epilog

sw.bb2:                                           ; preds = %entry
  %4 = bitcast i8* %y to i64*
  %5 = load i64* %4, align 8, !tbaa !0
  br label %sw.epilog

sw.bb3:                                           ; preds = %entry
  %6 = bitcast i8* %y to i64*
  %7 = load i64* %6, align 8, !tbaa !0
  br label %sw.epilog

sw.bb4:                                           ; preds = %entry
  %8 = bitcast i8* %y to i64*
  %9 = load i64* %8, align 8, !tbaa !0
  br label %sw.epilog

sw.epilog:                                        ; preds = %entry, %sw.bb4, %sw.bb3, %sw.bb2, %sw.bb1, %sw.bb
  %a.0 = phi i64 [ %9, %sw.bb4 ], [ %7, %sw.bb3 ], [ %5, %sw.bb2 ], [ %3, %sw.bb1 ], [ %1, %sw.bb ], [ undef, %entry ]
  ret i64 %a.0
}

define i32 @main() noreturn nounwind uwtable {
if.end:
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn

!0 = metadata !{metadata !"long", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
