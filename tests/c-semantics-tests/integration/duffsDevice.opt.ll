; ModuleID = '/home/david/src/c-semantics/tests/integration/duffsDevice.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [21 x i8] c"%d: src=%d, dest=%d\0A\00", align 1

define i32 @main() nounwind uwtable {
entry:
  %call = tail call noalias i8* @malloc(i64 404) nounwind
  %0 = bitcast i8* %call to i32*
  %call3 = tail call noalias i8* @malloc(i64 404) nounwind
  %1 = bitcast i8* %call3 to i32*
  call void @llvm.memset.p0i8.i64(i8* %call3, i8 0, i64 404, i32 4, i1 false)
  br label %for.body

sw.bb16.preheader:                                ; preds = %for.body
  %incdec.ptr1748 = getelementptr inbounds i8* %call, i64 4
  %2 = bitcast i8* %incdec.ptr1748 to i32*
  %3 = load i32* %0, align 4, !tbaa !0
  %incdec.ptr1849 = getelementptr inbounds i8* %call3, i64 4
  %4 = bitcast i8* %incdec.ptr1849 to i32*
  store i32 %3, i32* %1, align 4, !tbaa !0
  %incdec.ptr2050 = getelementptr inbounds i8* %call, i64 8
  %5 = bitcast i8* %incdec.ptr2050 to i32*
  %6 = load i32* %2, align 4, !tbaa !0
  %incdec.ptr2151 = getelementptr inbounds i8* %call3, i64 8
  %7 = bitcast i8* %incdec.ptr2151 to i32*
  store i32 %6, i32* %4, align 4, !tbaa !0
  %incdec.ptr2352 = getelementptr inbounds i8* %call, i64 12
  %8 = bitcast i8* %incdec.ptr2352 to i32*
  %9 = load i32* %5, align 4, !tbaa !0
  %incdec.ptr2453 = getelementptr inbounds i8* %call3, i64 12
  %10 = bitcast i8* %incdec.ptr2453 to i32*
  store i32 %9, i32* %7, align 4, !tbaa !0
  %incdec.ptr2654 = getelementptr inbounds i8* %call, i64 16
  %11 = bitcast i8* %incdec.ptr2654 to i32*
  %12 = load i32* %8, align 4, !tbaa !0
  %incdec.ptr2755 = getelementptr inbounds i8* %call3, i64 16
  %13 = bitcast i8* %incdec.ptr2755 to i32*
  store i32 %12, i32* %10, align 4, !tbaa !0
  %14 = load i32* %11, align 4, !tbaa !0
  store i32 %14, i32* %13, align 4, !tbaa !0
  br label %do.body

for.body:                                         ; preds = %for.body, %entry
  %indvars.iv60 = phi i64 [ 0, %entry ], [ %indvars.iv.next61, %for.body ]
  %15 = shl nsw i64 %indvars.iv60, 1
  %16 = or i64 %15, 1
  %arrayidx = getelementptr inbounds i32* %0, i64 %indvars.iv60
  %17 = trunc i64 %16 to i32
  store i32 %17, i32* %arrayidx, align 4, !tbaa !0
  %indvars.iv.next61 = add i64 %indvars.iv60, 1
  %lftr.wideiv64 = trunc i64 %indvars.iv.next61 to i32
  %exitcond65 = icmp eq i32 %lftr.wideiv64, 101
  br i1 %exitcond65, label %sw.bb16.preheader, label %for.body

do.body:                                          ; preds = %sw.bb16.preheader, %do.body
  %n.358 = phi i32 [ 12, %sw.bb16.preheader ], [ %phitmp, %do.body ]
  %src.357 = phi i32* [ %0, %sw.bb16.preheader ], [ %incdec.ptr14, %do.body ]
  %dest.356 = phi i32* [ %1, %sw.bb16.preheader ], [ %incdec.ptr15, %do.body ]
  %incdec.ptr30 = getelementptr inbounds i32* %dest.356, i64 5
  %incdec.ptr29 = getelementptr inbounds i32* %src.357, i64 5
  %incdec.ptr = getelementptr inbounds i32* %src.357, i64 6
  %18 = load i32* %incdec.ptr29, align 4, !tbaa !0
  %incdec.ptr9 = getelementptr inbounds i32* %dest.356, i64 6
  store i32 %18, i32* %incdec.ptr30, align 4, !tbaa !0
  %incdec.ptr11 = getelementptr inbounds i32* %src.357, i64 7
  %19 = load i32* %incdec.ptr, align 4, !tbaa !0
  %incdec.ptr12 = getelementptr inbounds i32* %dest.356, i64 7
  store i32 %19, i32* %incdec.ptr9, align 4, !tbaa !0
  %incdec.ptr14 = getelementptr inbounds i32* %src.357, i64 8
  %20 = load i32* %incdec.ptr11, align 4, !tbaa !0
  %incdec.ptr15 = getelementptr inbounds i32* %dest.356, i64 8
  store i32 %20, i32* %incdec.ptr12, align 4, !tbaa !0
  %phitmp = add i32 %n.358, -1
  %incdec.ptr17 = getelementptr inbounds i32* %src.357, i64 9
  %21 = load i32* %incdec.ptr14, align 4, !tbaa !0
  %incdec.ptr18 = getelementptr inbounds i32* %dest.356, i64 9
  store i32 %21, i32* %incdec.ptr15, align 4, !tbaa !0
  %incdec.ptr20 = getelementptr inbounds i32* %src.357, i64 10
  %22 = load i32* %incdec.ptr17, align 4, !tbaa !0
  %incdec.ptr21 = getelementptr inbounds i32* %dest.356, i64 10
  store i32 %22, i32* %incdec.ptr18, align 4, !tbaa !0
  %incdec.ptr23 = getelementptr inbounds i32* %src.357, i64 11
  %23 = load i32* %incdec.ptr20, align 4, !tbaa !0
  %incdec.ptr24 = getelementptr inbounds i32* %dest.356, i64 11
  store i32 %23, i32* %incdec.ptr21, align 4, !tbaa !0
  %incdec.ptr26 = getelementptr inbounds i32* %src.357, i64 12
  %24 = load i32* %incdec.ptr23, align 4, !tbaa !0
  %incdec.ptr27 = getelementptr inbounds i32* %dest.356, i64 12
  store i32 %24, i32* %incdec.ptr24, align 4, !tbaa !0
  %25 = load i32* %incdec.ptr26, align 4, !tbaa !0
  store i32 %25, i32* %incdec.ptr27, align 4, !tbaa !0
  %cmp31 = icmp sgt i32 %phitmp, 0
  br i1 %cmp31, label %do.body, label %for.body37

for.body37:                                       ; preds = %do.body, %for.body37
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body37 ], [ 0, %do.body ]
  %arrayidx39 = getelementptr inbounds i32* %0, i64 %indvars.iv
  %26 = load i32* %arrayidx39, align 4, !tbaa !0
  %arrayidx41 = getelementptr inbounds i32* %1, i64 %indvars.iv
  %27 = load i32* %arrayidx41, align 4, !tbaa !0
  %28 = trunc i64 %indvars.iv to i32
  %call42 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([21 x i8]* @.str, i64 0, i64 0), i32 %28, i32 %26, i32 %27) nounwind
  %indvars.iv.next = add i64 %indvars.iv, 1
  %lftr.wideiv = trunc i64 %indvars.iv.next to i32
  %exitcond = icmp eq i32 %lftr.wideiv, 101
  br i1 %exitcond, label %for.end45, label %for.body37

for.end45:                                        ; preds = %for.body37
  ret i32 0
}

declare noalias i8* @malloc(i64) nounwind

declare i32 @printf(i8* nocapture, ...) nounwind

declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) nounwind

!0 = metadata !{metadata !"int", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
