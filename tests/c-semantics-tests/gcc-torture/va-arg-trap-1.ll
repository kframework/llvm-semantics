; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/va-arg-trap-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
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
  %0 = va_arg %struct.__va_list_tag* %arraydecay, float
  store float %0, float* @f, align 4
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
