; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/strct-stdarg-1.ll'
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

define void @f(i32 %n, ...) nounwind uwtable {
entry:
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  %arraydecay1 = bitcast [1 x %struct.__va_list_tag]* %ap to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %gp_offset_p = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 0
  %0 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 3
  %overflow_arg_area_p = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 2
  %gp_offset.pre = load i32* %gp_offset_p, align 16
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %gp_offset = phi i32 [ %gp_offset.pre, %entry ], [ %gp_offset38, %for.inc ]
  %1 = phi i32 [ 0, %entry ], [ %inc, %for.inc ]
  %add37 = add i32 %1, 50
  %add29 = add i32 %1, 40
  %add21 = add i32 %1, 30
  %add13 = add i32 %1, 20
  %add = add i32 %1, 10
  %cmp = icmp slt i32 %1, %n
  %fits_in_gp = icmp ult i32 %gp_offset, 41
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  br i1 %fits_in_gp, label %vaarg.in_reg, label %vaarg.in_mem

vaarg.in_reg:                                     ; preds = %for.body
  %reg_save_area = load i8** %0, align 16
  %2 = sext i32 %gp_offset to i64
  %3 = getelementptr i8* %reg_save_area, i64 %2
  %4 = add i32 %gp_offset, 8
  store i32 %4, i32* %gp_offset_p, align 16
  br label %vaarg.end

vaarg.in_mem:                                     ; preds = %for.body
  %overflow_arg_area = load i8** %overflow_arg_area_p, align 8
  %overflow_arg_area.next = getelementptr i8* %overflow_arg_area, i64 8
  store i8* %overflow_arg_area.next, i8** %overflow_arg_area_p, align 8
  br label %vaarg.end

vaarg.end:                                        ; preds = %vaarg.in_mem, %vaarg.in_reg
  %gp_offset38 = phi i32 [ %4, %vaarg.in_reg ], [ %gp_offset, %vaarg.in_mem ]
  %vaarg.addr.in = phi i8* [ %3, %vaarg.in_reg ], [ %overflow_arg_area, %vaarg.in_mem ]
  %tmp = load i8* %vaarg.addr.in, align 1
  %5 = getelementptr inbounds i8* %vaarg.addr.in, i64 2
  %tmp3 = load i8* %5, align 1
  %6 = getelementptr inbounds i8* %vaarg.addr.in, i64 3
  %tmp5 = load i8* %6, align 1
  %7 = getelementptr inbounds i8* %vaarg.addr.in, i64 4
  %tmp7 = load i8* %7, align 1
  %conv = sext i8 %tmp to i32
  %cmp8 = icmp eq i32 %conv, %add
  br i1 %cmp8, label %if.end, label %if.then

if.then:                                          ; preds = %vaarg.end
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %vaarg.end
  %8 = getelementptr inbounds i8* %vaarg.addr.in, i64 1
  %tmp2 = load i8* %8, align 1
  %conv11 = sext i8 %tmp2 to i32
  %cmp14 = icmp eq i32 %conv11, %add13
  br i1 %cmp14, label %if.end17, label %if.then16

if.then16:                                        ; preds = %if.end
  call void @abort() noreturn nounwind
  unreachable

if.end17:                                         ; preds = %if.end
  %conv19 = sext i8 %tmp3 to i32
  %cmp22 = icmp eq i32 %conv19, %add21
  br i1 %cmp22, label %if.end25, label %if.then24

if.then24:                                        ; preds = %if.end17
  call void @abort() noreturn nounwind
  unreachable

if.end25:                                         ; preds = %if.end17
  %conv27 = sext i8 %tmp5 to i32
  %cmp30 = icmp eq i32 %conv27, %add29
  br i1 %cmp30, label %if.end33, label %if.then32

if.then32:                                        ; preds = %if.end25
  call void @abort() noreturn nounwind
  unreachable

if.end33:                                         ; preds = %if.end25
  %conv35 = sext i8 %tmp7 to i32
  %cmp38 = icmp eq i32 %conv35, %add37
  br i1 %cmp38, label %for.inc, label %if.then40

if.then40:                                        ; preds = %if.end33
  call void @abort() noreturn nounwind
  unreachable

for.inc:                                          ; preds = %if.end33
  %inc = add nsw i32 %1, 1
  br label %for.cond

for.end:                                          ; preds = %for.cond
  br i1 %fits_in_gp, label %vaarg.in_reg49, label %vaarg.in_mem51

vaarg.in_reg49:                                   ; preds = %for.end
  %reg_save_area50 = load i8** %0, align 16
  %9 = sext i32 %gp_offset to i64
  %10 = getelementptr i8* %reg_save_area50, i64 %9
  %11 = add i32 %gp_offset, 8
  store i32 %11, i32* %gp_offset_p, align 16
  br label %vaarg.end55

vaarg.in_mem51:                                   ; preds = %for.end
  %overflow_arg_area53 = load i8** %overflow_arg_area_p, align 8
  %overflow_arg_area.next54 = getelementptr i8* %overflow_arg_area53, i64 8
  store i8* %overflow_arg_area.next54, i8** %overflow_arg_area_p, align 8
  br label %vaarg.end55

vaarg.end55:                                      ; preds = %vaarg.in_mem51, %vaarg.in_reg49
  %vaarg.addr56.in = phi i8* [ %10, %vaarg.in_reg49 ], [ %overflow_arg_area53, %vaarg.in_mem51 ]
  %vaarg.addr56 = bitcast i8* %vaarg.addr56.in to i64*
  %12 = load i64* %vaarg.addr56, align 8
  %cmp58 = icmp eq i64 %12, 123
  br i1 %cmp58, label %if.end61, label %if.then60

if.then60:                                        ; preds = %vaarg.end55
  call void @abort() noreturn nounwind
  unreachable

if.end61:                                         ; preds = %vaarg.end55
  call void @llvm.va_end(i8* %arraydecay1)
  ret void
}

declare void @llvm.va_start(i8*) nounwind

declare void @abort() noreturn nounwind

declare void @llvm.va_end(i8*) nounwind

define i32 @main() noreturn nounwind uwtable {
entry:
  tail call void (i32, ...)* @f(i32 3, i40 215421424650, i40 219733234955, i40 224045045260, i64 123)
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn nounwind
