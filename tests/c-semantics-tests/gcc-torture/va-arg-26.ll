; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/va-arg-26.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.__va_list_tag = type { i32, i32, i8*, i8* }

define double @f(float %f1, float %f2, float %f3, float %f4, float %f5, float %f6, ...) nounwind uwtable {
entry:
  %f1.addr = alloca float, align 4
  %f2.addr = alloca float, align 4
  %f3.addr = alloca float, align 4
  %f4.addr = alloca float, align 4
  %f5.addr = alloca float, align 4
  %f6.addr = alloca float, align 4
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  %d = alloca double, align 8
  store float %f1, float* %f1.addr, align 4
  store float %f2, float* %f2.addr, align 4
  store float %f3, float* %f3.addr, align 4
  store float %f4, float* %f4.addr, align 4
  store float %f5, float* %f5.addr, align 4
  store float %f6, float* %f6.addr, align 4
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %arraydecay1 = bitcast %struct.__va_list_tag* %arraydecay to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %arraydecay2 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %0 = va_arg %struct.__va_list_tag* %arraydecay2, double
  store double %0, double* %d, align 8
  %arraydecay3 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %arraydecay34 = bitcast %struct.__va_list_tag* %arraydecay3 to i8*
  call void @llvm.va_end(i8* %arraydecay34)
  %1 = load double* %d, align 8
  ret double %1
}

declare void @llvm.va_start(i8*) nounwind

declare void @llvm.va_end(i8*) nounwind

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  %call = call double (float, float, float, float, float, float, ...)* @f(float 1.000000e+00, float 2.000000e+00, float 3.000000e+00, float 4.000000e+00, float 5.000000e+00, float 6.000000e+00, double 7.000000e+00)
  %cmp = fcmp une double %call, 7.000000e+00
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
