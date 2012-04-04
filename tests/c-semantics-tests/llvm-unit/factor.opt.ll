; ModuleID = '/home/david/src/c-semantics/tests/llvm-unit/factor.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@plane = internal unnamed_addr global [50 x i8] zeroinitializer, align 16
@.str = private unnamed_addr constant [4 x i8] c"%d \00", align 1

define void @fill() nounwind uwtable {
entry:
  br label %for.body

for.body:                                         ; preds = %for.body, %entry
  %indvars.iv = phi i64 [ 0, %entry ], [ %indvars.iv.next, %for.body ]
  %arrayidx = getelementptr inbounds [50 x i8]* @plane, i64 0, i64 %indvars.iv
  %0 = trunc i64 %indvars.iv to i32
  %rem = urem i32 %0, 17
  %cmp1 = icmp eq i32 %rem, 0
  %. = select i1 %cmp1, i8 -128, i8 0
  %rem5 = urem i32 %0, 13
  %cmp6 = icmp eq i32 %rem5, 0
  %or12 = or i8 %., 64
  %storemerge = select i1 %cmp6, i8 %or12, i8 %.
  %rem15 = urem i32 %0, 11
  %cmp16 = icmp eq i32 %rem15, 0
  %or22 = or i8 %storemerge, 32
  %1 = select i1 %cmp16, i8 %or22, i8 %storemerge
  %rem25 = urem i32 %0, 7
  %cmp26 = icmp eq i32 %rem25, 0
  %or32 = or i8 %1, 16
  %or32. = select i1 %cmp26, i8 %or32, i8 %1
  %rem35 = urem i32 %0, 5
  %cmp36 = icmp eq i32 %rem35, 0
  %or42 = or i8 %or32., 8
  %2 = select i1 %cmp36, i8 %or42, i8 %or32.
  %rem45 = urem i32 %0, 3
  %cmp46 = icmp eq i32 %rem45, 0
  %or52 = or i8 %2, 4
  %or52. = select i1 %cmp46, i8 %or52, i8 %2
  %rem55 = and i32 %0, 1
  %cmp56 = icmp eq i32 %rem55, 0
  %or62 = or i8 %or52., 2
  %3 = select i1 %cmp56, i8 %or62, i8 %or52.
  %or68 = or i8 %3, 1
  store i8 %or68, i8* %arrayidx, align 1, !tbaa !0
  %indvars.iv.next = add i64 %indvars.iv, 1
  %lftr.wideiv = trunc i64 %indvars.iv.next to i32
  %exitcond = icmp eq i32 %lftr.wideiv, 50
  br i1 %exitcond, label %for.end, label %for.body

for.end:                                          ; preds = %for.body
  ret void
}

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable {
entry:
  br label %for.body.i

for.body.i:                                       ; preds = %for.body.i, %entry
  %indvars.iv.i = phi i64 [ 0, %entry ], [ %indvars.iv.next.i, %for.body.i ]
  %arrayidx.i = getelementptr inbounds [50 x i8]* @plane, i64 0, i64 %indvars.iv.i
  %0 = trunc i64 %indvars.iv.i to i32
  %rem.i = urem i32 %0, 17
  %cmp1.i = icmp eq i32 %rem.i, 0
  %..i = select i1 %cmp1.i, i8 -128, i8 0
  %rem5.i = urem i32 %0, 13
  %cmp6.i = icmp eq i32 %rem5.i, 0
  %or12.i = or i8 %..i, 64
  %storemerge.i = select i1 %cmp6.i, i8 %or12.i, i8 %..i
  %rem15.i = urem i32 %0, 11
  %cmp16.i = icmp eq i32 %rem15.i, 0
  %or22.i = or i8 %storemerge.i, 32
  %1 = select i1 %cmp16.i, i8 %or22.i, i8 %storemerge.i
  %rem25.i = urem i32 %0, 7
  %cmp26.i = icmp eq i32 %rem25.i, 0
  %or32.i = or i8 %1, 16
  %or32..i = select i1 %cmp26.i, i8 %or32.i, i8 %1
  %rem35.i = urem i32 %0, 5
  %cmp36.i = icmp eq i32 %rem35.i, 0
  %or42.i = or i8 %or32..i, 8
  %2 = select i1 %cmp36.i, i8 %or42.i, i8 %or32..i
  %rem45.i = urem i32 %0, 3
  %cmp46.i = icmp eq i32 %rem45.i, 0
  %or52.i = or i8 %2, 4
  %or52..i = select i1 %cmp46.i, i8 %or52.i, i8 %2
  %rem55.i = and i32 %0, 1
  %cmp56.i = icmp eq i32 %rem55.i, 0
  %or62.i = or i8 %or52..i, 2
  %3 = select i1 %cmp56.i, i8 %or62.i, i8 %or52..i
  %or68.i = or i8 %3, 1
  store i8 %or68.i, i8* %arrayidx.i, align 1, !tbaa !0
  %indvars.iv.next.i = add i64 %indvars.iv.i, 1
  %lftr.wideiv4 = trunc i64 %indvars.iv.next.i to i32
  %exitcond5 = icmp eq i32 %lftr.wideiv4, 50
  br i1 %exitcond5, label %for.body, label %for.body.i

for.body:                                         ; preds = %for.body.i, %for.inc
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.inc ], [ 0, %for.body.i ]
  %arrayidx = getelementptr inbounds [50 x i8]* @plane, i64 0, i64 %indvars.iv
  %4 = load i8* %arrayidx, align 1, !tbaa !0
  %and = and i8 %4, 16
  %tobool = icmp eq i8 %and, 0
  br i1 %tobool, label %for.inc, label %if.then

if.then:                                          ; preds = %for.body
  %5 = trunc i64 %indvars.iv to i32
  %call = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 %5) nounwind
  br label %for.inc

for.inc:                                          ; preds = %for.body, %if.then
  %indvars.iv.next = add i64 %indvars.iv, 1
  %lftr.wideiv = trunc i64 %indvars.iv.next to i32
  %exitcond = icmp eq i32 %lftr.wideiv, 50
  br i1 %exitcond, label %for.end, label %for.body

for.end:                                          ; preds = %for.inc
  %putchar = tail call i32 @putchar(i32 10) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind

declare i32 @putchar(i32)

!0 = metadata !{metadata !"omnipotent char", metadata !1}
!1 = metadata !{metadata !"Simple C/C++ TBAA", null}
