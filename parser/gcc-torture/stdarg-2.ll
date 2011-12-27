; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/stdarg-2.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.A = type { i32, [1 x %struct.__va_list_tag], [2 x [1 x %struct.__va_list_tag]] }
%struct.__va_list_tag = type { i32, i32, i8*, i8* }

@foo_arg = common global i32 0, align 4
@gap = common global [1 x %struct.__va_list_tag] zeroinitializer, align 16
@bar_arg = common global i32 0, align 4
@x = common global i64 0, align 8
@d = common global double 0.000000e+00, align 8

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

define void @foo(i32 %v, %struct.__va_list_tag* %ap) nounwind uwtable {
entry:
  %v.addr = alloca i32, align 4
  %ap.addr = alloca %struct.__va_list_tag*, align 8
  store i32 %v, i32* %v.addr, align 4
  store %struct.__va_list_tag* %ap, %struct.__va_list_tag** %ap.addr, align 8
  %tmp = load i32* %v.addr, align 4
  switch i32 %tmp, label %sw.default [
    i32 5, label %sw.bb
    i32 8, label %sw.bb29
    i32 11, label %sw.bb59
  ]

sw.bb:                                            ; preds = %entry
  %tmp1 = load %struct.__va_list_tag** %ap.addr, align 8
  %gp_offset_p = getelementptr inbounds %struct.__va_list_tag* %tmp1, i32 0, i32 0
  %gp_offset = load i32* %gp_offset_p
  %fits_in_gp = icmp ule i32 %gp_offset, 40
  br i1 %fits_in_gp, label %vaarg.in_reg, label %vaarg.in_mem

vaarg.in_reg:                                     ; preds = %sw.bb
  %0 = getelementptr inbounds %struct.__va_list_tag* %tmp1, i32 0, i32 3
  %reg_save_area = load i8** %0
  %1 = getelementptr i8* %reg_save_area, i32 %gp_offset
  %2 = bitcast i8* %1 to i32*
  %3 = add i32 %gp_offset, 8
  store i32 %3, i32* %gp_offset_p
  br label %vaarg.end

vaarg.in_mem:                                     ; preds = %sw.bb
  %overflow_arg_area_p = getelementptr inbounds %struct.__va_list_tag* %tmp1, i32 0, i32 2
  %overflow_arg_area = load i8** %overflow_arg_area_p
  %4 = bitcast i8* %overflow_arg_area to i32*
  %overflow_arg_area.next = getelementptr i8* %overflow_arg_area, i32 8
  store i8* %overflow_arg_area.next, i8** %overflow_arg_area_p
  br label %vaarg.end

vaarg.end:                                        ; preds = %vaarg.in_mem, %vaarg.in_reg
  %vaarg.addr = phi i32* [ %2, %vaarg.in_reg ], [ %4, %vaarg.in_mem ]
  %5 = load i32* %vaarg.addr
  store i32 %5, i32* @foo_arg, align 4
  %tmp2 = load %struct.__va_list_tag** %ap.addr, align 8
  %fp_offset_p = getelementptr inbounds %struct.__va_list_tag* %tmp2, i32 0, i32 1
  %fp_offset = load i32* %fp_offset_p
  %fits_in_fp = icmp ule i32 %fp_offset, 160
  br i1 %fits_in_fp, label %vaarg.in_reg3, label %vaarg.in_mem5

vaarg.in_reg3:                                    ; preds = %vaarg.end
  %6 = getelementptr inbounds %struct.__va_list_tag* %tmp2, i32 0, i32 3
  %reg_save_area4 = load i8** %6
  %7 = getelementptr i8* %reg_save_area4, i32 %fp_offset
  %8 = bitcast i8* %7 to double*
  %9 = add i32 %fp_offset, 16
  store i32 %9, i32* %fp_offset_p
  br label %vaarg.end9

vaarg.in_mem5:                                    ; preds = %vaarg.end
  %overflow_arg_area_p6 = getelementptr inbounds %struct.__va_list_tag* %tmp2, i32 0, i32 2
  %overflow_arg_area7 = load i8** %overflow_arg_area_p6
  %10 = bitcast i8* %overflow_arg_area7 to double*
  %overflow_arg_area.next8 = getelementptr i8* %overflow_arg_area7, i32 8
  store i8* %overflow_arg_area.next8, i8** %overflow_arg_area_p6
  br label %vaarg.end9

vaarg.end9:                                       ; preds = %vaarg.in_mem5, %vaarg.in_reg3
  %vaarg.addr10 = phi double* [ %8, %vaarg.in_reg3 ], [ %10, %vaarg.in_mem5 ]
  %11 = load double* %vaarg.addr10
  %tmp11 = load i32* @foo_arg, align 4
  %conv = sitofp i32 %tmp11 to double
  %add = fadd double %conv, %11
  %conv12 = fptosi double %add to i32
  store i32 %conv12, i32* @foo_arg, align 4
  %tmp13 = load %struct.__va_list_tag** %ap.addr, align 8
  %gp_offset_p14 = getelementptr inbounds %struct.__va_list_tag* %tmp13, i32 0, i32 0
  %gp_offset15 = load i32* %gp_offset_p14
  %fits_in_gp16 = icmp ule i32 %gp_offset15, 40
  br i1 %fits_in_gp16, label %vaarg.in_reg17, label %vaarg.in_mem19

vaarg.in_reg17:                                   ; preds = %vaarg.end9
  %12 = getelementptr inbounds %struct.__va_list_tag* %tmp13, i32 0, i32 3
  %reg_save_area18 = load i8** %12
  %13 = getelementptr i8* %reg_save_area18, i32 %gp_offset15
  %14 = bitcast i8* %13 to i64*
  %15 = add i32 %gp_offset15, 8
  store i32 %15, i32* %gp_offset_p14
  br label %vaarg.end23

vaarg.in_mem19:                                   ; preds = %vaarg.end9
  %overflow_arg_area_p20 = getelementptr inbounds %struct.__va_list_tag* %tmp13, i32 0, i32 2
  %overflow_arg_area21 = load i8** %overflow_arg_area_p20
  %16 = bitcast i8* %overflow_arg_area21 to i64*
  %overflow_arg_area.next22 = getelementptr i8* %overflow_arg_area21, i32 8
  store i8* %overflow_arg_area.next22, i8** %overflow_arg_area_p20
  br label %vaarg.end23

vaarg.end23:                                      ; preds = %vaarg.in_mem19, %vaarg.in_reg17
  %vaarg.addr24 = phi i64* [ %14, %vaarg.in_reg17 ], [ %16, %vaarg.in_mem19 ]
  %17 = load i64* %vaarg.addr24
  %tmp25 = load i32* @foo_arg, align 4
  %conv26 = sext i32 %tmp25 to i64
  %add27 = add nsw i64 %conv26, %17
  %conv28 = trunc i64 %add27 to i32
  store i32 %conv28, i32* @foo_arg, align 4
  br label %sw.epilog

sw.bb29:                                          ; preds = %entry
  %tmp30 = load %struct.__va_list_tag** %ap.addr, align 8
  %gp_offset_p31 = getelementptr inbounds %struct.__va_list_tag* %tmp30, i32 0, i32 0
  %gp_offset32 = load i32* %gp_offset_p31
  %fits_in_gp33 = icmp ule i32 %gp_offset32, 40
  br i1 %fits_in_gp33, label %vaarg.in_reg34, label %vaarg.in_mem36

vaarg.in_reg34:                                   ; preds = %sw.bb29
  %18 = getelementptr inbounds %struct.__va_list_tag* %tmp30, i32 0, i32 3
  %reg_save_area35 = load i8** %18
  %19 = getelementptr i8* %reg_save_area35, i32 %gp_offset32
  %20 = bitcast i8* %19 to i64*
  %21 = add i32 %gp_offset32, 8
  store i32 %21, i32* %gp_offset_p31
  br label %vaarg.end40

vaarg.in_mem36:                                   ; preds = %sw.bb29
  %overflow_arg_area_p37 = getelementptr inbounds %struct.__va_list_tag* %tmp30, i32 0, i32 2
  %overflow_arg_area38 = load i8** %overflow_arg_area_p37
  %22 = bitcast i8* %overflow_arg_area38 to i64*
  %overflow_arg_area.next39 = getelementptr i8* %overflow_arg_area38, i32 8
  store i8* %overflow_arg_area.next39, i8** %overflow_arg_area_p37
  br label %vaarg.end40

vaarg.end40:                                      ; preds = %vaarg.in_mem36, %vaarg.in_reg34
  %vaarg.addr41 = phi i64* [ %20, %vaarg.in_reg34 ], [ %22, %vaarg.in_mem36 ]
  %23 = load i64* %vaarg.addr41
  %conv42 = trunc i64 %23 to i32
  store i32 %conv42, i32* @foo_arg, align 4
  %tmp43 = load %struct.__va_list_tag** %ap.addr, align 8
  %fp_offset_p44 = getelementptr inbounds %struct.__va_list_tag* %tmp43, i32 0, i32 1
  %fp_offset45 = load i32* %fp_offset_p44
  %fits_in_fp46 = icmp ule i32 %fp_offset45, 160
  br i1 %fits_in_fp46, label %vaarg.in_reg47, label %vaarg.in_mem49

vaarg.in_reg47:                                   ; preds = %vaarg.end40
  %24 = getelementptr inbounds %struct.__va_list_tag* %tmp43, i32 0, i32 3
  %reg_save_area48 = load i8** %24
  %25 = getelementptr i8* %reg_save_area48, i32 %fp_offset45
  %26 = bitcast i8* %25 to double*
  %27 = add i32 %fp_offset45, 16
  store i32 %27, i32* %fp_offset_p44
  br label %vaarg.end53

vaarg.in_mem49:                                   ; preds = %vaarg.end40
  %overflow_arg_area_p50 = getelementptr inbounds %struct.__va_list_tag* %tmp43, i32 0, i32 2
  %overflow_arg_area51 = load i8** %overflow_arg_area_p50
  %28 = bitcast i8* %overflow_arg_area51 to double*
  %overflow_arg_area.next52 = getelementptr i8* %overflow_arg_area51, i32 8
  store i8* %overflow_arg_area.next52, i8** %overflow_arg_area_p50
  br label %vaarg.end53

vaarg.end53:                                      ; preds = %vaarg.in_mem49, %vaarg.in_reg47
  %vaarg.addr54 = phi double* [ %26, %vaarg.in_reg47 ], [ %28, %vaarg.in_mem49 ]
  %29 = load double* %vaarg.addr54
  %tmp55 = load i32* @foo_arg, align 4
  %conv56 = sitofp i32 %tmp55 to double
  %add57 = fadd double %conv56, %29
  %conv58 = fptosi double %add57 to i32
  store i32 %conv58, i32* @foo_arg, align 4
  br label %sw.epilog

sw.bb59:                                          ; preds = %entry
  %tmp60 = load %struct.__va_list_tag** %ap.addr, align 8
  %gp_offset_p61 = getelementptr inbounds %struct.__va_list_tag* %tmp60, i32 0, i32 0
  %gp_offset62 = load i32* %gp_offset_p61
  %fits_in_gp63 = icmp ule i32 %gp_offset62, 40
  br i1 %fits_in_gp63, label %vaarg.in_reg64, label %vaarg.in_mem66

vaarg.in_reg64:                                   ; preds = %sw.bb59
  %30 = getelementptr inbounds %struct.__va_list_tag* %tmp60, i32 0, i32 3
  %reg_save_area65 = load i8** %30
  %31 = getelementptr i8* %reg_save_area65, i32 %gp_offset62
  %32 = bitcast i8* %31 to i32*
  %33 = add i32 %gp_offset62, 8
  store i32 %33, i32* %gp_offset_p61
  br label %vaarg.end70

vaarg.in_mem66:                                   ; preds = %sw.bb59
  %overflow_arg_area_p67 = getelementptr inbounds %struct.__va_list_tag* %tmp60, i32 0, i32 2
  %overflow_arg_area68 = load i8** %overflow_arg_area_p67
  %34 = bitcast i8* %overflow_arg_area68 to i32*
  %overflow_arg_area.next69 = getelementptr i8* %overflow_arg_area68, i32 8
  store i8* %overflow_arg_area.next69, i8** %overflow_arg_area_p67
  br label %vaarg.end70

vaarg.end70:                                      ; preds = %vaarg.in_mem66, %vaarg.in_reg64
  %vaarg.addr71 = phi i32* [ %32, %vaarg.in_reg64 ], [ %34, %vaarg.in_mem66 ]
  %35 = load i32* %vaarg.addr71
  store i32 %35, i32* @foo_arg, align 4
  %tmp72 = load %struct.__va_list_tag** %ap.addr, align 8
  %overflow_arg_area_p73 = getelementptr inbounds %struct.__va_list_tag* %tmp72, i32 0, i32 2
  %overflow_arg_area74 = load i8** %overflow_arg_area_p73
  %36 = getelementptr i8* %overflow_arg_area74, i32 15
  %37 = ptrtoint i8* %36 to i64
  %38 = and i64 %37, -16
  %overflow_arg_area.align = inttoptr i64 %38 to i8*
  %39 = bitcast i8* %overflow_arg_area.align to x86_fp80*
  %overflow_arg_area.next75 = getelementptr i8* %overflow_arg_area.align, i32 16
  store i8* %overflow_arg_area.next75, i8** %overflow_arg_area_p73
  %40 = load x86_fp80* %39
  %tmp76 = load i32* @foo_arg, align 4
  %conv77 = sitofp i32 %tmp76 to x86_fp80
  %add78 = fadd x86_fp80 %conv77, %40
  %conv79 = fptosi x86_fp80 %add78 to i32
  store i32 %conv79, i32* @foo_arg, align 4
  br label %sw.epilog

sw.default:                                       ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

sw.epilog:                                        ; preds = %vaarg.end70, %vaarg.end53, %vaarg.end23
  ret void
}

declare void @abort() noreturn nounwind

define void @bar(i32 %v) nounwind uwtable {
entry:
  %v.addr = alloca i32, align 4
  store i32 %v, i32* %v.addr, align 4
  %tmp = load i32* %v.addr, align 4
  %cmp = icmp eq i32 %tmp, 16386
  br i1 %cmp, label %if.then, label %if.end11

if.then:                                          ; preds = %entry
  %gp_offset = load i32* getelementptr inbounds ([1 x %struct.__va_list_tag]* @gap, i32 0, i32 0, i32 0)
  %fits_in_gp = icmp ule i32 %gp_offset, 40
  br i1 %fits_in_gp, label %vaarg.in_reg, label %vaarg.in_mem

vaarg.in_reg:                                     ; preds = %if.then
  %reg_save_area = load i8** getelementptr inbounds ([1 x %struct.__va_list_tag]* @gap, i32 0, i32 0, i32 3)
  %0 = getelementptr i8* %reg_save_area, i32 %gp_offset
  %1 = bitcast i8* %0 to i32*
  %2 = add i32 %gp_offset, 8
  store i32 %2, i32* getelementptr inbounds ([1 x %struct.__va_list_tag]* @gap, i32 0, i32 0, i32 0)
  br label %vaarg.end

vaarg.in_mem:                                     ; preds = %if.then
  %overflow_arg_area = load i8** getelementptr inbounds ([1 x %struct.__va_list_tag]* @gap, i32 0, i32 0, i32 2)
  %3 = bitcast i8* %overflow_arg_area to i32*
  %overflow_arg_area.next = getelementptr i8* %overflow_arg_area, i32 8
  store i8* %overflow_arg_area.next, i8** getelementptr inbounds ([1 x %struct.__va_list_tag]* @gap, i32 0, i32 0, i32 2)
  br label %vaarg.end

vaarg.end:                                        ; preds = %vaarg.in_mem, %vaarg.in_reg
  %vaarg.addr = phi i32* [ %1, %vaarg.in_reg ], [ %3, %vaarg.in_mem ]
  %4 = load i32* %vaarg.addr
  %cmp1 = icmp ne i32 %4, 13
  br i1 %cmp1, label %if.then10, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %vaarg.end
  %fp_offset = load i32* getelementptr inbounds ([1 x %struct.__va_list_tag]* @gap, i32 0, i32 0, i32 1)
  %fits_in_fp = icmp ule i32 %fp_offset, 160
  br i1 %fits_in_fp, label %vaarg.in_reg2, label %vaarg.in_mem4

vaarg.in_reg2:                                    ; preds = %lor.lhs.false
  %reg_save_area3 = load i8** getelementptr inbounds ([1 x %struct.__va_list_tag]* @gap, i32 0, i32 0, i32 3)
  %5 = getelementptr i8* %reg_save_area3, i32 %fp_offset
  %6 = bitcast i8* %5 to double*
  %7 = add i32 %fp_offset, 16
  store i32 %7, i32* getelementptr inbounds ([1 x %struct.__va_list_tag]* @gap, i32 0, i32 0, i32 1)
  br label %vaarg.end7

vaarg.in_mem4:                                    ; preds = %lor.lhs.false
  %overflow_arg_area5 = load i8** getelementptr inbounds ([1 x %struct.__va_list_tag]* @gap, i32 0, i32 0, i32 2)
  %8 = bitcast i8* %overflow_arg_area5 to double*
  %overflow_arg_area.next6 = getelementptr i8* %overflow_arg_area5, i32 8
  store i8* %overflow_arg_area.next6, i8** getelementptr inbounds ([1 x %struct.__va_list_tag]* @gap, i32 0, i32 0, i32 2)
  br label %vaarg.end7

vaarg.end7:                                       ; preds = %vaarg.in_mem4, %vaarg.in_reg2
  %vaarg.addr8 = phi double* [ %6, %vaarg.in_reg2 ], [ %8, %vaarg.in_mem4 ]
  %9 = load double* %vaarg.addr8
  %cmp9 = fcmp une double %9, -1.400000e+01
  br i1 %cmp9, label %if.then10, label %if.end

if.then10:                                        ; preds = %vaarg.end7, %vaarg.end
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %vaarg.end7
  br label %if.end11

if.end11:                                         ; preds = %if.end, %entry
  %tmp12 = load i32* %v.addr, align 4
  store i32 %tmp12, i32* @bar_arg, align 4
  ret void
}

define void @f1(i32 %i, ...) nounwind uwtable {
entry:
  %i.addr = alloca i32, align 4
  store i32 %i, i32* %i.addr, align 4
  call void @llvm.va_start(i8* bitcast ([1 x %struct.__va_list_tag]* @gap to i8*))
  %gp_offset = load i32* getelementptr inbounds ([1 x %struct.__va_list_tag]* @gap, i32 0, i32 0, i32 0)
  %fits_in_gp = icmp ule i32 %gp_offset, 40
  br i1 %fits_in_gp, label %vaarg.in_reg, label %vaarg.in_mem

vaarg.in_reg:                                     ; preds = %entry
  %reg_save_area = load i8** getelementptr inbounds ([1 x %struct.__va_list_tag]* @gap, i32 0, i32 0, i32 3)
  %0 = getelementptr i8* %reg_save_area, i32 %gp_offset
  %1 = bitcast i8* %0 to i64*
  %2 = add i32 %gp_offset, 8
  store i32 %2, i32* getelementptr inbounds ([1 x %struct.__va_list_tag]* @gap, i32 0, i32 0, i32 0)
  br label %vaarg.end

vaarg.in_mem:                                     ; preds = %entry
  %overflow_arg_area = load i8** getelementptr inbounds ([1 x %struct.__va_list_tag]* @gap, i32 0, i32 0, i32 2)
  %3 = bitcast i8* %overflow_arg_area to i64*
  %overflow_arg_area.next = getelementptr i8* %overflow_arg_area, i32 8
  store i8* %overflow_arg_area.next, i8** getelementptr inbounds ([1 x %struct.__va_list_tag]* @gap, i32 0, i32 0, i32 2)
  br label %vaarg.end

vaarg.end:                                        ; preds = %vaarg.in_mem, %vaarg.in_reg
  %vaarg.addr = phi i64* [ %1, %vaarg.in_reg ], [ %3, %vaarg.in_mem ]
  %4 = load i64* %vaarg.addr
  store i64 %4, i64* @x, align 8
  call void @llvm.va_end(i8* bitcast ([1 x %struct.__va_list_tag]* @gap to i8*))
  ret void
}

declare void @llvm.va_start(i8*) nounwind

declare void @llvm.va_end(i8*) nounwind

define void @f2(i32 %i, ...) nounwind uwtable {
entry:
  %i.addr = alloca i32, align 4
  store i32 %i, i32* %i.addr, align 4
  call void @llvm.va_start(i8* bitcast ([1 x %struct.__va_list_tag]* @gap to i8*))
  %tmp = load i32* %i.addr, align 4
  call void @bar(i32 %tmp)
  call void @llvm.va_end(i8* bitcast ([1 x %struct.__va_list_tag]* @gap to i8*))
  ret void
}

define void @f3(i32 %i, ...) nounwind uwtable {
entry:
  %i.addr = alloca i32, align 4
  %aps = alloca [10 x [1 x %struct.__va_list_tag]], align 16
  store i32 %i, i32* %i.addr, align 4
  %arrayidx = getelementptr inbounds [10 x [1 x %struct.__va_list_tag]]* %aps, i32 0, i64 4
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %arrayidx, i32 0, i32 0
  %arraydecay1 = bitcast %struct.__va_list_tag* %arraydecay to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %arrayidx2 = getelementptr inbounds [10 x [1 x %struct.__va_list_tag]]* %aps, i32 0, i64 4
  %arraydecay3 = getelementptr inbounds [1 x %struct.__va_list_tag]* %arrayidx2, i32 0, i32 0
  %gp_offset_p = getelementptr inbounds %struct.__va_list_tag* %arraydecay3, i32 0, i32 0
  %gp_offset = load i32* %gp_offset_p
  %fits_in_gp = icmp ule i32 %gp_offset, 40
  br i1 %fits_in_gp, label %vaarg.in_reg, label %vaarg.in_mem

vaarg.in_reg:                                     ; preds = %entry
  %0 = getelementptr inbounds %struct.__va_list_tag* %arraydecay3, i32 0, i32 3
  %reg_save_area = load i8** %0
  %1 = getelementptr i8* %reg_save_area, i32 %gp_offset
  %2 = bitcast i8* %1 to i64*
  %3 = add i32 %gp_offset, 8
  store i32 %3, i32* %gp_offset_p
  br label %vaarg.end

vaarg.in_mem:                                     ; preds = %entry
  %overflow_arg_area_p = getelementptr inbounds %struct.__va_list_tag* %arraydecay3, i32 0, i32 2
  %overflow_arg_area = load i8** %overflow_arg_area_p
  %4 = bitcast i8* %overflow_arg_area to i64*
  %overflow_arg_area.next = getelementptr i8* %overflow_arg_area, i32 8
  store i8* %overflow_arg_area.next, i8** %overflow_arg_area_p
  br label %vaarg.end

vaarg.end:                                        ; preds = %vaarg.in_mem, %vaarg.in_reg
  %vaarg.addr = phi i64* [ %2, %vaarg.in_reg ], [ %4, %vaarg.in_mem ]
  %5 = load i64* %vaarg.addr
  store i64 %5, i64* @x, align 8
  %arrayidx4 = getelementptr inbounds [10 x [1 x %struct.__va_list_tag]]* %aps, i32 0, i64 4
  %arraydecay5 = getelementptr inbounds [1 x %struct.__va_list_tag]* %arrayidx4, i32 0, i32 0
  %arraydecay56 = bitcast %struct.__va_list_tag* %arraydecay5 to i8*
  call void @llvm.va_end(i8* %arraydecay56)
  ret void
}

define void @f4(i32 %i, ...) nounwind uwtable {
entry:
  %i.addr = alloca i32, align 4
  %aps = alloca [10 x [1 x %struct.__va_list_tag]], align 16
  store i32 %i, i32* %i.addr, align 4
  %arrayidx = getelementptr inbounds [10 x [1 x %struct.__va_list_tag]]* %aps, i32 0, i64 4
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %arrayidx, i32 0, i32 0
  %arraydecay1 = bitcast %struct.__va_list_tag* %arraydecay to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %tmp = load i32* %i.addr, align 4
  call void @bar(i32 %tmp)
  %arrayidx2 = getelementptr inbounds [10 x [1 x %struct.__va_list_tag]]* %aps, i32 0, i64 4
  %arraydecay3 = getelementptr inbounds [1 x %struct.__va_list_tag]* %arrayidx2, i32 0, i32 0
  %arraydecay34 = bitcast %struct.__va_list_tag* %arraydecay3 to i8*
  call void @llvm.va_end(i8* %arraydecay34)
  ret void
}

define void @f5(i32 %i, ...) nounwind uwtable {
entry:
  %i.addr = alloca i32, align 4
  %aps = alloca [10 x [1 x %struct.__va_list_tag]], align 16
  store i32 %i, i32* %i.addr, align 4
  %arrayidx = getelementptr inbounds [10 x [1 x %struct.__va_list_tag]]* %aps, i32 0, i64 4
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %arrayidx, i32 0, i32 0
  %arraydecay1 = bitcast %struct.__va_list_tag* %arraydecay to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %tmp = load i32* %i.addr, align 4
  %arrayidx2 = getelementptr inbounds [10 x [1 x %struct.__va_list_tag]]* %aps, i32 0, i64 4
  %arraydecay3 = getelementptr inbounds [1 x %struct.__va_list_tag]* %arrayidx2, i32 0, i32 0
  call void @foo(i32 %tmp, %struct.__va_list_tag* %arraydecay3)
  %arrayidx4 = getelementptr inbounds [10 x [1 x %struct.__va_list_tag]]* %aps, i32 0, i64 4
  %arraydecay5 = getelementptr inbounds [1 x %struct.__va_list_tag]* %arrayidx4, i32 0, i32 0
  %arraydecay56 = bitcast %struct.__va_list_tag* %arraydecay5 to i8*
  call void @llvm.va_end(i8* %arraydecay56)
  ret void
}

define void @f6(i32 %i, ...) nounwind uwtable {
entry:
  %i.addr = alloca i32, align 4
  %a = alloca %struct.A, align 8
  store i32 %i, i32* %i.addr, align 4
  %g = getelementptr inbounds %struct.A* %a, i32 0, i32 1
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %g, i32 0, i32 0
  %arraydecay1 = bitcast %struct.__va_list_tag* %arraydecay to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %g2 = getelementptr inbounds %struct.A* %a, i32 0, i32 1
  %arraydecay3 = getelementptr inbounds [1 x %struct.__va_list_tag]* %g2, i32 0, i32 0
  %gp_offset_p = getelementptr inbounds %struct.__va_list_tag* %arraydecay3, i32 0, i32 0
  %gp_offset = load i32* %gp_offset_p
  %fits_in_gp = icmp ule i32 %gp_offset, 40
  br i1 %fits_in_gp, label %vaarg.in_reg, label %vaarg.in_mem

vaarg.in_reg:                                     ; preds = %entry
  %0 = getelementptr inbounds %struct.__va_list_tag* %arraydecay3, i32 0, i32 3
  %reg_save_area = load i8** %0
  %1 = getelementptr i8* %reg_save_area, i32 %gp_offset
  %2 = bitcast i8* %1 to i64*
  %3 = add i32 %gp_offset, 8
  store i32 %3, i32* %gp_offset_p
  br label %vaarg.end

vaarg.in_mem:                                     ; preds = %entry
  %overflow_arg_area_p = getelementptr inbounds %struct.__va_list_tag* %arraydecay3, i32 0, i32 2
  %overflow_arg_area = load i8** %overflow_arg_area_p
  %4 = bitcast i8* %overflow_arg_area to i64*
  %overflow_arg_area.next = getelementptr i8* %overflow_arg_area, i32 8
  store i8* %overflow_arg_area.next, i8** %overflow_arg_area_p
  br label %vaarg.end

vaarg.end:                                        ; preds = %vaarg.in_mem, %vaarg.in_reg
  %vaarg.addr = phi i64* [ %2, %vaarg.in_reg ], [ %4, %vaarg.in_mem ]
  %5 = load i64* %vaarg.addr
  store i64 %5, i64* @x, align 8
  %g4 = getelementptr inbounds %struct.A* %a, i32 0, i32 1
  %arraydecay5 = getelementptr inbounds [1 x %struct.__va_list_tag]* %g4, i32 0, i32 0
  %arraydecay56 = bitcast %struct.__va_list_tag* %arraydecay5 to i8*
  call void @llvm.va_end(i8* %arraydecay56)
  ret void
}

define void @f7(i32 %i, ...) nounwind uwtable {
entry:
  %i.addr = alloca i32, align 4
  %a = alloca %struct.A, align 8
  store i32 %i, i32* %i.addr, align 4
  %g = getelementptr inbounds %struct.A* %a, i32 0, i32 1
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %g, i32 0, i32 0
  %arraydecay1 = bitcast %struct.__va_list_tag* %arraydecay to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %tmp = load i32* %i.addr, align 4
  call void @bar(i32 %tmp)
  %g2 = getelementptr inbounds %struct.A* %a, i32 0, i32 1
  %arraydecay3 = getelementptr inbounds [1 x %struct.__va_list_tag]* %g2, i32 0, i32 0
  %arraydecay34 = bitcast %struct.__va_list_tag* %arraydecay3 to i8*
  call void @llvm.va_end(i8* %arraydecay34)
  ret void
}

define void @f8(i32 %i, ...) nounwind uwtable {
entry:
  %i.addr = alloca i32, align 4
  %a = alloca %struct.A, align 8
  store i32 %i, i32* %i.addr, align 4
  %g = getelementptr inbounds %struct.A* %a, i32 0, i32 1
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %g, i32 0, i32 0
  %arraydecay1 = bitcast %struct.__va_list_tag* %arraydecay to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %tmp = load i32* %i.addr, align 4
  %g2 = getelementptr inbounds %struct.A* %a, i32 0, i32 1
  %arraydecay3 = getelementptr inbounds [1 x %struct.__va_list_tag]* %g2, i32 0, i32 0
  call void @foo(i32 %tmp, %struct.__va_list_tag* %arraydecay3)
  %g4 = getelementptr inbounds %struct.A* %a, i32 0, i32 1
  %arraydecay5 = getelementptr inbounds [1 x %struct.__va_list_tag]* %g4, i32 0, i32 0
  %arraydecay56 = bitcast %struct.__va_list_tag* %arraydecay5 to i8*
  call void @llvm.va_end(i8* %arraydecay56)
  ret void
}

define void @f10(i32 %i, ...) nounwind uwtable {
entry:
  %i.addr = alloca i32, align 4
  %a = alloca %struct.A, align 8
  store i32 %i, i32* %i.addr, align 4
  %h = getelementptr inbounds %struct.A* %a, i32 0, i32 2
  %arrayidx = getelementptr inbounds [2 x [1 x %struct.__va_list_tag]]* %h, i32 0, i64 1
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %arrayidx, i32 0, i32 0
  %arraydecay1 = bitcast %struct.__va_list_tag* %arraydecay to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %h2 = getelementptr inbounds %struct.A* %a, i32 0, i32 2
  %arrayidx3 = getelementptr inbounds [2 x [1 x %struct.__va_list_tag]]* %h2, i32 0, i64 1
  %arraydecay4 = getelementptr inbounds [1 x %struct.__va_list_tag]* %arrayidx3, i32 0, i32 0
  %gp_offset_p = getelementptr inbounds %struct.__va_list_tag* %arraydecay4, i32 0, i32 0
  %gp_offset = load i32* %gp_offset_p
  %fits_in_gp = icmp ule i32 %gp_offset, 40
  br i1 %fits_in_gp, label %vaarg.in_reg, label %vaarg.in_mem

vaarg.in_reg:                                     ; preds = %entry
  %0 = getelementptr inbounds %struct.__va_list_tag* %arraydecay4, i32 0, i32 3
  %reg_save_area = load i8** %0
  %1 = getelementptr i8* %reg_save_area, i32 %gp_offset
  %2 = bitcast i8* %1 to i64*
  %3 = add i32 %gp_offset, 8
  store i32 %3, i32* %gp_offset_p
  br label %vaarg.end

vaarg.in_mem:                                     ; preds = %entry
  %overflow_arg_area_p = getelementptr inbounds %struct.__va_list_tag* %arraydecay4, i32 0, i32 2
  %overflow_arg_area = load i8** %overflow_arg_area_p
  %4 = bitcast i8* %overflow_arg_area to i64*
  %overflow_arg_area.next = getelementptr i8* %overflow_arg_area, i32 8
  store i8* %overflow_arg_area.next, i8** %overflow_arg_area_p
  br label %vaarg.end

vaarg.end:                                        ; preds = %vaarg.in_mem, %vaarg.in_reg
  %vaarg.addr = phi i64* [ %2, %vaarg.in_reg ], [ %4, %vaarg.in_mem ]
  %5 = load i64* %vaarg.addr
  store i64 %5, i64* @x, align 8
  %h5 = getelementptr inbounds %struct.A* %a, i32 0, i32 2
  %arrayidx6 = getelementptr inbounds [2 x [1 x %struct.__va_list_tag]]* %h5, i32 0, i64 1
  %arraydecay7 = getelementptr inbounds [1 x %struct.__va_list_tag]* %arrayidx6, i32 0, i32 0
  %arraydecay78 = bitcast %struct.__va_list_tag* %arraydecay7 to i8*
  call void @llvm.va_end(i8* %arraydecay78)
  ret void
}

define void @f11(i32 %i, ...) nounwind uwtable {
entry:
  %i.addr = alloca i32, align 4
  %a = alloca %struct.A, align 8
  store i32 %i, i32* %i.addr, align 4
  %h = getelementptr inbounds %struct.A* %a, i32 0, i32 2
  %arrayidx = getelementptr inbounds [2 x [1 x %struct.__va_list_tag]]* %h, i32 0, i64 1
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %arrayidx, i32 0, i32 0
  %arraydecay1 = bitcast %struct.__va_list_tag* %arraydecay to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %tmp = load i32* %i.addr, align 4
  call void @bar(i32 %tmp)
  %h2 = getelementptr inbounds %struct.A* %a, i32 0, i32 2
  %arrayidx3 = getelementptr inbounds [2 x [1 x %struct.__va_list_tag]]* %h2, i32 0, i64 1
  %arraydecay4 = getelementptr inbounds [1 x %struct.__va_list_tag]* %arrayidx3, i32 0, i32 0
  %arraydecay45 = bitcast %struct.__va_list_tag* %arraydecay4 to i8*
  call void @llvm.va_end(i8* %arraydecay45)
  ret void
}

define void @f12(i32 %i, ...) nounwind uwtable {
entry:
  %i.addr = alloca i32, align 4
  %a = alloca %struct.A, align 8
  store i32 %i, i32* %i.addr, align 4
  %h = getelementptr inbounds %struct.A* %a, i32 0, i32 2
  %arrayidx = getelementptr inbounds [2 x [1 x %struct.__va_list_tag]]* %h, i32 0, i64 1
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %arrayidx, i32 0, i32 0
  %arraydecay1 = bitcast %struct.__va_list_tag* %arraydecay to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %tmp = load i32* %i.addr, align 4
  %h2 = getelementptr inbounds %struct.A* %a, i32 0, i32 2
  %arrayidx3 = getelementptr inbounds [2 x [1 x %struct.__va_list_tag]]* %h2, i32 0, i64 1
  %arraydecay4 = getelementptr inbounds [1 x %struct.__va_list_tag]* %arrayidx3, i32 0, i32 0
  call void @foo(i32 %tmp, %struct.__va_list_tag* %arraydecay4)
  %h5 = getelementptr inbounds %struct.A* %a, i32 0, i32 2
  %arrayidx6 = getelementptr inbounds [2 x [1 x %struct.__va_list_tag]]* %h5, i32 0, i64 1
  %arraydecay7 = getelementptr inbounds [1 x %struct.__va_list_tag]* %arrayidx6, i32 0, i32 0
  %arraydecay78 = bitcast %struct.__va_list_tag* %arraydecay7 to i8*
  call void @llvm.va_end(i8* %arraydecay78)
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  call void (i32, ...)* @f1(i32 1, i64 79)
  %tmp = load i64* @x, align 8
  %cmp = icmp ne i64 %tmp, 79
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  call void (i32, ...)* @f2(i32 16386, i32 13, double -1.400000e+01)
  %tmp1 = load i32* @bar_arg, align 4
  %cmp2 = icmp ne i32 %tmp1, 16386
  br i1 %cmp2, label %if.then3, label %if.end4

if.then3:                                         ; preds = %if.end
  call void @abort() noreturn nounwind
  unreachable

if.end4:                                          ; preds = %if.end
  call void (i32, ...)* @f3(i32 3, i64 2031)
  %tmp5 = load i64* @x, align 8
  %cmp6 = icmp ne i64 %tmp5, 2031
  br i1 %cmp6, label %if.then7, label %if.end8

if.then7:                                         ; preds = %if.end4
  call void @abort() noreturn nounwind
  unreachable

if.end8:                                          ; preds = %if.end4
  call void (i32, ...)* @f4(i32 4, i32 18)
  %tmp9 = load i32* @bar_arg, align 4
  %cmp10 = icmp ne i32 %tmp9, 4
  br i1 %cmp10, label %if.then11, label %if.end12

if.then11:                                        ; preds = %if.end8
  call void @abort() noreturn nounwind
  unreachable

if.end12:                                         ; preds = %if.end8
  call void (i32, ...)* @f5(i32 5, i32 1, double 1.900000e+01, i64 18)
  %tmp13 = load i32* @foo_arg, align 4
  %cmp14 = icmp ne i32 %tmp13, 38
  br i1 %cmp14, label %if.then15, label %if.end16

if.then15:                                        ; preds = %if.end12
  call void @abort() noreturn nounwind
  unreachable

if.end16:                                         ; preds = %if.end12
  call void (i32, ...)* @f6(i32 6, i64 18)
  %tmp17 = load i64* @x, align 8
  %cmp18 = icmp ne i64 %tmp17, 18
  br i1 %cmp18, label %if.then19, label %if.end20

if.then19:                                        ; preds = %if.end16
  call void @abort() noreturn nounwind
  unreachable

if.end20:                                         ; preds = %if.end16
  call void (i32, ...)* @f7(i32 7)
  %tmp21 = load i32* @bar_arg, align 4
  %cmp22 = icmp ne i32 %tmp21, 7
  br i1 %cmp22, label %if.then23, label %if.end24

if.then23:                                        ; preds = %if.end20
  call void @abort() noreturn nounwind
  unreachable

if.end24:                                         ; preds = %if.end20
  call void (i32, ...)* @f8(i32 8, i64 2031, double 1.300000e+01)
  %tmp25 = load i32* @foo_arg, align 4
  %cmp26 = icmp ne i32 %tmp25, 2044
  br i1 %cmp26, label %if.then27, label %if.end28

if.then27:                                        ; preds = %if.end24
  call void @abort() noreturn nounwind
  unreachable

if.end28:                                         ; preds = %if.end24
  call void (i32, ...)* @f10(i32 9, i64 180)
  %tmp29 = load i64* @x, align 8
  %cmp30 = icmp ne i64 %tmp29, 180
  br i1 %cmp30, label %if.then31, label %if.end32

if.then31:                                        ; preds = %if.end28
  call void @abort() noreturn nounwind
  unreachable

if.end32:                                         ; preds = %if.end28
  call void (i32, ...)* @f11(i32 10)
  %tmp33 = load i32* @bar_arg, align 4
  %cmp34 = icmp ne i32 %tmp33, 10
  br i1 %cmp34, label %if.then35, label %if.end36

if.then35:                                        ; preds = %if.end32
  call void @abort() noreturn nounwind
  unreachable

if.end36:                                         ; preds = %if.end32
  call void (i32, ...)* @f12(i32 11, i32 2030, x86_fp80 0xK4002C000000000000000)
  %tmp37 = load i32* @foo_arg, align 4
  %cmp38 = icmp ne i32 %tmp37, 2042
  br i1 %cmp38, label %if.then39, label %if.end40

if.then39:                                        ; preds = %if.end36
  call void @abort() noreturn nounwind
  unreachable

if.end40:                                         ; preds = %if.end36
  ret i32 0
}
