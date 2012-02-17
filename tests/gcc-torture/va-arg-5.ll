; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/va-arg-5.c'
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

define void @va_double(i32 %n, ...) nounwind uwtable {
entry:
  %n.addr = alloca i32, align 4
  %args = alloca [1 x %struct.__va_list_tag], align 16
  store i32 %n, i32* %n.addr, align 4
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %args, i32 0, i32 0
  %arraydecay1 = bitcast %struct.__va_list_tag* %arraydecay to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %arraydecay2 = getelementptr inbounds [1 x %struct.__va_list_tag]* %args, i32 0, i32 0
  %fp_offset_p = getelementptr inbounds %struct.__va_list_tag* %arraydecay2, i32 0, i32 1
  %fp_offset = load i32* %fp_offset_p
  %fits_in_fp = icmp ule i32 %fp_offset, 160
  br i1 %fits_in_fp, label %vaarg.in_reg, label %vaarg.in_mem

vaarg.in_reg:                                     ; preds = %entry
  %0 = getelementptr inbounds %struct.__va_list_tag* %arraydecay2, i32 0, i32 3
  %reg_save_area = load i8** %0
  %1 = getelementptr i8* %reg_save_area, i32 %fp_offset
  %2 = bitcast i8* %1 to double*
  %3 = add i32 %fp_offset, 16
  store i32 %3, i32* %fp_offset_p
  br label %vaarg.end

vaarg.in_mem:                                     ; preds = %entry
  %overflow_arg_area_p = getelementptr inbounds %struct.__va_list_tag* %arraydecay2, i32 0, i32 2
  %overflow_arg_area = load i8** %overflow_arg_area_p
  %4 = bitcast i8* %overflow_arg_area to double*
  %overflow_arg_area.next = getelementptr i8* %overflow_arg_area, i32 8
  store i8* %overflow_arg_area.next, i8** %overflow_arg_area_p
  br label %vaarg.end

vaarg.end:                                        ; preds = %vaarg.in_mem, %vaarg.in_reg
  %vaarg.addr = phi double* [ %2, %vaarg.in_reg ], [ %4, %vaarg.in_mem ]
  %5 = load double* %vaarg.addr
  %cmp = fcmp une double %5, 3.141592e+00
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %vaarg.end
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %vaarg.end
  %arraydecay3 = getelementptr inbounds [1 x %struct.__va_list_tag]* %args, i32 0, i32 0
  %fp_offset_p4 = getelementptr inbounds %struct.__va_list_tag* %arraydecay3, i32 0, i32 1
  %fp_offset5 = load i32* %fp_offset_p4
  %fits_in_fp6 = icmp ule i32 %fp_offset5, 160
  br i1 %fits_in_fp6, label %vaarg.in_reg7, label %vaarg.in_mem9

vaarg.in_reg7:                                    ; preds = %if.end
  %6 = getelementptr inbounds %struct.__va_list_tag* %arraydecay3, i32 0, i32 3
  %reg_save_area8 = load i8** %6
  %7 = getelementptr i8* %reg_save_area8, i32 %fp_offset5
  %8 = bitcast i8* %7 to double*
  %9 = add i32 %fp_offset5, 16
  store i32 %9, i32* %fp_offset_p4
  br label %vaarg.end13

vaarg.in_mem9:                                    ; preds = %if.end
  %overflow_arg_area_p10 = getelementptr inbounds %struct.__va_list_tag* %arraydecay3, i32 0, i32 2
  %overflow_arg_area11 = load i8** %overflow_arg_area_p10
  %10 = bitcast i8* %overflow_arg_area11 to double*
  %overflow_arg_area.next12 = getelementptr i8* %overflow_arg_area11, i32 8
  store i8* %overflow_arg_area.next12, i8** %overflow_arg_area_p10
  br label %vaarg.end13

vaarg.end13:                                      ; preds = %vaarg.in_mem9, %vaarg.in_reg7
  %vaarg.addr14 = phi double* [ %8, %vaarg.in_reg7 ], [ %10, %vaarg.in_mem9 ]
  %11 = load double* %vaarg.addr14
  %cmp15 = fcmp une double %11, 2.718270e+00
  br i1 %cmp15, label %if.then16, label %if.end17

if.then16:                                        ; preds = %vaarg.end13
  call void @abort() noreturn nounwind
  unreachable

if.end17:                                         ; preds = %vaarg.end13
  %arraydecay18 = getelementptr inbounds [1 x %struct.__va_list_tag]* %args, i32 0, i32 0
  %fp_offset_p19 = getelementptr inbounds %struct.__va_list_tag* %arraydecay18, i32 0, i32 1
  %fp_offset20 = load i32* %fp_offset_p19
  %fits_in_fp21 = icmp ule i32 %fp_offset20, 160
  br i1 %fits_in_fp21, label %vaarg.in_reg22, label %vaarg.in_mem24

vaarg.in_reg22:                                   ; preds = %if.end17
  %12 = getelementptr inbounds %struct.__va_list_tag* %arraydecay18, i32 0, i32 3
  %reg_save_area23 = load i8** %12
  %13 = getelementptr i8* %reg_save_area23, i32 %fp_offset20
  %14 = bitcast i8* %13 to double*
  %15 = add i32 %fp_offset20, 16
  store i32 %15, i32* %fp_offset_p19
  br label %vaarg.end28

vaarg.in_mem24:                                   ; preds = %if.end17
  %overflow_arg_area_p25 = getelementptr inbounds %struct.__va_list_tag* %arraydecay18, i32 0, i32 2
  %overflow_arg_area26 = load i8** %overflow_arg_area_p25
  %16 = bitcast i8* %overflow_arg_area26 to double*
  %overflow_arg_area.next27 = getelementptr i8* %overflow_arg_area26, i32 8
  store i8* %overflow_arg_area.next27, i8** %overflow_arg_area_p25
  br label %vaarg.end28

vaarg.end28:                                      ; preds = %vaarg.in_mem24, %vaarg.in_reg22
  %vaarg.addr29 = phi double* [ %14, %vaarg.in_reg22 ], [ %16, %vaarg.in_mem24 ]
  %17 = load double* %vaarg.addr29
  %cmp30 = fcmp une double %17, 0x4001E3779131154C
  br i1 %cmp30, label %if.then31, label %if.end32

if.then31:                                        ; preds = %vaarg.end28
  call void @abort() noreturn nounwind
  unreachable

if.end32:                                         ; preds = %vaarg.end28
  %arraydecay33 = getelementptr inbounds [1 x %struct.__va_list_tag]* %args, i32 0, i32 0
  %fp_offset_p34 = getelementptr inbounds %struct.__va_list_tag* %arraydecay33, i32 0, i32 1
  %fp_offset35 = load i32* %fp_offset_p34
  %fits_in_fp36 = icmp ule i32 %fp_offset35, 160
  br i1 %fits_in_fp36, label %vaarg.in_reg37, label %vaarg.in_mem39

vaarg.in_reg37:                                   ; preds = %if.end32
  %18 = getelementptr inbounds %struct.__va_list_tag* %arraydecay33, i32 0, i32 3
  %reg_save_area38 = load i8** %18
  %19 = getelementptr i8* %reg_save_area38, i32 %fp_offset35
  %20 = bitcast i8* %19 to double*
  %21 = add i32 %fp_offset35, 16
  store i32 %21, i32* %fp_offset_p34
  br label %vaarg.end43

vaarg.in_mem39:                                   ; preds = %if.end32
  %overflow_arg_area_p40 = getelementptr inbounds %struct.__va_list_tag* %arraydecay33, i32 0, i32 2
  %overflow_arg_area41 = load i8** %overflow_arg_area_p40
  %22 = bitcast i8* %overflow_arg_area41 to double*
  %overflow_arg_area.next42 = getelementptr i8* %overflow_arg_area41, i32 8
  store i8* %overflow_arg_area.next42, i8** %overflow_arg_area_p40
  br label %vaarg.end43

vaarg.end43:                                      ; preds = %vaarg.in_mem39, %vaarg.in_reg37
  %vaarg.addr44 = phi double* [ %20, %vaarg.in_reg37 ], [ %22, %vaarg.in_mem39 ]
  %23 = load double* %vaarg.addr44
  %cmp45 = fcmp une double %23, 0x40012E0BE1B5921E
  br i1 %cmp45, label %if.then46, label %if.end47

if.then46:                                        ; preds = %vaarg.end43
  call void @abort() noreturn nounwind
  unreachable

if.end47:                                         ; preds = %vaarg.end43
  %arraydecay48 = getelementptr inbounds [1 x %struct.__va_list_tag]* %args, i32 0, i32 0
  %arraydecay4849 = bitcast %struct.__va_list_tag* %arraydecay48 to i8*
  call void @llvm.va_end(i8* %arraydecay4849)
  ret void
}

declare void @llvm.va_start(i8*) nounwind

declare void @abort() noreturn nounwind

declare void @llvm.va_end(i8*) nounwind

define void @va_long_double(i32 %n, ...) nounwind uwtable {
entry:
  %n.addr = alloca i32, align 4
  %args = alloca [1 x %struct.__va_list_tag], align 16
  store i32 %n, i32* %n.addr, align 4
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %args, i32 0, i32 0
  %arraydecay1 = bitcast %struct.__va_list_tag* %arraydecay to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %arraydecay2 = getelementptr inbounds [1 x %struct.__va_list_tag]* %args, i32 0, i32 0
  %overflow_arg_area_p = getelementptr inbounds %struct.__va_list_tag* %arraydecay2, i32 0, i32 2
  %overflow_arg_area = load i8** %overflow_arg_area_p
  %0 = getelementptr i8* %overflow_arg_area, i32 15
  %1 = ptrtoint i8* %0 to i64
  %2 = and i64 %1, -16
  %overflow_arg_area.align = inttoptr i64 %2 to i8*
  %3 = bitcast i8* %overflow_arg_area.align to x86_fp80*
  %overflow_arg_area.next = getelementptr i8* %overflow_arg_area.align, i32 16
  store i8* %overflow_arg_area.next, i8** %overflow_arg_area_p
  %4 = load x86_fp80* %3
  %cmp = fcmp une x86_fp80 %4, 0xK4000C90FD7E45803CD14
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  %arraydecay3 = getelementptr inbounds [1 x %struct.__va_list_tag]* %args, i32 0, i32 0
  %overflow_arg_area_p4 = getelementptr inbounds %struct.__va_list_tag* %arraydecay3, i32 0, i32 2
  %overflow_arg_area5 = load i8** %overflow_arg_area_p4
  %5 = getelementptr i8* %overflow_arg_area5, i32 15
  %6 = ptrtoint i8* %5 to i64
  %7 = and i64 %6, -16
  %overflow_arg_area.align6 = inttoptr i64 %7 to i8*
  %8 = bitcast i8* %overflow_arg_area.align6 to x86_fp80*
  %overflow_arg_area.next7 = getelementptr i8* %overflow_arg_area.align6, i32 16
  store i8* %overflow_arg_area.next7, i8** %overflow_arg_area_p4
  %9 = load x86_fp80* %8
  %cmp8 = fcmp une x86_fp80 %9, 0xK4000ADF822BBECAAB8A6
  br i1 %cmp8, label %if.then9, label %if.end10

if.then9:                                         ; preds = %if.end
  call void @abort() noreturn nounwind
  unreachable

if.end10:                                         ; preds = %if.end
  %arraydecay11 = getelementptr inbounds [1 x %struct.__va_list_tag]* %args, i32 0, i32 0
  %overflow_arg_area_p12 = getelementptr inbounds %struct.__va_list_tag* %arraydecay11, i32 0, i32 2
  %overflow_arg_area13 = load i8** %overflow_arg_area_p12
  %10 = getelementptr i8* %overflow_arg_area13, i32 15
  %11 = ptrtoint i8* %10 to i64
  %12 = and i64 %11, -16
  %overflow_arg_area.align14 = inttoptr i64 %12 to i8*
  %13 = bitcast i8* %overflow_arg_area.align14 to x86_fp80*
  %overflow_arg_area.next15 = getelementptr i8* %overflow_arg_area.align14, i32 16
  store i8* %overflow_arg_area.next15, i8** %overflow_arg_area_p12
  %14 = load x86_fp80* %13
  %cmp16 = fcmp une x86_fp80 %14, 0xK40008F1BBC8988AA5E0D
  br i1 %cmp16, label %if.then17, label %if.end18

if.then17:                                        ; preds = %if.end10
  call void @abort() noreturn nounwind
  unreachable

if.end18:                                         ; preds = %if.end10
  %arraydecay19 = getelementptr inbounds [1 x %struct.__va_list_tag]* %args, i32 0, i32 0
  %overflow_arg_area_p20 = getelementptr inbounds %struct.__va_list_tag* %arraydecay19, i32 0, i32 2
  %overflow_arg_area21 = load i8** %overflow_arg_area_p20
  %15 = getelementptr i8* %overflow_arg_area21, i32 15
  %16 = ptrtoint i8* %15 to i64
  %17 = and i64 %16, -16
  %overflow_arg_area.align22 = inttoptr i64 %17 to i8*
  %18 = bitcast i8* %overflow_arg_area.align22 to x86_fp80*
  %overflow_arg_area.next23 = getelementptr i8* %overflow_arg_area.align22, i32 16
  store i8* %overflow_arg_area.next23, i8** %overflow_arg_area_p20
  %19 = load x86_fp80* %18
  %cmp24 = fcmp une x86_fp80 %19, 0xK400089705F0DAC90ED23
  br i1 %cmp24, label %if.then25, label %if.end26

if.then25:                                        ; preds = %if.end18
  call void @abort() noreturn nounwind
  unreachable

if.end26:                                         ; preds = %if.end18
  %arraydecay27 = getelementptr inbounds [1 x %struct.__va_list_tag]* %args, i32 0, i32 0
  %arraydecay2728 = bitcast %struct.__va_list_tag* %arraydecay27 to i8*
  call void @llvm.va_end(i8* %arraydecay2728)
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  call void (i32, ...)* @va_double(i32 4, double 3.141592e+00, double 2.718270e+00, double 0x4001E3779131154C, double 0x40012E0BE1B5921E)
  call void (i32, ...)* @va_long_double(i32 4, x86_fp80 0xK4000C90FD7E45803CD14, x86_fp80 0xK4000ADF822BBECAAB8A6, x86_fp80 0xK40008F1BBC8988AA5E0D, x86_fp80 0xK400089705F0DAC90ED23)
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

declare void @exit(i32) noreturn nounwind
