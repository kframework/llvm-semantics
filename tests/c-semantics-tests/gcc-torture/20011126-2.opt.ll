; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20011126-2.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [4 x i8] c"aab\00", align 1

define i32 @main() nounwind uwtable {
entry:
  %out = alloca [4 x i8], align 1
  %arraydecay = getelementptr inbounds [4 x i8]* %out, i64 0, i64 0
  br label %while.body.outer.i.outer

while.cond11.while.body.loopexit_crit_edge.i:     ; preds = %while.body14.while.body14_crit_edge.i, %while.body14.lr.ph.i
  %incdec.ptr15.i.lcssa = phi i8* [ %scevgep, %while.body14.lr.ph.i ], [ %indvars.iv, %while.body14.while.body14_crit_edge.i ]
  %scevgep.sum.i = sub i64 1, %in.addr.0.ph10.i
  %scevgep9.sum.i = add i64 %scevgep.sum.i, %smax8.i
  %scevgep11.i = getelementptr i8* %out.addr.0.ph.i.ph, i64 %scevgep9.sum.i
  br label %while.body.outer.i.outer

while.body.outer.i.outer:                         ; preds = %while.cond11.while.body.loopexit_crit_edge.i, %entry
  %out.addr.0.ph.i.ph = phi i8* [ %arraydecay, %entry ], [ %scevgep11.i, %while.cond11.while.body.loopexit_crit_edge.i ]
  %in.addr.0.ph.i.ph = phi i8* [ getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), %entry ], [ %incdec.ptr15.i.lcssa, %while.cond11.while.body.loopexit_crit_edge.i ]
  %in.addr.0.ph10.i = ptrtoint i8* %in.addr.0.ph.i.ph to i64
  %0 = load i8* %in.addr.0.ph.i.ph, align 1, !tbaa !0
  %cmp.i = icmp eq i8 %0, 97
  br i1 %cmp.i, label %while.body.outer.i.outer.while.body.outer.i.outer.split_crit_edge, label %while.body.i

while.body.outer.i.outer.while.body.outer.i.outer.split_crit_edge: ; preds = %while.body.outer.i.outer
  %scevgep = getelementptr i8* %in.addr.0.ph.i.ph, i64 1
  br label %while.cond2.i

while.body.i:                                     ; preds = %while.body.outer.i.outer, %while.body.i
  br label %while.body.i

while.cond2.i:                                    ; preds = %while.body.outer.i.outer.while.body.outer.i.outer.split_crit_edge, %while.cond11.loopexit.i, %while.cond2.i
  %indvars.iv13 = phi i64 [ %indvars.iv.next, %while.cond2.i ], [ 0, %while.cond11.loopexit.i ], [ 0, %while.body.outer.i.outer.while.body.outer.i.outer.split_crit_edge ]
  %indvars.iv = phi i8* [ %scevgep12, %while.cond2.i ], [ %scevgep, %while.cond11.loopexit.i ], [ %scevgep, %while.body.outer.i.outer.while.body.outer.i.outer.split_crit_edge ]
  %in.addr.0.pn.i = phi i8* [ %p.0.i, %while.cond2.i ], [ %in.addr.0.ph.i.ph, %while.cond11.loopexit.i ], [ %in.addr.0.ph.i.ph, %while.body.outer.i.outer.while.body.outer.i.outer.split_crit_edge ]
  %p.0.i = getelementptr inbounds i8* %in.addr.0.pn.i, i64 1
  %1 = load i8* %p.0.i, align 1, !tbaa !0
  %scevgep12 = getelementptr i8* %indvars.iv, i64 1
  %indvars.iv.next = add i64 %indvars.iv13, 1
  switch i8 %1, label %while.cond11.loopexit.i [
    i8 120, label %while.cond2.i
    i8 98, label %test.exit
  ]

while.cond11.loopexit.i:                          ; preds = %while.cond2.i
  %cmp122.i = icmp ult i8* %in.addr.0.ph.i.ph, %p.0.i
  br i1 %cmp122.i, label %while.body14.lr.ph.i, label %while.cond2.i

while.body14.lr.ph.i:                             ; preds = %while.cond11.loopexit.i
  %2 = icmp sgt i8* %in.addr.0.ph.i.ph, %in.addr.0.pn.i
  %smax.i = select i1 %2, i8* %in.addr.0.ph.i.ph, i8* %in.addr.0.pn.i
  %smax8.i = ptrtoint i8* %smax.i to i64
  store i8 97, i8* %out.addr.0.ph.i.ph, align 1, !tbaa !0
  %cmp12.i4 = icmp slt i8* %in.addr.0.ph.i.ph, %in.addr.0.pn.i
  br i1 %cmp12.i4, label %while.body14.while.body14_crit_edge.i.lr.ph, label %while.cond11.while.body.loopexit_crit_edge.i

while.body14.while.body14_crit_edge.i.lr.ph:      ; preds = %while.body14.lr.ph.i
  %scevgep.sum = add i64 %indvars.iv13, 1
  %lftr.limit = getelementptr i8* %in.addr.0.ph.i.ph, i64 %scevgep.sum
  br label %while.body14.while.body14_crit_edge.i

while.body14.while.body14_crit_edge.i:            ; preds = %while.body14.while.body14_crit_edge.i, %while.body14.while.body14_crit_edge.i.lr.ph
  %incdec.ptr15.i6 = phi i8* [ %scevgep, %while.body14.while.body14_crit_edge.i.lr.ph ], [ %incdec.ptr15.i, %while.body14.while.body14_crit_edge.i ]
  %out.addr.13.i5 = phi i8* [ %out.addr.0.ph.i.ph, %while.body14.while.body14_crit_edge.i.lr.ph ], [ %incdec.ptr16.i, %while.body14.while.body14_crit_edge.i ]
  %incdec.ptr16.i = getelementptr inbounds i8* %out.addr.13.i5, i64 1
  %.pre.i = load i8* %incdec.ptr15.i6, align 1, !tbaa !0
  %incdec.ptr15.i = getelementptr inbounds i8* %incdec.ptr15.i6, i64 1
  store i8 %.pre.i, i8* %incdec.ptr16.i, align 1, !tbaa !0
  %exitcond = icmp eq i8* %incdec.ptr15.i, %lftr.limit
  br i1 %exitcond, label %while.cond11.while.body.loopexit_crit_edge.i, label %while.body14.while.body14_crit_edge.i

test.exit:                                        ; preds = %while.cond2.i
  ret i32 0
}

!0 = metadata !{metadata !"omnipotent char", metadata !1}
!1 = metadata !{metadata !"Simple C/C++ TBAA", null}
