; ModuleID = '/home/david/src/c-semantics/tests/unitTests/multWithBreak.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@main.arr1 = private unnamed_addr constant [6 x i32] [i32 1, i32 2, i32 3, i32 0, i32 4, i32 5], align 16

define i32 @main() nounwind uwtable readnone {
entry:
  br label %for.cond

for.cond:                                         ; preds = %for.body, %entry
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body ], [ 0, %entry ]
  %product1.0 = phi i32 [ %mul, %for.body ], [ 1, %entry ]
  %0 = trunc i64 %indvars.iv to i32
  %cmp = icmp slt i32 %0, 6
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds [6 x i32]* @main.arr1, i64 0, i64 %indvars.iv
  %1 = load i32* %arrayidx, align 4, !tbaa !0
  %mul = mul nsw i32 %1, %product1.0
  %cmp1 = icmp eq i32 %mul, 0
  %indvars.iv.next = add i64 %indvars.iv, 1
  br i1 %cmp1, label %for.end, label %for.cond

for.end:                                          ; preds = %for.body, %for.cond
  %product1.1 = phi i32 [ 0, %for.body ], [ %product1.0, %for.cond ]
  %add = add nsw i32 %product1.1, 120
  ret i32 %add
}

!0 = metadata !{metadata !"int", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
