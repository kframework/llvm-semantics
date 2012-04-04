; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/va-arg-4.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.__va_list_tag = type { i32, i32, i8*, i8* }
%struct.big = type { [32 x i8] }

@main.x = internal global %struct.big { [32 x i8] c"abc\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00" }, align 1
@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1

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

define void @f(%struct.big* nocapture byval align 8 %x, i8* nocapture %s, ...) nounwind uwtable {
entry:
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  %0 = bitcast %struct.big* %x to i32*
  %tmp = load i32* %0, align 8
  %1 = and i32 %tmp, 16777215
  %2 = icmp eq i32 %1, 6513249
  br i1 %2, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  %arraydecay15 = bitcast [1 x %struct.__va_list_tag]* %ap to i8*
  call void @llvm.va_start(i8* %arraydecay15)
  %gp_offset_p = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 0
  %gp_offset = load i32* %gp_offset_p, align 16
  %fits_in_gp = icmp ult i32 %gp_offset, 41
  br i1 %fits_in_gp, label %vaarg.in_reg, label %vaarg.in_mem

vaarg.in_reg:                                     ; preds = %if.end
  %3 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 3
  %reg_save_area = load i8** %3, align 16
  %4 = sext i32 %gp_offset to i64
  %5 = getelementptr i8* %reg_save_area, i64 %4
  %6 = add i32 %gp_offset, 8
  store i32 %6, i32* %gp_offset_p, align 16
  br label %vaarg.end

vaarg.in_mem:                                     ; preds = %if.end
  %overflow_arg_area_p = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 2
  %overflow_arg_area = load i8** %overflow_arg_area_p, align 8
  %overflow_arg_area.next = getelementptr i8* %overflow_arg_area, i64 8
  store i8* %overflow_arg_area.next, i8** %overflow_arg_area_p, align 8
  br label %vaarg.end

vaarg.end:                                        ; preds = %vaarg.in_mem, %vaarg.in_reg
  %gp_offset23 = phi i32 [ %6, %vaarg.in_reg ], [ %gp_offset, %vaarg.in_mem ]
  %vaarg.addr.in = phi i8* [ %5, %vaarg.in_reg ], [ %overflow_arg_area, %vaarg.in_mem ]
  %vaarg.addr = bitcast i8* %vaarg.addr.in to i32*
  %7 = load i32* %vaarg.addr, align 4
  %cmp17 = icmp eq i32 %7, 42
  br i1 %cmp17, label %if.end20, label %if.then19

if.then19:                                        ; preds = %vaarg.end
  call void @abort() noreturn nounwind
  unreachable

if.end20:                                         ; preds = %vaarg.end
  %fits_in_gp24 = icmp ult i32 %gp_offset23, 41
  br i1 %fits_in_gp24, label %vaarg.in_reg25, label %vaarg.in_mem27

vaarg.in_reg25:                                   ; preds = %if.end20
  %8 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 3
  %reg_save_area26 = load i8** %8, align 16
  %9 = sext i32 %gp_offset23 to i64
  %10 = getelementptr i8* %reg_save_area26, i64 %9
  %11 = add i32 %gp_offset23, 8
  store i32 %11, i32* %gp_offset_p, align 16
  br label %vaarg.end31

vaarg.in_mem27:                                   ; preds = %if.end20
  %overflow_arg_area_p28 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 2
  %overflow_arg_area29 = load i8** %overflow_arg_area_p28, align 8
  %overflow_arg_area.next30 = getelementptr i8* %overflow_arg_area29, i64 8
  store i8* %overflow_arg_area.next30, i8** %overflow_arg_area_p28, align 8
  br label %vaarg.end31

vaarg.end31:                                      ; preds = %vaarg.in_mem27, %vaarg.in_reg25
  %gp_offset39 = phi i32 [ %11, %vaarg.in_reg25 ], [ %gp_offset23, %vaarg.in_mem27 ]
  %vaarg.addr32.in = phi i8* [ %10, %vaarg.in_reg25 ], [ %overflow_arg_area29, %vaarg.in_mem27 ]
  %vaarg.addr32 = bitcast i8* %vaarg.addr32.in to i32*
  %12 = load i32* %vaarg.addr32, align 4
  %cmp33 = icmp eq i32 %12, 120
  br i1 %cmp33, label %if.end36, label %if.then35

if.then35:                                        ; preds = %vaarg.end31
  call void @abort() noreturn nounwind
  unreachable

if.end36:                                         ; preds = %vaarg.end31
  %fits_in_gp40 = icmp ult i32 %gp_offset39, 41
  br i1 %fits_in_gp40, label %vaarg.in_reg41, label %vaarg.in_mem43

vaarg.in_reg41:                                   ; preds = %if.end36
  %13 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 3
  %reg_save_area42 = load i8** %13, align 16
  %14 = sext i32 %gp_offset39 to i64
  %15 = getelementptr i8* %reg_save_area42, i64 %14
  %16 = add i32 %gp_offset39, 8
  store i32 %16, i32* %gp_offset_p, align 16
  br label %vaarg.end47

vaarg.in_mem43:                                   ; preds = %if.end36
  %overflow_arg_area_p44 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 2
  %overflow_arg_area45 = load i8** %overflow_arg_area_p44, align 8
  %overflow_arg_area.next46 = getelementptr i8* %overflow_arg_area45, i64 8
  store i8* %overflow_arg_area.next46, i8** %overflow_arg_area_p44, align 8
  br label %vaarg.end47

vaarg.end47:                                      ; preds = %vaarg.in_mem43, %vaarg.in_reg41
  %vaarg.addr48.in = phi i8* [ %15, %vaarg.in_reg41 ], [ %overflow_arg_area45, %vaarg.in_mem43 ]
  %vaarg.addr48 = bitcast i8* %vaarg.addr48.in to i32*
  %17 = load i32* %vaarg.addr48, align 4
  %cmp49 = icmp eq i32 %17, 0
  br i1 %cmp49, label %if.end52, label %if.then51

if.then51:                                        ; preds = %vaarg.end47
  call void @abort() noreturn nounwind
  unreachable

if.end52:                                         ; preds = %vaarg.end47
  call void @llvm.va_end(i8* %arraydecay15)
  ret void
}

declare void @abort() noreturn nounwind

declare void @llvm.va_start(i8*) nounwind

declare void @llvm.va_end(i8*) nounwind

define i32 @main() noreturn nounwind uwtable {
entry:
  tail call void (%struct.big*, i8*, ...)* @f(%struct.big* byval align 8 @main.x, i8* getelementptr inbounds ([1 x i8]* @.str, i64 0, i64 0), i32 42, i32 120, i32 0)
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn nounwind
