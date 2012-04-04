; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/920625-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.point = type { double, double }
%struct.ipoint = type { i32, i32 }
%struct.__va_list_tag = type { i32, i32, i8*, i8* }

@pts = global [4 x %struct.point] [%struct.point { double 1.000000e+00, double 2.000000e+00 }, %struct.point { double 3.000000e+00, double 4.000000e+00 }, %struct.point { double 5.000000e+00, double 6.000000e+00 }, %struct.point { double 7.000000e+00, double 8.000000e+00 }], align 16
@ipts = global [4 x %struct.ipoint] [%struct.ipoint { i32 1, i32 2 }, %struct.ipoint { i32 3, i32 4 }, %struct.ipoint { i32 5, i32 6 }, %struct.ipoint { i32 7, i32 8 }], align 16

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
  %tmp = alloca { double, double }, align 8
  %arraydecay1 = bitcast [1 x %struct.__va_list_tag]* %args to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %fp_offset_p = getelementptr inbounds [1 x %struct.__va_list_tag]* %args, i64 0, i64 0, i32 1
  %0 = getelementptr inbounds [1 x %struct.__va_list_tag]* %args, i64 0, i64 0, i32 3
  %1 = getelementptr inbounds { double, double }* %tmp, i64 0, i32 0
  %2 = getelementptr inbounds { double, double }* %tmp, i64 0, i32 1
  %3 = bitcast { double, double }* %tmp to %struct.point*
  %overflow_arg_area_p = getelementptr inbounds [1 x %struct.__va_list_tag]* %args, i64 0, i64 0, i32 2
  br label %for.cond

for.cond:                                         ; preds = %lor.lhs.false, %entry
  %indvars.iv = phi i64 [ %indvars.iv.next, %lor.lhs.false ], [ 0, %entry ]
  %4 = trunc i64 %indvars.iv to i32
  %cmp = icmp slt i32 %4, 4
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %fp_offset = load i32* %fp_offset_p, align 4
  %fits_in_fp = icmp ult i32 %fp_offset, 145
  br i1 %fits_in_fp, label %vaarg.in_reg, label %vaarg.in_mem

vaarg.in_reg:                                     ; preds = %for.body
  %reg_save_area = load i8** %0, align 16
  %5 = sext i32 %fp_offset to i64
  %6 = getelementptr i8* %reg_save_area, i64 %5
  %.sum = add i64 %5, 16
  %7 = getelementptr i8* %reg_save_area, i64 %.sum
  %8 = bitcast i8* %6 to double*
  %9 = load double* %8, align 8
  store double %9, double* %1, align 8
  %10 = bitcast i8* %7 to double*
  %11 = load double* %10, align 8
  store double %11, double* %2, align 8
  %12 = add i32 %fp_offset, 32
  store i32 %12, i32* %fp_offset_p, align 4
  br label %vaarg.end

vaarg.in_mem:                                     ; preds = %for.body
  %overflow_arg_area = load i8** %overflow_arg_area_p, align 8
  %13 = bitcast i8* %overflow_arg_area to %struct.point*
  %overflow_arg_area.next = getelementptr i8* %overflow_arg_area, i64 16
  store i8* %overflow_arg_area.next, i8** %overflow_arg_area_p, align 8
  br label %vaarg.end

vaarg.end:                                        ; preds = %vaarg.in_mem, %vaarg.in_reg
  %vaarg.addr = phi %struct.point* [ %3, %vaarg.in_reg ], [ %13, %vaarg.in_mem ]
  %vaarg.addr.0 = getelementptr inbounds %struct.point* %vaarg.addr, i64 0, i32 0
  %tmp11 = load double* %vaarg.addr.0, align 8
  %x = getelementptr inbounds [4 x %struct.point]* @pts, i64 0, i64 %indvars.iv, i32 0
  %14 = load double* %x, align 16, !tbaa !0
  %cmp4 = fcmp une double %14, %tmp11
  br i1 %cmp4, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %vaarg.end
  %vaarg.addr.1 = getelementptr inbounds %struct.point* %vaarg.addr, i64 0, i32 1
  %tmp12 = load double* %vaarg.addr.1, align 8
  %y = getelementptr inbounds [4 x %struct.point]* @pts, i64 0, i64 %indvars.iv, i32 1
  %15 = load double* %y, align 8, !tbaa !0
  %cmp8 = fcmp une double %15, %tmp12
  %indvars.iv.next = add i64 %indvars.iv, 1
  br i1 %cmp8, label %if.then, label %for.cond

if.then:                                          ; preds = %lor.lhs.false, %vaarg.end
  call void @abort() noreturn nounwind
  unreachable

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

for.cond:                                         ; preds = %lor.lhs.false, %entry
  %indvars.iv = phi i64 [ %indvars.iv.next, %lor.lhs.false ], [ 0, %entry ]
  %1 = trunc i64 %indvars.iv to i32
  %cmp = icmp slt i32 %1, 4
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %gp_offset = load i32* %gp_offset_p, align 16
  %fits_in_gp = icmp ult i32 %gp_offset, 41
  br i1 %fits_in_gp, label %vaarg.in_reg, label %vaarg.in_mem

vaarg.in_reg:                                     ; preds = %for.body
  %reg_save_area = load i8** %0, align 16
  %2 = sext i32 %gp_offset to i64
  %3 = getelementptr i8* %reg_save_area, i64 %2
  %4 = add i32 %gp_offset, 8
  store i32 %4, i32* %gp_offset_p, align 16
  br label %vaarg.end

vaarg.in_mem:                                     ; preds = %for.body
  %overflow_arg_area = load i8** %overflow_arg_area_p, align 8
  %overflow_arg_area.next = getelementptr i8* %overflow_arg_area, i64 8
  store i8* %overflow_arg_area.next, i8** %overflow_arg_area_p, align 8
  br label %vaarg.end

vaarg.end:                                        ; preds = %vaarg.in_mem, %vaarg.in_reg
  %vaarg.addr.in = phi i8* [ %3, %vaarg.in_reg ], [ %overflow_arg_area, %vaarg.in_mem ]
  %vaarg.addr.0 = bitcast i8* %vaarg.addr.in to i32*
  %tmp = load i32* %vaarg.addr.0, align 4
  %x = getelementptr inbounds [4 x %struct.ipoint]* @ipts, i64 0, i64 %indvars.iv, i32 0
  %5 = load i32* %x, align 8, !tbaa !3
  %cmp4 = icmp eq i32 %5, %tmp
  br i1 %cmp4, label %lor.lhs.false, label %if.then

lor.lhs.false:                                    ; preds = %vaarg.end
  %vaarg.addr.1 = getelementptr inbounds i8* %vaarg.addr.in, i64 4
  %6 = bitcast i8* %vaarg.addr.1 to i32*
  %tmp11 = load i32* %6, align 4
  %y = getelementptr inbounds [4 x %struct.ipoint]* @ipts, i64 0, i64 %indvars.iv, i32 1
  %7 = load i32* %y, align 4, !tbaa !3
  %cmp8 = icmp eq i32 %7, %tmp11
  %indvars.iv.next = add i64 %indvars.iv, 1
  br i1 %cmp8, label %for.cond, label %if.then

if.then:                                          ; preds = %lor.lhs.false, %vaarg.end
  call void @abort() noreturn nounwind
  unreachable

for.end:                                          ; preds = %for.cond
  call void @llvm.va_end(i8* %arraydecay1)
  ret void
}

declare void @exit(i32) noreturn nounwind

declare void @llvm.va_start(i8*) nounwind

declare void @abort() noreturn nounwind

declare void @llvm.va_end(i8*) nounwind

!0 = metadata !{metadata !"double", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
!3 = metadata !{metadata !"int", metadata !1}
