; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/va-arg-20.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.__va_list_tag = type { i32, i32, i8*, i8* }

define void @foo(%struct.__va_list_tag* %v) nounwind uwtable {
entry:
  %v.addr = alloca %struct.__va_list_tag*, align 8
  %x = alloca i64, align 8
  store %struct.__va_list_tag* %v, %struct.__va_list_tag** %v.addr, align 8
  %0 = load %struct.__va_list_tag** %v.addr, align 8
  %1 = va_arg %struct.__va_list_tag* %0, i64
  store i64 %1, i64* %x, align 8
  %2 = load i64* %x, align 8
  %cmp = icmp ne i64 %2, 16
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret void
}

declare void @abort() noreturn nounwind

define void @bar(i8 signext %c, i8 signext %d, ...) nounwind uwtable {
entry:
  %c.addr = alloca i8, align 1
  %d.addr = alloca i8, align 1
  %v = alloca [1 x %struct.__va_list_tag], align 16
  store i8 %c, i8* %c.addr, align 1
  store i8 %d, i8* %d.addr, align 1
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %v, i32 0, i32 0
  %arraydecay1 = bitcast %struct.__va_list_tag* %arraydecay to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %arraydecay2 = getelementptr inbounds [1 x %struct.__va_list_tag]* %v, i32 0, i32 0
  call void @foo(%struct.__va_list_tag* %arraydecay2)
  %arraydecay3 = getelementptr inbounds [1 x %struct.__va_list_tag]* %v, i32 0, i32 0
  %arraydecay34 = bitcast %struct.__va_list_tag* %arraydecay3 to i8*
  call void @llvm.va_end(i8* %arraydecay34)
  ret void
}

declare void @llvm.va_start(i8*) nounwind

declare void @llvm.va_end(i8*) nounwind

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  call void (i8, i8, ...)* @bar(i8 signext 0, i8 signext 0, i64 16)
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

declare void @exit(i32) noreturn nounwind
