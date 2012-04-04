; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/980604-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@a = global i32 1, align 4
@b = global i32 -1, align 4
@c = global i32 1, align 4
@d = global i32 0, align 4

define i32 @main() noreturn nounwind uwtable {
entry:
  %0 = load i32* @c, align 4, !tbaa !0
  %1 = load i32* @d, align 4, !tbaa !0
  %2 = load i32* @a, align 4, !tbaa !0
  %3 = load i32* @b, align 4, !tbaa !0
  %cmp = icmp slt i32 %2, %3
  %cond.v = select i1 %cmp, i32 %0, i32 %1
  %tobool = icmp eq i32 %cond.v, 0
  br i1 %tobool, label %if.end, label %if.then

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
