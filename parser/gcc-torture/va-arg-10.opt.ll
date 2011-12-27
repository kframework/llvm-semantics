; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/va-arg-10.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.__va_list_tag = type { i32, i32, i8*, i8* }

@.str = private unnamed_addr constant [17 x i8] c"0123456789abcdef\00", align 1

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

declare void @abort() noreturn

define void @fap(i32 %i, i8* %format, %struct.__va_list_tag* %ap) nounwind uwtable {
entry:
  %apc = alloca [1 x %struct.__va_list_tag], align 16
  %0 = bitcast [1 x %struct.__va_list_tag]* %apc to i8*
  %1 = bitcast %struct.__va_list_tag* %ap to i8*
  call void @llvm.va_copy(i8* %0, i8* %1)
  %call = call i64 @strlen(i8* %format) nounwind
  %sub = sub nsw i32 16, %i
  %conv = sext i32 %sub to i64
  %cmp = icmp eq i64 %call, %conv
  br i1 %cmp, label %while.cond.preheader, label %if.then

while.cond.preheader:                             ; preds = %entry
  %gp_offset_p = getelementptr inbounds %struct.__va_list_tag* %ap, i64 0, i32 0
  %2 = getelementptr inbounds %struct.__va_list_tag* %ap, i64 0, i32 3
  %overflow_arg_area_p = getelementptr inbounds %struct.__va_list_tag* %ap, i64 0, i32 2
  br label %while.cond

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

while.cond:                                       ; preds = %while.cond.preheader, %to_hex.exit
  %indvar10 = phi i64 [ 0, %while.cond.preheader ], [ %indvar.next11, %to_hex.exit ]
  %incdec.ptr8 = getelementptr i8* %format, i64 %indvar10
  %tmp6 = load i8* %incdec.ptr8, align 1
  %tobool = icmp eq i8 %tmp6, 0
  br i1 %tobool, label %while.cond16.preheader, label %while.body

while.cond16.preheader:                           ; preds = %while.cond
  %gp_offset_p26 = getelementptr inbounds [1 x %struct.__va_list_tag]* %apc, i64 0, i64 0, i32 0
  %3 = getelementptr inbounds [1 x %struct.__va_list_tag]* %apc, i64 0, i64 0, i32 3
  %overflow_arg_area_p32 = getelementptr inbounds [1 x %struct.__va_list_tag]* %apc, i64 0, i64 0, i32 2
  br label %while.cond16

while.body:                                       ; preds = %while.cond
  %gp_offset = load i32* %gp_offset_p, align 4
  %fits_in_gp = icmp ult i32 %gp_offset, 41
  br i1 %fits_in_gp, label %vaarg.in_reg, label %vaarg.in_mem

vaarg.in_reg:                                     ; preds = %while.body
  %reg_save_area = load i8** %2, align 8
  %4 = sext i32 %gp_offset to i64
  %5 = getelementptr i8* %reg_save_area, i64 %4
  %6 = add i32 %gp_offset, 8
  store i32 %6, i32* %gp_offset_p, align 4
  br label %vaarg.end

vaarg.in_mem:                                     ; preds = %while.body
  %overflow_arg_area = load i8** %overflow_arg_area_p, align 8
  %overflow_arg_area.next = getelementptr i8* %overflow_arg_area, i64 8
  store i8* %overflow_arg_area.next, i8** %overflow_arg_area_p, align 8
  br label %vaarg.end

vaarg.end:                                        ; preds = %vaarg.in_mem, %vaarg.in_reg
  %vaarg.addr.in = phi i8* [ %5, %vaarg.in_reg ], [ %overflow_arg_area, %vaarg.in_mem ]
  %vaarg.addr = bitcast i8* %vaarg.addr.in to i32*
  %7 = load i32* %vaarg.addr, align 4
  %cmp.i = icmp ugt i32 %7, 15
  br i1 %cmp.i, label %if.then.i, label %to_hex.exit

if.then.i:                                        ; preds = %vaarg.end
  call void @abort() noreturn nounwind
  unreachable

to_hex.exit:                                      ; preds = %vaarg.end
  %idxprom.i = zext i32 %7 to i64
  %arrayidx.i = getelementptr inbounds [17 x i8]* @.str, i64 0, i64 %idxprom.i
  %tmp2.i = load i8* %arrayidx.i, align 1
  %cmp12 = icmp eq i8 %tmp6, %tmp2.i
  %indvar.next11 = add i64 %indvar10, 1
  br i1 %cmp12, label %while.cond, label %if.then14

if.then14:                                        ; preds = %to_hex.exit
  call void @abort() noreturn nounwind
  unreachable

while.cond16:                                     ; preds = %while.cond16.preheader, %to_hex.exit7
  %indvar = phi i64 [ 0, %while.cond16.preheader ], [ %indvar.next, %to_hex.exit7 ]
  %incdec.ptr229 = getelementptr i8* %format, i64 %indvar
  %tmp18 = load i8* %incdec.ptr229, align 1
  %tobool19 = icmp eq i8 %tmp18, 0
  br i1 %tobool19, label %while.end42, label %while.body20

while.body20:                                     ; preds = %while.cond16
  %gp_offset27 = load i32* %gp_offset_p26, align 16
  %fits_in_gp28 = icmp ult i32 %gp_offset27, 41
  br i1 %fits_in_gp28, label %vaarg.in_reg29, label %vaarg.in_mem31

vaarg.in_reg29:                                   ; preds = %while.body20
  %reg_save_area30 = load i8** %3, align 16
  %8 = sext i32 %gp_offset27 to i64
  %9 = getelementptr i8* %reg_save_area30, i64 %8
  %10 = add i32 %gp_offset27, 8
  store i32 %10, i32* %gp_offset_p26, align 16
  br label %vaarg.end35

vaarg.in_mem31:                                   ; preds = %while.body20
  %overflow_arg_area33 = load i8** %overflow_arg_area_p32, align 8
  %overflow_arg_area.next34 = getelementptr i8* %overflow_arg_area33, i64 8
  store i8* %overflow_arg_area.next34, i8** %overflow_arg_area_p32, align 8
  br label %vaarg.end35

vaarg.end35:                                      ; preds = %vaarg.in_mem31, %vaarg.in_reg29
  %vaarg.addr36.in = phi i8* [ %9, %vaarg.in_reg29 ], [ %overflow_arg_area33, %vaarg.in_mem31 ]
  %vaarg.addr36 = bitcast i8* %vaarg.addr36.in to i32*
  %11 = load i32* %vaarg.addr36, align 4
  %cmp.i1 = icmp ugt i32 %11, 15
  br i1 %cmp.i1, label %if.then.i2, label %to_hex.exit7

if.then.i2:                                       ; preds = %vaarg.end35
  call void @abort() noreturn nounwind
  unreachable

to_hex.exit7:                                     ; preds = %vaarg.end35
  %idxprom.i3 = zext i32 %11 to i64
  %arrayidx.i4 = getelementptr inbounds [17 x i8]* @.str, i64 0, i64 %idxprom.i3
  %tmp2.i5 = load i8* %arrayidx.i4, align 1
  %cmp38 = icmp eq i8 %tmp18, %tmp2.i5
  %indvar.next = add i64 %indvar, 1
  br i1 %cmp38, label %while.cond16, label %if.then40

if.then40:                                        ; preds = %to_hex.exit7
  call void @abort() noreturn nounwind
  unreachable

while.end42:                                      ; preds = %while.cond16
  ret void
}

declare void @llvm.va_copy(i8*, i8*) nounwind

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

declare void @exit(i32) noreturn
