; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/920908-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.T = type { i32 }
%struct.__va_list_tag = type { i32, i32, i8*, i8* }

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

define i32 @f(i32 %x, ...) nounwind uwtable {
entry:
  %retval = alloca %struct.T, align 4
  %x.addr = alloca i32, align 4
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  %X = alloca %struct.T, align 4
  store i32 %x, i32* %x.addr, align 4
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %arraydecay1 = bitcast %struct.__va_list_tag* %arraydecay to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %arraydecay2 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %gp_offset_p = getelementptr inbounds %struct.__va_list_tag* %arraydecay2, i32 0, i32 0
  %gp_offset = load i32* %gp_offset_p
  %fits_in_gp = icmp ule i32 %gp_offset, 40
  br i1 %fits_in_gp, label %vaarg.in_reg, label %vaarg.in_mem

vaarg.in_reg:                                     ; preds = %entry
  %0 = getelementptr inbounds %struct.__va_list_tag* %arraydecay2, i32 0, i32 3
  %reg_save_area = load i8** %0
  %1 = getelementptr i8* %reg_save_area, i32 %gp_offset
  %2 = bitcast i8* %1 to %struct.T*
  %3 = add i32 %gp_offset, 8
  store i32 %3, i32* %gp_offset_p
  br label %vaarg.end

vaarg.in_mem:                                     ; preds = %entry
  %overflow_arg_area_p = getelementptr inbounds %struct.__va_list_tag* %arraydecay2, i32 0, i32 2
  %overflow_arg_area = load i8** %overflow_arg_area_p
  %4 = bitcast i8* %overflow_arg_area to %struct.T*
  %overflow_arg_area.next = getelementptr i8* %overflow_arg_area, i32 8
  store i8* %overflow_arg_area.next, i8** %overflow_arg_area_p
  br label %vaarg.end

vaarg.end:                                        ; preds = %vaarg.in_mem, %vaarg.in_reg
  %vaarg.addr = phi %struct.T* [ %2, %vaarg.in_reg ], [ %4, %vaarg.in_mem ]
  %tmp = bitcast %struct.T* %X to i8*
  %tmp3 = bitcast %struct.T* %vaarg.addr to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp, i8* %tmp3, i64 4, i32 4, i1 false)
  %A = getelementptr inbounds %struct.T* %X, i32 0, i32 0
  %tmp4 = load i32* %A, align 4
  %cmp = icmp ne i32 %tmp4, 10
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %vaarg.end
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %vaarg.end
  %arraydecay5 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %gp_offset_p6 = getelementptr inbounds %struct.__va_list_tag* %arraydecay5, i32 0, i32 0
  %gp_offset7 = load i32* %gp_offset_p6
  %fits_in_gp8 = icmp ule i32 %gp_offset7, 40
  br i1 %fits_in_gp8, label %vaarg.in_reg9, label %vaarg.in_mem11

vaarg.in_reg9:                                    ; preds = %if.end
  %5 = getelementptr inbounds %struct.__va_list_tag* %arraydecay5, i32 0, i32 3
  %reg_save_area10 = load i8** %5
  %6 = getelementptr i8* %reg_save_area10, i32 %gp_offset7
  %7 = bitcast i8* %6 to %struct.T*
  %8 = add i32 %gp_offset7, 8
  store i32 %8, i32* %gp_offset_p6
  br label %vaarg.end15

vaarg.in_mem11:                                   ; preds = %if.end
  %overflow_arg_area_p12 = getelementptr inbounds %struct.__va_list_tag* %arraydecay5, i32 0, i32 2
  %overflow_arg_area13 = load i8** %overflow_arg_area_p12
  %9 = bitcast i8* %overflow_arg_area13 to %struct.T*
  %overflow_arg_area.next14 = getelementptr i8* %overflow_arg_area13, i32 8
  store i8* %overflow_arg_area.next14, i8** %overflow_arg_area_p12
  br label %vaarg.end15

vaarg.end15:                                      ; preds = %vaarg.in_mem11, %vaarg.in_reg9
  %vaarg.addr16 = phi %struct.T* [ %7, %vaarg.in_reg9 ], [ %9, %vaarg.in_mem11 ]
  %tmp17 = bitcast %struct.T* %X to i8*
  %tmp18 = bitcast %struct.T* %vaarg.addr16 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp17, i8* %tmp18, i64 4, i32 4, i1 false)
  %A19 = getelementptr inbounds %struct.T* %X, i32 0, i32 0
  %tmp20 = load i32* %A19, align 4
  %cmp21 = icmp ne i32 %tmp20, 20
  br i1 %cmp21, label %if.then22, label %if.end23

if.then22:                                        ; preds = %vaarg.end15
  call void @abort() noreturn nounwind
  unreachable

if.end23:                                         ; preds = %vaarg.end15
  %arraydecay24 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %arraydecay2425 = bitcast %struct.__va_list_tag* %arraydecay24 to i8*
  call void @llvm.va_end(i8* %arraydecay2425)
  %tmp26 = bitcast %struct.T* %retval to i8*
  %tmp27 = bitcast %struct.T* %X to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp26, i8* %tmp27, i64 4, i32 4, i1 false)
  %coerce.dive = getelementptr %struct.T* %retval, i32 0, i32 0
  %10 = load i32* %coerce.dive
  ret i32 %10
}

declare void @llvm.va_start(i8*) nounwind

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

declare void @abort() noreturn nounwind

declare void @llvm.va_end(i8*) nounwind

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %X = alloca %struct.T, align 4
  %Y = alloca %struct.T, align 4
  %i = alloca i32, align 4
  %coerce = alloca %struct.T, align 4
  store i32 0, i32* %retval
  %A = getelementptr inbounds %struct.T* %X, i32 0, i32 0
  store i32 10, i32* %A, align 4
  %A1 = getelementptr inbounds %struct.T* %Y, i32 0, i32 0
  store i32 20, i32* %A1, align 4
  %coerce.dive = getelementptr %struct.T* %X, i32 0, i32 0
  %0 = load i32* %coerce.dive
  %coerce.dive2 = getelementptr %struct.T* %Y, i32 0, i32 0
  %1 = load i32* %coerce.dive2
  %call = call i32 (i32, ...)* @f(i32 2, i32 %0, i32 %1)
  %coerce.dive3 = getelementptr %struct.T* %coerce, i32 0, i32 0
  store i32 %call, i32* %coerce.dive3
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %2 = load i32* %retval
  ret i32 %2
}

declare void @exit(i32) noreturn nounwind
