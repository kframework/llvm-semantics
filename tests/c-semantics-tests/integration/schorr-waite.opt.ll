; ModuleID = '/home/david/src/c-semantics/tests/integration/schorr-waite.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.struct_node = type <{ i8, [7 x i8], %struct.struct_node*, %struct.struct_node*, i32, [4 x i8] }>

@counter = global i32 0, align 4
@.str = private unnamed_addr constant [22 x i8] c"creating new node %d\0A\00", align 1
@.str1 = private unnamed_addr constant [32 x i8] c"Setting left child of %d to %d\0A\00", align 1
@.str2 = private unnamed_addr constant [33 x i8] c"Setting right child of %d to %d\0A\00", align 1
@.str3 = private unnamed_addr constant [19 x i8] c"%d:m=%d:l=%d:r=%d\0A\00", align 1
@str = private unnamed_addr constant [28 x i8] c"Now running Schorr-Waite...\00"

define void @schorr_waite(%struct.struct_node* %root) nounwind uwtable {
entry:
  br label %while.cond.outer

while.cond.outer:                                 ; preds = %if.else13, %if.then7, %entry
  %t.0.ph = phi %struct.struct_node* [ %root, %entry ], [ %p.0.ph, %if.then7 ], [ %15, %if.else13 ]
  %p.0.ph = phi %struct.struct_node* [ null, %entry ], [ %.lcssa, %if.then7 ], [ %t.0.lcssa19, %if.else13 ]
  %cmp = icmp eq %struct.struct_node* %p.0.ph, null
  %0 = bitcast %struct.struct_node* %p.0.ph to i32*
  %r10 = getelementptr inbounds %struct.struct_node* %p.0.ph, i64 0, i32 3
  %l = getelementptr inbounds %struct.struct_node* %p.0.ph, i64 0, i32 2
  br i1 %cmp, label %lor.rhs.us, label %while.body

if.then.us:                                       ; preds = %lor.lhs.false.us
  %1 = load i32* %0, align 8
  %bf.clear5.us = and i32 %1, 2
  %tobool6.us = icmp eq i32 %bf.clear5.us, 0
  %2 = load %struct.struct_node** %r10, align 8, !tbaa !0
  br i1 %tobool6.us, label %if.else.us, label %if.then7

lor.lhs.false.us:                                 ; preds = %land.rhs.us
  %bf.clear3.us = and i32 %4, 1
  %tobool4.us = icmp eq i32 %bf.clear3.us, 0
  br i1 %tobool4.us, label %if.else13.us-lcssa.us, label %if.then.us

land.rhs.us:                                      ; preds = %lor.rhs.us
  %3 = bitcast %struct.struct_node* %t.0.us to i32*
  %4 = load i32* %3, align 8
  %bf.clear.us = and i32 %4, 1
  %lnot.us = icmp eq i32 %bf.clear.us, 0
  br i1 %lnot.us, label %lor.lhs.false.us, label %while.end

lor.rhs.us:                                       ; preds = %if.else.us, %while.cond.outer
  %t.0.us = phi %struct.struct_node* [ %2, %if.else.us ], [ %t.0.ph, %while.cond.outer ]
  %cmp1.us = icmp eq %struct.struct_node* %t.0.us, null
  br i1 %cmp1.us, label %while.end, label %land.rhs.us

if.else.us:                                       ; preds = %if.then.us
  %5 = load %struct.struct_node** %l, align 8, !tbaa !0
  store %struct.struct_node* %5, %struct.struct_node** %r10, align 8, !tbaa !0
  store %struct.struct_node* %t.0.us, %struct.struct_node** %l, align 8, !tbaa !0
  %6 = or i32 %1, 2
  store i32 %6, i32* %0, align 8
  br label %lor.rhs.us

if.else13.us-lcssa.us:                            ; preds = %lor.lhs.false.us
  %7 = bitcast %struct.struct_node* %t.0.us to i32*
  br label %if.else13

while.body:                                       ; preds = %if.else, %while.cond.outer
  %t.0 = phi %struct.struct_node* [ %11, %if.else ], [ %t.0.ph, %while.cond.outer ]
  %cmp1 = icmp eq %struct.struct_node* %t.0, null
  br i1 %cmp1, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %while.body
  %8 = bitcast %struct.struct_node* %t.0 to i32*
  %9 = load i32* %8, align 8
  %bf.clear3 = and i32 %9, 1
  %tobool4 = icmp eq i32 %bf.clear3, 0
  br i1 %tobool4, label %if.else13, label %if.then

if.then:                                          ; preds = %lor.lhs.false, %while.body
  %10 = load i32* %0, align 8
  %bf.clear5 = and i32 %10, 2
  %tobool6 = icmp eq i32 %bf.clear5, 0
  %11 = load %struct.struct_node** %r10, align 8, !tbaa !0
  br i1 %tobool6, label %if.else, label %if.then7

if.then7:                                         ; preds = %if.then, %if.then.us
  %.lcssa = phi %struct.struct_node* [ %2, %if.then.us ], [ %11, %if.then ]
  %t.0.lcssa = phi %struct.struct_node* [ %t.0.us, %if.then.us ], [ %t.0, %if.then ]
  store %struct.struct_node* %t.0.lcssa, %struct.struct_node** %r10, align 8, !tbaa !0
  br label %while.cond.outer

if.else:                                          ; preds = %if.then
  %12 = load %struct.struct_node** %l, align 8, !tbaa !0
  store %struct.struct_node* %12, %struct.struct_node** %r10, align 8, !tbaa !0
  store %struct.struct_node* %t.0, %struct.struct_node** %l, align 8, !tbaa !0
  %13 = or i32 %10, 2
  store i32 %13, i32* %0, align 8
  br label %while.body

if.else13:                                        ; preds = %lor.lhs.false, %if.else13.us-lcssa.us
  %14 = phi i32 [ %4, %if.else13.us-lcssa.us ], [ %9, %lor.lhs.false ]
  %.lcssa21 = phi i32* [ %7, %if.else13.us-lcssa.us ], [ %8, %lor.lhs.false ]
  %t.0.lcssa19 = phi %struct.struct_node* [ %t.0.us, %if.else13.us-lcssa.us ], [ %t.0, %lor.lhs.false ]
  %l15 = getelementptr inbounds %struct.struct_node* %t.0.lcssa19, i64 0, i32 2
  %15 = load %struct.struct_node** %l15, align 8, !tbaa !0
  store %struct.struct_node* %p.0.ph, %struct.struct_node** %l15, align 8, !tbaa !0
  %16 = and i32 %14, -4
  %17 = or i32 %16, 1
  store i32 %17, i32* %.lcssa21, align 8
  br label %while.cond.outer

while.end:                                        ; preds = %land.rhs.us, %lor.rhs.us
  ret void
}

define noalias %struct.struct_node* @createNode() nounwind uwtable {
entry:
  %0 = load i32* @counter, align 4, !tbaa !3
  %call = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str, i64 0, i64 0), i32 %0) nounwind
  %call1 = tail call noalias i8* @malloc(i64 32) nounwind
  %1 = bitcast i8* %call1 to %struct.struct_node*
  %2 = bitcast i8* %call1 to i32*
  %l = getelementptr inbounds i8* %call1, i64 8
  call void @llvm.memset.p0i8.i64(i8* %l, i8 0, i64 16, i32 8, i1 false)
  %3 = load i32* @counter, align 4, !tbaa !3
  %value = getelementptr inbounds i8* %call1, i64 24
  %4 = bitcast i8* %value to i32*
  store i32 %3, i32* %4, align 4, !tbaa !3
  store i32 32, i32* %2, align 8
  %inc = add nsw i32 %3, 1
  store i32 %inc, i32* @counter, align 4, !tbaa !3
  ret %struct.struct_node* %1
}

declare i32 @printf(i8* nocapture, ...) nounwind

declare noalias i8* @malloc(i64) nounwind

define %struct.struct_node* @setLeft(%struct.struct_node* nocapture %curr, %struct.struct_node* %left) nounwind uwtable {
entry:
  %value = getelementptr inbounds %struct.struct_node* %curr, i64 0, i32 4
  %0 = load i32* %value, align 4, !tbaa !3
  %value1 = getelementptr inbounds %struct.struct_node* %left, i64 0, i32 4
  %1 = load i32* %value1, align 4, !tbaa !3
  %call = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([32 x i8]* @.str1, i64 0, i64 0), i32 %0, i32 %1) nounwind
  %l = getelementptr inbounds %struct.struct_node* %curr, i64 0, i32 2
  store %struct.struct_node* %left, %struct.struct_node** %l, align 8, !tbaa !0
  ret %struct.struct_node* %left
}

define %struct.struct_node* @setRight(%struct.struct_node* nocapture %curr, %struct.struct_node* %right) nounwind uwtable {
entry:
  %value = getelementptr inbounds %struct.struct_node* %curr, i64 0, i32 4
  %0 = load i32* %value, align 4, !tbaa !3
  %value1 = getelementptr inbounds %struct.struct_node* %right, i64 0, i32 4
  %1 = load i32* %value1, align 4, !tbaa !3
  %call = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([33 x i8]* @.str2, i64 0, i64 0), i32 %0, i32 %1) nounwind
  %r = getelementptr inbounds %struct.struct_node* %curr, i64 0, i32 3
  store %struct.struct_node* %right, %struct.struct_node** %r, align 8, !tbaa !0
  ret %struct.struct_node* %right
}

define void @showGraph(%struct.struct_node* %this) nounwind uwtable {
entry:
  br label %tailrecurse

tailrecurse:                                      ; preds = %if.end2, %entry
  %this.tr = phi %struct.struct_node* [ %this, %entry ], [ %10, %if.end2 ]
  %cmp = icmp eq %struct.struct_node* %this.tr, null
  br i1 %cmp, label %return, label %if.end

if.end:                                           ; preds = %tailrecurse
  %0 = bitcast %struct.struct_node* %this.tr to i32*
  %1 = load i32* %0, align 8
  %bf.clear = and i32 %1, 4
  %tobool = icmp eq i32 %bf.clear, 0
  br i1 %tobool, label %if.end2, label %return

if.end2:                                          ; preds = %if.end
  %value = getelementptr inbounds %struct.struct_node* %this.tr, i64 0, i32 4
  %2 = load i32* %value, align 4, !tbaa !3
  %bf.clear3 = and i32 %1, 1
  %l = getelementptr inbounds %struct.struct_node* %this.tr, i64 0, i32 2
  %3 = load %struct.struct_node** %l, align 8, !tbaa !0
  %value4 = getelementptr inbounds %struct.struct_node* %3, i64 0, i32 4
  %4 = load i32* %value4, align 4, !tbaa !3
  %r = getelementptr inbounds %struct.struct_node* %this.tr, i64 0, i32 3
  %5 = load %struct.struct_node** %r, align 8, !tbaa !0
  %value5 = getelementptr inbounds %struct.struct_node* %5, i64 0, i32 4
  %6 = load i32* %value5, align 4, !tbaa !3
  %call = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str3, i64 0, i64 0), i32 %2, i32 %bf.clear3, i32 %4, i32 %6) nounwind
  %7 = load i32* %0, align 8
  %8 = or i32 %7, 4
  store i32 %8, i32* %0, align 8
  %9 = load %struct.struct_node** %l, align 8, !tbaa !0
  tail call void @showGraph(%struct.struct_node* %9)
  %10 = load %struct.struct_node** %r, align 8, !tbaa !0
  br label %tailrecurse

return:                                           ; preds = %if.end, %tailrecurse
  ret void
}

define void @cleanGraph(%struct.struct_node* %this) nounwind uwtable {
entry:
  br label %tailrecurse

tailrecurse:                                      ; preds = %if.then1, %entry
  %this.tr = phi %struct.struct_node* [ %this, %entry ], [ %4, %if.then1 ]
  %cmp = icmp eq %struct.struct_node* %this.tr, null
  br i1 %cmp, label %if.end2, label %if.end

if.end:                                           ; preds = %tailrecurse
  %0 = bitcast %struct.struct_node* %this.tr to i32*
  %1 = load i32* %0, align 8
  %bf.clear = and i32 %1, 4
  %tobool = icmp eq i32 %bf.clear, 0
  br i1 %tobool, label %if.end2, label %if.then1

if.then1:                                         ; preds = %if.end
  %2 = and i32 %1, -8
  store i32 %2, i32* %0, align 8
  %l = getelementptr inbounds %struct.struct_node* %this.tr, i64 0, i32 2
  %3 = load %struct.struct_node** %l, align 8, !tbaa !0
  tail call void @cleanGraph(%struct.struct_node* %3)
  %r = getelementptr inbounds %struct.struct_node* %this.tr, i64 0, i32 3
  %4 = load %struct.struct_node** %r, align 8, !tbaa !0
  br label %tailrecurse

if.end2:                                          ; preds = %if.end, %tailrecurse
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  %0 = load i32* @counter, align 4, !tbaa !3
  %call.i = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str, i64 0, i64 0), i32 %0) nounwind
  %call1.i = tail call noalias i8* @malloc(i64 32) nounwind
  %1 = bitcast i8* %call1.i to %struct.struct_node*
  %2 = bitcast i8* %call1.i to i32*
  %l.i = getelementptr inbounds i8* %call1.i, i64 8
  %3 = bitcast i8* %l.i to i64*
  store i64 0, i64* %3, align 8
  %4 = load i32* @counter, align 4, !tbaa !3
  %value.i = getelementptr inbounds i8* %call1.i, i64 24
  %5 = bitcast i8* %value.i to i32*
  store i32 %4, i32* %5, align 4, !tbaa !3
  store i32 32, i32* %2, align 8
  %inc.i = add nsw i32 %4, 1
  store i32 %inc.i, i32* @counter, align 4, !tbaa !3
  %call.i16 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str, i64 0, i64 0), i32 %inc.i) nounwind
  %call1.i17 = tail call noalias i8* @malloc(i64 32) nounwind
  %6 = bitcast i8* %call1.i17 to %struct.struct_node*
  %7 = bitcast i8* %call1.i17 to i32*
  %l.i18 = getelementptr inbounds i8* %call1.i17, i64 8
  tail call void @llvm.memset.p0i8.i64(i8* %l.i18, i8 0, i64 16, i32 8, i1 false) nounwind
  %8 = load i32* @counter, align 4, !tbaa !3
  %value.i19 = getelementptr inbounds i8* %call1.i17, i64 24
  %9 = bitcast i8* %value.i19 to i32*
  store i32 %8, i32* %9, align 4, !tbaa !3
  store i32 32, i32* %7, align 8
  %inc.i20 = add nsw i32 %8, 1
  store i32 %inc.i20, i32* @counter, align 4, !tbaa !3
  %call.i21 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str, i64 0, i64 0), i32 %inc.i20) nounwind
  %call1.i22 = tail call noalias i8* @malloc(i64 32) nounwind
  %10 = bitcast i8* %call1.i22 to %struct.struct_node*
  %11 = bitcast i8* %call1.i22 to i32*
  %l.i23 = getelementptr inbounds i8* %call1.i22, i64 8
  tail call void @llvm.memset.p0i8.i64(i8* %l.i23, i8 0, i64 16, i32 8, i1 false) nounwind
  %12 = load i32* @counter, align 4, !tbaa !3
  %value.i24 = getelementptr inbounds i8* %call1.i22, i64 24
  %13 = bitcast i8* %value.i24 to i32*
  store i32 %12, i32* %13, align 4, !tbaa !3
  store i32 32, i32* %11, align 8
  %inc.i25 = add nsw i32 %12, 1
  store i32 %inc.i25, i32* @counter, align 4, !tbaa !3
  %call.i26 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str, i64 0, i64 0), i32 %inc.i25) nounwind
  %call1.i27 = tail call noalias i8* @malloc(i64 32) nounwind
  %14 = bitcast i8* %call1.i27 to %struct.struct_node*
  %15 = bitcast i8* %call1.i27 to i32*
  %l.i28 = getelementptr inbounds i8* %call1.i27, i64 8
  tail call void @llvm.memset.p0i8.i64(i8* %l.i28, i8 0, i64 16, i32 8, i1 false) nounwind
  %16 = load i32* @counter, align 4, !tbaa !3
  %value.i29 = getelementptr inbounds i8* %call1.i27, i64 24
  %17 = bitcast i8* %value.i29 to i32*
  store i32 %16, i32* %17, align 4, !tbaa !3
  store i32 32, i32* %15, align 8
  %inc.i30 = add nsw i32 %16, 1
  store i32 %inc.i30, i32* @counter, align 4, !tbaa !3
  %call.i31 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str, i64 0, i64 0), i32 %inc.i30) nounwind
  %call1.i32 = tail call noalias i8* @malloc(i64 32) nounwind
  %18 = bitcast i8* %call1.i32 to %struct.struct_node*
  %19 = bitcast i8* %call1.i32 to i32*
  %l.i33 = getelementptr inbounds i8* %call1.i32, i64 8
  tail call void @llvm.memset.p0i8.i64(i8* %l.i33, i8 0, i64 16, i32 8, i1 false) nounwind
  %20 = load i32* @counter, align 4, !tbaa !3
  %value.i34 = getelementptr inbounds i8* %call1.i32, i64 24
  %21 = bitcast i8* %value.i34 to i32*
  store i32 %20, i32* %21, align 4, !tbaa !3
  store i32 32, i32* %19, align 8
  %inc.i35 = add nsw i32 %20, 1
  store i32 %inc.i35, i32* @counter, align 4, !tbaa !3
  %call.i37 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([32 x i8]* @.str1, i64 0, i64 0), i32 %4, i32 %8) nounwind
  %22 = bitcast i8* %l.i to %struct.struct_node**
  store %struct.struct_node* %6, %struct.struct_node** %22, align 8, !tbaa !0
  %call.i41 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([33 x i8]* @.str2, i64 0, i64 0), i32 %4, i32 %12) nounwind
  %r.i = getelementptr inbounds i8* %call1.i, i64 16
  %23 = bitcast i8* %r.i to %struct.struct_node**
  store %struct.struct_node* %10, %struct.struct_node** %23, align 8, !tbaa !0
  %24 = load i32* %9, align 4, !tbaa !3
  %call.i44 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([32 x i8]* @.str1, i64 0, i64 0), i32 %24, i32 %16) nounwind
  %25 = bitcast i8* %l.i18 to %struct.struct_node**
  store %struct.struct_node* %14, %struct.struct_node** %25, align 8, !tbaa !0
  %26 = load i32* %9, align 4, !tbaa !3
  %call.i48 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([33 x i8]* @.str2, i64 0, i64 0), i32 %26, i32 %16) nounwind
  %r.i49 = getelementptr inbounds i8* %call1.i17, i64 16
  %27 = bitcast i8* %r.i49 to %struct.struct_node**
  store %struct.struct_node* %14, %struct.struct_node** %27, align 8, !tbaa !0
  %28 = load i32* %13, align 4, !tbaa !3
  %29 = load i32* %9, align 4, !tbaa !3
  %call.i52 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([32 x i8]* @.str1, i64 0, i64 0), i32 %28, i32 %29) nounwind
  %30 = bitcast i8* %l.i23 to %struct.struct_node**
  store %struct.struct_node* %6, %struct.struct_node** %30, align 8, !tbaa !0
  %31 = load i32* %13, align 4, !tbaa !3
  %call.i56 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([33 x i8]* @.str2, i64 0, i64 0), i32 %31, i32 %4) nounwind
  %r.i57 = getelementptr inbounds i8* %call1.i22, i64 16
  %32 = bitcast i8* %r.i57 to %struct.struct_node**
  store %struct.struct_node* %1, %struct.struct_node** %32, align 8, !tbaa !0
  %33 = load i32* %17, align 4, !tbaa !3
  %34 = load i32* %13, align 4, !tbaa !3
  %call.i60 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([32 x i8]* @.str1, i64 0, i64 0), i32 %33, i32 %34) nounwind
  %35 = bitcast i8* %l.i28 to %struct.struct_node**
  store %struct.struct_node* %10, %struct.struct_node** %35, align 8, !tbaa !0
  %36 = load i32* %17, align 4, !tbaa !3
  %call.i64 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([33 x i8]* @.str2, i64 0, i64 0), i32 %36, i32 %20) nounwind
  %r.i65 = getelementptr inbounds i8* %call1.i27, i64 16
  %37 = bitcast i8* %r.i65 to %struct.struct_node**
  store %struct.struct_node* %18, %struct.struct_node** %37, align 8, !tbaa !0
  %call.i68 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([32 x i8]* @.str1, i64 0, i64 0), i32 %20, i32 %20) nounwind
  %38 = bitcast i8* %l.i33 to %struct.struct_node**
  store %struct.struct_node* %18, %struct.struct_node** %38, align 8, !tbaa !0
  %39 = load i32* %21, align 4, !tbaa !3
  %40 = load i32* %5, align 4, !tbaa !3
  %call.i72 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([33 x i8]* @.str2, i64 0, i64 0), i32 %39, i32 %40) nounwind
  %r.i73 = getelementptr inbounds i8* %call1.i32, i64 16
  %41 = bitcast i8* %r.i73 to %struct.struct_node**
  store %struct.struct_node* %1, %struct.struct_node** %41, align 8, !tbaa !0
  tail call void @showGraph(%struct.struct_node* %1)
  tail call void @cleanGraph(%struct.struct_node* %1)
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([28 x i8]* @str, i64 0, i64 0))
  br label %while.cond.outer.i

while.cond.outer.i:                               ; preds = %if.else13.i, %if.then7.i, %entry
  %t.0.ph.i = phi %struct.struct_node* [ %1, %entry ], [ %p.0.ph.i, %if.then7.i ], [ %52, %if.else13.i ]
  %p.0.ph.i = phi %struct.struct_node* [ null, %entry ], [ %48, %if.then7.i ], [ %t.0.lcssa19.i, %if.else13.i ]
  %cmp.i = icmp eq %struct.struct_node* %p.0.ph.i, null
  %42 = bitcast %struct.struct_node* %p.0.ph.i to i32*
  %r10.i = getelementptr inbounds %struct.struct_node* %p.0.ph.i, i64 0, i32 3
  %l.i74 = getelementptr inbounds %struct.struct_node* %p.0.ph.i, i64 0, i32 2
  br i1 %cmp.i, label %lor.rhs.us.i, label %while.body.i

land.rhs.us.i:                                    ; preds = %lor.rhs.us.i
  %43 = bitcast %struct.struct_node* %t.0.ph.i to i32*
  %44 = load i32* %43, align 8
  %bf.clear.us.i = and i32 %44, 1
  %lnot.us.i = icmp eq i32 %bf.clear.us.i, 0
  br i1 %lnot.us.i, label %if.else13.i, label %schorr_waite.exit

lor.rhs.us.i:                                     ; preds = %while.cond.outer.i
  %cmp1.us.i = icmp eq %struct.struct_node* %t.0.ph.i, null
  br i1 %cmp1.us.i, label %schorr_waite.exit, label %land.rhs.us.i

while.body.i:                                     ; preds = %while.cond.outer.i, %if.else.i
  %t.0.i = phi %struct.struct_node* [ %48, %if.else.i ], [ %t.0.ph.i, %while.cond.outer.i ]
  %cmp1.i = icmp eq %struct.struct_node* %t.0.i, null
  br i1 %cmp1.i, label %if.then.i, label %lor.lhs.false.i

lor.lhs.false.i:                                  ; preds = %while.body.i
  %45 = bitcast %struct.struct_node* %t.0.i to i32*
  %46 = load i32* %45, align 8
  %bf.clear3.i = and i32 %46, 1
  %tobool4.i = icmp eq i32 %bf.clear3.i, 0
  br i1 %tobool4.i, label %if.else13.i, label %if.then.i

if.then.i:                                        ; preds = %lor.lhs.false.i, %while.body.i
  %47 = load i32* %42, align 8
  %bf.clear5.i = and i32 %47, 2
  %tobool6.i = icmp eq i32 %bf.clear5.i, 0
  %48 = load %struct.struct_node** %r10.i, align 8, !tbaa !0
  br i1 %tobool6.i, label %if.else.i, label %if.then7.i

if.then7.i:                                       ; preds = %if.then.i
  store %struct.struct_node* %t.0.i, %struct.struct_node** %r10.i, align 8, !tbaa !0
  br label %while.cond.outer.i

if.else.i:                                        ; preds = %if.then.i
  %49 = load %struct.struct_node** %l.i74, align 8, !tbaa !0
  store %struct.struct_node* %49, %struct.struct_node** %r10.i, align 8, !tbaa !0
  store %struct.struct_node* %t.0.i, %struct.struct_node** %l.i74, align 8, !tbaa !0
  %50 = or i32 %47, 2
  store i32 %50, i32* %42, align 8
  br label %while.body.i

if.else13.i:                                      ; preds = %lor.lhs.false.i, %land.rhs.us.i
  %51 = phi i32 [ %44, %land.rhs.us.i ], [ %46, %lor.lhs.false.i ]
  %.lcssa21.i = phi i32* [ %43, %land.rhs.us.i ], [ %45, %lor.lhs.false.i ]
  %t.0.lcssa19.i = phi %struct.struct_node* [ %t.0.ph.i, %land.rhs.us.i ], [ %t.0.i, %lor.lhs.false.i ]
  %l15.i = getelementptr inbounds %struct.struct_node* %t.0.lcssa19.i, i64 0, i32 2
  %52 = load %struct.struct_node** %l15.i, align 8, !tbaa !0
  store %struct.struct_node* %p.0.ph.i, %struct.struct_node** %l15.i, align 8, !tbaa !0
  %53 = and i32 %51, -4
  %54 = or i32 %53, 1
  store i32 %54, i32* %.lcssa21.i, align 8
  br label %while.cond.outer.i

schorr_waite.exit:                                ; preds = %land.rhs.us.i, %lor.rhs.us.i
  tail call void @showGraph(%struct.struct_node* %1)
  ret i32 0
}

declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) nounwind

declare i32 @puts(i8* nocapture) nounwind

!0 = metadata !{metadata !"any pointer", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
!3 = metadata !{metadata !"int", metadata !1}
