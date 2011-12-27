; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/920625-1.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.__va_list_tag = type { i32, i32, i8*, i8* }
%struct.ipoint = type { i32, i32 }
%struct.point = type { double, double }

@pts = global [4 x %struct.point] [%struct.point { double 1.000000e+00, double 2.000000e+00 }, %struct.point { double 3.000000e+00, double 4.000000e+00 }, %struct.point { double 5.000000e+00, double 6.000000e+00 }, %struct.point { double 7.000000e+00, double 8.000000e+00 }], align 16
@ipts = global [4 x %struct.ipoint] [%struct.ipoint { i32 1, i32 2 }, %struct.ipoint { i32 3, i32 4 }, %struct.ipoint { i32 5, i32 6 }, %struct.ipoint { i32 7, i32 8 }], align 16

define i32 @gnu_dev_major(i64 %__dev) nounwind uwtable readnone inlinehint {
entry:
  %shr = lshr i64 %__dev, 8
  %and = and i64 %shr, 4095
  %shr2 = lshr i64 %__dev, 32
  %and3 = and i64 %shr2, 4294963200
  %or = or i64 %and, %and3
  %conv5 = trunc i64 %or to i32
  ret i32 %conv5
}

define i32 @gnu_dev_minor(i64 %__dev) nounwind uwtable readnone inlinehint {
entry:
  %and = and i64 %__dev, 255
  %shr = lshr i64 %__dev, 12
  %and2 = and i64 %shr, 4294967040
  %or = or i64 %and2, %and
  %conv4 = trunc i64 %or to i32
  ret i32 %conv4
}

define i64 @gnu_dev_makedev(i32 %__major, i32 %__minor) nounwind uwtable readnone inlinehint {
entry:
  %and = and i32 %__minor, 255
  %and2 = shl i32 %__major, 8
  %shl = and i32 %and2, 1048320
  %or = or i32 %and, %shl
  %conv = zext i32 %or to i64
  %and4 = and i32 %__minor, -256
  %conv5 = zext i32 %and4 to i64
  %shl6 = shl nuw nsw i64 %conv5, 12
  %and9 = and i32 %__major, -4096
  %conv10 = zext i32 %and9 to i64
  %shl11 = shl nuw i64 %conv10, 32
  %or7 = or i64 %shl6, %shl11
  %or12 = or i64 %or7, %conv
  ret i64 %or12
}

define i32 @main() noreturn nounwind uwtable {
entry:
  %0 = load double* getelementptr inbounds ([4 x %struct.point]* @pts, i64 0, i64 0, i32 0), align 16
  %1 = load double* getelementptr inbounds ([4 x %struct.point]* @pts, i64 0, i64 0, i32 1), align 8
  %2 = load double* getelementptr inbounds ([4 x %struct.point]* @pts, i64 0, i64 1, i32 0), align 16
  %3 = load double* getelementptr inbounds ([4 x %struct.point]* @pts, i64 0, i64 1, i32 1), align 8
  %4 = load double* getelementptr inbounds ([4 x %struct.point]* @pts, i64 0, i64 2, i32 0), align 16
  %5 = load double* getelementptr inbounds ([4 x %struct.point]* @pts, i64 0, i64 2, i32 1), align 8
  %6 = load double* getelementptr inbounds ([4 x %struct.point]* @pts, i64 0, i64 3, i32 0), align 16
  %7 = load double* getelementptr inbounds ([4 x %struct.point]* @pts, i64 0, i64 3, i32 1), align 8
  tail call void (...)* @va1(double %0, double %1, double %2, double %3, double %4, double %5, double %6, double %7)
  %8 = load i64* bitcast ([4 x %struct.ipoint]* @ipts to i64*), align 16
  %9 = load i64* bitcast (%struct.ipoint* getelementptr inbounds ([4 x %struct.ipoint]* @ipts, i64 0, i64 1) to i64*), align 8
  %10 = load i64* bitcast (%struct.ipoint* getelementptr inbounds ([4 x %struct.ipoint]* @ipts, i64 0, i64 2) to i64*), align 16
  %11 = load i64* bitcast (%struct.ipoint* getelementptr inbounds ([4 x %struct.ipoint]* @ipts, i64 0, i64 3) to i64*), align 8
  tail call void (...)* @va2(i64 %8, i64 %9, i64 %10, i64 %11)
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

define internal void @va1(...) nounwind uwtable {
entry:
  %args = alloca [1 x %struct.__va_list_tag], align 16
  %tmp4 = alloca %struct.point, align 8
  %arraydecay1 = bitcast [1 x %struct.__va_list_tag]* %args to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %fp_offset_p = getelementptr inbounds [1 x %struct.__va_list_tag]* %args, i64 0, i64 0, i32 1
  %0 = getelementptr inbounds [1 x %struct.__va_list_tag]* %args, i64 0, i64 0, i32 3
  %1 = getelementptr inbounds %struct.point* %tmp4, i64 0, i32 0
  %2 = getelementptr inbounds %struct.point* %tmp4, i64 0, i32 1
  %overflow_arg_area_p = getelementptr inbounds [1 x %struct.__va_list_tag]* %args, i64 0, i64 0, i32 2
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %indvar = phi i64 [ %indvar.next, %for.inc ], [ 0, %entry ]
  %y = getelementptr [4 x %struct.point]* @pts, i64 0, i64 %indvar, i32 1
  %x = getelementptr [4 x %struct.point]* @pts, i64 0, i64 %indvar, i32 0
  %storemerge = trunc i64 %indvar to i32
  %cmp = icmp slt i32 %storemerge, 4
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %fp_offset = load i32* %fp_offset_p, align 4
  %fits_in_fp = icmp ult i32 %fp_offset, 145
  br i1 %fits_in_fp, label %vaarg.in_reg, label %vaarg.in_mem

vaarg.in_reg:                                     ; preds = %for.body
  %reg_save_area = load i8** %0, align 16
  %3 = sext i32 %fp_offset to i64
  %4 = getelementptr i8* %reg_save_area, i64 %3
  %.sum = add i64 %3, 16
  %5 = getelementptr i8* %reg_save_area, i64 %.sum
  %6 = bitcast i8* %4 to double*
  %7 = load double* %6, align 8
  store double %7, double* %1, align 8
  %8 = bitcast i8* %5 to double*
  %9 = load double* %8, align 8
  store double %9, double* %2, align 8
  %10 = add i32 %fp_offset, 32
  store i32 %10, i32* %fp_offset_p, align 4
  br label %vaarg.end

vaarg.in_mem:                                     ; preds = %for.body
  %overflow_arg_area = load i8** %overflow_arg_area_p, align 8
  %11 = bitcast i8* %overflow_arg_area to %struct.point*
  %overflow_arg_area.next = getelementptr i8* %overflow_arg_area, i64 16
  store i8* %overflow_arg_area.next, i8** %overflow_arg_area_p, align 8
  %vaarg.addr.0.phi.trans.insert = bitcast i8* %overflow_arg_area to double*
  %tmp.pre = load double* %vaarg.addr.0.phi.trans.insert, align 8
  br label %vaarg.end

vaarg.end:                                        ; preds = %vaarg.in_mem, %vaarg.in_reg
  %tmp = phi double [ %7, %vaarg.in_reg ], [ %tmp.pre, %vaarg.in_mem ]
  %vaarg.addr = phi %struct.point* [ %tmp4, %vaarg.in_reg ], [ %11, %vaarg.in_mem ]
  %tmp8 = load double* %x, align 16
  %cmp11 = fcmp une double %tmp8, %tmp
  br i1 %cmp11, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %vaarg.end
  %vaarg.addr.1 = getelementptr inbounds %struct.point* %vaarg.addr, i64 0, i32 1
  %tmp1 = load double* %vaarg.addr.1, align 8
  %tmp15 = load double* %y, align 8
  %cmp18 = fcmp une double %tmp15, %tmp1
  br i1 %cmp18, label %if.then, label %for.inc

if.then:                                          ; preds = %lor.lhs.false, %vaarg.end
  call void @abort() noreturn nounwind
  unreachable

for.inc:                                          ; preds = %lor.lhs.false
  %indvar.next = add i64 %indvar, 1
  br label %for.cond

for.end:                                          ; preds = %for.cond
  call void @llvm.va_end(i8* %arraydecay1)
  ret void
}

define internal void @va2(...) nounwind uwtable {
entry:
  %args = alloca [1 x %struct.__va_list_tag], align 16
  %arraydecay1 = bitcast [1 x %struct.__va_list_tag]* %args to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %gp_offset_p = getelementptr inbounds [1 x %struct.__va_list_tag]* %args, i64 0, i64 0, i32 0
  %0 = getelementptr inbounds [1 x %struct.__va_list_tag]* %args, i64 0, i64 0, i32 3
  %overflow_arg_area_p = getelementptr inbounds [1 x %struct.__va_list_tag]* %args, i64 0, i64 0, i32 2
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %indvar = phi i64 [ %indvar.next, %for.inc ], [ 0, %entry ]
  %y = getelementptr [4 x %struct.ipoint]* @ipts, i64 0, i64 %indvar, i32 1
  %x = getelementptr [4 x %struct.ipoint]* @ipts, i64 0, i64 %indvar, i32 0
  %storemerge = trunc i64 %indvar to i32
  %cmp = icmp slt i32 %storemerge, 4
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %gp_offset = load i32* %gp_offset_p, align 16
  %fits_in_gp = icmp ult i32 %gp_offset, 41
  br i1 %fits_in_gp, label %vaarg.in_reg, label %vaarg.in_mem

vaarg.in_reg:                                     ; preds = %for.body
  %reg_save_area = load i8** %0, align 16
  %1 = sext i32 %gp_offset to i64
  %2 = getelementptr i8* %reg_save_area, i64 %1
  %3 = add i32 %gp_offset, 8
  store i32 %3, i32* %gp_offset_p, align 16
  br label %vaarg.end

vaarg.in_mem:                                     ; preds = %for.body
  %overflow_arg_area = load i8** %overflow_arg_area_p, align 8
  %overflow_arg_area.next = getelementptr i8* %overflow_arg_area, i64 8
  store i8* %overflow_arg_area.next, i8** %overflow_arg_area_p, align 8
  br label %vaarg.end

vaarg.end:                                        ; preds = %vaarg.in_mem, %vaarg.in_reg
  %vaarg.addr.in = phi i8* [ %2, %vaarg.in_reg ], [ %overflow_arg_area, %vaarg.in_mem ]
  %4 = bitcast i8* %vaarg.addr.in to i64*
  %5 = load i64* %4, align 4
  %tmp7 = load i32* %x, align 8
  %tmp1 = trunc i64 %5 to i32
  %cmp10 = icmp eq i32 %tmp7, %tmp1
  br i1 %cmp10, label %lor.lhs.false, label %if.then

lor.lhs.false:                                    ; preds = %vaarg.end
  %tmp14 = load i32* %y, align 4
  %tmp3 = lshr i64 %5, 32
  %tmp4 = trunc i64 %tmp3 to i32
  %cmp17 = icmp eq i32 %tmp14, %tmp4
  br i1 %cmp17, label %for.inc, label %if.then

if.then:                                          ; preds = %lor.lhs.false, %vaarg.end
  call void @abort() noreturn nounwind
  unreachable

for.inc:                                          ; preds = %lor.lhs.false
  %indvar.next = add i64 %indvar, 1
  br label %for.cond

for.end:                                          ; preds = %for.cond
  call void @llvm.va_end(i8* %arraydecay1)
  ret void
}

declare void @exit(i32) noreturn nounwind

declare void @llvm.va_start(i8*) nounwind

declare void @abort() noreturn nounwind

declare void @llvm.va_end(i8*) nounwind
