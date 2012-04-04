; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/strct-varg-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.s = type { i32, i32 }
%struct.__va_list_tag = type { i32, i32, i8*, i8* }

define void @f(i32 %attr, ...) nounwind uwtable {
entry:
  %attr.addr = alloca i32, align 4
  %va_values = alloca %struct.s, align 4
  %va = alloca [1 x %struct.__va_list_tag], align 16
  %i = alloca i32, align 4
  store i32 %attr, i32* %attr.addr, align 4
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %va, i32 0, i32 0
  %arraydecay1 = bitcast %struct.__va_list_tag* %arraydecay to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %0 = load i32* %attr.addr, align 4
  %cmp = icmp ne i32 %0, 2
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  %arraydecay2 = getelementptr inbounds [1 x %struct.__va_list_tag]* %va, i32 0, i32 0
  %gp_offset_p = getelementptr inbounds %struct.__va_list_tag* %arraydecay2, i32 0, i32 0
  %gp_offset = load i32* %gp_offset_p
  %fits_in_gp = icmp ule i32 %gp_offset, 40
  br i1 %fits_in_gp, label %vaarg.in_reg, label %vaarg.in_mem

vaarg.in_reg:                                     ; preds = %if.end
  %1 = getelementptr inbounds %struct.__va_list_tag* %arraydecay2, i32 0, i32 3
  %reg_save_area = load i8** %1
  %2 = getelementptr i8* %reg_save_area, i32 %gp_offset
  %3 = bitcast i8* %2 to %struct.s*
  %4 = add i32 %gp_offset, 8
  store i32 %4, i32* %gp_offset_p
  br label %vaarg.end

vaarg.in_mem:                                     ; preds = %if.end
  %overflow_arg_area_p = getelementptr inbounds %struct.__va_list_tag* %arraydecay2, i32 0, i32 2
  %overflow_arg_area = load i8** %overflow_arg_area_p
  %5 = bitcast i8* %overflow_arg_area to %struct.s*
  %overflow_arg_area.next = getelementptr i8* %overflow_arg_area, i32 8
  store i8* %overflow_arg_area.next, i8** %overflow_arg_area_p
  br label %vaarg.end

vaarg.end:                                        ; preds = %vaarg.in_mem, %vaarg.in_reg
  %vaarg.addr = phi %struct.s* [ %3, %vaarg.in_reg ], [ %5, %vaarg.in_mem ]
  %6 = bitcast %struct.s* %va_values to i8*
  %7 = bitcast %struct.s* %vaarg.addr to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %6, i8* %7, i64 8, i32 4, i1 false)
  %x = getelementptr inbounds %struct.s* %va_values, i32 0, i32 0
  %8 = load i32* %x, align 4
  %cmp3 = icmp ne i32 %8, 43690
  br i1 %cmp3, label %if.then5, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %vaarg.end
  %y = getelementptr inbounds %struct.s* %va_values, i32 0, i32 1
  %9 = load i32* %y, align 4
  %cmp4 = icmp ne i32 %9, 21845
  br i1 %cmp4, label %if.then5, label %if.end6

if.then5:                                         ; preds = %lor.lhs.false, %vaarg.end
  call void @abort() noreturn nounwind
  unreachable

if.end6:                                          ; preds = %lor.lhs.false
  %arraydecay7 = getelementptr inbounds [1 x %struct.__va_list_tag]* %va, i32 0, i32 0
  %10 = va_arg %struct.__va_list_tag* %arraydecay7, i32
  store i32 %10, i32* %attr.addr, align 4
  %11 = load i32* %attr.addr, align 4
  %cmp8 = icmp ne i32 %11, 3
  br i1 %cmp8, label %if.then9, label %if.end10

if.then9:                                         ; preds = %if.end6
  call void @abort() noreturn nounwind
  unreachable

if.end10:                                         ; preds = %if.end6
  %arraydecay11 = getelementptr inbounds [1 x %struct.__va_list_tag]* %va, i32 0, i32 0
  %gp_offset_p12 = getelementptr inbounds %struct.__va_list_tag* %arraydecay11, i32 0, i32 0
  %gp_offset13 = load i32* %gp_offset_p12
  %fits_in_gp14 = icmp ule i32 %gp_offset13, 40
  br i1 %fits_in_gp14, label %vaarg.in_reg15, label %vaarg.in_mem17

vaarg.in_reg15:                                   ; preds = %if.end10
  %12 = getelementptr inbounds %struct.__va_list_tag* %arraydecay11, i32 0, i32 3
  %reg_save_area16 = load i8** %12
  %13 = getelementptr i8* %reg_save_area16, i32 %gp_offset13
  %14 = bitcast i8* %13 to %struct.s*
  %15 = add i32 %gp_offset13, 8
  store i32 %15, i32* %gp_offset_p12
  br label %vaarg.end21

vaarg.in_mem17:                                   ; preds = %if.end10
  %overflow_arg_area_p18 = getelementptr inbounds %struct.__va_list_tag* %arraydecay11, i32 0, i32 2
  %overflow_arg_area19 = load i8** %overflow_arg_area_p18
  %16 = bitcast i8* %overflow_arg_area19 to %struct.s*
  %overflow_arg_area.next20 = getelementptr i8* %overflow_arg_area19, i32 8
  store i8* %overflow_arg_area.next20, i8** %overflow_arg_area_p18
  br label %vaarg.end21

vaarg.end21:                                      ; preds = %vaarg.in_mem17, %vaarg.in_reg15
  %vaarg.addr22 = phi %struct.s* [ %14, %vaarg.in_reg15 ], [ %16, %vaarg.in_mem17 ]
  %17 = bitcast %struct.s* %va_values to i8*
  %18 = bitcast %struct.s* %vaarg.addr22 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %17, i8* %18, i64 8, i32 4, i1 false)
  %x23 = getelementptr inbounds %struct.s* %va_values, i32 0, i32 0
  %19 = load i32* %x23, align 4
  %cmp24 = icmp ne i32 %19, 65535
  br i1 %cmp24, label %if.then28, label %lor.lhs.false25

lor.lhs.false25:                                  ; preds = %vaarg.end21
  %y26 = getelementptr inbounds %struct.s* %va_values, i32 0, i32 1
  %20 = load i32* %y26, align 4
  %cmp27 = icmp ne i32 %20, 4369
  br i1 %cmp27, label %if.then28, label %if.end29

if.then28:                                        ; preds = %lor.lhs.false25, %vaarg.end21
  call void @abort() noreturn nounwind
  unreachable

if.end29:                                         ; preds = %lor.lhs.false25
  %arraydecay30 = getelementptr inbounds [1 x %struct.__va_list_tag]* %va, i32 0, i32 0
  %arraydecay3031 = bitcast %struct.__va_list_tag* %arraydecay30 to i8*
  call void @llvm.va_end(i8* %arraydecay3031)
  ret void
}

declare void @llvm.va_start(i8*) nounwind

declare void @abort() noreturn nounwind

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

declare void @llvm.va_end(i8*) nounwind

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %a = alloca %struct.s, align 4
  %b = alloca %struct.s, align 4
  store i32 0, i32* %retval
  %x = getelementptr inbounds %struct.s* %a, i32 0, i32 0
  store i32 43690, i32* %x, align 4
  %y = getelementptr inbounds %struct.s* %a, i32 0, i32 1
  store i32 21845, i32* %y, align 4
  %x1 = getelementptr inbounds %struct.s* %b, i32 0, i32 0
  store i32 65535, i32* %x1, align 4
  %y2 = getelementptr inbounds %struct.s* %b, i32 0, i32 1
  store i32 4369, i32* %y2, align 4
  %0 = bitcast %struct.s* %a to i64*
  %1 = load i64* %0, align 1
  %2 = bitcast %struct.s* %b to i64*
  %3 = load i64* %2, align 1
  call void (i32, ...)* @f(i32 2, i64 %1, i32 3, i64 %3)
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %4 = load i32* %retval
  ret i32 %4
}

declare void @exit(i32) noreturn nounwind
