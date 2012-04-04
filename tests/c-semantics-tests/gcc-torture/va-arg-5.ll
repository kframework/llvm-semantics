; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/va-arg-5.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.__va_list_tag = type { i32, i32, i8*, i8* }

define void @va_double(i32 %n, ...) nounwind uwtable {
entry:
  %n.addr = alloca i32, align 4
  %args = alloca [1 x %struct.__va_list_tag], align 16
  store i32 %n, i32* %n.addr, align 4
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %args, i32 0, i32 0
  %arraydecay1 = bitcast %struct.__va_list_tag* %arraydecay to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %arraydecay2 = getelementptr inbounds [1 x %struct.__va_list_tag]* %args, i32 0, i32 0
  %0 = va_arg %struct.__va_list_tag* %arraydecay2, double
  %cmp = fcmp une double %0, 3.141592e+00
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  %arraydecay3 = getelementptr inbounds [1 x %struct.__va_list_tag]* %args, i32 0, i32 0
  %1 = va_arg %struct.__va_list_tag* %arraydecay3, double
  %cmp4 = fcmp une double %1, 2.718270e+00
  br i1 %cmp4, label %if.then5, label %if.end6

if.then5:                                         ; preds = %if.end
  call void @abort() noreturn nounwind
  unreachable

if.end6:                                          ; preds = %if.end
  %arraydecay7 = getelementptr inbounds [1 x %struct.__va_list_tag]* %args, i32 0, i32 0
  %2 = va_arg %struct.__va_list_tag* %arraydecay7, double
  %cmp8 = fcmp une double %2, 0x4001E3779131154C
  br i1 %cmp8, label %if.then9, label %if.end10

if.then9:                                         ; preds = %if.end6
  call void @abort() noreturn nounwind
  unreachable

if.end10:                                         ; preds = %if.end6
  %arraydecay11 = getelementptr inbounds [1 x %struct.__va_list_tag]* %args, i32 0, i32 0
  %3 = va_arg %struct.__va_list_tag* %arraydecay11, double
  %cmp12 = fcmp une double %3, 0x40012E0BE1B5921E
  br i1 %cmp12, label %if.then13, label %if.end14

if.then13:                                        ; preds = %if.end10
  call void @abort() noreturn nounwind
  unreachable

if.end14:                                         ; preds = %if.end10
  %arraydecay15 = getelementptr inbounds [1 x %struct.__va_list_tag]* %args, i32 0, i32 0
  %arraydecay1516 = bitcast %struct.__va_list_tag* %arraydecay15 to i8*
  call void @llvm.va_end(i8* %arraydecay1516)
  ret void
}

declare void @llvm.va_start(i8*) nounwind

declare void @abort() noreturn nounwind

declare void @llvm.va_end(i8*) nounwind

define void @va_long_double(i32 %n, ...) nounwind uwtable {
entry:
  %n.addr = alloca i32, align 4
  %args = alloca [1 x %struct.__va_list_tag], align 16
  store i32 %n, i32* %n.addr, align 4
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %args, i32 0, i32 0
  %arraydecay1 = bitcast %struct.__va_list_tag* %arraydecay to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %arraydecay2 = getelementptr inbounds [1 x %struct.__va_list_tag]* %args, i32 0, i32 0
  %0 = va_arg %struct.__va_list_tag* %arraydecay2, x86_fp80
  %cmp = fcmp une x86_fp80 %0, 0xK4000C90FD7E45803CD14
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  %arraydecay3 = getelementptr inbounds [1 x %struct.__va_list_tag]* %args, i32 0, i32 0
  %1 = va_arg %struct.__va_list_tag* %arraydecay3, x86_fp80
  %cmp4 = fcmp une x86_fp80 %1, 0xK4000ADF822BBECAAB8A6
  br i1 %cmp4, label %if.then5, label %if.end6

if.then5:                                         ; preds = %if.end
  call void @abort() noreturn nounwind
  unreachable

if.end6:                                          ; preds = %if.end
  %arraydecay7 = getelementptr inbounds [1 x %struct.__va_list_tag]* %args, i32 0, i32 0
  %2 = va_arg %struct.__va_list_tag* %arraydecay7, x86_fp80
  %cmp8 = fcmp une x86_fp80 %2, 0xK40008F1BBC8988AA5E0D
  br i1 %cmp8, label %if.then9, label %if.end10

if.then9:                                         ; preds = %if.end6
  call void @abort() noreturn nounwind
  unreachable

if.end10:                                         ; preds = %if.end6
  %arraydecay11 = getelementptr inbounds [1 x %struct.__va_list_tag]* %args, i32 0, i32 0
  %3 = va_arg %struct.__va_list_tag* %arraydecay11, x86_fp80
  %cmp12 = fcmp une x86_fp80 %3, 0xK400089705F0DAC90ED23
  br i1 %cmp12, label %if.then13, label %if.end14

if.then13:                                        ; preds = %if.end10
  call void @abort() noreturn nounwind
  unreachable

if.end14:                                         ; preds = %if.end10
  %arraydecay15 = getelementptr inbounds [1 x %struct.__va_list_tag]* %args, i32 0, i32 0
  %arraydecay1516 = bitcast %struct.__va_list_tag* %arraydecay15 to i8*
  call void @llvm.va_end(i8* %arraydecay1516)
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  call void (i32, ...)* @va_double(i32 4, double 3.141592e+00, double 2.718270e+00, double 0x4001E3779131154C, double 0x40012E0BE1B5921E)
  call void (i32, ...)* @va_long_double(i32 4, x86_fp80 0xK4000C90FD7E45803CD14, x86_fp80 0xK4000ADF822BBECAAB8A6, x86_fp80 0xK40008F1BBC8988AA5E0D, x86_fp80 0xK400089705F0DAC90ED23)
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

declare void @exit(i32) noreturn nounwind
