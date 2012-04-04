; ModuleID = '/home/david/src/c-semantics/tests/integration/insertion-sort.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@main.a = private unnamed_addr constant [5 x i32] [i32 5, i32 1, i32 9, i32 3, i32 2], align 16

define void @insertion_sort(i32* nocapture %a, i32 %length) nounwind uwtable {
entry:
  %cmp16 = icmp sgt i32 %length, 1
  br i1 %cmp16, label %for.body, label %for.end15

for.body:                                         ; preds = %entry, %for.end
  %indvars.iv20 = phi i64 [ %indvars.iv.next21, %for.end ], [ 1, %entry ]
  %i.017 = phi i32 [ %inc, %for.end ], [ 1, %entry ]
  %arrayidx = getelementptr inbounds i32* %a, i64 %indvars.iv20
  %0 = load i32* %arrayidx, align 4, !tbaa !0
  br label %for.cond1

for.cond1:                                        ; preds = %if.end, %for.body
  %indvars.iv18 = phi i64 [ %indvars.iv.next19, %if.end ], [ %indvars.iv20, %for.body ]
  %j.0.in = phi i32 [ %j.0, %if.end ], [ %i.017, %for.body ]
  %indvars.iv.next19 = add i64 %indvars.iv18, -1
  %j.0 = add nsw i32 %j.0.in, -1
  %1 = trunc i64 %indvars.iv.next19 to i32
  %cmp2 = icmp sgt i32 %1, 0
  br i1 %cmp2, label %for.body3, label %for.end

for.body3:                                        ; preds = %for.cond1
  %arrayidx5 = getelementptr inbounds i32* %a, i64 %indvars.iv.next19
  %2 = load i32* %arrayidx5, align 4, !tbaa !0
  %cmp6 = icmp sgt i32 %2, %0
  br i1 %cmp6, label %if.end, label %for.end

if.end:                                           ; preds = %for.body3
  %arrayidx10 = getelementptr inbounds i32* %a, i64 %indvars.iv18
  store i32 %2, i32* %arrayidx10, align 4, !tbaa !0
  br label %for.cond1

for.end:                                          ; preds = %for.body3, %for.cond1
  %idxprom12 = sext i32 %j.0.in to i64
  %arrayidx13 = getelementptr inbounds i32* %a, i64 %idxprom12
  store i32 %0, i32* %arrayidx13, align 4, !tbaa !0
  %indvars.iv.next21 = add i64 %indvars.iv20, 1
  %inc = add nsw i32 %i.017, 1
  %lftr.wideiv = trunc i64 %indvars.iv.next21 to i32
  %exitcond = icmp eq i32 %lftr.wideiv, %length
  br i1 %exitcond, label %for.end15, label %for.body

for.end15:                                        ; preds = %for.end, %entry
  ret void
}

define i32 @checkThatArrayIsSorted(i32* nocapture %array, i32 %length) nounwind uwtable readonly {
entry:
  %cmp4 = icmp sgt i32 %length, 1
  br i1 %cmp4, label %for.body.lr.ph, label %for.end

for.body.lr.ph:                                   ; preds = %entry
  %.pre = load i32* %array, align 4, !tbaa !0
  br label %for.body

for.body:                                         ; preds = %for.body, %for.body.lr.ph
  %0 = phi i32 [ %.pre, %for.body.lr.ph ], [ %1, %for.body ]
  %indvars.iv = phi i64 [ 1, %for.body.lr.ph ], [ %indvars.iv.next, %for.body ]
  %sorted.05 = phi i32 [ 0, %for.body.lr.ph ], [ %sorted.0.inc, %for.body ]
  %arrayidx2 = getelementptr inbounds i32* %array, i64 %indvars.iv
  %1 = load i32* %arrayidx2, align 4, !tbaa !0
  %not.cmp3 = icmp sle i32 %0, %1
  %inc = zext i1 %not.cmp3 to i32
  %sorted.0.inc = add nsw i32 %inc, %sorted.05
  %indvars.iv.next = add i64 %indvars.iv, 1
  %lftr.wideiv = trunc i64 %indvars.iv.next to i32
  %exitcond = icmp eq i32 %lftr.wideiv, %length
  br i1 %exitcond, label %for.end, label %for.body

for.end:                                          ; preds = %for.body, %entry
  %sorted.0.lcssa = phi i32 [ 0, %entry ], [ %sorted.0.inc, %for.body ]
  ret i32 %sorted.0.lcssa
}

define i32 @main() nounwind uwtable readnone {
for.end.i:
  %a = alloca [5 x i32], align 16
  %0 = bitcast [5 x i32]* %a to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %0, i8* bitcast ([5 x i32]* @main.a to i8*), i64 20, i32 16, i1 false)
  %arrayidx13.i = getelementptr inbounds [5 x i32]* %a, i64 0, i64 1
  store i32 1, i32* %arrayidx13.i, align 4, !tbaa !0
  %arrayidx.i.1 = getelementptr inbounds [5 x i32]* %a, i64 0, i64 2
  %1 = load i32* %arrayidx.i.1, align 8, !tbaa !0
  br label %for.cond1.i.1

for.cond1.i.1:                                    ; preds = %if.end.i.1, %for.end.i
  %indvars.iv18.i.1 = phi i64 [ %indvars.iv.next19.i.1, %if.end.i.1 ], [ 2, %for.end.i ]
  %j.0.in.i.1 = phi i32 [ %j.0.i.1, %if.end.i.1 ], [ 2, %for.end.i ]
  %indvars.iv.next19.i.1 = add i64 %indvars.iv18.i.1, -1
  %j.0.i.1 = add nsw i32 %j.0.in.i.1, -1
  %2 = trunc i64 %indvars.iv.next19.i.1 to i32
  %cmp2.i.1 = icmp sgt i32 %2, 0
  br i1 %cmp2.i.1, label %for.body3.i.1, label %for.end.i.1

for.body3.i.1:                                    ; preds = %for.cond1.i.1
  %arrayidx5.i.1 = getelementptr inbounds [5 x i32]* %a, i64 0, i64 %indvars.iv.next19.i.1
  %3 = load i32* %arrayidx5.i.1, align 4, !tbaa !0
  %cmp6.i.1 = icmp sgt i32 %3, %1
  br i1 %cmp6.i.1, label %if.end.i.1, label %for.end.i.1

for.end.i.1:                                      ; preds = %for.body3.i.1, %for.cond1.i.1
  %idxprom12.i.1 = sext i32 %j.0.in.i.1 to i64
  %arrayidx13.i.1 = getelementptr inbounds [5 x i32]* %a, i64 0, i64 %idxprom12.i.1
  store i32 %1, i32* %arrayidx13.i.1, align 4, !tbaa !0
  %arrayidx.i.2 = getelementptr inbounds [5 x i32]* %a, i64 0, i64 3
  %4 = load i32* %arrayidx.i.2, align 4, !tbaa !0
  br label %for.cond1.i.2

if.end.i.1:                                       ; preds = %for.body3.i.1
  %arrayidx10.i.1 = getelementptr inbounds [5 x i32]* %a, i64 0, i64 %indvars.iv18.i.1
  store i32 %3, i32* %arrayidx10.i.1, align 4, !tbaa !0
  br label %for.cond1.i.1

for.cond1.i.2:                                    ; preds = %if.end.i.2, %for.end.i.1
  %indvars.iv18.i.2 = phi i64 [ %indvars.iv.next19.i.2, %if.end.i.2 ], [ 3, %for.end.i.1 ]
  %j.0.in.i.2 = phi i32 [ %j.0.i.2, %if.end.i.2 ], [ 3, %for.end.i.1 ]
  %indvars.iv.next19.i.2 = add i64 %indvars.iv18.i.2, -1
  %j.0.i.2 = add nsw i32 %j.0.in.i.2, -1
  %5 = trunc i64 %indvars.iv.next19.i.2 to i32
  %cmp2.i.2 = icmp sgt i32 %5, 0
  br i1 %cmp2.i.2, label %for.body3.i.2, label %for.end.i.2

for.body3.i.2:                                    ; preds = %for.cond1.i.2
  %arrayidx5.i.2 = getelementptr inbounds [5 x i32]* %a, i64 0, i64 %indvars.iv.next19.i.2
  %6 = load i32* %arrayidx5.i.2, align 4, !tbaa !0
  %cmp6.i.2 = icmp sgt i32 %6, %4
  br i1 %cmp6.i.2, label %if.end.i.2, label %for.end.i.2

for.end.i.2:                                      ; preds = %for.body3.i.2, %for.cond1.i.2
  %idxprom12.i.2 = sext i32 %j.0.in.i.2 to i64
  %arrayidx13.i.2 = getelementptr inbounds [5 x i32]* %a, i64 0, i64 %idxprom12.i.2
  store i32 %4, i32* %arrayidx13.i.2, align 4, !tbaa !0
  %arrayidx.i.3 = getelementptr inbounds [5 x i32]* %a, i64 0, i64 4
  %7 = load i32* %arrayidx.i.3, align 16, !tbaa !0
  br label %for.cond1.i.3

if.end.i.2:                                       ; preds = %for.body3.i.2
  %arrayidx10.i.2 = getelementptr inbounds [5 x i32]* %a, i64 0, i64 %indvars.iv18.i.2
  store i32 %6, i32* %arrayidx10.i.2, align 4, !tbaa !0
  br label %for.cond1.i.2

for.cond1.i.3:                                    ; preds = %if.end.i.3, %for.end.i.2
  %indvars.iv18.i.3 = phi i64 [ %indvars.iv.next19.i.3, %if.end.i.3 ], [ 4, %for.end.i.2 ]
  %j.0.in.i.3 = phi i32 [ %j.0.i.3, %if.end.i.3 ], [ 4, %for.end.i.2 ]
  %indvars.iv.next19.i.3 = add i64 %indvars.iv18.i.3, -1
  %j.0.i.3 = add nsw i32 %j.0.in.i.3, -1
  %8 = trunc i64 %indvars.iv.next19.i.3 to i32
  %cmp2.i.3 = icmp sgt i32 %8, 0
  br i1 %cmp2.i.3, label %for.body3.i.3, label %for.end.i.3

for.body3.i.3:                                    ; preds = %for.cond1.i.3
  %arrayidx5.i.3 = getelementptr inbounds [5 x i32]* %a, i64 0, i64 %indvars.iv.next19.i.3
  %9 = load i32* %arrayidx5.i.3, align 4, !tbaa !0
  %cmp6.i.3 = icmp sgt i32 %9, %7
  br i1 %cmp6.i.3, label %if.end.i.3, label %for.end.i.3

for.end.i.3:                                      ; preds = %for.body3.i.3, %for.cond1.i.3
  %idxprom12.i.3 = sext i32 %j.0.in.i.3 to i64
  %arrayidx13.i.3 = getelementptr inbounds [5 x i32]* %a, i64 0, i64 %idxprom12.i.3
  store i32 %7, i32* %arrayidx13.i.3, align 4, !tbaa !0
  %10 = bitcast [5 x i32]* %a to i64*
  %.pre.i = load i64* %10, align 16
  %11 = trunc i64 %.pre.i to i32
  %12 = lshr i64 %.pre.i, 32
  %13 = trunc i64 %12 to i32
  %not.cmp3.i = icmp sle i32 %11, %13
  %inc.i3 = zext i1 %not.cmp3.i to i32
  %14 = load i32* %arrayidx.i.1, align 8, !tbaa !0
  %not.cmp3.i.1 = icmp sle i32 %13, %14
  %inc.i3.1 = zext i1 %not.cmp3.i.1 to i32
  %sorted.0.inc.i.1 = add nsw i32 %inc.i3.1, %inc.i3
  %15 = load i32* %arrayidx.i.2, align 4, !tbaa !0
  %not.cmp3.i.2 = icmp sle i32 %14, %15
  %inc.i3.2 = zext i1 %not.cmp3.i.2 to i32
  %sorted.0.inc.i.2 = add nsw i32 %inc.i3.2, %sorted.0.inc.i.1
  %16 = load i32* %arrayidx.i.3, align 16, !tbaa !0
  %not.cmp3.i.3 = icmp sle i32 %15, %16
  %inc.i3.3 = zext i1 %not.cmp3.i.3 to i32
  %sorted.0.inc.i.3 = add nsw i32 %inc.i3.3, %sorted.0.inc.i.2
  ret i32 %sorted.0.inc.i.3

if.end.i.3:                                       ; preds = %for.body3.i.3
  %arrayidx10.i.3 = getelementptr inbounds [5 x i32]* %a, i64 0, i64 %indvars.iv18.i.3
  store i32 %9, i32* %arrayidx10.i.3, align 4, !tbaa !0
  br label %for.cond1.i.3
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

!0 = metadata !{metadata !"int", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
