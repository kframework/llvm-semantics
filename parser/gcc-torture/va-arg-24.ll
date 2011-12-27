; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/va-arg-24.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.__va_list_tag = type { i32, i32, i8*, i8* }

@errors = internal global i32 0, align 4
@.str = private unnamed_addr constant [9 x i8] c"varargs9\00", align 1
@.str1 = private unnamed_addr constant [29 x i8] c" %s: n[%d] = %d expected %d\0A\00", align 1
@.str2 = private unnamed_addr constant [9 x i8] c"varargs8\00", align 1
@.str3 = private unnamed_addr constant [9 x i8] c"varargs7\00", align 1
@.str4 = private unnamed_addr constant [9 x i8] c"varargs6\00", align 1
@.str5 = private unnamed_addr constant [9 x i8] c"varargs5\00", align 1
@.str6 = private unnamed_addr constant [9 x i8] c"varargs4\00", align 1
@.str7 = private unnamed_addr constant [9 x i8] c"varargs3\00", align 1
@.str8 = private unnamed_addr constant [9 x i8] c"varargs2\00", align 1
@.str9 = private unnamed_addr constant [9 x i8] c"varargs1\00", align 1
@.str10 = private unnamed_addr constant [9 x i8] c"varargs0\00", align 1

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

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  call void (i32, ...)* @varargs0(i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10)
  call void (i32, i32, ...)* @varargs1(i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10)
  call void (i32, i32, i32, ...)* @varargs2(i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10)
  call void (i32, i32, i32, i32, ...)* @varargs3(i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10)
  call void (i32, i32, i32, i32, i32, ...)* @varargs4(i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10)
  call void (i32, i32, i32, i32, i32, i32, ...)* @varargs5(i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10)
  call void (i32, i32, i32, i32, i32, i32, i32, ...)* @varargs6(i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10)
  call void (i32, i32, i32, i32, i32, i32, i32, i32, ...)* @varargs7(i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10)
  call void (i32, i32, i32, i32, i32, i32, i32, i32, i32, ...)* @varargs8(i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10)
  call void (i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, ...)* @varargs9(i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10)
  %tmp = load i32* @errors, align 4
  %tobool = icmp ne i32 %tmp, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

define internal void @varargs0(i32 %q0, ...) nounwind uwtable {
entry:
  %q0.addr = alloca i32, align 4
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  %n = alloca [11 x i32], align 16
  %i = alloca i32, align 4
  store i32 %q0, i32* %q0.addr, align 4
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %arraydecay1 = bitcast %struct.__va_list_tag* %arraydecay to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %tmp = load i32* %q0.addr, align 4
  %arrayidx = getelementptr inbounds [11 x i32]* %n, i32 0, i64 0
  store i32 %tmp, i32* %arrayidx, align 4
  store i32 1, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp2 = load i32* %i, align 4
  %cmp = icmp sle i32 %tmp2, 10
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
  %idxprom = sext i32 %tmp4 to i64
  %arrayidx5 = getelementptr inbounds [11 x i32]* %n, i32 0, i64 %idxprom
  store i32 %5, i32* %arrayidx5, align 4
  br label %for.inc

for.inc:                                          ; preds = %vaarg.end
  %tmp6 = load i32* %i, align 4
  %inc = add nsw i32 %tmp6, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %arraydecay7 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %arraydecay78 = bitcast %struct.__va_list_tag* %arraydecay7 to i8*
  call void @llvm.va_end(i8* %arraydecay78)
  %arraydecay9 = getelementptr inbounds [11 x i32]* %n, i32 0, i32 0
  call void @verify(i8* getelementptr inbounds ([9 x i8]* @.str10, i32 0, i32 0), i32* %arraydecay9)
  ret void
}

define internal void @varargs1(i32 %q0, i32 %q1, ...) nounwind uwtable {
entry:
  %q0.addr = alloca i32, align 4
  %q1.addr = alloca i32, align 4
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  %n = alloca [11 x i32], align 16
  %i = alloca i32, align 4
  store i32 %q0, i32* %q0.addr, align 4
  store i32 %q1, i32* %q1.addr, align 4
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %arraydecay1 = bitcast %struct.__va_list_tag* %arraydecay to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %tmp = load i32* %q0.addr, align 4
  %arrayidx = getelementptr inbounds [11 x i32]* %n, i32 0, i64 0
  store i32 %tmp, i32* %arrayidx, align 4
  %tmp2 = load i32* %q1.addr, align 4
  %arrayidx3 = getelementptr inbounds [11 x i32]* %n, i32 0, i64 1
  store i32 %tmp2, i32* %arrayidx3, align 4
  store i32 2, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp4 = load i32* %i, align 4
  %cmp = icmp sle i32 %tmp4, 10
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %arraydecay5 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %gp_offset_p = getelementptr inbounds %struct.__va_list_tag* %arraydecay5, i32 0, i32 0
  %gp_offset = load i32* %gp_offset_p
  %fits_in_gp = icmp ule i32 %gp_offset, 40
  br i1 %fits_in_gp, label %vaarg.in_reg, label %vaarg.in_mem

vaarg.in_reg:                                     ; preds = %for.body
  %0 = getelementptr inbounds %struct.__va_list_tag* %arraydecay5, i32 0, i32 3
  %reg_save_area = load i8** %0
  %1 = getelementptr i8* %reg_save_area, i32 %gp_offset
  %2 = bitcast i8* %1 to i32*
  %3 = add i32 %gp_offset, 8
  store i32 %3, i32* %gp_offset_p
  br label %vaarg.end

vaarg.in_mem:                                     ; preds = %for.body
  %overflow_arg_area_p = getelementptr inbounds %struct.__va_list_tag* %arraydecay5, i32 0, i32 2
  %overflow_arg_area = load i8** %overflow_arg_area_p
  %4 = bitcast i8* %overflow_arg_area to i32*
  %overflow_arg_area.next = getelementptr i8* %overflow_arg_area, i32 8
  store i8* %overflow_arg_area.next, i8** %overflow_arg_area_p
  br label %vaarg.end

vaarg.end:                                        ; preds = %vaarg.in_mem, %vaarg.in_reg
  %vaarg.addr = phi i32* [ %2, %vaarg.in_reg ], [ %4, %vaarg.in_mem ]
  %5 = load i32* %vaarg.addr
  %tmp6 = load i32* %i, align 4
  %idxprom = sext i32 %tmp6 to i64
  %arrayidx7 = getelementptr inbounds [11 x i32]* %n, i32 0, i64 %idxprom
  store i32 %5, i32* %arrayidx7, align 4
  br label %for.inc

for.inc:                                          ; preds = %vaarg.end
  %tmp8 = load i32* %i, align 4
  %inc = add nsw i32 %tmp8, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %arraydecay9 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %arraydecay910 = bitcast %struct.__va_list_tag* %arraydecay9 to i8*
  call void @llvm.va_end(i8* %arraydecay910)
  %arraydecay11 = getelementptr inbounds [11 x i32]* %n, i32 0, i32 0
  call void @verify(i8* getelementptr inbounds ([9 x i8]* @.str9, i32 0, i32 0), i32* %arraydecay11)
  ret void
}

define internal void @varargs2(i32 %q0, i32 %q1, i32 %q2, ...) nounwind uwtable {
entry:
  %q0.addr = alloca i32, align 4
  %q1.addr = alloca i32, align 4
  %q2.addr = alloca i32, align 4
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  %n = alloca [11 x i32], align 16
  %i = alloca i32, align 4
  store i32 %q0, i32* %q0.addr, align 4
  store i32 %q1, i32* %q1.addr, align 4
  store i32 %q2, i32* %q2.addr, align 4
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %arraydecay1 = bitcast %struct.__va_list_tag* %arraydecay to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %tmp = load i32* %q0.addr, align 4
  %arrayidx = getelementptr inbounds [11 x i32]* %n, i32 0, i64 0
  store i32 %tmp, i32* %arrayidx, align 4
  %tmp2 = load i32* %q1.addr, align 4
  %arrayidx3 = getelementptr inbounds [11 x i32]* %n, i32 0, i64 1
  store i32 %tmp2, i32* %arrayidx3, align 4
  %tmp4 = load i32* %q2.addr, align 4
  %arrayidx5 = getelementptr inbounds [11 x i32]* %n, i32 0, i64 2
  store i32 %tmp4, i32* %arrayidx5, align 4
  store i32 3, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp6 = load i32* %i, align 4
  %cmp = icmp sle i32 %tmp6, 10
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %arraydecay7 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %gp_offset_p = getelementptr inbounds %struct.__va_list_tag* %arraydecay7, i32 0, i32 0
  %gp_offset = load i32* %gp_offset_p
  %fits_in_gp = icmp ule i32 %gp_offset, 40
  br i1 %fits_in_gp, label %vaarg.in_reg, label %vaarg.in_mem

vaarg.in_reg:                                     ; preds = %for.body
  %0 = getelementptr inbounds %struct.__va_list_tag* %arraydecay7, i32 0, i32 3
  %reg_save_area = load i8** %0
  %1 = getelementptr i8* %reg_save_area, i32 %gp_offset
  %2 = bitcast i8* %1 to i32*
  %3 = add i32 %gp_offset, 8
  store i32 %3, i32* %gp_offset_p
  br label %vaarg.end

vaarg.in_mem:                                     ; preds = %for.body
  %overflow_arg_area_p = getelementptr inbounds %struct.__va_list_tag* %arraydecay7, i32 0, i32 2
  %overflow_arg_area = load i8** %overflow_arg_area_p
  %4 = bitcast i8* %overflow_arg_area to i32*
  %overflow_arg_area.next = getelementptr i8* %overflow_arg_area, i32 8
  store i8* %overflow_arg_area.next, i8** %overflow_arg_area_p
  br label %vaarg.end

vaarg.end:                                        ; preds = %vaarg.in_mem, %vaarg.in_reg
  %vaarg.addr = phi i32* [ %2, %vaarg.in_reg ], [ %4, %vaarg.in_mem ]
  %5 = load i32* %vaarg.addr
  %tmp8 = load i32* %i, align 4
  %idxprom = sext i32 %tmp8 to i64
  %arrayidx9 = getelementptr inbounds [11 x i32]* %n, i32 0, i64 %idxprom
  store i32 %5, i32* %arrayidx9, align 4
  br label %for.inc

for.inc:                                          ; preds = %vaarg.end
  %tmp10 = load i32* %i, align 4
  %inc = add nsw i32 %tmp10, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %arraydecay11 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %arraydecay1112 = bitcast %struct.__va_list_tag* %arraydecay11 to i8*
  call void @llvm.va_end(i8* %arraydecay1112)
  %arraydecay13 = getelementptr inbounds [11 x i32]* %n, i32 0, i32 0
  call void @verify(i8* getelementptr inbounds ([9 x i8]* @.str8, i32 0, i32 0), i32* %arraydecay13)
  ret void
}

define internal void @varargs3(i32 %q0, i32 %q1, i32 %q2, i32 %q3, ...) nounwind uwtable {
entry:
  %q0.addr = alloca i32, align 4
  %q1.addr = alloca i32, align 4
  %q2.addr = alloca i32, align 4
  %q3.addr = alloca i32, align 4
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  %n = alloca [11 x i32], align 16
  %i = alloca i32, align 4
  store i32 %q0, i32* %q0.addr, align 4
  store i32 %q1, i32* %q1.addr, align 4
  store i32 %q2, i32* %q2.addr, align 4
  store i32 %q3, i32* %q3.addr, align 4
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %arraydecay1 = bitcast %struct.__va_list_tag* %arraydecay to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %tmp = load i32* %q0.addr, align 4
  %arrayidx = getelementptr inbounds [11 x i32]* %n, i32 0, i64 0
  store i32 %tmp, i32* %arrayidx, align 4
  %tmp2 = load i32* %q1.addr, align 4
  %arrayidx3 = getelementptr inbounds [11 x i32]* %n, i32 0, i64 1
  store i32 %tmp2, i32* %arrayidx3, align 4
  %tmp4 = load i32* %q2.addr, align 4
  %arrayidx5 = getelementptr inbounds [11 x i32]* %n, i32 0, i64 2
  store i32 %tmp4, i32* %arrayidx5, align 4
  %tmp6 = load i32* %q3.addr, align 4
  %arrayidx7 = getelementptr inbounds [11 x i32]* %n, i32 0, i64 3
  store i32 %tmp6, i32* %arrayidx7, align 4
  store i32 4, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp8 = load i32* %i, align 4
  %cmp = icmp sle i32 %tmp8, 10
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %arraydecay9 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %gp_offset_p = getelementptr inbounds %struct.__va_list_tag* %arraydecay9, i32 0, i32 0
  %gp_offset = load i32* %gp_offset_p
  %fits_in_gp = icmp ule i32 %gp_offset, 40
  br i1 %fits_in_gp, label %vaarg.in_reg, label %vaarg.in_mem

vaarg.in_reg:                                     ; preds = %for.body
  %0 = getelementptr inbounds %struct.__va_list_tag* %arraydecay9, i32 0, i32 3
  %reg_save_area = load i8** %0
  %1 = getelementptr i8* %reg_save_area, i32 %gp_offset
  %2 = bitcast i8* %1 to i32*
  %3 = add i32 %gp_offset, 8
  store i32 %3, i32* %gp_offset_p
  br label %vaarg.end

vaarg.in_mem:                                     ; preds = %for.body
  %overflow_arg_area_p = getelementptr inbounds %struct.__va_list_tag* %arraydecay9, i32 0, i32 2
  %overflow_arg_area = load i8** %overflow_arg_area_p
  %4 = bitcast i8* %overflow_arg_area to i32*
  %overflow_arg_area.next = getelementptr i8* %overflow_arg_area, i32 8
  store i8* %overflow_arg_area.next, i8** %overflow_arg_area_p
  br label %vaarg.end

vaarg.end:                                        ; preds = %vaarg.in_mem, %vaarg.in_reg
  %vaarg.addr = phi i32* [ %2, %vaarg.in_reg ], [ %4, %vaarg.in_mem ]
  %5 = load i32* %vaarg.addr
  %tmp10 = load i32* %i, align 4
  %idxprom = sext i32 %tmp10 to i64
  %arrayidx11 = getelementptr inbounds [11 x i32]* %n, i32 0, i64 %idxprom
  store i32 %5, i32* %arrayidx11, align 4
  br label %for.inc

for.inc:                                          ; preds = %vaarg.end
  %tmp12 = load i32* %i, align 4
  %inc = add nsw i32 %tmp12, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %arraydecay13 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %arraydecay1314 = bitcast %struct.__va_list_tag* %arraydecay13 to i8*
  call void @llvm.va_end(i8* %arraydecay1314)
  %arraydecay15 = getelementptr inbounds [11 x i32]* %n, i32 0, i32 0
  call void @verify(i8* getelementptr inbounds ([9 x i8]* @.str7, i32 0, i32 0), i32* %arraydecay15)
  ret void
}

define internal void @varargs4(i32 %q0, i32 %q1, i32 %q2, i32 %q3, i32 %q4, ...) nounwind uwtable {
entry:
  %q0.addr = alloca i32, align 4
  %q1.addr = alloca i32, align 4
  %q2.addr = alloca i32, align 4
  %q3.addr = alloca i32, align 4
  %q4.addr = alloca i32, align 4
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  %n = alloca [11 x i32], align 16
  %i = alloca i32, align 4
  store i32 %q0, i32* %q0.addr, align 4
  store i32 %q1, i32* %q1.addr, align 4
  store i32 %q2, i32* %q2.addr, align 4
  store i32 %q3, i32* %q3.addr, align 4
  store i32 %q4, i32* %q4.addr, align 4
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %arraydecay1 = bitcast %struct.__va_list_tag* %arraydecay to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %tmp = load i32* %q0.addr, align 4
  %arrayidx = getelementptr inbounds [11 x i32]* %n, i32 0, i64 0
  store i32 %tmp, i32* %arrayidx, align 4
  %tmp2 = load i32* %q1.addr, align 4
  %arrayidx3 = getelementptr inbounds [11 x i32]* %n, i32 0, i64 1
  store i32 %tmp2, i32* %arrayidx3, align 4
  %tmp4 = load i32* %q2.addr, align 4
  %arrayidx5 = getelementptr inbounds [11 x i32]* %n, i32 0, i64 2
  store i32 %tmp4, i32* %arrayidx5, align 4
  %tmp6 = load i32* %q3.addr, align 4
  %arrayidx7 = getelementptr inbounds [11 x i32]* %n, i32 0, i64 3
  store i32 %tmp6, i32* %arrayidx7, align 4
  %tmp8 = load i32* %q4.addr, align 4
  %arrayidx9 = getelementptr inbounds [11 x i32]* %n, i32 0, i64 4
  store i32 %tmp8, i32* %arrayidx9, align 4
  store i32 5, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp10 = load i32* %i, align 4
  %cmp = icmp sle i32 %tmp10, 10
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %arraydecay11 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %gp_offset_p = getelementptr inbounds %struct.__va_list_tag* %arraydecay11, i32 0, i32 0
  %gp_offset = load i32* %gp_offset_p
  %fits_in_gp = icmp ule i32 %gp_offset, 40
  br i1 %fits_in_gp, label %vaarg.in_reg, label %vaarg.in_mem

vaarg.in_reg:                                     ; preds = %for.body
  %0 = getelementptr inbounds %struct.__va_list_tag* %arraydecay11, i32 0, i32 3
  %reg_save_area = load i8** %0
  %1 = getelementptr i8* %reg_save_area, i32 %gp_offset
  %2 = bitcast i8* %1 to i32*
  %3 = add i32 %gp_offset, 8
  store i32 %3, i32* %gp_offset_p
  br label %vaarg.end

vaarg.in_mem:                                     ; preds = %for.body
  %overflow_arg_area_p = getelementptr inbounds %struct.__va_list_tag* %arraydecay11, i32 0, i32 2
  %overflow_arg_area = load i8** %overflow_arg_area_p
  %4 = bitcast i8* %overflow_arg_area to i32*
  %overflow_arg_area.next = getelementptr i8* %overflow_arg_area, i32 8
  store i8* %overflow_arg_area.next, i8** %overflow_arg_area_p
  br label %vaarg.end

vaarg.end:                                        ; preds = %vaarg.in_mem, %vaarg.in_reg
  %vaarg.addr = phi i32* [ %2, %vaarg.in_reg ], [ %4, %vaarg.in_mem ]
  %5 = load i32* %vaarg.addr
  %tmp12 = load i32* %i, align 4
  %idxprom = sext i32 %tmp12 to i64
  %arrayidx13 = getelementptr inbounds [11 x i32]* %n, i32 0, i64 %idxprom
  store i32 %5, i32* %arrayidx13, align 4
  br label %for.inc

for.inc:                                          ; preds = %vaarg.end
  %tmp14 = load i32* %i, align 4
  %inc = add nsw i32 %tmp14, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %arraydecay15 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %arraydecay1516 = bitcast %struct.__va_list_tag* %arraydecay15 to i8*
  call void @llvm.va_end(i8* %arraydecay1516)
  %arraydecay17 = getelementptr inbounds [11 x i32]* %n, i32 0, i32 0
  call void @verify(i8* getelementptr inbounds ([9 x i8]* @.str6, i32 0, i32 0), i32* %arraydecay17)
  ret void
}

define internal void @varargs5(i32 %q0, i32 %q1, i32 %q2, i32 %q3, i32 %q4, i32 %q5, ...) nounwind uwtable {
entry:
  %q0.addr = alloca i32, align 4
  %q1.addr = alloca i32, align 4
  %q2.addr = alloca i32, align 4
  %q3.addr = alloca i32, align 4
  %q4.addr = alloca i32, align 4
  %q5.addr = alloca i32, align 4
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  %n = alloca [11 x i32], align 16
  %i = alloca i32, align 4
  store i32 %q0, i32* %q0.addr, align 4
  store i32 %q1, i32* %q1.addr, align 4
  store i32 %q2, i32* %q2.addr, align 4
  store i32 %q3, i32* %q3.addr, align 4
  store i32 %q4, i32* %q4.addr, align 4
  store i32 %q5, i32* %q5.addr, align 4
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %arraydecay1 = bitcast %struct.__va_list_tag* %arraydecay to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %tmp = load i32* %q0.addr, align 4
  %arrayidx = getelementptr inbounds [11 x i32]* %n, i32 0, i64 0
  store i32 %tmp, i32* %arrayidx, align 4
  %tmp2 = load i32* %q1.addr, align 4
  %arrayidx3 = getelementptr inbounds [11 x i32]* %n, i32 0, i64 1
  store i32 %tmp2, i32* %arrayidx3, align 4
  %tmp4 = load i32* %q2.addr, align 4
  %arrayidx5 = getelementptr inbounds [11 x i32]* %n, i32 0, i64 2
  store i32 %tmp4, i32* %arrayidx5, align 4
  %tmp6 = load i32* %q3.addr, align 4
  %arrayidx7 = getelementptr inbounds [11 x i32]* %n, i32 0, i64 3
  store i32 %tmp6, i32* %arrayidx7, align 4
  %tmp8 = load i32* %q4.addr, align 4
  %arrayidx9 = getelementptr inbounds [11 x i32]* %n, i32 0, i64 4
  store i32 %tmp8, i32* %arrayidx9, align 4
  %tmp10 = load i32* %q5.addr, align 4
  %arrayidx11 = getelementptr inbounds [11 x i32]* %n, i32 0, i64 5
  store i32 %tmp10, i32* %arrayidx11, align 4
  store i32 6, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp12 = load i32* %i, align 4
  %cmp = icmp sle i32 %tmp12, 10
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %arraydecay13 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %gp_offset_p = getelementptr inbounds %struct.__va_list_tag* %arraydecay13, i32 0, i32 0
  %gp_offset = load i32* %gp_offset_p
  %fits_in_gp = icmp ule i32 %gp_offset, 40
  br i1 %fits_in_gp, label %vaarg.in_reg, label %vaarg.in_mem

vaarg.in_reg:                                     ; preds = %for.body
  %0 = getelementptr inbounds %struct.__va_list_tag* %arraydecay13, i32 0, i32 3
  %reg_save_area = load i8** %0
  %1 = getelementptr i8* %reg_save_area, i32 %gp_offset
  %2 = bitcast i8* %1 to i32*
  %3 = add i32 %gp_offset, 8
  store i32 %3, i32* %gp_offset_p
  br label %vaarg.end

vaarg.in_mem:                                     ; preds = %for.body
  %overflow_arg_area_p = getelementptr inbounds %struct.__va_list_tag* %arraydecay13, i32 0, i32 2
  %overflow_arg_area = load i8** %overflow_arg_area_p
  %4 = bitcast i8* %overflow_arg_area to i32*
  %overflow_arg_area.next = getelementptr i8* %overflow_arg_area, i32 8
  store i8* %overflow_arg_area.next, i8** %overflow_arg_area_p
  br label %vaarg.end

vaarg.end:                                        ; preds = %vaarg.in_mem, %vaarg.in_reg
  %vaarg.addr = phi i32* [ %2, %vaarg.in_reg ], [ %4, %vaarg.in_mem ]
  %5 = load i32* %vaarg.addr
  %tmp14 = load i32* %i, align 4
  %idxprom = sext i32 %tmp14 to i64
  %arrayidx15 = getelementptr inbounds [11 x i32]* %n, i32 0, i64 %idxprom
  store i32 %5, i32* %arrayidx15, align 4
  br label %for.inc

for.inc:                                          ; preds = %vaarg.end
  %tmp16 = load i32* %i, align 4
  %inc = add nsw i32 %tmp16, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %arraydecay17 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %arraydecay1718 = bitcast %struct.__va_list_tag* %arraydecay17 to i8*
  call void @llvm.va_end(i8* %arraydecay1718)
  %arraydecay19 = getelementptr inbounds [11 x i32]* %n, i32 0, i32 0
  call void @verify(i8* getelementptr inbounds ([9 x i8]* @.str5, i32 0, i32 0), i32* %arraydecay19)
  ret void
}

define internal void @varargs6(i32 %q0, i32 %q1, i32 %q2, i32 %q3, i32 %q4, i32 %q5, i32 %q6, ...) nounwind uwtable {
entry:
  %q0.addr = alloca i32, align 4
  %q1.addr = alloca i32, align 4
  %q2.addr = alloca i32, align 4
  %q3.addr = alloca i32, align 4
  %q4.addr = alloca i32, align 4
  %q5.addr = alloca i32, align 4
  %q6.addr = alloca i32, align 4
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  %n = alloca [11 x i32], align 16
  %i = alloca i32, align 4
  store i32 %q0, i32* %q0.addr, align 4
  store i32 %q1, i32* %q1.addr, align 4
  store i32 %q2, i32* %q2.addr, align 4
  store i32 %q3, i32* %q3.addr, align 4
  store i32 %q4, i32* %q4.addr, align 4
  store i32 %q5, i32* %q5.addr, align 4
  store i32 %q6, i32* %q6.addr, align 4
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %arraydecay1 = bitcast %struct.__va_list_tag* %arraydecay to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %tmp = load i32* %q0.addr, align 4
  %arrayidx = getelementptr inbounds [11 x i32]* %n, i32 0, i64 0
  store i32 %tmp, i32* %arrayidx, align 4
  %tmp2 = load i32* %q1.addr, align 4
  %arrayidx3 = getelementptr inbounds [11 x i32]* %n, i32 0, i64 1
  store i32 %tmp2, i32* %arrayidx3, align 4
  %tmp4 = load i32* %q2.addr, align 4
  %arrayidx5 = getelementptr inbounds [11 x i32]* %n, i32 0, i64 2
  store i32 %tmp4, i32* %arrayidx5, align 4
  %tmp6 = load i32* %q3.addr, align 4
  %arrayidx7 = getelementptr inbounds [11 x i32]* %n, i32 0, i64 3
  store i32 %tmp6, i32* %arrayidx7, align 4
  %tmp8 = load i32* %q4.addr, align 4
  %arrayidx9 = getelementptr inbounds [11 x i32]* %n, i32 0, i64 4
  store i32 %tmp8, i32* %arrayidx9, align 4
  %tmp10 = load i32* %q5.addr, align 4
  %arrayidx11 = getelementptr inbounds [11 x i32]* %n, i32 0, i64 5
  store i32 %tmp10, i32* %arrayidx11, align 4
  %tmp12 = load i32* %q6.addr, align 4
  %arrayidx13 = getelementptr inbounds [11 x i32]* %n, i32 0, i64 6
  store i32 %tmp12, i32* %arrayidx13, align 4
  store i32 7, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp14 = load i32* %i, align 4
  %cmp = icmp sle i32 %tmp14, 10
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %arraydecay15 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %gp_offset_p = getelementptr inbounds %struct.__va_list_tag* %arraydecay15, i32 0, i32 0
  %gp_offset = load i32* %gp_offset_p
  %fits_in_gp = icmp ule i32 %gp_offset, 40
  br i1 %fits_in_gp, label %vaarg.in_reg, label %vaarg.in_mem

vaarg.in_reg:                                     ; preds = %for.body
  %0 = getelementptr inbounds %struct.__va_list_tag* %arraydecay15, i32 0, i32 3
  %reg_save_area = load i8** %0
  %1 = getelementptr i8* %reg_save_area, i32 %gp_offset
  %2 = bitcast i8* %1 to i32*
  %3 = add i32 %gp_offset, 8
  store i32 %3, i32* %gp_offset_p
  br label %vaarg.end

vaarg.in_mem:                                     ; preds = %for.body
  %overflow_arg_area_p = getelementptr inbounds %struct.__va_list_tag* %arraydecay15, i32 0, i32 2
  %overflow_arg_area = load i8** %overflow_arg_area_p
  %4 = bitcast i8* %overflow_arg_area to i32*
  %overflow_arg_area.next = getelementptr i8* %overflow_arg_area, i32 8
  store i8* %overflow_arg_area.next, i8** %overflow_arg_area_p
  br label %vaarg.end

vaarg.end:                                        ; preds = %vaarg.in_mem, %vaarg.in_reg
  %vaarg.addr = phi i32* [ %2, %vaarg.in_reg ], [ %4, %vaarg.in_mem ]
  %5 = load i32* %vaarg.addr
  %tmp16 = load i32* %i, align 4
  %idxprom = sext i32 %tmp16 to i64
  %arrayidx17 = getelementptr inbounds [11 x i32]* %n, i32 0, i64 %idxprom
  store i32 %5, i32* %arrayidx17, align 4
  br label %for.inc

for.inc:                                          ; preds = %vaarg.end
  %tmp18 = load i32* %i, align 4
  %inc = add nsw i32 %tmp18, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %arraydecay19 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %arraydecay1920 = bitcast %struct.__va_list_tag* %arraydecay19 to i8*
  call void @llvm.va_end(i8* %arraydecay1920)
  %arraydecay21 = getelementptr inbounds [11 x i32]* %n, i32 0, i32 0
  call void @verify(i8* getelementptr inbounds ([9 x i8]* @.str4, i32 0, i32 0), i32* %arraydecay21)
  ret void
}

define internal void @varargs7(i32 %q0, i32 %q1, i32 %q2, i32 %q3, i32 %q4, i32 %q5, i32 %q6, i32 %q7, ...) nounwind uwtable {
entry:
  %q0.addr = alloca i32, align 4
  %q1.addr = alloca i32, align 4
  %q2.addr = alloca i32, align 4
  %q3.addr = alloca i32, align 4
  %q4.addr = alloca i32, align 4
  %q5.addr = alloca i32, align 4
  %q6.addr = alloca i32, align 4
  %q7.addr = alloca i32, align 4
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  %n = alloca [11 x i32], align 16
  %i = alloca i32, align 4
  store i32 %q0, i32* %q0.addr, align 4
  store i32 %q1, i32* %q1.addr, align 4
  store i32 %q2, i32* %q2.addr, align 4
  store i32 %q3, i32* %q3.addr, align 4
  store i32 %q4, i32* %q4.addr, align 4
  store i32 %q5, i32* %q5.addr, align 4
  store i32 %q6, i32* %q6.addr, align 4
  store i32 %q7, i32* %q7.addr, align 4
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %arraydecay1 = bitcast %struct.__va_list_tag* %arraydecay to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %tmp = load i32* %q0.addr, align 4
  %arrayidx = getelementptr inbounds [11 x i32]* %n, i32 0, i64 0
  store i32 %tmp, i32* %arrayidx, align 4
  %tmp2 = load i32* %q1.addr, align 4
  %arrayidx3 = getelementptr inbounds [11 x i32]* %n, i32 0, i64 1
  store i32 %tmp2, i32* %arrayidx3, align 4
  %tmp4 = load i32* %q2.addr, align 4
  %arrayidx5 = getelementptr inbounds [11 x i32]* %n, i32 0, i64 2
  store i32 %tmp4, i32* %arrayidx5, align 4
  %tmp6 = load i32* %q3.addr, align 4
  %arrayidx7 = getelementptr inbounds [11 x i32]* %n, i32 0, i64 3
  store i32 %tmp6, i32* %arrayidx7, align 4
  %tmp8 = load i32* %q4.addr, align 4
  %arrayidx9 = getelementptr inbounds [11 x i32]* %n, i32 0, i64 4
  store i32 %tmp8, i32* %arrayidx9, align 4
  %tmp10 = load i32* %q5.addr, align 4
  %arrayidx11 = getelementptr inbounds [11 x i32]* %n, i32 0, i64 5
  store i32 %tmp10, i32* %arrayidx11, align 4
  %tmp12 = load i32* %q6.addr, align 4
  %arrayidx13 = getelementptr inbounds [11 x i32]* %n, i32 0, i64 6
  store i32 %tmp12, i32* %arrayidx13, align 4
  %tmp14 = load i32* %q7.addr, align 4
  %arrayidx15 = getelementptr inbounds [11 x i32]* %n, i32 0, i64 7
  store i32 %tmp14, i32* %arrayidx15, align 4
  store i32 8, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp16 = load i32* %i, align 4
  %cmp = icmp sle i32 %tmp16, 10
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %arraydecay17 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %gp_offset_p = getelementptr inbounds %struct.__va_list_tag* %arraydecay17, i32 0, i32 0
  %gp_offset = load i32* %gp_offset_p
  %fits_in_gp = icmp ule i32 %gp_offset, 40
  br i1 %fits_in_gp, label %vaarg.in_reg, label %vaarg.in_mem

vaarg.in_reg:                                     ; preds = %for.body
  %0 = getelementptr inbounds %struct.__va_list_tag* %arraydecay17, i32 0, i32 3
  %reg_save_area = load i8** %0
  %1 = getelementptr i8* %reg_save_area, i32 %gp_offset
  %2 = bitcast i8* %1 to i32*
  %3 = add i32 %gp_offset, 8
  store i32 %3, i32* %gp_offset_p
  br label %vaarg.end

vaarg.in_mem:                                     ; preds = %for.body
  %overflow_arg_area_p = getelementptr inbounds %struct.__va_list_tag* %arraydecay17, i32 0, i32 2
  %overflow_arg_area = load i8** %overflow_arg_area_p
  %4 = bitcast i8* %overflow_arg_area to i32*
  %overflow_arg_area.next = getelementptr i8* %overflow_arg_area, i32 8
  store i8* %overflow_arg_area.next, i8** %overflow_arg_area_p
  br label %vaarg.end

vaarg.end:                                        ; preds = %vaarg.in_mem, %vaarg.in_reg
  %vaarg.addr = phi i32* [ %2, %vaarg.in_reg ], [ %4, %vaarg.in_mem ]
  %5 = load i32* %vaarg.addr
  %tmp18 = load i32* %i, align 4
  %idxprom = sext i32 %tmp18 to i64
  %arrayidx19 = getelementptr inbounds [11 x i32]* %n, i32 0, i64 %idxprom
  store i32 %5, i32* %arrayidx19, align 4
  br label %for.inc

for.inc:                                          ; preds = %vaarg.end
  %tmp20 = load i32* %i, align 4
  %inc = add nsw i32 %tmp20, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %arraydecay21 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %arraydecay2122 = bitcast %struct.__va_list_tag* %arraydecay21 to i8*
  call void @llvm.va_end(i8* %arraydecay2122)
  %arraydecay23 = getelementptr inbounds [11 x i32]* %n, i32 0, i32 0
  call void @verify(i8* getelementptr inbounds ([9 x i8]* @.str3, i32 0, i32 0), i32* %arraydecay23)
  ret void
}

define internal void @varargs8(i32 %q0, i32 %q1, i32 %q2, i32 %q3, i32 %q4, i32 %q5, i32 %q6, i32 %q7, i32 %q8, ...) nounwind uwtable {
entry:
  %q0.addr = alloca i32, align 4
  %q1.addr = alloca i32, align 4
  %q2.addr = alloca i32, align 4
  %q3.addr = alloca i32, align 4
  %q4.addr = alloca i32, align 4
  %q5.addr = alloca i32, align 4
  %q6.addr = alloca i32, align 4
  %q7.addr = alloca i32, align 4
  %q8.addr = alloca i32, align 4
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  %n = alloca [11 x i32], align 16
  %i = alloca i32, align 4
  store i32 %q0, i32* %q0.addr, align 4
  store i32 %q1, i32* %q1.addr, align 4
  store i32 %q2, i32* %q2.addr, align 4
  store i32 %q3, i32* %q3.addr, align 4
  store i32 %q4, i32* %q4.addr, align 4
  store i32 %q5, i32* %q5.addr, align 4
  store i32 %q6, i32* %q6.addr, align 4
  store i32 %q7, i32* %q7.addr, align 4
  store i32 %q8, i32* %q8.addr, align 4
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %arraydecay1 = bitcast %struct.__va_list_tag* %arraydecay to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %tmp = load i32* %q0.addr, align 4
  %arrayidx = getelementptr inbounds [11 x i32]* %n, i32 0, i64 0
  store i32 %tmp, i32* %arrayidx, align 4
  %tmp2 = load i32* %q1.addr, align 4
  %arrayidx3 = getelementptr inbounds [11 x i32]* %n, i32 0, i64 1
  store i32 %tmp2, i32* %arrayidx3, align 4
  %tmp4 = load i32* %q2.addr, align 4
  %arrayidx5 = getelementptr inbounds [11 x i32]* %n, i32 0, i64 2
  store i32 %tmp4, i32* %arrayidx5, align 4
  %tmp6 = load i32* %q3.addr, align 4
  %arrayidx7 = getelementptr inbounds [11 x i32]* %n, i32 0, i64 3
  store i32 %tmp6, i32* %arrayidx7, align 4
  %tmp8 = load i32* %q4.addr, align 4
  %arrayidx9 = getelementptr inbounds [11 x i32]* %n, i32 0, i64 4
  store i32 %tmp8, i32* %arrayidx9, align 4
  %tmp10 = load i32* %q5.addr, align 4
  %arrayidx11 = getelementptr inbounds [11 x i32]* %n, i32 0, i64 5
  store i32 %tmp10, i32* %arrayidx11, align 4
  %tmp12 = load i32* %q6.addr, align 4
  %arrayidx13 = getelementptr inbounds [11 x i32]* %n, i32 0, i64 6
  store i32 %tmp12, i32* %arrayidx13, align 4
  %tmp14 = load i32* %q7.addr, align 4
  %arrayidx15 = getelementptr inbounds [11 x i32]* %n, i32 0, i64 7
  store i32 %tmp14, i32* %arrayidx15, align 4
  %tmp16 = load i32* %q8.addr, align 4
  %arrayidx17 = getelementptr inbounds [11 x i32]* %n, i32 0, i64 8
  store i32 %tmp16, i32* %arrayidx17, align 4
  store i32 9, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp18 = load i32* %i, align 4
  %cmp = icmp sle i32 %tmp18, 10
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %arraydecay19 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %gp_offset_p = getelementptr inbounds %struct.__va_list_tag* %arraydecay19, i32 0, i32 0
  %gp_offset = load i32* %gp_offset_p
  %fits_in_gp = icmp ule i32 %gp_offset, 40
  br i1 %fits_in_gp, label %vaarg.in_reg, label %vaarg.in_mem

vaarg.in_reg:                                     ; preds = %for.body
  %0 = getelementptr inbounds %struct.__va_list_tag* %arraydecay19, i32 0, i32 3
  %reg_save_area = load i8** %0
  %1 = getelementptr i8* %reg_save_area, i32 %gp_offset
  %2 = bitcast i8* %1 to i32*
  %3 = add i32 %gp_offset, 8
  store i32 %3, i32* %gp_offset_p
  br label %vaarg.end

vaarg.in_mem:                                     ; preds = %for.body
  %overflow_arg_area_p = getelementptr inbounds %struct.__va_list_tag* %arraydecay19, i32 0, i32 2
  %overflow_arg_area = load i8** %overflow_arg_area_p
  %4 = bitcast i8* %overflow_arg_area to i32*
  %overflow_arg_area.next = getelementptr i8* %overflow_arg_area, i32 8
  store i8* %overflow_arg_area.next, i8** %overflow_arg_area_p
  br label %vaarg.end

vaarg.end:                                        ; preds = %vaarg.in_mem, %vaarg.in_reg
  %vaarg.addr = phi i32* [ %2, %vaarg.in_reg ], [ %4, %vaarg.in_mem ]
  %5 = load i32* %vaarg.addr
  %tmp20 = load i32* %i, align 4
  %idxprom = sext i32 %tmp20 to i64
  %arrayidx21 = getelementptr inbounds [11 x i32]* %n, i32 0, i64 %idxprom
  store i32 %5, i32* %arrayidx21, align 4
  br label %for.inc

for.inc:                                          ; preds = %vaarg.end
  %tmp22 = load i32* %i, align 4
  %inc = add nsw i32 %tmp22, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %arraydecay23 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %arraydecay2324 = bitcast %struct.__va_list_tag* %arraydecay23 to i8*
  call void @llvm.va_end(i8* %arraydecay2324)
  %arraydecay25 = getelementptr inbounds [11 x i32]* %n, i32 0, i32 0
  call void @verify(i8* getelementptr inbounds ([9 x i8]* @.str2, i32 0, i32 0), i32* %arraydecay25)
  ret void
}

define internal void @varargs9(i32 %q0, i32 %q1, i32 %q2, i32 %q3, i32 %q4, i32 %q5, i32 %q6, i32 %q7, i32 %q8, i32 %q9, ...) nounwind uwtable {
entry:
  %q0.addr = alloca i32, align 4
  %q1.addr = alloca i32, align 4
  %q2.addr = alloca i32, align 4
  %q3.addr = alloca i32, align 4
  %q4.addr = alloca i32, align 4
  %q5.addr = alloca i32, align 4
  %q6.addr = alloca i32, align 4
  %q7.addr = alloca i32, align 4
  %q8.addr = alloca i32, align 4
  %q9.addr = alloca i32, align 4
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  %n = alloca [11 x i32], align 16
  %i = alloca i32, align 4
  store i32 %q0, i32* %q0.addr, align 4
  store i32 %q1, i32* %q1.addr, align 4
  store i32 %q2, i32* %q2.addr, align 4
  store i32 %q3, i32* %q3.addr, align 4
  store i32 %q4, i32* %q4.addr, align 4
  store i32 %q5, i32* %q5.addr, align 4
  store i32 %q6, i32* %q6.addr, align 4
  store i32 %q7, i32* %q7.addr, align 4
  store i32 %q8, i32* %q8.addr, align 4
  store i32 %q9, i32* %q9.addr, align 4
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %arraydecay1 = bitcast %struct.__va_list_tag* %arraydecay to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %tmp = load i32* %q0.addr, align 4
  %arrayidx = getelementptr inbounds [11 x i32]* %n, i32 0, i64 0
  store i32 %tmp, i32* %arrayidx, align 4
  %tmp2 = load i32* %q1.addr, align 4
  %arrayidx3 = getelementptr inbounds [11 x i32]* %n, i32 0, i64 1
  store i32 %tmp2, i32* %arrayidx3, align 4
  %tmp4 = load i32* %q2.addr, align 4
  %arrayidx5 = getelementptr inbounds [11 x i32]* %n, i32 0, i64 2
  store i32 %tmp4, i32* %arrayidx5, align 4
  %tmp6 = load i32* %q3.addr, align 4
  %arrayidx7 = getelementptr inbounds [11 x i32]* %n, i32 0, i64 3
  store i32 %tmp6, i32* %arrayidx7, align 4
  %tmp8 = load i32* %q4.addr, align 4
  %arrayidx9 = getelementptr inbounds [11 x i32]* %n, i32 0, i64 4
  store i32 %tmp8, i32* %arrayidx9, align 4
  %tmp10 = load i32* %q5.addr, align 4
  %arrayidx11 = getelementptr inbounds [11 x i32]* %n, i32 0, i64 5
  store i32 %tmp10, i32* %arrayidx11, align 4
  %tmp12 = load i32* %q6.addr, align 4
  %arrayidx13 = getelementptr inbounds [11 x i32]* %n, i32 0, i64 6
  store i32 %tmp12, i32* %arrayidx13, align 4
  %tmp14 = load i32* %q7.addr, align 4
  %arrayidx15 = getelementptr inbounds [11 x i32]* %n, i32 0, i64 7
  store i32 %tmp14, i32* %arrayidx15, align 4
  %tmp16 = load i32* %q8.addr, align 4
  %arrayidx17 = getelementptr inbounds [11 x i32]* %n, i32 0, i64 8
  store i32 %tmp16, i32* %arrayidx17, align 4
  %tmp18 = load i32* %q9.addr, align 4
  %arrayidx19 = getelementptr inbounds [11 x i32]* %n, i32 0, i64 9
  store i32 %tmp18, i32* %arrayidx19, align 4
  store i32 10, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp20 = load i32* %i, align 4
  %cmp = icmp sle i32 %tmp20, 10
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %arraydecay21 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %gp_offset_p = getelementptr inbounds %struct.__va_list_tag* %arraydecay21, i32 0, i32 0
  %gp_offset = load i32* %gp_offset_p
  %fits_in_gp = icmp ule i32 %gp_offset, 40
  br i1 %fits_in_gp, label %vaarg.in_reg, label %vaarg.in_mem

vaarg.in_reg:                                     ; preds = %for.body
  %0 = getelementptr inbounds %struct.__va_list_tag* %arraydecay21, i32 0, i32 3
  %reg_save_area = load i8** %0
  %1 = getelementptr i8* %reg_save_area, i32 %gp_offset
  %2 = bitcast i8* %1 to i32*
  %3 = add i32 %gp_offset, 8
  store i32 %3, i32* %gp_offset_p
  br label %vaarg.end

vaarg.in_mem:                                     ; preds = %for.body
  %overflow_arg_area_p = getelementptr inbounds %struct.__va_list_tag* %arraydecay21, i32 0, i32 2
  %overflow_arg_area = load i8** %overflow_arg_area_p
  %4 = bitcast i8* %overflow_arg_area to i32*
  %overflow_arg_area.next = getelementptr i8* %overflow_arg_area, i32 8
  store i8* %overflow_arg_area.next, i8** %overflow_arg_area_p
  br label %vaarg.end

vaarg.end:                                        ; preds = %vaarg.in_mem, %vaarg.in_reg
  %vaarg.addr = phi i32* [ %2, %vaarg.in_reg ], [ %4, %vaarg.in_mem ]
  %5 = load i32* %vaarg.addr
  %tmp22 = load i32* %i, align 4
  %idxprom = sext i32 %tmp22 to i64
  %arrayidx23 = getelementptr inbounds [11 x i32]* %n, i32 0, i64 %idxprom
  store i32 %5, i32* %arrayidx23, align 4
  br label %for.inc

for.inc:                                          ; preds = %vaarg.end
  %tmp24 = load i32* %i, align 4
  %inc = add nsw i32 %tmp24, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %arraydecay25 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %arraydecay2526 = bitcast %struct.__va_list_tag* %arraydecay25 to i8*
  call void @llvm.va_end(i8* %arraydecay2526)
  %arraydecay27 = getelementptr inbounds [11 x i32]* %n, i32 0, i32 0
  call void @verify(i8* getelementptr inbounds ([9 x i8]* @.str, i32 0, i32 0), i32* %arraydecay27)
  ret void
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind

declare void @llvm.va_start(i8*) nounwind

declare void @llvm.va_end(i8*) nounwind

define internal void @verify(i8* %tcase, i32* %n) nounwind uwtable {
entry:
  %tcase.addr = alloca i8*, align 8
  %n.addr = alloca i32*, align 8
  %i = alloca i32, align 4
  store i8* %tcase, i8** %tcase.addr, align 8
  store i32* %n, i32** %n.addr, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp = load i32* %i, align 4
  %cmp = icmp sle i32 %tmp, 10
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp1 = load i32* %i, align 4
  %idxprom = sext i32 %tmp1 to i64
  %tmp2 = load i32** %n.addr, align 8
  %arrayidx = getelementptr inbounds i32* %tmp2, i64 %idxprom
  %tmp3 = load i32* %arrayidx
  %tmp4 = load i32* %i, align 4
  %cmp5 = icmp ne i32 %tmp3, %tmp4
  br i1 %cmp5, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %tmp6 = load i8** %tcase.addr, align 8
  %tmp7 = load i32* %i, align 4
  %tmp8 = load i32* %i, align 4
  %idxprom9 = sext i32 %tmp8 to i64
  %tmp10 = load i32** %n.addr, align 8
  %arrayidx11 = getelementptr inbounds i32* %tmp10, i64 %idxprom9
  %tmp12 = load i32* %arrayidx11
  %tmp13 = load i32* %i, align 4
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str1, i32 0, i32 0), i8* %tmp6, i32 %tmp7, i32 %tmp12, i32 %tmp13)
  %tmp14 = load i32* @errors, align 4
  %inc = add nsw i32 %tmp14, 1
  store i32 %inc, i32* @errors, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %tmp15 = load i32* %i, align 4
  %inc16 = add nsw i32 %tmp15, 1
  store i32 %inc16, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  ret void
}

declare i32 @printf(i8*, ...)
