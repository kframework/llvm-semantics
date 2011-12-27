; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/stdarg-4.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.__va_list_tag = type { i32, i32, i8*, i8* }

@y = common global i64 0, align 8
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

define void @f1(i32 %i, ...) nounwind uwtable {
entry:
  %ap.addr.i = alloca %struct.__va_list_tag*, align 8
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  %arraydecay1 = bitcast [1 x %struct.__va_list_tag]* %ap to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %arraydecay2 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0
  %0 = bitcast %struct.__va_list_tag** %ap.addr.i to i8*
  call void @llvm.lifetime.start(i64 -1, i8* %0)
  store %struct.__va_list_tag* %arraydecay2, %struct.__va_list_tag** %ap.addr.i, align 8
  %fp_offset_p.i = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 1
  %fp_offset.i = load i32* %fp_offset_p.i, align 4
  %fits_in_fp.i = icmp ult i32 %fp_offset.i, 161
  br i1 %fits_in_fp.i, label %vaarg.in_reg.i, label %vaarg.in_mem.i

vaarg.in_reg.i:                                   ; preds = %entry
  %1 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 3
  %reg_save_area.i = load i8** %1, align 16
  %2 = sext i32 %fp_offset.i to i64
  %3 = getelementptr i8* %reg_save_area.i, i64 %2
  %4 = add i32 %fp_offset.i, 16
  store i32 %4, i32* %fp_offset_p.i, align 4
  br label %vaarg.end.i

vaarg.in_mem.i:                                   ; preds = %entry
  %overflow_arg_area_p.i = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 2
  %overflow_arg_area.i = load i8** %overflow_arg_area_p.i, align 8
  %overflow_arg_area.next.i = getelementptr i8* %overflow_arg_area.i, i64 8
  store i8* %overflow_arg_area.next.i, i8** %overflow_arg_area_p.i, align 8
  br label %vaarg.end.i

vaarg.end.i:                                      ; preds = %vaarg.in_mem.i, %vaarg.in_reg.i
  %fp_offset13.i = phi i32 [ %4, %vaarg.in_reg.i ], [ %fp_offset.i, %vaarg.in_mem.i ]
  %vaarg.addr.i.in = phi i8* [ %3, %vaarg.in_reg.i ], [ %overflow_arg_area.i, %vaarg.in_mem.i ]
  %vaarg.addr.i = bitcast i8* %vaarg.addr.i.in to double*
  %5 = load double* %vaarg.addr.i, align 8
  %conv.i = fptosi double %5 to i64
  store i64 %conv.i, i64* @x, align 8
  %gp_offset_p.i = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 0
  %gp_offset.i = load i32* %gp_offset_p.i, align 16
  %fits_in_gp.i = icmp ult i32 %gp_offset.i, 41
  br i1 %fits_in_gp.i, label %vaarg.in_reg2.i, label %vaarg.in_mem4.i

vaarg.in_reg2.i:                                  ; preds = %vaarg.end.i
  %6 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 3
  %reg_save_area3.i = load i8** %6, align 16
  %7 = sext i32 %gp_offset.i to i64
  %8 = getelementptr i8* %reg_save_area3.i, i64 %7
  %9 = add i32 %gp_offset.i, 8
  store i32 %9, i32* %gp_offset_p.i, align 16
  br label %vaarg.end8.i

vaarg.in_mem4.i:                                  ; preds = %vaarg.end.i
  %overflow_arg_area_p5.i = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 2
  %overflow_arg_area6.i = load i8** %overflow_arg_area_p5.i, align 8
  %overflow_arg_area.next7.i = getelementptr i8* %overflow_arg_area6.i, i64 8
  store i8* %overflow_arg_area.next7.i, i8** %overflow_arg_area_p5.i, align 8
  br label %vaarg.end8.i

vaarg.end8.i:                                     ; preds = %vaarg.in_mem4.i, %vaarg.in_reg2.i
  %vaarg.addr9.i.in = phi i8* [ %8, %vaarg.in_reg2.i ], [ %overflow_arg_area6.i, %vaarg.in_mem4.i ]
  %vaarg.addr9.i = bitcast i8* %vaarg.addr9.i.in to i64*
  %10 = load i64* %vaarg.addr9.i, align 8
  %add.i = add nsw i64 %conv.i, %10
  store i64 %add.i, i64* @x, align 8
  %fits_in_fp14.i = icmp ult i32 %fp_offset13.i, 161
  br i1 %fits_in_fp14.i, label %vaarg.in_reg15.i, label %vaarg.in_mem17.i

vaarg.in_reg15.i:                                 ; preds = %vaarg.end8.i
  %fp_offset_p12.i = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 1
  %11 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 3
  %reg_save_area16.i = load i8** %11, align 16
  %12 = sext i32 %fp_offset13.i to i64
  %13 = getelementptr i8* %reg_save_area16.i, i64 %12
  %14 = add i32 %fp_offset13.i, 16
  store i32 %14, i32* %fp_offset_p12.i, align 4
  br label %f1i.exit

vaarg.in_mem17.i:                                 ; preds = %vaarg.end8.i
  %overflow_arg_area_p18.i = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 2
  %overflow_arg_area19.i = load i8** %overflow_arg_area_p18.i, align 8
  %overflow_arg_area.next20.i = getelementptr i8* %overflow_arg_area19.i, i64 8
  store i8* %overflow_arg_area.next20.i, i8** %overflow_arg_area_p18.i, align 8
  br label %f1i.exit

f1i.exit:                                         ; preds = %vaarg.in_mem17.i, %vaarg.in_reg15.i
  %vaarg.addr22.i.in = phi i8* [ %13, %vaarg.in_reg15.i ], [ %overflow_arg_area19.i, %vaarg.in_mem17.i ]
  %vaarg.addr22.i = bitcast i8* %vaarg.addr22.i.in to double*
  %15 = load double* %vaarg.addr22.i, align 8
  %conv24.i = sitofp i64 %add.i to double
  %add25.i = fadd double %conv24.i, %15
  %conv26.i = fptosi double %add25.i to i64
  store i64 %conv26.i, i64* @x, align 8
  call void @llvm.lifetime.end(i64 -1, i8* %0)
  call void @llvm.va_end(i8* %arraydecay1)
  ret void
}

declare void @llvm.va_start(i8*) nounwind

declare void @llvm.va_end(i8*) nounwind

define void @f2(i32 %i, ...) nounwind uwtable {
entry:
  %ap.addr.i.i = alloca %struct.__va_list_tag*, align 8
  %ap.addr.i = alloca %struct.__va_list_tag*, align 8
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  %arraydecay1 = bitcast [1 x %struct.__va_list_tag]* %ap to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %arraydecay2 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0
  %0 = bitcast %struct.__va_list_tag** %ap.addr.i to i8*
  call void @llvm.lifetime.start(i64 -1, i8* %0) nounwind
  store %struct.__va_list_tag* %arraydecay2, %struct.__va_list_tag** %ap.addr.i, align 8
  %1 = bitcast [1 x %struct.__va_list_tag]* %ap to i64*
  %2 = load i64* %1, align 16
  %3 = trunc i64 %2 to i32
  %fits_in_gp.i = icmp ult i32 %3, 41
  %tmp = lshr i64 %2, 32
  %tmp2 = trunc i64 %tmp to i32
  br i1 %fits_in_gp.i, label %vaarg.end.i, label %vaarg.end.i.thread

vaarg.end.i.thread:                               ; preds = %entry
  %overflow_arg_area_p.i = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 2
  %overflow_arg_area.i = load i8** %overflow_arg_area_p.i, align 8
  %overflow_arg_area.next.i = getelementptr i8* %overflow_arg_area.i, i64 8
  store i8* %overflow_arg_area.next.i, i8** %overflow_arg_area_p.i, align 8
  %vaarg.addr.i13 = bitcast i8* %overflow_arg_area.i to i32*
  %4 = load i32* %vaarg.addr.i13, align 4
  %conv.i14 = sext i32 %4 to i64
  store i64 %conv.i14, i64* @y, align 8
  %gp_offset_p2.i15 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 0
  br label %vaarg.in_mem7.i

vaarg.end.i:                                      ; preds = %entry
  %gp_offset_p.i = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 0
  %5 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 3
  %reg_save_area.i = load i8** %5, align 16
  %6 = sext i32 %3 to i64
  %7 = getelementptr i8* %reg_save_area.i, i64 %6
  %8 = add i32 %3, 8
  store i32 %8, i32* %gp_offset_p.i, align 16
  %vaarg.addr.i = bitcast i8* %7 to i32*
  %9 = load i32* %vaarg.addr.i, align 4
  %conv.i = sext i32 %9 to i64
  store i64 %conv.i, i64* @y, align 8
  %gp_offset_p2.i = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 0
  %fits_in_gp4.i = icmp ult i32 %8, 41
  br i1 %fits_in_gp4.i, label %vaarg.in_reg5.i, label %vaarg.in_mem7.i

vaarg.in_reg5.i:                                  ; preds = %vaarg.end.i
  %10 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 3
  %reg_save_area6.i = load i8** %10, align 16
  %11 = sext i32 %8 to i64
  %12 = getelementptr i8* %reg_save_area6.i, i64 %11
  %13 = add i32 %3, 16
  store i32 %13, i32* %gp_offset_p2.i, align 16
  br label %vaarg.end11.i

vaarg.in_mem7.i:                                  ; preds = %vaarg.end.i.thread, %vaarg.end.i
  %gp_offset_p2.i21 = phi i32* [ %gp_offset_p2.i15, %vaarg.end.i.thread ], [ %gp_offset_p2.i, %vaarg.end.i ]
  %conv.i19 = phi i64 [ %conv.i14, %vaarg.end.i.thread ], [ %conv.i, %vaarg.end.i ]
  %gp_offset.i.i817 = phi i32 [ %3, %vaarg.end.i.thread ], [ %8, %vaarg.end.i ]
  %overflow_arg_area_p8.i = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 2
  %overflow_arg_area9.i = load i8** %overflow_arg_area_p8.i, align 8
  %overflow_arg_area.next10.i = getelementptr i8* %overflow_arg_area9.i, i64 8
  store i8* %overflow_arg_area.next10.i, i8** %overflow_arg_area_p8.i, align 8
  br label %vaarg.end11.i

vaarg.end11.i:                                    ; preds = %vaarg.in_mem7.i, %vaarg.in_reg5.i
  %gp_offset_p2.i20 = phi i32* [ %gp_offset_p2.i, %vaarg.in_reg5.i ], [ %gp_offset_p2.i21, %vaarg.in_mem7.i ]
  %conv.i18 = phi i64 [ %conv.i, %vaarg.in_reg5.i ], [ %conv.i19, %vaarg.in_mem7.i ]
  %gp_offset.i.i = phi i32 [ %13, %vaarg.in_reg5.i ], [ %gp_offset.i.i817, %vaarg.in_mem7.i ]
  %vaarg.addr12.i.in = phi i8* [ %12, %vaarg.in_reg5.i ], [ %overflow_arg_area9.i, %vaarg.in_mem7.i ]
  %vaarg.addr12.i = bitcast i8* %vaarg.addr12.i.in to i64*
  %14 = load i64* %vaarg.addr12.i, align 8
  %add.i = add nsw i64 %conv.i18, %14
  store i64 %add.i, i64* @y, align 8
  %fp_offset_p.i = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 1
  %fits_in_fp.i = icmp ult i32 %tmp2, 161
  br i1 %fits_in_fp.i, label %vaarg.in_reg15.i, label %vaarg.in_mem17.i

vaarg.in_reg15.i:                                 ; preds = %vaarg.end11.i
  %15 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 3
  %reg_save_area16.i = load i8** %15, align 16
  %16 = sext i32 %tmp2 to i64
  %17 = getelementptr i8* %reg_save_area16.i, i64 %16
  %18 = add i32 %tmp2, 16
  store i32 %18, i32* %fp_offset_p.i, align 4
  br label %vaarg.end21.i

vaarg.in_mem17.i:                                 ; preds = %vaarg.end11.i
  %overflow_arg_area_p18.i = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 2
  %overflow_arg_area19.i = load i8** %overflow_arg_area_p18.i, align 8
  %overflow_arg_area.next20.i = getelementptr i8* %overflow_arg_area19.i, i64 8
  store i8* %overflow_arg_area.next20.i, i8** %overflow_arg_area_p18.i, align 8
  br label %vaarg.end21.i

vaarg.end21.i:                                    ; preds = %vaarg.in_mem17.i, %vaarg.in_reg15.i
  %fp_offset13.i.i12 = phi i32 [ %18, %vaarg.in_reg15.i ], [ %tmp2, %vaarg.in_mem17.i ]
  %vaarg.addr22.i.in = phi i8* [ %17, %vaarg.in_reg15.i ], [ %overflow_arg_area19.i, %vaarg.in_mem17.i ]
  %vaarg.addr22.i = bitcast i8* %vaarg.addr22.i.in to double*
  %19 = load double* %vaarg.addr22.i, align 8
  %conv24.i = sitofp i64 %add.i to double
  %add25.i = fadd double %conv24.i, %19
  %conv26.i = fptosi double %add25.i to i64
  store i64 %conv26.i, i64* @y, align 8
  %20 = bitcast %struct.__va_list_tag** %ap.addr.i.i to i8*
  call void @llvm.lifetime.start(i64 -1, i8* %20) nounwind
  store %struct.__va_list_tag* %arraydecay2, %struct.__va_list_tag** %ap.addr.i.i, align 8
  %fits_in_fp.i.i = icmp ult i32 %fp_offset13.i.i12, 161
  br i1 %fits_in_fp.i.i, label %vaarg.in_reg.i.i, label %vaarg.in_mem.i.i

vaarg.in_reg.i.i:                                 ; preds = %vaarg.end21.i
  %21 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 3
  %reg_save_area.i.i = load i8** %21, align 16
  %22 = sext i32 %fp_offset13.i.i12 to i64
  %23 = getelementptr i8* %reg_save_area.i.i, i64 %22
  %24 = add i32 %fp_offset13.i.i12, 16
  store i32 %24, i32* %fp_offset_p.i, align 4
  br label %vaarg.end.i.i

vaarg.in_mem.i.i:                                 ; preds = %vaarg.end21.i
  %overflow_arg_area_p.i.i = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 2
  %overflow_arg_area.i.i = load i8** %overflow_arg_area_p.i.i, align 8
  %overflow_arg_area.next.i.i = getelementptr i8* %overflow_arg_area.i.i, i64 8
  store i8* %overflow_arg_area.next.i.i, i8** %overflow_arg_area_p.i.i, align 8
  br label %vaarg.end.i.i

vaarg.end.i.i:                                    ; preds = %vaarg.in_mem.i.i, %vaarg.in_reg.i.i
  %fp_offset13.i.i = phi i32 [ %24, %vaarg.in_reg.i.i ], [ %fp_offset13.i.i12, %vaarg.in_mem.i.i ]
  %vaarg.addr.i.i.in = phi i8* [ %23, %vaarg.in_reg.i.i ], [ %overflow_arg_area.i.i, %vaarg.in_mem.i.i ]
  %vaarg.addr.i.i = bitcast i8* %vaarg.addr.i.i.in to double*
  %25 = load double* %vaarg.addr.i.i, align 8
  %conv.i.i = fptosi double %25 to i64
  store i64 %conv.i.i, i64* @x, align 8
  %fits_in_gp.i.i = icmp ult i32 %gp_offset.i.i, 41
  br i1 %fits_in_gp.i.i, label %vaarg.in_reg2.i.i, label %vaarg.in_mem4.i.i

vaarg.in_reg2.i.i:                                ; preds = %vaarg.end.i.i
  %26 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 3
  %reg_save_area3.i.i = load i8** %26, align 16
  %27 = sext i32 %gp_offset.i.i to i64
  %28 = getelementptr i8* %reg_save_area3.i.i, i64 %27
  %29 = add i32 %gp_offset.i.i, 8
  store i32 %29, i32* %gp_offset_p2.i20, align 16
  br label %vaarg.end8.i.i

vaarg.in_mem4.i.i:                                ; preds = %vaarg.end.i.i
  %overflow_arg_area_p5.i.i = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 2
  %overflow_arg_area6.i.i = load i8** %overflow_arg_area_p5.i.i, align 8
  %overflow_arg_area.next7.i.i = getelementptr i8* %overflow_arg_area6.i.i, i64 8
  store i8* %overflow_arg_area.next7.i.i, i8** %overflow_arg_area_p5.i.i, align 8
  br label %vaarg.end8.i.i

vaarg.end8.i.i:                                   ; preds = %vaarg.in_mem4.i.i, %vaarg.in_reg2.i.i
  %vaarg.addr9.i.i.in = phi i8* [ %28, %vaarg.in_reg2.i.i ], [ %overflow_arg_area6.i.i, %vaarg.in_mem4.i.i ]
  %vaarg.addr9.i.i = bitcast i8* %vaarg.addr9.i.i.in to i64*
  %30 = load i64* %vaarg.addr9.i.i, align 8
  %add.i.i = add nsw i64 %conv.i.i, %30
  store i64 %add.i.i, i64* @x, align 8
  %fits_in_fp14.i.i = icmp ult i32 %fp_offset13.i.i, 161
  br i1 %fits_in_fp14.i.i, label %vaarg.in_reg15.i.i, label %vaarg.in_mem17.i.i

vaarg.in_reg15.i.i:                               ; preds = %vaarg.end8.i.i
  %31 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 3
  %reg_save_area16.i.i = load i8** %31, align 16
  %32 = sext i32 %fp_offset13.i.i to i64
  %33 = getelementptr i8* %reg_save_area16.i.i, i64 %32
  %34 = add i32 %fp_offset13.i.i, 16
  store i32 %34, i32* %fp_offset_p.i, align 4
  br label %f2i.exit

vaarg.in_mem17.i.i:                               ; preds = %vaarg.end8.i.i
  %overflow_arg_area_p18.i.i = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 2
  %overflow_arg_area19.i.i = load i8** %overflow_arg_area_p18.i.i, align 8
  %overflow_arg_area.next20.i.i = getelementptr i8* %overflow_arg_area19.i.i, i64 8
  store i8* %overflow_arg_area.next20.i.i, i8** %overflow_arg_area_p18.i.i, align 8
  br label %f2i.exit

f2i.exit:                                         ; preds = %vaarg.in_mem17.i.i, %vaarg.in_reg15.i.i
  %vaarg.addr22.i.i.in = phi i8* [ %33, %vaarg.in_reg15.i.i ], [ %overflow_arg_area19.i.i, %vaarg.in_mem17.i.i ]
  %vaarg.addr22.i.i = bitcast i8* %vaarg.addr22.i.i.in to double*
  %35 = load double* %vaarg.addr22.i.i, align 8
  %conv24.i.i = sitofp i64 %add.i.i to double
  %add25.i.i = fadd double %conv24.i.i, %35
  %conv26.i.i = fptosi double %add25.i.i to i64
  store i64 %conv26.i.i, i64* @x, align 8
  call void @llvm.lifetime.end(i64 -1, i8* %20) nounwind
  call void @llvm.lifetime.end(i64 -1, i8* %0) nounwind
  call void @llvm.va_end(i8* %arraydecay1)
  ret void
}

define i64 @f3h(i32 %i, i64 %arg0, i64 %arg1, i64 %arg2, i64 %arg3) nounwind uwtable readnone {
entry:
  %conv = sext i32 %i to i64
  %add = add i64 %conv, %arg0
  %add3 = add i64 %add, %arg1
  %add5 = add i64 %add3, %arg2
  %add7 = add i64 %add5, %arg3
  ret i64 %add7
}

define i64 @f3(i32 %i, ...) nounwind uwtable {
entry:
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  %arraydecay1 = bitcast [1 x %struct.__va_list_tag]* %ap to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  switch i32 %i, label %sw.default [
    i32 0, label %sw.bb
    i32 1, label %sw.bb3
    i32 2, label %sw.bb8
    i32 3, label %sw.bb37
    i32 4, label %sw.bb79
  ]

sw.bb:                                            ; preds = %entry
  %conv.i = sext i32 %i to i64
  br label %sw.epilog

sw.bb3:                                           ; preds = %entry
  %gp_offset_p = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 0
  %gp_offset = load i32* %gp_offset_p, align 16
  %fits_in_gp = icmp ult i32 %gp_offset, 41
  br i1 %fits_in_gp, label %vaarg.in_reg, label %vaarg.in_mem

vaarg.in_reg:                                     ; preds = %sw.bb3
  %0 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 3
  %reg_save_area = load i8** %0, align 16
  %1 = sext i32 %gp_offset to i64
  %2 = getelementptr i8* %reg_save_area, i64 %1
  %3 = add i32 %gp_offset, 8
  store i32 %3, i32* %gp_offset_p, align 16
  br label %vaarg.end

vaarg.in_mem:                                     ; preds = %sw.bb3
  %overflow_arg_area_p = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 2
  %overflow_arg_area = load i8** %overflow_arg_area_p, align 8
  %overflow_arg_area.next = getelementptr i8* %overflow_arg_area, i64 8
  store i8* %overflow_arg_area.next, i8** %overflow_arg_area_p, align 8
  br label %vaarg.end

vaarg.end:                                        ; preds = %vaarg.in_mem, %vaarg.in_reg
  %vaarg.addr.in = phi i8* [ %2, %vaarg.in_reg ], [ %overflow_arg_area, %vaarg.in_mem ]
  %vaarg.addr = bitcast i8* %vaarg.addr.in to i64*
  %4 = load i64* %vaarg.addr, align 8
  %conv.i16 = sext i32 %i to i64
  %add.i17 = add i64 %4, %conv.i16
  br label %sw.epilog

sw.bb8:                                           ; preds = %entry
  %gp_offset_p10 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 0
  %gp_offset11 = load i32* %gp_offset_p10, align 16
  %fits_in_gp12 = icmp ult i32 %gp_offset11, 41
  br i1 %fits_in_gp12, label %vaarg.end19, label %vaarg.end19.thread

vaarg.end19.thread:                               ; preds = %sw.bb8
  %overflow_arg_area_p16 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 2
  %overflow_arg_area17 = load i8** %overflow_arg_area_p16, align 8
  %overflow_arg_area.next18 = getelementptr i8* %overflow_arg_area17, i64 8
  store i8* %overflow_arg_area.next18, i8** %overflow_arg_area_p16, align 8
  %vaarg.addr2022 = bitcast i8* %overflow_arg_area17 to i64*
  %5 = load i64* %vaarg.addr2022, align 8
  br label %vaarg.in_mem27

vaarg.end19:                                      ; preds = %sw.bb8
  %6 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 3
  %reg_save_area14 = load i8** %6, align 16
  %7 = sext i32 %gp_offset11 to i64
  %8 = getelementptr i8* %reg_save_area14, i64 %7
  %9 = add i32 %gp_offset11, 8
  store i32 %9, i32* %gp_offset_p10, align 16
  %vaarg.addr20 = bitcast i8* %8 to i64*
  %10 = load i64* %vaarg.addr20, align 8
  %fits_in_gp24 = icmp ult i32 %9, 41
  br i1 %fits_in_gp24, label %vaarg.in_reg25, label %vaarg.in_mem27

vaarg.in_reg25:                                   ; preds = %vaarg.end19
  %11 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 3
  %reg_save_area26 = load i8** %11, align 16
  %12 = sext i32 %9 to i64
  %13 = getelementptr i8* %reg_save_area26, i64 %12
  %14 = add i32 %gp_offset11, 16
  store i32 %14, i32* %gp_offset_p10, align 16
  br label %vaarg.end31

vaarg.in_mem27:                                   ; preds = %vaarg.end19.thread, %vaarg.end19
  %15 = phi i64 [ %5, %vaarg.end19.thread ], [ %10, %vaarg.end19 ]
  %overflow_arg_area_p28 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 2
  %overflow_arg_area29 = load i8** %overflow_arg_area_p28, align 8
  %overflow_arg_area.next30 = getelementptr i8* %overflow_arg_area29, i64 8
  store i8* %overflow_arg_area.next30, i8** %overflow_arg_area_p28, align 8
  br label %vaarg.end31

vaarg.end31:                                      ; preds = %vaarg.in_mem27, %vaarg.in_reg25
  %16 = phi i64 [ %10, %vaarg.in_reg25 ], [ %15, %vaarg.in_mem27 ]
  %vaarg.addr32.in = phi i8* [ %13, %vaarg.in_reg25 ], [ %overflow_arg_area29, %vaarg.in_mem27 ]
  %vaarg.addr32 = bitcast i8* %vaarg.addr32.in to i64*
  %17 = load i64* %vaarg.addr32, align 8
  %conv.i11 = sext i32 %i to i64
  %add.i12 = add i64 %16, %conv.i11
  %add3.i13 = add i64 %add.i12, %17
  br label %sw.epilog

sw.bb37:                                          ; preds = %entry
  %gp_offset_p39 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 0
  %gp_offset40 = load i32* %gp_offset_p39, align 16
  %fits_in_gp41 = icmp ult i32 %gp_offset40, 41
  br i1 %fits_in_gp41, label %vaarg.end48, label %vaarg.end48.thread

vaarg.end48.thread:                               ; preds = %sw.bb37
  %overflow_arg_area_p45 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 2
  %overflow_arg_area46 = load i8** %overflow_arg_area_p45, align 8
  %overflow_arg_area.next47 = getelementptr i8* %overflow_arg_area46, i64 8
  store i8* %overflow_arg_area.next47, i8** %overflow_arg_area_p45, align 8
  %vaarg.addr4924 = bitcast i8* %overflow_arg_area46 to i64*
  %18 = load i64* %vaarg.addr4924, align 8
  br label %vaarg.in_mem56

vaarg.end48:                                      ; preds = %sw.bb37
  %19 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 3
  %reg_save_area43 = load i8** %19, align 16
  %20 = sext i32 %gp_offset40 to i64
  %21 = getelementptr i8* %reg_save_area43, i64 %20
  %22 = add i32 %gp_offset40, 8
  store i32 %22, i32* %gp_offset_p39, align 16
  %vaarg.addr49 = bitcast i8* %21 to i64*
  %23 = load i64* %vaarg.addr49, align 8
  %fits_in_gp53 = icmp ult i32 %22, 41
  br i1 %fits_in_gp53, label %vaarg.in_reg54, label %vaarg.in_mem56

vaarg.in_reg54:                                   ; preds = %vaarg.end48
  %24 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 3
  %reg_save_area55 = load i8** %24, align 16
  %25 = sext i32 %22 to i64
  %26 = getelementptr i8* %reg_save_area55, i64 %25
  %27 = add i32 %gp_offset40, 16
  store i32 %27, i32* %gp_offset_p39, align 16
  br label %vaarg.end60

vaarg.in_mem56:                                   ; preds = %vaarg.end48.thread, %vaarg.end48
  %28 = phi i64 [ %18, %vaarg.end48.thread ], [ %23, %vaarg.end48 ]
  %gp_offset64.pr26 = phi i32 [ %gp_offset40, %vaarg.end48.thread ], [ %22, %vaarg.end48 ]
  %overflow_arg_area_p57 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 2
  %overflow_arg_area58 = load i8** %overflow_arg_area_p57, align 8
  %overflow_arg_area.next59 = getelementptr i8* %overflow_arg_area58, i64 8
  store i8* %overflow_arg_area.next59, i8** %overflow_arg_area_p57, align 8
  br label %vaarg.end60

vaarg.end60:                                      ; preds = %vaarg.in_mem56, %vaarg.in_reg54
  %29 = phi i64 [ %28, %vaarg.in_mem56 ], [ %23, %vaarg.in_reg54 ]
  %gp_offset64 = phi i32 [ %gp_offset64.pr26, %vaarg.in_mem56 ], [ %27, %vaarg.in_reg54 ]
  %vaarg.addr61.in = phi i8* [ %overflow_arg_area58, %vaarg.in_mem56 ], [ %26, %vaarg.in_reg54 ]
  %vaarg.addr61 = bitcast i8* %vaarg.addr61.in to i64*
  %30 = load i64* %vaarg.addr61, align 8
  %fits_in_gp65 = icmp ult i32 %gp_offset64, 41
  br i1 %fits_in_gp65, label %vaarg.in_reg66, label %vaarg.in_mem68

vaarg.in_reg66:                                   ; preds = %vaarg.end60
  %31 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 3
  %reg_save_area67 = load i8** %31, align 16
  %32 = sext i32 %gp_offset64 to i64
  %33 = getelementptr i8* %reg_save_area67, i64 %32
  %34 = add i32 %gp_offset64, 8
  store i32 %34, i32* %gp_offset_p39, align 16
  br label %vaarg.end72

vaarg.in_mem68:                                   ; preds = %vaarg.end60
  %overflow_arg_area_p69 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 2
  %overflow_arg_area70 = load i8** %overflow_arg_area_p69, align 8
  %overflow_arg_area.next71 = getelementptr i8* %overflow_arg_area70, i64 8
  store i8* %overflow_arg_area.next71, i8** %overflow_arg_area_p69, align 8
  br label %vaarg.end72

vaarg.end72:                                      ; preds = %vaarg.in_mem68, %vaarg.in_reg66
  %vaarg.addr73.in = phi i8* [ %33, %vaarg.in_reg66 ], [ %overflow_arg_area70, %vaarg.in_mem68 ]
  %vaarg.addr73 = bitcast i8* %vaarg.addr73.in to i64*
  %35 = load i64* %vaarg.addr73, align 8
  %conv.i6 = sext i32 %i to i64
  %add.i7 = add i64 %29, %conv.i6
  %add3.i8 = add i64 %add.i7, %30
  %add5.i9 = add i64 %add3.i8, %35
  br label %sw.epilog

sw.bb79:                                          ; preds = %entry
  %gp_offset_p81 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 0
  %gp_offset82 = load i32* %gp_offset_p81, align 16
  %fits_in_gp83 = icmp ult i32 %gp_offset82, 41
  br i1 %fits_in_gp83, label %vaarg.end90, label %vaarg.end90.thread

vaarg.end90.thread:                               ; preds = %sw.bb79
  %overflow_arg_area_p87 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 2
  %overflow_arg_area88 = load i8** %overflow_arg_area_p87, align 8
  %overflow_arg_area.next89 = getelementptr i8* %overflow_arg_area88, i64 8
  store i8* %overflow_arg_area.next89, i8** %overflow_arg_area_p87, align 8
  %vaarg.addr9127 = bitcast i8* %overflow_arg_area88 to i64*
  %36 = load i64* %vaarg.addr9127, align 8
  br label %vaarg.in_mem98

vaarg.end90:                                      ; preds = %sw.bb79
  %37 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 3
  %reg_save_area85 = load i8** %37, align 16
  %38 = sext i32 %gp_offset82 to i64
  %39 = getelementptr i8* %reg_save_area85, i64 %38
  %40 = add i32 %gp_offset82, 8
  store i32 %40, i32* %gp_offset_p81, align 16
  %vaarg.addr91 = bitcast i8* %39 to i64*
  %41 = load i64* %vaarg.addr91, align 8
  %fits_in_gp95 = icmp ult i32 %40, 41
  br i1 %fits_in_gp95, label %vaarg.in_reg96, label %vaarg.in_mem98

vaarg.in_reg96:                                   ; preds = %vaarg.end90
  %42 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 3
  %reg_save_area97 = load i8** %42, align 16
  %43 = sext i32 %40 to i64
  %44 = getelementptr i8* %reg_save_area97, i64 %43
  %45 = add i32 %gp_offset82, 16
  store i32 %45, i32* %gp_offset_p81, align 16
  br label %vaarg.end102

vaarg.in_mem98:                                   ; preds = %vaarg.end90.thread, %vaarg.end90
  %46 = phi i64 [ %36, %vaarg.end90.thread ], [ %41, %vaarg.end90 ]
  %gp_offset106.pr29 = phi i32 [ %gp_offset82, %vaarg.end90.thread ], [ %40, %vaarg.end90 ]
  %overflow_arg_area_p99 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 2
  %overflow_arg_area100 = load i8** %overflow_arg_area_p99, align 8
  %overflow_arg_area.next101 = getelementptr i8* %overflow_arg_area100, i64 8
  store i8* %overflow_arg_area.next101, i8** %overflow_arg_area_p99, align 8
  br label %vaarg.end102

vaarg.end102:                                     ; preds = %vaarg.in_mem98, %vaarg.in_reg96
  %47 = phi i64 [ %46, %vaarg.in_mem98 ], [ %41, %vaarg.in_reg96 ]
  %gp_offset118.pr = phi i32 [ %gp_offset106.pr29, %vaarg.in_mem98 ], [ %45, %vaarg.in_reg96 ]
  %vaarg.addr103.in = phi i8* [ %overflow_arg_area100, %vaarg.in_mem98 ], [ %44, %vaarg.in_reg96 ]
  %vaarg.addr103 = bitcast i8* %vaarg.addr103.in to i64*
  %48 = load i64* %vaarg.addr103, align 8
  %fits_in_gp107 = icmp ult i32 %gp_offset118.pr, 41
  br i1 %fits_in_gp107, label %vaarg.in_reg108, label %vaarg.in_mem110

vaarg.in_reg108:                                  ; preds = %vaarg.end102
  %49 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 3
  %reg_save_area109 = load i8** %49, align 16
  %50 = sext i32 %gp_offset118.pr to i64
  %51 = getelementptr i8* %reg_save_area109, i64 %50
  %52 = add i32 %gp_offset118.pr, 8
  store i32 %52, i32* %gp_offset_p81, align 16
  br label %vaarg.end114

vaarg.in_mem110:                                  ; preds = %vaarg.end102
  %overflow_arg_area_p111 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 2
  %overflow_arg_area112 = load i8** %overflow_arg_area_p111, align 8
  %overflow_arg_area.next113 = getelementptr i8* %overflow_arg_area112, i64 8
  store i8* %overflow_arg_area.next113, i8** %overflow_arg_area_p111, align 8
  br label %vaarg.end114

vaarg.end114:                                     ; preds = %vaarg.in_mem110, %vaarg.in_reg108
  %gp_offset118 = phi i32 [ %gp_offset118.pr, %vaarg.in_mem110 ], [ %52, %vaarg.in_reg108 ]
  %vaarg.addr115.in = phi i8* [ %overflow_arg_area112, %vaarg.in_mem110 ], [ %51, %vaarg.in_reg108 ]
  %vaarg.addr115 = bitcast i8* %vaarg.addr115.in to i64*
  %53 = load i64* %vaarg.addr115, align 8
  %fits_in_gp119 = icmp ult i32 %gp_offset118, 41
  br i1 %fits_in_gp119, label %vaarg.in_reg120, label %vaarg.in_mem122

vaarg.in_reg120:                                  ; preds = %vaarg.end114
  %54 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 3
  %reg_save_area121 = load i8** %54, align 16
  %55 = sext i32 %gp_offset118 to i64
  %56 = getelementptr i8* %reg_save_area121, i64 %55
  %57 = add i32 %gp_offset118, 8
  store i32 %57, i32* %gp_offset_p81, align 16
  br label %vaarg.end126

vaarg.in_mem122:                                  ; preds = %vaarg.end114
  %overflow_arg_area_p123 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 2
  %overflow_arg_area124 = load i8** %overflow_arg_area_p123, align 8
  %overflow_arg_area.next125 = getelementptr i8* %overflow_arg_area124, i64 8
  store i8* %overflow_arg_area.next125, i8** %overflow_arg_area_p123, align 8
  br label %vaarg.end126

vaarg.end126:                                     ; preds = %vaarg.in_mem122, %vaarg.in_reg120
  %vaarg.addr127.in = phi i8* [ %56, %vaarg.in_reg120 ], [ %overflow_arg_area124, %vaarg.in_mem122 ]
  %vaarg.addr127 = bitcast i8* %vaarg.addr127.in to i64*
  %58 = load i64* %vaarg.addr127, align 8
  %conv.i1 = sext i32 %i to i64
  %add.i2 = add i64 %47, %conv.i1
  %add3.i3 = add i64 %add.i2, %48
  %add5.i4 = add i64 %add3.i3, %53
  %add7.i5 = add i64 %add5.i4, %58
  br label %sw.epilog

sw.default:                                       ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

sw.epilog:                                        ; preds = %vaarg.end126, %vaarg.end72, %vaarg.end31, %vaarg.end, %sw.bb
  %tmp13621 = phi i64 [ %add7.i5, %vaarg.end126 ], [ %add5.i9, %vaarg.end72 ], [ %add3.i13, %vaarg.end31 ], [ %add.i17, %vaarg.end ], [ %conv.i, %sw.bb ]
  call void @llvm.va_end(i8* %arraydecay1)
  ret i64 %tmp13621
}

declare void @abort() noreturn nounwind

define void @f4(i32 %i, ...) nounwind uwtable {
entry:
  %ap.addr.i = alloca %struct.__va_list_tag*, align 8
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  %arraydecay1 = bitcast [1 x %struct.__va_list_tag]* %ap to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  switch i32 %i, label %sw.default [
    i32 4, label %sw.bb
    i32 5, label %sw.bb3
  ]

sw.bb:                                            ; preds = %entry
  %fp_offset_p = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 1
  %fp_offset = load i32* %fp_offset_p, align 4
  %fits_in_fp = icmp ult i32 %fp_offset, 161
  br i1 %fits_in_fp, label %vaarg.in_reg, label %vaarg.in_mem

vaarg.in_reg:                                     ; preds = %sw.bb
  %0 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 3
  %reg_save_area = load i8** %0, align 16
  %1 = sext i32 %fp_offset to i64
  %2 = getelementptr i8* %reg_save_area, i64 %1
  %3 = add i32 %fp_offset, 16
  store i32 %3, i32* %fp_offset_p, align 4
  br label %vaarg.end

vaarg.in_mem:                                     ; preds = %sw.bb
  %overflow_arg_area_p = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 2
  %overflow_arg_area = load i8** %overflow_arg_area_p, align 8
  %overflow_arg_area.next = getelementptr i8* %overflow_arg_area, i64 8
  store i8* %overflow_arg_area.next, i8** %overflow_arg_area_p, align 8
  br label %vaarg.end

vaarg.end:                                        ; preds = %vaarg.in_mem, %vaarg.in_reg
  %fp_offset.i2 = phi i32 [ %3, %vaarg.in_reg ], [ %fp_offset, %vaarg.in_mem ]
  %vaarg.addr.in = phi i8* [ %2, %vaarg.in_reg ], [ %overflow_arg_area, %vaarg.in_mem ]
  %vaarg.addr = bitcast i8* %vaarg.addr.in to double*
  %4 = load double* %vaarg.addr, align 8
  br label %sw.epilog

sw.bb3:                                           ; preds = %entry
  %fp_offset_p5 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 1
  %fp_offset6 = load i32* %fp_offset_p5, align 4
  %fits_in_fp7 = icmp ult i32 %fp_offset6, 161
  br i1 %fits_in_fp7, label %vaarg.end14, label %vaarg.end14.thread

vaarg.end14.thread:                               ; preds = %sw.bb3
  %overflow_arg_area_p11 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 2
  %overflow_arg_area12 = load i8** %overflow_arg_area_p11, align 8
  %overflow_arg_area.next13 = getelementptr i8* %overflow_arg_area12, i64 8
  store i8* %overflow_arg_area.next13, i8** %overflow_arg_area_p11, align 8
  %vaarg.addr156 = bitcast i8* %overflow_arg_area12 to double*
  %5 = load double* %vaarg.addr156, align 8
  %conv167 = fptosi double %5 to i64
  store i64 %conv167, i64* @y, align 8
  br label %vaarg.in_mem23

vaarg.end14:                                      ; preds = %sw.bb3
  %6 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 3
  %reg_save_area9 = load i8** %6, align 16
  %7 = sext i32 %fp_offset6 to i64
  %8 = getelementptr i8* %reg_save_area9, i64 %7
  %9 = add i32 %fp_offset6, 16
  store i32 %9, i32* %fp_offset_p5, align 4
  %vaarg.addr15 = bitcast i8* %8 to double*
  %10 = load double* %vaarg.addr15, align 8
  %conv16 = fptosi double %10 to i64
  store i64 %conv16, i64* @y, align 8
  %fits_in_fp20 = icmp ult i32 %9, 161
  br i1 %fits_in_fp20, label %vaarg.in_reg21, label %vaarg.in_mem23

vaarg.in_reg21:                                   ; preds = %vaarg.end14
  %11 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 3
  %reg_save_area22 = load i8** %11, align 16
  %12 = sext i32 %9 to i64
  %13 = getelementptr i8* %reg_save_area22, i64 %12
  %14 = add i32 %fp_offset6, 32
  store i32 %14, i32* %fp_offset_p5, align 4
  br label %vaarg.end27

vaarg.in_mem23:                                   ; preds = %vaarg.end14.thread, %vaarg.end14
  %conv1611 = phi i64 [ %conv167, %vaarg.end14.thread ], [ %conv16, %vaarg.end14 ]
  %fp_offset199 = phi i32 [ %fp_offset6, %vaarg.end14.thread ], [ %9, %vaarg.end14 ]
  %overflow_arg_area_p24 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 2
  %overflow_arg_area25 = load i8** %overflow_arg_area_p24, align 8
  %overflow_arg_area.next26 = getelementptr i8* %overflow_arg_area25, i64 8
  store i8* %overflow_arg_area.next26, i8** %overflow_arg_area_p24, align 8
  br label %vaarg.end27

vaarg.end27:                                      ; preds = %vaarg.in_mem23, %vaarg.in_reg21
  %conv1610 = phi i64 [ %conv16, %vaarg.in_reg21 ], [ %conv1611, %vaarg.in_mem23 ]
  %fp_offset.i3 = phi i32 [ %14, %vaarg.in_reg21 ], [ %fp_offset199, %vaarg.in_mem23 ]
  %vaarg.addr28.in = phi i8* [ %13, %vaarg.in_reg21 ], [ %overflow_arg_area25, %vaarg.in_mem23 ]
  %vaarg.addr28 = bitcast i8* %vaarg.addr28.in to double*
  %15 = load double* %vaarg.addr28, align 8
  %conv30 = sitofp i64 %conv1610 to double
  %add = fadd double %conv30, %15
  br label %sw.epilog

sw.default:                                       ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

sw.epilog:                                        ; preds = %vaarg.end27, %vaarg.end
  %fp_offset.i = phi i32 [ %fp_offset.i3, %vaarg.end27 ], [ %fp_offset.i2, %vaarg.end ]
  %storemerge.in = phi double [ %add, %vaarg.end27 ], [ %4, %vaarg.end ]
  %storemerge = fptosi double %storemerge.in to i64
  store i64 %storemerge, i64* @y, align 8
  %arraydecay32 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0
  %16 = bitcast %struct.__va_list_tag** %ap.addr.i to i8*
  call void @llvm.lifetime.start(i64 -1, i8* %16)
  store %struct.__va_list_tag* %arraydecay32, %struct.__va_list_tag** %ap.addr.i, align 8
  %fits_in_fp.i = icmp ult i32 %fp_offset.i, 161
  br i1 %fits_in_fp.i, label %vaarg.in_reg.i, label %vaarg.in_mem.i

vaarg.in_reg.i:                                   ; preds = %sw.epilog
  %fp_offset_p.i = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 1
  %17 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 3
  %reg_save_area.i = load i8** %17, align 16
  %18 = sext i32 %fp_offset.i to i64
  %19 = getelementptr i8* %reg_save_area.i, i64 %18
  %20 = add i32 %fp_offset.i, 16
  store i32 %20, i32* %fp_offset_p.i, align 4
  br label %vaarg.end.i

vaarg.in_mem.i:                                   ; preds = %sw.epilog
  %overflow_arg_area_p.i = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 2
  %overflow_arg_area.i = load i8** %overflow_arg_area_p.i, align 8
  %overflow_arg_area.next.i = getelementptr i8* %overflow_arg_area.i, i64 8
  store i8* %overflow_arg_area.next.i, i8** %overflow_arg_area_p.i, align 8
  br label %vaarg.end.i

vaarg.end.i:                                      ; preds = %vaarg.in_mem.i, %vaarg.in_reg.i
  %fp_offset13.i = phi i32 [ %20, %vaarg.in_reg.i ], [ %fp_offset.i, %vaarg.in_mem.i ]
  %vaarg.addr.i.in = phi i8* [ %19, %vaarg.in_reg.i ], [ %overflow_arg_area.i, %vaarg.in_mem.i ]
  %vaarg.addr.i = bitcast i8* %vaarg.addr.i.in to double*
  %21 = load double* %vaarg.addr.i, align 8
  %conv.i = fptosi double %21 to i64
  store i64 %conv.i, i64* @x, align 8
  %gp_offset_p.i = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 0
  %gp_offset.i = load i32* %gp_offset_p.i, align 16
  %fits_in_gp.i = icmp ult i32 %gp_offset.i, 41
  br i1 %fits_in_gp.i, label %vaarg.in_reg2.i, label %vaarg.in_mem4.i

vaarg.in_reg2.i:                                  ; preds = %vaarg.end.i
  %22 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 3
  %reg_save_area3.i = load i8** %22, align 16
  %23 = sext i32 %gp_offset.i to i64
  %24 = getelementptr i8* %reg_save_area3.i, i64 %23
  %25 = add i32 %gp_offset.i, 8
  store i32 %25, i32* %gp_offset_p.i, align 16
  br label %vaarg.end8.i

vaarg.in_mem4.i:                                  ; preds = %vaarg.end.i
  %overflow_arg_area_p5.i = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 2
  %overflow_arg_area6.i = load i8** %overflow_arg_area_p5.i, align 8
  %overflow_arg_area.next7.i = getelementptr i8* %overflow_arg_area6.i, i64 8
  store i8* %overflow_arg_area.next7.i, i8** %overflow_arg_area_p5.i, align 8
  br label %vaarg.end8.i

vaarg.end8.i:                                     ; preds = %vaarg.in_mem4.i, %vaarg.in_reg2.i
  %vaarg.addr9.i.in = phi i8* [ %24, %vaarg.in_reg2.i ], [ %overflow_arg_area6.i, %vaarg.in_mem4.i ]
  %vaarg.addr9.i = bitcast i8* %vaarg.addr9.i.in to i64*
  %26 = load i64* %vaarg.addr9.i, align 8
  %add.i = add nsw i64 %conv.i, %26
  store i64 %add.i, i64* @x, align 8
  %fits_in_fp14.i = icmp ult i32 %fp_offset13.i, 161
  br i1 %fits_in_fp14.i, label %vaarg.in_reg15.i, label %vaarg.in_mem17.i

vaarg.in_reg15.i:                                 ; preds = %vaarg.end8.i
  %fp_offset_p12.i = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 1
  %27 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 3
  %reg_save_area16.i = load i8** %27, align 16
  %28 = sext i32 %fp_offset13.i to i64
  %29 = getelementptr i8* %reg_save_area16.i, i64 %28
  %30 = add i32 %fp_offset13.i, 16
  store i32 %30, i32* %fp_offset_p12.i, align 4
  br label %f1i.exit

vaarg.in_mem17.i:                                 ; preds = %vaarg.end8.i
  %overflow_arg_area_p18.i = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 2
  %overflow_arg_area19.i = load i8** %overflow_arg_area_p18.i, align 8
  %overflow_arg_area.next20.i = getelementptr i8* %overflow_arg_area19.i, i64 8
  store i8* %overflow_arg_area.next20.i, i8** %overflow_arg_area_p18.i, align 8
  br label %f1i.exit

f1i.exit:                                         ; preds = %vaarg.in_mem17.i, %vaarg.in_reg15.i
  %vaarg.addr22.i.in = phi i8* [ %29, %vaarg.in_reg15.i ], [ %overflow_arg_area19.i, %vaarg.in_mem17.i ]
  %vaarg.addr22.i = bitcast i8* %vaarg.addr22.i.in to double*
  %31 = load double* %vaarg.addr22.i, align 8
  %conv24.i = sitofp i64 %add.i to double
  %add25.i = fadd double %conv24.i, %31
  %conv26.i = fptosi double %add25.i to i64
  store i64 %conv26.i, i64* @x, align 8
  call void @llvm.lifetime.end(i64 -1, i8* %16)
  call void @llvm.va_end(i8* %arraydecay1)
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  tail call void (i32, ...)* @f1(i32 3, double 1.600000e+01, i64 128, double 3.200000e+01)
  %tmp = load i64* @x, align 8
  %cmp = icmp eq i64 %tmp, 176
  br i1 %cmp, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  tail call void (i32, ...)* @f2(i32 6, i32 5, i64 7, double 1.800000e+01, double 1.900000e+01, i64 17, double 6.400000e+01)
  %tmp1 = load i64* @x, align 8
  %cmp2 = icmp eq i64 %tmp1, 100
  %tmp3 = load i64* @y, align 8
  %cmp4 = icmp eq i64 %tmp3, 30
  %or.cond = and i1 %cmp2, %cmp4
  br i1 %or.cond, label %if.end6, label %if.then5

if.then5:                                         ; preds = %if.end
  tail call void @abort() noreturn nounwind
  unreachable

if.end6:                                          ; preds = %if.end
  %call = tail call i64 (i32, ...)* @f3(i32 0)
  %cmp7 = icmp eq i64 %call, 0
  br i1 %cmp7, label %if.end9, label %if.then8

if.then8:                                         ; preds = %if.end6
  tail call void @abort() noreturn nounwind
  unreachable

if.end9:                                          ; preds = %if.end6
  %call10 = tail call i64 (i32, ...)* @f3(i32 1, i64 18)
  %cmp11 = icmp eq i64 %call10, 19
  br i1 %cmp11, label %if.end13, label %if.then12

if.then12:                                        ; preds = %if.end9
  tail call void @abort() noreturn nounwind
  unreachable

if.end13:                                         ; preds = %if.end9
  %call14 = tail call i64 (i32, ...)* @f3(i32 2, i64 18, i64 100)
  %cmp15 = icmp eq i64 %call14, 120
  br i1 %cmp15, label %if.end17, label %if.then16

if.then16:                                        ; preds = %if.end13
  tail call void @abort() noreturn nounwind
  unreachable

if.end17:                                         ; preds = %if.end13
  %call18 = tail call i64 (i32, ...)* @f3(i32 3, i64 18, i64 100, i64 300)
  %cmp19 = icmp eq i64 %call18, 421
  br i1 %cmp19, label %if.end21, label %if.then20

if.then20:                                        ; preds = %if.end17
  tail call void @abort() noreturn nounwind
  unreachable

if.end21:                                         ; preds = %if.end17
  %call22 = tail call i64 (i32, ...)* @f3(i32 4, i64 18, i64 71, i64 64, i64 86)
  %cmp23 = icmp eq i64 %call22, 243
  br i1 %cmp23, label %if.end25, label %if.then24

if.then24:                                        ; preds = %if.end21
  tail call void @abort() noreturn nounwind
  unreachable

if.end25:                                         ; preds = %if.end21
  tail call void (i32, ...)* @f4(i32 4, double 6.000000e+00, double 9.000000e+00, i64 16, double 1.800000e+01)
  %tmp26 = load i64* @x, align 8
  %cmp27 = icmp eq i64 %tmp26, 43
  %tmp29 = load i64* @y, align 8
  %cmp30 = icmp eq i64 %tmp29, 6
  %or.cond1 = and i1 %cmp27, %cmp30
  br i1 %or.cond1, label %if.end32, label %if.then31

if.then31:                                        ; preds = %if.end25
  tail call void @abort() noreturn nounwind
  unreachable

if.end32:                                         ; preds = %if.end25
  tail call void (i32, ...)* @f4(i32 5, double 7.000000e+00, double 2.100000e+01, double 1.000000e+00, i64 17, double 1.260000e+02)
  %tmp33 = load i64* @x, align 8
  %cmp34 = icmp eq i64 %tmp33, 144
  %tmp36 = load i64* @y, align 8
  %cmp37 = icmp eq i64 %tmp36, 28
  %or.cond2 = and i1 %cmp34, %cmp37
  br i1 %or.cond2, label %if.end39, label %if.then38

if.then38:                                        ; preds = %if.end32
  tail call void @abort() noreturn nounwind
  unreachable

if.end39:                                         ; preds = %if.end32
  ret i32 0
}

declare void @llvm.lifetime.start(i64, i8* nocapture) nounwind

declare void @llvm.lifetime.end(i64, i8* nocapture) nounwind
