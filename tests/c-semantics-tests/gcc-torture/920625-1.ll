; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/920625-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.point = type { double, double }
%struct.ipoint = type { i32, i32 }
%struct.__va_list_tag = type { i32, i32, i8*, i8* }

@pts = global [4 x %struct.point] [%struct.point { double 1.000000e+00, double 2.000000e+00 }, %struct.point { double 3.000000e+00, double 4.000000e+00 }, %struct.point { double 5.000000e+00, double 6.000000e+00 }, %struct.point { double 7.000000e+00, double 8.000000e+00 }], align 16
@ipts = global [4 x %struct.ipoint] [%struct.ipoint { i32 1, i32 2 }, %struct.ipoint { i32 3, i32 4 }, %struct.ipoint { i32 5, i32 6 }, %struct.ipoint { i32 7, i32 8 }], align 16

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  %0 = load double* getelementptr ({ double, double }* bitcast ([4 x %struct.point]* @pts to { double, double }*), i32 0, i32 0), align 1
  %1 = load double* getelementptr ({ double, double }* bitcast ([4 x %struct.point]* @pts to { double, double }*), i32 0, i32 1), align 1
  %2 = load double* getelementptr ({ double, double }* bitcast (%struct.point* getelementptr inbounds ([4 x %struct.point]* @pts, i32 0, i64 1) to { double, double }*), i32 0, i32 0), align 1
  %3 = load double* getelementptr ({ double, double }* bitcast (%struct.point* getelementptr inbounds ([4 x %struct.point]* @pts, i32 0, i64 1) to { double, double }*), i32 0, i32 1), align 1
  %4 = load double* getelementptr ({ double, double }* bitcast (%struct.point* getelementptr inbounds ([4 x %struct.point]* @pts, i32 0, i64 2) to { double, double }*), i32 0, i32 0), align 1
  %5 = load double* getelementptr ({ double, double }* bitcast (%struct.point* getelementptr inbounds ([4 x %struct.point]* @pts, i32 0, i64 2) to { double, double }*), i32 0, i32 1), align 1
  %6 = load double* getelementptr ({ double, double }* bitcast (%struct.point* getelementptr inbounds ([4 x %struct.point]* @pts, i32 0, i64 3) to { double, double }*), i32 0, i32 0), align 1
  %7 = load double* getelementptr ({ double, double }* bitcast (%struct.point* getelementptr inbounds ([4 x %struct.point]* @pts, i32 0, i64 3) to { double, double }*), i32 0, i32 1), align 1
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
  %tmp = alloca { double, double }
  store i32 %nargs, i32* %nargs.addr, align 4
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %args, i32 0, i32 0
  %arraydecay1 = bitcast %struct.__va_list_tag* %arraydecay to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32* %i, align 4
  %1 = load i32* %nargs.addr, align 4
  %cmp = icmp slt i32 %0, %1
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %arraydecay2 = getelementptr inbounds [1 x %struct.__va_list_tag]* %args, i32 0, i32 0
  %fp_offset_p = getelementptr inbounds %struct.__va_list_tag* %arraydecay2, i32 0, i32 1
  %fp_offset = load i32* %fp_offset_p
  %fits_in_fp = icmp ule i32 %fp_offset, 144
  br i1 %fits_in_fp, label %vaarg.in_reg, label %vaarg.in_mem

vaarg.in_reg:                                     ; preds = %for.body
  %2 = getelementptr inbounds %struct.__va_list_tag* %arraydecay2, i32 0, i32 3
  %reg_save_area = load i8** %2
  %3 = getelementptr i8* %reg_save_area, i32 %fp_offset
  %4 = getelementptr i8* %3, i32 16
  %5 = bitcast i8* %3 to double*
  %6 = load double* %5
  %7 = getelementptr inbounds { double, double }* %tmp, i32 0, i32 0
  store double %6, double* %7
  %8 = bitcast i8* %4 to double*
  %9 = load double* %8
  %10 = getelementptr inbounds { double, double }* %tmp, i32 0, i32 1
  store double %9, double* %10
  %11 = bitcast { double, double }* %tmp to %struct.point*
  %12 = add i32 %fp_offset, 32
  store i32 %12, i32* %fp_offset_p
  br label %vaarg.end

vaarg.in_mem:                                     ; preds = %for.body
  %overflow_arg_area_p = getelementptr inbounds %struct.__va_list_tag* %arraydecay2, i32 0, i32 2
  %overflow_arg_area = load i8** %overflow_arg_area_p
  %13 = bitcast i8* %overflow_arg_area to %struct.point*
  %overflow_arg_area.next = getelementptr i8* %overflow_arg_area, i32 16
  store i8* %overflow_arg_area.next, i8** %overflow_arg_area_p
  br label %vaarg.end

vaarg.end:                                        ; preds = %vaarg.in_mem, %vaarg.in_reg
  %vaarg.addr = phi %struct.point* [ %11, %vaarg.in_reg ], [ %13, %vaarg.in_mem ]
  %14 = bitcast %struct.point* %pi to i8*
  %15 = bitcast %struct.point* %vaarg.addr to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %14, i8* %15, i64 16, i32 8, i1 false)
  %16 = load i32* %i, align 4
  %idxprom = sext i32 %16 to i64
  %arrayidx = getelementptr inbounds [4 x %struct.point]* @pts, i32 0, i64 %idxprom
  %x = getelementptr inbounds %struct.point* %arrayidx, i32 0, i32 0
  %17 = load double* %x, align 8
  %x3 = getelementptr inbounds %struct.point* %pi, i32 0, i32 0
  %18 = load double* %x3, align 8
  %cmp4 = fcmp une double %17, %18
  br i1 %cmp4, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %vaarg.end
  %19 = load i32* %i, align 4
  %idxprom5 = sext i32 %19 to i64
  %arrayidx6 = getelementptr inbounds [4 x %struct.point]* @pts, i32 0, i64 %idxprom5
  %y = getelementptr inbounds %struct.point* %arrayidx6, i32 0, i32 1
  %20 = load double* %y, align 8
  %y7 = getelementptr inbounds %struct.point* %pi, i32 0, i32 1
  %21 = load double* %y7, align 8
  %cmp8 = fcmp une double %20, %21
  br i1 %cmp8, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %vaarg.end
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %lor.lhs.false
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %22 = load i32* %i, align 4
  %inc = add nsw i32 %22, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %arraydecay9 = getelementptr inbounds [1 x %struct.__va_list_tag]* %args, i32 0, i32 0
  %arraydecay910 = bitcast %struct.__va_list_tag* %arraydecay9 to i8*
  call void @llvm.va_end(i8* %arraydecay910)
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
  %0 = load i32* %i, align 4
  %1 = load i32* %nargs.addr, align 4
  %cmp = icmp slt i32 %0, %1
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %arraydecay2 = getelementptr inbounds [1 x %struct.__va_list_tag]* %args, i32 0, i32 0
  %gp_offset_p = getelementptr inbounds %struct.__va_list_tag* %arraydecay2, i32 0, i32 0
  %gp_offset = load i32* %gp_offset_p
  %fits_in_gp = icmp ule i32 %gp_offset, 40
  br i1 %fits_in_gp, label %vaarg.in_reg, label %vaarg.in_mem

vaarg.in_reg:                                     ; preds = %for.body
  %2 = getelementptr inbounds %struct.__va_list_tag* %arraydecay2, i32 0, i32 3
  %reg_save_area = load i8** %2
  %3 = getelementptr i8* %reg_save_area, i32 %gp_offset
  %4 = bitcast i8* %3 to %struct.ipoint*
  %5 = add i32 %gp_offset, 8
  store i32 %5, i32* %gp_offset_p
  br label %vaarg.end

vaarg.in_mem:                                     ; preds = %for.body
  %overflow_arg_area_p = getelementptr inbounds %struct.__va_list_tag* %arraydecay2, i32 0, i32 2
  %overflow_arg_area = load i8** %overflow_arg_area_p
  %6 = bitcast i8* %overflow_arg_area to %struct.ipoint*
  %overflow_arg_area.next = getelementptr i8* %overflow_arg_area, i32 8
  store i8* %overflow_arg_area.next, i8** %overflow_arg_area_p
  br label %vaarg.end

vaarg.end:                                        ; preds = %vaarg.in_mem, %vaarg.in_reg
  %vaarg.addr = phi %struct.ipoint* [ %4, %vaarg.in_reg ], [ %6, %vaarg.in_mem ]
  %7 = bitcast %struct.ipoint* %pi to i8*
  %8 = bitcast %struct.ipoint* %vaarg.addr to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %7, i8* %8, i64 8, i32 4, i1 false)
  %9 = load i32* %i, align 4
  %idxprom = sext i32 %9 to i64
  %arrayidx = getelementptr inbounds [4 x %struct.ipoint]* @ipts, i32 0, i64 %idxprom
  %x = getelementptr inbounds %struct.ipoint* %arrayidx, i32 0, i32 0
  %10 = load i32* %x, align 4
  %x3 = getelementptr inbounds %struct.ipoint* %pi, i32 0, i32 0
  %11 = load i32* %x3, align 4
  %cmp4 = icmp ne i32 %10, %11
  br i1 %cmp4, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %vaarg.end
  %12 = load i32* %i, align 4
  %idxprom5 = sext i32 %12 to i64
  %arrayidx6 = getelementptr inbounds [4 x %struct.ipoint]* @ipts, i32 0, i64 %idxprom5
  %y = getelementptr inbounds %struct.ipoint* %arrayidx6, i32 0, i32 1
  %13 = load i32* %y, align 4
  %y7 = getelementptr inbounds %struct.ipoint* %pi, i32 0, i32 1
  %14 = load i32* %y7, align 4
  %cmp8 = icmp ne i32 %13, %14
  br i1 %cmp8, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %vaarg.end
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %lor.lhs.false
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %15 = load i32* %i, align 4
  %inc = add nsw i32 %15, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %arraydecay9 = getelementptr inbounds [1 x %struct.__va_list_tag]* %args, i32 0, i32 0
  %arraydecay910 = bitcast %struct.__va_list_tag* %arraydecay9 to i8*
  call void @llvm.va_end(i8* %arraydecay910)
  ret i32 0
}

declare void @exit(i32) noreturn nounwind

declare void @llvm.va_start(i8*) nounwind

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

declare void @abort() noreturn nounwind

declare void @llvm.va_end(i8*) nounwind
