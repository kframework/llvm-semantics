; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/920908-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.T = type { i32 }
%struct.__va_list_tag = type { i32, i32, i8*, i8* }

define i32 @f(i32 %x, ...) nounwind uwtable {
entry:
  %retval = alloca %struct.T, align 4
  %x.addr = alloca i32, align 4
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  %X = alloca %struct.T, align 4
  store i32 %x, i32* %x.addr, align 4
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %arraydecay1 = bitcast %struct.__va_list_tag* %arraydecay to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %arraydecay2 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %gp_offset_p = getelementptr inbounds %struct.__va_list_tag* %arraydecay2, i32 0, i32 0
  %gp_offset = load i32* %gp_offset_p
  %fits_in_gp = icmp ule i32 %gp_offset, 40
  br i1 %fits_in_gp, label %vaarg.in_reg, label %vaarg.in_mem

vaarg.in_reg:                                     ; preds = %entry
  %0 = getelementptr inbounds %struct.__va_list_tag* %arraydecay2, i32 0, i32 3
  %reg_save_area = load i8** %0
  %1 = getelementptr i8* %reg_save_area, i32 %gp_offset
  %2 = bitcast i8* %1 to %struct.T*
  %3 = add i32 %gp_offset, 8
  store i32 %3, i32* %gp_offset_p
  br label %vaarg.end

vaarg.in_mem:                                     ; preds = %entry
  %overflow_arg_area_p = getelementptr inbounds %struct.__va_list_tag* %arraydecay2, i32 0, i32 2
  %overflow_arg_area = load i8** %overflow_arg_area_p
  %4 = bitcast i8* %overflow_arg_area to %struct.T*
  %overflow_arg_area.next = getelementptr i8* %overflow_arg_area, i32 8
  store i8* %overflow_arg_area.next, i8** %overflow_arg_area_p
  br label %vaarg.end

vaarg.end:                                        ; preds = %vaarg.in_mem, %vaarg.in_reg
  %vaarg.addr = phi %struct.T* [ %2, %vaarg.in_reg ], [ %4, %vaarg.in_mem ]
  %5 = bitcast %struct.T* %X to i8*
  %6 = bitcast %struct.T* %vaarg.addr to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %5, i8* %6, i64 4, i32 4, i1 false)
  %A = getelementptr inbounds %struct.T* %X, i32 0, i32 0
  %7 = load i32* %A, align 4
  %cmp = icmp ne i32 %7, 10
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %vaarg.end
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %vaarg.end
  %arraydecay3 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %gp_offset_p4 = getelementptr inbounds %struct.__va_list_tag* %arraydecay3, i32 0, i32 0
  %gp_offset5 = load i32* %gp_offset_p4
  %fits_in_gp6 = icmp ule i32 %gp_offset5, 40
  br i1 %fits_in_gp6, label %vaarg.in_reg7, label %vaarg.in_mem9

vaarg.in_reg7:                                    ; preds = %if.end
  %8 = getelementptr inbounds %struct.__va_list_tag* %arraydecay3, i32 0, i32 3
  %reg_save_area8 = load i8** %8
  %9 = getelementptr i8* %reg_save_area8, i32 %gp_offset5
  %10 = bitcast i8* %9 to %struct.T*
  %11 = add i32 %gp_offset5, 8
  store i32 %11, i32* %gp_offset_p4
  br label %vaarg.end13

vaarg.in_mem9:                                    ; preds = %if.end
  %overflow_arg_area_p10 = getelementptr inbounds %struct.__va_list_tag* %arraydecay3, i32 0, i32 2
  %overflow_arg_area11 = load i8** %overflow_arg_area_p10
  %12 = bitcast i8* %overflow_arg_area11 to %struct.T*
  %overflow_arg_area.next12 = getelementptr i8* %overflow_arg_area11, i32 8
  store i8* %overflow_arg_area.next12, i8** %overflow_arg_area_p10
  br label %vaarg.end13

vaarg.end13:                                      ; preds = %vaarg.in_mem9, %vaarg.in_reg7
  %vaarg.addr14 = phi %struct.T* [ %10, %vaarg.in_reg7 ], [ %12, %vaarg.in_mem9 ]
  %13 = bitcast %struct.T* %X to i8*
  %14 = bitcast %struct.T* %vaarg.addr14 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %13, i8* %14, i64 4, i32 4, i1 false)
  %A15 = getelementptr inbounds %struct.T* %X, i32 0, i32 0
  %15 = load i32* %A15, align 4
  %cmp16 = icmp ne i32 %15, 20
  br i1 %cmp16, label %if.then17, label %if.end18

if.then17:                                        ; preds = %vaarg.end13
  call void @abort() noreturn nounwind
  unreachable

if.end18:                                         ; preds = %vaarg.end13
  %arraydecay19 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %arraydecay1920 = bitcast %struct.__va_list_tag* %arraydecay19 to i8*
  call void @llvm.va_end(i8* %arraydecay1920)
  %16 = bitcast %struct.T* %retval to i8*
  %17 = bitcast %struct.T* %X to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %16, i8* %17, i64 4, i32 4, i1 false)
  %coerce.dive = getelementptr %struct.T* %retval, i32 0, i32 0
  %18 = load i32* %coerce.dive
  ret i32 %18
}

declare void @llvm.va_start(i8*) nounwind

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

declare void @abort() noreturn nounwind

declare void @llvm.va_end(i8*) nounwind

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %X = alloca %struct.T, align 4
  %Y = alloca %struct.T, align 4
  %i = alloca i32, align 4
  %coerce = alloca %struct.T, align 4
  store i32 0, i32* %retval
  %A = getelementptr inbounds %struct.T* %X, i32 0, i32 0
  store i32 10, i32* %A, align 4
  %A1 = getelementptr inbounds %struct.T* %Y, i32 0, i32 0
  store i32 20, i32* %A1, align 4
  %coerce.dive = getelementptr %struct.T* %X, i32 0, i32 0
  %0 = load i32* %coerce.dive
  %coerce.dive2 = getelementptr %struct.T* %Y, i32 0, i32 0
  %1 = load i32* %coerce.dive2
  %call = call i32 (i32, ...)* @f(i32 2, i32 %0, i32 %1)
  %coerce.dive3 = getelementptr %struct.T* %coerce, i32 0, i32 0
  store i32 %call, i32* %coerce.dive3
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %2 = load i32* %retval
  ret i32 %2
}

declare void @exit(i32) noreturn nounwind
