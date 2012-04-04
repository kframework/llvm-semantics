; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/loop-ivopts-2.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define void @check(i32* nocapture %l) nounwind uwtable {
entry:
  br label %for.cond

for.cond:                                         ; preds = %lor.end, %entry
  %indvars.iv = phi i64 [ %indvars.iv.next, %lor.end ], [ 0, %entry ]
  %0 = trunc i64 %indvars.iv to i32
  %cmp = icmp slt i32 %0, 288
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds i32* %l, i64 %indvars.iv
  %1 = load i32* %arrayidx, align 4, !tbaa !0
  %cmp1 = icmp slt i32 %0, 256
  br i1 %cmp1, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %for.body
  %cmp2 = icmp sgt i32 %0, 279
  %phitmp = select i1 %cmp2, i32 8, i32 7
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %for.body
  %2 = phi i32 [ 8, %for.body ], [ %phitmp, %lor.rhs ]
  %3 = add i64 %indvars.iv, 4294967152
  %4 = trunc i64 %3 to i32
  %5 = icmp ult i32 %4, 112
  %land.ext = zext i1 %5 to i32
  %add5 = add nsw i32 %2, %land.ext
  %cmp6 = icmp eq i32 %1, %add5
  %indvars.iv.next = add i64 %indvars.iv, 1
  br i1 %cmp6, label %for.cond, label %if.then

if.then:                                          ; preds = %lor.end
  tail call void @abort() noreturn nounwind
  unreachable

for.end:                                          ; preds = %for.cond
  ret void
}

declare void @abort() noreturn nounwind

define i32 @main() nounwind uwtable {
entry:
  %l = alloca [288 x i32], align 16
  br label %for.body

for.body:                                         ; preds = %for.body, %entry
  %indvars.iv45 = phi i64 [ 0, %entry ], [ %indvars.iv.next46, %for.body ]
  %arrayidx = getelementptr inbounds [288 x i32]* %l, i64 0, i64 %indvars.iv45
  store i32 8, i32* %arrayidx, align 4, !tbaa !0
  %indvars.iv.next46 = add i64 %indvars.iv45, 1
  %lftr.wideiv47 = trunc i64 %indvars.iv.next46 to i32
  %exitcond48 = icmp eq i32 %lftr.wideiv47, 144
  br i1 %exitcond48, label %for.body3, label %for.body

for.body3:                                        ; preds = %for.body, %for.body3
  %indvars.iv39 = phi i64 [ %indvars.iv.next40, %for.body3 ], [ 144, %for.body ]
  %arrayidx5 = getelementptr inbounds [288 x i32]* %l, i64 0, i64 %indvars.iv39
  store i32 9, i32* %arrayidx5, align 4, !tbaa !0
  %indvars.iv.next40 = add i64 %indvars.iv39, 1
  %lftr.wideiv43 = trunc i64 %indvars.iv.next40 to i32
  %exitcond44 = icmp eq i32 %lftr.wideiv43, 256
  br i1 %exitcond44, label %for.body11, label %for.body3

for.body11:                                       ; preds = %for.body3, %for.body11
  %indvars.iv33 = phi i64 [ %indvars.iv.next34, %for.body11 ], [ 256, %for.body3 ]
  %arrayidx13 = getelementptr inbounds [288 x i32]* %l, i64 0, i64 %indvars.iv33
  store i32 7, i32* %arrayidx13, align 4, !tbaa !0
  %indvars.iv.next34 = add i64 %indvars.iv33, 1
  %lftr.wideiv35 = trunc i64 %indvars.iv.next34 to i32
  %exitcond36 = icmp eq i32 %lftr.wideiv35, 280
  br i1 %exitcond36, label %for.body19, label %for.body11

for.body19:                                       ; preds = %for.body11, %for.body19
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body19 ], [ 280, %for.body11 ]
  %arrayidx21 = getelementptr inbounds [288 x i32]* %l, i64 0, i64 %indvars.iv
  store i32 8, i32* %arrayidx21, align 4, !tbaa !0
  %indvars.iv.next = add i64 %indvars.iv, 1
  %lftr.wideiv = trunc i64 %indvars.iv.next to i32
  %exitcond = icmp eq i32 %lftr.wideiv, 288
  br i1 %exitcond, label %for.cond.i, label %for.body19

for.cond.i:                                       ; preds = %for.body19, %lor.end.i
  %indvars.iv.i = phi i64 [ %indvars.iv.next.i, %lor.end.i ], [ 0, %for.body19 ]
  %0 = trunc i64 %indvars.iv.i to i32
  %cmp.i = icmp slt i32 %0, 288
  br i1 %cmp.i, label %for.body.i, label %check.exit

for.body.i:                                       ; preds = %for.cond.i
  %arrayidx.i = getelementptr inbounds [288 x i32]* %l, i64 0, i64 %indvars.iv.i
  %1 = load i32* %arrayidx.i, align 4, !tbaa !0
  %cmp1.i = icmp slt i32 %0, 256
  br i1 %cmp1.i, label %lor.end.i, label %lor.rhs.i

lor.rhs.i:                                        ; preds = %for.body.i
  %cmp2.i = icmp sgt i32 %0, 279
  %phitmp.i = select i1 %cmp2.i, i32 8, i32 7
  br label %lor.end.i

lor.end.i:                                        ; preds = %lor.rhs.i, %for.body.i
  %2 = phi i32 [ 8, %for.body.i ], [ %phitmp.i, %lor.rhs.i ]
  %3 = add i64 %indvars.iv.i, 4294967152
  %4 = trunc i64 %3 to i32
  %5 = icmp ult i32 %4, 112
  %land.ext.i = zext i1 %5 to i32
  %add5.i = add nsw i32 %2, %land.ext.i
  %cmp6.i = icmp eq i32 %1, %add5.i
  %indvars.iv.next.i = add i64 %indvars.iv.i, 1
  br i1 %cmp6.i, label %for.cond.i, label %if.then.i

if.then.i:                                        ; preds = %lor.end.i
  call void @abort() noreturn nounwind
  unreachable

check.exit:                                       ; preds = %for.cond.i
  ret i32 0
}

!0 = metadata !{metadata !"int", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
