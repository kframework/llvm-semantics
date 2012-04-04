; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/va-arg-13.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.ScanfState = type { i8*, [1 x %struct.__va_list_tag], i32 }
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

define void @dummy(%struct.__va_list_tag* nocapture %vap) nounwind uwtable {
entry:
  %gp_offset_p = getelementptr inbounds %struct.__va_list_tag* %vap, i64 0, i32 0
  %gp_offset = load i32* %gp_offset_p, align 4
  %fits_in_gp = icmp ult i32 %gp_offset, 41
  br i1 %fits_in_gp, label %vaarg.in_reg, label %vaarg.in_mem

vaarg.in_reg:                                     ; preds = %entry
  %0 = getelementptr inbounds %struct.__va_list_tag* %vap, i64 0, i32 3
  %reg_save_area = load i8** %0, align 8
  %1 = sext i32 %gp_offset to i64
  %2 = getelementptr i8* %reg_save_area, i64 %1
  %3 = add i32 %gp_offset, 8
  store i32 %3, i32* %gp_offset_p, align 4
  br label %vaarg.end

vaarg.in_mem:                                     ; preds = %entry
  %overflow_arg_area_p = getelementptr inbounds %struct.__va_list_tag* %vap, i64 0, i32 2
  %overflow_arg_area = load i8** %overflow_arg_area_p, align 8
  %overflow_arg_area.next = getelementptr i8* %overflow_arg_area, i64 8
  store i8* %overflow_arg_area.next, i8** %overflow_arg_area_p, align 8
  br label %vaarg.end

vaarg.end:                                        ; preds = %vaarg.in_mem, %vaarg.in_reg
  %vaarg.addr.in = phi i8* [ %2, %vaarg.in_reg ], [ %overflow_arg_area, %vaarg.in_mem ]
  %vaarg.addr = bitcast i8* %vaarg.addr.in to i32*
  %4 = load i32* %vaarg.addr, align 4
  %cmp = icmp eq i32 %4, 1234
  br i1 %cmp, label %if.end, label %if.then

if.then:                                          ; preds = %vaarg.end
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %vaarg.end
  ret void
}

declare void @abort() noreturn nounwind

define void @test(i32 %fmt, ...) nounwind uwtable {
entry:
  %state = alloca %struct.ScanfState, align 8
  %arraydecay = getelementptr inbounds %struct.ScanfState* %state, i64 0, i32 1, i64 0
  %arraydecay1 = bitcast %struct.__va_list_tag* %arraydecay to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %gp_offset_p.i = getelementptr inbounds %struct.ScanfState* %state, i64 0, i32 1, i64 0, i32 0
  %gp_offset.i = load i32* %gp_offset_p.i, align 8
  %fits_in_gp.i = icmp ult i32 %gp_offset.i, 41
  br i1 %fits_in_gp.i, label %vaarg.in_reg.i, label %vaarg.in_mem.i

vaarg.in_reg.i:                                   ; preds = %entry
  %0 = getelementptr inbounds %struct.ScanfState* %state, i64 0, i32 1, i64 0, i32 3
  %reg_save_area.i = load i8** %0, align 8
  %1 = sext i32 %gp_offset.i to i64
  %2 = getelementptr i8* %reg_save_area.i, i64 %1
  %3 = add i32 %gp_offset.i, 8
  store i32 %3, i32* %gp_offset_p.i, align 8
  br label %vaarg.end.i

vaarg.in_mem.i:                                   ; preds = %entry
  %overflow_arg_area_p.i = getelementptr inbounds %struct.ScanfState* %state, i64 0, i32 1, i64 0, i32 2
  %overflow_arg_area.i = load i8** %overflow_arg_area_p.i, align 8
  %overflow_arg_area.next.i = getelementptr i8* %overflow_arg_area.i, i64 8
  store i8* %overflow_arg_area.next.i, i8** %overflow_arg_area_p.i, align 8
  br label %vaarg.end.i

vaarg.end.i:                                      ; preds = %vaarg.in_mem.i, %vaarg.in_reg.i
  %vaarg.addr.in.i = phi i8* [ %2, %vaarg.in_reg.i ], [ %overflow_arg_area.i, %vaarg.in_mem.i ]
  %vaarg.addr.i = bitcast i8* %vaarg.addr.in.i to i32*
  %4 = load i32* %vaarg.addr.i, align 4
  %cmp.i = icmp eq i32 %4, 1234
  br i1 %cmp.i, label %dummy.exit, label %if.then.i

if.then.i:                                        ; preds = %vaarg.end.i
  call void @abort() noreturn nounwind
  unreachable

dummy.exit:                                       ; preds = %vaarg.end.i
  call void @llvm.va_end(i8* %arraydecay1)
  call void @llvm.va_start(i8* %arraydecay1)
  %gp_offset.i2 = load i32* %gp_offset_p.i, align 8
  %fits_in_gp.i3 = icmp ult i32 %gp_offset.i2, 41
  br i1 %fits_in_gp.i3, label %vaarg.in_reg.i5, label %vaarg.in_mem.i9

vaarg.in_reg.i5:                                  ; preds = %dummy.exit
  %5 = getelementptr inbounds %struct.ScanfState* %state, i64 0, i32 1, i64 0, i32 3
  %reg_save_area.i4 = load i8** %5, align 8
  %6 = sext i32 %gp_offset.i2 to i64
  %7 = getelementptr i8* %reg_save_area.i4, i64 %6
  %8 = add i32 %gp_offset.i2, 8
  store i32 %8, i32* %gp_offset_p.i, align 8
  br label %vaarg.end.i13

vaarg.in_mem.i9:                                  ; preds = %dummy.exit
  %overflow_arg_area_p.i6 = getelementptr inbounds %struct.ScanfState* %state, i64 0, i32 1, i64 0, i32 2
  %overflow_arg_area.i7 = load i8** %overflow_arg_area_p.i6, align 8
  %overflow_arg_area.next.i8 = getelementptr i8* %overflow_arg_area.i7, i64 8
  store i8* %overflow_arg_area.next.i8, i8** %overflow_arg_area_p.i6, align 8
  br label %vaarg.end.i13

vaarg.end.i13:                                    ; preds = %vaarg.in_mem.i9, %vaarg.in_reg.i5
  %vaarg.addr.in.i10 = phi i8* [ %7, %vaarg.in_reg.i5 ], [ %overflow_arg_area.i7, %vaarg.in_mem.i9 ]
  %vaarg.addr.i11 = bitcast i8* %vaarg.addr.in.i10 to i32*
  %9 = load i32* %vaarg.addr.i11, align 4
  %cmp.i12 = icmp eq i32 %9, 1234
  br i1 %cmp.i12, label %dummy.exit15, label %if.then.i14

if.then.i14:                                      ; preds = %vaarg.end.i13
  call void @abort() noreturn nounwind
  unreachable

dummy.exit15:                                     ; preds = %vaarg.end.i13
  call void @llvm.va_end(i8* %arraydecay1)
  ret void
}

declare void @llvm.va_start(i8*) nounwind

declare void @llvm.va_end(i8*) nounwind

define i32 @main() noreturn nounwind uwtable {
entry:
  tail call void (i32, ...)* @test(i32 456, i32 1234)
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn nounwind
