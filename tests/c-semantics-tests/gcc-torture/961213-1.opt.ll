; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/961213-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @g(i64* nocapture %v, i32 %n, i32* nocapture %a, i32 %b) nounwind uwtable {
entry:
  store i64 0, i64* %v, align 8, !tbaa !0
  %cmp2 = icmp sgt i32 %n, 0
  br i1 %cmp2, label %for.body.lr.ph, label %for.end

for.body.lr.ph:                                   ; preds = %entry
  %conv = sext i32 %b to i64
  br label %for.body

for.body:                                         ; preds = %for.body, %for.body.lr.ph
  %indvars.iv = phi i64 [ 0, %for.body.lr.ph ], [ %indvars.iv.next, %for.body ]
  %0 = phi i64 [ 0, %for.body.lr.ph ], [ %add, %for.body ]
  %mul = mul i64 %0, %conv
  %arrayidx = getelementptr inbounds i32* %a, i64 %indvars.iv
  %1 = load i32* %arrayidx, align 4, !tbaa !3
  %conv1 = zext i32 %1 to i64
  %add = add i64 %conv1, %mul
  %indvars.iv.next = add i64 %indvars.iv, 1
  %lftr.wideiv = trunc i64 %indvars.iv.next to i32
  %exitcond = icmp eq i32 %lftr.wideiv, %n
  br i1 %exitcond, label %for.cond.for.end_crit_edge, label %for.body

for.cond.for.end_crit_edge:                       ; preds = %for.body
  store i64 %add, i64* %v, align 8
  br label %for.end

for.end:                                          ; preds = %for.cond.for.end_crit_edge, %entry
  ret i32 %n
}

define i32 @main() noreturn nounwind uwtable {
if.end:
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn nounwind

!0 = metadata !{metadata !"long long", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
!3 = metadata !{metadata !"int", metadata !1}
