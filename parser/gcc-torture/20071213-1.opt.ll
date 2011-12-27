; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20071213-1.ll'
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

define void @h(i32 %x, %struct.__va_list_tag* %ap) nounwind uwtable {
entry:
  switch i32 %x, label %sw.default [
    i32 1, label %sw.bb
    i32 5, label %sw.bb15
  ]

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
  %gp_offset4 = phi i32 [ %3, %vaarg.in_reg ], [ %gp_offset, %vaarg.in_mem ]
  %vaarg.addr.in = phi i8* [ %2, %vaarg.in_reg ], [ %overflow_arg_area, %vaarg.in_mem ]
  %vaarg.addr = bitcast i8* %vaarg.addr.in to i32*
  %4 = load i32* %vaarg.addr, align 4
  %cmp = icmp eq i32 %4, 3
  br i1 %cmp, label %lor.lhs.false, label %if.then

lor.lhs.false:                                    ; preds = %vaarg.end
  %fits_in_gp5 = icmp ult i32 %gp_offset4, 41
  br i1 %fits_in_gp5, label %vaarg.in_reg6, label %vaarg.in_mem8

vaarg.in_reg6:                                    ; preds = %lor.lhs.false
  %5 = getelementptr inbounds %struct.__va_list_tag* %ap, i64 0, i32 3
  %reg_save_area7 = load i8** %5, align 8
  %6 = sext i32 %gp_offset4 to i64
  %7 = getelementptr i8* %reg_save_area7, i64 %6
  %8 = add i32 %gp_offset4, 8
  store i32 %8, i32* %gp_offset_p, align 4
  br label %vaarg.end12

vaarg.in_mem8:                                    ; preds = %lor.lhs.false
  %overflow_arg_area_p9 = getelementptr inbounds %struct.__va_list_tag* %ap, i64 0, i32 2
  %overflow_arg_area10 = load i8** %overflow_arg_area_p9, align 8
  %overflow_arg_area.next11 = getelementptr i8* %overflow_arg_area10, i64 8
  store i8* %overflow_arg_area.next11, i8** %overflow_arg_area_p9, align 8
  br label %vaarg.end12

vaarg.end12:                                      ; preds = %vaarg.in_mem8, %vaarg.in_reg6
  %vaarg.addr13.in = phi i8* [ %7, %vaarg.in_reg6 ], [ %overflow_arg_area10, %vaarg.in_mem8 ]
  %vaarg.addr13 = bitcast i8* %vaarg.addr13.in to i32*
  %9 = load i32* %vaarg.addr13, align 4
  %cmp14 = icmp eq i32 %9, 4
  br i1 %cmp14, label %return, label %if.then

if.then:                                          ; preds = %vaarg.end12, %vaarg.end
  tail call void @abort() noreturn nounwind
  unreachable

sw.bb15:                                          ; preds = %entry
  %gp_offset_p17 = getelementptr inbounds %struct.__va_list_tag* %ap, i64 0, i32 0
  %gp_offset18 = load i32* %gp_offset_p17, align 4
  %fits_in_gp19 = icmp ult i32 %gp_offset18, 41
  br i1 %fits_in_gp19, label %vaarg.in_reg20, label %vaarg.in_mem22

vaarg.in_reg20:                                   ; preds = %sw.bb15
  %10 = getelementptr inbounds %struct.__va_list_tag* %ap, i64 0, i32 3
  %reg_save_area21 = load i8** %10, align 8
  %11 = sext i32 %gp_offset18 to i64
  %12 = getelementptr i8* %reg_save_area21, i64 %11
  %13 = add i32 %gp_offset18, 8
  store i32 %13, i32* %gp_offset_p17, align 4
  br label %vaarg.end26

vaarg.in_mem22:                                   ; preds = %sw.bb15
  %overflow_arg_area_p23 = getelementptr inbounds %struct.__va_list_tag* %ap, i64 0, i32 2
  %overflow_arg_area24 = load i8** %overflow_arg_area_p23, align 8
  %overflow_arg_area.next25 = getelementptr i8* %overflow_arg_area24, i64 8
  store i8* %overflow_arg_area.next25, i8** %overflow_arg_area_p23, align 8
  br label %vaarg.end26

vaarg.end26:                                      ; preds = %vaarg.in_mem22, %vaarg.in_reg20
  %gp_offset32 = phi i32 [ %13, %vaarg.in_reg20 ], [ %gp_offset18, %vaarg.in_mem22 ]
  %vaarg.addr27.in = phi i8* [ %12, %vaarg.in_reg20 ], [ %overflow_arg_area24, %vaarg.in_mem22 ]
  %vaarg.addr27 = bitcast i8* %vaarg.addr27.in to i32*
  %14 = load i32* %vaarg.addr27, align 4
  %cmp28 = icmp eq i32 %14, 9
  br i1 %cmp28, label %lor.lhs.false29, label %if.then43

lor.lhs.false29:                                  ; preds = %vaarg.end26
  %fits_in_gp33 = icmp ult i32 %gp_offset32, 41
  br i1 %fits_in_gp33, label %vaarg.in_reg34, label %vaarg.in_mem36

vaarg.in_reg34:                                   ; preds = %lor.lhs.false29
  %15 = getelementptr inbounds %struct.__va_list_tag* %ap, i64 0, i32 3
  %reg_save_area35 = load i8** %15, align 8
  %16 = sext i32 %gp_offset32 to i64
  %17 = getelementptr i8* %reg_save_area35, i64 %16
  %18 = add i32 %gp_offset32, 8
  store i32 %18, i32* %gp_offset_p17, align 4
  br label %vaarg.end40

vaarg.in_mem36:                                   ; preds = %lor.lhs.false29
  %overflow_arg_area_p37 = getelementptr inbounds %struct.__va_list_tag* %ap, i64 0, i32 2
  %overflow_arg_area38 = load i8** %overflow_arg_area_p37, align 8
  %overflow_arg_area.next39 = getelementptr i8* %overflow_arg_area38, i64 8
  store i8* %overflow_arg_area.next39, i8** %overflow_arg_area_p37, align 8
  br label %vaarg.end40

vaarg.end40:                                      ; preds = %vaarg.in_mem36, %vaarg.in_reg34
  %vaarg.addr41.in = phi i8* [ %17, %vaarg.in_reg34 ], [ %overflow_arg_area38, %vaarg.in_mem36 ]
  %vaarg.addr41 = bitcast i8* %vaarg.addr41.in to i32*
  %19 = load i32* %vaarg.addr41, align 4
  %cmp42 = icmp eq i32 %19, 10
  br i1 %cmp42, label %return, label %if.then43

if.then43:                                        ; preds = %vaarg.end40, %vaarg.end26
  tail call void @abort() noreturn nounwind
  unreachable

sw.default:                                       ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

return:                                           ; preds = %vaarg.end40, %vaarg.end12
  ret void
}

declare void @abort() noreturn nounwind

define void @f1(i32 %i, i64 %j, ...) nounwind uwtable {
entry:
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  %arraydecay1 = bitcast [1 x %struct.__va_list_tag]* %ap to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %arraydecay2 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0
  call void @h(i32 %i, %struct.__va_list_tag* %arraydecay2)
  %cmp = icmp eq i32 %i, 1
  %cmp5 = icmp eq i64 %j, 2
  %or.cond = and i1 %cmp, %cmp5
  br i1 %or.cond, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  call void @llvm.va_end(i8* %arraydecay1)
  ret void
}

declare void @llvm.va_start(i8*) nounwind

declare void @llvm.va_end(i8*) nounwind

define void @f2(i32 %i, i32 %j, i32 %k, i64 %l, ...) nounwind uwtable {
entry:
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  %arraydecay1 = bitcast [1 x %struct.__va_list_tag]* %ap to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %arraydecay2 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0
  call void @h(i32 %i, %struct.__va_list_tag* %arraydecay2)
  %cmp = icmp eq i32 %i, 5
  %cmp5 = icmp eq i32 %j, 6
  %or.cond = and i1 %cmp, %cmp5
  %cmp8 = icmp eq i32 %k, 7
  %or.cond1 = and i1 %or.cond, %cmp8
  %cmp11 = icmp eq i64 %l, 8
  %or.cond2 = and i1 %or.cond1, %cmp11
  br i1 %or.cond2, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  call void @llvm.va_end(i8* %arraydecay1)
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  tail call void (i32, i64, ...)* @f1(i32 1, i64 2, i32 3, i32 4)
  tail call void (i32, i32, i32, i64, ...)* @f2(i32 5, i32 6, i32 7, i64 8, i32 9, i32 10)
  ret i32 0
}
