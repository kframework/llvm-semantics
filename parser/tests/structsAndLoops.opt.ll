; ModuleID = '/home/grosu/celliso2/c-semantics/tests/unitTests/structsAndLoops.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.descriptor_dimension = type { i32, i32, i32 }
%struct.gfc_array_i4 = type { i32*, i32, [7 x %struct.descriptor_dimension] }

@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@main.rdata = internal unnamed_addr constant [3 x i32] [i32 1, i32 2, i32 3], align 4
@main.adata = internal unnamed_addr constant [9 x i32] [i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13], align 16

define void @msum_i4(%struct.gfc_array_i4* %retarray, %struct.gfc_array_i4* %array, i32* nocapture %pdim) nounwind uwtable {
entry:
  %count = alloca [7 x i32], align 16
  %extent = alloca [7 x i32], align 16
  %tmp1 = load i32* %pdim, align 4
  %sub = add nsw i32 %tmp1, -1
  %idxprom = sext i32 %sub to i64
  %ubound = getelementptr inbounds %struct.gfc_array_i4* %array, i64 0, i32 2, i64 %idxprom, i32 2
  %tmp5 = load i32* %ubound, align 4
  %lbound = getelementptr inbounds %struct.gfc_array_i4* %array, i64 0, i32 2, i64 %idxprom, i32 1
  %tmp11 = load i32* %lbound, align 4
  %add = add i32 %tmp5, 1
  %sub12 = sub i32 %add, %tmp11
  %cmp11 = icmp sgt i32 %sub, 0
  br i1 %cmp11, label %for.body.lr.ph, label %for.end

for.body.lr.ph:                                   ; preds = %entry
  %count39 = bitcast [7 x i32]* %count to i8*
  %tmp31 = zext i32 %sub to i64
  %tmp40 = add i32 %tmp1, -2
  %tmp41 = zext i32 %tmp40 to i64
  %tmp43 = shl nuw nsw i64 %tmp41, 2
  %tmp45 = add i64 %tmp43, 4
  call void @llvm.memset.p0i8.i64(i8* %count39, i8 0, i64 %tmp45, i32 16, i1 false)
  br label %for.body

for.body:                                         ; preds = %for.body, %for.body.lr.ph
  %indvar27 = phi i64 [ 0, %for.body.lr.ph ], [ %indvar.next28, %for.body ]
  %arrayidx33 = getelementptr [7 x i32]* %extent, i64 0, i64 %indvar27
  %lbound28 = getelementptr %struct.gfc_array_i4* %array, i64 0, i32 2, i64 %indvar27, i32 1
  %ubound20 = getelementptr %struct.gfc_array_i4* %array, i64 0, i32 2, i64 %indvar27, i32 2
  %tmp21 = load i32* %ubound20, align 4
  %tmp29 = load i32* %lbound28, align 4
  %add22 = add i32 %tmp21, 1
  %sub30 = sub i32 %add22, %tmp29
  store i32 %sub30, i32* %arrayidx33, align 4
  %indvar.next28 = add i64 %indvar27, 1
  %exitcond32 = icmp eq i64 %indvar.next28, %tmp31
  br i1 %exitcond32, label %for.end, label %for.body

for.end:                                          ; preds = %for.body, %entry
  %data = getelementptr inbounds %struct.gfc_array_i4* %retarray, i64 0, i32 0
  %tmp39 = load i32** %data, align 8
  %data41 = getelementptr inbounds %struct.gfc_array_i4* %array, i64 0, i32 0
  %tmp42 = load i32** %data41, align 8
  %tmp44 = load i32* %tmp39, align 4
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 %tmp44) nounwind
  %cmp496 = icmp sgt i32 %sub12, 0
  %arrayidx62 = getelementptr inbounds [7 x i32]* %count, i64 0, i64 0
  %arrayidx68 = getelementptr inbounds [7 x i32]* %extent, i64 0, i64 0
  br i1 %cmp496, label %for.end.split.us, label %for.end59

for.end.split.us:                                 ; preds = %for.end
  %tmp = sub i32 %tmp5, %tmp11
  %tmp13 = zext i32 %tmp to i64
  %tmp14 = add i64 %tmp13, 1
  %tmp17 = zext i32 %sub12 to i64
  br label %for.body50.lr.ph.us

for.end59.us:                                     ; preds = %for.body50.us
  %scevgep = getelementptr i32* %incdec.ptr2.us, i64 %tmp14
  store i32 %add54.us, i32* %add.ptr1.us, align 4
  %tmp63.us = load i32* %arrayidx62, align 16
  %inc64.us = add nsw i32 %tmp63.us, 1
  store i32 %inc64.us, i32* %arrayidx62, align 16
  %tmp69.us = load i32* %arrayidx68, align 16
  %cmp70.us = icmp eq i32 %inc64.us, %tmp69.us
  %indvar.next22 = add i64 %indvar21, 1
  br i1 %cmp70.us, label %do.end, label %for.body50.lr.ph.us

for.body50.us:                                    ; preds = %for.body50.us, %for.body50.lr.ph.us
  %indvar = phi i64 [ 0, %for.body50.lr.ph.us ], [ %indvar.next, %for.body50.us ]
  %tmp6057.us = phi i32 [ 0, %for.body50.lr.ph.us ], [ %add54.us, %for.body50.us ]
  %incdec.ptr39.us = getelementptr i32* %incdec.ptr2.us, i64 %indvar
  %tmp52.us = load i32* %incdec.ptr39.us, align 4
  %add54.us = add nsw i32 %tmp52.us, %tmp6057.us
  %indvar.next = add i64 %indvar, 1
  %exitcond = icmp eq i64 %indvar.next, %tmp17
  br i1 %exitcond, label %for.end59.us, label %for.body50.us

for.body50.lr.ph.us:                              ; preds = %for.end.split.us, %for.end59.us
  %indvar21 = phi i64 [ %indvar.next22, %for.end59.us ], [ 0, %for.end.split.us ]
  %incdec.ptr2.us = phi i32* [ %scevgep, %for.end59.us ], [ %tmp42, %for.end.split.us ]
  %add.ptr1.us = getelementptr i32* %tmp39, i64 %indvar21
  br label %for.body50.us

for.end59:                                        ; preds = %for.end, %for.end59
  %indvar24 = phi i64 [ %indvar.next25, %for.end59 ], [ 0, %for.end ]
  %add.ptr1 = getelementptr i32* %tmp39, i64 %indvar24
  store i32 0, i32* %add.ptr1, align 4
  %tmp63 = load i32* %arrayidx62, align 16
  %inc64 = add nsw i32 %tmp63, 1
  store i32 %inc64, i32* %arrayidx62, align 16
  %tmp69 = load i32* %arrayidx68, align 16
  %cmp70 = icmp eq i32 %inc64, %tmp69
  %indvar.next25 = add i64 %indvar24, 1
  br i1 %cmp70, label %do.end, label %for.end59

do.end:                                           ; preds = %for.end59, %for.end59.us
  ret void
}

declare i32 @printf(i8* nocapture, ...) nounwind

define i32 @main() nounwind uwtable {
entry:
  %rdata = alloca [3 x i32], align 4
  %adata = alloca [9 x i32], align 16
  %retarray = alloca %struct.gfc_array_i4, align 8
  %array = alloca %struct.gfc_array_i4, align 8
  %dim28 = alloca i32, align 4
  %tmp = bitcast [3 x i32]* %rdata to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp, i8* bitcast ([3 x i32]* @main.rdata to i8*), i64 12, i32 4, i1 false)
  %tmp2 = bitcast [9 x i32]* %adata to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp2, i8* bitcast ([9 x i32]* @main.adata to i8*), i64 36, i32 16, i1 false)
  %0 = bitcast %struct.gfc_array_i4* %retarray to i8*
  call void @llvm.memset.p0i8.i64(i8* %0, i8 0, i64 96, i32 8, i1 false)
  %data = getelementptr inbounds %struct.gfc_array_i4* %retarray, i64 0, i32 0
  %arraydecay = getelementptr inbounds [3 x i32]* %rdata, i64 0, i64 0
  store i32* %arraydecay, i32** %data, align 8
  %dtype = getelementptr inbounds %struct.gfc_array_i4* %retarray, i64 0, i32 1
  store i32 265, i32* %dtype, align 8
  %stride = getelementptr inbounds %struct.gfc_array_i4* %retarray, i64 0, i32 2, i64 0, i32 0
  store i32 1, i32* %stride, align 4
  %lbound = getelementptr inbounds %struct.gfc_array_i4* %retarray, i64 0, i32 2, i64 0, i32 1
  store i32 1, i32* %lbound, align 4
  %ubound = getelementptr inbounds %struct.gfc_array_i4* %retarray, i64 0, i32 2, i64 0, i32 2
  store i32 3, i32* %ubound, align 4
  %data5 = getelementptr inbounds %struct.gfc_array_i4* %array, i64 0, i32 0
  %arraydecay6 = getelementptr inbounds [9 x i32]* %adata, i64 0, i64 0
  store i32* %arraydecay6, i32** %data5, align 8
  %dtype7 = getelementptr inbounds %struct.gfc_array_i4* %array, i64 0, i32 1
  store i32 266, i32* %dtype7, align 8
  %stride10 = getelementptr inbounds %struct.gfc_array_i4* %array, i64 0, i32 2, i64 0, i32 0
  store i32 1, i32* %stride10, align 4
  %lbound11 = getelementptr inbounds %struct.gfc_array_i4* %array, i64 0, i32 2, i64 0, i32 1
  store i32 1, i32* %lbound11, align 4
  %ubound12 = getelementptr inbounds %struct.gfc_array_i4* %array, i64 0, i32 2, i64 0, i32 2
  store i32 3, i32* %ubound12, align 4
  %stride14 = getelementptr inbounds %struct.gfc_array_i4* %array, i64 0, i32 2, i64 1, i32 0
  store i32 3, i32* %stride14, align 4
  %lbound15 = getelementptr inbounds %struct.gfc_array_i4* %array, i64 0, i32 2, i64 1, i32 1
  store i32 1, i32* %lbound15, align 4
  %ubound16 = getelementptr inbounds %struct.gfc_array_i4* %array, i64 0, i32 2, i64 1, i32 2
  store i32 3, i32* %ubound16, align 4
  %.array17 = getelementptr inbounds %struct.gfc_array_i4* %array, i64 0, i32 2, i64 2
  %1 = bitcast %struct.descriptor_dimension* %.array17 to i8*
  call void @llvm.memset.p0i8.i64(i8* %1, i8 0, i64 60, i32 4, i1 false)
  store i32 2, i32* %dim28, align 4
  call void @msum_i4(%struct.gfc_array_i4* %retarray, %struct.gfc_array_i4* %array, i32* %dim28)
  ret i32 0
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) nounwind
