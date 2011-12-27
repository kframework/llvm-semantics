; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20071213-1.c'
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

define void @h(i32 %x, %struct.__va_list_tag* %ap) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  %ap.addr = alloca %struct.__va_list_tag*, align 8
  store i32 %x, i32* %x.addr, align 4
  store %struct.__va_list_tag* %ap, %struct.__va_list_tag** %ap.addr, align 8
  %tmp = load i32* %x.addr, align 4
  switch i32 %tmp, label %sw.default [
    i32 1, label %sw.bb
    i32 5, label %sw.bb15
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
  %cmp = icmp ne i32 %5, 3
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %vaarg.end
  %tmp2 = load %struct.__va_list_tag** %ap.addr, align 8
  %gp_offset_p3 = getelementptr inbounds %struct.__va_list_tag* %tmp2, i32 0, i32 0
  %gp_offset4 = load i32* %gp_offset_p3
  %fits_in_gp5 = icmp ule i32 %gp_offset4, 40
  br i1 %fits_in_gp5, label %vaarg.in_reg6, label %vaarg.in_mem8

vaarg.in_reg6:                                    ; preds = %lor.lhs.false
  %6 = getelementptr inbounds %struct.__va_list_tag* %tmp2, i32 0, i32 3
  %reg_save_area7 = load i8** %6
  %7 = getelementptr i8* %reg_save_area7, i32 %gp_offset4
  %8 = bitcast i8* %7 to i32*
  %9 = add i32 %gp_offset4, 8
  store i32 %9, i32* %gp_offset_p3
  br label %vaarg.end12

vaarg.in_mem8:                                    ; preds = %lor.lhs.false
  %overflow_arg_area_p9 = getelementptr inbounds %struct.__va_list_tag* %tmp2, i32 0, i32 2
  %overflow_arg_area10 = load i8** %overflow_arg_area_p9
  %10 = bitcast i8* %overflow_arg_area10 to i32*
  %overflow_arg_area.next11 = getelementptr i8* %overflow_arg_area10, i32 8
  store i8* %overflow_arg_area.next11, i8** %overflow_arg_area_p9
  br label %vaarg.end12

vaarg.end12:                                      ; preds = %vaarg.in_mem8, %vaarg.in_reg6
  %vaarg.addr13 = phi i32* [ %8, %vaarg.in_reg6 ], [ %10, %vaarg.in_mem8 ]
  %11 = load i32* %vaarg.addr13
  %cmp14 = icmp ne i32 %11, 4
  br i1 %cmp14, label %if.then, label %if.end

if.then:                                          ; preds = %vaarg.end12, %vaarg.end
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %vaarg.end12
  br label %return

sw.bb15:                                          ; preds = %entry
  %tmp16 = load %struct.__va_list_tag** %ap.addr, align 8
  %gp_offset_p17 = getelementptr inbounds %struct.__va_list_tag* %tmp16, i32 0, i32 0
  %gp_offset18 = load i32* %gp_offset_p17
  %fits_in_gp19 = icmp ule i32 %gp_offset18, 40
  br i1 %fits_in_gp19, label %vaarg.in_reg20, label %vaarg.in_mem22

vaarg.in_reg20:                                   ; preds = %sw.bb15
  %12 = getelementptr inbounds %struct.__va_list_tag* %tmp16, i32 0, i32 3
  %reg_save_area21 = load i8** %12
  %13 = getelementptr i8* %reg_save_area21, i32 %gp_offset18
  %14 = bitcast i8* %13 to i32*
  %15 = add i32 %gp_offset18, 8
  store i32 %15, i32* %gp_offset_p17
  br label %vaarg.end26

vaarg.in_mem22:                                   ; preds = %sw.bb15
  %overflow_arg_area_p23 = getelementptr inbounds %struct.__va_list_tag* %tmp16, i32 0, i32 2
  %overflow_arg_area24 = load i8** %overflow_arg_area_p23
  %16 = bitcast i8* %overflow_arg_area24 to i32*
  %overflow_arg_area.next25 = getelementptr i8* %overflow_arg_area24, i32 8
  store i8* %overflow_arg_area.next25, i8** %overflow_arg_area_p23
  br label %vaarg.end26

vaarg.end26:                                      ; preds = %vaarg.in_mem22, %vaarg.in_reg20
  %vaarg.addr27 = phi i32* [ %14, %vaarg.in_reg20 ], [ %16, %vaarg.in_mem22 ]
  %17 = load i32* %vaarg.addr27
  %cmp28 = icmp ne i32 %17, 9
  br i1 %cmp28, label %if.then43, label %lor.lhs.false29

lor.lhs.false29:                                  ; preds = %vaarg.end26
  %tmp30 = load %struct.__va_list_tag** %ap.addr, align 8
  %gp_offset_p31 = getelementptr inbounds %struct.__va_list_tag* %tmp30, i32 0, i32 0
  %gp_offset32 = load i32* %gp_offset_p31
  %fits_in_gp33 = icmp ule i32 %gp_offset32, 40
  br i1 %fits_in_gp33, label %vaarg.in_reg34, label %vaarg.in_mem36

vaarg.in_reg34:                                   ; preds = %lor.lhs.false29
  %18 = getelementptr inbounds %struct.__va_list_tag* %tmp30, i32 0, i32 3
  %reg_save_area35 = load i8** %18
  %19 = getelementptr i8* %reg_save_area35, i32 %gp_offset32
  %20 = bitcast i8* %19 to i32*
  %21 = add i32 %gp_offset32, 8
  store i32 %21, i32* %gp_offset_p31
  br label %vaarg.end40

vaarg.in_mem36:                                   ; preds = %lor.lhs.false29
  %overflow_arg_area_p37 = getelementptr inbounds %struct.__va_list_tag* %tmp30, i32 0, i32 2
  %overflow_arg_area38 = load i8** %overflow_arg_area_p37
  %22 = bitcast i8* %overflow_arg_area38 to i32*
  %overflow_arg_area.next39 = getelementptr i8* %overflow_arg_area38, i32 8
  store i8* %overflow_arg_area.next39, i8** %overflow_arg_area_p37
  br label %vaarg.end40

vaarg.end40:                                      ; preds = %vaarg.in_mem36, %vaarg.in_reg34
  %vaarg.addr41 = phi i32* [ %20, %vaarg.in_reg34 ], [ %22, %vaarg.in_mem36 ]
  %23 = load i32* %vaarg.addr41
  %cmp42 = icmp ne i32 %23, 10
  br i1 %cmp42, label %if.then43, label %if.end44

if.then43:                                        ; preds = %vaarg.end40, %vaarg.end26
  call void @abort() noreturn nounwind
  unreachable

if.end44:                                         ; preds = %vaarg.end40
  br label %return

sw.default:                                       ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

return:                                           ; preds = %if.end44, %if.end
  ret void
}

declare void @abort() noreturn nounwind

define void @f1(i32 %i, i64 %j, ...) nounwind uwtable {
entry:
  %i.addr = alloca i32, align 4
  %j.addr = alloca i64, align 8
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  store i32 %i, i32* %i.addr, align 4
  store i64 %j, i64* %j.addr, align 8
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %arraydecay1 = bitcast %struct.__va_list_tag* %arraydecay to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %tmp = load i32* %i.addr, align 4
  %arraydecay2 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  call void @h(i32 %tmp, %struct.__va_list_tag* %arraydecay2)
  %tmp3 = load i32* %i.addr, align 4
  %cmp = icmp ne i32 %tmp3, 1
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %tmp4 = load i64* %j.addr, align 8
  %cmp5 = icmp ne i64 %tmp4, 2
  br i1 %cmp5, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %lor.lhs.false
  %arraydecay6 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %arraydecay67 = bitcast %struct.__va_list_tag* %arraydecay6 to i8*
  call void @llvm.va_end(i8* %arraydecay67)
  ret void
}

declare void @llvm.va_start(i8*) nounwind

declare void @llvm.va_end(i8*) nounwind

define void @f2(i32 %i, i32 %j, i32 %k, i64 %l, ...) nounwind uwtable {
entry:
  %i.addr = alloca i32, align 4
  %j.addr = alloca i32, align 4
  %k.addr = alloca i32, align 4
  %l.addr = alloca i64, align 8
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  store i32 %i, i32* %i.addr, align 4
  store i32 %j, i32* %j.addr, align 4
  store i32 %k, i32* %k.addr, align 4
  store i64 %l, i64* %l.addr, align 8
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %arraydecay1 = bitcast %struct.__va_list_tag* %arraydecay to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %tmp = load i32* %i.addr, align 4
  %arraydecay2 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  call void @h(i32 %tmp, %struct.__va_list_tag* %arraydecay2)
  %tmp3 = load i32* %i.addr, align 4
  %cmp = icmp ne i32 %tmp3, 5
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %tmp4 = load i32* %j.addr, align 4
  %cmp5 = icmp ne i32 %tmp4, 6
  br i1 %cmp5, label %if.then, label %lor.lhs.false6

lor.lhs.false6:                                   ; preds = %lor.lhs.false
  %tmp7 = load i32* %k.addr, align 4
  %cmp8 = icmp ne i32 %tmp7, 7
  br i1 %cmp8, label %if.then, label %lor.lhs.false9

lor.lhs.false9:                                   ; preds = %lor.lhs.false6
  %tmp10 = load i64* %l.addr, align 8
  %cmp11 = icmp ne i64 %tmp10, 8
  br i1 %cmp11, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false9, %lor.lhs.false6, %lor.lhs.false, %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %lor.lhs.false9
  %arraydecay12 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %arraydecay1213 = bitcast %struct.__va_list_tag* %arraydecay12 to i8*
  call void @llvm.va_end(i8* %arraydecay1213)
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  call void (i32, i64, ...)* @f1(i32 1, i64 2, i32 3, i32 4)
  call void (i32, i32, i32, i64, ...)* @f2(i32 5, i32 6, i32 7, i64 8, i32 9, i32 10)
  ret i32 0
}
