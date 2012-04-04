; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/pr44575.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%0 = type { double, double }
%struct.S = type { [3 x float] }
%struct.__va_list_tag = type { i32, i32, i8*, i8* }

@fails = global i32 0, align 4
@a = common global [5 x %struct.S] zeroinitializer, align 16

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

define void @check(i32 %z, ...) nounwind uwtable {
entry:
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  %tmp7 = alloca %0, align 8
  %arraydecay1 = bitcast [1 x %struct.__va_list_tag]* %ap to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %shl = shl i32 %z, 4
  %fp_offset_p = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 1
  %0 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 3
  %1 = getelementptr inbounds %0* %tmp7, i64 0, i32 0
  %2 = getelementptr inbounds %0* %tmp7, i64 0, i32 1
  %3 = bitcast %0* %tmp7 to %struct.S*
  %overflow_arg_area_p = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 2
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %indvar = phi i32 [ %indvar.next, %for.inc ], [ 0, %entry ]
  %storemerge = add i32 %indvar, 2
  %cmp = icmp slt i32 %storemerge, 4
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %or = or i32 %storemerge, %shl
  %or.off = add i32 %or, -18
  %switch = icmp ult i32 %or.off, 2
  br i1 %switch, label %sw.bb, label %sw.epilog.thread

sw.bb:                                            ; preds = %for.body
  %fp_offset = load i32* %fp_offset_p, align 4
  %fits_in_fp = icmp ult i32 %fp_offset, 145
  br i1 %fits_in_fp, label %vaarg.in_reg, label %vaarg.in_mem

vaarg.in_reg:                                     ; preds = %sw.bb
  %reg_save_area = load i8** %0, align 16
  %4 = sext i32 %fp_offset to i64
  %5 = getelementptr i8* %reg_save_area, i64 %4
  %.sum = add i64 %4, 16
  %6 = getelementptr i8* %reg_save_area, i64 %.sum
  %7 = bitcast i8* %5 to double*
  %8 = load double* %7, align 8
  store double %8, double* %1, align 8
  %9 = bitcast i8* %6 to double*
  %10 = load double* %9, align 8
  store double %10, double* %2, align 8
  %11 = add i32 %fp_offset, 32
  store i32 %11, i32* %fp_offset_p, align 4
  br label %land.lhs.true

vaarg.in_mem:                                     ; preds = %sw.bb
  %overflow_arg_area = load i8** %overflow_arg_area_p, align 8
  %12 = bitcast i8* %overflow_arg_area to %struct.S*
  %overflow_arg_area.next = getelementptr i8* %overflow_arg_area, i64 16
  store i8* %overflow_arg_area.next, i8** %overflow_arg_area_p, align 8
  br label %land.lhs.true

sw.epilog.thread:                                 ; preds = %for.body
  %tmp10 = load i32* @fails, align 4
  %inc11 = add nsw i32 %tmp10, 1
  store i32 %inc11, i32* @fails, align 4
  br label %if.end

land.lhs.true:                                    ; preds = %vaarg.in_mem, %vaarg.in_reg
  %vaarg.addr = phi %struct.S* [ %3, %vaarg.in_reg ], [ %12, %vaarg.in_mem ]
  %vaarg.addr4.2 = getelementptr inbounds %struct.S* %vaarg.addr, i64 0, i32 0, i64 2
  %tmp6 = load float* %vaarg.addr4.2, align 4
  %tmp14 = load float* getelementptr inbounds ([5 x %struct.S]* @a, i64 0, i64 2, i32 0, i64 2), align 8
  %cmp18 = fcmp une float %tmp14, %tmp6
  %tmp19 = load i32* @fails, align 4
  br i1 %cmp18, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %inc20 = add nsw i32 %tmp19, 1
  store i32 %inc20, i32* @fails, align 4
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %sw.epilog.thread, %if.then
  %tmp21 = phi i32 [ %inc20, %if.then ], [ %inc11, %sw.epilog.thread ], [ %tmp19, %land.lhs.true ]
  %tobool22 = icmp eq i32 %tmp21, 0
  br i1 %tobool22, label %for.inc, label %for.end

for.inc:                                          ; preds = %if.end
  %indvar.next = add i32 %indvar, 1
  br label %for.cond

for.end:                                          ; preds = %if.end, %for.cond
  call void @llvm.va_end(i8* %arraydecay1)
  ret void
}

declare void @llvm.va_start(i8*) nounwind

declare void @llvm.va_end(i8*) nounwind

define i32 @main() nounwind uwtable {
entry:
  store float -4.902600e+04, float* getelementptr inbounds ([5 x %struct.S]* @a, i64 0, i64 2, i32 0, i64 2), align 8
  %0 = load <2 x float>* bitcast (float* getelementptr inbounds ([5 x %struct.S]* @a, i64 0, i64 2, i32 0, i64 0) to <2 x float>*), align 8
  tail call void (i32, ...)* @check(i32 1, <2 x float> %0, float -4.902600e+04, <2 x float> %0, float -4.902600e+04)
  %tmp = load i32* @fails, align 4
  %tobool = icmp eq i32 %tmp, 0
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret i32 0
}

declare void @abort() noreturn nounwind
