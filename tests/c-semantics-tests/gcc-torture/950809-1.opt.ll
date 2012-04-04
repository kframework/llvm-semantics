; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/950809-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.S = type { i32*, i32, i32*, [2 x i32] }

@main.sc = internal global [3 x i32] [i32 2, i32 3, i32 4], align 4

define void @f(%struct.S* nocapture %x) nounwind uwtable {
entry:
  %sc = getelementptr inbounds %struct.S* %x, i64 0, i32 2
  %0 = load i32** %sc, align 8, !tbaa !0
  %1 = load i32* %0, align 4, !tbaa !3
  %arrayidx1 = getelementptr inbounds i32* %0, i64 1
  %2 = load i32* %arrayidx1, align 4, !tbaa !3
  %arrayidx2 = getelementptr inbounds i32* %0, i64 2
  %3 = load i32* %arrayidx2, align 4, !tbaa !3
  %arrayidx3 = getelementptr inbounds %struct.S* %x, i64 0, i32 3, i64 0
  %4 = load i32* %arrayidx3, align 4, !tbaa !3
  %arrayidx5 = getelementptr inbounds %struct.S* %x, i64 0, i32 3, i64 1
  %5 = load i32* %arrayidx5, align 4, !tbaa !3
  store i32 %1, i32* %arrayidx2, align 4, !tbaa !3
  store i32 %5, i32* %0, align 4, !tbaa !3
  store i32 %4, i32* %arrayidx5, align 4, !tbaa !3
  store i32 %3, i32* %arrayidx3, align 4, !tbaa !3
  %fc = getelementptr inbounds %struct.S* %x, i64 0, i32 1
  store i32 %2, i32* %fc, align 4, !tbaa !3
  %sp = getelementptr inbounds %struct.S* %x, i64 0, i32 0
  store i32* %0, i32** %sp, align 8, !tbaa !0
  ret void
}

define i32 @main() noreturn nounwind uwtable {
entry:
  %0 = load i32* getelementptr inbounds ([3 x i32]* @main.sc, i64 0, i64 0), align 4, !tbaa !3
  store i32 %0, i32* getelementptr inbounds ([3 x i32]* @main.sc, i64 0, i64 2), align 4, !tbaa !3
  store i32 11, i32* getelementptr inbounds ([3 x i32]* @main.sc, i64 0, i64 0), align 4, !tbaa !3
  %cmp = icmp eq i32 %0, 2
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

!0 = metadata !{metadata !"any pointer", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
!3 = metadata !{metadata !"int", metadata !1}
