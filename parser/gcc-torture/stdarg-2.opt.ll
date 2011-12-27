; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/stdarg-2.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.A = type { i32, [1 x %struct.__va_list_tag], [2 x [1 x %struct.__va_list_tag]] }
%struct.__va_list_tag = type { i32, i32, i8*, i8* }

@foo_arg = common global i32 0, align 4
@gap = common global [1 x %struct.__va_list_tag] zeroinitializer, align 16
@bar_arg = common global i32 0, align 4
@x = common global i64 0, align 8
@d = common global double 0.000000e+00, align 8

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

define void @foo(i32 %v, %struct.__va_list_tag* %ap) nounwind uwtable {
entry:
  switch i32 %v, label %sw.default [
    i32 5, label %sw.bb
    i32 8, label %sw.bb29
    i32 11, label %sw.bb59
  ]

sw.bb:                                            ; preds = %entry
  %gp_offset_p = getelementptr inbounds %struct.__va_list_tag* %ap, i64 0, i32 0
  %gp_offset = load i32* %gp_offset_p, align 4
  %fits_in_gp = icmp ult i32 %gp_offset, 41
  br i1 %fits_in_gp, label %vaarg.in_reg, label %vaarg.in_mem

vaarg.in_reg:                                     ; preds = %sw.bb
  %0 = getelementptr inbounds %struct.__va_list_tag* %ap, i64 0, i32 3
  %reg_save_area = load i8** %0, align 8
  %1 = sext i32 %gp_offset to i64
  %2 = getelementptr i8* %reg_save_area, i64 %1
  %3 = add i32 %gp_offset, 8
  store i32 %3, i32* %gp_offset_p, align 4
  br label %vaarg.end

vaarg.in_mem:                                     ; preds = %sw.bb
  %overflow_arg_area_p = getelementptr inbounds %struct.__va_list_tag* %ap, i64 0, i32 2
  %overflow_arg_area = load i8** %overflow_arg_area_p, align 8
  %overflow_arg_area.next = getelementptr i8* %overflow_arg_area, i64 8
  store i8* %overflow_arg_area.next, i8** %overflow_arg_area_p, align 8
  br label %vaarg.end

vaarg.end:                                        ; preds = %vaarg.in_mem, %vaarg.in_reg
  %vaarg.addr.in = phi i8* [ %2, %vaarg.in_reg ], [ %overflow_arg_area, %vaarg.in_mem ]
  %vaarg.addr = bitcast i8* %vaarg.addr.in to i32*
  %4 = load i32* %vaarg.addr, align 4
  store i32 %4, i32* @foo_arg, align 4
  %fp_offset_p = getelementptr inbounds %struct.__va_list_tag* %ap, i64 0, i32 1
  %fp_offset = load i32* %fp_offset_p, align 4
  %fits_in_fp = icmp ult i32 %fp_offset, 161
  br i1 %fits_in_fp, label %vaarg.in_reg3, label %vaarg.in_mem5

vaarg.in_reg3:                                    ; preds = %vaarg.end
  %5 = getelementptr inbounds %struct.__va_list_tag* %ap, i64 0, i32 3
  %reg_save_area4 = load i8** %5, align 8
  %6 = sext i32 %fp_offset to i64
  %7 = getelementptr i8* %reg_save_area4, i64 %6
  %8 = add i32 %fp_offset, 16
  store i32 %8, i32* %fp_offset_p, align 4
  br label %vaarg.end9

vaarg.in_mem5:                                    ; preds = %vaarg.end
  %overflow_arg_area_p6 = getelementptr inbounds %struct.__va_list_tag* %ap, i64 0, i32 2
  %overflow_arg_area7 = load i8** %overflow_arg_area_p6, align 8
  %overflow_arg_area.next8 = getelementptr i8* %overflow_arg_area7, i64 8
  store i8* %overflow_arg_area.next8, i8** %overflow_arg_area_p6, align 8
  br label %vaarg.end9

vaarg.end9:                                       ; preds = %vaarg.in_mem5, %vaarg.in_reg3
  %vaarg.addr10.in = phi i8* [ %7, %vaarg.in_reg3 ], [ %overflow_arg_area7, %vaarg.in_mem5 ]
  %vaarg.addr10 = bitcast i8* %vaarg.addr10.in to double*
  %9 = load double* %vaarg.addr10, align 8
  %tmp11 = load i32* @foo_arg, align 4
  %conv = sitofp i32 %tmp11 to double
  %add = fadd double %conv, %9
  %conv12 = fptosi double %add to i32
  store i32 %conv12, i32* @foo_arg, align 4
  %gp_offset15 = load i32* %gp_offset_p, align 4
  %fits_in_gp16 = icmp ult i32 %gp_offset15, 41
  br i1 %fits_in_gp16, label %vaarg.in_reg17, label %vaarg.in_mem19

vaarg.in_reg17:                                   ; preds = %vaarg.end9
  %10 = getelementptr inbounds %struct.__va_list_tag* %ap, i64 0, i32 3
  %reg_save_area18 = load i8** %10, align 8
  %11 = sext i32 %gp_offset15 to i64
  %12 = getelementptr i8* %reg_save_area18, i64 %11
  %13 = add i32 %gp_offset15, 8
  store i32 %13, i32* %gp_offset_p, align 4
  br label %vaarg.end23

vaarg.in_mem19:                                   ; preds = %vaarg.end9
  %overflow_arg_area_p20 = getelementptr inbounds %struct.__va_list_tag* %ap, i64 0, i32 2
  %overflow_arg_area21 = load i8** %overflow_arg_area_p20, align 8
  %overflow_arg_area.next22 = getelementptr i8* %overflow_arg_area21, i64 8
  store i8* %overflow_arg_area.next22, i8** %overflow_arg_area_p20, align 8
  br label %vaarg.end23

vaarg.end23:                                      ; preds = %vaarg.in_mem19, %vaarg.in_reg17
  %vaarg.addr24.in = phi i8* [ %12, %vaarg.in_reg17 ], [ %overflow_arg_area21, %vaarg.in_mem19 ]
  %vaarg.addr24 = bitcast i8* %vaarg.addr24.in to i64*
  %14 = load i64* %vaarg.addr24, align 8
  %tmp25 = load i32* @foo_arg, align 4
  %conv261 = zext i32 %tmp25 to i64
  %add27 = add nsw i64 %conv261, %14
  %conv28 = trunc i64 %add27 to i32
  store i32 %conv28, i32* @foo_arg, align 4
  br label %sw.epilog

sw.bb29:                                          ; preds = %entry
  %gp_offset_p31 = getelementptr inbounds %struct.__va_list_tag* %ap, i64 0, i32 0
  %gp_offset32 = load i32* %gp_offset_p31, align 4
  %fits_in_gp33 = icmp ult i32 %gp_offset32, 41
  br i1 %fits_in_gp33, label %vaarg.in_reg34, label %vaarg.in_mem36

vaarg.in_reg34:                                   ; preds = %sw.bb29
  %15 = getelementptr inbounds %struct.__va_list_tag* %ap, i64 0, i32 3
  %reg_save_area35 = load i8** %15, align 8
  %16 = sext i32 %gp_offset32 to i64
  %17 = getelementptr i8* %reg_save_area35, i64 %16
  %18 = add i32 %gp_offset32, 8
  store i32 %18, i32* %gp_offset_p31, align 4
  br label %vaarg.end40

vaarg.in_mem36:                                   ; preds = %sw.bb29
  %overflow_arg_area_p37 = getelementptr inbounds %struct.__va_list_tag* %ap, i64 0, i32 2
  %overflow_arg_area38 = load i8** %overflow_arg_area_p37, align 8
  %overflow_arg_area.next39 = getelementptr i8* %overflow_arg_area38, i64 8
  store i8* %overflow_arg_area.next39, i8** %overflow_arg_area_p37, align 8
  br label %vaarg.end40

vaarg.end40:                                      ; preds = %vaarg.in_mem36, %vaarg.in_reg34
  %vaarg.addr41.in = phi i8* [ %17, %vaarg.in_reg34 ], [ %overflow_arg_area38, %vaarg.in_mem36 ]
  %vaarg.addr41 = bitcast i8* %vaarg.addr41.in to i64*
  %19 = load i64* %vaarg.addr41, align 8
  %conv42 = trunc i64 %19 to i32
  store i32 %conv42, i32* @foo_arg, align 4
  %fp_offset_p44 = getelementptr inbounds %struct.__va_list_tag* %ap, i64 0, i32 1
  %fp_offset45 = load i32* %fp_offset_p44, align 4
  %fits_in_fp46 = icmp ult i32 %fp_offset45, 161
  br i1 %fits_in_fp46, label %vaarg.in_reg47, label %vaarg.in_mem49

vaarg.in_reg47:                                   ; preds = %vaarg.end40
  %20 = getelementptr inbounds %struct.__va_list_tag* %ap, i64 0, i32 3
  %reg_save_area48 = load i8** %20, align 8
  %21 = sext i32 %fp_offset45 to i64
  %22 = getelementptr i8* %reg_save_area48, i64 %21
  %23 = add i32 %fp_offset45, 16
  store i32 %23, i32* %fp_offset_p44, align 4
  br label %vaarg.end53

vaarg.in_mem49:                                   ; preds = %vaarg.end40
  %overflow_arg_area_p50 = getelementptr inbounds %struct.__va_list_tag* %ap, i64 0, i32 2
  %overflow_arg_area51 = load i8** %overflow_arg_area_p50, align 8
  %overflow_arg_area.next52 = getelementptr i8* %overflow_arg_area51, i64 8
  store i8* %overflow_arg_area.next52, i8** %overflow_arg_area_p50, align 8
  br label %vaarg.end53

vaarg.end53:                                      ; preds = %vaarg.in_mem49, %vaarg.in_reg47
  %vaarg.addr54.in = phi i8* [ %22, %vaarg.in_reg47 ], [ %overflow_arg_area51, %vaarg.in_mem49 ]
  %vaarg.addr54 = bitcast i8* %vaarg.addr54.in to double*
  %24 = load double* %vaarg.addr54, align 8
  %tmp55 = load i32* @foo_arg, align 4
  %conv56 = sitofp i32 %tmp55 to double
  %add57 = fadd double %conv56, %24
  %conv58 = fptosi double %add57 to i32
  store i32 %conv58, i32* @foo_arg, align 4
  br label %sw.epilog

sw.bb59:                                          ; preds = %entry
  %gp_offset_p61 = getelementptr inbounds %struct.__va_list_tag* %ap, i64 0, i32 0
  %gp_offset62 = load i32* %gp_offset_p61, align 4
  %fits_in_gp63 = icmp ult i32 %gp_offset62, 41
  br i1 %fits_in_gp63, label %vaarg.in_reg64, label %vaarg.in_mem66

vaarg.in_reg64:                                   ; preds = %sw.bb59
  %25 = getelementptr inbounds %struct.__va_list_tag* %ap, i64 0, i32 3
  %reg_save_area65 = load i8** %25, align 8
  %26 = sext i32 %gp_offset62 to i64
  %27 = getelementptr i8* %reg_save_area65, i64 %26
  %28 = add i32 %gp_offset62, 8
  store i32 %28, i32* %gp_offset_p61, align 4
  %overflow_arg_area_p73.pre = getelementptr inbounds %struct.__va_list_tag* %ap, i64 0, i32 2
  br label %vaarg.end70

vaarg.in_mem66:                                   ; preds = %sw.bb59
  %overflow_arg_area_p67 = getelementptr inbounds %struct.__va_list_tag* %ap, i64 0, i32 2
  %overflow_arg_area68 = load i8** %overflow_arg_area_p67, align 8
  %overflow_arg_area.next69 = getelementptr i8* %overflow_arg_area68, i64 8
  store i8* %overflow_arg_area.next69, i8** %overflow_arg_area_p67, align 8
  br label %vaarg.end70

vaarg.end70:                                      ; preds = %vaarg.in_mem66, %vaarg.in_reg64
  %overflow_arg_area_p73.pre-phi = phi i8** [ %overflow_arg_area_p67, %vaarg.in_mem66 ], [ %overflow_arg_area_p73.pre, %vaarg.in_reg64 ]
  %vaarg.addr71.in = phi i8* [ %overflow_arg_area68, %vaarg.in_mem66 ], [ %27, %vaarg.in_reg64 ]
  %vaarg.addr71 = bitcast i8* %vaarg.addr71.in to i32*
  %29 = load i32* %vaarg.addr71, align 4
  store i32 %29, i32* @foo_arg, align 4
  %overflow_arg_area74 = load i8** %overflow_arg_area_p73.pre-phi, align 8
  %30 = getelementptr i8* %overflow_arg_area74, i64 15
  %31 = ptrtoint i8* %30 to i64
  %32 = and i64 %31, -16
  %overflow_arg_area.align = inttoptr i64 %32 to i8*
  %33 = inttoptr i64 %32 to x86_fp80*
  %overflow_arg_area.next75 = getelementptr i8* %overflow_arg_area.align, i64 16
  store i8* %overflow_arg_area.next75, i8** %overflow_arg_area_p73.pre-phi, align 8
  %34 = load x86_fp80* %33, align 16
  %tmp76 = load i32* @foo_arg, align 4
  %conv77 = sitofp i32 %tmp76 to x86_fp80
  %add78 = fadd x86_fp80 %conv77, %34
  %conv79 = fptosi x86_fp80 %add78 to i32
  store i32 %conv79, i32* @foo_arg, align 4
  br label %sw.epilog

sw.default:                                       ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

sw.epilog:                                        ; preds = %vaarg.end70, %vaarg.end53, %vaarg.end23
  ret void
}

declare void @abort() noreturn nounwind

define void @bar(i32 %v) nounwind uwtable {
entry:
  %cmp = icmp eq i32 %v, 16386
  br i1 %cmp, label %if.then, label %if.end11

if.then:                                          ; preds = %entry
  %gp_offset = load i64* bitcast ([1 x %struct.__va_list_tag]* @gap to i64*), align 16
  %0 = trunc i64 %gp_offset to i32
  %fits_in_gp = icmp ult i32 %0, 41
  %tmp = lshr i64 %gp_offset, 32
  %tmp1 = trunc i64 %tmp to i32
  br i1 %fits_in_gp, label %vaarg.in_reg, label %vaarg.in_mem

vaarg.in_reg:                                     ; preds = %if.then
  %reg_save_area = load i8** getelementptr inbounds ([1 x %struct.__va_list_tag]* @gap, i64 0, i64 0, i32 3), align 16
  %1 = sext i32 %0 to i64
  %2 = getelementptr i8* %reg_save_area, i64 %1
  %3 = add i32 %0, 8
  store i32 %3, i32* getelementptr inbounds ([1 x %struct.__va_list_tag]* @gap, i64 0, i64 0, i32 0), align 16
  br label %vaarg.end

vaarg.in_mem:                                     ; preds = %if.then
  %overflow_arg_area = load i8** getelementptr inbounds ([1 x %struct.__va_list_tag]* @gap, i64 0, i64 0, i32 2), align 8
  %overflow_arg_area.next = getelementptr i8* %overflow_arg_area, i64 8
  store i8* %overflow_arg_area.next, i8** getelementptr inbounds ([1 x %struct.__va_list_tag]* @gap, i64 0, i64 0, i32 2), align 8
  br label %vaarg.end

vaarg.end:                                        ; preds = %vaarg.in_mem, %vaarg.in_reg
  %vaarg.addr.in = phi i8* [ %2, %vaarg.in_reg ], [ %overflow_arg_area, %vaarg.in_mem ]
  %vaarg.addr = bitcast i8* %vaarg.addr.in to i32*
  %4 = load i32* %vaarg.addr, align 4
  %cmp1 = icmp eq i32 %4, 13
  br i1 %cmp1, label %lor.lhs.false, label %if.then10

lor.lhs.false:                                    ; preds = %vaarg.end
  %fits_in_fp = icmp ult i32 %tmp1, 161
  br i1 %fits_in_fp, label %vaarg.in_reg2, label %vaarg.in_mem4

vaarg.in_reg2:                                    ; preds = %lor.lhs.false
  %reg_save_area3 = load i8** getelementptr inbounds ([1 x %struct.__va_list_tag]* @gap, i64 0, i64 0, i32 3), align 16
  %5 = sext i32 %tmp1 to i64
  %6 = getelementptr i8* %reg_save_area3, i64 %5
  %7 = add i32 %tmp1, 16
  store i32 %7, i32* getelementptr inbounds ([1 x %struct.__va_list_tag]* @gap, i64 0, i64 0, i32 1), align 4
  br label %vaarg.end7

vaarg.in_mem4:                                    ; preds = %lor.lhs.false
  %overflow_arg_area5 = load i8** getelementptr inbounds ([1 x %struct.__va_list_tag]* @gap, i64 0, i64 0, i32 2), align 8
  %overflow_arg_area.next6 = getelementptr i8* %overflow_arg_area5, i64 8
  store i8* %overflow_arg_area.next6, i8** getelementptr inbounds ([1 x %struct.__va_list_tag]* @gap, i64 0, i64 0, i32 2), align 8
  br label %vaarg.end7

vaarg.end7:                                       ; preds = %vaarg.in_mem4, %vaarg.in_reg2
  %vaarg.addr8.in = phi i8* [ %6, %vaarg.in_reg2 ], [ %overflow_arg_area5, %vaarg.in_mem4 ]
  %vaarg.addr8 = bitcast i8* %vaarg.addr8.in to double*
  %8 = load double* %vaarg.addr8, align 8
  %cmp9 = fcmp une double %8, -1.400000e+01
  br i1 %cmp9, label %if.then10, label %if.end11

if.then10:                                        ; preds = %vaarg.end, %vaarg.end7
  tail call void @abort() noreturn nounwind
  unreachable

if.end11:                                         ; preds = %vaarg.end7, %entry
  store i32 %v, i32* @bar_arg, align 4
  ret void
}

define void @f1(i32 %i, ...) nounwind uwtable {
entry:
  call void @llvm.va_start(i8* bitcast ([1 x %struct.__va_list_tag]* @gap to i8*))
  %gp_offset = load i32* getelementptr inbounds ([1 x %struct.__va_list_tag]* @gap, i64 0, i64 0, i32 0), align 16
  %fits_in_gp = icmp ult i32 %gp_offset, 41
  br i1 %fits_in_gp, label %vaarg.in_reg, label %vaarg.in_mem

vaarg.in_reg:                                     ; preds = %entry
  %reg_save_area = load i8** getelementptr inbounds ([1 x %struct.__va_list_tag]* @gap, i64 0, i64 0, i32 3), align 16
  %0 = sext i32 %gp_offset to i64
  %1 = getelementptr i8* %reg_save_area, i64 %0
  %2 = add i32 %gp_offset, 8
  store i32 %2, i32* getelementptr inbounds ([1 x %struct.__va_list_tag]* @gap, i64 0, i64 0, i32 0), align 16
  br label %vaarg.end

vaarg.in_mem:                                     ; preds = %entry
  %overflow_arg_area = load i8** getelementptr inbounds ([1 x %struct.__va_list_tag]* @gap, i64 0, i64 0, i32 2), align 8
  %overflow_arg_area.next = getelementptr i8* %overflow_arg_area, i64 8
  store i8* %overflow_arg_area.next, i8** getelementptr inbounds ([1 x %struct.__va_list_tag]* @gap, i64 0, i64 0, i32 2), align 8
  br label %vaarg.end

vaarg.end:                                        ; preds = %vaarg.in_mem, %vaarg.in_reg
  %vaarg.addr.in = phi i8* [ %1, %vaarg.in_reg ], [ %overflow_arg_area, %vaarg.in_mem ]
  %vaarg.addr = bitcast i8* %vaarg.addr.in to i64*
  %3 = load i64* %vaarg.addr, align 8
  store i64 %3, i64* @x, align 8
  call void @llvm.va_end(i8* bitcast ([1 x %struct.__va_list_tag]* @gap to i8*))
  ret void
}

declare void @llvm.va_start(i8*) nounwind

declare void @llvm.va_end(i8*) nounwind

define void @f2(i32 %i, ...) nounwind uwtable {
entry:
  call void @llvm.va_start(i8* bitcast ([1 x %struct.__va_list_tag]* @gap to i8*))
  %cmp.i = icmp eq i32 %i, 16386
  br i1 %cmp.i, label %if.then.i, label %bar.exit

if.then.i:                                        ; preds = %entry
  %gp_offset.i = load i64* bitcast ([1 x %struct.__va_list_tag]* @gap to i64*), align 16
  %0 = trunc i64 %gp_offset.i to i32
  %fits_in_gp.i = icmp ult i32 %0, 41
  %tmp.i = lshr i64 %gp_offset.i, 32
  %tmp1.i = trunc i64 %tmp.i to i32
  br i1 %fits_in_gp.i, label %vaarg.in_reg.i, label %vaarg.in_mem.i

vaarg.in_reg.i:                                   ; preds = %if.then.i
  %reg_save_area.i = load i8** getelementptr inbounds ([1 x %struct.__va_list_tag]* @gap, i64 0, i64 0, i32 3), align 16
  %1 = sext i32 %0 to i64
  %2 = getelementptr i8* %reg_save_area.i, i64 %1
  %3 = add i32 %0, 8
  store i32 %3, i32* getelementptr inbounds ([1 x %struct.__va_list_tag]* @gap, i64 0, i64 0, i32 0), align 16
  br label %vaarg.end.i

vaarg.in_mem.i:                                   ; preds = %if.then.i
  %overflow_arg_area.i = load i8** getelementptr inbounds ([1 x %struct.__va_list_tag]* @gap, i64 0, i64 0, i32 2), align 8
  %overflow_arg_area.next.i = getelementptr i8* %overflow_arg_area.i, i64 8
  store i8* %overflow_arg_area.next.i, i8** getelementptr inbounds ([1 x %struct.__va_list_tag]* @gap, i64 0, i64 0, i32 2), align 8
  br label %vaarg.end.i

vaarg.end.i:                                      ; preds = %vaarg.in_mem.i, %vaarg.in_reg.i
  %vaarg.addr.in.i = phi i8* [ %2, %vaarg.in_reg.i ], [ %overflow_arg_area.i, %vaarg.in_mem.i ]
  %vaarg.addr.i = bitcast i8* %vaarg.addr.in.i to i32*
  %4 = load i32* %vaarg.addr.i, align 4
  %cmp1.i = icmp eq i32 %4, 13
  br i1 %cmp1.i, label %lor.lhs.false.i, label %if.then10.i

lor.lhs.false.i:                                  ; preds = %vaarg.end.i
  %fits_in_fp.i = icmp ult i32 %tmp1.i, 161
  br i1 %fits_in_fp.i, label %vaarg.in_reg2.i, label %vaarg.in_mem4.i

vaarg.in_reg2.i:                                  ; preds = %lor.lhs.false.i
  %reg_save_area3.i = load i8** getelementptr inbounds ([1 x %struct.__va_list_tag]* @gap, i64 0, i64 0, i32 3), align 16
  %5 = sext i32 %tmp1.i to i64
  %6 = getelementptr i8* %reg_save_area3.i, i64 %5
  %7 = add i32 %tmp1.i, 16
  store i32 %7, i32* getelementptr inbounds ([1 x %struct.__va_list_tag]* @gap, i64 0, i64 0, i32 1), align 4
  br label %vaarg.end7.i

vaarg.in_mem4.i:                                  ; preds = %lor.lhs.false.i
  %overflow_arg_area5.i = load i8** getelementptr inbounds ([1 x %struct.__va_list_tag]* @gap, i64 0, i64 0, i32 2), align 8
  %overflow_arg_area.next6.i = getelementptr i8* %overflow_arg_area5.i, i64 8
  store i8* %overflow_arg_area.next6.i, i8** getelementptr inbounds ([1 x %struct.__va_list_tag]* @gap, i64 0, i64 0, i32 2), align 8
  br label %vaarg.end7.i

vaarg.end7.i:                                     ; preds = %vaarg.in_mem4.i, %vaarg.in_reg2.i
  %vaarg.addr8.in.i = phi i8* [ %6, %vaarg.in_reg2.i ], [ %overflow_arg_area5.i, %vaarg.in_mem4.i ]
  %vaarg.addr8.i = bitcast i8* %vaarg.addr8.in.i to double*
  %8 = load double* %vaarg.addr8.i, align 8
  %cmp9.i = fcmp une double %8, -1.400000e+01
  br i1 %cmp9.i, label %if.then10.i, label %bar.exit

if.then10.i:                                      ; preds = %vaarg.end7.i, %vaarg.end.i
  call void @abort() noreturn nounwind
  unreachable

bar.exit:                                         ; preds = %entry, %vaarg.end7.i
  store i32 %i, i32* @bar_arg, align 4
  call void @llvm.va_end(i8* bitcast ([1 x %struct.__va_list_tag]* @gap to i8*))
  ret void
}

define void @f3(i32 %i, ...) nounwind uwtable {
entry:
  %aps = alloca [10 x [1 x %struct.__va_list_tag]], align 16
  %arraydecay = getelementptr inbounds [10 x [1 x %struct.__va_list_tag]]* %aps, i64 0, i64 4, i64 0
  %arraydecay1 = bitcast %struct.__va_list_tag* %arraydecay to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %gp_offset_p = getelementptr inbounds [10 x [1 x %struct.__va_list_tag]]* %aps, i64 0, i64 4, i64 0, i32 0
  %gp_offset = load i32* %gp_offset_p, align 16
  %fits_in_gp = icmp ult i32 %gp_offset, 41
  br i1 %fits_in_gp, label %vaarg.in_reg, label %vaarg.in_mem

vaarg.in_reg:                                     ; preds = %entry
  %0 = getelementptr inbounds [10 x [1 x %struct.__va_list_tag]]* %aps, i64 0, i64 4, i64 0, i32 3
  %reg_save_area = load i8** %0, align 16
  %1 = sext i32 %gp_offset to i64
  %2 = getelementptr i8* %reg_save_area, i64 %1
  %3 = add i32 %gp_offset, 8
  store i32 %3, i32* %gp_offset_p, align 16
  br label %vaarg.end

vaarg.in_mem:                                     ; preds = %entry
  %overflow_arg_area_p = getelementptr inbounds [10 x [1 x %struct.__va_list_tag]]* %aps, i64 0, i64 4, i64 0, i32 2
  %overflow_arg_area = load i8** %overflow_arg_area_p, align 8
  %overflow_arg_area.next = getelementptr i8* %overflow_arg_area, i64 8
  store i8* %overflow_arg_area.next, i8** %overflow_arg_area_p, align 8
  br label %vaarg.end

vaarg.end:                                        ; preds = %vaarg.in_mem, %vaarg.in_reg
  %vaarg.addr.in = phi i8* [ %2, %vaarg.in_reg ], [ %overflow_arg_area, %vaarg.in_mem ]
  %vaarg.addr = bitcast i8* %vaarg.addr.in to i64*
  %4 = load i64* %vaarg.addr, align 8
  store i64 %4, i64* @x, align 8
  call void @llvm.va_end(i8* %arraydecay1)
  ret void
}

define void @f4(i32 %i, ...) nounwind uwtable {
entry:
  %aps = alloca [10 x [1 x %struct.__va_list_tag]], align 16
  %arraydecay = getelementptr inbounds [10 x [1 x %struct.__va_list_tag]]* %aps, i64 0, i64 4, i64 0
  %arraydecay1 = bitcast %struct.__va_list_tag* %arraydecay to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %cmp.i = icmp eq i32 %i, 16386
  br i1 %cmp.i, label %if.then.i, label %bar.exit

if.then.i:                                        ; preds = %entry
  %gp_offset.i = load i64* bitcast ([1 x %struct.__va_list_tag]* @gap to i64*), align 16
  %0 = trunc i64 %gp_offset.i to i32
  %fits_in_gp.i = icmp ult i32 %0, 41
  %tmp.i = lshr i64 %gp_offset.i, 32
  %tmp1.i = trunc i64 %tmp.i to i32
  br i1 %fits_in_gp.i, label %vaarg.in_reg.i, label %vaarg.in_mem.i

vaarg.in_reg.i:                                   ; preds = %if.then.i
  %reg_save_area.i = load i8** getelementptr inbounds ([1 x %struct.__va_list_tag]* @gap, i64 0, i64 0, i32 3), align 16
  %1 = sext i32 %0 to i64
  %2 = getelementptr i8* %reg_save_area.i, i64 %1
  %3 = add i32 %0, 8
  store i32 %3, i32* getelementptr inbounds ([1 x %struct.__va_list_tag]* @gap, i64 0, i64 0, i32 0), align 16
  br label %vaarg.end.i

vaarg.in_mem.i:                                   ; preds = %if.then.i
  %overflow_arg_area.i = load i8** getelementptr inbounds ([1 x %struct.__va_list_tag]* @gap, i64 0, i64 0, i32 2), align 8
  %overflow_arg_area.next.i = getelementptr i8* %overflow_arg_area.i, i64 8
  store i8* %overflow_arg_area.next.i, i8** getelementptr inbounds ([1 x %struct.__va_list_tag]* @gap, i64 0, i64 0, i32 2), align 8
  br label %vaarg.end.i

vaarg.end.i:                                      ; preds = %vaarg.in_mem.i, %vaarg.in_reg.i
  %vaarg.addr.in.i = phi i8* [ %2, %vaarg.in_reg.i ], [ %overflow_arg_area.i, %vaarg.in_mem.i ]
  %vaarg.addr.i = bitcast i8* %vaarg.addr.in.i to i32*
  %4 = load i32* %vaarg.addr.i, align 4
  %cmp1.i = icmp eq i32 %4, 13
  br i1 %cmp1.i, label %lor.lhs.false.i, label %if.then10.i

lor.lhs.false.i:                                  ; preds = %vaarg.end.i
  %fits_in_fp.i = icmp ult i32 %tmp1.i, 161
  br i1 %fits_in_fp.i, label %vaarg.in_reg2.i, label %vaarg.in_mem4.i

vaarg.in_reg2.i:                                  ; preds = %lor.lhs.false.i
  %reg_save_area3.i = load i8** getelementptr inbounds ([1 x %struct.__va_list_tag]* @gap, i64 0, i64 0, i32 3), align 16
  %5 = sext i32 %tmp1.i to i64
  %6 = getelementptr i8* %reg_save_area3.i, i64 %5
  %7 = add i32 %tmp1.i, 16
  store i32 %7, i32* getelementptr inbounds ([1 x %struct.__va_list_tag]* @gap, i64 0, i64 0, i32 1), align 4
  br label %vaarg.end7.i

vaarg.in_mem4.i:                                  ; preds = %lor.lhs.false.i
  %overflow_arg_area5.i = load i8** getelementptr inbounds ([1 x %struct.__va_list_tag]* @gap, i64 0, i64 0, i32 2), align 8
  %overflow_arg_area.next6.i = getelementptr i8* %overflow_arg_area5.i, i64 8
  store i8* %overflow_arg_area.next6.i, i8** getelementptr inbounds ([1 x %struct.__va_list_tag]* @gap, i64 0, i64 0, i32 2), align 8
  br label %vaarg.end7.i

vaarg.end7.i:                                     ; preds = %vaarg.in_mem4.i, %vaarg.in_reg2.i
  %vaarg.addr8.in.i = phi i8* [ %6, %vaarg.in_reg2.i ], [ %overflow_arg_area5.i, %vaarg.in_mem4.i ]
  %vaarg.addr8.i = bitcast i8* %vaarg.addr8.in.i to double*
  %8 = load double* %vaarg.addr8.i, align 8
  %cmp9.i = fcmp une double %8, -1.400000e+01
  br i1 %cmp9.i, label %if.then10.i, label %bar.exit

if.then10.i:                                      ; preds = %vaarg.end7.i, %vaarg.end.i
  call void @abort() noreturn nounwind
  unreachable

bar.exit:                                         ; preds = %entry, %vaarg.end7.i
  store i32 %i, i32* @bar_arg, align 4
  call void @llvm.va_end(i8* %arraydecay1)
  ret void
}

define void @f5(i32 %i, ...) nounwind uwtable {
entry:
  %aps = alloca [10 x [1 x %struct.__va_list_tag]], align 16
  %arraydecay = getelementptr inbounds [10 x [1 x %struct.__va_list_tag]]* %aps, i64 0, i64 4, i64 0
  %arraydecay1 = bitcast %struct.__va_list_tag* %arraydecay to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  call void @foo(i32 %i, %struct.__va_list_tag* %arraydecay)
  call void @llvm.va_end(i8* %arraydecay1)
  ret void
}

define void @f6(i32 %i, ...) nounwind uwtable {
entry:
  %a = alloca %struct.A, align 8
  %arraydecay = getelementptr inbounds %struct.A* %a, i64 0, i32 1, i64 0
  %arraydecay1 = bitcast %struct.__va_list_tag* %arraydecay to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %gp_offset_p = getelementptr inbounds %struct.A* %a, i64 0, i32 1, i64 0, i32 0
  %gp_offset = load i32* %gp_offset_p, align 8
  %fits_in_gp = icmp ult i32 %gp_offset, 41
  br i1 %fits_in_gp, label %vaarg.in_reg, label %vaarg.in_mem

vaarg.in_reg:                                     ; preds = %entry
  %0 = getelementptr inbounds %struct.A* %a, i64 0, i32 1, i64 0, i32 3
  %reg_save_area = load i8** %0, align 8
  %1 = sext i32 %gp_offset to i64
  %2 = getelementptr i8* %reg_save_area, i64 %1
  %3 = add i32 %gp_offset, 8
  store i32 %3, i32* %gp_offset_p, align 8
  br label %vaarg.end

vaarg.in_mem:                                     ; preds = %entry
  %overflow_arg_area_p = getelementptr inbounds %struct.A* %a, i64 0, i32 1, i64 0, i32 2
  %overflow_arg_area = load i8** %overflow_arg_area_p, align 8
  %overflow_arg_area.next = getelementptr i8* %overflow_arg_area, i64 8
  store i8* %overflow_arg_area.next, i8** %overflow_arg_area_p, align 8
  br label %vaarg.end

vaarg.end:                                        ; preds = %vaarg.in_mem, %vaarg.in_reg
  %vaarg.addr.in = phi i8* [ %2, %vaarg.in_reg ], [ %overflow_arg_area, %vaarg.in_mem ]
  %vaarg.addr = bitcast i8* %vaarg.addr.in to i64*
  %4 = load i64* %vaarg.addr, align 8
  store i64 %4, i64* @x, align 8
  call void @llvm.va_end(i8* %arraydecay1)
  ret void
}

define void @f7(i32 %i, ...) nounwind uwtable {
entry:
  %a = alloca %struct.A, align 8
  %arraydecay = getelementptr inbounds %struct.A* %a, i64 0, i32 1, i64 0
  %arraydecay1 = bitcast %struct.__va_list_tag* %arraydecay to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %cmp.i = icmp eq i32 %i, 16386
  br i1 %cmp.i, label %if.then.i, label %bar.exit

if.then.i:                                        ; preds = %entry
  %gp_offset.i = load i64* bitcast ([1 x %struct.__va_list_tag]* @gap to i64*), align 16
  %0 = trunc i64 %gp_offset.i to i32
  %fits_in_gp.i = icmp ult i32 %0, 41
  %tmp.i = lshr i64 %gp_offset.i, 32
  %tmp1.i = trunc i64 %tmp.i to i32
  br i1 %fits_in_gp.i, label %vaarg.in_reg.i, label %vaarg.in_mem.i

vaarg.in_reg.i:                                   ; preds = %if.then.i
  %reg_save_area.i = load i8** getelementptr inbounds ([1 x %struct.__va_list_tag]* @gap, i64 0, i64 0, i32 3), align 16
  %1 = sext i32 %0 to i64
  %2 = getelementptr i8* %reg_save_area.i, i64 %1
  %3 = add i32 %0, 8
  store i32 %3, i32* getelementptr inbounds ([1 x %struct.__va_list_tag]* @gap, i64 0, i64 0, i32 0), align 16
  br label %vaarg.end.i

vaarg.in_mem.i:                                   ; preds = %if.then.i
  %overflow_arg_area.i = load i8** getelementptr inbounds ([1 x %struct.__va_list_tag]* @gap, i64 0, i64 0, i32 2), align 8
  %overflow_arg_area.next.i = getelementptr i8* %overflow_arg_area.i, i64 8
  store i8* %overflow_arg_area.next.i, i8** getelementptr inbounds ([1 x %struct.__va_list_tag]* @gap, i64 0, i64 0, i32 2), align 8
  br label %vaarg.end.i

vaarg.end.i:                                      ; preds = %vaarg.in_mem.i, %vaarg.in_reg.i
  %vaarg.addr.in.i = phi i8* [ %2, %vaarg.in_reg.i ], [ %overflow_arg_area.i, %vaarg.in_mem.i ]
  %vaarg.addr.i = bitcast i8* %vaarg.addr.in.i to i32*
  %4 = load i32* %vaarg.addr.i, align 4
  %cmp1.i = icmp eq i32 %4, 13
  br i1 %cmp1.i, label %lor.lhs.false.i, label %if.then10.i

lor.lhs.false.i:                                  ; preds = %vaarg.end.i
  %fits_in_fp.i = icmp ult i32 %tmp1.i, 161
  br i1 %fits_in_fp.i, label %vaarg.in_reg2.i, label %vaarg.in_mem4.i

vaarg.in_reg2.i:                                  ; preds = %lor.lhs.false.i
  %reg_save_area3.i = load i8** getelementptr inbounds ([1 x %struct.__va_list_tag]* @gap, i64 0, i64 0, i32 3), align 16
  %5 = sext i32 %tmp1.i to i64
  %6 = getelementptr i8* %reg_save_area3.i, i64 %5
  %7 = add i32 %tmp1.i, 16
  store i32 %7, i32* getelementptr inbounds ([1 x %struct.__va_list_tag]* @gap, i64 0, i64 0, i32 1), align 4
  br label %vaarg.end7.i

vaarg.in_mem4.i:                                  ; preds = %lor.lhs.false.i
  %overflow_arg_area5.i = load i8** getelementptr inbounds ([1 x %struct.__va_list_tag]* @gap, i64 0, i64 0, i32 2), align 8
  %overflow_arg_area.next6.i = getelementptr i8* %overflow_arg_area5.i, i64 8
  store i8* %overflow_arg_area.next6.i, i8** getelementptr inbounds ([1 x %struct.__va_list_tag]* @gap, i64 0, i64 0, i32 2), align 8
  br label %vaarg.end7.i

vaarg.end7.i:                                     ; preds = %vaarg.in_mem4.i, %vaarg.in_reg2.i
  %vaarg.addr8.in.i = phi i8* [ %6, %vaarg.in_reg2.i ], [ %overflow_arg_area5.i, %vaarg.in_mem4.i ]
  %vaarg.addr8.i = bitcast i8* %vaarg.addr8.in.i to double*
  %8 = load double* %vaarg.addr8.i, align 8
  %cmp9.i = fcmp une double %8, -1.400000e+01
  br i1 %cmp9.i, label %if.then10.i, label %bar.exit

if.then10.i:                                      ; preds = %vaarg.end7.i, %vaarg.end.i
  call void @abort() noreturn nounwind
  unreachable

bar.exit:                                         ; preds = %entry, %vaarg.end7.i
  store i32 %i, i32* @bar_arg, align 4
  call void @llvm.va_end(i8* %arraydecay1)
  ret void
}

define void @f8(i32 %i, ...) nounwind uwtable {
entry:
  %a = alloca %struct.A, align 8
  %arraydecay = getelementptr inbounds %struct.A* %a, i64 0, i32 1, i64 0
  %arraydecay1 = bitcast %struct.__va_list_tag* %arraydecay to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  call void @foo(i32 %i, %struct.__va_list_tag* %arraydecay)
  call void @llvm.va_end(i8* %arraydecay1)
  ret void
}

define void @f10(i32 %i, ...) nounwind uwtable {
entry:
  %a = alloca %struct.A, align 8
  %arraydecay = getelementptr inbounds %struct.A* %a, i64 0, i32 2, i64 1, i64 0
  %arraydecay1 = bitcast %struct.__va_list_tag* %arraydecay to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %gp_offset_p = getelementptr inbounds %struct.A* %a, i64 0, i32 2, i64 1, i64 0, i32 0
  %gp_offset = load i32* %gp_offset_p, align 8
  %fits_in_gp = icmp ult i32 %gp_offset, 41
  br i1 %fits_in_gp, label %vaarg.in_reg, label %vaarg.in_mem

vaarg.in_reg:                                     ; preds = %entry
  %0 = getelementptr inbounds %struct.A* %a, i64 0, i32 2, i64 1, i64 0, i32 3
  %reg_save_area = load i8** %0, align 8
  %1 = sext i32 %gp_offset to i64
  %2 = getelementptr i8* %reg_save_area, i64 %1
  %3 = add i32 %gp_offset, 8
  store i32 %3, i32* %gp_offset_p, align 8
  br label %vaarg.end

vaarg.in_mem:                                     ; preds = %entry
  %overflow_arg_area_p = getelementptr inbounds %struct.A* %a, i64 0, i32 2, i64 1, i64 0, i32 2
  %overflow_arg_area = load i8** %overflow_arg_area_p, align 8
  %overflow_arg_area.next = getelementptr i8* %overflow_arg_area, i64 8
  store i8* %overflow_arg_area.next, i8** %overflow_arg_area_p, align 8
  br label %vaarg.end

vaarg.end:                                        ; preds = %vaarg.in_mem, %vaarg.in_reg
  %vaarg.addr.in = phi i8* [ %2, %vaarg.in_reg ], [ %overflow_arg_area, %vaarg.in_mem ]
  %vaarg.addr = bitcast i8* %vaarg.addr.in to i64*
  %4 = load i64* %vaarg.addr, align 8
  store i64 %4, i64* @x, align 8
  call void @llvm.va_end(i8* %arraydecay1)
  ret void
}

define void @f11(i32 %i, ...) nounwind uwtable {
entry:
  %a = alloca %struct.A, align 8
  %arraydecay = getelementptr inbounds %struct.A* %a, i64 0, i32 2, i64 1, i64 0
  %arraydecay1 = bitcast %struct.__va_list_tag* %arraydecay to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %cmp.i = icmp eq i32 %i, 16386
  br i1 %cmp.i, label %if.then.i, label %bar.exit

if.then.i:                                        ; preds = %entry
  %gp_offset.i = load i64* bitcast ([1 x %struct.__va_list_tag]* @gap to i64*), align 16
  %0 = trunc i64 %gp_offset.i to i32
  %fits_in_gp.i = icmp ult i32 %0, 41
  %tmp.i = lshr i64 %gp_offset.i, 32
  %tmp1.i = trunc i64 %tmp.i to i32
  br i1 %fits_in_gp.i, label %vaarg.in_reg.i, label %vaarg.in_mem.i

vaarg.in_reg.i:                                   ; preds = %if.then.i
  %reg_save_area.i = load i8** getelementptr inbounds ([1 x %struct.__va_list_tag]* @gap, i64 0, i64 0, i32 3), align 16
  %1 = sext i32 %0 to i64
  %2 = getelementptr i8* %reg_save_area.i, i64 %1
  %3 = add i32 %0, 8
  store i32 %3, i32* getelementptr inbounds ([1 x %struct.__va_list_tag]* @gap, i64 0, i64 0, i32 0), align 16
  br label %vaarg.end.i

vaarg.in_mem.i:                                   ; preds = %if.then.i
  %overflow_arg_area.i = load i8** getelementptr inbounds ([1 x %struct.__va_list_tag]* @gap, i64 0, i64 0, i32 2), align 8
  %overflow_arg_area.next.i = getelementptr i8* %overflow_arg_area.i, i64 8
  store i8* %overflow_arg_area.next.i, i8** getelementptr inbounds ([1 x %struct.__va_list_tag]* @gap, i64 0, i64 0, i32 2), align 8
  br label %vaarg.end.i

vaarg.end.i:                                      ; preds = %vaarg.in_mem.i, %vaarg.in_reg.i
  %vaarg.addr.in.i = phi i8* [ %2, %vaarg.in_reg.i ], [ %overflow_arg_area.i, %vaarg.in_mem.i ]
  %vaarg.addr.i = bitcast i8* %vaarg.addr.in.i to i32*
  %4 = load i32* %vaarg.addr.i, align 4
  %cmp1.i = icmp eq i32 %4, 13
  br i1 %cmp1.i, label %lor.lhs.false.i, label %if.then10.i

lor.lhs.false.i:                                  ; preds = %vaarg.end.i
  %fits_in_fp.i = icmp ult i32 %tmp1.i, 161
  br i1 %fits_in_fp.i, label %vaarg.in_reg2.i, label %vaarg.in_mem4.i

vaarg.in_reg2.i:                                  ; preds = %lor.lhs.false.i
  %reg_save_area3.i = load i8** getelementptr inbounds ([1 x %struct.__va_list_tag]* @gap, i64 0, i64 0, i32 3), align 16
  %5 = sext i32 %tmp1.i to i64
  %6 = getelementptr i8* %reg_save_area3.i, i64 %5
  %7 = add i32 %tmp1.i, 16
  store i32 %7, i32* getelementptr inbounds ([1 x %struct.__va_list_tag]* @gap, i64 0, i64 0, i32 1), align 4
  br label %vaarg.end7.i

vaarg.in_mem4.i:                                  ; preds = %lor.lhs.false.i
  %overflow_arg_area5.i = load i8** getelementptr inbounds ([1 x %struct.__va_list_tag]* @gap, i64 0, i64 0, i32 2), align 8
  %overflow_arg_area.next6.i = getelementptr i8* %overflow_arg_area5.i, i64 8
  store i8* %overflow_arg_area.next6.i, i8** getelementptr inbounds ([1 x %struct.__va_list_tag]* @gap, i64 0, i64 0, i32 2), align 8
  br label %vaarg.end7.i

vaarg.end7.i:                                     ; preds = %vaarg.in_mem4.i, %vaarg.in_reg2.i
  %vaarg.addr8.in.i = phi i8* [ %6, %vaarg.in_reg2.i ], [ %overflow_arg_area5.i, %vaarg.in_mem4.i ]
  %vaarg.addr8.i = bitcast i8* %vaarg.addr8.in.i to double*
  %8 = load double* %vaarg.addr8.i, align 8
  %cmp9.i = fcmp une double %8, -1.400000e+01
  br i1 %cmp9.i, label %if.then10.i, label %bar.exit

if.then10.i:                                      ; preds = %vaarg.end7.i, %vaarg.end.i
  call void @abort() noreturn nounwind
  unreachable

bar.exit:                                         ; preds = %entry, %vaarg.end7.i
  store i32 %i, i32* @bar_arg, align 4
  call void @llvm.va_end(i8* %arraydecay1)
  ret void
}

define void @f12(i32 %i, ...) nounwind uwtable {
entry:
  %a = alloca %struct.A, align 8
  %arraydecay = getelementptr inbounds %struct.A* %a, i64 0, i32 2, i64 1, i64 0
  %arraydecay1 = bitcast %struct.__va_list_tag* %arraydecay to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  call void @foo(i32 %i, %struct.__va_list_tag* %arraydecay)
  call void @llvm.va_end(i8* %arraydecay1)
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  tail call void (i32, ...)* @f1(i32 1, i64 79)
  %tmp = load i64* @x, align 8
  %cmp = icmp eq i64 %tmp, 79
  br i1 %cmp, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  tail call void (i32, ...)* @f2(i32 16386, i32 13, double -1.400000e+01)
  %tmp1 = load i32* @bar_arg, align 4
  %cmp2 = icmp eq i32 %tmp1, 16386
  br i1 %cmp2, label %if.end4, label %if.then3

if.then3:                                         ; preds = %if.end
  tail call void @abort() noreturn nounwind
  unreachable

if.end4:                                          ; preds = %if.end
  tail call void (i32, ...)* @f3(i32 3, i64 2031)
  %tmp5 = load i64* @x, align 8
  %cmp6 = icmp eq i64 %tmp5, 2031
  br i1 %cmp6, label %if.end8, label %if.then7

if.then7:                                         ; preds = %if.end4
  tail call void @abort() noreturn nounwind
  unreachable

if.end8:                                          ; preds = %if.end4
  tail call void (i32, ...)* @f4(i32 4, i32 18)
  %tmp9 = load i32* @bar_arg, align 4
  %cmp10 = icmp eq i32 %tmp9, 4
  br i1 %cmp10, label %if.end12, label %if.then11

if.then11:                                        ; preds = %if.end8
  tail call void @abort() noreturn nounwind
  unreachable

if.end12:                                         ; preds = %if.end8
  tail call void (i32, ...)* @f5(i32 5, i32 1, double 1.900000e+01, i64 18)
  %tmp13 = load i32* @foo_arg, align 4
  %cmp14 = icmp eq i32 %tmp13, 38
  br i1 %cmp14, label %if.end16, label %if.then15

if.then15:                                        ; preds = %if.end12
  tail call void @abort() noreturn nounwind
  unreachable

if.end16:                                         ; preds = %if.end12
  tail call void (i32, ...)* @f6(i32 6, i64 18)
  %tmp17 = load i64* @x, align 8
  %cmp18 = icmp eq i64 %tmp17, 18
  br i1 %cmp18, label %if.end20, label %if.then19

if.then19:                                        ; preds = %if.end16
  tail call void @abort() noreturn nounwind
  unreachable

if.end20:                                         ; preds = %if.end16
  tail call void (i32, ...)* @f7(i32 7)
  %tmp21 = load i32* @bar_arg, align 4
  %cmp22 = icmp eq i32 %tmp21, 7
  br i1 %cmp22, label %if.end24, label %if.then23

if.then23:                                        ; preds = %if.end20
  tail call void @abort() noreturn nounwind
  unreachable

if.end24:                                         ; preds = %if.end20
  tail call void (i32, ...)* @f8(i32 8, i64 2031, double 1.300000e+01)
  %tmp25 = load i32* @foo_arg, align 4
  %cmp26 = icmp eq i32 %tmp25, 2044
  br i1 %cmp26, label %if.end28, label %if.then27

if.then27:                                        ; preds = %if.end24
  tail call void @abort() noreturn nounwind
  unreachable

if.end28:                                         ; preds = %if.end24
  tail call void (i32, ...)* @f10(i32 9, i64 180)
  %tmp29 = load i64* @x, align 8
  %cmp30 = icmp eq i64 %tmp29, 180
  br i1 %cmp30, label %if.end32, label %if.then31

if.then31:                                        ; preds = %if.end28
  tail call void @abort() noreturn nounwind
  unreachable

if.end32:                                         ; preds = %if.end28
  tail call void (i32, ...)* @f11(i32 10)
  %tmp33 = load i32* @bar_arg, align 4
  %cmp34 = icmp eq i32 %tmp33, 10
  br i1 %cmp34, label %if.end36, label %if.then35

if.then35:                                        ; preds = %if.end32
  tail call void @abort() noreturn nounwind
  unreachable

if.end36:                                         ; preds = %if.end32
  tail call void (i32, ...)* @f12(i32 11, i32 2030, x86_fp80 0xK4002C000000000000000)
  %tmp37 = load i32* @foo_arg, align 4
  %cmp38 = icmp eq i32 %tmp37, 2042
  br i1 %cmp38, label %if.end40, label %if.then39

if.then39:                                        ; preds = %if.end36
  tail call void @abort() noreturn nounwind
  unreachable

if.end40:                                         ; preds = %if.end36
  ret i32 0
}
