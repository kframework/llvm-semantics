; ModuleID = '/home/david/src/c-semantics/tests/llvm-regression/sumarray2d.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [23 x i8] c"Sum(Array[%d,%d] = %d\0A\00", align 1

define i32 @SumArray([10 x i32]* nocapture %Array, i32 %NumI, i32 %NumJ) nounwind uwtable readonly {
entry:
  %cmp12 = icmp eq i32 %NumI, 0
  br i1 %cmp12, label %for.end8, label %for.cond1.preheader.lr.ph

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %cmp29 = icmp eq i32 %NumJ, 0
  br i1 %cmp29, label %for.inc6, label %for.body3.lr.ph.us

for.inc6.us:                                      ; preds = %for.body3.us
  %indvars.iv.next17 = add i64 %indvars.iv16, 1
  %lftr.wideiv18 = trunc i64 %indvars.iv.next17 to i32
  %exitcond19 = icmp eq i32 %lftr.wideiv18, %NumI
  br i1 %exitcond19, label %for.end8, label %for.body3.lr.ph.us

for.body3.us:                                     ; preds = %for.body3.us, %for.body3.lr.ph.us
  %indvars.iv = phi i64 [ 0, %for.body3.lr.ph.us ], [ %indvars.iv.next, %for.body3.us ]
  %Result.111.us = phi i32 [ %Result.014.us, %for.body3.lr.ph.us ], [ %add.us, %for.body3.us ]
  %arrayidx5.us = getelementptr inbounds [10 x i32]* %Array, i64 %indvars.iv16, i64 %indvars.iv
  %0 = load i32* %arrayidx5.us, align 4, !tbaa !0
  %add.us = add nsw i32 %0, %Result.111.us
  %indvars.iv.next = add i64 %indvars.iv, 1
  %lftr.wideiv = trunc i64 %indvars.iv.next to i32
  %exitcond = icmp eq i32 %lftr.wideiv, %NumJ
  br i1 %exitcond, label %for.inc6.us, label %for.body3.us

for.body3.lr.ph.us:                               ; preds = %for.inc6.us, %for.cond1.preheader.lr.ph
  %indvars.iv16 = phi i64 [ %indvars.iv.next17, %for.inc6.us ], [ 0, %for.cond1.preheader.lr.ph ]
  %Result.014.us = phi i32 [ %add.us, %for.inc6.us ], [ 0, %for.cond1.preheader.lr.ph ]
  br label %for.body3.us

for.inc6:                                         ; preds = %for.inc6, %for.cond1.preheader.lr.ph
  %i.013 = phi i32 [ %inc7, %for.inc6 ], [ 0, %for.cond1.preheader.lr.ph ]
  %inc7 = add i32 %i.013, 1
  %exitcond20 = icmp eq i32 %inc7, %NumI
  br i1 %exitcond20, label %for.end8, label %for.inc6

for.end8:                                         ; preds = %for.inc6.us, %for.inc6, %entry
  %Result.0.lcssa = phi i32 [ 0, %entry ], [ %add.us, %for.inc6.us ], [ 0, %for.inc6 ]
  ret i32 %Result.0.lcssa
}

define i32 @main() nounwind uwtable {
entry:
  %Array = alloca [10 x [10 x i32]], align 16
  %arrayidx2 = getelementptr inbounds [10 x [10 x i32]]* %Array, i64 0, i64 0, i64 0
  store i32 0, i32* %arrayidx2, align 16, !tbaa !0
  %arrayidx2.1 = getelementptr inbounds [10 x [10 x i32]]* %Array, i64 0, i64 1, i64 1
  store i32 -1, i32* %arrayidx2.1, align 4, !tbaa !0
  %arrayidx2.2 = getelementptr inbounds [10 x [10 x i32]]* %Array, i64 0, i64 2, i64 2
  store i32 -2, i32* %arrayidx2.2, align 8, !tbaa !0
  %arrayidx2.3 = getelementptr inbounds [10 x [10 x i32]]* %Array, i64 0, i64 3, i64 3
  store i32 -3, i32* %arrayidx2.3, align 4, !tbaa !0
  %arrayidx2.4 = getelementptr inbounds [10 x [10 x i32]]* %Array, i64 0, i64 4, i64 4
  store i32 -4, i32* %arrayidx2.4, align 16, !tbaa !0
  %arrayidx2.5 = getelementptr inbounds [10 x [10 x i32]]* %Array, i64 0, i64 5, i64 5
  store i32 -5, i32* %arrayidx2.5, align 4, !tbaa !0
  %arrayidx2.6 = getelementptr inbounds [10 x [10 x i32]]* %Array, i64 0, i64 6, i64 6
  store i32 -6, i32* %arrayidx2.6, align 8, !tbaa !0
  %arrayidx2.7 = getelementptr inbounds [10 x [10 x i32]]* %Array, i64 0, i64 7, i64 7
  store i32 -7, i32* %arrayidx2.7, align 4, !tbaa !0
  %arrayidx2.8 = getelementptr inbounds [10 x [10 x i32]]* %Array, i64 0, i64 8, i64 8
  store i32 -8, i32* %arrayidx2.8, align 16, !tbaa !0
  %arrayidx2.9 = getelementptr inbounds [10 x [10 x i32]]* %Array, i64 0, i64 9, i64 9
  store i32 -9, i32* %arrayidx2.9, align 4, !tbaa !0
  br label %for.cond6.preheader

for.cond6.preheader:                              ; preds = %for.inc14.9, %entry
  %indvars.iv = phi i64 [ 0, %entry ], [ %indvars.iv.next, %for.inc14.9 ]
  %0 = trunc i64 %indvars.iv to i32
  %cmp9 = icmp eq i32 %0, 0
  br i1 %cmp9, label %for.inc14.1.thread35, label %for.inc14

for.inc14.1.thread35:                             ; preds = %for.cond6.preheader
  %1 = add i64 %indvars.iv, 1
  %arrayidx13.136 = getelementptr inbounds [10 x [10 x i32]]* %Array, i64 0, i64 %indvars.iv, i64 1
  %2 = trunc i64 %1 to i32
  store i32 %2, i32* %arrayidx13.136, align 4, !tbaa !0
  br label %for.inc14.2.thread39

for.inc14:                                        ; preds = %for.cond6.preheader
  %arrayidx13 = getelementptr inbounds [10 x [10 x i32]]* %Array, i64 0, i64 %indvars.iv, i64 0
  store i32 %0, i32* %arrayidx13, align 8, !tbaa !0
  %cmp9.1 = icmp eq i32 %0, 1
  br i1 %cmp9.1, label %for.inc14.2.thread39, label %for.inc14.1

for.body3.lr.ph.us.i:                             ; preds = %for.body3.lr.ph.us.i, %for.inc14.9
  %indvars.iv16.i = phi i64 [ 0, %for.inc14.9 ], [ %indvars.iv.next17.i, %for.body3.lr.ph.us.i ]
  %Result.014.us.i = phi i32 [ 0, %for.inc14.9 ], [ %add.us.i.9, %for.body3.lr.ph.us.i ]
  %arrayidx5.us.i = getelementptr inbounds [10 x [10 x i32]]* %Array, i64 0, i64 %indvars.iv16.i, i64 0
  %3 = load i32* %arrayidx5.us.i, align 8, !tbaa !0
  %add.us.i = add nsw i32 %3, %Result.014.us.i
  %arrayidx5.us.i.1 = getelementptr inbounds [10 x [10 x i32]]* %Array, i64 0, i64 %indvars.iv16.i, i64 1
  %4 = load i32* %arrayidx5.us.i.1, align 4, !tbaa !0
  %add.us.i.1 = add nsw i32 %4, %add.us.i
  %arrayidx5.us.i.2 = getelementptr inbounds [10 x [10 x i32]]* %Array, i64 0, i64 %indvars.iv16.i, i64 2
  %5 = load i32* %arrayidx5.us.i.2, align 8, !tbaa !0
  %add.us.i.2 = add nsw i32 %5, %add.us.i.1
  %arrayidx5.us.i.3 = getelementptr inbounds [10 x [10 x i32]]* %Array, i64 0, i64 %indvars.iv16.i, i64 3
  %6 = load i32* %arrayidx5.us.i.3, align 4, !tbaa !0
  %add.us.i.3 = add nsw i32 %6, %add.us.i.2
  %arrayidx5.us.i.4 = getelementptr inbounds [10 x [10 x i32]]* %Array, i64 0, i64 %indvars.iv16.i, i64 4
  %7 = load i32* %arrayidx5.us.i.4, align 8, !tbaa !0
  %add.us.i.4 = add nsw i32 %7, %add.us.i.3
  %arrayidx5.us.i.5 = getelementptr inbounds [10 x [10 x i32]]* %Array, i64 0, i64 %indvars.iv16.i, i64 5
  %8 = load i32* %arrayidx5.us.i.5, align 4, !tbaa !0
  %add.us.i.5 = add nsw i32 %8, %add.us.i.4
  %arrayidx5.us.i.6 = getelementptr inbounds [10 x [10 x i32]]* %Array, i64 0, i64 %indvars.iv16.i, i64 6
  %9 = load i32* %arrayidx5.us.i.6, align 8, !tbaa !0
  %add.us.i.6 = add nsw i32 %9, %add.us.i.5
  %arrayidx5.us.i.7 = getelementptr inbounds [10 x [10 x i32]]* %Array, i64 0, i64 %indvars.iv16.i, i64 7
  %10 = load i32* %arrayidx5.us.i.7, align 4, !tbaa !0
  %add.us.i.7 = add nsw i32 %10, %add.us.i.6
  %arrayidx5.us.i.8 = getelementptr inbounds [10 x [10 x i32]]* %Array, i64 0, i64 %indvars.iv16.i, i64 8
  %11 = load i32* %arrayidx5.us.i.8, align 8, !tbaa !0
  %add.us.i.8 = add nsw i32 %11, %add.us.i.7
  %arrayidx5.us.i.9 = getelementptr inbounds [10 x [10 x i32]]* %Array, i64 0, i64 %indvars.iv16.i, i64 9
  %12 = load i32* %arrayidx5.us.i.9, align 4, !tbaa !0
  %add.us.i.9 = add nsw i32 %12, %add.us.i.8
  %indvars.iv.next17.i = add i64 %indvars.iv16.i, 1
  %lftr.wideiv = trunc i64 %indvars.iv.next17.i to i32
  %exitcond = icmp eq i32 %lftr.wideiv, 10
  br i1 %exitcond, label %SumArray.exit, label %for.body3.lr.ph.us.i

SumArray.exit:                                    ; preds = %for.body3.lr.ph.us.i
  %call20 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str, i64 0, i64 0), i32 10, i32 10, i32 %add.us.i.9) nounwind
  ret i32 0

for.inc14.1:                                      ; preds = %for.inc14
  %13 = add i64 %indvars.iv, 1
  %arrayidx13.1 = getelementptr inbounds [10 x [10 x i32]]* %Array, i64 0, i64 %indvars.iv, i64 1
  %14 = trunc i64 %13 to i32
  store i32 %14, i32* %arrayidx13.1, align 4, !tbaa !0
  %cmp9.2 = icmp eq i32 %0, 2
  br i1 %cmp9.2, label %for.inc14.3.thread43, label %for.inc14.2

for.inc14.3.thread43:                             ; preds = %for.inc14.1
  %15 = add i64 %indvars.iv, 3
  %arrayidx13.344 = getelementptr inbounds [10 x [10 x i32]]* %Array, i64 0, i64 %indvars.iv, i64 3
  %16 = trunc i64 %15 to i32
  store i32 %16, i32* %arrayidx13.344, align 4, !tbaa !0
  br label %for.inc14.4.thread47

for.inc14.2.thread39:                             ; preds = %for.inc14.1.thread35, %for.inc14
  %17 = add i64 %indvars.iv, 2
  %arrayidx13.240 = getelementptr inbounds [10 x [10 x i32]]* %Array, i64 0, i64 %indvars.iv, i64 2
  %18 = trunc i64 %17 to i32
  store i32 %18, i32* %arrayidx13.240, align 8, !tbaa !0
  br label %for.inc14.3

for.inc14.2:                                      ; preds = %for.inc14.1
  %19 = add i64 %indvars.iv, 2
  %arrayidx13.2 = getelementptr inbounds [10 x [10 x i32]]* %Array, i64 0, i64 %indvars.iv, i64 2
  %20 = trunc i64 %19 to i32
  store i32 %20, i32* %arrayidx13.2, align 8, !tbaa !0
  %cmp9.3 = icmp eq i32 %0, 3
  br i1 %cmp9.3, label %for.inc14.4.thread47, label %for.inc14.3

for.inc14.3:                                      ; preds = %for.inc14.2, %for.inc14.2.thread39
  %21 = add i64 %indvars.iv, 3
  %arrayidx13.3 = getelementptr inbounds [10 x [10 x i32]]* %Array, i64 0, i64 %indvars.iv, i64 3
  %22 = trunc i64 %21 to i32
  store i32 %22, i32* %arrayidx13.3, align 4, !tbaa !0
  %cmp9.4 = icmp eq i32 %0, 4
  br i1 %cmp9.4, label %for.inc14.5.thread51, label %for.inc14.4

for.inc14.5.thread51:                             ; preds = %for.inc14.3
  %23 = add i64 %indvars.iv, 5
  %arrayidx13.552 = getelementptr inbounds [10 x [10 x i32]]* %Array, i64 0, i64 %indvars.iv, i64 5
  %24 = trunc i64 %23 to i32
  store i32 %24, i32* %arrayidx13.552, align 4, !tbaa !0
  br label %for.inc14.6.thread55

for.inc14.4.thread47:                             ; preds = %for.inc14.3.thread43, %for.inc14.2
  %25 = add i64 %indvars.iv, 4
  %arrayidx13.448 = getelementptr inbounds [10 x [10 x i32]]* %Array, i64 0, i64 %indvars.iv, i64 4
  %26 = trunc i64 %25 to i32
  store i32 %26, i32* %arrayidx13.448, align 8, !tbaa !0
  br label %for.inc14.5

for.inc14.4:                                      ; preds = %for.inc14.3
  %27 = add i64 %indvars.iv, 4
  %arrayidx13.4 = getelementptr inbounds [10 x [10 x i32]]* %Array, i64 0, i64 %indvars.iv, i64 4
  %28 = trunc i64 %27 to i32
  store i32 %28, i32* %arrayidx13.4, align 8, !tbaa !0
  %cmp9.5 = icmp eq i32 %0, 5
  br i1 %cmp9.5, label %for.inc14.6.thread55, label %for.inc14.5

for.inc14.5:                                      ; preds = %for.inc14.4, %for.inc14.4.thread47
  %29 = add i64 %indvars.iv, 5
  %arrayidx13.5 = getelementptr inbounds [10 x [10 x i32]]* %Array, i64 0, i64 %indvars.iv, i64 5
  %30 = trunc i64 %29 to i32
  store i32 %30, i32* %arrayidx13.5, align 4, !tbaa !0
  %cmp9.6 = icmp eq i32 %0, 6
  br i1 %cmp9.6, label %for.inc14.7.thread59, label %for.inc14.6

for.inc14.7.thread59:                             ; preds = %for.inc14.5
  %31 = add i64 %indvars.iv, 7
  %arrayidx13.760 = getelementptr inbounds [10 x [10 x i32]]* %Array, i64 0, i64 %indvars.iv, i64 7
  %32 = trunc i64 %31 to i32
  store i32 %32, i32* %arrayidx13.760, align 4, !tbaa !0
  br label %for.inc14.8.thread63

for.inc14.6.thread55:                             ; preds = %for.inc14.5.thread51, %for.inc14.4
  %33 = add i64 %indvars.iv, 6
  %arrayidx13.656 = getelementptr inbounds [10 x [10 x i32]]* %Array, i64 0, i64 %indvars.iv, i64 6
  %34 = trunc i64 %33 to i32
  store i32 %34, i32* %arrayidx13.656, align 8, !tbaa !0
  br label %for.inc14.7

for.inc14.6:                                      ; preds = %for.inc14.5
  %35 = add i64 %indvars.iv, 6
  %arrayidx13.6 = getelementptr inbounds [10 x [10 x i32]]* %Array, i64 0, i64 %indvars.iv, i64 6
  %36 = trunc i64 %35 to i32
  store i32 %36, i32* %arrayidx13.6, align 8, !tbaa !0
  %cmp9.7 = icmp eq i32 %0, 7
  br i1 %cmp9.7, label %for.inc14.8.thread63, label %for.inc14.7

for.inc14.7:                                      ; preds = %for.inc14.6, %for.inc14.6.thread55
  %37 = add i64 %indvars.iv, 7
  %arrayidx13.7 = getelementptr inbounds [10 x [10 x i32]]* %Array, i64 0, i64 %indvars.iv, i64 7
  %38 = trunc i64 %37 to i32
  store i32 %38, i32* %arrayidx13.7, align 4, !tbaa !0
  %cmp9.8 = icmp eq i32 %0, 8
  br i1 %cmp9.8, label %if.then.9, label %for.inc14.8

for.inc14.8.thread63:                             ; preds = %for.inc14.7.thread59, %for.inc14.6
  %39 = add i64 %indvars.iv, 8
  %arrayidx13.864 = getelementptr inbounds [10 x [10 x i32]]* %Array, i64 0, i64 %indvars.iv, i64 8
  %40 = trunc i64 %39 to i32
  store i32 %40, i32* %arrayidx13.864, align 8, !tbaa !0
  br label %if.then.9

for.inc14.8:                                      ; preds = %for.inc14.7
  %41 = add i64 %indvars.iv, 8
  %arrayidx13.8 = getelementptr inbounds [10 x [10 x i32]]* %Array, i64 0, i64 %indvars.iv, i64 8
  %42 = trunc i64 %41 to i32
  store i32 %42, i32* %arrayidx13.8, align 8, !tbaa !0
  %cmp9.9 = icmp eq i32 %0, 9
  br i1 %cmp9.9, label %for.inc14.9, label %if.then.9

if.then.9:                                        ; preds = %for.inc14.7, %for.inc14.8.thread63, %for.inc14.8
  %43 = add i64 %indvars.iv, 9
  %arrayidx13.9 = getelementptr inbounds [10 x [10 x i32]]* %Array, i64 0, i64 %indvars.iv, i64 9
  %44 = trunc i64 %43 to i32
  store i32 %44, i32* %arrayidx13.9, align 4, !tbaa !0
  br label %for.inc14.9

for.inc14.9:                                      ; preds = %if.then.9, %for.inc14.8
  %indvars.iv.next = add i64 %indvars.iv, 1
  %lftr.wideiv27 = trunc i64 %indvars.iv.next to i32
  %exitcond28 = icmp eq i32 %lftr.wideiv27, 10
  br i1 %exitcond28, label %for.body3.lr.ph.us.i, label %for.cond6.preheader
}

declare i32 @printf(i8* nocapture, ...) nounwind

!0 = metadata !{metadata !"int", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
