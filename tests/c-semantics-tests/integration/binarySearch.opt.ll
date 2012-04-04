; ModuleID = '/home/david/src/c-semantics/tests/integration/binarySearch.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [28 x i8] c"Couldn't find %d in array:\0A\00", align 1
@.str1 = private unnamed_addr constant [12 x i8] c"a[%d] = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [17 x i8] c"looking for %d, \00", align 1
@.str4 = private unnamed_addr constant [10 x i8] c"found %d\0A\00", align 1
@str = private unnamed_addr constant [27 x i8] c"present_val == a[found_at]\00"
@str6 = private unnamed_addr constant [31 x i8] c"BUG present_val == a[found_at]\00"

define i32 @binary_search(i32* nocapture %a, i32 %low, i32 %high, i32 %target) nounwind uwtable {
entry:
  br label %while.cond.outer

while.cond.outer:                                 ; preds = %if.then, %entry
  %high.addr.0.ph = phi i32 [ %high, %entry ], [ %sub2, %if.then ]
  %low.addr.0.ph = phi i32 [ %low, %entry ], [ %low.addr.0, %if.then ]
  br label %while.cond

while.cond:                                       ; preds = %if.else, %while.cond.outer
  %low.addr.0 = phi i32 [ %add7, %if.else ], [ %low.addr.0.ph, %while.cond.outer ]
  %cmp = icmp sgt i32 %low.addr.0, %high.addr.0.ph
  br i1 %cmp, label %while.end, label %while.body

while.body:                                       ; preds = %while.cond
  %sub = sub nsw i32 %high.addr.0.ph, %low.addr.0
  %div = sdiv i32 %sub, 2
  %add = add nsw i32 %div, %low.addr.0
  %idxprom = sext i32 %add to i64
  %arrayidx = getelementptr inbounds i32* %a, i64 %idxprom
  %0 = load i32* %arrayidx, align 4, !tbaa !0
  %cmp1 = icmp sgt i32 %0, %target
  br i1 %cmp1, label %if.then, label %if.else

if.then:                                          ; preds = %while.body
  %sub2 = add nsw i32 %add, -1
  br label %while.cond.outer

if.else:                                          ; preds = %while.body
  %cmp5 = icmp slt i32 %0, %target
  %add7 = add nsw i32 %add, 1
  br i1 %cmp5, label %while.cond, label %return

while.end:                                        ; preds = %while.cond
  %call = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str, i64 0, i64 0), i32 %target) nounwind
  %cmp1014 = icmp slt i32 %low, %high
  br i1 %cmp1014, label %for.body.lr.ph, label %return

for.body.lr.ph:                                   ; preds = %while.end
  %1 = sext i32 %low to i64
  br label %for.body

for.body:                                         ; preds = %for.body, %for.body.lr.ph
  %indvars.iv = phi i64 [ %1, %for.body.lr.ph ], [ %indvars.iv.next, %for.body ]
  %arrayidx12 = getelementptr inbounds i32* %a, i64 %indvars.iv
  %2 = load i32* %arrayidx12, align 4, !tbaa !0
  %3 = trunc i64 %indvars.iv to i32
  %call13 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([12 x i8]* @.str1, i64 0, i64 0), i32 %3, i32 %2) nounwind
  %indvars.iv.next = add i64 %indvars.iv, 1
  %lftr.wideiv = trunc i64 %indvars.iv.next to i32
  %exitcond = icmp eq i32 %lftr.wideiv, %high
  br i1 %exitcond, label %return, label %for.body

return:                                           ; preds = %if.else, %while.end, %for.body
  %retval.0 = phi i32 [ -1, %for.body ], [ -1, %while.end ], [ %add, %if.else ]
  ret i32 %retval.0
}

declare i32 @printf(i8* nocapture, ...) nounwind

define void @insertion_sort(i32* nocapture %a, i32 %length) nounwind uwtable {
entry:
  %cmp16 = icmp sgt i32 %length, 0
  br i1 %cmp16, label %for.body, label %for.end15

for.body:                                         ; preds = %entry, %for.end
  %indvars.iv20 = phi i64 [ %indvars.iv.next21, %for.end ], [ 0, %entry ]
  %i.017 = phi i32 [ %inc, %for.end ], [ 0, %entry ]
  %arrayidx = getelementptr inbounds i32* %a, i64 %indvars.iv20
  %0 = load i32* %arrayidx, align 4, !tbaa !0
  br label %for.cond1

for.cond1:                                        ; preds = %if.end, %for.body
  %indvars.iv18 = phi i64 [ %indvars.iv.next19, %if.end ], [ %indvars.iv20, %for.body ]
  %j.0.in = phi i32 [ %j.0, %if.end ], [ %i.017, %for.body ]
  %indvars.iv.next19 = add i64 %indvars.iv18, -1
  %j.0 = add nsw i32 %j.0.in, -1
  %1 = trunc i64 %indvars.iv18 to i32
  %cmp2 = icmp sgt i32 %1, 0
  br i1 %cmp2, label %for.body3, label %for.end

for.body3:                                        ; preds = %for.cond1
  %arrayidx5 = getelementptr inbounds i32* %a, i64 %indvars.iv.next19
  %2 = load i32* %arrayidx5, align 4, !tbaa !0
  %cmp6 = icmp sgt i32 %2, %0
  br i1 %cmp6, label %if.end, label %for.end

if.end:                                           ; preds = %for.body3
  %arrayidx10 = getelementptr inbounds i32* %a, i64 %indvars.iv18
  store i32 %2, i32* %arrayidx10, align 4, !tbaa !0
  br label %for.cond1

for.end:                                          ; preds = %for.body3, %for.cond1
  %idxprom12 = sext i32 %j.0.in to i64
  %arrayidx13 = getelementptr inbounds i32* %a, i64 %idxprom12
  store i32 %0, i32* %arrayidx13, align 4, !tbaa !0
  %indvars.iv.next21 = add i64 %indvars.iv20, 1
  %inc = add nsw i32 %i.017, 1
  %lftr.wideiv = trunc i64 %indvars.iv.next21 to i32
  %exitcond = icmp eq i32 %lftr.wideiv, %length
  br i1 %exitcond, label %for.end15, label %for.body

for.end15:                                        ; preds = %for.end, %entry
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  %call = tail call noalias i8* @malloc(i64 60) nounwind
  %0 = bitcast i8* %call to i32*
  br label %do.body

do.body:                                          ; preds = %entry, %do.body
  %call2 = tail call i32 @rand() nounwind
  %rem = srem i32 %call2, 15
  %cmp5 = icmp eq i32 %rem, 2
  br i1 %cmp5, label %do.body, label %for.inc

for.inc:                                          ; preds = %do.body
  store i32 %rem, i32* %0, align 4
  br label %do.body.1

for.body.i:                                       ; preds = %for.end.i.for.body.i_crit_edge, %for.inc.14
  %1 = phi i32 [ %.pre, %for.end.i.for.body.i_crit_edge ], [ %rem, %for.inc.14 ]
  %indvars.iv20.i = phi i64 [ %indvars.iv.next21.i, %for.end.i.for.body.i_crit_edge ], [ 0, %for.inc.14 ]
  %i.017.i = phi i32 [ %inc.i, %for.end.i.for.body.i_crit_edge ], [ 0, %for.inc.14 ]
  br label %for.cond1.i

for.cond1.i:                                      ; preds = %if.end.i, %for.body.i
  %indvars.iv18.i = phi i64 [ %indvars.iv.next19.i, %if.end.i ], [ %indvars.iv20.i, %for.body.i ]
  %j.0.in.i = phi i32 [ %j.0.i, %if.end.i ], [ %i.017.i, %for.body.i ]
  %indvars.iv.next19.i = add i64 %indvars.iv18.i, -1
  %j.0.i = add nsw i32 %j.0.in.i, -1
  %2 = trunc i64 %indvars.iv18.i to i32
  %cmp2.i = icmp sgt i32 %2, 0
  br i1 %cmp2.i, label %for.body3.i, label %for.end.i

for.body3.i:                                      ; preds = %for.cond1.i
  %arrayidx5.i = getelementptr inbounds i32* %0, i64 %indvars.iv.next19.i
  %3 = load i32* %arrayidx5.i, align 4, !tbaa !0
  %cmp6.i = icmp sgt i32 %3, %1
  br i1 %cmp6.i, label %if.end.i, label %for.end.i

if.end.i:                                         ; preds = %for.body3.i
  %arrayidx10.i = getelementptr inbounds i32* %0, i64 %indvars.iv18.i
  store i32 %3, i32* %arrayidx10.i, align 4, !tbaa !0
  br label %for.cond1.i

for.end.i:                                        ; preds = %for.body3.i, %for.cond1.i
  %idxprom12.i = sext i32 %j.0.in.i to i64
  %arrayidx13.i = getelementptr inbounds i32* %0, i64 %idxprom12.i
  store i32 %1, i32* %arrayidx13.i, align 4, !tbaa !0
  %indvars.iv.next21.i = add i64 %indvars.iv20.i, 1
  %lftr.wideiv = trunc i64 %indvars.iv.next21.i to i32
  %exitcond43 = icmp eq i32 %lftr.wideiv, 15
  br i1 %exitcond43, label %for.body10, label %for.end.i.for.body.i_crit_edge

for.end.i.for.body.i_crit_edge:                   ; preds = %for.end.i
  %inc.i = add nsw i32 %i.017.i, 1
  %arrayidx.i.phi.trans.insert = getelementptr inbounds i32* %0, i64 %indvars.iv.next21.i
  %.pre = load i32* %arrayidx.i.phi.trans.insert, align 4, !tbaa !0
  br label %for.body.i

for.body10:                                       ; preds = %for.end.i, %for.inc26
  %i.138 = phi i32 [ %inc27, %for.inc26 ], [ 0, %for.end.i ]
  %call11 = tail call i32 @rand() nounwind
  %rem12 = srem i32 %call11, 15
  %idxprom13 = sext i32 %rem12 to i64
  %arrayidx14 = getelementptr inbounds i32* %0, i64 %idxprom13
  %4 = load i32* %arrayidx14, align 4, !tbaa !0
  br label %while.cond.outer.i

while.cond.outer.i:                               ; preds = %if.then.i, %for.body10
  %high.addr.0.ph.i = phi i32 [ 14, %for.body10 ], [ %sub2.i, %if.then.i ]
  %low.addr.0.ph.i = phi i32 [ 0, %for.body10 ], [ %low.addr.0.i, %if.then.i ]
  br label %while.cond.i

while.cond.i:                                     ; preds = %if.else.i, %while.cond.outer.i
  %low.addr.0.i = phi i32 [ %add7.i, %if.else.i ], [ %low.addr.0.ph.i, %while.cond.outer.i ]
  %cmp.i = icmp sgt i32 %low.addr.0.i, %high.addr.0.ph.i
  br i1 %cmp.i, label %while.end.i, label %while.body.i

while.body.i:                                     ; preds = %while.cond.i
  %sub.i = sub nsw i32 %high.addr.0.ph.i, %low.addr.0.i
  %div.i = sdiv i32 %sub.i, 2
  %add.i = add nsw i32 %div.i, %low.addr.0.i
  %idxprom.i = sext i32 %add.i to i64
  %arrayidx.i29 = getelementptr inbounds i32* %0, i64 %idxprom.i
  %5 = load i32* %arrayidx.i29, align 4, !tbaa !0
  %cmp1.i = icmp sgt i32 %5, %4
  br i1 %cmp1.i, label %if.then.i, label %if.else.i

if.then.i:                                        ; preds = %while.body.i
  %sub2.i = add nsw i32 %add.i, -1
  br label %while.cond.outer.i

if.else.i:                                        ; preds = %while.body.i
  %cmp5.i = icmp slt i32 %5, %4
  %add7.i = add nsw i32 %add.i, 1
  br i1 %cmp5.i, label %while.cond.i, label %binary_search.exit

while.end.i:                                      ; preds = %while.cond.i
  %call.i = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str, i64 0, i64 0), i32 %4) nounwind
  %6 = load i32* %0, align 4, !tbaa !0
  %call13.i = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([12 x i8]* @.str1, i64 0, i64 0), i32 0, i32 %6) nounwind
  %7 = load i32* %22, align 4, !tbaa !0
  %call13.i.1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([12 x i8]* @.str1, i64 0, i64 0), i32 1, i32 %7) nounwind
  %8 = load i32* %23, align 4, !tbaa !0
  %call13.i.2 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([12 x i8]* @.str1, i64 0, i64 0), i32 2, i32 %8) nounwind
  %9 = load i32* %24, align 4, !tbaa !0
  %call13.i.3 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([12 x i8]* @.str1, i64 0, i64 0), i32 3, i32 %9) nounwind
  %10 = load i32* %25, align 4, !tbaa !0
  %call13.i.4 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([12 x i8]* @.str1, i64 0, i64 0), i32 4, i32 %10) nounwind
  %11 = load i32* %26, align 4, !tbaa !0
  %call13.i.5 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([12 x i8]* @.str1, i64 0, i64 0), i32 5, i32 %11) nounwind
  %12 = load i32* %27, align 4, !tbaa !0
  %call13.i.6 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([12 x i8]* @.str1, i64 0, i64 0), i32 6, i32 %12) nounwind
  %13 = load i32* %28, align 4, !tbaa !0
  %call13.i.7 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([12 x i8]* @.str1, i64 0, i64 0), i32 7, i32 %13) nounwind
  %14 = load i32* %29, align 4, !tbaa !0
  %call13.i.8 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([12 x i8]* @.str1, i64 0, i64 0), i32 8, i32 %14) nounwind
  %15 = load i32* %30, align 4, !tbaa !0
  %call13.i.9 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([12 x i8]* @.str1, i64 0, i64 0), i32 9, i32 %15) nounwind
  %16 = load i32* %31, align 4, !tbaa !0
  %call13.i.10 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([12 x i8]* @.str1, i64 0, i64 0), i32 10, i32 %16) nounwind
  %17 = load i32* %32, align 4, !tbaa !0
  %call13.i.11 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([12 x i8]* @.str1, i64 0, i64 0), i32 11, i32 %17) nounwind
  %18 = load i32* %33, align 4, !tbaa !0
  %call13.i.12 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([12 x i8]* @.str1, i64 0, i64 0), i32 12, i32 %18) nounwind
  %19 = load i32* %34, align 4, !tbaa !0
  %call13.i.13 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([12 x i8]* @.str1, i64 0, i64 0), i32 13, i32 %19) nounwind
  %arrayidx17.phi.trans.insert = getelementptr inbounds i8* %call, i64 -4
  %20 = bitcast i8* %arrayidx17.phi.trans.insert to i32*
  %.pre46 = load i32* %20, align 4, !tbaa !0
  br label %binary_search.exit

binary_search.exit:                               ; preds = %if.else.i, %while.end.i
  %21 = phi i32 [ %.pre46, %while.end.i ], [ %5, %if.else.i ]
  %cmp18 = icmp eq i32 %4, %21
  br i1 %cmp18, label %if.then, label %if.else

if.then:                                          ; preds = %binary_search.exit
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([27 x i8]* @str, i64 0, i64 0))
  br label %for.inc26

if.else:                                          ; preds = %binary_search.exit
  %call21 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @.str3, i64 0, i64 0), i32 %4) nounwind
  %call24 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([10 x i8]* @.str4, i64 0, i64 0), i32 %21) nounwind
  %puts33 = tail call i32 @puts(i8* getelementptr inbounds ([31 x i8]* @str6, i64 0, i64 0))
  br label %for.inc26

for.inc26:                                        ; preds = %if.then, %if.else
  %inc27 = add nsw i32 %i.138, 1
  %exitcond = icmp eq i32 %inc27, 10
  br i1 %exitcond, label %for.end28, label %for.body10

for.end28:                                        ; preds = %for.inc26
  ret i32 0

do.body.1:                                        ; preds = %do.body.1, %for.inc
  %call2.1 = tail call i32 @rand() nounwind
  %rem.1 = srem i32 %call2.1, 15
  %cmp5.1 = icmp eq i32 %rem.1, 2
  br i1 %cmp5.1, label %do.body.1, label %for.inc.1

for.inc.1:                                        ; preds = %do.body.1
  %arrayidx.1 = getelementptr inbounds i8* %call, i64 4
  %22 = bitcast i8* %arrayidx.1 to i32*
  store i32 %rem.1, i32* %22, align 4
  br label %do.body.2

do.body.2:                                        ; preds = %do.body.2, %for.inc.1
  %call2.2 = tail call i32 @rand() nounwind
  %rem.2 = srem i32 %call2.2, 15
  %cmp5.2 = icmp eq i32 %rem.2, 2
  br i1 %cmp5.2, label %do.body.2, label %for.inc.2

for.inc.2:                                        ; preds = %do.body.2
  %arrayidx.2 = getelementptr inbounds i8* %call, i64 8
  %23 = bitcast i8* %arrayidx.2 to i32*
  store i32 %rem.2, i32* %23, align 4
  br label %do.body.3

do.body.3:                                        ; preds = %do.body.3, %for.inc.2
  %call2.3 = tail call i32 @rand() nounwind
  %rem.3 = srem i32 %call2.3, 15
  %cmp5.3 = icmp eq i32 %rem.3, 2
  br i1 %cmp5.3, label %do.body.3, label %for.inc.3

for.inc.3:                                        ; preds = %do.body.3
  %arrayidx.3 = getelementptr inbounds i8* %call, i64 12
  %24 = bitcast i8* %arrayidx.3 to i32*
  store i32 %rem.3, i32* %24, align 4
  br label %do.body.4

do.body.4:                                        ; preds = %do.body.4, %for.inc.3
  %call2.4 = tail call i32 @rand() nounwind
  %rem.4 = srem i32 %call2.4, 15
  %cmp5.4 = icmp eq i32 %rem.4, 2
  br i1 %cmp5.4, label %do.body.4, label %for.inc.4

for.inc.4:                                        ; preds = %do.body.4
  %arrayidx.4 = getelementptr inbounds i8* %call, i64 16
  %25 = bitcast i8* %arrayidx.4 to i32*
  store i32 %rem.4, i32* %25, align 4
  br label %do.body.5

do.body.5:                                        ; preds = %do.body.5, %for.inc.4
  %call2.5 = tail call i32 @rand() nounwind
  %rem.5 = srem i32 %call2.5, 15
  %cmp5.5 = icmp eq i32 %rem.5, 2
  br i1 %cmp5.5, label %do.body.5, label %for.inc.5

for.inc.5:                                        ; preds = %do.body.5
  %arrayidx.5 = getelementptr inbounds i8* %call, i64 20
  %26 = bitcast i8* %arrayidx.5 to i32*
  store i32 %rem.5, i32* %26, align 4
  br label %do.body.6

do.body.6:                                        ; preds = %do.body.6, %for.inc.5
  %call2.6 = tail call i32 @rand() nounwind
  %rem.6 = srem i32 %call2.6, 15
  %cmp5.6 = icmp eq i32 %rem.6, 2
  br i1 %cmp5.6, label %do.body.6, label %for.inc.6

for.inc.6:                                        ; preds = %do.body.6
  %arrayidx.6 = getelementptr inbounds i8* %call, i64 24
  %27 = bitcast i8* %arrayidx.6 to i32*
  store i32 %rem.6, i32* %27, align 4
  br label %do.body.7

do.body.7:                                        ; preds = %do.body.7, %for.inc.6
  %call2.7 = tail call i32 @rand() nounwind
  %rem.7 = srem i32 %call2.7, 15
  %cmp5.7 = icmp eq i32 %rem.7, 2
  br i1 %cmp5.7, label %do.body.7, label %for.inc.7

for.inc.7:                                        ; preds = %do.body.7
  %arrayidx.7 = getelementptr inbounds i8* %call, i64 28
  %28 = bitcast i8* %arrayidx.7 to i32*
  store i32 %rem.7, i32* %28, align 4
  br label %do.body.8

do.body.8:                                        ; preds = %do.body.8, %for.inc.7
  %call2.8 = tail call i32 @rand() nounwind
  %rem.8 = srem i32 %call2.8, 15
  %cmp5.8 = icmp eq i32 %rem.8, 2
  br i1 %cmp5.8, label %do.body.8, label %for.inc.8

for.inc.8:                                        ; preds = %do.body.8
  %arrayidx.8 = getelementptr inbounds i8* %call, i64 32
  %29 = bitcast i8* %arrayidx.8 to i32*
  store i32 %rem.8, i32* %29, align 4
  br label %do.body.9

do.body.9:                                        ; preds = %do.body.9, %for.inc.8
  %call2.9 = tail call i32 @rand() nounwind
  %rem.9 = srem i32 %call2.9, 15
  %cmp5.9 = icmp eq i32 %rem.9, 2
  br i1 %cmp5.9, label %do.body.9, label %for.inc.9

for.inc.9:                                        ; preds = %do.body.9
  %arrayidx.9 = getelementptr inbounds i8* %call, i64 36
  %30 = bitcast i8* %arrayidx.9 to i32*
  store i32 %rem.9, i32* %30, align 4
  br label %do.body.10

do.body.10:                                       ; preds = %do.body.10, %for.inc.9
  %call2.10 = tail call i32 @rand() nounwind
  %rem.10 = srem i32 %call2.10, 15
  %cmp5.10 = icmp eq i32 %rem.10, 2
  br i1 %cmp5.10, label %do.body.10, label %for.inc.10

for.inc.10:                                       ; preds = %do.body.10
  %arrayidx.10 = getelementptr inbounds i8* %call, i64 40
  %31 = bitcast i8* %arrayidx.10 to i32*
  store i32 %rem.10, i32* %31, align 4
  br label %do.body.11

do.body.11:                                       ; preds = %do.body.11, %for.inc.10
  %call2.11 = tail call i32 @rand() nounwind
  %rem.11 = srem i32 %call2.11, 15
  %cmp5.11 = icmp eq i32 %rem.11, 2
  br i1 %cmp5.11, label %do.body.11, label %for.inc.11

for.inc.11:                                       ; preds = %do.body.11
  %arrayidx.11 = getelementptr inbounds i8* %call, i64 44
  %32 = bitcast i8* %arrayidx.11 to i32*
  store i32 %rem.11, i32* %32, align 4
  br label %do.body.12

do.body.12:                                       ; preds = %do.body.12, %for.inc.11
  %call2.12 = tail call i32 @rand() nounwind
  %rem.12 = srem i32 %call2.12, 15
  %cmp5.12 = icmp eq i32 %rem.12, 2
  br i1 %cmp5.12, label %do.body.12, label %for.inc.12

for.inc.12:                                       ; preds = %do.body.12
  %arrayidx.12 = getelementptr inbounds i8* %call, i64 48
  %33 = bitcast i8* %arrayidx.12 to i32*
  store i32 %rem.12, i32* %33, align 4
  br label %do.body.13

do.body.13:                                       ; preds = %do.body.13, %for.inc.12
  %call2.13 = tail call i32 @rand() nounwind
  %rem.13 = srem i32 %call2.13, 15
  %cmp5.13 = icmp eq i32 %rem.13, 2
  br i1 %cmp5.13, label %do.body.13, label %for.inc.13

for.inc.13:                                       ; preds = %do.body.13
  %arrayidx.13 = getelementptr inbounds i8* %call, i64 52
  %34 = bitcast i8* %arrayidx.13 to i32*
  store i32 %rem.13, i32* %34, align 4
  br label %do.body.14

do.body.14:                                       ; preds = %do.body.14, %for.inc.13
  %call2.14 = tail call i32 @rand() nounwind
  %rem.14 = srem i32 %call2.14, 15
  %cmp5.14 = icmp eq i32 %rem.14, 2
  br i1 %cmp5.14, label %do.body.14, label %for.inc.14

for.inc.14:                                       ; preds = %do.body.14
  %arrayidx.14 = getelementptr inbounds i8* %call, i64 56
  %35 = bitcast i8* %arrayidx.14 to i32*
  store i32 %rem.14, i32* %35, align 4
  br label %for.body.i
}

declare noalias i8* @malloc(i64) nounwind

declare i32 @rand() nounwind

declare i32 @puts(i8* nocapture) nounwind

!0 = metadata !{metadata !"int", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
