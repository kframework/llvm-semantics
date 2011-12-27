; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/991216-2.ll'
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

define void @test(i32 %n, ...) nounwind uwtable {
entry:
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  %arraydecay1 = bitcast [1 x %struct.__va_list_tag]* %ap to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %gp_offset_p8 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 0
  %0 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 3
  %overflow_arg_area_p = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 2
  %gp_offset9.pre = load i32* %gp_offset_p8, align 16
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %gp_offset9 = phi i32 [ %gp_offset96, %for.inc ], [ %gp_offset9.pre, %entry ]
  %indvar = phi i32 [ %indvar.next, %for.inc ], [ 0, %entry ]
  %storemerge = add i32 %indvar, 2
  %cmp = icmp sgt i32 %storemerge, %n
  %fits_in_gp10 = icmp ult i32 %gp_offset9, 41
  br i1 %cmp, label %for.end, label %for.body

for.body:                                         ; preds = %for.cond
  br i1 %fits_in_gp10, label %vaarg.in_reg, label %vaarg.in_mem

vaarg.in_reg:                                     ; preds = %for.body
  %reg_save_area = load i8** %0, align 16
  %1 = sext i32 %gp_offset9 to i64
  %2 = getelementptr i8* %reg_save_area, i64 %1
  %3 = add i32 %gp_offset9, 8
  store i32 %3, i32* %gp_offset_p8, align 16
  br label %vaarg.end

vaarg.in_mem:                                     ; preds = %for.body
  %overflow_arg_area = load i8** %overflow_arg_area_p, align 8
  %overflow_arg_area.next = getelementptr i8* %overflow_arg_area, i64 8
  store i8* %overflow_arg_area.next, i8** %overflow_arg_area_p, align 8
  br label %vaarg.end

vaarg.end:                                        ; preds = %vaarg.in_mem, %vaarg.in_reg
  %gp_offset96 = phi i32 [ %3, %vaarg.in_reg ], [ %gp_offset9, %vaarg.in_mem ]
  %vaarg.addr.in = phi i8* [ %2, %vaarg.in_reg ], [ %overflow_arg_area, %vaarg.in_mem ]
  %vaarg.addr = bitcast i8* %vaarg.addr.in to i32*
  %4 = load i32* %vaarg.addr, align 4
  %cmp5 = icmp eq i32 %4, %storemerge
  br i1 %cmp5, label %for.inc, label %if.then

if.then:                                          ; preds = %vaarg.end
  call void @abort() noreturn nounwind
  unreachable

for.inc:                                          ; preds = %vaarg.end
  %indvar.next = add i32 %indvar, 1
  br label %for.cond

for.end:                                          ; preds = %for.cond
  br i1 %fits_in_gp10, label %vaarg.in_reg11, label %vaarg.in_mem13

vaarg.in_reg11:                                   ; preds = %for.end
  %reg_save_area12 = load i8** %0, align 16
  %5 = sext i32 %gp_offset9 to i64
  %6 = getelementptr i8* %reg_save_area12, i64 %5
  %7 = add i32 %gp_offset9, 8
  store i32 %7, i32* %gp_offset_p8, align 16
  br label %vaarg.end17

vaarg.in_mem13:                                   ; preds = %for.end
  %overflow_arg_area15 = load i8** %overflow_arg_area_p, align 8
  %overflow_arg_area.next16 = getelementptr i8* %overflow_arg_area15, i64 8
  store i8* %overflow_arg_area.next16, i8** %overflow_arg_area_p, align 8
  br label %vaarg.end17

vaarg.end17:                                      ; preds = %vaarg.in_mem13, %vaarg.in_reg11
  %gp_offset24 = phi i32 [ %7, %vaarg.in_reg11 ], [ %gp_offset9, %vaarg.in_mem13 ]
  %vaarg.addr18.in = phi i8* [ %6, %vaarg.in_reg11 ], [ %overflow_arg_area15, %vaarg.in_mem13 ]
  %vaarg.addr18 = bitcast i8* %vaarg.addr18.in to i64*
  %8 = load i64* %vaarg.addr18, align 8
  %cmp19 = icmp eq i64 %8, 81985529216486895
  br i1 %cmp19, label %if.end21, label %if.then20

if.then20:                                        ; preds = %vaarg.end17
  call void @abort() noreturn nounwind
  unreachable

if.end21:                                         ; preds = %vaarg.end17
  %fits_in_gp25 = icmp ult i32 %gp_offset24, 41
  br i1 %fits_in_gp25, label %vaarg.in_reg26, label %vaarg.in_mem28

vaarg.in_reg26:                                   ; preds = %if.end21
  %reg_save_area27 = load i8** %0, align 16
  %9 = sext i32 %gp_offset24 to i64
  %10 = getelementptr i8* %reg_save_area27, i64 %9
  %11 = add i32 %gp_offset24, 8
  store i32 %11, i32* %gp_offset_p8, align 16
  br label %vaarg.end32

vaarg.in_mem28:                                   ; preds = %if.end21
  %overflow_arg_area30 = load i8** %overflow_arg_area_p, align 8
  %overflow_arg_area.next31 = getelementptr i8* %overflow_arg_area30, i64 8
  store i8* %overflow_arg_area.next31, i8** %overflow_arg_area_p, align 8
  br label %vaarg.end32

vaarg.end32:                                      ; preds = %vaarg.in_mem28, %vaarg.in_reg26
  %vaarg.addr33.in = phi i8* [ %10, %vaarg.in_reg26 ], [ %overflow_arg_area30, %vaarg.in_mem28 ]
  %vaarg.addr33 = bitcast i8* %vaarg.addr33.in to i32*
  %12 = load i32* %vaarg.addr33, align 4
  %cmp34 = icmp eq i32 %12, 85
  br i1 %cmp34, label %if.end36, label %if.then35

if.then35:                                        ; preds = %vaarg.end32
  call void @abort() noreturn nounwind
  unreachable

if.end36:                                         ; preds = %vaarg.end32
  call void @llvm.va_end(i8* %arraydecay1)
  ret void
}

declare void @llvm.va_start(i8*) nounwind

declare void @abort() noreturn nounwind

declare void @llvm.va_end(i8*) nounwind

define i32 @main() noreturn nounwind uwtable {
entry:
  tail call void (i32, ...)* @test(i32 1, i64 81985529216486895, i32 85)
  tail call void (i32, ...)* @test(i32 2, i32 2, i64 81985529216486895, i32 85)
  tail call void (i32, ...)* @test(i32 3, i32 2, i32 3, i64 81985529216486895, i32 85)
  tail call void (i32, ...)* @test(i32 4, i32 2, i32 3, i32 4, i64 81985529216486895, i32 85)
  tail call void (i32, ...)* @test(i32 5, i32 2, i32 3, i32 4, i32 5, i64 81985529216486895, i32 85)
  tail call void (i32, ...)* @test(i32 6, i32 2, i32 3, i32 4, i32 5, i32 6, i64 81985529216486895, i32 85)
  tail call void (i32, ...)* @test(i32 7, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i64 81985529216486895, i32 85)
  tail call void (i32, ...)* @test(i32 8, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i64 81985529216486895, i32 85)
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn nounwind
