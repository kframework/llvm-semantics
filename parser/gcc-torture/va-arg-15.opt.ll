; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/va-arg-15.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.__va_list_tag = type { i32, i32, i8*, i8* }

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1

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

define void @vafunction(i8* nocapture %dummy, ...) nounwind uwtable {
entry:
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  %arraydecay1 = bitcast [1 x %struct.__va_list_tag]* %ap to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %gp_offset_p = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 0
  %0 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 3
  %overflow_arg_area_p13 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 2
  %fp_offset_p = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 1
  br label %for.cond

for.cond:                                         ; preds = %vaarg.end16, %vaarg.end, %entry
  %1 = phi i32 [ 0, %entry ], [ %inc2, %vaarg.end ], [ %inc2, %vaarg.end16 ]
  %inc2 = add i32 %1, 1
  %cmp = icmp slt i32 %inc2, 19
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %and = and i32 %1, 1
  %tobool = icmp eq i32 %and, 0
  br i1 %tobool, label %if.else, label %if.then

if.then:                                          ; preds = %for.body
  %fp_offset = load i32* %fp_offset_p, align 4
  %fits_in_fp = icmp ult i32 %fp_offset, 161
  br i1 %fits_in_fp, label %vaarg.in_reg, label %vaarg.in_mem

vaarg.in_reg:                                     ; preds = %if.then
  %reg_save_area = load i8** %0, align 16
  %2 = sext i32 %fp_offset to i64
  %3 = getelementptr i8* %reg_save_area, i64 %2
  %4 = add i32 %fp_offset, 16
  store i32 %4, i32* %fp_offset_p, align 4
  br label %vaarg.end

vaarg.in_mem:                                     ; preds = %if.then
  %overflow_arg_area = load i8** %overflow_arg_area_p13, align 8
  %overflow_arg_area.next = getelementptr i8* %overflow_arg_area, i64 8
  store i8* %overflow_arg_area.next, i8** %overflow_arg_area_p13, align 8
  br label %vaarg.end

vaarg.end:                                        ; preds = %vaarg.in_mem, %vaarg.in_reg
  %vaarg.addr.in = phi i8* [ %3, %vaarg.in_reg ], [ %overflow_arg_area, %vaarg.in_mem ]
  %vaarg.addr = bitcast i8* %vaarg.addr.in to double*
  %5 = load double* %vaarg.addr, align 8
  %conv = sitofp i32 %inc2 to double
  %cmp6 = fcmp une double %5, %conv
  br i1 %cmp6, label %if.then8, label %for.cond

if.then8:                                         ; preds = %vaarg.end
  call void @abort() noreturn nounwind
  unreachable

if.else:                                          ; preds = %for.body
  %gp_offset = load i32* %gp_offset_p, align 16
  %fits_in_gp = icmp ult i32 %gp_offset, 41
  br i1 %fits_in_gp, label %vaarg.in_reg10, label %vaarg.in_mem12

vaarg.in_reg10:                                   ; preds = %if.else
  %reg_save_area11 = load i8** %0, align 16
  %6 = sext i32 %gp_offset to i64
  %7 = getelementptr i8* %reg_save_area11, i64 %6
  %8 = add i32 %gp_offset, 8
  store i32 %8, i32* %gp_offset_p, align 16
  br label %vaarg.end16

vaarg.in_mem12:                                   ; preds = %if.else
  %overflow_arg_area14 = load i8** %overflow_arg_area_p13, align 8
  %overflow_arg_area.next15 = getelementptr i8* %overflow_arg_area14, i64 8
  store i8* %overflow_arg_area.next15, i8** %overflow_arg_area_p13, align 8
  br label %vaarg.end16

vaarg.end16:                                      ; preds = %vaarg.in_mem12, %vaarg.in_reg10
  %vaarg.addr17.in = phi i8* [ %7, %vaarg.in_reg10 ], [ %overflow_arg_area14, %vaarg.in_mem12 ]
  %vaarg.addr17 = bitcast i8* %vaarg.addr17.in to i32*
  %9 = load i32* %vaarg.addr17, align 4
  %cmp20 = icmp eq i32 %9, %inc2
  br i1 %cmp20, label %for.cond, label %if.then22

if.then22:                                        ; preds = %vaarg.end16
  call void @abort() noreturn nounwind
  unreachable

for.end:                                          ; preds = %for.cond
  call void @llvm.va_end(i8* %arraydecay1)
  ret void
}

declare void @llvm.va_start(i8*) nounwind

declare void @abort() noreturn nounwind

declare void @llvm.va_end(i8*) nounwind

define i32 @main() noreturn nounwind uwtable {
entry:
  tail call void (i8*, ...)* @vafunction(i8* getelementptr inbounds ([1 x i8]* @.str, i64 0, i64 0), i32 1, double 2.000000e+00, i32 3, double 4.000000e+00, i32 5, double 6.000000e+00, i32 7, double 8.000000e+00, i32 9, double 1.000000e+01, i32 11, double 1.200000e+01, i32 13, double 1.400000e+01, i32 15, double 1.600000e+01, i32 17, double 1.800000e+01)
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn nounwind
