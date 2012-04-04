; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/pr44942.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.__va_list_tag = type { i32, i32, i8*, i8* }

define void @test1(i32 %a, i32 %b, i32 %c, i32 %d, i32 %e, i32 %f, i32 %g, x86_fp80 %h, ...) nounwind uwtable {
entry:
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0
  %arraydecay1 = bitcast [1 x %struct.__va_list_tag]* %ap to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %0 = va_arg %struct.__va_list_tag* %arraydecay, i32
  %cmp = icmp eq i32 %0, 1234
  br i1 %cmp, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  call void @llvm.va_end(i8* %arraydecay1)
  ret void
}

declare void @llvm.va_start(i8*) nounwind

declare void @abort() noreturn nounwind

declare void @llvm.va_end(i8*) nounwind

define void @test2(i32 %a, i32 %b, i32 %c, i32 %d, i32 %e, i32 %f, i32 %g, x86_fp80 %h, i32 %i, x86_fp80 %j, i32 %k, x86_fp80 %l, i32 %m, x86_fp80 %n, ...) nounwind uwtable {
entry:
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0
  %arraydecay1 = bitcast [1 x %struct.__va_list_tag]* %ap to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %0 = va_arg %struct.__va_list_tag* %arraydecay, i32
  %cmp = icmp eq i32 %0, 1234
  br i1 %cmp, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  call void @llvm.va_end(i8* %arraydecay1)
  ret void
}

define void @test3(double %a, double %b, double %c, double %d, double %e, double %f, double %g, x86_fp80 %h, ...) nounwind uwtable {
entry:
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0
  %arraydecay1 = bitcast [1 x %struct.__va_list_tag]* %ap to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %0 = va_arg %struct.__va_list_tag* %arraydecay, double
  %cmp = fcmp une double %0, 1.234000e+03
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  call void @llvm.va_end(i8* %arraydecay1)
  ret void
}

define void @test4(double %a, double %b, double %c, double %d, double %e, double %f, double %g, x86_fp80 %h, double %i, x86_fp80 %j, double %k, x86_fp80 %l, double %m, x86_fp80 %n, ...) nounwind uwtable {
entry:
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0
  %arraydecay1 = bitcast [1 x %struct.__va_list_tag]* %ap to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %0 = va_arg %struct.__va_list_tag* %arraydecay, double
  %cmp = fcmp une double %0, 1.234000e+03
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  call void @llvm.va_end(i8* %arraydecay1)
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  tail call void (i32, i32, i32, i32, i32, i32, i32, x86_fp80, ...)* @test1(i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, x86_fp80 undef, i32 1234)
  tail call void (i32, i32, i32, i32, i32, i32, i32, x86_fp80, i32, x86_fp80, i32, x86_fp80, i32, x86_fp80, ...)* @test2(i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, x86_fp80 undef, i32 undef, x86_fp80 undef, i32 undef, x86_fp80 undef, i32 undef, x86_fp80 undef, i32 1234)
  tail call void (double, double, double, double, double, double, double, x86_fp80, ...)* @test3(double undef, double undef, double undef, double undef, double undef, double undef, double undef, x86_fp80 undef, double 1.234000e+03)
  tail call void (double, double, double, double, double, double, double, x86_fp80, double, x86_fp80, double, x86_fp80, double, x86_fp80, ...)* @test4(double undef, double undef, double undef, double undef, double undef, double undef, double undef, x86_fp80 undef, double undef, x86_fp80 undef, double undef, x86_fp80 undef, double undef, x86_fp80 undef, double 1.234000e+03)
  ret i32 0
}
