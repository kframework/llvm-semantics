; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/941021-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@glob_dbl = common global double 0.000000e+00, align 8

define void @f(double* %pdbl, double %value) nounwind uwtable {
entry:
  %pdbl.addr = alloca double*, align 8
  %value.addr = alloca double, align 8
  store double* %pdbl, double** %pdbl.addr, align 8
  store double %value, double* %value.addr, align 8
  %0 = load double** %pdbl.addr, align 8
  %cmp = icmp eq double* %0, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store double* @glob_dbl, double** %pdbl.addr, align 8
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %1 = load double* %value.addr, align 8
  %2 = load double** %pdbl.addr, align 8
  store double %1, double* %2, align 8
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  call void (...)* bitcast (void (double*, double)* @f to void (...)*)(double* null, double 5.510000e+01)
  %0 = load double* @glob_dbl, align 8
  %cmp = fcmp une double %0, 5.510000e+01
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %1 = load i32* %retval
  ret i32 %1
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
