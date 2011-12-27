; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/931004-14.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.__va_list_tag = type { i32, i32, i8*, i8* }
%struct.tiny = type { i8, i8, i8, i8 }

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

define void @f(i32 %n, ...) nounwind uwtable {
entry:
  %n.addr = alloca i32, align 4
  %x = alloca %struct.tiny, align 1
  %i = alloca i32, align 4
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  %x36 = alloca i64, align 8
  store i32 %n, i32* %n.addr, align 4
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %arraydecay1 = bitcast %struct.__va_list_tag* %arraydecay to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp = load i32* %i, align 4
  %tmp2 = load i32* %n.addr, align 4
  %cmp = icmp slt i32 %tmp, %tmp2
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
  %2 = bitcast i8* %1 to %struct.tiny*
  %3 = add i32 %gp_offset, 8
  store i32 %3, i32* %gp_offset_p
  br label %vaarg.end

vaarg.in_mem:                                     ; preds = %for.body
  %overflow_arg_area_p = getelementptr inbounds %struct.__va_list_tag* %arraydecay3, i32 0, i32 2
  %overflow_arg_area = load i8** %overflow_arg_area_p
  %4 = bitcast i8* %overflow_arg_area to %struct.tiny*
  %overflow_arg_area.next = getelementptr i8* %overflow_arg_area, i32 8
  store i8* %overflow_arg_area.next, i8** %overflow_arg_area_p
  br label %vaarg.end

vaarg.end:                                        ; preds = %vaarg.in_mem, %vaarg.in_reg
  %vaarg.addr = phi %struct.tiny* [ %2, %vaarg.in_reg ], [ %4, %vaarg.in_mem ]
  %tmp4 = bitcast %struct.tiny* %x to i8*
  %tmp5 = bitcast %struct.tiny* %vaarg.addr to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp4, i8* %tmp5, i64 4, i32 1, i1 false)
  %c = getelementptr inbounds %struct.tiny* %x, i32 0, i32 0
  %tmp6 = load i8* %c, align 1
  %conv = sext i8 %tmp6 to i32
  %tmp7 = load i32* %i, align 4
  %add = add nsw i32 %tmp7, 10
  %cmp8 = icmp ne i32 %conv, %add
  br i1 %cmp8, label %if.then, label %if.end

if.then:                                          ; preds = %vaarg.end
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %vaarg.end
  %d = getelementptr inbounds %struct.tiny* %x, i32 0, i32 1
  %tmp10 = load i8* %d, align 1
  %conv11 = sext i8 %tmp10 to i32
  %tmp12 = load i32* %i, align 4
  %add13 = add nsw i32 %tmp12, 20
  %cmp14 = icmp ne i32 %conv11, %add13
  br i1 %cmp14, label %if.then16, label %if.end17

if.then16:                                        ; preds = %if.end
  call void @abort() noreturn nounwind
  unreachable

if.end17:                                         ; preds = %if.end
  %e = getelementptr inbounds %struct.tiny* %x, i32 0, i32 2
  %tmp18 = load i8* %e, align 1
  %conv19 = sext i8 %tmp18 to i32
  %tmp20 = load i32* %i, align 4
  %add21 = add nsw i32 %tmp20, 30
  %cmp22 = icmp ne i32 %conv19, %add21
  br i1 %cmp22, label %if.then24, label %if.end25

if.then24:                                        ; preds = %if.end17
  call void @abort() noreturn nounwind
  unreachable

if.end25:                                         ; preds = %if.end17
  %f = getelementptr inbounds %struct.tiny* %x, i32 0, i32 3
  %tmp26 = load i8* %f, align 1
  %conv27 = sext i8 %tmp26 to i32
  %tmp28 = load i32* %i, align 4
  %add29 = add nsw i32 %tmp28, 40
  %cmp30 = icmp ne i32 %conv27, %add29
  br i1 %cmp30, label %if.then32, label %if.end33

if.then32:                                        ; preds = %if.end25
  call void @abort() noreturn nounwind
  unreachable

if.end33:                                         ; preds = %if.end25
  br label %for.inc

for.inc:                                          ; preds = %if.end33
  %tmp34 = load i32* %i, align 4
  %inc = add nsw i32 %tmp34, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %arraydecay37 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %gp_offset_p38 = getelementptr inbounds %struct.__va_list_tag* %arraydecay37, i32 0, i32 0
  %gp_offset39 = load i32* %gp_offset_p38
  %fits_in_gp40 = icmp ule i32 %gp_offset39, 40
  br i1 %fits_in_gp40, label %vaarg.in_reg41, label %vaarg.in_mem43

vaarg.in_reg41:                                   ; preds = %for.end
  %5 = getelementptr inbounds %struct.__va_list_tag* %arraydecay37, i32 0, i32 3
  %reg_save_area42 = load i8** %5
  %6 = getelementptr i8* %reg_save_area42, i32 %gp_offset39
  %7 = bitcast i8* %6 to i64*
  %8 = add i32 %gp_offset39, 8
  store i32 %8, i32* %gp_offset_p38
  br label %vaarg.end47

vaarg.in_mem43:                                   ; preds = %for.end
  %overflow_arg_area_p44 = getelementptr inbounds %struct.__va_list_tag* %arraydecay37, i32 0, i32 2
  %overflow_arg_area45 = load i8** %overflow_arg_area_p44
  %9 = bitcast i8* %overflow_arg_area45 to i64*
  %overflow_arg_area.next46 = getelementptr i8* %overflow_arg_area45, i32 8
  store i8* %overflow_arg_area.next46, i8** %overflow_arg_area_p44
  br label %vaarg.end47

vaarg.end47:                                      ; preds = %vaarg.in_mem43, %vaarg.in_reg41
  %vaarg.addr48 = phi i64* [ %7, %vaarg.in_reg41 ], [ %9, %vaarg.in_mem43 ]
  %10 = load i64* %vaarg.addr48
  store i64 %10, i64* %x36, align 8
  %tmp49 = load i64* %x36, align 8
  %cmp50 = icmp ne i64 %tmp49, 123
  br i1 %cmp50, label %if.then52, label %if.end53

if.then52:                                        ; preds = %vaarg.end47
  call void @abort() noreturn nounwind
  unreachable

if.end53:                                         ; preds = %vaarg.end47
  %arraydecay54 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %arraydecay5455 = bitcast %struct.__va_list_tag* %arraydecay54 to i8*
  call void @llvm.va_end(i8* %arraydecay5455)
  ret void
}

declare void @llvm.va_start(i8*) nounwind

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

declare void @abort() noreturn nounwind

declare void @llvm.va_end(i8*) nounwind

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %x = alloca [3 x %struct.tiny], align 1
  store i32 0, i32* %retval
  %arrayidx = getelementptr inbounds [3 x %struct.tiny]* %x, i32 0, i64 0
  %c = getelementptr inbounds %struct.tiny* %arrayidx, i32 0, i32 0
  store i8 10, i8* %c, align 1
  %arrayidx1 = getelementptr inbounds [3 x %struct.tiny]* %x, i32 0, i64 1
  %c2 = getelementptr inbounds %struct.tiny* %arrayidx1, i32 0, i32 0
  store i8 11, i8* %c2, align 1
  %arrayidx3 = getelementptr inbounds [3 x %struct.tiny]* %x, i32 0, i64 2
  %c4 = getelementptr inbounds %struct.tiny* %arrayidx3, i32 0, i32 0
  store i8 12, i8* %c4, align 1
  %arrayidx5 = getelementptr inbounds [3 x %struct.tiny]* %x, i32 0, i64 0
  %d = getelementptr inbounds %struct.tiny* %arrayidx5, i32 0, i32 1
  store i8 20, i8* %d, align 1
  %arrayidx6 = getelementptr inbounds [3 x %struct.tiny]* %x, i32 0, i64 1
  %d7 = getelementptr inbounds %struct.tiny* %arrayidx6, i32 0, i32 1
  store i8 21, i8* %d7, align 1
  %arrayidx8 = getelementptr inbounds [3 x %struct.tiny]* %x, i32 0, i64 2
  %d9 = getelementptr inbounds %struct.tiny* %arrayidx8, i32 0, i32 1
  store i8 22, i8* %d9, align 1
  %arrayidx10 = getelementptr inbounds [3 x %struct.tiny]* %x, i32 0, i64 0
  %e = getelementptr inbounds %struct.tiny* %arrayidx10, i32 0, i32 2
  store i8 30, i8* %e, align 1
  %arrayidx11 = getelementptr inbounds [3 x %struct.tiny]* %x, i32 0, i64 1
  %e12 = getelementptr inbounds %struct.tiny* %arrayidx11, i32 0, i32 2
  store i8 31, i8* %e12, align 1
  %arrayidx13 = getelementptr inbounds [3 x %struct.tiny]* %x, i32 0, i64 2
  %e14 = getelementptr inbounds %struct.tiny* %arrayidx13, i32 0, i32 2
  store i8 32, i8* %e14, align 1
  %arrayidx15 = getelementptr inbounds [3 x %struct.tiny]* %x, i32 0, i64 0
  %f = getelementptr inbounds %struct.tiny* %arrayidx15, i32 0, i32 3
  store i8 40, i8* %f, align 1
  %arrayidx16 = getelementptr inbounds [3 x %struct.tiny]* %x, i32 0, i64 1
  %f17 = getelementptr inbounds %struct.tiny* %arrayidx16, i32 0, i32 3
  store i8 41, i8* %f17, align 1
  %arrayidx18 = getelementptr inbounds [3 x %struct.tiny]* %x, i32 0, i64 2
  %f19 = getelementptr inbounds %struct.tiny* %arrayidx18, i32 0, i32 3
  store i8 42, i8* %f19, align 1
  %arrayidx20 = getelementptr inbounds [3 x %struct.tiny]* %x, i32 0, i64 0
  %arrayidx21 = getelementptr inbounds [3 x %struct.tiny]* %x, i32 0, i64 1
  %arrayidx22 = getelementptr inbounds [3 x %struct.tiny]* %x, i32 0, i64 2
  %0 = bitcast %struct.tiny* %arrayidx20 to i32*
  %1 = load i32* %0, align 1
  %2 = bitcast %struct.tiny* %arrayidx21 to i32*
  %3 = load i32* %2, align 1
  %4 = bitcast %struct.tiny* %arrayidx22 to i32*
  %5 = load i32* %4, align 1
  call void (i32, ...)* @f(i32 3, i32 %1, i32 %3, i32 %5, i64 123)
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %6 = load i32* %retval
  ret i32 %6
}

declare void @exit(i32) noreturn nounwind
