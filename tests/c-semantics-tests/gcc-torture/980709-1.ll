; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/980709-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %a = alloca double, align 8
  %c = alloca double, align 8
  store i32 0, i32* %retval
  store volatile double 3.200000e+01, double* %a, align 8
  %0 = load volatile double* %a, align 8
  %1 = call double @llvm.pow.f64(double %0, double 0x3FD5555555555555)
  store double %1, double* %c, align 8
  %2 = load double* %c, align 8
  %add = fadd double %2, 1.000000e-01
  %cmp = fcmp ogt double %add, 3.174802e+00
  br i1 %cmp, label %land.lhs.true, label %if.else

land.lhs.true:                                    ; preds = %entry
  %3 = load double* %c, align 8
  %sub = fsub double %3, 1.000000e-01
  %cmp1 = fcmp olt double %sub, 3.174802e+00
  br i1 %cmp1, label %if.then, label %if.else

if.then:                                          ; preds = %land.lhs.true
  call void @exit(i32 0) noreturn nounwind
  unreachable

if.else:                                          ; preds = %land.lhs.true, %entry
  call void @abort() noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %4 = load i32* %retval
  ret i32 %4
}

declare double @llvm.pow.f64(double, double) nounwind readonly

declare void @exit(i32) noreturn nounwind

declare void @abort() noreturn nounwind
