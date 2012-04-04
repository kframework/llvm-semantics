; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20041113-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.__va_list_tag = type { i32, i32, i8*, i8* }

@a = global double 4.000000e+01, align 8

define void @test(i32 %x, ...) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  %i = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %arraydecay1 = bitcast %struct.__va_list_tag* %arraydecay to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %arraydecay2 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %0 = va_arg %struct.__va_list_tag* %arraydecay2, i32
  %cmp = icmp ne i32 %0, 1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  %arraydecay3 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %1 = va_arg %struct.__va_list_tag* %arraydecay3, i32
  %cmp4 = icmp ne i32 %1, 2
  br i1 %cmp4, label %if.then5, label %if.end6

if.then5:                                         ; preds = %if.end
  call void @abort() noreturn nounwind
  unreachable

if.end6:                                          ; preds = %if.end
  %arraydecay7 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %2 = va_arg %struct.__va_list_tag* %arraydecay7, i32
  %cmp8 = icmp ne i32 %2, 3
  br i1 %cmp8, label %if.then9, label %if.end10

if.then9:                                         ; preds = %if.end6
  call void @abort() noreturn nounwind
  unreachable

if.end10:                                         ; preds = %if.end6
  %arraydecay11 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %3 = va_arg %struct.__va_list_tag* %arraydecay11, i32
  %cmp12 = icmp ne i32 %3, 4
  br i1 %cmp12, label %if.then13, label %if.end14

if.then13:                                        ; preds = %if.end10
  call void @abort() noreturn nounwind
  unreachable

if.end14:                                         ; preds = %if.end10
  ret void
}

declare void @llvm.va_start(i8*) nounwind

declare void @abort() noreturn nounwind

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  %0 = load double* @a, align 8
  %div = fdiv double %0, 1.000000e+01
  %conv = fptosi double %div to i32
  call void (i32, ...)* @test(i32 0, i32 1, i32 2, i32 3, i32 %conv)
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %1 = load i32* %retval
  ret i32 %1
}

declare void @exit(i32) noreturn nounwind
