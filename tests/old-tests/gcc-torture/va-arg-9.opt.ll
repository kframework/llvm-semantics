; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/va-arg-9.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.__va_list_tag = type { i32, i32, i8*, i8* }

@.str = private unnamed_addr constant [17 x i8] c"0123456789abcdef\00", align 1

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

define i32 @to_hex(i32 %a) nounwind uwtable {
entry:
  %cmp = icmp ugt i32 %a, 15
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  %idxprom = zext i32 %a to i64
  %arrayidx = getelementptr inbounds [17 x i8]* @.str, i64 0, i64 %idxprom
  %tmp2 = load i8* %arrayidx, align 1
  %conv = sext i8 %tmp2 to i32
  ret i32 %conv
}

declare void @abort() noreturn nounwind

define void @fap(i32 %i, i8* %format, %struct.__va_list_tag* %ap) nounwind uwtable {
entry:
  %call = tail call i64 @strlen(i8* %format) nounwind
  %sub = sub nsw i32 16, %i
  %conv = sext i32 %sub to i64
  %cmp = icmp eq i64 %call, %conv
  br i1 %cmp, label %while.cond.preheader, label %if.then

while.cond.preheader:                             ; preds = %entry
  %gp_offset_p = getelementptr inbounds %struct.__va_list_tag* %ap, i64 0, i32 0
  %0 = getelementptr inbounds %struct.__va_list_tag* %ap, i64 0, i32 3
  %overflow_arg_area_p = getelementptr inbounds %struct.__va_list_tag* %ap, i64 0, i32 2
  br label %while.cond

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

while.cond:                                       ; preds = %while.cond.preheader, %to_hex.exit
  %indvar = phi i64 [ 0, %while.cond.preheader ], [ %indvar.next, %to_hex.exit ]
  %incdec.ptr1 = getelementptr i8* %format, i64 %indvar
  %tmp4 = load i8* %incdec.ptr1, align 1
  %tobool = icmp eq i8 %tmp4, 0
  br i1 %tobool, label %while.end, label %while.body

while.body:                                       ; preds = %while.cond
  %gp_offset = load i32* %gp_offset_p, align 4
  %fits_in_gp = icmp ult i32 %gp_offset, 41
  br i1 %fits_in_gp, label %vaarg.in_reg, label %vaarg.in_mem

vaarg.in_reg:                                     ; preds = %while.body
  %reg_save_area = load i8** %0, align 8
  %1 = sext i32 %gp_offset to i64
  %2 = getelementptr i8* %reg_save_area, i64 %1
  %3 = add i32 %gp_offset, 8
  store i32 %3, i32* %gp_offset_p, align 4
  br label %vaarg.end

vaarg.in_mem:                                     ; preds = %while.body
  %overflow_arg_area = load i8** %overflow_arg_area_p, align 8
  %overflow_arg_area.next = getelementptr i8* %overflow_arg_area, i64 8
  store i8* %overflow_arg_area.next, i8** %overflow_arg_area_p, align 8
  br label %vaarg.end

vaarg.end:                                        ; preds = %vaarg.in_mem, %vaarg.in_reg
  %vaarg.addr.in = phi i8* [ %2, %vaarg.in_reg ], [ %overflow_arg_area, %vaarg.in_mem ]
  %vaarg.addr = bitcast i8* %vaarg.addr.in to i32*
  %4 = load i32* %vaarg.addr, align 4
  %cmp.i = icmp ugt i32 %4, 15
  br i1 %cmp.i, label %if.then.i, label %to_hex.exit

if.then.i:                                        ; preds = %vaarg.end
  tail call void @abort() noreturn nounwind
  unreachable

to_hex.exit:                                      ; preds = %vaarg.end
  %idxprom.i = zext i32 %4 to i64
  %arrayidx.i = getelementptr inbounds [17 x i8]* @.str, i64 0, i64 %idxprom.i
  %tmp2.i = load i8* %arrayidx.i, align 1
  %cmp10 = icmp eq i8 %tmp4, %tmp2.i
  %indvar.next = add i64 %indvar, 1
  br i1 %cmp10, label %while.cond, label %if.then12

if.then12:                                        ; preds = %to_hex.exit
  tail call void @abort() noreturn nounwind
  unreachable

while.end:                                        ; preds = %while.cond
  ret void
}

declare i64 @strlen(i8* nocapture) nounwind readonly

define void @f0(i8* %format, ...) nounwind uwtable {
entry:
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  %arraydecay1 = bitcast [1 x %struct.__va_list_tag]* %ap to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %arraydecay2 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0
  call void @fap(i32 0, i8* %format, %struct.__va_list_tag* %arraydecay2)
  call void @llvm.va_end(i8* %arraydecay1)
  ret void
}

declare void @llvm.va_start(i8*) nounwind

declare void @llvm.va_end(i8*) nounwind

define void @f1(i32 %a1, i8* %format, ...) nounwind uwtable {
entry:
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  %arraydecay1 = bitcast [1 x %struct.__va_list_tag]* %ap to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %arraydecay2 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0
  call void @fap(i32 1, i8* %format, %struct.__va_list_tag* %arraydecay2)
  call void @llvm.va_end(i8* %arraydecay1)
  ret void
}

define void @f2(i32 %a1, i32 %a2, i8* %format, ...) nounwind uwtable {
entry:
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  %arraydecay1 = bitcast [1 x %struct.__va_list_tag]* %ap to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %arraydecay2 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0
  call void @fap(i32 2, i8* %format, %struct.__va_list_tag* %arraydecay2)
  call void @llvm.va_end(i8* %arraydecay1)
  ret void
}

define void @f3(i32 %a1, i32 %a2, i32 %a3, i8* %format, ...) nounwind uwtable {
entry:
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  %arraydecay1 = bitcast [1 x %struct.__va_list_tag]* %ap to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %arraydecay2 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0
  call void @fap(i32 3, i8* %format, %struct.__va_list_tag* %arraydecay2)
  call void @llvm.va_end(i8* %arraydecay1)
  ret void
}

define void @f4(i32 %a1, i32 %a2, i32 %a3, i32 %a4, i8* %format, ...) nounwind uwtable {
entry:
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  %arraydecay1 = bitcast [1 x %struct.__va_list_tag]* %ap to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %arraydecay2 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0
  call void @fap(i32 4, i8* %format, %struct.__va_list_tag* %arraydecay2)
  call void @llvm.va_end(i8* %arraydecay1)
  ret void
}

define void @f5(i32 %a1, i32 %a2, i32 %a3, i32 %a4, i32 %a5, i8* %format, ...) nounwind uwtable {
entry:
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  %arraydecay1 = bitcast [1 x %struct.__va_list_tag]* %ap to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %arraydecay2 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0
  call void @fap(i32 5, i8* %format, %struct.__va_list_tag* %arraydecay2)
  call void @llvm.va_end(i8* %arraydecay1)
  ret void
}

define void @f6(i32 %a1, i32 %a2, i32 %a3, i32 %a4, i32 %a5, i32 %a6, i8* %format, ...) nounwind uwtable {
entry:
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  %arraydecay1 = bitcast [1 x %struct.__va_list_tag]* %ap to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %arraydecay2 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0
  call void @fap(i32 6, i8* %format, %struct.__va_list_tag* %arraydecay2)
  call void @llvm.va_end(i8* %arraydecay1)
  ret void
}

define void @f7(i32 %a1, i32 %a2, i32 %a3, i32 %a4, i32 %a5, i32 %a6, i32 %a7, i8* %format, ...) nounwind uwtable {
entry:
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  %arraydecay1 = bitcast [1 x %struct.__va_list_tag]* %ap to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %arraydecay2 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0
  call void @fap(i32 7, i8* %format, %struct.__va_list_tag* %arraydecay2)
  call void @llvm.va_end(i8* %arraydecay1)
  ret void
}

define void @f8(i32 %a1, i32 %a2, i32 %a3, i32 %a4, i32 %a5, i32 %a6, i32 %a7, i32 %a8, i8* %format, ...) nounwind uwtable {
entry:
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  %arraydecay1 = bitcast [1 x %struct.__va_list_tag]* %ap to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %arraydecay2 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0
  call void @fap(i32 8, i8* %format, %struct.__va_list_tag* %arraydecay2)
  call void @llvm.va_end(i8* %arraydecay1)
  ret void
}

define void @f9(i32 %a1, i32 %a2, i32 %a3, i32 %a4, i32 %a5, i32 %a6, i32 %a7, i32 %a8, i32 %a9, i8* %format, ...) nounwind uwtable {
entry:
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  %arraydecay1 = bitcast [1 x %struct.__va_list_tag]* %ap to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %arraydecay2 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0
  call void @fap(i32 9, i8* %format, %struct.__va_list_tag* %arraydecay2)
  call void @llvm.va_end(i8* %arraydecay1)
  ret void
}

define void @f10(i32 %a1, i32 %a2, i32 %a3, i32 %a4, i32 %a5, i32 %a6, i32 %a7, i32 %a8, i32 %a9, i32 %a10, i8* %format, ...) nounwind uwtable {
entry:
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  %arraydecay1 = bitcast [1 x %struct.__va_list_tag]* %ap to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %arraydecay2 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0
  call void @fap(i32 10, i8* %format, %struct.__va_list_tag* %arraydecay2)
  call void @llvm.va_end(i8* %arraydecay1)
  ret void
}

define void @f11(i32 %a1, i32 %a2, i32 %a3, i32 %a4, i32 %a5, i32 %a6, i32 %a7, i32 %a8, i32 %a9, i32 %a10, i32 %a11, i8* %format, ...) nounwind uwtable {
entry:
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  %arraydecay1 = bitcast [1 x %struct.__va_list_tag]* %ap to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %arraydecay2 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0
  call void @fap(i32 11, i8* %format, %struct.__va_list_tag* %arraydecay2)
  call void @llvm.va_end(i8* %arraydecay1)
  ret void
}

define void @f12(i32 %a1, i32 %a2, i32 %a3, i32 %a4, i32 %a5, i32 %a6, i32 %a7, i32 %a8, i32 %a9, i32 %a10, i32 %a11, i32 %a12, i8* %format, ...) nounwind uwtable {
entry:
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  %arraydecay1 = bitcast [1 x %struct.__va_list_tag]* %ap to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %arraydecay2 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0
  call void @fap(i32 12, i8* %format, %struct.__va_list_tag* %arraydecay2)
  call void @llvm.va_end(i8* %arraydecay1)
  ret void
}

define void @f13(i32 %a1, i32 %a2, i32 %a3, i32 %a4, i32 %a5, i32 %a6, i32 %a7, i32 %a8, i32 %a9, i32 %a10, i32 %a11, i32 %a12, i32 %a13, i8* %format, ...) nounwind uwtable {
entry:
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  %arraydecay1 = bitcast [1 x %struct.__va_list_tag]* %ap to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %arraydecay2 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0
  call void @fap(i32 13, i8* %format, %struct.__va_list_tag* %arraydecay2)
  call void @llvm.va_end(i8* %arraydecay1)
  ret void
}

define void @f14(i32 %a1, i32 %a2, i32 %a3, i32 %a4, i32 %a5, i32 %a6, i32 %a7, i32 %a8, i32 %a9, i32 %a10, i32 %a11, i32 %a12, i32 %a13, i32 %a14, i8* %format, ...) nounwind uwtable {
entry:
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  %arraydecay1 = bitcast [1 x %struct.__va_list_tag]* %ap to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %arraydecay2 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0
  call void @fap(i32 14, i8* %format, %struct.__va_list_tag* %arraydecay2)
  call void @llvm.va_end(i8* %arraydecay1)
  ret void
}

define void @f15(i32 %a1, i32 %a2, i32 %a3, i32 %a4, i32 %a5, i32 %a6, i32 %a7, i32 %a8, i32 %a9, i32 %a10, i32 %a11, i32 %a12, i32 %a13, i32 %a14, i32 %a15, i8* %format, ...) nounwind uwtable {
entry:
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  %arraydecay1 = bitcast [1 x %struct.__va_list_tag]* %ap to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %arraydecay2 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0
  call void @fap(i32 15, i8* %format, %struct.__va_list_tag* %arraydecay2)
  call void @llvm.va_end(i8* %arraydecay1)
  ret void
}

define i32 @main() noreturn nounwind uwtable {
entry:
  tail call void (i8*, ...)* @f0(i8* getelementptr inbounds ([17 x i8]* @.str, i64 0, i64 0), i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15)
  tail call void (i32, i8*, ...)* @f1(i32 0, i8* getelementptr inbounds ([17 x i8]* @.str, i64 0, i64 1), i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15)
  tail call void (i32, i32, i8*, ...)* @f2(i32 0, i32 1, i8* getelementptr inbounds ([17 x i8]* @.str, i64 0, i64 2), i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15)
  tail call void (i32, i32, i32, i8*, ...)* @f3(i32 0, i32 1, i32 2, i8* getelementptr inbounds ([17 x i8]* @.str, i64 0, i64 3), i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15)
  tail call void (i32, i32, i32, i32, i8*, ...)* @f4(i32 0, i32 1, i32 2, i32 3, i8* getelementptr inbounds ([17 x i8]* @.str, i64 0, i64 4), i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15)
  tail call void (i32, i32, i32, i32, i32, i8*, ...)* @f5(i32 0, i32 1, i32 2, i32 3, i32 4, i8* getelementptr inbounds ([17 x i8]* @.str, i64 0, i64 5), i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15)
  tail call void (i32, i32, i32, i32, i32, i32, i8*, ...)* @f6(i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i8* getelementptr inbounds ([17 x i8]* @.str, i64 0, i64 6), i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15)
  tail call void (i32, i32, i32, i32, i32, i32, i32, i8*, ...)* @f7(i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i8* getelementptr inbounds ([17 x i8]* @.str, i64 0, i64 7), i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15)
  tail call void (i32, i32, i32, i32, i32, i32, i32, i32, i8*, ...)* @f8(i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i8* getelementptr inbounds ([17 x i8]* @.str, i64 0, i64 8), i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15)
  tail call void (i32, i32, i32, i32, i32, i32, i32, i32, i32, i8*, ...)* @f9(i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i8* getelementptr inbounds ([17 x i8]* @.str, i64 0, i64 9), i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15)
  tail call void (i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i8*, ...)* @f10(i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i8* getelementptr inbounds ([17 x i8]* @.str, i64 0, i64 10), i32 10, i32 11, i32 12, i32 13, i32 14, i32 15)
  tail call void (i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i8*, ...)* @f11(i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i8* getelementptr inbounds ([17 x i8]* @.str, i64 0, i64 11), i32 11, i32 12, i32 13, i32 14, i32 15)
  tail call void (i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i8*, ...)* @f12(i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i8* getelementptr inbounds ([17 x i8]* @.str, i64 0, i64 12), i32 12, i32 13, i32 14, i32 15)
  tail call void (i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i8*, ...)* @f13(i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i8* getelementptr inbounds ([17 x i8]* @.str, i64 0, i64 13), i32 13, i32 14, i32 15)
  tail call void (i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i8*, ...)* @f14(i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i8* getelementptr inbounds ([17 x i8]* @.str, i64 0, i64 14), i32 14, i32 15)
  tail call void (i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i8*, ...)* @f15(i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i8* getelementptr inbounds ([17 x i8]* @.str, i64 0, i64 15), i32 15)
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn nounwind
