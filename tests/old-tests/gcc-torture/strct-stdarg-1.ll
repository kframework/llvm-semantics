; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/strct-stdarg-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.__va_list_tag = type { i32, i32, i8*, i8* }
%struct.tiny = type { i8, i8, i8, i8, i8 }

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
  %x44 = alloca i64, align 8
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
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp4, i8* %tmp5, i64 5, i32 1, i1 false)
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
  %g = getelementptr inbounds %struct.tiny* %x, i32 0, i32 4
  %tmp34 = load i8* %g, align 1
  %conv35 = sext i8 %tmp34 to i32
  %tmp36 = load i32* %i, align 4
  %add37 = add nsw i32 %tmp36, 50
  %cmp38 = icmp ne i32 %conv35, %add37
  br i1 %cmp38, label %if.then40, label %if.end41

if.then40:                                        ; preds = %if.end33
  call void @abort() noreturn nounwind
  unreachable

if.end41:                                         ; preds = %if.end33
  br label %for.inc

for.inc:                                          ; preds = %if.end41
  %tmp42 = load i32* %i, align 4
  %inc = add nsw i32 %tmp42, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %arraydecay45 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %gp_offset_p46 = getelementptr inbounds %struct.__va_list_tag* %arraydecay45, i32 0, i32 0
  %gp_offset47 = load i32* %gp_offset_p46
  %fits_in_gp48 = icmp ule i32 %gp_offset47, 40
  br i1 %fits_in_gp48, label %vaarg.in_reg49, label %vaarg.in_mem51

vaarg.in_reg49:                                   ; preds = %for.end
  %5 = getelementptr inbounds %struct.__va_list_tag* %arraydecay45, i32 0, i32 3
  %reg_save_area50 = load i8** %5
  %6 = getelementptr i8* %reg_save_area50, i32 %gp_offset47
  %7 = bitcast i8* %6 to i64*
  %8 = add i32 %gp_offset47, 8
  store i32 %8, i32* %gp_offset_p46
  br label %vaarg.end55

vaarg.in_mem51:                                   ; preds = %for.end
  %overflow_arg_area_p52 = getelementptr inbounds %struct.__va_list_tag* %arraydecay45, i32 0, i32 2
  %overflow_arg_area53 = load i8** %overflow_arg_area_p52
  %9 = bitcast i8* %overflow_arg_area53 to i64*
  %overflow_arg_area.next54 = getelementptr i8* %overflow_arg_area53, i32 8
  store i8* %overflow_arg_area.next54, i8** %overflow_arg_area_p52
  br label %vaarg.end55

vaarg.end55:                                      ; preds = %vaarg.in_mem51, %vaarg.in_reg49
  %vaarg.addr56 = phi i64* [ %7, %vaarg.in_reg49 ], [ %9, %vaarg.in_mem51 ]
  %10 = load i64* %vaarg.addr56
  store i64 %10, i64* %x44, align 8
  %tmp57 = load i64* %x44, align 8
  %cmp58 = icmp ne i64 %tmp57, 123
  br i1 %cmp58, label %if.then60, label %if.end61

if.then60:                                        ; preds = %vaarg.end55
  call void @abort() noreturn nounwind
  unreachable

if.end61:                                         ; preds = %vaarg.end55
  %arraydecay62 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %arraydecay6263 = bitcast %struct.__va_list_tag* %arraydecay62 to i8*
  call void @llvm.va_end(i8* %arraydecay6263)
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
  %tmp = alloca i40
  %tmp28 = alloca i40
  %tmp29 = alloca i40
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
  %g = getelementptr inbounds %struct.tiny* %arrayidx20, i32 0, i32 4
  store i8 50, i8* %g, align 1
  %arrayidx21 = getelementptr inbounds [3 x %struct.tiny]* %x, i32 0, i64 1
  %g22 = getelementptr inbounds %struct.tiny* %arrayidx21, i32 0, i32 4
  store i8 51, i8* %g22, align 1
  %arrayidx23 = getelementptr inbounds [3 x %struct.tiny]* %x, i32 0, i64 2
  %g24 = getelementptr inbounds %struct.tiny* %arrayidx23, i32 0, i32 4
  store i8 52, i8* %g24, align 1
  %arrayidx25 = getelementptr inbounds [3 x %struct.tiny]* %x, i32 0, i64 0
  %arrayidx26 = getelementptr inbounds [3 x %struct.tiny]* %x, i32 0, i64 1
  %arrayidx27 = getelementptr inbounds [3 x %struct.tiny]* %x, i32 0, i64 2
  %0 = bitcast i40* %tmp to %struct.tiny*
  %1 = load %struct.tiny* %arrayidx25
  store %struct.tiny %1, %struct.tiny* %0, align 1
  %2 = load i40* %tmp
  %3 = bitcast i40* %tmp28 to %struct.tiny*
  %4 = load %struct.tiny* %arrayidx26
  store %struct.tiny %4, %struct.tiny* %3, align 1
  %5 = load i40* %tmp28
  %6 = bitcast i40* %tmp29 to %struct.tiny*
  %7 = load %struct.tiny* %arrayidx27
  store %struct.tiny %7, %struct.tiny* %6, align 1
  %8 = load i40* %tmp29
  call void (i32, ...)* @f(i32 3, i40 %2, i40 %5, i40 %8, i64 123)
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %9 = load i32* %retval
  ret i32 %9
}

declare void @exit(i32) noreturn nounwind
