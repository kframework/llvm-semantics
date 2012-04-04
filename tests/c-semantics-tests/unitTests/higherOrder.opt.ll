; ModuleID = '/home/david/src/c-semantics/tests/unitTests/higherOrder.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [3 x i8] c"%d\00", align 1

define i32 @main() nounwind uwtable {
entry:
  %call1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str, i64 0, i64 0), i32 15) nounwind
  ret i32 0
}

define i32 @fold(i32* nocapture %arr, i32 %length, i32 %start, i32 (i32, i32)* nocapture %f) nounwind uwtable {
entry:
  %cmp1 = icmp sgt i32 %length, 0
  br i1 %cmp1, label %for.body, label %for.end

for.body:                                         ; preds = %entry, %for.body
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body ], [ 0, %entry ]
  %res.02 = phi i32 [ %call, %for.body ], [ %start, %entry ]
  %add.ptr = getelementptr inbounds i32* %arr, i64 %indvars.iv
  %0 = load i32* %add.ptr, align 4, !tbaa !0
  %call = tail call i32 %f(i32 %res.02, i32 %0) nounwind
  %indvars.iv.next = add i64 %indvars.iv, 1
  %lftr.wideiv = trunc i64 %indvars.iv.next to i32
  %exitcond = icmp eq i32 %lftr.wideiv, %length
  br i1 %exitcond, label %for.end, label %for.body

for.end:                                          ; preds = %for.body, %entry
  %res.0.lcssa = phi i32 [ %start, %entry ], [ %call, %for.body ]
  ret i32 %res.0.lcssa
}

define i32 @sum(i32 %x, i32 %y) nounwind uwtable readnone {
entry:
  %add = add nsw i32 %y, %x
  ret i32 %add
}

declare i32 @printf(i8* nocapture, ...) nounwind

!0 = metadata !{metadata !"int", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
