; ModuleID = '/home/grosu/celliso2/c-semantics/tests/integration/binarySearch.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [28 x i8] c"Couldn't find %d in array:\0A\00", align 1
@.str1 = private unnamed_addr constant [12 x i8] c"a[%d] = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [17 x i8] c"looking for %d, \00", align 1
@.str4 = private unnamed_addr constant [10 x i8] c"found %d\0A\00", align 1
@str = internal constant [27 x i8] c"present_val == a[found_at]\00"
@str1 = internal constant [31 x i8] c"BUG present_val == a[found_at]\00"

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

define i32 @binary_search(i32* %a, i32 %low, i32 %high, i32 %target) nounwind uwtable {
entry:
  br label %while.cond.outer

while.cond.outer:                                 ; preds = %entry, %if.then
  %sub153.ph = phi i32 [ %sub15, %if.then ], [ %high, %entry ]
  %add252.ph = phi i32 [ %add252, %if.then ], [ %low, %entry ]
  br label %while.cond

while.cond:                                       ; preds = %while.cond.outer, %if.then23
  %add252 = phi i32 [ %add25, %if.then23 ], [ %add252.ph, %while.cond.outer ]
  %cmp = icmp sgt i32 %add252, %sub153.ph
  br i1 %cmp, label %while.end, label %while.body

while.body:                                       ; preds = %while.cond
  %sub = sub nsw i32 %sub153.ph, %add252
  %div = sdiv i32 %sub, 2
  %add = add nsw i32 %div, %add252
  %idxprom = sext i32 %add to i64
  %arrayidx = getelementptr inbounds i32* %a, i64 %idxprom
  %tmp12 = load i32* %arrayidx, align 4
  %cmp13 = icmp sgt i32 %tmp12, %target
  br i1 %cmp13, label %if.then, label %if.else

if.then:                                          ; preds = %while.body
  %sub15 = add nsw i32 %add, -1
  br label %while.cond.outer

if.else:                                          ; preds = %while.body
  %cmp22 = icmp slt i32 %tmp12, %target
  br i1 %cmp22, label %if.then23, label %return

if.then23:                                        ; preds = %if.else
  %add25 = add nsw i32 %add, 1
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %call = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str, i64 0, i64 0), i32 %target) nounwind
  %cmp344 = icmp slt i32 %low, %high
  br i1 %cmp344, label %for.body.lr.ph, label %return

for.body.lr.ph:                                   ; preds = %while.end
  %tmp = add i32 %high, -1
  %tmp10 = sub i32 %tmp, %low
  %tmp11 = zext i32 %tmp10 to i64
  %tmp13 = add i64 %tmp11, 1
  %tmp14 = sext i32 %low to i64
  %tmp16 = zext i32 %low to i64
  br label %for.body

for.body:                                         ; preds = %for.body, %for.body.lr.ph
  %indvar = phi i64 [ 0, %for.body.lr.ph ], [ %indvar.next, %for.body ]
  %tmp15 = add i64 %tmp14, %indvar
  %arrayidx39 = getelementptr i32* %a, i64 %tmp15
  %tmp17 = add i64 %tmp16, %indvar
  %storemerge5 = trunc i64 %tmp17 to i32
  %tmp40 = load i32* %arrayidx39, align 4
  %call41 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([12 x i8]* @.str1, i64 0, i64 0), i32 %storemerge5, i32 %tmp40) nounwind
  %indvar.next = add i64 %indvar, 1
  %exitcond = icmp eq i64 %indvar.next, %tmp13
  br i1 %exitcond, label %return, label %for.body

return:                                           ; preds = %if.else, %while.end, %for.body
  %storemerge1 = phi i32 [ -1, %for.body ], [ -1, %while.end ], [ %add, %if.else ]
  ret i32 %storemerge1
}

declare i32 @printf(i8* nocapture, ...) nounwind

define void @insertion_sort(i32* %a, i32 %length) nounwind uwtable {
entry:
  %cmp2 = icmp sgt i32 %length, 0
  br i1 %cmp2, label %for.body.lr.ph, label %for.end37

for.body.lr.ph:                                   ; preds = %entry
  %tmp11 = zext i32 %length to i64
  br label %for.body

for.body:                                         ; preds = %for.end, %for.body.lr.ph
  %indvar4 = phi i64 [ 0, %for.body.lr.ph ], [ %indvar.next5, %for.end ]
  %tmp13 = add i64 %indvar4, -1
  %arrayidx = getelementptr i32* %a, i64 %indvar4
  %tmp6 = load i32* %arrayidx, align 4
  br label %for.cond8

for.cond8:                                        ; preds = %if.end, %for.body
  %indvar = phi i64 [ %indvar.next, %if.end ], [ 0, %for.body ]
  %tmp15 = sub i64 %indvar4, %indvar
  %arrayidx27 = getelementptr i32* %a, i64 %tmp15
  %storemerge1.in = trunc i64 %tmp15 to i32
  %cmp10 = icmp sgt i32 %storemerge1.in, 0
  br i1 %cmp10, label %for.body11, label %for.end

for.body11:                                       ; preds = %for.cond8
  %tmp14 = sub i64 %tmp13, %indvar
  %arrayidx15 = getelementptr i32* %a, i64 %tmp14
  %tmp16 = load i32* %arrayidx15, align 4
  %cmp18 = icmp sgt i32 %tmp16, %tmp6
  br i1 %cmp18, label %if.end, label %for.end

if.end:                                           ; preds = %for.body11
  store i32 %tmp16, i32* %arrayidx27, align 4
  %indvar.next = add i64 %indvar, 1
  br label %for.cond8

for.end:                                          ; preds = %for.body11, %for.cond8
  %idxprom32 = sext i32 %storemerge1.in to i64
  %arrayidx34 = getelementptr inbounds i32* %a, i64 %idxprom32
  store i32 %tmp6, i32* %arrayidx34, align 4
  %indvar.next5 = add i64 %indvar4, 1
  %exitcond = icmp eq i64 %indvar.next5, %tmp11
  br i1 %exitcond, label %for.end37, label %for.body

for.end37:                                        ; preds = %for.end, %entry
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  %call = tail call noalias i8* @malloc(i64 60) nounwind
  br label %do.body.preheader

do.body.preheader:                                ; preds = %for.inc, %entry
  %indvar = phi i64 [ 0, %entry ], [ %indvar.next, %for.inc ]
  %tmp = shl i64 %indvar, 2
  %scevgep = getelementptr i8* %call, i64 %tmp
  %arrayidx = bitcast i8* %scevgep to i32*
  br label %do.body

for.body.i.preheader:                             ; preds = %for.inc
  %0 = bitcast i8* %call to i32*
  br label %for.body.i

do.body:                                          ; preds = %do.body.preheader, %do.body
  %call5 = tail call i32 @rand() nounwind
  %rem = srem i32 %call5, 15
  store i32 %rem, i32* %arrayidx, align 4
  %cmp15 = icmp eq i32 %rem, 2
  br i1 %cmp15, label %do.body, label %for.inc

for.inc:                                          ; preds = %do.body
  %indvar.next = add i64 %indvar, 1
  %exitcond31 = icmp eq i64 %indvar.next, 15
  br i1 %exitcond31, label %for.body.i.preheader, label %do.body.preheader

for.body.i:                                       ; preds = %for.body.i.preheader, %for.end.i
  %indvar4.i = phi i64 [ %1, %for.end.i ], [ 0, %for.body.i.preheader ]
  %tmp20 = shl i64 %indvar4.i, 2
  %tmp24 = add i64 %tmp20, -4
  %scevgep29 = getelementptr i8* %call, i64 %tmp20
  %arrayidx.i = bitcast i8* %scevgep29 to i32*
  %tmp6.i = load i32* %arrayidx.i, align 4
  br label %for.cond8.i

for.cond8.i:                                      ; preds = %if.end.i, %for.body.i
  %indvar.i = phi i64 [ %indvar.next.i, %if.end.i ], [ 0, %for.body.i ]
  %tmp17 = sub i64 %indvar4.i, %indvar.i
  %storemerge1.in.i = trunc i64 %tmp17 to i32
  %tmp19 = mul i64 %indvar.i, -4
  %tmp21 = add i64 %tmp20, %tmp19
  %scevgep22 = getelementptr i8* %call, i64 %tmp21
  %arrayidx27.i = bitcast i8* %scevgep22 to i32*
  %cmp10.i = icmp sgt i32 %storemerge1.in.i, 0
  br i1 %cmp10.i, label %for.body11.i, label %for.end.i

for.body11.i:                                     ; preds = %for.cond8.i
  %tmp25 = add i64 %tmp24, %tmp19
  %scevgep26 = getelementptr i8* %call, i64 %tmp25
  %arrayidx15.i = bitcast i8* %scevgep26 to i32*
  %tmp16.i = load i32* %arrayidx15.i, align 4
  %cmp18.i = icmp sgt i32 %tmp16.i, %tmp6.i
  br i1 %cmp18.i, label %if.end.i, label %for.end.i

if.end.i:                                         ; preds = %for.body11.i
  store i32 %tmp16.i, i32* %arrayidx27.i, align 4
  %indvar.next.i = add i64 %indvar.i, 1
  br label %for.cond8.i

for.end.i:                                        ; preds = %for.body11.i, %for.cond8.i
  %idxprom32.i = sext i32 %storemerge1.in.i to i64
  %arrayidx34.i = getelementptr inbounds i32* %0, i64 %idxprom32.i
  store i32 %tmp6.i, i32* %arrayidx34.i, align 4
  %1 = add i64 %indvar4.i, 1
  %exitcond15 = icmp eq i64 %1, 15
  br i1 %exitcond15, label %for.body24, label %for.body.i

for.body24:                                       ; preds = %for.end.i, %for.inc56
  %storemerge13 = phi i32 [ %2, %for.inc56 ], [ 0, %for.end.i ]
  %call26 = tail call i32 @rand() nounwind
  %rem28 = srem i32 %call26, 15
  %idxprom29 = sext i32 %rem28 to i64
  %arrayidx31 = getelementptr inbounds i32* %0, i64 %idxprom29
  %tmp32 = load i32* %arrayidx31, align 4
  %call37 = tail call i32 @binary_search(i32* %0, i32 0, i32 14, i32 %tmp32)
  %idxprom40 = sext i32 %call37 to i64
  %arrayidx42 = getelementptr inbounds i32* %0, i64 %idxprom40
  %tmp43 = load i32* %arrayidx42, align 4
  %cmp44 = icmp eq i32 %tmp32, %tmp43
  br i1 %cmp44, label %if.then, label %if.else

if.then:                                          ; preds = %for.body24
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([27 x i8]* @str, i64 0, i64 0))
  br label %for.inc56

if.else:                                          ; preds = %for.body24
  %call48 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @.str3, i64 0, i64 0), i32 %tmp32) nounwind
  %tmp53 = load i32* %arrayidx42, align 4
  %call54 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([10 x i8]* @.str4, i64 0, i64 0), i32 %tmp53) nounwind
  %puts2 = tail call i32 @puts(i8* getelementptr inbounds ([31 x i8]* @str1, i64 0, i64 0))
  br label %for.inc56

for.inc56:                                        ; preds = %if.then, %if.else
  %2 = add nsw i32 %storemerge13, 1
  %exitcond = icmp eq i32 %2, 10
  br i1 %exitcond, label %for.end59, label %for.body24

for.end59:                                        ; preds = %for.inc56
  ret i32 0
}

declare noalias i8* @malloc(i64) nounwind

declare i32 @rand() nounwind

declare i32 @puts(i8* nocapture) nounwind
