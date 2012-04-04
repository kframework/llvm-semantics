; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/990527-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@sum = common global i32 0, align 4

define void @g(i32 %i) nounwind uwtable {
entry:
  %0 = load i32* @sum, align 4, !tbaa !0
  %add = add nsw i32 %0, %i
  store i32 %add, i32* @sum, align 4, !tbaa !0
  ret void
}

define void @f(i32 %j) nounwind uwtable {
entry:
  %phitmp = add i32 %j, 1
  %sum.promoted = load i32* @sum, align 4
  %add.i = add nsw i32 %sum.promoted, %phitmp
  %add.i.8 = add nsw i32 %add.i, 80
  store i32 %add.i.8, i32* @sum, align 4
  ret void
}

define i32 @main() noreturn nounwind uwtable {
entry:
  %sum.promoted.i = load i32* @sum, align 4
  %add.i.8.i = add nsw i32 %sum.promoted.i, 81
  store i32 %add.i.8.i, i32* @sum, align 4
  %cmp = icmp eq i32 %sum.promoted.i, 0
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
