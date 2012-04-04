; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20011217-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %x = alloca double, align 8
  %y = alloca double, align 8
  store i32 0, i32* %retval
  store double 1.000000e+00, double* %x, align 8
  store double 2.000000e+00, double* %y, align 8
  %0 = load double* %y, align 8
  %1 = load double* %x, align 8
  %dec = fadd double %1, -1.000000e+00
  store double %dec, double* %x, align 8
  %cmp = fcmp ogt double %0, %1
  %conv = zext i1 %cmp to i32
  %cmp1 = icmp ne i32 %conv, 1
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %2 = load i32* %retval
  ret i32 %2
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
