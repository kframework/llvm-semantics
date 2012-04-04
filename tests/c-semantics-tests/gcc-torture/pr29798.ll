; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/pr29798.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %i = alloca i32, align 4
  %oldrho = alloca double, align 8
  %beta = alloca double, align 8
  %work = alloca double, align 8
  %rho = alloca double, align 8
  store i32 0, i32* %retval
  store double 0.000000e+00, double* %beta, align 8
  store double 1.000000e+00, double* %work, align 8
  store i32 1, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32* %i, align 4
  %cmp = icmp sle i32 %0, 2
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %1 = load double* %work, align 8
  %2 = load double* %work, align 8
  %mul = fmul double %1, %2
  store double %mul, double* %rho, align 8
  %3 = load i32* %i, align 4
  %cmp1 = icmp ne i32 %3, 1
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %4 = load double* %rho, align 8
  %5 = load double* %oldrho, align 8
  %div = fdiv double %4, %5
  store double %div, double* %beta, align 8
  br label %if.end

if.end:                                           ; preds = %if.then, %for.body
  %6 = load double* %beta, align 8
  %cmp2 = fcmp oeq double %6, 1.000000e+00
  br i1 %cmp2, label %if.then3, label %if.end4

if.then3:                                         ; preds = %if.end
  call void @abort() noreturn nounwind
  unreachable

if.end4:                                          ; preds = %if.end
  %7 = load double* %work, align 8
  %div5 = fdiv double %7, 2.000000e+00
  store double %div5, double* %work, align 8
  %8 = load double* %rho, align 8
  store double %8, double* %oldrho, align 8
  br label %for.inc

for.inc:                                          ; preds = %if.end4
  %9 = load i32* %i, align 4
  %inc = add nsw i32 %9, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  ret i32 0
}

declare void @abort() noreturn nounwind
