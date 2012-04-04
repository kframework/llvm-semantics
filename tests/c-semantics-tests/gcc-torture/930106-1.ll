; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/930106-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define double @g() nounwind uwtable {
entry:
  ret double 1.000000e+00
}

define i32 @f() nounwind uwtable {
entry:
  %dummy = alloca [399999 x i8], align 16
  %f1 = alloca double, align 8
  %f2 = alloca double, align 8
  %f3 = alloca double, align 8
  %call = call double @g()
  store double %call, double* %f1, align 8
  %call1 = call double @g()
  store double %call1, double* %f2, align 8
  %call2 = call double @g()
  store double %call2, double* %f3, align 8
  %0 = load double* %f1, align 8
  %1 = load double* %f2, align 8
  %add = fadd double %0, %1
  %2 = load double* %f3, align 8
  %add3 = fadd double %add, %2
  %conv = fptosi double %add3 to i32
  ret i32 %conv
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  %call = call i32 @f()
  %conv = sitofp i32 %call to double
  %cmp = fcmp une double %conv, 3.000000e+00
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
