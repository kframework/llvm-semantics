; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/990811-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @foo(i32 %x, i8* nocapture %y) nounwind uwtable {
entry:
  switch i32 %x, label %sw.epilog [
    i32 0, label %sw.bb
    i32 1, label %sw.bb1
    i32 2, label %sw.bb3
  ]

sw.bb:                                            ; preds = %entry
  %a = bitcast i8* %y to i64*
  %0 = load i64* %a, align 8, !tbaa !0
  %conv = trunc i64 %0 to i32
  br label %return

sw.bb1:                                           ; preds = %entry
  %1 = load i8* %y, align 1, !tbaa !1
  %conv2 = sext i8 %1 to i32
  br label %return

sw.bb3:                                           ; preds = %entry
  %2 = bitcast i8* %y to i16*
  %3 = load i16* %2, align 2, !tbaa !3
  %conv4 = sext i16 %3 to i32
  br label %return

sw.epilog:                                        ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

return:                                           ; preds = %sw.bb3, %sw.bb1, %sw.bb
  %retval.0 = phi i32 [ %conv4, %sw.bb3 ], [ %conv2, %sw.bb1 ], [ %conv, %sw.bb ]
  ret i32 %retval.0
}

declare void @abort() noreturn nounwind

define i32 @main() noreturn nounwind uwtable {
if.end17:
  call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn nounwind

!0 = metadata !{metadata !"long", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
!3 = metadata !{metadata !"short", metadata !1}
