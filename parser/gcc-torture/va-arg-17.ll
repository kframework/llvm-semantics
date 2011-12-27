; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/va-arg-17.c'
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
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  store i8* %dummy, i8** %dummy.addr, align 8
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %arraydecay1 = bitcast %struct.__va_list_tag* %arraydecay to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %arraydecay2 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
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
  %cmp = fcmp une double %5, 1.000000e+00
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %vaarg.end
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %vaarg.end
  %arraydecay3 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
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
  %cmp15 = fcmp une double %11, 2.000000e+00
  br i1 %cmp15, label %if.then16, label %if.end17

if.then16:                                        ; preds = %vaarg.end13
  call void @abort() noreturn nounwind
  unreachable

if.end17:                                         ; preds = %vaarg.end13
  %arraydecay18 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
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
  %cmp30 = fcmp une double %17, 3.000000e+00
  br i1 %cmp30, label %if.then31, label %if.end32

if.then31:                                        ; preds = %vaarg.end28
  call void @abort() noreturn nounwind
  unreachable

if.end32:                                         ; preds = %vaarg.end28
  %arraydecay33 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
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
  %cmp45 = fcmp une double %23, 4.000000e+00
  br i1 %cmp45, label %if.then46, label %if.end47

if.then46:                                        ; preds = %vaarg.end43
  call void @abort() noreturn nounwind
  unreachable

if.end47:                                         ; preds = %vaarg.end43
  %arraydecay48 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %fp_offset_p49 = getelementptr inbounds %struct.__va_list_tag* %arraydecay48, i32 0, i32 1
  %fp_offset50 = load i32* %fp_offset_p49
  %fits_in_fp51 = icmp ule i32 %fp_offset50, 160
  br i1 %fits_in_fp51, label %vaarg.in_reg52, label %vaarg.in_mem54

vaarg.in_reg52:                                   ; preds = %if.end47
  %24 = getelementptr inbounds %struct.__va_list_tag* %arraydecay48, i32 0, i32 3
  %reg_save_area53 = load i8** %24
  %25 = getelementptr i8* %reg_save_area53, i32 %fp_offset50
  %26 = bitcast i8* %25 to double*
  %27 = add i32 %fp_offset50, 16
  store i32 %27, i32* %fp_offset_p49
  br label %vaarg.end58

vaarg.in_mem54:                                   ; preds = %if.end47
  %overflow_arg_area_p55 = getelementptr inbounds %struct.__va_list_tag* %arraydecay48, i32 0, i32 2
  %overflow_arg_area56 = load i8** %overflow_arg_area_p55
  %28 = bitcast i8* %overflow_arg_area56 to double*
  %overflow_arg_area.next57 = getelementptr i8* %overflow_arg_area56, i32 8
  store i8* %overflow_arg_area.next57, i8** %overflow_arg_area_p55
  br label %vaarg.end58

vaarg.end58:                                      ; preds = %vaarg.in_mem54, %vaarg.in_reg52
  %vaarg.addr59 = phi double* [ %26, %vaarg.in_reg52 ], [ %28, %vaarg.in_mem54 ]
  %29 = load double* %vaarg.addr59
  %cmp60 = fcmp une double %29, 5.000000e+00
  br i1 %cmp60, label %if.then61, label %if.end62

if.then61:                                        ; preds = %vaarg.end58
  call void @abort() noreturn nounwind
  unreachable

if.end62:                                         ; preds = %vaarg.end58
  %arraydecay63 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %fp_offset_p64 = getelementptr inbounds %struct.__va_list_tag* %arraydecay63, i32 0, i32 1
  %fp_offset65 = load i32* %fp_offset_p64
  %fits_in_fp66 = icmp ule i32 %fp_offset65, 160
  br i1 %fits_in_fp66, label %vaarg.in_reg67, label %vaarg.in_mem69

vaarg.in_reg67:                                   ; preds = %if.end62
  %30 = getelementptr inbounds %struct.__va_list_tag* %arraydecay63, i32 0, i32 3
  %reg_save_area68 = load i8** %30
  %31 = getelementptr i8* %reg_save_area68, i32 %fp_offset65
  %32 = bitcast i8* %31 to double*
  %33 = add i32 %fp_offset65, 16
  store i32 %33, i32* %fp_offset_p64
  br label %vaarg.end73

vaarg.in_mem69:                                   ; preds = %if.end62
  %overflow_arg_area_p70 = getelementptr inbounds %struct.__va_list_tag* %arraydecay63, i32 0, i32 2
  %overflow_arg_area71 = load i8** %overflow_arg_area_p70
  %34 = bitcast i8* %overflow_arg_area71 to double*
  %overflow_arg_area.next72 = getelementptr i8* %overflow_arg_area71, i32 8
  store i8* %overflow_arg_area.next72, i8** %overflow_arg_area_p70
  br label %vaarg.end73

vaarg.end73:                                      ; preds = %vaarg.in_mem69, %vaarg.in_reg67
  %vaarg.addr74 = phi double* [ %32, %vaarg.in_reg67 ], [ %34, %vaarg.in_mem69 ]
  %35 = load double* %vaarg.addr74
  %cmp75 = fcmp une double %35, 6.000000e+00
  br i1 %cmp75, label %if.then76, label %if.end77

if.then76:                                        ; preds = %vaarg.end73
  call void @abort() noreturn nounwind
  unreachable

if.end77:                                         ; preds = %vaarg.end73
  %arraydecay78 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %fp_offset_p79 = getelementptr inbounds %struct.__va_list_tag* %arraydecay78, i32 0, i32 1
  %fp_offset80 = load i32* %fp_offset_p79
  %fits_in_fp81 = icmp ule i32 %fp_offset80, 160
  br i1 %fits_in_fp81, label %vaarg.in_reg82, label %vaarg.in_mem84

vaarg.in_reg82:                                   ; preds = %if.end77
  %36 = getelementptr inbounds %struct.__va_list_tag* %arraydecay78, i32 0, i32 3
  %reg_save_area83 = load i8** %36
  %37 = getelementptr i8* %reg_save_area83, i32 %fp_offset80
  %38 = bitcast i8* %37 to double*
  %39 = add i32 %fp_offset80, 16
  store i32 %39, i32* %fp_offset_p79
  br label %vaarg.end88

vaarg.in_mem84:                                   ; preds = %if.end77
  %overflow_arg_area_p85 = getelementptr inbounds %struct.__va_list_tag* %arraydecay78, i32 0, i32 2
  %overflow_arg_area86 = load i8** %overflow_arg_area_p85
  %40 = bitcast i8* %overflow_arg_area86 to double*
  %overflow_arg_area.next87 = getelementptr i8* %overflow_arg_area86, i32 8
  store i8* %overflow_arg_area.next87, i8** %overflow_arg_area_p85
  br label %vaarg.end88

vaarg.end88:                                      ; preds = %vaarg.in_mem84, %vaarg.in_reg82
  %vaarg.addr89 = phi double* [ %38, %vaarg.in_reg82 ], [ %40, %vaarg.in_mem84 ]
  %41 = load double* %vaarg.addr89
  %cmp90 = fcmp une double %41, 7.000000e+00
  br i1 %cmp90, label %if.then91, label %if.end92

if.then91:                                        ; preds = %vaarg.end88
  call void @abort() noreturn nounwind
  unreachable

if.end92:                                         ; preds = %vaarg.end88
  %arraydecay93 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %fp_offset_p94 = getelementptr inbounds %struct.__va_list_tag* %arraydecay93, i32 0, i32 1
  %fp_offset95 = load i32* %fp_offset_p94
  %fits_in_fp96 = icmp ule i32 %fp_offset95, 160
  br i1 %fits_in_fp96, label %vaarg.in_reg97, label %vaarg.in_mem99

vaarg.in_reg97:                                   ; preds = %if.end92
  %42 = getelementptr inbounds %struct.__va_list_tag* %arraydecay93, i32 0, i32 3
  %reg_save_area98 = load i8** %42
  %43 = getelementptr i8* %reg_save_area98, i32 %fp_offset95
  %44 = bitcast i8* %43 to double*
  %45 = add i32 %fp_offset95, 16
  store i32 %45, i32* %fp_offset_p94
  br label %vaarg.end103

vaarg.in_mem99:                                   ; preds = %if.end92
  %overflow_arg_area_p100 = getelementptr inbounds %struct.__va_list_tag* %arraydecay93, i32 0, i32 2
  %overflow_arg_area101 = load i8** %overflow_arg_area_p100
  %46 = bitcast i8* %overflow_arg_area101 to double*
  %overflow_arg_area.next102 = getelementptr i8* %overflow_arg_area101, i32 8
  store i8* %overflow_arg_area.next102, i8** %overflow_arg_area_p100
  br label %vaarg.end103

vaarg.end103:                                     ; preds = %vaarg.in_mem99, %vaarg.in_reg97
  %vaarg.addr104 = phi double* [ %44, %vaarg.in_reg97 ], [ %46, %vaarg.in_mem99 ]
  %47 = load double* %vaarg.addr104
  %cmp105 = fcmp une double %47, 8.000000e+00
  br i1 %cmp105, label %if.then106, label %if.end107

if.then106:                                       ; preds = %vaarg.end103
  call void @abort() noreturn nounwind
  unreachable

if.end107:                                        ; preds = %vaarg.end103
  %arraydecay108 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %fp_offset_p109 = getelementptr inbounds %struct.__va_list_tag* %arraydecay108, i32 0, i32 1
  %fp_offset110 = load i32* %fp_offset_p109
  %fits_in_fp111 = icmp ule i32 %fp_offset110, 160
  br i1 %fits_in_fp111, label %vaarg.in_reg112, label %vaarg.in_mem114

vaarg.in_reg112:                                  ; preds = %if.end107
  %48 = getelementptr inbounds %struct.__va_list_tag* %arraydecay108, i32 0, i32 3
  %reg_save_area113 = load i8** %48
  %49 = getelementptr i8* %reg_save_area113, i32 %fp_offset110
  %50 = bitcast i8* %49 to double*
  %51 = add i32 %fp_offset110, 16
  store i32 %51, i32* %fp_offset_p109
  br label %vaarg.end118

vaarg.in_mem114:                                  ; preds = %if.end107
  %overflow_arg_area_p115 = getelementptr inbounds %struct.__va_list_tag* %arraydecay108, i32 0, i32 2
  %overflow_arg_area116 = load i8** %overflow_arg_area_p115
  %52 = bitcast i8* %overflow_arg_area116 to double*
  %overflow_arg_area.next117 = getelementptr i8* %overflow_arg_area116, i32 8
  store i8* %overflow_arg_area.next117, i8** %overflow_arg_area_p115
  br label %vaarg.end118

vaarg.end118:                                     ; preds = %vaarg.in_mem114, %vaarg.in_reg112
  %vaarg.addr119 = phi double* [ %50, %vaarg.in_reg112 ], [ %52, %vaarg.in_mem114 ]
  %53 = load double* %vaarg.addr119
  %cmp120 = fcmp une double %53, 9.000000e+00
  br i1 %cmp120, label %if.then121, label %if.end122

if.then121:                                       ; preds = %vaarg.end118
  call void @abort() noreturn nounwind
  unreachable

if.end122:                                        ; preds = %vaarg.end118
  %arraydecay123 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %arraydecay123124 = bitcast %struct.__va_list_tag* %arraydecay123 to i8*
  call void @llvm.va_end(i8* %arraydecay123124)
  ret void
}

declare void @llvm.va_start(i8*) nounwind

declare void @abort() noreturn nounwind

declare void @llvm.va_end(i8*) nounwind

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  call void (i8*, ...)* @vafunction(i8* getelementptr inbounds ([1 x i8]* @.str, i32 0, i32 0), double 1.000000e+00, double 2.000000e+00, double 3.000000e+00, double 4.000000e+00, double 5.000000e+00, double 6.000000e+00, double 7.000000e+00, double 8.000000e+00, double 9.000000e+00)
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

declare void @exit(i32) noreturn nounwind
