; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/stdarg-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.__va_list_tag = type { i32, i32, i8*, i8* }

@foo_arg = common global i32 0, align 4
@gap = common global [1 x %struct.__va_list_tag] zeroinitializer, align 16
@pap = common global [1 x %struct.__va_list_tag]* null, align 8
@bar_arg = common global i32 0, align 4
@d = common global double 0.000000e+00, align 8
@x = common global i64 0, align 8

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
  br label %sw.epilog

sw.default:                                       ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

sw.epilog:                                        ; preds = %vaarg.end
  ret void
}

declare void @abort() noreturn nounwind

define void @bar(i32 %v) nounwind uwtable {
entry:
  %v.addr = alloca i32, align 4
  store i32 %v, i32* %v.addr, align 4
  %tmp = load i32* %v.addr, align 4
  %cmp = icmp eq i32 %tmp, 16390
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %fp_offset = load i32* getelementptr inbounds ([1 x %struct.__va_list_tag]* @gap, i32 0, i32 0, i32 1)
  %fits_in_fp = icmp ule i32 %fp_offset, 160
  br i1 %fits_in_fp, label %vaarg.in_reg, label %vaarg.in_mem

vaarg.in_reg:                                     ; preds = %if.then
  %reg_save_area = load i8** getelementptr inbounds ([1 x %struct.__va_list_tag]* @gap, i32 0, i32 0, i32 3)
  %0 = getelementptr i8* %reg_save_area, i32 %fp_offset
  %1 = bitcast i8* %0 to double*
  %2 = add i32 %fp_offset, 16
  store i32 %2, i32* getelementptr inbounds ([1 x %struct.__va_list_tag]* @gap, i32 0, i32 0, i32 1)
  br label %vaarg.end

vaarg.in_mem:                                     ; preds = %if.then
  %overflow_arg_area = load i8** getelementptr inbounds ([1 x %struct.__va_list_tag]* @gap, i32 0, i32 0, i32 2)
  %3 = bitcast i8* %overflow_arg_area to double*
  %overflow_arg_area.next = getelementptr i8* %overflow_arg_area, i32 8
  store i8* %overflow_arg_area.next, i8** getelementptr inbounds ([1 x %struct.__va_list_tag]* @gap, i32 0, i32 0, i32 2)
  br label %vaarg.end

vaarg.end:                                        ; preds = %vaarg.in_mem, %vaarg.in_reg
  %vaarg.addr = phi double* [ %1, %vaarg.in_reg ], [ %3, %vaarg.in_mem ]
  %4 = load double* %vaarg.addr
  %cmp1 = fcmp une double %4, 1.700000e+01
  br i1 %cmp1, label %if.then10, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %vaarg.end
  %gp_offset = load i32* getelementptr inbounds ([1 x %struct.__va_list_tag]* @gap, i32 0, i32 0, i32 0)
  %fits_in_gp = icmp ule i32 %gp_offset, 40
  br i1 %fits_in_gp, label %vaarg.in_reg2, label %vaarg.in_mem4

vaarg.in_reg2:                                    ; preds = %lor.lhs.false
  %reg_save_area3 = load i8** getelementptr inbounds ([1 x %struct.__va_list_tag]* @gap, i32 0, i32 0, i32 3)
  %5 = getelementptr i8* %reg_save_area3, i32 %gp_offset
  %6 = bitcast i8* %5 to i64*
  %7 = add i32 %gp_offset, 8
  store i32 %7, i32* getelementptr inbounds ([1 x %struct.__va_list_tag]* @gap, i32 0, i32 0, i32 0)
  br label %vaarg.end7

vaarg.in_mem4:                                    ; preds = %lor.lhs.false
  %overflow_arg_area5 = load i8** getelementptr inbounds ([1 x %struct.__va_list_tag]* @gap, i32 0, i32 0, i32 2)
  %8 = bitcast i8* %overflow_arg_area5 to i64*
  %overflow_arg_area.next6 = getelementptr i8* %overflow_arg_area5, i32 8
  store i8* %overflow_arg_area.next6, i8** getelementptr inbounds ([1 x %struct.__va_list_tag]* @gap, i32 0, i32 0, i32 2)
  br label %vaarg.end7

vaarg.end7:                                       ; preds = %vaarg.in_mem4, %vaarg.in_reg2
  %vaarg.addr8 = phi i64* [ %6, %vaarg.in_reg2 ], [ %8, %vaarg.in_mem4 ]
  %9 = load i64* %vaarg.addr8
  %cmp9 = icmp ne i64 %9, 129
  br i1 %cmp9, label %if.then10, label %if.end

if.then10:                                        ; preds = %vaarg.end7, %vaarg.end
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %vaarg.end7
  br label %if.end50

if.else:                                          ; preds = %entry
  %tmp11 = load i32* %v.addr, align 4
  %cmp12 = icmp eq i32 %tmp11, 16392
  br i1 %cmp12, label %if.then13, label %if.end49

if.then13:                                        ; preds = %if.else
  %tmp14 = load [1 x %struct.__va_list_tag]** @pap, align 8
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %tmp14, i32 0, i32 0
  %gp_offset_p = getelementptr inbounds %struct.__va_list_tag* %arraydecay, i32 0, i32 0
  %gp_offset15 = load i32* %gp_offset_p
  %fits_in_gp16 = icmp ule i32 %gp_offset15, 40
  br i1 %fits_in_gp16, label %vaarg.in_reg17, label %vaarg.in_mem19

vaarg.in_reg17:                                   ; preds = %if.then13
  %10 = getelementptr inbounds %struct.__va_list_tag* %arraydecay, i32 0, i32 3
  %reg_save_area18 = load i8** %10
  %11 = getelementptr i8* %reg_save_area18, i32 %gp_offset15
  %12 = bitcast i8* %11 to i64*
  %13 = add i32 %gp_offset15, 8
  store i32 %13, i32* %gp_offset_p
  br label %vaarg.end22

vaarg.in_mem19:                                   ; preds = %if.then13
  %overflow_arg_area_p = getelementptr inbounds %struct.__va_list_tag* %arraydecay, i32 0, i32 2
  %overflow_arg_area20 = load i8** %overflow_arg_area_p
  %14 = bitcast i8* %overflow_arg_area20 to i64*
  %overflow_arg_area.next21 = getelementptr i8* %overflow_arg_area20, i32 8
  store i8* %overflow_arg_area.next21, i8** %overflow_arg_area_p
  br label %vaarg.end22

vaarg.end22:                                      ; preds = %vaarg.in_mem19, %vaarg.in_reg17
  %vaarg.addr23 = phi i64* [ %12, %vaarg.in_reg17 ], [ %14, %vaarg.in_mem19 ]
  %15 = load i64* %vaarg.addr23
  %cmp24 = icmp ne i64 %15, 14
  br i1 %cmp24, label %if.then47, label %lor.lhs.false25

lor.lhs.false25:                                  ; preds = %vaarg.end22
  %tmp26 = load [1 x %struct.__va_list_tag]** @pap, align 8
  %arraydecay27 = getelementptr inbounds [1 x %struct.__va_list_tag]* %tmp26, i32 0, i32 0
  %overflow_arg_area_p28 = getelementptr inbounds %struct.__va_list_tag* %arraydecay27, i32 0, i32 2
  %overflow_arg_area29 = load i8** %overflow_arg_area_p28
  %16 = getelementptr i8* %overflow_arg_area29, i32 15
  %17 = ptrtoint i8* %16 to i64
  %18 = and i64 %17, -16
  %overflow_arg_area.align = inttoptr i64 %18 to i8*
  %19 = bitcast i8* %overflow_arg_area.align to x86_fp80*
  %overflow_arg_area.next30 = getelementptr i8* %overflow_arg_area.align, i32 16
  store i8* %overflow_arg_area.next30, i8** %overflow_arg_area_p28
  %20 = load x86_fp80* %19
  %cmp31 = fcmp une x86_fp80 %20, 0xK40068300000000000000
  br i1 %cmp31, label %if.then47, label %lor.lhs.false32

lor.lhs.false32:                                  ; preds = %lor.lhs.false25
  %tmp33 = load [1 x %struct.__va_list_tag]** @pap, align 8
  %arraydecay34 = getelementptr inbounds [1 x %struct.__va_list_tag]* %tmp33, i32 0, i32 0
  %gp_offset_p35 = getelementptr inbounds %struct.__va_list_tag* %arraydecay34, i32 0, i32 0
  %gp_offset36 = load i32* %gp_offset_p35
  %fits_in_gp37 = icmp ule i32 %gp_offset36, 40
  br i1 %fits_in_gp37, label %vaarg.in_reg38, label %vaarg.in_mem40

vaarg.in_reg38:                                   ; preds = %lor.lhs.false32
  %21 = getelementptr inbounds %struct.__va_list_tag* %arraydecay34, i32 0, i32 3
  %reg_save_area39 = load i8** %21
  %22 = getelementptr i8* %reg_save_area39, i32 %gp_offset36
  %23 = bitcast i8* %22 to i32*
  %24 = add i32 %gp_offset36, 8
  store i32 %24, i32* %gp_offset_p35
  br label %vaarg.end44

vaarg.in_mem40:                                   ; preds = %lor.lhs.false32
  %overflow_arg_area_p41 = getelementptr inbounds %struct.__va_list_tag* %arraydecay34, i32 0, i32 2
  %overflow_arg_area42 = load i8** %overflow_arg_area_p41
  %25 = bitcast i8* %overflow_arg_area42 to i32*
  %overflow_arg_area.next43 = getelementptr i8* %overflow_arg_area42, i32 8
  store i8* %overflow_arg_area.next43, i8** %overflow_arg_area_p41
  br label %vaarg.end44

vaarg.end44:                                      ; preds = %vaarg.in_mem40, %vaarg.in_reg38
  %vaarg.addr45 = phi i32* [ %23, %vaarg.in_reg38 ], [ %25, %vaarg.in_mem40 ]
  %26 = load i32* %vaarg.addr45
  %cmp46 = icmp ne i32 %26, 17
  br i1 %cmp46, label %if.then47, label %if.end48

if.then47:                                        ; preds = %vaarg.end44, %lor.lhs.false25, %vaarg.end22
  call void @abort() noreturn nounwind
  unreachable

if.end48:                                         ; preds = %vaarg.end44
  br label %if.end49

if.end49:                                         ; preds = %if.end48, %if.else
  br label %if.end50

if.end50:                                         ; preds = %if.end49, %if.end
  %tmp51 = load i32* %v.addr, align 4
  store i32 %tmp51, i32* @bar_arg, align 4
  ret void
}

define void @f0(i32 %i, ...) nounwind uwtable {
entry:
  %i.addr = alloca i32, align 4
  store i32 %i, i32* %i.addr, align 4
  ret void
}

define void @f1(i32 %i, ...) nounwind uwtable {
entry:
  %i.addr = alloca i32, align 4
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  store i32 %i, i32* %i.addr, align 4
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %arraydecay1 = bitcast %struct.__va_list_tag* %arraydecay to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %arraydecay2 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %arraydecay23 = bitcast %struct.__va_list_tag* %arraydecay2 to i8*
  call void @llvm.va_end(i8* %arraydecay23)
  ret void
}

declare void @llvm.va_start(i8*) nounwind

declare void @llvm.va_end(i8*) nounwind

define void @f2(i32 %i, ...) nounwind uwtable {
entry:
  %i.addr = alloca i32, align 4
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  store i32 %i, i32* %i.addr, align 4
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %arraydecay1 = bitcast %struct.__va_list_tag* %arraydecay to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %tmp = load double* @d, align 8
  %conv = fptosi double %tmp to i32
  call void @bar(i32 %conv)
  %arraydecay2 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
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
  store i64 %5, i64* @x, align 8
  %tmp3 = load i64* @x, align 8
  %conv4 = trunc i64 %tmp3 to i32
  call void @bar(i32 %conv4)
  %arraydecay5 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %arraydecay56 = bitcast %struct.__va_list_tag* %arraydecay5 to i8*
  call void @llvm.va_end(i8* %arraydecay56)
  ret void
}

define void @f3(i32 %i, ...) nounwind uwtable {
entry:
  %i.addr = alloca i32, align 4
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  store i32 %i, i32* %i.addr, align 4
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
  store double %5, double* @d, align 8
  %arraydecay3 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %arraydecay34 = bitcast %struct.__va_list_tag* %arraydecay3 to i8*
  call void @llvm.va_end(i8* %arraydecay34)
  ret void
}

define void @f4(i32 %i, ...) nounwind uwtable {
entry:
  %i.addr = alloca i32, align 4
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  store i32 %i, i32* %i.addr, align 4
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
  %conv = fptosi double %5 to i64
  store i64 %conv, i64* @x, align 8
  %tmp = load i32* %i.addr, align 4
  %arraydecay3 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  call void @foo(i32 %tmp, %struct.__va_list_tag* %arraydecay3)
  %arraydecay4 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %arraydecay45 = bitcast %struct.__va_list_tag* %arraydecay4 to i8*
  call void @llvm.va_end(i8* %arraydecay45)
  ret void
}

define void @f5(i32 %i, ...) nounwind uwtable {
entry:
  %i.addr = alloca i32, align 4
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  store i32 %i, i32* %i.addr, align 4
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %arraydecay1 = bitcast %struct.__va_list_tag* %arraydecay to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %arraydecay2 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %0 = bitcast %struct.__va_list_tag* %arraydecay2 to i8*
  call void @llvm.va_copy(i8* bitcast ([1 x %struct.__va_list_tag]* @gap to i8*), i8* %0)
  %tmp = load i32* %i.addr, align 4
  call void @bar(i32 %tmp)
  %arraydecay3 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %arraydecay34 = bitcast %struct.__va_list_tag* %arraydecay3 to i8*
  call void @llvm.va_end(i8* %arraydecay34)
  call void @llvm.va_end(i8* bitcast ([1 x %struct.__va_list_tag]* @gap to i8*))
  ret void
}

declare void @llvm.va_copy(i8*, i8*) nounwind

define void @f6(i32 %i, ...) nounwind uwtable {
entry:
  %i.addr = alloca i32, align 4
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  store i32 %i, i32* %i.addr, align 4
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %arraydecay1 = bitcast %struct.__va_list_tag* %arraydecay to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %tmp = load double* @d, align 8
  %conv = fptosi double %tmp to i32
  call void @bar(i32 %conv)
  %arraydecay2 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
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
  %arraydecay3 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %gp_offset_p4 = getelementptr inbounds %struct.__va_list_tag* %arraydecay3, i32 0, i32 0
  %gp_offset5 = load i32* %gp_offset_p4
  %fits_in_gp6 = icmp ule i32 %gp_offset5, 40
  br i1 %fits_in_gp6, label %vaarg.in_reg7, label %vaarg.in_mem9

vaarg.in_reg7:                                    ; preds = %vaarg.end
  %6 = getelementptr inbounds %struct.__va_list_tag* %arraydecay3, i32 0, i32 3
  %reg_save_area8 = load i8** %6
  %7 = getelementptr i8* %reg_save_area8, i32 %gp_offset5
  %8 = bitcast i8* %7 to i64*
  %9 = add i32 %gp_offset5, 8
  store i32 %9, i32* %gp_offset_p4
  br label %vaarg.end13

vaarg.in_mem9:                                    ; preds = %vaarg.end
  %overflow_arg_area_p10 = getelementptr inbounds %struct.__va_list_tag* %arraydecay3, i32 0, i32 2
  %overflow_arg_area11 = load i8** %overflow_arg_area_p10
  %10 = bitcast i8* %overflow_arg_area11 to i64*
  %overflow_arg_area.next12 = getelementptr i8* %overflow_arg_area11, i32 8
  store i8* %overflow_arg_area.next12, i8** %overflow_arg_area_p10
  br label %vaarg.end13

vaarg.end13:                                      ; preds = %vaarg.in_mem9, %vaarg.in_reg7
  %vaarg.addr14 = phi i64* [ %8, %vaarg.in_reg7 ], [ %10, %vaarg.in_mem9 ]
  %11 = load i64* %vaarg.addr14
  %arraydecay15 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %gp_offset_p16 = getelementptr inbounds %struct.__va_list_tag* %arraydecay15, i32 0, i32 0
  %gp_offset17 = load i32* %gp_offset_p16
  %fits_in_gp18 = icmp ule i32 %gp_offset17, 40
  br i1 %fits_in_gp18, label %vaarg.in_reg19, label %vaarg.in_mem21

vaarg.in_reg19:                                   ; preds = %vaarg.end13
  %12 = getelementptr inbounds %struct.__va_list_tag* %arraydecay15, i32 0, i32 3
  %reg_save_area20 = load i8** %12
  %13 = getelementptr i8* %reg_save_area20, i32 %gp_offset17
  %14 = bitcast i8* %13 to i64*
  %15 = add i32 %gp_offset17, 8
  store i32 %15, i32* %gp_offset_p16
  br label %vaarg.end25

vaarg.in_mem21:                                   ; preds = %vaarg.end13
  %overflow_arg_area_p22 = getelementptr inbounds %struct.__va_list_tag* %arraydecay15, i32 0, i32 2
  %overflow_arg_area23 = load i8** %overflow_arg_area_p22
  %16 = bitcast i8* %overflow_arg_area23 to i64*
  %overflow_arg_area.next24 = getelementptr i8* %overflow_arg_area23, i32 8
  store i8* %overflow_arg_area.next24, i8** %overflow_arg_area_p22
  br label %vaarg.end25

vaarg.end25:                                      ; preds = %vaarg.in_mem21, %vaarg.in_reg19
  %vaarg.addr26 = phi i64* [ %14, %vaarg.in_reg19 ], [ %16, %vaarg.in_mem21 ]
  %17 = load i64* %vaarg.addr26
  store i64 %17, i64* @x, align 8
  %tmp27 = load i64* @x, align 8
  %conv28 = trunc i64 %tmp27 to i32
  call void @bar(i32 %conv28)
  %arraydecay29 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %arraydecay2930 = bitcast %struct.__va_list_tag* %arraydecay29 to i8*
  call void @llvm.va_end(i8* %arraydecay2930)
  ret void
}

define void @f7(i32 %i, ...) nounwind uwtable {
entry:
  %i.addr = alloca i32, align 4
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  store i32 %i, i32* %i.addr, align 4
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %arraydecay1 = bitcast %struct.__va_list_tag* %arraydecay to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  store [1 x %struct.__va_list_tag]* %ap, [1 x %struct.__va_list_tag]** @pap, align 8
  %tmp = load i32* %i.addr, align 4
  call void @bar(i32 %tmp)
  %arraydecay2 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %arraydecay23 = bitcast %struct.__va_list_tag* %arraydecay2 to i8*
  call void @llvm.va_end(i8* %arraydecay23)
  ret void
}

define void @f8(i32 %i, ...) nounwind uwtable {
entry:
  %i.addr = alloca i32, align 4
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  store i32 %i, i32* %i.addr, align 4
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %arraydecay1 = bitcast %struct.__va_list_tag* %arraydecay to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  store [1 x %struct.__va_list_tag]* %ap, [1 x %struct.__va_list_tag]** @pap, align 8
  %tmp = load i32* %i.addr, align 4
  call void @bar(i32 %tmp)
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
  store double %5, double* @d, align 8
  %arraydecay3 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %arraydecay34 = bitcast %struct.__va_list_tag* %arraydecay3 to i8*
  call void @llvm.va_end(i8* %arraydecay34)
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  call void (i32, ...)* @f0(i32 1)
  call void (i32, ...)* @f1(i32 2)
  store double 3.100000e+01, double* @d, align 8
  call void (i32, ...)* @f2(i32 3, i64 28)
  %tmp = load i32* @bar_arg, align 4
  %cmp = icmp ne i32 %tmp, 28
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %tmp1 = load i64* @x, align 8
  %cmp2 = icmp ne i64 %tmp1, 28
  br i1 %cmp2, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %lor.lhs.false
  call void (i32, ...)* @f3(i32 4, double 1.310000e+02)
  %tmp3 = load double* @d, align 8
  %cmp4 = fcmp une double %tmp3, 1.310000e+02
  br i1 %cmp4, label %if.then5, label %if.end6

if.then5:                                         ; preds = %if.end
  call void @abort() noreturn nounwind
  unreachable

if.end6:                                          ; preds = %if.end
  call void (i32, ...)* @f4(i32 5, double 1.600000e+01, i32 128)
  %tmp7 = load i64* @x, align 8
  %cmp8 = icmp ne i64 %tmp7, 16
  br i1 %cmp8, label %if.then12, label %lor.lhs.false9

lor.lhs.false9:                                   ; preds = %if.end6
  %tmp10 = load i32* @foo_arg, align 4
  %cmp11 = icmp ne i32 %tmp10, 128
  br i1 %cmp11, label %if.then12, label %if.end13

if.then12:                                        ; preds = %lor.lhs.false9, %if.end6
  call void @abort() noreturn nounwind
  unreachable

if.end13:                                         ; preds = %lor.lhs.false9
  call void (i32, ...)* @f5(i32 16390, double 1.700000e+01, i64 129)
  %tmp14 = load i32* @bar_arg, align 4
  %cmp15 = icmp ne i32 %tmp14, 16390
  br i1 %cmp15, label %if.then16, label %if.end17

if.then16:                                        ; preds = %if.end13
  call void @abort() noreturn nounwind
  unreachable

if.end17:                                         ; preds = %if.end13
  call void (i32, ...)* @f6(i32 7, i64 12, i64 14, i64 -31)
  %tmp18 = load i32* @bar_arg, align 4
  %cmp19 = icmp ne i32 %tmp18, -31
  br i1 %cmp19, label %if.then20, label %if.end21

if.then20:                                        ; preds = %if.end17
  call void @abort() noreturn nounwind
  unreachable

if.end21:                                         ; preds = %if.end17
  call void (i32, ...)* @f7(i32 16392, i64 14, x86_fp80 0xK40068300000000000000, i32 17, double 2.600000e+01)
  %tmp22 = load i32* @bar_arg, align 4
  %cmp23 = icmp ne i32 %tmp22, 16392
  br i1 %cmp23, label %if.then24, label %if.end25

if.then24:                                        ; preds = %if.end21
  call void @abort() noreturn nounwind
  unreachable

if.end25:                                         ; preds = %if.end21
  call void (i32, ...)* @f8(i32 16392, i64 14, x86_fp80 0xK40068300000000000000, i32 17, double 2.700000e+01)
  %tmp26 = load i32* @bar_arg, align 4
  %cmp27 = icmp ne i32 %tmp26, 16392
  br i1 %cmp27, label %if.then31, label %lor.lhs.false28

lor.lhs.false28:                                  ; preds = %if.end25
  %tmp29 = load double* @d, align 8
  %cmp30 = fcmp une double %tmp29, 2.700000e+01
  br i1 %cmp30, label %if.then31, label %if.end32

if.then31:                                        ; preds = %lor.lhs.false28, %if.end25
  call void @abort() noreturn nounwind
  unreachable

if.end32:                                         ; preds = %lor.lhs.false28
  ret i32 0
}
