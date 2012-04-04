; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/loop-13.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define void @scale(i64* nocapture %alpha, i64* nocapture %x, i32 %n) nounwind uwtable {
entry:
  %0 = load i64* %alpha, align 8, !tbaa !0
  %cmp = icmp ne i64 %0, 1
  %cmp112 = icmp sgt i32 %n, 0
  %or.cond = and i1 %cmp, %cmp112
  br i1 %or.cond, label %for.body, label %if.end

for.body:                                         ; preds = %entry, %for.body.for.body_crit_edge
  %1 = phi i64 [ %.pre, %for.body.for.body_crit_edge ], [ %0, %entry ]
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body.for.body_crit_edge ], [ 0, %entry ]
  %i.013 = phi i32 [ %phitmp, %for.body.for.body_crit_edge ], [ 1, %entry ]
  %arrayidx = getelementptr inbounds i64* %x, i64 %indvars.iv
  %2 = load i64* %arrayidx, align 8, !tbaa !0
  %mul = mul nsw i64 %2, %1
  %3 = or i64 %indvars.iv, 1
  %arrayidx3 = getelementptr inbounds i64* %x, i64 %3
  %4 = load i64* %arrayidx3, align 8, !tbaa !0
  %mul4 = mul nsw i64 %4, %1
  store i64 %mul, i64* %arrayidx, align 8, !tbaa !0
  store i64 %mul4, i64* %arrayidx3, align 8, !tbaa !0
  %exitcond = icmp eq i32 %i.013, %n
  br i1 %exitcond, label %if.end, label %for.body.for.body_crit_edge

for.body.for.body_crit_edge:                      ; preds = %for.body
  %indvars.iv.next = add i64 %indvars.iv, 2
  %.pre = load i64* %alpha, align 8, !tbaa !0
  %phitmp = add i32 %i.013, 1
  br label %for.body

if.end:                                           ; preds = %entry, %for.body
  ret void
}

define i32 @main() nounwind uwtable {
if.end:
  ret i32 0
}

!0 = metadata !{metadata !"long", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
