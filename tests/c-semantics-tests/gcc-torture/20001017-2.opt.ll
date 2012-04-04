; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20001017-2.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define void @fn_4parms(i8 zeroext %a, i64* nocapture %b, i64* nocapture %c, i32* nocapture %d) nounwind uwtable {
entry:
  %0 = load i64* %b, align 8, !tbaa !0
  %cmp = icmp eq i64 %0, 1
  br i1 %cmp, label %lor.lhs.false, label %if.then

lor.lhs.false:                                    ; preds = %entry
  %1 = load i64* %c, align 8, !tbaa !0
  %cmp1 = icmp eq i64 %1, 2
  br i1 %cmp1, label %lor.lhs.false2, label %if.then

lor.lhs.false2:                                   ; preds = %lor.lhs.false
  %2 = load i32* %d, align 4, !tbaa !3
  %cmp3 = icmp eq i32 %2, 3
  br i1 %cmp3, label %if.end, label %if.then

if.then:                                          ; preds = %lor.lhs.false2, %lor.lhs.false, %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %lor.lhs.false2
  ret void
}

declare void @abort() noreturn nounwind

define i32 @main() nounwind uwtable {
fn_4parms.exit:
  ret i32 0
}

!0 = metadata !{metadata !"long", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
!3 = metadata !{metadata !"int", metadata !1}
