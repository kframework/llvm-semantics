; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/va-arg-5.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.__va_list_tag = type { i32, i32, i8*, i8* }

define void @va_double(i32 %n, ...) nounwind uwtable {
entry:
  %args = alloca [1 x %struct.__va_list_tag], align 16
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %args, i64 0, i64 0
  %arraydecay1 = bitcast [1 x %struct.__va_list_tag]* %args to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %0 = va_arg %struct.__va_list_tag* %arraydecay, double
  %cmp = fcmp une double %0, 3.141592e+00
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  %1 = va_arg %struct.__va_list_tag* %arraydecay, double
  %cmp4 = fcmp une double %1, 2.718270e+00
  br i1 %cmp4, label %if.then5, label %if.end6

if.then5:                                         ; preds = %if.end
  call void @abort() noreturn nounwind
  unreachable

if.end6:                                          ; preds = %if.end
  %2 = va_arg %struct.__va_list_tag* %arraydecay, double
  %cmp8 = fcmp une double %2, 0x4001E3779131154C
  br i1 %cmp8, label %if.then9, label %if.end10

if.then9:                                         ; preds = %if.end6
  call void @abort() noreturn nounwind
  unreachable

if.end10:                                         ; preds = %if.end6
  %3 = va_arg %struct.__va_list_tag* %arraydecay, double
  %cmp12 = fcmp une double %3, 0x40012E0BE1B5921E
  br i1 %cmp12, label %if.then13, label %if.end14

if.then13:                                        ; preds = %if.end10
  call void @abort() noreturn nounwind
  unreachable

if.end14:                                         ; preds = %if.end10
  call void @llvm.va_end(i8* %arraydecay1)
  ret void
}

declare void @llvm.va_start(i8*) nounwind

declare void @abort() noreturn nounwind

declare void @llvm.va_end(i8*) nounwind

define void @va_long_double(i32 %n, ...) nounwind uwtable {
entry:
  %args = alloca [1 x %struct.__va_list_tag], align 16
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %args, i64 0, i64 0
  %arraydecay1 = bitcast [1 x %struct.__va_list_tag]* %args to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %0 = va_arg %struct.__va_list_tag* %arraydecay, x86_fp80
  %cmp = fcmp une x86_fp80 %0, 0xK4000C90FD7E45803CD14
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  %1 = va_arg %struct.__va_list_tag* %arraydecay, x86_fp80
  %cmp4 = fcmp une x86_fp80 %1, 0xK4000ADF822BBECAAB8A6
  br i1 %cmp4, label %if.then5, label %if.end6

if.then5:                                         ; preds = %if.end
  call void @abort() noreturn nounwind
  unreachable

if.end6:                                          ; preds = %if.end
  %2 = va_arg %struct.__va_list_tag* %arraydecay, x86_fp80
  %cmp8 = fcmp une x86_fp80 %2, 0xK40008F1BBC8988AA5E0D
  br i1 %cmp8, label %if.then9, label %if.end10

if.then9:                                         ; preds = %if.end6
  call void @abort() noreturn nounwind
  unreachable

if.end10:                                         ; preds = %if.end6
  %3 = va_arg %struct.__va_list_tag* %arraydecay, x86_fp80
  %cmp12 = fcmp une x86_fp80 %3, 0xK400089705F0DAC90ED23
  br i1 %cmp12, label %if.then13, label %if.end14

if.then13:                                        ; preds = %if.end10
  call void @abort() noreturn nounwind
  unreachable

if.end14:                                         ; preds = %if.end10
  call void @llvm.va_end(i8* %arraydecay1)
  ret void
}

define i32 @main() noreturn nounwind uwtable {
entry:
  tail call void (i32, ...)* @va_double(i32 undef, double 3.141592e+00, double 2.718270e+00, double 0x4001E3779131154C, double 0x40012E0BE1B5921E)
  tail call void (i32, ...)* @va_long_double(i32 undef, x86_fp80 0xK4000C90FD7E45803CD14, x86_fp80 0xK4000ADF822BBECAAB8A6, x86_fp80 0xK40008F1BBC8988AA5E0D, x86_fp80 0xK400089705F0DAC90ED23)
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn nounwind
