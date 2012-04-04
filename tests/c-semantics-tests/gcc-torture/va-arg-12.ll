; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/va-arg-12.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.__va_list_tag = type { i32, i32, i8*, i8* }

define void @f(double %p0, double %p1, double %p2, double %p3, double %p4, double %p5, double %p6, double %p7, double %p8, ...) nounwind uwtable {
entry:
  %p0.addr = alloca double, align 8
  %p1.addr = alloca double, align 8
  %p2.addr = alloca double, align 8
  %p3.addr = alloca double, align 8
  %p4.addr = alloca double, align 8
  %p5.addr = alloca double, align 8
  %p6.addr = alloca double, align 8
  %p7.addr = alloca double, align 8
  %p8.addr = alloca double, align 8
  %select = alloca [1 x %struct.__va_list_tag], align 16
  store double %p0, double* %p0.addr, align 8
  store double %p1, double* %p1.addr, align 8
  store double %p2, double* %p2.addr, align 8
  store double %p3, double* %p3.addr, align 8
  store double %p4, double* %p4.addr, align 8
  store double %p5, double* %p5.addr, align 8
  store double %p6, double* %p6.addr, align 8
  store double %p7, double* %p7.addr, align 8
  store double %p8, double* %p8.addr, align 8
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %select, i32 0, i32 0
  %arraydecay1 = bitcast %struct.__va_list_tag* %arraydecay to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %arraydecay2 = getelementptr inbounds [1 x %struct.__va_list_tag]* %select, i32 0, i32 0
  %0 = va_arg %struct.__va_list_tag* %arraydecay2, double
  %cmp = fcmp une double %0, 1.000000e+01
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  %arraydecay3 = getelementptr inbounds [1 x %struct.__va_list_tag]* %select, i32 0, i32 0
  %1 = va_arg %struct.__va_list_tag* %arraydecay3, double
  %cmp4 = fcmp une double %1, 1.100000e+01
  br i1 %cmp4, label %if.then5, label %if.end6

if.then5:                                         ; preds = %if.end
  call void @abort() noreturn nounwind
  unreachable

if.end6:                                          ; preds = %if.end
  %arraydecay7 = getelementptr inbounds [1 x %struct.__va_list_tag]* %select, i32 0, i32 0
  %2 = va_arg %struct.__va_list_tag* %arraydecay7, double
  %cmp8 = fcmp une double %2, 0.000000e+00
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
  call void (double, double, double, double, double, double, double, double, double, ...)* @f(double 1.000000e+00, double 2.000000e+00, double 3.000000e+00, double 4.000000e+00, double 5.000000e+00, double 6.000000e+00, double 7.000000e+00, double 8.000000e+00, double 9.000000e+00, double 1.000000e+01, double 1.100000e+01, double 0.000000e+00)
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

declare void @exit(i32) noreturn nounwind
