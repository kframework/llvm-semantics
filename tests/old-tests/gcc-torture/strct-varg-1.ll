; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/strct-varg-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.__va_list_tag = type { i32, i32, i8*, i8* }
%struct.s = type { i32, i32 }

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

define void @f(i32 %attr, ...) nounwind uwtable {
entry:
  %attr.addr = alloca i32, align 4
  %va_values = alloca %struct.s, align 4
  %va = alloca [1 x %struct.__va_list_tag], align 16
  %i = alloca i32, align 4
  store i32 %attr, i32* %attr.addr, align 4
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %va, i32 0, i32 0
  %arraydecay1 = bitcast %struct.__va_list_tag* %arraydecay to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %tmp = load i32* %attr.addr, align 4
  %cmp = icmp ne i32 %tmp, 2
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  %arraydecay2 = getelementptr inbounds [1 x %struct.__va_list_tag]* %va, i32 0, i32 0
  %gp_offset_p = getelementptr inbounds %struct.__va_list_tag* %arraydecay2, i32 0, i32 0
  %gp_offset = load i32* %gp_offset_p
  %fits_in_gp = icmp ule i32 %gp_offset, 40
  br i1 %fits_in_gp, label %vaarg.in_reg, label %vaarg.in_mem

vaarg.in_reg:                                     ; preds = %if.end
  %0 = getelementptr inbounds %struct.__va_list_tag* %arraydecay2, i32 0, i32 3
  %reg_save_area = load i8** %0
  %1 = getelementptr i8* %reg_save_area, i32 %gp_offset
  %2 = bitcast i8* %1 to %struct.s*
  %3 = add i32 %gp_offset, 8
  store i32 %3, i32* %gp_offset_p
  br label %vaarg.end

vaarg.in_mem:                                     ; preds = %if.end
  %overflow_arg_area_p = getelementptr inbounds %struct.__va_list_tag* %arraydecay2, i32 0, i32 2
  %overflow_arg_area = load i8** %overflow_arg_area_p
  %4 = bitcast i8* %overflow_arg_area to %struct.s*
  %overflow_arg_area.next = getelementptr i8* %overflow_arg_area, i32 8
  store i8* %overflow_arg_area.next, i8** %overflow_arg_area_p
  br label %vaarg.end

vaarg.end:                                        ; preds = %vaarg.in_mem, %vaarg.in_reg
  %vaarg.addr = phi %struct.s* [ %2, %vaarg.in_reg ], [ %4, %vaarg.in_mem ]
  %tmp3 = bitcast %struct.s* %va_values to i8*
  %tmp4 = bitcast %struct.s* %vaarg.addr to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp3, i8* %tmp4, i64 8, i32 4, i1 false)
  %x = getelementptr inbounds %struct.s* %va_values, i32 0, i32 0
  %tmp5 = load i32* %x, align 4
  %cmp6 = icmp ne i32 %tmp5, 43690
  br i1 %cmp6, label %if.then9, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %vaarg.end
  %y = getelementptr inbounds %struct.s* %va_values, i32 0, i32 1
  %tmp7 = load i32* %y, align 4
  %cmp8 = icmp ne i32 %tmp7, 21845
  br i1 %cmp8, label %if.then9, label %if.end10

if.then9:                                         ; preds = %lor.lhs.false, %vaarg.end
  call void @abort() noreturn nounwind
  unreachable

if.end10:                                         ; preds = %lor.lhs.false
  %arraydecay11 = getelementptr inbounds [1 x %struct.__va_list_tag]* %va, i32 0, i32 0
  %gp_offset_p12 = getelementptr inbounds %struct.__va_list_tag* %arraydecay11, i32 0, i32 0
  %gp_offset13 = load i32* %gp_offset_p12
  %fits_in_gp14 = icmp ule i32 %gp_offset13, 40
  br i1 %fits_in_gp14, label %vaarg.in_reg15, label %vaarg.in_mem17

vaarg.in_reg15:                                   ; preds = %if.end10
  %5 = getelementptr inbounds %struct.__va_list_tag* %arraydecay11, i32 0, i32 3
  %reg_save_area16 = load i8** %5
  %6 = getelementptr i8* %reg_save_area16, i32 %gp_offset13
  %7 = bitcast i8* %6 to i32*
  %8 = add i32 %gp_offset13, 8
  store i32 %8, i32* %gp_offset_p12
  br label %vaarg.end21

vaarg.in_mem17:                                   ; preds = %if.end10
  %overflow_arg_area_p18 = getelementptr inbounds %struct.__va_list_tag* %arraydecay11, i32 0, i32 2
  %overflow_arg_area19 = load i8** %overflow_arg_area_p18
  %9 = bitcast i8* %overflow_arg_area19 to i32*
  %overflow_arg_area.next20 = getelementptr i8* %overflow_arg_area19, i32 8
  store i8* %overflow_arg_area.next20, i8** %overflow_arg_area_p18
  br label %vaarg.end21

vaarg.end21:                                      ; preds = %vaarg.in_mem17, %vaarg.in_reg15
  %vaarg.addr22 = phi i32* [ %7, %vaarg.in_reg15 ], [ %9, %vaarg.in_mem17 ]
  %10 = load i32* %vaarg.addr22
  store i32 %10, i32* %attr.addr, align 4
  %tmp23 = load i32* %attr.addr, align 4
  %cmp24 = icmp ne i32 %tmp23, 3
  br i1 %cmp24, label %if.then25, label %if.end26

if.then25:                                        ; preds = %vaarg.end21
  call void @abort() noreturn nounwind
  unreachable

if.end26:                                         ; preds = %vaarg.end21
  %arraydecay27 = getelementptr inbounds [1 x %struct.__va_list_tag]* %va, i32 0, i32 0
  %gp_offset_p28 = getelementptr inbounds %struct.__va_list_tag* %arraydecay27, i32 0, i32 0
  %gp_offset29 = load i32* %gp_offset_p28
  %fits_in_gp30 = icmp ule i32 %gp_offset29, 40
  br i1 %fits_in_gp30, label %vaarg.in_reg31, label %vaarg.in_mem33

vaarg.in_reg31:                                   ; preds = %if.end26
  %11 = getelementptr inbounds %struct.__va_list_tag* %arraydecay27, i32 0, i32 3
  %reg_save_area32 = load i8** %11
  %12 = getelementptr i8* %reg_save_area32, i32 %gp_offset29
  %13 = bitcast i8* %12 to %struct.s*
  %14 = add i32 %gp_offset29, 8
  store i32 %14, i32* %gp_offset_p28
  br label %vaarg.end37

vaarg.in_mem33:                                   ; preds = %if.end26
  %overflow_arg_area_p34 = getelementptr inbounds %struct.__va_list_tag* %arraydecay27, i32 0, i32 2
  %overflow_arg_area35 = load i8** %overflow_arg_area_p34
  %15 = bitcast i8* %overflow_arg_area35 to %struct.s*
  %overflow_arg_area.next36 = getelementptr i8* %overflow_arg_area35, i32 8
  store i8* %overflow_arg_area.next36, i8** %overflow_arg_area_p34
  br label %vaarg.end37

vaarg.end37:                                      ; preds = %vaarg.in_mem33, %vaarg.in_reg31
  %vaarg.addr38 = phi %struct.s* [ %13, %vaarg.in_reg31 ], [ %15, %vaarg.in_mem33 ]
  %tmp39 = bitcast %struct.s* %va_values to i8*
  %tmp40 = bitcast %struct.s* %vaarg.addr38 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp39, i8* %tmp40, i64 8, i32 4, i1 false)
  %x41 = getelementptr inbounds %struct.s* %va_values, i32 0, i32 0
  %tmp42 = load i32* %x41, align 4
  %cmp43 = icmp ne i32 %tmp42, 65535
  br i1 %cmp43, label %if.then48, label %lor.lhs.false44

lor.lhs.false44:                                  ; preds = %vaarg.end37
  %y45 = getelementptr inbounds %struct.s* %va_values, i32 0, i32 1
  %tmp46 = load i32* %y45, align 4
  %cmp47 = icmp ne i32 %tmp46, 4369
  br i1 %cmp47, label %if.then48, label %if.end49

if.then48:                                        ; preds = %lor.lhs.false44, %vaarg.end37
  call void @abort() noreturn nounwind
  unreachable

if.end49:                                         ; preds = %lor.lhs.false44
  %arraydecay50 = getelementptr inbounds [1 x %struct.__va_list_tag]* %va, i32 0, i32 0
  %arraydecay5051 = bitcast %struct.__va_list_tag* %arraydecay50 to i8*
  call void @llvm.va_end(i8* %arraydecay5051)
  ret void
}

declare void @llvm.va_start(i8*) nounwind

declare void @abort() noreturn nounwind

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

declare void @llvm.va_end(i8*) nounwind

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %a = alloca %struct.s, align 4
  %b = alloca %struct.s, align 4
  store i32 0, i32* %retval
  %x = getelementptr inbounds %struct.s* %a, i32 0, i32 0
  store i32 43690, i32* %x, align 4
  %y = getelementptr inbounds %struct.s* %a, i32 0, i32 1
  store i32 21845, i32* %y, align 4
  %x1 = getelementptr inbounds %struct.s* %b, i32 0, i32 0
  store i32 65535, i32* %x1, align 4
  %y2 = getelementptr inbounds %struct.s* %b, i32 0, i32 1
  store i32 4369, i32* %y2, align 4
  %0 = bitcast %struct.s* %a to i64*
  %1 = load i64* %0, align 1
  %2 = bitcast %struct.s* %b to i64*
  %3 = load i64* %2, align 1
  call void (i32, ...)* @f(i32 2, i64 %1, i32 3, i64 %3)
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %4 = load i32* %retval
  ret i32 %4
}

declare void @exit(i32) noreturn nounwind
