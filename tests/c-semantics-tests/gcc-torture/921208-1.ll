; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/921208-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define double @f(double %x) nounwind uwtable {
entry:
  %x.addr = alloca double, align 8
  store double %x, double* %x.addr, align 8
  %0 = load double* %x.addr, align 8
  %1 = load double* %x.addr, align 8
  %mul = fmul double %0, %1
  ret double %mul
}

define double @Int(double (double)* %f, double %a) nounwind uwtable {
entry:
  %f.addr = alloca double (double)*, align 8
  %a.addr = alloca double, align 8
  store double (double)* %f, double (double)** %f.addr, align 8
  store double %a, double* %a.addr, align 8
  %0 = load double (double)** %f.addr, align 8
  %1 = load double* %a.addr, align 8
  %call = call double %0(double %1)
  ret double %call
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  %call = call double @Int(double (double)* @f, double 2.000000e+00)
  %cmp = fcmp une double %call, 4.000000e+00
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
