; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/pr24716.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@Link = global [1 x i32] [i32 -1], align 4
@W = global [1 x i32] [i32 2], align 4

define i32 @f(i32 %k, i32 %p) nounwind uwtable {
entry:
  br label %for.cond

for.cond:                                         ; preds = %do.cond35, %entry
  %j.0 = phi i32 [ 0, %entry ], [ 1, %do.cond35 ]
  %pdest.0 = phi i32 [ 0, %entry ], [ %pdest.8.ph, %do.cond35 ]
  %p.addr.0 = phi i32 [ %p, %entry ], [ %p.addr.1.ph, %do.cond35 ]
  %k.addr.0 = phi i32 [ %k, %entry ], [ -1, %do.cond35 ]
  %cmp = icmp sgt i32 %pdest.0, 2
  br i1 %cmp, label %do.body.preheader, label %if.end

do.body.preheader:                                ; preds = %for.cond
  %0 = add i32 %j.0, 1
  %1 = add i32 %0, %pdest.0
  %2 = sub i32 0, %j.0
  %3 = icmp sgt i32 %2, -3
  %smax = select i1 %3, i32 %2, i32 -3
  %4 = add i32 %1, %smax
  %5 = xor i32 %smax, -1
  br label %if.end

if.end:                                           ; preds = %do.body.preheader, %for.cond
  %j.2 = phi i32 [ %j.0, %for.cond ], [ %5, %do.body.preheader ]
  %pdest.2 = phi i32 [ %pdest.0, %for.cond ], [ %4, %do.body.preheader ]
  %cmp2 = icmp eq i32 %j.2, 1
  br i1 %cmp2, label %for.end, label %while.cond.preheader

while.cond.preheader:                             ; preds = %if.end
  %cmp538 = icmp sgt i32 %pdest.2, %p.addr.0
  br i1 %cmp538, label %while.body.lr.ph, label %do.body10.loopexit

while.body.lr.ph:                                 ; preds = %while.cond.preheader
  %cmp6 = icmp eq i32 %j.2, %p.addr.0
  %inc8 = zext i1 %cmp6 to i32
  br label %while.body

while.body:                                       ; preds = %while.body.lr.ph, %while.body
  %pdest.339 = phi i32 [ %pdest.2, %while.body.lr.ph ], [ %inc8.pdest.3, %while.body ]
  %inc8.pdest.3 = add nsw i32 %pdest.339, %inc8
  %cmp5 = icmp sgt i32 %inc8.pdest.3, %p.addr.0
  br i1 %cmp5, label %while.body, label %do.body10.loopexit

do.body10.loopexit:                               ; preds = %while.body, %while.cond.preheader
  %pdest.3.lcssa = phi i32 [ %pdest.2, %while.cond.preheader ], [ %inc8.pdest.3, %while.body ]
  %idxprom = sext i32 %k.addr.0 to i64
  %arrayidx = getelementptr inbounds [1 x i32]* @W, i64 0, i64 %idxprom
  %cmp18 = icmp slt i32 %p.addr.0, 1
  %cmp21 = icmp sgt i32 %k.addr.0, 0
  %6 = load i32* %arrayidx, align 4, !tbaa !0
  br i1 %cmp18, label %do.body10.loopexit.split.us, label %do.body10.loopexit.do.body10.loopexit.split_crit_edge

do.body10.loopexit.do.body10.loopexit.split_crit_edge: ; preds = %do.body10.loopexit
  br i1 %cmp21, label %do.body10.do.body10.split_crit_edge.us72, label %do.body10.do.body10.split_crit_edge

do.body10.loopexit.split.us:                      ; preds = %do.body10.loopexit
  %phitmp.us.us = icmp eq i32 %6, 0
  br i1 %cmp21, label %do.body11.us.us.us, label %do.body11.us.us

do.body11.us.us.us:                               ; preds = %do.body10.loopexit.split.us, %do.body11.us.us.us, %if.then13.us.us.us
  %D1361.0.us.us.us = phi i1 [ true, %if.then13.us.us.us ], [ true, %do.body11.us.us.us ], [ %phitmp.us.us, %do.body10.loopexit.split.us ]
  br i1 %D1361.0.us.us.us, label %do.body11.us.us.us, label %if.then13.us.us.us

if.then13.us.us.us:                               ; preds = %do.body11.us.us.us
  store i32 0, i32* %arrayidx, align 4, !tbaa !0
  br label %do.body11.us.us.us

do.body11.us.us:                                  ; preds = %do.body10.loopexit.split.us, %do.body11.us.us, %if.then13.us.us
  %D1361.0.us.us = phi i1 [ true, %if.then13.us.us ], [ true, %do.body11.us.us ], [ %phitmp.us.us, %do.body10.loopexit.split.us ]
  br i1 %D1361.0.us.us, label %do.body11.us.us, label %if.then13.us.us

if.then13.us.us:                                  ; preds = %do.body11.us.us
  store i32 0, i32* %arrayidx, align 4, !tbaa !0
  br label %do.body11.us.us

if.then13.us56:                                   ; preds = %do.body10.do.body10.split_crit_edge.us72
  store i32 0, i32* %arrayidx, align 4, !tbaa !0
  br label %do.body10.do.body10.split_crit_edge.us72

do.body10.do.body10.split_crit_edge.us72:         ; preds = %do.body10.loopexit.do.body10.loopexit.split_crit_edge, %if.then13.us56, %do.body10.do.body10.split_crit_edge.us72
  %7 = phi i32 [ 0, %do.body10.do.body10.split_crit_edge.us72 ], [ 0, %if.then13.us56 ], [ %6, %do.body10.loopexit.do.body10.loopexit.split_crit_edge ]
  %phitmp.us51 = icmp eq i32 %7, 0
  br i1 %phitmp.us51, label %do.body10.do.body10.split_crit_edge.us72, label %if.then13.us56

do.body10.do.body10.split_crit_edge:              ; preds = %do.body10.loopexit.do.body10.loopexit.split_crit_edge
  %phitmp = icmp eq i32 %6, 0
  br i1 %phitmp, label %do.body23, label %if.then13

if.then13:                                        ; preds = %do.body10.do.body10.split_crit_edge
  store i32 0, i32* %arrayidx, align 4, !tbaa !0
  br label %do.body23

do.body23:                                        ; preds = %do.body10.do.body10.split_crit_edge, %if.then13, %do.cond35
  %pdest.7 = phi i32 [ %pdest.8.ph, %do.cond35 ], [ 1, %if.then13 ], [ %pdest.3.lcssa, %do.body10.do.body10.split_crit_edge ]
  %k.addr.1 = phi i32 [ %8, %do.cond35 ], [ %k.addr.0, %if.then13 ], [ %k.addr.0, %do.body10.do.body10.split_crit_edge ]
  %idxprom24 = sext i32 %k.addr.1 to i64
  %arrayidx25 = getelementptr inbounds [1 x i32]* @Link, i64 0, i64 %idxprom24
  %8 = load i32* %arrayidx25, align 4, !tbaa !0
  %cmp29 = icmp ne i32 %8, -1
  br label %while.cond26.outer

while.cond26.outer:                               ; preds = %if.then30, %do.body23
  %pdest.8.ph = phi i32 [ %pdest.7, %do.body23 ], [ %inc31, %if.then30 ]
  %p.addr.1.ph = phi i32 [ 0, %do.body23 ], [ %inc32, %if.then30 ]
  %cmp27 = icmp slt i32 %p.addr.1.ph, %j.2
  br i1 %cmp27, label %while.cond26.outer.split.us, label %do.cond35

while.cond26.outer.split.us:                      ; preds = %while.cond26.outer
  br i1 %cmp29, label %if.then30, label %while.body28.us

while.body28.us:                                  ; preds = %while.body28.us, %while.cond26.outer.split.us
  br label %while.body28.us

if.then30:                                        ; preds = %while.cond26.outer.split.us
  %inc31 = add nsw i32 %pdest.8.ph, 1
  %inc32 = add nsw i32 %p.addr.1.ph, 1
  br label %while.cond26.outer

do.cond35:                                        ; preds = %while.cond26.outer
  br i1 %cmp29, label %do.body23, label %for.cond

for.end:                                          ; preds = %if.end
  ret i32 %pdest.2
}

define i32 @main() nounwind uwtable {
entry:
  br label %for.cond.i

for.cond.i:                                       ; preds = %while.cond26.outer.i, %do.cond35.i, %entry
  %j.0.i = phi i32 [ 0, %entry ], [ 1, %do.cond35.i ], [ 1, %while.cond26.outer.i ]
  %pdest.0.i = phi i32 [ 0, %entry ], [ %pdest.8.ph.i.us, %do.cond35.i ], [ %pdest.7.i, %while.cond26.outer.i ]
  %p.addr.0.i = phi i32 [ 2, %entry ], [ %p.addr.1.ph.i.us, %do.cond35.i ], [ 0, %while.cond26.outer.i ]
  %k.addr.0.i = phi i32 [ 0, %entry ], [ -1, %do.cond35.i ], [ -1, %while.cond26.outer.i ]
  %cmp.i = icmp sgt i32 %pdest.0.i, 2
  br i1 %cmp.i, label %do.body.preheader.i, label %if.end.i

do.body.preheader.i:                              ; preds = %for.cond.i
  %0 = sub i32 0, %j.0.i
  %1 = icmp sgt i32 %0, -3
  %smax.i = select i1 %1, i32 %0, i32 -3
  %2 = add i32 %j.0.i, 1
  %3 = add i32 %2, %pdest.0.i
  %4 = add i32 %3, %smax.i
  %5 = xor i32 %smax.i, -1
  br label %if.end.i

if.end.i:                                         ; preds = %do.body.preheader.i, %for.cond.i
  %j.2.i = phi i32 [ %j.0.i, %for.cond.i ], [ %5, %do.body.preheader.i ]
  %pdest.2.i = phi i32 [ %pdest.0.i, %for.cond.i ], [ %4, %do.body.preheader.i ]
  %cmp2.i = icmp eq i32 %j.2.i, 1
  br i1 %cmp2.i, label %f.exit, label %while.cond.preheader.i

while.cond.preheader.i:                           ; preds = %if.end.i
  %cmp538.i = icmp sgt i32 %pdest.2.i, %p.addr.0.i
  br i1 %cmp538.i, label %while.body.lr.ph.i, label %do.body10.loopexit.i

while.body.lr.ph.i:                               ; preds = %while.cond.preheader.i
  %cmp6.i = icmp eq i32 %j.2.i, %p.addr.0.i
  %inc8.i = zext i1 %cmp6.i to i32
  br label %while.body.i

while.body.i:                                     ; preds = %while.body.i, %while.body.lr.ph.i
  %pdest.339.i = phi i32 [ %pdest.2.i, %while.body.lr.ph.i ], [ %inc8.pdest.3.i, %while.body.i ]
  %inc8.pdest.3.i = add nsw i32 %pdest.339.i, %inc8.i
  %cmp5.i = icmp sgt i32 %inc8.pdest.3.i, %p.addr.0.i
  br i1 %cmp5.i, label %while.body.i, label %do.body10.loopexit.i

do.body10.loopexit.i:                             ; preds = %while.body.i, %while.cond.preheader.i
  %pdest.3.lcssa.i = phi i32 [ %pdest.2.i, %while.cond.preheader.i ], [ %inc8.pdest.3.i, %while.body.i ]
  %idxprom.i = sext i32 %k.addr.0.i to i64
  %arrayidx.i = getelementptr inbounds [1 x i32]* @W, i64 0, i64 %idxprom.i
  %cmp18.i = icmp slt i32 %p.addr.0.i, 1
  br i1 %cmp18.i, label %do.body11.us.us.i, label %do.body10.do.body10.split_crit_edge.i

do.body11.us.us.i:                                ; preds = %do.body11.us.us.i, %do.body10.loopexit.i
  br label %do.body11.us.us.i

do.body10.do.body10.split_crit_edge.i:            ; preds = %do.body10.loopexit.i
  %6 = load i32* %arrayidx.i, align 4, !tbaa !0
  %phitmp.us.us.i = icmp eq i32 %6, 0
  br i1 %phitmp.us.us.i, label %do.body23.i, label %if.then13.i

if.then13.i:                                      ; preds = %do.body10.do.body10.split_crit_edge.i
  store i32 0, i32* %arrayidx.i, align 4, !tbaa !0
  br label %do.body23.i

do.body23.i:                                      ; preds = %if.then13.i, %do.body10.do.body10.split_crit_edge.i, %do.cond35.i
  %pdest.7.i = phi i32 [ %pdest.8.ph.i.us, %do.cond35.i ], [ 1, %if.then13.i ], [ %pdest.3.lcssa.i, %do.body10.do.body10.split_crit_edge.i ]
  %k.addr.1.i = phi i32 [ %7, %do.cond35.i ], [ %k.addr.0.i, %if.then13.i ], [ %k.addr.0.i, %do.body10.do.body10.split_crit_edge.i ]
  %idxprom24.i = sext i32 %k.addr.1.i to i64
  %arrayidx25.i = getelementptr inbounds [1 x i32]* @Link, i64 0, i64 %idxprom24.i
  %7 = load i32* %arrayidx25.i, align 4, !tbaa !0
  %cmp29.i = icmp ne i32 %7, -1
  br i1 %cmp29.i, label %while.cond26.outer.i.us, label %while.cond26.outer.i

while.cond26.outer.i.us:                          ; preds = %do.body23.i, %if.then30.i.us
  %pdest.8.ph.i.us = phi i32 [ %inc31.i.us, %if.then30.i.us ], [ %pdest.7.i, %do.body23.i ]
  %p.addr.1.ph.i.us = phi i32 [ %inc32.i.us, %if.then30.i.us ], [ 0, %do.body23.i ]
  %cmp27.i.us = icmp slt i32 %p.addr.1.ph.i.us, %j.2.i
  br i1 %cmp27.i.us, label %if.then30.i.us, label %do.cond35.i

if.then30.i.us:                                   ; preds = %while.cond26.outer.i.us
  %inc31.i.us = add nsw i32 %pdest.8.ph.i.us, 1
  %inc32.i.us = add nsw i32 %p.addr.1.ph.i.us, 1
  br label %while.cond26.outer.i.us

while.cond26.outer.i:                             ; preds = %do.body23.i
  %cmp27.i = icmp sgt i32 %j.2.i, 0
  br i1 %cmp27.i, label %while.body28.us.i, label %for.cond.i

while.body28.us.i:                                ; preds = %while.cond26.outer.i, %while.body28.us.i
  br label %while.body28.us.i

do.cond35.i:                                      ; preds = %while.cond26.outer.i.us
  br i1 %cmp29.i, label %do.body23.i, label %for.cond.i

f.exit:                                           ; preds = %if.end.i
  %tobool = icmp eq i32 %pdest.2.i, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %f.exit
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %f.exit
  ret i32 0
}

declare void @abort() noreturn nounwind

!0 = metadata !{metadata !"int", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
