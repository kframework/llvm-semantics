; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20050410-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@s = global i32 200, align 4

define i32 @foo() nounwind uwtable readonly noinline {
entry:
  %0 = load i32* @s, align 4, !tbaa !0
  %sub = shl i32 %0, 24
  %sext = add i32 %sub, -1677721600
  %conv1 = ashr exact i32 %sext, 24
  %sub2 = add nsw i32 %conv1, -5
  ret i32 %sub2
}

define i32 @main() noreturn nounwind uwtable {
entry:
  %call = tail call i32 @foo()
  %cmp = icmp eq i32 %call, 95
  br i1 %cmp, label %if.end, label %if.then

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
