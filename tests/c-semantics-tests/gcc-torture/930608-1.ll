; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/930608-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@a = constant [1 x double (double)*] [double (double)* @f], align 8

define double @f(double %a) nounwind uwtable {
entry:
  %a.addr = alloca double, align 8
  store double %a, double* %a.addr, align 8
  ret double 0.000000e+00
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %p = alloca double (...)*, align 8
  store i32 0, i32* %retval
  store double (...)* bitcast (double (double)* @f to double (...)*), double (...)** %p, align 8
  %0 = load double (...)** %p, align 8
  %1 = load double (double)** getelementptr inbounds ([1 x double (double)*]* @a, i32 0, i64 0), align 8
  %2 = bitcast double (double)* %1 to double (...)*
  %cmp = icmp ne double (...)* %0, %2
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %3 = load i32* %retval
  ret i32 %3
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
