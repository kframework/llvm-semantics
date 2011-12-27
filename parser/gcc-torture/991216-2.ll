; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/991216-2.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.__va_list_tag = type { i32, i32, i8*, i8* }

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

define void @test(i32 %n, ...) nounwind uwtable {
entry:
  %n.addr = alloca i32, align 4
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  %i = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %arraydecay1 = bitcast %struct.__va_list_tag* %arraydecay to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  store i32 2, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp = load i32* %i, align 4
  %tmp2 = load i32* %n.addr, align 4
  %cmp = icmp sle i32 %tmp, %tmp2
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %arraydecay3 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %gp_offset_p = getelementptr inbounds %struct.__va_list_tag* %arraydecay3, i32 0, i32 0
  %gp_offset = load i32* %gp_offset_p
  %fits_in_gp = icmp ule i32 %gp_offset, 40
  br i1 %fits_in_gp, label %vaarg.in_reg, label %vaarg.in_mem

vaarg.in_reg:                                     ; preds = %for.body
  %0 = getelementptr inbounds %struct.__va_list_tag* %arraydecay3, i32 0, i32 3
  %reg_save_area = load i8** %0
  %1 = getelementptr i8* %reg_save_area, i32 %gp_offset
  %2 = bitcast i8* %1 to i32*
  %3 = add i32 %gp_offset, 8
  store i32 %3, i32* %gp_offset_p
  br label %vaarg.end

vaarg.in_mem:                                     ; preds = %for.body
  %overflow_arg_area_p = getelementptr inbounds %struct.__va_list_tag* %arraydecay3, i32 0, i32 2
  %overflow_arg_area = load i8** %overflow_arg_area_p
  %4 = bitcast i8* %overflow_arg_area to i32*
  %overflow_arg_area.next = getelementptr i8* %overflow_arg_area, i32 8
  store i8* %overflow_arg_area.next, i8** %overflow_arg_area_p
  br label %vaarg.end

vaarg.end:                                        ; preds = %vaarg.in_mem, %vaarg.in_reg
  %vaarg.addr = phi i32* [ %2, %vaarg.in_reg ], [ %4, %vaarg.in_mem ]
  %5 = load i32* %vaarg.addr
  %tmp4 = load i32* %i, align 4
  %cmp5 = icmp ne i32 %5, %tmp4
  br i1 %cmp5, label %if.then, label %if.end

if.then:                                          ; preds = %vaarg.end
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %vaarg.end
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %tmp6 = load i32* %i, align 4
  %inc = add nsw i32 %tmp6, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %arraydecay7 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %gp_offset_p8 = getelementptr inbounds %struct.__va_list_tag* %arraydecay7, i32 0, i32 0
  %gp_offset9 = load i32* %gp_offset_p8
  %fits_in_gp10 = icmp ule i32 %gp_offset9, 40
  br i1 %fits_in_gp10, label %vaarg.in_reg11, label %vaarg.in_mem13

vaarg.in_reg11:                                   ; preds = %for.end
  %6 = getelementptr inbounds %struct.__va_list_tag* %arraydecay7, i32 0, i32 3
  %reg_save_area12 = load i8** %6
  %7 = getelementptr i8* %reg_save_area12, i32 %gp_offset9
  %8 = bitcast i8* %7 to i64*
  %9 = add i32 %gp_offset9, 8
  store i32 %9, i32* %gp_offset_p8
  br label %vaarg.end17

vaarg.in_mem13:                                   ; preds = %for.end
  %overflow_arg_area_p14 = getelementptr inbounds %struct.__va_list_tag* %arraydecay7, i32 0, i32 2
  %overflow_arg_area15 = load i8** %overflow_arg_area_p14
  %10 = bitcast i8* %overflow_arg_area15 to i64*
  %overflow_arg_area.next16 = getelementptr i8* %overflow_arg_area15, i32 8
  store i8* %overflow_arg_area.next16, i8** %overflow_arg_area_p14
  br label %vaarg.end17

vaarg.end17:                                      ; preds = %vaarg.in_mem13, %vaarg.in_reg11
  %vaarg.addr18 = phi i64* [ %8, %vaarg.in_reg11 ], [ %10, %vaarg.in_mem13 ]
  %11 = load i64* %vaarg.addr18
  %cmp19 = icmp ne i64 %11, 81985529216486895
  br i1 %cmp19, label %if.then20, label %if.end21

if.then20:                                        ; preds = %vaarg.end17
  call void @abort() noreturn nounwind
  unreachable

if.end21:                                         ; preds = %vaarg.end17
  %arraydecay22 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %gp_offset_p23 = getelementptr inbounds %struct.__va_list_tag* %arraydecay22, i32 0, i32 0
  %gp_offset24 = load i32* %gp_offset_p23
  %fits_in_gp25 = icmp ule i32 %gp_offset24, 40
  br i1 %fits_in_gp25, label %vaarg.in_reg26, label %vaarg.in_mem28

vaarg.in_reg26:                                   ; preds = %if.end21
  %12 = getelementptr inbounds %struct.__va_list_tag* %arraydecay22, i32 0, i32 3
  %reg_save_area27 = load i8** %12
  %13 = getelementptr i8* %reg_save_area27, i32 %gp_offset24
  %14 = bitcast i8* %13 to i32*
  %15 = add i32 %gp_offset24, 8
  store i32 %15, i32* %gp_offset_p23
  br label %vaarg.end32

vaarg.in_mem28:                                   ; preds = %if.end21
  %overflow_arg_area_p29 = getelementptr inbounds %struct.__va_list_tag* %arraydecay22, i32 0, i32 2
  %overflow_arg_area30 = load i8** %overflow_arg_area_p29
  %16 = bitcast i8* %overflow_arg_area30 to i32*
  %overflow_arg_area.next31 = getelementptr i8* %overflow_arg_area30, i32 8
  store i8* %overflow_arg_area.next31, i8** %overflow_arg_area_p29
  br label %vaarg.end32

vaarg.end32:                                      ; preds = %vaarg.in_mem28, %vaarg.in_reg26
  %vaarg.addr33 = phi i32* [ %14, %vaarg.in_reg26 ], [ %16, %vaarg.in_mem28 ]
  %17 = load i32* %vaarg.addr33
  %cmp34 = icmp ne i32 %17, 85
  br i1 %cmp34, label %if.then35, label %if.end36

if.then35:                                        ; preds = %vaarg.end32
  call void @abort() noreturn nounwind
  unreachable

if.end36:                                         ; preds = %vaarg.end32
  %arraydecay37 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %arraydecay3738 = bitcast %struct.__va_list_tag* %arraydecay37 to i8*
  call void @llvm.va_end(i8* %arraydecay3738)
  ret void
}

declare void @llvm.va_start(i8*) nounwind

declare void @abort() noreturn nounwind

declare void @llvm.va_end(i8*) nounwind

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  call void (i32, ...)* @test(i32 1, i64 81985529216486895, i32 85)
  call void (i32, ...)* @test(i32 2, i32 2, i64 81985529216486895, i32 85)
  call void (i32, ...)* @test(i32 3, i32 2, i32 3, i64 81985529216486895, i32 85)
  call void (i32, ...)* @test(i32 4, i32 2, i32 3, i32 4, i64 81985529216486895, i32 85)
  call void (i32, ...)* @test(i32 5, i32 2, i32 3, i32 4, i32 5, i64 81985529216486895, i32 85)
  call void (i32, ...)* @test(i32 6, i32 2, i32 3, i32 4, i32 5, i32 6, i64 81985529216486895, i32 85)
  call void (i32, ...)* @test(i32 7, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i64 81985529216486895, i32 85)
  call void (i32, ...)* @test(i32 8, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i64 81985529216486895, i32 85)
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

declare void @exit(i32) noreturn nounwind
