; ModuleID = '/home/david/src/c-semantics/tests/llvm-regression/badidx.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable {
entry:
  %cmp = icmp eq i32 %argc, 2
  br i1 %cmp, label %cond.end, label %cond.end.thread

cond.end.thread:                                  ; preds = %entry
  %call111 = tail call noalias i8* @calloc(i64 1, i64 4) nounwind
  %0 = bitcast i8* %call111 to i32*
  br label %for.body.lr.ph

cond.end:                                         ; preds = %entry
  %arrayidx = getelementptr inbounds i8** %argv, i64 1
  %1 = load i8** %arrayidx, align 8, !tbaa !0
  %call.i = tail call i64 @strtol(i8* nocapture %1, i8** null, i32 10) nounwind
  %conv.i = trunc i64 %call.i to i32
  %conv = sext i32 %conv.i to i64
  %call1 = tail call noalias i8* @calloc(i64 %conv, i64 4) nounwind
  %2 = bitcast i8* %call1 to i32*
  %cmp28 = icmp sgt i32 %conv.i, 0
  br i1 %cmp28, label %for.body.lr.ph, label %for.end

for.body.lr.ph:                                   ; preds = %cond.end.thread, %cond.end
  %3 = phi i32* [ %0, %cond.end.thread ], [ %2, %cond.end ]
  %cond14 = phi i32 [ 1, %cond.end.thread ], [ %conv.i, %cond.end ]
  br label %for.body

for.body:                                         ; preds = %for.body, %for.body.lr.ph
  %indvars.iv = phi i64 [ 0, %for.body.lr.ph ], [ %indvars.iv.next, %for.body ]
  %4 = trunc i64 %indvars.iv to i32
  %mul = mul nsw i32 %4, %4
  %arrayidx4 = getelementptr inbounds i32* %3, i64 %indvars.iv
  store i32 %mul, i32* %arrayidx4, align 4, !tbaa !3
  %indvars.iv.next = add i64 %indvars.iv, 1
  %lftr.wideiv = trunc i64 %indvars.iv.next to i32
  %exitcond = icmp eq i32 %lftr.wideiv, %cond14
  br i1 %exitcond, label %for.end, label %for.body

for.end:                                          ; preds = %for.body, %cond.end
  %5 = phi i32* [ %2, %cond.end ], [ %3, %for.body ]
  %cond13 = phi i32 [ %conv.i, %cond.end ], [ %cond14, %for.body ]
  %sub = add nsw i32 %cond13, -1
  %idxprom5 = sext i32 %sub to i64
  %arrayidx6 = getelementptr inbounds i32* %5, i64 %idxprom5
  %6 = load i32* %arrayidx6, align 4, !tbaa !3
  %call7 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 %6) nounwind
  ret i32 0
}

declare noalias i8* @calloc(i64, i64) nounwind

declare i32 @printf(i8* nocapture, ...) nounwind

declare i64 @strtol(i8*, i8** nocapture, i32) nounwind

!0 = metadata !{metadata !"any pointer", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
!3 = metadata !{metadata !"int", metadata !1}
