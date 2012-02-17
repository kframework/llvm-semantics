; ModuleID = '/home/grosu/celliso2/c-semantics/tests/integration/merge-sort.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [4 x i8] c"%d,\00", align 1

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

define i32 @main() nounwind uwtable {
entry:
  %call.i = tail call noalias i8* @malloc(i64 12) nounwind
  %0 = bitcast i8* %call.i to i32*
  store i32 20, i32* %0, align 4
  %add.ptr.i = getelementptr inbounds i8* %call.i, i64 4
  %1 = bitcast i8* %add.ptr.i to i32**
  store i32* null, i32** %1, align 8
  %call.i1 = tail call noalias i8* @malloc(i64 12) nounwind
  %2 = bitcast i8* %call.i1 to i32*
  store i32 25, i32* %2, align 4
  %add.ptr.i2 = getelementptr inbounds i8* %call.i1, i64 4
  %3 = bitcast i8* %add.ptr.i2 to i32**
  store i32* %0, i32** %3, align 8
  %call.i3 = tail call noalias i8* @malloc(i64 12) nounwind
  %4 = bitcast i8* %call.i3 to i32*
  store i32 15, i32* %4, align 4
  %add.ptr.i4 = getelementptr inbounds i8* %call.i3, i64 4
  %5 = bitcast i8* %add.ptr.i4 to i32**
  store i32* %2, i32** %5, align 8
  %call.i5 = tail call noalias i8* @malloc(i64 12) nounwind
  %6 = bitcast i8* %call.i5 to i32*
  store i32 30, i32* %6, align 4
  %add.ptr.i6 = getelementptr inbounds i8* %call.i5, i64 4
  %7 = bitcast i8* %add.ptr.i6 to i32**
  store i32* %4, i32** %7, align 8
  %call.i7 = tail call noalias i8* @malloc(i64 12) nounwind
  %8 = bitcast i8* %call.i7 to i32*
  store i32 10, i32* %8, align 4
  %add.ptr.i8 = getelementptr inbounds i8* %call.i7, i64 4
  %9 = bitcast i8* %add.ptr.i8 to i32**
  store i32* %6, i32** %9, align 8
  %call.i9 = tail call noalias i8* @malloc(i64 12) nounwind
  %10 = bitcast i8* %call.i9 to i32*
  store i32 35, i32* %10, align 4
  %add.ptr.i10 = getelementptr inbounds i8* %call.i9, i64 4
  %11 = bitcast i8* %add.ptr.i10 to i32**
  store i32* %8, i32** %11, align 8
  %call12 = tail call i32* @fsl_mergesort(i32* %10)
  %cmp11 = icmp eq i32* %call12, null
  br i1 %cmp11, label %while.end, label %while.body

while.body:                                       ; preds = %entry, %while.body
  %storemerge12 = phi i32* [ %tmp20, %while.body ], [ %call12, %entry ]
  %tmp17 = load i32* %storemerge12, align 4
  %call18 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 %tmp17) nounwind
  %add.ptr = getelementptr inbounds i32* %storemerge12, i64 1
  %12 = bitcast i32* %add.ptr to i32**
  %tmp20 = load i32** %12, align 8
  %cmp = icmp eq i32* %tmp20, null
  br i1 %cmp, label %while.end, label %while.body

while.end:                                        ; preds = %while.body, %entry
  ret i32 0
}

define i32* @listCons(i32* %p, i32 %n) nounwind uwtable {
entry:
  %call = tail call noalias i8* @malloc(i64 12) nounwind
  %0 = bitcast i8* %call to i32*
  store i32 %n, i32* %0, align 4
  %add.ptr = getelementptr inbounds i8* %call, i64 4
  %1 = bitcast i8* %add.ptr to i32**
  store i32* %p, i32** %1, align 8
  ret i32* %0
}

define i32* @fsl_mergesort(i32* %l) nounwind uwtable {
entry:
  %cmp = icmp eq i32* %l, null
  br i1 %cmp, label %if.end78, label %land.lhs.true

land.lhs.true:                                    ; preds = %entry
  %add.ptr = getelementptr inbounds i32* %l, i64 1
  %0 = bitcast i32* %add.ptr to i32**
  %tmp2 = load i32** %0, align 8
  %tobool = icmp eq i32* %tmp2, null
  br i1 %tobool, label %if.end78, label %while.cond.outer

while.cond.outer:                                 ; preds = %land.lhs.true, %if.then22
  %tmp738.ph = phi i32* [ %tmp15, %if.then22 ], [ null, %land.lhs.true ]
  %tmp695.ph = phi i32* [ %tmp792, %if.then22 ], [ null, %land.lhs.true ]
  %tmp792.ph = phi i32* [ %tmp26, %if.then22 ], [ %l, %land.lhs.true ]
  br label %while.cond

while.cond:                                       ; preds = %while.cond.outer, %while.body
  %tmp695 = phi i32* [ %tmp792, %while.body ], [ %tmp695.ph, %while.cond.outer ]
  %tmp792 = phi i32* [ null, %while.body ], [ %tmp792.ph, %while.cond.outer ]
  %cmp11 = icmp eq i32* %tmp792, null
  br i1 %cmp11, label %while.end, label %while.body

while.body:                                       ; preds = %while.cond
  %add.ptr14 = getelementptr inbounds i32* %tmp792, i64 1
  %1 = bitcast i32* %add.ptr14 to i32**
  %tmp15 = load i32** %1, align 8
  store i32* %tmp695, i32** %1, align 8
  %cmp21 = icmp eq i32* %tmp15, null
  br i1 %cmp21, label %while.cond, label %if.then22

if.then22:                                        ; preds = %while.body
  %add.ptr25 = getelementptr inbounds i32* %tmp15, i64 1
  %2 = bitcast i32* %add.ptr25 to i32**
  %tmp26 = load i32** %2, align 8
  store i32* %tmp738.ph, i32** %2, align 8
  br label %while.cond.outer

while.end:                                        ; preds = %while.cond
  %call = tail call i32* @fsl_mergesort(i32* %tmp695)
  %call33 = tail call i32* @fsl_mergesort(i32* %tmp738.ph)
  br label %while.cond34.outer

while.cond34.outer:                               ; preds = %if.else.us, %if.then45.us, %while.end
  %tmp7711.ph = phi i32* [ null, %while.end ], [ %tmp737.ph, %if.else.us ], [ %tmp694.ph, %if.then45.us ]
  %tmp737.ph = phi i32* [ %call33, %while.end ], [ %tmp53.us, %if.else.us ], [ %tmp737.ph, %if.then45.us ]
  %tmp694.ph = phi i32* [ %call, %while.end ], [ %tmp694.ph, %if.else.us ], [ %tmp49.us, %if.then45.us ]
  %cmp56 = icmp eq i32* %tmp7711.ph, null
  br i1 %cmp56, label %while.cond34.us, label %while.cond34

while.cond34.us:                                  ; preds = %while.cond34.outer
  %cmp36.us = icmp eq i32* %tmp694.ph, null
  br i1 %cmp36.us, label %if.else72, label %land.rhs.us

if.then45.us:                                     ; preds = %while.body39.us
  %add.ptr48.us = getelementptr inbounds i32* %tmp694.ph, i64 1
  %3 = bitcast i32* %add.ptr48.us to i32**
  %tmp49.us = load i32** %3, align 8
  br label %while.cond34.outer

while.body39.us:                                  ; preds = %land.rhs.us
  %tmp41.us = load i32* %tmp737.ph, align 4
  %tmp43.us = load i32* %tmp694.ph, align 4
  %cmp44.us = icmp sgt i32 %tmp41.us, %tmp43.us
  br i1 %cmp44.us, label %if.then45.us, label %if.else.us

land.rhs.us:                                      ; preds = %while.cond34.us
  %cmp38.us = icmp eq i32* %tmp737.ph, null
  br i1 %cmp38.us, label %if.then68, label %while.body39.us

if.else.us:                                       ; preds = %while.body39.us
  %add.ptr52.us = getelementptr inbounds i32* %tmp737.ph, i64 1
  %4 = bitcast i32* %add.ptr52.us to i32**
  %tmp53.us = load i32** %4, align 8
  br label %while.cond34.outer

while.cond34:                                     ; preds = %while.cond34.outer, %if.then57
  %tmp737 = phi i32* [ %tmp736, %if.then57 ], [ %tmp737.ph, %while.cond34.outer ]
  %tmp694 = phi i32* [ %tmp693, %if.then57 ], [ %tmp694.ph, %while.cond34.outer ]
  %storemerge = phi i32* [ %tmp649, %if.then57 ], [ %tmp7711.ph, %while.cond34.outer ]
  %cmp36 = icmp eq i32* %tmp694, null
  br i1 %cmp36, label %if.else72, label %land.rhs

land.rhs:                                         ; preds = %while.cond34
  %cmp38 = icmp eq i32* %tmp737, null
  br i1 %cmp38, label %if.then68, label %while.body39

while.body39:                                     ; preds = %land.rhs
  %tmp41 = load i32* %tmp737, align 4
  %tmp43 = load i32* %tmp694, align 4
  %cmp44 = icmp sgt i32 %tmp41, %tmp43
  br i1 %cmp44, label %if.then45, label %if.else

if.then45:                                        ; preds = %while.body39
  %add.ptr48 = getelementptr inbounds i32* %tmp694, i64 1
  %5 = bitcast i32* %add.ptr48 to i32**
  %tmp49 = load i32** %5, align 8
  br label %if.then57

if.else:                                          ; preds = %while.body39
  %add.ptr52 = getelementptr inbounds i32* %tmp737, i64 1
  %6 = bitcast i32* %add.ptr52 to i32**
  %tmp53 = load i32** %6, align 8
  br label %if.then57

if.then57:                                        ; preds = %if.then45, %if.else
  %tmp693 = phi i32* [ %tmp694, %if.else ], [ %tmp49, %if.then45 ]
  %tmp736 = phi i32* [ %tmp53, %if.else ], [ %tmp737, %if.then45 ]
  %tmp649 = phi i32* [ %tmp737, %if.else ], [ %tmp694, %if.then45 ]
  %add.ptr60 = getelementptr inbounds i32* %storemerge, i64 1
  %7 = bitcast i32* %add.ptr60 to i32**
  store i32* %tmp649, i32** %7, align 8
  br label %while.cond34

if.then68:                                        ; preds = %land.rhs, %land.rhs.us
  %storemerge.lcssa17 = phi i32* [ %tmp7711.ph, %land.rhs.us ], [ %storemerge, %land.rhs ]
  %tmp694.lcssa15 = phi i32* [ %tmp694.ph, %land.rhs.us ], [ %tmp694, %land.rhs ]
  %add.ptr71 = getelementptr inbounds i32* %storemerge.lcssa17, i64 1
  %8 = bitcast i32* %add.ptr71 to i32**
  store i32* %tmp694.lcssa15, i32** %8, align 8
  br label %if.end78

if.else72:                                        ; preds = %while.cond34, %while.cond34.us
  %storemerge.lcssa = phi i32* [ %tmp7711.ph, %while.cond34.us ], [ %storemerge, %while.cond34 ]
  %tmp737.lcssa = phi i32* [ %tmp737.ph, %while.cond34.us ], [ %tmp737, %while.cond34 ]
  %add.ptr75 = getelementptr inbounds i32* %storemerge.lcssa, i64 1
  %9 = bitcast i32* %add.ptr75 to i32**
  store i32* %tmp737.lcssa, i32** %9, align 8
  br label %if.end78

if.end78:                                         ; preds = %if.then68, %if.else72, %land.lhs.true, %entry
  %tmp791 = phi i32* [ %l, %land.lhs.true ], [ null, %entry ], [ %tmp7711.ph, %if.else72 ], [ %tmp7711.ph, %if.then68 ]
  ret i32* %tmp791
}

declare i32 @printf(i8* nocapture, ...) nounwind

declare noalias i8* @malloc(i64) nounwind
