; ModuleID = '/home/david/src/c-semantics/tests/integration/simplestQueue.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
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
  %0 = load i32* @head, align 4, !tbaa !0
  %add.i = add nsw i32 %0, 1
  %and.i = and i32 %add.i, 15
  %1 = load i32* @tail, align 4, !tbaa !0
  %cmp = icmp eq i32 %and.i, %1
  %conv = zext i1 %cmp to i32
  ret i32 %conv
}

define i32 @mt() nounwind uwtable readonly {
entry:
  %0 = load i32* @head, align 4, !tbaa !0
  %1 = load i32* @tail, align 4, !tbaa !0
  %cmp = icmp eq i32 %0, %1
  %conv = zext i1 %cmp to i32
  ret i32 %conv
}

define i32 @enq(i32 %item) nounwind uwtable {
entry:
  %0 = load i32* @head, align 4, !tbaa !0
  %add.i.i = add nsw i32 %0, 1
  %and.i.i = and i32 %add.i.i, 15
  %1 = load i32* @tail, align 4, !tbaa !0
  %cmp.i = icmp eq i32 %and.i.i, %1
  br i1 %cmp.i, label %return, label %if.end

if.end:                                           ; preds = %entry
  %idxprom = sext i32 %0 to i64
  %arrayidx = getelementptr inbounds [16 x i32]* @q, i64 0, i64 %idxprom
  store i32 %item, i32* %arrayidx, align 4, !tbaa !0
  store i32 %and.i.i, i32* @head, align 4, !tbaa !0
  br label %return

return:                                           ; preds = %entry, %if.end
  %retval.0 = phi i32 [ 1, %if.end ], [ 0, %entry ]
  ret i32 %retval.0
}

define i32 @deq(i32* nocapture %loc) nounwind uwtable {
entry:
  %0 = load i32* @head, align 4, !tbaa !0
  %1 = load i32* @tail, align 4, !tbaa !0
  %cmp.i = icmp eq i32 %0, %1
  br i1 %cmp.i, label %return, label %if.end

if.end:                                           ; preds = %entry
  %idxprom = sext i32 %1 to i64
  %arrayidx = getelementptr inbounds [16 x i32]* @q, i64 0, i64 %idxprom
  %2 = load i32* %arrayidx, align 4, !tbaa !0
  store i32 %2, i32* %loc, align 4, !tbaa !0
  %3 = load i32* @tail, align 4, !tbaa !0
  %add.i = add nsw i32 %3, 1
  %and.i = and i32 %add.i, 15
  store i32 %and.i, i32* @tail, align 4, !tbaa !0
  br label %return

return:                                           ; preds = %entry, %if.end
  %retval.0 = phi i32 [ 1, %if.end ], [ 0, %entry ]
  ret i32 %retval.0
}

define i32 @qents() nounwind uwtable readonly {
entry:
  %0 = load i32* @head, align 4, !tbaa !0
  %1 = load i32* @tail, align 4, !tbaa !0
  %sub = sub nsw i32 %0, %1
  %cmp = icmp slt i32 %sub, 0
  %add = add nsw i32 %sub, 16
  %add.sub = select i1 %cmp, i32 %add, i32 %sub
  ret i32 %add.sub
}

define void @printdeq() nounwind uwtable {
entry:
  %0 = load i32* @head, align 4, !tbaa !0
  %1 = load i32* @tail, align 4, !tbaa !0
  %cmp.i.i = icmp eq i32 %0, %1
  br i1 %cmp.i.i, label %deq.exit, label %if.end.i

if.end.i:                                         ; preds = %entry
  %idxprom.i = sext i32 %1 to i64
  %arrayidx.i = getelementptr inbounds [16 x i32]* @q, i64 0, i64 %idxprom.i
  %2 = load i32* %arrayidx.i, align 4, !tbaa !0
  %add.i.i = add nsw i32 %1, 1
  %and.i.i = and i32 %add.i.i, 15
  store i32 %and.i.i, i32* @tail, align 4, !tbaa !0
  br label %deq.exit

deq.exit:                                         ; preds = %entry, %if.end.i
  %3 = phi i32 [ %2, %if.end.i ], [ 0, %entry ]
  %retval.0.i = phi i32 [ 1, %if.end.i ], [ 0, %entry ]
  %call1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([8 x i8]* @.str, i64 0, i64 0), i32 %retval.0.i, i32 %3) nounwind
  ret void
}

declare i32 @printf(i8* nocapture, ...) nounwind

define i32 @main() nounwind uwtable {
entry:
  %0 = load i32* @head, align 4, !tbaa !0
  %1 = load i32* @tail, align 4, !tbaa !0
  %cmp.i = icmp eq i32 %0, %1
  %conv.i = zext i1 %cmp.i to i32
  %call1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @.str1, i64 0, i64 0), i32 %conv.i) nounwind
  %2 = load i32* @head, align 4, !tbaa !0
  %add.i.i = add nsw i32 %2, 1
  %and.i.i = and i32 %add.i.i, 15
  %3 = load i32* @tail, align 4, !tbaa !0
  %cmp.i40 = icmp eq i32 %and.i.i, %3
  %conv.i41 = zext i1 %cmp.i40 to i32
  %call3 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([10 x i8]* @.str2, i64 0, i64 0), i32 %conv.i41) nounwind
  %4 = load i32* @head, align 4, !tbaa !0
  %5 = load i32* @tail, align 4, !tbaa !0
  br label %for.body

for.body:                                         ; preds = %enq.exit79, %entry
  %6 = phi i32 [ %4, %entry ], [ %7, %enq.exit79 ]
  %i.096 = phi i32 [ 0, %entry ], [ %inc, %enq.exit79 ]
  %add.i.i.i72 = add nsw i32 %6, 1
  %and.i.i.i73 = and i32 %add.i.i.i72, 15
  %cmp.i.i74 = icmp eq i32 %and.i.i.i73, %5
  br i1 %cmp.i.i74, label %enq.exit79, label %if.end.i77

if.end.i77:                                       ; preds = %for.body
  %mul = shl nsw i32 %i.096, 1
  %idxprom.i75 = sext i32 %6 to i64
  %arrayidx.i76 = getelementptr inbounds [16 x i32]* @q, i64 0, i64 %idxprom.i75
  store i32 %mul, i32* %arrayidx.i76, align 4, !tbaa !0
  store i32 %and.i.i.i73, i32* @head, align 4, !tbaa !0
  br label %enq.exit79

enq.exit79:                                       ; preds = %for.body, %if.end.i77
  %7 = phi i32 [ %6, %for.body ], [ %and.i.i.i73, %if.end.i77 ]
  %inc = add nsw i32 %i.096, 1
  %exitcond = icmp eq i32 %inc, 16
  br i1 %exitcond, label %for.end, label %for.body

for.end:                                          ; preds = %enq.exit79
  %cmp.i88 = icmp eq i32 %7, %5
  %conv.i89 = zext i1 %cmp.i88 to i32
  %call6 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @.str1, i64 0, i64 0), i32 %conv.i89) nounwind
  %8 = load i32* @head, align 4, !tbaa !0
  %add.i.i84 = add nsw i32 %8, 1
  %and.i.i85 = and i32 %add.i.i84, 15
  %9 = load i32* @tail, align 4, !tbaa !0
  %cmp.i86 = icmp eq i32 %and.i.i85, %9
  %conv.i87 = zext i1 %cmp.i86 to i32
  %call8 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([10 x i8]* @.str2, i64 0, i64 0), i32 %conv.i87) nounwind
  %10 = load i32* @head, align 4, !tbaa !0
  %11 = load i32* @tail, align 4, !tbaa !0
  %sub.i80 = sub nsw i32 %10, %11
  %cmp.i81 = icmp slt i32 %sub.i80, 0
  %add.i82 = add nsw i32 %sub.i80, 16
  %add.sub.i83 = select i1 %cmp.i81, i32 %add.i82, i32 %sub.i80
  %call10 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @.str3, i64 0, i64 0), i32 %add.sub.i83) nounwind
  %12 = load i32* @head, align 4, !tbaa !0
  %13 = load i32* @tail, align 4, !tbaa !0
  %cmp.i.i.i6392 = icmp eq i32 %12, %13
  br i1 %cmp.i.i.i6392, label %printdeq.exit71, label %if.end.i.i68

if.end.i.i68:                                     ; preds = %for.end
  %idxprom.i.i64 = sext i32 %13 to i64
  %arrayidx.i.i65 = getelementptr inbounds [16 x i32]* @q, i64 0, i64 %idxprom.i.i64
  %14 = load i32* %arrayidx.i.i65, align 4, !tbaa !0
  %add.i.i.i66 = add nsw i32 %13, 1
  %and.i.i.i67 = and i32 %add.i.i.i66, 15
  store i32 %and.i.i.i67, i32* @tail, align 4, !tbaa !0
  br label %printdeq.exit71

printdeq.exit71:                                  ; preds = %for.end, %if.end.i.i68
  %15 = phi i32 [ %14, %if.end.i.i68 ], [ 0, %for.end ]
  %retval.0.i.i69 = phi i32 [ 1, %if.end.i.i68 ], [ 0, %for.end ]
  %call1.i70 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([8 x i8]* @.str, i64 0, i64 0), i32 %retval.0.i.i69, i32 %15) nounwind
  %16 = load i32* @head, align 4, !tbaa !0
  %17 = load i32* @tail, align 4, !tbaa !0
  %cmp.i.i.i63 = icmp eq i32 %16, %17
  br i1 %cmp.i.i.i63, label %printdeq.exit71.1, label %if.end.i.i68.1

if.end.i:                                         ; preds = %printdeq.exit71.7
  %idxprom.i = sext i32 %68 to i64
  %arrayidx.i = getelementptr inbounds [16 x i32]* @q, i64 0, i64 %idxprom.i
  store i32 0, i32* %arrayidx.i, align 4, !tbaa !0
  store i32 %and.i.i.i52, i32* @head, align 4, !tbaa !0
  br label %enq.exit

enq.exit:                                         ; preds = %printdeq.exit71.7, %if.end.i
  %18 = phi i32 [ %68, %printdeq.exit71.7 ], [ %and.i.i.i52, %if.end.i ]
  %add.i.i.i51.1 = add nsw i32 %18, 1
  %and.i.i.i52.1 = and i32 %add.i.i.i51.1, 15
  %cmp.i.i.1 = icmp eq i32 %and.i.i.i52.1, %69
  br i1 %cmp.i.i.1, label %enq.exit.1, label %if.end.i.1

if.end.i.i:                                       ; preds = %enq.exit.7, %if.end.i.i
  %19 = phi i32 [ %22, %if.end.i.i ], [ %35, %enq.exit.7 ]
  %idxprom.i.i = sext i32 %19 to i64
  %arrayidx.i.i = getelementptr inbounds [16 x i32]* @q, i64 0, i64 %idxprom.i.i
  %20 = load i32* %arrayidx.i.i, align 4, !tbaa !0
  %add.i.i.i = add nsw i32 %19, 1
  %and.i.i.i = and i32 %add.i.i.i, 15
  store i32 %and.i.i.i, i32* @tail, align 4, !tbaa !0
  %call1.i = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([8 x i8]* @.str, i64 0, i64 0), i32 1, i32 %20) nounwind
  %21 = load i32* @head, align 4, !tbaa !0
  %22 = load i32* @tail, align 4, !tbaa !0
  %cmp.i42 = icmp eq i32 %21, %22
  br i1 %cmp.i42, label %while.end.critedge, label %if.end.i.i

while.end.critedge:                               ; preds = %if.end.i.i, %enq.exit.7
  %call1.i.c = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([8 x i8]* @.str, i64 0, i64 0), i32 0, i32 0) nounwind
  ret i32 0

if.end.i.1:                                       ; preds = %enq.exit
  %idxprom.i.1 = sext i32 %18 to i64
  %arrayidx.i.1 = getelementptr inbounds [16 x i32]* @q, i64 0, i64 %idxprom.i.1
  store i32 2, i32* %arrayidx.i.1, align 4, !tbaa !0
  store i32 %and.i.i.i52.1, i32* @head, align 4, !tbaa !0
  br label %enq.exit.1

enq.exit.1:                                       ; preds = %if.end.i.1, %enq.exit
  %23 = phi i32 [ %and.i.i.i52.1, %if.end.i.1 ], [ %18, %enq.exit ]
  %add.i.i.i51.2 = add nsw i32 %23, 1
  %and.i.i.i52.2 = and i32 %add.i.i.i51.2, 15
  %cmp.i.i.2 = icmp eq i32 %and.i.i.i52.2, %69
  br i1 %cmp.i.i.2, label %enq.exit.2, label %if.end.i.2

if.end.i.2:                                       ; preds = %enq.exit.1
  %idxprom.i.2 = sext i32 %23 to i64
  %arrayidx.i.2 = getelementptr inbounds [16 x i32]* @q, i64 0, i64 %idxprom.i.2
  store i32 4, i32* %arrayidx.i.2, align 4, !tbaa !0
  store i32 %and.i.i.i52.2, i32* @head, align 4, !tbaa !0
  br label %enq.exit.2

enq.exit.2:                                       ; preds = %if.end.i.2, %enq.exit.1
  %24 = phi i32 [ %and.i.i.i52.2, %if.end.i.2 ], [ %23, %enq.exit.1 ]
  %add.i.i.i51.3 = add nsw i32 %24, 1
  %and.i.i.i52.3 = and i32 %add.i.i.i51.3, 15
  %cmp.i.i.3 = icmp eq i32 %and.i.i.i52.3, %69
  br i1 %cmp.i.i.3, label %enq.exit.3, label %if.end.i.3

if.end.i.3:                                       ; preds = %enq.exit.2
  %idxprom.i.3 = sext i32 %24 to i64
  %arrayidx.i.3 = getelementptr inbounds [16 x i32]* @q, i64 0, i64 %idxprom.i.3
  store i32 6, i32* %arrayidx.i.3, align 4, !tbaa !0
  store i32 %and.i.i.i52.3, i32* @head, align 4, !tbaa !0
  br label %enq.exit.3

enq.exit.3:                                       ; preds = %if.end.i.3, %enq.exit.2
  %25 = phi i32 [ %and.i.i.i52.3, %if.end.i.3 ], [ %24, %enq.exit.2 ]
  %add.i.i.i51.4 = add nsw i32 %25, 1
  %and.i.i.i52.4 = and i32 %add.i.i.i51.4, 15
  %cmp.i.i.4 = icmp eq i32 %and.i.i.i52.4, %69
  br i1 %cmp.i.i.4, label %enq.exit.4, label %if.end.i.4

if.end.i.4:                                       ; preds = %enq.exit.3
  %idxprom.i.4 = sext i32 %25 to i64
  %arrayidx.i.4 = getelementptr inbounds [16 x i32]* @q, i64 0, i64 %idxprom.i.4
  store i32 8, i32* %arrayidx.i.4, align 4, !tbaa !0
  store i32 %and.i.i.i52.4, i32* @head, align 4, !tbaa !0
  br label %enq.exit.4

enq.exit.4:                                       ; preds = %if.end.i.4, %enq.exit.3
  %26 = phi i32 [ %and.i.i.i52.4, %if.end.i.4 ], [ %25, %enq.exit.3 ]
  %add.i.i.i51.5 = add nsw i32 %26, 1
  %and.i.i.i52.5 = and i32 %add.i.i.i51.5, 15
  %cmp.i.i.5 = icmp eq i32 %and.i.i.i52.5, %69
  br i1 %cmp.i.i.5, label %enq.exit.5, label %if.end.i.5

if.end.i.5:                                       ; preds = %enq.exit.4
  %idxprom.i.5 = sext i32 %26 to i64
  %arrayidx.i.5 = getelementptr inbounds [16 x i32]* @q, i64 0, i64 %idxprom.i.5
  store i32 10, i32* %arrayidx.i.5, align 4, !tbaa !0
  store i32 %and.i.i.i52.5, i32* @head, align 4, !tbaa !0
  br label %enq.exit.5

enq.exit.5:                                       ; preds = %if.end.i.5, %enq.exit.4
  %27 = phi i32 [ %and.i.i.i52.5, %if.end.i.5 ], [ %26, %enq.exit.4 ]
  %add.i.i.i51.6 = add nsw i32 %27, 1
  %and.i.i.i52.6 = and i32 %add.i.i.i51.6, 15
  %cmp.i.i.6 = icmp eq i32 %and.i.i.i52.6, %69
  br i1 %cmp.i.i.6, label %enq.exit.6, label %if.end.i.6

if.end.i.6:                                       ; preds = %enq.exit.5
  %idxprom.i.6 = sext i32 %27 to i64
  %arrayidx.i.6 = getelementptr inbounds [16 x i32]* @q, i64 0, i64 %idxprom.i.6
  store i32 12, i32* %arrayidx.i.6, align 4, !tbaa !0
  store i32 %and.i.i.i52.6, i32* @head, align 4, !tbaa !0
  br label %enq.exit.6

enq.exit.6:                                       ; preds = %if.end.i.6, %enq.exit.5
  %28 = phi i32 [ %and.i.i.i52.6, %if.end.i.6 ], [ %27, %enq.exit.5 ]
  %add.i.i.i51.7 = add nsw i32 %28, 1
  %and.i.i.i52.7 = and i32 %add.i.i.i51.7, 15
  %cmp.i.i.7 = icmp eq i32 %and.i.i.i52.7, %69
  br i1 %cmp.i.i.7, label %enq.exit.7, label %if.end.i.7

if.end.i.7:                                       ; preds = %enq.exit.6
  %idxprom.i.7 = sext i32 %28 to i64
  %arrayidx.i.7 = getelementptr inbounds [16 x i32]* @q, i64 0, i64 %idxprom.i.7
  store i32 14, i32* %arrayidx.i.7, align 4, !tbaa !0
  store i32 %and.i.i.i52.7, i32* @head, align 4, !tbaa !0
  br label %enq.exit.7

enq.exit.7:                                       ; preds = %if.end.i.7, %enq.exit.6
  %29 = phi i32 [ %and.i.i.i52.7, %if.end.i.7 ], [ %28, %enq.exit.6 ]
  %cmp.i49 = icmp eq i32 %29, %69
  %conv.i50 = zext i1 %cmp.i49 to i32
  %call34 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @.str1, i64 0, i64 0), i32 %conv.i50) nounwind
  %30 = load i32* @head, align 4, !tbaa !0
  %add.i.i45 = add nsw i32 %30, 1
  %and.i.i46 = and i32 %add.i.i45, 15
  %31 = load i32* @tail, align 4, !tbaa !0
  %cmp.i47 = icmp eq i32 %and.i.i46, %31
  %conv.i48 = zext i1 %cmp.i47 to i32
  %call36 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([10 x i8]* @.str2, i64 0, i64 0), i32 %conv.i48) nounwind
  %32 = load i32* @head, align 4, !tbaa !0
  %33 = load i32* @tail, align 4, !tbaa !0
  %sub.i = sub nsw i32 %32, %33
  %cmp.i44 = icmp slt i32 %sub.i, 0
  %add.i = add nsw i32 %sub.i, 16
  %add.sub.i = select i1 %cmp.i44, i32 %add.i, i32 %sub.i
  %call38 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @.str3, i64 0, i64 0), i32 %add.sub.i) nounwind
  %34 = load i32* @head, align 4, !tbaa !0
  %35 = load i32* @tail, align 4, !tbaa !0
  %cmp.i4290 = icmp eq i32 %34, %35
  br i1 %cmp.i4290, label %while.end.critedge, label %if.end.i.i

if.end.i.i68.1:                                   ; preds = %printdeq.exit71
  %idxprom.i.i64.1 = sext i32 %17 to i64
  %arrayidx.i.i65.1 = getelementptr inbounds [16 x i32]* @q, i64 0, i64 %idxprom.i.i64.1
  %36 = load i32* %arrayidx.i.i65.1, align 4, !tbaa !0
  %add.i.i.i66.1 = add nsw i32 %17, 1
  %and.i.i.i67.1 = and i32 %add.i.i.i66.1, 15
  store i32 %and.i.i.i67.1, i32* @tail, align 4, !tbaa !0
  br label %printdeq.exit71.1

printdeq.exit71.1:                                ; preds = %if.end.i.i68.1, %printdeq.exit71
  %37 = phi i32 [ %36, %if.end.i.i68.1 ], [ 0, %printdeq.exit71 ]
  %retval.0.i.i69.1 = phi i32 [ 1, %if.end.i.i68.1 ], [ 0, %printdeq.exit71 ]
  %call1.i70.1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([8 x i8]* @.str, i64 0, i64 0), i32 %retval.0.i.i69.1, i32 %37) nounwind
  %38 = load i32* @head, align 4, !tbaa !0
  %39 = load i32* @tail, align 4, !tbaa !0
  %cmp.i.i.i63.1 = icmp eq i32 %38, %39
  br i1 %cmp.i.i.i63.1, label %printdeq.exit71.2, label %if.end.i.i68.2

if.end.i.i68.2:                                   ; preds = %printdeq.exit71.1
  %idxprom.i.i64.2 = sext i32 %39 to i64
  %arrayidx.i.i65.2 = getelementptr inbounds [16 x i32]* @q, i64 0, i64 %idxprom.i.i64.2
  %40 = load i32* %arrayidx.i.i65.2, align 4, !tbaa !0
  %add.i.i.i66.2 = add nsw i32 %39, 1
  %and.i.i.i67.2 = and i32 %add.i.i.i66.2, 15
  store i32 %and.i.i.i67.2, i32* @tail, align 4, !tbaa !0
  br label %printdeq.exit71.2

printdeq.exit71.2:                                ; preds = %if.end.i.i68.2, %printdeq.exit71.1
  %41 = phi i32 [ %40, %if.end.i.i68.2 ], [ 0, %printdeq.exit71.1 ]
  %retval.0.i.i69.2 = phi i32 [ 1, %if.end.i.i68.2 ], [ 0, %printdeq.exit71.1 ]
  %call1.i70.2 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([8 x i8]* @.str, i64 0, i64 0), i32 %retval.0.i.i69.2, i32 %41) nounwind
  %42 = load i32* @head, align 4, !tbaa !0
  %43 = load i32* @tail, align 4, !tbaa !0
  %cmp.i.i.i63.2 = icmp eq i32 %42, %43
  br i1 %cmp.i.i.i63.2, label %printdeq.exit71.3, label %if.end.i.i68.3

if.end.i.i68.3:                                   ; preds = %printdeq.exit71.2
  %idxprom.i.i64.3 = sext i32 %43 to i64
  %arrayidx.i.i65.3 = getelementptr inbounds [16 x i32]* @q, i64 0, i64 %idxprom.i.i64.3
  %44 = load i32* %arrayidx.i.i65.3, align 4, !tbaa !0
  %add.i.i.i66.3 = add nsw i32 %43, 1
  %and.i.i.i67.3 = and i32 %add.i.i.i66.3, 15
  store i32 %and.i.i.i67.3, i32* @tail, align 4, !tbaa !0
  br label %printdeq.exit71.3

printdeq.exit71.3:                                ; preds = %if.end.i.i68.3, %printdeq.exit71.2
  %45 = phi i32 [ %44, %if.end.i.i68.3 ], [ 0, %printdeq.exit71.2 ]
  %retval.0.i.i69.3 = phi i32 [ 1, %if.end.i.i68.3 ], [ 0, %printdeq.exit71.2 ]
  %call1.i70.3 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([8 x i8]* @.str, i64 0, i64 0), i32 %retval.0.i.i69.3, i32 %45) nounwind
  %46 = load i32* @head, align 4, !tbaa !0
  %47 = load i32* @tail, align 4, !tbaa !0
  %cmp.i.i.i63.3 = icmp eq i32 %46, %47
  br i1 %cmp.i.i.i63.3, label %printdeq.exit71.4, label %if.end.i.i68.4

if.end.i.i68.4:                                   ; preds = %printdeq.exit71.3
  %idxprom.i.i64.4 = sext i32 %47 to i64
  %arrayidx.i.i65.4 = getelementptr inbounds [16 x i32]* @q, i64 0, i64 %idxprom.i.i64.4
  %48 = load i32* %arrayidx.i.i65.4, align 4, !tbaa !0
  %add.i.i.i66.4 = add nsw i32 %47, 1
  %and.i.i.i67.4 = and i32 %add.i.i.i66.4, 15
  store i32 %and.i.i.i67.4, i32* @tail, align 4, !tbaa !0
  br label %printdeq.exit71.4

printdeq.exit71.4:                                ; preds = %if.end.i.i68.4, %printdeq.exit71.3
  %49 = phi i32 [ %48, %if.end.i.i68.4 ], [ 0, %printdeq.exit71.3 ]
  %retval.0.i.i69.4 = phi i32 [ 1, %if.end.i.i68.4 ], [ 0, %printdeq.exit71.3 ]
  %call1.i70.4 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([8 x i8]* @.str, i64 0, i64 0), i32 %retval.0.i.i69.4, i32 %49) nounwind
  %50 = load i32* @head, align 4, !tbaa !0
  %51 = load i32* @tail, align 4, !tbaa !0
  %cmp.i.i.i63.4 = icmp eq i32 %50, %51
  br i1 %cmp.i.i.i63.4, label %printdeq.exit71.5, label %if.end.i.i68.5

if.end.i.i68.5:                                   ; preds = %printdeq.exit71.4
  %idxprom.i.i64.5 = sext i32 %51 to i64
  %arrayidx.i.i65.5 = getelementptr inbounds [16 x i32]* @q, i64 0, i64 %idxprom.i.i64.5
  %52 = load i32* %arrayidx.i.i65.5, align 4, !tbaa !0
  %add.i.i.i66.5 = add nsw i32 %51, 1
  %and.i.i.i67.5 = and i32 %add.i.i.i66.5, 15
  store i32 %and.i.i.i67.5, i32* @tail, align 4, !tbaa !0
  br label %printdeq.exit71.5

printdeq.exit71.5:                                ; preds = %if.end.i.i68.5, %printdeq.exit71.4
  %53 = phi i32 [ %52, %if.end.i.i68.5 ], [ 0, %printdeq.exit71.4 ]
  %retval.0.i.i69.5 = phi i32 [ 1, %if.end.i.i68.5 ], [ 0, %printdeq.exit71.4 ]
  %call1.i70.5 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([8 x i8]* @.str, i64 0, i64 0), i32 %retval.0.i.i69.5, i32 %53) nounwind
  %54 = load i32* @head, align 4, !tbaa !0
  %55 = load i32* @tail, align 4, !tbaa !0
  %cmp.i.i.i63.5 = icmp eq i32 %54, %55
  br i1 %cmp.i.i.i63.5, label %printdeq.exit71.6, label %if.end.i.i68.6

if.end.i.i68.6:                                   ; preds = %printdeq.exit71.5
  %idxprom.i.i64.6 = sext i32 %55 to i64
  %arrayidx.i.i65.6 = getelementptr inbounds [16 x i32]* @q, i64 0, i64 %idxprom.i.i64.6
  %56 = load i32* %arrayidx.i.i65.6, align 4, !tbaa !0
  %add.i.i.i66.6 = add nsw i32 %55, 1
  %and.i.i.i67.6 = and i32 %add.i.i.i66.6, 15
  store i32 %and.i.i.i67.6, i32* @tail, align 4, !tbaa !0
  br label %printdeq.exit71.6

printdeq.exit71.6:                                ; preds = %if.end.i.i68.6, %printdeq.exit71.5
  %57 = phi i32 [ %56, %if.end.i.i68.6 ], [ 0, %printdeq.exit71.5 ]
  %retval.0.i.i69.6 = phi i32 [ 1, %if.end.i.i68.6 ], [ 0, %printdeq.exit71.5 ]
  %call1.i70.6 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([8 x i8]* @.str, i64 0, i64 0), i32 %retval.0.i.i69.6, i32 %57) nounwind
  %58 = load i32* @head, align 4, !tbaa !0
  %59 = load i32* @tail, align 4, !tbaa !0
  %cmp.i.i.i63.6 = icmp eq i32 %58, %59
  br i1 %cmp.i.i.i63.6, label %printdeq.exit71.7, label %if.end.i.i68.7

if.end.i.i68.7:                                   ; preds = %printdeq.exit71.6
  %idxprom.i.i64.7 = sext i32 %59 to i64
  %arrayidx.i.i65.7 = getelementptr inbounds [16 x i32]* @q, i64 0, i64 %idxprom.i.i64.7
  %60 = load i32* %arrayidx.i.i65.7, align 4, !tbaa !0
  %add.i.i.i66.7 = add nsw i32 %59, 1
  %and.i.i.i67.7 = and i32 %add.i.i.i66.7, 15
  store i32 %and.i.i.i67.7, i32* @tail, align 4, !tbaa !0
  br label %printdeq.exit71.7

printdeq.exit71.7:                                ; preds = %if.end.i.i68.7, %printdeq.exit71.6
  %61 = phi i32 [ %60, %if.end.i.i68.7 ], [ 0, %printdeq.exit71.6 ]
  %retval.0.i.i69.7 = phi i32 [ 1, %if.end.i.i68.7 ], [ 0, %printdeq.exit71.6 ]
  %call1.i70.7 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([8 x i8]* @.str, i64 0, i64 0), i32 %retval.0.i.i69.7, i32 %61) nounwind
  %62 = load i32* @head, align 4, !tbaa !0
  %63 = load i32* @tail, align 4, !tbaa !0
  %cmp.i.i.i63.7 = icmp eq i32 %62, %63
  %conv.i62 = zext i1 %cmp.i.i.i63.7 to i32
  %call19 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @.str1, i64 0, i64 0), i32 %conv.i62) nounwind
  %64 = load i32* @head, align 4, !tbaa !0
  %add.i.i57 = add nsw i32 %64, 1
  %and.i.i58 = and i32 %add.i.i57, 15
  %65 = load i32* @tail, align 4, !tbaa !0
  %cmp.i59 = icmp eq i32 %and.i.i58, %65
  %conv.i60 = zext i1 %cmp.i59 to i32
  %call21 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([10 x i8]* @.str2, i64 0, i64 0), i32 %conv.i60) nounwind
  %66 = load i32* @head, align 4, !tbaa !0
  %67 = load i32* @tail, align 4, !tbaa !0
  %sub.i53 = sub nsw i32 %66, %67
  %cmp.i54 = icmp slt i32 %sub.i53, 0
  %add.i55 = add nsw i32 %sub.i53, 16
  %add.sub.i56 = select i1 %cmp.i54, i32 %add.i55, i32 %sub.i53
  %call23 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @.str3, i64 0, i64 0), i32 %add.sub.i56) nounwind
  %68 = load i32* @head, align 4, !tbaa !0
  %69 = load i32* @tail, align 4, !tbaa !0
  %add.i.i.i51 = add nsw i32 %68, 1
  %and.i.i.i52 = and i32 %add.i.i.i51, 15
  %cmp.i.i = icmp eq i32 %and.i.i.i52, %69
  br i1 %cmp.i.i, label %enq.exit, label %if.end.i
}

!0 = metadata !{metadata !"int", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
