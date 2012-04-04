; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/990829-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define double @test(double %le, double %ri) nounwind uwtable {
entry:
  %le.addr = alloca double, align 8
  %ri.addr = alloca double, align 8
  %val = alloca double, align 8
  store double %le, double* %le.addr, align 8
  store double %ri, double* %ri.addr, align 8
  %0 = load double* %ri.addr, align 8
  %1 = load double* %le.addr, align 8
  %sub = fsub double %0, %1
  %2 = load double* %ri.addr, align 8
  %3 = load double* %le.addr, align 8
  %add = fadd double %3, 1.000000e+00
  %mul = fmul double %2, %add
  %div = fdiv double %sub, %mul
  store double %div, double* %val, align 8
  %4 = load double* %val, align 8
  ret double %4
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %retval1 = alloca double, align 8
  store i32 0, i32* %retval
  %call = call double @test(double 1.000000e+00, double 2.000000e+00)
  store double %call, double* %retval1, align 8
  %0 = load double* %retval1, align 8
  %cmp = fcmp olt double %0, 2.400000e-01
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load double* %retval1, align 8
  %cmp2 = fcmp ogt double %1, 2.600000e-01
  br i1 %cmp2, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %lor.lhs.false
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %2 = load i32* %retval
  ret i32 %2
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
