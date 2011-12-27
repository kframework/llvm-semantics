; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/pr44575.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%0 = type { double, double }
%1 = type { <2 x float>, float }
%struct.S = type { [3 x float] }
%struct.__va_list_tag = type { i32, i32, i8*, i8* }

@fails = global i32 0, align 4
@a = common global [5 x %struct.S] zeroinitializer, align 16

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

define void @check(i32 %z, ...) nounwind uwtable {
entry:
  %z.addr = alloca i32, align 4
  %arg = alloca %struct.S, align 4
  %p = alloca %struct.S*, align 8
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %i = alloca i32, align 4
  %tmp7 = alloca %0
  store i32 %z, i32* %z.addr, align 4
  store i32 0, i32* %j, align 4
  store i32 0, i32* %k, align 4
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %arraydecay1 = bitcast %struct.__va_list_tag* %arraydecay to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  store i32 2, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp, 4
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  store %struct.S* null, %struct.S** %p, align 8
  %tmp2 = load i32* %j, align 4
  %inc = add nsw i32 %tmp2, 1
  store i32 %inc, i32* %j, align 4
  %tmp3 = load i32* %k, align 4
  %add = add nsw i32 %tmp3, 2
  store i32 %add, i32* %k, align 4
  %tmp4 = load i32* %z.addr, align 4
  %shl = shl i32 %tmp4, 4
  %tmp5 = load i32* %i, align 4
  %or = or i32 %shl, %tmp5
  switch i32 %or, label %sw.default [
    i32 18, label %sw.bb
    i32 19, label %sw.bb
  ]

sw.bb:                                            ; preds = %for.body, %for.body
  store %struct.S* getelementptr inbounds ([5 x %struct.S]* @a, i32 0, i64 2), %struct.S** %p, align 8
  %arraydecay6 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %fp_offset_p = getelementptr inbounds %struct.__va_list_tag* %arraydecay6, i32 0, i32 1
  %fp_offset = load i32* %fp_offset_p
  %fits_in_fp = icmp ule i32 %fp_offset, 144
  br i1 %fits_in_fp, label %vaarg.in_reg, label %vaarg.in_mem

vaarg.in_reg:                                     ; preds = %sw.bb
  %0 = getelementptr inbounds %struct.__va_list_tag* %arraydecay6, i32 0, i32 3
  %reg_save_area = load i8** %0
  %1 = getelementptr i8* %reg_save_area, i32 %fp_offset
  %2 = getelementptr i8* %1, i32 16
  %3 = bitcast i8* %1 to double*
  %4 = load double* %3
  %5 = getelementptr inbounds %0* %tmp7, i32 0, i32 0
  store double %4, double* %5
  %6 = bitcast i8* %2 to double*
  %7 = load double* %6
  %8 = getelementptr inbounds %0* %tmp7, i32 0, i32 1
  store double %7, double* %8
  %9 = bitcast %0* %tmp7 to %struct.S*
  %10 = add i32 %fp_offset, 32
  store i32 %10, i32* %fp_offset_p
  br label %vaarg.end

vaarg.in_mem:                                     ; preds = %sw.bb
  %overflow_arg_area_p = getelementptr inbounds %struct.__va_list_tag* %arraydecay6, i32 0, i32 2
  %overflow_arg_area = load i8** %overflow_arg_area_p
  %11 = bitcast i8* %overflow_arg_area to %struct.S*
  %overflow_arg_area.next = getelementptr i8* %overflow_arg_area, i32 16
  store i8* %overflow_arg_area.next, i8** %overflow_arg_area_p
  br label %vaarg.end

vaarg.end:                                        ; preds = %vaarg.in_mem, %vaarg.in_reg
  %vaarg.addr = phi %struct.S* [ %9, %vaarg.in_reg ], [ %11, %vaarg.in_mem ]
  %tmp8 = bitcast %struct.S* %arg to i8*
  %tmp9 = bitcast %struct.S* %vaarg.addr to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp8, i8* %tmp9, i64 12, i32 4, i1 false)
  br label %sw.epilog

sw.default:                                       ; preds = %for.body
  %tmp10 = load i32* @fails, align 4
  %inc11 = add nsw i32 %tmp10, 1
  store i32 %inc11, i32* @fails, align 4
  br label %sw.epilog

sw.epilog:                                        ; preds = %sw.default, %vaarg.end
  %tmp12 = load %struct.S** %p, align 8
  %tobool = icmp ne %struct.S* %tmp12, null
  br i1 %tobool, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %sw.epilog
  %tmp13 = load %struct.S** %p, align 8
  %a = getelementptr inbounds %struct.S* %tmp13, i32 0, i32 0
  %arrayidx = getelementptr inbounds [3 x float]* %a, i32 0, i64 2
  %tmp14 = load float* %arrayidx, align 4
  %a15 = getelementptr inbounds %struct.S* %arg, i32 0, i32 0
  %arrayidx16 = getelementptr inbounds [3 x float]* %a15, i32 0, i64 2
  %tmp17 = load float* %arrayidx16, align 4
  %cmp18 = fcmp une float %tmp14, %tmp17
  br i1 %cmp18, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %tmp19 = load i32* @fails, align 4
  %inc20 = add nsw i32 %tmp19, 1
  store i32 %inc20, i32* @fails, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true, %sw.epilog
  %tmp21 = load i32* @fails, align 4
  %tobool22 = icmp ne i32 %tmp21, 0
  br i1 %tobool22, label %if.then23, label %if.end24

if.then23:                                        ; preds = %if.end
  br label %for.end

if.end24:                                         ; preds = %if.end
  br label %for.inc

for.inc:                                          ; preds = %if.end24
  %tmp25 = load i32* %i, align 4
  %inc26 = add nsw i32 %tmp25, 1
  store i32 %inc26, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %if.then23, %for.cond
  %arraydecay27 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %arraydecay2728 = bitcast %struct.__va_list_tag* %arraydecay27 to i8*
  call void @llvm.va_end(i8* %arraydecay2728)
  ret void
}

declare void @llvm.va_start(i8*) nounwind

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

declare void @llvm.va_end(i8*) nounwind

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  store float -4.902600e+04, float* getelementptr inbounds ([5 x %struct.S]* @a, i32 0, i64 2, i32 0, i64 2), align 4
  %0 = load <2 x float>* getelementptr (%1* bitcast (%struct.S* getelementptr inbounds ([5 x %struct.S]* @a, i32 0, i64 2) to %1*), i32 0, i32 0), align 1
  %1 = load float* getelementptr (%1* bitcast (%struct.S* getelementptr inbounds ([5 x %struct.S]* @a, i32 0, i64 2) to %1*), i32 0, i32 1), align 1
  %2 = load <2 x float>* getelementptr (%1* bitcast (%struct.S* getelementptr inbounds ([5 x %struct.S]* @a, i32 0, i64 2) to %1*), i32 0, i32 0), align 1
  %3 = load float* getelementptr (%1* bitcast (%struct.S* getelementptr inbounds ([5 x %struct.S]* @a, i32 0, i64 2) to %1*), i32 0, i32 1), align 1
  call void (i32, ...)* @check(i32 1, <2 x float> %0, float %1, <2 x float> %2, float %3)
  %tmp = load i32* @fails, align 4
  %tobool = icmp ne i32 %tmp, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret i32 0
}

declare void @abort() noreturn nounwind
