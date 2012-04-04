; ModuleID = '/home/david/src/c-semantics/tests/unitTests/structsAndLoops.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.gfc_array_i4 = type { i32*, i32, [7 x %struct.descriptor_dimension] }
%struct.descriptor_dimension = type { i32, i32, i32 }

@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@main.rdata = private unnamed_addr constant [3 x i32] [i32 1, i32 2, i32 3], align 4
@main.adata = private unnamed_addr constant [9 x i32] [i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13], align 16

define void @msum_i4(%struct.gfc_array_i4* nocapture %retarray, %struct.gfc_array_i4* nocapture %array, i32* nocapture %pdim) nounwind uwtable {
entry:
  %count = alloca [7 x i32], align 16
  %extent = alloca [7 x i32], align 16
  %0 = load i32* %pdim, align 4, !tbaa !0
  %sub = add nsw i32 %0, -1
  %idxprom = sext i32 %sub to i64
  %ubound = getelementptr inbounds %struct.gfc_array_i4* %array, i64 0, i32 2, i64 %idxprom, i32 2
  %1 = load i32* %ubound, align 4, !tbaa !0
  %lbound = getelementptr inbounds %struct.gfc_array_i4* %array, i64 0, i32 2, i64 %idxprom, i32 1
  %2 = load i32* %lbound, align 4, !tbaa !0
  %add = add i32 %1, 1
  %sub5 = sub i32 %add, %2
  %cmp39 = icmp sgt i32 %sub, 0
  br i1 %cmp39, label %for.body.lr.ph, label %for.end

for.body.lr.ph:                                   ; preds = %entry
  %count42 = bitcast [7 x i32]* %count to i8*
  %3 = add i32 %0, -2
  %4 = zext i32 %3 to i64
  %5 = shl nuw nsw i64 %4, 2
  %6 = add i64 %5, 4
  call void @llvm.memset.p0i8.i64(i8* %count42, i8 0, i64 %6, i32 16, i1 false)
  br label %for.body

for.body:                                         ; preds = %for.body, %for.body.lr.ph
  %indvars.iv = phi i64 [ 0, %for.body.lr.ph ], [ %indvars.iv.next, %for.body ]
  %ubound9 = getelementptr inbounds %struct.gfc_array_i4* %array, i64 0, i32 2, i64 %indvars.iv, i32 2
  %7 = load i32* %ubound9, align 4, !tbaa !0
  %lbound14 = getelementptr inbounds %struct.gfc_array_i4* %array, i64 0, i32 2, i64 %indvars.iv, i32 1
  %8 = load i32* %lbound14, align 4, !tbaa !0
  %add10 = add i32 %7, 1
  %sub15 = sub i32 %add10, %8
  %arrayidx17 = getelementptr inbounds [7 x i32]* %extent, i64 0, i64 %indvars.iv
  store i32 %sub15, i32* %arrayidx17, align 4, !tbaa !0
  %indvars.iv.next = add i64 %indvars.iv, 1
  %lftr.wideiv = trunc i64 %indvars.iv.next to i32
  %exitcond41 = icmp eq i32 %lftr.wideiv, %sub
  br i1 %exitcond41, label %for.end, label %for.body

for.end:                                          ; preds = %for.body, %entry
  %data = getelementptr inbounds %struct.gfc_array_i4* %retarray, i64 0, i32 0
  %9 = load i32** %data, align 8, !tbaa !3
  %data20 = getelementptr inbounds %struct.gfc_array_i4* %array, i64 0, i32 0
  %10 = load i32** %data20, align 8, !tbaa !3
  %11 = load i32* %9, align 4, !tbaa !0
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 %11) nounwind
  %cmp2234 = icmp sgt i32 %sub5, 0
  %arrayidx28 = getelementptr inbounds [7 x i32]* %count, i64 0, i64 0
  %arrayidx31 = getelementptr inbounds [7 x i32]* %extent, i64 0, i64 0
  br i1 %cmp2234, label %for.end.split.us, label %for.end27

for.end.split.us:                                 ; preds = %for.end
  %12 = sub i32 %1, %2
  %13 = zext i32 %12 to i64
  %14 = add i64 %13, 1
  br label %for.body23.lr.ph.us

for.end27.us:                                     ; preds = %for.body23.us
  %scevgep = getelementptr i32* %base.0.us, i64 %14
  store i32 %add24.us, i32* %dest.0.us, align 4, !tbaa !0
  %15 = load i32* %arrayidx28, align 16, !tbaa !0
  %inc29.us = add nsw i32 %15, 1
  store i32 %inc29.us, i32* %arrayidx28, align 16, !tbaa !0
  %add.ptr.us = getelementptr inbounds i32* %dest.0.us, i64 1
  %16 = load i32* %arrayidx31, align 16, !tbaa !0
  %cmp32.us = icmp eq i32 %inc29.us, %16
  br i1 %cmp32.us, label %do.end, label %for.body23.lr.ph.us

for.body23.us:                                    ; preds = %for.body23.us, %for.body23.lr.ph.us
  %result.037.us = phi i32 [ 0, %for.body23.lr.ph.us ], [ %add24.us, %for.body23.us ]
  %n.136.us = phi i32 [ 0, %for.body23.lr.ph.us ], [ %inc26.us, %for.body23.us ]
  %base.135.us = phi i32* [ %base.0.us, %for.body23.lr.ph.us ], [ %incdec.ptr.us, %for.body23.us ]
  %17 = load i32* %base.135.us, align 4, !tbaa !0
  %add24.us = add nsw i32 %17, %result.037.us
  %inc26.us = add nsw i32 %n.136.us, 1
  %incdec.ptr.us = getelementptr inbounds i32* %base.135.us, i64 1
  %exitcond = icmp eq i32 %inc26.us, %sub5
  br i1 %exitcond, label %for.end27.us, label %for.body23.us

for.body23.lr.ph.us:                              ; preds = %for.end.split.us, %for.end27.us
  %dest.0.us = phi i32* [ %9, %for.end.split.us ], [ %add.ptr.us, %for.end27.us ]
  %base.0.us = phi i32* [ %10, %for.end.split.us ], [ %scevgep, %for.end27.us ]
  br label %for.body23.us

for.end27:                                        ; preds = %for.end27, %for.end
  %dest.0 = phi i32* [ %add.ptr, %for.end27 ], [ %9, %for.end ]
  store i32 0, i32* %dest.0, align 4, !tbaa !0
  %18 = load i32* %arrayidx28, align 16, !tbaa !0
  %inc29 = add nsw i32 %18, 1
  store i32 %inc29, i32* %arrayidx28, align 16, !tbaa !0
  %add.ptr = getelementptr inbounds i32* %dest.0, i64 1
  %19 = load i32* %arrayidx31, align 16, !tbaa !0
  %cmp32 = icmp eq i32 %inc29, %19
  br i1 %cmp32, label %do.end, label %for.end27

do.end:                                           ; preds = %for.end27, %for.end27.us
  ret void
}

declare i32 @printf(i8* nocapture, ...) nounwind

define i32 @main() nounwind uwtable {
entry:
  %rdata = alloca [3 x i32], align 4
  %adata = alloca [9 x i32], align 16
  %retarray = alloca %struct.gfc_array_i4, align 8
  %array = alloca %struct.gfc_array_i4, align 8
  %dim13 = alloca i32, align 4
  %0 = bitcast [3 x i32]* %rdata to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %0, i8* bitcast ([3 x i32]* @main.rdata to i8*), i64 12, i32 4, i1 false)
  %1 = bitcast [9 x i32]* %adata to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %1, i8* bitcast ([9 x i32]* @main.adata to i8*), i64 36, i32 16, i1 false)
  %2 = bitcast %struct.gfc_array_i4* %retarray to i8*
  call void @llvm.memset.p0i8.i64(i8* %2, i8 0, i64 96, i32 8, i1 false)
  %data = getelementptr inbounds %struct.gfc_array_i4* %retarray, i64 0, i32 0
  %arraydecay = getelementptr inbounds [3 x i32]* %rdata, i64 0, i64 0
  store i32* %arraydecay, i32** %data, align 8, !tbaa !3
  %dtype = getelementptr inbounds %struct.gfc_array_i4* %retarray, i64 0, i32 1
  store i32 265, i32* %dtype, align 8, !tbaa !0
  %stride = getelementptr inbounds %struct.gfc_array_i4* %retarray, i64 0, i32 2, i64 0, i32 0
  store i32 1, i32* %stride, align 4, !tbaa !0
  %lbound = getelementptr inbounds %struct.gfc_array_i4* %retarray, i64 0, i32 2, i64 0, i32 1
  store i32 1, i32* %lbound, align 4, !tbaa !0
  %ubound = getelementptr inbounds %struct.gfc_array_i4* %retarray, i64 0, i32 2, i64 0, i32 2
  store i32 3, i32* %ubound, align 4, !tbaa !0
  %data1 = getelementptr inbounds %struct.gfc_array_i4* %array, i64 0, i32 0
  %arraydecay2 = getelementptr inbounds [9 x i32]* %adata, i64 0, i64 0
  store i32* %arraydecay2, i32** %data1, align 8, !tbaa !3
  %dtype3 = getelementptr inbounds %struct.gfc_array_i4* %array, i64 0, i32 1
  store i32 266, i32* %dtype3, align 8, !tbaa !0
  %stride6 = getelementptr inbounds %struct.gfc_array_i4* %array, i64 0, i32 2, i64 0, i32 0
  store i32 1, i32* %stride6, align 4, !tbaa !0
  %lbound7 = getelementptr inbounds %struct.gfc_array_i4* %array, i64 0, i32 2, i64 0, i32 1
  store i32 1, i32* %lbound7, align 4, !tbaa !0
  %ubound8 = getelementptr inbounds %struct.gfc_array_i4* %array, i64 0, i32 2, i64 0, i32 2
  store i32 3, i32* %ubound8, align 4, !tbaa !0
  %stride9 = getelementptr inbounds %struct.gfc_array_i4* %array, i64 0, i32 2, i64 1, i32 0
  store i32 3, i32* %stride9, align 4, !tbaa !0
  %lbound10 = getelementptr inbounds %struct.gfc_array_i4* %array, i64 0, i32 2, i64 1, i32 1
  store i32 1, i32* %lbound10, align 4, !tbaa !0
  %ubound11 = getelementptr inbounds %struct.gfc_array_i4* %array, i64 0, i32 2, i64 1, i32 2
  store i32 3, i32* %ubound11, align 4, !tbaa !0
  %arrayinit.start = getelementptr inbounds %struct.gfc_array_i4* %array, i64 0, i32 2, i64 2
  %scevgep14 = bitcast %struct.descriptor_dimension* %arrayinit.start to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep14, i8 0, i64 60, i32 4, i1 false)
  store i32 2, i32* %dim13, align 4, !tbaa !0
  call void @msum_i4(%struct.gfc_array_i4* %retarray, %struct.gfc_array_i4* %array, i32* %dim13)
  ret i32 0
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) nounwind

!0 = metadata !{metadata !"int", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
!3 = metadata !{metadata !"any pointer", metadata !1}
