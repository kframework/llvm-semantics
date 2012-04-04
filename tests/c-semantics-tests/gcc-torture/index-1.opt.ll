; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/index-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@a = global [40 x i32] [i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39], align 16

define i32 @f(i64 %n) nounwind uwtable readonly {
entry:
  %sub = add nsw i64 %n, -100000
  %arrayidx = getelementptr inbounds [40 x i32]* @a, i64 0, i64 %sub
  %0 = load i32* %arrayidx, align 4, !tbaa !0
  ret i32 %0
}

define i32 @main() noreturn nounwind uwtable {
entry:
  %0 = load i32* getelementptr inbounds ([40 x i32]* @a, i64 0, i64 30), align 8, !tbaa !0
  %cmp = icmp eq i32 %0, 30
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
