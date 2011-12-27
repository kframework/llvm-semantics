; ModuleID = '/home/grosu/celliso2/c-semantics/tests/integration/schorr-waite.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.struct_node = type <{ i8, [7 x i8], %struct.struct_node*, %struct.struct_node*, i32, [4 x i8] }>

@counter = global i32 0, align 4
@.str = private unnamed_addr constant [22 x i8] c"creating new node %d\0A\00", align 1
@.str1 = private unnamed_addr constant [32 x i8] c"Setting left child of %d to %d\0A\00", align 1
@.str2 = private unnamed_addr constant [33 x i8] c"Setting right child of %d to %d\0A\00", align 1
@.str3 = private unnamed_addr constant [19 x i8] c"%d:m=%d:l=%d:r=%d\0A\00", align 1
@str = internal constant [28 x i8] c"Now running Schorr-Waite...\00"

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

define void @schorr_waite(%struct.struct_node* %root) nounwind uwtable {
entry:
  br label %while.cond.outer

while.cond.outer:                                 ; preds = %if.then14, %if.else37, %entry
  %tmp492.ph = phi %struct.struct_node* [ null, %entry ], [ %tmp441.lcssa4, %if.else37 ], [ %tmp28.lcssa, %if.then14 ]
  %tmp441.ph = phi %struct.struct_node* [ %root, %entry ], [ %tmp44, %if.else37 ], [ %tmp492.ph, %if.then14 ]
  %cmp = icmp eq %struct.struct_node* %tmp492.ph, null
  %0 = bitcast %struct.struct_node* %tmp492.ph to i32*
  %r27 = getelementptr inbounds %struct.struct_node* %tmp492.ph, i64 0, i32 3
  %l = getelementptr inbounds %struct.struct_node* %tmp492.ph, i64 0, i32 2
  br i1 %cmp, label %lor.rhs.us, label %while.body

if.then.us:                                       ; preds = %lor.lhs.false.us
  %1 = load i32* %0, align 8
  %bf.clear12.us = and i32 %1, 2
  %tobool13.us = icmp eq i32 %bf.clear12.us, 0
  %tmp28.us = load %struct.struct_node** %r27, align 8
  br i1 %tobool13.us, label %if.else.us, label %if.then14

lor.lhs.false.us:                                 ; preds = %land.rhs.us
  %bf.clear9.us = and i32 %3, 1
  %tobool10.us = icmp eq i32 %bf.clear9.us, 0
  br i1 %tobool10.us, label %if.else37.us-lcssa.us, label %if.then.us

land.rhs.us:                                      ; preds = %lor.rhs.us
  %2 = bitcast %struct.struct_node* %tmp441.us to i32*
  %3 = load i32* %2, align 8
  %bf.clear.us = and i32 %3, 1
  %lnot.us = icmp eq i32 %bf.clear.us, 0
  br i1 %lnot.us, label %lor.lhs.false.us, label %while.end

lor.rhs.us:                                       ; preds = %if.else.us, %while.cond.outer
  %tmp441.us = phi %struct.struct_node* [ %tmp28.us, %if.else.us ], [ %tmp441.ph, %while.cond.outer ]
  %cmp4.us = icmp eq %struct.struct_node* %tmp441.us, null
  br i1 %cmp4.us, label %while.end, label %land.rhs.us

if.else.us:                                       ; preds = %if.then.us
  %tmp30.us = load %struct.struct_node** %l, align 8
  store %struct.struct_node* %tmp30.us, %struct.struct_node** %r27, align 8
  store %struct.struct_node* %tmp441.us, %struct.struct_node** %l, align 8
  %4 = or i32 %1, 2
  store i32 %4, i32* %0, align 8
  br label %lor.rhs.us

if.else37.us-lcssa.us:                            ; preds = %lor.lhs.false.us
  %5 = bitcast %struct.struct_node* %tmp441.us to i32*
  br label %if.else37

while.body:                                       ; preds = %if.else, %while.cond.outer
  %tmp441 = phi %struct.struct_node* [ %tmp28, %if.else ], [ %tmp441.ph, %while.cond.outer ]
  %cmp4 = icmp eq %struct.struct_node* %tmp441, null
  br i1 %cmp4, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %while.body
  %6 = bitcast %struct.struct_node* %tmp441 to i32*
  %7 = load i32* %6, align 8
  %bf.clear9 = and i32 %7, 1
  %tobool10 = icmp eq i32 %bf.clear9, 0
  br i1 %tobool10, label %if.else37, label %if.then

if.then:                                          ; preds = %lor.lhs.false, %while.body
  %8 = load i32* %0, align 8
  %bf.clear12 = and i32 %8, 2
  %tobool13 = icmp eq i32 %bf.clear12, 0
  %tmp28 = load %struct.struct_node** %r27, align 8
  br i1 %tobool13, label %if.else, label %if.then14

if.then14:                                        ; preds = %if.then, %if.then.us
  %tmp28.lcssa = phi %struct.struct_node* [ %tmp28.us, %if.then.us ], [ %tmp28, %if.then ]
  %tmp441.lcssa = phi %struct.struct_node* [ %tmp441.us, %if.then.us ], [ %tmp441, %if.then ]
  store %struct.struct_node* %tmp441.lcssa, %struct.struct_node** %r27, align 8
  br label %while.cond.outer

if.else:                                          ; preds = %if.then
  %tmp30 = load %struct.struct_node** %l, align 8
  store %struct.struct_node* %tmp30, %struct.struct_node** %r27, align 8
  store %struct.struct_node* %tmp441, %struct.struct_node** %l, align 8
  %9 = or i32 %8, 2
  store i32 %9, i32* %0, align 8
  br label %while.body

if.else37:                                        ; preds = %lor.lhs.false, %if.else37.us-lcssa.us
  %10 = phi i32 [ %3, %if.else37.us-lcssa.us ], [ %7, %lor.lhs.false ]
  %.lcssa = phi i32* [ %5, %if.else37.us-lcssa.us ], [ %6, %lor.lhs.false ]
  %tmp441.lcssa4 = phi %struct.struct_node* [ %tmp441.us, %if.else37.us-lcssa.us ], [ %tmp441, %lor.lhs.false ]
  %l43 = getelementptr inbounds %struct.struct_node* %tmp441.lcssa4, i64 0, i32 2
  %tmp44 = load %struct.struct_node** %l43, align 8
  store %struct.struct_node* %tmp492.ph, %struct.struct_node** %l43, align 8
  %11 = and i32 %10, -4
  %12 = or i32 %11, 1
  store i32 %12, i32* %.lcssa, align 8
  br label %while.cond.outer

while.end:                                        ; preds = %land.rhs.us, %lor.rhs.us
  ret void
}

define %struct.struct_node* @createNode() nounwind uwtable {
entry:
  %tmp = load i32* @counter, align 4
  %call = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str, i64 0, i64 0), i32 %tmp) nounwind
  %call2 = tail call noalias i8* @malloc(i64 32) nounwind
  %0 = bitcast i8* %call2 to %struct.struct_node*
  %1 = bitcast i8* %call2 to i32*
  %l = getelementptr inbounds i8* %call2, i64 8
  %2 = bitcast i8* %l to %struct.struct_node**
  store %struct.struct_node* null, %struct.struct_node** %2, align 8
  %r = getelementptr inbounds i8* %call2, i64 16
  %3 = bitcast i8* %r to %struct.struct_node**
  store %struct.struct_node* null, %struct.struct_node** %3, align 8
  %tmp8 = load i32* @counter, align 4
  %value = getelementptr inbounds i8* %call2, i64 24
  %4 = bitcast i8* %value to i32*
  store i32 %tmp8, i32* %4, align 4
  store i32 32, i32* %1, align 8
  %inc = add nsw i32 %tmp8, 1
  store i32 %inc, i32* @counter, align 4
  ret %struct.struct_node* %0
}

declare i32 @printf(i8* nocapture, ...) nounwind

declare noalias i8* @malloc(i64) nounwind

define %struct.struct_node* @setLeft(%struct.struct_node* %curr, %struct.struct_node* %left) nounwind uwtable {
entry:
  %value = getelementptr inbounds %struct.struct_node* %curr, i64 0, i32 4
  %tmp1 = load i32* %value, align 4
  %value3 = getelementptr inbounds %struct.struct_node* %left, i64 0, i32 4
  %tmp4 = load i32* %value3, align 4
  %call = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([32 x i8]* @.str1, i64 0, i64 0), i32 %tmp1, i32 %tmp4) nounwind
  %l = getelementptr inbounds %struct.struct_node* %curr, i64 0, i32 2
  store %struct.struct_node* %left, %struct.struct_node** %l, align 8
  ret %struct.struct_node* %left
}

define %struct.struct_node* @setRight(%struct.struct_node* %curr, %struct.struct_node* %right) nounwind uwtable {
entry:
  %value = getelementptr inbounds %struct.struct_node* %curr, i64 0, i32 4
  %tmp1 = load i32* %value, align 4
  %value3 = getelementptr inbounds %struct.struct_node* %right, i64 0, i32 4
  %tmp4 = load i32* %value3, align 4
  %call = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([33 x i8]* @.str2, i64 0, i64 0), i32 %tmp1, i32 %tmp4) nounwind
  %r = getelementptr inbounds %struct.struct_node* %curr, i64 0, i32 3
  store %struct.struct_node* %right, %struct.struct_node** %r, align 8
  ret %struct.struct_node* %right
}

define void @showGraph(%struct.struct_node* %this) nounwind uwtable {
entry:
  br label %tailrecurse

tailrecurse:                                      ; preds = %if.end3, %entry
  %this.tr = phi %struct.struct_node* [ %this, %entry ], [ %tmp22, %if.end3 ]
  %cmp = icmp eq %struct.struct_node* %this.tr, null
  br i1 %cmp, label %return, label %if.end

if.end:                                           ; preds = %tailrecurse
  %0 = bitcast %struct.struct_node* %this.tr to i32*
  %1 = load i32* %0, align 8
  %bf.clear = and i32 %1, 4
  %tobool = icmp eq i32 %bf.clear, 0
  br i1 %tobool, label %if.end3, label %return

if.end3:                                          ; preds = %if.end
  %value = getelementptr inbounds %struct.struct_node* %this.tr, i64 0, i32 4
  %tmp5 = load i32* %value, align 4
  %bf.clear7 = and i32 %1, 1
  %l = getelementptr inbounds %struct.struct_node* %this.tr, i64 0, i32 2
  %tmp9 = load %struct.struct_node** %l, align 8
  %value10 = getelementptr inbounds %struct.struct_node* %tmp9, i64 0, i32 4
  %tmp11 = load i32* %value10, align 4
  %r = getelementptr inbounds %struct.struct_node* %this.tr, i64 0, i32 3
  %tmp13 = load %struct.struct_node** %r, align 8
  %value14 = getelementptr inbounds %struct.struct_node* %tmp13, i64 0, i32 4
  %tmp15 = load i32* %value14, align 4
  %call = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str3, i64 0, i64 0), i32 %tmp5, i32 %bf.clear7, i32 %tmp11, i32 %tmp15) nounwind
  %2 = load i32* %0, align 8
  %3 = or i32 %2, 4
  store i32 %3, i32* %0, align 8
  %tmp19 = load %struct.struct_node** %l, align 8
  tail call void @showGraph(%struct.struct_node* %tmp19)
  %tmp22 = load %struct.struct_node** %r, align 8
  br label %tailrecurse

return:                                           ; preds = %if.end, %tailrecurse
  ret void
}

define void @cleanGraph(%struct.struct_node* %this) nounwind uwtable {
entry:
  br label %tailrecurse

tailrecurse:                                      ; preds = %if.then2, %entry
  %this.tr = phi %struct.struct_node* [ %this, %entry ], [ %tmp9, %if.then2 ]
  %cmp = icmp eq %struct.struct_node* %this.tr, null
  br i1 %cmp, label %if.end10, label %if.end

if.end:                                           ; preds = %tailrecurse
  %0 = bitcast %struct.struct_node* %this.tr to i32*
  %1 = load i32* %0, align 8
  %bf.clear = and i32 %1, 4
  %tobool = icmp eq i32 %bf.clear, 0
  br i1 %tobool, label %if.end10, label %if.then2

if.then2:                                         ; preds = %if.end
  %2 = and i32 %1, -8
  store i32 %2, i32* %0, align 8
  %l = getelementptr inbounds %struct.struct_node* %this.tr, i64 0, i32 2
  %tmp7 = load %struct.struct_node** %l, align 8
  tail call void @cleanGraph(%struct.struct_node* %tmp7)
  %r = getelementptr inbounds %struct.struct_node* %this.tr, i64 0, i32 3
  %tmp9 = load %struct.struct_node** %r, align 8
  br label %tailrecurse

if.end10:                                         ; preds = %tailrecurse, %if.end
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  %tmp.i = load i32* @counter, align 4
  %call.i = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str, i64 0, i64 0), i32 %tmp.i) nounwind
  %call2.i = tail call noalias i8* @malloc(i64 32) nounwind
  %0 = bitcast i8* %call2.i to %struct.struct_node*
  %1 = bitcast i8* %call2.i to i32*
  %l.i = getelementptr inbounds i8* %call2.i, i64 8
  %2 = bitcast i8* %l.i to %struct.struct_node**
  store %struct.struct_node* null, %struct.struct_node** %2, align 8
  %r.i = getelementptr inbounds i8* %call2.i, i64 16
  %3 = bitcast i8* %r.i to %struct.struct_node**
  store %struct.struct_node* null, %struct.struct_node** %3, align 8
  %tmp8.i = load i32* @counter, align 4
  %value.i = getelementptr inbounds i8* %call2.i, i64 24
  %4 = bitcast i8* %value.i to i32*
  store i32 %tmp8.i, i32* %4, align 4
  store i32 32, i32* %1, align 8
  %inc.i = add nsw i32 %tmp8.i, 1
  store i32 %inc.i, i32* @counter, align 4
  %call.i2 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str, i64 0, i64 0), i32 %inc.i) nounwind
  %call2.i3 = tail call noalias i8* @malloc(i64 32) nounwind
  %5 = bitcast i8* %call2.i3 to %struct.struct_node*
  %6 = bitcast i8* %call2.i3 to i32*
  %l.i4 = getelementptr inbounds i8* %call2.i3, i64 8
  %7 = bitcast i8* %l.i4 to %struct.struct_node**
  store %struct.struct_node* null, %struct.struct_node** %7, align 8
  %r.i5 = getelementptr inbounds i8* %call2.i3, i64 16
  %8 = bitcast i8* %r.i5 to %struct.struct_node**
  store %struct.struct_node* null, %struct.struct_node** %8, align 8
  %tmp8.i6 = load i32* @counter, align 4
  %value.i7 = getelementptr inbounds i8* %call2.i3, i64 24
  %9 = bitcast i8* %value.i7 to i32*
  store i32 %tmp8.i6, i32* %9, align 4
  store i32 32, i32* %6, align 8
  %inc.i8 = add nsw i32 %tmp8.i6, 1
  store i32 %inc.i8, i32* @counter, align 4
  %call.i10 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str, i64 0, i64 0), i32 %inc.i8) nounwind
  %call2.i11 = tail call noalias i8* @malloc(i64 32) nounwind
  %10 = bitcast i8* %call2.i11 to %struct.struct_node*
  %11 = bitcast i8* %call2.i11 to i32*
  %l.i12 = getelementptr inbounds i8* %call2.i11, i64 8
  %12 = bitcast i8* %l.i12 to %struct.struct_node**
  store %struct.struct_node* null, %struct.struct_node** %12, align 8
  %r.i13 = getelementptr inbounds i8* %call2.i11, i64 16
  %13 = bitcast i8* %r.i13 to %struct.struct_node**
  store %struct.struct_node* null, %struct.struct_node** %13, align 8
  %tmp8.i14 = load i32* @counter, align 4
  %value.i15 = getelementptr inbounds i8* %call2.i11, i64 24
  %14 = bitcast i8* %value.i15 to i32*
  store i32 %tmp8.i14, i32* %14, align 4
  store i32 32, i32* %11, align 8
  %inc.i16 = add nsw i32 %tmp8.i14, 1
  store i32 %inc.i16, i32* @counter, align 4
  %call.i18 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str, i64 0, i64 0), i32 %inc.i16) nounwind
  %call2.i19 = tail call noalias i8* @malloc(i64 32) nounwind
  %15 = bitcast i8* %call2.i19 to %struct.struct_node*
  %16 = bitcast i8* %call2.i19 to i32*
  %l.i20 = getelementptr inbounds i8* %call2.i19, i64 8
  %17 = bitcast i8* %l.i20 to %struct.struct_node**
  store %struct.struct_node* null, %struct.struct_node** %17, align 8
  %r.i21 = getelementptr inbounds i8* %call2.i19, i64 16
  %18 = bitcast i8* %r.i21 to %struct.struct_node**
  store %struct.struct_node* null, %struct.struct_node** %18, align 8
  %tmp8.i22 = load i32* @counter, align 4
  %value.i23 = getelementptr inbounds i8* %call2.i19, i64 24
  %19 = bitcast i8* %value.i23 to i32*
  store i32 %tmp8.i22, i32* %19, align 4
  store i32 32, i32* %16, align 8
  %inc.i24 = add nsw i32 %tmp8.i22, 1
  store i32 %inc.i24, i32* @counter, align 4
  %call.i26 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str, i64 0, i64 0), i32 %inc.i24) nounwind
  %call2.i27 = tail call noalias i8* @malloc(i64 32) nounwind
  %20 = bitcast i8* %call2.i27 to %struct.struct_node*
  %21 = bitcast i8* %call2.i27 to i32*
  %l.i28 = getelementptr inbounds i8* %call2.i27, i64 8
  %22 = bitcast i8* %l.i28 to %struct.struct_node**
  store %struct.struct_node* null, %struct.struct_node** %22, align 8
  %r.i29 = getelementptr inbounds i8* %call2.i27, i64 16
  %23 = bitcast i8* %r.i29 to %struct.struct_node**
  store %struct.struct_node* null, %struct.struct_node** %23, align 8
  %tmp8.i30 = load i32* @counter, align 4
  %value.i31 = getelementptr inbounds i8* %call2.i27, i64 24
  %24 = bitcast i8* %value.i31 to i32*
  store i32 %tmp8.i30, i32* %24, align 4
  store i32 32, i32* %21, align 8
  %inc.i32 = add nsw i32 %tmp8.i30, 1
  store i32 %inc.i32, i32* @counter, align 4
  %tmp1.i = load i32* %4, align 4
  %tmp4.i = load i32* %9, align 4
  %call.i34 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([32 x i8]* @.str1, i64 0, i64 0), i32 %tmp1.i, i32 %tmp4.i) nounwind
  store %struct.struct_node* %5, %struct.struct_node** %2, align 8
  %tmp1.i37 = load i32* %4, align 4
  %tmp4.i39 = load i32* %14, align 4
  %call.i40 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([33 x i8]* @.str2, i64 0, i64 0), i32 %tmp1.i37, i32 %tmp4.i39) nounwind
  store %struct.struct_node* %10, %struct.struct_node** %3, align 8
  %tmp1.i43 = load i32* %9, align 4
  %tmp4.i45 = load i32* %19, align 4
  %call.i46 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([32 x i8]* @.str1, i64 0, i64 0), i32 %tmp1.i43, i32 %tmp4.i45) nounwind
  store %struct.struct_node* %15, %struct.struct_node** %7, align 8
  %tmp1.i49 = load i32* %9, align 4
  %tmp4.i51 = load i32* %19, align 4
  %call.i52 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([33 x i8]* @.str2, i64 0, i64 0), i32 %tmp1.i49, i32 %tmp4.i51) nounwind
  store %struct.struct_node* %15, %struct.struct_node** %8, align 8
  %tmp1.i55 = load i32* %14, align 4
  %tmp4.i57 = load i32* %9, align 4
  %call.i58 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([32 x i8]* @.str1, i64 0, i64 0), i32 %tmp1.i55, i32 %tmp4.i57) nounwind
  store %struct.struct_node* %5, %struct.struct_node** %12, align 8
  %tmp1.i61 = load i32* %14, align 4
  %tmp4.i63 = load i32* %4, align 4
  %call.i64 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([33 x i8]* @.str2, i64 0, i64 0), i32 %tmp1.i61, i32 %tmp4.i63) nounwind
  store %struct.struct_node* %0, %struct.struct_node** %13, align 8
  %tmp1.i67 = load i32* %19, align 4
  %tmp4.i69 = load i32* %14, align 4
  %call.i70 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([32 x i8]* @.str1, i64 0, i64 0), i32 %tmp1.i67, i32 %tmp4.i69) nounwind
  store %struct.struct_node* %10, %struct.struct_node** %17, align 8
  %tmp1.i73 = load i32* %19, align 4
  %tmp4.i75 = load i32* %24, align 4
  %call.i76 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([33 x i8]* @.str2, i64 0, i64 0), i32 %tmp1.i73, i32 %tmp4.i75) nounwind
  store %struct.struct_node* %20, %struct.struct_node** %18, align 8
  %tmp1.i79 = load i32* %24, align 4
  %call.i82 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([32 x i8]* @.str1, i64 0, i64 0), i32 %tmp1.i79, i32 %tmp1.i79) nounwind
  store %struct.struct_node* %20, %struct.struct_node** %22, align 8
  %tmp1.i85 = load i32* %24, align 4
  %tmp4.i87 = load i32* %4, align 4
  %call.i88 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([33 x i8]* @.str2, i64 0, i64 0), i32 %tmp1.i85, i32 %tmp4.i87) nounwind
  store %struct.struct_node* %0, %struct.struct_node** %23, align 8
  tail call void @showGraph(%struct.struct_node* %0)
  tail call void @cleanGraph(%struct.struct_node* %0)
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([28 x i8]* @str, i64 0, i64 0))
  tail call void @schorr_waite(%struct.struct_node* %0)
  tail call void @showGraph(%struct.struct_node* %0)
  ret i32 0
}

declare i32 @puts(i8* nocapture) nounwind
