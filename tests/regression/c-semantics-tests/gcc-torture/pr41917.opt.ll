; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/pr41917.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@a = global i32 1, align 4

define i32 @main() nounwind uwtable {
entry:
  %0 = load i32* @a, align 4, !tbaa !0
  %or = or i32 %0, -2
  %rem = urem i32 -942519458, %or
  %phitmp = icmp eq i32 %rem, -942519458
  br i1 %phitmp, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret i32 0
}

declare void @abort() noreturn nounwind

!0 = metadata !{metadata !"int", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
