; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/920908-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.__va_list_tag = type { i32, i32, i8*, i8* }

define i32 @f(i32 %x, ...) nounwind uwtable {
entry:
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  %arraydecay1 = bitcast [1 x %struct.__va_list_tag]* %ap to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %gp_offset_p = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 0
  %gp_offset = load i32* %gp_offset_p, align 16
  %fits_in_gp = icmp ult i32 %gp_offset, 41
  br i1 %fits_in_gp, label %vaarg.in_reg, label %vaarg.in_mem

vaarg.in_reg:                                     ; preds = %entry
  %0 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 3
  %reg_save_area = load i8** %0, align 16
  %1 = sext i32 %gp_offset to i64
  %2 = getelementptr i8* %reg_save_area, i64 %1
  %3 = add i32 %gp_offset, 8
  store i32 %3, i32* %gp_offset_p, align 16
  br label %vaarg.end

vaarg.in_mem:                                     ; preds = %entry
  %overflow_arg_area_p = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 2
  %overflow_arg_area = load i8** %overflow_arg_area_p, align 8
  %overflow_arg_area.next = getelementptr i8* %overflow_arg_area, i64 8
  store i8* %overflow_arg_area.next, i8** %overflow_arg_area_p, align 8
  br label %vaarg.end

vaarg.end:                                        ; preds = %vaarg.in_mem, %vaarg.in_reg
  %gp_offset5 = phi i32 [ %3, %vaarg.in_reg ], [ %gp_offset, %vaarg.in_mem ]
  %vaarg.addr.in = phi i8* [ %2, %vaarg.in_reg ], [ %overflow_arg_area, %vaarg.in_mem ]
  %vaarg.addr.0 = bitcast i8* %vaarg.addr.in to i32*
  %tmp23 = load i32* %vaarg.addr.0, align 4
  %cmp = icmp eq i32 %tmp23, 10
  br i1 %cmp, label %if.end, label %if.then

if.then:                                          ; preds = %vaarg.end
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %vaarg.end
  %fits_in_gp6 = icmp ult i32 %gp_offset5, 41
  br i1 %fits_in_gp6, label %vaarg.in_reg7, label %vaarg.in_mem9

vaarg.in_reg7:                                    ; preds = %if.end
  %4 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 3
  %reg_save_area8 = load i8** %4, align 16
  %5 = sext i32 %gp_offset5 to i64
  %6 = getelementptr i8* %reg_save_area8, i64 %5
  %7 = add i32 %gp_offset5, 8
  store i32 %7, i32* %gp_offset_p, align 16
  br label %vaarg.end13

vaarg.in_mem9:                                    ; preds = %if.end
  %overflow_arg_area_p10 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 2
  %overflow_arg_area11 = load i8** %overflow_arg_area_p10, align 8
  %overflow_arg_area.next12 = getelementptr i8* %overflow_arg_area11, i64 8
  store i8* %overflow_arg_area.next12, i8** %overflow_arg_area_p10, align 8
  br label %vaarg.end13

vaarg.end13:                                      ; preds = %vaarg.in_mem9, %vaarg.in_reg7
  %vaarg.addr14.in = phi i8* [ %6, %vaarg.in_reg7 ], [ %overflow_arg_area11, %vaarg.in_mem9 ]
  %vaarg.addr14.0 = bitcast i8* %vaarg.addr14.in to i32*
  %tmp21 = load i32* %vaarg.addr14.0, align 4
  %cmp16 = icmp eq i32 %tmp21, 20
  br i1 %cmp16, label %if.end18, label %if.then17

if.then17:                                        ; preds = %vaarg.end13
  call void @abort() noreturn nounwind
  unreachable

if.end18:                                         ; preds = %vaarg.end13
  call void @llvm.va_end(i8* %arraydecay1)
  ret i32 20
}

declare void @llvm.va_start(i8*) nounwind

declare void @abort() noreturn nounwind

declare void @llvm.va_end(i8*) nounwind

define i32 @main() noreturn nounwind uwtable {
entry:
  %call = tail call i32 (i32, ...)* @f(i32 undef, i32 10, i32 20)
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn nounwind
