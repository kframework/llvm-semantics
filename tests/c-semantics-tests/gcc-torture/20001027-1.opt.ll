; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20001027-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@x = common global i32 0, align 4
@p = global i32* @x, align 8

define i32 @main() noreturn nounwind uwtable {
entry:
  store i32 1, i32* @x, align 4, !tbaa !0
  %0 = load i32** @p, align 8, !tbaa !3
  store i32 2, i32* %0, align 4, !tbaa !0
  %1 = load i32* @x, align 4, !tbaa !0
  %cmp = icmp eq i32 %1, 2
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
!3 = metadata !{metadata !"any pointer", metadata !1}
