; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20051021-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@count = global i32 0, align 4

define i32 @foo1() nounwind uwtable {
entry:
  %0 = load i32* @count, align 4, !tbaa !0
  %inc = add nsw i32 %0, 1
  store i32 %inc, i32* @count, align 4, !tbaa !0
  ret i32 0
}

define i32 @foo2() nounwind uwtable {
entry:
  %0 = load i32* @count, align 4, !tbaa !0
  %inc = add nsw i32 %0, 1
  store i32 %inc, i32* @count, align 4, !tbaa !0
  ret i32 0
}

define i32 @main() nounwind uwtable {
entry:
  %0 = load i32* @count, align 4, !tbaa !0
  %inc.i8 = add nsw i32 %0, 2
  store i32 %inc.i8, i32* @count, align 4, !tbaa !0
  %cmp4 = icmp eq i32 %0, 0
  br i1 %cmp4, label %if.end7, label %if.then6

if.then6:                                         ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end7:                                          ; preds = %entry
  ret i32 0
}

declare void @abort() noreturn nounwind

!0 = metadata !{metadata !"int", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
