; ModuleID = '/home/david/src/c-semantics/tests/integration/quicksort.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [6 x i8] c"ERROR\00", align 1
@.str1 = private unnamed_addr constant [8 x i8] c"SUCCESS\00", align 1

define void @insertion_sort(i8* %base, i64 %num_elements, i64 %element_size, i32 (i8*, i8*)* nocapture %comparer) nounwind uwtable {
entry:
  %cmp13 = icmp eq i64 %num_elements, 0
  br i1 %cmp13, label %for.end10, label %for.cond2.preheader.lr.ph

for.cond2.preheader.lr.ph:                        ; preds = %entry
  %cmp19.i = icmp eq i64 %element_size, 0
  br i1 %cmp19.i, label %for.cond2.preheader.split.us.us, label %for.cond2.preheader.for.cond2.preheader.split_crit_edge

for.inc9.us:                                      ; preds = %for.cond2.us.us, %for.body5.us.us
  %indvars.iv.next46 = add i64 %indvars.iv45, 1
  %exitcond = icmp eq i64 %indvars.iv.next46, %num_elements
  br i1 %exitcond, label %for.end10, label %for.cond2.preheader.split.us.us

for.cond2.us.us:                                  ; preds = %for.cond2.preheader.split.us.us, %for.cond2.backedge.us.us
  %indvars.iv42 = phi i64 [ %indvars.iv45, %for.cond2.preheader.split.us.us ], [ %indvars.iv.next43, %for.cond2.backedge.us.us ]
  %0 = trunc i64 %indvars.iv42 to i32
  %cmp3.us.us = icmp sgt i32 %0, 0
  br i1 %cmp3.us.us, label %for.body5.us.us, label %for.inc9.us

for.body5.us.us:                                  ; preds = %for.cond2.us.us
  %call.i.us.us = tail call i32 %comparer(i8* %base, i8* %base) nounwind
  %cmp6.us.us = icmp slt i32 %call.i.us.us, 0
  br i1 %cmp6.us.us, label %for.inc9.us, label %for.cond2.backedge.us.us

for.cond2.backedge.us.us:                         ; preds = %for.body5.us.us
  %indvars.iv.next43 = add i64 %indvars.iv42, -1
  br label %for.cond2.us.us

for.cond2.preheader.split.us.us:                  ; preds = %for.inc9.us, %for.cond2.preheader.lr.ph
  %indvars.iv45 = phi i64 [ %indvars.iv.next46, %for.inc9.us ], [ 0, %for.cond2.preheader.lr.ph ]
  br label %for.cond2.us.us

for.cond2.preheader.for.cond2.preheader.split_crit_edge: ; preds = %for.inc9, %for.cond2.preheader.lr.ph
  %indvars.iv52 = phi i64 [ %indvars.iv.next53, %for.inc9 ], [ 0, %for.cond2.preheader.lr.ph ]
  %i.014 = phi i32 [ %inc, %for.inc9 ], [ 0, %for.cond2.preheader.lr.ph ]
  br label %for.cond2

for.cond2:                                        ; preds = %for.cond2.backedge, %for.cond2.preheader.for.cond2.preheader.split_crit_edge
  %indvars.iv49 = phi i64 [ %indvars.iv.next50, %for.cond2.backedge ], [ %indvars.iv52, %for.cond2.preheader.for.cond2.preheader.split_crit_edge ]
  %j.0.in = phi i32 [ %j.0, %for.cond2.backedge ], [ %i.014, %for.cond2.preheader.for.cond2.preheader.split_crit_edge ]
  %j.0 = add nsw i32 %j.0.in, -1
  %1 = trunc i64 %indvars.iv49 to i32
  %cmp3 = icmp sgt i32 %1, 0
  br i1 %cmp3, label %for.body5, label %for.inc9

for.body5:                                        ; preds = %for.cond2
  %conv.i = sext i32 %j.0 to i64
  %mul.i = mul i64 %conv.i, %element_size
  %arrayidx.i = getelementptr inbounds i8* %base, i64 %mul.i
  %mul2.i = mul i64 %indvars.iv49, %element_size
  %arrayidx3.i = getelementptr inbounds i8* %base, i64 %mul2.i
  %call.i = tail call i32 %comparer(i8* %arrayidx.i, i8* %arrayidx3.i) nounwind
  %cmp6 = icmp slt i32 %call.i, 0
  br i1 %cmp6, label %for.inc9, label %for.body.i

for.cond2.backedge:                               ; preds = %for.body.i
  %indvars.iv.next50 = add i64 %indvars.iv49, -1
  br label %for.cond2

for.body.i:                                       ; preds = %for.body5, %for.body.i
  %indvars.iv.i = phi i64 [ %indvars.iv.next.i, %for.body.i ], [ 0, %for.body5 ]
  %add.i = add i64 %indvars.iv.i, %mul.i
  %arrayidx.i12 = getelementptr inbounds i8* %base, i64 %add.i
  %2 = load i8* %arrayidx.i12, align 1, !tbaa !0
  %add7.i = add i64 %indvars.iv.i, %mul2.i
  %arrayidx8.i = getelementptr inbounds i8* %base, i64 %add7.i
  %3 = load i8* %arrayidx8.i, align 1, !tbaa !0
  store i8 %3, i8* %arrayidx.i12, align 1, !tbaa !0
  store i8 %2, i8* %arrayidx8.i, align 1, !tbaa !0
  %indvars.iv.next.i = add i64 %indvars.iv.i, 1
  %exitcond.i = icmp eq i64 %indvars.iv.next.i, %element_size
  br i1 %exitcond.i, label %for.cond2.backedge, label %for.body.i

for.inc9:                                         ; preds = %for.cond2, %for.body5
  %indvars.iv.next53 = add i64 %indvars.iv52, 1
  %inc = add nsw i32 %i.014, 1
  %exitcond54 = icmp eq i64 %indvars.iv.next53, %num_elements
  br i1 %exitcond54, label %for.end10, label %for.cond2.preheader.for.cond2.preheader.split_crit_edge

for.end10:                                        ; preds = %for.inc9.us, %for.inc9, %entry
  ret void
}

define i32 @partition(i8* %base, i64 %num_elements, i64 %element_size, i32 (i8*, i8*)* nocapture %comparer, i32 %pivotIndex) nounwind uwtable {
entry:
  %sub = add i64 %num_elements, -1
  %conv = trunc i64 %sub to i32
  %cmp19.i = icmp eq i64 %element_size, 0
  %conv1.i65.pre = sext i32 %conv to i64
  %mul2.i66.pre = mul i64 %conv1.i65.pre, %element_size
  br i1 %cmp19.i, label %while.cond3.preheader, label %for.body.lr.ph.i

for.body.lr.ph.i:                                 ; preds = %entry
  %conv4.i = sext i32 %pivotIndex to i64
  %mul5.i = mul i64 %conv4.i, %element_size
  br label %for.body.i

for.body.i:                                       ; preds = %for.body.i, %for.body.lr.ph.i
  %indvars.iv.i = phi i64 [ 0, %for.body.lr.ph.i ], [ %indvars.iv.next.i, %for.body.i ]
  %add.i = add i64 %indvars.iv.i, %mul2.i66.pre
  %arrayidx.i = getelementptr inbounds i8* %base, i64 %add.i
  %0 = load i8* %arrayidx.i, align 1, !tbaa !0
  %add7.i = add i64 %indvars.iv.i, %mul5.i
  %arrayidx8.i = getelementptr inbounds i8* %base, i64 %add7.i
  %1 = load i8* %arrayidx8.i, align 1, !tbaa !0
  store i8 %1, i8* %arrayidx.i, align 1, !tbaa !0
  store i8 %0, i8* %arrayidx8.i, align 1, !tbaa !0
  %indvars.iv.next.i = add i64 %indvars.iv.i, 1
  %exitcond.i = icmp eq i64 %indvars.iv.next.i, %element_size
  br i1 %exitcond.i, label %while.cond3.preheader, label %for.body.i

while.cond3.preheader:                            ; preds = %entry, %for.body.i
  %arrayidx3.i67 = getelementptr inbounds i8* %base, i64 %mul2.i66.pre
  br label %while.cond3.outer

while.cond3:                                      ; preds = %if.end, %for.body.i58, %while.cond3.outer
  %high.0 = phi i32 [ %high.0.ph, %while.cond3.outer ], [ %high.1, %for.body.i58 ], [ %high.1, %if.end ]
  %call.i68 = tail call i32 %comparer(i8* %arrayidx.i64, i8* %arrayidx3.i67) nounwind
  %cmp = icmp slt i32 %call.i68, 0
  %or.cond29 = and i1 %cmp, %cmp9
  br i1 %or.cond29, label %while.body11, label %while.cond12.preheader

while.cond12.preheader:                           ; preds = %while.cond3
  %2 = sext i32 %high.0 to i64
  br label %while.cond12

while.body11:                                     ; preds = %while.cond3
  %indvars.iv.next77 = add i64 %indvars.iv76, 1
  %inc = add nsw i32 %low.0.ph, 1
  br label %while.cond3.outer

while.cond3.outer:                                ; preds = %while.cond3.preheader, %while.body11
  %indvars.iv76 = phi i64 [ 0, %while.cond3.preheader ], [ %indvars.iv.next77, %while.body11 ]
  %low.0.ph = phi i32 [ 0, %while.cond3.preheader ], [ %inc, %while.body11 ]
  %high.0.ph = phi i32 [ %conv, %while.cond3.preheader ], [ %high.0, %while.body11 ]
  %mul.i63 = mul i64 %indvars.iv76, %element_size
  %arrayidx.i64 = getelementptr inbounds i8* %base, i64 %mul.i63
  %cmp9 = icmp ult i64 %indvars.iv76, %sub
  br label %while.cond3

while.cond12:                                     ; preds = %while.cond12, %while.cond12.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next, %while.cond12 ], [ %2, %while.cond12.preheader ]
  %high.1 = phi i32 [ %dec, %while.cond12 ], [ %high.0, %while.cond12.preheader ]
  %mul.i60 = mul i64 %indvars.iv, %element_size
  %arrayidx.i61 = getelementptr inbounds i8* %base, i64 %mul.i60
  %call.i = tail call i32 %comparer(i8* %arrayidx.i61, i8* %arrayidx3.i67) nounwind
  %cmp16 = icmp sgt i32 %call.i, -1
  %3 = trunc i64 %indvars.iv to i32
  %cmp19 = icmp sgt i32 %3, 0
  %or.cond = and i1 %cmp16, %cmp19
  %indvars.iv.next = add i64 %indvars.iv, -1
  %dec = add nsw i32 %high.1, -1
  br i1 %or.cond, label %while.cond12, label %while.end23

while.end23:                                      ; preds = %while.cond12
  %4 = trunc i64 %indvars.iv76 to i32
  %cmp24 = icmp slt i32 %4, %high.1
  br i1 %cmp24, label %if.end, label %while.end26

if.end:                                           ; preds = %while.end23
  br i1 %cmp19.i, label %while.cond3, label %for.body.i58

for.body.i58:                                     ; preds = %if.end, %for.body.i58
  %indvars.iv.i51 = phi i64 [ %indvars.iv.next.i56, %for.body.i58 ], [ 0, %if.end ]
  %add.i52 = add i64 %indvars.iv.i51, %mul.i63
  %arrayidx.i53 = getelementptr inbounds i8* %base, i64 %add.i52
  %5 = load i8* %arrayidx.i53, align 1, !tbaa !0
  %add7.i54 = add i64 %indvars.iv.i51, %mul.i60
  %arrayidx8.i55 = getelementptr inbounds i8* %base, i64 %add7.i54
  %6 = load i8* %arrayidx8.i55, align 1, !tbaa !0
  store i8 %6, i8* %arrayidx.i53, align 1, !tbaa !0
  store i8 %5, i8* %arrayidx8.i55, align 1, !tbaa !0
  %indvars.iv.next.i56 = add i64 %indvars.iv.i51, 1
  %exitcond.i57 = icmp eq i64 %indvars.iv.next.i56, %element_size
  br i1 %exitcond.i57, label %while.cond3, label %for.body.i58

while.end26:                                      ; preds = %while.end23
  br i1 %cmp19.i, label %exchange_elements_helper.exit44, label %for.body.i43

for.body.i43:                                     ; preds = %while.end26, %for.body.i43
  %indvars.iv.i36 = phi i64 [ %indvars.iv.next.i41, %for.body.i43 ], [ 0, %while.end26 ]
  %add.i37 = add i64 %indvars.iv.i36, %mul.i63
  %arrayidx.i38 = getelementptr inbounds i8* %base, i64 %add.i37
  %7 = load i8* %arrayidx.i38, align 1, !tbaa !0
  %add7.i39 = add i64 %indvars.iv.i36, %mul2.i66.pre
  %arrayidx8.i40 = getelementptr inbounds i8* %base, i64 %add7.i39
  %8 = load i8* %arrayidx8.i40, align 1, !tbaa !0
  store i8 %8, i8* %arrayidx.i38, align 1, !tbaa !0
  store i8 %7, i8* %arrayidx8.i40, align 1, !tbaa !0
  %indvars.iv.next.i41 = add i64 %indvars.iv.i36, 1
  %exitcond.i42 = icmp eq i64 %indvars.iv.next.i41, %element_size
  br i1 %exitcond.i42, label %exchange_elements_helper.exit44, label %for.body.i43

exchange_elements_helper.exit44:                  ; preds = %for.body.i43, %while.end26
  ret i32 %low.0.ph
}

define void @quicksort(i8* %base, i64 %num_elements, i64 %element_size, i32 (i8*, i8*)* %comparer) nounwind uwtable {
entry:
  %cmp8 = icmp ult i64 %num_elements, 2
  br i1 %cmp8, label %if.then, label %if.end

if.then:                                          ; preds = %if.end, %entry
  %num_elements.tr.lcssa = phi i64 [ %num_elements, %entry ], [ %sub, %if.end ]
  %base.tr.lcssa = phi i8* [ %base, %entry ], [ %add.ptr, %if.end ]
  %cmp13.i = icmp eq i64 %num_elements.tr.lcssa, 0
  br i1 %cmp13.i, label %return, label %for.cond2.preheader.lr.ph.i

for.cond2.preheader.lr.ph.i:                      ; preds = %if.then
  %cmp19.i.i = icmp eq i64 %element_size, 0
  br i1 %cmp19.i.i, label %for.cond2.preheader.split.us.us.i, label %for.cond2.preheader.for.cond2.preheader.split_crit_edge.i

for.inc9.us.i:                                    ; preds = %for.body5.us.us.i, %for.cond2.us.us.i
  %indvars.iv.next46.i = add i64 %indvars.iv45.i, 1
  %exitcond.i = icmp eq i64 %indvars.iv.next46.i, %num_elements.tr.lcssa
  br i1 %exitcond.i, label %return, label %for.cond2.preheader.split.us.us.i

for.cond2.us.us.i:                                ; preds = %for.body5.us.us.i, %for.cond2.preheader.split.us.us.i
  %indvars.iv42.i = phi i64 [ %indvars.iv45.i, %for.cond2.preheader.split.us.us.i ], [ %indvars.iv.next43.i, %for.body5.us.us.i ]
  %0 = trunc i64 %indvars.iv42.i to i32
  %cmp3.us.us.i = icmp sgt i32 %0, 0
  br i1 %cmp3.us.us.i, label %for.body5.us.us.i, label %for.inc9.us.i

for.body5.us.us.i:                                ; preds = %for.cond2.us.us.i
  %call.i.us.us.i = tail call i32 %comparer(i8* %base.tr.lcssa, i8* %base.tr.lcssa) nounwind
  %cmp6.us.us.i = icmp slt i32 %call.i.us.us.i, 0
  %indvars.iv.next43.i = add i64 %indvars.iv42.i, -1
  br i1 %cmp6.us.us.i, label %for.inc9.us.i, label %for.cond2.us.us.i

for.cond2.preheader.split.us.us.i:                ; preds = %for.cond2.preheader.lr.ph.i, %for.inc9.us.i
  %indvars.iv45.i = phi i64 [ %indvars.iv.next46.i, %for.inc9.us.i ], [ 0, %for.cond2.preheader.lr.ph.i ]
  br label %for.cond2.us.us.i

for.cond2.preheader.for.cond2.preheader.split_crit_edge.i: ; preds = %for.cond2.preheader.lr.ph.i, %for.inc9.i
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.inc9.i ], [ 0, %for.cond2.preheader.lr.ph.i ]
  %i.014.i = phi i32 [ %inc.i, %for.inc9.i ], [ 0, %for.cond2.preheader.lr.ph.i ]
  br label %for.cond2.i

for.cond2.i:                                      ; preds = %for.cond2.backedge.i, %for.cond2.preheader.for.cond2.preheader.split_crit_edge.i
  %indvars.iv12 = phi i64 [ %indvars.iv.next13, %for.cond2.backedge.i ], [ %indvars.iv, %for.cond2.preheader.for.cond2.preheader.split_crit_edge.i ]
  %j.0.in.i = phi i32 [ %j.0.i, %for.cond2.backedge.i ], [ %i.014.i, %for.cond2.preheader.for.cond2.preheader.split_crit_edge.i ]
  %j.0.i = add nsw i32 %j.0.in.i, -1
  %1 = trunc i64 %indvars.iv12 to i32
  %cmp3.i = icmp sgt i32 %1, 0
  br i1 %cmp3.i, label %for.body5.i, label %for.inc9.i

for.body5.i:                                      ; preds = %for.cond2.i
  %conv.i.i = sext i32 %j.0.i to i64
  %mul.i.i = mul i64 %conv.i.i, %element_size
  %arrayidx.i.i = getelementptr inbounds i8* %base.tr.lcssa, i64 %mul.i.i
  %mul2.i.i = mul i64 %indvars.iv12, %element_size
  %arrayidx3.i.i = getelementptr inbounds i8* %base.tr.lcssa, i64 %mul2.i.i
  %call.i.i = tail call i32 %comparer(i8* %arrayidx.i.i, i8* %arrayidx3.i.i) nounwind
  %cmp6.i = icmp slt i32 %call.i.i, 0
  br i1 %cmp6.i, label %for.inc9.i, label %for.body.i.i

for.cond2.backedge.i:                             ; preds = %for.body.i.i
  %indvars.iv.next13 = add i64 %indvars.iv12, -1
  br label %for.cond2.i

for.body.i.i:                                     ; preds = %for.body5.i, %for.body.i.i
  %indvars.iv.i.i = phi i64 [ %indvars.iv.next.i.i, %for.body.i.i ], [ 0, %for.body5.i ]
  %add.i.i = add i64 %indvars.iv.i.i, %mul.i.i
  %arrayidx.i12.i = getelementptr inbounds i8* %base.tr.lcssa, i64 %add.i.i
  %2 = load i8* %arrayidx.i12.i, align 1, !tbaa !0
  %add7.i.i = add i64 %indvars.iv.i.i, %mul2.i.i
  %arrayidx8.i.i = getelementptr inbounds i8* %base.tr.lcssa, i64 %add7.i.i
  %3 = load i8* %arrayidx8.i.i, align 1, !tbaa !0
  store i8 %3, i8* %arrayidx.i12.i, align 1, !tbaa !0
  store i8 %2, i8* %arrayidx8.i.i, align 1, !tbaa !0
  %indvars.iv.next.i.i = add i64 %indvars.iv.i.i, 1
  %exitcond.i.i = icmp eq i64 %indvars.iv.next.i.i, %element_size
  br i1 %exitcond.i.i, label %for.cond2.backedge.i, label %for.body.i.i

for.inc9.i:                                       ; preds = %for.body5.i, %for.cond2.i
  %indvars.iv.next = add i64 %indvars.iv, 1
  %inc.i = add nsw i32 %i.014.i, 1
  %exitcond54.i = icmp eq i64 %indvars.iv.next, %num_elements.tr.lcssa
  br i1 %exitcond54.i, label %return, label %for.cond2.preheader.for.cond2.preheader.split_crit_edge.i

if.end:                                           ; preds = %entry, %if.end
  %num_elements.tr10 = phi i64 [ %sub, %if.end ], [ %num_elements, %entry ]
  %base.tr9 = phi i8* [ %add.ptr, %if.end ], [ %base, %entry ]
  %call = tail call i32 @rand() nounwind
  %conv = sext i32 %call to i64
  %rem = urem i64 %conv, %num_elements.tr10
  %conv1 = trunc i64 %rem to i32
  %call2 = tail call i32 @partition(i8* %base.tr9, i64 %num_elements.tr10, i64 %element_size, i32 (i8*, i8*)* %comparer, i32 %conv1)
  %conv3 = sext i32 %call2 to i64
  tail call void @quicksort(i8* %base.tr9, i64 %conv3, i64 %element_size, i32 (i8*, i8*)* %comparer)
  %add = add nsw i32 %call2, 1
  %conv4 = sext i32 %add to i64
  %mul = mul i64 %conv4, %element_size
  %add.ptr = getelementptr inbounds i8* %base.tr9, i64 %mul
  %sub = sub i64 %num_elements.tr10, %conv4
  %cmp = icmp ult i64 %sub, 2
  br i1 %cmp, label %if.then, label %if.end

return:                                           ; preds = %for.inc9.us.i, %for.inc9.i, %if.then
  ret void
}

declare i32 @rand() nounwind

define i32 @compare_int(i8* nocapture %left, i8* nocapture %right) nounwind uwtable readonly {
entry:
  %0 = bitcast i8* %left to i32*
  %1 = load i32* %0, align 4, !tbaa !2
  %2 = bitcast i8* %right to i32*
  %3 = load i32* %2, align 4, !tbaa !2
  %sub = sub nsw i32 %1, %3
  ret i32 %sub
}

define i32 @main() nounwind uwtable {
entry:
  %call = tail call noalias i8* @malloc(i64 32) nounwind
  %0 = bitcast i8* %call to i32*
  %call2 = tail call i32 @rand() nounwind
  %rem = srem i32 %call2, 8
  store i32 %rem, i32* %0, align 4, !tbaa !2
  %call2.1 = tail call i32 @rand() nounwind
  %rem.1 = srem i32 %call2.1, 8
  %arrayidx.1 = getelementptr inbounds i8* %call, i64 4
  %1 = bitcast i8* %arrayidx.1 to i32*
  store i32 %rem.1, i32* %1, align 4, !tbaa !2
  %call2.2 = tail call i32 @rand() nounwind
  %rem.2 = srem i32 %call2.2, 8
  %arrayidx.2 = getelementptr inbounds i8* %call, i64 8
  %2 = bitcast i8* %arrayidx.2 to i32*
  store i32 %rem.2, i32* %2, align 4, !tbaa !2
  %call2.3 = tail call i32 @rand() nounwind
  %rem.3 = srem i32 %call2.3, 8
  %arrayidx.3 = getelementptr inbounds i8* %call, i64 12
  %3 = bitcast i8* %arrayidx.3 to i32*
  store i32 %rem.3, i32* %3, align 4, !tbaa !2
  %call2.4 = tail call i32 @rand() nounwind
  %rem.4 = srem i32 %call2.4, 8
  %arrayidx.4 = getelementptr inbounds i8* %call, i64 16
  %4 = bitcast i8* %arrayidx.4 to i32*
  store i32 %rem.4, i32* %4, align 4, !tbaa !2
  %call2.5 = tail call i32 @rand() nounwind
  %rem.5 = srem i32 %call2.5, 8
  %arrayidx.5 = getelementptr inbounds i8* %call, i64 20
  %5 = bitcast i8* %arrayidx.5 to i32*
  store i32 %rem.5, i32* %5, align 4, !tbaa !2
  %call2.6 = tail call i32 @rand() nounwind
  %rem.6 = srem i32 %call2.6, 8
  %arrayidx.6 = getelementptr inbounds i8* %call, i64 24
  %6 = bitcast i8* %arrayidx.6 to i32*
  store i32 %rem.6, i32* %6, align 4, !tbaa !2
  %call2.7 = tail call i32 @rand() nounwind
  %rem.7 = srem i32 %call2.7, 8
  %arrayidx.7 = getelementptr inbounds i8* %call, i64 28
  %7 = bitcast i8* %arrayidx.7 to i32*
  store i32 %rem.7, i32* %7, align 4, !tbaa !2
  tail call void @quicksort(i8* %call, i64 8, i64 4, i32 (i8*, i8*)* @compare_int)
  br label %for.cond4

for.cond4:                                        ; preds = %for.body7, %entry
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body7 ], [ 1, %entry ]
  %8 = trunc i64 %indvars.iv to i32
  %cmp5 = icmp slt i32 %8, 8
  br i1 %cmp5, label %for.body7, label %for.end17

for.body7:                                        ; preds = %for.cond4
  %9 = add nsw i64 %indvars.iv, -1
  %arrayidx9 = getelementptr inbounds i32* %0, i64 %9
  %10 = load i32* %arrayidx9, align 4, !tbaa !2
  %arrayidx11 = getelementptr inbounds i32* %0, i64 %indvars.iv
  %11 = load i32* %arrayidx11, align 4, !tbaa !2
  %cmp12 = icmp sgt i32 %10, %11
  %indvars.iv.next = add i64 %indvars.iv, 1
  br i1 %cmp12, label %if.then, label %for.cond4

if.then:                                          ; preds = %for.body7
  %call14 = tail call i32 @puts(i8* getelementptr inbounds ([6 x i8]* @.str, i64 0, i64 0)) nounwind
  br label %return

for.end17:                                        ; preds = %for.cond4
  %call18 = tail call i32 @puts(i8* getelementptr inbounds ([8 x i8]* @.str1, i64 0, i64 0)) nounwind
  br label %return

return:                                           ; preds = %for.end17, %if.then
  %retval.0 = phi i32 [ -1, %if.then ], [ 0, %for.end17 ]
  ret i32 %retval.0
}

declare noalias i8* @malloc(i64) nounwind

declare i32 @puts(i8* nocapture) nounwind

!0 = metadata !{metadata !"omnipotent char", metadata !1}
!1 = metadata !{metadata !"Simple C/C++ TBAA", null}
!2 = metadata !{metadata !"int", metadata !0}
