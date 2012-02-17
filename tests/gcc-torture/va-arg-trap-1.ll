; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/va-arg-trap-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.__va_list_tag = type { i32, i32, i8*, i8* }

@ap = common global [1 x %struct.__va_list_tag] zeroinitializer, align 16
@f = common global float 0.000000e+00, align 4

define [1 x %struct.__va_list_tag]* @foo() nounwind uwtable {
entry:
  %retval = alloca [1 x %struct.__va_list_tag]*, align 8
  call void @exit(i32 0) noreturn
  unreachable

return:                                           ; No predecessors!
  %0 = load [1 x %struct.__va_list_tag]** %retval
  ret [1 x %struct.__va_list_tag]* %0
}

declare void @exit(i32) noreturn

define void @bar(i32 %i, ...) nounwind uwtable {
entry:
  %i.addr = alloca i32, align 4
  store i32 %i, i32* %i.addr, align 4
  call void @llvm.va_start(i8* bitcast ([1 x %struct.__va_list_tag]* @ap to i8*))
  %call = call [1 x %struct.__va_list_tag]* @foo()
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %call, i32 0, i32 0
  %fp_offset_p = getelementptr inbounds %struct.__va_list_tag* %arraydecay, i32 0, i32 1
  %fp_offset = load i32* %fp_offset_p
  %fits_in_fp = icmp ule i32 %fp_offset, 160
  br i1 %fits_in_fp, label %vaarg.in_reg, label %vaarg.in_mem

vaarg.in_reg:                                     ; preds = %entry
  %0 = getelementptr inbounds %struct.__va_list_tag* %arraydecay, i32 0, i32 3
  %reg_save_area = load i8** %0
  %1 = getelementptr i8* %reg_save_area, i32 %fp_offset
  %2 = bitcast i8* %1 to float*
  %3 = add i32 %fp_offset, 16
  store i32 %3, i32* %fp_offset_p
  br label %vaarg.end

vaarg.in_mem:                                     ; preds = %entry
  %overflow_arg_area_p = getelementptr inbounds %struct.__va_list_tag* %arraydecay, i32 0, i32 2
  %overflow_arg_area = load i8** %overflow_arg_area_p
  %4 = bitcast i8* %overflow_arg_area to float*
  %overflow_arg_area.next = getelementptr i8* %overflow_arg_area, i32 8
  store i8* %overflow_arg_area.next, i8** %overflow_arg_area_p
  br label %vaarg.end

vaarg.end:                                        ; preds = %vaarg.in_mem, %vaarg.in_reg
  %vaarg.addr = phi float* [ %2, %vaarg.in_reg ], [ %4, %vaarg.in_mem ]
  %5 = load float* %vaarg.addr
  store float %5, float* @f, align 4
  call void @llvm.va_end(i8* bitcast ([1 x %struct.__va_list_tag]* @ap to i8*))
  ret void
}

declare void @llvm.va_start(i8*) nounwind

declare void @llvm.va_end(i8*) nounwind

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  call void (i32, ...)* @bar(i32 1, i32 0)
  call void @abort() noreturn
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

declare void @abort() noreturn
