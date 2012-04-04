; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/stdarg-1.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.__va_list_tag = type { i32, i32, i8*, i8* }

@foo_arg = common global i32 0, align 4
@gap = common global [1 x %struct.__va_list_tag] zeroinitializer, align 16
@pap = common global [1 x %struct.__va_list_tag]* null, align 8
@bar_arg = common global i32 0, align 4
@d = common global double 0.000000e+00, align 8
@x = common global i64 0, align 8

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
  %cond = icmp eq i32 %v, 5
  br i1 %cond, label %sw.bb, label %sw.default

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
  ret void

sw.default:                                       ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable
}

declare void @abort() noreturn nounwind

define void @bar(i32 %v) nounwind uwtable {
entry:
  switch i32 %v, label %if.end50 [
    i32 16390, label %if.then
    i32 16392, label %if.then13
  ]

if.then:                                          ; preds = %entry
  %fp_offset = load i32* getelementptr inbounds ([1 x %struct.__va_list_tag]* @gap, i64 0, i64 0, i32 1), align 4
  %fits_in_fp = icmp ult i32 %fp_offset, 161
  br i1 %fits_in_fp, label %vaarg.in_reg, label %vaarg.in_mem

vaarg.in_reg:                                     ; preds = %if.then
  %reg_save_area = load i8** getelementptr inbounds ([1 x %struct.__va_list_tag]* @gap, i64 0, i64 0, i32 3), align 16
  %0 = sext i32 %fp_offset to i64
  %1 = getelementptr i8* %reg_save_area, i64 %0
  %2 = add i32 %fp_offset, 16
  store i32 %2, i32* getelementptr inbounds ([1 x %struct.__va_list_tag]* @gap, i64 0, i64 0, i32 1), align 4
  br label %vaarg.end

vaarg.in_mem:                                     ; preds = %if.then
  %overflow_arg_area = load i8** getelementptr inbounds ([1 x %struct.__va_list_tag]* @gap, i64 0, i64 0, i32 2), align 8
  %overflow_arg_area.next = getelementptr i8* %overflow_arg_area, i64 8
  store i8* %overflow_arg_area.next, i8** getelementptr inbounds ([1 x %struct.__va_list_tag]* @gap, i64 0, i64 0, i32 2), align 8
  br label %vaarg.end

vaarg.end:                                        ; preds = %vaarg.in_mem, %vaarg.in_reg
  %vaarg.addr.in = phi i8* [ %1, %vaarg.in_reg ], [ %overflow_arg_area, %vaarg.in_mem ]
  %vaarg.addr = bitcast i8* %vaarg.addr.in to double*
  %3 = load double* %vaarg.addr, align 8
  %cmp1 = fcmp une double %3, 1.700000e+01
  br i1 %cmp1, label %if.then10, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %vaarg.end
  %gp_offset = load i32* getelementptr inbounds ([1 x %struct.__va_list_tag]* @gap, i64 0, i64 0, i32 0), align 16
  %fits_in_gp = icmp ult i32 %gp_offset, 41
  br i1 %fits_in_gp, label %vaarg.in_reg2, label %vaarg.in_mem4

vaarg.in_reg2:                                    ; preds = %lor.lhs.false
  %reg_save_area3 = load i8** getelementptr inbounds ([1 x %struct.__va_list_tag]* @gap, i64 0, i64 0, i32 3), align 16
  %4 = sext i32 %gp_offset to i64
  %5 = getelementptr i8* %reg_save_area3, i64 %4
  %6 = add i32 %gp_offset, 8
  store i32 %6, i32* getelementptr inbounds ([1 x %struct.__va_list_tag]* @gap, i64 0, i64 0, i32 0), align 16
  br label %vaarg.end7

vaarg.in_mem4:                                    ; preds = %lor.lhs.false
  %overflow_arg_area5 = load i8** getelementptr inbounds ([1 x %struct.__va_list_tag]* @gap, i64 0, i64 0, i32 2), align 8
  %overflow_arg_area.next6 = getelementptr i8* %overflow_arg_area5, i64 8
  store i8* %overflow_arg_area.next6, i8** getelementptr inbounds ([1 x %struct.__va_list_tag]* @gap, i64 0, i64 0, i32 2), align 8
  br label %vaarg.end7

vaarg.end7:                                       ; preds = %vaarg.in_mem4, %vaarg.in_reg2
  %vaarg.addr8.in = phi i8* [ %5, %vaarg.in_reg2 ], [ %overflow_arg_area5, %vaarg.in_mem4 ]
  %vaarg.addr8 = bitcast i8* %vaarg.addr8.in to i64*
  %7 = load i64* %vaarg.addr8, align 8
  %cmp9 = icmp eq i64 %7, 129
  br i1 %cmp9, label %if.end50, label %if.then10

if.then10:                                        ; preds = %vaarg.end7, %vaarg.end
  tail call void @abort() noreturn nounwind
  unreachable

if.then13:                                        ; preds = %entry
  %tmp14 = load [1 x %struct.__va_list_tag]** @pap, align 8
  %gp_offset_p = getelementptr inbounds [1 x %struct.__va_list_tag]* %tmp14, i64 0, i64 0, i32 0
  %gp_offset15 = load i32* %gp_offset_p, align 4
  %fits_in_gp16 = icmp ult i32 %gp_offset15, 41
  br i1 %fits_in_gp16, label %vaarg.in_reg17, label %vaarg.in_mem19

vaarg.in_reg17:                                   ; preds = %if.then13
  %8 = getelementptr inbounds [1 x %struct.__va_list_tag]* %tmp14, i64 0, i64 0, i32 3
  %reg_save_area18 = load i8** %8, align 8
  %9 = sext i32 %gp_offset15 to i64
  %10 = getelementptr i8* %reg_save_area18, i64 %9
  %11 = add i32 %gp_offset15, 8
  store i32 %11, i32* %gp_offset_p, align 4
  br label %vaarg.end22

vaarg.in_mem19:                                   ; preds = %if.then13
  %overflow_arg_area_p = getelementptr inbounds [1 x %struct.__va_list_tag]* %tmp14, i64 0, i64 0, i32 2
  %overflow_arg_area20 = load i8** %overflow_arg_area_p, align 8
  %overflow_arg_area.next21 = getelementptr i8* %overflow_arg_area20, i64 8
  store i8* %overflow_arg_area.next21, i8** %overflow_arg_area_p, align 8
  br label %vaarg.end22

vaarg.end22:                                      ; preds = %vaarg.in_mem19, %vaarg.in_reg17
  %vaarg.addr23.in = phi i8* [ %10, %vaarg.in_reg17 ], [ %overflow_arg_area20, %vaarg.in_mem19 ]
  %vaarg.addr23 = bitcast i8* %vaarg.addr23.in to i64*
  %12 = load i64* %vaarg.addr23, align 8
  %cmp24 = icmp eq i64 %12, 14
  br i1 %cmp24, label %lor.lhs.false25, label %if.then47

lor.lhs.false25:                                  ; preds = %vaarg.end22
  %tmp26 = load [1 x %struct.__va_list_tag]** @pap, align 8
  %overflow_arg_area_p28 = getelementptr inbounds [1 x %struct.__va_list_tag]* %tmp26, i64 0, i64 0, i32 2
  %overflow_arg_area29 = load i8** %overflow_arg_area_p28, align 8
  %13 = getelementptr i8* %overflow_arg_area29, i64 15
  %14 = ptrtoint i8* %13 to i64
  %15 = and i64 %14, -16
  %overflow_arg_area.align = inttoptr i64 %15 to i8*
  %16 = inttoptr i64 %15 to x86_fp80*
  %overflow_arg_area.next30 = getelementptr i8* %overflow_arg_area.align, i64 16
  store i8* %overflow_arg_area.next30, i8** %overflow_arg_area_p28, align 8
  %17 = load x86_fp80* %16, align 16
  %cmp31 = fcmp une x86_fp80 %17, 0xK40068300000000000000
  br i1 %cmp31, label %if.then47, label %lor.lhs.false32

lor.lhs.false32:                                  ; preds = %lor.lhs.false25
  %tmp33 = load [1 x %struct.__va_list_tag]** @pap, align 8
  %gp_offset_p35 = getelementptr inbounds [1 x %struct.__va_list_tag]* %tmp33, i64 0, i64 0, i32 0
  %gp_offset36 = load i32* %gp_offset_p35, align 4
  %fits_in_gp37 = icmp ult i32 %gp_offset36, 41
  br i1 %fits_in_gp37, label %vaarg.in_reg38, label %vaarg.in_mem40

vaarg.in_reg38:                                   ; preds = %lor.lhs.false32
  %18 = getelementptr inbounds [1 x %struct.__va_list_tag]* %tmp33, i64 0, i64 0, i32 3
  %reg_save_area39 = load i8** %18, align 8
  %19 = sext i32 %gp_offset36 to i64
  %20 = getelementptr i8* %reg_save_area39, i64 %19
  %21 = add i32 %gp_offset36, 8
  store i32 %21, i32* %gp_offset_p35, align 4
  br label %vaarg.end44

vaarg.in_mem40:                                   ; preds = %lor.lhs.false32
  %overflow_arg_area_p41 = getelementptr inbounds [1 x %struct.__va_list_tag]* %tmp33, i64 0, i64 0, i32 2
  %overflow_arg_area42 = load i8** %overflow_arg_area_p41, align 8
  %overflow_arg_area.next43 = getelementptr i8* %overflow_arg_area42, i64 8
  store i8* %overflow_arg_area.next43, i8** %overflow_arg_area_p41, align 8
  br label %vaarg.end44

vaarg.end44:                                      ; preds = %vaarg.in_mem40, %vaarg.in_reg38
  %vaarg.addr45.in = phi i8* [ %20, %vaarg.in_reg38 ], [ %overflow_arg_area42, %vaarg.in_mem40 ]
  %vaarg.addr45 = bitcast i8* %vaarg.addr45.in to i32*
  %22 = load i32* %vaarg.addr45, align 4
  %cmp46 = icmp eq i32 %22, 17
  br i1 %cmp46, label %if.end50, label %if.then47

if.then47:                                        ; preds = %vaarg.end44, %vaarg.end22, %lor.lhs.false25
  tail call void @abort() noreturn nounwind
  unreachable

if.end50:                                         ; preds = %entry, %vaarg.end44, %vaarg.end7
  store i32 %v, i32* @bar_arg, align 4
  ret void
}

define void @f0(i32 %i, ...) nounwind uwtable readnone {
entry:
  ret void
}

define void @f1(i32 %i, ...) nounwind uwtable {
entry:
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  %arraydecay1 = bitcast [1 x %struct.__va_list_tag]* %ap to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  call void @llvm.va_end(i8* %arraydecay1)
  ret void
}

declare void @llvm.va_start(i8*) nounwind

declare void @llvm.va_end(i8*) nounwind

define void @f2(i32 %i, ...) nounwind uwtable {
entry:
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  %arraydecay1 = bitcast [1 x %struct.__va_list_tag]* %ap to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %tmp = load double* @d, align 8
  %conv = fptosi double %tmp to i32
  call void @bar(i32 %conv)
  %gp_offset_p = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 0
  %gp_offset = load i32* %gp_offset_p, align 16
  %fits_in_gp = icmp ult i32 %gp_offset, 41
  br i1 %fits_in_gp, label %vaarg.in_reg, label %vaarg.in_mem

vaarg.in_reg:                                     ; preds = %entry
  %0 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 3
  %reg_save_area = load i8** %0, align 16
  %1 = sext i32 %gp_offset to i64
  %2 = getelementptr i8* %reg_save_area, i64 %1
  %3 = add i32 %gp_offset, 8
  store i32 %3, i32* %gp_offset_p, align 16
  br label %vaarg.end

vaarg.in_mem:                                     ; preds = %entry
  %overflow_arg_area_p = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 2
  %overflow_arg_area = load i8** %overflow_arg_area_p, align 8
  %overflow_arg_area.next = getelementptr i8* %overflow_arg_area, i64 8
  store i8* %overflow_arg_area.next, i8** %overflow_arg_area_p, align 8
  br label %vaarg.end

vaarg.end:                                        ; preds = %vaarg.in_mem, %vaarg.in_reg
  %vaarg.addr.in = phi i8* [ %2, %vaarg.in_reg ], [ %overflow_arg_area, %vaarg.in_mem ]
  %vaarg.addr = bitcast i8* %vaarg.addr.in to i64*
  %4 = load i64* %vaarg.addr, align 8
  store i64 %4, i64* @x, align 8
  %conv4 = trunc i64 %4 to i32
  call void @bar(i32 %conv4)
  call void @llvm.va_end(i8* %arraydecay1)
  ret void
}

define void @f3(i32 %i, ...) nounwind uwtable {
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
  %vaarg.addr.in = phi i8* [ %2, %vaarg.in_reg ], [ %overflow_arg_area, %vaarg.in_mem ]
  %vaarg.addr = bitcast i8* %vaarg.addr.in to double*
  %4 = load double* %vaarg.addr, align 8
  store double %4, double* @d, align 8
  call void @llvm.va_end(i8* %arraydecay1)
  ret void
}

define void @f4(i32 %i, ...) nounwind uwtable {
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
  %vaarg.addr.in = phi i8* [ %2, %vaarg.in_reg ], [ %overflow_arg_area, %vaarg.in_mem ]
  %vaarg.addr = bitcast i8* %vaarg.addr.in to double*
  %4 = load double* %vaarg.addr, align 8
  %conv = fptosi double %4 to i64
  store i64 %conv, i64* @x, align 8
  %cond.i = icmp eq i32 %i, 5
  br i1 %cond.i, label %sw.bb.i, label %sw.default.i

sw.bb.i:                                          ; preds = %vaarg.end
  %gp_offset_p.i = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 0
  %gp_offset.i = load i32* %gp_offset_p.i, align 16
  %fits_in_gp.i = icmp ult i32 %gp_offset.i, 41
  br i1 %fits_in_gp.i, label %vaarg.in_reg.i, label %vaarg.in_mem.i

vaarg.in_reg.i:                                   ; preds = %sw.bb.i
  %5 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 3
  %reg_save_area.i = load i8** %5, align 16
  %6 = sext i32 %gp_offset.i to i64
  %7 = getelementptr i8* %reg_save_area.i, i64 %6
  %8 = add i32 %gp_offset.i, 8
  store i32 %8, i32* %gp_offset_p.i, align 16
  br label %foo.exit

vaarg.in_mem.i:                                   ; preds = %sw.bb.i
  %overflow_arg_area_p.i = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 2
  %overflow_arg_area.i = load i8** %overflow_arg_area_p.i, align 8
  %overflow_arg_area.next.i = getelementptr i8* %overflow_arg_area.i, i64 8
  store i8* %overflow_arg_area.next.i, i8** %overflow_arg_area_p.i, align 8
  br label %foo.exit

sw.default.i:                                     ; preds = %vaarg.end
  call void @abort() noreturn nounwind
  unreachable

foo.exit:                                         ; preds = %vaarg.in_reg.i, %vaarg.in_mem.i
  %vaarg.addr.in.i = phi i8* [ %7, %vaarg.in_reg.i ], [ %overflow_arg_area.i, %vaarg.in_mem.i ]
  %vaarg.addr.i = bitcast i8* %vaarg.addr.in.i to i32*
  %9 = load i32* %vaarg.addr.i, align 4
  store i32 %9, i32* @foo_arg, align 4
  call void @llvm.va_end(i8* %arraydecay1)
  ret void
}

define void @f5(i32 %i, ...) nounwind uwtable {
entry:
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  %arraydecay1 = bitcast [1 x %struct.__va_list_tag]* %ap to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  call void @llvm.va_copy(i8* bitcast ([1 x %struct.__va_list_tag]* @gap to i8*), i8* %arraydecay1)
  call void @bar(i32 %i)
  call void @llvm.va_end(i8* %arraydecay1)
  call void @llvm.va_end(i8* bitcast ([1 x %struct.__va_list_tag]* @gap to i8*))
  ret void
}

declare void @llvm.va_copy(i8*, i8*) nounwind

define void @f6(i32 %i, ...) nounwind uwtable {
entry:
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  %arraydecay1 = bitcast [1 x %struct.__va_list_tag]* %ap to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %tmp = load double* @d, align 8
  %conv = fptosi double %tmp to i32
  call void @bar(i32 %conv)
  %gp_offset_p = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 0
  %gp_offset = load i32* %gp_offset_p, align 16
  %fits_in_gp = icmp ult i32 %gp_offset, 41
  br i1 %fits_in_gp, label %vaarg.end, label %vaarg.end.thread

vaarg.end.thread:                                 ; preds = %entry
  %overflow_arg_area_p = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 2
  %overflow_arg_area = load i8** %overflow_arg_area_p, align 8
  %overflow_arg_area.next = getelementptr i8* %overflow_arg_area, i64 8
  store i8* %overflow_arg_area.next, i8** %overflow_arg_area_p, align 8
  br label %vaarg.in_mem9

vaarg.end:                                        ; preds = %entry
  %0 = add i32 %gp_offset, 8
  store i32 %0, i32* %gp_offset_p, align 16
  %fits_in_gp6 = icmp ult i32 %0, 41
  br i1 %fits_in_gp6, label %vaarg.in_reg7, label %vaarg.in_mem9

vaarg.in_reg7:                                    ; preds = %vaarg.end
  %1 = add i32 %gp_offset, 16
  store i32 %1, i32* %gp_offset_p, align 16
  br label %vaarg.end13

vaarg.in_mem9:                                    ; preds = %vaarg.end.thread, %vaarg.end
  %gp_offset17.pr2 = phi i32 [ %gp_offset, %vaarg.end.thread ], [ %0, %vaarg.end ]
  %overflow_arg_area_p10 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 2
  %overflow_arg_area11 = load i8** %overflow_arg_area_p10, align 8
  %overflow_arg_area.next12 = getelementptr i8* %overflow_arg_area11, i64 8
  store i8* %overflow_arg_area.next12, i8** %overflow_arg_area_p10, align 8
  br label %vaarg.end13

vaarg.end13:                                      ; preds = %vaarg.in_mem9, %vaarg.in_reg7
  %gp_offset17 = phi i32 [ %gp_offset17.pr2, %vaarg.in_mem9 ], [ %1, %vaarg.in_reg7 ]
  %fits_in_gp18 = icmp ult i32 %gp_offset17, 41
  br i1 %fits_in_gp18, label %vaarg.in_reg19, label %vaarg.in_mem21

vaarg.in_reg19:                                   ; preds = %vaarg.end13
  %2 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 3
  %reg_save_area20 = load i8** %2, align 16
  %3 = sext i32 %gp_offset17 to i64
  %4 = getelementptr i8* %reg_save_area20, i64 %3
  %5 = add i32 %gp_offset17, 8
  store i32 %5, i32* %gp_offset_p, align 16
  br label %vaarg.end25

vaarg.in_mem21:                                   ; preds = %vaarg.end13
  %overflow_arg_area_p22 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 2
  %overflow_arg_area23 = load i8** %overflow_arg_area_p22, align 8
  %overflow_arg_area.next24 = getelementptr i8* %overflow_arg_area23, i64 8
  store i8* %overflow_arg_area.next24, i8** %overflow_arg_area_p22, align 8
  br label %vaarg.end25

vaarg.end25:                                      ; preds = %vaarg.in_mem21, %vaarg.in_reg19
  %vaarg.addr26.in = phi i8* [ %4, %vaarg.in_reg19 ], [ %overflow_arg_area23, %vaarg.in_mem21 ]
  %vaarg.addr26 = bitcast i8* %vaarg.addr26.in to i64*
  %6 = load i64* %vaarg.addr26, align 8
  store i64 %6, i64* @x, align 8
  %conv28 = trunc i64 %6 to i32
  call void @bar(i32 %conv28)
  call void @llvm.va_end(i8* %arraydecay1)
  ret void
}

define void @f7(i32 %i, ...) nounwind uwtable {
entry:
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  %arraydecay1 = bitcast [1 x %struct.__va_list_tag]* %ap to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  store [1 x %struct.__va_list_tag]* %ap, [1 x %struct.__va_list_tag]** @pap, align 8
  call void @bar(i32 %i)
  call void @llvm.va_end(i8* %arraydecay1)
  ret void
}

define void @f8(i32 %i, ...) nounwind uwtable {
entry:
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  %arraydecay1 = bitcast [1 x %struct.__va_list_tag]* %ap to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  store [1 x %struct.__va_list_tag]* %ap, [1 x %struct.__va_list_tag]** @pap, align 8
  call void @bar(i32 %i)
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
  %vaarg.addr.in = phi i8* [ %2, %vaarg.in_reg ], [ %overflow_arg_area, %vaarg.in_mem ]
  %vaarg.addr = bitcast i8* %vaarg.addr.in to double*
  %4 = load double* %vaarg.addr, align 8
  store double %4, double* @d, align 8
  call void @llvm.va_end(i8* %arraydecay1)
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  tail call void (i32, ...)* @f1(i32 2)
  store double 3.100000e+01, double* @d, align 8
  tail call void (i32, ...)* @f2(i32 3, i64 28)
  %tmp = load i32* @bar_arg, align 4
  %cmp = icmp eq i32 %tmp, 28
  %tmp1 = load i64* @x, align 8
  %cmp2 = icmp eq i64 %tmp1, 28
  %or.cond = and i1 %cmp, %cmp2
  br i1 %or.cond, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  tail call void (i32, ...)* @f3(i32 4, double 1.310000e+02)
  %tmp3 = load double* @d, align 8
  %cmp4 = fcmp une double %tmp3, 1.310000e+02
  br i1 %cmp4, label %if.then5, label %if.end6

if.then5:                                         ; preds = %if.end
  tail call void @abort() noreturn nounwind
  unreachable

if.end6:                                          ; preds = %if.end
  tail call void (i32, ...)* @f4(i32 5, double 1.600000e+01, i32 128)
  %tmp7 = load i64* @x, align 8
  %cmp8 = icmp eq i64 %tmp7, 16
  %tmp10 = load i32* @foo_arg, align 4
  %cmp11 = icmp eq i32 %tmp10, 128
  %or.cond1 = and i1 %cmp8, %cmp11
  br i1 %or.cond1, label %if.end13, label %if.then12

if.then12:                                        ; preds = %if.end6
  tail call void @abort() noreturn nounwind
  unreachable

if.end13:                                         ; preds = %if.end6
  tail call void (i32, ...)* @f5(i32 16390, double 1.700000e+01, i64 129)
  %tmp14 = load i32* @bar_arg, align 4
  %cmp15 = icmp eq i32 %tmp14, 16390
  br i1 %cmp15, label %if.end17, label %if.then16

if.then16:                                        ; preds = %if.end13
  tail call void @abort() noreturn nounwind
  unreachable

if.end17:                                         ; preds = %if.end13
  tail call void (i32, ...)* @f6(i32 7, i64 12, i64 14, i64 -31)
  %tmp18 = load i32* @bar_arg, align 4
  %cmp19 = icmp eq i32 %tmp18, -31
  br i1 %cmp19, label %if.end21, label %if.then20

if.then20:                                        ; preds = %if.end17
  tail call void @abort() noreturn nounwind
  unreachable

if.end21:                                         ; preds = %if.end17
  tail call void (i32, ...)* @f7(i32 16392, i64 14, x86_fp80 0xK40068300000000000000, i32 17, double 2.600000e+01)
  %tmp22 = load i32* @bar_arg, align 4
  %cmp23 = icmp eq i32 %tmp22, 16392
  br i1 %cmp23, label %if.end25, label %if.then24

if.then24:                                        ; preds = %if.end21
  tail call void @abort() noreturn nounwind
  unreachable

if.end25:                                         ; preds = %if.end21
  tail call void (i32, ...)* @f8(i32 16392, i64 14, x86_fp80 0xK40068300000000000000, i32 17, double 2.700000e+01)
  %tmp26 = load i32* @bar_arg, align 4
  %cmp27 = icmp ne i32 %tmp26, 16392
  %tmp29 = load double* @d, align 8
  %cmp30 = fcmp une double %tmp29, 2.700000e+01
  %or.cond2 = or i1 %cmp27, %cmp30
  br i1 %or.cond2, label %if.then31, label %if.end32

if.then31:                                        ; preds = %if.end25
  tail call void @abort() noreturn nounwind
  unreachable

if.end32:                                         ; preds = %if.end25
  ret i32 0
}
