; ModuleID = '/home/david/src/c-semantics/tests/unitTests/inits.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@main.y0 = private unnamed_addr constant [12 x i32] [i32 1, i32 3, i32 5, i32 2, i32 4, i32 6, i32 3, i32 5, i32 7, i32 0, i32 0, i32 0], align 16
@main.y2 = private unnamed_addr constant [4 x [3 x i32]] [[3 x i32] [i32 1, i32 3, i32 5], [3 x i32] [i32 2, i32 4, i32 6], [3 x i32] [i32 3, i32 5, i32 7], [3 x i32] zeroinitializer], align 16
@.str = private unnamed_addr constant [54 x i8] c"i=%d, j=%d, k=%d; y0[k]=%d, y1[i][j]=%d, y2[i][j]=%d\0A\00", align 1

define i32 @main() nounwind uwtable {
entry:
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc.2, %entry
  %indvars.iv = phi i64 [ 0, %entry ], [ %indvars.iv.next, %for.inc.2 ]
  %i.032 = phi i32 [ 0, %entry ], [ %inc29, %for.inc.2 ]
  %0 = mul nsw i64 %indvars.iv, 3
  %mul = mul nsw i32 %i.032, 3
  %arrayidx5 = getelementptr inbounds [4 x [3 x i32]]* @main.y2, i64 0, i64 %indvars.iv, i64 0
  %1 = load i32* %arrayidx5, align 4, !tbaa !0
  %arrayidx9 = getelementptr inbounds [4 x [3 x i32]]* @main.y2, i64 0, i64 %indvars.iv, i64 0
  %2 = load i32* %arrayidx9, align 4, !tbaa !0
  %cmp10 = icmp eq i32 %1, %2
  %arrayidx16 = getelementptr inbounds [12 x i32]* @main.y0, i64 0, i64 %0
  %3 = load i32* %arrayidx16, align 4, !tbaa !0
  %cmp17 = icmp eq i32 %1, %3
  %or.cond = and i1 %cmp10, %cmp17
  br i1 %or.cond, label %for.inc, label %if.then

if.then:                                          ; preds = %for.cond1.preheader
  %4 = trunc i64 %indvars.iv to i32
  %call = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([54 x i8]* @.str, i64 0, i64 0), i32 %4, i32 0, i32 %mul, i32 %3, i32 %1, i32 %2) nounwind
  br label %for.inc

for.inc:                                          ; preds = %for.cond1.preheader, %if.then
  %5 = add nsw i64 %0, 1
  %arrayidx5.1 = getelementptr inbounds [4 x [3 x i32]]* @main.y2, i64 0, i64 %indvars.iv, i64 1
  %6 = load i32* %arrayidx5.1, align 4, !tbaa !0
  %arrayidx9.1 = getelementptr inbounds [4 x [3 x i32]]* @main.y2, i64 0, i64 %indvars.iv, i64 1
  %7 = load i32* %arrayidx9.1, align 4, !tbaa !0
  %cmp10.1 = icmp eq i32 %6, %7
  %arrayidx16.1 = getelementptr inbounds [12 x i32]* @main.y0, i64 0, i64 %5
  %8 = load i32* %arrayidx16.1, align 4, !tbaa !0
  %cmp17.1 = icmp eq i32 %6, %8
  %or.cond39 = and i1 %cmp10.1, %cmp17.1
  br i1 %or.cond39, label %for.inc.1, label %if.then.1

for.end30:                                        ; preds = %for.inc.2
  ret i32 0

if.then.1:                                        ; preds = %for.inc
  %add.1 = add nsw i32 %mul, 1
  %9 = trunc i64 %indvars.iv to i32
  %call.1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([54 x i8]* @.str, i64 0, i64 0), i32 %9, i32 1, i32 %add.1, i32 %8, i32 %6, i32 %7) nounwind
  br label %for.inc.1

for.inc.1:                                        ; preds = %for.inc, %if.then.1
  %10 = add nsw i64 %0, 2
  %arrayidx5.2 = getelementptr inbounds [4 x [3 x i32]]* @main.y2, i64 0, i64 %indvars.iv, i64 2
  %11 = load i32* %arrayidx5.2, align 4, !tbaa !0
  %arrayidx9.2 = getelementptr inbounds [4 x [3 x i32]]* @main.y2, i64 0, i64 %indvars.iv, i64 2
  %12 = load i32* %arrayidx9.2, align 4, !tbaa !0
  %cmp10.2 = icmp eq i32 %11, %12
  %arrayidx16.2 = getelementptr inbounds [12 x i32]* @main.y0, i64 0, i64 %10
  %13 = load i32* %arrayidx16.2, align 4, !tbaa !0
  %cmp17.2 = icmp eq i32 %11, %13
  %or.cond40 = and i1 %cmp10.2, %cmp17.2
  br i1 %or.cond40, label %for.inc.2, label %if.then.2

if.then.2:                                        ; preds = %for.inc.1
  %add.2 = add nsw i32 %mul, 2
  %14 = trunc i64 %indvars.iv to i32
  %call.2 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([54 x i8]* @.str, i64 0, i64 0), i32 %14, i32 2, i32 %add.2, i32 %13, i32 %11, i32 %12) nounwind
  br label %for.inc.2

for.inc.2:                                        ; preds = %for.inc.1, %if.then.2
  %indvars.iv.next = add i64 %indvars.iv, 1
  %inc29 = add nsw i32 %i.032, 1
  %lftr.wideiv = trunc i64 %indvars.iv.next to i32
  %exitcond = icmp eq i32 %lftr.wideiv, 4
  br i1 %exitcond, label %for.end30, label %for.cond1.preheader
}

declare i32 @printf(i8* nocapture, ...) nounwind

!0 = metadata !{metadata !"int", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
