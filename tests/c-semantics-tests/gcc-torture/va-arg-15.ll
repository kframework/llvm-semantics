; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/va-arg-15.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.__va_list_tag = type { i32, i32, i8*, i8* }

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1

define void @vafunction(i8* %dummy, ...) nounwind uwtable {
entry:
  %dummy.addr = alloca i8*, align 8
  %darg = alloca double, align 8
  %iarg = alloca i32, align 4
  %flag = alloca i32, align 4
  %i = alloca i32, align 4
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  store i8* %dummy, i8** %dummy.addr, align 8
  store i32 0, i32* %flag, align 4
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %arraydecay1 = bitcast %struct.__va_list_tag* %arraydecay to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  store i32 1, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32* %i, align 4
  %cmp = icmp sle i32 %0, 18
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %1 = load i32* %flag, align 4
  %and = and i32 %1, 1
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %if.then, label %if.else

if.then:                                          ; preds = %for.body
  %arraydecay2 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %2 = va_arg %struct.__va_list_tag* %arraydecay2, double
  store double %2, double* %darg, align 8
  %3 = load double* %darg, align 8
  %4 = load i32* %i, align 4
  %conv = sitofp i32 %4 to double
  %cmp3 = fcmp une double %3, %conv
  br i1 %cmp3, label %if.then5, label %if.end

if.then5:                                         ; preds = %if.then
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %if.then
  br label %if.end11

if.else:                                          ; preds = %for.body
  %arraydecay6 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %5 = va_arg %struct.__va_list_tag* %arraydecay6, i32
  store i32 %5, i32* %iarg, align 4
  %6 = load i32* %iarg, align 4
  %7 = load i32* %i, align 4
  %cmp7 = icmp ne i32 %6, %7
  br i1 %cmp7, label %if.then9, label %if.end10

if.then9:                                         ; preds = %if.else
  call void @abort() noreturn nounwind
  unreachable

if.end10:                                         ; preds = %if.else
  br label %if.end11

if.end11:                                         ; preds = %if.end10, %if.end
  br label %for.inc

for.inc:                                          ; preds = %if.end11
  %8 = load i32* %i, align 4
  %inc = add nsw i32 %8, 1
  store i32 %inc, i32* %i, align 4
  %9 = load i32* %flag, align 4
  %inc12 = add nsw i32 %9, 1
  store i32 %inc12, i32* %flag, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %arraydecay13 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %arraydecay1314 = bitcast %struct.__va_list_tag* %arraydecay13 to i8*
  call void @llvm.va_end(i8* %arraydecay1314)
  ret void
}

declare void @llvm.va_start(i8*) nounwind

declare void @abort() noreturn nounwind

declare void @llvm.va_end(i8*) nounwind

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  call void (i8*, ...)* @vafunction(i8* getelementptr inbounds ([1 x i8]* @.str, i32 0, i32 0), i32 1, double 2.000000e+00, i32 3, double 4.000000e+00, i32 5, double 6.000000e+00, i32 7, double 8.000000e+00, i32 9, double 1.000000e+01, i32 11, double 1.200000e+01, i32 13, double 1.400000e+01, i32 15, double 1.600000e+01, i32 17, double 1.800000e+01)
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

declare void @exit(i32) noreturn nounwind
