; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/va-arg-17.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.__va_list_tag = type { i32, i32, i8*, i8* }

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1

define void @vafunction(i8* %dummy, ...) nounwind uwtable {
entry:
  %dummy.addr = alloca i8*, align 8
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  store i8* %dummy, i8** %dummy.addr, align 8
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %arraydecay1 = bitcast %struct.__va_list_tag* %arraydecay to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %arraydecay2 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %0 = va_arg %struct.__va_list_tag* %arraydecay2, double
  %cmp = fcmp une double %0, 1.000000e+00
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  %arraydecay3 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %1 = va_arg %struct.__va_list_tag* %arraydecay3, double
  %cmp4 = fcmp une double %1, 2.000000e+00
  br i1 %cmp4, label %if.then5, label %if.end6

if.then5:                                         ; preds = %if.end
  call void @abort() noreturn nounwind
  unreachable

if.end6:                                          ; preds = %if.end
  %arraydecay7 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %2 = va_arg %struct.__va_list_tag* %arraydecay7, double
  %cmp8 = fcmp une double %2, 3.000000e+00
  br i1 %cmp8, label %if.then9, label %if.end10

if.then9:                                         ; preds = %if.end6
  call void @abort() noreturn nounwind
  unreachable

if.end10:                                         ; preds = %if.end6
  %arraydecay11 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %3 = va_arg %struct.__va_list_tag* %arraydecay11, double
  %cmp12 = fcmp une double %3, 4.000000e+00
  br i1 %cmp12, label %if.then13, label %if.end14

if.then13:                                        ; preds = %if.end10
  call void @abort() noreturn nounwind
  unreachable

if.end14:                                         ; preds = %if.end10
  %arraydecay15 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %4 = va_arg %struct.__va_list_tag* %arraydecay15, double
  %cmp16 = fcmp une double %4, 5.000000e+00
  br i1 %cmp16, label %if.then17, label %if.end18

if.then17:                                        ; preds = %if.end14
  call void @abort() noreturn nounwind
  unreachable

if.end18:                                         ; preds = %if.end14
  %arraydecay19 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %5 = va_arg %struct.__va_list_tag* %arraydecay19, double
  %cmp20 = fcmp une double %5, 6.000000e+00
  br i1 %cmp20, label %if.then21, label %if.end22

if.then21:                                        ; preds = %if.end18
  call void @abort() noreturn nounwind
  unreachable

if.end22:                                         ; preds = %if.end18
  %arraydecay23 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %6 = va_arg %struct.__va_list_tag* %arraydecay23, double
  %cmp24 = fcmp une double %6, 7.000000e+00
  br i1 %cmp24, label %if.then25, label %if.end26

if.then25:                                        ; preds = %if.end22
  call void @abort() noreturn nounwind
  unreachable

if.end26:                                         ; preds = %if.end22
  %arraydecay27 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %7 = va_arg %struct.__va_list_tag* %arraydecay27, double
  %cmp28 = fcmp une double %7, 8.000000e+00
  br i1 %cmp28, label %if.then29, label %if.end30

if.then29:                                        ; preds = %if.end26
  call void @abort() noreturn nounwind
  unreachable

if.end30:                                         ; preds = %if.end26
  %arraydecay31 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %8 = va_arg %struct.__va_list_tag* %arraydecay31, double
  %cmp32 = fcmp une double %8, 9.000000e+00
  br i1 %cmp32, label %if.then33, label %if.end34

if.then33:                                        ; preds = %if.end30
  call void @abort() noreturn nounwind
  unreachable

if.end34:                                         ; preds = %if.end30
  %arraydecay35 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %arraydecay3536 = bitcast %struct.__va_list_tag* %arraydecay35 to i8*
  call void @llvm.va_end(i8* %arraydecay3536)
  ret void
}

declare void @llvm.va_start(i8*) nounwind

declare void @abort() noreturn nounwind

declare void @llvm.va_end(i8*) nounwind

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  call void (i8*, ...)* @vafunction(i8* getelementptr inbounds ([1 x i8]* @.str, i32 0, i32 0), double 1.000000e+00, double 2.000000e+00, double 3.000000e+00, double 4.000000e+00, double 5.000000e+00, double 6.000000e+00, double 7.000000e+00, double 8.000000e+00, double 9.000000e+00)
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

declare void @exit(i32) noreturn nounwind
