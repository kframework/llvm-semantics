; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/va-arg-10.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.__va_list_tag = type { i32, i32, i8*, i8* }

@to_hex.hex = internal global [17 x i8] c"0123456789abcdef\00", align 16
@.str = private unnamed_addr constant [17 x i8] c"0123456789abcdef\00", align 1

define i32 @to_hex(i32 %a) nounwind uwtable {
entry:
  %a.addr = alloca i32, align 4
  store i32 %a, i32* %a.addr, align 4
  %tmp = load i32* %a.addr, align 4
  %cmp = icmp ugt i32 %tmp, 15
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn
  unreachable

if.end:                                           ; preds = %entry
  %tmp1 = load i32* %a.addr, align 4
  %idxprom = zext i32 %tmp1 to i64
  %arrayidx = getelementptr inbounds [17 x i8]* @to_hex.hex, i32 0, i64 %idxprom
  %tmp2 = load i8* %arrayidx, align 1
  %conv = sext i8 %tmp2 to i32
  ret i32 %conv
}

declare void @abort() noreturn

define void @fap(i32 %i, i8* %format, %struct.__va_list_tag* %ap) nounwind uwtable {
entry:
  %i.addr = alloca i32, align 4
  %format.addr = alloca i8*, align 8
  %ap.addr = alloca %struct.__va_list_tag*, align 8
  %apc = alloca [1 x %struct.__va_list_tag], align 16
  %formatc = alloca i8*, align 8
  store i32 %i, i32* %i.addr, align 4
  store i8* %format, i8** %format.addr, align 8
  store %struct.__va_list_tag* %ap, %struct.__va_list_tag** %ap.addr, align 8
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %apc, i32 0, i32 0
  %tmp = load %struct.__va_list_tag** %ap.addr, align 8
  %0 = bitcast %struct.__va_list_tag* %arraydecay to i8*
  %1 = bitcast %struct.__va_list_tag* %tmp to i8*
  call void @llvm.va_copy(i8* %0, i8* %1)
  %tmp1 = load i8** %format.addr, align 8
  store i8* %tmp1, i8** %formatc, align 8
  %tmp2 = load i8** %format.addr, align 8
  %call = call i64 @strlen(i8* %tmp2)
  %tmp3 = load i32* %i.addr, align 4
  %sub = sub nsw i32 16, %tmp3
  %conv = sext i32 %sub to i64
  %cmp = icmp ne i64 %call, %conv
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn
  unreachable

if.end:                                           ; preds = %entry
  br label %while.cond

while.cond:                                       ; preds = %if.end15, %if.end
  %tmp5 = load i8** %format.addr, align 8
  %tmp6 = load i8* %tmp5
  %tobool = icmp ne i8 %tmp6, 0
  br i1 %tobool, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %tmp7 = load i8** %format.addr, align 8
  %incdec.ptr = getelementptr inbounds i8* %tmp7, i32 1
  store i8* %incdec.ptr, i8** %format.addr, align 8
  %tmp8 = load i8* %tmp7
  %conv9 = sext i8 %tmp8 to i32
  %tmp10 = load %struct.__va_list_tag** %ap.addr, align 8
  %gp_offset_p = getelementptr inbounds %struct.__va_list_tag* %tmp10, i32 0, i32 0
  %gp_offset = load i32* %gp_offset_p
  %fits_in_gp = icmp ule i32 %gp_offset, 40
  br i1 %fits_in_gp, label %vaarg.in_reg, label %vaarg.in_mem

vaarg.in_reg:                                     ; preds = %while.body
  %2 = getelementptr inbounds %struct.__va_list_tag* %tmp10, i32 0, i32 3
  %reg_save_area = load i8** %2
  %3 = getelementptr i8* %reg_save_area, i32 %gp_offset
  %4 = bitcast i8* %3 to i32*
  %5 = add i32 %gp_offset, 8
  store i32 %5, i32* %gp_offset_p
  br label %vaarg.end

vaarg.in_mem:                                     ; preds = %while.body
  %overflow_arg_area_p = getelementptr inbounds %struct.__va_list_tag* %tmp10, i32 0, i32 2
  %overflow_arg_area = load i8** %overflow_arg_area_p
  %6 = bitcast i8* %overflow_arg_area to i32*
  %overflow_arg_area.next = getelementptr i8* %overflow_arg_area, i32 8
  store i8* %overflow_arg_area.next, i8** %overflow_arg_area_p
  br label %vaarg.end

vaarg.end:                                        ; preds = %vaarg.in_mem, %vaarg.in_reg
  %vaarg.addr = phi i32* [ %4, %vaarg.in_reg ], [ %6, %vaarg.in_mem ]
  %7 = load i32* %vaarg.addr
  %call11 = call i32 @to_hex(i32 %7)
  %cmp12 = icmp ne i32 %conv9, %call11
  br i1 %cmp12, label %if.then14, label %if.end15

if.then14:                                        ; preds = %vaarg.end
  call void @abort() noreturn
  unreachable

if.end15:                                         ; preds = %vaarg.end
  br label %while.cond

while.end:                                        ; preds = %while.cond
  br label %while.cond16

while.cond16:                                     ; preds = %if.end41, %while.end
  %tmp17 = load i8** %formatc, align 8
  %tmp18 = load i8* %tmp17
  %tobool19 = icmp ne i8 %tmp18, 0
  br i1 %tobool19, label %while.body20, label %while.end42

while.body20:                                     ; preds = %while.cond16
  %tmp21 = load i8** %formatc, align 8
  %incdec.ptr22 = getelementptr inbounds i8* %tmp21, i32 1
  store i8* %incdec.ptr22, i8** %formatc, align 8
  %tmp23 = load i8* %tmp21
  %conv24 = sext i8 %tmp23 to i32
  %arraydecay25 = getelementptr inbounds [1 x %struct.__va_list_tag]* %apc, i32 0, i32 0
  %gp_offset_p26 = getelementptr inbounds %struct.__va_list_tag* %arraydecay25, i32 0, i32 0
  %gp_offset27 = load i32* %gp_offset_p26
  %fits_in_gp28 = icmp ule i32 %gp_offset27, 40
  br i1 %fits_in_gp28, label %vaarg.in_reg29, label %vaarg.in_mem31

vaarg.in_reg29:                                   ; preds = %while.body20
  %8 = getelementptr inbounds %struct.__va_list_tag* %arraydecay25, i32 0, i32 3
  %reg_save_area30 = load i8** %8
  %9 = getelementptr i8* %reg_save_area30, i32 %gp_offset27
  %10 = bitcast i8* %9 to i32*
  %11 = add i32 %gp_offset27, 8
  store i32 %11, i32* %gp_offset_p26
  br label %vaarg.end35

vaarg.in_mem31:                                   ; preds = %while.body20
  %overflow_arg_area_p32 = getelementptr inbounds %struct.__va_list_tag* %arraydecay25, i32 0, i32 2
  %overflow_arg_area33 = load i8** %overflow_arg_area_p32
  %12 = bitcast i8* %overflow_arg_area33 to i32*
  %overflow_arg_area.next34 = getelementptr i8* %overflow_arg_area33, i32 8
  store i8* %overflow_arg_area.next34, i8** %overflow_arg_area_p32
  br label %vaarg.end35

vaarg.end35:                                      ; preds = %vaarg.in_mem31, %vaarg.in_reg29
  %vaarg.addr36 = phi i32* [ %10, %vaarg.in_reg29 ], [ %12, %vaarg.in_mem31 ]
  %13 = load i32* %vaarg.addr36
  %call37 = call i32 @to_hex(i32 %13)
  %cmp38 = icmp ne i32 %conv24, %call37
  br i1 %cmp38, label %if.then40, label %if.end41

if.then40:                                        ; preds = %vaarg.end35
  call void @abort() noreturn
  unreachable

if.end41:                                         ; preds = %vaarg.end35
  br label %while.cond16

while.end42:                                      ; preds = %while.cond16
  ret void
}

declare void @llvm.va_copy(i8*, i8*) nounwind

declare i64 @strlen(i8*)

define void @f0(i8* %format, ...) nounwind uwtable {
entry:
  %format.addr = alloca i8*, align 8
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  store i8* %format, i8** %format.addr, align 8
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %arraydecay1 = bitcast %struct.__va_list_tag* %arraydecay to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %tmp = load i8** %format.addr, align 8
  %arraydecay2 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  call void @fap(i32 0, i8* %tmp, %struct.__va_list_tag* %arraydecay2)
  %arraydecay3 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %arraydecay34 = bitcast %struct.__va_list_tag* %arraydecay3 to i8*
  call void @llvm.va_end(i8* %arraydecay34)
  ret void
}

declare void @llvm.va_start(i8*) nounwind

declare void @llvm.va_end(i8*) nounwind

define void @f1(i32 %a1, i8* %format, ...) nounwind uwtable {
entry:
  %a1.addr = alloca i32, align 4
  %format.addr = alloca i8*, align 8
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  store i32 %a1, i32* %a1.addr, align 4
  store i8* %format, i8** %format.addr, align 8
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %arraydecay1 = bitcast %struct.__va_list_tag* %arraydecay to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %tmp = load i8** %format.addr, align 8
  %arraydecay2 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  call void @fap(i32 1, i8* %tmp, %struct.__va_list_tag* %arraydecay2)
  %arraydecay3 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %arraydecay34 = bitcast %struct.__va_list_tag* %arraydecay3 to i8*
  call void @llvm.va_end(i8* %arraydecay34)
  ret void
}

define void @f2(i32 %a1, i32 %a2, i8* %format, ...) nounwind uwtable {
entry:
  %a1.addr = alloca i32, align 4
  %a2.addr = alloca i32, align 4
  %format.addr = alloca i8*, align 8
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  store i32 %a1, i32* %a1.addr, align 4
  store i32 %a2, i32* %a2.addr, align 4
  store i8* %format, i8** %format.addr, align 8
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %arraydecay1 = bitcast %struct.__va_list_tag* %arraydecay to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %tmp = load i8** %format.addr, align 8
  %arraydecay2 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  call void @fap(i32 2, i8* %tmp, %struct.__va_list_tag* %arraydecay2)
  %arraydecay3 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %arraydecay34 = bitcast %struct.__va_list_tag* %arraydecay3 to i8*
  call void @llvm.va_end(i8* %arraydecay34)
  ret void
}

define void @f3(i32 %a1, i32 %a2, i32 %a3, i8* %format, ...) nounwind uwtable {
entry:
  %a1.addr = alloca i32, align 4
  %a2.addr = alloca i32, align 4
  %a3.addr = alloca i32, align 4
  %format.addr = alloca i8*, align 8
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  store i32 %a1, i32* %a1.addr, align 4
  store i32 %a2, i32* %a2.addr, align 4
  store i32 %a3, i32* %a3.addr, align 4
  store i8* %format, i8** %format.addr, align 8
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %arraydecay1 = bitcast %struct.__va_list_tag* %arraydecay to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %tmp = load i8** %format.addr, align 8
  %arraydecay2 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  call void @fap(i32 3, i8* %tmp, %struct.__va_list_tag* %arraydecay2)
  %arraydecay3 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %arraydecay34 = bitcast %struct.__va_list_tag* %arraydecay3 to i8*
  call void @llvm.va_end(i8* %arraydecay34)
  ret void
}

define void @f4(i32 %a1, i32 %a2, i32 %a3, i32 %a4, i8* %format, ...) nounwind uwtable {
entry:
  %a1.addr = alloca i32, align 4
  %a2.addr = alloca i32, align 4
  %a3.addr = alloca i32, align 4
  %a4.addr = alloca i32, align 4
  %format.addr = alloca i8*, align 8
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  store i32 %a1, i32* %a1.addr, align 4
  store i32 %a2, i32* %a2.addr, align 4
  store i32 %a3, i32* %a3.addr, align 4
  store i32 %a4, i32* %a4.addr, align 4
  store i8* %format, i8** %format.addr, align 8
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %arraydecay1 = bitcast %struct.__va_list_tag* %arraydecay to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %tmp = load i8** %format.addr, align 8
  %arraydecay2 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  call void @fap(i32 4, i8* %tmp, %struct.__va_list_tag* %arraydecay2)
  %arraydecay3 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %arraydecay34 = bitcast %struct.__va_list_tag* %arraydecay3 to i8*
  call void @llvm.va_end(i8* %arraydecay34)
  ret void
}

define void @f5(i32 %a1, i32 %a2, i32 %a3, i32 %a4, i32 %a5, i8* %format, ...) nounwind uwtable {
entry:
  %a1.addr = alloca i32, align 4
  %a2.addr = alloca i32, align 4
  %a3.addr = alloca i32, align 4
  %a4.addr = alloca i32, align 4
  %a5.addr = alloca i32, align 4
  %format.addr = alloca i8*, align 8
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  store i32 %a1, i32* %a1.addr, align 4
  store i32 %a2, i32* %a2.addr, align 4
  store i32 %a3, i32* %a3.addr, align 4
  store i32 %a4, i32* %a4.addr, align 4
  store i32 %a5, i32* %a5.addr, align 4
  store i8* %format, i8** %format.addr, align 8
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %arraydecay1 = bitcast %struct.__va_list_tag* %arraydecay to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %tmp = load i8** %format.addr, align 8
  %arraydecay2 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  call void @fap(i32 5, i8* %tmp, %struct.__va_list_tag* %arraydecay2)
  %arraydecay3 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %arraydecay34 = bitcast %struct.__va_list_tag* %arraydecay3 to i8*
  call void @llvm.va_end(i8* %arraydecay34)
  ret void
}

define void @f6(i32 %a1, i32 %a2, i32 %a3, i32 %a4, i32 %a5, i32 %a6, i8* %format, ...) nounwind uwtable {
entry:
  %a1.addr = alloca i32, align 4
  %a2.addr = alloca i32, align 4
  %a3.addr = alloca i32, align 4
  %a4.addr = alloca i32, align 4
  %a5.addr = alloca i32, align 4
  %a6.addr = alloca i32, align 4
  %format.addr = alloca i8*, align 8
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  store i32 %a1, i32* %a1.addr, align 4
  store i32 %a2, i32* %a2.addr, align 4
  store i32 %a3, i32* %a3.addr, align 4
  store i32 %a4, i32* %a4.addr, align 4
  store i32 %a5, i32* %a5.addr, align 4
  store i32 %a6, i32* %a6.addr, align 4
  store i8* %format, i8** %format.addr, align 8
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %arraydecay1 = bitcast %struct.__va_list_tag* %arraydecay to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %tmp = load i8** %format.addr, align 8
  %arraydecay2 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  call void @fap(i32 6, i8* %tmp, %struct.__va_list_tag* %arraydecay2)
  %arraydecay3 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %arraydecay34 = bitcast %struct.__va_list_tag* %arraydecay3 to i8*
  call void @llvm.va_end(i8* %arraydecay34)
  ret void
}

define void @f7(i32 %a1, i32 %a2, i32 %a3, i32 %a4, i32 %a5, i32 %a6, i32 %a7, i8* %format, ...) nounwind uwtable {
entry:
  %a1.addr = alloca i32, align 4
  %a2.addr = alloca i32, align 4
  %a3.addr = alloca i32, align 4
  %a4.addr = alloca i32, align 4
  %a5.addr = alloca i32, align 4
  %a6.addr = alloca i32, align 4
  %a7.addr = alloca i32, align 4
  %format.addr = alloca i8*, align 8
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  store i32 %a1, i32* %a1.addr, align 4
  store i32 %a2, i32* %a2.addr, align 4
  store i32 %a3, i32* %a3.addr, align 4
  store i32 %a4, i32* %a4.addr, align 4
  store i32 %a5, i32* %a5.addr, align 4
  store i32 %a6, i32* %a6.addr, align 4
  store i32 %a7, i32* %a7.addr, align 4
  store i8* %format, i8** %format.addr, align 8
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %arraydecay1 = bitcast %struct.__va_list_tag* %arraydecay to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %tmp = load i8** %format.addr, align 8
  %arraydecay2 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  call void @fap(i32 7, i8* %tmp, %struct.__va_list_tag* %arraydecay2)
  %arraydecay3 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %arraydecay34 = bitcast %struct.__va_list_tag* %arraydecay3 to i8*
  call void @llvm.va_end(i8* %arraydecay34)
  ret void
}

define void @f8(i32 %a1, i32 %a2, i32 %a3, i32 %a4, i32 %a5, i32 %a6, i32 %a7, i32 %a8, i8* %format, ...) nounwind uwtable {
entry:
  %a1.addr = alloca i32, align 4
  %a2.addr = alloca i32, align 4
  %a3.addr = alloca i32, align 4
  %a4.addr = alloca i32, align 4
  %a5.addr = alloca i32, align 4
  %a6.addr = alloca i32, align 4
  %a7.addr = alloca i32, align 4
  %a8.addr = alloca i32, align 4
  %format.addr = alloca i8*, align 8
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  store i32 %a1, i32* %a1.addr, align 4
  store i32 %a2, i32* %a2.addr, align 4
  store i32 %a3, i32* %a3.addr, align 4
  store i32 %a4, i32* %a4.addr, align 4
  store i32 %a5, i32* %a5.addr, align 4
  store i32 %a6, i32* %a6.addr, align 4
  store i32 %a7, i32* %a7.addr, align 4
  store i32 %a8, i32* %a8.addr, align 4
  store i8* %format, i8** %format.addr, align 8
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %arraydecay1 = bitcast %struct.__va_list_tag* %arraydecay to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %tmp = load i8** %format.addr, align 8
  %arraydecay2 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  call void @fap(i32 8, i8* %tmp, %struct.__va_list_tag* %arraydecay2)
  %arraydecay3 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %arraydecay34 = bitcast %struct.__va_list_tag* %arraydecay3 to i8*
  call void @llvm.va_end(i8* %arraydecay34)
  ret void
}

define void @f9(i32 %a1, i32 %a2, i32 %a3, i32 %a4, i32 %a5, i32 %a6, i32 %a7, i32 %a8, i32 %a9, i8* %format, ...) nounwind uwtable {
entry:
  %a1.addr = alloca i32, align 4
  %a2.addr = alloca i32, align 4
  %a3.addr = alloca i32, align 4
  %a4.addr = alloca i32, align 4
  %a5.addr = alloca i32, align 4
  %a6.addr = alloca i32, align 4
  %a7.addr = alloca i32, align 4
  %a8.addr = alloca i32, align 4
  %a9.addr = alloca i32, align 4
  %format.addr = alloca i8*, align 8
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  store i32 %a1, i32* %a1.addr, align 4
  store i32 %a2, i32* %a2.addr, align 4
  store i32 %a3, i32* %a3.addr, align 4
  store i32 %a4, i32* %a4.addr, align 4
  store i32 %a5, i32* %a5.addr, align 4
  store i32 %a6, i32* %a6.addr, align 4
  store i32 %a7, i32* %a7.addr, align 4
  store i32 %a8, i32* %a8.addr, align 4
  store i32 %a9, i32* %a9.addr, align 4
  store i8* %format, i8** %format.addr, align 8
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %arraydecay1 = bitcast %struct.__va_list_tag* %arraydecay to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %tmp = load i8** %format.addr, align 8
  %arraydecay2 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  call void @fap(i32 9, i8* %tmp, %struct.__va_list_tag* %arraydecay2)
  %arraydecay3 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %arraydecay34 = bitcast %struct.__va_list_tag* %arraydecay3 to i8*
  call void @llvm.va_end(i8* %arraydecay34)
  ret void
}

define void @f10(i32 %a1, i32 %a2, i32 %a3, i32 %a4, i32 %a5, i32 %a6, i32 %a7, i32 %a8, i32 %a9, i32 %a10, i8* %format, ...) nounwind uwtable {
entry:
  %a1.addr = alloca i32, align 4
  %a2.addr = alloca i32, align 4
  %a3.addr = alloca i32, align 4
  %a4.addr = alloca i32, align 4
  %a5.addr = alloca i32, align 4
  %a6.addr = alloca i32, align 4
  %a7.addr = alloca i32, align 4
  %a8.addr = alloca i32, align 4
  %a9.addr = alloca i32, align 4
  %a10.addr = alloca i32, align 4
  %format.addr = alloca i8*, align 8
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  store i32 %a1, i32* %a1.addr, align 4
  store i32 %a2, i32* %a2.addr, align 4
  store i32 %a3, i32* %a3.addr, align 4
  store i32 %a4, i32* %a4.addr, align 4
  store i32 %a5, i32* %a5.addr, align 4
  store i32 %a6, i32* %a6.addr, align 4
  store i32 %a7, i32* %a7.addr, align 4
  store i32 %a8, i32* %a8.addr, align 4
  store i32 %a9, i32* %a9.addr, align 4
  store i32 %a10, i32* %a10.addr, align 4
  store i8* %format, i8** %format.addr, align 8
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %arraydecay1 = bitcast %struct.__va_list_tag* %arraydecay to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %tmp = load i8** %format.addr, align 8
  %arraydecay2 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  call void @fap(i32 10, i8* %tmp, %struct.__va_list_tag* %arraydecay2)
  %arraydecay3 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %arraydecay34 = bitcast %struct.__va_list_tag* %arraydecay3 to i8*
  call void @llvm.va_end(i8* %arraydecay34)
  ret void
}

define void @f11(i32 %a1, i32 %a2, i32 %a3, i32 %a4, i32 %a5, i32 %a6, i32 %a7, i32 %a8, i32 %a9, i32 %a10, i32 %a11, i8* %format, ...) nounwind uwtable {
entry:
  %a1.addr = alloca i32, align 4
  %a2.addr = alloca i32, align 4
  %a3.addr = alloca i32, align 4
  %a4.addr = alloca i32, align 4
  %a5.addr = alloca i32, align 4
  %a6.addr = alloca i32, align 4
  %a7.addr = alloca i32, align 4
  %a8.addr = alloca i32, align 4
  %a9.addr = alloca i32, align 4
  %a10.addr = alloca i32, align 4
  %a11.addr = alloca i32, align 4
  %format.addr = alloca i8*, align 8
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  store i32 %a1, i32* %a1.addr, align 4
  store i32 %a2, i32* %a2.addr, align 4
  store i32 %a3, i32* %a3.addr, align 4
  store i32 %a4, i32* %a4.addr, align 4
  store i32 %a5, i32* %a5.addr, align 4
  store i32 %a6, i32* %a6.addr, align 4
  store i32 %a7, i32* %a7.addr, align 4
  store i32 %a8, i32* %a8.addr, align 4
  store i32 %a9, i32* %a9.addr, align 4
  store i32 %a10, i32* %a10.addr, align 4
  store i32 %a11, i32* %a11.addr, align 4
  store i8* %format, i8** %format.addr, align 8
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %arraydecay1 = bitcast %struct.__va_list_tag* %arraydecay to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %tmp = load i8** %format.addr, align 8
  %arraydecay2 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  call void @fap(i32 11, i8* %tmp, %struct.__va_list_tag* %arraydecay2)
  %arraydecay3 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %arraydecay34 = bitcast %struct.__va_list_tag* %arraydecay3 to i8*
  call void @llvm.va_end(i8* %arraydecay34)
  ret void
}

define void @f12(i32 %a1, i32 %a2, i32 %a3, i32 %a4, i32 %a5, i32 %a6, i32 %a7, i32 %a8, i32 %a9, i32 %a10, i32 %a11, i32 %a12, i8* %format, ...) nounwind uwtable {
entry:
  %a1.addr = alloca i32, align 4
  %a2.addr = alloca i32, align 4
  %a3.addr = alloca i32, align 4
  %a4.addr = alloca i32, align 4
  %a5.addr = alloca i32, align 4
  %a6.addr = alloca i32, align 4
  %a7.addr = alloca i32, align 4
  %a8.addr = alloca i32, align 4
  %a9.addr = alloca i32, align 4
  %a10.addr = alloca i32, align 4
  %a11.addr = alloca i32, align 4
  %a12.addr = alloca i32, align 4
  %format.addr = alloca i8*, align 8
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  store i32 %a1, i32* %a1.addr, align 4
  store i32 %a2, i32* %a2.addr, align 4
  store i32 %a3, i32* %a3.addr, align 4
  store i32 %a4, i32* %a4.addr, align 4
  store i32 %a5, i32* %a5.addr, align 4
  store i32 %a6, i32* %a6.addr, align 4
  store i32 %a7, i32* %a7.addr, align 4
  store i32 %a8, i32* %a8.addr, align 4
  store i32 %a9, i32* %a9.addr, align 4
  store i32 %a10, i32* %a10.addr, align 4
  store i32 %a11, i32* %a11.addr, align 4
  store i32 %a12, i32* %a12.addr, align 4
  store i8* %format, i8** %format.addr, align 8
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %arraydecay1 = bitcast %struct.__va_list_tag* %arraydecay to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %tmp = load i8** %format.addr, align 8
  %arraydecay2 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  call void @fap(i32 12, i8* %tmp, %struct.__va_list_tag* %arraydecay2)
  %arraydecay3 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %arraydecay34 = bitcast %struct.__va_list_tag* %arraydecay3 to i8*
  call void @llvm.va_end(i8* %arraydecay34)
  ret void
}

define void @f13(i32 %a1, i32 %a2, i32 %a3, i32 %a4, i32 %a5, i32 %a6, i32 %a7, i32 %a8, i32 %a9, i32 %a10, i32 %a11, i32 %a12, i32 %a13, i8* %format, ...) nounwind uwtable {
entry:
  %a1.addr = alloca i32, align 4
  %a2.addr = alloca i32, align 4
  %a3.addr = alloca i32, align 4
  %a4.addr = alloca i32, align 4
  %a5.addr = alloca i32, align 4
  %a6.addr = alloca i32, align 4
  %a7.addr = alloca i32, align 4
  %a8.addr = alloca i32, align 4
  %a9.addr = alloca i32, align 4
  %a10.addr = alloca i32, align 4
  %a11.addr = alloca i32, align 4
  %a12.addr = alloca i32, align 4
  %a13.addr = alloca i32, align 4
  %format.addr = alloca i8*, align 8
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  store i32 %a1, i32* %a1.addr, align 4
  store i32 %a2, i32* %a2.addr, align 4
  store i32 %a3, i32* %a3.addr, align 4
  store i32 %a4, i32* %a4.addr, align 4
  store i32 %a5, i32* %a5.addr, align 4
  store i32 %a6, i32* %a6.addr, align 4
  store i32 %a7, i32* %a7.addr, align 4
  store i32 %a8, i32* %a8.addr, align 4
  store i32 %a9, i32* %a9.addr, align 4
  store i32 %a10, i32* %a10.addr, align 4
  store i32 %a11, i32* %a11.addr, align 4
  store i32 %a12, i32* %a12.addr, align 4
  store i32 %a13, i32* %a13.addr, align 4
  store i8* %format, i8** %format.addr, align 8
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %arraydecay1 = bitcast %struct.__va_list_tag* %arraydecay to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %tmp = load i8** %format.addr, align 8
  %arraydecay2 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  call void @fap(i32 13, i8* %tmp, %struct.__va_list_tag* %arraydecay2)
  %arraydecay3 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %arraydecay34 = bitcast %struct.__va_list_tag* %arraydecay3 to i8*
  call void @llvm.va_end(i8* %arraydecay34)
  ret void
}

define void @f14(i32 %a1, i32 %a2, i32 %a3, i32 %a4, i32 %a5, i32 %a6, i32 %a7, i32 %a8, i32 %a9, i32 %a10, i32 %a11, i32 %a12, i32 %a13, i32 %a14, i8* %format, ...) nounwind uwtable {
entry:
  %a1.addr = alloca i32, align 4
  %a2.addr = alloca i32, align 4
  %a3.addr = alloca i32, align 4
  %a4.addr = alloca i32, align 4
  %a5.addr = alloca i32, align 4
  %a6.addr = alloca i32, align 4
  %a7.addr = alloca i32, align 4
  %a8.addr = alloca i32, align 4
  %a9.addr = alloca i32, align 4
  %a10.addr = alloca i32, align 4
  %a11.addr = alloca i32, align 4
  %a12.addr = alloca i32, align 4
  %a13.addr = alloca i32, align 4
  %a14.addr = alloca i32, align 4
  %format.addr = alloca i8*, align 8
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  store i32 %a1, i32* %a1.addr, align 4
  store i32 %a2, i32* %a2.addr, align 4
  store i32 %a3, i32* %a3.addr, align 4
  store i32 %a4, i32* %a4.addr, align 4
  store i32 %a5, i32* %a5.addr, align 4
  store i32 %a6, i32* %a6.addr, align 4
  store i32 %a7, i32* %a7.addr, align 4
  store i32 %a8, i32* %a8.addr, align 4
  store i32 %a9, i32* %a9.addr, align 4
  store i32 %a10, i32* %a10.addr, align 4
  store i32 %a11, i32* %a11.addr, align 4
  store i32 %a12, i32* %a12.addr, align 4
  store i32 %a13, i32* %a13.addr, align 4
  store i32 %a14, i32* %a14.addr, align 4
  store i8* %format, i8** %format.addr, align 8
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %arraydecay1 = bitcast %struct.__va_list_tag* %arraydecay to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %tmp = load i8** %format.addr, align 8
  %arraydecay2 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  call void @fap(i32 14, i8* %tmp, %struct.__va_list_tag* %arraydecay2)
  %arraydecay3 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %arraydecay34 = bitcast %struct.__va_list_tag* %arraydecay3 to i8*
  call void @llvm.va_end(i8* %arraydecay34)
  ret void
}

define void @f15(i32 %a1, i32 %a2, i32 %a3, i32 %a4, i32 %a5, i32 %a6, i32 %a7, i32 %a8, i32 %a9, i32 %a10, i32 %a11, i32 %a12, i32 %a13, i32 %a14, i32 %a15, i8* %format, ...) nounwind uwtable {
entry:
  %a1.addr = alloca i32, align 4
  %a2.addr = alloca i32, align 4
  %a3.addr = alloca i32, align 4
  %a4.addr = alloca i32, align 4
  %a5.addr = alloca i32, align 4
  %a6.addr = alloca i32, align 4
  %a7.addr = alloca i32, align 4
  %a8.addr = alloca i32, align 4
  %a9.addr = alloca i32, align 4
  %a10.addr = alloca i32, align 4
  %a11.addr = alloca i32, align 4
  %a12.addr = alloca i32, align 4
  %a13.addr = alloca i32, align 4
  %a14.addr = alloca i32, align 4
  %a15.addr = alloca i32, align 4
  %format.addr = alloca i8*, align 8
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  store i32 %a1, i32* %a1.addr, align 4
  store i32 %a2, i32* %a2.addr, align 4
  store i32 %a3, i32* %a3.addr, align 4
  store i32 %a4, i32* %a4.addr, align 4
  store i32 %a5, i32* %a5.addr, align 4
  store i32 %a6, i32* %a6.addr, align 4
  store i32 %a7, i32* %a7.addr, align 4
  store i32 %a8, i32* %a8.addr, align 4
  store i32 %a9, i32* %a9.addr, align 4
  store i32 %a10, i32* %a10.addr, align 4
  store i32 %a11, i32* %a11.addr, align 4
  store i32 %a12, i32* %a12.addr, align 4
  store i32 %a13, i32* %a13.addr, align 4
  store i32 %a14, i32* %a14.addr, align 4
  store i32 %a15, i32* %a15.addr, align 4
  store i8* %format, i8** %format.addr, align 8
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %arraydecay1 = bitcast %struct.__va_list_tag* %arraydecay to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %tmp = load i8** %format.addr, align 8
  %arraydecay2 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  call void @fap(i32 15, i8* %tmp, %struct.__va_list_tag* %arraydecay2)
  %arraydecay3 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %arraydecay34 = bitcast %struct.__va_list_tag* %arraydecay3 to i8*
  call void @llvm.va_end(i8* %arraydecay34)
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %f = alloca i8*, align 8
  store i32 0, i32* %retval
  store i8* getelementptr inbounds ([17 x i8]* @.str, i32 0, i32 0), i8** %f, align 8
  %tmp = load i8** %f, align 8
  %add.ptr = getelementptr inbounds i8* %tmp, i64 0
  call void (i8*, ...)* @f0(i8* %add.ptr, i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15)
  %tmp1 = load i8** %f, align 8
  %add.ptr2 = getelementptr inbounds i8* %tmp1, i64 1
  call void (i32, i8*, ...)* @f1(i32 0, i8* %add.ptr2, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15)
  %tmp3 = load i8** %f, align 8
  %add.ptr4 = getelementptr inbounds i8* %tmp3, i64 2
  call void (i32, i32, i8*, ...)* @f2(i32 0, i32 1, i8* %add.ptr4, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15)
  %tmp5 = load i8** %f, align 8
  %add.ptr6 = getelementptr inbounds i8* %tmp5, i64 3
  call void (i32, i32, i32, i8*, ...)* @f3(i32 0, i32 1, i32 2, i8* %add.ptr6, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15)
  %tmp7 = load i8** %f, align 8
  %add.ptr8 = getelementptr inbounds i8* %tmp7, i64 4
  call void (i32, i32, i32, i32, i8*, ...)* @f4(i32 0, i32 1, i32 2, i32 3, i8* %add.ptr8, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15)
  %tmp9 = load i8** %f, align 8
  %add.ptr10 = getelementptr inbounds i8* %tmp9, i64 5
  call void (i32, i32, i32, i32, i32, i8*, ...)* @f5(i32 0, i32 1, i32 2, i32 3, i32 4, i8* %add.ptr10, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15)
  %tmp11 = load i8** %f, align 8
  %add.ptr12 = getelementptr inbounds i8* %tmp11, i64 6
  call void (i32, i32, i32, i32, i32, i32, i8*, ...)* @f6(i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i8* %add.ptr12, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15)
  %tmp13 = load i8** %f, align 8
  %add.ptr14 = getelementptr inbounds i8* %tmp13, i64 7
  call void (i32, i32, i32, i32, i32, i32, i32, i8*, ...)* @f7(i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i8* %add.ptr14, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15)
  %tmp15 = load i8** %f, align 8
  %add.ptr16 = getelementptr inbounds i8* %tmp15, i64 8
  call void (i32, i32, i32, i32, i32, i32, i32, i32, i8*, ...)* @f8(i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i8* %add.ptr16, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15)
  %tmp17 = load i8** %f, align 8
  %add.ptr18 = getelementptr inbounds i8* %tmp17, i64 9
  call void (i32, i32, i32, i32, i32, i32, i32, i32, i32, i8*, ...)* @f9(i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i8* %add.ptr18, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15)
  %tmp19 = load i8** %f, align 8
  %add.ptr20 = getelementptr inbounds i8* %tmp19, i64 10
  call void (i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i8*, ...)* @f10(i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i8* %add.ptr20, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15)
  %tmp21 = load i8** %f, align 8
  %add.ptr22 = getelementptr inbounds i8* %tmp21, i64 11
  call void (i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i8*, ...)* @f11(i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i8* %add.ptr22, i32 11, i32 12, i32 13, i32 14, i32 15)
  %tmp23 = load i8** %f, align 8
  %add.ptr24 = getelementptr inbounds i8* %tmp23, i64 12
  call void (i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i8*, ...)* @f12(i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i8* %add.ptr24, i32 12, i32 13, i32 14, i32 15)
  %tmp25 = load i8** %f, align 8
  %add.ptr26 = getelementptr inbounds i8* %tmp25, i64 13
  call void (i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i8*, ...)* @f13(i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i8* %add.ptr26, i32 13, i32 14, i32 15)
  %tmp27 = load i8** %f, align 8
  %add.ptr28 = getelementptr inbounds i8* %tmp27, i64 14
  call void (i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i8*, ...)* @f14(i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i8* %add.ptr28, i32 14, i32 15)
  %tmp29 = load i8** %f, align 8
  %add.ptr30 = getelementptr inbounds i8* %tmp29, i64 15
  call void (i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i8*, ...)* @f15(i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i8* %add.ptr30, i32 15)
  call void @exit(i32 0) noreturn
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

declare void @exit(i32) noreturn
