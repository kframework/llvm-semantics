; ModuleID = '/home/david/src/c-semantics/tests/llvm-regression/DuffsDevice.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [11 x i8] c"Sum is %d\0A\00", align 1

define void @sum(i16* nocapture %to, i16* nocapture %from, i32 %count) nounwind uwtable {
entry:
  %add = add nsw i32 %count, 7
  %div = sdiv i32 %add, 8
  %rem = srem i32 %count, 8
  switch i32 %rem, label %sw.epilog [
    i32 0, label %entry.do.body_crit_edge
    i32 7, label %entry.sw.bb4_crit_edge
    i32 6, label %entry.sw.bb10_crit_edge
    i32 5, label %entry.sw.bb16_crit_edge
    i32 4, label %entry.sw.bb22_crit_edge
    i32 3, label %entry.sw.bb28_crit_edge
    i32 2, label %entry.sw.bb34_crit_edge
    i32 1, label %entry.sw.bb40_crit_edge
  ]

entry.do.body_crit_edge:                          ; preds = %entry
  %.pre = load i16* %to, align 2, !tbaa !0
  br label %do.body

entry.sw.bb4_crit_edge:                           ; preds = %entry
  %.pre63 = load i16* %to, align 2, !tbaa !0
  br label %sw.bb4

entry.sw.bb10_crit_edge:                          ; preds = %entry
  %.pre64 = load i16* %to, align 2, !tbaa !0
  br label %sw.bb10

entry.sw.bb16_crit_edge:                          ; preds = %entry
  %.pre65 = load i16* %to, align 2, !tbaa !0
  br label %sw.bb16

entry.sw.bb22_crit_edge:                          ; preds = %entry
  %.pre66 = load i16* %to, align 2, !tbaa !0
  br label %sw.bb22

entry.sw.bb28_crit_edge:                          ; preds = %entry
  %.pre67 = load i16* %to, align 2, !tbaa !0
  br label %sw.bb28

entry.sw.bb34_crit_edge:                          ; preds = %entry
  %.pre68 = load i16* %to, align 2, !tbaa !0
  br label %sw.bb34

entry.sw.bb40_crit_edge:                          ; preds = %entry
  %.pre69 = load i16* %to, align 2, !tbaa !0
  br label %sw.bb40

do.body:                                          ; preds = %entry.do.body_crit_edge, %sw.bb40
  %0 = phi i16 [ %add44, %sw.bb40 ], [ %.pre, %entry.do.body_crit_edge ]
  %from.addr.0 = phi i16* [ %incdec.ptr41, %sw.bb40 ], [ %from, %entry.do.body_crit_edge ]
  %n.0 = phi i32 [ %dec, %sw.bb40 ], [ %div, %entry.do.body_crit_edge ]
  %incdec.ptr = getelementptr inbounds i16* %from.addr.0, i64 1
  %1 = load i16* %from.addr.0, align 2, !tbaa !0
  %add2 = add i16 %0, %1
  store i16 %add2, i16* %to, align 2, !tbaa !0
  br label %sw.bb4

sw.bb4:                                           ; preds = %entry.sw.bb4_crit_edge, %do.body
  %2 = phi i16 [ %add2, %do.body ], [ %.pre63, %entry.sw.bb4_crit_edge ]
  %from.addr.1 = phi i16* [ %incdec.ptr, %do.body ], [ %from, %entry.sw.bb4_crit_edge ]
  %n.1 = phi i32 [ %n.0, %do.body ], [ %div, %entry.sw.bb4_crit_edge ]
  %incdec.ptr5 = getelementptr inbounds i16* %from.addr.1, i64 1
  %3 = load i16* %from.addr.1, align 2, !tbaa !0
  %add8 = add i16 %2, %3
  store i16 %add8, i16* %to, align 2, !tbaa !0
  br label %sw.bb10

sw.bb10:                                          ; preds = %entry.sw.bb10_crit_edge, %sw.bb4
  %4 = phi i16 [ %add8, %sw.bb4 ], [ %.pre64, %entry.sw.bb10_crit_edge ]
  %from.addr.2 = phi i16* [ %incdec.ptr5, %sw.bb4 ], [ %from, %entry.sw.bb10_crit_edge ]
  %n.2 = phi i32 [ %n.1, %sw.bb4 ], [ %div, %entry.sw.bb10_crit_edge ]
  %incdec.ptr11 = getelementptr inbounds i16* %from.addr.2, i64 1
  %5 = load i16* %from.addr.2, align 2, !tbaa !0
  %add14 = add i16 %4, %5
  store i16 %add14, i16* %to, align 2, !tbaa !0
  br label %sw.bb16

sw.bb16:                                          ; preds = %entry.sw.bb16_crit_edge, %sw.bb10
  %6 = phi i16 [ %add14, %sw.bb10 ], [ %.pre65, %entry.sw.bb16_crit_edge ]
  %from.addr.3 = phi i16* [ %incdec.ptr11, %sw.bb10 ], [ %from, %entry.sw.bb16_crit_edge ]
  %n.3 = phi i32 [ %n.2, %sw.bb10 ], [ %div, %entry.sw.bb16_crit_edge ]
  %incdec.ptr17 = getelementptr inbounds i16* %from.addr.3, i64 1
  %7 = load i16* %from.addr.3, align 2, !tbaa !0
  %add20 = add i16 %6, %7
  store i16 %add20, i16* %to, align 2, !tbaa !0
  br label %sw.bb22

sw.bb22:                                          ; preds = %entry.sw.bb22_crit_edge, %sw.bb16
  %8 = phi i16 [ %add20, %sw.bb16 ], [ %.pre66, %entry.sw.bb22_crit_edge ]
  %from.addr.4 = phi i16* [ %incdec.ptr17, %sw.bb16 ], [ %from, %entry.sw.bb22_crit_edge ]
  %n.4 = phi i32 [ %n.3, %sw.bb16 ], [ %div, %entry.sw.bb22_crit_edge ]
  %incdec.ptr23 = getelementptr inbounds i16* %from.addr.4, i64 1
  %9 = load i16* %from.addr.4, align 2, !tbaa !0
  %add26 = add i16 %8, %9
  store i16 %add26, i16* %to, align 2, !tbaa !0
  br label %sw.bb28

sw.bb28:                                          ; preds = %entry.sw.bb28_crit_edge, %sw.bb22
  %10 = phi i16 [ %add26, %sw.bb22 ], [ %.pre67, %entry.sw.bb28_crit_edge ]
  %from.addr.5 = phi i16* [ %incdec.ptr23, %sw.bb22 ], [ %from, %entry.sw.bb28_crit_edge ]
  %n.5 = phi i32 [ %n.4, %sw.bb22 ], [ %div, %entry.sw.bb28_crit_edge ]
  %incdec.ptr29 = getelementptr inbounds i16* %from.addr.5, i64 1
  %11 = load i16* %from.addr.5, align 2, !tbaa !0
  %add32 = add i16 %10, %11
  store i16 %add32, i16* %to, align 2, !tbaa !0
  br label %sw.bb34

sw.bb34:                                          ; preds = %entry.sw.bb34_crit_edge, %sw.bb28
  %12 = phi i16 [ %add32, %sw.bb28 ], [ %.pre68, %entry.sw.bb34_crit_edge ]
  %from.addr.6 = phi i16* [ %incdec.ptr29, %sw.bb28 ], [ %from, %entry.sw.bb34_crit_edge ]
  %n.6 = phi i32 [ %n.5, %sw.bb28 ], [ %div, %entry.sw.bb34_crit_edge ]
  %incdec.ptr35 = getelementptr inbounds i16* %from.addr.6, i64 1
  %13 = load i16* %from.addr.6, align 2, !tbaa !0
  %add38 = add i16 %12, %13
  store i16 %add38, i16* %to, align 2, !tbaa !0
  br label %sw.bb40

sw.bb40:                                          ; preds = %entry.sw.bb40_crit_edge, %sw.bb34
  %14 = phi i16 [ %.pre69, %entry.sw.bb40_crit_edge ], [ %add38, %sw.bb34 ]
  %from.addr.7 = phi i16* [ %from, %entry.sw.bb40_crit_edge ], [ %incdec.ptr35, %sw.bb34 ]
  %n.7 = phi i32 [ %div, %entry.sw.bb40_crit_edge ], [ %n.6, %sw.bb34 ]
  %incdec.ptr41 = getelementptr inbounds i16* %from.addr.7, i64 1
  %15 = load i16* %from.addr.7, align 2, !tbaa !0
  %add44 = add i16 %14, %15
  store i16 %add44, i16* %to, align 2, !tbaa !0
  %dec = add nsw i32 %n.7, -1
  %cmp = icmp sgt i32 %dec, 0
  br i1 %cmp, label %do.body, label %sw.epilog

sw.epilog:                                        ; preds = %sw.bb40, %entry
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  %Array1214 = alloca [25 x i64], align 16
  %Array1214.sub = getelementptr inbounds [25 x i64]* %Array1214, i64 0, i64 0
  %tmpcast = bitcast [25 x i64]* %Array1214 to [100 x i16]*
  br label %for.body

for.body:                                         ; preds = %entry, %for.body
  %indvars.iv = phi i64 [ 0, %entry ], [ %indvars.iv.next, %for.body ]
  %i.011 = phi i32 [ 0, %entry ], [ %inc, %for.body ]
  %conv = trunc i32 %i.011 to i16
  %arrayidx = getelementptr inbounds [100 x i16]* %tmpcast, i64 0, i64 %indvars.iv
  store i16 %conv, i16* %arrayidx, align 2, !tbaa !0
  %indvars.iv.next = add i64 %indvars.iv, 1
  %inc = add nsw i32 %i.011, 1
  %lftr.wideiv = trunc i64 %indvars.iv.next to i32
  %exitcond = icmp eq i32 %lftr.wideiv, 100
  br i1 %exitcond, label %for.end, label %for.body

for.end:                                          ; preds = %for.body
  %arraydecay = bitcast [25 x i64]* %Array1214 to i16*
  %0 = load i64* %Array1214.sub, align 16
  %1 = trunc i64 %0 to i32
  %2 = trunc i64 %0 to i16
  %3 = lshr i32 %1, 16
  %4 = trunc i32 %3 to i16
  %5 = lshr i64 %0, 32
  %6 = trunc i64 %5 to i16
  %7 = lshr i64 %0, 48
  %8 = trunc i64 %7 to i16
  %add32.i5 = add i16 %2, %4
  %add38.i6 = add i16 %add32.i5, %6
  %add44.i7 = add i16 %add38.i6, %8
  br label %do.body.i

do.body.i:                                        ; preds = %for.end, %do.body.i
  %add44.i10 = phi i16 [ %add44.i7, %for.end ], [ %add44.i, %do.body.i ]
  %n.4.i9 = phi i32 [ 12, %for.end ], [ %phitmp, %do.body.i ]
  %from.addr.4.i8 = phi i16* [ %arraydecay, %for.end ], [ %incdec.ptr17.i, %do.body.i ]
  %incdec.ptr41.i = getelementptr inbounds i16* %from.addr.4.i8, i64 4
  %incdec.ptr.i = getelementptr inbounds i16* %from.addr.4.i8, i64 5
  %9 = load i16* %incdec.ptr41.i, align 2, !tbaa !0
  %incdec.ptr5.i = getelementptr inbounds i16* %from.addr.4.i8, i64 6
  %10 = load i16* %incdec.ptr.i, align 2, !tbaa !0
  %incdec.ptr11.i = getelementptr inbounds i16* %from.addr.4.i8, i64 7
  %11 = load i16* %incdec.ptr5.i, align 2, !tbaa !0
  %incdec.ptr17.i = getelementptr inbounds i16* %from.addr.4.i8, i64 8
  %12 = load i16* %incdec.ptr11.i, align 2, !tbaa !0
  %add2.i = add i16 %9, %add44.i10
  %add8.i = add i16 %add2.i, %10
  %add14.i = add i16 %add8.i, %11
  %add20.i = add i16 %add14.i, %12
  %phitmp = add i32 %n.4.i9, -1
  %incdec.ptr23.i = getelementptr inbounds i16* %from.addr.4.i8, i64 9
  %13 = load i16* %incdec.ptr17.i, align 2, !tbaa !0
  %incdec.ptr29.i = getelementptr inbounds i16* %from.addr.4.i8, i64 10
  %14 = load i16* %incdec.ptr23.i, align 2, !tbaa !0
  %incdec.ptr35.i = getelementptr inbounds i16* %from.addr.4.i8, i64 11
  %15 = load i16* %incdec.ptr29.i, align 2, !tbaa !0
  %16 = load i16* %incdec.ptr35.i, align 2, !tbaa !0
  %add26.i = add i16 %13, %add20.i
  %add32.i = add i16 %add26.i, %14
  %add38.i = add i16 %add32.i, %15
  %add44.i = add i16 %add38.i, %16
  %cmp.i = icmp sgt i32 %phitmp, 0
  br i1 %cmp.i, label %do.body.i, label %sum.exit

sum.exit:                                         ; preds = %do.body.i
  %conv1 = sext i16 %add44.i to i32
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @.str, i64 0, i64 0), i32 %conv1) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind

!0 = metadata !{metadata !"short", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
