; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20020611-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@n = global i32 30, align 4
@p = common global i32 0, align 4
@k = common global i32 0, align 4

define void @x() nounwind uwtable {
entry:
  %0 = load i32* @n, align 4, !tbaa !0
  %cmp = icmp ult i32 %0, 31
  %. = zext i1 %cmp to i32
  store i32 %., i32* @p, align 4
  store i32 %., i32* @k, align 4
  ret void
}

define i32 @main() noreturn nounwind uwtable {
entry:
  %0 = load i32* @n, align 4, !tbaa !0
  %cmp.i = icmp ult i32 %0, 31
  %..i = zext i1 %cmp.i to i32
  store i32 %..i, i32* @p, align 4
  store i32 %..i, i32* @k, align 4
  br i1 %cmp.i, label %if.end, label %if.then

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
