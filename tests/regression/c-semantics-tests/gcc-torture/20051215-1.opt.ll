; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20051215-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @foo(i32 %x, i32 %y, i32* %z) nounwind uwtable readonly noinline {
entry:
  %cmp10 = icmp sgt i32 %y, 0
  br i1 %cmp10, label %for.body.lr.ph, label %for.end6

for.body.lr.ph:                                   ; preds = %entry
  %tobool = icmp eq i32* %z, null
  %cmp27 = icmp sgt i32 %x, 0
  br i1 %tobool, label %for.body.lr.ph.split.us, label %for.body.lr.ph.for.body.lr.ph.split_crit_edge

for.body.lr.ph.for.body.lr.ph.split_crit_edge:    ; preds = %for.body.lr.ph
  br i1 %cmp27, label %for.inc4.us19, label %for.inc4

for.body.lr.ph.split.us:                          ; preds = %for.body.lr.ph
  br i1 %cmp27, label %for.inc4.us.us, label %for.inc4.us

for.inc4.us.us:                                   ; preds = %for.body.lr.ph.split.us, %for.inc4.us.us
  %d.013.us.us = phi i32 [ %inc5.us.us, %for.inc4.us.us ], [ 0, %for.body.lr.ph.split.us ]
  %inc5.us.us = add nsw i32 %d.013.us.us, 1
  %exitcond = icmp eq i32 %inc5.us.us, %y
  br i1 %exitcond, label %for.end6, label %for.inc4.us.us

for.inc4.us:                                      ; preds = %for.inc4.us, %for.body.lr.ph.split.us
  %d.013.us = phi i32 [ %inc5.us, %for.inc4.us ], [ 0, %for.body.lr.ph.split.us ]
  %inc5.us = add nsw i32 %d.013.us, 1
  %exitcond38 = icmp eq i32 %inc5.us, %y
  br i1 %exitcond38, label %for.end6, label %for.inc4.us

for.inc4.us19:                                    ; preds = %for.body.lr.ph.for.body.lr.ph.split_crit_edge, %for.inc4.us19
  %d.013.us16 = phi i32 [ %inc5.us21, %for.inc4.us19 ], [ 0, %for.body.lr.ph.for.body.lr.ph.split_crit_edge ]
  %a.011.us18 = phi i32 [ %2, %for.inc4.us19 ], [ 0, %for.body.lr.ph.for.body.lr.ph.split_crit_edge ]
  %0 = load i32* %z, align 4, !tbaa !0
  %mul.us26 = mul nsw i32 %0, %d.013.us16
  %1 = mul i32 %mul.us26, %x
  %2 = add i32 %a.011.us18, %1
  %inc5.us21 = add nsw i32 %d.013.us16, 1
  %exitcond37 = icmp eq i32 %inc5.us21, %y
  br i1 %exitcond37, label %for.end6, label %for.inc4.us19

for.inc4:                                         ; preds = %for.inc4, %for.body.lr.ph.for.body.lr.ph.split_crit_edge
  %d.013 = phi i32 [ %inc5, %for.inc4 ], [ 0, %for.body.lr.ph.for.body.lr.ph.split_crit_edge ]
  %inc5 = add nsw i32 %d.013, 1
  %exitcond39 = icmp eq i32 %inc5, %y
  br i1 %exitcond39, label %for.end6, label %for.inc4

for.end6:                                         ; preds = %for.inc4.us, %for.inc4.us.us, %for.inc4, %for.inc4.us19, %entry
  %a.0.lcssa = phi i32 [ 0, %entry ], [ 0, %for.inc4.us ], [ 0, %for.inc4.us.us ], [ %2, %for.inc4.us19 ], [ 0, %for.inc4 ]
  ret i32 %a.0.lcssa
}

define i32 @main() nounwind uwtable {
entry:
  %call = tail call i32 @foo(i32 3, i32 2, i32* null)
  %cmp = icmp eq i32 %call, 0
  br i1 %cmp, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret i32 0
}

declare void @abort() noreturn nounwind

!0 = metadata !{metadata !"int", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
