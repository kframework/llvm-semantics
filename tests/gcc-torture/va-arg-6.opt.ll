; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/va-arg-6.ll'
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

define void @f(i32 %n, ...) nounwind uwtable {
entry:
  %args = alloca [1 x %struct.__va_list_tag], align 16
  %arraydecay1 = bitcast [1 x %struct.__va_list_tag]* %args to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %gp_offset_p = getelementptr inbounds [1 x %struct.__va_list_tag]* %args, i64 0, i64 0, i32 0
  %0 = bitcast [1 x %struct.__va_list_tag]* %args to i64*
  %gp_offset = load i64* %0, align 16
  %1 = trunc i64 %gp_offset to i32
  %fits_in_gp = icmp ult i32 %1, 41
  %tmp = lshr i64 %gp_offset, 32
  %tmp7 = trunc i64 %tmp to i32
  br i1 %fits_in_gp, label %vaarg.in_reg, label %vaarg.in_mem

vaarg.in_reg:                                     ; preds = %entry
  %2 = getelementptr inbounds [1 x %struct.__va_list_tag]* %args, i64 0, i64 0, i32 3
  %reg_save_area = load i8** %2, align 16
  %3 = sext i32 %1 to i64
  %4 = getelementptr i8* %reg_save_area, i64 %3
  %5 = add i32 %1, 8
  store i32 %5, i32* %gp_offset_p, align 16
  br label %vaarg.end

vaarg.in_mem:                                     ; preds = %entry
  %overflow_arg_area_p = getelementptr inbounds [1 x %struct.__va_list_tag]* %args, i64 0, i64 0, i32 2
  %overflow_arg_area = load i8** %overflow_arg_area_p, align 8
  %overflow_arg_area.next = getelementptr i8* %overflow_arg_area, i64 8
  store i8* %overflow_arg_area.next, i8** %overflow_arg_area_p, align 8
  br label %vaarg.end

vaarg.end:                                        ; preds = %vaarg.in_mem, %vaarg.in_reg
  %gp_offset5 = phi i32 [ %5, %vaarg.in_reg ], [ %1, %vaarg.in_mem ]
  %vaarg.addr.in = phi i8* [ %4, %vaarg.in_reg ], [ %overflow_arg_area, %vaarg.in_mem ]
  %vaarg.addr = bitcast i8* %vaarg.addr.in to i32*
  %6 = load i32* %vaarg.addr, align 4
  %cmp = icmp eq i32 %6, 10
  br i1 %cmp, label %if.end, label %if.then

if.then:                                          ; preds = %vaarg.end
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %vaarg.end
  %fits_in_gp6 = icmp ult i32 %gp_offset5, 41
  br i1 %fits_in_gp6, label %vaarg.in_reg7, label %vaarg.in_mem9

vaarg.in_reg7:                                    ; preds = %if.end
  %7 = getelementptr inbounds [1 x %struct.__va_list_tag]* %args, i64 0, i64 0, i32 3
  %reg_save_area8 = load i8** %7, align 16
  %8 = sext i32 %gp_offset5 to i64
  %9 = getelementptr i8* %reg_save_area8, i64 %8
  %10 = add i32 %gp_offset5, 8
  store i32 %10, i32* %gp_offset_p, align 16
  br label %vaarg.end13

vaarg.in_mem9:                                    ; preds = %if.end
  %overflow_arg_area_p10 = getelementptr inbounds [1 x %struct.__va_list_tag]* %args, i64 0, i64 0, i32 2
  %overflow_arg_area11 = load i8** %overflow_arg_area_p10, align 8
  %overflow_arg_area.next12 = getelementptr i8* %overflow_arg_area11, i64 8
  store i8* %overflow_arg_area.next12, i8** %overflow_arg_area_p10, align 8
  br label %vaarg.end13

vaarg.end13:                                      ; preds = %vaarg.in_mem9, %vaarg.in_reg7
  %gp_offset20 = phi i32 [ %10, %vaarg.in_reg7 ], [ %gp_offset5, %vaarg.in_mem9 ]
  %vaarg.addr14.in = phi i8* [ %9, %vaarg.in_reg7 ], [ %overflow_arg_area11, %vaarg.in_mem9 ]
  %vaarg.addr14 = bitcast i8* %vaarg.addr14.in to i64*
  %11 = load i64* %vaarg.addr14, align 8
  %cmp15 = icmp eq i64 %11, 10000000000
  br i1 %cmp15, label %if.end17, label %if.then16

if.then16:                                        ; preds = %vaarg.end13
  call void @abort() noreturn nounwind
  unreachable

if.end17:                                         ; preds = %vaarg.end13
  %fits_in_gp21 = icmp ult i32 %gp_offset20, 41
  br i1 %fits_in_gp21, label %vaarg.in_reg22, label %vaarg.in_mem24

vaarg.in_reg22:                                   ; preds = %if.end17
  %12 = getelementptr inbounds [1 x %struct.__va_list_tag]* %args, i64 0, i64 0, i32 3
  %reg_save_area23 = load i8** %12, align 16
  %13 = sext i32 %gp_offset20 to i64
  %14 = getelementptr i8* %reg_save_area23, i64 %13
  %15 = add i32 %gp_offset20, 8
  store i32 %15, i32* %gp_offset_p, align 16
  br label %vaarg.end28

vaarg.in_mem24:                                   ; preds = %if.end17
  %overflow_arg_area_p25 = getelementptr inbounds [1 x %struct.__va_list_tag]* %args, i64 0, i64 0, i32 2
  %overflow_arg_area26 = load i8** %overflow_arg_area_p25, align 8
  %overflow_arg_area.next27 = getelementptr i8* %overflow_arg_area26, i64 8
  store i8* %overflow_arg_area.next27, i8** %overflow_arg_area_p25, align 8
  br label %vaarg.end28

vaarg.end28:                                      ; preds = %vaarg.in_mem24, %vaarg.in_reg22
  %gp_offset42 = phi i32 [ %15, %vaarg.in_reg22 ], [ %gp_offset20, %vaarg.in_mem24 ]
  %vaarg.addr29.in = phi i8* [ %14, %vaarg.in_reg22 ], [ %overflow_arg_area26, %vaarg.in_mem24 ]
  %vaarg.addr29 = bitcast i8* %vaarg.addr29.in to i32*
  %16 = load i32* %vaarg.addr29, align 4
  %cmp30 = icmp eq i32 %16, 11
  br i1 %cmp30, label %if.end32, label %if.then31

if.then31:                                        ; preds = %vaarg.end28
  call void @abort() noreturn nounwind
  unreachable

if.end32:                                         ; preds = %vaarg.end28
  %overflow_arg_area_p34 = getelementptr inbounds [1 x %struct.__va_list_tag]* %args, i64 0, i64 0, i32 2
  %overflow_arg_area35 = load i8** %overflow_arg_area_p34, align 8
  %17 = getelementptr i8* %overflow_arg_area35, i64 15
  %18 = ptrtoint i8* %17 to i64
  %19 = and i64 %18, -16
  %overflow_arg_area.align = inttoptr i64 %19 to i8*
  %20 = inttoptr i64 %19 to x86_fp80*
  %overflow_arg_area.next36 = getelementptr i8* %overflow_arg_area.align, i64 16
  store i8* %overflow_arg_area.next36, i8** %overflow_arg_area_p34, align 8
  %21 = load x86_fp80* %20, align 16
  %cmp37 = fcmp une x86_fp80 %21, 0xK4000C8F5C28F5C28F5C3
  br i1 %cmp37, label %if.then38, label %if.end39

if.then38:                                        ; preds = %if.end32
  call void @abort() noreturn nounwind
  unreachable

if.end39:                                         ; preds = %if.end32
  %fits_in_gp43 = icmp ult i32 %gp_offset42, 41
  br i1 %fits_in_gp43, label %vaarg.in_reg44, label %vaarg.in_mem46

vaarg.in_reg44:                                   ; preds = %if.end39
  %22 = getelementptr inbounds [1 x %struct.__va_list_tag]* %args, i64 0, i64 0, i32 3
  %reg_save_area45 = load i8** %22, align 16
  %23 = sext i32 %gp_offset42 to i64
  %24 = getelementptr i8* %reg_save_area45, i64 %23
  %25 = add i32 %gp_offset42, 8
  store i32 %25, i32* %gp_offset_p, align 16
  br label %vaarg.end50

vaarg.in_mem46:                                   ; preds = %if.end39
  %overflow_arg_area.next49 = getelementptr i8* %overflow_arg_area.align, i64 24
  store i8* %overflow_arg_area.next49, i8** %overflow_arg_area_p34, align 8
  br label %vaarg.end50

vaarg.end50:                                      ; preds = %vaarg.in_mem46, %vaarg.in_reg44
  %overflow_arg_area63 = phi i8* [ %overflow_arg_area.next36, %vaarg.in_reg44 ], [ %overflow_arg_area.next49, %vaarg.in_mem46 ]
  %gp_offset57 = phi i32 [ %25, %vaarg.in_reg44 ], [ %gp_offset42, %vaarg.in_mem46 ]
  %vaarg.addr51.in = phi i8* [ %24, %vaarg.in_reg44 ], [ %overflow_arg_area.next36, %vaarg.in_mem46 ]
  %vaarg.addr51 = bitcast i8* %vaarg.addr51.in to i32*
  %26 = load i32* %vaarg.addr51, align 4
  %cmp52 = icmp eq i32 %26, 12
  br i1 %cmp52, label %if.end54, label %if.then53

if.then53:                                        ; preds = %vaarg.end50
  call void @abort() noreturn nounwind
  unreachable

if.end54:                                         ; preds = %vaarg.end50
  %fits_in_gp58 = icmp ult i32 %gp_offset57, 41
  br i1 %fits_in_gp58, label %vaarg.in_reg59, label %vaarg.in_mem61

vaarg.in_reg59:                                   ; preds = %if.end54
  %27 = getelementptr inbounds [1 x %struct.__va_list_tag]* %args, i64 0, i64 0, i32 3
  %reg_save_area60 = load i8** %27, align 16
  %28 = sext i32 %gp_offset57 to i64
  %29 = getelementptr i8* %reg_save_area60, i64 %28
  %30 = add i32 %gp_offset57, 8
  store i32 %30, i32* %gp_offset_p, align 16
  br label %vaarg.end65

vaarg.in_mem61:                                   ; preds = %if.end54
  %overflow_arg_area.next64 = getelementptr i8* %overflow_arg_area63, i64 8
  store i8* %overflow_arg_area.next64, i8** %overflow_arg_area_p34, align 8
  br label %vaarg.end65

vaarg.end65:                                      ; preds = %vaarg.in_mem61, %vaarg.in_reg59
  %overflow_arg_area78 = phi i8* [ %overflow_arg_area63, %vaarg.in_reg59 ], [ %overflow_arg_area.next64, %vaarg.in_mem61 ]
  %gp_offset72 = phi i32 [ %30, %vaarg.in_reg59 ], [ %gp_offset57, %vaarg.in_mem61 ]
  %vaarg.addr66.in = phi i8* [ %29, %vaarg.in_reg59 ], [ %overflow_arg_area63, %vaarg.in_mem61 ]
  %vaarg.addr66 = bitcast i8* %vaarg.addr66.in to i32*
  %31 = load i32* %vaarg.addr66, align 4
  %cmp67 = icmp eq i32 %31, 13
  br i1 %cmp67, label %if.end69, label %if.then68

if.then68:                                        ; preds = %vaarg.end65
  call void @abort() noreturn nounwind
  unreachable

if.end69:                                         ; preds = %vaarg.end65
  %fits_in_gp73 = icmp ult i32 %gp_offset72, 41
  br i1 %fits_in_gp73, label %vaarg.in_reg74, label %vaarg.in_mem76

vaarg.in_reg74:                                   ; preds = %if.end69
  %32 = getelementptr inbounds [1 x %struct.__va_list_tag]* %args, i64 0, i64 0, i32 3
  %reg_save_area75 = load i8** %32, align 16
  %33 = sext i32 %gp_offset72 to i64
  %34 = getelementptr i8* %reg_save_area75, i64 %33
  %35 = add i32 %gp_offset72, 8
  store i32 %35, i32* %gp_offset_p, align 16
  br label %vaarg.end80

vaarg.in_mem76:                                   ; preds = %if.end69
  %overflow_arg_area.next79 = getelementptr i8* %overflow_arg_area78, i64 8
  store i8* %overflow_arg_area.next79, i8** %overflow_arg_area_p34, align 8
  br label %vaarg.end80

vaarg.end80:                                      ; preds = %vaarg.in_mem76, %vaarg.in_reg74
  %overflow_arg_area93 = phi i8* [ %overflow_arg_area78, %vaarg.in_reg74 ], [ %overflow_arg_area.next79, %vaarg.in_mem76 ]
  %gp_offset87 = phi i32 [ %35, %vaarg.in_reg74 ], [ %gp_offset72, %vaarg.in_mem76 ]
  %vaarg.addr81.in = phi i8* [ %34, %vaarg.in_reg74 ], [ %overflow_arg_area78, %vaarg.in_mem76 ]
  %vaarg.addr81 = bitcast i8* %vaarg.addr81.in to i64*
  %36 = load i64* %vaarg.addr81, align 8
  %cmp82 = icmp eq i64 %36, 20000000000
  br i1 %cmp82, label %if.end84, label %if.then83

if.then83:                                        ; preds = %vaarg.end80
  call void @abort() noreturn nounwind
  unreachable

if.end84:                                         ; preds = %vaarg.end80
  %fits_in_gp88 = icmp ult i32 %gp_offset87, 41
  br i1 %fits_in_gp88, label %vaarg.in_reg89, label %vaarg.in_mem91

vaarg.in_reg89:                                   ; preds = %if.end84
  %37 = getelementptr inbounds [1 x %struct.__va_list_tag]* %args, i64 0, i64 0, i32 3
  %reg_save_area90 = load i8** %37, align 16
  %38 = sext i32 %gp_offset87 to i64
  %39 = getelementptr i8* %reg_save_area90, i64 %38
  %40 = add i32 %gp_offset87, 8
  store i32 %40, i32* %gp_offset_p, align 16
  br label %vaarg.end95

vaarg.in_mem91:                                   ; preds = %if.end84
  %overflow_arg_area.next94 = getelementptr i8* %overflow_arg_area93, i64 8
  store i8* %overflow_arg_area.next94, i8** %overflow_arg_area_p34, align 8
  br label %vaarg.end95

vaarg.end95:                                      ; preds = %vaarg.in_mem91, %vaarg.in_reg89
  %overflow_arg_area105 = phi i8* [ %overflow_arg_area93, %vaarg.in_reg89 ], [ %overflow_arg_area.next94, %vaarg.in_mem91 ]
  %vaarg.addr96.in = phi i8* [ %39, %vaarg.in_reg89 ], [ %overflow_arg_area93, %vaarg.in_mem91 ]
  %vaarg.addr96 = bitcast i8* %vaarg.addr96.in to i32*
  %41 = load i32* %vaarg.addr96, align 4
  %cmp97 = icmp eq i32 %41, 14
  br i1 %cmp97, label %if.end99, label %if.then98

if.then98:                                        ; preds = %vaarg.end95
  call void @abort() noreturn nounwind
  unreachable

if.end99:                                         ; preds = %vaarg.end95
  %fits_in_fp = icmp ult i32 %tmp7, 161
  br i1 %fits_in_fp, label %vaarg.in_reg101, label %vaarg.in_mem103

vaarg.in_reg101:                                  ; preds = %if.end99
  %fp_offset_p = getelementptr inbounds [1 x %struct.__va_list_tag]* %args, i64 0, i64 0, i32 1
  %42 = getelementptr inbounds [1 x %struct.__va_list_tag]* %args, i64 0, i64 0, i32 3
  %reg_save_area102 = load i8** %42, align 16
  %43 = sext i32 %tmp7 to i64
  %44 = getelementptr i8* %reg_save_area102, i64 %43
  %45 = add i32 %tmp7, 16
  store i32 %45, i32* %fp_offset_p, align 4
  br label %vaarg.end107

vaarg.in_mem103:                                  ; preds = %if.end99
  %overflow_arg_area.next106 = getelementptr i8* %overflow_arg_area105, i64 8
  store i8* %overflow_arg_area.next106, i8** %overflow_arg_area_p34, align 8
  br label %vaarg.end107

vaarg.end107:                                     ; preds = %vaarg.in_mem103, %vaarg.in_reg101
  %vaarg.addr108.in = phi i8* [ %44, %vaarg.in_reg101 ], [ %overflow_arg_area105, %vaarg.in_mem103 ]
  %vaarg.addr108 = bitcast i8* %vaarg.addr108.in to double*
  %46 = load double* %vaarg.addr108, align 8
  %cmp109 = fcmp une double %46, 2.720000e+00
  br i1 %cmp109, label %if.then110, label %if.end111

if.then110:                                       ; preds = %vaarg.end107
  call void @abort() noreturn nounwind
  unreachable

if.end111:                                        ; preds = %vaarg.end107
  call void @llvm.va_end(i8* %arraydecay1)
  ret void
}

declare void @llvm.va_start(i8*) nounwind

declare void @abort() noreturn nounwind

declare void @llvm.va_end(i8*) nounwind

define i32 @main() noreturn nounwind uwtable {
entry:
  tail call void (i32, ...)* @f(i32 4, i32 10, i64 10000000000, i32 11, x86_fp80 0xK4000C8F5C28F5C28F5C3, i32 12, i32 13, i64 20000000000, i32 14, double 2.720000e+00)
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn nounwind
