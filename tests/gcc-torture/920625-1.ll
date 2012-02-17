; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/920625-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.__va_list_tag = type { i32, i32, i8*, i8* }
%struct.ipoint = type { i32, i32 }
%struct.point = type { double, double }

@pts = global [4 x %struct.point] [%struct.point { double 1.000000e+00, double 2.000000e+00 }, %struct.point { double 3.000000e+00, double 4.000000e+00 }, %struct.point { double 5.000000e+00, double 6.000000e+00 }, %struct.point { double 7.000000e+00, double 8.000000e+00 }], align 16
@ipts = global [4 x %struct.ipoint] [%struct.ipoint { i32 1, i32 2 }, %struct.ipoint { i32 3, i32 4 }, %struct.ipoint { i32 5, i32 6 }, %struct.ipoint { i32 7, i32 8 }], align 16

define i32 @gnu_dev_major(i64 %__dev) nounwind uwtable inlinehint {
entry:
  %__dev.addr = alloca i64, align 8
  store i64 %__dev, i64* %__dev.addr, align 8
  %tmp = load i64* %__dev.addr, align 8
  %shr = lshr i64 %tmp, 8
  %and = and i64 %shr, 4095
  %tmp1 = load i64* %__dev.addr, align 8
  %shr2 = lshr i64 %tmp1, 32
  %conv = trunc i64 %shr2 to i32
  %and3 = and i32 %conv, -4096
  %conv4 = zext i32 %and3 to i64
  %or = or i64 %and, %conv4
  %conv5 = trunc i64 %or to i32
  ret i32 %conv5
}

define i32 @gnu_dev_minor(i64 %__dev) nounwind uwtable inlinehint {
entry:
  %__dev.addr = alloca i64, align 8
  store i64 %__dev, i64* %__dev.addr, align 8
  %tmp = load i64* %__dev.addr, align 8
  %and = and i64 %tmp, 255
  %tmp1 = load i64* %__dev.addr, align 8
  %shr = lshr i64 %tmp1, 12
  %conv = trunc i64 %shr to i32
  %and2 = and i32 %conv, -256
  %conv3 = zext i32 %and2 to i64
  %or = or i64 %and, %conv3
  %conv4 = trunc i64 %or to i32
  ret i32 %conv4
}

define i64 @gnu_dev_makedev(i32 %__major, i32 %__minor) nounwind uwtable inlinehint {
entry:
  %__major.addr = alloca i32, align 4
  %__minor.addr = alloca i32, align 4
  store i32 %__major, i32* %__major.addr, align 4
  store i32 %__minor, i32* %__minor.addr, align 4
  %tmp = load i32* %__minor.addr, align 4
  %and = and i32 %tmp, 255
  %tmp1 = load i32* %__major.addr, align 4
  %and2 = and i32 %tmp1, 4095
  %shl = shl i32 %and2, 8
  %or = or i32 %and, %shl
  %conv = zext i32 %or to i64
  %tmp3 = load i32* %__minor.addr, align 4
  %and4 = and i32 %tmp3, -256
  %conv5 = zext i32 %and4 to i64
  %shl6 = shl i64 %conv5, 12
  %or7 = or i64 %conv, %shl6
  %tmp8 = load i32* %__major.addr, align 4
  %and9 = and i32 %tmp8, -4096
  %conv10 = zext i32 %and9 to i64
  %shl11 = shl i64 %conv10, 32
  %or12 = or i64 %or7, %shl11
  ret i64 %or12
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  %0 = load double* getelementptr inbounds ([4 x %struct.point]* @pts, i32 0, i64 0, i32 0), align 1
  %1 = load double* getelementptr inbounds ([4 x %struct.point]* @pts, i32 0, i64 0, i32 1), align 1
  %2 = load double* getelementptr inbounds ([4 x %struct.point]* @pts, i32 0, i64 1, i32 0), align 1
  %3 = load double* getelementptr inbounds ([4 x %struct.point]* @pts, i32 0, i64 1, i32 1), align 1
  %4 = load double* getelementptr inbounds ([4 x %struct.point]* @pts, i32 0, i64 2, i32 0), align 1
  %5 = load double* getelementptr inbounds ([4 x %struct.point]* @pts, i32 0, i64 2, i32 1), align 1
  %6 = load double* getelementptr inbounds ([4 x %struct.point]* @pts, i32 0, i64 3, i32 0), align 1
  %7 = load double* getelementptr inbounds ([4 x %struct.point]* @pts, i32 0, i64 3, i32 1), align 1
  %call = call i32 (i32, ...)* @va1(i32 4, double %0, double %1, double %2, double %3, double %4, double %5, double %6, double %7)
  %8 = load i64* bitcast ([4 x %struct.ipoint]* @ipts to i64*), align 1
  %9 = load i64* bitcast (%struct.ipoint* getelementptr inbounds ([4 x %struct.ipoint]* @ipts, i32 0, i64 1) to i64*), align 1
  %10 = load i64* bitcast (%struct.ipoint* getelementptr inbounds ([4 x %struct.ipoint]* @ipts, i32 0, i64 2) to i64*), align 1
  %11 = load i64* bitcast (%struct.ipoint* getelementptr inbounds ([4 x %struct.ipoint]* @ipts, i32 0, i64 3) to i64*), align 1
  %call1 = call i32 (i32, ...)* @va2(i32 4, i64 %8, i64 %9, i64 %10, i64 %11)
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %12 = load i32* %retval
  ret i32 %12
}

define internal i32 @va1(i32 %nargs, ...) nounwind uwtable {
entry:
  %nargs.addr = alloca i32, align 4
  %args = alloca [1 x %struct.__va_list_tag], align 16
  %i = alloca i32, align 4
  %pi = alloca %struct.point, align 8
  %tmp4 = alloca %struct.point
  store i32 %nargs, i32* %nargs.addr, align 4
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %args, i32 0, i32 0
  %arraydecay1 = bitcast %struct.__va_list_tag* %arraydecay to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp = load i32* %i, align 4
  %tmp2 = load i32* %nargs.addr, align 4
  %cmp = icmp slt i32 %tmp, %tmp2
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %arraydecay3 = getelementptr inbounds [1 x %struct.__va_list_tag]* %args, i32 0, i32 0
  %fp_offset_p = getelementptr inbounds %struct.__va_list_tag* %arraydecay3, i32 0, i32 1
  %fp_offset = load i32* %fp_offset_p
  %fits_in_fp = icmp ule i32 %fp_offset, 144
  br i1 %fits_in_fp, label %vaarg.in_reg, label %vaarg.in_mem

vaarg.in_reg:                                     ; preds = %for.body
  %0 = getelementptr inbounds %struct.__va_list_tag* %arraydecay3, i32 0, i32 3
  %reg_save_area = load i8** %0
  %1 = getelementptr i8* %reg_save_area, i32 %fp_offset
  %2 = getelementptr i8* %1, i32 16
  %3 = bitcast i8* %1 to double*
  %4 = load double* %3
  %5 = getelementptr inbounds %struct.point* %tmp4, i32 0, i32 0
  store double %4, double* %5
  %6 = bitcast i8* %2 to double*
  %7 = load double* %6
  %8 = getelementptr inbounds %struct.point* %tmp4, i32 0, i32 1
  store double %7, double* %8
  %9 = add i32 %fp_offset, 32
  store i32 %9, i32* %fp_offset_p
  br label %vaarg.end

vaarg.in_mem:                                     ; preds = %for.body
  %overflow_arg_area_p = getelementptr inbounds %struct.__va_list_tag* %arraydecay3, i32 0, i32 2
  %overflow_arg_area = load i8** %overflow_arg_area_p
  %10 = bitcast i8* %overflow_arg_area to %struct.point*
  %overflow_arg_area.next = getelementptr i8* %overflow_arg_area, i32 16
  store i8* %overflow_arg_area.next, i8** %overflow_arg_area_p
  br label %vaarg.end

vaarg.end:                                        ; preds = %vaarg.in_mem, %vaarg.in_reg
  %vaarg.addr = phi %struct.point* [ %tmp4, %vaarg.in_reg ], [ %10, %vaarg.in_mem ]
  %tmp5 = bitcast %struct.point* %pi to i8*
  %tmp6 = bitcast %struct.point* %vaarg.addr to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp5, i8* %tmp6, i64 16, i32 8, i1 false)
  %tmp7 = load i32* %i, align 4
  %idxprom = sext i32 %tmp7 to i64
  %arrayidx = getelementptr inbounds [4 x %struct.point]* @pts, i32 0, i64 %idxprom
  %x = getelementptr inbounds %struct.point* %arrayidx, i32 0, i32 0
  %tmp8 = load double* %x, align 8
  %x9 = getelementptr inbounds %struct.point* %pi, i32 0, i32 0
  %tmp10 = load double* %x9, align 8
  %cmp11 = fcmp une double %tmp8, %tmp10
  br i1 %cmp11, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %vaarg.end
  %tmp12 = load i32* %i, align 4
  %idxprom13 = sext i32 %tmp12 to i64
  %arrayidx14 = getelementptr inbounds [4 x %struct.point]* @pts, i32 0, i64 %idxprom13
  %y = getelementptr inbounds %struct.point* %arrayidx14, i32 0, i32 1
  %tmp15 = load double* %y, align 8
  %y16 = getelementptr inbounds %struct.point* %pi, i32 0, i32 1
  %tmp17 = load double* %y16, align 8
  %cmp18 = fcmp une double %tmp15, %tmp17
  br i1 %cmp18, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %vaarg.end
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %lor.lhs.false
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %tmp19 = load i32* %i, align 4
  %inc = add nsw i32 %tmp19, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %arraydecay20 = getelementptr inbounds [1 x %struct.__va_list_tag]* %args, i32 0, i32 0
  %arraydecay2021 = bitcast %struct.__va_list_tag* %arraydecay20 to i8*
  call void @llvm.va_end(i8* %arraydecay2021)
  ret i32 0
}

define internal i32 @va2(i32 %nargs, ...) nounwind uwtable {
entry:
  %nargs.addr = alloca i32, align 4
  %args = alloca [1 x %struct.__va_list_tag], align 16
  %i = alloca i32, align 4
  %pi = alloca %struct.ipoint, align 4
  store i32 %nargs, i32* %nargs.addr, align 4
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %args, i32 0, i32 0
  %arraydecay1 = bitcast %struct.__va_list_tag* %arraydecay to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp = load i32* %i, align 4
  %tmp2 = load i32* %nargs.addr, align 4
  %cmp = icmp slt i32 %tmp, %tmp2
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %arraydecay3 = getelementptr inbounds [1 x %struct.__va_list_tag]* %args, i32 0, i32 0
  %gp_offset_p = getelementptr inbounds %struct.__va_list_tag* %arraydecay3, i32 0, i32 0
  %gp_offset = load i32* %gp_offset_p
  %fits_in_gp = icmp ule i32 %gp_offset, 40
  br i1 %fits_in_gp, label %vaarg.in_reg, label %vaarg.in_mem

vaarg.in_reg:                                     ; preds = %for.body
  %0 = getelementptr inbounds %struct.__va_list_tag* %arraydecay3, i32 0, i32 3
  %reg_save_area = load i8** %0
  %1 = getelementptr i8* %reg_save_area, i32 %gp_offset
  %2 = bitcast i8* %1 to %struct.ipoint*
  %3 = add i32 %gp_offset, 8
  store i32 %3, i32* %gp_offset_p
  br label %vaarg.end

vaarg.in_mem:                                     ; preds = %for.body
  %overflow_arg_area_p = getelementptr inbounds %struct.__va_list_tag* %arraydecay3, i32 0, i32 2
  %overflow_arg_area = load i8** %overflow_arg_area_p
  %4 = bitcast i8* %overflow_arg_area to %struct.ipoint*
  %overflow_arg_area.next = getelementptr i8* %overflow_arg_area, i32 8
  store i8* %overflow_arg_area.next, i8** %overflow_arg_area_p
  br label %vaarg.end

vaarg.end:                                        ; preds = %vaarg.in_mem, %vaarg.in_reg
  %vaarg.addr = phi %struct.ipoint* [ %2, %vaarg.in_reg ], [ %4, %vaarg.in_mem ]
  %tmp4 = bitcast %struct.ipoint* %pi to i8*
  %tmp5 = bitcast %struct.ipoint* %vaarg.addr to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp4, i8* %tmp5, i64 8, i32 4, i1 false)
  %tmp6 = load i32* %i, align 4
  %idxprom = sext i32 %tmp6 to i64
  %arrayidx = getelementptr inbounds [4 x %struct.ipoint]* @ipts, i32 0, i64 %idxprom
  %x = getelementptr inbounds %struct.ipoint* %arrayidx, i32 0, i32 0
  %tmp7 = load i32* %x, align 4
  %x8 = getelementptr inbounds %struct.ipoint* %pi, i32 0, i32 0
  %tmp9 = load i32* %x8, align 4
  %cmp10 = icmp ne i32 %tmp7, %tmp9
  br i1 %cmp10, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %vaarg.end
  %tmp11 = load i32* %i, align 4
  %idxprom12 = sext i32 %tmp11 to i64
  %arrayidx13 = getelementptr inbounds [4 x %struct.ipoint]* @ipts, i32 0, i64 %idxprom12
  %y = getelementptr inbounds %struct.ipoint* %arrayidx13, i32 0, i32 1
  %tmp14 = load i32* %y, align 4
  %y15 = getelementptr inbounds %struct.ipoint* %pi, i32 0, i32 1
  %tmp16 = load i32* %y15, align 4
  %cmp17 = icmp ne i32 %tmp14, %tmp16
  br i1 %cmp17, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %vaarg.end
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %lor.lhs.false
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %tmp18 = load i32* %i, align 4
  %inc = add nsw i32 %tmp18, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %arraydecay19 = getelementptr inbounds [1 x %struct.__va_list_tag]* %args, i32 0, i32 0
  %arraydecay1920 = bitcast %struct.__va_list_tag* %arraydecay19 to i8*
  call void @llvm.va_end(i8* %arraydecay1920)
  ret i32 0
}

declare void @exit(i32) noreturn nounwind

declare void @llvm.va_start(i8*) nounwind

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

declare void @abort() noreturn nounwind

declare void @llvm.va_end(i8*) nounwind
