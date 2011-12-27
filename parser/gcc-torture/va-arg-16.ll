; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/va-arg-16.c'
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

define void @vafunction(double %dummy1, double %dummy2, ...) nounwind uwtable {
entry:
  %dummy1.addr = alloca double, align 8
  %dummy2.addr = alloca double, align 8
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  store double %dummy1, double* %dummy1.addr, align 8
  store double %dummy2, double* %dummy2.addr, align 8
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %arraydecay1 = bitcast %struct.__va_list_tag* %arraydecay to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %tmp = load double* %dummy1.addr, align 8
  %cmp = fcmp une double %tmp, 8.880000e+02
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  %tmp2 = load double* %dummy2.addr, align 8
  %cmp3 = fcmp une double %tmp2, 9.990000e+02
  br i1 %cmp3, label %if.then4, label %if.end5

if.then4:                                         ; preds = %if.end
  call void @abort() noreturn nounwind
  unreachable

if.end5:                                          ; preds = %if.end
  %arraydecay6 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %fp_offset_p = getelementptr inbounds %struct.__va_list_tag* %arraydecay6, i32 0, i32 1
  %fp_offset = load i32* %fp_offset_p
  %fits_in_fp = icmp ule i32 %fp_offset, 160
  br i1 %fits_in_fp, label %vaarg.in_reg, label %vaarg.in_mem

vaarg.in_reg:                                     ; preds = %if.end5
  %0 = getelementptr inbounds %struct.__va_list_tag* %arraydecay6, i32 0, i32 3
  %reg_save_area = load i8** %0
  %1 = getelementptr i8* %reg_save_area, i32 %fp_offset
  %2 = bitcast i8* %1 to double*
  %3 = add i32 %fp_offset, 16
  store i32 %3, i32* %fp_offset_p
  br label %vaarg.end

vaarg.in_mem:                                     ; preds = %if.end5
  %overflow_arg_area_p = getelementptr inbounds %struct.__va_list_tag* %arraydecay6, i32 0, i32 2
  %overflow_arg_area = load i8** %overflow_arg_area_p
  %4 = bitcast i8* %overflow_arg_area to double*
  %overflow_arg_area.next = getelementptr i8* %overflow_arg_area, i32 8
  store i8* %overflow_arg_area.next, i8** %overflow_arg_area_p
  br label %vaarg.end

vaarg.end:                                        ; preds = %vaarg.in_mem, %vaarg.in_reg
  %vaarg.addr = phi double* [ %2, %vaarg.in_reg ], [ %4, %vaarg.in_mem ]
  %5 = load double* %vaarg.addr
  %cmp7 = fcmp une double %5, 1.000000e+00
  br i1 %cmp7, label %if.then8, label %if.end9

if.then8:                                         ; preds = %vaarg.end
  call void @abort() noreturn nounwind
  unreachable

if.end9:                                          ; preds = %vaarg.end
  %arraydecay10 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %fp_offset_p11 = getelementptr inbounds %struct.__va_list_tag* %arraydecay10, i32 0, i32 1
  %fp_offset12 = load i32* %fp_offset_p11
  %fits_in_fp13 = icmp ule i32 %fp_offset12, 160
  br i1 %fits_in_fp13, label %vaarg.in_reg14, label %vaarg.in_mem16

vaarg.in_reg14:                                   ; preds = %if.end9
  %6 = getelementptr inbounds %struct.__va_list_tag* %arraydecay10, i32 0, i32 3
  %reg_save_area15 = load i8** %6
  %7 = getelementptr i8* %reg_save_area15, i32 %fp_offset12
  %8 = bitcast i8* %7 to double*
  %9 = add i32 %fp_offset12, 16
  store i32 %9, i32* %fp_offset_p11
  br label %vaarg.end20

vaarg.in_mem16:                                   ; preds = %if.end9
  %overflow_arg_area_p17 = getelementptr inbounds %struct.__va_list_tag* %arraydecay10, i32 0, i32 2
  %overflow_arg_area18 = load i8** %overflow_arg_area_p17
  %10 = bitcast i8* %overflow_arg_area18 to double*
  %overflow_arg_area.next19 = getelementptr i8* %overflow_arg_area18, i32 8
  store i8* %overflow_arg_area.next19, i8** %overflow_arg_area_p17
  br label %vaarg.end20

vaarg.end20:                                      ; preds = %vaarg.in_mem16, %vaarg.in_reg14
  %vaarg.addr21 = phi double* [ %8, %vaarg.in_reg14 ], [ %10, %vaarg.in_mem16 ]
  %11 = load double* %vaarg.addr21
  %cmp22 = fcmp une double %11, 2.000000e+00
  br i1 %cmp22, label %if.then23, label %if.end24

if.then23:                                        ; preds = %vaarg.end20
  call void @abort() noreturn nounwind
  unreachable

if.end24:                                         ; preds = %vaarg.end20
  %arraydecay25 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %fp_offset_p26 = getelementptr inbounds %struct.__va_list_tag* %arraydecay25, i32 0, i32 1
  %fp_offset27 = load i32* %fp_offset_p26
  %fits_in_fp28 = icmp ule i32 %fp_offset27, 160
  br i1 %fits_in_fp28, label %vaarg.in_reg29, label %vaarg.in_mem31

vaarg.in_reg29:                                   ; preds = %if.end24
  %12 = getelementptr inbounds %struct.__va_list_tag* %arraydecay25, i32 0, i32 3
  %reg_save_area30 = load i8** %12
  %13 = getelementptr i8* %reg_save_area30, i32 %fp_offset27
  %14 = bitcast i8* %13 to double*
  %15 = add i32 %fp_offset27, 16
  store i32 %15, i32* %fp_offset_p26
  br label %vaarg.end35

vaarg.in_mem31:                                   ; preds = %if.end24
  %overflow_arg_area_p32 = getelementptr inbounds %struct.__va_list_tag* %arraydecay25, i32 0, i32 2
  %overflow_arg_area33 = load i8** %overflow_arg_area_p32
  %16 = bitcast i8* %overflow_arg_area33 to double*
  %overflow_arg_area.next34 = getelementptr i8* %overflow_arg_area33, i32 8
  store i8* %overflow_arg_area.next34, i8** %overflow_arg_area_p32
  br label %vaarg.end35

vaarg.end35:                                      ; preds = %vaarg.in_mem31, %vaarg.in_reg29
  %vaarg.addr36 = phi double* [ %14, %vaarg.in_reg29 ], [ %16, %vaarg.in_mem31 ]
  %17 = load double* %vaarg.addr36
  %cmp37 = fcmp une double %17, 3.000000e+00
  br i1 %cmp37, label %if.then38, label %if.end39

if.then38:                                        ; preds = %vaarg.end35
  call void @abort() noreturn nounwind
  unreachable

if.end39:                                         ; preds = %vaarg.end35
  %arraydecay40 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %fp_offset_p41 = getelementptr inbounds %struct.__va_list_tag* %arraydecay40, i32 0, i32 1
  %fp_offset42 = load i32* %fp_offset_p41
  %fits_in_fp43 = icmp ule i32 %fp_offset42, 160
  br i1 %fits_in_fp43, label %vaarg.in_reg44, label %vaarg.in_mem46

vaarg.in_reg44:                                   ; preds = %if.end39
  %18 = getelementptr inbounds %struct.__va_list_tag* %arraydecay40, i32 0, i32 3
  %reg_save_area45 = load i8** %18
  %19 = getelementptr i8* %reg_save_area45, i32 %fp_offset42
  %20 = bitcast i8* %19 to double*
  %21 = add i32 %fp_offset42, 16
  store i32 %21, i32* %fp_offset_p41
  br label %vaarg.end50

vaarg.in_mem46:                                   ; preds = %if.end39
  %overflow_arg_area_p47 = getelementptr inbounds %struct.__va_list_tag* %arraydecay40, i32 0, i32 2
  %overflow_arg_area48 = load i8** %overflow_arg_area_p47
  %22 = bitcast i8* %overflow_arg_area48 to double*
  %overflow_arg_area.next49 = getelementptr i8* %overflow_arg_area48, i32 8
  store i8* %overflow_arg_area.next49, i8** %overflow_arg_area_p47
  br label %vaarg.end50

vaarg.end50:                                      ; preds = %vaarg.in_mem46, %vaarg.in_reg44
  %vaarg.addr51 = phi double* [ %20, %vaarg.in_reg44 ], [ %22, %vaarg.in_mem46 ]
  %23 = load double* %vaarg.addr51
  %cmp52 = fcmp une double %23, 4.000000e+00
  br i1 %cmp52, label %if.then53, label %if.end54

if.then53:                                        ; preds = %vaarg.end50
  call void @abort() noreturn nounwind
  unreachable

if.end54:                                         ; preds = %vaarg.end50
  %arraydecay55 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %fp_offset_p56 = getelementptr inbounds %struct.__va_list_tag* %arraydecay55, i32 0, i32 1
  %fp_offset57 = load i32* %fp_offset_p56
  %fits_in_fp58 = icmp ule i32 %fp_offset57, 160
  br i1 %fits_in_fp58, label %vaarg.in_reg59, label %vaarg.in_mem61

vaarg.in_reg59:                                   ; preds = %if.end54
  %24 = getelementptr inbounds %struct.__va_list_tag* %arraydecay55, i32 0, i32 3
  %reg_save_area60 = load i8** %24
  %25 = getelementptr i8* %reg_save_area60, i32 %fp_offset57
  %26 = bitcast i8* %25 to double*
  %27 = add i32 %fp_offset57, 16
  store i32 %27, i32* %fp_offset_p56
  br label %vaarg.end65

vaarg.in_mem61:                                   ; preds = %if.end54
  %overflow_arg_area_p62 = getelementptr inbounds %struct.__va_list_tag* %arraydecay55, i32 0, i32 2
  %overflow_arg_area63 = load i8** %overflow_arg_area_p62
  %28 = bitcast i8* %overflow_arg_area63 to double*
  %overflow_arg_area.next64 = getelementptr i8* %overflow_arg_area63, i32 8
  store i8* %overflow_arg_area.next64, i8** %overflow_arg_area_p62
  br label %vaarg.end65

vaarg.end65:                                      ; preds = %vaarg.in_mem61, %vaarg.in_reg59
  %vaarg.addr66 = phi double* [ %26, %vaarg.in_reg59 ], [ %28, %vaarg.in_mem61 ]
  %29 = load double* %vaarg.addr66
  %cmp67 = fcmp une double %29, 5.000000e+00
  br i1 %cmp67, label %if.then68, label %if.end69

if.then68:                                        ; preds = %vaarg.end65
  call void @abort() noreturn nounwind
  unreachable

if.end69:                                         ; preds = %vaarg.end65
  %arraydecay70 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %fp_offset_p71 = getelementptr inbounds %struct.__va_list_tag* %arraydecay70, i32 0, i32 1
  %fp_offset72 = load i32* %fp_offset_p71
  %fits_in_fp73 = icmp ule i32 %fp_offset72, 160
  br i1 %fits_in_fp73, label %vaarg.in_reg74, label %vaarg.in_mem76

vaarg.in_reg74:                                   ; preds = %if.end69
  %30 = getelementptr inbounds %struct.__va_list_tag* %arraydecay70, i32 0, i32 3
  %reg_save_area75 = load i8** %30
  %31 = getelementptr i8* %reg_save_area75, i32 %fp_offset72
  %32 = bitcast i8* %31 to double*
  %33 = add i32 %fp_offset72, 16
  store i32 %33, i32* %fp_offset_p71
  br label %vaarg.end80

vaarg.in_mem76:                                   ; preds = %if.end69
  %overflow_arg_area_p77 = getelementptr inbounds %struct.__va_list_tag* %arraydecay70, i32 0, i32 2
  %overflow_arg_area78 = load i8** %overflow_arg_area_p77
  %34 = bitcast i8* %overflow_arg_area78 to double*
  %overflow_arg_area.next79 = getelementptr i8* %overflow_arg_area78, i32 8
  store i8* %overflow_arg_area.next79, i8** %overflow_arg_area_p77
  br label %vaarg.end80

vaarg.end80:                                      ; preds = %vaarg.in_mem76, %vaarg.in_reg74
  %vaarg.addr81 = phi double* [ %32, %vaarg.in_reg74 ], [ %34, %vaarg.in_mem76 ]
  %35 = load double* %vaarg.addr81
  %cmp82 = fcmp une double %35, 6.000000e+00
  br i1 %cmp82, label %if.then83, label %if.end84

if.then83:                                        ; preds = %vaarg.end80
  call void @abort() noreturn nounwind
  unreachable

if.end84:                                         ; preds = %vaarg.end80
  %arraydecay85 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %fp_offset_p86 = getelementptr inbounds %struct.__va_list_tag* %arraydecay85, i32 0, i32 1
  %fp_offset87 = load i32* %fp_offset_p86
  %fits_in_fp88 = icmp ule i32 %fp_offset87, 160
  br i1 %fits_in_fp88, label %vaarg.in_reg89, label %vaarg.in_mem91

vaarg.in_reg89:                                   ; preds = %if.end84
  %36 = getelementptr inbounds %struct.__va_list_tag* %arraydecay85, i32 0, i32 3
  %reg_save_area90 = load i8** %36
  %37 = getelementptr i8* %reg_save_area90, i32 %fp_offset87
  %38 = bitcast i8* %37 to double*
  %39 = add i32 %fp_offset87, 16
  store i32 %39, i32* %fp_offset_p86
  br label %vaarg.end95

vaarg.in_mem91:                                   ; preds = %if.end84
  %overflow_arg_area_p92 = getelementptr inbounds %struct.__va_list_tag* %arraydecay85, i32 0, i32 2
  %overflow_arg_area93 = load i8** %overflow_arg_area_p92
  %40 = bitcast i8* %overflow_arg_area93 to double*
  %overflow_arg_area.next94 = getelementptr i8* %overflow_arg_area93, i32 8
  store i8* %overflow_arg_area.next94, i8** %overflow_arg_area_p92
  br label %vaarg.end95

vaarg.end95:                                      ; preds = %vaarg.in_mem91, %vaarg.in_reg89
  %vaarg.addr96 = phi double* [ %38, %vaarg.in_reg89 ], [ %40, %vaarg.in_mem91 ]
  %41 = load double* %vaarg.addr96
  %cmp97 = fcmp une double %41, 7.000000e+00
  br i1 %cmp97, label %if.then98, label %if.end99

if.then98:                                        ; preds = %vaarg.end95
  call void @abort() noreturn nounwind
  unreachable

if.end99:                                         ; preds = %vaarg.end95
  %arraydecay100 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %fp_offset_p101 = getelementptr inbounds %struct.__va_list_tag* %arraydecay100, i32 0, i32 1
  %fp_offset102 = load i32* %fp_offset_p101
  %fits_in_fp103 = icmp ule i32 %fp_offset102, 160
  br i1 %fits_in_fp103, label %vaarg.in_reg104, label %vaarg.in_mem106

vaarg.in_reg104:                                  ; preds = %if.end99
  %42 = getelementptr inbounds %struct.__va_list_tag* %arraydecay100, i32 0, i32 3
  %reg_save_area105 = load i8** %42
  %43 = getelementptr i8* %reg_save_area105, i32 %fp_offset102
  %44 = bitcast i8* %43 to double*
  %45 = add i32 %fp_offset102, 16
  store i32 %45, i32* %fp_offset_p101
  br label %vaarg.end110

vaarg.in_mem106:                                  ; preds = %if.end99
  %overflow_arg_area_p107 = getelementptr inbounds %struct.__va_list_tag* %arraydecay100, i32 0, i32 2
  %overflow_arg_area108 = load i8** %overflow_arg_area_p107
  %46 = bitcast i8* %overflow_arg_area108 to double*
  %overflow_arg_area.next109 = getelementptr i8* %overflow_arg_area108, i32 8
  store i8* %overflow_arg_area.next109, i8** %overflow_arg_area_p107
  br label %vaarg.end110

vaarg.end110:                                     ; preds = %vaarg.in_mem106, %vaarg.in_reg104
  %vaarg.addr111 = phi double* [ %44, %vaarg.in_reg104 ], [ %46, %vaarg.in_mem106 ]
  %47 = load double* %vaarg.addr111
  %cmp112 = fcmp une double %47, 8.000000e+00
  br i1 %cmp112, label %if.then113, label %if.end114

if.then113:                                       ; preds = %vaarg.end110
  call void @abort() noreturn nounwind
  unreachable

if.end114:                                        ; preds = %vaarg.end110
  %arraydecay115 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %fp_offset_p116 = getelementptr inbounds %struct.__va_list_tag* %arraydecay115, i32 0, i32 1
  %fp_offset117 = load i32* %fp_offset_p116
  %fits_in_fp118 = icmp ule i32 %fp_offset117, 160
  br i1 %fits_in_fp118, label %vaarg.in_reg119, label %vaarg.in_mem121

vaarg.in_reg119:                                  ; preds = %if.end114
  %48 = getelementptr inbounds %struct.__va_list_tag* %arraydecay115, i32 0, i32 3
  %reg_save_area120 = load i8** %48
  %49 = getelementptr i8* %reg_save_area120, i32 %fp_offset117
  %50 = bitcast i8* %49 to double*
  %51 = add i32 %fp_offset117, 16
  store i32 %51, i32* %fp_offset_p116
  br label %vaarg.end125

vaarg.in_mem121:                                  ; preds = %if.end114
  %overflow_arg_area_p122 = getelementptr inbounds %struct.__va_list_tag* %arraydecay115, i32 0, i32 2
  %overflow_arg_area123 = load i8** %overflow_arg_area_p122
  %52 = bitcast i8* %overflow_arg_area123 to double*
  %overflow_arg_area.next124 = getelementptr i8* %overflow_arg_area123, i32 8
  store i8* %overflow_arg_area.next124, i8** %overflow_arg_area_p122
  br label %vaarg.end125

vaarg.end125:                                     ; preds = %vaarg.in_mem121, %vaarg.in_reg119
  %vaarg.addr126 = phi double* [ %50, %vaarg.in_reg119 ], [ %52, %vaarg.in_mem121 ]
  %53 = load double* %vaarg.addr126
  %cmp127 = fcmp une double %53, 9.000000e+00
  br i1 %cmp127, label %if.then128, label %if.end129

if.then128:                                       ; preds = %vaarg.end125
  call void @abort() noreturn nounwind
  unreachable

if.end129:                                        ; preds = %vaarg.end125
  %arraydecay130 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %arraydecay130131 = bitcast %struct.__va_list_tag* %arraydecay130 to i8*
  call void @llvm.va_end(i8* %arraydecay130131)
  ret void
}

declare void @llvm.va_start(i8*) nounwind

declare void @abort() noreturn nounwind

declare void @llvm.va_end(i8*) nounwind

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  call void (double, double, ...)* @vafunction(double 8.880000e+02, double 9.990000e+02, double 1.000000e+00, double 2.000000e+00, double 3.000000e+00, double 4.000000e+00, double 5.000000e+00, double 6.000000e+00, double 7.000000e+00, double 8.000000e+00, double 9.000000e+00)
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

declare void @exit(i32) noreturn nounwind
