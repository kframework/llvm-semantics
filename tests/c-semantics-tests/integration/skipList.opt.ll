; ModuleID = '/home/david/src/c-semantics/tests/integration/skipList.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.sn = type { i32, %struct.sn** }
%struct.SkipSet = type { %struct.sn*, i32 }

@random_level.first.b = internal unnamed_addr global i1 false
@.str1 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@str = private unnamed_addr constant [2 x i8] c"}\00"
@str6 = private unnamed_addr constant [17 x i8] c"7 is in the list\00"
@str7 = private unnamed_addr constant [19 x i8] c"7 has been deleted\00"

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
  %.b = load i1* @random_level.first.b, align 1
  br i1 %.b, label %while.cond, label %if.then

if.then:                                          ; preds = %entry
  store i1 true, i1* @random_level.first.b, align 1
  br label %while.cond

while.cond:                                       ; preds = %entry, %if.then, %while.cond
  %lvl.0 = phi i32 [ %inc, %while.cond ], [ 0, %if.then ], [ 0, %entry ]
  %call.i = tail call i32 @rand() nounwind
  %conv.i = sitofp i32 %call.i to float
  %div.i = fmul float %conv.i, 0x3E00000000000000
  %cmp = fcmp olt float %div.i, 5.000000e-01
  %cmp2 = icmp slt i32 %lvl.0, 6
  %0 = and i1 %cmp, %cmp2
  %inc = add nsw i32 %lvl.0, 1
  br i1 %0, label %while.cond, label %while.end

while.end:                                        ; preds = %while.cond
  ret i32 %lvl.0
}

define noalias %struct.sn* @make_node(i32 %level, i32 %value) nounwind uwtable {
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
  store %struct.sn** %1, %struct.sn*** %2, align 8, !tbaa !0
  %cmp6 = icmp sgt i32 %add, 0
  br i1 %cmp6, label %for.body.lr.ph, label %for.end

for.body.lr.ph:                                   ; preds = %entry
  %3 = zext i32 %level to i64
  %4 = shl nuw nsw i64 %3, 3
  %5 = add i64 %4, 8
  call void @llvm.memset.p0i8.i64(i8* %call1, i8 0, i64 %5, i32 8, i1 false)
  br label %for.end

for.end:                                          ; preds = %for.body.lr.ph, %entry
  %value5 = bitcast i8* %call to i32*
  store i32 %value, i32* %value5, align 4, !tbaa !3
  ret %struct.sn* %0
}

declare noalias i8* @malloc(i64) nounwind

define noalias %struct.SkipSet* @make_skipset() nounwind uwtable {
entry:
  %call = tail call noalias i8* @malloc(i64 16) nounwind
  %0 = bitcast i8* %call to %struct.SkipSet*
  %call.i = tail call noalias i8* @malloc(i64 16) nounwind
  %1 = bitcast i8* %call.i to %struct.sn*
  %call1.i = tail call noalias i8* @malloc(i64 56) nounwind
  %2 = bitcast i8* %call1.i to %struct.sn**
  %forward.i = getelementptr inbounds i8* %call.i, i64 8
  %3 = bitcast i8* %forward.i to %struct.sn***
  store %struct.sn** %2, %struct.sn*** %3, align 8, !tbaa !0
  tail call void @llvm.memset.p0i8.i64(i8* %call1.i, i8 0, i64 56, i32 8, i1 false) nounwind
  %value5.i = bitcast i8* %call.i to i32*
  store i32 0, i32* %value5.i, align 4, !tbaa !3
  %header = bitcast i8* %call to %struct.sn**
  store %struct.sn* %1, %struct.sn** %header, align 8, !tbaa !0
  %level = getelementptr inbounds i8* %call, i64 8
  %4 = bitcast i8* %level to i32*
  store i32 0, i32* %4, align 4, !tbaa !3
  ret %struct.SkipSet* %0
}

define void @print_skipset(%struct.SkipSet* nocapture %ss) nounwind uwtable {
entry:
  %header = getelementptr inbounds %struct.SkipSet* %ss, i64 0, i32 0
  %0 = load %struct.sn** %header, align 8, !tbaa !0
  %forward = getelementptr inbounds %struct.sn* %0, i64 0, i32 1
  %1 = load %struct.sn*** %forward, align 8, !tbaa !0
  %2 = load %struct.sn** %1, align 8, !tbaa !0
  %putchar = tail call i32 @putchar(i32 123) nounwind
  %cmp8 = icmp eq %struct.sn* %2, null
  br i1 %cmp8, label %while.end, label %while.body

while.body:                                       ; preds = %while.cond.backedge, %entry
  %x.09 = phi %struct.sn* [ %5, %while.cond.backedge ], [ %2, %entry ]
  %value = getelementptr inbounds %struct.sn* %x.09, i64 0, i32 0
  %3 = load i32* %value, align 4, !tbaa !3
  %call1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str1, i64 0, i64 0), i32 %3) nounwind
  %forward2 = getelementptr inbounds %struct.sn* %x.09, i64 0, i32 1
  %4 = load %struct.sn*** %forward2, align 8, !tbaa !0
  %5 = load %struct.sn** %4, align 8, !tbaa !0
  %cmp4 = icmp eq %struct.sn* %5, null
  br i1 %cmp4, label %while.end, label %while.cond.backedge

while.cond.backedge:                              ; preds = %while.body
  %putchar7 = tail call i32 @putchar(i32 44) nounwind
  br label %while.body

while.end:                                        ; preds = %while.body, %entry
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([2 x i8]* @str, i64 0, i64 0))
  ret void
}

declare i32 @printf(i8* nocapture, ...) nounwind

define i32 @contains(%struct.SkipSet* nocapture %ss, i32 %search_value) nounwind uwtable readonly {
entry:
  %header = getelementptr inbounds %struct.SkipSet* %ss, i64 0, i32 0
  %0 = load %struct.sn** %header, align 8, !tbaa !0
  %level = getelementptr inbounds %struct.SkipSet* %ss, i64 0, i32 1
  %1 = load i32* %level, align 4, !tbaa !3
  %cmp14 = icmp sgt i32 %1, -1
  br i1 %cmp14, label %while.cond.preheader.lr.ph, label %entry.for.end_crit_edge

entry.for.end_crit_edge:                          ; preds = %entry
  %forward9.phi.trans.insert = getelementptr inbounds %struct.sn* %0, i64 0, i32 1
  %.pre = load %struct.sn*** %forward9.phi.trans.insert, align 8, !tbaa !0
  br label %for.end

while.cond.preheader.lr.ph:                       ; preds = %entry
  %2 = sext i32 %1 to i64
  br label %while.cond.preheader

while.cond.preheader:                             ; preds = %while.cond.preheader.lr.ph, %for.inc
  %indvars.iv = phi i64 [ %2, %while.cond.preheader.lr.ph ], [ %indvars.iv.next, %for.inc ]
  %x.016 = phi %struct.sn* [ %0, %while.cond.preheader.lr.ph ], [ %x.1, %for.inc ]
  br label %while.cond

while.cond:                                       ; preds = %while.cond.preheader, %land.rhs
  %x.1 = phi %struct.sn* [ %4, %land.rhs ], [ %x.016, %while.cond.preheader ]
  %forward = getelementptr inbounds %struct.sn* %x.1, i64 0, i32 1
  %3 = load %struct.sn*** %forward, align 8, !tbaa !0
  %arrayidx = getelementptr inbounds %struct.sn** %3, i64 %indvars.iv
  %4 = load %struct.sn** %arrayidx, align 8, !tbaa !0
  %cmp1 = icmp eq %struct.sn* %4, null
  br i1 %cmp1, label %for.inc, label %land.rhs

land.rhs:                                         ; preds = %while.cond
  %value = getelementptr inbounds %struct.sn* %4, i64 0, i32 0
  %5 = load i32* %value, align 4, !tbaa !3
  %cmp5 = icmp slt i32 %5, %search_value
  br i1 %cmp5, label %while.cond, label %for.inc

for.inc:                                          ; preds = %while.cond, %land.rhs
  %indvars.iv.next = add i64 %indvars.iv, -1
  %6 = trunc i64 %indvars.iv to i32
  %cmp = icmp sgt i32 %6, 0
  br i1 %cmp, label %while.cond.preheader, label %for.end

for.end:                                          ; preds = %for.inc, %entry.for.end_crit_edge
  %7 = phi %struct.sn** [ %.pre, %entry.for.end_crit_edge ], [ %3, %for.inc ]
  %8 = load %struct.sn** %7, align 8, !tbaa !0
  %cmp11 = icmp eq %struct.sn* %8, null
  br i1 %cmp11, label %if.end, label %land.lhs.true

land.lhs.true:                                    ; preds = %for.end
  %value12 = getelementptr inbounds %struct.sn* %8, i64 0, i32 0
  %9 = load i32* %value12, align 4, !tbaa !3
  %cmp13 = icmp eq i32 %9, %search_value
  br i1 %cmp13, label %return, label %if.end

if.end:                                           ; preds = %for.end, %land.lhs.true
  br label %return

return:                                           ; preds = %land.lhs.true, %if.end
  %retval.0 = phi i32 [ 0, %if.end ], [ 1, %land.lhs.true ]
  ret i32 %retval.0
}

define void @insert(%struct.SkipSet* nocapture %ss, i32 %value) nounwind uwtable {
entry:
  %update = alloca [7 x %struct.sn*], align 16
  %header = getelementptr inbounds %struct.SkipSet* %ss, i64 0, i32 0
  %0 = load %struct.sn** %header, align 8, !tbaa !0
  %1 = bitcast [7 x %struct.sn*]* %update to i8*
  call void @llvm.memset.p0i8.i64(i8* %1, i8 0, i64 7, i32 16, i1 false)
  %level = getelementptr inbounds %struct.SkipSet* %ss, i64 0, i32 1
  %2 = load i32* %level, align 4, !tbaa !3
  %cmp56 = icmp sgt i32 %2, -1
  br i1 %cmp56, label %while.cond.preheader.lr.ph, label %for.end

while.cond.preheader.lr.ph:                       ; preds = %entry
  %3 = sext i32 %2 to i64
  br label %while.cond.preheader

while.cond.preheader:                             ; preds = %while.cond.preheader.lr.ph, %while.end
  %indvars.iv68 = phi i64 [ %3, %while.cond.preheader.lr.ph ], [ %indvars.iv.next69, %while.end ]
  %x.058 = phi %struct.sn* [ %0, %while.cond.preheader.lr.ph ], [ %x.1, %while.end ]
  br label %while.cond

while.cond:                                       ; preds = %while.cond.preheader, %land.rhs
  %x.1 = phi %struct.sn* [ %5, %land.rhs ], [ %x.058, %while.cond.preheader ]
  %forward = getelementptr inbounds %struct.sn* %x.1, i64 0, i32 1
  %4 = load %struct.sn*** %forward, align 8, !tbaa !0
  %arrayidx = getelementptr inbounds %struct.sn** %4, i64 %indvars.iv68
  %5 = load %struct.sn** %arrayidx, align 8, !tbaa !0
  %cmp1 = icmp eq %struct.sn* %5, null
  br i1 %cmp1, label %while.end, label %land.rhs

land.rhs:                                         ; preds = %while.cond
  %value5 = getelementptr inbounds %struct.sn* %5, i64 0, i32 0
  %6 = load i32* %value5, align 4, !tbaa !3
  %cmp6 = icmp slt i32 %6, %value
  br i1 %cmp6, label %while.cond, label %while.end

while.end:                                        ; preds = %while.cond, %land.rhs
  %arrayidx11 = getelementptr inbounds [7 x %struct.sn*]* %update, i64 0, i64 %indvars.iv68
  store %struct.sn* %x.1, %struct.sn** %arrayidx11, align 8, !tbaa !0
  %indvars.iv.next69 = add i64 %indvars.iv68, -1
  %7 = trunc i64 %indvars.iv68 to i32
  %cmp = icmp sgt i32 %7, 0
  br i1 %cmp, label %while.cond.preheader, label %for.end

for.end:                                          ; preds = %while.end, %entry
  %x.0.lcssa = phi %struct.sn* [ %0, %entry ], [ %x.1, %while.end ]
  %forward12 = getelementptr inbounds %struct.sn* %x.0.lcssa, i64 0, i32 1
  %8 = load %struct.sn*** %forward12, align 8, !tbaa !0
  %9 = load %struct.sn** %8, align 8, !tbaa !0
  %cmp14 = icmp eq %struct.sn* %9, null
  br i1 %cmp14, label %if.then, label %lor.rhs

lor.rhs:                                          ; preds = %for.end
  %value15 = getelementptr inbounds %struct.sn* %9, i64 0, i32 0
  %10 = load i32* %value15, align 4, !tbaa !3
  %cmp16 = icmp eq i32 %10, %value
  br i1 %cmp16, label %if.end50, label %if.then

if.then:                                          ; preds = %lor.rhs, %for.end
  %.b.i = load i1* @random_level.first.b, align 1
  br i1 %.b.i, label %while.cond.i, label %if.then.i

if.then.i:                                        ; preds = %if.then
  store i1 true, i1* @random_level.first.b, align 1
  br label %while.cond.i

while.cond.i:                                     ; preds = %if.then.i, %if.then, %while.cond.i
  %indvars.iv64 = phi i32 [ %indvars.iv.next65, %while.cond.i ], [ 1, %if.then ], [ 1, %if.then.i ]
  %lvl.0.i = phi i32 [ %inc.i, %while.cond.i ], [ 0, %if.then ], [ 0, %if.then.i ]
  %call.i.i = call i32 @rand() nounwind
  %conv.i.i = sitofp i32 %call.i.i to float
  %div.i.i = fmul float %conv.i.i, 0x3E00000000000000
  %cmp.i = fcmp olt float %div.i.i, 5.000000e-01
  %cmp2.i = icmp slt i32 %lvl.0.i, 6
  %11 = and i1 %cmp.i, %cmp2.i
  %inc.i = add nsw i32 %lvl.0.i, 1
  %indvars.iv.next65 = add i32 %indvars.iv64, 1
  br i1 %11, label %while.cond.i, label %random_level.exit

random_level.exit:                                ; preds = %while.cond.i
  %12 = load i32* %level, align 4, !tbaa !3
  %cmp18 = icmp sgt i32 %lvl.0.i, %12
  br i1 %cmp18, label %for.cond21.preheader, label %if.end

for.cond21.preheader:                             ; preds = %random_level.exit
  %i.153 = add nsw i32 %12, 1
  %cmp2254 = icmp sgt i32 %i.153, %lvl.0.i
  br i1 %cmp2254, label %for.end28, label %for.body23.lr.ph

for.body23.lr.ph:                                 ; preds = %for.cond21.preheader
  %13 = load %struct.sn** %header, align 8, !tbaa !0
  %14 = sext i32 %12 to i64
  %15 = add i64 %14, 1
  br label %for.body23

for.body23:                                       ; preds = %for.body23.lr.ph, %for.body23
  %indvars.iv61 = phi i64 [ %15, %for.body23.lr.ph ], [ %indvars.iv.next62, %for.body23 ]
  %arrayidx26 = getelementptr inbounds [7 x %struct.sn*]* %update, i64 0, i64 %indvars.iv61
  store %struct.sn* %13, %struct.sn** %arrayidx26, align 8, !tbaa !0
  %indvars.iv.next62 = add i64 %indvars.iv61, 1
  %lftr.wideiv66 = trunc i64 %indvars.iv.next62 to i32
  %exitcond67 = icmp eq i32 %lftr.wideiv66, %indvars.iv64
  br i1 %exitcond67, label %for.end28, label %for.body23

for.end28:                                        ; preds = %for.body23, %for.cond21.preheader
  store i32 %lvl.0.i, i32* %level, align 4, !tbaa !3
  br label %if.end

if.end:                                           ; preds = %for.end28, %random_level.exit
  %call.i = call noalias i8* @malloc(i64 16) nounwind
  %16 = bitcast i8* %call.i to %struct.sn*
  %conv.i = sext i32 %inc.i to i64
  %mul.i = shl nsw i64 %conv.i, 3
  %call1.i = call noalias i8* @malloc(i64 %mul.i) nounwind
  %17 = bitcast i8* %call1.i to %struct.sn**
  %forward.i = getelementptr inbounds i8* %call.i, i64 8
  %18 = bitcast i8* %forward.i to %struct.sn***
  store %struct.sn** %17, %struct.sn*** %18, align 8, !tbaa !0
  %cmp6.i = icmp sgt i32 %inc.i, 0
  br i1 %cmp6.i, label %for.body.lr.ph.i, label %make_node.exit

for.body.lr.ph.i:                                 ; preds = %if.end
  %19 = zext i32 %lvl.0.i to i64
  %20 = shl nuw nsw i64 %19, 3
  %21 = add i64 %20, 8
  call void @llvm.memset.p0i8.i64(i8* %call1.i, i8 0, i64 %21, i32 8, i1 false) nounwind
  br label %make_node.exit

make_node.exit:                                   ; preds = %if.end, %for.body.lr.ph.i
  %value5.i = bitcast i8* %call.i to i32*
  store i32 %value, i32* %value5.i, align 4, !tbaa !3
  %cmp3251 = icmp slt i32 %lvl.0.i, 0
  br i1 %cmp3251, label %if.end50, label %for.body33

for.body33:                                       ; preds = %make_node.exit, %for.body33.for.body33_crit_edge
  %22 = phi %struct.sn** [ %.pre, %for.body33.for.body33_crit_edge ], [ %17, %make_node.exit ]
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body33.for.body33_crit_edge ], [ 0, %make_node.exit ]
  %arrayidx36 = getelementptr inbounds [7 x %struct.sn*]* %update, i64 0, i64 %indvars.iv
  %23 = load %struct.sn** %arrayidx36, align 8, !tbaa !0
  %forward37 = getelementptr inbounds %struct.sn* %23, i64 0, i32 1
  %24 = load %struct.sn*** %forward37, align 8, !tbaa !0
  %arrayidx38 = getelementptr inbounds %struct.sn** %24, i64 %indvars.iv
  %25 = load %struct.sn** %arrayidx38, align 8, !tbaa !0
  %arrayidx41 = getelementptr inbounds %struct.sn** %22, i64 %indvars.iv
  store %struct.sn* %25, %struct.sn** %arrayidx41, align 8, !tbaa !0
  %26 = load %struct.sn*** %forward37, align 8, !tbaa !0
  %arrayidx46 = getelementptr inbounds %struct.sn** %26, i64 %indvars.iv
  store %struct.sn* %16, %struct.sn** %arrayidx46, align 8, !tbaa !0
  %indvars.iv.next = add i64 %indvars.iv, 1
  %lftr.wideiv = trunc i64 %indvars.iv.next to i32
  %exitcond = icmp eq i32 %lftr.wideiv, %indvars.iv64
  br i1 %exitcond, label %if.end50, label %for.body33.for.body33_crit_edge

for.body33.for.body33_crit_edge:                  ; preds = %for.body33
  %.pre = load %struct.sn*** %18, align 8, !tbaa !0
  br label %for.body33

if.end50:                                         ; preds = %make_node.exit, %for.body33, %lor.rhs
  ret void
}

declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) nounwind

define void @delete(%struct.SkipSet* nocapture %ss, i32 %value) nounwind uwtable {
entry:
  %update = alloca [7 x %struct.sn*], align 16
  %header = getelementptr inbounds %struct.SkipSet* %ss, i64 0, i32 0
  %0 = load %struct.sn** %header, align 8, !tbaa !0
  %1 = bitcast [7 x %struct.sn*]* %update to i8*
  call void @llvm.memset.p0i8.i64(i8* %1, i8 0, i64 7, i32 16, i1 false)
  %level = getelementptr inbounds %struct.SkipSet* %ss, i64 0, i32 1
  %2 = load i32* %level, align 4, !tbaa !3
  %cmp53 = icmp sgt i32 %2, -1
  br i1 %cmp53, label %while.cond.preheader.lr.ph, label %for.end

while.cond.preheader.lr.ph:                       ; preds = %entry
  %3 = sext i32 %2 to i64
  br label %while.cond.preheader

while.cond.preheader:                             ; preds = %while.cond.preheader.lr.ph, %while.end
  %indvars.iv58 = phi i64 [ %3, %while.cond.preheader.lr.ph ], [ %indvars.iv.next59, %while.end ]
  %x.055 = phi %struct.sn* [ %0, %while.cond.preheader.lr.ph ], [ %x.1, %while.end ]
  br label %while.cond

while.cond:                                       ; preds = %while.cond.preheader, %land.rhs
  %x.1 = phi %struct.sn* [ %5, %land.rhs ], [ %x.055, %while.cond.preheader ]
  %forward = getelementptr inbounds %struct.sn* %x.1, i64 0, i32 1
  %4 = load %struct.sn*** %forward, align 8, !tbaa !0
  %arrayidx = getelementptr inbounds %struct.sn** %4, i64 %indvars.iv58
  %5 = load %struct.sn** %arrayidx, align 8, !tbaa !0
  %cmp1 = icmp eq %struct.sn* %5, null
  br i1 %cmp1, label %while.end, label %land.rhs

land.rhs:                                         ; preds = %while.cond
  %value5 = getelementptr inbounds %struct.sn* %5, i64 0, i32 0
  %6 = load i32* %value5, align 4, !tbaa !3
  %cmp6 = icmp slt i32 %6, %value
  br i1 %cmp6, label %while.cond, label %while.end

while.end:                                        ; preds = %while.cond, %land.rhs
  %arrayidx11 = getelementptr inbounds [7 x %struct.sn*]* %update, i64 0, i64 %indvars.iv58
  store %struct.sn* %x.1, %struct.sn** %arrayidx11, align 8, !tbaa !0
  %indvars.iv.next59 = add i64 %indvars.iv58, -1
  %7 = trunc i64 %indvars.iv58 to i32
  %cmp = icmp sgt i32 %7, 0
  br i1 %cmp, label %while.cond.preheader, label %for.end

for.end:                                          ; preds = %while.end, %entry
  %x.0.lcssa = phi %struct.sn* [ %0, %entry ], [ %x.1, %while.end ]
  %forward12 = getelementptr inbounds %struct.sn* %x.0.lcssa, i64 0, i32 1
  %8 = load %struct.sn*** %forward12, align 8, !tbaa !0
  %9 = load %struct.sn** %8, align 8, !tbaa !0
  %value14 = getelementptr inbounds %struct.sn* %9, i64 0, i32 0
  %10 = load i32* %value14, align 4, !tbaa !3
  %cmp15 = icmp eq i32 %10, %value
  br i1 %cmp15, label %for.cond16.preheader, label %if.end52

for.cond16.preheader:                             ; preds = %for.end
  %forward28 = getelementptr inbounds %struct.sn* %9, i64 0, i32 1
  br label %for.cond16

for.cond16:                                       ; preds = %for.cond16.preheader, %if.end
  %indvars.iv56 = phi i64 [ 0, %for.cond16.preheader ], [ %indvars.iv.next57, %if.end ]
  %11 = trunc i64 %indvars.iv56 to i32
  %cmp18 = icmp sgt i32 %11, %2
  br i1 %cmp18, label %for.end36, label %for.body19

for.body19:                                       ; preds = %for.cond16
  %arrayidx22 = getelementptr inbounds [7 x %struct.sn*]* %update, i64 0, i64 %indvars.iv56
  %12 = load %struct.sn** %arrayidx22, align 8, !tbaa !0
  %forward23 = getelementptr inbounds %struct.sn* %12, i64 0, i32 1
  %13 = load %struct.sn*** %forward23, align 8, !tbaa !0
  %arrayidx24 = getelementptr inbounds %struct.sn** %13, i64 %indvars.iv56
  %14 = load %struct.sn** %arrayidx24, align 8, !tbaa !0
  %cmp25 = icmp eq %struct.sn* %14, %9
  br i1 %cmp25, label %if.end, label %for.end36

if.end:                                           ; preds = %for.body19
  %15 = load %struct.sn*** %forward28, align 8, !tbaa !0
  %arrayidx29 = getelementptr inbounds %struct.sn** %15, i64 %indvars.iv56
  %16 = load %struct.sn** %arrayidx29, align 8, !tbaa !0
  store %struct.sn* %16, %struct.sn** %arrayidx24, align 8, !tbaa !0
  %indvars.iv.next57 = add i64 %indvars.iv56, 1
  br label %for.cond16

for.end36:                                        ; preds = %for.body19, %for.cond16
  %17 = bitcast %struct.sn* %9 to i8*
  call void @free(i8* %17) nounwind
  %.pr = load i32* %level, align 4, !tbaa !3
  %18 = sext i32 %.pr to i64
  br label %while.cond37

while.cond37:                                     ; preds = %while.body48, %for.end36
  %indvars.iv = phi i64 [ %indvars.iv.next, %while.body48 ], [ %18, %for.end36 ]
  %19 = trunc i64 %indvars.iv to i32
  %cmp39 = icmp sgt i32 %19, 0
  br i1 %cmp39, label %land.rhs40, label %if.end52

land.rhs40:                                       ; preds = %while.cond37
  %20 = load %struct.sn** %header, align 8, !tbaa !0
  %forward44 = getelementptr inbounds %struct.sn* %20, i64 0, i32 1
  %21 = load %struct.sn*** %forward44, align 8, !tbaa !0
  %arrayidx45 = getelementptr inbounds %struct.sn** %21, i64 %indvars.iv
  %22 = load %struct.sn** %arrayidx45, align 8, !tbaa !0
  %cmp46 = icmp eq %struct.sn* %22, null
  br i1 %cmp46, label %while.body48, label %if.end52

while.body48:                                     ; preds = %land.rhs40
  %indvars.iv.next = add i64 %indvars.iv, -1
  %23 = trunc i64 %indvars.iv.next to i32
  store i32 %23, i32* %level, align 4, !tbaa !3
  br label %while.cond37

if.end52:                                         ; preds = %land.rhs40, %while.cond37, %for.end
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
  store %struct.sn** %2, %struct.sn*** %3, align 8, !tbaa !0
  tail call void @llvm.memset.p0i8.i64(i8* %call1.i.i, i8 0, i64 56, i32 8, i1 false) nounwind
  %value5.i.i = bitcast i8* %call.i.i to i32*
  store i32 0, i32* %value5.i.i, align 4, !tbaa !3
  %header.i = bitcast i8* %call.i to %struct.sn**
  store %struct.sn* %1, %struct.sn** %header.i, align 8, !tbaa !0
  %level.i = getelementptr inbounds i8* %call.i, i64 8
  %4 = bitcast i8* %level.i to i32*
  store i32 0, i32* %4, align 4, !tbaa !3
  %putchar.i = tail call i32 @putchar(i32 123) nounwind
  %puts.i = tail call i32 @puts(i8* getelementptr inbounds ([2 x i8]* @str, i64 0, i64 0)) nounwind
  tail call void @insert(%struct.SkipSet* %0, i32 5)
  tail call void @insert(%struct.SkipSet* %0, i32 10)
  tail call void @insert(%struct.SkipSet* %0, i32 7)
  tail call void @insert(%struct.SkipSet* %0, i32 7)
  tail call void @insert(%struct.SkipSet* %0, i32 6)
  %5 = load %struct.sn** %header.i, align 8, !tbaa !0
  %6 = load i32* %4, align 4, !tbaa !3
  %cmp14.i = icmp sgt i32 %6, -1
  br i1 %cmp14.i, label %while.cond.preheader.lr.ph.i, label %entry.for.end_crit_edge.i

entry.for.end_crit_edge.i:                        ; preds = %print_skipset.exit
  %forward9.phi.trans.insert.i = getelementptr inbounds %struct.sn* %5, i64 0, i32 1
  %.pre.i = load %struct.sn*** %forward9.phi.trans.insert.i, align 8, !tbaa !0
  br label %for.end.i

while.cond.preheader.lr.ph.i:                     ; preds = %print_skipset.exit
  %7 = sext i32 %6 to i64
  br label %while.cond.preheader.i

while.cond.preheader.i:                           ; preds = %for.inc.i, %while.cond.preheader.lr.ph.i
  %indvars.iv.i = phi i64 [ %7, %while.cond.preheader.lr.ph.i ], [ %indvars.iv.next.i, %for.inc.i ]
  %x.016.i = phi %struct.sn* [ %5, %while.cond.preheader.lr.ph.i ], [ %x.1.i, %for.inc.i ]
  br label %while.cond.i

while.cond.i:                                     ; preds = %land.rhs.i, %while.cond.preheader.i
  %x.1.i = phi %struct.sn* [ %9, %land.rhs.i ], [ %x.016.i, %while.cond.preheader.i ]
  %forward.i11 = getelementptr inbounds %struct.sn* %x.1.i, i64 0, i32 1
  %8 = load %struct.sn*** %forward.i11, align 8, !tbaa !0
  %arrayidx.i = getelementptr inbounds %struct.sn** %8, i64 %indvars.iv.i
  %9 = load %struct.sn** %arrayidx.i, align 8, !tbaa !0
  %cmp1.i = icmp eq %struct.sn* %9, null
  br i1 %cmp1.i, label %for.inc.i, label %land.rhs.i

land.rhs.i:                                       ; preds = %while.cond.i
  %value.i12 = getelementptr inbounds %struct.sn* %9, i64 0, i32 0
  %10 = load i32* %value.i12, align 4, !tbaa !3
  %cmp5.i = icmp slt i32 %10, 7
  br i1 %cmp5.i, label %while.cond.i, label %for.inc.i

for.inc.i:                                        ; preds = %land.rhs.i, %while.cond.i
  %indvars.iv.next.i = add i64 %indvars.iv.i, -1
  %11 = trunc i64 %indvars.iv.i to i32
  %cmp.i = icmp sgt i32 %11, 0
  br i1 %cmp.i, label %while.cond.preheader.i, label %for.end.i

for.end.i:                                        ; preds = %for.inc.i, %entry.for.end_crit_edge.i
  %12 = phi %struct.sn** [ %.pre.i, %entry.for.end_crit_edge.i ], [ %8, %for.inc.i ]
  %13 = load %struct.sn** %12, align 8, !tbaa !0
  %cmp11.i = icmp eq %struct.sn* %13, null
  br i1 %cmp11.i, label %if.end, label %land.lhs.true.i

land.lhs.true.i:                                  ; preds = %for.end.i
  %value12.i = getelementptr inbounds %struct.sn* %13, i64 0, i32 0
  %14 = load i32* %value12.i, align 4, !tbaa !3
  %cmp13.i = icmp eq i32 %14, 7
  br i1 %cmp13.i, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true.i
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([17 x i8]* @str6, i64 0, i64 0))
  br label %if.end

if.end:                                           ; preds = %land.lhs.true.i, %for.end.i, %if.then
  %forward.i14 = getelementptr inbounds %struct.sn* %5, i64 0, i32 1
  %15 = load %struct.sn*** %forward.i14, align 8, !tbaa !0
  %16 = load %struct.sn** %15, align 8, !tbaa !0
  %putchar.i15 = tail call i32 @putchar(i32 123) nounwind
  %cmp8.i16 = icmp eq %struct.sn* %16, null
  br i1 %cmp8.i16, label %print_skipset.exit26, label %while.body.i22.preheader

while.body.i22.preheader:                         ; preds = %if.end
  %value.i1881 = getelementptr inbounds %struct.sn* %16, i64 0, i32 0
  %17 = load i32* %value.i1881, align 4, !tbaa !3
  %call1.i1982 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str1, i64 0, i64 0), i32 %17) nounwind
  %forward2.i2083 = getelementptr inbounds %struct.sn* %16, i64 0, i32 1
  %18 = load %struct.sn*** %forward2.i2083, align 8, !tbaa !0
  %19 = load %struct.sn** %18, align 8, !tbaa !0
  %cmp4.i2184 = icmp eq %struct.sn* %19, null
  br i1 %cmp4.i2184, label %print_skipset.exit26, label %while.cond.backedge.i24

while.cond.backedge.i24:                          ; preds = %while.body.i22.preheader, %while.cond.backedge.i24
  %20 = phi %struct.sn* [ %23, %while.cond.backedge.i24 ], [ %19, %while.body.i22.preheader ]
  %putchar7.i23 = tail call i32 @putchar(i32 44) nounwind
  %value.i18 = getelementptr inbounds %struct.sn* %20, i64 0, i32 0
  %21 = load i32* %value.i18, align 4, !tbaa !3
  %call1.i19 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str1, i64 0, i64 0), i32 %21) nounwind
  %forward2.i20 = getelementptr inbounds %struct.sn* %20, i64 0, i32 1
  %22 = load %struct.sn*** %forward2.i20, align 8, !tbaa !0
  %23 = load %struct.sn** %22, align 8, !tbaa !0
  %cmp4.i21 = icmp eq %struct.sn* %23, null
  br i1 %cmp4.i21, label %print_skipset.exit26, label %while.cond.backedge.i24

print_skipset.exit26:                             ; preds = %while.body.i22.preheader, %while.cond.backedge.i24, %if.end
  %puts.i25 = tail call i32 @puts(i8* getelementptr inbounds ([2 x i8]* @str, i64 0, i64 0)) nounwind
  tail call void @delete(%struct.SkipSet* %0, i32 7)
  %24 = load %struct.sn** %header.i, align 8, !tbaa !0
  %forward.i28 = getelementptr inbounds %struct.sn* %24, i64 0, i32 1
  %25 = load %struct.sn*** %forward.i28, align 8, !tbaa !0
  %26 = load %struct.sn** %25, align 8, !tbaa !0
  %putchar.i29 = tail call i32 @putchar(i32 123) nounwind
  %cmp8.i30 = icmp eq %struct.sn* %26, null
  br i1 %cmp8.i30, label %print_skipset.exit40, label %while.body.i36.preheader

while.body.i36.preheader:                         ; preds = %print_skipset.exit26
  %value.i3285 = getelementptr inbounds %struct.sn* %26, i64 0, i32 0
  %27 = load i32* %value.i3285, align 4, !tbaa !3
  %call1.i3386 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str1, i64 0, i64 0), i32 %27) nounwind
  %forward2.i3487 = getelementptr inbounds %struct.sn* %26, i64 0, i32 1
  %28 = load %struct.sn*** %forward2.i3487, align 8, !tbaa !0
  %29 = load %struct.sn** %28, align 8, !tbaa !0
  %cmp4.i3588 = icmp eq %struct.sn* %29, null
  br i1 %cmp4.i3588, label %print_skipset.exit40, label %while.cond.backedge.i38

while.cond.backedge.i38:                          ; preds = %while.body.i36.preheader, %while.cond.backedge.i38
  %30 = phi %struct.sn* [ %33, %while.cond.backedge.i38 ], [ %29, %while.body.i36.preheader ]
  %putchar7.i37 = tail call i32 @putchar(i32 44) nounwind
  %value.i32 = getelementptr inbounds %struct.sn* %30, i64 0, i32 0
  %31 = load i32* %value.i32, align 4, !tbaa !3
  %call1.i33 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str1, i64 0, i64 0), i32 %31) nounwind
  %forward2.i34 = getelementptr inbounds %struct.sn* %30, i64 0, i32 1
  %32 = load %struct.sn*** %forward2.i34, align 8, !tbaa !0
  %33 = load %struct.sn** %32, align 8, !tbaa !0
  %cmp4.i35 = icmp eq %struct.sn* %33, null
  br i1 %cmp4.i35, label %print_skipset.exit40, label %while.cond.backedge.i38

print_skipset.exit40:                             ; preds = %while.body.i36.preheader, %while.cond.backedge.i38, %print_skipset.exit26
  %puts.i39 = tail call i32 @puts(i8* getelementptr inbounds ([2 x i8]* @str, i64 0, i64 0)) nounwind
  %34 = load i32* %4, align 4, !tbaa !3
  %cmp14.i43 = icmp sgt i32 %34, -1
  br i1 %cmp14.i43, label %while.cond.preheader.lr.ph.i47, label %entry.for.end_crit_edge.i46

entry.for.end_crit_edge.i46:                      ; preds = %print_skipset.exit40
  %.pre.i45 = load %struct.sn*** %forward.i28, align 8, !tbaa !0
  br label %for.end.i63

while.cond.preheader.lr.ph.i47:                   ; preds = %print_skipset.exit40
  %35 = sext i32 %34 to i64
  br label %while.cond.preheader.i50

while.cond.preheader.i50:                         ; preds = %for.inc.i61, %while.cond.preheader.lr.ph.i47
  %indvars.iv.i48 = phi i64 [ %35, %while.cond.preheader.lr.ph.i47 ], [ %indvars.iv.next.i59, %for.inc.i61 ]
  %x.016.i49 = phi %struct.sn* [ %24, %while.cond.preheader.lr.ph.i47 ], [ %x.1.i51, %for.inc.i61 ]
  br label %while.cond.i55

while.cond.i55:                                   ; preds = %land.rhs.i58, %while.cond.preheader.i50
  %x.1.i51 = phi %struct.sn* [ %37, %land.rhs.i58 ], [ %x.016.i49, %while.cond.preheader.i50 ]
  %forward.i52 = getelementptr inbounds %struct.sn* %x.1.i51, i64 0, i32 1
  %36 = load %struct.sn*** %forward.i52, align 8, !tbaa !0
  %arrayidx.i53 = getelementptr inbounds %struct.sn** %36, i64 %indvars.iv.i48
  %37 = load %struct.sn** %arrayidx.i53, align 8, !tbaa !0
  %cmp1.i54 = icmp eq %struct.sn* %37, null
  br i1 %cmp1.i54, label %for.inc.i61, label %land.rhs.i58

land.rhs.i58:                                     ; preds = %while.cond.i55
  %value.i56 = getelementptr inbounds %struct.sn* %37, i64 0, i32 0
  %38 = load i32* %value.i56, align 4, !tbaa !3
  %cmp5.i57 = icmp slt i32 %38, 7
  br i1 %cmp5.i57, label %while.cond.i55, label %for.inc.i61

for.inc.i61:                                      ; preds = %land.rhs.i58, %while.cond.i55
  %indvars.iv.next.i59 = add i64 %indvars.iv.i48, -1
  %39 = trunc i64 %indvars.iv.i48 to i32
  %cmp.i60 = icmp sgt i32 %39, 0
  br i1 %cmp.i60, label %while.cond.preheader.i50, label %for.end.i63

for.end.i63:                                      ; preds = %for.inc.i61, %entry.for.end_crit_edge.i46
  %40 = phi %struct.sn** [ %.pre.i45, %entry.for.end_crit_edge.i46 ], [ %36, %for.inc.i61 ]
  %41 = load %struct.sn** %40, align 8, !tbaa !0
  %cmp11.i62 = icmp eq %struct.sn* %41, null
  br i1 %cmp11.i62, label %if.then5, label %land.lhs.true.i66

land.lhs.true.i66:                                ; preds = %for.end.i63
  %value12.i64 = getelementptr inbounds %struct.sn* %41, i64 0, i32 0
  %42 = load i32* %value12.i64, align 4, !tbaa !3
  %cmp13.i65 = icmp eq i32 %42, 7
  br i1 %cmp13.i65, label %if.end7, label %if.then5

if.then5:                                         ; preds = %for.end.i63, %land.lhs.true.i66
  %puts70 = tail call i32 @puts(i8* getelementptr inbounds ([19 x i8]* @str7, i64 0, i64 0))
  br label %if.end7

if.end7:                                          ; preds = %land.lhs.true.i66, %if.then5
  ret i32 0
}

declare i32 @putchar(i32)

declare i32 @puts(i8* nocapture) nounwind

!0 = metadata !{metadata !"any pointer", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
!3 = metadata !{metadata !"int", metadata !1}
