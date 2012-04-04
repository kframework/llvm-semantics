; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/931004-12.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.__va_list_tag = type { i32, i32, i8*, i8* }

define void @f(i32 %n, ...) nounwind uwtable {
entry:
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0
  %arraydecay1 = bitcast [1 x %struct.__va_list_tag]* %ap to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %gp_offset_p = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 0
  %0 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 3
  %overflow_arg_area_p = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 2
  br label %for.cond

for.cond:                                         ; preds = %if.end10, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %if.end10 ]
  %cmp = icmp slt i32 %i.0, %n
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %gp_offset = load i32* %gp_offset_p, align 16
  %fits_in_gp = icmp ult i32 %gp_offset, 41
  br i1 %fits_in_gp, label %vaarg.in_reg, label %vaarg.in_mem

vaarg.in_reg:                                     ; preds = %for.body
  %reg_save_area = load i8** %0, align 16
  %1 = sext i32 %gp_offset to i64
  %2 = getelementptr i8* %reg_save_area, i64 %1
  %3 = add i32 %gp_offset, 8
  store i32 %3, i32* %gp_offset_p, align 16
  br label %vaarg.end

vaarg.in_mem:                                     ; preds = %for.body
  %overflow_arg_area = load i8** %overflow_arg_area_p, align 8
  %overflow_arg_area.next = getelementptr i8* %overflow_arg_area, i64 8
  store i8* %overflow_arg_area.next, i8** %overflow_arg_area_p, align 8
  br label %vaarg.end

vaarg.end:                                        ; preds = %vaarg.in_mem, %vaarg.in_reg
  %vaarg.addr.in = phi i8* [ %2, %vaarg.in_reg ], [ %overflow_arg_area, %vaarg.in_mem ]
  %tmp = load i8* %vaarg.addr.in, align 1
  %4 = getelementptr inbounds i8* %vaarg.addr.in, i64 2
  %tmp26 = load i8* %4, align 1
  %conv = sext i8 %tmp to i32
  %add = add nsw i32 %i.0, 10
  %cmp3 = icmp eq i32 %conv, %add
  br i1 %cmp3, label %if.end, label %if.then

if.then:                                          ; preds = %vaarg.end
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %vaarg.end
  %5 = getelementptr inbounds i8* %vaarg.addr.in, i64 1
  %tmp25 = load i8* %5, align 1
  %conv5 = sext i8 %tmp25 to i32
  %add6 = add nsw i32 %i.0, 20
  %cmp7 = icmp eq i32 %conv5, %add6
  br i1 %cmp7, label %if.end10, label %if.then9

if.then9:                                         ; preds = %if.end
  call void @abort() noreturn nounwind
  unreachable

if.end10:                                         ; preds = %if.end
  %conv11 = sext i8 %tmp26 to i32
  %add12 = add nsw i32 %i.0, 30
  %cmp13 = icmp eq i32 %conv11, %add12
  %inc = add nsw i32 %i.0, 1
  br i1 %cmp13, label %for.cond, label %if.then15

if.then15:                                        ; preds = %if.end10
  call void @abort() noreturn nounwind
  unreachable

for.end:                                          ; preds = %for.cond
  %6 = va_arg %struct.__va_list_tag* %arraydecay, i64
  %cmp19 = icmp eq i64 %6, 123
  br i1 %cmp19, label %if.end22, label %if.then21

if.then21:                                        ; preds = %for.end
  call void @abort() noreturn nounwind
  unreachable

if.end22:                                         ; preds = %for.end
  call void @llvm.va_end(i8* %arraydecay1)
  ret void
}

declare void @llvm.va_start(i8*) nounwind

declare void @abort() noreturn nounwind

declare void @llvm.va_end(i8*) nounwind

define i32 @main() noreturn nounwind uwtable {
entry:
  tail call void (i32, ...)* @f(i32 3, i24 1971210, i24 2037003, i24 2102796, i64 123)
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn nounwind
