; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20000731-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define double @foo() nounwind uwtable {
entry:
  ret double 0.000000e+00
}

define void @do_sibcall() nounwind uwtable {
entry:
  %call = call double @foo()
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %x = alloca double, align 8
  store i32 0, i32* %retval
  store double 0.000000e+00, double* %x, align 8
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load double* %x, align 8
  %cmp = fcmp olt double %0, 2.000000e+01
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  call void @do_sibcall()
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %1 = load double* %x, align 8
  %inc = fadd double %1, 1.000000e+00
  store double %inc, double* %x, align 8
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %2 = load double* %x, align 8
  %cmp1 = fcmp oge double %2, 1.000000e+01
  br i1 %cmp1, label %if.end, label %if.then

if.then:                                          ; preds = %for.end
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %for.end
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %3 = load i32* %retval
  ret i32 %3
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
