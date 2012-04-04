; ModuleID = '/home/david/src/c-semantics/tests/unitTests/structsAndLoops.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.gfc_array_i4 = type { i32*, i32, [7 x %struct.descriptor_dimension] }
%struct.descriptor_dimension = type { i32, i32, i32 }

@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@main.rdata = private unnamed_addr constant [3 x i32] [i32 1, i32 2, i32 3], align 4
@main.adata = private unnamed_addr constant [9 x i32] [i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13], align 16

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
  %0 = load i32** %pdim.addr, align 8
  %1 = load i32* %0, align 4
  %sub = sub nsw i32 %1, 1
  store i32 %sub, i32* %dim, align 4
  %2 = load i32* %dim, align 4
  %idxprom = sext i32 %2 to i64
  %3 = load %struct.gfc_array_i4** %array.addr, align 8
  %dim1 = getelementptr inbounds %struct.gfc_array_i4* %3, i32 0, i32 2
  %arrayidx = getelementptr inbounds [7 x %struct.descriptor_dimension]* %dim1, i32 0, i64 %idxprom
  %ubound = getelementptr inbounds %struct.descriptor_dimension* %arrayidx, i32 0, i32 2
  %4 = load i32* %ubound, align 4
  %add = add nsw i32 %4, 1
  %5 = load i32* %dim, align 4
  %idxprom2 = sext i32 %5 to i64
  %6 = load %struct.gfc_array_i4** %array.addr, align 8
  %dim3 = getelementptr inbounds %struct.gfc_array_i4* %6, i32 0, i32 2
  %arrayidx4 = getelementptr inbounds [7 x %struct.descriptor_dimension]* %dim3, i32 0, i64 %idxprom2
  %lbound = getelementptr inbounds %struct.descriptor_dimension* %arrayidx4, i32 0, i32 1
  %7 = load i32* %lbound, align 4
  %sub5 = sub nsw i32 %add, %7
  store i32 %sub5, i32* %len, align 4
  store i32 0, i32* %n, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %8 = load i32* %n, align 4
  %9 = load i32* %dim, align 4
  %cmp = icmp slt i32 %8, %9
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %10 = load i32* %n, align 4
  %idxprom6 = sext i32 %10 to i64
  %11 = load %struct.gfc_array_i4** %array.addr, align 8
  %dim7 = getelementptr inbounds %struct.gfc_array_i4* %11, i32 0, i32 2
  %arrayidx8 = getelementptr inbounds [7 x %struct.descriptor_dimension]* %dim7, i32 0, i64 %idxprom6
  %ubound9 = getelementptr inbounds %struct.descriptor_dimension* %arrayidx8, i32 0, i32 2
  %12 = load i32* %ubound9, align 4
  %add10 = add nsw i32 %12, 1
  %13 = load i32* %n, align 4
  %idxprom11 = sext i32 %13 to i64
  %14 = load %struct.gfc_array_i4** %array.addr, align 8
  %dim12 = getelementptr inbounds %struct.gfc_array_i4* %14, i32 0, i32 2
  %arrayidx13 = getelementptr inbounds [7 x %struct.descriptor_dimension]* %dim12, i32 0, i64 %idxprom11
  %lbound14 = getelementptr inbounds %struct.descriptor_dimension* %arrayidx13, i32 0, i32 1
  %15 = load i32* %lbound14, align 4
  %sub15 = sub nsw i32 %add10, %15
  %16 = load i32* %n, align 4
  %idxprom16 = sext i32 %16 to i64
  %arrayidx17 = getelementptr inbounds [7 x i32]* %extent, i32 0, i64 %idxprom16
  store i32 %sub15, i32* %arrayidx17, align 4
  %17 = load i32* %n, align 4
  %idxprom18 = sext i32 %17 to i64
  %arrayidx19 = getelementptr inbounds [7 x i32]* %count, i32 0, i64 %idxprom18
  store i32 0, i32* %arrayidx19, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %18 = load i32* %n, align 4
  %inc = add nsw i32 %18, 1
  store i32 %inc, i32* %n, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %19 = load %struct.gfc_array_i4** %retarray.addr, align 8
  %data = getelementptr inbounds %struct.gfc_array_i4* %19, i32 0, i32 0
  %20 = load i32** %data, align 8
  store i32* %20, i32** %dest, align 8
  %21 = load %struct.gfc_array_i4** %array.addr, align 8
  %data20 = getelementptr inbounds %struct.gfc_array_i4* %21, i32 0, i32 0
  %22 = load i32** %data20, align 8
  store i32* %22, i32** %base, align 8
  %23 = load i32** %dest, align 8
  %24 = load i32* %23, align 4
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %24)
  br label %do.body

do.body:                                          ; preds = %do.cond, %for.end
  store i32 0, i32* %result, align 4
  store i32 0, i32* %n, align 4
  br label %for.cond21

for.cond21:                                       ; preds = %for.inc25, %do.body
  %25 = load i32* %n, align 4
  %26 = load i32* %len, align 4
  %cmp22 = icmp slt i32 %25, %26
  br i1 %cmp22, label %for.body23, label %for.end27

for.body23:                                       ; preds = %for.cond21
  %27 = load i32** %base, align 8
  %28 = load i32* %27, align 4
  %29 = load i32* %result, align 4
  %add24 = add nsw i32 %29, %28
  store i32 %add24, i32* %result, align 4
  br label %for.inc25

for.inc25:                                        ; preds = %for.body23
  %30 = load i32* %n, align 4
  %inc26 = add nsw i32 %30, 1
  store i32 %inc26, i32* %n, align 4
  %31 = load i32** %base, align 8
  %incdec.ptr = getelementptr inbounds i32* %31, i32 1
  store i32* %incdec.ptr, i32** %base, align 8
  br label %for.cond21

for.end27:                                        ; preds = %for.cond21
  %32 = load i32* %result, align 4
  %33 = load i32** %dest, align 8
  store i32 %32, i32* %33, align 4
  %arrayidx28 = getelementptr inbounds [7 x i32]* %count, i32 0, i64 0
  %34 = load i32* %arrayidx28, align 4
  %inc29 = add nsw i32 %34, 1
  store i32 %inc29, i32* %arrayidx28, align 4
  %35 = load i32** %dest, align 8
  %add.ptr = getelementptr inbounds i32* %35, i64 1
  store i32* %add.ptr, i32** %dest, align 8
  br label %do.cond

do.cond:                                          ; preds = %for.end27
  %arrayidx30 = getelementptr inbounds [7 x i32]* %count, i32 0, i64 0
  %36 = load i32* %arrayidx30, align 4
  %arrayidx31 = getelementptr inbounds [7 x i32]* %extent, i32 0, i64 0
  %37 = load i32* %arrayidx31, align 4
  %cmp32 = icmp ne i32 %36, %37
  br i1 %cmp32, label %do.body, label %do.end

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
  %dim13 = alloca i32, align 4
  store i32 0, i32* %retval
  %0 = bitcast [3 x i32]* %rdata to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %0, i8* bitcast ([3 x i32]* @main.rdata to i8*), i64 12, i32 4, i1 false)
  %1 = bitcast [9 x i32]* %adata to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %1, i8* bitcast ([9 x i32]* @main.adata to i8*), i64 36, i32 16, i1 false)
  %2 = bitcast %struct.gfc_array_i4* %retarray to i8*
  call void @llvm.memset.p0i8.i64(i8* %2, i8 0, i64 96, i32 8, i1 false)
  %data = getelementptr inbounds %struct.gfc_array_i4* %retarray, i32 0, i32 0
  %arraydecay = getelementptr inbounds [3 x i32]* %rdata, i32 0, i32 0
  store i32* %arraydecay, i32** %data, align 8
  %dtype = getelementptr inbounds %struct.gfc_array_i4* %retarray, i32 0, i32 1
  store i32 265, i32* %dtype, align 4
  %dim = getelementptr inbounds %struct.gfc_array_i4* %retarray, i32 0, i32 2
  %arrayinit.begin = getelementptr inbounds [7 x %struct.descriptor_dimension]* %dim, i64 0, i64 0
  %stride = getelementptr inbounds %struct.descriptor_dimension* %arrayinit.begin, i32 0, i32 0
  store i32 1, i32* %stride, align 4
  %lbound = getelementptr inbounds %struct.descriptor_dimension* %arrayinit.begin, i32 0, i32 1
  store i32 1, i32* %lbound, align 4
  %ubound = getelementptr inbounds %struct.descriptor_dimension* %arrayinit.begin, i32 0, i32 2
  store i32 3, i32* %ubound, align 4
  %data1 = getelementptr inbounds %struct.gfc_array_i4* %array, i32 0, i32 0
  %arraydecay2 = getelementptr inbounds [9 x i32]* %adata, i32 0, i32 0
  store i32* %arraydecay2, i32** %data1, align 8
  %dtype3 = getelementptr inbounds %struct.gfc_array_i4* %array, i32 0, i32 1
  store i32 266, i32* %dtype3, align 4
  %dim4 = getelementptr inbounds %struct.gfc_array_i4* %array, i32 0, i32 2
  %arrayinit.begin5 = getelementptr inbounds [7 x %struct.descriptor_dimension]* %dim4, i64 0, i64 0
  %stride6 = getelementptr inbounds %struct.descriptor_dimension* %arrayinit.begin5, i32 0, i32 0
  store i32 1, i32* %stride6, align 4
  %lbound7 = getelementptr inbounds %struct.descriptor_dimension* %arrayinit.begin5, i32 0, i32 1
  store i32 1, i32* %lbound7, align 4
  %ubound8 = getelementptr inbounds %struct.descriptor_dimension* %arrayinit.begin5, i32 0, i32 2
  store i32 3, i32* %ubound8, align 4
  %arrayinit.element = getelementptr inbounds %struct.descriptor_dimension* %arrayinit.begin5, i64 1
  %stride9 = getelementptr inbounds %struct.descriptor_dimension* %arrayinit.element, i32 0, i32 0
  store i32 3, i32* %stride9, align 4
  %lbound10 = getelementptr inbounds %struct.descriptor_dimension* %arrayinit.element, i32 0, i32 1
  store i32 1, i32* %lbound10, align 4
  %ubound11 = getelementptr inbounds %struct.descriptor_dimension* %arrayinit.element, i32 0, i32 2
  store i32 3, i32* %ubound11, align 4
  %arrayinit.start = getelementptr inbounds %struct.descriptor_dimension* %arrayinit.element, i64 1
  %arrayinit.end = getelementptr inbounds %struct.descriptor_dimension* %arrayinit.begin5, i64 7
  br label %arrayinit.body

arrayinit.body:                                   ; preds = %arrayinit.body, %entry
  %arrayinit.cur = phi %struct.descriptor_dimension* [ %arrayinit.start, %entry ], [ %arrayinit.next, %arrayinit.body ]
  %3 = bitcast %struct.descriptor_dimension* %arrayinit.cur to i8*
  call void @llvm.memset.p0i8.i64(i8* %3, i8 0, i64 12, i32 4, i1 false)
  %arrayinit.next = getelementptr inbounds %struct.descriptor_dimension* %arrayinit.cur, i64 1
  %arrayinit.done = icmp eq %struct.descriptor_dimension* %arrayinit.next, %arrayinit.end
  br i1 %arrayinit.done, label %arrayinit.end12, label %arrayinit.body

arrayinit.end12:                                  ; preds = %arrayinit.body
  store i32 2, i32* %dim13, align 4
  call void @msum_i4(%struct.gfc_array_i4* %retarray, %struct.gfc_array_i4* %array, i32* %dim13)
  ret i32 0
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) nounwind
