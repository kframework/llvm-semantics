; ModuleID = '/home/grosu/celliso2/c-semantics/tests/integration/simplestQueue.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@head = internal unnamed_addr global i32 0, align 4
@tail = internal unnamed_addr global i32 0, align 4
@q = internal unnamed_addr global [16 x i32] zeroinitializer, align 16
@.str = private unnamed_addr constant [8 x i8] c"%d, %d\0A\00", align 1
@.str1 = private unnamed_addr constant [11 x i8] c"emtpy==%d\0A\00", align 1
@.str2 = private unnamed_addr constant [10 x i8] c"full==%d\0A\00", align 1
@.str3 = private unnamed_addr constant [11 x i8] c"qents==%d\0A\00", align 1

define i32 @full() nounwind uwtable readonly {
entry:
  %tmp = load i32* @head, align 4
  %add.i = add nsw i32 %tmp, 1
  %and.i = and i32 %add.i, 15
  %tmp1 = load i32* @tail, align 4
  %cmp = icmp eq i32 %and.i, %tmp1
  %conv = zext i1 %cmp to i32
  ret i32 %conv
}

define i32 @mt() nounwind uwtable readonly {
entry:
  %tmp = load i32* @head, align 4
  %tmp1 = load i32* @tail, align 4
  %cmp = icmp eq i32 %tmp, %tmp1
  %conv = zext i1 %cmp to i32
  ret i32 %conv
}

define i32 @enq(i32 %item) nounwind uwtable {
entry:
  %tmp.i = load i32* @head, align 4
  %add.i.i = add nsw i32 %tmp.i, 1
  %and.i.i = and i32 %add.i.i, 15
  %tmp1.i = load i32* @tail, align 4
  %cmp.i = icmp eq i32 %and.i.i, %tmp1.i
  br i1 %cmp.i, label %return, label %if.end

if.end:                                           ; preds = %entry
  %idxprom = sext i32 %tmp.i to i64
  %arrayidx = getelementptr inbounds [16 x i32]* @q, i64 0, i64 %idxprom
  store i32 %item, i32* %arrayidx, align 4
  store i32 %and.i.i, i32* @head, align 4
  br label %return

return:                                           ; preds = %entry, %if.end
  %storemerge = phi i32 [ 1, %if.end ], [ 0, %entry ]
  ret i32 %storemerge
}

define i32 @deq(i32* %loc) nounwind uwtable {
entry:
  %tmp.i = load i32* @head, align 4
  %tmp1.i = load i32* @tail, align 4
  %cmp.i = icmp eq i32 %tmp.i, %tmp1.i
  br i1 %cmp.i, label %return, label %if.end

if.end:                                           ; preds = %entry
  %idxprom = sext i32 %tmp1.i to i64
  %arrayidx = getelementptr inbounds [16 x i32]* @q, i64 0, i64 %idxprom
  %tmp1 = load i32* %arrayidx, align 4
  store i32 %tmp1, i32* %loc, align 4
  %tmp3 = load i32* @tail, align 4
  %add.i = add nsw i32 %tmp3, 1
  %and.i = and i32 %add.i, 15
  store i32 %and.i, i32* @tail, align 4
  br label %return

return:                                           ; preds = %entry, %if.end
  %storemerge = phi i32 [ 1, %if.end ], [ 0, %entry ]
  ret i32 %storemerge
}

define i32 @qents() nounwind uwtable readonly {
entry:
  %tmp = load i32* @head, align 4
  %tmp1 = load i32* @tail, align 4
  %sub = sub nsw i32 %tmp, %tmp1
  %add = add nsw i32 %sub, 16
  %cmp = icmp slt i32 %sub, 0
  %add.sub = select i1 %cmp, i32 %add, i32 %sub
  ret i32 %add.sub
}

define void @printdeq() nounwind uwtable {
entry:
  %tmp.i.i = load i32* @head, align 4
  %tmp1.i.i = load i32* @tail, align 4
  %cmp.i.i = icmp eq i32 %tmp.i.i, %tmp1.i.i
  br i1 %cmp.i.i, label %deq.exit, label %if.end.i

if.end.i:                                         ; preds = %entry
  %idxprom.i = sext i32 %tmp1.i.i to i64
  %arrayidx.i = getelementptr inbounds [16 x i32]* @q, i64 0, i64 %idxprom.i
  %tmp1.i = load i32* %arrayidx.i, align 4
  %add.i.i = add nsw i32 %tmp1.i.i, 1
  %and.i.i = and i32 %add.i.i, 15
  store i32 %and.i.i, i32* @tail, align 4
  br label %deq.exit

deq.exit:                                         ; preds = %entry, %if.end.i
  %tmp1.i1 = phi i32 [ %tmp1.i, %if.end.i ], [ 0, %entry ]
  %storemerge.i = phi i32 [ 1, %if.end.i ], [ 0, %entry ]
  %call2 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([8 x i8]* @.str, i64 0, i64 0), i32 %storemerge.i, i32 %tmp1.i1) nounwind
  ret void
}

declare i32 @printf(i8* nocapture, ...) nounwind

define i32 @main() nounwind uwtable {
entry:
  %tmp.i = load i32* @head, align 4
  %tmp1.i = load i32* @tail, align 4
  %cmp.i = icmp eq i32 %tmp.i, %tmp1.i
  %conv.i = zext i1 %cmp.i to i32
  %call1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @.str1, i64 0, i64 0), i32 %conv.i) nounwind
  %tmp.i3 = load i32* @head, align 4
  %add.i.i = add nsw i32 %tmp.i3, 1
  %and.i.i = and i32 %add.i.i, 15
  %tmp1.i4 = load i32* @tail, align 4
  %cmp.i5 = icmp eq i32 %and.i.i, %tmp1.i4
  %conv.i6 = zext i1 %cmp.i5 to i32
  %call3 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([10 x i8]* @.str2, i64 0, i64 0), i32 %conv.i6) nounwind
  %tmp.i.i5697 = load i32* @head, align 4
  %tmp1.i.i59 = load i32* @tail, align 4
  br label %for.body

for.body:                                         ; preds = %enq.exit65, %entry
  %and.i.i.i58101 = phi i32 [ %tmp.i.i5697, %entry ], [ %and.i.i.i58102, %enq.exit65 ]
  %storemerge98 = phi i32 [ 0, %entry ], [ %0, %enq.exit65 ]
  %add.i.i.i57 = add nsw i32 %and.i.i.i58101, 1
  %and.i.i.i58 = and i32 %add.i.i.i57, 15
  %cmp.i.i60 = icmp eq i32 %and.i.i.i58, %tmp1.i.i59
  br i1 %cmp.i.i60, label %enq.exit65, label %if.end.i63

if.end.i63:                                       ; preds = %for.body
  %mul = shl i32 %storemerge98, 1
  %idxprom.i61 = sext i32 %and.i.i.i58101 to i64
  %arrayidx.i62 = getelementptr inbounds [16 x i32]* @q, i64 0, i64 %idxprom.i61
  store i32 %mul, i32* %arrayidx.i62, align 4
  br label %enq.exit65

enq.exit65:                                       ; preds = %for.body, %if.end.i63
  %and.i.i.i58102 = phi i32 [ %and.i.i.i58101, %for.body ], [ %and.i.i.i58, %if.end.i63 ]
  %0 = add nsw i32 %storemerge98, 1
  %exitcond = icmp eq i32 %0, 16
  br i1 %exitcond, label %for.end, label %for.body

for.end:                                          ; preds = %enq.exit65
  store i32 %and.i.i.i58102, i32* @head, align 4
  %cmp.i80 = icmp eq i32 %and.i.i.i58102, %tmp1.i.i59
  %conv.i81 = zext i1 %cmp.i80 to i32
  %call8 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @.str1, i64 0, i64 0), i32 %conv.i81) nounwind
  %tmp.i72 = load i32* @head, align 4
  %add.i.i73 = add nsw i32 %tmp.i72, 1
  %and.i.i74 = and i32 %add.i.i73, 15
  %tmp1.i75 = load i32* @tail, align 4
  %cmp.i76 = icmp eq i32 %and.i.i74, %tmp1.i75
  %conv.i77 = zext i1 %cmp.i76 to i32
  %call10 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([10 x i8]* @.str2, i64 0, i64 0), i32 %conv.i77) nounwind
  %tmp.i66 = load i32* @head, align 4
  %tmp1.i67 = load i32* @tail, align 4
  %sub.i68 = sub nsw i32 %tmp.i66, %tmp1.i67
  %add.i69 = add nsw i32 %sub.i68, 16
  %cmp.i70 = icmp slt i32 %sub.i68, 0
  %add.sub.i71 = select i1 %cmp.i70, i32 %add.i69, i32 %sub.i68
  %call12 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @.str3, i64 0, i64 0), i32 %add.sub.i71) nounwind
  %tmp.i.i.i4391 = load i32* @head, align 4
  %tmp1.i.i.i4492 = load i32* @tail, align 4
  %cmp.i.i.i4593 = icmp eq i32 %tmp.i.i.i4391, %tmp1.i.i.i4492
  br i1 %cmp.i.i.i4593, label %printdeq.exit55, label %if.end.i.i51

if.end.i.i51:                                     ; preds = %for.end
  %idxprom.i.i46 = sext i32 %tmp1.i.i.i4492 to i64
  %arrayidx.i.i47 = getelementptr inbounds [16 x i32]* @q, i64 0, i64 %idxprom.i.i46
  %tmp1.i.i48 = load i32* %arrayidx.i.i47, align 4
  %add.i.i.i49 = add nsw i32 %tmp1.i.i.i4492, 1
  %and.i.i.i50 = and i32 %add.i.i.i49, 15
  store i32 %and.i.i.i50, i32* @tail, align 4
  br label %printdeq.exit55

printdeq.exit55:                                  ; preds = %for.end, %if.end.i.i51
  %tmp1.i1.i52 = phi i32 [ %tmp1.i.i48, %if.end.i.i51 ], [ 0, %for.end ]
  %storemerge.i.i53 = phi i32 [ 1, %if.end.i.i51 ], [ 0, %for.end ]
  %call2.i54 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([8 x i8]* @.str, i64 0, i64 0), i32 %storemerge.i.i53, i32 %tmp1.i1.i52) nounwind
  %tmp.i.i.i43 = load i32* @head, align 4
  %tmp1.i.i.i44 = load i32* @tail, align 4
  %cmp.i.i.i45 = icmp eq i32 %tmp.i.i.i43, %tmp1.i.i.i44
  br i1 %cmp.i.i.i45, label %printdeq.exit55.1, label %if.end.i.i51.1

if.end.i:                                         ; preds = %printdeq.exit55.7
  %idxprom.i = sext i32 %tmp.i.i86 to i64
  %arrayidx.i = getelementptr inbounds [16 x i32]* @q, i64 0, i64 %idxprom.i
  store i32 0, i32* %arrayidx.i, align 4
  br label %enq.exit

enq.exit:                                         ; preds = %printdeq.exit55.7, %if.end.i
  %and.i.i.i2590 = phi i32 [ %tmp.i.i86, %printdeq.exit55.7 ], [ %and.i.i.i25, %if.end.i ]
  %add.i.i.i24.1 = add nsw i32 %and.i.i.i2590, 1
  %and.i.i.i25.1 = and i32 %add.i.i.i24.1, 15
  %cmp.i.i.1 = icmp eq i32 %and.i.i.i25.1, %tmp1.i.i26
  br i1 %cmp.i.i.1, label %enq.exit.1, label %if.end.i.1

if.end.i.i:                                       ; preds = %enq.exit.7, %if.end.i.i
  %tmp1.i885 = phi i32 [ %tmp1.i8, %if.end.i.i ], [ %tmp1.i883, %enq.exit.7 ]
  %idxprom.i.i = sext i32 %tmp1.i885 to i64
  %arrayidx.i.i = getelementptr inbounds [16 x i32]* @q, i64 0, i64 %idxprom.i.i
  %tmp1.i.i = load i32* %arrayidx.i.i, align 4
  %add.i.i.i = add nsw i32 %tmp1.i885, 1
  %and.i.i.i = and i32 %add.i.i.i, 15
  store i32 %and.i.i.i, i32* @tail, align 4
  %call2.i = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([8 x i8]* @.str, i64 0, i64 0), i32 1, i32 %tmp1.i.i) nounwind
  %tmp.i7 = load i32* @head, align 4
  %tmp1.i8 = load i32* @tail, align 4
  %cmp.i9 = icmp eq i32 %tmp.i7, %tmp1.i8
  br i1 %cmp.i9, label %while.end.critedge, label %if.end.i.i

while.end.critedge:                               ; preds = %if.end.i.i, %enq.exit.7
  %call2.i.c = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([8 x i8]* @.str, i64 0, i64 0), i32 0, i32 0) nounwind
  ret i32 0

enq.exit.1:                                       ; preds = %if.end.i.1, %enq.exit
  %and.i.i.i2590.1 = phi i32 [ %and.i.i.i2590, %enq.exit ], [ %and.i.i.i25.1, %if.end.i.1 ]
  %add.i.i.i24.2 = add nsw i32 %and.i.i.i2590.1, 1
  %and.i.i.i25.2 = and i32 %add.i.i.i24.2, 15
  %cmp.i.i.2 = icmp eq i32 %and.i.i.i25.2, %tmp1.i.i26
  br i1 %cmp.i.i.2, label %enq.exit.2, label %if.end.i.2

if.end.i.1:                                       ; preds = %enq.exit
  %idxprom.i.1 = sext i32 %and.i.i.i2590 to i64
  %arrayidx.i.1 = getelementptr inbounds [16 x i32]* @q, i64 0, i64 %idxprom.i.1
  store i32 2, i32* %arrayidx.i.1, align 4
  br label %enq.exit.1

enq.exit.2:                                       ; preds = %if.end.i.2, %enq.exit.1
  %and.i.i.i2590.2 = phi i32 [ %and.i.i.i2590.1, %enq.exit.1 ], [ %and.i.i.i25.2, %if.end.i.2 ]
  %add.i.i.i24.3 = add nsw i32 %and.i.i.i2590.2, 1
  %and.i.i.i25.3 = and i32 %add.i.i.i24.3, 15
  %cmp.i.i.3 = icmp eq i32 %and.i.i.i25.3, %tmp1.i.i26
  br i1 %cmp.i.i.3, label %enq.exit.3, label %if.end.i.3

if.end.i.2:                                       ; preds = %enq.exit.1
  %idxprom.i.2 = sext i32 %and.i.i.i2590.1 to i64
  %arrayidx.i.2 = getelementptr inbounds [16 x i32]* @q, i64 0, i64 %idxprom.i.2
  store i32 4, i32* %arrayidx.i.2, align 4
  br label %enq.exit.2

enq.exit.3:                                       ; preds = %if.end.i.3, %enq.exit.2
  %and.i.i.i2590.3 = phi i32 [ %and.i.i.i2590.2, %enq.exit.2 ], [ %and.i.i.i25.3, %if.end.i.3 ]
  %add.i.i.i24.4 = add nsw i32 %and.i.i.i2590.3, 1
  %and.i.i.i25.4 = and i32 %add.i.i.i24.4, 15
  %cmp.i.i.4 = icmp eq i32 %and.i.i.i25.4, %tmp1.i.i26
  br i1 %cmp.i.i.4, label %enq.exit.4, label %if.end.i.4

if.end.i.3:                                       ; preds = %enq.exit.2
  %idxprom.i.3 = sext i32 %and.i.i.i2590.2 to i64
  %arrayidx.i.3 = getelementptr inbounds [16 x i32]* @q, i64 0, i64 %idxprom.i.3
  store i32 6, i32* %arrayidx.i.3, align 4
  br label %enq.exit.3

enq.exit.4:                                       ; preds = %if.end.i.4, %enq.exit.3
  %and.i.i.i2590.4 = phi i32 [ %and.i.i.i2590.3, %enq.exit.3 ], [ %and.i.i.i25.4, %if.end.i.4 ]
  %add.i.i.i24.5 = add nsw i32 %and.i.i.i2590.4, 1
  %and.i.i.i25.5 = and i32 %add.i.i.i24.5, 15
  %cmp.i.i.5 = icmp eq i32 %and.i.i.i25.5, %tmp1.i.i26
  br i1 %cmp.i.i.5, label %enq.exit.5, label %if.end.i.5

if.end.i.4:                                       ; preds = %enq.exit.3
  %idxprom.i.4 = sext i32 %and.i.i.i2590.3 to i64
  %arrayidx.i.4 = getelementptr inbounds [16 x i32]* @q, i64 0, i64 %idxprom.i.4
  store i32 8, i32* %arrayidx.i.4, align 4
  br label %enq.exit.4

enq.exit.5:                                       ; preds = %if.end.i.5, %enq.exit.4
  %and.i.i.i2590.5 = phi i32 [ %and.i.i.i2590.4, %enq.exit.4 ], [ %and.i.i.i25.5, %if.end.i.5 ]
  %add.i.i.i24.6 = add nsw i32 %and.i.i.i2590.5, 1
  %and.i.i.i25.6 = and i32 %add.i.i.i24.6, 15
  %cmp.i.i.6 = icmp eq i32 %and.i.i.i25.6, %tmp1.i.i26
  br i1 %cmp.i.i.6, label %enq.exit.6, label %if.end.i.6

if.end.i.5:                                       ; preds = %enq.exit.4
  %idxprom.i.5 = sext i32 %and.i.i.i2590.4 to i64
  %arrayidx.i.5 = getelementptr inbounds [16 x i32]* @q, i64 0, i64 %idxprom.i.5
  store i32 10, i32* %arrayidx.i.5, align 4
  br label %enq.exit.5

enq.exit.6:                                       ; preds = %if.end.i.6, %enq.exit.5
  %and.i.i.i2590.6 = phi i32 [ %and.i.i.i2590.5, %enq.exit.5 ], [ %and.i.i.i25.6, %if.end.i.6 ]
  %add.i.i.i24.7 = add nsw i32 %and.i.i.i2590.6, 1
  %and.i.i.i25.7 = and i32 %add.i.i.i24.7, 15
  %cmp.i.i.7 = icmp eq i32 %and.i.i.i25.7, %tmp1.i.i26
  br i1 %cmp.i.i.7, label %enq.exit.7, label %if.end.i.7

if.end.i.6:                                       ; preds = %enq.exit.5
  %idxprom.i.6 = sext i32 %and.i.i.i2590.5 to i64
  %arrayidx.i.6 = getelementptr inbounds [16 x i32]* @q, i64 0, i64 %idxprom.i.6
  store i32 12, i32* %arrayidx.i.6, align 4
  br label %enq.exit.6

enq.exit.7:                                       ; preds = %if.end.i.7, %enq.exit.6
  %and.i.i.i2590.7 = phi i32 [ %and.i.i.i2590.6, %enq.exit.6 ], [ %and.i.i.i25.7, %if.end.i.7 ]
  store i32 %and.i.i.i2590.7, i32* @head, align 4
  %cmp.i22 = icmp eq i32 %and.i.i.i2590.7, %tmp1.i.i26
  %conv.i23 = zext i1 %cmp.i22 to i32
  %call43 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @.str1, i64 0, i64 0), i32 %conv.i23) nounwind
  %tmp.i14 = load i32* @head, align 4
  %add.i.i15 = add nsw i32 %tmp.i14, 1
  %and.i.i16 = and i32 %add.i.i15, 15
  %tmp1.i17 = load i32* @tail, align 4
  %cmp.i18 = icmp eq i32 %and.i.i16, %tmp1.i17
  %conv.i19 = zext i1 %cmp.i18 to i32
  %call45 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([10 x i8]* @.str2, i64 0, i64 0), i32 %conv.i19) nounwind
  %tmp.i11 = load i32* @head, align 4
  %tmp1.i12 = load i32* @tail, align 4
  %sub.i = sub nsw i32 %tmp.i11, %tmp1.i12
  %add.i = add nsw i32 %sub.i, 16
  %cmp.i13 = icmp slt i32 %sub.i, 0
  %add.sub.i = select i1 %cmp.i13, i32 %add.i, i32 %sub.i
  %call47 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @.str3, i64 0, i64 0), i32 %add.sub.i) nounwind
  %tmp.i782 = load i32* @head, align 4
  %tmp1.i883 = load i32* @tail, align 4
  %cmp.i984 = icmp eq i32 %tmp.i782, %tmp1.i883
  br i1 %cmp.i984, label %while.end.critedge, label %if.end.i.i

if.end.i.7:                                       ; preds = %enq.exit.6
  %idxprom.i.7 = sext i32 %and.i.i.i2590.6 to i64
  %arrayidx.i.7 = getelementptr inbounds [16 x i32]* @q, i64 0, i64 %idxprom.i.7
  store i32 14, i32* %arrayidx.i.7, align 4
  br label %enq.exit.7

printdeq.exit55.1:                                ; preds = %if.end.i.i51.1, %printdeq.exit55
  %tmp1.i1.i52.1 = phi i32 [ %tmp1.i.i48.1, %if.end.i.i51.1 ], [ 0, %printdeq.exit55 ]
  %storemerge.i.i53.1 = phi i32 [ 1, %if.end.i.i51.1 ], [ 0, %printdeq.exit55 ]
  %call2.i54.1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([8 x i8]* @.str, i64 0, i64 0), i32 %storemerge.i.i53.1, i32 %tmp1.i1.i52.1) nounwind
  %tmp.i.i.i43.1 = load i32* @head, align 4
  %tmp1.i.i.i44.1 = load i32* @tail, align 4
  %cmp.i.i.i45.1 = icmp eq i32 %tmp.i.i.i43.1, %tmp1.i.i.i44.1
  br i1 %cmp.i.i.i45.1, label %printdeq.exit55.2, label %if.end.i.i51.2

if.end.i.i51.1:                                   ; preds = %printdeq.exit55
  %idxprom.i.i46.1 = sext i32 %tmp1.i.i.i44 to i64
  %arrayidx.i.i47.1 = getelementptr inbounds [16 x i32]* @q, i64 0, i64 %idxprom.i.i46.1
  %tmp1.i.i48.1 = load i32* %arrayidx.i.i47.1, align 4
  %add.i.i.i49.1 = add nsw i32 %tmp1.i.i.i44, 1
  %and.i.i.i50.1 = and i32 %add.i.i.i49.1, 15
  store i32 %and.i.i.i50.1, i32* @tail, align 4
  br label %printdeq.exit55.1

printdeq.exit55.2:                                ; preds = %if.end.i.i51.2, %printdeq.exit55.1
  %tmp1.i1.i52.2 = phi i32 [ %tmp1.i.i48.2, %if.end.i.i51.2 ], [ 0, %printdeq.exit55.1 ]
  %storemerge.i.i53.2 = phi i32 [ 1, %if.end.i.i51.2 ], [ 0, %printdeq.exit55.1 ]
  %call2.i54.2 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([8 x i8]* @.str, i64 0, i64 0), i32 %storemerge.i.i53.2, i32 %tmp1.i1.i52.2) nounwind
  %tmp.i.i.i43.2 = load i32* @head, align 4
  %tmp1.i.i.i44.2 = load i32* @tail, align 4
  %cmp.i.i.i45.2 = icmp eq i32 %tmp.i.i.i43.2, %tmp1.i.i.i44.2
  br i1 %cmp.i.i.i45.2, label %printdeq.exit55.3, label %if.end.i.i51.3

if.end.i.i51.2:                                   ; preds = %printdeq.exit55.1
  %idxprom.i.i46.2 = sext i32 %tmp1.i.i.i44.1 to i64
  %arrayidx.i.i47.2 = getelementptr inbounds [16 x i32]* @q, i64 0, i64 %idxprom.i.i46.2
  %tmp1.i.i48.2 = load i32* %arrayidx.i.i47.2, align 4
  %add.i.i.i49.2 = add nsw i32 %tmp1.i.i.i44.1, 1
  %and.i.i.i50.2 = and i32 %add.i.i.i49.2, 15
  store i32 %and.i.i.i50.2, i32* @tail, align 4
  br label %printdeq.exit55.2

printdeq.exit55.3:                                ; preds = %if.end.i.i51.3, %printdeq.exit55.2
  %tmp1.i1.i52.3 = phi i32 [ %tmp1.i.i48.3, %if.end.i.i51.3 ], [ 0, %printdeq.exit55.2 ]
  %storemerge.i.i53.3 = phi i32 [ 1, %if.end.i.i51.3 ], [ 0, %printdeq.exit55.2 ]
  %call2.i54.3 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([8 x i8]* @.str, i64 0, i64 0), i32 %storemerge.i.i53.3, i32 %tmp1.i1.i52.3) nounwind
  %tmp.i.i.i43.3 = load i32* @head, align 4
  %tmp1.i.i.i44.3 = load i32* @tail, align 4
  %cmp.i.i.i45.3 = icmp eq i32 %tmp.i.i.i43.3, %tmp1.i.i.i44.3
  br i1 %cmp.i.i.i45.3, label %printdeq.exit55.4, label %if.end.i.i51.4

if.end.i.i51.3:                                   ; preds = %printdeq.exit55.2
  %idxprom.i.i46.3 = sext i32 %tmp1.i.i.i44.2 to i64
  %arrayidx.i.i47.3 = getelementptr inbounds [16 x i32]* @q, i64 0, i64 %idxprom.i.i46.3
  %tmp1.i.i48.3 = load i32* %arrayidx.i.i47.3, align 4
  %add.i.i.i49.3 = add nsw i32 %tmp1.i.i.i44.2, 1
  %and.i.i.i50.3 = and i32 %add.i.i.i49.3, 15
  store i32 %and.i.i.i50.3, i32* @tail, align 4
  br label %printdeq.exit55.3

printdeq.exit55.4:                                ; preds = %if.end.i.i51.4, %printdeq.exit55.3
  %tmp1.i1.i52.4 = phi i32 [ %tmp1.i.i48.4, %if.end.i.i51.4 ], [ 0, %printdeq.exit55.3 ]
  %storemerge.i.i53.4 = phi i32 [ 1, %if.end.i.i51.4 ], [ 0, %printdeq.exit55.3 ]
  %call2.i54.4 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([8 x i8]* @.str, i64 0, i64 0), i32 %storemerge.i.i53.4, i32 %tmp1.i1.i52.4) nounwind
  %tmp.i.i.i43.4 = load i32* @head, align 4
  %tmp1.i.i.i44.4 = load i32* @tail, align 4
  %cmp.i.i.i45.4 = icmp eq i32 %tmp.i.i.i43.4, %tmp1.i.i.i44.4
  br i1 %cmp.i.i.i45.4, label %printdeq.exit55.5, label %if.end.i.i51.5

if.end.i.i51.4:                                   ; preds = %printdeq.exit55.3
  %idxprom.i.i46.4 = sext i32 %tmp1.i.i.i44.3 to i64
  %arrayidx.i.i47.4 = getelementptr inbounds [16 x i32]* @q, i64 0, i64 %idxprom.i.i46.4
  %tmp1.i.i48.4 = load i32* %arrayidx.i.i47.4, align 4
  %add.i.i.i49.4 = add nsw i32 %tmp1.i.i.i44.3, 1
  %and.i.i.i50.4 = and i32 %add.i.i.i49.4, 15
  store i32 %and.i.i.i50.4, i32* @tail, align 4
  br label %printdeq.exit55.4

printdeq.exit55.5:                                ; preds = %if.end.i.i51.5, %printdeq.exit55.4
  %tmp1.i1.i52.5 = phi i32 [ %tmp1.i.i48.5, %if.end.i.i51.5 ], [ 0, %printdeq.exit55.4 ]
  %storemerge.i.i53.5 = phi i32 [ 1, %if.end.i.i51.5 ], [ 0, %printdeq.exit55.4 ]
  %call2.i54.5 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([8 x i8]* @.str, i64 0, i64 0), i32 %storemerge.i.i53.5, i32 %tmp1.i1.i52.5) nounwind
  %tmp.i.i.i43.5 = load i32* @head, align 4
  %tmp1.i.i.i44.5 = load i32* @tail, align 4
  %cmp.i.i.i45.5 = icmp eq i32 %tmp.i.i.i43.5, %tmp1.i.i.i44.5
  br i1 %cmp.i.i.i45.5, label %printdeq.exit55.6, label %if.end.i.i51.6

if.end.i.i51.5:                                   ; preds = %printdeq.exit55.4
  %idxprom.i.i46.5 = sext i32 %tmp1.i.i.i44.4 to i64
  %arrayidx.i.i47.5 = getelementptr inbounds [16 x i32]* @q, i64 0, i64 %idxprom.i.i46.5
  %tmp1.i.i48.5 = load i32* %arrayidx.i.i47.5, align 4
  %add.i.i.i49.5 = add nsw i32 %tmp1.i.i.i44.4, 1
  %and.i.i.i50.5 = and i32 %add.i.i.i49.5, 15
  store i32 %and.i.i.i50.5, i32* @tail, align 4
  br label %printdeq.exit55.5

printdeq.exit55.6:                                ; preds = %if.end.i.i51.6, %printdeq.exit55.5
  %tmp1.i1.i52.6 = phi i32 [ %tmp1.i.i48.6, %if.end.i.i51.6 ], [ 0, %printdeq.exit55.5 ]
  %storemerge.i.i53.6 = phi i32 [ 1, %if.end.i.i51.6 ], [ 0, %printdeq.exit55.5 ]
  %call2.i54.6 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([8 x i8]* @.str, i64 0, i64 0), i32 %storemerge.i.i53.6, i32 %tmp1.i1.i52.6) nounwind
  %tmp.i.i.i43.6 = load i32* @head, align 4
  %tmp1.i.i.i44.6 = load i32* @tail, align 4
  %cmp.i.i.i45.6 = icmp eq i32 %tmp.i.i.i43.6, %tmp1.i.i.i44.6
  br i1 %cmp.i.i.i45.6, label %printdeq.exit55.7, label %if.end.i.i51.7

if.end.i.i51.6:                                   ; preds = %printdeq.exit55.5
  %idxprom.i.i46.6 = sext i32 %tmp1.i.i.i44.5 to i64
  %arrayidx.i.i47.6 = getelementptr inbounds [16 x i32]* @q, i64 0, i64 %idxprom.i.i46.6
  %tmp1.i.i48.6 = load i32* %arrayidx.i.i47.6, align 4
  %add.i.i.i49.6 = add nsw i32 %tmp1.i.i.i44.5, 1
  %and.i.i.i50.6 = and i32 %add.i.i.i49.6, 15
  store i32 %and.i.i.i50.6, i32* @tail, align 4
  br label %printdeq.exit55.6

printdeq.exit55.7:                                ; preds = %if.end.i.i51.7, %printdeq.exit55.6
  %tmp1.i1.i52.7 = phi i32 [ %tmp1.i.i48.7, %if.end.i.i51.7 ], [ 0, %printdeq.exit55.6 ]
  %storemerge.i.i53.7 = phi i32 [ 1, %if.end.i.i51.7 ], [ 0, %printdeq.exit55.6 ]
  %call2.i54.7 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([8 x i8]* @.str, i64 0, i64 0), i32 %storemerge.i.i53.7, i32 %tmp1.i1.i52.7) nounwind
  %tmp.i.i.i43.7 = load i32* @head, align 4
  %tmp1.i.i.i44.7 = load i32* @tail, align 4
  %cmp.i.i.i45.7 = icmp eq i32 %tmp.i.i.i43.7, %tmp1.i.i.i44.7
  %conv.i42 = zext i1 %cmp.i.i.i45.7 to i32
  %call24 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @.str1, i64 0, i64 0), i32 %conv.i42) nounwind
  %tmp.i33 = load i32* @head, align 4
  %add.i.i34 = add nsw i32 %tmp.i33, 1
  %and.i.i35 = and i32 %add.i.i34, 15
  %tmp1.i36 = load i32* @tail, align 4
  %cmp.i37 = icmp eq i32 %and.i.i35, %tmp1.i36
  %conv.i38 = zext i1 %cmp.i37 to i32
  %call26 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([10 x i8]* @.str2, i64 0, i64 0), i32 %conv.i38) nounwind
  %tmp.i27 = load i32* @head, align 4
  %tmp1.i28 = load i32* @tail, align 4
  %sub.i29 = sub nsw i32 %tmp.i27, %tmp1.i28
  %add.i30 = add nsw i32 %sub.i29, 16
  %cmp.i31 = icmp slt i32 %sub.i29, 0
  %add.sub.i32 = select i1 %cmp.i31, i32 %add.i30, i32 %sub.i29
  %call28 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @.str3, i64 0, i64 0), i32 %add.sub.i32) nounwind
  %tmp.i.i86 = load i32* @head, align 4
  %tmp1.i.i26 = load i32* @tail, align 4
  %add.i.i.i24 = add nsw i32 %tmp.i.i86, 1
  %and.i.i.i25 = and i32 %add.i.i.i24, 15
  %cmp.i.i = icmp eq i32 %and.i.i.i25, %tmp1.i.i26
  br i1 %cmp.i.i, label %enq.exit, label %if.end.i

if.end.i.i51.7:                                   ; preds = %printdeq.exit55.6
  %idxprom.i.i46.7 = sext i32 %tmp1.i.i.i44.6 to i64
  %arrayidx.i.i47.7 = getelementptr inbounds [16 x i32]* @q, i64 0, i64 %idxprom.i.i46.7
  %tmp1.i.i48.7 = load i32* %arrayidx.i.i47.7, align 4
  %add.i.i.i49.7 = add nsw i32 %tmp1.i.i.i44.6, 1
  %and.i.i.i50.7 = and i32 %add.i.i.i49.7, 15
  store i32 %and.i.i.i50.7, i32* @tail, align 4
  br label %printdeq.exit55.7
}
