; ModuleID = '/home/grosu/celliso2/c-semantics/tests/unitTests/structsAndLoops.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.descriptor_dimension = type { i32, i32, i32 }
%struct.gfc_array_i4 = type { i32*, i32, [7 x %struct.descriptor_dimension] }

@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@main.rdata = internal unnamed_addr constant [3 x i32] [i32 1, i32 2, i32 3], align 4
@main.adata = internal unnamed_addr constant [9 x i32] [i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13], align 16

define void @msum_i4(%struct.gfc_array_i4* %retarray, %struct.gfc_array_i4* %array, i32* %pdim) nounwind uwtable {
entry:
  %retarray.addr = alloca %struct.gfc_array_i4*, align 8
  %array.addr = alloca %struct.gfc_array_i4*, align 8
  %pdim.addr = alloca i32*, align 8
  %count = alloca [7 x i32], align 16
  %extent = alloca [7 x i32], align 16
  %dest = alloca i32*, align 8
  %base = alloca i32*, align 8
  %dim = alloca i32, align 4
  %n = alloca i32, align 4
  %len = alloca i32, align 4
  %result = alloca i32, align 4
  store %struct.gfc_array_i4* %retarray, %struct.gfc_array_i4** %retarray.addr, align 8
  store %struct.gfc_array_i4* %array, %struct.gfc_array_i4** %array.addr, align 8
  store i32* %pdim, i32** %pdim.addr, align 8
  %tmp = load i32** %pdim.addr, align 8
  %tmp1 = load i32* %tmp
  %sub = sub nsw i32 %tmp1, 1
  store i32 %sub, i32* %dim, align 4
  %tmp2 = load i32* %dim, align 4
  %idxprom = sext i32 %tmp2 to i64
  %tmp3 = load %struct.gfc_array_i4** %array.addr, align 8
  %dim4 = getelementptr inbounds %struct.gfc_array_i4* %tmp3, i32 0, i32 2
  %arrayidx = getelementptr inbounds [7 x %struct.descriptor_dimension]* %dim4, i32 0, i64 %idxprom
  %ubound = getelementptr inbounds %struct.descriptor_dimension* %arrayidx, i32 0, i32 2
  %tmp5 = load i32* %ubound, align 4
  %add = add nsw i32 %tmp5, 1
  %tmp6 = load i32* %dim, align 4
  %idxprom7 = sext i32 %tmp6 to i64
  %tmp8 = load %struct.gfc_array_i4** %array.addr, align 8
  %dim9 = getelementptr inbounds %struct.gfc_array_i4* %tmp8, i32 0, i32 2
  %arrayidx10 = getelementptr inbounds [7 x %struct.descriptor_dimension]* %dim9, i32 0, i64 %idxprom7
  %lbound = getelementptr inbounds %struct.descriptor_dimension* %arrayidx10, i32 0, i32 1
  %tmp11 = load i32* %lbound, align 4
  %sub12 = sub nsw i32 %add, %tmp11
  store i32 %sub12, i32* %len, align 4
  store i32 0, i32* %n, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp13 = load i32* %n, align 4
  %tmp14 = load i32* %dim, align 4
  %cmp = icmp slt i32 %tmp13, %tmp14
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp15 = load i32* %n, align 4
  %idxprom16 = sext i32 %tmp15 to i64
  %tmp17 = load %struct.gfc_array_i4** %array.addr, align 8
  %dim18 = getelementptr inbounds %struct.gfc_array_i4* %tmp17, i32 0, i32 2
  %arrayidx19 = getelementptr inbounds [7 x %struct.descriptor_dimension]* %dim18, i32 0, i64 %idxprom16
  %ubound20 = getelementptr inbounds %struct.descriptor_dimension* %arrayidx19, i32 0, i32 2
  %tmp21 = load i32* %ubound20, align 4
  %add22 = add nsw i32 %tmp21, 1
  %tmp23 = load i32* %n, align 4
  %idxprom24 = sext i32 %tmp23 to i64
  %tmp25 = load %struct.gfc_array_i4** %array.addr, align 8
  %dim26 = getelementptr inbounds %struct.gfc_array_i4* %tmp25, i32 0, i32 2
  %arrayidx27 = getelementptr inbounds [7 x %struct.descriptor_dimension]* %dim26, i32 0, i64 %idxprom24
  %lbound28 = getelementptr inbounds %struct.descriptor_dimension* %arrayidx27, i32 0, i32 1
  %tmp29 = load i32* %lbound28, align 4
  %sub30 = sub nsw i32 %add22, %tmp29
  %tmp31 = load i32* %n, align 4
  %idxprom32 = sext i32 %tmp31 to i64
  %arrayidx33 = getelementptr inbounds [7 x i32]* %extent, i32 0, i64 %idxprom32
  store i32 %sub30, i32* %arrayidx33, align 4
  %tmp34 = load i32* %n, align 4
  %idxprom35 = sext i32 %tmp34 to i64
  %arrayidx36 = getelementptr inbounds [7 x i32]* %count, i32 0, i64 %idxprom35
  store i32 0, i32* %arrayidx36, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %tmp37 = load i32* %n, align 4
  %inc = add nsw i32 %tmp37, 1
  store i32 %inc, i32* %n, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %tmp38 = load %struct.gfc_array_i4** %retarray.addr, align 8
  %data = getelementptr inbounds %struct.gfc_array_i4* %tmp38, i32 0, i32 0
  %tmp39 = load i32** %data, align 8
  store i32* %tmp39, i32** %dest, align 8
  %tmp40 = load %struct.gfc_array_i4** %array.addr, align 8
  %data41 = getelementptr inbounds %struct.gfc_array_i4* %tmp40, i32 0, i32 0
  %tmp42 = load i32** %data41, align 8
  store i32* %tmp42, i32** %base, align 8
  %tmp43 = load i32** %dest, align 8
  %tmp44 = load i32* %tmp43
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %tmp44)
  br label %do.body

do.body:                                          ; preds = %do.cond, %for.end
  store i32 0, i32* %result, align 4
  store i32 0, i32* %n, align 4
  br label %for.cond46

for.cond46:                                       ; preds = %for.inc55, %do.body
  %tmp47 = load i32* %n, align 4
  %tmp48 = load i32* %len, align 4
  %cmp49 = icmp slt i32 %tmp47, %tmp48
  br i1 %cmp49, label %for.body50, label %for.end59

for.body50:                                       ; preds = %for.cond46
  %tmp51 = load i32** %base, align 8
  %tmp52 = load i32* %tmp51
  %tmp53 = load i32* %result, align 4
  %add54 = add nsw i32 %tmp53, %tmp52
  store i32 %add54, i32* %result, align 4
  br label %for.inc55

for.inc55:                                        ; preds = %for.body50
  %tmp56 = load i32* %n, align 4
  %inc57 = add nsw i32 %tmp56, 1
  store i32 %inc57, i32* %n, align 4
  %tmp58 = load i32** %base, align 8
  %incdec.ptr = getelementptr inbounds i32* %tmp58, i32 1
  store i32* %incdec.ptr, i32** %base, align 8
  br label %for.cond46

for.end59:                                        ; preds = %for.cond46
  %tmp60 = load i32* %result, align 4
  %tmp61 = load i32** %dest, align 8
  store i32 %tmp60, i32* %tmp61
  %arrayidx62 = getelementptr inbounds [7 x i32]* %count, i32 0, i64 0
  %tmp63 = load i32* %arrayidx62, align 4
  %inc64 = add nsw i32 %tmp63, 1
  store i32 %inc64, i32* %arrayidx62, align 4
  %tmp65 = load i32** %dest, align 8
  %add.ptr = getelementptr inbounds i32* %tmp65, i64 1
  store i32* %add.ptr, i32** %dest, align 8
  br label %do.cond

do.cond:                                          ; preds = %for.end59
  %arrayidx66 = getelementptr inbounds [7 x i32]* %count, i32 0, i64 0
  %tmp67 = load i32* %arrayidx66, align 4
  %arrayidx68 = getelementptr inbounds [7 x i32]* %extent, i32 0, i64 0
  %tmp69 = load i32* %arrayidx68, align 4
  %cmp70 = icmp ne i32 %tmp67, %tmp69
  br i1 %cmp70, label %do.body, label %do.end

do.end:                                           ; preds = %do.cond
  ret void
}

declare i32 @printf(i8*, ...)

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %rdata = alloca [3 x i32], align 4
  %adata = alloca [9 x i32], align 16
  %retarray = alloca %struct.gfc_array_i4, align 8
  %array = alloca %struct.gfc_array_i4, align 8
  %dim28 = alloca i32, align 4
  store i32 0, i32* %retval
  %tmp = bitcast [3 x i32]* %rdata to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp, i8* bitcast ([3 x i32]* @main.rdata to i8*), i64 12, i32 4, i1 false)
  %tmp2 = bitcast [9 x i32]* %adata to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp2, i8* bitcast ([9 x i32]* @main.adata to i8*), i64 36, i32 16, i1 false)
  %0 = bitcast %struct.gfc_array_i4* %retarray to i8*
  call void @llvm.memset.p0i8.i64(i8* %0, i8 0, i64 96, i32 8, i1 false)
  %data = getelementptr inbounds %struct.gfc_array_i4* %retarray, i32 0, i32 0
  %arraydecay = getelementptr inbounds [3 x i32]* %rdata, i32 0, i32 0
  store i32* %arraydecay, i32** %data, align 8
  %dtype = getelementptr inbounds %struct.gfc_array_i4* %retarray, i32 0, i32 1
  store i32 265, i32* %dtype, align 4
  %dim = getelementptr inbounds %struct.gfc_array_i4* %retarray, i32 0, i32 2
  %.array = getelementptr inbounds [7 x %struct.descriptor_dimension]* %dim, i32 0, i32 0
  %stride = getelementptr inbounds %struct.descriptor_dimension* %.array, i32 0, i32 0
  store i32 1, i32* %stride, align 4
  %lbound = getelementptr inbounds %struct.descriptor_dimension* %.array, i32 0, i32 1
  store i32 1, i32* %lbound, align 4
  %ubound = getelementptr inbounds %struct.descriptor_dimension* %.array, i32 0, i32 2
  store i32 3, i32* %ubound, align 4
  %data5 = getelementptr inbounds %struct.gfc_array_i4* %array, i32 0, i32 0
  %arraydecay6 = getelementptr inbounds [9 x i32]* %adata, i32 0, i32 0
  store i32* %arraydecay6, i32** %data5, align 8
  %dtype7 = getelementptr inbounds %struct.gfc_array_i4* %array, i32 0, i32 1
  store i32 266, i32* %dtype7, align 4
  %dim8 = getelementptr inbounds %struct.gfc_array_i4* %array, i32 0, i32 2
  %.array9 = getelementptr inbounds [7 x %struct.descriptor_dimension]* %dim8, i32 0, i32 0
  %stride10 = getelementptr inbounds %struct.descriptor_dimension* %.array9, i32 0, i32 0
  store i32 1, i32* %stride10, align 4
  %lbound11 = getelementptr inbounds %struct.descriptor_dimension* %.array9, i32 0, i32 1
  store i32 1, i32* %lbound11, align 4
  %ubound12 = getelementptr inbounds %struct.descriptor_dimension* %.array9, i32 0, i32 2
  store i32 3, i32* %ubound12, align 4
  %.array13 = getelementptr inbounds [7 x %struct.descriptor_dimension]* %dim8, i32 0, i32 1
  %stride14 = getelementptr inbounds %struct.descriptor_dimension* %.array13, i32 0, i32 0
  store i32 3, i32* %stride14, align 4
  %lbound15 = getelementptr inbounds %struct.descriptor_dimension* %.array13, i32 0, i32 1
  store i32 1, i32* %lbound15, align 4
  %ubound16 = getelementptr inbounds %struct.descriptor_dimension* %.array13, i32 0, i32 2
  store i32 3, i32* %ubound16, align 4
  %.array17 = getelementptr inbounds [7 x %struct.descriptor_dimension]* %dim8, i32 0, i32 2
  %tmp18 = bitcast %struct.descriptor_dimension* %.array17 to i8*
  call void @llvm.memset.p0i8.i64(i8* %tmp18, i8 0, i64 12, i32 4, i1 false)
  %.array19 = getelementptr inbounds [7 x %struct.descriptor_dimension]* %dim8, i32 0, i32 3
  %tmp20 = bitcast %struct.descriptor_dimension* %.array19 to i8*
  call void @llvm.memset.p0i8.i64(i8* %tmp20, i8 0, i64 12, i32 4, i1 false)
  %.array21 = getelementptr inbounds [7 x %struct.descriptor_dimension]* %dim8, i32 0, i32 4
  %tmp22 = bitcast %struct.descriptor_dimension* %.array21 to i8*
  call void @llvm.memset.p0i8.i64(i8* %tmp22, i8 0, i64 12, i32 4, i1 false)
  %.array23 = getelementptr inbounds [7 x %struct.descriptor_dimension]* %dim8, i32 0, i32 5
  %tmp24 = bitcast %struct.descriptor_dimension* %.array23 to i8*
  call void @llvm.memset.p0i8.i64(i8* %tmp24, i8 0, i64 12, i32 4, i1 false)
  %.array25 = getelementptr inbounds [7 x %struct.descriptor_dimension]* %dim8, i32 0, i32 6
  %tmp26 = bitcast %struct.descriptor_dimension* %.array25 to i8*
  call void @llvm.memset.p0i8.i64(i8* %tmp26, i8 0, i64 12, i32 4, i1 false)
  store i32 2, i32* %dim28, align 4
  call void @msum_i4(%struct.gfc_array_i4* %retarray, %struct.gfc_array_i4* %array, i32* %dim28)
  ret i32 0
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) nounwind
