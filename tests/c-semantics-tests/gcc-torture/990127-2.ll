; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/990127-2.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define void @fpEq(double %x, double %y) nounwind uwtable {
entry:
  %x.addr = alloca double, align 8
  %y.addr = alloca double, align 8
  store double %x, double* %x.addr, align 8
  store double %y, double* %y.addr, align 8
  %0 = load double* %x.addr, align 8
  %1 = load double* %y.addr, align 8
  %cmp = fcmp une double %0, %1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret void
}

declare void @abort() noreturn nounwind

define void @fpTest(double %x, double %y) nounwind uwtable {
entry:
  %x.addr = alloca double, align 8
  %y.addr = alloca double, align 8
  %result1 = alloca double, align 8
  %result2 = alloca double, align 8
  store double %x, double* %x.addr, align 8
  store double %y, double* %y.addr, align 8
  store double 0x4053D55555555556, double* %result1, align 8
  %0 = load double* %x.addr, align 8
  %mul = fmul double %0, 1.000000e+02
  %1 = load double* %y.addr, align 8
  %div = fdiv double %mul, %1
  store double %div, double* %result2, align 8
  %2 = load double* %result1, align 8
  %3 = load double* %result2, align 8
  call void @fpEq(double %2, double %3)
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  call void @fpTest(double 3.570000e+01, double 4.500000e+01)
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

declare void @exit(i32) noreturn nounwind
