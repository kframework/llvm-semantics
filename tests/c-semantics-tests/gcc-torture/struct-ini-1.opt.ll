; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/struct-ini-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.S = type { i8, [2 x i32] }

@object = global %struct.S { i8 88, [2 x i32] [i32 8, i32 9] }, align 4

define i32 @main() noreturn nounwind uwtable {
entry:
  %0 = load i8* getelementptr inbounds (%struct.S* @object, i64 0, i32 0), align 4, !tbaa !0
  %cmp = icmp ne i8 %0, 88
  %1 = load i32* getelementptr inbounds (%struct.S* @object, i64 0, i32 1, i64 0), align 4, !tbaa !2
  %cmp2 = icmp ne i32 %1, 8
  %or.cond = or i1 %cmp, %cmp2
  %2 = load i32* getelementptr inbounds (%struct.S* @object, i64 0, i32 1, i64 1), align 4, !tbaa !2
  %cmp5 = icmp ne i32 %2, 9
  %or.cond7 = or i1 %or.cond, %cmp5
  br i1 %or.cond7, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind

!0 = metadata !{metadata !"omnipotent char", metadata !1}
!1 = metadata !{metadata !"Simple C/C++ TBAA", null}
!2 = metadata !{metadata !"int", metadata !0}
