; ModuleID = '/home/david/src/c-semantics/tests/llvm-unit/2008-04-18-LoopBug.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [16 x i8] c"%d %d %d %d %d\0A\00", align 1

define void @foo(i32 %i, i32* nocapture %array) nounwind uwtable noinline {
entry:
  %cmp7 = icmp ult i32 %i, 3
  br i1 %cmp7, label %for.body, label %for.end

for.body:                                         ; preds = %entry, %for.body
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body ], [ 3, %entry ]
  %indvars.iv.next = add i64 %indvars.iv, -1
  %arrayidx = getelementptr inbounds i32* %array, i64 %indvars.iv.next
  %0 = load i32* %arrayidx, align 4, !tbaa !0
  %arrayidx2 = getelementptr inbounds i32* %array, i64 %indvars.iv
  store i32 %0, i32* %arrayidx2, align 4, !tbaa !0
  %1 = trunc i64 %indvars.iv.next to i32
  %cmp = icmp ugt i32 %1, %i
  br i1 %cmp, label %for.body, label %for.end

for.end:                                          ; preds = %for.body, %entry
  %2 = load i32* %array, align 4, !tbaa !0
  %arrayidx4 = getelementptr inbounds i32* %array, i64 1
  %3 = load i32* %arrayidx4, align 4, !tbaa !0
  %arrayidx5 = getelementptr inbounds i32* %array, i64 2
  %4 = load i32* %arrayidx5, align 4, !tbaa !0
  %arrayidx6 = getelementptr inbounds i32* %array, i64 3
  %5 = load i32* %arrayidx6, align 4, !tbaa !0
  %call = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([16 x i8]* @.str, i64 0, i64 0), i32 %i, i32 %2, i32 %3, i32 %4, i32 %5) nounwind
  ret void
}

declare i32 @printf(i8* nocapture, ...) nounwind

define i32 @main() nounwind uwtable {
entry:
  %array = alloca [4 x i32], align 16
  %arrayidx = getelementptr inbounds [4 x i32]* %array, i64 0, i64 0
  store i32 5, i32* %arrayidx, align 16, !tbaa !0
  %arrayidx1 = getelementptr inbounds [4 x i32]* %array, i64 0, i64 1
  store i32 6, i32* %arrayidx1, align 4, !tbaa !0
  %arrayidx2 = getelementptr inbounds [4 x i32]* %array, i64 0, i64 2
  store i32 7, i32* %arrayidx2, align 8, !tbaa !0
  %arrayidx3 = getelementptr inbounds [4 x i32]* %array, i64 0, i64 3
  store i32 8, i32* %arrayidx3, align 4, !tbaa !0
  call void @foo(i32 0, i32* %arrayidx)
  store i32 5, i32* %arrayidx, align 16, !tbaa !0
  store i32 6, i32* %arrayidx1, align 4, !tbaa !0
  store i32 7, i32* %arrayidx2, align 8, !tbaa !0
  store i32 8, i32* %arrayidx3, align 4, !tbaa !0
  call void @foo(i32 1, i32* %arrayidx)
  store i32 5, i32* %arrayidx, align 16, !tbaa !0
  store i32 6, i32* %arrayidx1, align 4, !tbaa !0
  store i32 7, i32* %arrayidx2, align 8, !tbaa !0
  store i32 8, i32* %arrayidx3, align 4, !tbaa !0
  call void @foo(i32 2, i32* %arrayidx)
  store i32 5, i32* %arrayidx, align 16, !tbaa !0
  store i32 6, i32* %arrayidx1, align 4, !tbaa !0
  store i32 7, i32* %arrayidx2, align 8, !tbaa !0
  store i32 8, i32* %arrayidx3, align 4, !tbaa !0
  call void @foo(i32 3, i32* %arrayidx)
  store i32 5, i32* %arrayidx, align 16, !tbaa !0
  store i32 6, i32* %arrayidx1, align 4, !tbaa !0
  store i32 7, i32* %arrayidx2, align 8, !tbaa !0
  store i32 8, i32* %arrayidx3, align 4, !tbaa !0
  call void @foo(i32 4, i32* %arrayidx)
  store i32 5, i32* %arrayidx, align 16, !tbaa !0
  store i32 6, i32* %arrayidx1, align 4, !tbaa !0
  store i32 7, i32* %arrayidx2, align 8, !tbaa !0
  store i32 8, i32* %arrayidx3, align 4, !tbaa !0
  call void @foo(i32 -1, i32* %arrayidx)
  ret i32 0
}

!0 = metadata !{metadata !"int", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
