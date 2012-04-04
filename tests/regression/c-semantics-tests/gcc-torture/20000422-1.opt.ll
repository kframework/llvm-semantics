; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20000422-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@ops = global [13 x i32] [i32 11, i32 12, i32 46, i32 3, i32 2, i32 2, i32 3, i32 2, i32 1, i32 3, i32 2, i32 1, i32 2], align 16
@correct = global [13 x i32] [i32 46, i32 12, i32 11, i32 3, i32 3, i32 3, i32 2, i32 2, i32 2, i32 2, i32 2, i32 1, i32 1], align 16
@num = global i32 13, align 4

define i32 @main() noreturn nounwind uwtable {
entry:
  %0 = load i32* @num, align 4, !tbaa !0
  %cmp37 = icmp sgt i32 %0, 0
  br i1 %cmp37, label %for.cond1.preheader, label %for.cond20

for.cond1.preheader:                              ; preds = %entry, %for.inc18
  %i.038 = phi i32 [ %inc, %for.inc18 ], [ 0, %entry ]
  %j.033 = add nsw i32 %0, -1
  %cmp234 = icmp sgt i32 %j.033, %i.038
  br i1 %cmp234, label %for.body3.lr.ph, label %for.inc18

for.body3.lr.ph:                                  ; preds = %for.cond1.preheader
  %1 = sext i32 %j.033 to i64
  br label %for.body3

for.body3:                                        ; preds = %for.body3.lr.ph, %for.cond1.backedge
  %indvars.iv39 = phi i64 [ %1, %for.body3.lr.ph ], [ %indvars.iv.next40, %for.cond1.backedge ]
  %j.036 = phi i32 [ %j.033, %for.body3.lr.ph ], [ %j.0, %for.cond1.backedge ]
  %j.0.in35 = phi i32 [ %0, %for.body3.lr.ph ], [ %4, %for.cond1.backedge ]
  %sub4 = add nsw i32 %j.0.in35, -2
  %idxprom = sext i32 %sub4 to i64
  %arrayidx = getelementptr inbounds [13 x i32]* @ops, i64 0, i64 %idxprom
  %2 = load i32* %arrayidx, align 4, !tbaa !0
  %arrayidx6 = getelementptr inbounds [13 x i32]* @ops, i64 0, i64 %indvars.iv39
  %3 = load i32* %arrayidx6, align 4, !tbaa !0
  %cmp7 = icmp slt i32 %2, %3
  br i1 %cmp7, label %if.then, label %for.cond1.backedge

for.cond1.backedge:                               ; preds = %for.body3, %if.then
  %j.0 = add nsw i32 %j.036, -1
  %cmp2 = icmp sgt i32 %j.0, %i.038
  %indvars.iv.next40 = add i64 %indvars.iv39, -1
  %4 = trunc i64 %indvars.iv39 to i32
  br i1 %cmp2, label %for.body3, label %for.inc18

if.then:                                          ; preds = %for.body3
  store i32 %2, i32* %arrayidx6, align 4, !tbaa !0
  store i32 %3, i32* %arrayidx, align 4, !tbaa !0
  br label %for.cond1.backedge

for.inc18:                                        ; preds = %for.cond1.backedge, %for.cond1.preheader
  %inc = add nsw i32 %i.038, 1
  %cmp = icmp slt i32 %inc, %0
  br i1 %cmp, label %for.cond1.preheader, label %for.cond20

for.cond20:                                       ; preds = %entry, %for.inc18, %for.body22
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body22 ], [ 0, %for.inc18 ], [ 0, %entry ]
  %5 = trunc i64 %indvars.iv to i32
  %cmp21 = icmp slt i32 %5, %0
  br i1 %cmp21, label %for.body22, label %for.end32

for.body22:                                       ; preds = %for.cond20
  %arrayidx24 = getelementptr inbounds [13 x i32]* @ops, i64 0, i64 %indvars.iv
  %6 = load i32* %arrayidx24, align 4, !tbaa !0
  %arrayidx26 = getelementptr inbounds [13 x i32]* @correct, i64 0, i64 %indvars.iv
  %7 = load i32* %arrayidx26, align 4, !tbaa !0
  %cmp27 = icmp eq i32 %6, %7
  %indvars.iv.next = add i64 %indvars.iv, 1
  br i1 %cmp27, label %for.cond20, label %if.then28

if.then28:                                        ; preds = %for.body22
  tail call void @abort() noreturn nounwind
  unreachable

for.end32:                                        ; preds = %for.cond20
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind

!0 = metadata !{metadata !"int", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
