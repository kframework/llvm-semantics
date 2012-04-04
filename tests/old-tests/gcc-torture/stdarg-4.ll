; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/stdarg-4.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.__va_list_tag = type { i32, i32, i8*, i8* }

@y = common global i64 0, align 8
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

define void @f1(i32 %i, ...) nounwind uwtable {
entry:
  %ap.addr.i = alloca %struct.__va_list_tag*, align 8
  %i.addr = alloca i32, align 4
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  store i32 %i, i32* %i.addr, align 4
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %arraydecay1 = bitcast %struct.__va_list_tag* %arraydecay to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %arraydecay2 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %0 = bitcast %struct.__va_list_tag** %ap.addr.i to i8*
  call void @llvm.lifetime.start(i64 -1, i8* %0)
  store %struct.__va_list_tag* %arraydecay2, %struct.__va_list_tag** %ap.addr.i, align 8
  %tmp.i = load %struct.__va_list_tag** %ap.addr.i, align 8
  %fp_offset_p.i = getelementptr inbounds %struct.__va_list_tag* %tmp.i, i32 0, i32 1
  %fp_offset.i = load i32* %fp_offset_p.i
  %fits_in_fp.i = icmp ule i32 %fp_offset.i, 160
  br i1 %fits_in_fp.i, label %vaarg.in_reg.i, label %vaarg.in_mem.i

vaarg.in_reg.i:                                   ; preds = %entry
  %1 = getelementptr inbounds %struct.__va_list_tag* %tmp.i, i32 0, i32 3
  %reg_save_area.i = load i8** %1
  %2 = getelementptr i8* %reg_save_area.i, i32 %fp_offset.i
  %3 = bitcast i8* %2 to double*
  %4 = add i32 %fp_offset.i, 16
  store i32 %4, i32* %fp_offset_p.i
  br label %vaarg.end.i

vaarg.in_mem.i:                                   ; preds = %entry
  %overflow_arg_area_p.i = getelementptr inbounds %struct.__va_list_tag* %tmp.i, i32 0, i32 2
  %overflow_arg_area.i = load i8** %overflow_arg_area_p.i
  %5 = bitcast i8* %overflow_arg_area.i to double*
  %overflow_arg_area.next.i = getelementptr i8* %overflow_arg_area.i, i32 8
  store i8* %overflow_arg_area.next.i, i8** %overflow_arg_area_p.i
  br label %vaarg.end.i

vaarg.end.i:                                      ; preds = %vaarg.in_mem.i, %vaarg.in_reg.i
  %vaarg.addr.i = phi double* [ %3, %vaarg.in_reg.i ], [ %5, %vaarg.in_mem.i ]
  %6 = load double* %vaarg.addr.i
  %conv.i = fptosi double %6 to i64
  store i64 %conv.i, i64* @x, align 8
  %tmp1.i = load %struct.__va_list_tag** %ap.addr.i, align 8
  %gp_offset_p.i = getelementptr inbounds %struct.__va_list_tag* %tmp1.i, i32 0, i32 0
  %gp_offset.i = load i32* %gp_offset_p.i
  %fits_in_gp.i = icmp ule i32 %gp_offset.i, 40
  br i1 %fits_in_gp.i, label %vaarg.in_reg2.i, label %vaarg.in_mem4.i

vaarg.in_reg2.i:                                  ; preds = %vaarg.end.i
  %7 = getelementptr inbounds %struct.__va_list_tag* %tmp1.i, i32 0, i32 3
  %reg_save_area3.i = load i8** %7
  %8 = getelementptr i8* %reg_save_area3.i, i32 %gp_offset.i
  %9 = bitcast i8* %8 to i64*
  %10 = add i32 %gp_offset.i, 8
  store i32 %10, i32* %gp_offset_p.i
  br label %vaarg.end8.i

vaarg.in_mem4.i:                                  ; preds = %vaarg.end.i
  %overflow_arg_area_p5.i = getelementptr inbounds %struct.__va_list_tag* %tmp1.i, i32 0, i32 2
  %overflow_arg_area6.i = load i8** %overflow_arg_area_p5.i
  %11 = bitcast i8* %overflow_arg_area6.i to i64*
  %overflow_arg_area.next7.i = getelementptr i8* %overflow_arg_area6.i, i32 8
  store i8* %overflow_arg_area.next7.i, i8** %overflow_arg_area_p5.i
  br label %vaarg.end8.i

vaarg.end8.i:                                     ; preds = %vaarg.in_mem4.i, %vaarg.in_reg2.i
  %vaarg.addr9.i = phi i64* [ %9, %vaarg.in_reg2.i ], [ %11, %vaarg.in_mem4.i ]
  %12 = load i64* %vaarg.addr9.i
  %tmp10.i = load i64* @x, align 8
  %add.i = add nsw i64 %tmp10.i, %12
  store i64 %add.i, i64* @x, align 8
  %tmp11.i = load %struct.__va_list_tag** %ap.addr.i, align 8
  %fp_offset_p12.i = getelementptr inbounds %struct.__va_list_tag* %tmp11.i, i32 0, i32 1
  %fp_offset13.i = load i32* %fp_offset_p12.i
  %fits_in_fp14.i = icmp ule i32 %fp_offset13.i, 160
  br i1 %fits_in_fp14.i, label %vaarg.in_reg15.i, label %vaarg.in_mem17.i

vaarg.in_reg15.i:                                 ; preds = %vaarg.end8.i
  %13 = getelementptr inbounds %struct.__va_list_tag* %tmp11.i, i32 0, i32 3
  %reg_save_area16.i = load i8** %13
  %14 = getelementptr i8* %reg_save_area16.i, i32 %fp_offset13.i
  %15 = bitcast i8* %14 to double*
  %16 = add i32 %fp_offset13.i, 16
  store i32 %16, i32* %fp_offset_p12.i
  br label %f1i.exit

vaarg.in_mem17.i:                                 ; preds = %vaarg.end8.i
  %overflow_arg_area_p18.i = getelementptr inbounds %struct.__va_list_tag* %tmp11.i, i32 0, i32 2
  %overflow_arg_area19.i = load i8** %overflow_arg_area_p18.i
  %17 = bitcast i8* %overflow_arg_area19.i to double*
  %overflow_arg_area.next20.i = getelementptr i8* %overflow_arg_area19.i, i32 8
  store i8* %overflow_arg_area.next20.i, i8** %overflow_arg_area_p18.i
  br label %f1i.exit

f1i.exit:                                         ; preds = %vaarg.in_reg15.i, %vaarg.in_mem17.i
  %vaarg.addr22.i = phi double* [ %15, %vaarg.in_reg15.i ], [ %17, %vaarg.in_mem17.i ]
  %18 = load double* %vaarg.addr22.i
  %tmp23.i = load i64* @x, align 8
  %conv24.i = sitofp i64 %tmp23.i to double
  %add25.i = fadd double %conv24.i, %18
  %conv26.i = fptosi double %add25.i to i64
  store i64 %conv26.i, i64* @x, align 8
  %19 = bitcast %struct.__va_list_tag** %ap.addr.i to i8*
  call void @llvm.lifetime.end(i64 -1, i8* %19)
  %arraydecay3 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %arraydecay34 = bitcast %struct.__va_list_tag* %arraydecay3 to i8*
  call void @llvm.va_end(i8* %arraydecay34)
  ret void
}

declare void @llvm.va_start(i8*) nounwind

declare void @llvm.va_end(i8*) nounwind

define void @f2(i32 %i, ...) nounwind uwtable {
entry:
  %ap.addr.i.i = alloca %struct.__va_list_tag*, align 8
  %ap.addr.i = alloca %struct.__va_list_tag*, align 8
  %i.addr = alloca i32, align 4
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  store i32 %i, i32* %i.addr, align 4
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %arraydecay1 = bitcast %struct.__va_list_tag* %arraydecay to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %arraydecay2 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %0 = bitcast %struct.__va_list_tag** %ap.addr.i to i8*
  call void @llvm.lifetime.start(i64 -1, i8* %0) nounwind
  store %struct.__va_list_tag* %arraydecay2, %struct.__va_list_tag** %ap.addr.i, align 8
  %tmp.i = load %struct.__va_list_tag** %ap.addr.i, align 8
  %gp_offset_p.i = getelementptr inbounds %struct.__va_list_tag* %tmp.i, i32 0, i32 0
  %gp_offset.i = load i32* %gp_offset_p.i
  %fits_in_gp.i = icmp ule i32 %gp_offset.i, 40
  br i1 %fits_in_gp.i, label %vaarg.in_reg.i, label %vaarg.in_mem.i

vaarg.in_reg.i:                                   ; preds = %entry
  %1 = getelementptr inbounds %struct.__va_list_tag* %tmp.i, i32 0, i32 3
  %reg_save_area.i = load i8** %1
  %2 = getelementptr i8* %reg_save_area.i, i32 %gp_offset.i
  %3 = bitcast i8* %2 to i32*
  %4 = add i32 %gp_offset.i, 8
  store i32 %4, i32* %gp_offset_p.i
  br label %vaarg.end.i

vaarg.in_mem.i:                                   ; preds = %entry
  %overflow_arg_area_p.i = getelementptr inbounds %struct.__va_list_tag* %tmp.i, i32 0, i32 2
  %overflow_arg_area.i = load i8** %overflow_arg_area_p.i
  %5 = bitcast i8* %overflow_arg_area.i to i32*
  %overflow_arg_area.next.i = getelementptr i8* %overflow_arg_area.i, i32 8
  store i8* %overflow_arg_area.next.i, i8** %overflow_arg_area_p.i
  br label %vaarg.end.i

vaarg.end.i:                                      ; preds = %vaarg.in_mem.i, %vaarg.in_reg.i
  %vaarg.addr.i = phi i32* [ %3, %vaarg.in_reg.i ], [ %5, %vaarg.in_mem.i ]
  %6 = load i32* %vaarg.addr.i
  %conv.i = sext i32 %6 to i64
  store i64 %conv.i, i64* @y, align 8
  %tmp1.i = load %struct.__va_list_tag** %ap.addr.i, align 8
  %gp_offset_p2.i = getelementptr inbounds %struct.__va_list_tag* %tmp1.i, i32 0, i32 0
  %gp_offset3.i = load i32* %gp_offset_p2.i
  %fits_in_gp4.i = icmp ule i32 %gp_offset3.i, 40
  br i1 %fits_in_gp4.i, label %vaarg.in_reg5.i, label %vaarg.in_mem7.i

vaarg.in_reg5.i:                                  ; preds = %vaarg.end.i
  %7 = getelementptr inbounds %struct.__va_list_tag* %tmp1.i, i32 0, i32 3
  %reg_save_area6.i = load i8** %7
  %8 = getelementptr i8* %reg_save_area6.i, i32 %gp_offset3.i
  %9 = bitcast i8* %8 to i64*
  %10 = add i32 %gp_offset3.i, 8
  store i32 %10, i32* %gp_offset_p2.i
  br label %vaarg.end11.i

vaarg.in_mem7.i:                                  ; preds = %vaarg.end.i
  %overflow_arg_area_p8.i = getelementptr inbounds %struct.__va_list_tag* %tmp1.i, i32 0, i32 2
  %overflow_arg_area9.i = load i8** %overflow_arg_area_p8.i
  %11 = bitcast i8* %overflow_arg_area9.i to i64*
  %overflow_arg_area.next10.i = getelementptr i8* %overflow_arg_area9.i, i32 8
  store i8* %overflow_arg_area.next10.i, i8** %overflow_arg_area_p8.i
  br label %vaarg.end11.i

vaarg.end11.i:                                    ; preds = %vaarg.in_mem7.i, %vaarg.in_reg5.i
  %vaarg.addr12.i = phi i64* [ %9, %vaarg.in_reg5.i ], [ %11, %vaarg.in_mem7.i ]
  %12 = load i64* %vaarg.addr12.i
  %tmp13.i = load i64* @y, align 8
  %add.i = add nsw i64 %tmp13.i, %12
  store i64 %add.i, i64* @y, align 8
  %tmp14.i = load %struct.__va_list_tag** %ap.addr.i, align 8
  %fp_offset_p.i = getelementptr inbounds %struct.__va_list_tag* %tmp14.i, i32 0, i32 1
  %fp_offset.i = load i32* %fp_offset_p.i
  %fits_in_fp.i = icmp ule i32 %fp_offset.i, 160
  br i1 %fits_in_fp.i, label %vaarg.in_reg15.i, label %vaarg.in_mem17.i

vaarg.in_reg15.i:                                 ; preds = %vaarg.end11.i
  %13 = getelementptr inbounds %struct.__va_list_tag* %tmp14.i, i32 0, i32 3
  %reg_save_area16.i = load i8** %13
  %14 = getelementptr i8* %reg_save_area16.i, i32 %fp_offset.i
  %15 = bitcast i8* %14 to double*
  %16 = add i32 %fp_offset.i, 16
  store i32 %16, i32* %fp_offset_p.i
  br label %vaarg.end21.i

vaarg.in_mem17.i:                                 ; preds = %vaarg.end11.i
  %overflow_arg_area_p18.i = getelementptr inbounds %struct.__va_list_tag* %tmp14.i, i32 0, i32 2
  %overflow_arg_area19.i = load i8** %overflow_arg_area_p18.i
  %17 = bitcast i8* %overflow_arg_area19.i to double*
  %overflow_arg_area.next20.i = getelementptr i8* %overflow_arg_area19.i, i32 8
  store i8* %overflow_arg_area.next20.i, i8** %overflow_arg_area_p18.i
  br label %vaarg.end21.i

vaarg.end21.i:                                    ; preds = %vaarg.in_mem17.i, %vaarg.in_reg15.i
  %vaarg.addr22.i = phi double* [ %15, %vaarg.in_reg15.i ], [ %17, %vaarg.in_mem17.i ]
  %18 = load double* %vaarg.addr22.i
  %tmp23.i = load i64* @y, align 8
  %conv24.i = sitofp i64 %tmp23.i to double
  %add25.i = fadd double %conv24.i, %18
  %conv26.i = fptosi double %add25.i to i64
  store i64 %conv26.i, i64* @y, align 8
  %tmp27.i = load %struct.__va_list_tag** %ap.addr.i, align 8
  %19 = bitcast %struct.__va_list_tag** %ap.addr.i.i to i8*
  call void @llvm.lifetime.start(i64 -1, i8* %19) nounwind
  store %struct.__va_list_tag* %tmp27.i, %struct.__va_list_tag** %ap.addr.i.i, align 8
  %tmp.i.i = load %struct.__va_list_tag** %ap.addr.i.i, align 8
  %fp_offset_p.i.i = getelementptr inbounds %struct.__va_list_tag* %tmp.i.i, i32 0, i32 1
  %fp_offset.i.i = load i32* %fp_offset_p.i.i
  %fits_in_fp.i.i = icmp ule i32 %fp_offset.i.i, 160
  br i1 %fits_in_fp.i.i, label %vaarg.in_reg.i.i, label %vaarg.in_mem.i.i

vaarg.in_reg.i.i:                                 ; preds = %vaarg.end21.i
  %20 = getelementptr inbounds %struct.__va_list_tag* %tmp.i.i, i32 0, i32 3
  %reg_save_area.i.i = load i8** %20
  %21 = getelementptr i8* %reg_save_area.i.i, i32 %fp_offset.i.i
  %22 = bitcast i8* %21 to double*
  %23 = add i32 %fp_offset.i.i, 16
  store i32 %23, i32* %fp_offset_p.i.i
  br label %vaarg.end.i.i

vaarg.in_mem.i.i:                                 ; preds = %vaarg.end21.i
  %overflow_arg_area_p.i.i = getelementptr inbounds %struct.__va_list_tag* %tmp.i.i, i32 0, i32 2
  %overflow_arg_area.i.i = load i8** %overflow_arg_area_p.i.i
  %24 = bitcast i8* %overflow_arg_area.i.i to double*
  %overflow_arg_area.next.i.i = getelementptr i8* %overflow_arg_area.i.i, i32 8
  store i8* %overflow_arg_area.next.i.i, i8** %overflow_arg_area_p.i.i
  br label %vaarg.end.i.i

vaarg.end.i.i:                                    ; preds = %vaarg.in_mem.i.i, %vaarg.in_reg.i.i
  %vaarg.addr.i.i = phi double* [ %22, %vaarg.in_reg.i.i ], [ %24, %vaarg.in_mem.i.i ]
  %25 = load double* %vaarg.addr.i.i
  %conv.i.i = fptosi double %25 to i64
  store i64 %conv.i.i, i64* @x, align 8
  %tmp1.i.i = load %struct.__va_list_tag** %ap.addr.i.i, align 8
  %gp_offset_p.i.i = getelementptr inbounds %struct.__va_list_tag* %tmp1.i.i, i32 0, i32 0
  %gp_offset.i.i = load i32* %gp_offset_p.i.i
  %fits_in_gp.i.i = icmp ule i32 %gp_offset.i.i, 40
  br i1 %fits_in_gp.i.i, label %vaarg.in_reg2.i.i, label %vaarg.in_mem4.i.i

vaarg.in_reg2.i.i:                                ; preds = %vaarg.end.i.i
  %26 = getelementptr inbounds %struct.__va_list_tag* %tmp1.i.i, i32 0, i32 3
  %reg_save_area3.i.i = load i8** %26
  %27 = getelementptr i8* %reg_save_area3.i.i, i32 %gp_offset.i.i
  %28 = bitcast i8* %27 to i64*
  %29 = add i32 %gp_offset.i.i, 8
  store i32 %29, i32* %gp_offset_p.i.i
  br label %vaarg.end8.i.i

vaarg.in_mem4.i.i:                                ; preds = %vaarg.end.i.i
  %overflow_arg_area_p5.i.i = getelementptr inbounds %struct.__va_list_tag* %tmp1.i.i, i32 0, i32 2
  %overflow_arg_area6.i.i = load i8** %overflow_arg_area_p5.i.i
  %30 = bitcast i8* %overflow_arg_area6.i.i to i64*
  %overflow_arg_area.next7.i.i = getelementptr i8* %overflow_arg_area6.i.i, i32 8
  store i8* %overflow_arg_area.next7.i.i, i8** %overflow_arg_area_p5.i.i
  br label %vaarg.end8.i.i

vaarg.end8.i.i:                                   ; preds = %vaarg.in_mem4.i.i, %vaarg.in_reg2.i.i
  %vaarg.addr9.i.i = phi i64* [ %28, %vaarg.in_reg2.i.i ], [ %30, %vaarg.in_mem4.i.i ]
  %31 = load i64* %vaarg.addr9.i.i
  %tmp10.i.i = load i64* @x, align 8
  %add.i.i = add nsw i64 %tmp10.i.i, %31
  store i64 %add.i.i, i64* @x, align 8
  %tmp11.i.i = load %struct.__va_list_tag** %ap.addr.i.i, align 8
  %fp_offset_p12.i.i = getelementptr inbounds %struct.__va_list_tag* %tmp11.i.i, i32 0, i32 1
  %fp_offset13.i.i = load i32* %fp_offset_p12.i.i
  %fits_in_fp14.i.i = icmp ule i32 %fp_offset13.i.i, 160
  br i1 %fits_in_fp14.i.i, label %vaarg.in_reg15.i.i, label %vaarg.in_mem17.i.i

vaarg.in_reg15.i.i:                               ; preds = %vaarg.end8.i.i
  %32 = getelementptr inbounds %struct.__va_list_tag* %tmp11.i.i, i32 0, i32 3
  %reg_save_area16.i.i = load i8** %32
  %33 = getelementptr i8* %reg_save_area16.i.i, i32 %fp_offset13.i.i
  %34 = bitcast i8* %33 to double*
  %35 = add i32 %fp_offset13.i.i, 16
  store i32 %35, i32* %fp_offset_p12.i.i
  br label %f2i.exit

vaarg.in_mem17.i.i:                               ; preds = %vaarg.end8.i.i
  %overflow_arg_area_p18.i.i = getelementptr inbounds %struct.__va_list_tag* %tmp11.i.i, i32 0, i32 2
  %overflow_arg_area19.i.i = load i8** %overflow_arg_area_p18.i.i
  %36 = bitcast i8* %overflow_arg_area19.i.i to double*
  %overflow_arg_area.next20.i.i = getelementptr i8* %overflow_arg_area19.i.i, i32 8
  store i8* %overflow_arg_area.next20.i.i, i8** %overflow_arg_area_p18.i.i
  br label %f2i.exit

f2i.exit:                                         ; preds = %vaarg.in_reg15.i.i, %vaarg.in_mem17.i.i
  %vaarg.addr22.i.i = phi double* [ %34, %vaarg.in_reg15.i.i ], [ %36, %vaarg.in_mem17.i.i ]
  %37 = load double* %vaarg.addr22.i.i
  %tmp23.i.i = load i64* @x, align 8
  %conv24.i.i = sitofp i64 %tmp23.i.i to double
  %add25.i.i = fadd double %conv24.i.i, %37
  %conv26.i.i = fptosi double %add25.i.i to i64
  store i64 %conv26.i.i, i64* @x, align 8
  %38 = bitcast %struct.__va_list_tag** %ap.addr.i.i to i8*
  call void @llvm.lifetime.end(i64 -1, i8* %38) nounwind
  %39 = bitcast %struct.__va_list_tag** %ap.addr.i to i8*
  call void @llvm.lifetime.end(i64 -1, i8* %39) nounwind
  %arraydecay3 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %arraydecay34 = bitcast %struct.__va_list_tag* %arraydecay3 to i8*
  call void @llvm.va_end(i8* %arraydecay34)
  ret void
}

define i64 @f3h(i32 %i, i64 %arg0, i64 %arg1, i64 %arg2, i64 %arg3) nounwind uwtable {
entry:
  %i.addr = alloca i32, align 4
  %arg0.addr = alloca i64, align 8
  %arg1.addr = alloca i64, align 8
  %arg2.addr = alloca i64, align 8
  %arg3.addr = alloca i64, align 8
  store i32 %i, i32* %i.addr, align 4
  store i64 %arg0, i64* %arg0.addr, align 8
  store i64 %arg1, i64* %arg1.addr, align 8
  store i64 %arg2, i64* %arg2.addr, align 8
  store i64 %arg3, i64* %arg3.addr, align 8
  %tmp = load i32* %i.addr, align 4
  %conv = sext i32 %tmp to i64
  %tmp1 = load i64* %arg0.addr, align 8
  %add = add nsw i64 %conv, %tmp1
  %tmp2 = load i64* %arg1.addr, align 8
  %add3 = add nsw i64 %add, %tmp2
  %tmp4 = load i64* %arg2.addr, align 8
  %add5 = add nsw i64 %add3, %tmp4
  %tmp6 = load i64* %arg3.addr, align 8
  %add7 = add nsw i64 %add5, %tmp6
  ret i64 %add7
}

define i64 @f3(i32 %i, ...) nounwind uwtable {
entry:
  %i.addr = alloca i32, align 4
  %t = alloca i64, align 8
  %arg0 = alloca i64, align 8
  %arg1 = alloca i64, align 8
  %arg2 = alloca i64, align 8
  %arg3 = alloca i64, align 8
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  store i32 %i, i32* %i.addr, align 4
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %arraydecay1 = bitcast %struct.__va_list_tag* %arraydecay to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %tmp = load i32* %i.addr, align 4
  switch i32 %tmp, label %sw.default [
    i32 0, label %sw.bb
    i32 1, label %sw.bb3
    i32 2, label %sw.bb8
    i32 3, label %sw.bb37
    i32 4, label %sw.bb79
  ]

sw.bb:                                            ; preds = %entry
  %tmp2 = load i32* %i.addr, align 4
  %call = call i64 @f3h(i32 %tmp2, i64 0, i64 0, i64 0, i64 0)
  store i64 %call, i64* %t, align 8
  br label %sw.epilog

sw.bb3:                                           ; preds = %entry
  %arraydecay4 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %gp_offset_p = getelementptr inbounds %struct.__va_list_tag* %arraydecay4, i32 0, i32 0
  %gp_offset = load i32* %gp_offset_p
  %fits_in_gp = icmp ule i32 %gp_offset, 40
  br i1 %fits_in_gp, label %vaarg.in_reg, label %vaarg.in_mem

vaarg.in_reg:                                     ; preds = %sw.bb3
  %0 = getelementptr inbounds %struct.__va_list_tag* %arraydecay4, i32 0, i32 3
  %reg_save_area = load i8** %0
  %1 = getelementptr i8* %reg_save_area, i32 %gp_offset
  %2 = bitcast i8* %1 to i64*
  %3 = add i32 %gp_offset, 8
  store i32 %3, i32* %gp_offset_p
  br label %vaarg.end

vaarg.in_mem:                                     ; preds = %sw.bb3
  %overflow_arg_area_p = getelementptr inbounds %struct.__va_list_tag* %arraydecay4, i32 0, i32 2
  %overflow_arg_area = load i8** %overflow_arg_area_p
  %4 = bitcast i8* %overflow_arg_area to i64*
  %overflow_arg_area.next = getelementptr i8* %overflow_arg_area, i32 8
  store i8* %overflow_arg_area.next, i8** %overflow_arg_area_p
  br label %vaarg.end

vaarg.end:                                        ; preds = %vaarg.in_mem, %vaarg.in_reg
  %vaarg.addr = phi i64* [ %2, %vaarg.in_reg ], [ %4, %vaarg.in_mem ]
  %5 = load i64* %vaarg.addr
  store i64 %5, i64* %arg0, align 8
  %tmp5 = load i32* %i.addr, align 4
  %tmp6 = load i64* %arg0, align 8
  %call7 = call i64 @f3h(i32 %tmp5, i64 %tmp6, i64 0, i64 0, i64 0)
  store i64 %call7, i64* %t, align 8
  br label %sw.epilog

sw.bb8:                                           ; preds = %entry
  %arraydecay9 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %gp_offset_p10 = getelementptr inbounds %struct.__va_list_tag* %arraydecay9, i32 0, i32 0
  %gp_offset11 = load i32* %gp_offset_p10
  %fits_in_gp12 = icmp ule i32 %gp_offset11, 40
  br i1 %fits_in_gp12, label %vaarg.in_reg13, label %vaarg.in_mem15

vaarg.in_reg13:                                   ; preds = %sw.bb8
  %6 = getelementptr inbounds %struct.__va_list_tag* %arraydecay9, i32 0, i32 3
  %reg_save_area14 = load i8** %6
  %7 = getelementptr i8* %reg_save_area14, i32 %gp_offset11
  %8 = bitcast i8* %7 to i64*
  %9 = add i32 %gp_offset11, 8
  store i32 %9, i32* %gp_offset_p10
  br label %vaarg.end19

vaarg.in_mem15:                                   ; preds = %sw.bb8
  %overflow_arg_area_p16 = getelementptr inbounds %struct.__va_list_tag* %arraydecay9, i32 0, i32 2
  %overflow_arg_area17 = load i8** %overflow_arg_area_p16
  %10 = bitcast i8* %overflow_arg_area17 to i64*
  %overflow_arg_area.next18 = getelementptr i8* %overflow_arg_area17, i32 8
  store i8* %overflow_arg_area.next18, i8** %overflow_arg_area_p16
  br label %vaarg.end19

vaarg.end19:                                      ; preds = %vaarg.in_mem15, %vaarg.in_reg13
  %vaarg.addr20 = phi i64* [ %8, %vaarg.in_reg13 ], [ %10, %vaarg.in_mem15 ]
  %11 = load i64* %vaarg.addr20
  store i64 %11, i64* %arg0, align 8
  %arraydecay21 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %gp_offset_p22 = getelementptr inbounds %struct.__va_list_tag* %arraydecay21, i32 0, i32 0
  %gp_offset23 = load i32* %gp_offset_p22
  %fits_in_gp24 = icmp ule i32 %gp_offset23, 40
  br i1 %fits_in_gp24, label %vaarg.in_reg25, label %vaarg.in_mem27

vaarg.in_reg25:                                   ; preds = %vaarg.end19
  %12 = getelementptr inbounds %struct.__va_list_tag* %arraydecay21, i32 0, i32 3
  %reg_save_area26 = load i8** %12
  %13 = getelementptr i8* %reg_save_area26, i32 %gp_offset23
  %14 = bitcast i8* %13 to i64*
  %15 = add i32 %gp_offset23, 8
  store i32 %15, i32* %gp_offset_p22
  br label %vaarg.end31

vaarg.in_mem27:                                   ; preds = %vaarg.end19
  %overflow_arg_area_p28 = getelementptr inbounds %struct.__va_list_tag* %arraydecay21, i32 0, i32 2
  %overflow_arg_area29 = load i8** %overflow_arg_area_p28
  %16 = bitcast i8* %overflow_arg_area29 to i64*
  %overflow_arg_area.next30 = getelementptr i8* %overflow_arg_area29, i32 8
  store i8* %overflow_arg_area.next30, i8** %overflow_arg_area_p28
  br label %vaarg.end31

vaarg.end31:                                      ; preds = %vaarg.in_mem27, %vaarg.in_reg25
  %vaarg.addr32 = phi i64* [ %14, %vaarg.in_reg25 ], [ %16, %vaarg.in_mem27 ]
  %17 = load i64* %vaarg.addr32
  store i64 %17, i64* %arg1, align 8
  %tmp33 = load i32* %i.addr, align 4
  %tmp34 = load i64* %arg0, align 8
  %tmp35 = load i64* %arg1, align 8
  %call36 = call i64 @f3h(i32 %tmp33, i64 %tmp34, i64 %tmp35, i64 0, i64 0)
  store i64 %call36, i64* %t, align 8
  br label %sw.epilog

sw.bb37:                                          ; preds = %entry
  %arraydecay38 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %gp_offset_p39 = getelementptr inbounds %struct.__va_list_tag* %arraydecay38, i32 0, i32 0
  %gp_offset40 = load i32* %gp_offset_p39
  %fits_in_gp41 = icmp ule i32 %gp_offset40, 40
  br i1 %fits_in_gp41, label %vaarg.in_reg42, label %vaarg.in_mem44

vaarg.in_reg42:                                   ; preds = %sw.bb37
  %18 = getelementptr inbounds %struct.__va_list_tag* %arraydecay38, i32 0, i32 3
  %reg_save_area43 = load i8** %18
  %19 = getelementptr i8* %reg_save_area43, i32 %gp_offset40
  %20 = bitcast i8* %19 to i64*
  %21 = add i32 %gp_offset40, 8
  store i32 %21, i32* %gp_offset_p39
  br label %vaarg.end48

vaarg.in_mem44:                                   ; preds = %sw.bb37
  %overflow_arg_area_p45 = getelementptr inbounds %struct.__va_list_tag* %arraydecay38, i32 0, i32 2
  %overflow_arg_area46 = load i8** %overflow_arg_area_p45
  %22 = bitcast i8* %overflow_arg_area46 to i64*
  %overflow_arg_area.next47 = getelementptr i8* %overflow_arg_area46, i32 8
  store i8* %overflow_arg_area.next47, i8** %overflow_arg_area_p45
  br label %vaarg.end48

vaarg.end48:                                      ; preds = %vaarg.in_mem44, %vaarg.in_reg42
  %vaarg.addr49 = phi i64* [ %20, %vaarg.in_reg42 ], [ %22, %vaarg.in_mem44 ]
  %23 = load i64* %vaarg.addr49
  store i64 %23, i64* %arg0, align 8
  %arraydecay50 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %gp_offset_p51 = getelementptr inbounds %struct.__va_list_tag* %arraydecay50, i32 0, i32 0
  %gp_offset52 = load i32* %gp_offset_p51
  %fits_in_gp53 = icmp ule i32 %gp_offset52, 40
  br i1 %fits_in_gp53, label %vaarg.in_reg54, label %vaarg.in_mem56

vaarg.in_reg54:                                   ; preds = %vaarg.end48
  %24 = getelementptr inbounds %struct.__va_list_tag* %arraydecay50, i32 0, i32 3
  %reg_save_area55 = load i8** %24
  %25 = getelementptr i8* %reg_save_area55, i32 %gp_offset52
  %26 = bitcast i8* %25 to i64*
  %27 = add i32 %gp_offset52, 8
  store i32 %27, i32* %gp_offset_p51
  br label %vaarg.end60

vaarg.in_mem56:                                   ; preds = %vaarg.end48
  %overflow_arg_area_p57 = getelementptr inbounds %struct.__va_list_tag* %arraydecay50, i32 0, i32 2
  %overflow_arg_area58 = load i8** %overflow_arg_area_p57
  %28 = bitcast i8* %overflow_arg_area58 to i64*
  %overflow_arg_area.next59 = getelementptr i8* %overflow_arg_area58, i32 8
  store i8* %overflow_arg_area.next59, i8** %overflow_arg_area_p57
  br label %vaarg.end60

vaarg.end60:                                      ; preds = %vaarg.in_mem56, %vaarg.in_reg54
  %vaarg.addr61 = phi i64* [ %26, %vaarg.in_reg54 ], [ %28, %vaarg.in_mem56 ]
  %29 = load i64* %vaarg.addr61
  store i64 %29, i64* %arg1, align 8
  %arraydecay62 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %gp_offset_p63 = getelementptr inbounds %struct.__va_list_tag* %arraydecay62, i32 0, i32 0
  %gp_offset64 = load i32* %gp_offset_p63
  %fits_in_gp65 = icmp ule i32 %gp_offset64, 40
  br i1 %fits_in_gp65, label %vaarg.in_reg66, label %vaarg.in_mem68

vaarg.in_reg66:                                   ; preds = %vaarg.end60
  %30 = getelementptr inbounds %struct.__va_list_tag* %arraydecay62, i32 0, i32 3
  %reg_save_area67 = load i8** %30
  %31 = getelementptr i8* %reg_save_area67, i32 %gp_offset64
  %32 = bitcast i8* %31 to i64*
  %33 = add i32 %gp_offset64, 8
  store i32 %33, i32* %gp_offset_p63
  br label %vaarg.end72

vaarg.in_mem68:                                   ; preds = %vaarg.end60
  %overflow_arg_area_p69 = getelementptr inbounds %struct.__va_list_tag* %arraydecay62, i32 0, i32 2
  %overflow_arg_area70 = load i8** %overflow_arg_area_p69
  %34 = bitcast i8* %overflow_arg_area70 to i64*
  %overflow_arg_area.next71 = getelementptr i8* %overflow_arg_area70, i32 8
  store i8* %overflow_arg_area.next71, i8** %overflow_arg_area_p69
  br label %vaarg.end72

vaarg.end72:                                      ; preds = %vaarg.in_mem68, %vaarg.in_reg66
  %vaarg.addr73 = phi i64* [ %32, %vaarg.in_reg66 ], [ %34, %vaarg.in_mem68 ]
  %35 = load i64* %vaarg.addr73
  store i64 %35, i64* %arg2, align 8
  %tmp74 = load i32* %i.addr, align 4
  %tmp75 = load i64* %arg0, align 8
  %tmp76 = load i64* %arg1, align 8
  %tmp77 = load i64* %arg2, align 8
  %call78 = call i64 @f3h(i32 %tmp74, i64 %tmp75, i64 %tmp76, i64 %tmp77, i64 0)
  store i64 %call78, i64* %t, align 8
  br label %sw.epilog

sw.bb79:                                          ; preds = %entry
  %arraydecay80 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %gp_offset_p81 = getelementptr inbounds %struct.__va_list_tag* %arraydecay80, i32 0, i32 0
  %gp_offset82 = load i32* %gp_offset_p81
  %fits_in_gp83 = icmp ule i32 %gp_offset82, 40
  br i1 %fits_in_gp83, label %vaarg.in_reg84, label %vaarg.in_mem86

vaarg.in_reg84:                                   ; preds = %sw.bb79
  %36 = getelementptr inbounds %struct.__va_list_tag* %arraydecay80, i32 0, i32 3
  %reg_save_area85 = load i8** %36
  %37 = getelementptr i8* %reg_save_area85, i32 %gp_offset82
  %38 = bitcast i8* %37 to i64*
  %39 = add i32 %gp_offset82, 8
  store i32 %39, i32* %gp_offset_p81
  br label %vaarg.end90

vaarg.in_mem86:                                   ; preds = %sw.bb79
  %overflow_arg_area_p87 = getelementptr inbounds %struct.__va_list_tag* %arraydecay80, i32 0, i32 2
  %overflow_arg_area88 = load i8** %overflow_arg_area_p87
  %40 = bitcast i8* %overflow_arg_area88 to i64*
  %overflow_arg_area.next89 = getelementptr i8* %overflow_arg_area88, i32 8
  store i8* %overflow_arg_area.next89, i8** %overflow_arg_area_p87
  br label %vaarg.end90

vaarg.end90:                                      ; preds = %vaarg.in_mem86, %vaarg.in_reg84
  %vaarg.addr91 = phi i64* [ %38, %vaarg.in_reg84 ], [ %40, %vaarg.in_mem86 ]
  %41 = load i64* %vaarg.addr91
  store i64 %41, i64* %arg0, align 8
  %arraydecay92 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %gp_offset_p93 = getelementptr inbounds %struct.__va_list_tag* %arraydecay92, i32 0, i32 0
  %gp_offset94 = load i32* %gp_offset_p93
  %fits_in_gp95 = icmp ule i32 %gp_offset94, 40
  br i1 %fits_in_gp95, label %vaarg.in_reg96, label %vaarg.in_mem98

vaarg.in_reg96:                                   ; preds = %vaarg.end90
  %42 = getelementptr inbounds %struct.__va_list_tag* %arraydecay92, i32 0, i32 3
  %reg_save_area97 = load i8** %42
  %43 = getelementptr i8* %reg_save_area97, i32 %gp_offset94
  %44 = bitcast i8* %43 to i64*
  %45 = add i32 %gp_offset94, 8
  store i32 %45, i32* %gp_offset_p93
  br label %vaarg.end102

vaarg.in_mem98:                                   ; preds = %vaarg.end90
  %overflow_arg_area_p99 = getelementptr inbounds %struct.__va_list_tag* %arraydecay92, i32 0, i32 2
  %overflow_arg_area100 = load i8** %overflow_arg_area_p99
  %46 = bitcast i8* %overflow_arg_area100 to i64*
  %overflow_arg_area.next101 = getelementptr i8* %overflow_arg_area100, i32 8
  store i8* %overflow_arg_area.next101, i8** %overflow_arg_area_p99
  br label %vaarg.end102

vaarg.end102:                                     ; preds = %vaarg.in_mem98, %vaarg.in_reg96
  %vaarg.addr103 = phi i64* [ %44, %vaarg.in_reg96 ], [ %46, %vaarg.in_mem98 ]
  %47 = load i64* %vaarg.addr103
  store i64 %47, i64* %arg1, align 8
  %arraydecay104 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %gp_offset_p105 = getelementptr inbounds %struct.__va_list_tag* %arraydecay104, i32 0, i32 0
  %gp_offset106 = load i32* %gp_offset_p105
  %fits_in_gp107 = icmp ule i32 %gp_offset106, 40
  br i1 %fits_in_gp107, label %vaarg.in_reg108, label %vaarg.in_mem110

vaarg.in_reg108:                                  ; preds = %vaarg.end102
  %48 = getelementptr inbounds %struct.__va_list_tag* %arraydecay104, i32 0, i32 3
  %reg_save_area109 = load i8** %48
  %49 = getelementptr i8* %reg_save_area109, i32 %gp_offset106
  %50 = bitcast i8* %49 to i64*
  %51 = add i32 %gp_offset106, 8
  store i32 %51, i32* %gp_offset_p105
  br label %vaarg.end114

vaarg.in_mem110:                                  ; preds = %vaarg.end102
  %overflow_arg_area_p111 = getelementptr inbounds %struct.__va_list_tag* %arraydecay104, i32 0, i32 2
  %overflow_arg_area112 = load i8** %overflow_arg_area_p111
  %52 = bitcast i8* %overflow_arg_area112 to i64*
  %overflow_arg_area.next113 = getelementptr i8* %overflow_arg_area112, i32 8
  store i8* %overflow_arg_area.next113, i8** %overflow_arg_area_p111
  br label %vaarg.end114

vaarg.end114:                                     ; preds = %vaarg.in_mem110, %vaarg.in_reg108
  %vaarg.addr115 = phi i64* [ %50, %vaarg.in_reg108 ], [ %52, %vaarg.in_mem110 ]
  %53 = load i64* %vaarg.addr115
  store i64 %53, i64* %arg2, align 8
  %arraydecay116 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %gp_offset_p117 = getelementptr inbounds %struct.__va_list_tag* %arraydecay116, i32 0, i32 0
  %gp_offset118 = load i32* %gp_offset_p117
  %fits_in_gp119 = icmp ule i32 %gp_offset118, 40
  br i1 %fits_in_gp119, label %vaarg.in_reg120, label %vaarg.in_mem122

vaarg.in_reg120:                                  ; preds = %vaarg.end114
  %54 = getelementptr inbounds %struct.__va_list_tag* %arraydecay116, i32 0, i32 3
  %reg_save_area121 = load i8** %54
  %55 = getelementptr i8* %reg_save_area121, i32 %gp_offset118
  %56 = bitcast i8* %55 to i64*
  %57 = add i32 %gp_offset118, 8
  store i32 %57, i32* %gp_offset_p117
  br label %vaarg.end126

vaarg.in_mem122:                                  ; preds = %vaarg.end114
  %overflow_arg_area_p123 = getelementptr inbounds %struct.__va_list_tag* %arraydecay116, i32 0, i32 2
  %overflow_arg_area124 = load i8** %overflow_arg_area_p123
  %58 = bitcast i8* %overflow_arg_area124 to i64*
  %overflow_arg_area.next125 = getelementptr i8* %overflow_arg_area124, i32 8
  store i8* %overflow_arg_area.next125, i8** %overflow_arg_area_p123
  br label %vaarg.end126

vaarg.end126:                                     ; preds = %vaarg.in_mem122, %vaarg.in_reg120
  %vaarg.addr127 = phi i64* [ %56, %vaarg.in_reg120 ], [ %58, %vaarg.in_mem122 ]
  %59 = load i64* %vaarg.addr127
  store i64 %59, i64* %arg3, align 8
  %tmp128 = load i32* %i.addr, align 4
  %tmp129 = load i64* %arg0, align 8
  %tmp130 = load i64* %arg1, align 8
  %tmp131 = load i64* %arg2, align 8
  %tmp132 = load i64* %arg3, align 8
  %call133 = call i64 @f3h(i32 %tmp128, i64 %tmp129, i64 %tmp130, i64 %tmp131, i64 %tmp132)
  store i64 %call133, i64* %t, align 8
  br label %sw.epilog

sw.default:                                       ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

sw.epilog:                                        ; preds = %vaarg.end126, %vaarg.end72, %vaarg.end31, %vaarg.end, %sw.bb
  %arraydecay134 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %arraydecay134135 = bitcast %struct.__va_list_tag* %arraydecay134 to i8*
  call void @llvm.va_end(i8* %arraydecay134135)
  %tmp136 = load i64* %t, align 8
  ret i64 %tmp136
}

declare void @abort() noreturn nounwind

define void @f4(i32 %i, ...) nounwind uwtable {
entry:
  %ap.addr.i = alloca %struct.__va_list_tag*, align 8
  %i.addr = alloca i32, align 4
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  store i32 %i, i32* %i.addr, align 4
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %arraydecay1 = bitcast %struct.__va_list_tag* %arraydecay to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %tmp = load i32* %i.addr, align 4
  switch i32 %tmp, label %sw.default [
    i32 4, label %sw.bb
    i32 5, label %sw.bb3
  ]

sw.bb:                                            ; preds = %entry
  %arraydecay2 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %fp_offset_p = getelementptr inbounds %struct.__va_list_tag* %arraydecay2, i32 0, i32 1
  %fp_offset = load i32* %fp_offset_p
  %fits_in_fp = icmp ule i32 %fp_offset, 160
  br i1 %fits_in_fp, label %vaarg.in_reg, label %vaarg.in_mem

vaarg.in_reg:                                     ; preds = %sw.bb
  %0 = getelementptr inbounds %struct.__va_list_tag* %arraydecay2, i32 0, i32 3
  %reg_save_area = load i8** %0
  %1 = getelementptr i8* %reg_save_area, i32 %fp_offset
  %2 = bitcast i8* %1 to double*
  %3 = add i32 %fp_offset, 16
  store i32 %3, i32* %fp_offset_p
  br label %vaarg.end

vaarg.in_mem:                                     ; preds = %sw.bb
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
  store i64 %conv, i64* @y, align 8
  br label %sw.epilog

sw.bb3:                                           ; preds = %entry
  %arraydecay4 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %fp_offset_p5 = getelementptr inbounds %struct.__va_list_tag* %arraydecay4, i32 0, i32 1
  %fp_offset6 = load i32* %fp_offset_p5
  %fits_in_fp7 = icmp ule i32 %fp_offset6, 160
  br i1 %fits_in_fp7, label %vaarg.in_reg8, label %vaarg.in_mem10

vaarg.in_reg8:                                    ; preds = %sw.bb3
  %6 = getelementptr inbounds %struct.__va_list_tag* %arraydecay4, i32 0, i32 3
  %reg_save_area9 = load i8** %6
  %7 = getelementptr i8* %reg_save_area9, i32 %fp_offset6
  %8 = bitcast i8* %7 to double*
  %9 = add i32 %fp_offset6, 16
  store i32 %9, i32* %fp_offset_p5
  br label %vaarg.end14

vaarg.in_mem10:                                   ; preds = %sw.bb3
  %overflow_arg_area_p11 = getelementptr inbounds %struct.__va_list_tag* %arraydecay4, i32 0, i32 2
  %overflow_arg_area12 = load i8** %overflow_arg_area_p11
  %10 = bitcast i8* %overflow_arg_area12 to double*
  %overflow_arg_area.next13 = getelementptr i8* %overflow_arg_area12, i32 8
  store i8* %overflow_arg_area.next13, i8** %overflow_arg_area_p11
  br label %vaarg.end14

vaarg.end14:                                      ; preds = %vaarg.in_mem10, %vaarg.in_reg8
  %vaarg.addr15 = phi double* [ %8, %vaarg.in_reg8 ], [ %10, %vaarg.in_mem10 ]
  %11 = load double* %vaarg.addr15
  %conv16 = fptosi double %11 to i64
  store i64 %conv16, i64* @y, align 8
  %arraydecay17 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %fp_offset_p18 = getelementptr inbounds %struct.__va_list_tag* %arraydecay17, i32 0, i32 1
  %fp_offset19 = load i32* %fp_offset_p18
  %fits_in_fp20 = icmp ule i32 %fp_offset19, 160
  br i1 %fits_in_fp20, label %vaarg.in_reg21, label %vaarg.in_mem23

vaarg.in_reg21:                                   ; preds = %vaarg.end14
  %12 = getelementptr inbounds %struct.__va_list_tag* %arraydecay17, i32 0, i32 3
  %reg_save_area22 = load i8** %12
  %13 = getelementptr i8* %reg_save_area22, i32 %fp_offset19
  %14 = bitcast i8* %13 to double*
  %15 = add i32 %fp_offset19, 16
  store i32 %15, i32* %fp_offset_p18
  br label %vaarg.end27

vaarg.in_mem23:                                   ; preds = %vaarg.end14
  %overflow_arg_area_p24 = getelementptr inbounds %struct.__va_list_tag* %arraydecay17, i32 0, i32 2
  %overflow_arg_area25 = load i8** %overflow_arg_area_p24
  %16 = bitcast i8* %overflow_arg_area25 to double*
  %overflow_arg_area.next26 = getelementptr i8* %overflow_arg_area25, i32 8
  store i8* %overflow_arg_area.next26, i8** %overflow_arg_area_p24
  br label %vaarg.end27

vaarg.end27:                                      ; preds = %vaarg.in_mem23, %vaarg.in_reg21
  %vaarg.addr28 = phi double* [ %14, %vaarg.in_reg21 ], [ %16, %vaarg.in_mem23 ]
  %17 = load double* %vaarg.addr28
  %tmp29 = load i64* @y, align 8
  %conv30 = sitofp i64 %tmp29 to double
  %add = fadd double %conv30, %17
  %conv31 = fptosi double %add to i64
  store i64 %conv31, i64* @y, align 8
  br label %sw.epilog

sw.default:                                       ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

sw.epilog:                                        ; preds = %vaarg.end27, %vaarg.end
  %arraydecay32 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %18 = bitcast %struct.__va_list_tag** %ap.addr.i to i8*
  call void @llvm.lifetime.start(i64 -1, i8* %18)
  store %struct.__va_list_tag* %arraydecay32, %struct.__va_list_tag** %ap.addr.i, align 8
  %tmp.i = load %struct.__va_list_tag** %ap.addr.i, align 8
  %fp_offset_p.i = getelementptr inbounds %struct.__va_list_tag* %tmp.i, i32 0, i32 1
  %fp_offset.i = load i32* %fp_offset_p.i
  %fits_in_fp.i = icmp ule i32 %fp_offset.i, 160
  br i1 %fits_in_fp.i, label %vaarg.in_reg.i, label %vaarg.in_mem.i

vaarg.in_reg.i:                                   ; preds = %sw.epilog
  %19 = getelementptr inbounds %struct.__va_list_tag* %tmp.i, i32 0, i32 3
  %reg_save_area.i = load i8** %19
  %20 = getelementptr i8* %reg_save_area.i, i32 %fp_offset.i
  %21 = bitcast i8* %20 to double*
  %22 = add i32 %fp_offset.i, 16
  store i32 %22, i32* %fp_offset_p.i
  br label %vaarg.end.i

vaarg.in_mem.i:                                   ; preds = %sw.epilog
  %overflow_arg_area_p.i = getelementptr inbounds %struct.__va_list_tag* %tmp.i, i32 0, i32 2
  %overflow_arg_area.i = load i8** %overflow_arg_area_p.i
  %23 = bitcast i8* %overflow_arg_area.i to double*
  %overflow_arg_area.next.i = getelementptr i8* %overflow_arg_area.i, i32 8
  store i8* %overflow_arg_area.next.i, i8** %overflow_arg_area_p.i
  br label %vaarg.end.i

vaarg.end.i:                                      ; preds = %vaarg.in_mem.i, %vaarg.in_reg.i
  %vaarg.addr.i = phi double* [ %21, %vaarg.in_reg.i ], [ %23, %vaarg.in_mem.i ]
  %24 = load double* %vaarg.addr.i
  %conv.i = fptosi double %24 to i64
  store i64 %conv.i, i64* @x, align 8
  %tmp1.i = load %struct.__va_list_tag** %ap.addr.i, align 8
  %gp_offset_p.i = getelementptr inbounds %struct.__va_list_tag* %tmp1.i, i32 0, i32 0
  %gp_offset.i = load i32* %gp_offset_p.i
  %fits_in_gp.i = icmp ule i32 %gp_offset.i, 40
  br i1 %fits_in_gp.i, label %vaarg.in_reg2.i, label %vaarg.in_mem4.i

vaarg.in_reg2.i:                                  ; preds = %vaarg.end.i
  %25 = getelementptr inbounds %struct.__va_list_tag* %tmp1.i, i32 0, i32 3
  %reg_save_area3.i = load i8** %25
  %26 = getelementptr i8* %reg_save_area3.i, i32 %gp_offset.i
  %27 = bitcast i8* %26 to i64*
  %28 = add i32 %gp_offset.i, 8
  store i32 %28, i32* %gp_offset_p.i
  br label %vaarg.end8.i

vaarg.in_mem4.i:                                  ; preds = %vaarg.end.i
  %overflow_arg_area_p5.i = getelementptr inbounds %struct.__va_list_tag* %tmp1.i, i32 0, i32 2
  %overflow_arg_area6.i = load i8** %overflow_arg_area_p5.i
  %29 = bitcast i8* %overflow_arg_area6.i to i64*
  %overflow_arg_area.next7.i = getelementptr i8* %overflow_arg_area6.i, i32 8
  store i8* %overflow_arg_area.next7.i, i8** %overflow_arg_area_p5.i
  br label %vaarg.end8.i

vaarg.end8.i:                                     ; preds = %vaarg.in_mem4.i, %vaarg.in_reg2.i
  %vaarg.addr9.i = phi i64* [ %27, %vaarg.in_reg2.i ], [ %29, %vaarg.in_mem4.i ]
  %30 = load i64* %vaarg.addr9.i
  %tmp10.i = load i64* @x, align 8
  %add.i = add nsw i64 %tmp10.i, %30
  store i64 %add.i, i64* @x, align 8
  %tmp11.i = load %struct.__va_list_tag** %ap.addr.i, align 8
  %fp_offset_p12.i = getelementptr inbounds %struct.__va_list_tag* %tmp11.i, i32 0, i32 1
  %fp_offset13.i = load i32* %fp_offset_p12.i
  %fits_in_fp14.i = icmp ule i32 %fp_offset13.i, 160
  br i1 %fits_in_fp14.i, label %vaarg.in_reg15.i, label %vaarg.in_mem17.i

vaarg.in_reg15.i:                                 ; preds = %vaarg.end8.i
  %31 = getelementptr inbounds %struct.__va_list_tag* %tmp11.i, i32 0, i32 3
  %reg_save_area16.i = load i8** %31
  %32 = getelementptr i8* %reg_save_area16.i, i32 %fp_offset13.i
  %33 = bitcast i8* %32 to double*
  %34 = add i32 %fp_offset13.i, 16
  store i32 %34, i32* %fp_offset_p12.i
  br label %f1i.exit

vaarg.in_mem17.i:                                 ; preds = %vaarg.end8.i
  %overflow_arg_area_p18.i = getelementptr inbounds %struct.__va_list_tag* %tmp11.i, i32 0, i32 2
  %overflow_arg_area19.i = load i8** %overflow_arg_area_p18.i
  %35 = bitcast i8* %overflow_arg_area19.i to double*
  %overflow_arg_area.next20.i = getelementptr i8* %overflow_arg_area19.i, i32 8
  store i8* %overflow_arg_area.next20.i, i8** %overflow_arg_area_p18.i
  br label %f1i.exit

f1i.exit:                                         ; preds = %vaarg.in_reg15.i, %vaarg.in_mem17.i
  %vaarg.addr22.i = phi double* [ %33, %vaarg.in_reg15.i ], [ %35, %vaarg.in_mem17.i ]
  %36 = load double* %vaarg.addr22.i
  %tmp23.i = load i64* @x, align 8
  %conv24.i = sitofp i64 %tmp23.i to double
  %add25.i = fadd double %conv24.i, %36
  %conv26.i = fptosi double %add25.i to i64
  store i64 %conv26.i, i64* @x, align 8
  %37 = bitcast %struct.__va_list_tag** %ap.addr.i to i8*
  call void @llvm.lifetime.end(i64 -1, i8* %37)
  %arraydecay33 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %arraydecay3334 = bitcast %struct.__va_list_tag* %arraydecay33 to i8*
  call void @llvm.va_end(i8* %arraydecay3334)
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  call void (i32, ...)* @f1(i32 3, double 1.600000e+01, i64 128, double 3.200000e+01)
  %tmp = load i64* @x, align 8
  %cmp = icmp ne i64 %tmp, 176
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  call void (i32, ...)* @f2(i32 6, i32 5, i64 7, double 1.800000e+01, double 1.900000e+01, i64 17, double 6.400000e+01)
  %tmp1 = load i64* @x, align 8
  %cmp2 = icmp ne i64 %tmp1, 100
  br i1 %cmp2, label %if.then5, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.end
  %tmp3 = load i64* @y, align 8
  %cmp4 = icmp ne i64 %tmp3, 30
  br i1 %cmp4, label %if.then5, label %if.end6

if.then5:                                         ; preds = %lor.lhs.false, %if.end
  call void @abort() noreturn nounwind
  unreachable

if.end6:                                          ; preds = %lor.lhs.false
  %call = call i64 (i32, ...)* @f3(i32 0)
  %cmp7 = icmp ne i64 %call, 0
  br i1 %cmp7, label %if.then8, label %if.end9

if.then8:                                         ; preds = %if.end6
  call void @abort() noreturn nounwind
  unreachable

if.end9:                                          ; preds = %if.end6
  %call10 = call i64 (i32, ...)* @f3(i32 1, i64 18)
  %cmp11 = icmp ne i64 %call10, 19
  br i1 %cmp11, label %if.then12, label %if.end13

if.then12:                                        ; preds = %if.end9
  call void @abort() noreturn nounwind
  unreachable

if.end13:                                         ; preds = %if.end9
  %call14 = call i64 (i32, ...)* @f3(i32 2, i64 18, i64 100)
  %cmp15 = icmp ne i64 %call14, 120
  br i1 %cmp15, label %if.then16, label %if.end17

if.then16:                                        ; preds = %if.end13
  call void @abort() noreturn nounwind
  unreachable

if.end17:                                         ; preds = %if.end13
  %call18 = call i64 (i32, ...)* @f3(i32 3, i64 18, i64 100, i64 300)
  %cmp19 = icmp ne i64 %call18, 421
  br i1 %cmp19, label %if.then20, label %if.end21

if.then20:                                        ; preds = %if.end17
  call void @abort() noreturn nounwind
  unreachable

if.end21:                                         ; preds = %if.end17
  %call22 = call i64 (i32, ...)* @f3(i32 4, i64 18, i64 71, i64 64, i64 86)
  %cmp23 = icmp ne i64 %call22, 243
  br i1 %cmp23, label %if.then24, label %if.end25

if.then24:                                        ; preds = %if.end21
  call void @abort() noreturn nounwind
  unreachable

if.end25:                                         ; preds = %if.end21
  call void (i32, ...)* @f4(i32 4, double 6.000000e+00, double 9.000000e+00, i64 16, double 1.800000e+01)
  %tmp26 = load i64* @x, align 8
  %cmp27 = icmp ne i64 %tmp26, 43
  br i1 %cmp27, label %if.then31, label %lor.lhs.false28

lor.lhs.false28:                                  ; preds = %if.end25
  %tmp29 = load i64* @y, align 8
  %cmp30 = icmp ne i64 %tmp29, 6
  br i1 %cmp30, label %if.then31, label %if.end32

if.then31:                                        ; preds = %lor.lhs.false28, %if.end25
  call void @abort() noreturn nounwind
  unreachable

if.end32:                                         ; preds = %lor.lhs.false28
  call void (i32, ...)* @f4(i32 5, double 7.000000e+00, double 2.100000e+01, double 1.000000e+00, i64 17, double 1.260000e+02)
  %tmp33 = load i64* @x, align 8
  %cmp34 = icmp ne i64 %tmp33, 144
  br i1 %cmp34, label %if.then38, label %lor.lhs.false35

lor.lhs.false35:                                  ; preds = %if.end32
  %tmp36 = load i64* @y, align 8
  %cmp37 = icmp ne i64 %tmp36, 28
  br i1 %cmp37, label %if.then38, label %if.end39

if.then38:                                        ; preds = %lor.lhs.false35, %if.end32
  call void @abort() noreturn nounwind
  unreachable

if.end39:                                         ; preds = %lor.lhs.false35
  ret i32 0
}

declare void @llvm.lifetime.start(i64, i8* nocapture) nounwind

declare void @llvm.lifetime.end(i64, i8* nocapture) nounwind
