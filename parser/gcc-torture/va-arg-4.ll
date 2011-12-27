; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/va-arg-4.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.__va_list_tag = type { i32, i32, i8*, i8* }
%struct.big = type { [32 x i8] }

@main.x = internal global %struct.big { [32 x i8] c"abc\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00" }, align 1
@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1

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

define void @f(%struct.big* byval align 8 %x, i8* %s, ...) nounwind uwtable {
entry:
  %s.addr = alloca i8*, align 8
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  store i8* %s, i8** %s.addr, align 8
  %a = getelementptr inbounds %struct.big* %x, i32 0, i32 0
  %arrayidx = getelementptr inbounds [32 x i8]* %a, i32 0, i64 0
  %tmp = load i8* %arrayidx, align 1
  %conv = sext i8 %tmp to i32
  %cmp = icmp ne i32 %conv, 97
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %a2 = getelementptr inbounds %struct.big* %x, i32 0, i32 0
  %arrayidx3 = getelementptr inbounds [32 x i8]* %a2, i32 0, i64 1
  %tmp4 = load i8* %arrayidx3, align 1
  %conv5 = sext i8 %tmp4 to i32
  %cmp6 = icmp ne i32 %conv5, 98
  br i1 %cmp6, label %if.then, label %lor.lhs.false8

lor.lhs.false8:                                   ; preds = %lor.lhs.false
  %a9 = getelementptr inbounds %struct.big* %x, i32 0, i32 0
  %arrayidx10 = getelementptr inbounds [32 x i8]* %a9, i32 0, i64 2
  %tmp11 = load i8* %arrayidx10, align 1
  %conv12 = sext i8 %tmp11 to i32
  %cmp13 = icmp ne i32 %conv12, 99
  br i1 %cmp13, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false8, %lor.lhs.false, %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %lor.lhs.false8
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %arraydecay15 = bitcast %struct.__va_list_tag* %arraydecay to i8*
  call void @llvm.va_start(i8* %arraydecay15)
  %arraydecay16 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %gp_offset_p = getelementptr inbounds %struct.__va_list_tag* %arraydecay16, i32 0, i32 0
  %gp_offset = load i32* %gp_offset_p
  %fits_in_gp = icmp ule i32 %gp_offset, 40
  br i1 %fits_in_gp, label %vaarg.in_reg, label %vaarg.in_mem

vaarg.in_reg:                                     ; preds = %if.end
  %0 = getelementptr inbounds %struct.__va_list_tag* %arraydecay16, i32 0, i32 3
  %reg_save_area = load i8** %0
  %1 = getelementptr i8* %reg_save_area, i32 %gp_offset
  %2 = bitcast i8* %1 to i32*
  %3 = add i32 %gp_offset, 8
  store i32 %3, i32* %gp_offset_p
  br label %vaarg.end

vaarg.in_mem:                                     ; preds = %if.end
  %overflow_arg_area_p = getelementptr inbounds %struct.__va_list_tag* %arraydecay16, i32 0, i32 2
  %overflow_arg_area = load i8** %overflow_arg_area_p
  %4 = bitcast i8* %overflow_arg_area to i32*
  %overflow_arg_area.next = getelementptr i8* %overflow_arg_area, i32 8
  store i8* %overflow_arg_area.next, i8** %overflow_arg_area_p
  br label %vaarg.end

vaarg.end:                                        ; preds = %vaarg.in_mem, %vaarg.in_reg
  %vaarg.addr = phi i32* [ %2, %vaarg.in_reg ], [ %4, %vaarg.in_mem ]
  %5 = load i32* %vaarg.addr
  %cmp17 = icmp ne i32 %5, 42
  br i1 %cmp17, label %if.then19, label %if.end20

if.then19:                                        ; preds = %vaarg.end
  call void @abort() noreturn nounwind
  unreachable

if.end20:                                         ; preds = %vaarg.end
  %arraydecay21 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %gp_offset_p22 = getelementptr inbounds %struct.__va_list_tag* %arraydecay21, i32 0, i32 0
  %gp_offset23 = load i32* %gp_offset_p22
  %fits_in_gp24 = icmp ule i32 %gp_offset23, 40
  br i1 %fits_in_gp24, label %vaarg.in_reg25, label %vaarg.in_mem27

vaarg.in_reg25:                                   ; preds = %if.end20
  %6 = getelementptr inbounds %struct.__va_list_tag* %arraydecay21, i32 0, i32 3
  %reg_save_area26 = load i8** %6
  %7 = getelementptr i8* %reg_save_area26, i32 %gp_offset23
  %8 = bitcast i8* %7 to i32*
  %9 = add i32 %gp_offset23, 8
  store i32 %9, i32* %gp_offset_p22
  br label %vaarg.end31

vaarg.in_mem27:                                   ; preds = %if.end20
  %overflow_arg_area_p28 = getelementptr inbounds %struct.__va_list_tag* %arraydecay21, i32 0, i32 2
  %overflow_arg_area29 = load i8** %overflow_arg_area_p28
  %10 = bitcast i8* %overflow_arg_area29 to i32*
  %overflow_arg_area.next30 = getelementptr i8* %overflow_arg_area29, i32 8
  store i8* %overflow_arg_area.next30, i8** %overflow_arg_area_p28
  br label %vaarg.end31

vaarg.end31:                                      ; preds = %vaarg.in_mem27, %vaarg.in_reg25
  %vaarg.addr32 = phi i32* [ %8, %vaarg.in_reg25 ], [ %10, %vaarg.in_mem27 ]
  %11 = load i32* %vaarg.addr32
  %cmp33 = icmp ne i32 %11, 120
  br i1 %cmp33, label %if.then35, label %if.end36

if.then35:                                        ; preds = %vaarg.end31
  call void @abort() noreturn nounwind
  unreachable

if.end36:                                         ; preds = %vaarg.end31
  %arraydecay37 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %gp_offset_p38 = getelementptr inbounds %struct.__va_list_tag* %arraydecay37, i32 0, i32 0
  %gp_offset39 = load i32* %gp_offset_p38
  %fits_in_gp40 = icmp ule i32 %gp_offset39, 40
  br i1 %fits_in_gp40, label %vaarg.in_reg41, label %vaarg.in_mem43

vaarg.in_reg41:                                   ; preds = %if.end36
  %12 = getelementptr inbounds %struct.__va_list_tag* %arraydecay37, i32 0, i32 3
  %reg_save_area42 = load i8** %12
  %13 = getelementptr i8* %reg_save_area42, i32 %gp_offset39
  %14 = bitcast i8* %13 to i32*
  %15 = add i32 %gp_offset39, 8
  store i32 %15, i32* %gp_offset_p38
  br label %vaarg.end47

vaarg.in_mem43:                                   ; preds = %if.end36
  %overflow_arg_area_p44 = getelementptr inbounds %struct.__va_list_tag* %arraydecay37, i32 0, i32 2
  %overflow_arg_area45 = load i8** %overflow_arg_area_p44
  %16 = bitcast i8* %overflow_arg_area45 to i32*
  %overflow_arg_area.next46 = getelementptr i8* %overflow_arg_area45, i32 8
  store i8* %overflow_arg_area.next46, i8** %overflow_arg_area_p44
  br label %vaarg.end47

vaarg.end47:                                      ; preds = %vaarg.in_mem43, %vaarg.in_reg41
  %vaarg.addr48 = phi i32* [ %14, %vaarg.in_reg41 ], [ %16, %vaarg.in_mem43 ]
  %17 = load i32* %vaarg.addr48
  %cmp49 = icmp ne i32 %17, 0
  br i1 %cmp49, label %if.then51, label %if.end52

if.then51:                                        ; preds = %vaarg.end47
  call void @abort() noreturn nounwind
  unreachable

if.end52:                                         ; preds = %vaarg.end47
  %arraydecay53 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %arraydecay5354 = bitcast %struct.__va_list_tag* %arraydecay53 to i8*
  call void @llvm.va_end(i8* %arraydecay5354)
  ret void
}

declare void @abort() noreturn nounwind

declare void @llvm.va_start(i8*) nounwind

declare void @llvm.va_end(i8*) nounwind

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  call void (%struct.big*, i8*, ...)* @f(%struct.big* byval align 8 @main.x, i8* getelementptr inbounds ([1 x i8]* @.str, i32 0, i32 0), i32 42, i32 120, i32 0)
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

declare void @exit(i32) noreturn nounwind
