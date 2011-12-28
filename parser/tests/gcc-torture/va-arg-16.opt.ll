; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/va-arg-16.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.__va_list_tag = type { i32, i32, i8*, i8* }

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

define void @vafunction(double %dummy1, double %dummy2, ...) nounwind uwtable {
entry:
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  %arraydecay1 = bitcast [1 x %struct.__va_list_tag]* %ap to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %cmp = fcmp une double %dummy1, 8.880000e+02
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  %cmp3 = fcmp une double %dummy2, 9.990000e+02
  br i1 %cmp3, label %if.then4, label %if.end5

if.then4:                                         ; preds = %if.end
  call void @abort() noreturn nounwind
  unreachable

if.end5:                                          ; preds = %if.end
  %fp_offset_p = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 1
  %fp_offset = load i32* %fp_offset_p, align 4
  %fits_in_fp = icmp ult i32 %fp_offset, 161
  br i1 %fits_in_fp, label %vaarg.in_reg, label %vaarg.in_mem

vaarg.in_reg:                                     ; preds = %if.end5
  %0 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 3
  %reg_save_area = load i8** %0, align 16
  %1 = sext i32 %fp_offset to i64
  %2 = getelementptr i8* %reg_save_area, i64 %1
  %3 = add i32 %fp_offset, 16
  store i32 %3, i32* %fp_offset_p, align 4
  br label %vaarg.end

vaarg.in_mem:                                     ; preds = %if.end5
  %overflow_arg_area_p = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 2
  %overflow_arg_area = load i8** %overflow_arg_area_p, align 8
  %overflow_arg_area.next = getelementptr i8* %overflow_arg_area, i64 8
  store i8* %overflow_arg_area.next, i8** %overflow_arg_area_p, align 8
  br label %vaarg.end

vaarg.end:                                        ; preds = %vaarg.in_mem, %vaarg.in_reg
  %fp_offset12 = phi i32 [ %3, %vaarg.in_reg ], [ %fp_offset, %vaarg.in_mem ]
  %vaarg.addr.in = phi i8* [ %2, %vaarg.in_reg ], [ %overflow_arg_area, %vaarg.in_mem ]
  %vaarg.addr = bitcast i8* %vaarg.addr.in to double*
  %4 = load double* %vaarg.addr, align 8
  %cmp7 = fcmp une double %4, 1.000000e+00
  br i1 %cmp7, label %if.then8, label %if.end9

if.then8:                                         ; preds = %vaarg.end
  call void @abort() noreturn nounwind
  unreachable

if.end9:                                          ; preds = %vaarg.end
  %fits_in_fp13 = icmp ult i32 %fp_offset12, 161
  br i1 %fits_in_fp13, label %vaarg.in_reg14, label %vaarg.in_mem16

vaarg.in_reg14:                                   ; preds = %if.end9
  %5 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 3
  %reg_save_area15 = load i8** %5, align 16
  %6 = sext i32 %fp_offset12 to i64
  %7 = getelementptr i8* %reg_save_area15, i64 %6
  %8 = add i32 %fp_offset12, 16
  store i32 %8, i32* %fp_offset_p, align 4
  br label %vaarg.end20

vaarg.in_mem16:                                   ; preds = %if.end9
  %overflow_arg_area_p17 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 2
  %overflow_arg_area18 = load i8** %overflow_arg_area_p17, align 8
  %overflow_arg_area.next19 = getelementptr i8* %overflow_arg_area18, i64 8
  store i8* %overflow_arg_area.next19, i8** %overflow_arg_area_p17, align 8
  br label %vaarg.end20

vaarg.end20:                                      ; preds = %vaarg.in_mem16, %vaarg.in_reg14
  %fp_offset27 = phi i32 [ %8, %vaarg.in_reg14 ], [ %fp_offset12, %vaarg.in_mem16 ]
  %vaarg.addr21.in = phi i8* [ %7, %vaarg.in_reg14 ], [ %overflow_arg_area18, %vaarg.in_mem16 ]
  %vaarg.addr21 = bitcast i8* %vaarg.addr21.in to double*
  %9 = load double* %vaarg.addr21, align 8
  %cmp22 = fcmp une double %9, 2.000000e+00
  br i1 %cmp22, label %if.then23, label %if.end24

if.then23:                                        ; preds = %vaarg.end20
  call void @abort() noreturn nounwind
  unreachable

if.end24:                                         ; preds = %vaarg.end20
  %fits_in_fp28 = icmp ult i32 %fp_offset27, 161
  br i1 %fits_in_fp28, label %vaarg.in_reg29, label %vaarg.in_mem31

vaarg.in_reg29:                                   ; preds = %if.end24
  %10 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 3
  %reg_save_area30 = load i8** %10, align 16
  %11 = sext i32 %fp_offset27 to i64
  %12 = getelementptr i8* %reg_save_area30, i64 %11
  %13 = add i32 %fp_offset27, 16
  store i32 %13, i32* %fp_offset_p, align 4
  br label %vaarg.end35

vaarg.in_mem31:                                   ; preds = %if.end24
  %overflow_arg_area_p32 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 2
  %overflow_arg_area33 = load i8** %overflow_arg_area_p32, align 8
  %overflow_arg_area.next34 = getelementptr i8* %overflow_arg_area33, i64 8
  store i8* %overflow_arg_area.next34, i8** %overflow_arg_area_p32, align 8
  br label %vaarg.end35

vaarg.end35:                                      ; preds = %vaarg.in_mem31, %vaarg.in_reg29
  %fp_offset42 = phi i32 [ %13, %vaarg.in_reg29 ], [ %fp_offset27, %vaarg.in_mem31 ]
  %vaarg.addr36.in = phi i8* [ %12, %vaarg.in_reg29 ], [ %overflow_arg_area33, %vaarg.in_mem31 ]
  %vaarg.addr36 = bitcast i8* %vaarg.addr36.in to double*
  %14 = load double* %vaarg.addr36, align 8
  %cmp37 = fcmp une double %14, 3.000000e+00
  br i1 %cmp37, label %if.then38, label %if.end39

if.then38:                                        ; preds = %vaarg.end35
  call void @abort() noreturn nounwind
  unreachable

if.end39:                                         ; preds = %vaarg.end35
  %fits_in_fp43 = icmp ult i32 %fp_offset42, 161
  br i1 %fits_in_fp43, label %vaarg.in_reg44, label %vaarg.in_mem46

vaarg.in_reg44:                                   ; preds = %if.end39
  %15 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 3
  %reg_save_area45 = load i8** %15, align 16
  %16 = sext i32 %fp_offset42 to i64
  %17 = getelementptr i8* %reg_save_area45, i64 %16
  %18 = add i32 %fp_offset42, 16
  store i32 %18, i32* %fp_offset_p, align 4
  br label %vaarg.end50

vaarg.in_mem46:                                   ; preds = %if.end39
  %overflow_arg_area_p47 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 2
  %overflow_arg_area48 = load i8** %overflow_arg_area_p47, align 8
  %overflow_arg_area.next49 = getelementptr i8* %overflow_arg_area48, i64 8
  store i8* %overflow_arg_area.next49, i8** %overflow_arg_area_p47, align 8
  br label %vaarg.end50

vaarg.end50:                                      ; preds = %vaarg.in_mem46, %vaarg.in_reg44
  %fp_offset57 = phi i32 [ %18, %vaarg.in_reg44 ], [ %fp_offset42, %vaarg.in_mem46 ]
  %vaarg.addr51.in = phi i8* [ %17, %vaarg.in_reg44 ], [ %overflow_arg_area48, %vaarg.in_mem46 ]
  %vaarg.addr51 = bitcast i8* %vaarg.addr51.in to double*
  %19 = load double* %vaarg.addr51, align 8
  %cmp52 = fcmp une double %19, 4.000000e+00
  br i1 %cmp52, label %if.then53, label %if.end54

if.then53:                                        ; preds = %vaarg.end50
  call void @abort() noreturn nounwind
  unreachable

if.end54:                                         ; preds = %vaarg.end50
  %fits_in_fp58 = icmp ult i32 %fp_offset57, 161
  br i1 %fits_in_fp58, label %vaarg.in_reg59, label %vaarg.in_mem61

vaarg.in_reg59:                                   ; preds = %if.end54
  %20 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 3
  %reg_save_area60 = load i8** %20, align 16
  %21 = sext i32 %fp_offset57 to i64
  %22 = getelementptr i8* %reg_save_area60, i64 %21
  %23 = add i32 %fp_offset57, 16
  store i32 %23, i32* %fp_offset_p, align 4
  br label %vaarg.end65

vaarg.in_mem61:                                   ; preds = %if.end54
  %overflow_arg_area_p62 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 2
  %overflow_arg_area63 = load i8** %overflow_arg_area_p62, align 8
  %overflow_arg_area.next64 = getelementptr i8* %overflow_arg_area63, i64 8
  store i8* %overflow_arg_area.next64, i8** %overflow_arg_area_p62, align 8
  br label %vaarg.end65

vaarg.end65:                                      ; preds = %vaarg.in_mem61, %vaarg.in_reg59
  %fp_offset72 = phi i32 [ %23, %vaarg.in_reg59 ], [ %fp_offset57, %vaarg.in_mem61 ]
  %vaarg.addr66.in = phi i8* [ %22, %vaarg.in_reg59 ], [ %overflow_arg_area63, %vaarg.in_mem61 ]
  %vaarg.addr66 = bitcast i8* %vaarg.addr66.in to double*
  %24 = load double* %vaarg.addr66, align 8
  %cmp67 = fcmp une double %24, 5.000000e+00
  br i1 %cmp67, label %if.then68, label %if.end69

if.then68:                                        ; preds = %vaarg.end65
  call void @abort() noreturn nounwind
  unreachable

if.end69:                                         ; preds = %vaarg.end65
  %fits_in_fp73 = icmp ult i32 %fp_offset72, 161
  br i1 %fits_in_fp73, label %vaarg.in_reg74, label %vaarg.in_mem76

vaarg.in_reg74:                                   ; preds = %if.end69
  %25 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 3
  %reg_save_area75 = load i8** %25, align 16
  %26 = sext i32 %fp_offset72 to i64
  %27 = getelementptr i8* %reg_save_area75, i64 %26
  %28 = add i32 %fp_offset72, 16
  store i32 %28, i32* %fp_offset_p, align 4
  br label %vaarg.end80

vaarg.in_mem76:                                   ; preds = %if.end69
  %overflow_arg_area_p77 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 2
  %overflow_arg_area78 = load i8** %overflow_arg_area_p77, align 8
  %overflow_arg_area.next79 = getelementptr i8* %overflow_arg_area78, i64 8
  store i8* %overflow_arg_area.next79, i8** %overflow_arg_area_p77, align 8
  br label %vaarg.end80

vaarg.end80:                                      ; preds = %vaarg.in_mem76, %vaarg.in_reg74
  %fp_offset87 = phi i32 [ %28, %vaarg.in_reg74 ], [ %fp_offset72, %vaarg.in_mem76 ]
  %vaarg.addr81.in = phi i8* [ %27, %vaarg.in_reg74 ], [ %overflow_arg_area78, %vaarg.in_mem76 ]
  %vaarg.addr81 = bitcast i8* %vaarg.addr81.in to double*
  %29 = load double* %vaarg.addr81, align 8
  %cmp82 = fcmp une double %29, 6.000000e+00
  br i1 %cmp82, label %if.then83, label %if.end84

if.then83:                                        ; preds = %vaarg.end80
  call void @abort() noreturn nounwind
  unreachable

if.end84:                                         ; preds = %vaarg.end80
  %fits_in_fp88 = icmp ult i32 %fp_offset87, 161
  br i1 %fits_in_fp88, label %vaarg.in_reg89, label %vaarg.in_mem91

vaarg.in_reg89:                                   ; preds = %if.end84
  %30 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 3
  %reg_save_area90 = load i8** %30, align 16
  %31 = sext i32 %fp_offset87 to i64
  %32 = getelementptr i8* %reg_save_area90, i64 %31
  %33 = add i32 %fp_offset87, 16
  store i32 %33, i32* %fp_offset_p, align 4
  br label %vaarg.end95

vaarg.in_mem91:                                   ; preds = %if.end84
  %overflow_arg_area_p92 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 2
  %overflow_arg_area93 = load i8** %overflow_arg_area_p92, align 8
  %overflow_arg_area.next94 = getelementptr i8* %overflow_arg_area93, i64 8
  store i8* %overflow_arg_area.next94, i8** %overflow_arg_area_p92, align 8
  br label %vaarg.end95

vaarg.end95:                                      ; preds = %vaarg.in_mem91, %vaarg.in_reg89
  %fp_offset102 = phi i32 [ %33, %vaarg.in_reg89 ], [ %fp_offset87, %vaarg.in_mem91 ]
  %vaarg.addr96.in = phi i8* [ %32, %vaarg.in_reg89 ], [ %overflow_arg_area93, %vaarg.in_mem91 ]
  %vaarg.addr96 = bitcast i8* %vaarg.addr96.in to double*
  %34 = load double* %vaarg.addr96, align 8
  %cmp97 = fcmp une double %34, 7.000000e+00
  br i1 %cmp97, label %if.then98, label %if.end99

if.then98:                                        ; preds = %vaarg.end95
  call void @abort() noreturn nounwind
  unreachable

if.end99:                                         ; preds = %vaarg.end95
  %fits_in_fp103 = icmp ult i32 %fp_offset102, 161
  br i1 %fits_in_fp103, label %vaarg.in_reg104, label %vaarg.in_mem106

vaarg.in_reg104:                                  ; preds = %if.end99
  %35 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 3
  %reg_save_area105 = load i8** %35, align 16
  %36 = sext i32 %fp_offset102 to i64
  %37 = getelementptr i8* %reg_save_area105, i64 %36
  %38 = add i32 %fp_offset102, 16
  store i32 %38, i32* %fp_offset_p, align 4
  br label %vaarg.end110

vaarg.in_mem106:                                  ; preds = %if.end99
  %overflow_arg_area_p107 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 2
  %overflow_arg_area108 = load i8** %overflow_arg_area_p107, align 8
  %overflow_arg_area.next109 = getelementptr i8* %overflow_arg_area108, i64 8
  store i8* %overflow_arg_area.next109, i8** %overflow_arg_area_p107, align 8
  br label %vaarg.end110

vaarg.end110:                                     ; preds = %vaarg.in_mem106, %vaarg.in_reg104
  %fp_offset117 = phi i32 [ %38, %vaarg.in_reg104 ], [ %fp_offset102, %vaarg.in_mem106 ]
  %vaarg.addr111.in = phi i8* [ %37, %vaarg.in_reg104 ], [ %overflow_arg_area108, %vaarg.in_mem106 ]
  %vaarg.addr111 = bitcast i8* %vaarg.addr111.in to double*
  %39 = load double* %vaarg.addr111, align 8
  %cmp112 = fcmp une double %39, 8.000000e+00
  br i1 %cmp112, label %if.then113, label %if.end114

if.then113:                                       ; preds = %vaarg.end110
  call void @abort() noreturn nounwind
  unreachable

if.end114:                                        ; preds = %vaarg.end110
  %fits_in_fp118 = icmp ult i32 %fp_offset117, 161
  br i1 %fits_in_fp118, label %vaarg.in_reg119, label %vaarg.in_mem121

vaarg.in_reg119:                                  ; preds = %if.end114
  %40 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 3
  %reg_save_area120 = load i8** %40, align 16
  %41 = sext i32 %fp_offset117 to i64
  %42 = getelementptr i8* %reg_save_area120, i64 %41
  %43 = add i32 %fp_offset117, 16
  store i32 %43, i32* %fp_offset_p, align 4
  br label %vaarg.end125

vaarg.in_mem121:                                  ; preds = %if.end114
  %overflow_arg_area_p122 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 2
  %overflow_arg_area123 = load i8** %overflow_arg_area_p122, align 8
  %overflow_arg_area.next124 = getelementptr i8* %overflow_arg_area123, i64 8
  store i8* %overflow_arg_area.next124, i8** %overflow_arg_area_p122, align 8
  br label %vaarg.end125

vaarg.end125:                                     ; preds = %vaarg.in_mem121, %vaarg.in_reg119
  %vaarg.addr126.in = phi i8* [ %42, %vaarg.in_reg119 ], [ %overflow_arg_area123, %vaarg.in_mem121 ]
  %vaarg.addr126 = bitcast i8* %vaarg.addr126.in to double*
  %44 = load double* %vaarg.addr126, align 8
  %cmp127 = fcmp une double %44, 9.000000e+00
  br i1 %cmp127, label %if.then128, label %if.end129

if.then128:                                       ; preds = %vaarg.end125
  call void @abort() noreturn nounwind
  unreachable

if.end129:                                        ; preds = %vaarg.end125
  call void @llvm.va_end(i8* %arraydecay1)
  ret void
}

declare void @llvm.va_start(i8*) nounwind

declare void @abort() noreturn nounwind

declare void @llvm.va_end(i8*) nounwind

define i32 @main() noreturn nounwind uwtable {
entry:
  tail call void (double, double, ...)* @vafunction(double 8.880000e+02, double 9.990000e+02, double 1.000000e+00, double 2.000000e+00, double 3.000000e+00, double 4.000000e+00, double 5.000000e+00, double 6.000000e+00, double 7.000000e+00, double 8.000000e+00, double 9.000000e+00)
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn nounwind
