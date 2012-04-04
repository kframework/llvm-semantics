; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/930603-3.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @f(i8* nocapture %b, i32 %c) nounwind uwtable {
entry:
  switch i32 %c, label %sw.default [
    i32 100, label %sw.bb
    i32 107, label %sw.bb3
  ]

sw.bb:                                            ; preds = %entry
  %0 = load i8* %b, align 1, !tbaa !0
  %conv = zext i8 %0 to i32
  %shr = lshr i32 %conv, 1
  br label %sw.epilog

sw.bb3:                                           ; preds = %entry
  %arrayidx4 = getelementptr inbounds i8* %b, i64 3
  %1 = load i8* %arrayidx4, align 1, !tbaa !0
  %conv5 = zext i8 %1 to i32
  %shr69 = lshr i32 %conv5, 4
  br label %sw.epilog

sw.default:                                       ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

sw.epilog:                                        ; preds = %sw.bb3, %sw.bb
  %v.0 = phi i32 [ %shr69, %sw.bb3 ], [ %shr, %sw.bb ]
  ret i32 %v.0
}

declare void @abort() noreturn nounwind

define i32 @main() noreturn nounwind uwtable {
if.end:
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn nounwind

!0 = metadata !{metadata !"omnipotent char", metadata !1}
!1 = metadata !{metadata !"Simple C/C++ TBAA", null}
