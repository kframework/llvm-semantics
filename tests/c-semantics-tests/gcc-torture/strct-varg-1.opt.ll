; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/strct-varg-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.__va_list_tag = type { i32, i32, i8*, i8* }

define void @f(i32 %attr, ...) nounwind uwtable {
entry:
  %va = alloca [1 x %struct.__va_list_tag], align 16
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %va, i64 0, i64 0
  %arraydecay1 = bitcast [1 x %struct.__va_list_tag]* %va to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %cmp = icmp eq i32 %attr, 2
  br i1 %cmp, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  %gp_offset_p = getelementptr inbounds [1 x %struct.__va_list_tag]* %va, i64 0, i64 0, i32 0
  %gp_offset = load i32* %gp_offset_p, align 16
  %fits_in_gp = icmp ult i32 %gp_offset, 41
  br i1 %fits_in_gp, label %vaarg.in_reg, label %vaarg.in_mem

vaarg.in_reg:                                     ; preds = %if.end
  %0 = getelementptr inbounds [1 x %struct.__va_list_tag]* %va, i64 0, i64 0, i32 3
  %reg_save_area = load i8** %0, align 16
  %1 = sext i32 %gp_offset to i64
  %2 = getelementptr i8* %reg_save_area, i64 %1
  %3 = add i32 %gp_offset, 8
  store i32 %3, i32* %gp_offset_p, align 16
  br label %vaarg.end

vaarg.in_mem:                                     ; preds = %if.end
  %overflow_arg_area_p = getelementptr inbounds [1 x %struct.__va_list_tag]* %va, i64 0, i64 0, i32 2
  %overflow_arg_area = load i8** %overflow_arg_area_p, align 8
  %overflow_arg_area.next = getelementptr i8* %overflow_arg_area, i64 8
  store i8* %overflow_arg_area.next, i8** %overflow_arg_area_p, align 8
  br label %vaarg.end

vaarg.end:                                        ; preds = %vaarg.in_mem, %vaarg.in_reg
  %vaarg.addr.in = phi i8* [ %2, %vaarg.in_reg ], [ %overflow_arg_area, %vaarg.in_mem ]
  %vaarg.addr.0 = bitcast i8* %vaarg.addr.in to i32*
  %tmp33 = load i32* %vaarg.addr.0, align 4
  %cmp3 = icmp eq i32 %tmp33, 43690
  br i1 %cmp3, label %lor.lhs.false, label %if.then5

lor.lhs.false:                                    ; preds = %vaarg.end
  %vaarg.addr.1 = getelementptr inbounds i8* %vaarg.addr.in, i64 4
  %4 = bitcast i8* %vaarg.addr.1 to i32*
  %tmp34 = load i32* %4, align 4
  %cmp4 = icmp eq i32 %tmp34, 21845
  br i1 %cmp4, label %if.end6, label %if.then5

if.then5:                                         ; preds = %lor.lhs.false, %vaarg.end
  call void @abort() noreturn nounwind
  unreachable

if.end6:                                          ; preds = %lor.lhs.false
  %5 = va_arg %struct.__va_list_tag* %arraydecay, i32
  %cmp8 = icmp eq i32 %5, 3
  br i1 %cmp8, label %if.end10, label %if.then9

if.then9:                                         ; preds = %if.end6
  call void @abort() noreturn nounwind
  unreachable

if.end10:                                         ; preds = %if.end6
  %gp_offset13 = load i32* %gp_offset_p, align 16
  %fits_in_gp14 = icmp ult i32 %gp_offset13, 41
  br i1 %fits_in_gp14, label %vaarg.in_reg15, label %vaarg.in_mem17

vaarg.in_reg15:                                   ; preds = %if.end10
  %6 = getelementptr inbounds [1 x %struct.__va_list_tag]* %va, i64 0, i64 0, i32 3
  %reg_save_area16 = load i8** %6, align 16
  %7 = sext i32 %gp_offset13 to i64
  %8 = getelementptr i8* %reg_save_area16, i64 %7
  %9 = add i32 %gp_offset13, 8
  store i32 %9, i32* %gp_offset_p, align 16
  br label %vaarg.end21

vaarg.in_mem17:                                   ; preds = %if.end10
  %overflow_arg_area_p18 = getelementptr inbounds [1 x %struct.__va_list_tag]* %va, i64 0, i64 0, i32 2
  %overflow_arg_area19 = load i8** %overflow_arg_area_p18, align 8
  %overflow_arg_area.next20 = getelementptr i8* %overflow_arg_area19, i64 8
  store i8* %overflow_arg_area.next20, i8** %overflow_arg_area_p18, align 8
  br label %vaarg.end21

vaarg.end21:                                      ; preds = %vaarg.in_mem17, %vaarg.in_reg15
  %vaarg.addr22.in = phi i8* [ %8, %vaarg.in_reg15 ], [ %overflow_arg_area19, %vaarg.in_mem17 ]
  %vaarg.addr22.0 = bitcast i8* %vaarg.addr22.in to i32*
  %tmp = load i32* %vaarg.addr22.0, align 4
  %cmp24 = icmp eq i32 %tmp, 65535
  br i1 %cmp24, label %lor.lhs.false25, label %if.then28

lor.lhs.false25:                                  ; preds = %vaarg.end21
  %vaarg.addr22.1 = getelementptr inbounds i8* %vaarg.addr22.in, i64 4
  %10 = bitcast i8* %vaarg.addr22.1 to i32*
  %tmp32 = load i32* %10, align 4
  %cmp27 = icmp eq i32 %tmp32, 4369
  br i1 %cmp27, label %if.end29, label %if.then28

if.then28:                                        ; preds = %lor.lhs.false25, %vaarg.end21
  call void @abort() noreturn nounwind
  unreachable

if.end29:                                         ; preds = %lor.lhs.false25
  call void @llvm.va_end(i8* %arraydecay1)
  ret void
}

declare void @llvm.va_start(i8*) nounwind

declare void @abort() noreturn nounwind

declare void @llvm.va_end(i8*) nounwind

define i32 @main() noreturn nounwind uwtable {
entry:
  tail call void (i32, ...)* @f(i32 2, i64 93823560624810, i32 3, i64 18764712181759)
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn nounwind
