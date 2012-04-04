; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/func-ptr-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@fp = internal global double (float)* null, align 8

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  store double (float)* @f, double (float)** @fp, align 8
  %0 = load double (float)** @fp, align 8
  %call = call double %0(float 1.000000e+00)
  %cmp = fcmp une double %call, 1.000000e+00
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %1 = load i32* %retval
  ret i32 %1
}

define internal double @f(float %a) nounwind uwtable {
entry:
  %a.addr = alloca float, align 4
  store float %a, float* %a.addr, align 4
  %0 = load float* %a.addr, align 4
  %conv = fpext float %0 to double
  ret double %conv
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
