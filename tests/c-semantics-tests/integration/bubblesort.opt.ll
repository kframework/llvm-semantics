; ModuleID = '/home/david/src/c-semantics/tests/integration/bubblesort.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@main.arr = private unnamed_addr constant [7 x i32] [i32 -1, i32 2, i32 1, i32 3, i32 5, i32 -10, i32 -11], align 16
@.str = private unnamed_addr constant [23 x i8] c"array before sorting: \00", align 1
@.str1 = private unnamed_addr constant [25 x i8] c"array after bubblesort: \00", align 1
@.str2 = private unnamed_addr constant [4 x i8] c"%d \00", align 1
@stdout = external global %struct._IO_FILE*

define void @bubble_sort(i8* %base, i64 %nmemb, i64 %size, i32 (i8*, i8*)* nocapture %compar) nounwind uwtable {
entry:
  %sub = add i64 %nmemb, 4294967295
  %conv = trunc i64 %sub to i32
  %cmp16 = icmp sgt i32 %conv, 0
  br i1 %cmp16, label %for.cond2.preheader.lr.ph, label %for.end13

for.cond2.preheader.lr.ph:                        ; preds = %entry
  %cmp20.i = icmp eq i64 %size, 0
  %0 = sext i32 %conv to i64
  br i1 %cmp20.i, label %for.body5.lr.ph.split.us.us, label %for.body5.lr.ph.for.body5.lr.ph.split_crit_edge

for.inc12.us:                                     ; preds = %for.inc.us.us
  %indvars.iv.next44 = add i64 %indvars.iv43, -1
  %indvars.iv.next42 = add i32 %indvars.iv41, -1
  %1 = trunc i64 %indvars.iv.next44 to i32
  %cmp.us = icmp sgt i32 %1, 0
  br i1 %cmp.us, label %for.body5.lr.ph.split.us.us, label %for.end13

for.inc.us.us:                                    ; preds = %for.body5.lr.ph.split.us.us, %for.inc.us.us
  %indvars.iv = phi i64 [ 0, %for.body5.lr.ph.split.us.us ], [ %indvars.iv.next, %for.inc.us.us ]
  %call.us.us = tail call i32 %compar(i8* %base, i8* %base) nounwind
  %indvars.iv.next = add i64 %indvars.iv, 1
  %lftr.wideiv = trunc i64 %indvars.iv.next to i32
  %exitcond = icmp eq i32 %lftr.wideiv, %indvars.iv41
  br i1 %exitcond, label %for.inc12.us, label %for.inc.us.us

for.body5.lr.ph.split.us.us:                      ; preds = %for.cond2.preheader.lr.ph, %for.inc12.us
  %indvars.iv43 = phi i64 [ %indvars.iv.next44, %for.inc12.us ], [ %0, %for.cond2.preheader.lr.ph ]
  %indvars.iv41 = phi i32 [ %indvars.iv.next42, %for.inc12.us ], [ %conv, %for.cond2.preheader.lr.ph ]
  br label %for.inc.us.us

for.body5.lr.ph.for.body5.lr.ph.split_crit_edge:  ; preds = %for.cond2.preheader.lr.ph, %for.inc12
  %indvars.iv53 = phi i64 [ %indvars.iv.next54, %for.inc12 ], [ %0, %for.cond2.preheader.lr.ph ]
  %indvars.iv49 = phi i32 [ %indvars.iv.next50, %for.inc12 ], [ %conv, %for.cond2.preheader.lr.ph ]
  %indvar = phi i64 [ %indvar.next, %for.inc12 ], [ 0, %for.cond2.preheader.lr.ph ]
  %mul = mul i64 %indvars.iv53, %size
  %add.ptr = getelementptr inbounds i8* %base, i64 %mul
  br label %for.body5

for.body5:                                        ; preds = %for.inc, %for.body5.lr.ph.for.body5.lr.ph.split_crit_edge
  %indvars.iv47 = phi i64 [ 0, %for.body5.lr.ph.for.body5.lr.ph.split_crit_edge ], [ %indvars.iv.next48, %for.inc ]
  %mul8 = mul i64 %indvars.iv47, %size
  %add.ptr9 = getelementptr inbounds i8* %base, i64 %mul8
  %call = tail call i32 %compar(i8* %add.ptr, i8* %add.ptr9) nounwind
  %cmp10 = icmp sgt i32 %call, -1
  br i1 %cmp10, label %for.inc, label %for.body.i

for.body.i:                                       ; preds = %for.body5, %for.body.i
  %indvars.iv.i = phi i64 [ %indvars.iv.next.i, %for.body.i ], [ 0, %for.body5 ]
  %add.i = add i64 %indvars.iv.i, %mul
  %arrayidx.i = getelementptr inbounds i8* %base, i64 %add.i
  %2 = load i8* %arrayidx.i, align 1, !tbaa !0
  %add8.i = add i64 %indvars.iv.i, %mul8
  %arrayidx9.i = getelementptr inbounds i8* %base, i64 %add8.i
  %3 = load i8* %arrayidx9.i, align 1, !tbaa !0
  store i8 %3, i8* %arrayidx.i, align 1, !tbaa !0
  store i8 %2, i8* %arrayidx9.i, align 1, !tbaa !0
  %indvars.iv.next.i = add i64 %indvars.iv.i, 1
  %exitcond.i = icmp eq i64 %indvars.iv.next.i, %size
  br i1 %exitcond.i, label %for.inc, label %for.body.i

for.inc:                                          ; preds = %for.body.i, %for.body5
  %indvars.iv.next48 = add i64 %indvars.iv47, 1
  %lftr.wideiv51 = trunc i64 %indvars.iv.next48 to i32
  %exitcond52 = icmp eq i32 %lftr.wideiv51, %indvars.iv49
  br i1 %exitcond52, label %for.inc12, label %for.body5

for.inc12:                                        ; preds = %for.inc
  %indvars.iv.next54 = add i64 %indvars.iv53, -1
  %indvars.iv.next50 = add i32 %indvars.iv49, -1
  %indvar.next = add i64 %indvar, 1
  %lftr.wideiv55 = trunc i64 %indvar.next to i32
  %exitcond56 = icmp eq i32 %lftr.wideiv55, %conv
  br i1 %exitcond56, label %for.end13, label %for.body5.lr.ph.for.body5.lr.ph.split_crit_edge

for.end13:                                        ; preds = %for.inc12.us, %for.inc12, %entry
  ret void
}

define i32 @int_cmp_fun(i8* nocapture %v1, i8* nocapture %v2) nounwind uwtable readonly {
entry:
  %0 = bitcast i8* %v1 to i32*
  %1 = bitcast i8* %v2 to i32*
  %2 = load i32* %0, align 4, !tbaa !2
  %3 = load i32* %1, align 4, !tbaa !2
  %cmp = icmp eq i32 %2, %3
  br i1 %cmp, label %if.end4, label %if.else

if.else:                                          ; preds = %entry
  %cmp1 = icmp slt i32 %2, %3
  %. = select i1 %cmp1, i32 -1, i32 1
  br label %if.end4

if.end4:                                          ; preds = %if.else, %entry
  %result.0 = phi i32 [ 0, %entry ], [ %., %if.else ]
  ret i32 %result.0
}

define i32 @main() nounwind uwtable {
entry:
  %arr = alloca [7 x i32], align 16
  %0 = bitcast [7 x i32]* %arr to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %0, i8* bitcast ([7 x i32]* @main.arr to i8*), i64 28, i32 16, i1 false)
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str, i64 0, i64 0)) nounwind
  %call.i = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str2, i64 0, i64 0), i32 -1) nounwind
  %call.1.i = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str2, i64 0, i64 0), i32 2) nounwind
  %arrayidx.2.i = getelementptr inbounds [7 x i32]* %arr, i64 0, i64 2
  %call.2.i = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str2, i64 0, i64 0), i32 1) nounwind
  %call.3.i = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str2, i64 0, i64 0), i32 3) nounwind
  %arrayidx.4.i = getelementptr inbounds [7 x i32]* %arr, i64 0, i64 4
  %call.4.i = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str2, i64 0, i64 0), i32 5) nounwind
  %call.5.i = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str2, i64 0, i64 0), i32 -10) nounwind
  %arrayidx.6.i = getelementptr inbounds [7 x i32]* %arr, i64 0, i64 6
  %call.6.i = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str2, i64 0, i64 0), i32 -11) nounwind
  %1 = load %struct._IO_FILE** @stdout, align 8, !tbaa !3
  %call.i.i = call i32 @_IO_putc(i32 10, %struct._IO_FILE* %1) nounwind
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str1, i64 0, i64 0)) nounwind
  br label %for.body5.lr.ph.for.body5.lr.ph.split_crit_edge.i

for.body5.lr.ph.for.body5.lr.ph.split_crit_edge.i: ; preds = %for.inc12.i, %entry
  %indvars.iv = phi i32 [ %indvars.iv.next, %for.inc12.i ], [ 6, %entry ]
  %indvars.iv53.i = phi i64 [ %indvars.iv.next54.i, %for.inc12.i ], [ 6, %entry ]
  %indvar.i = phi i64 [ %indvar.next.i, %for.inc12.i ], [ 0, %entry ]
  %mul.i = shl i64 %indvars.iv53.i, 2
  %add.ptr.i20 = getelementptr inbounds [7 x i32]* %arr, i64 0, i64 %indvars.iv53.i
  br label %for.body5.i

for.body5.i:                                      ; preds = %for.inc.i, %for.body5.lr.ph.for.body5.lr.ph.split_crit_edge.i
  %indvars.iv47.i = phi i64 [ 0, %for.body5.lr.ph.for.body5.lr.ph.split_crit_edge.i ], [ %indvars.iv.next48.i, %for.inc.i ]
  %mul8.i = shl i64 %indvars.iv47.i, 2
  %add.ptr9.i21 = getelementptr inbounds [7 x i32]* %arr, i64 0, i64 %indvars.iv47.i
  %2 = load i32* %add.ptr.i20, align 4, !tbaa !2
  %3 = load i32* %add.ptr9.i21, align 4, !tbaa !2
  %4 = icmp slt i32 %2, %3
  br i1 %4, label %for.body.i.i.preheader, label %for.inc.i

for.body.i.i.preheader:                           ; preds = %for.body5.i
  %5 = trunc i32 %3 to i8
  %6 = trunc i32 %2 to i8
  %arrayidx.i.i26 = getelementptr inbounds [7 x i32]* %arr, i64 0, i64 %indvars.iv53.i
  %arrayidx.i.i = bitcast i32* %arrayidx.i.i26 to i8*
  %arrayidx9.i.i27 = getelementptr inbounds [7 x i32]* %arr, i64 0, i64 %indvars.iv47.i
  %arrayidx9.i.i = bitcast i32* %arrayidx9.i.i27 to i8*
  store i8 %5, i8* %arrayidx.i.i, align 4, !tbaa !0
  store i8 %6, i8* %arrayidx9.i.i, align 4, !tbaa !0
  %add.i.i.128 = or i64 %mul.i, 1
  %arrayidx.i.i.1 = getelementptr inbounds i8* %0, i64 %add.i.i.128
  %7 = load i8* %arrayidx.i.i.1, align 1, !tbaa !0
  %add8.i.i.129 = or i64 %mul8.i, 1
  %arrayidx9.i.i.1 = getelementptr inbounds i8* %0, i64 %add8.i.i.129
  %8 = load i8* %arrayidx9.i.i.1, align 1, !tbaa !0
  store i8 %8, i8* %arrayidx.i.i.1, align 1, !tbaa !0
  store i8 %7, i8* %arrayidx9.i.i.1, align 1, !tbaa !0
  %add.i.i.230 = or i64 %mul.i, 2
  %arrayidx.i.i.2 = getelementptr inbounds i8* %0, i64 %add.i.i.230
  %9 = load i8* %arrayidx.i.i.2, align 2, !tbaa !0
  %add8.i.i.231 = or i64 %mul8.i, 2
  %arrayidx9.i.i.2 = getelementptr inbounds i8* %0, i64 %add8.i.i.231
  %10 = load i8* %arrayidx9.i.i.2, align 2, !tbaa !0
  store i8 %10, i8* %arrayidx.i.i.2, align 2, !tbaa !0
  store i8 %9, i8* %arrayidx9.i.i.2, align 2, !tbaa !0
  %add.i.i.332 = or i64 %mul.i, 3
  %arrayidx.i.i.3 = getelementptr inbounds i8* %0, i64 %add.i.i.332
  %11 = load i8* %arrayidx.i.i.3, align 1, !tbaa !0
  %add8.i.i.333 = or i64 %mul8.i, 3
  %arrayidx9.i.i.3 = getelementptr inbounds i8* %0, i64 %add8.i.i.333
  %12 = load i8* %arrayidx9.i.i.3, align 1, !tbaa !0
  store i8 %12, i8* %arrayidx.i.i.3, align 1, !tbaa !0
  store i8 %11, i8* %arrayidx9.i.i.3, align 1, !tbaa !0
  br label %for.inc.i

for.inc.i:                                        ; preds = %for.body.i.i.preheader, %for.body5.i
  %indvars.iv.next48.i = add i64 %indvars.iv47.i, 1
  %lftr.wideiv = trunc i64 %indvars.iv.next48.i to i32
  %exitcond = icmp eq i32 %lftr.wideiv, %indvars.iv
  br i1 %exitcond, label %for.inc12.i, label %for.body5.i

for.inc12.i:                                      ; preds = %for.inc.i
  %indvars.iv.next54.i = add i64 %indvars.iv53.i, -1
  %indvars.iv.next = add i32 %indvars.iv, -1
  %indvar.next.i = add i64 %indvar.i, 1
  %lftr.wideiv24 = trunc i64 %indvar.next.i to i32
  %exitcond25 = icmp eq i32 %lftr.wideiv24, 6
  br i1 %exitcond25, label %bubble_sort.exit, label %for.body5.lr.ph.for.body5.lr.ph.split_crit_edge.i

bubble_sort.exit:                                 ; preds = %for.inc12.i
  %13 = bitcast [7 x i32]* %arr to i64*
  %14 = load i64* %13, align 16
  %15 = trunc i64 %14 to i32
  %call.i5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str2, i64 0, i64 0), i32 %15) nounwind
  %16 = lshr i64 %14, 32
  %17 = trunc i64 %16 to i32
  %call.1.i7 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str2, i64 0, i64 0), i32 %17) nounwind
  %18 = bitcast i32* %arrayidx.2.i to i64*
  %19 = load i64* %18, align 8
  %20 = trunc i64 %19 to i32
  %call.2.i9 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str2, i64 0, i64 0), i32 %20) nounwind
  %21 = lshr i64 %19, 32
  %22 = trunc i64 %21 to i32
  %call.3.i11 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str2, i64 0, i64 0), i32 %22) nounwind
  %23 = bitcast i32* %arrayidx.4.i to i64*
  %24 = load i64* %23, align 16
  %25 = trunc i64 %24 to i32
  %call.4.i13 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str2, i64 0, i64 0), i32 %25) nounwind
  %26 = lshr i64 %24, 32
  %27 = trunc i64 %26 to i32
  %call.5.i15 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str2, i64 0, i64 0), i32 %27) nounwind
  %28 = load i32* %arrayidx.6.i, align 8, !tbaa !2
  %call.6.i17 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str2, i64 0, i64 0), i32 %28) nounwind
  %29 = load %struct._IO_FILE** @stdout, align 8, !tbaa !3
  %call.i.i18 = call i32 @_IO_putc(i32 10, %struct._IO_FILE* %29) nounwind
  ret i32 0
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

declare i32 @printf(i8* nocapture, ...) nounwind

declare i32 @_IO_putc(i32, %struct._IO_FILE* nocapture) nounwind

!0 = metadata !{metadata !"omnipotent char", metadata !1}
!1 = metadata !{metadata !"Simple C/C++ TBAA", null}
!2 = metadata !{metadata !"int", metadata !0}
!3 = metadata !{metadata !"any pointer", metadata !0}
