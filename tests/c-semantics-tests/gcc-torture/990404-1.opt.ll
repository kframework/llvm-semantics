; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/990404-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@x = global [10 x i32] [i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9], align 16

define i32 @main() noreturn nounwind uwtable {
entry:
  br label %for.cond

for.cond:                                         ; preds = %if.end8, %entry
  %mi.0 = phi i32 [ undef, %entry ], [ %i1.0.mi.1.9, %if.end8 ]
  %niterations.0 = phi i32 [ 0, %entry ], [ %inc11, %if.end8 ]
  %0 = load i32* getelementptr inbounds ([10 x i32]* @x, i64 0, i64 0), align 16, !tbaa !0
  %cmp3 = icmp sgt i32 %0, 0
  %i1.0.mi.1 = select i1 %cmp3, i32 0, i32 %mi.0
  %.max.0 = select i1 %cmp3, i32 %0, i32 0
  %1 = load i32* getelementptr inbounds ([10 x i32]* @x, i64 0, i64 1), align 4, !tbaa !0
  %cmp3.1 = icmp sgt i32 %1, %.max.0
  %i1.0.mi.1.1 = select i1 %cmp3.1, i32 1, i32 %i1.0.mi.1
  %.max.0.1 = select i1 %cmp3.1, i32 %1, i32 %.max.0
  %2 = load i32* getelementptr inbounds ([10 x i32]* @x, i64 0, i64 2), align 8, !tbaa !0
  %cmp3.2 = icmp sgt i32 %2, %.max.0.1
  %i1.0.mi.1.2 = select i1 %cmp3.2, i32 2, i32 %i1.0.mi.1.1
  %.max.0.2 = select i1 %cmp3.2, i32 %2, i32 %.max.0.1
  %3 = load i32* getelementptr inbounds ([10 x i32]* @x, i64 0, i64 3), align 4, !tbaa !0
  %cmp3.3 = icmp sgt i32 %3, %.max.0.2
  %i1.0.mi.1.3 = select i1 %cmp3.3, i32 3, i32 %i1.0.mi.1.2
  %.max.0.3 = select i1 %cmp3.3, i32 %3, i32 %.max.0.2
  %4 = load i32* getelementptr inbounds ([10 x i32]* @x, i64 0, i64 4), align 16, !tbaa !0
  %cmp3.4 = icmp sgt i32 %4, %.max.0.3
  %i1.0.mi.1.4 = select i1 %cmp3.4, i32 4, i32 %i1.0.mi.1.3
  %.max.0.4 = select i1 %cmp3.4, i32 %4, i32 %.max.0.3
  %5 = load i32* getelementptr inbounds ([10 x i32]* @x, i64 0, i64 5), align 4, !tbaa !0
  %cmp3.5 = icmp sgt i32 %5, %.max.0.4
  %i1.0.mi.1.5 = select i1 %cmp3.5, i32 5, i32 %i1.0.mi.1.4
  %.max.0.5 = select i1 %cmp3.5, i32 %5, i32 %.max.0.4
  %6 = load i32* getelementptr inbounds ([10 x i32]* @x, i64 0, i64 6), align 8, !tbaa !0
  %cmp3.6 = icmp sgt i32 %6, %.max.0.5
  %i1.0.mi.1.6 = select i1 %cmp3.6, i32 6, i32 %i1.0.mi.1.5
  %.max.0.6 = select i1 %cmp3.6, i32 %6, i32 %.max.0.5
  %7 = load i32* getelementptr inbounds ([10 x i32]* @x, i64 0, i64 7), align 4, !tbaa !0
  %cmp3.7 = icmp sgt i32 %7, %.max.0.6
  %i1.0.mi.1.7 = select i1 %cmp3.7, i32 7, i32 %i1.0.mi.1.6
  %.max.0.7 = select i1 %cmp3.7, i32 %7, i32 %.max.0.6
  %8 = load i32* getelementptr inbounds ([10 x i32]* @x, i64 0, i64 8), align 16, !tbaa !0
  %cmp3.8 = icmp sgt i32 %8, %.max.0.7
  %i1.0.mi.1.8 = select i1 %cmp3.8, i32 8, i32 %i1.0.mi.1.7
  %.max.0.8 = select i1 %cmp3.8, i32 %8, i32 %.max.0.7
  %9 = load i32* getelementptr inbounds ([10 x i32]* @x, i64 0, i64 9), align 4, !tbaa !0
  %cmp3.9 = icmp sgt i32 %9, %.max.0.8
  %i1.0.mi.1.9 = select i1 %cmp3.9, i32 9, i32 %i1.0.mi.1.8
  %.max.0.9 = select i1 %cmp3.9, i32 %9, i32 %.max.0.8
  %cmp6 = icmp eq i32 %.max.0.9, 0
  br i1 %cmp6, label %for.end15, label %if.end8

if.end8:                                          ; preds = %for.cond
  %idxprom9 = sext i32 %i1.0.mi.1.9 to i64
  %arrayidx10 = getelementptr inbounds [10 x i32]* @x, i64 0, i64 %idxprom9
  store i32 0, i32* %arrayidx10, align 4, !tbaa !0
  %inc11 = add nsw i32 %niterations.0, 1
  %cmp12 = icmp sgt i32 %inc11, 10
  br i1 %cmp12, label %if.then13, label %for.cond

if.then13:                                        ; preds = %if.end8
  tail call void @abort() noreturn nounwind
  unreachable

for.end15:                                        ; preds = %for.cond
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind

!0 = metadata !{metadata !"int", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
