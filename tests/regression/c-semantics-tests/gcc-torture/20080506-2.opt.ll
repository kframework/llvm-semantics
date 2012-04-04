; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20080506-2.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define void @foo(i32** noalias nocapture %p, i32** noalias nocapture %q) nounwind uwtable noinline {
entry:
  %0 = load i32** %p, align 8, !tbaa !0
  store i32 1, i32* %0, align 4, !tbaa !3
  %1 = load i32** %q, align 8, !tbaa !0
  store i32 2, i32* %1, align 4, !tbaa !3
  %2 = load i32* %0, align 4, !tbaa !3
  %cmp = icmp eq i32 %2, 2
  br i1 %cmp, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret void
}

declare void @abort() noreturn nounwind

define i32 @main() nounwind uwtable {
entry:
  %a = alloca i32, align 4
  %p1 = alloca i32*, align 8
  %p2 = alloca i32*, align 8
  store i32* %a, i32** %p1, align 8, !tbaa !0
  store i32* %a, i32** %p2, align 8, !tbaa !0
  call void @foo(i32** %p1, i32** %p2)
  ret i32 0
}

!0 = metadata !{metadata !"any pointer", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
!3 = metadata !{metadata !"int", metadata !1}
