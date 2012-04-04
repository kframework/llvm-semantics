; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/mode-dependent-address.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@main.correct = private unnamed_addr constant [96 x i32] [i32 0, i32 1, i32 2, i32 3, i32 0, i32 1, i32 2, i32 3, i32 8, i32 9, i32 10, i32 11, i32 8, i32 9, i32 10, i32 11, i32 16, i32 17, i32 18, i32 19, i32 16, i32 17, i32 18, i32 19, i32 24, i32 25, i32 26, i32 27, i32 24, i32 25, i32 26, i32 27, i32 32, i32 33, i32 34, i32 35, i32 32, i32 33, i32 34, i32 35, i32 40, i32 41, i32 42, i32 43, i32 40, i32 41, i32 42, i32 43, i32 48, i32 49, i32 50, i32 51, i32 48, i32 49, i32 50, i32 51, i32 56, i32 57, i32 58, i32 59, i32 56, i32 57, i32 58, i32 59, i32 64, i32 65, i32 66, i32 67, i32 64, i32 65, i32 66, i32 67, i32 72, i32 73, i32 74, i32 75, i32 72, i32 73, i32 74, i32 75, i32 80, i32 81, i32 82, i32 83, i32 80, i32 81, i32 82, i32 83, i32 88, i32 89, i32 90, i32 91, i32 88, i32 89, i32 90, i32 91], align 16
@arg4 = common global [96 x i8] zeroinitializer, align 16
@arg1 = common global [96 x i16] zeroinitializer, align 16
@arg2 = common global [96 x i32] zeroinitializer, align 16
@arg3 = common global [96 x i64] zeroinitializer, align 16
@result = common global [96 x i8] zeroinitializer, align 16

define void @f883b(i8* nocapture %result, i16* noalias nocapture %arg1, i32* noalias nocapture %arg2, i64* noalias nocapture %arg3, i8* noalias nocapture %arg4) nounwind uwtable {
entry:
  br label %for.body

for.body:                                         ; preds = %for.body, %entry
  %indvars.iv = phi i64 [ 0, %entry ], [ %indvars.iv.next, %for.body ]
  %arrayidx = getelementptr inbounds i16* %arg1, i64 %indvars.iv
  %0 = load i16* %arrayidx, align 2, !tbaa !0
  %cmp1 = icmp sgt i16 %0, 1
  %conv = sext i16 %0 to i32
  %.conv = select i1 %cmp1, i32 1, i32 %conv
  %arrayidx7 = getelementptr inbounds i32* %arg2, i64 %indvars.iv
  %1 = load i32* %arrayidx7, align 4, !tbaa !3
  %and = and i32 %1, 31
  %shr = ashr i32 %.conv, %and
  %xor = xor i32 %shr, 1
  %sub = add nsw i32 %xor, 32
  %shr816 = lshr i32 %sub, 7
  %or = or i32 %shr816, 251
  %conv917 = zext i32 %or to i64
  %arrayidx11 = getelementptr inbounds i64* %arg3, i64 %indvars.iv
  %2 = load i64* %arrayidx11, align 8, !tbaa !4
  %and12 = and i64 %conv917, %2
  %conv13 = trunc i64 %and12 to i8
  %arrayidx15 = getelementptr inbounds i8* %result, i64 %indvars.iv
  store i8 %conv13, i8* %arrayidx15, align 1, !tbaa !1
  %indvars.iv.next = add i64 %indvars.iv, 1
  %lftr.wideiv = trunc i64 %indvars.iv.next to i32
  %exitcond = icmp eq i32 %lftr.wideiv, 96
  br i1 %exitcond, label %for.end, label %for.body

for.end:                                          ; preds = %for.body
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  br label %for.body

for.body:                                         ; preds = %for.body, %entry
  %indvars.iv26 = phi i64 [ 0, %entry ], [ %indvars.iv.next27, %for.body ]
  %i.025 = phi i32 [ 0, %entry ], [ %inc, %for.body ]
  %conv = trunc i32 %i.025 to i8
  %arrayidx = getelementptr inbounds [96 x i8]* @arg4, i64 0, i64 %indvars.iv26
  store i8 %conv, i8* %arrayidx, align 1, !tbaa !1
  %0 = trunc i32 %i.025 to i16
  %conv1 = and i16 %0, 255
  %arrayidx3 = getelementptr inbounds [96 x i16]* @arg1, i64 0, i64 %indvars.iv26
  store i16 %conv1, i16* %arrayidx3, align 2, !tbaa !0
  %conv424 = zext i16 %conv1 to i32
  %arrayidx6 = getelementptr inbounds [96 x i32]* @arg2, i64 0, i64 %indvars.iv26
  store i32 %conv424, i32* %arrayidx6, align 4, !tbaa !3
  %conv7 = zext i16 %conv1 to i64
  %arrayidx9 = getelementptr inbounds [96 x i64]* @arg3, i64 0, i64 %indvars.iv26
  store i64 %conv7, i64* %arrayidx9, align 8, !tbaa !4
  %indvars.iv.next27 = add i64 %indvars.iv26, 1
  %inc = add nsw i32 %i.025, 1
  %lftr.wideiv28 = trunc i64 %indvars.iv.next27 to i32
  %exitcond29 = icmp eq i32 %lftr.wideiv28, 96
  br i1 %exitcond29, label %for.body.i, label %for.body

for.body.i:                                       ; preds = %for.body, %for.body.i
  %indvars.iv.i = phi i64 [ %indvars.iv.next.i, %for.body.i ], [ 0, %for.body ]
  %arrayidx.i = getelementptr inbounds [96 x i16]* @arg1, i64 0, i64 %indvars.iv.i
  %1 = load i16* %arrayidx.i, align 2, !tbaa !0
  %cmp1.i = icmp sgt i16 %1, 1
  %conv.i = sext i16 %1 to i32
  %.conv.i = select i1 %cmp1.i, i32 1, i32 %conv.i
  %arrayidx7.i = getelementptr inbounds [96 x i32]* @arg2, i64 0, i64 %indvars.iv.i
  %2 = load i32* %arrayidx7.i, align 4, !tbaa !3
  %and.i = and i32 %2, 31
  %shr.i = ashr i32 %.conv.i, %and.i
  %xor.i = xor i32 %shr.i, 1
  %sub.i = add nsw i32 %xor.i, 32
  %shr816.i = lshr i32 %sub.i, 7
  %or.i = or i32 %shr816.i, 251
  %conv917.i = zext i32 %or.i to i64
  %arrayidx11.i = getelementptr inbounds [96 x i64]* @arg3, i64 0, i64 %indvars.iv.i
  %3 = load i64* %arrayidx11.i, align 8, !tbaa !4
  %and12.i = and i64 %conv917.i, %3
  %conv13.i = trunc i64 %and12.i to i8
  %arrayidx15.i = getelementptr inbounds [96 x i8]* @result, i64 0, i64 %indvars.iv.i
  store i8 %conv13.i, i8* %arrayidx15.i, align 1, !tbaa !1
  %indvars.iv.next.i = add i64 %indvars.iv.i, 1
  %lftr.wideiv = trunc i64 %indvars.iv.next.i to i32
  %exitcond = icmp eq i32 %lftr.wideiv, 96
  br i1 %exitcond, label %for.cond10, label %for.body.i

for.cond10:                                       ; preds = %for.body.i, %for.body13
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body13 ], [ 0, %for.body.i ]
  %4 = trunc i64 %indvars.iv to i32
  %cmp11 = icmp slt i32 %4, 96
  br i1 %cmp11, label %for.body13, label %for.end23

for.body13:                                       ; preds = %for.cond10
  %arrayidx15 = getelementptr inbounds [96 x i8]* @result, i64 0, i64 %indvars.iv
  %5 = load i8* %arrayidx15, align 1, !tbaa !1
  %conv16 = sext i8 %5 to i32
  %arrayidx18 = getelementptr inbounds [96 x i32]* @main.correct, i64 0, i64 %indvars.iv
  %6 = load i32* %arrayidx18, align 4, !tbaa !3
  %cmp19 = icmp eq i32 %conv16, %6
  %indvars.iv.next = add i64 %indvars.iv, 1
  br i1 %cmp19, label %for.cond10, label %if.then

if.then:                                          ; preds = %for.body13
  tail call void @abort() noreturn nounwind
  unreachable

for.end23:                                        ; preds = %for.cond10
  ret i32 0
}

declare void @abort() noreturn nounwind

!0 = metadata !{metadata !"short", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
!3 = metadata !{metadata !"int", metadata !1}
!4 = metadata !{metadata !"long", metadata !1}
