; ModuleID = '/home/david/src/c-semantics/tests/llvm-regression/sumarray.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [14 x i8] c"Produced: %d\0A\00", align 1

define i32 @SumArray(i32* nocapture %Array, i32 %Num) nounwind uwtable {
entry:
  %arrayidx = getelementptr inbounds i32* %Array, i64 34
  store i32 1234, i32* %arrayidx, align 4, !tbaa !0
  %cmp2 = icmp eq i32 %Num, 0
  br i1 %cmp2, label %for.end, label %for.body

for.body:                                         ; preds = %entry, %for.body
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body ], [ 0, %entry ]
  %Result.04 = phi i32 [ %add, %for.body ], [ 0, %entry ]
  %arrayidx1 = getelementptr inbounds i32* %Array, i64 %indvars.iv
  %0 = load i32* %arrayidx1, align 4, !tbaa !0
  %add = add i32 %0, %Result.04
  %indvars.iv.next = add i64 %indvars.iv, 1
  %lftr.wideiv = trunc i64 %indvars.iv.next to i32
  %exitcond = icmp eq i32 %lftr.wideiv, %Num
  br i1 %exitcond, label %for.end, label %for.body

for.end:                                          ; preds = %for.body, %entry
  %Result.0.lcssa = phi i32 [ 0, %entry ], [ %add, %for.body ]
  ret i32 %Result.0.lcssa
}

define i32 @main() nounwind uwtable {
entry:
  %call = tail call noalias i8* @malloc(i64 400) nounwind
  %0 = bitcast i8* %call to i32*
  br label %for.body

for.body:                                         ; preds = %entry, %for.body
  %indvars.iv15 = phi i64 [ 0, %entry ], [ %indvars.iv.next16, %for.body ]
  %1 = shl nsw i64 %indvars.iv15, 2
  %arrayidx = getelementptr inbounds i32* %0, i64 %indvars.iv15
  %2 = trunc i64 %1 to i32
  store i32 %2, i32* %arrayidx, align 4, !tbaa !0
  %indvars.iv.next16 = add i64 %indvars.iv15, 2
  %3 = trunc i64 %indvars.iv.next16 to i32
  %cmp = icmp slt i32 %3, 100
  br i1 %cmp, label %for.body, label %for.body3

for.body3:                                        ; preds = %for.body, %for.body3
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body3 ], [ 1, %for.body ]
  %4 = shl nsw i64 %indvars.iv, 1
  %arrayidx6 = getelementptr inbounds i32* %0, i64 %indvars.iv
  %5 = trunc i64 %4 to i32
  store i32 %5, i32* %arrayidx6, align 4, !tbaa !0
  %indvars.iv.next = add i64 %indvars.iv, 2
  %6 = trunc i64 %indvars.iv.next to i32
  %cmp2 = icmp slt i32 %6, 100
  br i1 %cmp2, label %for.body3, label %for.end9

for.end9:                                         ; preds = %for.body3
  %arrayidx.i = getelementptr inbounds i8* %call, i64 136
  %7 = bitcast i8* %arrayidx.i to i32*
  store i32 1234, i32* %7, align 4, !tbaa !0
  br label %for.body.i

for.body.i:                                       ; preds = %for.body.i, %for.end9
  %indvars.iv.i = phi i64 [ %indvars.iv.next.i, %for.body.i ], [ 0, %for.end9 ]
  %Result.04.i = phi i32 [ %add.i, %for.body.i ], [ 0, %for.end9 ]
  %arrayidx1.i = getelementptr inbounds i32* %0, i64 %indvars.iv.i
  %8 = load i32* %arrayidx1.i, align 4, !tbaa !0
  %add.i = add i32 %8, %Result.04.i
  %indvars.iv.next.i = add i64 %indvars.iv.i, 1
  %lftr.wideiv = trunc i64 %indvars.iv.next.i to i32
  %exitcond = icmp eq i32 %lftr.wideiv, 100
  br i1 %exitcond, label %SumArray.exit, label %for.body.i

SumArray.exit:                                    ; preds = %for.body.i
  %call11 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([14 x i8]* @.str, i64 0, i64 0), i32 %add.i) nounwind
  ret i32 0
}

declare noalias i8* @malloc(i64) nounwind

declare i32 @printf(i8* nocapture, ...) nounwind

!0 = metadata !{metadata !"int", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
