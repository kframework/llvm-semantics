; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/va-arg-6.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.__va_list_tag = type { i32, i32, i8*, i8* }

define void @f(i32 %n, ...) nounwind uwtable {
entry:
  %args = alloca [1 x %struct.__va_list_tag], align 16
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %args, i64 0, i64 0
  %arraydecay1 = bitcast [1 x %struct.__va_list_tag]* %args to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %0 = va_arg %struct.__va_list_tag* %arraydecay, i32
  %cmp = icmp eq i32 %0, 10
  br i1 %cmp, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  %1 = va_arg %struct.__va_list_tag* %arraydecay, i64
  %cmp4 = icmp eq i64 %1, 10000000000
  br i1 %cmp4, label %if.end6, label %if.then5

if.then5:                                         ; preds = %if.end
  call void @abort() noreturn nounwind
  unreachable

if.end6:                                          ; preds = %if.end
  %2 = va_arg %struct.__va_list_tag* %arraydecay, i32
  %cmp8 = icmp eq i32 %2, 11
  br i1 %cmp8, label %if.end10, label %if.then9

if.then9:                                         ; preds = %if.end6
  call void @abort() noreturn nounwind
  unreachable

if.end10:                                         ; preds = %if.end6
  %3 = va_arg %struct.__va_list_tag* %arraydecay, x86_fp80
  %cmp12 = fcmp une x86_fp80 %3, 0xK4000C8F5C28F5C28F5C3
  br i1 %cmp12, label %if.then13, label %if.end14

if.then13:                                        ; preds = %if.end10
  call void @abort() noreturn nounwind
  unreachable

if.end14:                                         ; preds = %if.end10
  %4 = va_arg %struct.__va_list_tag* %arraydecay, i32
  %cmp16 = icmp eq i32 %4, 12
  br i1 %cmp16, label %if.end18, label %if.then17

if.then17:                                        ; preds = %if.end14
  call void @abort() noreturn nounwind
  unreachable

if.end18:                                         ; preds = %if.end14
  %5 = va_arg %struct.__va_list_tag* %arraydecay, i32
  %cmp20 = icmp eq i32 %5, 13
  br i1 %cmp20, label %if.end22, label %if.then21

if.then21:                                        ; preds = %if.end18
  call void @abort() noreturn nounwind
  unreachable

if.end22:                                         ; preds = %if.end18
  %6 = va_arg %struct.__va_list_tag* %arraydecay, i64
  %cmp24 = icmp eq i64 %6, 20000000000
  br i1 %cmp24, label %if.end26, label %if.then25

if.then25:                                        ; preds = %if.end22
  call void @abort() noreturn nounwind
  unreachable

if.end26:                                         ; preds = %if.end22
  %7 = va_arg %struct.__va_list_tag* %arraydecay, i32
  %cmp28 = icmp eq i32 %7, 14
  br i1 %cmp28, label %if.end30, label %if.then29

if.then29:                                        ; preds = %if.end26
  call void @abort() noreturn nounwind
  unreachable

if.end30:                                         ; preds = %if.end26
  %8 = va_arg %struct.__va_list_tag* %arraydecay, double
  %cmp32 = fcmp une double %8, 2.720000e+00
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
  tail call void (i32, ...)* @f(i32 undef, i32 10, i64 10000000000, i32 11, x86_fp80 0xK4000C8F5C28F5C28F5C3, i32 12, i32 13, i64 20000000000, i32 14, double 2.720000e+00)
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn nounwind
