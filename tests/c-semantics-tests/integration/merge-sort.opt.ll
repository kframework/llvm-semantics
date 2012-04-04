; ModuleID = '/home/david/src/c-semantics/tests/integration/merge-sort.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [4 x i8] c"%d,\00", align 1

define i32 @main() nounwind uwtable {
entry:
  %call.i = tail call noalias i8* @malloc(i64 12) nounwind
  %0 = bitcast i8* %call.i to i32*
  store i32 20, i32* %0, align 4, !tbaa !0
  %add.ptr.i = getelementptr inbounds i8* %call.i, i64 4
  %1 = bitcast i8* %add.ptr.i to i32**
  store i32* null, i32** %1, align 8, !tbaa !3
  %call.i8 = tail call noalias i8* @malloc(i64 12) nounwind
  %2 = bitcast i8* %call.i8 to i32*
  store i32 25, i32* %2, align 4, !tbaa !0
  %add.ptr.i9 = getelementptr inbounds i8* %call.i8, i64 4
  %3 = bitcast i8* %add.ptr.i9 to i32**
  store i32* %0, i32** %3, align 8, !tbaa !3
  %call.i10 = tail call noalias i8* @malloc(i64 12) nounwind
  %4 = bitcast i8* %call.i10 to i32*
  store i32 15, i32* %4, align 4, !tbaa !0
  %add.ptr.i11 = getelementptr inbounds i8* %call.i10, i64 4
  %5 = bitcast i8* %add.ptr.i11 to i32**
  store i32* %2, i32** %5, align 8, !tbaa !3
  %call.i12 = tail call noalias i8* @malloc(i64 12) nounwind
  %6 = bitcast i8* %call.i12 to i32*
  store i32 30, i32* %6, align 4, !tbaa !0
  %add.ptr.i13 = getelementptr inbounds i8* %call.i12, i64 4
  %7 = bitcast i8* %add.ptr.i13 to i32**
  store i32* %4, i32** %7, align 8, !tbaa !3
  %call.i14 = tail call noalias i8* @malloc(i64 12) nounwind
  %8 = bitcast i8* %call.i14 to i32*
  store i32 10, i32* %8, align 4, !tbaa !0
  %add.ptr.i15 = getelementptr inbounds i8* %call.i14, i64 4
  %9 = bitcast i8* %add.ptr.i15 to i32**
  store i32* %6, i32** %9, align 8, !tbaa !3
  %call.i16 = tail call noalias i8* @malloc(i64 12) nounwind
  %10 = bitcast i8* %call.i16 to i32*
  store i32 35, i32* %10, align 4, !tbaa !0
  %add.ptr.i17 = getelementptr inbounds i8* %call.i16, i64 4
  %11 = bitcast i8* %add.ptr.i17 to i32**
  store i32* %8, i32** %11, align 8, !tbaa !3
  %call6 = tail call i32* @fsl_mergesort(i32* %10)
  %cmp18 = icmp eq i32* %call6, null
  br i1 %cmp18, label %while.end, label %while.body

while.body:                                       ; preds = %entry, %while.body
  %curr.019 = phi i32* [ %14, %while.body ], [ %call6, %entry ]
  %12 = load i32* %curr.019, align 4, !tbaa !0
  %call7 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 %12) nounwind
  %add.ptr = getelementptr inbounds i32* %curr.019, i64 1
  %13 = bitcast i32* %add.ptr to i32**
  %14 = load i32** %13, align 8, !tbaa !3
  %cmp = icmp eq i32* %14, null
  br i1 %cmp, label %while.end, label %while.body

while.end:                                        ; preds = %while.body, %entry
  ret i32 0
}

define noalias i32* @listCons(i32* %p, i32 %n) nounwind uwtable {
entry:
  %call = tail call noalias i8* @malloc(i64 12) nounwind
  %0 = bitcast i8* %call to i32*
  store i32 %n, i32* %0, align 4, !tbaa !0
  %add.ptr = getelementptr inbounds i8* %call, i64 4
  %1 = bitcast i8* %add.ptr to i32**
  store i32* %p, i32** %1, align 8, !tbaa !3
  ret i32* %0
}

define i32* @fsl_mergesort(i32* %l) nounwind uwtable {
entry:
  %cmp = icmp eq i32* %l, null
  br i1 %cmp, label %if.end32, label %land.lhs.true

land.lhs.true:                                    ; preds = %entry
  %add.ptr = getelementptr inbounds i32* %l, i64 1
  %0 = bitcast i32* %add.ptr to i32**
  %1 = load i32** %0, align 8, !tbaa !3
  %tobool = icmp eq i32* %1, null
  br i1 %tobool, label %if.end32, label %while.cond.outer

while.cond.outer:                                 ; preds = %land.lhs.true, %if.then7
  %b.0.ph = phi i32* [ %3, %if.then7 ], [ null, %land.lhs.true ]
  %a.0.ph = phi i32* [ %l.addr.0, %if.then7 ], [ null, %land.lhs.true ]
  %l.addr.0.ph = phi i32* [ %5, %if.then7 ], [ %l, %land.lhs.true ]
  br label %while.cond

while.cond:                                       ; preds = %while.cond.outer, %while.body
  %a.0 = phi i32* [ %l.addr.0, %while.body ], [ %a.0.ph, %while.cond.outer ]
  %l.addr.0 = phi i32* [ null, %while.body ], [ %l.addr.0.ph, %while.cond.outer ]
  %cmp3 = icmp eq i32* %l.addr.0, null
  br i1 %cmp3, label %while.end, label %while.body

while.body:                                       ; preds = %while.cond
  %add.ptr4 = getelementptr inbounds i32* %l.addr.0, i64 1
  %2 = bitcast i32* %add.ptr4 to i32**
  %3 = load i32** %2, align 8, !tbaa !3
  store i32* %a.0, i32** %2, align 8, !tbaa !3
  %cmp6 = icmp eq i32* %3, null
  br i1 %cmp6, label %while.cond, label %if.then7

if.then7:                                         ; preds = %while.body
  %add.ptr8 = getelementptr inbounds i32* %3, i64 1
  %4 = bitcast i32* %add.ptr8 to i32**
  %5 = load i32** %4, align 8, !tbaa !3
  store i32* %b.0.ph, i32** %4, align 8, !tbaa !3
  br label %while.cond.outer

while.end:                                        ; preds = %while.cond
  %call = tail call i32* @fsl_mergesort(i32* %a.0)
  %call10 = tail call i32* @fsl_mergesort(i32* %b.0.ph)
  br label %while.cond11.outer

while.cond11.outer:                               ; preds = %if.else.us, %if.then16.us, %while.end
  %h.0.ph = phi i32* [ null, %while.end ], [ %a.1.ph, %if.then16.us ], [ %b.1.ph, %if.else.us ]
  %b.1.ph = phi i32* [ %call10, %while.end ], [ %b.1.ph, %if.then16.us ], [ %11, %if.else.us ]
  %a.1.ph = phi i32* [ %call, %while.end ], [ %7, %if.then16.us ], [ %a.1.ph, %if.else.us ]
  %cmp20 = icmp eq i32* %h.0.ph, null
  br i1 %cmp20, label %while.cond11.us, label %while.cond11

while.cond11.us:                                  ; preds = %while.cond11.outer
  %cmp12.us = icmp ne i32* %a.1.ph, null
  %cmp12.not.us = xor i1 %cmp12.us, true
  %cmp13.us = icmp eq i32* %b.1.ph, null
  %or.cond.us = or i1 %cmp13.us, %cmp12.not.us
  br i1 %or.cond.us, label %while.end25, label %while.body14.us

if.then16.us:                                     ; preds = %while.body14.us
  %add.ptr17.us = getelementptr inbounds i32* %a.1.ph, i64 1
  %6 = bitcast i32* %add.ptr17.us to i32**
  %7 = load i32** %6, align 8, !tbaa !3
  br label %while.cond11.outer

while.body14.us:                                  ; preds = %while.cond11.us
  %8 = load i32* %b.1.ph, align 4, !tbaa !0
  %9 = load i32* %a.1.ph, align 4, !tbaa !0
  %cmp15.us = icmp sgt i32 %8, %9
  br i1 %cmp15.us, label %if.then16.us, label %if.else.us

if.else.us:                                       ; preds = %while.body14.us
  %add.ptr18.us = getelementptr inbounds i32* %b.1.ph, i64 1
  %10 = bitcast i32* %add.ptr18.us to i32**
  %11 = load i32** %10, align 8, !tbaa !3
  br label %while.cond11.outer

while.cond11:                                     ; preds = %while.cond11.outer, %if.then21
  %t.0 = phi i32* [ %e.0, %if.then21 ], [ %h.0.ph, %while.cond11.outer ]
  %b.1 = phi i32* [ %b.2, %if.then21 ], [ %b.1.ph, %while.cond11.outer ]
  %a.1 = phi i32* [ %a.2, %if.then21 ], [ %a.1.ph, %while.cond11.outer ]
  %cmp12 = icmp ne i32* %a.1, null
  %cmp12.not = xor i1 %cmp12, true
  %cmp13 = icmp eq i32* %b.1, null
  %or.cond = or i1 %cmp13, %cmp12.not
  br i1 %or.cond, label %while.end25, label %while.body14

while.body14:                                     ; preds = %while.cond11
  %12 = load i32* %b.1, align 4, !tbaa !0
  %13 = load i32* %a.1, align 4, !tbaa !0
  %cmp15 = icmp sgt i32 %12, %13
  br i1 %cmp15, label %if.then16, label %if.else

if.then16:                                        ; preds = %while.body14
  %add.ptr17 = getelementptr inbounds i32* %a.1, i64 1
  %14 = bitcast i32* %add.ptr17 to i32**
  %15 = load i32** %14, align 8, !tbaa !3
  br label %if.then21

if.else:                                          ; preds = %while.body14
  %add.ptr18 = getelementptr inbounds i32* %b.1, i64 1
  %16 = bitcast i32* %add.ptr18 to i32**
  %17 = load i32** %16, align 8, !tbaa !3
  br label %if.then21

if.then21:                                        ; preds = %if.then16, %if.else
  %e.0 = phi i32* [ %a.1, %if.then16 ], [ %b.1, %if.else ]
  %b.2 = phi i32* [ %b.1, %if.then16 ], [ %17, %if.else ]
  %a.2 = phi i32* [ %15, %if.then16 ], [ %a.1, %if.else ]
  %add.ptr22 = getelementptr inbounds i32* %t.0, i64 1
  %18 = bitcast i32* %add.ptr22 to i32**
  store i32* %e.0, i32** %18, align 8, !tbaa !3
  br label %while.cond11

while.end25:                                      ; preds = %while.cond11, %while.cond11.us
  %h.0.ph54 = phi i32* [ null, %while.cond11.us ], [ %h.0.ph, %while.cond11 ]
  %cmp12.lcssa = phi i1 [ %cmp12.us, %while.cond11.us ], [ %cmp12, %while.cond11 ]
  %a.1.lcssa = phi i32* [ %a.1.ph, %while.cond11.us ], [ %a.1, %while.cond11 ]
  %b.1.lcssa = phi i32* [ %b.1.ph, %while.cond11.us ], [ %b.1, %while.cond11 ]
  %t.0.lcssa = phi i32* [ %h.0.ph, %while.cond11.us ], [ %t.0, %while.cond11 ]
  %add.ptr28 = getelementptr inbounds i32* %t.0.lcssa, i64 1
  %19 = bitcast i32* %add.ptr28 to i32**
  br i1 %cmp12.lcssa, label %if.then27, label %if.else29

if.then27:                                        ; preds = %while.end25
  store i32* %a.1.lcssa, i32** %19, align 8, !tbaa !3
  br label %if.end32

if.else29:                                        ; preds = %while.end25
  store i32* %b.1.lcssa, i32** %19, align 8, !tbaa !3
  br label %if.end32

if.end32:                                         ; preds = %if.then27, %if.else29, %land.lhs.true, %entry
  %l.addr.1 = phi i32* [ %l, %land.lhs.true ], [ null, %entry ], [ %h.0.ph54, %if.else29 ], [ %h.0.ph54, %if.then27 ]
  ret i32* %l.addr.1
}

declare i32 @printf(i8* nocapture, ...) nounwind

declare noalias i8* @malloc(i64) nounwind

!0 = metadata !{metadata !"int", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
!3 = metadata !{metadata !"any pointer", metadata !1}
