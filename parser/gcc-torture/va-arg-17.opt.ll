; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/va-arg-17.ll'
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
  %fp_offset_p = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 1
  %fp_offset = load i32* %fp_offset_p, align 4
  %fits_in_fp = icmp ult i32 %fp_offset, 161
  br i1 %fits_in_fp, label %vaarg.in_reg, label %vaarg.in_mem

vaarg.in_reg:                                     ; preds = %entry
  %0 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 3
  %reg_save_area = load i8** %0, align 16
  %1 = sext i32 %fp_offset to i64
  %2 = getelementptr i8* %reg_save_area, i64 %1
  %3 = add i32 %fp_offset, 16
  store i32 %3, i32* %fp_offset_p, align 4
  br label %vaarg.end

vaarg.in_mem:                                     ; preds = %entry
  %overflow_arg_area_p = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 2
  %overflow_arg_area = load i8** %overflow_arg_area_p, align 8
  %overflow_arg_area.next = getelementptr i8* %overflow_arg_area, i64 8
  store i8* %overflow_arg_area.next, i8** %overflow_arg_area_p, align 8
  br label %vaarg.end

vaarg.end:                                        ; preds = %vaarg.in_mem, %vaarg.in_reg
  %fp_offset5 = phi i32 [ %3, %vaarg.in_reg ], [ %fp_offset, %vaarg.in_mem ]
  %vaarg.addr.in = phi i8* [ %2, %vaarg.in_reg ], [ %overflow_arg_area, %vaarg.in_mem ]
  %vaarg.addr = bitcast i8* %vaarg.addr.in to double*
  %4 = load double* %vaarg.addr, align 8
  %cmp = fcmp une double %4, 1.000000e+00
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %vaarg.end
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %vaarg.end
  %fits_in_fp6 = icmp ult i32 %fp_offset5, 161
  br i1 %fits_in_fp6, label %vaarg.in_reg7, label %vaarg.in_mem9

vaarg.in_reg7:                                    ; preds = %if.end
  %5 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 3
  %reg_save_area8 = load i8** %5, align 16
  %6 = sext i32 %fp_offset5 to i64
  %7 = getelementptr i8* %reg_save_area8, i64 %6
  %8 = add i32 %fp_offset5, 16
  store i32 %8, i32* %fp_offset_p, align 4
  br label %vaarg.end13

vaarg.in_mem9:                                    ; preds = %if.end
  %overflow_arg_area_p10 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 2
  %overflow_arg_area11 = load i8** %overflow_arg_area_p10, align 8
  %overflow_arg_area.next12 = getelementptr i8* %overflow_arg_area11, i64 8
  store i8* %overflow_arg_area.next12, i8** %overflow_arg_area_p10, align 8
  br label %vaarg.end13

vaarg.end13:                                      ; preds = %vaarg.in_mem9, %vaarg.in_reg7
  %fp_offset20 = phi i32 [ %8, %vaarg.in_reg7 ], [ %fp_offset5, %vaarg.in_mem9 ]
  %vaarg.addr14.in = phi i8* [ %7, %vaarg.in_reg7 ], [ %overflow_arg_area11, %vaarg.in_mem9 ]
  %vaarg.addr14 = bitcast i8* %vaarg.addr14.in to double*
  %9 = load double* %vaarg.addr14, align 8
  %cmp15 = fcmp une double %9, 2.000000e+00
  br i1 %cmp15, label %if.then16, label %if.end17

if.then16:                                        ; preds = %vaarg.end13
  call void @abort() noreturn nounwind
  unreachable

if.end17:                                         ; preds = %vaarg.end13
  %fits_in_fp21 = icmp ult i32 %fp_offset20, 161
  br i1 %fits_in_fp21, label %vaarg.in_reg22, label %vaarg.in_mem24

vaarg.in_reg22:                                   ; preds = %if.end17
  %10 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 3
  %reg_save_area23 = load i8** %10, align 16
  %11 = sext i32 %fp_offset20 to i64
  %12 = getelementptr i8* %reg_save_area23, i64 %11
  %13 = add i32 %fp_offset20, 16
  store i32 %13, i32* %fp_offset_p, align 4
  br label %vaarg.end28

vaarg.in_mem24:                                   ; preds = %if.end17
  %overflow_arg_area_p25 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 2
  %overflow_arg_area26 = load i8** %overflow_arg_area_p25, align 8
  %overflow_arg_area.next27 = getelementptr i8* %overflow_arg_area26, i64 8
  store i8* %overflow_arg_area.next27, i8** %overflow_arg_area_p25, align 8
  br label %vaarg.end28

vaarg.end28:                                      ; preds = %vaarg.in_mem24, %vaarg.in_reg22
  %fp_offset35 = phi i32 [ %13, %vaarg.in_reg22 ], [ %fp_offset20, %vaarg.in_mem24 ]
  %vaarg.addr29.in = phi i8* [ %12, %vaarg.in_reg22 ], [ %overflow_arg_area26, %vaarg.in_mem24 ]
  %vaarg.addr29 = bitcast i8* %vaarg.addr29.in to double*
  %14 = load double* %vaarg.addr29, align 8
  %cmp30 = fcmp une double %14, 3.000000e+00
  br i1 %cmp30, label %if.then31, label %if.end32

if.then31:                                        ; preds = %vaarg.end28
  call void @abort() noreturn nounwind
  unreachable

if.end32:                                         ; preds = %vaarg.end28
  %fits_in_fp36 = icmp ult i32 %fp_offset35, 161
  br i1 %fits_in_fp36, label %vaarg.in_reg37, label %vaarg.in_mem39

vaarg.in_reg37:                                   ; preds = %if.end32
  %15 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 3
  %reg_save_area38 = load i8** %15, align 16
  %16 = sext i32 %fp_offset35 to i64
  %17 = getelementptr i8* %reg_save_area38, i64 %16
  %18 = add i32 %fp_offset35, 16
  store i32 %18, i32* %fp_offset_p, align 4
  br label %vaarg.end43

vaarg.in_mem39:                                   ; preds = %if.end32
  %overflow_arg_area_p40 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 2
  %overflow_arg_area41 = load i8** %overflow_arg_area_p40, align 8
  %overflow_arg_area.next42 = getelementptr i8* %overflow_arg_area41, i64 8
  store i8* %overflow_arg_area.next42, i8** %overflow_arg_area_p40, align 8
  br label %vaarg.end43

vaarg.end43:                                      ; preds = %vaarg.in_mem39, %vaarg.in_reg37
  %fp_offset50 = phi i32 [ %18, %vaarg.in_reg37 ], [ %fp_offset35, %vaarg.in_mem39 ]
  %vaarg.addr44.in = phi i8* [ %17, %vaarg.in_reg37 ], [ %overflow_arg_area41, %vaarg.in_mem39 ]
  %vaarg.addr44 = bitcast i8* %vaarg.addr44.in to double*
  %19 = load double* %vaarg.addr44, align 8
  %cmp45 = fcmp une double %19, 4.000000e+00
  br i1 %cmp45, label %if.then46, label %if.end47

if.then46:                                        ; preds = %vaarg.end43
  call void @abort() noreturn nounwind
  unreachable

if.end47:                                         ; preds = %vaarg.end43
  %fits_in_fp51 = icmp ult i32 %fp_offset50, 161
  br i1 %fits_in_fp51, label %vaarg.in_reg52, label %vaarg.in_mem54

vaarg.in_reg52:                                   ; preds = %if.end47
  %20 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 3
  %reg_save_area53 = load i8** %20, align 16
  %21 = sext i32 %fp_offset50 to i64
  %22 = getelementptr i8* %reg_save_area53, i64 %21
  %23 = add i32 %fp_offset50, 16
  store i32 %23, i32* %fp_offset_p, align 4
  br label %vaarg.end58

vaarg.in_mem54:                                   ; preds = %if.end47
  %overflow_arg_area_p55 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 2
  %overflow_arg_area56 = load i8** %overflow_arg_area_p55, align 8
  %overflow_arg_area.next57 = getelementptr i8* %overflow_arg_area56, i64 8
  store i8* %overflow_arg_area.next57, i8** %overflow_arg_area_p55, align 8
  br label %vaarg.end58

vaarg.end58:                                      ; preds = %vaarg.in_mem54, %vaarg.in_reg52
  %fp_offset65 = phi i32 [ %23, %vaarg.in_reg52 ], [ %fp_offset50, %vaarg.in_mem54 ]
  %vaarg.addr59.in = phi i8* [ %22, %vaarg.in_reg52 ], [ %overflow_arg_area56, %vaarg.in_mem54 ]
  %vaarg.addr59 = bitcast i8* %vaarg.addr59.in to double*
  %24 = load double* %vaarg.addr59, align 8
  %cmp60 = fcmp une double %24, 5.000000e+00
  br i1 %cmp60, label %if.then61, label %if.end62

if.then61:                                        ; preds = %vaarg.end58
  call void @abort() noreturn nounwind
  unreachable

if.end62:                                         ; preds = %vaarg.end58
  %fits_in_fp66 = icmp ult i32 %fp_offset65, 161
  br i1 %fits_in_fp66, label %vaarg.in_reg67, label %vaarg.in_mem69

vaarg.in_reg67:                                   ; preds = %if.end62
  %25 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 3
  %reg_save_area68 = load i8** %25, align 16
  %26 = sext i32 %fp_offset65 to i64
  %27 = getelementptr i8* %reg_save_area68, i64 %26
  %28 = add i32 %fp_offset65, 16
  store i32 %28, i32* %fp_offset_p, align 4
  br label %vaarg.end73

vaarg.in_mem69:                                   ; preds = %if.end62
  %overflow_arg_area_p70 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 2
  %overflow_arg_area71 = load i8** %overflow_arg_area_p70, align 8
  %overflow_arg_area.next72 = getelementptr i8* %overflow_arg_area71, i64 8
  store i8* %overflow_arg_area.next72, i8** %overflow_arg_area_p70, align 8
  br label %vaarg.end73

vaarg.end73:                                      ; preds = %vaarg.in_mem69, %vaarg.in_reg67
  %fp_offset80 = phi i32 [ %28, %vaarg.in_reg67 ], [ %fp_offset65, %vaarg.in_mem69 ]
  %vaarg.addr74.in = phi i8* [ %27, %vaarg.in_reg67 ], [ %overflow_arg_area71, %vaarg.in_mem69 ]
  %vaarg.addr74 = bitcast i8* %vaarg.addr74.in to double*
  %29 = load double* %vaarg.addr74, align 8
  %cmp75 = fcmp une double %29, 6.000000e+00
  br i1 %cmp75, label %if.then76, label %if.end77

if.then76:                                        ; preds = %vaarg.end73
  call void @abort() noreturn nounwind
  unreachable

if.end77:                                         ; preds = %vaarg.end73
  %fits_in_fp81 = icmp ult i32 %fp_offset80, 161
  br i1 %fits_in_fp81, label %vaarg.in_reg82, label %vaarg.in_mem84

vaarg.in_reg82:                                   ; preds = %if.end77
  %30 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 3
  %reg_save_area83 = load i8** %30, align 16
  %31 = sext i32 %fp_offset80 to i64
  %32 = getelementptr i8* %reg_save_area83, i64 %31
  %33 = add i32 %fp_offset80, 16
  store i32 %33, i32* %fp_offset_p, align 4
  br label %vaarg.end88

vaarg.in_mem84:                                   ; preds = %if.end77
  %overflow_arg_area_p85 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 2
  %overflow_arg_area86 = load i8** %overflow_arg_area_p85, align 8
  %overflow_arg_area.next87 = getelementptr i8* %overflow_arg_area86, i64 8
  store i8* %overflow_arg_area.next87, i8** %overflow_arg_area_p85, align 8
  br label %vaarg.end88

vaarg.end88:                                      ; preds = %vaarg.in_mem84, %vaarg.in_reg82
  %fp_offset95 = phi i32 [ %33, %vaarg.in_reg82 ], [ %fp_offset80, %vaarg.in_mem84 ]
  %vaarg.addr89.in = phi i8* [ %32, %vaarg.in_reg82 ], [ %overflow_arg_area86, %vaarg.in_mem84 ]
  %vaarg.addr89 = bitcast i8* %vaarg.addr89.in to double*
  %34 = load double* %vaarg.addr89, align 8
  %cmp90 = fcmp une double %34, 7.000000e+00
  br i1 %cmp90, label %if.then91, label %if.end92

if.then91:                                        ; preds = %vaarg.end88
  call void @abort() noreturn nounwind
  unreachable

if.end92:                                         ; preds = %vaarg.end88
  %fits_in_fp96 = icmp ult i32 %fp_offset95, 161
  br i1 %fits_in_fp96, label %vaarg.in_reg97, label %vaarg.in_mem99

vaarg.in_reg97:                                   ; preds = %if.end92
  %35 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 3
  %reg_save_area98 = load i8** %35, align 16
  %36 = sext i32 %fp_offset95 to i64
  %37 = getelementptr i8* %reg_save_area98, i64 %36
  %38 = add i32 %fp_offset95, 16
  store i32 %38, i32* %fp_offset_p, align 4
  br label %vaarg.end103

vaarg.in_mem99:                                   ; preds = %if.end92
  %overflow_arg_area_p100 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 2
  %overflow_arg_area101 = load i8** %overflow_arg_area_p100, align 8
  %overflow_arg_area.next102 = getelementptr i8* %overflow_arg_area101, i64 8
  store i8* %overflow_arg_area.next102, i8** %overflow_arg_area_p100, align 8
  br label %vaarg.end103

vaarg.end103:                                     ; preds = %vaarg.in_mem99, %vaarg.in_reg97
  %fp_offset110 = phi i32 [ %38, %vaarg.in_reg97 ], [ %fp_offset95, %vaarg.in_mem99 ]
  %vaarg.addr104.in = phi i8* [ %37, %vaarg.in_reg97 ], [ %overflow_arg_area101, %vaarg.in_mem99 ]
  %vaarg.addr104 = bitcast i8* %vaarg.addr104.in to double*
  %39 = load double* %vaarg.addr104, align 8
  %cmp105 = fcmp une double %39, 8.000000e+00
  br i1 %cmp105, label %if.then106, label %if.end107

if.then106:                                       ; preds = %vaarg.end103
  call void @abort() noreturn nounwind
  unreachable

if.end107:                                        ; preds = %vaarg.end103
  %fits_in_fp111 = icmp ult i32 %fp_offset110, 161
  br i1 %fits_in_fp111, label %vaarg.in_reg112, label %vaarg.in_mem114

vaarg.in_reg112:                                  ; preds = %if.end107
  %40 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 3
  %reg_save_area113 = load i8** %40, align 16
  %41 = sext i32 %fp_offset110 to i64
  %42 = getelementptr i8* %reg_save_area113, i64 %41
  %43 = add i32 %fp_offset110, 16
  store i32 %43, i32* %fp_offset_p, align 4
  br label %vaarg.end118

vaarg.in_mem114:                                  ; preds = %if.end107
  %overflow_arg_area_p115 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 2
  %overflow_arg_area116 = load i8** %overflow_arg_area_p115, align 8
  %overflow_arg_area.next117 = getelementptr i8* %overflow_arg_area116, i64 8
  store i8* %overflow_arg_area.next117, i8** %overflow_arg_area_p115, align 8
  br label %vaarg.end118

vaarg.end118:                                     ; preds = %vaarg.in_mem114, %vaarg.in_reg112
  %vaarg.addr119.in = phi i8* [ %42, %vaarg.in_reg112 ], [ %overflow_arg_area116, %vaarg.in_mem114 ]
  %vaarg.addr119 = bitcast i8* %vaarg.addr119.in to double*
  %44 = load double* %vaarg.addr119, align 8
  %cmp120 = fcmp une double %44, 9.000000e+00
  br i1 %cmp120, label %if.then121, label %if.end122

if.then121:                                       ; preds = %vaarg.end118
  call void @abort() noreturn nounwind
  unreachable

if.end122:                                        ; preds = %vaarg.end118
  call void @llvm.va_end(i8* %arraydecay1)
  ret void
}

declare void @llvm.va_start(i8*) nounwind

declare void @abort() noreturn nounwind

declare void @llvm.va_end(i8*) nounwind

define i32 @main() noreturn nounwind uwtable {
entry:
  tail call void (i8*, ...)* @vafunction(i8* getelementptr inbounds ([1 x i8]* @.str, i64 0, i64 0), double 1.000000e+00, double 2.000000e+00, double 3.000000e+00, double 4.000000e+00, double 5.000000e+00, double 6.000000e+00, double 7.000000e+00, double 8.000000e+00, double 9.000000e+00)
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn nounwind
