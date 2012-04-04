; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20001013-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.x = type { i32, i32 }

@z = global %struct.x { i32 -4028, i32 4096 }, align 4

define i32 @foo(%struct.x* nocapture %p, i32 %y) nounwind uwtable readonly {
entry:
  %and = and i32 %y, 255
  %cmp = icmp eq i32 %and, %y
  br i1 %cmp, label %lor.lhs.false, label %return

lor.lhs.false:                                    ; preds = %entry
  %b = getelementptr inbounds %struct.x* %p, i64 0, i32 1
  %0 = load i32* %b, align 4, !tbaa !0
  %sub = sub nsw i32 0, %0
  %a = getelementptr inbounds %struct.x* %p, i64 0, i32 0
  %1 = load i32* %a, align 4, !tbaa !0
  %not.cmp1 = icmp sle i32 %1, %sub
  %. = zext i1 %not.cmp1 to i32
  ret i32 %.

return:                                           ; preds = %entry
  ret i32 1
}

define i32 @main() noreturn nounwind uwtable {
entry:
  %0 = load i32* getelementptr inbounds (%struct.x* @z, i64 0, i32 1), align 4, !tbaa !0
  %sub.i = sub nsw i32 0, %0
  %1 = load i32* getelementptr inbounds (%struct.x* @z, i64 0, i32 0), align 4, !tbaa !0
  %not.cmp1.i = icmp sgt i32 %1, %sub.i
  br i1 %not.cmp1.i, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind

!0 = metadata !{metadata !"int", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
