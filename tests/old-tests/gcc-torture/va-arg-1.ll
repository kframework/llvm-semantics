; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/va-arg-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

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

define void @f(i64 %p0, i64 %p1, i64 %p2, i64 %p3, i64 %p4, i64 %p5, i64 %p6, i64 %p7, i64 %p8, ...) nounwind uwtable {
entry:
  %p0.addr = alloca i64, align 8
  %p1.addr = alloca i64, align 8
  %p2.addr = alloca i64, align 8
  %p3.addr = alloca i64, align 8
  %p4.addr = alloca i64, align 8
  %p5.addr = alloca i64, align 8
  %p6.addr = alloca i64, align 8
  %p7.addr = alloca i64, align 8
  %p8.addr = alloca i64, align 8
  %select = alloca [1 x %struct.__va_list_tag], align 16
  store i64 %p0, i64* %p0.addr, align 8
  store i64 %p1, i64* %p1.addr, align 8
  store i64 %p2, i64* %p2.addr, align 8
  store i64 %p3, i64* %p3.addr, align 8
  store i64 %p4, i64* %p4.addr, align 8
  store i64 %p5, i64* %p5.addr, align 8
  store i64 %p6, i64* %p6.addr, align 8
  store i64 %p7, i64* %p7.addr, align 8
  store i64 %p8, i64* %p8.addr, align 8
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %select, i32 0, i32 0
  %arraydecay1 = bitcast %struct.__va_list_tag* %arraydecay to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %arraydecay2 = getelementptr inbounds [1 x %struct.__va_list_tag]* %select, i32 0, i32 0
  %gp_offset_p = getelementptr inbounds %struct.__va_list_tag* %arraydecay2, i32 0, i32 0
  %gp_offset = load i32* %gp_offset_p
  %fits_in_gp = icmp ule i32 %gp_offset, 40
  br i1 %fits_in_gp, label %vaarg.in_reg, label %vaarg.in_mem

vaarg.in_reg:                                     ; preds = %entry
  %0 = getelementptr inbounds %struct.__va_list_tag* %arraydecay2, i32 0, i32 3
  %reg_save_area = load i8** %0
  %1 = getelementptr i8* %reg_save_area, i32 %gp_offset
  %2 = bitcast i8* %1 to i64*
  %3 = add i32 %gp_offset, 8
  store i32 %3, i32* %gp_offset_p
  br label %vaarg.end

vaarg.in_mem:                                     ; preds = %entry
  %overflow_arg_area_p = getelementptr inbounds %struct.__va_list_tag* %arraydecay2, i32 0, i32 2
  %overflow_arg_area = load i8** %overflow_arg_area_p
  %4 = bitcast i8* %overflow_arg_area to i64*
  %overflow_arg_area.next = getelementptr i8* %overflow_arg_area, i32 8
  store i8* %overflow_arg_area.next, i8** %overflow_arg_area_p
  br label %vaarg.end

vaarg.end:                                        ; preds = %vaarg.in_mem, %vaarg.in_reg
  %vaarg.addr = phi i64* [ %2, %vaarg.in_reg ], [ %4, %vaarg.in_mem ]
  %5 = load i64* %vaarg.addr
  %cmp = icmp ne i64 %5, 10
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %vaarg.end
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %vaarg.end
  %arraydecay3 = getelementptr inbounds [1 x %struct.__va_list_tag]* %select, i32 0, i32 0
  %gp_offset_p4 = getelementptr inbounds %struct.__va_list_tag* %arraydecay3, i32 0, i32 0
  %gp_offset5 = load i32* %gp_offset_p4
  %fits_in_gp6 = icmp ule i32 %gp_offset5, 40
  br i1 %fits_in_gp6, label %vaarg.in_reg7, label %vaarg.in_mem9

vaarg.in_reg7:                                    ; preds = %if.end
  %6 = getelementptr inbounds %struct.__va_list_tag* %arraydecay3, i32 0, i32 3
  %reg_save_area8 = load i8** %6
  %7 = getelementptr i8* %reg_save_area8, i32 %gp_offset5
  %8 = bitcast i8* %7 to i64*
  %9 = add i32 %gp_offset5, 8
  store i32 %9, i32* %gp_offset_p4
  br label %vaarg.end13

vaarg.in_mem9:                                    ; preds = %if.end
  %overflow_arg_area_p10 = getelementptr inbounds %struct.__va_list_tag* %arraydecay3, i32 0, i32 2
  %overflow_arg_area11 = load i8** %overflow_arg_area_p10
  %10 = bitcast i8* %overflow_arg_area11 to i64*
  %overflow_arg_area.next12 = getelementptr i8* %overflow_arg_area11, i32 8
  store i8* %overflow_arg_area.next12, i8** %overflow_arg_area_p10
  br label %vaarg.end13

vaarg.end13:                                      ; preds = %vaarg.in_mem9, %vaarg.in_reg7
  %vaarg.addr14 = phi i64* [ %8, %vaarg.in_reg7 ], [ %10, %vaarg.in_mem9 ]
  %11 = load i64* %vaarg.addr14
  %cmp15 = icmp ne i64 %11, 11
  br i1 %cmp15, label %if.then16, label %if.end17

if.then16:                                        ; preds = %vaarg.end13
  call void @abort() noreturn nounwind
  unreachable

if.end17:                                         ; preds = %vaarg.end13
  %arraydecay18 = getelementptr inbounds [1 x %struct.__va_list_tag]* %select, i32 0, i32 0
  %gp_offset_p19 = getelementptr inbounds %struct.__va_list_tag* %arraydecay18, i32 0, i32 0
  %gp_offset20 = load i32* %gp_offset_p19
  %fits_in_gp21 = icmp ule i32 %gp_offset20, 40
  br i1 %fits_in_gp21, label %vaarg.in_reg22, label %vaarg.in_mem24

vaarg.in_reg22:                                   ; preds = %if.end17
  %12 = getelementptr inbounds %struct.__va_list_tag* %arraydecay18, i32 0, i32 3
  %reg_save_area23 = load i8** %12
  %13 = getelementptr i8* %reg_save_area23, i32 %gp_offset20
  %14 = bitcast i8* %13 to i64*
  %15 = add i32 %gp_offset20, 8
  store i32 %15, i32* %gp_offset_p19
  br label %vaarg.end28

vaarg.in_mem24:                                   ; preds = %if.end17
  %overflow_arg_area_p25 = getelementptr inbounds %struct.__va_list_tag* %arraydecay18, i32 0, i32 2
  %overflow_arg_area26 = load i8** %overflow_arg_area_p25
  %16 = bitcast i8* %overflow_arg_area26 to i64*
  %overflow_arg_area.next27 = getelementptr i8* %overflow_arg_area26, i32 8
  store i8* %overflow_arg_area.next27, i8** %overflow_arg_area_p25
  br label %vaarg.end28

vaarg.end28:                                      ; preds = %vaarg.in_mem24, %vaarg.in_reg22
  %vaarg.addr29 = phi i64* [ %14, %vaarg.in_reg22 ], [ %16, %vaarg.in_mem24 ]
  %17 = load i64* %vaarg.addr29
  %cmp30 = icmp ne i64 %17, 0
  br i1 %cmp30, label %if.then31, label %if.end32

if.then31:                                        ; preds = %vaarg.end28
  call void @abort() noreturn nounwind
  unreachable

if.end32:                                         ; preds = %vaarg.end28
  %arraydecay33 = getelementptr inbounds [1 x %struct.__va_list_tag]* %select, i32 0, i32 0
  %arraydecay3334 = bitcast %struct.__va_list_tag* %arraydecay33 to i8*
  call void @llvm.va_end(i8* %arraydecay3334)
  ret void
}

declare void @llvm.va_start(i8*) nounwind

declare void @abort() noreturn nounwind

declare void @llvm.va_end(i8*) nounwind

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  call void (i64, i64, i64, i64, i64, i64, i64, i64, i64, ...)* @f(i64 1, i64 2, i64 3, i64 4, i64 5, i64 6, i64 7, i64 8, i64 9, i64 10, i64 11, i64 0)
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

declare void @exit(i32) noreturn nounwind
