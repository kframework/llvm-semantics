; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/va-arg-16.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.__va_list_tag = type { i32, i32, i8*, i8* }

define void @vafunction(double %dummy1, double %dummy2, ...) nounwind uwtable {
entry:
  %dummy1.addr = alloca double, align 8
  %dummy2.addr = alloca double, align 8
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  store double %dummy1, double* %dummy1.addr, align 8
  store double %dummy2, double* %dummy2.addr, align 8
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %arraydecay1 = bitcast %struct.__va_list_tag* %arraydecay to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %0 = load double* %dummy1.addr, align 8
  %cmp = fcmp une double %0, 8.880000e+02
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  %1 = load double* %dummy2.addr, align 8
  %cmp2 = fcmp une double %1, 9.990000e+02
  br i1 %cmp2, label %if.then3, label %if.end4

if.then3:                                         ; preds = %if.end
  call void @abort() noreturn nounwind
  unreachable

if.end4:                                          ; preds = %if.end
  %arraydecay5 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %2 = va_arg %struct.__va_list_tag* %arraydecay5, double
  %cmp6 = fcmp une double %2, 1.000000e+00
  br i1 %cmp6, label %if.then7, label %if.end8

if.then7:                                         ; preds = %if.end4
  call void @abort() noreturn nounwind
  unreachable

if.end8:                                          ; preds = %if.end4
  %arraydecay9 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %3 = va_arg %struct.__va_list_tag* %arraydecay9, double
  %cmp10 = fcmp une double %3, 2.000000e+00
  br i1 %cmp10, label %if.then11, label %if.end12

if.then11:                                        ; preds = %if.end8
  call void @abort() noreturn nounwind
  unreachable

if.end12:                                         ; preds = %if.end8
  %arraydecay13 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %4 = va_arg %struct.__va_list_tag* %arraydecay13, double
  %cmp14 = fcmp une double %4, 3.000000e+00
  br i1 %cmp14, label %if.then15, label %if.end16

if.then15:                                        ; preds = %if.end12
  call void @abort() noreturn nounwind
  unreachable

if.end16:                                         ; preds = %if.end12
  %arraydecay17 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %5 = va_arg %struct.__va_list_tag* %arraydecay17, double
  %cmp18 = fcmp une double %5, 4.000000e+00
  br i1 %cmp18, label %if.then19, label %if.end20

if.then19:                                        ; preds = %if.end16
  call void @abort() noreturn nounwind
  unreachable

if.end20:                                         ; preds = %if.end16
  %arraydecay21 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %6 = va_arg %struct.__va_list_tag* %arraydecay21, double
  %cmp22 = fcmp une double %6, 5.000000e+00
  br i1 %cmp22, label %if.then23, label %if.end24

if.then23:                                        ; preds = %if.end20
  call void @abort() noreturn nounwind
  unreachable

if.end24:                                         ; preds = %if.end20
  %arraydecay25 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %7 = va_arg %struct.__va_list_tag* %arraydecay25, double
  %cmp26 = fcmp une double %7, 6.000000e+00
  br i1 %cmp26, label %if.then27, label %if.end28

if.then27:                                        ; preds = %if.end24
  call void @abort() noreturn nounwind
  unreachable

if.end28:                                         ; preds = %if.end24
  %arraydecay29 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %8 = va_arg %struct.__va_list_tag* %arraydecay29, double
  %cmp30 = fcmp une double %8, 7.000000e+00
  br i1 %cmp30, label %if.then31, label %if.end32

if.then31:                                        ; preds = %if.end28
  call void @abort() noreturn nounwind
  unreachable

if.end32:                                         ; preds = %if.end28
  %arraydecay33 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %9 = va_arg %struct.__va_list_tag* %arraydecay33, double
  %cmp34 = fcmp une double %9, 8.000000e+00
  br i1 %cmp34, label %if.then35, label %if.end36

if.then35:                                        ; preds = %if.end32
  call void @abort() noreturn nounwind
  unreachable

if.end36:                                         ; preds = %if.end32
  %arraydecay37 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %10 = va_arg %struct.__va_list_tag* %arraydecay37, double
  %cmp38 = fcmp une double %10, 9.000000e+00
  br i1 %cmp38, label %if.then39, label %if.end40

if.then39:                                        ; preds = %if.end36
  call void @abort() noreturn nounwind
  unreachable

if.end40:                                         ; preds = %if.end36
  %arraydecay41 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %arraydecay4142 = bitcast %struct.__va_list_tag* %arraydecay41 to i8*
  call void @llvm.va_end(i8* %arraydecay4142)
  ret void
}

declare void @llvm.va_start(i8*) nounwind

declare void @abort() noreturn nounwind

declare void @llvm.va_end(i8*) nounwind

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  call void (double, double, ...)* @vafunction(double 8.880000e+02, double 9.990000e+02, double 1.000000e+00, double 2.000000e+00, double 3.000000e+00, double 4.000000e+00, double 5.000000e+00, double 6.000000e+00, double 7.000000e+00, double 8.000000e+00, double 9.000000e+00)
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

declare void @exit(i32) noreturn nounwind
