; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20020720-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define void @foo(double %x) nounwind uwtable {
entry:
  %x.addr = alloca double, align 8
  %p = alloca double, align 8
  %q = alloca double, align 8
  store double %x, double* %x.addr, align 8
  %0 = load double* %x.addr, align 8
  %call = call double @fabs(double %0) nounwind readnone
  store double %call, double* %p, align 8
  store double 0.000000e+00, double* %q, align 8
  %1 = load double* %p, align 8
  %2 = load double* %q, align 8
  %cmp = fcmp olt double %1, %2
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @link_error()
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  ret void
}

declare double @fabs(double) nounwind readnone

define void @link_error() nounwind uwtable {
entry:
  call void @abort() noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  call void @foo(double 1.000000e+00)
  ret i32 0
}

declare void @abort() noreturn nounwind
