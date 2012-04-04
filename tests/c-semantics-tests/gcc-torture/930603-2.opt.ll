; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/930603-2.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@w = common global [2 x [2 x i32]] zeroinitializer, align 16

define void @f() nounwind uwtable {
for.inc.1.1:
  store i32 1, i32* getelementptr inbounds ([2 x [2 x i32]]* @w, i64 0, i64 0, i64 0), align 16, !tbaa !0
  store i32 1, i32* getelementptr inbounds ([2 x [2 x i32]]* @w, i64 0, i64 1, i64 1), align 4, !tbaa !0
  ret void
}

define i32 @main() noreturn nounwind uwtable {
entry:
  store i32 1, i32* getelementptr inbounds ([2 x [2 x i32]]* @w, i64 0, i64 0, i64 0), align 16, !tbaa !0
  store i32 1, i32* getelementptr inbounds ([2 x [2 x i32]]* @w, i64 0, i64 1, i64 1), align 4, !tbaa !0
  %0 = load i32* getelementptr inbounds ([2 x [2 x i32]]* @w, i64 0, i64 1, i64 0), align 8, !tbaa !0
  %1 = load i32* getelementptr inbounds ([2 x [2 x i32]]* @w, i64 0, i64 0, i64 1), align 4, !tbaa !0
  %2 = or i32 %0, %1
  %3 = icmp eq i32 %2, 0
  br i1 %3, label %if.end, label %if.then

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
