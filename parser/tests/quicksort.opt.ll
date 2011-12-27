; ModuleID = '/home/grosu/celliso2/c-semantics/tests/integration/quicksort.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [6 x i8] c"ERROR\00", align 1
@.str1 = private unnamed_addr constant [8 x i8] c"SUCCESS\00", align 1

define i32 @gnu_dev_major(i64 %__dev) nounwind uwtable readnone inlinehint {
entry:
  %shr = lshr i64 %__dev, 8
  %and = and i64 %shr, 4095
  %shr2 = lshr i64 %__dev, 32
  %and3 = and i64 %shr2, 4294963200
  %or = or i64 %and, %and3
  %conv5 = trunc i64 %or to i32
  ret i32 %conv5
}

define i32 @gnu_dev_minor(i64 %__dev) nounwind uwtable readnone inlinehint {
entry:
  %and = and i64 %__dev, 255
  %shr = lshr i64 %__dev, 12
  %and2 = and i64 %shr, 4294967040
  %or = or i64 %and2, %and
  %conv4 = trunc i64 %or to i32
  ret i32 %conv4
}

define i64 @gnu_dev_makedev(i32 %__major, i32 %__minor) nounwind uwtable readnone inlinehint {
entry:
  %and = and i32 %__minor, 255
  %and2 = shl i32 %__major, 8
  %shl = and i32 %and2, 1048320
  %or = or i32 %and, %shl
  %conv = zext i32 %or to i64
  %and4 = and i32 %__minor, -256
  %conv5 = zext i32 %and4 to i64
  %shl6 = shl nuw nsw i64 %conv5, 12
  %and9 = and i32 %__major, -4096
  %conv10 = zext i32 %and9 to i64
  %shl11 = shl nuw i64 %conv10, 32
  %or7 = or i64 %shl6, %shl11
  %or12 = or i64 %or7, %conv
  ret i64 %or12
}

define void @insertion_sort(i8* %base, i64 %num_elements, i64 %element_size, i32 (i8*, i8*)* %comparer) nounwind uwtable {
entry:
  %cmp3 = icmp eq i64 %num_elements, 0
  br i1 %cmp3, label %for.end25, label %for.cond5.preheader.lr.ph

for.cond5.preheader.lr.ph:                        ; preds = %entry
  %cmp1.i = icmp eq i64 %element_size, 0
  %tmp = sub i64 0, %element_size
  br label %for.cond5.preheader

for.cond5.preheader:                              ; preds = %for.inc23, %for.cond5.preheader.lr.ph
  %indvar6 = phi i64 [ 0, %for.cond5.preheader.lr.ph ], [ %indvar.next7, %for.inc23 ]
  %tmp63 = mul i64 %indvar6, %element_size
  %tmp66 = shl i64 %indvar6, 32
  %sext = add i64 %tmp66, -4294967296
  %tmp47 = ashr exact i64 %sext, 32
  %tmp48 = mul i64 %tmp47, %element_size
  br i1 %cmp1.i, label %for.cond5.us, label %for.cond5

for.cond5.us:                                     ; preds = %for.cond5.preheader, %for.cond5.backedge.us
  %indvar = phi i64 [ %indvar.next, %for.cond5.backedge.us ], [ 0, %for.cond5.preheader ]
  %tmp69 = sub i64 %indvar6, %indvar
  %storemerge1.in.us = trunc i64 %tmp69 to i32
  %tmp72 = mul i64 %indvar, %tmp
  %cmp7.us = icmp sgt i32 %storemerge1.in.us, 0
  br i1 %cmp7.us, label %for.body9.us, label %for.inc23

for.body9.us:                                     ; preds = %for.cond5.us
  %tmp17 = add i64 %tmp48, %tmp72
  %tmp73 = add i64 %tmp63, %tmp72
  %arrayidx.i.us = getelementptr i8* %base, i64 %tmp17
  %arrayidx10.i.us = getelementptr i8* %base, i64 %tmp73
  %call.i.us = tail call i32 %comparer(i8* %arrayidx.i.us, i8* %arrayidx10.i.us) nounwind
  %cmp15.us = icmp slt i32 %call.i.us, 0
  br i1 %cmp15.us, label %for.inc23, label %for.cond5.backedge.us

for.cond5.backedge.us:                            ; preds = %for.body9.us
  %indvar.next = add i64 %indvar, 1
  br label %for.cond5.us

for.cond5:                                        ; preds = %for.cond5.preheader, %for.cond5.backedge
  %indvar19 = phi i64 [ %indvar.next20, %for.cond5.backedge ], [ 0, %for.cond5.preheader ]
  %tmp59 = sub i64 %indvar6, %indvar19
  %storemerge1.in = trunc i64 %tmp59 to i32
  %tmp62 = mul i64 %indvar19, %tmp
  %tmp64 = add i64 %tmp63, %tmp62
  %tmp49 = add i64 %tmp48, %tmp62
  %cmp7 = icmp sgt i32 %storemerge1.in, 0
  br i1 %cmp7, label %for.body9, label %for.inc23

for.body9:                                        ; preds = %for.cond5
  %arrayidx.i = getelementptr i8* %base, i64 %tmp49
  %arrayidx10.i = getelementptr i8* %base, i64 %tmp64
  %call.i = tail call i32 %comparer(i8* %arrayidx.i, i8* %arrayidx10.i) nounwind
  %cmp15 = icmp slt i32 %call.i, 0
  br i1 %cmp15, label %for.inc23, label %for.body.i

for.cond5.backedge:                               ; preds = %for.body.i
  %indvar.next20 = add i64 %indvar19, 1
  br label %for.cond5

for.body.i:                                       ; preds = %for.body9, %for.body.i
  %indvar.i = phi i64 [ %0, %for.body.i ], [ 0, %for.body9 ]
  %tmp65 = add i64 %tmp64, %indvar.i
  %arrayidx21.i = getelementptr i8* %base, i64 %tmp65
  %tmp50 = add i64 %tmp49, %indvar.i
  %arrayidx.i2 = getelementptr i8* %base, i64 %tmp50
  %tmp12.i = load i8* %arrayidx.i2, align 1
  %tmp22.i = load i8* %arrayidx21.i, align 1
  store i8 %tmp22.i, i8* %arrayidx.i2, align 1
  store i8 %tmp12.i, i8* %arrayidx21.i, align 1
  %0 = add i64 %indvar.i, 1
  %exitcond = icmp eq i64 %0, %element_size
  br i1 %exitcond, label %for.cond5.backedge, label %for.body.i

for.inc23:                                        ; preds = %for.cond5, %for.body9, %for.cond5.us, %for.body9.us
  %indvar.next7 = add i64 %indvar6, 1
  %exitcond57 = icmp eq i64 %indvar.next7, %num_elements
  br i1 %exitcond57, label %for.end25, label %for.cond5.preheader

for.end25:                                        ; preds = %for.inc23, %entry
  ret void
}

define i32 @partition(i8* %base, i64 %num_elements, i64 %element_size, i32 (i8*, i8*)* %comparer, i32 %pivotIndex) nounwind uwtable {
entry:
  %sub = add i64 %num_elements, 4294967295
  %conv = trunc i64 %sub to i32
  %cmp1.i = icmp eq i64 %element_size, 0
  br i1 %cmp1.i, label %entry.while.cond7.preheader_crit_edge, label %for.body.lr.ph.i

entry.while.cond7.preheader_crit_edge:            ; preds = %entry
  %conv6.i39.pre = sext i32 %conv to i64
  br label %while.cond7.preheader

for.body.lr.ph.i:                                 ; preds = %entry
  %tmp = sext i32 %pivotIndex to i64
  %tmp69 = mul i64 %tmp, %element_size
  %tmp73 = sext i32 %conv to i64
  %tmp74 = mul i64 %tmp73, %element_size
  br label %for.body.i

for.body.i:                                       ; preds = %for.body.i, %for.body.lr.ph.i
  %indvar.i = phi i64 [ 0, %for.body.lr.ph.i ], [ %0, %for.body.i ]
  %tmp70 = add i64 %tmp69, %indvar.i
  %arrayidx21.i = getelementptr i8* %base, i64 %tmp70
  %tmp75 = add i64 %tmp74, %indvar.i
  %arrayidx.i = getelementptr i8* %base, i64 %tmp75
  %tmp12.i = load i8* %arrayidx.i, align 1
  %tmp22.i = load i8* %arrayidx21.i, align 1
  store i8 %tmp22.i, i8* %arrayidx.i, align 1
  store i8 %tmp12.i, i8* %arrayidx21.i, align 1
  %0 = add i64 %indvar.i, 1
  %exitcond = icmp eq i64 %0, %element_size
  br i1 %exitcond, label %while.cond7.preheader, label %for.body.i

while.cond7.preheader:                            ; preds = %for.body.i, %entry.while.cond7.preheader_crit_edge
  %conv6.i39.pre-phi = phi i64 [ %conv6.i39.pre, %entry.while.cond7.preheader_crit_edge ], [ %tmp73, %for.body.i ]
  %sub19 = add i64 %num_elements, -1
  %mul8.i40 = mul i64 %conv6.i39.pre-phi, %element_size
  %arrayidx10.i41 = getelementptr inbounds i8* %base, i64 %mul8.i40
  %tmp102 = sub i64 0, %element_size
  br label %while.cond7.outer

while.cond7.outer:                                ; preds = %if.end, %for.body.i33, %while.cond7.preheader
  %tmp3644.ph = phi i32 [ %conv, %while.cond7.preheader ], [ %tmp3645.lcssa, %for.body.i33 ], [ %tmp3645.lcssa, %if.end ]
  %tmp5843.ph = phi i32 [ 0, %while.cond7.preheader ], [ %tmp5843.lcssa, %for.body.i33 ], [ %tmp5843.lcssa, %if.end ]
  %conv.i3657 = sext i32 %tmp5843.ph to i64
  %mul.i3758 = mul i64 %conv.i3657, %element_size
  %arrayidx.i3859 = getelementptr inbounds i8* %base, i64 %mul.i3758
  %call.i4260 = tail call i32 %comparer(i8* %arrayidx.i3859, i8* %arrayidx10.i41) nounwind
  %cmp61 = icmp slt i32 %call.i4260, 0
  %cmp2062 = icmp ult i64 %conv.i3657, %sub19
  %or.cond5663 = and i1 %cmp61, %cmp2062
  br i1 %or.cond5663, label %while.body22.lr.ph, label %while.cond24.preheader

while.body22.lr.ph:                               ; preds = %while.cond7.outer
  %tmp111 = add i32 %tmp5843.ph, 1
  %tmp112 = zext i32 %tmp111 to i64
  %tmp116 = add i64 %conv.i3657, 1
  br label %while.body22

while.cond7.while.cond24.preheader_crit_edge:     ; preds = %while.body22
  %tmp113 = add i64 %tmp112, %indvar109
  %inc = trunc i64 %tmp113 to i32
  br label %while.cond24.preheader

while.cond24.preheader:                           ; preds = %while.cond7.while.cond24.preheader_crit_edge, %while.cond7.outer
  %mul.i37.lcssa = phi i64 [ %mul.i37, %while.cond7.while.cond24.preheader_crit_edge ], [ %mul.i3758, %while.cond7.outer ]
  %tmp5843.lcssa = phi i32 [ %inc, %while.cond7.while.cond24.preheader_crit_edge ], [ %tmp5843.ph, %while.cond7.outer ]
  %conv.i47 = sext i32 %tmp3644.ph to i64
  %mul.i48 = mul i64 %conv.i47, %element_size
  %arrayidx.i3549 = getelementptr inbounds i8* %base, i64 %mul.i48
  %call.i50 = tail call i32 %comparer(i8* %arrayidx.i3549, i8* %arrayidx10.i41) nounwind
  %cmp3351 = icmp sgt i32 %call.i50, -1
  %cmp3752 = icmp sgt i32 %tmp3644.ph, 0
  %or.cond53 = and i1 %cmp3351, %cmp3752
  br i1 %or.cond53, label %while.body40.lr.ph, label %while.end42

while.body40.lr.ph:                               ; preds = %while.cond24.preheader
  %tmp98 = add i32 %tmp3644.ph, -1
  %tmp99 = zext i32 %tmp98 to i64
  %tmp105 = add i64 %conv.i47, -1
  %tmp106 = mul i64 %tmp105, %element_size
  br label %while.body40

while.body22:                                     ; preds = %while.body22.lr.ph, %while.body22
  %indvar109 = phi i64 [ 0, %while.body22.lr.ph ], [ %indvar.next110, %while.body22 ]
  %conv.i36 = add i64 %tmp116, %indvar109
  %tmp119121 = add i64 %tmp116, %indvar109
  %mul.i37 = mul i64 %tmp119121, %element_size
  %arrayidx.i38 = getelementptr i8* %base, i64 %mul.i37
  %call.i42 = tail call i32 %comparer(i8* %arrayidx.i38, i8* %arrayidx10.i41) nounwind
  %cmp = icmp slt i32 %call.i42, 0
  %cmp20 = icmp ult i64 %conv.i36, %sub19
  %or.cond56 = and i1 %cmp, %cmp20
  %indvar.next110 = add i64 %indvar109, 1
  br i1 %or.cond56, label %while.body22, label %while.cond7.while.cond24.preheader_crit_edge

while.body40:                                     ; preds = %while.body40.lr.ph, %while.body40
  %indvar = phi i64 [ 0, %while.body40.lr.ph ], [ %indvar.next, %while.body40 ]
  %tmp100 = sub i64 %tmp99, %indvar
  %dec = trunc i64 %tmp100 to i32
  %tmp103 = mul i64 %indvar, %tmp102
  %mul.i = add i64 %tmp106, %tmp103
  %arrayidx.i35 = getelementptr i8* %base, i64 %mul.i
  %call.i = tail call i32 %comparer(i8* %arrayidx.i35, i8* %arrayidx10.i41) nounwind
  %cmp33 = icmp sgt i32 %call.i, -1
  %cmp37 = icmp sgt i32 %dec, 0
  %or.cond = and i1 %cmp33, %cmp37
  %indvar.next = add i64 %indvar, 1
  br i1 %or.cond, label %while.body40, label %while.end42

while.end42:                                      ; preds = %while.body40, %while.cond24.preheader
  %mul.i.lcssa = phi i64 [ %mul.i48, %while.cond24.preheader ], [ %mul.i, %while.body40 ]
  %tmp3645.lcssa = phi i32 [ %tmp3644.ph, %while.cond24.preheader ], [ %dec, %while.body40 ]
  %cmp45 = icmp slt i32 %tmp5843.lcssa, %tmp3645.lcssa
  br i1 %cmp45, label %if.end, label %while.end51

if.end:                                           ; preds = %while.end42
  br i1 %cmp1.i, label %while.cond7.outer, label %for.body.i33

for.body.i33:                                     ; preds = %if.end, %for.body.i33
  %indvar.i24 = phi i64 [ %1, %for.body.i33 ], [ 0, %if.end ]
  %tmp94 = add i64 %mul.i.lcssa, %indvar.i24
  %arrayidx21.i28 = getelementptr i8* %base, i64 %tmp94
  %tmp95 = add i64 %mul.i37.lcssa, %indvar.i24
  %arrayidx.i26 = getelementptr i8* %base, i64 %tmp95
  %tmp12.i29 = load i8* %arrayidx.i26, align 1
  %tmp22.i30 = load i8* %arrayidx21.i28, align 1
  store i8 %tmp22.i30, i8* %arrayidx.i26, align 1
  store i8 %tmp12.i29, i8* %arrayidx21.i28, align 1
  %1 = add i64 %indvar.i24, 1
  %exitcond92 = icmp eq i64 %1, %element_size
  br i1 %exitcond92, label %while.cond7.outer, label %for.body.i33

while.end51:                                      ; preds = %while.end42
  br i1 %cmp1.i, label %exchange_elements_helper.exit17, label %for.body.i16.preheader

for.body.i16.preheader:                           ; preds = %while.end51
  %tmp86 = mul i64 %conv6.i39.pre-phi, %element_size
  br label %for.body.i16

for.body.i16:                                     ; preds = %for.body.i16.preheader, %for.body.i16
  %indvar.i7 = phi i64 [ %2, %for.body.i16 ], [ 0, %for.body.i16.preheader ]
  %tmp87 = add i64 %tmp86, %indvar.i7
  %arrayidx21.i11 = getelementptr i8* %base, i64 %tmp87
  %tmp88 = add i64 %mul.i37.lcssa, %indvar.i7
  %arrayidx.i9 = getelementptr i8* %base, i64 %tmp88
  %tmp12.i12 = load i8* %arrayidx.i9, align 1
  %tmp22.i13 = load i8* %arrayidx21.i11, align 1
  store i8 %tmp22.i13, i8* %arrayidx.i9, align 1
  store i8 %tmp12.i12, i8* %arrayidx21.i11, align 1
  %2 = add i64 %indvar.i7, 1
  %exitcond81 = icmp eq i64 %2, %element_size
  br i1 %exitcond81, label %exchange_elements_helper.exit17, label %for.body.i16

exchange_elements_helper.exit17:                  ; preds = %for.body.i16, %while.end51
  ret i32 %tmp5843.lcssa
}

define void @quicksort(i8* %base, i64 %num_elements, i64 %element_size, i32 (i8*, i8*)* %comparer) nounwind uwtable {
entry:
  %cmp1 = icmp ult i64 %num_elements, 2
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %if.end, %entry
  %num_elements.tr.lcssa = phi i64 [ %num_elements, %entry ], [ %sub, %if.end ]
  %base.tr.lcssa = phi i8* [ %base, %entry ], [ %add.ptr, %if.end ]
  tail call void @insertion_sort(i8* %base.tr.lcssa, i64 %num_elements.tr.lcssa, i64 %element_size, i32 (i8*, i8*)* %comparer)
  ret void

if.end:                                           ; preds = %entry, %if.end
  %num_elements.tr3 = phi i64 [ %sub, %if.end ], [ %num_elements, %entry ]
  %base.tr2 = phi i8* [ %add.ptr, %if.end ], [ %base, %entry ]
  %call = tail call i32 @rand() nounwind
  %conv = sext i32 %call to i64
  %rem = urem i64 %conv, %num_elements.tr3
  %conv6 = trunc i64 %rem to i32
  %call12 = tail call i32 @partition(i8* %base.tr2, i64 %num_elements.tr3, i64 %element_size, i32 (i8*, i8*)* %comparer, i32 %conv6)
  %conv15 = sext i32 %call12 to i64
  tail call void @quicksort(i8* %base.tr2, i64 %conv15, i64 %element_size, i32 (i8*, i8*)* %comparer)
  %add = add nsw i32 %call12, 1
  %conv21 = sext i32 %add to i64
  %mul = mul i64 %conv21, %element_size
  %add.ptr = getelementptr inbounds i8* %base.tr2, i64 %mul
  %sub = sub i64 %num_elements.tr3, %conv21
  %cmp = icmp ult i64 %sub, 2
  br i1 %cmp, label %if.then, label %if.end
}

declare i32 @rand() nounwind

define i32 @compare_int(i8* nocapture %left, i8* nocapture %right) nounwind uwtable readonly {
entry:
  %0 = bitcast i8* %left to i32*
  %tmp1 = load i32* %0, align 4
  %1 = bitcast i8* %right to i32*
  %tmp3 = load i32* %1, align 4
  %sub = sub nsw i32 %tmp1, %tmp3
  ret i32 %sub
}

define i32 @main() nounwind uwtable {
entry:
  %call = tail call noalias i8* @malloc(i64 32) nounwind
  %arrayidx = bitcast i8* %call to i32*
  %call5 = tail call i32 @rand() nounwind
  %rem = srem i32 %call5, 8
  store i32 %rem, i32* %arrayidx, align 4
  %scevgep13.1 = getelementptr i8* %call, i64 4
  %arrayidx.1 = bitcast i8* %scevgep13.1 to i32*
  %call5.1 = tail call i32 @rand() nounwind
  %rem.1 = srem i32 %call5.1, 8
  store i32 %rem.1, i32* %arrayidx.1, align 4
  %scevgep13.2 = getelementptr i8* %call, i64 8
  %arrayidx.2 = bitcast i8* %scevgep13.2 to i32*
  %call5.2 = tail call i32 @rand() nounwind
  %rem.2 = srem i32 %call5.2, 8
  store i32 %rem.2, i32* %arrayidx.2, align 4
  %scevgep13.3 = getelementptr i8* %call, i64 12
  %arrayidx.3 = bitcast i8* %scevgep13.3 to i32*
  %call5.3 = tail call i32 @rand() nounwind
  %rem.3 = srem i32 %call5.3, 8
  store i32 %rem.3, i32* %arrayidx.3, align 4
  %scevgep13.4 = getelementptr i8* %call, i64 16
  %arrayidx.4 = bitcast i8* %scevgep13.4 to i32*
  %call5.4 = tail call i32 @rand() nounwind
  %rem.4 = srem i32 %call5.4, 8
  store i32 %rem.4, i32* %arrayidx.4, align 4
  %scevgep13.5 = getelementptr i8* %call, i64 20
  %arrayidx.5 = bitcast i8* %scevgep13.5 to i32*
  %call5.5 = tail call i32 @rand() nounwind
  %rem.5 = srem i32 %call5.5, 8
  store i32 %rem.5, i32* %arrayidx.5, align 4
  %scevgep13.6 = getelementptr i8* %call, i64 24
  %arrayidx.6 = bitcast i8* %scevgep13.6 to i32*
  %call5.6 = tail call i32 @rand() nounwind
  %rem.6 = srem i32 %call5.6, 8
  store i32 %rem.6, i32* %arrayidx.6, align 4
  %scevgep13.7 = getelementptr i8* %call, i64 28
  %arrayidx.7 = bitcast i8* %scevgep13.7 to i32*
  %call5.7 = tail call i32 @rand() nounwind
  %rem.7 = srem i32 %call5.7, 8
  store i32 %rem.7, i32* %arrayidx.7, align 4
  tail call void @quicksort(i8* %call, i64 8, i64 4, i32 (i8*, i8*)* @compare_int)
  br label %for.cond13

for.cond13:                                       ; preds = %for.body18, %entry
  %indvar = phi i64 [ 0, %entry ], [ %tmp8, %for.body18 ]
  %tmp = shl i64 %indvar, 2
  %tmp8 = add i64 %indvar, 1
  %storemerge1 = trunc i64 %tmp8 to i32
  %cmp16 = icmp slt i32 %storemerge1, 8
  br i1 %cmp16, label %for.body18, label %for.end35

for.body18:                                       ; preds = %for.cond13
  %tmp5 = add i64 %tmp, 4
  %scevgep6 = getelementptr i8* %call, i64 %tmp5
  %scevgep = getelementptr i8* %call, i64 %tmp
  %arrayidx27 = bitcast i8* %scevgep6 to i32*
  %arrayidx22 = bitcast i8* %scevgep to i32*
  %tmp23 = load i32* %arrayidx22, align 4
  %tmp28 = load i32* %arrayidx27, align 4
  %cmp29 = icmp sgt i32 %tmp23, %tmp28
  br i1 %cmp29, label %if.then, label %for.cond13

if.then:                                          ; preds = %for.body18
  %call31 = tail call i32 @puts(i8* getelementptr inbounds ([6 x i8]* @.str, i64 0, i64 0)) nounwind
  br label %return

for.end35:                                        ; preds = %for.cond13
  %call36 = tail call i32 @puts(i8* getelementptr inbounds ([8 x i8]* @.str1, i64 0, i64 0)) nounwind
  br label %return

return:                                           ; preds = %for.end35, %if.then
  %storemerge2 = phi i32 [ -1, %if.then ], [ 0, %for.end35 ]
  ret i32 %storemerge2
}

declare noalias i8* @malloc(i64) nounwind

declare i32 @puts(i8* nocapture) nounwind
