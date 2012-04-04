; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/va-arg-12.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.__va_list_tag = type { i32, i32, i8*, i8* }

define void @f(double %p0, double %p1, double %p2, double %p3, double %p4, double %p5, double %p6, double %p7, double %p8, ...) nounwind uwtable {
entry:
  %select = alloca [1 x %struct.__va_list_tag], align 16
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %select, i64 0, i64 0
  %arraydecay1 = bitcast [1 x %struct.__va_list_tag]* %select to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %0 = va_arg %struct.__va_list_tag* %arraydecay, double
  %cmp = fcmp une double %0, 1.000000e+01
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  %1 = va_arg %struct.__va_list_tag* %arraydecay, double
  %cmp4 = fcmp une double %1, 1.100000e+01
  br i1 %cmp4, label %if.then5, label %if.end6

if.then5:                                         ; preds = %if.end
  call void @abort() noreturn nounwind
  unreachable

if.end6:                                          ; preds = %if.end
  %2 = va_arg %struct.__va_list_tag* %arraydecay, double
  %cmp8 = fcmp une double %2, 0.000000e+00
  br i1 %cmp8, label %if.then9, label %if.end10

if.then9:                                         ; preds = %if.end6
  call void @abort() noreturn nounwind
  unreachable

if.end10:                                         ; preds = %if.end6
  call void @llvm.va_end(i8* %arraydecay1)
  ret void
}

declare void @llvm.va_start(i8*) nounwind

declare void @abort() noreturn nounwind

declare void @llvm.va_end(i8*) nounwind

define i32 @main() noreturn nounwind uwtable {
entry:
  tail call void (double, double, double, double, double, double, double, double, double, ...)* @f(double undef, double undef, double undef, double undef, double undef, double undef, double undef, double undef, double undef, double 1.000000e+01, double 1.100000e+01, double 0.000000e+00)
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn nounwind
