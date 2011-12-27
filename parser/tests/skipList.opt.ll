; ModuleID = '/home/grosu/celliso2/c-semantics/tests/integration/skipList.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.SkipSet = type { %struct.sn*, i32 }
%struct.sn = type { i32, %struct.sn** }

@random_level.first.b = internal unnamed_addr global i1 false
@.str1 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@str = internal constant [2 x i8] c"}\00"
@str1 = internal constant [17 x i8] c"7 is in the list\00"
@str2 = internal constant [19 x i8] c"7 has been deleted\00"

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

define float @frand() nounwind uwtable {
entry:
  %call = tail call i32 @rand() nounwind
  %conv = sitofp i32 %call to float
  %div = fmul float %conv, 0x3E00000000000000
  ret float %div
}

declare i32 @rand() nounwind

define i32 @random_level() nounwind uwtable {
entry:
  %tmp.b = load i1* @random_level.first.b, align 1
  br i1 %tmp.b, label %while.cond.preheader, label %if.then

if.then:                                          ; preds = %entry
  store i1 true, i1* @random_level.first.b, align 1
  br label %while.cond.preheader

while.cond.preheader:                             ; preds = %entry, %if.then
  %call.i2 = tail call i32 @rand() nounwind
  %conv.i3 = sitofp i32 %call.i2 to float
  %div.i4 = fmul float %conv.i3, 0x3E00000000000000
  %cmp5 = fcmp olt float %div.i4, 5.000000e-01
  br i1 %cmp5, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond.preheader, %while.body
  %inc16 = phi i32 [ %inc, %while.body ], [ 0, %while.cond.preheader ]
  %inc = add i32 %inc16, 1
  %call.i = tail call i32 @rand() nounwind
  %conv.i = sitofp i32 %call.i to float
  %div.i = fmul float %conv.i, 0x3E00000000000000
  %cmp = fcmp olt float %div.i, 5.000000e-01
  %cmp3 = icmp slt i32 %inc, 6
  %or.cond = and i1 %cmp, %cmp3
  br i1 %or.cond, label %while.body, label %while.end

while.end:                                        ; preds = %while.body, %while.cond.preheader
  %inc1.lcssa = phi i32 [ 0, %while.cond.preheader ], [ %inc, %while.body ]
  ret i32 %inc1.lcssa
}

define %struct.sn* @make_node(i32 %level, i32 %value) nounwind uwtable {
entry:
  %call = tail call noalias i8* @malloc(i64 16) nounwind
  %0 = bitcast i8* %call to %struct.sn*
  %add = add nsw i32 %level, 1
  %conv = sext i32 %add to i64
  %mul = shl nsw i64 %conv, 3
  %call1 = tail call noalias i8* @malloc(i64 %mul) nounwind
  %1 = bitcast i8* %call1 to %struct.sn**
  %forward = getelementptr inbounds i8* %call, i64 8
  %2 = bitcast i8* %forward to %struct.sn***
  store %struct.sn** %1, %struct.sn*** %2, align 8
  %cmp1 = icmp sgt i32 %add, 0
  br i1 %cmp1, label %for.body.lr.ph, label %for.end

for.body.lr.ph:                                   ; preds = %entry
  %tmp7 = zext i32 %level to i64
  %tmp8 = shl nuw nsw i64 %tmp7, 3
  %tmp9 = add i64 %tmp8, 8
  call void @llvm.memset.p0i8.i64(i8* %call1, i8 0, i64 %tmp9, i32 8, i1 false)
  br label %for.end

for.end:                                          ; preds = %for.body.lr.ph, %entry
  %value15 = bitcast i8* %call to i32*
  store i32 %value, i32* %value15, align 4
  ret %struct.sn* %0
}

declare noalias i8* @malloc(i64) nounwind

define %struct.SkipSet* @make_skipset() nounwind uwtable {
entry:
  %call = tail call noalias i8* @malloc(i64 16) nounwind
  %0 = bitcast i8* %call to %struct.SkipSet*
  %call.i = tail call noalias i8* @malloc(i64 16) nounwind
  %1 = bitcast i8* %call.i to %struct.sn*
  %call1.i = tail call noalias i8* @malloc(i64 56) nounwind
  %2 = bitcast i8* %call1.i to %struct.sn**
  %forward.i = getelementptr inbounds i8* %call.i, i64 8
  %3 = bitcast i8* %forward.i to %struct.sn***
  store %struct.sn** %2, %struct.sn*** %3, align 8
  tail call void @llvm.memset.p0i8.i64(i8* %call1.i, i8 0, i64 56, i32 8, i1 false) nounwind
  %value15.i = bitcast i8* %call.i to i32*
  store i32 0, i32* %value15.i, align 4
  %header = bitcast i8* %call to %struct.sn**
  store %struct.sn* %1, %struct.sn** %header, align 8
  %level = getelementptr inbounds i8* %call, i64 8
  %4 = bitcast i8* %level to i32*
  store i32 0, i32* %4, align 4
  ret %struct.SkipSet* %0
}

define void @print_skipset(%struct.SkipSet* nocapture %ss) nounwind uwtable {
entry:
  %header = getelementptr inbounds %struct.SkipSet* %ss, i64 0, i32 0
  %tmp1 = load %struct.sn** %header, align 8
  %forward = getelementptr inbounds %struct.sn* %tmp1, i64 0, i32 1
  %tmp2 = load %struct.sn*** %forward, align 8
  %tmp3 = load %struct.sn** %tmp2, align 8
  %putchar = tail call i32 @putchar(i32 123) nounwind
  %cmp3 = icmp eq %struct.sn* %tmp3, null
  br i1 %cmp3, label %while.end, label %while.body

while.body:                                       ; preds = %while.cond.backedge, %entry
  %tmp1214 = phi %struct.sn* [ %tmp12, %while.cond.backedge ], [ %tmp3, %entry ]
  %value = getelementptr inbounds %struct.sn* %tmp1214, i64 0, i32 0
  %tmp6 = load i32* %value, align 4
  %call7 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str1, i64 0, i64 0), i32 %tmp6) nounwind
  %forward9 = getelementptr inbounds %struct.sn* %tmp1214, i64 0, i32 1
  %tmp10 = load %struct.sn*** %forward9, align 8
  %tmp12 = load %struct.sn** %tmp10, align 8
  %cmp14 = icmp eq %struct.sn* %tmp12, null
  br i1 %cmp14, label %while.end, label %while.cond.backedge

while.cond.backedge:                              ; preds = %while.body
  %putchar2 = tail call i32 @putchar(i32 44) nounwind
  br label %while.body

while.end:                                        ; preds = %while.body, %entry
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([2 x i8]* @str, i64 0, i64 0))
  ret void
}

declare i32 @printf(i8* nocapture, ...) nounwind

define i32 @contains(%struct.SkipSet* nocapture %ss, i32 %search_value) nounwind uwtable readonly {
entry:
  %header = getelementptr inbounds %struct.SkipSet* %ss, i64 0, i32 0
  %tmp1 = load %struct.sn** %header, align 8
  %level = getelementptr inbounds %struct.SkipSet* %ss, i64 0, i32 1
  %tmp3 = load i32* %level, align 4
  %cmp4 = icmp sgt i32 %tmp3, -1
  br i1 %cmp4, label %while.cond.preheader.lr.ph, label %entry.for.end_crit_edge

entry.for.end_crit_edge:                          ; preds = %entry
  %forward29.phi.trans.insert = getelementptr inbounds %struct.sn* %tmp1, i64 0, i32 1
  %tmp30.pre = load %struct.sn*** %forward29.phi.trans.insert, align 8
  br label %for.end

while.cond.preheader.lr.ph:                       ; preds = %entry
  %tmp = xor i32 %tmp3, -1
  %tmp9 = icmp sgt i32 %tmp, -1
  %smax = select i1 %tmp9, i32 %tmp, i32 -1
  %tmp10 = add i32 %tmp3, %smax
  %tmp11 = add i32 %tmp10, 1
  %tmp12 = zext i32 %tmp11 to i64
  %tmp13 = add i64 %tmp12, 1
  %tmp19 = sext i32 %tmp3 to i64
  br label %while.cond.preheader

while.cond.preheader:                             ; preds = %for.inc, %while.cond.preheader.lr.ph
  %indvar = phi i64 [ 0, %while.cond.preheader.lr.ph ], [ %indvar.next, %for.inc ]
  %tmp3535 = phi %struct.sn* [ %tmp1, %while.cond.preheader.lr.ph ], [ %tmp352, %for.inc ]
  %tmp20 = sub i64 %tmp19, %indvar
  br label %while.cond

while.cond:                                       ; preds = %while.cond.preheader, %land.rhs
  %tmp352 = phi %struct.sn* [ %tmp8, %land.rhs ], [ %tmp3535, %while.cond.preheader ]
  %forward = getelementptr inbounds %struct.sn* %tmp352, i64 0, i32 1
  %tmp7 = load %struct.sn*** %forward, align 8
  %arrayidx = getelementptr %struct.sn** %tmp7, i64 %tmp20
  %tmp8 = load %struct.sn** %arrayidx, align 8
  %cmp9 = icmp eq %struct.sn* %tmp8, null
  br i1 %cmp9, label %for.inc, label %land.rhs

land.rhs:                                         ; preds = %while.cond
  %value = getelementptr inbounds %struct.sn* %tmp8, i64 0, i32 0
  %tmp17 = load i32* %value, align 4
  %cmp19 = icmp slt i32 %tmp17, %search_value
  br i1 %cmp19, label %while.cond, label %for.inc

for.inc:                                          ; preds = %land.rhs, %while.cond
  %indvar.next = add i64 %indvar, 1
  %exitcond = icmp eq i64 %indvar.next, %tmp13
  br i1 %exitcond, label %for.end, label %while.cond.preheader

for.end:                                          ; preds = %for.inc, %entry.for.end_crit_edge
  %tmp30 = phi %struct.sn** [ %tmp30.pre, %entry.for.end_crit_edge ], [ %tmp7, %for.inc ]
  %tmp32 = load %struct.sn** %tmp30, align 8
  %cmp34 = icmp eq %struct.sn* %tmp32, null
  br i1 %cmp34, label %if.end, label %land.lhs.true

land.lhs.true:                                    ; preds = %for.end
  %value36 = getelementptr inbounds %struct.sn* %tmp32, i64 0, i32 0
  %tmp37 = load i32* %value36, align 4
  %cmp39 = icmp eq i32 %tmp37, %search_value
  br i1 %cmp39, label %return, label %if.end

if.end:                                           ; preds = %for.end, %land.lhs.true
  br label %return

return:                                           ; preds = %land.lhs.true, %if.end
  %storemerge1 = phi i32 [ 0, %if.end ], [ 1, %land.lhs.true ]
  ret i32 %storemerge1
}

define void @insert(%struct.SkipSet* %ss, i32 %value) nounwind uwtable {
entry:
  %update = alloca [7 x %struct.sn*], align 16
  %header = getelementptr inbounds %struct.SkipSet* %ss, i64 0, i32 0
  %tmp1 = load %struct.sn** %header, align 8
  %0 = bitcast [7 x %struct.sn*]* %update to i8*
  call void @llvm.memset.p0i8.i64(i8* %0, i8 0, i64 7, i32 16, i1 false)
  %level = getelementptr inbounds %struct.SkipSet* %ss, i64 0, i32 1
  %tmp4 = load i32* %level, align 4
  %cmp11 = icmp sgt i32 %tmp4, -1
  br i1 %cmp11, label %while.cond.preheader.lr.ph, label %for.end

while.cond.preheader.lr.ph:                       ; preds = %entry
  %tmp30 = xor i32 %tmp4, -1
  %tmp31 = icmp sgt i32 %tmp30, -1
  %smax = select i1 %tmp31, i32 %tmp30, i32 -1
  %tmp32 = add i32 %tmp4, %smax
  %tmp33 = add i32 %tmp32, 1
  %tmp34 = zext i32 %tmp33 to i64
  %tmp35 = add i64 %tmp34, 1
  %tmp42 = sext i32 %tmp4 to i64
  br label %while.cond.preheader

while.cond.preheader:                             ; preds = %while.end, %while.cond.preheader.lr.ph
  %indvar28 = phi i64 [ 0, %while.cond.preheader.lr.ph ], [ %indvar.next29, %while.end ]
  %tmp99412 = phi %struct.sn* [ %tmp1, %while.cond.preheader.lr.ph ], [ %tmp993, %while.end ]
  %tmp43 = sub i64 %tmp42, %indvar28
  %arrayidx32 = getelementptr [7 x %struct.sn*]* %update, i64 0, i64 %tmp43
  br label %while.cond

while.cond:                                       ; preds = %while.cond.preheader, %land.rhs
  %tmp993 = phi %struct.sn* [ %tmp9, %land.rhs ], [ %tmp99412, %while.cond.preheader ]
  %forward = getelementptr inbounds %struct.sn* %tmp993, i64 0, i32 1
  %tmp8 = load %struct.sn*** %forward, align 8
  %arrayidx = getelementptr %struct.sn** %tmp8, i64 %tmp43
  %tmp9 = load %struct.sn** %arrayidx, align 8
  %cmp10 = icmp eq %struct.sn* %tmp9, null
  br i1 %cmp10, label %while.end, label %land.rhs

land.rhs:                                         ; preds = %while.cond
  %value18 = getelementptr inbounds %struct.sn* %tmp9, i64 0, i32 0
  %tmp19 = load i32* %value18, align 4
  %cmp21 = icmp slt i32 %tmp19, %value
  br i1 %cmp21, label %while.cond, label %while.end

while.end:                                        ; preds = %while.cond, %land.rhs
  store %struct.sn* %tmp993, %struct.sn** %arrayidx32, align 8
  %indvar.next29 = add i64 %indvar28, 1
  %exitcond36 = icmp eq i64 %indvar.next29, %tmp35
  br i1 %exitcond36, label %for.end, label %while.cond.preheader

for.end:                                          ; preds = %while.end, %entry
  %tmp994.lcssa = phi %struct.sn* [ %tmp1, %entry ], [ %tmp993, %while.end ]
  %forward35 = getelementptr inbounds %struct.sn* %tmp994.lcssa, i64 0, i32 1
  %tmp36 = load %struct.sn*** %forward35, align 8
  %tmp38 = load %struct.sn** %tmp36, align 8
  %cmp41 = icmp eq %struct.sn* %tmp38, null
  br i1 %cmp41, label %if.then, label %lor.rhs

lor.rhs:                                          ; preds = %for.end
  %value43 = getelementptr inbounds %struct.sn* %tmp38, i64 0, i32 0
  %tmp44 = load i32* %value43, align 4
  %cmp46 = icmp eq i32 %tmp44, %value
  br i1 %cmp46, label %if.end113, label %if.then

if.then:                                          ; preds = %lor.rhs, %for.end
  %tmp.b.i = load i1* @random_level.first.b, align 1
  br i1 %tmp.b.i, label %while.cond.preheader.i, label %if.then.i

if.then.i:                                        ; preds = %if.then
  store i1 true, i1* @random_level.first.b, align 1
  br label %while.cond.preheader.i

while.cond.preheader.i:                           ; preds = %if.then.i, %if.then
  %call.i2.i = call i32 @rand() nounwind
  %conv.i3.i = sitofp i32 %call.i2.i to float
  %div.i4.i = fmul float %conv.i3.i, 0x3E00000000000000
  %cmp5.i = fcmp olt float %div.i4.i, 5.000000e-01
  br i1 %cmp5.i, label %while.body.i, label %random_level.exit

while.body.i:                                     ; preds = %while.cond.preheader.i, %while.body.i
  %inc16.i = phi i32 [ %inc.i, %while.body.i ], [ 0, %while.cond.preheader.i ]
  %inc.i = add i32 %inc16.i, 1
  %call.i.i = call i32 @rand() nounwind
  %conv.i.i = sitofp i32 %call.i.i to float
  %div.i.i = fmul float %conv.i.i, 0x3E00000000000000
  %cmp.i = fcmp olt float %div.i.i, 5.000000e-01
  %cmp3.i = icmp slt i32 %inc.i, 6
  %or.cond.i = and i1 %cmp.i, %cmp3.i
  br i1 %or.cond.i, label %while.body.i, label %random_level.exit

random_level.exit:                                ; preds = %while.body.i, %while.cond.preheader.i
  %inc1.lcssa.i = phi i32 [ 0, %while.cond.preheader.i ], [ %inc.i, %while.body.i ]
  %tmp52 = load i32* %level, align 4
  %cmp53 = icmp sgt i32 %inc1.lcssa.i, %tmp52
  br i1 %cmp53, label %for.cond58.preheader, label %if.end

for.cond58.preheader:                             ; preds = %random_level.exit
  %storemerge27 = add nsw i32 %tmp52, 1
  %cmp618 = icmp sgt i32 %storemerge27, %inc1.lcssa.i
  br i1 %cmp618, label %for.end71, label %for.body62.lr.ph

for.body62.lr.ph:                                 ; preds = %for.cond58.preheader
  %tmp65 = load %struct.sn** %header, align 8
  %tmp20 = add i32 %tmp52, 2
  %tmp21 = zext i32 %tmp20 to i64
  %tmp24 = sext i32 %tmp52 to i64
  %tmp25 = add i64 %tmp24, 1
  br label %for.body62

for.body62:                                       ; preds = %for.body62.lr.ph, %for.body62
  %indvar17 = phi i64 [ 0, %for.body62.lr.ph ], [ %indvar.next18, %for.body62 ]
  %tmp22 = add i64 %tmp21, %indvar17
  %storemerge2 = trunc i64 %tmp22 to i32
  %tmp26 = add i64 %tmp25, %indvar17
  %arrayidx68 = getelementptr [7 x %struct.sn*]* %update, i64 0, i64 %tmp26
  store %struct.sn* %tmp65, %struct.sn** %arrayidx68, align 8
  %cmp61 = icmp sgt i32 %storemerge2, %inc1.lcssa.i
  %indvar.next18 = add i64 %indvar17, 1
  br i1 %cmp61, label %for.end71, label %for.body62

for.end71:                                        ; preds = %for.body62, %for.cond58.preheader
  store i32 %inc1.lcssa.i, i32* %level, align 4
  br label %if.end

if.end:                                           ; preds = %for.end71, %random_level.exit
  %call.i = call noalias i8* @malloc(i64 16) nounwind
  %1 = bitcast i8* %call.i to %struct.sn*
  %add.i = add nsw i32 %inc1.lcssa.i, 1
  %conv.i = sext i32 %add.i to i64
  %mul.i = shl nsw i64 %conv.i, 3
  %call1.i = call noalias i8* @malloc(i64 %mul.i) nounwind
  %2 = bitcast i8* %call1.i to %struct.sn**
  %forward.i = getelementptr inbounds i8* %call.i, i64 8
  %3 = bitcast i8* %forward.i to %struct.sn***
  store %struct.sn** %2, %struct.sn*** %3, align 8
  %cmp1.i = icmp sgt i32 %add.i, 0
  br i1 %cmp1.i, label %for.body.lr.ph.i, label %make_node.exit

for.body.lr.ph.i:                                 ; preds = %if.end
  %tmp7.i = zext i32 %inc1.lcssa.i to i64
  %tmp8.i = shl nuw nsw i64 %tmp7.i, 3
  %tmp9.i = add i64 %tmp8.i, 8
  call void @llvm.memset.p0i8.i64(i8* %call1.i, i8 0, i64 %tmp9.i, i32 8, i1 false) nounwind
  br label %make_node.exit

make_node.exit:                                   ; preds = %if.end, %for.body.lr.ph.i
  %value15.i = bitcast i8* %call.i to i32*
  store i32 %value, i32* %value15.i, align 4
  %cmp815 = icmp slt i32 %inc1.lcssa.i, 0
  br i1 %cmp815, label %if.end113, label %for.body82.lr.ph

for.body82.lr.ph:                                 ; preds = %make_node.exit
  %tmp = zext i32 %inc1.lcssa.i to i64
  %tmp14 = add i64 %tmp, 1
  br label %for.body82

for.body82:                                       ; preds = %for.body82.for.body82_crit_edge, %for.body82.lr.ph
  %tmp97 = phi %struct.sn** [ %2, %for.body82.lr.ph ], [ %tmp97.pre, %for.body82.for.body82_crit_edge ]
  %indvar = phi i64 [ 0, %for.body82.lr.ph ], [ %indvar.next, %for.body82.for.body82_crit_edge ]
  %arrayidx87 = getelementptr [7 x %struct.sn*]* %update, i64 0, i64 %indvar
  %tmp88 = load %struct.sn** %arrayidx87, align 8
  %forward89 = getelementptr inbounds %struct.sn* %tmp88, i64 0, i32 1
  %tmp90 = load %struct.sn*** %forward89, align 8
  %arrayidx91 = getelementptr %struct.sn** %tmp90, i64 %indvar
  %tmp92 = load %struct.sn** %arrayidx91, align 8
  %arrayidx98 = getelementptr %struct.sn** %tmp97, i64 %indvar
  store %struct.sn* %tmp92, %struct.sn** %arrayidx98, align 8
  %tmp107 = load %struct.sn*** %forward89, align 8
  %arrayidx108 = getelementptr %struct.sn** %tmp107, i64 %indvar
  store %struct.sn* %1, %struct.sn** %arrayidx108, align 8
  %indvar.next = add i64 %indvar, 1
  %exitcond = icmp eq i64 %indvar.next, %tmp14
  br i1 %exitcond, label %if.end113, label %for.body82.for.body82_crit_edge

for.body82.for.body82_crit_edge:                  ; preds = %for.body82
  %tmp97.pre = load %struct.sn*** %3, align 8
  br label %for.body82

if.end113:                                        ; preds = %make_node.exit, %for.body82, %lor.rhs
  ret void
}

declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) nounwind

define void @delete(%struct.SkipSet* %ss, i32 %value) nounwind uwtable {
entry:
  %update = alloca [7 x %struct.sn*], align 16
  %header = getelementptr inbounds %struct.SkipSet* %ss, i64 0, i32 0
  %tmp1 = load %struct.sn** %header, align 8
  %0 = bitcast [7 x %struct.sn*]* %update to i8*
  call void @llvm.memset.p0i8.i64(i8* %0, i8 0, i64 7, i32 16, i1 false)
  %level = getelementptr inbounds %struct.SkipSet* %ss, i64 0, i32 1
  %tmp4 = load i32* %level, align 4
  %cmp4 = icmp sgt i32 %tmp4, -1
  br i1 %cmp4, label %while.cond.preheader.lr.ph, label %for.end

while.cond.preheader.lr.ph:                       ; preds = %entry
  %tmp23 = xor i32 %tmp4, -1
  %tmp24 = icmp sgt i32 %tmp23, -1
  %smax = select i1 %tmp24, i32 %tmp23, i32 -1
  %tmp25 = add i32 %tmp4, %smax
  %tmp26 = add i32 %tmp25, 1
  %tmp27 = zext i32 %tmp26 to i64
  %tmp28 = add i64 %tmp27, 1
  %tmp33 = sext i32 %tmp4 to i64
  br label %while.cond.preheader

while.cond.preheader:                             ; preds = %while.end, %while.cond.preheader.lr.ph
  %indvar21 = phi i64 [ 0, %while.cond.preheader.lr.ph ], [ %indvar.next22, %while.end ]
  %tmp8335 = phi %struct.sn* [ %tmp1, %while.cond.preheader.lr.ph ], [ %tmp832, %while.end ]
  %tmp34 = sub i64 %tmp33, %indvar21
  %arrayidx32 = getelementptr [7 x %struct.sn*]* %update, i64 0, i64 %tmp34
  br label %while.cond

while.cond:                                       ; preds = %while.cond.preheader, %land.rhs
  %tmp832 = phi %struct.sn* [ %tmp9, %land.rhs ], [ %tmp8335, %while.cond.preheader ]
  %forward = getelementptr inbounds %struct.sn* %tmp832, i64 0, i32 1
  %tmp8 = load %struct.sn*** %forward, align 8
  %arrayidx = getelementptr %struct.sn** %tmp8, i64 %tmp34
  %tmp9 = load %struct.sn** %arrayidx, align 8
  %cmp10 = icmp eq %struct.sn* %tmp9, null
  br i1 %cmp10, label %while.end, label %land.rhs

land.rhs:                                         ; preds = %while.cond
  %value18 = getelementptr inbounds %struct.sn* %tmp9, i64 0, i32 0
  %tmp19 = load i32* %value18, align 4
  %cmp21 = icmp slt i32 %tmp19, %value
  br i1 %cmp21, label %while.cond, label %while.end

while.end:                                        ; preds = %while.cond, %land.rhs
  store %struct.sn* %tmp832, %struct.sn** %arrayidx32, align 8
  %indvar.next22 = add i64 %indvar21, 1
  %exitcond = icmp eq i64 %indvar.next22, %tmp28
  br i1 %exitcond, label %for.end, label %while.cond.preheader

for.end:                                          ; preds = %while.end, %entry
  %tmp833.lcssa = phi %struct.sn* [ %tmp1, %entry ], [ %tmp832, %while.end ]
  %forward35 = getelementptr inbounds %struct.sn* %tmp833.lcssa, i64 0, i32 1
  %tmp36 = load %struct.sn*** %forward35, align 8
  %tmp38 = load %struct.sn** %tmp36, align 8
  %value40 = getelementptr inbounds %struct.sn* %tmp38, i64 0, i32 0
  %tmp41 = load i32* %value40, align 4
  %cmp43 = icmp eq i32 %tmp41, %value
  br i1 %cmp43, label %for.cond44.preheader, label %if.end109

for.cond44.preheader:                             ; preds = %for.end
  %forward67 = getelementptr inbounds %struct.sn* %tmp38, i64 0, i32 1
  br label %for.cond44

for.cond44:                                       ; preds = %for.cond44.preheader, %if.end
  %tmp48 = phi i32 [ %tmp4, %for.cond44.preheader ], [ %tmp48.pre, %if.end ]
  %indvar18 = phi i64 [ 0, %for.cond44.preheader ], [ %indvar.next19, %if.end ]
  %storemerge1 = trunc i64 %indvar18 to i32
  %cmp49 = icmp sgt i32 %storemerge1, %tmp48
  br i1 %cmp49, label %for.end82, label %for.body50

for.body50:                                       ; preds = %for.cond44
  %arrayidx55 = getelementptr [7 x %struct.sn*]* %update, i64 0, i64 %indvar18
  %tmp56 = load %struct.sn** %arrayidx55, align 8
  %forward57 = getelementptr inbounds %struct.sn* %tmp56, i64 0, i32 1
  %tmp58 = load %struct.sn*** %forward57, align 8
  %scevgep = getelementptr %struct.sn** %tmp58, i64 %indvar18
  %tmp60 = load %struct.sn** %scevgep, align 8
  %cmp62 = icmp eq %struct.sn* %tmp60, %tmp38
  br i1 %cmp62, label %if.end, label %for.end82

if.end:                                           ; preds = %for.body50
  %tmp68 = load %struct.sn*** %forward67, align 8
  %arrayidx69 = getelementptr %struct.sn** %tmp68, i64 %indvar18
  %tmp70 = load %struct.sn** %arrayidx69, align 8
  store %struct.sn* %tmp70, %struct.sn** %scevgep, align 8
  %indvar.next19 = add i64 %indvar18, 1
  %tmp48.pre = load i32* %level, align 4
  br label %for.cond44

for.end82:                                        ; preds = %for.body50, %for.cond44
  %1 = bitcast %struct.sn* %tmp38 to i8*
  call void @free(i8* %1) nounwind
  %tmp87.pr = load i32* %level, align 4
  %tmp7 = add i32 %tmp87.pr, -1
  %tmp10 = zext i32 %tmp7 to i64
  %tmp13 = zext i32 %tmp87.pr to i64
  %tmp16 = sext i32 %tmp87.pr to i64
  br label %while.cond84

while.cond84:                                     ; preds = %while.body103, %for.end82
  %indvar = phi i64 [ %indvar.next, %while.body103 ], [ 0, %for.end82 ]
  %tmp11 = sub i64 %tmp10, %indvar
  %dec107 = trunc i64 %tmp11 to i32
  %tmp14 = sub i64 %tmp13, %indvar
  %tmp87 = trunc i64 %tmp14 to i32
  %cmp88 = icmp sgt i32 %tmp87, 0
  br i1 %cmp88, label %land.rhs89, label %if.end109

land.rhs89:                                       ; preds = %while.cond84
  %tmp17 = sub i64 %tmp16, %indvar
  %tmp96 = load %struct.sn** %header, align 8
  %forward97 = getelementptr inbounds %struct.sn* %tmp96, i64 0, i32 1
  %tmp98 = load %struct.sn*** %forward97, align 8
  %arrayidx99 = getelementptr %struct.sn** %tmp98, i64 %tmp17
  %tmp100 = load %struct.sn** %arrayidx99, align 8
  %cmp101 = icmp eq %struct.sn* %tmp100, null
  br i1 %cmp101, label %while.body103, label %if.end109

while.body103:                                    ; preds = %land.rhs89
  store i32 %dec107, i32* %level, align 4
  %indvar.next = add i64 %indvar, 1
  br label %while.cond84

if.end109:                                        ; preds = %land.rhs89, %while.cond84, %for.end
  ret void
}

declare void @free(i8* nocapture) nounwind

define i32 @main() nounwind uwtable {
print_skipset.exit:
  %call.i = tail call noalias i8* @malloc(i64 16) nounwind
  %0 = bitcast i8* %call.i to %struct.SkipSet*
  %call.i.i = tail call noalias i8* @malloc(i64 16) nounwind
  %1 = bitcast i8* %call.i.i to %struct.sn*
  %call1.i.i = tail call noalias i8* @malloc(i64 56) nounwind
  %2 = bitcast i8* %call1.i.i to %struct.sn**
  %forward.i.i = getelementptr inbounds i8* %call.i.i, i64 8
  %3 = bitcast i8* %forward.i.i to %struct.sn***
  store %struct.sn** %2, %struct.sn*** %3, align 8
  tail call void @llvm.memset.p0i8.i64(i8* %call1.i.i, i8 0, i64 56, i32 8, i1 false) nounwind
  %value15.i.i = bitcast i8* %call.i.i to i32*
  store i32 0, i32* %value15.i.i, align 4
  %header.i = bitcast i8* %call.i to %struct.sn**
  store %struct.sn* %1, %struct.sn** %header.i, align 8
  %level.i = getelementptr inbounds i8* %call.i, i64 8
  %4 = bitcast i8* %level.i to i32*
  store i32 0, i32* %4, align 4
  %putchar.i = tail call i32 @putchar(i32 123) nounwind
  %puts.i = tail call i32 @puts(i8* getelementptr inbounds ([2 x i8]* @str, i64 0, i64 0)) nounwind
  tail call void @insert(%struct.SkipSet* %0, i32 5)
  tail call void @insert(%struct.SkipSet* %0, i32 10)
  tail call void @insert(%struct.SkipSet* %0, i32 7)
  tail call void @insert(%struct.SkipSet* %0, i32 7)
  tail call void @insert(%struct.SkipSet* %0, i32 6)
  %tmp1.i3 = load %struct.sn** %header.i, align 8
  %tmp3.i5 = load i32* %4, align 4
  %cmp4.i = icmp sgt i32 %tmp3.i5, -1
  br i1 %cmp4.i, label %while.cond.preheader.lr.ph.i, label %entry.for.end_crit_edge.i

entry.for.end_crit_edge.i:                        ; preds = %print_skipset.exit
  %forward29.phi.trans.insert.i = getelementptr inbounds %struct.sn* %tmp1.i3, i64 0, i32 1
  %tmp30.pre.i = load %struct.sn*** %forward29.phi.trans.insert.i, align 8
  br label %for.end.i

while.cond.preheader.lr.ph.i:                     ; preds = %print_skipset.exit
  %tmp136 = xor i32 %tmp3.i5, -1
  %tmp137 = icmp sgt i32 %tmp136, -1
  %smax138 = select i1 %tmp137, i32 %tmp136, i32 -1
  %tmp139 = add i32 %tmp3.i5, %smax138
  %tmp140 = add i32 %tmp139, 1
  %tmp141 = zext i32 %tmp140 to i64
  %tmp142 = add i64 %tmp141, 1
  %tmp146 = sext i32 %tmp3.i5 to i64
  br label %while.cond.preheader.i

while.cond.preheader.i:                           ; preds = %for.inc.i, %while.cond.preheader.lr.ph.i
  %indvar.i = phi i64 [ 0, %while.cond.preheader.lr.ph.i ], [ %5, %for.inc.i ]
  %tmp3535.i = phi %struct.sn* [ %tmp1.i3, %while.cond.preheader.lr.ph.i ], [ %tmp352.i, %for.inc.i ]
  %tmp147 = sub i64 %tmp146, %indvar.i
  br label %while.cond.i

while.cond.i:                                     ; preds = %land.rhs.i, %while.cond.preheader.i
  %tmp352.i = phi %struct.sn* [ %tmp8.i, %land.rhs.i ], [ %tmp3535.i, %while.cond.preheader.i ]
  %forward.i8 = getelementptr inbounds %struct.sn* %tmp352.i, i64 0, i32 1
  %tmp7.i = load %struct.sn*** %forward.i8, align 8
  %arrayidx.i = getelementptr %struct.sn** %tmp7.i, i64 %tmp147
  %tmp8.i = load %struct.sn** %arrayidx.i, align 8
  %cmp9.i = icmp eq %struct.sn* %tmp8.i, null
  br i1 %cmp9.i, label %for.inc.i, label %land.rhs.i

land.rhs.i:                                       ; preds = %while.cond.i
  %value.i9 = getelementptr inbounds %struct.sn* %tmp8.i, i64 0, i32 0
  %tmp17.i = load i32* %value.i9, align 4
  %cmp19.i = icmp slt i32 %tmp17.i, 7
  br i1 %cmp19.i, label %while.cond.i, label %for.inc.i

for.inc.i:                                        ; preds = %land.rhs.i, %while.cond.i
  %5 = add i64 %indvar.i, 1
  %exitcond143 = icmp eq i64 %5, %tmp142
  br i1 %exitcond143, label %for.end.i, label %while.cond.preheader.i

for.end.i:                                        ; preds = %for.inc.i, %entry.for.end_crit_edge.i
  %tmp30.i = phi %struct.sn** [ %tmp30.pre.i, %entry.for.end_crit_edge.i ], [ %tmp7.i, %for.inc.i ]
  %tmp32.i = load %struct.sn** %tmp30.i, align 8
  %cmp34.i = icmp eq %struct.sn* %tmp32.i, null
  br i1 %cmp34.i, label %if.end, label %land.lhs.true.i

land.lhs.true.i:                                  ; preds = %for.end.i
  %value36.i = getelementptr inbounds %struct.sn* %tmp32.i, i64 0, i32 0
  %tmp37.i = load i32* %value36.i, align 4
  %cmp39.i = icmp eq i32 %tmp37.i, 7
  br i1 %cmp39.i, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true.i
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([17 x i8]* @str1, i64 0, i64 0))
  %tmp1.i11.pre = load %struct.sn** %header.i, align 8
  br label %if.end

if.end:                                           ; preds = %land.lhs.true.i, %for.end.i, %if.then
  %tmp1.i11 = phi %struct.sn* [ %tmp1.i11.pre, %if.then ], [ %tmp1.i3, %for.end.i ], [ %tmp1.i3, %land.lhs.true.i ]
  %forward.i12 = getelementptr inbounds %struct.sn* %tmp1.i11, i64 0, i32 1
  %tmp2.i13 = load %struct.sn*** %forward.i12, align 8
  %tmp3.i14 = load %struct.sn** %tmp2.i13, align 8
  %putchar.i15 = tail call i32 @putchar(i32 123) nounwind
  %cmp3.i16 = icmp eq %struct.sn* %tmp3.i14, null
  br i1 %cmp3.i16, label %print_skipset.exit29, label %while.body.i25.preheader

while.body.i25.preheader:                         ; preds = %if.end
  %value.i18111 = getelementptr inbounds %struct.sn* %tmp3.i14, i64 0, i32 0
  %tmp6.i19112 = load i32* %value.i18111, align 4
  %call7.i20113 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str1, i64 0, i64 0), i32 %tmp6.i19112) nounwind
  %forward9.i21114 = getelementptr inbounds %struct.sn* %tmp3.i14, i64 0, i32 1
  %tmp10.i22115 = load %struct.sn*** %forward9.i21114, align 8
  %tmp12.i23116 = load %struct.sn** %tmp10.i22115, align 8
  %cmp14.i24117 = icmp eq %struct.sn* %tmp12.i23116, null
  br i1 %cmp14.i24117, label %print_skipset.exit29, label %while.cond.backedge.i27

while.cond.backedge.i27:                          ; preds = %while.body.i25.preheader, %while.cond.backedge.i27
  %tmp12.i23118 = phi %struct.sn* [ %tmp12.i23, %while.cond.backedge.i27 ], [ %tmp12.i23116, %while.body.i25.preheader ]
  %putchar2.i26 = tail call i32 @putchar(i32 44) nounwind
  %value.i18 = getelementptr inbounds %struct.sn* %tmp12.i23118, i64 0, i32 0
  %tmp6.i19 = load i32* %value.i18, align 4
  %call7.i20 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str1, i64 0, i64 0), i32 %tmp6.i19) nounwind
  %forward9.i21 = getelementptr inbounds %struct.sn* %tmp12.i23118, i64 0, i32 1
  %tmp10.i22 = load %struct.sn*** %forward9.i21, align 8
  %tmp12.i23 = load %struct.sn** %tmp10.i22, align 8
  %cmp14.i24 = icmp eq %struct.sn* %tmp12.i23, null
  br i1 %cmp14.i24, label %print_skipset.exit29, label %while.cond.backedge.i27

print_skipset.exit29:                             ; preds = %while.body.i25.preheader, %while.cond.backedge.i27, %if.end
  %puts.i28 = tail call i32 @puts(i8* getelementptr inbounds ([2 x i8]* @str, i64 0, i64 0)) nounwind
  tail call void @delete(%struct.SkipSet* %0, i32 7)
  %tmp1.i31 = load %struct.sn** %header.i, align 8
  %forward.i32 = getelementptr inbounds %struct.sn* %tmp1.i31, i64 0, i32 1
  %tmp2.i33 = load %struct.sn*** %forward.i32, align 8
  %tmp3.i34 = load %struct.sn** %tmp2.i33, align 8
  %putchar.i35 = tail call i32 @putchar(i32 123) nounwind
  %cmp3.i36 = icmp eq %struct.sn* %tmp3.i34, null
  br i1 %cmp3.i36, label %print_skipset.exit49, label %while.body.i45.preheader

while.body.i45.preheader:                         ; preds = %print_skipset.exit29
  %value.i38119 = getelementptr inbounds %struct.sn* %tmp3.i34, i64 0, i32 0
  %tmp6.i39120 = load i32* %value.i38119, align 4
  %call7.i40121 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str1, i64 0, i64 0), i32 %tmp6.i39120) nounwind
  %forward9.i41122 = getelementptr inbounds %struct.sn* %tmp3.i34, i64 0, i32 1
  %tmp10.i42123 = load %struct.sn*** %forward9.i41122, align 8
  %tmp12.i43124 = load %struct.sn** %tmp10.i42123, align 8
  %cmp14.i44125 = icmp eq %struct.sn* %tmp12.i43124, null
  br i1 %cmp14.i44125, label %print_skipset.exit49, label %while.cond.backedge.i47

while.cond.backedge.i47:                          ; preds = %while.body.i45.preheader, %while.cond.backedge.i47
  %tmp12.i43126 = phi %struct.sn* [ %tmp12.i43, %while.cond.backedge.i47 ], [ %tmp12.i43124, %while.body.i45.preheader ]
  %putchar2.i46 = tail call i32 @putchar(i32 44) nounwind
  %value.i38 = getelementptr inbounds %struct.sn* %tmp12.i43126, i64 0, i32 0
  %tmp6.i39 = load i32* %value.i38, align 4
  %call7.i40 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str1, i64 0, i64 0), i32 %tmp6.i39) nounwind
  %forward9.i41 = getelementptr inbounds %struct.sn* %tmp12.i43126, i64 0, i32 1
  %tmp10.i42 = load %struct.sn*** %forward9.i41, align 8
  %tmp12.i43 = load %struct.sn** %tmp10.i42, align 8
  %cmp14.i44 = icmp eq %struct.sn* %tmp12.i43, null
  br i1 %cmp14.i44, label %print_skipset.exit49, label %while.cond.backedge.i47

print_skipset.exit49:                             ; preds = %while.body.i45.preheader, %while.cond.backedge.i47, %print_skipset.exit29
  %puts.i48 = tail call i32 @puts(i8* getelementptr inbounds ([2 x i8]* @str, i64 0, i64 0)) nounwind
  %tmp1.i51 = load %struct.sn** %header.i, align 8
  %tmp3.i53 = load i32* %4, align 4
  %cmp4.i54 = icmp sgt i32 %tmp3.i53, -1
  br i1 %cmp4.i54, label %while.cond.preheader.lr.ph.i66, label %entry.for.end_crit_edge.i57

entry.for.end_crit_edge.i57:                      ; preds = %print_skipset.exit49
  %forward29.phi.trans.insert.i55 = getelementptr inbounds %struct.sn* %tmp1.i51, i64 0, i32 1
  %tmp30.pre.i56 = load %struct.sn*** %forward29.phi.trans.insert.i55, align 8
  br label %for.end.i88

while.cond.preheader.lr.ph.i66:                   ; preds = %print_skipset.exit49
  %tmp = xor i32 %tmp3.i53, -1
  %tmp127 = icmp sgt i32 %tmp, -1
  %smax = select i1 %tmp127, i32 %tmp, i32 -1
  %tmp128 = add i32 %tmp3.i53, %smax
  %tmp129 = add i32 %tmp128, 1
  %tmp130 = zext i32 %tmp129 to i64
  %tmp131 = add i64 %tmp130, 1
  %tmp134 = sext i32 %tmp3.i53 to i64
  br label %while.cond.preheader.i70

while.cond.preheader.i70:                         ; preds = %for.inc.i84, %while.cond.preheader.lr.ph.i66
  %indvar.i67 = phi i64 [ 0, %while.cond.preheader.lr.ph.i66 ], [ %6, %for.inc.i84 ]
  %tmp3535.i68 = phi %struct.sn* [ %tmp1.i51, %while.cond.preheader.lr.ph.i66 ], [ %tmp352.i71, %for.inc.i84 ]
  %tmp135 = sub i64 %tmp134, %indvar.i67
  br label %while.cond.i77

while.cond.i77:                                   ; preds = %land.rhs.i81, %while.cond.preheader.i70
  %tmp352.i71 = phi %struct.sn* [ %tmp8.i75, %land.rhs.i81 ], [ %tmp3535.i68, %while.cond.preheader.i70 ]
  %forward.i72 = getelementptr inbounds %struct.sn* %tmp352.i71, i64 0, i32 1
  %tmp7.i73 = load %struct.sn*** %forward.i72, align 8
  %arrayidx.i74 = getelementptr %struct.sn** %tmp7.i73, i64 %tmp135
  %tmp8.i75 = load %struct.sn** %arrayidx.i74, align 8
  %cmp9.i76 = icmp eq %struct.sn* %tmp8.i75, null
  br i1 %cmp9.i76, label %for.inc.i84, label %land.rhs.i81

land.rhs.i81:                                     ; preds = %while.cond.i77
  %value.i78 = getelementptr inbounds %struct.sn* %tmp8.i75, i64 0, i32 0
  %tmp17.i79 = load i32* %value.i78, align 4
  %cmp19.i80 = icmp slt i32 %tmp17.i79, 7
  br i1 %cmp19.i80, label %while.cond.i77, label %for.inc.i84

for.inc.i84:                                      ; preds = %land.rhs.i81, %while.cond.i77
  %6 = add i64 %indvar.i67, 1
  %exitcond = icmp eq i64 %6, %tmp131
  br i1 %exitcond, label %for.end.i88, label %while.cond.preheader.i70

for.end.i88:                                      ; preds = %for.inc.i84, %entry.for.end_crit_edge.i57
  %tmp30.i85 = phi %struct.sn** [ %tmp30.pre.i56, %entry.for.end_crit_edge.i57 ], [ %tmp7.i73, %for.inc.i84 ]
  %tmp32.i86 = load %struct.sn** %tmp30.i85, align 8
  %cmp34.i87 = icmp eq %struct.sn* %tmp32.i86, null
  br i1 %cmp34.i87, label %if.then15, label %land.lhs.true.i92

land.lhs.true.i92:                                ; preds = %for.end.i88
  %value36.i89 = getelementptr inbounds %struct.sn* %tmp32.i86, i64 0, i32 0
  %tmp37.i90 = load i32* %value36.i89, align 4
  %cmp39.i91 = icmp eq i32 %tmp37.i90, 7
  br i1 %cmp39.i91, label %if.end17, label %if.then15

if.then15:                                        ; preds = %for.end.i88, %land.lhs.true.i92
  %puts96 = tail call i32 @puts(i8* getelementptr inbounds ([19 x i8]* @str2, i64 0, i64 0))
  br label %if.end17

if.end17:                                         ; preds = %land.lhs.true.i92, %if.then15
  ret i32 0
}

declare i32 @putchar(i32)

declare i32 @puts(i8* nocapture) nounwind
