; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/strct-varg-1.ll'
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

define void @f(i32 %attr, ...) nounwind uwtable {
entry:
  %va = alloca [1 x %struct.__va_list_tag], align 16
  %arraydecay1 = bitcast [1 x %struct.__va_list_tag]* %va to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %cmp = icmp eq i32 %attr, 2
  br i1 %cmp, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  %gp_offset_p = getelementptr inbounds [1 x %struct.__va_list_tag]* %va, i64 0, i64 0, i32 0
  %gp_offset = load i32* %gp_offset_p, align 16
  %fits_in_gp = icmp ult i32 %gp_offset, 41
  br i1 %fits_in_gp, label %vaarg.in_reg, label %vaarg.in_mem

vaarg.in_reg:                                     ; preds = %if.end
  %0 = getelementptr inbounds [1 x %struct.__va_list_tag]* %va, i64 0, i64 0, i32 3
  %reg_save_area = load i8** %0, align 16
  %1 = sext i32 %gp_offset to i64
  %2 = getelementptr i8* %reg_save_area, i64 %1
  %3 = add i32 %gp_offset, 8
  store i32 %3, i32* %gp_offset_p, align 16
  br label %vaarg.end

vaarg.in_mem:                                     ; preds = %if.end
  %overflow_arg_area_p = getelementptr inbounds [1 x %struct.__va_list_tag]* %va, i64 0, i64 0, i32 2
  %overflow_arg_area = load i8** %overflow_arg_area_p, align 8
  %overflow_arg_area.next = getelementptr i8* %overflow_arg_area, i64 8
  store i8* %overflow_arg_area.next, i8** %overflow_arg_area_p, align 8
  br label %vaarg.end

vaarg.end:                                        ; preds = %vaarg.in_mem, %vaarg.in_reg
  %gp_offset13 = phi i32 [ %3, %vaarg.in_reg ], [ %gp_offset, %vaarg.in_mem ]
  %vaarg.addr.in = phi i8* [ %2, %vaarg.in_reg ], [ %overflow_arg_area, %vaarg.in_mem ]
  %4 = bitcast i8* %vaarg.addr.in to i64*
  %5 = load i64* %4, align 4
  %6 = icmp eq i64 %5, 93823560624810
  br i1 %6, label %if.end10, label %if.then9

if.then9:                                         ; preds = %vaarg.end
  call void @abort() noreturn nounwind
  unreachable

if.end10:                                         ; preds = %vaarg.end
  %fits_in_gp14 = icmp ult i32 %gp_offset13, 41
  br i1 %fits_in_gp14, label %vaarg.in_reg15, label %vaarg.in_mem17

vaarg.in_reg15:                                   ; preds = %if.end10
  %7 = getelementptr inbounds [1 x %struct.__va_list_tag]* %va, i64 0, i64 0, i32 3
  %reg_save_area16 = load i8** %7, align 16
  %8 = sext i32 %gp_offset13 to i64
  %9 = getelementptr i8* %reg_save_area16, i64 %8
  %10 = add i32 %gp_offset13, 8
  store i32 %10, i32* %gp_offset_p, align 16
  br label %vaarg.end21

vaarg.in_mem17:                                   ; preds = %if.end10
  %overflow_arg_area_p18 = getelementptr inbounds [1 x %struct.__va_list_tag]* %va, i64 0, i64 0, i32 2
  %overflow_arg_area19 = load i8** %overflow_arg_area_p18, align 8
  %overflow_arg_area.next20 = getelementptr i8* %overflow_arg_area19, i64 8
  store i8* %overflow_arg_area.next20, i8** %overflow_arg_area_p18, align 8
  br label %vaarg.end21

vaarg.end21:                                      ; preds = %vaarg.in_mem17, %vaarg.in_reg15
  %gp_offset29 = phi i32 [ %10, %vaarg.in_reg15 ], [ %gp_offset13, %vaarg.in_mem17 ]
  %vaarg.addr22.in = phi i8* [ %9, %vaarg.in_reg15 ], [ %overflow_arg_area19, %vaarg.in_mem17 ]
  %vaarg.addr22 = bitcast i8* %vaarg.addr22.in to i32*
  %11 = load i32* %vaarg.addr22, align 4
  %cmp24 = icmp eq i32 %11, 3
  br i1 %cmp24, label %if.end26, label %if.then25

if.then25:                                        ; preds = %vaarg.end21
  call void @abort() noreturn nounwind
  unreachable

if.end26:                                         ; preds = %vaarg.end21
  %fits_in_gp30 = icmp ult i32 %gp_offset29, 41
  br i1 %fits_in_gp30, label %vaarg.in_reg31, label %vaarg.in_mem33

vaarg.in_reg31:                                   ; preds = %if.end26
  %12 = getelementptr inbounds [1 x %struct.__va_list_tag]* %va, i64 0, i64 0, i32 3
  %reg_save_area32 = load i8** %12, align 16
  %13 = sext i32 %gp_offset29 to i64
  %14 = getelementptr i8* %reg_save_area32, i64 %13
  %15 = add i32 %gp_offset29, 8
  store i32 %15, i32* %gp_offset_p, align 16
  br label %vaarg.end37

vaarg.in_mem33:                                   ; preds = %if.end26
  %overflow_arg_area_p34 = getelementptr inbounds [1 x %struct.__va_list_tag]* %va, i64 0, i64 0, i32 2
  %overflow_arg_area35 = load i8** %overflow_arg_area_p34, align 8
  %overflow_arg_area.next36 = getelementptr i8* %overflow_arg_area35, i64 8
  store i8* %overflow_arg_area.next36, i8** %overflow_arg_area_p34, align 8
  br label %vaarg.end37

vaarg.end37:                                      ; preds = %vaarg.in_mem33, %vaarg.in_reg31
  %vaarg.addr38.in = phi i8* [ %14, %vaarg.in_reg31 ], [ %overflow_arg_area35, %vaarg.in_mem33 ]
  %16 = bitcast i8* %vaarg.addr38.in to i64*
  %17 = load i64* %16, align 4
  %18 = icmp eq i64 %17, 18764712181759
  br i1 %18, label %if.end49, label %if.then48

if.then48:                                        ; preds = %vaarg.end37
  call void @abort() noreturn nounwind
  unreachable

if.end49:                                         ; preds = %vaarg.end37
  call void @llvm.va_end(i8* %arraydecay1)
  ret void
}

declare void @llvm.va_start(i8*) nounwind

declare void @abort() noreturn nounwind

declare void @llvm.va_end(i8*) nounwind

define i32 @main() noreturn nounwind uwtable {
entry:
  tail call void (i32, ...)* @f(i32 2, i64 93823560624810, i32 3, i64 18764712181759)
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn nounwind
