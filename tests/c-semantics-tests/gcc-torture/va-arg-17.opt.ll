; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/va-arg-17.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.__va_list_tag = type { i32, i32, i8*, i8* }

define void @vafunction(i8* nocapture %dummy, ...) nounwind uwtable {
entry:
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0
  %arraydecay1 = bitcast [1 x %struct.__va_list_tag]* %ap to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %0 = va_arg %struct.__va_list_tag* %arraydecay, double
  %cmp = fcmp une double %0, 1.000000e+00
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  %1 = va_arg %struct.__va_list_tag* %arraydecay, double
  %cmp4 = fcmp une double %1, 2.000000e+00
  br i1 %cmp4, label %if.then5, label %if.end6

if.then5:                                         ; preds = %if.end
  call void @abort() noreturn nounwind
  unreachable

if.end6:                                          ; preds = %if.end
  %2 = va_arg %struct.__va_list_tag* %arraydecay, double
  %cmp8 = fcmp une double %2, 3.000000e+00
  br i1 %cmp8, label %if.then9, label %if.end10

if.then9:                                         ; preds = %if.end6
  call void @abort() noreturn nounwind
  unreachable

if.end10:                                         ; preds = %if.end6
  %3 = va_arg %struct.__va_list_tag* %arraydecay, double
  %cmp12 = fcmp une double %3, 4.000000e+00
  br i1 %cmp12, label %if.then13, label %if.end14

if.then13:                                        ; preds = %if.end10
  call void @abort() noreturn nounwind
  unreachable

if.end14:                                         ; preds = %if.end10
  %4 = va_arg %struct.__va_list_tag* %arraydecay, double
  %cmp16 = fcmp une double %4, 5.000000e+00
  br i1 %cmp16, label %if.then17, label %if.end18

if.then17:                                        ; preds = %if.end14
  call void @abort() noreturn nounwind
  unreachable

if.end18:                                         ; preds = %if.end14
  %5 = va_arg %struct.__va_list_tag* %arraydecay, double
  %cmp20 = fcmp une double %5, 6.000000e+00
  br i1 %cmp20, label %if.then21, label %if.end22

if.then21:                                        ; preds = %if.end18
  call void @abort() noreturn nounwind
  unreachable

if.end22:                                         ; preds = %if.end18
  %6 = va_arg %struct.__va_list_tag* %arraydecay, double
  %cmp24 = fcmp une double %6, 7.000000e+00
  br i1 %cmp24, label %if.then25, label %if.end26

if.then25:                                        ; preds = %if.end22
  call void @abort() noreturn nounwind
  unreachable

if.end26:                                         ; preds = %if.end22
  %7 = va_arg %struct.__va_list_tag* %arraydecay, double
  %cmp28 = fcmp une double %7, 8.000000e+00
  br i1 %cmp28, label %if.then29, label %if.end30

if.then29:                                        ; preds = %if.end26
  call void @abort() noreturn nounwind
  unreachable

if.end30:                                         ; preds = %if.end26
  %8 = va_arg %struct.__va_list_tag* %arraydecay, double
  %cmp32 = fcmp une double %8, 9.000000e+00
  br i1 %cmp32, label %if.then33, label %if.end34

if.then33:                                        ; preds = %if.end30
  call void @abort() noreturn nounwind
  unreachable

if.end34:                                         ; preds = %if.end30
  call void @llvm.va_end(i8* %arraydecay1)
  ret void
}

declare void @llvm.va_start(i8*) nounwind

declare void @abort() noreturn nounwind

declare void @llvm.va_end(i8*) nounwind

define i32 @main() noreturn nounwind uwtable {
entry:
  tail call void (i8*, ...)* @vafunction(i8* undef, double 1.000000e+00, double 2.000000e+00, double 3.000000e+00, double 4.000000e+00, double 5.000000e+00, double 6.000000e+00, double 7.000000e+00, double 8.000000e+00, double 9.000000e+00)
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn nounwind
