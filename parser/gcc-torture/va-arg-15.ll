; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/va-arg-15.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.__va_list_tag = type { i32, i32, i8*, i8* }

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1

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

define void @vafunction(i8* %dummy, ...) nounwind uwtable {
entry:
  %dummy.addr = alloca i8*, align 8
  %darg = alloca double, align 8
  %iarg = alloca i32, align 4
  %flag = alloca i32, align 4
  %i = alloca i32, align 4
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  store i8* %dummy, i8** %dummy.addr, align 8
  store i32 0, i32* %flag, align 4
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %arraydecay1 = bitcast %struct.__va_list_tag* %arraydecay to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  store i32 1, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp = load i32* %i, align 4
  %cmp = icmp sle i32 %tmp, 18
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp2 = load i32* %flag, align 4
  %and = and i32 %tmp2, 1
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %if.then, label %if.else

if.then:                                          ; preds = %for.body
  %arraydecay3 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %fp_offset_p = getelementptr inbounds %struct.__va_list_tag* %arraydecay3, i32 0, i32 1
  %fp_offset = load i32* %fp_offset_p
  %fits_in_fp = icmp ule i32 %fp_offset, 160
  br i1 %fits_in_fp, label %vaarg.in_reg, label %vaarg.in_mem

vaarg.in_reg:                                     ; preds = %if.then
  %0 = getelementptr inbounds %struct.__va_list_tag* %arraydecay3, i32 0, i32 3
  %reg_save_area = load i8** %0
  %1 = getelementptr i8* %reg_save_area, i32 %fp_offset
  %2 = bitcast i8* %1 to double*
  %3 = add i32 %fp_offset, 16
  store i32 %3, i32* %fp_offset_p
  br label %vaarg.end

vaarg.in_mem:                                     ; preds = %if.then
  %overflow_arg_area_p = getelementptr inbounds %struct.__va_list_tag* %arraydecay3, i32 0, i32 2
  %overflow_arg_area = load i8** %overflow_arg_area_p
  %4 = bitcast i8* %overflow_arg_area to double*
  %overflow_arg_area.next = getelementptr i8* %overflow_arg_area, i32 8
  store i8* %overflow_arg_area.next, i8** %overflow_arg_area_p
  br label %vaarg.end

vaarg.end:                                        ; preds = %vaarg.in_mem, %vaarg.in_reg
  %vaarg.addr = phi double* [ %2, %vaarg.in_reg ], [ %4, %vaarg.in_mem ]
  %5 = load double* %vaarg.addr
  store double %5, double* %darg, align 8
  %tmp4 = load double* %darg, align 8
  %tmp5 = load i32* %i, align 4
  %conv = sitofp i32 %tmp5 to double
  %cmp6 = fcmp une double %tmp4, %conv
  br i1 %cmp6, label %if.then8, label %if.end

if.then8:                                         ; preds = %vaarg.end
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %vaarg.end
  br label %if.end24

if.else:                                          ; preds = %for.body
  %arraydecay9 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %gp_offset_p = getelementptr inbounds %struct.__va_list_tag* %arraydecay9, i32 0, i32 0
  %gp_offset = load i32* %gp_offset_p
  %fits_in_gp = icmp ule i32 %gp_offset, 40
  br i1 %fits_in_gp, label %vaarg.in_reg10, label %vaarg.in_mem12

vaarg.in_reg10:                                   ; preds = %if.else
  %6 = getelementptr inbounds %struct.__va_list_tag* %arraydecay9, i32 0, i32 3
  %reg_save_area11 = load i8** %6
  %7 = getelementptr i8* %reg_save_area11, i32 %gp_offset
  %8 = bitcast i8* %7 to i32*
  %9 = add i32 %gp_offset, 8
  store i32 %9, i32* %gp_offset_p
  br label %vaarg.end16

vaarg.in_mem12:                                   ; preds = %if.else
  %overflow_arg_area_p13 = getelementptr inbounds %struct.__va_list_tag* %arraydecay9, i32 0, i32 2
  %overflow_arg_area14 = load i8** %overflow_arg_area_p13
  %10 = bitcast i8* %overflow_arg_area14 to i32*
  %overflow_arg_area.next15 = getelementptr i8* %overflow_arg_area14, i32 8
  store i8* %overflow_arg_area.next15, i8** %overflow_arg_area_p13
  br label %vaarg.end16

vaarg.end16:                                      ; preds = %vaarg.in_mem12, %vaarg.in_reg10
  %vaarg.addr17 = phi i32* [ %8, %vaarg.in_reg10 ], [ %10, %vaarg.in_mem12 ]
  %11 = load i32* %vaarg.addr17
  store i32 %11, i32* %iarg, align 4
  %tmp18 = load i32* %iarg, align 4
  %tmp19 = load i32* %i, align 4
  %cmp20 = icmp ne i32 %tmp18, %tmp19
  br i1 %cmp20, label %if.then22, label %if.end23

if.then22:                                        ; preds = %vaarg.end16
  call void @abort() noreturn nounwind
  unreachable

if.end23:                                         ; preds = %vaarg.end16
  br label %if.end24

if.end24:                                         ; preds = %if.end23, %if.end
  br label %for.inc

for.inc:                                          ; preds = %if.end24
  %tmp25 = load i32* %i, align 4
  %inc = add nsw i32 %tmp25, 1
  store i32 %inc, i32* %i, align 4
  %tmp26 = load i32* %flag, align 4
  %inc27 = add nsw i32 %tmp26, 1
  store i32 %inc27, i32* %flag, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %arraydecay28 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %arraydecay2829 = bitcast %struct.__va_list_tag* %arraydecay28 to i8*
  call void @llvm.va_end(i8* %arraydecay2829)
  ret void
}

declare void @llvm.va_start(i8*) nounwind

declare void @abort() noreturn nounwind

declare void @llvm.va_end(i8*) nounwind

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  call void (i8*, ...)* @vafunction(i8* getelementptr inbounds ([1 x i8]* @.str, i32 0, i32 0), i32 1, double 2.000000e+00, i32 3, double 4.000000e+00, i32 5, double 6.000000e+00, i32 7, double 8.000000e+00, i32 9, double 1.000000e+01, i32 11, double 1.200000e+01, i32 13, double 1.400000e+01, i32 15, double 1.600000e+01, i32 17, double 1.800000e+01)
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

declare void @exit(i32) noreturn nounwind
