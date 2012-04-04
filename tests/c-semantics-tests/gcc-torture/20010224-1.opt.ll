; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20010224-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@masktab = global [6 x i16] [i16 1, i16 2, i16 3, i16 4, i16 5, i16 0], align 2
@psd = global [6 x i16] [i16 50, i16 40, i16 30, i16 20, i16 10, i16 0], align 2
@bndpsd = global [6 x i16] [i16 1, i16 2, i16 3, i16 4, i16 5, i16 0], align 2

define void @ba_compute_psd(i16 signext %start) nounwind uwtable {
entry:
  %conv = sext i16 %start to i32
  %idxprom = sext i16 %start to i64
  %arrayidx = getelementptr inbounds [6 x i16]* @masktab, i64 0, i64 %idxprom
  %0 = load i16* %arrayidx, align 2, !tbaa !0
  %arrayidx3 = getelementptr inbounds [6 x i16]* @psd, i64 0, i64 %idxprom
  %1 = load i16* %arrayidx3, align 2, !tbaa !0
  %idxprom4 = sext i16 %0 to i64
  %arrayidx5 = getelementptr inbounds [6 x i16]* @bndpsd, i64 0, i64 %idxprom4
  store i16 %1, i16* %arrayidx5, align 2, !tbaa !0
  %inc = add nsw i32 %conv, 1
  %cmp16 = icmp slt i32 %inc, 4
  br i1 %cmp16, label %for.body.lr.ph, label %for.end

for.body.lr.ph:                                   ; preds = %entry
  %2 = sext i32 %inc to i64
  br label %for.body

for.body:                                         ; preds = %for.body, %for.body.lr.ph
  %indvars.iv = phi i64 [ %2, %for.body.lr.ph ], [ %indvars.iv.next, %for.body ]
  %3 = phi i16 [ %1, %for.body.lr.ph ], [ %add.i, %for.body ]
  %arrayidx11 = getelementptr inbounds [6 x i16]* @psd, i64 0, i64 %indvars.iv
  %4 = load i16* %arrayidx11, align 2, !tbaa !0
  %add.i = add i16 %4, %3
  %indvars.iv.next = add i64 %indvars.iv, 1
  %lftr.wideiv = trunc i64 %indvars.iv.next to i32
  %exitcond = icmp eq i32 %lftr.wideiv, 4
  br i1 %exitcond, label %for.cond.for.end_crit_edge, label %for.body

for.cond.for.end_crit_edge:                       ; preds = %for.body
  store i16 %add.i, i16* %arrayidx5, align 2
  br label %for.end

for.end:                                          ; preds = %for.cond.for.end_crit_edge, %entry
  ret void
}

define signext i16 @logadd(i16* nocapture %a, i16* nocapture %b) nounwind uwtable readonly {
entry:
  %0 = load i16* %a, align 2, !tbaa !0
  %1 = load i16* %b, align 2, !tbaa !0
  %add = add i16 %1, %0
  ret i16 %add
}

define i32 @main() nounwind uwtable {
entry:
  %0 = load i16* getelementptr inbounds ([6 x i16]* @masktab, i64 0, i64 0), align 2, !tbaa !0
  %1 = load i16* getelementptr inbounds ([6 x i16]* @psd, i64 0, i64 0), align 2, !tbaa !0
  %idxprom4.i = sext i16 %0 to i64
  %arrayidx5.i = getelementptr inbounds [6 x i16]* @bndpsd, i64 0, i64 %idxprom4.i
  %2 = load i16* getelementptr inbounds ([6 x i16]* @psd, i64 0, i64 1), align 2, !tbaa !0
  %add.i.i = add i16 %2, %1
  %3 = load i16* getelementptr inbounds ([6 x i16]* @psd, i64 0, i64 2), align 2, !tbaa !0
  %add.i.i.1 = add i16 %3, %add.i.i
  %4 = load i16* getelementptr inbounds ([6 x i16]* @psd, i64 0, i64 3), align 2, !tbaa !0
  %add.i.i.2 = add i16 %4, %add.i.i.1
  store i16 %add.i.i.2, i16* %arrayidx5.i, align 2
  %5 = load i16* getelementptr inbounds ([6 x i16]* @bndpsd, i64 0, i64 1), align 2, !tbaa !0
  %cmp = icmp eq i16 %5, 140
  br i1 %cmp, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret i32 0
}

declare void @abort() noreturn nounwind

!0 = metadata !{metadata !"short", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
