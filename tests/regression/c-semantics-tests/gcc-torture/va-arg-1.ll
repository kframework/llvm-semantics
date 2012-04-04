; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/va-arg-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.__va_list_tag = type { i32, i32, i8*, i8* }

define void @f(i64 %p0, i64 %p1, i64 %p2, i64 %p3, i64 %p4, i64 %p5, i64 %p6, i64 %p7, i64 %p8, ...) nounwind uwtable {
entry:
  %p0.addr = alloca i64, align 8
  %p1.addr = alloca i64, align 8
  %p2.addr = alloca i64, align 8
  %p3.addr = alloca i64, align 8
  %p4.addr = alloca i64, align 8
  %p5.addr = alloca i64, align 8
  %p6.addr = alloca i64, align 8
  %p7.addr = alloca i64, align 8
  %p8.addr = alloca i64, align 8
  %select = alloca [1 x %struct.__va_list_tag], align 16
  store i64 %p0, i64* %p0.addr, align 8
  store i64 %p1, i64* %p1.addr, align 8
  store i64 %p2, i64* %p2.addr, align 8
  store i64 %p3, i64* %p3.addr, align 8
  store i64 %p4, i64* %p4.addr, align 8
  store i64 %p5, i64* %p5.addr, align 8
  store i64 %p6, i64* %p6.addr, align 8
  store i64 %p7, i64* %p7.addr, align 8
  store i64 %p8, i64* %p8.addr, align 8
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %select, i32 0, i32 0
  %arraydecay1 = bitcast %struct.__va_list_tag* %arraydecay to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %arraydecay2 = getelementptr inbounds [1 x %struct.__va_list_tag]* %select, i32 0, i32 0
  %0 = va_arg %struct.__va_list_tag* %arraydecay2, i64
  %cmp = icmp ne i64 %0, 10
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  %arraydecay3 = getelementptr inbounds [1 x %struct.__va_list_tag]* %select, i32 0, i32 0
  %1 = va_arg %struct.__va_list_tag* %arraydecay3, i64
  %cmp4 = icmp ne i64 %1, 11
  br i1 %cmp4, label %if.then5, label %if.end6

if.then5:                                         ; preds = %if.end
  call void @abort() noreturn nounwind
  unreachable

if.end6:                                          ; preds = %if.end
  %arraydecay7 = getelementptr inbounds [1 x %struct.__va_list_tag]* %select, i32 0, i32 0
  %2 = va_arg %struct.__va_list_tag* %arraydecay7, i64
  %cmp8 = icmp ne i64 %2, 0
  br i1 %cmp8, label %if.then9, label %if.end10

if.then9:                                         ; preds = %if.end6
  call void @abort() noreturn nounwind
  unreachable

if.end10:                                         ; preds = %if.end6
  %arraydecay11 = getelementptr inbounds [1 x %struct.__va_list_tag]* %select, i32 0, i32 0
  %arraydecay1112 = bitcast %struct.__va_list_tag* %arraydecay11 to i8*
  call void @llvm.va_end(i8* %arraydecay1112)
  ret void
}

declare void @llvm.va_start(i8*) nounwind

declare void @abort() noreturn nounwind

declare void @llvm.va_end(i8*) nounwind

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  call void (i64, i64, i64, i64, i64, i64, i64, i64, i64, ...)* @f(i64 1, i64 2, i64 3, i64 4, i64 5, i64 6, i64 7, i64 8, i64 9, i64 10, i64 11, i64 0)
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

declare void @exit(i32) noreturn nounwind
